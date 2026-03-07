-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 3 — God's Field, God's Building, God's Temple
-- 23 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '1 Corinthians 3 exposes the Corinthians'' spiritual immaturity and reframes their view of church leadership. Paul could not address them as spiritual but as ''carnal'' — ''babes in Christ'' (v.1) who needed milk, not solid food (v.2). Their divisions prove their carnality: ''whereas there is among you envying, and strife, and divisions, are ye not carnal?'' (v.3). When they say ''I am of Paul'' or ''I am of Apollos,'' they are acting like mere men (v.4). Paul then presents two powerful metaphors. First, the church as God''s field (vv.5-9): Paul planted, Apollos watered, but ''God gave the increase'' (v.6). Ministers are co-labourers; the field is God''s. Second, the church as God''s building (vv.9-17): Paul laid the foundation — Jesus Christ — and others build upon it with gold, silver, precious stones, wood, hay, or stubble (vv.11-12). The day of judgment will test each person''s work by fire: good work survives; bad work is burned, though the builder ''himself shall be saved; yet so as by fire'' (v.15). The climax is the temple warning: ''Know ye not that ye are the temple of God, and that the Spirit of God dwelleth in you? If any man defile the temple of God, him shall God destroy'' (vv.16-17). The chapter concludes: ''all things are yours; whether Paul, or Apollos, or Cephas'' — leaders belong to the church, not the church to leaders (vv.21-23).',
  'Spiritual Immaturity, Ministers as Servants, and the Church as God''s Temple',
  'θεμέλιος (themelios)',
  'Foundation — from tithēmi (to place, set). The foundation already laid is Jesus Christ (v.11). No other foundation can be substituted. All ministry, all teaching, all church life must be built on this one foundation. The quality of what is built upon it will be tested by fire at the judgment.',
  '["Spiritual Immaturity: Milk Not Meat (vv.1-4): And I brethren could not speak unto you as unto spiritual but as unto carnal even as unto babes in Christ. I have fed you with milk and not with meat for hitherto ye were not able to bear it. For ye are yet carnal for whereas there is among you envying and strife and divisions are ye not carnal","God''s Field: Planters and Waterers (vv.5-9): Who then is Paul and who is Apollos but ministers by whom ye believed. I have planted Apollos watered but God gave the increase. So then neither is he that planteth any thing neither he that watereth but God that giveth the increase. For we are labourers together with God ye are God''s husbandry ye are God''s building","God''s Building: Foundation and Fire (vv.10-15): According to the grace of God which is given unto me as a wise masterbuilder I have laid the foundation and another buildeth thereon. For other foundation can no man lay than that is laid which is Jesus Christ. Every man''s work shall be made manifest for the day shall declare it because it shall be revealed by fire","God''s Temple: Warning Against Destruction (vv.16-23): Know ye not that ye are the temple of God and that the Spirit of God dwelleth in you. If any man defile the temple of God him shall God destroy for the temple of God is holy which temple ye are. Therefore let no man glory in men for all things are yours whether Paul or Apollos or Cephas and ye are Christ''s and Christ is God''s"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And I, brethren, could not speak unto you as unto spiritual, but as unto carnal, even as unto babes in Christ.',
   'κἀγώ ἀδελφοί οὐκ ἠδυνήθην λαλῆσαι ὑμῖν ὡς πνευματικοῖς ἀλλ᾿ ὡς σαρκίνοις ὡς νηπίοις ἐν Χριστῷ',
   'kagō adelphoi ouk ēdynēthēn lalēsai hymin hōs pneumatikois all hōs sarkinois hōs nēpiois en Christō',
   '''Could not'' (ouk ēdynēthēn — was unable). ''Spiritual'' (pneumatikois — Spirit-directed people; cf. 2:15). ''Carnal'' (sarkinois — fleshly, made of flesh; sarkinos emphasises their nature). ''Babes in Christ'' (nēpiois en Christō — infants; genuine believers but spiritually immature). Paul introduces a third category beyond ''natural'' and ''spiritual'': the carnal Christian — saved but stunted.',
   NULL),
  (2, 'I have fed you with milk, and not with meat: for hitherto ye were not able to bear it, neither yet now are ye able.',
   'γάλα ὑμᾶς ἐπότισα καὶ οὐ βρῶμα οὔπω γὰρ ἠδύνασθε ἀλλ᾿ οὔτε ἔτι νῦν δύνασθε',
   'gala hymas epotisa kai ou brōma oupō gar ēdynasthe all oute eti nyn dynasthe',
   '''Milk'' (gala — elementary spiritual truths). ''Meat'' (brōma — solid food, advanced teaching). ''Not able'' — the problem is not lack of instruction but lack of growth. They should have matured but haven''t. ''Neither yet now'' — their continued immaturity is a rebuke.',
   NULL),
  (3, 'For ye are yet carnal: for whereas there is among you envying, and strife, and divisions, are ye not carnal, and walk as men?',
   'ἔτι γὰρ σαρκικοί ἐστε ὅπου γὰρ ἐν ὑμῖν ζῆλος καὶ ἔρις καὶ διχοστασίαι οὐχὶ σαρκικοί ἐστε καὶ κατὰ ἄνθρωπον περιπατεῖτε',
   'eti gar sarkikoi este hopou gar en hymin zēlos kai eris kai dichostasiai ouchi sarkikoi este kai kata anthrōpon peripateite',
   '''Carnal'' (sarkikoi — fleshly; sarkikos emphasises behaviour, not nature). ''Envying'' (zēlos — jealousy). ''Strife'' (eris — quarrelling). ''Divisions'' (dichostasiai — factions). ''Walk as men'' (kata anthrōpon peripateite — conduct yourselves like mere unregenerate people). The evidence of carnality is relational: jealousy, quarrelling, and factions.',
   NULL),
  (4, 'For while one saith, I am of Paul; and another, I am of Apollos; are ye not carnal?',
   'ὅταν γὰρ λέγῃ τις ἐγὼ μέν εἰμι Παύλου ἕτερος δέ ἐγὼ Ἀπολλῶ οὐκ ἄνθρωποί ἐστε',
   'hotan gar legē tis egō men eimi Paulou heteros de egō Apollō ouk anthrōpoi este',
   '''Are ye not carnal?'' — literally, ''are you not [mere] men?'' The party slogans prove they are thinking in purely human categories, not spiritual ones. Dividing over leaders is a mark of immaturity, not sophistication.',
   NULL),
  (5, 'Who then is Paul, and who is Apollos, but ministers by whom ye believed, even as the Lord gave to every man?',
   'τίς οὖν ἐστιν Παῦλος τίς δὲ Ἀπολλῶς ἀλλ᾿ ἢ διάκονοι δι᾿ ὧν ἐπιστεύσατε καὶ ἑκάστῳ ὡς ὁ κύριος ἔδωκεν',
   'tis oun estin Paulos tis de Apollōs all ē diakonoi di hōn episteusate kai hekastō hōs ho kyrios edōken',
   '''Who?'' (tis — a deflating question). ''Ministers'' (diakonoi — servants; not lords but table-waiters). ''By whom ye believed'' (di hōn — instruments through whom). ''As the Lord gave'' (hōs ho kyrios edōken — each minister''s role is assigned by the Lord). Paul and Apollos are not rivals but servants with different assigned tasks.',
   NULL),
  (6, 'I have planted, Apollos watered; but God gave the increase.',
   'ἐγὼ ἐφύτευσα Ἀπολλῶς ἐπότισεν ἀλλ᾿ ὁ θεὸς ηὔξανεν',
   'egō ephyteusa Apollōs epotisen all ho theos ēuxanen',
   '''Planted'' (ephyteusa — aorist: a completed act of founding the church). ''Watered'' (epotisen — also aorist: Apollos''s subsequent ministry). ''God gave the increase'' (ho theos ēuxanen — imperfect tense: God kept on causing growth). The difference in tenses is significant: Paul and Apollos did their work and finished; God continuously gave the growth. Ministers act; God produces results.',
   'This verse is a masterclass in understanding Christian ministry. The agricultural metaphor clarifies roles: the planter and waterer do necessary work, but neither causes growth. Only God makes things grow. This eliminates both rivalry between ministers (they have complementary roles) and hero-worship by congregations (God is the one who deserves credit). The imperfect tense (ēuxanen — kept on growing) shows God''s continuous, ongoing work in the church.'),
  (7, 'So then neither is he that planteth any thing, neither he that watereth; but God that giveth the increase.',
   'ὥστε οὔτε ὁ φυτεύων ἐστίν τι οὔτε ὁ ποτίζων ἀλλ᾿ ὁ αὐξάνων θεός',
   'hōste oute ho phyteuōn estin ti oute ho potizōn all ho auxanōn theos',
   '''Neither … any thing'' (oute … estin ti — is anything, counts for anything). A startling dismissal of ministerial importance. ''But God that giveth the increase'' — God alone is significant. This is not false modesty but theological realism. Ministers are necessary instruments but not the cause of spiritual growth.',
   NULL),
  (8, 'Now he that planteth and he that watereth are one: and every man shall receive his own reward according to his own labour.',
   'ὁ φυτεύων δὲ καὶ ὁ ποτίζων ἕν εἰσιν ἕκαστος δὲ τὸν ἴδιον μισθὸν λήψεται κατὰ τὸν ἴδιον κόπον',
   'ho phyteuōn de kai ho potizōn hen eisin hekastos de ton idion misthon lēpsetai kata ton idion kopon',
   '''Are one'' (hen eisin — one in purpose, one team). ''His own reward'' (ton idion misthon — each receives individual reward). ''According to his own labour'' (kata ton idion kopon — proportional to their own toil). Unity of mission but individuality of reward. God evaluates each worker separately.',
   NULL),
  (9, 'For we are labourers together with God: ye are God''s husbandry, ye are God''s building.',
   'θεοῦ γάρ ἐσμεν συνεργοί θεοῦ γεώργιον θεοῦ οἰκοδομή ἐστε',
   'theou gar esmen synergoi theou geōrgion theou oikodomē este',
   '''Labourers together with God'' (theou synergoi — God''s co-workers). Three possessive genitives: God''s co-workers, God''s field, God''s building. Everything belongs to God: the workers, the field, and the building. ''Husbandry'' (geōrgion — cultivated field, farm). ''Building'' (oikodomē — a structure under construction). The metaphor shifts from agriculture to architecture.',
   NULL),
  (10, 'According to the grace of God which is given unto me, as a wise masterbuilder, I have laid the foundation, and another buildeth thereon. But let every man take heed how he buildeth thereupon.',
   'κατὰ τὴν χάριν τοῦ θεοῦ τὴν δοθεῖσάν μοι ὡς σοφὸς ἀρχιτέκτων θεμέλιον τέθεικα ἄλλος δὲ ἐποικοδομεῖ ἕκαστος δὲ βλεπέτω πῶς ἐποικοδομεῖ',
   'kata tēn charin tou theou tēn dotheisan moi hōs sophos architektōn themelion tetheika allos de epoikodomei hekastos de blepetō pōs epoikodomei',
   '''Grace given unto me'' — Paul''s skill comes from grace, not natural ability. ''Wise masterbuilder'' (sophos architektōn — skilled chief builder; English ''architect'' derives from this). ''Foundation'' (themelion — the base upon which everything rests). ''Take heed'' (blepetō — watch carefully). The foundation is laid (tetheika — perfect tense: permanently placed). Now each builder must watch how they build upon it.',
   NULL),
  (11, 'For other foundation can no man lay than that is laid, which is Jesus Christ.',
   'θεμέλιον γὰρ ἄλλον οὐδεὶς δύναται θεῖναι παρὰ τὸν κείμενον ὅς ἐστιν Ἰησοῦς Χριστός',
   'themelion gar allon oudeis dynatai theinai para ton keimenon hos estin Iēsous Christos',
   '''Other foundation'' (themelion allon — another, different foundation). ''Can no man lay'' (oudeis dynatai — no one is able; impossibility). ''Which is laid'' (ton keimenon — the one already lying in place). ''Which is Jesus Christ'' — the foundation is not a doctrine, a system, or a tradition, but a person: Jesus Christ himself. This is non-negotiable and irreplaceable.',
   'This is one of the most important ecclesiological statements in the NT. The church has one and only one foundation: Jesus Christ. No human teacher, no ecclesiastical structure, no theological system can substitute for Christ. Paul ''laid'' this foundation at Corinth by preaching Christ crucified (2:2). All subsequent ministry must build on this foundation. Any building project that substitutes another foundation is not merely inferior — it is impossible (oudeis dynatai).'),
  (12, 'Now if any man build upon this foundation gold, silver, precious stones, wood, hay, stubble;',
   'εἰ δέ τις ἐποικοδομεῖ ἐπὶ τὸν θεμέλιον τοῦτον χρυσόν ἄργυρον λίθους τιμίους ξύλα χόρτον καλάμην',
   'ei de tis epoikodomei epi ton themelion touton chryson argyron lithous timious xyla chorton kalamēn',
   'Six building materials in two categories: (1) Fire-resistant: gold (chryson), silver (argyron), precious stones (lithous timious); (2) Combustible: wood (xyla), hay (chorton), stubble (kalamēn). The materials represent the quality of ministry built on Christ''s foundation. Some work is durable; some is flammable. The test is coming.',
   NULL),
  (13, 'Every man''s work shall be made manifest: for the day shall declare it, because it shall be revealed by fire; and the fire shall try every man''s work of what sort it is.',
   'ἑκάστου τὸ ἔργον φανερὸν γενήσεται ἡ γὰρ ἡμέρα δηλώσει ὅτι ἐν πυρὶ ἀποκαλύπτεται καὶ ἑκάστου τὸ ἔργον ὁποῖόν ἐστιν τὸ πῦρ δοκιμάσει',
   'hekastou to ergon phaneron genēsetai hē gar hēmera dēlōsei hoti en pyri apokalyptetai kai hekastou to ergon hopoion estin to pyr dokimasei',
   '''Made manifest'' (phaneron — visible, exposed). ''The day'' (hē hēmera — the day of Christ''s judgment). ''Revealed by fire'' (en pyri apokalyptetai — unveiled with fire). ''Try'' (dokimasei — test, prove; the same verb for testing metals). Fire tests quality, not existence. The fire does not test whether you are saved but whether your work will last.',
   'This verse describes the believer''s judgment (the bēma of 2 Corinthians 5:10). The fire tests the quality (hopoion — what sort) of each person''s work, not their salvation. Gold, silver, and precious stones survive fire; wood, hay, and stubble do not. The ''day'' is the day of Christ''s return when all ministry will be evaluated. This judgment concerns rewards, not salvation — as v.15 makes clear.'),
  (14, 'If any man''s work abide which he hath built thereupon, he shall receive a reward.',
   'εἴ τινος τὸ ἔργον μενεῖ ὃ ἐποικοδόμησεν μισθὸν λήψεται',
   'ei tinos to ergon menei ho epoikodomēsen misthon lēpsetai',
   '''Abide'' (menei — remain, endure, survive the fire). ''Reward'' (misthon — wages, recompense). Work that survives the fire earns a reward. The nature of the reward is not specified here, but the principle is clear: quality work for Christ is never wasted.',
   NULL),
  (15, 'If any man''s work shall be burned, he shall suffer loss: but he himself shall be saved; yet so as by fire.',
   'εἴ τινος τὸ ἔργον κατακαήσεται ζημιωθήσεται αὐτὸς δὲ σωθήσεται οὕτως δὲ ὡς διὰ πυρός',
   'ei tinos to ergon katakahēsetai zēmiōthēsetai autos de sōthēsetai houtōs de hōs dia pyros',
   '''Burned'' (katakahēsetai — burned up entirely). ''Suffer loss'' (zēmiōthēsetai — be penalised, forfeit reward). ''He himself shall be saved'' (autos sōthēsetai — the builder is saved, not the building). ''As by fire'' (hōs dia pyros — like someone escaping through flames, barely). Salvation is not at stake, but rewards are. A builder can lose everything they built and still be saved — but just barely.',
   'This verse is critical for understanding the distinction between salvation and rewards. Salvation is by grace through faith and cannot be lost (the builder ''shall be saved''). But rewards can be lost if the work is of poor quality. ''As by fire'' paints a vivid picture: escaping from a burning house with nothing but your life. The person is saved, but everything they worked for is consumed. This motivates quality ministry without threatening the security of salvation.'),
  (16, 'Know ye not that ye are the temple of God, and that the Spirit of God dwelleth in you?',
   'οὐκ οἴδατε ὅτι ναὸς θεοῦ ἐστε καὶ τὸ πνεῦμα τοῦ θεοῦ οἰκεῖ ἐν ὑμῖν',
   'ouk oidate hoti naos theou este kai to pneuma tou theou oikei en hymin',
   '''Know ye not'' (ouk oidate — do you not know?; a rebuke for ignorance they should not have). ''Temple'' (naos — the inner sanctuary, the holy of holies; not hieron, the entire temple complex). ''Of God'' (theou — the temple belongs to God). ''The Spirit dwelleth in you'' (to pneuma oikei en hymin — the Spirit makes his permanent home in you). The ''you'' is plural: the church corporately is God''s temple.',
   'This is one of the most important ecclesiological texts in the NT. The church is not like a temple — it is the temple (naos) of God. The Spirit of God indwells the community of believers as God''s presence once filled the tabernacle and Solomon''s temple. This is corporate, not individual (that comes in 6:19). The church as a whole is the dwelling place of God. To damage this community is to attack God''s sanctuary.'),
  (17, 'If any man defile the temple of God, him shall God destroy; for the temple of God is holy, which temple ye are.',
   'εἴ τις τὸν ναὸν τοῦ θεοῦ φθείρει φθερεῖ τοῦτον ὁ θεός ὁ γὰρ ναὸς τοῦ θεοῦ ἅγιός ἐστιν οἵτινές ἐστε ὑμεῖς',
   'ei tis ton naon tou theou phtheirei phtherei touton ho theos ho gar naos tou theou hagios estin hoitines este hymeis',
   '''Defile'' (phtheirei — corrupt, destroy, ruin). ''Destroy'' (phtherei — the same verb: God will ruin the one who ruins his temple). A deliberate wordplay: the punishment matches the crime. ''Holy'' (hagios — sacred, set apart). ''Which temple ye are'' — direct identification. The warning is severe: those who damage the church face divine destruction.',
   'The severity of this warning is extraordinary. ''If any man defile the temple of God, him shall God destroy.'' The verb phtheirō means to corrupt, spoil, or destroy — it applies to those who damage the church through false teaching, divisions, or moral corruption. God will treat them as they treated his temple. This is not about individual sin (6:19-20 addresses that) but about corporate destruction — tearing apart the community that is God''s dwelling place.'),
  (18, 'Let no man deceive himself. If any man among you seemeth to be wise in this world, let him become a fool, that he may be wise.',
   'μηδεὶς ἑαυτὸν ἐξαπατάτω εἴ τις δοκεῖ σοφὸς εἶναι ἐν ὑμῖν ἐν τῷ αἰῶνι τούτῳ μωρὸς γενέσθω ἵνα γένηται σοφός',
   'mēdeis heauton exapatatō ei tis dokei sophos einai en hymin en tō aiōni toutō mōros genesthō hina genētai sophos',
   '''Deceive himself'' (exapatatō — thoroughly deceive). ''Seemeth to be wise'' (dokei sophos einai — considers himself wise). ''Become a fool'' (mōros genesthō — accept the world''s verdict of foolishness). ''That he may be wise'' — true wisdom begins with renouncing worldly wisdom. The paradox of the gospel: to gain wisdom, you must first become foolish in the world''s eyes.',
   NULL),
  (19, 'For the wisdom of this world is foolishness with God. For it is written, He taketh the wise in their own craftiness.',
   'ἡ γὰρ σοφία τοῦ κόσμου τούτου μωρία παρὰ τῷ θεῷ ἐστιν γέγραπται γάρ ὁ δρασσόμενος τοὺς σοφοὺς ἐν τῇ πανουργίᾳ αὐτῶν',
   'hē gar sophia tou kosmou toutou mōria para tō theō estin gegraptai gar ho drassomenos tous sophous en tē panourgia autōn',
   'Quoting Job 5:13. ''Taketh'' (drassomenos — catches, seizes; grabbing them in their own trap). ''Craftiness'' (panourgia — cunning, shrewdness; the very quality the world admires becomes the snare). God turns human cleverness against the clever.',
   NULL),
  (20, 'And again, The Lord knoweth the thoughts of the wise, that they are vain.',
   'καὶ πάλιν κύριος γινώσκει τοὺς διαλογισμοὺς τῶν σοφῶν ὅτι εἰσὶν μάταιοι',
   'kai palin kyrios ginōskei tous dialogismous tōn sophōn hoti eisin mataioi',
   'Quoting Psalm 94:11. ''Thoughts'' (dialogismous — reasonings, calculations). ''Vain'' (mataioi — futile, empty, leading nowhere). God knows (ginōskei — sees through) the inner reasoning of the wise, and his verdict is: futile. Two OT witnesses confirm the foolishness of worldly wisdom.',
   NULL),
  (21, 'Therefore let no man glory in men. For all things are yours;',
   'ὥστε μηδεὶς καυχάσθω ἐν ἀνθρώποις πάντα γὰρ ὑμῶν ἐστιν',
   'hōste mēdeis kauchasthō en anthrōpois panta gar hymōn estin',
   '''Let no man glory in men'' (mēdeis kauchasthō en anthrōpois — stop boasting about human leaders). ''All things are yours'' (panta hymōn estin — everything belongs to you). The stunning conclusion: instead of belonging to leaders, the leaders belong to the church! The entire universe belongs to believers as co-heirs with Christ.',
   NULL),
  (22, 'Whether Paul, or Apollos, or Cephas, or the world, or life, or death, or things present, or things to come; all are yours;',
   'εἴτε Παῦλος εἴτε Ἀπολλῶς εἴτε Κηφᾶς εἴτε κόσμος εἴτε ζωὴ εἴτε θάνατος εἴτε ἐνεστῶτα εἴτε μέλλοντα πάντα ὑμῶν ἐστιν',
   'eite Paulos eite Apollōs eite Kēphas eite kosmos eite zōē eite thanatos eite enestōta eite mellonta panta hymōn estin',
   'A breathtaking catalogue: Paul, Apollos, Cephas (the leaders they fought over), the world, life, death, present, future — all belong to the Corinthians! They need not choose between leaders because they possess them all. This echoes Romans 8:38-39: nothing can separate believers from their inheritance in Christ.',
   NULL),
  (23, 'And ye are Christ''s; and Christ is God''s.',
   'ὑμεῖς δὲ Χριστοῦ Χριστὸς δὲ θεοῦ',
   'hymeis de Christou Christos de theou',
   '''Ye are Christ''s'' (hymeis de Christou — you belong to Christ). ''Christ is God''s'' (Christos de theou — Christ belongs to God). The chain of ownership: all things → believers → Christ → God. Believers own everything, but they themselves belong to Christ, who submits to the Father. This is not subordination of essence but of economy: the Son''s mission is to glorify the Father.',
   'This final verse establishes the great chain of belonging. Everything belongs to believers (v.21); believers belong to Christ; Christ belongs to God. This is not a hierarchy of value but of relationship and purpose. It simultaneously elevates believers (they own everything) and humbles them (they belong to Christ). It also shows that party loyalty to human leaders is absurd: believers are Christ''s property, not Paul''s or Apollos''s. The verse anticipates 15:28 where Christ delivers the kingdom to the Father.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 3;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 carnal
  ('σάρκινος', 'sarkinos', 'G4560', 'Fleshly, made of flesh, carnal — from sarx (flesh). Paul introduces a third category of person: the sarkinos Christian is genuinely saved (''in Christ'') but spiritually immature, governed by fleshly impulses rather than the Spirit. The evidence is behavioural: jealousy, strife, and faction (v.3). This is not the same as the psychikos (natural person) of 2:14 who has no spiritual capacity at all.', 1),
  -- v.6 God gave the increase
  ('αὐξάνω', 'auxanō', 'G837', 'To grow, increase, cause to grow — only God can produce spiritual growth. Paul planted (aorist: a completed act), Apollos watered (aorist), but God kept on giving the growth (imperfect tense: continuous action). Ministers are necessary but not sufficient for growth. God alone causes growth — a truth that both humbles ministers and encourages churches.', 2),
  -- v.9 labourers together with God
  ('συνεργός', 'synergos', 'G4904', 'Co-worker, fellow-labourer — from syn (together) + ergon (work). Ministers are God''s synergoi — they work alongside God, not independently. The genitive theou (of God) shows that God is the principal worker; they are his assistants. This gives dignity to ministry (co-workers with God!) while preventing pride (they are workers, not owners).', 3),
  -- v.10 masterbuilder
  ('ἀρχιτέκτων', 'architektōn', 'G753', 'Master builder, chief constructor — from archē (chief, first) + tektōn (builder, craftsman). English ''architect'' derives from this word. Paul''s role was foundational: he was the skilled architect who laid the foundation (Jesus Christ). Others build upon it. The emphasis is on skill (sophos — wise): the foundation must be laid correctly, because everything else depends on it.', 4),
  -- v.11 foundation
  ('θεμέλιος', 'themelios', 'G2310', 'Foundation, base — from tithēmi (to place, set). The foundation of the church is Jesus Christ — not a doctrine about Christ, not a confession about Christ, but Christ himself. This foundation is already ''laid'' (keimenon — lying in place; perfect participle: permanently fixed). No one can lay another foundation. All ministry must be built on this one, unchangeable base.', 5),
  -- v.13 fire tests work
  ('πῦρ', 'pyr', 'G4442', 'Fire — used metaphorically for divine judgment that tests and purifies. Fire does not test whether one is saved (that is determined by the foundation, v.11) but whether one''s work is of lasting quality. Gold, silver, and precious stones survive; wood, hay, and stubble are consumed. The fire separates what is eternal from what is temporal in each person''s ministry.', 6),
  -- v.16 temple
  ('ναός', 'naos', 'G3485', 'Temple, inner sanctuary, holy place — distinct from hieron (the entire temple complex). Naos refers specifically to the sacred inner dwelling where God''s presence resides. The church corporately is God''s naos — the dwelling place of his Spirit. This is an extraordinary claim: what the Jerusalem temple was physically, the church is spiritually. Damaging this temple invites God''s destructive judgment (v.17).', 7),
  -- v.17 defile/destroy
  ('φθείρω', 'phtheirō', 'G5351', 'To corrupt, destroy, ruin, spoil — used twice in v.17: ''if any man defile (phtheirei) … God shall destroy (phtherei).'' The lex talionis applies: the punishment matches the crime in kind. Those who corrupt God''s temple will themselves be corrupted/destroyed by God. The word covers both moral corruption and physical destruction. This is the most severe warning in 1 Corinthians.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 3
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 6
    WHEN 3 THEN 9
    WHEN 4 THEN 10
    WHEN 5 THEN 11
    WHEN 6 THEN 13
    WHEN 7 THEN 16
    WHEN 8 THEN 17
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 babes in Christ
  (1, 'Hebrews 5:12-14', 1),
  (1, '1 Peter 2:2', 2),
  -- v.3 envying strife divisions
  (3, 'Galatians 5:19-21', 3),
  (3, 'James 3:14-16', 4),
  -- v.5 ministers by whom
  (5, '2 Corinthians 3:5-6', 5),
  -- v.6 God gave the increase
  (6, 'Acts 18:1-11', 6),
  (6, 'Acts 18:24-28', 7),
  -- v.8 reward according to labour
  (8, 'Revelation 22:12', 8),
  (8, '2 Corinthians 5:10', 9),
  -- v.9 God''s building
  (9, 'Ephesians 2:20-22', 10),
  (9, '1 Peter 2:5', 11),
  -- v.10 wise masterbuilder
  (10, 'Romans 15:20', 12),
  -- v.11 foundation Jesus Christ
  (11, 'Isaiah 28:16', 13),
  (11, 'Ephesians 2:20', 14),
  (11, '1 Peter 2:6', 15),
  -- v.13 day shall declare
  (13, '2 Corinthians 5:10', 16),
  (13, '1 Peter 1:7', 17),
  -- v.15 saved as by fire
  (15, 'Jude 1:23', 18),
  -- v.16 temple of God
  (16, '1 Corinthians 6:19', 19),
  (16, '2 Corinthians 6:16', 20),
  (16, 'Ephesians 2:21-22', 21),
  -- v.17 defile temple God destroys
  (17, 'Revelation 11:18', 22),
  -- v.19 wise in own craftiness
  (19, 'Job 5:13', 23),
  -- v.20 thoughts of wise are vain
  (20, 'Psalm 94:11', 24),
  -- v.21-22 all things are yours
  (21, 'Romans 8:32', 25),
  (22, 'Romans 8:38-39', 26),
  -- v.23 ye are Christ''s
  (23, '1 Corinthians 11:3', 27),
  (23, '1 Corinthians 15:28', 28)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 3
  AND v.verse_number = cr.verse_number;
