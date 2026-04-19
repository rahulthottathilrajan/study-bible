-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 1 — The Divine Revelation of the Glorified Christ and His Authority
-- 20 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Revelation Chapter 1 serves as the crucial prologue to the entire book, establishing its divine origin, purpose, and central figure. It opens with a declaration that the ''Revelation of Jesus Christ'' was given by God to show His servants ''things which must shortly come to pass,'' emphasizing the book''s prophetic and urgent nature. The chapter introduces John, the human author, exiled on Patmos for his testimony, and sets the scene for his visionary experience ''on the Lord''s day.'' The climax is John''s awe-inspiring vision of the glorified Christ, depicted with powerful symbolic imagery (white hair, fiery eyes, bronze feet, sharp sword, seven stars, sun-like countenance). This vision not only authenticates the message but also reveals Christ''s sovereignty over the churches, His victory over death, and His role as the Alpha and Omega, the beginning and the end, preparing the reader for the subsequent messages to the seven churches and the unfolding apocalyptic drama.',
  'The Divine Revelation of the Glorified Christ and His Authority',
  'Ἀποκάλυψις (Apokalypsis)',
  'From ἀποκαλύπτω (apokalyptō), meaning ''to uncover'' or ''unveil,'' this term signifies a divine disclosure of hidden truths. In Revelation, it refers to God''s unveiling of future events and the ultimate triumph of Christ, providing insight into His person, work, and ultimate reign, which would otherwise remain unknown to humanity.',
  '["Section 1 (vv.1-3): The Prologue: Origin, Purpose, and Blessing of the Revelation","Section 2 (vv.4-8): Salutation and Doxology: Greetings to the Churches and Christ''s Attributes","Section 3 (vv.9-11): John''s Setting and Commission: Patmos, the Spirit, and the Command to Write","Section 4 (vv.12-16): The Vision of the Son of Man: His Appearance and Symbolic Attributes","Section 5 (vv.17-18): Christ''s Self-Identification: The First and Last, Victor Over Death","Section 6 (vv.19-20): The Mandate to Write and the Interpretation of Symbols"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'The Revelation of Jesus Christ, which God gave unto him, to shew unto his servants things which must shortly come to pass; and he sent and signified it by his angel unto his servant John:',
   'Ἀποκάλυψις Ἰησοῦ Χριστοῦ, ἣν ἔδωκεν αὐτῷ ὁ Θεός, δεῖξαι τοῖς δούλοις αὐτοῦ ἃ δεῖ γενέσθαι ἐν τάχει· καὶ ἐσήμανεν ἀποστείλας διὰ τοῦ ἀγγέλου αὐτοῦ τῷ δούλῳ αὐτοῦ Ἰωάννῃ,',
   'Apokalypsis Iēsou Christou, hēn edōken autō ho Theos, deixai tois doulois autou ha dei genesthai en tachei; kai esēmanen aposteilas dia tou angelou autou tō doulō autou Iōannē,',
   'This opening verse immediately identifies the book''s nature as an ''unveiling'' or ''revelation'' (ἀποκάλυψις). It is not John''s revelation, but ''of Jesus Christ,'' given to Him by God the Father, and then communicated through an angel to John. The phrase ''things which must shortly come to pass'' (ἃ δεῖ γενέσθαι ἐν τάχει) emphasizes the imminence and certainty of the prophetic events, a theme that recurs throughout the book (Rev 22:6). The chain of revelation—God to Christ, Christ to angel, angel to John—underscores its divine authority.',
   'The divine origin of this revelation highlights God''s sovereign plan and His desire to communicate His will to humanity. It establishes Christ as the central figure and mediator of this divine disclosure, emphasizing His unique relationship with the Father and His role in revealing eschatological truths. The communication through an angel signifies the sacred and authoritative nature of the message, ensuring its faithful transmission to God''s servants.'),
  (2,
   'Who bare record of the word of God, and of the testimony of Jesus Christ, and of all things that he saw.',
   'ὃς ἐμαρτύρησεν τὸν λόγον τοῦ Θεοῦ καὶ τὴν μαρτυρίαν Ἰησοῦ Χριστοῦ, ὅσα εἶδεν.',
   'hos emartyrēsen ton logon tou Theou kai tēn martyrian Iēsou Christou, hosa eiden.',
   'John''s role is that of a faithful ''witness'' (ἐμαρτύρησεν) to both ''the word of God'' and ''the testimony of Jesus Christ.'' This dual witness is crucial: John records God''s overarching message and the specific revelation concerning Jesus. The phrase ''all things that he saw'' (ὅσα εἶδεν) confirms that the book is a record of direct visionary experience, not human speculation. This aligns with prophetic tradition where prophets communicate what they have seen and heard from God (e.g., Isa 6:1; Ezek 1:1).',
   NULL),
  (3,
   'Blessed is he that readeth, and they that hear the words of this prophecy, and keep those things which are written therein: for the time is at hand.',
   'μακάριος ὁ ἀναγινώσκων καὶ οἱ ἀκούοντες τοὺς λόγους τῆς προφητείας καὶ τηροῦντες τὰ ἐν αὐτῇ γεγραμμένα· ὁ γὰρ καιρὸς ἐγγύς.',
   'makarios ho anaginōskōn kai hoi akouontes tous logous tēs prophēteias kai tērountes ta en autē gegrammena; ho gar kairos engȳs.',
   'This verse contains the first of seven ''beatitudes'' in Revelation (cf. Rev 14:13; 16:15; 19:9; 20:6; 22:7, 14). The blessing is not merely for reading or hearing, but for ''keeping'' (τηροῦντες) the words of this prophecy. This implies active obedience and application, not just intellectual assent. The urgency is reiterated with ''the time is at hand'' (ὁ γὰρ καιρὸς ἐγγύς), reinforcing the call to heed the message. This beatitude mirrors the blessing on those who hear and obey God''s word in the Gospels (Luke 11:28).',
   'The beatitude underscores the practical and transformative purpose of prophecy. It''s not just for intellectual curiosity but for spiritual formation and obedience. The promise of blessing for those who ''keep'' the words emphasizes that divine revelation demands a response of faith and action, particularly in light of the imminent fulfillment of God''s plans.'),
  (4,
   'John to the seven churches which are in Asia: Grace be unto you, and peace, from him which is, and which was, and which is to come; and from the seven Spirits which are before his throne;',
   'Ἰωάννης ταῖς ἑπτὰ ἐκκλησίαις ταῖς ἐν τῇ Ἀσίᾳ· χάρις ὑμῖν καὶ εἰρήνη ἀπὸ ὁ ὢν καὶ ὁ ἦν καὶ ὁ ἐρχόμενος, καὶ ἀπὸ τῶν ἑπτὰ πνευμάτων ἃ ἐνώπιον τοῦ θρόνου αὐτοῦ,',
   'Iōannēs tais hepta ekklēsiais tais en tē Asia; charis hymin kai eirēnē apo ho ōn kai ho ēn kai ho erchomenos, kai apo tōn hepta pneumatōn ha enōpion tou thronou autou,',
   'John addresses ''the seven churches which are in Asia,'' specifically the Roman province of Asia Minor. Seven is a symbolic number of completeness or perfection in Revelation. The greeting ''grace and peace'' is a standard Pauline salutation (e.g., Rom 1:7; 1 Cor 1:3). The source of this grace and peace is threefold: ''Him which is, and which was, and which is to come'' (a circumlocution for God the Father, emphasizing His eternal, unchanging nature), ''the seven Spirits which are before his throne'' (likely representing the Holy Spirit in His fullness, perhaps alluding to Isa 11:2), and Jesus Christ (v.5).',
   'This salutation reveals the Trinitarian source of grace and peace, emphasizing God''s eternal nature, the Holy Spirit''s active presence before the throne, and Christ''s central role. The ''seven Spirits'' are often understood as a symbolic representation of the Holy Spirit''s perfect and complete operation, particularly in relation to the churches, signifying His manifold gifts and ministries.'),
  (5,
   'And from Jesus Christ, who is the faithful witness, and the first begotten of the dead, and the prince of the kings of the earth. Unto him that loved us, and washed us from our sins in his own blood,',
   'καὶ ἀπὸ Ἰησοῦ Χριστοῦ, ὁ μάρτυς ὁ πιστός, ὁ πρωτότοκος ἐκ τῶν νεκρῶν καὶ ὁ ἄρχων τῶν βασιλέων τῆς γῆς. Τῷ ἀγαπῶντι ἡμᾶς καὶ λύσαντι ἡμᾶς ἐκ τῶν ἁμαρτιῶν ἡμῶν ἐν τῷ αἵματι αὐτοῦ,',
   'kai apo Iēsou Christou, ho martys ho pistos, ho prōtotokos ek tōn nekrōn kai ho archōn tōn basileōn tēs gēs. Tō agapōnti hēmas kai lysanti hēmas ek tōn hamartiōn hēmōn en tō haimati autou,',
   'Jesus Christ is introduced with three majestic titles: ''the faithful witness'' (ὁ μάρτυς ὁ πιστός), emphasizing His truthfulness and reliability; ''the first begotten of the dead'' (ὁ πρωτότοκος ἐκ τῶν νεκρῶν), signifying His resurrection as the first and preeminent of those raised to eternal life (Col 1:18); and ''the prince of the kings of the earth'' (ὁ ἄρχων τῶν βασιλέων τῆς γῆς), asserting His supreme sovereignty. The verse then shifts to a doxology, praising Christ for His sacrificial love in ''washing us from our sins in his own blood,'' a foundational truth of Christian faith (Heb 9:14; 1 Pet 1:18-19).',
   'This verse presents a profound Christology, affirming Jesus''s roles as prophet (faithful witness), priest (sacrificial blood), and king (prince of kings). His resurrection as ''firstborn from the dead'' establishes Him as the pioneer of new creation and the ultimate victor over death. The cleansing ''in his own blood'' is central to atonement, highlighting the efficacy of Christ''s sacrifice for the forgiveness of sins and the redemption of humanity.'),
  (6,
   'And hath made us kings and priests unto God and his Father; to him be glory and dominion for ever and ever. Amen.',
   'καὶ ἐποίησεν ἡμᾶς βασιλείαν, ἱερεῖς τῷ Θεῷ καὶ Πατρὶ αὐτοῦ· αὐτῷ ἡ δόξα καὶ τὸ κράτος εἰς τοὺς αἰῶνας τῶν αἰώνων· ἀμήν.',
   'kai epoiēsen hēmas basileian, hiereis tō Theō kai Patri autou; autō hē doxa kai to kratos eis tous aiōnas tōn aiōnōn; amēn.',
   'Building on the previous verse, Christ''s work not only cleanses us but also elevates believers to a new status: ''kings and priests unto God and his Father.'' This echoes Old Testament promises to Israel (Exod 19:6) and is fulfilled in the New Covenant, where believers participate in Christ''s royal and priestly ministry (1 Pet 2:9). The doxology concludes with an affirmation of Christ''s eternal ''glory and dominion,'' a common expression of worship in early Christian literature (Rom 11:36; Gal 1:5). ''Amen'' seals this declaration of praise.',
   'Through Christ''s redemptive work, believers are transformed into a ''kingdom of priests,'' sharing in His royal and priestly functions. This signifies direct access to God and a calling to spiritual service and co-reign with Christ. It underscores the profound dignity and purpose bestowed upon the redeemed, reflecting God''s ultimate intention for humanity to rule and worship in His presence.'),
  (7,
   'Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.',
   'Ἰδοὺ ἔρχεται μετὰ τῶν νεφελῶν, καὶ ὄψεται αὐτὸν πᾶς ὀφθαλμὸς καὶ οἵτινες αὐτὸν ἐξεκέντησαν, καὶ κόψονται ἐπ’ αὐτὸν πᾶσαι αἱ φυλαὶ τῆς γῆς. ναί, ἀμήν.',
   'Idou erchetai meta tōn nephelōn, kai opsetai auton pas ophthalmos kai hoitines auton exekentēsan, kai kopsontai ep'' auton pasai hai phylai tēs gēs. nai, amēn.',
   'This verse provides a dramatic prophetic announcement of Christ''s second coming, drawing heavily on Old Testament imagery. ''He cometh with clouds'' directly references Daniel 7:13, depicting the Son of Man''s glorious return. ''Every eye shall see him'' emphasizes the universal and undeniable nature of this event. The phrase ''they also which pierced him'' alludes to Zechariah 12:10, signifying the recognition and lament of those who rejected Him, particularly Israel. The ''wailing'' of ''all kindreds of the earth'' indicates a global response of judgment and sorrow. The double affirmation ''Even so, Amen'' (ναί, ἀμήν) expresses certainty and agreement.',
   'This prophecy of Christ''s return establishes a key eschatological truth: His visible, glorious, and universal second coming. It highlights both judgment and vindication, as those who rejected Him will mourn, while His sovereignty will be undeniably displayed. This event serves as the ultimate culmination of God''s redemptive plan and the final establishment of Christ''s kingdom.'),
  (8,
   'I am Alpha and Omega, the beginning and the ending, saith the Lord, which is, and which was, and which is to come, the Almighty.',
   'Ἐγώ εἰμι τὸ Ἄλφα καὶ τὸ Ὦ, λέγει Κύριος ὁ Θεός, ὁ ὢν καὶ ὁ ἦν καὶ ὁ ἐρχόμενος, ὁ παντοκράτωρ.',
   'Egō eimi to Alpha kai to Ō, legei Kyrios ho Theos, ho ōn kai ho ēn kai ho erchomenos, ho pantokratōr.',
   'Here, God the Father explicitly declares His eternal nature and absolute sovereignty. ''I am Alpha and Omega'' (τὸ Ἄλφα καὶ τὸ Ὦ) signifies His absolute beginning and end, encompassing all existence and time. This title is later applied to Christ (Rev 22:13), indicating their shared divine essence. The repeated phrase ''which is, and which was, and which is to come'' further emphasizes His timelessness. The title ''the Almighty'' (ὁ παντοκράτωρ) underscores His omnipotence and supreme authority over all creation, a title used frequently in the Septuagint for Yahweh.',
   'This declaration by God the Father profoundly affirms His eternal, self-existent, and omnipotent nature. As ''Alpha and Omega,'' He is the source and goal of all things, the sovereign orchestrator of history. The title ''Almighty'' emphasizes His absolute power and control, providing assurance that His prophetic word will be fulfilled and His ultimate purposes achieved.'),
  (9,
   'I John, who also am your brother, and companion in tribulation, and in the kingdom and patience of Jesus Christ, was in the isle that is called Patmos, for the word of God, and for the testimony of Jesus Christ.',
   'Ἐγὼ Ἰωάννης, ὁ ἀδελφὸς ὑμῶν καὶ συγκοινωνὸς ἐν τῇ θλίψει καὶ βασιλείᾳ καὶ ὑπομονῇ ἐν Ἰησοῦ, ἐγενόμην ἐν τῇ νήσῳ τῇ καλουμένῃ Πάτμῳ διὰ τὸν λόγον τοῦ Θεοῦ καὶ διὰ τὴν μαρτυρίαν Ἰησοῦ.',
   'Egō Iōannēs, ho adelphos hymōn kai synkoinōnos en tē thlipsei kai basileia kai hypomonē en Iēsou, egenomēn en tē nēsō tē kaloumenē Patmō dia ton logon tou Theou kai dia tēn martyrian Iēsou.',
   'John identifies himself, not as an apostle, but as a ''brother'' and ''companion'' (συγκοινωνὸς) with the churches in their ''tribulation'' (θλίψει), ''kingdom'' (βασιλείᾳ), and ''patience'' (ὑπομονῇ) in Jesus. This shared experience fosters solidarity. He reveals his location: ''the isle that is called Patmos,'' a small, rocky island in the Aegean Sea, likely a place of Roman penal exile. His reason for being there is ''for the word of God, and for the testimony of Jesus,'' indicating persecution for his faith and preaching, a common experience for early Christians (Acts 14:22; 2 Tim 3:12).',
   NULL),
  (10,
   'I was in the Spirit on the Lord’s day, and heard behind me a great voice, as of a trumpet,',
   'ἐγενόμην ἐν πνεύματι ἐν τῇ κυριακῇ ἡμέρᾳ, καὶ ἤκουσα ὀπίσω μου φωνὴν μεγάλην ὡς σάλπιγγος,',
   'egenomēn en pneumati en tē kyriakē hēmera, kai ēkousa opisō mou phōnēn megalēn hōs salpingos,',
   'John states he was ''in the Spirit'' (ἐν πνεύματι), indicating a state of divine inspiration or ecstatic vision, where the Holy Spirit enabled him to receive revelation (cf. Acts 10:10; 2 Cor 12:2). This occurred ''on the Lord’s day'' (ἐν τῇ κυριακῇ ἡμέρᾳ), which by the end of the first century was widely understood as Sunday, the day of Christ''s resurrection, observed by Christians for worship. He then heard ''a great voice, as of a trumpet,'' a sound often associated with divine pronouncements and theophanies in the Old Testament (Exod 19:16, 19; Joel 2:1).',
   'Being ''in the Spirit'' signifies a divinely initiated and guided experience, emphasizing the supernatural source of the revelation. The ''Lord''s Day'' marks the Christian observance of Sunday as a day of worship and remembrance of Christ''s resurrection, highlighting its significance as a time when God often communicates with His people. The trumpet-like voice signals the authoritative and awe-inspiring nature of the divine message.'),
  (11,
   'Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia; unto Ephesus, and unto Smyrna, and unto Pergamos, and unto Thyatira, and unto Sardis, and unto Philadelphia, and unto Laodicea.',
   'λεγούσης· Ὁ ἐγώ εἰμι τὸ Ἄλφα καὶ τὸ Ὦ, ὁ πρῶτος καὶ ὁ ἔσχατος· καί, Ὃ βλέπεις γράψον εἰς βιβλίον καὶ πέμψον ταῖς ἑπτὰ ἐκκλησίαις, εἰς Ἔφεσον καὶ εἰς Σμύρναν καὶ εἰς Πέργαμον καὶ εἰς Θυάτειρα καὶ εἰς Σάρδεις καὶ εἰς Φιλαδέλφειαν καὶ εἰς Λαοδίκειαν.',
   'legousēs: Ho egō eimi to Alpha kai to Ō, ho prōtos kai ho eschatos; kai, Ho blepeis grapson eis biblion kai pempson tais hepta ekklēsiais, eis Epheson kai eis Smyrnan kai eis Pergamon kai eis Thyateira kai eis Sardeis kai eis Philadelpheian kai eis Laodikeian.',
   'The voice identifies itself with divine titles: ''I am Alpha and Omega, the first and the last.'' While ''Alpha and Omega'' was used by the Father in v.8, ''the first and the last'' (ὁ πρῶτος καὶ ὁ ἔσχατος) is a clear Old Testament title for Yahweh (Isa 41:4; 44:6; 48:12), here applied to Christ, affirming His full deity. John is commanded to ''write in a book'' what he sees and ''send it unto the seven churches'' listed, which were actual historical congregations in Asia Minor, forming a circular route for the delivery of the letter. This command underscores the book''s purpose as a message for the church.',
   'Christ''s self-identification as ''the Alpha and Omega, the first and the last'' is a profound declaration of His eternal pre-existence, ultimate sovereignty, and co-equality with God the Father. This assertion of divine attributes by Christ is foundational to Christian theology, establishing His unique position as the beginning and end of all creation and salvation history.'),
  (12,
   'And I turned to see the voice that spake with me. And being turned, I saw seven golden candlesticks;',
   'Καὶ ἐπέστρεψα βλέπειν τὴν φωνὴν ἥτις ἐλάλει μετ’ ἐμοῦ· καὶ ἐπιστρέψας εἶδον ἑπτὰ λυχνίας χρυσᾶς,',
   'Kai epestrepsa blepein tēn phōnēn hētis elalei met'' emou; kai epistrepsas eidon hepta lychnias chrysas,',
   'John ''turned to see the voice,'' a striking anthropomorphism indicating his desire to identify the speaker. Upon turning, he saw ''seven golden candlesticks'' (ἑπτὰ λυχνίας χρυσᾶς). These are not candles, but lampstands, designed to hold oil lamps and provide light. Their golden material signifies their preciousness and sacredness. The number seven again points to completeness and is later explicitly identified as representing the seven churches (v.20). This imagery connects to the menorah in the Tabernacle/Temple, symbolizing God''s presence among His people (Exod 25:31-40).',
   NULL),
  (13,
   'And in the midst of the seven candlesticks one like unto the Son of man, clothed with a garment down to the foot, and girt about the paps with a golden girdle.',
   'καὶ ἐν μέσῳ τῶν ἑπτὰ λυχνιῶν ὅμοιον Υἱὸν ἀνθρώπου, ἐνδεδυμένον ποδήρη καὶ περιεζωσμένον πρὸς τοῖς μαστοῖς ζώνην χρυσᾶν.',
   'kai en mesō tōn hepta lychniōn homoion Hyion anthrōpou, endedymenon podērē kai periezōsmenon pros tois mastois zōnēn chrysān.',
   'In the midst of the lampstands, John sees ''one like unto the Son of man'' (ὅμοιον Υἱὸν ἀνθρώπου). This title, frequently used by Jesus for Himself in the Gospels (e.g., Matt 8:20; 24:27), links this figure to the divine, messianic figure in Daniel 7:13. His attire—''clothed with a garment down to the foot'' (ποδήρη) and ''girt about the paps with a golden girdle'' (ζώνην χρυσᾶν)—suggests a priestly or royal figure, perhaps a high priest (Exod 28:4) or a king, indicating His authority and sacred office. The golden girdle further emphasizes His divine majesty and purity.',
   'The vision of Christ as ''one like the Son of Man'' emphasizes His dual nature: fully human yet fully divine, fulfilling Old Testament prophecy (Daniel 7:13). His priestly attire signifies His ongoing intercessory work as the Great High Priest, while His position ''in the midst'' of the lampstands underscores His active presence, oversight, and care for His churches.'),
  (14,
   'His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;',
   'ἡ δὲ κεφαλὴ αὐτοῦ καὶ αἱ τρίχες λευκαὶ ὡς ἔριον λευκόν, ὡς χιών, καὶ οἱ ὀφθαλμοὶ αὐτοῦ ὡς φλὸξ πυρός,',
   'hē de kephalē autou kai hai triches leukai hōs erion leukon, hōs chiōn, kai hoi ophthalmoi autou hōs phlox pyros,',
   'The description continues with powerful symbolic imagery. His ''head and his hairs were white like wool, as white as snow'' (λευκαὶ ὡς ἔριον λευκόν, ὡς χιών), directly echoing Daniel 7:9, where the ''Ancient of Days'' is described. This signifies ancient wisdom, purity, and eternal majesty. His ''eyes were as a flame of fire'' (ὡς φλὸξ πυρός), symbolizing penetrating insight, divine judgment, and all-consuming holiness, seeing into the deepest secrets of hearts and judging all evil (Rev 2:18, 23).',
   NULL),
  (15,
   'And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters.',
   'καὶ οἱ πόδες αὐτοῦ ὅμοιοι χαλκολιβάνῳ, ὡς ἐν καμίνῳ πεπυρωμένης, καὶ ἡ φωνὴ αὐτοῦ ὡς φωνὴ ὑδάτων πολλῶν.',
   'kai hoi podes autou homoioi chalkolibano, hōs en kaminō pepyrōmenēs, kai hē phōnē autou hōs phōnē hydatōn pollōn.',
   'His ''feet like unto fine brass, as if they burned in a furnace'' (ὅμοιοι χαλκολιβάνῳ, ὡς ἐν καμίνῳ πεπυρωμένης) suggest strength, stability, and the ability to tread down and judge. ''Fine brass'' (χαλκολιβάνῳ, chalkolibano) is a precious, refined metal, possibly referring to a polished bronze or electrum, signifying purity and judgment. This imagery evokes the idea of trampling enemies (Ps 110:1) and executing divine wrath. His ''voice as the sound of many waters'' (ὡς φωνὴ ὑδάτων πολλῶν) conveys immense power, authority, and majesty, like a roaring waterfall or the ocean (Ezek 43:2; Ps 29:3-4).',
   NULL),
  (16,
   'And he had in his right hand seven stars: and out of his mouth went a sharp twoedged sword: and his countenance was as the sun shineth in his strength.',
   'καὶ ἔχων ἐν τῇ δεξιᾷ χειρὶ αὐτοῦ ἀστέρας ἑπτά, καὶ ἐκ τοῦ στόματος αὐτοῦ ῥομφαία δίστομος ὀξεῖα ἐκπορευομένη, καὶ ἡ ὄψις αὐτοῦ ὡς ὁ ἥλιος φαίνει ἐν τῇ δυνάμει αὐτοῦ.',
   'kai echōn en tē dexia cheiri autou asteras hepta, kai ek tou stomatos autou rhomphaia distomos oxeia ekporeuomenē, kai hē opsis autou hōs ho hēlios phainei en tē dynamei autou.',
   'In His ''right hand'' (a symbol of power and authority), He held ''seven stars,'' later identified as the angels/messengers of the seven churches (v.20). Out of His ''mouth went a sharp twoedged sword'' (ῥομφαία δίστομος ὀξεῖα), symbolizing the powerful, penetrating, and judging word of God (Heb 4:12; Eph 6:17). His ''countenance was as the sun shineth in his strength'' (ὡς ὁ ἥλιος φαίνει ἐν τῇ δυνάμει αὐτοῦ), depicting overwhelming glory, majesty, and divine radiance, reminiscent of Christ''s transfiguration (Matt 17:2) and the glory of God (Ps 84:11).',
   'This verse powerfully portrays Christ''s absolute authority and divine attributes. The ''seven stars'' in His hand signify His sovereign control over the churches. The ''two-edged sword'' from His mouth represents the discerning and judgmental power of His word. His face shining ''as the sun'' reveals His divine glory and majesty, underscoring His ultimate authority as judge and redeemer.'),
  (17,
   'And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last:',
   'Καὶ ὅτε εἶδον αὐτόν, ἔπεσα πρὸς τοὺς πόδας αὐτοῦ ὡς νεκρός· καὶ ἔθηκεν τὴν δεξιὰν αὐτοῦ ἐπ’ ἐμέ, λέγων· Μὴ φοβοῦ· ἐγώ εἰμι ὁ πρῶτος καὶ ὁ ἔσχατος,',
   'Kai hote eidon auton, epesa pros tous podas autou hōs nekros; kai ethēken tēn dexian autou ep'' eme, legōn: Mē phobou; egō eimi ho prōtos kai ho eschatos,',
   'John''s reaction to this overwhelming vision is typical of biblical encounters with divine glory: he ''fell at his feet as dead'' (cf. Ezek 1:28; Dan 8:17). This emphasizes the immense holiness and power of the glorified Christ, before whom no mortal can stand. Christ''s response is one of comfort and reassurance: He lays His ''right hand'' on John and says, ''Fear not.'' He then reiterates His divine identity: ''I am the first and the last,'' reinforcing His eternal nature and supreme authority, a title previously used by God the Father (Isa 44:6).',
   'John''s prostration before the glorified Christ illustrates the appropriate human response to divine majesty – awe and humility. Christ''s comforting words, ''Fear not,'' coupled with His self-identification as ''the first and the last,'' reveal His compassionate authority. He is not only the sovereign Lord but also the one who reassures His servants, demonstrating His care and power to sustain them in His presence.'),
  (18,
   'I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death.',
   'καὶ ὁ ζῶν, καὶ ἐγενόμην νεκρὸς καὶ ἰδοὺ ζῶν εἰμι εἰς τοὺς αἰῶνας τῶν αἰώνων, καὶ ἔχω τὰς κλεῖς τοῦ θανάτου καὶ τοῦ ᾅδου.',
   'kai ho zōn, kai egenomēn nekros kai idou zōn eimi eis tous aiōnas tōn aiōnōn, kai echō tas kleis tou thanatou kai tou hadou.',
   'Christ further identifies Himself as ''He that liveth'' (ὁ ζῶν), emphasizing His eternal life. He then declares His experience of death and resurrection: ''and was dead; and, behold, I am alive for evermore, Amen.'' This is the core of the gospel message (Rom 6:9). The ultimate proof of His victory is His possession of ''the keys of hell and of death'' (τὰς κλεῖς τοῦ θανάτου καὶ τοῦ ᾅδου). ''Hell'' (ᾅδου, hadou) refers to Hades, the realm of the dead. Christ''s possession of these keys signifies His absolute authority and power over death and the grave, a promise of hope for believers (1 Cor 15:54-57).',
   'This verse is a powerful declaration of Christ''s triumph over death and Hades. His resurrection is the central event of Christian faith, proving His divine power and securing eternal life for believers. His possession of ''the keys'' signifies His ultimate authority over the forces of death and the grave, assuring believers of their future resurrection and eternal security in Him.'),
  (19,
   'Write the things which thou hast seen, and the things which are, and the things which shall be hereafter;',
   'Γράψον οὖν ἃ εἶδες καὶ ἃ εἰσὶν καὶ ἃ μέλλει γενέσθαι μετὰ ταῦτα.',
   'Grapson oun ha eides kai ha eisin kai ha mellei genesthai meta tauta.',
   'This verse provides a structural outline for the entire book of Revelation, directly from Christ''s command to John. John is to ''write the things which thou hast seen'' (ἃ εἶδες), referring to the vision of the glorified Christ in chapter 1. Then, ''the things which are'' (ἃ εἰσὶν), which refers to the current state of the seven churches (chapters 2-3). Finally, ''the things which shall be hereafter'' (ἃ μέλλει γενέσθαι μετὰ ταῦτα), encompassing the future prophetic events from chapter 4 to the end of the book. This tripartite division helps readers understand the scope and progression of the revelation.',
   NULL),
  (20,
   'The mystery of the seven stars which thou sawest in my right hand, and the seven golden candlesticks. The seven stars are the angels of the seven churches: and the seven candlesticks which thou sawest are the seven churches.',
   'τὸ μυστήριον τῶν ἑπτὰ ἀστέρων ὧν εἶδες ἐπὶ τῆς δεξιᾶς μου καὶ τὰς ἑπτὰ λυχνίας τὰς χρυσᾶς. οἱ ἑπτὰ ἀστέρες ἄγγελοι τῶν ἑπτὰ ἐκκλησιῶν εἰσιν, καὶ αἱ λυχνίαι αἱ ἑπτὰ ἑπτὰ ἐκκλησίαι εἰσίν.',
   'to mystērion tōn hepta asterōn hōn eides epi tēs dexias mou kai tas hepta lychnias tas chrysas. hoi hepta asteres angeloi tōn hepta ekklēsiōn eisin, kai hai lychniai hai hepta hepta ekklēsiai eisin.',
   'Christ concludes the vision by revealing the ''mystery'' (μυστήριον)—a truth previously hidden but now disclosed—of the two main symbols John saw. The ''seven stars'' are explicitly identified as the ''angels of the seven churches.'' These ''angels'' (ἄγγελοι) are most likely the spiritual guardians or, more commonly interpreted, the human messengers/leaders/pastors of each church, responsible for their spiritual well-being. The ''seven golden candlesticks'' are unequivocally identified as ''the seven churches'' themselves. This interpretation clarifies Christ''s direct connection and oversight of His churches, holding their leaders in His hand and walking among them.',
   'This interpretive verse clarifies Christ''s direct and intimate relationship with His churches. The ''seven stars'' (angels/messengers) in His hand signify His sovereign authority over church leadership and His protection of them. The ''seven candlesticks'' (churches) indicate that Christ is present among His people, illuminating the world through them, and holding them accountable for their witness.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἀποκάλυψις', 'Apokalypsis', 'G602', 'From ἀποκαλύπτω (apokalyptō), ''to uncover, unveil.'' It refers to a disclosure of something previously hidden or unknown, especially divine truth. In the New Testament, it denotes a revelation from God, often concerning future events or spiritual realities. Here, it signifies the divine unveiling of Jesus Christ and His eschatological plan.', 1),
  ('ἐσήμανεν', 'esēmanen', 'G4591', 'Aorist active indicative of σημαίνω (sēmainō), meaning ''to signify, indicate, make known by signs.'' It implies communication through symbols or signs, which is characteristic of apocalyptic literature. This verb highlights that the revelation is conveyed not just in words but also through symbolic visions, requiring interpretation.', 2),
  ('τάχει', 'tachei', 'G5034', 'Dative singular of τάχος (tachos), meaning ''speed, swiftness.'' The phrase ἐν τάχει (en tachei) means ''shortly, quickly, speedily.'' It emphasizes the imminence and certainty of the events, not necessarily that they will happen immediately, but that when they begin, they will unfold rapidly and according to God''s appointed time.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μακάριος', 'makarios', 'G3107', 'Meaning ''blessed, happy, fortunate.'' It describes a state of inner contentment and well-being that comes from God, independent of outward circumstances. It is a divine blessing bestowed upon those who align their lives with God''s will, often used in the Beatitudes of Jesus (Matt 5:3-11).', 1),
  ('προφητείας', 'prophēteias', 'G4394', 'From προφήτης (prophētēs), ''prophet.'' It refers to the act of prophesying, a prophetic message, or the gift of prophecy. It involves speaking forth God''s word, whether foretelling future events or forth-telling divine truth for instruction, exhortation, or comfort. Here, it designates the entire book of Revelation as a prophetic message.', 2),
  ('τηροῦντες', 'tērountes', 'G5083', 'Present active participle of τηρέω (tēreō), meaning ''to keep, guard, observe, obey.'' It implies active preservation and adherence to something. In this context, it means not just hearing or reading the words of the prophecy, but actively obeying and living by them, demonstrating a commitment to God''s revealed will.', 3),
  ('καιρὸς', 'kairos', 'G2540', 'Meaning ''a fixed or definite time, the opportune time, a season.'' Unlike χρόνος (chronos) which denotes chronological time, καιρός refers to a specific, significant moment or period in God''s redemptive plan. Here, ''the time is at hand'' (ὁ γὰρ καιρὸς ἐγγύς) signifies that God''s appointed time for these events is drawing near, demanding urgency and readiness.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μάρτυς', 'martys', 'G3144', 'Meaning ''witness.'' It refers to one who testifies to what they have seen, heard, or known. Jesus is the ''faithful witness'' because He perfectly reveals God''s truth and fulfills God''s plan, even to the point of death (martyrdom). His testimony is utterly reliable and true.', 1),
  ('πρωτότοκος', 'prōtotokos', 'G4416', 'From πρῶτος (prōtos), ''first,'' and τίκτω (tiktō), ''to beget.'' Meaning ''firstborn.'' In a theological sense, it denotes preeminence and sovereignty, not necessarily the first in time. As ''firstborn from the dead,'' Christ is the first to be raised to an incorruptible, eternal life, establishing His supremacy over death and His position as head of the new creation (Col 1:18).', 2),
  ('λύσαντι', 'lysanti', 'G3089', 'Aorist active participle of λύω (lyō), meaning ''to loose, release, set free.'' In this context, it refers to Christ''s act of releasing or cleansing believers from the bondage and guilt of their sins. This liberation is achieved through His sacrificial death, specifically ''in his own blood,'' which atones for sin and breaks its power.', 3),
  ('αἵματι', 'haimati', 'G129', 'Dative singular of αἷμα (haima), meaning ''blood.'' In biblical theology, blood often symbolizes life and is central to atonement. Christ''s ''own blood'' refers to His sacrificial death on the cross, which is the means by which sins are forgiven and believers are cleansed and reconciled to God (Heb 9:22; 1 Pet 1:18-19).', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἄλφα', 'Alpha', 'G1', 'The first letter of the Greek alphabet. Symbolically, it represents the beginning or origin. When paired with Omega, it signifies absolute totality, encompassing all things from start to finish. This title asserts God''s eternal nature as the uncreated source of all existence.', 1),
  ('Ὦ', 'Ō', 'G5598', 'The last letter of the Greek alphabet (Omega). Symbolically, it represents the end or culmination. As ''Alpha and Omega,'' God declares Himself to be the ultimate end and goal of all creation and history, the one who brings all things to their appointed conclusion.', 2),
  ('παντοκράτωρ', 'pantokratōr', 'G3841', 'From πᾶς (pas), ''all,'' and κράτος (kratos), ''might, power.'' Meaning ''Almighty, all-ruling, sovereign.'' This title emphasizes God''s absolute power and authority over all creation, His omnipotence. It is a common Septuagint translation for ''Lord of Hosts'' and is used exclusively for God in Revelation, affirming His supreme control over all events.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Υἱὸν', 'Hyion', 'G5207', 'Accusative singular of υἱός (huios), ''son.'' In the phrase ''Son of Man,'' it refers to a specific messianic title used by Jesus for Himself, emphasizing His humanity while also alluding to the divine, authoritative figure in Daniel 7:13-14. It highlights His role as the divinely appointed ruler and judge.', 1),
  ('ἀνθρώπου', 'anthrōpou', 'G444', 'Genitive singular of ἄνθρωπος (anthrōpos), ''man, human being.'' When combined with ''Son of,'' it forms the title ''Son of Man,'' which in a Jewish context carried significant messianic and eschatological weight, denoting a figure with both human characteristics and divine authority, particularly in judgment.', 2),
  ('ποδήρη', 'podērē', 'G4158', 'Meaning ''reaching to the feet, a long robe.'' This garment was typically worn by high-ranking officials, priests, or kings. In the context of the vision, it signifies Christ''s priestly and royal dignity, reminiscent of the high priest''s vestments (Exod 28:4), emphasizing His sacred office and authority.', 3),
  ('ζώνην', 'zōnēn', 'G2223', 'Accusative singular of ζώνη (zōnē), ''a belt, girdle.'' A girdle worn ''about the paps'' (breast area) was characteristic of a high priest or a person of authority, signifying readiness for service or a position of honor. The ''golden'' material further emphasizes the divine majesty and purity of the figure.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = 13;

-- Verse 18
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ζῶν', 'zōn', 'G2198', 'Present active participle of ζάω (zaō), ''to live, be alive.'' Here, ''He that liveth'' (ὁ ζῶν) is a title for God, emphasizing His eternal, self-existent life. Applied to Christ, it underscores His divine nature and His triumph over death, affirming that He is eternally alive and the source of life.', 1),
  ('νεκρὸς', 'nekros', 'G3498', 'Meaning ''dead, deceased.'' This word explicitly states Christ''s physical death, a historical reality and a central tenet of the gospel. His experience of death makes His subsequent declaration of being ''alive for evermore'' all the more powerful, proving His victory over death itself.', 2),
  ('κλεῖς', 'kleis', 'G2807', 'Meaning ''a key.'' Symbolically, keys represent authority, power, and control over something (Isa 22:22; Matt 16:19). Christ''s possession of ''the keys of death and of Hades'' signifies His absolute sovereignty and power over the realm of the dead and the process of dying, meaning He determines who enters and exits.', 3),
  ('ᾅδου', 'hadou', 'G86', 'Genitive singular of ᾅδης (hadēs), ''Hades.'' In the New Testament, Hades refers to the realm of the dead, the unseen world, rather than the eternal hell (Gehenna). Christ''s authority over Hades means He has conquered the power of the grave and holds ultimate control over the destiny of souls after death.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = 18;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Daniel 2:28', 1),
  (1, 'John 3:32', 2),
  (1, 'Revelation 22:6', 3),
  (2, 'John 1:14', 1),
  (2, '1 John 1:1-3', 2),
  (2, 'Revelation 22:8', 3),
  (3, 'Luke 11:28', 1),
  (3, 'Revelation 22:7', 2),
  (3, 'James 1:22-25', 3),
  (4, 'Exodus 3:14', 1),
  (4, 'Isaiah 11:2', 2),
  (4, 'Zechariah 4:10', 3),
  (5, 'Psalm 89:27', 1),
  (5, 'Colossians 1:18', 2),
  (5, 'Hebrews 9:14', 3),
  (5, '1 Peter 1:18-19', 4),
  (6, 'Exodus 19:6', 1),
  (6, '1 Peter 2:9', 2),
  (6, 'Revelation 5:10', 3),
  (7, 'Daniel 7:13', 1),
  (7, 'Matthew 24:30', 2),
  (7, 'Zechariah 12:10', 3),
  (7, 'Acts 1:11', 4),
  (8, 'Isaiah 44:6', 1),
  (8, 'Revelation 21:6', 2),
  (8, 'Genesis 17:1', 3),
  (9, 'Philippians 1:7', 1),
  (9, '2 Timothy 1:8', 2),
  (9, 'Acts 14:22', 3),
  (10, 'Acts 2:4', 1),
  (10, '1 Corinthians 14:2', 2),
  (10, 'Exodus 19:16', 3),
  (10, '1 Corinthians 16:2', 4),
  (11, 'Isaiah 41:4', 1),
  (11, 'Revelation 2:1', 2),
  (11, 'Revelation 3:14', 3),
  (12, 'Exodus 25:37', 1),
  (12, 'Zechariah 4:2', 2),
  (13, 'Daniel 7:13', 1),
  (13, 'Daniel 10:5', 2),
  (13, 'Exodus 28:4', 3),
  (14, 'Daniel 7:9', 1),
  (14, 'Revelation 2:18', 2),
  (14, 'Hebrews 4:13', 3),
  (15, 'Ezekiel 1:7', 1),
  (15, 'Daniel 10:6', 2),
  (15, 'Ezekiel 43:2', 3),
  (16, 'Ephesians 6:17', 1),
  (16, 'Hebrews 4:12', 2),
  (16, 'Matthew 17:2', 3),
  (17, 'Daniel 8:17-18', 1),
  (17, 'Isaiah 41:4', 2),
  (17, 'Revelation 2:8', 3),
  (18, 'Romans 6:9', 1),
  (18, 'John 11:25', 2),
  (18, 'Psalm 68:20', 3),
  (18, 'Matthew 16:19', 4),
  (19, 'Revelation 4:1', 1),
  (19, 'Revelation 2:1', 2),
  (19, 'Revelation 22:6', 3),
  (20, 'Revelation 2:1', 1),
  (20, 'Revelation 3:1', 2),
  (20, 'Matthew 5:14-16', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 1 Complete!
-- 20 verses · 6 key verses with word studies (22 words)
-- Cross-references for 20 verses (63 refs)
-- ═══════════════════════════════════════════════════════