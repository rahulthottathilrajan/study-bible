-- ═══════════════════════════════════════════════════
-- 1 TIMOTHY CHAPTER 5 — Widows, Elders, and Practical Church Governance
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  '1 Timothy 5 addresses the practical governance of the church community, focusing on how to treat different groups. Paul begins with general principles: ''Rebuke not an elder, but intreat him as a father; and the younger men as brethren; the elder women as mothers; the younger as sisters, with all purity'' (vv.1-2). The chapter''s largest section concerns widows: ''Honour widows that are widows indeed'' (v.3). True widows are ''desolate'' and ''trusteth in God'' (v.5). The church should enrol widows ''not under threescore years old'' who have demonstrated faithful service (vv.9-10). Younger widows should marry rather than be enrolled (vv.11-14). Family members bear primary responsibility: ''if any provide not for his own ... he hath denied the faith, and is worse than an infidel'' (v.8). Regarding elders: ''Let the elders that rule well be counted worthy of double honour, especially they who labour in the word and doctrine'' (v.17). ''The labourer is worthy of his reward'' (v.18). Accusations against elders require two or three witnesses (v.19). ''Them that sin rebuke before all, that others also may fear'' (v.20). Paul charges Timothy before God to observe these instructions ''without preferring one before another, doing nothing by partiality'' (v.21). Practical counsel follows: ''Lay hands suddenly on no man'' (v.22) and a health note: ''use a little wine for thy stomach''s sake'' (v.23). The chapter closes noting that some sins and good works are immediately visible while others appear later (vv.24-25).',
  'Honour Widows, Respect Elders, Guard Impartiality',
  'τιμή (timē)',
  'Honour — respect, value, worth; also financial support. In this chapter, ''honour'' carries both senses: treat with respect and provide material support. Widows are to be ''honoured'' (vv.3, 17) in both senses, and elders who rule well deserve ''double honour'' — double respect and double financial support.',
  '["Treating the Church Family (vv.1-2): Rebuke not an elder but intreat him as a father and the younger men as brethren the elder women as mothers the younger as sisters with all purity","Instructions Concerning Widows (vv.3-16): Honour widows that are widows indeed; but if any widow have children or nephews let them learn first to shew piety at home; now she that is a widow indeed and desolate trusteth in God; if any provide not for his own and specially for those of his own house he hath denied the faith and is worse than an infidel; let not a widow be taken into the number under threescore years old; but the younger widows refuse for when they have begun to wax wanton against Christ they will marry; if any man or woman that believeth have widows let them relieve them and let not the church be charged","Instructions Concerning Elders (vv.17-20): Let the elders that rule well be counted worthy of double honour especially they who labour in the word and doctrine; for the scripture saith thou shalt not muzzle the ox that treadeth out the corn and the labourer is worthy of his reward; against an elder receive not an accusation but before two or three witnesses; them that sin rebuke before all that others also may fear","Charges to Timothy (vv.21-25): I charge thee before God and the Lord Jesus Christ and the elect angels that thou observe these things without preferring one before another doing nothing by partiality; lay hands suddenly on no man neither be partaker of other men''s sins keep thyself pure; drink no longer water but use a little wine for thy stomach''s sake; some men''s sins are open beforehand going before to judgment and some men they follow after; likewise also the good works of some are manifest beforehand and they that are otherwise cannot be hid"]'
