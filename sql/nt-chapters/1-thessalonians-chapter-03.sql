-- ═══════════════════════════════════════════════════
-- 1 THESSALONIANS CHAPTER 3 — Timothy's Report and Paul's Prayer
-- 13 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '1 Thessalonians 3 reveals the intensity of Paul''s pastoral concern. Unable to bear the suspense about the young church''s survival under persecution, Paul sent Timothy from Athens to Thessalonica to strengthen and encourage them (vv.1-5). Timothy has now returned with the good news that their faith and love remain strong (v.6). Paul''s relief is overwhelming — their steadfastness is his very life: ''now we live, if ye stand fast in the Lord'' (v.8). The chapter closes with one of Paul''s great prayers, asking God to direct his path back to them and to make them abound in love, establishing their hearts ''unblameable in holiness'' at the coming of Christ with all His saints (v.13). This prayer anticipates the great eschatological passages of chapters 4-5.',
  'Pastoral Anxiety, Joyful Relief, and a Prayer for Holiness',
  'στήκετε (stēkete)',
  'Stand fast, stand firm — from histēmi (to stand). The present tense commands ongoing, habitual firmness. Believers stand not by their own strength but in the Lord.',
  '["Timothy Sent to Strengthen Them (vv.1-5): We could not bear it; left alone in Athens; sent Timothy to establish you; that no man be moved by afflictions; we told you before we should suffer tribulation","Timothy''s Joyful Report (vv.6-8): Timothy returned with good tidings of your faith and love; ye have good remembrance of us; we were comforted in our affliction by your faith; now we live if ye stand fast","Overflowing Gratitude and Prayer (vv.9-13): What thanks can we render to God; praying night and day to see you; God direct our way; the Lord make you to increase in love; establish your hearts unblameable in holiness at the coming of the Lord Jesus with all his saints"]'
