-- ═══════════════════════════════════════════════════
-- JUDE CHAPTER 1 — Contending for the Faith
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Jude, the brother of James and half-brother of Jesus, originally intended to write about ''the common salvation'' but was compelled by the Holy Spirit to issue an urgent warning against false teachers who had infiltrated the church. Using vivid Old Testament examples (fallen angels, Sodom, Cain, Balaam, Korah) and even quoting from 1 Enoch, Jude paints a devastating portrait of these men: ungodly, sensual, divisive, and doomed. Yet the letter is not all warning — it also encourages believers to build themselves up in faith, pray in the Spirit, and keep themselves in God''s love. The closing doxology (vv.24-25) is one of the most magnificent in all of Scripture.',
  'Contending Earnestly for the Faith Against Apostasy',
  'ἐπαγωνίζεσθαι (epagōnizesthai)',
  'To contend earnestly, to fight intensely for — from epi (upon, intensifying) + agōnizomai (to wrestle, strive). A once-for-all fight for the faith that demands every effort.',
  '["Greeting (vv.1-2): Jude to the called, beloved, preserved","The Occasion (vv.3-4): Compelled to contend for the faith against infiltrators","Three OT Warnings (vv.5-7): Unbelieving Israel, fallen angels, Sodom and Gomorrah","The False Teachers Described (vv.8-13): Dreamers, rebels, Cain, Balaam, Korah — wandering stars","Prophecy of Enoch (vv.14-16): The Lord comes with ten thousands of His saints","Apostolic Warning Recalled (vv.17-19): Mockers in the last time, sensual, divisive","Exhortations to Believers (vv.20-23): Build, pray, keep, look, have compassion, save","The Great Doxology (vv.24-25): To Him who is able to keep you from falling"]'
