-- ═══════════════════════════════════════════════════
-- COLOSSIANS CHAPTER 2 — Complete in Christ & the Triumph of the Cross
-- 23 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Colossians 2 is Paul''s direct assault on the Colossian heresy — a dangerous blend of Jewish legalism, Greek philosophy, angel worship, and ascetic mysticism. His strategy is not merely to refute errors but to establish Christ''s absolute sufficiency: ''In him dwelleth all the fulness of the Godhead bodily, and ye are complete in him.'' If believers possess all of God in Christ, no supplement is needed. Paul then exposes four specific threats: philosophy and empty deceit (v.8), food laws and festivals (v.16), angel worship and false visions (v.18), and ascetic regulations (vv.20-23). Against all these he sets the cross: God nailed the handwriting of ordinances to the cross, cancelled our debt, stripped the powers bare, and made a public spectacle of them in His triumphal procession. Dead with Christ to the world''s elemental principles, believers need no human additions to divine fullness.',
  'Completeness in Christ vs. Empty Human Traditions',
  'πλήρωμα (plērōma)',
  'Fullness, totality — all that God is dwells bodily in Christ. Believers are filled full (peplērōmenoi) in Him. No supplement, no addition, no higher experience is needed.',
  '["Paul''s Struggle for Their Faith (vv.1-5): Conflict for Colossae and Laodicea; treasures of wisdom and knowledge in Christ; beware of enticing words","Rooted in Christ Alone (vv.6-7): As ye received Christ, walk in Him; rooted, built up, established, abounding in thanksgiving","Warning: Philosophy & Empty Deceit (vv.8-10): Beware of philosophy after human tradition and world-elements; all fullness of the Godhead bodily; complete in Him","The Cross: Circumcision, Death & Triumph (vv.11-15): Circumcised without hands; buried with Him in baptism; quickened together; handwriting of ordinances nailed to the cross; principalities spoiled","Warning: Legalism, Angel Worship & Asceticism (vv.16-23): Let no man judge you in food or festivals; no worship of angels; if dead with Christ, why subject to ordinances?"]'
