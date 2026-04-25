-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 14 — Betrayal, the Last Supper, Gethsemane, and the Trial
-- 72 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 14,
  'Mark 14 is the longest chapter in Mark and the heart of the Passion narrative, covering the final hours before the crucifixion. It opens two days before Passover: the chief priests and scribes plot to arrest Jesus secretly, ''not on the feast day, lest there be an uproar of the people'' (vv.1-2). In Bethany, at the house of Simon the leper, a woman anoints Jesus'' head with ''very precious'' spikenard ointment (vv.3-9). When some object to the waste, Jesus defends her: ''She hath done what she could: she is come aforehand to anoint my body to the burying'' (v.8). ''Wheresoever this gospel shall be preached throughout the whole world, this also that she hath done shall be spoken of for a memorial of her'' (v.9). Judas Iscariot then goes to the chief priests to betray Jesus (vv.10-11). On the first day of unleavened bread, Jesus sends two disciples to prepare the Passover, again demonstrating supernatural foreknowledge (vv.12-16). At the Last Supper, Jesus announces: ''One of you which eateth with me shall betray me'' (v.18). Each disciple asks ''Is it I?'' (v.19). Jesus identifies the betrayer as ''one that dippeth with me in the dish'' (v.20). During the meal, Jesus institutes the Lord''s Supper: ''This is my body... This is my blood of the new testament, which is shed for many'' (vv.22-24). They sing a hymn and go to the Mount of Olives (v.26). Jesus predicts the disciples'' desertion (''All ye shall be offended,'' v.27) and Peter''s triple denial (v.30). Peter vehemently protests: ''If I should die with thee, I will not deny thee in any wise'' (v.31). In Gethsemane, Jesus prays in agony: ''Abba, Father, all things are possible unto thee; take away this cup from me: nevertheless not what I will, but what thou wilt'' (v.36). He finds the disciples sleeping three times (vv.37-41). Judas arrives with an armed crowd, betrays Jesus with a kiss (vv.43-45). A young man flees naked (vv.51-52). Jesus is tried before the Sanhedrin; the high priest asks: ''Art thou the Christ, the Son of the Blessed?'' Jesus answers: ''I am: and ye shall see the Son of man sitting on the right hand of power, and coming in the clouds of heaven'' (vv.61-62). The high priest tears his clothes and declares blasphemy. Peter, in the courtyard below, denies Jesus three times before the cock crows twice, then breaks down weeping (vv.66-72).',
  'The Hour Has Come — Anointing, Betrayal, the New Covenant, and the Son of Man on Trial',
  'παραδίδωμι (paradidōmi)',
  'To hand over, deliver up, betray — from para (alongside, over to) + didōmi (to give). The dominant verb of the Passion: Judas ''delivers'' Jesus to the priests (v.10); the priests will ''deliver'' him to Pilate (15:1); God ''delivered'' him up for us all (Romans 8:32). Paradidōmi captures the multiple layers of the betrayal: human treachery and divine purpose converge. Jesus is handed over by a disciple, by the Sanhedrin, by Rome — and ultimately by the Father''s redemptive will.',
  '["The Plot and the Anointing at Bethany (vv.1-11): Two days before Passover the chief priests seek to arrest Jesus by subtilty. In Bethany a woman anoints Jesus'' head with costly spikenard. Some murmur at the waste but Jesus says she has anointed his body for burial. Wherever the gospel is preached her act will be remembered. Judas goes to the chief priests to betray Jesus","The Last Supper and the New Covenant (vv.12-26): Jesus sends two disciples to prepare the Passover with supernatural foreknowledge. During the meal he announces one of them will betray him. He takes bread breaks it and says This is my body. He takes the cup and says This is my blood of the new testament shed for many. They sing a hymn and go to the Mount of Olives","Peter''s Denial Foretold and Gethsemane (vv.27-42): Jesus predicts all will be offended. Peter protests — I will not deny thee. In Gethsemane Jesus prays — Abba Father take away this cup from me nevertheless not what I will but what thou wilt. He finds the disciples sleeping three times. The spirit truly is ready but the flesh is weak. The hour is come — the Son of man is betrayed into the hands of sinners","The Arrest and the Trial Before the Sanhedrin (vv.43-65): Judas betrays Jesus with a kiss. An armed crowd seizes him. A young man flees naked. Jesus is brought before the high priest and the Sanhedrin. False witnesses testify but their testimony disagrees. The high priest asks — Art thou the Christ? Jesus answers I am and ye shall see the Son of man at the right hand of power. They condemn him as guilty of death","Peter''s Denial (vv.66-72): Peter is in the courtyard below. A maid identifies him as being with Jesus of Nazareth. Peter denies it three times. The cock crows twice. Peter remembers Jesus'' words and breaks down weeping"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 72 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'After two days was the feast of the passover, and of unleavened bread: and the chief priests and the scribes sought how they might take him by craft, and put him to death.',
   'ἦν δὲ τὸ πάσχα καὶ τὰ ἄζυμα μετὰ δύο ἡμέρας καὶ ἐζήτουν οἱ ἀρχιερεῖς καὶ οἱ γραμματεῖς πῶς αὐτὸν ἐν δόλῳ κρατήσαντες ἀποκτείνωσιν',
   'ēn de to pascha kai ta azyma meta dyo hēmeras kai ezētoun hoi archiereis kai hoi grammateis pōs auton en dolō kratēsantes apokteinōsin',
   '''Passover'' (pascha — from Hebrew pesach; the annual feast commemorating Israel''s deliverance from Egypt, Exodus 12). ''Unleavened bread'' (azyma — the seven-day festival immediately following Passover). ''By craft'' (en dolō — by deceit, treachery, cunning). The religious leaders need stealth because Jesus is too popular to arrest openly. The irony is thick: the shepherds of Israel plot to murder the Lamb of God during Passover — the feast that celebrates God''s deliverance through a sacrificial lamb.',
   NULL),
  (2, 'But they said, Not on the feast day, lest there be an uproar of the people.',
   'ἔλεγον δέ μὴ ἐν τῇ ἑορτῇ μήποτε θόρυβος ἔσται τοῦ λαοῦ',
   'elegon de mē en tē heortē mēpote thorybos estai tou laou',
   '''Not on the feast day'' — they plan to avoid Passover due to the crowds. ''Uproar'' (thorybos — tumult, riot). Yet God overrules their timing: through Judas''s offer, Jesus is arrested and executed on Passover itself — the day the lambs are slain. Human scheming serves divine purposes.',
   NULL),
  (3, 'And being in Bethany in the house of Simon the leper, as he sat at meat, there came a woman having an alabaster box of ointment of spikenard very precious; and she brake the box, and poured it on his head.',
   'καὶ ὄντος αὐτοῦ ἐν Βηθανίᾳ ἐν τῇ οἰκίᾳ Σίμωνος τοῦ λεπροῦ κατακειμένου αὐτοῦ ἦλθεν γυνὴ ἔχουσα ἀλάβαστρον μύρου νάρδου πιστικῆς πολυτελοῦς καὶ συντρίψασα τὸ ἀλάβαστρον κατέχεεν αὐτοῦ κατὰ τῆς κεφαλῆς',
   'kai ontos autou en Bēthania en tē oikia Simōnos tou leprou katakeimenou autou ēlthen gynē echousa alabastron myrou nardou pistikēs polytelous kai synthripsasa to alabastron katecheen autou kata tēs kephalēs',
   '''Simon the leper'' — likely healed by Jesus (a leper would not host a dinner). ''Alabaster box'' (alabastron — a sealed flask made of alabaster stone, designed to preserve precious perfume). ''Spikenard'' (nardou pistikēs — genuine nard, pure nard; an aromatic plant from the Himalayas). ''Very precious'' (polytelous — extremely costly; John 12:5 gives the value as 300 denarii — nearly a year''s wages). ''Brake the box'' — she smashed the long neck of the flask, pouring out everything at once. No portion held back. ''On his head'' — in the OT, kings and priests were anointed on the head (1 Samuel 16:13; Exodus 29:7).',
   NULL),
  (4, 'And there were some that had indignation within themselves, and said, Why was this waste of the ointment made?',
   'ἦσαν δέ τινες ἀγανακτοῦντες πρὸς ἑαυτούς καὶ λέγοντες εἰς τί ἡ ἀπώλεια αὕτη τοῦ μύρου γέγονεν',
   'ēsan de tines aganaktountes pros heautous kai legontes eis ti hē apōleia hautē tou myrou gegonen',
   '''Indignation'' (aganaktountes — irritated, vexed, angry). ''Waste'' (apōleia — loss, destruction, ruin). Some guests see extravagant worship as waste. The same word (apōleia) used for ''waste'' can mean ''perdition'' — the real waste is not the ointment but the betrayal that follows (v.10). What the world calls waste, Jesus calls beautiful.',
   NULL),
  (5, 'For it might have been sold for more than three hundred pence, and have been given to the poor. And they murmured against her.',
   'ἠδύνατο γὰρ τοῦτο τὸ μύρον πραθῆναι ἐπάνω τριακοσίων δηναρίων καὶ δοθῆναι τοῖς πτωχοῖς καὶ ἐνεβριμῶντο αὐτῇ',
   'ēdynato gar touto to myron prathēnai epanō triakosiōn dēnariōn kai dothēnai tois ptōchois kai enebrimōnto autē',
   '''Three hundred pence'' (triakosiōn dēnariōn — 300 denarii; nearly a year''s wages for a labourer). ''Murmured against her'' (enebrimōnto — expressed harsh displeasure, scolded). The objection sounds reasonable: the money could have fed many poor families. But it masks a failure to understand the unique moment — Jesus is about to die. The poor will always need help (v.7); the opportunity to anoint the Messiah before his burial comes only once.',
   NULL),
  (6, 'And Jesus said, Let her alone; why trouble ye her? she hath wrought a good work on me.',
   'ὁ δὲ Ἰησοῦς εἶπεν ἄφετε αὐτήν τί αὐτῇ κόπους παρέχετε καλὸν ἔργον εἰργάσατο εἰς ἐμέ',
   'ho de Iēsous eipen aphete autēn ti autē kopous parechete kalon ergon eirgasato eis eme',
   '''Let her alone'' (aphete autēn — leave her be). ''Good work'' (kalon ergon — a beautiful, noble deed). Jesus defends the woman against her critics. What they call waste, he calls beauty. The word kalon means not just morally good but aesthetically beautiful — her act is a work of art, a masterpiece of devotion.',
   NULL),
  (7, 'For ye have the poor with you always, and whensoever ye will ye may do them good: but me ye have not always.',
   'πάντοτε γὰρ τοὺς πτωχοὺς ἔχετε μεθ᾿ ἑαυτῶν καὶ ὅταν θέλητε δύνασθε αὐτοὺς εὖ ποιῆσαι ἐμὲ δὲ οὐ πάντοτε ἔχετε',
   'pantote gar tous ptōchous echete meth heautōn kai hotan thelēte dynasthe autous eu poiēsai eme de ou pantote echete',
   'Jesus echoes Deuteronomy 15:11 (''the poor shall never cease out of the land''). ''Me ye have not always'' — his physical presence is about to end. This is not indifference to the poor but a recognition of eschatological urgency: Jesus'' imminent death creates a unique, unrepeatable occasion for this act of devotion. Caring for the poor is ongoing; anointing the Messiah for burial is a once-in-history moment.',
   NULL),
  (8, 'She hath done what she could: she is come aforehand to anoint my body to the burying.',
   'ὃ ἔσχεν αὐτὴ ἐποίησεν προέλαβεν μυρίσαι μου τὸ σῶμα εἰς τὸν ἐνταφιασμόν',
   'ho eschen autē epoiēsen proelaben myrisai mou to sōma eis ton entaphiasmon',
   '''She hath done what she could'' (ho eschen epoiēsen — she did what she was able; what lay within her power, she did). ''Aforehand to anoint'' (proelaben myrisai — anticipated, came beforehand to anoint). ''To the burying'' (eis ton entaphiasmon — for burial preparation). Jesus interprets her act prophetically: she has anointed his body for burial before it happens. Whether she understood this or not, her extravagant love was a prophetic act — the only anointing Jesus'' body would receive, since the women at the tomb found it empty.',
   NULL),
  (9, 'Verily I say unto you, Wheresoever this gospel shall be preached throughout the whole world, this also that she hath done shall be spoken of for a memorial of her.',
   'ἀμὴν λέγω ὑμῖν ὅπου ἐὰν κηρυχθῇ τὸ εὐαγγέλιον τοῦτο εἰς ὅλον τὸν κόσμον καὶ ὃ ἐποίησεν αὕτη λαληθήσεται εἰς μνημόσυνον αὐτῆς',
   'amēn legō hymin hopou ean kērychthē to euangelion touto eis holon ton kosmon kai ho epoiēsen hautē lalēthēsetai eis mnēmosynon autēs',
   '''Throughout the whole world'' (eis holon ton kosmon — in the entire world). ''Memorial'' (mnēmosynon — a remembrance, a memorial). Jesus promises that her nameless act of devotion will be inseparably woven into the gospel story itself. Two thousand years later, this prophecy continues to be fulfilled: everywhere the gospel is preached, her story is told. The woman is unnamed in Mark (John 12:3 identifies her as Mary), yet her memorial is eternal.',
   'This verse contains an extraordinary prophecy: wherever the gospel is preached in the whole world, this woman''s act will be recounted as a memorial. It is a prophecy about the gospel''s universal spread and about the permanent significance of this single act of devotion. The unnamed woman has received a memorial more enduring than any monument — her story is embedded in the eternal gospel. Jesus links her personal act of worship to the cosmic mission of the church: the gospel and the woman''s deed are inseparable.'),
  (10, 'And Judas Iscariot, one of the twelve, went unto the chief priests, to betray him unto them.',
   'καὶ Ἰούδας ὁ Ἰσκαριώτης εἷς τῶν δώδεκα ἀπῆλθεν πρὸς τοὺς ἀρχιερεῖς ἵνα παραδῷ αὐτὸν αὐτοῖς',
   'kai Ioudas ho Iskariōtēs heis tōn dōdeka apēlthen pros tous archiereis hina paradō auton autois',
   '''One of the twelve'' (heis tōn dōdeka — Mark emphasises the horror: the betrayer comes from the innermost circle). ''Betray'' (paradō — hand over, deliver). Mark places Judas''s defection immediately after the anointing, creating a devastating contrast: the woman gives everything for Jesus; Judas gives Jesus away for money. The juxtaposition is Mark''s literary genius — devotion and betrayal side by side.',
   NULL),
  (11, 'And when they heard it, they were glad, and promised to give him money. And he sought how he might conveniently betray him.',
   'οἱ δὲ ἀκούσαντες ἐχάρησαν καὶ ἐπηγγείλαντο αὐτῷ ἀργύριον δοῦναι καὶ ἐζήτει πῶς εὐκαίρως αὐτὸν παραδῷ',
   'hoi de akousantes echarēsan kai epēngeilanto autō argyrion dounai kai ezētei pōs eukairōs auton paradō',
   '''Were glad'' (echarēsan — rejoiced). ''Money'' (argyrion — silver). ''Conveniently'' (eukairōs — at a favourable time, opportunely). The chief priests'' problem (how to arrest Jesus without a riot) has been solved by an insider. Their joy at finding a traitor among the twelve reveals the depth of their moral corruption. Judas seeks the right moment — away from the crowds.',
   NULL),
  (12, 'And the first day of unleavened bread, when they killed the passover, the disciples said unto him, Where wilt thou that we go and prepare that thou mayest eat the passover?',
   'καὶ τῇ πρώτῃ ἡμέρᾳ τῶν ἀζύμων ὅτε τὸ πάσχα ἔθυον λέγουσιν αὐτῷ οἱ μαθηταὶ αὐτοῦ ποῦ θέλεις ἀπελθόντες ἑτοιμάσωμεν ἵνα φάγῃς τὸ πάσχα',
   'kai tē prōtē hēmera tōn azymōn hote to pascha ethyon legousin autō hoi mathētai autou pou theleis apelthontes hetoimasōmen hina phagēs to pascha',
   '''First day of unleavened bread'' — technically Nisan 14, when the Passover lambs were slaughtered in the temple (afternoon). ''Killed the passover'' (to pascha ethyon — sacrificed the Passover lamb). The disciples assume Jesus will celebrate the Passover meal. He will — but he will also transform it into something entirely new: the Lord''s Supper.',
   NULL),
  (13, 'And he sendeth forth two of his disciples, and saith unto them, Go ye into the city, and there shall meet you a man bearing a pitcher of water: follow him.',
   'καὶ ἀποστέλλει δύο τῶν μαθητῶν αὐτοῦ καὶ λέγει αὐτοῖς ὑπάγετε εἰς τὴν πόλιν καὶ ἀπαντήσει ὑμῖν ἄνθρωπος κεράμιον ὕδατος βαστάζων ἀκολουθήσατε αὐτῷ',
   'kai apostellei dyo tōn mathētōn autou kai legei autois hypagete eis tēn polin kai apantēsei hymin anthrōpos keramion hydatos bastazōn akolouthēsate autō',
   '''A man bearing a pitcher of water'' — women typically carried water in jars; a man carrying a ceramic pitcher (keramion) would have been conspicuous and easy to identify. This parallels the finding of the colt (11:1-6): Jesus demonstrates supernatural foreknowledge or prior arrangement, maintaining sovereign control even as events close in around him.',
   NULL),
  (14, 'And wheresoever he shall go in, say ye to the goodman of the house, The Master saith, Where is the guestchamber, where I shall eat the passover with my disciples?',
   'καὶ ὅπου ἐὰν εἰσέλθῃ εἴπατε τῷ οἰκοδεσπότῃ ὅτι ὁ διδάσκαλος λέγει ποῦ ἐστιν τὸ κατάλυμα ὅπου τὸ πάσχα μετὰ τῶν μαθητῶν μου φάγω',
   'kai hopou ean eiselthē eipate tō oikodespotē hoti ho didaskalos legei pou estin to katalyma hopou to pascha meta tōn mathētōn mou phagō',
   '''The Master'' (ho didaskalos — the Teacher). ''Guestchamber'' (katalyma — a guest room, a space set aside for visitors; the same word used in Luke 2:7 for the ''inn'' where there was no room at Jesus'' birth). The householder apparently knows who ''the Teacher'' is — suggesting a prior arrangement or a disciple of Jesus. The secrecy may be designed to prevent Judas from knowing the location in advance.',
   NULL),
  (15, 'And he will shew you a large upper room furnished and prepared: there make ready for us.',
   'καὶ αὐτὸς ὑμῖν δείξει ἀνάγαιον μέγα ἐστρωμένον ἕτοιμον καὶ ἐκεῖ ἑτοιμάσατε ἡμῖν',
   'kai autos hymin deixei anagaion mega estrōmenon hetoimon kai ekei hetoimasate hēmin',
   '''Upper room'' (anagaion — an upstairs room, an upper chamber). ''Furnished and prepared'' (estrōmenon hetoimon — spread with carpets/cushions and ready for use). Everything is arranged: the room exists, the furnishings are in place. The King has prepared for his final meal with his disciples. This upper room will become one of the most sacred spaces in Christian memory — the site of the Last Supper.',
   NULL),
  (16, 'And his disciples went forth, and came into the city, and found as he had said unto them: and they made ready the passover.',
   'καὶ ἐξῆλθον οἱ μαθηταὶ αὐτοῦ καὶ ἦλθον εἰς τὴν πόλιν καὶ εὗρον καθὼς εἶπεν αὐτοῖς καὶ ἡτοίμασαν τὸ πάσχα',
   'kai exēlthon hoi mathētai autou kai ēlthon eis tēn polin kai heuron kathōs eipen autois kai hētoimasan to pascha',
   '''Found as he had said'' (heuron kathōs eipen — everything matched his prediction exactly). ''Made ready the passover'' — the preparation included acquiring and roasting the lamb, preparing unleavened bread, bitter herbs, wine, and charoset (a fruit paste). The disciples prepare the traditional Passover elements, not knowing Jesus will reinterpret them.',
   NULL),
  (17, 'And in the evening he cometh with the twelve.',
   'καὶ ὀψίας γενομένης ἔρχεται μετὰ τῶν δώδεκα',
   'kai opsias genomenēs erchetai meta tōn dōdeka',
   '''In the evening'' (opsias genomenēs — after sunset; Nisan 15 has begun, as Jewish days begin at sundown). ''With the twelve'' — the full apostolic circle, including Judas. Jesus comes to his final meal knowing who will betray him, who will deny him, and what awaits him in the hours ahead.',
   NULL),
  (18, 'And as they sat and did eat, Jesus said, Verily I say unto you, One of you which eateth with me shall betray me.',
   'καὶ ἀνακειμένων αὐτῶν καὶ ἐσθιόντων ὁ Ἰησοῦς εἶπεν ἀμὴν λέγω ὑμῖν ὅτι εἷς ἐξ ὑμῶν παραδώσει με ὁ ἐσθίων μετ᾿ ἐμοῦ',
   'kai anakeimenōn autōn kai esthiontōn ho Iēsous eipen amēn legō hymin hoti heis ex hymōn paradōsei me ho esthiōn met emou',
   '''One of you which eateth with me shall betray me'' — echoing Psalm 41:9: ''Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.'' Sharing a meal was the deepest expression of fellowship and trust in the ancient world. Betrayal by a table-companion was the most grievous violation of social bonds. Jesus knows — and yet he serves the meal, washes the feet (John 13), and offers the bread.',
   NULL),
  (19, 'And they began to be sorrowful, and to say unto him one by one, Is it I?',
   'οἱ δὲ ἤρξαντο λυπεῖσθαι καὶ λέγειν αὐτῷ εἷς κατὰ εἷς μήτι ἐγώ',
   'hoi de ērxanto lypeisthai kai legein autō heis kata heis mēti egō',
   '''Sorrowful'' (lypeisthai — grieved, distressed). ''Is it I?'' (mēti egō — surely not I?; the question expects a negative answer but reveals underlying uncertainty). Remarkably, each disciple is less certain of himself than he is of the others. Self-knowledge is humbling — they suspect their own capacity for treachery. This is a mark of genuine, if incomplete, self-awareness.',
   NULL),
  (20, 'And he answered and said unto them, It is one of the twelve, that dippeth with me in the dish.',
   'ὁ δὲ ἀποκριθεὶς εἶπεν αὐτοῖς εἷς ἐκ τῶν δώδεκα ὁ ἐμβαπτόμενος μετ᾿ ἐμοῦ εἰς τὸ τρυβλίον',
   'ho de apokritheis eipen autois heis ek tōn dōdeka ho embaptomenos met emou eis to tryblion',
   '''One of the twelve'' — repeating the painful fact: the betrayer is from the inner circle. ''Dippeth with me in the dish'' (embaptomenos eis to tryblion — dipping into the common bowl at the same time). At a Passover meal, diners shared a common bowl of charoset. Jesus narrows the identification without yet naming Judas. The shared dish intensifies the intimacy of the betrayal.',
   NULL),
  (21, 'The Son of man indeed goeth, as it is written of him: but woe to that man by whom the Son of man is betrayed! good were it for that man if he had never been born.',
   'ὁ μὲν υἱὸς τοῦ ἀνθρώπου ὑπάγει καθὼς γέγραπται περὶ αὐτοῦ οὐαὶ δὲ τῷ ἀνθρώπῳ ἐκείνῳ δι᾿ οὗ ὁ υἱὸς τοῦ ἀνθρώπου παραδίδοται καλὸν ἦν αὐτῷ εἰ οὐκ ἐγεννήθη ὁ ἄνθρωπος ἐκεῖνος',
   'ho men huios tou anthrōpou hypagei kathōs gegraptai peri autou ouai de tō anthrōpō ekeinō di hou ho huios tou anthrōpou paradidotai kalon ēn autō ei ouk egennēthē ho anthrōpos ekeinos',
   '''Goeth, as it is written'' (hypagei kathōs gegraptai — proceeds according to Scripture; divine necessity). ''Woe to that man'' — Jesus holds divine sovereignty and human responsibility together without resolving the tension. The cross is foreordained (''as it is written''), but the betrayer bears personal responsibility. ''Good were it for that man if he had never been born'' — the most solemn statement Jesus makes about any individual. The divine plan does not exonerate the human agent.',
   'This verse perfectly balances divine sovereignty and human responsibility — the central paradox of the Passion. ''As it is written'' affirms that Jesus'' death is no accident but the fulfilment of prophetic Scripture (Isaiah 53; Psalm 22; Daniel 9:26). Yet ''woe to that man'' holds Judas fully accountable. God''s sovereign purpose does not eliminate human guilt. The cross was planned before the foundation of the world (1 Peter 1:20), yet the men who crucified Jesus acted freely and culpably (Acts 2:23). Both truths stand without cancelling each other.'),
  (22, 'And as they did eat, Jesus took bread, and blessed, and brake it, and gave it to them, and said, Take, eat: this is my body.',
   'καὶ ἐσθιόντων αὐτῶν λαβὼν ὁ Ἰησοῦς ἄρτον εὐλογήσας ἔκλασεν καὶ ἔδωκεν αὐτοῖς καὶ εἶπεν λάβετε φάγετε τοῦτό ἐστιν τὸ σῶμά μου',
   'kai esthiontōn autōn labōn ho Iēsous arton eulogēsas eklasen kai edōken autois kai eipen labete phagete touto estin to sōma mou',
   '''Took bread'' (labōn arton — the unleavened bread of Passover). ''Blessed'' (eulogēsas — spoke a blessing, gave thanks). ''Brake it'' (eklasen — broke it into pieces for distribution). ''This is my body'' (touto estin to sōma mou — this represents/is my body). Jesus transforms the Passover bread into a symbol of his own body about to be broken on the cross. The Passover celebrated Israel''s deliverance from Egypt through a lamb''s blood; the Lord''s Supper celebrates the new deliverance through the Lamb of God''s body.',
   'The institution of the Lord''s Supper is one of the foundational events of Christian worship. ''This is my body'' (touto estin to sōma mou) has been interpreted in four main traditions: (1) Transubstantiation — the bread becomes Christ''s actual body (Roman Catholic). (2) Consubstantiation — Christ''s body is present ''in, with, and under'' the bread (Lutheran). (3) Spiritual presence — Christ is spiritually present in the elements (Reformed/Calvinist). (4) Memorial — the bread is a symbol commemorating Christ''s death (Zwinglian/Baptist). All traditions agree on the essential point: the broken bread signifies Christ''s body given for his people.'),
  (23, 'And he took the cup, and when he had given thanks, he gave it to them: and they all drank of it.',
   'καὶ λαβὼν τὸ ποτήριον εὐχαριστήσας ἔδωκεν αὐτοῖς καὶ ἔπιον ἐξ αὐτοῦ πάντες',
   'kai labōn to potērion eucharistēsas edōken autois kai epion ex autou pantes',
   '''The cup'' (to potērion — the Passover meal included four cups of wine; this is likely the third cup, the ''cup of blessing/redemption''). ''Given thanks'' (eucharistēsas — from eucharistia, ''thanksgiving''; the root of ''Eucharist''). ''They all drank of it'' (epion pantes — all participated). The cup of the new covenant is shared by all — no one is excluded from the table except by their own refusal.',
   NULL),
  (24, 'And he said unto them, This is my blood of the new testament, which is shed for many.',
   'καὶ εἶπεν αὐτοῖς τοῦτό ἐστιν τὸ αἷμά μου τὸ τῆς καινῆς διαθήκης τὸ περὶ πολλῶν ἐκχυνόμενον',
   'kai eipen autois touto estin to haima mou to tēs kainēs diathēkēs to peri pollōn ekchynomenon',
   '''My blood'' (to haima mou — Jesus'' own blood). ''New testament'' (kainēs diathēkēs — new covenant; diathēkē means covenant or testament). ''Shed for many'' (peri pollōn ekchynomenon — poured out on behalf of many). Jesus establishes the new covenant prophesied by Jeremiah (31:31-34). The old covenant was ratified with animal blood at Sinai (Exodus 24:8); the new covenant is ratified with Jesus'' own blood. ''Many'' (pollōn) echoes Isaiah 53:12: ''he bare the sin of many.''',
   'This is the theological centre of the Last Supper. ''Blood of the new covenant'' combines two OT texts: Exodus 24:8 (''the blood of the covenant which the LORD hath made with you'') and Jeremiah 31:31-34 (''I will make a new covenant... I will forgive their iniquity''). The old covenant was established through the blood of sacrificial animals; the new covenant is established through the blood of God''s own Son. ''Shed for many'' (peri pollōn) echoes Isaiah 53:12 — the Suffering Servant who ''poured out his soul unto death'' and ''bare the sin of many.'' Jesus interprets his imminent death as a covenant-ratifying sacrifice that establishes a new relationship between God and humanity.'),
  (25, 'Verily I say unto you, I will drink no more of the fruit of the vine, until that day that I drink it new in the kingdom of God.',
   'ἀμὴν λέγω ὑμῖν ὅτι οὐκέτι οὐ μὴ πίω ἐκ τοῦ γεννήματος τῆς ἀμπέλου ἕως τῆς ἡμέρας ἐκείνης ὅταν αὐτὸ πίνω καινὸν ἐν τῇ βασιλείᾳ τοῦ θεοῦ',
   'amēn legō hymin hoti ouketi ou mē piō ek tou gennēmatos tēs ampelou heōs tēs hēmeras ekeinēs hotan auto pinō kainon en tē basileia tou theou',
   '''Fruit of the vine'' (gennēmatos tēs ampelou — the product of the grapevine). ''New'' (kainon — qualitatively new, not merely repeated). ''Kingdom of God'' — Jesus looks beyond the cross to the eschatological feast. This vow of abstinence creates a bridge between the Last Supper and the messianic banquet. The Lord''s Supper is a temporary practice — it anticipates a final celebration when Christ and his people feast together in the consummated kingdom.',
   NULL),
  (26, 'And when they had sung an hymn, they went out into the mount of Olives.',
   'καὶ ὑμνήσαντες ἐξῆλθον εἰς τὸ ὄρος τῶν ἐλαιῶν',
   'kai hymnēsantes exēlthon eis to oros tōn elaiōn',
   '''Sung an hymn'' (hymnēsantes — traditionally the second half of the Hallel, Psalms 115-118, sung after the Passover meal). ''Mount of Olives'' — Jesus walks toward Gethsemane singing psalms. Psalm 118 includes ''The LORD is on my side; I will not fear: what can man do unto me?'' (118:6) and ''The stone which the builders refused is become the head stone of the corner'' (118:22). Jesus sings about his own rejection and vindication on the way to his arrest.',
   NULL),
  (27, 'And Jesus saith unto them, All ye shall be offended because of me this night: for it is written, I will smite the shepherd, and the sheep shall be scattered.',
   'καὶ λέγει αὐτοῖς ὁ Ἰησοῦς ὅτι πάντες σκανδαλισθήσεσθε ἐν ἐμοὶ ἐν τῇ νυκτὶ ταύτῃ ὅτι γέγραπται πατάξω τὸν ποιμένα καὶ διασκορπισθήσεται τὰ πρόβατα',
   'kai legei autois ho Iēsous hoti pantes skandalisthēsesthe en emoi en tē nykti tautē hoti gegraptai pataxō ton poimena kai diaskorpisthēsetai ta probata',
   '''All ye shall be offended'' (pantes skandalisthēsesthe — all of you will stumble, fall away, be scandalised by me). ''This night'' — not eventually, but tonight. ''I will smite the shepherd'' — quoting Zechariah 13:7. The shepherd is struck, the sheep scatter. God himself (''I will smite'') is the agent who strikes the shepherd Jesus. The disciples'' desertion is not merely cowardice — it is part of the prophesied divine plan.',
   NULL),
  (28, 'But after that I am risen, I will go before you into Galilee.',
   'ἀλλὰ μετὰ τὸ ἐγερθῆναί με προάξω ὑμᾶς εἰς τὴν Γαλιλαίαν',
   'alla meta to egerthēnai me proaxō hymas eis tēn Galilaian',
   '''After I am risen'' (meta to egerthēnai me — after my resurrection; mentioned almost casually, as a certainty). ''Go before you'' (proaxō — go ahead of you, lead you). ''Galilee'' — the place where it all began. Even while predicting desertion, Jesus promises reunion. The shepherd who is struck will rise and reassemble his scattered flock. The resurrection is the answer to the Passion.',
   NULL),
  (29, 'But Peter said unto him, Although all shall be offended, yet will not I.',
   'ὁ δὲ Πέτρος ἔφη αὐτῷ εἰ καὶ πάντες σκανδαλισθήσονται ἀλλ᾿ οὐκ ἐγώ',
   'ho de Petros ephē autō ei kai pantes skandalisthēsontai all ouk egō',
   '''Although all... yet not I'' — Peter sets himself above the other disciples. His self-confidence is sincere but disastrous. He trusts his own devotion more than Jesus'' prophetic word. This overconfidence is the prelude to his catastrophic failure. Peter''s protest is not hypocrisy — he genuinely intends to stand firm. But he does not know the weakness of his own flesh.',
   NULL),
  (30, 'And Jesus saith unto him, Verily I say unto thee, That this day, even in this night, before the cock crow twice, thou shalt deny me thrice.',
   'καὶ λέγει αὐτῷ ὁ Ἰησοῦς ἀμὴν λέγω σοι ὅτι σὺ σήμερον ταύτῃ τῇ νυκτὶ πρὶν ἢ δὶς ἀλέκτορα φωνῆσαι τρίς με ἀπαρνήσῃ',
   'kai legei autō ho Iēsous amēn legō soi hoti sy sēmeron tautē tē nykti prin ē dis alektora phōnēsai tris me aparnēsē',
   '''This day, even in this night'' — emphatically specific: today, tonight. ''Before the cock crow twice'' (prin dis alektora phōnēsai — Mark alone mentions two crowings). ''Deny me thrice'' (tris me aparnēsē — three times you will disown me). Jesus responds to Peter''s boast with devastating precision: not only will Peter fall, he will fall repeatedly, and sooner than he imagines. The triple denial mirrors the triple sleeping in Gethsemane (vv.37-41).',
   NULL),
  (31, 'But he spake the more vehemently, If I should die with thee, I will not deny thee in any wise. Likewise also said they all.',
   'ὁ δὲ ἐκ περισσοῦ ἔλεγεν μᾶλλον ἐάν με δέῃ συναποθανεῖν σοι οὐ μή σε ἀπαρνήσομαι ὡσαύτως δὲ καὶ πάντες ἔλεγον',
   'ho de ek perissou elegen mallon ean me deē synapothanein soi ou mē se aparnēsomai hōsautōs de kai pantes elegon',
   '''More vehemently'' (ek perissou — excessively, emphatically). ''If I should die with thee'' (synapothanein — die together with you). ''All said likewise'' — every disciple echoes Peter''s protest. None of them believes Jesus'' prediction. Yet within hours, they will all flee (v.50), and Peter will deny him three times. Human resolve, however sincere, cannot withstand spiritual trial without divine enabling.',
   NULL),
  (32, 'And they came to a place which was named Gethsemane: and he saith to his disciples, Sit ye here, while I shall pray.',
   'καὶ ἔρχονται εἰς χωρίον οὗ τὸ ὄνομα Γεθσημανῆ καὶ λέγει τοῖς μαθηταῖς αὐτοῦ καθίσατε ὧδε ἕως προσεύξωμαι',
   'kai erchontai eis chōrion hou to onoma Gethsēmanē kai legei tois mathētais autou kathisate hōde heōs proseuxōmai',
   '''Gethsemane'' (Gethsēmanē — from Hebrew/Aramaic gat shemanim, ''oil press,'' a place where olives were crushed to extract oil). The name is symbolically rich: Jesus will be crushed in prayer here. Located on the western slope of the Mount of Olives. ''Sit ye here'' — Jesus stations the larger group of disciples as an outer ring while taking the inner three further.',
   NULL),
  (33, 'And he taketh with him Peter and James and John, and began to be sore amazed, and to be very heavy;',
   'καὶ παραλαμβάνει τὸν Πέτρον καὶ τὸν Ἰάκωβον καὶ τὸν Ἰωάννην μετ᾿ αὐτοῦ καὶ ἤρξατο ἐκθαμβεῖσθαι καὶ ἀδημονεῖν',
   'kai paralambanei ton Petron kai ton Iakōbon kai ton Iōannēn met autou kai ērxato ekthambeisthai kai adēmonein',
   '''Peter, James, and John'' — the same inner circle who witnessed the Transfiguration (9:2). They saw his glory; now they witness his agony. ''Sore amazed'' (ekthambeisthai — astonished, greatly disturbed; a strong word suggesting horror and dread). ''Very heavy'' (adēmonein — deeply distressed, anguished; possibly from a root meaning ''away from home,'' conveying a sense of alienation and desolation). Mark''s language is the most vivid of any Gospel — Jesus experiences genuine psychological trauma.',
   NULL),
  (34, 'And saith unto them, My soul is exceeding sorrowful unto death: tarry ye here, and watch.',
   'καὶ λέγει αὐτοῖς περίλυπός ἐστιν ἡ ψυχή μου ἕως θανάτου μείνατε ὧδε καὶ γρηγορεῖτε',
   'kai legei autois perilypos estin hē psychē mou heōs thanatou meinate hōde kai grēgoreite',
   '''Exceeding sorrowful unto death'' (perilypos heōs thanatou — surrounded by grief to the point of death; perilypos from peri + lypē, grief on every side). Echoing Psalm 42:5-6, 11 (''Why art thou cast down, O my soul?''). ''Watch'' (grēgoreite — stay awake, the same command from 13:35, 37). Jesus is overwhelmed by sorrow — the prospect of bearing humanity''s sin and experiencing the Father''s wrath creates anguish that approaches death itself.',
   NULL),
  (35, 'And he went forward a little, and fell on the ground, and prayed that, if it were possible, the hour might pass from him.',
   'καὶ προελθὼν μικρὸν ἔπεσεν ἐπὶ τῆς γῆς καὶ προσηύχετο ἵνα εἰ δυνατόν ἐστιν παρέλθῃ ἀπ᾿ αὐτοῦ ἡ ὥρα',
   'kai proelthōn mikron epesen epi tēs gēs kai prosēucheto hina ei dynaton estin parelthē ap autou hē hōra',
   '''Fell on the ground'' (epesen epi tēs gēs — prostrate, face down). ''If it were possible'' (ei dynaton estin — if there is another way). ''The hour'' (hē hōra — the appointed time of his suffering and death; the decisive moment of redemptive history). Jesus prays for an alternative to the cross. This is not a momentary hesitation but intense, prolonged agony. The Son of God honestly confronts what lies ahead and asks if there is another way.',
   NULL),
  (36, 'And he said, Abba, Father, all things are possible unto thee; take away this cup from me: nevertheless not what I will, but what thou wilt.',
   'καὶ ἔλεγεν αββα ὁ πατήρ πάντα δυνατά σοι παρένεγκε τὸ ποτήριον τοῦτο ἀπ᾿ ἐμοῦ ἀλλ᾿ οὐ τί ἐγὼ θέλω ἀλλὰ τί σύ',
   'kai elegen abba ho patēr panta dynata soi pareneke to potērion touto ap emou all ou ti egō thelō alla ti sy',
   '''Abba'' — the Aramaic word for ''Father,'' an intimate family term (like ''Papa'' or ''Daddy''). Mark preserves the original Aramaic, showing this is how Jesus actually prayed. ''All things are possible unto thee'' — Jesus affirms the Father''s omnipotence. ''This cup'' (to potērion — the cup of divine wrath against sin; cf. Isaiah 51:17, 22; Jeremiah 25:15-16). ''Not what I will, but what thou wilt'' — the perfect model of prayer: honest desire submitted to the Father''s will.',
   'Gethsemane is one of the most theologically profound moments in the Gospels. It reveals several truths simultaneously: (1) Jesus'' full humanity — he experiences genuine terror, grief, and reluctance. (2) His voluntary submission — he could have refused the cross but chose obedience. (3) The horror of sin-bearing — what made the cross unbearable was not physical pain but bearing the guilt of humanity and experiencing the Father''s wrath. (4) The model of prayer — Jesus is honest about his desires (''take away this cup'') but submits to the Father''s will. (5) ''Abba'' reveals that even in his darkest hour, Jesus'' relationship with the Father remains intimate. The prayer does not eliminate the cup but transforms Jesus'' relationship to it: from dreaded fate to embraced mission.'),
  (37, 'And he cometh, and findeth them sleeping, and saith unto Peter, Simon, sleepest thou? couldest not thou watch one hour?',
   'καὶ ἔρχεται καὶ εὑρίσκει αὐτοὺς καθεύδοντας καὶ λέγει τῷ Πέτρῳ Σίμων καθεύδεις οὐκ ἴσχυσας μίαν ὥραν γρηγορῆσαι',
   'kai erchetai kai heuriskei autous katheudontas kai legei tō Petrō Simōn katheudeis ouk ischysas mian hōran grēgorēsai',
   '''Sleeping'' (katheudontas — sound asleep). ''Simon'' — Jesus reverts to Peter''s pre-call name, a pointed rebuke. The man who boasted he would die for Jesus cannot stay awake for one hour. ''One hour'' — such a small request in light of what Jesus is enduring. The contrast between Jesus'' agonised prayer and the disciples'' comfortable sleep is Mark''s most devastating portrait of human weakness.',
   NULL),
  (38, 'Watch ye and pray, lest ye enter into temptation. The spirit truly is ready, but the flesh is weak.',
   'γρηγορεῖτε καὶ προσεύχεσθε ἵνα μὴ εἰσέλθητε εἰς πειρασμόν τὸ μὲν πνεῦμα πρόθυμον ἡ δὲ σὰρξ ἀσθενής',
   'grēgoreite kai proseuchesthe hina mē eiselthēte eis peirasmon to men pneuma prothymon hē de sarx asthenēs',
   '''Watch and pray'' (grēgoreite kai proseuchesthe — the same pair from 13:33). ''Temptation'' (peirasmon — trial, testing). ''The spirit is ready'' (to pneuma prothymon — the human spirit is willing, eager). ''The flesh is weak'' (hē sarx asthenēs — the flesh, human nature, is feeble). Jesus acknowledges the disciples'' good intentions (their spirit wants to be faithful) but diagnoses their fundamental problem: human resolve is insufficient without prayer. This is the most concise statement of the human condition in the Gospels.',
   NULL),
  (39, 'And again he went away, and prayed, and spake the same words.',
   'καὶ πάλιν ἀπελθὼν προσηύξατο τὸν αὐτὸν λόγον εἰπών',
   'kai palin apelthōn prosēuxato ton auton logon eipōn',
   '''The same words'' (ton auton logon — the same prayer). Jesus prays the Gethsemane prayer a second time. Repetition in prayer is not ''vain repetitions'' (Matthew 6:7) when it flows from genuine need. Jesus models persistence in prayer — returning to the Father again and again with the same honest, submitted request.',
   NULL),
  (40, 'And when he returned, he found them asleep again, (for their eyes were heavy,) neither wist they what to answer him.',
   'καὶ ὑποστρέψας εὗρεν αὐτοὺς πάλιν καθεύδοντας ἦσαν γὰρ οἱ ὀφθαλμοὶ αὐτῶν καταβαρυνόμενοι καὶ οὐκ ᾔδεισαν τί αὐτῷ ἀποκριθῶσιν',
   'kai hypostrepsas heuren autous palin katheudontas ēsan gar hoi ophthalmoi autōn katabarynomenoi kai ouk ēdeisan ti autō apokrithōsin',
   '''Eyes were heavy'' (katabarynomenoi — weighed down, burdened). ''Wist not what to answer'' (ouk ēdeisan ti apokrithōsin — did not know what to say to him). The same phrase was used at the Transfiguration (9:6) — the disciples are overwhelmed, whether by glory or grief. Their shame at being caught sleeping again leaves them speechless.',
   NULL),
  (41, 'And he cometh the third time, and saith unto them, Sleep on now, and take your rest: it is enough, the hour is come; behold, the Son of man is betrayed into the hands of sinners.',
   'καὶ ἔρχεται τὸ τρίτον καὶ λέγει αὐτοῖς καθεύδετε τὸ λοιπὸν καὶ ἀναπαύεσθε ἀπέχει ἦλθεν ἡ ὥρα ἰδοὺ παραδίδοται ὁ υἱὸς τοῦ ἀνθρώπου εἰς τὰς χεῖρας τῶν ἁμαρτωλῶν',
   'kai erchetai to triton kai legei autois katheudete to loipon kai anapauesthε apechei ēlthen hē hōra idou paradidotai ho huios tou anthrōpou eis tas cheiras tōn hamartōlōn',
   '''The third time'' — the prayer vigil ends. ''Sleep on now'' — either ironic (the time for watching has passed) or compassionate (rest briefly before the ordeal). ''It is enough'' (apechei — it is finished, settled, or: the account is paid). ''The hour is come'' (ēlthen hē hōra — the decisive moment has arrived). ''Betrayed into the hands of sinners'' (paradidotai eis tas cheiras tōn hamartōlōn — present tense: the betrayal is already underway). Judas is approaching.',
   NULL),
  (42, 'Rise up, let us go; lo, he that betrayeth me is at hand.',
   'ἐγείρεσθε ἄγωμεν ἰδοὺ ὁ παραδιδούς με ἤγγικεν',
   'egeiresthe agōmen idou ho paradidous me ēngiken',
   '''Rise up, let us go'' (egeiresthe agōmen — get up, let''s go). ''Is at hand'' (ēngiken — has drawn near, is approaching). Jesus does not flee; he advances toward the betrayer. He goes out to meet his arrest. The passive victim is actually the sovereign agent — Jesus walks into the Passion with his eyes open and his will resolved.',
   NULL),
  (43, 'And immediately, while he yet spake, cometh Judas, one of the twelve, and with him a great multitude with swords and staves, from the chief priests and the scribes and the elders.',
   'καὶ εὐθέως ἔτι αὐτοῦ λαλοῦντος παραγίνεται Ἰούδας εἷς ὢν τῶν δώδεκα καὶ μετ᾿ αὐτοῦ ὄχλος πολὺς μετὰ μαχαιρῶν καὶ ξύλων παρὰ τῶν ἀρχιερέων καὶ τῶν γραμματέων καὶ τῶν πρεσβυτέρων',
   'kai eutheōs eti autou lalountos paraginetai Ioudas heis ōn tōn dōdeka kai met autou ochlos polys meta machairōn kai xylōn para tōn archierēōn kai tōn grammateōn kai tōn presbyterōn',
   '''Immediately'' (eutheōs — Mark''s characteristic word, conveying urgency). ''One of the twelve'' — repeated yet again (vv.10, 20, 43); the wound does not heal. ''Swords and staves'' (machairōn kai xylōn — swords and wooden clubs). ''Chief priests, scribes, and elders'' — the full Sanhedrin authorises this armed arrest. They come to seize the Prince of Peace with weapons of war.',
   NULL),
  (44, 'And he that betrayed him had given them a token, saying, Whomsoever I shall kiss, that same is he; take him, and lead him away safely.',
   'δεδώκει δὲ ὁ παραδιδοὺς αὐτὸν σύσσημον αὐτοῖς λέγων ὃν ἂν φιλήσω αὐτός ἐστιν κρατήσατε αὐτὸν καὶ ἀπαγάγετε ἀσφαλῶς',
   'dedōkei de ho paradidous auton syssēmon autois legōn hon an philēsō autos estin kratēsate auton kai apagagete asphalōs',
   '''Token'' (syssēmon — a prearranged signal). ''Kiss'' (philēsō — from phileō, to kiss as a sign of affection and respect). ''Safely'' (asphalōs — securely, without him escaping). The kiss — a sign of love, greeting between friends and from disciples to their rabbi — is weaponised into a signal for arrest. Judas perverts the most intimate gesture of fellowship into an instrument of betrayal.',
   NULL),
  (45, 'And as soon as he was come, he goeth straightway to him, and saith, Master, master; and kissed him.',
   'καὶ ἐλθὼν εὐθέως προσελθὼν αὐτῷ λέγει ῥαββί ῥαββί καὶ κατεφίλησεν αὐτόν',
   'kai elthōn eutheōs proselthōn autō legei rhabbi rhabbi kai katephilēsen auton',
   '''Master, master'' (rhabbi, rhabbi — Rabbi, Rabbi; the double address adds emphasis and false warmth). ''Kissed him'' (katephilēsen — kissed fervently, kissed repeatedly; the intensified form kata + phileō, suggesting an emphatic, prolonged kiss). The intensified verb makes the betrayal more grotesque: Judas does not merely peck Jesus on the cheek but kisses him with demonstrative affection — a performance of love that masks murder.',
   NULL),
  (46, 'And they laid their hands on him, and took him.',
   'οἱ δὲ ἐπέβαλον τὰς χεῖρας αὐτῶν ἐπ᾿ αὐτὸν καὶ ἐκράτησαν αὐτόν',
   'hoi de epebalon tas cheiras autōn ep auton kai ekratēsan auton',
   '''Laid their hands on him'' (epebalon tas cheiras — seized him). ''Took him'' (ekratēsan — arrested, gripped firmly). The physical seizure of Jesus. The hands that healed, blessed, and broke bread are now bound by human hands. The creator is restrained by his creatures.',
   NULL),
  (47, 'And one of them that stood by drew a sword, and smote a servant of the high priest, and cut off his ear.',
   'εἷς δέ τις τῶν παρεστηκότων σπασάμενος τὴν μάχαιραν ἔπαισεν τὸν δοῦλον τοῦ ἀρχιερέως καὶ ἀφεῖλεν αὐτοῦ τὸ ὠτίον',
   'heis de tis tōn parestēkotōn spasamenos tēn machairan epaisen ton doulon tou archiereōs kai apheilen autou to ōtion',
   '''One of them that stood by'' — Mark does not name Peter (John 18:10 does). ''Drew a sword'' (spasamenos tēn machairan). ''Cut off his ear'' (apheilen to ōtion — removed the ear, possibly the earlobe). A futile act of violence — Peter tries to fight his way out of a situation Jesus has already accepted. Luke 22:51 records that Jesus healed the ear.',
   NULL),
  (48, 'And Jesus answered and said unto them, Are ye come out, as against a thief, with swords and with staves to take me?',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν αὐτοῖς ὡς ἐπὶ λῃστὴν ἐξήλθατε μετὰ μαχαιρῶν καὶ ξύλων συλλαβεῖν με',
   'kai apokritheis ho Iēsous eipen autois hōs epi lēstēn exēlthate meta machairōn kai xylōn syllabein me',
   '''As against a thief'' (hōs epi lēstēn — as against a brigand, a dangerous criminal; the same word used in 11:17 for the ''den of thieves''). Jesus challenges the absurdity: they come armed as if to capture a violent revolutionary, when he has been teaching openly in the temple every day. The arrest is conducted in darkness because the authorities fear the people — but also because ''this is your hour, and the power of darkness'' (Luke 22:53).',
   NULL),
  (49, 'I was daily with you in the temple teaching, and ye took me not: but the scriptures must be fulfilled.',
   'καθ᾿ ἡμέραν ἤμην πρὸς ὑμᾶς ἐν τῷ ἱερῷ διδάσκων καὶ οὐκ ἐκρατήσατέ με ἀλλ᾿ ἵνα πληρωθῶσιν αἱ γραφαί',
   'kath hēmeran ēmēn pros hymas en tō hierō didaskōn kai ouk ekratēsate me all hina plērōthōsin hai graphai',
   '''Daily with you in the temple'' — Jesus was publicly accessible. The covert arrest reveals their cowardice. ''The scriptures must be fulfilled'' (hina plērōthōsin hai graphai — so that the Scriptures might be fulfilled). Jesus interprets his arrest as the fulfilment of Scripture, not as a defeat. Even in being seized, he is the theological interpreter of events.',
   NULL),
  (50, 'And they all forsook him, and fled.',
   'καὶ ἀφέντες αὐτὸν ἔφυγον πάντες',
   'kai aphentes auton ephygon pantes',
   '''All forsook him'' (aphentes auton pantes — they all left him and ran). Just as Jesus predicted (v.27): ''All ye shall be offended.'' The shepherd is struck, the sheep scatter (Zechariah 13:7). The most devastating sentence in the chapter — five words in Greek that describe the total abandonment of Jesus by every disciple. Not one remains.',
   NULL),
  (51, 'And there followed him a certain young man, having a linen cloth cast about his naked body; and the young men laid hold on him:',
   'καὶ εἷς τις νεανίσκος ἠκολούθει αὐτῷ περιβεβλημένος σινδόνα ἐπὶ γυμνοῦ καὶ κρατοῦσιν αὐτόν',
   'kai heis tis neaniskos ēkolouthei autō peribeblēmenos sindona epi gymnou kai kratousin auton',
   '''Young man'' (neaniskos — a youth). ''Linen cloth'' (sindona — fine linen; the same word used for Jesus'' burial shroud in 15:46). ''Naked body'' (epi gymnou — wearing nothing underneath). An enigmatic detail unique to Mark. Many scholars believe this is Mark himself — a cameo appearance by the author, who may have been aroused from sleep and followed Jesus from a nearby house. Others see symbolic significance: the linen shroud foreshadows Jesus'' burial.',
   NULL),
  (52, 'And he left the linen cloth, and fled from them naked.',
   'ὁ δὲ καταλιπὼν τὴν σινδόνα γυμνὸς ἔφυγεν ἀπ᾿ αὐτῶν',
   'ho de katalipōn tēn sindona gymnos ephygen ap autōn',
   '''Fled naked'' (gymnos ephygen — ran away stripped). The young man abandons his only garment to escape. This vivid, seemingly pointless detail may serve a theological purpose: total abandonment of Jesus is so complete that even a bystander flees, leaving behind the very clothes on his body. The nakedness echoes Adam''s shame in Genesis 3:7-10.',
   NULL),
  (53, 'And they led Jesus away to the high priest: and with him were assembled all the chief priests and the elders and the scribes.',
   'καὶ ἀπήγαγον τὸν Ἰησοῦν πρὸς τὸν ἀρχιερέα καὶ συνέρχονται αὐτῷ πάντες οἱ ἀρχιερεῖς καὶ οἱ πρεσβύτεροι καὶ οἱ γραμματεῖς',
   'kai apēgagon ton Iēsoun pros ton archierea kai synerchontai autō pantes hoi archiereis kai hoi presbyteroi kai hoi grammateis',
   '''The high priest'' — Caiaphas (AD 18-36; John 18:13-14 mentions a preliminary hearing before Annas). ''All the chief priests, elders, and scribes'' — the full Sanhedrin convenes for a night trial. This was irregular: Jewish law required trials during daytime, in the temple precincts, not at the high priest''s private residence. The proceedings are rushed and procedurally flawed, driven by the need to have Jesus executed before Passover celebrations end.',
   NULL),
  (54, 'And Peter followed him afar off, even into the palace of the high priest: and he sat with the servants, and warmed himself at the fire.',
   'καὶ ὁ Πέτρος ἀπὸ μακρόθεν ἠκολούθησεν αὐτῷ ἕως ἔσω εἰς τὴν αὐλὴν τοῦ ἀρχιερέως καὶ ἦν συγκαθήμενος μετὰ τῶν ὑπηρετῶν καὶ θερμαινόμενος πρὸς τὸ φῶς',
   'kai ho Petros apo makrothen ēkolouthēsen autō heōs esō eis tēn aulēn tou archiereōs kai ēn synkathēmenos meta tōn hypēretōn kai thermainomenos pros to phōs',
   '''Afar off'' (apo makrothen — from a distance). ''Palace'' (aulēn — courtyard of the high priest''s compound). ''Sat with the servants'' (synkathēmenos meta tōn hypēretōn — sitting alongside the temple officers). ''Warmed himself at the fire'' (thermainomenos pros to phōs — warming himself by the light/fire). Mark sets up the intercutting between the trial upstairs and Peter''s denial downstairs. Peter follows — which shows courage — but at a distance — which shows fear.',
   NULL),
  (55, 'And the chief priests and all the council sought for witness against Jesus to put him to death; and found none.',
   'οἱ δὲ ἀρχιερεῖς καὶ ὅλον τὸ συνέδριον ἐζήτουν κατὰ τοῦ Ἰησοῦ μαρτυρίαν εἰς τὸ θανατῶσαι αὐτόν καὶ οὐχ ηὕρισκον',
   'hoi de archiereis kai holon to synedrion ezētoun kata tou Iēsou martyrian eis to thanatōsai auton kai ouch hēuriskon',
   '''All the council'' (holon to synedrion — the whole Sanhedrin). ''Sought for witness'' (ezētoun martyrian — kept looking for testimony). ''Found none'' — despite their efforts, they cannot find credible witnesses. The trial is a predetermined verdict searching for evidence. The Sanhedrin has already decided on death; they need testimony to justify it. Their failure exposes the injustice of the proceedings.',
   NULL),
  (56, 'For many bare false witness against him, but their witness agreed not together.',
   'πολλοὶ γὰρ ἐψευδομαρτύρουν κατ᾿ αὐτοῦ καὶ ἴσαι αἱ μαρτυρίαι οὐκ ἦσαν',
   'polloi gar epseudomartyroun kat autou kai isai hai martyriai ouk ēsan',
   '''False witness'' (epseudomartyroun — testified falsely). ''Agreed not together'' (isai ouk ēsan — were not consistent, did not match). Jewish law required two or three witnesses whose testimony agreed (Deuteronomy 17:6; 19:15). The false witnesses contradict each other, making their testimony inadmissible. Even a rigged trial cannot produce consistent lies about Jesus.',
   NULL),
  (57, 'And there arose certain, and bare false witness against him, saying,',
   'καί τινες ἀναστάντες ἐψευδομαρτύρουν κατ᾿ αὐτοῦ λέγοντες',
   'kai tines anastantes epseudomartyroun kat autou legontes',
   'A new group of witnesses comes forward with a specific charge, one that is closer to what Jesus actually said but still distorted.',
   NULL),
  (58, 'We heard him say, I will destroy this temple that is made with hands, and within three days I will build another made without hands.',
   'ἡμεῖς ἠκούσαμεν αὐτοῦ λέγοντος ὅτι ἐγὼ καταλύσω τὸν ναὸν τοῦτον τὸν χειροποίητον καὶ διὰ τριῶν ἡμερῶν ἄλλον ἀχειροποίητον οἰκοδομήσω',
   'hēmeis ēkousamen autou legontos hoti egō katalysō ton naon touton ton cheiropoiēton kai dia triōn hēmerōn allon acheiropoiēton oikodomēsō',
   '''Made with hands... without hands'' (cheiropoiēton... acheiropoiēton — human-made vs. not-made-by-human-hands). This distorts John 2:19 (''Destroy this temple, and in three days I will raise it up''). Jesus spoke of his body, not the physical temple. The witnesses twist a prophecy about his resurrection into a threat against the temple. Yet there is irony: Jesus'' body is indeed the new temple ''not made with hands,'' and his resurrection on the third day will prove it.',
   NULL),
  (59, 'But neither so did their witness agree together.',
   'καὶ οὐδὲ οὕτως ἴση ἦν ἡ μαρτυρία αὐτῶν',
   'kai oude houtōs isē ēn hē martyria autōn',
   'Even this closer-to-the-truth testimony fails the consistency test. The witnesses cannot agree on details. The judicial system, despite its corruption, still requires agreement — and even fabricated testimony crumbles when the truth resists distortion.',
   NULL),
  (60, 'And the high priest stood up in the midst, and asked Jesus, saying, Answerest thou nothing? what is it which these witness against thee?',
   'καὶ ἀναστὰς ὁ ἀρχιερεὺς εἰς μέσον ἐπηρώτησεν τὸν Ἰησοῦν λέγων οὐκ ἀποκρίνῃ οὐδέν τί οὗτοί σου καταμαρτυροῦσιν',
   'kai anastas ho archiereus eis meson epērōtēsen ton Iēsoun legōn ouk apokrinē ouden ti houtoi sou katamartyrosin',
   '''Stood up'' (anastas — rose dramatically). ''Answerest thou nothing?'' — frustration at Jesus'' silence. The high priest is desperate: the witnesses have failed, and Jesus refuses to help the prosecution. His silence fulfils Isaiah 53:7: ''He was oppressed, and he was afflicted, yet he opened not his mouth.'' The accused is more composed than the judge.',
   NULL),
  (61, 'But he held his peace, and answered nothing. Again the high priest asked him, and said unto him, Art thou the Christ, the Son of the Blessed?',
   'ὁ δὲ ἐσιώπα καὶ οὐκ ἀπεκρίνατο οὐδέν πάλιν ὁ ἀρχιερεὺς ἐπηρώτα αὐτὸν καὶ λέγει αὐτῷ σὺ εἶ ὁ Χριστὸς ὁ υἱὸς τοῦ εὐλογητοῦ',
   'ho de esiōpa kai ouk apekrinato ouden palin ho archiereus epērōta auton kai legei autō sy ei ho Christos ho huios tou eulogētou',
   '''Held his peace'' (esiōpa — remained silent, kept quiet). ''Art thou the Christ?'' (sy ei ho Christos — are you the Messiah?). ''Son of the Blessed'' (huios tou eulogētou — Son of God; ''the Blessed'' is a reverential circumlocution for God, avoiding the divine name). The high priest abandons the failed witnesses and asks the direct question. This is the central question of the trial and of Mark''s entire Gospel: Is Jesus the Christ, the Son of God?',
   NULL),
  (62, 'And Jesus said, I am: and ye shall see the Son of man sitting on the right hand of power, and coming in the clouds of heaven.',
   'ὁ δὲ Ἰησοῦς εἶπεν ἐγώ εἰμι καὶ ὄψεσθε τὸν υἱὸν τοῦ ἀνθρώπου ἐκ δεξιῶν καθήμενον τῆς δυνάμεως καὶ ἐρχόμενον μετὰ τῶν νεφελῶν τοῦ οὐρανοῦ',
   'ho de Iēsous eipen egō eimi kai opsesthe ton huion tou anthrōpou ek dexiōn kathēmenon tēs dynameōs kai erchomenon meta tōn nephelōn tou ouranou',
   '''I am'' (egō eimi — the divine self-identification, echoing Exodus 3:14). ''Sitting on the right hand of power'' — quoting Psalm 110:1, the text Jesus used in 12:36 to show the Messiah is David''s Lord. ''Coming in the clouds of heaven'' — quoting Daniel 7:13, the Son of Man''s enthronement vision. Jesus combines two of the most exalted OT texts to declare his identity. To the Sanhedrin, this is blasphemy; to Mark''s readers, it is the climactic revelation of who Jesus is.',
   'This is the christological climax of Mark''s Gospel. At the moment of greatest humiliation — bound, beaten, on trial for his life — Jesus makes his most explicit self-declaration. ''I am'' (egō eimi) is an unambiguous affirmation of messiahship and possibly an echo of the divine name (Exodus 3:14). The combination of Psalm 110:1 (''sit at my right hand'') and Daniel 7:13 (''coming in the clouds'') identifies Jesus as both the enthroned Messiah-King and the cosmic Son of Man who receives eternal dominion. The prisoner before the Sanhedrin will become the judge of all; the accused will become the sovereign. The roles will be reversed: ''ye shall see'' — the very men condemning him will witness his vindication.'),
  (63, 'Then the high priest rent his clothes, and saith, What need we any further witnesses?',
   'ὁ δὲ ἀρχιερεὺς διαρρήξας τοὺς χιτῶνας αὐτοῦ λέγει τί ἔτι χρείαν ἔχομεν μαρτύρων',
   'ho de archiereus diarrēxas tous chitōnas autou legei ti eti chreian echomen martyrōn',
   '''Rent his clothes'' (diarrēxas tous chitōnas — tore his garments; the prescribed response to hearing blasphemy, from Mishnah Sanhedrin 7:5). Ironically, Leviticus 21:10 prohibited the high priest from tearing his garments. By tearing his clothes, Caiaphas may be symbolically disqualifying himself from the high priesthood — the old covenant priesthood destroys itself in the act of condemning the true High Priest.',
   NULL),
  (64, 'Ye have heard the blasphemy: what think ye? And they all condemned him to be guilty of death.',
   'ἠκούσατε τῆς βλασφημίας τί ὑμῖν φαίνεται οἱ δὲ πάντες κατέκριναν αὐτὸν ἔνοχον εἶναι θανάτου',
   'ēkousate tēs blasphēmias ti hymin phainetai hoi de pantes katekrinan auton enochon einai thanatou',
   '''Blasphemy'' (blasphēmias — speaking against God, claiming divine prerogatives). ''Condemned'' (katekrinan — pronounced guilty). ''Guilty of death'' (enochon thanatou — deserving the death penalty). The verdict is unanimous. From the Sanhedrin''s perspective, Jesus has claimed to be the Son of God, the cosmic Son of Man, and the enthroned Messiah — either the most blasphemous statement in history, or the truth. They choose blasphemy. There is no middle ground: Jesus is either who he says he is, or he is a blasphemer.',
   NULL),
  (65, 'And some began to spit on him, and to cover his face, and to buffet him, and to say unto him, Prophesy: and the servants did strike him with the palms of their hands.',
   'καὶ ἤρξαντό τινες ἐμπτύειν αὐτῷ καὶ περικαλύπτειν τὸ πρόσωπον αὐτοῦ καὶ κολαφίζειν αὐτὸν καὶ λέγειν αὐτῷ προφήτευσον καὶ οἱ ὑπηρέται ῥαπίσμασιν αὐτὸν ἔβαλλον',
   'kai ērxanto tines emptyein autō kai perikalyptein to prosōpon autou kai kolaphizein auton kai legein autō prophēteuson kai hoi hypēretai rhapismasin auton eballon',
   '''Spit on him'' (emptyein — to spit upon; a sign of extreme contempt). ''Cover his face'' (perikalyptein — blindfold). ''Buffet'' (kolaphizein — strike with the fist). ''Prophesy!'' — they mock his prophetic claims by blindfolding him and demanding he identify who hit him. ''Strike him with the palms'' (rhapismasin — slaps). The irony is staggering: at this very moment, downstairs in the courtyard, Jesus'' prophecy about Peter (v.30) is being fulfilled with exact precision. He is prophesying — and they are proving it.',
   NULL),
  (66, 'And as Peter was beneath in the palace, there cometh one of the maids of the high priest:',
   'καὶ ὄντος τοῦ Πέτρου κάτω ἐν τῇ αὐλῇ ἔρχεται μία τῶν παιδισκῶν τοῦ ἀρχιερέως',
   'kai ontos tou Petrou katō en tē aulē erchetai mia tōn paidiskōn tou archiereōs',
   '''Beneath in the palace'' (katō en tē aulē — below in the courtyard). ''One of the maids'' (mia tōn paidiskōn — a servant girl). Mark intercuts between the trial above and Peter''s denial below. While Jesus boldly confesses his identity before the Sanhedrin, Peter will deny it before a servant girl. The contrast is devastating.',
   NULL),
  (67, 'And when she saw Peter warming himself, she looked upon him, and said, And thou also wast with Jesus of Nazareth.',
   'καὶ ἰδοῦσα τὸν Πέτρον θερμαινόμενον ἐμβλέψασα αὐτῷ λέγει καὶ σὺ μετὰ τοῦ Ναζαρηνοῦ ἦσθα τοῦ Ἰησοῦ',
   'kai idousa ton Petron thermainomenon emblepsasa autō legei kai sy meta tou Nazarēnou ēstha tou Iēsou',
   '''Warming himself'' (thermainomenon — the detail from v.54 is repeated, anchoring the scene). ''Looked upon him'' (emblepsasa — looked intently, gazed at him). ''Jesus of Nazareth'' (tou Nazarēnou Iēsou — Jesus the Nazarene). A maid''s casual observation begins Peter''s unravelling. She recognises him — perhaps from the temple courts where Jesus taught.',
   NULL),
  (68, 'But he denied, saying, I know not, neither understand I what thou sayest. And he went out into the porch; and the cock crew.',
   'ὁ δὲ ἠρνήσατο λέγων οὐκ οἶδα οὐδὲ ἐπίσταμαι τί σὺ λέγεις καὶ ἐξῆλθεν ἔξω εἰς τὸ προαύλιον καὶ ἀλέκτωρ ἐφώνησεν',
   'ho de ērnēsato legōn ouk oida oude epistamai ti sy legeis kai exēlthen exō eis to proaulion kai alektōr ephōnēsen',
   '''Denied'' (ērnēsato — disowned, disavowed). ''I know not, neither understand'' — Peter uses two verbs of ignorance, creating emphatic distance from Jesus. ''The cock crew'' — the first crowing. Mark alone records two crowings (v.30). The first crow is a warning Peter does not heed. Peter retreats to the porch — moving physically away from the fire, away from danger, but also away from the place where Jesus is being tried.',
   NULL),
  (69, 'And a maid saw him again, and began to say to them that stood by, This is one of them.',
   'καὶ ἡ παιδίσκη ἰδοῦσα αὐτὸν πάλιν ἤρξατο λέγειν τοῖς παρεστηκόσιν ὅτι οὗτος ἐξ αὐτῶν ἐστιν',
   'kai hē paidiskē idousa auton palin ērxato legein tois parestēkosin hoti houtos ex autōn estin',
   '''A maid'' — the same servant girl (or another, Matthew 26:71). ''One of them'' (ex autōn — one of that group, a follower of Jesus). The accusation spreads from a private comment to a public declaration. The circle of witnesses is widening, increasing the pressure on Peter.',
   NULL),
  (70, 'And he denied it again. And a little after, they that stood by said again to Peter, Surely thou art one of them: for thou art a Galilaean, and thy speech agreeth thereto.',
   'ὁ δὲ πάλιν ἠρνεῖτο καὶ μετὰ μικρὸν πάλιν οἱ παρεστῶτες ἔλεγον τῷ Πέτρῳ ἀληθῶς ἐξ αὐτῶν εἶ καὶ γὰρ Γαλιλαῖος εἶ καὶ ἡ λαλιά σου ὁμοιάζει',
   'ho de palin ērneito kai meta mikron palin hoi parestōtes elegon tō Petrō alēthōs ex autōn ei kai gar Galilaios ei kai hē lalia sou homoiazei',
   '''Denied it again'' (ērneito — kept denying; imperfect tense: repeated, ongoing denial). ''A Galilaean'' (Galilaios — his accent betrayed his origin; Galilean Aramaic was distinct from Judean). ''Thy speech agreeth'' — Peter cannot hide his identity; his very voice identifies him as a follower from Galilee. The bystanders are now certain.',
   NULL),
  (71, 'But he began to curse and to swear, saying, I know not this man of whom ye speak.',
   'ὁ δὲ ἤρξατο ἀναθεματίζειν καὶ ὀμνύειν ὅτι οὐκ οἶδα τὸν ἄνθρωπον τοῦτον ὃν λέγετε',
   'ho de ērxato anathematizein kai omnyein hoti ouk oida ton anthrōpon touton hon legete',
   '''Curse'' (anathematizein — to place under a curse, to invoke a divine oath; Peter calls down curses, possibly upon himself, if he is lying). ''Swear'' (omnyein — to take an oath). ''I know not this man'' (ouk oida ton anthrōpon touton — I do not know this person). Peter''s denial escalates: from evasion (v.68) to flat denial (v.70) to cursing and oath-taking (v.71). ''This man'' — Peter cannot bring himself to say Jesus'' name. The man who confessed ''Thou art the Christ'' (8:29) now says ''I don''t know him.''',
   NULL),
  (72, 'And the second time the cock crew. And Peter called to mind the word that Jesus said unto him, Before the cock crow twice, thou shalt deny me thrice. And when he thought thereon, he wept.',
   'καὶ ἐκ δευτέρου ἀλέκτωρ ἐφώνησεν καὶ ἀνεμνήσθη ὁ Πέτρος τὸ ῥῆμα ὡς εἶπεν αὐτῷ ὁ Ἰησοῦς ὅτι πρὶν ἀλέκτορα φωνῆσαι δὶς τρίς με ἀπαρνήσῃ καὶ ἐπιβαλὼν ἔκλαιεν',
   'kai ek deuterou alektōr ephōnēsen kai anemnēsthē ho Petros to rhēma hōs eipen autō ho Iēsous hoti prin alektora phōnēsai dis tris me aparnēsē kai epibalōn eklaien',
   '''The second time the cock crew'' — Jesus'' prophecy fulfilled to the letter (v.30). ''Called to mind'' (anemnēsthē — remembered). ''The word'' (to rhēma — the specific saying). ''He wept'' (epibalōn eklaien — having thrown himself [upon it], he began to weep; or having begun, he kept weeping; the imperfect tense suggests prolonged, bitter crying). Peter remembers Jesus'' prediction at the exact moment it is fulfilled. The rooster becomes the voice of prophetic truth.',
   'Peter''s denial and weeping are among the most psychologically realistic moments in the Gospels. The three denials escalate from evasion to emphatic rejection to cursing and swearing — a progressive collapse of courage under pressure. The rooster''s crow triggers sudden, devastating self-awareness. Peter remembers Jesus'' words and realises that Jesus knew him better than he knew himself. His weeping is the beginning of repentance — the ''godly sorrow'' that ''worketh repentance to salvation'' (2 Corinthians 7:10). The story''s preservation in Mark (believed to be based on Peter''s own testimony) suggests that Peter himself insisted on telling it: the gospel includes the apostle''s worst failure because it demonstrates the depth of grace that restored him (cf. John 21:15-17).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 14;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 spikenard
  ('νάρδος πιστική', 'nardos pistikē', 'G3487/G4101', 'Pure spikenard — nardos (nard, spikenard; an aromatic plant from the Himalayas, Nardostachys jatamansi) + pistikē (genuine, authentic, pure; possibly from pistos, faithful/trustworthy, or from pistikē meaning ''drinkable/liquid''). The costliest perfume available in the ancient world, worth 300 denarii — nearly a year''s wages. The woman pours it all out at once, breaking the flask so nothing can be held back. The extravagance of her gift mirrors the extravagance of Jesus'' self-giving on the cross.', 1),
  -- v.22 body
  ('σῶμα', 'sōma', 'G4983', 'Body — the physical body, the whole person in their embodied existence. ''This is my body'' (touto estin to sōma mou) transforms the Passover bread into a sign of Jesus'' incarnate self given in sacrifice. The body is not incidental to salvation — God saves through incarnation, through a real body broken on a real cross. The bread represents the totality of Jesus'' person offered for his people. Every celebration of the Lord''s Supper re-presents this truth.', 2),
  -- v.24 new covenant
  ('διαθήκη', 'diathēkē', 'G1242', 'Covenant, testament — from diatithēmi (to arrange, to dispose). In Greek, diathēkē can mean either a covenant (a bilateral agreement) or a testament/will (a unilateral disposition). The ''new covenant'' (kainē diathēkē) fulfils Jeremiah 31:31-34: God will write his law on hearts, forgive sins, and establish an unbreakable relationship with his people. The old covenant was ratified with animal blood (Exodus 24:8); the new covenant is ratified with Jesus'' own blood — a costlier, more effective, and permanent covenant.', 3),
  -- v.36 cup
  ('ποτήριον', 'potērion', 'G4221', 'Cup — in the OT, the ''cup'' is a consistent metaphor for God''s wrath and judgment poured out upon sin (Isaiah 51:17, 22; Jeremiah 25:15-16; Ezekiel 23:31-34; Psalm 75:8). When Jesus prays ''take away this cup,'' he asks to be spared not merely physical suffering but the experience of bearing divine wrath against human sin. The cup represents the concentrated judgment of God that Jesus will drink on behalf of humanity. His willingness to drink it is the heart of the atonement.', 4),
  -- v.36 Abba
  ('ἀββά', 'abba', 'G5', 'Abba — an Aramaic word meaning ''father,'' used as a familiar, intimate address (comparable to ''Papa'' or ''Daddy''). Jesus uses this term for God even in his darkest hour, revealing the intimacy of his relationship with the Father. The early church adopted this term for their own prayers (Romans 8:15; Galatians 4:6), signalling that through Christ, believers enter the same intimate relationship with God that Jesus himself enjoys. Abba is not childish irreverence but the deepest form of trust — a child''s confidence in a loving father.', 5),
  -- v.44 kiss
  ('φιλέω', 'phileō', 'G5368', 'To kiss, to show affection, to love with warm personal attachment — from philos (friend, one who is dear). The intensified form kataphileō (v.45) means to kiss fervently or repeatedly. A disciple''s kiss of greeting for his rabbi was a sign of honour, respect, and affection. Judas weaponises this intimate gesture into a signal for arrest. The perversion of a sign of love into an instrument of betrayal makes Judas''s act the paradigm of treachery — the closer the relationship, the deeper the wound.', 6),
  -- v.62 I am (ego eimi)
  ('ἐγώ εἰμι', 'egō eimi', 'G1473/G1510', 'I am — the divine self-identification. In the LXX, egō eimi translates the Hebrew ''ani hu'' (''I am he'') used by God as a self-designation (Isaiah 43:10; 45:18; 46:4). When Jesus answers the high priest with ''egō eimi'' (I am), he affirms not only his messiahship but echoes the divine name revealed at the burning bush (Exodus 3:14, ehyeh asher ehyeh, ''I AM THAT I AM''). The high priest understands the claim: Jesus is not merely claiming to be the Messiah but claiming a share in the divine identity. This is why the response is immediate: ''blasphemy!''', 7),
  -- v.72 deny
  ('ἀπαρνέομαι', 'aparneomai', 'G533', 'To deny, disown, repudiate — from apo (away from) + arneomai (to deny, to refuse). A compound verb intensifying simple denial into active disowning. Peter does not merely fail to mention Jesus — he actively, vehemently repudiates any connection. The threefold denial (tris, three times) creates a devastating parallel with Peter''s threefold restoration in John 21:15-17, where Jesus three times asks ''Lovest thou me?'' — healing the triple wound with a triple commission. Denial is not the end of the story; grace restores what failure destroys.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 14
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 22
    WHEN 3 THEN 24
    WHEN 4 THEN 36
    WHEN 5 THEN 36
    WHEN 6 THEN 44
    WHEN 7 THEN 62
    WHEN 8 THEN 72
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 Passover plot
  (1, 'Matthew 26:1-5', 1),
  (1, 'Luke 22:1-2', 2),
  -- v.3 anointing at Bethany
  (3, 'Matthew 26:6-13', 3),
  (3, 'John 12:1-8', 4),
  (3, '1 Samuel 16:13', 5),
  -- v.9 memorial worldwide
  (9, 'Matthew 26:13', 6),
  -- v.10 Judas betrayal
  (10, 'Matthew 26:14-16', 7),
  (10, 'Luke 22:3-6', 8),
  -- v.12 Passover preparation
  (12, 'Exodus 12:1-14', 9),
  (12, 'Matthew 26:17-19', 10),
  -- v.18 one shall betray
  (18, 'Psalm 41:9', 11),
  (18, 'John 13:21-26', 12),
  -- v.22 this is my body
  (22, 'Matthew 26:26', 13),
  (22, 'Luke 22:19', 14),
  (22, '1 Corinthians 11:23-24', 15),
  -- v.24 blood of new covenant
  (24, 'Exodus 24:8', 16),
  (24, 'Jeremiah 31:31-34', 17),
  (24, 'Hebrews 9:15-22', 18),
  (24, 'Isaiah 53:12', 19),
  -- v.27 smite the shepherd
  (27, 'Zechariah 13:7', 20),
  (27, 'Matthew 26:31', 21),
  -- v.30 Peter denial predicted
  (30, 'Matthew 26:34', 22),
  (30, 'Luke 22:34', 23),
  (30, 'John 13:38', 24),
  -- v.36 Gethsemane prayer
  (36, 'Matthew 26:39', 25),
  (36, 'Luke 22:42', 26),
  (36, 'Hebrews 5:7-8', 27),
  (36, 'Romans 8:15', 28),
  -- v.38 spirit willing flesh weak
  (38, 'Romans 7:18-25', 29),
  (38, 'Galatians 5:17', 30),
  -- v.49 scriptures fulfilled
  (49, 'Isaiah 53:7-12', 31),
  (49, 'Psalm 22:1-18', 32),
  -- v.58 destroy this temple
  (58, 'John 2:19-21', 33),
  -- v.61 art thou the Christ
  (61, 'Matthew 26:63-64', 34),
  (61, 'Luke 22:67-70', 35),
  -- v.62 I am / Son of Man
  (62, 'Psalm 110:1', 36),
  (62, 'Daniel 7:13-14', 37),
  (62, 'Exodus 3:14', 38),
  -- v.65 spit and buffet
  (65, 'Isaiah 50:6', 39),
  (65, 'Isaiah 53:3', 40),
  -- v.72 Peter weeps
  (72, 'Matthew 26:75', 41),
  (72, 'Luke 22:61-62', 42),
  (72, 'John 21:15-17', 43),
  (72, '2 Corinthians 7:10', 44)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 14
  AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 14 — BACKFILL (additional word_studies + cross_references)
-- Anointing · Last Supper · Gethsemane · Arrest · Sanhedrin Trial · Peter''s Denial
-- (Mark''s longest chapter, 72v — richest backfill of session)
-- ═══════════════════════════════════════════════════

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'τὸ πάσχα καὶ τὰ ἄζυμα', 'to pascha kai ta azyma', 'G3957/G106', 'The Passover and the Unleavened Bread — two festivals merged in 1st-c usage. Passover proper was Nisan 14 (the lamb slain at twilight); the seven-day Feast of Unleavened Bread followed (Nisan 15-21). Mark''s ''after two days'' places the plot at Nisan 12, with crucifixion approaching on Nisan 14.', 100),
  (1, 'ἐν δόλῳ', 'en dolō', 'G1388', 'By craft, deceit, treachery — the leaders eschew open arrest because of the festival crowd''s sympathy with Jesus. Their stealth requires an inside accomplice; Judas''s offer (vv.10-11) becomes the providential answer to their tactical problem.', 101),
  (2, 'μήποτε ἔσται θόρυβος τοῦ λαοῦ', 'mēpote estai thorubos tou laou', 'G3379/G2351/G2992', 'Lest there be an uproar of the people — thorubos: tumult, riot. The leaders fear messianic-pilgrim violence at Passover (200,000+ pilgrims thronged Jerusalem). They want a quiet arrest, but God''s timing aligns the death with the lamb-slaughter — they will get neither timing nor secrecy.', 102),
  (3, 'ἀλάβαστρον', 'alabastron', 'G211', 'Alabaster flask — translucent stone vessel with a long sealed neck (the seal was broken to use the contents and could not be resealed; the flask was effectively single-use). The flask was an heirloom; breaking it (suntripsasa) means total commitment of the contents.', 103),
  (3, 'συντρίψασα τὴν ἀλάβαστρον κατέχεεν αὐτοῦ τῆς κεφαλῆς', 'syntripsasa tēn alabastron katecheen autou tēs kephalēs', 'G4937/G2708/G2776', 'Having broken the flask, she poured it on his head — anointing the head was royal (1 Samuel 10:1; 16:13; 1 Kings 1:39). The unnamed woman performs an act of messianic anointing — perhaps unconsciously, but Mark frames her as enacting Jesus''s kingly identity.', 104),
  (4, 'ἀγανακτοῦντες', 'aganaktountes', 'G23', 'Indignant, displeased — the same verb as the disciples'' indignation at the children (10:14) and at James and John''s ambition (10:41). Mark uses it to expose disciples'' moral misjudgment: they are angry at the wrong things, blind to the real moment.', 105),
  (4, 'ἀπώλεια', 'apōleia', 'G684', 'Waste, destruction — eis ti hē apōleia hautē tou myrou gegonen (Why this waste of the ointment?) The complainers calculate cost-benefit; Jesus calculates love-honor. The ''waste'' of love is precisely its essence.', 106),
  (5, 'ἐνεβριμῶντο αὐτῇ', 'enebrimōnto autē', 'G1690', 'They scolded her sternly — embrimaomai (originally to snort like a horse, used of strong displeasure). The disciples publicly rebuke the woman; Jesus immediately defends her. The contrast exposes the disciples'' continuing failure to read the moment.', 107),
  (6, 'ἔργον καλόν', 'ergon kalon', 'G2041/G2570', 'A beautiful work — kalos: aesthetically and morally good, fine. Jesus reframes the act: not waste but beauty; not extravagance but proportion to its object. Acts of devotion to Christ have their own canon of evaluation.', 108),
  (8, 'ὃ ἔσχεν ἐποίησεν προέλαβεν μυρίσαι', 'ho eschen epoiēsen proelaben myrisai', 'G2192/G4160/G4301/G3462', 'What she had she did; she has anointed beforehand for burial — proelaben (anticipated, took beforehand). The woman alone perceives the cross; she alone honors Jesus while there is still time. Disciples preoccupied with kingdom-glory miss what she sees.', 109),
  (8, 'εἰς τὸν ἐνταφιασμόν', 'eis ton entaphiasmon', 'G1780', 'For the burial preparation — entaphiazō: to lay out for burial, including anointing the body. Jesus interprets her act prophetically: it is anticipatory burial-anointing, since after the crucifixion Joseph and the women will not have time to anoint (15:42-46; 16:1).', 110),
  (9, 'μνημόσυνον αὐτῆς', 'mnēmosynon autēs', 'G3422', 'A memorial of her — mnēmosynon: a remembrance, that which keeps memory alive. Jesus binds her gesture to the worldwide proclamation of the gospel (eis holon ton kosmon). Wherever the gospel is preached, this woman will be remembered — extraordinary canonical promise.', 111),
  (10, 'ἵνα παραδῷ αὐτὸν αὐτοῖς', 'hina paradō auton autois', 'G3860', 'That he might betray him to them — paradidōmi (deliver up). The same verb of God''s delivering Jesus up (Romans 4:25; 8:32) and of Jesus''s self-giving (Galatians 2:20). Judas''s human paradosis is enfolded in God''s redemptive paradosis: the same act, two levels.', 112),
  (11, 'ἐχάρησαν', 'echarēsan', 'G5463', 'They rejoiced — aorist passive of chairō. Mark''s grim irony: the chief priests have just learned Jesus must be killed by craft, then Judas appears and they ''rejoice.'' Joy at evil''s opportunity exposes the moral inversion of the religious leadership.', 113),
  (12, 'ἔθυον τὸ πάσχα', 'ethyon to pascha', 'G2380', 'They were sacrificing the Passover — thuō: to slay sacrificially. Lambs were brought to the temple between 3-5pm on Nisan 14 and slaughtered by their owners with priestly assistance. Mark notes the day with cultic precision.', 114),
  (13, 'κεράμιον ὕδατος', 'keramion hydatos', 'G2765', 'A jar of water — water-jars were normally carried by women; a man with a water-jar would stand out in the crowd. The unusual sight is the agreed signal. Jesus''s arrangement is again precise (cf. 11:2-6) — sovereign control of the practical details.', 115),
  (14, 'κατάλυμά μου', 'katalyma mou', 'G2646', 'My guest-room — katalyma: lodging place; the same noun used in Luke 2:7 (no room in the inn). The Lord claims a room as ''mine'' (mou) without prior negotiation; the householder''s readiness suggests prior arrangement or instant submission to the Master''s claim.', 116),
  (15, 'ἀνάγαιον μέγα ἐστρωμένον ἕτοιμον', 'anagaion mega estrōmenon hetoimon', 'G508/G3173/G4766/G2092', 'A large upper room, furnished and ready — estrōmenon: spread (with cushioned dining couches for reclining). Mark''s detail: the room is already prepared. The Last Supper takes place in a setting both grand (mega) and ready (hetoimon).', 117),
  (17, 'ὀψίας γενομένης', 'opsias genomenēs', 'G3798', 'When evening had come — Passover meal was eaten at night (Exodus 12:8) after sundown began Nisan 15. The chronology accelerates: by midnight Jesus will be in Gethsemane; by 3am Peter will have denied him; by sunrise he will face Pilate.', 118),
  (18, 'εἷς ἐξ ὑμῶν παραδώσει με ὁ ἐσθίων μετ᾽ ἐμοῦ', 'heis ex hymōn paradōsei me ho esthiōn met emou', 'G1520/G3860/G2068', 'One of you shall betray me, even he who eats with me — explicit echo of Psalm 41:9 (the trusted friend who eats my bread has lifted his heel). Table-fellowship in the ancient world implied loyalty unto death; Judas''s breach is doubly heinous because it occurs at the meal.', 119),
  (19, 'εἷς κατὰ εἷς', 'heis kata heis', 'G1520', 'One by one — Mark''s vivid serial questioning. Each disciple in turn asks ''Surely not I?'' (mēti egō). The construction captures the painful round-the-table soul-searching as each disciple wonders about his own loyalty.', 120),
  (20, 'τρύβλιον', 'tryblion', 'G5165', 'Dish, bowl — communal serving bowl. ''He that dippeth with me in the dish'' (ho embaptomenos met emou eis to tryblion) does not single Judas out (all the disciples were dipping); rather, it intensifies the betrayer''s closeness — one of those most intimately sharing the meal will hand Jesus over.', 121),
  (21, 'οὐαὶ ... καλὸν αὐτῷ εἰ οὐκ ἐγεννήθη', 'ouai ... kalon autō ei ouk egennēthē', 'G3759/G2570/G1080', 'Woe ... it had been good for that man if he had not been born — ouai: prophetic lament. The double truth: the Son of Man''s death is according to scripture (necessitated by God''s plan), yet the agent of betrayal bears full personal guilt. Both sides of the providence-and-responsibility paradox stand.', 122),
  (22, 'εὐλογήσας ἔκλασεν', 'eulogēsas eklasen', 'G2127/G2806', 'Having blessed, broke — eulogeō: to bless (the standard berakah said over bread before meals). Mark''s eklasen (broke) becomes the signature word of eucharistic memory; the breaking of bread will become a synonym for the Lord''s Supper itself.', 123),
  (23, 'εὐχαριστήσας ἔδωκεν αὐτοῖς', 'eucharistēsas edōken autois', 'G2168/G1325', 'Having given thanks, he gave to them — eucharisteō becomes the word for the rite (''Eucharist''). Jesus blesses bread but gives thanks for the cup, perhaps reflecting the third Passover cup (the Cup of Blessing). All drink: Mark notes ''they all drank'' (epion ex autou pantes), grammatically including Judas (cf. Luke 22:21).', 124),
  (24, 'ἐκχυννόμενον ὑπὲρ πολλῶν', 'ekchynnomenon hyper pollōn', 'G1632/G4183', 'Poured out for many — ekchynnomai (passive): to be poured out, shed. ''For many'' echoes Isaiah 53:11-12 (the Servant''s blood for the many). Jesus interprets his death as Suffering-Servant atonement: not for a few but for ''the many,'' i.e. the multitude of those redeemed.', 125),
  (25, 'οὐκέτι οὐ μὴ πίω ... ἕως ... καινόν', 'ouketi ou mē piō ... heōs ... kainon', 'G3756/G2089/G3361/G4095/G2193/G2537', 'I will no more drink ... until ... new — emphatic abstinence vow until the messianic banquet. ''New'' (kainon) signals eschatological newness (Isaiah 25:6-8). Jesus pledges to fast from wine until he drinks it with disciples in the kingdom — the wedding-feast of the Lamb.', 126),
  (26, 'ὑμνήσαντες ἐξῆλθον', 'hymnēsantes exēlthon', 'G5214', 'Having sung a hymn, they went out — Passover meal closed with the Hallel (Psalms 113-118 or 115-118). Jesus likely sang Psalm 118 (the rejected stone, ''this is the day the LORD has made'') hours before his crucifixion — the same psalm the crowd had quoted at the Triumphal Entry.', 127),
  (27, 'σκανδαλισθήσεσθε ... πατάξω τὸν ποιμένα', 'skandalisthēsesthe ... pataxō ton poimena', 'G4624/G3960/G4166', 'You will all stumble ... I will smite the shepherd — citation of Zechariah 13:7. Jesus identifies himself as the smitten shepherd; the disciples'' coming desertion is not surprise but prophecy. Their failure is foreseen; their restoration also (v.28).', 128),
  (28, 'προάξω ὑμᾶς εἰς τὴν Γαλιλαίαν', 'proaxō hymas eis tēn Galilaian', 'G4254/G1056', 'I will go before you into Galilee — first NT reference to the post-resurrection regathering at Galilee, fulfilled in Mark 16:7. Jesus speaks of resurrection-and-meeting in the same breath as predicting their desertion: failure is anticipated, restoration is promised.', 129),
  (29, 'εἰ καὶ πάντες ... οὐκ ἐγώ', 'ei kai pantes ... ouk egō', 'G1487/G2532/G3956/G3756/G1473', 'Even if all ... yet not I — Peter''s self-distinguishing protest. The pronoun egō is emphatic. He places himself above his brothers in supposed loyalty; the very claim is the seed of his collapse. Mark exposes pride before the fall.', 130),
  (30, 'ἀλέκτορα ... δίς ... τρίς', 'alektora ... dis ... tris', 'G220/G1364/G5151', 'Cock ... twice ... three times — Mark''s unique double-cock-crow (Matthew, Luke, John have a single crow). The triple denial is bracketed by two cock-crows: the first (v.68) goes unheeded; the second (v.72) breaks Peter into bitter weeping.', 131),
  (31, 'ἐκπερισσῶς', 'ekperissōs', 'G1537/G4053', 'Vehemently, exceedingly — Mark''s rare strengthening of perissōs. Peter does not merely protest, he protests excessively. Mark linguistically marks the disproportion between Peter''s confidence and his actual capacity.', 132),
  (32, 'Γεθσημανί', 'Gethsēmani', 'G1068', 'Gethsemane — from Hebrew gat-shmanim (oil press). A walled olive-grove on the Mount of Olives. The name is symbolic: Jesus is pressed in the olive-press of agony before he is crushed in the cross.', 133),
  (33, 'ἐκθαμβεῖσθαι καὶ ἀδημονεῖν', 'ekthambeisthai kai adēmonein', 'G1568/G85', 'To be greatly amazed/distressed and to be deeply troubled — ekthambeomai: shocked, alarmed (intensified thambeō); adēmoneō: anguished, depressed almost to the point of being undone. Mark''s rare paired verbs convey emotional crisis approaching the limits of human endurance.', 134),
  (34, 'περίλυπος ἕως θανάτου', 'perilypos heōs thanatou', 'G4036/G2288', 'Exceedingly sorrowful, even unto death — peri-lypos: surrounded by grief. Echoes Psalm 42:5, 11; 43:5 (LXX hina ti perilypos ei psychē mou). Jesus quotes the lament psalms: his soul is in the same crushing grief David''s soul knew, only without sin.', 135),
  (35, 'παρέλθῃ ἀπ᾽ αὐτοῦ ἡ ὥρα', 'parelthē ap autou hē hōra', 'G3928/G5610', 'The hour might pass from him — hōra: the appointed hour (cf. John 12:27; 17:1). Jesus prays that the eschatological hour of judgment might pass; yet he submits. The Son in his humanity recoils from the cup but does not refuse it.', 136),
  (36, 'πάντα δυνατά σοι ... παρένεγκε', 'panta dynata soi ... parenenke', 'G3956/G1415/G3911', 'All things are possible for you ... take away — parapherō: bear away, remove. Jesus appeals to the Father''s omnipotence (panta dynata) — the Father could redeem without the cross. The submission ''yet not what I will'' shows the Son chooses obedience over even-the-possible alternative.', 137),
  (37, 'Σίμων καθεύδεις', 'Simōn katheudeis', 'G4613/G2518', 'Simon, are you sleeping — pointed return to the pre-discipleship name (Simōn, not Petros). The reversion underlines the failure: at the moment requiring rocklike steadfastness, Peter is sleeping. The watchman warning of 13:35-37 is being violated within hours.', 138),
  (38, 'τὸ μὲν πνεῦμα πρόθυμον ἡ δὲ σὰρξ ἀσθενής', 'to men pneuma prothymon hē de sarx asthenēs', 'G4151/G4289/G4561/G772', 'The spirit is willing but the flesh is weak — anthropological diagnosis: pneuma here is not the Holy Spirit but the human inner-life faculty (will, intention). The disciple''s sincere intent (prothymon) collides with the body''s exhaustion (asthenēs). Watching-and-praying is the discipline to bridge the gap.', 139),
  (40, 'καταβαρυνόμενοι', 'katabarunomenoi', 'G2599', 'Heavy weighed-down — katabarunō: weighed down with sleep. Peter''s memoir-source (Mark draws Petrine recollections) preserves the disciples'' embarrassment: they could not even keep their heads up. Compare 1 Peter 5:8 (Peter himself later urges sober watchfulness — perhaps recalling this moment).', 140),
  (41, 'ἀπέχει ... ἦλθεν ἡ ὥρα', 'apechei ... ēlthen hē hōra', 'G568/G5610', 'It is enough ... the hour has come — apechei: a notoriously difficult verb (it is far away, it is over, it is paid in full). Possibly: ''enough of this!'' or ''the matter is settled.'' Jesus moves from prayer to action: the eschatological hour has now arrived.', 141),
  (43, 'μετὰ μαχαιρῶν καὶ ξύλων', 'meta machairōn kai xylōn', 'G3162/G3586', 'With swords and clubs — temple police armed for arrest. Jesus protests the disproportion (v.48): one would think they came against an insurrectionist (lēstēs). The arsenal exposes the leaders'' fear and their casting of Jesus as a violent revolutionary.', 142),
  (44, 'σύσσημον', 'syssēmon', 'G4953', 'Pre-arranged signal — syn + sēma. NT hapax. The kiss serves a tactical purpose: in the dim torchlight, Judas needs to identify Jesus precisely so the police seize the right man. The intimacy-gesture is weaponized into target-marking.', 143),
  (45, 'κατεφίλησεν αὐτόν', 'katephilēsen auton', 'G2705', 'He kissed him fervently — kata-phileō: intensified kiss (repeated, lingering, ostentatious; same verb of the prodigal''s welcome, Luke 15:20; the sinful woman''s feet-kissing, Luke 7:38, 45). Judas does not merely kiss; he kisses warmly, as if in deepest love. Mark''s vocabulary maximizes the betrayal-irony.', 144),
  (47, 'ὠτάριον', 'ōtarion', 'G5621', 'Little ear, earlobe — diminutive of ous. Mark''s vivid wound-detail. John 18:10 names Peter as the swordsman and Malchus as the victim; Mark suppresses the names (pre-publication anonymity for Peter, still alive). Jesus immediately heals (Luke 22:51), undoing the disciple''s violent gesture.', 145),
  (48, 'ὡς ἐπὶ λῃστήν', 'hōs epi lēstēn', 'G3027', 'As against an insurrectionist/bandit — lēstēs: not petty thief but armed revolutionary (used by Josephus for Zealots). Jesus exposes the leaders'' calumny: he has taught daily in the temple unarmed, but they treat him as a violent rebel. The label foreshadows his death between two lēstai (15:27).', 146),
  (49, 'ἵνα πληρωθῶσιν αἱ γραφαί', 'hina plērōthōsin hai graphai', 'G2443/G4137/G1124', 'That the scriptures might be fulfilled — Mark''s only explicit fulfillment-formula in his Passion narrative. The arrest is not chaos but scripture-driven: Isaiah 53, Psalm 22, Zechariah 13 all converge on this moment. The events are read through the prophetic lens.', 147),
  (50, 'ἀφέντες αὐτὸν ἔφυγον πάντες', 'aphentes auton ephugon pantes', 'G863/G5343/G3956', 'Forsaking him, they all fled — fulfilling Zechariah 13:7 (smite the shepherd, the sheep scatter). The brutal honesty of Mark''s record: the inner circle Jesus had named, trained, and trusted abandons him in three minutes flat. Discipleship has cratered.', 148),
  (51, 'νεανίσκος ... σινδόνα ἐπὶ γυμνοῦ', 'neaniskos ... sindona epi gymnou', 'G3495/G4616/G1131', 'A young man ... a linen cloth on his bare body — Mark''s most enigmatic detail, found nowhere in the other Gospels. Many readers (since the early church) have suspected this is John Mark''s self-portrait: the evangelist''s anonymous insertion of himself, the only one besides Jesus to flee Gethsemane in flight. The sindōn (linen) anticipates Jesus''s burial cloth (15:46) and the neaniskos in linen at the empty tomb (16:5) — bookended literary motifs.', 149),
  (53, 'συνέρχονται ... ἀρχιερεῖς ... πρεσβύτεροι ... γραμματεῖς', 'synerchontai ... archiereis ... presbyteroi ... grammateis', 'G4905/G749/G4245/G1122', 'They come together ... chief priests, elders, scribes — full Sanhedrin convened (or at least quorum). Night-time capital trials were forbidden by later Mishnaic law (m. Sanhedrin 4:1); whether 1st-c practice was equally restrictive is debated. Either way, Mark portrays a procedurally suspect rush to verdict.', 150),
  (54, 'θερμαινόμενος πρὸς τὸ φῶς', 'thermainomenos pros to phōs', 'G2328/G5457', 'Warming himself at the fire/light — pre-dawn April nights at 700m elevation (Jerusalem''s) are cold. Mark''s phōs (light) makes Peter visible in the firelight — the practical reason the maid recognizes him (v.66). The light meant for warmth becomes the light of exposure.', 151),
  (55, 'ἐζήτουν κατὰ τοῦ Ἰησοῦ μαρτυρίαν', 'ezētoun kata tou Iēsou martyrian', 'G2212/G3142', 'They sought testimony against Jesus — predetermined verdict in search of evidence. Mark writes ''to put him to death'' (eis to thanatōsai auton): the trial''s outcome is fixed before the proceedings; only the legal pretext is being assembled.', 152),
  (56, 'οὐκ ἦσαν ἴσαι αἱ μαρτυρίαι', 'ouk ēsan isai hai martyriai', 'G3756/G2470/G3142', 'The testimonies did not agree — Deuteronomy 17:6 and 19:15 require multiple agreeing witnesses for capital conviction. The procedural collapse (witnesses contradicting each other) ought to have ended the trial; it does not, exposing the proceedings as predetermined.', 153),
  (58, 'χειροποίητον ... ἀχειροποίητον', 'cheiropoiēton ... acheiropoiēton', 'G5499/G886', 'Made with hands ... not made with hands — pejorative cheiropoiētos was used in OT polemic against idols (Leviticus 26:1 LXX; Isaiah 46:6). To call the Jerusalem temple cheiropoiētos was inflammatory. Acheiropoiētos (the not-made-with-hands temple) anticipates the resurrection-body / new community (cf. Hebrews 9:11; Acts 7:48; 17:24).', 154),
  (60, 'ἀναστὰς εἰς μέσον', 'anastas eis meson', 'G450/G3319', 'Standing up in the midst — the high priest rises from his judicial seat into the center of the chamber, dramatizing his frustration with Jesus''s silence and the breakdown of the witness procedure. The action signals an interrogator forced to abandon procedure and resort to direct demand.', 155),
  (61, 'ὁ Χριστὸς ὁ υἱὸς τοῦ Εὐλογητοῦ', 'ho Christos ho huios tou Eulogētou', 'G5547/G5207/G2128', 'The Christ, the Son of the Blessed — eulogētos (the Blessed One) is a Jewish circumlocution for God, avoiding the divine Name. The high priest demands a binary self-identification: are you the messianic Son of God? Jesus''s answer (v.62) breaks his own silence and becomes the formal grounds for execution.', 156),
  (63, 'διαρρήξας τοὺς χιτῶνας αὐτοῦ', 'diarrēxas tous chitōnas autou', 'G1284/G5509', 'Tearing his garments — high-priestly response to perceived blasphemy (cf. 2 Kings 18:37; Acts 14:14). Ironically, Leviticus 21:10 forbids the high priest from tearing his clothes — Caiaphas violates Torah even as he condemns the supposed Torah-violator. Symbolic of the obsolete priesthood that here judges its true successor.', 157),
  (64, 'ἔνοχον εἶναι θανάτου', 'enochon einai thanatou', 'G1777/G2288', 'Worthy of death — formal verdict. Blasphemy carried the death penalty under Leviticus 24:16. The Sanhedrin lacks Roman authority to execute (cf. John 18:31), so the verdict will be re-presented before Pilate as a different charge (treason, claim to be king).', 158),
  (65, 'ἐνέπτυον ... κολαφίζειν ... ῥαπίσμασιν', 'eneptyon ... kolaphizein ... rhapismasin', 'G1716/G2852/G4475', 'Spit upon ... buffet ... blows — three vivid abuse-verbs. Spitting was the gravest social insult (Numbers 12:14; Deuteronomy 25:9); kolaphizō (blow with the fist); rhapizō (slap, strike with rod). All fulfill Isaiah 50:6 (the Servant gives his cheeks to those who pluck out the hair).', 159),
  (66, 'παιδίσκη', 'paidiskē', 'G3814', 'Servant girl — diminutive; a young female slave or maid of the high priest''s household. The bottom of the social ladder confronts the rock-apostle with a mere question, and he crumbles. Mark deliberately maximizes the disproportion: a girl, a question, and Peter folds.', 160),
  (68, 'οὔτε οἶδα οὔτε ἐπίσταμαι', 'oute oida oute epistamai', 'G3756/G1492/G1987', 'I neither know nor understand — double denial. Peter not only disclaims relationship (oida: knowing-by-acquaintance) but also disclaims comprehension (epistamai: knowing-by-understanding). He flees into pretended bewilderment.', 161),
  (70, 'καὶ γὰρ Γαλιλαῖος εἶ', 'kai gar Galilaios ei', 'G1056', 'For you are also a Galilean — Galilean Aramaic dialect was distinguishable from Judean (cf. Matthew 26:73 spelling out ''thy speech bewrays thee''). Peter''s accent gives him away. He cannot disguise his origin; provincialism unmasks him.', 162),
  (71, 'ἀναθεματίζειν καὶ ὀμνύειν', 'anathematizein kai omnyein', 'G332/G3660', 'To curse and to swear — anathematizō: to invoke a curse upon oneself if speaking falsely; omnuō: to take an oath. Peter compounds his denial with self-curse and divine-witness oath. The escalation parallels his earlier ekperissōs (v.31) — the bigger the boast, the bigger the betrayal.', 163),
  (72, 'ἀλέκτωρ ἐφώνησεν ἐκ δευτέρου', 'alektōr ephōnēsen ek deuterou', 'G220/G5455/G1208', 'A cock crew the second time — Mark''s unique double-crow notation. Alektorophōnia (cockcrow) was the third Roman watch (12-3am); two crows together pin the hour as roughly 3am. Peter''s denial trilogy unfolds in the dead of night — the spiritual midnight of the church.', 164),
  (72, 'ἐπιβαλὼν ἔκλαιεν', 'epibalōn eklaien', 'G1911/G2799', 'Casting himself / having begun, he wept — epiballō here is famously obscure: ''having thought of it,'' ''bursting in upon'' (the realization), ''covering his face,'' or ''flinging himself out.'' The imperfect eklaien indicates sustained weeping; whatever the gesture, Peter''s collapse into tears is total.', 165),
  (3, 'πιστικῆς πολυτελοῦς', 'pistikēs polyteloūs', 'G4101/G4185', 'Pure, very costly — pistikos: pure, genuine (or possibly ''of pistachio'' or place-name); polytelēs: very expensive. The complete phrase ''myrou nardou pistikēs polyteloūs'' marks one of the costliest substances available; 300 denarii (v.5) = nearly a year''s wages.', 166),
  (5, 'πραθῆναι ... δοθῆναι τοῖς πτωχοῖς', 'prathēnai ... dothēnai tois ptōchois', 'G4097/G1325/G4434', 'To be sold ... given to the poor — the financial calculation made by the disciples (John 12:6 identifies Judas as the speaker). The triangle of money-poor-betrayal anticipates Judas''s next move; alms-rhetoric masks an embezzling treasurer.', 167),
  (24, 'τὸ αἷμά μου τῆς διαθήκης', 'to haima mou tēs diathēkēs', 'G129/G1242', 'My blood of the covenant — direct quotation of Exodus 24:8 LXX (''behold, the blood of the covenant''). At Sinai, Moses sprinkled covenant blood; at Calvary, Jesus pours out covenant blood. Mark''s wording lacks Luke/Paul''s ''new'' (kainē), keeping the Exodus echo as primary.', 168),
  (44, 'κρατήσατε αὐτὸν καὶ ἀπάγετε ἀσφαλῶς', 'kratēsate auton kai apagete asphalōs', 'G2902/G520/G806', 'Seize him and lead him away securely — asphalōs: securely, surely (a-sphallō: not stumbling). Judas''s instruction reflects awareness of Jesus''s prior escapes (Luke 4:30; John 8:59). The arrest must not allow another miraculous deliverance — but ironically God Himself permits this seizure.', 169)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 14 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 plot in stealth
  (1, 'Mark 11:18', 100),
  (1, 'Mark 12:12', 101),
  -- v.2 not on the feast
  (2, 'John 11:55-57', 102),
  -- v.3 anointing at Bethany
  (3, 'John 12:3', 103),
  (3, 'Song of Solomon 1:12', 104),
  -- v.5 sold to poor
  (5, 'Matthew 26:9', 105),
  (5, 'John 12:5-6', 106),
  -- v.6 a beautiful work
  (6, '1 Samuel 16:7', 107),
  -- v.7 the poor with you always
  (7, 'Deuteronomy 15:11', 108),
  (7, 'John 12:8', 109),
  -- v.8 anointed for burial
  (8, 'John 19:40', 110),
  -- v.9 wherever the gospel is preached
  (9, 'Matthew 24:14', 111),
  (9, 'Mark 13:10', 112),
  -- v.10 Judas''s offer
  (10, 'John 13:2', 113),
  (10, 'Luke 22:3-4', 114),
  -- v.11 promised money
  (11, 'Zechariah 11:12', 115),
  (11, 'Matthew 26:15', 116),
  -- v.12 first day of unleavened
  (12, 'Numbers 28:16-17', 117),
  (12, 'Exodus 12:14-20', 118),
  -- v.13 follow him
  (13, 'Luke 22:10-12', 119),
  -- v.14 my time
  (14, 'John 13:1', 120),
  -- v.17 the twelve
  (17, 'Mark 3:14', 121),
  -- v.18 one of you shall betray
  (18, 'John 13:18', 122),
  -- v.20 dipping in the dish
  (20, 'John 13:26', 123),
  -- v.21 woe to that man
  (21, 'Acts 1:25', 124),
  (21, 'Mark 9:42', 125),
  -- v.22 broke and gave
  (22, 'Matthew 14:19', 126),
  (22, 'John 6:51', 127),
  -- v.23 the cup of blessing
  (23, '1 Corinthians 10:16', 128),
  -- v.24 covenant blood
  (24, 'Hebrews 13:20', 129),
  (24, 'Hebrews 10:29', 130),
  (24, 'Zechariah 9:11', 131),
  -- v.25 new in the kingdom
  (25, 'Matthew 26:29', 132),
  (25, 'Luke 22:18', 133),
  (25, 'Revelation 19:9', 134),
  -- v.26 Mount of Olives
  (26, 'Matthew 26:30', 135),
  (26, 'Luke 22:39', 136),
  (26, 'Psalm 118:1-29', 137),
  -- v.27 stumble — sheep scatter
  (27, 'Mark 14:50', 138),
  (27, 'John 16:32', 139),
  -- v.28 risen — going before
  (28, 'Mark 16:7', 140),
  (28, 'Matthew 28:7', 141),
  (28, 'Matthew 28:10', 142),
  -- v.29 not I — Peter
  (29, 'Matthew 26:33', 143),
  (29, 'Proverbs 16:18', 144),
  -- v.30 cock crow
  (30, 'Mark 14:72', 145),
  -- v.31 die with you
  (31, 'John 11:16', 146),
  (31, 'John 13:37', 147),
  -- v.32 Gethsemane
  (32, 'John 18:1', 148),
  (32, 'Luke 22:39-40', 149),
  -- v.33 inner three
  (33, 'Mark 5:37', 150),
  (33, 'Mark 9:2', 151),
  -- v.34 sorrowful
  (34, 'Psalm 42:5', 152),
  (34, 'Psalm 42:11', 153),
  (34, 'John 12:27', 154),
  -- v.35 hour pass
  (35, 'John 17:1', 155),
  (35, 'John 12:23', 156),
  -- v.36 Father, all things
  (36, 'Romans 8:32', 157),
  (36, 'Galatians 4:6', 158),
  -- v.37 Simon, sleeping
  (37, 'Mark 13:36', 159),
  -- v.38 watch and pray
  (38, 'Mark 13:33', 160),
  (38, 'Matthew 26:41', 161),
  (38, '1 Peter 5:8', 162),
  -- v.39 same words
  (39, '2 Corinthians 12:8', 163),
  -- v.41 hour come
  (41, 'John 17:1', 164),
  -- v.42 betrayer at hand
  (42, 'Matthew 26:46', 165),
  -- v.43 Judas with sword
  (43, 'John 18:3', 166),
  -- v.44 token / sign
  (44, '2 Samuel 20:9-10', 167),
  -- v.45 master / kissed
  (45, 'Proverbs 27:6', 168),
  (45, '2 Samuel 15:5', 169),
  -- v.47 ear cut
  (47, 'Matthew 26:51', 170),
  (47, 'Luke 22:50-51', 171),
  (47, 'John 18:10', 172),
  -- v.48 against thief
  (48, 'Matthew 26:55', 173),
  -- v.49 scriptures fulfilled
  (49, 'Acts 1:16', 174),
  (49, 'Matthew 26:54', 175),
  -- v.50 forsook and fled
  (50, 'Zechariah 13:7', 176),
  (50, 'Mark 14:27', 177),
  -- v.51-52 young man fled naked
  (51, 'Mark 14:52', 178),
  (51, 'Genesis 39:12', 179),
  -- v.53 high priest gathered
  (53, 'Matthew 26:57', 180),
  (53, 'John 18:13-14', 181),
  -- v.54 followed at distance
  (54, 'Matthew 26:58', 182),
  (54, 'Luke 22:54-55', 183),
  -- v.55 sought witness
  (55, 'Psalm 27:12', 184),
  (55, 'Daniel 6:4', 185),
  -- v.56 false witness disagreed
  (56, 'Psalm 35:11', 186),
  (56, 'Deuteronomy 19:15', 187),
  -- v.57 false witnesses rose
  (57, 'Acts 6:13-14', 188),
  -- v.58 destroy this temple
  (58, 'Mark 15:29', 189),
  (58, 'Acts 6:14', 190),
  -- v.60 high priest stood
  (60, 'Matthew 26:62', 191),
  -- v.61 silent before accusers
  (61, 'Isaiah 53:7', 192),
  (61, '1 Peter 2:23', 193),
  (61, 'Mark 15:5', 194),
  -- v.62 right hand
  (62, 'Acts 7:55-56', 195),
  -- v.63 tearing clothes
  (63, 'Numbers 14:6', 196),
  (63, 'Acts 14:14', 197),
  (63, 'Leviticus 21:10', 198),
  -- v.64 worthy of death
  (64, 'Leviticus 24:16', 199),
  (64, 'John 19:7', 200),
  -- v.65 mocked and beat
  (65, 'Matthew 26:67-68', 201),
  (65, 'Luke 22:63-65', 202),
  -- v.66 maid
  (66, 'Matthew 26:69', 203),
  (66, 'John 18:17', 204),
  -- v.68 denied
  (68, '2 Timothy 2:12', 205),
  (68, 'Proverbs 29:25', 206),
  -- v.70 a Galilean
  (70, 'Acts 2:7', 207),
  (70, 'Matthew 26:73', 208),
  -- v.71 cursed and swore
  (71, 'Matthew 26:74', 209),
  (71, 'James 5:12', 210),
  -- v.72 wept
  (72, 'Mark 14:30', 211),
  (72, 'Psalm 51:1-3', 212),
  (72, 'Lamentations 3:48-50', 213)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 14 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
