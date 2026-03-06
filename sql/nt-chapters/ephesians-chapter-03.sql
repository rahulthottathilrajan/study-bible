-- ═══════════════════════════════════════════════════
-- EPHESIANS CHAPTER 3 — The Mystery Revealed and Paul's Prayer
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Ephesians 3 reveals the ''mystery'' that Paul has been entrusted to proclaim and concludes with one of the most exalted prayers in Scripture. Paul identifies himself as ''the prisoner of Jesus Christ for you Gentiles'' (v.1), then digresses to explain his stewardship: ''the dispensation of the grace of God which is given me to you-ward'' (v.2). The mystery, ''which in other ages was not made known unto the sons of men,'' is now revealed: ''that the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Christ by the gospel'' (vv.5-6). Paul marvels at his own calling: ''unto me, who am less than the least of all saints, is this grace given, that I should preach among the Gentiles the unsearchable riches of Christ'' (v.8). The purpose extends to cosmic dimensions: ''to the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of God'' (v.10). Paul then prays for the Ephesians: that they be ''strengthened with might by his Spirit in the inner man'' (v.16), ''that Christ may dwell in your hearts by faith'' (v.17), and that they ''may be able to comprehend ... the breadth, and length, and depth, and height; and to know the love of Christ, which passeth knowledge'' (vv.18-19). The chapter climaxes with a magnificent doxology: ''Now unto him that is able to do exceeding abundantly above all that we ask or think, according to the power that worketh in us, unto him be glory in the church by Christ Jesus throughout all ages, world without end. Amen'' (vv.20-21).',
  'The Mystery Revealed — Unsearchable Riches of Christ',
  'μυστήριον (mystērion)',
  'Mystery — a divine secret, previously hidden but now revealed through the apostles and prophets. In Ephesians, the mystery is specifically the inclusion of Gentiles as full and equal members of God''s people, united with Jews in one body through the gospel. This was always God''s plan but was not disclosed until the apostolic age.',
  '["Paul''s Stewardship of the Mystery (vv.1-6): For this cause I Paul the prisoner of Jesus Christ for you Gentiles; if ye have heard of the dispensation of the grace of God which is given me to you-ward; how that by revelation he made known unto me the mystery; which in other ages was not made known unto the sons of men as it is now revealed unto his holy apostles and prophets by the Spirit; that the Gentiles should be fellowheirs and of the same body and partakers of his promise in Christ by the gospel","Paul''s Grace to Preach Christ''s Unsearchable Riches (vv.7-13): Whereof I was made a minister according to the gift of the grace of God given unto me by the effectual working of his power; unto me who am less than the least of all saints is this grace given that I should preach among the Gentiles the unsearchable riches of Christ; and to make all men see what is the fellowship of the mystery; to the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of God","Paul''s Prayer for Inner Strengthening (vv.14-19): For this cause I bow my knees unto the Father of our Lord Jesus Christ; that he would grant you according to the riches of his glory to be strengthened with might by his Spirit in the inner man; that Christ may dwell in your hearts by faith; that ye being rooted and grounded in love may be able to comprehend with all saints what is the breadth and length and depth and height and to know the love of Christ which passeth knowledge that ye might be filled with all the fulness of God","Doxology — Exceeding Abundantly Above All (vv.20-21): Now unto him that is able to do exceeding abundantly above all that we ask or think according to the power that worketh in us unto him be glory in the church by Christ Jesus throughout all ages world without end amen"]'