FROM books b WHERE b.name = 'Jude';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Jude, the servant of Jesus Christ, and brother of James, to them that are sanctified by God the Father, and preserved in Jesus Christ, and called:',
   'Ἰούδας Ἰησοῦ Χριστοῦ δοῦλος ἀδελφὸς δὲ Ἰακώβου τοῖς ἐν θεῷ πατρὶ ἡγιασμένοις καὶ Ἰησοῦ Χριστῷ τετηρημένοις κλητοῖς',
   'Ioudas Iēsou Christou doulos adelphos de Iakōbou tois en theō patri hēgiasmenois kai Iēsou Christō tetērēmenois klētois',
   'Jude (Judas) was the half-brother of Jesus (Matt 13:55, Mark 6:3), yet he calls himself merely ''servant'' (doulos — slave) of Jesus Christ. He identifies himself through his brother James (the leader of the Jerusalem church, Acts 15) rather than claiming kinship with Jesus — remarkable humility. Three descriptions of believers form a Trinitarian pattern: (1) sanctified (set apart) by God the Father, (2) preserved (kept safe) in Jesus Christ, (3) called — by the Holy Spirit.',
   'The doctrine of preservation: believers are ''kept'' (tetērēmenois — perfect passive participle, having been and continuing to be kept) by Jesus Christ. This same root (tēreō) appears in vv.1, 6, 13, 21, and 24, forming the letter''s backbone: God keeps His people; the ungodly fail to keep their place.'),
  (2,
   'Mercy unto you, and peace, and love, be multiplied.',
   'ἔλεος ὑμῖν καὶ εἰρήνη καὶ ἀγάπη πληθυνθείη',
   'eleos hymin kai eirēnē kai agapē plēthyntheiē',
   'Instead of Paul''s usual ''grace and peace,'' Jude offers ''mercy, peace, and love'' — a triad that echoes the letter''s concerns. Mercy because the readers face deception. Peace because false teachers bring confusion. Love because Jude will call believers to exercise compassion even while contending (vv.22-23). ''Be multiplied'' (plēthyntheiē — optative mood, a prayer-wish) asks God to overflow these qualities.',
   NULL),
  (3,
   'Beloved, when I gave all diligence to write unto you of the common salvation, it was needful for me to write unto you, and exhort you that ye should earnestly contend for the faith which was once delivered unto the saints.',
   'ἀγαπητοί πᾶσαν σπουδὴν ποιούμενος γράφειν ὑμῖν περὶ τῆς κοινῆς ἡμῶν σωτηρίας ἀνάγκην ἔσχον γράψαι ὑμῖν παρακαλῶν ἐπαγωνίζεσθαι τῇ ἅπαξ παραδοθείσῃ τοῖς ἁγίοις πίστει',
   'agapētoi pasan spoudēn poioumenos graphein hymin peri tēs koinēs hēmōn sōtērias anankēn eschon grapsai hymin parakalōn epagōnizesthai tē hapax paradotheisē tois hagiois pistei',
   'The key verse of the letter. Jude intended to write a positive letter about salvation but was compelled (anankēn — necessity, urgency) to write a warning instead. ''Earnestly contend'' (epagōnizesthai — intensified form of ''agonise/wrestle'') — the faith must be actively defended. ''Once delivered'' (hapax paradotheisē — once for all handed over) — the apostolic faith is complete, authoritative, and non-negotiable. It was given (aorist passive — a completed act) and requires no additions or revisions.',
   'The faith has been ''once for all delivered to the saints'' — this implies a fixed body of apostolic doctrine. Christianity is a revealed religion, not an evolving one. The church''s task is to guard, proclaim, and defend this deposit, not to improve or revise it.'),
  (4,
   'For there are certain men crept in unawares, who were before of old ordained to this condemnation, ungodly men, turning the grace of our God into lasciviousness, and denying the only Lord God, and our Lord Jesus Christ.',
   'παρεισέδυσαν γάρ τινες ἄνθρωποι οἱ πάλαι προγεγραμμένοι εἰς τοῦτο τὸ κρίμα ἀσεβεῖς τὴν τοῦ θεοῦ ἡμῶν χάριτα μετατιθέντες εἰς ἀσέλγειαν καὶ τὸν μόνον δεσπότην θεὸν καὶ κύριον ἡμῶν Ἰησοῦν Χριστὸν ἀρνούμενοι',
   'pareisedysan gar tines anthrōpoi hoi palai progegrammenoi eis touto to krima asebeis tēn tou theou hēmōn charita metatithentes eis aselgeian kai ton monon despotēn theon kai kyrion hēmōn Iēsoun Christon arnoumenoi',
   '''Crept in unawares'' (pareisedysan — slipped in secretly, infiltrated) — like spies entering a city. These men were ''before of old ordained'' (progegrammenoi — written about beforehand, prophesied) to condemnation. Their two chief sins: (1) turning grace into licence for immorality (aselgeia — lasciviousness, debauchery), and (2) denying the lordship of Christ. Antinomianism (using grace as an excuse for sin) is the oldest heresy.',
   'The perversion of grace into licence is perhaps the most dangerous heresy because it uses truth (God''s grace) to justify evil (sin). Paul anticipated this objection in Romans 6:1 — ''Shall we continue in sin, that grace may abound? God forbid.'''),
  (5,
   'I will therefore put you in remembrance, though ye once knew this, how that the Lord, having saved the people out of the land of Egypt, afterward destroyed them that believed not.',
   'ὑπομνῆσαι δὲ ὑμᾶς βούλομαι εἰδότας ὑμᾶς ἅπαξ τοῦτο ὅτι ὁ κύριος λαὸν ἐκ γῆς Αἰγύπτου σώσας τὸ δεύτερον τοὺς μὴ πιστεύσαντας ἀπώλεσεν',
   'hypomnēsai de hymas boulomai eidotas hymas hapax touto hoti ho kyrios laon ek gēs Aigyptou sōsas to deuteron tous mē pisteusantas apōlesen',
   'First OT warning: Israel was saved (sōsas) from Egypt but those who did not believe were destroyed (apōlesen) in the wilderness (Num 14:29-35, 1 Cor 10:5-10). Past deliverance does not guarantee future security if faith is abandoned. The pattern: privilege without perseverance leads to judgment.',
   NULL),
  (6,
   'And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.',
   'ἀγγέλους τε τοὺς μὴ τηρήσαντας τὴν ἑαυτῶν ἀρχὴν ἀλλὰ ἀπολιπόντας τὸ ἴδιον οἰκητήριον εἰς κρίσιν μεγάλης ἡμέρας δεσμοῖς ἀϊδίοις ὑπὸ ζόφον τετήρηκεν',
   'angelous te tous mē tērēsantas tēn heautōn archēn alla apolipontas to idion oikētērion eis krisin megalēs hēmeras desmois aïdiois hypo zophon tetērēken',
   'Second OT warning: fallen angels who abandoned their proper domain (archēn — principality, first estate). Most scholars connect this to Genesis 6:1-4 and the ''sons of God'' passage, expanded in 1 Enoch. Note the wordplay on ''keep'' (tēreō): they did not ''keep'' their position, so God ''keeps'' them in chains. ''Everlasting chains under darkness'' — a terrifying image of irreversible imprisonment awaiting final judgment.',
   NULL),
  (7,
   'Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.',
   'ὡς Σόδομα καὶ Γόμορρα καὶ αἱ περὶ αὐτὰς πόλεις τὸν ὅμοιον τρόπον τούτοις ἐκπορνεύσασαι καὶ ἀπελθοῦσαι ὀπίσω σαρκὸς ἑτέρας πρόκεινται δεῖγμα πυρὸς αἰωνίου δίκην ὑπέχουσαι',
   'hōs Sodoma kai Gomorra kai hai peri autas poleis ton homoion tropon toutois ekporneusasai kai apelthousai opisō sarkos heteras prokeintai deigma pyros aiōniou dikēn hypechousai',
   'Third OT warning: Sodom and Gomorrah (Gen 19). ''Strange flesh'' (sarkos heteras — other/different flesh) refers to the perverse desire for angelic beings (Gen 19:5). These cities serve as a permanent ''example'' (deigma — specimen, display) of divine judgment — their destruction by fire is a foretaste of eternal punishment. Jude''s three examples escalate: privileged humans → supernatural beings → entire cities.',
   NULL),
  (8,
   'Likewise also these filthy dreamers defile the flesh, despise dominion, and speak evil of dignities.',
   'ὁμοίως μέντοι καὶ οὗτοι ἐνυπνιαζόμενοι σάρκα μὲν μιαίνουσιν κυριότητα δὲ ἀθετοῦσιν δόξας δὲ βλασφημοῦσιν',
   'homoiōs mentoi kai houtoi enypniazomenoi sarka men miainousin kyriotēta de athetousin doxas de blasphēmousin',
   '''Dreamers'' (enypniazomenoi) — they operate in a fantasy world of false visions. Three charges parallel the three OT examples: (1) defile the flesh (like Sodom), (2) despise dominion/authority (like the fallen angels who rejected God''s order), (3) blaspheme glories/dignities (like Israel who rejected God''s appointed leaders). ''Dignities'' (doxas — glories) likely refers to angelic beings or spiritual authorities.',
   NULL),
  (9,
   'Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, The Lord rebuke thee.',
   'ὁ δὲ Μιχαὴλ ὁ ἀρχάγγελος ὅτε τῷ διαβόλῳ διακρινόμενος διελέγετο περὶ τοῦ Μωϋσέως σώματος οὐκ ἐτόλμησεν κρίσιν ἐπενεγκεῖν βλασφημίας ἀλλ᾽ εἶπεν ἐπιτιμήσαι σοι κύριος',
   'ho de Michaēl ho archangelos hote tō diabolō diakrinomenos dielegeto peri tou Mōyseōs sōmatos ouk etolmēsen krisin epenegkein blasphēmias all'' eipen epitimēsai soi kyrios',
   'Jude draws from Jewish tradition (possibly the ''Assumption of Moses''). Even Michael — the chief angel (archangelos, appearing only here and Dan 10:13,21; 12:1; Rev 12:7) — did not presume to revile Satan directly but deferred to the Lord''s authority: ''The Lord rebuke thee'' (cf. Zech 3:2). The argument from lesser to greater: if the mightiest angel shows restraint toward a fallen being, how much more should these presumptuous men fear to blaspheme spiritual authorities?',
   NULL),
  (10,
   'But these speak evil of those things which they know not: but what they know naturally, as brute beasts, in those things they corrupt themselves.',
   'οὗτοι δὲ ὅσα μὲν οὐκ οἴδασιν βλασφημοῦσιν ὅσα δὲ φυσικῶς ὡς τὰ ἄλογα ζῷα ἐπίστανται ἐν τούτοις φθείρονται',
   'houtoi de hosa men ouk oidasin blasphēmousin hosa de physikōs hōs ta aloga zōa epistantai en toutois phtheirontai',
   'A devastating contrast: they blaspheme what they don''t understand (spiritual realities), and the only things they do understand are brute animal instincts (physikōs — by nature, instinctively) — and even those destroy them. ''Brute beasts'' (aloga zōa — irrational animals) — they have exchanged the image of God for beastly behaviour.',
   NULL),
  (11,
   'Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.',
   'οὐαὶ αὐτοῖς ὅτι τῇ ὁδῷ τοῦ Κάϊν ἐπορεύθησαν καὶ τῇ πλάνῃ τοῦ Βαλαὰμ μισθοῦ ἐξεχύθησαν καὶ τῇ ἀντιλογίᾳ τοῦ Κόρε ἀπώλοντο',
   'ouai autois hoti tē hodō tou Kain eporeuthēsan kai tē planē tou Balaam misthou exechythēsan kai tē antilogia tou Kore apōlonto',
   'Three more OT types in rapid succession: (1) ''The way of Cain'' — false worship, hatred of the righteous, spiritual murder (Gen 4). (2) ''The error of Balaam'' — corrupting God''s people for profit, merchandise of the faith (Num 22-25, 31:16). (3) ''The gainsaying of Korah'' — rebellion against God-appointed authority, challenging the established order (Num 16). These three represent the root sins: hatred, greed, and rebellion.',
   NULL),
  (12,
   'These are spots in your feasts of charity, when they feast with you, feeding themselves without fear: clouds they are without water, carried about of winds; trees whose fruit withereth, without fruit, twice dead, plucked up by the roots;',
   'οὗτοί εἰσιν ἐν ταῖς ἀγάπαις ὑμῶν σπιλάδες συνευωχούμενοι ἀφόβως ἑαυτοὺς ποιμαίνοντες νεφέλαι ἄνυδροι ὑπὸ ἀνέμων παραφερόμεναι δένδρα φθινοπωρινὰ ἄκαρπα δὶς ἀποθανόντα ἐκριζωθέντα',
   'houtoi eisin en tais agapais hymōn spilades syneuōchoumenoi aphobōs heautous poimainontes nephelai anydroi hypo anemōn parapheromenai dendra phthinopōrina akarpa dis apothanonta ekrizōthenta',
   'Jude unleashes a torrent of vivid metaphors: (1) ''Spots'' (spilades — hidden reefs/rocks) in the love feasts (communal meals) — they shipwreck the church from within. (2) ''Feeding themselves'' (heautous poimainontes — shepherding only themselves) — Ezekiel 34:2 language. (3) ''Clouds without water'' — promising but empty. (4) ''Trees... twice dead'' — fruitless in autumn, then uprooted entirely — beyond recovery.',
   NULL),
  (13,
   'Raging waves of the sea, foaming out their own shame; wandering stars, to whom is reserved the blackness of darkness for ever.',
   'κύματα ἄγρια θαλάσσης ἐπαφρίζοντα τὰς ἑαυτῶν αἰσχύνας ἀστέρες πλανῆται οἷς ὁ ζόφος τοῦ σκότους εἰς αἰῶνα τετήρηται',
   'kymata agria thalassēs epaphrizonta tas heautōn aischynas asteres planētai hois ho zophos tou skotous eis aiōna tetērētai',
   'Two final metaphors: (5) ''Raging waves'' foaming up their own shame — violent, chaotic, producing only refuse and pollution (cf. Isaiah 57:20). (6) ''Wandering stars'' (asteres planētai — from which we get ''planet'') — they appear to be lights but follow no ordained path, and for them ''the blackness of darkness'' is reserved forever. Again the wordplay on ''kept/reserved'' (tetērētai) — they who did not keep their course are kept for judgment.',
   NULL),
  (14,
   'And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, the Lord cometh with ten thousands of his saints,',
   'ἐπροφήτευσεν δὲ καὶ τούτοις ἕβδομος ἀπὸ Ἀδὰμ Ἑνὼχ λέγων ἰδοὺ ἦλθεν κύριος ἐν ἁγίαις μυριάσιν αὐτοῦ',
   'eprophēteusen de kai toutois hebdomos apo Adam Henōch legōn idou ēlthen kyrios en hagiais myriasin autou',
   'Jude quotes from 1 Enoch 1:9, a Jewish apocalyptic text. ''The seventh from Adam'' distinguishes this Enoch from Cain''s son of the same name (Gen 4:17). Jude''s use of 1 Enoch does not canonise the entire book, but affirms this particular prophecy as true — just as Paul quoted pagan poets (Acts 17:28, Titus 1:12). ''Ten thousands of his saints'' (myriasin — myriads) — an innumerable heavenly host.',
   'Scripture can cite non-canonical sources to illustrate truth without endorsing every claim in those sources. The inspiration of Jude guarantees the truthfulness of what Jude affirms, regardless of its original source.'),
  (15,
   'To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed, and of all their hard speeches which ungodly sinners have spoken against him.',
   'ποιῆσαι κρίσιν κατὰ πάντων καὶ ἐλέγξαι πάντας τοὺς ἀσεβεῖς αὐτῶν περὶ πάντων τῶν ἔργων ἀσεβείας αὐτῶν ὧν ἠσέβησαν καὶ περὶ πάντων τῶν σκληρῶν ὧν ἐλάλησαν κατ᾽ αὐτοῦ ἁμαρτωλοὶ ἀσεβεῖς',
   'poiēsai krisin kata pantōn kai elenxai pantas tous asebeis autōn peri pantōn tōn ergōn asebeias autōn hōn ēsebēsan kai peri pantōn tōn sklērōn hōn elalēsan kat'' autou hamartōloi asebeis',
   'The word ''ungodly'' (asebēs and its forms) appears four times in this single verse — a hammering repetition emphasising the character, deeds, manner, and identity of the false teachers. ''Hard speeches'' (sklērōn — harsh, rough, offensive words) against God — their blasphemy will be judged alongside their actions. ''All'' (pantas/pantōn) appears five times — judgment is comprehensive.',
   NULL),
  (16,
   'These are murmurers, complainers, walking after their own lusts; and their mouth speaketh great swelling words, having men''s persons in admiration because of advantage.',
   'οὗτοί εἰσιν γογγυσταὶ μεμψίμοιροι κατὰ τὰς ἐπιθυμίας αὐτῶν πορευόμενοι καὶ τὸ στόμα αὐτῶν λαλεῖ ὑπέρογκα θαυμάζοντες πρόσωπα ὠφελείας χάριν',
   'houtoi eisin gongystai memphsimoiroi kata tas epithymias autōn poreuomenoi kai to stoma autōn lalei hyperonka thaumazontes prosōpa ōpheleias charin',
   '''Murmurers'' (gongystai — grumblers, from the same root as Israel''s grumbling in the wilderness). ''Complainers'' (memphsimoiroi — fault-finders, blaming their lot in life). ''Great swelling words'' (hyperonka — arrogant, bombastic, inflated rhetoric). ''Having men''s persons in admiration because of advantage'' — flattering powerful people for personal gain. They grumble about God''s order while fawning over human benefactors.',
   NULL),
  (17,
   'But, beloved, remember ye the words which were spoken before of the apostles of our Lord Jesus Christ;',
   'ὑμεῖς δέ ἀγαπητοί μνήσθητε τῶν ῥημάτων τῶν προειρημένων ὑπὸ τῶν ἀποστόλων τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'hymeis de agapētoi mnēsthēte tōn rhēmatōn tōn proeirēmenōn hypo tōn apostolōn tou kyriou hēmōn Iēsou Christou',
   'The shift from warning to encouragement. ''But beloved'' (agapētoi) — Jude''s tone softens as he turns to his readers. ''Remember'' (mnēsthēte — be mindful of) — the antidote to deception is remembering apostolic teaching. Jude distinguishes himself from ''the apostles,'' suggesting he was not one of the Twelve, consistent with his identification as James''s brother rather than an apostle.',
   NULL),
  (18,
   'How that they told you there should be mockers in the last time, who should walk after their own ungodly lusts.',
   'ὅτι ἔλεγον ὑμῖν ὅτι ἐν ἐσχάτῳ χρόνῳ ἔσονται ἐμπαῖκται κατὰ τὰς ἑαυτῶν ἐπιθυμίας πορευόμενοι τῶν ἀσεβειῶν',
   'hoti elegon hymin hoti en eschatō chronō esontai empaiktai kata tas heautōn epithymias poreuomenoi tōn asebeiōn',
   '''Mockers'' (empaiktai — scoffers, those who mock sacred things) — cf. 2 Peter 3:3 which uses the same word in nearly identical language, confirming the close relationship between Jude and 2 Peter. ''The last time'' (eschatō chronō) — the apostles warned that the final era before Christ''s return would be marked by increasing apostasy. These false teachers are a sign of the times.',
   NULL),
  (19,
   'These be they who separate themselves, sensual, having not the Spirit.',
   'οὗτοί εἰσιν οἱ ἀποδιορίζοντες ψυχικοί πνεῦμα μὴ ἔχοντες',
   'houtoi eisin hoi apodiorizontes psychikoi pneuma mē echontes',
   '''Separate themselves'' (apodiorizontes — create divisions, draw boundary lines) — ironic, since Gnostic-type teachers claimed to be the ''spiritual'' elite. ''Sensual'' (psychikoi — soulish, natural, governed by mere human instinct, not the Spirit). ''Having not the Spirit'' (pneuma mē echontes) — the ultimate verdict. Despite their claims to superior spirituality, they are entirely devoid of the Holy Spirit. Without the Spirit, one does not belong to Christ (Rom 8:9).',
   'The test of true spirituality is not claims or experiences but the presence of the Holy Spirit, evidenced by fruit (Gal 5:22-23) and confession of Christ (1 John 4:2). Those who cause divisions and live by fleshly instinct demonstrate they lack the Spirit entirely.'),
  (20,
   'But ye, beloved, building up yourselves on your most holy faith, praying in the Holy Ghost,',
   'ὑμεῖς δέ ἀγαπητοί τῇ ἁγιωτάτῃ ὑμῶν πίστει ἐποικοδομοῦντες ἑαυτούς ἐν πνεύματι ἁγίῳ προσευχόμενοι',
   'hymeis de agapētoi tē hagiōtatē hymōn pistei epoikodomounteS heautous en pneumati hagiō proseuchomenoi',
   'First of four commands to believers (vv.20-21). ''Building up'' (epoikodomountes — constructing upon a foundation, cf. 1 Cor 3:10-14) — your faith is the foundation; keep building on it. ''Most holy faith'' (hagiōtatē pistei) — a superlative emphasising the sacred character of the apostolic message. ''Praying in the Holy Spirit'' — prayer empowered, directed, and inspired by the Spirit (Rom 8:26-27, Eph 6:18).',
   NULL),
  (21,
   'Keep yourselves in the love of God, looking for the mercy of our Lord Jesus Christ unto eternal life.',
   'ἑαυτοὺς ἐν ἀγάπῃ θεοῦ τηρήσατε προσδεχόμενοι τὸ ἔλεος τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ εἰς ζωὴν αἰώνιον',
   'heautous en agapē theou tērēsate prosdechomenoi to eleos tou kyriou hēmōn Iēsou Christou eis zōēn aiōnion',
   '''Keep yourselves in the love of God'' (tērēsate — guard, maintain your position in) — this is the human side of the divine keeping mentioned in v.1 and v.24. God preserves us (v.1), but we are responsible to remain in His love through obedience (cf. John 15:9-10). ''Looking for'' (prosdechomenoi — eagerly expecting, waiting for) mercy at Christ''s return — eschatological hope. Note the implicit Trinity: the Holy Spirit (v.20), God the Father (v.21a), the Lord Jesus Christ (v.21b).',
   'Divine sovereignty and human responsibility work together: God keeps us (v.1,24), and we keep ourselves (v.21). These are not contradictory but complementary truths — one viewed from God''s perspective, the other from ours.'),
  (22,
   'And of some have compassion, making a difference:',
   'καὶ οὓς μὲν ἐλεᾶτε διακρινομένους',
   'kai hous men eleate diakrinomenous',
   '''Have compassion'' (eleate — show mercy) on ''those who are wavering'' (diakrinomenous — doubting, being divided in mind). Not everyone entangled with false teaching is a hardened false teacher. Some are confused, wavering believers who need gentle rescue. Discernment is required — ''making a difference'' between those who can be helped and those described in the next verse.',
   NULL),
  (23,
   'And others save with fear, pulling them out of the fire; hating even the garment spotted by the flesh.',
   'οὓς δὲ ἐν φόβῳ σῴζετε ἐκ τοῦ πυρὸς ἁρπάζοντες μισοῦντες καὶ τὸν ἀπὸ τῆς σαρκὸς ἐσπιλωμένον χιτῶνα',
   'hous de en phobō sōzete ek tou pyros harpazontes misountes kai ton apo tēs sarkos espilōmenon chitōna',
   '''Pulling them out of the fire'' (ek tou pyros harpazontes — snatching from the flames) — a vivid image of urgent spiritual rescue (cf. Amos 4:11, Zech 3:2). ''With fear'' — even while rescuing, maintain holy caution. ''Hating even the garment spotted by the flesh'' — detest the sin while rescuing the sinner. The ''garment'' (chitōna — inner tunic) symbolises the contamination of sin that clings closely. Handle with extreme care.',
   NULL),
  (24,
   'Now unto him that is able to keep you from falling, and to present you faultless before the presence of his glory with exceeding joy,',
   'τῷ δὲ δυναμένῳ φυλάξαι ὑμᾶς ἀπταίστους καὶ στῆσαι κατενώπιον τῆς δόξης αὐτοῦ ἀμώμους ἐν ἀγαλλιάσει',
   'tō de dynamenō phylaxai hymas aptaistous kai stēsai katenōpion tēs doxēs autou amōmous en agalliasei',
   'The great doxology begins. After all the warnings about falling, Jude anchors everything in God''s power: ''able to keep you from falling'' (phylaxai hymas aptaistous — guard you so that you do not stumble). ''Present you faultless'' (amōmous — without blemish, unblemished, the word used for sacrificial animals without defect) before His glorious presence. ''With exceeding joy'' (agalliasei — exultation, rapturous joy) — the final meeting with God will not be terror but ecstasy.',
   'The doctrine of perseverance: God is able to keep believers from falling and to present them faultless. This is not mere possibility but guaranteed ability — the same God who began the good work will complete it (Phil 1:6). Our security rests not in our grip on God but in His grip on us.'),
  (25,
   'To the only wise God our Saviour, be glory and majesty, dominion and power, both now and ever. Amen.',
   'μόνῳ σοφῷ θεῷ σωτῆρι ἡμῶν διὰ Ἰησοῦ Χριστοῦ τοῦ κυρίου ἡμῶν δόξα μεγαλωσύνη κράτος καὶ ἐξουσία καὶ νῦν καὶ εἰς πάντας τοὺς αἰῶνας ἀμήν',
   'monō sophō theō sōtēri hēmōn dia Iēsou Christou tou kyriou hēmōn doxa megalōsynē kratos kai exousia kai nyn kai eis pantas tous aiōnas amēn',
   'The doxology ascribes four attributes to God ''through Jesus Christ our Lord'': (1) glory (doxa — inherent radiance and honour), (2) majesty (megalōsynē — greatness, used only here and in Heb 1:3 and 8:1), (3) dominion (kratos — sovereign might, ruling power), (4) authority (exousia — rightful power, the right to rule). ''Both now and ever'' (kai nyn kai eis pantas tous aiōnas — now and unto all the ages) — God''s reign is without beginning or end. Amen.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Jude' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 3 (Contend for the faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπαγωνίζεσθαι', 'epagōnizesthai', 'G1864', 'To contend earnestly, to fight intensely — an intensified form of agōnizomai (wrestle/strive). A once-for-all, all-out fight.', 1),
  ('ἅπαξ', 'hapax', 'G530', 'Once for all — a single, unrepeatable, decisive act. The faith was delivered completely and finally.', 2),
  ('παραδοθείσῃ', 'paradotheisē', 'G3860', 'Delivered, handed over, entrusted — aorist passive: the faith was given as a completed deposit to be guarded.', 3),
  ('πίστει', 'pistei', 'G4102', 'The faith — here not personal faith but the objective body of apostolic doctrine, the content of Christian belief.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 4 (Crept in unawares)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παρεισέδυσαν', 'pareisedysan', 'G3921', 'Crept in unawares — slipped in secretly, infiltrated, smuggled in. They entered the church by stealth.', 1),
  ('ἀσέλγειαν', 'aselgeian', 'G766', 'Lasciviousness, licentiousness, sensuality — unrestrained indulgence, especially sexual immorality.', 2),
  ('δεσπότην', 'despotēn', 'G1203', 'Master, Sovereign Lord — from which we get ''despot.'' Absolute authority and ownership. Applied to God and Christ.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = 4;

-- Verse 11 (Cain, Balaam, Korah)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁδῷ', 'hodō', 'G3598', 'Way, road, path — ''the way of Cain'' = the path of self-willed worship, hatred, and spiritual murder.', 1),
  ('πλάνῃ', 'planē', 'G4106', 'Error, deception, wandering — ''the error of Balaam'' = corrupting others for profit, merchandising the faith.', 2),
  ('ἀντιλογίᾳ', 'antilogia', 'G485', 'Gainsaying, contradiction, rebellion — ''the gainsaying of Korah'' = challenging God-appointed authority.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = 11;

-- Verse 12 (Spots in feasts)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σπιλάδες', 'spilades', 'G4694', 'Hidden rocks, reefs — treacherous rocks lurking beneath the surface that shipwreck the unsuspecting.', 1),
  ('ἀγάπαις', 'agapais', 'G26', 'Love feasts — communal meals of the early church, precursors to the Lord''s Supper.', 2),
  ('ποιμαίνοντες', 'poimainontes', 'G4165', 'Feeding/shepherding — they shepherd only themselves, the very sin condemned in Ezekiel 34:2.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = 12;

-- Verse 24 (Able to keep)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δυναμένῳ', 'dynamenō', 'G1410', 'Able, having power — God possesses the ability to keep believers. Root of English ''dynamite/dynamic.''', 1),
  ('φυλάξαι', 'phylaxai', 'G5442', 'To keep, guard, protect — from which we get ''prophylactic'' (preventive guard). God actively guards against stumbling.', 2),
  ('ἀπταίστους', 'aptaistous', 'G679', 'Without stumbling, sure-footed — a NT hapax. Like a horse that never trips. God ensures arrival at the destination.', 3),
  ('ἀμώμους', 'amōmous', 'G299', 'Faultless, without blemish — unblemished sacrificial term. Believers presented spotless before God''s glory.', 4),
  ('ἀγαλλιάσει', 'agalliasei', 'G20', 'Exceeding joy, exultation — ecstatic, triumphant rejoicing. The final meeting with God is pure delight.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = 24;

-- Verse 25 (Doxology)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δόξα', 'doxa', 'G1391', 'Glory — inherent radiance, splendour, honour. The visible manifestation of God''s perfections.', 1),
  ('μεγαλωσύνη', 'megalōsynē', 'G3172', 'Majesty, greatness — used only 3 times in the NT (here, Heb 1:3, 8:1). The immeasurable grandeur of God.', 2),
  ('κράτος', 'kratos', 'G2904', 'Dominion, sovereign might — active ruling power. God''s strength in exercise.', 3),
  ('ἐξουσία', 'exousia', 'G1849', 'Power, authority — the right to rule and the ability to enforce. God''s legitimate, unchallenged sovereignty.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = 25;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Servant, preserved
  (1, 'Matthew 13:55', 1), (1, 'Mark 6:3', 2), (1, 'John 17:11-12', 3), (1, 'Romans 1:6-7', 4),
  -- v2: Mercy, peace, love
  (2, '1 Peter 1:2', 1), (2, '2 John 1:3', 2), (2, '2 Peter 1:2', 3),
  -- v3: Contend for the faith
  (3, '1 Timothy 6:12', 1), (3, '2 Timothy 1:13-14', 2), (3, 'Galatians 1:23', 3), (3, 'Philippians 1:27', 4),
  -- v4: Crept in / grace into licence
  (4, 'Galatians 2:4', 1), (4, 'Romans 6:1-2', 2), (4, '2 Peter 2:1-3', 3), (4, 'Titus 2:11-12', 4),
  -- v5: Israel destroyed
  (5, 'Numbers 14:29-35', 1), (5, '1 Corinthians 10:5-10', 2), (5, 'Hebrews 3:16-19', 3),
  -- v6: Fallen angels
  (6, 'Genesis 6:1-4', 1), (6, '2 Peter 2:4', 2), (6, 'Revelation 20:10', 3),
  -- v7: Sodom and Gomorrah
  (7, 'Genesis 19:1-29', 1), (7, '2 Peter 2:6', 2), (7, 'Matthew 10:15', 3), (7, 'Revelation 21:8', 4),
  -- v9: Michael and the devil
  (9, 'Daniel 10:13,21', 1), (9, 'Revelation 12:7', 2), (9, 'Zechariah 3:2', 3), (9, '2 Peter 2:11', 4),
  -- v11: Cain, Balaam, Korah
  (11, 'Genesis 4:3-8', 1), (11, 'Numbers 22–25', 2), (11, 'Numbers 16:1-35', 3), (11, '2 Peter 2:15', 4), (11, 'Revelation 2:14', 5),
  -- v12: Love feasts
  (12, '2 Peter 2:13', 1), (12, 'Ezekiel 34:2', 2), (12, '1 Corinthians 11:20-22', 3),
  -- v13: Wandering stars
  (13, 'Isaiah 57:20', 1), (13, 'Philippians 2:15', 2), (13, '2 Peter 2:17', 3),
  -- v14: Enoch's prophecy
  (14, 'Genesis 5:18-24', 1), (14, 'Hebrews 11:5', 2), (14, 'Deuteronomy 33:2', 3), (14, 'Matthew 25:31', 4),
  -- v18: Mockers
  (18, '2 Peter 3:3', 1), (18, '1 Timothy 4:1', 2), (18, '2 Timothy 3:1-5', 3),
  -- v19: Sensual, no Spirit
  (19, 'Romans 8:9', 1), (19, '1 Corinthians 2:14', 2), (19, 'James 3:15', 3),
  -- v20: Build, pray
  (20, '1 Corinthians 3:10-14', 1), (20, 'Ephesians 6:18', 2), (20, 'Romans 8:26-27', 3), (20, 'Colossians 2:7', 4),
  -- v21: Keep in love
  (21, 'John 15:9-10', 1), (21, 'Titus 2:13', 2), (21, '2 Timothy 4:8', 3),
  -- v22: Compassion on doubters
  (22, 'Galatians 6:1', 1), (22, 'James 5:19-20', 2),
  -- v23: Pulling from fire
  (23, 'Amos 4:11', 1), (23, 'Zechariah 3:2-4', 2), (23, '1 Corinthians 3:15', 3), (23, 'Revelation 3:4', 4),
  -- v24: Able to keep
  (24, 'Philippians 1:6', 1), (24, 'Romans 16:25', 2), (24, 'Ephesians 3:20', 3), (24, '1 Thessalonians 5:23-24', 4), (24, 'Ephesians 5:27', 5),
  -- v25: Doxology
  (25, 'Romans 16:27', 1), (25, '1 Timothy 1:17', 2), (25, 'Hebrews 13:21', 3), (25, 'Revelation 1:6', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Jude' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Jude Chapter 1 Complete!
-- 25 verses · 7 key verses with word studies (25 words)
-- Cross-references for 22 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════