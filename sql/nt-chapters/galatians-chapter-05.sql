-- ═══════════════════════════════════════════════════
-- GALATIANS CHAPTER 5 — Liberty, the Spirit, and the Fruit
-- 26 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Galatians 5 opens with the great declaration of Christian freedom: ''Stand fast therefore in the liberty wherewith Christ hath made us free, and be not entangled again with the yoke of bondage'' (v.1). Paul warns that if they accept circumcision as necessary for salvation, ''Christ shall profit you nothing'' (v.2) and they are ''fallen from grace'' (v.4). True faith works not through law but ''by love'' (v.6). Paul rebukes the Judaizers: ''a little leaven leaveneth the whole lump'' (v.9). He then addresses the other extreme: liberty is not a licence for the flesh but an opportunity to serve one another in love (v.13). ''For all the law is fulfilled in one word: Thou shalt love thy neighbour as thyself'' (v.14). The great Spirit-flesh contrast follows: ''Walk in the Spirit, and ye shall not fulfil the lust of the flesh'' (v.16). The ''works of the flesh'' are listed (vv.19-21), followed by the magnificent ''fruit of the Spirit'' — love, joy, peace, longsuffering, gentleness, goodness, faith, meekness, temperance (vv.22-23). ''They that are Christ''s have crucified the flesh with the affections and lusts'' (v.24). ''If we live in the Spirit, let us also walk in the Spirit'' (v.25).',
  'Stand in Liberty — Walk by the Spirit',
  'πνεῦμα (pneuma)',
  'Spirit — the Holy Spirit who indwells believers and produces the character of Christ. The Spirit is the alternative to both law-keeping and fleshly indulgence. Walking by the Spirit is the practical answer to the question: if we are free from the law, how do we live?',
  '["Stand Fast in Liberty (vv.1-6): Stand fast therefore in the liberty wherewith Christ hath made us free and be not entangled again with the yoke of bondage; behold I Paul say unto you that if ye be circumcised Christ shall profit you nothing; for I testify again to every man that is circumcised that he is a debtor to do the whole law; Christ is become of no effect unto you whosoever of you are justified by the law ye are fallen from grace; for we through the Spirit wait for the hope of righteousness by faith; for in Jesus Christ neither circumcision availeth any thing nor uncircumcision but faith which worketh by love","The Danger of a Little Leaven (vv.7-12): Ye did run well who did hinder you that ye should not obey the truth; this persuasion cometh not of him that calleth you; a little leaven leaveneth the whole lump; I have confidence in you through the Lord; he that troubleth you shall bear his judgment whosoever he be","Liberty for Love Not License (vv.13-15): For brethren ye have been called unto liberty only use not liberty for an occasion to the flesh but by love serve one another; for all the law is fulfilled in one word even in this thou shalt love thy neighbour as thyself; but if ye bite and devour one another take heed that ye be not consumed one of another","Walk in the Spirit — Works of the Flesh (vv.16-21): This I say then walk in the Spirit and ye shall not fulfil the lust of the flesh; for the flesh lusteth against the Spirit and the Spirit against the flesh and these are contrary the one to the other; now the works of the flesh are manifest which are these adultery fornication uncleanness lasciviousness idolatry witchcraft hatred variance emulations wrath strife seditions heresies envyings murders drunkenness revellings and such like; they which do such things shall not inherit the kingdom of God","The Fruit of the Spirit (vv.22-26): But the fruit of the Spirit is love joy peace longsuffering gentleness goodness faith meekness temperance against such there is no law; and they that are Christ''s have crucified the flesh with the affections and lusts; if we live in the Spirit let us also walk in the Spirit; let us not be desirous of vain glory provoking one another envying one another"]'
FROM books b WHERE b.name = 'Galatians';

