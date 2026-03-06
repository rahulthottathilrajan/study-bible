-- ═══════════════════════════════════════════════════
-- 1 TIMOTHY CHAPTER 2 — Prayer, the One Mediator, and Conduct in Worship
-- 15 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '1 Timothy 2 addresses the public worship of the church. Paul begins with an exhortation to pray ''for all men; for kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty'' (vv.1-2). The reason: ''God our Saviour ... will have all men to be saved, and to come unto the knowledge of the truth'' (vv.3-4). The theological foundation is the uniqueness of the mediator: ''For there is one God, and one mediator between God and men, the man Christ Jesus; who gave himself a ransom for all'' (vv.5-6). Paul then gives instructions regarding conduct in worship: ''I will therefore that men pray every where, lifting up holy hands, without wrath and doubting'' (v.8). Women are to adorn themselves ''in modest apparel, with shamefacedness and sobriety; not with broided hair, or gold, or pearls, or costly array; but (which becometh women professing godliness) with good works'' (vv.9-10). The chapter''s most debated passage follows: ''Let the woman learn in silence with all subjection. But I suffer not a woman to teach, nor to usurp authority over the man, but to be in silence'' (vv.11-12). Paul grounds his instruction in the creation order (v.13) and the fall (v.14), closing with the enigmatic statement about being ''saved in childbearing'' (v.15).',
  'Prayer for All, One Mediator, Worship Order',
  'μεσίτης (mesitēs)',
  'Mediator, go-between — one who stands between two parties to reconcile them. Christ is the one and only mediator between God and humanity, uniquely qualified because he is both God and man. This is the central theological statement of the chapter and the foundation for universal prayer.',
  '["Prayer for All People (vv.1-4): I exhort therefore that first of all supplications prayers intercessions and giving of thanks be made for all men; for kings and for all that are in authority that we may lead a quiet and peaceable life in all godliness and honesty; for this is good and acceptable in the sight of God our Saviour who will have all men to be saved and to come unto the knowledge of the truth","One God One Mediator (vv.5-7): For there is one God and one mediator between God and men the man Christ Jesus who gave himself a ransom for all to be testified in due time; whereunto I am ordained a preacher and an apostle I speak the truth in Christ and lie not a teacher of the Gentiles in faith and verity","Instructions for Men and Women in Worship (vv.8-15): I will therefore that men pray every where lifting up holy hands without wrath and doubting; in like manner also that women adorn themselves in modest apparel with shamefacedness and sobriety; let the woman learn in silence with all subjection; but I suffer not a woman to teach nor to usurp authority over the man; for Adam was first formed then Eve; notwithstanding she shall be saved in childbearing if they continue in faith and charity and holiness with sobriety"]'
FROM books b WHERE b.name = '1 Timothy';