FROM books b WHERE b.name = '1 Timothy';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Rebuke not an elder, but intreat him as a father; and the younger men as brethren;',
   'Πρεσβυτέρῳ μὴ ἐπιπλήξῃς ἀλλὰ παρακάλει ὡς πατέρα νεωτέρους ὡς ἀδελφούς',
   'Presbyterō mē epiplēxēs alla parakalei hōs patera neōterous hōs adelphous',
   '''Elder'' (presbyterō — an older man; here likely referring to age, not office, since the office of elder is treated in vv.17-19). ''Rebuke not'' (mē epiplēxēs — do not strike verbally, do not speak harshly). ''Intreat'' (parakalei — exhort, appeal, encourage). ''As a father ... as brethren'' — the church is a family; the minister''s approach to correction must reflect family relationships. Respect for age and tenderness toward peers should characterise all church interactions.',
   NULL),
  (2, 'The elder women as mothers; the younger as sisters, with all purity.',
   'πρεσβυτέρας ὡς μητέρας νεωτέρας ὡς ἀδελφὰς ἐν πάσῃ ἁγνείᾳ',
   'presbyteras hōs mēteras neōteras hōs adelphas en pasē hagneia',
   '''Elder women as mothers'' — the same family paradigm. ''Younger as sisters, with all purity'' (en pasē hagneia — with complete moral purity; the emphatic addition regarding younger women reflects the need for a young male pastor to maintain absolute propriety in relationships with younger women). Purity must govern every interaction.',
   NULL),
  (3, 'Honour widows that are widows indeed.',
   'Χήρας τίμα τὰς ὄντως χήρας',
   'Chēras tima tas ontōs chēras',
   '''Honour'' (tima — show respect and provide for; the same word as ''honour thy father and mother,'' which includes material support). ''Widows indeed'' (ontōs chēras — truly widows, genuinely destitute widows without family support). Paul distinguishes between widows with family resources and those who are truly alone and in need. The church''s responsibility is to the truly destitute.',
   NULL),
  (4, 'But if any widow have children or nephews, let them learn first to shew piety at home, and to requite their parents: for that is good and acceptable before God.',
   'εἰ δέ τις χήρα τέκνα ἢ ἔκγονα ἔχει μανθανέτωσαν πρῶτον τὸν ἴδιον οἶκον εὐσεβεῖν καὶ ἀμοιβὰς ἀποδιδόναι τοῖς προγόνοις τοῦτο γάρ ἐστιν καλὸν καὶ ἀπόδεκτον ἐνώπιον τοῦ θεοῦ',
   'ei de tis chēra tekna ē ekgona echei manthanetōsan prōton ton idion oikon eusebein kai amoibas apodidonai tois progonois touto gar estin kalon kai apodekton enōpion tou theou',
   '''Children or nephews'' (tekna ē ekgona — children or grandchildren). ''Shew piety at home'' (ton idion oikon eusebein — practice godliness first in their own household; eusebein applied to family care — caring for parents is an act of worship). ''Requite'' (amoibas apodidonai — pay back, return the debt of care). Children owe their parents; caring for aging parents is ''repayment'' — good and acceptable before God.',
   NULL),
  (5, 'Now she that is a widow indeed, and desolate, trusteth in God, and continueth in supplications and prayers night and day.',
   'ἡ δὲ ὄντως χήρα καὶ μεμονωμένη ἤλπικεν ἐπὶ τὸν θεὸν καὶ προσμένει ταῖς δεήσεσιν καὶ ταῖς προσευχαῖς νυκτὸς καὶ ἡμέρας',
   'hē de ontōs chēra kai memonōmenē ēlpiken epi ton theon kai prosmenei tais deēsesin kai tais proseuchais nyktos kai hēmeras',
   '''Widow indeed'' (ontōs chēra — truly a widow). ''Desolate'' (memonōmenē — left alone, isolated; perfect participle: in a state of being left alone). ''Trusteth in God'' (ēlpiken epi ton theon — has set her hope on God; perfect tense: settled, ongoing trust). ''Night and day'' (nyktos kai hēmeras) — the model widow is characterised by constant prayer and dependence on God. Anna in Luke 2:37 is the exemplar.',
   NULL),
  (6, 'But she that liveth in pleasure is dead while she liveth.',
   'ἡ δὲ σπαταλῶσα ζῶσα τέθνηκεν',
   'hē de spatalōsa zōsa tethnēken',
   '''Liveth in pleasure'' (spatalōsa — living luxuriously, living for self-indulgence; from spatalaō, to live riotously). ''Dead while she liveth'' (zōsa tethnēken — alive physically but dead spiritually; a paradox: biological life but spiritual death). The contrast with v.5 is stark: the true widow trusts God; the self-indulgent widow trusts pleasure. One is spiritually alive; the other is spiritually dead.',
   NULL),
  (7, 'And these things give in charge, that they may be blameless.',
   'καὶ ταῦτα παράγγελλε ἵνα ἀνεπίληπτοι ὦσιν',
   'kai tauta parangelle hina anepilēptoi ōsin',
   '''Give in charge'' (parangelle — command, order). ''Blameless'' (anepilēptoi — above reproach; the same word used of elders in 3:2). Both widows and their families should be beyond reproach — the families by caring for their own, the widows by godly living.',
   NULL),
  (8, 'But if any provide not for his own, and specially for those of his own house, he hath denied the faith, and is worse than an infidel.',
   'εἰ δέ τις τῶν ἰδίων καὶ μάλιστα τῶν οἰκείων οὐ προνοεῖ τὴν πίστιν ἤρνηται καὶ ἔστιν ἀπίστου χείρων',
   'ei de tis tōn idiōn kai malista tōn oikeiōn ou pronoei tēn pistin ērnētai kai estin apistou cheirōn',
   '''Provide not'' (ou pronoei — does not think ahead for, does not plan for the care of). ''His own ... his own house'' (tōn idiōn ... tōn oikeiōn — his relatives ... his immediate household; concentric circles of responsibility). ''Denied the faith'' (tēn pistin ērnētai — has repudiated the faith; perfect tense: a settled denial). ''Worse than an infidel'' (apistou cheirōn — worse than an unbeliever; even pagans care for their families). This is one of the strongest condemnations in the NT: failing to provide for family is a practical denial of the faith, falling below even pagan standards.',
   'Providing for one''s own: This verse establishes a fundamental principle: faith must be expressed in practical family care. Neglecting one''s own family while claiming to serve God is a contradiction that effectively denies the faith. The principle has broad application: financial provision, emotional support, and physical care for aging parents and dependent relatives. Christianity does not diminish family responsibility — it intensifies it.'),
  (9, 'Let not a widow be taken into the number under threescore years old, having been the wife of one man,',
   'χήρα καταλεγέσθω μὴ ἔλαττον ἐτῶν ἑξήκοντα γεγονυῖα ἑνὸς ἀνδρὸς γυνή',
   'chēra katalegestho mē elatton etōn hexēkonta gegonya henos andros gynē',
   '''Taken into the number'' (katalegestho — enrolled, registered on the official list; a technical term for formal enrollment). ''Threescore years old'' (etōn hexēkonta — sixty years). ''Wife of one man'' (henos andros gynē — a one-man woman; the female counterpart of the elder qualification in 3:2). The church maintained an official register of widows who received ongoing support and served in prayer ministry. Qualification: at least 60 years old and a faithful wife.',
   NULL),
  (10, 'Well reported of for good works; if she have brought up children, if she have lodged strangers, if she have washed the saints'' feet, if she have relieved the afflicted, if she have diligently followed every good work.',
   'ἐν ἔργοις καλοῖς μαρτυρουμένη εἰ ἐτεκνοτρόφησεν εἰ ἐξενοδόχησεν εἰ ἁγίων πόδας ἔνιψεν εἰ θλιβομένοις ἐπήρκεσεν εἰ παντὶ ἔργῳ ἀγαθῷ ἐπηκολούθησεν',
   'en ergois kalois martyroumenē ei eteknotrophēsen ei exenodochēsen ei hagiōn podas enipsen ei thlibomenois epērkesen ei panti ergō agathō epēkolouthēsen',
   'Five evidences of faithful service: (1) ''brought up children'' (eteknotrophēsen — raised children, possibly including orphans). (2) ''Lodged strangers'' (exenodochēsen — showed hospitality, took in travellers). (3) ''Washed the saints'' feet'' (hagiōn podas enipsen — humble, practical service to fellow believers). (4) ''Relieved the afflicted'' (thlibomenois epērkesen — helped the suffering, supported the oppressed). (5) ''Diligently followed every good work'' (panti ergō agathō epēkolouthēsen — pursued every kind of good deed). These are not extraordinary achievements but a lifetime pattern of humble, practical service.',
   NULL),
  (11, 'But the younger widows refuse: for when they have begun to wax wanton against Christ, they will marry;',
   'νεωτέρας δὲ χήρας παραιτοῦ ὅταν γὰρ καταστρηνιάσωσιν τοῦ Χριστοῦ γαμεῖν θέλουσιν',
   'neōteras de chēras paraitou hotan gar katastrēniasōsin tou Christou gamein thelousin',
   '''Refuse'' (paraitou — decline to enrol; not reject as persons but decline to place on the official widow register). ''Wax wanton against Christ'' (katastrēniasōsin tou Christou — feel sensual desires that override their commitment to Christ; the desire for marriage overrides their pledge of exclusive devotion). Paul is not condemning marriage (v.14 recommends it) but warning against an unrealistic pledge of permanent celibacy that cannot be sustained.',
   NULL),
  (12, 'Having damnation, because they have cast off their first faith.',
   'ἔχουσαι κρίμα ὅτι τὴν πρώτην πίστιν ἠθέτησαν',
   'echousai krima hoti tēn prōtēn pistin ēthetēsan',
   '''Damnation'' (krima — judgment, condemnation; not necessarily eternal damnation but serious censure). ''Cast off their first faith'' (tēn prōtēn pistin ēthetēsan — set aside their original pledge; the ''first faith'' likely refers to a vow of service taken when enrolled as a widow). Breaking a solemn commitment brings judgment — not for desiring marriage but for violating a sacred pledge.',
   NULL),
  (13, 'And withal they learn to be idle, wandering about from house to house; and not only idle, but tattlers also and busybodies, speaking things which they ought not.',
   'ἅμα δὲ καὶ ἀργαὶ μανθάνουσιν περιερχόμεναι τὰς οἰκίας οὐ μόνον δὲ ἀργαὶ ἀλλὰ καὶ φλύαροι καὶ περίεργοι λαλοῦσαι τὰ μὴ δέοντα',
   'hama de kai argai manthanousin perierchomenai tas oikias ou monon de argai alla kai phlyaroi kai periergoi lalousai ta mē deonta',
   '''Idle'' (argai — inactive, not working; from a- not + ergon, work). ''Wandering about from house to house'' (perierchomenai tas oikias — going around the houses). ''Tattlers'' (phlyaroi — gossips, babblers; those who talk nonsense). ''Busybodies'' (periergoi — meddlers in others'' affairs; from peri, around + ergon, work: those who work around others'' business instead of their own). The progression: idleness → gossip → meddling. Unstructured time without purposeful service leads to destructive behaviour.',
   NULL),
  (14, 'I will therefore that the younger women marry, bear children, guide the house, give none occasion to the adversary to speak reproachfully.',
   'βούλομαι οὖν νεωτέρας γαμεῖν τεκνογονεῖν οἰκοδεσποτεῖν μηδεμίαν ἀφορμὴν διδόναι τῷ ἀντικειμένῳ λοιδορίας χάριν',
   'boulomai oun neōteras gamein teknogonein oikodespotein mēdemian aphormēn didonai tō antikeimenō loidorias charin',
   '''I will'' (boulomai — I desire, I determine). ''Marry'' (gamein). ''Bear children'' (teknogonein). ''Guide the house'' (oikodespotein — manage the household; from oikos + despotēs; the woman is the ''despot'' of the home — she rules it). ''Give none occasion to the adversary'' (mēdemian aphormēn didonai tō antikeimenō — give no base of operations to the opponent). Paul''s preference for younger widows: productive domestic life rather than premature enrolment in the widow order.',
   NULL),
  (15, 'For some are already turned aside after Satan.',
   'ἤδη γάρ τινες ἐξετράπησαν ὀπίσω τοῦ Σατανᾶ',
   'ēdē gar tines exetrapēsan opisō tou Satana',
   '''Turned aside'' (exetrapēsan — swerved, deviated from the path). ''After Satan'' (opisō tou Satana — to follow Satan). This was not a hypothetical risk but an actual occurrence — some younger widows had already abandoned the faith. The practical wisdom of vv.11-14 is grounded in bitter experience.',
   NULL),
  (16, 'If any man or woman that believeth have widows, let them relieve them, and let not the church be charged; that it may relieve them that are widows indeed.',
   'εἴ τις πιστὸς ἢ πιστὴ ἔχει χήρας ἐπαρκείτω αὐταῖς καὶ μὴ βαρείσθω ἡ ἐκκλησία ἵνα ταῖς ὄντως χήραις ἐπαρκέσῃ',
   'ei tis pistos ē pistē echei chēras eparkeitō autais kai mē bareisthō hē ekklēsia hina tais ontōs chērais eparkesē',
   '''Relieve'' (eparkeitō — provide sufficient aid, give assistance). ''Let not the church be charged'' (mē bareisthō hē ekklēsia — let the church not be burdened). ''Widows indeed'' (ontōs chērais — the truly destitute). The summary principle: family members must care for their own widows so that the church''s limited resources can be directed to those who have no family. Stewardship of the church''s benevolence fund requires triage: help the most needy first.',
   NULL),
  (17, 'Let the elders that rule well be counted worthy of double honour, especially they who labour in the word and doctrine.',
   'Οἱ καλῶς προεστῶτες πρεσβύτεροι διπλῆς τιμῆς ἀξιούσθωσαν μάλιστα οἱ κοπιῶντες ἐν λόγῳ καὶ διδασκαλίᾳ',
   'Hoi kalōs proestōtes presbyteroi diplēs timēs axiousthōsan malista hoi kopiōntes en logō kai didaskalia',
   '''Elders that rule well'' (kalōs proestōtes presbyteroi — elders who lead well, who stand before the congregation effectively). ''Double honour'' (diplēs timēs — double respect and double remuneration; timē includes both respect and financial support). ''Especially they who labour in the word and doctrine'' (malista hoi kopiōntes en logō kai didaskalia — especially those who toil in preaching and teaching). This distinguishes between ruling elders and teaching elders; those who do the hard work of preaching and teaching deserve special recognition and support.',
   'Double honour for teaching elders: This verse establishes the principle that those who devote themselves to preaching and teaching in the church deserve both respect and financial support. ''Double honour'' likely means both: doubled respect for their role, and actual remuneration (as v.18 confirms). The word ''labour'' (kopiōntes) means working to the point of exhaustion — genuine preaching and teaching is demanding work that merits proper compensation.'),
  (18, 'For the scripture saith, Thou shalt not muzzle the ox that treadeth out the corn. And, The labourer is worthy of his reward.',
   'λέγει γὰρ ἡ γραφή Βοῦν ἀλοῶντα οὐ φιμώσεις καί Ἄξιος ὁ ἐργάτης τοῦ μισθοῦ αὐτοῦ',
   'legei gar hē graphē Boun aloōnta ou phimōseis kai Axios ho ergatēs tou misthou autou',
   'Two quotations supporting ministerial support: (1) ''Thou shalt not muzzle the ox'' — from Deuteronomy 25:4 (also cited by Paul in 1 Cor 9:9). The ox that treads the grain should eat while working. (2) ''The labourer is worthy of his reward'' — from Luke 10:7 (or Matt 10:10). Remarkably, Paul calls both the OT and Jesus'' words ''Scripture'' (hē graphē), placing Luke''s Gospel on the same level as Deuteronomy. This is one of the earliest witnesses to the authority of NT writings as Scripture.',
   NULL),
  (19, 'Against an elder receive not an accusation, but before two or three witnesses.',
   'κατὰ πρεσβυτέρου κατηγορίαν μὴ παραδέχου ἐκτὸς εἰ μὴ ἐπὶ δύο ἢ τριῶν μαρτύρων',
   'kata presbyterou katēgorian mē paradechou ektos ei mē epi dyo ē triōn martyrōn',
   '''Against an elder'' (kata presbyterou — against an elder/overseer in office). ''Receive not'' (mē paradechou — do not accept, do not entertain). ''But before two or three witnesses'' (epi dyo ē triōn martyrōn — the OT standard from Deut 19:15). Elders are to be protected from frivolous or malicious accusations. Given their public visibility, they are easy targets; the two-witness requirement provides a shield without making them untouchable.',
   NULL),
  (20, 'Them that sin rebuke before all, that others also may fear.',
   'τοὺς ἁμαρτάνοντας ἐνώπιον πάντων ἔλεγχε ἵνα καὶ οἱ λοιποὶ φόβον ἔχωσιν',
   'tous hamartanontas enōpion pantōn elenche hina kai hoi loipoi phobon echōsin',
   '''Them that sin'' (tous hamartanontas — those who keep on sinning; present participle: ongoing sin, not a single lapse). ''Rebuke before all'' (enōpion pantōn elenche — reprove publicly, in the sight of all). ''That others also may fear'' (hina kai hoi loipoi phobon echōsin — so that the rest may have a healthy fear). Public sin requires public discipline — not for humiliation but for the deterrent effect on the entire community. This likely applies to elders whose sin is confirmed by witnesses (v.19).',
   NULL),
  (21, 'I charge thee before God, and the Lord Jesus Christ, and the elect angels, that thou observe these things without preferring one before another, doing nothing by partiality.',
   'Διαμαρτύρομαι ἐνώπιον τοῦ θεοῦ καὶ κυρίου Ἰησοῦ Χριστοῦ καὶ τῶν ἐκλεκτῶν ἀγγέλων ἵνα ταῦτα φυλάξῃς χωρὶς προκρίματος μηδὲν ποιῶν κατὰ πρόσκλισιν',
   'Diamartyromai enōpion tou theou kai kyriou Iēsou Christou kai tōn eklektōn angelōn hina tauta phylaxēs chōris prokrimatos mēden poiōn kata prosklisin',
   '''I charge thee'' (diamartyromai — solemnly testify, earnestly command; the strongest form of command). ''Before God, and the Lord Jesus Christ, and the elect angels'' — a triple witness that elevates this charge to the highest possible solemnity. ''Without preferring'' (chōris prokrimatos — without pre-judgment, without prejudice). ''Partiality'' (prosklisin — leaning toward, inclining to one side). Impartiality in church discipline is not optional — it is a solemn charge witnessed by God, Christ, and angels.',
   NULL),
  (22, 'Lay hands suddenly on no man, neither be partaker of other men''s sins: keep thyself pure.',
   'χεῖρας ταχέως μηδενὶ ἐπιτίθει μηδὲ κοινώνει ἁμαρτίαις ἀλλοτρίαις σεαυτὸν ἁγνὸν τήρει',
   'cheiras tacheōs mēdeni epitithei mēde koinōnei hamartiais allotriais seauton hagnon tērei',
   '''Lay hands suddenly on no man'' (cheiras tacheōs mēdeni epitithei — do not hastily ordain anyone; or do not hastily restore a disciplined person). ''Partaker of other men''s sins'' (koinōnei hamartiais allotriais — share in others'' sins). ''Keep thyself pure'' (seauton hagnon tērei — guard your own purity). The warning: hasty ordination or premature restoration makes the one who acts share responsibility for subsequent failures. Due diligence protects both the individual and the church.',
   NULL),
  (23, 'Drink no longer water, but use a little wine for thy stomach''s sake and thine often infirmities.',
   'Μηκέτι ὑδροπότει ἀλλ᾽ οἴνῳ ὀλίγῳ χρῶ διὰ τὸν στόμαχόν σου καὶ τὰς πυκνάς σου ἀσθενείας',
   'Mēketi hydropotei all'' oinō oligō chrō dia ton stomachon sou kai tas pyknas sou astheneias',
   '''Drink no longer water'' (mēketi hydropotei — stop being exclusively a water-drinker). ''A little wine'' (oinō oligō — a small amount of wine). ''Thy stomach''s sake'' (dia ton stomachon sou — for your digestive system). ''Often infirmities'' (pyknas astheneias — frequent ailments). A pastoral aside: Timothy''s ascetic practice of drinking only water was damaging his health. Paul advises moderate medicinal use of wine. This personal note reveals Timothy''s tendency toward over-scrupulousness and Paul''s practical, balanced wisdom.',
   NULL),
  (24, 'Some men''s sins are open beforehand, going before to judgment; and some men they follow after.',
   'τινῶν ἀνθρώπων αἱ ἁμαρτίαι πρόδηλοί εἰσιν προάγουσαι εἰς κρίσιν τισὶν δὲ καὶ ἐπακολουθοῦσιν',
   'tinōn anthrōpōn hai hamartiai prodēloi eisin proagousai eis krisin tisin de kai epakolouthousin',
   '''Open beforehand'' (prodēloi — evident, clearly visible, obvious before investigation). ''Going before to judgment'' (proagousai eis krisin — preceding to the verdict; some sins arrive at the courtroom before the sinner does). ''Follow after'' (epakolouthousin — trail behind, come to light later). This connects to v.22: some candidates for ministry have obvious disqualifying sins; others have hidden sins that only emerge later. Both will ultimately be revealed — hence the need for careful evaluation.',
   NULL),
  (25, 'Likewise also the good works of some are manifest beforehand; and they that are otherwise cannot be hid.',
   'ὡσαύτως καὶ τὰ καλὰ ἔργα πρόδηλά ἐστιν καὶ τὰ ἄλλως ἔχοντα κρυβῆναι οὐ δύναται',
   'hōsautōs kai ta kala erga prodēla estin kai ta allōs echonta krybēnai ou dynatai',
   '''Good works of some are manifest'' (ta kala erga prodēla — some good works are immediately visible). ''They that are otherwise cannot be hid'' (ta allōs echonta krybēnai ou dynatai — those that are different, i.e., not yet visible, cannot remain hidden forever). The same principle applies to good works as to sins: some are immediately obvious; others emerge over time. God sees all — and time reveals all. This encourages patient evaluation of character rather than hasty decisions.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Timothy' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 8 (Provide for his own)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προνοεῖ', 'pronoei', 'G4306', 'Provides, thinks ahead for, plans for the care of — from pro (before, ahead) + noeō (to think, to perceive). Not merely reactive giving but proactive planning and provision. The failure to provide is not a minor lapse but a fundamental denial of the faith — because the faith teaches love, and love provides.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 5 AND v.verse_number = 8;

-- Verse 17 (Double honour)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('διπλῆς τιμῆς', 'diplēs timēs', 'G1362+G5092', 'Double honour — diplēs (double, twofold) + timēs (honour, value, price). Timē can mean both respect/honour and financial value/remuneration (the root of our ''estimate''). The double honour likely includes both: doubled respect for their work and material support/compensation. V.18 confirms the financial dimension by citing the principle of fair wages.', 1),
  ('κοπιῶντες', 'kopiōntes', 'G2872', 'Labouring, toiling — from kopos (weariness, exhaustion from work). Not casual effort but strenuous toil to the point of fatigue. Preaching and teaching, when done faithfully, is demanding intellectual, emotional, and spiritual labour that deserves recognition and support.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 5 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Rebuke not an elder
  (1, 'Leviticus 19:32', 1),
  -- v4: Children requite parents
  (4, 'Mark 7:10-13', 1), (4, 'Ephesians 6:1-2', 2),
  -- v5: Widow trusts in God
  (5, 'Luke 2:36-37', 1), (5, 'Psalm 68:5', 2),
  -- v8: Provide for his own
  (8, 'Isaiah 58:7', 1), (8, 'Galatians 6:10', 2),
  -- v17: Double honour
  (17, '1 Corinthians 9:7-14', 1), (17, 'Galatians 6:6', 2),
  -- v18: Ox treading / labourer worthy
  (18, 'Deuteronomy 25:4', 1), (18, 'Luke 10:7', 2), (18, '1 Corinthians 9:9', 3),
  -- v19: Two or three witnesses
  (19, 'Deuteronomy 19:15', 1), (19, 'Matthew 18:16', 2),
  -- v20: Rebuke before all
  (20, 'Galatians 2:11-14', 1),
  -- v22: Lay hands suddenly on no man
  (22, '1 Timothy 4:14', 1), (22, '2 Timothy 1:6', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Timothy Chapter 5 Complete
-- 25 verses · 2 key verses with word studies (4 words)
-- Cross-references for 9 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
