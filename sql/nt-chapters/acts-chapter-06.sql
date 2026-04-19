-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 6 — The Church's Growth Through Service and Persecution
-- 15 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Acts 6 marks a pivotal moment in the early church''s development, addressing both internal conflict and external opposition. It begins with a practical administrative challenge: Hellenistic Jewish widows being overlooked in the daily distribution of food, leading to murmuring. The apostles, recognizing the need to prioritize prayer and the ministry of the word, delegate this service task to seven men "full of the Holy Ghost and wisdom," thus establishing an early form of diaconal ministry. This organizational solution not only resolves the internal dispute but also facilitates the church''s continued growth, even attracting priests to the faith. The chapter then introduces Stephen, one of the chosen seven, highlighting his powerful ministry and the fierce opposition he faced from various synagogues, culminating in his arrest on false charges of blasphemy against Moses, God, the Temple, and the Law, setting the stage for his martyrdom and the broader persecution of the church.',
  'The Church''s Growth Through Service and Persecution',
  'διακονία (diakonia)',
  'From διάκονος (diakonos, "servant"), this term refers to service, ministry, or administration. In Acts 6, it appears in verses 1 and 4, denoting both the practical "daily ministration" to widows and the apostles'' "ministry of the word." It highlights the early church''s understanding that all forms of service, whether practical or spiritual, are essential ministries for the body of Christ.',
  '["Section 1 (vv.1-2): The Problem of Neglected Widows and Apostolic Prioritization","Section 2 (vv.3-4): The Appointment of Seven Men for Service","Section 3 (vv.5-7): The Selection and Ordination of the Seven, and Church Growth","Section 4 (vv.8-10): Stephen''s Powerful Ministry and Unstoppable Wisdom","Section 5 (vv.11-14): False Accusations and Stephen''s Arrest","Section 6 (v.15): Stephen''s Angelic Countenance Before the Council"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 15 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And in those days, when the number of the disciples was multiplied, there arose a murmuring of the Grecians against the Hebrews, because their widows were neglected in the daily ministration.',
   'Ἐν δὲ ταῖς ἡμέραις ταύταις πληθυνόντων τῶν μαθητῶν ἐγένετο γογγυσμὸς τῶν Ἑλληνιστῶν πρὸς τοὺς Ἑβραίους, ὅτι παρεθεωροῦντο ἐν τῇ διακονίᾳ τῇ καθημερινῇ αἱ χῆραι αὐτῶν.',
   'En de tais hēmerais tautais plēthynontōn tōn mathētōn egeneto gongysmos tōn Hellēnistōn pros tous Hebraious, hoti paretheōrounto en tē diakonia tē kathēmerinē hai chērai autōn.',
   'As the early church rapidly expanded, a practical issue arose concerning the equitable distribution of resources. The "Grecians" (Ἑλληνισταί, Hellenistai), likely Greek-speaking Jews from the Diaspora who had converted to Christianity, felt their widows were being overlooked compared to the "Hebrews" (Ἑβραῖοι, Hebraioi), who were Aramaic-speaking Jews native to Judea. This "murmuring" (γογγυσμός, gongysmos) indicates internal tension, a challenge to unity despite the earlier communal sharing (Acts 2:44-45, 4:32-35). The "daily ministration" (διακονία τῇ καθημερινῇ, diakonia tē kathēmerinē) refers to the practical service of providing food or aid.',
   NULL),
  (2,
   'Then the twelve called the multitude of the disciples unto them, and said, It is not reason that we should leave the word of God, and serve tables.',
   'προσκαλεσάμενοι δὲ οἱ δώδεκα τὸ πλῆθος τῶν μαθητῶν εἶπον, Οὐκ ἀρεστόν ἐστιν ἡμᾶς καταλείψαντας τὸν λόγον τοῦ Θεοῦ διακονεῖν τραπέζαις.',
   'Proskalesamenoi de hoi dōdeka to plēthos tōn mathētōn eipon, Ouk areston estin hēmas kataleipsantas ton logon tou Theou diakonein trapezais.',
   'The twelve apostles, recognizing the gravity of the situation, convened the entire body of disciples. Their statement, "It is not reason that we should leave the word of God, and serve tables," highlights a crucial principle of ministry: the need for focused leadership. While practical service is vital, the apostles understood their primary calling was to prayer and the proclamation of God''s word (v. 4). "Serve tables" (διακονεῖν τραπέζαις, diakonein trapezais) is a metonymy for the practical administration of food and finances. This decision demonstrates wisdom in delegation and prioritization.',
   'This verse establishes a foundational principle of church leadership: the primary calling of apostles (and by extension, pastors/elders) is to the ministry of the Word and prayer, not to administrative tasks that can be delegated. It underscores the importance of spiritual leadership being unhindered by practical demands, ensuring the church''s spiritual health and growth.'),
  (3,
   'Wherefore, brethren, look ye out among you seven men of honest report, full of the Holy Ghost and wisdom, whom we may appoint over this business.',
   'ἐπισκέψασθε οὖν, ἀδελφοί, ἄνδρας ἐξ ὑμῶν μαρτυρουμένους ἑπτὰ πλήρεις Πνεύματος καὶ σοφίας, οὓς καταστήσομεν ἐπὶ τῆς χρείας ταύτης.',
   'Episkepsasthe oun, adelphoi, andras ex hymōn martyroumenous hepta plēreis Pneumatos kai sophias, hous katastēsomēn epi tēs chreias tautēs.',
   'The apostles instruct the community to select seven men, emphasizing specific qualifications: "of honest report" (μαρτυρουμένους, martyroumenous, well-attested), "full of the Holy Ghost" (πλήρεις Πνεύματος, plēreis Pneumatos), and "wisdom" (σοφίας, sophias). These criteria underscore that even practical service requires spiritual discernment and character, not just administrative skill. The number seven may have symbolic significance, but here it primarily addresses the immediate need. This act of delegation is a model for church organization, ensuring that various ministries are led by spiritually qualified individuals.',
   'This verse outlines essential qualifications for those appointed to serve in the church, emphasizing spiritual character (full of the Holy Ghost) and practical wisdom. It teaches that even administrative roles are spiritual ministries requiring divine enablement and good reputation, setting a precedent for diaconal service within the body of Christ.'),
  (4,
   'But we will give ourselves continually to prayer, and to the ministry of the word.',
   'ἡμεῖς δὲ τῇ προσευχῇ καὶ τῇ διακονίᾳ τοῦ λόγου προσκαρτερήσομεν.',
   'Hēmeis de tē proseuchē kai tē diakonia tou logou proskarterēsomen.',
   'The apostles reiterate their commitment to their primary calling: "continually to prayer" (τῇ προσευχῇ προσκαρτερήσομεν, tē proseuchē proskarterēsomen) and "to the ministry of the word" (τῇ διακονίᾳ τοῦ λόγου, tē diakonia tou logou). This declaration highlights the foundational importance of these two spiritual disciplines for apostolic leadership. It''s not that serving tables is unimportant, but that different gifts and callings exist within the church, and leaders must remain focused on their God-given mandate to ensure the spiritual health and growth of the community.',
   'This verse firmly establishes prayer and the ministry of the Word as the indispensable priorities for spiritual leaders. It underscores that effective spiritual leadership flows from consistent communion with God and diligent proclamation of His truth, which are vital for the church''s spiritual nourishment and growth.'),
  (5,
   'And the saying pleased the whole multitude: and they chose Stephen, a man full of faith and of the Holy Ghost, and Philip, and Prochorus, and Nicanor, and Timon, and Parmenas, and Nicolas a proselyte of Antioch:',
   'καὶ ἤρεσεν ὁ λόγος ἐνώπιον παντὸς τοῦ πλήθους· καὶ ἐξελέξαντο Στέφανον, ἄνδρα πλήρη πίστεως καὶ Πνεύματος Ἁγίου, καὶ Φίλιππον καὶ Πρόχορον καὶ Νικάνορα καὶ Τίμωνα καὶ Παρμενᾶν καὶ Νικόλαον προσήλυτον Ἀντιοχέα.',
   'Kai ēresen ho logos enōpion pantos tou plēthous; kai exelexanto Stephanon, andra plērē pisteōs kai Pneumatos Hagiou, kai Philippon kai Prochoron kai Nikanora kai Timōna kai Parmenan kai Nikolaon prosēlyton Antiochea.',
   'The multitude readily accepted the apostles'' proposal, demonstrating unity and trust. They chose seven men, all bearing Greek names, suggesting they were likely Hellenistic Jews, which would have directly addressed the initial complaint from the Hellenistic widows. Stephen is singled out as "a man full of faith and of the Holy Ghost," foreshadowing his prominent role. Nicolas is identified as a "proselyte of Antioch," meaning he was a Gentile convert to Judaism who then became a Christian. This inclusion highlights the early church''s inclusivity and its diverse composition.',
   'The selection of these seven men, particularly Stephen and Philip, who later become significant evangelists, demonstrates that practical service can be a pathway to broader spiritual ministry. It also highlights the early church''s commitment to inclusivity, as evidenced by the selection of Hellenistic Jews and a Gentile proselyte, reflecting God''s universal call to salvation.'),
  (6,
   'Whom they set before the apostles: and when they had prayed, they laid their hands on them.',
   'οὓς ἔστησαν ἐνώπιον τῶν ἀποστόλων, καὶ προσευξάμενοι ἐπέθηκαν αὐτοῖς τὰς χεῖρας.',
   'Hous estēsan enōpion tōn apostolōn, kai proseuxamenoi epethēkan autois tas cheiras.',
   'The chosen seven were presented to the apostles for formal commissioning. The laying on of hands, accompanied by prayer, was a common practice in the early church for designating individuals for specific ministries (cf. Acts 8:17, 13:3, 19:6; 1 Tim 4:14, 5:22). This act symbolized the apostles'' endorsement, the impartation of authority, and the blessing of God upon their service. It was not merely an administrative appointment but a spiritual ordination, signifying divine approval and empowerment for their task.',
   NULL),
  (7,
   'And the word of God increased; and the number of the disciples multiplied in Jerusalem greatly; and a great company of the priests were obedient to the faith.',
   'καὶ ὁ λόγος τοῦ Θεοῦ ηὔξανεν, καὶ ἐπληθύνετο ὁ ἀριθμὸς τῶν μαθητῶν ἐν Ἱερουσαλὴμ σφόδρα, πολύς τε ὄχλος τῶν ἱερέων ὑπήκουον τῇ πίστει.',
   'Kai ho logos tou Theou ēuxanen, kai eplēthyneto ho arithmos tōn mathētōn en Hierousalēm sphodra, polys te ochlos tōn hiereōn hypēkouon tē pistei.',
   'The successful resolution of the internal conflict and the proper delegation of responsibilities led to remarkable growth. Luke reports that "the word of God increased" (ὁ λόγος τοῦ Θεοῦ ηὔξανεν, ho logos tou Theou ēuxanen), indicating the spread of the gospel message, and "the number of the disciples multiplied greatly." Significantly, "a great company of the priests were obedient to the faith." This conversion of priests, who were often resistant to the new movement, demonstrates the powerful impact of the gospel and the Holy Spirit''s work, even within the established religious system.',
   'This verse powerfully illustrates that internal unity and faithful delegation of ministry lead to spiritual and numerical growth in the church. The conversion of a "great company of the priests" is particularly significant, demonstrating the gospel''s transformative power to overcome entrenched religious traditions and bring even those deeply rooted in the old covenant into the new faith.'),
  (8,
   'And Stephen, full of faith and power, did great wonders and miracles among the people.',
   'Στέφανος δὲ πλήρης χάριτος καὶ δυνάμεως ἐποίει τέρατα καὶ σημεῖα μεγάλα ἐν τῷ λαῷ.',
   'Stephanos de plērēs charitos kai dynameōs epoiei terata kai sēmeia megala en tō laō.',
   'Stephen, one of the newly appointed seven, quickly emerges as a powerful figure. He is described as "full of grace and power" (πλήρης χάριτος καὶ δυνάμεως, plērēs charitos kai dynameōs). This divine enablement allowed him to perform "great wonders and miracles" (τέρατα καὶ σημεῖα μεγάλα, terata kai sēmeia megala) among the people, echoing the ministry of the apostles (Acts 2:43, 5:12). This demonstrates that the Holy Spirit''s power was not limited to the apostles but extended to those appointed for service, confirming their ministry.',
   'Stephen''s ministry, marked by "grace and power" and accompanied by "wonders and miracles," underscores that God empowers His servants for effective witness, regardless of their specific role. It demonstrates the Holy Spirit''s active presence and validation of the gospel message through supernatural signs, confirming the truth of Christ''s resurrection and the new covenant.'),
  (9,
   'Then there arose certain of the synagogue, which is called the synagogue of the Libertines, and Cyrenians, and Alexandrians, and of them of Cilicia and of Asia, disputing with Stephen.',
   'ἀνέστησαν δέ τινες τῶν ἐκ τῆς συναγωγῆς τῆς λεγομένης Λιβερτίνων καὶ Κυρηναίων καὶ Ἀλεξανδρέων καὶ τῶν ἀπὸ Κιλικίας καὶ Ἀσίας, συζητοῦντες τῷ Στεφάνῳ.',
   'Anestēsan de tines tōn ek tēs synagōgēs tēs legomenēs Libertinōn kai Kyrēnaiōn kai Alexandreōn kai tōn apo Kilikias kai Asias, syzētountes tō Stephanō.',
   'Stephen''s powerful ministry provoked opposition from various synagogues, specifically those of the "Libertines" (likely freed Roman slaves or their descendants who were Jews), Cyrenians, Alexandrians, and those from Cilicia and Asia. These were all Diaspora Jews, many of whom would have been Hellenistic, ironically the same group whose widows were initially neglected. Their "disputing" (συζητοῦντες, syzētountes) with Stephen indicates intense theological debate, likely concerning his proclamation of Jesus as Messiah and the implications for the Law and Temple.',
   NULL),
  (10,
   'And they were not able to resist the wisdom and the spirit by which he spake.',
   'καὶ οὐκ ἴσχυον ἀντιστῆναι τῇ σοφίᾳ καὶ τῷ Πνεύματι ᾧ ἐλάλει.',
   'Kai ouk ischyōon antistēnai tē sophia kai tō Pneumati hō elalei.',
   'Stephen''s opponents were unable to counter his arguments, not merely because of his intellectual prowess, but because of "the wisdom and the spirit by which he spake" (τῇ σοφίᾳ καὶ τῷ Πνεύματι ᾧ ἐλάλει, tē sophia kai tō Pneumati hō elalei). This highlights the divine enablement promised to believers facing persecution (Matt 10:19-20; Luke 21:15). The Holy Spirit empowered Stephen''s speech, making his words irresistible and convicting, leading his adversaries to resort to false accusations rather than intellectual defeat.',
   'This verse demonstrates the divine empowerment of believers to speak God''s truth with irresistible wisdom and spiritual authority, especially in the face of opposition. It affirms that the Holy Spirit provides the words and discernment needed, fulfilling Christ''s promise to equip His disciples for witness, making their testimony powerful and undeniable.'),
  (11,
   'Then they suborned men, which said, We have heard him speak blasphemous words against Moses, and against God.',
   'τότε ὑπέβαλον ἄνδρας λέγοντας, ὅτι Ἀκηκόαμεν αὐτοῦ λαλοῦντος ῥήματα βλάσφημα εἰς Μωϋσῆν καὶ τὸν Θεόν.',
   'Tote hypebalon andras legontas, hoti Akēkoamen autou lalountos rhēmata blasphēma eis Mōysēn kai ton Theon.',
   'Unable to defeat Stephen in open debate, his opponents resorted to unethical tactics: they "suborned men" (ὑπέβαλον ἄνδρας, hypebalon andras), meaning they secretly instigated or bribed false witnesses. The accusations were grave: "blasphemous words against Moses, and against God." Blasphemy against Moses, the giver of the Law, was considered a direct affront to God Himself. This tactic mirrors the false accusations brought against Jesus (Matt 26:59-61), indicating a pattern of opposition against those who proclaim the new covenant.',
   NULL),
  (12,
   'And they stirred up the people, and the elders, and the scribes, and came upon him, and caught him, and brought him to the council,',
   'καὶ συνεκίνησαν τὸν λαὸν καὶ τοὺς πρεσβυτέρους καὶ τοὺς γραμματεῖς, καὶ ἐπιστάντες συνήρπασαν αὐτὸν καὶ ἤγαγον εἰς τὸ συνέδριον.',
   'Kai synekinēsan ton laon kai tous presbyterous kai tous grammateis, kai epistantes synērpas an auton kai ēgagon eis to synedrion.',
   'The instigators successfully stirred up various segments of society: "the people, and the elders, and the scribes." This broad opposition indicates a concerted effort to silence Stephen. They "came upon him, and caught him" (συνήρπασαν αὐτὸν, synērpas an auton), suggesting a forceful arrest, and then brought him "to the council" (εἰς τὸ συνέδριον, eis to synedrion), the Sanhedrin, the supreme Jewish judicial body. This formal legal process, albeit based on false witness, gave their actions an air of legitimacy, mirroring Jesus''s trial before the same body.',
   NULL),
  (13,
   'And set up false witnesses, which said, This man ceaseth not to speak blasphemous words against this holy place, and the law:',
   'ἔστησάν τε μάρτυρας ψευδεῖς λέγοντας, Ὁ ἄνθρωπος οὗτος οὐ παύεται λαλῶν ῥήματα βλάσφημα κατὰ τοῦ τόπου τοῦ ἁγίου καὶ τοῦ νόμου.',
   'Estēsan te martyras pseudeis legontas, Ho anthrōpos houtos ou pauetai lalōn rhēmata blasphēma kata tou topou tou hagiou kai tou nomou.',
   'The false witnesses (μάρτυρας ψευδεῖς, martyras pseudeis) presented their fabricated testimony. The accusations expanded to include "blasphemous words against this holy place" (κατὰ τοῦ τόπου τοῦ ἁγίου, kata tou topou tou hagiou, referring to the Temple) and "the law" (τοῦ νόμου, tou nomou). These charges were designed to inflame Jewish religious sensibilities, as the Temple and the Law were central to their identity. The phrase "ceaseth not" (οὐ παύεται, ou pauetai) implies a persistent, defiant blasphemy, further demonizing Stephen.',
   NULL),
  (14,
   'For we have heard him say, that this Jesus of Nazareth shall destroy this place, and shall change the customs which Moses delivered us.',
   'ἀκηκόαμεν γὰρ αὐτοῦ λέγοντος ὅτι Ἰησοῦς ὁ Ναζωραῖος οὗτος καταλύσει τὸν τόπον τοῦτον καὶ ἀλλάξει τὰ ἔθη ἃ παρέδωκεν ἡμῖν Μωϋσῆς.',
   'Akēkoamen gar autou legontos hoti Iēsous ho Nazōraios houtos katalysei ton topon touton kai allaxei ta ethē ha paredōken hēmin Mōysēs.',
   'The specific content of the false testimony is revealed: Stephen allegedly claimed that "this Jesus of Nazareth shall destroy this place" (καταλύσει τὸν τόπον τοῦτον, katalysei ton topon touton, the Temple) and "shall change the customs which Moses delivered us" (ἀλλάξει τὰ ἔθη ἃ παρέδωκεν ἡμῖν Μωϋσῆς, allaxei ta ethē ha paredōken hēmin Mōysēs). While these were presented as blasphemous, they likely contained distorted elements of Stephen''s actual teaching about the obsolescence of the Temple and the Law in light of Christ''s new covenant (cf. John 2:19; Heb 8:13). The accusations reflect a misunderstanding or deliberate misrepresentation of the radical implications of Jesus''s ministry.',
   'This verse, though presenting false accusations, hints at the profound theological implications of Stephen''s message: the temporary nature of the Temple and the Law in light of Jesus Christ. It foreshadows the shift from a localized, ritualistic worship system to a universal, spiritual worship under the new covenant, where Christ Himself is the ultimate Temple and fulfillment of the Law.'),
  (15,
   'And all that sat in the council, looking stedfastly on him, saw his face as it had been the face of an angel.',
   'καὶ ἀτενίσαντες εἰς αὐτὸν πάντες οἱ καθεζόμενοι ἐν τῷ συνεδρίῳ εἶδον τὸ πρόσωπον αὐτοῦ ὡσεὶ πρόσωπον ἀγγέλου.',
   'Kai atenisantes eis auton pantes hoi kathezomenoi en tō synedriō eidon to prosōpon autou hōsei prosōpon angelou.',
   'As Stephen stood before the Sanhedrin, all who gazed "stedfastly on him" (ἀτενίσαντες εἰς αὐτὸν, atenisantes eis auton) witnessed a supernatural phenomenon: "his face as it had been the face of an angel" (τὸ πρόσωπον αὐτοῦ ὡσεὶ πρόσωπον ἀγγέλου, to prosōpon autou hōsei prosōpon angelou). This divine manifestation served as a visible sign of God''s presence and approval, reminiscent of Moses''s radiant face after encountering God (Exod 34:29-35). It was a powerful, undeniable testimony to Stephen''s innocence and God''s favor, even in the face of unjust condemnation, setting the stage for his powerful defense in Acts 7.',
   'Stephen''s angelic countenance before the Sanhedrin is a powerful divine affirmation of his innocence and God''s presence with him, even amidst false accusations and impending martyrdom. It serves as a visible testimony to the spiritual reality of God''s grace empowering His faithful witnesses, echoing Moses''s radiant face and foreshadowing the glory awaiting those who suffer for Christ.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 6;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γογγυσμὸς', 'gongysmos', 'G1112', '"Murmuring," "grumbling," "complaining." Derived from an onomatopoeic root, it describes a low, indistinct sound of discontent. Theologically, it often signifies dissatisfaction or rebellion against God or His appointed leaders, as seen with Israel in the wilderness (Exod 16:7-9; 1 Cor 10:10). In Acts 6:1, it highlights internal disunity within the early church.', 1),
  ('Ἑλληνιστῶν', 'Hellēnistōn', 'G1675', '"Hellenists," referring to Greek-speaking Jews. These were Jews who had adopted Greek language and culture, often living in the Diaspora. They are distinguished from "Hebrews" (Ἑβραῖοι), who maintained Aramaic language and Palestinian customs. This distinction points to cultural and linguistic differences within the early Jewish Christian community.', 2),
  ('διακονίᾳ', 'diakonia', 'G1248', '"Service," "ministry," "administration." From διάκονος (diakonos, "servant"). It encompasses various forms of service, from practical aid (as here, "daily ministration") to spiritual ministry (v. 4, "ministry of the word"). It emphasizes humble, dedicated service to others in the church, reflecting Christ''s example.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπισκέψασθε', 'episkepsasthe', 'G1980', '"Look ye out," "select," "seek out." From ἐπισκέπτομαι (episkeptomai), meaning "to visit," "to inspect," "to look after." Here, it implies a careful, discerning selection process by the community, not a casual choice. It suggests a pastoral concern for identifying qualified individuals for service.', 1),
  ('μαρτυρουμένους', 'martyroumenous', 'G3140', '"Of honest report," "well-attested," "having a good reputation." From μαρτυρέω (martyreō, "to bear witness"). It signifies that these men were publicly known and respected for their character and integrity within the community, a crucial qualification for leadership and service in the early church.', 2),
  ('Πνεύματος', 'Pneumatos', 'G4151', '"Spirit," "Holy Spirit." Refers to the third person of the Trinity, the divine agent of God''s power and presence. Being "full of the Holy Ghost" signifies spiritual empowerment, guidance, and character, essential for effective ministry beyond mere human ability, even in practical roles.', 3),
  ('σοφίας', 'sophias', 'G4678', '"Wisdom." Refers to practical insight, discernment, and the ability to apply knowledge effectively, especially in spiritual matters. It''s not just intellectual capacity but a God-given ability to make sound judgments and administer affairs justly, particularly important for resolving conflicts and managing church resources.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσευχῇ', 'proseuchē', 'G4335', '"Prayer." Refers to communication with God, including petition, intercession, and worship. For the apostles, devotion to prayer was paramount, recognizing their dependence on God for guidance and power in their ministry. It is a foundational spiritual discipline for all believers, especially leaders.', 1),
  ('διακονίᾳ', 'diakonia', 'G1248', '"Ministry," "service." Here, specifically "ministry of the word" (διακονίᾳ τοῦ λόγου). It highlights the apostles'' primary spiritual calling to proclaim and teach God''s message, distinguishing it from the practical "serving tables" (διακονεῖν τραπέζαις) in verse 2. This emphasizes the priority of spiritual nourishment.', 2),
  ('προσκαρτερήσομεν', 'proskarterēsomen', 'G4342', '"We will give ourselves continually," "we will persevere," "we will be devoted to." From προσκαρτερέω (proskartereō), meaning "to attend constantly," "to persist." It denotes steadfast, unwavering commitment and dedication to a task or person, emphasizing the apostles'' resolve in their spiritual duties of prayer and teaching.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 4;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ηὔξανεν', 'ēuxanen', 'G0837', '"Increased," "grew." From αὐξάνω (auxanō), meaning "to grow," "to increase." Used here to describe the growth of "the word of God," signifying the expansion and acceptance of the gospel message, not just the number of believers. It implies organic, divine growth and effectiveness of the message.', 1),
  ('ἐπληθύνετο', 'eplēthyneto', 'G4129', '"Multiplied," "increased in number." From πληθύνω (plēthynō), meaning "to multiply," "to increase." This verb specifically refers to the numerical growth of the disciples, indicating the rapid expansion of the Christian community in Jerusalem. It underscores the success of the church''s mission and God''s blessing.', 2),
  ('ἱερέων', 'hiereōn', 'G2409', '"Priests." Refers to those serving in the Jewish Temple, responsible for sacrifices and rituals. Their conversion to faith in Jesus was highly significant, as they represented the established religious order, demonstrating the gospel''s power to penetrate even the most resistant and traditional groups.', 3),
  ('ὑπήκουον', 'hypēkouon', 'G5219', '"Were obedient," "hearkened." From ὑπακούω (hypakouō), meaning "to listen," "to obey." It implies a willing submission to the message of faith, indicating a genuine conversion and acceptance of Christ''s authority, even for those previously bound by the Mosaic Law and its traditions.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 7;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χάριτος', 'charitos', 'G5485', '"Grace," "favor," "divine influence." Refers to God''s unmerited favor and divine enablement. Stephen being "full of grace" indicates he was richly endowed with God''s favor and spiritual gifts, which empowered his ministry and miracles, demonstrating God''s active presence through him.', 1),
  ('δυνάμεως', 'dynameōs', 'G1411', '"Power," "ability," "miraculous power." Refers to inherent strength or ability, often divine power. Stephen being "full of power" indicates he was endowed with the Holy Spirit''s might, enabling him to perform "great wonders and miracles" (τέρατα καὶ σημεῖα), validating his message and ministry.', 2),
  ('τέρατα', 'terata', 'G5059', '"Wonders," "portents." Refers to extraordinary events that cause astonishment and point to divine intervention. Often paired with "signs" (σημεῖα), they serve to authenticate the message and messenger, drawing attention to God''s work through Stephen.', 3),
  ('σημεῖα', 'sēmeia', 'G4592', '"Signs," "miracles." Refers to events that convey meaning or point to a deeper truth, often demonstrating God''s presence and power. Together with "wonders," they confirm the divine origin of Stephen''s ministry and the gospel message he proclaimed.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 8;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀντιστῆναι', 'antistēnai', 'G0436', '"To resist," "to oppose." From ἀνθίστημι (anthistēmi), meaning "to stand against." It describes the inability of Stephen''s opponents to withstand his arguments, highlighting the overwhelming power and truth of his Spirit-inspired words. This demonstrates the divine authority behind his proclamation.', 1),
  ('σοφίᾳ', 'sophia', 'G4678', '"Wisdom." Here, it refers to the divine wisdom imparted to Stephen by the Holy Spirit, enabling him to articulate the gospel with profound insight and irrefutable logic, surpassing mere human intellect. This wisdom was a gift for effective witness and defense of the faith.', 2),
  ('Πνεύματι', 'Pneumati', 'G4151', '"Spirit," "Holy Spirit." This refers specifically to the Holy Spirit, who inspired Stephen''s speech and gave him the power and authority to speak, making his words irresistible to his adversaries. It fulfills Jesus''s promise to equip His disciples for witness (Luke 21:15).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 10;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀτενίσαντες', 'atenisantes', 'G0816', '"Looking stedfastly," "gazing intently." From ἀτενίζω (atenizō), meaning "to fix one''s gaze upon." It conveys a sense of intense, focused observation, emphasizing that the Sanhedrin members carefully scrutinized Stephen''s face, making the subsequent divine manifestation undeniable.', 1),
  ('πρόσωπον', 'prosōpon', 'G4383', '"Face," "countenance." Refers to the visible aspect of a person. Here, Stephen''s face is supernaturally transformed, reflecting divine glory. This visible sign of God''s presence served as a powerful testimony to his innocence and divine favor amidst unjust accusation.', 2),
  ('ἀγγέλου', 'angelou', 'G0032', '"Angel." Refers to a divine messenger or heavenly being. Stephen''s face appearing "as the face of an angel" signifies a radiant, awe-inspiring, and divinely illuminated appearance, reminiscent of Moses''s face after encountering God (Exod 34:29-35). It was a visible sign of God''s presence and approval.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = 15;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Acts 2:44-45', 1),
  (1, 'Acts 4:32-35', 2),
  (1, 'James 1:27', 3),
  (1, '1 Timothy 5:3-16', 4),
  (2, 'Acts 4:19-20', 1),
  (2, 'Acts 20:28', 2),
  (2, '1 Corinthians 9:16', 3),
  (2, '2 Timothy 4:2', 4),
  (3, 'Deuteronomy 1:13', 1),
  (3, 'Acts 1:21-22', 2),
  (3, '1 Timothy 3:7', 3),
  (3, 'Titus 1:6-9', 4),
  (4, 'Acts 2:42', 1),
  (4, 'Romans 12:7', 2),
  (4, 'Colossians 4:2', 3),
  (4, '1 Timothy 4:13-16', 4),
  (5, 'Acts 8:5', 1),
  (5, 'Acts 11:24', 2),
  (5, '1 Timothy 3:8-13', 3),
  (5, 'John 12:20-22', 4),
  (6, 'Acts 8:17', 1),
  (6, 'Acts 13:3', 2),
  (6, '1 Timothy 4:14', 3),
  (6, '2 Timothy 1:6', 4),
  (7, 'Acts 12:24', 1),
  (7, 'Acts 19:20', 2),
  (7, 'Isaiah 55:11', 3),
  (7, 'John 12:42', 4),
  (8, 'Acts 2:43', 1),
  (8, 'Acts 5:12', 2),
  (8, 'Mark 16:17-18', 3),
  (8, 'Hebrews 2:4', 4),
  (9, 'Acts 9:29', 1),
  (9, 'Acts 17:17', 2),
  (9, 'Acts 18:28', 3),
  (9, 'Luke 21:15', 4),
  (10, 'Matthew 10:19-20', 1),
  (10, 'Luke 21:15', 2),
  (10, '1 Corinthians 2:4-5', 3),
  (10, 'Ephesians 6:19', 4),
  (11, 'Matthew 26:59-61', 1),
  (11, 'Mark 14:56-58', 2),
  (11, 'Acts 7:58', 3),
  (11, 'John 19:7', 4),
  (12, 'Acts 4:1-3', 1),
  (12, 'Acts 5:17-18', 2),
  (12, 'John 11:47-48', 3),
  (12, 'Matthew 26:57', 4),
  (13, 'Matthew 26:60-61', 1),
  (13, 'Acts 21:28', 2),
  (13, 'John 2:19-21', 3),
  (13, 'Jeremiah 7:4', 4),
  (14, 'Daniel 9:26', 1),
  (14, 'Matthew 24:2', 2),
  (14, 'John 2:19', 3),
  (14, 'Hebrews 8:13', 4),
  (15, 'Exodus 34:29-35', 1),
  (15, 'Matthew 17:2', 2),
  (15, '2 Corinthians 3:7-11', 3),
  (15, 'Acts 7:55', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 6 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 6 Complete!
-- 15 verses · 7 key verses with word studies (24 words)
-- Cross-references for 15 verses (60 refs)
-- ═══════════════════════════════════════════════════════