-- Step 2: Insert all 15 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'I exhort therefore, that, first of all, supplications, prayers, intercessions, and giving of thanks, be made for all men;',
   'Παρακαλῶ οὖν πρῶτον πάντων ποιεῖσθαι δεήσεις προσευχάς ἐντεύξεις εὐχαριστίας ὑπὲρ πάντων ἀνθρώπων',
   'Parakalō oun prōton pantōn poieisthai deēseis proseuchas enteuxeis eucharistias hyper pantōn anthrōpōn',
   '''First of all'' (prōton pantōn — first in priority, the most important thing). Four types of prayer: (1) ''supplications'' (deēseis — requests arising from specific needs); (2) ''prayers'' (proseuchas — general prayer, communication with God); (3) ''intercessions'' (enteuxeis — petitions on behalf of others, appeals to a king; the word implies access to a person in authority); (4) ''giving of thanks'' (eucharistias — thanksgiving). ''For all men'' (hyper pantōn anthrōpōn) — prayer must be universal in scope, not limited to our own circle.',
   NULL),
  (2, 'For kings, and for all that are in authority; that we may lead a quiet and peaceable life in all godliness and honesty.',
   'ὑπὲρ βασιλέων καὶ πάντων τῶν ἐν ὑπεροχῇ ὄντων ἵνα ἤρεμον καὶ ἡσύχιον βίον διάγωμεν ἐν πάσῃ εὐσεβείᾳ καὶ σεμνότητι',
   'hyper basileōn kai pantōn tōn en hyperochē ontōn hina ēremon kai hēsychion bion diagōmen en pasē eusebeia kai semnotēti',
   '''Kings'' (basileōn — including the Roman emperor; at this time, Nero). ''In authority'' (en hyperochē — in a position of prominence). ''Quiet and peaceable'' (ēremon kai hēsychion — tranquil and undisturbed). ''Godliness'' (eusebeia — piety, devout reverence toward God; a key Pastoral Epistles word). ''Honesty'' (semnotēti — dignity, seriousness, respectability). The purpose of praying for rulers: not political power but conditions that allow for godly living. The church prays for peace so that the gospel can advance freely.',
   NULL),
  (3, 'For this is good and acceptable in the sight of God our Saviour;',
   'τοῦτο γὰρ καλὸν καὶ ἀπόδεκτον ἐνώπιον τοῦ σωτῆρος ἡμῶν θεοῦ',
   'touto gar kalon kai apodekton enōpion tou sōtēros hēmōn theou',
   '''Good and acceptable'' (kalon kai apodekton — morally beautiful and welcomed). ''God our Saviour'' (tou sōtēros hēmōn theou — the title from 1:1, emphasising God''s saving character). Prayer for all people is not merely a good idea but is specifically pleasing to God because of his saving nature (v.4).',
   NULL),
  (4, 'Who will have all men to be saved, and to come unto the knowledge of the truth.',
   'ὃς πάντας ἀνθρώπους θέλει σωθῆναι καὶ εἰς ἐπίγνωσιν ἀληθείας ἐλθεῖν',
   'hos pantas anthrōpous thelei sōthēnai kai eis epignōsin alētheias elthein',
   '''Will have'' (thelei — desires, wishes, wills). ''All men to be saved'' (pantas anthrōpous sōthēnai — all people to be rescued). ''Knowledge of the truth'' (epignōsin alētheias — full knowledge, deep personal apprehension of truth). God''s saving desire extends to all people without exception. Salvation involves two elements: being saved (from sin''s penalty and power) and coming to know the truth (intellectual and experiential).',
   'God''s universal saving desire: This verse teaches that God genuinely desires the salvation of all people. This is the basis for universal prayer (v.1) and universal gospel proclamation (v.7). The theological tension between God''s universal desire and the reality that not all are saved has been debated throughout church history. The verse at minimum establishes that God has no pleasure in anyone''s destruction and that the gospel offer is genuinely extended to all.'),
  (5, 'For there is one God, and one mediator between God and men, the man Christ Jesus;',
   'εἷς γὰρ θεός εἷς καὶ μεσίτης θεοῦ καὶ ἀνθρώπων ἄνθρωπος Χριστὸς Ἰησοῦς',
   'heis gar theos heis kai mesitēs theou kai anthrōpōn anthrōpos Christos Iēsous',
   '''One God'' (heis theos — monotheism, the foundation of Jewish and Christian faith; echoing the Shema, Deut 6:4). ''One mediator'' (heis mesitēs — one go-between, one intermediary). ''Between God and men'' (theou kai anthrōpōn — standing between the two parties). ''The man Christ Jesus'' (anthrōpos Christos Iēsous — emphasis on his humanity; he must be human to represent humans, and he must be divine to represent God). Christ alone bridges the gap between the holy God and sinful humanity. No other mediator is needed or possible.',
   'The one mediator: This verse makes an exclusive claim: there is one God and one mediator. The emphasis on ''the man Christ Jesus'' highlights that the mediator must share the nature of those he represents. Christ is uniquely qualified: as God, he can represent God to man; as man, he can represent man to God. This excludes all other proposed mediators — saints, angels, Mary, priests — and establishes direct access to God through Christ alone.'),
  (6, 'Who gave himself a ransom for all, to be testified in due time.',
   'ὁ δοὺς ἑαυτὸν ἀντίλυτρον ὑπὲρ πάντων τὸ μαρτύριον καιροῖς ἰδίοις',
   'ho dous heauton antilytron hyper pantōn to martyrion kairois idiois',
   '''Gave himself'' (dous heauton — voluntarily handed himself over; the self-giving of the mediator). ''Ransom'' (antilytron — a ransom paid in exchange for another; anti, in place of + lytron, a ransom price; used only here in the NT). ''For all'' (hyper pantōn — on behalf of all). ''In due time'' (kairois idiois — at the proper, appointed times). Christ''s self-giving is the ransom that frees captives. The ''anti-'' prefix emphasises substitution: he took our place.',
   NULL),
  (7, 'Whereunto I am ordained a preacher, and an apostle, (I speak the truth in Christ, and lie not;) a teacher of the Gentiles in faith and verity.',
   'εἰς ὃ ἐτέθην ἐγὼ κῆρυξ καὶ ἀπόστολος ἀλήθειαν λέγω ἐν Χριστῷ οὐ ψεύδομαι διδάσκαλος ἐθνῶν ἐν πίστει καὶ ἀληθείᾳ',
   'eis ho etethēn egō kēryx kai apostolos alētheian legō en Christō ou pseudomai didaskalos ethnōn en pistei kai alētheia',
   '''Ordained'' (etethēn — appointed, placed, set). ''Preacher'' (kēryx — herald, one who proclaims a king''s message publicly; not a dialogue but an authoritative announcement). ''Apostle'' (apostolos — a sent one, an authorised representative). ''Teacher of the Gentiles'' (didaskalos ethnōn — instructor of the nations). Three roles: herald, envoy, and teacher. Paul''s parenthetical oath (''I speak the truth ... and lie not'') emphasises the gravity of his commission to bring the gospel to all nations.',
   NULL),
  (8, 'I will therefore that men pray every where, lifting up holy hands, without wrath and doubting.',
   'Βούλομαι οὖν προσεύχεσθαι τοὺς ἄνδρας ἐν παντὶ τόπῳ ἐπαίροντας ὁσίους χεῖρας χωρὶς ὀργῆς καὶ διαλογισμοῦ',
   'Boulomai oun proseuchesthai tous andras en panti topō epairontas hosious cheiras chōris orgēs kai dialogismou',
   '''I will'' (boulomai — I desire, I determine). ''Men'' (tous andras — males specifically, as distinct from women in v.9). ''Every where'' (en panti topō — in every place; prayer is not confined to the temple). ''Lifting up holy hands'' (epairontas hosious cheiras — a common prayer posture in antiquity; the hands must be ''holy,'' i.e., clean, free from sin). ''Without wrath'' (chōris orgēs — anger disrupts prayer). ''Doubting'' (dialogismou — disputing, arguing, inner reasoning against God). Clean hands, calm hearts, and unquestioning trust — the prerequisites for effective prayer.',
   NULL),
  (9, 'In like manner also, that women adorn themselves in modest apparel, with shamefacedness and sobriety; not with broided hair, or gold, or pearls, or costly array;',
   'ὡσαύτως καὶ τὰς γυναῖκας ἐν καταστολῇ κοσμίῳ μετὰ αἰδοῦς καὶ σωφροσύνης κοσμεῖν ἑαυτάς μὴ ἐν πλέγμασιν ἢ χρυσῷ ἢ μαργαρίταις ἢ ἱματισμῷ πολυτελεῖ',
   'hōsautōs kai tas gynaikas en katastolē kosmiō meta aidous kai sōphrosynēs kosmein heautas mē en plegmasin ē chrysō ē margaritais ē himatismō polytelei',
   '''Modest apparel'' (katastolē kosmiō — well-ordered, respectable attire; kosmios means orderly, decent, proper). ''Shamefacedness'' (aidous — modesty, a sense of propriety, inner reserve). ''Sobriety'' (sōphrosynēs — self-control, sound-mindedness, sensible restraint). ''Broided hair, gold, pearls, costly array'' — not an absolute prohibition of all adornment but a warning against ostentatious display that draws attention to wealth rather than godliness. The principle: inner character over outward display.',
   NULL),
  (10, 'But (which becometh women professing godliness) with good works.',
   'ἀλλ᾽ ὃ πρέπει γυναιξὶν ἐπαγγελλομέναις θεοσέβειαν δι᾽ ἔργων ἀγαθῶν',
   'all'' ho prepei gynaixin epangellomenais theosebeian di'' ergōn agathōn',
   '''Professing godliness'' (epangellomenais theosebeian — publicly claiming devotion to God; theosebeia means God-reverence). ''Good works'' (ergōn agathōn — the true adornment of a godly woman). The contrast: external decoration versus internal character expressed through good deeds. The most beautiful adornment a woman can wear is a life of good works — visible evidence of her devotion to God.',
   NULL),
  (11, 'Let the woman learn in silence with all subjection.',
   'γυνὴ ἐν ἡσυχίᾳ μανθανέτω ἐν πάσῃ ὑποταγῇ',
   'gynē en hēsychia manthanetō en pasē hypotagē',
   '''Learn'' (manthanetō — let her learn; a positive command: women should learn! In the ancient world, this was progressive). ''In silence'' (en hēsychia — in quietness, in a calm and receptive disposition; not absolute muteness but a teachable, non-disruptive attitude; the same word is used of the ''quiet and peaceable life'' in v.2). ''With all subjection'' (en pasē hypotagē — in full submission to the teaching authority). The focus is on the manner of learning: quiet, receptive, submissive to instruction.',
   NULL),
  (12, 'But I suffer not a woman to teach, nor to usurp authority over the man, but to be in silence.',
   'γυναικὶ δὲ διδάσκειν οὐκ ἐπιτρέπω οὐδὲ αὐθεντεῖν ἀνδρός ἀλλ᾽ εἶναι ἐν ἡσυχίᾳ',
   'gynaiki de didaskein ouk epitrepō oude authentein andros all'' einai en hēsychia',
   '''I suffer not'' (ouk epitrepō — I do not permit; present tense: my ongoing practice). ''Teach'' (didaskein — to teach with authority; the context is authoritative doctrinal instruction in the gathered assembly). ''Usurp authority'' (authentein — to exercise authority, to domineer; a rare word used only here in the NT; its exact nuance is debated: it may mean ''to exercise authority'' positively or ''to domineer'' negatively). ''In silence'' (en hēsychia — in quietness, as in v.11). The restriction concerns the exercise of authoritative teaching and governing over men in the church assembly.',
   'Teaching and authority in the church: This passage is one of the most debated in the NT. Key interpretive questions: (1) Is this a universal principle or a context-specific instruction? (2) Does authentein mean legitimate authority or illegitimate domineering? (3) What is the scope — all teaching, or only authoritative doctrinal instruction? Paul grounds his instruction in creation (v.13), not culture, suggesting a principle that transcends the local situation. The passage has been understood differently across traditions, but all agree that both men and women serve Christ and the church in vital ways.'),
  (13, 'For Adam was first formed, then Eve.',
   'Ἀδὰμ γὰρ πρῶτος ἐπλάσθη εἶτα Εὕα',
   'Adam gar prōtos eplasthē eita Heua',
   '''First formed'' (prōtos eplasthē — first moulded, first created; eplasthē from plassō, to form from clay, Gen 2:7). ''Then Eve'' (eita Heua — afterward Eve). Paul appeals to the creation order, not cultural convention. The argument is not that Adam is superior but that the order of creation establishes a pattern of role distinction. This ground is theological (rooted in Genesis), not pragmatic (rooted in local circumstances).',
   NULL),
  (14, 'And Adam was not deceived, but the woman being deceived was in the transgression.',
   'καὶ Ἀδὰμ οὐκ ἠπατήθη ἡ δὲ γυνὴ ἀπατηθεῖσα ἐν παραβάσει γέγονεν',
   'kai Adam ouk ēpatēthē hē de gynē apatētheisa en parabasei gegonen',
   '''Not deceived'' (ouk ēpatēthē — Adam was not beguiled; he sinned deliberately, with open eyes). ''The woman being deceived'' (hē gynē apatētheisa — Eve was genuinely deceived by the serpent). ''In the transgression'' (en parabasei gegonen — has come to be in transgression; perfect tense: the effects continue). The point is not that women are more gullible but that the reversal of the creation order in the garden — Eve taking the lead in the encounter with the serpent while Adam passively followed — had disastrous consequences.',
   NULL),
  (15, 'Notwithstanding she shall be saved in childbearing, if they continue in faith and charity and holiness with sobriety.',
   'σωθήσεται δὲ διὰ τῆς τεκνογονίας ἐὰν μείνωσιν ἐν πίστει καὶ ἀγάπῃ καὶ ἁγιασμῷ μετὰ σωφροσύνης',
   'sōthēsetai de dia tēs teknogonias ean meinōsin en pistei kai agapē kai hagiasmō meta sōphrosynēs',
   '''Saved'' (sōthēsetai — will be saved/preserved; the meaning is debated). ''In childbearing'' (dia tēs teknogonias — through the childbearing; the article ''the'' may point to a specific childbearing). ''If they continue'' (ean meinōsin — if they abide, remain). Multiple interpretations: (1) saved through the birth of Christ (''the childbearing''); (2) preserved through the experience of bearing children; (3) saved in the sense of spiritual wholeness through fulfilling her role. ''Faith, charity, holiness, sobriety'' — the four qualities that characterise the godly woman and balance the entire chapter''s instruction.',
   'Saved through childbearing: This is perhaps the most difficult verse in the Pastoral Epistles. The most satisfying interpretations: (1) ''The childbearing'' (with the article) refers to the birth of Christ — woman, who was involved in the fall (v.14), is vindicated through the Incarnation; (2) women are preserved (sōzō can mean ''preserve'' or ''protect'') through the sphere of childbearing/domestic life as they continue in faith and love. The shift from singular (''she'') to plural (''they'') suggests the application broadens from Eve to all Christian women. The verse concludes on a note of hope, not restriction.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Timothy' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 4 (God desires all to be saved)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θέλει', 'thelei', 'G2309', 'Desires, wishes, wills — from thelō (to will, to desire). God''s will toward humanity is salvific: he genuinely desires that all people be saved. This is not a grudging concession but an active desire of God''s benevolent nature. The strength of thelō lies in its expression of God''s genuine inclination and heart-desire.', 1),
  ('ἐπίγνωσιν', 'epignōsin', 'G1922', 'Full knowledge, deep personal knowledge — from epi (upon, toward) + gnōsis (knowledge). Not merely intellectual awareness but experiential, relational knowledge. Salvation is not mere rescue but entry into a knowing relationship with the truth — ultimately with God himself through Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 5 (One mediator)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μεσίτης', 'mesitēs', 'G3316', 'Mediator, go-between, intermediary — from mesos (middle). One who stands in the middle between two estranged parties to reconcile them. Christ alone occupies this position: as God, he represents God; as man (anthrōpos), he represents humanity. No other being shares both natures and can therefore mediate between them.', 1),
  ('ἄνθρωπος', 'anthrōpos', 'G444', 'Man, human being — Paul emphasises Christ''s genuine humanity: ''the man Christ Jesus.'' The mediator must share the nature of those he represents. Christ''s humanity is not incidental but essential to his mediatorial work. He is the man (not an angel, not a spirit) who stands between God and men.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 2 AND v.verse_number = 5;

-- Verse 6 (Ransom for all)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀντίλυτρον', 'antilytron', 'G487', 'Ransom, substitute-ransom — from anti (in place of, in exchange for) + lytron (ransom price). Used only here in the NT. The anti- prefix explicitly conveys substitution: Christ gave himself as a ransom in exchange for all. He took our place, paying the price we owed but could never pay.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 2 AND v.verse_number = 6;

-- Verse 12 (Teach nor usurp authority)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('αὐθεντεῖν', 'authentein', 'G831', 'To exercise authority, to have authority over, to domineer — a rare word, used only here in the NT. Its exact meaning is heavily debated: it may denote legitimate authority exercise or illegitimate domination. Etymologically related to authentes (one who acts on his own authority). The rarity of the word makes definitive conclusions difficult; context and the parallel with didaskein (teach) suggest the exercise of governing authority.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 2 AND v.verse_number = 12;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Pray for all men
  (1, 'Philippians 4:6', 1), (1, 'James 5:16', 2),
  -- v2: Pray for kings
  (2, 'Jeremiah 29:7', 1), (2, 'Romans 13:1-2', 2),
  -- v4: God desires all to be saved
  (4, '2 Peter 3:9', 1), (4, 'Ezekiel 18:23', 2), (4, 'John 3:16', 3),
  -- v5: One God, one mediator
  (5, 'Deuteronomy 6:4', 1), (5, 'John 14:6', 2), (5, 'Hebrews 8:6', 3), (5, 'Hebrews 9:15', 4),
  -- v6: Ransom for all
  (6, 'Matthew 20:28', 1), (6, 'Mark 10:45', 2), (6, 'Titus 2:14', 3),
  -- v8: Holy hands
  (8, 'Psalm 141:2', 1), (8, 'Psalm 24:3-4', 2),
  -- v9: Modest apparel
  (9, '1 Peter 3:3-4', 1),
  -- v12: Not suffer a woman to teach
  (12, '1 Corinthians 14:34-35', 1),
  -- v13: Adam first formed
  (13, 'Genesis 2:7', 1), (13, 'Genesis 2:21-22', 2), (13, '1 Corinthians 11:8-9', 3),
  -- v14: Woman being deceived
  (14, 'Genesis 3:6', 1), (14, '2 Corinthians 11:3', 2),
  -- v15: Saved in childbearing
  (15, 'Genesis 3:15-16', 1)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Timothy Chapter 2 Complete
-- 15 verses · 4 key verses with word studies (7 words)
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
