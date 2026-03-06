-- ═══════════════════════════════════════════════════
-- 2 THESSALONIANS CHAPTER 3 — Faithfulness, Work & Church Discipline
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'The final chapter turns from eschatology to practical Christian living. Paul requests prayer that the Gospel would ''run'' freely and that he be delivered from wicked men. He then affirms God''s faithfulness to establish and guard believers from evil. The heart of the chapter addresses a pressing problem: some Thessalonians, perhaps convinced that the Day of the Lord was imminent, had stopped working and become idle busybodies. Paul appeals to his own example of manual labour during his time in Thessalonica, issues the memorable command ''if any would not work, neither should he eat,'' and prescribes a measured discipline: note the disorderly, withhold fellowship, but admonish as brothers rather than treating them as enemies. The letter closes with a benediction of peace and Paul''s handwritten signature as authentication against forgeries.',
  'The Faithfulness of God, the Dignity of Work, and Loving Discipline',
  'ἀτάκτως (ataktōs)',
  'Disorderly — a military term meaning out of rank, breaking formation. Applied to believers who abandon their duties and live undisciplined lives.',
  '["Prayer Request (vv.1-2): That the word of the Lord may run freely; deliverance from unreasonable men","God''s Faithfulness (vv.3-5): The Lord is faithful to establish and keep from evil; hearts directed into God''s love and Christ''s patience","Command Against Idleness (vv.6-9): Withdraw from the disorderly; Paul''s example — he worked night and day, not eating anyone''s bread for free","The Work Ethic (vv.10-12): If any would not work, neither should he eat; busybodies commanded to work quietly","Perseverance and Discipline (vv.13-15): Do not grow weary in well doing; note the disobedient, admonish as a brother","Benediction and Signature (vv.16-18): The Lord of peace give you peace; Paul''s handwritten salutation as authentication"]'