FROM books b WHERE b.name = '1 Thessalonians';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Wherefore when we could no longer forbear, we thought it good to be left at Athens alone;',
   'Διὸ μηκέτι στέγοντες εὐδοκήσαμεν καταλειφθῆναι ἐν Ἀθήναις μόνοι',
   'Dio mēketi stegontes eudokēsamen kataleiphthēnai en Athēnais monoi',
   '''Could no longer forbear'' (mēketi stegontes — no longer able to cover, contain, hold in; from stegō, to cover, to endure by concealing anxiety). Paul''s concern for the Thessalonians was bursting out of him like pressure from a sealed vessel. ''Left at Athens alone'' (kataleiphthēnai en Athēnais monoi — abandoned, left behind, deserted in Athens). Paul was willing to face Athens — the intellectual capital of the world — completely alone, just to get news about Thessalonica. Self-sacrifice for the sake of others'' faith.',
   NULL),
  (2,
   'And sent Timotheus, our brother, and minister of God, and our fellowlabourer in the gospel of Christ, to establish you, and to comfort you concerning your faith:',
   'καὶ ἐπέμψαμεν Τιμόθεον τὸν ἀδελφὸν ἡμῶν καὶ διάκονον τοῦ θεοῦ καὶ συνεργὸν ἡμῶν ἐν τῷ εὐαγγελίῳ τοῦ Χριστοῦ εἰς τὸ στηρίξαι ὑμᾶς καὶ παρακαλέσαι ὑπὲρ τῆς πίστεως ὑμῶν',
   'kai epempsamen Timotheon ton adelphon hēmōn kai diakonon tou theou kai synergon hēmōn en tō euangeliō tou Christou eis to stērixai hymas kai parakalesai hyper tēs pisteōs hymōn',
   'Timothy receives three titles: (1) ''brother'' (adelphon — a peer in the faith), (2) ''minister of God'' (diakonon tou theou — servant, one who actively serves God), (3) ''fellowlabourer'' (synergon — co-worker, partner in labour). Two purposes: ''establish'' (stērixai — strengthen, make firm, set solidly; from stērizō) and ''comfort'' (parakalesai — encourage, exhort, come alongside). Young believers under persecution need both strengthening and encouragement.',
   NULL),
  (3,
   'That no man should be moved by these afflictions: for yourselves know that we are appointed thereunto.',
   'τὸ μηδένα σαίνεσθαι ἐν ταῖς θλίψεσιν ταύταις αὐτοὶ γὰρ οἴδατε ὅτι εἰς τοῦτο κείμεθα',
   'to mēdena sainesthai en tais thlipsesin tautais autoi gar oidate hoti eis touto keimetha',
   '''Moved'' (sainesthai — to wag the tail (of a dog), hence to fawn upon, to beguile, to be disturbed, shaken, or enticed away; used only here in the NT). The image may be of a dog being lured away or of someone being unsettled by flattering promises of an easier path. ''Appointed'' (keimetha — set, placed, destined; we are positioned for this by God''s design). Affliction is not an accident or a sign of God''s displeasure — it is the Christian''s appointed lot.',
   'The Christian and suffering: Paul teaches that tribulation is not an abnormality but an appointment. ''We are appointed thereunto'' (eis touto keimetha) — suffering is part of the divine plan for believers in this age. This is not fatalism but sovereign purpose. Affliction tests, refines, and proves genuine faith (cf. 1 Pet 1:6-7; Acts 14:22).'),
  (4,
   'For verily, when we were with you, we told you before that we should suffer tribulation; even as it came to pass, and ye know.',
   'καὶ γὰρ ὅτε πρὸς ὑμᾶς ἦμεν προελέγομεν ὑμῖν ὅτι μέλλομεν θλίβεσθαι καθὼς καὶ ἐγένετο καὶ οἴδατε',
   'kai gar hote pros hymas ēmen proelegomen hymin hoti mellomen thlibesthai kathōs kai egeneto kai oidate',
   '''Told you before'' (proelegomen — we were telling you in advance, we kept warning; imperfect tense: repeated warnings, not just once). ''We should suffer tribulation'' (mellomen thlibesthai — we are about to be pressed, squeezed). Paul did not promise the Thessalonians an easy life. He warned them repeatedly that suffering would come. ''Even as it came to pass'' — the prediction was fulfilled exactly. Honest gospel preaching includes the cost of discipleship.',
   NULL),
  (5,
   'For this cause, when I could no longer forbear, I sent to know your faith, lest by some means the tempter have tempted you, and our labour be in vain.',
   'διὰ τοῦτο κἀγὼ μηκέτι στέγων ἔπεμψα εἰς τὸ γνῶναι τὴν πίστιν ὑμῶν μή πως ἐπείρασεν ὑμᾶς ὁ πειράζων καὶ εἰς κενὸν γένηται ὁ κόπος ἡμῶν',
   'dia touto kagō mēketi stegōn epempsa eis to gnōnai tēn pistin hymōn mē pōs epeirasen hymas ho peirazōn kai eis kenon genētai ho kopos hēmōn',
   '''I'' (kagō — now singular, Paul speaks personally; cf. the ''we'' of vv.1-2). ''The tempter'' (ho peirazōn — the one who tests, the one who tempts; a title for Satan, cf. Matt 4:3). Paul feared Satan would exploit their suffering to destroy their faith. ''In vain'' (eis kenon — into emptiness, to no purpose). The apostle''s deepest fear was not personal suffering but that his labour would prove fruitless because his converts had fallen away under pressure.',
   NULL),
  (6,
   'But now when Timotheus came from you unto us, and brought us good tidings of your faith and charity, and that ye have good remembrance of us always, desiring greatly to see us, as we also to see you:',
   'ἄρτι δὲ ἐλθόντος Τιμοθέου πρὸς ἡμᾶς ἀφ᾽ ὑμῶν καὶ εὐαγγελισαμένου ἡμῖν τὴν πίστιν καὶ τὴν ἀγάπην ὑμῶν καὶ ὅτι ἔχετε μνείαν ἡμῶν ἀγαθὴν πάντοτε ἐπιποθοῦντες ἡμᾶς ἰδεῖν καθάπερ καὶ ἡμεῖς ὑμᾶς',
   'arti de elthontos Timotheou pros hēmas aph'' hymōn kai euangelisamenou hēmin tēn pistin kai tēn agapēn hymōn kai hoti echete mneian hēmōn agathēn pantote epipothountes hēmas idein kathaper kai hēmeis hymas',
   '''Good tidings'' (euangelisamenou — evangelised us, brought us gospel; Paul uses the word for gospel proclamation to describe Timothy''s report — the news of their faithfulness was that good). Two great virtues confirmed: ''faith'' (pistin) and ''charity'' (agapēn — love). The third member of the triad (hope) will be addressed in chapters 4-5. ''Desiring greatly to see us'' (epipothountes hēmas idein — longing intensely to see us). The affection was mutual and deep.',
   NULL),
  (7,
   'Therefore, brethren, we were comforted over you in all our affliction and distress by your faith:',
   'διὰ τοῦτο παρεκλήθημεν ἀδελφοί ἐφ᾽ ὑμῖν ἐπὶ πάσῃ τῇ ἀνάγκῃ καὶ θλίψει ἡμῶν διὰ τῆς ὑμῶν πίστεως',
   'dia touto pareklēthēmen adelphoi eph'' hymin epi pasē tē anankē kai thlipsei hēmōn dia tēs hymōn pisteōs',
   '''Comforted'' (pareklēthēmen — encouraged, consoled; aorist passive: we were dramatically comforted). ''Affliction and distress'' (anankē kai thlipsei — necessity/compulsion and pressure/tribulation; two words for suffering piled together). Paul was himself suffering (probably the hardships of ministry in Corinth, cf. Acts 18:5-10), yet the Thessalonians'' faithfulness lifted him out of his own distress. Ministry is reciprocal: the pastor strengthens the people, and the people''s faith strengthens the pastor.',
   NULL),
  (8,
   'For now we live, if ye stand fast in the Lord.',
   'ὅτι νῦν ζῶμεν ἐὰν ὑμεῖς στήκετε ἐν κυρίῳ',
   'hoti nyn zōmen ean hymeis stēkete en kyriō',
   '''Now we live'' (nyn zōmen — now we are alive, now we truly live; present tense: we keep on living). This is not merely survival but vitality — Paul feels fully alive when his converts stand firm. ''Stand fast'' (stēkete — stand firm, hold your ground; present tense: keep on standing). ''In the Lord'' (en kyriō — the sphere of their standing is not self-reliance but Christ). Paul''s spiritual vitality was bound up with theirs. A pastor''s life force flows from the faithfulness of those he has led to Christ.',
   NULL),
  (9,
   'For what thanks can we render to God again for you, for all the joy wherewith we joy for your sakes before our God;',
   'τίνα γὰρ εὐχαριστίαν δυνάμεθα τῷ θεῷ ἀνταποδοῦναι περὶ ὑμῶν ἐπὶ πάσῃ τῇ χαρᾷ ᾗ χαίρομεν δι᾽ ὑμᾶς ἔμπροσθεν τοῦ θεοῦ ἡμῶν',
   'tina gar eucharistian dynametha tō theō antapodounai peri hymōn epi pasē tē chara hē chairomen di'' hymas emprosthen tou theou hēmōn',
   '''What thanks'' (tina eucharistian — what adequate thanksgiving; the question implies: no thanksgiving is sufficient). ''Render'' (antapodounai — give back in return, repay). Paul cannot repay God enough for the joy the Thessalonians bring him. ''All the joy'' (pasē tē chara — every kind of joy, the totality of joy). ''Before our God'' (emprosthen tou theou — in the presence of God). This overflowing gratitude is not performed for the Thessalonians'' benefit but poured out in God''s presence.',
   NULL),
  (10,
   'Night and day praying exceedingly that we might see your face, and might perfect that which is lacking in your faith?',
   'νυκτὸς καὶ ἡμέρας ὑπερεκπερισσοῦ δεόμενοι εἰς τὸ ἰδεῖν ὑμῶν τὸ πρόσωπον καὶ καταρτίσαι τὰ ὑστερήματα τῆς πίστεως ὑμῶν',
   'nyktos kai hēmeras hyperekperissou deomenoi eis to idein hymōn to prosōpon kai katartisai ta hysterēmata tēs pisteōs hymōn',
   '''Exceedingly'' (hyperekperissou — super-abundantly, beyond all measure; a triple compound: hyper + ek + perissos — a superlative heaped upon a superlative, found only in Paul). ''Perfect'' (katartisai — to mend, restore, complete, equip; used for mending fishing nets in Matt 4:21 — repairing what is broken and supplying what is missing). ''Lacking'' (hysterēmata — deficiencies, shortcomings). Their faith was genuine but young. Paul wanted to fill the gaps, mend the weak spots, and bring their understanding to maturity.',
   NULL),
  (11,
   'Now God himself and our Father, and our Lord Jesus Christ, direct our way unto you.',
   'Αὐτὸς δὲ ὁ θεὸς καὶ πατὴρ ἡμῶν καὶ ὁ κύριος ἡμῶν Ἰησοῦς κατευθύναι τὴν ὁδὸν ἡμῶν πρὸς ὑμᾶς',
   'Autos de ho theos kai patēr hēmōn kai ho kyrios hēmōn Iēsous kateuthynai tēn hodon hēmōn pros hymas',
   '''Direct'' (kateuthynai — make straight, clear the path, remove obstacles; aorist optative: a prayer wish). Two persons named — ''God and our Father'' and ''our Lord Jesus Christ'' — yet the verb is singular (kateuthynai, not kateuthynaien), treating Father and Son as a unity of action. ''Our way'' (tēn hodon — the road, the path). Since Satan had blocked the way (2:18), Paul asks God to overrule and open it.',
   'The deity of Christ: The singular verb (kateuthynai) with two subjects (God the Father and the Lord Jesus) implies unity of being and action. Paul naturally coordinates the Father and the Son as co-equal agents of a single divine act. This incidental grammar is powerful evidence of early Christology.'),
  (12,
   'And the Lord make you to increase and abound in love one toward another, and toward all men, even as we do toward you:',
   'ὑμᾶς δὲ ὁ κύριος πλεονάσαι καὶ περισσεύσαι τῇ ἀγάπῃ εἰς ἀλλήλους καὶ εἰς πάντας καθάπερ καὶ ἡμεῖς εἰς ὑμᾶς',
   'hymas de ho kyrios pleonasai kai perisseusai tē agapē eis allēlous kai eis pantas kathaper kai hēmeis eis hymas',
   '''Increase'' (pleonasai — make to abound, multiply, cause to grow) and ''abound'' (perisseusai — overflow, superabound). Two words for growing heaped together: not just more love but overflowing love. Two directions: ''one toward another'' (eis allēlous — within the church) and ''toward all men'' (eis pantas — toward outsiders, even persecutors). Paul''s own love is the model: ''even as we do toward you.'' Christian love is not selective or tribal — it spills beyond church walls.',
   NULL),
  (13,
   'To the end he may stablish your hearts unblameable in holiness before God, even our Father, at the coming of our Lord Jesus Christ with all his saints.',
   'εἰς τὸ στηρίξαι ὑμῶν τὰς καρδίας ἀμέμπτους ἐν ἁγιωσύνῃ ἔμπροσθεν τοῦ θεοῦ καὶ πατρὸς ἡμῶν ἐν τῇ παρουσίᾳ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μετὰ πάντων τῶν ἁγίων αὐτοῦ',
   'eis to stērixai hymōn tas kardias amemptous en hagiōsynē emprosthen tou theou kai patros hēmōn en tē parousia tou kyriou hēmōn Iēsou Christou meta pantōn tōn hagiōn autou',
   '''Stablish'' (stērixai — make firm, fix solidly, strengthen). ''Unblameable'' (amemptous — without blame, beyond reproach). ''In holiness'' (en hagiōsynē — in the state of being set apart for God; one of only three NT occurrences: here, Rom 1:4, 2 Cor 7:1). ''Before God'' — the standard is not human opinion but God''s scrutiny. ''At the coming'' (en tē parousia — at the royal arrival). ''With all his saints'' (meta pantōn tōn hagiōn — with all His holy ones). This prayer looks forward to the Parousia and asks God to keep them blameless until that day.',
   'Sanctification and the Second Coming: This verse ties holiness directly to eschatology. The goal of sanctification is to be found ''unblameable'' at Christ''s coming. The Christian life is not merely about present morality but about readiness for the returning King. ''All his saints'' may include both angels and departed believers who return with Christ.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 3 (Moved by afflictions)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σαίνεσθαι', 'sainesthai', 'G4525', 'To be shaken, disturbed, beguiled — originally to wag the tail (of a dog), then to fawn upon or entice. Used only here in the NT. Paul warns against being lured away from faith by the prospect of an easier life.', 1),
  ('κείμεθα', 'keimetha', 'G2749', 'We are appointed, set, placed, destined — believers are positioned by God for tribulation. Suffering is not accidental but sovereignly ordained as part of the Christian calling.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 3;

-- Verse 5 (The tempter)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πειράζων', 'peirazōn', 'G3985', 'The tempter, the one who tests — a title for Satan (cf. Matt 4:3). He exploits suffering to induce believers to abandon faith. Present participle: tempting is his ongoing activity.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 5;

-- Verse 8 (Stand fast)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στήκετε', 'stēkete', 'G4739', 'Stand fast, stand firm, hold your ground — present tense: keep on standing. From histēmi (to cause to stand). A military metaphor: hold the position, do not retreat. The sphere of standing is ''in the Lord.''', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 8;

-- Verse 10 (Perfect what is lacking)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερεκπερισσοῦ', 'hyperekperissou', 'G5228+G1537+G4053', 'Super-abundantly, exceedingly beyond measure — a triple compound unique to Paul. The most extravagant adverb available, expressing prayer intensity that overflows all normal limits.', 1),
  ('καταρτίσαι', 'katartisai', 'G2675', 'To mend, restore, complete, equip — used for mending nets (Matt 4:21) and setting broken bones. To repair what is torn and supply what is missing. Faith can be genuine yet incomplete.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 13 (Unblameable in holiness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἁγιωσύνῃ', 'hagiōsynē', 'G42', 'Holiness, the quality of being holy — one of only three NT uses (Rom 1:4; 2 Cor 7:1). Not merely moral purity but the state of being consecrated, set apart for God. The goal toward which the entire Christian life moves.', 1),
  ('παρουσίᾳ', 'parousia', 'G3952', 'Coming, presence, royal arrival — the second of four uses in 1 Thessalonians. The official visit of the King. The Parousia is the event toward which all sanctification aims: to be found blameless when He arrives.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = 13;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Left alone in Athens
  (1, 'Acts 17:15-16', 1), (1, 'Acts 18:5', 2),
  -- v2: Sent Timothy to establish
  (2, 'Acts 16:1-3', 1), (2, 'Philippians 2:19-22', 2),
  -- v3: Appointed to affliction
  (3, 'Acts 14:22', 1), (3, 'John 16:33', 2), (3, '2 Timothy 3:12', 3),
  -- v5: The tempter
  (5, 'Matthew 4:3', 1), (5, '1 Corinthians 7:5', 2), (5, '2 Corinthians 2:11', 3),
  -- v6: Good tidings of faith and love
  (6, 'Acts 18:5', 1), (6, 'Proverbs 25:25', 2),
  -- v8: Stand fast in the Lord
  (8, 'Philippians 4:1', 1), (8, '1 Corinthians 16:13', 2), (8, 'Galatians 5:1', 3),
  -- v10: Perfect what is lacking
  (10, '2 Corinthians 13:9', 1), (10, 'Colossians 1:28', 2), (10, 'Hebrews 13:21', 3),
  -- v11: Direct our way
  (11, 'Proverbs 3:5-6', 1), (11, '2 Thessalonians 3:5', 2),
  -- v12: Abound in love
  (12, 'Philippians 1:9-10', 1), (12, '1 Thessalonians 4:9-10', 2), (12, '1 Peter 1:22', 3),
  -- v13: Unblameable at His coming
  (13, '1 Thessalonians 5:23', 1), (13, '1 Corinthians 1:8', 2), (13, 'Jude 1:24', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Thessalonians Chapter 3 Complete
-- 13 verses · 5 key verses with word studies (9 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════