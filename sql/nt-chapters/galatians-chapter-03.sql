-- ═══════════════════════════════════════════════════
-- GALATIANS CHAPTER 3 — The Law, the Promise, and Faith
-- 29 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Galatians 3 is Paul''s most concentrated theological argument for justification by faith apart from the law. He opens with an appeal to the Galatians'' own experience: ''O foolish Galatians, who hath bewitched you?'' — they received the Spirit by hearing with faith, not by works of the law (vv.1-5). Paul then turns to Scripture: Abraham ''believed God, and it was accounted to him for righteousness'' (v.6, quoting Gen 15:6). Those who are of faith are the true children of Abraham (v.7), and the gospel was preached beforehand to Abraham: ''In thee shall all nations be blessed'' (v.8). Those who rely on law-works are under a curse, for the law demands perfect obedience: ''Cursed is every one that continueth not in all things written in the book of the law to do them'' (v.10). ''The just shall live by faith'' (v.11). Christ redeemed us from the law''s curse ''being made a curse for us'' (v.13). The promise to Abraham was given 430 years before the law; the law cannot annul it (vv.15-18). The law''s purpose was not to replace the promise but to serve as a ''schoolmaster to bring us unto Christ'' (v.24). Now that faith has come, we are no longer under the schoolmaster (v.25). ''For ye are all the children of God by faith in Christ Jesus'' (v.26) — and in Christ ''there is neither Jew nor Greek, bond nor free, male nor female'' (v.28).',
  'Faith vs. Law — Abraham, the Curse, and the Promise',
  'ἐπαγγελία (epangelia)',
  'Promise — from epangellō (to announce, to declare). God''s unconditional commitment made to Abraham and fulfilled in Christ. The promise precedes the law by 430 years and cannot be annulled by it. The promise operates by grace through faith; the law operates by works.',
  '["The Galatians'' Experience: Spirit by Faith (vv.1-5): O foolish Galatians who hath bewitched you; received ye the Spirit by the works of the law or by the hearing of faith; are ye so foolish having begun in the Spirit are ye now made perfect by the flesh; he that ministereth to you the Spirit and worketh miracles among you doeth he it by the works of the law or by the hearing of faith","Abraham Believed God (vv.6-9): Even as Abraham believed God and it was accounted to him for righteousness; know ye therefore that they which are of faith the same are the children of Abraham; the scripture foreseeing that God would justify the heathen through faith preached before the gospel unto Abraham saying In thee shall all nations be blessed; so then they which be of faith are blessed with faithful Abraham","The Curse of the Law and Christ''s Redemption (vv.10-14): As many as are of the works of the law are under the curse; cursed is every one that continueth not in all things written in the book of the law to do them; the just shall live by faith; the law is not of faith; Christ hath redeemed us from the curse of the law being made a curse for us; that the blessing of Abraham might come on the Gentiles through Jesus Christ","The Law Cannot Annul the Promise (vv.15-18): A man''s covenant yet if it be confirmed no man disannulleth or addeth thereto; to Abraham and his seed were the promises made; he saith not and to seeds as of many but as of one and to thy seed which is Christ; the law which was four hundred and thirty years after cannot disannul the promise; if the inheritance be of the law it is no more of promise but God gave it to Abraham by promise","The Purpose of the Law — Schoolmaster to Christ (vv.19-25): Wherefore then serveth the law; it was added because of transgressions till the seed should come; is the law then against the promises of God; God forbid; the scripture hath concluded all under sin that the promise by faith of Jesus Christ might be given to them that believe; before faith came we were kept under the law shut up unto the faith which should afterwards be revealed; the law was our schoolmaster to bring us unto Christ that we might be justified by faith; but after that faith is come we are no longer under a schoolmaster","All One in Christ Jesus (vv.26-29): For ye are all the children of God by faith in Christ Jesus; for as many of you as have been baptized into Christ have put on Christ; there is neither Jew nor Greek there is neither bond nor free there is neither male nor female for ye are all one in Christ Jesus; if ye be Christ''s then are ye Abraham''s seed and heirs according to the promise"]'
FROM books b WHERE b.name = 'Galatians';