FROM books b WHERE b.name = '2 Thessalonians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Finally, brethren, pray for us, that the word of the Lord may have free course, and be glorified, even as it is with you:',
   'Τὸ λοιπόν προσεύχεσθε ἀδελφοί περὶ ἡμῶν ἵνα ὁ λόγος τοῦ κυρίου τρέχῃ καὶ δοξάζηται καθὼς καὶ πρὸς ὑμᾶς',
   'To loipon proseuchesthe adelphoi peri hēmōn hina ho logos tou kyriou trechē kai doxazētai kathōs kai pros hymas',
   '''Have free course'' (trechē — may run, present subjunctive of trechō) pictures the Gospel as a runner racing swiftly through the world. The image may come from Psalm 147:15: ''his word runneth very swiftly.'' Paul asks not for personal comfort but for the Gospel''s advance — that it would both ''run'' (spread rapidly) and ''be glorified'' (doxazētai — be honoured through transformed lives), as it already has among the Thessalonians.',
   NULL),
  (2,
   'And that we may be delivered from unreasonable and wicked men: for all men have not faith.',
   'καὶ ἵνα ῥυσθῶμεν ἀπὸ τῶν ἀτόπων καὶ πονηρῶν ἀνθρώπων οὐ γὰρ πάντων ἡ πίστις',
   'kai hina rhysthōmen apo tōn atopōn kai ponērōn anthrōpōn ou gar pantōn hē pistis',
   '''Unreasonable'' (atopōn — out of place, absurd, perverse) and ''wicked'' (ponērōn — actively evil, malicious) describe Paul''s opponents — likely Jews in Corinth who were hindering his ministry (cf. Acts 18:5-6, 12-13). ''All men have not faith'' — a sober observation that the Gospel will always face opposition because faith is not universal. This is not fatalism but realism about human fallenness.',
   NULL),
  (3,
   'But the Lord is faithful, who shall stablish you, and keep you from evil.',
   'πιστὸς δέ ἐστιν ὁ κύριος ὃς στηρίξει ὑμᾶς καὶ φυλάξει ἀπὸ τοῦ πονηροῦ',
   'pistos de estin ho kyrios hos stērixei hymas kai phylaxei apo tou ponērou',
   'A wordplay: ''not all have faith (pistis, v.2), but the Lord is faithful (pistos).'' Human faithlessness is contrasted with divine faithfulness. ''Stablish'' (stērixei — make firm, strengthen, fix solidly) and ''keep'' (phylaxei — guard, protect, watch over) are future indicatives — certainties, not wishes. ''From evil'' (apo tou ponērou) can mean ''from the evil one'' (Satan) or ''from evil'' in general; both are true.',
   'God''s faithfulness is the believer''s security. Though not all believe, the Lord will strengthen and guard those who are His. This promise does not depend on human performance but on God''s character.'),
  (4,
   'And we have confidence in the Lord touching you, that ye both do and will do the things which we command you.',
   'πεποίθαμεν δὲ ἐν κυρίῳ ἐφ᾽ ὑμᾶς ὅτι ἃ παραγγέλλομεν ὑμῖν καὶ ποιεῖτε καὶ ποιήσετε',
   'pepoithamen de en kyriō eph'' hymas hoti ha parangellomen hymin kai poieite kai poiēsete',
   '''Confidence in the Lord'' (pepoithamen en kyriō — perfect tense: a settled confidence) — Paul''s trust is not in their natural goodness but in the Lord''s work within them. ''Do and will do'' (poieite kai poiēsete — present and future) expresses both current obedience and expected continuation. ''Command'' (parangellomen) is a military term for giving orders, appropriate given the ''disorderly'' (ataktōs) language that follows.',
   NULL),
  (5,
   'And the Lord direct your hearts into the love of God, and into the patient waiting for Christ.',
   'ὁ δὲ κύριος κατευθύναι ὑμῶν τὰς καρδίας εἰς τὴν ἀγάπην τοῦ θεοῦ καὶ εἰς τὴν ὑπομονὴν τοῦ Χριστοῦ',
   'ho de kyrios kateuthynai hymōn tas kardias eis tēn agapēn tou theou kai eis tēn hypomonēn tou Christou',
   '''Direct'' (kateuthynai — make straight, guide directly) is an optative prayer wish. Paul prays the Lord would steer their hearts toward two goals: ''the love of God'' (tēn agapēn tou theou — either God''s love for them or their love for God; likely both) and ''the patient waiting for Christ'' (tēn hypomonēn tou Christou — either steadfastness like Christ''s or patient endurance while awaiting Christ). Both meanings enrich the text.',
   NULL),
  (6,
   'Now we command you, brethren, in the name of our Lord Jesus Christ, that ye withdraw yourselves from every brother that walketh disorderly, and not after the tradition which he received of us.',
   'Παραγγέλλομεν δὲ ὑμῖν ἀδελφοί ἐν ὀνόματι τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ στέλλεσθαι ὑμᾶς ἀπὸ παντὸς ἀδελφοῦ ἀτάκτως περιπατοῦντος καὶ μὴ κατὰ τὴν παράδοσιν ἣν παρέλαβον παρ᾽ ἡμῶν',
   'Parangellomen de hymin adelphoi en onomati tou kyriou hēmōn Iēsou Christou stellesthai hymas apo pantos adelphou ataktōs peripatountos kai mē kata tēn paradosin hēn parelabon par'' hēmōn',
   '''Command'' (parangellomen — a military order) ''in the name of our Lord Jesus Christ'' gives this the weight of divine authority. ''Withdraw'' (stellesthai — draw back, keep away from, avoid) indicates social distance, not excommunication. ''Disorderly'' (ataktōs — out of rank, like a soldier who breaks formation) was a military term the Thessalonians would have understood. The issue is not just laziness but violation of apostolic tradition (paradosin — handed-down instruction).',
   'Church discipline is not optional but commanded. It must be exercised in Christ''s name (with His authority), directed at specific behaviour (ataktōs), and measured (withdrawal, not expulsion). The goal is restoration, not punishment.'),
  (7,
   'For yourselves know how ye ought to follow us: for we behaved not ourselves disorderly among you;',
   'αὐτοὶ γὰρ οἴδατε πῶς δεῖ μιμεῖσθαι ἡμᾶς ὅτι οὐκ ἠτακτήσαμεν ἐν ὑμῖν',
   'autoi gar oidate pōs dei mimeisthai hēmas hoti ouk ētaktēsamen en hymin',
   '''Follow'' (mimeisthai — imitate, mimic, model oneself after) — Paul offers himself as a pattern. ''We behaved not ourselves disorderly'' (ouk ētaktēsamen — we did not break rank) — Paul practised what he preached. He had the right to financial support (cf. 1 Cor 9:14) but voluntarily set it aside to provide an example of industrious living.',
   NULL),
  (8,
   'Neither did we eat any man''s bread for nought; but wrought with labour and travail night and day, that we might not be chargeable to any of you:',
   'οὐδὲ δωρεὰν ἄρτον ἐφάγομεν παρά τινος ἀλλ᾽ ἐν κόπῳ καὶ μόχθῳ νύκτα καὶ ἡμέραν ἐργαζόμενοι πρὸς τὸ μὴ ἐπιβαρῆσαί τινα ὑμῶν',
   'oude dōrean arton ephagomen para tinos all'' en kopō kai mochtō nykta kai hēmeran ergazomenoi pros to mē epibarēsai tina hymōn',
   '''For nought'' (dōrean — freely, as a gift, without cost) — Paul paid his own way. ''Labour and travail'' (kopō kai mochtō — toil and hardship) describes exhausting physical work. ''Night and day'' (nykta kai hēmeran) — Paul made tents by day and preached in the evenings, or vice versa (cf. Acts 18:3). ''Chargeable'' (epibarēsai — to weigh down, burden financially) — his goal was to remove any excuse from idle believers.',
   NULL),
  (9,
   'Not because we have not power, but to make ourselves an ensample unto you to follow us.',
   'οὐχ ὅτι οὐκ ἔχομεν ἐξουσίαν ἀλλ᾽ ἵνα ἑαυτοὺς τύπον δῶμεν ὑμῖν εἰς τὸ μιμεῖσθαι ἡμᾶς',
   'ouch hoti ouk echomen exousian all'' hina heautous typon dōmen hymin eis to mimeisthai hēmas',
   'Paul clarifies: he had the right (exousian — authority, legitimate power) to receive financial support (cf. 1 Cor 9:4-14) but deliberately waived it. ''Ensample'' (typon — pattern, model, type, stamp) — Paul shaped his own behaviour to create a mould that others could follow. His voluntary self-denial was pedagogical, not merely practical.',
   NULL),
  (10,
   'For even when we were with you, this we commanded you, that if any would not work, neither should he eat.',
   'καὶ γὰρ ὅτε ἦμεν πρὸς ὑμᾶς τοῦτο παρηγγέλλομεν ὑμῖν ὅτι εἴ τις οὐ θέλει ἐργάζεσθαι μηδὲ ἐσθιέτω',
   'kai gar hote ēmen pros hymas touto parēngellomen hymin hoti ei tis ou thelei ergazesthai mēde esthietō',
   'The famous maxim: ''if any would not work, neither should he eat'' (ei tis ou thelei ergazesthai mēde esthietō). Note ''would not'' (ou thelei — does not will/wish to, refuses to) — this targets willful idleness, not inability. Those who cannot work due to illness, age, or disability are not in view. Paul had already commanded this orally (parēngellomen — imperfect: repeatedly ordered) during his visit — this was not new instruction but repeated enforcement.',
   'The dignity of work is a biblical principle. Willful idleness is not piety but disobedience. Expecting the Lord''s return does not exempt believers from earthly responsibilities — rather, it should intensify faithful stewardship.'),
  (11,
   'For we hear that there are some which walk among you disorderly, working not at all, but are busybodies.',
   'ἀκούομεν γάρ τινας περιπατοῦντας ἐν ὑμῖν ἀτάκτως μηδὲν ἐργαζομένους ἀλλὰ περιεργαζομένους',
   'akouomen gar tinas peripatountas en hymin ataktōs mēden ergazomenous alla periergazomenous',
   'A devastating wordplay: ''working not at all, but busybodies'' (mēden ergazomenous alla periergazomenous) — they do no work (ergazomenous) but are overworking in meddling (periergazomenous — working around, being busybodies). The prefix peri- (around) transforms legitimate work into illegitimate interference. Idle hands become meddlesome hands — those who refuse productive work fill their time with gossip and interference in others'' affairs.',
   NULL),
  (12,
   'Now them that are such we command and exhort by our Lord Jesus Christ, that with quietness they work, and eat their own bread.',
   'τοῖς δὲ τοιούτοις παραγγέλλομεν καὶ παρακαλοῦμεν διὰ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἵνα μετὰ ἡσυχίας ἐργαζόμενοι τὸν ἑαυτῶν ἄρτον ἐσθίωσιν',
   'tois de toioutois parangellomen kai parakaloumen dia tou kyriou hēmōn Iēsou Christou hina meta hēsychias ergazomenoi ton heautōn arton esthiōsin',
   'Paul combines command (parangellomen — order with authority) and exhortation (parakaloumen — appeal with warmth). ''With quietness'' (meta hēsychias — in a settled, tranquil manner) contrasts with the busybody lifestyle. ''Their own bread'' (ton heautōn arton — bread belonging to themselves) — self-sufficiency through honest work is the antidote to parasitic idleness.',
   NULL),
  (13,
   'But ye, brethren, be not weary in well doing.',
   'ὑμεῖς δέ ἀδελφοί μὴ ἐκκακήσητε καλοποιοῦντες',
   'hymeis de adelphoi mē ekkakēsēte kalopoiountes',
   '''Be not weary'' (mē ekkakēsēte — do not lose heart, do not grow tired of doing right) — addressed to the faithful majority. The behaviour of the idle minority must not discourage the diligent. ''Well doing'' (kalopoiountes — doing what is noble/beautiful) includes both generosity to the genuinely needy and faithful daily work. Paul guards against two errors: enabling laziness and losing heart in generosity.',
   NULL),
  (14,
   'And if any man obey not our word by this epistle, note that man, and have no company with him, that he may be ashamed.',
   'εἰ δέ τις οὐχ ὑπακούει τῷ λόγῳ ἡμῶν διὰ τῆς ἐπιστολῆς τοῦτον σημειοῦσθε καὶ μὴ συναναμίγνυσθε αὐτῷ ἵνα ἐντραπῇ',
   'ei de tis ouch hypakouei tō logō hēmōn dia tēs epistolēs touton sēmeiousthe kai mē synanamignysthe autō hina entrapē',
   '''Note'' (sēmeiousthe — mark, take special notice of, identify publicly) and ''have no company'' (mē synanamignysthe — do not mix together with, withdraw social fellowship) describe a measured discipline. The purpose is redemptive: ''that he may be ashamed'' (hina entrapē — that he may be turned inward, brought to reflection and repentance). The shame is medicinal, designed to produce change.',
   NULL),
  (15,
   'Yet count him not as an enemy, but admonish him as a brother.',
   'καὶ μὴ ὡς ἐχθρὸν ἡγεῖσθε ἀλλὰ νουθετεῖτε ὡς ἀδελφόν',
   'kai mē hōs echthron hēgeisthe alla noutheteite hōs adelphon',
   'The crucial qualifier: discipline must be tempered with brotherly love. ''Not as an enemy'' (mē hōs echthron) — the offender is still a brother, not an outsider. ''Admonish'' (noutheteite — put in mind, warn, counsel with correction) combines firmness with affection. This prevents discipline from becoming vindictive. The balance is: enough distance to create discomfort, but enough love to maintain the bond of brotherhood.',
   'Church discipline must always aim at restoration. The line between corrective discipline and punitive exclusion is drawn here: treat the erring as a brother who needs correction, not an enemy who deserves rejection. Cf. Galatians 6:1.'),
  (16,
   'Now the Lord of peace himself give you peace always by all means. The Lord be with you all.',
   'Αὐτὸς δὲ ὁ κύριος τῆς εἰρήνης δῴη ὑμῖν τὴν εἰρήνην διὰ παντὸς ἐν παντὶ τρόπῳ ὁ κύριος μετὰ πάντων ὑμῶν',
   'Autos de ho kyrios tēs eirēnēs dōē hymin tēn eirēnēn dia pantos en panti tropō ho kyrios meta pantōn hymōn',
   '''The Lord of peace'' (ho kyrios tēs eirēnēs) — Christ Himself is the source and master of peace. ''Always by all means'' (dia pantos en panti tropō — through every circumstance, in every way) — comprehensive, unbroken peace. After a chapter dealing with disorder and discipline, Paul prays for peace — the very thing disrupted by the idle. ''The Lord be with you all'' (meta pantōn hymōn) — including the disciplined members, who remain brothers.',
   NULL),
  (17,
   'The salutation of Paul with mine own hand, which is the token in every epistle: so I write.',
   'Ὁ ἀσπασμὸς τῇ ἐμῇ χειρὶ Παύλου ὅ ἐστιν σημεῖον ἐν πάσῃ ἐπιστολῇ οὕτως γράφω',
   'Ho aspasmos tē emē cheiri Paulou ho estin sēmeion en pasē epistolē houtōs graphō',
   'Paul takes the pen from his amanuensis (secretary) to write the closing in his own hand — a practice mentioned in several letters (1 Cor 16:21, Gal 6:11, Col 4:18). He explicitly calls this his ''token'' (sēmeion — sign, mark of authentication) in every epistle, probably responding to the forged letter mentioned in 2:2. His distinctive handwriting serves as a safeguard against future forgeries.',
   NULL),
  (18,
   'The grace of our Lord Jesus Christ be with you all. Amen.',
   'ἡ χάρις τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μετὰ πάντων ὑμῶν ἀμήν',
   'hē charis tou kyriou hēmōn Iēsou Christou meta pantōn hymōn amēn',
   'The letter ends as it began — with grace (charis). ''With you all'' (meta pantōn hymōn) — grace is for the entire community, including those under discipline. The inclusio of grace frames the entire epistle: whatever judgments, warnings, and corrections have been given, grace remains the final word. Amen (amēn — truly, so be it) seals the letter with finality.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1 (Word running)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τρέχῃ', 'trechē', 'G5143', 'May run — the Gospel pictured as a swift runner, spreading rapidly and unhindered through the world.', 1),
  ('δοξάζηται', 'doxazētai', 'G1392', 'Be glorified — the word is honoured and praised when it transforms lives. The Gospel''s success is measured in changed hearts.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 3 (Lord is faithful)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πιστός', 'pistos', 'G4103', 'Faithful, trustworthy, reliable — God''s character is the ground of all assurance. He can be depended upon absolutely.', 1),
  ('στηρίξει', 'stērixei', 'G4741', 'Shall establish, make firm, fix solidly — to strengthen so that one cannot be shaken or overthrown.', 2),
  ('φυλάξει', 'phylaxei', 'G5442', 'Shall guard, keep, protect — as a sentinel guards a post. Active, vigilant, ongoing protection from evil.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 3;

-- Verse 6 (Disorderly)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παραγγέλλομεν', 'parangellomen', 'G3853', 'We command — a military term for issuing orders. Paul speaks with apostolic authority on this matter.', 1),
  ('στέλλεσθαι', 'stellesthai', 'G4724', 'Withdraw, keep away from, avoid — to draw back from close association. Measured distance, not total exclusion.', 2),
  ('ἀτάκτως', 'ataktōs', 'G814', 'Disorderly — a military term for a soldier who breaks rank or deserts his post. Applied to those who abandon their responsibilities.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 6;

-- Verse 10 (If any would not work)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θέλει', 'thelei', 'G2309', 'Wills, wishes, desires — the refusal is volitional. ''Would not'' targets willful laziness, not inability to work.', 1),
  ('ἐργάζεσθαι', 'ergazesthai', 'G2038', 'To work, to labour, to be employed — all legitimate productive activity, whether manual or intellectual.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 11 (Busybodies wordplay)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐργαζομένους', 'ergazomenous', 'G2038', 'Working — the base word for productive labour, here negated (mēden ergazomenous — doing no work at all).', 1),
  ('περιεργαζομένους', 'periergazomenous', 'G4020', 'Busybodies, meddlers — peri (around) + ergazomai (work). Working around the edges instead of working. A devastating wordplay.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 11;

-- Verse 14 (Note and withdraw)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σημειοῦσθε', 'sēmeiousthe', 'G4593', 'Note, mark, take special notice — publicly identify so the community knows to adjust their interaction.', 1),
  ('ἐντραπῇ', 'entrapē', 'G1788', 'Be ashamed, be put to shame — turned inward for self-reflection. The goal is repentance through healthy shame, not humiliation.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 14;

-- Verse 17 (Paul''s handwritten sign)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σημεῖον', 'sēmeion', 'G4592', 'Sign, token, mark — Paul''s distinctive handwriting serves as proof of authenticity against forgeries (cf. 2:2).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Word running
  (1, 'Psalm 147:15', 1), (1, 'Acts 13:49', 2), (1, 'Colossians 3:16', 3),
  -- v2: Delivered from wicked men
  (2, 'Romans 15:31', 1), (2, 'Acts 18:12-13', 2), (2, '2 Timothy 4:17-18', 3),
  -- v3: Lord is faithful
  (3, '1 Corinthians 1:9', 1), (3, '1 Thessalonians 5:24', 2), (3, '2 Timothy 2:13', 3), (3, '1 John 5:18', 4),
  -- v5: Love of God and patience of Christ
  (5, 'Romans 5:5', 1), (5, 'Hebrews 12:1-2', 2), (5, 'James 5:7-8', 3),
  -- v6: Withdraw from disorderly
  (6, '1 Thessalonians 5:14', 1), (6, 'Romans 16:17', 2), (6, '1 Corinthians 5:11', 3),
  -- v7: Paul''s example
  (7, '1 Corinthians 4:16', 1), (7, '1 Corinthians 11:1', 2), (7, 'Philippians 3:17', 3),
  -- v8: Working night and day
  (8, 'Acts 18:3', 1), (8, '1 Thessalonians 2:9', 2), (8, '1 Corinthians 9:12-15', 3),
  -- v9: Right to support
  (9, '1 Corinthians 9:4-14', 1), (9, 'Matthew 10:10', 2), (9, '1 Timothy 5:18', 3),
  -- v10: If any would not work
  (10, 'Genesis 3:19', 1), (10, 'Proverbs 10:4', 2), (10, 'Ephesians 4:28', 3),
  -- v11: Busybodies
  (11, '1 Timothy 5:13', 1), (11, '1 Peter 4:15', 2), (11, 'Proverbs 26:17', 3),
  -- v13: Not weary in well doing
  (13, 'Galatians 6:9', 1), (13, 'Hebrews 12:3', 2), (13, '1 Corinthians 15:58', 3),
  -- v14: Note and withdraw
  (14, 'Matthew 18:15-17', 1), (14, '1 Corinthians 5:9-11', 2), (14, 'Titus 3:10', 3),
  -- v15: Admonish as brother
  (15, 'Galatians 6:1', 1), (15, 'Leviticus 19:17', 2), (15, 'James 5:19-20', 3),
  -- v16: Lord of peace
  (16, 'Romans 15:33', 1), (16, 'Philippians 4:9', 2), (16, '1 Thessalonians 5:23', 3),
  -- v17: Paul''s signature
  (17, '1 Corinthians 16:21', 1), (17, 'Galatians 6:11', 2), (17, 'Colossians 4:18', 3),
  -- v18: Grace
  (18, 'Romans 16:20', 1), (18, '1 Thessalonians 5:28', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ 2 Thessalonians Chapter 3 Complete!
-- 18 verses · 8 key verses with word studies (18 words)
-- Cross-references for 16 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
