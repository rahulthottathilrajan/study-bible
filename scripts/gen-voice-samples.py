import asyncio, edge_tts, os, sys

SAMPLES_DIR = os.path.join(os.path.dirname(__file__), '..', 'audio-samples')
os.makedirs(SAMPLES_DIR, exist_ok=True)

samples = [
    # Greek — Female (Athina) — confirmed working
    ('el-GR-AthinaNeural', 'greek-female-agape.mp3', 'ἀγάπη'),
    ('el-GR-AthinaNeural', 'greek-female-theos.mp3', 'θεός'),
    ('el-GR-AthinaNeural', 'greek-female-logos.mp3', 'λόγος'),
    ('el-GR-AthinaNeural', 'greek-female-christos.mp3', 'Χριστός'),
    ('el-GR-AthinaNeural', 'greek-female-pistis.mp3', 'πίστις'),
    # Greek — Male (Nestos)
    ('el-GR-NestosNeural', 'greek-male-agape.mp3', 'ἀγάπη'),
    ('el-GR-NestosNeural', 'greek-male-theos.mp3', 'θεός'),
    ('el-GR-NestosNeural', 'greek-male-logos.mp3', 'λόγος'),
    ('el-GR-NestosNeural', 'greek-male-christos.mp3', 'Χριστός'),
    ('el-GR-NestosNeural', 'greek-male-pistis.mp3', 'πίστις'),
    # Hebrew — Female (Hila)
    ('he-IL-HilaNeural', 'hebrew-female-shalom.mp3', 'שלום'),
    ('he-IL-HilaNeural', 'hebrew-female-elohim.mp3', 'אלוהים'),
    ('he-IL-HilaNeural', 'hebrew-female-chesed.mp3', 'חסד'),
    ('he-IL-HilaNeural', 'hebrew-female-torah.mp3', 'תורה'),
    ('he-IL-HilaNeural', 'hebrew-female-kadosh.mp3', 'קדוש'),
    # Hebrew — Male (Avri)
    ('he-IL-AvriNeural', 'hebrew-male-shalom.mp3', 'שלום'),
    ('he-IL-AvriNeural', 'hebrew-male-elohim.mp3', 'אלוהים'),
    ('he-IL-AvriNeural', 'hebrew-male-chesed.mp3', 'חסד'),
    ('he-IL-AvriNeural', 'hebrew-male-torah.mp3', 'תורה'),
    ('he-IL-AvriNeural', 'hebrew-male-kadosh.mp3', 'קדוש'),
]

async def gen():
    success = 0
    fail = 0
    for voice, filename, text in samples:
        path = os.path.join(SAMPLES_DIR, filename)
        try:
            comm = edge_tts.Communicate(text, voice, rate='-20%')
            await comm.save(path)
            size = os.path.getsize(path)
            print(f'  OK  {filename} ({size:,} bytes)')
            success += 1
        except Exception as e:
            print(f'  FAIL {filename} — {e}')
            fail += 1
    print(f'\nDone: {success} OK, {fail} failed')

asyncio.run(gen())
