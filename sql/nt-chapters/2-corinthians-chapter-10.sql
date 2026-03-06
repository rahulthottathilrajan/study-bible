-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 10 — Spiritual Warfare and Apostolic Authority
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 10,
  '2 Corinthians 10 marks a dramatic shift in tone. Chapters 10-13 constitute Paul''s most vigorous defense of his apostolic authority against his opponents at Corinth. Paul begins with an appeal ''by the meekness and gentleness of Christ'' (v.1) but warns: ''I beseech you, that I may not be bold when I am present with that confidence, wherewith I think to be bold against some'' (v.2). His warfare is spiritual, not carnal: ''the weapons of our warfare are not carnal, but mighty through God to the pulling down of strong holds; casting down imaginations, and every high thing that exalteth itself against the knowledge of God, and bringing into captivity every thought to the obedience of Christ'' (vv.4-5). Paul addresses the charge that he is bold in letters but weak in person: ''his letters, say they, are weighty and powerful; but his bodily presence is weak, and his speech contemptible'' (v.10). He refuses to compare himself with the self-commending opponents: ''they measuring themselves by themselves, and comparing themselves among themselves, are not wise'' (v.12). Paul will boast only within the measure God has assigned: ''not boasting of things without our measure … but having hope, when your faith is increased, that we shall be enlarged by you according to our rule abundantly'' (vv.15-16). The chapter closes with the principle: ''he that glorieth, let him glory in the Lord. For not he that commendeth himself is approved, but whom the Lord commendeth'' (vv.17-18).',
  'Spiritual Warfare, Casting Down Strongholds',
  'λογισμός (logismos)',
  'Reasoning, argument, thought-fortress — from logizomai (to reckon, to calculate). Strongholds of wrong thinking, ideological fortresses that resist the knowledge of God. Paul''s warfare targets not physical enemies but the entrenched thought-systems, arguments, and intellectual pretensions that prevent obedience to Christ.',
  '["Meekness with Authority (vv.1-2): Now I Paul myself beseech you by the meekness and gentleness of Christ who in presence am base among you but being absent am bold toward you but I beseech you that I may not be bold when I am present with that confidence wherewith I think to be bold against some which think of us as if we walked according to the flesh","Spiritual Weapons and Casting Down Strongholds (vv.3-6): For though we walk in the flesh we do not war after the flesh for the weapons of our warfare are not carnal but mighty through God to the pulling down of strong holds casting down imaginations and every high thing that exalteth itself against the knowledge of God and bringing into captivity every thought to the obedience of Christ and having in a readiness to revenge all disobedience when your obedience is fulfilled","Bold in Letters Weak in Presence (vv.7-11): Do ye look on things after the outward appearance if any man trust to himself that he is Christ''s let him of himself think this again that as he is Christ''s even so are we Christ''s; for though I should boast somewhat more of our authority which the Lord hath given us for edification and not for your destruction I should not be ashamed; that I may not seem as if I would terrify you by letters; for his letters say they are weighty and powerful but his bodily presence is weak and his speech contemptible; let such an one think this that such as we are in word by letters when we are absent such will we be also in deed when we are present","The True Measure of Boasting (vv.12-18): For we dare not make ourselves of the number or compare ourselves with some that commend themselves but they measuring themselves by themselves and comparing themselves among themselves are not wise; but we will not boast of things without our measure but according to the measure of the rule which God hath distributed to us a measure to reach even unto you; he that glorieth let him glory in the Lord for not he that commendeth himself is approved but whom the Lord commendeth"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now I Paul myself beseech you by the meekness and gentleness of Christ, who in presence am base among you, but being absent am bold toward you:',
   'Αὐτὸς δὲ ἐγὼ Παῦλος παρακαλῶ ὑμᾶς διὰ τῆς πραΰτητος καὶ ἐπιεικείας τοῦ Χριστοῦ ὃς κατὰ πρόσωπον μὲν ταπεινὸς ἐν ὑμῖν ἀπὼν δὲ θαρρῶ εἰς ὑμᾶς',
   'Autos de egō Paulos parakalō hymas dia tēs prautētos kai epieikias tou Christou hos kata prosōpon men tapeinos en hymin apōn de tharrō eis hymas',
   '''I Paul myself'' (autos egō Paulos — emphatic: Paul speaks in his own person now). ''Meekness'' (prautētos — gentle strength under control). ''Gentleness'' (epieikias — sweet reasonableness, forbearance, magnanimity). Both are qualities of Christ himself, which Paul imitates. ''Base among you'' (tapeinos — humble, lowly; Paul''s opponents used this as an insult: he is timid in person). ''Bold when absent'' — the charge: Paul is a paper tiger, brave only in letters. Paul ironically quotes the accusation before demolishing it.',
   NULL),
  (2, 'But I beseech you, that I may not be bold when I am present with that confidence, wherewith I think to be bold against some, which think of us as if we walked according to the flesh.',
   'δέομαι δὲ τὸ μὴ παρὼν θαρρῆσαι τῇ πεποιθήσει ᾗ λογίζομαι τολμῆσαι ἐπί τινας τοὺς λογιζομένους ἡμᾶς ὡς κατὰ σάρκα περιπατοῦντας',
   'deomai de to mē parōn tharrēsai tē pepoithēsei hē logizomai tolmēsai epi tinas tous logizomenous hēmas hōs kata sarka peripatountas',
   '''That I may not be bold'' — Paul hopes he won''t need to use his authority harshly when he arrives. ''According to the flesh'' (kata sarka — by worldly standards; the opponents charge that Paul operates by human methods, not spiritual power). Paul''s response will show that his warfare is indeed spiritual, but therefore more powerful, not less.',
   NULL),
  (3, 'For though we walk in the flesh, we do not war after the flesh:',
   'ἐν σαρκὶ γὰρ περιπατοῦντες οὐ κατὰ σάρκα στρατευόμεθα',
   'en sarki gar peripatountes ou kata sarka strateuometha',
   '''Walk in the flesh'' (en sarki peripatountes — we live in physical bodies, in the human condition). ''War after the flesh'' (ou kata sarka strateuometha — we do not wage war according to fleshly methods). The distinction is critical: Paul is human (en sarki) but does not fight with human weapons (kata sarka). His warfare transcends the merely human while being conducted within the human sphere.',
   NULL),
  (4, '(For the weapons of our warfare are not carnal, but mighty through God to the pulling down of strong holds;)',
   'τὰ γὰρ ὅπλα τῆς στρατείας ἡμῶν οὐ σαρκικὰ ἀλλὰ δυνατὰ τῷ θεῷ πρὸς καθαίρεσιν ὀχυρωμάτων',
   'ta gar hopla tēs strateias hēmōn ou sarkika alla dynata tō theō pros kathairesin ochyrōmatōn',
   '''Weapons'' (hopla — arms, instruments of warfare; cf. 6:7). ''Warfare'' (strateias — military campaign). ''Not carnal'' (ou sarkika — not fleshly, not belonging to the realm of mere human power). ''Mighty through God'' (dynata tō theō — powerful for God, divinely empowered). ''Pulling down'' (kathairesin — demolition, tearing down). ''Strongholds'' (ochyrōmatōn — fortified positions, fortresses). The imagery is military siege: God''s weapons demolish entrenched enemy positions. These strongholds are not physical but intellectual and spiritual — fortified systems of thought that resist God.',
   'This verse is foundational for understanding spiritual warfare in the Pauline framework. The ''weapons'' are not specified here (cf. Eph 6:13-18 for the full armour) but are described by their effect: they demolish strongholds. The ''strongholds'' (ochyrōmata) are not demons or physical structures but entrenched patterns of thinking — ideological fortresses, argumentative positions, and intellectual pretensions that oppose the knowledge of God (v.5). Spiritual warfare, for Paul, is primarily a battle for the mind, conducted with divinely empowered truth against humanly constructed falsehood.'),
  (5, 'Casting down imaginations, and every high thing that exalteth itself against the knowledge of God, and bringing into captivity every thought to the obedience of Christ;',
   'λογισμοὺς καθαιροῦντες καὶ πᾶν ὕψωμα ἐπαιρόμενον κατὰ τῆς γνώσεως τοῦ θεοῦ καὶ αἰχμαλωτίζοντες πᾶν νόημα εἰς τὴν ὑπακοὴν τοῦ Χριστοῦ',
   'logismous kathairountes kai pan hypsōma epairomenon kata tēs gnōseōs tou theou kai aichmalōtizontes pan noēma eis tēn hypakoēn tou Christou',
   '''Imaginations'' (logismous — reasonings, arguments, calculated thoughts; the plural suggests systematic intellectual constructions). ''Casting down'' (kathairountes — demolishing, tearing down). ''Every high thing'' (pan hypsōma — every elevated structure; anything that lifts itself up). ''Against the knowledge of God'' (kata tēs gnōseōs tou theou — in opposition to the knowledge of God). ''Bringing into captivity'' (aichmalōtizontes — taking prisoner of war). ''Every thought'' (pan noēma — every mental construct, every product of the mind). ''Obedience of Christ'' — the destination of captured thoughts: submission to Christ''s authority. The war is for the mind; the victory is when every thought submits to Christ.',
   'This verse describes the most comprehensive intellectual and spiritual operation in the NT. Three actions: (1) demolishing arguments (logismous) — tearing down the fortified reasoning that opposes God; (2) tearing down every pretension (hypsōma) — every arrogant claim that elevates itself against divine knowledge; (3) capturing every thought (noēma) — taking prisoner every product of the mind and redirecting it to obey Christ. This is not anti-intellectualism but the most radical intellectualism: every thought, every reasoning, every idea must be brought under Christ''s lordship. The Christian mind is not closed but captive — captive to Christ.'),
  (6, 'And having in a readiness to revenge all disobedience, when your obedience is fulfilled.',
   'καὶ ἐν ἑτοίμῳ ἔχοντες ἐκδικῆσαι πᾶσαν παρακοήν ὅταν πληρωθῇ ὑμῶν ἡ ὑπακοή',
   'kai en hetoimō echontes ekdikēsai pasan parakoēn hotan plērōthē hymōn hē hypakoē',
   '''In a readiness'' (en hetoimō — in prepared state, standing ready). ''Revenge'' (ekdikēsai — to punish, to bring justice upon). ''All disobedience'' (pasan parakoēn — every act of disobedience). ''When your obedience is fulfilled'' — Paul waits for the loyal Corinthians'' obedience to be complete before punishing the remaining rebels. Pastoral wisdom: he distinguishes between the repentant majority and the recalcitrant minority, dealing with each appropriately.',
   NULL),
  (7, 'Do ye look on things after the outward appearance? If any man trust to himself that he is Christ''s, let him of himself think this again, that, as he is Christ''s, even so are we Christ''s.',
   'τὰ κατὰ πρόσωπον βλέπετε εἴ τις πέποιθεν ἑαυτῷ Χριστοῦ εἶναι τοῦτο λογιζέσθω πάλιν ἀφ᾿ ἑαυτοῦ ὅτι καθὼς αὐτὸς Χριστοῦ οὕτως καὶ ἡμεῖς Χριστοῦ',
   'ta kata prosōpon blepete ei tis pepoithen heautō Christou einai touto logizesthō palin aph'' heautou hoti kathōs autos Christou houtōs kai hēmeis Christou',
   '''Outward appearance'' (kata prosōpon — according to the face/surface). ''Trust to himself that he is Christ''s'' — the opponents claimed a special relationship with Christ (perhaps as ''super-apostles'' or direct appointees). Paul''s response: any claim they make applies equally to him. ''As he is Christ''s, even so are we Christ''s'' — Paul does not deny their Christianity but asserts equal standing.',
   NULL),
  (8, 'For though I should boast somewhat more of our authority, which the Lord hath given us for edification, and not for your destruction, I should not be ashamed:',
   'ἐάν τε γὰρ περισσότερόν τι καυχήσωμαι περὶ τῆς ἐξουσίας ἡμῶν ἧς ἔδωκεν ὁ κύριος ἡμῖν εἰς οἰκοδομὴν καὶ οὐκ εἰς καθαίρεσιν ὑμῶν οὐκ αἰσχυνθήσομαι',
   'ean te gar perissoteron ti kauchēsōmai peri tēs exousias hēmōn hēs edōken ho kyrios hēmin eis oikodomēn kai ouk eis kathairesin hymōn ouk aischynthēsomai',
   '''Authority'' (exousias — right, power, authorization). ''Given by the Lord'' — Paul''s authority is delegated, not self-assumed. ''For edification, not for destruction'' (eis oikodomēn kai ouk eis kathairesin — for building up, not for tearing down). Apostolic authority has a purpose: construction, not demolition. Even when Paul exercises discipline, it aims to build up the community. Authority that destroys what it was meant to build has been perverted.',
   NULL),
  (9, 'That I may not seem as if I would terrify you by letters.',
   'ἵνα μὴ δόξω ὡς ἂν ἐκφοβεῖν ὑμᾶς διὰ τῶν ἐπιστολῶν',
   'hina mē doxō hōs an ekphobein hymas dia tōn epistolōn',
   '''Terrify'' (ekphobein — to frighten out, to scare thoroughly). Paul addresses the accusation directly: his opponents say he uses threatening letters to compensate for weak personal presence. He acknowledges his letters are powerful but insists his presence will match.',
   NULL),
  (10, 'For his letters, say they, are weighty and powerful; but his bodily presence is weak, and his speech contemptible.',
   'ὅτι αἱ μὲν ἐπιστολαὶ φησίν βαρεῖαι καὶ ἰσχυραί ἡ δὲ παρουσία τοῦ σώματος ἀσθενὴς καὶ ὁ λόγος ἐξουθενημένος',
   'hoti hai men epistolai phēsin bareiai kai ischyrai hē de parousia tou sōmatos asthenēs kai ho logos exouthenēmenos',
   '''Say they'' (phēsin — he/someone says; a direct quote from the opponents). ''Weighty and powerful'' (bareiai kai ischyrai — heavy and strong). ''Bodily presence weak'' (parousia tou sōmatos asthenēs — his physical appearance is feeble). ''Speech contemptible'' (logos exouthenēmenos — his oratory is despised/worthless). Paul quotes the slander verbatim. His opponents apparently found him unimpressive in person — perhaps small in stature, suffering from illness, and lacking the polished rhetoric they expected.',
   NULL),
  (11, 'Let such an one think this, that, such as we are in word by letters when we are absent, such will we be also in deed when we are present.',
   'τοῦτο λογιζέσθω ὁ τοιοῦτος ὅτι οἷοί ἐσμεν τῷ λόγῳ δι᾿ ἐπιστολῶν ἀπόντες τοιοῦτοι καὶ παρόντες τῷ ἔργῳ',
   'touto logizesthō ho toioutos hoti hoioi esmen tō logō di'' epistolōn apontes toioutoi kai parontes tō ergō',
   '''Let such an one think'' (logizesthō — let him reckon, let him calculate). Paul warns: what you see in my letters, expect in person. The threat is real: when Paul arrives, his actions will match his written words. The opponents will discover that the ''paper tiger'' has teeth.',
   NULL),
  (12, 'For we dare not make ourselves of the number, or compare ourselves with some that commend themselves: but they measuring themselves by themselves, and comparing themselves among themselves, are not wise.',
   'οὐ γὰρ τολμῶμεν ἐγκρῖναι ἢ συγκρῖναι ἑαυτούς τισιν τῶν ἑαυτοὺς συνιστανόντων ἀλλὰ αὐτοὶ ἐν ἑαυτοῖς ἑαυτοὺς μετροῦντες καὶ συγκρίνοντες ἑαυτοὺς ἑαυτοῖς οὐ συνιοῦσιν',
   'ou gar tolmōmen enkrinai ē synkrinai heautous tisin tōn heautous synistanontōn alla autoi en heautois heautous metrountes kai synkrinontes heautous heautois ou syniousin',
   '''Dare not'' (ou tolmōmen — we have not the audacity; ironic). ''Compare ourselves'' (synkrinai — to measure alongside). ''Measuring themselves by themselves'' (en heautois heautous metrountes — using themselves as the standard). ''Are not wise'' (ou syniousin — they do not understand; they lack discernment). The opponents created a closed circle of self-validation: they measured themselves against themselves and found themselves impressive. Paul exposes this as absurd — a ruler that measures only itself proves nothing.',
   NULL),
  (13, 'But we will not boast of things without our measure, but according to the measure of the rule which God hath distributed to us, a measure to reach even unto you.',
   'ἡμεῖς δὲ οὐκ εἰς τὰ ἄμετρα καυχησόμεθα ἀλλὰ κατὰ τὸ μέτρον τοῦ κανόνος οὗ ἐμέρισεν ἡμῖν ὁ θεὸς μέτρου ἐφικέσθαι ἄχρι καὶ ὑμῶν',
   'hēmeis de ouk eis ta ametra kauchēsometha alla kata to metron tou kanonos hou emerisen hēmin ho theos metrou ephikesthai achri kai hymōn',
   '''Without our measure'' (eis ta ametra — into the unmeasured, beyond our assigned territory). ''Measure of the rule'' (metron tou kanonos — the measured standard; kanōn originally meant a measuring reed). ''God hath distributed'' (emerisen hēmin ho theos — God has apportioned to us). ''To reach even unto you'' — Corinth falls within Paul''s God-assigned field. Paul boasts only within his designated sphere; his opponents have invaded his territory. The principle: ministry has boundaries assigned by God.',
   NULL),
  (14, 'For we stretch not ourselves beyond our measure, as though we reached not unto you: for we are come as far as to you also in preaching the gospel of Christ:',
   'οὐ γὰρ ὡς μὴ ἐφικνούμενοι εἰς ὑμᾶς ὑπερεκτείνομεν ἑαυτούς ἄχρι γὰρ καὶ ὑμῶν ἐφθάσαμεν ἐν τῷ εὐαγγελίῳ τοῦ Χριστοῦ',
   'ou gar hōs mē ephiknomenoi eis hymas hyperekteinomen heautous achri gar kai hymōn ephthasamen en tō euangeliō tou Christou',
   '''Stretch not ourselves beyond'' (ou hyperekteinomen — we do not overextend ourselves). ''We are come as far as to you'' (ephthasamen — we reached, we arrived first; Paul was the first to bring the gospel to Corinth; his opponents came after him). The historical fact: Paul founded the Corinthian church. His claim to authority there is grounded in his pioneer gospel work, not in self-promotion.',
   NULL),
  (15, 'Not boasting of things without our measure, that is, of other men''s labours; but having hope, when your faith is increased, that we shall be enlarged by you according to our rule abundantly,',
   'οὐκ εἰς τὰ ἄμετρα καυχώμενοι ἐν ἀλλοτρίοις κόποις ἐλπίδα δὲ ἔχοντες αὐξανομένης τῆς πίστεως ὑμῶν ἐν ὑμῖν μεγαλυνθῆναι κατὰ τὸν κανόνα ἡμῶν εἰς περισσείαν',
   'ouk eis ta ametra kauchōmenoi en allotriois kopois elpida de echontes auxanomenēs tēs pisteōs hymōn en hymin megalynthēnai kata ton kanona hēmōn eis perisseian',
   '''Other men''s labours'' (allotriois kopois — others'' hard work; the opponents were building on Paul''s foundation, claiming credit for his work). ''When your faith is increased'' — Paul hopes that as the Corinthians grow in faith, his ministry sphere will expand through them to new regions. He wants to use Corinth as a base for further mission, not as a terminal achievement.',
   NULL),
  (16, 'To preach the gospel in the regions beyond you, and not to boast in another man''s line of things made ready to our hand.',
   'εἰς τὰ ὑπερέκεινα ὑμῶν εὐαγγελίσασθαι οὐκ ἐν ἀλλοτρίῳ κανόνι εἰς τὰ ἕτοιμα καυχήσασθαι',
   'eis ta hyperekeina hymōn euangelisasthai ouk en allotriō kanoni eis ta hetoima kauchēsasthai',
   '''Regions beyond you'' (ta hyperekeina hymōn — the areas beyond you; possibly Spain or other uncharted territory). ''Another man''s line'' (allotriō kanoni — another person''s assigned sphere). ''Things made ready to our hand'' (ta hetoima — things already prepared; someone else''s finished work). Paul''s ambition is pioneer evangelism, not taking credit for others'' work. His opponents did exactly the opposite: entered Corinth after Paul and built on his work.',
   NULL),
  (17, 'But he that glorieth, let him glory in the Lord.',
   'ὁ δὲ καυχώμενος ἐν κυρίῳ καυχάσθω',
   'ho de kauchōmenos en kyriō kauchasthō',
   '''He that glorieth'' (kauchōmenos — the one who boasts). ''In the Lord'' (en kyriō — in the Lord). A quotation from Jeremiah 9:24: ''let him that glorieth glory in this, that he understandeth and knoweth me.'' All legitimate boasting has one object: the Lord himself. Self-commendation is meaningless; only the Lord''s commendation counts (v.18). This principle governs everything in chapters 10-13.',
   NULL),
  (18, 'For not he that commendeth himself is approved, but whom the Lord commendeth.',
   'οὐ γὰρ ὁ ἑαυτὸν συνιστῶν ἐκεῖνός ἐστιν δόκιμος ἀλλ᾿ ὃν ὁ κύριος συνίστησιν',
   'ou gar ho heauton synistōn ekeinos estin dokimos all'' hon ho kyrios synistēsin',
   '''Commendeth himself'' (heauton synistōn — recommends himself, self-promotes). ''Approved'' (dokimos — tested and found genuine; the assayer''s stamp of authenticity). ''Whom the Lord commendeth'' (hon ho kyrios synistēsin — the one whom the Lord recommends). The ultimate question is not ''what do people think of me?'' or ''what do I think of myself?'' but ''what does the Lord think of me?'' Self-commendation is worthless; divine approval is everything.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 10;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 strongholds
  ('ὀχύρωμα', 'ochyrōma', 'G3794', 'Stronghold, fortress, fortified place — from ochyroō (to make firm, to fortify). In military usage, a castle or fortified position that must be besieged and demolished. Paul applies this to entrenched systems of thought and argument that resist God''s truth. Spiritual warfare targets these intellectual fortresses.', 1),
  -- v.5 imaginations / thoughts
  ('λογισμός', 'logismos', 'G3053', 'Reasoning, argument, calculation — from logizomai (to reckon). Systematic human reasoning that opposes the knowledge of God. Not casual thoughts but constructed intellectual positions — philosophical systems, theological errors, ideological frameworks that must be demolished before the gospel can penetrate.', 2),
  ('αἰχμαλωτίζω', 'aichmalōtizō', 'G163', 'To take captive, to lead away as a prisoner of war — from aichmē (spear point) + halōtos (captured). Every thought (noēma) is captured as a prisoner of war and redirected to obey Christ. The image is total intellectual submission — not the suppression of thought but its redirection to its proper Master.', 3),
  -- v.1 meekness / gentleness
  ('πραΰτης', 'prautēs', 'G4240', 'Meekness, gentleness, mildness — strength under control, power restrained by love. Not weakness but controlled power. Christ is the model: he had all power but exercised it with gentleness. Paul appeals ''by the meekness of Christ'' — his gentle approach is Christ-like, not cowardly.', 4),
  ('ἐπιείκεια', 'epieikeia', 'G1932', 'Gentleness, forbearance, sweet reasonableness — the quality of not insisting on the letter of the law but yielding where justice permits. A willingness to moderate strict rights out of consideration for others. Applied to Christ and imitated by Paul.', 5),
  -- v.13 rule/measure
  ('κανών', 'kanōn', 'G2583', 'Rule, standard, measuring reed — originally a straight rod used for measurement. In Paul''s usage, the sphere or province of ministry assigned by God. Each minister has a God-given kanōn — a defined area of responsibility. Boasting beyond one''s kanōn is illegitimate.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 10
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 5 WHEN 3 THEN 5
    WHEN 4 THEN 1 WHEN 5 THEN 1
    WHEN 6 THEN 13
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 meekness of Christ
  (1, 'Matthew 11:29', 1),
  (1, 'Philippians 2:5-8', 2),
  -- v.4 weapons not carnal
  (4, 'Ephesians 6:11-17', 3),
  (4, 'Romans 13:12', 4),
  -- v.5 casting down imaginations
  (5, 'Romans 1:21', 5),
  (5, 'Colossians 2:8', 6),
  (5, '1 Corinthians 1:19-21', 7),
  -- v.8 authority for edification
  (8, '2 Corinthians 13:10', 8),
  (8, '1 Corinthians 5:4-5', 9),
  -- v.12 comparing among themselves
  (12, 'Galatians 6:4', 10),
  -- v.14 pioneer gospel
  (14, 'Romans 15:20', 11),
  (14, '1 Corinthians 3:10', 12),
  -- v.17 glory in the Lord
  (17, 'Jeremiah 9:23-24', 13),
  (17, '1 Corinthians 1:31', 14),
  -- v.18 whom the Lord commends
  (18, 'Romans 2:29', 15),
  (18, '1 Corinthians 4:3-5', 16)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 10
  AND v.verse_number = cr.verse_number;