FROM books b WHERE b.name = 'Ephesians';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'For this cause I Paul, the prisoner of Jesus Christ for you Gentiles,',
   'Τούτου χάριν ἐγὼ Παῦλος ὁ δέσμιος τοῦ Χριστοῦ Ἰησοῦ ὑπὲρ ὑμῶν τῶν ἐθνῶν',
   'Toutou charin egō Paulos ho desmios tou Christou Iēsou hyper hymōn tōn ethnōn',
   '''For this cause'' (toutou charin — because of what has just been said in ch.2 about Jew-Gentile unity). ''Prisoner of Jesus Christ'' (desmios tou Christou — not prisoner of Rome but of Christ; Paul reinterprets his chains as service to his Lord). ''For you Gentiles'' (hyper hymōn tōn ethnōn — Paul''s imprisonment is directly connected to his ministry of including Gentiles). Paul begins a prayer (v.1) but digresses (vv.2-13) before resuming the prayer in v.14.',
   NULL),
  (2, 'If ye have heard of the dispensation of the grace of God which is given me to you-ward:',
   'εἴγε ἠκούσατε τὴν οἰκονομίαν τῆς χάριτος τοῦ θεοῦ τῆς δοθείσης μοι εἰς ὑμᾶς',
   'eige ēkousate tēn oikonomian tēs charitos tou theou tēs dotheisēs moi eis hymas',
   '''Dispensation'' (oikonomian — stewardship, management, administration; from oikos, house + nomos, law; the management of a household). Paul has been entrusted with a stewardship — the management of God''s grace directed toward the Gentiles. The grace is not merely for Paul''s benefit but given ''to you-ward'' (eis hymas — toward you, for your sake). Paul is a steward, not an owner.',
   NULL),
  (3, 'How that by revelation he made known unto me the mystery; (as I wrote afore in few words,',
   'ὅτι κατὰ ἀποκάλυψιν ἐγνώρισέν μοι τὸ μυστήριον καθὼς προέγραψα ἐν ὀλίγῳ',
   'hoti kata apokalypsin egnōrisen moi to mystērion kathōs proegrapsa en oligō',
   '''By revelation'' (kata apokalypsin — according to an unveiling; Paul did not discover the mystery through study but received it through divine disclosure). ''Made known'' (egnōrisen — revealed, made evident). ''The mystery'' (to mystērion — the previously hidden plan of God, now disclosed). ''As I wrote afore'' (kathōs proegrapsa — as I previously wrote; referring to the earlier sections of this letter, especially 1:9-10 and 2:11-22).',
   NULL),
  (4, 'Whereby, when ye read, ye may understand my knowledge in the mystery of Christ)',
   'πρὸς ὃ δύνασθε ἀναγινώσκοντες νοῆσαι τὴν σύνεσίν μου ἐν τῷ μυστηρίῳ τοῦ Χριστοῦ',
   'pros ho dynasthe anaginōskontes noēsai tēn synesin mou en tō mystēriō tou Christou',
   '''Understand'' (noēsai — perceive, grasp intellectually). ''My knowledge'' (tēn synesin mou — my insight, my comprehension; synesis implies putting things together, connecting the dots). ''In the mystery of Christ'' (en tō mystēriō tou Christou — the mystery that belongs to Christ, that centres on Christ). Paul''s insight into the mystery can be verified by reading what he has written — the mystery is not esoteric or hidden but plainly revealed in his letters.',
   NULL),
  (5, 'Which in other ages was not made known unto the sons of men, as it is now revealed unto his holy apostles and prophets by the Spirit;',
   'ὃ ἐν ἑτέραις γενεαῖς οὐκ ἐγνωρίσθη τοῖς υἱοῖς τῶν ἀνθρώπων ὡς νῦν ἀπεκαλύφθη τοῖς ἁγίοις ἀποστόλοις αὐτοῦ καὶ προφήταις ἐν πνεύματι',
   'ho en heterais geneais ouk egnōristhē tois huiois tōn anthrōpōn hōs nyn apekalyphthē tois hagiois apostolois autou kai prophētais en pneumati',
   '''In other ages'' (en heterais geneais — in other generations; not completely unknown in the OT but not revealed with this clarity). ''As it is now revealed'' (hōs nyn apekalyphthē — the degree of revelation is new; hints existed in the OT, but the full picture is now unveiled). ''Apostles and prophets'' — NT apostles and prophets, the foundation of the church (2:20). ''By the Spirit'' (en pneumati — the Spirit is the agent of revelation).',
   NULL),
  (6, 'That the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Christ by the gospel:',
   'εἶναι τὰ ἔθνη συγκληρονόμα καὶ σύσσωμα καὶ συμμέτοχα τῆς ἐπαγγελίας αὐτοῦ ἐν τῷ Χριστῷ διὰ τοῦ εὐαγγελίου',
   'einai ta ethnē synklēronoma kai syssōma kai symmetocha tēs epangelias autou en tō Christō dia tou euangeliou',
   'The mystery defined in three ''syn-'' (together with) terms: (1) ''fellowheirs'' (synklēronoma — co-heirs, sharing the same inheritance); (2) ''of the same body'' (syssōma — co-body, incorporated into the same body; used only here in the NT); (3) ''partakers'' (symmetocha — co-sharers, jointly participating). Gentiles are not second-class citizens or mere additions — they share equally in every privilege. All three are ''in Christ'' (en tō Christō) and come ''by the gospel'' (dia tou euangeliou).',
   'The mystery: Gentile full inclusion: The mystery is not that Gentiles would be saved — the OT anticipated that (Gen 12:3; Isa 49:6). The mystery is the manner and degree: Gentiles as equal co-heirs, incorporated into the same body, sharing the same promises — without first becoming Jews. This was revolutionary. The three syn- compounds emphasise total equality: same inheritance, same body, same promises.'),
  (7, 'Whereof I was made a minister, according to the gift of the grace of God given unto me by the effectual working of his power.',
   'οὗ ἐγενόμην διάκονος κατὰ τὴν δωρεὰν τῆς χάριτος τοῦ θεοῦ τῆς δοθείσης μοι κατὰ τὴν ἐνέργειαν τῆς δυνάμεως αὐτοῦ',
   'hou egenomēn diakonos kata tēn dōrean tēs charitos tou theou tēs dotheisēs moi kata tēn energeian tēs dynameōs autou',
   '''Minister'' (diakonos — servant, one who serves at table; not a title of honour but of service). ''Gift of the grace'' (dōrean tēs charitos — the free gift of grace; Paul''s ministry is itself a gift). ''Effectual working of his power'' (energeian tēs dynameōs — the operative energy of God''s power). Paul''s ministry is empowered not by his own ability but by God''s energising power. The same power that raised Christ (1:19-20) empowers Paul''s ministry.',
   NULL),
  (8, 'Unto me, who am less than the least of all saints, is this grace given, that I should preach among the Gentiles the unsearchable riches of Christ;',
   'ἐμοὶ τῷ ἐλαχιστοτέρῳ πάντων τῶν ἁγίων ἐδόθη ἡ χάρις αὕτη ἐν τοῖς ἔθνεσιν εὐαγγελίσασθαι τὸν ἀνεξιχνίαστον πλοῦτον τοῦ Χριστοῦ',
   'emoi tō elachistoterō pantōn tōn hagiōn edothē hē charis hautē en tois ethnesin euangelisasthai ton anexichniaston plouton tou Christou',
   '''Less than the least'' (elachistoterō — a grammatical impossibility: a comparative form of a superlative; Paul coins a word to express how unworthy he feels. ''Leaster than the least'' or ''less than the littlest''). ''Unsearchable riches'' (anexichniaston plouton — untraceable wealth, riches that cannot be tracked to their source; the footprints of this treasure cannot be followed). Paul''s humility and his message are both enormous: the smallest apostle preaching the largest treasure.',
   NULL),
  (9, 'And to make all men see what is the fellowship of the mystery, which from the beginning of the world hath been hid in God, who created all things by Jesus Christ:',
   'καὶ φωτίσαι πάντας τίς ἡ οἰκονομία τοῦ μυστηρίου τοῦ ἀποκεκρυμμένου ἀπὸ τῶν αἰώνων ἐν τῷ θεῷ τῷ τὰ πάντα κτίσαντι διὰ Ἰησοῦ Χριστοῦ',
   'kai phōtisai pantas tis hē oikonomia tou mystēriou tou apokekrymmenou apo tōn aiōnōn en tō theō tō ta panta ktisanti dia Iēsou Christou',
   '''Make all men see'' (phōtisai pantas — to illuminate everyone, to bring to light). ''Fellowship'' (oikonomia — some manuscripts read koinōnia, fellowship; others oikonomia, administration/plan). ''Hid in God'' (apokekrymmenou en tō theō — the mystery was concealed within God himself; perfect participle: had been hidden and remained hidden until now). ''Who created all things by Jesus Christ'' — the Creator is also the Redeemer; the God who hid the mystery is the God who made everything.',
   NULL),
  (10, 'To the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of God,',
   'ἵνα γνωρισθῇ νῦν ταῖς ἀρχαῖς καὶ ταῖς ἐξουσίαις ἐν τοῖς ἐπουρανίοις διὰ τῆς ἐκκλησίας ἡ πολυποίκιλος σοφία τοῦ θεοῦ',
   'hina gnōristhē nyn tais archais kai tais exousiais en tois epouraniois dia tēs ekklēsias hē polypoikilos sophia tou theou',
   '''Principalities and powers'' (archais kai exousiais — angelic and demonic rulers in the spiritual realm). ''By the church'' (dia tēs ekklēsias — through the church as the instrument/display). ''Manifold wisdom'' (polypoikilos sophia — many-coloured, multifaceted, richly variegated wisdom; used only here in the NT; poly- many + poikilos, varied/diverse). The church is God''s object lesson to the spiritual realm — the very existence of a united, multi-ethnic community of redeemed sinners displays God''s intricate wisdom to angelic beings.',
   'The church as cosmic display: The church has a cosmic audience. Angelic and demonic powers observe the church and through it learn the ''manifold wisdom of God.'' The existence of the church — Jew and Gentile reconciled in one body — demonstrates something about God''s wisdom that even angels could not otherwise know. The church is not an afterthought but the centrepiece of God''s eternal purpose, displayed before the entire spiritual universe.'),
  (11, 'According to the eternal purpose which he purposed in Christ Jesus our Lord:',
   'κατὰ πρόθεσιν τῶν αἰώνων ἣν ἐποίησεν ἐν Χριστῷ Ἰησοῦ τῷ κυρίῳ ἡμῶν',
   'kata prothesin tōn aiōnōn hēn epoiēsen en Christō Iēsou tō kyriō hēmōn',
   '''Eternal purpose'' (prothesin tōn aiōnōn — literally ''the purpose of the ages''; God''s plan spans all of history). ''Which he purposed in Christ Jesus'' (hēn epoiēsen en Christō — which he accomplished/carried out in Christ). The mystery is not a recent improvisation but the outworking of God''s plan from eternity, executed in and through Christ.',
   NULL),
  (12, 'In whom we have boldness and access with confidence by the faith of him.',
   'ἐν ᾧ ἔχομεν τὴν παρρησίαν καὶ τὴν προσαγωγὴν ἐν πεποιθήσει διὰ τῆς πίστεως αὐτοῦ',
   'en hō echomen tēn parrēsian kai tēn prosagōgēn en pepoithēsei dia tēs pisteōs autou',
   '''Boldness'' (parrēsian — freedom of speech, outspokenness, confidence to speak openly; in Athenian democracy, the right of every citizen to speak freely). ''Access'' (prosagōgēn — the right of approach into the king''s presence, as in 2:18). ''With confidence'' (en pepoithēsei — with assurance, with settled trust). ''By the faith of him'' (dia tēs pisteōs autou — through faith in him, or through his faithfulness). In Christ, believers have bold, confident access to the throne of God — no more fear, no more barriers.',
   NULL),
  (13, 'Wherefore I desire that ye faint not at my tribulations for you, which is your glory.',
   'διὸ αἰτοῦμαι μὴ ἐκκακεῖν ἐν ταῖς θλίψεσίν μου ὑπὲρ ὑμῶν ἥτις ἐστὶν δόξα ὑμῶν',
   'dio aitoumai mē enkakein en tais thlipsesin mou hyper hymōn hētis estin doxa hymōn',
   '''Faint not'' (mē enkakein — do not lose heart, do not become discouraged). ''My tribulations for you'' (tais thlipsesin mou hyper hymōn — Paul''s sufferings are for the Ephesians'' benefit). ''Which is your glory'' (hētis estin doxa hymōn — Paul''s suffering on their behalf is actually their honour). Paul reassures his readers: his imprisonment should not discourage them but encourage them — it demonstrates the value God places on the Gentile mission.',
   NULL),
  (14, 'For this cause I bow my knees unto the Father of our Lord Jesus Christ,',
   'Τούτου χάριν κάμπτω τὰ γόνατά μου πρὸς τὸν πατέρα τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'Toutou charin kamptō ta gonata mou pros ton patera tou kyriou hēmōn Iēsou Christou',
   '''For this cause'' (toutou charin — resuming from v.1, after the digression of vv.2-13). ''I bow my knees'' (kamptō ta gonata — a posture of intense, earnest prayer; Jews typically stood to pray, so kneeling indicates exceptional urgency and reverence). ''Unto the Father'' (pros ton patera — directed toward the Father). This is one of the two great prayers in Ephesians (cf. 1:15-23). The first prayer was for knowledge; this prayer is for experience — inner strengthening, Christ''s indwelling, and comprehension of his love.',
   NULL),
  (15, 'Of whom the whole family in heaven and earth is named,',
   'ἐξ οὗ πᾶσα πατριὰ ἐν οὐρανοῖς καὶ ἐπὶ γῆς ὀνομάζεται',
   'ex hou pasa patria en ouranois kai epi gēs onomazetai',
   '''Family'' (patria — family, lineage, clan; derived from patēr, father). ''Is named'' (onomazetai — derives its name, gets its identity). A wordplay: from the Father (patēr) every family (patria) takes its name. God is the archetype of all fatherhood and family — all family relationships on earth are derived from and patterned after the Father''s relationship to his children. Every family, heavenly and earthly, owes its existence and identity to him.',
   NULL),
  (16, 'That he would grant you, according to the riches of his glory, to be strengthened with might by his Spirit in the inner man;',
   'ἵνα δῴη ὑμῖν κατὰ τὸν πλοῦτον τῆς δόξης αὐτοῦ δυνάμει κραταιωθῆναι διὰ τοῦ πνεύματος αὐτοῦ εἰς τὸν ἔσω ἄνθρωπον',
   'hina dōē hymin kata ton plouton tēs doxēs autou dynamei krataiōthēnai dia tou pneumatos autou eis ton esō anthrōpon',
   '''According to the riches of his glory'' (kata ton plouton tēs doxēs — the measure of the gift is God''s infinite wealth). ''Strengthened with might'' (dynamei krataiōthēnai — empowered with strength; two power words combined). ''By his Spirit'' (dia tou pneumatos — the Spirit is the agent of inner strengthening). ''In the inner man'' (eis ton esō anthrōpon — the inward person, the true self, the spiritual core). The first petition: supernatural strength in the hidden centre of our being.',
   NULL),
  (17, 'That Christ may dwell in your hearts by faith; that ye, being rooted and grounded in love,',
   'κατοικῆσαι τὸν Χριστὸν διὰ τῆς πίστεως ἐν ταῖς καρδίαις ὑμῶν ἐν ἀγάπῃ ἐρριζωμένοι καὶ τεθεμελιωμένοι',
   'katoikēsai ton Christon dia tēs pisteōs en tais kardiais hymōn en agapē errizōmenoi kai tethemeliōmenoi',
   '''Dwell'' (katoikēsai — settle down permanently, make one''s home; kata- intensifies: not a temporary visit but a permanent residence). ''By faith'' (dia tēs pisteōs — faith is the means by which Christ takes up residence). ''Rooted'' (errizōmenoi — firmly planted, deeply rooted like a tree; perfect participle: established and remaining). ''Grounded'' (tethemeliōmenoi — having a foundation laid, established on a firm base; an architectural metaphor). Two metaphors — botanical (rooted like a tree) and architectural (founded like a building) — both in love as the soil and foundation.',
   NULL),
  (18, 'May be able to comprehend with all saints what is the breadth, and length, and depth, and height;',
   'ἵνα ἐξισχύσητε καταλαβέσθαι σὺν πᾶσιν τοῖς ἁγίοις τί τὸ πλάτος καὶ μῆκος καὶ βάθος καὶ ὕψος',
   'hina exischysēte katalabEsthai syn pasin tois hagiois ti to platos kai mēkos kai bathos kai hypsos',
   '''Comprehend'' (katalabesthai — to grasp, to seize, to lay hold of; not mere intellectual understanding but experiential apprehension). ''With all saints'' (syn pasin tois hagiois — this knowledge is communal, not merely individual). ''Breadth, length, depth, height'' — four dimensions, suggesting the immeasurable, multi-dimensional nature of Christ''s love (v.19). Some see an allusion to the cosmic dimensions of the cross — stretching in every direction. The love of Christ cannot be measured in any dimension.',
   NULL),
  (19, 'And to know the love of Christ, which passeth knowledge, that ye might be filled with all the fulness of God.',
   'γνῶναί τε τὴν ὑπερβάλλουσαν τῆς γνώσεως ἀγάπην τοῦ Χριστοῦ ἵνα πληρωθῆτε εἰς πᾶν τὸ πλήρωμα τοῦ θεοῦ',
   'gnōnai te tēn hyperballousan tēs gnōseōs agapēn tou Christou hina plērōthēte eis pan to plērōma tou theou',
   '''To know'' (gnōnai — to know experientially, personally). ''Passeth knowledge'' (hyperballousan tēs gnōseōs — surpassing knowledge; a deliberate paradox: to know what cannot be fully known). ''Filled with all the fulness of God'' (plērōthēte eis pan to plērōma tou theou — filled unto all the fullness of God; the ultimate goal: that God''s own fullness would fill the believer). This is the summit of Paul''s prayer — and the summit of Christian experience: being filled with the infinite God.',
   'Knowing the unknowable love: Paul prays for a paradox: that believers would ''know'' the love of Christ that ''surpasses knowledge.'' This is not intellectual contradiction but experiential reality — we can know by experience what we cannot fully comprehend by intellect. The love of Christ is real, accessible, and experiential, yet it is also infinite and inexhaustible. The goal — ''filled with all the fulness of God'' — is the most extraordinary petition in all of Scripture.'),
  (20, 'Now unto him that is able to do exceeding abundantly above all that we ask or think, according to the power that worketh in us,',
   'Τῷ δὲ δυναμένῳ ὑπὲρ πάντα ποιῆσαι ὑπερεκπερισσοῦ ὧν αἰτούμεθα ἢ νοοῦμεν κατὰ τὴν δύναμιν τὴν ἐνεργουμένην ἐν ἡμῖν',
   'Tō de dynamenō hyper panta poiēsai hyperekperissou hōn aitoumetha ē nooumen kata tēn dynamin tēn energoumenēn en hēmin',
   '''Exceeding abundantly above'' (hyperekperissou — a triple compound: hyper + ek + perissou = beyond + out of + abundantly; Paul invents a word to express God''s immeasurable generosity). ''All that we ask or think'' (pantōn hōn aitoumetha ē nooumen — everything we request or even imagine). ''According to the power that worketh in us'' (kata tēn dynamin tēn energoumenēn en hēmin — the measure of God''s ability is the resurrection power already at work within believers). God''s capacity infinitely exceeds even our most extravagant prayers and wildest imaginations.',
   'Exceeding abundantly above: This doxology is one of the most exalted expressions of God''s power in all of Scripture. The compound hyperekperissou (used only here and in 1 Thess 3:10, 5:13) piles prefix upon prefix to convey the immeasurable excess of God''s generosity. God does not merely answer prayer — he surpasses it infinitely. The power available is not abstract but ''worketh in us'' — the same resurrection power of 1:19-20 is already operative in the believer.'),
  (21, 'Unto him be glory in the church by Christ Jesus throughout all ages, world without end. Amen.',
   'αὐτῷ ἡ δόξα ἐν τῇ ἐκκλησίᾳ ἐν Χριστῷ Ἰησοῦ εἰς πάσας τὰς γενεὰς τοῦ αἰῶνος τῶν αἰώνων ἀμήν',
   'autō hē doxa en tē ekklēsia en Christō Iēsou eis pasas tas geneas tou aiōnos tōn aiōnōn amēn',
   '''Glory in the church'' (hē doxa en tē ekklēsia — the church is the sphere where God''s glory is displayed; cf. 3:10). ''By Christ Jesus'' (en Christō Iēsou — in union with Christ). ''Throughout all ages, world without end'' (eis pasas tas geneas tou aiōnos tōn aiōnōn — unto all the generations of the age of the ages; an eternity of eternities). The doxology closes the doctrinal section of Ephesians (chs.1-3). From ch.4 onward, Paul turns to practical application. The church gives God glory forever.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 6 (Fellowheirs, same body, partakers)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συγκληρονόμα', 'synklēronoma', 'G4789', 'Fellowheirs, co-heirs — from syn (together) + klēronomos (heir). Gentiles share the same inheritance as Jewish believers. Not a lesser portion or separate category, but the identical inheritance. This was the revolutionary content of the mystery.', 1),
  ('σύσσωμα', 'syssōma', 'G4954', 'Of the same body, co-body — from syn (together) + sōma (body). Used only here in the entire NT; Paul appears to have coined this word. Gentiles are not merely attached to Israel''s body but are incorporated into the same body — one body, the body of Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = 6;

-- Verse 8 (Less than the least / unsearchable riches)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλαχιστοτέρῳ', 'elachistoterō', 'G1647', 'Less than the least — a grammatical anomaly: a comparative (-teros) built on a superlative (elachistos, least). Paul coins a word that does not exist in standard Greek to express his sense of unworthiness. He is the ''leaster than the least,'' the ''very leastest'' of all saints.', 1),
  ('ἀνεξιχνίαστον', 'anexichniaston', 'G421', 'Unsearchable, untraceable — from a (not) + ex (out) + ichnos (footprint, track). Riches whose tracks cannot be followed, whose source cannot be traced. The wealth of Christ is so vast that it can never be fully explored or exhausted. Used only here and Romans 11:33 in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = 8;

-- Verse 10 (Manifold wisdom)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πολυποίκιλος', 'polypoikilos', 'G4182', 'Manifold, many-coloured, richly variegated — from polys (many) + poikilos (varied, diverse, multi-hued). Used only here in the NT. Like a tapestry of countless colours or a gem with infinite facets, God''s wisdom has an inexhaustible variety that the church displays to the cosmic powers.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 17 (Christ dwell in hearts)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατοικῆσαι', 'katoikēsai', 'G2730', 'To dwell, to settle permanently — from kata (down, intensifier) + oikeō (to dwell). Distinguished from paroikeō (to sojourn temporarily). Christ is not a visiting guest but a permanent resident. He takes up settled, established residence in the believer''s heart by faith.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = 17;

-- Verse 19 (Love that passeth knowledge)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερβάλλουσαν', 'hyperballousan', 'G5235', 'Surpassing, exceeding, transcending — from hyper (beyond) + ballō (to throw). The love of Christ ''throws beyond'' the capacity of human knowledge to contain it. It exceeds every attempt to measure or comprehend it fully, yet it can be experientially known.', 1),
  ('πλήρωμα', 'plērōma', 'G4138', 'Fulness, that which fills, completion — from plēroō (to fill). ''All the fulness of God'' (pan to plērōma tou theou) — the totality of God''s attributes and perfections. To be filled unto God''s fulness is the supreme goal of the Christian life: not that we contain God but that God increasingly fills us.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = 19;

-- Verse 20 (Exceeding abundantly above)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερεκπερισσοῦ', 'hyperekperissou', 'G5228+G1537+G4053', 'Exceeding abundantly above — a triple compound: hyper (beyond) + ek (out of) + perissou (abundance). Paul stacks three intensifiers to express the immeasurable excess of God''s generosity. Beyond-out-of-abundantly. No single word in any language can capture what Paul is trying to say about God''s limitless capacity.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = 20;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Prisoner of Jesus Christ
  (1, 'Philippians 1:13-14', 1), (1, '2 Timothy 1:8', 2),
  -- v5: Revealed by the Spirit
  (5, '1 Peter 1:10-12', 1), (5, 'Romans 16:25-26', 2),
  -- v6: Fellowheirs
  (6, 'Galatians 3:28-29', 1), (6, 'Romans 8:17', 2),
  -- v8: Unsearchable riches
  (8, '1 Corinthians 15:9', 1), (8, '1 Timothy 1:15', 2), (8, 'Romans 11:33', 3),
  -- v10: Manifold wisdom displayed
  (10, '1 Peter 1:12', 1), (10, 'Romans 11:33-36', 2),
  -- v12: Boldness and access
  (12, 'Hebrews 4:16', 1), (12, 'Romans 5:2', 2),
  -- v16: Strengthened by the Spirit
  (16, 'Colossians 1:11', 1), (16, 'Romans 8:26', 2),
  -- v17: Christ dwell in hearts
  (17, 'John 14:23', 1), (17, 'Colossians 1:27', 2), (17, 'Galatians 2:20', 3),
  -- v19: Love that passeth knowledge
  (19, 'Romans 8:35-39', 1), (19, 'John 3:16', 2),
  -- v20: Exceeding abundantly above
  (20, 'Romans 8:26-27', 1), (20, '1 Corinthians 2:9', 2), (20, 'Jude 1:24', 3),
  -- v21: Glory in the church
  (21, 'Romans 11:36', 1), (21, 'Revelation 5:13', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Ephesians Chapter 3 Complete
-- 21 verses · 7 key verses with word studies (12 words)
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
