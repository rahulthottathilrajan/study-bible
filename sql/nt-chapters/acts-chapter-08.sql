-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 8 — The Gospel Spreads: Persecution, Samaria, and the Ethiopian Eunuch
-- 40 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'Acts Chapter 8 marks a pivotal expansion of the early Christian church beyond Jerusalem, driven by intense persecution following Stephen''s martyrdom. The scattering of believers, particularly Philip''s ministry in Samaria, demonstrates the gospel''s power to transcend ethnic and religious barriers, fulfilling Jesus'' commission in Acts 1:8. The chapter introduces Simon the Sorcerer, whose attempt to purchase spiritual power highlights the sacred and unpurchasable nature of God''s gifts, serving as a cautionary tale against ''simony.'' The subsequent narrative of Philip and the Ethiopian eunuch illustrates the Spirit-led, personal evangelism that brings the gospel to the Gentiles, emphasizing the importance of understanding scripture and the immediate call to baptism for new believers. This chapter underscores the Holy Spirit''s role in guiding missionary efforts and confirming new converts, while also showcasing the church''s resilience and adaptability in the face of adversity.',
  'The Gospel Spreads: Persecution, Samaria, and the Ethiopian Eunuch',
  'Πνεῦμα (Pneuma)',
  'Derived from ''pneō'' (to breathe, blow), ''Pneuma'' refers to spirit, breath, or wind. In Acts 8, it predominantly signifies the Holy Spirit, the divine agent empowering evangelism (vv. 29, 39), confirming believers (vv. 15-17), and guiding the church''s mission. It underscores the Spirit''s active role in the expansion of God''s kingdom.',
  '["Section 1 (vv. 1-4): Persecution in Jerusalem and the Scattering of Believers","Section 2 (vv. 5-13): Philip''s Ministry in Samaria and Simon the Sorcerer''s Conversion","Section 3 (vv. 14-25): Peter and John Confirm Samaritan Believers; Simon''s Sin of Simony","Section 4 (vv. 26-35): Philip is Led to the Ethiopian Eunuch and Explains Isaiah","Section 5 (vv. 36-38): The Eunuch''s Confession and Baptism","Section 6 (vv. 39-40): Philip''s Supernatural Departure and Continued Ministry"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 40 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And Saul was consenting unto his death. And at that time there was a great persecution against the church which was at Jerusalem; and they were all scattered abroad throughout the regions of Judaea and Samaria, except the apostles.',
   'Σαῦλος δὲ ἦν συνευδοκῶν τῇ ἀναιρέσει αὐτοῦ. Ἐγένετο δὲ ἐν ἐκείνῃ τῇ ἡμέρᾳ διωγμὸς μέγας ἐπὶ τὴν ἐκκλησίαν τὴν ἐν Ἱεροσολύμοις, πάντες τε διεσπάρησαν κατὰ τὰς χώρας τῆς Ἰουδαίας καὶ Σαμαρείας πλὴν τῶν ἀποστόλων.',
   'Saulos de ēn syneudokōn tē anairesei autou. Egeneto de en ekeinē tē hēmerā diōgmos megas epi tēn ekklēsian tēn en Hierosolymois, pantes te diesparēsan kata tas chōras tēs Ioudaias kai Samareias plēn tōn apostolōn.',
   'This verse immediately links Saul (later Paul) to Stephen''s death, highlighting his zealous opposition to the nascent church. The ''great persecution'' (διωγμὸς μέγας) served as a catalyst, scattering believers from Jerusalem. This scattering, though intended to suppress the church, paradoxically fulfilled Jesus'' command to spread the gospel beyond Jerusalem (Acts 1:8). The apostles, however, remained in Jerusalem, likely to provide leadership and stability during this turbulent time, demonstrating their commitment to the foundational community.',
   'Persecution, though painful, often serves as a divine instrument for the expansion of the gospel. The scattering of believers in Acts 8:1 illustrates how God can use adverse circumstances to fulfill His missionary purposes, demonstrating His sovereignty over human opposition and the resilience of His church.'),
  (2,
   'And devout men carried Stephen to his burial, and made great lamentation over him.',
   'συνεκόμισαν δὲ τὸν Στέφανον ἄνδρες εὐλαβεῖς καὶ ἐποιήσαντο κοπετὸν μέγαν ἐπ’ αὐτῷ.',
   'Synekomisan de ton Stephanon andres eulabeis kai epoiēsanto kopeton megan ep'' autō.',
   'The ''devout men'' (ἄνδρες εὐλαβεῖς) who buried Stephen were likely God-fearing Jews, possibly even some who had not yet fully embraced Christianity but respected Stephen. Their ''great lamentation'' (κοπετὸν μέγαν) was a public display of grief, perhaps a courageous act of solidarity in the face of intense persecution, contrasting with the hostile crowd that stoned him (Acts 7:58). This act of burial was significant, as it defied the persecutors and honored a martyr.',
   NULL),
  (3,
   'As for Saul, he made havock of the church, entering into every house, and haling men and women committed them to prison.',
   'Σαῦλος δὲ ἐλυμαίνετο τὴν ἐκκλησίαν, κατὰ τοὺς οἴκους εἰσπορευόμενος σύρων τε ἄνδρας καὶ γυναῖκας παρεδίδου εἰς φυλακήν.',
   'Saulos de elymaineto tēn ekklēsian, kata tous oikous eisporeuomenos syrōn te andras kai gynaikas paredidou eis phylakēn.',
   'Saul''s relentless ''havock'' (ἐλυμαίνετο, meaning ''to ravage'' or ''destroy'') against the church is vividly described. He actively sought out believers in their homes, dragging both men and women to prison. This detail underscores the severity of the persecution and Saul''s personal zeal in attempting to eradicate the Christian movement. His actions here set the stage for his dramatic conversion later (Acts 9:1-19), highlighting the profound transformation God wrought in him.',
   'The intense persecution faced by the early church, spearheaded by Saul, demonstrates the spiritual warfare inherent in the expansion of God''s kingdom. Yet, even in such hostility, God''s plan for the church''s growth and the conversion of its fiercest opponents (like Saul) remains sovereign.'),
  (4,
   'Therefore they that were scattered abroad went every where preaching the word.',
   'οἱ μὲν οὖν διασπαρέντες διῆλθον εὐαγγελιζόμενοι τὸν λόγον.',
   'Hoi men oun diasparentes diēlthon euangelizomenoi ton logon.',
   'Despite the persecution, the scattered believers did not retreat in fear but actively ''went everywhere preaching the word'' (εὐαγγελιζόμενοι τὸν λόγον). This verse highlights the organic, grassroots nature of early Christian evangelism. It demonstrates that the responsibility of sharing the gospel was not limited to the apostles but was embraced by ordinary believers, turning a moment of crisis into an opportunity for widespread proclamation of Christ.',
   'The scattering of believers led to the widespread dissemination of the gospel, illustrating that God can use even persecution to advance His kingdom. Every believer, not just apostles, is called to share the ''word'' (λόγον), demonstrating the universal priesthood and evangelistic mandate of the church.'),
  (5,
   'Then Philip went down to the city of Samaria, and preached Christ unto them.',
   'Φίλιππος δὲ κατελθὼν εἰς πόλιν τῆς Σαμαρείας ἐκήρυσσεν αὐτοῖς τὸν Χριστόν.',
   'Philippos de katelthōn eis polin tēs Samareias ekēryssen autois ton Christon.',
   'Philip, one of the seven deacons appointed in Acts 6:5, is now seen as an evangelist. His journey ''down to the city of Samaria'' is significant, as Jews typically avoided Samaritans due to long-standing ethnic and religious animosity (John 4:9). Philip''s willingness to preach ''Christ'' (τὸν Χριστόν) to them marks a crucial step in the gospel''s expansion beyond Jewish boundaries, fulfilling Jesus'' prophecy in Acts 1:8.',
   'Philip''s ministry in Samaria demonstrates the breaking down of ethnic and social barriers through the gospel. Christ''s message is universal, extending salvation to all peoples, including those historically marginalized or considered ''outsiders'' by the dominant religious group.'),
  (6,
   'And the people with one accord gave heed unto those things which Philip spake, hearing and seeing the miracles which he did.',
   'προσεῖχόν τε οἱ ὄχλοι τοῖς λεγομένοις ὑπὸ τοῦ Φιλίππου ὁμοθυμαδὸν ἐν τῷ ἀκούειν αὐτοὺς καὶ βλέπειν τὰ σημεῖα ἃ ἐποίει.',
   'Proseichon te hoi ochloi tois legomenois hypo tou Philippou homothymadon en tō akouein autous kai blepein ta sēmeia ha epoiei.',
   'The Samaritans ''with one accord'' (ὁμοθυμαδὸν) gave heed to Philip, indicating a remarkable unity and openness to his message. Their belief was not solely based on his words but was powerfully confirmed by the ''miracles'' (σημεῖα) he performed. These signs and wonders, such as healings and exorcisms, served as divine authentication of Philip''s message, demonstrating God''s power at work and preparing their hearts for the gospel.',
   NULL),
  (7,
   'For unclean spirits, crying with loud voice, came out of many that were possessed with them: and many taken with palsies, and that were lame, were healed.',
   'πολλοὶ γὰρ τῶν ἐχόντων πνεύματα ἀκάθαρτα βοῶντα φωνῇ μεγάλῃ ἐξήρχοντο, πολλοὶ δὲ παραλελυμένοι καὶ χωλοὶ ἐθεραπεύθησαν.',
   'Polloi gar tōn echontōn pneumata akatharta boōnta phōnē megalē exērchonto, polloi de paralelymenoi kai chōloi etherapeuthēsan.',
   'This verse details the specific miracles Philip performed: the expulsion of ''unclean spirits'' (πνεύματα ἀκάθαρτα) with loud cries, and the healing of those afflicted with ''palsies'' (παραλελυμένοι) and the ''lame'' (χωλοί). These acts of power directly confronted the spiritual darkness and physical suffering prevalent in the region, demonstrating Christ''s authority over evil and disease, and validating Philip''s proclamation of the kingdom of God.',
   NULL),
  (8,
   'And there was great joy in that city.',
   'ἐγένετο δὲ πολλὴ χαρὰ ἐν τῇ πόλει ἐκείνῃ.',
   'Egeneto de pollē chara en tē polei ekeinē.',
   'The immediate result of Philip''s ministry and the accompanying miracles was ''great joy'' (πολλὴ χαρὰ) in the city. This joy was a natural response to liberation from spiritual oppression, physical suffering, and the reception of the good news of Christ. It reflects the transformative power of the gospel, bringing hope and gladness where there was once despair, echoing the joy anticipated by the prophets (Isa 9:3).',
   'The ''great joy'' in Samaria signifies the profound spiritual and physical liberation brought by the gospel. True joy is a fruit of the Spirit, accompanying salvation and the manifestation of God''s power, demonstrating the transformative impact of Christ''s kingdom.'),
  (9,
   'But there was a certain man, called Simon, which beforetime in the same city used sorcery, and bewitched the people of Samaria, giving out that himself was some great one:',
   'ἀνὴρ δέ τις ὀνόματι Σίμων προϋπῆρχεν ἐν τῇ πόλει μαγεύων καὶ ἐξιστάνων τὸ ἔθνος τῆς Σαμαρείας, λέγων εἶναί τινα ἑαυτὸν μέγαν.',
   'Anēr de tis onomati Simōn proÿpērchen en tē polei mageuōn kai existanōn to ethnos tēs Samareias, legōn einai tina heauton megan.',
   'Simon, a prominent figure in Samaria, was known for ''sorcery'' (μαγεύων), which involved magical practices and occult arts. He ''bewitched'' (ἐξιστάνων, meaning ''to amaze'' or ''astound'') the people, claiming to be ''some great one'' (τινα ἑαυτὸν μέγαν). This sets up a direct contrast between his deceptive power and the genuine, divine power demonstrated by Philip, highlighting the spiritual battle for the hearts and minds of the Samaritans.',
   NULL),
  (10,
   'To whom they all gave heed, from the least to the greatest, saying, This man is the great power of God.',
   'ᾧ προσεῖχον πάντες ἀπὸ μικροῦ ἕως μεγάλου λέγοντες, Οὗτός ἐστιν ἡ δύναμις τοῦ Θεοῦ ἡ καλουμένη Μεγάλη.',
   'Hō proseichon pantes apo mikrou heōs megalou legontes, Houtos estin hē dynamis tou Theou hē kaloumenē Megalē.',
   'Simon had captivated ''all'' (πάντες), from the least to the greatest, who proclaimed him to be ''the great power of God'' (ἡ δύναμις τοῦ Θεοῦ ἡ καλουμένη Μεγάλη). This title suggests a belief that Simon embodied a divine attribute or was a manifestation of God''s power, reflecting a syncretistic religious environment where divine power was sought through various means. This widespread influence makes his eventual encounter with Philip and the apostles even more significant.',
   NULL),
  (11,
   'And to him they had regard, because that of long time he had bewitched them with sorceries.',
   'προσεῖχον δὲ αὐτῷ διὰ τὸ ἱκανῷ χρόνῳ ταῖς μαγείαις αὐτοῦ ἐξεστακέναι αὐτούς.',
   'Proseichon de autō dia to hikanō chronō tais mageiais autou exestakenai autous.',
   'The Samaritans'' long-standing regard for Simon was due to his prolonged use of ''sorceries'' (μαγείαις), which had ''bewitched'' (ἐξεστακέναι, ''astounded'' or ''amazed'') them. This highlights the deep spiritual deception and influence Simon had established over the community. The people were accustomed to his displays of power, making Philip''s authentic miracles a direct challenge to Simon''s authority and the spiritual climate of the city.',
   NULL),
  (12,
   'But when they believed Philip preaching the things concerning the kingdom of God, and the name of Jesus Christ, they were baptized, both men and women.',
   'ὅτε δὲ ἐπίστευσαν τῷ Φιλίππῳ εὐαγγελιζομένῳ περὶ τῆς βασιλείας τοῦ Θεοῦ καὶ τοῦ ὀνόματος Ἰησοῦ Χριστοῦ, ἐβαπτίζοντο ἄνδρες τε καὶ γυναῖκες.',
   'Hote de episteusan tō Philippō euangelizomenō peri tēs basileias tou Theou kai tou onomatos Iēsou Christou, ebaptizonto andres te kai gynaikes.',
   'The turning point comes when the Samaritans ''believed Philip''s preaching'' (ἐπίστευσαν τῷ Φιλίππῳ εὐαγγελιζομένῳ) concerning ''the kingdom of God'' (τῆς βασιλείας τοῦ Θεοῦ) and ''the name of Jesus Christ'' (τοῦ ὀνόματος Ἰησοῦ Χριστοῦ). This belief led directly to their baptism, signifying their public confession of faith and entrance into the Christian community. The inclusion of both ''men and women'' (ἄνδρες τε καὶ γυναῖκες) underscores the inclusive nature of the gospel.',
   'This verse links belief in the ''kingdom of God'' and ''Jesus Christ'' directly to baptism, establishing a pattern for conversion. Baptism is presented as a public declaration of faith, symbolizing identification with Christ and entrance into His covenant community, available to both men and women.'),
  (13,
   'Then Simon himself believed also: and when he was baptized, he continued with Philip, and wondered, beholding the miracles and signs which were done.',
   'ὁ δὲ Σίμων καὶ αὐτὸς ἐπίστευσεν, καὶ βαπτισθεὶς ἦν προσκαρτερῶν τῷ Φιλίππῳ, θεωρῶν τε δυνάμεις καὶ σημεῖα γινόμενα ἐξίστατο.',
   'Ho de Simōn kai autos episteusen, kai baptistheis ēn proskarterōn tō Philippō, theorōn te dynameis kai sēmeia ginomena existato.',
   'Even Simon ''believed also'' (καὶ αὐτὸς ἐπίστευσεν) and was baptized. His belief, however, appears to be superficial, driven more by amazement at Philip''s superior ''miracles and signs'' (δυνάμεις καὶ σημεῖα) than by genuine repentance and faith in Christ. He ''continued with Philip'' (ἦν προσκαρτερῶν τῷ Φιλίππῳ) and was ''wondering'' (ἐξίστατο), suggesting a fascination with the power rather than a transformation of heart. This sets the stage for his later spiritual failure.',
   NULL),
  (14,
   'Now when the apostles which were at Jerusalem heard that Samaria had received the word of God, they sent unto them Peter and John:',
   'ἀκούσαντες δὲ οἱ ἐν Ἱεροσολύμοις ἀπόστολοι ὅτι δέδεκται ἡ Σαμάρεια τὸν λόγον τοῦ Θεοῦ, ἀπέστειλαν πρὸς αὐτοὺς Πέτρον καὶ Ἰωάννην.',
   'Akousantes de hoi en Hierosolymois apostoloi hoti dedektai hē Samareia ton logon tou Theou, apesteilan pros autous Petron kai Iōannēn.',
   'Upon hearing that Samaria had ''received the word of God'' (δέδεκται τὸν λόγον τοῦ Θεοῦ), the apostles in Jerusalem dispatched Peter and John. This action signifies the Jerusalem church''s oversight and validation of the expanding mission. Sending two prominent apostles ensured doctrinal continuity and provided apostolic authority to confirm the new Samaritan believers, integrating them into the broader Christian community.',
   'The sending of Peter and John to Samaria highlights the importance of apostolic oversight and unity within the early church. It ensured that the new converts were properly integrated into the broader body of Christ and received the full spiritual blessings, including the Holy Spirit.'),
  (15,
   'Who, when they were come down, prayed for them, that they might receive the Holy Ghost:',
   'οἵτινες καταβάντες προσηύξαντο περὶ αὐτῶν ὅπως λάβωσιν Πνεῦμα Ἅγιον.',
   'Hoitines katabantes prosēuxanto peri autōn hopōs labōsin Pneuma Hagion.',
   'Upon their arrival, Peter and John ''prayed for them'' (προσηύξαντο περὶ αὐτῶν) specifically ''that they might receive the Holy Ghost'' (ὅπως λάβωσιν Πνεῦμα Ἅγιον). This indicates that while the Samaritans had believed and been baptized, they had not yet experienced the manifest indwelling or empowering of the Holy Spirit in the same way as the Jewish believers at Pentecost (Acts 2:1-4). This sequence emphasizes the distinct roles of initial conversion/baptism and the reception of the Spirit.',
   'This verse introduces a significant theological point: the reception of the Holy Spirit, distinct from initial belief and water baptism, often accompanied by apostolic laying on of hands. It underscores the Spirit''s role in empowering believers and confirming their inclusion in the new covenant community.'),
  (16,
   '(For as yet he was fallen upon none of them: only they were baptized in the name of the Lord Jesus.)',
   'οὐδέπω γὰρ ἦν ἐπ’ οὐδένα αὐτῶν πεπτωκός, μόνον δὲ βεβαπτισμένοι ὑπῆρχον εἰς τὸ ὄνομα τοῦ Κυρίου Ἰησοῦ.',
   'Oudepō gar ēn ep'' oudena autōn peptōkos, monon de bebaptismenoi hypērchon eis to onoma tou Kyriou Iēsou.',
   'This parenthetical explanation clarifies that ''as yet he was fallen upon none of them'' (οὐδέπω γὰρ ἦν ἐπ’ οὐδένα αὐτῶν πεπτωκός), meaning the Holy Spirit had not yet come upon them in a discernible, empowering way. They had only been ''baptized in the name of the Lord Jesus'' (βεβαπτισμένοι ὑπῆρχον εἰς τὸ ὄνομα τοῦ Κυρίου Ἰησοῦ). This passage is crucial for understanding the relationship between water baptism and the reception of the Holy Spirit in the early church, suggesting that sometimes these experiences were distinct in timing, especially in transitional periods.',
   'The distinction between water baptism and the reception of the Holy Spirit is evident here. While they were baptized into Christ, the Spirit had not yet ''fallen upon'' them, indicating a subsequent, empowering experience often mediated through apostolic prayer and laying on of hands, signifying full inclusion and spiritual endowment.'),
  (17,
   'Then laid they their hands on them, and they received the Holy Ghost.',
   'τότε ἐπετίθεσαν τὰς χεῖρας ἐπ’ αὐτοὺς καὶ ἐλάμβανον Πνεῦμα Ἅγιον.',
   'Tote epetithesan tas cheiras ep'' autous kai elambanon Pneuma Hagion.',
   'Following their prayer, Peter and John ''laid their hands on them'' (ἐπετίθεσαν τὰς χεῖρας ἐπ’ αὐτοὺς), and then ''they received the Holy Ghost'' (ἐλάμβανον Πνεῦμα Ἅγιον). The laying on of hands was a common practice signifying blessing, commissioning, or the impartation of spiritual gifts. In this context, it served as the visible means through which the Holy Spirit was bestowed upon the Samaritan believers, confirming their full inclusion into the body of Christ and validating the gospel''s expansion to this new group.',
   'The laying on of hands by the apostles facilitated the reception of the Holy Spirit, demonstrating the Spirit''s power and the apostles'' authority in confirming new believers. This act symbolized the impartation of divine grace and spiritual empowerment, integrating the Samaritans fully into the Christian community.'),
  (18,
   'And when Simon saw that through laying on of the apostles’ hands the Holy Ghost was given, he offered them money,',
   'ἰδὼν δὲ ὁ Σίμων ὅτι διὰ τῆς ἐπιθέσεως τῶν χειρῶν τῶν ἀποστόλων δίδοται τὸ Πνεῦμα, προσήνεγκεν αὐτοῖς χρήματα,',
   'Idōn de ho Simōn hoti dia tēs epitheseōs tōn cheirōn tōn apostolōn didotai to Pneuma, prosēnenken autois chrēmata,',
   'Simon, observing that the Holy Spirit ''was given'' (δίδοται τὸ Πνεῦμα) through the ''laying on of the apostles’ hands'' (διὰ τῆς ἐπιθέσεως τῶν χειρῶν τῶν ἀποστόλων), offered them ''money'' (χρήματα). This reveals his continued misunderstanding of spiritual power. He perceived the Holy Spirit as a commodity or a magical ability that could be bought and sold, rather than a divine gift freely given by God. This incident gives rise to the term ''simony,'' referring to the buying or selling of ecclesiastical privileges.',
   'Simon''s attempt to purchase the Holy Spirit reveals a profound spiritual misunderstanding: God''s gifts are not commodities to be bought or sold. This act, known as ''simony,'' underscores the sacred, unmerited nature of divine grace and the danger of approaching spiritual power with worldly motives.'),
  (19,
   'Saying, Give me also this power, that on whomsoever I lay hands, he may receive the Holy Ghost.',
   'λέγων, Δότε κἀμοὶ τὴν ἐξουσίαν ταύτην, ἵνα ᾧ ἐὰν ἐπιθῶ τὰς χεῖρας λαμβάνῃ Πνεῦμα Ἅγιον.',
   'Legōn, Dote kamoi tēn exousian tautēn, hina hō ean epithō tas cheiras lambanē Pneuma Hagion.',
   'Simon explicitly requested, ''Give me also this power'' (Δότε κἀμοὶ τὴν ἐξουσίαν ταύτην), so that he too could impart the Holy Spirit through the laying on of hands. His desire was not for spiritual transformation or genuine ministry but for the ''authority'' (ἐξουσίαν) and prestige associated with such a miraculous ability. This confirms his self-centered motives and his failure to grasp the true nature of God''s Spirit.',
   NULL),
  (20,
   'But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of God may be purchased with money.',
   'Πέτρος δὲ εἶπεν πρὸς αὐτόν, Τὸ ἀργύριόν σου σὺν σοὶ εἴη εἰς ἀπώλειαν, ὅτι τὴν δωρεὰν τοῦ Θεοῦ ἐνόμισας διὰ χρημάτων κτᾶσθαι.',
   'Petros de eipen pros auton, To argyrion sou syn soi eiē eis apōleian, hoti tēn dōrean tou Theou enomisas dia chrēmatōn ktasthai.',
   'Peter''s response to Simon was sharp and unequivocal: ''Thy money perish with thee'' (Τὸ ἀργύριόν σου σὺν σοὶ εἴη εἰς ἀπώλειαν). This severe rebuke highlights the gravity of Simon''s sin – attempting to ''purchase'' (κτᾶσθαι) ''the gift of God'' (τὴν δωρεὰν τοῦ Θεοῦ) with money. Peter''s words emphasize that divine grace and spiritual power are not commodities to be bought or sold, but are freely given by God, and any attempt to commercialize them is an affront to His holiness.',
   'Peter''s condemnation of Simon''s attempt to buy spiritual power (''simony'') powerfully asserts that God''s gifts are unpurchasable. Salvation, the Holy Spirit, and spiritual authority are freely given by grace, not earned or acquired through monetary means, emphasizing the sanctity and sovereignty of divine bestowal.'),
  (21,
   'Thou hast neither part nor lot in this matter: for thy heart is not right in the sight of God.',
   'οὐκ ἔστιν σοι μερὶς οὐδὲ κλῆρος ἐν τῷ λόγῳ τούτῳ, ἡ γὰρ καρδία σου οὐκ ἔστιν εὐθεῖα ἔναντι τοῦ Θεοῦ.',
   'Ouk estin soi meris oude klēros en tō logō toutō, hē gar kardia sou ouk estin eutheia enanti tou Theou.',
   'Peter declares that Simon has ''neither part nor lot'' (οὐκ ἔστιν σοι μερὶς οὐδὲ κλῆρος) in this spiritual matter, indicating his exclusion from genuine spiritual inheritance. The reason given is profound: ''thy heart is not right in the sight of God'' (ἡ γὰρ καρδία σου οὐκ ἔστιν εὐθεῖα ἔναντι τοῦ Θεοῦ). This exposes the superficiality of Simon''s earlier ''belief'' and baptism, revealing that his inner motives were corrupt and unaligned with God''s will, despite outward religious acts.',
   'This verse underscores the critical importance of a ''right heart'' before God for genuine spiritual participation. Outward religious acts like baptism or professed belief are insufficient if the heart remains unrepentant and motivated by selfish desires, revealing that true faith involves inner transformation.'),
  (22,
   'Repent therefore of this thy wickedness, and pray God, if perhaps the thought of thine heart may be forgiven thee.',
   'μετανόησον οὖν ἀπὸ τῆς κακίας σου ταύτης, καὶ δεήθητι τοῦ Κυρίου εἰ ἄρα γε ἀφεθήσεταί σοι ἡ ἐπίνοια τῆς καρδίας σου.',
   'Metanoēson oun apo tēs kakias sou tautēs, kai deēthēti tou Kyriou ei ara ge aphethēsetai soi hē epinoia tēs kardias sou.',
   'Despite the harsh rebuke, Peter offers Simon a path to repentance: ''Repent therefore of this thy wickedness'' (μετανόησον οὖν ἀπὸ τῆς κακίας σου ταύτης) and ''pray God'' (δεήθητι τοῦ Κυρίου). The phrase ''if perhaps'' (εἰ ἄρα γε) suggests the gravity of Simon''s sin and the uncertainty of forgiveness for such a profound spiritual offense, emphasizing the need for genuine, heartfelt repentance for his ''thought of thine heart'' (ἡ ἐπίνοια τῆς καρδίας σου).',
   'Peter''s call to repentance, even for a grave spiritual sin, highlights God''s offer of forgiveness. However, the ''if perhaps'' clause underscores the seriousness of Simon''s heart condition, emphasizing that true repentance must be profound and sincere for forgiveness to be granted.'),
  (23,
   'For I perceive that thou art in the gall of bitterness, and in the bond of iniquity.',
   'εἰς γὰρ χολὴν πικρίας καὶ σύνδεσμον ἀδικίας ὁρῶ σε ὄντα.',
   'Eis gar cholēn pikrias kai syndesmon adikias horō se onta.',
   'Peter''s spiritual discernment reveals the depth of Simon''s corruption: ''For I perceive that thou art in the gall of bitterness, and in the bond of iniquity'' (εἰς γὰρ χολὴν πικρίας καὶ σύνδεσμον ἀδικίας ὁρῶ σε ὄντα). ''Gall of bitterness'' (χολὴν πικρίας) is an idiom for deep-seated malice or extreme wickedness, possibly referencing Deuteronomy 29:18. ''Bond of iniquity'' (σύνδεσμον ἀδικίας) signifies being enslaved by sin. These powerful metaphors illustrate Simon''s spiritual state as one of profound moral corruption and bondage.',
   'Peter''s prophetic insight into Simon''s heart reveals the spiritual reality of being consumed by ''gall of bitterness'' and ''bond of iniquity.'' This emphasizes that unrepentant sin leads to spiritual enslavement and a corrupted inner state, highlighting the need for divine intervention and genuine transformation.'),
  (24,
   'Then answered Simon, and said, Pray ye to the LORD for me, that none of these things which ye have spoken come upon me.',
   'ἀποκριθεὶς δὲ ὁ Σίμων εἶπεν, Δεήθητε ὑμεῖς ὑπὲρ ἐμοῦ πρὸς τὸν Κύριον, ὅπως μηδὲν ἐπέλθῃ ἐπ’ ἐμὲ τῶν εἰρημένων ὧν εἰρήκατε.',
   'Apokritheis de ho Simōn eipen, Deēthēte hymeis hyper emou pros ton Kyrion, hopōs mēden epelthē ep'' eme tōn eirēmenōn hōn eirēkate.',
   'Simon''s response, ''Pray ye to the LORD for me'' (Δεήθητε ὑμεῖς ὑπὲρ ἐμοῦ πρὸς τὸν Κύριον), indicates fear of the consequences of Peter''s words rather than genuine repentance for his sin. He desires to avoid the ''things which ye have spoken'' (τῶν εἰρημένων ὧν εἰρήκατε), suggesting a concern for self-preservation from divine judgment rather than a change of heart. This further confirms the superficiality of his conversion and the unrighteousness of his motives.',
   NULL),
  (25,
   'And they, when they had testified and preached the word of the Lord, returned to Jerusalem, and preached the gospel in many villages of the Samaritans.',
   'οἱ μὲν οὖν διαμαρτυράμενοι καὶ λαλήσαντες τὸν λόγον τοῦ Κυρίου ὑπέστρεφον εἰς Ἱεροσόλυμα, πολλὰς δὲ κώμας τῶν Σαμαρειτῶν εὐηγγελίζοντο.',
   'Hoi men oun diamartyramenoi kai lalēsantes ton logon tou Kyriou hypestrephon eis Hierosolyma, pollas de kōmas tōn Samareitōn euēggelizonto.',
   'After their mission in Samaria, Peter and John ''testified and preached the word of the Lord'' (διαμαρτυράμενοι καὶ λαλήσαντες τὸν λόγον τοῦ Κυρίου) and returned to Jerusalem. Significantly, on their way back, they ''preached the gospel in many villages of the Samaritans'' (πολλὰς δὲ κώμας τῶν Σαμαρειτῶν εὐηγγελίζοντο). This demonstrates the lasting impact of Philip''s initial ministry and the apostles'' commitment to spreading the gospel throughout the Samaritan region, further fulfilling the Acts 1:8 mandate.',
   NULL),
  (26,
   'And the angel of the Lord spake unto Philip, saying, Arise, and go toward the south unto the way that goeth down from Jerusalem unto Gaza, which is desert.',
   'Ἄγγελος δὲ Κυρίου ἐλάλησεν πρὸς Φίλιππον λέγων, Ἀνάστηθι καὶ πορεύου κατὰ μεσημβρίαν ἐπὶ τὴν ὁδὸν τὴν καταβαίνουσαν ἀπὸ Ἱερουσαλὴμ εἰς Γάζαν, αὕτη ἐστὶν ἔρημος.',
   'Angelos de Kyriou elalēsen pros Philippon legōn, Anastēthi kai poreuou kata mesēmbrian epi tēn hodon tēn katabainousan apo Hierousalēm eis Gazan, hautē estin erēmos.',
   'An ''angel of the Lord'' (Ἄγγελος δὲ Κυρίου) supernaturally directed Philip to leave his successful ministry in Samaria and go ''toward the south unto the way that goeth down from Jerusalem unto Gaza, which is desert'' (αὕτη ἐστὶν ἔρημος). This divine intervention highlights the Spirit''s active guidance in missionary endeavors, leading Philip to a seemingly unproductive, desolate route for a specific, divinely appointed encounter. The mention of ''desert'' emphasizes the unlikely nature of this new assignment.',
   'This divine directive to Philip illustrates the Holy Spirit''s sovereign guidance in evangelism. God often leads His servants to unexpected places and encounters, demonstrating that His plans transcend human logic and that He orchestrates divine appointments for the spread of the gospel.'),
  (27,
   'And he arose and went: and, behold, a man of Ethiopia, an eunuch of great authority under Candace queen of the Ethiopians, who had the charge of all her treasure, and had come to Jerusalem for to worship,',
   'καὶ ἀναστὰς ἐπορεύθη. καὶ ἰδοὺ ἀνὴρ Αἰθίοψ εὐνοῦχος δυνάστης Κανδάκης βασιλίσσης Αἰθιόπων, ὃς ἦν ἐπὶ πάσης τῆς γάζης αὐτῆς, ὃς ἐληλύθει προσκυνήσων εἰς Ἱερουσαλήμ,',
   'Kai anastas eporeuthē. Kai idou anēr Aithiops eunouchos dynastēs Kandakēs basilissēs Aithiopōn, hos ēn epi pasēs tēs gazēs autēs, hos elēlythei proskynēsōn eis Hierousalēm,',
   'Philip immediately obeyed. He encountered an ''Ethiopian eunuch'' (ἀνὴρ Αἰθίοψ εὐνοῦχος), a man of ''great authority'' (δυνάστης) under ''Candace queen of the Ethiopians'' (Κανδάκης βασιλίσσης Αἰθιόπων), responsible for all her ''treasure'' (τῆς γάζης). The eunuch had traveled to Jerusalem ''for to worship'' (προσκυνήσων), indicating he was a God-fearer, possibly a proselyte to Judaism. His status as a eunuch would have excluded him from full participation in the temple (Deut 23:1), making his spiritual seeking poignant.',
   'The Ethiopian eunuch, a high-ranking Gentile seeker, represents the global reach of the gospel. His journey to Jerusalem for worship, despite his physical limitations for full temple participation, highlights his spiritual hunger and God''s initiative in sending Philip to meet him, demonstrating divine grace transcends social and religious barriers.'),
  (28,
   'Was returning, and sitting in his chariot read Esaias the prophet.',
   'ἦν τε ὑποστρέφων καὶ καθήμενος ἐπὶ τοῦ ἅρματος αὐτοῦ ἀνεγίνωσκεν τὸν προφήτην Ἡσαΐαν.',
   'Ēn te hypostrephōn kai kathēmenos epi tou harmatos autou aneginōsken ton prophētēn Hēsïan.',
   'As the eunuch was ''returning'' (ὑποστρέφων), he was ''sitting in his chariot'' (καθήμενος ἐπὶ τοῦ ἅρματος αὐτοῦ) and ''read Esaias the prophet'' (ἀνεγίνωσκεν τὸν προφήτην Ἡσαΐαν). This detail is significant: he was not only literate but also engaged with scripture, specifically the prophet Isaiah, a book rich in messianic prophecy. His diligent study, even while traveling, underscores his earnest spiritual quest and sets the perfect stage for Philip''s intervention.',
   NULL),
  (29,
   'Then the Spirit said unto Philip, Go near, and join thyself to this chariot.',
   'εἶπεν δὲ τὸ Πνεῦμα τῷ Φιλίππῳ, Πρόσελθε καὶ κολλήθητι τῷ ἅρματι τούτῳ.',
   'Eipen de to Pneuma tō Philippō, Proselthe kai kollēthēti tō harmati toutō.',
   'The Holy ''Spirit'' (τὸ Πνεῦμα) directly instructed Philip, ''Go near, and join thyself to this chariot'' (Πρόσελθε καὶ κολλήθητι τῷ ἅρματι τούτῳ). This is another clear instance of the Spirit''s immediate and specific guidance in evangelism, confirming that Philip''s journey to the desert road was divinely orchestrated for this particular encounter. It emphasizes the Spirit''s active role in connecting seekers with those who can share the gospel.',
   'The Spirit''s direct command to Philip exemplifies divine orchestration in evangelism. God actively guides His servants to specific individuals, demonstrating that effective outreach is often a Spirit-led endeavor, connecting those who seek truth with those who bear it.'),
  (30,
   'And Philip ran thither to him, and heard him read the prophet Esaias, and said, Understandest thou what thou readest?',
   'προσδραμὼν δὲ ὁ Φίλιππος ἤκουσεν αὐτοῦ ἀναγινώσκοντος Ἡσαΐαν τὸν προφήτην, καὶ εἶπεν, Ἆρά γε γινώσκεις ἃ ἀναγινώσκεις;',
   'Prosdramōn de ho Philippos ēkousen autou anaginōskontos Hēsïan ton prophētēn, kai eipen, Ara ge ginōskeis ha anaginōskeis?',
   'Philip ''ran thither to him'' (προσδραμὼν δὲ ὁ Φίλιππος), demonstrating his eagerness to obey the Spirit. He heard the eunuch ''read the prophet Esaias'' (ἀναγινώσκοντος Ἡσαΐαν τὸν προφήτην) aloud, a common practice in antiquity. Philip''s direct question, ''Understandest thou what thou readest?'' (Ἆρά γε γινώσκεις ἃ ἀναγινώσκεις;), was a polite yet probing invitation to engage in spiritual conversation, perfectly timed to the eunuch''s current activity.',
   NULL),
  (31,
   'And he said, How can I, except some man should guide me? And he desired Philip that he would come up and sit with him.',
   'ὁ δὲ εἶπεν, Πῶς γὰρ ἂν δυναίμην ἐὰν μή τις ὁδηγήσει με; παρεκάλεσέν τε τὸν Φίλιππον ἀναβάντα καθίσαι σὺν αὐτῷ.',
   'Ho de eipen, Pōs gar an dynaimēn ean mē tis hodēgēsei me? Parekalesen te ton Philippon anabanta kathisai syn autō.',
   'The eunuch''s humble reply, ''How can I, except some man should guide me?'' (Πῶς γὰρ ἂν δυναίμην ἐὰν μή τις ὁδηγήσει με;), reveals his recognition of his need for interpretation and his openness to instruction. He then ''desired Philip that he would come up and sit with him'' (παρεκάλεσέν τε τὸν Φίλιππον ἀναβάντα καθίσαι σὺν αὐτῷ). This invitation signifies his eagerness to learn and his trust in Philip, setting the stage for a powerful evangelistic encounter.',
   'The eunuch''s admission of needing guidance highlights the necessity of human instrumentality in understanding divine revelation. While scripture is inspired, its interpretation often benefits from Spirit-led teaching, underscoring the role of teachers and the church in discipleship.'),
  (32,
   'The place of the scripture which he read was this, He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth:',
   'ἡ δὲ περιοχὴ τῆς γραφῆς ἣν ἀνεγίνωσκεν ἦν αὕτη, Ὡς πρόβατον ἐπὶ σφαγὴν ἤχθη, καὶ ὡς ἀμνὸς ἐναντίον τοῦ κείραντος αὐτὸν ἄφωνος, οὕτως οὐκ ἀνοίγει τὸ στόμα αὐτοῦ.',
   'Hē de periochē tēs graphēs hēn aneginōsken ēn hautē, Hōs probaton epi sphagēn ēchthē, kai hōs amnos enantion tou keirantos auton aphōnos, houtōs ouk anoigei to stoma autou.',
   'The specific passage the eunuch was reading was from Isaiah 53:7-8 (Septuagint version). This section, describing a suffering servant led ''as a sheep to the slaughter'' (Ὡς πρόβατον ἐπὶ σφαγὴν ἤχθη) and ''like a lamb dumb before his shearer'' (ὡς ἀμνὸς ἐναντίον τοῦ κείραντος αὐτὸν ἄφωνος), is one of the most profound messianic prophecies in the Old Testament. Its focus on vicarious suffering and silent endurance perfectly prefigures Jesus Christ.',
   'The eunuch''s reading of Isaiah 53, a profound messianic prophecy, highlights the Old Testament''s foreshadowing of Christ''s atoning work. This passage, describing the suffering servant, is central to understanding Jesus'' sacrificial death and His silent submission to God''s will for humanity''s redemption.'),
  (33,
   'In his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth.',
   'ἐν τῇ ταπεινώσει αὐτοῦ ἡ κρίσις αὐτοῦ ἤρθη· τὴν γενεὰν αὐτοῦ τίς διηγήσεται; ὅτι αἴρεται ἀπὸ τῆς γῆς ἡ ζωή αὐτοῦ.',
   'En tē tapeinōsei autou hē krisis autou ērtē; tēn genean autou tis diēgēsetai? Hoti airetai apo tēs gēs hē zōē autou.',
   'Continuing the Isaiah 53 passage (v. 8), this verse speaks of the servant''s ''humiliation'' (ταπεινώσει) and how ''his judgment was taken away'' (ἡ κρίσις αὐτοῦ ἤρθη). The question ''who shall declare his generation?'' (τὴν γενεὰν αὐτοῦ τίς διηγήσεται;) can refer to his posterity or the injustice of his trial. The phrase ''for his life is taken from the earth'' (ὅτι αἴρεται ἀπὸ τῆς γῆς ἡ ζωή αὐτοῦ) clearly points to his premature death. This passage directly sets up Philip''s opportunity to explain Jesus.',
   NULL),
  (34,
   'And the eunuch answered Philip, and said, I pray thee, of whom speaketh the prophet this? of himself, or of some other man?',
   'ἀποκριθεὶς δὲ ὁ εὐνοῦχος τῷ Φιλίππῳ εἶπεν, Δέομαί σου, περὶ τίνος ὁ προφήτης λέγει τοῦτο; περὶ ἑαυτοῦ ἢ περὶ ἑτέρου τινός;',
   'Apokritheis de ho eunouchos tō Philippō eipen, Deomai sou, peri tinos ho prophētēs legei touto? Peri heautou ē peri heterou tinos?',
   'The eunuch''s question, ''I pray thee, of whom speaketh the prophet this? of himself, or of some other man?'' (περὶ τίνος ὁ προφήτης λέγει τοῦτο; περὶ ἑαυτοῦ ἢ περὶ ἑτέρου τινός;), is the crucial moment. It demonstrates his earnest desire for understanding and provides Philip with the perfect opening to present the gospel. This question was a common point of debate among Jewish interpreters regarding Isaiah 53, and the eunuch''s inquiry shows his intellectual and spiritual engagement with the text.',
   NULL),
  (35,
   'Then Philip opened his mouth, and began at the same scripture, and preached unto him Jesus.',
   'ἀνοίξας δὲ ὁ Φίλιππος τὸ στόμα αὐτοῦ καὶ ἀρξάμενος ἀπὸ τῆς γραφῆς ταύτης εὐηγγελίσατο αὐτῷ τὸν Ἰησοῦν.',
   'Anoixas de ho Philippos to stoma autou kai arxamenos apo tēs graphēs tautēs euēggelīsato autō ton Iēsoun.',
   'Philip, seizing the opportunity, ''opened his mouth'' (ἀνοίξας δὲ ὁ Φίλιππος τὸ στόμα αὐτοῦ) and, ''beginning at the same scripture'' (ἀρξάμενος ἀπὸ τῆς γραφῆς ταύτης), ''preached unto him Jesus'' (εὐηγγελίσατο αὐτῷ τὸν Ἰησοῦν). This is a classic example of Christ-centered interpretation of the Old Testament. Philip showed how Isaiah 53, with its prophecy of a suffering servant, was fulfilled in the person and work of Jesus Christ, explaining His death, resurrection, and redemptive purpose.',
   'Philip''s evangelism, starting from Old Testament prophecy to preach Jesus, exemplifies the continuity of God''s redemptive plan. It demonstrates that Christ is the fulfillment of scripture, and effective gospel proclamation connects ancient promises with their ultimate realization in Him.'),
  (36,
   'And as they went on their way, they came unto a certain water: and the eunuch said, See, here is water; what doth hinder me to be baptized?',
   'πορευομένων δὲ αὐτῶν ἐπὶ τῆς ὁδοῦ ἦλθον ἐπί τι ὕδωρ· καί φησιν ὁ εὐνοῦχος, Ἰδοὺ ὕδωρ· τί κωλύει με βαπτισθῆναι;',
   'Poreuomenōn de autōn epi tēs hodou ēlthen epi ti hydōr; kai phēsin ho eunouchos, Idou hydōr; ti kōlyei me baptisthēnai?',
   'As they continued their journey, they came upon ''a certain water'' (ἐπί τι ὕδωρ). The eunuch, having heard Philip''s explanation of Jesus and likely about baptism as a response to faith, immediately asked, ''See, here is water; what doth hinder me to be baptized?'' (Ἰδοὺ ὕδωρ· τί κωλύει με βαπτισθῆναι;). This spontaneous request indicates his genuine conversion and his desire to publicly identify with Christ through baptism, demonstrating the immediate call to obedience for new believers.',
   'The eunuch''s immediate request for baptism after hearing the gospel demonstrates the natural response of a converted heart. It highlights the early church''s practice of believer''s baptism as a public declaration of faith and obedience, signifying new life in Christ.'),
  (37,
   'And Philip said, If thou believest with all thine heart, thou mayest. And he answered and said, I believe that Jesus Christ is the Son of God.',
   '[εἶπεν δὲ ὁ Φίλιππος, Εἰ πιστεύεις ἐξ ὅλης τῆς καρδίας, ἔξεστιν. ἀποκριθεὶς δὲ εἶπεν, Πιστεύω τὸν Υἱὸν τοῦ Θεοῦ εἶναι τὸν Ἰησοῦν Χριστόν.]',
   '[Eipen de ho Philippos, Ei pisteueis ex holēs tēs kardias, exestin. Apokritheis de eipen, Pisteuō ton Huion tou Theou einai ton Iēsoun Christon.]',
   'This verse, though present in the KJV, is absent from many of the earliest and most reliable Greek manuscripts (e.g., Vaticanus, Sinaiticus, Alexandrinus) and is often bracketed or omitted in modern translations. If authentic, it emphasizes the prerequisite of ''believing with all thine heart'' (πιστεύεις ἐξ ὅλης τῆς καρδίας) for baptism. The eunuch''s confession, ''I believe that Jesus Christ is the Son of God'' (Πιστεύω τὸν Υἱὸν τοῦ Θεοῦ εἶναι τὸν Ἰησοῦν Χριστόν), articulates a foundational Christian doctrine.',
   'This verse (though textually debated) articulates the essential prerequisite for baptism: a heartfelt belief that ''Jesus Christ is the Son of God.'' It underscores that baptism is for believers who have made a conscious confession of faith, affirming Christ''s divine identity and authority.'),
  (38,
   'And he commanded the chariot to stand still: and they went down both into the water, both Philip and the eunuch; and he baptized him.',
   'καὶ ἐκέλευσεν στῆναι τὸ ἅρμα, καὶ κατέβησαν ἀμφότεροι εἰς τὸ ὕδωρ, ὅ τε Φίλιππος καὶ ὁ εὐνοῦχος, καὶ ἐβάπτισεν αὐτόν.',
   'Kai ekeleusen stēnai to harma, kai katebēsan amphoteroi eis to hydōr, ho te Philippos kai ho eunouchos, kai ebaptisen auton.',
   'The eunuch ''commanded the chariot to stand still'' (ἐκέλευσεν στῆναι τὸ ἅρμα). Then, ''they went down both into the water, both Philip and the eunuch'' (κατέβησαν ἀμφότεροι εἰς τὸ ὕδωρ, ὅ τε Φίλιππος καὶ ὁ εὐνοῦχος), and Philip ''baptized him'' (ἐβάπτισεν αὐτόν). The description of going ''into the water'' strongly suggests immersion, the common mode of baptism in the early church. This act completed the eunuch''s conversion, publicly signifying his new faith and cleansing.',
   'The act of both Philip and the eunuch going ''down into the water'' and the eunuch being ''baptized'' strongly implies immersion, the prevalent mode of baptism in the early church. This symbolizes death to sin and resurrection to new life in Christ, a public declaration of faith.'),
  (39,
   'And when they were come up out of the water, the Spirit of the Lord caught away Philip, that the eunuch saw him no more: and he went on his way rejoicing.',
   'ὅτε δὲ ἀνέβησαν ἐκ τοῦ ὕδατος, Πνεῦμα Κυρίου ἥρπασεν τὸν Φίλιππον, καὶ οὐκ εἶδεν αὐτὸν οὐκέτι ὁ εὐνοῦχος, ἐπορεύετο γὰρ τὴν ὁδὸν αὐτοῦ χαίρων.',
   'Hote de anebēsan ek tou hydatos, Pneuma Kyriou hērpasen ton Philippon, kai ouk eiden auton ouketi ho eunouchos, eporeueto gar tēn hodon autou chairōn.',
   'Immediately after the baptism, ''the Spirit of the Lord caught away Philip'' (Πνεῦμα Κυρίου ἥρπασεν τὸν Φίλιππον) in a supernatural manner, so that ''the eunuch saw him no more'' (οὐκ εἶδεν αὐτὸν οὐκέτι ὁ εὐνοῦχος). This miraculous transportation highlights the divine orchestration of the entire encounter. The eunuch, however, ''went on his way rejoicing'' (ἐπορεύετο γὰρ τὴν ὁδὸν αὐτοῦ χαίρων), indicating the profound joy and peace he found in his new faith, a testament to the transformative power of the gospel.',
   'Philip''s miraculous disappearance, orchestrated by the ''Spirit of the Lord,'' underscores the supernatural dimension of God''s work in evangelism. The eunuch''s subsequent ''rejoicing'' signifies the profound joy and peace that accompany genuine conversion and the reception of salvation.'),
  (40,
   'But Philip was found at Azotus: and passing through he preached in all the cities, till he came to Caesarea.',
   'Φίλιππος δὲ εὑρέθη εἰς Ἄζωτον, καὶ διερχόμενος εὐηγγελίζετο τὰς πόλεις πάσας ἕως τοῦ ἐλθεῖν αὐτὸν εἰς Καισάρειαν.',
   'Philippos de heurethē eis Azōton, kai dierchomenos euēggelizeto tas poleis pasas heōs tou elthein auton eis Kaisareian.',
   'Philip ''was found at Azotus'' (εὑρέθη εἰς Ἄζωτον), an ancient Philistine city, some 20 miles north of Gaza. From there, he ''preached in all the cities'' (εὐηγγελίζετο τὰς πόλεις πάσας) along the coastal plain until he reached ''Caesarea'' (εἰς Καισάρειαν), a major Roman port city. This demonstrates Philip''s continued, Spirit-led evangelistic ministry, establishing him as a key figure in the early church''s expansion and setting the stage for future events in Caesarea (Acts 21:8).',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 8;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('διωγμός', 'diōgmos', 'G1375', 'From ''diōkō'' (to pursue, persecute). It refers to persecution, harassment, or affliction. In the New Testament, it describes the hostile opposition faced by early Christians, often involving physical violence, imprisonment, and social ostracism. Here, it denotes the ''great persecution'' against the Jerusalem church, serving as a catalyst for the gospel''s spread.', 1),
  ('ἐκκλησία', 'ekklēsia', 'G1577', 'From ''ek'' (out) and ''kaleō'' (to call). It originally referred to an assembly of citizens. In the New Testament, it signifies the ''church,'' the assembly of believers called out by God. Here, it refers to the local Christian community in Jerusalem, which, despite persecution, remained the spiritual center before its dispersion.', 2),
  ('διεσπάρησαν', 'diesparēsan', 'G1287', 'Aorist passive indicative of ''diaspeirō'' (to scatter abroad, disperse). It describes the forced scattering of the Jerusalem believers due to persecution. This dispersion, though initially a hardship, became instrumental in fulfilling the Great Commission (Acts 1:8) by spreading the gospel beyond its initial confines.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = 1;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μαγεύων', 'mageuōn', 'G3096', 'Present active participle of ''mageuō'' (to practice magic, sorcery). It describes Simon''s occupation as a sorcerer, engaging in occult practices. This term highlights the pagan and superstitious environment in Samaria, where such practices were common, and sets up a contrast with the genuine divine power of the Holy Spirit.', 1),
  ('ἐξιστάνων', 'existānōn', 'G1839', 'Present active participle of ''existēmi'' (to amaze, astonish, bewilder). It describes the effect Simon''s sorcery had on the people, causing them to be ''bewitched'' or ''astounded.'' This suggests a deceptive influence, where people were captivated by his displays of power, mistaking it for divine authority.', 2),
  ('μέγαν', 'megan', 'G3173', 'Accusative masculine singular of ''megas'' (great, large). Simon claimed to be ''some great one,'' implying self-exaltation and a desire for recognition. This contrasts sharply with the humility of true spiritual leaders and the ultimate greatness of God, to whom all glory belongs.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = 9;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπίστευσαν', 'episteusan', 'G4100', 'Aorist active indicative of ''pisteuō'' (to believe, trust, have faith). It denotes a decisive act of faith. Here, the Samaritans ''believed'' Philip''s message about the kingdom of God and Jesus Christ, signifying their intellectual assent and personal commitment to the gospel, leading to their baptism.', 1),
  ('βασιλείας', 'basileias', 'G932', 'Genitive feminine singular of ''basileia'' (kingdom, reign, royalty). It refers to the ''kingdom of God,'' the sovereign rule of God, both present in Christ''s ministry and future in its full manifestation. Philip''s preaching centered on this kingdom, inviting people to submit to God''s reign through faith in Jesus.', 2),
  ('βαπτίζοντο', 'baptizonto', 'G907', 'Imperfect passive indicative of ''baptizō'' (to baptize, immerse). It describes the ongoing action of the Samaritans ''being baptized.'' This ritual act symbolized their repentance, cleansing from sin, and public identification with Jesus Christ, marking their entrance into the Christian community.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = 12;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀργύριόν', 'argyrion', 'G694', 'From ''argyros'' (silver). It refers to ''money,'' specifically silver coins. Peter''s rebuke to Simon, ''Thy money perish with thee,'' highlights the futility and danger of attempting to use material wealth to acquire spiritual gifts, emphasizing the spiritual bankruptcy of such an endeavor.', 1),
  ('ἀπώλειαν', 'apōleian', 'G684', 'From ''apollymi'' (to destroy, perish). It means ''destruction,'' ''ruin,'' or ''perdition.'' Peter''s strong words imply that Simon''s desire to buy spiritual power, rooted in a corrupt heart, would lead to his spiritual ruin, underscoring the severe consequences of misusing sacred things.', 2),
  ('δωρεὰν', 'dōrean', 'G1431', 'From ''dōron'' (a gift). It means ''a free gift,'' something given without expectation of return. Peter emphasizes that the Holy Spirit is ''the gift of God,'' freely bestowed by divine grace, not something that can be earned or purchased, contrasting it with Simon''s mercenary approach.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = 20;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χολὴν', 'cholēn', 'G5521', 'From ''cholos'' (gall, bile). It literally refers to the bitter fluid produced by the liver. Figuratively, as here in ''gall of bitterness,'' it signifies deep-seated malice, extreme wickedness, or a poisonous spiritual state, indicating Simon''s profound moral corruption and hostility towards God''s ways.', 1),
  ('πικρίας', 'pikrias', 'G4088', 'From ''pikros'' (bitter). It refers to ''bitterness,'' a state of deep resentment, animosity, or moral corruption. In this context, it describes the inner spiritual condition of Simon, characterized by a hostile and unrepentant attitude, despite his outward profession of faith.', 2),
  ('σύνδεσμον', 'syndesmon', 'G4886', 'From ''syndeō'' (to bind together). It means ''a bond,'' ''fetter,'' or ''chain.'' Here, ''bond of iniquity'' signifies being enslaved or held captive by sin and unrighteousness. Peter perceives Simon''s heart as being bound by his wicked desires, preventing him from genuine spiritual freedom.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = 23;

-- Verse 35
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀρξάμενος', 'arxamenos', 'G756', 'Aorist middle participle of ''archomai'' (to begin). It indicates that Philip ''began'' his explanation from the very scripture the eunuch was reading. This highlights the strategic and effective method of using the listener''s existing knowledge or questions as a starting point for gospel proclamation.', 1),
  ('γραφῆς', 'graphēs', 'G1124', 'Genitive feminine singular of ''graphē'' (writing, scripture). It refers to the sacred writings of the Old Testament. Philip''s approach demonstrates the authority and centrality of scripture in evangelism, showing how the Old Testament prophecies find their fulfillment in Jesus Christ.', 2),
  ('εὐηγγελίσατο', 'euēggelīsato', 'G2097', 'Aorist middle indicative of ''euangelizō'' (to preach the gospel, bring good news). This is the core action of Philip''s ministry: he ''preached Jesus'' to the eunuch. It signifies the proclamation of the good news of salvation through Christ, including His life, death, resurrection, and lordship, as the fulfillment of prophecy.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = 35;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Acts 7:58', 1),
  (1, 'Acts 9:1', 2),
  (1, 'Acts 1:8', 3),
  (1, 'Matt 10:23', 4),
  (1, 'Heb 10:32-34', 5),
  (2, 'Acts 7:60', 1),
  (2, 'Gen 50:10', 2),
  (2, '2 Sam 1:11-12', 3),
  (2, 'Luke 23:27', 4),
  (3, 'Acts 9:1-2', 1),
  (3, 'Acts 22:4', 2),
  (3, 'Acts 26:9-11', 3),
  (3, 'Gal 1:13', 4),
  (3, '1 Tim 1:13', 5),
  (4, 'Acts 11:19', 1),
  (4, 'Matt 10:23', 2),
  (4, 'Phil 1:12-14', 3),
  (4, '2 Tim 4:2', 4),
  (5, 'Acts 6:5', 1),
  (5, 'Acts 21:8', 2),
  (5, 'John 4:5', 3),
  (5, 'Acts 1:8', 4),
  (6, 'Acts 2:46', 1),
  (6, 'Acts 4:32', 2),
  (6, 'Mark 16:17-18', 3),
  (6, 'John 4:41-42', 4),
  (7, 'Mark 1:26', 1),
  (7, 'Acts 5:16', 2),
  (7, 'Matt 4:24', 3),
  (7, 'Luke 4:33-35', 4),
  (8, 'Luke 1:14', 1),
  (8, 'Luke 2:10', 2),
  (8, 'Acts 13:52', 3),
  (8, 'Rom 15:13', 4),
  (9, 'Acts 13:6', 1),
  (9, 'Exod 7:11', 2),
  (9, 'Deut 13:1-5', 3),
  (9, '2 Thess 2:9-10', 4),
  (10, 'John 7:48-49', 1),
  (10, 'Acts 5:36', 2),
  (10, '2 Thess 2:4', 3),
  (11, 'Gal 3:1', 1),
  (11, '2 Tim 3:13', 2),
  (11, 'Rev 13:13-14', 3),
  (12, 'Acts 2:38', 1),
  (12, 'Acts 19:4-5', 2),
  (12, 'Mark 16:16', 3),
  (12, 'Gal 3:27', 4),
  (12, 'Col 2:12', 5),
  (13, 'Matt 7:21-23', 1),
  (13, 'John 2:23-25', 2),
  (13, 'James 2:19', 3),
  (14, 'Acts 1:8', 1),
  (14, 'Acts 11:22', 2),
  (14, 'Acts 15:36', 3),
  (14, 'Gal 2:9', 4),
  (15, 'Acts 2:38', 1),
  (15, 'Acts 19:2', 2),
  (15, 'John 7:39', 3),
  (15, 'Gal 3:2', 4),
  (16, 'Acts 2:38', 1),
  (16, 'Acts 10:48', 2),
  (16, 'Acts 19:5-6', 3),
  (16, '1 Cor 1:13', 4),
  (17, 'Acts 6:6', 1),
  (17, 'Acts 19:6', 2),
  (17, 'Heb 6:2', 3),
  (17, '2 Tim 1:6', 4),
  (18, 'Acts 2:38', 1),
  (18, 'Matt 10:8', 2),
  (18, '2 Kings 5:16', 3),
  (19, 'Acts 19:13-16', 1),
  (19, 'Num 22:7', 2),
  (19, 'Jude 1:11', 3),
  (20, '2 Kings 5:20-27', 1),
  (20, 'Matt 10:8', 2),
  (20, 'Rom 6:23', 3),
  (20, '1 Tim 6:5', 4),
  (21, 'Deut 18:21', 1),
  (21, 'Josh 22:25', 2),
  (21, 'Ps 78:37', 3),
  (21, 'Heb 12:15', 4),
  (22, 'Acts 2:38', 1),
  (22, 'Dan 4:27', 2),
  (22, '2 Tim 2:25', 3),
  (22, '1 John 5:16', 4),
  (23, 'Deut 29:18', 1),
  (23, 'Heb 12:15', 2),
  (23, 'Isa 58:6', 3),
  (23, 'Rom 6:17-20', 4),
  (24, 'Exod 8:28', 1),
  (24, 'Exod 10:17', 2),
  (24, 'Num 21:7', 3),
  (24, '1 Kings 13:6', 4),
  (25, 'Acts 14:7', 1),
  (25, 'Acts 15:3', 2),
  (25, 'Acts 1:8', 3),
  (25, 'Luke 9:6', 4),
  (26, 'Acts 10:3', 1),
  (26, 'Acts 16:9-10', 2),
  (26, 'Ps 107:7', 3),
  (26, 'Josh 15:47', 4),
  (27, 'Zeph 3:10', 1),
  (27, 'Isa 56:3-5', 2),
  (27, 'John 12:20', 3),
  (27, '1 Kings 8:41-43', 4),
  (28, 'Isa 53:7-8', 1),
  (28, 'Luke 24:27', 2),
  (28, 'Col 3:16', 3),
  (29, 'Acts 10:19', 1),
  (29, 'Acts 13:2', 2),
  (29, 'Acts 16:6-7', 3),
  (29, 'Rom 8:14', 4),
  (30, 'Matt 13:23', 1),
  (30, 'Eph 5:17', 2),
  (30, 'Col 1:9', 3),
  (31, 'Ps 25:9', 1),
  (31, 'Prov 2:6', 2),
  (31, 'John 16:13', 3),
  (31, '1 Cor 12:1-11', 4),
  (32, 'Isa 53:7', 1),
  (32, 'Matt 26:63', 2),
  (32, 'Mark 14:61', 3),
  (32, '1 Pet 2:23', 4),
  (33, 'Isa 53:8', 1),
  (33, 'Dan 9:26', 2),
  (33, 'Matt 27:24', 3),
  (33, 'Luke 23:25', 4),
  (34, 'Luke 24:27', 1),
  (34, 'John 5:39', 2),
  (34, '1 Pet 1:10-12', 3),
  (35, 'Luke 24:27', 1),
  (35, 'Luke 24:44', 2),
  (35, 'Acts 18:28', 3),
  (35, 'Rom 10:14', 4),
  (36, 'Acts 10:47', 1),
  (36, 'Acts 16:33', 2),
  (36, 'Matt 28:19', 3),
  (36, 'Mark 16:16', 4),
  (37, 'Acts 16:31', 1),
  (37, 'Rom 10:9-10', 2),
  (37, '1 John 4:15', 3),
  (37, '1 John 5:5', 4),
  (38, 'Matt 3:16', 1),
  (38, 'John 3:23', 2),
  (38, 'Rom 6:3-4', 3),
  (38, 'Col 2:12', 4),
  (39, '1 Kings 18:12', 1),
  (39, '2 Kings 2:16', 2),
  (39, 'Ezek 3:14', 3),
  (39, 'Ps 119:14', 4),
  (39, 'Rom 5:11', 5),
  (40, 'Acts 9:32', 1),
  (40, 'Acts 10:1', 2),
  (40, 'Acts 21:8', 3),
  (40, 'Mark 16:20', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 8 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 8 Complete!
-- 40 verses · 6 key verses with word studies (18 words)
-- Cross-references for 40 verses (156 refs)
-- ═══════════════════════════════════════════════════════