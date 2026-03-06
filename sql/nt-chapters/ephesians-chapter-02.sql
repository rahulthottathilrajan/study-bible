-- ═══════════════════════════════════════════════════
-- EPHESIANS CHAPTER 2 — From Death to Life, One New Man
-- 22 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Ephesians 2 moves from the heights of God''s eternal purpose (ch.1) to the depths of human depravity and the miracle of divine rescue. Paul reminds the Ephesians of their former condition: ''dead in trespasses and sins'' (v.1), walking ''according to the course of this world, according to the prince of the power of the air'' (v.2), living ''in the lusts of our flesh'' as ''children of wrath'' (v.3). Then comes the great turning point: ''But God, who is rich in mercy, for his great love wherewith he loved us, even when we were dead in sins, hath quickened us together with Christ'' (vv.4-5). Believers have been raised and seated with Christ ''in heavenly places'' (v.6). Salvation is entirely by grace: ''For by grace are ye saved through faith; and that not of yourselves: it is the gift of God: not of works, lest any man should boast'' (vv.8-9). Yet grace produces works: ''we are his workmanship, created in Christ Jesus unto good works'' (v.10). The chapter then addresses the Jew-Gentile divide: Gentiles were ''aliens from the commonwealth of Israel, and strangers from the covenants of promise'' (v.12), but Christ ''hath broken down the middle wall of partition'' (v.14), abolishing the enmity ''to make in himself of twain one new man, so making peace'' (v.15). Through the cross, both Jew and Gentile have ''access by one Spirit unto the Father'' (v.18). The chapter closes with the church as God''s temple: ''built upon the foundation of the apostles and prophets, Jesus Christ himself being the chief corner stone'' (v.20), ''an holy temple in the Lord'' and ''an habitation of God through the Spirit'' (vv.21-22).',
  'By Grace Through Faith — One New Man in Christ',
  'χάρις (charis)',
  'Grace — unmerited favour, the free gift of God that saves sinners. The centrepiece of the chapter is vv.8-9, the clearest statement of salvation by grace through faith in all of Scripture. Grace is not merely an attribute of God but the instrument of salvation, the motive of creation, and the foundation of the new humanity.',
  '["Dead in Sin — The Former Condition (vv.1-3): And you hath he quickened who were dead in trespasses and sins wherein in time past ye walked according to the course of this world according to the prince of the power of the air the spirit that now worketh in the children of disobedience among whom also we all had our conversation in times past in the lusts of our flesh fulfilling the desires of the flesh and of the mind and were by nature the children of wrath even as others","But God — Salvation by Grace (vv.4-10): But God who is rich in mercy for his great love wherewith he loved us even when we were dead in sins hath quickened us together with Christ by grace ye are saved and hath raised us up together and made us sit together in heavenly places in Christ Jesus; for by grace are ye saved through faith and that not of yourselves it is the gift of God not of works lest any man should boast; for we are his workmanship created in Christ Jesus unto good works","One New Man — Jew and Gentile Reconciled (vv.11-18): Wherefore remember that ye being in time past Gentiles in the flesh who are called Uncircumcision; that at that time ye were without Christ aliens from the commonwealth of Israel and strangers from the covenants of promise having no hope and without God in the world; but now in Christ Jesus ye who sometimes were far off are made nigh by the blood of Christ; for he is our peace who hath made both one and hath broken down the middle wall of partition between us; having abolished in his flesh the enmity to make in himself of twain one new man so making peace","God''s Temple — The Church as Habitation (vv.19-22): Now therefore ye are no more strangers and foreigners but fellowcitizens with the saints and of the household of God; and are built upon the foundation of the apostles and prophets Jesus Christ himself being the chief corner stone; in whom all the building fitly framed together groweth unto an holy temple in the Lord; in whom ye also are builded together for an habitation of God through the Spirit"]'
FROM books b WHERE b.name = 'Ephesians';

