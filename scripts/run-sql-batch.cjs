#!/usr/bin/env node
/**
 * run-sql-batch.cjs — Run a batch of SQL files against Postgres in one connection.
 *
 * Usage:
 *   node scripts/run-sql-batch.cjs "sql/nt-chapters/*.sql"
 *   node scripts/run-sql-batch.cjs "sql/quiz/*.sql"
 *
 * Each file is wrapped in BEGIN/COMMIT (ROLLBACK on error) and its own try/catch
 * so one bad file doesn't abort the batch. Unique-constraint violations (23505)
 * are treated as "already applied" — they don't count as failures because the
 * seed SQL is additive and non-idempotent.
 *
 * Exits 0 if every file applied or was already applied; exits 1 if any file
 * failed for any other reason; exits 2 on setup errors (missing glob, no DB URL).
 */
const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

function loadEnvLocal() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) return;
  for (const line of fs.readFileSync(envPath, 'utf8').split(/\r?\n/)) {
    const m = line.match(/^([A-Z0-9_]+)\s*=\s*(.+)$/);
    if (m) process.env[m[1]] = m[2].trim().replace(/^["']|["']$/g, '');
  }
}

function expandGlob(glob) {
  const abs = path.resolve(glob);
  const dir = path.dirname(abs);
  const base = path.basename(abs);
  if (!fs.existsSync(dir)) return [];
  const regex = new RegExp(
    '^' + base.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/\*/g, '.*') + '$'
  );
  return fs.readdirSync(dir)
    .filter(f => regex.test(f))
    .map(f => path.join(dir, f))
    .filter(f => fs.statSync(f).isFile())
    .sort();
}

async function main() {
  const globArg = process.argv[2];
  if (!globArg) {
    console.error('Usage: node scripts/run-sql-batch.cjs "<glob>"');
    process.exit(2);
  }
  loadEnvLocal();
  if (!process.env.DATABASE_URL) {
    console.error('DATABASE_URL not set. Add it to .env.local.');
    process.exit(2);
  }

  const files = expandGlob(globArg);
  if (files.length === 0) {
    console.error(`No files match: ${globArg}`);
    process.exit(2);
  }

  const client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
    connectionTimeoutMillis: 15000,
    statement_timeout: 120000,
  });
  await client.connect();
  console.log(`Connected. Processing ${files.length} files matching: ${globArg}\n`);

  let applied = 0;
  let alreadyApplied = 0;
  const failures = [];

  for (const file of files) {
    const name = path.basename(file);
    const sql = fs.readFileSync(file, 'utf8');
    try {
      await client.query('BEGIN');
      await client.query(sql);
      await client.query('COMMIT');
      applied++;
      console.log(`  applied   ${name}`);
    } catch (err) {
      await client.query('ROLLBACK').catch(() => {});
      if (err.code === '23505') {
        alreadyApplied++;
        console.log(`  skipped   ${name}  (already applied)`);
      } else {
        failures.push({ name, code: err.code, message: err.message });
        console.error(`  FAILED    ${name}: [${err.code || '?'}] ${err.message}`);
      }
    }
  }

  await client.end();

  console.log(`\n=== Summary ===`);
  console.log(`  Applied        : ${applied}`);
  console.log(`  Already applied: ${alreadyApplied}`);
  console.log(`  Failed         : ${failures.length}`);
  if (failures.length) {
    console.log(`\nFailures:`);
    failures.forEach(f => console.log(`  - ${f.name}: [${f.code || '?'}] ${f.message}`));
    process.exit(1);
  }
}

main().catch(err => {
  console.error('Fatal:', err);
  process.exit(2);
});
