-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 4 — The Heavenly Throne Room: God's Sovereign Majesty and Unceasing Worship
-- 11 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Revelation 4 marks a pivotal transition in John''s apocalyptic vision, moving from the earthly church''s state to a majestic portrayal of God''s heavenly throne room. John is summoned through an ''open door'' to witness future events, providing a cosmic perspective on divine sovereignty. This chapter establishes the absolute authority of God the Father, depicted in awe-inspiring glory through symbolic gemstones and a surrounding rainbow. He is worshipped by celestial beings, including twenty-four elders and four living creatures, who perpetually declare His holiness and creative power. This foundational scene underscores God''s unshakeable power and worthiness, setting the theological stage for the unfolding judgments and redemptive acts in the subsequent chapters of Revelation.',
  'The Heavenly Throne Room: God''s Sovereign Majesty and Unceasing Worship',
  'θρόνος (thronos)',
  'Derived from an Indo-European root meaning ''to sit,'' θρόνος signifies a seat of authority, power, and kingship. In biblical theology, particularly in Revelation, it represents God''s absolute sovereignty and dominion over all creation. It emphasizes His ultimate rule, divine prerogative to judge, and the unshakeable foundation of His cosmic governance, making it the central image of divine authority in this chapter.',
  '["Section 1 (vv.1-2): John''s Summons and the Vision of the Heavenly Throne","Section 2 (vv.3-5): The Appearance of God and the Throne''s Immediate Surroundings","Section 3 (vv.4, 10): The Twenty-Four Elders and Their Posture of Worship","Section 4 (vv.6-8a): The Four Living Creatures and Their Attributes","Section 5 (vv.8b-11): The Unceasing Worship of the Creator God"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 11 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.',
   'Μετὰ τοῦτο εἶδον, καὶ ἰδοὺ θύρα ἀνεῳγμένη ἐν τῷ οὐρανῷ, καὶ ἡ φωνὴ ἡ πρώτη ἣν ἤκουσα ὡς σάλπιγγος λαλούσης μετ’ ἐμοῦ, λεγούσης, Ἀνάβα ὧδε, καὶ δείξω σοι ἃ δεῖ γενέσθαι μετὰ ταῦτα.',
   'Meta touto eidon, kai idou thyra aneōgmenē en tō ouranō, kai hē phōnē hē prōtē hēn ēkousa hōs salpingos lalousēs met'' emou, legousēs, Anaba hōde, kai deixō soi ha dei genesthai meta tauta.',
   'John''s vision begins with an ''open door'' (θύρα ἀνεῳγμένη), a common biblical motif for divine revelation (Ezek 1:1; Acts 7:56). The trumpet-like voice (φωνὴ ὡς σάλπιγγος) echoes Old Testament theophanies (Exod 19:16, 19) and signals a direct divine summons. The command ''Come up hither'' (Ἀνάβα ὧδε) parallels Moses ascending Sinai and signifies a prophetic elevation to receive revelation. The phrase ''things which must be hereafter'' (ἃ δεῖ γενέσθαι μετὰ ταῦτα) explicitly states the prophetic nature of the book, focusing on future events from God''s perspective, emphasizing divine foreknowledge and control.',
   'This verse highlights God''s initiative in revealing His future plans. The open door symbolizes divine access and the unveiling of heavenly realities to humanity. The direct summons emphasizes the prophetic office and the divine inspiration of John''s vision, establishing the authority and eschatological significance of the Revelation as a divinely revealed prophecy.'),
  (2,
   'And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.',
   'Καὶ εὐθέως ἐγενόμην ἐν πνεύματι· καὶ ἰδοὺ θρόνος ἔκειτο ἐν τῷ οὐρανῷ, καὶ ἐπὶ τὸν θρόνον καθήμενος.',
   'Kai eutheōs egenomēn en pneumati; kai idou thronos ekeito en tō ouranō, kai epi ton thronon kathēmenos.',
   'John''s immediate transition ''in the spirit'' (ἐν πνεύματι) indicates a state of divine inspiration or ecstatic vision, similar to his experience in Rev 1:10. The central image is a ''throne set in heaven'' (θρόνος ἔκειτο ἐν τῷ οὐρανῷ), establishing God''s sovereignty as the foundational truth of the entire book. The ''one sat on the throne'' (καθήμενος) is God the Father, whose presence is described indirectly through brilliant gemstones in the next verse, emphasizing His ineffable glory and majesty. This vision grounds all subsequent events in the ultimate authority of God.',
   'The immediate presence of God''s throne underscores His absolute sovereignty over all creation and history. This vision assures believers that despite earthly chaos, a divine, unshakeable authority governs all things. It is a foundational theological statement affirming God''s ultimate control and purpose, providing comfort and confidence in His divine plan.'),
  (3,
   'And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.',
   'καὶ ὁ καθήμενος ἦν ὅμοιος ὁράσει λίθῳ ἰάσπιδι καὶ σαρδίῳ, καὶ ἶρις κυκλόθεν τοῦ θρόνου ὅμοιος ὁράσει σμαραγδίνῳ.',
   'kai ho kathēmenos ēn homoios horasei lithō iaspidi kai sardio, kai iris kyklothen tou thronou homoios horasei smaragdinō.',
   'The description of God on the throne uses precious stones rather than a direct anthropomorphic image, emphasizing His transcendent glory and ineffability. Jasper (ἰάσπιδι), often clear or brilliant, and sardine (σαρδίῳ), a fiery red stone, likely symbolize God''s purity, holiness, and consuming judgment (Heb 12:29). The rainbow (ἶρις) ''like an emerald'' (σμαραγδίνῳ) encircling the throne recalls God''s covenant faithfulness (Gen 9:13-16) and mercy, even amidst His awesome power. This imagery conveys both the terrifying holiness and the steadfast grace of God.',
   'God''s appearance, described through brilliant gemstones, signifies His transcendent glory, purity, and fiery holiness, while the emerald rainbow around the throne symbolizes His covenant faithfulness and mercy. This dual imagery assures believers of God''s unwavering commitment to His promises, even as His justice is revealed, providing a balanced view of His divine attributes.'),
  (4,
   'And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.',
   'Καὶ κυκλόθεν τοῦ θρόνου θρόνοι εἴκοσι τέσσαρες, καὶ ἐπὶ τοὺς θρόνους εἴκοσι τέσσαρας πρεσβυτέρους καθημένους, περιβεβλημένους ἐν ἱματίοις λευκοῖς, καὶ ἐπὶ τὰς κεφαλὰς αὐτῶν στεφάνους χρυσοῦς.',
   'Kai kyklothen tou thronou thronoi eikosi tessares, kai epi tous thronous eikosi tessaras presbyterous kathēmenous, peribeblēmenous en himatiois leukois, kai epi tas kephalas autōn stephanous chrysous.',
   'The ''twenty-four elders'' (εἴκοσι τέσσαρας πρεσβυτέρους) are a significant interpretive challenge. They are often understood as representing the redeemed church, symbolizing the twelve tribes of Israel and the twelve apostles (Rev 21:12-14), thus encompassing the whole people of God from both Old and New Covenants. Their white raiment (ἱματίοις λευκοῖς) signifies purity and victory, while their golden crowns (στεφάνους χρυσοῦς) indicate royal dignity and reward for faithfulness. Their presence on thrones suggests a share in Christ''s reign (Rev 3:21; 2 Tim 2:12).',
   'The twenty-four elders, representing the redeemed people of God, signify the church''s participation in Christ''s reign and its assured reward. Their white robes and golden crowns symbolize purity, victory, and royal status, affirming the believer''s ultimate glorification and co-regency with Christ in the heavenly realm.'),
  (5,
   'And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of God.',
   'Καὶ ἐκ τοῦ θρόνου ἐκπορεύονται ἀστραπαὶ καὶ φωναὶ καὶ βρονταί· καὶ ἑπτὰ λαμπάδες πυρὸς καιόμεναι ἐνώπιον τοῦ θρόνου, αἵ εἰσιν τὰ ἑπτὰ πνεύματα τοῦ Θεοῦ.',
   'Kai ek tou thronou ekporeuontai astrapai kai phōnai kai brontai; kai hepta lampades pyros kaiomenai enōpion tou thronou, hai eisin ta hepta pneumata tou Theou.',
   'The ''lightnings and thunderings and voices'' (ἀστραπαὶ καὶ φωναὶ καὶ βρονταί) emanating from the throne recall the awesome manifestations of God''s presence at Mount Sinai (Exod 19:16) and signify His power, judgment, and authority. The ''seven lamps of fire'' (ἑπτὰ λαμπάδες πυρὸς) are explicitly identified as ''the seven Spirits of God'' (τὰ ἑπτὰ πνεύματα τοῦ Θεοῦ), a symbolic representation of the Holy Spirit in His fullness and diverse operations (Isa 11:2; Zech 4:2-6). This emphasizes the active presence and power of the Holy Spirit in the divine council and in the execution of God''s will.',
   NULL),
  (6,
   'And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind.',
   'Καὶ ἐνώπιον τοῦ θρόνου θάλασσα ὑαλίνη ὁμοία κρυστάλλῳ· καὶ ἐν μέσῳ τοῦ θρόνου καὶ κύκλῳ τοῦ θρόνου τέσσαρα ζῷα γέμοντα ὀφθαλμῶν ἔμπροσθεν καὶ ὄπισθεν.',
   'Kai enōpion tou thronou thalassa hyalinē homoia krystallō; kai en mesō tou thronou kai kyklō tou thronou tessara zōa gemonta ophthalmōn emprosthen kai opisthen.',
   'The ''sea of glass like unto crystal'' (θάλασσα ὑαλίνη ὁμοία κρυστάλλῳ) before the throne suggests purity, tranquility, and perhaps a separation between the holy God and His creation, reminiscent of the laver in the tabernacle (Exod 30:18). In contrast to the turbulent earthly seas, this symbolizes divine order and peace. In the midst of and around the throne are ''four beasts'' or ''living creatures'' (τέσσαρα ζῷα), full of eyes, echoing the cherubim and seraphim of Ezekiel (Ezek 1:5-18; 10:12) and Isaiah (Isa 6:2-3). Their numerous eyes symbolize omniscience and constant vigilance.',
   'The ''sea of glass'' symbolizes divine purity and the tranquil order of God''s presence, contrasting with earthly chaos. The ''four living creatures,'' full of eyes, represent the highest order of created beings, embodying perfect knowledge and constant vigilance in their service and worship of God, reflecting His omnipresence and omnipotence.'),
  (7,
   'And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle.',
   'Καὶ τὸ ζῷον τὸ πρῶτον ὅμοιον λέοντι, καὶ τὸ δεύτερον ζῷον ὅμοιον μόσχῳ, καὶ τὸ τρίτον ζῷον ἔχον τὸ πρόσωπον ὡς ἀνθρώπου, καὶ τὸ τέταρτον ζῷον ὅμοιον ἀετῷ πετομένῳ.',
   'Kai to zōon to prōton homoion leonti, kai to deuteron zōon homoion moschō, kai to triton zōon echon to prosōpon hōs anthrōpou, kai τὸ tetarton zōon homoion aetō petomenō.',
   'The four living creatures possess distinct forms: a lion, a calf (or ox), a man, and a flying eagle. These figures are deeply rooted in Old Testament imagery, particularly Ezekiel 1:10, where they represent the highest forms of created life: wild animals (lion), domesticated animals (ox), humanity (man), and birds (eagle). Early church fathers like Irenaeus and Augustine connected these forms to the four Gospels, symbolizing different aspects of Christ''s person and ministry (e.g., lion for royalty, ox for service, man for humanity, eagle for divinity). Collectively, they represent the entirety of creation offering worship to God.',
   NULL),
  (8,
   'And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, LORD God Almighty, which was, and is, and is to come.',
   'Καὶ τὰ τέσσαρα ζῷα, ἓν καθ’ ἓν αὐτῶν ἔχοντα ἀνὰ πτέρυγας ἕξ, κυκλόθεν καὶ ἔσωθεν γέμουσιν ὀφθαλμῶν· καὶ ἀνάπαυσιν οὐκ ἔχουσιν ἡμέρας καὶ νυκτὸς λέγοντα, Ἅγιος, ἅγιος, ἅγιος, Κύριος ὁ Θεὸς ὁ Παντοκράτωρ, ὁ ἦν καὶ ὁ ὢν καὶ ὁ ἐρχόμενος.',
   'Kai ta tessara zōa, hen kath'' hen autōn echonta ana pterygas hex, kyklothen kai esōthen gemousin ophthalmōn; kai anapausin ouk echousin hēmeras kai nyktos legonta, Hagios, hagios, hagios, Kyrios ho Theos ho Pantokratōr, ho ēn kai ho ōn kai ho erchomenos.',
   'Each living creature has six wings, a detail shared with Isaiah''s seraphim (Isa 6:2), signifying swiftness in service and reverence. Their being ''full of eyes within'' further emphasizes their comprehensive knowledge and constant awareness of God''s glory. Their unceasing cry, ''Holy, holy, holy,'' is a direct echo of Isaiah 6:3, emphasizing God''s absolute holiness and transcendence. The title ''LORD God Almighty'' (Κύριος ὁ Θεὸς ὁ Παντοκράτωρ) and the description ''who was, and is, and is to come'' (ὁ ἦν καὶ ὁ ὢν καὶ ὁ ἐρχόμενος) affirm God''s eternal, sovereign, and omnipotent nature, encompassing all time and power.',
   'The unceasing ''Holy, holy, holy'' declares God''s absolute moral purity and transcendence, a core attribute of His being. The title ''Lord God Almighty, who was, and is, and is to come'' affirms His eternal, immutable, and sovereign nature, establishing Him as the ultimate authority over all creation and history, deserving of perpetual worship.'),
  (9,
   'And when those beasts give glory and honour and thanks to him that sat on the throne, who liveth for ever and ever,',
   'Καὶ ὅταν δώσουσιν τὰ ζῷα δόξαν καὶ τιμὴν καὶ εὐχαριστίαν τῷ καθημένῳ ἐπὶ τοῦ θρόνου, τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων,',
   'Kai hotan dōsousin ta zōa doxan kai timēn kai eucharistian tō kathēmenō epi tou thronou, tō zōnti eis tous aiōnas tōn aiōnōn,',
   'This verse describes the responsive worship cycle in heaven. When the living creatures give ''glory and honour and thanks'' (δόξαν καὶ τιμὴν καὶ εὐχαριστίαν) to God, it triggers a corresponding act of worship from the elders. This highlights the dynamic and interactive nature of heavenly worship. The object of their worship is ''him that sat on the throne, who liveth for ever and ever'' (τῷ καθημένῳ ἐπὶ τοῦ θρόνου, τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων), reiterating God''s eternal existence and supreme authority as the basis for all adoration. This perpetual worship underscores God''s unchanging worthiness.',
   NULL),
  (10,
   'The four and twenty elders fall down before him that sat on the throne, and worship him that liveth for ever and ever, and cast their crowns before the throne, saying,',
   'πεσοῦνται οἱ εἴκοσι τέσσαρες πρεσβύτεροι ἐνώπιον τοῦ καθημένου ἐπὶ τοῦ θρόνου, καὶ προσκυνήσουσιν τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων, καὶ βαλοῦσιν τοὺς στεφάνους αὐτῶν ἐνώπιον τοῦ θρόνου, λέγοντες,',
   'Pesountai hoi eikosi tessares presbyteroi enōpion tou kathēmenou epi tou thronou, kai proskynēsousin tō zōnti eis tous aiōnas tōn aiōnōn, kai balousin tous stephanous autōn enōpion tou thronou, legontes,',
   'In response to the living creatures'' worship, the twenty-four elders ''fall down'' (πεσοῦνται) in humble adoration, a posture of ultimate submission and reverence. They ''worship him that liveth for ever and ever'' (προσκυνήσουσιν τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων), echoing the eternal nature of God. Their act of ''casting their crowns before the throne'' (βαλοῦσιν τοὺς στεφάνους αὐτῶν) is a profound symbol of humility and recognition that any authority or reward they possess comes solely from God. It signifies that all glory ultimately belongs to Him, not to themselves, even in their exalted state.',
   'The elders casting their crowns before the throne symbolizes the ultimate humility and recognition that all authority, honor, and reward derive solely from God. This act teaches that even in glorification, the redeemed acknowledge God as the supreme source of all good, directing all praise and glory back to Him alone.'),
  (11,
   'Thou art worthy, O Lord, to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created.',
   'Ἄξιος εἶ, Κύριε, καὶ ὁ Θεὸς ἡμῶν, λαβεῖν τὴν δόξαν καὶ τὴν τιμὴν καὶ τὴν δύναμιν· ὅτι σὺ ἔκτισας τὰ πάντα, καὶ διὰ τὸ θέλημά σου εἰσὶν καὶ ἐκτίσθησαν.',
   'Axios ei, Kyrie, kai ho Theos hēmōn, labein tēn doxan kai tēn timēn kai tēn dynamin; hoti sy ektisas ta panta, kai dia to thelēma sou eisin kai ektisthēsan.',
   'The elders'' declaration, ''Thou art worthy, O Lord'' (Ἄξιος εἶ, Κύριε), is a central theme in Revelation, establishing God''s inherent right to receive all ''glory and honour and power'' (δόξαν καὶ τιμὴν καὶ τὴν δύναμιν). The reason for His worthiness is explicitly stated: ''for thou hast created all things, and for thy pleasure they are and were created'' (ὅτι σὺ ἔκτισας τὰ πάντα, καὶ διὰ τὸ θέλημά σου εἰσὶν καὶ ἐκτίσθησαν). This affirms God''s role as the sovereign Creator, whose will is the ultimate purpose and origin of all existence. This doxology sets the stage for understanding all subsequent events as part of His sovereign plan.',
   'This doxology affirms God''s inherent worthiness to receive all glory, honor, and power because He is the Creator of all things. It establishes that creation exists by His will and for His pleasure, underscoring His absolute sovereignty and teleological purpose for the universe. This truth forms the bedrock of all worship and understanding of divine providence.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θρόνος', 'thronos', 'G2362', 'From an Indo-European root meaning ''to sit,'' θρόνος denotes a seat of authority, power, and kingship. In the Septuagint and New Testament, it signifies God''s absolute sovereignty and dominion over all creation. It emphasizes His ultimate rule and the divine prerogative to judge and govern, serving as the central image of divine authority in Revelation 4, establishing God''s supreme position.', 1),
  ('πνεύματι', 'pneumati', 'G4151', 'Dative singular of πνεῦμα (pneuma), meaning ''spirit,'' ''wind,'' or ''breath.'' In this context, ''ἐν πνεύματι'' signifies being in a state of spiritual ecstasy or under divine inspiration, where John''s human senses are transcended, allowing him to perceive heavenly realities. It denotes a profound spiritual experience, indicating direct divine communication and revelation, essential for understanding prophetic visions.', 2),
  ('καθήμενος', 'kathēmenos', 'G2521', 'Present active participle of κάθημαι (kathēmai), ''to sit.'' Here, it refers to ''the one sitting'' on the throne, unequivocally identifying God the Father. The act of sitting on a throne denotes a position of established authority, rest, and judgment. It emphasizes God''s settled and unshakeable reign, signifying His ultimate control and sovereign presence over all creation and future events.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = 2;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἰάσπιδι', 'iaspidi', 'G2393', 'Dative singular of ἴασπις (iaspis), ''jasper.'' This precious stone, often described as clear, brilliant, or even fiery, is used to describe the appearance of God. It symbolizes His radiant glory, purity, and holiness. In Revelation, jasper is frequently associated with divine majesty and the splendor of God''s presence, reflecting His unapproachable light and perfection.', 1),
  ('σαρδίῳ', 'sardio', 'G4556', 'Dative singular of σάρδιον (sardion), ''sardine stone'' or ''carnelian.'' This stone is typically fiery red. When used in conjunction with jasper to describe God''s appearance, it often symbolizes His consuming fire, righteous judgment, and divine wrath (Heb 12:29). It conveys the awesome and formidable aspect of God''s holiness, emphasizing His power and justice.', 2),
  ('ἶρις', 'iris', 'G2409', 'Meaning ''rainbow.'' In the biblical context, the rainbow is primarily a symbol of God''s covenant faithfulness and mercy, first appearing after the flood as a sign of His promise not to destroy the earth by water again (Gen 9:13-16). Its presence around the throne signifies that even amidst God''s awesome power and judgment, His steadfast love and covenant promises endure, offering reassurance.', 3),
  ('σμαραγδίνῳ', 'smaragdinō', 'G4665', 'Dative singular of σμαράγδινος (smaragdinos), ''emerald-like'' or ''of emerald.'' The emerald, known for its vibrant green color, is associated with life, freshness, and hope. Its appearance in the rainbow around God''s throne reinforces the theme of God''s mercy and the renewal of His covenant promises, providing a calming and reassuring contrast to the fiery aspects of His glory, symbolizing peace and life.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πρεσβυτέρους', 'presbyterous', 'G4245', 'Accusative plural of πρεσβύτερος (presbyteros), meaning ''elder'' or ''older.'' In Revelation, the twenty-four elders are often interpreted as representing the redeemed people of God, encompassing both Old Testament saints (12 tribes) and New Testament believers (12 apostles). They symbolize the church in its glorified state, sharing in Christ''s reign and offering worship, signifying their honored position in God''s heavenly court.', 1),
  ('στεφάνους', 'stephanous', 'G4735', 'Accusative plural of στέφανος (stephanos), meaning ''crown'' or ''wreath.'' These golden crowns worn by the elders symbolize royal dignity, victory, and reward for faithfulness. Unlike a diadem (royal crown), a stephanos was often a victor''s wreath, indicating triumph. Their possession signifies the elders'' exalted status and their participation in Christ''s kingly authority, a promise to all faithful believers.', 2),
  ('λευκοῖς', 'leukois', 'G3022', 'Dative plural of λευκός (leukos), ''white.'' White raiment in Revelation consistently symbolizes purity, righteousness, and victory. It signifies the cleansing from sin through Christ''s blood and the righteous deeds of the saints. The elders'' white robes indicate their sanctified status and their triumphant position in God''s presence, reflecting the holiness required for heavenly worship.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = 4;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ζῷα', 'zōa', 'G2226', 'Neuter plural of ζῷον (zōon), meaning ''living creature'' or ''animal.'' In Revelation, these ''four living creatures'' are celestial beings, often identified with the cherubim or seraphim of the Old Testament (Ezek 1:5-18; Isa 6:2). They represent the highest order of created beings, serving as guardians of God''s throne and leading creation in worship, embodying aspects of divine majesty and vigilance.', 1),
  ('ὀφθαλμῶν', 'ophthalmōn', 'G3788', 'Genitive plural of ὀφθαλμός (ophthalmos), ''eye.'' The description of the living creatures being ''full of eyes'' (γέμοντα ὀφθαλμῶν) both before and behind, and within, symbolizes their comprehensive knowledge, constant vigilance, and perfect awareness of God''s glory and purposes. It signifies their omniscience and their ability to perceive all things, reflecting God''s own all-seeing nature.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = 6;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἅγιος', 'hagios', 'G40', 'Meaning ''holy,'' ''sacred,'' or ''set apart.'' The threefold repetition, ''Holy, holy, holy,'' is a superlative expression of God''s absolute moral purity, transcendence, and unique divine nature, echoing Isaiah 6:3. It signifies His complete separation from all sin and imperfection, emphasizing His inherent majesty and the awe-inspiring reverence due to Him alone, forming the core of heavenly worship.', 1),
  ('Παντοκράτωρ', 'Pantokratōr', 'G3841', 'Meaning ''Almighty,'' ''all-ruling,'' or ''omnipotent.'' This title, frequently used in Revelation, emphasizes God''s supreme power and absolute dominion over all creation and history. It assures believers that God is in complete control, capable of executing His will without hindrance. It is a declaration of His sovereign authority, providing comfort and confidence in His ultimate triumph.', 2),
  ('ἐρχόμενος', 'erchomenos', 'G2064', 'Present middle/passive participle of ἔρχομαι (erchomai), ''to come.'' In the phrase ''ὁ ἦν καὶ ὁ ὢν καὶ ὁ ἐρχόμενος'' (''who was, and is, and is to come''), it refers to God''s future coming, particularly in judgment and salvation. It highlights His eternal nature, encompassing past, present, and future, and His active involvement in history, especially in the eschatological events of Revelation.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = 8;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἄξιος', 'Axios', 'G514', 'Meaning ''worthy,'' ''deserving,'' or ''of equal weight.'' This declaration of worthiness is central to Revelation, affirming God''s inherent right to receive all glory, honor, and power. It is based not on human merit but on His divine nature and actions, particularly His role as Creator. The term underscores God''s supreme value and the justice of His claim to universal adoration.', 1),
  ('ἔκτισας', 'ektisas', 'G2936', 'Aorist active indicative of κτίζω (ktizō), ''to create,'' ''to form.'' This verb emphasizes God''s role as the sole originator of all things. The elders'' worship is grounded in God''s creative act, establishing His absolute sovereignty and ownership over the universe. It signifies that all existence derives from Him, making Him the rightful recipient of all worship and praise.', 2),
  ('θέλημά', 'thelēma', 'G2307', 'Meaning ''will,'' ''desire,'' or ''purpose.'' The phrase ''διὰ τὸ θέλημά σου'' (''for thy pleasure'' or ''by thy will'') asserts that all creation exists because of God''s sovereign intention and for His ultimate delight and purpose. It highlights God''s absolute autonomy and teleological control over the universe, affirming that nothing exists outside of His divine plan and pleasure, providing meaning to all existence.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = 11;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Ezekiel 1:1', 1),
  (1, 'Exodus 19:16-20', 2),
  (1, 'Revelation 1:19', 3),
  (1, 'Isaiah 6:1', 4),
  (2, 'Isaiah 6:1', 1),
  (2, 'Ezekiel 1:26', 2),
  (2, 'Daniel 7:9', 3),
  (2, 'Hebrews 4:16', 4),
  (3, 'Ezekiel 1:26-28', 1),
  (3, 'Exodus 24:10', 2),
  (3, 'Isaiah 54:9-10', 3),
  (3, 'Genesis 9:13-16', 4),
  (4, 'Revelation 5:8-10', 1),
  (4, 'Revelation 7:9-12', 2),
  (4, 'Revelation 11:16-18', 3),
  (4, 'Revelation 19:4', 4),
  (5, 'Exodus 19:16', 1),
  (5, 'Zechariah 4:2-6', 2),
  (5, 'Revelation 1:4', 3),
  (5, 'Revelation 8:5', 4),
  (6, 'Ezekiel 1:22', 1),
  (6, 'Revelation 15:2', 2),
  (6, 'Isaiah 6:2-3', 3),
  (6, 'Ezekiel 1:5-10', 4),
  (7, 'Ezekiel 1:10', 1),
  (7, 'Ezekiel 10:14', 2),
  (7, 'Genesis 3:24', 3),
  (8, 'Isaiah 6:2-3', 1),
  (8, 'Ezekiel 1:18', 2),
  (8, 'Revelation 1:8', 3),
  (8, 'Revelation 11:17', 4),
  (9, 'Revelation 5:13-14', 1),
  (9, 'Revelation 7:11-12', 2),
  (9, 'Revelation 19:4', 3),
  (10, 'Revelation 5:8', 1),
  (10, 'Revelation 5:14', 2),
  (10, 'Revelation 7:11', 3),
  (10, 'Revelation 11:16', 4),
  (11, 'Revelation 5:9-10', 1),
  (11, 'Revelation 5:12-13', 2),
  (11, 'Genesis 1:1', 3),
  (11, 'Psalm 33:6, 9', 4),
  (11, 'Colossians 1:16', 5)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 4 Complete!
-- 11 verses · 6 key verses with word studies (18 words)
-- Cross-references for 11 verses (43 refs)
-- ═══════════════════════════════════════════════════════