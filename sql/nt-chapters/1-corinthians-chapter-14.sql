-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 14 — Prophecy, Tongues, and Orderly Worship
-- 40 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 14,
  'First Corinthians 14 applies the principles of chapters 12 (diversity of gifts) and 13 (supremacy of love) to the specific issue of tongues and prophecy in public worship. Paul''s preference is clear from the opening: ''Follow after charity, and desire spiritual gifts, but rather that ye may prophesy'' (v.1). The chapter''s argument rests on one criterion: edification. ''He that speaketh in an unknown tongue edifieth himself; but he that prophesieth edifieth the church'' (v.4). In public worship, intelligibility is paramount: ''I had rather speak five words with my understanding, that by my voice I might teach others also, than ten thousand words in an unknown tongue'' (v.19). Tongues without interpretation produce only confusion; prophecy produces conviction, conversion, and the declaration ''God is in you of a truth'' (v.25). Paul does not forbid tongues: ''I speak with tongues more than ye all'' (v.18), and ''forbid not to speak with tongues'' (v.39). But in public worship, tongues must be interpreted, prophets must speak in turn (two or three at most), and others must judge what is said (vv.27-29). ''God is not the author of confusion, but of peace'' (v.33). Paul addresses women''s silence in the churches (vv.34-35), a passage much debated in its scope and application. The chapter concludes with the governing principle: ''Let all things be done decently and in order'' (v.40). Throughout, Paul elevates prophecy above tongues because prophecy builds up the whole church, while uninterpreted tongues build up only the speaker.',
  'Prophecy over Tongues — Intelligibility and Order in Worship',
  'οἰκοδομή (oikodomē)',
  'Edification, building up — from oikos (house) + domē (building). Oikodomē is the construction of a dwelling, applied metaphorically to the spiritual strengthening of the church. This is Paul''s supreme criterion for evaluating worship practices: does it build up the community? Tongues without interpretation fail this test; prophecy passes it. Every element of public worship must contribute to the body''s edification.',
  '["Prophecy Preferred over Tongues (vv.1-5): Follow after charity and desire spiritual gifts but rather that ye may prophesy. For he that speaketh in an unknown tongue speaketh not unto men but unto God for no man understandeth him howbeit in the spirit he speaketh mysteries. But he that prophesieth speaketh unto men to edification and exhortation and comfort. He that speaketh in an unknown tongue edifieth himself but he that prophesieth edifieth the church","The Principle of Intelligibility (vv.6-19): Now brethren if I come unto you speaking with tongues what shall I profit you except I shall speak to you either by revelation or by knowledge or by prophesying or by doctrine. Even things without life giving sound whether pipe or harp except they give a distinction in the sounds how shall it be known what is piped or harped. For if the trumpet give an uncertain sound who shall prepare himself to the battle. I thank my God I speak with tongues more than ye all yet in the church I had rather speak five words with my understanding than ten thousand words in an unknown tongue","Tongues as a Sign and Prophecy for Believers (vv.20-25): Brethren be not children in understanding howbeit in malice be ye children but in understanding be men. Wherefore tongues are for a sign not to them that believe but to them that believe not but prophesying serveth not for them that believe not but for them which believe. If therefore the whole church be come together into one place and all speak with tongues and there come in those that are unlearned or unbelievers will they not say that ye are mad. But if all prophesy and there come in one that believeth not he is convinced of all he is judged of all and thus are the secrets of his heart made manifest and so falling down on his face he will worship God and report that God is in you of a truth","Order in Worship: Tongues Prophecy and Silence (vv.26-35): How is it then brethren when ye come together every one of you hath a psalm hath a doctrine hath a tongue hath a revelation hath an interpretation. Let all things be done unto edifying. If any man speak in an unknown tongue let it be by two or at the most by three and that by course and let one interpret. Let the prophets speak two or three and let the other judge. For God is not the author of confusion but of peace as in all churches of the saints","The Final Principle: Decency and Order (vv.36-40): What came the word of God out from you or came it unto you only. If any man think himself to be a prophet or spiritual let him acknowledge that the things that I write unto you are the commandments of the Lord. Wherefore brethren covet to prophesy and forbid not to speak with tongues. Let all things be done decently and in order"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 40 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Follow after charity, and desire spiritual gifts, but rather that ye may prophesy.',
   'διώκετε τὴν ἀγάπην ζηλοῦτε δὲ τὰ πνευματικά μᾶλλον δὲ ἵνα προφητεύητε',
   'diōkete tēn agapēn zēloute de ta pneumatika mallon de hina prophēteuēte',
   '''Follow after'' (diōkete — pursue, chase, hunt down; the same verb used of persecution: pursue love with that intensity). ''Desire'' (zēloute — be zealous for, eagerly seek). ''But rather'' (mallon de — especially). Paul links chapter 13 to 14: pursue love and seek gifts, especially prophecy. The priority is clear: love first, then gifts — and among gifts, prophecy above tongues.',
   NULL),
  (2, 'For he that speaketh in an unknown tongue speaketh not unto men, but unto God: for no man understandeth him; howbeit in the spirit he speaketh mysteries.',
   'ὁ γὰρ λαλῶν γλώσσῃ οὐκ ἀνθρώποις λαλεῖ ἀλλὰ τῷ θεῷ οὐδεὶς γὰρ ἀκούει πνεύματι δὲ λαλεῖ μυστήρια',
   'ho gar lalōn glōssē ouk anthrōpois lalei alla tō theō oudeis gar akouei pneumati de lalei mystēria',
   '''Speaketh not unto men, but unto God'' — tongue-speech is directed Godward. ''No man understandeth'' (oudeis akouei — no one hears/comprehends). ''In the spirit he speaketh mysteries'' (pneumati lalei mystēria — by the Spirit he speaks hidden truths). Tongues are genuine Spirit-communication to God, but they are incomprehensible to the congregation without interpretation. This is why tongues, though valid, are inferior to prophecy in public worship.',
   NULL),
  (3, 'But he that prophesieth speaketh unto men to edification, and exhortation, and comfort.',
   'ὁ δὲ προφητεύων ἀνθρώποις λαλεῖ οἰκοδομὴν καὶ παράκλησιν καὶ παραμυθίαν',
   'ho de prophēteuōn anthrōpois lalei oikodomēn kai paraklēsin kai paramythian',
   '''Unto men'' — prophecy is directed toward the congregation. Three functions: ''edification'' (oikodomēn — building up), ''exhortation'' (paraklēsin — encouragement, urgent appeal), ''comfort'' (paramythian — consolation, tender encouragement). Prophecy is intelligible communication from God through the prophet to the people. It builds, encourages, and consoles. This triple benefit is why prophecy surpasses tongues in public worship.',
   NULL),
  (4, 'He that speaketh in an unknown tongue edifieth himself; but he that prophesieth edifieth the church.',
   'ὁ λαλῶν γλώσσῃ ἑαυτὸν οἰκοδομεῖ ὁ δὲ προφητεύων ἐκκλησίαν οἰκοδομεῖ',
   'ho lalōn glōssē heauton oikodomei ho de prophēteuōn ekklēsian oikodomei',
   '''Edifieth himself'' (heauton oikodomei — builds up himself). ''Edifieth the church'' (ekklēsian oikodomei — builds up the assembly). This is the key comparison: tongues are self-edifying; prophecy is church-edifying. In a community gathering, what edifies the whole body takes priority over what edifies one individual. Paul is not dismissing self-edification (cf. Jude 1:20) but insisting that public worship must prioritise the community.',
   NULL),
  (5, 'I would that ye all spake with tongues, but rather that ye prophesied: for greater is he that prophesieth than he that speaketh with tongues, except he interpret, that the church may receive edifying.',
   'θέλω δὲ πάντας ὑμᾶς λαλεῖν γλώσσαις μᾶλλον δὲ ἵνα προφητεύητε μείζων γὰρ ὁ προφητεύων ἢ ὁ λαλῶν γλώσσαις ἐκτὸς εἰ μὴ διερμηνεύῃ ἵνα ἡ ἐκκλησία οἰκοδομὴν λάβῃ',
   'thelō de pantas hymas lalein glōssais mallon de hina prophēteuēte meizōn gar ho prophēteuōn ē ho lalōn glōssais ektos ei mē diermēneuē hina hē ekklēsia oikodomēn labē',
   '''I would that ye all spake with tongues'' — Paul does not despise tongues. ''But rather that ye prophesied'' — prophecy is preferred. ''Greater is he that prophesieth'' — in terms of church benefit. ''Except he interpret'' — the exception: if tongues are interpreted, they become functionally equivalent to prophecy because the church can now understand and be edified. The criterion is consistently edification.',
   NULL),
  (6, 'Now, brethren, if I come unto you speaking with tongues, what shall I profit you, except I shall speak to you either by revelation, or by knowledge, or by prophesying, or by doctrine?',
   'νυνὶ δέ ἀδελφοί ἐὰν ἔλθω πρὸς ὑμᾶς γλώσσαις λαλῶν τί ὑμᾶς ὠφελήσω ἐὰν μὴ ὑμῖν λαλήσω ἢ ἐν ἀποκαλύψει ἢ ἐν γνώσει ἢ ἐν προφητείᾳ ἢ ἐν διδαχῇ',
   'nyni de adelphoi ean elthō pros hymas glōssais lalōn ti hymas ōphelēsō ean mē hymin lalēsō ē en apokalypsei ē en gnōsei ē en prophēteia ē en didachē',
   '''What shall I profit you?'' (ti hymas ōphelēsō — what benefit will I bring?). Paul uses himself as the example: even the apostle''s tongues would be useless to the Corinthians without intelligible content. Four categories of useful speech: ''revelation'' (apokalypsei), ''knowledge'' (gnōsei), ''prophecy'' (prophēteia), ''doctrine/teaching'' (didachē). All four are intelligible; all four edify.',
   NULL),
  (7, 'And even things without life giving sound, whether pipe or harp, except they give a distinction in the sounds, how shall it be known what is piped or harped?',
   'ὅμως τὰ ἄψυχα φωνὴν διδόντα εἴτε αὐλὸς εἴτε κιθάρα ἐὰν διαστολὴν τοῖς φθόγγοις μὴ δῷ πῶς γνωσθήσεται τὸ αὐλούμενον ἢ τὸ κιθαριζόμενον',
   'homōs ta apsycha phōnēn didonta eite aulos eite kithara ean diastolēn tois phthongois mē dō pōs gnōsthēsetai to auloumenon ē to kitharizomenon',
   '''Things without life'' (apsycha — inanimate objects). ''Pipe'' (aulos — flute). ''Harp'' (kithara — lyre). ''Distinction in the sounds'' (diastolēn tois phthongois — differentiation in the notes). Even musical instruments must produce distinct, recognisable notes to communicate a melody. Undifferentiated noise — whether from an instrument or from unintelligible speech — communicates nothing.',
   NULL),
  (8, 'For if the trumpet give an uncertain sound, who shall prepare himself to the battle?',
   'καὶ γὰρ ἐὰν ἄδηλον φωνὴν σάλπιγξ δῷ τίς παρασκευάσεται εἰς πόλεμον',
   'kai gar ean adēlon phōnēn salpinx dō tis paraskeuasetai eis polemon',
   '''Uncertain sound'' (adēlon phōnēn — an indistinct sound, an unclear signal). ''Trumpet'' (salpinx — the military trumpet used for commands). ''Prepare for battle'' (paraskeuasetai eis polemon). Military analogy: if the bugle call is unclear, soldiers cannot prepare. In worship, unclear speech (uninterpreted tongues) leaves the congregation unable to respond. Communication demands clarity.',
   NULL),
  (9, 'So likewise ye, except ye utter by the tongue words easy to be understood, how shall it be known what is spoken? for ye shall speak into the air.',
   'οὕτως καὶ ὑμεῖς διὰ τῆς γλώσσης ἐὰν μὴ εὔσημον λόγον δῶτε πῶς γνωσθήσεται τὸ λαλούμενον ἔσεσθε γὰρ εἰς ἀέρα λαλοῦντες',
   'houtōs kai hymeis dia tēs glōssēs ean mē eusēmon logon dōte pōs gnōsthēsetai to laloumenon esesthe gar eis aera lalountes',
   '''Easy to be understood'' (eusēmon — clear, distinct, well-signalled). ''Speak into the air'' (eis aera lalountes — talking to thin air). The application: unintelligible speech in worship is literally talking to nobody. The words dissolve into the atmosphere without reaching anyone. Public speech must be eusēmon — clear and comprehensible.',
   NULL),
  (10, 'There are, it may be, so many kinds of voices in the world, and none of them is without signification.',
   'τοσαῦτα εἰ τύχοι γένη φωνῶν ἐστιν ἐν κόσμῳ καὶ οὐδὲν αὐτῶν ἄφωνον',
   'tosauta ei tychoi genē phōnōn estin en kosmō kai ouden autōn aphōnon',
   '''Kinds of voices'' (genē phōnōn — varieties of languages/sounds). ''None without signification'' (ouden aphōnon — none voiceless/meaningless). Every language carries meaning — to those who understand it. The issue is not that tongues lack meaning but that the meaning is inaccessible without interpretation.',
   NULL),
  (11, 'Therefore if I know not the meaning of the voice, I shall be unto him that speaketh a barbarian, and he that speaketh shall be a barbarian unto me.',
   'ἐὰν οὖν μὴ εἰδῶ τὴν δύναμιν τῆς φωνῆς ἔσομαι τῷ λαλοῦντι βάρβαρος καὶ ὁ λαλῶν ἐν ἐμοὶ βάρβαρος',
   'ean oun mē eidō tēn dynamin tēs phōnēs esomai tō lalounti barbaros kai ho lalōn en emoi barbaros',
   '''Meaning of the voice'' (tēn dynamin tēs phōnēs — the force/significance of the utterance). ''Barbarian'' (barbaros — a foreigner, one who speaks an unintelligible language; the Greek word imitates the sound of incomprehensible speech: ''bar-bar-bar''). Without shared understanding, speaker and listener are mutual foreigners. Uninterpreted tongues create a room full of ''barbarians'' — people who cannot communicate with each other.',
   NULL),
  (12, 'Even so ye, forasmuch as ye are zealous of spiritual gifts, seek that ye may excel to the edifying of the church.',
   'οὕτως καὶ ὑμεῖς ἐπεὶ ζηλωταί ἐστε πνευμάτων πρὸς τὴν οἰκοδομὴν τῆς ἐκκλησίας ζητεῖτε ἵνα περισσεύητε',
   'houtōs kai hymeis epei zēlōtai este pneumatōn pros tēn oikodomēn tēs ekklēsias zēteite hina perisseuēte',
   '''Zealous'' (zēlōtai — eager, passionate pursuers). ''Excel to the edifying'' (perisseuēte pros tēn oikodomēn — abound toward the building up). Paul redirects their zeal: since you are passionate about spiritual gifts, channel that passion toward what builds up the church. Don''t seek the gift that makes you prominent; seek the gift that serves others.',
   NULL),
  (13, 'Wherefore let him that speaketh in an unknown tongue pray that he may interpret.',
   'διὸ ὁ λαλῶν γλώσσῃ προσευχέσθω ἵνα διερμηνεύῃ',
   'dio ho lalōn glōssē proseuchesthō hina diermēneuē',
   '''Pray that he may interpret'' (proseuchesthō hina diermēneuē). If you have the gift of tongues, pray for the companion gift of interpretation. Without interpretation, tongues serve only the individual. With interpretation, tongues can edify the whole church. Paul''s solution is not to suppress tongues but to supplement them with interpretation.',
   NULL),
  (14, 'For if I pray in an unknown tongue, my spirit prayeth, but my understanding is unfruitful.',
   'ἐὰν γὰρ προσεύχωμαι γλώσσῃ τὸ πνεῦμά μου προσεύχεται ὁ δὲ νοῦς μου ἄκαρπός ἐστιν',
   'ean gar proseuchōmai glōssē to pneuma mou proseuchetai ho de nous mou akarpos estin',
   '''My spirit prayeth'' (to pneuma mou proseuchetai — my spirit prays). ''My understanding is unfruitful'' (ho nous mou akarpos — my mind produces no fruit). In tongue-prayer, the spirit engages God but the mind is bypassed. Paul values both spirit and mind in worship. A prayer that engages the spirit while leaving the mind unfruitful is incomplete worship.',
   NULL),
  (15, 'What is it then? I will pray with the spirit, and I will pray with the understanding also: I will sing with the spirit, and I will sing with the understanding also.',
   'τί οὖν ἐστιν προσεύξομαι τῷ πνεύματι προσεύξομαι δὲ καὶ τῷ νοΐ ψαλῶ τῷ πνεύματι ψαλῶ δὲ καὶ τῷ νοΐ',
   'ti oun estin proseuxomai tō pneumati proseuxomai de kai tō noi psalō tō pneumati psalō de kai tō noi',
   '''I will pray with the spirit'' (proseuxomai tō pneumati). ''I will pray with the understanding also'' (proseuxomai kai tō noi — and with the mind). ''I will sing with the spirit... and with the understanding'' — both prayer and singing should engage both spirit and mind. Paul does not choose one over the other but insists on both. Complete worship involves the whole person — spirit and intellect united.',
   NULL),
  (16, 'Else when thou shalt bless with the spirit, how shall he that occupieth the room of the unlearned say Amen at thy giving of thanks, seeing he understandeth not what thou sayest?',
   'ἐπεὶ ἐὰν εὐλογήσῃς τῷ πνεύματι ὁ ἀναπληρῶν τὸν τόπον τοῦ ἰδιώτου πῶς ἐρεῖ τὸ ἀμήν ἐπὶ τῇ σῇ εὐχαριστίᾳ ἐπειδὴ τί λέγεις οὐκ οἶδεν',
   'epei ean eulogēsēs tō pneumati ho anaplērōn ton topon tou idiōtou pōs erei to amēn epi tē sē eucharistia epeidē ti legeis ouk oiden',
   '''Bless with the spirit'' — praise in tongues. ''Unlearned'' (idiōtou — an outsider, someone not initiated, a non-speaker of tongues). ''Say Amen'' — the congregation''s response of agreement. If the prayer is in an unknown tongue, others cannot ratify it with ''Amen'' because they do not understand what was said. Public worship requires participatory understanding.',
   NULL),
  (17, 'For thou verily givest thanks well, but the other is not edified.',
   'σὺ μὲν γὰρ καλῶς εὐχαριστεῖς ἀλλ᾿ ὁ ἕτερος οὐκ οἰκοδομεῖται',
   'sy men gar kalōs eucharisteis all ho heteros ouk oikodomeitai',
   '''Givest thanks well'' (kalōs eucharisteis — your thanksgiving is fine, genuine). ''The other is not edified'' — the tongue-speaker''s prayer may be excellent, but it fails the edification test because others cannot understand it. Quality of content without accessibility is wasted in public worship.',
   NULL),
  (18, 'I thank my God, I speak with tongues more than ye all:',
   'εὐχαριστῶ τῷ θεῷ μου πάντων ὑμῶν μᾶλλον γλώσσαις λαλῶ',
   'eucharistō tō theō mou pantōn hymōn mallon glōssais lalō',
   '''I speak with tongues more than ye all'' — Paul is not a tongue-denier or tongue-despiser. He has more tongue-speaking experience than any of them. This establishes his credibility: his preference for prophecy in public worship comes from authority, not from ignorance or envy of a gift he lacks.',
   NULL),
  (19, 'Yet in the church I had rather speak five words with my understanding, that by my voice I might teach others also, than ten thousand words in an unknown tongue.',
   'ἀλλ᾿ ἐν ἐκκλησίᾳ θέλω πέντε λόγους διὰ τοῦ νοός μου λαλῆσαι ἵνα καὶ ἄλλους κατηχήσω ἢ μυρίους λόγους ἐν γλώσσῃ',
   'all en ekklēsia thelō pente logous dia tou noos mou lalēsai hina kai allous katēchēsō ē myrious logous en glōssē',
   '''Five words with my understanding'' (pente logous dia tou noos — five intelligible words). ''Ten thousand words'' (myrious logous — ten thousand, an innumerable quantity). ''Teach'' (katēchēsō — instruct, catechise). The ratio is staggering: 5 intelligible words outweigh 10,000 unintelligible ones. In public worship, clarity trumps volume. A brief, clear teaching is worth more than an extended unintelligible display.',
   'This verse is the definitive statement on intelligibility in worship. Paul, who speaks in tongues ''more than ye all'' (v.18), would rather say five comprehensible words than deliver a ten-thousand-word tongue-speech. The purpose of public worship is mutual edification, and edification requires understanding. This does not devalue tongues in private devotion (v.4) but firmly subordinates them to intelligible speech in the assembly. The criterion is always: does the congregation benefit?'),
  (20, 'Brethren, be not children in understanding: howbeit in malice be ye children, but in understanding be men.',
   'ἀδελφοί μὴ παιδία γίνεσθε ταῖς φρεσίν ἀλλὰ τῇ κακίᾳ νηπιάζετε ταῖς δὲ φρεσὶν τέλειοι γίνεσθε',
   'adelphoi mē paidia ginesthe tais phresin alla tē kakia nēpiazete tais de phresin teleioi ginesthe',
   '''Children in understanding'' (paidia tais phresin — infants in thinking). ''In malice be children'' (tē kakia nēpiazete — in evil be naive, inexperienced). ''In understanding be men'' (tais phresin teleioi — mature in thinking). The Corinthians'' fascination with tongues is childish thinking. They should be mature in understanding (recognising that edification matters more than display) while remaining innocent in evil.',
   NULL),
  (21, 'In the law it is written, With men of other tongues and other lips will I speak unto this people; and yet for all that will they not hear me, saith the Lord.',
   'ἐν τῷ νόμῳ γέγραπται ὅτι ἐν ἑτερογλώσσοις καὶ ἐν χείλεσιν ἑτέρων λαλήσω τῷ λαῷ τούτῳ καὶ οὐδ᾿ οὕτως εἰσακούσονταί μου λέγει κύριος',
   'en tō nomō gegraptai hoti en heteroglōssois kai en cheilesin heterōn lalēsō tō laō toutō kai oud houtōs eisakousontai mou legei kyrios',
   'Paul quotes Isaiah 28:11-12 (freely). In Isaiah, God warns that he will speak to unbelieving Israel through the foreign tongues of Assyrian invaders — and even that will not cause them to listen. Paul applies this typologically to the function of tongues as a ''sign'' (v.22).',
   NULL),
  (22, 'Wherefore tongues are for a sign, not to them that believe, but to them that believe not: but prophesying serveth not for them that believe not, but for them which believe.',
   'ὥστε αἱ γλῶσσαι εἰς σημεῖόν εἰσιν οὐ τοῖς πιστεύουσιν ἀλλὰ τοῖς ἀπίστοις ἡ δὲ προφητεία οὐ τοῖς ἀπίστοις ἀλλὰ τοῖς πιστεύουσιν',
   'hōste hai glōssai eis sēmeion eisin ou tois pisteuousin alla tois apistois hē de prophēteia ou tois apistois alla tois pisteuousin',
   '''Tongues are for a sign'' (eis sēmeion — as a sign). ''To them that believe not'' (tois apistois — for unbelievers). ''Prophesying for them which believe'' (tois pisteuousin — for believers). This verse is difficult: how is tongues a ''sign'' for unbelievers? Drawing on the Isaiah quotation, tongues function as a sign of judgment — unintelligible speech signals divine displeasure (as Assyrian speech signalled judgment on Israel). Prophecy, by contrast, serves believers constructively.',
   NULL),
  (23, 'If therefore the whole church be come together into one place, and all speak with tongues, and there come in those that are unlearned, or unbelievers, will they not say that ye are mad?',
   'ἐὰν οὖν συνέλθῃ ἡ ἐκκλησία ὅλη ἐπὶ τὸ αὐτὸ καὶ πάντες γλώσσαις λαλῶσιν εἰσέλθωσιν δὲ ἰδιῶται ἢ ἄπιστοι οὐκ ἐροῦσιν ὅτι μαίνεσθε',
   'ean oun synelthē hē ekklēsia holē epi to auto kai pantes glōssais lalōsin eiselthōsin de idiōtai ē apistoi ouk erousin hoti mainesthe',
   '''All speak with tongues'' — chaotic, simultaneous tongue-speaking. ''Unlearned'' (idiōtai — outsiders, uninitiated). ''Unbelievers'' (apistoi). ''Ye are mad'' (mainesthe — you are insane). If a visitor walks into a worship service where everyone is speaking in tongues simultaneously, the natural conclusion is insanity. This is not the impression the church should make on inquirers.',
   NULL),
  (24, 'But if all prophesy, and there come in one that believeth not, or one unlearned, he is convinced of all, he is judged of all:',
   'ἐὰν δὲ πάντες προφητεύωσιν εἰσέλθῃ δέ τις ἄπιστος ἢ ἰδιώτης ἐλέγχεται ὑπὸ πάντων ἀνακρίνεται ὑπὸ πάντων',
   'ean de pantes prophēteuōsin eiselthē de tis apistos ē idiōtēs elenchetai hypo pantōn anakrinetai hypo pantōn',
   '''Convinced'' (elenchetai — convicted, exposed, reproved; his sin is brought to light). ''Judged'' (anakrinetai — examined, searched; his heart is investigated). Prophecy has the power to expose the inner life of an unbeliever. Where tongues produce confusion, prophecy produces conviction.',
   NULL),
  (25, 'And thus are the secrets of his heart made manifest; and so falling down on his face he will worship God, and report that God is in you of a truth.',
   'καὶ οὕτως τὰ κρυπτὰ τῆς καρδίας αὐτοῦ φανερὰ γίνεται καὶ οὕτως πεσὼν ἐπὶ πρόσωπον προσκυνήσει τῷ θεῷ ἀπαγγέλλων ὅτι ὁ θεὸς ὄντως ἐν ὑμῖν ἐστιν',
   'kai houtōs ta krypta tēs kardias autou phanera ginetai kai houtōs pesōn epi prosōpon proskynēsei tō theō apangellōn hoti ho theos ontōs en hymin estin',
   '''Secrets of his heart made manifest'' (ta krypta tēs kardias phanera — the hidden things of the heart revealed). ''Falling down on his face'' — prostrate worship. ''God is in you of a truth'' (ho theos ontōs en hymin — God is truly among you). The ideal outcome of Spirit-empowered worship: a visitor''s heart is laid bare by prophetic speech, leading to genuine worship and the declaration that God is genuinely present. This is what worship should accomplish.',
   'This verse describes the evangelistic power of prophetic worship. When the church gathers and prophetic speech is exercised, unbelievers experience the reality of God''s presence through the exposure of their hearts. The result is not humiliation but worship: they fall prostrate and confess ''God is truly among you.'' This is radically different from the impression created by unintelligible tongues (v.23: ''ye are mad''). Paul''s vision for worship is that it should reveal God''s presence so powerfully that outsiders are converted on the spot.'),
  (26, 'How is it then, brethren? when ye come together, every one of you hath a psalm, hath a doctrine, hath a tongue, hath a revelation, hath an interpretation. Let all things be done unto edifying.',
   'τί οὖν ἐστιν ἀδελφοί ὅταν συνέρχησθε ἕκαστος ὑμῶν ψαλμὸν ἔχει διδαχὴν ἔχει γλῶσσαν ἔχει ἀποκάλυψιν ἔχει ἑρμηνείαν ἔχει πάντα πρὸς οἰκοδομὴν γινέσθω',
   'ti oun estin adelphoi hotan synerchēsthe hekastos hymōn psalmon echei didachēn echei glōssan echei apokalypsin echei hermēneian echei panta pros oikodomēn ginesthō',
   '''Every one of you hath'' — the Corinthian worship was participatory, not spectator-driven. Each person came with a contribution: psalm, teaching, tongue, revelation, interpretation. ''Let all things be done unto edifying'' (panta pros oikodomēn — everything toward building up). The governing principle for all worship elements: does it edify? This is the criterion by which every contribution must be evaluated.',
   NULL),
  (27, 'If any man speak in an unknown tongue, let it be by two, or at the most by three, and that by course; and let one interpret.',
   'εἴτε γλώσσῃ τις λαλεῖ κατὰ δύο ἢ τὸ πλεῖστον τρεῖς καὶ ἀνὰ μέρος καὶ εἷς διερμηνευέτω',
   'eite glōssē tis lalei kata duo ē to pleiston treis kai ana meros kai heis diermēneuetō',
   'Three regulations for tongues in public worship: (1) ''Two, or at the most three'' speakers (kata duo ē to pleiston treis — a maximum of three); (2) ''By course'' (ana meros — in turn, one at a time; no simultaneous speaking); (3) ''Let one interpret'' (heis diermēneuetō — one person must provide interpretation). These rules establish order and ensure the congregation benefits.',
   NULL),
  (28, 'But if there be no interpreter, let him keep silence in the church; and let him speak to himself, and to God.',
   'ἐὰν δὲ μὴ ᾖ διερμηνευτής σιγάτω ἐν ἐκκλησίᾳ ἑαυτῷ δὲ λαλείτω καὶ τῷ θεῷ',
   'ean de mē ē diermēneutēs sigatō en ekklēsia heautō de laleitō kai tō theō',
   '''No interpreter'' (mē ē diermēneutēs — if there is no one to interpret). ''Keep silence'' (sigatō — be silent, remain quiet). ''Speak to himself, and to God'' — tongues without an interpreter must be exercised privately, not publicly. The tongue-speaker can still worship God silently or inwardly. Paul preserves the validity of tongues while insisting on order in the assembly.',
   NULL),
  (29, 'Let the prophets speak two or three, and let the other judge.',
   'προφῆται δὲ δύο ἢ τρεῖς λαλείτωσαν καὶ οἱ ἄλλοι διακρινέτωσαν',
   'prophētai de duo ē treis laleitōsan kai hoi alloi diakrinētōsan',
   '''Two or three'' — the same limit as for tongues. ''The other judge'' (hoi alloi diakrinētōsan — let the others evaluate, discern). Prophecy is not unaccountable: it must be weighed by the community. ''The others'' are likely the other prophets or the congregation as a whole. This prevents false prophecy from going unchallenged. Even Spirit-inspired speech is subject to communal evaluation.',
   NULL),
  (30, 'If any thing be revealed to another that sitteth by, let the first hold his peace.',
   'ἐὰν δὲ ἄλλῳ ἀποκαλυφθῇ καθημένῳ ὁ πρῶτος σιγάτω',
   'ean de allō apokalyphthē kathēmenō ho prōtos sigatō',
   '''Revealed to another'' (allō apokalyphthē — if something is revealed to someone else). ''Let the first hold his peace'' (ho prōtos sigatō — the first speaker should stop). Prophecy is dynamic: if a new revelation comes to someone in the congregation, the current speaker should yield. This ensures freshness and prevents monopoly. The Spirit distributes prophetic insights freely and may redirect the flow at any moment.',
   NULL),
  (31, 'For ye may all prophesy one by one, that all may learn, and all may be comforted.',
   'δύνασθε γὰρ καθ᾿ ἕνα πάντες προφητεύειν ἵνα πάντες μανθάνωσιν καὶ πάντες παρακαλῶνται',
   'dynasthe gar kath hena pantes prophēteuein hina pantes manthanōsin kai pantes parakalōntai',
   '''One by one'' (kath hena — individually, in succession). ''All may learn... all may be comforted'' — the purpose of ordered prophecy: universal instruction and encouragement. Paul envisions a worship service where multiple people prophesy in turn, each contributing to the body''s edification.',
   NULL),
  (32, 'And the spirits of the prophets are subject to the prophets.',
   'καὶ πνεύματα προφητῶν προφήταις ὑποτάσσεται',
   'kai pneumata prophētōn prophētais hypotassetai',
   '''Spirits of the prophets'' (pneumata prophētōn — the prophetic spirits; the spiritual impulses in the prophets). ''Subject to the prophets'' (prophētais hypotassetai — are subordinate to the prophets). A prophet is not overwhelmed by uncontrollable ecstasy. The prophetic impulse can be restrained — a prophet can wait his turn, yield to another, and maintain self-control. This distinguishes Christian prophecy from pagan ecstatic possession.',
   NULL),
  (33, 'For God is not the author of confusion, but of peace, as in all churches of the saints.',
   'οὐ γάρ ἐστιν ἀκαταστασίας ὁ θεὸς ἀλλ᾿ εἰρήνης ὡς ἐν πάσαις ταῖς ἐκκλησίαις τῶν ἁγίων',
   'ou gar estin akatastasias ho theos all eirēnēs hōs en pasais tais ekklēsiais tōn hagiōn',
   '''Confusion'' (akatastasias — disorder, instability, chaos). ''Peace'' (eirēnēs — tranquility, harmony, order). God''s character is the ground of orderly worship: since God is a God of peace (not chaos), worship that reflects his character must be orderly. ''As in all churches'' — this is not a Corinthian exception but a universal principle. Every church should reflect God''s orderly nature.',
   'This verse establishes the theological basis for liturgical order. God''s nature defines the character of worship: since God is not a God of akatastasia (disorder, tumult, anarchy) but of eirēnē (peace, harmony), his worship should reflect peace, not pandemonium. Chaotic worship does not glorify a God of order. This does not require rigid formalism but does exclude the simultaneous, uncontrolled tongue-speaking that characterised the Corinthian assembly. The appeal to ''all churches'' shows this is not Paul''s personal preference but the universal apostolic standard.'),
  (34, 'Let your women keep silence in the churches: for it is not permitted unto them to speak; but they are commanded to be under obedience, as also saith the law.',
   'αἱ γυναῖκες ὑμῶν ἐν ταῖς ἐκκλησίαις σιγάτωσαν οὐ γὰρ ἐπιτέτραπται αὐταῖς λαλεῖν ἀλλ᾿ ὑποτάσσεσθαι καθὼς καὶ ὁ νόμος λέγει',
   'hai gynaikes hymōn en tais ekklēsiais sigatōsan ou gar epitetrapai autais lalein all hypotassesthai kathōs kai ho nomos legei',
   '''Keep silence'' (sigatōsan — be silent; the same verb used of tongues-speakers without interpreters in v.28 and prophets yielding in v.30). ''Not permitted to speak'' (ou epitetrapai lalein). ''Under obedience'' (hypotassesthai — submit, be in ordered arrangement). ''As saith the law'' — likely Genesis 3:16 or the creation order principle (cf. 11:3-9). This passage is among the most debated in the NT. The ''silence'' may refer to (a) all speech in worship; (b) the judging of prophecy (v.29); or (c) disruptive questioning (v.35). Since Paul assumes women pray and prophesy in 11:5, the silence likely has a specific, limited scope — perhaps the evaluation of prophecy or disruptive interruptions.',
   NULL),
  (35, 'And if they will learn any thing, let them ask their husbands at home: for it is a shame for women to speak in the church.',
   'εἰ δέ τι μαθεῖν θέλουσιν ἐν οἴκῳ τοὺς ἰδίους ἄνδρας ἐπερωτάτωσαν αἰσχρὸν γάρ ἐστιν γυναιξὶν ἐν ἐκκλησίᾳ λαλεῖν',
   'ei de ti mathein thelousin en oikō tous idious andras eperōtatōsan aischron gar estin gynaixin en ekklēsia lalein',
   '''Ask their husbands at home'' (en oikō tous idious andras eperōtatōsan). ''A shame'' (aischron — disgraceful, dishonourable). The instruction assumes married women in the assembly. The ''speaking'' (lalein) that is shameful may be the disruptive calling out of questions during the service — asking questions in a way that undermined the orderly evaluation of prophecy. Paul addresses a specific cultural situation where women''s public questioning could bring dishonour.',
   NULL),
  (36, 'What? came the word of God out from you? or came it unto you only?',
   'ἢ ἀφ᾿ ὑμῶν ὁ λόγος τοῦ θεοῦ ἐξῆλθεν ἢ εἰς ὑμᾶς μόνους κατήντησεν',
   'ē aph hymōn ho logos tou theou exēlthen ē eis hymas monous katēntēsen',
   'Sarcastic: ''Did the word of God originate with you? Did it come only to you?'' The Corinthians are not the source or the sole recipients of God''s word. Other churches share the same apostolic teaching. The Corinthians cannot make their own rules for worship independent of the universal church''s practice.',
   NULL),
  (37, 'If any man think himself to be a prophet, or spiritual, let him acknowledge that the things that I write unto you are the commandments of the Lord.',
   'εἴ τις δοκεῖ προφήτης εἶναι ἢ πνευματικός ἐπιγινωσκέτω ἃ γράφω ὑμῖν ὅτι κυρίου εἰσὶν ἐντολαί',
   'ei tis dokei prophētēs einai ē pneumatikos epiginōsketō ha graphō hymin hoti kyriou eisin entolai',
   '''Think himself a prophet or spiritual'' — Paul challenges the self-proclaimed prophets. ''Acknowledge'' (epiginōsketō — recognise, fully acknowledge). ''Commandments of the Lord'' (kyriou eisin entolai — they are the Lord''s commands). The ultimate test of spiritual authenticity: does the ''prophet'' recognise Paul''s writing as the Lord''s commands? If not, his claim to spiritual authority is self-refuted.',
   NULL),
  (38, 'But if any man be ignorant, let him be ignorant.',
   'εἰ δέ τις ἀγνοεῖ ἀγνοείτω',
   'ei de tis agnoei agnoeitō',
   '''If any man be ignorant'' (ei tis agnoei — if someone does not recognise/acknowledge). ''Let him be ignorant'' (agnoeitō — let him remain in his ignorance). A terse dismissal: those who refuse to accept Paul''s instructions as the Lord''s commands are choosing ignorance. Paul will not endlessly debate; he has stated the divine command and moves on.',
   NULL),
  (39, 'Wherefore, brethren, covet to prophesy, and forbid not to speak with tongues.',
   'ὥστε ἀδελφοί ζηλοῦτε τὸ προφητεύειν καὶ τὸ λαλεῖν γλώσσαις μὴ κωλύετε',
   'hōste adelphoi zēloute to prophēteuein kai to lalein glōssais mē kōlyete',
   '''Covet to prophesy'' (zēloute to prophēteuein — eagerly desire to prophesy). ''Forbid not to speak with tongues'' (to lalein glōssais mē kōlyete — do not prevent tongue-speaking). Paul''s balanced conclusion: prioritise prophecy, but do not ban tongues. Both gifts are valid; both have their place. The issue has never been tongues vs. no tongues, but order vs. chaos, edification vs. self-display.',
   NULL),
  (40, 'Let all things be done decently and in order.',
   'πάντα δὲ εὐσχημόνως καὶ κατὰ τάξιν γινέσθω',
   'panta de euschēmonōs kai kata taxin ginesthō',
   '''Decently'' (euschēmonōs — with propriety, becomingly, in a fitting manner). ''In order'' (kata taxin — according to arrangement, in proper sequence). The final word on worship: everything must be fitting and orderly. This does not mean lifeless or rigid — the Spirit is active and dynamic — but that Spirit-empowered worship operates within structure, not chaos. Decency and order are not enemies of the Spirit but expressions of the God of peace (v.33).',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 14;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 prophesy
  ('προφητεύω', 'prophēteuō', 'G4395', 'To prophesy, to speak forth divine truth — from pro (forth) + phēmi (to speak). NT prophecy is Spirit-inspired speech that edifies, exhorts, and comforts (v.3). It is not necessarily prediction of the future but disclosure of God''s will and truth for the present situation. In this chapter, prophecy is consistently preferred over tongues for public worship because it is intelligible and edifies the entire congregation.', 1),
  -- v.2 tongues
  ('γλῶσσα', 'glōssa', 'G1100', 'Tongue, language — used both literally (the organ of speech) and figuratively (a language). In 1 Corinthians, glossolalia (tongue-speaking) refers to Spirit-given utterance that is unintelligible to the speaker and hearers without interpretation. Whether these are human languages (as in Acts 2) or heavenly languages (cf. 13:1 ''tongues of angels'') is debated. Paul treats them as genuine Spirit-communication to God (v.2) but insists they require interpretation for public benefit.', 2),
  -- v.3 edification
  ('οἰκοδομή', 'oikodomē', 'G3619', 'Edification, building up, construction — from oikos (house) + domē (building). The metaphor of constructing a building applied to the spiritual strengthening of the church community. Oikodomē is Paul''s primary criterion for evaluating worship practices: prophecy edifies the church (v.4); uninterpreted tongues edify only the speaker. The word appears 7 times in this chapter alone (vv.3, 4, 5, 12, 17, 26), making it the chapter''s controlling concept.', 3),
  -- v.3 exhortation
  ('παράκλησις', 'paraklēsis', 'G3874', 'Exhortation, encouragement, comfort, appeal — from parakaleō (to call alongside, summon to one''s side). Paraklēsis covers the full range of prophetic speech: urgent appeal, warm encouragement, and tender comfort. It is one of the three functions of prophecy (alongside edification and comfort/paramythia). The same root gives us paraklētos (the Holy Spirit as Comforter/Advocate, John 14:16).', 4),
  -- v.19 teach/catechise
  ('κατηχέω', 'katēcheō', 'G2727', 'To instruct, teach, catechise — from kata (down) + ēcheō (to sound). Literally ''to sound down into'' the ears — to teach by word of mouth, to instruct systematically. From this word comes ''catechism'' and ''catechesis.'' Paul would rather speak five katēcheō-words (that instruct others) than ten thousand unintelligible tongue-words. Teaching that reaches the mind and transforms understanding is the gold standard for public speech in the assembly.', 5),
  -- v.25 secrets of the heart
  ('κρυπτός', 'kryptos', 'G2927', 'Hidden, secret, concealed — from kryptō (to hide). The ''secrets of the heart'' (ta krypta tēs kardias) are the hidden thoughts, motives, and sins that a person conceals from others. When prophetic speech exposes these hidden things, the unbeliever experiences the uncanny presence of God who knows all. This is the evangelistic power of prophecy: it makes the invisible visible and confronts the hearer with God''s personal knowledge of them.', 6),
  -- v.33 confusion
  ('ἀκαταστασία', 'akatastasia', 'G181', 'Disorder, confusion, tumult, instability — from a (not) + kathistēmi (to set in order). The opposite of ordered arrangement. God is not a God of akatastasia but of eirēnē (peace). Worship that descends into chaos — simultaneous tongues, interruptions, and uncontrolled outbursts — does not reflect God''s character. Order in worship is not mere preference but a theological necessity rooted in God''s own nature.', 7),
  -- v.40 order
  ('τάξις', 'taxis', 'G5010', 'Order, arrangement, proper sequence — from tassō (to arrange, assign). A military term for ordered ranks and formations. Worship ''according to order'' (kata taxin) means structured, sequential, and purposeful. Each element has its place; each speaker has a turn; each gift operates within its proper boundaries. Taxis does not stifle the Spirit but channels his energy into constructive edification rather than chaotic display.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 14
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 3
    WHEN 5 THEN 19
    WHEN 6 THEN 25
    WHEN 7 THEN 33
    WHEN 8 THEN 40
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 follow after charity
  (1, '1 Corinthians 12:31', 1),
  (1, '1 Corinthians 13:1', 2),
  -- v.2 speaks mysteries
  (2, '1 Corinthians 13:2', 3),
  -- v.5 greater is he that prophesies
  (5, '1 Corinthians 12:28', 4),
  -- v.12 edifying the church
  (12, '1 Corinthians 12:7', 5),
  (12, 'Ephesians 4:12', 6),
  -- v.15 pray with the spirit
  (15, 'Ephesians 5:19', 7),
  (15, 'Colossians 3:16', 8),
  -- v.20 be not children
  (20, 'Ephesians 4:14', 9),
  (20, 'Hebrews 5:12-14', 10),
  -- v.21 other tongues (Isaiah)
  (21, 'Isaiah 28:11-12', 11),
  -- v.25 God is in you
  (25, 'Isaiah 45:14', 12),
  (25, 'Zechariah 8:23', 13),
  -- v.26 each has a contribution
  (26, 'Ephesians 5:19', 14),
  -- v.29 judge the prophets
  (29, '1 Thessalonians 5:19-21', 15),
  (29, '1 John 4:1', 16),
  -- v.32 spirits subject to prophets
  (32, '1 John 4:1', 17),
  -- v.33 God of peace
  (33, 'Romans 15:33', 18),
  (33, '1 Thessalonians 5:23', 19),
  -- v.34 women keep silence
  (34, '1 Timothy 2:11-12', 20),
  (34, '1 Corinthians 11:5', 21),
  -- v.37 commandments of the Lord
  (37, '1 Thessalonians 4:2', 22),
  (37, '2 Peter 3:2', 23),
  -- v.40 decently and in order
  (40, 'Colossians 2:5', 24)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 14
  AND v.verse_number = cr.verse_number;
