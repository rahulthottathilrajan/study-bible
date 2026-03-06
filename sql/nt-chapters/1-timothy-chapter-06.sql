-- ═══════════════════════════════════════════════════
-- 1 TIMOTHY CHAPTER 6 — Contentment, the Love of Money, and the Good Fight
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  '1 Timothy 6 closes the epistle with urgent warnings and soaring doxology. Paul begins with instructions for servants: ''Let as many servants as are under the yoke count their own masters worthy of all honour, that the name of God and his doctrine be not blasphemed'' (v.1). Those with believing masters must not despise them ''because they are brethren; but rather do them service, because they are faithful and beloved'' (v.2). Paul then turns to false teachers who suppose ''that gain is godliness'' (v.5), answering: ''godliness with contentment is great gain. For we brought nothing into this world, and it is certain we can carry nothing out'' (vv.6-7). The famous warning follows: ''the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows'' (v.10). Timothy is charged to flee these things and ''follow after righteousness, godliness, faith, love, patience, meekness'' (v.11). He must ''fight the good fight of faith, lay hold on eternal life'' (v.12). A magnificent doxology erupts: God is ''the blessed and only Potentate, the King of kings, and Lord of lords; who only hath immortality, dwelling in the light which no man can approach unto'' (vv.15-16). The rich are charged not to trust in uncertain riches ''but in the living God, who giveth us richly all things to enjoy'' (v.17). The epistle closes: ''O Timothy, keep that which is committed to thy trust, avoiding profane and vain babblings'' (v.20).',
  'Godliness with Contentment, Fight the Good Fight',
  'αὐτάρκεια (autarkeia)',
  'Contentment — self-sufficiency, inner sufficiency, satisfaction with what one has. Not Stoic self-reliance but God-reliant sufficiency: the believer who has God lacks nothing essential. Paul uses this term also in Philippians 4:11 for his own learned contentment in all circumstances.',
  '["Servants and Masters (vv.1-2): Let as many servants as are under the yoke count their own masters worthy of all honour that the name of God and his doctrine be not blasphemed; and they that have believing masters let them not despise them because they are brethren but rather do them service because they are faithful and beloved partakers of the benefit","False Teachers and the Love of Money (vv.3-10): If any man teach otherwise and consent not to wholesome words he is proud knowing nothing but doting about questions and strifes of words; from such withdraw thyself; but godliness with contentment is great gain for we brought nothing into this world and it is certain we can carry nothing out; having food and raiment let us be therewith content; but they that will be rich fall into temptation and a snare; for the love of money is the root of all evil which while some coveted after they have erred from the faith and pierced themselves through with many sorrows","The Good Fight of Faith (vv.11-16): But thou O man of God flee these things and follow after righteousness godliness faith love patience meekness; fight the good fight of faith lay hold on eternal life whereunto thou art also called and hast professed a good profession before many witnesses; I give thee charge in the sight of God who quickeneth all things and before Christ Jesus who before Pontius Pilate witnessed a good confession; which in his times he shall shew who is the blessed and only Potentate the King of kings and Lord of lords who only hath immortality dwelling in the light which no man can approach unto whom no man hath seen nor can see to whom be honour and power everlasting amen","Charge to the Rich and Final Warning (vv.17-21): Charge them that are rich in this world that they be not highminded nor trust in uncertain riches but in the living God who giveth us richly all things to enjoy; that they do good that they be rich in good works ready to distribute willing to communicate; laying up in store for themselves a good foundation against the time to come that they may lay hold on eternal life; O Timothy keep that which is committed to thy trust avoiding profane and vain babblings and oppositions of science falsely so called which some professing have erred concerning the faith grace be with thee amen"]'
