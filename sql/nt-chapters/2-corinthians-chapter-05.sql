-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 5 — The Ministry of Reconciliation
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  '2 Corinthians 5 moves from the earthly tent to the heavenly building, from the judgment seat of Christ to the ministry of reconciliation. Paul opens with confident hope: ''we know that if our earthly house of this tabernacle were dissolved, we have a building of God, an house not made with hands, eternal in the heavens'' (v.1). The present state is one of groaning: ''we that are in this tabernacle do groan, being burdened'' (v.4), desiring not to be unclothed but ''clothed upon, that mortality might be swallowed up of life'' (v.4). God has prepared believers for this, ''who also hath given unto us the earnest of the Spirit'' (v.5). Paul declares his guiding principle: ''we walk by faith, not by sight'' (v.7), and his ambition: ''we labour, that, whether present or absent, we may be accepted of him'' (v.9). ''For we must all appear before the judgment seat of Christ; that every one may receive the things done in his body'' (v.10). The chapter''s great theological center arrives: ''if any man be in Christ, he is a new creature: old things are passed away; behold, all things are become new'' (v.17). ''God was in Christ, reconciling the world unto himself, not imputing their trespasses unto them'' (v.19). Paul defines his role: ''we are ambassadors for Christ, as though God did beseech you by us: we pray you in Christ''s stead, be ye reconciled to God'' (v.20). The chapter culminates: ''For he hath made him to be sin for us, who knew no sin; that we might be made the righteousness of God in him'' (v.21).',
  'The Ministry of Reconciliation, New Creation in Christ',
  'καταλλαγή (katallagē)',
  'Reconciliation — the restoration of a broken relationship, the exchange of enmity for peace. From katallassō (to change, to exchange). God reconciles the world to himself through Christ, not counting their trespasses against them. This is God''s initiative: he reconciles; we are reconciled. The word appears in the NT almost exclusively in Paul.',
  '["The Heavenly Dwelling and the Groaning of the Present (vv.1-5): For we know that if our earthly house of this tabernacle were dissolved we have a building of God an house not made with hands eternal in the heavens for in this we groan earnestly desiring to be clothed upon with our house which is from heaven if so be that being clothed we shall not be found naked for we that are in this tabernacle do groan being burdened not for that we would be unclothed but clothed upon that mortality might be swallowed up of life now he that hath wrought us for the selfsame thing is God who also hath given unto us the earnest of the Spirit","Walking by Faith and the Judgment Seat (vv.6-10): Therefore we are always confident knowing that whilst we are at home in the body we are absent from the Lord for we walk by faith not by sight we are confident I say and willing rather to be absent from the body and to be present with the Lord wherefore we labour that whether present or absent we may be accepted of him for we must all appear before the judgment seat of Christ that every one may receive the things done in his body according to that he hath done whether it be good or bad","The Love of Christ and New Creation (vv.11-17): Knowing therefore the terror of the Lord we persuade men but we are made manifest unto God and I trust also are made manifest in your consciences for the love of Christ constraineth us because we thus judge that if one died for all then were all dead and that he died for all that they which live should not henceforth live unto themselves but unto him which died for them and rose again; therefore if any man be in Christ he is a new creature old things are passed away behold all things are become new","The Ministry of Reconciliation and the Great Exchange (vv.18-21): And all things are of God who hath reconciled us to himself by Jesus Christ and hath given to us the ministry of reconciliation to wit that God was in Christ reconciling the world unto himself not imputing their trespasses unto them and hath committed unto us the word of reconciliation; now then we are ambassadors for Christ as though God did beseech you by us we pray you in Christ''s stead be ye reconciled to God; for he hath made him to be sin for us who knew no sin that we might be made the righteousness of God in him"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'For we know that if our earthly house of this tabernacle were dissolved, we have a building of God, an house not made with hands, eternal in the heavens.',
   'οἴδαμεν γὰρ ὅτι ἐὰν ἡ ἐπίγειος ἡμῶν οἰκία τοῦ σκήνους καταλυθῇ οἰκοδομὴν ἐκ θεοῦ ἔχομεν οἰκίαν ἀχειροποίητον αἰώνιον ἐν τοῖς οὐρανοῖς',
   'oidamen gar hoti ean hē epigeios hēmōn oikia tou skēnous katalythē oikodomēn ek theou echomen oikian acheiropoiēton aiōnion en tois ouranois',
   '''We know'' (oidamen — settled, confident knowledge). ''Earthly house of this tabernacle'' (epigeios oikia tou skēnous — the earthly house which is a tent; the body is a temporary shelter, a tent pitched for a season). ''Dissolved'' (katalythē — taken down, dismantled; as a tent is struck). ''Building of God'' (oikodomēn ek theou — a construction from God). ''Not made with hands'' (acheiropoiēton — not manufactured by human effort; applied to the resurrection body, it denotes its supernatural origin). ''Eternal in the heavens'' — in contrast to the temporary earthly tent. Paul moves from the crumbling clay vessel (4:7) to the dissolving tent, but the destination is a permanent dwelling.',
   'This verse transitions from the ''earthen vessel'' metaphor (4:7) to a new architectural image: the body as a tent versus the resurrection body as a permanent building. The ''tabernacle'' (skēnos) deliberately echoes the OT tabernacle — a portable, temporary dwelling for the wilderness journey. The resurrection body is ''not made with hands'' (acheiropoiēton), the same term used for Christ''s resurrection body in contrast to the temple (Mark 14:58). Paul does not despise the body but looks forward to its transformation.'),
  (2, 'For in this we groan, earnestly desiring to be clothed upon with our house which is from heaven:',
   'καὶ γὰρ ἐν τούτῳ στενάζομεν τὸ οἰκητήριον ἡμῶν τὸ ἐξ οὐρανοῦ ἐπενδύσασθαι ἐπιποθοῦντες',
   'kai gar en toutō stenazomen to oikētērion hēmōn to ex ouranou ependysasthai epipothountes',
   '''Groan'' (stenazomen — sigh deeply, groan with longing). ''Clothed upon'' (ependysasthai — to put on over, to be clothed on top of the existing garment; the epi- prefix suggests putting the heavenly body over the earthly one, not replacing one with the other). ''Earnestly desiring'' (epipothountes — longing intensely). The groaning is not mere complaint but eschatological longing — the pull of the future glory on the present body.',
   NULL),
  (3, 'If so be that being clothed we shall not be found naked.',
   'εἴ γε καὶ ἐνδυσάμενοι οὐ γυμνοὶ εὑρεθησόμεθα',
   'ei ge kai endysamenoi ou gymnoi heurethēsometha',
   '''Naked'' (gymnoi — without a body, disembodied). Paul does not desire disembodiment (the Greek philosophical ideal of the soul escaping the body) but transformation — the earthly body clothed with the heavenly. To be ''naked'' would be to exist as a disembodied soul, which Paul views not as liberation but as an incomplete state. Christian hope is not escape from the body but resurrection of the body.',
   NULL),
  (4, 'For we that are in this tabernacle do groan, being burdened: not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life.',
   'καὶ γὰρ οἱ ὄντες ἐν τῷ σκήνει στενάζομεν βαρούμενοι ἐφ᾿ ᾧ οὐ θέλομεν ἐκδύσασθαι ἀλλ᾿ ἐπενδύσασθαι ἵνα καταποθῇ τὸ θνητὸν ὑπὸ τῆς ζωῆς',
   'kai gar hoi ontes en tō skēnei stenazomen baroumenoi eph'' hō ou thelomen ekdysasthai all'' ependysasthai hina katapothē to thnēton hypo tēs zōēs',
   '''Burdened'' (baroumenoi — weighed down). ''Unclothed'' (ekdysasthai — to be stripped, to take off). ''Clothed upon'' (ependysasthai — to put on over). ''Mortality swallowed up of life'' (katapothē to thnēton hypo tēs zōēs — mortality devoured by life; cf. 1 Cor 15:54: ''Death is swallowed up in victory''). Paul''s desire is not death (being unclothed) but transformation (being clothed upon) — the living hope of believers at the parousia who will be transformed without dying (1 Thess 4:17).',
   NULL),
  (5, 'Now he that hath wrought us for the selfsame thing is God, who also hath given unto us the earnest of the Spirit.',
   'ὁ δὲ κατεργασάμενος ἡμᾶς εἰς αὐτὸ τοῦτο θεός ὁ καὶ δοὺς ἡμῖν τὸν ἀρραβῶνα τοῦ πνεύματος',
   'ho de katergasamenos hēmas eis auto touto theos ho kai dous hēmin ton arrabōna tou pneumatos',
   '''Wrought us'' (katergasamenos — prepared, fashioned; God has been actively preparing believers for their glorified state). ''The selfsame thing'' (auto touto — this very purpose: the swallowing up of mortality by life). ''Earnest of the Spirit'' (arrabōna tou pneumatos — the down payment which is the Spirit; cf. 1:22). The Spirit''s present work in the believer is both a taste of future glory and a legal guarantee of its completion. God does not merely promise transformation; he has already begun it.',
   NULL),
  (6, 'Therefore we are always confident, knowing that, whilst we are at home in the body, we are absent from the Lord:',
   'θαρροῦντες οὖν πάντοτε καὶ εἰδότες ὅτι ἐνδημοῦντες ἐν τῷ σώματι ἐκδημοῦμεν ἀπὸ τοῦ κυρίου',
   'tharrountes oun pantote kai eidotes hoti endēmountes en tō sōmati ekdēmoumen apo tou kyriou',
   '''Confident'' (tharrountes — bold, courageous; a rare word in Paul). ''At home in the body'' (endēmountes en tō sōmati — dwelling at home in the body). ''Absent from the Lord'' (ekdēmoumen apo tou kyriou — away from home from the Lord). The metaphor of ''home'' shifts: the body is our current residence, but our true home is with the Lord. While embodied in the present age, we are in a sense away from our ultimate home.',
   NULL),
  (7, '(For we walk by faith, not by sight:)',
   'διὰ πίστεως γὰρ περιπατοῦμεν οὐ διὰ εἴδους',
   'dia pisteōs gar peripatoumen ou dia eidous',
   '''Walk by faith'' (dia pisteōs peripatoumen — we conduct our lives through faith). ''Not by sight'' (ou dia eidous — not through appearance/form; eidos means visible form, outward appearance). The present age is the age of faith, not sight. We cannot yet see the heavenly dwelling, the resurrection body, or the Lord face to face — but we live as though we can, because faith is the substance of things hoped for (Heb 11:1). This parenthetical statement is one of the most succinct definitions of the Christian life in all Scripture.',
   NULL),
  (8, 'We are confident, I say, and willing rather to be absent from the body, and to be present with the Lord.',
   'θαρροῦμεν δὲ καὶ εὐδοκοῦμεν μᾶλλον ἐκδημῆσαι ἐκ τοῦ σώματος καὶ ἐνδημῆσαι πρὸς τὸν κύριον',
   'tharroumen de kai eudokoumen mallon ekdēmēsai ek tou sōmatos kai endēmēsai pros ton kyrion',
   '''Willing rather'' (eudokoumen mallon — we actually prefer, we are well pleased rather). ''Absent from the body'' (ekdēmēsai ek tou sōmatos — to emigrate from the body). ''Present with the Lord'' (endēmēsai pros ton kyrion — to be at home with the Lord). Paul''s preference: to leave this body and be with the Lord. This implies immediate conscious fellowship with Christ after death — not soul sleep or an intermediate unconscious state. The intermediate state, while not the final resurrection, is nevertheless ''with the Lord.''',
   NULL),
  (9, 'Wherefore we labour, that, whether present or absent, we may be accepted of him.',
   'διὸ καὶ φιλοτιμούμεθα εἴτε ἐνδημοῦντες εἴτε ἐκδημοῦντες εὐάρεστοι αὐτῷ εἶναι',
   'dio kai philotimoumetha eite endēmountes eite ekdēmountes euarestoi autō einai',
   '''Labour'' (philotimoumetha — we make it our ambition, we are zealous; from philos + timē, ''love of honour'': Paul''s ambition is to be pleasing to Christ). ''Accepted'' (euarestoi — well-pleasing, acceptable). ''Whether present or absent'' — whether in the body or with the Lord, Paul''s single aim is to please Christ. This ambition transcends death itself: even dying does not change the goal.',
   NULL),
  (10, 'For we must all appear before the judgment seat of Christ; that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.',
   'τοὺς γὰρ πάντας ἡμᾶς φανερωθῆναι δεῖ ἔμπροσθεν τοῦ βήματος τοῦ Χριστοῦ ἵνα κομίσηται ἕκαστος τὰ διὰ τοῦ σώματος πρὸς ἃ ἔπραξεν εἴτε ἀγαθὸν εἴτε κακόν',
   'tous gar pantas hēmas phanerōthēnai dei emprosthen tou bēmatos tou Christou hina komisētai hekastos ta dia tou sōmatos pros ha epraxen eite agathon eite kakon',
   '''Appear'' (phanerōthēnai — to be made manifest, laid bare; stronger than merely ''appearing'' — our true selves will be exposed). ''Judgment seat'' (bēmatos — the raised platform where a Roman magistrate sat to render verdicts; in Corinth, the bēma was a prominent civic landmark). ''Of Christ'' — Christ is the judge. ''Receive'' (komisētai — to receive back, to be recompensed). ''Good or bad'' (agathon ē kakon — good or worthless). Every action performed ''through the body'' (dia tou sōmatos) will be evaluated. This is not a judgment of salvation (which is by grace through faith) but of works and faithfulness.',
   'The judgment seat (bēma) of Christ is distinct from the Great White Throne judgment (Rev 20:11-15). Believers will not be condemned (Rom 8:1) but will be evaluated for the quality of their service (1 Cor 3:12-15). The bēma was a familiar image in Corinth — the raised stone platform where Gallio judged Paul (Acts 18:12-17). The judgment is comprehensive (''all''), individual (''every one''), bodily (''things done in his body''), and moral (''good or bad''). This is the ultimate motivation for the ''labour'' of v.9 — accountability before Christ.'),
  (11, 'Knowing therefore the terror of the Lord, we persuade men; but we are made manifest unto God; and I trust also are made manifest in your consciences.',
   'εἰδότες οὖν τὸν φόβον τοῦ κυρίου ἀνθρώπους πείθομεν θεῷ δὲ πεφανερώμεθα ἐλπίζω δὲ καὶ ἐν ταῖς συνειδήσεσιν ὑμῶν πεφανερῶσθαι',
   'eidotes oun ton phobon tou kyriou anthrōpous peithomen theō de pephanerōmetha elpizō de kai en tais syneidēsesin hymōn pephanerōsthai',
   '''Terror of the Lord'' (ton phobon tou kyriou — the fear of the Lord; reverential awe before Christ the Judge). ''We persuade men'' (anthrōpous peithomen — we seek to convince, to win over). ''Made manifest unto God'' (theō pephanerōmetha — we stand fully known before God; perfect tense: our character has been laid bare and remains open). The fear of standing before Christ''s judgment seat drives Paul''s evangelistic urgency. The verb ''persuade'' shows that gospel ministry is rational appeal, not manipulation.',
   NULL),
  (12, 'For we commend not ourselves again unto you, but give you occasion to glory on our behalf, that ye may have somewhat to answer them which glory in appearance, and not in heart.',
   'οὐ γὰρ πάλιν ἑαυτοὺς συνιστάνομεν ὑμῖν ἀλλὰ ἀφορμὴν διδόντες ὑμῖν καυχήματος ὑπὲρ ἡμῶν ἵνα ἔχητε πρὸς τοὺς ἐν προσώπῳ καυχωμένους καὶ οὐ καρδίᾳ',
   'ou gar palin heautous synistanomen hymin alla aphormēn didontes hymin kauchēmatos hyper hēmōn hina echēte pros tous en prosōpō kauchōmenous kai ou kardia',
   '''Occasion to glory'' (aphormēn kauchēmatos — a basis for boasting). ''Glory in appearance, and not in heart'' (en prosōpō kauchōmenous kai ou kardia — boasting in face/outward show, not in heart/inner reality). Paul provides ammunition for the loyal Corinthians to answer his critics. The opponents boast in externals — credentials, eloquence, letters of recommendation; Paul boasts in heart-reality, integrity, and suffering for Christ.',
   NULL),
  (13, 'For whether we be beside ourselves, it is to God: or whether we be sober, it is for your cause.',
   'εἴτε γὰρ ἐξέστημεν θεῷ εἴτε σωφρονοῦμεν ὑμῖν',
   'eite gar exestēmen theō eite sōphronoumen hymin',
   '''Beside ourselves'' (exestēmen — out of our mind, ecstatic; from existēmi, to stand outside oneself). ''Sober'' (sōphronoumen — of sound mind, rational). Some critics apparently accused Paul of being mentally unhinged. Paul responds: if he is ecstatic, it is directed toward God; if he is rational, it is for the Corinthians'' benefit. Either way, his orientation is outward: toward God in worship, toward others in service.',
   NULL),
  (14, 'For the love of Christ constraineth us; because we thus judge, that if one died for all, then were all dead:',
   'ἡ γὰρ ἀγάπη τοῦ Χριστοῦ συνέχει ἡμᾶς κρίναντας τοῦτο ὅτι εἰ εἷς ὑπὲρ πάντων ἀπέθανεν ἄρα οἱ πάντες ἀπέθανον',
   'hē gar agapē tou Christou synechei hēmas krinantas touto hoti ei heis hyper pantōn apethanen ara hoi pantes apethanon',
   '''Love of Christ'' (agapē tou Christou — Christ''s love for us, or our love for Christ; probably primarily Christ''s love that motivates Paul). ''Constraineth'' (synechei — holds together, compels, presses from all sides; from synechō, to squeeze together; the same root as ''anguish'' in 2:4). ''One died for all'' (heis hyper pantōn apethanen — one person died on behalf of all). ''Then were all dead'' (ara hoi pantes apethanon — therefore all died). The logic: Christ''s death was representative — when he died, all died in him. His death is their death.',
   'This verse contains a compact statement of substitutionary atonement and its implications. The logic is: (1) One died for all — Christ''s death was vicarious, on behalf of the entire human race. (2) Therefore all died — Christ''s death was representative; those he died for are considered to have died with him. The ''all'' in both clauses must be coextensive: the same ''all'' for whom Christ died are the ''all'' who died in him. This union with Christ in death is the foundation for the new life described in v.15 and the new creation of v.17.'),
  (15, 'And that he died for all, that they which live should not henceforth live unto themselves, but unto him which died for them, and rose again.',
   'καὶ ὑπὲρ πάντων ἀπέθανεν ἵνα οἱ ζῶντες μηκέτι ἑαυτοῖς ζῶσιν ἀλλὰ τῷ ὑπὲρ αὐτῶν ἀποθανόντι καὶ ἐγερθέντι',
   'kai hyper pantōn apethanen hina hoi zōntes mēketi heautois zōsin alla tō hyper autōn apothanonti kai egerthenti',
   '''They which live'' (hoi zōntes — the living, those who have been made alive through Christ''s death and resurrection). ''Not … live unto themselves'' (mēketi heautois zōsin — no longer live for themselves; the old self-oriented life is ended). ''Unto him which died for them, and rose again'' — the new orientation: life directed toward the risen Christ. Christ''s death and resurrection not only save from penalty but redirect the entire trajectory of life. Self is no longer the center; Christ is.',
   NULL),
  (16, 'Wherefore henceforth know we no man after the flesh: yea, though we have known Christ after the flesh, yet now henceforth know we him no more.',
   'ὥστε ἡμεῖς ἀπὸ τοῦ νῦν οὐδένα οἴδαμεν κατὰ σάρκα εἰ δὲ καὶ ἐγνώκαμεν κατὰ σάρκα Χριστόν ἀλλὰ νῦν οὐκέτι γινώσκομεν',
   'hōste hēmeis apo tou nyn oudena oidamen kata sarka ei de kai egnōkamen kata sarka Christon alla nyn ouketi ginōskomen',
   '''After the flesh'' (kata sarka — according to the flesh; by worldly standards, by external criteria). ''Know we no man after the flesh'' — since all died with Christ (v.14), the old categories of evaluation (status, ethnicity, credentials, appearance) are obsolete. ''Known Christ after the flesh'' — possibly Paul once evaluated Jesus by worldly criteria (as a failed Messiah); now he knows Christ as risen Lord. The resurrection has reordered all epistemology: everything and everyone must now be evaluated in light of the cross and resurrection.',
   NULL),
  (17, 'Therefore if any man be in Christ, he is a new creature: old things are passed away; behold, all things are become new.',
   'ὥστε εἴ τις ἐν Χριστῷ καινὴ κτίσις τὰ ἀρχαῖα παρῆλθεν ἰδοὺ γέγονεν καινά',
   'hōste ei tis en Christō kainē ktisis ta archaia parēlthen idou gegonen kaina',
   '''In Christ'' (en Christō — in union with Christ; the foundational Pauline formula for the believer''s position). ''New creature'' (kainē ktisis — new creation; kainē means new in quality, not merely new in time; ktisis means creation, the act and result of creating). ''Old things are passed away'' (ta archaia parēlthen — the ancient things have gone; the old order is obsolete). ''All things are become new'' (gegonen kaina — perfect tense: have become and remain new). Union with Christ inaugurates a new creation — not merely moral improvement but ontological newness. The believer participates in the new creation that began with Christ''s resurrection.',
   'This is one of the most important verses in Pauline theology. ''New creation'' (kainē ktisis) is not merely personal regeneration but cosmic eschatology applied to the individual. In Christ, the new age has already begun. The believer is the first installment of the new creation that God will bring to completion when Christ returns. ''Old things have passed away'' refers to the old order of existence — the old self, the old evaluations (v.16), the old bondage to sin and death. ''Behold, all things are become new'' is the language of Isaiah 43:18-19 and 65:17 applied to the present experience of those in Christ. New creation is the theological center of the entire epistle.'),
  (18, 'And all things are of God, who hath reconciled us to himself by Jesus Christ, and hath given to us the ministry of reconciliation;',
   'τὰ δὲ πάντα ἐκ τοῦ θεοῦ τοῦ καταλλάξαντος ἡμᾶς ἑαυτῷ διὰ Ἰησοῦ Χριστοῦ καὶ δόντος ἡμῖν τὴν διακονίαν τῆς καταλλαγῆς',
   'ta de panta ek tou theou tou katallaxantos hēmas heautō dia Iēsou Christou kai dontos hēmin tēn diakonian tēs katallagēs',
   '''All things are of God'' (ta panta ek tou theou — everything originates from God; new creation is entirely God''s initiative). ''Reconciled us to himself'' (katallaxantos hēmas heautō — having reconciled us to himself; God is the subject, we are the object). ''By Jesus Christ'' (dia Iēsou Christou — through Jesus Christ as the agent). ''Ministry of reconciliation'' (diakonian tēs katallagēs — the service/task of reconciliation entrusted to apostles and, by extension, to all believers). God reconciles; the church announces the reconciliation.',
   NULL),
  (19, 'To wit, that God was in Christ, reconciling the world unto himself, not imputing their trespasses unto them; and hath committed unto us the word of reconciliation.',
   'ὡς ὅτι θεὸς ἦν ἐν Χριστῷ κόσμον καταλλάσσων ἑαυτῷ μὴ λογιζόμενος αὐτοῖς τὰ παραπτώματα αὐτῶν καὶ θέμενος ἐν ἡμῖν τὸν λόγον τῆς καταλλαγῆς',
   'hōs hoti theos ēn en Christō kosmon katallassōn heautō mē logizomenos autois ta paraptōmata autōn kai themenos en hēmin ton logon tēs katallagēs',
   '''God was in Christ'' (theos ēn en Christō — God was in Christ; this can be parsed as ''God was-in-Christ reconciling'' or ''God was, in Christ, reconciling''). ''Reconciling the world'' (kosmon katallassōn — changing the world''s relation to himself). ''Not imputing'' (mē logizomenos — not reckoning, not counting against them; a bookkeeping term: God does not enter their trespasses on the debit side of the ledger). ''Trespasses'' (paraptōmata — false steps, transgressions, lapses). ''Word of reconciliation'' (logon tēs katallagēs — the message about reconciliation). The scope is universal (''the world''); the method is non-imputation of sins; the vehicle is the entrusted message.',
   'This verse defines reconciliation with precision: it is God''s act of not counting human sins against them. The initiative is entirely God''s — the world did not reconcile itself to God. ''Not imputing their trespasses'' does not mean sins are overlooked (v.21 explains how sins are dealt with) but that they are charged to another account — Christ''s. The ''word of reconciliation'' committed to the church is the announcement of what God has already accomplished: reconciliation is not something humans achieve but something they receive and proclaim.'),
  (20, 'Now then we are ambassadors for Christ, as though God did beseech you by us: we pray you in Christ''s stead, be ye reconciled to God.',
   'ὑπὲρ Χριστοῦ οὖν πρεσβεύομεν ὡς τοῦ θεοῦ παρακαλοῦντος δι᾿ ἡμῶν δεόμεθα ὑπὲρ Χριστοῦ καταλλάγητε τῷ θεῷ',
   'hyper Christou oun presbeuomen hōs tou theou parakalountos di'' hēmōn deometha hyper Christou katallagēte tō theō',
   '''Ambassadors'' (presbeuomen — we function as ambassadors; a presbeutes was an official envoy representing the authority of the sender). ''For Christ'' (hyper Christou — on behalf of Christ, as Christ''s representative). ''As though God did beseech'' (hōs tou theou parakalountos — as God making his appeal through us). ''We pray you'' (deometha — we beg, we implore). ''Be ye reconciled'' (katallagēte — be reconciled; aorist passive imperative: receive the reconciliation that God has accomplished). The staggering image: God himself pleads with sinners through his human ambassadors. The Creator implores the creature.',
   'This verse reveals the astonishing humility of God in the gospel: God does not issue reconciliation as a cold decree but beseeches, implores, and pleads through his ambassadors. The verb ''beseech'' (parakalountos) and ''pray'' (deometha) convey earnest, emotional appeal. The God who owes nothing to rebels actively entreats them to receive his grace. ''Be ye reconciled'' is passive: the action was accomplished by God in Christ; the sinner''s role is to receive it. The ambassador speaks ''in Christ''s stead'' — with Christ''s authority and in Christ''s place.'),
  (21, 'For he hath made him to be sin for us, who knew no sin; that we might be made the righteousness of God in him.',
   'τὸν γὰρ μὴ γνόντα ἁμαρτίαν ὑπὲρ ἡμῶν ἁμαρτίαν ἐποίησεν ἵνα ἡμεῖς γενώμεθα δικαιοσύνη θεοῦ ἐν αὐτῷ',
   'ton gar mē gnonta hamartian hyper hēmōn hamartian epoiēsen hina hēmeis genōmetha dikaiosynē theou en autō',
   '''Him who knew no sin'' (ton mē gnonta hamartian — the one who had no experiential knowledge of sin; Christ was sinless, never having committed or known sin). ''Made him to be sin'' (hamartian epoiēsen — made him sin; not ''a sinner'' but ''sin'' itself — God treated Christ as though he were the embodiment of sin). ''For us'' (hyper hēmōn — on our behalf, in our place). ''That we might be made the righteousness of God'' (hina hēmeis genōmetha dikaiosynē theou — so that we might become God''s own righteousness; not merely ''righteous'' but ''the righteousness of God'' itself). ''In him'' (en autō — in union with Christ). The great exchange: Christ takes our sin; we receive God''s righteousness.',
   'This is arguably the single most important verse in the Bible on the doctrine of imputation and the theology of the atonement. Three truths converge: (1) Christ''s sinlessness — ''who knew no sin'': this is essential; only a sinless substitute can bear the sins of others. (2) Penal substitution — ''made him to be sin for us'': God treated Christ as though he were sin itself, bearing the full penalty of human rebellion. (3) Imputed righteousness — ''that we might be made the righteousness of God in him'': believers receive not merely forgiveness but the positive righteousness of God credited to their account. The symmetry is precise: as our sin was imputed to Christ (who had none), so his righteousness is imputed to us (who have none). This is the ''great exchange'' — the heart of the gospel.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 5;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 tabernacle/building
  ('σκῆνος', 'skēnos', 'G4636', 'Tent, tabernacle — the body viewed as a temporary dwelling. From skēnē (tent), evoking the wilderness tabernacle. The body is not the believer''s permanent home but a portable shelter for the earthly pilgrimage. When it is ''dissolved'' (taken down), a permanent heavenly building awaits.', 1),
  -- v.7 faith not sight
  ('εἶδος', 'eidos', 'G1491', 'Form, appearance, visible shape — that which is seen with the eyes. The Christian life is conducted by faith (trust in the unseen) rather than by eidos (reliance on visible evidence). This does not mean faith is irrational but that it transcends the limits of physical sight.', 2),
  -- v.10 judgment seat
  ('βῆμα', 'bēma', 'G968', 'Judgment seat, tribunal, raised platform — the official seat of a Roman magistrate. In Corinth, the bēma was a prominent stone platform in the agora (Acts 18:12). Christ''s bēma is the place where believers'' works are evaluated (not their salvation) after death or at the parousia.', 3),
  -- v.14 constraineth
  ('συνέχω', 'synechō', 'G4912', 'To hold together, to constrain, to compel, to press from all sides — from syn (together) + echō (to hold). Christ''s love surrounds Paul like walls that channel his movement in one direction. The love is not a gentle nudge but a compelling force that leaves no alternative.', 4),
  -- v.17 new creature
  ('κτίσις', 'ktisis', 'G2937', 'Creation, creature, the act and result of creating — in Christ, the believer is a new creation. This is not merely moral improvement but an ontological new beginning, the first installment of the new creation that God will bring to cosmic completion. Cf. Isaiah 65:17, Galatians 6:15, Revelation 21:5.', 5),
  -- v.18 reconciliation
  ('καταλλαγή', 'katallagē', 'G2643', 'Reconciliation — the restoration of a broken relationship, the exchange of enmity for friendship. From katallassō (to change, to exchange). God is the reconciler; the world is reconciled; and the church announces the accomplished reconciliation. The word implies that the relationship was genuinely broken and genuinely restored.', 6),
  -- v.20 ambassador
  ('πρεσβεύω', 'presbeuō', 'G4243', 'To be an ambassador, to function as an envoy — from presbus (elder, senior). In the Roman world, a presbeutes represented the emperor''s authority in a province. Paul represents Christ''s authority: he speaks on behalf of Christ, with Christ''s message, under Christ''s commission.', 7),
  -- v.21 righteousness
  ('δικαιοσύνη', 'dikaiosynē', 'G1343', 'Righteousness — right standing before God, conformity to God''s character and requirements. ''The righteousness of God'' is not merely a quality believers possess but God''s own righteousness credited to their account through union with Christ. This is the apex of imputation theology: we become what God is — righteous — in Christ.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 5
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 7
    WHEN 3 THEN 10
    WHEN 4 THEN 14
    WHEN 5 THEN 17
    WHEN 6 THEN 18
    WHEN 7 THEN 20
    WHEN 8 THEN 21
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 earthly tent / heavenly building
  (1, '2 Peter 1:13-14', 1),
  (1, 'John 14:2', 2),
  (1, '1 Corinthians 15:42-44', 3),
  -- v.4 mortality swallowed by life
  (4, '1 Corinthians 15:53-54', 4),
  (4, 'Romans 8:23', 5),
  -- v.5 earnest of the Spirit
  (5, '2 Corinthians 1:22', 6),
  (5, 'Ephesians 1:13-14', 7),
  -- v.7 walk by faith
  (7, 'Hebrews 11:1', 8),
  (7, 'Romans 8:24-25', 9),
  -- v.8 absent from body, present with Lord
  (8, 'Philippians 1:21-23', 10),
  (8, 'Luke 23:43', 11),
  -- v.10 judgment seat
  (10, 'Romans 14:10-12', 12),
  (10, '1 Corinthians 3:12-15', 13),
  (10, 'Matthew 16:27', 14),
  -- v.14 love of Christ constrains
  (14, 'Romans 5:6-8', 15),
  (14, 'Galatians 2:20', 16),
  -- v.17 new creature
  (17, 'Galatians 6:15', 17),
  (17, 'Isaiah 43:18-19', 18),
  (17, 'Revelation 21:5', 19),
  (17, 'Ephesians 2:10', 20),
  -- v.19 God reconciling the world
  (19, 'Romans 5:10-11', 21),
  (19, 'Colossians 1:19-22', 22),
  -- v.20 ambassadors
  (20, 'Ephesians 6:20', 23),
  -- v.21 made sin / made righteousness
  (21, 'Isaiah 53:4-6', 24),
  (21, 'Romans 3:21-26', 25),
  (21, '1 Peter 2:24', 26),
  (21, 'Galatians 3:13', 27),
  (21, 'Romans 5:19', 28)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 5
  AND v.verse_number = cr.verse_number;
