-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 10 — Warnings from Israel and Idol Feasts
-- 33 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 10,
  'First Corinthians 10 completes the three-chapter discussion on idol food (8-10) with two powerful arguments: a warning from Israel''s history (vv.1-13) and a theology of the Lord''s table (vv.14-22). Paul begins by reminding the Corinthians that ancient Israel had every spiritual advantage: ''all under the cloud, all passed through the sea, all baptised unto Moses, all ate the same spiritual meat, all drank the same spiritual drink'' (vv.1-4). Yet ''with many of them God was not well pleased: for they were overthrown in the wilderness'' (v.5). These events are ''examples'' (typoi) for Christians: Israel''s idolatry, sexual immorality, tempting God, and murmuring all brought divine judgment (vv.6-10). ''These things happened unto them for ensamples: and they are written for our admonition'' (v.11). The warning crystallises in v.12: ''let him that thinketh he standeth take heed lest he fall.'' But v.13 offers assurance: God is faithful and will not allow temptation beyond what believers can endure, always providing ''a way to escape.'' Paul then commands: ''Flee from idolatry'' (v.14). He argues from the Lord''s Supper: the cup and bread are a communion (koinōnia) in Christ''s blood and body (vv.16-17). Likewise, eating idol sacrifices is communion with demons (v.20). ''Ye cannot drink the cup of the Lord, and the cup of devils'' (v.21). The chapter concludes with practical guidelines: buy freely in the marketplace without asking questions of conscience (v.25); eat what is set before you at a dinner (v.27); but if someone says ''this was offered to idols,'' abstain — not for your own conscience but for the informer''s (vv.28-29). The governing maxim: ''Whether therefore ye eat, or drink, or whatsoever ye do, do all to the glory of God'' (v.31).',
  'Warnings from Israel — The Lord''s Table and the Table of Demons',
  'τύπος (typos)',
  'Type, example, pattern, figure — from typtō (to strike, stamp). A typos is a pattern formed by striking, like a die or mold. Paul treats Israel''s wilderness experiences as typoi — divinely intended patterns that foreshadow and warn the church. The exodus generation is a ''type'' of the Corinthian church: both received divine privileges, both faced temptation, and both could be destroyed by presumption. Typological interpretation reads the OT as a pattern for NT realities.',
  '["Israel''s Privileges and Failure (vv.1-5): Moreover brethren I would not that ye should be ignorant how that all our fathers were under the cloud and all passed through the sea and were all baptized unto Moses in the cloud and in the sea and did all eat the same spiritual meat and did all drink the same spiritual drink for they drank of that spiritual Rock that followed them and that Rock was Christ. But with many of them God was not well pleased for they were overthrown in the wilderness","Warnings from the Wilderness: Types for the Church (vv.6-13): Now these things were our examples to the intent we should not lust after evil things as they also lusted. Neither be ye idolaters. Neither let us commit fornication. Neither let us tempt Christ. Neither murmur ye. Let him that thinketh he standeth take heed lest he fall. There hath no temptation taken you but such as is common to man but God is faithful who will not suffer you to be tempted above that ye are able but will with the temptation also make a way to escape that ye may be able to bear it","Flee Idolatry: The Lord''s Table vs the Table of Demons (vv.14-22): Wherefore my dearly beloved flee from idolatry. The cup of blessing which we bless is it not the communion of the blood of Christ. The bread which we break is it not the communion of the body of Christ. Ye cannot drink the cup of the Lord and the cup of devils ye cannot be partakers of the Lord''s table and of the table of devils. Do we provoke the Lord to jealousy are we stronger than he","Practical Guidelines: Eat to God''s Glory (vv.23-33): All things are lawful for me but all things are not expedient all things are lawful for me but all things edify not. Let no man seek his own but every man another''s wealth. Whatsoever is sold in the shambles that eat asking no question for conscience sake for the earth is the Lord''s and the fulness thereof. Whether therefore ye eat or drink or whatsoever ye do do all to the glory of God"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Moreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea;',
   'οὐ θέλω δὲ ὑμᾶς ἀγνοεῖν ἀδελφοί ὅτι οἱ πατέρες ἡμῶν πάντες ὑπὸ τὴν νεφέλην ἦσαν καὶ πάντες διὰ τῆς θαλάσσης διῆλθον',
   'ou thelō de hymas agnoein adelphoi hoti hoi pateres hēmōn pantes hypo tēn nephelēn ēsan kai pantes dia tēs thalassēs diēlthon',
   '''I would not that ye should be ignorant'' — Paul''s formula for introducing important teaching. ''All'' (pantes — repeated five times in vv.1-4) emphasises that every single Israelite participated in these privileges. ''Under the cloud'' — the pillar of cloud that led and protected Israel (Exodus 13:21-22). ''Passed through the sea'' — the Red Sea crossing (Exodus 14:21-22). Paul addresses the Corinthians as heirs of Israel''s story.',
   NULL),
  (2, 'And were all baptized unto Moses in the cloud and in the sea;',
   'καὶ πάντες εἰς τὸν Μωϋσῆν ἐβαπτίσαντο ἐν τῇ νεφέλῃ καὶ ἐν τῇ θαλάσσῃ',
   'kai pantes eis ton Mōysēn ebaptisanto en tē nephelē kai en tē thalassē',
   '''Baptized unto Moses'' (eis ton Mōysēn ebaptisanto — baptized into Moses). The cloud above and the sea on both sides formed a baptismal experience — Israel was immersed in God''s salvation under Moses'' leadership. This is typological: as Christians are baptized into Christ, Israel was ''baptized'' into Moses. The parallel warns: baptism alone does not guarantee perseverance.',
   NULL),
  (3, 'And did all eat the same spiritual meat;',
   'καὶ πάντες τὸ αὐτὸ βρῶμα πνευματικὸν ἔφαγον',
   'kai pantes to auto brōma pneumatikon ephagon',
   '''Spiritual meat'' (brōma pneumatikon — spiritual food; the manna from heaven, Exodus 16). ''Spiritual'' does not mean immaterial but ''provided by the Spirit'' — supernaturally given food. All Israel ate the same divinely provided bread, just as all Christians share the same Lord''s Supper. Privilege was universal; faithfulness was not.',
   NULL),
  (4, 'And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Christ.',
   'καὶ πάντες τὸ αὐτὸ πόμα πνευματικὸν ἔπιον ἔπινον γὰρ ἐκ πνευματικῆς ἀκολουθούσης πέτρας ἡ δὲ πέτρα ἦν ὁ Χριστός',
   'kai pantes to auto poma pneumatikon epion epinon gar ek pneumatikēs akolouthousēs petras hē de petra ēn ho Christos',
   '''Spiritual drink'' — the water from the rock (Exodus 17:6; Numbers 20:11). ''That Rock was Christ'' (hē petra ēn ho Christos — the rock was Christ). Paul identifies the preexistent Christ as the source of Israel''s sustenance. Jewish tradition held that the rock ''followed'' Israel through the wilderness. Paul christologises this tradition: Christ was present with his people even in the OT, providing for them supernaturally.',
   'This is one of the most remarkable christological statements in Paul''s letters. He identifies the wilderness rock with Christ himself — not merely as a type of Christ but as Christ''s actual presence. This implies Christ''s preexistence: he was actively caring for Israel centuries before the incarnation. The verb ''followed'' (akolouthousēs) draws on rabbinic tradition of a travelling well/rock. Paul''s point is pastoral: if Israel fell despite having Christ present with them, the Corinthians should not presume upon their sacramental privileges.'),
  (5, 'But with many of them God was not well pleased: for they were overthrown in the wilderness.',
   'ἀλλ᾿ οὐκ ἐν τοῖς πλείοσιν αὐτῶν εὐδόκησεν ὁ θεός κατεστρώθησαν γὰρ ἐν τῇ ἐρήμῳ',
   'all ouk en tois pleiosin autōn eudokēsen ho theos katestrōthēsan gar en tē erēmō',
   '''Many'' (tois pleiosin — the majority; understatement: of 600,000 men, only Joshua and Caleb entered Canaan). ''Not well pleased'' (ouk eudokēsen — was not pleased, did not approve). ''Overthrown'' (katestrōthēsan — spread out, strewn about; their corpses littered the wilderness). The contrast is devastating: ''all'' received the privileges (vv.1-4), but ''many'' fell under judgment. Sacramental participation without faithfulness avails nothing.',
   NULL),
  (6, 'Now these things were our examples, to the intent we should not lust after evil things, as they also lusted.',
   'ταῦτα δὲ τύποι ἡμῶν ἐγενήθησαν εἰς τὸ μὴ εἶναι ἡμᾶς ἐπιθυμητὰς κακῶν καθὼς κἀκεῖνοι ἐπεθύμησαν',
   'tauta de typoi hēmōn egenēthēsan eis to mē einai hēmas epithymētas kakōn kathōs kakeinoi epethymēsan',
   '''Examples'' (typoi — types, patterns; divinely designed prefigurations). ''Lust after evil things'' (epithymētas kakōn — desirers of evil). Paul now applies the typology: Israel''s wilderness sins are patterns warning the church. The first warning: do not crave evil as they did (Numbers 11:4-34, where Israel craved meat and God sent quail with a plague).',
   NULL),
  (7, 'Neither be ye idolaters, as were some of them; as it is written, The people sat down to eat and drink, and rose up to play.',
   'μηδὲ εἰδωλολάτραι γίνεσθε καθώς τινες αὐτῶν ὡς γέγραπται ἐκάθισεν ὁ λαὸς φαγεῖν καὶ πιεῖν καὶ ἀνέστησαν παίζειν',
   'mēde eidōlolatrai ginesthe kathōs tines autōn hōs gegraptai ekathisen ho laos phagein kai piein kai anestēsan paizein',
   '''Idolaters'' — quoting Exodus 32:6, the golden calf incident. ''Sat down to eat and drink'' — the sacrificial feast before the idol. ''Rose up to play'' (paizein — to play, sport; a euphemism for the sexual revelry that accompanied pagan worship). The connection to the Corinthian situation is direct: eating in idol temples (8:10) involves the same combination of feasting and pagan worship that destroyed Israel.',
   NULL),
  (8, 'Neither let us commit fornication, as some of them committed, and fell in one day three and twenty thousand.',
   'μηδὲ πορνεύωμεν καθώς τινες αὐτῶν ἐπόρνευσαν καὶ ἔπεσον ἐν μιᾷ ἡμέρᾳ εἰκοσιτρεῖς χιλιάδες',
   'mēde porneuōmen kathōs tines autōn eporneusan kai epeson en mia hēmera eikositreis chiliades',
   '''Commit fornication'' — referencing Numbers 25:1-9, where Israelites engaged in sexual immorality with Moabite women at Baal-Peor. ''Twenty and three thousand'' — Numbers 25:9 says 24,000; Paul may cite the number who fell ''in one day'' while the total plague killed more, or he rounds differently. The warning is stark: sexual immorality brought swift, massive judgment.',
   NULL),
  (9, 'Neither let us tempt Christ, as some of them also tempted, and were destroyed of serpents.',
   'μηδὲ ἐκπειράζωμεν τὸν Χριστόν καθώς τινες αὐτῶν ἐπείρασαν καὶ ὑπὸ τῶν ὄφεων ἀπώλοντο',
   'mēde ekpeirazōmen ton Christon kathōs tines autōn epeirasan kai hypo tōn opheōn apōlonto',
   '''Tempt Christ'' (ekpeirazōmen ton Christon — put Christ to the test; some manuscripts read ''the Lord''). Referencing Numbers 21:5-6, where Israel tested God by complaining and was punished with fiery serpents. Paul again identifies Christ as present in the OT wilderness (cf. v.4). To presume upon God''s grace by reckless behavior is to ''tempt'' Christ — testing how far his patience extends.',
   NULL),
  (10, 'Neither murmur ye, as some of them also murmured, and were destroyed of the destroyer.',
   'μηδὲ γογγύζετε καθώς τινες αὐτῶν ἐγόγγυσαν καὶ ἀπώλοντο ὑπὸ τοῦ ὀλοθρευτοῦ',
   'mēde gongyzete kathōs tines autōn egongysan kai apōlonto hypo tou olothreutou',
   '''Murmur'' (gongyzete — grumble, complain; an onomatopoeic word imitating the sound of discontent). ''The destroyer'' (tou olothreutou — the destroying angel; cf. Exodus 12:23; 2 Samuel 24:16). Referencing Numbers 16:41-50, the murmuring after Korah''s rebellion, when 14,700 died in a plague. Four wilderness sins warn the church: craving evil, idolatry, sexual immorality, and murmuring.',
   NULL),
  (11, 'Now all these things happened unto them for ensamples: and they are written for our admonition, upon whom the ends of the world are come.',
   'ταῦτα δὲ πάντα τύποι συνέβαινον ἐκείνοις ἐγράφη δὲ πρὸς νουθεσίαν ἡμῶν εἰς οὓς τὰ τέλη τῶν αἰώνων κατήντησεν',
   'tauta de panta typoi synebainen ekeinois egraphē de pros nouthesian hēmōn eis hous ta telē tōn aiōnōn katēntēsen',
   '''Ensamples'' (typoi — types, prefigurative patterns). ''Admonition'' (nouthesian — warning, instruction that corrects). ''The ends of the world'' (ta telē tōn aiōnōn — the culmination of the ages). The church lives at the climax of redemptive history. Israel''s story was written specifically to warn the last-days people of God. The OT is not merely history but divinely authored instruction for the church.',
   NULL),
  (12, 'Wherefore let him that thinketh he standeth take heed lest he fall.',
   'ὥστε ὁ δοκῶν ἑστάναι βλεπέτω μὴ πέσῃ',
   'hōste ho dokōn hestanai blepetō mē pesē',
   '''Thinketh he standeth'' (ho dokōn hestanai — the one who supposes he stands firm). ''Take heed'' (blepetō — watch out, be on guard). ''Lest he fall'' (mē pesē — lest he collapse). This is the central application: self-confidence is the precursor to spiritual disaster. Israel had every privilege and still fell. The Corinthians'' confidence in their spiritual gifts and knowledge could lead to the same catastrophe. Presumption is the enemy of perseverance.',
   NULL),
  (13, 'There hath no temptation taken you but such as is common to man: but God is faithful, who will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape, that ye may be able to bear it.',
   'πειρασμὸς ὑμᾶς οὐκ εἴληφεν εἰ μὴ ἀνθρώπινος πιστὸς δὲ ὁ θεός ὃς οὐκ ἐάσει ὑμᾶς πειρασθῆναι ὑπὲρ ὃ δύνασθε ἀλλὰ ποιήσει σὺν τῷ πειρασμῷ καὶ τὴν ἔκβασιν τοῦ δύνασθαι ὑπενεγκεῖν',
   'peirasmos hymas ouk eilēphen ei mē anthrōpinos pistos de ho theos hos ouk easei hymas peirasthēnai hyper ho dynasthe alla poiēsei syn tō peirasmō kai tēn ekbasin tou dynasthai hypenenkein',
   '''Temptation'' (peirasmos — testing, trial). ''Common to man'' (anthrōpinos — human, within the scope of human experience). ''God is faithful'' (pistos ho theos). ''Above that ye are able'' (hyper ho dynasthe — beyond your capacity). ''A way to escape'' (tēn ekbasin — the exit, the way out). ''Bear it'' (hypenenkein — endure, carry under the weight). Three promises: (1) no temptation is superhuman; (2) God will not allow testing beyond capacity; (3) God provides an exit strategy with every temptation.',
   'This verse is one of the most comforting in all of Paul''s letters, yet it stands in a context of warning. After the frightening examples of Israel''s failure (vv.1-12), Paul assures: God is faithful. The temptation you face is not unique or impossible. God has already prepared the ''way of escape'' (ekbasin) — not escape from temptation altogether but the ability to endure it faithfully. The verse does not promise freedom from testing but divine provision within it. The God who is faithful will not allow the test to exceed the grace.'),
  (14, 'Wherefore, my dearly beloved, flee from idolatry.',
   'διόπερ ἀγαπητοί μου φεύγετε ἀπὸ τῆς εἰδωλολατρίας',
   'dioper agapētoi mou pheugete apo tēs eidōlolatrias',
   '''Wherefore'' (dioper — for this very reason; drawing the conclusion from vv.1-13). ''Flee'' (pheugete — present imperative: keep fleeing, make it habitual; same command as ''flee fornication'' in 6:18). The proper response to idolatry is not to see how close one can get but how far one can run. After the warnings from Israel, Paul commands decisive separation from anything connected to idol worship.',
   NULL),
  (15, 'I speak as to wise men; judge ye what I say.',
   'ὡς φρονίμοις λέγω κρίνατε ὑμεῖς ὅ φημι',
   'hōs phronimois legō krinate hymeis ho phēmi',
   '''As to wise men'' (phronimois — sensible, prudent people). ''Judge ye'' (krinate — evaluate, assess). Paul appeals to the Corinthians'' own intelligence. He is about to make an argument from the Lord''s Supper that reasonable people should be able to follow. This is respectful rhetoric: he treats them as capable of discernment.',
   NULL),
  (16, 'The cup of blessing which we bless, is it not the communion of the blood of Christ? The bread which we break, is it not the communion of the body of Christ?',
   'τὸ ποτήριον τῆς εὐλογίας ὃ εὐλογοῦμεν οὐχὶ κοινωνία τοῦ αἵματος τοῦ Χριστοῦ ἐστιν τὸν ἄρτον ὃν κλῶμεν οὐχὶ κοινωνία τοῦ σώματος τοῦ Χριστοῦ ἐστιν',
   'to potērion tēs eulogias ho eulogoumen ouchi koinōnia tou haimatos tou Christou estin ton arton hon klōmen ouchi koinōnia tou sōmatos tou Christou estin',
   '''Cup of blessing'' (potērion tēs eulogias — the blessed cup; a Jewish term for the third cup at the Passover meal). ''Communion'' (koinōnia — fellowship, sharing, participation). ''Blood of Christ... body of Christ'' — the Lord''s Supper creates real participation in Christ''s sacrificial death. This is not mere remembrance but genuine spiritual communion — sharing in the reality of Christ''s body and blood.',
   'This verse is foundational for eucharistic theology. Paul''s two rhetorical questions expect the answer ''Yes'': the cup and the bread are koinōnia — participation, communion, sharing — in Christ''s blood and body. This goes beyond memorial: the Lord''s Supper is not merely recalling a past event but participating in its ongoing reality. The nature of this participation (spiritual presence, real presence, symbolic presence) has been debated for centuries. What is clear is that Paul treats the Supper as a genuine encounter with Christ — which is precisely why participation in idol feasts is incompatible with it.'),
  (17, 'For we being many are one bread, and one body: for we are all partakers of that one bread.',
   'ὅτι εἷς ἄρτος ἓν σῶμα οἱ πολλοί ἐσμεν οἱ γὰρ πάντες ἐκ τοῦ ἑνὸς ἄρτου μετέχομεν',
   'hoti heis artos hen sōma hoi polloi esmen hoi gar pantes ek tou henos artou metechomen',
   '''One bread, one body'' — the single loaf represents and creates the unity of Christ''s body, the church. ''We being many'' (hoi polloi — the many). ''All partakers'' (pantes metechomen — all share in). The Lord''s Supper both symbolises and effects the church''s unity: many individuals sharing one bread become one body. This has direct implications for the idol-food debate: shared eating creates communion.',
   NULL),
  (18, 'Behold Israel after the flesh: are not they which eat of the sacrifices partakers of the altar?',
   'βλέπετε τὸν Ἰσραὴλ κατὰ σάρκα οὐχὶ οἱ ἐσθίοντες τὰς θυσίας κοινωνοὶ τοῦ θυσιαστηρίου εἰσίν',
   'blepete ton Israēl kata sarka ouchi hoi esthiontes tas thysias koinōnoi tou thysiastēriou eisin',
   '''Israel after the flesh'' (ton Israēl kata sarka — ethnic Israel). ''Partakers of the altar'' (koinōnoi tou thysiastēriou — sharers in the altar). In OT sacrificial worship, eating the sacrifice created fellowship with the altar (and with the God to whom it was dedicated). The principle: eating sacrificial food creates spiritual communion with the deity to whom it was offered.',
   NULL),
  (19, 'What say I then? that the idol is any thing, or that which is offered in sacrifice to idols is any thing?',
   'τί οὖν φημι ὅτι εἰδωλόθυτόν τί ἐστιν ἢ ὅτι εἴδωλόν τί ἐστιν',
   'ti oun phēmi hoti eidōlothyton ti estin ē hoti eidōlon ti estin',
   'Paul anticipates an objection: am I now saying the idol is something real after all? He reaffirms: the idol itself is nothing (cf. 8:4). But the spiritual reality behind the idol is something real and dangerous — demons.',
   NULL),
  (20, 'But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to God: and I would not that ye should have fellowship with devils.',
   'ἀλλ᾿ ὅτι ἃ θύει τὰ ἔθνη δαιμονίοις θύει καὶ οὐ θεῷ οὐ θέλω δὲ ὑμᾶς κοινωνοὺς τῶν δαιμονίων γίνεσθαι',
   'all hoti ha thyei ta ethnē daimoniois thyei kai ou theō ou thelō de hymas koinōnous tōn daimoniōn ginesthai',
   '''Devils'' (daimoniois — demons). Paul quotes Deuteronomy 32:17 (LXX): pagan sacrifices are offered to demons, not to God. While the idol is nothing, demons stand behind the pagan worship system. ''Fellowship with devils'' (koinōnous tōn daimoniōn — sharers, participants with demons). Eating in an idol temple is not merely a cultural activity — it is spiritual communion with demonic powers.',
   'This verse reveals the deeper reality behind idolatry that the ''knowledge'' party in Corinth had missed. They correctly knew that idols are nothing (8:4), but they failed to perceive that demons exploit the idol system. The idol is an empty form, but the spiritual power behind it is real and malevolent. Paul draws on Deuteronomy 32:17 to show that this has always been true: pagan worship, whatever its human practitioners intend, is ultimately directed to demons. This is why eating in an idol''s temple (8:10) is dangerous — it creates koinōnia with demonic powers.'),
  (21, 'Ye cannot drink the cup of the Lord, and the cup of devils: ye cannot be partakers of the Lord''s table, and of the table of devils.',
   'οὐ δύνασθε ποτήριον κυρίου πίνειν καὶ ποτήριον δαιμονίων οὐ δύνασθε τραπέζης κυρίου μετέχειν καὶ τραπέζης δαιμονίων',
   'ou dynasthe potērion kyriou pinein kai potērion daimoniōn ou dynasthe trapezēs kyriou metechein kai trapezēs daimoniōn',
   '''Ye cannot'' (ou dynasthe — you are not able; not merely ''you should not'' but ''it is impossible''). ''Cup of the Lord... cup of devils'' — mutually exclusive communions. ''Lord''s table... table of devils'' — two tables, two allegiances. Participation in both is a spiritual impossibility, not merely inadvisable. You cannot have fellowship with Christ and fellowship with demons simultaneously. Exclusivity is inherent in covenant loyalty.',
   NULL),
  (22, 'Do we provoke the Lord to jealousy? are we stronger than he?',
   'ἢ παραζηλοῦμεν τὸν κύριον μὴ ἰσχυρότεροι αὐτοῦ ἐσμεν',
   'ē parazēloumen ton kyrion mē ischyroteroi autou esmen',
   '''Provoke to jealousy'' (parazēloumen — stir to jealous anger; echoing Deuteronomy 32:21, where Israel provoked God by turning to other gods). ''Stronger than he?'' — sarcastic: do you think you can compete with God? If Israel''s idolatry provoked God''s devastating judgment in the wilderness, the Corinthians'' flirtation with idol temples will provoke the same divine jealousy. This is the final warning before the practical guidelines.',
   NULL),
  (23, 'All things are lawful for me, but all things are not expedient: all things are lawful for me, but all things edify not.',
   'πάντα μοι ἔξεστιν ἀλλ᾿ οὐ πάντα συμφέρει πάντα μοι ἔξεστιν ἀλλ᾿ οὐ πάντα οἰκοδομεῖ',
   'panta moi exestin all ou panta sympherei panta moi exestin all ou panta oikodomei',
   'Paul repeats the Corinthian slogan from 6:12 with a new second qualifier: ''all things edify not'' (ou panta oikodomei — not everything builds up). The first qualifier was personal (''I will not be enslaved''); the second is communal (''not everything builds the community''). Christian liberty must pass two tests: (1) is it beneficial? (2) does it edify others? Self-interest alone is an insufficient guide.',
   NULL),
  (24, 'Let no man seek his own, but every man another''s wealth.',
   'μηδεὶς τὸ ἑαυτοῦ ζητείτω ἀλλὰ τὸ τοῦ ἑτέρου',
   'mēdeis to heautou zēteitō alla to tou heterou',
   '''Seek his own'' (to heautou zēteitō — pursue one''s own interests). ''Another''s wealth'' (to tou heterou — the other''s good, the neighbour''s benefit). The concise statement of the principle governing all the idol-food discussion: love prioritises the other person''s wellbeing over one''s own rights. This echoes Philippians 2:4 and is the practical outworking of ''love edifieth'' (8:1).',
   NULL),
  (25, 'Whatsoever is sold in the shambles, that eat, asking no question for conscience sake:',
   'πᾶν τὸ ἐν μακέλλῳ πωλούμενον ἐσθίετε μηδὲν ἀνακρίνοντες διὰ τὴν συνείδησιν',
   'pan to en makellō pōloumenon esthiete mēden anakrinontes dia tēn syneidēsin',
   '''Shambles'' (makellō — the meat market, macellum). ''Asking no question'' (mēden anakrinontes — making no investigation, not interrogating). ''For conscience sake'' — don''t torment yourself by asking whether marketplace meat was previously offered to idols. Buy and eat freely. Paul gives maximum liberty in the marketplace: since idols are nothing, the meat is just meat.',
   NULL),
  (26, 'For the earth is the Lord''s, and the fulness thereof.',
   'τοῦ κυρίου γὰρ ἡ γῆ καὶ τὸ πλήρωμα αὐτῆς',
   'tou kyriou gar hē gē kai to plērōma autēs',
   'Quoting Psalm 24:1. ''The earth is the Lord''s'' — all food ultimately belongs to God, regardless of what pagan ritual it may have passed through. An idol cannot change the ownership of what belongs to the Lord. This theological principle liberates the conscience: God owns the meat, not the idol.',
   NULL),
  (27, 'If any of them that believe not bid you to a feast, and ye be disposed to go; whatsoever is set before you, eat, asking no question for conscience sake.',
   'εἰ δέ τις καλεῖ ὑμᾶς τῶν ἀπίστων καὶ θέλετε πορεύεσθαι πᾶν τὸ παρατιθέμενον ὑμῖν ἐσθίετε μηδὲν ἀνακρίνοντες διὰ τὴν συνείδησιν',
   'ei de tis kalei hymas tōn apistōn kai thelete poreuesthai pan to paratithemenon hymin esthiete mēden anakrinontes dia tēn syneidēsin',
   '''Them that believe not'' (tōn apistōn — unbelievers). ''Bid you to a feast'' — a private dinner invitation, not a temple banquet. ''Ye be disposed to go'' (thelete poreuesthai — if you choose to go; attending is optional). ''Eat, asking no question'' — the same freedom applies at a pagan friend''s dinner table. Don''t interrogate the host about the meat''s origins.',
   NULL),
  (28, 'But if any man say unto you, This is offered in sacrifice unto idols, eat not for his sake that shewed it, and for conscience sake: for the earth is the Lord''s, and the fulness thereof:',
   'ἐὰν δέ τις ὑμῖν εἴπῃ τοῦτο εἰδωλόθυτόν ἐστιν μὴ ἐσθίετε δι᾿ ἐκεῖνον τὸν μηνύσαντα καὶ τὴν συνείδησιν τοῦ κυρίου γὰρ ἡ γῆ καὶ τὸ πλήρωμα αὐτῆς',
   'ean de tis hymin eipē touto eidōlothyton estin mē esthiete di ekeinon ton mēnysanta kai tēn syneidēsin tou kyriou gar hē gē kai to plērōma autēs',
   '''If any man say'' — if someone at the dinner explicitly identifies the meat as idol-sacrificed. ''Eat not'' (mē esthiete — do not eat). ''For his sake that shewed it'' (di ekeinon ton mēnysanta — for the sake of the one who informed you). The abstention is not because the meat is inherently defiled but because eating would affect the informer''s conscience. The identity of the informer is debated: possibly a weak Christian or a pagan host testing the guest''s loyalty.',
   NULL),
  (29, 'Conscience, I say, not thine own, but of the other: for why is my liberty judged of another man''s conscience?',
   'συνείδησιν δὲ λέγω οὐχὶ τὴν ἑαυτοῦ ἀλλὰ τὴν τοῦ ἑτέρου ἱνατί γὰρ ἡ ἐλευθερία μου κρίνεται ὑπὸ ἄλλης συνειδήσεως',
   'syneidēsin de legō ouchi tēn heautou alla tēn tou heterou hinati gar hē eleutheria mou krinetai hypo allēs syneidēseōs',
   '''Not thine own, but of the other'' — Paul clarifies: the ''strong'' Christian''s own conscience is not troubled by the meat. The abstention protects the other person''s conscience. ''Why is my liberty judged?'' — a rhetorical question: Paul wants to preserve liberty while exercising it lovingly. He doesn''t want his freedom permanently curtailed by others'' scruples but voluntarily limits it in specific situations for love''s sake.',
   NULL),
  (30, 'For if I by grace be a partaker, why am I evil spoken of for that for which I give thanks?',
   'εἰ ἐγὼ χάριτι μετέχω τί βλασφημοῦμαι ὑπὲρ οὗ ἐγὼ εὐχαριστῶ',
   'ei egō chariti metechō ti blasphēmoumai hyper hou egō eucharistō',
   '''By grace'' (chariti — with thankfulness, by God''s grace). ''Evil spoken of'' (blasphēmoumai — slandered, reviled). ''Give thanks'' (eucharistō — express gratitude). Paul affirms: he can eat with a clear conscience and thanksgiving. But being ''evil spoken of'' defeats the purpose. If exercising liberty causes offense and damages one''s witness, the liberty is better left unused in that situation.',
   NULL),
  (31, 'Whether therefore ye eat, or drink, or whatsoever ye do, do all to the glory of God.',
   'εἴτε οὖν ἐσθίετε εἴτε πίνετε εἴτε τι ποιεῖτε πάντα εἰς δόξαν θεοῦ ποιεῖτε',
   'eite oun esthiete eite pinete eite ti poieite panta eis doxan theou poieite',
   '''To the glory of God'' (eis doxan theou — for God''s glory). The supreme principle that governs all behavior: eating, drinking, and every action should be directed toward God''s glory. This transforms the mundane into the sacred. The question is not merely ''am I allowed?'' or ''does it edify?'' but ''does it glorify God?'' This is the ultimate criterion for all Christian decision-making.',
   'This verse is one of the most all-encompassing ethical statements in the NT. It elevates every human activity — eating, drinking, working, resting — into an act of worship. ''Do all to the glory of God'' means that no area of life is morally neutral or religiously irrelevant. The idol-food debate, which might seem like a trivial cultural question, is actually about something much larger: how every choice either honours or dishonours God. This principle resolves not only the idol-food question but every ethical dilemma the church faces.'),
  (32, 'Give none offence, neither to the Jews, nor to the Gentiles, nor to the church of God:',
   'ἀπρόσκοποι γίνεσθε καὶ Ἰουδαίοις καὶ Ἕλλησιν καὶ τῇ ἐκκλησίᾳ τοῦ θεοῦ',
   'aproskopoi ginesthe kai Ioudaiois kai Hellēsin kai tē ekklēsia tou theou',
   '''Give none offence'' (aproskopoi ginesthe — be blameless, give no occasion for stumbling). Three audiences: Jews, Gentiles (Greeks), and the church. Paul''s concern extends beyond the church to its witness in the broader world. Christian behavior should not needlessly offend any group. This is not people-pleasing but strategic: removing unnecessary barriers to the gospel in every direction.',
   NULL),
  (33, 'Even as I please all men in all things, not seeking mine own profit, but the profit of many, that they may be saved.',
   'καθὼς κἀγὼ πάντα πᾶσιν ἀρέσκω μὴ ζητῶν τὸ ἐμαυτοῦ σύμφορον ἀλλὰ τὸ τῶν πολλῶν ἵνα σωθῶσιν',
   'kathōs kagō panta pasin areskō mē zētōn to emautou sympheron alla to tōn pollōn hina sōthōsin',
   '''I please all men'' — not people-pleasing in the pejorative sense (cf. Galatians 1:10) but accommodating others for their salvation. ''Not seeking mine own profit'' (mē zētōn to emautou sympheron — not pursuing my own advantage). ''That they may be saved'' (hina sōthōsin — the evangelistic motive behind all accommodation). Paul models what he teaches: self-denial, cultural flexibility, and unwavering focus on the salvation of others.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 10;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 rock
  ('πέτρα', 'petra', 'G4073', 'Rock, massive stone, bedrock — distinguished from petros (a stone or pebble), petra is the large, immovable rock foundation. Paul identifies this petra as Christ himself: ''that Rock was Christ.'' The wilderness rock from which Israel drank (Exodus 17:6; Numbers 20:11) was a manifestation of the preexistent Christ who sustained his people. This is one of the strongest NT statements of Christ''s preexistence and his presence in OT redemptive history.', 1),
  -- v.6 examples/types
  ('τύπος', 'typos', 'G5179', 'Type, figure, pattern, example — from typtō (to strike, stamp). Originally the mark left by a blow, then a mold or pattern. Paul uses typos to describe Israel''s wilderness experiences as divinely designed patterns that prefigure and warn the church. This is typological interpretation: the OT events are not mere illustrations but God-ordained foreshadowings of NT realities. The exodus is a ''type'' of Christian experience; Israel''s failure is a ''type'' of potential Christian failure.', 2),
  -- v.13 temptation
  ('πειρασμός', 'peirasmos', 'G3986', 'Temptation, trial, test — from peirazō (to test, try). Peirasmos can be either a temptation to sin or a trial that tests faith — often both simultaneously. Paul''s promise is that no peirasmos exceeds human capacity when God is involved. God does not remove all testing but limits its intensity and provides ''the way of escape'' (tēn ekbasin). This is not fatalism but covenant faithfulness: the God who permits the test also provides the resources to endure it.', 3),
  -- v.16 communion
  ('κοινωνία', 'koinōnia', 'G2842', 'Fellowship, communion, participation, sharing — from koinos (common, shared). Koinōnia is not passive association but active participation. When applied to the Lord''s Supper, it means genuine sharing in Christ''s body and blood — not mere remembrance but real spiritual participation. The same principle applies negatively to idol feasts: eating idol-meat creates koinōnia with demons. This establishes the incompatibility of the two tables.', 4),
  -- v.20 devils/demons
  ('δαιμόνιον', 'daimonion', 'G1140', 'Demon, evil spirit — in Greek thought, daimonia were intermediate spiritual beings (not necessarily evil); in Jewish and Christian usage, they are malevolent spirits opposed to God. Paul draws on Deuteronomy 32:17 to identify the spiritual powers behind pagan worship as demons. The idols may be nothing, but the demonic forces exploiting idol worship are very real. This is Paul''s crucial correction of the ''knowledgeable'' Corinthians'' naive dismissal of idol power.', 5),
  -- v.25 shambles/market
  ('μάκελλον', 'makellon', 'G3111', 'Meat market, shambles — a Latin loanword (macellum) used for the public market where butchered meat was sold. Archaeological evidence from Corinth confirms the existence of such a market near the forum. Much of the meat sold there would have passed through pagan temples before being resold. Paul''s ruling is remarkably liberal: buy whatever is sold without investigating its religious history. The earth is the Lord''s (v.26).', 6),
  -- v.31 glory
  ('δόξα', 'doxa', 'G1391', 'Glory, splendour, honour, majesty — from dokeō (to seem, to think). The visible manifestation of God''s character and worth. ''Do all to the glory of God'' means that every action should make God''s glory visible, should enhance his reputation, should reflect his character. This transforms ethics from rule-keeping to worship: the question is not ''what am I allowed?'' but ''does this display God''s glory?'' This is the ultimate ethical principle in Paul''s theology.', 7),
  -- v.13 way to escape
  ('ἔκβασις', 'ekbasis', 'G1545', 'A way out, exit, escape, outcome — from ek (out of) + basis (a step). Literally a stepping out, a way of egress. God provides not removal of temptation but a passage through it. The definite article (tēn ekbasin — THE way out) suggests God has a specific exit prepared for each specific temptation. This is not a general promise but a particular provision: for every test, there is a divinely prepared escape route.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 10
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 6
    WHEN 3 THEN 13
    WHEN 4 THEN 16
    WHEN 5 THEN 20
    WHEN 6 THEN 25
    WHEN 7 THEN 31
    WHEN 8 THEN 13
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 cloud and sea
  (1, 'Exodus 13:21-22', 1),
  (1, 'Exodus 14:21-22', 2),
  -- v.3 spiritual meat (manna)
  (3, 'Exodus 16:4-35', 3),
  -- v.4 spiritual rock
  (4, 'Exodus 17:6', 4),
  (4, 'Numbers 20:11', 5),
  -- v.5 overthrown
  (5, 'Numbers 14:29-30', 6),
  (5, 'Hebrews 3:17', 7),
  -- v.7 golden calf
  (7, 'Exodus 32:1-6', 8),
  -- v.8 fornication at Baal-Peor
  (8, 'Numbers 25:1-9', 9),
  -- v.9 fiery serpents
  (9, 'Numbers 21:5-6', 10),
  -- v.10 murmuring / destroyer
  (10, 'Numbers 16:41-50', 11),
  -- v.11 written for our admonition
  (11, 'Romans 15:4', 12),
  -- v.12 take heed lest he fall
  (12, 'Romans 11:20', 13),
  (12, 'Proverbs 16:18', 14),
  -- v.13 faithful God
  (13, '1 Thessalonians 5:24', 15),
  (13, '2 Thessalonians 3:3', 16),
  (13, '2 Peter 2:9', 17),
  -- v.14 flee idolatry
  (14, '2 Corinthians 6:16-17', 18),
  (14, '1 John 5:21', 19),
  -- v.16 communion of blood and body
  (16, 'Matthew 26:26-28', 20),
  (16, '1 Corinthians 11:23-26', 21),
  -- v.20 sacrifice to demons
  (20, 'Deuteronomy 32:17', 22),
  (20, 'Psalm 106:37', 23),
  -- v.22 provoke to jealousy
  (22, 'Deuteronomy 32:21', 24),
  -- v.23 all things lawful
  (23, '1 Corinthians 6:12', 25),
  -- v.26 earth is the Lord's
  (26, 'Psalm 24:1', 26),
  -- v.31 do all to glory of God
  (31, 'Colossians 3:17', 27),
  (31, 'Romans 14:6-8', 28),
  -- v.33 please all men
  (33, '1 Corinthians 9:19-22', 29),
  (33, 'Romans 15:2', 30)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 10
  AND v.verse_number = cr.verse_number;
