-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 2 — Pentecost: The Spirit's Outpouring, Peter's Proclamation, and the Church's Birth
-- 47 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Acts Chapter 2 marks the pivotal event of Pentecost, fulfilling Old Testament prophecies and inaugurating the New Covenant era. The outpouring of the Holy Spirit empowers the disciples to speak in diverse languages, enabling a multitude of Jews from various nations to hear the gospel in their native tongues. Peter, standing with the eleven, delivers a powerful sermon, interpreting the Spirit''s manifestation through Joel''s prophecy and proclaiming the resurrection and exaltation of Jesus as Lord and Christ. His message convicts many, leading to the baptism of about three thousand new believers and the formation of the early Christian community, characterized by devotion, fellowship, and communal living. This chapter is foundational for understanding the birth of the Church, the role of the Holy Spirit, and the core message of the gospel.',
  'Pentecost: The Spirit''s Outpouring, Peter''s Proclamation, and the Church''s Birth',
  'Πνεῦμα (Pneuma)',
  'Derived from ''pneō'' (to breathe, blow), ''Pneuma'' refers to spirit, wind, or breath. In Acts 2, it primarily denotes the Holy Spirit, the third person of the Trinity, whose outpouring at Pentecost signifies the fulfillment of God''s promise, empowering believers for witness and establishing the Church as a Spirit-filled community. It represents divine life, power, and presence.',
  '["Section 1 (vv. 1-4): The Coming of the Holy Spirit at Pentecost","Section 2 (vv. 5-13): The Multitude''s Amazement and Mockery","Section 3 (vv. 14-21): Peter''s Sermon: The Prophecy of Joel Fulfilled","Section 4 (vv. 22-36): Peter''s Sermon: The Resurrection and Exaltation of Jesus","Section 5 (vv. 37-41): The People''s Conviction and Peter''s Call to Repentance","Section 6 (vv. 42-47): The Life and Growth of the Early Church"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 47 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And when the day of Pentecost was fully come, they were all with one accord in one place.',
   'Καὶ ἐν τῷ συμπληροῦσθαι τὴν ἡμέραν τῆς Πεντηκοστῆς ἦσαν πάντες ὁμοῦ ἐπὶ τὸ αὐτὸ.',
   'Kai en tō symplērousthai tēn hēmeran tēs Pentēkostēs ēsan pantes homou epi to auto.',
   'The ''day of Pentecost'' (Πεντηκοστῆς) was a Jewish festival, fifty days after Passover, celebrating the harvest and commemorating the giving of the Law at Sinai. Its fulfillment here signifies a new covenant, marked by the giving of the Spirit. The phrase ''with one accord'' (ὁμοῦ ἐπὶ τὸ αὐτὸ) emphasizes the unity and expectation of the disciples, a crucial element for receiving God''s blessing (cf. Ps 133:1). This unity sets the stage for the dramatic events that follow.',
   'Pentecost marks the birth of the Church, where the Holy Spirit is poured out on all believers, not just a select few. This event signifies a new era of God''s direct indwelling and empowerment for His people, fulfilling Christ''s promise (John 14:16-17, Acts 1:8).'),
  (2,
   'And suddenly there came a sound from heaven as of a rushing mighty wind, and it filled all the house where they were sitting.',
   'καὶ ἐγένετο ἄφνω ἐκ τοῦ οὐρανοῦ ἦχος ὥσπερ φερομένης πνοῆς βιαίας, καὶ ἐπλήρωσεν ὅλον τὸν οἶκον οὗ ἦσαν καθήμενοι·',
   'kai egeneto aphnō ek tou ouranou ēchos hōsper pheromenēs pnoēs biaias, kai eplērōsen holon ton oikon hou ēsan kathēmenoi;',
   'The sudden sound ''from heaven'' (ἐκ τοῦ οὐρανοῦ) like a ''rushing mighty wind'' (πνοῆς βιαίας) is a powerful sensory manifestation of God''s presence, reminiscent of Old Testament theophanies (e.g., Exod 19:16-19). Wind (πνοή/πνεῦμα) is often associated with the Spirit in both Hebrew (ruach) and Greek. It filled ''all the house,'' indicating a pervasive and unmistakable divine intervention, preparing them for the visible sign that followed.',
   'The ''rushing mighty wind'' symbolizes the invisible yet powerful presence of the Holy Spirit. This physical manifestation underscores the reality and transformative power of God''s Spirit, which is not merely an abstract concept but an active, dynamic force.'),
  (3,
   'And there appeared unto them cloven tongues like as of fire, and it sat upon each of them.',
   'καὶ ὤφθησαν αὐτοῖς διαμεριζόμεναι γλῶσσαι ὡσεὶ πυρός, ἐκάθισέν τε ἐφ’ ἕνα ἕκαστον αὐτῶν·',
   'kai ōphthēsan autois diamerizomenai glōssai hōsei pyros, ekathisen te eph’ hena hekaston autōn;',
   'The ''cloven tongues like as of fire'' (γλῶσσαι ὡσεὶ πυρός) are a visible sign, complementing the audible wind. Fire in Scripture often symbolizes God''s presence, purification, and judgment (Exod 3:2, Isa 6:6-7). The ''cloven'' (διαμεριζόμεναι) aspect suggests distribution, emphasizing that the Spirit''s gift was individual yet unified. This imagery directly connects to the subsequent speaking in ''other tongues,'' indicating divine empowerment for communication.',
   'The ''tongues as of fire'' signify the purifying and empowering presence of the Holy Spirit. This visible sign confirms the divine origin of the experience and foreshadows the Spirit''s role in enabling believers to speak God''s word with power and clarity.'),
  (4,
   'And they were all filled with the Holy Ghost, and began to speak with other tongues, as the Spirit gave them utterance.',
   'καὶ ἐπλήσθησαν πάντες Πνεύματος Ἁγίου, καὶ ἤρξαντο λαλεῖν ἑτέραις γλώσσαις καθὼς τὸ Πνεῦμα ἐδίδου αὐτοῖς ἀποφθέγγεσθαι.',
   'kai eplēsthēsan pantes Pneumatos Hagiou, kai ērxanto lalein heterais glōssais kathōs to Pneuma edidou autois apophthengesthai.',
   'The disciples were ''filled with the Holy Ghost'' (ἐπλήσθησαν πάντες Πνεύματος Ἁγίου), a recurring phrase in Acts denoting divine empowerment for specific tasks, especially witness. They began to ''speak with other tongues'' (λαλεῖν ἑτέραις γλώσσαις), meaning actual human languages previously unknown to them, as confirmed by the crowd''s reaction (vv. 6-11). This was not ecstatic utterance but Spirit-given communication, enabling the gospel to transcend linguistic barriers.',
   'Being ''filled with the Holy Spirit'' is a transformative experience, empowering believers to speak God''s message. The gift of ''other tongues'' demonstrates the Spirit''s power to overcome human limitations and facilitate the global spread of the gospel, uniting diverse peoples under Christ.'),
  (5,
   'And there were dwelling at Jerusalem Jews, devout men, out of every nation under heaven.',
   'Ἦσαν δὲ ἐν Ἱερουσαλὴμ κατοικοῦντες Ἰουδαῖοι, ἄνδρες εὐλαβεῖς ἀπὸ παντὸς ἔθνους τῶν ὑπὸ τὸν οὐρανόν·',
   'Ēsan de en Hierousalēm katoikountes Ioudaioi, andres eulabeis apo pantos ethnous tōn hypo ton ouranon;',
   'Jerusalem was a melting pot, especially during festivals. The ''Jews, devout men'' (Ἰουδαῖοι, ἄνδρες εὐλαβεῖς) were either native Jews who had settled abroad and returned, or proselytes (Gentile converts to Judaism). The phrase ''out of every nation under heaven'' (ἀπὸ παντὸς ἔθνους τῶν ὑπὸ τὸν οὐρανόν) highlights the global reach of the Jewish diaspora, providentially gathered to witness the Spirit''s outpouring and hear the gospel in their own languages.',
   NULL),
  (6,
   'Now when this was noised abroad, the multitude came together, and were confounded, because that every man heard them speak in his own language.',
   'γενομένης δὲ τῆς φωνῆς ταύτης συνῆλθε τὸ πλῆθος καὶ συνεχύθη, ὅτι ἤκουον εἷς ἕκαστος τῇ ἰδίᾳ διαλέκτῳ λαλούντων αὐτῶν.',
   'genomenēs de tēs phōnēs tautēs synēlthe to plēthos kai synechythē, hoti ēkouon heis hekastos tē idia dialektō lalountōn autōn.',
   'The ''sound'' (φωνῆς) that drew the crowd was likely the collective speaking in tongues, not the ''rushing wind'' of v. 2, which was confined to the house. The multitude was ''confounded'' (συνεχύθη), meaning confused or bewildered, because each person heard the disciples speaking ''in his own language'' (τῇ ἰδίᾳ διαλέκτῳ). This miraculous communication directly addressed the linguistic diversity of the diaspora, reversing the curse of Babel (Gen 11:1-9).',
   'The reversal of Babel''s curse through the gift of tongues signifies God''s intention to unite humanity through the gospel, transcending linguistic and cultural barriers. The Holy Spirit empowers believers to communicate God''s truth effectively to all peoples.'),
  (7,
   'And they were all amazed and marvelled, saying one to another, Behold, are not all these which speak Galilaeans?',
   'ἐξίσταντο δὲ πάντες καὶ ἐθαύμαζον λέγοντες, Οὐχὶ ἰδοὺ πάντες οὗτοι οἱ λαλοῦντες Γαλιλαῖοί εἰσιν;',
   'existanto de pantes kai ethaumazon legontes, Ouchi idou pantes houtoi hoi lalountes Galilaioi eisin?',
   'The crowd''s amazement (ἐξίσταντο καὶ ἐθαύμαζον) stemmed from the fact that the speakers were ''Galilaeans'' (Γαλιλαῖοι). Galilee was a region often looked down upon by Judeans, known for its rustic inhabitants and distinct accent (Matt 26:73). The implication is that these uneducated or common people could not naturally possess such linguistic abilities, highlighting the supernatural nature of the event.',
   NULL),
  (8,
   'And how hear we every man in our own tongue, wherein we were born?',
   'καὶ πῶς ἡμεῖς ἀκούομεν ἕκαστος τῇ ἰδίᾳ διαλέκτῳ ἡμῶν ἐν ᾗ ἐγεννήθημεν;',
   'kai pōs hēmeis akouomen hekastos tē idia dialektō hēmōn en hē egennēthēmen?',
   'The question ''how hear we every man in our own tongue, wherein we were born?'' (πῶς ἡμεῖς ἀκούομεν ἕκαστος τῇ ἰδίᾳ διαλέκτῳ ἡμῶν ἐν ᾗ ἐγεννήθημεν;) underscores the miraculous nature of the event. It wasn''t just that they understood, but that they heard the gospel proclaimed in their native ''dialect'' (διαλέκτῳ), the language they grew up speaking. This personal connection made the message profoundly impactful and undeniable.',
   NULL),
  (9,
   'Parthians, and Medes, and Elamites, and the dwellers in Mesopotamia, and in Judaea, and Cappadocia, in Pontus, and Asia,',
   'Πάρθοι καὶ Μῆδοι καὶ Ἐλαμῖται, καὶ οἱ κατοικοῦντες τὴν Μεσοποταμίαν, Ἰουδαίαν τε καὶ Καππαδοκίαν, Πόντον καὶ τὴν Ἀσίαν,',
   'Parthoi kai Mēdoi kai Elamitai, kai hoi katoikountes tēn Mesopotamian, Ioudaian te kai Kappadokian, Ponton kai tēn Asian,',
   'Luke provides a detailed list of regions, starting from the east (Parthia, Media, Elam) and moving westward. This geographical scope emphasizes the global reach of the Jewish diaspora and, by extension, the universal appeal of the gospel. ''Asia'' here refers to the Roman province of Asia Minor, not the continent. The inclusion of ''Judaea'' is interesting, perhaps referring to Jews from other parts of Judea or those who spoke Aramaic but understood the Greek spoken by some disciples.',
   NULL),
  (10,
   'Phrygia, and Pamphylia, in Egypt, and in the parts of Libya about Cyrene, and strangers of Rome, Jews and proselytes,',
   'Φρυγίαν τε καὶ Παμφυλίαν, Αἴγυπτον καὶ τὰ μέρη τῆς Λιβύης τῆς κατὰ Κυρήνην, καὶ οἱ ἐπιδημοῦντες Ῥωμαῖοι, Ἰουδαῖοί τε καὶ προσήλυτοι,',
   'Phrygian te kai Pamphylian, Aigypton kai ta merē tēs Libyēs tēs kata Kyrēnēn, kai hoi epidēmountes Rhōmaioi, Ioudaioi te kai prosēlytoi,',
   'The list continues, covering North Africa (Egypt, Libya around Cyrene) and even ''strangers of Rome'' (οἱ ἐπιδημοῦντες Ῥωμαῖοι). The distinction between ''Jews and proselytes'' (Ἰουδαῖοί τε καὶ προσήλυτοι) is important. ''Proselytes'' were Gentiles who had fully converted to Judaism, undergoing circumcision and baptism. This shows that the audience included both ethnic Jews and Gentile converts, foreshadowing the gospel''s expansion beyond ethnic Israel.',
   'The presence of ''proselytes'' alongside ''Jews'' highlights the early inclusivity of God''s redemptive plan, extending salvation beyond ethnic boundaries to all who embrace the faith. This foreshadows the full inclusion of Gentiles into the Church.'),
  (11,
   'Cretes and Arabians, we do hear them speak in our tongues the wonderful works of God.',
   'Κρῆτες καὶ Ἄραβες, ἀκούομεν λαλούντων αὐτῶν ταῖς ἡμετέραις γλώσσαις τὰ μεγαλεῖα τοῦ Θεοῦ.',
   'Krētes kai Arabes, akouomen lalountōn autōn tais hēmeterais glōssais ta megaleia tou Theou.',
   'The list concludes with ''Cretes and Arabians.'' The crucial point is that they heard ''in our tongues the wonderful works of God'' (ταῖς ἡμετέραις γλώσσαις τὰ μεγαλεῖα τοῦ Θεοῦ). ''Wonderful works'' (μεγαλεῖα) refers to God''s mighty acts of salvation, culminating in Christ''s death and resurrection. This content confirms that the tongues were not random utterances but intelligible proclamation of the gospel, designed to bring glory to God and conviction to listeners.',
   'The content of the Spirit-inspired speech—''the wonderful works of God''—emphasizes that the purpose of spiritual gifts is to glorify God and proclaim His saving acts. This serves as a model for all Spirit-empowered ministry.'),
  (12,
   'And they were all amazed, and were in doubt, saying one to another, What meaneth this?',
   'ἐξίσταντο δὲ πάντες καὶ διηποροῦντο, ἄλλος πρὸς ἄλλον λέγοντες, Τί ἄρα θέλει τοῦτο εἶναι;',
   'existanto de pantes kai diēporounto, allos pros allon legontes, Ti ara thelei touto einai?',
   'The crowd''s reaction moves from simple amazement (ἐξίσταντο) to being ''in doubt'' or perplexed (διηποροῦντο). They questioned, ''What meaneth this?'' (Τί ἄρα θέλει τοῦτο εἶναι;), indicating a desire for understanding beyond mere observation. This open question provides the perfect opportunity for Peter to step forward and offer a Spirit-inspired explanation, bridging the miraculous event with theological truth.',
   NULL),
  (13,
   'Others mocking said, These men are full of new wine.',
   'ἕτεροι δὲ χλευάζοντες ἔλεγον, ὅτι Γλεύκους μεμεστωμένοι εἰσίν.',
   'heteroi de chleuazontes elegon, hoti Gleukous memestōmenoi eisin.',
   'Not all were open to understanding. ''Others mocking'' (ἕτεροι δὲ χλευάζοντες) attributed the disciples'' behavior to drunkenness, specifically being ''full of new wine'' (Γλεύκους μεμεστωμένοι). ''New wine'' (γλεύκος) was freshly fermented wine, thought to be more intoxicating. This dismissive explanation reflects skepticism and resistance to the supernatural, a common human reaction to divine intervention (cf. 1 Cor 1:23).',
   NULL),
  (14,
   'But Peter, standing up with the eleven, lifted up his voice, and said unto them, Ye men of Judaea, and all ye that dwell at Jerusalem, be this known unto you, and hearken to my words:',
   'Σταθεὶς δὲ ὁ Πέτρος σὺν τοῖς ἕνδεκα ἐπῆρεν τὴν φωνὴν αὐτοῦ καὶ ἀπεφθέγξατο αὐτοῖς, Ἄνδρες Ἰουδαῖοι καὶ οἱ κατοικοῦντες Ἱερουσαλὴμ πάντες, τοῦτο ὑμῖν γνωστὸν ἔστω καὶ ἐνωτίσασθε τὰ ῥήματά μου.',
   'Statheis de ho Petros syn tois hendeka epēren tēn phōnēn autou kai apephthenxato autois, Andres Ioudaioi kai hoi katoikountes Hierousalēm pantes, touto hymin gnōston estō kai enōtisasthe ta rhēmata mou.',
   'Peter, who had previously denied Christ, now boldly ''standing up with the eleven'' (σὺν τοῖς ἕνδεκα) and ''lifted up his voice'' (ἐπῆρεν τὴν φωνὴν αὐτοῦ), empowered by the Holy Spirit. His address to ''men of Judaea, and all ye that dwell at Jerusalem'' (Ἄνδρες Ἰουδαῖοι καὶ οἱ κατοικοῦντες Ἱερουσαλὴμ πάντες) is a direct, authoritative call to attention, signaling the beginning of the first Christian sermon. This marks a significant transformation in Peter''s character.',
   'Peter''s transformation from fearful denier to bold preacher exemplifies the Spirit''s power to equip and empower believers for witness. His sermon, the first public proclamation of the gospel, sets the pattern for evangelism in the early church.'),
  (15,
   'For these are not drunken, as ye suppose, seeing it is but the third hour of the day.',
   'οὐ γὰρ ὡς ὑμεῖς ὑπολαμβάνετε οὗτοι μεθύουσιν, ἔστιν γὰρ ὥρα τρίτη τῆς ἡμέρας·',
   'ou gar hōs hymeis hypolambanete houtoi methyousin, estin gar hōra tritē tēs hēmeras;',
   'Peter immediately refutes the accusation of drunkenness. He points out that it was only ''the third hour of the day'' (ὥρα τρίτη τῆς ἡμέρας), which is about 9:00 AM. In Jewish custom, people did not typically drink wine at this early hour, especially devout Jews. This logical argument discredits the mockers and opens the door for Peter to offer the true explanation for the miraculous events.',
   NULL),
  (16,
   'But this is that which was spoken by the prophet Joel;',
   'ἀλλὰ τοῦτό ἐστιν τὸ εἰρημένον διὰ τοῦ προφήτου Ἰωήλ·',
   'alla touto estin to eirēmenon dia tou prophētou Iōēl;',
   'Peter transitions from refutation to explanation, declaring that the events are a fulfillment of prophecy. He states, ''But this is that which was spoken by the prophet Joel'' (τοῦτό ἐστιν τὸ εἰρημένον διὰ τοῦ προφήτου Ἰωήλ). This immediately grounds the miraculous in the continuity of God''s redemptive plan, appealing to the Jewish audience''s reverence for the Old Testament Scriptures. Joel''s prophecy (Joel 2:28-32) foretold a future outpouring of God''s Spirit.',
   'Peter''s appeal to Joel''s prophecy demonstrates that the outpouring of the Spirit at Pentecost was not a random event but a divinely orchestrated fulfillment of God''s ancient promises, validating the new covenant era.'),
  (17,
   'And it shall come to pass in the last days, saith God, I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams:',
   'Καὶ ἔσται ἐν ταῖς ἐσχάταις ἡμέραις, λέγει ὁ Θεός, ἐκχεῶ ἀπὸ τοῦ Πνεύματός μου ἐπὶ πᾶσαν σάρκα, καὶ προφητεύσουσιν οἱ υἱοὶ ὑμῶν καὶ αἱ θυγατέρες ὑμῶν, καὶ οἱ νεανίσκοι ὑμῶν ὁράσεις ὄψονται, καὶ οἱ πρεσβύτεροι ὑμῶν ἐνύπνια ἐνυπνιασθήσονται·',
   'Kai estai en tais eschatais hēmerais, legei ho Theos, ekcheō apo tou Pneumatos mou epi pasan sarka, kai prophēteusousin hoi huioi hymōn kai hai thugateres hymōn, kai hoi neaniskoi hymōn horaseis opsontai, kai hoi presbyteroi hymōn enypnia enypniasthēsontai;',
   'Peter quotes Joel 2:28-29, emphasizing ''in the last days'' (ἐν ταῖς ἐσχάταις ἡμέραις), a phrase signifying the Messianic era initiated by Christ. The promise ''I will pour out of my Spirit upon all flesh'' (ἐκχεῶ ἀπὸ τοῦ Πνεύματός μου ἐπὶ πᾶσαν σάρκα) is revolutionary, indicating a universal outpouring beyond priests and prophets. It includes ''sons and daughters,'' ''young men,'' and ''old men,'' highlighting the Spirit''s egalitarian distribution regardless of age, gender, or social status.',
   'The ''last days'' signify the period between Christ''s first and second comings, characterized by the universal outpouring of the Holy Spirit. This democratizes spiritual experience, enabling all believers to prophesy, see visions, and dream dreams, demonstrating God''s direct communication with His people.'),
  (18,
   'And on my servants and on my handmaidens I will pour out in those days of my Spirit; and they shall prophesy:',
   'καί γε ἐπὶ τοὺς δούλους μου καὶ ἐπὶ τὰς δούλας μου ἐν ταῖς ἡμέραις ἐκείναις ἐκχεῶ ἀπὸ τοῦ Πνεύματός μου, καὶ προφητεύσουσιν.',
   'kai ge epi tous doulous mou kai epi tas doulas mou en tais hēmerais ekeinais ekcheō apo tou Pneumatos mou, kai prophēteusousin.',
   'This verse further emphasizes the universal nature of the Spirit''s outpouring, extending to ''my servants and on my handmaidens'' (ἐπὶ τοὺς δούλους μου καὶ ἐπὶ τὰς δούλας μου). This includes those of lower social standing, reinforcing the idea that God''s Spirit transcends societal distinctions. The result is that ''they shall prophesy'' (προφητεύσουσιν), indicating Spirit-inspired speech that declares God''s truth, which aligns with the speaking in tongues observed.',
   'The Spirit''s outpouring on ''servants and handmaidens'' underscores the radical inclusivity of the new covenant. Social status, gender, or age do not restrict access to God''s Spirit or the ability to minister prophetically, demonstrating God''s impartial grace.'),
  (19,
   'And I will shew wonders in heaven above, and signs in the earth beneath; blood, and fire, and vapour of smoke:',
   'καὶ δώσω τέρατα ἐν τῷ οὐρανῷ ἄνω καὶ σημεῖα ἐπὶ τῆς γῆς κάτω, αἷμα καὶ πῦρ καὶ ἀτμίδα καπνοῦ·',
   'kai dōsō terata en tō ouranō anō kai sēmeia epi tēs gēs katō, haima kai pyr kai atmida kapnou;',
   'Peter continues quoting Joel, shifting to cosmic signs that precede the ''day of the Lord.'' These ''wonders in heaven above, and signs in the earth beneath'' (τέρατα ἐν τῷ οὐρανῷ ἄνω καὶ σημεῖα ἐπὶ τῆς γῆς κάτω) include ''blood, and fire, and vapour of smoke'' (αἷμα καὶ πῦρ καὶ ἀτμίδα καπνοῦ). While these specific signs might refer to future eschatological events, Peter uses them to highlight the gravity and divine origin of the current spiritual outpouring, connecting it to God''s ultimate plan.',
   NULL),
  (20,
   'The sun shall be turned into darkness, and the moon into blood, before that great and notable day of the Lord come:',
   'ὁ ἥλιος μεταστραφήσεται εἰς σκότος καὶ ἡ σελήνη εἰς αἷμα, πρὶν ἐλθεῖν ἡμέραν Κυρίου τὴν μεγάλην καὶ ἐπιφανῆ.',
   'ho hēlios metastraphēsetai eis skotos kai hē selēnē eis haima, prin elthein hēmeran Kyriou tēn megalēn kai epiphanē.',
   'The cosmic disturbances continue with ''the sun shall be turned into darkness, and the moon into blood'' (ὁ ἥλιος μεταστραφήσεται εἰς σκότος καὶ ἡ σελήνη εἰς αἷμα). These dramatic images serve as harbingers of ''that great and notable day of the Lord'' (ἡμέραν Κυρίου τὴν μεγάλην καὶ ἐπιφανῆ). Peter''s inclusion of these verses from Joel emphasizes that the Pentecost event is not an isolated incident but part of God''s overarching eschatological plan, leading to Christ''s return and final judgment.',
   'The cosmic signs described by Joel point to the eschatological significance of Christ''s work. The ''day of the Lord'' encompasses both judgment and salvation, and the Spirit''s outpouring signals the beginning of the end-times, urging repentance before Christ''s final return.'),
  (21,
   'And it shall come to pass, that whosoever shall call on the name of the Lord shall be saved.',
   'καὶ ἔσται πᾶς ὃς ἂν ἐπικαλέσηται τὸ ὄνομα Κυρίου σωθήσεται.',
   'kai estai pas hos an epikalesētai to onoma Kyriou sōthēsetai.',
   'This verse, also from Joel, presents a crucial promise: ''whosoever shall call on the name of the Lord shall be saved'' (πᾶς ὃς ἂν ἐπικαλέσηται τὸ ὄνομα Κυρίου σωθήσεται). Peter uses ''Lord'' (Κυρίου) here, which in the Septuagint (Greek Old Testament) translates the Hebrew YHWH. By applying this to Jesus later in his sermon, Peter subtly connects Jesus to the divine identity of the Lord, offering salvation through Him. This promise is universal, extending to ''whosoever'' believes.',
   'This verse offers a universal promise of salvation to ''whosoever shall call on the name of the Lord.'' Peter''s sermon will reveal that ''the Lord'' refers to Jesus Christ, making faith in Him the sole path to salvation. This highlights God''s gracious provision for all humanity.'),
  (22,
   'Ye men of Israel, hear these words; Jesus of Nazareth, a man approved of God among you by miracles and wonders and signs, which God did by him in the midst of you, as ye yourselves also know:',
   'Ἄνδρες Ἰσραηλῖται, ἀκούσατε τοὺς λόγους τούτους· Ἰησοῦν τὸν Ναζωραῖον, ἄνδρα ἀπὸ τοῦ Θεοῦ ἀποδεδειγμένον εἰς ὑμᾶς δυνάμεσι καὶ τέρασι καὶ σημείοις, οἷς ἐποίησεν δι’ αὐτοῦ ὁ Θεὸς ἐν μέσῳ ὑμῶν, καθὼς καὶ αὐτοὶ οἴδατε,',
   'Andres Israēlitai, akousate tous logous toutous; Iēsoun ton Nazōraion, andra apo tou Theou apodedigmenon eis hymas dynamesi kai terasi kai sēmeiois, hois epoiēsen di’ autou ho Theos en mesō hymōn, kathōs kai autoi oidate,',
   'Peter shifts from prophecy to the person of Jesus, addressing his audience as ''Ye men of Israel'' (Ἄνδρες Ἰσραηλῖται). He presents ''Jesus of Nazareth'' (Ἰησοῦν τὸν Ναζωραῖον) as ''a man approved of God'' (ἄνδρα ἀπὸ τοῦ Θεοῦ ἀποδεδειγμένον) through ''miracles and wonders and signs'' (δυνάμεσι καὶ τέρασι καὶ σημείοις). These acts, performed ''by him in the midst of you,'' were publicly known, making the audience eyewitnesses to God''s work through Jesus. This establishes Jesus'' divine accreditation.',
   'Jesus'' miracles, wonders, and signs were not mere displays of power but divine attestations, proving His unique relationship with God and validating His messianic claims. These acts served as undeniable evidence of God''s approval and presence in Jesus.'),
  (23,
   'Him, being delivered by the determinate counsel and foreknowledge of God, ye have taken, and by wicked hands have crucified and slain:',
   'τοῦτον τῇ ὡρισμένῃ βουλῇ καὶ προγνώσει τοῦ Θεοῦ ἔκδοτον διὰ χειρὸς ἀνόμων προσπήξαντες ἀνείλατε·',
   'touton tē horismenē boulē kai prognōsei tou Theou ekdoton dia cheiros anomōn prospēxantes aneilete;',
   'Peter confronts the audience with their culpability. Jesus was ''delivered by the determinate counsel and foreknowledge of God'' (τῇ ὡρισμένῃ βουλῇ καὶ προγνώσει τοῦ Θεοῦ ἔκδοτον), emphasizing God''s sovereign plan in His crucifixion. Yet, this divine plan does not absolve human responsibility: ''ye have taken, and by wicked hands have crucified and slain'' (διὰ χειρὸς ἀνόμων προσπήξαντες ἀνείλατε). The term ''wicked hands'' (χειρὸς ἀνόμων) likely refers to the Roman authorities, but the ''ye'' (ὑμεῖς) holds the Jewish leaders and people responsible for instigating the act.',
   'This verse presents the profound theological truth of God''s sovereignty alongside human responsibility. Jesus'' crucifixion was part of God''s ''determinate counsel and foreknowledge,'' yet those who crucified Him are held accountable for their ''wicked hands.'' This paradox highlights God''s ability to use human sin for His redemptive purposes.'),
  (24,
   'Whom God hath raised up, having loosed the pains of death: because it was not possible that he should be holden of it.',
   'ὃν ὁ Θεὸς ἀνέστησεν λύσας τὰς ὠδῖνας τοῦ θανάτου, καθότι οὐκ ἦν δυνατὸν κρατεῖσθαι αὐτὸν ὑπ’ αὐτῆς.',
   'hon ho Theos anestēsen lysas tas ōdinas tou thanatou, kathoti ouk ēn dynaton krateisthai auton hyp’ autēs.',
   'The climax of Peter''s argument: ''Whom God hath raised up'' (ὃν ὁ Θεὸς ἀνέστησεν). The resurrection is God''s vindication of Jesus and the central truth of the gospel. God ''loosed the pains of death'' (λύσας τὰς ὠδῖνας τοῦ θανάτου). ''Pains'' (ὠδῖνας) can also mean ''birth pangs,'' suggesting death''s inability to hold Jesus, like a womb that cannot hold a newborn. It was ''not possible that he should be holden of it'' (οὐκ ἦν δυνατὸν κρατεῖσθαι αὐτὸν ὑπ’ αὐτῆς) because of His divine nature and sinlessness.',
   'The resurrection of Jesus is the cornerstone of Christian faith. God ''loosed the pains of death'' because death had no rightful claim on the sinless Christ. His resurrection demonstrates God''s power over sin and death, validating Jesus'' identity as the Son of God and securing salvation for believers.'),
  (25,
   'For David speaketh concerning him, I foresaw the Lord always before my face, for he is on my right hand, that I should not be moved:',
   'Δαυὶδ γὰρ λέγει εἰς αὐτόν, Προορώμην τὸν Κύριον ἐνώπιόν μου διὰ παντός, ὅτι ἐκ δεξιῶν μου ἐστίν, ἵνα μὴ σαλευθῶ.',
   'Dauid gar legei eis auton, Proorōmēn ton Kyrion enōpion mou dia pantos, hoti ek dexiōn mou estin, hina mē saleuthō.',
   'To prove the resurrection, Peter turns to Psalm 16:8-11, attributed to David. He argues that David ''speaketh concerning him'' (λέγει εἰς αὐτόν), meaning Jesus, not himself. David''s words, ''I foresaw the Lord always before my face, for he is on my right hand, that I should not be moved'' (Προορώμην τὸν Κύριον ἐνώπιόν μου διὰ παντός, ὅτι ἐκ δεξιῶν μου ἐστίν, ἵνα μὴ σαλευθῶ), express confidence in God''s presence. Peter will show that David could not have spoken these words literally of himself, as David did experience death and corruption.',
   NULL),
  (26,
   'Therefore did my heart rejoice, and my tongue was glad; moreover also my flesh shall rest in hope:',
   'διὰ τοῦτο ηὐφράνθη μου ἡ καρδία καὶ ἠγαλλιάσατο ἡ γλῶσσά μου, ἔτι δὲ καὶ ἡ σάρξ μου κατασκηνώσει ἐπ’ ἐλπίδι,',
   'dia touto ēuphranthē mou hē kardia kai ēgalliasato hē glōssa mou, eti de kai hē sarx mou kataskēnōsei ep’ elpidi,',
   'Continuing the quote from Psalm 16:9, David expresses joy and hope: ''Therefore did my heart rejoice, and my tongue was glad; moreover also my flesh shall rest in hope'' (ηὐφράνθη μου ἡ καρδία καὶ ἠγαλλιάσατο ἡ γλῶσσά μου, ἔτι δὲ καὶ ἡ σάρξ μου κατασκηνώσει ἐπ’ ἐλπίδι). This hope, Peter will argue, is not merely for a peaceful death but for resurrection, a hope that David himself could not fully realize but prophetically spoke of for the Messiah.',
   NULL),
  (27,
   'Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption.',
   'ὅτι οὐκ ἐγκαταλείψεις τὴν ψυχήν μου εἰς ᾅδην, οὐδὲ δώσεις τὸν ὅσιόν σου ἰδεῖν διαφθοράν.',
   'hoti ouk enkataleipseis tēn psychēn mou eis hadēn, oude dōseis ton hosion sou idein diapthoran.',
   'This verse (Psalm 16:10) is central to Peter''s argument: ''Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption'' (οὐκ ἐγκαταλείψεις τὴν ψυχήν μου εἰς ᾅδην, οὐδὲ δώσεις τὸν ὅσιόν σου ἰδεῖν διαφθοράν). ''Hell'' (ᾅδην - Hades) refers to the realm of the dead. ''Thine Holy One'' (τὸν ὅσιόν σου) refers to the Messiah. The key phrase is ''to see corruption'' (ἰδεῖν διαφθοράν), meaning physical decay. Peter will demonstrate that David''s body did indeed see corruption, thus these words must refer to someone else—Jesus.',
   'This prophecy from Psalm 16 is crucial for understanding Christ''s resurrection. It declares that God would not abandon His ''Holy One'' (Jesus) to Hades nor allow His body to ''see corruption.'' This proves Jesus'' unique sinlessness and divine nature, making His resurrection a necessary fulfillment of prophecy.'),
  (28,
   'Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance.',
   'ἐγνώρισάς μοι ὁδοὺς ζωῆς, πληρώσεις με εὐφροσύνης μετὰ τοῦ προσώπου σου.',
   'egnōrisas moi hodous zōēs, plērōseis me euphrosynēs meta tou prosōpou sou.',
   'The final part of the Psalm 16 quote (v. 11): ''Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance'' (ἐγνώρισάς μοι ὁδοὺς ζωῆς, πληρώσεις με εὐφροσύνης μετὰ τοῦ προσώπου σου). This speaks of eternal life and joy in God''s presence. Peter uses this to underscore that David''s hope, and the ultimate fulfillment of this prophecy, lies in the resurrection and exaltation of Jesus, who truly experienced the ''ways of life'' beyond death.',
   NULL),
  (29,
   'Men and brethren, let me freely speak unto you of the patriarch David, that he is both dead and buried, and his sepulchre is with us unto this day.',
   'Ἄνδρες ἀδελφοί, ἐξὸν εἰπεῖν μετὰ παρρησίας πρὸς ὑμᾶς περὶ τοῦ πατριάρχου Δαυίδ, ὅτι καὶ ἐτελεύτησεν καὶ ἐτάφη, καὶ τὸ μνῆμα αὐτοῦ ἔστιν ἐν ἡμῖν ἄχρι τῆς ἡμέρας ταύτης.',
   'Andres adelphoi, exon eipein meta parrēsias pros hymas peri tou patriarchou Dauid, hoti kai eteleutēsen kai etaphē, kai to mnēma autou estin en hēmin achri tēs hēmeras tautēs.',
   'Peter respectfully addresses the crowd as ''Men and brethren'' (Ἄνδρες ἀδελφοί) and then boldly (μετὰ παρρησίας - ''with freedom of speech'') clarifies David''s prophecy. He points out the undeniable historical fact that ''the patriarch David'' (τοῦ πατριάρχου Δαυίδ) ''is both dead and buried, and his sepulchre is with us unto this day'' (ἐτελεύτησεν καὶ ἐτάφη, καὶ τὸ μνῆμα αὐτοῦ ἔστιν ἐν ἡμῖν ἄχρι τῆς ἡμέρας ταύτης). This proves David himself saw corruption, so Psalm 16 cannot be solely about him.',
   NULL),
  (30,
   'Therefore being a prophet, and knowing that God had sworn with an oath to him, that of the fruit of his loins, according to the flesh, he would raise up Christ to sit on his throne;',
   'προφήτης οὖν ὑπάρχων, καὶ εἰδὼς ὅτι ὅρκῳ ὤμοσεν αὐτῷ ὁ Θεὸς ἐκ καρποῦ τῆς ὀσφύος αὐτοῦ τὸ κατὰ σάρκα ἀναστῆσαι τὸν Χριστὸν καθίσαι ἐπὶ τὸν θρόνον αὐτοῦ,',
   'prophētēs oun hyparchōn, kai eidōs hoti horkō ōmosen autō ho Theos ek karpou tēs osphyos autou to kata sarka anastēsai ton Christon kathisai epi ton thronon autou,',
   'Peter explains that David, being a ''prophet'' (προφήτης), knew God''s oath (Ps 132:11; 2 Sam 7:12-16) that ''of the fruit of his loins, according to the flesh, he would raise up Christ to sit on his throne'' (ἐκ καρποῦ τῆς ὀσφύος αὐτοῦ τὸ κατὰ σάρκα ἀναστῆσαι τὸν Χριστὸν καθίσαι ἐπὶ τὸν θρόνον αὐτοῦ). This refers to the Messiah (Χριστὸν), who would be a descendant of David and would reign eternally. David''s prophetic insight allowed him to foresee the resurrection of this Messiah.',
   'David''s prophetic understanding of God''s oath concerning the Messiah''s lineage and eternal reign underscores the divine continuity of God''s plan. The promise of a descendant to sit on David''s throne finds its ultimate fulfillment in Jesus Christ, the resurrected and exalted King.'),
  (31,
   'He seeing this before spake of the resurrection of Christ, that his soul was not left in hell, neither his flesh did see corruption.',
   'προϊδὼν ἐλάλησεν περὶ τῆς ἀναστάσεως τοῦ Χριστοῦ, ὅτι οὐκ ἐγκατελείφθη εἰς ᾅδην οὐδὲ ἡ σὰρξ αὐτοῦ εἶδεν διαφθοράν.',
   'proidōn elalēsen peri tēs anastaseōs tou Christou, hoti ouk enkataleiphthē eis hadēn oude hē sarx autou eiden diapthoran.',
   'Therefore, David ''seeing this before spake of the resurrection of Christ'' (προϊδὼν ἐλάλησεν περὶ τῆς ἀναστάσεως τοῦ Χριστοῦ). Peter directly applies Psalm 16:10 to Jesus, stating that ''his soul was not left in hell, neither his flesh did see corruption'' (οὐκ ἐγκατελείφθη εἰς ᾅδην οὐδὲ ἡ σὰρξ αὐτοῦ εἶδεν διαφθοράν). This is the definitive proof that Jesus is the ''Holy One'' of whom David prophesied, and His resurrection is the fulfillment of that prophecy.',
   'Peter''s interpretation confirms that Psalm 16 directly prophesied Christ''s resurrection. Jesus'' soul was not abandoned to Hades, nor did His body experience decay, proving His victory over death and His unique status as God''s Holy One.'),
  (32,
   'This Jesus hath God raised up, whereof we all are witnesses.',
   'τοῦτον τὸν Ἰησοῦν ἀνέστησεν ὁ Θεός, οὗ πάντες ἡμεῖς ἐσμεν μάρτυρες.',
   'touton ton Iēsoun anestēsen ho Theos, hou pantes hēmeis esmen martyres.',
   'Peter powerfully concludes this section: ''This Jesus hath God raised up'' (τοῦτον τὸν Ἰησοῦν ἀνέστησεν ὁ Θεός). He then asserts the apostles'' collective witness: ''whereof we all are witnesses'' (οὗ πάντες ἡμεῖς ἐσμεν μάρτυρες). This firsthand testimony from those who had seen the resurrected Christ is crucial. Their witness, empowered by the Spirit, provides irrefutable evidence to the crowd.',
   'The apostles'' collective witness to Jesus'' resurrection is central to the gospel''s credibility. Their personal experience, coupled with prophetic fulfillment, provides compelling evidence for the truth of Christ''s victory over death, forming the foundation of Christian faith.'),
  (33,
   'Therefore being by the right hand of God exalted, and having received of the Father the promise of the Holy Ghost, he hath shed forth this, which ye now see and hear.',
   'τῇ δεξιᾷ οὖν τοῦ Θεοῦ ὑψωθεὶς τὴν τε ἐπαγγελίαν τοῦ Πνεύματος τῆς Ἁγίου λαβὼν παρὰ τοῦ Πατρὸς ἐξέχεεν τοῦτο ὃ ὑμεῖς καὶ βλέπετε καὶ ἀκούετε.',
   'tē dexia oun tou Theou hypsōtheis tēn te epangelian tou Pneumatos tēs Hagiou labōn para tou Patros execheen touto ho hymeis kai blepete kai akouete.',
   'Peter connects the resurrection to Jesus'' exaltation and the Spirit''s outpouring. Jesus, ''being by the right hand of God exalted'' (τῇ δεξιᾷ οὖν τοῦ Θεοῦ ὑψωθεὶς), received ''the promise of the Holy Ghost'' (τὴν τε ἐπαγγελίαν τοῦ Πνεύματος τῆς Ἁγίου) from the Father. He then ''shed forth this'' (ἐξέχεεν τοῦτο), referring to the Spirit, which the audience ''now see and hear'' (ὑμεῖς καὶ βλέπετε καὶ ἀκούετε). This directly explains the Pentecost phenomena as a result of Christ''s ascension and intercession.',
   'Jesus'' exaltation to God''s right hand and His reception of the promised Holy Spirit from the Father are foundational. The Spirit''s outpouring at Pentecost is a direct consequence of Christ''s finished work and ongoing intercession, demonstrating His authority and the Father''s faithfulness.'),
  (34,
   'For David is not ascended into the heavens: but he saith himself, The Lord said unto my Lord, Sit thou on my right hand,',
   'οὐ γὰρ Δαυὶδ ἀνέβη εἰς τοὺς οὐρανούς, λέγει δὲ αὐτός, Εἶπεν Κύριος τῷ Κυρίῳ μου, Κάθου ἐκ δεξιῶν μου,',
   'ou gar Dauid anebē eis tous ouranous, legei de autos, Eipen Kyrios tō Kyriō mou, Kathou ek dexiōn mou,',
   'Peter further solidifies his argument that David''s prophecies refer to Christ by stating, ''For David is not ascended into the heavens'' (οὐ γὰρ Δαυὶδ ἀνέβη εἰς τοὺς οὐρανούς). He then quotes Psalm 110:1: ''The Lord said unto my Lord, Sit thou on my right hand'' (Εἶπεν Κύριος τῷ Κυρίῳ μου, Κάθου ἐκ δεξιῶν μου). This Psalm, universally understood as Messianic, shows David acknowledging a ''Lord'' superior to himself, who would sit at God''s right hand. This ''Lord'' is Jesus.',
   'Psalm 110:1, quoted by Peter, is a key Messianic prophecy. David''s reference to ''my Lord'' sitting at God''s right hand proves that the Messiah is superior to David and possesses divine authority, a truth fulfilled only in the resurrected and ascended Jesus Christ.'),
  (35,
   'Until I make thy foes thy footstool.',
   'ἕως ἂν θῶ τοὺς ἐχθρούς σου ὑποπόδιον τῶν ποδῶν σου.',
   'heōs an thō tous echthrous sou hypopodion tōn podōn sou.',
   'The quote from Psalm 110:1 continues: ''Until I make thy foes thy footstool'' (ἕως ἂν θῶ τοὺς ἐχθρούς σου ὑποπόδιον τῶν ποδῶν σου). This signifies Christ''s ultimate victory and dominion over all His enemies. Peter uses this to emphasize Jesus'' absolute authority and power, now seated at God''s right hand, reigning until all opposition is subdued. This reinforces the Messianic identity and divine sovereignty of Jesus.',
   'The promise of Christ''s enemies becoming His ''footstool'' signifies His ultimate triumph and sovereign reign. This eschatological victory assures believers of Christ''s complete authority and the eventual subjugation of all evil, providing hope and confidence in His kingdom.'),
  (36,
   'Therefore let all the house of Israel know assuredly, that God hath made that same Jesus, whom ye have crucified, both Lord and Christ.',
   'ἀσφαλῶς οὖν γινωσκέτω πᾶς οἶκος Ἰσραὴλ ὅτι καὶ Κύριον αὐτὸν καὶ Χριστὸν ὁ Θεὸς ἐποίησεν, τοῦτον τὸν Ἰησοῦν ὃν ὑμεῖς ἐσταυρώσατε.',
   'asphalōs oun ginōsketō pas oikos Israēl hoti kai Kyrion auton kai Christon ho Theos epoiēsen, touton ton Iēsoun hon hymeis estaurōsate.',
   'Peter delivers his powerful conclusion: ''Therefore let all the house of Israel know assuredly'' (ἀσφαλῶς οὖν γινωσκέτω πᾶς οἶκος Ἰσραὴλ). The core message is that ''God hath made that same Jesus, whom ye have crucified, both Lord and Christ'' (Κύριον αὐτὸν καὶ Χριστὸν ὁ Θεὸς ἐποίησεν, τοῦτον τὸν Ἰησοῦν ὃν ὑμεῖς ἐσταυρώσατε). ''Lord'' (Κύριον) implies divine authority and sovereignty, while ''Christ'' (Χριστὸν) means Messiah, the anointed King. The accusation ''whom ye have crucified'' directly confronts their sin.',
   'This is the theological climax of Peter''s sermon: God has made the crucified Jesus both ''Lord'' (divine sovereign) and ''Christ'' (Messiah). This declaration reveals Jesus'' true identity and authority, demanding a response from those who rejected and crucified Him. It is the core of the gospel message.'),
  (37,
   'Now when they heard this, they were pricked in their heart, and said unto Peter and to the rest of the apostles, Men and brethren, what shall we do?',
   'Ἀκούσαντες δὲ κατενύγησαν τὴν καρδίαν, εἶπόν τε πρὸς τὸν Πέτρον καὶ τοὺς λοιποὺς ἀποστόλους, Τί ποιήσωμεν, ἄνδρες ἀδελφοί;',
   'Akousantes de katenygēsan tēn kardian, eipon te pros ton Petron kai tous loipous apostolous, Ti poiēsōmen, andres adelphoi?',
   'The sermon had its intended effect: ''they were pricked in their heart'' (κατενύγησαν τὴν καρδίαν). This phrase denotes deep conviction, a piercing of the conscience by the Holy Spirit, leading to repentance. Their question, ''Men and brethren, what shall we do?'' (Τί ποιήσωμεν, ἄνδρες ἀδελφοί;), shows genuine remorse and a desire for a path to reconciliation with God. This is the first recorded response to the gospel message.',
   'Being ''pricked in their heart'' signifies the Holy Spirit''s convicting work, leading to genuine repentance. This immediate and profound response demonstrates the power of the gospel to expose sin and prompt a sincere desire for salvation, setting a pattern for conversion.'),
  (38,
   'Then Peter said unto them, Repent, and be baptized every one of you in the name of Jesus Christ for the remission of sins, and ye shall receive the gift of the Holy Ghost.',
   'Πέτρος δὲ ἔφη πρὸς αὐτούς, Μετανοήσατε, καὶ βαπτισθήτω ἕκαστος ὑμῶν ἐν τῷ ὀνόματι Ἰησοῦ Χριστοῦ εἰς ἄφεσιν ἁμαρτιῶν ὑμῶν, καὶ λήψεσθε τὴν δωρεὰν τοῦ Ἁγίου Πνεύματος.',
   'Petros de ephē pros autous, Metanoēsate, kai baptisthētō hekastos hymōn en tō onomati Iēsou Christou eis aphesin hamartiōn hymōn, kai lēpsesthe tēn dōrean tou Hagiou Pneumatos.',
   'Peter''s response outlines the path to salvation: ''Repent'' (Μετανοήσατε), meaning a change of mind leading to a change of life, turning from sin to God. ''And be baptized every one of you in the name of Jesus Christ'' (βαπτισθήτω ἕκαστος ὑμῶν ἐν τῷ ὀνόματι Ἰησοῦ Χριστοῦ) signifies identification with Christ and public confession of faith. The purpose is ''for the remission of sins'' (εἰς ἄφεσιν ἁμαρτιῶν ὑμῶν) and the promise ''ye shall receive the gift of the Holy Ghost'' (λήψεσθε τὴν δωρεὰν τοῦ Ἁγίου Πνεύματος), connecting baptism to the Spirit''s indwelling.',
   'Peter''s call to ''repent and be baptized'' is the foundational gospel response. Repentance signifies a turning from sin, while baptism symbolizes identification with Christ and the washing away of sins. The promise of the Holy Spirit''s gift underscores the Spirit''s role in new life and empowerment for believers.'),
  (39,
   'For the promise is unto you, and to your children, and to all that are afar off, even as many as the LORD our God shall call.',
   'ὑμῖν γάρ ἐστιν ἡ ἐπαγγελία καὶ τοῖς τέκνοις ὑμῶν καὶ πᾶσι τοῖς εἰς μακράν, ὅσους ἂν προσκαλέσηται Κύριος ὁ Θεὸς ἡμῶν.',
   'hymin gar estin hē epangelia kai tois teknois hymōn kai pasi tois eis makran, hosous an proskalesētai Kyrios ho Theos hēmōn.',
   'The promise of the Holy Spirit and salvation is not exclusive. It is ''unto you, and to your children'' (ὑμῖν γάρ ἐστιν ἡ ἐπαγγελία καὶ τοῖς τέκνοις ὑμῶν), emphasizing generational continuity within the covenant community. Crucially, it also extends ''to all that are afar off'' (πᾶσι τοῖς εἰς μακράν), a phrase that can refer to Jews in the diaspora or, prophetically, to Gentiles (Isa 57:19; Eph 2:13, 17). This highlights the universal scope of God''s call, ''even as many as the Lord our God shall call'' (ὅσους ἂν προσκαλέσηται Κύριος ὁ Θεὸς ἡμῶν).',
   'The promise of salvation and the Holy Spirit extends universally: to the immediate audience, their descendants, and ''all that are afar off'' (Gentiles). This demonstrates God''s expansive grace and His sovereign call to salvation, breaking down barriers of ethnicity and geography.'),
  (40,
   'And with many other words did he testify and exhort, saying, Save yourselves from this untoward generation.',
   'ἑτέροις τε λόγοις πλείοσιν διεμαρτύρατο καὶ παρεκάλει λέγων, Σώθητε ἀπὸ τῆς γενεᾶς τῆς σκολιᾶς ταύτης.',
   'heterois te logois pleiosin diemartyrato kai parekalei legōn, Sōthēte apo tēs geneas tēs skolias tautēs.',
   'Peter''s sermon was more extensive than recorded, as he ''with many other words did he testify and exhort'' (ἑτέροις τε λόγοις πλείοσιν διεμαρτύρατο καὶ παρεκάλει). His urgent plea was, ''Save yourselves from this untoward generation'' (Σώθητε ἀπὸ τῆς γενεᾶς τῆς σκολιᾶς ταύτης). ''Untoward'' (σκολιᾶς) means crooked, perverse, or rebellious. This call to ''save yourselves'' implies separating from the prevailing unbelief and moral corruption of the age, aligning with God''s righteous path.',
   'The call to ''save yourselves from this untoward generation'' emphasizes the need for believers to separate from the world''s corrupting influences. Salvation involves not only forgiveness of sins but also a transformed life that stands in contrast to the prevailing ungodliness of society.'),
  (41,
   'Then they that gladly received his word were baptized: and the same day there were added unto them about three thousand souls.',
   'οἱ μὲν οὖν ἀποδεξάμενοι τὸν λόγον αὐτοῦ ἐβαπτίσθησαν, καὶ προσετέθησαν ἐν τῇ ἡμέρᾳ ἐκείνῃ ψυχαὶ ὡσεὶ τρισχίλιαι.',
   'hoi men oun apodexamenoi ton logon autou ebaptisthēsan, kai prosetethēsan en tē hēmera ekeinē psychai hōsei trischiliai.',
   'The immediate and overwhelming response was remarkable: ''they that gladly received his word were baptized'' (οἱ μὲν οὖν ἀποδεξάμενοι τὸν λόγον αὐτοῦ ἐβαπτίσθησαν). This highlights the importance of receiving the message with faith. As a result, ''the same day there were added unto them about three thousand souls'' (προσετέθησαν ἐν τῇ ἡμέρᾳ ἐκείνῃ ψυχαὶ ὡσεὶ τρισχίλιαι). This massive influx marks the dramatic birth and rapid growth of the early Christian church, a powerful demonstration of the Spirit''s work.',
   'The conversion of ''about three thousand souls'' on Pentecost demonstrates the Holy Spirit''s power to convict and transform hearts through the preached word. This event marks the dramatic birth of the Church, highlighting the immediate and visible fruit of Spirit-empowered evangelism.'),
  (42,
   'And they continued stedfastly in the apostles’ doctrine and fellowship, and in breaking of bread, and in prayers.',
   'ἦσαν δὲ προσκαρτεροῦντες τῇ διδαχῇ τῶν ἀποστόλων καὶ τῇ κοινωνίᾳ, τῇ κλάσει τοῦ ἄρτου καὶ ταῖς προσευχαῖς.',
   'ēsan de proskarterountes tē didachē tōn apostolōn kai tē koinōnia, tē klasei tou artou kai tais proseuchais.',
   'Luke describes the core practices of the nascent church, highlighting their devotion. They ''continued stedfastly'' (προσκαρτεροῦντες) in four key areas: ''the apostles’ doctrine'' (τῇ διδαχῇ τῶν ἀποστόλων), meaning their teaching based on Christ''s words; ''fellowship'' (τῇ κοινωνίᾳ), implying shared life and resources; ''breaking of bread'' (τῇ κλάσει τοῦ ἄρτου), likely referring to communal meals and possibly the Lord''s Supper; and ''in prayers'' (ταῖς προσευχαῖς), both corporate and individual. These elements formed the foundation of early Christian community.',
   'The early church''s devotion to the apostles'' doctrine, fellowship, breaking of bread, and prayers provides a timeless model for Christian community. These practices foster spiritual growth, unity, and worship, demonstrating the essential elements of a healthy, Spirit-filled church.'),
  (43,
   'And fear came upon every soul: and many wonders and signs were done by the apostles.',
   'ἐγίνετο δὲ πάσῃ ψυχῇ φόβος, πολλά τε τέρατα καὶ σημεῖα διὰ τῶν ἀποστόλων ἐγίνετο.',
   'egineto de pasē psychē phobos, polla te terata kai sēmeia dia tōn apostolōn egineto.',
   '''Fear came upon every soul'' (πάσῃ ψυχῇ φόβος) refers to a reverent awe, not terror, in response to God''s manifest presence and power. This awe was fueled by ''many wonders and signs'' (πολλά τε τέρατα καὶ σημεῖα) performed ''by the apostles'' (διὰ τῶν ἀποστόλων). These miracles served to authenticate the apostles'' message and ministry, confirming that God was indeed working through them to establish His church.',
   'The ''fear'' that came upon every soul was a reverent awe of God''s power, evidenced by the apostles'' miracles. These ''wonders and signs'' authenticated the apostolic message and ministry, confirming the divine origin of the burgeoning Christian movement.'),
  (44,
   'And all that believed were together, and had all things common;',
   'πάντες δὲ οἱ πιστεύοντες ἦσαν ἐπὶ τὸ αὐτὸ καὶ εἶχον ἅπαντα κοινά,',
   'pantes de hoi pisteuontes ēsan epi to auto kai eichon hapanta koina,',
   'The believers lived in remarkable unity: ''all that believed were together'' (πάντες δὲ οἱ πιστεύοντες ἦσαν ἐπὶ τὸ αὐτὸ). This unity extended to their possessions, as they ''had all things common'' (εἶχον ἅπαντα κοινά). This was not a forced communism but a voluntary sharing motivated by love and the Spirit, ensuring that no one among them was in need. It reflected a deep commitment to one another and a detachment from worldly possessions.',
   'The early church''s practice of ''having all things common'' demonstrates a radical commitment to communal love and mutual care. This voluntary sharing, driven by the Holy Spirit, prioritized the needs of the community over individual possessions, reflecting a profound unity in Christ.'),
  (45,
   'And sold their possessions and goods, and parted them to all men, as every man had need.',
   'καὶ τὰ κτήματα καὶ τὰς ὑπάρξεις ἐπίπρασκον καὶ διεμέριζον αὐτὰ πᾶσιν καθότι ἄν τις χρείαν εἶχεν·',
   'kai ta ktēmata kai tas hyparxeis epipraskon kai diemerizon auta pasin kathoti an tis chreian eichen;',
   'To facilitate their communal living, they ''sold their possessions and goods'' (τὰ κτήματα καὶ τὰς ὑπάρξεις ἐπίπρασκον). ''Possessions'' (κτήματα) refers to fixed assets like land, while ''goods'' (ὑπάρξεις) refers to movable property. The proceeds were then ''parted them to all men, as every man had need'' (διεμέριζον αὐτὰ πᾶσιν καθότι ἄν τις χρείαν εἶχεν). This was a practical expression of their fellowship and love, ensuring that the needs of the poor and vulnerable within the community were met.',
   'The early believers'' willingness to sell possessions and distribute to those in need exemplifies practical love and radical generosity. This communal care, driven by the Spirit, ensured that no one lacked, demonstrating a tangible expression of Christian fellowship and social justice.'),
  (46,
   'And they, continuing daily with one accord in the temple, and breaking bread from house to house, did eat their meat with gladness and singleness of heart,',
   'καθ’ ἡμέραν τε προσκαρτεροῦντες ὁμοθυμαδὸν ἐν τῷ ἱερῷ, κλῶντές τε κατ’ οἶκον ἄρτον, μετελάμβανον τροφῆς ἐν ἀγαλλιάσει καὶ ἀφελότητι καρδίας,',
   'kath’ hēmeran te proskarterountes homothymadon en tō hierō, klōntes te kat’ oikon arton, metelambanon trophēs en agalliasei kai aphelotēti kardias,',
   'Their devotion was both public and private. They continued ''daily with one accord in the temple'' (καθ’ ἡμέραν τε προσκαρτεροῦντες ὁμοθυμαδὸν ἐν τῷ ἱερῷ), maintaining their Jewish heritage while embracing new Christian practices. They also engaged in ''breaking bread from house to house'' (κλῶντές τε κατ’ οἶκον ἄρτον), which likely refers to shared meals and fellowship. They ate ''with gladness and singleness of heart'' (ἐν ἀγαλλιάσει καὶ ἀφελότητι καρδίας), reflecting their joy and sincere devotion.',
   'The early church''s dual practice of worshiping in the Temple and breaking bread ''from house to house'' illustrates their continuity with Jewish tradition while establishing distinct Christian fellowship. Their ''gladness and singleness of heart'' reflect the joy and purity of motive characteristic of Spirit-filled community.'),
  (47,
   'Praising God, and having favour with all the people. And the Lord added to the church daily such as should be saved.',
   'αἰνοῦντες τὸν Θεὸν καὶ ἔχοντες χάριν πρὸς ὅλον τὸν λαόν. ὁ δὲ Κύριος προσετίθει τοὺς σῳζομένους καθ’ ἡμέραν τῇ ἐκκλησίᾳ.',
   'ainountes ton Theon kai echontes charin pros holon ton laon. ho de Kyrios prosetithei tous sōzomenous kath’ hēmeran tē ekklēsia.',
   'The early believers were ''Praising God'' (αἰνοῦντες τὸν Θεὸν) and ''having favour with all the people'' (ἔχοντες χάριν πρὸς ὅλον τὸν λαόν). Their exemplary lives and joyful witness earned them respect, even from those outside the faith. The ultimate result of this Spirit-empowered community was growth: ''And the Lord added to the church daily such as should be saved'' (ὁ δὲ Κύριος προσετίθει τοὺς σῳζομένους καθ’ ἡμέραν τῇ ἐκκλησίᾳ). This highlights that church growth is ultimately God''s work, adding those who are being saved.',
   'The early church''s devotion, praise, and favor with the people created an environment where ''the Lord added to the church daily such as should be saved.'' This demonstrates that genuine spiritual community, empowered by the Spirit, is God''s chosen means for evangelism and the ongoing growth of His kingdom.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πνοῆς', 'pnoēs', 'G4157', 'From ''pneō'' (to breathe, blow). Refers to a blast of wind, breath, or a strong current of air. In Acts 2:2, it describes the audible manifestation of the Holy Spirit as a ''rushing mighty wind,'' connecting the Spirit''s presence to powerful, unseen forces, reminiscent of the Hebrew ''ruach'' which also means wind, breath, or spirit.', 1),
  ('βιαίας', 'biaias', 'G972', 'From ''bia'' (force, strength). Means violent, forceful, or mighty. Used here to describe the intensity of the ''wind'' accompanying the Spirit''s arrival. It emphasizes the overwhelming and undeniable power of God''s presence, indicating a divine intervention that could not be ignored or easily dismissed by those present.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπλήσθησαν', 'eplēsthēsan', 'G4137', 'Aorist passive indicative of ''plēthō'' (to fill, fulfill). Signifies being completely filled or permeated. In Acts, ''filled with the Holy Spirit'' denotes a special empowerment for service, witness, or prophecy, rather than merely initial conversion. It implies a dynamic, overflowing presence of the Spirit enabling supernatural abilities.', 1),
  ('γλώσσαις', 'glōssais', 'G1100', 'Plural of ''glōssa'' (tongue, language). Refers to both the physical organ of speech and, more importantly here, distinct human languages. In Acts 2, the context of diverse nationalities hearing ''in his own language'' confirms these were known foreign languages, not unintelligible ecstatic utterances, serving to communicate God''s ''wonderful works'' across cultural barriers.', 2),
  ('ἀποφθέγγεσθαι', 'apophthengesthai', 'G669', 'From ''apo'' (from) and ''phthengomai'' (to utter a sound). Means to speak out, declare, or utter solemnly and distinctly. This verb is often used in Acts for inspired or prophetic speech (Acts 2:14, 26:25). It suggests a clear, articulate, and authoritative proclamation, reinforcing that the tongues were intelligible messages from God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐκχεῶ', 'ekcheō', 'G1632', 'Future active indicative of ''ekcheō'' (to pour out, shed). Describes a lavish, abundant outpouring. In Joel''s prophecy, quoted by Peter, it signifies the generous and universal distribution of the Holy Spirit, contrasting with previous limited anointings. It emphasizes the new covenant''s characteristic of widespread spiritual empowerment for all believers.', 1),
  ('Πνεύματός', 'Pneumatos', 'G4151', 'Genitive of ''Pneuma'' (Spirit, wind, breath). Here, it specifically refers to the Holy Spirit, the divine agent of God''s presence and power. Its outpouring signifies the inauguration of the Messianic age, empowering believers for prophetic ministry and spiritual gifts, making God''s presence accessible to ''all flesh''.', 2),
  ('προφητεύσουσιν', 'prophēteusousin', 'G4395', 'Future active indicative of ''prophēteuō'' (to prophesy, speak under divine inspiration). Means to speak forth God''s message, often predicting future events but primarily declaring God''s will and truth. In the context of Joel''s prophecy, it signifies that the Spirit''s outpouring will enable all believers, regardless of status, to communicate divine revelation, fulfilling God''s desire for a prophetic people.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 17;

-- Verse 24
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνέστησεν', 'anestēsen', 'G450', 'Aorist active indicative of ''anistēmi'' (to raise up, stand up). Refers to God''s act of raising Jesus from the dead. This is the central claim of Peter''s sermon and Christian theology, demonstrating God''s power over death and validating Jesus'' divine identity and mission. The resurrection is the cornerstone of salvation and hope.', 1),
  ('λύσας', 'lysas', 'G3089', 'Aorist active participle of ''lyō'' (to loose, untie, release). Describes the act of God releasing Jesus from the grip of death. The imagery of ''loosing the pains of death'' suggests that death''s power or bonds were broken, emphasizing Christ''s triumph and the impossibility of death holding Him captive due to His sinlessness.', 2),
  ('ὠδῖνας', 'ōdinas', 'G5604', 'Plural of ''ōdin'' (birth pangs, travail, severe pain). In the context of ''pains of death,'' it can refer to the agonizing grip or throes of death. However, it can also metaphorically suggest the ''birth pangs'' of a new era or the inability of death to ''give birth'' to corruption in Christ''s case, implying death''s power was overcome.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 24;

-- Verse 33
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑψωθεὶς', 'hypsōtheis', 'G5312', 'Aorist passive participle of ''hypsoō'' (to lift up, exalt). Refers to Jesus'' ascension and exaltation to God''s right hand. This signifies His divine authority, sovereignty, and victorious status after His resurrection. His exaltation is the prerequisite for the outpouring of the Holy Spirit, demonstrating His active role in the new covenant.', 1),
  ('ἐπαγγελίαν', 'epangelian', 'G1860', 'From ''epangellō'' (to promise). Refers to a promise or declaration. Here, it is ''the promise of the Holy Ghost,'' referring to God''s long-standing covenant promise (e.g., Joel 2:28, John 14:16) to send the Spirit. Jesus, having received this promise from the Father, then pours out the Spirit, fulfilling divine prophecy and establishing the new covenant.', 2),
  ('ἐξέχεεν', 'execheen', 'G1632', 'Aorist active indicative of ''ekcheō'' (to pour out, shed). Describes Jesus'' act of pouring out the Holy Spirit. This verb emphasizes the abundant and generous nature of the Spirit''s distribution, directly linking the visible and audible phenomena at Pentecost to Christ''s ascended authority and His fulfillment of the Father''s promise.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 33;

-- Verse 38
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Μετανοήσατε', 'Metanoēsate', 'G3340', 'Aorist active imperative of ''metanoeō'' (to repent). Means to change one''s mind, to turn around, to have a change of heart and purpose, leading to a change in behavior. It is a fundamental call of the gospel, requiring a conscious decision to turn from sin and self-reliance to God, acknowledging one''s need for salvation.', 1),
  ('βαπτισθήτω', 'baptisthētō', 'G907', 'Aorist passive imperative of ''baptizō'' (to baptize, immerse). Commands each person to be baptized. Christian baptism is an outward symbol of an inward spiritual reality: identification with Christ''s death, burial, and resurrection, and a public declaration of faith. It signifies cleansing from sin and entrance into the new covenant community.', 2),
  ('ἄφεσιν', 'aphesin', 'G859', 'From ''aphiēmi'' (to send away, forgive). Refers to remission, forgiveness, or release. In the context of ''remission of sins,'' it signifies the complete pardon and cancellation of the penalty for sin, made possible through Christ''s atoning sacrifice. It is a core benefit of salvation, freeing believers from guilt and condemnation.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 38;

-- Verse 42
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσκαρτεροῦντες', 'proskarterountes', 'G4342', 'Present active participle of ''proskartereō'' (to persevere, continue steadfastly, be devoted to). Describes the consistent and unwavering commitment of the early believers. It implies a persistent and faithful adherence to the practices of the church, highlighting their dedication to the apostles'' teaching, fellowship, communion, and prayer.', 1),
  ('διδαχῇ', 'didachē', 'G1322', 'From ''didaskō'' (to teach). Refers to teaching, doctrine, or instruction. In Acts 2:42, it denotes the authoritative teaching of the apostles, which conveyed the truths about Jesus Christ, His life, death, resurrection, and the implications for believers. This foundational instruction was crucial for the spiritual formation of the early church.', 2),
  ('κοινωνίᾳ', 'koinōnia', 'G2842', 'From ''koinos'' (common). Refers to fellowship, partnership, sharing, or communion. It describes the deep bond and mutual participation among believers, encompassing shared spiritual life, material resources, and common purpose. This active sharing was a hallmark of the early Christian community, demonstrating their unity in Christ.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = 42;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Leviticus 23:15-21', 1),
  (1, 'Deuteronomy 16:9-12', 2),
  (1, 'Acts 1:4-5', 3),
  (1, 'Acts 1:14', 4),
  (2, 'Exodus 19:16-19', 1),
  (2, 'Ezekiel 3:12-13', 2),
  (2, 'John 3:8', 3),
  (2, 'Acts 4:31', 4),
  (3, 'Exodus 3:2', 1),
  (3, 'Isaiah 6:6-7', 2),
  (3, 'Matthew 3:11', 3),
  (3, 'Hebrews 12:29', 4),
  (4, 'Acts 1:8', 1),
  (4, 'Acts 10:46', 2),
  (4, 'Acts 19:6', 3),
  (4, '1 Corinthians 14:2-4', 4),
  (5, 'Deuteronomy 16:16', 1),
  (5, 'Acts 6:7', 2),
  (5, 'Acts 8:27', 3),
  (6, 'Genesis 11:1-9', 1),
  (6, 'Acts 2:12', 2),
  (7, 'Matthew 26:73', 1),
  (7, 'Mark 14:70', 2),
  (7, 'Luke 22:59', 3),
  (8, 'Acts 2:6', 1),
  (8, 'Acts 2:11', 2),
  (9, 'Acts 2:5', 1),
  (9, 'Acts 18:2', 2),
  (10, 'Acts 6:9', 1),
  (10, 'Acts 13:43', 2),
  (10, 'Romans 1:16', 3),
  (11, 'Psalm 71:17', 1),
  (11, 'Psalm 106:2', 2),
  (11, 'Luke 1:49', 3),
  (11, 'Acts 2:6', 4),
  (12, 'Acts 2:6', 1),
  (12, 'Acts 17:20', 2),
  (13, '1 Samuel 1:14', 1),
  (13, '1 Corinthians 14:23', 2),
  (14, 'Acts 1:26', 1),
  (14, 'Acts 5:29', 2),
  (14, 'Acts 10:34', 3),
  (14, 'Acts 13:16', 4),
  (15, '1 Thessalonians 5:7', 1),
  (16, 'Joel 2:28-32', 1),
  (16, 'Isaiah 44:3', 2),
  (17, 'Isaiah 32:15', 1),
  (17, 'Isaiah 44:3', 2),
  (17, 'Ezekiel 36:27', 3),
  (17, 'John 7:38-39', 4),
  (17, 'Titus 3:6', 5),
  (18, 'Galatians 3:28', 1),
  (18, '1 Corinthians 12:13', 2),
  (19, 'Joel 2:30', 1),
  (19, 'Revelation 6:12-14', 2),
  (20, 'Joel 2:31', 1),
  (20, 'Isaiah 13:9-10', 2),
  (20, 'Matthew 24:29', 3),
  (20, 'Revelation 6:12', 4),
  (21, 'Joel 2:32', 1),
  (21, 'Romans 10:13', 2),
  (21, '1 Corinthians 1:2', 3),
  (22, 'John 14:10-11', 1),
  (22, 'Acts 10:38', 2),
  (22, 'Hebrews 2:4', 3),
  (23, 'Acts 3:18', 1),
  (23, 'Acts 4:27-28', 2),
  (23, 'Luke 22:22', 3),
  (23, '1 Peter 1:2', 4),
  (24, 'Acts 3:15', 1),
  (24, 'Acts 13:30', 2),
  (24, 'Romans 6:9', 3),
  (24, 'Colossians 2:15', 4),
  (25, 'Psalm 16:8-11', 1),
  (25, 'Acts 13:35', 2),
  (26, 'Psalm 16:9', 1),
  (27, 'Psalm 16:10', 1),
  (27, 'Acts 13:35', 2),
  (27, 'Hosea 13:14', 3),
  (28, 'Psalm 16:11', 1),
  (28, 'Matthew 7:14', 2),
  (29, '1 Kings 2:10', 1),
  (29, 'Acts 13:36', 2),
  (30, '2 Samuel 7:12-13', 1),
  (30, 'Psalm 132:11', 2),
  (30, 'Luke 1:32-33', 3),
  (30, 'Romans 1:3', 4),
  (31, 'Acts 2:27', 1),
  (31, 'Acts 13:35-37', 2),
  (32, 'Acts 1:8', 1),
  (32, 'Acts 3:15', 2),
  (32, 'Acts 5:32', 3),
  (32, '1 Corinthians 15:3-8', 4),
  (33, 'Acts 1:11', 1),
  (33, 'John 14:26', 2),
  (33, 'John 15:26', 3),
  (33, 'John 16:7', 4),
  (33, 'Ephesians 4:8', 5),
  (34, 'Psalm 110:1', 1),
  (34, 'Matthew 22:44', 2),
  (34, 'Hebrews 1:13', 3),
  (35, 'Psalm 110:1', 1),
  (35, '1 Corinthians 15:25', 2),
  (35, 'Hebrews 10:13', 3),
  (36, 'Acts 5:31', 1),
  (36, 'Romans 14:9', 2),
  (36, 'Philippians 2:9-11', 3),
  (37, 'Acts 5:33', 1),
  (37, 'Acts 9:6', 2),
  (37, 'Acts 16:30', 3),
  (37, 'Zechariah 12:10', 4),
  (38, 'Acts 3:19', 1),
  (38, 'Acts 8:12', 2),
  (38, 'Acts 22:16', 3),
  (38, 'Colossians 2:12', 4),
  (38, 'Galatians 3:27', 5),
  (39, 'Joel 2:28', 1),
  (39, 'Isaiah 57:19', 2),
  (39, 'Ephesians 2:13-17', 3),
  (39, 'Acts 3:25', 4),
  (40, 'Acts 13:40', 1),
  (40, 'Philippians 2:15', 2),
  (41, 'Acts 4:4', 1),
  (41, 'Acts 5:14', 2),
  (41, 'Acts 6:7', 3),
  (42, 'Acts 1:14', 1),
  (42, 'Acts 4:32', 2),
  (42, '1 Corinthians 10:16', 3),
  (42, 'Hebrews 10:25', 4),
  (43, 'Acts 5:5', 1),
  (43, 'Acts 5:12', 2),
  (43, 'Acts 19:17', 3),
  (43, 'Mark 16:17-18', 4),
  (44, 'Acts 4:32', 1),
  (44, 'Acts 5:12', 2),
  (44, 'Philippians 2:1-4', 3),
  (45, 'Acts 4:34-35', 1),
  (45, 'Luke 12:33', 2),
  (46, 'Acts 1:14', 1),
  (46, 'Acts 5:42', 2),
  (46, 'Luke 24:53', 3),
  (46, '1 Corinthians 10:16', 4),
  (47, 'Acts 4:33', 1),
  (47, 'Acts 5:13', 2),
  (47, 'Acts 11:24', 3),
  (47, 'Acts 13:48', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 2 Complete!
-- 47 verses · 7 key verses with word studies (20 words)
-- Cross-references for 47 verses (146 refs)
-- ═══════════════════════════════════════════════════════