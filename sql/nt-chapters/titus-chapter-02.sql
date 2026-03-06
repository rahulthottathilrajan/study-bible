-- ═══════════════════════════════════════════════════
-- TITUS CHAPTER 2 — Sound Doctrine, Grace & the Blessed Hope
-- 15 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'One of the most practically structured and theologically profound chapters in Paul''s letters. Titus 2 applies sound doctrine to every social group in the church — aged men, aged women, young women, young men, and servants — demonstrating that right belief must produce right behaviour. The chapter climaxes in vv.11-14 with one of the NT''s greatest soteriological passages: the grace of God has appeared, bringing salvation to all men, teaching us to deny ungodliness and live soberly, righteously, and godly, while looking for the blessed hope — the glorious appearing of our great God and Saviour Jesus Christ, who gave Himself to redeem and purify a people for His own possession. This passage unites the first and second comings, grace and holiness, justification and sanctification in a single breathtaking statement.',
  'Grace That Teaches Godly Living and the Blessed Hope of Christ''s Return',
  'σωφρόνως (sōphronōs)',
  'Soberly, with self-control, with a sound mind — the hallmark virtue of this chapter, appearing in various forms for every group. It denotes the mastery of reason over desire.',
  '["Sound Teaching for Aged Men (vv.1-2): Sober, grave, temperate, sound in faith, charity, patience","Sound Teaching for Women (vv.3-5): Aged women as teachers of good; young women to love husbands and children, be keepers at home","Sound Teaching for Young Men (vv.6-8): Sober minded; Titus as a pattern of good works, sound speech that cannot be condemned","Sound Teaching for Servants (vv.9-10): Obedient, not purloining, adorning the doctrine of God our Saviour","The Grace of God (vv.11-14): Grace appeared bringing salvation, teaching us to deny ungodliness, looking for the blessed hope and glorious appearing of Jesus Christ who redeemed and purified us","Final Charge (v.15): Speak, exhort, rebuke with all authority"]'
FROM books b WHERE b.name = 'Titus';

