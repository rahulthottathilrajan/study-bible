-- ═══════════════════════════════════════════════════
-- COLOSSIANS CHAPTER 4 — Final Instructions & Greetings
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Colossians 4 concludes the epistle with practical instructions that reveal how the exalted theology of chapters 1-3 translates into daily life. Paul addresses masters (v.1), prayer (vv.2-4), conduct toward outsiders (vv.5-6), and then introduces a remarkable cast of co-workers whose brief mentions illuminate the texture of early Christianity: Tychicus the faithful messenger, Onesimus the converted slave, Aristarchus the fellow prisoner, Mark the restored deserter, Justus the comforter, Epaphras the prayer warrior, Luke the physician, Demas who later defected, and the mysterious Nympha with her house church. The chapter reveals that the cosmic Christ of 1:15-20 is also the Christ of ordinary greetings, workplace ethics, prison cells, and handwritten signatures.',
  'Living Wisely & the Fellowship of Christ''s Workers',
  'σοφίᾳ (sophia)',
  'Wisdom — the practical skill of living rightly before God and man. Not abstract philosophy (2:8) but Spirit-given discernment applied to daily encounters, especially with unbelievers.',
  '["Masters'' Duty (v.1): Give servants what is just and equal, knowing you have a Master in heaven","Devotion to Prayer (vv.2-4): Continue in prayer with thanksgiving; pray for an open door for the mystery of Christ","Wisdom Toward Outsiders (vv.5-6): Walk in wisdom; redeem the time; let your speech be with grace, seasoned with salt","Tychicus and Onesimus Sent (vv.7-9): Faithful minister Tychicus and faithful brother Onesimus carry the letter","Greetings from Co-workers (vv.10-14): Aristarchus, Mark, Justus, Epaphras, Luke, Demas","Instructions to Laodicea and Archippus (vv.15-17): Exchange letters with Laodicea; tell Archippus to fulfil his ministry","Paul''s Autograph (v.18): Remember my bonds; grace be with you"]'
