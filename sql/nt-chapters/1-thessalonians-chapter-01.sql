-- ═══════════════════════════════════════════════════
-- 1 THESSALONIANS CHAPTER 1 — The Model Church
-- 10 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '1 Thessalonians 1 is one of the warmest openings in all Paul''s letters. Writing from Corinth around AD 51, Paul gives thanks for the Thessalonians'' exemplary conversion and testimony. Three great Christian virtues frame the chapter: their ''work of faith,'' ''labour of love,'' and ''patience of hope'' (v.3). Paul recounts how the gospel came to them not in word only but in power, the Holy Spirit, and much assurance (v.5), and how they received it in much affliction with joy of the Holy Spirit (v.6). The result was so dramatic that they became ''ensamples'' (typoi — models, patterns) to all believers in Macedonia and Achaia (v.7). Their conversion was the talk of the ancient world: they ''turned to God from idols to serve the living and true God'' (v.9) and to ''wait for his Son from heaven'' (v.10). This chapter establishes the three tenses of the Christian life: faith (past — conversion), love (present — service), hope (future — the return of Christ).',
  'The Model Conversion and Its Testimony',
  'ἔργον πίστεως (ergon pisteōs)',
  'Work of faith — not works that earn salvation, but the active, productive energy that genuine faith inevitably produces. True faith is never idle; it works.',
  '["Greeting and Thanksgiving (vv.1-4): Paul, Silvanus, Timothy to the church; we give thanks always; remembering your work of faith, labour of love, patience of hope; knowing your election","The Gospel''s Power in Thessalonica (vv.5-7): Our gospel came not in word only but in power and the Holy Spirit; ye became followers of us and of the Lord; received the word in affliction with joy; ye were ensamples to all believers","The Fame of Their Faith (vv.8-10): From you sounded out the word of the Lord; your faith to God-ward is spread abroad; they turned from idols to serve the living God; and to wait for his Son from heaven"]'
FROM books b WHERE b.name = '1 Thessalonians';