-- Step 2: Insert all 22 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And you hath he quickened, who were dead in trespasses and sins;',
   'Καὶ ὑμᾶς ὄντας νεκροὺς τοῖς παραπτώμασιν καὶ ταῖς ἁμαρτίαις',
   'Kai hymas ontas nekrous tois paraptōmasin kai tais hamartiais',
   '''You hath he quickened'' — the verb ''quickened'' (made alive) is not in the Greek until v.5 (synezōopoiēsen); Paul begins the sentence, interrupts with a digression (vv.2-3), and completes the thought in vv.4-5. ''Dead'' (nekrous — corpse-dead, not merely sick or weak). ''Trespasses'' (paraptōmasin — false steps, deviations). ''Sins'' (hamartiais — missing the mark). Spiritual death is not a metaphor but a reality: the unregenerate person is as unable to respond to God as a corpse is unable to respond to stimuli.',
   'Spiritual death: The natural condition of humanity is not spiritual illness but spiritual death. Dead people cannot contribute to their own resurrection — they must be acted upon from outside. This establishes the necessity of grace: if we were merely weak, we might need help; but since we are dead, we need resurrection. This is the foundation for vv.8-9.'),
  (2, 'Wherein in time past ye walked according to the course of this world, according to the prince of the power of the air, the spirit that now worketh in the children of disobedience:',
   'ἐν αἷς ποτε περιεπατήσατε κατὰ τὸν αἰῶνα τοῦ κόσμου τούτου κατὰ τὸν ἄρχοντα τῆς ἐξουσίας τοῦ ἀέρος τοῦ πνεύματος τοῦ νῦν ἐνεργοῦντος ἐν τοῖς υἱοῖς τῆς ἀπειθείας',
   'en hais pote periepatēsate kata ton aiōna tou kosmou toutou kata ton archonta tēs exousias tou aeros tou pneumatos tou nyn energountos en tois huiois tēs apeitheias',
   '''Walked'' (periepatēsate — conducted your life, your habitual lifestyle). ''Course of this world'' (ton aiōna tou kosmou toutou — the age of this world; the spirit of the present age). ''Prince of the power of the air'' (ton archonta tēs exousias tou aeros — Satan, the ruler who exercises authority in the spiritual atmosphere). ''Worketh'' (energountos — actively energises; the same word used of God''s power in 1:19, now applied to Satan). Three forces controlled the unregenerate: the world (external pressure), the devil (supernatural influence), and the flesh (v.3, internal corruption).',
   NULL),
  (3, 'Among whom also we all had our conversation in times past in the lusts of our flesh, fulfilling the desires of the flesh and of the mind; and were by nature the children of wrath, even as others.',
   'ἐν οἷς καὶ ἡμεῖς πάντες ἀνεστράφημέν ποτε ἐν ταῖς ἐπιθυμίαις τῆς σαρκὸς ἡμῶν ποιοῦντες τὰ θελήματα τῆς σαρκὸς καὶ τῶν διανοιῶν καὶ ἦμεν τέκνα φύσει ὀργῆς ὡς καὶ οἱ λοιποί',
   'en hois kai hēmeis pantes anestraphēmen pote en tais epithymiais tēs sarkos hēmōn poiountes ta thelēmata tēs sarkos kai tōn dianoiōn kai ēmen tekna physei orgēs hōs kai hoi loipoi',
   '''We all'' (hēmeis pantes — Paul includes himself and all Jews; this is not a Gentile-only problem). ''Conversation'' (anestraphēmen — conducted ourselves, turned ourselves about in). ''Lusts of our flesh'' (epithymiais tēs sarkos — the cravings of the sinful nature). ''Desires of the flesh and of the mind'' (thelēmata tēs sarkos kai tōn dianoiōn — the wills/impulses of body and mind; sin corrupts both physical desires and intellectual reasoning). ''By nature children of wrath'' (tekna physei orgēs — by our very nature, objects of divine wrath). This is not cultural conditioning but inherited corruption.',
   'Children of wrath by nature: ''By nature'' (physei) indicates that the sinful condition is innate, not merely learned. Both Jews and Gentiles share this condition (''even as others''). The ''wrath'' (orgē) is God''s settled, righteous opposition to sin — not capricious anger but holy justice. This verse teaches the universality and innateness of sin, and establishes the baseline against which the ''But God'' of v.4 shines.'),
  (4, 'But God, who is rich in mercy, for his great love wherewith he loved us,',
   'ὁ δὲ θεὸς πλούσιος ὢν ἐν ἐλέει διὰ τὴν πολλὴν ἀγάπην αὐτοῦ ἣν ἠγάπησεν ἡμᾶς',
   'ho de theos plousios ōn en eleei dia tēn pollēn agapēn autou hēn ēgapēsen hēmas',
   '''But God'' (ho de theos — the great adversative; the most important two words in the chapter). ''Rich in mercy'' (plousios en eleei — wealthy in compassion; mercy is God''s response to misery). ''Great love'' (pollēn agapēn — abundant, much love). Two divine attributes motivate salvation: mercy (responding to our wretchedness) and love (his self-giving nature). The contrast is total: we were dead, enslaved, and condemned (vv.1-3); but God is rich, loving, and merciful.',
   'But God: These two words mark the turning point of human history and personal salvation. Against the dark canvas of vv.1-3, God''s initiative shines. Salvation begins not with human seeking but with divine mercy. God acts not because we deserve it but because he is ''rich in mercy.'' The love is described as ''great'' (pollēn) — not a reluctant pity but an overflowing, self-giving love.'),
  (5, 'Even when we were dead in sins, hath quickened us together with Christ, (by grace ye are saved;)',
   'καὶ ὄντας ἡμᾶς νεκροὺς τοῖς παραπτώμασιν συνεζωοποίησεν τῷ Χριστῷ χάριτί ἐστε σεσωσμένοι',
   'kai ontas hēmas nekrous tois paraptōmasin synezōopoiēsen tō Christō chariti este sesōsmenoi',
   '''Even when we were dead'' (ontas hēmas nekrous — while we were still corpses in sin). ''Quickened us together with Christ'' (synezōopoiēsen tō Christō — made us alive together with Christ; syn- prefix: united with Christ in his resurrection life). ''By grace ye are saved'' (chariti este sesōsmenoi — a parenthetical exclamation; perfect periphrastic: you have been saved and remain in that saved state). Paul cannot contain himself — he breaks into the doxological aside that will be fully developed in vv.8-9.',
   NULL),
  (6, 'And hath raised us up together, and made us sit together in heavenly places in Christ Jesus:',
   'καὶ συνήγειρεν καὶ συνεκάθισεν ἐν τοῖς ἐπουρανίοις ἐν Χριστῷ Ἰησοῦ',
   'kai synēgeiren kai synekathisen en tois epouraniois en Christō Iēsou',
   '''Raised us up together'' (synēgeiren — co-raised; aorist: it is accomplished). ''Made us sit together'' (synekathisen — co-seated; aorist: it is done). Three ''syn-'' (together with) verbs: made alive together (v.5), raised together, seated together. What happened to Christ has happened to the believer. We are not merely promised a future seat — we are already seated ''in heavenly places in Christ Jesus.'' Our position is as secure as Christ''s own throne.',
   'Seated in heavenly places: This is positional truth — what is true of the believer in God''s sight, by virtue of union with Christ. The same ''heavenly places'' where Christ is enthroned (1:20) is where believers are seated (2:6). This is the basis for the Christian life: we do not fight for victory but from victory. The spiritual warfare of ch.6 is fought from this seated position of authority.'),
  (7, 'That in the ages to come he might shew the exceeding riches of his grace in his kindness toward us through Christ Jesus.',
   'ἵνα ἐνδείξηται ἐν τοῖς αἰῶσιν τοῖς ἐπερχομένοις τὸν ὑπερβάλλοντα πλοῦτον τῆς χάριτος αὐτοῦ ἐν χρηστότητι ἐφ᾽ ἡμᾶς ἐν Χριστῷ Ἰησοῦ',
   'hina endeixētai en tois aiōsin tois eperchomenois ton hyperballonta plouton tēs charitos autou en chrēstotēti eph'' hēmas en Christō Iēsou',
   '''Ages to come'' (aiōsin tois eperchomenois — the successive ages of eternity future). ''Shew'' (endeixētai — display, demonstrate, exhibit; middle voice: display for himself). ''Exceeding riches'' (hyperballonta plouton — surpassing wealth; the same hyper- language as 1:19). ''Kindness'' (chrēstotēti — goodness, generosity, gracious benevolence). God''s purpose in saving us extends into eternity: throughout all future ages, redeemed sinners will be the supreme exhibit of divine grace. We are God''s eternal trophy case of grace.',
   NULL),
  (8, 'For by grace are ye saved through faith; and that not of yourselves: it is the gift of God:',
   'τῇ γὰρ χάριτί ἐστε σεσωσμένοι διὰ τῆς πίστεως καὶ τοῦτο οὐκ ἐξ ὑμῶν θεοῦ τὸ δῶρον',
   'tē gar chariti este sesōsmenoi dia tēs pisteōs kai touto ouk ex hymōn theou to dōron',
   '''By grace'' (tē chariti — the instrumental dative: grace is the means). ''Are ye saved'' (este sesōsmenoi — perfect periphrastic: you have been saved and continue in that saved state; the salvation is accomplished and permanent). ''Through faith'' (dia tēs pisteōs — faith is the channel, not the cause). ''And that not of yourselves'' (kai touto ouk ex hymōn — ''that'' likely refers to the entire salvation process, not just faith). ''The gift of God'' (theou to dōron — emphatic: God''s gift, not human achievement). Grace is the source; faith is the instrument; God is the giver.',
   'By grace through faith: This verse is the Magna Carta of the Reformation. Grace (charis) is the unmerited, undeserved favour of God — the cause of salvation. Faith (pistis) is the empty hand that receives the gift — the instrument of salvation. ''Not of yourselves'' eliminates any human contribution. ''The gift of God'' confirms that even the ability to believe is ultimately God''s gracious provision. This verse demolishes every form of works-righteousness: salvation is received, never earned.'),
  (9, 'Not of works, lest any man should boast.',
   'οὐκ ἐξ ἔργων ἵνα μή τις καυχήσηται',
   'ouk ex ergōn hina mē tis kauchēsētai',
   '''Not of works'' (ouk ex ergōn — not sourced from, not arising out of human works). ''Lest any man should boast'' (hina mē tis kauchēsētai — so that no one might boast; this is God''s deliberate design). The exclusion of works is not arbitrary but purposeful: boasting is eliminated by design. If salvation were even partly by works, some ground for human pride would remain. Pure grace produces pure humility.',
   NULL),
  (10, 'For we are his workmanship, created in Christ Jesus unto good works, which God hath before ordained that we should walk in them.',
   'αὐτοῦ γάρ ἐσμεν ποίημα κτισθέντες ἐν Χριστῷ Ἰησοῦ ἐπὶ ἔργοις ἀγαθοῖς οἷς προητοίμασεν ὁ θεὸς ἵνα ἐν αὐτοῖς περιπατήσωμεν',
   'autou gar esmen poiēma ktisthentes en Christō Iēsou epi ergois agathois hois proētoimasen ho theos hina en autois peripatēsōmen',
   '''His workmanship'' (autou poiēma — his poem, his masterpiece, his work of art; from poieō, to make; the source of ''poem''). ''Created'' (ktisthentes — created, brought into being; the same word as the original creation). ''Unto good works'' (epi ergois agathois — for the purpose of good works). ''Before ordained'' (proētoimasen — prepared beforehand, made ready in advance). The relationship between grace and works: we are not saved by works (v.9) but we are saved for works (v.10). Good works are the result of salvation, not the cause. God prepared the works; we walk in them.',
   'Workmanship created unto good works: This verse resolves the tension between grace and works. Vv.8-9 exclude works as the cause of salvation; v.10 includes works as the purpose of salvation. We are God''s poiēma — his artistic creation, his masterwork. The good works were ''before ordained'' (proētoimasen) — God prepared them in advance for us to walk in. Works do not earn salvation; they express it. The Christian life is walking in the path God has already laid out.'),
  (11, 'Wherefore remember, that ye being in time past Gentiles in the flesh, who are called Uncircumcision by that which is called the Circumcision in the flesh made by hands;',
   'Διὸ μνημονεύετε ὅτι ὑμεῖς ποτε τὰ ἔθνη ἐν σαρκί οἱ λεγόμενοι ἀκροβυστία ὑπὸ τῆς λεγομένης περιτομῆς ἐν σαρκὶ χειροποιήτου',
   'Dio mnēmoneuete hoti hymeis pote ta ethnē en sarki hoi legomenoi akrobystia hypo tēs legomenēs peritomēs en sarki cheiropoiētou',
   '''Remember'' (mnēmoneuete — keep remembering; present imperative: make it a habit to remember your former state). ''Gentiles in the flesh'' (ta ethnē en sarki — nations, non-Jews by physical descent). ''Called Uncircumcision'' (legomenoi akrobystia — labelled, named contemptuously). ''Made by hands'' (cheiropoiētou — handmade, humanly constructed; a subtle critique: the circumcision they boast of is merely physical). Paul wants Gentile believers to remember how far grace has brought them.',
   NULL),
  (12, 'That at that time ye were without Christ, being aliens from the commonwealth of Israel, and strangers from the covenants of promise, having no hope, and without God in the world:',
   'ὅτι ἦτε ἐν τῷ καιρῷ ἐκείνῳ χωρὶς Χριστοῦ ἀπηλλοτριωμένοι τῆς πολιτείας τοῦ Ἰσραὴλ καὶ ξένοι τῶν διαθηκῶν τῆς ἐπαγγελίας ἐλπίδα μὴ ἔχοντες καὶ ἄθεοι ἐν τῷ κόσμῳ',
   'hoti ēte en tō kairō ekeinō chōris Christou apēllotriōmenoi tēs politeias tou Israēl kai xenoi tōn diathēkōn tēs epangelias elpida mē echontes kai atheoi en tō kosmō',
   'Five descriptions of the Gentiles'' former condition: (1) ''without Christ'' (chōris Christou — no Messiah, no anointed deliverer); (2) ''aliens from the commonwealth of Israel'' (apēllotriōmenoi tēs politeias — alienated from Israel''s citizenship); (3) ''strangers from the covenants of promise'' (xenoi tōn diathēkōn — foreigners to God''s covenant promises); (4) ''having no hope'' (elpida mē echontes — hopeless); (5) ''without God'' (atheoi — godless, atheists in the literal sense). This is the darkest description of the human condition apart from grace.',
   NULL),
  (13, 'But now in Christ Jesus ye who sometimes were far off are made nigh by the blood of Christ.',
   'νυνὶ δὲ ἐν Χριστῷ Ἰησοῦ ὑμεῖς οἱ ποτε ὄντες μακρὰν ἐγγὺς ἐγενήθητε ἐν τῷ αἵματι τοῦ Χριστοῦ',
   'nyni de en Christō Iēsou hymeis hoi pote ontes makran engys egenēthēte en tō haimati tou Christou',
   '''But now'' (nyni de — the second great adversative, parallel to ''but God'' in v.4). ''Far off'' (makran — distant; a rabbinic term for Gentiles, who were ''far'' from God and Israel). ''Made nigh'' (engys egenēthēte — have become near). ''By the blood of Christ'' (en tō haimati tou Christou — the price of proximity; the cross bridges the gap). The contrast is between ''at that time'' (v.12) and ''but now'' — what Christ''s blood has accomplished for those who were outside every covenant and promise.',
   NULL),
  (14, 'For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us;',
   'αὐτὸς γάρ ἐστιν ἡ εἰρήνη ἡμῶν ὁ ποιήσας τὰ ἀμφότερα ἓν καὶ τὸ μεσότοιχον τοῦ φραγμοῦ λύσας',
   'autos gar estin hē eirēnē hēmōn ho poiēsas ta amphotera hen kai to mesotoichon tou phragmou lysas',
   '''He is our peace'' (autos estin hē eirēnē hēmōn — not merely ''he gives peace'' but ''he himself is peace''; Christ is not a peacemaker at a distance but the embodiment of peace). ''Made both one'' (poiēsas ta amphotera hen — made the two groups into one). ''Middle wall of partition'' (mesotoichon tou phragmou — the dividing wall of the fence/barrier). This likely alludes to the wall in the Jerusalem temple that separated the Court of the Gentiles from the inner courts, with its death-penalty warning to Gentiles. Christ demolished this barrier.',
   'Christ our peace: Christ does not merely make peace — he is peace. The ''middle wall of partition'' represents every barrier between Jew and Gentile: the ceremonial law, cultural hostility, religious exclusivism. The cross demolished all of these. This has profound implications: if Christ has united Jew and Gentile — the most fundamental division in the ancient world — then no human division is beyond his reconciling power.'),
  (15, 'Having abolished in his flesh the enmity, even the law of commandments contained in ordinances; for to make in himself of twain one new man, so making peace;',
   'τὴν ἔχθραν ἐν τῇ σαρκὶ αὐτοῦ τὸν νόμον τῶν ἐντολῶν ἐν δόγμασιν καταργήσας ἵνα τοὺς δύο κτίσῃ ἐν ἑαυτῷ εἰς ἕνα καινὸν ἄνθρωπον ποιῶν εἰρήνην',
   'tēn echthran en tē sarki autou ton nomon tōn entolōn en dogmasin katargēsas hina tous dyo ktisē en heautō eis hena kainon anthrōpon poiōn eirēnēn',
   '''Abolished'' (katargēsas — rendered inoperative, made of no effect; the ceremonial law as a dividing wall has been nullified). ''The enmity'' (tēn echthran — the hostility between Jew and Gentile, caused by the law''s exclusionary function). ''In his flesh'' (en tē sarki autou — through his physical body offered on the cross). ''One new man'' (hena kainon anthrōpon — one new humanity; kainos means new in kind, not merely new in time). Christ did not make Gentiles into Jews or Jews into Gentiles; he created something entirely new — a new humanity in himself.',
   'One new man: This is one of the most radical concepts in the NT. Christ''s purpose was not to merge two existing groups but to create an entirely new entity — the ''new man'' (kainos anthrōpos), a new humanity that transcends the Jew-Gentile divide. This ''new man'' is the church, the body of Christ. In the church, ethnic, cultural, and religious barriers are not merely tolerated but abolished, replaced by a new identity in Christ.'),
  (16, 'And that he might reconcile both unto God in one body by the cross, having slain the enmity thereby:',
   'καὶ ἀποκαταλλάξῃ τοὺς ἀμφοτέρους ἐν ἑνὶ σώματι τῷ θεῷ διὰ τοῦ σταυροῦ ἀποκτείνας τὴν ἔχθραν ἐν αὐτῷ',
   'kai apokatallaxē tous amphoterous en heni sōmati tō theō dia tou staurou apokteinas tēn echthran en autō',
   '''Reconcile'' (apokatallaxē — fully reconcile, restore to a former state of harmony; the double compound apo-kata- intensifies the completeness of the reconciliation). ''In one body'' (en heni sōmati — in one body, likely referring both to Christ''s physical body on the cross and to the church as one body). ''By the cross'' (dia tou staurou). ''Having slain the enmity'' (apokteinas tēn echthran — having killed the hostility; the cross kills enmity rather than people). Double reconciliation: Jew with Gentile (horizontal) and both with God (vertical).',
   NULL),
  (17, 'And came and preached peace to you which were afar off, and to them that were nigh.',
   'καὶ ἐλθὼν εὐηγγελίσατο εἰρήνην ὑμῖν τοῖς μακρὰν καὶ τοῖς ἐγγύς',
   'kai elthōn euēngelisato eirēnēn hymin tois makran kai tois engys',
   '''Came and preached peace'' (elthōn euēngelisato eirēnēn — coming, he announced the good news of peace). This echoes Isaiah 57:19: ''Peace, peace to him that is far off, and to him that is near.'' Christ''s gospel is a message of peace for both ''far off'' (Gentiles) and ''near'' (Jews). The ''coming'' may refer to Christ''s earthly ministry, or to his coming through the apostolic proclamation.',
   NULL),
  (18, 'For through him we both have access by one Spirit unto the Father.',
   'ὅτι δι᾽ αὐτοῦ ἔχομεν τὴν προσαγωγὴν οἱ ἀμφότεροι ἐν ἑνὶ πνεύματι πρὸς τὸν πατέρα',
   'hoti di'' autou echomen tēn prosagōgēn hoi amphoteroi en heni pneumati pros ton patera',
   '''Access'' (prosagōgēn — the right of approach, introduction into the presence of a king; in the ancient court, a prosagōgeus was the officer who introduced visitors to the king). ''We both'' (hoi amphoteroi — both groups, Jew and Gentile together). ''By one Spirit'' (en heni pneumati — through the one Holy Spirit). ''Unto the Father'' (pros ton patera — to the Father). A Trinitarian verse: through the Son, by the Spirit, to the Father. Both Jew and Gentile now have equal access to God''s throne room.',
   'Trinitarian access: This verse reveals the Trinitarian structure of salvation. Access to the Father is through the Son and by the Spirit. All three Persons of the Trinity are involved in bringing believers into God''s presence. The access is shared equally (''we both'') — Jew and Gentile approach God on identical terms, through identical means.'),
  (19, 'Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of God;',
   'ἄρα οὖν οὐκέτι ἐστὲ ξένοι καὶ πάροικοι ἀλλὰ συμπολῖται τῶν ἁγίων καὶ οἰκεῖοι τοῦ θεοῦ',
   'ara oun ouketi este xenoi kai paroikoi alla sympolitai tōn hagiōn kai oikeioi tou theou',
   '''Strangers'' (xenoi — aliens, foreigners with no rights). ''Foreigners'' (paroikoi — sojourners, resident aliens without citizenship). ''Fellowcitizens'' (sympolitai — co-citizens, sharing full civic rights). ''Household of God'' (oikeioi tou theou — members of God''s own family). The transformation is complete: from outsiders to insiders, from aliens to family members. Two metaphors: political (citizenship) and domestic (household).',
   NULL),
  (20, 'And are built upon the foundation of the apostles and prophets, Jesus Christ himself being the chief corner stone;',
   'ἐποικοδομηθέντες ἐπὶ τῷ θεμελίῳ τῶν ἀποστόλων καὶ προφητῶν ὄντος ἀκρογωνιαίου αὐτοῦ Ἰησοῦ Χριστοῦ',
   'epoikodomēthentes epi tō themeliō tōn apostolōn kai prophētōn ontos akrogōniaiou autou Iēsou Christou',
   '''Built upon'' (epoikodomēthentes — built on top of, constructed upon). ''Foundation of the apostles and prophets'' — either the foundation that the apostles and prophets laid (the gospel message), or the foundation consisting of the apostles and prophets themselves. ''Chief corner stone'' (akrogōniaiou — the cornerstone that determines the alignment of the entire building). Christ is the stone that sets the pattern; everything else is aligned to him.',
   NULL),
  (21, 'In whom all the building fitly framed together groweth unto an holy temple in the Lord:',
   'ἐν ᾧ πᾶσα ἡ οἰκοδομὴ συναρμολογουμένη αὔξει εἰς ναὸν ἅγιον ἐν κυρίῳ',
   'en hō pasa hē oikodomē synarmologoumenē auxei eis naon hagion en kyriō',
   '''Fitly framed together'' (synarmologoumenē — joined together, fitted together with precision; from syn + harmos, a joint). ''Groweth'' (auxei — grows, increases; present tense: ongoing growth). ''Holy temple'' (naon hagion — naos, the inner sanctuary, not the outer temple complex). The building metaphor is organic: the temple grows. The church is not a static institution but a living, growing temple — each believer a stone being fitted into the sacred structure.',
   NULL),
  (22, 'In whom ye also are builded together for an habitation of God through the Spirit.',
   'ἐν ᾧ καὶ ὑμεῖς συνοικοδομεῖσθε εἰς κατοικητήριον τοῦ θεοῦ ἐν πνεύματι',
   'en hō kai hymeis synoikodomeisthe eis katoikētērion tou theou en pneumati',
   '''Builded together'' (synoikodomeisthe — co-constructed; present passive: you are being built together). ''Habitation'' (katoikētērion — a permanent dwelling place, not a temporary tent; kata- intensifies: a settled, established residence). ''Of God through the Spirit'' (tou theou en pneumati). The chapter ends where the Old Testament temple theology pointed: God dwelling with his people. But now the temple is not a building but a community — Jew and Gentile built together as God''s permanent home through the Spirit.',
   'The church as God''s temple: In the OT, God''s presence dwelt in the tabernacle and temple. Now God dwells in his people — collectively, as a community, not merely individually. The emphasis on ''together'' (syn-) is crucial: God''s temple is not any single believer but the community of believers built together. The Spirit is the means of this indwelling. The church is the new temple — the place where God permanently resides on earth.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 1 (Dead in trespasses)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νεκρούς', 'nekrous', 'G3498', 'Dead — literally corpse-dead, lifeless. Not sick, not weak, not dying, but dead. Applied to spiritual condition: the unregenerate person is utterly unable to respond to God, as incapable of spiritual life as a corpse is of physical life. This is total spiritual death requiring divine resurrection.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 1;

-- Verse 4 (But God, rich in mercy)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλέει', 'eleei', 'G1656', 'Mercy — compassion toward the miserable, pity for those in distress. Distinguished from grace (charis): grace is unmerited favour toward the undeserving; mercy is compassion toward the wretched. We needed grace because we were guilty; we needed mercy because we were miserable. God is ''rich'' (plousios) in mercy — wealthy, overflowing with compassion.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 5 (Quickened together with Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συνεζωοποίησεν', 'synezōopoiēsen', 'G4806', 'Made alive together with — from syn (together) + zōopoieō (to make alive, to give life). A compound verb expressing union with Christ in his resurrection. Just as Christ was raised from physical death, believers are raised from spiritual death — and the two events are mystically connected.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 5;

-- Verse 8 (By grace through faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χάριτι', 'chariti', 'G5485', 'By grace — the instrumental dative: grace is the means of salvation. Charis means unmerited favour, a free gift given without regard to the worthiness of the recipient. Grace is distinguished from works: grace is what God gives freely; works are what humans try to earn. Salvation is entirely by grace.', 1),
  ('σεσωσμένοι', 'sesōsmenoi', 'G4982', 'Having been saved — perfect passive participle of sōzō (to save, deliver, rescue). The perfect tense indicates a completed action with ongoing results: you have been saved and remain in that saved state. The passive voice indicates that salvation is something done to us, not by us. Salvation is an accomplished, permanent reality.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 8;

-- Verse 10 (His workmanship)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποίημα', 'poiēma', 'G4161', 'Workmanship, something made, a work of art — from poieō (to make, to create). The root of the English word ''poem.'' We are God''s creative masterpiece, his artistic production. Used only here and in Romans 1:20 in the NT. Each believer is a unique expression of God''s creative artistry.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 10;

-- Verse 14 (Middle wall of partition)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μεσότοιχον', 'mesotoichon', 'G3320', 'Middle wall, dividing wall — from mesos (middle) + toichos (wall). Used only here in the NT. Likely alludes to the balustrade (soreg) in the Jerusalem temple that separated the Court of the Gentiles from the inner courts. Inscriptions on this wall warned Gentiles that entry meant death. Christ demolished this wall through the cross.', 1),
  ('εἰρήνη', 'eirēnē', 'G1515', 'Peace — more than the absence of conflict; the Hebrew shalom concept of wholeness, completeness, well-being. Christ is not merely a peacemaker but ''our peace'' (hē eirēnē hēmōn) — the embodiment and ground of reconciliation between Jew and Gentile, and between humanity and God.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 14;

-- Verse 15 (One new man)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καινὸν ἄνθρωπον', 'kainon anthrōpon', 'G2537+G444', 'New man, new humanity — kainos means new in quality or kind (not neos, new in time). This is not a renovation of the old but a brand-new creation. The ''one new man'' is the church — a new humanity that transcends the Jew-Gentile division, created in Christ himself.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 15;

-- Verse 20 (Chief corner stone)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀκρογωνιαίου', 'akrogōniaiou', 'G204', 'Chief corner stone — from akros (extreme, outermost) + gōnia (angle, corner). The stone placed at the corner of the foundation that determines the lines and angles of the entire structure. Every other stone is aligned to the cornerstone. Christ is the stone that sets the pattern for the whole building — the church is aligned to him.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = 20;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Dead in trespasses
  (1, 'Colossians 2:13', 1), (1, 'Romans 5:12', 2),
  -- v2: Prince of the power of the air
  (2, 'John 12:31', 1), (2, '1 John 5:19', 2),
  -- v3: Children of wrath by nature
  (3, 'Romans 3:23', 1), (3, 'Psalm 51:5', 2),
  -- v4: But God rich in mercy
  (4, 'Romans 5:8', 1), (4, 'Titus 3:4-5', 2),
  -- v5: Quickened together with Christ
  (5, 'Colossians 2:13', 1), (5, 'Romans 6:4-5', 2),
  -- v6: Seated in heavenly places
  (6, 'Colossians 3:1', 1), (6, 'Revelation 3:21', 2),
  -- v8: By grace through faith
  (8, 'Romans 3:24', 1), (8, 'Romans 4:16', 2), (8, 'Titus 3:5-7', 3),
  -- v9: Not of works
  (9, 'Romans 3:27-28', 1), (9, 'Romans 11:6', 2),
  -- v10: His workmanship
  (10, '2 Corinthians 5:17', 1), (10, 'Titus 2:14', 2), (10, 'Philippians 2:13', 3),
  -- v13: Made nigh by the blood
  (13, 'Isaiah 57:19', 1), (13, 'Colossians 1:20', 2),
  -- v14: He is our peace
  (14, 'Isaiah 9:6', 1), (14, 'Micah 5:5', 2), (14, 'Colossians 1:20', 3),
  -- v15: One new man
  (15, 'Colossians 2:14', 1), (15, 'Galatians 3:28', 2),
  -- v18: Access by one Spirit
  (18, 'Romans 5:2', 1), (18, 'Hebrews 4:16', 2), (18, 'John 14:6', 3),
  -- v20: Chief corner stone
  (20, 'Isaiah 28:16', 1), (20, '1 Peter 2:6', 2), (20, '1 Corinthians 3:11', 3),
  -- v22: Habitation of God
  (22, '1 Corinthians 3:16', 1), (22, '1 Peter 2:5', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Ephesians Chapter 2 Complete
-- 22 verses · 10 key verses with word studies (13 words)
-- Cross-references for 16 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