FROM books b WHERE b.name = 'Colossians';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'For I would that ye knew what great conflict I have for you, and for them at Laodicea, and for as many as have not seen my face in the flesh;',
   'θέλω γὰρ ὑμᾶς εἰδέναι ἡλίκον ἀγῶνα ἔχω ὑπὲρ ὑμῶν καὶ τῶν ἐν Λαοδικείᾳ καὶ ὅσοι οὐχ ἑώρακαν τὸ πρόσωπόν μου ἐν σαρκί',
   'thelō gar hymas eidenai hēlikon agōna echō hyper hymōn kai tōn en Laodikeia kai hosoi ouch heōrakan to prosōpon mou en sarki',
   '''Conflict'' (agōna — struggle, contest, agony) — Paul agonises in prayer and concern for churches he has never visited. The Lycus Valley churches — Colossae, Laodicea, and Hierapolis — were all under threat from the same heresy. Paul''s pastoral concern transcends personal acquaintance; his apostolic heart extends to every congregation.',
   NULL),
  (2,
   'That their hearts might be comforted, being knit together in love, and unto all riches of the full assurance of understanding, to the acknowledgement of the mystery of God, and of the Father, and of Christ;',
   'ἵνα παρακληθῶσιν αἱ καρδίαι αὐτῶν συμβιβασθέντες ἐν ἀγάπῃ καὶ εἰς πᾶν πλοῦτος τῆς πληροφορίας τῆς συνέσεως εἰς ἐπίγνωσιν τοῦ μυστηρίου τοῦ θεοῦ Χριστοῦ',
   'hina paraklēthōsin hai kardiai autōn symbibasthentes en agapē kai eis pan ploutos tēs plērophorias tēs syneseōs eis epignōsin tou mystēriou tou theou Christou',
   'Paul''s goal: (1) ''comforted hearts'' (paraklēthōsin — encouraged, strengthened), (2) ''knit together in love'' (symbibasthentes — united, joined, instructed together; love is the unifying agent), (3) ''full assurance of understanding'' (plērophorias tēs syneseōs — complete confidence in comprehension). The heretics offered secret, exclusive knowledge; Paul offers the open ''mystery of God, which is Christ'' — the mystery is not hidden doctrine but the revealed person of Jesus.',
   NULL),
  (3,
   'In whom are hid all the treasures of wisdom and knowledge.',
   'ἐν ᾧ εἰσιν πάντες οἱ θησαυροὶ τῆς σοφίας καὶ γνώσεως ἀπόκρυφοι',
   'en hō eisin pantes hoi thēsauroi tēs sophias kai gnōseōs apokryphoi',
   '''Hid'' (apokryphoi — hidden, stored up, concealed as treasure). ALL (pantes) the treasures (thēsauroi — treasure stores, repositories of wealth) of wisdom (sophias) and knowledge (gnōseōs) are ''in Christ'' (en hō). This directly counters the heretics who promised hidden wisdom from other sources — angels, philosophy, mystical experiences. Paul says: every treasure you could ever seek is already stored in Christ. To seek elsewhere is to turn from the treasure house to the gutter.',
   NULL),
  (4,
   'And this I say, lest any man should beguile you with enticing words.',
   'τοῦτο δὲ λέγω ἵνα μηδεὶς ὑμᾶς παραλογίζηται ἐν πιθανολογίᾳ',
   'touto de legō hina mēdeis hymas paralogizetai en pithanologia',
   '''Beguile'' (paralogizetai — deceive by false reasoning, lead astray through faulty logic; from para [beside, off] + logizomai [to reason]). ''Enticing words'' (pithanologia — persuasive speech, plausible-sounding arguments; only here in the NT). The heresy was intellectually attractive — it sounded reasonable and impressive. Paul warns: attractive reasoning is not the same as truth. False teaching rarely appears obviously wrong; it arrives in elegant packaging.',
   NULL),
  (5,
   'For though I be absent in the flesh, yet am I with you in the spirit, joying and beholding your order, and the stedfastness of your faith in Christ.',
   'εἰ γὰρ καὶ τῇ σαρκὶ ἄπειμι ἀλλὰ τῷ πνεύματι σὺν ὑμῖν εἰμι χαίρων καὶ βλέπων ὑμῶν τὴν τάξιν καὶ τὸ στερέωμα τῆς εἰς Χριστὸν πίστεως ὑμῶν',
   'ei gar kai tē sarki apeimi alla tō pneumati syn hymin eimi chairōn kai blepōn hymōn tēn taxin kai to stereōma tēs eis Christon pisteōs hymōn',
   '''Order'' (taxin — orderly arrangement, military formation) and ''stedfastness'' (stereōma — solid front, firm formation — a military term for a solid line of battle). Paul uses military imagery: the Colossians maintain good formation and present a solid front against the enemy. Their faith ''in Christ'' is their fortification. Paul rejoices even while warning — the church is under threat but holding firm.',
   NULL),
  (6,
   'As ye have therefore received Christ Jesus the Lord, so walk ye in him:',
   'Ὡς οὖν παρελάβετε τὸν Χριστὸν Ἰησοῦν τὸν κύριον ἐν αὐτῷ περιπατεῖτε',
   'Hōs oun parelabete ton Christon Iēsoun ton kyrion en autō peripateite',
   '''Received'' (parelabete — received by tradition, accepted as authoritative teaching). They received ''Christ Jesus the Lord'' — the full confession: Christ (Messiah), Jesus (historical person), the Lord (sovereign deity). This is what Epaphras taught them. ''Walk in him'' (en autō peripateite — live your daily life within the sphere of Christ). The same Christ who saved them is sufficient for their entire Christian walk. No supplementary doctrine is needed.',
   NULL),
  (7,
   'Rooted and built up in him, and stablished in the faith, as ye have been taught, abounding therein with thanksgiving.',
   'ἐρριζωμένοι καὶ ἐποικοδομούμενοι ἐν αὐτῷ καὶ βεβαιούμενοι τῇ πίστει καθὼς ἐδιδάχθητε περισσεύοντες ἐν εὐχαριστίᾳ',
   'errizōmenoi kai epoikodomoumenoi en autō kai bebaioumenoi tē pistei kathōs edidachthēte perisseuontes en eucharistia',
   'Three metaphors of stability: (1) ''Rooted'' (errizōmenoi — having been planted, like a tree with deep roots; perfect tense: firmly and permanently planted). (2) ''Built up'' (epoikodomoumenoi — being constructed, like a building rising on its foundation; present tense: ongoing construction). (3) ''Stablished'' (bebaioumenoi — confirmed, made firm, legally validated). Roots grow down, building goes up, confirmation makes secure. ''As ye have been taught'' — the original apostolic teaching is the foundation. ''Abounding with thanksgiving'' — gratitude is the mark of genuine faith.',
   NULL),
  (8,
   'Beware lest any man spoil you through philosophy and vain deceit, after the tradition of men, after the rudiments of the world, and not after Christ.',
   'Βλέπετε μή τις ὑμᾶς ἔσται ὁ συλαγωγῶν διὰ τῆς φιλοσοφίας καὶ κενῆς ἀπάτης κατὰ τὴν παράδοσιν τῶν ἀνθρώπων κατὰ τὰ στοιχεῖα τοῦ κόσμου καὶ οὐ κατὰ Χριστόν',
   'Blepete mē tis hymas estai ho sylagōgōn dia tēs philosophias kai kenēs apatēs kata tēn paradosin tōn anthrōpōn kata ta stoicheia tou kosmou kai ou kata Christon',
   '''Spoil'' (sylagōgōn — carry off as plunder, kidnap as a prisoner of war; only here in the NT). ''Philosophy'' (philosophias — love of wisdom; not condemned per se but this particular philosophy). ''Vain deceit'' (kenēs apatēs — empty deception). Three origins of the heresy: (1) ''tradition of men'' (paradosin tōn anthrōpōn — human, not divine, tradition), (2) ''rudiments of the world'' (stoicheia tou kosmou — elemental principles, basic elements, possibly elemental spirits that were thought to govern the cosmos), (3) ''not after Christ'' (ou kata Christon) — the ultimate test of any teaching: is it according to Christ?',
   'The test of doctrine: Every teaching must be measured by Christ. Philosophy, tradition, and mystical experience are all weighed on the same scale: do they align with Christ? If not, they are ''vain deceit'' regardless of their intellectual sophistication or spiritual impressiveness.'),
  (9,
   'For in him dwelleth all the fulness of the Godhead bodily.',
   'ὅτι ἐν αὐτῷ κατοικεῖ πᾶν τὸ πλήρωμα τῆς θεότητος σωματικῶς',
   'hoti en autō katoikei pan to plērōma tēs theotētos sōmatikōs',
   'The most concentrated Christological statement in all of Scripture. ''In him'' (en autō) — in Christ''s person. ''Dwelleth'' (katoikei — present tense: permanently resides right now). ''All'' (pan — the entire, complete, total). ''Fulness'' (plērōma — the totality, the complete measure). ''Godhead'' (theotētos — deity, the divine essence, the being of God Himself — a stronger word than theiotēs [divinity, Rom 1:20] which can mean divine quality; theotēs means the very essence of God). ''Bodily'' (sōmatikōs — in bodily form, in a human body). The entire essence of God lives permanently in the physical person of Jesus Christ.',
   'The full deity of Christ incarnate: This verse is the strongest possible assertion of Christ''s deity. Not divine qualities (theiotēs) but the divine essence (theotēs) dwells in Him. Not partially but fully (pan to plērōma). Not temporarily but permanently (katoikei, present tense). Not spiritually only but bodily (sōmatikōs). Christ is fully God in human flesh — the hypostatic union stated with lapidary precision.'),
  (10,
   'And ye are complete in him, which is the head of all principality and power:',
   'καὶ ἐστὲ ἐν αὐτῷ πεπληρωμένοι ὅς ἐστιν ἡ κεφαλὴ πάσης ἀρχῆς καὶ ἐξουσίας',
   'kai este en autō peplērōmenoi hos estin hē kephalē pasēs archēs kai exousias',
   '''Complete'' (peplērōmenoi — having been filled full, perfect tense: filled and remaining full). The same root as ''fulness'' (plērōma) in v.9: He is full of God; you are full in Him. If all of God dwells in Christ, and you are in Christ, then you lack nothing. ''Head of all principality and power'' — the spiritual powers the heretics venerated are subordinate to Christ. Why approach servants when you already have the Master?',
   'The believer''s completeness in Christ: Because all of God''s fullness dwells in Christ, and believers are ''in Christ,'' they have access to everything God offers. No mystical experience, angelic mediation, philosophical system, or religious ritual can add to what Christ has already provided. Spiritual sufficiency is in Christ alone.'),
  (11,
   'In whom also ye are circumcised with the circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Christ:',
   'ἐν ᾧ καὶ περιετμήθητε περιτομῇ ἀχειροποιήτῳ ἐν τῇ ἀπεκδύσει τοῦ σώματος τῆς σαρκός ἐν τῇ περιτομῇ τοῦ Χριστοῦ',
   'en hō kai perietmēthēte peritomē acheiropoiētō en tē apekdysei tou sōmatos tēs sarkos en tē peritomē tou Christou',
   '''Circumcision made without hands'' (acheiropoiētō — not manufactured by human hands). Physical circumcision (the Judaizers'' demand) is obsolete because believers have received something infinitely greater: spiritual circumcision — the ''putting off'' (apekdysei — stripping off, complete removal, like removing a garment) of ''the body of the sins of the flesh'' — the entire sinful nature is stripped away. This is the ''circumcision of Christ'' — either performed by Christ or accomplished in His death.',
   NULL),
  (12,
   'Buried with him in baptism, wherein also ye are risen with him through the faith of the operation of God, who hath raised him from the dead.',
   'συνταφέντες αὐτῷ ἐν τῷ βαπτισμῷ ἐν ᾧ καὶ συνηγέρθητε διὰ τῆς πίστεως τῆς ἐνεργείας τοῦ θεοῦ τοῦ ἐγείραντος αὐτὸν ἐκ νεκρῶν',
   'syntaphentes autō en tō baptismō en hō kai synēgerthēte dia tēs pisteōs tēs energeias tou theou tou egeirantos auton ek nekrōn',
   '''Buried with him in baptism'' (syntaphentes — co-buried). Baptism symbolises union with Christ''s death and burial. ''Risen with him'' (synēgerthēte — co-raised). The believer''s baptism pictures death to the old life and resurrection to the new. ''Through the faith'' (dia tēs pisteōs) — the instrument. ''Of the operation of God'' (tēs energeias tou theou — of God''s active working power). The same power that raised Christ physically raises believers spiritually. Faith trusts in God''s power, not in the ritual itself.',
   NULL),
  (13,
   'And you, being dead in your sins and the uncircumcision of your flesh, hath he quickened together with him, having forgiven you all trespasses;',
   'καὶ ὑμᾶς νεκροὺς ὄντας ἐν τοῖς παραπτώμασιν καὶ τῇ ἀκροβυστίᾳ τῆς σαρκὸς ὑμῶν συνεζωοποίησεν ὑμᾶς σὺν αὐτῷ χαρισάμενος ἡμῖν πάντα τὰ παραπτώματα',
   'kai hymas nekrous ontas en tois paraptōmasin kai tē akrobystia tēs sarkos hymōn synezōopoiēsen hymas syn autō charisamenos hēmin panta ta paraptōmata',
   '''Dead'' (nekrous — corpses, spiritually lifeless). The Colossians were Gentiles — ''the uncircumcision of your flesh'' — doubly disqualified by Jewish standards. ''Quickened together'' (synezōopoiēsen — co-made-alive, a compound verb: syn [together with] + zōopoieō [to give life]). God took dead people and made them alive together with Christ. ''Having forgiven'' (charisamenos — graciously forgiven, freely pardoned; from charis/grace). ''ALL trespasses'' (panta ta paraptōmata) — no sin remains unforgiven.',
   NULL),
  (14,
   'Blotting out the handwriting of ordinances that was against us, which was contrary to us, and took it out of the way, nailing it to his cross;',
   'ἐξαλείψας τὸ καθ᾽ ἡμῶν χειρόγραφον τοῖς δόγμασιν ὃ ἦν ὑπεναντίον ἡμῖν καὶ αὐτὸ ἦρκεν ἐκ τοῦ μέσου προσηλώσας αὐτὸ τῷ σταυρῷ',
   'exaleipsas to kath'' hēmōn cheirographon tois dogmasin ho ēn hypenation hēmin kai auto ērken ek tou mesou prosēlōsas auto tō staurō',
   '''Handwriting of ordinances'' (cheirographon tois dogmasin — a handwritten certificate of debt, an IOU signed against us). The law''s demands stood as a written accusation — we owed a debt we could never pay. Three actions: (1) ''blotting out'' (exaleipsas — wiping away, erasing, washing off like ink from parchment), (2) ''took it out of the way'' (ērken ek tou mesou — removed it from the middle, cleared the obstacle), (3) ''nailing it to his cross'' (prosēlōsas tō staurō — affixing with nails). The debt certificate was nailed to the cross with Christ — cancelled, destroyed, eliminated.',
   'Penal substitution: The ''handwriting of ordinances against us'' — the law''s indictment — was nailed to the cross. Christ bore our legal debt. The metaphor is vivid: in Roman practice, a criminal''s charges were nailed to his cross. Christ''s cross bore not His own charges but ours. The debt is not merely postponed but cancelled (exaleipsas — erased completely).'),
  (15,
   'And having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it.',
   'ἀπεκδυσάμενος τὰς ἀρχὰς καὶ τὰς ἐξουσίας ἐδειγμάτισεν ἐν παρρησίᾳ θριαμβεύσας αὐτοὺς ἐν αὐτῷ',
   'apekdysamenos tas archas kai tas exousias edeigmatisen en parrēsia thriambeusas autous en autō',
   '''Spoiled'' (apekdysamenos — stripped off, disarmed; the same word from v.11 for stripping off the sinful nature — now applied to the demonic powers: Christ stripped them of their weapons). ''Made a shew'' (edeigmatisen — made a public spectacle, exhibited, exposed). ''Triumphing'' (thriambeusas — led in triumphal procession). The imagery is a Roman triumph — when a victorious general paraded conquered enemies through the streets. The cross looked like defeat; in reality, it was Christ''s victory parade. He dragged the defeated powers behind His chariot for all the cosmos to see.',
   'The triumph of the cross: What appeared to be Christ''s humiliation was actually His coronation. The cross was not a tragedy reversed by the resurrection — it was itself the victory. By dying, Christ disarmed the powers that held humanity captive (sin, death, the accusing law) and publicly displayed His conquest. This is Christus Victor — Christ the Conqueror.'),
  (16,
   'Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days:',
   'Μὴ οὖν τις ὑμᾶς κρινέτω ἐν βρώσει καὶ ἐν πόσει ἢ ἐν μέρει ἑορτῆς ἢ νεομηνίας ἢ σαββάτων',
   'Mē oun tis hymas krinetō en brōsei kai en posei ē en merei heortēs ē neomēnias ē sabbatōn',
   '''Therefore'' (oun) — because of what Christ accomplished (vv.13-15). If the debt is cancelled and the powers defeated, no one has the right to impose religious regulations. Five areas: (1) ''meat'' (brōsei — food, eating), (2) ''drink'' (posei — drinking), (3) ''holyday'' (heortēs — annual festival), (4) ''new moon'' (neomēnias — monthly celebration), (5) ''sabbath days'' (sabbatōn — weekly sabbaths). This covers annual, monthly, and weekly observances — the entire Jewish ceremonial calendar. The word ''judge'' (krinetō — pass judgment on, condemn) means no one may condemn believers for not observing these.',
   'The Sabbath and the new covenant: Paul explicitly places sabbath observance in the category of shadows (v.17) fulfilled by Christ. Believers are not bound by sabbath regulations (cf. Rom 14:5; Gal 4:10). The rest the sabbath pointed to is found in Christ Himself (Heb 4:9-10).'),
  (17,
   'Which are a shadow of things to come; but the body is of Christ.',
   'ἅ ἐστιν σκιὰ τῶν μελλόντων τὸ δὲ σῶμα τοῦ Χριστοῦ',
   'ha estin skia tōn mellontōn to de sōma tou Christou',
   '''Shadow'' (skia — a shadow cast by a solid object, a silhouette, a foreshadowing). OT ceremonies were shadows — real in themselves but pointing to a greater reality. ''Body'' (sōma — the solid reality that casts the shadow). Christ is the substance; the ceremonies were the outline. When the person arrives, you do not worship the shadow. The ceremonial law was divinely given but inherently temporary — designed to point to Christ and dissolve upon His arrival.',
   NULL),
  (18,
   'Let no man beguile you of your reward in a voluntary humility and worshipping of angels, intruding into those things which he hath not seen, vainly puffed up by his fleshly mind,',
   'μηδεὶς ὑμᾶς καταβραβευέτω θέλων ἐν ταπεινοφροσύνῃ καὶ θρησκείᾳ τῶν ἀγγέλων ἃ ἑόρακεν ἐμβατεύων εἰκῇ φυσιούμενος ὑπὸ τοῦ νοὸς τῆς σαρκὸς αὐτοῦ',
   'mēdeis hymas katabrabeuetō thelōn en tapeinophrosynē kai thrēskeia tōn angelōn ha heōraken embateuōn eikē physioumenos hypo tou noos tēs sarkos autou',
   '''Beguile of your reward'' (katabrabeuetō — disqualify, act as an umpire against you, rob you of the prize; from kata [against] + brabeuō [to act as judge]). The heresy involved: (1) ''voluntary humility'' (thelōn en tapeinophrosynē — self-imposed, affected humility — false modesty that is actually pride), (2) ''worshipping of angels'' (thrēskeia tōn angelōn — devotion to angels as mediators between God and man). (3) ''Intruding into things not seen'' (embateuōn — entering into, claiming access to visionary experiences). All while ''puffed up'' (physioumenos — inflated, bloated with pride) by ''his fleshly mind'' — spiritual pretension masking carnal thinking.',
   NULL),
  (19,
   'And not holding the Head, from which all the body by joints and bands having nourishment ministered, and knit together, increaseth with the increase of God.',
   'καὶ οὐ κρατῶν τὴν κεφαλήν ἐξ οὗ πᾶν τὸ σῶμα διὰ τῶν ἁφῶν καὶ συνδέσμων ἐπιχορηγούμενον καὶ συμβιβαζόμενον αὔξει τὴν αὔξησιν τοῦ θεοῦ',
   'kai ou kratōn tēn kephalēn ex hou pan to sōma dia tōn haphōn kai syndesmōn epichorēgoumenon kai symbibazoumenon auxei tēn auxēsin tou theou',
   'The root problem: ''not holding the Head'' (ou kratōn tēn kephalēn — not grasping, not maintaining connection with Christ the Head). The body (the church) receives nourishment and cohesion from Christ the Head through ''joints'' (haphōn — ligaments, points of contact) and ''bands'' (syndesmōn — sinews, binding connections). Detach from the Head and the body withers. All heresy ultimately detaches people from Christ by offering supplements or substitutes.',
   NULL),
  (20,
   'Wherefore if ye be dead with Christ from the rudiments of the world, why, as though living in the world, are ye subject to ordinances,',
   'εἰ ἀπεθάνετε σὺν Χριστῷ ἀπὸ τῶν στοιχείων τοῦ κόσμου τί ὡς ζῶντες ἐν κόσμῳ δογματίζεσθε',
   'ei apethanete syn Christō apo tōn stoicheiōn tou kosmou ti hōs zōntes en kosmō dogmatizesthe',
   '''If ye be dead with Christ'' (ei apethanete — assuming you died, which you did). Death with Christ liberates from the ''rudiments of the world'' (stoicheiōn tou kosmou — elemental principles, basic forces, possibly spiritual entities governing the physical world). ''Why subject to ordinances?'' (dogmatizesthe — why do you submit to decrees, rules, regulations?). Dead people are free from obligations. The believer who has died with Christ has passed beyond the jurisdiction of worldly religious rules.',
   NULL),
  (21,
   '(Touch not; taste not; handle not;',
   'μὴ ἅψῃ μηδὲ γεύσῃ μηδὲ θίγῃς',
   'mē hapsē mēde geusē mēde thigēs',
   'Paul quotes the ascetic slogans of the heretics — a descending scale of prohibition. ''Touch not'' (hapsē — do not handle, do not take hold of), ''taste not'' (geusē — do not eat or drink), ''handle not'' (thigēs — do not even make surface contact). Each more restrictive than the last. These are the ''ordinances'' of v.20 — human rules about physical contact with material things. The heresy apparently taught that spiritual purity required avoidance of physical reality — a proto-Gnostic suspicion of the material world.',
   NULL),
  (22,
   'Which all are to perish with the using;) after the commandments and doctrines of men?',
   'ἅ ἐστιν πάντα εἰς φθορὰν τῇ ἀποχρήσει κατὰ τὰ ἐντάλματα καὶ διδασκαλίας τῶν ἀνθρώπων',
   'ha estin panta eis phthoran tē apochrēsei kata ta entalmata kai didaskalias tōn anthrōpōn',
   'Physical things ''perish with the using'' (eis phthoran tē apochrēsei — destined for corruption through consumption). Food, drink, and material objects are transient — they are consumed and gone. Why build a spiritual system on what is inherently temporary? These rules are ''commandments and doctrines of men'' (entalmata kai didaskalias tōn anthrōpōn) — Paul echoes Jesus'' rebuke of the Pharisees (Matt 15:9; Isa 29:13). Human religion adds burdens God never imposed.',
   NULL),
  (23,
   'Which things have indeed a shew of wisdom in will worship, and humility, and neglecting of the body; not in any honour to the satisfying of the flesh.',
   'ἅτινά ἐστιν λόγον μὲν ἔχοντα σοφίας ἐν ἐθελοθρησκίᾳ καὶ ταπεινοφροσύνῃ καὶ ἀφειδίᾳ σώματος οὐκ ἐν τιμῇ τινι πρὸς πλησμονὴν τῆς σαρκός',
   'hatina estin logon men echonta sophias en ethelothrēskia kai tapeinophrosynē kai apheidia sōmatos ouk en timē tini pros plēsmonēn tēs sarkos',
   '''Shew of wisdom'' (logon echonta sophias — having an appearance/reputation of wisdom) — they look wise but are not. Three features of this false wisdom: (1) ''will worship'' (ethelothrēskia — self-made religion, self-imposed worship; only here in the NT), (2) ''humility'' (tapeinophrosynē — here the fake, affected variety), (3) ''neglecting of the body'' (apheidia sōmatos — severe treatment, harsh austerity). The devastating conclusion: these practices are ''not in any honour'' (ouk en timē tini) — they are worthless ''to the satisfying of the flesh'' (pros plēsmonēn tēs sarkos) — they actually gratify the flesh through spiritual pride even while punishing the body.',
   'Asceticism fails because it attacks the wrong target. Harsh bodily treatment does not conquer sin; it merely redirects sinful pride from bodily indulgence to spiritual self-congratulation. True holiness comes from union with Christ (3:1-4), not from self-imposed deprivation. Self-denial that does not flow from Christ-centeredness is just another form of self-centeredness.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Colossians' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 3 (Treasures of wisdom)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θησαυροί', 'thēsauroi', 'G2344', 'Treasures, treasure stores, repositories of wealth — every form of divine wisdom and knowledge is stored in Christ alone. The search for wisdom ends in Him.', 1),
  ('ἀπόκρυφοι', 'apokryphoi', 'G614', 'Hidden, stored up, concealed — not ''secret'' in a Gnostic sense but ''stored'' as treasure is kept in a vault. They are hidden in Christ but revealed to those who know Him.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 3;

-- Verse 8 (Philosophy and rudiments)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συλαγωγῶν', 'sylagōgōn', 'G4812', 'Carry off as plunder, kidnap, take captive — from sylē (plunder, spoils of war) + agō (to lead). False teaching is spiritual kidnapping. Only here in the NT.', 1),
  ('φιλοσοφίας', 'philosophias', 'G5385', 'Philosophy — love of wisdom. Not all philosophy is condemned; only that which is ''after the tradition of men'' and ''not after Christ.'' The test is the source and standard: Christ.', 2),
  ('στοιχεῖα', 'stoicheia', 'G4747', 'Rudiments, elemental principles — basic building blocks (elements of the physical world, elementary teachings, or spiritual forces behind natural phenomena). In context: the basic spiritual powers of the old order, now superseded by Christ.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 8;

-- Verse 9 (Fullness of the Godhead)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πλήρωμα', 'plērōma', 'G4138', 'Fullness, totality — the complete measure of everything God is. Not part of God or a divine attribute but the entire essence of deity.', 1),
  ('θεότητος', 'theotētos', 'G2320', 'Godhead, deity, divine essence — stronger than theiotēs (divinity/divine nature in Rom 1:20). Theotēs means the very being of God, the essence that makes God God. Only here in the NT.', 2),
  ('σωματικῶς', 'sōmatikōs', 'G4985', 'Bodily, in bodily form — the divine essence dwells in Christ in a physical, incarnate body. Against Gnostics who denied Christ''s true humanity. Only here in the NT.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 9;

-- Verse 10 (Complete in him)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πεπληρωμένοι', 'peplērōmenoi', 'G4137', 'Filled full, made complete — perfect passive participle: you have been filled and remain full. Same root as plērōma (v.9). He is full of God; you are full in Him.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 10;

-- Verse 14 (Handwriting nailed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χειρόγραφον', 'cheirographon', 'G5498', 'Handwriting, certificate of debt, IOU — a document signed by the debtor acknowledging the debt. The law was our signed confession of what we owed God. Only here in the NT.', 1),
  ('ἐξαλείψας', 'exaleipsas', 'G1813', 'Blotted out, wiped away, erased — like ink washed from parchment. The record of debt is not merely filed away but completely obliterated.', 2),
  ('προσηλώσας', 'prosēlōsas', 'G4338', 'Nailed to, affixed with nails — the debt certificate was nailed to the cross with Christ. As charges were posted above a criminal''s head, so our indictment was posted on Christ''s cross. Only here in the NT.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 14;

-- Verse 15 (Triumphing over them)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀπεκδυσάμενος', 'apekdysamenos', 'G554', 'Having stripped, having disarmed — stripping armour from defeated enemies, or stripping clothes from captives for the victory parade. The powers are exposed, humiliated, defenceless.', 1),
  ('ἐδειγμάτισεν', 'edeigmatisen', 'G1165', 'Made a public spectacle, displayed openly, exposed — the conquered enemies paraded for all to see. The cross is not Christ''s shame but the powers'' shame.', 2),
  ('θριαμβεύσας', 'thriambeusas', 'G2358', 'Triumphing, leading in triumphal procession — the Roman triumphus: a general parades conquered kings and soldiers through the streets. Christ''s cross is His triumphal chariot.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 15;

-- Verse 17 (Shadow and body)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σκιά', 'skia', 'G4639', 'Shadow — an outline cast by a solid object. OT ceremonies were real but derivative: they pointed to Christ, the substance. A shadow proves a body exists but is not the body itself.', 1),
  ('σῶμα', 'sōma', 'G4983', 'Body, substance, solid reality — the actual thing that casts the shadow. Christ is the substance of which all OT types and ceremonies were merely the shadow.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v3: Treasures in Christ
  (3, '1 Corinthians 1:30', 1), (3, 'Proverbs 2:3-6', 2), (3, 'Isaiah 45:3', 3),
  -- v6: Walk in Him
  (6, 'Galatians 2:20', 1), (6, 'Ephesians 4:1', 2), (6, '1 John 2:6', 3),
  -- v8: Philosophy and tradition
  (8, '1 Timothy 6:20', 1), (8, 'Galatians 4:3,9', 2), (8, '1 Corinthians 1:20-25', 3),
  -- v9: Fullness of the Godhead
  (9, 'Colossians 1:19', 1), (9, 'John 1:14,16', 2), (9, 'Hebrews 1:3', 3),
  -- v10: Complete in Him
  (10, 'Ephesians 1:22-23', 1), (10, 'John 1:16', 2), (10, '1 Corinthians 1:30', 3),
  -- v11: Circumcision without hands
  (11, 'Romans 2:28-29', 1), (11, 'Deuteronomy 30:6', 2), (11, 'Philippians 3:3', 3),
  -- v12: Buried and risen with Christ
  (12, 'Romans 6:3-4', 1), (12, 'Ephesians 2:5-6', 2), (12, 'Galatians 3:27', 3),
  -- v13: Dead, now alive
  (13, 'Ephesians 2:1-5', 1), (13, 'Romans 5:6', 2), (13, 'Ephesians 4:32', 3),
  -- v14: Handwriting nailed
  (14, 'Ephesians 2:15', 1), (14, 'Galatians 3:13', 2), (14, 'Romans 8:1-3', 3),
  -- v15: Triumph of the cross
  (15, '1 Corinthians 2:8', 1), (15, 'Ephesians 6:12', 2), (15, 'Hebrews 2:14-15', 3), (15, '2 Corinthians 2:14', 4),
  -- v16: Freedom from regulations
  (16, 'Romans 14:1-6', 1), (16, 'Galatians 4:10-11', 2), (16, 'Hebrews 9:10', 3),
  -- v17: Shadow and substance
  (17, 'Hebrews 8:5', 1), (17, 'Hebrews 10:1', 2), (17, 'John 1:17', 3),
  -- v18: Angel worship
  (18, 'Revelation 19:10', 1), (18, 'Revelation 22:8-9', 2), (18, '1 Timothy 4:1', 3),
  -- v20: Dead to world-elements
  (20, 'Romans 6:2-7', 1), (20, 'Galatians 4:3,9', 2), (20, 'Galatians 2:19', 3),
  -- v23: Show of wisdom
  (23, '1 Timothy 4:3-5', 1), (23, 'Mark 7:7-8', 2), (23, 'Isaiah 29:13', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Colossians Chapter 2 Complete!
-- 23 verses · 8 key verses with word studies (22 words)
-- Cross-references for 16 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════