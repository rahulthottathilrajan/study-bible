-- ═══════════════════════════════════════════════════
-- EPHESIANS CHAPTER 5 — Walk in Love, Light, and Wisdom
-- 33 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Ephesians 5 continues the practical exhortation begun in chapter 4 with three commands to ''walk'': walk in love (vv.1-7), walk in light (vv.8-14), and walk in wisdom (vv.15-21). Paul begins: ''Be ye therefore followers of God, as dear children; and walk in love, as Christ also hath loved us, and hath given himself for us an offering and a sacrifice to God for a sweetsmelling savour'' (vv.1-2). Sexual immorality, covetousness, and foolish speech are forbidden among saints (vv.3-4). Believers were ''sometimes darkness, but now are ye light in the Lord: walk as children of light'' (v.8). ''Awake thou that sleepest, and arise from the dead, and Christ shall give thee light'' (v.14). ''See then that ye walk circumspectly, not as fools, but as wise, redeeming the time'' (vv.15-16). Instead of drunkenness, believers should be ''filled with the Spirit; speaking to yourselves in psalms and hymns and spiritual songs'' (vv.18-19). The chapter then addresses the marriage relationship as an image of Christ and the church: ''Wives, submit yourselves unto your own husbands, as unto the Lord'' (v.22); ''Husbands, love your wives, even as Christ also loved the church, and gave himself for it'' (v.25). The goal is that Christ might ''present it to himself a glorious church, not having spot, or wrinkle'' (v.27). Paul concludes: ''This is a great mystery: but I speak concerning Christ and the church'' (v.32).',
  'Walk in Love, Light, and Wisdom — Christ and the Church',
  'ἀγάπη (agapē)',
  'Love — the self-sacrificing love modelled by Christ''s offering of himself (v.2) and the standard for the husband-wife relationship (v.25). This chapter presents Christ''s love as the pattern for every relationship: love that gives itself up, that purifies, that nourishes and cherishes.',
  '["Walk in Love (vv.1-7): Be ye therefore followers of God as dear children and walk in love as Christ also hath loved us and hath given himself for us an offering and a sacrifice to God for a sweetsmelling savour; but fornication and all uncleanness or covetousness let it not be once named among you as becometh saints; for this ye know that no whoremonger nor unclean person nor covetous man who is an idolater hath any inheritance in the kingdom of Christ and of God","Walk as Children of Light (vv.8-14): For ye were sometimes darkness but now are ye light in the Lord walk as children of light for the fruit of the Spirit is in all goodness and righteousness and truth; and have no fellowship with the unfruitful works of darkness but rather reprove them; wherefore he saith awake thou that sleepest and arise from the dead and Christ shall give thee light","Walk in Wisdom and the Spirit (vv.15-21): See then that ye walk circumspectly not as fools but as wise redeeming the time because the days are evil; and be not drunk with wine wherein is excess but be filled with the Spirit; speaking to yourselves in psalms and hymns and spiritual songs singing and making melody in your heart to the Lord; giving thanks always for all things; submitting yourselves one to another in the fear of God","Marriage as a Picture of Christ and the Church (vv.22-33): Wives submit yourselves unto your own husbands as unto the Lord; for the husband is the head of the wife even as Christ is the head of the church; husbands love your wives even as Christ also loved the church and gave himself for it that he might sanctify and cleanse it; that he might present it to himself a glorious church not having spot or wrinkle or any such thing; this is a great mystery but I speak concerning Christ and the church"]'
