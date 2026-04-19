-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 17 — The Harlot on the Beast: Babylon Unveiled
-- 18 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 17,
  'Revelation 17 unveils ''Babylon the Great'' first introduced in 14:8 and 16:19. An angel shows John a vision of a richly-adorned harlot seated upon a scarlet beast with seven heads and ten horns. The harlot represents the seductive world-system of false worship, luxury, and bloodshed; the beast is the political power that carries her — and ultimately destroys her. Much of the chapter is interpretive: the angel decodes the symbols. Seven heads are seven mountains and seven kings; ten horns are ten kings yet to come. The chapter ends with two stunning declarations: that the kings will war against the Lamb but the Lamb will overcome them, and that the beast itself will turn on and consume the harlot. The world-system''s destruction proceeds from within its own corruption, under God''s sovereign hand.',
  'The Harlot on the Beast: Babylon Unveiled',
  'πόρνη (pornē)',
  'A prostitute. In prophetic literature, ''pornē'' is the standard image for unfaithful religion and idolatrous nations (Isa 1:21; Ezek 16; Hos 1-3). Babylon is portrayed as a harlot because she trades intimacy with the true God for the embrace of every empire — selling herself to political power for wealth and influence.',
  '["Section 1 (vv.1-2): Invitation to See the Judgment of the Great Harlot","Section 2 (vv.3-6): The Vision of the Harlot on the Scarlet Beast","Section 3 (vv.7-11): The Mystery of the Beast Explained","Section 4 (vv.12-14): The Ten Kings and War with the Lamb","Section 5 (vv.15-18): The Beast and the Kings Destroy the Harlot"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And there came one of the seven angels which had the seven vials, and talked with me, saying unto me, Come hither; I will shew unto thee the judgment of the great whore that sitteth upon many waters:',
   'Καὶ ἦλθεν εἷς ἐκ τῶν ἑπτὰ ἀγγέλων τῶν ἐχόντων τὰς ἑπτὰ φιάλας, καὶ ἐλάλησεν μετ᾽ ἐμοῦ λέγων· Δεῦρο, δείξω σοι τὸ κρίμα τῆς πόρνης τῆς μεγάλης τῆς καθημένης ἐπὶ ὑδάτων πολλῶν,',
   'Kai ēlthen heis ek tōn hepta angelōn tōn echontōn tas hepta phialas, kai elalēsen met'' emou legōn; Deuro, deixō soi to krima tēs pornēs tēs megalēs tēs kathēmenēs epi hydatōn pollōn,',
   'One of the bowl-angels guides John, indicating that what follows is integral to the bowl judgments — Babylon''s fall is the centerpiece of the seventh bowl. ''Sitting upon many waters'' echoes Jeremiah 51:13 of the original Babylon, which sat by the Euphrates. V.15 will identify the waters as peoples and nations.',
   'God''s judgment of the world-system is part of His worship-restoring purpose. The angel does not merely announce judgment but invites understanding — judgment is intelligible to faith.'),
  (2,
   'With whom the kings of the earth have committed fornication, and the inhabitants of the earth have been made drunk with the wine of her fornication.',
   'μεθ᾽ ἧς ἐπόρνευσαν οἱ βασιλεῖς τῆς γῆς, καὶ ἐμεθύσθησαν οἱ κατοικοῦντες τὴν γῆν ἐκ τοῦ οἴνου τῆς πορνείας αὐτῆς.',
   'meth'' hēs eporneusan hoi basileis tēs gēs, kai emethysthēsan hoi katoikountes tēn gēn ek tou oinou tēs porneias autēs.',
   'Two complementary corruptions: kings ''commit fornication'' with her (political alliance for mutual gain), and ordinary inhabitants are ''made drunk'' on her wine (intoxicated by her cultural and economic spell). She corrupts both rulers and ruled.',
   NULL),
  (3,
   'So he carried me away in the spirit into the wilderness: and I saw a woman sit upon a scarlet coloured beast, full of names of blasphemy, having seven heads and ten horns.',
   'Καὶ ἀπήνεγκέν με εἰς ἔρημον ἐν Πνεύματι. Καὶ εἶδον γυναῖκα καθημένην ἐπὶ θηρίον κόκκινον, γέμον ὀνόματα βλασφημίας, ἔχον κεφαλὰς ἑπτὰ καὶ κέρατα δέκα.',
   'Kai apēnenken me eis erēmon en Pneumati. Kai eidon gynaika kathēmenēn epi thērion kokkinon, gemon onomata blasphēmias, echon kephalas hepta kai kerata deka.',
   '''In the Spirit'' is the standard formula for prophetic vision (1:10; 4:2; 21:10). The wilderness is paradoxical — Israel met God there (Exod 19), yet here John meets the harlot, suggesting spiritual desolation behind the harlot''s glitter. The beast (cf. 13:1) is the same that emerged from the sea — political power covered in blasphemy.',
   NULL),
  (4,
   'And the woman was arrayed in purple and scarlet colour, and decked with gold and precious stones and pearls, having a golden cup in her hand full of abominations and filthiness of her fornication:',
   'Καὶ ἡ γυνὴ ἦν περιβεβλημένη πορφυροῦν καὶ κόκκινον, καὶ κεχρυσωμένη χρυσῷ καὶ λίθῳ τιμίῳ καὶ μαργαρίταις, ἔχουσα ποτήριον χρυσοῦν ἐν τῇ χειρὶ αὐτῆς γέμον βδελυγμάτων καὶ τὰ ἀκάθαρτα τῆς πορνείας αὐτῆς,',
   'Kai hē gynē ēn peribeblēmenē porphyroun kai kokkinon, kai kechrysōmenē chrysō kai lithō timiō kai margaritais, echousa potērion chrysoun en tē cheiri autēs gemon bdelygmatōn kai ta akatharta tēs porneias autēs,',
   'Her wardrobe parodies the high priestly garments and the bride''s adornment. Purple and scarlet are imperial colors; gold, jewels, and pearls signal extravagant wealth. Yet the cup she holds is full of abominations (βδελυγμάτων, the LXX word for idolatrous filth — Dan 9:27). External splendor masks internal corruption.',
   'Worldly glory often masks spiritual filth. The most attractive packaging may carry the most poisonous content. Discernment requires looking past the cup''s gold to its contents.'),
  (5,
   'And upon her forehead was a name written, MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH.',
   'καὶ ἐπὶ τὸ μέτωπον αὐτῆς ὄνομα γεγραμμένον, μυστήριον, Βαβυλὼν ἡ μεγάλη, ἡ μήτηρ τῶν πορνῶν καὶ τῶν βδελυγμάτων τῆς γῆς.',
   'kai epi to metōpon autēs onoma gegrammenon, mystērion, Babylōn hē megalē, hē mētēr tōn pornōn kai tōn bdelygmatōn tēs gēs.',
   'Roman prostitutes wore name-bands on their foreheads; the harlot''s ''name'' on her forehead is a mocking inversion of the seal of God on the saints (7:3) and the name of the Father on the 144,000 (14:1). ''Mystery'' (μυστήριον) signals that the title is symbolic, requiring revelation. ''Mother'' makes her the source from which all earthly idolatry is born.',
   NULL),
  (6,
   'And I saw the woman drunken with the blood of the saints, and with the blood of the martyrs of Jesus: and when I saw her, I wondered with great admiration.',
   'καὶ εἶδον τὴν γυναῖκα μεθύουσαν ἐκ τοῦ αἵματος τῶν ἁγίων καὶ ἐκ τοῦ αἵματος τῶν μαρτύρων Ἰησοῦ. Καὶ ἐθαύμασα ἰδὼν αὐτὴν θαῦμα μέγα.',
   'kai eidon tēn gynaika methyousan ek tou haimatos tōn hagiōn kai ek tou haimatos tōn martyrōn Iēsou. Kai ethaumasa idōn autēn thauma mega.',
   'The harlot is intoxicated not on wine but on blood — the blood of God''s people. Persecution is not a footnote of her career but its essential character. John''s wonder is not approval; the verb ''ethaumasa'' carries the sense of stunned amazement at the audacity and complexity of the vision.',
   'The world-system''s persecution of the church is not random but constitutional. Whenever empire and false religion cooperate, the saints become the target. The blood of martyrs is the harlot''s wine.'),
  (7,
   'And the angel said unto me, Wherefore didst thou marvel? I will tell thee the mystery of the woman, and of the beast that carrieth her, which hath the seven heads and ten horns.',
   'Καὶ εἶπέν μοι ὁ ἄγγελος· Διὰ τί ἐθαύμασας; ἐγὼ ἐρῶ σοι τὸ μυστήριον τῆς γυναικὸς καὶ τοῦ θηρίου τοῦ βαστάζοντος αὐτήν, τοῦ ἔχοντος τὰς ἑπτὰ κεφαλὰς καὶ τὰ δέκα κέρατα.',
   'Kai eipen moi ho angelos; Dia ti ethaumasas? egō erō soi to mystērion tēs gynaikos kai tou thēriou tou bastazontos autēn, tou echontos tas hepta kephalas kai ta deka kerata.',
   'The angel offers explicit interpretation. ''Mystery'' here means a previously hidden truth now revealed (cf. Eph 3:3-6). The vision is not left in cryptic obscurity; God explains.',
   NULL),
  (8,
   'The beast that thou sawest was, and is not; and shall ascend out of the bottomless pit, and go into perdition: and they that dwell on the earth shall wonder, whose names were not written in the book of life from the foundation of the world, when they behold the beast that was, and is not, and yet is.',
   'Τὸ θηρίον ὃ εἶδες ἦν καὶ οὐκ ἔστιν, καὶ μέλλει ἀναβαίνειν ἐκ τῆς ἀβύσσου καὶ εἰς ἀπώλειαν ὑπάγει· καὶ θαυμάσονται οἱ κατοικοῦντες ἐπὶ τῆς γῆς, ὧν οὐ γέγραπται τὸ ὄνομα ἐπὶ τὸ βιβλίον τῆς ζωῆς ἀπὸ καταβολῆς κόσμου, βλεπόντων τὸ θηρίον ὅτι ἦν καὶ οὐκ ἔστιν καὶ παρέσται.',
   'To thērion ho eides ēn kai ouk estin, kai mellei anabainein ek tēs abyssou kai eis apōleian hypagei; kai thaumasontai hoi katoikountes epi tēs gēs, hōn ou gegraptai to onoma epi to biblion tēs zōēs apo katabolēs kosmou, blepontōn to thērion hoti ēn kai ouk estin kai parestai.',
   'The beast''s description ''was, and is not, and yet is'' is a counterfeit of God''s eternal name (1:4, 8). Its ascent ''out of the bottomless pit'' (ἀβύσσου) marks demonic origin; its destination is ''perdition'' (ἀπώλειαν, destruction). Those whose names are not in the book of life will be amazed by the beast — captivated by the spectacle of evil.',
   'God writes names ''from the foundation of the world.'' Election is not invented in response to history; history is the unfolding of eternal decree. Those grounded in election will not be swept away by spectacle; those without it will.'),
  (9,
   'And here is the mind which hath wisdom. The seven heads are seven mountains, on which the woman sitteth.',
   'Ὧδε ὁ νοῦς ὁ ἔχων σοφίαν. Αἱ ἑπτὰ κεφαλαὶ ἑπτὰ ὄρη εἰσίν, ὅπου ἡ γυνὴ κάθηται ἐπ᾽ αὐτῶν.',
   'Hōde ho nous ho echōn sophian. Hai hepta kephalai hepta orē eisin, hopou hē gynē kathētai ep'' autōn.',
   '''Seven mountains'' immediately suggested first-century Rome to John''s readers — the city famously built on seven hills. This grounds the vision in immediate historical reality while not exhausting it: Babylon recurs in every age that mimics Rome''s pattern.',
   NULL),
  (10,
   'And there are seven kings: five are fallen, and one is, and the other is not yet come; and when he cometh, he must continue a short space.',
   'καὶ βασιλεῖς ἑπτά εἰσιν· οἱ πέντε ἔπεσαν, ὁ εἷς ἔστιν, ὁ ἄλλος οὔπω ἦλθεν, καὶ ὅταν ἔλθῃ ὀλίγον αὐτὸν δεῖ μεῖναι.',
   'kai basileis hepta eisin; hoi pente epesan, ho heis estin, ho allos oupō ēlthen, kai hotan elthē oligon auton dei meinai.',
   'The heads also represent kings/kingdoms. Counting in John''s day: five empires had fallen (variously identified as Egypt, Assyria, Babylon, Persia, Greece), one was reigning (Rome), one was yet to come briefly. Many interpretive schemes exist — the symbolic point is that history is divided into a definite sequence under God''s sovereign timing.',
   NULL),
  (11,
   'And the beast that was, and is not, even he is the eighth, and is of the seven, and goeth into perdition.',
   'Καὶ τὸ θηρίον ὃ ἦν καὶ οὐκ ἔστιν, καὶ αὐτὸς ὄγδοός ἐστιν, καὶ ἐκ τῶν ἑπτά ἐστιν, καὶ εἰς ἀπώλειαν ὑπάγει.',
   'Kai to thērion ho ēn kai ouk estin, kai autos ogdoos estin, kai ek tōn hepta estin, kai eis apōleian hypagei.',
   'The beast itself is an ''eighth,'' yet ''of the seven'' — a final, climactic embodiment of the same evil that animated the prior seven kingdoms. Eight is the number of new beginning, here parodied: a counterfeit fresh start that ends in destruction.',
   NULL),
  (12,
   'And the ten horns which thou sawest are ten kings, which have received no kingdom as yet; but receive power as kings one hour with the beast.',
   'Καὶ τὰ δέκα κέρατα ἃ εἶδες δέκα βασιλεῖς εἰσιν, οἵτινες βασιλείαν οὔπω ἔλαβον, ἀλλ᾽ ἐξουσίαν ὡς βασιλεῖς μίαν ὥραν λαμβάνουσιν μετὰ τοῦ θηρίου.',
   'Kai ta deka kerata ha eides deka basileis eisin, hoitines basileian oupō elabon, all'' exousian hōs basileis mian hōran lambanousin meta tou thēriou.',
   'The ten kings are future rulers (in John''s day) who will reign briefly (''one hour''). The image draws on Daniel 7:7, 24. Their rule is delegated, derivative, and short — a mockery of true kingship.',
   NULL),
  (13,
   'These have one mind, and shall give their power and strength unto the beast.',
   'Οὗτοι μίαν γνώμην ἔχουσιν, καὶ τὴν δύναμιν καὶ τὴν ἐξουσίαν αὐτῶν τῷ θηρίῳ διδόασιν.',
   'Houtoi mian gnōmēn echousin, kai tēn dynamin kai tēn exousian autōn tō thēriō didoasin.',
   'A satanic unity — the kings willingly cede their power to the beast. This is the demonic counterpoint to the church''s unity ''of one heart and one soul'' (Acts 4:32). False unity is built on coordinated rebellion against God.',
   NULL),
  (14,
   'These shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings: and they that are with him are called, and chosen, and faithful.',
   'οὗτοι μετὰ τοῦ Ἀρνίου πολεμήσουσιν, καὶ τὸ Ἀρνίον νικήσει αὐτοὺς, ὅτι Κύριος κυρίων ἐστὶν καὶ Βασιλεὺς βασιλέων, καὶ οἱ μετ᾽ αὐτοῦ κλητοὶ καὶ ἐκλεκτοὶ καὶ πιστοί.',
   'houtoi meta tou Arniou polemēsousin, kai to Arnion nikēsei autous, hoti Kyrios kyriōn estin kai Basileus basileōn, kai hoi met'' autou klētoi kai eklektoi kai pistoi.',
   'The decisive verse of the chapter. The kings make war on the Lamb — the only name for Christ in this verse. Yet ''the Lamb shall overcome them'' (νικήσει). The titles ''Lord of lords and King of kings'' (cf. 19:16) declare His supremacy. His followers are described in three layers: called (by gospel summons), chosen (by election), faithful (in response).',
   'The cosmic conflict has a foregone conclusion. The Lamb cannot lose because He is the supreme King. His people share His victory not by their strength but by their identity in Him: called, chosen, faithful — God''s gracious sequence in salvation.'),
  (15,
   'And he saith unto me, The waters which thou sawest, where the whore sitteth, are peoples, and multitudes, and nations, and tongues.',
   'Καὶ λέγει μοι· Τὰ ὕδατα ἃ εἶδες, οὗ ἡ πόρνη κάθηται, λαοὶ καὶ ὄχλοι εἰσὶν καὶ ἔθνη καὶ γλῶσσαι.',
   'Kai legei moi; Ta hydata ha eides, hou hē pornē kathētai, laoi kai ochloi eisin kai ethnē kai glōssai.',
   'Explicit interpretation: the ''many waters'' are the human masses of the world. Babylon''s seat is the world''s populations — she rules by manipulating peoples and nations.',
   NULL),
  (16,
   'And the ten horns which thou sawest upon the beast, these shall hate the whore, and shall make her desolate and naked, and shall eat her flesh, and burn her with fire.',
   'καὶ τὰ δέκα κέρατα ἃ εἶδες καὶ τὸ θηρίον, οὗτοι μισήσουσιν τὴν πόρνην, καὶ ἠρημωμένην ποιήσουσιν αὐτὴν καὶ γυμνὴν, καὶ τὰς σάρκας αὐτῆς φάγονται καὶ αὐτὴν κατακαύσουσιν ἐν πυρί.',
   'kai ta deka kerata ha eides kai to thērion, houtoi misēsousin tēn pornēn, kai ērēmōmenēn poiēsousin autēn kai gymnēn, kai tas sarkas autēs phagontai kai autēn katakausousin en pyri.',
   'The shock of the chapter: the beast that carried the harlot turns and devours her. Evil eventually consumes itself. The four-fold judgment — desolate, stripped, devoured, burned — echoes God''s judgments on Jerusalem''s harlotry (Ezek 16:37-41) and on Babylon (Jer 50:32).',
   'God uses the wicked to judge the wicked. The harlot''s destruction comes not from righteous armies but from her former lovers — sin betrays its devotees. This is a sobering warning that no covenant with evil holds.'),
  (17,
   'For God hath put in their hearts to fulfil his will, and to agree, and give their kingdom unto the beast, until the words of God shall be fulfilled.',
   'Ὁ γὰρ Θεὸς ἔδωκεν εἰς τὰς καρδίας αὐτῶν ποιῆσαι τὴν γνώμην αὐτοῦ, καὶ ποιῆσαι μίαν γνώμην, καὶ δοῦναι τὴν βασιλείαν αὐτῶν τῷ θηρίῳ, ἄχρι τελεσθῶσιν οἱ λόγοι τοῦ Θεοῦ.',
   'Ho gar Theos edōken eis tas kardias autōn poiēsai tēn gnōmēn autou, kai poiēsai mian gnōmēn, kai dounai tēn basileian autōn tō thēriō, achri telesthōsin hoi logoi tou Theou.',
   'The most striking sentence in the chapter: ''God hath put in their hearts to fulfil his will.'' The kings think they act from their own ambition; in fact God is overruling their choices to accomplish His word. They do not act against their own will — they act according to it — but their will itself serves a higher will.',
   'God''s sovereignty extends to the very intents of human hearts (Prov 21:1). Even rebellious choices serve His purposes. This is mystery, not puzzle: the answer is not how but who. The God who governs nations governs hearts.'),
  (18,
   'And the woman which thou sawest is that great city, which reigneth over the kings of the earth.',
   'Καὶ ἡ γυνὴ ἣν εἶδες ἔστιν ἡ πόλις ἡ μεγάλη ἡ ἔχουσα βασιλείαν ἐπὶ τῶν βασιλέων τῆς γῆς.',
   'Kai hē gynē hēn eides estin hē polis hē megalē hē echousa basileian epi tōn basileōn tēs gēs.',
   'The angel''s closing identification: the woman is a great city that holds dominion over earthly kings. In John''s day Rome fit the description; the figure stretches to every world-system that exalts itself over earthly powers and seduces them.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 17;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πόρνης', 'pornēs', 'G4204', 'Prostitute, harlot. In OT prophetic literature, the standard image for unfaithful religion or apostate nations (Isa 1:21; Hos 4:12). Babylon is so named because she trades faithfulness to God for the embrace of every empire.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = 1;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βδελυγμάτων', 'bdelygmatōn', 'G946', 'Abominations — the LXX''s standard term for idolatrous filth (Dan 9:27; 11:31). It is what God finds repulsive, especially false worship and the practices that accompany it.', 1),
  ('πορφυροῦν', 'porphyroun', 'G4210', 'Purple — imperial color, signaling royalty and great wealth. Combined with scarlet, it marks the harlot as imitating the dignity of true royalty while perverting it.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = 4;

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery — a previously hidden truth now revealed by God. Not a puzzle to solve by cleverness but a disclosure granted by revelation. Here it signals that ''Babylon'' is symbolic, requiring the angel''s interpretation.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = 5;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀβύσσου', 'abyssou', 'G12', 'The abyss, bottomless pit. The realm of confined evil spirits (Luke 8:31; Rev 9:1-2; 20:1-3). The beast''s ascent from there marks his demonic origin.', 1),
  ('ἀπώλειαν', 'apōleian', 'G684', 'Destruction, ruin, perdition. The beast''s ultimate destination — not annihilation but the eschatological ruin reserved for those at war with God (Phil 3:19; 2 Thess 2:3).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = 8;

-- Verse 14
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Κύριος κυρίων', 'Kyrios kyriōn', 'G2962', 'Lord of lords. A superlative Hebraic construction (compare ''King of kings,'' ''heaven of heavens,'' ''Holy of Holies''), affirming absolute supremacy over all who claim lordship.', 1),
  ('κλητοὶ', 'klētoi', 'G2822', 'Called — those summoned by the gospel. The first stage in salvation''s sequence (Rom 8:30): God''s effectual call brings sinners to faith.', 2),
  ('ἐκλεκτοὶ', 'eklektoi', 'G1588', 'Chosen, elect — those selected by God before the foundation of the world (Eph 1:4). Election grounds calling, ensuring its effectiveness.', 3),
  ('πιστοί', 'pistoi', 'G4103', 'Faithful — those who endure in trust and obedience. The visible mark of the called and chosen, showing election in action.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = 14;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γνώμην', 'gnōmēn', 'G1106', 'Purpose, intent, mind-set. Used twice in this verse — first of God''s purpose, then of the kings'' coordinated purpose. The play makes the point: God''s purpose is the deeper layer; the kings'' purpose serves it without canceling their agency.', 1),
  ('ἔδωκεν εἰς τὰς καρδίας', 'edōken eis tas kardias', 'G1325/G2588', '''Put into the hearts'' — God acts at the level of inward intent, not coercing but governing. Echoes God''s hardening of Pharaoh''s heart (Exod 4:21) and turning of king''s hearts as a watercourse (Prov 21:1).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Jeremiah 51:13', 1),
  (1, 'Nahum 3:4', 2),
  (1, 'Revelation 19:2', 3),
  (2, 'Isaiah 23:17', 1),
  (2, 'Revelation 14:8', 2),
  (2, 'Revelation 18:3', 3),
  (3, 'Revelation 1:10', 1),
  (3, 'Revelation 13:1', 2),
  (3, 'Daniel 7:7', 3),
  (4, 'Jeremiah 51:7', 1),
  (4, 'Daniel 9:27', 2),
  (4, 'Ezekiel 16:13', 3),
  (5, 'Revelation 14:8', 1),
  (5, 'Genesis 11:9', 2),
  (5, '2 Thessalonians 2:7', 3),
  (6, 'Revelation 6:9-10', 1),
  (6, 'Revelation 18:24', 2),
  (6, 'Acts 7:52', 3),
  (7, 'Ephesians 3:3-6', 1),
  (7, 'Daniel 2:28', 2),
  (8, 'Revelation 11:7', 1),
  (8, 'Revelation 13:8', 2),
  (8, '2 Thessalonians 2:3', 3),
  (9, 'Daniel 7:24', 1),
  (9, 'Revelation 13:18', 2),
  (10, 'Daniel 7:17-25', 1),
  (10, 'Revelation 13:1-2', 2),
  (11, 'Daniel 7:11', 1),
  (11, 'Revelation 13:3', 2),
  (12, 'Daniel 7:7-8', 1),
  (12, 'Daniel 7:24', 2),
  (12, 'Revelation 18:10', 3),
  (13, 'Acts 4:32', 1),
  (13, 'Psalm 2:1-3', 2),
  (14, 'Revelation 19:16', 1),
  (14, 'Romans 8:30', 2),
  (14, '1 Timothy 6:15', 3),
  (14, 'John 10:27-29', 4),
  (15, 'Isaiah 8:7', 1),
  (15, 'Jeremiah 47:2', 2),
  (15, 'Revelation 17:1', 3),
  (16, 'Ezekiel 16:37-41', 1),
  (16, 'Jeremiah 50:32', 2),
  (16, 'Leviticus 21:9', 3),
  (17, 'Proverbs 21:1', 1),
  (17, '2 Thessalonians 2:11', 2),
  (17, 'Isaiah 46:10', 3),
  (18, 'Revelation 16:19', 1),
  (18, 'Revelation 18:18-19', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 17 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 17 Complete!
-- 18 verses · 6 key verses with word studies (12 words)
-- Cross-references for 18 verses (50 refs)
-- ═══════════════════════════════════════════════════════
