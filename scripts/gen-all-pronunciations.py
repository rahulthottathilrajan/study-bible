"""
Generate all Greek and Hebrew pronunciation MP3s using Edge TTS.
Output: audio-pronunciations/greek/*.mp3, audio-pronunciations/hebrew/*.mp3

Voices:
  Greek:  el-GR-NestorasNeural (Male)
  Hebrew: he-IL-AvriNeural (Male)
"""

import asyncio, edge_tts, os, json, re, sys

BASE = os.path.join(os.path.dirname(__file__), '..')
GREEK_DIR = os.path.join(BASE, 'audio-pronunciations', 'greek')
HEBREW_DIR = os.path.join(BASE, 'audio-pronunciations', 'hebrew')
os.makedirs(GREEK_DIR, exist_ok=True)
os.makedirs(HEBREW_DIR, exist_ok=True)

GREEK_VOICE = 'el-GR-NestorasNeural'
HEBREW_VOICE = 'he-IL-AvriNeural'

def slugify(text):
    """Create a safe filename from text."""
    s = text.strip().lower()
    s = re.sub(r'[^\w\s-]', '', s, flags=re.UNICODE)
    s = re.sub(r'[\s]+', '-', s)
    return s[:40] or 'unknown'

async def generate(voice, text, filepath):
    """Generate a single MP3."""
    try:
        comm = edge_tts.Communicate(text, voice, rate='-15%')
        await comm.save(filepath)
        return True
    except Exception as e:
        print(f'    FAIL: {os.path.basename(filepath)} — {e}', file=sys.stderr)
        return False