FROM books b WHERE b.name = 'Ephesians';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Be ye therefore followers of God, as dear children;',
   'γίνεσθε οὖν μιμηταὶ τοῦ θεοῦ ὡς τέκνα ἀγαπητά',
   'ginesthe oun mimētai tou theou hōs tekna agapēta',
   '''Followers'' (mimētai — imitators, mimics; the root of ''mimic''). ''Of God'' (tou theou — imitate God himself). ''As dear children'' (hōs tekna agapēta — as beloved children). Children naturally imitate their parents. Since believers are God''s beloved children (1:5), they should imitate their Father. The ''therefore'' (oun) connects to 4:32: because God has forgiven you, now imitate his character.',
   NULL),
  (2, 'And walk in love, as Christ also hath loved us, and hath given himself for us an offering and a sacrifice to God for a sweetsmelling savour.',
   'καὶ περιπατεῖτε ἐν ἀγάπῃ καθὼς καὶ ὁ Χριστὸς ἠγάπησεν ἡμᾶς καὶ παρέδωκεν ἑαυτὸν ὑπὲρ ἡμῶν προσφορὰν καὶ θυσίαν τῷ θεῷ εἰς ὀσμὴν εὐωδίας',
   'kai peripateite en agapē kathōs kai ho Christos ēgapēsen hēmas kai paredōken heauton hyper hēmōn prosphoran kai thysian tō theō eis osmēn euōdias',
   '''Walk in love'' (peripateite en agapē — make love your habitual lifestyle). ''Hath given himself'' (paredōken heauton — delivered himself over, surrendered himself). ''Offering and sacrifice'' (prosphoran kai thysian — a gift-offering and a slain sacrifice). ''Sweetsmelling savour'' (osmēn euōdias — a fragrant aroma; OT sacrificial language, Gen 8:21, Lev 1:9). Christ''s death was simultaneously an act of love toward us and a fragrant offering to God. The cross is the supreme example of self-giving love.',
   NULL),
  (3, 'But fornication, and all uncleanness, or covetousness, let it not be once named among you, as becometh saints;',
   'πορνεία δὲ καὶ πᾶσα ἀκαθαρσία ἢ πλεονεξία μηδὲ ὀνομαζέσθω ἐν ὑμῖν καθὼς πρέπει ἁγίοις',
   'porneia de kai pasa akatharsia ē pleonexia mēde onomazesthō en hymin kathōs prepei hagiois',
   '''Fornication'' (porneia — sexual immorality of any kind). ''Uncleanness'' (akatharsia — moral impurity, filthiness). ''Covetousness'' (pleonexia — greed, insatiable desire to have more). ''Not be once named'' (mēde onomazesthō — not even mentioned, not even a topic of conversation). ''As becometh saints'' (kathōs prepei hagiois — as is fitting for holy ones). These sins are so incompatible with holiness that they should not even be discussed casually among God''s people.',
   NULL),
  (4, 'Neither filthiness, nor foolish talking, nor jesting, which are not convenient: but rather giving of thanks.',
   'καὶ αἰσχρότης καὶ μωρολογία ἢ εὐτραπελία τὰ οὐκ ἀνήκοντα ἀλλὰ μᾶλλον εὐχαριστία',
   'kai aischrotēs kai mōrologia ē eutrapelia ta ouk anēkonta alla mallon eucharistia',
   '''Filthiness'' (aischrotēs — obscenity, shameful conduct). ''Foolish talking'' (mōrologia — silly talk, speech of a moron). ''Jesting'' (eutrapelia — coarse joking, vulgar wit; literally ''easily turning,'' the ability to turn anything into a crude joke). ''Not convenient'' (ouk anēkonta — not fitting, not appropriate). ''Giving of thanks'' (eucharistia — thanksgiving; a wordplay: eutrapelia is replaced by eucharistia). Gratitude replaces crude humour as the proper use of speech.',
   NULL),
  (5, 'For this ye know, that no whoremonger, nor unclean person, nor covetous man, who is an idolater, hath any inheritance in the kingdom of Christ and of God.',
   'τοῦτο γάρ ἐστε γινώσκοντες ὅτι πᾶς πόρνος ἢ ἀκάθαρτος ἢ πλεονέκτης ὅς ἐστιν εἰδωλολάτρης οὐκ ἔχει κληρονομίαν ἐν τῇ βασιλείᾳ τοῦ Χριστοῦ καὶ θεοῦ',
   'touto gar este ginōskontes hoti pas pornos ē akathartos ē pleonektēs hos estin eidōlolatrēs ouk echei klēronomian en tē basileia tou Christou kai theou',
   '''Covetous man, who is an idolater'' (pleonektēs hos estin eidōlolatrēs — covetousness is equated with idolatry; the greedy person worships the creation rather than the Creator). ''No inheritance in the kingdom'' — this is not about losing salvation through occasional sin but about the settled character of the unrepentant: those whose lives are defined by these sins show they have no part in the kingdom. ''Of Christ and of God'' (tou Christou kai theou — placing Christ and God together as joint rulers of one kingdom).',
   NULL),
  (6, 'Let no man deceive you with vain words: for because of these things cometh the wrath of God upon the children of disobedience.',
   'μηδεὶς ὑμᾶς ἀπατάτω κενοῖς λόγοις διὰ γὰρ ταῦτα ἔρχεται ἡ ὀργὴ τοῦ θεοῦ ἐπὶ τοὺς υἱοὺς τῆς ἀπειθείας',
   'mēdeis hymas apatatō kenois logois dia gar tauta erchetai hē orgē tou theou epi tous huious tēs apeitheias',
   '''Vain words'' (kenois logois — empty words, hollow speech; those who minimise sin''s seriousness or explain away God''s judgment). ''Wrath of God'' (orgē tou theou — God''s settled, righteous anger against sin). ''Children of disobedience'' (huious tēs apeitheias — those characterised by disobedience as their defining trait). Paul warns against false teachers who claim that grace permits immorality.',
   NULL),
  (7, 'Be not ye therefore partakers with them.',
   'μὴ οὖν γίνεσθε συμμέτοχοι αὐτῶν',
   'mē oun ginesthe symmetochoi autōn',
   '''Partakers'' (symmetochoi — co-participants, partners, sharers). The command is simple: do not share in their lifestyle. Believers must separate themselves from the practices (not necessarily the people) of the ungodly.',
   NULL),
  (8, 'For ye were sometimes darkness, but now are ye light in the Lord: walk as children of light:',
   'ἦτε γάρ ποτε σκότος νῦν δὲ φῶς ἐν κυρίῳ ὡς τέκνα φωτὸς περιπατεῖτε',
   'ēte gar pote skotos nyn de phōs en kyriō hōs tekna phōtos peripateite',
   '''Ye were sometimes darkness'' (ēte pote skotos — you were not merely ''in darkness'' but darkness itself; you were the very embodiment of darkness). ''Now are ye light'' (nyn de phōs — now you are light itself; not merely enlightened but light). ''In the Lord'' (en kyriō — the transformation happens in union with Christ). ''Children of light'' (tekna phōtos — offspring of light; light is their parentage and nature). The transformation is ontological: from being darkness to being light.',
   'From darkness to light: The language is remarkable — not ''in the dark'' but ''darkness,'' not ''in the light'' but ''light.'' Believers do not merely receive illumination; they become luminous. This is identity language: what you are determines how you walk. The imperative (walk as children of light) is grounded in the indicative (you are light). Live consistently with what you have become in Christ.'),
  (9, '(For the fruit of the Spirit is in all goodness and righteousness and truth;)',
   'ὁ γὰρ καρπὸς τοῦ πνεύματος ἐν πάσῃ ἀγαθωσύνῃ καὶ δικαιοσύνῃ καὶ ἀληθείᾳ',
   'ho gar karpos tou pneumatos en pasē agathōsynē kai dikaiosynē kai alētheia',
   '''Fruit of the Spirit'' (some manuscripts read ''fruit of the light,'' which fits the context better; both convey the same truth). Three qualities: ''goodness'' (agathōsynē — active benevolence), ''righteousness'' (dikaiosynē — right conduct toward God and others), ''truth'' (alētheia — integrity, genuineness). These are the natural products of living in the light.',
   NULL),
  (10, 'Proving what is acceptable unto the Lord.',
   'δοκιμάζοντες τί ἐστιν εὐάρεστον τῷ κυρίῳ',
   'dokimazontes ti estin euareston tō kyriō',
   '''Proving'' (dokimazontes — testing, examining, discerning; the metallurgist''s term for testing metal). ''Acceptable'' (euareston — well-pleasing). Believers are to actively test and discern what pleases the Lord — not passive recipients of rules but active discerners of God''s will.',
   NULL),
  (11, 'And have no fellowship with the unfruitful works of darkness, but rather reprove them.',
   'καὶ μὴ συγκοινωνεῖτε τοῖς ἔργοις τοῖς ἀκάρποις τοῦ σκότους μᾶλλον δὲ καὶ ἐλέγχετε',
   'kai mē synkoinōneite tois ergois tois akarpois tou skotous mallon de kai elenchete',
   '''Fellowship'' (synkoinōneite — participate jointly in, share in). ''Unfruitful'' (akarpois — barren, producing no good fruit). ''Reprove'' (elenchete — expose, convict, bring to light; not merely verbal rebuke but the exposure of wrong by the presence of right). Darkness is exposed not just by words but by the contrasting light of a godly life.',
   NULL),
  (12, 'For it is a shame even to speak of those things which are done of them in secret.',
   'τὰ γὰρ κρυφῇ γινόμενα ὑπ᾽ αὐτῶν αἰσχρόν ἐστιν καὶ λέγειν',
   'ta gar kryphē ginomena hyp'' autōn aischron estin kai legein',
   '''In secret'' (kryphē — in hidden places, covertly). ''A shame even to speak'' (aischron estin kai legein — shameful even to mention). Some sins are so vile that detailed description would only spread contamination. Paul draws a veil of decency: expose them by living in the light, not by cataloguing them in speech.',
   NULL),
  (13, 'But all things that are reproved are made manifest by the light: for whatsoever doth make manifest is light.',
   'τὰ δὲ πάντα ἐλεγχόμενα ὑπὸ τοῦ φωτὸς φανεροῦται πᾶν γὰρ τὸ φανερούμενον φῶς ἐστιν',
   'ta de panta elenchomena hypo tou phōtos phaneroutai pan gar to phanoroumenon phōs estin',
   '''Made manifest'' (phaneroutai — made visible, brought into the open). ''Whatsoever doth make manifest is light'' — a provocative statement: light has the inherent power to reveal; whatever is exposed by the light becomes visible and may even become light itself. The implication: when darkness is exposed by light, it can be transformed — sinners can become saints, darkness can become light.',
   NULL),
  (14, 'Wherefore he saith, Awake thou that sleepest, and arise from the dead, and Christ shall give thee light.',
   'διὸ λέγει Ἔγειρε ὁ καθεύδων καὶ ἀνάστα ἐκ τῶν νεκρῶν καὶ ἐπιφαύσει σοι ὁ Χριστός',
   'dio legei Egeire ho katheudōn kai anasta ek tōn nekrōn kai epiphausei soi ho Christos',
   '''Awake thou that sleepest'' (egeire ho katheudōn — rise up, you who are sleeping). ''Arise from the dead'' (anasta ek tōn nekrōn — stand up from among the dead). ''Christ shall give thee light'' (epiphausei soi ho Christos — Christ will shine upon you). Possibly an early Christian hymn or baptismal formula. Three commands build in intensity: wake up → stand up → receive Christ''s light. This may be addressed to spiritually drowsy believers or to unbelievers being called to conversion.',
   NULL),
  (15, 'See then that ye walk circumspectly, not as fools, but as wise,',
   'Βλέπετε οὖν πῶς ἀκριβῶς περιπατεῖτε μὴ ὡς ἄσοφοι ἀλλ᾽ ὡς σοφοί',
   'Blepete oun pōs akribōs peripateite mē hōs asophoi all'' hōs sophoi',
   '''See'' (blepete — watch carefully, pay close attention). ''Circumspectly'' (akribōs — accurately, precisely, carefully; the word used of the Magi who ''diligently'' enquired about the child, Matt 2:8). ''Not as fools but as wise'' (mē hōs asophoi all'' hōs sophoi — the third ''walk'' exhortation: walk in wisdom). The wise person navigates life with careful attention to how they conduct themselves.',
   NULL),
  (16, 'Redeeming the time, because the days are evil.',
   'ἐξαγοραζόμενοι τὸν καιρόν ὅτι αἱ ἡμέραι πονηραί εἰσιν',
   'exagorazomenoi ton kairon hoti hai hēmerai ponērai eisin',
   '''Redeeming'' (exagorazomenoi — buying up, purchasing from the marketplace; making the most of). ''The time'' (ton kairon — the opportune moment, the strategic season; not chronos, clock-time, but kairos, significant time). ''The days are evil'' (hai hēmerai ponērai — the present age is morally corrupt). Because opportunities are fleeting and the times are dangerous, believers must seize every opportunity for good. Time is a commodity to be wisely invested, not passively consumed.',
   NULL),
  (17, 'Wherefore be ye not unwise, but understanding what the will of the Lord is.',
   'διὰ τοῦτο μὴ γίνεσθε ἄφρονες ἀλλὰ συνίετε τί τὸ θέλημα τοῦ κυρίου',
   'dia touto mē ginesthe aphrones alla syniete ti to thelēma tou kyriou',
   '''Unwise'' (aphrones — senseless, without understanding). ''Understanding'' (syniete — comprehend, put things together, discern). ''The will of the Lord'' (to thelēma tou kyriou). Wisdom is not intellectual brilliance but discernment of God''s will. The wise person asks not ''What do I want?'' but ''What does the Lord want?''',
   NULL),
  (18, 'And be not drunk with wine, wherein is excess; but be filled with the Spirit;',
   'καὶ μὴ μεθύσκεσθε οἴνῳ ἐν ᾧ ἐστιν ἀσωτία ἀλλὰ πληροῦσθε ἐν πνεύματι',
   'kai mē methyskesthe oinō en hō estin asōtia alla plērousthe en pneumati',
   '''Drunk with wine'' (methyskesthe oinō — do not go on getting drunk). ''Excess'' (asōtia — dissipation, debauchery, reckless wastefulness; literally ''unsaveableness''). ''Be filled with the Spirit'' (plērousthe en pneumati — present passive imperative: keep on being filled, let the Spirit keep filling you). The contrast: wine controls from without and produces degradation; the Spirit fills from within and produces worship, thanksgiving, and mutual submission (vv.19-21). The filling is not a one-time event but a continuous, repeated experience.',
   'Be filled with the Spirit: This is arguably the central command of the Christian life. The present tense (plērousthe) indicates an ongoing process: keep being filled, again and again. The passive voice indicates that the Spirit does the filling; our part is to yield and not resist. The evidence of Spirit-filling is not ecstatic experience but relational fruit: psalms, hymns, thanksgiving, and mutual submission (vv.19-21). Drunkenness is a counterfeit — it simulates spiritual exhilaration but produces only degradation.'),
  (19, 'Speaking to yourselves in psalms and hymns and spiritual songs, singing and making melody in your heart to the Lord;',
   'λαλοῦντες ἑαυτοῖς ψαλμοῖς καὶ ὕμνοις καὶ ᾠδαῖς πνευματικαῖς ᾄδοντες καὶ ψάλλοντες ἐν τῇ καρδίᾳ ὑμῶν τῷ κυρίῳ',
   'lalountes heautois psalmois kai hymnois kai ōdais pneumatikais adontes kai psallontes en tē kardia hymōn tō kyriō',
   '''Speaking to yourselves'' (lalountes heautois — addressing one another; Spirit-filling produces communal worship). ''Psalms'' (psalmois — OT psalms or compositions sung to stringed instruments). ''Hymns'' (hymnois — songs of praise directed to God). ''Spiritual songs'' (ōdais pneumatikais — Spirit-inspired songs). ''Making melody in your heart'' (psallontes en tē kardia — plucking the strings of your heart; inward, heartfelt worship). Spirit-filling produces joyful, musical, heart-engaged worship that edifies others and honours Christ.',
   NULL),
  (20, 'Giving thanks always for all things unto God and the Father in the name of our Lord Jesus Christ;',
   'εὐχαριστοῦντες πάντοτε ὑπὲρ πάντων ἐν ὀνόματι τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ τῷ θεῷ καὶ πατρί',
   'eucharistountes pantote hyper pantōn en onomati tou kyriou hēmōn Iēsou Christou tō theō kai patri',
   '''Always for all things'' (pantote hyper pantōn — at all times for all things; the scope is comprehensive). ''In the name of our Lord Jesus Christ'' — through him, on his authority, by his mediation. Spirit-filled living is characterised by radical, pervasive thankfulness — not merely for pleasant things but for ''all things,'' trusting God''s sovereignty over every circumstance.',
   NULL),
  (21, 'Submitting yourselves one to another in the fear of God.',
   'ὑποτασσόμενοι ἀλλήλοις ἐν φόβῳ Χριστοῦ',
   'hypotassomenoi allēlois en phobō Christou',
   '''Submitting'' (hypotassomenoi — arranging yourselves under, voluntarily placing yourselves in a posture of service). ''One to another'' (allēlois — mutually, reciprocally). ''In the fear of God'' (en phobō Christou — in reverence for Christ). This is the bridge verse between Spirit-filling and household instructions. Mutual submission is the general principle; the specific applications follow in 5:22-6:9. Submission is not about inferiority but about Christ-like service.',
   NULL),
  (22, 'Wives, submit yourselves unto your own husbands, as unto the Lord.',
   'αἱ γυναῖκες τοῖς ἰδίοις ἀνδράσιν ὑποτάσσεσθε ὡς τῷ κυρίῳ',
   'hai gynaikes tois idiois andrasin hypotassesthe hōs tō kyriō',
   '''Submit'' (hypotassesthe — the verb is actually carried forward from v.21; the wife''s submission is a specific application of the mutual submission already established). ''Unto your own husbands'' (tois idiois andrasin — to their own husbands, not to all men). ''As unto the Lord'' (hōs tō kyriō — as to the Lord; the quality and motivation of the submission is ''as serving Christ''). This is voluntary, intelligent deference — not blind obedience but a choice to honour the marriage structure that reflects Christ and the church.',
   NULL),
  (23, 'For the husband is the head of the wife, even as Christ is the head of the church: and he is the saviour of the body.',
   'ὅτι ὁ ἀνήρ ἐστιν κεφαλὴ τῆς γυναικὸς ὡς καὶ ὁ Χριστὸς κεφαλὴ τῆς ἐκκλησίας αὐτὸς σωτὴρ τοῦ σώματος',
   'hoti ho anēr estin kephalē tēs gynaikos hōs kai ho Christos kephalē tēs ekklēsias autos sōtēr tou sōmatos',
   '''Head'' (kephalē — head; debated whether it means ''authority over'' or ''source/origin''). ''Even as Christ is the head of the church'' — the analogy is crucial: whatever headship means for the husband, it must be defined by Christ''s headship over the church. ''Saviour of the body'' (sōtēr tou sōmatos — Christ''s headship is expressed as saving, protecting, and preserving the body). The husband''s headship is modelled on Christ''s — not domination but sacrificial care.',
   NULL),
  (24, 'Therefore as the church is subject unto Christ, so let the wives be to their own husbands in every thing.',
   'ἀλλ᾽ ὡσπερ ἡ ἐκκλησία ὑποτάσσεται τῷ Χριστῷ οὕτως καὶ αἱ γυναῖκες τοῖς ἰδίοις ἀνδράσιν ἐν παντί',
   'all'' hōsper hē ekklēsia hypotassetai tō Christō houtōs kai hai gynaikes tois idiois andrasin en panti',
   '''As the church is subject unto Christ'' — the church''s response to Christ is the pattern for the wife''s response to her husband. ''In every thing'' (en panti — in everything; qualified by the overall context: this is intelligent, Spirit-filled submission, not submission to abuse or sin). The comparison throughout is Christ-church, not master-slave.',
   NULL),
  (25, 'Husbands, love your wives, even as Christ also loved the church, and gave himself for it;',
   'Οἱ ἄνδρες ἀγαπᾶτε τὰς γυναῖκας ἑαυτῶν καθὼς καὶ ὁ Χριστὸς ἠγάπησεν τὴν ἐκκλησίαν καὶ ἑαυτὸν παρέδωκεν ὑπὲρ αὐτῆς',
   'Hoi andres agapate tas gynaikas heautōn kathōs kai ho Christos ēgapēsen tēn ekklēsian kai heauton paredōken hyper autēs',
   '''Love'' (agapate — present imperative: keep on loving). ''Even as Christ loved the church'' (kathōs kai ho Christos ēgapēsen — the standard is Christ''s love, not human sentimentality). ''Gave himself for it'' (heauton paredōken hyper autēs — surrendered himself on her behalf). The husband''s command is not authority but self-sacrifice. Christ''s love for the church cost him everything; the husband''s love must be equally costly and self-giving.',
   'Husbands love as Christ loved: The husband receives the harder command — not ''lead'' but ''love as Christ loved.'' Christ''s love for the church is the pattern: sacrificial (he gave himself), purposeful (to sanctify and present her), and costly (it cost his life). This redefines headship: the head exists to serve the body, not to be served by it. The husband who loves like Christ will lay down his life for his wife.'),
  (26, 'That he might sanctify and cleanse it with the washing of water by the word,',
   'ἵνα αὐτὴν ἁγιάσῃ καθαρίσας τῷ λουτρῷ τοῦ ὕδατος ἐν ῥήματι',
   'hina autēn hagiasē katharisas tō loutrō tou hydatos en rhēmati',
   '''Sanctify'' (hagiasē — set apart, make holy). ''Cleanse'' (katharisas — having cleansed; aorist participle: the cleansing precedes or accompanies the sanctifying). ''Washing of water'' (loutrō tou hydatos — the bath of water; may refer to baptism as the outward sign of the inward cleansing). ''By the word'' (en rhēmati — by the spoken word, the gospel message). Christ''s purpose in giving himself was to make the church holy — cleansed by the word of the gospel.',
   NULL),
  (27, 'That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish.',
   'ἵνα παραστήσῃ αὐτὴν ἑαυτῷ ἔνδοξον τὴν ἐκκλησίαν μὴ ἔχουσαν σπίλον ἢ ῥυτίδα ἤ τι τῶν τοιούτων ἀλλ᾽ ἵνα ᾖ ἁγία καὶ ἄμωμος',
   'hina parastēsē autēn heautō endoxon tēn ekklēsian mē echousan spilon ē rhytida ē ti tōn toioutōn all'' hina ē hagia kai amōmos',
   '''Present to himself'' (parastēsē autēn heautō — present her to himself; bridal imagery: the groom presenting the bride). ''Glorious'' (endoxon — radiant, splendid, clothed in glory). ''Spot'' (spilon — stain, blemish). ''Wrinkle'' (rhytida — wrinkle, sign of age or decay; used only here in the NT). ''Holy and without blemish'' (hagia kai amōmos — echoing 1:4). Christ''s ultimate goal: a perfected, radiant, unblemished bride. The church''s final state will match God''s eternal purpose.',
   NULL),
  (28, 'So ought men to love their wives as their own bodies. He that loveth his wife loveth himself.',
   'οὕτως ὀφείλουσιν οἱ ἄνδρες ἀγαπᾶν τὰς ἑαυτῶν γυναῖκας ὡς τὰ ἑαυτῶν σώματα ὁ ἀγαπῶν τὴν ἑαυτοῦ γυναῖκα ἑαυτὸν ἀγαπᾷ',
   'houtōs opheilousin hoi andres agapan tas heautōn gynaikas hōs ta heautōn sōmata ho agapōn tēn heautou gynaika heauton agapa',
   '''As their own bodies'' (hōs ta heautōn sōmata — a husband should care for his wife as he instinctively cares for his own body). ''He that loveth his wife loveth himself'' — since husband and wife are one flesh (v.31), loving her is loving himself. Self-interest and wife-love converge: what is good for her is good for him. This is practical wisdom, not mere sentiment.',
   NULL),
  (29, 'For no man ever yet hated his own flesh; but nourisheth and cherisheth it, even as the Lord the church:',
   'οὐδεὶς γάρ ποτε τὴν ἑαυτοῦ σάρκα ἐμίσησεν ἀλλ᾽ ἐκτρέφει καὶ θάλπει αὐτήν καθὼς καὶ ὁ κύριος τὴν ἐκκλησίαν',
   'oudeis gar pote tēn heautou sarka emisēsen all'' ektrephei kai thalpei autēn kathōs kai ho kyrios tēn ekklēsian',
   '''Nourisheth'' (ektrephei — nourishes, feeds, brings up; the word used of raising children). ''Cherisheth'' (thalpei — warms, cherishes, tends with gentle care; used of a bird warming its young). ''Even as the Lord the church'' — Christ nourishes and cherishes his church as tenderly as a parent feeds a child or a bird warms its young. This is the pattern for the husband: tender, nurturing care.',
   NULL),
  (30, 'For we are members of his body, of his flesh, and of his bones.',
   'ὅτι μέλη ἐσμὲν τοῦ σώματος αὐτοῦ ἐκ τῆς σαρκὸς αὐτοῦ καὶ ἐκ τῶν ὀστέων αὐτοῦ',
   'hoti melē esmen tou sōmatos autou ek tēs sarkos autou kai ek tōn osteōn autou',
   '''Members of his body'' (melē tou sōmatos autou — limbs of his body). ''Of his flesh, and of his bones'' (ek tēs sarkos autou kai ek tōn osteōn autou) — echoing Genesis 2:23, where Adam says of Eve: ''bone of my bones, and flesh of my flesh.'' The church''s relationship to Christ mirrors Eve''s relationship to Adam: intimately, organically united.',
   NULL),
  (31, 'For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.',
   'ἀντὶ τούτου καταλείψει ἄνθρωπος τὸν πατέρα αὐτοῦ καὶ τὴν μητέρα καὶ προσκολληθήσεται πρὸς τὴν γυναῖκα αὐτοῦ καὶ ἔσονται οἱ δύο εἰς σάρκα μίαν',
   'anti toutou kataleipsei anthrōpos ton patera autou kai tēn mētera kai proskollēthēsetai pros tēn gynaika autou kai esontai hoi dyo eis sarka mian',
   'A quotation of Genesis 2:24 — the foundational marriage text. ''Leave'' (kataleipsei — abandon the former primary attachment). ''Joined'' (proskollēthēsetai — glued, bonded, cemented together). ''One flesh'' (sarka mian — a profound union of two persons into one entity). Paul is quoting this about marriage, but in v.32 he reveals the deeper meaning.',
   NULL),
  (32, 'This is a great mystery: but I speak concerning Christ and the church.',
   'τὸ μυστήριον τοῦτο μέγα ἐστίν ἐγὼ δὲ λέγω εἰς Χριστὸν καὶ εἰς τὴν ἐκκλησίαν',
   'to mystērion touto mega estin egō de legō eis Christon kai eis tēn ekklēsian',
   '''This is a great mystery'' (to mystērion touto mega estin — this mystery is great, profound, of immense significance). ''But I speak concerning Christ and the church'' (egō de legō eis Christon kai eis tēn ekklēsian). The ''mystery'' is the hidden meaning within Genesis 2:24: marriage was always a picture of Christ and the church. The one-flesh union of husband and wife is a living parable of the union between Christ and his body. Human marriage points beyond itself to a divine reality.',
   'The great mystery: Marriage is a ''great mystery'' because it was designed from the beginning to illustrate the relationship between Christ and the church. Genesis 2:24 was not merely about human marriage but about the cosmic marriage between the divine Bridegroom and his redeemed Bride. Every human marriage is meant to be a small-scale enactment of this great drama: sacrificial love and joyful submission reflecting Christ and the church.'),
  (33, 'Nevertheless let every one of you in particular so love his wife even as himself; and the wife see that she reverence her husband.',
   'πλὴν καὶ ὑμεῖς οἱ καθ᾽ ἕνα ἕκαστος τὴν ἑαυτοῦ γυναῖκα οὕτως ἀγαπάτω ὡς ἑαυτόν ἡ δὲ γυνὴ ἵνα φοβῆται τὸν ἄνδρα',
   'plēn kai hymeis hoi kath'' hena hekastos tēn heautou gynaika houtōs agapatō hōs heauton hē de gynē hina phobētai ton andra',
   '''Nevertheless'' (plēn — however, in any case; bringing the lofty theology down to practical application). ''Love his wife even as himself'' — the summary command for husbands. ''Reverence'' (phobētai — respect, honour; from phobos, which can mean fear or respect depending on context; here it is the same reverent respect given to Christ). The chapter ends with a practical summary: husbands love, wives respect. Both reflect the Christ-church relationship.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 2 (Walk in love / sacrifice)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσφοράν', 'prosphoran', 'G4376', 'Offering, that which is brought to God — from prosphero (to bring toward). A general term for anything offered to God. Christ offered himself — his person, not merely an animal. The offering is voluntary, personal, and complete.', 1),
  ('εὐωδίας', 'euōdias', 'G2175', 'Sweet savour, fragrant aroma — from eu (well) + ozō (to smell). OT sacrificial language: when a sacrifice was acceptable to God, it was described as a ''sweet savour'' (Gen 8:21). Christ''s self-giving was wholly pleasing to the Father — the ultimate sacrifice that fulfilled what all OT sacrifices foreshadowed.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5 AND v.verse_number = 2;

-- Verse 8 (Light in the Lord)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σκότος', 'skotos', 'G4655', 'Darkness — not merely ''in the dark'' but darkness itself; the embodiment of moral and spiritual blindness. The unregenerate person does not merely walk in darkness but is darkness — it defines their identity and nature.', 1),
  ('φῶς', 'phōs', 'G5457', 'Light — correspondingly, believers are not merely ''in the light'' but are light itself. The transformation is ontological: a complete change of nature and identity. Light reveals, illuminates, exposes, and guides — this is now the believer''s nature and function.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5 AND v.verse_number = 8;

-- Verse 18 (Filled with the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πληροῦσθε', 'plērousthe', 'G4137', 'Be filled — present passive imperative of plēroō. Three grammatical features define this command: (1) present tense: keep on being filled, repeatedly, continually; (2) passive voice: be filled — the Spirit does the filling, we yield; (3) imperative mood: this is a command, not a suggestion. Spirit-filling is not optional for the mature but obligatory for all believers.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5 AND v.verse_number = 18;

-- Verse 25 (Husbands love as Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγαπᾶτε', 'agapate', 'G25', 'Love — present imperative of agapaō: keep on loving with self-sacrificing, other-centred love. This is not romantic feeling (erōs) or friendship (philia) but the deliberate choice to seek the highest good of another at personal cost. The standard: ''as Christ loved the church and gave himself for it.''', 1),
  ('παρέδωκεν', 'paredōken', 'G3860', 'Gave up, handed over, delivered over — the same word used of Judas ''betraying'' Jesus (Matt 26:15) and of God ''delivering'' his Son (Rom 8:32). Christ actively, voluntarily surrendered himself. This is the pattern for the husband: not passive affection but active, costly self-sacrifice.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5 AND v.verse_number = 25;

-- Verse 32 (Great mystery)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery — a divine secret now revealed. Here the mystery is that marriage was always designed to picture Christ and the church. The Latin Vulgate translated mystērion as sacramentum, which became the basis for the Catholic designation of marriage as a sacrament. The Greek, however, means a revealed secret, not a ritual.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5 AND v.verse_number = 32;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Followers of God
  (1, '1 Corinthians 11:1', 1), (1, '1 Peter 1:15-16', 2),
  -- v2: Walk in love / offering
  (2, 'John 15:12-13', 1), (2, 'Galatians 2:20', 2), (2, 'Hebrews 10:10', 3),
  -- v5: No inheritance in kingdom
  (5, '1 Corinthians 6:9-10', 1), (5, 'Galatians 5:19-21', 2),
  -- v8: Light in the Lord
  (8, 'John 8:12', 1), (8, '1 Peter 2:9', 2), (8, '1 Thessalonians 5:5', 3),
  -- v14: Awake thou that sleepest
  (14, 'Isaiah 60:1', 1), (14, 'Romans 13:11-12', 2),
  -- v16: Redeeming the time
  (16, 'Colossians 4:5', 1), (16, 'Psalm 90:12', 2),
  -- v18: Filled with the Spirit
  (18, 'Acts 2:4', 1), (18, 'Colossians 3:16', 2), (18, 'Luke 11:13', 3),
  -- v22: Wives submit
  (22, 'Colossians 3:18', 1), (22, '1 Peter 3:1', 2),
  -- v25: Husbands love
  (25, 'Colossians 3:19', 1), (25, '1 Peter 3:7', 2), (25, 'Galatians 2:20', 3),
  -- v27: Glorious church
  (27, 'Revelation 19:7-8', 1), (27, '2 Corinthians 11:2', 2),
  -- v31: One flesh
  (31, 'Genesis 2:24', 1), (31, 'Matthew 19:5', 2),
  -- v32: Great mystery
  (32, 'Revelation 19:7-9', 1), (32, 'Romans 16:25-26', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Ephesians Chapter 5 Complete
-- 33 verses · 6 key verses with word studies (10 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
