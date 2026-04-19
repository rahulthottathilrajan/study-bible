-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 2 — The King's Arrival, Persecution, and Divine Protection
-- 23 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Matthew Chapter 2 narrates the early life of Jesus, emphasizing his identity as the Messiah and King of the Jews, and highlighting God''s providential protection. It begins with the arrival of the Magi from the East, seeking the newborn king, which troubles King Herod and all Jerusalem. Herod, fearing a rival, attempts to deceive the Magi and later orders the brutal slaughter of all male infants in Bethlehem. This chapter meticulously connects these events—the birth in Bethlehem, the flight to Egypt, and the settlement in Nazareth—to Old Testament prophecies, demonstrating Jesus'' fulfillment of Israel''s messianic expectations. The narrative underscores the conflict between earthly power (Herod) and divine sovereignty, portraying Jesus as the true King whose life is guided by God''s plan from its very inception.',
  'The King''s Arrival, Persecution, and Divine Protection',
  'βασιλεύς (basileus)',
  'Derived from ''basis'' (foundation) and ''leos'' (people), meaning ''one who rules the people.'' In Matthew 2, ''basileus'' refers to Jesus as the ''King of the Jews,'' a title that provokes fear in Herod but signifies Jesus'' true messianic identity and divine authority, fulfilling Old Testament prophecies of a coming ruler.',
  '["Section 1 (vv.1-8): The Magi Seek the King and Herod''s Deception","Section 2 (vv.9-12): The Magi Worship Jesus and Depart","Section 3 (vv.13-15): The Flight to Egypt and Prophetic Fulfillment","Section 4 (vv.16-18): Herod''s Slaughter of the Innocents and Prophetic Fulfillment","Section 5 (vv.19-23): Return to Israel and Settlement in Nazareth"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Now when Jesus was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem,',
   'Τοῦ δὲ Ἰησοῦ γεννηθέντος ἐν Βηθλέεμ τῆς Ἰουδαίας ἐν ἡμέραις Ἡρῴδου τοῦ βασιλέως, ἰδοὺ μάγοι ἀπὸ ἀνατολῶν παρεγένοντο εἰς Ἱεροσόλυμα',
   'Tou de Iēsou gennēthentos en Bēthleem tēs Ioudaias en hēmerais Hērōdou tou basileōs, idou magoi apo anatōlōn paregenonto eis Hierosolyma',
   'This verse sets the scene for Jesus'' early life, placing his birth in Bethlehem of Judea during the reign of Herod the Great. The arrival of the ''wise men'' (μάγοι, magoi), likely astrologers or priestly advisors from Persia or Babylon, signifies the universal scope of Jesus'' kingship, drawing worshipers from beyond Israel. Their journey from the ''east'' (ἀνατολῶν) highlights the fulfillment of prophecies concerning Gentile recognition of the Messiah (Isa 60:3). The mention of Herod immediately introduces the political tension and danger that will characterize this chapter.',
   NULL),
  (2,
   'Saying, Where is he that is born King of the Jews? for we have seen his star in the east, and are come to worship him.',
   'λέγοντες, Ποῦ ἐστιν ὁ τεχθεὶς βασιλεὺς τῶν Ἰουδαίων; εἴδομεν γὰρ αὐτοῦ τὸν ἀστέρα ἐν τῇ ἀνατολῇ, καὶ ἤλθομεν προσκυνῆσαι αὐτῷ.',
   'legontes, Pou estin ho techtheis basileus tōn Ioudaiōn? eidomen gar autou ton astera en tē anatōlē, kai ēltomen proskynēsai autō.',
   'The Magi''s question, ''Where is he that is born King of the Jews?'', directly challenges Herod''s authority and reveals their understanding of Jesus'' unique status. The ''star in the east'' (τὸν ἀστέρα ἐν τῇ ἀνατολῇ) is a celestial sign, interpreted by the Magi as indicating the birth of a king. This phenomenon has been debated, with theories ranging from a supernova, a comet, or a planetary conjunction, to a miraculous, unique celestial event. Their purpose is to ''worship'' (προσκυνῆσαι) him, indicating a recognition of divine sovereignty, not merely earthly royalty.',
   'The Magi''s quest for the ''King of the Jews'' and their intent to ''worship'' him underscores Jesus'' divine kingship and universal significance. The star, a divine sign, guided Gentiles to the Messiah, foreshadowing the inclusion of all nations in God''s redemptive plan (Rom 15:9-12). This event affirms Jesus'' identity as the long-awaited ruler, worthy of adoration from both Jew and Gentile.'),
  (3,
   'When Herod the king had heard these things, he was troubled, and all Jerusalem with him.',
   'ἀκούσας δὲ ὁ βασιλεὺς Ἡρῴδης ἐταράχθη, καὶ πᾶσα Ἱεροσόλυμα μετ'' αὐτοῦ.',
   'akousas de ho basileus Hērōdēs etarachthē, kai pasa Hierosolyma met'' autou.',
   'Herod''s reaction to the news of a ''King of the Jews'' is immediate and profound: he was ''troubled'' (ἐταράχθη). This fear stems from his paranoia and ruthless ambition, having eliminated many perceived rivals, including members of his own family. The phrase ''all Jerusalem with him'' suggests that the populace, aware of Herod''s cruelty and perhaps fearing his reprisal, also experienced anxiety. This highlights the political danger Jesus'' birth posed to the established order and foreshadows the opposition he would face.',
   'Herod''s ''troubled'' reaction to the news of a new king reveals the inherent conflict between worldly power and divine authority. Earthly rulers often perceive God''s kingdom as a threat to their dominion, leading to resistance and persecution. This foreshadows the ongoing spiritual battle between the kingdom of God and the kingdoms of this world, where the arrival of truth often brings discomfort and opposition to those entrenched in power (John 1:10-11).'),
  (4,
   'And when he had gathered all the chief priests and scribes of the people together, he demanded of them where Christ should be born.',
   'καὶ συναγαγὼν πάντας τοὺς ἀρχιερεῖς καὶ γραμματεῖς τοῦ λαοῦ ἐπυνθάνετο παρ'' αὐτῶν ποῦ ὁ Χριστὸς γεννᾶται.',
   'kai synagagōn pantas tous archiereis kai grammateis tou laou epynthāneto par'' autōn pou ho Christos gennātai.',
   'Herod, in his cunning, consults the religious authorities: the chief priests and scribes. These were the experts in Jewish law and prophecy. His question, ''where Christ should be born,'' uses the title ''Christ'' (Χριστός), the Greek equivalent of ''Messiah,'' indicating his awareness of the Jewish expectation of a deliverer. This consultation demonstrates that the knowledge of the Messiah''s birthplace was readily available within Jewish tradition, yet Herod''s motive was sinister, not worshipful.',
   NULL),
  (5,
   'And they said unto him, In Bethlehem of Judaea: for thus it is written by the prophet,',
   'οἱ δὲ εἶπαν αὐτῷ, Ἐν Βηθλέεμ τῆς Ἰουδαίας· οὕτως γὰρ γέγραπται διὰ τοῦ προφήτου,',
   'hoi de eipan autō, En Bēthleem tēs Ioudaias; houtōs gar gegraptai dia tou prophētou,',
   'The religious leaders correctly identify Bethlehem as the prophesied birthplace of the Messiah. Their immediate and confident answer, ''In Bethlehem of Judaea,'' confirms the widespread knowledge of this prophecy among the Jewish people. This highlights the irony that those who possessed the scriptural knowledge of the Messiah''s coming did not act upon it themselves, while foreign astrologers were actively seeking him. The phrase ''thus it is written by the prophet'' underscores the divine authority behind their answer.',
   NULL),
  (6,
   'And thou Bethlehem, in the land of Juda, art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule my people Israel.',
   'Καὶ σύ, Βηθλέεμ γῆ Ἰούδα, οὐδαμῶς ἐλαχίστη εἶ ἐν τοῖς ἡγεμόσιν Ἰούδα· ἐκ σοῦ γὰρ ἐξελεύσεται ἡγούμενος, ὅστις ποιμανεῖ τὸν λαόν μου τὸν Ἰσραήλ.',
   'Kai sy, Bēthleem gē Iouda, oudamōs elachistē ei en tois hēgemosin Iouda; ek sou gar exeleusetai hēgoumenos, hostis poimanei ton laon mou ton Israēl.',
   'This verse quotes Micah 5:2, with slight variations, emphasizing Bethlehem''s significance. Though ''least'' among the clans of Judah, it is chosen as the birthplace of the ''Governor'' (ἡγούμενος) who will ''rule'' (ποιμανεῖ, literally ''shepherd'') God''s people Israel. Matthew''s adaptation of Micah''s prophecy highlights Jesus'' dual role as both ruler and shepherd, a common messianic theme (Ps 23:1, Ezek 34:23). This fulfillment confirms Jesus'' identity as the promised Messiah, born in the designated place.',
   'The prophecy from Micah 5:2, quoted here, establishes Bethlehem as the divinely appointed birthplace for the Messiah. It highlights God''s choice of the seemingly ''least'' to bring forth the greatest, demonstrating His sovereignty and reversal of human expectations. The Messiah''s role as ''Governor'' and ''Shepherd'' signifies His authority and compassionate care for His people, a foundational aspect of Christology.'),
  (7,
   'Then Herod, when he had privily called the wise men, enquired of them diligently what time the star appeared.',
   'Τότε Ἡρῴδης λάθρᾳ καλέσας τοὺς μάγους ἠκρίβωσεν παρ'' αὐτῶν τὸν χρόνον τοῦ φαινομένου ἀστέρος.',
   'Tote Hērōdēs lathra kalesas tous magous ēkribōsen par'' autōn ton chronon tou phainomenou asteros.',
   'Herod''s ''privily'' (λάθρᾳ) calling of the Magi underscores his deceptive and manipulative nature. He ''diligently enquired'' (ἠκρίβωσεν) about the exact time the star appeared, not out of genuine interest in worship, but to calculate the age of the child he intended to destroy. This detail becomes crucial later in the chapter, informing his cruel decree to kill all male children two years old and under (Matt 2:16). His actions reveal a heart hardened against God''s plan.',
   NULL),
  (8,
   'And he sent them to Bethlehem, and said, Go and search diligently for the young child; and when ye have found him, bring me word again, that I may come and worship him also.',
   'καὶ πέμψας αὐτοὺς εἰς Βηθλέεμ εἶπεν, Πορευθέντες ἀκριβῶς ἐξετάσατε περὶ τοῦ παιδίου· ἐπὰν δὲ εὕρητε, ἀπαγγείλατέ μοι, ὅπως κἀγὼ ἐλθὼν προσκυνήσω αὐτῷ.',
   'kai pempsas autous eis Bēthleem eipen, Poreuthentes akribōs exetasate peri tou paidiou; epan de heurēte, apangeilate moi, hopōs kagō elthōn proskynēsō autō.',
   'Herod sends the Magi to Bethlehem with a feigned request to ''worship'' (προσκυνήσω) the child. This is a blatant lie, as his true intention is to eliminate any potential rival. His command to ''search diligently'' (ἀκριβῶς ἐξετάσατε) for the child further reveals his cunning. This episode highlights the contrast between the sincere worship of the Magi and the hypocritical, murderous intent of Herod, setting the stage for divine intervention to protect the infant Jesus.',
   NULL),
  (9,
   'When they had heard the king, they departed; and, lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was.',
   'οἱ δὲ ἀκούσαντες τοῦ βασιλέως ἐπορεύθησαν· καὶ ἰδοὺ ὁ ἀστὴρ ὃν εἶδον ἐν τῇ ἀνατολῇ προῆγεν αὐτούς, ἕως ἐλθὼν ἐστάθη ἐπάνω οὗ ἦν τὸ παιδίον.',
   'hoi de akousantes tou basileōs eporeuthēsan; kai idou ho astēr hon eidon en tē anatōlē proēgen autous, heōs elthōn estathē epanō hou ēn to paidion.',
   'After their encounter with Herod, the Magi resume their journey, and the star reappears, acting as a direct guide. The star ''went before them'' (προῆγεν αὐτούς) and ''stood over'' (ἐστάθη ἐπάνω) the place where the child was. This miraculous guidance confirms the star''s divine origin and purpose, leading them precisely to Jesus'' location. It signifies God''s active involvement in directing the Magi and protecting His Son, even amidst human deception.',
   'The star''s miraculous reappearance and precise guidance to Jesus'' location demonstrate God''s direct intervention and providential care. It signifies that divine revelation is not merely general but specific, leading seekers directly to Christ. This event underscores God''s sovereignty over creation and His commitment to fulfilling His redemptive plan, ensuring that His Son is found and worshipped.'),
  (10,
   'When they saw the star, they rejoiced with exceeding great joy.',
   'ἰδόντες δὲ τὸν ἀστέρα ἐχάρησαν χαρὰν μεγάλην σφόδρα.',
   'idontes de ton astera echarēsan charan megalēn sphodra.',
   'The Magi''s reaction to seeing the star again is one of ''exceeding great joy'' (χαρὰν μεγάλην σφόδρα). This intense joy highlights their sincere devotion and the relief of knowing their long journey and diligent search were not in vain. It contrasts sharply with Herod''s troubled reaction (Matt 2:3) and underscores the spiritual significance of finding the Messiah. Their joy is a testament to the profound impact of encountering God''s divine guidance and the fulfillment of their quest.',
   NULL),
  (11,
   'And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.',
   'καὶ ἐλθόντες εἰς τὴν οἰκίαν εἶδον τὸ παιδίον μετὰ Μαρίας τῆς μητρὸς αὐτοῦ, καὶ πεσόντες προσεκύνησαν αὐτῷ, καὶ ἀνοίξαντες τοὺς θησαυροὺς αὐτῶν προσήνεγκαν αὐτῷ δῶρα, χρυσὸν καὶ λίβανον καὶ σμύρναν.',
   'kai elthontes eis tēn oikian eidon to paidion meta Marias tēs mētros autou, kai pesontes prosekynēsan autō, kai anoixantes tous thēsaurous autōn prosēnenkan autō dōra, chryson kai libanon kai smyrnan.',
   'Upon finding Jesus, the Magi ''fell down and worshipped him'' (πεσόντες προσεκύνησαν αὐτῷ), a posture of profound reverence typically reserved for deity or royalty. They presented him with symbolic gifts: gold (befitting a king), frankincense (used in priestly worship, symbolizing divinity), and myrrh (an embalming spice, foreshadowing his death and burial). These gifts not only signify Jesus'' royal, divine, and sacrificial nature but also provide practical resources for the Holy Family''s impending flight to Egypt (Matt 2:13).',
   'The Magi''s worship and symbolic gifts—gold, frankincense, and myrrh—profoundly affirm Jesus'' identity. Gold signifies His kingship, frankincense His divinity and priestly role, and myrrh foreshadows His sacrificial death. This act of worship by Gentiles from the East demonstrates the universal scope of Christ''s dominion and the early recognition of His unique person and mission, fulfilling prophecies of nations bringing tribute to the Messiah (Ps 72:10-11; Isa 60:6).'),
  (12,
   'And being warned of God in a dream that they should not return to Herod, they departed into their own country another way.',
   'καὶ χρηματισθέντες κατ'' ὄναρ μὴ ἀνακάμψαι πρὸς Ἡρῴδην, δι'' ἄλλης ὁδοῦ ἀνεχώρησαν εἰς τὴν χώραν αὐτῶν.',
   'kai chrēmatisthentes kat'' onar mē anakampsai pros Hērōdēn, di'' allēs hodou anechōrēsan eis tēn chōran autōn.',
   'God intervenes directly through a dream (κατ'' ὄναρ) to warn the Magi not to return to Herod. This divine warning protects both the Magi from complicity in Herod''s scheme and Jesus from Herod''s murderous intent. Their obedience, departing ''another way'' (δι'' ἄλλης ὁδοῦ), thwarts Herod''s plan and highlights God''s active protection of His Son. This is the first of several divine dream warnings in this chapter, emphasizing God''s sovereign guidance.',
   'God''s warning to the Magi in a dream illustrates His providential care and active involvement in human affairs. This divine communication, a recurring theme in Matthew''s infancy narrative, demonstrates God''s commitment to protecting His Son and thwarting evil intentions. It underscores the principle that God often uses supernatural means to guide and safeguard His purposes, even when human plans are set against them.'),
  (13,
   'And when they were departed, behold, the angel of the Lord appeareth to Joseph in a dream, saying, Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.',
   'Ἀναχωρησάντων δὲ αὐτῶν ἰδοὺ ἄγγελος Κυρίου φαίνεται κατ'' ὄναρ τῷ Ἰωσὴφ λέγων, Ἐγερθεὶς παράλαβε τὸ παιδίον καὶ τὴν μητέρα αὐτοῦ καὶ φεῦγε εἰς Αἴγυπτον, καὶ ἴσθι ἐκεῖ ἕως ἂν εἴπω σοι· μέλλει γὰρ Ἡρῴδης ζητεῖν τὸ παιδίον τοῦ ἀπολέσαι αὐτό.',
   'Anachōrēsantōn de autōn idou angelos Kyriou phainetai kat'' onar tō Iōsēph legōn, Egertheis paralabe to paidion kai tēn mētera autou kai pheuge eis Aigypton, kai isthi ekei heōs an eipō soi; mellei gar Hērōdēs zētein to paidion tou apolesai auto.',
   'Immediately after the Magi''s departure, Joseph receives a divine warning in a dream from an ''angel of the Lord'' (ἄγγελος Κυρίου). He is commanded to flee to Egypt with Jesus and Mary because Herod intends to ''destroy'' (ἀπολέσαι) the child. This flight to Egypt is a crucial moment, demonstrating God''s direct intervention to protect Jesus from Herod''s tyranny. It also sets up a significant prophetic fulfillment in verse 15, connecting Jesus'' life to Israel''s history.',
   'The angelic warning to Joseph and the subsequent flight to Egypt reveal God''s active protection of His Son from evil forces. This divine intervention underscores the vulnerability of the incarnate Christ and the constant threat posed by the ''prince of this world.'' It also highlights Joseph''s obedient faith as a protector of the Holy Family, demonstrating the importance of heeding divine guidance in times of danger.'),
  (14,
   'When he arose, he took the young child and his mother by night, and departed into Egypt:',
   'ὁ δὲ ἐγερθεὶς παρέλαβεν τὸ παιδίον καὶ τὴν μητέρα αὐτοῦ νυκτὸς καὶ ἀνεχώρησεν εἰς Αἴγυπτον,',
   'ho de egertheis parelaben to paidion kai tēn mētera autou nyktos kai anechōrēsen eis Aigypton,',
   'Joseph''s immediate obedience to the angelic command is emphasized: he ''arose'' (ἐγερθεὶς) and departed ''by night'' (νυκτὸς). This swift action highlights his faith and responsibility as Jesus'' earthly guardian. The urgency of the departure underscores the grave danger posed by Herod. The flight to Egypt, a place of refuge for Jews throughout history, symbolizes a temporary exile and foreshadows Jesus'' later return, echoing Israel''s own history.',
   NULL),
  (15,
   'And was there until the death of Herod: that it might be fulfilled which was spoken of the Lord by the prophet, saying, Out of Egypt have I called my son.',
   'καὶ ἦν ἐκεῖ ἕως τῆς τελευτῆς Ἡρῴδου· ἵνα πληρωθῇ τὸ ῥηθὲν ὑπὸ Κυρίου διὰ τοῦ προφήτου λέγοντος, Ἐξ Αἰγύπτου ἐκάλεσα τὸν υἱόν μου.',
   'kai ēn ekei heōs tēs teleutēs Hērōdou; hina plērōthē to rhēthen hypo Kyriou dia tou prophētou legontos, Ex Aigyptou ekalesa ton hyion mou.',
   'The Holy Family remained in Egypt until Herod''s death, fulfilling the prophecy ''Out of Egypt have I called my son'' (Hosea 11:1). Matthew interprets this prophecy typologically: just as God called Israel, His ''son,'' out of Egypt, so He calls Jesus, His ultimate Son, out of Egypt. This connection establishes Jesus as the true Israel, embodying and fulfilling the nation''s history and destiny. It underscores Jesus'' identity as the Son of God and the fulfillment of God''s redemptive plan.',
   'The fulfillment of Hosea 11:1, ''Out of Egypt have I called my son,'' establishes Jesus as the true Israel, the ultimate Son of God. This typological fulfillment shows Jesus recapitulating and perfecting Israel''s history, demonstrating His solidarity with His people while also transcending their failures. It highlights God''s sovereign plan to protect His Son and bring about salvation through Him, connecting the Old Testament narrative directly to Christ''s person and work.'),
  (16,
   'Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.',
   'Τότε Ἡρῴδης ἰδὼν ὅτι ἐνεπαίχθη ὑπὸ τῶν μάγων ἐθυμώθη λίαν, καὶ ἀποστείλας ἀνεῖλεν πάντας τοὺς παῖδας τοὺς ἐν Βηθλέεμ καὶ ἐν πᾶσι τοῖς ὁρίοις αὐτῆς ἀπὸ διετοῦς καὶ κατωτέρω, κατὰ τὸν χρόνον ὃν ἠκρίβωσεν παρὰ τῶν μάγων.',
   'Tote Hērōdēs idōn hoti enepaikhthē hypo tōn magōn ethymōthē lian, kai aposteilas anheilen pantas tous paidas tous en Bēthleem kai en pasi tois horiois autēs apo dietous kai katōterō, kata ton chronon hon ēkribōsen para tōn magōn.',
   'Herod, realizing he had been ''mocked'' (ἐνεπαίχθη) by the Magi, became ''exceeding wroth'' (ἐθυμώθη λίαν). In a fit of paranoid rage, he ordered the ''slaughter of the innocents'' (ἀνεῖλεν πάντας τοὺς παῖδας) in Bethlehem and its vicinity, targeting all male children ''from two years old and under.'' This horrific act, based on the time he had ''diligently enquired'' from the Magi (Matt 2:7), reveals the depths of his depravity and his desperate attempt to eliminate the perceived threat to his throne. This event echoes Pharaoh''s decree against Hebrew male infants (Exod 1:22).',
   'Herod''s ''Slaughter of the Innocents'' is a stark manifestation of evil''s opposition to God''s redemptive plan. It underscores the spiritual warfare surrounding Christ''s birth and the cost of sin. While tragic, this event ultimately fails to thwart God''s purpose, as Jesus is divinely protected. It serves as a somber reminder of human cruelty and the profound suffering that can result from rejecting God''s sovereignty, yet God''s plan prevails.'),
  (17,
   'Then was fulfilled that which was spoken by Jeremy the prophet, saying,',
   'Τότε ἐπληρώθη τὸ ῥηθὲν διὰ Ἰερεμίου τοῦ προφήτου λέγοντος,',
   'Tote eplērōthē to rhēthen dia Ieremiou tou prophētou legontos,',
   'Matthew again highlights the fulfillment of Old Testament prophecy. The phrase ''Then was fulfilled'' (Τότε ἐπληρώθη) introduces a quotation from Jeremiah, connecting the tragic event of the slaughter of the innocents to God''s overarching plan. This demonstrates Matthew''s consistent theological argument that Jesus'' life and the events surrounding it are not random but are divinely orchestrated fulfillments of ancient predictions, revealing God''s faithfulness.',
   NULL),
  (18,
   'In Rama was there a voice heard, lamentation, and weeping, and great mourning, Rachel weeping for her children, and would not be comforted, because they are not.',
   'Φωνὴ ἐν Ῥαμὰ ἠκούσθη, κλαυθμὸς καὶ ὀδυρμὸς πολὺς, Ῥαχὴλ κλαίουσα τὰ τέκνα αὐτῆς, καὶ οὐκ ἤθελεν παρακληθῆναι, ὅτι οὐκ εἰσίν.',
   'Phōnē en Rama ēkousthē, klauthmos kai odyrmos polys, Rachēl klaiousa ta tekna autēs, kai ouk ēthelen paraklēthēnai, hoti ouk eisin.',
   'This verse quotes Jeremiah 31:15, where Rachel, the matriarch buried near Bethlehem (Gen 35:19), weeps for her children, symbolizing the lamentation of Israel for its lost generations, particularly during the Babylonian exile. Matthew applies this prophecy to the slaughter of the Bethlehem infants, portraying it as a profound national tragedy. The ''lamentation, and weeping, and great mourning'' (κλαυθμὸς καὶ ὀδυρμὸς πολὺς) emphasize the immense sorrow and inconsolable grief, yet within Jeremiah''s context, this weeping is followed by a promise of hope and restoration (Jer 31:16-17).',
   'The fulfillment of Jeremiah 31:15 in the ''Slaughter of the Innocents'' underscores the profound suffering inherent in a fallen world, even amidst God''s redemptive work. Rachel''s weeping symbolizes the deep sorrow of humanity, yet within Jeremiah''s original context, this lamentation is followed by a promise of future hope and restoration. This juxtaposition reminds believers that even in the darkest moments, God''s ultimate plan for comfort and salvation remains steadfast.'),
  (19,
   'But when Herod was dead, behold, an angel of the Lord appeareth in a dream to Joseph in Egypt,',
   'Τελευτήσαντος δὲ τοῦ Ἡρῴδου ἰδοὺ ἄγγελος Κυρίου φαίνεται κατ'' ὄναρ τῷ Ἰωσὴφ ἐν Αἰγύπτῳ',
   'Teleutēsantos de tou Hērōdou idou angelos Kyriou phainetai kat'' onar tō Iōsēph en Aigyptō',
   'With the death of Herod the Great, the immediate threat to Jesus'' life is removed. An ''angel of the Lord'' (ἄγγελος Κυρίου) again appears to Joseph in a dream (κατ'' ὄναρ) while they are still in Egypt. This marks the third divine dream warning/guidance Joseph receives in this chapter (Matt 1:20, 2:13, 2:19), emphasizing God''s continuous and direct involvement in guiding the Holy Family and protecting His Son. Herod''s death signifies the end of one phase of danger and the beginning of another.',
   NULL),
  (20,
   'Saying, Arise, and take the young child and his mother, and go into the land of Israel: for they are dead which sought the young child’s life.',
   'λέγων, Ἐγερθεὶς παράλαβε τὸ παιδίον καὶ τὴν μητέρα αὐτοῦ καὶ πορεύου εἰς γῆν Ἰσραήλ· τεθνήκασιν γὰρ οἱ ζητοῦντες τὴν ψυχὴν τοῦ παιδίου.',
   'legōn, Egertheis paralabe to paidion kai tēn mētera autou kai poreuou eis gēn Israēl; tethnēkasin gar hoi zētountes tēn psychēn tou paidiou.',
   'The angel instructs Joseph to return to the ''land of Israel'' (γῆν Ἰσραήλ), explicitly stating that ''they are dead which sought the young child’s life'' (τεθνήκασιν γὰρ οἱ ζητοῦντες τὴν ψυχὴν τοῦ παιδίου). This confirms that Herod was the primary threat and that God''s timing for their return was precise. The phrase ''sought the young child''s life'' echoes Old Testament language for those seeking to kill (Exod 4:19), reinforcing the parallel between Jesus and Moses.',
   'The angel''s declaration that ''they are dead which sought the young child''s life'' underscores God''s ultimate victory over evil. Even when human authorities plot destruction, God''s sovereign hand ensures the protection of His Son and the fulfillment of His redemptive plan. This demonstrates that no earthly power can thwart divine purpose, offering assurance of God''s faithfulness to His promises.'),
  (21,
   'And he arose, and took the young child and his mother, and came into the land of Israel.',
   'ὁ δὲ ἐγερθεὶς παρέλαβεν τὸ παιδίον καὶ τὴν μητέρα αὐτοῦ καὶ εἰσῆλθεν εἰς γῆν Ἰσραήλ.',
   'ho de egertheis parelaben to paidion kai tēn mētera autou kai eisēlthen eis gēn Israēl.',
   'Once again, Joseph''s immediate and obedient response is highlighted. He ''arose'' (ἐγερθεὶς) and took Jesus and Mary, returning to the ''land of Israel.'' This consistent obedience to divine instruction is a key characteristic of Joseph in Matthew''s narrative, portraying him as a righteous man who faithfully carries out God''s will despite the dangers and disruptions to his life. His actions ensure the safety and proper upbringing of Jesus.',
   NULL),
  (22,
   'But when he heard that Archelaus did reign in Judaea in the room of his father Herod, he was afraid to go thither: notwithstanding, being warned of God in a dream, he turned aside into the parts of Galilee:',
   'ἀκούσας δὲ ὅτι Ἀρχέλαος βασιλεύει τῆς Ἰουδαίας ἀντὶ τοῦ πατρὸς αὐτοῦ Ἡρῴδου ἐφοβήθη ἐκεῖ ἀπελθεῖν· χρηματισθεὶς δὲ κατ'' ὄναρ ἀνεχώρησεν εἰς τὰ μέρη τῆς Γαλιλαίας,',
   'akousas de hoti Arkhelaos basileuei tēs Ioudaias anti tou patros autou Hērōdou ephobēthē ekei apelthein; chrēmatistheis de kat'' onar anechōrēsen eis ta merē tēs Galilaias,',
   'Upon returning, Joseph learns that Archelaus, Herod''s son, is reigning in Judea. Archelaus was known for his cruelty, even surpassing his father in some respects, leading Joseph to ''be afraid'' (ἐφοβήθη) to settle there. This fear is validated by historical accounts of Archelaus''s tyrannical rule. Consequently, Joseph receives a fourth divine warning in a dream (χρηματισθεὶς δὲ κατ'' ὄναρ), directing him to the ''parts of Galilee,'' a region outside Archelaus''s direct jurisdiction, ruled by another of Herod''s sons, Herod Antipas, who was less oppressive at this time.',
   'Joseph''s fear of Archelaus and God''s subsequent guidance to Galilee demonstrate the interplay between human prudence and divine direction. While God protects, He also expects human agents to exercise wisdom. This event highlights God''s meticulous care in guiding Jesus'' early life, ensuring His safety and setting the stage for His ministry to begin in Galilee, a region often overlooked but significant in prophetic fulfillment.'),
  (23,
   'And he came and dwelt in a city called Nazareth: that it might be fulfilled which was spoken by the prophets, He shall be called a Nazarene.',
   'καὶ ἐλθὼν κατῴκησεν εἰς πόλιν λεγομένην Ναζαρέτ· ὅπως πληρωθῇ τὸ ῥηθὲν διὰ τῶν προφητῶν ὅτι Ναζωραῖος κληθήσεται.',
   'kai elthōn katōkēsen eis polin legomenēn Nazaret; hopōs plērōthē to rhēthen dia tōn prophētōn hoti Nazōraios klēthēsetai.',
   'Joseph settles the family in Nazareth, a small, obscure town in Galilee. This decision fulfills a prophecy, ''He shall be called a Nazarene'' (Ναζωραῖος κληθήσεται). While no specific Old Testament verse explicitly states this, it is understood as a general prophetic theme. ''Nazarene'' likely carried connotations of being despised or from an insignificant place (John 1:46), aligning with prophecies of the Messiah''s humble origins and rejection (Isa 53:2-3). It could also be a play on ''netzer'' (נֵצֶר), meaning ''branch'' or ''shoot'' (Isa 11:1), a messianic title.',
   'Jesus'' settlement in Nazareth fulfills the prophetic declaration, ''He shall be called a Nazarene.'' This seemingly obscure prophecy underscores Jesus'' humble origins and the contempt He would face, aligning with Old Testament themes of the suffering servant (Isa 53). It highlights God''s choice of the unexpected and the overlooked to accomplish His greatest work, demonstrating that true greatness in God''s kingdom often begins in humility and obscurity.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βασιλεύς', 'basileus', 'G0935', 'Meaning ''king,'' ''ruler,'' or ''sovereign.'' Etymologically, it denotes one who has authority over a people or territory. In this context, it refers to Jesus as the ''King of the Jews,'' a title that carries both political and messianic significance, challenging Herod''s earthly rule and fulfilling prophecies of a divine ruler (Ps 2:6; Zech 9:9).', 1),
  ('ἀστέρα', 'astera', 'G792', 'Meaning ''star.'' In ancient cultures, stars were often associated with significant births or events, particularly those of royalty. The ''star'' seen by the Magi is a divine sign, guiding them to the Messiah. It symbolizes divine revelation and God''s use of creation to announce His redemptive purposes, echoing the ''star out of Jacob'' prophecy (Num 24:17).', 2),
  ('προσκυνῆσαι', 'proskynēsai', 'G4352', 'Meaning ''to worship,'' ''to prostrate oneself,'' or ''to do homage.'' It implies an act of profound reverence, submission, and adoration, often involving bowing down. The Magi''s intent to ''worship'' Jesus signifies their recognition of His divine or royal status, far beyond mere earthly respect, and sets a precedent for all who would come to Christ.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐταράχθη', 'etarachthē', 'G5015', 'From ''tarassō,'' meaning ''to trouble,'' ''to agitate,'' ''to stir up,'' or ''to disturb.'' Herod''s reaction signifies deep inner turmoil, fear, and anxiety, stemming from his paranoia about losing power. This emotional disturbance contrasts sharply with the Magi''s joy and highlights the spiritual conflict between earthly ambition and divine sovereignty.', 1),
  ('Ἱεροσόλυμα', 'Hierosolyma', 'G2414', 'Meaning ''Jerusalem,'' the capital city of Judea and the religious center of Judaism. Its inclusion here, ''all Jerusalem with him,'' suggests that the populace shared Herod''s apprehension, possibly fearing his ruthless reprisals or the political instability a new king might bring. It underscores the city''s entanglement in the political and spiritual drama of Jesus'' arrival.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = 3;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Βηθλέεμ', 'Bēthleem', 'G0965', 'Meaning ''Bethlehem,'' a small town in Judea, known as the city of David. Its name means ''house of bread.'' This location is prophetically significant as the birthplace of the Messiah (Micah 5:2), underscoring God''s faithfulness to His promises and the humble beginnings of the King of Kings.', 1),
  ('ἡγούμενος', 'hēgoumenos', 'G2233', 'Meaning ''leader,'' ''governor,'' or ''ruler.'' It describes one who guides or commands. In this context, it refers to the Messiah as the authoritative ''Governor'' who will lead God''s people. This title emphasizes Jesus'' role as a sovereign and authoritative figure, fulfilling the Old Testament expectation of a powerful leader for Israel.', 2),
  ('ποιμανεῖ', 'poimanei', 'G4165', 'From ''poimainō,'' meaning ''to shepherd,'' ''to tend a flock,'' or ''to rule.'' This verb highlights the dual nature of the Messiah''s leadership: both authoritative rule and compassionate care. It evokes the imagery of a shepherd guiding and protecting his flock, signifying Jesus'' gentle yet firm leadership over His people, Israel (Ps 23:1; Ezek 34:23).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = 6;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('οἰκίαν', 'oikian', 'G3614', 'Meaning ''house,'' ''dwelling,'' or ''home.'' By the time the Magi arrive, Jesus and His family are in a ''house,'' suggesting they may have moved from the stable where He was born (Luke 2:7) or that ''stable'' referred to a part of a house. This detail indicates a slightly later point in time, possibly weeks or months after the birth, but still within the two-year timeframe Herod later targets.', 1),
  ('δῶρα', 'dōra', 'G1435', 'Meaning ''gifts'' or ''presents.'' The gifts presented by the Magi—gold, frankincense, and myrrh—are not merely tokens of respect but carry profound symbolic meaning. They signify Jesus'' royalty (gold), divinity/priesthood (frankincense), and sacrificial death (myrrh), prophetically encapsulating His person and mission (Isa 60:6).', 2),
  ('χρυσὸν', 'chryson', 'G5557', 'Meaning ''gold.'' As a precious metal, gold has long been associated with royalty, wealth, and honor. Its presentation to Jesus signifies His status as King, acknowledging His sovereignty and the majesty of His divine office. It is a fitting tribute to the ''King of the Jews'' sought by the Magi.', 3),
  ('λίβανον', 'libanon', 'G3030', 'Meaning ''frankincense,'' an aromatic gum resin used in ancient worship, particularly in priestly rituals and offerings to God (Exod 30:34). Its gift to Jesus symbolizes His divine nature and His role as the Great High Priest, mediating between God and humanity. It points to His holiness and His worthiness of worship.', 4),
  ('σμύρναν', 'smyrnan', 'G4667', 'Meaning ''myrrh,'' a bitter gum resin used as an anointing oil, perfume, and embalming agent for the dead. Its gift to Jesus is highly symbolic, foreshadowing His suffering, death, and burial. It points to His humanity and His ultimate sacrifice for the sins of the world, a poignant reminder of His redemptive mission (John 19:39).', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = 11;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πληρωθῇ', 'plērōthē', 'G4137', 'From ''plēroō,'' meaning ''to fulfill,'' ''to complete,'' or ''to bring to pass.'' This term is central to Matthew''s theological framework, emphasizing that events in Jesus'' life are not coincidental but are divinely orchestrated fulfillments of Old Testament prophecies. It underscores God''s faithfulness and the continuity between the Old and New Covenants.', 1),
  ('προφήτου', 'prophētou', 'G4396', 'Meaning ''prophet,'' one who speaks forth the word of God, often predicting future events. Here, it refers to Hosea, whose words (Hosea 11:1) are applied to Jesus'' flight to and return from Egypt. Matthew consistently presents Jesus'' life as the culmination of prophetic expectation, validating His messianic claims.', 2),
  ('υἱόν', 'hyion', 'G5207', 'Meaning ''son.'' The phrase ''my son'' from Hosea 11:1 originally referred to Israel. Matthew applies it to Jesus, establishing Him as the ultimate ''Son of God'' and the true Israel, who perfectly embodies and fulfills the nation''s history and covenant relationship with God. This highlights Jesus'' unique divine identity.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = 15;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατῴκησεν', 'katōkēsen', 'G2730', 'From ''katoikeō,'' meaning ''to dwell,'' ''to inhabit,'' or ''to settle.'' This verb indicates a permanent residence. Joseph''s decision to settle in Nazareth, guided by divine warning, establishes Jesus'' home for the majority of His early life. This seemingly ordinary act is presented as a fulfillment of prophecy, demonstrating God''s sovereign hand in every detail of Jesus'' life.', 1),
  ('Ναζαρέτ', 'Nazaret', 'G3478', 'Meaning ''Nazareth,'' a small, obscure town in Galilee. Its insignificance (John 1:46) is key to the prophetic fulfillment. The name ''Nazarene'' (Ναζωραῖος) likely carried connotations of being despised or from a humble background, aligning with prophecies of the Messiah''s lowliness (Isa 53:2-3). It may also connect to ''netzer'' (נֵצֶר), ''branch'' or ''shoot'' (Isa 11:1), a messianic title.', 2),
  ('Ναζωραῖος', 'Nazōraios', 'G3479', 'Meaning ''Nazarene,'' an inhabitant of Nazareth. This term became a designation for Jesus and His followers. While no single Old Testament verse explicitly states ''He shall be called a Nazarene,'' it is understood as a thematic fulfillment, drawing on prophecies that depict the Messiah as humble, despised, or a ''branch'' (Isa 11:1; 53:2-3; Zech 3:8). It emphasizes Jesus'' identification with the common and the overlooked.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Luke 2:4-7', 1),
  (1, 'Micah 5:2', 2),
  (1, 'Isaiah 60:6', 3),
  (2, 'Numbers 24:17', 1),
  (2, 'Isaiah 60:3', 2),
  (2, 'Revelation 22:16', 3),
  (3, 'John 11:48', 1),
  (3, 'Acts 4:27-28', 2),
  (3, 'Psalm 2:1-2', 3),
  (4, '2 Chronicles 36:14', 1),
  (4, 'John 7:42', 2),
  (4, 'Malachi 2:7', 3),
  (5, 'John 7:42', 1),
  (5, 'Micah 5:2', 2),
  (6, 'Micah 5:2', 1),
  (6, '2 Samuel 5:2', 2),
  (6, 'John 7:42', 3),
  (6, 'Psalm 78:71-72', 4),
  (8, 'Proverbs 26:24-26', 1),
  (8, 'Psalm 12:2', 2),
  (8, 'Matthew 2:16', 3),
  (9, 'Numbers 10:33', 1),
  (9, 'Exodus 13:21', 2),
  (9, 'Psalm 43:3', 3),
  (11, 'Psalm 72:10-11', 1),
  (11, 'Isaiah 60:6', 2),
  (11, 'Revelation 21:24', 3),
  (11, 'John 19:39-40', 4),
  (12, 'Matthew 1:20', 1),
  (12, 'Hebrews 1:1', 2),
  (12, 'Daniel 2:28', 3),
  (13, 'Matthew 1:20', 1),
  (13, 'Exodus 4:19', 2),
  (13, 'Hosea 11:1', 3),
  (13, 'Revelation 12:4-6', 4),
  (14, 'Exodus 12:31', 1),
  (14, 'Acts 9:25', 2),
  (14, 'Psalm 121:7-8', 3),
  (15, 'Hosea 11:1', 1),
  (15, 'Exodus 4:22-23', 2),
  (15, 'Matthew 3:17', 3),
  (16, 'Jeremiah 31:15', 1),
  (16, 'Exodus 1:22', 2),
  (16, 'Psalm 2:4', 3),
  (18, 'Jeremiah 31:15', 1),
  (18, 'Genesis 35:19', 2),
  (18, 'Luke 1:68', 3),
  (19, 'Matthew 2:13', 1),
  (19, 'Exodus 4:19', 2),
  (20, 'Exodus 4:19', 1),
  (20, 'Matthew 2:13', 2),
  (22, 'Matthew 2:12', 1),
  (22, 'Luke 3:1', 2),
  (22, 'John 4:3', 3),
  (23, 'John 1:46', 1),
  (23, 'Isaiah 11:1', 2),
  (23, 'Isaiah 53:2-3', 3),
  (23, 'Zechariah 3:8', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 2 Complete!
-- 23 verses · 6 key verses with word studies (19 words)
-- Cross-references for 19 verses (58 refs)
-- ═══════════════════════════════════════════════════════