-- Step 2: Insert all 15 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'But speak thou the things which become sound doctrine:',
   'Σὺ δὲ λάλει ἃ πρέπει τῇ ὑγιαινούσῃ διδασκαλίᾳ',
   'Sy de lalei ha prepei tē hygiainousē didaskalia',
   '''But speak thou'' (Sy de — emphatic: you, in contrast to the false teachers of chapter 1). ''Become'' (prepei — fit, befit, are appropriate to) ''sound doctrine'' (hygiainousē didaskalia — healthy teaching, a medical metaphor unique to the Pastoral Epistles). What follows in vv.2-10 is not abstract theology but practical application — sound doctrine produces sound living. Titus must teach behaviour that is consistent with (prepei) the gospel.',
   NULL),
  (2,
   'That the aged men be sober, grave, temperate, sound in faith, in charity, in patience.',
   'πρεσβύτας νηφαλίους εἶναι σεμνούς σώφρονας ὑγιαίνοντας τῇ πίστει τῇ ἀγάπῃ τῇ ὑπομονῇ',
   'presbytas nēphalious einai semnous sōphronas hygiainontas tē pistei tē agapē tē hypomonē',
   '''Aged men'' (presbytas — older men, not the office of elder/presbyteros but senior men in the congregation). Three character qualities: ''sober'' (nēphalious — temperate, clear-headed, not intoxicated), ''grave'' (semnous — dignified, worthy of respect, serious), ''temperate'' (sōphronas — self-controlled, of sound mind). Then three theological virtues: ''sound in faith'' (hygiainontas tē pistei — healthy in faith), ''in charity'' (tē agapē — in love), ''in patience'' (tē hypomonē — in endurance). Old age should be the crown of a life of growing faith, love, and perseverance.',
   NULL),
  (3,
   'The aged women likewise, that they be in behaviour as becometh holiness, not false accusers, not given to much wine, teachers of good things;',
   'πρεσβύτιδας ὡσαύτως ἐν καταστήματι ἱεροπρεπεῖς μὴ διαβόλους μὴ οἴνῳ πολλῷ δεδουλωμένας καλοδιδασκάλους',
   'presbytidas hōsautōs en katastēmati hieroprepeis mē diabolous mē oinō pollō dedoulōmenas kalodidaskalous',
   '''As becometh holiness'' (hieroprepeis — befitting a sacred person, priestly in demeanour). ''Not false accusers'' (mē diabolous — not slanderers; diabolos literally means ''thrower-across,'' one who divides people with malicious speech — the same word used for the devil). ''Not given to much wine'' (mē oinō pollō dedoulōmenas — not enslaved to much wine; dedoulōmenas is perfect passive: bound in slavery to alcohol). ''Teachers of good things'' (kalodidaskalous — found only here in the NT, a single compound word: beautiful-teachers). Older women have a vital teaching ministry.',
   NULL),
  (4,
   'That they may teach the young women to be sober, to love their husbands, to love their children,',
   'ἵνα σωφρονίζωσιν τὰς νέας φιλάνδρους εἶναι φιλοτέκνους',
   'hina sōphronizōsin tas neas philandrous einai philoteknous',
   '''Teach'' (sōphronizōsin — train, encourage, bring to their senses) — the root is again sōphrōn (self-controlled). ''Love their husbands'' (philandrous — husband-loving) and ''love their children'' (philoteknous — child-loving) — both are compound words found only here in the NT. These are not natural instincts that need no cultivation but virtues that require intentional mentoring. The older-to-younger teaching model preserves generational wisdom within the church.',
   NULL),
  (5,
   'To be discreet, chaste, keepers at home, good, obedient to their own husbands, that the word of God be not blasphemed.',
   'σώφρονας ἁγνὰς οἰκουρούς ἀγαθάς ὑποτασσομένας τοῖς ἰδίοις ἀνδράσιν ἵνα μὴ ὁ λόγος τοῦ θεοῦ βλασφημῆται',
   'sōphronas hagnas oikourgous agathas hypotassomenas tois idiois andrasin hina mē ho logos tou theou blasphēmētai',
   'Five more qualities: ''discreet'' (sōphronas — self-controlled, again), ''chaste'' (hagnas — pure, innocent), ''keepers at home'' (oikourgous — working at home, managing the household), ''good'' (agathas — kind, benevolent), ''obedient to their own husbands'' (hypotassomenas — arranging themselves under, a voluntary positioning). The motivation clause is striking: ''that the word of God be not blasphemed'' (hina mē ho logos tou theou blasphēmētai) — Christian conduct in the household directly impacts the reputation of the Gospel in the watching world.',
   NULL),
  (6,
   'Young men likewise exhort to be sober minded.',
   'τοὺς νεωτέρους ὡσαύτως παρακάλει σωφρονεῖν',
   'tous neōterous hōsautōs parakalei sōphronein',
   'Remarkably brief — only one word of instruction for young men: ''sober minded'' (sōphronein — to be of sound mind, self-controlled). This is the master virtue that governs all others. Every group in the chapter is told to be sōphrōn (vv.2,4,5,6,12). For young men, whose particular temptation is impulsiveness and passion, self-mastery is the foundational discipline.',
   NULL),
  (7,
   'In all things shewing thyself a pattern of good works: in doctrine shewing uncorruptness, gravity, sincerity,',
   'περὶ πάντα σεαυτὸν παρεχόμενος τύπον καλῶν ἔργων ἐν τῇ διδασκαλίᾳ ἀδιαφθορίαν σεμνότητα ἀφθαρσίαν',
   'peri panta seauton parechomenos typon kalōn ergōn en tē didaskalia adiaphthorian semnotēta aphtharsian',
   '''Pattern'' (typon — a stamp, mould, model for imitation; cf. Phil 3:17, 1 Tim 4:12). Titus himself must be the living illustration of his teaching. ''In doctrine'' (en tē didaskalia) — his teaching must show ''uncorruptness'' (adiaphthorian — integrity, free from adulteration), ''gravity'' (semnotēta — dignity, seriousness), and ''sincerity'' (aphtharsian — incorruptibility, genuineness). The teacher''s character validates or invalidates his message.',
   NULL),
  (8,
   'Sound speech, that cannot be condemned; that he that is of the contrary part may be ashamed, having no evil thing to say of you.',
   'λόγον ὑγιῆ ἀκατάγνωστον ἵνα ὁ ἐξ ἐναντίας ἐντραπῇ μηδὲν ἔχων περὶ ἡμῶν λέγειν φαῦλον',
   'logon hygiē akatagnōston hina ho ex enantias entrapē mēden echōn peri hēmōn legein phaulon',
   '''Sound speech'' (logon hygiē — healthy words, using the same medical metaphor as v.1). ''Cannot be condemned'' (akatagnōston — beyond reproach, unimpeachable — found only here in the NT). The effect: ''he that is of the contrary part'' (ho ex enantias — the opponent, the adversary) will ''be ashamed'' (entrapē — turned inward, embarrassed) because he can find ''no evil thing'' (mēden phaulon — nothing base, worthless, or trivial) to say. Irrefutable speech silences critics.',
   NULL),
  (9,
   'Exhort servants to be obedient unto their own masters, and to please them well in all things; not answering again;',
   'δούλους ἰδίοις δεσπόταις ὑποτάσσεσθαι ἐν πᾶσιν εὐαρέστους εἶναι μὴ ἀντιλέγοντας',
   'doulous idiois despotais hypotassesthai en pasin euarestous einai mē antilegontas',
   '''Servants'' (doulous — slaves, bondservants) are to ''be obedient'' (hypotassesthai — submit, arrange under) to their ''masters'' (despotais — lords, owners). ''Please them well'' (euarestous einai — be well-pleasing) ''in all things'' — not selective obedience. ''Not answering again'' (mē antilegontas — not contradicting, not talking back). Paul does not endorse the institution of slavery but instructs slaves how to live as Christians within their circumstances, transforming the relationship from within.',
   NULL),
  (10,
   'Not purloining, but shewing all good fidelity; that they may adorn the doctrine of God our Saviour in all things.',
   'μὴ νοσφιζομένους ἀλλὰ πίστιν πᾶσαν ἐνδεικνυμένους ἀγαθήν ἵνα τὴν διδασκαλίαν τοῦ σωτῆρος ἡμῶν θεοῦ κοσμῶσιν ἐν πᾶσιν',
   'mē nosphizomenous alla pistin pasan endeiknumenous agathēn hina tēn didaskalian tou sōtēros hēmōn theou kosmōsin en pasin',
   '''Purloining'' (nosphizomenous — pilfering, embezzling, setting aside for oneself; the same word used of Ananias and Sapphira in Acts 5:2). ''Good fidelity'' (pistin pasan agathēn — all good faithfulness, complete trustworthiness). The stunning purpose clause: ''that they may adorn the doctrine'' (hina tēn didaskalian kosmōsin — that they may make the teaching beautiful). ''Adorn'' (kosmōsin — from kosmos/cosmetics) means to decorate, beautify. Even slaves can make the Gospel attractive by their conduct. Doctrine is the jewel; godly living is the setting.',
   'Every believer, regardless of social position, can ''adorn'' (beautify) the Gospel. The doctrine of God our Saviour becomes visible and attractive when lived out faithfully. This is the ultimate apologetic — transformed lives in every circumstance.'),
  (11,
   'For the grace of God that bringeth salvation hath appeared to all men,',
   'Ἐπεφάνη γὰρ ἡ χάρις τοῦ θεοῦ ἡ σωτήριος πᾶσιν ἀνθρώποις',
   'Epephanē gar hē charis tou theou hē sōtērios pasin anthrōpois',
   '''Hath appeared'' (epephanē — was manifested, shone forth; from epiphainō, source of ''epiphany'') — grace is not an abstract concept but a historical event. It ''appeared'' in the person of Jesus Christ. ''The grace of God'' (hē charis tou theou) is the subject — grace itself is personified as the active agent. ''Bringing salvation'' (sōtērios — saving, delivering) ''to all men'' (pasin anthrōpois — to all classes and kinds of people, as demonstrated in vv.2-10 where every social group is addressed). Grace is universal in its offer, though particular in its saving effect.',
   'The incarnation is the appearing (epiphany) of grace. Grace is not merely a divine attribute but a saving force that broke into human history through Jesus Christ. It is offered to all categories of people — old, young, male, female, free, slave — without distinction.'),
  (12,
   'Teaching us that, denying ungodliness and worldly lusts, we should live soberly, righteously, and godly, in this present world;',
   'παιδεύουσα ἡμᾶς ἵνα ἀρνησάμενοι τὴν ἀσέβειαν καὶ τὰς κοσμικὰς ἐπιθυμίας σωφρόνως καὶ δικαίως καὶ εὐσεβῶς ζήσωμεν ἐν τῷ νῦν αἰῶνι',
   'paideuousa hēmas hina arnēsamenoi tēn asebeian kai tas kosmikas epithymias sōphronōs kai dikaiōs kai eusebōs zēsōmen en tō nyn aiōni',
   '''Teaching'' (paideuousa — training, educating, disciplining; the word for child-rearing and instruction) — grace is not permissive but pedagogical. It teaches through discipline. Two negatives: ''denying ungodliness'' (arnēsamenoi tēn asebeian — renouncing irreverence toward God) and ''worldly lusts'' (kosmikas epithymias — desires shaped by the world-system). Three positives: ''soberly'' (sōphronōs — self-controlled, toward oneself), ''righteously'' (dikaiōs — justly, toward others), ''godly'' (eusebōs — devoutly, toward God). Grace produces comprehensive transformation covering all relationships.',
   'Grace does not produce licence but holiness. The same grace that saves also teaches, disciplines, and transforms. Antinomianism (grace without obedience) is a fundamental misunderstanding of the Gospel. True grace is the most powerful force for sanctification.'),
  (13,
   'Looking for that blessed hope, and the glorious appearing of the great God and our Saviour Jesus Christ;',
   'προσδεχόμενοι τὴν μακαρίαν ἐλπίδα καὶ ἐπιφάνειαν τῆς δόξης τοῦ μεγάλου θεοῦ καὶ σωτῆρος ἡμῶν Ἰησοῦ Χριστοῦ',
   'prosdechomenoi tēn makarian elpida kai epiphaneian tēs doxēs tou megalou theou kai sōtēros hēmōn Iēsou Christou',
   '''Looking for'' (prosdechomenoi — eagerly expecting, waiting with anticipation). ''Blessed hope'' (makarian elpida — the happy hope, the hope that makes blessed) and ''glorious appearing'' (epiphaneian tēs doxēs — the epiphany of glory, the manifestation of divine splendour). ''The great God and our Saviour Jesus Christ'' (tou megalou theou kai sōtēros hēmōn Iēsou Christou) — by the Granville Sharp rule in Greek grammar, the single article (tou) governing both ''God'' and ''Saviour'' identifies them as the same person: Jesus Christ is our great God and Saviour. This is one of the clearest affirmations of Christ''s deity in the NT.',
   'This verse is one of the most explicit NT declarations of Christ''s deity. The Granville Sharp rule (a single article governing two nouns joined by kai) identifies ''our great God'' and ''our Saviour'' as one person: Jesus Christ. Cf. 2 Peter 1:1, 2 Thess 1:12. The blessed hope is not escape from the world but the glorious appearing of God Himself in the person of Christ.'),
  (14,
   'Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works.',
   'ὃς ἔδωκεν ἑαυτὸν ὑπὲρ ἡμῶν ἵνα λυτρώσηται ἡμᾶς ἀπὸ πάσης ἀνομίας καὶ καθαρίσῃ ἑαυτῷ λαὸν περιούσιον ζηλωτὴν καλῶν ἔργων',
   'hos edōken heauton hyper hēmōn hina lytrōsētai hēmas apo pasēs anomias kai katharisē heautō laon periousion zēlōtēn kalōn ergōn',
   '''Gave himself'' (edōken heauton — voluntary self-sacrifice; cf. Gal 1:4, 2:20). Three purposes of Christ''s death: (1) ''redeem us from all iniquity'' (lytrōsētai — ransom, buy back; the price metaphor of liberation from slavery to sin), (2) ''purify unto himself'' (katharisē heautō — cleanse for Himself) a people, and (3) create ''a peculiar people'' (laon periousion — a people for His own possession; echoes Exod 19:5, Deut 14:2 — the new Israel). ''Zealous of good works'' (zēlōtēn kalōn ergōn — burning with enthusiasm for beautiful deeds). Redemption produces possession; possession produces purity; purity produces zeal.',
   'Christ''s atonement has three inseparable purposes: liberation from sin (redemption), transformation of character (purification), and creation of a distinctive people (possession). Good works are not the means of salvation but its intended fruit — the redeemed are ''zealous'' for them, not reluctant performers.'),
  (15,
   'These things speak, and exhort, and rebuke with all authority. Let no man despise thee.',
   'Ταῦτα λάλει καὶ παρακάλει καὶ ἔλεγχε μετὰ πάσης ἐπιταγῆς μηδείς σου περιφρονείτω',
   'Tauta lalei kai parakalei kai elenche meta pasēs epitagēs mēdeis sou periphroneito',
   'Three modes of ministry: ''speak'' (lalei — proclaim, declare), ''exhort'' (parakalei — encourage, urge alongside), and ''rebuke'' (elenche — convict, expose error). All three are exercised ''with all authority'' (meta pasēs epitagēs — with full apostolic command). ''Let no man despise thee'' (mēdeis sou periphroneito — let no one think around you, look down on you, disregard you). Titus was likely younger than many he led; his authority rested not on age but on his commission from Paul and the truth of his message (cf. 1 Tim 4:12).',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Titus' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 1 (Sound doctrine)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑγιαινούσῃ', 'hygiainousē', 'G5198', 'Sound, healthy — a medical term: doctrine that produces spiritual health. Signature word of the Pastoral Epistles (1 Tim 1:10, 6:3; 2 Tim 1:13, 4:3; Titus 1:9, 2:1).', 1),
  ('διδασκαλίᾳ', 'didaskalia', 'G1319', 'Doctrine, teaching, instruction — the content of Christian truth, not mere opinion. What is taught determines how people live.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 1;

-- Verse 7 (Pattern)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τύπον', 'typon', 'G5179', 'Pattern, model, example, type — a mould or stamp that produces replicas. The teacher''s life is the template for the learner.', 1),
  ('ἀδιαφθορίαν', 'adiaphthorian', 'G90', 'Uncorruptness, integrity — a (not) + diaphthora (corruption). Teaching free from contamination, adulteration, or hidden agenda.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 7;

-- Verse 10 (Adorn the doctrine)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νοσφιζομένους', 'nosphizomenous', 'G3557', 'Purloining, pilfering, embezzling — setting aside for oneself what belongs to another. The same word used of Ananias and Sapphira (Acts 5:2).', 1),
  ('κοσμῶσιν', 'kosmōsin', 'G2885', 'Adorn, beautify, make attractive — from kosmos (order, beauty). To arrange beautifully, like decorating or setting a jewel. Godly conduct makes doctrine beautiful.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 10;

-- Verse 11 (Grace appeared)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπεφάνη', 'epephanē', 'G2014', 'Appeared, was manifested, shone forth — source of ''epiphany.'' Grace broke into history as a visible, datable event in the incarnation.', 1),
  ('σωτήριος', 'sōtērios', 'G4992', 'Bringing salvation, saving, delivering — modifying grace: it is specifically salvation-bringing grace, not merely common grace.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 11;

-- Verse 12 (Grace teaches)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παιδεύουσα', 'paideuousa', 'G3811', 'Teaching, training, disciplining — the word for child-rearing (paideia). Grace educates through instruction and correction, like a parent training a child.', 1),
  ('σωφρόνως', 'sōphronōs', 'G4996', 'Soberly, with self-control — sōphrōn (sound mind) in adverbial form. Self-mastery in relation to oneself.', 2),
  ('δικαίως', 'dikaiōs', 'G1346', 'Righteously, justly — right conduct toward other people. The horizontal dimension of godly living.', 3),
  ('εὐσεβῶς', 'eusebōs', 'G2153', 'Godly, devoutly, piously — eu (well) + sebomai (worship). Right reverence toward God. The vertical dimension.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 12;

-- Verse 13 (Blessed hope)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μακαρίαν', 'makarian', 'G3107', 'Blessed, happy, fortunate — the hope that produces blessedness. Looking for Christ''s return is not fearful but joyful.', 1),
  ('ἐλπίδα', 'elpida', 'G1680', 'Hope — confident expectation, not wishful thinking. In biblical usage, hope is certain because it rests on God''s promise.', 2),
  ('ἐπιφάνειαν', 'epiphaneian', 'G2015', 'Appearing, manifestation — the visible, glorious display of Christ at His return. The second ''epiphany'' after the first (v.11).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 13;

-- Verse 14 (Redeemed and purified)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λυτρώσηται', 'lytrōsētai', 'G3084', 'Redeem, ransom — to buy back a slave or captive by paying a price. Christ''s self-sacrifice is the ransom price for liberation from sin.', 1),
  ('καθαρίσῃ', 'katharisē', 'G2511', 'Purify, cleanse — to remove defilement and make holy. Redemption liberates; purification transforms.', 2),
  ('περιούσιον', 'periousion', 'G4041', 'Peculiar, one''s own special possession — from perieimi (to be over and above). A treasured people, God''s own prized possession. Echoes Exodus 19:5 and Deuteronomy 14:2.', 3),
  ('ζηλωτήν', 'zēlōtēn', 'G2207', 'Zealous, enthusiastic — from zēloō (to burn with zeal). Not reluctant obedience but passionate pursuit of good works.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = 14;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Sound doctrine
  (1, '1 Timothy 1:10', 1), (1, '1 Timothy 6:3', 2), (1, '2 Timothy 4:3', 3),
  -- v2: Aged men
  (2, '1 Timothy 5:1', 1), (2, 'Philemon 1:9', 2),
  -- v3: Aged women
  (3, '1 Timothy 3:11', 1), (3, '1 Timothy 5:2', 2), (3, '1 Peter 3:3-5', 3),
  -- v5: Keepers at home
  (5, '1 Timothy 5:14', 1), (5, 'Proverbs 31:27', 2), (5, '1 Peter 3:1-2', 3),
  -- v6: Young men sober
  (6, '1 Timothy 4:12', 1), (6, '1 Peter 5:5', 2),
  -- v7: Pattern of good works
  (7, '1 Timothy 4:12', 1), (7, 'Philippians 3:17', 2), (7, '1 Peter 5:3', 3),
  -- v8: Sound speech
  (8, 'Colossians 4:6', 1), (8, '1 Peter 2:15', 2), (8, '1 Peter 3:16', 3),
  -- v9: Servants obedient
  (9, 'Ephesians 6:5-7', 1), (9, 'Colossians 3:22-24', 2), (9, '1 Timothy 6:1-2', 3),
  -- v10: Adorn doctrine
  (10, 'Matthew 5:16', 1), (10, 'Philippians 2:15', 2), (10, '1 Peter 2:12', 3), (10, 'Acts 5:2', 4),
  -- v11: Grace appeared
  (11, 'John 1:14', 1), (11, '2 Timothy 1:10', 2), (11, '1 Timothy 2:4', 3), (11, 'Ephesians 2:8', 4),
  -- v12: Denying ungodliness
  (12, 'Romans 6:1-2', 1), (12, '1 Peter 4:2-3', 2), (12, '1 John 2:15-17', 3), (12, 'Galatians 5:24', 4),
  -- v13: Blessed hope
  (13, '1 Thessalonians 4:16-17', 1), (13, '2 Peter 1:1', 2), (13, '2 Thessalonians 1:12', 3), (13, '1 John 3:2-3', 4),
  -- v14: Gave himself
  (14, 'Galatians 1:4', 1), (14, 'Galatians 2:20', 2), (14, 'Exodus 19:5', 3), (14, '1 Peter 2:9', 4),
  -- v15: Speak with authority
  (15, '1 Timothy 4:12', 1), (15, '2 Timothy 4:2', 2), (15, '1 Corinthians 16:11', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Titus' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Titus Chapter 2 Complete!
-- 15 verses · 7 key verses with word studies (19 words)
-- Cross-references for 14 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
