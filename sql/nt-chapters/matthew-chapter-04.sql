-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 4 — Jesus' Temptation, Inauguration of Ministry, and Call to Discipleship
-- 25 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Matthew 4 marks a pivotal transition in Jesus'' ministry, detailing his temptation in the wilderness, the commencement of his public preaching, and the calling of his first disciples. Following his baptism, Jesus confronts Satan, demonstrating his perfect obedience and reliance on Scripture, thereby reversing Adam''s fall. His subsequent relocation to Capernaum fulfills Isaiah''s prophecy, signaling the dawn of God''s kingdom in Galilee of the Gentiles. The chapter culminates with Jesus proclaiming the kingdom''s imminence and gathering key followers, Simon Peter, Andrew, James, and John, who leave everything to become "fishers of men," illustrating the radical call to discipleship and the expansive reach of his healing and teaching ministry. This chapter establishes foundational themes of Christ''s authority, the nature of temptation, the call to repentance, and the inauguration of the new covenant community.',
  'Jesus'' Temptation, Inauguration of Ministry, and Call to Discipleship',
  'βασιλεία (basileia)',
  'βασιλεία (basileia) refers to "kingdom" or "reign." Etymologically, it denotes the sphere of a king''s rule or the act of ruling itself. Theologically, in Matthew, it signifies the sovereign rule of God, inaugurated by Jesus Christ, which is both a present reality (the "kingdom of heaven is at hand") and a future hope. It encompasses God''s redemptive activity and the community that submits to His divine authority.',
  '["Section 1 (vv.1-11): The Temptation of Jesus in the Wilderness","Section 2 (vv.12-16): Jesus Begins His Galilean Ministry and Fulfills Prophecy","Section 3 (vv.17-22): Jesus Proclaims the Kingdom and Calls First Disciples","Section 4 (vv.23-25): Jesus'' Extensive Ministry of Teaching, Preaching, and Healing"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Then was Jesus led up of the Spirit into the wilderness to be tempted of the devil.',
   'Τότε ὁ Ἰησοῦς ἀνήχθη εἰς τὴν ἔρημον ὑπὸ τοῦ Πνεύματος πειρασθῆναι ὑπὸ τοῦ διαβόλου.',
   'Tote ho Iēsous anēchthē eis tēn erēmon hypo tou Pneumatos peirasthēnai hypo tou diabolou.',
   'This verse immediately follows Jesus'' baptism, where he was affirmed as God''s Son (Matt 3:17). The Spirit, which descended upon him, now "leads" (ἀνήχθη, ''anēchthē'', ''was led up'') him into the wilderness, not to fall, but to confront the devil. This event parallels Israel''s forty years in the wilderness and foreshadows Jesus'' role as the true Israel, obedient where they failed. The purpose is "to be tempted" (πειρασθῆναι, ''peirasthēnai''), highlighting a divine appointment for Christ to overcome evil at the outset of his public ministry.',
   'This passage demonstrates the active role of the Holy Spirit in Jesus'' life and ministry, even in leading him into a situation of intense spiritual conflict. It underscores Christ''s humanity, as he was truly subject to temptation, yet his divine nature ensured his sinless victory over the devil, setting the stage for his redemptive work.'),
  (2,
   'And when he had fasted forty days and forty nights, he was afterward an hungred.',
   'καὶ νηστεύσας ἡμέρας τεσσεράκοντα καὶ νύκτας τεσσεράκοντα ὕστερον ἐπείνασεν.',
   'kai nēsteusas hēmeras tesserakonta kai nyktas tesserakonta hysteron epeinasen.',
   'Jesus'' forty-day fast echoes Moses'' fast on Mount Sinai (Exod 34:28) and Elijah''s journey to Horeb (1 Kgs 19:8), both significant figures in Israel''s history. This period of intense spiritual preparation and physical deprivation left him "hungry" (ἐπείνασεν, ''epeinasen''), making him vulnerable to the devil''s specific temptations related to physical needs, power, and identity. This human weakness is crucial for understanding the reality of his temptation.',
   'Jesus'' forty-day fast and subsequent hunger affirm his full humanity, experiencing physical limitations just as humans do. His endurance through this period, culminating in genuine hunger, underscores the reality of his temptation and the profound nature of his identification with humanity in its weakness, yet without sin.'),
  (3,
   'And when the tempter came to him, he said, If thou be the Son of God, command that these stones be made bread.',
   'καὶ προσελθὼν ὁ πειράζων εἶπεν αὐτῷ, Εἰ υἱὸς εἶ τοῦ Θεοῦ, εἰπὲ ἵνα οἱ λίθοι οὗτοι ἄρτοι γένωνται.',
   'kai proselthōn ho peirazōn eipen autō, Ei huios ei tou Theou, eipe hina hoi lithoi houtoi artoi genōntai.',
   'The "tempter" (ὁ πειράζων, ''ho peirazōn''), a direct reference to Satan, challenges Jesus'' identity as the "Son of God," echoing the divine declaration at his baptism (Matt 3:17). The temptation to turn stones into bread appeals to Jesus'' physical hunger and the desire to use divine power for personal gain, bypassing the path of suffering and obedience. This tests his trust in God''s provision and timing.',
   'Satan''s opening challenge, "If you are the Son of God," directly attacks Jesus'' divine identity and mission. This temptation to use divine power for self-gratification, rather than relying on God''s provision, highlights the core of sin: self-will over divine will. Jesus'' refusal demonstrates perfect obedience and trust in the Father.'),
  (4,
   'But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.',
   'ὁ δὲ ἀποκριθεὶς εἶπεν, Γέγραπται, Οὐκ ἐπ’ ἄρτῳ μόνῳ ζήσεται ὁ ἄνθρωπος, ἀλλ’ ἐπὶ παντὶ ῥήματι ἐκπορευομένῳ διὰ στόματος Θεοῦ.',
   'ho de apokritheis eipen, Gegraptai, Ouk ep'' artō monō zēsetai ho anthrōpos, all'' epi panti rhēmati ekporeuomenō dia stomatos Theou.',
   'Jesus responds with Scripture, quoting Deuteronomy 8:3. This emphasizes the supremacy of God''s word over physical needs and the importance of spiritual sustenance. His reliance on "every word that proceeds out of the mouth of God" demonstrates perfect faith and obedience, contrasting with Israel''s grumbling for food in the wilderness. This sets a pattern for resisting temptation through biblical truth.',
   'Jesus'' immediate recourse to "It is written" establishes the absolute authority of Scripture as the ultimate defense against temptation and deception. His affirmation that "man shall not live by bread alone" underscores the spiritual nature of human existence and the necessity of God''s revealed truth for true life and sustenance.'),
  (5,
   'Then the devil taketh him up into the holy city, and setteth him on a pinnacle of the temple,',
   'Τότε παραλαμβάνει αὐτὸν ὁ διάβολος εἰς τὴν ἁγίαν πόλιν, καὶ ἔστησεν αὐτὸν ἐπὶ τὸ πτερύγιον τοῦ ἱεροῦ,',
   'Tote paralambanei auton ho diabolos eis tēn hagian polin, kai estēsen auton epi to pterygion tou hierou.',
   'The devil takes Jesus to "the holy city," Jerusalem, and places him on the "pinnacle of the temple." This location, likely a high point overlooking the Kidron Valley, would have been a prominent and symbolic place. The shift from physical hunger to a temptation involving public display and spiritual pride indicates Satan''s escalating strategy, aiming to exploit Jesus'' messianic identity in a different way.',
   NULL),
  (6,
   'And saith unto him, If thou be the Son of God, cast thyself down: for it is written, He shall give his angels charge concerning thee: and in their hands they shall bear thee up, lest at any time thou dash thy foot against a stone.',
   'καὶ λέγει αὐτῷ, Εἰ υἱὸς εἶ τοῦ Θεοῦ, βάλε σεαυτὸν κάτω· γέγραπται γάρ, ὅτι Τοῖς ἀγγέλοις αὐτοῦ ἐντελεῖται περὶ σοῦ, καὶ ἐπὶ χειρῶν ἀροῦσίν σε, μήποτε προσκόψῃς πρὸς λίθον τὸν πόδα σου.',
   'kai legei autō, Ei huios ei tou Theou, bale seauton katō; gegraptai gar, hoti Tois angelois autou enteleitai peri sou, kai epi cheirōn arousīn se, mēpote proskopsēs pros lithon ton poda sou.',
   'Satan now quotes Scripture (Psalm 91:11-12), twisting its meaning to tempt Jesus to presumption and a spectacular display of power. The challenge is to force God''s hand, demanding miraculous intervention to prove his Sonship and gain public acclaim, bypassing the humble path of suffering. This highlights the danger of misinterpreting or misapplying God''s word.',
   'This temptation reveals Satan''s cunning use of Scripture, twisting its meaning to promote presumption and test God. Jesus'' refusal demonstrates that true faith does not demand signs or put God to the test, but trusts in His sovereign timing and method. It underscores the importance of interpreting Scripture in context and not using it for self-serving purposes.'),
  (7,
   'Jesus said unto him, It is written again, Thou shalt not tempt the Lord thy God.',
   'ἔφη αὐτῷ ὁ Ἰησοῦς, Πάλιν γέγραπται, Οὐκ ἐκπειράσεις Κύριον τὸν Θεόν σου.',
   'ephē autō ho Iēsous, Palin gegraptai, Ouk ekpeiraseis Kyrion ton Theon sou.',
   'Jesus again responds with Scripture, quoting Deuteronomy 6:16. He corrects Satan''s misuse of Psalm 91 by appealing to a complementary truth: one must not "test the Lord your God." To jump from the temple would be to demand a miracle, forcing God''s hand, rather than trusting in His providential care. This teaches the proper reverence and submission due to God.',
   'Jesus'' counter-quote, "You shall not put the Lord your God to the test," establishes a crucial principle: faith trusts God''s promises without demanding proof or presumptuously placing oneself in danger. It teaches reverence for God''s sovereignty and a rejection of any attempt to manipulate divine power for personal validation or spectacle.'),
  (8,
   'Again, the devil taketh him up into an exceeding high mountain, and sheweth him all the kingdoms of the world, and the glory of them;',
   'Πάλιν παραλαμβάνει αὐτὸν ὁ διάβολος εἰς ὄρος ὑψηλὸν λίαν, καὶ δείκνυσιν αὐτῷ πάσας τὰς βασιλείας τοῦ κόσμου καὶ τὴν δόξαν αὐτῶν,',
   'Palin paralambanei auton ho diabolos eis oros hypsēlon lian, kai deiknysin autō pasas tas basileias tou kosmou kai tēn doxan autōn.',
   'The third temptation takes Jesus to an "exceeding high mountain," from which Satan shows him "all the kingdoms of the world and their glory." This is a vision of worldly power and dominion, appealing to the desire for universal kingship. It represents the ultimate shortcut to messianic rule, bypassing the cross and the path of suffering.',
   NULL),
  (9,
   'And saith unto him, All these things will I give thee, if thou wilt fall down and worship me.',
   'καὶ λέγει αὐτῷ, Ταῦτά σοι πάντα δώσω, ἐὰν πεσὼν προσκυνήσῃς μοι.',
   'kai legei autō, Tauta soi panta dōsō, ean pesōn proskynēsēs moi.',
   'Satan offers Jesus immediate universal dominion, but at the cost of worshiping him. This reveals the devil''s true ambition: to usurp God''s rightful place and receive worship. It''s a direct challenge to Jesus'' ultimate mission to establish God''s kingdom and receive all worship. This temptation exposes the spiritual battle for ultimate allegiance.',
   'This temptation represents the ultimate spiritual battle: who will be worshipped? Satan''s offer of worldly power in exchange for worship reveals his true nature as God''s adversary, seeking to divert allegiance from the Creator. Jesus'' refusal affirms God''s exclusive right to worship and highlights the incompatibility of God''s kingdom with worldly power gained through compromise with evil.'),
  (10,
   'Then saith Jesus unto him, Get thee hence, Satan: for it is written, Thou shalt worship the Lord thy God, and him only shalt thou serve.',
   'Τότε λέγει αὐτῷ ὁ Ἰησοῦς, Ὕπαγε, Σατανᾶ· γέγραπται γάρ, Κύριον τὸν Θεόν σου προσκυνήσεις, καὶ αὐτῷ μόνῳ λατρεύσεις.',
   'Tote legei autō ho Iēsous, Hypage, Satana; gegraptai gar, Kyrion ton Theon sou proskynēseis, kai autō monō latreuseis.',
   'Jesus decisively rebukes Satan, commanding him to "Get thee hence" (Ὕπαγε, Σατανᾶ, ''Hypage, Satana''). He again quotes Scripture, Deuteronomy 6:13, emphasizing exclusive worship and service to God alone. This final victory over temptation establishes Jesus'' authority over evil and his unwavering commitment to the Father''s will, even unto death.',
   'Jesus'' definitive command, "Get thee hence, Satan," coupled with the Scripture "You shall worship the Lord your God, and Him only shall you serve," marks a decisive victory over evil. It establishes the absolute sovereignty of God and the exclusive nature of true worship, rejecting any compromise with the forces of darkness. This victory foreshadows Christ''s ultimate triumph over Satan.'),
  (11,
   'Then the devil leaveth him, and, behold, angels came and ministered unto him.',
   'Τότε ἀφίησιν αὐτὸν ὁ διάβολος, καὶ ἰδοὺ ἄγγελοι προσῆλθον καὶ διηκόνουν αὐτῷ.',
   'Tote aphīēsin auton ho diabolos, kai idou angeloi prosēlthon kai diēkonoun autō.',
   'Following Jesus'' victory, the devil departs, and "angels came and ministered unto him." This angelic service provides physical and spiritual sustenance after his arduous ordeal, confirming God''s approval and care. It echoes the angels ministering to Elijah (1 Kgs 19:5-8) and highlights the divine vindication of Jesus'' obedience.',
   NULL),
  (12,
   'Now when Jesus had heard that John was cast into prison, he departed into Galilee;',
   'Ἀκούσας δὲ ὁ Ἰησοῦς ὅτι Ἰωάννης παρεδόθη, ἀνεχώρησεν εἰς τὴν Γαλιλαίαν.',
   'Akousas de ho Iēsous hoti Iōannēs paredothē, anechōrēsen eis tēn Galilaian.',
   'Jesus'' departure into Galilee is prompted by the news of John the Baptist''s arrest ("παρεδόθη," ''paredothē'', ''was delivered up''). This event marks a turning point, signaling the end of John''s preparatory ministry and the full commencement of Jesus'' public ministry. It also suggests a strategic withdrawal from Judea, where John''s arrest indicated growing opposition.',
   NULL),
  (13,
   'And leaving Nazareth, he came and dwelt in Capernaum, which is upon the sea coast, in the borders of Zabulon and Nephthalim:',
   'καὶ καταλιπὼν τὴν Ναζαρὲτ ἐλθὼν κατῴκησεν εἰς Καφαρναοὺμ τὴν παραθαλασσίαν ἐν ὁρίοις Ζαβουλὼν καὶ Νεφθαλίμ,',
   'kai katalipōn tēn Nazaret elthōn katōkēsen eis Kaphernaoum tēn parathalassian en horiois Zabulōn kai Nephthaleim.',
   'Jesus leaves Nazareth, his hometown, and settles in Capernaum, a bustling fishing town on the Sea of Galilee. This move is significant, placing his ministry in a more public and strategic location, specifically in the regions of Zebulun and Naphtali. This geographical detail is crucial for Matthew''s theological argument in the following verses.',
   NULL),
  (14,
   'That it might be fulfilled which was spoken by Esaias the prophet, saying,',
   'ἵνα πληρωθῇ τὸ ῥηθὲν διὰ Ἠσαΐου τοῦ προφήτου λέγοντος,',
   'hina plērōthē to rhēthen dia Hēsaiou tou prophētou legontos,',
   'Matthew explicitly states that Jesus'' relocation to Capernaum fulfills prophecy. This is a common Matthean motif, emphasizing Jesus'' identity as the Messiah who perfectly embodies the Old Testament prophecies. The phrase "that it might be fulfilled" (ἵνα πληρωθῇ, ''hina plērōthē'') highlights divine intentionality in Jesus'' actions.',
   'This verse underscores Matthew''s consistent theme of Jesus as the fulfillment of Old Testament prophecy. It demonstrates God''s sovereign plan unfolding precisely as foretold, validating Jesus'' messianic claims and emphasizing the continuity between the Old Covenant promises and the New Covenant reality.'),
  (15,
   'The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles;',
   'Γῆ Ζαβουλὼν καὶ γῆ Νεφθαλίμ, ὁδὸν θαλάσσης, πέραν τοῦ Ἰορδάνου, Γαλιλαία τῶν ἐθνῶν,',
   'Gē Zabulōn kai gē Nephthaleim, hodon thalassēs, peran tou Iordanou, Galilaia tōn ethnōn,',
   'This verse quotes Isaiah 9:1 (LXX), identifying the specific regions where Jesus settled. "Galilee of the Gentiles" (Γαλιλαία τῶν ἐθνῶν, ''Galilaia tōn ethnōn'') refers to a region with a mixed Jewish and Gentile population, often considered religiously impure by Judeans. This setting foreshadows the universal scope of Jesus'' mission, extending beyond Israel to the Gentiles (Matt 28:19).',
   NULL),
  (16,
   'The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up.',
   'ὁ λαὸς ὁ καθήμενος ἐν σκοτίᾳ φῶς εἶδεν μέγα, καὶ τοῖς καθημένοις ἐν χώρᾳ καὶ σκιᾷ θανάτου φῶς ἀνέτειλεν αὐτοῖς.',
   'ho laos ho kathēmenos en skotia phōs eiden mega, kai tois kathēmenois en chōra kai skia thanatou phōs aneteilen autois.',
   'Continuing the quote from Isaiah 9:2, this verse describes the spiritual condition of the people in Galilee as "sitting in darkness" and "in the region and shadow of death." Jesus'' arrival is depicted as the dawning of "great light," symbolizing salvation, truth, and hope. This highlights the transformative power of Christ''s presence and message in a spiritually desolate region.',
   'This prophecy''s fulfillment emphasizes Jesus as the "great light" who dispels spiritual darkness and the "shadow of death." It signifies the arrival of salvation and divine revelation to those previously without hope, particularly in a region considered marginalized. This establishes Christ as the source of life and truth for all humanity.'),
  (17,
   'From that time Jesus began to preach, and to say, Repent: for the kingdom of heaven is at hand.',
   'Ἀπὸ τότε ἤρξατο ὁ Ἰησοῦς κηρύσσειν καὶ λέγειν, Μετανοεῖτε· ἤγγικεν γὰρ ἡ βασιλεία τῶν οὐρανῶν.',
   'Apo tote ērxato ho Iēsous kēryssein kai legein, Metanoeite; ēggiken gar hē basileia tōn ouranōn.',
   'This verse marks the official beginning of Jesus'' public preaching ministry. His message, "Repent: for the kingdom of heaven is at hand," echoes John the Baptist''s message (Matt 3:2), but with the crucial difference that the King himself is now present. "Repent" (Μετανοεῖτε, ''Metanoeite'') implies a change of mind and direction, while "kingdom of heaven" (ἡ βασιλεία τῶν οὐρανῶν, ''hē basileia tōn ouranōn'') refers to God''s active rule, now breaking into human history through Jesus.',
   'Jesus'' inaugural message, "Repent, for the kingdom of heaven is at hand," is foundational. It calls for a radical change of heart and mind (metanoia) in response to the imminent arrival of God''s sovereign rule through Christ. This kingdom is not merely future but present, demanding an immediate and transformative response of faith and obedience.'),
  (18,
   'And Jesus, walking by the sea of Galilee, saw two brethren, Simon called Peter, and Andrew his brother, casting a net into the sea: for they were fishers.',
   'Περιπατῶν δὲ παρὰ τὴν θάλασσαν τῆς Γαλιλαίας εἶδεν δύο ἀδελφούς, Σίμωνα τὸν λεγόμενον Πέτρον καὶ Ἀνδρέαν τὸν ἀδελφὸν αὐτοῦ, βάλλοντας ἀμφίβληστρον εἰς τὴν θάλασσαν· ἦσαν γὰρ ἁλιεῖς.',
   'Peripatōn de para tēn thalassan tēs Galilaias eiden duo adelphous, Simōna ton legomenon Petron kai Andrean ton adelphon autou, ballontas amphiblēstron eis tēn thalassan; ēsan gar halieis.',
   'As Jesus walks by the Sea of Galilee, he encounters two brothers, Simon (later called Peter) and Andrew, who are fishermen. This setting highlights Jesus'' ministry among ordinary people in their daily lives. The calling of these first disciples is a direct, personal invitation, initiating the formation of his inner circle and the new community of faith.',
   NULL),
  (19,
   'And he saith unto them, Follow me, and I will make you fishers of men.',
   'καὶ λέγει αὐτοῖς, Δεῦτε ὀπίσω μου, καὶ ποιήσω ὑμᾶς ἁλιεῖς ἀνθρώπων.',
   'kai legei autois, Deute opisō mou, kai poiēsō hymas halieis anthrōpōn.',
   'Jesus issues a direct call: "Follow me" (Δεῦτε ὀπίσω μου, ''Deute opisō mou''). This is an invitation to discipleship, demanding a radical reorientation of life. He promises to make them "fishers of men" (ἁλιεῖς ἀνθρώπων, ''halieis anthrōpōn''), transforming their earthly profession into a spiritual mission of gathering people into God''s kingdom. This metaphor is powerful and easily understood by the fishermen.',
   'Jesus'' call to "Follow me, and I will make you fishers of men" is a foundational statement of discipleship. It signifies a radical reorientation of life, leaving behind former pursuits to embrace a new, kingdom-focused mission. The transformation from fishing for fish to fishing for people illustrates the spiritual purpose of the church: to gather souls for Christ.'),
  (20,
   'And they straightway left their nets, and followed him.',
   'οἱ δὲ εὐθέως ἀφέντες τὰ δίκτυα ἠκολούθησαν αὐτῷ.',
   'hoi de eutheōs aphentes ta diktya ēkolouthēsan autō.',
   'The immediate and decisive response of Simon and Andrew—"straightway left their nets, and followed him"—demonstrates profound faith and obedience. Their willingness to abandon their livelihood and familiar life for an unknown future with Jesus exemplifies the radical commitment required for true discipleship. This immediate response sets a precedent for future calls.',
   NULL),
  (21,
   'And going on from thence, he saw other two brethren, James the son of Zebedee, and John his brother, in a ship with Zebedee their father, mending their nets; and he called them.',
   'Καὶ προβὰς ἐκεῖθεν εἶδεν ἄλλους δύο ἀδελφούς, Ἰάκωβον τὸν τοῦ Ζεβεδαίου καὶ Ἰωάννην τὸν ἀδελφὸν αὐτοῦ, ἐν τῷ πλοίῳ μετὰ Ζεβεδαίου τοῦ πατρὸς αὐτῶν καταρτίζοντας τὰ δίκτυα αὐτῶν, καὶ ἐκάλεσεν αὐτούς.',
   'Kai probas ekeithen eiden allous duo adelphous, Iakōbon ton tou Zebedaiou kai Iōannēn ton adelphon autou, en tō ploiō meta Zebedaiou tou patros autōn katartizontas ta diktya autōn, kai ekalesen autous.',
   'Jesus continues along the coast and calls two more brothers, James and John, sons of Zebedee. They are also engaged in their fishing trade, "mending their nets." This detail suggests diligence and preparation, qualities Jesus would harness for their future ministry. The calling of these four forms the core of his initial discipleship group.',
   NULL),
  (22,
   'And they immediately left the ship and their father, and followed him.',
   'οἱ δὲ εὐθέως ἀφέντες τὸ πλοῖον καὶ τὸν πατέρα αὐτῶν ἠκολούθησαν αὐτῷ.',
   'hoi de eutheōs aphentes to ploion kai ton patera autōn ēkolouthēsan autō.',
   'Like Simon and Andrew, James and John respond "immediately," leaving not only their boat but also their father. This act signifies an even greater sacrifice, severing familial ties and economic security for the sake of following Jesus. Their radical obedience highlights the supreme priority of Christ''s call over all earthly allegiances.',
   'The immediate and radical obedience of James and John, leaving their boat and even their father, exemplifies the cost of discipleship. It underscores the supreme priority of Christ''s call, demanding a willingness to forsake all earthly ties and comforts for the sake of the kingdom. This sets a high standard for commitment.'),
  (23,
   'And Jesus went about all Galilee, teaching in their synagogues, and preaching the gospel of the kingdom, and healing all manner of sickness and all manner of disease among the people.',
   'Καὶ περιῆγεν ἐν ὅλῃ τῇ Γαλιλαίᾳ, διδάσκων ἐν ταῖς συναγωγαῖς αὐτῶν καὶ κηρύσσων τὸ εὐαγγέλιον τῆς βασιλείας καὶ θεραπεύων πᾶσαν νόσον καὶ πᾶσαν μαλακίαν ἐν τῷ λαῷ.',
   'Kai periēgen en holē tē Galilaia, didaskōn en tais synagōgais autōn kai kēryssōn to euangelion tēs basileias kai therapeuōn pasan noson kai pasan malakian en tō laō.',
   'This verse provides a summary of Jesus'' comprehensive ministry throughout Galilee. It highlights three key aspects: "teaching in their synagogues" (instruction), "preaching the gospel of the kingdom" (proclamation), and "healing all manner of sickness and all manner of disease" (demonstration of power). These activities collectively manifest the arrival of God''s kingdom.',
   'This summary verse encapsulates the multifaceted nature of Jesus'' ministry: teaching (discipleship), preaching the gospel of the kingdom (evangelism), and healing (compassion and demonstration of divine power). These three pillars reveal Christ''s holistic approach to human need, addressing spiritual, intellectual, and physical brokenness as manifestations of the kingdom''s arrival.'),
  (24,
   'And his fame went throughout all Syria: and they brought unto him all sick people that were taken with divers diseases and torments, and those which were possessed with devils, and those which were lunatick, and those that had the palsy; and he healed them.',
   'καὶ ἀπῆλθεν ἡ ἀκοὴ αὐτοῦ εἰς ὅλην τὴν Συρίαν· καὶ προσήνεγκαν αὐτῷ πάντας τοὺς κακῶς ἔχοντας ποικίλαις νόσοις καὶ βασάνοις συνεχομένους, δαιμονιζομένους καὶ σεληνιαζομένους καὶ παραλυτικούς, καὶ ἐθεράπευσεν αὐτούς.',
   'kai apēlthen hē akoē autou eis holēn tēn Syrian; kai prosēnenkan autō pantas tous kakōs echontas poikilais nosois kai basanois synechomenous, daimonizomenous kai selēniazomenous kai paralytikous, kai etherapeusen autous.',
   'Jesus'' fame spreads rapidly beyond Galilee, reaching "all Syria." People bring him a wide array of sufferers: those with "divers diseases and torments," "possessed with devils," "lunatick" (epileptic), and "palsy" (paralytics). The comprehensive list emphasizes the extent of human suffering and Jesus'' universal power to heal all conditions, demonstrating his divine authority.',
   'Jesus'' widespread healing ministry, encompassing diverse ailments and demonic possession, powerfully demonstrates his divine authority over sickness, sin, and evil. These miracles are not mere acts of compassion but tangible signs of the kingdom of God breaking into the world, confirming Jesus'' identity as the Messiah and the power of the gospel.'),
  (25,
   'And there followed him great multitudes of people from Galilee, and from Decapolis, and from Jerusalem, and from Judaea, and from beyond Jordan.',
   'καὶ ἠκολούθησαν αὐτῷ ὄχλοι πολλοὶ ἀπὸ τῆς Γαλιλαίας καὶ Δεκαπόλεως καὶ Ἱεροσολύμων καὶ Ἰουδαίας καὶ πέραν τοῦ Ἰορδάνου.',
   'kai ēkolouthēsan autō ochloi polloi apo tēs Galilaias kai Dekapoleōs kai Hierosolymōn kai Ioudaias kai peran tou Iordanou.',
   'The chapter concludes with "great multitudes" following Jesus from various regions: Galilee, Decapolis (a region of ten Hellenistic cities), Jerusalem, Judea, and Transjordan. This geographical scope highlights the immense impact of Jesus'' ministry and the widespread interest he generated, drawing people from diverse backgrounds and locations to witness his teaching and miracles.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνήχθη', 'anēchthē', 'G321', 'From `anagō` (to lead up, bring up). Here, passive, "was led up." Theologically, it implies divine agency; Jesus was not merely wandering but purposefully directed by the Spirit. This highlights God''s sovereign orchestration of events, even in leading Christ into temptation for a greater redemptive purpose.', 1),
  ('Πνεύματος', 'Pneumatos', 'G4151', 'From `pneuma` (spirit, wind, breath). Refers to the Holy Spirit. In this context, the Spirit''s active role in guiding Jesus underscores the Trinitarian nature of God''s work and the Spirit''s empowerment for ministry and confrontation with evil.', 2),
  ('πειρασθῆναι', 'peirasthēnai', 'G3985', 'From `peirazō` (to test, tempt, try). Here, a passive infinitive, "to be tempted/tested." This word carries the nuance of both testing for proof and tempting to sin. Jesus'' temptation was a divine test to prove his obedience and sinlessness, not an enticement to fall into sin.', 3),
  ('διαβόλου', 'diabolou', 'G1228', 'From `diabolos` (slanderer, accuser). Refers to the devil, Satan. Etymologically, it means "to throw across" or "to slander." Theologically, it identifies the primary adversary of God and humanity, whose aim is to deceive, accuse, and lead astray from God''s will.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πειράζων', 'peirazōn', 'G3985', 'Present active participle of `peirazō` (to test, tempt). Here, "the tempter," a specific title for Satan. This emphasizes his active and ongoing role in testing and trying to lead people away from God, particularly Jesus in this pivotal moment.', 1),
  ('υἱὸς', 'huios', 'G5207', 'Son. Theologically, "Son of God" is a messianic and divine title. Satan''s challenge, "If you are the Son of God," directly questions Jesus'' identity and authority, aiming to provoke him to prove it outside of God''s appointed way.', 2),
  ('λίθοι', 'lithoi', 'G3037', 'Stones. The temptation to turn stones into bread appeals to Jesus'' physical hunger and the desire to use divine power for personal gratification, bypassing reliance on God''s provision and timing.', 3),
  ('ἄρτοι', 'artoi', 'G740', 'Loaves of bread. Represents basic sustenance. The temptation here is to satisfy immediate physical needs through supernatural means, rather than trusting God''s timing and method for provision, which would involve suffering.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Γέγραπται', 'Gegraptai', 'G1125', 'Perfect passive indicative of `graphō` (to write). "It is written." This phrase, used repeatedly by Jesus, signifies the absolute authority and binding nature of Scripture. It is a declaration that God''s word is settled and unchangeable, serving as the ultimate defense against temptation.', 1),
  ('ἄρτῳ', 'artō', 'G740', 'Bread. Here, in the dative, "by bread." Jesus'' quote from Deuteronomy 8:3 asserts that physical sustenance is secondary to spiritual nourishment derived from God''s word. It redefines true life as dependent on divine revelation, not merely material provision.', 2),
  ('ῥήματι', 'rhēmati', 'G4487', 'From `rhēma` (word, utterance, saying). Refers to a spoken word or divine utterance. In this context, "every word that proceeds out of the mouth of God" emphasizes the comprehensive and life-giving nature of God''s entire revelation, which sustains humanity spiritually.', 3),
  ('Θεοῦ', 'Theou', 'G2316', 'God. The ultimate source of all life and truth. Jesus'' reliance on the "word of God" underscores the divine origin and authority of Scripture, making it the supreme guide for human conduct and faith.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 4;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ὕπαγε', 'Hypage', 'G5217', 'Imperative of `hypagō` (go away, depart). A forceful command to depart. Jesus'' direct and authoritative expulsion of Satan demonstrates his power over evil and his unwavering commitment to God''s will, refusing any compromise with the adversary.', 1),
  ('Σατανᾶ', 'Satana', 'G4567', 'From Hebrew `satan` (adversary). The personal name of the devil. Jesus'' direct address to "Satan" confirms his identity as the ultimate enemy and highlights the personal nature of the spiritual battle.', 2),
  ('προσκυνήσεις', 'proskynēseis', 'G4352', 'Future indicative of `proskyneō` (to worship, bow down). "You shall worship." This word denotes an act of profound reverence and submission, often involving prostration. Jesus'' quote from Deuteronomy 6:13 asserts that worship is due exclusively to God, rejecting any form of idolatry or allegiance to evil.', 3),
  ('λατρεύσεις', 'latreuseis', 'G3000', 'Future indicative of `latreuō` (to serve, minister, worship). "You shall serve." This term implies devoted service, often in a religious context. Paired with `proskyneō`, it emphasizes that not only worship but also dedicated service and allegiance belong solely to God, rejecting any dual loyalty.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 10;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἤρξατο', 'ērxato', 'G756', 'Aorist middle indicative of `archō` (to begin, rule). "He began." This marks a significant turning point, the official commencement of Jesus'' public ministry after his baptism and temptation. It signals the transition from preparation to active proclamation of the kingdom.', 1),
  ('κηρύσσειν', 'kēryssein', 'G2784', 'Present active infinitive of `kēryssō` (to preach, proclaim as a herald). Jesus'' primary activity was to publicly announce the good news. This term emphasizes authoritative, public proclamation, not merely teaching, but declaring a message of divine significance.', 2),
  ('Μετανοεῖτε', 'Metanoeite', 'G3340', 'Present active imperative of `metanoeō` (to repent, change one''s mind). "Repent!" This is a call for a fundamental change of heart, mind, and direction, turning away from sin and towards God. It is the initial and essential response required for entering the kingdom.', 3),
  ('βασιλεία', 'basileia', 'G932', 'Kingdom, reign, royal power. "Kingdom of heaven" (a Matthean idiom for "kingdom of God"). It refers to God''s sovereign rule, which is both a present reality inaugurated by Jesus and a future consummation. Its "at hand" (ἤγγικεν) signifies its imminent and active presence.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 17;

-- Verse 19
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Δεῦτε', 'Deute', 'G1205', 'Imperative, "Come here! Come!" Often used as an invitation to follow. Jesus'' direct and personal invitation to "Follow me" is a call to discipleship, demanding a radical commitment and reorientation of life around his person and mission.', 1),
  ('ὀπίσω', 'opisō', 'G3694', 'Behind, after. "Follow me" (literally, "come after me"). This implies not just physical proximity but also adherence to Jesus'' teachings, lifestyle, and mission, becoming his apprentice and imitator.', 2),
  ('ποιήσω', 'poiēsō', 'G4160', 'Future active indicative of `poieō` (to make, do, create). "I will make." This highlights Jesus'' transformative power. He doesn''t just invite them to a task but promises to equip and transform them for it, enabling them to fulfill their new calling.', 3),
  ('ἁλιεῖς', 'halieis', 'G231', 'Fishermen. The metaphor "fishers of men" (ἁλιεῖς ἀνθρώπων) transforms their familiar profession into a spiritual mission. Just as they caught fish for sustenance, they would now gather people into the kingdom of God for eternal life, emphasizing the urgency and purpose of evangelism.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 19;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('περιῆγεν', 'periēgen', 'G4013', 'Imperfect active indicative of `periagō` (to go about, travel around). "He went about." This describes Jesus'' itinerant ministry, actively moving throughout Galilee to reach many people. It conveys the dynamic and expansive nature of his early ministry.', 1),
  ('διδάσκων', 'didaskōn', 'G1321', 'Present active participle of `didaskō` (to teach). "Teaching." This refers to systematic instruction, often in synagogues, explaining the meaning of Scripture and the nature of the kingdom. It highlights the intellectual and revelatory aspect of Jesus'' ministry.', 2),
  ('κηρύσσων', 'kēryssōn', 'G2784', 'Present active participle of `kēryssō` (to preach, proclaim). "Preaching." This refers to the public proclamation of the good news (gospel) of the kingdom. It emphasizes the authoritative declaration of God''s message, calling for a response.', 3),
  ('εὐαγγέλιον', 'euangelion', 'G2098', 'Good news, gospel. "The gospel of the kingdom." This refers to the joyous message that God''s saving rule has arrived in Jesus Christ, bringing forgiveness, healing, and new life. It is the central message of Jesus'' ministry.', 4),
  ('θεραπεύων', 'therapeuōn', 'G2323', 'Present active participle of `therapeuō` (to heal, cure, serve). "Healing." This aspect of Jesus'' ministry demonstrates his divine power over sickness and disease, serving as tangible proof of the kingdom''s presence and his authority as Messiah.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Matt 3:16-17', 1),
  (1, 'Mark 1:12-13', 2),
  (1, 'Luke 4:1-2', 3),
  (1, 'Heb 4:15', 4),
  (2, 'Exod 34:28', 1),
  (2, 'Deut 9:9', 2),
  (2, '1 Kgs 19:8', 3),
  (2, 'Luke 4:2', 4),
  (3, 'Gen 3:1', 1),
  (3, 'Luke 4:3-4', 2),
  (3, 'John 6:26-27', 3),
  (3, '1 John 2:16', 4),
  (4, 'Deut 8:3', 1),
  (4, 'Luke 4:4', 2),
  (4, 'John 6:35', 3),
  (4, 'Heb 4:12', 4),
  (5, 'Neh 11:1', 1),
  (5, 'Isa 48:2', 2),
  (5, 'Luke 4:9', 3),
  (6, 'Ps 91:11-12', 1),
  (6, 'Luke 4:9-11', 2),
  (6, 'John 2:18', 3),
  (7, 'Deut 6:16', 1),
  (7, 'Luke 4:12', 2),
  (7, '1 Cor 10:9', 3),
  (8, 'Luke 4:5-7', 1),
  (8, 'Rev 13:2', 2),
  (8, '1 John 5:19', 3),
  (9, 'Deut 6:13', 1),
  (9, 'Luke 4:7', 2),
  (9, 'Rev 19:10', 3),
  (10, 'Deut 6:13', 1),
  (10, 'Deut 10:20', 2),
  (10, 'Luke 4:8', 3),
  (10, 'Jas 4:7', 4),
  (11, 'Mark 1:13', 1),
  (11, 'Luke 4:13', 2),
  (11, 'Heb 1:14', 3),
  (12, 'Matt 14:3-5', 1),
  (12, 'Mark 1:14', 2),
  (12, 'Luke 3:19-20', 3),
  (12, 'John 4:1-3', 4),
  (13, 'Isa 9:1-2', 1),
  (13, 'Luke 4:31', 2),
  (13, 'John 2:12', 3),
  (14, 'Isa 9:1-2', 1),
  (14, 'Matt 1:22', 2),
  (14, 'Matt 2:23', 3),
  (15, 'Isa 9:1', 1),
  (15, '2 Kgs 15:29', 2),
  (16, 'Isa 9:2', 1),
  (16, 'Luke 1:79', 2),
  (16, 'John 1:4-5', 3),
  (16, 'John 8:12', 4),
  (17, 'Matt 3:2', 1),
  (17, 'Mark 1:15', 2),
  (17, 'Luke 10:9', 3),
  (17, 'Acts 2:38', 4),
  (18, 'Mark 1:16-17', 1),
  (18, 'Luke 5:1-2', 2),
  (18, 'John 1:40-42', 3),
  (19, 'Mark 1:17', 1),
  (19, 'Luke 5:10', 2),
  (19, '1 Cor 9:20-22', 3),
  (20, 'Mark 1:18', 1),
  (20, 'Luke 5:11', 2),
  (20, 'Phil 3:7-8', 3),
  (21, 'Mark 1:19-20', 1),
  (21, 'Luke 5:10', 2),
  (21, 'John 21:2', 3),
  (22, 'Mark 1:20', 1),
  (22, 'Luke 5:11', 2),
  (22, 'Matt 10:37', 3),
  (23, 'Matt 9:35', 1),
  (23, 'Mark 1:39', 2),
  (23, 'Luke 4:44', 3),
  (23, 'Acts 10:38', 4),
  (24, 'Mark 1:28', 1),
  (24, 'Mark 1:32-34', 2),
  (24, 'Luke 6:17-19', 3),
  (24, 'Acts 5:16', 4),
  (25, 'Mark 3:7-8', 1),
  (25, 'Luke 6:17', 2),
  (25, 'John 6:2', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 4 Complete!
-- 25 verses · 7 key verses with word studies (29 words)
-- Cross-references for 25 verses (84 refs)
-- ═══════════════════════════════════════════════════════