-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 13 — The Olivet Discourse: Signs, Tribulation, and the Coming of the Son of Man
-- 37 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 13,
  'Mark 13 is the Olivet Discourse — Jesus'' longest sustained prophetic teaching in Mark. As Jesus leaves the temple, a disciple marvels at its massive stones. Jesus responds: ''There shall not be left one stone upon another, that shall not be thrown down'' (v.2). On the Mount of Olives, Peter, James, John, and Andrew ask privately: ''When shall these things be? and what shall be the sign when all these things shall be fulfilled?'' (v.4). Jesus'' answer weaves together the near-future destruction of Jerusalem (AD 70) and the end-of-the-age return of the Son of Man. He warns first against deception: ''Take heed lest any man deceive you. For many shall come in my name, saying, I am Christ'' (vv.5-6). Wars, earthquakes, and famines are ''the beginning of sorrows'' (v.8). The disciples will face persecution — brought before councils, beaten in synagogues, and arraigned before governors and kings ''for a testimony against them'' (v.9). The gospel ''must first be published among all nations'' (v.10). When arrested, they should not pre-plan their defence, ''for it is not ye that speak, but the Holy Ghost'' (v.11). Family betrayal will occur: ''the brother shall betray the brother to death'' (v.12). ''He that shall endure unto the end, the same shall be saved'' (v.13). The ''abomination of desolation'' standing ''where it ought not'' (v.14) signals the time to flee — those in Judaea must run to the mountains without delay. The tribulation will be ''such as was not from the beginning of the creation'' (v.19). After that tribulation, cosmic signs appear: the sun darkened, the moon refusing light, stars falling (vv.24-25). ''And then shall they see the Son of man coming in the clouds with great power and glory'' (v.26). He will send angels to gather the elect ''from the uttermost part of the earth to the uttermost part of heaven'' (v.27). The fig tree parable teaches readiness: when its branch ''putteth forth leaves, ye know that summer is near'' (v.28). ''This generation shall not pass, till all these things be done'' (v.30). ''Heaven and earth shall pass away: but my words shall not pass away'' (v.31). Yet ''of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father'' (v.32). The chapter closes with the command to watch: ''Watch ye therefore... lest coming suddenly he find you sleeping'' (vv.35-36). ''What I say unto you I say unto all, Watch'' (v.37).',
  'The Temple''s Fall, the Great Tribulation, and the Return of the Son of Man',
  'γρηγορέω (grēgoreō)',
  'To watch, be vigilant, stay awake — from egeirō (to rouse from sleep). Grēgoreō is the chapter''s culminating imperative: ''Watch ye therefore'' (v.35), ''Watch'' (v.37). The command frames the entire discourse. Every sign, every warning, every prophecy leads to one practical application: be spiritually alert. The disciples must not be caught sleeping when the master returns. Watchfulness is the posture of faith in an uncertain and dangerous world.',
  '["The Temple''s Destruction Foretold (vv.1-4): A disciple marvels at the temple stones. Jesus prophesies — There shall not be left one stone upon another that shall not be thrown down. On the Mount of Olives Peter James John and Andrew ask privately — When shall these things be and what shall be the sign","The Beginning of Sorrows (vv.5-13): Jesus warns of false Christs wars earthquakes and famines — these are the beginning of sorrows. Disciples will be beaten in synagogues and brought before rulers for a testimony. The gospel must first be published among all nations. The Holy Ghost will speak through them. Brother shall betray brother to death. He that endures to the end shall be saved","The Abomination of Desolation and Great Tribulation (vv.14-23): When ye see the abomination of desolation standing where it ought not — let him that readeth understand — flee to the mountains without delay. The tribulation shall be such as was not since the beginning of creation. Except the Lord had shortened those days no flesh should be saved but for the elect''s sake he shortened them. False Christs and false prophets shall show signs and wonders to deceive if possible even the elect","The Coming of the Son of Man (vv.24-27): After that tribulation the sun shall be darkened the moon shall not give her light the stars shall fall. Then they shall see the Son of man coming in the clouds with great power and glory. He shall send his angels to gather the elect from the four winds from the uttermost part of the earth to the uttermost part of heaven","The Fig Tree Parable and the Command to Watch (vv.28-37): Learn the parable of the fig tree — when her branch putteth forth leaves ye know summer is near. This generation shall not pass till all these things be done. Heaven and earth shall pass away but my words shall not pass away. Of that day knoweth no man not the angels nor the Son but the Father only. Watch therefore for ye know not when the master cometh. What I say unto you I say unto all — Watch"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 37 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And as he went out of the temple, one of his disciples saith unto him, Master, see what manner of stones and what buildings are here!',
   'καὶ ἐκπορευομένου αὐτοῦ ἐκ τοῦ ἱεροῦ λέγει αὐτῷ εἷς τῶν μαθητῶν αὐτοῦ διδάσκαλε ἴδε ποταποὶ λίθοι καὶ ποταπαὶ οἰκοδομαί',
   'kai ekporeuomenou autou ek tou hierou legei autō heis tōn mathētōn autou didaskale ide potapoi lithoi kai potapai oikodomai',
   '''What manner of stones'' (potapoi lithoi — what enormous stones). Josephus records that Herod''s temple stones measured up to 40 feet long, 12 feet high, and 18 feet wide (Antiquities 15.392). The temple was one of the ancient world''s architectural marvels, still under construction (begun c. 20 BC, not completed until AD 63). The disciple''s awe is understandable — the temple seemed eternal and indestructible.',
   NULL),
  (2, 'And Jesus answering said unto him, Seest thou these great buildings? there shall not be left one stone upon another, that shall not be thrown down.',
   'καὶ ὁ Ἰησοῦς ἀποκριθεὶς εἶπεν αὐτῷ βλέπεις ταύτας τὰς μεγάλας οἰκοδομάς οὐ μὴ ἀφεθῇ λίθος ἐπὶ λίθῳ ὃς οὐ μὴ καταλυθῇ',
   'kai ho Iēsous apokritheis eipen autō blepeis tautas tas megalas oikodomas ou mē aphethē lithos epi lithō hos ou mē katalythē',
   '''Not one stone upon another'' (ou mē aphethē lithos epi lithō — a double negative for absolute certainty). ''Thrown down'' (katalythē — demolished, dissolved). This prophecy was fulfilled literally in AD 70 when Titus''s legions destroyed the temple and, according to Josephus, dismantled it stone by stone — reportedly because soldiers sought gold that had melted between the stones during the fire. The most permanent-seeming structure in Israel would be completely obliterated.',
   'Jesus'' prophecy of the temple''s destruction is one of the most historically verifiable prophecies in the Bible. The Roman general Titus captured Jerusalem in AD 70 after a devastating siege. The temple was burned (despite Titus''s reported wish to preserve it) and subsequently dismantled. The Western Wall that stands today is a retaining wall of the Temple Mount platform, not part of the temple building itself. Jesus'' words — ''not one stone upon another'' — were fulfilled with remarkable precision regarding the temple structure itself.'),
  (3, 'And as he sat upon the mount of Olives over against the temple, Peter and James and John and Andrew asked him privately,',
   'καὶ καθημένου αὐτοῦ εἰς τὸ ὄρος τῶν ἐλαιῶν κατέναντι τοῦ ἱεροῦ ἐπηρώτα αὐτὸν κατ᾿ ἰδίαν Πέτρος καὶ Ἰάκωβος καὶ Ἰωάννης καὶ Ἀνδρέας',
   'kai kathēmenou autou eis to oros tōn elaiōn katenanti tou hierou epērōta auton kat idian Petros kai Iakōbos kai Iōannēs kai Andreas',
   '''Mount of Olives over against the temple'' — the vantage point overlooking the temple from the east, the direction from which the Messiah was expected to come (Zechariah 14:4). ''Privately'' (kat idian — in private). Four disciples ask: the inner three (Peter, James, John) plus Andrew (Peter''s brother, who was among the first called; 1:16-18). This is the only time Andrew joins the inner circle in Mark.',
   NULL),
  (4, 'Tell us, when shall these things be? and what shall be the sign when all these things shall be fulfilled?',
   'εἰπὲ ἡμῖν πότε ταῦτα ἔσται καὶ τί τὸ σημεῖον ὅταν μέλλῃ πάντα ταῦτα συντελεῖσθαι',
   'eipe hēmin pote tauta estai kai ti to sēmeion hotan mellē panta tauta synteleisthai',
   'Two questions: ''when'' (pote — at what time?) and ''what sign'' (ti to sēmeion — what indicator?). ''Fulfilled'' (synteleisthai — brought to completion, consummated). The disciples assume the temple''s destruction and the end of the age are one event. Jesus'' answer will address both the near-future (AD 70) and the end-times, weaving them together in a way that has challenged interpreters for centuries.',
   NULL),
  (5, 'And Jesus answering them began to say, Take heed lest any man deceive you:',
   'ὁ δὲ Ἰησοῦς ἀποκριθεὶς αὐτοῖς ἤρξατο λέγειν βλέπετε μή τις ὑμᾶς πλανήσῃ',
   'ho de Iēsous apokritheis autois ērxato legein blepete mē tis hymas planēsē',
   '''Take heed'' (blepete — watch out, be on your guard). ''Deceive'' (planēsē — lead astray, cause to wander; same root as ''planet,'' a wandering star). Jesus'' first concern is not signs or timing but deception. The greatest danger for believers is not persecution but being led astray by false teachers and false messiahs. Deception is the primary threat in the last days.',
   NULL),
  (6, 'For many shall come in my name, saying, I am Christ; and shall deceive many.',
   'πολλοὶ γὰρ ἐλεύσονται ἐπὶ τῷ ὀνόματί μου λέγοντες ὅτι ἐγώ εἰμι καὶ πολλοὺς πλανήσουσιν',
   'polloi gar eleusontai epi tō onomati mou legontes hoti egō eimi kai pollous planēsousin',
   '''In my name'' (epi tō onomati mou — claiming my authority, using my name). ''I am'' (egō eimi — the divine self-identification; cf. Exodus 3:14). ''Shall deceive many'' (pollous planēsousin). History has seen numerous false messiahs — Bar Kokhba (AD 132), and many since. The warning applies to every generation: false Christs will always arise, and many will be deceived.',
   NULL),
  (7, 'And when ye shall hear of wars and rumours of wars, be ye not troubled: for such things must needs be; but the end shall not be yet.',
   'ὅταν δὲ ἀκούσητε πολέμους καὶ ἀκοὰς πολέμων μὴ θροεῖσθε δεῖ γὰρ γενέσθαι ἀλλ᾿ οὔπω τὸ τέλος',
   'hotan de akousēte polemous kai akoas polemōn mē throeisthe dei gar genesthai all oupō to telos',
   '''Wars and rumours of wars'' (polemous kai akoas polemōn — actual conflicts and reports of coming conflicts). ''Be ye not troubled'' (mē throeisthe — do not be alarmed, do not panic). ''Must needs be'' (dei genesthai — it is divinely necessary). ''The end shall not be yet'' (oupō to telos — the end is not yet). Wars are not signs of the end but a feature of the present age. Jesus deflects apocalyptic panic: these things happen but do not signal the immediate end.',
   NULL),
  (8, 'For nation shall rise against nation, and kingdom against kingdom: and there shall be earthquakes in divers places, and there shall be famines and troubles: these are the beginnings of sorrows.',
   'ἐγερθήσεται γὰρ ἔθνος ἐπ᾿ ἔθνος καὶ βασιλεία ἐπὶ βασιλείαν καὶ ἔσονται σεισμοὶ κατὰ τόπους καὶ ἔσονται λιμοὶ καὶ ταραχαί ἀρχαὶ ὠδίνων ταῦτα',
   'egerthēsetai gar ethnos ep ethnos kai basileia epi basileian kai esontai seismoi kata topous kai esontai limoi kai tarachai archai ōdinōn tauta',
   '''Nation against nation'' (ethnos ep ethnos — ethnic and national conflicts). ''Earthquakes'' (seismoi). ''Famines'' (limoi). ''Troubles'' (tarachai — disturbances, upheavals). ''Beginnings of sorrows'' (archai ōdinōn — the beginning of birth pangs). The image of birth pangs is crucial: these events are not the end but the onset of labour. Birth pangs increase in intensity and frequency before delivery. The ''delivery'' is the coming of the Son of Man.',
   NULL),
  (9, 'But take heed to yourselves: for they shall deliver you up to councils; and in the synagogues ye shall be beaten: and ye shall be brought before rulers and kings for my sake, for a testimony against them.',
   'βλέπετε δὲ ὑμεῖς ἑαυτούς παραδώσουσιν γὰρ ὑμᾶς εἰς συνέδρια καὶ εἰς συναγωγὰς δαρήσεσθε καὶ ἐπὶ ἡγεμόνων καὶ βασιλέων σταθήσεσθε ἕνεκεν ἐμοῦ εἰς μαρτύριον αὐτοῖς',
   'blepete de hymeis heautous paradōsousin gar hymas eis synedria kai eis synagōgas darēsesthe kai epi hēgemonōn kai basileōn stathēsesthe heneken emou eis martyrion autois',
   '''Take heed to yourselves'' (blepete hymeis heautous — watch out for yourselves). ''Councils'' (synedria — local Jewish courts, Sanhedrin). ''Beaten'' (darēsesthe — flogged). ''Rulers and kings'' (hēgemonōn kai basileōn — Roman governors and client kings). ''For a testimony'' (eis martyrion — as a witness). Persecution will come from both Jewish and Gentile authorities. But even persecution serves God''s purpose: it becomes a testimony. The Acts of the Apostles records the precise fulfilment of these predictions.',
   NULL),
  (10, 'And the gospel must first be published among all nations.',
   'καὶ εἰς πάντα τὰ ἔθνη πρῶτον δεῖ κηρυχθῆναι τὸ εὐαγγέλιον',
   'kai eis panta ta ethnē prōton dei kērychthēnai to euangelion',
   '''Must'' (dei — it is divinely necessary). ''Published'' (kērychthēnai — proclaimed as a herald, preached publicly). ''All nations'' (panta ta ethnē — every ethnic group). ''The gospel'' (to euangelion — the good news). Before the end comes, the gospel must reach every nation. This is not optional but divinely ordained. The church''s mission is woven into the eschatological timeline: world evangelisation precedes the consummation.',
   'This verse establishes the global mission of the church as a prerequisite for the end. ''Must first'' (prōton dei) indicates divine necessity — the end will not come until the gospel has been proclaimed to all nations. This drives the urgency of missions: the church participates in the eschatological plan by taking the gospel to every people group. The verse also provides comfort during persecution (v.9): suffering is not meaningless but serves the spread of the gospel. Paul understood his apostolic mission in these terms (Romans 15:19-24; Colossians 1:23).'),
  (11, 'But when they shall lead you, and deliver you up, take no thought beforehand what ye shall speak, neither do ye premeditate: but whatsoever shall be given you in that hour, that speak ye: for it is not ye that speak, but the Holy Ghost.',
   'ὅταν δὲ ἀγάγωσιν ὑμᾶς παραδιδόντες μὴ προμεριμνᾶτε τί λαλήσητε μηδὲ μελετᾶτε ἀλλ᾿ ὃ ἐὰν δοθῇ ὑμῖν ἐν ἐκείνῃ τῇ ὥρᾳ τοῦτο λαλεῖτε οὐ γάρ ἐστε ὑμεῖς οἱ λαλοῦντες ἀλλὰ τὸ πνεῦμα τὸ ἅγιον',
   'hotan de agagōsin hymas paradidontes mē promerimnate ti lalēsēte mēde meletate all ho ean dothē hymin en ekeinē tē hōra touto laleite ou gar este hymeis hoi lalountes alla to pneuma to hagion',
   '''Take no thought beforehand'' (mē promerimnate — do not worry in advance). ''Premeditate'' (meletate — rehearse, prepare a speech). ''The Holy Ghost'' (to pneuma to hagion — the Holy Spirit). Jesus promises direct divine assistance during persecution. This is not a prohibition against preparation for preaching but a specific promise for crisis situations: when arrested for the faith, the Holy Spirit will speak through the disciples.',
   NULL),
  (12, 'Now the brother shall betray the brother to death, and the father the son; and children shall rise up against their parents, and shall cause them to be put to death.',
   'παραδώσει δὲ ἀδελφὸς ἀδελφὸν εἰς θάνατον καὶ πατὴρ τέκνον καὶ ἐπαναστήσονται τέκνα ἐπὶ γονεῖς καὶ θανατώσουσιν αὐτούς',
   'paradōsei de adelphos adelphon eis thanaton kai patēr teknon kai epanastēsontai tekna epi goneis kai thanatōsousin autous',
   '''Betray'' (paradōsei — hand over, deliver up; the same verb used of Judas betraying Jesus). ''Brother against brother, father against son, children against parents'' — the breakdown of the most fundamental human bonds. Allegiance to Christ will divide families. The prophecy echoes Micah 7:6 and was literally fulfilled in the early church, where conversion to Christianity often meant family rejection, disinheritance, or worse.',
   NULL),
  (13, 'And ye shall be hated of all men for my name''s sake: but he that shall endure unto the end, the same shall be saved.',
   'καὶ ἔσεσθε μισούμενοι ὑπὸ πάντων διὰ τὸ ὄνομά μου ὁ δὲ ὑπομείνας εἰς τέλος οὗτος σωθήσεται',
   'kai esesthe misoumenoi hypo pantōn dia to onoma mou ho de hypomeinas eis telos houtos sōthēsetai',
   '''Hated of all'' (misoumenoi hypo pantōn — universally despised). ''For my name''s sake'' (dia to onoma mou — because of your identification with me). ''Endure'' (hypomeinas — remain under, stand firm under pressure; from hypo + menō). ''Unto the end'' (eis telos — to the completion). ''Shall be saved'' (sōthēsetai — will be delivered, preserved). Endurance is not the cause of salvation but its evidence — genuine faith perseveres through suffering.',
   NULL),
  (14, 'But when ye shall see the abomination of desolation, spoken of by Daniel the prophet, standing where it ought not, (let him that readeth understand,) then let them that be in Judaea flee to the mountains:',
   'ὅταν δὲ ἴδητε τὸ βδέλυγμα τῆς ἐρημώσεως τὸ ῥηθὲν ὑπὸ Δανιὴλ τοῦ προφήτου ἑστὸς ὅπου οὐ δεῖ ὁ ἀναγινώσκων νοείτω τότε οἱ ἐν τῇ Ἰουδαίᾳ φευγέτωσαν εἰς τὰ ὄρη',
   'hotan de idēte to bdelygma tēs erēmōseōs to rhēthen hypo Daniēl tou prophētou hestos hopou ou dei ho anaginōskōn noeitō tote hoi en tē Ioudaia pheugetōsan eis ta orē',
   '''Abomination of desolation'' (bdelygma tēs erēmōseōs — a detestable thing that causes desolation; from Daniel 9:27; 11:31; 12:11). ''Standing where it ought not'' (hestos hopou ou dei — standing where it must not stand; masculine participle hestos with neuter noun bdelygma, suggesting a person). ''Let him that readeth understand'' — a parenthetical editorial note (from Mark or from Jesus) signalling that this requires spiritual discernment. ''Flee to the mountains'' — when this sign appears, there is no time for anything except immediate flight.',
   'The ''abomination of desolation'' is one of the most debated phrases in biblical prophecy. Daniel originally described Antiochus IV Epiphanes desecrating the temple in 167 BC (Daniel 11:31). Jesus applies the phrase to a future event. Historically, the primary fulfilment is the Roman siege and destruction of Jerusalem in AD 70 — early Christians, heeding Jesus'' warning, fled to Pella in the Transjordan before the city fell. Many scholars also see a future eschatological fulfilment in a final antichrist figure who will desecrate a rebuilt temple (cf. 2 Thessalonians 2:3-4). The parenthetical ''let him that readeth understand'' invites each generation to discern the application.'),
  (15, 'And let him that is on the housetop not go down into the house, neither enter therein, to take any thing out of his house:',
   'ὁ δὲ ἐπὶ τοῦ δώματος μὴ καταβάτω εἰς τὴν οἰκίαν μηδὲ εἰσελθέτω ἆραί τι ἐκ τῆς οἰκίας αὐτοῦ',
   'ho de epi tou dōmatos mē katabatō eis tēn oikian mēde eiselthetō arai ti ek tēs oikias autou',
   '''Housetop'' (dōmatos — flat roof; in Palestine, roofs were used as living spaces and could be accessed by external stairs). ''Not go down'' — do not enter the house to retrieve possessions. The urgency is extreme: even the time required to go downstairs and grab belongings could be fatal. External stairs allowed direct descent from the roof to the street. The command emphasises the suddenness and severity of the coming destruction.',
   NULL),
  (16, 'And let him that is in the field not turn back again for to take up his garment.',
   'καὶ ὁ εἰς τὸν ἀγρὸν ὢν μὴ ἐπιστρεψάτω εἰς τὰ ὀπίσω ἆραι τὸ ἱμάτιον αὐτοῦ',
   'kai ho eis ton agron ōn mē epistrepsatō eis ta opisō arai to himation autou',
   '''In the field'' (eis ton agron — working in the agricultural fields). ''Turn back'' (epistrepsatō eis ta opisō — return to what is behind). ''Garment'' (himation — outer cloak; workers left their cloaks at the edge of the field). Do not go back even for essential clothing. The flight must be immediate and total. This echoes Lot''s escape from Sodom (Genesis 19:17) — ''Look not behind thee.''',
   NULL),
  (17, 'But woe to them that are with child, and to them that give suck in those days!',
   'οὐαὶ δὲ ταῖς ἐν γαστρὶ ἐχούσαις καὶ ταῖς θηλαζούσαις ἐν ἐκείναις ταῖς ἡμέραις',
   'ouai de tais en gastri echousais kai tais thēlazousais en ekeinais tais hēmerais',
   '''Woe'' (ouai — an exclamation of grief and compassion, not a curse). ''With child'' (en gastri echousais — pregnant). ''Give suck'' (thēlazousais — nursing). Jesus expresses tender compassion for those whose physical condition will make flight especially difficult. Pregnant women and nursing mothers cannot run quickly or easily. The woe is not condemnation but lament — these are the most vulnerable victims of the coming catastrophe.',
   NULL),
  (18, 'And pray ye that your flight be not in the winter.',
   'προσεύχεσθε δὲ ἵνα μὴ γένηται ἡ φυγὴ ὑμῶν χειμῶνος',
   'proseuchesthe de hina mē genētai hē phygē hymōn cheimōnos',
   '''Winter'' (cheimōnos — the stormy, cold season; winter rains made roads impassable and wadis dangerous). ''Pray'' — even amid prophesied events, prayer can influence circumstances. Jesus acknowledges that the timing of the flight matters: winter conditions would make escape far more dangerous and difficult. The instruction to pray shows that divine sovereignty and human responsibility work together.',
   NULL),
  (19, 'For in those days shall be affliction, such as was not from the beginning of the creation which God created unto this time, neither shall be.',
   'ἔσονται γὰρ αἱ ἡμέραι ἐκεῖναι θλῖψις οἵα οὐ γέγονεν τοιαύτη ἀπ᾿ ἀρχῆς κτίσεως ἣν ἔκτισεν ὁ θεὸς ἕως τοῦ νῦν καὶ οὐ μὴ γένηται',
   'esontai gar hai hēmerai ekeinai thlipsis hoia ou gegonen toiautē ap archēs ktiseōs hēn ektisen ho theos heōs tou nyn kai ou mē genētai',
   '''Affliction'' (thlipsis — tribulation, distress, pressure; from thlibō, to press, to crush). ''Such as was not from the beginning of creation'' — unparalleled in human history. ''Neither shall be'' — never to be repeated. Josephus''s account of the fall of Jerusalem in AD 70 describes horrors that match this description: over a million deaths, mass crucifixions, cannibalism during the siege, and the complete destruction of the city and temple.',
   NULL),
  (20, 'And except that the Lord had shortened those days, no flesh should be saved: but for the elect''s sake, whom he hath chosen, he hath shortened the days.',
   'καὶ εἰ μὴ κύριος ἐκολόβωσεν τὰς ἡμέρας οὐκ ἂν ἐσώθη πᾶσα σάρξ ἀλλὰ διὰ τοὺς ἐκλεκτοὺς οὓς ἐξελέξατο ἐκολόβωσεν τὰς ἡμέρας',
   'kai ei mē kyrios ekolobōsen tas hēmeras ouk an esōthē pasa sarx alla dia tous eklektous hous exelexato ekolobōsen tas hēmeras',
   '''Shortened'' (ekolobōsen — cut short, amputated; from koloboō, to dock, to curtail). ''No flesh should be saved'' (ouk an esōthē pasa sarx — no human being would survive). ''For the elect''s sake'' (dia tous eklektous — because of the chosen ones). ''Whom he hath chosen'' (hous exelexato — whom he selected). God limits the tribulation''s duration to preserve his elect. Even in judgment, God remembers mercy. The elect are the reason history does not end in total annihilation.',
   NULL),
  (21, 'And then if any man shall say to you, Lo, here is Christ; or, lo, he is there; believe him not:',
   'καὶ τότε ἐάν τις ὑμῖν εἴπῃ ἰδοὺ ὧδε ὁ Χριστός ἰδοὺ ἐκεῖ μὴ πιστεύετε',
   'kai tote ean tis hymin eipē idou hōde ho Christos idou ekei mē pisteuete',
   '''Believe him not'' (mē pisteuete — do not believe, do not trust). During times of crisis and tribulation, false messianic claims multiply. People desperate for deliverance are most vulnerable to deception. Jesus repeats and intensifies his earlier warning (v.6): the true Christ does not need advertisement — his coming will be unmistakable (v.26).',
   NULL),
  (22, 'For false Christs and false prophets shall rise, and shall shew signs and wonders, to seduce, if it were possible, even the elect.',
   'ἐγερθήσονται γὰρ ψευδόχριστοι καὶ ψευδοπροφῆται καὶ δώσουσιν σημεῖα καὶ τέρατα πρὸς τὸ ἀποπλανᾶν εἰ δυνατὸν τοὺς ἐκλεκτούς',
   'egerthēsontai gar pseudochristoi kai pseudoprophētai kai dōsousin sēmeia kai terata pros to apoplanan ei dynaton tous eklektous',
   '''False Christs'' (pseudochristoi — impostor messiahs). ''False prophets'' (pseudoprophētai — impostor prophets). ''Signs and wonders'' (sēmeia kai terata — miraculous signs and portents). ''To seduce'' (apoplanan — to deceive, to lead completely astray). ''If it were possible'' (ei dynaton — if it were within their power). The false teachers perform genuine supernatural signs — miracles alone do not validate a messenger (cf. Deuteronomy 13:1-3). ''Even the elect'' — the elect are the target, but ''if possible'' implies they will be preserved.',
   'This verse warns that supernatural signs and wonders are not a reliable test of truth. False messiahs and false prophets will perform genuine miracles to deceive. The implication is clear: discernment cannot be based on miraculous displays alone but must test the message against God''s revealed truth (Deuteronomy 13:1-3; 1 John 4:1). ''If it were possible, even the elect'' has been understood two ways: (1) The elect cannot ultimately be deceived (assurance); (2) The deception is so compelling that even the elect would be deceived were it not for God''s preserving grace. Either way, the verse underscores both the severity of the danger and the security of God''s people.'),
  (23, 'But take ye heed: behold, I have foretold you all things.',
   'ὑμεῖς δὲ βλέπετε ἰδοὺ προείρηκα ὑμῖν πάντα',
   'hymeis de blepete idou proeirēka hymin panta',
   '''Take heed'' (blepete — be vigilant; the third occurrence of this command in the chapter: vv.5, 9, 23). ''I have foretold you all things'' (proeirēka hymin panta — I have told you everything in advance). The warnings serve as protection: forewarned is forearmed. Jesus holds his disciples responsible to act on what they have been told. They cannot claim ignorance — every deception, every persecution, every sign has been disclosed.',
   NULL),
  (24, 'But in those days, after that tribulation, the sun shall be darkened, and the moon shall not give her light,',
   'ἀλλ᾿ ἐν ἐκείναις ταῖς ἡμέραις μετὰ τὴν θλῖψιν ἐκείνην ὁ ἥλιος σκοτισθήσεται καὶ ἡ σελήνη οὐ δώσει τὸ φέγγος αὐτῆς',
   'all en ekeinais tais hēmerais meta tēn thlipsin ekeinēn ho hēlios skotisthēsetai kai hē selēnē ou dōsei to phengos autēs',
   '''After that tribulation'' (meta tēn thlipsin ekeinēn — after the great tribulation described in vv.14-23). ''The sun shall be darkened'' (ho hēlios skotisthēsetai). ''The moon shall not give her light'' — cosmic signs drawn from Isaiah 13:10; 34:4; Joel 2:10, 31. These prophetic images signal the dissolution of the present world order. Whether literal (astronomical events) or symbolic (the collapse of earthly powers), they herald the arrival of the Son of Man.',
   NULL),
  (25, 'And the stars of heaven shall fall, and the powers that are in heaven shall be shaken.',
   'καὶ οἱ ἀστέρες ἔσονται ἐκ τοῦ οὐρανοῦ πίπτοντες καὶ αἱ δυνάμεις αἱ ἐν τοῖς οὐρανοῖς σαλευθήσονται',
   'kai hoi asteres esontai ek tou ouranou piptontes kai hai dynameis hai en tois ouranois saleuthēsontai',
   '''Stars shall fall'' (asteres piptontes — stars falling from heaven). ''Powers'' (dynameis — the forces, energies, or authorities of heaven). ''Shaken'' (saleuthēsontai — agitated, destabilised). The entire cosmic order trembles — the fixed points of the universe become unfixed. This echoes Isaiah 34:4 and Haggai 2:6. The language conveys that the return of the Son of Man is a cosmos-shaking event, not a private or local occurrence.',
   NULL),
  (26, 'And then shall they see the Son of man coming in the clouds with great power and glory.',
   'καὶ τότε ὄψονται τὸν υἱὸν τοῦ ἀνθρώπου ἐρχόμενον ἐν νεφέλαις μετὰ δυνάμεως πολλῆς καὶ δόξης',
   'kai tote opsontai ton huion tou anthrōpou erchomenon en nephelais meta dynameōs pollēs kai doxēs',
   '''Son of man'' (ton huion tou anthrōpou — Jesus'' preferred self-designation, drawn from Daniel 7:13-14). ''Coming in the clouds'' (erchomenon en nephelais — clouds are consistently associated with divine presence: Exodus 13:21; 1 Kings 8:10-11; Daniel 7:13). ''Great power and glory'' (dynameōs pollēs kai doxēs — immense power and radiant splendour). The one who stood before the Sanhedrin in weakness will return in unimaginable majesty. The contrast with the crucified Jesus could not be sharper.',
   'This verse is the theological centre of the Olivet Discourse. Jesus quotes Daniel 7:13-14, where ''one like the Son of man'' comes to the Ancient of Days and receives ''dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him.'' The ''coming in the clouds'' echoes the divine theophany tradition — God himself rides the clouds (Psalm 104:3; Isaiah 19:1). By claiming this for himself, Jesus declares that his return will be a divine visitation. The ''great power and glory'' stands in stark contrast to his first coming in humility: born in a manger, dying on a cross. The second coming reverses everything: the rejected stone becomes the cosmic king.'),
  (27, 'And then shall he send his angels, and shall gather together his elect from the four winds, from the uttermost part of the earth to the uttermost part of heaven.',
   'καὶ τότε ἀποστελεῖ τοὺς ἀγγέλους αὐτοῦ καὶ ἐπισυνάξει τοὺς ἐκλεκτοὺς αὐτοῦ ἐκ τῶν τεσσάρων ἀνέμων ἀπ᾿ ἄκρου γῆς ἕως ἄκρου οὐρανοῦ',
   'kai tote apostelei tous angelous autou kai episynaxei tous eklektous autou ek tōn tessarōn anemōn ap akrou gēs heōs akrou ouranou',
   '''His angels'' (tous angelous autou — the Son of Man commands angelic hosts). ''Gather together his elect'' (episynaxei tous eklektous — will assemble, collect, reunite the chosen ones). ''Four winds'' (tessarōn anemōn — from every direction, universally). ''Uttermost part of the earth to the uttermost part of heaven'' — from horizon to zenith; no elect person will be missed. The gathering encompasses both the living (from earth) and the dead (from heaven). This is the blessed hope of the church: reunion with Christ.',
   NULL),
  (28, 'Now learn a parable of the fig tree; When her branch is yet tender, and putteth forth leaves, ye know that summer is near:',
   'ἀπὸ δὲ τῆς συκῆς μάθετε τὴν παραβολήν ὅταν αὐτῆς ἤδη ὁ κλάδος ἁπαλὸς γένηται καὶ ἐκφύῃ τὰ φύλλα γινώσκετε ὅτι ἐγγὺς τὸ θέρος ἐστίν',
   'apo de tēs sykēs mathete tēn parabolēn hotan autēs ēdē ho klados hapalos genētai kai ekphyē ta phylla ginōskete hoti engys to theros estin',
   '''Fig tree'' (sykēs — not the same fig tree as 11:13-14, but using a natural phenomenon as illustration). ''Branch is yet tender'' (klados hapalos — soft, pliant, full of sap). ''Putteth forth leaves'' (ekphyē ta phylla — sprouts leaves). ''Summer is near'' (engys to theros). Just as budding leaves are a reliable sign of approaching summer, so the signs Jesus has described (vv.5-25) indicate that the end is approaching. The parable teaches discernment: read the signs.',
   NULL),
  (29, 'So ye in like manner, when ye shall see these things come to pass, know that it is nigh, even at the doors.',
   'οὕτως καὶ ὑμεῖς ὅταν ταῦτα ἴδητε γινόμενα γινώσκετε ὅτι ἐγγύς ἐστιν ἐπὶ θύραις',
   'houtōs kai hymeis hotan tauta idēte ginomena ginōskete hoti engys estin epi thyrais',
   '''These things'' (tauta — the signs described in the discourse). ''At the doors'' (epi thyrais — at the very threshold). The analogy is clear: as spring foliage signals summer, so the prophesied events signal the nearness of the end. ''It'' or ''he'' (estin — the Greek is ambiguous: the end is near, or he [the Son of Man] is near). Either way, the signs demand recognition and response.',
   NULL),
  (30, 'Verily I say unto you, that this generation shall not pass, till all these things be done.',
   'ἀμὴν λέγω ὑμῖν ὅτι οὐ μὴ παρέλθῃ ἡ γενεὰ αὕτη μέχρις οὗ πάντα ταῦτα γένηται',
   'amēn legō hymin hoti ou mē parelthē hē genea hautē mechris hou panta tauta genētai',
   '''This generation'' (hē genea hautē) — one of the most debated phrases in NT prophecy. Options: (1) The generation alive when Jesus spoke — fulfilled in AD 70 when the temple was destroyed. (2) The generation that sees the final signs — they will also see the consummation. (3) ''Generation'' (genea) meaning ''race'' or ''kind'' — the Jewish people will survive until the end. (4) The generation of unbelief. The most natural reading links ''this generation'' to the contemporary disciples and ''all these things'' to the events of AD 70, with the cosmic signs and the Son of Man''s return constituting a further fulfilment.',
   NULL),
  (31, 'Heaven and earth shall pass away: but my words shall not pass away.',
   'ὁ οὐρανὸς καὶ ἡ γῆ παρελεύσονται οἱ δὲ λόγοι μου οὐ μὴ παρελεύσονται',
   'ho ouranos kai hē gē pareleusontai hoi de logoi mou ou mē pareleusontai',
   '''Heaven and earth shall pass away'' (pareleusontai — will pass by, will come to an end). ''My words shall not pass away'' (ou mē pareleusontai — emphatic double negative: will absolutely never pass away). Jesus claims that his words have greater permanence than the physical universe. This is an extraordinary claim to divine authority — only God''s word endures forever (Isaiah 40:8). Jesus places his own words on the same level as God''s eternal word.',
   'This verse contains one of Jesus'' most breathtaking claims. The physical cosmos — heaven and earth, the seemingly permanent framework of all reality — will pass away. But Jesus'' words will outlast the universe itself. This claim puts Jesus'' teaching on par with God''s own word (Isaiah 40:8; Psalm 119:89). No mere prophet or teacher could make such a claim without blasphemy. Either Jesus is deluded, or his words carry divine authority that transcends the created order. The early church took this claim at face value, treating Jesus'' words as authoritative scripture (1 Timothy 5:18; 2 Peter 3:2).'),
  (32, 'But of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father.',
   'περὶ δὲ τῆς ἡμέρας ἐκείνης ἢ τῆς ὥρας οὐδεὶς οἶδεν οὐδὲ οἱ ἄγγελοι οἱ ἐν οὐρανῷ οὐδὲ ὁ υἱός εἰ μὴ ὁ πατήρ',
   'peri de tēs hēmeras ekeinēs ē tēs hōras oudeis oiden oude hoi angeloi hoi en ouranō oude ho huios ei mē ho patēr',
   '''That day'' (tēs hēmeras ekeinēs — the specific day of the Son of Man''s return). ''Knoweth no man'' (oudeis oiden — no one knows). ''Not the angels'' — heavenly beings are excluded. ''Neither the Son'' (oude ho huios — a striking admission of the Son''s voluntary limitation of knowledge during the incarnation). ''But the Father'' (ei mē ho patēr — the Father alone). This verse has generated profound christological discussion about the relationship between Jesus'' divine and human natures.',
   'This is one of the most theologically significant verses in Mark. Jesus declares that even he, the Son, does not know the time of his own return — only the Father knows. This has been understood in several ways: (1) In his incarnate state, the Son voluntarily limited his omniscience (kenosis; cf. Philippians 2:7). (2) The Son knows as God but does not know in his human nature (the two-natures Christology of Chalcedon). (3) The Son does not know ''for the purpose of revealing'' — it is not his role to disclose this. Whatever the explanation, the practical implication is clear: if the Son himself does not know, then all human attempts to calculate the date of the Second Coming are futile and presumptuous.'),
  (33, 'Take ye heed, watch and pray: for ye know not when the time is.',
   'βλέπετε ἀγρυπνεῖτε καὶ προσεύχεσθε οὐκ οἴδατε γὰρ πότε ὁ καιρός ἐστιν',
   'blepete agrypneite kai proseuchesthe ouk oidate gar pote ho kairos estin',
   '''Take heed'' (blepete — be alert; fourth use). ''Watch'' (agrypneite — stay awake, be sleepless; from a-grypneō, to be without sleep). ''Pray'' (proseuchesthe — engage in prayer). ''The time'' (ho kairos — the appointed time, the decisive moment). Three imperatives: watch, be alert, pray. Because the time is unknown, constant readiness is required. Prayer is the companion of watchfulness — it keeps the heart connected to God during the long wait.',
   NULL),
  (34, 'For the Son of man is as a man taking a far journey, who left his house, and gave authority to his servants, and to every man his work, and commanded the porter to watch.',
   'ὡς ἄνθρωπος ἀπόδημος ἀφεὶς τὴν οἰκίαν αὐτοῦ καὶ δοὺς τοῖς δούλοις αὐτοῦ τὴν ἐξουσίαν καὶ ἑκάστῳ τὸ ἔργον αὐτοῦ καὶ τῷ θυρωρῷ ἐνετείλατο ἵνα γρηγορῇ',
   'hōs anthrōpos apodēmos apheis tēn oikian autou kai dous tois doulois autou tēn exousian kai hekastō to ergon autou kai tō thyrōrō eneteilato hina grēgorē',
   '''A man taking a far journey'' (anthrōpos apodēmos — a man going abroad). ''Left his house'' — Jesus is the householder who will depart (ascension). ''Gave authority to his servants'' (dous tois doulois tēn exousian — delegated responsibility). ''Every man his work'' (hekastō to ergon — each servant has a specific task). ''The porter'' (thyrōrō — the doorkeeper, the watchman). ''Watch'' (grēgorē — stay alert). The parable of the absent master: the servants must be faithful in their assigned work while the master is away.',
   NULL),
  (35, 'Watch ye therefore: for ye know not when the master of the house cometh, at even, or at midnight, or at the cockcrowing, or in the morning:',
   'γρηγορεῖτε οὖν οὐκ οἴδατε γὰρ πότε ὁ κύριος τῆς οἰκίας ἔρχεται ὀψὲ ἢ μεσονυκτίου ἢ ἀλεκτοροφωνίας ἢ πρωΐ',
   'grēgoreite oun ouk oidate gar pote ho kyrios tēs oikias erchetai opse ē mesonyktiou ē alektorophōnias ē prōi',
   '''Watch'' (grēgoreite — stay awake, be vigilant; the central command). ''Master of the house'' (ho kyrios tēs oikias — the lord of the household, i.e., Jesus). ''At even, or at midnight, or at the cockcrowing, or in the morning'' — the four Roman night watches: evening (6-9 PM), midnight (9 PM-12 AM), cockcrowing (12-3 AM), morning (3-6 AM). The master could return at any watch — readiness must be constant.',
   NULL),
  (36, 'Lest coming suddenly he find you sleeping.',
   'μὴ ἐλθὼν ἐξαίφνης εὕρῃ ὑμᾶς καθεύδοντας',
   'mē elthōn exaiphnēs heurē hymas katheudontas',
   '''Suddenly'' (exaiphnēs — unexpectedly, without warning). ''Sleeping'' (katheudontas — asleep, spiritually unconscious). The worst possible scenario: the master returns to find his servants asleep at their posts. ''Sleeping'' represents spiritual apathy, moral carelessness, and failure to maintain the alertness Jesus has commanded throughout this discourse. The warning anticipates Gethsemane (14:37-40), where the disciples will literally fall asleep.',
   NULL),
  (37, 'And what I say unto you I say unto all, Watch.',
   'ἃ δὲ ὑμῖν λέγω πᾶσιν λέγω γρηγορεῖτε',
   'ha de hymin legō pasin legō grēgoreite',
   '''What I say unto you I say unto all'' — Jesus extends the discourse beyond the four disciples to every future believer. ''Watch'' (grēgoreite — be alert). The final word of the Olivet Discourse is a single imperative: Watch. This is Jesus'' summary command for the entire age between his departure and his return. Every generation of believers stands under this order. The discourse began with warnings about deception (v.5) and ends with the command to vigilance. Watchfulness is the defining posture of the church between the ascension and the parousia.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 13;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 thrown down
  ('καταλύω', 'katalyō', 'G2647', 'To destroy, demolish, throw down, dissolve — from kata (down) + lyō (to loose). Used of dismantling a building stone by stone. Jesus prophesies the total destruction of the temple — not just damage but complete demolition. Fulfilled in AD 70 when Roman soldiers, driven by the rumour that gold had melted between the stones, literally pried apart the temple block by block. The word conveys systematic, thorough destruction — nothing left standing.', 1),
  -- v.8 birth pangs
  ('ὠδίν', 'ōdin', 'G5604', 'Birth pang, labour pain — the pain that precedes and signals the arrival of new life. In Jewish apocalyptic thought, the ''birth pangs of the Messiah'' (chevlei shel Mashiach) were the sufferings that would precede the messianic age. Jesus adopts this imagery: wars, earthquakes, and famines are not the end itself but the onset of labour. Birth pangs increase in intensity and frequency before delivery — the world''s suffering will crescendo before the Son of Man''s coming brings the new creation to birth.', 2),
  -- v.10 gospel/good news
  ('εὐαγγέλιον', 'euangelion', 'G2098', 'Gospel, good news — from eu (good) + angelia (message, announcement). Originally a secular term for a victory announcement or imperial proclamation (e.g., the birth or accession of a Caesar). Jesus transforms it into the announcement of God''s kingdom arriving through his death and resurrection. The gospel ''must first'' (prōton dei) be proclaimed to all nations before the end — making world evangelisation a prerequisite for the consummation. The church''s mission is woven into God''s eschatological timetable.', 3),
  -- v.14 abomination of desolation
  ('βδέλυγμα τῆς ἐρημώσεως', 'bdelygma tēs erēmōseōs', 'G946/G2050', 'Abomination of desolation — bdelygma (a detestable thing, an object of horror; from bdelyssō, to stink, to feel nausea) + erēmōsis (desolation, devastation). From Daniel 9:27; 11:31; 12:11. Originally describing the altar to Zeus that Antiochus IV erected in the temple in 167 BC. Jesus applies it to a future desecration — historically fulfilled in the Roman destruction of AD 70, with many interpreters also seeing a future eschatological antichrist figure (2 Thessalonians 2:3-4). The masculine participle ''standing'' (hestos) with the neuter noun suggests a person, not merely an object.', 4),
  -- v.22 false Christs
  ('ψευδόχριστος', 'pseudochristos', 'G5580', 'False Christ, false Messiah — from pseudēs (false, lying) + Christos (Christ, Anointed One). An impostor who claims to be the Messiah. Jesus warns that these will perform genuine signs and wonders (sēmeia kai terata) — miracles alone do not validate a messenger. The criterion for truth is not miraculous power but conformity to God''s revealed word (Deuteronomy 13:1-3). History has produced numerous false messiahs; each generation must exercise discernment to distinguish the true Christ from counterfeits.', 5),
  -- v.26 Son of Man
  ('υἱὸς τοῦ ἀνθρώπου', 'huios tou anthrōpou', 'G5207/G444', 'Son of Man — Jesus'' preferred self-designation, used over 80 times in the Gospels. Drawn from Daniel 7:13-14, where ''one like the Son of man'' comes on clouds to receive universal, eternal dominion from the Ancient of Days. The title combines human identity (son of man = human being) with divine prerogative (riding clouds, receiving worship). In Mark 13:26, the Son of Man comes not to receive a kingdom from the Ancient of Days but to consummate it on earth — with great power and glory, attended by angelic hosts, gathering his elect from every corner of creation.', 6),
  -- v.31 words shall not pass away
  ('λόγος', 'logos', 'G3056', 'Word, message, discourse — from legō (to speak, to say). Jesus claims his logoi (words/teachings) will outlast the physical universe. In the OT, only God''s word possesses this eternal quality (Isaiah 40:8; Psalm 119:89). By claiming the same permanence for his own words, Jesus implicitly claims divine authority. His words are not human opinions subject to obsolescence but divine revelation that endures when heaven and earth have ceased to exist. This is the highest possible claim for the authority of Jesus'' teaching.', 7),
  -- v.35 watch
  ('γρηγορέω', 'grēgoreō', 'G1127', 'To watch, be vigilant, stay awake, be alert — from egeirō (to rouse, to raise up). The culminating imperative of the Olivet Discourse, appearing in vv.34, 35, and 37. Grēgoreō describes the posture of a sentry on night duty who must remain awake and alert despite darkness, fatigue, and uncertainty about when the threat (or the relief) will arrive. For the church, watchfulness means spiritual alertness: maintaining faith, resisting deception, fulfilling assigned duties, and living in constant readiness for the Master''s return. It is the opposite of spiritual sleeping (katheudō, v.36).', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 13
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 8
    WHEN 3 THEN 10
    WHEN 4 THEN 14
    WHEN 5 THEN 22
    WHEN 6 THEN 26
    WHEN 7 THEN 31
    WHEN 8 THEN 35
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 temple destroyed
  (2, 'Matthew 24:1-2', 1),
  (2, 'Luke 21:5-6', 2),
  (2, 'Luke 19:44', 3),
  -- v.6 false Christs
  (6, '1 John 2:18', 4),
  (6, 'Matthew 24:5', 5),
  -- v.7 wars and rumours
  (7, 'Matthew 24:6-7', 6),
  (7, 'Revelation 6:1-8', 7),
  -- v.8 beginning of sorrows
  (8, 'Isaiah 13:8', 8),
  (8, '1 Thessalonians 5:3', 9),
  -- v.9 delivered to councils
  (9, 'Matthew 10:17-20', 10),
  (9, 'Acts 5:40', 11),
  (9, 'Acts 12:1-4', 12),
  -- v.10 gospel to all nations
  (10, 'Matthew 24:14', 13),
  (10, 'Romans 15:19-24', 14),
  (10, 'Colossians 1:23', 15),
  -- v.11 Holy Ghost speaks
  (11, 'Luke 12:11-12', 16),
  (11, 'Acts 4:8-12', 17),
  -- v.12 family betrayal
  (12, 'Micah 7:6', 18),
  (12, 'Matthew 10:21', 19),
  -- v.13 endure to the end
  (13, 'Matthew 10:22', 20),
  (13, 'Revelation 2:10', 21),
  -- v.14 abomination of desolation
  (14, 'Daniel 9:27', 22),
  (14, 'Daniel 11:31', 23),
  (14, 'Daniel 12:11', 24),
  (14, 'Matthew 24:15', 25),
  (14, '2 Thessalonians 2:3-4', 26),
  -- v.19 great tribulation
  (19, 'Daniel 12:1', 27),
  (19, 'Revelation 7:14', 28),
  -- v.20 elect''s sake
  (20, 'Romans 11:5-7', 29),
  (20, '2 Timothy 2:10', 30),
  -- v.22 false signs and wonders
  (22, 'Deuteronomy 13:1-3', 31),
  (22, '2 Thessalonians 2:9-10', 32),
  (22, 'Revelation 13:13-14', 33),
  -- v.24 sun darkened
  (24, 'Isaiah 13:10', 34),
  (24, 'Joel 2:31', 35),
  (24, 'Revelation 6:12-13', 36),
  -- v.26 Son of Man coming
  (26, 'Daniel 7:13-14', 37),
  (26, 'Revelation 1:7', 38),
  (26, 'Matthew 24:30', 39),
  (26, 'Acts 1:11', 40),
  -- v.27 gather the elect
  (27, 'Matthew 24:31', 41),
  (27, '1 Thessalonians 4:16-17', 42),
  -- v.31 my words not pass away
  (31, 'Isaiah 40:8', 43),
  (31, 'Psalm 119:89', 44),
  (31, '1 Peter 1:25', 45),
  -- v.32 no man knows the hour
  (32, 'Matthew 24:36', 46),
  (32, 'Acts 1:7', 47),
  -- v.33 watch and pray
  (33, '1 Thessalonians 5:6', 48),
  (33, '1 Peter 5:8', 49),
  -- v.35 four watches
  (35, 'Luke 12:35-40', 50),
  (35, 'Revelation 16:15', 51)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 13
  AND v.verse_number = cr.verse_number;
