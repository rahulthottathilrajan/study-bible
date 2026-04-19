-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 5 — The Worthy Lamb: Unveiling God's Plan Through Christ's Sacrifice and Sovereignty
-- 14 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Revelation chapter 5 serves as a pivotal scene in John''s apocalyptic vision, transitioning from the heavenly throne room''s majesty to the unfolding of God''s redemptive plan. It introduces the central conflict: the search for one worthy to open a seven-sealed scroll, symbolizing God''s sovereign purposes and judgment. The chapter highlights the profound despair when no one is found worthy, followed by the triumphant revelation of Jesus Christ, depicted as both the ''Lion of the tribe of Judah'' and a ''Lamb as it had been slain.'' This dual imagery underscores His divine authority, messianic lineage, and sacrificial atonement. The chapter culminates in universal worship, affirming Christ''s unique worthiness to execute God''s plan, thereby establishing Him as the central figure in cosmic history and eschatology. It sets the stage for the subsequent judgments and redemptive acts described in Revelation.',
  'The Worthy Lamb: Unveiling God''s Plan Through Christ''s Sacrifice and Sovereignty',
  'ἄξιος (axios)',
  'From the root ''agō'' (to weigh), ''axios'' means ''worthy,'' ''deserving,'' or ''of equal weight.'' In Revelation 5, it is used repeatedly to describe the unique suitability and merit of Jesus Christ to open the sealed scroll, based on His sacrificial death and redemptive work. It signifies His inherent dignity and divine right to execute God''s sovereign plan, contrasting with the unworthiness of all others.',
  '["Section 1 (vv.1-4): The Sealed Scroll and John''s Despair","Section 2 (vv.5-7): The Lion-Lamb Revealed as Worthy","Section 3 (vv.8-10): The Worship of the Four Living Creatures and Elders","Section 4 (vv.11-12): The Myriad Angels Proclaim the Lamb''s Worthiness","Section 5 (vv.13-14): Universal Adoration of God and the Lamb"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals.',
   'Καὶ εἶδον ἐπὶ τὴν δεξιὰν τοῦ καθημένου ἐπὶ τοῦ θρόνου βιβλίον γεγραμμένον ἔσωθεν καὶ ὄπισθεν, κατεσφραγισμένον σφραγῖσιν ἑπτά.',
   'Kai eidov epi tēn dexian tou kathēmenou epi tou thronou biblion gegrammenon esōthen kai opisthen, katesphragismenon sphragisin heptā.',
   'John sees a scroll in the right hand of God, symbolizing divine authority and power. The scroll, ''written within and on the backside,'' suggests its comprehensive nature, containing God''s complete plan for history and judgment (Ezek 2:9-10). The ''seven seals'' indicate its absolute secrecy and security, implying that only one with ultimate authority and worthiness can open it. This imagery sets up the central dramatic question of the chapter: who is worthy to reveal and execute God''s purposes?',
   'This verse introduces the scroll as a symbol of God''s sovereign will and redemptive-historical plan. Its sealed nature underscores the divine prerogative in revealing and executing these purposes, emphasizing that human or angelic efforts alone are insufficient to comprehend or enact God''s ultimate design without divine authorization.'),
  (2,
   'And I saw a strong angel proclaiming with a loud voice, Who is worthy to open the book, and to loose the seals thereof?',
   'Καὶ εἶδον ἄγγελον ἰσχυρὸν κηρύσσοντα ἐν φωνῇ μεγάλῃ, Τίς ἄξιος ἀνοῖξαι τὸ βιβλίον καὶ λῦσαι τὰς σφραγῖδας αὐτοῦ;',
   'Kai eidov angelon ischyron kēryssonta en phōnē megalē, Tis axios anoixai to biblion kai lysai tas sphragidas autou?',
   'A ''strong angel'' (likely an archangel) proclaims with a ''loud voice,'' emphasizing the cosmic significance and urgency of the question. The query, ''Who is worthy to open the book, and to loose the seals thereof?'' highlights the immense challenge and the unique qualifications required. This public declaration underscores that the task is beyond ordinary angelic or human capacity, setting the stage for the revelation of Christ''s unparalleled worthiness.',
   NULL),
  (3,
   'And no man in heaven, nor in earth, neither under the earth, was able to open the book, neither to look thereon.',
   'Καὶ οὐδεὶς ἠδύνατο ἐν τῷ οὐρανῷ οὐδὲ ἐπὶ τῆς γῆς οὐδὲ ὑποκάτω τῆς γῆς ἀνοῖξαι τὸ βιβλίον οὐδὲ βλέπειν αὐτό.',
   'Kai oudeis ēdynato en tō ouranō oude epi tēs gēs oude hypokatō tēs gēs anoixai to biblion oude blepein auto.',
   'The comprehensive scope of ''no man in heaven, nor in earth, neither under the earth'' signifies that no created being, whether angelic, human, or departed spirit, possesses the inherent worthiness or authority to access God''s sealed plan. This universal inability creates a moment of profound theological tension and despair, emphasizing the gravity of the situation and the absolute uniqueness of the one who will ultimately be found worthy.',
   NULL),
  (4,
   'And I wept much, because no man was found worthy to open and to read the book, neither to look thereon.',
   'Καὶ ἐγὼ ἔκλαιον πολὺ ὅτι οὐδεὶς ἄξιος εὑρέθη ἀνοῖξαι τὸ βιβλίον οὐδὲ βλέπειν αὐτό.',
   'Kai egō eklaion poly hoti oudeis axios heurethē anoixai to biblion oude blepein auto.',
   'John''s intense weeping (''wept much'') reflects the profound despair and existential crisis caused by the apparent inability to find anyone worthy. This emotional response underscores the critical importance of the scroll''s contents for humanity''s future and God''s redemptive purposes. His tears highlight the desperate need for a mediator and redeemer, making the subsequent revelation of Christ even more impactful.',
   NULL),
  (5,
   'And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.',
   'Καὶ εἷς ἐκ τῶν πρεσβυτέρων λέγει μοι, Μὴ κλαῖε· ἰδοὺ ἐνίκησεν ὁ λέων ὁ ἐκ τῆς φυλῆς Ἰούδα, ἡ ῥίζα Δαυίδ, ἀνοῖξαι τὸ βιβλίον καὶ τὰς ἑπτὰ σφραγῖδας αὐτοῦ.',
   'Kai heis ek tōn presbyterōn legei moi, Mē klaie; idou enikēsen ho leōn ho ek tēs phylēs Iouda, hē rhiza Dauid, anoixai to biblion kai tas heptā sphragidas autou.',
   'An elder comforts John, revealing the ''Lion of the tribe of Juda, the Root of David.'' This title combines two significant Old Testament messianic prophecies: Genesis 49:9-10 (Jacob''s prophecy of Judah''s kingly line) and Isaiah 11:1, 10 (the ''root of Jesse/David''). ''Hath prevailed'' (ἐνίκησεν) signifies Christ''s victory over sin and death through His life, death, and resurrection, making Him uniquely worthy to open the scroll. This verse introduces the triumphant, kingly aspect of Christ.',
   'This verse presents Jesus Christ with two powerful messianic titles, ''Lion of Judah'' and ''Root of David,'' affirming His royal lineage, divine authority, and ultimate victory. It establishes His identity as the promised Messiah, uniquely qualified by His triumph to execute God''s plan for redemption and judgment.'),
  (6,
   'And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of God sent forth into all the earth.',
   'Καὶ εἶδον, καὶ ἰδοὺ ἐν μέσῳ τοῦ θρόνου καὶ τῶν τεσσάρων ζῴων καὶ ἐν μέσῳ τῶν πρεσβυτέρων Ἀρνίον ἑστηκὸς ὡς ἐσφαγμένον, ἔχον κέρατα ἑπτὰ καὶ ὀφθαλμοὺς ἑπτά, ἅ εἰσιν τὰ ἑπτὰ πνεύματα τοῦ Θεοῦ ἀπεσταλμένα εἰς πᾶσαν τὴν γῆν.',
   'Kai eidov, kai idou en mesō tou thronou kai tōn tessarōn zōōn kai en mesō tōn presbyterōn Arnion hestēkos hōs esphagmenon, echon kerata heptā kai ophthalmous heptā, ha eisin ta heptā pneumata tou Theou apestalmena eis pasan tēn gēn.',
   'Instead of a literal lion, John sees a ''Lamb as it had been slain'' (ἀρνίον ἑστηκὸς ὡς ἐσφαγμένον). This profound paradox reveals the true nature of Christ''s victory: achieved not through brute force but through sacrificial death (Isa 53:7, John 1:29). The ''seven horns'' symbolize perfect power and authority, and the ''seven eyes'' represent perfect knowledge and the omnipresent Holy Spirit (''seven Spirits of God''). This imagery combines Christ''s sacrificial atonement with His divine omnipotence and omniscience.',
   'The ''Lamb as it had been slain'' is a central Christological image, emphasizing that Christ''s worthiness stems from His sacrificial death. The ''seven horns'' and ''seven eyes'' symbolize His perfect power, knowledge, and the fullness of the Holy Spirit, affirming His divine attributes and His active role in God''s universal plan.'),
  (7,
   'And he came and took the book out of the right hand of him that sat upon the throne.',
   'Καὶ ἦλθεν καὶ εἴληφεν ἐκ τῆς δεξιᾶς τοῦ καθημένου ἐπὶ τοῦ θρόνου.',
   'Kai ēlthen kai eilēphen ek tēs dexias tou kathēmenou epi tou thronou.',
   'The Lamb''s act of taking the scroll from God''s right hand is a moment of profound theological significance. It signifies the transfer of authority and the divine mandate to execute God''s plan. This action confirms the Lamb''s unique worthiness and His central role in unfolding cosmic history, bridging the gap between God''s sovereign will and its ultimate realization.',
   NULL),
  (8,
   'And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.',
   'Καὶ ὅτε ἔλαβεν τὸ βιβλίον, τὰ τέσσαρα ζῷα καὶ οἱ εἴκοσι τέσσαρες πρεσβύτεροι ἔπεσαν ἐνώπιον τοῦ Ἀρνίου, ἔχοντες ἕκαστος κιθάρας καὶ φιάλας χρυσᾶς γεμούσας θυμιαμάτων, αἵ εἰσιν αἱ προσευχαὶ τῶν ἁγίων.',
   'Kai hote elaben to biblion, ta tessara zōa kai hoi eikosi tessares presbyteroi epesan enōpion tou Arniou, echontes hekastos kitharas kai phialas chrysas gemousas thymiāmatōn, hai eisin hai proseuchai tōn hagiōn.',
   'The immediate response to the Lamb taking the scroll is universal worship. The ''four beasts'' (living creatures) and ''four and twenty elders'' fall down, signifying profound reverence. Their ''harps'' represent praise, and the ''golden vials full of odours'' (incense) are explicitly identified as ''the prayers of saints.'' This highlights the intercessory role of the heavenly beings and the preciousness of believers'' prayers before God (Ps 141:2).',
   'This verse reveals the profound connection between heavenly worship and the prayers of believers on earth. The prayers of the saints are presented as precious incense before God, underscoring their significance in God''s plan and their role in the unfolding of His kingdom.'),
  (9,
   'And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to God by thy blood out of every kindred, and tongue, and people, and nation;',
   'Καὶ ᾄδουσιν ᾠδὴν καινὴν λέγοντες, Ἄξιος εἶ λαβεῖν τὸ βιβλίον καὶ ἀνοῖξαι τὰς σφραγῖδας αὐτοῦ, ὅτι ἐσφάγης καὶ ἠγόρασας τῷ Θεῷ ἐν τῷ αἵματί σου ἐκ πάσης φυλῆς καὶ γλώσσης καὶ λαοῦ καὶ ἔθνους,',
   'Kai adousin ōdēn kainēn legontes, Axios ei labein to biblion kai anoixai tas sphragidas autou, hoti esphagēs kai ēgorasas tō Theō en tō haimati sou ek pasēs phylēs kai glōssēs kai laou kai ethnous,',
   'The ''new song'' (ᾠδὴν καινὴν) is a theme in Scripture for a new act of salvation or revelation (Ps 33:3, 96:1). Its lyrics explicitly state the Lamb''s worthiness (''Thou art worthy'') based on His sacrificial death (''thou wast slain'') and His redemptive work (''hast redeemed us to God by thy blood''). The redemption is universal, encompassing ''every kindred, and tongue, and people, and nation,'' emphasizing the global scope of Christ''s atonement.',
   'This ''new song'' articulates the core of Christian theology: Christ''s worthiness is founded upon His atoning sacrifice. His blood redeems people from every nation, demonstrating the universal scope of salvation and the inclusive nature of God''s kingdom, established through His redemptive work.'),
  (10,
   'And hast made us unto our God kings and priests: and we shall reign on the earth.',
   'καὶ ἐποίησας αὐτοὺς τῷ Θεῷ ἡμῶν βασιλεῖς καὶ ἱερεῖς, καὶ βασιλεύσουσιν ἐπὶ τῆς γῆς.',
   'Kai epoiēsas autous tō Theō hēmōn basileis kai hiereis, kai basileusousin epi tēs gēs.',
   'The redeemed are not merely saved but are elevated to a position of ''kings and priests'' (Exod 19:6, 1 Pet 2:9). This signifies their royal dignity and their priestly access to God, enabling them to serve and intercede. The promise ''we shall reign on the earth'' points to the future eschatological hope of believers participating in Christ''s kingdom rule, a theme central to Revelation.',
   'This verse highlights the exalted status of the redeemed: made ''kings and priests'' unto God. This signifies their spiritual authority, direct access to God, and future co-regency with Christ, underscoring the transformative power of redemption and the ultimate destiny of believers in God''s kingdom.'),
  (11,
   'And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands;',
   'Καὶ εἶδον, καὶ ἤκουσα φωνὴν ἀγγέλων πολλῶν κύκλῳ τοῦ θρόνου καὶ τῶν ζῴων καὶ τῶν πρεσβυτέρων, καὶ ἦν ὁ ἀριθμὸς αὐτῶν μυριάδες μυριάδων καὶ χιλιάδες χιλιάδων,',
   'Kai eidov, kai ēkousa phōnēn angelōn pollōn kyklō tou thronou kai tōn zōōn kai tōn presbyterōn, kai ēn ho arithmos autōn myriades myriadōn kai chiliades chiliadōn,',
   'The scene expands to include an innumerable host of angels, described as ''ten thousand times ten thousand, and thousands of thousands'' (Dan 7:10). This vast multitude surrounding the throne, living creatures, and elders signifies the universal recognition of the Lamb''s worthiness and the immense scope of heavenly worship. Their collective voice amplifies the praise, underscoring the cosmic significance of Christ''s redemptive work.',
   NULL),
  (12,
   'Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.',
   'λέγοντες φωνῇ μεγάλῃ, Ἄξιόν ἐστιν τὸ Ἀρνίον τὸ ἐσφαγμένον λαβεῖν τὴν δύναμιν καὶ πλοῦτον καὶ σοφίαν καὶ ἰσχὺν καὶ τιμὴν καὶ δόξαν καὶ εὐλογίαν.',
   'Legontes phōnē megalē, Axion estin to Arnion to esphagmenon labein tēn dynamin kai plouton kai sophian kai ischyn kai timēn kai doxan kai eulogian.',
   'The angelic chorus proclaims a seven-fold declaration of the Lamb''s worthiness, attributing to Him ''power, and riches, and wisdom, and strength, and honour, and glory, and blessing.'' This comprehensive list encompasses all divine attributes and prerogatives, affirming Christ''s full deity and His rightful inheritance of all authority and praise. It emphasizes that His sacrificial death did not diminish but rather confirmed His divine status.',
   'This seven-fold acclamation of the Lamb''s worthiness attributes to Him all divine perfections and prerogatives. It is a powerful affirmation of Christ''s full deity and His supreme authority, demonstrating that His sacrificial act is the very foundation for His universal reign and reception of all honor and blessing.'),
  (13,
   'And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.',
   'Καὶ πᾶν κτίσμα ὃ ἐν τῷ οὐρανῷ καὶ ἐπὶ τῆς γῆς καὶ ὑποκάτω τῆς γῆς καὶ ἐπὶ τῆς θαλάσσης, καὶ τὰ ἐν αὐτοῖς πάντα, ἤκουσα λέγοντας, Τῷ καθημένῳ ἐπὶ τοῦ θρόνου καὶ τῷ Ἀρνίῳ ἡ εὐλογία καὶ ἡ τιμὴ καὶ ἡ δόξα καὶ τὸ κράτος εἰς τοὺς αἰῶνας τῶν αἰώνων. Ἀμήν.',
   'Kai pan ktisma ho en tō ouranō kai epi tēs gēs kai hypokatō tēs gēs kai epi tēs thalassēs, kai ta en autois panta, ēkousa legontas, Tō kathēmenō epi tou thronou kai tō Arniō hē eulogia kai hē timē kai hē doxa kai to kratos eis tous aiōnas tōn aiōnōn. Amēn.',
   'The worship expands to include ''every creature'' in the entire cosmos – heaven, earth, under the earth, and the sea. This universal chorus attributes ''blessing, and honour, and glory, and power'' equally to ''him that sitteth upon the throne'' (God the Father) and ''unto the Lamb.'' This co-equal worship is a profound statement of Christ''s divine identity and His equality with the Father, a key tenet of Trinitarian theology (Phil 2:10-11).',
   'This climactic verse presents a vision of universal worship directed equally to God the Father and the Lamb. This co-equal adoration is a powerful affirmation of Christ''s full deity, demonstrating His shared sovereignty and glory with the Father, and establishing Him as the eternal object of all creation''s praise.'),
  (14,
   'And the four beasts said, Amen. And the four and twenty elders fell down and worshipped him that liveth for ever and ever.',
   'Καὶ τὰ τέσσαρα ζῷα ἔλεγον, Ἀμήν. Καὶ οἱ εἴκοσι τέσσαρες πρεσβύτεροι ἔπεσαν καὶ προσεκύνησαν τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων.',
   'Kai ta tessara zōa elegon, Amēn. Kai hoi eikosi tessares presbyteroi epesan kai prosekynēsan tō zōnti eis tous aiōnas tōn aiōnōn.',
   'The ''Amen'' from the four living creatures affirms the truth and finality of the universal praise. The elders'' act of falling down and worshipping ''him that liveth for ever and ever'' (referring to God the Father, and by extension, the Lamb) concludes this magnificent scene of adoration. This final act of worship solidifies the authority and eternal reign of God and the Lamb, setting the stage for the unfolding of the sealed scroll''s contents.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λέων', 'leōn', 'G3023', 'Meaning ''lion,'' this term is used metaphorically here to describe Jesus Christ. It evokes strength, majesty, and royalty, connecting Him to the tribal prophecy of Judah (Gen 49:9-10). The ''Lion of the tribe of Judah'' represents Christ''s victorious, kingly authority and His fulfillment of Old Testament messianic expectations, signifying His power to overcome all opposition.', 1),
  ('φυλῆς', 'phylēs', 'G5443', 'Meaning ''tribe'' or ''race,'' this word specifies Jesus'' lineage. The reference to the ''tribe of Judah'' is crucial for establishing His messianic credentials, as the Messiah was prophesied to come from this tribe. It grounds Christ''s divine authority in historical and genealogical fulfillment, emphasizing His identity as the promised King of Israel.', 2),
  ('ῥίζα', 'rhiza', 'G4491', 'Meaning ''root'' or ''source,'' this term, when applied to David, refers to Christ as the ''Root of David.'' This title, drawn from Isaiah 11:1, 10, signifies Christ''s divine origin and His ultimate authority over David''s lineage. He is not merely a descendant but the very source and foundation of David''s royal line, emphasizing His pre-existence and sovereignty.', 3),
  ('ἐνίκησεν', 'enikēsen', 'G3528', 'From ''nikaō,'' meaning ''to conquer,'' ''to overcome,'' or ''to prevail.'' Here, it signifies Christ''s decisive victory over sin, death, and evil through His life, death, and resurrection. This triumph is the basis of His worthiness to open the sealed scroll, demonstrating that His authority is earned through ultimate conquest and sacrifice.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 5 AND v.verse_number = 5;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἀρνίον', 'Arnion', 'G721', 'Meaning ''lamb,'' this diminutive form emphasizes tenderness and innocence. In Revelation, it is the primary title for Jesus Christ, appearing 29 times. It powerfully connects Him to the Passover lamb (Exod 12) and the Suffering Servant of Isaiah 53, highlighting His sacrificial atonement as the foundation of His redemptive work and worthiness.', 1),
  ('ἐσφαγμένον', 'esphagmenon', 'G4969', 'From ''sphazō,'' meaning ''to slaughter'' or ''to slay,'' especially in a sacrificial context. The perfect participle ''as it had been slain'' emphasizes the permanent, completed nature of Christ''s sacrifice. It signifies that His death was a deliberate, atoning act, and its effects are eternally present, making Him uniquely worthy to mediate God''s plan.', 2),
  ('κέρατα', 'kerata', 'G2768', 'Meaning ''horns,'' these symbolize power, strength, and authority in biblical imagery (Ps 75:10, Dan 7:7). The ''seven horns'' on the Lamb represent perfect and complete power, indicating His absolute sovereignty and omnipotence. This contrasts with the vulnerability of a lamb, highlighting the paradox of Christ''s strength through sacrifice.', 3),
  ('ὀφθαλμοὺς', 'ophthalmous', 'G3788', 'Meaning ''eyes,'' these symbolize knowledge, understanding, and divine perception. The ''seven eyes'' on the Lamb, identified as the ''seven Spirits of God,'' represent perfect and complete knowledge, omniscience, and the omnipresent activity of the Holy Spirit. This signifies Christ''s divine insight into all things and His active role in executing God''s will.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 5 AND v.verse_number = 6;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἄξιος', 'Axios', 'G514', 'Meaning ''worthy'' or ''deserving,'' this word is central to the chapter. Here, it is explicitly applied to the Lamb, affirming His unique suitability to open the scroll. His worthiness is not inherent in His deity alone but is earned through His sacrificial death and redemptive work, making Him the only one qualified to mediate God''s plan.', 1),
  ('ἐσφάγης', 'esphagēs', 'G4969', 'From ''sphazō,'' meaning ''to slaughter'' or ''to slay.'' The aorist passive form ''thou wast slain'' directly attributes the sacrificial death to the Lamb. This is the primary reason for His worthiness, emphasizing that His atoning death is the foundation of His authority and the means by which redemption is accomplished for humanity.', 2),
  ('ἠγόρασας', 'ēgorasas', 'G59', 'From ''agorazō,'' meaning ''to buy in the marketplace,'' hence ''to redeem'' or ''to purchase.'' This term highlights the transactional nature of salvation: Christ ''bought'' or ''redeemed'' humanity ''by thy blood.'' It emphasizes the costliness of salvation and the fact that believers are purchased out of bondage to sin, becoming God''s possession through Christ''s sacrifice.', 3),
  ('αἵματί', 'haimati', 'G129', 'Meaning ''blood,'' this refers to the sacrificial blood of Christ. In biblical theology, blood represents life and atonement (Lev 17:11, Heb 9:22). Christ''s blood is the means by which redemption is secured, sins are forgiven, and a new covenant is established. It is the ultimate expression of His love and the foundation of His worthiness.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 5 AND v.verse_number = 9;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δύναμιν', 'dynamin', 'G1411', 'Meaning ''power,'' ''ability,'' or ''might.'' This refers to Christ''s inherent divine power and authority, which He possesses as God. It encompasses His ability to create, sustain, and govern all things, and to execute God''s sovereign plan. The Lamb is worthy to receive all power because He is the source of all power.', 1),
  ('πλοῦτον', 'plouton', 'G4149', 'Meaning ''riches'' or ''wealth.'' This refers to the spiritual and divine abundance that belongs to Christ. It includes not only material wealth but also the fullness of divine attributes, grace, and blessings. The Lamb is worthy to receive all riches because He is the possessor of all spiritual and eternal wealth.', 2),
  ('σοφίαν', 'sophian', 'G4678', 'Meaning ''wisdom.'' This refers to Christ''s perfect and divine understanding, insight, and knowledge. He embodies God''s eternal wisdom, through whom all things were created and ordered. The Lamb is worthy to receive all wisdom because He is the embodiment of divine wisdom itself, guiding all of God''s purposes.', 3),
  ('δόξαν', 'doxan', 'G1391', 'Meaning ''glory,'' ''honor,'' or ''splendor.'' This refers to the inherent majesty, radiance, and renown of God. It is the visible manifestation of His divine attributes. The Lamb is worthy to receive all glory because He shares in the divine essence and majesty of God, fully revealing God''s character.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 5 AND v.verse_number = 12;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κτίσμα', 'ktisma', 'G2938', 'Meaning ''creation'' or ''creature.'' This term emphasizes that every created being, without exception, participates in the universal worship of God and the Lamb. It underscores the cosmic scope of Christ''s redemptive work and His ultimate sovereignty over all that exists, from the highest heavens to the deepest parts of the earth.', 1),
  ('θρόνου', 'thronou', 'G2362', 'Meaning ''throne.'' This refers to the seat of divine authority and sovereignty. The phrase ''him that sitteth upon the throne'' designates God the Father. The co-equal worship directed to both the One on the throne and the Lamb signifies Christ''s shared divine authority and equality with the Father in the Godhead.', 2),
  ('Ἀρνίῳ', 'Arniō', 'G721', 'Meaning ''Lamb.'' This is the dative form, indicating the recipient of the blessing, honor, glory, and power. The fact that the Lamb receives the same worship as God the Father is a profound statement of Christ''s full deity and His co-equality within the Trinity. His sacrificial identity is inextricably linked to His divine status.', 3),
  ('αἰῶνας', 'aiōnas', 'G165', 'Meaning ''ages'' or ''eternity.'' The phrase ''eis tous aiōnas tōn aiōnōn'' (''unto the ages of ages'' or ''for ever and ever'') emphasizes the eternal duration of the worship and the everlasting reign of God and the Lamb. It signifies the timeless and unending nature of their sovereignty and the praise due to them.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 5 AND v.verse_number = 13;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Ezekiel 2:9-10', 1),
  (1, 'Daniel 12:4', 2),
  (1, 'Isaiah 29:11', 3),
  (1, 'Revelation 6:1', 4),
  (2, 'Revelation 10:1', 1),
  (2, 'Isaiah 40:13-14', 2),
  (2, 'Romans 11:34', 3),
  (3, 'Psalm 49:7-9', 1),
  (3, 'John 3:13', 2),
  (3, 'Hebrews 7:23-25', 3),
  (4, 'Psalm 119:136', 1),
  (4, 'Philippians 3:18', 2),
  (4, 'Luke 19:41', 3),
  (5, 'Genesis 49:9-10', 1),
  (5, 'Isaiah 11:1', 2),
  (5, 'Isaiah 11:10', 3),
  (5, 'Romans 15:12', 4),
  (5, 'Revelation 22:16', 5),
  (6, 'Isaiah 53:7', 1),
  (6, 'John 1:29', 2),
  (6, 'Zechariah 3:9', 3),
  (6, 'Zechariah 4:10', 4),
  (6, 'Revelation 1:4', 5),
  (6, 'Revelation 4:5', 6),
  (7, 'Daniel 7:13-14', 1),
  (7, 'Matthew 28:18', 2),
  (7, 'John 17:2', 3),
  (7, 'Hebrews 1:3', 4),
  (8, 'Psalm 141:2', 1),
  (8, 'Revelation 8:3-4', 2),
  (8, 'Hebrews 4:16', 3),
  (9, 'Psalm 33:3', 1),
  (9, 'Psalm 96:1', 2),
  (9, 'Isaiah 53:5', 3),
  (9, '1 Corinthians 6:20', 4),
  (9, 'Ephesians 1:7', 5),
  (9, 'Colossians 1:14', 6),
  (9, 'Revelation 14:3', 7),
  (10, 'Exodus 19:6', 1),
  (10, 'Isaiah 61:6', 2),
  (10, '1 Peter 2:9', 3),
  (10, 'Revelation 1:6', 4),
  (10, 'Revelation 20:6', 5),
  (11, 'Daniel 7:10', 1),
  (11, 'Psalm 68:17', 2),
  (11, 'Hebrews 12:22', 3),
  (12, 'Philippians 2:9-11', 1),
  (12, '1 Chronicles 29:11', 2),
  (12, 'Romans 9:5', 3),
  (12, '1 Timothy 6:16', 4),
  (13, 'Psalm 145:10', 1),
  (13, 'Philippians 2:10-11', 2),
  (13, 'Romans 14:11', 3),
  (13, '1 Timothy 6:16', 4),
  (13, 'Revelation 7:10', 5),
  (14, 'Revelation 4:9-10', 1),
  (14, 'Revelation 19:4', 2),
  (14, 'Psalm 72:19', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 5 Complete!
-- 14 verses · 5 key verses with word studies (20 words)
-- Cross-references for 14 verses (58 refs)
-- ═══════════════════════════════════════════════════════