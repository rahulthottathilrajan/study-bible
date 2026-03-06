-- ═══════════════════════════════════════════════════
-- COLOSSIANS CHAPTER 3 — The New Life in Christ
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Colossians 3 turns from doctrinal refutation to practical transformation. Having demolished the Colossian heresy in chapter 2, Paul now shows what genuine holiness looks like — and it flows entirely from union with Christ, not from human rules. The chapter opens with the believer''s heavenly position (''risen with Christ''), moves to the decisive ''putting off'' of the old nature (vv.5-9), the ''putting on'' of the new (vv.10-14), and then applies this to community life (vv.15-17) and household relationships (vv.18-25). The controlling principle throughout is ''Christ is all, and in all'' (v.11). True sanctification is not ascetic self-punishment (2:23) but a life transformed by a mind set on things above, expressed in love, forgiveness, and submission to the lordship of Christ in every relationship.',
  'Practical Holiness from Heavenly Position',
  'ἐνδύσασθε (endysasthe)',
  'Put on, clothe yourselves — the deliberate, decisive act of clothing oneself with the character of Christ. As a person puts on garments each morning, the believer is to consciously ''wear'' the virtues of the new nature.',
  '["Seek Things Above (vv.1-4): Risen with Christ; set your mind on things above; your life is hidden with Christ; when Christ appears, you appear in glory","Put Off the Old Man (vv.5-9): Mortify the earthly members; sins of desire and sins of speech; the wrath of God; ye have put off the old man","Put On the New Man (vv.10-14): Renewed in knowledge; Christ is all and in all; put on compassion, kindness, humility, meekness, patience, forgiveness; above all, love","The Peace of Christ in Community (vv.15-17): Let the peace of Christ rule; let the word of Christ dwell richly; do all in the name of the Lord Jesus","Household Code (vv.18-25): Wives and husbands; children and fathers; servants and masters; do it heartily as to the Lord"]'