FROM books b WHERE b.name = 'Colossians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Masters, give unto your servants that which is just and equal; knowing that ye also have a Master in heaven.',
   'Οἱ κύριοι τὸ δίκαιον καὶ τὴν ἰσότητα τοῖς δούλοις παρέχεσθε εἰδότες ὅτι καὶ ὑμεῖς ἔχετε κύριον ἐν οὐρανοῖς',
   'Hoi kyrioi to dikaion kai tēn isotēta tois doulois parechesthe eidotes hoti kai hymeis echete kyrion en ouranois',
   '''Masters'' (kyrioi — lords, those with authority). ''Just'' (dikaion — righteous, fair) and ''equal'' (isotēta — equity, fairness; not identical treatment but proportional justice). The motivation: ''ye also have a Master in heaven.'' The earthly master is himself a slave of the heavenly Master. This revolutionises the master-slave relationship from within: accountability to God levels all power structures. Paul does not here abolish slavery directly but plants the seeds that would eventually destroy it — mutual accountability before a common Lord.',
   NULL),
  (2,
   'Continue in prayer, and watch in the same with thanksgiving;',
   'Τῇ προσευχῇ προσκαρτερεῖτε γρηγοροῦντες ἐν αὐτῇ ἐν εὐχαριστίᾳ',
   'Tē proseuchē proskartereite grēgorountes en autē en eucharistia',
   '''Continue'' (proskartereite — persist, be devoted to, hold fast to; present imperative: make prayer a constant practice). ''Watch'' (grēgorountes — stay alert, be vigilant, keep awake; from egeirō, to rouse). Prayer requires both persistence and alertness — not drowsy repetition but watchful engagement. ''With thanksgiving'' (en eucharistia) — the fifth and final occurrence in this letter (1:12; 2:7; 3:15,17). Colossians might be called the epistle of thanksgiving.',
   NULL),
  (3,
   'Withal praying also for us, that God would open unto us a door of utterance, to speak the mystery of Christ, for which I am also in bonds:',
   'προσευχόμενοι ἅμα καὶ περὶ ἡμῶν ἵνα ὁ θεὸς ἀνοίξῃ ἡμῖν θύραν τοῦ λόγου λαλῆσαι τὸ μυστήριον τοῦ Χριστοῦ δι᾽ ὃ καὶ δέδεμαι',
   'proseuchomenoi hama kai peri hēmōn hina ho theos anoixē hēmin thyran tou logou lalēsai to mystērion tou Christou di'' ho kai dedemai',
   'Paul, the great apostle, asks for prayer. He does not request release from prison but a ''door of utterance'' (thyran tou logou — a door for the word, an open opportunity to speak). ''The mystery of Christ'' (to mystērion tou Christou) — the central theme of this letter (1:26-27; 2:2). ''For which I am in bonds'' (dedemai — I have been bound, perfect tense: I am in a state of bondage). Paul is chained precisely because he preaches this mystery, yet he asks not for the chains to be removed but for the message to go further.',
   NULL),
  (4,
   'That I may make it manifest, as I ought to speak.',
   'ἵνα φανερώσω αὐτὸ ὡς δεῖ με λαλῆσαι',
   'hina phanerōsō auto hōs dei me lalēsai',
   '''Make manifest'' (phanerōsō — make clear, reveal, display openly). ''As I ought'' (hōs dei — as it is necessary, as duty requires). Paul feels both obligation and desire to make the mystery clear. The gospel must not only be preached but preached clearly — intelligibility is a duty. Foggy, confusing presentation of truth dishonours the message.',
   NULL),
  (5,
   'Walk in wisdom toward them that are without, redeeming the time.',
   'Ἐν σοφίᾳ περιπατεῖτε πρὸς τοὺς ἔξω τὸν καιρὸν ἐξαγοραζόμενοι',
   'En sophia peripateite pros tous exō ton kairon exagorazomenoi',
   '''Walk'' (peripateite — conduct your daily life). ''Wisdom'' (sophia) — not the empty philosophy of 2:8 but practical, Spirit-given discernment. ''Them that are without'' (tous exō — outsiders, non-Christians). ''Redeeming the time'' (ton kairon exagorazomenoi — buying up the opportunity; kairos is not clock time [chronos] but opportune time, the strategic moment; exagorazō means to buy out of the marketplace, to snap up a bargain). Every encounter with an unbeliever is a kairos moment to be seized wisely.',
   NULL),
  (6,
   'Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man.',
   'ὁ λόγος ὑμῶν πάντοτε ἐν χάριτι ἅλατι ἠρτυμένος εἰδέναι πῶς δεῖ ὑμᾶς ἑνὶ ἑκάστῳ ἀποκρίνεσθαι',
   'ho logos hymōn pantote en chariti halati ērtymenos eidenai pōs dei hymas heni hekastō apokrinesthai',
   '''With grace'' (en chariti — gracious, attractive, winsome). ''Seasoned with salt'' (halati ērtymenos — flavoured, prepared as a chef seasons food). Salt preserves, purifies, and adds flavour. Christian speech should be neither bland nor caustic but flavourful and preserving. ''Every man'' (heni hekastō — each individual one by one) — evangelistic and pastoral communication must be tailored to the person, not delivered as a one-size-fits-all formula.',
   NULL),
  (7,
   'All my state shall Tychicus declare unto you, who is a beloved brother, and a faithful minister and fellowservant in the Lord:',
   'Τὰ κατ᾽ ἐμὲ πάντα γνωρίσει ὑμῖν Τυχικὸς ὁ ἀγαπητὸς ἀδελφὸς καὶ πιστὸς διάκονος καὶ σύνδουλος ἐν κυρίῳ',
   'Ta kat'' eme panta gnōrisei hymin Tychikos ho agapētos adelphos kai pistos diakonos kai syndoulos en kyriō',
   'Tychicus is Paul''s letter carrier — the one who physically delivers this epistle (also carried Ephesians, Eph 6:21). Three titles: ''beloved brother'' (agapētos adelphos — cherished family member), ''faithful minister'' (pistos diakonos — trustworthy servant), ''fellowservant'' (syndoulos — co-slave with Paul under the same Lord). Tychicus was from the province of Asia (Acts 20:4) and served as Paul''s trusted envoy. He would read the letter aloud and add verbal details about Paul''s circumstances.',
   NULL),
  (8,
   'Whom I have sent unto you for the same purpose, that he might know your estate, and comfort your hearts;',
   'ὃν ἔπεμψα πρὸς ὑμᾶς εἰς αὐτὸ τοῦτο ἵνα γνῷ τὰ περὶ ὑμῶν καὶ παρακαλέσῃ τὰς καρδίας ὑμῶν',
   'hon epempsa pros hymas eis auto touto hina gnō ta peri hymōn kai parakalesē tas kardias hymōn',
   'Two purposes for sending Tychicus: (1) ''that he might know your estate'' (hina gnō ta peri hymōn — that he might learn your circumstances) and (2) ''comfort your hearts'' (parakalesē tas kardias — encourage, strengthen). The apostle is not just sending information but pastoral care. Even from prison, Paul ensures his churches receive both truth (the letter) and warmth (the messenger).',
   NULL),
  (9,
   'With Onesimus, a faithful and beloved brother, who is one of you. They shall make known unto you all things which are done here.',
   'σὺν Ὀνησίμῳ τῷ πιστῷ καὶ ἀγαπητῷ ἀδελφῷ ὅς ἐστιν ἐξ ὑμῶν πάντα ὑμῖν γνωρίσουσιν τὰ ὧδε',
   'syn Onēsimō tō pistō kai agapētō adelphō hos estin ex hymōn panta hymin gnōrisousin ta hōde',
   'Onesimus — the runaway slave of Philemon, now converted. Paul calls him ''faithful and beloved brother'' — identical language to Tychicus (v.7). The former slave is elevated to full equality with Paul''s trusted envoy. ''Who is one of you'' (hos estin ex hymōn) — he is a Colossian, going home. The letter to Philemon (delivered simultaneously) would prepare Philemon to receive him as a brother (Philem 16). This is the theology of 3:11 in action: ''Christ is all, and in all.''',
   NULL),
  (10,
   'Aristarchus my fellowprisoner saluteth you, and Marcus, sister''s son to Barnabas, (touching whom ye received commandments: if he come unto you, receive him;)',
   'Ἀσπάζεται ὑμᾶς Ἀρίσταρχος ὁ συναιχμάλωτός μου καὶ Μᾶρκος ὁ ἀνεψιὸς Βαρνάβα περὶ οὗ ἐλάβετε ἐντολάς ἐὰν ἔλθῃ πρὸς ὑμᾶς δέξασθε αὐτόν',
   'Aspazetai hymas Aristarchos ho synaichmalōtos mou kai Markos ho anepsios Barnaba peri hou elabete entolas ean elthē pros hymas dexasthe auton',
   'Aristarchus of Thessalonica — ''fellowprisoner'' (synaichmalōtos — co-captive, prisoner of war alongside Paul; he had been with Paul since the Ephesus riot, Acts 19:29, and accompanied him to Rome, Acts 27:2). Mark (Marcus) — ''sister''s son to Barnabas'' (anepsios — cousin, not nephew as KJV implies). This is John Mark who deserted Paul and Barnabas in Acts 13:13, causing the sharp contention of Acts 15:39. Paul''s instruction to ''receive him'' shows full restoration — a living example of the forgiveness taught in 3:13.',
   NULL),
  (11,
   'And Jesus, which is called Justus, who are of the circumcision. These only are my fellowworkers unto the kingdom of God, which have been a comfort unto me.',
   'καὶ Ἰησοῦς ὁ λεγόμενος Ἰοῦστος οἱ ὄντες ἐκ περιτομῆς οὗτοι μόνοι συνεργοὶ εἰς τὴν βασιλείαν τοῦ θεοῦ οἵτινες ἐγενήθησάν μοι παρηγορία',
   'kai Iēsous ho legomenos Ioustos hoi ontes ek peritomēs houtoi monoi synergoi eis tēn basileian tou theou hoitines egenēthēsan moi parēgoria',
   'Jesus Justus — a Jewish believer (''of the circumcision'') otherwise unknown. ''These only'' (houtoi monoi) — of Paul''s Jewish Christian colleagues, only Aristarchus, Mark, and Justus stood with him. The pathos is unmistakable: most Jewish Christians had abandoned Paul''s mission to the Gentiles. ''Comfort'' (parēgoria — solace, consolation; a medical term for soothing treatment — only here in the NT). Even the apostle Paul needed human companionship and comfort in his suffering.',
   NULL),
  (12,
   'Epaphras, who is one of you, a servant of Christ, saluteth you, always labouring fervently for you in prayers, that ye may stand perfect and complete in all the will of God.',
   'ἀσπάζεται ὑμᾶς Ἐπαφρᾶς ὁ ἐξ ὑμῶν δοῦλος Χριστοῦ πάντοτε ἀγωνιζόμενος ὑπὲρ ὑμῶν ἐν ταῖς προσευχαῖς ἵνα σταθῆτε τέλειοι καὶ πεπληρωμένοι ἐν παντὶ θελήματι τοῦ θεοῦ',
   'aspazetai hymas Epaphras ho ex hymōn doulos Christou pantote agōnizomenos hyper hymōn en tais proseuchais hina stathēte teleioi kai peplērōmenoi en panti thelēmati tou theou',
   'Epaphras — the founder of the Colossian church (1:7). ''Labouring fervently'' (agōnizomenos — agonising, straining, contending; from agōn, an athletic contest). This is the same root as ''conflict'' in 2:1. Epaphras''s prayers are not casual but agonising. His prayer goal: ''that ye may stand perfect and complete'' (teleioi kai peplērōmenoi — mature and fully assured). ''Complete'' uses the same peplērōmenoi as 2:10 (''ye are complete in him'') — Epaphras prays for the experiential reality of their doctrinal position.',
   NULL),
  (13,
   'For I bear him record, that he hath a great zeal for you, and them that are in Laodicea, and them in Hierapolis.',
   'μαρτυρῶ γὰρ αὐτῷ ὅτι ἔχει πολὺν πόνον ὑπὲρ ὑμῶν καὶ τῶν ἐν Λαοδικείᾳ καὶ τῶν ἐν Ἱεραπόλει',
   'martyrō gar autō hoti echei polyn ponon hyper hymōn kai tōn en Laodikeia kai tōn en Hierapolei',
   '''Great zeal'' (polyn ponon — much toil, great pain, laborious effort). Paul testifies (martyrō — I bear witness) to Epaphras''s burden for three Lycus Valley churches: Colossae, Laodicea, and Hierapolis — all within about 10 miles of each other. Epaphras apparently planted all three congregations. His pastoral heart extends beyond his home church, and Paul validates this concern with his apostolic witness.',
   NULL),
  (14,
   'Luke, the beloved physician, and Demas, greet you.',
   'ἀσπάζεται ὑμᾶς Λουκᾶς ὁ ἰατρὸς ὁ ἀγαπητὸς καὶ Δημᾶς',
   'aspazetai hymas Loukas ho iatros ho agapētos kai Dēmas',
   'Luke — ''the beloved physician'' (ho iatros ho agapētos). Luke is the author of the Gospel of Luke and Acts, Paul''s travelling companion. His medical skill would have been invaluable to Paul in prison. Demas sends greetings — here mentioned without any title or commendation. The contrast with Luke''s warm description is ominous. In 2 Timothy 4:10, Paul will write: ''Demas hath forsaken me, having loved this present world.'' The seeds of defection may already be visible in this brief, unadorned mention.',
   NULL),
  (15,
   'Salute the brethren which are in Laodicea, and Nymphas, and the church which is in his house.',
   'ἀσπάσασθε τοὺς ἐν Λαοδικείᾳ ἀδελφοὺς καὶ Νύμφαν καὶ τὴν κατ᾽ οἶκον αὐτοῦ ἐκκλησίαν',
   'aspasasthe tous en Laodikeia adelphous kai Nymphan kai tēn kat'' oikon autou ekklēsian',
   'Nymphas (or Nympha, if feminine — the textual tradition is divided) hosted a house church in Laodicea. ''The church which is in his house'' (tēn kat'' oikon autou ekklēsian) — early Christians met in private homes, not purpose-built buildings. The house church was the standard form of Christian assembly for the first three centuries. This reference, along with Philemon 2 and Acts 12:12, shows the domestic setting of early worship.',
   NULL),
  (16,
   'And when this epistle is read among you, cause that it be read also in the church of the Laodiceans; and that ye likewise read the epistle from Laodicea.',
   'καὶ ὅταν ἀναγνωσθῇ παρ᾽ ὑμῖν ἡ ἐπιστολή ποιήσατε ἵνα καὶ ἐν τῇ Λαοδικέων ἐκκλησίᾳ ἀναγνωσθῇ καὶ τὴν ἐκ Λαοδικείας ἵνα καὶ ὑμεῖς ἀναγνῶτε',
   'kai hotan anagnōsthē par'' hymin hē epistolē poiēsate hina kai en tē Laodikeōn ekklēsia anagnōsthē kai tēn ek Laodikeias hina kai hymeis anagnōte',
   'Paul commands letter exchange between Colossae and Laodicea — early evidence of epistles circulating among churches. ''The epistle from Laodicea'' — possibly a now-lost letter, or more likely Ephesians (which was likely a circular letter). Paul expected his letters to be read aloud in corporate worship, treated as authoritative, and shared beyond the original recipients. This is an early step toward the formation of the New Testament canon.',
   'The authority and circulation of apostolic letters: Paul''s instruction to share letters between churches shows his awareness that his writings carried authority beyond local situations. This practice of reading, copying, and exchanging apostolic letters is the seedbed from which the New Testament canon grew.'),
  (17,
   'And say to Archippus, Take heed to the ministry which thou hast received in the Lord, that thou fulfil it.',
   'καὶ εἴπατε Ἀρχίππῳ Βλέπε τὴν διακονίαν ἣν παρέλαβες ἐν κυρίῳ ἵνα αὐτὴν πληροῖς',
   'kai eipate Archippō Blepe tēn diakonian hēn parelabes en kyriō hina autēn plērois',
   '''Say to Archippus'' — a public charge delivered through the congregation. Archippus is also mentioned in Philemon 2 as a ''fellowsoldier.'' ''Take heed'' (blepe — look to, pay attention, be on guard). ''The ministry'' (tēn diakonian — the specific service assignment). ''Which thou hast received in the Lord'' (parelabes en kyriō — received as a sacred trust). ''Fulfil it'' (plērois — fill it up, complete it, carry it out fully). Ministry is a stewardship received from the Lord and must be fulfilled — not abandoned, not half-done, not delegated away.',
   NULL),
  (18,
   'The salutation by the hand of me Paul. Remember my bonds. Grace be with you. Amen.',
   'Ὁ ἀσπασμὸς τῇ ἐμῇ χειρὶ Παύλου μνημονεύετέ μου τῶν δεσμῶν ἡ χάρις μεθ᾽ ὑμῶν ἀμήν',
   'Ho aspasmos tē emē cheiri Paulou mnēmoneuete mou tōn desmōn hē charis meth'' hymōn amēn',
   'Paul takes the pen from his secretary (probably Timothy) to add his personal signature — his authentication mark (cf. 2 Thess 3:17). ''Remember my bonds'' (mnēmoneuete mou tōn desmōn) — not self-pity but a reminder that the truth of this letter cost Paul his freedom. The final word, as always, is ''grace'' (charis) — the letter that began with grace (1:2) ends with grace. Between the first grace and the last, Paul has unfolded the supremacy and sufficiency of Christ in whom all grace is found.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Colossians' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 2 (Continue in prayer)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσκαρτερεῖτε', 'proskartereite', 'G4342', 'Be devoted to, persist in, continue steadfastly — from pros (toward) + kartereō (to be strong). Strong devotion that holds on and does not let go. Used for the early church''s devotion to prayer in Acts 2:42.', 1),
  ('γρηγοροῦντες', 'grēgorountes', 'G1127', 'Watching, keeping alert, staying awake — from egeirō (to rouse from sleep). Vigilant, wakeful prayer that does not grow drowsy or mechanical.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 4 AND v.verse_number = 2;

-- Verse 5 (Redeeming the time)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καιρόν', 'kairon', 'G2540', 'Season, opportune time, strategic moment — not chronos (clock time) but kairos (the decisive, ripe moment). Every encounter is a window of opportunity.', 1),
  ('ἐξαγοραζόμενοι', 'exagorazomenoi', 'G1805', 'Buying up, purchasing from the marketplace, redeeming — seizing opportunities as a shrewd merchant buys up goods at the right moment. Making the most of every chance.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 4 AND v.verse_number = 5;

-- Verse 6 (Speech seasoned with salt)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἅλατι', 'halati', 'G217', 'Salt — that which preserves from corruption, adds flavour, and creates thirst. Christian speech should preserve truth, add flavour to conversation, and create thirst for the gospel.', 1),
  ('ἠρτυμένος', 'ērtymenos', 'G741', 'Seasoned, prepared, flavoured — a culinary term for seasoning food. Speech should be carefully prepared and appropriately flavoured, neither bland nor overpowering.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 4 AND v.verse_number = 6;

-- Verse 11 (Comfort / parēgoria)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παρηγορία', 'parēgoria', 'G3931', 'Comfort, solace, consolation — a medical term for soothing or alleviating pain. These co-workers served as medicine for Paul''s soul. Only here in the NT.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 4 AND v.verse_number = 11;

-- Verse 12 (Epaphras labouring)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγωνιζόμενος', 'agōnizomenos', 'G75', 'Contending, striving, agonising — from agōn (a contest, athletic competition). Epaphras''s prayer life was not passive but an intense spiritual contest. Same root as 1:29 and 2:1.', 1),
  ('τέλειοι', 'teleioi', 'G5046', 'Perfect, mature, complete — not sinless perfection but full spiritual growth. Epaphras prays for their maturity, not merely their safety or comfort.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 4 AND v.verse_number = 12;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Masters give justly
  (1, 'Ephesians 6:9', 1), (1, 'Colossians 3:25', 2), (1, 'Leviticus 25:43', 3),
  -- v2: Continue in prayer
  (2, 'Romans 12:12', 1), (2, 'Ephesians 6:18', 2), (2, 'Luke 18:1', 3),
  -- v3: Open door for the word
  (3, '1 Corinthians 16:9', 1), (3, '2 Corinthians 2:12', 2), (3, 'Ephesians 6:19-20', 3),
  -- v5: Walk in wisdom
  (5, 'Ephesians 5:15-16', 1), (5, 'Proverbs 11:30', 2), (5, '1 Thessalonians 4:12', 3),
  -- v6: Speech with grace
  (6, 'Ephesians 4:29', 1), (6, '1 Peter 3:15', 2), (6, 'Proverbs 25:11', 3),
  -- v9: Onesimus
  (9, 'Philemon 10-16', 1), (9, 'Colossians 3:11', 2),
  -- v10: Mark restored
  (10, 'Acts 13:13', 1), (10, 'Acts 15:37-39', 2), (10, '2 Timothy 4:11', 3),
  -- v12: Epaphras praying
  (12, 'Colossians 1:7', 1), (12, 'Romans 15:30', 2), (12, 'James 5:16', 3),
  -- v14: Luke and Demas
  (14, '2 Timothy 4:10-11', 1), (14, 'Philemon 24', 2),
  -- v16: Letter exchange
  (16, '1 Thessalonians 5:27', 1), (16, '2 Peter 3:15-16', 2),
  -- v17: Archippus
  (17, 'Philemon 2', 1), (17, '1 Timothy 4:14', 2), (17, '2 Timothy 4:5', 3),
  -- v18: Remember my bonds
  (18, '2 Timothy 1:8', 1), (18, 'Hebrews 13:3', 2), (18, '2 Thessalonians 3:17', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Colossians Chapter 4 Complete
-- 18 verses · 5 key verses with word studies (11 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════