FROM books b WHERE b.name = '1 Timothy';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Let as many servants as are under the yoke count their own masters worthy of all honour, that the name of God and his doctrine be not blasphemed.',
   'Ὅσοι εἰσὶν ὑπὸ ζυγὸν δοῦλοι τοὺς ἰδίους δεσπότας πάσης τιμῆς ἀξίους ἡγείσθωσαν ἵνα μὴ τὸ ὄνομα τοῦ θεοῦ καὶ ἡ διδασκαλία βλασφημῆται',
   'Hosoi eisin hypo zygon douloi tous idious despotas pasēs timēs axious hēgeisthōsan hina mē to onoma tou theou kai hē didaskalia blasphēmētai',
   '''Under the yoke'' (hypo zygon — under the yoke of slavery; ζυγόν is the ox-yoke, here metaphorical for servitude). ''Count worthy of all honour'' (pasēs timēs axious hēgeisthōsan — let them consider their masters deserving of every honour). The motive is missional: ''that the name of God and his doctrine be not blasphemed'' (hina mē … blasphēmētai — so that God''s name and the teaching may not be reviled). A servant''s poor work reflects badly on the faith he professes.',
   NULL),
  (2, 'And they that have believing masters, let them not despise them, because they are brethren; but rather do them service, because they are faithful and beloved, partakers of the benefit. These things teach and exhort.',
   'οἱ δὲ πιστοὺς ἔχοντες δεσπότας μὴ καταφρονείτωσαν ὅτι ἀδελφοί εἰσιν ἀλλὰ μᾶλλον δουλευέτωσαν ὅτι πιστοί εἰσιν καὶ ἀγαπητοὶ οἱ τῆς εὐεργεσίας ἀντιλαμβανόμενοι ταῦτα δίδασκε καὶ παρακάλει',
   'hoi de pistous echontes despotas mē kataphroneitōsan hoti adelphoi eisin alla mallon douleuetōsan hoti pistoi eisin kai agapētoi hoi tēs euergesias antilambanomenoi tauta didaske kai parakalei',
   '''Despise'' (kataphroneitōsan — look down on; a temptation for slaves whose masters were now spiritual equals). ''Because they are brethren'' — spiritual equality does not abolish social roles. ''But rather do them service'' (mallon douleuetōsan — serve them even more eagerly). ''Partakers of the benefit'' (tēs euergesias antilambanomenoi — those who benefit from the good service rendered; or, those who share in God''s grace). ''Teach and exhort'' — this is apostolic command, not mere suggestion.',
   NULL),
  (3, 'If any man teach otherwise, and consent not to wholesome words, even the words of our Lord Jesus Christ, and to the doctrine which is according to godliness;',
   'εἴ τις ἑτεροδιδασκαλεῖ καὶ μὴ προσέρχεται ὑγιαίνουσιν λόγοις τοῖς τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ καὶ τῇ κατ᾿ εὐσέβειαν διδασκαλίᾳ',
   'ei tis heterodidaskalei kai mē proserchetai hygiainousin logois tois tou kyriou hēmōn Iēsou Christou kai tē kat'' eusebeian didaskalia',
   '''Teach otherwise'' (heterodidaskalei — teach different doctrine; same rare compound as 1:3). ''Consent not'' (mē proserchetai — does not approach, does not adhere to). ''Wholesome words'' (hygiainousin logois — healthy, sound words; the medical metaphor: true doctrine heals, false doctrine sickens). ''Doctrine which is according to godliness'' (kat'' eusebeian didaskalia — the teaching that produces godly living). True doctrine always issues in godliness; doctrine divorced from holy living is false.',
   NULL),
  (4, 'He is proud, knowing nothing, but doting about questions and strifes of words, whereof cometh envy, strife, railings, evil surmisings,',
   'τετύφωται μηδὲν ἐπιστάμενος ἀλλὰ νοσῶν περὶ ζητήσεις καὶ λογομαχίας ἐξ ὧν γίνεται φθόνος ἔρις βλασφημίαι ὑπόνοιαι πονηραί',
   'tetyphōtai mēden epistamenos alla nosōn peri zētēseis kai logomachias ex hōn ginetai phthonos eris blasphēmiai hyponoiai ponērai',
   '''Proud'' (tetyphōtai — puffed up with smoke, beclouded; perfect tense: in a settled state of delusion). ''Knowing nothing'' (mēden epistamenos — understanding nothing despite claiming expertise). ''Doting'' (nosōn — sick, diseased; the false teacher is spiritually ill). ''Strifes of words'' (logomachias — word-battles; empty verbal disputes). The fruit of bad doctrine: envy, strife, railings (blasphēmiai — slanders), evil surmisings (hyponoiai ponērai — wicked suspicions). Corrupt doctrine produces corrupt community.',
   NULL),
  (5, 'Perverse disputings of men of corrupt minds, and destitute of the truth, supposing that gain is godliness: from such withdraw thyself.',
   'παραδιατριβαὶ διεφθαρμένων ἀνθρώπων τὸν νοῦν καὶ ἀπεστερημένων τῆς ἀληθείας νομιζόντων πορισμὸν εἶναι τὴν εὐσέβειαν ἀφίστασο ἀπὸ τῶν τοιούτων',
   'paradiatribai diephtharmenōn anthrōpōn ton noun kai apesterēmenōn tēs alētheias nomizontōn porismon einai tēn eusebeian aphistaso apo tōn toioutōn',
   '''Perverse disputings'' (paradiatribai — constant friction, mutual irritation; rare word found only here). ''Corrupt minds'' (diephtharmenōn ton noun — minds that have been thoroughly corrupted; perfect participle indicating settled corruption). ''Destitute of the truth'' (apesterēmenōn tēs alētheias — robbed of truth; they once had access to truth but have been stripped of it). ''Gain is godliness'' (porismon einai tēn eusebeian — they consider godliness a means of financial profit). ''From such withdraw'' (aphistaso — stand away, separate).',
   'The prosperity gospel — the notion that godliness is a path to financial gain — is as old as the first century. Paul exposes the mercenary motive lurking behind certain forms of religious teaching. Those who peddle the faith for profit have ''corrupt minds'' and are ''destitute of the truth.'' Timothy must withdraw from such teachers entirely. The church must never confuse financial success with divine approval.'),
  (6, 'But godliness with contentment is great gain.',
   'ἔστιν δὲ πορισμὸς μέγας ἡ εὐσέβεια μετὰ αὐταρκείας',
   'estin de porismos megas hē eusebeia meta autarkeias',
   '''Godliness with contentment'' (eusebeia meta autarkeias — godliness accompanied by self-sufficiency/contentment). ''Great gain'' (porismos megas — great profit; Paul reverses the false teachers'' equation: real gain is not godliness leading to wealth, but godliness accompanied by inner sufficiency). Autarkeia is the key word: not Stoic self-reliance but a God-dependent sufficiency that needs nothing the world offers. This is the chapter''s thesis statement and one of the most quoted verses in the Pastoral Epistles.',
   'Contentment (autarkeia) in the Christian sense differs fundamentally from Stoic self-sufficiency. The Stoic sought independence from all external circumstances through willpower; the Christian finds sufficiency because God supplies every need (Phil 4:19). Godliness itself is the great gain — not godliness plus money, but godliness plus the settled satisfaction that comes from knowing God provides. This verse demolishes every prosperity theology that measures spiritual maturity by material wealth.'),
  (7, 'For we brought nothing into this world, and it is certain we can carry nothing out.',
   'οὐδὲν γὰρ εἰσηνέγκαμεν εἰς τὸν κόσμον δῆλον ὅτι οὐδὲ ἐξενεγκεῖν τι δυνάμεθα',
   'ouden gar eisēnenkamen eis ton kosmon dēlon hoti oude exenenkein ti dynametha',
   '''We brought nothing'' (ouden eisēnenkamen — we carried nothing in). ''Carry nothing out'' (oude exenenkein ti dynametha — we are not able to carry anything out either). The logic is irrefutable: naked we arrive, naked we depart. Material accumulation is therefore temporary stewardship, not permanent ownership. Cf. Job 1:21: ''Naked came I out of my mother''s womb, and naked shall I return thither.'' This universal truth grounds the argument for contentment.',
   NULL),
  (8, 'And having food and raiment let us be therewith content.',
   'ἔχοντες δὲ διατροφὰς καὶ σκεπάσματα τούτοις ἀρκεσθησόμεθα',
   'echontes de diatrophas kai skepasmata toutois arkesthēsometha',
   '''Food'' (diatrophas — sustenance, nourishment). ''Raiment'' (skepasmata — coverings; can include clothing and shelter). ''Content'' (arkesthēsometha — we shall be satisfied; future passive: we will find these sufficient). The basic necessities of life — food and covering — are sufficient for contentment. Paul does not condemn possessions but redefines sufficiency: if life''s essentials are met, the godly person has enough. This is the practical application of v.6.',
   NULL),
  (9, 'But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.',
   'οἱ δὲ βουλόμενοι πλουτεῖν ἐμπίπτουσιν εἰς πειρασμὸν καὶ παγίδα καὶ ἐπιθυμίας πολλὰς ἀνοήτους καὶ βλαβεράς αἵτινες βυθίζουσιν τοὺς ἀνθρώπους εἰς ὄλεθρον καὶ ἀπώλειαν',
   'hoi de boulomenoi ploutein empiptousin eis peirasmon kai pagida kai epithymias pollas anoētous kai blaberas haitines bythizousin tous anthrōpous eis olethron kai apōleian',
   '''Will be rich'' (boulomenoi ploutein — those who are determined to become wealthy; boulomenoi indicates deliberate resolve, not merely wishing). ''Fall into'' (empiptousin — fall into as into a pit; present tense: they keep falling). ''Temptation and a snare'' (peirasmon kai pagida — testing and a trap; the desire to be rich is itself a trap). ''Drown'' (bythizousin — plunge to the bottom, submerge; a vivid image of sinking). ''Destruction and perdition'' (olethron kai apōleian — ruin and utter loss; two words for devastation, temporal and eternal). The warning targets not the rich but those who resolve to become rich — the love of wealth as a life-goal.',
   NULL),
  (10, 'For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.',
   'ῥίζα γὰρ πάντων τῶν κακῶν ἐστιν ἡ φιλαργυρία ἧς τινες ὀρεγόμενοι ἀπεπλανήθησαν ἀπὸ τῆς πίστεως καὶ ἑαυτοὺς περιέπειραν ὀδύναις πολλαῖς',
   'rhiza gar pantōn tōn kakōn estin hē philargyria hēs tines oregomenoi apeplanēthēsan apo tēs pisteōs kai heautous periepeiran odynais pollais',
   '''Love of money'' (philargyria — literally ''silver-love''; the compound philos + argyros). ''Root of all evil'' (rhiza pantōn tōn kakōn — a root of all kinds of evils; not the only root, but a root that can produce every variety of evil). ''Coveted after'' (oregomenoi — reaching for, stretching toward). ''Erred from the faith'' (apeplanēthēsan apo tēs pisteōs — were led astray from the faith; passive: the love of money actively leads people astray). ''Pierced themselves through'' (periepeiran — impaled themselves all around; a graphic image of self-inflicted wounds). ''Many sorrows'' (odynais pollais — many pains, many griefs). Money-love is not merely unwise but spiritually fatal.',
   'This is one of the most frequently misquoted verses in Scripture — often cited as ''money is the root of all evil.'' Paul says the love of money (philargyria), not money itself, is a root (rhiza) of all kinds of evil. Wealth is morally neutral; the heart''s attachment to it is the danger. The verse describes real apostasy: some ''have erred from the faith'' — covetousness led them to abandon the gospel. The warning is not merely about financial imprudence but about the soul''s destruction. The self-inflicted piercing (periepeiran) echoes the thorns that choke the word in Christ''s parable of the sower (Matt 13:22).'),
  (11, 'But thou, O man of God, flee these things; and follow after righteousness, godliness, faith, love, patience, meekness.',
   'Σὺ δέ ὦ ἄνθρωπε τοῦ θεοῦ ταῦτα φεῦγε δίωκε δὲ δικαιοσύνην εὐσέβειαν πίστιν ἀγάπην ὑπομονήν πραΰπάθειαν',
   'Sy de ō anthrōpe tou theou tauta pheuge diōke de dikaiosynēn eusebeian pistin agapēn hypomonēn praÿpatheian',
   '''O man of God'' (ō anthrōpe tou theou — a title from the OT prophetic tradition: Moses, Samuel, Elijah, and Elisha were called ''man of God''). ''Flee'' (pheuge — run away from; present imperative: keep fleeing). ''Follow after'' (diōke — pursue, chase; the same verb used for persecution — pursue virtue with the intensity of a hunter). Six virtues: righteousness (dikaiosynēn), godliness (eusebeian), faith (pistin), love (agapēn), patience (hypomonēn — endurance under trial), meekness (praÿpatheian — gentle-spiritedness; a rare word found only here in the NT). The Christian life is both flight and pursuit.',
   NULL),
  (12, 'Fight the good fight of faith, lay hold on eternal life, whereunto thou art also called, and hast professed a good profession before many witnesses.',
   'ἀγωνίζου τὸν καλὸν ἀγῶνα τῆς πίστεως ἐπιλαβοῦ τῆς αἰωνίου ζωῆς εἰς ἣν ἐκλήθης καὶ ὡμολόγησας τὴν καλὴν ὁμολογίαν ἐνώπιον πολλῶν μαρτύρων',
   'agōnizou ton kalon agōna tēs pisteōs epilabou tēs aiōniou zōēs eis hēn eklēthēs kai hōmologēsas tēn kalēn homologian enōpion pollōn martyrōn',
   '''Fight the good fight'' (agōnizou ton kalon agōna — contend the noble contest; from the athletic arena — the struggle is noble, not base). ''Of faith'' (tēs pisteōs — the genitive may be subjective: the fight that faith wages, or objective: the fight for the faith). ''Lay hold'' (epilabou — seize, take firm grip; aorist imperative: do it decisively). ''Eternal life'' (tēs aiōniou zōēs — the life of the age to come; already given but to be fully grasped). ''Called'' (eklēthēs — divinely summoned). ''Good profession'' (kalēn homologian — the noble confession; likely Timothy''s baptismal or ordination confession). The Christian life is an athletic contest requiring exertion, endurance, and a firm grip on the prize.',
   'The military and athletic metaphors for the Christian life (agōnizou, epilabou) teach that salvation, while a gift of grace, requires active engagement. ''Lay hold on eternal life'' does not contradict salvation by grace — Timothy already has eternal life (he was ''called'' to it). Rather, Paul urges him to live in full possession of what grace has given. The ''good profession before many witnesses'' may refer to Timothy''s baptismal confession or his ordination; either way, public confession creates accountability.'),
  (13, 'I give thee charge in the sight of God, who quickeneth all things, and before Christ Jesus, who before Pontius Pilate witnessed a good confession;',
   'παραγγέλλω σοι ἐνώπιον τοῦ θεοῦ τοῦ ζωοποιοῦντος τὰ πάντα καὶ Χριστοῦ Ἰησοῦ τοῦ μαρτυρήσαντος ἐπὶ Ποντίου Πιλάτου τὴν καλὴν ὁμολογίαν',
   'parangellō soi enōpion tou theou tou zōopoiountos ta panta kai Christou Iēsou tou martyrēsantos epi Pontiou Pilatou tēn kalēn homologian',
   '''I give thee charge'' (parangellō — I command; military language: a general issuing orders). ''In the sight of God'' (enōpion tou theou — before the face of God; Paul summons God as witness to the charge). ''Quickeneth all things'' (zōopoiountos ta panta — the one who gives life to all things; God as the source of all life). ''Before Pontius Pilate'' (epi Pontiou Pilatou — under Pontius Pilate, or before Pontius Pilate). ''Witnessed a good confession'' (martyrēsantos tēn kalēn homologian — testified the noble testimony). Christ''s confession before Pilate is the model for Timothy''s — faithful witness under pressure, even unto death.',
   NULL),
  (14, 'That thou keep this commandment without spot, unrebukeable, until the appearing of our Lord Jesus Christ:',
   'τηρῆσαί σε τὴν ἐντολὴν ἄσπιλον ἀνεπίληπτον μέχρι τῆς ἐπιφανείας τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'tērēsai se tēn entolēn aspilon anepilēpton mechri tēs epiphaneias tou kyriou hēmōn Iēsou Christou',
   '''Keep'' (tērēsai — guard, preserve; aorist infinitive: carry this through to completion). ''This commandment'' (tēn entolēn — the charge; referring either to the specific charge just given or to the entire body of apostolic teaching entrusted to Timothy). ''Without spot'' (aspilon — spotless, unblemished). ''Unrebukeable'' (anepilēpton — above reproach, not open to censure). ''Until the appearing'' (mechri tēs epiphaneias — until the manifestation; epiphaneia originally denoted a royal visit or the appearing of a god). The horizon of Timothy''s obedience stretches to the return of Christ — no retirement from faithfulness.',
   NULL),
  (15, 'Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;',
   'ἣν καιροῖς ἰδίοις δείξει ὁ μακάριος καὶ μόνος δυνάστης ὁ βασιλεὺς τῶν βασιλευόντων καὶ κύριος τῶν κυριευόντων',
   'hēn kairois idiois deixei ho makarios kai monos dynastēs ho basileus tōn basileuontōn kai kyrios tōn kyrieuontōn',
   '''In his times'' (kairois idiois — in his own appointed times; God controls the schedule of Christ''s return). ''He shall shew'' (deixei — will display, will reveal; God will unveil Christ''s return at the proper moment). ''Blessed and only Potentate'' (makarios kai monos dynastēs — the supremely happy and sole Sovereign). ''King of kings'' (basileus tōn basileuontōn — the King of those who reign). ''Lord of lords'' (kyrios tōn kyrieuontōn — the Lord of those who exercise lordship). This magnificent doxology ascribes absolute sovereignty to God alone — no earthly ruler shares his rank.',
   'This doxology (vv.15-16) is one of the most exalted descriptions of God in the NT. ''Blessed'' (makarios) attributes perfect, self-contained happiness to God — he is not blessed by others but is intrinsically and eternally blessed. ''Only Potentate'' (monos dynastēs) denies ultimate sovereignty to every creature: Caesar, every king, every power structure answers to the one Sovereign. ''King of kings and Lord of lords'' — the same title applied to Christ in Revelation 19:16, affirming the deity of Christ within the Godhead.'),
  (16, 'Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.',
   'ὁ μόνος ἔχων ἀθανασίαν φῶς οἰκῶν ἀπρόσιτον ὃν εἶδεν οὐδεὶς ἀνθρώπων οὐδὲ ἰδεῖν δύναται ᾧ τιμὴ καὶ κράτος αἰώνιον ἀμήν',
   'ho monos echōn athanasian phōs oikōn aprositon hon eiden oudeis anthrōpōn oude idein dynatai hō timē kai kratos aiōnion amēn',
   '''Only hath immortality'' (monos echōn athanasian — alone possessing deathlessness; immortality belongs inherently to God alone; all other immortality is derived and granted). ''Dwelling in the light which no man can approach unto'' (phōs oikōn aprositon — inhabiting unapproachable light; God''s essential glory is so intense that no creature can endure it). ''Whom no man hath seen, nor can see'' (hon eiden oudeis anthrōpōn oude idein dynatai — no human has ever seen him, nor is any human able to see him; God in his essence is invisible to mortal eyes). ''Honour and power everlasting'' (timē kai kratos aiōnion — eternal honour and dominion). ''Amen'' — so be it; the seal of worship.',
   'God ''only hath immortality'' — this does not deny that believers will live forever (they will), but affirms that God alone possesses immortality inherently and underivedly. All created beings receive life from him; he receives it from no one. ''Dwelling in the light which no man can approach unto'' echoes Exodus 33:20 (''no man shall see me, and live'') and Psalm 104:2 (''who coverest thyself with light as with a garment''). The invisibility of God does not contradict theophanies or the Incarnation — those are accommodated revelations; God''s essential nature remains beyond creaturely perception.'),
  (17, 'Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living God, who giveth us richly all things to enjoy;',
   'τοῖς πλουσίοις ἐν τῷ νῦν αἰῶνι παράγγελλε μὴ ὑψηλοφρονεῖν μηδὲ ἠλπικέναι ἐπὶ πλούτου ἀδηλότητι ἀλλ᾿ ἐν τῷ θεῷ τῷ ζῶντι τῷ παρέχοντι ἡμῖν πάντα πλουσίως εἰς ἀπόλαυσιν',
   'tois plousiois en tō nyn aiōni parangelle mē hypsēlophronein mēde ēlpikenai epi ploutou adēlotēti all'' en tō theō tō zōnti tō parechonti hēmin panta plousiōs eis apolausin',
   '''Rich in this world'' (plousiois en tō nyn aiōni — wealthy in the present age; ''this world'' distinguishes temporal from eternal riches). ''Highminded'' (hypsēlophronein — think loftily of themselves; wealth produces arrogance). ''Uncertain riches'' (ploutou adēlotēti — the uncertainty of wealth; wealth is inherently unstable). ''Living God'' (theō tō zōnti — the God who lives; contrasted with dead wealth). ''Giveth us richly all things to enjoy'' (parechonti hēmin panta plousiōs eis apolausin — provides everything richly for enjoyment). Note the wordplay: God gives ''richly'' (plousiōs) — true richness comes from the Giver, not the gift. Wealth is not condemned; trust in wealth is.',
   NULL),
  (18, 'That they do good, that they be rich in good works, ready to distribute, willing to communicate;',
   'ἀγαθοεργεῖν πλουτεῖν ἐν ἔργοις καλοῖς εὐμεταδότους εἶναι κοινωνικούς',
   'agathoergein ploutein en ergois kalois eumetadotous einai koinōnikous',
   '''Do good'' (agathoergein — work good deeds). ''Rich in good works'' (ploutein en ergois kalois — be wealthy in beautiful deeds; a deliberate contrast with being rich in money). ''Ready to distribute'' (eumetadotous — generous in giving; literally, good at sharing out). ''Willing to communicate'' (koinōnikous — ready to share in common, generous in fellowship; from koinōnia). Four commands for the wealthy: do good, accumulate noble deeds, give generously, and share willingly. The rich are not told to divest but to invest — in eternal currency.',
   NULL),
  (19, 'Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life.',
   'ἀποθησαυρίζοντας ἑαυτοῖς θεμέλιον καλὸν εἰς τὸ μέλλον ἵνα ἐπιλάβωνται τῆς αἰωνίου ζωῆς',
   'apothēsaurizontas heautois themelion kalon eis to mellon hina epilabōntai tēs aiōniou zōēs',
   '''Laying up in store'' (apothēsaurizontas — treasuring up; a compound verb: apo + thēsaurizō — storing away treasure). ''Good foundation'' (themelion kalon — a noble foundation; mixed metaphor: treasure that becomes a foundation for the future). ''Against the time to come'' (eis to mellon — for the coming age). ''Lay hold on eternal life'' (epilabōntai tēs aiōniou zōēs — grasp the life that is truly life; cf. v.12). Generosity in this life builds capital in the next. Jesus taught the same: ''make to yourselves friends of the mammon of unrighteousness'' (Luke 16:9). Present generosity secures future blessing.',
   NULL),
  (20, 'O Timothy, keep that which is committed to thy trust, avoiding profane and vain babblings, and oppositions of science falsely so called:',
   'Ὦ Τιμόθεε τὴν παραθήκην φύλαξον ἐκτρεπόμενος τὰς βεβήλους κενοφωνίας καὶ ἀντιθέσεις τῆς ψευδωνύμου γνώσεως',
   'Ō Timothee tēn parathēkēn phylaxon ektrepomenos tas bebēlous kenophōnias kai antitheseis tēs pseudōnymou gnōseōs',
   '''O Timothy'' (Ō Timothee — the personal, emotional address; Paul''s heart is in this closing charge). ''That which is committed to thy trust'' (tēn parathēkēn — the deposit; a banking term: something entrusted for safekeeping). ''Keep'' (phylaxon — guard; aorist imperative: guard it to the end). ''Profane and vain babblings'' (bebēlous kenophōnias — unholy empty utterances). ''Oppositions of science falsely so called'' (antitheseis tēs pseudōnymou gnōseōs — contradictions of the falsely named ''knowledge''; gnōseōs may anticipate the later Gnostic movement, or simply refer to the pretentious claims of the false teachers). The deposit of apostolic truth must be guarded against counterfeit knowledge.',
   'The ''deposit'' (parathēkē) is the body of apostolic teaching entrusted to Timothy — the gospel and its doctrinal framework. This concept of a ''deposit of faith'' is foundational: the faith is received, not invented. Timothy is a guardian (phylaxon), not an innovator. ''Science falsely so called'' (pseudōnymou gnōseōs) may refer to proto-Gnostic speculations already circulating, or more broadly to any intellectual system that contradicts revealed truth while claiming superior knowledge. The antitheseis (''oppositions'' or ''contradictions'') may allude to a specific work or teaching method of the false teachers.'),
  (21, 'Which some professing have erred concerning the faith. Grace be with thee. Amen.',
   'ἥν τινες ἐπαγγελλόμενοι περὶ τὴν πίστιν ἠστόχησαν ἡ χάρις μετὰ σοῦ ἀμήν',
   'hēn tines epangellomenoi peri tēn pistin ēstochēsan hē charis meta sou amēn',
   '''Professing'' (epangellomenoi — claiming, professing, advertising). ''Erred'' (ēstochēsan — missed the mark; from astocheō, to aim at and miss; used of archers who miss the target; same word as 1:6). ''Concerning the faith'' (peri tēn pistin — with respect to the faith). Those who profess false knowledge miss the target of genuine faith. ''Grace be with thee'' (hē charis meta sou — grace with you; the singular ''thee'' makes this personal: Paul closes with grace for Timothy individually). ''Amen'' — the final seal. The letter ends as it began: grace — the undeserved favour of God — is the first and last word.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Timothy' AND c.chapter_number = 6;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.6 contentment
  ('αὐτάρκεια', 'autarkeia', 'G841', 'Contentment, self-sufficiency — not the Stoic ideal of needing nothing, but the Christian reality of having all one needs in God. From autos (self) + arkeō (to suffice). The believer''s sufficiency comes not from within but from God who supplies every need.', 1),
  ('εὐσέβεια', 'eusebeia', 'G2150', 'Godliness, piety, reverent living — from eu (well) + sebomai (to worship). The pattern of life that flows from genuine worship. In the Pastoral Epistles, eusebeia is the hallmark of authentic Christianity as opposed to the empty profession of false teachers.', 2),
  -- v.10 love of money
  ('φιλαργυρία', 'philargyria', 'G5365', 'Love of money, avarice — from philos (loving) + argyros (silver). A compound noun appearing only here in the NT. Not money itself but the love of it is identified as a root of all kinds of evil. The distinction is critical and often missed in popular quotation.', 3),
  ('ῥίζα', 'rhiza', 'G4491', 'Root — the underground source from which something grows. Money-love is a root that can produce every variety of evil: betrayal, murder, theft, lying, apostasy. Not the only root of evil, but a prolific one that branches into every category of sin.', 4),
  -- v.12 fight / lay hold
  ('ἀγωνίζου', 'agōnizou', 'G75', 'Fight, contend, struggle — from agōn (contest, arena). Present imperative: keep on contending. The Christian life is an ongoing athletic or military contest requiring exertion, training, and endurance. Used also in 2 Timothy 4:7 for Paul''s own lifelong contest.', 5),
  ('ἐπιλαβοῦ', 'epilabou', 'G1949', 'Lay hold of, seize, grasp — from epi (upon) + lambanō (to take). Aorist imperative: decisively take hold. Eternal life is not merely waited for but actively grasped. The imagery is of a wrestler seizing hold of an opponent or a runner grasping the prize.', 6),
  -- v.15 Potentate
  ('δυνάστης', 'dynastēs', 'G1413', 'Potentate, sovereign ruler, one who holds power — from dynamai (to be able). Used of God as the sole supreme Sovereign. In secular Greek, dynastēs denoted a prince or court official; applied to God, it asserts absolute, unshared, and unchallengeable authority.', 7),
  -- v.16 immortality
  ('ἀθανασία', 'athanasia', 'G110', 'Immortality, deathlessness — from a (not) + thanatos (death). God alone possesses immortality inherently and underivedly. All creaturely immortality is a gift from God. Used also in 1 Corinthians 15:53-54 for the resurrection body that ''puts on'' immortality.', 8),
  ('ἀπρόσιτον', 'aprositon', 'G676', 'Unapproachable — from a (not) + proseimi (to approach). Found only here in the NT. God dwells in light so intense that no creature can approach it. This preserves divine transcendence while the Incarnation and the Spirit provide access to God''s relational presence.', 9),
  -- v.20 the deposit
  ('παραθήκη', 'parathēkē', 'G3866', 'Deposit, that which is entrusted — a banking and legal term for something given to another for safekeeping. The apostolic deposit is the body of revealed truth entrusted to Timothy and, through him, to the church. It is to be guarded (phylaxon), not altered or supplemented.', 10)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 6
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 6 WHEN 2 THEN 6
    WHEN 3 THEN 10 WHEN 4 THEN 10
    WHEN 5 THEN 12 WHEN 6 THEN 12
    WHEN 7 THEN 15
    WHEN 8 THEN 16 WHEN 9 THEN 16
    WHEN 10 THEN 20
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 servants and honour
  (1, 'Ephesians 6:5', 1),
  (1, 'Titus 2:9-10', 2),
  (1, 'Colossians 3:22', 3),
  -- v.5 gain is godliness
  (5, 'Titus 1:11', 4),
  (5, '2 Peter 2:3', 5),
  -- v.6 godliness with contentment
  (6, 'Philippians 4:11-12', 6),
  (6, 'Hebrews 13:5', 7),
  (6, 'Proverbs 30:8-9', 8),
  -- v.7 brought nothing / carry nothing
  (7, 'Job 1:21', 9),
  (7, 'Ecclesiastes 5:15', 10),
  (7, 'Psalm 49:17', 11),
  -- v.9 will be rich
  (9, 'Proverbs 28:20', 12),
  (9, 'James 5:1-3', 13),
  -- v.10 love of money
  (10, 'Matthew 13:22', 14),
  (10, 'Luke 16:13', 15),
  (10, 'Hebrews 13:5', 16),
  -- v.11 man of God
  (11, '2 Timothy 2:22', 17),
  (11, 'Galatians 5:22-23', 18),
  -- v.12 fight the good fight
  (12, '2 Timothy 4:7', 19),
  (12, '1 Corinthians 9:25-26', 20),
  (12, 'Hebrews 12:1', 21),
  -- v.13 before Pontius Pilate
  (13, 'John 18:36-37', 22),
  (13, 'Revelation 1:5', 23),
  -- v.15 King of kings
  (15, 'Revelation 19:16', 24),
  (15, 'Revelation 17:14', 25),
  (15, 'Daniel 2:47', 26),
  -- v.16 immortality and unapproachable light
  (16, 'Exodus 33:20', 27),
  (16, 'Psalm 104:2', 28),
  (16, '1 Corinthians 15:53-54', 29),
  (16, 'John 1:18', 30),
  -- v.17 charge the rich
  (17, 'Luke 12:15-21', 31),
  (17, 'Matthew 6:19-21', 32),
  -- v.19 laying up treasure
  (19, 'Luke 16:9', 33),
  (19, 'Matthew 6:20', 34),
  -- v.20 the deposit
  (20, '2 Timothy 1:14', 35),
  (20, 'Jude 1:3', 36),
  (20, 'Colossians 2:8', 37),
  -- v.21 erred from the faith
  (21, '1 Timothy 1:6', 38),
  (21, '2 Timothy 2:18', 39)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 6
  AND v.verse_number = cr.verse_number;
