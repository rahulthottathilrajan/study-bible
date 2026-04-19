-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 11 — John's Question, Jesus' Witness, and the Great Invitation
-- 30 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 11,
  'Matthew 11 presents a pivotal transition in Jesus'' Galilean ministry. It opens with John the Baptist, imprisoned by Herod Antipas, sending disciples to ask whether Jesus is truly the Messiah — a question born not of unbelief but of perplexity, since Jesus'' ministry of mercy did not match the expected judgment John had preached (Matt 3:10-12). Jesus responds not with a direct claim but by pointing to His messianic works, drawn from Isaiah 35 and 61. He then delivers His highest commendation of John as the greatest born of women, yet paradoxically less than the least in the kingdom. The chapter takes a dark turn as Jesus pronounces covenant woes on Chorazin, Bethsaida, and Capernaum — cities that witnessed His greatest miracles yet refused to repent. The chapter climaxes with one of the most beloved passages in Scripture (vv.25-30): Jesus'' prayer of thanksgiving to the Father for sovereign revelation, His stunning claim to exclusive mutual knowledge with the Father, and the tender invitation to all who labour and are heavy laden to find rest in Him.',
  'John''s Question, Jesus'' Witness, and the Great Invitation',
  'ἀνάπαυσις (anapausis)',
  'Rest, cessation from labour — from ana (up, again) + pauō (to cease). In Matthew 11:29, Jesus promises a rest that is not mere physical relief but spiritual refreshment and peace of soul, the sabbath-rest of the new covenant that comes from yoking oneself to Christ rather than to the heavy burdens of Pharisaic legalism.',
  '["Section 1 (vv.1-6): John the Baptist''s Question from Prison and Jesus'' Reply","Section 2 (vv.7-15): Jesus'' Testimony Concerning John the Baptist","Section 3 (vv.16-19): The Parable of the Children in the Marketplace","Section 4 (vv.20-24): Woes on the Impenitent Cities — Chorazin, Bethsaida, Capernaum","Section 5 (vv.25-27): Jesus'' Prayer of Thanksgiving and His Exclusive Knowledge of the Father","Section 6 (vv.28-30): The Great Invitation — Come unto Me and Find Rest"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 30 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And it came to pass, when Jesus had made an end of commanding his twelve disciples, he departed thence to teach and to preach in their cities.',
   'Καὶ ἐγένετο ὅτε ἐτέλεσεν ὁ Ἰησοῦς διατάσσων τοῖς δώδεκα μαθηταῖς αὐτοῦ μετέβη ἐκεῖθεν τοῦ διδάσκειν καὶ κηρύσσειν ἐν ταῖς πόλεσιν αὐτῶν',
   'Kai egeneto hote etelesen ho Iēsous diatassōn tois dōdeka mathētais autou metebē ekeithen tou didaskein kai kēryssein en tais polesin autōn',
   'This transitional verse connects the commissioning of the Twelve (ch.10) with Jesus'' own continued itinerant ministry. ''Made an end of commanding'' (etelesen diatassōn) — Matthew uses this formula five times to close major discourse sections (7:28; 11:1; 13:53; 19:1; 26:1). Jesus does not merely send His disciples out; He Himself continues teaching (didaskein — systematic instruction) and preaching (kēryssein — heralding, public proclamation). ''Their cities'' refers to the cities of Galilee.',
   NULL),
  (2,
   'Now when John had heard in the prison the works of Christ, he sent two of his disciples,',
   'Ὁ δὲ Ἰωάννης ἀκούσας ἐν τῷ δεσμωτηρίῳ τὰ ἔργα τοῦ Χριστοῦ πέμψας διὰ τῶν μαθητῶν αὐτοῦ',
   'Ho de Iōannēs akousas en tō desmōtēriō ta erga tou Christou pempsas dia tōn mathētōn autou',
   'John was imprisoned at Machaerus fortress by Herod Antipas for condemning Herod''s marriage to Herodias (Matt 14:3-4; Josephus, Antiquities 18.5.2). ''The works of Christ'' (ta erga tou Christou) — Matthew deliberately uses the title ''Christ'' (Messiah) here, framing the chapter as a question about messianic identity. John hears reports of healings and teaching but no fiery judgment (cf. Matt 3:10-12), which prompts his question.',
   NULL),
  (3,
   'And said unto him, Art thou he that should come, or do we look for another?',
   'εἶπεν αὐτῷ σὺ εἶ ὁ ἐρχόμενος ἢ ἕτερον προσδοκῶμεν',
   'eipen autō sy ei ho erchomenos ē heteron prosdokōmen',
   '''He that should come'' (ho erchomenos — the Coming One) was a recognised messianic title drawn from Psalm 118:26 and Malachi 3:1. John''s question is not apostasy but holy perplexity — he expected the Messiah to bring immediate judgment (Matt 3:12), yet Jesus was performing works of mercy. Calvin and Chrysostom both note that John asked not for his own sake but for his disciples'', to direct them to Christ. The word ''another'' (heteron — a different kind) implies ''someone of a different sort altogether.''',
   'Even the greatest of God''s servants can experience seasons of doubt and perplexity when God''s ways do not match their expectations. Jesus does not rebuke John for asking but answers with patient evidence. Doubt honestly brought to Christ is met with grace, not condemnation.'),
  (4,
   'Jesus answered and said unto them, Go and shew John again those things which ye do hear and see:',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν αὐτοῖς πορευθέντες ἀπαγγείλατε Ἰωάννῃ ἃ ἀκούετε καὶ βλέπετε',
   'kai apokritheis ho Iēsous eipen autois poreuthentes apangeilate Iōannē ha akouete kai blepete',
   'Jesus does not answer with a simple ''yes'' but directs John''s disciples to report the empirical evidence — what they hear and see (akouete kai blepete — present tenses, ongoing actions). This is the epistemological pattern Jesus establishes: faith is not blind but rests on observable evidence of God''s work. ''Shew John again'' (apangeilate — report back, announce) — Jesus trusts the evidence to speak for itself.',
   NULL),
  (5,
   'The blind receive their sight, and the lame walk, the lepers are cleansed, and the deaf hear, the dead are raised up, and the poor have the gospel preached to them.',
   'τυφλοὶ ἀναβλέπουσιν καὶ χωλοὶ περιπατοῦσιν λεπροὶ καθαρίζονται καὶ κωφοὶ ἀκούουσιν νεκροὶ ἐγείρονται καὶ πτωχοὶ εὐαγγελίζονται',
   'typhloi anablepousin kai chōloi peripatousin leproi katharizontai kai kōphoi akouousin nekroi egeirontai kai ptōchoi euangelizontai',
   'Jesus catalogues six messianic signs drawn from Isaiah 35:5-6 and 61:1. Each item corresponds to specific prophecies: blind seeing (Isa 35:5), lame walking (Isa 35:6), lepers cleansed (implied in Isa 53:4), deaf hearing (Isa 35:5), dead raised (Isa 26:19), and the gospel preached to the poor (Isa 61:1). Notably absent is judgment — Jesus is fulfilling the mercy prophecies first. The climactic item is not miracles but preaching to the poor (ptōchoi — destitute, beggars), emphasising spiritual over physical restoration.',
   'Jesus defines His messiahship by the prophetic scriptures, not by popular expectation. The Messiah''s first advent is characterised by mercy, healing, and proclamation; judgment is reserved for His second coming. This two-stage fulfilment is a key hermeneutical principle for Old Testament prophecy.'),
  (6,
   'And blessed is he, whosoever shall not be offended in me.',
   'καὶ μακάριός ἐστιν ὃς ἐὰν μὴ σκανδαλισθῇ ἐν ἐμοί',
   'kai makarios estin hos ean mē skandalisthē en emoi',
   '''Blessed'' (makarios — happy, fortunate, divinely favoured) is a beatitude-form pronouncement. ''Offended'' (skandalisthē — from skandalon, a trap-stick or stumbling block) means to be tripped up, to fall away because of disappointment or unmet expectations. Jesus gently warns John — and through him all believers — that the Messiah will not always meet human expectations. A suffering, serving Messiah was a skandalon to first-century Jews (1 Cor 1:23), and remains so. This is a tender encouragement wrapped in a mild rebuke.',
   NULL),
  (7,
   'And as they departed, Jesus began to say unto the multitudes concerning John, What went ye out into the wilderness to see? A reed shaken with the wind?',
   'τούτων δὲ πορευομένων ἤρξατο ὁ Ἰησοῦς λέγειν τοῖς ὄχλοις περὶ Ἰωάννου τί ἐξήλθατε εἰς τὴν ἔρημον θεάσασθαι κάλαμον ὑπὸ ἀνέμου σαλευόμενον',
   'toutōn de poreuomenōn ērxato ho Iēsous legein tois ochlois peri Iōannou ti exēlthate eis tēn erēmon theasasthai kalamon hypo anemou saleuomenon',
   'Jesus waits until John''s disciples leave before commending John — He will not flatter John to his face. The three rhetorical questions (vv.7-9) build toward a climax. ''A reed shaken with the wind'' — reeds grew abundantly along the Jordan where John baptised. The image suggests a vacillating, spineless person. The implied answer is a forceful ''No!'' — John was anything but wavering. Some scholars note that the reed was Herod Antipas'' emblem on his coins, making this a pointed contrast: John was no political sycophant.',
   NULL),
  (8,
   'But what went ye out for to see? A man clothed in soft raiment? behold, they that wear soft clothing are in kings'' houses.',
   'ἀλλὰ τί ἐξήλθατε ἰδεῖν ἄνθρωπον ἐν μαλακοῖς ἱματίοις ἠμφιεσμένον ἰδοὺ οἱ τὰ μαλακὰ φοροῦντες ἐν τοῖς οἴκοις τῶν βασιλέων εἰσίν',
   'alla ti exēlthate idein anthrōpon en malakois himatiois ēmphiesmenon idou hoi ta malaka phorountes en tois oikois tōn basileōn eisin',
   '''Soft raiment'' (malakois himatiois — luxurious, delicate garments) — John wore camel''s hair and a leather belt (Matt 3:4), the garb of the prophets (cf. 2 Kings 1:8, Zech 13:4). The contrast is between the court prophet who tells the king what he wants to hear and the wilderness prophet who speaks truth regardless of cost. John is in a king''s house — Herod''s prison — but not because he wore soft clothing. He is there precisely because he refused to.',
   NULL),
  (9,
   'But what went ye out for to see? A prophet? yea, I say unto you, and more than a prophet.',
   'ἀλλὰ τί ἐξήλθατε ἰδεῖν προφήτην ναὶ λέγω ὑμῖν καὶ περισσότερον προφήτου',
   'alla ti exēlthate idein prophētēn nai legō hymin kai perissoteron prophētou',
   'The climax of the three questions. ''More than a prophet'' (perissoteron prophētou — something exceeding, surpassing a prophet). The prophets foretold the Messiah; John pointed to Him in person. The prophets said ''He is coming''; John said ''Behold the Lamb of God'' (John 1:29). John stands at the hinge of redemptive history — the last of the old covenant prophets and the immediate forerunner of the new.',
   NULL),
  (10,
   'For this is he, of whom it is written, Behold, I send my messenger before thy face, which shall prepare thy way before thee.',
   'οὗτος γάρ ἐστιν περὶ οὗ γέγραπται ἰδοὺ ἐγὼ ἀποστέλλω τὸν ἄγγελόν μου πρὸ προσώπου σου ὃς κατασκευάσει τὴν ὁδόν σου ἔμπροσθέν σου',
   'houtos gar estin peri hou gegraptai idou egō apostellō ton angelon mou pro prosōpou sou hos kataskeuasei tēn hodon sou emprosthen sou',
   'Jesus quotes Malachi 3:1 with a significant modification: the original reads ''before my face'' (God speaking), but Jesus changes it to ''before thy face'' — identifying Himself as the one before whose face the messenger is sent. This is an implicit claim to deity, since in Malachi the speaker is Yahweh. ''My messenger'' (ton angelon mou) — the word angelos means both ''angel'' and ''messenger,'' connecting John to the prophetic tradition. ''Prepare thy way'' (kataskeuasei tēn hodon) — John''s role was to make ready the road for the King.',
   'Jesus'' modification of Malachi 3:1 is a veiled but powerful claim to divine identity. In the original prophecy, Yahweh sends a messenger before His own face. Jesus applies this to Himself as the one whose face the messenger precedes — placing Himself in the position of Yahweh.'),
  (11,
   'Verily I say unto you, Among them that are born of women there hath not risen a greater than John the Baptist: notwithstanding he that is least in the kingdom of heaven is greater than he.',
   'ἀμὴν λέγω ὑμῖν οὐκ ἐγήγερται ἐν γεννητοῖς γυναικῶν μείζων Ἰωάννου τοῦ βαπτιστοῦ ὁ δὲ μικρότερος ἐν τῇ βασιλείᾳ τῶν οὐρανῶν μείζων αὐτοῦ ἐστιν',
   'amēn legō hymin ouk egēgertai en gennētois gynaikōn meizōn Iōannou tou baptistou ho de mikroteros en tē basileia tōn ouranōn meizōn autou estin',
   'A stunning double pronouncement. First, John is the greatest human figure in all of prior redemptive history — greater than Abraham, Moses, David, Elijah, and Isaiah. His greatness lies in his unique role as the immediate forerunner who personally identified and baptised the Messiah. Second, the paradox: ''he that is least in the kingdom'' (ho mikroteros — the lesser, the smallest) surpasses John. This is not about personal merit but about redemptive-historical privilege: those who live in the inaugurated kingdom, after the cross and resurrection, possess what John could only anticipate.',
   'The greatness of the new covenant over the old is not in the worthiness of its members but in the fullness of revelation and redemption they enjoy. The least believer after Pentecost has the indwelling Spirit, the completed canon, and the finished work of Christ — blessings John the Baptist died before experiencing.'),
  (12,
   'And from the days of John the Baptist until now the kingdom of heaven suffereth violence, and the violent take it by force.',
   'ἀπὸ δὲ τῶν ἡμερῶν Ἰωάννου τοῦ βαπτιστοῦ ἕως ἄρτι ἡ βασιλεία τῶν οὐρανῶν βιάζεται καὶ βιασταὶ ἁρπάζουσιν αὐτήν',
   'apo de tōn hēmerōn Iōannou tou baptistou heōs arti hē basileia tōn ouranōn biazetai kai biastai harpazousin autēn',
   'One of the most debated verses in the Gospels. ''Suffereth violence'' (biazetai) can be middle voice (''advances forcefully'') or passive (''is violently attacked''). Two main interpretations: (1) Positive: the kingdom advances with holy violence, and spiritually earnest people seize it eagerly — like tax collectors and sinners pressing in (Luke 16:16). (2) Negative: the kingdom is under violent assault from opponents like Herod, the Pharisees, and ultimately those who will crucify Christ. Both readings have strong patristic support. The context of John''s imprisonment (v.2) favours the negative sense, with an undertone of the positive.',
   NULL),
  (13,
   'For all the prophets and the law prophesied until John.',
   'πάντες γὰρ οἱ προφῆται καὶ ὁ νόμος ἕως Ἰωάννου ἐπροφήτευσαν',
   'pantes gar hoi prophētai kai ho nomos heōs Iōannou eprophēteusan',
   'Jesus places John as the terminus of the old covenant prophetic tradition. ''The prophets and the law'' — unusually, Matthew reverses the normal order (''law and prophets''), perhaps to emphasise the prophetic/predictive function of the entire Old Testament. Everything before John pointed forward; from John onward, the kingdom is present. This verse is a concise statement of redemptive-historical periodisation: the era of promise gives way to the era of fulfilment.',
   NULL),
  (14,
   'And if ye will receive it, this is Elias, which was for to come.',
   'καὶ εἰ θέλετε δέξασθαι αὐτός ἐστιν Ἠλίας ὁ μέλλων ἔρχεσθαι',
   'kai ei thelete dexasthai autos estin Ēlias ho mellōn erchesthai',
   'Jesus identifies John the Baptist as the fulfilment of Malachi 4:5: ''Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of the Lord.'' ''If ye will receive it'' (ei thelete dexasthai) — a conditional clause acknowledging that this identification requires spiritual receptivity. John came ''in the spirit and power of Elijah'' (Luke 1:17), not as Elijah reincarnated (John denied being Elijah literally in John 1:21). The typological fulfilment: as Elijah confronted Ahab, John confronted Herod.',
   NULL),
  (15,
   'He that hath ears to hear, let him hear.',
   'ὁ ἔχων ὦτα ἀκούειν ἀκουέτω',
   'ho echōn ōta akouein akouetō',
   'A formula Jesus uses repeatedly (Matt 13:9,43; Mark 4:9; Rev 2:7,11,17,29; 3:6,13,22) to signal that His words carry deeper spiritual significance requiring discernment. Physical hearing is universal; spiritual hearing is a gift. The imperative ''let him hear'' (akouetō — present active imperative, ''keep on hearing'') demands ongoing attention and obedience, not merely intellectual acknowledgement. This saying closes the section on John and prepares for the rebuke of the present generation.',
   NULL),
  (16,
   'But whereunto shall I liken this generation? It is like unto children sitting in the markets, and calling unto their fellows,',
   'τίνι δὲ ὁμοιώσω τὴν γενεὰν ταύτην ὁμοία ἐστὶν παιδίοις καθημένοις ἐν ταῖς ἀγοραῖς ἃ προσφωνοῦντα τοῖς ἑτέροις',
   'tini de homoiōsō tēn genean tautēn homoia estin paidiois kathēmenois en tais agorais ha prosphōnounta tois heterois',
   '''This generation'' (tēn genean tautēn) — a recurring phrase in Matthew denoting not merely contemporaries but the spiritually resistant character of the age (cf. 12:39,41,42,45; 16:4; 17:17; 23:36; 24:34). The parable of children in the marketplace depicts petulant youngsters who refuse to play either the wedding game (''we piped'') or the funeral game (''we mourned''). They sit idle, criticising both options. Jesus diagnoses a perverse refusal to respond to God regardless of how He approaches.',
   NULL),
  (17,
   'And saying, We have piped unto you, and ye have not danced; we have mourned unto you, and ye have not lamented.',
   'λέγουσιν ηὐλήσαμεν ὑμῖν καὶ οὐκ ὠρχήσασθε ἐθρηνήσαμεν καὶ οὐκ ἐκόψασθε',
   'legousin ēulēsamen hymin kai ouk ōrchēsasthe ethrēnēsamen kai ouk ekopsasthe',
   'The two games represent the two ministries God sent: the joyful piping represents Jesus'' ministry of feasting and celebration (''eating and drinking,'' v.19), and the mournful dirge represents John''s ministry of ascetic repentance (''neither eating nor drinking,'' v.18). The generation rejected both approaches. ''Piped'' (ēulēsamen — played the flute) and ''mourned'' (ethrēnēsamen — sang a funeral dirge) — the marketplace children demand that others conform to their programme, just as the Pharisees demanded that God''s messengers fit their preconceptions.',
   NULL),
  (18,
   'For John came neither eating nor drinking, and they say, He hath a devil.',
   'ἦλθεν γὰρ Ἰωάννης μήτε ἐσθίων μήτε πίνων καὶ λέγουσιν δαιμόνιον ἔχει',
   'ēlthen gar Iōannēs mēte esthiōn mēte pinōn kai legousin daimonion echei',
   'John''s austere lifestyle — locusts, wild honey, desert dwelling (Matt 3:4) — was dismissed as demonic possession rather than prophetic consecration. ''He hath a devil'' (daimonion echei — he has a demon) — the ultimate ad hominem dismissal. When a prophet lives ascetically, they call him mad; when the Messiah eats with sinners, they call Him a glutton. The real problem is not the messenger''s lifestyle but the generation''s hardened hearts.',
   NULL),
  (19,
   'The Son of man came eating and drinking, and they say, Behold a man gluttonous, and a winebibber, a friend of publicans and sinners. But wisdom is justified of her children.',
   'ἦλθεν ὁ υἱὸς τοῦ ἀνθρώπου ἐσθίων καὶ πίνων καὶ λέγουσιν ἰδοὺ ἄνθρωπος φάγος καὶ οἰνοπότης τελωνῶν φίλος καὶ ἁμαρτωλῶν καὶ ἐδικαιώθη ἡ σοφία ἀπὸ τῶν ἔργων αὐτῆς',
   'ēlthen ho huios tou anthrōpou esthiōn kai pinōn kai legousin idou anthrōpos phagos kai oinopotēs telōnōn philos kai hamartōlōn kai edikaiōthē hē sophia apo tōn ergōn autēs',
   '''Son of man'' — Jesus'' favourite self-designation, drawn from Daniel 7:13-14. ''Gluttonous and a winebibber'' (phagos kai oinopotēs) — the charge from Deuteronomy 21:20, which prescribes stoning for a rebellious son. ''A friend of publicans and sinners'' — meant as an insult, this is one of the most glorious titles of Christ: He is indeed the friend of sinners (Luke 7:34; 15:1-2). ''Wisdom is justified of her children'' — God''s wisdom is vindicated not by the critics but by those who respond: the tax collectors, sinners, and humble who bore fruit (Luke 7:29,35).',
   'Jesus'' table fellowship with sinners was not moral compromise but redemptive mission. The incarnation itself is God entering the mess of human sin. The title ''friend of sinners'' encapsulates the gospel: God does not wait for sinners to become righteous before He befriends them.'),
  (20,
   'Then began he to upbraid the cities wherein most of his mighty works were done, because they repented not:',
   'τότε ἤρξατο ὀνειδίζειν τὰς πόλεις ἐν αἷς ἐγένοντο αἱ πλεῖσται δυνάμεις αὐτοῦ ὅτι οὐ μετενόησαν',
   'tote ērxato oneidizein tas poleis en hais egenonto hai pleistai dynameis autou hoti ou metenōēsan',
   '''Upbraid'' (oneidizein — to reproach, rebuke sharply, denounce) — a strong word implying public denunciation. The cities of the ''evangelical triangle'' around the Sea of Galilee — Chorazin, Bethsaida, and Capernaum — had received the greatest concentration of Jesus'' miracles (dynameis — mighty works, acts of power), yet showed no repentance (ou metenōēsan — they did not change their minds). Greater privilege brings greater accountability (cf. Luke 12:48; Heb 2:3; 10:29).',
   NULL),
  (21,
   'Woe unto thee, Chorazin! woe unto thee, Bethsaida! for if the mighty works, which were done in you, had been done in Tyre and Sidon, they would have repented long ago in sackcloth and ashes.',
   'οὐαί σοι Χοραζίν οὐαί σοι Βηθσαϊδά ὅτι εἰ ἐν Τύρῳ καὶ Σιδῶνι ἐγένοντο αἱ δυνάμεις αἱ γενόμεναι ἐν ὑμῖν πάλαι ἂν ἐν σάκκῳ καὶ σποδῷ μετενόησαν',
   'ouai soi Chorazin ouai soi Bēthsaida hoti ei en Tyrō kai Sidōni egenonto hai dynameis hai genomenai en hymin palai an en sakkō kai spodō metenōēsan',
   '''Woe'' (ouai — an exclamation of grief and judgment, not mere anger). Chorazin — a town about 2 miles north of Capernaum, mentioned only here and in Luke 10:13; its ruins (Khirbet Kerazeh) have been excavated. Bethsaida — hometown of Peter, Andrew, and Philip (John 1:44). Tyre and Sidon — Phoenician cities repeatedly condemned by the OT prophets (Isa 23; Ezek 26-28; Amos 1:9-10) as paradigms of pagan pride. Yet Jesus declares that even they would have repented — a devastating comparison. ''Sackcloth and ashes'' — the traditional signs of mourning and repentance (Jonah 3:6; Dan 9:3).',
   'Jesus'' statement implies divine knowledge of counterfactual history — He knows what would have happened under different circumstances. This raises profound questions about divine sovereignty and human responsibility: God''s judgment takes into account not only what people did but what they would have done with the light they received.'),
  (22,
   'But I say unto you, It shall be more tolerable for Tyre and Sidon at the day of judgment, than for you.',
   'πλὴν λέγω ὑμῖν Τύρῳ καὶ Σιδῶνι ἀνεκτότερον ἔσται ἐν ἡμέρᾳ κρίσεως ἢ ὑμῖν',
   'plēn legō hymin Tyrō kai Sidōni anektoteron estai en hēmera kriseōs ē hymin',
   '''More tolerable'' (anektoteron — more bearable, from anechomai, to endure) implies degrees of punishment at the final judgment. Those who reject Christ despite overwhelming evidence will face stricter judgment than pagans who never witnessed His works. ''The day of judgment'' (hēmera kriseōs) — a fixed future day of divine reckoning, a concept firmly established in the Old Testament (Mal 4:1; Dan 7:9-10) and throughout the New (Acts 17:31; 2 Pet 3:7; Rev 20:11-15).',
   'Scripture teaches degrees of punishment corresponding to the degree of light rejected. This is not universalism — both Tyre and Chorazin face judgment — but graduated justice. To whom much is given, much shall be required (Luke 12:48).'),
  (23,
   'And thou, Capernaum, which art exalted unto heaven, shalt be brought down to hell: for if the mighty works, which have been done in thee, had been done in Sodom, it would have remained until this day.',
   'καὶ σύ Καφαρναούμ μὴ ἕως οὐρανοῦ ὑψωθήσῃ ἕως ᾅδου καταβήσῃ ὅτι εἰ ἐν Σοδόμοις ἐγενήθησαν αἱ δυνάμεις αἱ γενόμεναι ἐν σοί ἔμεινεν ἂν μέχρι τῆς σήμερον',
   'kai sy Kapharnaoum mē heōs ouranou hypsōthēsē heōs hadou katabēsē hoti ei en Sodomois egenēthēsan hai dynameis hai genomenai en soi emeinen an mechri tēs sēmeron',
   'Capernaum was Jesus'' adopted hometown and ministry headquarters (Matt 4:13; 9:1). ''Exalted unto heaven'' — Capernaum enjoyed the supreme privilege of hosting the Messiah''s ministry. The language echoes Isaiah 14:13-15, the taunt against the king of Babylon who said ''I will ascend into heaven'' but was brought down to Sheol. ''Hell'' (hadou — Hades, the realm of the dead) — not Gehenna but the underworld as a place of judgment. The comparison with Sodom — destroyed for its wickedness (Gen 19) — makes Capernaum''s guilt even greater, since even Sodom would have repented.',
   NULL),
  (24,
   'But I say unto you, That it shall be more tolerable for the land of Sodom in the day of judgment, than for thee.',
   'πλὴν λέγω ὑμῖν ὅτι γῇ Σοδόμων ἀνεκτότερον ἔσται ἐν ἡμέρᾳ κρίσεως ἢ σοί',
   'plēn legō hymin hoti gē Sodomōn anektoteron estai en hēmera kriseōs ē soi',
   'The verdict is even more severe than for Tyre and Sidon. Sodom — the Old Testament''s ultimate symbol of depravity and divine judgment (Gen 18-19; Deut 29:23; Isa 1:9; Jude 7) — will fare better on judgment day than Capernaum. This is the most shocking comparison in the chapter. The principle is clear: proximity to Christ without repentance is the greatest spiritual danger. Religious privilege without personal transformation compounds guilt rather than mitigating it.',
   NULL),
  (25,
   'At that time Jesus answered and said, I thank thee, O Father, Lord of heaven and earth, because thou hast hid these things from the wise and prudent, and hast revealed them unto babes.',
   'ἐν ἐκείνῳ τῷ καιρῷ ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν ἐξομολογοῦμαί σοι πάτερ κύριε τοῦ οὐρανοῦ καὶ τῆς γῆς ὅτι ἔκρυψας ταῦτα ἀπὸ σοφῶν καὶ συνετῶν καὶ ἀπεκάλυψας αὐτὰ νηπίοις',
   'en ekeinō tō kairō apokritheis ho Iēsous eipen exomologoumai soi pater kyrie tou ouranou kai tēs gēs hoti ekrypsas tauta apo sophōn kai synetōn kai apekalypsas auta nēpiois',
   'A sudden shift from woe to worship. ''I thank thee'' (exomologoumai — I confess openly, I praise) — Jesus addresses God as ''Father'' (pater), His characteristic mode of prayer. ''Lord of heaven and earth'' — affirming God''s absolute sovereignty over revelation. The ''wise and prudent'' (sophōn kai synetōn — the learned and clever) are not condemned for being intelligent but for their self-sufficient wisdom that sees no need for divine grace. ''Babes'' (nēpiois — infants, the immature) represents the humble and dependent — the ''poor in spirit'' of the Beatitudes (Matt 5:3). God has hidden (ekrypsas — actively concealed) and revealed (apekalypsas — unveiled) according to His sovereign pleasure.',
   'Divine revelation is not earned by human intelligence but granted by sovereign grace. God conceals truth from the self-sufficient and reveals it to the humble. This is not anti-intellectualism but a rebuke of intellectual pride that refuses to come as a dependent child before God (cf. 1 Cor 1:18-31).'),
  (26,
   'Even so, Father: for so it seemed good in thy sight.',
   'ναὶ ὁ πατήρ ὅτι οὕτως εὐδοκία ἐγένετο ἔμπροσθέν σου',
   'nai ho patēr hoti houtōs eudokia egeneto emprosthen sou',
   '''Even so'' (nai — yes, indeed) — Jesus affirms the Father''s sovereign will without reservation. ''It seemed good in thy sight'' (eudokia egeneto emprosthen sou — literally ''it became good pleasure before you''). Eudokia means gracious will, settled purpose, good pleasure. Jesus rests in the Father''s sovereign decision about who receives revelation. There is no resentment over the rejection by the ''wise,'' only joyful submission to the Father''s purpose. This is the deepest expression of filial trust in the Gospels.',
   NULL),
  (27,
   'All things are delivered unto me of my Father: and no man knoweth the Son, but the Father; neither knoweth any man the Father, save the Son, and he to whomsoever the Son will reveal him.',
   'πάντα μοι παρεδόθη ὑπὸ τοῦ πατρός μου καὶ οὐδεὶς ἐπιγινώσκει τὸν υἱὸν εἰ μὴ ὁ πατήρ οὐδὲ τὸν πατέρα τις ἐπιγινώσκει εἰ μὴ ὁ υἱὸς καὶ ᾧ ἐὰν βούληται ὁ υἱὸς ἀποκαλύψαι',
   'panta moi paredothē hypo tou patros mou kai oudeis epiginōskei ton huion ei mē ho patēr oude ton patera tis epiginōskei ei mē ho huios kai hō ean boulētai ho huios apokalypsai',
   'This verse is often called ''the Johannine thunderbolt'' in the Synoptics because it reads like something from the Gospel of John. Three staggering claims: (1) ''All things are delivered unto me'' — universal authority and sovereignty, anticipating the Great Commission (28:18). (2) Exclusive mutual knowledge between Father and Son — ''knoweth'' (epiginōskei — fully knows, deeply comprehends). Only the Father exhaustively knows the Son, and only the Son exhaustively knows the Father. This implies Jesus'' full deity, since only an infinite being can comprehend an infinite God. (3) The Son has sovereign authority over revelation — He reveals the Father ''to whomsoever the Son will'' (boulētai — deliberately chooses, wills, purposes).',
   'This is one of the highest Christological statements in the Synoptic Gospels. The mutual exclusive knowledge between Father and Son implies ontological equality — the Son is not a creature gaining knowledge of God, but shares the same divine nature. The Son''s sovereign will in revelation (boulētai) places Him on the same plane as the Father''s sovereign will in v.26.'),
  (28,
   'Come unto me, all ye that labour and are heavy laden, and I will give you rest.',
   'δεῦτε πρός με πάντες οἱ κοπιῶντες καὶ πεφορτισμένοι κἀγὼ ἀναπαύσω ὑμᾶς',
   'deute pros me pantes hoi kopiōntes kai pephortismenoi kagō anapausō hymas',
   'One of the most beloved invitations in all of Scripture. ''Come'' (deute — come here, an adverb of invitation). ''Unto me'' (pros me) — not to a system, ritual, or institution, but to a Person. ''All ye that labour'' (kopiōntes — toiling to the point of exhaustion, wearied by effort) — primarily those exhausted by the impossible burden of Pharisaic law-keeping (cf. Matt 23:4; Acts 15:10). ''Heavy laden'' (pephortismenoi — perfect passive participle: having been loaded with burdens by others). ''I will give you rest'' (anapausō hymas — I will refresh you, I will cause you to cease from exhausting labour). The emphasis is on ''I'' (kagō — and I myself, emphatic) — only Jesus can give this rest.',
   'The gospel invitation is universal (''all''), personal (''come unto me''), and unconditional (no prerequisites are listed). It addresses the fundamental human condition: weariness under the weight of sin, guilt, and self-effort. The rest Christ gives is not idleness but the peace of sins forgiven and the end of trying to earn God''s favour.'),
  (29,
   'Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.',
   'ἄρατε τὸν ζυγόν μου ἐφ᾽ ὑμᾶς καὶ μάθετε ἀπ᾽ ἐμοῦ ὅτι πραΰς εἰμι καὶ ταπεινὸς τῇ καρδίᾳ καὶ εὑρήσετε ἀνάπαυσιν ταῖς ψυχαῖς ὑμῶν',
   'arate ton zygon mou eph hymas kai mathete ap emou hoti prays eimi kai tapeinos tē kardia kai heurēsete anapausin tais psychais hymōn',
   '''Yoke'' (zygon) — in rabbinic language, ''the yoke of the Torah'' or ''the yoke of the kingdom'' was a common metaphor for religious obligation. Jesus does not remove the yoke but replaces it with His own — lighter, gentler, fitted by a master carpenter. ''Learn of me'' (mathete ap emou — become my disciples) — the only place where Jesus describes His own character: ''meek'' (prays — gentle, not weak but strength under control) and ''lowly in heart'' (tapeinos tē kardia — humble in the core of His being). ''Rest unto your souls'' (anapausin tais psychais hymōn) directly quotes Jeremiah 6:16 LXX, where God told Israel to ''walk in the good way and find rest for your souls'' — but Israel refused. Jesus offers what Israel rejected.',
   'Christ''s yoke is not the absence of obligation but the presence of grace. The Christian life has demands — ''take,'' ''learn'' — but they are accompanied by Christ''s meekness and power. The rest promised is not external ease but internal peace: rest for the soul, not merely the body.'),
  (30,
   'For my yoke is easy, and my burden is light.',
   'ὁ γὰρ ζυγός μου χρηστὸς καὶ τὸ φορτίον μου ἐλαφρόν ἐστιν',
   'ho gar zygos mou chrēstos kai to phortion mou elaphron estin',
   '''Easy'' (chrēstos — well-fitting, kind, serviceable, gracious) — the word can also mean ''good'' or ''pleasant.'' A well-made yoke was custom-fitted to the ox so it did not chafe. Jesus the carpenter (Mark 6:3) makes yokes that fit. The word chrēstos sounds almost identical to Christos in Greek, and early Christians made much of this pun. ''Light'' (elaphron — not heavy, light in weight) — not that Christ''s demands are trivial, but that His grace empowers obedience. Augustine captured it: ''Give what you command, and command what you will.'' The burden of love is lighter than the burden of law because it is carried in fellowship with the Burden-Bearer.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 11;

-- Step 3: Word Studies for key verses

-- Verse 3 (The Coming One)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐρχόμενος', 'erchomenos', 'G2064', 'The Coming One — present middle participle of erchomai, used as a messianic title. Derived from Psalm 118:26 (''Blessed is he that cometh in the name of the Lord'') and Habakkuk 2:3 (''he that shall come will come''). It encapsulates messianic expectation in a single word.', 1),
  ('προσδοκῶμεν', 'prosdokōmen', 'G4328', 'To expect, to look for, to wait for — from pros (toward) + dokeō (to think). The deliberative subjunctive expresses genuine uncertainty: ''should we keep on expecting?'' John is asking whether to redirect his messianic hope.', 2),
  ('ἕτερον', 'heteron', 'G2087', 'Another of a different kind — distinguished from allos (another of the same kind). John is asking whether they should expect a different sort of deliverer altogether, implying that Jesus does not match his expectations of what the Messiah should be.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 3;

-- Verse 5 (Messianic signs)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀναβλέπουσιν', 'anablepousin', 'G308', 'To look up, to receive sight again — from ana (up, again) + blepō (to see). The prefix ana implies recovery of something lost, pointing to restoration and healing as messianic signs fulfilling Isaiah 35:5.', 1),
  ('εὐαγγελίζονται', 'euangelizontai', 'G2097', 'To announce good news, to preach the gospel — from eu (good) + angellō (to announce). The passive voice here means ''have good news preached to them.'' This is the climactic sign: the poor receive the gospel, fulfilling Isaiah 61:1.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 5;

-- Verse 12 (Kingdom suffers violence)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βιάζεται', 'biazetai', 'G971', 'To use force, to suffer violence — the voice (middle or passive) is debated. Middle: ''advances forcefully, breaks forth with power.'' Passive: ''is violently attacked, suffers assault.'' Both meanings have strong patristic and scholarly support.', 1),
  ('βιασταί', 'biastai', 'G973', 'Violent ones, forceful persons — those who use force. In the positive sense: spiritually earnest seekers who press into the kingdom. In the negative sense: opponents like Herod who seek to destroy it. A hapax legomenon in the NT.', 2),
  ('ἁρπάζουσιν', 'harpazousin', 'G726', 'To seize, to snatch, to take by force — the same word used for the rapture in 1 Thessalonians 4:17 and for Paul being caught up to the third heaven (2 Cor 12:2). Here it can mean either eagerly seizing the kingdom or violently plundering it.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 12;

-- Verse 25 (Sovereign revelation)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐξομολογοῦμαι', 'exomologoumai', 'G1843', 'To confess openly, to acknowledge publicly, to give thanks — from ek (out) + homologeō (to agree, confess). Jesus publicly praises the Father for His sovereign will in revelation, expressing joyful agreement with the divine decree.', 1),
  ('ἔκρυψας', 'ekrypsas', 'G2928', 'To hide, to conceal, to cover — aorist active indicating a definite act of God. God actively conceals spiritual truth from the self-sufficient wise and reveals it to the humble. This is sovereign, purposeful concealment.', 2),
  ('ἀπεκάλυψας', 'apekalypsas', 'G601', 'To uncover, to unveil, to reveal — from apo (from, away) + kalyptō (to cover). The root of English ''apocalypse.'' God removes the veil from truth and discloses it to those He chooses: the humble, dependent ''babes.''', 3),
  ('νηπίοις', 'nēpiois', 'G3516', 'Infants, babes, the immature — from nē (not) + epos (word), literally ''not speaking,'' i.e., too young to talk. Metaphorically: those who are unsophisticated, dependent, and unpretentious — the opposite of the self-assured wise.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 25;

-- Verse 27 (Exclusive knowledge)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παρεδόθη', 'paredothē', 'G3860', 'To hand over, to deliver, to entrust — aorist passive of paradidōmi. All things have been delivered to the Son by the Father: authority, revelation, judgment. This anticipates the universal authority claim of Matthew 28:18.', 1),
  ('ἐπιγινώσκει', 'epiginōskei', 'G1921', 'To know fully, to recognise completely, to comprehend deeply — from epi (upon, intensive) + ginōskō (to know). This is not superficial acquaintance but exhaustive, penetrating knowledge. Only an infinite being can fully know an infinite God.', 2),
  ('βούληται', 'boulētai', 'G1014', 'To will, to purpose, to deliberately choose — denotes a settled, deliberate decision, stronger than thelō (to wish). The Son sovereignly decides to whom He reveals the Father, placing Him on the same plane of sovereign authority as the Father.', 3),
  ('ἀποκαλύψαι', 'apokalypsai', 'G601', 'To reveal, to disclose, to unveil — aorist active infinitive. The Son''s act of revealing the Father is purposeful and selective: not all receive this revelation, only those to whom the Son chooses to grant it.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 27;

-- Verse 28 (Come unto me)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δεῦτε', 'deute', 'G1205', 'Come, come here — an adverb used as an imperative of invitation. It carries warmth and urgency. Jesus opens His arms to all who are weary, issuing the most personal and tender invitation in the Gospels.', 1),
  ('κοπιῶντες', 'kopiōntes', 'G2872', 'Labouring, toiling to exhaustion — from kopos (laborious toil, wearying effort). Describes those exhausted by the futile effort of earning God''s favour through law-keeping, burdened by Pharisaic traditions and the weight of sin.', 2),
  ('πεφορτισμένοι', 'pephortismenoi', 'G5412', 'Loaded with burdens, weighed down — perfect passive participle of phortizō. The perfect tense indicates a settled state: they have been and remain burdened. The passive voice implies others loaded these burdens on them (cf. Matt 23:4).', 3),
  ('ἀναπαύσω', 'anapausō', 'G373', 'I will give rest, I will refresh, I will cause to cease from labour — from ana (again) + pauō (to stop). Future active indicative: Jesus personally guarantees rest. This is not a suggestion but a promise from the one who has authority to deliver it.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 28;

-- Verse 29 (Take my yoke)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ζυγόν', 'zygon', 'G2218', 'Yoke — a wooden frame placed on oxen to harness them for work. Metaphorically: a set of obligations, a way of life. Rabbis spoke of ''the yoke of the Torah.'' Jesus offers His yoke as a replacement — lighter, better fitted, shared with Him.', 1),
  ('πραΰς', 'prays', 'G4239', 'Meek, gentle, humble — not weakness but strength under control. The same word used of Moses (Num 12:3 LXX) and in the Beatitudes (Matt 5:5). It describes one who submits to God and is gentle toward others, exercising power with restraint.', 2),
  ('ταπεινός', 'tapeinos', 'G5011', 'Lowly, humble — literally low in position or rank. Applied to Jesus'' heart (tē kardia — in the core of His being), it describes His inner disposition, not His external circumstances. The Creator of the universe describes Himself as humble in heart.', 3),
  ('ἀνάπαυσιν', 'anapausin', 'G372', 'Rest, refreshment, cessation of labour — the noun form of anapauō. In Jeremiah 6:16 LXX, God promised rest to those who walk the good way. Israel refused; Jesus fulfils the promise. This rest is eschatological sabbath-rest begun in the present.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = 29;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Transition from commissioning
  (1, 'Matthew 7:28', 1), (1, 'Matthew 13:53', 2), (1, 'Matthew 19:1', 3),
  -- v2: John in prison
  (2, 'Matthew 4:12', 1), (2, 'Matthew 14:3-4', 2), (2, 'Luke 7:18-19', 3),
  -- v3: Are you the Coming One
  (3, 'Psalm 118:26', 1), (3, 'Malachi 3:1', 2), (3, 'Habakkuk 2:3', 3), (3, 'John 6:14', 4),
  -- v4: Go and tell John
  (4, 'Luke 7:21-22', 1), (4, 'John 10:25', 2), (4, 'John 10:38', 3),
  -- v5: Messianic signs
  (5, 'Isaiah 35:5-6', 1), (5, 'Isaiah 61:1', 2), (5, 'Isaiah 26:19', 3), (5, 'Isaiah 29:18-19', 4),
  -- v6: Not offended in me
  (6, 'Matthew 13:57', 1), (6, 'Matthew 26:31', 2), (6, '1 Peter 2:8', 3), (6, 'Romans 9:33', 4),
  -- v7: Reed shaken
  (7, 'Luke 7:24-28', 1), (7, 'Matthew 3:1-5', 2),
  -- v8: Soft raiment
  (8, 'Matthew 3:4', 1), (8, '2 Kings 1:8', 2), (8, 'Zechariah 13:4', 3),
  -- v9: More than a prophet
  (9, 'Luke 1:76', 1), (9, 'John 1:29-34', 2),
  -- v10: Malachi fulfilled
  (10, 'Malachi 3:1', 1), (10, 'Mark 1:2', 2), (10, 'Luke 1:17', 3), (10, 'Luke 1:76', 4),
  -- v11: Greatest / least
  (11, 'Luke 7:28', 1), (11, 'John 3:30', 2), (11, 'Hebrews 11:39-40', 3),
  -- v12: Kingdom suffers violence
  (12, 'Luke 16:16', 1), (12, 'Matthew 21:31-32', 2),
  -- v13: Prophets until John
  (13, 'Luke 16:16', 1), (13, 'Romans 10:4', 2), (13, 'Galatians 3:24', 3),
  -- v14: This is Elijah
  (14, 'Malachi 4:5', 1), (14, 'Matthew 17:10-13', 2), (14, 'Luke 1:17', 3), (14, 'John 1:21', 4),
  -- v15: Ears to hear
  (15, 'Matthew 13:9', 1), (15, 'Revelation 2:7', 2),
  -- v16: Children in marketplace
  (16, 'Luke 7:31-32', 1),
  -- v17: Piped and mourned
  (17, 'Luke 7:32', 1), (17, 'Ecclesiastes 3:4', 2),
  -- v18: John has a devil
  (18, 'Matthew 3:4', 1), (18, 'John 10:20', 2),
  -- v19: Friend of sinners / wisdom justified
  (19, 'Daniel 7:13-14', 1), (19, 'Luke 7:34-35', 2), (19, 'Luke 15:1-2', 3), (19, 'Proverbs 8:1-36', 4),
  -- v20: Upbraiding impenitent cities
  (20, 'Luke 10:13-15', 1), (20, 'Matthew 12:41', 2),
  -- v21: Woe Chorazin, Bethsaida
  (21, 'Luke 10:13', 1), (21, 'Isaiah 23:1-4', 2), (21, 'Ezekiel 26:1-14', 3), (21, 'Jonah 3:6', 4),
  -- v22: More tolerable for Tyre
  (22, 'Matthew 10:15', 1), (22, 'Luke 12:48', 2), (22, 'Hebrews 10:29', 3),
  -- v23: Capernaum brought down
  (23, 'Isaiah 14:13-15', 1), (23, 'Matthew 4:13', 2), (23, 'Luke 10:15', 3), (23, 'Genesis 19:24-25', 4),
  -- v24: More tolerable for Sodom
  (24, 'Matthew 10:15', 1), (24, 'Jude 1:7', 2), (24, 'Ezekiel 16:48-50', 3),
  -- v25: Hidden from wise, revealed to babes
  (25, 'Luke 10:21', 1), (25, '1 Corinthians 1:19-21', 2), (25, '1 Corinthians 1:26-29', 3), (25, 'Matthew 5:3', 4), (25, 'James 2:5', 5),
  -- v26: Good pleasure
  (26, 'Ephesians 1:5', 1), (26, 'Ephesians 1:9', 2), (26, 'Philippians 2:13', 3),
  -- v27: All things delivered / exclusive knowledge
  (27, 'Matthew 28:18', 1), (27, 'John 3:35', 2), (27, 'John 10:15', 3), (27, 'John 17:25', 4), (27, 'John 1:18', 5), (27, 'John 14:9', 6),
  -- v28: Come unto me
  (28, 'Isaiah 55:1-3', 1), (28, 'John 7:37', 2), (28, 'Revelation 22:17', 3), (28, 'Matthew 23:4', 4), (28, 'Acts 15:10', 5),
  -- v29: Take my yoke
  (29, 'Jeremiah 6:16', 1), (29, 'Matthew 5:5', 2), (29, 'Philippians 2:5-8', 3), (29, 'Numbers 12:3', 4), (29, 'Hebrews 4:9-11', 5),
  -- v30: Easy yoke, light burden
  (30, 'Matthew 23:4', 1), (30, '1 John 5:3', 2), (30, 'Mark 6:3', 3), (30, 'Micah 6:8', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 11 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- Matthew Chapter 11 Complete!
-- 30 verses · 8 key verses with word studies (27 words)
-- Cross-references for 30 verses (97 refs)
-- ═══════════════════════════════════════════════════════
