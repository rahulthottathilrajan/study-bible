#!/usr/bin/env node
/**
 * seed-supabase.cjs
 * Runs all SQL chapter seed files against Supabase in alphabetical order.
 * Keeps a log (.seed-log.json) so already-seeded files are never re-run.
 *
 * SETUP:
 *   1. Go to Supabase Dashboard → Settings → Database → Connection string → URI
 *   2. Copy the URI (starts with "postgresql://postgres:...")
 *   3. Add this line to .env.local:
 *        DATABASE_URL=postgresql://postgres:[YOUR-PASSWORD]@db.[project-ref].supabase.co:5432/postgres
 *   4. Run:  node scripts/seed-supabase.cjs
 *
 * OPTIONS:
 *   --dry-run    List files that would be seeded without executing them
 *   --force      Re-run files even if already in the log (use carefully!)
 *   --filter     Only run files matching a pattern, e.g. --filter luke
 */

const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

const LOG_FILE = path.join(__dirname, '.seed-log.json');
const SQL_DIR  = path.join(__dirname, '..', 'sql', 'nt-chapters');

// ── Parse CLI flags ────────────────────────────────────────────────────────
const args   = process.argv.slice(2);
const DRY    = args.includes('--dry-run');
const FORCE  = args.includes('--force');
const filter = (() => {
  const i = args.indexOf('--filter');
  return i !== -1 ? args[i + 1] : null;
})();

// ── Load .env.local manually (no dotenv dep needed) ───────────────────────
function loadEnvLocal() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) return;
  const lines = fs.readFileSync(envPath, 'utf8').split('\n');
  for (const line of lines) {
    const m = line.match(/^([A-Z0-9_]+)\s*=\s*(.+)$/);
    if (m) process.env[m[1]] = m[2].trim().replace(/^["']|["']$/g, '');
  }
}

// ── Log helpers ────────────────────────────────────────────────────────────
function loadLog() {
  if (fs.existsSync(LOG_FILE)) {
    return JSON.parse(fs.readFileSync(LOG_FILE, 'utf8'));
  }
  return { seeded: [] };
}
function saveLog(log) {
  fs.writeFileSync(LOG_FILE, JSON.stringify(log, null, 2));
}

// ── Main ───────────────────────────────────────────────────────────────────
async function main() {
  loadEnvLocal();

  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    console.error('\n❌  DATABASE_URL not set.');
    console.error('   1. Go to: Supabase Dashboard → Settings → Database → URI');
    console.error('   2. Add to .env.local:');
    console.error('        DATABASE_URL=postgresql://postgres:[password]@db.[ref].supabase.co:5432/postgres\n');
    process.exit(1);
  }

  // Collect SQL files
  const allFiles = fs.readdirSync(SQL_DIR)
    .filter(f => f.endsWith('.sql'))
    .sort();

  const files = filter
    ? allFiles.filter(f => f.includes(filter))
    : allFiles;

  if (files.length === 0) {
    console.log(filter ? `No files matching "--filter ${filter}"` : 'No SQL files found.');
    return;
  }

  const log = loadLog();
  const pending = FORCE
    ? files
    : files.filter(f => !log.seeded.includes(f));
  const alreadyDone = files.length - pending.length;

  console.log('\n=== Supabase Chapter Seeder ===');
  console.log(`  Total files : ${files.length}`);
  console.log(`  Already done: ${alreadyDone} (skipped)`);
  console.log(`  To seed     : ${pending.length}`);
  if (filter) console.log(`  Filter      : "${filter}"`);
  if (DRY)    console.log('  Mode        : DRY RUN (no changes)\n');
  else        console.log('');

  if (pending.length === 0) {
    console.log('✅  Nothing to do — all files already seeded.');
    return;
  }

  if (DRY) {
    pending.forEach(f => console.log(`  would seed: ${f}`));
    return;
  }

  // Connect to Supabase PostgreSQL
  const client = new Client({
    connectionString,
    ssl: { rejectUnauthorized: false },
    connectionTimeoutMillis: 15000,
    statement_timeout: 60000,
  });

  await client.connect();
  console.log('  Connected to Supabase ✓\n');

  let seededCount = 0;
  let errorCount  = 0;

  for (const file of pending) {
    const filePath = path.join(SQL_DIR, file);
    const sql = fs.readFileSync(filePath, 'utf8');

    process.stdout.write(`  Seeding ${file} ... `);
    try {
      await client.query('BEGIN');
      await client.query(sql);
      await client.query('COMMIT');

      if (!log.seeded.includes(file)) log.seeded.push(file);
      saveLog(log);

      console.log('✓');
      seededCount++;
    } catch (err) {
      await client.query('ROLLBACK');
      // Duplicate key = already seeded; treat as success so it gets logged
      if (err.message.includes('duplicate key value violates unique constraint')) {
        if (!log.seeded.includes(file)) log.seeded.push(file);
        saveLog(log);
        console.log('✓ (already existed)');
        seededCount++;
      } else {
        console.log(`✗\n    ERROR: ${err.message}`);
        errorCount++;
      }
    }
  }

  await client.end();

  console.log('\n─────────────────────────────────');
  console.log(`  ✅  Seeded  : ${seededCount}`);
  if (errorCount > 0) console.log(`  ❌  Errors  : ${errorCount}`);
  console.log('  Done.\n');
}

main().catch(err => {
  console.error('\nFatal error:', err.message);
  process.exit(1);
});