-- Step 2: Insert all 29 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'O foolish Galatians, who hath bewitched you, that ye should not obey the truth, before whose eyes Jesus Christ hath been evidently set forth, crucified among you?',
   'Ὦ ἀνόητοι Γαλάται τίς ὑμᾶς ἐβάσκανεν τῇ ἀληθείᾳ μὴ πείθεσθαι οἷς κατ᾽ ὀφθαλμοὺς Ἰησοῦς Χριστὸς προεγράφη ἐν ὑμῖν ἐσταυρωμένος',
   'Ō anoētoi Galatai tis hymas ebaskanen tē alētheia mē peithesthai hois kat'' ophthalmous Iēsous Christos proegraphē en hymin estaurōmenos',
   '''Foolish'' (anoētoi — senseless, unthinking; not an insult to intelligence but a charge of spiritual stupidity: failing to use the mind God gave). ''Bewitched'' (ebaskanen — cast a spell on, fascinated with evil eye; from baskainō). ''Evidently set forth'' (proegraphē — publicly displayed, written before your eyes, placarded; from prographō, to write publicly as on a poster). ''Crucified'' (estaurōmenos — having been crucified; perfect participle: crucified and remaining in that state). Paul had preached Christ crucified so vividly it was as if the cross had been erected before their eyes. How could they now turn away from it?',
   NULL),
  (2,
   'This only would I learn of you, Received ye the Spirit by the works of the law, or by the hearing of faith?',
   'τοῦτο μόνον θέλω μαθεῖν ἀφ᾽ ὑμῶν ἐξ ἔργων νόμου τὸ πνεῦμα ἐλάβετε ἢ ἐξ ἀκοῆς πίστεως',
   'touto monon thelō mathein aph'' hymōn ex ergōn nomou to pneuma elabete ē ex akoēs pisteōs',
   '''This only'' (touto monon — just this one thing; this single question settles everything). ''Received ye the Spirit'' (to pneuma elabete — did you receive the Spirit?). ''By the works of the law'' (ex ergōn nomou) or ''by the hearing of faith'' (ex akoēs pisteōs — through the message that produces faith, through hearing accompanied by faith). Their own experience is the evidence: the Spirit came when they heard and believed, not when they kept the law.',
   NULL),
  (3,
   'Are ye so foolish? having begun in the Spirit, are ye now made perfect by the flesh?',
   'οὕτως ἀνόητοί ἐστε ἐναρξάμενοι πνεύματι νῦν σαρκὶ ἐπιτελεῖσθε',
   'houtōs anoētoi este enarxamenoi pneumati nyn sarki epiteleisthe',
   '''Begun in the Spirit'' (enarxamenoi pneumati — having started by means of the Spirit). ''Made perfect by the flesh'' (sarki epiteleisthe — being perfected, completed, brought to maturity by the flesh). The logic is absurd: you started with the highest (the Spirit) and now seek to be perfected by the lowest (the flesh, human effort, law-keeping). This is regression, not progress.',
   NULL),
  (4,
   'Have ye suffered so many things in vain? if it be yet in vain.',
   'τοσαῦτα ἐπάθετε εἰκῇ εἴ γε καὶ εἰκῇ',
   'tosauta epathete eikē ei ge kai eikē',
   '''Suffered'' (epathete — experienced; can mean suffered or simply experienced). ''In vain'' (eikē — for nothing, without purpose). ''If it be yet in vain'' — Paul holds open the possibility that it is not too late. They have experienced much in their Christian walk; will all of it be for nothing if they now abandon grace for law?',
   NULL),
  (5,
   'He therefore that ministereth to you the Spirit, and worketh miracles among you, doeth he it by the works of the law, or by the hearing of faith?',
   'ὁ οὖν ἐπιχορηγῶν ὑμῖν τὸ πνεῦμα καὶ ἐνεργῶν δυνάμεις ἐν ὑμῖν ἐξ ἔργων νόμου ἢ ἐξ ἀκοῆς πίστεως',
   'ho oun epichorēgōn hymin to pneuma kai energōn dynameis en hymin ex ergōn nomou ē ex akoēs pisteōs',
   '''Ministereth'' (epichorēgōn — supplies abundantly, provides lavishly; from epi + chorēgeō, to lead a chorus, to supply at one''s own expense). ''Worketh miracles'' (energōn dynameis — performing powerful deeds). ''By the works of the law or by the hearing of faith?'' — the same question as v.2, but now pointing to God''s ongoing work among them. God continues to supply the Spirit and work miracles through faith, not law.',
   NULL),
  (6,
   'Even as Abraham believed God, and it was accounted to him for righteousness.',
   'Καθὼς Ἀβραὰμ ἐπίστευσεν τῷ θεῷ καὶ ἐλογίσθη αὐτῷ εἰς δικαιοσύνην',
   'Kathōs Abraam episteusen tō theō kai elogisthē autō eis dikaiosynēn',
   '''Believed'' (episteusen — put his trust in; aorist: a decisive act of faith). ''Accounted'' (elogisthē — was reckoned, was credited, was counted; from logizomai, an accounting term: to enter into the ledger). ''For righteousness'' (eis dikaiosynēn — unto righteousness, as righteousness). Quoting Genesis 15:6 — the key OT verse for the doctrine of justification by faith. Abraham was declared righteous not because of works but because he believed God. This happened before circumcision (Gen 17) and before the law (Exod 20).',
   'Justification by faith in the OT: Paul''s argument is not a New Testament innovation but an Old Testament principle. Abraham — the father of the Jewish nation — was justified by faith, not by works. If the patriarch himself was declared righteous by believing, how can his descendants claim that law-keeping is the basis of righteousness?'),
  (7,
   'Know ye therefore that they which are of faith, the same are the children of Abraham.',
   'Γινώσκετε ἄρα ὅτι οἱ ἐκ πίστεως οὗτοί εἰσιν υἱοὶ Ἀβραάμ',
   'Ginōskete ara hoti hoi ek pisteōs houtoi eisin huioi Abraam',
   '''They which are of faith'' (hoi ek pisteōs — those whose origin and principle is faith). ''Children of Abraham'' (huioi Abraam — sons of Abraham). A revolutionary claim: Abraham''s true descendants are not those who share his DNA but those who share his faith. This demolishes the Judaizers'' claim that Gentiles must become Jewish to be part of God''s people.',
   NULL),
  (8,
   'And the scripture, foreseeing that God would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.',
   'προϊδοῦσα δὲ ἡ γραφὴ ὅτι ἐκ πίστεως δικαιοῖ τὰ ἔθνη ὁ θεός προευηγγελίσατο τῷ Ἀβραὰμ ὅτι ἐνευλογηθήσονται ἐν σοὶ πάντα τὰ ἔθνη',
   'proidousa de hē graphē hoti ek pisteōs dikaioi ta ethnē ho theos proeuēngelisato tō Abraam hoti eneulogēthēsontai en soi panta ta ethnē',
   '''Foreseeing'' (proidousa — seeing ahead; Scripture personified as having foresight). ''Preached the gospel beforehand'' (proeuēngelisato — pre-evangelized, proclaimed the good news in advance). ''In thee shall all nations be blessed'' (quoting Gen 12:3; 18:18). The gospel was not an afterthought but God''s plan from Genesis. The blessing of Abraham was always intended for ''all nations'' (panta ta ethnē) — Gentiles included. Justification by faith for all peoples was the original plan.',
   NULL),
  (9,
   'So then they which be of faith are blessed with faithful Abraham.',
   'ὥστε οἱ ἐκ πίστεως εὐλογοῦνται σὺν τῷ πιστῷ Ἀβραάμ',
   'hōste hoi ek pisteōs eulogountai syn tō pistō Abraam',
   '''Blessed with'' (eulogountai syn — are being blessed along with). ''Faithful Abraham'' (tō pistō Abraam — believing Abraham; pistos here means ''believing,'' not just ''trustworthy''). All who believe share Abraham''s blessing: justification by faith. The connection between Abraham and all believers is faith, not ethnicity or law-keeping.',
   NULL),
  (10,
   'For as many as are of the works of the law are under the curse: for it is written, Cursed is every one that continueth not in all things which are written in the book of the law to do them.',
   'ὅσοι γὰρ ἐξ ἔργων νόμου εἰσίν ὑπὸ κατάραν εἰσίν γέγραπται γὰρ ὅτι Ἐπικατάρατος πᾶς ὃς οὐκ ἐμμένει ἐν πᾶσιν τοῖς γεγραμμένοις ἐν τῷ βιβλίῳ τοῦ νόμου τοῦ ποιῆσαι αὐτά',
   'hosoi gar ex ergōn nomou eisin hypo kataran eisin gegraptai gar hoti Epikataratos pas hos ouk emmenei en pasin tois gegrammenois en tō bibliō tou nomou tou poiēsai auta',
   '''Under the curse'' (hypo kataran — under a curse, beneath a curse). Quoting Deut 27:26. The law requires perfect, unbroken obedience to ''all things'' (pasin). Any failure brings the curse. Therefore, anyone who relies on law-keeping for justification is under the curse, because no one keeps the law perfectly. The law does not offer partial credit.',
   'The curse of the law: The law operates on an all-or-nothing principle. To rely on law-works for righteousness requires keeping every command without exception. Since no one achieves this, the law can only pronounce its curse on everyone under it. This is precisely why an alternative is needed: justification by faith apart from law-works.'),
  (11,
   'But that no man is justified by the law in the sight of God, it is evident: for, The just shall live by faith.',
   'ὅτι δὲ ἐν νόμῳ οὐδεὶς δικαιοῦται παρὰ τῷ θεῷ δῆλον ὅτι Ὁ δίκαιος ἐκ πίστεως ζήσεται',
   'hoti de en nomō oudeis dikaioutai para tō theō dēlon hoti Ho dikaios ek pisteōs zēsetai',
   '''No man is justified by the law'' (en nomō oudeis dikaioutai — in the sphere of law, no one is declared righteous). ''The just shall live by faith'' (ho dikaios ek pisteōs zēsetai — quoting Hab 2:4). Two opposing principles: the law demands works; Habakkuk declares that the righteous person lives by faith. Since righteous living comes by faith, the law is not the path to righteousness.',
   NULL),
  (12,
   'And the law is not of faith: but, The man that doeth them shall live in them.',
   'ὁ δὲ νόμος οὐκ ἔστιν ἐκ πίστεως ἀλλ᾽ Ὁ ποιήσας αὐτὰ ἄνθρωπος ζήσεται ἐν αὐτοῖς',
   'ho de nomos ouk estin ek pisteōs all'' Ho poiēsas auta anthrōpos zēsetai en autois',
   '''The law is not of faith'' (ho nomos ouk estin ek pisteōs — the law does not operate on the principle of faith). Quoting Lev 18:5: ''The man that doeth them shall live in them'' — the law''s principle is doing, not believing. Law and faith are two different operating systems. You cannot mix them: either you rely on doing (law) or on believing (faith). The Judaizers were trying to combine them; Paul insists they are incompatible.',
   NULL),
  (13,
   'Christ hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree:',
   'Χριστὸς ἡμᾶς ἐξηγόρασεν ἐκ τῆς κατάρας τοῦ νόμου γενόμενος ὑπὲρ ἡμῶν κατάρα ὅτι γέγραπται Ἐπικατάρατος πᾶς ὁ κρεμάμενος ἐπὶ ξύλου',
   'Christos hēmas exēgorasen ek tēs kataras tou nomou genomenos hyper hēmōn katara hoti gegraptai Epikataratos pas ho kremamenos epi xylou',
   '''Redeemed'' (exēgorasen — bought out, purchased out of the marketplace; from ex + agorazō, to buy from the slave market). ''Made a curse for us'' (genomenos hyper hēmōn katara — having become a curse on our behalf; not merely cursed but becoming the curse itself). Quoting Deut 21:23: anyone hung on a tree is under God''s curse. Christ on the cross bore the law''s curse in our place — the sinless One became the cursed One so that the cursed might go free.',
   'Penal substitutionary atonement: Christ''s death was substitutionary (''for us''), penal (He bore the curse), and effective (He redeemed us). He did not merely experience the curse but became the embodiment of it. The cross is not a tragedy but a transaction: Christ took our curse so we could receive Abraham''s blessing (v.14).'),
  (14,
   'That the blessing of Abraham might come on the Gentiles through Jesus Christ; that we might receive the promise of the Spirit through faith.',
   'ἵνα εἰς τὰ ἔθνη ἡ εὐλογία τοῦ Ἀβραὰμ γένηται ἐν Χριστῷ Ἰησοῦ ἵνα τὴν ἐπαγγελίαν τοῦ πνεύματος λάβωμεν διὰ τῆς πίστεως',
   'hina eis ta ethnē hē eulogia tou Abraam genētai en Christō Iēsou hina tēn epangelian tou pneumatos labōmen dia tēs pisteōs',
   'Two purposes of Christ''s redemption: (1) ''the blessing of Abraham might come on the Gentiles'' — the promise to Abraham that all nations would be blessed is fulfilled through Christ, (2) ''we might receive the promise of the Spirit through faith'' — the Holy Spirit is received by faith, not law. The blessing of Abraham and the gift of the Spirit are connected: both come by faith, both are available to Gentiles, both are made possible by Christ bearing the curse.',
   NULL),
  (15,
   'Brethren, I speak after the manner of men; Though it be but a man''s covenant, yet if it be confirmed, no man disannulleth, or addeth thereto.',
   'Ἀδελφοί κατὰ ἄνθρωπον λέγω ὅμως ἀνθρώπου κεκυρωμένην διαθήκην οὐδεὶς ἀθετεῖ ἢ ἐπιδιατάσσεται',
   'Adelphoi kata anthrōpon legō homōs anthrōpou kekyrōmenēn diathēkēn oudeis athetei ē epidiatassetai',
   '''After the manner of men'' (kata anthrōpon — using a human analogy). ''Covenant'' (diathēkēn — testament, will, covenant). ''Confirmed'' (kekyrōmenēn — ratified, validated, made legally binding). ''Disannulleth'' (athetei — sets aside, annuls). ''Addeth thereto'' (epidiatassetai — adds additional stipulations). Even in human law, a ratified covenant cannot be altered or annulled. How much more God''s covenant with Abraham?',
   NULL),
  (16,
   'Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Christ.',
   'τῷ δὲ Ἀβραὰμ ἐρρέθησαν αἱ ἐπαγγελίαι καὶ τῷ σπέρματι αὐτοῦ οὐ λέγει Καὶ τοῖς σπέρμασιν ὡς ἐπὶ πολλῶν ἀλλ᾽ ὡς ἐφ᾽ ἑνός Καὶ τῷ σπέρματί σου ὅς ἐστιν Χριστός',
   'tō de Abraam errethēsan hai epangeliai kai tō spermati autou ou legei Kai tois spermasin hōs epi pollōn all'' hōs eph'' henos Kai tō spermati sou hos estin Christos',
   '''Seed'' (spermati — singular: one offspring). Paul makes an argument from the singular form: ''seed'' (not ''seeds'') points to one specific descendant — Christ. All the promises God made to Abraham find their ultimate fulfilment in Christ. Believers are ''in Christ'' and therefore share in the promises made to the Seed.',
   NULL),
  (17,
   'And this I say, that the covenant, that was confirmed before of God in Christ, the law, which was four hundred and thirty years after, cannot disannul, that it should make the promise of none effect.',
   'τοῦτο δὲ λέγω διαθήκην προκεκυρωμένην ὑπὸ τοῦ θεοῦ εἰς Χριστὸν ὁ μετὰ ἔτη τετρακόσια καὶ τριάκοντα γεγονὼς νόμος οὐκ ἀκυροῖ εἰς τὸ καταργῆσαι τὴν ἐπαγγελίαν',
   'touto de legō diathēkēn prokekyrōmenēn hypo tou theou eis Christon ho meta etē tetrakosia kai triakonta gegonōs nomos ouk akyroi eis to katargēsai tēn epangelian',
   '''Confirmed before'' (prokekyrōmenēn — previously ratified, already validated). ''Four hundred and thirty years after'' — the law came centuries after the promise. A later document cannot cancel an earlier, ratified agreement. The law did not replace or modify the Abrahamic promise; the promise remains in full force.',
   NULL),
  (18,
   'For if the inheritance be of the law, it is no more of promise: but God gave it to Abraham by promise.',
   'εἰ γὰρ ἐκ νόμου ἡ κληρονομία οὐκέτι ἐξ ἐπαγγελίας τῷ δὲ Ἀβραὰμ δι᾽ ἐπαγγελίας κεχάρισται ὁ θεός',
   'ei gar ek nomou hē klēronomia ouketi ex epangelias tō de Abraam di'' epangelias kecharistai ho theos',
   '''Inheritance'' (klēronomia — the promised blessings). ''By promise'' (di'' epangelias — through promise). ''Gave'' (kecharistai — has given as a grace-gift; from charizomai, related to charis, grace; perfect tense: gave and it stands). The inheritance came to Abraham as a gift of grace through promise, not through law. If the inheritance depended on the law, the promise would be meaningless. But God gave it by promise — and a promise is grace.',
   NULL),
  (19,
   'Wherefore then serveth the law? It was added because of transgressions, till the seed should come to whom the promise was made; and it was ordained by angels in the hand of a mediator.',
   'Τί οὖν ὁ νόμος τῶν παραβάσεων χάριν προσετέθη ἄχρις οὗ ἔλθῃ τὸ σπέρμα ᾧ ἐπήγγελται διαταγεὶς δι᾽ ἀγγέλων ἐν χειρὶ μεσίτου',
   'Ti oun ho nomos tōn parabaseōn charin prosetethē achris hou elthē to sperma hō epēngeltai diatageis di'' angelōn en cheiri mesitou',
   '''Wherefore then?'' (ti oun — why then, what purpose?). ''Added because of transgressions'' (tōn parabaseōn charin prosetethē — added for the sake of transgressions; to make sin clearly visible as transgression). ''Till the seed should come'' (achris hou elthē to sperma — until the Seed arrives; the law was temporary). ''Ordained by angels'' (diatageis di'' angelōn — arranged through angelic mediation; cf. Acts 7:53; Heb 2:2). ''In the hand of a mediator'' (en cheiri mesitou — through a mediator, Moses). The law was temporary, secondary, and mediated — unlike the promise, which was eternal, primary, and direct.',
   NULL),
  (20,
   'Now a mediator is not a mediator of one, but God is one.',
   'ὁ δὲ μεσίτης ἑνὸς οὐκ ἔστιν ὁ δὲ θεὸς εἷς ἐστιν',
   'ho de mesitēs henos ouk estin ho de theos heis estin',
   'A dense argument: a mediator implies two parties, but a promise depends on only one — the promiser. The law involved a mediator (Moses) between two parties (God and Israel), making it conditional on both parties. But the promise to Abraham was God''s unilateral commitment — depending on God alone, who is one. The promise is therefore more certain than the law.',
   NULL),
  (21,
   'Is the law then against the promises of God? God forbid: for if there had been a law given which could have given life, verily righteousness should have been by the law.',
   'ὁ οὖν νόμος κατὰ τῶν ἐπαγγελιῶν τοῦ θεοῦ μὴ γένοιτο εἰ γὰρ ἐδόθη νόμος ὁ δυνάμενος ζωοποιῆσαι ὄντως ἐκ νόμου ἂν ἦν ἡ δικαιοσύνη',
   'ho oun nomos kata tōn epangeliōn tou theou mē genoito ei gar edothē nomos ho dynamenos zōopoiēsai ontōs ek nomou an ēn hē dikaiosynē',
   '''Against the promises?'' (kata tōn epangeliōn — opposed to the promises?). ''God forbid'' (mē genoito — may it never be!). ''Could have given life'' (ho dynamenos zōopoiēsai — able to make alive). The law and the promise are not opponents but serve different functions. The law was never able to give life or produce righteousness. If it could, there would have been no need for the promise. The law''s inability is not a design flaw — it was never meant to save.',
   NULL),
  (22,
   'But the scripture hath concluded all under sin, that the promise by faith of Jesus Christ might be given to them that believe.',
   'ἀλλὰ συνέκλεισεν ἡ γραφὴ τὰ πάντα ὑπὸ ἁμαρτίαν ἵνα ἡ ἐπαγγελία ἐκ πίστεως Ἰησοῦ Χριστοῦ δοθῇ τοῖς πιστεύουσιν',
   'alla synekleisen hē graphē ta panta hypo hamartian hina hē epangelia ek pisteōs Iēsou Christou dothē tois pisteuousin',
   '''Concluded'' (synekleisen — shut up together, enclosed, locked up; from synkleiō, to close on all sides). ''All under sin'' (ta panta hypo hamartian — everything under the power of sin). Scripture itself declares all humanity imprisoned under sin so that the only escape is through the promise — received by faith in Jesus Christ. The law''s role was not to save but to imprison, driving people to the promise.',
   NULL),
  (23,
   'But before faith came, we were kept under the law, shut up unto the faith which should afterwards be revealed.',
   'Πρὸ τοῦ δὲ ἐλθεῖν τὴν πίστιν ὑπὸ νόμον ἐφρουρούμεθα συγκεκλεισμένοι εἰς τὴν μέλλουσαν πίστιν ἀποκαλυφθῆναι',
   'Pro tou de elthein tēn pistin hypo nomon ephrouroumetha synkekleimenoi eis tēn mellousan pistin apokalyphthēnai',
   '''Before faith came'' (pro tou elthein tēn pistin — before the era of faith in Christ arrived). ''Kept under'' (ephrouroumetha — were guarded, were held in custody; from phroureō, to garrison, to keep under military guard). ''Shut up'' (synkekleimenoi — locked up, imprisoned). ''Unto the faith'' (eis tēn mellousan pistin — unto the faith about to be revealed). The law functioned as a guard, keeping Israel in protective custody until the era of faith in Christ arrived.',
   NULL),
  (24,
   'Wherefore the law was our schoolmaster to bring us unto Christ, that we might be justified by faith.',
   'ὥστε ὁ νόμος παιδαγωγὸς ἡμῶν γέγονεν εἰς Χριστόν ἵνα ἐκ πίστεως δικαιωθῶμεν',
   'hōste ho nomos paidagōgos hēmōn gegonen eis Christon hina ek pisteōs dikaiōthōmen',
   '''Schoolmaster'' (paidagōgos — a child-conductor, a guardian-tutor; not a teacher but the slave who escorted the child to school, maintained discipline, and supervised behaviour until the child reached maturity). The law was the paidagōgos that led Israel to Christ — not by teaching salvation but by exposing sin, creating awareness of guilt, and pointing to the need for a saviour. ''That we might be justified by faith'' — the law''s purpose was to prepare for faith-justification, not to provide law-justification.',
   'The law as schoolmaster: The paidagōgos was a temporary guardian whose role ended when the child came of age. Similarly, the law''s supervisory role ended when Christ came. The law was never meant to be permanent; it was a preparatory phase leading to faith. Now that faith has come (v.25), the schoolmaster''s role is complete.'),
  (25,
   'But after that faith is come, we are no longer under a schoolmaster.',
   'ἐλθούσης δὲ τῆς πίστεως οὐκέτι ὑπὸ παιδαγωγόν ἐσμεν',
   'elthousēs de tēs pisteōs ouketi hypo paidagōgon esmen',
   '''Faith is come'' (elthousēs tēs pisteōs — faith having arrived; the new era). ''No longer under'' (ouketi hypo — no more under the authority of). The law''s guardianship has ended. Believers are no longer under the law''s supervisory authority. This does not mean the law is abolished but that its role as guardian over God''s people is complete now that Christ has come.',
   NULL),
  (26,
   'For ye are all the children of God by faith in Christ Jesus.',
   'πάντες γὰρ υἱοὶ θεοῦ ἐστε διὰ τῆς πίστεως ἐν Χριστῷ Ἰησοῦ',
   'pantes gar huioi theou este dia tēs pisteōs en Christō Iēsou',
   '''All'' (pantes — all of you, every one; Jew and Gentile alike). ''Children of God'' (huioi theou — sons of God; huioi implies mature sons, not just children). ''By faith in Christ Jesus'' (dia tēs pisteōs en Christō Iēsou — through faith, in union with Christ). The transition from ''under a schoolmaster'' (minor, in custody) to ''children of God'' (mature, free) comes through faith. All who believe are God''s sons — regardless of background.',
   NULL),
  (27,
   'For as many of you as have been baptized into Christ have put on Christ.',
   'ὅσοι γὰρ εἰς Χριστὸν ἐβαπτίσθητε Χριστὸν ἐνεδύσασθε',
   'hosoi gar eis Christon ebaptisthēte Christon enedysasthe',
   '''Baptized into Christ'' (eis Christon ebaptisthēte — immersed into Christ; the baptism that unites believers with Christ, whether referring to water baptism as the outward sign or Spirit baptism as the inward reality). ''Put on Christ'' (Christon enedysasthe — clothed yourselves with Christ; from endyō, to put on clothing). As a new garment covers the old, being in Christ covers all previous identities and distinctions.',
   NULL),
  (28,
   'There is neither Jew nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in Christ Jesus.',
   'οὐκ ἔνι Ἰουδαῖος οὐδὲ Ἕλλην οὐκ ἔνι δοῦλος οὐδὲ ἐλεύθερος οὐκ ἔνι ἄρσεν καὶ θῆλυ πάντες γὰρ ὑμεῖς εἷς ἐστε ἐν Χριστῷ Ἰησοῦ',
   'ouk eni Ioudaios oude Hellēn ouk eni doulos oude eleutheros ouk eni arsen kai thēly pantes gar hymeis heis este en Christō Iēsou',
   '''Neither ... nor'' (ouk eni — there is not, there does not exist). Three pairs of division dissolved: (1) ethnic (Jew/Greek), (2) social (slave/free), (3) gender (male/female). ''All one'' (heis este — you are one, a single entity). In Christ, the divisions that define the world are transcended. This does not erase distinctions but removes them as barriers to equal standing before God. Every believer has the same access, the same status, the same inheritance.',
   'Equality in Christ: This is one of the most revolutionary statements in all of Scripture. In a world divided by ethnicity, class, and gender, Paul declares that in Christ all such divisions are irrelevant to one''s standing before God. The Judaizers insisted on maintaining the Jew/Gentile distinction; Paul declares it abolished in Christ. Every person who believes has equal status as a child of God.'),
  (29,
   'And if ye be Christ''s, then are ye Abraham''s seed, and heirs according to the promise.',
   'εἰ δὲ ὑμεῖς Χριστοῦ ἄρα τοῦ Ἀβραὰμ σπέρμα ἐστέ κατ᾽ ἐπαγγελίαν κληρονόμοι',
   'ei de hymeis Christou ara tou Abraam sperma este kat'' epangelian klēronomoi',
   '''If ye be Christ''s'' (ei hymeis Christou — if you belong to Christ). ''Abraham''s seed'' (tou Abraam sperma — Abraham''s offspring). ''Heirs according to the promise'' (kat'' epangelian klēronomoi — heirs on the basis of promise, not law). The argument reaches its climax: if you belong to Christ (the Seed, v.16), then you are Abraham''s offspring and heirs of the promise. No circumcision required, no law-keeping needed — faith in Christ makes you Abraham''s heir.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Galatians' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 6 (Accounted for righteousness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλογίσθη', 'elogisthē', 'G3049', 'Was reckoned, was credited, was counted — from logizomai, an accounting term: to enter into the ledger, to put to one''s account. Abraham''s faith was credited to his account as righteousness. He did not earn it; it was credited.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 3 AND v.verse_number = 6;

-- Verse 10 (Curse)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατάραν', 'kataran', 'G2671', 'Curse — from kataraomai (to curse, to call down evil upon). The law''s curse falls on everyone who fails to keep every command perfectly. Since no one achieves perfect obedience, the curse falls on all who depend on law-works.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 13 (Redeemed / made a curse)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐξηγόρασεν', 'exēgorasen', 'G1805', 'Redeemed, bought out — from ex (out of) + agorazō (to purchase in the marketplace). A slave-market metaphor: Christ purchased us out of the slave market of the law''s curse. The price was His own blood (1 Pet 1:18-19).', 1),
  ('κατάρα', 'katara', 'G2671', 'A curse — Christ did not merely bear the curse but became the curse. The abstract became personal: the full weight of the law''s condemnation was concentrated on the sinless Son of God hanging on the cross-tree.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 3 AND v.verse_number = 13;

-- Verse 24 (Schoolmaster)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παιδαγωγός', 'paidagōgos', 'G3807', 'Schoolmaster, guardian, child-conductor — from pais (child) + agō (to lead). Not a teacher but a slave assigned to supervise and escort a child to school. The role was temporary: it ended when the child reached maturity. The law supervised Israel until Christ came.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 3 AND v.verse_number = 24;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Spirit by hearing of faith
  (2, 'Acts 10:44-47', 1), (2, 'Galatians 4:6', 2),
  -- v6: Abraham believed / accounted
  (6, 'Genesis 15:6', 1), (6, 'Romans 4:3', 2), (6, 'James 2:23', 3),
  -- v8: In thee shall all nations be blessed
  (8, 'Genesis 12:3', 1), (8, 'Genesis 18:18', 2), (8, 'Acts 3:25', 3),
  -- v10: Cursed is every one
  (10, 'Deuteronomy 27:26', 1), (10, 'James 2:10', 2),
  -- v11: The just shall live by faith
  (11, 'Habakkuk 2:4', 1), (11, 'Romans 1:17', 2), (11, 'Hebrews 10:38', 3),
  -- v13: Redeemed from the curse / cursed on a tree
  (13, 'Deuteronomy 21:23', 1), (13, '2 Corinthians 5:21', 2), (13, '1 Peter 2:24', 3),
  -- v16: Seed = Christ
  (16, 'Genesis 22:18', 1), (16, 'Acts 3:25-26', 2),
  -- v22: All under sin
  (22, 'Romans 3:9-20', 1), (22, 'Romans 11:32', 2),
  -- v24: Law as schoolmaster
  (24, 'Romans 10:4', 1), (24, 'Colossians 2:17', 2),
  -- v26: Children of God by faith
  (26, 'John 1:12', 1), (26, 'Romans 8:14-17', 2),
  -- v28: Neither Jew nor Greek
  (28, 'Colossians 3:11', 1), (28, '1 Corinthians 12:13', 2), (28, 'Romans 10:12', 3),
  -- v29: Heirs according to the promise
  (29, 'Romans 8:17', 1), (29, 'Galatians 4:7', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Galatians Chapter 3 Complete
-- 29 verses · 5 key verses with word studies (6 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