-- Step 2: Insert all 10 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, and Silvanus, and Timotheus, unto the church of the Thessalonians which is in God the Father and in the Lord Jesus Christ: Grace be unto you, and peace, from God our Father, and the Lord Jesus Christ.',
   'Παῦλος καὶ Σιλουανὸς καὶ Τιμόθεος τῇ ἐκκλησίᾳ Θεσσαλονικέων ἐν θεῷ πατρὶ καὶ κυρίῳ Ἰησοῦ Χριστῷ χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'Paulos kai Silouanos kai Timotheos tē ekklēsia Thessalonikeōn en theō patri kai kyriō Iēsou Christō charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   'Three co-senders: Paul, Silvanus (Silas, Paul''s senior colleague from Acts 15:40), and Timothy (the younger protégé from Acts 16:1). ''The church'' (tē ekklēsia — the assembly, congregation) ''of the Thessalonians'' — named by its people, not its location alone. The unique phrase ''in God the Father and in the Lord Jesus Christ'' (en theō patri kai kyriō Iēsou Christō) places the church simultaneously in the Father and the Son — a remarkable statement of the deity of Christ. ''Grace'' (charis) and ''peace'' (eirēnē) — the Greek and Hebrew greetings fused into a Christian benediction.',
   NULL),
  (2,
   'We give thanks to God always for you all, making mention of you in our prayers;',
   'Εὐχαριστοῦμεν τῷ θεῷ πάντοτε περὶ πάντων ὑμῶν μνείαν ποιούμενοι ἐπὶ τῶν προσευχῶν ἡμῶν',
   'Eucharistoumen tō theō pantote peri pantōn hymōn mneian poioumenoi epi tōn proseuchōn hēmōn',
   '''We give thanks'' (eucharistoumen — present tense: we continually give thanks). ''Always'' (pantote) ''for you all'' (peri pantōn hymōn — concerning every one of you, no exceptions). ''Making mention'' (mneian poioumenoi — making remembrance, calling to mind). Paul''s prayers were specific, not generic — he remembered individual believers by name and situation. The thanksgiving is not polite formality but heartfelt gratitude to God for His work in them.',
   NULL),
  (3,
   'Remembering without ceasing your work of faith, and labour of love, and patience of hope in our Lord Jesus Christ, in the sight of God and our Father;',
   'ἀδιαλείπτως μνημονεύοντες ὑμῶν τοῦ ἔργου τῆς πίστεως καὶ τοῦ κόπου τῆς ἀγάπης καὶ τῆς ὑπομονῆς τῆς ἐλπίδος τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἔμπροσθεν τοῦ θεοῦ καὶ πατρὸς ἡμῶν',
   'adialeiptōs mnēmoneuontes hymōn tou ergou tēs pisteōs kai tou kopou tēs agapēs kai tēs hypomonēs tēs elpidos tou kyriou hēmōn Iēsou Christou emprosthen tou theou kai patros hēmōn',
   'The great triad of Christian virtues — faith, love, hope (cf. 1 Cor 13:13) — each linked to active expression: (1) ''work of faith'' (ergou tēs pisteōs — the productive, visible outworking of genuine faith), (2) ''labour of love'' (kopou tēs agapēs — toilsome, exhausting effort motivated by love; kopos means sweat-producing labour), (3) ''patience of hope'' (hypomonēs tēs elpidos — steadfast endurance that hope in Christ''s return produces). ''Without ceasing'' (adialeiptōs — uninterruptedly). ''In the sight of God'' (emprosthen tou theou — before the face of God, in His very presence).',
   'The three tenses of salvation are embedded here: faith looks back to conversion, love characterises present service, hope looks forward to Christ''s return. This triad forms the theological backbone of the entire epistle and recurs in 5:8.'),
  (4,
   'Knowing, brethren beloved, your election of God.',
   'εἰδότες ἀδελφοὶ ἠγαπημένοι ὑπὸ τοῦ θεοῦ τὴν ἐκλογὴν ὑμῶν',
   'eidotes adelphoi ēgapēmenoi hypo tou theou tēn eklogēn hymōn',
   '''Knowing'' (eidotes — having perceived, being aware). ''Beloved'' (ēgapēmenoi — having been loved, perfect passive participle: loved by God in the past with continuing effect). ''Election'' (eklogēn — choosing out, selection, divine choice). Paul knows their election not by a secret decree but by its visible fruit: the work of faith, labour of love, and patience of hope. Election is known by its effects, not by speculation about God''s hidden counsel.',
   'Divine election: Paul affirms that God chose the Thessalonians. Their election is known through its fruit — genuine faith, active love, enduring hope. Election is not fatalism but the sovereign grace that produces visible transformation. Paul calls them ''beloved'' (ēgapēmenoi) — election flows from love, not arbitrary power.'),
  (5,
   'For our gospel came not unto you in word only, but also in power, and in the Holy Ghost, and in much assurance; as ye know what manner of men we were among you for your sake.',
   'ὅτι τὸ εὐαγγέλιον ἡμῶν οὐκ ἐγενήθη εἰς ὑμᾶς ἐν λόγῳ μόνον ἀλλὰ καὶ ἐν δυνάμει καὶ ἐν πνεύματι ἁγίῳ καὶ ἐν πληροφορίᾳ πολλῇ καθὼς οἴδατε οἷοι ἐγενήθημεν ἐν ὑμῖν δι᾽ ὑμᾶς',
   'hoti to euangelion hēmōn ouk egenēthē eis hymas en logō monon alla kai en dynamei kai en pneumati hagiō kai en plērophoria pollē kathōs oidate hoioi egenēthēmen en hymin di'' hymas',
   'Four dimensions of gospel proclamation: (1) ''word'' (logō — the verbal content, the message itself), (2) ''power'' (dynamei — supernatural energy, divine ability working through the message), (3) ''the Holy Ghost'' (pneumati hagiō — the personal agency of the Spirit), (4) ''much assurance'' (plērophoria pollē — full conviction, complete certainty; both in the preachers and in the hearers). The gospel is never mere information — it comes with divine power that transforms. Paul also points to his own conduct: ''what manner of men we were among you'' — the messenger''s life authenticates the message.',
   NULL),
  (6,
   'And ye became followers of us, and of the Lord, having received the word in much affliction, with joy of the Holy Ghost:',
   'καὶ ὑμεῖς μιμηταὶ ἡμῶν ἐγενήθητε καὶ τοῦ κυρίου δεξάμενοι τὸν λόγον ἐν θλίψει πολλῇ μετὰ χαρᾶς πνεύματος ἁγίου',
   'kai hymeis mimētai hēmōn egenēthēte kai tou kyriou dexamenoi ton logon en thlipsei pollē meta charas pneumatos hagiou',
   '''Followers'' (mimētai — imitators, those who reproduce a pattern; from mimeomai). They imitated both Paul and the Lord. ''Received'' (dexamenoi — welcomed, embraced; aorist: a decisive act of reception). The paradox of Christian experience: ''much affliction'' (thlipsei pollē — severe pressure, persecution; cf. Acts 17:5-9 for the riot in Thessalonica) combined with ''joy of the Holy Ghost'' (charas pneumatos hagiou). Joy and suffering are not contradictions in the Christian life — the Holy Spirit produces joy precisely in the midst of tribulation.',
   NULL),
  (7,
   'So that ye were ensamples to all that believe in Macedonia and Achaia.',
   'ὥστε γενέσθαι ὑμᾶς τύπον πᾶσιν τοῖς πιστεύουσιν ἐν τῇ Μακεδονίᾳ καὶ ἐν τῇ Ἀχαΐᾳ',
   'hōste genesthai hymas typon pasin tois pisteuousin en tē Makedonia kai en tē Achaia',
   '''Ensamples'' (typon — a type, pattern, model, stamp; from typtō, to strike — the mark left by a blow, like a die stamp). Singular, not plural: the whole church was one unified pattern. They became the template that other churches measured themselves against. ''Macedonia and Achaia'' — the two Roman provinces that comprised all of Greece. A church barely weeks old had already become the standard for an entire region. This is the fruit of genuine conversion.',
   NULL),
  (8,
   'For from you sounded out the word of the Lord not only in Macedonia and Achaia, but also in every place your faith to God-ward is spread abroad; so that we need not to speak any thing.',
   'ἀφ᾽ ὑμῶν γὰρ ἐξήχηται ὁ λόγος τοῦ κυρίου οὐ μόνον ἐν τῇ Μακεδονίᾳ καὶ Ἀχαΐᾳ ἀλλ᾽ ἐν παντὶ τόπῳ ἡ πίστις ὑμῶν ἡ πρὸς τὸν θεὸν ἐξελήλυθεν ὥστε μὴ χρείαν ἔχειν ἡμᾶς λαλεῖν τι',
   'aph'' hymōn gar exēchētai ho logos tou kyriou ou monon en tē Makedonia kai Achaia all'' en panti topō hē pistis hymōn hē pros ton theon exelēlythen hōste mē chreian echein hēmas lalein ti',
   '''Sounded out'' (exēchētai — has been sounded forth, has rung out; perfect tense: sounded in the past with continuing reverberation. From ex + ēcheō — to sound out, to echo forth like a trumpet blast or a peal of thunder). The word ''echoed'' outward from Thessalonica like sound waves spreading in every direction. ''In every place'' (en panti topō) — along the trade routes of the Via Egnatia, news of their conversion spread everywhere. ''So that we need not to speak any thing'' — Paul didn''t need to tell their story; it told itself.',
   NULL),
  (9,
   'For they themselves shew of us what manner of entering in we had unto you, and how ye turned to God from idols to serve the living and true God;',
   'αὐτοὶ γὰρ περὶ ἡμῶν ἀπαγγέλλουσιν ὁποίαν εἴσοδον ἔσχομεν πρὸς ὑμᾶς καὶ πῶς ἐπεστρέψατε πρὸς τὸν θεὸν ἀπὸ τῶν εἰδώλων δουλεύειν θεῷ ζῶντι καὶ ἀληθινῷ',
   'autoi gar peri hēmōn apangellousin hopoian eisodon eschomen pros hymas kai pōs epestrepsate pros ton theon apo tōn eidōlōn douleuein theō zōnti kai alēthinō',
   'The classic description of conversion: ''turned'' (epestrepsate — turned around, converted; aorist: a decisive, completed act) ''to God from idols'' — the order is significant: the turning is toward God, away from idols. You don''t first clean up your life and then come to God; you come to God and the idols fall away. ''To serve'' (douleuein — to serve as a slave, to be in bondage to; present infinitive: ongoing, continuous service). ''Living and true God'' (theō zōnti kai alēthinō) — in contrast to the dead, false idols of Thessalonica''s temples.',
   'The nature of true conversion: (1) It is a turning — from something (idols) and to Someone (God). (2) It results in service (douleuein) — not mere belief but active, ongoing devotion. (3) It is grounded in the character of God: ''living'' (in contrast to dead idols) and ''true'' (alēthinō — genuine, authentic, as opposed to the fraudulent gods of paganism).'),
  (10,
   'And to wait for his Son from heaven, whom he raised from the dead, even Jesus, which delivered us from the wrath to come.',
   'καὶ ἀναμένειν τὸν υἱὸν αὐτοῦ ἐκ τῶν οὐρανῶν ὃν ἤγειρεν ἐκ τῶν νεκρῶν Ἰησοῦν τὸν ῥυόμενον ἡμᾶς ἐκ τῆς ὀργῆς τῆς ἐρχομένης',
   'kai anamenein ton huion autou ek tōn ouranōn hon ēgeiren ek tōn nekrōn Iēsoun ton rhyomenon hēmas ek tēs orgēs tēs erchomenēs',
   '''To wait'' (anamenein — to wait up for, to await expectantly; used only here in the NT. The ana- prefix suggests looking upward). ''His Son from heaven'' — the expectation is personal (His Son), directional (from heaven), and certain (whom He raised from the dead — the resurrection guarantees the return). ''Delivered'' (rhyomenon — the one delivering, rescuing, snatching out of danger; present participle: He is our ongoing deliverer). ''The wrath to come'' (tēs orgēs tēs erchomenēs — the coming wrath, the future outpouring of divine judgment). Jesus is the believer''s rescue from eschatological wrath.',
   'Deliverance from the wrath to come: This verse introduces the eschatological hope that dominates both Thessalonian epistles. The ''wrath to come'' is not general misfortune but the specific, future outpouring of God''s judgment. Jesus ''delivers'' (present tense — ongoing rescue) believers from this wrath. This theme returns in 5:9: ''God hath not appointed us to wrath, but to obtain salvation.'' The believer''s hope is not merely heaven but rescue from coming judgment through the return of Christ.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 3 (Work of faith, labour of love, patience of hope)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔργον', 'ergon', 'G2041', 'Work, deed, action — the visible, productive outworking of inward faith. Faith that is genuine inevitably produces works (cf. James 2:17-18). Not works that earn salvation but works that evidence it.', 1),
  ('κόπου', 'kopou', 'G2873', 'Labour, toil, exhausting effort — from koptō (to cut, to strike). This is not casual effort but sweat-producing, wearying labour. Love motivates the hardest kind of work.', 2),
  ('ὑπομονῆς', 'hypomonēs', 'G5281', 'Patience, steadfast endurance, perseverance — from hypo (under) + menō (to remain). The capacity to remain under pressure without collapsing. Hope in Christ''s return produces this staying power.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 5 (Gospel in power)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δυνάμει', 'dynamei', 'G1411', 'Power, might, supernatural ability — from dynamai (to be able). The inherent power that accompanies the gospel when the Spirit works through it. Not human persuasion but divine energy.', 1),
  ('πληροφορίᾳ', 'plērophoria', 'G4136', 'Full assurance, complete conviction, certainty — from plērophoreō (to fill completely, to fully convince). The gospel produced not tentative opinion but rock-solid confidence in both preacher and hearer.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 7 (Ensamples)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τύπον', 'typon', 'G5179', 'Type, pattern, model, example — from typtō (to strike). Originally the impression left by a blow (like a seal in wax). The Thessalonians became the mould from which other churches could be stamped.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 8 (Sounded out)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐξήχηται', 'exēchētai', 'G1837', 'Has sounded forth, has echoed out — perfect passive: the sound went out and keeps reverberating. Used only here in the NT. Like a trumpet blast that echoes across mountains, the gospel rang out from Thessalonica in every direction.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 9 (Turned from idols)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπεστρέψατε', 'epestrepsate', 'G1994', 'Turned, converted — aorist: a decisive, completed act of turning around. From epi (toward) + strephō (to turn). Conversion is a definitive about-face: toward God, away from idols.', 1),
  ('εἰδώλων', 'eidōlōn', 'G1497', 'Idols, images, false gods — from eidos (form, appearance). An idol is a mere form without substance, a phantom. The Thessalonians left behind the entire apparatus of pagan worship.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 10 (Wait for His Son)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀναμένειν', 'anamenein', 'G362', 'To wait for, to await expectantly — used only here in the entire NT. The ana- prefix (up) suggests looking upward while waiting. This is not passive resignation but active, eager, upward-looking expectation.', 1),
  ('ῥυόμενον', 'rhyomenon', 'G4506', 'The one delivering, rescuing, snatching from danger — present participle: the ongoing deliverer. Christ continually rescues believers from the coming wrath. From rhyomai, to draw to oneself, to rescue.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: In God the Father and Lord Jesus Christ
  (1, '2 Thessalonians 1:1', 1), (1, 'Acts 17:1-4', 2), (1, 'Philippians 1:1', 3),
  -- v3: Work of faith, labour of love, patience of hope
  (3, '1 Corinthians 13:13', 1), (3, '1 Thessalonians 5:8', 2), (3, 'Hebrews 6:10-12', 3),
  -- v4: Election
  (4, 'Ephesians 1:4', 1), (4, 'Romans 8:33', 2), (4, '2 Peter 1:10', 3),
  -- v5: Gospel in power
  (5, '1 Corinthians 2:4-5', 1), (5, 'Romans 1:16', 2), (5, 'Hebrews 2:3-4', 3),
  -- v6: Affliction with joy
  (6, 'Acts 17:5-9', 1), (6, 'Acts 5:41', 2), (6, 'James 1:2-3', 3),
  -- v7: Ensamples
  (7, 'Philippians 3:17', 1), (7, '2 Thessalonians 3:9', 2), (7, '1 Timothy 4:12', 3),
  -- v8: Word sounded out
  (8, 'Romans 1:8', 1), (8, 'Romans 10:18', 2), (8, 'Colossians 1:6', 3),
  -- v9: Turned from idols
  (9, 'Acts 14:15', 1), (9, 'Galatians 4:8-9', 2), (9, '1 Corinthians 12:2', 3),
  -- v10: Wait for His Son / delivered from wrath
  (10, '1 Thessalonians 4:16-17', 1), (10, '1 Thessalonians 5:9', 2), (10, 'Romans 5:9', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Thessalonians Chapter 1 Complete
-- 10 verses · 6 key verses with word studies (11 words)
-- Cross-references for 9 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════