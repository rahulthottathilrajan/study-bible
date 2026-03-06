-- ═══════════════════════════════════════════════════
-- GALATIANS CHAPTER 6 — Sowing, Reaping, and the New Creation
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Galatians 6 brings the epistle to its practical and personal conclusion. Paul opens with instruction on mutual care: ''if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness'' (v.1). He teaches that believers should ''bear ye one another''s burdens, and so fulfil the law of Christ'' (v.2), while also recognising that ''every man shall bear his own burden'' (v.5) — communal compassion balanced with individual responsibility. ''Let him that is taught in the word communicate unto him that teacheth in all good things'' (v.6). The great agricultural principle follows: ''Be not deceived; God is not mocked: for whatsoever a man soweth, that shall he also reap'' (v.7). Sowing to the flesh reaps corruption; sowing to the Spirit reaps ''life everlasting'' (v.8). ''Let us not be weary in well doing: for in due season we shall reap, if we faint not'' (v.9). Paul urges doing good ''unto all men, especially unto them who are of the household of faith'' (v.10). He then takes the pen himself: ''Ye see how large a letter I have written unto you with mine own hand'' (v.11). He exposes the Judaizers'' motives — they want to avoid persecution and boast in the Galatians'' flesh (vv.12-13). Paul''s own boast is radical: ''God forbid that I should glory, save in the cross of our Lord Jesus Christ, by whom the world is crucified unto me, and I unto the world'' (v.14). The climactic declaration: ''For in Christ Jesus neither circumcision availeth any thing, nor uncircumcision, but a new creature'' (v.15). The epistle closes with a benediction of ''peace'' and ''mercy'' upon ''the Israel of God'' (v.16), and Paul''s final appeal: ''I bear in my body the marks of the Lord Jesus'' (v.17).',
  'Glory in the Cross Alone — The New Creation',
  'καινὴ κτίσις (kainē ktisis)',
  'New creation, new creature — the radical transformation that occurs when a person is united to Christ. Neither circumcision nor uncircumcision matters; what matters is the new creation wrought by the Spirit. This is the goal of the entire epistle: not law, not licence, but new life in Christ.',
  '["Restoring the Fallen and Bearing Burdens (vv.1-5): Brethren if a man be overtaken in a fault ye which are spiritual restore such an one in the spirit of meekness considering thyself lest thou also be tempted; bear ye one another''s burdens and so fulfil the law of Christ; for if a man think himself to be something when he is nothing he deceiveth himself; but let every man prove his own work and then shall he have rejoicing in himself alone and not in another; for every man shall bear his own burden","Sowing and Reaping (vv.6-10): Let him that is taught in the word communicate unto him that teacheth in all good things; be not deceived God is not mocked for whatsoever a man soweth that shall he also reap; for he that soweth to his flesh shall of the flesh reap corruption but he that soweth to the Spirit shall of the Spirit reap life everlasting; and let us not be weary in well doing for in due season we shall reap if we faint not; as we have therefore opportunity let us do good unto all men especially unto them who are of the household of faith","Paul''s Own Hand — Glory Only in the Cross (vv.11-16): Ye see how large a letter I have written unto you with mine own hand; as many as desire to make a fair shew in the flesh they constrain you to be circumcised only lest they should suffer persecution for the cross of Christ; for neither they themselves who are circumcised keep the law but desire to have you circumcised that they may glory in your flesh; but God forbid that I should glory save in the cross of our Lord Jesus Christ by whom the world is crucified unto me and I unto the world; for in Christ Jesus neither circumcision availeth any thing nor uncircumcision but a new creature; and as many as walk according to this rule peace be on them and mercy and upon the Israel of God","Final Appeal and Benediction (vv.17-18): From henceforth let no man trouble me for I bear in my body the marks of the Lord Jesus; brethren the grace of our Lord Jesus Christ be with your spirit amen"]'
