-- ═══════════════════════════════════════════════════
-- EPHESIANS CHAPTER 1 — Spiritual Blessings in Christ
-- 23 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Ephesians 1 opens with a sweeping doxology that surveys the full scope of God''s redemptive purpose from eternity past to eternity future. After a brief greeting (vv.1-2), Paul erupts into praise: ''Blessed be the God and Father of our Lord Jesus Christ, who hath blessed us with all spiritual blessings in heavenly places in Christ'' (v.3). Every blessing is ''in Christ'' — chosen before the foundation of the world (v.4), predestinated unto adoption (v.5), accepted in the beloved (v.6), redeemed through his blood with forgiveness of sins (v.7). God has ''made known unto us the mystery of his will'' — to gather together ''all things in Christ'' (vv.9-10). Believers are sealed ''with that holy Spirit of promise, which is the earnest of our inheritance'' (vv.13-14). Paul then turns to prayer, asking God to give the Ephesians ''the spirit of wisdom and revelation in the knowledge of him'' (v.17), that they may know ''the hope of his calling, the riches of the glory of his inheritance in the saints, and the exceeding greatness of his power'' (vv.18-19). This power is demonstrated in Christ''s resurrection and exaltation ''far above all principality, and power, and might, and dominion'' (v.21), with all things under his feet as ''head over all things to the church, which is his body, the fulness of him that filleth all in all'' (vv.22-23).',
  'Every Spiritual Blessing in Christ',
  'εὐλογία (eulogia)',
  'Blessing, praise — from eu (well) + logos (word). God has spoken well over us with every spiritual blessing. The chapter catalogues these blessings: election, predestination, adoption, redemption, forgiveness, revelation, inheritance, sealing — all located ''in Christ'' and flowing from the Triune God.',
  '["Greeting and Apostolic Authority (vv.1-2): Paul an apostle of Jesus Christ by the will of God to the saints which are at Ephesus and to the faithful in Christ Jesus grace be to you and peace from God our Father and from the Lord Jesus Christ","The Father''s Blessings: Election and Predestination (vv.3-6): Blessed be the God and Father of our Lord Jesus Christ who hath blessed us with all spiritual blessings in heavenly places in Christ; according as he hath chosen us in him before the foundation of the world that we should be holy and without blame before him in love; having predestinated us unto the adoption of children by Jesus Christ to himself according to the good pleasure of his will to the praise of the glory of his grace wherein he hath made us accepted in the beloved","The Son''s Blessings: Redemption and Mystery Revealed (vv.7-12): In whom we have redemption through his blood the forgiveness of sins according to the riches of his grace; wherein he hath abounded toward us in all wisdom and prudence; having made known unto us the mystery of his will according to his good pleasure which he hath purposed in himself; that in the dispensation of the fulness of times he might gather together in one all things in Christ; in whom also we have obtained an inheritance being predestinated according to the purpose of him who worketh all things after the counsel of his own will","The Spirit''s Blessings: Sealing and Earnest (vv.13-14): In whom ye also trusted after that ye heard the word of truth the gospel of your salvation in whom also after that ye believed ye were sealed with that holy Spirit of promise which is the earnest of our inheritance until the redemption of the purchased possession unto the praise of his glory","Paul''s Prayer for Wisdom and Revelation (vv.15-23): That the God of our Lord Jesus Christ the Father of glory may give unto you the spirit of wisdom and revelation in the knowledge of him; the eyes of your understanding being enlightened that ye may know what is the hope of his calling and what the riches of the glory of his inheritance in the saints and what is the exceeding greatness of his power to usward who believe; which he wrought in Christ when he raised him from the dead and set him at his own right hand in the heavenly places far above all principality and power and might and dominion; and hath put all things under his feet and gave him to be the head over all things to the church which is his body the fulness of him that filleth all in all"]'
