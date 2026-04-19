-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 13 — The Rise of the Two Beasts and the Mark of Deception
-- 18 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 13,
  'Revelation 13 vividly portrays the rise and activity of two symbolic beasts, agents of the dragon (Satan), who seek to usurp divine authority and demand worship. The first beast, emerging from the sea, embodies political power and blasphemy, mimicking Christ''s death and resurrection to deceive the world. The second beast, from the earth, acts as a religious deceiver, performing false miracles and coercing humanity to worship the first beast and receive its mark. Historically, this chapter has been interpreted in various ways, from identifying specific Roman emperors (like Nero) to symbolizing oppressive political systems or future antichrist figures. Theologically, it underscores the pervasive nature of evil, the ultimate sovereignty of God, and the call for endurance and faithfulness among believers in the face of intense persecution and deception. It highlights the spiritual battle between Christ and Satan, culminating in the establishment of God''s eternal kingdom.',
  'The Rise of the Two Beasts and the Mark of Deception',
  'θηρίον (thērion)',
  'From a diminutive of ''thēr'' (a wild animal), ''thērion'' refers to a wild beast, often with negative connotations. In Revelation, it symbolizes oppressive, anti-God powers, both political and religious, that emerge from the ''sea'' (nations/chaos) and ''earth'' (humanity/religious systems) to persecute saints and demand worship, ultimately serving the dragon.',
  '["Section 1 (vv.1-4): The First Beast from the Sea and its Blasphemous Authority","Section 2 (vv.5-8): The Global Dominion and Worship of the First Beast","Section 3 (vv.9-10): A Call to Endurance and Divine Retribution","Section 4 (vv.11-14): The Second Beast from the Earth and its Deceptive Miracles","Section 5 (vv.15-18): The Image, the Mark, and the Number of the Beast"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy.',
   'Καὶ εἶδον ἐκ τῆς θαλάσσης θηρίον ἀναβαῖνον, ἔχον κέρατα δέκα καὶ κεφαλὰς ἑπτά, καὶ ἐπὶ τῶν κεράτων αὐτοῦ δέκα διαδήματα, καὶ ἐπὶ τὰς κεφαλὰς αὐτοῦ ὀνόματα βλασφημίας.',
   'Kai eidon ek tēs thalassēs thērion anabainon, echon kerata deka kai kephalas hepta, kai epi tōn keratōn autou deka diadēmata, kai epi tas kephalas autou onomata blasphēmias.',
   'John sees a ''beast'' (θηρίον, thērion) rising from the ''sea,'' often symbolizing the turbulent nations or chaos (cf. Dan 7:2-3). Its description—seven heads and ten horns with crowns—echoes the dragon of Revelation 12:3 and Daniel 7, indicating a continuity of satanic power through various empires. The ''names of blasphemy'' on its heads signify its inherent opposition to God and its claim to divine prerogatives. This imagery points to a powerful, composite entity, drawing characteristics from historical empires that oppressed God''s people.',
   'This verse introduces the Antichrist figure, a powerful political entity empowered by Satan. Its blasphemous nature and usurpation of divine attributes highlight the ultimate conflict between God''s sovereignty and the rebellion of evil forces. The beast''s origin from the ''sea'' suggests its rise from human society and political structures, demonstrating how worldly power can be corrupted to oppose God.'),
  (2,
   'And the beast which I saw was like unto a leopard, and his feet were as the feet of a bear, and his mouth as the mouth of a lion: and the dragon gave him his power, and his seat, and great authority.',
   'Καὶ τὸ θηρίον ὃ εἶδον ἦν ὅμοιον παρδάλει, καὶ οἱ πόδες αὐτοῦ ὡς ἄρκου, καὶ τὸ στόμα αὐτοῦ ὡς στόμα λέοντος. Καὶ ἔδωκεν αὐτῷ ὁ δράκων τὴν δύναμιν αὐτοῦ καὶ τὸν θρόνον αὐτοῦ καὶ ἐξουσίαν μεγάλην.',
   'Kai to thērion ho eidon ēn homoion pardalei, kai hoi podes autou hōs arkou, kai to stoma autou hōs stoma leontos. Kai edōken autō ho drakōn tēn dynamin autou kai ton thronon autou kai exousian megalēn.',
   'The beast''s composite nature—like a leopard, with bear''s feet and a lion''s mouth—directly alludes to the four beasts in Daniel 7, which represented successive world empires (Babylon, Persia, Greece, Rome). This suggests the beast embodies the cumulative evil and oppressive power of all previous anti-God empires. Crucially, ''the dragon'' (Satan, Rev 12:9) explicitly gives this beast its ''power, and his seat, and great authority,'' revealing the demonic source behind this worldly dominion. This highlights the spiritual forces at play behind earthly political structures.',
   'The direct empowerment of the beast by the dragon (Satan) reveals the true spiritual battle underlying earthly conflicts. This entity is not merely a human ruler but a tool of cosmic evil, granted authority to oppose God''s kingdom. Believers are called to discern the spiritual forces behind worldly power structures and resist their deceptive influence, recognizing that ultimate authority belongs to God alone.'),
  (3,
   'And I saw one of his heads as it were wounded to death; and his deadly wound was healed: and all the world wondered after the beast.',
   'Καὶ μίαν ἐκ τῶν κεφαλῶν αὐτοῦ ὡς ἐσφαγμένην εἰς θάνατον, καὶ ἡ πληγὴ τοῦ θανάτου αὐτοῦ ἐθεραπεύθη. Καὶ ἐθαύμασεν ὅλη ἡ γῆ ὀπίσω τοῦ θηρίου.',
   'Kai mian ek tōn kephalōn autou hōs esphagmenēn eis thanaton, kai hē plēgē tou thanatou autou etherapeuthē. Kai ethaumasen holē hē gē opisō tou thēriou.',
   'One of the beast''s heads appears ''wounded to death'' but then ''healed,'' a satanic parody of Christ''s death and resurrection (Rev 5:6). This miraculous recovery garners universal admiration and allegiance, as ''all the world wondered after the beast.'' This deception is a key element of the beast''s power, convincing people of its invincibility and divine favor. Early church fathers like Irenaeus saw this as a sign of the Antichrist''s deceptive power, mimicking divine acts to mislead humanity.',
   'This ''deadly wound healed'' is a crucial element of the beast''s deception, mimicking Christ''s resurrection to gain global worship. It underscores the enemy''s strategy of imitation and counterfeit, attempting to usurp the unique redemptive work of Christ. This event serves as a warning against being swayed by impressive signs and wonders that lack divine origin and purpose.'),
  (4,
   'And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?',
   'Καὶ προσεκύνησαν τῷ δράκοντι ὅτι ἔδωκεν τὴν ἐξουσίαν τῷ θηρίῳ, καὶ προσεκύνησαν τῷ θηρίῳ λέγοντες, Τίς ὅμοιος τῷ θηρίῳ; καὶ τίς δύναται πολεμῆσαι μετ᾽ αὐτοῦ;',
   'Kai prosekynēsan tō drakonti hoti edōken tēn exousian tō thēriō, kai prosekynēsan tō thēriō legontes, Tis homoios tō thēriō? kai tis dynatai polemēsai met'' autou?',
   'The world''s worship extends first to the dragon (Satan) for empowering the beast, and then directly to the beast itself. Their cry, ''Who is like unto the beast? who is able to make war with him?'' is a blasphemous inversion of praise due to God (cf. Ps 35:10; Exod 15:11). This highlights the beast''s success in diverting worship from the Creator to the creature and the spiritual power behind it. This universal worship signifies a complete spiritual capitulation to evil.',
   'The act of worshipping the dragon and the beast represents the ultimate rebellion against God. It signifies a complete surrender to satanic authority and a rejection of the true God. This false worship is a central theme in Revelation, contrasting with the worship of God and the Lamb, and serves as a stark warning against idolatry and allegiance to worldly powers that oppose Christ.'),
  (5,
   'And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.',
   'Καὶ ἐδόθη αὐτῷ στόμα λαλοῦν μεγάλα καὶ βλασφημίας, καὶ ἐδόθη αὐτῷ ἐξουσία ποιῆσαι μῆνας τεσσεράκοντα δύο.',
   'Kai edothē autō stoma laloun megala kai blasphēmias, kai edothē autō exousia poiēsai mēnas tesserakonta duo.',
   'The beast is given a ''mouth speaking great things and blasphemies,'' echoing Daniel 7:8, 25, where the ''little horn'' speaks against the Most High. This emphasizes its arrogant and defiant nature against God. The duration of its power, ''forty and two months,'' is equivalent to three-and-a-half years or 1,260 days (Rev 11:2-3, 12:6), a symbolic period of tribulation and persecution for God''s people. This limited timeframe, ''given'' by God, assures believers that evil''s reign is not absolute but divinely permitted and ultimately controlled.',
   'The beast''s blasphemous speech and limited reign of ''forty and two months'' underscore God''s ultimate sovereignty. Even in the midst of intense evil, God sets boundaries for its activity. This provides comfort to believers, knowing that the period of tribulation, though severe, is finite and under divine control, serving God''s larger redemptive plan.'),
  (6,
   'And he opened his mouth in blasphemy against God, to blaspheme his name, and his tabernacle, and them that dwell in heaven.',
   'Καὶ ἤνοιξεν τὸ στόμα αὐτοῦ εἰς βλασφημίαν πρὸς τὸν Θεόν, βλασφημῆσαι τὸ ὄνομα αὐτοῦ καὶ τὴν σκηνὴν αὐτοῦ, τοὺς ἐν τῷ οὐρανῷ σκηνοῦντας.',
   'Kai ēnoixen to stoma autou eis blasphēmian pros ton Theon, blasphēmēsai to onoma autou kai tēn skēnēn autou, tous en tō ouranō skēnounas.',
   'The beast''s blasphemy is comprehensive, directed against God Himself, His ''name'' (representing His character and authority), His ''tabernacle'' (referring to His dwelling place, either the heavenly temple or His people), and ''them that dwell in heaven'' (the angels and glorified saints). This demonstrates the beast''s total rebellion against the divine order and its attempt to defile everything sacred. This cosmic scope of blasphemy highlights the depth of its evil and its direct opposition to God''s heavenly kingdom.',
   NULL),
  (7,
   'And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations.',
   'Καὶ ἐδόθη αὐτῷ πόλεμον ποιῆσαι μετὰ τῶν ἁγίων καὶ νικῆσαι αὐτούς, καὶ ἐδόθη αὐτῷ ἐξουσία ἐπὶ πᾶσαν φυλὴν καὶ λαὸν καὶ γλῶσσαν καὶ ἔθνος.',
   'Kai edothē autō polemon poiēsai meta tōn hagiōn kai nikēsai autous, kai edothē autō exousia epi pasan phylēn kai laon kai glōssan kai ethnos.',
   'The beast is ''given power to make war with the saints and to overcome them,'' a chilling prophecy of intense persecution. This does not imply a spiritual defeat for believers, but rather physical suffering and martyrdom, as seen throughout Revelation (e.g., Rev 6:9-11). This persecution is global, as the beast''s ''power was given him over all kindreds, and tongues, and nations.'' This universal reach emphasizes the unprecedented scale of this final conflict, affecting believers worldwide. The phrase ''it was given'' again points to divine permission, not ultimate defeat.',
   'The beast''s power to ''make war with the saints and to overcome them'' highlights the reality of persecution and martyrdom for believers. However, this ''overcoming'' is physical, not spiritual. The victory of the saints is found in their faithfulness unto death (Rev 12:11). This verse reminds believers that suffering for Christ is part of the eschatological struggle, but their ultimate spiritual victory is assured in Him.'),
  (8,
   'And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.',
   'Καὶ προσκυνήσουσιν αὐτὸν πάντες οἱ κατοικοῦντες ἐπὶ τῆς γῆς, ὧν οὐ γέγραπται τὸ ὄνομα ἐν τῇ βίβλῳ τῆς ζωῆς τοῦ Ἀρνίου τοῦ ἐσφαγμένου ἀπὸ καταβολῆς κόσμου.',
   'Kai proskynēsousin auton pantes hoi katoikountes epi tēs gēs, hōn ou gegraptai τὸ onoma en tē biblō tēs zōēs tou Arniou tou esphagmenou apo katabolēs kosmou.',
   'Universal worship of the beast is qualified: ''all that dwell upon the earth shall worship him, whose names are not written in the book of life.'' This provides a crucial distinction between those who succumb to the beast''s deception and those who remain faithful. The ''book of life'' belongs to ''the Lamb slain from the foundation of the world'' (Rev 5:6, 17:8), emphasizing God''s eternal plan of salvation and the pre-ordained sacrifice of Christ. This offers assurance to believers that their salvation is secure and predestined.',
   'This verse presents a clear theological dichotomy: those whose names are written in the Lamb''s Book of Life will not worship the beast. This highlights the doctrine of divine election and predestination, offering assurance to believers that their salvation is secure in Christ, whose sacrifice was ''from the foundation of the world.'' It emphasizes that true worship is reserved for God alone, and allegiance to the beast signifies spiritual condemnation.'),
  (9,
   'If any man have an ear, let him hear.',
   'Εἴ τις ἔχει οὖς, ἀκουσάτω.',
   'Ei tis echei ous, akousatō.',
   'This phrase, ''If any man have an ear, let him hear,'' is a common call to attention in the Gospels (e.g., Matt 11:15) and throughout Revelation (e.g., Rev 2:7). It signifies that the preceding message is of profound spiritual importance and requires deep understanding and discernment, not just casual listening. It challenges the reader to engage with the symbolic language and grasp its implications for their faith and conduct.',
   NULL),
  (10,
   'He that leadeth into captivity shall go into captivity: he that killeth with the sword must be killed with the sword. Here is the patience and the faith of the saints.',
   'Εἴ τις εἰς αἰχμαλωσίαν συνάγει, εἰς αἰχμαλωσίαν ὑπάγει. Εἴ τις ἐν μαχαίρᾳ ἀποκτενεῖ, δεῖ αὐτὸν ἐν μαχαίρᾳ ἀποκτανθῆναι. Ὧδε ἡ ὑπομονὴ καὶ ἡ πίστις τῶν ἁγίων ἐστίν.',
   'Ei tis eis aichmalōsian synagei, eis aichmalōsian hypagei. Ei tis en machairā apoktenei, dei auton en machairā apoktanthēnai. Hōde hē hypomonē kai hē pistis tōn hagiōn estin.',
   'This verse articulates the principle of divine retribution, often summarized as ''lex talionis'' or ''an eye for an eye'' (cf. Matt 26:52). Those who inflict violence and captivity will suffer the same fate. This serves as a comfort and warning: God will ultimately judge the persecutors. It is in this context of impending divine justice that the ''patience and the faith of the saints'' are called for. Believers are to endure suffering without retaliating, trusting in God''s ultimate vindication.',
   'This verse provides a foundational principle of divine justice: those who inflict suffering will themselves suffer. It reassures believers that God will ultimately avenge His saints, even if they must endure persecution and martyrdom. This truth calls for ''patience and faith'' (ὑπομονὴ καὶ πίστις) from the saints, encouraging them to persevere without retaliation, trusting in God''s perfect timing and righteous judgment.'),
  (11,
   'And I beheld another beast coming up out of the earth; and he had two horns like a lamb, and he spake as a dragon.',
   'Καὶ εἶδον ἄλλο θηρίον ἀναβαῖνον ἐκ τῆς γῆς, καὶ εἶχεν κέρατα δύο ὅμοια ἀρνίῳ, καὶ ἐλάλει ὡς δράκων.',
   'Kai eidon allo thērion anabainon ek tēs gēs, kai eichen kerata duo homoia arniō, kai elalei hōs drakōn.',
   'John now sees ''another beast'' (ἄλλο θηρίον) rising ''out of the earth,'' often interpreted as representing religious or cultural power, in contrast to the first beast''s political power. This beast appears deceptively benign, with ''two horns like a lamb'' (ἀρνίῳ), mimicking Christ, the Lamb of God (Rev 5:6). However, its true nature is revealed by its speech: ''it spake as a dragon,'' indicating its satanic origin and deceptive intent. This figure is often called the ''false prophet'' (Rev 16:13, 19:20, 20:10).',
   'The second beast, appearing ''like a lamb'' but speaking ''as a dragon,'' embodies religious deception and the spirit of antichrist. It highlights the danger of false prophets and religious leaders who outwardly appear righteous but inwardly serve evil. This figure''s role is to lead people astray through spiritual manipulation, underscoring the need for discernment and adherence to biblical truth.'),
  (12,
   'And he exerciseth all the power of the first beast before him, and causeth the earth and them which dwell therein to worship the first beast, whose deadly wound was healed.',
   'Καὶ τὴν ἐξουσίαν τοῦ πρώτου θηρίου πᾶσαν ποιεῖ ἐνώπιον αὐτοῦ, καὶ ποιεῖ τὴν γῆν καὶ τοὺς ἐν αὐτῇ κατοικοῦντας ἵνα προσκυνήσωσιν τὸ θηρίον τὸ πρῶτον, οὗ ἐθεραπεύθη ἡ πληγὴ τοῦ θανάτου αὐτοῦ.',
   'Kai tēn exousian tou prōtou thēriou pasan poiei enōpion autou, kai poiei tēn gēn kai tous en autē katoikountas hina proskynēsōsin to thērion to prōton, hou etherapeuthē hē plēgē tou thanatou autou.',
   'The second beast''s primary function is to enforce the worship of the first beast. It ''exerciseth all the power of the first beast before him,'' acting as its propagandist and enforcer. Its authority is derived from and subservient to the first beast. It compels ''the earth and them which dwell therein to worship the first beast,'' specifically highlighting the ''deadly wound'' that was healed, reinforcing the deception of the first beast''s miraculous recovery. This shows a coordinated effort between political and religious deception.',
   NULL),
  (13,
   'And he doeth great wonders, so that he maketh fire come down from heaven on the earth in the sight of men,',
   'Καὶ ποιεῖ σημεῖα μεγάλα, ἵνα καὶ πῦρ ποιῇ καταβαίνειν ἐκ τοῦ οὐρανοῦ εἰς τὴν γῆν ἐνώπιον τῶν ἀνθρώπων.',
   'Kai poiei sēmeia megala, hina kai pyr poiē katabainein ek tou ouranou eis tēn gēn enōpion tōn anthrōpōn.',
   'To achieve its goal, the second beast performs ''great wonders'' (σημεῖα μεγάλα), including making ''fire come down from heaven on the earth in the sight of men.'' This miracle directly mimics the prophet Elijah''s feat (1 Kgs 18:38) and the power of God''s two witnesses (Rev 11:5). This demonstrates that false prophets can perform impressive signs, but their purpose is to deceive and lead people away from God, not towards Him. It serves as a warning against judging truth solely by miraculous displays.',
   'The second beast''s ability to perform ''great wonders,'' such as calling fire from heaven, warns against the deceptive power of false miracles. Not all supernatural displays are from God; some are orchestrated by evil to mislead. Believers must test spirits and teachings against the unchanging Word of God, rather than being swayed by outward displays of power (Matt 24:24; 2 Thess 2:9-10).'),
  (14,
   'And deceiveth them that dwell on the earth by the means of those miracles which he had power to do in the sight of the beast; saying to them that dwell on the earth, that they should make an image to the beast, which had the wound by a sword, and did live.',
   'Καὶ πλανᾷ τοὺς κατοικοῦντας ἐπὶ τῆς γῆς διὰ τὰ σημεῖα ἃ ἐδόθη αὐτῷ ποιῆσαι ἐνώπιον τοῦ θηρίου, λέγων τοῖς κατοικοῦσιν ἐπὶ τῆς γῆς ποιῆσαι εἰκόνα τῷ θηρίῳ ὃ ἔχει τὴν πληγὴν τῆς μαχαίρας καὶ ἔζησεν.',
   'Kai plana tous katoikountas epi tēs gēs dia ta sēmeia ha edothē autō poiēsai enōpion tou thēriou, legōn tois katoikousin epi tēs gēs poiēsai eikona tō thēriō ho echei tēn plēgēn tēs machairas kai ezēsen.',
   'The second beast ''deceiveth them that dwell on the earth'' through its miracles, which are performed ''in the sight of the beast'' (the first beast). This public display of power validates the first beast''s authority. The ultimate command is to ''make an image to the beast,'' specifically referencing the beast ''which had the wound by a sword, and did live.'' This image becomes a focal point for worship, further solidifying the beast''s cult. This echoes ancient practices of emperor worship, where statues were erected and venerated.',
   NULL),
  (15,
   'And he had power to give life unto the image of the beast, that the image of the beast should both speak, and cause that as many as would not worship the image of the beast should be killed.',
   'Καὶ ἐδόθη αὐτῷ πνεῦμα δοῦναι τῇ εἰκόνι τοῦ θηρίου, ἵνα καὶ λαλήσῃ ἡ εἰκὼν τοῦ θηρίου, καὶ ποιήσῃ ἵνα ὅσοι ἐὰν μὴ προσκυνήσωσιν τῇ εἰκόνι τοῦ θηρίου ἀποκτανθῶσιν.',
   'Kai edothē autō pneuma dounai tē eikoni tou thēriou, hina kai lalēsē hē eikōn tou thēriou, kai poiēsē hina hosoi ean mē proskynēswsin tē eikoni tou thēriou apoktanthōsin.',
   'The second beast is given ''power to give life unto the image of the beast,'' enabling it to ''speak'' and enforce its will. This animated idol is a terrifying manifestation of demonic power and deception. The consequence for refusing to worship the image is death, establishing a system of forced worship and persecution. This echoes the story of Daniel 3, where refusal to worship Nebuchadnezzar''s golden image led to the fiery furnace, but on a global scale.',
   'The animation of the beast''s image and its demand for worship under penalty of death represents the ultimate test of allegiance. It forces a choice between loyalty to God and submission to the antichrist system. This highlights the severity of idolatry and the cost of discipleship, calling believers to prioritize their worship of the true God above all else, even unto martyrdom.'),
  (16,
   'And he causeth all, both small and great, rich and poor, free and bond, to receive a mark in their right hand, or in their foreheads:',
   'Καὶ ποιεῖ πάντας, τοὺς μικροὺς καὶ τοὺς μεγάλους, καὶ τοὺς πλουσίους καὶ τοὺς πτωχούς, καὶ τοὺς ἐλευθέρους καὶ τοὺς δούλους, ἵνα δῶσιν αὐτοῖς χάραγμα ἐπὶ τῆς χειρὸς αὐτῶν τῆς δεξιᾶς ἢ ἐπὶ τὸ μέτωπον αὐτῶν.',
   'Kai poiei pantas, tous mikrous kai tous megalous, kai tous plousious kai tous ptōchous, kai tous eleutherous kai tous doulous, hina dōsin autois charagma epi tēs cheiros autōn tēs dexias ē epi to metōpon autōn.',
   'The second beast enforces a universal system of control by compelling ''all'' people, regardless of social status, to receive a ''mark'' (χάραγμα, charagma) ''in their right hand, or in their foreheads.'' This mark signifies allegiance and ownership, contrasting with the seal of God''s servants (Rev 7:3). In the Roman world, ''charagma'' could refer to an imperial seal, a stamp on official documents, or a brand on slaves. This mark is not merely symbolic but has practical implications for daily life.',
   'The ''mark of the beast'' is a visible sign of allegiance to the antichrist system, contrasting sharply with the seal of God on His people (Rev 7:3). It represents a complete spiritual and economic submission to evil. This mark serves as a profound warning against compromising one''s faith for worldly gain or survival, emphasizing the eternal consequences of such a choice and the necessity of unwavering loyalty to Christ.'),
  (17,
   'And that no man might buy or sell, save he that had the mark, or the name of the beast, or the number of his name.',
   'Καὶ ἵνα μή τις δύνηται ἀγοράσαι ἢ πωλῆσαι εἰ μὴ ὁ ἔχων τὸ χάραγμα, τὸ ὄνομα τοῦ θηρίου ἢ τὸν ἀριθμὸν τοῦ ὀνόματος αὐτοῦ.',
   'Kai hina mē tis dynētai agorasai ē pōlēsai ei mē ho echōn to charagma, to onoma tou thēriou ē ton arithmon tou onomatos autou.',
   'The purpose of the mark is economic control: ''no man might buy or sell'' without it. This creates a totalitarian system where survival itself depends on submission to the beast. The mark can be the ''charagma'' itself, ''the name of the beast,'' or ''the number of his name.'' This intertwining of identity, commerce, and worship demonstrates the beast''s comprehensive control over every aspect of human life, making it impossible for those who refuse the mark to participate in society.',
   NULL),
  (18,
   'Here is wisdom. Let him that hath understanding count the number of the beast: for it is the number of a man; and his number is Six hundred threescore and six.',
   'Ὧδε ἡ σοφία ἐστίν. Ὁ ἔχων νοῦν ψηφισάτω τὸν ἀριθμὸν τοῦ θηρίου, ἀριθμὸς γὰρ ἀνθρώπου ἐστίν, καὶ ὁ ἀριθμὸς αὐτοῦ χξϛʹ.',
   'Hōde hē sophia estin. Ho echōn noun psēphisatō ton arithmon tou thēriou, arithmos gar anthrōpou estin, kai ho arithmos autou chxϛ''.',
   'This verse presents a challenge to the reader: ''Here is wisdom. Let him that hath understanding count the number of the beast.'' The number ''Six hundred threescore and six'' (χξϛʹ, 666) is explicitly stated to be ''the number of a man.'' This has led to countless interpretations throughout history, often using gematria (assigning numerical values to letters) to identify specific individuals or titles. While its precise identity remains debated, the number signifies imperfection and rebellion, falling short of the divine number seven, and points to the beast''s human, yet divinely limited, nature.',
   'The number 666, ''the number of a man,'' signifies human imperfection and rebellion against God, falling short of the divine perfection represented by seven. While its specific interpretation has varied, its theological significance lies in identifying the beast as a human-empowered system or individual that embodies ultimate opposition to God. It calls for spiritual ''wisdom'' and ''understanding'' to discern the true nature of evil and resist its influence, rather than being fixated on mere numerical identification.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 13;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θηρίον', 'thērion', 'G2342', 'Derived from ''thēr'' (a wild animal), ''thērion'' refers to a wild beast. In Revelation, it is consistently used to symbolize powerful, oppressive, and anti-God political or religious entities that emerge from the world to persecute God''s people. It signifies a creature of destructive and savage nature, embodying the forces of evil.', 1),
  ('βλασφημίας', 'blasphēmias', 'G988', 'From ''blasphēmeō'' (to speak evil of), ''blasphēmia'' denotes blasphemy, slander, or evil-speaking. In the context of the beast, it refers to its arrogant and defiant speech against God, His name, and His dwelling place, claiming divine prerogatives and rejecting God''s authority. It signifies a profound spiritual rebellion.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐσφαγμένην', 'esphagmenēn', 'G4969', 'A perfect passive participle of ''sphazō,'' meaning ''to slay, slaughter, or butcher.'' Here, it describes the beast''s head as having been ''slain'' or ''wounded to death.'' This term is notably used for the Lamb of God (Rev 5:6, 9, 12), highlighting the beast''s satanic parody of Christ''s sacrificial death and resurrection.', 1),
  ('ἐθεραπεύθη', 'etherapeuthē', 'G2323', 'Aorist passive indicative of ''therapeuō,'' meaning ''to heal, cure, or restore to health.'' The healing of the beast''s deadly wound is presented as a miraculous recovery. This false healing is a key element of the beast''s deception, convincing the world of its supernatural power and leading them to worship it, mimicking divine resurrection.', 2),
  ('ἐθαύμασεν', 'ethaumasen', 'G2296', 'Aorist indicative of ''thaumazō,'' meaning ''to wonder, marvel, or be astonished.'' The world''s reaction to the beast''s recovery is one of profound astonishment and admiration. This wonder leads directly to worship, illustrating how impressive signs, even if deceptive, can sway human allegiance away from God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 3;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσκυνήσουσιν', 'proskynēsousin', 'G4352', 'Future active indicative of ''proskyneō,'' meaning ''to prostrate oneself, do reverence to, or worship.'' This term describes the act of bowing down in homage or adoration. Here, it refers to the universal worship of the beast, signifying a complete spiritual allegiance to this anti-God power, in stark contrast to the worship due to God alone.', 1),
  ('Ἀρνίου', 'Arniou', 'G721', 'Genitive singular of ''arnion,'' meaning ''a little lamb.'' In Revelation, ''the Lamb'' is the primary title for Jesus Christ, emphasizing His sacrificial death and triumphant resurrection (Rev 5:6). The ''book of life of the Lamb'' signifies that salvation is found exclusively through His atoning work, established from eternity.', 2),
  ('ἐσφαγμένου', 'esphagmenou', 'G4969', 'Perfect passive participle of ''sphazō,'' meaning ''to slay, slaughter, or butcher.'' This term describes the Lamb as having been ''slain,'' highlighting Christ''s sacrificial death on the cross. The phrase ''slain from the foundation of the world'' emphasizes the eternal nature of God''s redemptive plan, predating creation itself.', 3),
  ('καταβολῆς', 'katabolēs', 'G2602', 'From ''kataballō'' (to cast down), ''katabolē'' means ''a laying down, foundation, or beginning.'' The phrase ''from the foundation of the world'' emphasizes the eternal counsel of God, indicating that Christ''s redemptive work was part of God''s plan before creation, underscoring its divine origin and certainty.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 8;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπομονὴ', 'hypomonē', 'G5281', 'From ''hypomenō'' (to remain under, endure), ''hypomonē'' signifies patient endurance, steadfastness, or perseverance. It refers to the ability to remain firm and faithful under trial, not merely passive resignation but active, hopeful waiting. In this context, it is the characteristic required of saints facing persecution.', 1),
  ('πίστις', 'pistis', 'G4102', 'Meaning ''faith, trust, or belief.'' In the New Testament, ''pistis'' denotes a confident reliance on God and His promises, leading to obedience and faithfulness. Here, it refers to the unwavering trust and loyalty of the saints in God, even when facing death, knowing He will ultimately bring justice and vindication.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 10;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θηρίον', 'thērion', 'G2342', 'As in verse 1, ''thērion'' refers to a wild beast. Here, it describes the second beast, which, despite its lamb-like appearance, is fundamentally a ''beast'' of destructive and anti-God nature, serving the dragon. This highlights the deceptive nature of this figure, cloaking evil in a religious guise.', 1),
  ('ἀρνίῳ', 'arniō', 'G721', 'Dative singular of ''arnion,'' meaning ''a little lamb.'' This term is used to describe the second beast''s appearance, mimicking the innocent and sacrificial nature of Christ, the true Lamb of God. This deceptive resemblance is crucial to its ability to mislead, presenting itself as spiritual and benign.', 2),
  ('δράκων', 'drakōn', 'G1404', 'Meaning ''dragon,'' this term consistently refers to Satan, the ancient serpent (Rev 12:9). The second beast speaking ''as a dragon'' reveals its true, satanic source and purpose despite its lamb-like disguise. Its words are those of deception, blasphemy, and coercion, reflecting its master''s nature.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 11;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χάραγμα', 'charagma', 'G5480', 'From ''charassō'' (to engrave), ''charagma'' denotes an impression, stamp, or mark. It refers to the ''mark of the beast,'' a physical or symbolic sign of allegiance to the beast''s authority. In the Roman world, it could be an imperial seal, a brand on slaves, or a mark on coins, signifying ownership and loyalty.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 16;

-- Verse 18
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σοφία', 'sophia', 'G4678', 'Meaning ''wisdom, insight, or skill.'' Here, it refers to spiritual discernment and understanding, particularly in interpreting the symbolic meaning of the number of the beast. It implies a need for divine insight to grasp the spiritual realities behind the earthly manifestations of evil, rather than mere intellectual cleverness.', 1),
  ('νοῦν', 'noun', 'G3563', 'Accusative singular of ''nous,'' meaning ''mind, understanding, or intellect.'' The phrase ''he that hath understanding'' calls for intellectual and spiritual discernment to interpret the cryptic number. It suggests that the meaning is not immediately obvious but requires careful thought and spiritual insight guided by God.', 2),
  ('ψηφισάτω', 'psēphisatō', 'G5585', 'Aorist active imperative of ''psēphizō,'' meaning ''to count, calculate, or compute.'' This command instructs the reader to actively engage in deciphering the number of the beast. It implies a process of calculation, often associated with gematria (assigning numerical values to letters), to reveal the identity or nature of the beast.', 3),
  ('ἀριθμὸν', 'arithmon', 'G706', 'Accusative singular of ''arithmos,'' meaning ''a number.'' This refers to the specific numerical value associated with the beast, stated as 666. The number is described as ''the number of a man,'' indicating its human origin or representation, and signifying imperfection and rebellion in contrast to divine completeness.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = 18;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Daniel 7:3-7', 1),
  (1, 'Revelation 12:3', 2),
  (1, 'Revelation 17:3-12', 3),
  (2, 'Daniel 7:4-6', 1),
  (2, 'Revelation 12:9', 2),
  (2, 'Ephesians 6:12', 3),
  (3, 'Revelation 5:6', 1),
  (3, 'Revelation 17:8', 2),
  (3, '2 Thessalonians 2:9-10', 3),
  (4, 'Exodus 15:11', 1),
  (4, 'Psalm 35:10', 2),
  (4, 'Revelation 17:8', 3),
  (5, 'Daniel 7:8', 1),
  (5, 'Daniel 7:25', 2),
  (5, 'Revelation 11:2-3', 3),
  (5, 'Revelation 12:6', 4),
  (6, 'Daniel 7:25', 1),
  (6, '2 Thessalonians 2:4', 2),
  (6, 'Revelation 14:11', 3),
  (7, 'Daniel 7:21', 1),
  (7, 'Revelation 11:7', 2),
  (7, 'Revelation 12:17', 3),
  (7, 'Revelation 17:14', 4),
  (8, 'Revelation 3:5', 1),
  (8, 'Revelation 17:8', 2),
  (8, 'Ephesians 1:4', 3),
  (8, '1 Peter 1:20', 4),
  (9, 'Matthew 11:15', 1),
  (9, 'Revelation 2:7', 2),
  (9, 'Revelation 2:11', 3),
  (10, 'Matthew 26:52', 1),
  (10, 'Jeremiah 15:2', 2),
  (10, 'Revelation 14:12', 3),
  (11, 'Revelation 16:13', 1),
  (11, 'Revelation 19:20', 2),
  (11, 'Matthew 7:15', 3),
  (12, 'Revelation 13:3', 1),
  (12, 'Revelation 13:4', 2),
  (12, 'Revelation 19:20', 3),
  (13, '1 Kings 18:38', 1),
  (13, 'Matthew 24:24', 2),
  (13, '2 Thessalonians 2:9', 3),
  (14, 'Deuteronomy 13:1-3', 1),
  (14, 'Revelation 19:20', 2),
  (14, 'Daniel 3:1-7', 3),
  (15, 'Daniel 3:5-6', 1),
  (15, 'Revelation 20:4', 2),
  (16, 'Revelation 7:3', 1),
  (16, 'Revelation 14:9-11', 2),
  (16, 'Revelation 20:4', 3),
  (17, 'Revelation 14:11', 1),
  (17, 'Revelation 15:2', 2),
  (17, 'Revelation 20:4', 3),
  (18, 'Revelation 17:9', 1),
  (18, 'Daniel 12:10', 2),
  (18, '1 John 2:18', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 13 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 13 Complete!
-- 18 verses · 7 key verses with word studies (19 words)
-- Cross-references for 18 verses (56 refs)
-- ═══════════════════════════════════════════════════════