FROM books b WHERE b.name = 'Galatians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.',
   'Ἀδελφοί ἐὰν καὶ προληφθῇ ἄνθρωπος ἔν τινι παραπτώματι ὑμεῖς οἱ πνευματικοὶ καταρτίζετε τὸν τοιοῦτον ἐν πνεύματι πραΰτητος σκοπῶν σεαυτόν μὴ καὶ σὺ πειρασθῇς',
   'Adelphoi ean kai prolēphthē anthrōpos en tini paraptōmati hymeis hoi pneumatikoi katartizete ton toiouton en pneumati prautētos skopōn seauton mē kai sy peirasthēs',
   '''Overtaken'' (prolēphthē — caught, surprised, detected in the act; aorist passive: it happened to him, not that he planned it). ''Fault'' (paraptōmati — a trespass, a slip, a fall beside the path; not deliberate rebellion but a stumble). ''Ye which are spiritual'' (hoi pneumatikoi — those who walk by the Spirit, as described in 5:25). ''Restore'' (katartizete — mend, set right, put back in joint; used of setting broken bones and mending fishing nets, Mark 1:19). ''Spirit of meekness'' (en pneumati prautētos — in a spirit of gentleness). ''Considering thyself'' (skopōn seauton — keeping a watchful eye on yourself). The spiritual person''s response to another''s sin is not condemnation but careful, humble restoration.',
   'Restoration vs condemnation: This verse is the practical application of 5:22-23. The fruit of the Spirit (gentleness, meekness) is tested precisely when dealing with a brother''s failure. The truly spiritual person does not stand in judgment but stoops to restore — like a doctor setting a broken bone. The warning ''lest thou also be tempted'' prevents spiritual pride.'),
  (2, 'Bear ye one another''s burdens, and so fulfil the law of Christ.',
   'Ἀλλήλων τὰ βάρη βαστάζετε καὶ οὕτως ἀναπληρώσατε τὸν νόμον τοῦ Χριστοῦ',
   'Allēlōn ta barē bastazete kai houtōs anaplērōsate ton nomon tou Christou',
   '''Burdens'' (barē — heavy loads, crushing weights; things too heavy for one person to carry alone). ''Bear'' (bastazete — carry, take up; present imperative: keep on carrying). ''Fulfil'' (anaplērōsate — fill up completely, bring to full measure; aorist imperative: do it decisively). ''The law of Christ'' (ton nomon tou Christou) — the principle of love that Christ taught and exemplified (John 13:34, 15:12). This is the only ''law'' binding on the believer: not Moses'' law but Christ''s law of sacrificial love, fulfilled by bearing one another''s burdens.',
   'The law of Christ: After five chapters arguing that believers are free from the Mosaic law, Paul introduces ''the law of Christ'' — not a new legal code but the principle of love (5:14; John 13:34). Christians are not lawless; they are under grace which produces love, and love fulfils every legitimate demand of the law. The law of Christ is fulfilled not by rule-keeping but by burden-bearing love.'),
  (3, 'For if a man think himself to be something, when he is nothing, he deceiveth himself.',
   'εἰ γὰρ δοκεῖ τις εἶναί τι μηδὲν ὤν ἑαυτὸν φρεναπατᾷ',
   'ei gar dokei tis einai ti mēden ōn heauton phrenapata',
   '''Think himself to be something'' (dokei einai ti — supposes he is somebody important). ''When he is nothing'' (mēden ōn — being nothing). ''Deceiveth himself'' (heauton phrenapata — deceives his own mind; phrenapataō used only here in the NT, from phrēn, mind + apataō, deceive). Self-deception about one''s own importance is the enemy of burden-bearing. The person who thinks he is ''above'' helping others has been fooled by his own mind.',
   NULL),
  (4, 'But let every man prove his own work, and then shall he have rejoicing in himself alone, and not in another.',
   'τὸ δὲ ἔργον ἑαυτοῦ δοκιμαζέτω ἕκαστος καὶ τότε εἰς ἑαυτὸν μόνον τὸ καύχημα ἕξει καὶ οὐκ εἰς τὸν ἕτερον',
   'to de ergon heautou dokimazetō hekastos kai tote eis heauton monon to kauchēma hexei kai ouk eis ton heteron',
   '''Prove'' (dokimazetō — test, examine, put to the test; the metallurgical term for testing metals). ''His own work'' (ergon heautou — his own work, not someone else''s). ''Rejoicing'' (kauchēma — ground for boasting, reason for pride). ''Not in another'' (ouk eis ton heteron — not by comparison with someone else). Each person should evaluate his own actions against God''s standard rather than comparing himself favourably to others. Boasting should come (if at all) from honest self-examination, not from measuring oneself against weaker brothers.',
   NULL),
  (5, 'For every man shall bear his own burden.',
   'ἕκαστος γὰρ τὸ ἴδιον φορτίον βαστάσει',
   'hekastos gar to idion phortion bastasei',
   '''Burden'' (phortion — a load, a pack, a soldier''s knapsack; a different word from barē in v.2). In v.2, barē are crushing, extraordinary burdens that require help from others. Here, phortion is the normal load that each person must carry — personal responsibility. There is no contradiction: we help each other with crushing loads (v.2) while each carrying our own daily pack (v.5). Communal compassion and individual responsibility coexist.',
   NULL),
  (6, 'Let him that is taught in the word communicate unto him that teacheth in all good things.',
   'Κοινωνείτω δὲ ὁ κατηχούμενος τὸν λόγον τῷ κατηχοῦντι ἐν πᾶσιν ἀγαθοῖς',
   'Koinōneitō de ho katēchoumenos ton logon tō katēchounti en pasin agathois',
   '''Communicate'' (koinōneitō — share, have fellowship in, contribute; from koinōnia). ''Taught'' (katēchoumenos — instructed, catechised; the root of ''catechism''). ''Teacheth'' (katēchounti — the one who instructs). ''All good things'' (pasin agathois — all good things, likely material support). The student should share financially with the teacher. This is the principle of supporting those who teach God''s Word — a practical application of burden-bearing.',
   NULL),
  (7, 'Be not deceived; God is not mocked: for whatsoever a man soweth, that shall he also reap.',
   'μὴ πλανᾶσθε θεὸς οὐ μυκτηρίζεται ὃ γὰρ ἐὰν σπείρῃ ἄνθρωπος τοῦτο καὶ θερίσει',
   'mē planasthe theos ou myktērizetai ho gar ean speirē anthrōpos touto kai therisei',
   '''Be not deceived'' (mē planasthe — stop being led astray; present passive imperative). ''Mocked'' (myktērizetai — turned up the nose at, sneered at, treated with contempt; from myktēr, nose). God cannot be fooled by outward piety that masks fleshly sowing. ''Soweth ... reap'' (speirē ... therisei — the universal agricultural law applied to moral life). This is an immutable spiritual principle: the harvest always corresponds to the seed. No one escapes the consequences of what they sow.',
   'Sowing and reaping: This principle applies universally but must be read in context. Paul is not teaching salvation by works but describing the inevitable spiritual consequences of lifestyle choices. The person who invests in fleshly pursuits reaps corruption; the person who invests in spiritual things reaps eternal life. Grace does not eliminate consequences — it changes the heart so that we sow differently.'),
  (8, 'For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.',
   'ὅτι ὁ σπείρων εἰς τὴν σάρκα ἑαυτοῦ ἐκ τῆς σαρκὸς θερίσει φθοράν ὁ δὲ σπείρων εἰς τὸ πνεῦμα ἐκ τοῦ πνεύματος θερίσει ζωὴν αἰώνιον',
   'hoti ho speirōn eis tēn sarka heautou ek tēs sarkos therisei phthoran ho de speirōn eis to pneuma ek tou pneumatos therisei zōēn aiōnion',
   '''Soweth to his flesh'' (speirōn eis tēn sarka — investing in, directing one''s resources toward the flesh). ''Corruption'' (phthoran — decay, ruin, destruction; the rotting of a harvest). ''Soweth to the Spirit'' (speirōn eis to pneuma — investing in spiritual things). ''Life everlasting'' (zōēn aiōnion — life of the age to come, eternal life). The two harvests are starkly different: corruption (decay and death) versus eternal life. ''Sowing to the Spirit'' means walking by the Spirit, investing time and energy in spiritual growth, prayer, worship, and love.',
   NULL),
  (9, 'And let us not be weary in well doing: for in due season we shall reap, if we faint not.',
   'τὸ δὲ καλὸν ποιοῦντες μὴ ἐκκακῶμεν καιρῷ γὰρ ἰδίῳ θερίσομεν μὴ ἐκλυόμενοι',
   'to de kalon poiountes mē enkakōmen kairō gar idiō therisomen mē eklyomenoi',
   '''Weary'' (enkakōmen — lose heart, become discouraged, give up; present subjunctive: let us not keep on losing heart). ''Well doing'' (kalon poiountes — doing what is good, noble, beautiful). ''In due season'' (kairō idiō — at the proper, appointed time; God''s timing, not ours). ''Faint not'' (mē eklyomenoi — not giving out, not collapsing from exhaustion). The harvest is certain but not immediate. There is a delay between sowing and reaping that tests faith and perseverance. The encouragement: the harvest will come at exactly the right time.',
   NULL),
  (10, 'As we have therefore opportunity, let us do good unto all men, especially unto them who are of the household of faith.',
   'Ἄρα οὖν ὡς καιρὸν ἔχομεν ἐργαζώμεθα τὸ ἀγαθὸν πρὸς πάντας μάλιστα δὲ πρὸς τοὺς οἰκείους τῆς πίστεως',
   'Ara oun hōs kairon echomen ergazōmetha to agathon pros pantas malista de pros tous oikeious tēs pisteōs',
   '''Opportunity'' (kairon — a season, a window of time; kairos implies the right moment, not just any time). ''Do good'' (ergazōmetha to agathon — let us work what is good; active, intentional effort). ''All men'' (pantas — everyone, without distinction). ''Household of faith'' (oikeious tēs pisteōs — members of the family of faith; oikeios means belonging to the household). Our good works should extend to all people, but with a special priority for fellow believers. The church is a family (household), and family members care for one another first.',
   NULL),
  (11, 'Ye see how large a letter I have written unto you with mine own hand.',
   'Ἴδετε πηλίκοις ὑμῖν γράμμασιν ἔγραψα τῇ ἐμῇ χειρί',
   'Idete pēlikois hymin grammasin egrapsa tē emē cheiri',
   '''How large a letter'' (pēlikois grammasin — with what large letters; pēlikos can refer to the size of the letter-characters or the length of the epistle). Paul typically dictated his letters and added a closing in his own handwriting as authentication (cf. 2 Thess 3:17; 1 Cor 16:21). Here he may have written the entire final section (vv.11-18) himself, or the large letters may indicate emphasis — like writing in bold capitals. Some suggest his eyesight was poor (cf. 4:15).',
   NULL),
  (12, 'As many as desire to make a fair shew in the flesh, they constrain you to be circumcised; only lest they should suffer persecution for the cross of Christ.',
   'ὅσοι θέλουσιν εὐπροσωπῆσαι ἐν σαρκί οὗτοι ἀναγκάζουσιν ὑμᾶς περιτέμνεσθαι μόνον ἵνα μὴ τῷ σταυρῷ τοῦ Χριστοῦ διώκωνται',
   'hosoi thelousin euprosōpēsai en sarki houtoi anankadzousin hymas peritemnesthai monon hina mē tō staurō tou Christou diōkōntai',
   '''Fair shew'' (euprosōpēsai — to put on a good face, to make a good outward appearance; used only here in the NT). ''Constrain'' (anankadzousin — compel, force, pressure). ''Lest they should suffer persecution'' — Paul exposes the real motive behind the Judaizers: they push circumcision not from genuine conviction but to avoid persecution from fellow Jews. The cross is offensive to the world; circumcision makes Christianity respectable to Judaism. The Judaizers are cowards hiding behind the Galatians'' flesh.',
   NULL),
  (13, 'For neither they themselves who are circumcised keep the law; but desire to have you circumcised, that they may glory in your flesh.',
   'οὐδὲ γὰρ οἱ περιτετμημένοι αὐτοὶ νόμον φυλάσσουσιν ἀλλὰ θέλουσιν ὑμᾶς περιτέμνεσθαι ἵνα ἐν τῇ ὑμετέρᾳ σαρκὶ καυχήσωνται',
   'oude gar hoi peritetmēmenoi autoi nomon phylassousin alla thelousin hymas peritemnesthai hina en tē hymetera sarki kauchēsōntai',
   '''They themselves who are circumcised'' (hoi peritetmēmenoi — the circumcision party). ''Keep the law'' (nomon phylassousin — guard, observe the law). They don''t even keep the law themselves! Their second motive: ''glory in your flesh'' (en tē hymetera sarki kauchēsōntai — boast about your flesh, count your circumcisions as trophies). The Judaizers are hypocrites: they don''t keep the law they impose on others, and they use converts as notches on their belts.',
   NULL),
  (14, 'But God forbid that I should glory, save in the cross of our Lord Jesus Christ, by whom the world is crucified unto me, and I unto the world.',
   'ἐμοὶ δὲ μὴ γένοιτο καυχᾶσθαι εἰ μὴ ἐν τῷ σταυρῷ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ δι᾽ οὗ ἐμοὶ κόσμος ἐσταύρωται κἀγὼ τῷ κόσμῳ',
   'emoi de mē genoito kauchasthai ei mē en tō staurō tou kyriou hēmōn Iēsou Christou di'' hou emoi kosmos estaurōtai kagō tō kosmō',
   '''God forbid'' (mē genoito — may it never be! the strongest negation in Greek). ''Glory'' (kauchasthai — boast, take pride in). ''Save in the cross'' (ei mē en tō staurō — except in the cross; the cross is Paul''s sole ground for boasting). ''The world is crucified unto me, and I unto the world'' — a double crucifixion: the world has lost its hold on Paul, and Paul has lost his attraction to the world. The cross is not merely a doctrine to believe but a power that severs the believer from the world''s value system.',
   'Glorying in the cross: This is the climactic statement of the epistle. Against the Judaizers who glory in flesh (circumcision, law-keeping, external markers), Paul glories only in the cross — the very thing the Judaizers flee from. The cross destroys all human boasting (1 Cor 1:18-31). It is simultaneously the most shameful and the most glorious object in the universe. Through the cross, Paul has been crucified to the world and the world to him — a total break with the old order.'),
  (15, 'For in Christ Jesus neither circumcision availeth any thing, nor uncircumcision, but a new creature.',
   'ἐν γὰρ Χριστῷ Ἰησοῦ οὔτε περιτομή τι ἰσχύει οὔτε ἀκροβυστία ἀλλὰ καινὴ κτίσις',
   'en gar Christō Iēsou oute peritomē ti ischyei oute akrobystia alla kainē ktisis',
   '''Neither circumcision ... nor uncircumcision'' (cf. 5:6 — the same formula, but here the climax is different). ''New creature'' (kainē ktisis — new creation; kainē means new in quality, not merely new in time). External religious status is irrelevant; what matters is the radical, inward transformation of new creation. This echoes 2 Cor 5:17: ''If any man be in Christ, he is a new creature: old things are passed away; behold, all things are become new.'' The entire argument of Galatians converges here: not law, not liberty, but new life.',
   'The new creation: This is the ultimate answer to the Galatian controversy. The question is not ''circumcision or uncircumcision?'' but ''old creation or new creation?'' In Christ, God has begun a new creation that transcends all external categories. This is not merely moral improvement but an entirely new order of existence, as radical as the original creation. The new creation is the reality that makes both legalism and antinomianism obsolete.'),
  (16, 'And as many as walk according to this rule, peace be on them, and mercy, and upon the Israel of God.',
   'καὶ ὅσοι τῷ κανόνι τούτῳ στοιχήσουσιν εἰρήνη ἐπ᾽ αὐτοὺς καὶ ἔλεος καὶ ἐπὶ τὸν Ἰσραὴλ τοῦ θεοῦ',
   'kai hosoi tō kanoni toutō stoichēsousin eirēnē ep'' autous kai eleos kai epi ton Israēl tou theou',
   '''Rule'' (kanoni — a measuring rod, a standard, a canon; the standard is the new creation principle of v.15). ''Walk according to'' (stoichēsousin — will keep in step with, will march in line with; same verb as 5:25). ''Peace ... and mercy'' — the priestly benediction inverted: usually ''mercy and peace''; Paul puts peace first, echoing the reconciliation accomplished by the cross. ''The Israel of God'' (ton Israēl tou theou) — debated: either (a) believing Jews specifically, or (b) all believers as the true, spiritual Israel. In context, ''the Israel of God'' is likely all who walk by this rule — the new-creation people of God, whether Jew or Gentile.',
   'The Israel of God: This phrase has generated much debate. In the context of Galatians, where Paul has argued that ''they which are of faith, the same are the children of Abraham'' (3:7) and that the true seed of Abraham includes all believers (3:28-29), ''the Israel of God'' most naturally refers to the whole believing community — the new-creation people who walk by the rule of v.15. This does not replace ethnic Israel but identifies the true people of God by faith, not by circumcision.'),
  (17, 'From henceforth let no man trouble me: for I bear in my body the marks of the Lord Jesus.',
   'Τοῦ λοιποῦ κόπους μοι μηδεὶς παρεχέτω ἐγὼ γὰρ τὰ στίγματα τοῦ κυρίου Ἰησοῦ ἐν τῷ σώματί μου βαστάζω',
   'Tou loipou kopous moi mēdeis parechetō egō gar ta stigmata tou kyriou Iēsou en tō sōmati mou bastadzō',
   '''Trouble'' (kopous parechetō — let no one cause me troubles, give me grief). ''Marks'' (stigmata — brand-marks, tattoos; the marks burnt or cut into a slave''s skin to show ownership). Paul carries in his body the scars of beatings, stonings, and persecutions (2 Cor 11:23-25) — these are his ''brand-marks'' of belonging to Christ. The Judaizers boast of circumcision marks in others'' flesh; Paul boasts of suffering marks in his own flesh. His credentials are not ritual cuts but genuine wounds received in Christ''s service.',
   NULL),
  (18, 'Brethren, the grace of our Lord Jesus Christ be with your spirit. Amen.',
   'Ἡ χάρις τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μετὰ τοῦ πνεύματος ὑμῶν ἀδελφοί ἀμήν',
   'Hē charis tou kyriou hēmōn Iēsou Christou meta tou pneumatos hymōn adelphoi amēn',
   '''Grace'' (charis — the unmerited favour of God; the word that has been the epistle''s theme). ''With your spirit'' (meta tou pneumatos hymōn — with your spirit; an unusually intimate closing). ''Brethren'' (adelphoi — placed emphatically at the end; despite his severe rebukes, Paul''s final word is one of affection). The epistle that began with a rebuke (1:6) and contained the sternest warnings ends with ''grace'' and ''brethren.'' The last word is not law but grace; the last tone is not anger but love.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Galatians' AND c.chapter_number = 6;

-- Step 3: Word Studies for key verses

-- Verse 1 (Restore the fallen)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καταρτίζετε', 'katartizete', 'G2675', 'Restore, mend, put in order — from katartizō (to fit together, to make complete). Used of mending broken nets (Matt 4:21) and setting broken bones (medical usage). Present imperative: keep on restoring. The word implies skilled, careful repair — not harsh judgment but patient reconstruction of a broken person.', 1),
  ('παραπτώματι', 'paraptōmati', 'G3900', 'A trespass, a false step, a slip — from paraptōma (a fall beside the path, a deviation). Distinguished from deliberate, premeditated sin; this is a stumble, a lapse. The word suggests the person did not intend to fall but was caught off guard.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = 1;

-- Verse 2 (Bear burdens / law of Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βάρη', 'barē', 'G922', 'Burdens, heavy loads — weighty, crushing loads that are too much for one person to bear alone. Distinguished from phortion (v.5), which is a normal, manageable load. These are the extraordinary trials, temptations, and sorrows that require communal support.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = 2;

-- Verse 7 (Sowing and reaping)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μυκτηρίζεται', 'myktērizetai', 'G3456', 'Mocked, sneered at, turned up the nose at — from myktēr (the nose). To treat with contempt, to thumb one''s nose at. Used only here in the NT. God is not fooled by outward piety that hides inward corruption. No one can cheat the harvest.', 1),
  ('σπείρῃ', 'speirē', 'G4687', 'Sow, scatter seed — from speirō. The agricultural metaphor applied to moral and spiritual investment. Whatever seeds a person scatters in life — whether fleshly or spiritual — will inevitably produce a corresponding harvest.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = 7;

-- Verse 14 (Glory in the cross)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σταυρῷ', 'staurō', 'G4716', 'Cross — the instrument of crucifixion, the most shameful form of Roman execution. For Paul, the cross is not merely historical event but the power that severs the believer from the world''s value system. The cross is simultaneously the world''s worst shame and Christianity''s greatest glory.', 1),
  ('ἐσταύρωται', 'estaurōtai', 'G4717', 'Has been crucified — perfect passive: was crucified and remains in that state. A double crucifixion: the world has been crucified to Paul (it is dead to him, stripped of its power), and Paul has been crucified to the world (he is dead to it, stripped of worldly ambition). This is the practical outworking of 2:20.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = 14;

-- Verse 15 (New creature)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καινὴ', 'kainē', 'G2537', 'New in quality — not neos (new in time) but kainos (new in kind, fresh, unprecedented). The new creation is not a renovation of the old but something qualitatively different — a new order of existence that transcends the old categories of circumcision and uncircumcision.', 1),
  ('κτίσις', 'ktisis', 'G2937', 'Creation, creature — from ktizō (to create). The same word used for God''s original creation of the world. In Christ, God performs a creation as radical as the first: bringing into being something that did not previously exist. The new creation is the eschatological reality breaking into the present.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = 15;

-- Verse 17 (Marks of the Lord Jesus)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στίγματα', 'stigmata', 'G4742', 'Brand-marks, tattoo-marks — from stizō (to prick, to brand). In the ancient world, slaves, soldiers, and devotees of pagan cults were branded with their master''s or deity''s mark. Paul''s scars from persecutions (2 Cor 11:23-25) are his brand-marks of belonging to Christ — far more significant than circumcision marks.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Restore the fallen
  (1, 'Matthew 18:15', 1), (1, 'James 5:19-20', 2), (1, '1 Corinthians 10:12', 3),
  -- v2: Bear burdens / law of Christ
  (2, 'John 13:34', 1), (2, 'Romans 15:1', 2), (2, '1 John 3:16', 3),
  -- v5: Bear own burden
  (5, 'Romans 14:12', 1), (5, '2 Corinthians 5:10', 2),
  -- v7: Sowing and reaping
  (7, 'Job 4:8', 1), (7, 'Hosea 8:7', 2), (7, '2 Corinthians 9:6', 3),
  -- v8: Flesh/Spirit reaping
  (8, 'Romans 8:13', 1), (8, 'John 6:63', 2),
  -- v9: Weary in well doing
  (9, '2 Thessalonians 3:13', 1), (9, '1 Corinthians 15:58', 2), (9, 'Hebrews 12:3', 3),
  -- v10: Do good to all
  (10, '1 Thessalonians 5:15', 1), (10, 'Ephesians 2:19', 2),
  -- v14: Glory in the cross
  (14, '1 Corinthians 1:18', 1), (14, '1 Corinthians 2:2', 2), (14, 'Galatians 2:20', 3), (14, 'Philippians 3:7-8', 4),
  -- v15: New creature
  (15, '2 Corinthians 5:17', 1), (15, 'Galatians 5:6', 2), (15, 'Ephesians 2:10', 3),
  -- v16: Israel of God
  (16, 'Galatians 3:7-9', 1), (16, 'Romans 9:6', 2), (16, 'Philippians 3:3', 3),
  -- v17: Marks of Jesus
  (17, '2 Corinthians 11:23-25', 1), (17, 'Colossians 1:24', 2),
  -- v18: Grace be with your spirit
  (18, 'Philippians 4:23', 1), (18, 'Philemon 1:25', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 6 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Galatians Chapter 6 Complete
-- 18 verses · 6 key verses with word studies (11 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