FROM books b WHERE b.name = 'Colossians';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'If ye then be risen with Christ, seek those things which are above, where Christ sitteth on the right hand of God.',
   'Εἰ οὖν συνηγέρθητε τῷ Χριστῷ τὰ ἄνω ζητεῖτε οὗ ὁ Χριστός ἐστιν ἐν δεξιᾷ τοῦ θεοῦ καθήμενος',
   'Ei oun synēgerthēte tō Christō ta anō zēteite hou ho Christos estin en dexia tou theou kathēmenos',
   '''If'' (ei) is not doubt but assumption: ''since you have been raised.'' ''Risen with Christ'' (synēgerthēte — co-raised, aorist tense: a completed event) links back to 2:12. The imperative follows the indicative: because you have been raised, therefore seek (zēteite — present imperative: keep on seeking) the things above. ''Right hand of God'' is the position of supreme authority and honour (Ps 110:1). The believer''s orientation must be upward — toward the exalted Christ, not toward the earthly regulations of 2:20-23.',
   'The indicative-imperative pattern: Paul never commands holiness apart from the believer''s position in Christ. ''Be what you are'' is the New Testament ethical principle. You have been raised with Christ (fact); therefore seek things above (command). Duty flows from identity, not the reverse.'),
  (2,
   'Set your affection on things above, not on things on the earth.',
   'τὰ ἄνω φρονεῖτε μὴ τὰ ἐπὶ τῆς γῆς',
   'ta anō phroneite mē ta epi tēs gēs',
   '''Set your affection'' (phroneite — think, set your mind, adopt a mindset; present imperative: make this your habitual orientation). This is stronger than occasional thought — it is a settled disposition, a mental framework. The contrast is not between body and spirit (Gnostic dualism) but between the heavenly realm where Christ reigns and the earthly system of rules and regulations the heretics promoted. Christians live on earth but think from heaven.',
   NULL),
  (3,
   'For ye are dead, and your life is hid with Christ in God.',
   'ἀπεθάνετε γὰρ καὶ ἡ ζωὴ ὑμῶν κέκρυπται σὺν τῷ Χριστῷ ἐν τῷ θεῷ',
   'apethanete gar kai hē zōē hymōn kekryptai syn tō Christō en tō theō',
   '''Ye are dead'' (apethanete — you died, aorist: a past, completed event at conversion). ''Your life is hid'' (kekryptai — perfect tense: has been hidden and remains hidden) with Christ in God. Triple security: your life is (1) with Christ, (2) in God, (3) hidden — concealed, protected, secure. No enemy can reach a life hidden in Christ who is Himself in God. The present hiddenness also means the world cannot see or understand the believer''s true identity.',
   'Eternal security of the believer: The life that is ''hidden with Christ in God'' is beyond the reach of any hostile power. The believer has died (past), is hidden (present), and will be revealed in glory (future, v.4). This threefold tense of salvation — past, present, future — is secured entirely by the believer''s union with Christ.'),
  (4,
   'When Christ, who is our life, shall appear, then shall ye also appear with him in glory.',
   'ὅταν ὁ Χριστὸς φανερωθῇ ἡ ζωὴ ὑμῶν τότε καὶ ὑμεῖς σὺν αὐτῷ φανερωθήσεσθε ἐν δόξῃ',
   'hotan ho Christos phanerōthē hē zōē hymōn tote kai hymeis syn autō phanerōthēsesthe en doxē',
   '''Christ, who is our life'' — not merely the giver of life but life itself (cf. John 14:6). ''Shall appear'' (phanerōthē — be manifested, be revealed). What is now hidden will be disclosed at Christ''s return. ''Then shall ye also appear with him in glory'' — the believer''s destiny is inseparable from Christ''s. His glory becomes ours. This is the hope that makes heavenly-mindedness possible: present hiddenness guarantees future manifestation.',
   NULL),
  (5,
   'Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry:',
   'νεκρώσατε οὖν τὰ μέλη τὰ ἐπὶ τῆς γῆς πορνείαν ἀκαθαρσίαν πάθος ἐπιθυμίαν κακήν καὶ τὴν πλεονεξίαν ἥτις ἐστὶν εἰδωλολατρία',
   'nekrōsate oun ta melē ta epi tēs gēs porneian akatharsian pathos epithymian kakēn kai tēn pleonexian hētis estin eidōlolatria',
   '''Mortify'' (nekrōsate — put to death, kill; aorist imperative: do it decisively, now). ''Your members which are upon the earth'' — not the physical body but the sinful practices associated with earthly existence. Five sins listed in descending order from act to desire: (1) ''fornication'' (porneia — all sexual immorality), (2) ''uncleanness'' (akatharsia — moral impurity), (3) ''inordinate affection'' (pathos — uncontrolled passion), (4) ''evil concupiscence'' (epithymian kakēn — wicked desire), (5) ''covetousness'' (pleonexia — greedy grasping). Covetousness is ''idolatry'' because it makes a created thing into an ultimate value.',
   NULL),
  (6,
   'For which things'' sake the wrath of God cometh on the children of disobedience:',
   'δι᾽ ἃ ἔρχεται ἡ ὀργὴ τοῦ θεοῦ ἐπὶ τοὺς υἱοὺς τῆς ἀπειθείας',
   'di'' ha erchetai hē orgē tou theou epi tous huious tēs apeitheias',
   '''The wrath of God'' (hē orgē tou theou) — not arbitrary anger but the settled, righteous response of a holy God to sin. ''Cometh'' (erchetai — present tense: it is coming, it is on its way). ''Children of disobedience'' (huious tēs apeitheias — those characterised by disobedience as their very nature). The sins of v.5 are not merely inappropriate for believers — they are the very things that provoke divine judgment on the unbelieving world.',
   NULL),
  (7,
   'In the which ye also walked some time, when ye lived in them.',
   'ἐν οἷς καὶ ὑμεῖς περιεπατήσατέ ποτε ὅτε ἐζῆτε ἐν τούτοις',
   'en hois kai hymeis periepatēsate pote hote ezēte en toutois',
   '''Walked'' (periepatēsate — conducted your life, lived your daily existence) ''some time'' (pote — once, formerly). ''When ye lived in them'' (hote ezēte en toutois — when you were alive in these things, when these sins were your natural habitat). Past tense throughout: this was the Colossians'' former existence. The shift from past (''walked'') to present (''put off,'' v.8) marks the decisive break conversion brings.',
   NULL),
  (8,
   'But now ye also put off all these; anger, wrath, malice, blasphemy, filthy communication out of your mouth.',
   'νυνὶ δὲ ἀπόθεσθε καὶ ὑμεῖς τὰ πάντα ὀργήν θυμόν κακίαν βλασφημίαν αἰσχρολογίαν ἐκ τοῦ στόματος ὑμῶν',
   'nyni de apothesthe kai hymeis ta panta orgēn thymon kakian blasphēmian aischrologian ek tou stomatos hymōn',
   '''But now'' (nyni de — sharp contrast with the former life). ''Put off'' (apothesthe — strip off, remove like dirty clothing; aorist: do it decisively). The second list shifts from sins of desire (v.5) to sins of disposition and speech: (1) ''anger'' (orgēn — settled, smouldering anger), (2) ''wrath'' (thymon — sudden, explosive rage), (3) ''malice'' (kakian — vicious ill will), (4) ''blasphemy'' (blasphēmian — slanderous, abusive speech against God or others), (5) ''filthy communication'' (aischrologian — shameful, obscene language). The mouth reveals the heart.',
   NULL),
  (9,
   'Lie not one to another, seeing that ye have put off the old man with his deeds;',
   'μὴ ψεύδεσθε εἰς ἀλλήλους ἀπεκδυσάμενοι τὸν παλαιὸν ἄνθρωπον σὺν ταῖς πράξεσιν αὐτοῦ',
   'mē pseudesthe eis allēlous apekdysamenoi ton palaion anthrōpon syn tais praxesin autou',
   '''Lie not'' (pseudesthe — stop lying, present imperative with negation: cease this ongoing practice). The reason: ''ye have put off the old man'' (apekdysamenoi ton palaion anthrōpon — having stripped off the old humanity; aorist participle: completed action). The same verb (apekdyō) used in 2:15 for Christ stripping the powers. The old self has been stripped away — its ''deeds'' (praxesin — practices, habits) no longer belong to you. Lying is incompatible with the new identity.',
   NULL),
  (10,
   'And have put on the new man, which is renewed in knowledge after the image of him that created him:',
   'καὶ ἐνδυσάμενοι τὸν νέον τὸν ἀνακαινούμενον εἰς ἐπίγνωσιν κατ᾽ εἰκόνα τοῦ κτίσαντος αὐτόν',
   'kai endysamenoi ton neon ton anakainoumenon eis epignōsin kat'' eikona tou ktisantos auton',
   '''Put on the new man'' (endysamenoi ton neon — having clothed yourself with the new humanity). ''Renewed'' (anakainoumenon — being continually renewed; present passive: an ongoing process done by God). ''In knowledge'' (eis epignōsin — toward full, experiential knowledge). ''After the image of him that created him'' — the new creation restores the image of God (Gen 1:26-27). What Adam lost, Christ restores. The Colossian heretics sought secret knowledge (gnōsis); Paul says true knowledge comes through the ongoing renewal of the new nature.',
   'The new creation in Christ: Regeneration is not merely moral improvement but re-creation. The new man is ''created'' (ktisantos) — the same verb used for God''s original creation. The believer is a new species, being progressively conformed to the image of the Creator. This echoes 2 Cor 5:17 and Eph 4:24.'),
  (11,
   'Where there is neither Greek nor Jew, circumcision nor uncircumcision, Barbarian, Scythian, bond nor free: but Christ is all, and in all.',
   'ὅπου οὐκ ἔνι Ἕλλην καὶ Ἰουδαῖος περιτομὴ καὶ ἀκροβυστία βάρβαρος Σκύθης δοῦλος ἐλεύθερος ἀλλὰ τὰ πάντα καὶ ἐν πᾶσιν Χριστός',
   'hopou ouk eni Hellēn kai Ioudaios peritomē kai akrobystia barbaros Skythēs doulos eleutheros alla ta panta kai en pasin Christos',
   'In the new humanity, all human distinctions that divide are abolished: (1) ethnic — ''Greek nor Jew,'' (2) religious — ''circumcision nor uncircumcision,'' (3) cultural — ''Barbarian, Scythian'' (Scythians were considered the most uncivilised of all), (4) social — ''bond nor free.'' The climactic declaration: ''Christ is all, and in all'' (ta panta kai en pasin Christos). Christ is everything that matters and He fills every believer without distinction. This is not the elimination of diversity but the transcendence of division.',
   'The universality of Christ: ''Christ is all, and in all'' is the theological centre of the entire epistle. In creation (1:16-17), in redemption (1:20), in the church (1:18), in the Godhead (2:9), in completeness (2:10), and now in the new humanity — Christ is everything. Every barrier of race, religion, culture, and class falls before this truth.'),
  (12,
   'Put on therefore, as the elect of God, holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering;',
   'Ἐνδύσασθε οὖν ὡς ἐκλεκτοὶ τοῦ θεοῦ ἅγιοι καὶ ἠγαπημένοι σπλάγχνα οἰκτιρμοῦ χρηστότητα ταπεινοφροσύνην πραΰτητα μακροθυμίαν',
   'Endysasthe oun hōs eklektoi tou theou hagioi kai ēgapēmenoi splanchna oiktirmou chrēstotēta tapeinophrosynēn praÿtēta makrothymian',
   '''Put on'' (endysasthe — clothe yourselves; aorist imperative: do it decisively). Three identity markers precede the command: ''elect of God'' (chosen), ''holy'' (set apart), ''beloved'' (loved). Identity drives behaviour. Five virtues to wear: (1) ''bowels of mercies'' (splanchna oiktirmou — a compassionate heart, gut-level mercy), (2) ''kindness'' (chrēstotēta — goodness expressed in action), (3) ''humbleness of mind'' (tapeinophrosynēn — genuine humility — contrast with the false humility of 2:18,23), (4) ''meekness'' (praÿtēta — gentle strength under control), (5) ''longsuffering'' (makrothymian — patience that endures provocation without retaliation).',
   NULL),
  (13,
   'Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Christ forgave you, so also do ye.',
   'ἀνεχόμενοι ἀλλήλων καὶ χαριζόμενοι ἑαυτοῖς ἐάν τις πρός τινα ἔχῃ μομφήν καθὼς καὶ ὁ Χριστὸς ἐχαρίσατο ὑμῖν οὕτως καὶ ὑμεῖς',
   'anechomenoi allēlōn kai charizomenoi heautois ean tis pros tina echē momphēn kathōs kai ho Christos echarisato hymin houtōs kai hymeis',
   '''Forbearing'' (anechomenoi — bearing with, enduring, putting up with one another). ''Forgiving'' (charizomenoi — graciously pardoning; from charis/grace). ''Quarrel'' (momphēn — complaint, grievance, blame). The standard of forgiveness: ''even as Christ forgave you'' (kathōs kai ho Christos echarisato hymin). Christ''s forgiveness is not merely the model but the measure — as freely, as fully, as graciously as He forgave, so must you. Unforgiveness in one forgiven by Christ is a contradiction.',
   NULL),
  (14,
   'And above all these things put on charity, which is the bond of perfectness.',
   'ἐπὶ πᾶσιν δὲ τούτοις τὴν ἀγάπην ὅ ἐστιν σύνδεσμος τῆς τελειότητος',
   'epi pasin de toutois tēn agapēn ho estin syndesmos tēs teleiotētos',
   '''Above all'' (epi pasin — over all, on top of all). Love (agapēn) is the outer garment that binds all the other virtues together. ''Bond of perfectness'' (syndesmos tēs teleiotētos — the binding ligament of completeness/maturity). Without love, the individual virtues fall apart; love unites them into a complete whole. Syndesmos is the same word used in 2:19 for the ''bands'' that hold the body together. Love is to the virtues what ligaments are to the body.',
   NULL),
  (15,
   'And let the peace of God rule in your hearts, to the which also ye are called in one body; and be ye thankful.',
   'καὶ ἡ εἰρήνη τοῦ Χριστοῦ βραβευέτω ἐν ταῖς καρδίαις ὑμῶν εἰς ἣν καὶ ἐκλήθητε ἐν ἑνὶ σώματι καὶ εὐχάριστοι γίνεσθε',
   'kai hē eirēnē tou Christou brabeuetō en tais kardiais hymōn eis hēn kai eklēthēte en heni sōmati kai eucharistoi ginesthe',
   '''Rule'' (brabeuetō — act as umpire, arbitrate, preside as judge; from brabeus, the official who awarded prizes at athletic games — cf. 2:18 katabrabeuetō). The peace of Christ is to be the deciding referee in every situation. When decisions arise, the question is: which choice preserves peace? ''In one body'' — this peace is corporate, not merely individual. ''Be thankful'' (eucharistoi ginesthe) — thanksgiving appears again (cf. 2:7; 3:17; 4:2), the recurrent note of the epistle.',
   NULL),
  (16,
   'Let the word of Christ dwell in you richly in all wisdom; teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to the Lord.',
   'ὁ λόγος τοῦ Χριστοῦ ἐνοικείτω ἐν ὑμῖν πλουσίως ἐν πάσῃ σοφίᾳ διδάσκοντες καὶ νουθετοῦντες ἑαυτοὺς ψαλμοῖς ὕμνοις ᾠδαῖς πνευματικαῖς ἐν χάριτι ᾄδοντες ἐν ταῖς καρδίαις ὑμῶν τῷ κυρίῳ',
   'ho logos tou Christou enoikeitō en hymin plousiōs en pasē sophia didaskontes kai nouthetountes heautous psalmois hymnois ōdais pneumatikais en chariti adontes en tais kardiais hymōn tō kyriō',
   '''The word of Christ'' (ho logos tou Christou) — the message about Christ, from Christ, centred on Christ. ''Dwell'' (enoikeitō — make its home, settle in, take up residence; present imperative: let it keep dwelling). ''Richly'' (plousiōs — abundantly, lavishly). The word must not be a visitor but a permanent resident. Three expressions: ''psalms'' (psalmois — OT psalms, sung with instruments), ''hymns'' (hymnois — songs of praise to God), ''spiritual songs'' (ōdais pneumatikais — Spirit-inspired compositions). Corporate worship is both vertical (''to the Lord'') and horizontal (''teaching and admonishing one another'').',
   NULL),
  (17,
   'And whatsoever ye do in word or deed, do all in the name of the Lord Jesus, giving thanks to God and the Father by him.',
   'καὶ πᾶν ὅ τι ἐὰν ποιῆτε ἐν λόγῳ ἢ ἐν ἔργῳ πάντα ἐν ὀνόματι κυρίου Ἰησοῦ εὐχαριστοῦντες τῷ θεῷ καὶ πατρὶ δι᾽ αὐτοῦ',
   'kai pan ho ti ean poiēte en logō ē en ergō panta en onomati kyriou Iēsou eucharistountes tō theō kai patri di'' autou',
   'The all-encompassing principle: ''whatsoever'' (pan ho ti ean) — no exceptions. ''In word or deed'' — speech and action. ''In the name of the Lord Jesus'' — under His authority, as His representative, for His glory. This transforms every mundane activity into worship. ''Giving thanks'' (eucharistountes) — the fourth mention of thanksgiving in this epistle. Thanksgiving flows through Christ (''by him'') to ''God and the Father.'' This verse is the bridge from general ethics (vv.1-16) to specific household duties (vv.18-25).',
   NULL),
  (18,
   'Wives, submit yourselves unto your own husbands, as it is fit in the Lord.',
   'Αἱ γυναῖκες ὑποτάσσεσθε τοῖς ἰδίοις ἀνδράσιν ὡς ἀνῆκεν ἐν κυρίῳ',
   'Hai gynaikes hypotassesthe tois idiois andrasin hōs anēken en kyriō',
   '''Submit'' (hypotassesthe — arrange yourself under, place yourself in order; middle voice: voluntary, not coerced). ''Your own'' (idiois — your own, emphasising the marriage bond). ''As it is fit'' (hōs anēken — as is proper, fitting, appropriate). ''In the Lord'' — the qualifying sphere. This is not unlimited submission to any demand but fitting submission within the Lord''s will. The household code flows from v.17: everything done in the name of the Lord Jesus. Paul''s instruction is brief here; Ephesians 5:22-33 provides the fuller theology.',
   NULL),
  (19,
   'Husbands, love your wives, and be not bitter against them.',
   'Οἱ ἄνδρες ἀγαπᾶτε τὰς γυναῖκας καὶ μὴ πικραίνεσθε πρὸς αὐτάς',
   'Hoi andres agapate tas gynaikas kai mē pikrainesthe pros autas',
   '''Love'' (agapate — present imperative: keep on loving with self-giving, sacrificial love). The husband''s command is not ''rule'' but ''love.'' ''Be not bitter'' (mē pikrainesthe — do not become harsh, embittered, resentful; from pikros, bitter). In a culture where husbands had near-absolute authority, Paul commands tenderness. Bitterness is the slow poison of marriage — resentment that hardens into contempt. The antidote is persistent, active love.',
   NULL),
  (20,
   'Children, obey your parents in all things: for this is well pleasing unto the Lord.',
   'Τὰ τέκνα ὑπακούετε τοῖς γονεῦσιν κατὰ πάντα τοῦτο γὰρ εὐάρεστόν ἐστιν ἐν κυρίῳ',
   'Ta tekna hypakouete tois goneusin kata panta touto gar euareston estin en kyriō',
   '''Obey'' (hypakouete — listen under, hearken to; stronger than ''submit'' in v.18 — active obedience, not merely voluntary ordering). ''In all things'' (kata panta) — comprehensive, though qualified by ''in the Lord'' (en kyriō). ''Well pleasing'' (euareston — acceptable, delightful). Children''s obedience brings pleasure to the Lord — it is not merely a social convention but a spiritual act of worship.',
   NULL),
  (21,
   'Fathers, provoke not your children to anger, lest they be discouraged.',
   'Οἱ πατέρες μὴ ἐρεθίζετε τὰ τέκνα ὑμῶν ἵνα μὴ ἀθυμῶσιν',
   'Hoi pateres mē erethizete ta tekna hymōn hina mē athymōsin',
   '''Provoke not'' (mē erethizete — do not irritate, do not stir up, do not exasperate; present imperative with negation: stop doing this). ''Discouraged'' (athymōsin — become disheartened, lose spirit, become listless; from a-thymos, without spirit/courage). Over-strict, unreasonable, or inconsistent discipline crushes a child''s spirit. Paul addresses fathers specifically — in the ancient world, the paterfamilias had absolute authority. Authority must be exercised with restraint to build up, not tear down.',
   NULL),
  (22,
   'Servants, obey in all things your masters according to the flesh; not with eyeservice, as menpleasers; but in singleness of heart, fearing God:',
   'Οἱ δοῦλοι ὑπακούετε κατὰ πάντα τοῖς κατὰ σάρκα κυρίοις μὴ ἐν ὀφθαλμοδουλείᾳ ὡς ἀνθρωπάρεσκοι ἀλλ᾽ ἐν ἁπλότητι καρδίας φοβούμενοι τὸν θεόν',
   'Hoi douloi hypakouete kata panta tois kata sarka kyriois mē en ophthalmodouleiais hōs anthrōpareskoi all'' en haplotēti kardias phoboumenoi ton theon',
   '''Servants'' (douloi — slaves, bondservants). ''Masters according to the flesh'' (kata sarka kyriois — earthly masters; ''flesh'' limits their authority to the physical realm). ''Eyeservice'' (ophthalmodouleiais — only serving when watched; a compound word coined by Paul, used only here and Eph 6:6). ''Menpleasers'' (anthrōpareskoi — those who perform for human approval). ''Singleness of heart'' (haplotēti kardias — sincerity, undivided motivation). ''Fearing God'' — the true Master is behind every earthly assignment.',
   NULL),
  (23,
   'And whatsoever ye do, do it heartily, as to the Lord, and not unto men;',
   'ὃ ἐὰν ποιῆτε ἐκ ψυχῆς ἐργάζεσθε ὡς τῷ κυρίῳ καὶ οὐκ ἀνθρώποις',
   'ho ean poiēte ek psychēs ergazesthe hōs tō kyriō kai ouk anthrōpois',
   '''Heartily'' (ek psychēs — from the soul, with all your being, with your whole self). ''As to the Lord'' (hōs tō kyriō) — the transforming perspective. Every task, however menial, becomes service to Christ when done with this awareness. The slave sweeping a floor, the worker at a desk, the parent changing a nappy — all become acts of worship when done ''as to the Lord.'' This dignifies all honest labour.',
   NULL),
  (24,
   'Knowing that of the Lord ye shall receive the reward of the inheritance: for ye serve the Lord Christ.',
   'εἰδότες ὅτι ἀπὸ κυρίου ἀπολήμψεσθε τὴν ἀνταπόδοσιν τῆς κληρονομίας τῷ κυρίῳ Χριστῷ δουλεύετε',
   'eidotes hoti apo kyriou apolēmpsesthe tēn antapodosin tēs klēronomias tō kyriō Christō douleuete',
   '''The reward of the inheritance'' (tēn antapodosin tēs klēronomias — the full repayment that is the inheritance). Slaves could not normally inherit property. In Christ, even slaves receive a heavenly inheritance. ''Ye serve the Lord Christ'' (tō kyriō Christō douleuete) — the earthly slave has a heavenly Master who repays faithfully. This does not endorse slavery but transforms the slave''s perspective: your ultimate employer is Christ, and He does not forget your labour.',
   NULL),
  (25,
   'But he that doeth wrong shall receive for the wrong which he hath done: and there is no respect of persons.',
   'ὁ δὲ ἀδικῶν κομίσεται ὃ ἠδίκησεν καὶ οὐκ ἔστιν προσωποληψία',
   'ho de adikōn komisetai ho ēdikēsen kai ouk estin prosōpolēmpsia',
   '''He that doeth wrong'' (ho adikōn — the one practising injustice) — this applies to both slave and master. ''Shall receive'' (komisetai — will get back, will be repaid). ''No respect of persons'' (prosōpolēmpsia — no partiality based on status, rank, or social position; literally ''face-receiving''). God does not show favouritism. The unjust master will answer for cruelty; the dishonest slave will answer for theft. The cross levels all human distinctions before divine justice.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Colossians' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1 (Risen and seek)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συνηγέρθητε', 'synēgerthēte', 'G4891', 'Co-raised, raised together with — aorist passive: you were raised as a completed fact at conversion. The believer''s resurrection life is not future only but a present spiritual reality.', 1),
  ('ζητεῖτε', 'zēteite', 'G2212', 'Seek, search for, strive after — present imperative: keep on seeking continually. The heavenly quest is not a one-time decision but a daily orientation of desire and pursuit.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 3 (Hidden with Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κέκρυπται', 'kekryptai', 'G2928', 'Has been hidden, remains hidden — perfect passive: the hiding was completed in the past and the state continues. Your life is securely concealed with Christ in God, beyond the reach of any enemy.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 3;

-- Verse 5 (Mortify)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νεκρώσατε', 'nekrōsate', 'G3499', 'Put to death, mortify — aorist imperative: act decisively, kill these sins now. Not gradual reform but execution. From nekros (dead, corpse).', 1),
  ('πλεονεξίαν', 'pleonexian', 'G4124', 'Covetousness, greed, grasping desire for more — from pleon (more) + echō (to have). The insatiable craving that makes a created thing into a god. Paul identifies it as idolatry.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 5;

-- Verse 10 (New man renewed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνακαινούμενον', 'anakainoumenon', 'G341', 'Being renewed, being made new again — present passive participle: an ongoing process of renewal performed by God. The new man is not static but progressively transformed.', 1),
  ('εἰκόνα', 'eikona', 'G1504', 'Image, likeness, representation — the same word used for Christ as the image of God (1:15). The new man is being renewed toward the image of the Creator — restoration of the imago Dei.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 11 (Christ is all)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τὰ πάντα', 'ta panta', 'G3956', 'All things, everything, the totality — Christ is the sum of all that matters. Not merely important but everything. The article (ta) makes it emphatic: THE all.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 11;

-- Verse 14 (Bond of perfectness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σύνδεσμος', 'syndesmos', 'G4886', 'Bond, ligament, that which binds together — love is the binding agent that holds all virtues together in a unified whole. Same word as 2:19 for the bands connecting the body to the Head.', 1),
  ('τελειότητος', 'teleiotētos', 'G5047', 'Perfection, completeness, maturity — not sinless perfection but wholeness, the state of being fully developed and integrated. Love produces maturity.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 14;

-- Verse 16 (Word of Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνοικείτω', 'enoikeitō', 'G1774', 'Let it dwell, let it make its home — present imperative: let the word take up permanent residence. From en (in) + oikeō (to dwell in a house). The word is not a passing guest but a permanent inhabitant.', 1),
  ('πλουσίως', 'plousiōs', 'G4146', 'Richly, abundantly, lavishly — not a meagre portion but an overflowing measure. The word should saturate every area of the believer''s life and the community''s worship.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Risen with Christ, seek above
  (1, 'Colossians 2:12', 1), (1, 'Ephesians 2:6', 2), (1, 'Psalm 110:1', 3),
  -- v3: Hidden with Christ
  (3, 'Romans 6:2-4', 1), (3, 'Galatians 2:20', 2), (3, 'John 17:24', 3),
  -- v4: Appear with Him in glory
  (4, '1 John 3:2', 1), (4, 'Philippians 3:20-21', 2), (4, 'Romans 8:18-19', 3),
  -- v5: Mortify earthly members
  (5, 'Romans 8:13', 1), (5, 'Galatians 5:19-21', 2), (5, 'Ephesians 5:3-5', 3),
  -- v9-10: Old man / new man
  (9, 'Ephesians 4:22-24', 1), (9, 'Romans 6:6', 2),
  (10, 'Genesis 1:26-27', 1), (10, '2 Corinthians 5:17', 2), (10, 'Ephesians 4:24', 3),
  -- v11: Christ is all
  (11, 'Galatians 3:28', 1), (11, '1 Corinthians 12:13', 2), (11, 'Ephesians 2:14-16', 3),
  -- v12: Put on virtues
  (12, 'Galatians 5:22-23', 1), (12, 'Ephesians 4:2', 2), (12, '1 Peter 3:8', 3),
  -- v13: Forgive as Christ forgave
  (13, 'Ephesians 4:32', 1), (13, 'Matthew 18:21-35', 2), (13, 'Mark 11:25', 3),
  -- v14: Love the bond
  (14, '1 Corinthians 13:13', 1), (14, 'Romans 13:10', 2), (14, '1 John 4:7-8', 3),
  -- v15: Peace of Christ rule
  (15, 'Philippians 4:7', 1), (15, 'John 14:27', 2), (15, 'Ephesians 4:3-4', 3),
  -- v16: Word dwell richly
  (16, 'Ephesians 5:18-20', 1), (16, 'Psalm 119:11', 2), (16, 'Deuteronomy 6:6-7', 3),
  -- v17: Do all in Jesus' name
  (17, '1 Corinthians 10:31', 1), (17, 'Colossians 3:23', 2), (17, 'Ephesians 5:20', 3),
  -- v18-19: Wives and husbands
  (18, 'Ephesians 5:22-24', 1), (18, '1 Peter 3:1-2', 2),
  (19, 'Ephesians 5:25-28', 1), (19, '1 Peter 3:7', 2),
  -- v20-21: Children and fathers
  (20, 'Ephesians 6:1-3', 1), (20, 'Exodus 20:12', 2),
  (21, 'Ephesians 6:4', 1), (21, 'Proverbs 22:6', 2),
  -- v23-24: Do heartily as to the Lord
  (23, 'Ephesians 6:5-7', 1), (23, '1 Corinthians 10:31', 2),
  (24, '1 Corinthians 3:23-24', 1), (24, 'Matthew 25:21', 2),
  -- v25: No respect of persons
  (25, 'Ephesians 6:9', 1), (25, 'Romans 2:11', 2), (25, 'Acts 10:34', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Colossians Chapter 3 Complete
-- 25 verses · 8 key verses with word studies (15 words)
-- Cross-references for 20 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════