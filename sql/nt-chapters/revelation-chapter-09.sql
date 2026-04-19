-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 9 — The Fifth and Sixth Trumpets: Demonic Plagues and Unrepentant Humanity
-- 21 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'Revelation 9 describes the sounding of the fifth and sixth trumpets, initiating two of the three ''woes'' upon the earth. The fifth trumpet unleashes a plague of demonic ''locusts'' from the bottomless pit, led by Abaddon/Apollyon, who are permitted to torment, but not kill, unsealed humanity for five months. This vivid imagery depicts a period of intense suffering and spiritual oppression. The sixth trumpet then releases four bound angels from the Euphrates, leading an immense demonic cavalry that slays a third of mankind. Despite these catastrophic judgments, the remaining population refuses to repent of their idolatry, sorcery, and other sins, highlighting humanity''s hardened heart and resistance to God''s warnings. The chapter underscores divine judgment, the reality of spiritual warfare, and the persistent rebellion of humanity.',
  'The Fifth and Sixth Trumpets: Demonic Plagues and Unrepentant Humanity',
  'ἄβυσσος (abyssos)',
  'Derived from ''a'' (not) and ''byssos'' (bottom), meaning ''bottomless'' or ''unfathomable depth.'' In Revelation, it refers to a specific place of confinement for demonic entities and fallen angels, often associated with the underworld or Hades. It signifies a place of divine restraint and judgment, from which evil forces are temporarily released to execute God''s purposes.',
  '["Section 1 (vv.1-2): The Fifth Trumpet and the Opening of the Bottomless Pit","Section 2 (vv.3-6): The Locusts Unleashed: Their Power and Torment","Section 3 (vv.7-11): The Appearance and Leadership of the Demonic Locusts","Section 4 (v.12): Transition: The First Woe is Past","Section 5 (vv.13-15): The Sixth Trumpet and the Release of Four Angels","Section 6 (vv.16-19): The Demonic Cavalry and the Slaughter of a Third of Humanity","Section 7 (vv.20-21): Humanity''s Unrepentance Amidst Judgment"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And the fifth angel sounded, and I saw a star fall from heaven unto the earth: and to him was given the key of the bottomless pit.',
   'Καὶ ὁ πέμπτος ἄγγελος ἐσάλπισεν· καὶ εἶδον ἀστέρα ἐκ τοῦ οὐρανοῦ πεπτωκότα εἰς τὴν γῆν, καὶ ἐδόθη αὐτῷ ἡ κλεὶς τοῦ φρέατος τῆς ἀβύσσου.',
   'Kai ho pemptos angelos esalpisen; kai eidon astera ek tou ouranou peptōkota eis tēn gēn, kai edothē autō hē kleis tou phreatos tēs abyssou.',
   'The sounding of the fifth trumpet marks the beginning of the first of three ''woes'' (Rev 8:13). The ''star fallen from heaven'' is often interpreted as a symbolic figure, likely a fallen angel or Satan himself, given the authority granted to him. The ''key of the bottomless pit'' (τῆς ἀβύσσου, ''the abyss'') signifies divine permission for this entity to unleash destructive forces. This imagery recalls passages where spiritual powers are given authority over earthly realms (Luke 10:18, Rev 20:1).',
   'This verse introduces a significant aspect of eschatological judgment: the controlled release of malevolent spiritual forces. The ''bottomless pit'' (ἄβυσσος) is a place of confinement for demons, and its opening signifies a period where God permits evil to manifest more overtly, yet always under His ultimate sovereign control. This highlights the reality of spiritual warfare and God''s use of even evil entities to accomplish His purposes of judgment and purification.'),
  (2,
   'And he opened the bottomless pit; and there arose a smoke out of the pit, as the smoke of a great furnace; and the sun and the air were darkened by reason of the smoke of the pit.',
   'Καὶ ἤνοιξεν τὸ φρέαρ τῆς ἀβύσσου, καὶ ἀνέβη καπνὸς ἐκ τοῦ φρέατος ὡς καπνὸς καμίνου μεγάλης, καὶ ἐσκοτίσθη ὁ ἥλιος καὶ ὁ ἀὴρ ἐκ τοῦ καπνοῦ τοῦ φρέατος.',
   'Kai ēnoixen to phrear tēs abyssou, kai anebē kapnos ek tou phreatos hōs kapnos kaminou megalēs, kai eskotisthē ho hēlios kai ho aēr ek tou kapnou tou phreatos.',
   'The opening of the abyss releases a thick smoke, likened to that of a ''great furnace,'' which darkens the sun and air. This imagery evokes scenes of divine judgment in the Old Testament, such as the smoke from Mount Sinai (Exod 19:18) or the darkening of the heavens in prophetic judgments (Joel 2:10, 30-31). The smoke is not merely atmospheric but serves as a precursor and perhaps a source for the demonic locusts that emerge, symbolizing the oppressive and suffocating nature of the impending woe.',
   NULL),
  (3,
   'And there came out of the smoke locusts upon the earth: and unto them was given power, as the scorpions of the earth have power.',
   'Καὶ ἐκ τοῦ καπνοῦ ἐξῆλθον ἀκρίδες εἰς τὴν γῆν, καὶ ἐδόθη αὐταῖς ἐξουσία ὡς ἔχουσιν ἐξουσίαν οἱ σκορπίοι τῆς γῆς.',
   'Kai ek tou kapnou exēlthon akrides eis tēn gēn, kai edothē autais exousia hōs echousin exousian hoi skorpioi tēs gēs.',
   'From the smoke emerge ''locusts'' (ἀκρίδες), but these are no ordinary insects. Their power is explicitly compared to ''scorpions of the earth,'' indicating a capacity for painful, venomous torment rather than agricultural destruction. This immediately signals their supernatural and destructive nature. The imagery draws from Old Testament plagues (Exod 10:1-20) and prophetic descriptions of invading armies (Joel 2:1-11), but with a distinct demonic twist.',
   'This verse introduces the ''locusts'' as agents of divine judgment, endowed with specific, limited power. Their scorpion-like authority to inflict pain, rather than kill, highlights the nature of this particular woe: a period of intense suffering designed to bring humanity to repentance, yet often met with further hardening of hearts. It underscores God''s precise control over even the most destructive forces.'),
  (4,
   'And it was commanded them that they should not hurt the grass of the earth, neither any green thing, neither any tree; but only those men which have not the seal of God in their foreheads.',
   'Καὶ ἐρρέθη αὐταῖς ἵνα μὴ ἀδικήσωσιν τὸν χόρτον τῆς γῆς οὐδὲ πᾶν χλωρὸν οὐδὲ πᾶν δένδρον, εἰ μὴ τοὺς ἀνθρώπους μόνους οἳ οὐκ ἔχουσι τὴν σφραγῖδα τοῦ Θεοῦ ἐπὶ τῶν μετώπων αὐτῶν.',
   'Kai errethē autais hina mē adikēsōsin ton chorton tēs gēs oude pan chlōron oude pan dendron, ei mē tous anthrōpous monous hoi ouk echousi tēn sphragida tou Theou epi tōn metōpōn autōn.',
   'Crucially, these locusts are commanded not to harm vegetation, distinguishing them sharply from natural locusts (Exod 10:15). Their target is specific: ''only those men which have not the seal of God in their foreheads.'' This ''seal'' (σφραγῖδα) refers to the mark of divine protection given to God''s faithful (Rev 7:3-4), ensuring their preservation from these particular judgments. This highlights God''s discernment and protection of His own amidst widespread tribulation.',
   'The divine command to spare vegetation and target only the unsealed underscores God''s selective judgment and protection. The ''seal of God'' is a theological concept signifying divine ownership and security for believers, a counterpoint to the ''mark of the beast'' later in Revelation. This demonstrates God''s sovereign distinction between His people and those who reject Him, even in the midst of global tribulation.'),
  (5,
   'And to them it was given that they should not kill them, but that they should be tormented five months: and their torment was as the torment of a scorpion, when he striketh a man.',
   'Καὶ ἐδόθη αὐταῖς ἵνα μὴ ἀποκτείνωσιν αὐτούς, ἀλλ᾽ ἵνα βασανισθῶσιν μῆνας πέντε· καὶ ὁ βασανισμὸς αὐτῶν ὡς βασανισμὸς σκορπίου, ὅταν παίσῃ ἄνθρωπον.',
   'Kai edothē autais hina mē apokteinōsin autous, all'' hina basanisthōsin mēnas pente; kai ho basanismos autōn hōs basanismos skorpiou, hotan paisē anthrōpon.',
   'The locusts'' power is further limited: they are not to kill but to torment for ''five months.'' This specific duration suggests a finite period of intense suffering, perhaps referencing the typical lifespan of a natural locust swarm or a symbolic period of judgment. The torment is again likened to a scorpion''s sting, emphasizing its agonizing, non-lethal nature. This judgment aims to inflict severe pain, possibly to prompt repentance, though verse 20 indicates it fails.',
   NULL),
  (6,
   'And in those days shall men seek death, and shall not find it; and shall desire to die, and death shall flee from them.',
   'Καὶ ἐν ταῖς ἡμέραις ἐκείναις ζητήσουσιν οἱ ἄνθρωποι τὸν θάνατον καὶ οὐ μὴ εὑρήσουσιν αὐτόν, καὶ ἐπιθυμήσουσιν ἀποθανεῖν καὶ φεύξεται ὁ θάνατος ἀπ᾽ αὐτῶν.',
   'Kai en tais hēmerais ekeinais zētēsousin hoi anthrōpoi ton thanaton kai ou mē heurēsousin auton, kai epithymēsousin apothanein kai pheuxetai ho thanatos ap'' autōn.',
   'This verse graphically describes the severity of the torment: people will desperately seek death but be unable to find it. This is a reversal of the natural human instinct to preserve life and highlights the unbearable nature of the suffering. It echoes prophetic warnings of judgment where death becomes a desired escape (Jer 8:3, Job 3:21). This inability to die underscores the supernatural control over life and death during this period of judgment.',
   'The desire for death without the ability to attain it portrays a profound theological truth about the nature of suffering under divine judgment. It reveals that God''s judgments can be so severe that even the ultimate escape, death, is withheld. This emphasizes the terror of living under God''s wrath and the futility of seeking relief apart from repentance and reconciliation with Him.'),
  (7,
   'And the shapes of the locusts were like unto horses prepared unto battle; and on their heads were as it were crowns like gold, and their faces were as the faces of men.',
   'Καὶ τὰ ὁμοιώματα τῶν ἀκρίδων ὅμοια ἵπποις ἡτοιμασμένοις εἰς πόλεμον, καὶ ἐπὶ τὰς κεφαλὰς αὐτῶν ὡς στέφανοι ὅμοιοι χρυσῷ, καὶ τὰ πρόσωπα αὐτῶν ὡς πρόσωπα ἀνθρώπων.',
   'Kai ta homoiōmata tōn akridōn homoia hippois hētoimasmenois eis polemon, kai epi tas kephalas autōn hōs stephanoi homoioi chrysō, kai ta prosōpa autōn hōs prosōpa anthrōpōn.',
   'John describes the ''shapes'' (ὁμοιώματα) of these locusts, emphasizing their grotesque, hybrid nature. They resemble ''horses prepared for battle,'' suggesting military might and swift destruction. Their ''crowns like gold'' might symbolize a temporary, delegated authority or victory, while ''faces of men'' could imply intelligence, cunning, or a deceptive appearance of humanity. This detailed description underscores their demonic, rather than natural, origin.',
   NULL),
  (8,
   'And they had hair as the hair of women, and their teeth were as the teeth of lions.',
   'Καὶ εἶχον τρίχας ὡς τρίχας γυναικῶν, καὶ οἱ ὀδόντες αὐτῶν ὡς λεόντων ἦσαν.',
   'Kai eichon trichas hōs trichas gynaikōn, kai hoi odontes autōn hōs leontōn ēsan.',
   'The description continues, adding to their monstrous appearance. ''Hair as the hair of women'' is often interpreted as a symbol of allure or seduction, perhaps indicating a deceptive or insidious quality to their torment. Conversely, ''teeth as the teeth of lions'' signifies fierce, predatory power and destructive capability, contrasting with the previous image. This combination creates a terrifying and unnatural entity, embodying both cunning and raw aggression.',
   NULL),
  (9,
   'And they had breastplates, as it were breastplates of iron; and the sound of their wings was as the sound of chariots of many horses running to battle.',
   'Καὶ εἶχον θώρακας ὡς θώρακας σιδηροῦς, καὶ ἡ φωνὴ τῶν πτερύγων αὐτῶν ὡς φωνὴ ἁρμάτων ἵππων πολλῶν τρεχόντων εἰς πόλεμον.',
   'Kai eichon thōrakas hōs thōrakas sidērous, kai hē phōnē tōn pterygōn autōn hōs phōnē harmatōn hippōn pollōn trechontōn eis polemon.',
   'Their ''breastplates as it were breastplates of iron'' suggest invulnerability or formidable protection, making them difficult to resist. The ''sound of their wings'' is compared to ''chariots of many horses running to battle,'' evoking the terrifying roar of a massive, advancing army. This auditory detail reinforces the overwhelming and inescapable nature of their attack, creating an atmosphere of dread and impending doom, reminiscent of Joel''s description of a locust army (Joel 2:5).',
   NULL),
  (10,
   'And they had tails like unto scorpions, and there were stings in their tails: and their power was to hurt men five months.',
   'Καὶ ἔχουσιν οὐρὰς ὁμοίας σκορπίοις καὶ κέντρα, καὶ ἐν ταῖς οὐραῖς αὐτῶν ἡ ἐξουσία αὐτῶν ἀδικῆσαι τοὺς ἀνθρώπους μῆνας πέντε.',
   'Kai echousin ouras homoias skorpiois kai kentra, kai en tais ourais autōn hē exousia autōn adikēsai tous anthrōpous mēnas pente.',
   'The description returns to the ''scorpion'' motif, explicitly stating that their ''tails like unto scorpions'' contain ''stings'' (κέντρα), which are the source of their power to ''hurt men five months.'' This reiterates the nature and duration of their torment, emphasizing that their primary function is to inflict pain. The tail, often associated with deception or harmful influence in biblical symbolism (Isa 9:15), here becomes the direct instrument of their painful judgment.',
   NULL),
  (11,
   'And they had a king over them, which is the angel of the bottomless pit, whose name in the Hebrew tongue is Abaddon, but in the Greek tongue hath his name Apollyon.',
   'Καὶ ἔχουσιν ἐφ᾽ αὐτῶν βασιλέα τὸν ἄγγελον τῆς ἀβύσσου· ὄνομα αὐτῷ Ἑβραϊστὶ Ἀβαδδών, ἐν δὲ τῇ Ἑλληνικῇ ὄνομα ἔχει Ἀπολλύων.',
   'Kai echousin eph'' autōn basilea ton angelon tēs abyssou; onoma autō Hebraïsti Abaddōn, en de tē Hellēnikē onoma echei Apolluōn.',
   'These demonic locusts are not chaotic but have a ''king,'' identified as ''the angel of the bottomless pit.'' His Hebrew name, ''Abaddon'' (Ἀβαδδών), means ''destruction'' or ''place of destruction.'' His Greek name, ''Apollyon'' (Ἀπολλύων), means ''destroyer.'' This dual naming emphasizes his universal destructive character and links him directly to the ''star fallen from heaven'' in verse 1. He is a powerful demonic leader, perhaps Satan or a chief demon, orchestrating this woe.',
   'The identification of Abaddon/Apollyon as the king of these demonic forces is highly significant. It reveals the organized nature of evil and the existence of powerful spiritual beings dedicated to destruction. This figure embodies the destructive power unleashed during this judgment, serving as a stark reminder of the reality of spiritual evil and its ultimate subservience to God''s sovereign plan, even in its destructive capacity.'),
  (12,
   'One woe is past; and, behold, there come two woes more hereafter.',
   'Ἡ οὐαὶ ἡ μία ἀπῆλθεν· ἰδοὺ ἔρχονται ἔτι δύο οὐαὶ μετὰ ταῦτα.',
   'Hē ouai hē mia apēlthen; idou erchontai eti duo ouai meta tauta.',
   'This verse serves as a transitional statement, marking the conclusion of the first ''woe'' (the fifth trumpet judgment) and preparing the reader for the two subsequent woes. It reinforces the structured nature of God''s judgments, with each woe building in intensity and scope. The repetition of ''woe'' (οὐαὶ) emphasizes the severity and lamentable nature of these divine visitations upon the earth.',
   NULL),
  (13,
   'And the sixth angel sounded, and I heard a voice from the four horns of the golden altar which is before God,',
   'Καὶ ὁ ἕκτος ἄγγελος ἐσάλπισεν· καὶ ἤκουσα φωνὴν μίαν ἐκ τῶν τεσσάρων κεράτων τοῦ θυσιαστηρίου τοῦ χρυσοῦ τοῦ ἐνώπιον τοῦ Θεοῦ,',
   'Kai ho hektos angelos esalpisen; kai ēkousa phōnēn mian ek tōn tessarōn keratōn tou thysiastēriou tou chrysou tou enōpion tou Theou,',
   'The sounding of the sixth trumpet introduces the second woe. John hears a ''voice from the four horns of the golden altar which is before God.'' This altar is the altar of incense (Rev 8:3-5), where the prayers of the saints are offered. The voice emanating from it suggests that this judgment is a direct response to, or is connected with, the prayers of God''s people, or perhaps symbolizes God''s righteous indignation against the unrepentant world, as incense symbolizes prayer and judgment.',
   'The voice from the golden altar signifies that divine judgments are often connected to the prayers of the saints and God''s righteous response to injustice. This altar, associated with intercession, here becomes a source of command for judgment, illustrating that God hears the cries of His people and acts decisively against evil. It underscores the efficacy of prayer and the justice of God''s actions.'),
  (14,
   'Saying to the sixth angel which had the trumpet, Loose the four angels which are bound in the great river Euphrates.',
   'λέγοντα τῷ ἕκτῳ ἀγγέλῳ ὁ ἔχων τὴν σάλπιγγα, Λῦσον τοὺς τέσσαρας ἀγγέλους τοὺς δεδεμένους ἐπὶ τῷ ποταμῷ τῷ μεγάλῳ Εὐφράτῃ.',
   'legonta tō hektō angelō ho echōn tēn salpinga, Lyson tous tessaras angelous tous dedemenous epi tō potamō tō megalō Euphratē.',
   'The voice commands the sixth angel to ''Loose the four angels which are bound in the great river Euphrates.'' These are not holy angels but fallen, destructive entities, held in restraint until God''s appointed time. The Euphrates River was a historical boundary for Israel and often associated with invading armies from the East (e.g., Assyrians, Babylonians), symbolizing a source of great threat and judgment in biblical prophecy (Jer 46:10).',
   NULL),
  (15,
   'And the four angels were loosed, which were prepared for an hour, and a day, and a month, and a year, for to slay the third part of men.',
   'Καὶ ἐλύθησαν οἱ τέσσαρες ἄγγελοι οἱ ἡτοιμασμένοι εἰς τὴν ὥραν καὶ ἡμέραν καὶ μῆνα καὶ ἐνιαυτόν, ἵνα ἀποκτείνωσιν τὸ τρίτον τῶν ἀνθρώπων.',
   'Kai elythēsan hoi tessares angeloi hoi hētoimasmenoi eis tēn hōran kai hēmeran kai mēna kai eniauton, hina apokteinōsin to triton tōn anthrōpōn.',
   'The four angels are released, having been ''prepared for an hour, and a day, and a month, and a year.'' This precise timing emphasizes God''s meticulous sovereignty over all events, even the release of destructive forces. Their purpose is to ''slay the third part of men,'' indicating a massive, unprecedented loss of life. This judgment is far more severe than the torment of the first woe, escalating the divine wrath.',
   'This verse powerfully illustrates God''s absolute sovereignty over time and judgment. The precise timing (''hour, day, month, year'') for the release of these destructive angels demonstrates that even catastrophic events are not random but are part of God''s meticulously planned eschatological timetable. The slaying of ''the third part of men'' signifies a devastating, yet divinely limited, judgment upon an unrepentant world, emphasizing the severity of God''s wrath against sin.'),
  (16,
   'And the number of the army of the horsemen were two hundred thousand thousand: and I heard the number of them.',
   'Καὶ ὁ ἀριθμὸς τῶν στρατευμάτων τοῦ ἱππικοῦ δισμυριάδες μυριάδων· καὶ ἤκουσα τὸν ἀριθμὸν αὐτῶν.',
   'Kai ho arithmos tōn strateumatōn tou hippikou dismyriades myriadōn; kai ēkousa ton arithmon autōn.',
   'John hears the number of the ''army of the horsemen'' (τοῦ ἱππικοῦ) as ''two hundred thousand thousand'' (δισμυριάδες μυριάδων), or 200 million. This is an impossibly large earthly army for the ancient world, suggesting a supernatural or demonic host. The sheer scale emphasizes the overwhelming power and vastness of this destructive force, making it clear that this is no ordinary military conflict but a divinely orchestrated judgment.',
   NULL),
  (17,
   'And thus I saw the horses in the vision, and them that sat on them, having breastplates of fire, and of jacinth, and brimstone: and the heads of the horses were as the heads of lions; and out of their mouths issued fire and smoke and brimstone.',
   'Καὶ οὕτως εἶδον τοὺς ἵππους ἐν τῇ ὁράσει καὶ τοὺς καθημένους ἐπ᾽ αὐτῶν, ἔχοντας θώρακας πυρίνους καὶ ὑακινθίνους καὶ θειώδεις, καὶ αἱ κεφαλαὶ τῶν ἵππων ὡς κεφαλαὶ λεόντων, καὶ ἐκ τῶν στομάτων αὐτῶν ἐκπορεύεται πῦρ καὶ καπνὸς καὶ θεῖον.',
   'Kai houtōs eidon tous hippous en tē horasei kai tous kathēmenous ep'' autōn, echontas thōrakas pyrinous kai hyakinthinous kai theiōdeis, kai hai kephalai tōn hippōn hōs kephalai leontōn, kai ek tōn stomatōn autōn ekporeuetai pyr kai kapnos kai theion.',
   'John describes the riders and their horses. The riders wear breastplates of ''fire, and of jacinth (dark blue), and brimstone (sulfur),'' colors associated with divine judgment and hellfire. The horses themselves have ''heads as the heads of lions,'' signifying ferocity, and from their mouths issue ''fire and smoke and brimstone.'' This imagery directly links them to the destructive power of God''s judgment, reminiscent of the destruction of Sodom and Gomorrah (Gen 19:24) and prophetic judgments (Ezek 38:22).',
   NULL),
  (18,
   'By these three was the third part of men killed, by the fire, and by the smoke, and by the brimstone, which issued out of their mouths.',
   'Ὑπὸ τῶν τριῶν τούτων ἀπεκτάνθησαν τὸ τρίτον τῶν ἀνθρώπων, ἐκ τοῦ πυρὸς καὶ ἐκ τοῦ καπνοῦ καὶ ἐκ τοῦ θείου τοῦ ἐκπορευομένου ἐκ τῶν στομάτων αὐτῶν.',
   'Hypo tōn triōn toutōn apektanthēsan to triton tōn anthrōpōn, ek tou pyros kai ek tou kapnou kai ek tou theiō tou ekporeuomenou ek tōn stomatōn autōn.',
   'This verse explicitly states that ''the third part of men'' were killed by these ''three'' elements: ''the fire, and by the smoke, and by the brimstone'' issuing from the horses'' mouths. This confirms the lethal nature of this second woe, contrasting sharply with the non-lethal torment of the first woe. The imagery is apocalyptic, depicting a judgment of immense scale and destructive power, directly from the agents of divine wrath.',
   NULL),
  (19,
   'For their power is in their mouth, and in their tails: for their tails were like unto serpents, and had heads, and with them they do hurt.',
   'Ἡ γὰρ ἐξουσία αὐτῶν ἐν τῷ στόματί ἐστιν καὶ ἐν ταῖς οὐραῖς αὐτῶν· αἱ γὰρ οὐραὶ αὐτῶν ὅμοιαι ὄφεσιν, ἔχουσαι κεφαλάς, καὶ ἐν αὐταῖς ἀδικοῦσιν.',
   'Hē gar exousia autōn en tō stomati estin kai en tais ourais autōn; hai gar ourai autōn homoiai ophesin, echousai kephalas, kai en autais adikousin.',
   'The power (ἐξουσία) of these entities resides in both their mouths (issuing fire, smoke, brimstone) and their tails. The tails are described as ''like unto serpents, and had heads,'' and ''with them they do hurt.'' This grotesque detail adds another layer of horror and demonic imagery, suggesting a dual source of destruction and deception. The serpent imagery often symbolizes evil and deception in Scripture (Gen 3:1, Rev 12:9).',
   NULL),
  (20,
   'And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:',
   'Καὶ οἱ λοιποὶ τῶν ἀνθρώπων οἱ οὐκ ἀπεκτάνθησαν ἐν ταῖς πληγαῖς ταύταις οὐδὲ μετενόησαν ἐκ τῶν ἔργων τῶν χειρῶν αὐτῶν, ἵνα μὴ προσκυνήσωσιν τὰ δαιμόνια καὶ τὰ εἴδωλα τὰ χρυσᾶ καὶ τὰ ἀργυρᾶ καὶ τὰ χαλκᾶ καὶ τὰ λίθινα καὶ τὰ ξύλινα, ἃ οὔτε βλέπειν δύνανται οὔτε ἀκούειν οὔτε περιπατεῖν·',
   'Kai hoi loipoi tōn anthrōpōn hoi ouk apektanthēsan en tais plēgais tautais oude metenoēsan ek tōn ergōn tōn cheirōn autōn, hina mē proskynēsōsin ta daimonia kai ta eidōla ta chrysa kai ta argyra kai ta chalka kai ta lithina kai ta xylina, ha oute blepein dynantai oute akouein oute peripatein;',
   'Despite the horrific judgments, ''the rest of the men which were not killed...yet repented not.'' This highlights humanity''s stubborn rebellion and hardened hearts. Their unrepentance is specifically linked to their idolatry: worshipping ''devils'' (δαιμόνια) and ''idols of gold, and silver, and brass, and stone, and of wood.'' This list of materials emphasizes the futility of worshipping inanimate objects, which ''neither can see, nor hear, nor walk,'' echoing Old Testament condemnations of idolatry (Ps 115:4-7, Isa 44:9-20).',
   'This verse presents a sobering theological truth: even overwhelming divine judgment does not automatically lead to repentance. Humanity''s persistent refusal to turn from idolatry and demon worship, despite experiencing catastrophic plagues, reveals the depth of human depravity and spiritual blindness. It underscores the necessity of a divinely initiated change of heart for true repentance, as mere suffering is insufficient to break the hold of sin.'),
  (21,
   'Neither repented they of their murders, nor of their sorceries, nor of their fornication, nor of their thefts.',
   'οὐδὲ μετενόησαν ἐκ τῶν φόνων αὐτῶν οὔτε ἐκ τῶν φαρμακειῶν αὐτῶν οὔτε ἐκ τῆς πορνείας αὐτῶν οὔτε ἐκ τῶν κλεμμάτων αὐτῶν.',
   'oude metenoēsan ek tōn phonōn autōn oute ek tōn pharmakeiōn autōn oute ek tēs porneias autōn oute ek tōn klemmātōn autōn.',
   'The list of unrepented sins continues, encompassing moral transgressions: ''murders'' (φόνων), ''sorceries'' (φαρμακειῶν, which can also refer to drug use or occult practices), ''fornication'' (πορνείας, sexual immorality), and ''thefts'' (κλεμμάτων). This comprehensive list demonstrates a complete lack of moral and spiritual transformation, indicating that the judgments have failed to achieve their redemptive purpose for these individuals. It reflects a society steeped in sin, unwilling to acknowledge God''s authority.',
   'The catalog of unrepented sins—murder, sorcery, fornication, and theft—reveals the pervasive moral corruption of humanity in the face of judgment. ''Sorceries'' (φαρμακεία) is particularly significant, pointing to occult practices and drug use often associated with demonic influence. This persistent clinging to sin, even amidst divine wrath, highlights the profound spiritual rebellion inherent in the human heart and the ultimate necessity of God''s grace for true transformation.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 9;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀστέρα', 'astera', 'G792', 'From ''astron'' (star). Refers to a celestial body, but in apocalyptic literature, it often symbolizes a powerful spiritual being, either divine or angelic. Here, ''a star fallen from heaven'' is widely interpreted as a symbolic representation of a fallen angel, likely Satan or a high-ranking demon, given the authority granted to him over the abyss.', 1),
  ('κλεὶς', 'kleis', 'G2807', 'A key, from ''kleiō'' (to shut). Symbolizes authority, power, or the right to open or close something. In this context, ''the key of the bottomless pit'' signifies divine authorization given to the fallen star to release the destructive forces confined within, demonstrating God''s ultimate control over even demonic powers.', 2),
  ('ἀβύσσου', 'abyssou', 'G12', 'From ''a'' (not) and ''byssos'' (bottom). Meaning ''bottomless,'' ''unfathomable depth,'' or ''abyss.'' In the New Testament, it refers to a specific place of confinement for demonic spirits, often equated with the underworld or a prison for fallen angels. It represents a realm of divine restraint and judgment, from which evil is temporarily unleashed.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀκρίδες', 'akrides', 'G20', 'Locusts. While literally referring to the insect, in Revelation, these ''locusts'' are clearly supernatural entities, distinguished by their appearance and specific mission. They symbolize a destructive, overwhelming force, drawing on Old Testament imagery of plagues and invading armies, but with a demonic, tormenting nature.', 1),
  ('ἐξουσία', 'exousia', 'G1849', 'From ''exesti'' (it is lawful). Meaning ''authority,'' ''power,'' ''right,'' or ''jurisdiction.'' Here, it denotes the delegated and limited power given to the demonic locusts to inflict harm. This highlights that even destructive forces operate under divine permission and within specific boundaries set by God.', 2),
  ('σκορπίοι', 'skorpioi', 'G4651', 'Scorpions. A venomous arachnid known for its painful sting. The comparison of the locusts'' power to that of scorpions emphasizes their ability to inflict severe, agonizing, but not necessarily fatal, torment. This imagery underscores the nature of the first woe as a period of intense suffering.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀδικήσωσιν', 'adikēsōsin', 'G91', 'From ''adikeō'' (to be unjust, to do wrong, to injure). Here, it means ''to hurt'' or ''to harm.'' The command not to harm vegetation but only specific people highlights the precise and targeted nature of this divine judgment, distinguishing these supernatural locusts from natural plagues.', 1),
  ('σφραγῖδα', 'sphragida', 'G4973', 'A seal, signet, or mark. Symbolizes ownership, authenticity, security, or protection. In Revelation, ''the seal of God'' on the foreheads of His servants signifies divine identification and protection from specific judgments. It contrasts with the ''mark of the beast'' and assures believers of God''s safeguarding amidst tribulation.', 2),
  ('μετώπων', 'metōpōn', 'G3359', 'From ''meta'' (with) and ''ōps'' (eye). The forehead. In ancient cultures, the forehead was a prominent place for marking, symbolizing allegiance, ownership, or status. The ''seal of God'' on the forehead indicates a visible or spiritual mark of belonging to God, signifying His protection and the individual''s commitment to Him.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 4;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βασιλέα', 'basilea', 'G935', 'From ''basis'' (a step, foundation). A king, ruler, or sovereign. The fact that these demonic locusts have a ''king'' indicates an organized hierarchy within the forces of evil, rather than chaotic randomness. This king is a powerful spiritual entity, demonstrating the structured nature of demonic opposition.', 1),
  ('Ἀβαδδών', 'Abaddōn', 'G3', 'A Hebrew word meaning ''destruction,'' ''ruin,'' or ''place of destruction.'' In the Old Testament, it''s often associated with Sheol or the grave. Here, it is the proper name of the angel of the bottomless pit, emphasizing his destructive character and role in God''s judgment.', 2),
  ('Ἀπολλύων', 'Apollyōn', 'G623', 'A Greek word meaning ''destroyer.'' It is the Greek equivalent of the Hebrew ''Abaddon.'' The dual naming emphasizes the universal and undeniable destructive nature of this demonic leader, who is the orchestrator of the first woe and a key figure in the unfolding judgments.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 11;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλύθησαν', 'elythēsan', 'G3089', 'From ''lyō'' (to loose, untie, release). Here, it means ''they were loosed'' or ''released.'' This signifies the divine permission for these four destructive angels, previously bound, to be set free. It underscores God''s ultimate control over even malevolent forces, releasing them at His appointed time for His purposes.', 1),
  ('ἡτοιμασμένοι', 'hētoimasmenoi', 'G2090', 'From ''hetoimazō'' (to prepare, make ready). Meaning ''prepared'' or ''made ready.'' This highlights that the release of these angels and their destructive mission is not random but pre-ordained and precisely timed by God. It speaks to the meticulous nature of divine judgment and prophecy.', 2),
  ('ἀποκτείνωσιν', 'apokteinōsin', 'G615', 'From ''apokteinō'' (to kill, slay). In contrast to the first woe where the locusts were commanded not to kill, these angels are explicitly released ''to slay the third part of men.'' This marks a significant escalation in the severity of God''s judgments, moving from torment to widespread death.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 15;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετενόησαν', 'metenoēsan', 'G3340', 'From ''metanoeō'' (to change one''s mind, repent). Meaning ''they repented.'' This word signifies a fundamental change of heart, mind, and direction, turning away from sin and towards God. The fact that the survivors ''repented not'' despite severe judgments highlights humanity''s stubborn resistance to God''s call.', 1),
  ('δαιμόνια', 'daimonia', 'G1140', 'From ''daimōn'' (a demon, evil spirit). Refers to evil spiritual beings or demons. The worship of ''devils'' indicates direct allegiance to demonic powers, often through idolatry or occult practices. This is a grave sin, demonstrating a rejection of the one true God.', 2),
  ('εἴδωλα', 'eidōla', 'G1497', 'From ''eidos'' (that which is seen, form). An idol, image, or false god. Refers to objects of worship that are not the true God. The detailed list of materials (gold, silver, brass, stone, wood) emphasizes the futility and lifelessness of these man-made objects, contrasting with the living God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 20;

-- Verse 21
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φόνων', 'phonōn', 'G5408', 'From ''phonos'' (murder, slaughter). Refers to acts of killing or homicide. This is a direct violation of God''s moral law (Exod 20:13). The unrepentance from murders indicates a deep-seated disregard for human life and God''s commandments.', 1),
  ('φαρμακειῶν', 'pharmakeiōn', 'G5331', 'From ''pharmakeia'' (the use of drugs, poisoning, sorcery, witchcraft). This term encompasses not only the literal use of drugs but also magical arts, enchantments, and occult practices, often involving the manipulation of spirits. It signifies a reliance on supernatural powers outside of God, a form of spiritual rebellion.', 2),
  ('πορνείας', 'porneias', 'G4202', 'From ''porneuō'' (to commit fornication). Refers to sexual immorality of various kinds, including prostitution, adultery, and other illicit sexual acts. In biblical terms, it also often symbolizes spiritual unfaithfulness or idolatry. Unrepentance from this sin indicates a rejection of God''s standards for purity and faithfulness.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = 21;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Rev 8:13', 1),
  (1, 'Luke 10:18', 2),
  (1, 'Isa 14:12', 3),
  (1, 'Rev 20:1', 4),
  (2, 'Exod 19:18', 1),
  (2, 'Joel 2:2', 2),
  (2, 'Joel 2:10', 3),
  (2, 'Rev 6:12', 4),
  (3, 'Exod 10:12-15', 1),
  (3, 'Joel 2:4-5', 2),
  (3, 'Luke 10:19', 3),
  (4, 'Rev 7:3', 1),
  (4, 'Ezek 9:4', 2),
  (4, 'Exod 10:15', 3),
  (4, 'Rev 6:6', 4),
  (5, 'Rev 9:10', 1),
  (5, 'Rev 9:6', 2),
  (5, 'Prov 23:32', 3),
  (6, 'Job 3:21', 1),
  (6, 'Jer 8:3', 2),
  (6, 'Hosea 10:8', 3),
  (6, 'Rev 6:16', 4),
  (7, 'Joel 2:4', 1),
  (7, 'Nahum 3:17', 2),
  (7, 'Dan 7:4', 3),
  (8, 'Joel 1:6', 1),
  (8, 'Dan 7:5', 2),
  (9, 'Joel 2:5', 1),
  (9, 'Nahum 2:4', 2),
  (10, 'Rev 9:3', 1),
  (10, 'Rev 9:5', 2),
  (11, 'Rev 20:1', 1),
  (11, 'Job 26:6', 2),
  (11, 'Prov 15:11', 3),
  (13, 'Rev 8:3-5', 1),
  (13, 'Exod 30:1-3', 2),
  (14, 'Gen 15:18', 1),
  (14, 'Jer 46:10', 2),
  (14, 'Rev 16:12', 3),
  (15, 'Dan 11:36', 1),
  (15, 'Rev 8:7-12', 2),
  (15, 'Zech 13:8-9', 3),
  (16, 'Ps 68:17', 1),
  (16, 'Dan 7:10', 2),
  (17, 'Ezek 38:22', 1),
  (17, 'Gen 19:24', 2),
  (17, 'Isa 30:33', 3),
  (18, 'Rev 9:15', 1),
  (18, 'Rev 11:13', 2),
  (19, 'Isa 9:15', 1),
  (19, 'Rev 12:9', 2),
  (20, 'Rev 16:9', 1),
  (20, 'Deut 4:28', 2),
  (20, 'Ps 115:4-7', 3),
  (20, 'Isa 44:9-20', 4),
  (21, 'Gal 5:19-21', 1),
  (21, 'Rev 21:8', 2),
  (21, 'Rev 22:15', 3),
  (21, 'Mark 7:21-23', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 9 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 9 Complete!
-- 21 verses · 7 key verses with word studies (21 words)
-- Cross-references for 20 verses (59 refs)
-- ═══════════════════════════════════════════════════════