async def main():
    total = 0
    ok = 0
    fail = 0

    # ═══ GREEK ═══
    print("═══ GREEK PRONUNCIATIONS ═══")

    # 1. Greek alphabet (24 letters)
    print("\n1. Greek Alphabet (24 letters)")
    greek_letters = [
        ("alpha", "Άλφα"), ("beta", "Βήτα"), ("gamma", "Γάμμα"), ("delta", "Δέλτα"),
        ("epsilon", "Έψιλον"), ("zeta", "Ζήτα"), ("eta", "Ήτα"), ("theta", "Θήτα"),
        ("iota", "Γιώτα"), ("kappa", "Κάππα"), ("lambda", "Λάμβδα"), ("mu", "Μι"),
        ("nu", "Νι"), ("xi", "Ξι"), ("omicron", "Όμικρον"), ("pi", "Πι"),
        ("rho", "Ρο"), ("sigma", "Σίγμα"), ("tau", "Ταυ"), ("upsilon", "Ύψιλον"),
        ("phi", "Φι"), ("chi", "Χι"), ("psi", "Ψι"), ("omega", "Ωμέγα"),
    ]
    for name, text in greek_letters:
        total += 1
        path = os.path.join(GREEK_DIR, f'letter-{name}.mp3')
        if os.path.exists(path):
            print(f'  SKIP letter-{name}.mp3 (exists)')
            ok += 1
            continue
        if await generate(GREEK_VOICE, text, path):
            print(f'  OK   letter-{name}.mp3')
            ok += 1
        else:
            fail += 1

    # 2. Greek WOTD pool (120 words) — from GreekData.js
    print("\n2. Greek WOTD (120 words)")
    gwotd_path = os.path.join(BASE, 'src', 'app', 'components', 'GreekData.js')
    with open(gwotd_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Extract greek words from GWOTD_POOL
    greek_words = re.findall(r'greek:"([^"]+)"', content)
    # Also get strongs for filenames
    greek_strongs = re.findall(r'strongs:"([^"]+)"', content)

    # Deduplicate
    seen_greek = set()
    gwotd_pairs = []
    for i, word in enumerate(greek_words):
        if word not in seen_greek:
            seen_greek.add(word)
            strong = greek_strongs[i] if i < len(greek_strongs) else f'word-{i}'
            gwotd_pairs.append((strong.lower(), word))

    for strong, word in gwotd_pairs:
        total += 1
        path = os.path.join(GREEK_DIR, f'word-{strong}.mp3')
        if os.path.exists(path):
            ok += 1
            continue
        if await generate(GREEK_VOICE, word, path):
            print(f'  OK   word-{strong}.mp3 — {word}')
            ok += 1
        else:
            fail += 1

    # 3. Greek vocabulary from static JSON lessons
    print("\n3. Greek Lesson Vocabulary")
    greek_json_path = os.path.join(BASE, 'public', 'data', 'greek-lessons.json')
    with open(greek_json_path, 'r', encoding='utf-8') as f:
        greek_json = json.load(f)

    for cat_name, lessons in greek_json['categories'].items():
        for lesson in lessons:
            # Vocab words embedded in lesson
            for v in lesson.get('_vocabulary', []):
                gw = v.get('greek_word', '')
                sn = v.get('strongs_number', '')
                if gw and sn:
                    total += 1
                    fn = f'vocab-{sn.lower()}.mp3'
                    path = os.path.join(GREEK_DIR, fn)
                    if os.path.exists(path):
                        ok += 1
                        continue
                    if await generate(GREEK_VOICE, gw, path):
                        print(f'  OK   {fn} — {gw}')
                        ok += 1
                    else:
                        fail += 1
            # Also generate the lesson's main word if it's a vocab lesson
            cnt = lesson.get('content', {})
            if cnt and isinstance(cnt, dict):
                main_word = cnt.get('word', '')
                main_strongs = cnt.get('strongs', '')
                if main_word and main_strongs:
                    total += 1
                    fn = f'lesson-{main_strongs.lower()}.mp3'
                    path = os.path.join(GREEK_DIR, fn)
                    if os.path.exists(path):
                        ok += 1
                        continue
                    if await generate(GREEK_VOICE, main_word, path):
                        print(f'  OK   {fn} — {main_word}')
                        ok += 1
                    else:
                        fail += 1

    print(f'\n  Greek total: {ok}/{total} generated\n')

    # ═══ HEBREW ═══
    print("═══ HEBREW PRONUNCIATIONS ═══")

    # 1. Hebrew alphabet (22 letters)
    print("\n1. Hebrew Alphabet (22 letters)")
    hebrew_letters = [
        ("aleph", "אלף"), ("bet", "בית"), ("gimel", "גימל"), ("dalet", "דלת"),
        ("he", "הא"), ("vav", "ואו"), ("zayin", "זין"), ("chet", "חית"),
        ("tet", "טית"), ("yod", "יוד"), ("kaf", "כף"), ("lamed", "למד"),
        ("mem", "מם"), ("nun", "נון"), ("samekh", "סמך"), ("ayin", "עין"),
        ("pe", "פא"), ("tsade", "צדי"), ("qof", "קוף"), ("resh", "ריש"),
        ("shin", "שין"), ("tav", "תו"),
    ]
    for name, text in hebrew_letters:
        total += 1
        path = os.path.join(HEBREW_DIR, f'letter-{name}.mp3')
        if os.path.exists(path):
            print(f'  SKIP letter-{name}.mp3 (exists)')
            ok += 1
            continue
        if await generate(HEBREW_VOICE, text, path):
            print(f'  OK   letter-{name}.mp3')
            ok += 1
        else:
            fail += 1

    # 2. Hebrew WOTD pool (120 words) — from HebrewData.js
    print("\n2. Hebrew WOTD (120 words)")
    hwotd_path = os.path.join(BASE, 'src', 'app', 'components', 'HebrewData.js')
    with open(hwotd_path, 'r', encoding='utf-8') as f:
        hcontent = f.read()

    hebrew_words = re.findall(r'hebrew:"([^"]+)"', hcontent)
    hebrew_strongs = re.findall(r'strongs:"([^"]+)"', hcontent)

    seen_hebrew = set()
    hwotd_pairs = []
    for i, word in enumerate(hebrew_words):
        # Strip nikud for TTS (Hebrew TTS handles unpointed text better)
        clean = re.sub(r'[\u0591-\u05C7]', '', word)
        if clean not in seen_hebrew:
            seen_hebrew.add(clean)
            strong = hebrew_strongs[i] if i < len(hebrew_strongs) else f'word-{i}'
            hwotd_pairs.append((strong.lower().replace('—', 'none'), clean, word))

    for strong, clean, original in hwotd_pairs:
        total += 1
        fn = f'word-{strong}.mp3'
        path = os.path.join(HEBREW_DIR, fn)
        if os.path.exists(path):
            ok += 1
            continue
        if await generate(HEBREW_VOICE, clean, path):
            print(f'  OK   {fn} — {original}')
            ok += 1
        else:
            fail += 1

    # 3. Hebrew vocabulary from static JSON lessons
    print("\n3. Hebrew Lesson Vocabulary")
    hebrew_json_path = os.path.join(BASE, 'public', 'data', 'hebrew-lessons.json')
    with open(hebrew_json_path, 'r', encoding='utf-8') as f:
        hebrew_json = json.load(f)

    for cat_name, lessons in hebrew_json['categories'].items():
        for lesson in lessons:
            for v in lesson.get('_vocabulary', []):
                hw = v.get('hebrew_word', '')
                sn = v.get('strongs_number', '')
                if hw and sn:
                    total += 1
                    fn = f'vocab-{sn.lower()}.mp3'
                    path = os.path.join(HEBREW_DIR, fn)
                    if os.path.exists(path):
                        ok += 1
                        continue
                    clean = re.sub(r'[\u0591-\u05C7]', '', hw)
                    if await generate(HEBREW_VOICE, clean, path):
                        print(f'  OK   {fn} — {hw}')
                        ok += 1
                    else:
                        fail += 1
            # Main lesson word
            cnt = lesson.get('content', {})
            if cnt and isinstance(cnt, dict):
                main_word = cnt.get('word', '')
                main_strongs = cnt.get('strongs', '')
                if main_word and main_strongs:
                    total += 1
                    fn = f'lesson-{main_strongs.lower()}.mp3'
                    path = os.path.join(HEBREW_DIR, fn)
                    if os.path.exists(path):
                        ok += 1
                        continue
                    clean = re.sub(r'[\u0591-\u05C7]', '', main_word)
                    if await generate(HEBREW_VOICE, clean, path):
                        print(f'  OK   {fn} — {main_word}')
                        ok += 1
                    else:
                        fail += 1

    print(f'\n═══ FINAL SUMMARY ═══')
    print(f'Total: {total} files')
    print(f'OK:    {ok}')
    print(f'Failed: {fail}')
    print(f'Greek dir:  {GREEK_DIR}')
    print(f'Hebrew dir: {HEBREW_DIR}')

asyncio.run(main())