FROM books b WHERE b.name = 'Ephesians';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Paul, an apostle of Jesus Christ by the will of God, to the saints which are at Ephesus, and to the faithful in Christ Jesus:',
   'Παῦλος ἀπόστολος Ἰησοῦ Χριστοῦ διὰ θελήματος θεοῦ τοῖς ἁγίοις τοῖς οὖσιν ἐν Ἐφέσῳ καὶ πιστοῖς ἐν Χριστῷ Ἰησοῦ',
   'Paulos apostolos Iēsou Christou dia thelēmatos theou tois hagiois tois ousin en Ephesō kai pistois en Christō Iēsou',
   '''By the will of God'' (dia thelēmatos theou) — Paul''s apostleship is not self-appointed but divinely ordained. ''Saints'' (hagiois — holy ones, set-apart ones). ''Faithful'' (pistois — believing, trustworthy). The recipients are described by two qualities: they are set apart by God (saints) and they are trusting in Christ (faithful). Some early manuscripts omit ''at Ephesus,'' suggesting this may have been a circular letter.',
   NULL),
  (2, 'Grace be to you, and peace, from God our Father, and from the Lord Jesus Christ.',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   '''Grace'' (charis) and ''peace'' (eirēnē) — the standard Pauline greeting combining Greek and Hebrew salutations. Grace is the source; peace is the result. Both flow equally from ''God our Father'' and ''the Lord Jesus Christ'' — placing Christ on the same level as the Father as the origin of divine blessing.',
   NULL),
  (3, 'Blessed be the God and Father of our Lord Jesus Christ, who hath blessed us with all spiritual blessings in heavenly places in Christ:',
   'Εὐλογητὸς ὁ θεὸς καὶ πατὴρ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ὁ εὐλογήσας ἡμᾶς ἐν πάσῃ εὐλογίᾳ πνευματικῇ ἐν τοῖς ἐπουρανίοις ἐν Χριστῷ',
   'Eulogētos ho theos kai patēr tou kyriou hēmōn Iēsou Christou ho eulogēsas hēmas en pasē eulogia pneumatikē en tois epouraniois en Christō',
   '''Blessed'' (Eulogētos — worthy of praise, to be spoken well of; used only of God). ''Hath blessed'' (eulogēsas — aorist participle: has already blessed, a completed act). ''All spiritual blessings'' (pasē eulogia pneumatikē — every blessing of a spiritual nature). ''In heavenly places'' (en tois epouraniois — in the heavenlies; a key Ephesians phrase, 1:20, 2:6, 3:10, 6:12). ''In Christ'' (en Christō) — the phrase that dominates the chapter; every blessing is located in union with Christ. This verse is the thesis statement: God has already given us everything in Christ.',
   'Spiritual blessings in heavenly places: The blessings are ''spiritual'' (pneumatikē — pertaining to the Holy Spirit, not merely ''non-material''). They are located ''in the heavenlies'' — the realm of spiritual reality where Christ is seated and where believers are already positioned (2:6). These blessings are not future promises but present possessions; the aorist tense (eulogēsas) indicates a completed action. The entire doxology (vv.3-14) unpacks what these blessings are.'),
  (4, 'According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:',
   'καθὼς ἐξελέξατο ἡμᾶς ἐν αὐτῷ πρὸ καταβολῆς κόσμου εἶναι ἡμᾶς ἁγίους καὶ ἀμώμους κατενώπιον αὐτοῦ ἐν ἀγάπῃ',
   'kathōs exelexato hēmas en autō pro katabolēs kosmou einai hēmas hagious kai amōmous katenōpion autou en agapē',
   '''Chosen'' (exelexato — selected for oneself, picked out; aorist middle: God chose for himself). ''Before the foundation of the world'' (pro katabolēs kosmou — before the laying down of the world; election is pre-temporal, before creation itself). ''Holy and without blame'' (hagious kai amōmous — holy and unblemished; amōmos is a sacrificial term, used of animals without defect). ''Before him'' (katenōpion autou — in his very presence, under his gaze). The purpose of election is not merely salvation but holiness — to be presented faultless before God.',
   'Election before the foundation of the world: This verse teaches that God''s choice of believers was made in eternity past, before creation. The election is ''in him'' (en autō — in Christ); there is no election apart from Christ. The goal of election is ethical: ''that we should be holy.'' Election is not merely about destiny but about character transformation. It flows from love (''in love,'' which may modify either God''s choosing or our standing before him).'),
  (5, 'Having predestinated us unto the adoption of children by Jesus Christ to himself, according to the good pleasure of his will,',
   'προορίσας ἡμᾶς εἰς υἱοθεσίαν διὰ Ἰησοῦ Χριστοῦ εἰς αὐτόν κατὰ τὴν εὐδοκίαν τοῦ θελήματος αὐτοῦ',
   'proorisas hēmas eis huiothesian dia Iēsou Christou eis auton kata tēn eudokian tou thelēmatos autou',
   '''Predestinated'' (proorisas — marked out beforehand, determined in advance the boundary/destiny; from pro + horizō). ''Adoption of children'' (huiothesian — the legal act of placing as a son with full inheritance rights; a Roman legal term). ''Good pleasure'' (eudokian — delight, kind intention, benevolent purpose). ''Of his will'' (tou thelēmatos autou — of his own will). Predestination is unto something positive: full sonship. The motive is not arbitrary sovereignty but delighted purpose.',
   'Predestination and adoption: Predestination (proorisas) means God marked out in advance the destination of those he chose. That destination is ''adoption'' (huiothesia) — not merely rescue from condemnation but elevation to the status of sons with full inheritance rights. In Roman law, adoption was irrevocable and gave the adopted child all the rights of a natural-born son. The basis is ''the good pleasure of his will'' — God''s sovereign, loving delight.'),
  (6, 'To the praise of the glory of his grace, wherein he hath made us accepted in the beloved.',
   'εἰς ἔπαινον δόξης τῆς χάριτος αὐτοῦ ἐν ᾗ ἐχαρίτωσεν ἡμᾶς ἐν τῷ ἠγαπημένῳ',
   'eis epainon doxēs tēs charitos autou en hē echaritōsen hēmas en tō ēgapēmenō',
   '''To the praise of the glory of his grace'' (eis epainon doxēs tēs charitos — a triple genitive: praise → glory → grace; the ultimate purpose of election is that God''s grace be glorified). ''Made us accepted'' (echaritōsen — graced us, bestowed grace upon us, favoured us freely; the same root as charis). ''In the beloved'' (en tō ēgapēmenō — in the one who has been loved; a title for Christ, the eternally beloved Son). We are accepted not on our own merit but in the Beloved — our acceptance is Christ''s acceptance.',
   NULL),
  (7, 'In whom we have redemption through his blood, the forgiveness of sins, according to the riches of his grace;',
   'ἐν ᾧ ἔχομεν τὴν ἀπολύτρωσιν διὰ τοῦ αἵματος αὐτοῦ τὴν ἄφεσιν τῶν παραπτωμάτων κατὰ τὸν πλοῦτον τῆς χάριτος αὐτοῦ',
   'en hō echomen tēn apolytrōsin dia tou haimatos autou tēn aphesin tōn paraptōmatōn kata ton plouton tēs charitos autou',
   '''Redemption'' (apolytrōsin — release by payment of a ransom; the price paid to liberate a slave or prisoner). ''Through his blood'' (dia tou haimatos autou — the ransom price is Christ''s sacrificial death). ''Forgiveness'' (aphesin — release, sending away, remission). ''Sins'' (paraptōmatōn — trespasses, false steps; the same word as Gal 6:1). ''Riches of his grace'' (ton plouton tēs charitos — not merely ''grace'' but the wealth of grace; God''s grace is inexhaustible). Redemption is a present possession (echomen — we have), not merely a future hope.',
   'Redemption through blood: The metaphor is drawn from the slave market. Sinners are enslaved; Christ''s blood is the ransom price that purchases their freedom. ''Forgiveness'' (aphesis) literally means ''sending away'' — sins are released, dismissed, removed. The measure of this forgiveness is ''the riches of his grace'' — God does not forgive grudgingly but lavishly, out of the overflow of his infinite grace.'),
  (8, 'Wherein he hath abounded toward us in all wisdom and prudence;',
   'ἧς ἐπερίσσευσεν εἰς ἡμᾶς ἐν πάσῃ σοφίᾳ καὶ φρονήσει',
   'hēs eperisseusen eis hēmas en pasē sophia kai phronēsei',
   '''Abounded'' (eperisseusen — overflowed, superabounded; God''s grace does not merely meet the need but overflows beyond it). ''Wisdom'' (sophia — divine wisdom, the knowledge of God''s eternal purposes). ''Prudence'' (phronēsei — practical understanding, insight, discernment). God has not only redeemed us but has also given us the intellectual and spiritual capacity to understand his purposes. Grace produces both salvation and illumination.',
   NULL),
  (9, 'Having made known unto us the mystery of his will, according to his good pleasure which he hath purposed in himself:',
   'γνωρίσας ἡμῖν τὸ μυστήριον τοῦ θελήματος αὐτοῦ κατὰ τὴν εὐδοκίαν αὐτοῦ ἣν προέθετο ἐν αὐτῷ',
   'gnōrisas hēmin to mystērion tou thelēmatos autou kata tēn eudokian autou hēn proetheto en autō',
   '''Made known'' (gnōrisas — revealed, disclosed). ''Mystery'' (mystērion — a secret previously hidden but now revealed; not ''mysterious'' in the modern sense but a divine secret now unveiled). ''Purposed in himself'' (proetheto en autō — set forth beforehand, planned in his own counsel). The ''mystery'' is defined in v.10: the unification of all things in Christ. This was God''s plan from eternity, now revealed in the gospel.',
   NULL),
  (10, 'That in the dispensation of the fulness of times he might gather together in one all things in Christ, both which are in heaven, and which are on earth; even in him:',
   'εἰς οἰκονομίαν τοῦ πληρώματος τῶν καιρῶν ἀνακεφαλαιώσασθαι τὰ πάντα ἐν τῷ Χριστῷ τὰ τε ἐν τοῖς οὐρανοῖς καὶ τὰ ἐπὶ τῆς γῆς ἐν αὐτῷ',
   'eis oikonomian tou plērōmatos tōn kairōn anakephalaiōsasthai ta panta en tō Christō ta te en tois ouranois kai ta epi tēs gēs en autō',
   '''Dispensation'' (oikonomian — administration, stewardship, management of a household; God''s plan for managing history). ''Fulness of times'' (plērōmatos tōn kairōn — the completion of the ages, when all seasons reach their appointed end). ''Gather together in one'' (anakephalaiōsasthai — to sum up, to bring under one head, to recapitulate; from ana + kephalē, head). All things in heaven and on earth will be unified under Christ''s headship. This is the cosmic scope of God''s redemptive plan.',
   'The mystery revealed — cosmic unification in Christ: The ''mystery'' is God''s plan to unite all reality under the headship of Christ. Sin has fragmented creation; redemption restores unity. The verb anakephalaiōsasthai means ''to bring everything under one head'' — Christ. This is not universalism (all individuals saved) but cosmic reconciliation: the entire created order brought into harmony under Christ''s lordship. This theme drives the entire epistle.'),
  (11, 'In whom also we have obtained an inheritance, being predestinated according to the purpose of him who worketh all things after the counsel of his own will:',
   'ἐν ᾧ καὶ ἐκληρώθημεν προορισθέντες κατὰ πρόθεσιν τοῦ τὰ πάντα ἐνεργοῦντος κατὰ τὴν βουλὴν τοῦ θελήματος αὐτοῦ',
   'en hō kai eklērōthēmen proooristhentes kata prothesin tou ta panta energountos kata tēn boulēn tou thelēmatos autou',
   '''Obtained an inheritance'' (eklērōthēmen — were made an inheritance, were allotted; can mean both ''received a lot/inheritance'' and ''were made God''s own portion''). ''Purpose'' (prothesin — a setting forth, a plan determined beforehand). ''Worketh all things'' (ta panta energountos — the one who energises, activates, accomplishes all things). ''Counsel of his own will'' (boulēn tou thelēmatos — the deliberate purpose of his will). God''s sovereignty extends over ''all things'' — nothing falls outside his purposeful governance.',
   NULL),
  (12, 'That we should be to the praise of his glory, who first trusted in Christ.',
   'εἰς τὸ εἶναι ἡμᾶς εἰς ἔπαινον τῆς δόξης αὐτοῦ τοὺς προηλπικότας ἐν τῷ Χριστῷ',
   'eis to einai hēmas eis epainon tēs doxēs autou tous proēlpikotas en tō Christō',
   '''To the praise of his glory'' (eis epainon tēs doxēs autou — the refrain of the doxology, vv.6, 12, 14). ''Who first trusted'' (tous proēlpikotas — those who beforehand hoped, who set their hope first; the prefix pro- suggests Jewish believers who hoped in the Messiah before the Gentiles). The ultimate purpose of both Jewish and Gentile believers is the same: the praise of God''s glory.',
   NULL),
  (13, 'In whom ye also trusted, after that ye heard the word of truth, the gospel of your salvation: in whom also after that ye believed, ye were sealed with that holy Spirit of promise,',
   'ἐν ᾧ καὶ ὑμεῖς ἀκούσαντες τὸν λόγον τῆς ἀληθείας τὸ εὐαγγέλιον τῆς σωτηρίας ὑμῶν ἐν ᾧ καὶ πιστεύσαντες ἐσφραγίσθητε τῷ πνεύματι τῆς ἐπαγγελίας τῷ ἁγίῳ',
   'en hō kai hymeis akousantes ton logon tēs alētheias to euangelion tēs sōtērias hymōn en hō kai pisteusantes esphragisthēte tō pneumati tēs epangelias tō hagiō',
   '''Ye also'' (kai hymeis — you Gentiles too, now included). The order: heard → believed → sealed. ''Word of truth'' (ton logon tēs alētheias — the gospel message). ''Sealed'' (esphragisthēte — stamped with a seal; aorist passive: sealed at the moment of believing). ''Spirit of promise'' (pneumati tēs epangelias — the promised Holy Spirit; the Spirit himself is the seal). A seal in the ancient world indicated ownership, authenticity, and security. The Holy Spirit marks believers as God''s own.',
   'Sealing with the Holy Spirit: The ''seal'' (sphragis) served three functions in antiquity: (1) authentication — the document is genuine; (2) ownership — this belongs to the seal-holder; (3) security — the contents are protected. All three apply to the believer: the Spirit authenticates our faith, marks us as God''s possession, and secures us until the final redemption. The sealing happens at the moment of believing (the aorist participles akousantes, pisteusantes are coincident with esphragisthēte).'),
  (14, 'Which is the earnest of our inheritance until the redemption of the purchased possession, unto the praise of his glory.',
   'ὅς ἐστιν ἀρραβὼν τῆς κληρονομίας ἡμῶν εἰς ἀπολύτρωσιν τῆς περιποιήσεως εἰς ἔπαινον τῆς δόξης αὐτοῦ',
   'hos estin arrabōn tēs klēronomias hēmōn eis apolytrōsin tēs peripoiēseōs eis epainon tēs doxēs autou',
   '''Earnest'' (arrabōn — a down payment, a deposit, a guarantee; a commercial term for the first instalment that pledges the full amount will follow). ''Inheritance'' (klēronomias — the allotted portion, the full inheritance awaiting us). ''Redemption of the purchased possession'' (apolytrōsin tēs peripoiēseōs — the final liberation of that which God has acquired). ''Unto the praise of his glory'' — the third occurrence of this refrain (vv.6, 12, 14), concluding the Trinitarian doxology. The Spirit is God''s guarantee that the full inheritance is coming.',
   'The Spirit as earnest/deposit: The arrabōn was a legally binding down payment in Greek commerce. The Holy Spirit is not merely a promise of future blessing but the first instalment of the inheritance itself. What we experience of the Spirit now is a foretaste of the glory to come. This guarantees that God will complete the transaction — the full ''redemption of the purchased possession'' at Christ''s return.'),
  (15, 'Wherefore I also, after I heard of your faith in the Lord Jesus, and love unto all the saints,',
   'Διὰ τοῦτο κἀγὼ ἀκούσας τὴν καθ᾽ ὑμᾶς πίστιν ἐν τῷ κυρίῳ Ἰησοῦ καὶ τὴν ἀγάπην τὴν εἰς πάντας τοὺς ἁγίους',
   'Dia touto kagō akousas tēn kath'' hymas pistin en tō kyriō Iēsou kai tēn agapēn tēn eis pantas tous hagious',
   '''Wherefore'' (dia touto — because of this; the blessings of vv.3-14 prompt Paul''s prayer). ''Faith in the Lord Jesus, and love unto all the saints'' — the two evidences of genuine Christianity: vertical faith and horizontal love. Paul''s prayer is motivated by their demonstrated faith and love. Some manuscripts omit ''love,'' but the parallel in Col 1:4 confirms it.',
   NULL),
  (16, 'Cease not to give thanks for you, making mention of you in my prayers;',
   'οὐ παύομαι εὐχαριστῶν ὑπὲρ ὑμῶν μνείαν ὑμῶν ποιούμενος ἐπὶ τῶν προσευχῶν μου',
   'ou pauomai eucharistōn hyper hymōn mneian hymōn poioumenos epi tōn proseuchōn mou',
   '''Cease not'' (ou pauomai — I do not stop; present tense: continuous, unceasing thanks). ''Making mention'' (mneian poioumenos — making remembrance). Paul''s prayer life is characterised by persistent thanksgiving and intercession. His gratitude for the Ephesians is not occasional but habitual.',
   NULL),
  (17, 'That the God of our Lord Jesus Christ, the Father of glory, may give unto you the spirit of wisdom and revelation in the knowledge of him:',
   'ἵνα ὁ θεὸς τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ὁ πατὴρ τῆς δόξης δῴη ὑμῖν πνεῦμα σοφίας καὶ ἀποκαλύψεως ἐν ἐπιγνώσει αὐτοῦ',
   'hina ho theos tou kyriou hēmōn Iēsou Christou ho patēr tēs doxēs dōē hymin pneuma sophias kai apokalypseōs en epignōsei autou',
   '''Father of glory'' (patēr tēs doxēs — the Father to whom all glory belongs). ''Spirit of wisdom and revelation'' (pneuma sophias kai apokalypseōs — either the Holy Spirit working wisdom and revelation, or a human spirit enlightened by wisdom and revelation). ''Knowledge'' (epignōsei — full knowledge, deep personal knowledge; epi- intensifies gnōsis). Paul''s first prayer request is not for circumstances to change but for understanding to deepen — that they would truly know God.',
   NULL),
  (18, 'The eyes of your understanding being enlightened; that ye may know what is the hope of his calling, and what the riches of the glory of his inheritance in the saints,',
   'πεφωτισμένους τοὺς ὀφθαλμοὺς τῆς καρδίας ὑμῶν εἰς τὸ εἰδέναι ὑμᾶς τίς ἐστιν ἡ ἐλπὶς τῆς κλήσεως αὐτοῦ καὶ τίς ὁ πλοῦτος τῆς δόξης τῆς κληρονομίας αὐτοῦ ἐν τοῖς ἁγίοις',
   'pephōtismenous tous ophthalmous tēs kardias hymōn eis to eidenai hymas tis estin hē elpis tēs klēseōs autou kai tis ho ploutos tēs doxēs tēs klēronomias autou en tois hagiois',
   '''Eyes of your understanding'' (ophthalmous tēs kardias — literally ''eyes of your heart''; the heart as the centre of understanding). ''Enlightened'' (pephōtismenous — illuminated, flooded with light; perfect participle: a state of ongoing illumination). Three things Paul wants them to know: (1) ''the hope of his calling'' — the future certainty of what God has called them to; (2) ''the riches of the glory of his inheritance in the saints'' — the staggering value God places on his people; (3) the power available to them (v.19).',
   NULL),
  (19, 'And what is the exceeding greatness of his power to us-ward who believe, according to the working of his mighty power,',
   'καὶ τί τὸ ὑπερβάλλον μέγεθος τῆς δυνάμεως αὐτοῦ εἰς ἡμᾶς τοὺς πιστεύοντας κατὰ τὴν ἐνέργειαν τοῦ κράτους τῆς ἰσχύος αὐτοῦ',
   'kai ti to hyperballon megethos tēs dynameōs autou eis hēmas tous pisteuontas kata tēn energeian tou kratous tēs ischyos autou',
   '''Exceeding greatness'' (hyperballon megethos — surpassing, transcendent magnitude). Paul piles up four power words: dynamis (inherent ability), energeia (operative energy), kratos (dominion, manifested strength), ischus (might, raw force). This avalanche of synonyms is meant to overwhelm: the power available to believers is immeasurable. And this power is directed ''to us-ward who believe'' (eis hēmas tous pisteuontas).',
   NULL),
  (20, 'Which he wrought in Christ, when he raised him from the dead, and set him at his own right hand in the heavenly places,',
   'ἣν ἐνήργησεν ἐν τῷ Χριστῷ ἐγείρας αὐτὸν ἐκ νεκρῶν καὶ ἐκάθισεν ἐν δεξιᾷ αὐτοῦ ἐν τοῖς ἐπουρανίοις',
   'hēn enērgēsen en tō Christō egeiras auton ek nekrōn kai ekathisen en dexia autou en tois epouraniois',
   '''Wrought'' (enērgēsen — energised, activated, put into operation). The resurrection is the supreme demonstration of God''s power — and this same power is available to believers (v.19). ''Set him at his own right hand'' (ekathisen en dexia autou — seated him at his right hand; the place of supreme honour and authority). ''In the heavenly places'' (en tois epouraniois) — where believers are also seated (2:6).',
   NULL),
  (21, 'Far above all principality, and power, and might, and dominion, and every name that is named, not only in this world, but also in that which is to come:',
   'ὑπεράνω πάσης ἀρχῆς καὶ ἐξουσίας καὶ δυνάμεως καὶ κυριότητος καὶ παντὸς ὀνόματος ὀνομαζομένου οὐ μόνον ἐν τῷ αἰῶνι τούτῳ ἀλλὰ καὶ ἐν τῷ μέλλοντι',
   'hyperanō pasēs archēs kai exousias kai dynameōs kai kyriotētos kai pantos onomatos onomazomenou ou monon en tō aiōni toutō alla kai en tō mellonti',
   '''Far above'' (hyperanō — high above, transcendently above). Four categories of spiritual authority: archē (principality, rule), exousia (authority, delegated power), dynamis (might, power), kyriotēs (dominion, lordship). Christ''s exaltation surpasses every conceivable authority — angelic, demonic, human, cosmic — ''not only in this world, but also in that which is to come.'' His supremacy is both present and eternal.',
   NULL),
  (22, 'And hath put all things under his feet, and gave him to be the head over all things to the church,',
   'καὶ πάντα ὑπέταξεν ὑπὸ τοὺς πόδας αὐτοῦ καὶ αὐτὸν ἔδωκεν κεφαλὴν ὑπὲρ πάντα τῇ ἐκκλησίᾳ',
   'kai panta hypetaxen hypo tous podas autou kai auton edōken kephalēn hyper panta tē ekklēsia',
   '''Put all things under his feet'' (panta hypetaxen hypo tous podas — an allusion to Psalm 8:6; universal subjection to Christ). ''Head over all things to the church'' (kephalēn hyper panta tē ekklēsia — Christ is head over everything, and this headship is given ''to the church'' — for the church''s benefit). Christ''s cosmic authority is exercised in connection with his body, the church. He is not a distant sovereign but the head organically connected to his people.',
   NULL),
  (23, 'Which is his body, the fulness of him that filleth all in all.',
   'ἥτις ἐστὶν τὸ σῶμα αὐτοῦ τὸ πλήρωμα τοῦ τὰ πάντα ἐν πᾶσιν πληρουμένου',
   'hētis estin to sōma autou to plērōma tou ta panta en pasin plēroumenou',
   '''His body'' (to sōma autou — the church is Christ''s body; the metaphor dominant in Ephesians). ''Fulness'' (plērōma — that which fills, completion, full content). ''Him that filleth all in all'' (tou ta panta en pasin plēroumenou — the one who fills all things in every way). The church is the ''fulness'' of Christ — the vessel through which Christ expresses his fullness in the world. Christ fills all things, and the church is his instrument for doing so.',
   'The church as Christ''s body and fulness: The church is not merely an organisation or gathering but Christ''s body — his physical presence in the world. The staggering claim is that the church is Christ''s ''fulness'' (plērōma): Christ, who fills all things, has chosen to express his completeness through the church. This gives the church both dignity (it is Christ''s own body) and responsibility (it must embody his fullness in the world).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 3 (Blessed with all spiritual blessings)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εὐλογητός', 'eulogētos', 'G2128', 'Blessed, worthy of praise — from eu (well) + logos (word); to speak well of, to praise. When used of God (as here), it means ''worthy of blessing/praise.'' When God blesses us, he confers benefit; when we bless God, we offer praise. The same root appears three times in this verse: eulogētos, eulogēsas, eulogia — a cascade of blessing.', 1),
  ('ἐπουρανίοις', 'epouraniois', 'G2032', 'Heavenly places, the heavenlies — from epi (upon) + ouranos (heaven). A distinctive Ephesians term (1:3, 20; 2:6; 3:10; 6:12) for the spiritual realm where Christ is enthroned, where believers are seated, and where spiritual warfare occurs. Not a physical location but a dimension of spiritual reality.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 4 (Chosen before the foundation of the world)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐξελέξατο', 'exelexato', 'G1586', 'Chose, selected for oneself — aorist middle of eklegomai; God actively chose for his own purpose. The middle voice emphasises that God chose for himself, out of his own initiative and for his own purpose. The timing is ''before the foundation of the world'' — this is not an afterthought but God''s eternal plan.', 1),
  ('ἀμώμους', 'amōmous', 'G299', 'Without blame, without blemish — a sacrificial term used of animals without defect (cf. 1 Pet 1:19). Applied to believers: God''s purpose in election is to present us faultless, without spot or wrinkle (Eph 5:27). The goal of being chosen is ethical perfection — holiness.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 4;

-- Verse 5 (Predestinated unto adoption)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προορίσας', 'proorisas', 'G4309', 'Having predestinated, having marked out beforehand — from pro (before) + horizō (to set a boundary, to determine). God established the boundary/destination in advance. The destination is not condemnation but adoption — the full rights of sonship.', 1),
  ('υἱοθεσίαν', 'huiothesian', 'G5206', 'Adoption as sons — from huios (son) + thesis (a placing). A Roman legal term: the formal act of placing someone as a son with full inheritance rights. In Roman law, adoption was irrevocable and gave the adopted child the same status as a natural-born heir. Believers are not merely servants but adopted sons with full rights.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 7 (Redemption through his blood)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀπολύτρωσιν', 'apolytrōsin', 'G629', 'Redemption, release by ransom — from apo (from) + lytron (a ransom price). The full price paid for complete liberation. In the ancient world, this was the price paid to free a slave or prisoner of war. Christ''s blood is the ransom that purchases freedom from sin and death.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 10 (Gather together in one)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνακεφαλαιώσασθαι', 'anakephalaiōsasthai', 'G346', 'To sum up, to gather under one head, to recapitulate — from ana (up, again) + kephalē (head). To bring all things back under one head. Sin fragmented creation; Christ''s redemption reunites everything under his headship. This is the ''mystery'' of God''s will: cosmic unification in Christ.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Verse 13 (Sealed with the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐσφραγίσθητε', 'esphragisthēte', 'G4972', 'You were sealed — aorist passive of sphragizō (to stamp with a seal). In antiquity, a seal indicated ownership (this belongs to the seal-holder), authenticity (this is genuine), and security (the contents are protected). The Holy Spirit himself is the seal — God''s mark of ownership on every believer.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 13;

-- Verse 14 (Earnest of our inheritance)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀρραβών', 'arrabōn', 'G728', 'Earnest, down payment, deposit, pledge — a Semitic loanword used in Greek commerce for the first instalment that legally binds the buyer to complete the full payment. The Holy Spirit is the first instalment of the heavenly inheritance — a taste of glory that guarantees the full inheritance is coming. Used only three times in the NT: here, 2 Cor 1:22, and 2 Cor 5:5.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 14;

-- Verse 19 (Exceeding greatness of his power)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερβάλλον', 'hyperballon', 'G5235', 'Surpassing, exceeding, transcendent — from hyper (beyond) + ballō (to throw). Power that ''throws beyond'' all measurement. Paul uses hyper- compounds frequently in Ephesians to express the immeasurable nature of God''s work (1:19; 2:7; 3:19, 20).', 1),
  ('ἐνέργειαν', 'energeian', 'G1753', 'Working, operative energy, effectual power — from en (in) + ergon (work). Power in action, not merely latent ability. This is the source of the English word ''energy.'' The same divine energy that raised Christ from the dead is operative in believers.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 19;

-- Verse 23 (Body and fulness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πλήρωμα', 'plērōma', 'G4138', 'Fulness, that which fills, completion — from plēroō (to fill). The church is the plērōma of Christ: the vessel through which Christ''s fullness is expressed and embodied in the world. A staggering claim — the infinite Christ has chosen to manifest his completeness through his finite body, the church.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v3: Blessed with all spiritual blessings
  (3, '2 Corinthians 1:3', 1), (3, '1 Peter 1:3', 2),
  -- v4: Chosen before the foundation of the world
  (4, 'John 15:16', 1), (4, '1 Peter 1:2', 2), (4, 'Romans 8:29', 3),
  -- v5: Predestinated unto adoption
  (5, 'Romans 8:15', 1), (5, 'Romans 8:29-30', 2), (5, 'Galatians 4:5', 3),
  -- v7: Redemption through his blood
  (7, 'Colossians 1:14', 1), (7, '1 Peter 1:18-19', 2), (7, 'Hebrews 9:12', 3),
  -- v10: Gather together in one
  (10, 'Colossians 1:16-20', 1), (10, 'Philippians 2:9-11', 2),
  -- v11: Obtained an inheritance
  (11, 'Romans 8:17', 1), (11, '1 Peter 1:4', 2),
  -- v13: Sealed with the Spirit
  (13, '2 Corinthians 1:22', 1), (13, 'Ephesians 4:30', 2), (13, 'Romans 8:16', 3),
  -- v14: Earnest of our inheritance
  (14, '2 Corinthians 5:5', 1), (14, 'Romans 8:23', 2),
  -- v17: Spirit of wisdom and revelation
  (17, 'Colossians 1:9-10', 1), (17, 'James 1:5', 2),
  -- v19: Exceeding greatness of power
  (19, 'Ephesians 3:20', 1), (19, 'Colossians 2:12', 2),
  -- v20: Raised and seated at right hand
  (20, 'Psalm 110:1', 1), (20, 'Acts 2:33', 2), (20, 'Hebrews 1:3', 3),
  -- v22: All things under his feet
  (22, 'Psalm 8:6', 1), (22, '1 Corinthians 15:27', 2), (22, 'Colossians 1:18', 3),
  -- v23: Body and fulness
  (23, 'Colossians 1:18-19', 1), (23, 'Colossians 2:9-10', 2), (23, '1 Corinthians 12:27', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Ephesians Chapter 1 Complete
-- 23 verses · 9 key verses with word studies (14 words)
-- Cross-references for 13 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
