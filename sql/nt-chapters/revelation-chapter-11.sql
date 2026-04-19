-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 11 — God's Enduring Witnesses and the Establishment of His Eternal Kingdom
-- 19 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 11,
  'Revelation 11 marks a pivotal transition in John''s apocalyptic vision, bridging the trumpet judgments with the final woes and the establishment of God''s kingdom. It introduces the enigmatic ''two witnesses'' whose prophetic ministry, miraculous powers, violent death, and dramatic resurrection symbolize the enduring testimony of the church amidst persecution. The chapter also features the symbolic measuring of the temple, distinguishing the faithful remnant from the apostate world, and culminates with the sounding of the seventh trumpet, announcing the triumphant reign of Christ and the commencement of divine judgment. This section underscores the sovereignty of God, the resilience of His witnesses, and the ultimate victory of His kingdom over earthly powers, providing a glimpse into the cosmic struggle between good and evil and God''s ultimate triumph.',
  'God''s Enduring Witnesses and the Establishment of His Eternal Kingdom',
  'βασιλεία (basileia)',
  'From `basileus` (king), `basileia` denotes ''kingdom,'' ''royal power,'' or ''reign.'' Theologically, it signifies God''s sovereign rule and the sphere of His authority, both present and future. In Revelation 11, it climaxes with the declaration that ''the kingdoms of this world are become the kingdoms of our Lord, and of his Christ,'' emphasizing the ultimate and eternal establishment of God''s universal dominion.',
  '["Section 1 (vv. 1-2): The Measuring of the Temple and the Trampling of the Holy City","Section 2 (vv. 3-6): The Ministry and Power of the Two Witnesses","Section 3 (vv. 7-10): The Death and Global Rejoicing Over the Witnesses","Section 4 (vv. 11-12): The Resurrection and Ascension of the Witnesses","Section 5 (v. 13): The Earthquake and Repentance in the City","Section 6 (vv. 14-18): The Seventh Trumpet and the Proclamation of God''s Kingdom","Section 7 (v. 19): The Opening of the Heavenly Temple and Final Portents"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 19 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And there was given me a reed like unto a rod: and the angel stood, saying, Rise, and measure the temple of God, and the altar, and them that worship therein.',
   'Καὶ ἐδόθη μοι κάλαμος ὅμοιος ῥάβδῳ, λέγων· Ἔγειρε καὶ μέτρησον τὸν ναὸν τοῦ Θεοῦ καὶ τὸ θυσιαστήριον καὶ τοὺς προσκυνοῦντας ἐν αὐτῷ.',
   'Kai edothē moi kalamōs homoios rhabdō, legōn: Egeire kai metrēson ton naon tou Theou kai to thysiastērion kai tous proskynountas en autō.',
   'John is given a ''reed like unto a rod'' (κάλαμος ὅμοιος ῥάβδῳ), a measuring instrument, echoing Ezekiel''s vision of the rebuilt temple (Ezek 40:3-5) and Zechariah''s vision of Jerusalem''s protection (Zech 2:1-5). This act of measuring signifies divine preservation and ownership, marking out what belongs to God amidst impending judgment. The ''temple of God'' (ναὸν τοῦ Θεοῦ) likely refers to the spiritual temple, the church, rather than a literal physical structure, as the outer court is given to the Gentiles. The ''altar'' and ''worshippers'' further emphasize the spiritual nature of this preserved remnant.',
   'This verse highlights God''s sovereign act of preserving His true worshippers during times of intense tribulation. The measuring signifies divine protection and discernment, indicating that while the world may rage, God knows and safeguards His own, ensuring their spiritual integrity and ultimate salvation.'),
  (2,
   'But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles: and the holy city shall they tread under foot forty and two months.',
   'Καὶ τὴν αὐλὴν τὴν ἔξωθεν τοῦ ναοῦ ἔκβαλε ἔξω, καὶ μὴ αὐτὴν μετρήσῃς, ὅτι ἐδόθη τοῖς ἔθνεσιν, καὶ τὴν πόλιν τὴν ἁγίαν πατήσουσιν τεσσεράκοντα καὶ δύο μῆνας.',
   'Kai tēn aulēn tēn exōthen tou naou ekbale exō, kai mē autēn metrēsēs, hoti edothē tois ethnesin, kai tēn polin tēn hagian patēsousin tesserakonta kai duo mēnas.',
   'The command to ''leave out'' (ἔκβαλε ἔξω) the outer court and not measure it signifies its abandonment to Gentile desecration. This ''holy city'' (πόλιν τὴν ἁγίαν) refers to Jerusalem, which will be ''trod under foot'' (πατήσουσιν) for ''forty and two months'' (τεσσεράκοντα καὶ δύο μῆνας). This period, equivalent to 1260 days or 3.5 years, is a symbolic duration of tribulation and persecution, found throughout apocalyptic literature (Dan 7:25; Rev 13:5). It represents a limited, divinely appointed time of suffering for God''s people.',
   NULL),
  (3,
   'And I will give power unto my two witnesses, and they shall prophesy a thousand two hundred and threescore days, clothed in sackcloth.',
   'Καὶ δώσω τοῖς δυσὶ μάρτυσί μου, καὶ προφητεύσουσιν ἡμέρας χιλίας διακοσίας ἑξήκοντα, περιβεβλημένοι σάκκους.',
   'Kai dōsō tois dysi martysi mou, kai prophēteusousin hēmeras chlias diakosias hexēkonta, peribeblēmenoi sakkous.',
   'God grants ''power'' (δώσω) to ''my two witnesses'' (δυσὶ μάρτυσί μου), whose identity is a subject of much debate, often linked to Moses and Elijah due to their miraculous powers (v. 6) or representing the collective witness of the church. Their ministry lasts ''one thousand two hundred and threescore days'' (1260 days), equivalent to 42 months or 3.5 years, a symbolic period of tribulation also mentioned in Daniel (Dan 7:25, 12:7) and Revelation (Rev 12:6, 13:5). Clothed in ''sackcloth'' (σάκκους), they signify repentance, mourning, and prophetic lamentation, characteristic of Old Testament prophets (Isa 20:2, Zech 13:4).',
   'This verse underscores the divine commission and protection of God''s witnesses during a period of intense spiritual conflict. Their prophetic ministry, though marked by suffering and lament, is a testament to God''s enduring word and His commitment to call humanity to repentance, even in the face of overwhelming opposition.'),
  (4,
   'These are the two olive trees, and the two candlesticks standing before the God of the earth.',
   'Οὗτοί εἰσιν αἱ δύο ἐλαῖαι καὶ αἱ δύο λυχνίαι αἱ ἐνώπιον τοῦ Κυρίου τῆς γῆς ἑστῶτες.',
   'Houtoi eisin hai duo elaiai kai hai duo lychniai hai enōpion tou Kyriou tēs gēs hestōtes.',
   'The description of the two witnesses as ''the two olive trees, and the two candlesticks'' (δύο ἐλαῖαι καὶ αἱ δύο λυχνίαι) directly alludes to Zechariah 4:2-14. In Zechariah, the two olive trees represent Joshua the high priest and Zerubbabel the governor, empowered by the Spirit to rebuild the temple. Here, they symbolize those who are anointed by the Holy Spirit (oil from the olive trees) and bear witness to God''s truth (light from the candlesticks) ''before the God of the earth'' (ἐνώπιον τοῦ Κυρίου τῆς γῆς), emphasizing their divine appointment and authority.',
   NULL),
  (5,
   'And if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies: and if any man will hurt them, he must in this manner be killed.',
   'Καὶ εἴ τις αὐτοὺς θέλει ἀδικῆσαι, πῦρ ἐκπορεύεται ἐκ τοῦ στόματος αὐτῶν καὶ κατεσθίει τοὺς ἐχθροὺς αὐτῶν· καὶ εἴ τις αὐτοὺς θέλει ἀδικῆσαι, οὗτος δεῖ ἀποκτανθῆναι.',
   'Kai ei tis autous thelei adikēsai, pyr ekporeuetai ek tou stomatos autōn kai katesthiei tous echthrous autōn; kai ei tis autous thelei adikēsai, houtos dei apoktanthēnai.',
   'The witnesses'' power to emit ''fire out of their mouth'' (πῦρ ἐκπορεύεται ἐκ τοῦ στόματος αὐτῶν) to ''devour their enemies'' (κατεσθίει τοὺς ἐχθροὺς αὐτῶν) is reminiscent of Elijah calling down fire from heaven (2 Kgs 1:10-12) and the prophetic judgment pronounced by Jeremiah (Jer 5:14). This imagery signifies the potent, destructive power of God''s word spoken through His prophets. It serves as a divine protection, ensuring their ministry can be completed without premature interference, highlighting God''s sovereign control over their lives and mission.',
   'This verse illustrates the divine protection afforded to God''s faithful witnesses, demonstrating that their authority is not their own but derived from God. The judgment enacted through them serves as a warning against resisting God''s truth and His messengers, affirming the serious consequences of opposing divine will.'),
  (6,
   'These have power to shut heaven, that it rain not in the days of their prophecy: and have power over waters to turn them to blood, and to smite the earth with all plagues, as often as they will.',
   'Οὗτοι ἔχουσιν ἐξουσίαν κλεῖσαι τὸν οὐρανόν, ἵνα μὴ βρέχῃ ὁ ὑετός ἐν ἡμέραις αὐτῶν τῆς προφητείας· καὶ ἐξουσίαν ἔχουσιν ἐπὶ τῶν ὑδάτων στρέφειν αὐτὰ εἰς αἷμα, καὶ πατάξαι τὴν γῆν ἐν πάσῃ πληγῇ, ὁσάκις ἐὰν θελήσωσιν.',
   'Houtoi echousin exousian kleisai ton ouranon, hina mē brechē ho hyetos en hēmerais autōn tēs prophēteias; kai exousian echousin epi tōn hydatōn strephein auta eis haima, kai pataxai tēn gēn en pasē plēgē, hosakis ean thelēsōsin.',
   'The powers granted to the witnesses further identify them with key Old Testament figures. The ability to ''shut heaven, that it rain not'' (κλεῖσαι τὸν οὐρανόν, ἵνα μὴ βρέχῃ ὁ ὑετός) directly parallels Elijah''s ministry (1 Kgs 17:1; Jas 5:17). The power to ''turn waters to blood'' (στρέφειν αὐτὰ εἰς αἷμα) and ''smite the earth with all plagues'' (πατάξαι τὴν γῆν ἐν πάσῃ πληγῇ) echoes Moses''s actions during the Exodus plagues (Exod 7:19-21). These miraculous abilities underscore their divine commission and the severity of the judgments they pronounce, demonstrating God''s direct intervention through His chosen instruments.',
   NULL),
  (7,
   'And when they shall have finished their testimony, the beast that ascendeth out of the bottomless pit shall make war against them, and shall overcome them, and kill them.',
   'Καὶ ὅταν τελέσωσιν τὴν μαρτυρίαν αὐτῶν, τὸ θηρίον τὸ ἀναβαῖνον ἐκ τῆς ἀβύσσου ποιήσει πόλεμον μετ’ αὐτῶν καὶ νικήσει αὐτοὺς καὶ ἀποκτενεῖ αὐτούς.',
   'Kai hotan telesōsin tēn martyrian autōn, to thērion to anabainon ek tēs abyssou poiēsei polemon met'' autōn kai nikēsei autous kai apoktenei autous.',
   'The phrase ''when they shall have finished their testimony'' (ὅταν τελέσωσιν τὴν μαρτυρίαν αὐτῶν) indicates that their death is not a defeat but a divinely appointed culmination of their mission. The ''beast that ascendeth out of the bottomless pit'' (τὸ θηρίον τὸ ἀναβαῖνον ἐκ τῆς ἀβύσσου) is introduced here, a powerful demonic entity (Rev 13:1; 17:8) representing ultimate evil and opposition to God. This beast will ''make war against them'' (ποιήσει πόλεμον μετ’ αὐτῶν), ''overcome them'' (νικήσει αὐτοὺς), and ''kill them'' (ἀποκτενεῖ αὐτούς), signifying the intense persecution and martyrdom faced by God''s faithful witnesses.',
   'This verse reveals the spiritual warfare inherent in Christian witness, where faithful proclamation often leads to intense opposition from demonic forces. It highlights the reality of martyrdom for Christ''s followers, yet emphasizes that their death is not a failure but a completion of their God-given testimony, ultimately serving God''s larger redemptive plan.'),
  (8,
   'And their dead bodies shall lie in the street of the great city, which spiritually is called Sodom and Egypt, where also our Lord was crucified.',
   'Καὶ τὰ πτώματα αὐτῶν ἐπὶ τῆς πλατείας τῆς πόλεως τῆς μεγάλης, ἥτις καλεῖται πνευματικῶς Σόδομα καὶ Αἴγυπτος, ὅπου καὶ ὁ Κύριος ἡμῶν ἐσταυρώθη.',
   'Kai ta ptōmata autōn epi tēs plateias tēs poleōs tēs megalēs, hētis kaleitai pneumatikōs Sodoma kai Aigyptos, hopou kai ho Kyrios hēmōn estaurōthē.',
   'The ''great city'' (πόλεως τῆς μεγάλης) where their bodies lie is identified ''spiritually'' (πνευματικῶς) as ''Sodom and Egypt'' (Σόδομα καὶ Αἴγυπτος). Sodom symbolizes moral corruption and rebellion against God (Gen 19), while Egypt represents oppression and bondage (Exod 1-14). The crucial identifier, ''where also our Lord was crucified'' (ὅπου καὶ ὁ Κύριος ἡμῶν ἐσταυρώθη), points unequivocally to Jerusalem. This spiritual designation reveals Jerusalem''s deep apostasy and rejection of God''s truth, placing it in symbolic solidarity with the most wicked cities of history.',
   'This verse starkly portrays the spiritual degradation of a city that once bore God''s name but has become morally corrupt and hostile to Christ. It serves as a powerful reminder that outward religious identity does not guarantee spiritual faithfulness, and even sacred places can become centers of rebellion against God.'),
  (9,
   'And they of the people and kindreds and tongues and nations shall see their dead bodies three days and an half, and shall not suffer their dead bodies to be put in graves.',
   'Καὶ βλέπουσιν ἐκ τῶν λαῶν καὶ φυλῶν καὶ γλωσσῶν καὶ ἐθνῶν τὰ πτώματα αὐτῶν ἡμέρας τρεῖς καὶ ἥμισυ, καὶ τὰ πτώματα αὐτῶν οὐκ ἀφήσουσιν τεθῆναι εἰς μνήματα.',
   'Kai blepousin ek tōn laōn kai phylōn kai glōssōn kai ethnōn ta ptōmata autōn hēmeras treis kai hēmisy, kai ta ptōmata autōn ouk aphēsousin tethenai eis mnēmata.',
   'The global visibility of their dead bodies (''peoples and kindreds and tongues and nations'' – λαῶν καὶ φυλῶν καὶ γλωσσῶν καὶ ἐθνῶν) suggests a worldwide communication or media event, emphasizing the universal impact of their martyrdom. The refusal to allow their bodies to be ''put in graves'' (τεθῆναι εἰς μνήματα) is a profound act of dishonor and cruelty in ancient cultures, intended to further humiliate the witnesses and deny them a peaceful rest. This public display of their corpses lasts for ''three days and an half'' (ἡμέρας τρεῖς καὶ ἥμισυ), a period mirroring the 3.5 years of their ministry, but in a compressed, intense form.',
   NULL),
  (10,
   'And they that dwell upon the earth shall rejoice over them, and make merry, and shall send gifts one to another; because these two prophets tormented them that dwelt on the earth.',
   'Καὶ οἱ κατοικοῦντες ἐπὶ τῆς γῆς χαίρουσιν ἐπ’ αὐτοῖς καὶ εὐφραίνονται, καὶ δῶρα πέμψουσιν ἀλλήλοις, ὅτι οὗτοι οἱ δύο προφῆται ἐβασάνισαν τοὺς κατοικοῦντας ἐπὶ τῆς γῆς.',
   'Kai hoi katoikountes epi tēs gēs chairousin ep'' autois kai euphrainontai, kai dōra pempsousin allēlois, hoti houtoi hoi duo prophētai ebasanisan tous katoikountas epi tēs gēs.',
   'The ''dwellers upon the earth'' (οἱ κατοικοῦντες ἐπὶ τῆς γῆς), a common phrase in Revelation referring to those hostile to God, ''rejoice over them, and make merry, and shall send gifts one to another'' (χαίρουσιν ἐπ’ αὐτοῖς καὶ εὐφραίνονται, καὶ δῶρα πέμψουσιν ἀλλήλοις). This celebration, reminiscent of a holiday, highlights the world''s relief and triumph over the prophets whose testimony ''tormented'' (ἐβασάνισαν) them. The prophets'' message of repentance and judgment was a source of discomfort and distress to those who preferred to live in sin, making their death a cause for perverse celebration.',
   'This verse starkly portrays the world''s animosity towards God''s truth and His messengers. The celebration of the prophets'' death reveals a deep spiritual blindness and rebellion, where the discomfort of conviction is preferred over the path of repentance, illustrating humanity''s fallen nature and resistance to divine authority.'),
  (11,
   'And after three days and an half the Spirit of life from God entered into them, and they stood upon their feet; and great fear fell upon them which saw them.',
   'Καὶ μετὰ τὰς τρεῖς ἡμέρας καὶ ἥμισυ πνεῦμα ζωῆς ἐκ τοῦ Θεοῦ εἰσῆλθεν ἐν αὐτοῖς, καὶ ἔστησαν ἐπὶ τοὺς πόδας αὐτῶν, καὶ φόβος μέγας ἐπέπεσεν ἐπὶ τοὺς θεωροῦντας αὐτούς.',
   'Kai meta tas treis hēmeras kai hēmisy pneuma zōēs ek tou Theou eisēlthen en autois, kai estēsan epi tous podas autōn, kai phobos megas epepesen epi tous theōrountas autous.',
   'Just as the world celebrates, a dramatic reversal occurs: ''after three days and an half'' (μετὰ τὰς τρεῖς ἡμέρας καὶ ἥμισυ), ''the Spirit of life from God'' (πνεῦμα ζωῆς ἐκ τοῦ Θεοῦ) enters them, and ''they stood upon their feet'' (ἔστησαν ἐπὶ τοὺς πόδας αὐτῶν). This miraculous resurrection echoes Ezekiel''s vision of the dry bones (Ezek 37:1-14) and Christ''s own resurrection. The resurrection instills ''great fear'' (φόβος μέγας) in those who witnessed their death and subsequent revival, transforming their mockery into terror. This event powerfully validates their prophetic ministry and God''s ultimate authority over life and death.',
   'This verse is a profound affirmation of God''s power over death and His vindication of His faithful witnesses. The resurrection of the two prophets serves as a powerful prefigurement of the general resurrection and a testament to the ultimate triumph of life over death, and truth over persecution, instilling fear in those who opposed God.'),
  (12,
   'And they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud; and their enemies beheld them.',
   'Καὶ ἤκουσαν φωνὴν μεγάλην ἐκ τοῦ οὐρανοῦ λέγουσαν αὐτοῖς· Ἀνάβητε ὧδε. Καὶ ἀνέβησαν εἰς τὸν οὐρανὸν ἐν τῇ νεφέλῃ, καὶ ἐθεώρησαν αὐτοὺς οἱ ἐχθροὶ αὐτῶν.',
   'Kai ēkousan phōnēn megalēn ek tou ouranou legousan autois: Anabēte hōde. Kai anebēsan eis ton ouranon en tē nephelē, kai etheōrēsan autous hoi echthroi autōn.',
   'Following their resurrection, the witnesses hear a ''great voice from heaven'' (φωνὴν μεγάλην ἐκ τοῦ οὐρανοῦ) inviting them, ''Come up hither'' (Ἀνάβητε ὧδε). They then ''ascended up to heaven in a cloud'' (ἀνέβησαν εἰς τὸν οὐρανὸν ἐν τῇ νεφέλῃ), a clear parallel to Christ''s ascension (Acts 1:9) and Elijah''s rapture (2 Kgs 2:11). This public ascension, witnessed by ''their enemies'' (οἱ ἐχθροὶ αὐτῶν), serves as a final, undeniable vindication of their ministry and a powerful demonstration of God''s sovereignty. It confirms their divine approval and foreshadows the future rapture of believers.',
   NULL),
  (13,
   'And the same hour was there a great earthquake, and the tenth part of the city fell, and in the earthquake were slain of men seven thousand: and the remnant were affrighted, and gave glory to the God of heaven.',
   'Καὶ ἐν ἐκείνῃ τῇ ὥρᾳ ἐγένετο σεισμὸς μέγας, καὶ τὸ δέκατον τῆς πόλεως ἔπεσεν, καὶ ἀπεκτάνθησαν ἐν τῷ σεισμῷ ὀνόματα ἀνθρώπων ἑπτακισχίλιοι· καὶ οἱ λοιποὶ ἔμφοβοι ἐγένοντο καὶ ἔδωκαν δόξαν τῷ Θεῷ τοῦ οὐρανοῦ.',
   'Kai en ekeinē tē hōra egeneto seismos megas, kai to dekaton tēs poleōs epesen, kai apektanthēsan en tō seismō onomata anthrōpōn heptakischilioi; kai hoi loipoi emphoboi egenonto kai edōkan doxan tō Theō tou ouranou.',
   'Immediately after the witnesses'' ascension, a ''great earthquake'' (σεισμὸς μέγας) strikes, causing ''the tenth part of the city'' (τὸ δέκατον τῆς πόλεως) to fall and ''seven thousand'' (ἑπτακισχίλιοι) people to be killed. The number seven thousand often symbolizes completeness in judgment. Significantly, ''the remnant were affrighted, and gave glory to the God of heaven'' (ἔμφοβοι ἐγένοντο καὶ ἔδωκαν δόξαν τῷ Θεῷ τοῦ οὐρανοῦ). This response, though born of fear, indicates a measure of repentance or acknowledgment of God''s power, a rare occurrence among the ''earth-dwellers'' in Revelation.',
   'This verse demonstrates God''s immediate and powerful judgment upon those who oppose Him, yet also reveals His capacity for mercy. The repentance of the remnant, even if fear-induced, highlights that divine judgment can lead to an acknowledgment of God''s sovereignty, offering a glimmer of hope amidst widespread rebellion.'),
  (14,
   'The second woe is past; and, behold, the third woe cometh quickly.',
   'Ἡ οὐαὶ ἡ δευτέρα ἀπῆλθεν· ἰδοὺ ἡ οὐαὶ ἡ τρίτη ἔρχεται ταχύ.',
   'Hē ouai hē deutera apēlthen; idou hē ouai hē tritē erchetai tachy.',
   'This verse serves as a brief interlude, marking the conclusion of the ''second woe'' (δευτέρα οὐαὶ), which encompassed the events of the two witnesses'' ministry, death, resurrection, and the subsequent earthquake. It then announces the imminent arrival of the ''third woe'' (τρίτη οὐαὶ), creating a sense of escalating divine judgment. This structural marker prepares the reader for the dramatic shift in focus to the sounding of the seventh trumpet and the final, ultimate judgments and kingdom proclamations.',
   NULL),
  (15,
   'And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Christ; and he shall reign for ever and ever.',
   'Καὶ ὁ ἕβδομος ἄγγελος ἐσάλπισεν· καὶ ἐγένοντο φωναὶ μεγάλαι ἐν τῷ οὐρανῷ, λέγουσαι· Ἐγένοντο αἱ βασιλεῖαι τοῦ κόσμου τοῦ Κυρίου ἡμῶν καὶ τοῦ Χριστοῦ αὐτοῦ, καὶ βασιλεύσει εἰς τοὺς αἰῶνας τῶν αἰώνων.',
   'Kai ho hebdomos angelos esalpisen; kai egenonto phōnai megalai en tō ouranō, legousai: Egenonto hai basileiai tou kosmou tou Kyriou hēmōn kai tou Christou autou, kai basileusei eis tous aiōnas tōn aiōnōn.',
   'The sounding of the ''seventh angel'' (ἕβδομος ἄγγελος) trumpet marks a dramatic turning point, signaling the culmination of God''s judgments and the commencement of His eternal reign. The ''great voices in heaven'' (φωναὶ μεγάλαι ἐν τῷ οὐρανῷ) declare the decisive victory of God and His Christ over all earthly powers. This is not merely a future event but a present reality declared in heaven, signifying that the kingdoms of the world *have become* (ἐγένοντο, aorist tense) the kingdoms of God, reflecting a theological truth that God''s sovereignty is now fully manifested and recognized.',
   'This verse is a climactic declaration of God''s ultimate sovereignty and the irreversible establishment of Christ''s kingdom. It proclaims the triumph of divine rule over all earthly dominions, affirming that despite temporary appearances, God''s plan for redemption and judgment will be fully realized, leading to His eternal reign.'),
  (16,
   'And the four and twenty elders, which sat before God on their seats, fell upon their faces, and worshipped God,',
   'Καὶ οἱ εἴκοσι τέσσαρες πρεσβύτεροι οἱ ἐνώπιον τοῦ Θεοῦ καθήμενοι ἐπὶ τοὺς θρόνους αὐτῶν ἔπεσαν ἐπὶ τὰ πρόσωπα αὐτῶν καὶ προσεκύνησαν τῷ Θεῷ,',
   'Kai hoi eikosi tessares presbyteroi hoi enōpion tou Theou kathēmenoi epi tous thronous autōn epesan epi ta prosōpa autōn kai prosekynēsan tō Theō,',
   'In response to the heavenly proclamation, the ''four and twenty elders'' (εἴκοσι τέσσαρες πρεσβύτεροι), who represent the redeemed church (Rev 4:4), fall ''upon their faces'' (ἔπεσαν ἐπὶ τὰ πρόσωπα αὐτῶν) in worship. This posture signifies profound reverence, humility, and adoration before God''s manifest sovereignty. Their worship acknowledges the fulfillment of God''s promises and the commencement of His ultimate reign, demonstrating the appropriate response of all creation to the revelation of God''s power and justice.',
   NULL),
  (17,
   'Saying, We give thee thanks, O LORD God Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned.',
   'λέγοντες· Εὐχαριστοῦμέν σοι, Κύριε ὁ Θεὸς ὁ Παντοκράτωρ, ὁ ὢν καὶ ὁ ἦν καὶ ὁ ἐρχόμενος, ὅτι εἴληφας τὴν δύναμίν σου τὴν μεγάλην καὶ ἐβασίλευσας.',
   'legontes: Eucharistoūmen soi, Kyrie ho Theos ho Pantokratōr, ho ōn kai ho ēn kai ho erchomenos, hoti eilēphas tēn dynamin sou tēn megalēn kai ebasileusas.',
   'The elders'' prayer is a hymn of thanksgiving, addressing God as ''LORD God Almighty'' (Κύριε ὁ Θεὸς ὁ Παντοκράτωρ) and acknowledging His eternal nature: ''which art, and wast, and art to come'' (ὁ ὢν καὶ ὁ ἦν καὶ ὁ ἐρχόμενος). The core of their praise is ''because thou hast taken to thee thy great power, and hast reigned'' (ὅτι εἴληφας τὴν δύναμίν σου τὴν μεγάλην καὶ ἐβασίλευσας). This signifies not that God was previously powerless, but that He has now fully asserted His sovereign rule, bringing His redemptive and judicial plans to their decisive conclusion. It is a declaration of His manifest and undisputed dominion.',
   'This verse articulates a profound theological truth: God''s eternal nature and omnipotence are the foundation for His ultimate triumph. The elders'' thanksgiving celebrates God''s active engagement in history, culminating in the full exercise of His sovereign power and the establishment of His righteous reign over all creation.'),
  (18,
   'And the nations were angry, and thy wrath is come, and the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints, and them that fear thy name, small and great; and shouldest destroy them which destroy the earth.',
   'Καὶ τὰ ἔθνη ὠργίσθησαν, καὶ ἦλθεν ἡ ὀργή σου, καὶ ὁ καιρὸς τῶν νεκρῶν κριθῆναι, καὶ δοῦναι τὸν μισθὸν τοῖς δούλοις σου τοῖς προφήταις καὶ τοῖς ἁγίοις καὶ τοῖς φοβουμένοις τὸ ὄνομά σου, τοῖς μικροῖς καὶ τοῖς μεγάλοις, καὶ διαφθεῖραι τοὺς διαφθείροντας τὴν γῆν.',
   'Kai ta ethnē orgisthēsan, kai ēlthen hē orgē sou, kai ho kairos tōn nekrōn krithēnai, kai dounai ton misthon tois doulois sou tois prophētais kai tois hagiois kai tois phoboumenois to onoma sou, tois mikrois kai tois megalois, kai diaphtheirai tous diaphthairontas tēn gēn.',
   'The elders'' hymn continues, outlining the consequences of God''s reign: the ''nations were angry'' (τὰ ἔθνη ὠργίσθησαν), reflecting their futile rebellion against God''s authority. In response, ''thy wrath is come'' (ἦλθεν ἡ ὀργή σου), signifying divine judgment. This judgment includes ''the time of the dead, that they should be judged'' (ὁ καιρὸς τῶν νεκρῶν κριθῆναι), and the giving of ''reward unto thy servants the prophets, and to the saints'' (δοῦναι τὸν μισθὸν τοῖς δούλοις σου τοῖς προφήταις καὶ τοῖς ἁγίοις). Finally, it involves the destruction of ''them which destroy the earth'' (διαφθεῖραι τοὺς διαφθείροντας τὴν γῆν), a principle of divine justice.',
   'This verse encapsulates the comprehensive nature of God''s final judgment: it addresses the rebellion of nations, judges the dead, rewards the faithful (prophets, saints, and all who fear His name), and justly punishes those who have corrupted creation. It affirms God''s perfect justice and His commitment to both recompense and retribution.'),
  (19,
   'And the temple of God was opened in heaven, and there was seen in his temple the ark of his testament: and there were lightnings, and voices, and thunderings, and an earthquake, and great hail.',
   'Καὶ ἠνοίγη ὁ ναὸς τοῦ Θεοῦ ἐν τῷ οὐρανῷ, καὶ ὤφθη ἡ κιβωτὸς τῆς διαθήκης αὐτοῦ ἐν τῷ ναῷ αὐτοῦ· καὶ ἐγένοντο ἀστραπαὶ καὶ φωναὶ καὶ βρονταὶ καὶ σεισμὸς καὶ χάλαζα μεγάλη.',
   'Kai ēnoigē ho naos tou Theou en tō ouranō, kai ōphthē hē kibōtos tēs diathēkēs autou en tō naō autou; kai egenonto astrapai kai phōnai kai brontai kai seismos kai chalaza megalē.',
   'The chapter concludes with the dramatic opening of ''the temple of God in heaven'' (ὁ ναὸς τοῦ Θεοῦ ἐν τῷ οὐρανῷ), revealing ''the ark of his testament'' (ἡ κιβωτὸς τῆς διαθήκης αὐτοῦ). The ark, a symbol of God''s presence, covenant, and law in the Old Testament (Exod 25:10-22), signifies that God''s covenant faithfulness and justice are now fully manifest. This revelation is accompanied by intense celestial phenomena: ''lightnings, and voices, and thunderings, and an earthquake, and great hail'' (ἀστραπαὶ καὶ φωναὶ καὶ βρονταὶ καὶ σεισμὸς καὶ χάλαζα μεγάλη), which are typical signs of divine judgment and theophany, underscoring the awesome power and majesty of God''s presence.',
   'The opening of the heavenly temple and the revelation of the Ark of the Covenant signify the ultimate fulfillment of God''s covenant promises and the manifestation of His righteous judgment. It assures believers of God''s unwavering faithfulness and the certainty of His justice, bringing both comfort and solemn warning.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 11;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ναὸν', 'naon', 'G3485', 'From `naiō` (to dwell), `naos` refers to the inner sanctuary of a temple, the dwelling place of God, as opposed to the broader temple complex (hieron). Theologically, in the New Testament, it often refers to the spiritual temple of God, which is the church or individual believers, where God''s presence truly resides (1 Cor 3:16; Eph 2:21).', 1),
  ('προσκυνοῦντας', 'proskynountas', 'G4352', 'From `pros` (towards) and `kyneō` (to kiss), `proskyneō` means to prostrate oneself in adoration, to do homage, or to worship. It implies a posture of reverence and submission, acknowledging the superior authority or divinity of the one being worshipped. In Revelation, it is used for both true worship of God and false worship of the Beast.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μάρτυσί', 'martysi', 'G3144', 'From `martys` (a witness), `martys` refers to one who testifies or bears witness, often at great personal cost. It is the root of the English word ''martyr.'' In the New Testament, it signifies those who proclaim the truth of Christ, even to the point of death, thereby validating their testimony through suffering and faithfulness.', 1),
  ('προφητεύσουσιν', 'prophēteusousin', 'G4395', 'From `prophētēs` (prophet), `prophēteuō` means to prophesy, to speak under divine inspiration, or to foretell future events. It involves proclaiming God''s message, often calling for repentance or revealing divine plans. The witnesses'' prophecy is a direct utterance of God''s word, carrying His authority and judgment.', 2),
  ('σάκκους', 'sakkous', 'G4526', 'From Hebrew `saq`, `sakkos` refers to sackcloth, a coarse fabric typically made of goat''s hair. It was worn as a sign of mourning, repentance, humility, or distress. Its use by the witnesses signifies their lament over the world''s sin and their call for repentance, aligning them with Old Testament prophets.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 3;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θηρίον', 'thērion', 'G2342', 'From `thēr` (a wild beast), `thērion` denotes a wild animal or beast. In Revelation, it is consistently used metaphorically to describe powerful, oppressive, and demonic political or spiritual entities that oppose God and persecute His people, embodying ultimate evil and rebellion against divine authority.', 1),
  ('ἀβύσσου', 'abyssou', 'G12', 'From `a` (negative prefix) and `byssos` (bottom), `abyssos` means ''bottomless pit'' or ''abyss.'' It refers to a deep, dark, immeasurable chasm, often associated with the underworld or a prison for demonic spirits. In Revelation, it is the place from which the Beast emerges, signifying its demonic origin and power.', 2),
  ('πόλεμον', 'polemon', 'G4171', 'From `pellō` (to shake), `polemos` means ''war'' or ''battle.'' It describes armed conflict, contention, or struggle. In Revelation, it signifies the intense spiritual and physical conflict between God''s forces and the forces of evil, often involving persecution and martyrdom of believers.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 7;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πνευματικῶς', 'pneumatikōs', 'G4153', 'From `pneumatikos` (spiritual), `pneumatikōs` means ''spiritually'' or ''in a spiritual sense.'' It indicates that the designation of the city as Sodom and Egypt is not literal geographical identification but a symbolic, theological interpretation of its moral and spiritual condition, revealing its true nature in God''s eyes.', 1),
  ('ἐσταυρώθη', 'estaurōthē', 'G4717', 'From `stauros` (cross), `stauroō` means ''to crucify.'' This aorist passive form ''was crucified'' refers to the historical event of Jesus'' death on the cross. Its inclusion here anchors the symbolic location of the witnesses'' death to the actual place of Christ''s suffering, highlighting the continuity of persecution against God''s anointed.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 8;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πνεῦμα', 'pneuma', 'G4151', 'From `pneō` (to breathe), `pneuma` means ''spirit,'' ''wind,'' or ''breath.'' In this context, ''Spirit of life'' refers to the life-giving power emanating from God, signifying divine animation and resurrection power. It is the essence of life itself, directly imparted by God to revive the dead witnesses.', 1),
  ('ζωῆς', 'zōēs', 'G2222', 'From `zaō` (to live), `zōē` refers to life, particularly spiritual and eternal life, as opposed to mere physical existence. When combined with `pneuma`, it emphasizes the divine, supernatural quality of the life imparted, signifying a resurrection to a new, God-given existence.', 2),
  ('φόβος', 'phobos', 'G5401', 'From `phebomai` (to flee, be afraid), `phobos` means ''fear,'' ''terror,'' or ''dread.'' It can denote either a paralyzing terror or a reverential awe. Here, the ''great fear'' experienced by the onlookers is a response to the miraculous resurrection, indicating a recognition of divine power and judgment.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 11;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βασιλεῖαι', 'basileiai', 'G932', 'The plural of `basileia` (kingdom), `basileiai` refers to multiple kingdoms or realms. The declaration ''the kingdoms of this world are become the kingdoms of our Lord'' signifies the transfer of ultimate authority from earthly powers to God and Christ, marking the decisive end of human dominion.', 1),
  ('κόσμου', 'kosmou', 'G2889', 'From `komizō` (to arrange), `kosmos` refers to the world, the ordered universe, or humanity. In a theological sense, especially in Revelation, it often denotes the fallen world system in opposition to God. Here, ''kingdoms of the world'' refers to all earthly political and social structures.', 2),
  ('βασιλεύσει', 'basileusei', 'G936', 'From `basileus` (king), `basileuō` means ''to reign,'' ''to rule as king,'' or ''to exercise royal authority.'' This future tense verb emphasizes the eternal and continuous nature of Christ''s reign, affirming that His dominion will never end and will encompass all ages.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 15;

-- Verse 18
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὀργή', 'orgē', 'G3709', 'From `oregō` (to stretch out), `orgē` refers to wrath, anger, or indignation. In a divine context, it signifies God''s righteous and settled opposition to sin and rebellion, not an uncontrolled outburst, but a just and holy judgment against unrighteousness. It is a manifestation of His divine character.', 1),
  ('κριθῆναι', 'krithēnai', 'G2919', 'From `krinō` (to judge), `krithēnai` is an aorist passive infinitive meaning ''to be judged.'' It refers to the time when the dead will face God''s judgment, where their deeds will be evaluated, and their eternal destiny determined. This signifies the final accountability for all humanity.', 2),
  ('μισθὸν', 'misthon', 'G3406', 'From `misthos` (wages), `misthon` refers to reward, recompense, or payment for service. In a theological context, it signifies the just compensation given by God to His faithful servants for their labors and obedience, emphasizing divine justice in rewarding righteousness.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = 18;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Ezekiel 40:3-5', 1),
  (1, 'Zechariah 2:1-5', 2),
  (1, 'Revelation 21:15', 3),
  (1, '1 Corinthians 3:16-17', 4),
  (2, 'Daniel 7:25', 1),
  (2, 'Luke 21:24', 2),
  (2, 'Revelation 13:5', 3),
  (2, 'Psalm 79:1', 4),
  (3, 'Daniel 12:7', 1),
  (3, 'Revelation 12:6', 2),
  (3, 'Zechariah 4:14', 3),
  (3, 'Matthew 17:3', 4),
  (3, 'Isaiah 20:2', 5),
  (4, 'Zechariah 4:2-3', 1),
  (4, 'Zechariah 4:11-14', 2),
  (4, 'Psalm 52:8', 3),
  (4, 'Matthew 5:14-16', 4),
  (5, '2 Kings 1:10-12', 1),
  (5, 'Jeremiah 5:14', 2),
  (5, 'Numbers 16:35', 3),
  (5, 'Hebrews 12:29', 4),
  (6, '1 Kings 17:1', 1),
  (6, 'James 5:17', 2),
  (6, 'Exodus 7:19-21', 3),
  (6, 'Psalm 105:29', 4),
  (6, 'Exodus 9:14', 5),
  (7, 'Daniel 7:21', 1),
  (7, 'Revelation 13:7', 2),
  (7, 'Revelation 17:8', 3),
  (7, '1 John 4:3', 4),
  (8, 'Isaiah 1:9-10', 1),
  (8, 'Genesis 19:24', 2),
  (8, 'Exodus 1:8-14', 3),
  (8, 'Hebrews 13:12', 4),
  (9, 'Psalm 79:2-3', 1),
  (9, 'Revelation 13:7', 2),
  (9, 'Daniel 7:25', 3),
  (9, 'Revelation 17:15', 4),
  (10, 'Revelation 13:8', 1),
  (10, 'Revelation 18:7', 2),
  (10, 'Luke 16:19-31', 3),
  (10, 'Proverbs 29:2', 4),
  (11, 'Ezekiel 37:5-10', 1),
  (11, 'Romans 8:11', 2),
  (11, 'John 5:25', 3),
  (11, 'Revelation 20:4', 4),
  (12, 'Acts 1:9-11', 1),
  (12, '2 Kings 2:11', 2),
  (12, '1 Thessalonians 4:17', 3),
  (12, 'John 14:3', 4),
  (13, 'Revelation 6:12', 1),
  (13, 'Revelation 16:18', 2),
  (13, 'Joshua 7:19', 3),
  (13, 'Isaiah 26:16', 4),
  (14, 'Revelation 8:13', 1),
  (14, 'Revelation 9:12', 2),
  (14, 'Revelation 15:1', 3),
  (15, 'Daniel 2:44', 1),
  (15, 'Psalm 2:6-8', 2),
  (15, 'Revelation 12:10', 3),
  (15, 'Revelation 19:6', 4),
  (16, 'Revelation 4:4', 1),
  (16, 'Revelation 5:8', 2),
  (16, 'Revelation 7:11', 3),
  (16, 'Psalm 95:6', 4),
  (17, 'Revelation 1:4', 1),
  (17, 'Revelation 4:8', 2),
  (17, 'Psalm 93:1', 3),
  (17, 'Revelation 19:6', 4),
  (18, 'Psalm 2:1-5', 1),
  (18, 'Revelation 6:10', 2),
  (18, 'Revelation 20:12', 3),
  (18, 'Revelation 22:12', 4),
  (18, 'Revelation 19:2', 5),
  (19, 'Revelation 15:5', 1),
  (19, 'Exodus 25:10-22', 2),
  (19, 'Hebrews 9:3-4', 3),
  (19, 'Revelation 4:5', 4),
  (19, 'Revelation 16:21', 5)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 11 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 11 Complete!
-- 19 verses · 7 key verses with word studies (19 words)
-- Cross-references for 19 verses (79 refs)
-- ═══════════════════════════════════════════════════════