-- Step 2: Insert all 26 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Stand fast therefore in the liberty wherewith Christ hath made us free, and be not entangled again with the yoke of bondage.',
   'Τῇ ἐλευθερίᾳ οὖν ᾗ Χριστὸς ἡμᾶς ἠλευθέρωσεν στήκετε καὶ μὴ πάλιν ζυγῷ δουλείας ἐνέχεσθε',
   'Tē eleutheria oun hē Christos hēmas ēleutherōsen stēkete kai mē palin zygō douleias enechesthe',
   '''Stand fast'' (stēkete — stand firm, hold your ground; present imperative: keep on standing). ''Liberty'' (eleutheria — freedom). ''Christ hath made us free'' (Christos hēmas ēleutherōsen — Christ set us free; aorist: a decisive, completed act). ''Yoke of bondage'' (zygō douleias — a yoke of slavery; the yoke metaphor for the law, cf. Acts 15:10). ''Entangled'' (enechesthe — held in, caught in, trapped). The great banner verse of Christian liberty: Christ has already accomplished our freedom; our job is to stand firm in it and not slip back into slavery.',
   'Christian liberty: This verse is the hinge of the entire epistle. Chapters 1-4 proved that believers are free from the law as a system of justification; chapters 5-6 show how to live in that freedom. Liberty is both a gift (Christ set us free) and a responsibility (stand firm). Freedom must be actively maintained — the tendency to revert to legalism or licence is always present.'),
  (2, 'Behold, I Paul say unto you, that if ye be circumcised, Christ shall profit you nothing.',
   'Ἴδε ἐγὼ Παῦλος λέγω ὑμῖν ὅτι ἐὰν περιτέμνησθε Χριστὸς ὑμᾶς οὐδὲν ὠφελήσει',
   'Ide egō Paulos legō hymin hoti ean peritemnēsthe Christos hymas ouden ōphelēsei',
   '''I Paul'' — Paul stakes his personal apostolic authority on this statement. ''If ye be circumcised'' — not circumcision as a cultural practice but as a religious requirement for salvation. ''Christ shall profit you nothing'' (Christos hymas ouden ōphelēsei — Christ will benefit you not at all). If circumcision is necessary for salvation, then Christ''s work is insufficient, and relying on both is worse than relying on Christ alone.',
   NULL),
  (3, 'For I testify again to every man that is circumcised, that he is a debtor to do the whole law.',
   'μαρτύρομαι δὲ πάλιν παντὶ ἀνθρώπῳ περιτεμνομένῳ ὅτι ὀφειλέτης ἐστὶν ὅλον τὸν νόμον ποιῆσαι',
   'martyromai de palin panti anthrōpō peritemnomenō hoti opheiletēs estin holon ton nomon poiēsai',
   '''Debtor'' (opheiletēs — one who owes, one obligated). ''Whole law'' (holon ton nomon — the entire law). If you accept circumcision as necessary, you buy the whole package — you are obligated to keep every command in the law. You cannot pick and choose; the law is all or nothing. This is exactly the impossible burden described in 3:10.',
   NULL),
  (4, 'Christ is become of no effect unto you, whosoever of you are justified by the law; ye are fallen from grace.',
   'κατηργήθητε ἀπὸ τοῦ Χριστοῦ οἵτινες ἐν νόμῳ δικαιοῦσθε τῆς χάριτος ἐξεπέσατε',
   'katērgēthēte apo tou Christou hoitines en nomō dikaiousthe tēs charitos exepesate',
   '''Of no effect'' (katērgēthēte — you have been severed from, rendered inoperative, made null; from katargeō). ''Fallen from grace'' (tēs charitos exepesate — you have fallen out of the sphere of grace). ''Fallen from grace'' does not mean losing salvation but abandoning the principle of grace for the principle of law. To seek justification by law is to leave the realm where grace operates. You cannot be under grace and under law simultaneously.',
   'Falling from grace: This phrase does not describe a loss of salvation but a departure from the grace-principle. The Galatians are not falling into sin but falling into legalism — which is equally dangerous because it replaces Christ''s sufficiency with human effort. Grace and law-justification are mutually exclusive operating systems.'),
  (5, 'For we through the Spirit wait for the hope of righteousness by faith.',
   'ἡμεῖς γὰρ πνεύματι ἐκ πίστεως ἐλπίδα δικαιοσύνης ἀπεκδεχόμεθα',
   'hēmeis gar pneumati ek pisteōs elpida dikaiosynēs apekdechometha',
   '''Through the Spirit'' (pneumati — by means of the Spirit; the instrument). ''By faith'' (ek pisteōs — out of faith; the source). ''Wait'' (apekdechometha — eagerly await, look forward to with patience). ''Hope of righteousness'' — the final, complete vindication at Christ''s return. The Christian life operates by Spirit and faith, not flesh and law. We already have justification; we eagerly await its final consummation.',
   NULL),
  (6, 'For in Jesus Christ neither circumcision availeth any thing, nor uncircumcision; but faith which worketh by love.',
   'ἐν γὰρ Χριστῷ Ἰησοῦ οὔτε περιτομή τι ἰσχύει οὔτε ἀκροβυστία ἀλλὰ πίστις δι᾽ ἀγάπης ἐνεργουμένη',
   'en gar Christō Iēsou oute peritomē ti ischyei oute akrobystia alla pistis di'' agapēs energoumenē',
   '''Neither circumcision ... nor uncircumcision'' — external status is irrelevant. ''Faith which worketh by love'' (pistis di'' agapēs energoumenē — faith operating through love, faith that is energised by love, faith expressing itself in love). This is Paul''s positive statement of what matters: not rituals but faith that produces love. Faith is not merely intellectual assent; genuine faith is active and expresses itself through love.',
   'Faith working through love: This phrase is the bridge between Paul (faith) and James (works). True faith is not passive or intellectual only — it is energised by love and expresses itself in loving action. This is Paul''s answer to the question ''If we are free from the law, what motivates good behaviour?'' Answer: faith activated by love.'),
  (7, 'Ye did run well; who did hinder you that ye should not obey the truth?',
   'Ἐτρέχετε καλῶς τίς ὑμᾶς ἐνέκοψεν τῇ ἀληθείᾳ μὴ πείθεσθαι',
   'Etrechete kalōs tis hymas enekopsen tē alētheia mē peithesthai',
   '''Run well'' (etrechete kalōs — you were running beautifully; imperfect: a sustained, excellent race). ''Hinder'' (enekopsen — cut in, blocked the path; a running metaphor: someone broke into your lane and tripped you). ''Obey the truth'' (tē alētheia peithesthai — to be persuaded by the truth). The Galatians were making excellent progress until the Judaizers cut in and blocked their path.',
   NULL),
  (8, 'This persuasion cometh not of him that calleth you.',
   'ἡ πεισμονὴ οὐκ ἐκ τοῦ καλοῦντος ὑμᾶς',
   'hē peismonē ouk ek tou kalountos hymas',
   '''Persuasion'' (peismonē — the persuading, the influence; used only here in the NT). ''Him that calleth'' (tou kalountos — the One who calls; God). The Judaizers'' message did not come from God who called the Galatians. Whatever sounds persuasive must be tested against its source.',
   NULL),
  (9, 'A little leaven leaveneth the whole lump.',
   'μικρὰ ζύμη ὅλον τὸ φύραμα ζυμοῖ',
   'mikra zymē holon to phyrama zymoi',
   '''Leaven'' (zymē — yeast, sourdough). ''Whole lump'' (holon to phyrama — the entire batch of dough). A proverbial saying (cf. 1 Cor 5:6): a small amount of false teaching spreads through the entire community. The Judaizers'' influence may seem minor (just circumcision!), but the principle corrupts the whole gospel.',
   NULL),
  (10, 'I have confidence in you through the Lord, that ye will be none otherwise minded: but he that troubleth you shall bear his judgment, whosoever he be.',
   'ἐγὼ πέποιθα εἰς ὑμᾶς ἐν κυρίῳ ὅτι οὐδὲν ἄλλο φρονήσετε ὁ δὲ ταράσσων ὑμᾶς βαστάσει τὸ κρίμα ὅστις ἂν ᾖ',
   'egō pepoitha eis hymas en kyriō hoti ouden allo phronēsete ho de tarassōn hymas bastasei to krima hostis an ē',
   '''Confidence'' (pepoitha — I am persuaded, I trust). ''Troubleth'' (tarassōn — the one who agitates, disturbs). ''Shall bear his judgment'' (bastasei to krima — will carry the weight of judgment; whoever is leading them astray will answer to God). ''Whosoever he be'' — even if the false teacher is prominent or authoritative, he will be judged.',
   NULL),
  (11, 'And I, brethren, if I yet preach circumcision, why do I yet suffer persecution? then is the offence of the cross ceased.',
   'Ἐγὼ δέ ἀδελφοί εἰ περιτομὴν ἔτι κηρύσσω τί ἔτι διώκομαι ἄρα κατήργηται τὸ σκάνδαλον τοῦ σταυροῦ',
   'Egō de adelphoi ei peritomēn eti kēryssō ti eti diōkomai ara katērgētai to skandalon tou staurou',
   '''If I yet preach circumcision'' — apparently some were claiming Paul still preached circumcision (perhaps citing Timothy''s case, Acts 16:3). ''Why do I suffer persecution?'' — if Paul preached circumcision, the Jews would stop persecuting him. ''Offence of the cross'' (to skandalon tou staurou — the stumbling-block, the scandal of the cross). The cross is offensive because it declares human effort insufficient. Adding circumcision removes the offence — and the power.',
   NULL),
  (12, 'I would they were even cut off which trouble you.',
   'Ὄφελον καὶ ἀποκόψονται οἱ ἀναστατοῦντες ὑμᾶς',
   'Ophelon kai apokopsontai hoi anastatountes hymas',
   '''Cut off'' (apokopsontai — would mutilate themselves, would cut themselves off). A sharp, even shocking statement. The Judaizers want to cut a little? Paul wishes they would go the whole way and cut themselves off entirely — either by excommunication or (more provocatively) by self-mutilation like the pagan priests of Cybele. Paul''s anger is proportional to the danger.',
   NULL),
  (13, 'For, brethren, ye have been called unto liberty; only use not liberty for an occasion to the flesh, but by love serve one another.',
   'Ὑμεῖς γὰρ ἐπ᾽ ἐλευθερίᾳ ἐκλήθητε ἀδελφοί μόνον μὴ τὴν ἐλευθερίαν εἰς ἀφορμὴν τῇ σαρκί ἀλλὰ διὰ τῆς ἀγάπης δουλεύετε ἀλλήλοις',
   'Hymeis gar ep'' eleutheria eklēthēte adelphoi monon mē tēn eleutherian eis aphormēn tē sarki alla dia tēs agapēs douleuete allēlois',
   '''Called unto liberty'' (ep'' eleutheria eklēthēte — called for the purpose of freedom). ''Occasion'' (aphormēn — a base of operations, a springboard, a launching pad). ''By love serve'' (dia tēs agapēs douleuete — through love, be slaves to one another). The paradox of Christian liberty: freedom from the law leads not to selfishness but to voluntary servitude — serving one another in love. Liberty is not the absence of all obligation but the freedom to love without compulsion.',
   NULL),
  (14, 'For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself.',
   'ὁ γὰρ πᾶς νόμος ἐν ἑνὶ λόγῳ πληροῦται ἐν τῷ Ἀγαπήσεις τὸν πλησίον σου ὡς σεαυτόν',
   'ho gar pas nomos en heni logō plēroutai en tō Agapēseis ton plēsion sou hōs seauton',
   '''All the law is fulfilled'' (pas nomos plēroutai — the entire law is brought to completion). ''In one word'' (en heni logō — in a single statement). ''Love thy neighbour as thyself'' (Lev 19:18). Paul is not abolishing the law''s moral content but showing its fulfilment: love. The one who loves his neighbour fulfils everything the law demands in human relationships. Love does not replace the law; it fulfils it.',
   NULL),
  (15, 'But if ye bite and devour one another, take heed that ye be not consumed one of another.',
   'εἰ δὲ ἀλλήλους δάκνετε καὶ κατεσθίετε βλέπετε μὴ ὑπ᾽ ἀλλήλων ἀναλωθῆτε',
   'ei de allēlous daknete kai katesthiete blepete mē hyp'' allēlōn analōthēte',
   '''Bite'' (daknete — snap at, wound with the mouth). ''Devour'' (katesthiete — eat up, consume). ''Consumed'' (analōthēte — destroyed completely, annihilated). Animal imagery: the Galatians are acting like wild animals tearing each other apart. Legalism does not produce love — it produces criticism, comparison, and conflict.',
   NULL),
  (16, 'This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.',
   'Λέγω δέ πνεύματι περιπατεῖτε καὶ ἐπιθυμίαν σαρκὸς οὐ μὴ τελέσητε',
   'Legō de pneumati peripateite kai epithymian sarkos ou mē telesēte',
   '''Walk in the Spirit'' (pneumati peripateite — conduct your life by means of the Spirit; present imperative: keep on walking). ''Shall not fulfil'' (ou mē telesēte — you will certainly not carry out; the double negative ou mē is the strongest denial in Greek). ''Lust of the flesh'' (epithymian sarkos — the desire of the sinful nature). The command is not ''try harder'' but ''walk by the Spirit.'' The Spirit provides the power that the law never could. Walking by the Spirit is the practical alternative to both legalism and licence.',
   'Walking by the Spirit: This is Paul''s answer to the practical question of the Christian life. If we are free from the law, what prevents moral chaos? The Holy Spirit. The Spirit produces what the law demands but cannot enable. Walking by the Spirit is not a mystical experience but a daily, moment-by-moment dependence on the Spirit''s power and guidance.'),
  (17, 'For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.',
   'ἡ γὰρ σὰρξ ἐπιθυμεῖ κατὰ τοῦ πνεύματος τὸ δὲ πνεῦμα κατὰ τῆς σαρκός ταῦτα δὲ ἀντίκειται ἀλλήλοις ἵνα μὴ ἃ ἂν θέλητε ταῦτα ποιῆτε',
   'hē gar sarx epithymei kata tou pneumatos to de pneuma kata tēs sarkos tauta de antikeitai allēlois hina mē ha an thelēte tauta poiēte',
   '''Lusteth against'' (epithymei kata — desires against, sets its desire in opposition to). ''Contrary'' (antikeitai — are opposed to each other, are at war). The flesh and Spirit are in constant conflict within the believer. This is not a counsel of despair but an explanation of the struggle: the Christian life involves real conflict between two principles. The Spirit provides the power to prevail, but the battle is ongoing.',
   NULL),
  (18, 'But if ye be led of the Spirit, ye are not under the law.',
   'εἰ δὲ πνεύματι ἄγεσθε οὐκ ἐστὲ ὑπὸ νόμον',
   'ei de pneumati agesthe ouk este hypo nomon',
   '''Led of the Spirit'' (pneumati agesthe — being led by the Spirit; present passive: the Spirit is the leader). ''Not under the law'' (ouk este hypo nomon). If the Spirit is your guide, the law is not your master. The Spirit-led life operates on a different principle from the law-governed life. This does not mean the Spirit contradicts the law''s moral content but that the Spirit achieves what the law aimed for through a different means.',
   NULL),
  (19, 'Now the works of the flesh are manifest, which are these; Adultery, fornication, uncleanness, lasciviousness,',
   'φανερὰ δέ ἐστιν τὰ ἔργα τῆς σαρκός ἅτινά ἐστιν μοιχεία πορνεία ἀκαθαρσία ἀσέλγεια',
   'phanera de estin ta erga tēs sarkos hatina estin moicheia porneia akatharsia aselgeia',
   '''Works'' (erga — deeds, acts; plural: the flesh produces multiple acts). ''Manifest'' (phanera — obvious, plain to see). Four sexual sins: ''Adultery'' (moicheia — marital unfaithfulness), ''fornication'' (porneia — all sexual immorality), ''uncleanness'' (akatharsia — moral impurity), ''lasciviousness'' (aselgeia — sensuality, shameless excess, lack of self-restraint).',
   NULL),
  (20, 'Idolatry, witchcraft, hatred, variance, emulations, wrath, strife, seditions, heresies,',
   'εἰδωλολατρεία φαρμακεία ἔχθραι ἔρεις ζῆλοι θυμοί ἐριθεῖαι διχοστασίαι αἱρέσεις',
   'eidōlolatreia pharmakeia echthrai ereis zēloi thymoi eritheiai dichostasiai haireseis',
   'Two religious sins: ''Idolatry'' (eidōlolatreia — idol worship), ''witchcraft'' (pharmakeia — sorcery, drug-related magic; the root of ''pharmacy''). Eight social sins: ''hatred'' (echthrai — enmities), ''variance'' (ereis — strife, quarrelling), ''emulations'' (zēloi — jealousies), ''wrath'' (thymoi — outbursts of anger), ''strife'' (eritheiai — selfish ambition, faction-building), ''seditions'' (dichostasiai — divisions), ''heresies'' (haireseis — parties, sects, divisive opinions).',
   NULL),
  (21, 'Envyings, murders, drunkenness, revellings, and such like: of the which I tell you before, as I have also told you in time past, that they which do such things shall not inherit the kingdom of God.',
   'φθόνοι φόνοι μέθαι κῶμοι καὶ τὰ ὅμοια τούτοις ἃ προλέγω ὑμῖν καθὼς καὶ προεῖπον ὅτι οἱ τὰ τοιαῦτα πράσσοντες βασιλείαν θεοῦ οὐ κληρονομήσουσιν',
   'phthonoi phonoi methai kōmoi kai ta homoia toutois ha prolegō hymin kathōs kai proeipon hoti hoi ta toiauta prassontes basileian theou ou klēronomēsousin',
   '''Envyings'' (phthonoi — envy, resentment at another''s good), ''murders'' (phonoi — killings), ''drunkenness'' (methai), ''revellings'' (kōmoi — carousing, drinking parties). ''Such like'' (ta homoia — and things similar; the list is representative, not exhaustive). ''They which do'' (hoi prassontes — those who practise, habitually do). ''Shall not inherit the kingdom of God'' — habitual, unrepentant practice of these sins is incompatible with belonging to God''s kingdom.',
   NULL),
  (22, 'But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,',
   'ὁ δὲ καρπὸς τοῦ πνεύματός ἐστιν ἀγάπη χαρά εἰρήνη μακροθυμία χρηστότης ἀγαθωσύνη πίστις',
   'ho de karpos tou pneumatos estin agapē chara eirēnē makrothymia chrēstotēs agathōsynē pistis',
   '''Fruit'' (karpos — singular: one fruit with nine aspects, not nine separate fruits; organic growth, not manufactured output). ''Love'' (agapē — selfless, sacrificial love; the root from which all others grow). ''Joy'' (chara — delight, gladness rooted in God). ''Peace'' (eirēnē — wholeness, tranquillity). ''Longsuffering'' (makrothymia — patience under provocation, long-endurance). ''Gentleness'' (chrēstotēs — kindness, moral goodness expressed graciously). ''Goodness'' (agathōsynē — active benevolence, doing good). ''Faith'' (pistis — faithfulness, reliability, trustworthiness).',
   'The fruit of the Spirit: In contrast to the ''works'' (plural) of the flesh, the Spirit produces one ''fruit'' (singular) — a unified cluster of Christlike character. The fruit is not achieved by effort but grown by the Spirit. It is not a to-do list but the natural product of walking in the Spirit. Each quality reflects the character of Christ Himself.'),
  (23, 'Meekness, temperance: against such there is no law.',
   'πραΰτης ἐγκράτεια κατὰ τῶν τοιούτων οὐκ ἔστιν νόμος',
   'prautēs engkrateia kata tōn toioutōn ouk estin nomos',
   '''Meekness'' (prautēs — gentleness, humility, strength under control; not weakness but power restrained). ''Temperance'' (engkrateia — self-control, mastery over desires and impulses). ''Against such there is no law'' (kata tōn toioutōn ouk estin nomos — no law stands against these qualities). The final, ironic understatement: the law has nothing to say against the Spirit''s fruit. Those who walk by the Spirit naturally exceed any standard the law could set.',
   NULL),
  (24, 'And they that are Christ''s have crucified the flesh with the affections and lusts.',
   'οἱ δὲ τοῦ Χριστοῦ Ἰησοῦ τὴν σάρκα ἐσταύρωσαν σὺν τοῖς παθήμασιν καὶ ταῖς ἐπιθυμίαις',
   'hoi de tou Christou Iēsou tēn sarka estaurōsan syn tois pathēmasin kai tais epithymiais',
   '''They that are Christ''s'' (hoi tou Christou — those belonging to Christ). ''Crucified the flesh'' (tēn sarka estaurōsan — put the flesh to death on the cross; aorist: a decisive past action). ''Affections'' (pathēmasin — passions, desires). ''Lusts'' (epithymiais — cravings). At conversion, believers made a decisive break with the flesh. The flesh''s passions and desires have been put to death in principle. The ongoing walk in the Spirit (v.25) is the practical outworking of this definitive act.',
   NULL),
  (25, 'If we live in the Spirit, let us also walk in the Spirit.',
   'εἰ ζῶμεν πνεύματι πνεύματι καὶ στοιχῶμεν',
   'ei zōmen pneumati pneumati kai stoichōmen',
   '''Live in the Spirit'' (zōmen pneumati — if we have our life by the Spirit; a condition assumed as true). ''Walk in the Spirit'' (pneumati stoichōmen — let us keep in step with the Spirit; stoicheō means to walk in a line, to march in formation, to keep step). A different word from peripateō (v.16); stoicheō implies orderly, disciplined alignment. If the Spirit gave us life, we should walk in step with His leading.',
   NULL),
  (26, 'Let us not be desirous of vain glory, provoking one another, envying one another.',
   'μὴ γινώμεθα κενόδοξοι ἀλλήλους προκαλούμενοι ἀλλήλοις φθονοῦντες',
   'mē ginōmetha kenodoxoi allēlous prokalomenoi allēlois phthonountes',
   '''Vain glory'' (kenodoxoi — empty glory, conceited; from kenos, empty + doxa, glory). ''Provoking'' (prokalomenoi — challenging, calling out). ''Envying'' (phthonountes — resenting, begrudging). Three relational sins that destroy community: conceit (thinking you''re better), provocation (challenging those below you), and envy (resenting those above you). The Spirit''s fruit of love, humility, and self-control is the antidote.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Galatians' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 1 (Liberty / stand fast)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλευθερίᾳ', 'eleutheria', 'G1657', 'Liberty, freedom — the state of being free from bondage, whether to the law, sin, or human tradition. Christ purchased this freedom at the cost of His own blood. It must be actively maintained by standing firm.', 1),
  ('στήκετε', 'stēkete', 'G4739', 'Stand firm, stand fast — from stēkō (to stand). Present imperative: keep on standing, do not give ground. Military imagery: hold your position against the assault of the Judaizers.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 5 AND v.verse_number = 1;

-- Verse 16 (Walk in the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('περιπατεῖτε', 'peripateite', 'G4043', 'Walk, conduct your life — from peripateō (to walk around). A Hebraic metaphor for the whole of one''s conduct and lifestyle. Present imperative: make this your ongoing way of life. Walking by the Spirit is the moment-by-moment dependence on His power.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 5 AND v.verse_number = 16;

-- Verse 22 (Fruit of the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καρπός', 'karpos', 'G2590', 'Fruit — singular, not plural. One fruit with nine manifestations. Fruit grows naturally from a living tree; it is not manufactured. The Spirit produces Christlike character organically in believers who walk by Him.', 1),
  ('ἀγάπη', 'agapē', 'G26', 'Love — the first and foundational virtue, from which all others flow. Selfless, sacrificial, Christlike love. This is the love that "worketh by" faith (v.6) and fulfils the whole law (v.14).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 5 AND v.verse_number = 22;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Stand fast in liberty
  (1, 'John 8:36', 1), (1, 'Galatians 4:31', 2), (1, 'Acts 15:10', 3),
  -- v4: Fallen from grace
  (4, 'Romans 11:6', 1), (4, 'Galatians 2:21', 2),
  -- v6: Faith working by love
  (6, 'James 2:18-22', 1), (6, '1 Corinthians 7:19', 2), (6, '1 Thessalonians 1:3', 3),
  -- v13: Liberty for love
  (13, '1 Peter 2:16', 1), (13, 'Romans 13:8-10', 2),
  -- v14: Love thy neighbour
  (14, 'Leviticus 19:18', 1), (14, 'Romans 13:10', 2), (14, 'Matthew 22:39-40', 3),
  -- v16: Walk in the Spirit
  (16, 'Romans 8:4', 1), (16, 'Romans 8:13', 2),
  -- v17: Flesh vs Spirit
  (17, 'Romans 7:15-23', 1), (17, '1 Peter 2:11', 2),
  -- v22: Fruit of the Spirit
  (22, 'Ephesians 5:9', 1), (22, 'Colossians 3:12-15', 2), (22, 'John 15:1-5', 3),
  -- v24: Crucified the flesh
  (24, 'Romans 6:6', 1), (24, 'Colossians 3:5', 2), (24, 'Galatians 2:20', 3),
  -- v25: Walk / keep step with the Spirit
  (25, 'Romans 8:14', 1), (25, 'Galatians 5:16', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Galatians Chapter 5 Complete
-- 26 verses · 4 key verses with word studies (6 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
