-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 11 — The Triumphal Entry, the Temple, and the Fig Tree
-- 33 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 11,
  'Mark 11 opens Passion Week with three dramatic acts that constitute Jesus'' public claim to messianic authority over Israel. The Triumphal Entry (vv.1-11) is a carefully orchestrated prophetic sign: Jesus sends two disciples to fetch a colt ''whereon never man sat'' (v.2), enters Jerusalem from the Mount of Olives (fulfilling Zechariah 14:4), and rides in as the crowd spreads garments and palm branches, shouting ''Hosanna; Blessed is he that cometh in the name of the Lord: Blessed be the kingdom of our father David'' (vv.9-10). Jesus enters the temple, ''looked round about upon all things'' (v.11), and — in a detail unique to Mark — leaves for Bethany because ''the eventide was come.'' The next morning, the cursing of the fig tree (vv.12-14) begins Mark''s famous ''sandwich'' structure: fig tree – temple – fig tree. Jesus, hungry, approaches a fig tree ''having leaves'' but finds ''nothing but leaves; for the time of figs was not yet'' (v.13). He curses it: ''No man eat fruit of thee hereafter for ever'' (v.14). The fig tree symbolises Israel — all leaves (outward religion) but no fruit (genuine faith). Between the fig tree episodes, Jesus cleanses the temple (vv.15-19), overturning the money-changers'' tables and the dove-sellers'' seats, declaring ''My house shall be called of all nations the house of prayer; but ye have made it a den of thieves'' (v.17). The chief priests and scribes seek to destroy him. The next morning, the disciples find the fig tree ''dried up from the roots'' (v.20). Peter''s amazement prompts Jesus'' teaching on prayer and faith: ''Have faith in God... whosoever shall say unto this mountain, Be thou removed... he shall have whatsoever he saith'' (vv.22-24). He adds the requirement of forgiveness in prayer (vv.25-26). The chapter closes with the religious leaders challenging Jesus'' authority: ''By what authority doest thou these things?'' (v.28). Jesus answers with a counter-question about John''s baptism that exposes their spiritual cowardice — they refuse to answer ''for fear of the people'' (vv.29-33).',
  'The King Comes to His Temple — Messianic Authority, Barren Religion, and the Power of Faith',
  'ἐξουσία (exousia)',
  'Authority, right, power, jurisdiction — from exesti (it is permitted, it is lawful). Exousia denotes not raw power (dynamis) but legitimate, authorized power — the right to act. The religious leaders question Jesus'' exousia (v.28): by what right does he cleanse the temple, accept messianic acclamation, and curse fig trees? Jesus'' counter-question about John''s baptism implies the answer: his authority comes from heaven, not from human institutions.',
  '["The Triumphal Entry into Jerusalem (vv.1-11): Jesus sends for a colt fulfilling Zechariah 9:9. The crowd spreads garments and branches crying Hosanna Blessed is he that cometh in the name of the Lord. Jesus enters the temple looks around at everything and withdraws to Bethany as evening comes — a deliberate dramatic pause before action","The Cursing of the Fig Tree (vv.12-14): The next morning Jesus approaches a fig tree with leaves but finds no fruit — for the time of figs was not yet. He curses it — No man eat fruit of thee hereafter for ever. The fig tree represents Israel''s religious establishment: outward show without inward fruit. The disciples hear his words","The Cleansing of the Temple (vv.15-19): Jesus drives out buyers sellers and money-changers from the temple courts. He overturns tables and refuses to let anyone carry merchandise through the temple. He declares My house shall be called of all nations the house of prayer but ye have made it a den of thieves. The chief priests seek to destroy him","The Withered Fig Tree and Teaching on Faith (vv.20-26): The next morning Peter sees the fig tree dried up from the roots. Jesus teaches — Have faith in God. Whoever says to this mountain Be removed and cast into the sea and does not doubt in his heart it shall be done. Whatever you ask in prayer believing you shall receive it. When you pray forgive so that your Father may forgive you","The Question of Authority (vv.27-33): The chief priests scribes and elders challenge Jesus — By what authority doest thou these things? Jesus answers with a counter-question — The baptism of John was it from heaven or of men? They refuse to answer fearing the crowd either way. Jesus refuses to answer their question — neither tell I you by what authority I do these things"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And when they came nigh to Jerusalem, unto Bethphage and Bethany, at the mount of Olives, he sendeth forth two of his disciples,',
   'καὶ ὅτε ἐγγίζουσιν εἰς Ἱεροσόλυμα εἰς Βηθφαγὴ καὶ Βηθανίαν πρὸς τὸ ὄρος τῶν ἐλαιῶν ἀποστέλλει δύο τῶν μαθητῶν αὐτοῦ',
   'kai hote engizousin eis Hierosolyma eis Bēthphagē kai Bēthanian pros to oros tōn elaiōn apostellei dyo tōn mathētōn autou',
   '''Bethphage'' (house of unripe figs) and ''Bethany'' (house of dates/affliction) — villages on the eastern slope of the Mount of Olives, about two miles from Jerusalem. ''Mount of Olives'' (oros tōn elaiōn) — a hill east of Jerusalem with profound prophetic significance: Zechariah 14:4 prophesied the LORD would stand on the Mount of Olives at the end of days. Jesus'' approach from this direction is a deliberate prophetic sign.',
   NULL),
  (2, 'And saith unto them, Go your way into the village over against you: and as soon as ye be entered into it, ye shall find a colt tied, whereon never man sat; loose him, and bring him.',
   'καὶ λέγει αὐτοῖς ὑπάγετε εἰς τὴν κώμην τὴν κατέναντι ὑμῶν καὶ εὐθέως εἰσπορευόμενοι εἰς αὐτὴν εὑρήσετε πῶλον δεδεμένον ἐφ᾿ ὃν οὐδεὶς ἀνθρώπων κεκάθικεν λύσατε αὐτὸν καὶ φέρετε',
   'kai legei autois hypagete eis tēn kōmēn tēn katenanti hymōn kai eutheōs eisporeuomenoi eis autēn heurēsete pōlon dedemenon eph hon oudeis anthrōpōn kekathiken lysate auton kai pherete',
   '''Colt'' (pōlon — a young donkey). ''Whereon never man sat'' (eph hon oudeis anthrōpōn kekathiken — on which no human has ever sat). An unridden animal was required for sacred purposes (cf. Numbers 19:2; 1 Samuel 6:7). Jesus'' detailed foreknowledge — the exact location, condition, and availability of the colt — demonstrates either supernatural knowledge or prior arrangement (or both). The specificity serves the prophetic purpose: this is the king''s mount, not a random donkey.',
   NULL),
  (3, 'And if any man say unto you, Why do ye this? say ye that the Lord hath need of him; and straightway he will send him hither.',
   'καὶ ἐάν τις ὑμῖν εἴπῃ τί ποιεῖτε τοῦτο εἴπατε ὅτι ὁ κύριος αὐτοῦ χρείαν ἔχει καὶ εὐθέως αὐτὸν ἀποστέλλει ὧδε',
   'kai ean tis hymin eipē ti poieite touto eipate hoti ho kyrios autou chreian echei kai eutheōs auton apostellei hōde',
   '''The Lord hath need'' (ho kyrios chreian echei — the Master/Lord needs it). ''Lord'' (kyrios) here carries its full weight: the sovereign Lord exercises his right over all creation. The owner''s immediate compliance (''straightway he will send'') suggests either prior arrangement or the compelling authority of Jesus'' name.',
   NULL),
  (4, 'And they went their way, and found the colt tied by the door without in a place where two ways met; and they loose him.',
   'καὶ ἀπῆλθον καὶ εὗρον πῶλον δεδεμένον πρὸς θύραν ἔξω ἐπὶ τοῦ ἀμφόδου καὶ λύουσιν αὐτόν',
   'kai apēlthon kai heuron pōlon dedemenon pros thyran exō epi tou amphodou kai lyousin auton',
   '''By the door without'' (pros thyran exō — at the outer door). ''Where two ways met'' (epi tou amphodou — at a road junction, at a crossroads; a vivid eyewitness detail). Mark''s specificity confirms the precision of Jesus'' prediction. Every detail unfolds exactly as described.',
   NULL),
  (5, 'And certain of them that stood there said unto them, What do ye, loosing the colt?',
   'καί τινες τῶν ἐκεῖ ἑστηκότων ἔλεγον αὐτοῖς τί ποιεῖτε λύοντες τὸν πῶλον',
   'kai tines tōn ekei hestēkotōn elegon autois ti poieite lyontes ton pōlon',
   'Bystanders question the disciples — exactly as Jesus predicted. The scenario unfolds with scripted precision, reinforcing Jesus'' sovereign control over the events of Passion Week. Nothing is left to chance; every detail is orchestrated.',
   NULL),
  (6, 'And they said unto them even as Jesus had commanded: and they let them go.',
   'οἱ δὲ εἶπον αὐτοῖς καθὼς ἐνετείλατο ὁ Ἰησοῦς καὶ ἀφῆκαν αὐτούς',
   'hoi de eipon autois kathōs eneteilato ho Iēsous kai aphēkan autous',
   '''Even as Jesus had commanded'' (kathōs eneteilato — just as he had instructed). ''They let them go'' — the password works. Jesus'' authority extends even to practical logistics. The obedience of the colt''s owner, without further question, suggests recognition of Jesus'' lordship.',
   NULL),
  (7, 'And they brought the colt to Jesus, and cast their garments on him; and he sat upon him.',
   'καὶ φέρουσιν τὸν πῶλον πρὸς τὸν Ἰησοῦν καὶ ἐπιβάλλουσιν αὐτῷ τὰ ἱμάτια αὐτῶν καὶ ἐκάθισεν ἐπ᾿ αὐτῷ',
   'kai pherousin ton pōlon pros ton Iēsoun kai epiballousin autō ta himatia autōn kai ekathisen ep autō',
   '''Cast their garments'' (epiballousin ta himatia — threw their cloaks on the colt as an improvised saddle). This act of homage recalls 2 Kings 9:13, where men spread garments for the newly anointed King Jehu. The disciples'' action is spontaneously royal — they treat the colt as a throne.',
   NULL),
  (8, 'And many spread their garments in the way: and others cut down branches off the trees, and strawed them in the way.',
   'πολλοὶ δὲ τὰ ἱμάτια αὐτῶν ἔστρωσαν εἰς τὴν ὁδόν ἄλλοι δὲ στιβάδας κόψαντες ἐκ τῶν ἀγρῶν',
   'polloi de ta himatia autōn estrōsan eis tēn hodon alloi de stibadas kopsantes ek tōn agrōn',
   '''Spread their garments'' — a royal carpet (cf. 2 Kings 9:13). ''Branches'' (stibadas — leafy branches cut from the fields; John 12:13 specifies palm branches). The crowd creates a spontaneous coronation procession. The road becomes a red carpet of cloaks and greenery — the approach of a king.',
   NULL),
  (9, 'And they that went before, and they that followed, cried, saying, Hosanna; Blessed is he that cometh in the name of the Lord:',
   'καὶ οἱ προάγοντες καὶ οἱ ἀκολουθοῦντες ἔκραζον λέγοντες ὡσαννά εὐλογημένος ὁ ἐρχόμενος ἐν ὀνόματι κυρίου',
   'kai hoi proagontes kai hoi akolouthountes ekrazon legontes hōsanna eulogēmenos ho erchomenos en onomati kyriou',
   '''Hosanna'' (hōsanna — from Hebrew hoshia-na, ''save now,'' ''save, we pray''; originally a prayer from Psalm 118:25-26 that had become an acclamation of praise). ''Blessed is he that cometh'' — quoting Psalm 118:26, a messianic psalm sung at Passover. ''In the name of the Lord'' — by the authority and commission of God. The crowd, perhaps unknowingly, identifies Jesus as the long-awaited Messiah.',
   'The crowd quotes Psalm 118:25-26, the last of the Hallel psalms sung during Passover and Tabernacles. ''Hosanna'' had evolved from a prayer (''Save us!'') into a shout of praise. ''He that cometh'' (ho erchomenos) was a recognised messianic title (cf. Matthew 11:3; Luke 7:19). The people are making an explicitly messianic acclamation — welcoming Jesus as the promised Davidic king. Yet within five days, the same city will cry ''Crucify him.'' The irony is devastating: they acclaim the king they will kill.'),
  (10, 'Blessed be the kingdom of our father David, that cometh in the name of the Lord: Hosanna in the highest.',
   'εὐλογημένη ἡ ἐρχομένη βασιλεία τοῦ πατρὸς ἡμῶν Δαυίδ ὡσαννὰ ἐν τοῖς ὑψίστοις',
   'eulogēmenē hē erchomenē basileia tou patros hēmōn Dauid hōsanna en tois hypsistois',
   '''Kingdom of our father David'' (basileia tou patros hēmōn Dauid — the long-awaited restoration of David''s throne; cf. 2 Samuel 7:12-16; Isaiah 9:6-7). ''In the highest'' (en tois hypsistois — in the highest heavens; the praise ascends from earth to heaven). The crowd expects a political kingdom; Jesus will establish a spiritual one. Their words are truer than they know — but in a way they do not yet understand.',
   NULL),
  (11, 'And Jesus entered into Jerusalem, and into the temple: and when he had looked round about upon all things, and now the eventide was come, he went out unto Bethany with the twelve.',
   'καὶ εἰσῆλθεν εἰς Ἱεροσόλυμα ὁ Ἰησοῦς καὶ εἰς τὸ ἱερόν καὶ περιβλεψάμενος πάντα ὀψίας ἤδη οὔσης τῆς ὥρας ἐξῆλθεν εἰς Βηθανίαν μετὰ τῶν δώδεκα',
   'kai eisēlthen eis Hierosolyma ho Iēsous kai eis to hieron kai periblepsamenos panta opsias ēdē ousēs tēs hōras exēlthen eis Bēthanian meta tōn dōdeka',
   '''Looked round about upon all things'' (periblepsamenos panta — surveyed everything; the same searching look used in 3:5 and 3:34). ''Eventide was come'' — it was late, so Jesus leaves for Bethany. This reconnaissance is unique to Mark: Jesus inspects the temple on Sunday evening, then returns Monday to cleanse it. The deliberate delay creates dramatic tension — the King has surveyed his Father''s house and found it wanting. Action will follow.',
   NULL),
  (12, 'And on the morrow, when they were come from Bethany, he was hungry:',
   'καὶ τῇ ἐπαύριον ἐξελθόντων αὐτῶν ἀπὸ Βηθανίας ἐπείνασεν',
   'kai tē epaurion exelthontōn autōn apo Bēthanias epeinasen',
   '''On the morrow'' — Monday of Passion Week. ''He was hungry'' (epeinasen — he felt hunger). The Son of God experiences genuine physical need. The hunger is real, but what follows is more than a search for breakfast — it is a prophetic sign-act against fruitless religion.',
   NULL),
  (13, 'And seeing a fig tree afar off having leaves, he came, if haply he might find any thing thereon: and when he came to it, he found nothing but leaves; for the time of figs was not yet.',
   'καὶ ἰδὼν συκῆν ἀπὸ μακρόθεν ἔχουσαν φύλλα ἦλθεν εἰ ἄρα τι εὑρήσει ἐν αὐτῇ καὶ ἐλθὼν ἐπ᾿ αὐτὴν οὐδὲν εὗρεν εἰ μὴ φύλλα ὁ γὰρ καιρὸς οὐκ ἦν σύκων',
   'kai idōn sykēn apo makrothen echousan phylla ēlthen ei ara ti heurēsei en autē kai elthōn ep autēn ouden heuren ei mē phylla ho gar kairos ouk ēn sykōn',
   '''Fig tree'' (sykēn — a common symbol for Israel in the OT: Jeremiah 8:13; Hosea 9:10; Micah 7:1). ''Having leaves'' — in Palestine, fig trees produce small early fruit (taqsh) before or alongside the leaves. A tree with leaves should have had at least this early fruit. ''The time of figs was not yet'' — the main harvest was not yet due, but the early fruit (which appears with the leaves) should have been present. The tree''s crime is false advertising: leaves promising fruit that does not exist.',
   'The fig tree episode is a prophetic acted parable (like Ezekiel''s symbolic actions in Ezekiel 4-5). The fig tree represents Israel''s religious establishment — specifically the temple, which Mark ''sandwiches'' between the two fig tree episodes (vv.12-14, 20-21). The temple had leaves (impressive architecture, elaborate ritual, bustling activity) but no fruit (genuine worship, justice, mercy). ''The time of figs was not yet'' does not excuse the tree — it condemns it: the tree should have had early fruit if it was genuinely productive. Israel should have been ready for her Messiah when he came.'),
  (14, 'And Jesus answered and said unto it, No man eat fruit of thee hereafter for ever. And his disciples heard it.',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν αὐτῇ μηκέτι εἰς τὸν αἰῶνα ἐκ σοῦ μηδεὶς καρπὸν φάγοι καὶ ἤκουον οἱ μαθηταὶ αὐτοῦ',
   'kai apokritheis ho Iēsous eipen autē mēketi eis ton aiōna ek sou mēdeis karpon phagoi kai ēkouon hoi mathētai autou',
   '''No man eat fruit of thee hereafter for ever'' (mēketi eis ton aiōna — no longer, unto the age; permanent). ''His disciples heard it'' — Mark notes that the disciples are witnesses; the curse will be confirmed the next morning. The fig tree is cursed not for failing to bear fruit out of season but for the hypocrisy of its leaves — promising what it cannot deliver. This is the same charge Jesus levelled at the Pharisees (7:6): outward show without inward reality.',
   NULL),
  (15, 'And they come to Jerusalem: and Jesus went into the temple, and began to cast out them that sold and bought in the temple, and overthrew the tables of the moneychangers, and the seats of them that sold doves;',
   'καὶ ἔρχονται εἰς Ἱεροσόλυμα καὶ εἰσελθὼν ὁ Ἰησοῦς εἰς τὸ ἱερὸν ἤρξατο ἐκβάλλειν τοὺς πωλοῦντας καὶ τοὺς ἀγοράζοντας ἐν τῷ ἱερῷ καὶ τὰς τραπέζας τῶν κολλυβιστῶν καὶ τὰς καθέδρας τῶν πωλούντων τὰς περιστερὰς κατέστρεψεν',
   'kai erchontai eis Hierosolyma kai eiselthōn ho Iēsous eis to hieron ērxato ekballein tous pōlountas kai tous agorazontas en tō hierō kai tas trapezas tōn kollybistōn kai tas kathedras tōn pōlountōn tas peristeras katestrepsen',
   '''Temple'' (hieron — the temple complex, specifically the Court of the Gentiles). ''Cast out'' (ekballein — drive out; the same word used for casting out demons). ''Moneychangers'' (kollybistōn — those who exchanged Roman coins for the Tyrian shekels required for temple tax). ''Seats of them that sold doves'' (doves were the offering of the poor; Leviticus 5:7). ''Overthrew'' (katestrepsen — turned upside down, toppled). Jesus acts with prophetic authority: this is not a riot but a sign-act of divine judgment.',
   'The temple cleansing is a prophetic act of judgment, not a reform attempt. Jesus knows the temple will be destroyed (13:2). His action symbolises what God will do permanently in AD 70. The commerce in the Court of the Gentiles had turned the one space where Gentiles could pray into a marketplace, fulfilling Isaiah 56:7 in reverse. The sellers and money-changers were not technically illegal — they facilitated legitimate temple worship — but they had commercialised sacred space, enriching the priestly aristocracy while exploiting pilgrims. Jesus'' action was a messianic claim: only the Lord himself has the right to purify his own house (Malachi 3:1-3).'),
  (16, 'And would not suffer that any man should carry any vessel through the temple.',
   'καὶ οὐκ ἤφιεν ἵνα τις διενέγκῃ σκεῦος διὰ τοῦ ἱεροῦ',
   'kai ouk ēphien hina tis dienenkē skeuos dia tou hierou',
   '''Carry any vessel'' (dienenkē skeuos — carry merchandise, use the temple courts as a shortcut). The Mishnah records that it was forbidden to use the Temple Mount as a shortcut (Berakhot 9:5), but the practice had apparently continued. Jesus enforces a stricter reverence for the temple than the religious leaders themselves maintained. He exercises lordship over the temple — a claim only God could legitimately make.',
   NULL),
  (17, 'And he taught, saying unto them, Is it not written, My house shall be called of all nations the house of prayer? but ye have made it a den of thieves.',
   'καὶ ἐδίδασκεν καὶ ἔλεγεν αὐτοῖς οὐ γέγραπται ὅτι ὁ οἶκός μου οἶκος προσευχῆς κληθήσεται πᾶσιν τοῖς ἔθνεσιν ὑμεῖς δὲ ἐποιήσατε αὐτὸν σπήλαιον λῃστῶν',
   'kai edidasken kai elegen autois ou gegraptai hoti ho oikos mou oikos proseuchēs klēthēsetai pasin tois ethnesin hymeis de epoiēsate auton spēlaion lēstōn',
   '''My house'' (ho oikos mou — quoting Isaiah 56:7). ''Of all nations'' (pasin tois ethnesin — for all Gentiles; Mark alone includes this phrase, significant for his Gentile audience). ''House of prayer'' versus ''den of thieves'' (spēlaion lēstōn — cave of robbers; from Jeremiah 7:11). A lēstēs is not a petty thief but a violent robber or insurrectionist. The temple had become a hideout where the religious elite retreated after exploiting the people — exactly Jeremiah''s charge against the first temple.',
   'Jesus combines two prophetic texts with devastating effect: Isaiah 56:7 (God''s temple is for all nations) and Jeremiah 7:11 (you have made it a robbers'' cave). The combination indicts the temple establishment on two counts: (1) They excluded the Gentiles by filling the Court of the Gentiles with commerce. (2) They exploited the worshippers by overcharging for sacrificial animals and currency exchange. ''Den of thieves'' in Jeremiah''s context carries a specific warning: God destroyed the first temple because of such corruption (Jeremiah 7:12-14). Jesus implies the same fate awaits the second temple — fulfilled in AD 70.'),
  (18, 'And the scribes and chief priests heard it, and sought how they might destroy him: for they feared him, because all the people was astonished at his doctrine.',
   'καὶ ἤκουσαν οἱ γραμματεῖς καὶ οἱ ἀρχιερεῖς καὶ ἐζήτουν πῶς αὐτὸν ἀπολέσωσιν ἐφοβοῦντο γὰρ αὐτόν ὅτι πᾶς ὁ ὄχλος ἐξεπλήσσετο ἐπὶ τῇ διδαχῇ αὐτοῦ',
   'kai ēkousan hoi grammateis kai hoi archiereis kai ezētoun pōs auton apolesōsin ephobounto gar auton hoti pas ho ochlos exeplēsseto epi tē didachē autou',
   '''Sought how they might destroy him'' (ezētoun pōs apolesōsin — began seeking how to kill him; imperfect tense: continuous plotting). ''Feared him'' (ephobounto — were afraid of him). ''Astonished at his doctrine'' (exeplēsseto epi tē didachē — struck with amazement at his teaching). The religious leaders are trapped between their desire to eliminate Jesus and their fear of his popular support. The temple cleansing forces their hand — Jesus must be stopped before Passover.',
   NULL),
  (19, 'And when even was come, he went out of the city.',
   'καὶ ὅτε ὀψὲ ἐγένετο ἐξεπορεύετο ἔξω τῆς πόλεως',
   'kai hote opse egeneto exeporeueto exō tēs poleōs',
   'Jesus withdraws each evening — to Bethany (v.11) or elsewhere outside the city. He does not stay in Jerusalem overnight during Passion Week until the night of his arrest. This pattern may reflect security concerns (the leaders wanted to arrest him away from the crowds) or simply his lodging arrangement with Lazarus'' family (John 11:1; 12:1-2).',
   NULL),
  (20, 'And in the morning, as they passed by, they saw the fig tree dried up from the roots.',
   'καὶ πρωῒ παραπορευόμενοι εἶδον τὴν συκῆν ἐξηραμμένην ἐκ ῥιζῶν',
   'kai prōi paraporeuomenoi eidon tēn sykēn exērammenēn ek rhizōn',
   '''In the morning'' — Tuesday of Passion Week. ''Dried up from the roots'' (exērammenēn ek rhizōn — withered from the roots up; not just dead leaves but total death from the foundation). The perfect participle indicates the withering was already complete. The judgment was swift and total — overnight, the tree that had only leaves became a dead stump. The symbolism is unmistakable: Israel''s barren religion faces the same fate.',
   NULL),
  (21, 'And Peter calling to remembrance saith unto him, Master, behold, the fig tree which thou cursedst is withered away.',
   'καὶ ἀναμνησθεὶς ὁ Πέτρος λέγει αὐτῷ ῥαββί ἴδε ἡ συκῆ ἣν κατηράσω ἐξήρανται',
   'kai anamnēstheis ho Petros legei autō rhabbi ide hē sykē hēn katērasō exērantai',
   '''Calling to remembrance'' (anamnēstheis — remembering). ''Which thou cursedst'' (hēn katērasō — which you placed under a curse). ''Withered away'' (exērantai — has been completely dried up; perfect tense: permanently dead). Peter connects yesterday''s curse with today''s result. His amazement triggers Jesus'' teaching on faith, prayer, and forgiveness.',
   NULL),
  (22, 'And Jesus answering saith unto them, Have faith in God.',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς λέγει αὐτοῖς ἔχετε πίστιν θεοῦ',
   'kai apokritheis ho Iēsous legei autois echete pistin theou',
   '''Have faith in God'' (echete pistin theou — hold/possess God-directed faith). The genitive ''theou'' can mean ''faith in God'' (objective genitive) or ''God''s kind of faith'' (genitive of quality/source). Either way, the command points away from human capacity toward divine power. The withered fig tree demonstrates what God-directed faith can accomplish; the teaching that follows (vv.23-25) applies this to prayer.',
   NULL),
  (23, 'For verily I say unto you, That whosoever shall say unto this mountain, Be thou removed, and be thou cast into the sea; and shall not doubt in his heart, but shall believe that those things which he saith shall come to pass; he shall have whatsoever he saith.',
   'ἀμὴν γὰρ λέγω ὑμῖν ὅτι ὃς ἂν εἴπῃ τῷ ὄρει τούτῳ ἄρθητι καὶ βλήθητι εἰς τὴν θάλασσαν καὶ μὴ διακριθῇ ἐν τῇ καρδίᾳ αὐτοῦ ἀλλὰ πιστεύσῃ ὅτι ἃ λέγει γίνεται ἔσται αὐτῷ ὃ ἐὰν εἴπῃ',
   'amēn gar legō hymin hoti hos an eipē tō orei toutō arthēti kai blēthēti eis tēn thalassan kai mē diakrithē en tē kardia autou alla pisteusē hoti ha legei ginetai estai autō ho ean eipē',
   '''This mountain'' (tō orei toutō — possibly the Mount of Olives or the Temple Mount visible before them). ''Removed'' (arthēti — lifted up). ''Cast into the sea'' (blēthēti eis tēn thalassan — thrown into the sea). ''Not doubt'' (mē diakrithē — not waver, not be divided in mind; from diakrinomai, to judge between two positions, hence to vacillate). Mountain-moving was a Jewish metaphor for accomplishing the seemingly impossible (cf. 1 Corinthians 13:2). Jesus teaches that prayer offered in unhesitating faith accesses God''s unlimited power.',
   NULL),
  (24, 'Therefore I say unto you, What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them.',
   'διὰ τοῦτο λέγω ὑμῖν πάντα ὅσα ἂν προσευχόμενοι αἰτεῖσθε πιστεύετε ὅτι λαμβάνετε καὶ ἔσται ὑμῖν',
   'dia touto legō hymin panta hosa an proseuchomenoi aiteisthe pisteuete hoti lambanete kai estai hymin',
   '''What things soever ye desire'' (panta hosa — all things, whatever). ''When ye pray'' (proseuchomenoi — in the act of praying). ''Believe that ye receive them'' (pisteuete hoti lambanete — believe that you are receiving; present tense: faith appropriates the answer at the moment of asking). This is not a blank cheque for selfish desires but a promise framed by the context: faith in God (v.22) and forgiveness (v.25). Prayer must be aligned with God''s character and will.',
   NULL),
  (25, 'And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses.',
   'καὶ ὅταν στήκετε προσευχόμενοι ἀφίετε εἴ τι ἔχετε κατά τινος ἵνα καὶ ὁ πατὴρ ὑμῶν ὁ ἐν τοῖς οὐρανοῖς ἀφῇ ὑμῖν τὰ παραπτώματα ὑμῶν',
   'kai hotan stēkete proseuchomenoi aphiete ei ti echete kata tinos hina kai ho patēr hymōn ho en tois ouranois aphē hymin ta paraptōmata hymōn',
   '''Stand praying'' (stēkete proseuchomenoi — standing was the normal Jewish posture for prayer). ''Forgive'' (aphiete — release, let go). ''If ye have ought against any'' (ei ti echete kata tinos — if you hold anything against anyone). ''Trespasses'' (paraptōmata — false steps, transgressions). An unforgiven spirit blocks prayer. Faith and forgiveness are inseparable: you cannot pray with faith toward God while holding bitterness toward people.',
   'This verse inserts forgiveness as a non-negotiable condition of effective prayer. Coming after the mountain-moving promise (v.23), it prevents the teaching from being reduced to a technique for getting what you want. Faith-filled prayer requires a forgiven and forgiving heart. The connection between divine forgiveness and human forgiveness echoes Matthew 6:14-15 and anticipates the parable of the unforgiving servant (Matthew 18:21-35). God''s forgiveness of us and our forgiveness of others are not sequential (first us, then them) but simultaneous: to receive God''s grace, we must extend it.'),
  (26, 'But if ye do not forgive, neither will your Father which is in heaven forgive your trespasses.',
   'εἰ δὲ ὑμεῖς οὐκ ἀφίετε οὐδὲ ὁ πατὴρ ὑμῶν ὁ ἐν τοῖς οὐρανοῖς ἀφήσει τὰ παραπτώματα ὑμῶν',
   'ei de hymeis ouk aphiete oude ho patēr hymōn ho en tois ouranois aphēsei ta paraptōmata hymōn',
   'The negative complement: unforgiveness blocks divine forgiveness. This does not mean we earn God''s forgiveness by forgiving others — rather, a heart that refuses to forgive demonstrates it has not truly received grace. The forgiving and the forgiven heart are the same heart. An unforgiving spirit is incompatible with genuine faith.',
   NULL),
  (27, 'And they come again to Jerusalem: and as he was walking in the temple, there came to him the chief priests, and the scribes, and the elders,',
   'καὶ ἔρχονται πάλιν εἰς Ἱεροσόλυμα καὶ ἐν τῷ ἱερῷ περιπατοῦντος αὐτοῦ ἔρχονται πρὸς αὐτὸν οἱ ἀρχιερεῖς καὶ οἱ γραμματεῖς καὶ οἱ πρεσβύτεροι',
   'kai erchontai palin eis Hierosolyma kai en tō hierō peripatountos autou erchontai pros auton hoi archiereis kai hoi grammateis kai hoi presbyteroi',
   '''Chief priests, scribes, and elders'' — all three groups that compose the Sanhedrin (the Jewish supreme court, 71 members). This is an official delegation, not a casual encounter. They approach Jesus in the temple — the scene of his previous day''s dramatic action. They come with authority to demand answers.',
   NULL),
  (28, 'And say unto him, By what authority doest thou these things? and who gave thee this authority to do these things?',
   'καὶ ἔλεγον αὐτῷ ἐν ποίᾳ ἐξουσίᾳ ταῦτα ποιεῖς ἢ τίς σοι ἔδωκεν τὴν ἐξουσίαν ταύτην ἵνα ταῦτα ποιῇς',
   'kai elegon autō en poia exousia tauta poieis ē tis soi edōken tēn exousian tautēn hina tauta poiēs',
   '''By what authority'' (en poia exousia — by what kind of authority). ''Who gave thee'' (tis soi edōken — who authorized you). Two questions: the nature and the source of Jesus'' authority. ''These things'' (tauta) refers to the triumphal entry, the temple cleansing, and his teaching in the temple. The Sanhedrin controls the temple; Jesus acted without their permission. Their question is both legitimate (they have institutional authority) and hostile (they seek to trap him).',
   NULL),
  (29, 'And Jesus answered and said unto them, I will also ask of you one question, and answer me, and I will tell you by what authority I do these things.',
   'ὁ δὲ Ἰησοῦς ἀποκριθεὶς εἶπεν αὐτοῖς ἐπερωτήσω ὑμᾶς ἕνα λόγον καὶ ἀποκρίθητέ μοι καὶ ἐρῶ ὑμῖν ἐν ποίᾳ ἐξουσίᾳ ταῦτα ποιῶ',
   'ho de Iēsous apokritheis eipen autois eperōtēsō hymas hena logon kai apokrithēte moi kai erō hymin en poia exousia tauta poiō',
   'Jesus does not evade the question but answers it indirectly through a counter-question. This was a standard rabbinic technique: answer a question with a question to expose the questioner''s assumptions. Jesus'' counter-question is not evasion but revelation — if they can answer about John, they will have answered about Jesus.',
   NULL),
  (30, 'The baptism of John, was it from heaven, or of men? answer me.',
   'τὸ βάπτισμα τὸ Ἰωάννου ἐξ οὐρανοῦ ἦν ἢ ἐξ ἀνθρώπων ἀποκρίθητέ μοι',
   'to baptisma to Iōannou ex ouranou ēn ē ex anthrōpōn apokrithēte moi',
   '''From heaven'' (ex ouranou — from God, divinely authorized). ''Of men'' (ex anthrōpōn — of human origin). ''Answer me'' (apokrithēte moi — imperative: Jesus demands an answer). The question is brilliantly constructed: John the Baptist pointed to Jesus as the one who comes after him (1:7-8). If John''s baptism was from heaven, then John''s testimony about Jesus is true — and Jesus'' authority is divine. If John''s baptism was merely human, they should be able to say so. But they cannot.',
   NULL),
  (31, 'And they reasoned with themselves, saying, If we shall say, From heaven; he will say, Why then did ye not believe him?',
   'καὶ ἐλογίζοντο πρὸς ἑαυτοὺς λέγοντες ἐὰν εἴπωμεν ἐξ οὐρανοῦ ἐρεῖ διὰ τί οὖν οὐκ ἐπιστεύσατε αὐτῷ',
   'kai elogizonto pros heautous legontes ean eipōmen ex ouranou erei dia ti oun ouk episteusate autō',
   '''Reasoned'' (elogizonto — calculated, debated; they think strategically, not honestly). If they say ''from heaven,'' Jesus will ask why they did not believe John — and John pointed to Jesus. They are trapped by their own refusal to acknowledge John''s authority, which would have required them to acknowledge Jesus''.',
   NULL),
  (32, 'But if we shall say, Of men; they feared the people: for all men counted John, that he was a prophet indeed.',
   'ἀλλ᾿ ἐὰν εἴπωμεν ἐξ ἀνθρώπων ἐφοβοῦντο τὸν λαόν ἅπαντες γὰρ εἶχον τὸν Ἰωάννην ὄντως ὅτι προφήτης ἦν',
   'all ean eipōmen ex anthrōpōn ephobounto ton laon hapantes gar eichon ton Iōannēn ontōs hoti prophētēs ēn',
   '''They feared the people'' (ephobounto ton laon — they were afraid of the crowd). ''All men counted John... a prophet'' (hapantes eichon — everyone considered John a genuine prophet). The leaders'' dilemma is purely political, not theological. They do not ask ''What is true?'' but ''What is safe?'' Their inability to answer reveals their fundamental dishonesty: they are guided by fear of public opinion, not by truth.',
   NULL),
  (33, 'And they answered and said unto Jesus, We cannot tell. And Jesus answering saith unto them, Neither do I tell you by what authority I do these things.',
   'καὶ ἀποκριθέντες λέγουσιν τῷ Ἰησοῦ οὐκ οἴδαμεν καὶ ὁ Ἰησοῦς ἀποκριθεὶς λέγει αὐτοῖς οὐδὲ ἐγὼ λέγω ὑμῖν ἐν ποίᾳ ἐξουσίᾳ ταῦτα ποιῶ',
   'kai apokrithentes legousin tō Iēsou ouk oidamen kai ho Iēsous apokritheis legei autois oude egō legō hymin en poia exousia tauta poiō',
   '''We cannot tell'' (ouk oidamen — we do not know). Their answer is a lie — they have an opinion; they simply will not state it. ''Neither do I tell you'' (oude egō legō hymin — neither am I telling you). Jesus'' refusal is not evasion but justice: those who refuse to respond honestly to God''s prior revelation (John''s baptism) forfeit the right to further revelation. The answer to Jesus'' authority is embedded in the answer about John: both come from heaven.',
   'This exchange exposes the fundamental spiritual problem of Jesus'' opponents: they are not seeking truth but protecting power. They know John was a prophet (the evidence compelled them) but refuse to say so because it would require them to reckon with John''s testimony about Jesus. Jesus'' refusal to answer is itself an answer: divine revelation is progressive. Those who reject the earlier revelation (John) cannot expect to receive the later revelation (Jesus'' identity). This principle operates throughout redemptive history: faithfulness with existing light is the condition for receiving more light.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 11;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.9 Hosanna
  ('ὡσαννά', 'hōsanna', 'G5614', 'Hosanna — a transliteration of Hebrew hoshia-na (''save now,'' ''save, we pray''), from Psalm 118:25. Originally a desperate prayer for salvation, by Jesus'' time it had become an exclamation of praise and welcome, especially for the Messiah. The crowd''s use of ''Hosanna'' is both a prayer (''Save us!'') and an acclamation (''Praise to the coming King!''). Ironically, their prayer will be answered — not through political liberation but through the cross.', 1),
  -- v.13 fig tree
  ('συκῆ', 'sykē', 'G4808', 'Fig tree — one of the most symbolically significant trees in the OT. Israel is frequently compared to a fig tree (Jeremiah 8:13; Hosea 9:10; Joel 1:7; Micah 7:1). A fruitful fig tree represents Israel prospering under God''s blessing; a barren fig tree represents spiritual failure and coming judgment. Jesus'' cursing of the barren fig tree is a prophetic sign-act condemning the temple establishment: outward religious show (leaves) without spiritual fruit (genuine worship). The withering confirms the judgment.', 2),
  -- v.15 money changers
  ('κολλυβιστής', 'kollybistēs', 'G2855', 'Money changer — from kollybos (a small coin, a rate of exchange). Money changers converted foreign currency into the Tyrian silver shekel, the only coinage accepted for temple tax (Exodus 30:13-16). They charged a premium (typically 4-8%) for the exchange. Set up in the Court of the Gentiles during Passover, their tables — along with animal vendors — transformed the temple''s most accessible space from a house of prayer into a noisy marketplace. Jesus overturns their tables as a sign of divine judgment on commercialised religion.', 3),
  -- v.17 den of thieves
  ('λῃστής', 'lēstēs', 'G3027', 'Robber, brigand, insurrectionist — not a petty thief (kleptēs) but a violent criminal. The word is used of Barabbas (John 18:40) and the two men crucified with Jesus (Mark 15:27). ''Den of thieves'' (spēlaion lēstōn) quotes Jeremiah 7:11, where the prophet charges Israel with treating the temple as a safe house for criminals — performing rituals while practicing injustice. A ''den'' is where robbers retreat after committing crimes, not where they commit them. The temple has become a hideout for religious exploitation.', 4),
  -- v.22 faith in God
  ('πίστις', 'pistis', 'G4102', 'Faith, trust, confidence, conviction — from peithō (to persuade, to be convinced). Pistis in the NT encompasses intellectual conviction (believing certain truths), personal trust (relying on God''s character), and active faithfulness (living out belief). ''Have faith in God'' (echete pistin theou) commands ongoing, habitual trust directed toward God. This faith is not positive thinking or self-confidence but God-confidence — trust in the character, power, and promises of the living God. It is the opposite of the fig tree''s empty show.', 5),
  -- v.23 doubt
  ('διακρίνω', 'diakrinō', 'G1252', 'To doubt, waver, be divided — from dia (through, between) + krinō (to judge). Literally, to judge between two options, hence to be double-minded, to vacillate between faith and unbelief. ''Shall not doubt in his heart'' (mē diakrithē en tē kardia) requires undivided confidence in God. Doubt is not the absence of faith but the division of the heart — one part trusting God, the other part calculating the odds. Mountain-moving faith is whole-hearted, undivided trust in God''s power and willingness to act.', 6),
  -- v.25 forgive
  ('ἀφίημι', 'aphiēmi', 'G863', 'To forgive, release, let go, send away — from apo (away from) + hiēmi (to send). The fundamental meaning is to release someone from a debt or obligation. In prayer, forgiveness means releasing the grudge, letting go of the right to retribution. Jesus makes forgiveness a prerequisite for effective prayer: an unforgiving spirit blocks communion with God. The connection is logical: we cannot approach God for mercy while withholding mercy from others. Forgiveness is not a feeling but a decision to release.', 7),
  -- v.28 authority
  ('ἐξουσία', 'exousia', 'G1849', 'Authority, right, legitimate power, jurisdiction — from exesti (it is permitted, it is lawful). Exousia is not raw force (dynamis) but authorised power — the right to act granted by a higher authority. The Sanhedrin''s question ''by what authority'' (en poia exousia) acknowledges that authority requires a source. Jesus'' authority comes directly from God (''from heaven''), not from any human institution. His counter-question about John reveals the answer: the same God who authorised John''s baptism authorised Jesus'' temple action. Refusal to acknowledge the first blocks recognition of the second.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 11
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 9
    WHEN 2 THEN 13
    WHEN 3 THEN 15
    WHEN 4 THEN 17
    WHEN 5 THEN 22
    WHEN 6 THEN 23
    WHEN 7 THEN 25
    WHEN 8 THEN 28
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 Mount of Olives
  (1, 'Zechariah 14:4', 1),
  (1, 'Matthew 21:1', 2),
  -- v.2 colt never sat upon
  (2, 'Zechariah 9:9', 3),
  (2, 'Numbers 19:2', 4),
  (2, 'Luke 19:30', 5),
  -- v.7 garments on the colt
  (7, '2 Kings 9:13', 6),
  -- v.9 Hosanna
  (9, 'Psalm 118:25-26', 7),
  (9, 'Matthew 21:9', 8),
  (9, 'John 12:13', 9),
  -- v.10 kingdom of David
  (10, '2 Samuel 7:12-16', 10),
  (10, 'Isaiah 9:6-7', 11),
  -- v.13 fig tree barren
  (13, 'Jeremiah 8:13', 12),
  (13, 'Hosea 9:10', 13),
  (13, 'Micah 7:1', 14),
  (13, 'Luke 13:6-9', 15),
  -- v.15 temple cleansing
  (15, 'Matthew 21:12-13', 16),
  (15, 'John 2:13-17', 17),
  (15, 'Malachi 3:1-3', 18),
  -- v.17 house of prayer
  (17, 'Isaiah 56:7', 19),
  (17, 'Jeremiah 7:11', 20),
  (17, 'Jeremiah 7:12-14', 21),
  -- v.20 fig tree withered
  (20, 'Matthew 21:19-20', 22),
  -- v.22 have faith in God
  (22, 'Hebrews 11:6', 23),
  -- v.23 mountain removed
  (23, 'Matthew 17:20', 24),
  (23, 'Matthew 21:21', 25),
  (23, '1 Corinthians 13:2', 26),
  (23, 'James 1:6', 27),
  -- v.24 ask and receive
  (24, 'Matthew 7:7-8', 28),
  (24, 'John 14:13-14', 29),
  (24, 'John 15:7', 30),
  (24, '1 John 5:14-15', 31),
  -- v.25 forgive
  (25, 'Matthew 6:14-15', 32),
  (25, 'Matthew 18:21-35', 33),
  (25, 'Ephesians 4:32', 34),
  (25, 'Colossians 3:13', 35),
  -- v.28 by what authority
  (28, 'Matthew 21:23', 36),
  (28, 'Luke 20:1-2', 37),
  -- v.30 John's baptism
  (30, 'Mark 1:4-8', 38),
  (30, 'Matthew 21:25-27', 39)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 11
  AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 11 — BACKFILL (additional word_studies + cross_references)
-- Triumphal Entry · Fig Tree (intercalation) · Cleansing the Temple · Authority Question
-- ═══════════════════════════════════════════════════

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Βηθφαγή', 'Bēthphagē', 'G967', 'House of unripe figs — village on the eastern slope of the Mount of Olives. The name (from Aramaic beth-pagei) ironically anticipates the barren fig tree of vv.12-14: Jesus enters from the place of unripe figs and finds Israel''s religious tree fruitless.', 100),
  (1, 'ὄρος τῶν ἐλαιῶν', 'oros tōn elaiōn', 'G3735/G1636', 'Mount of Olives — the hill east of Jerusalem from which Zechariah 14:4 prophesies the LORD will appear at the end of days. Jesus deliberately approaches Jerusalem from this prophetic mount, framing the Triumphal Entry as a fulfilment of eschatological hope.', 101),
  (2, 'πῶλος', 'pōlos', 'G4454', 'A young donkey/colt — the very animal of Zechariah 9:9 (LXX pōlon onou). Mark and Luke (unlike Matthew) emphasize the unridden status, satisfying the requirement that animals dedicated to sacred service must never have borne yoke or rider (Numbers 19:2; 1 Samuel 6:7).', 102),
  (2, 'δεδεμένον', 'dedemenon', 'G1210', 'Bound, tied — perfect passive participle of deō. The colt is bound until the Lord''s command frees it (lysate, ''loose him''). The pattern echoes the binding/loosing language of authority (Matthew 16:19): the King releases what was bound by the King''s claim.', 103),
  (3, 'κύριος', 'kyrios', 'G2962', 'Lord, master, owner — used in the LXX to translate YHWH. The title here (ho kyrios) carries deliberate ambiguity: the disciples speak of Jesus as Master, but Mark''s readers hear the Lord of all. The colt''s owner releases the animal at his Lord''s claim — sovereignty acknowledged.', 104),
  (7, 'ἐπιβάλλουσιν', 'epiballousin', 'G1911', 'They threw upon, cast over — historical present, vivid eyewitness narration. The disciples'' instinctive royal gesture (cf. 2 Kings 9:13, where Jehu''s officers spread garments at his coronation) treats the colt as a throne and Jesus as Israel''s rightful king.', 105),
  (7, 'ἱμάτια', 'himatia', 'G2440', 'Outer cloaks, garments — the costliest item of common dress. Throwing one''s himation on the road or under a king was a public homage (2 Kings 9:13). The crowd''s improvised carpet of cloaks transforms the country road into a coronation procession.', 106),
  (8, 'στιβάδας', 'stibadas', 'G4746', 'Leafy branches, cut foliage — Mark''s rare word (NT hapax). John 12:13 specifies palm branches, symbol of Maccabean victory celebrations and nationalistic messianic hope (1 Maccabees 13:51). The crowd''s palm-branches turn the moment into a freedom-fighter''s welcome — they expect a political deliverer.', 107),
  (9, 'εὐλογημένος', 'eulogēmenos', 'G2127', 'Blessed, praised — perfect passive participle of eulogeō (literally well-spoken-of). Quoting Psalm 118:26, the crowd applies a Hallel acclamation traditionally used for pilgrims arriving at the temple, but here transferred personally to Jesus: he himself is the Blessed One, the climactic Pilgrim.', 108),
  (9, 'ὁ ἐρχόμενος', 'ho erchomenos', 'G2064', 'The Coming One — recognized messianic title (Matthew 11:3; Luke 7:19; John 11:27; Hebrews 10:37). The crowd applies a fixed eschatological designation to Jesus, hailing him as the long-promised Davidic deliverer ''who comes in the name of the LORD.''', 109),
  (10, 'βασιλεία τοῦ πατρὸς ἡμῶν Δαυίδ', 'basileia tou patros hēmōn Dauid', 'G932/G3962/G1138', 'Kingdom of our father David — the central hope of post-exilic Judaism (2 Samuel 7:12-16; Isaiah 9:6-7; Amos 9:11; Jeremiah 23:5). The crowd expects political restoration; Mark''s reader sees a King who reigns through the cross before returning in glory.', 110),
  (10, 'ἐν τοῖς ὑψίστοις', 'en tois hypsistois', 'G5310', 'In the highest places — superlative of hypsos (height). ''Hosanna in the highest'' invokes praise to be heard in the highest heavens, where God dwells. The crowd''s shout echoes the angels'' nativity gloria (Luke 2:14) — heaven-and-earth acclamation of the King.', 111),
  (11, 'περιβλεψάμενος', 'periblepsamenos', 'G4017', 'Looked around, surveyed — aorist middle participle of periblepō. Mark''s signature verb for the searching, evaluative gaze of Jesus (3:5, 3:34, 5:32, 10:23). Jesus inspects the temple before acting — Mark uniquely places the reconnaissance on Sunday evening, the cleansing on Monday. Judgment is deliberate, not impulsive.', 112),
  (11, 'ἱερόν', 'hieron', 'G2411', 'Temple precincts — the entire complex (in distinction from naos, the inner sanctuary). The Court of the Gentiles, where money-changers and dove-sellers operated, was the outermost area; this is where Jesus confronts them tomorrow morning. He inspects the whole hieron tonight before acting.', 113),
  (12, 'ἐπαύριον', 'epaurion', 'G1887', 'On the next day, on the morrow — Monday of Passion Week. Mark gives the only synoptic chronology with day-by-day precision in this week, dividing Sunday (entry), Monday (cursing + cleansing), Tuesday (withered tree + controversies), and so on.', 114),
  (13, 'φύλλα', 'phylla', 'G5444', 'Leaves — the fig tree''s deceptive promise. Fig trees normally bear early fruit (paggim) at the same time as leaves; a leafy fig should have at least the first crop. The presence of leaves but absence of fruit makes the tree a sign of Israel''s religious establishment: outward show, inward barrenness.', 115),
  (13, 'ὁ καιρὸς σύκων', 'ho kairos sykōn', 'G2540/G4810', 'The season of figs — kairos here is appointed time, set season. Mark''s explicit note ''for the time of figs was not yet'' has puzzled readers; the point is theological, not horticultural. Jesus enacts judgment on a tree (and, allegorically, a nation) that displays the leaves of religion but lacks the early fruit that should accompany them.', 116),
  (14, 'μηκέτι', 'mēketi', 'G3371', 'No longer, no more — strong negation with prohibitive force. Combined with ''eis ton aiōna'' (forever), Jesus pronounces an irrevocable curse: never again shall fruit be eaten from this tree. The verdict is final.', 117),
  (14, 'εἰς τὸν αἰῶνα', 'eis ton aiōna', 'G1519/G165', 'Forever, into the age — Hebraistic idiom (le-olam). The fig tree''s curse is permanent. Read against vv.20-21, the withered roots show the totality of the judgment: not merely barren but dead at the root — a portent for the temple system Jesus is about to confront.', 118),
  (15, 'ἐκβάλλειν', 'ekballein', 'G1544', 'To cast out, drive out — the same verb used of casting out demons (1:34, 39). Jesus drives merchants from the temple as he expels unclean spirits: the temple has become a domain of unclean trade, requiring an exorcism of commerce.', 119),
  (15, 'τραπέζας', 'trapezas', 'G5132', 'Tables — the bankers'' counters where money-changers exchanged Greek and Roman coins (with their pagan images) for Tyrian shekels acceptable for the half-shekel temple tax. The system was riddled with surcharges. Jesus overturns the tables (katestrepsen), upending the entire temple economy.', 120),
  (15, 'καθέδρας τῶν περιστερῶν', 'kathedras tōn peristerōn', 'G2515/G4058', 'Seats of the dove-sellers — peristerai were the offering of the poor (Leviticus 5:7; 12:8). Inflated prices in the temple court exploited the poorest worshippers; Jesus targets specifically the abuse of the disadvantaged. The kathedra (judgment-seat/stall) is dethroned.', 121),
  (16, 'σκεῦος', 'skeuos', 'G4632', 'Vessel, utensil, merchandise — Mark uniquely records that Jesus stopped people carrying any vessel through the temple, treating the temple courts as a public shortcut for merchant traffic. He restores the boundary between sacred space and the marketplace (cf. Zechariah 14:21).', 122),
  (17, 'οἶκος προσευχῆς πᾶσιν τοῖς ἔθνεσιν', 'oikos proseuchēs pasin tois ethnesin', 'G3624/G4335/G1484', 'House of prayer for all the nations — citing Isaiah 56:7. Mark uniquely preserves the full phrase ''for all the nations,'' restoring the eschatological vision of the temple as Gentile-inclusive worship space. The Court of the Gentiles, currently a livestock market, was meant to be where the nations met YHWH.', 123),
  (17, 'σπήλαιον λῃστῶν', 'spēlaion lēstōn', 'G4693/G3027', 'Den of robbers — citing Jeremiah 7:11. Jeremiah''s context is judgment on a temple whose worshippers commit sin and hide in the temple as in a robber''s cave between raids. Jesus'' citation places the present establishment under the same Jeremianic condemnation that preceded the Babylonian destruction.', 124),
  (18, 'ἐκπλήσσομαι', 'ekplēssomai', 'G1605', 'Astonished, struck out of one''s senses — the crowd''s reaction to Jesus'' teaching (1:22; 6:2; 7:37). Mark ironically notes that the crowd''s amazement is precisely what fuels the leaders'' fear and resolve to destroy him: popular acclaim makes Jesus more dangerous, not safer.', 125),
  (18, 'ἀπολλύω', 'apollyō', 'G622', 'To destroy, kill, ruin — the chief priests'' plot crystallizes (cf. 3:6). Mark uses this verb of Jesus'' enemies'' active intent to kill him; the cross is not an accident but the deliberate target of Jewish leadership from this moment forward.', 126),
  (20, 'ἐξηραμμένη ἐκ ῥιζῶν', 'exērammenē ek rhizōn', 'G3583/G4491', 'Withered from the roots — perfect passive participle of xērainō. The destruction is total: no possibility of regrowth. Parallels Job 18:16 (the wicked''s roots dry up beneath) and contrasts with the messianic ''Root of David'' (Revelation 5:5; 22:16) as the new and true source of fruit.', 127),
  (21, 'καταράομαι', 'kataraomai', 'G2672', 'To curse, invoke evil upon — Peter recognizes Jesus'' word as a formal curse (katēramenē, perfect passive participle: it has been cursed and remains so). The fig-tree incident is rare Marcan material that places Jesus in the prophetic line of Jeremiah and Hosea, who used acted parables of judgment.', 128),
  (22, 'ἔχετε πίστιν θεοῦ', 'echete pistin theou', 'G2192/G4102/G2316', 'Have faith in God — literally ''have faith of God,'' an objective genitive. Jesus connects the withered fig tree to a teaching on prayer-and-faith: judgment on barren religion is paired with the promise of fruitful faith for those who trust God.', 129),
  (23, 'ὄρος ... θάλασσα', 'oros ... thalassa', 'G3735/G2281', 'Mountain ... sea — likely a deliberate gesture toward the temple mount (visible from Bethany) being cast into the Mediterranean: faith can move even the mountain of corrupt religion. Hyperbolic image of the impossible-yet-possible by faith (cf. Job 9:5; Zechariah 4:7).', 130),
  (24, 'ἐλάβετε', 'elabete', 'G2983', 'You have received — aorist of lambanō; manuscript variants show present, future, and aorist forms. The aorist (preferred Alexandrian reading) presents prayer as already-answered confidence: the believer prays in the assurance that what God has decided, he has already in heaven granted.', 131),
  (25, 'στήκετε προσευχόμενοι', 'stēkete proseuchomenoi', 'G4739/G4336', 'When you stand praying — standing was the normal Jewish prayer posture (1 Samuel 1:26; Matthew 6:5; Luke 18:11). Jesus does not impose a posture but assumes the customary one and adds an inward requirement: forgiveness must accompany prayer, or no posture will avail.', 132),
  (25, 'παράπτωμα', 'paraptōma', 'G3900', 'Trespass, false step, lapse — from para-piptō (to fall aside). Distinct from hamartia (sin) in nuance: paraptōma is a slip rather than a willful violation, but no less in need of forgiveness. The teaching presupposes that praying disciples will continually have lapses to forgive.', 133),
  (25, 'ὁ πατὴρ ὑμῶν ὁ ἐν τοῖς οὐρανοῖς', 'ho patēr hymōn ho en tois ouranois', 'G3962/G3772', 'Your Father in the heavens — Mark''s rare use of Father-language (cf. 8:38; 13:32; 14:36). The closest Marcan echo of the Sermon on the Mount''s ''our Father.'' Forgiveness is grounded in family relationship: the Father will forgive his children as they forgive each other.', 134),
  (27, 'ἀρχιερεῖς ... γραμματεῖς ... πρεσβύτεροι', 'archiereis ... grammateis ... presbyteroi', 'G749/G1122/G4245', 'Chief priests, scribes, and elders — Mark''s standard formula for the full Sanhedrin (8:31; 14:43, 53; 15:1). The triad represents the institutional power Jesus has just provoked by overturning their commercial operation in the temple courts. The official body that will condemn him.', 135),
  (28, 'ποίᾳ ἐξουσίᾳ', 'poia exousia', 'G4169/G1849', 'By what kind of authority — the indefinite poia presses for source. Jesus has not been ordained as a Pharisaic rabbi, has not been authorised by the Sanhedrin, and has not received priestly office; yet he has cleansed the temple. The leaders demand his credentials.', 136),
  (28, 'ταῦτα ποιεῖς', 'tauta poieis', 'G3778/G4160', 'These things you do — the demonstrative gathers up the cleansing, the colt-procession, and the messianic acclamations into one bundle: ''by what authority are you doing all this?'' The plural deeds together amount to a public claim of messianic authority.', 137),
  (29, 'ἐπερωτήσω', 'eperōtēsō', 'G1905', 'I will ask, question, interrogate — future of eperōtaō. Jesus turns the interrogation back on them: rabbinic counter-questioning was a standard halakhic technique. Refusal to answer the counter-question forfeits the right to a direct answer.', 138),
  (30, 'ἐξ οὐρανοῦ ἢ ἐξ ἀνθρώπων', 'ex ouranou ē ex anthrōpōn', 'G3772/G444', 'From heaven or from men — heaven (ouranos) is a Jewish circumlocution for God (cf. ''kingdom of heaven''). The question forces a binary verdict on John''s prophetic ministry — and, by extension, on Jesus, who was baptised by John and pointed to as the Messiah at the Jordan.', 139),
  (31, 'διελογίζοντο πρὸς ἑαυτούς', 'dielogizonto pros heautous', 'G1260', 'They reasoned among themselves — Mark''s recurring verb for the calculating self-interest of Jesus'' opponents (2:6, 8; 8:16-17; 9:33). They do not weigh truth but tactics: which answer will harm us least?', 140),
  (31, 'οὐκ ἐπιστεύσατε αὐτῷ', 'ouk episteusate autō', 'G3756/G4100', 'You did not believe him — they have not believed John, hence they cannot affirm his divine origin without self-condemnation. Their unbelief is now exposed by their own logic.', 141),
  (32, 'ἐφοβοῦντο τὸν λαόν', 'ephobounto ton laon', 'G5399/G2992', 'They feared the people — but not the fear of God; the fear of crowds. Mark contrasts this with Jesus, whose authority is heaven-grounded and crowd-independent. The Sanhedrin''s political fear is calibrated by popular theology, not by truth.', 142),
  (32, 'ὄντως', 'ontōs', 'G3689', 'Truly, really — used here of the people''s firm conviction that John was ''truly a prophet'' (ontōs hoti prophētēs ēn). The popular acclaim of John as a prophet is what locks the Sanhedrin into silence: to deny his prophethood publicly would mean riot.', 143),
  (33, 'οὐκ οἴδαμεν', 'ouk oidamen', 'G3756/G1492', 'We do not know — perfect of oida used as present. The cynical refusal to commit; not honest agnosticism but calculated evasion. Their ''we do not know'' forfeits the right to teach Israel: the official guardians of revelation publicly disclaim the ability to discern God''s prophet.', 144),
  (33, 'οὐδὲ ἐγὼ λέγω ὑμῖν', 'oude egō legō hymin', 'G3761/G1473/G3004', 'Neither do I tell you — Jesus refuses the answer they have forfeited the right to receive. Authority from heaven is not granted to those who refuse to recognise it when it appears in plain sight (John''s baptism and Jesus'' temple-cleansing are of one piece).', 145),
  (4, 'ἄμφοδος', 'amphodos', 'G296', 'A road that runs around something, crossroads, alleyway — Mark''s eyewitness detail; the colt is tied at a junction of streets, an everyday Jerusalem-village topographical note. Confirms the precision of Jesus'' prediction: the disciples find what he said where he said it.', 146),
  (15, 'ἤρξατο ἐκβάλλειν', 'ērxato ekballein', 'G756/G1544', 'He began to cast out — ingressive aorist + present infinitive. The construction signals deliberate, sustained action; Jesus did not lash out impulsively but began a programmatic clearing of the temple. The Court of the Gentiles is being reclaimed for prayer.', 147),
  (17, 'πεποιήκατε', 'pepoiēkate', 'G4160', 'You have made — perfect tense; the indictment is for an enduring corruption, not a passing infraction. Hearers are responsible for what they have made of God''s house and what it now is.', 148),
  (24, 'πάντα ὅσα', 'panta hosa', 'G3956/G3745', 'All things whatsoever — universal scope, but contextually qualified by the surrounding teaching: prayer that asks in faith, in forgiveness, and in alignment with God''s will. Not a blank cheque, but a full assurance for prayer that meets the conditions Jesus has just laid down.', 149)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 11 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 approach to Jerusalem
  (1, 'Luke 19:28-29', 100),
  (1, 'Matthew 21:1-11', 101),
  (1, 'John 12:12-19', 102),
  -- v.2 unridden colt
  (2, 'Genesis 49:10-11', 103),
  (2, '1 Samuel 6:7', 104),
  (2, 'Deuteronomy 21:3', 105),
  -- v.3 the Lord has need
  (3, 'John 13:13', 106),
  (3, 'Psalm 24:1', 107),
  -- v.7 enthronement on the colt
  (7, '1 Kings 1:33-40', 108),
  (7, 'Matthew 21:7', 109),
  -- v.8 spreading branches
  (8, 'Leviticus 23:40', 110),
  (8, 'Revelation 7:9-10', 111),
  (8, '1 Maccabees 13:51', 112),
  -- v.9 Hosanna acclamation
  (9, 'Psalm 118:25', 113),
  (9, 'Luke 19:37-38', 114),
  (9, 'Matthew 21:9-11', 115),
  -- v.10 Davidic kingdom
  (10, 'Luke 1:32-33', 116),
  (10, 'Acts 2:30', 117),
  (10, 'Revelation 22:16', 118),
  (10, 'Jeremiah 23:5-6', 119),
  -- v.11 inspection of the temple
  (11, 'Malachi 3:1-3', 120),
  (11, 'Ezekiel 10:18-19', 121),
  (11, 'Luke 19:41-44', 122),
  -- v.12 Monday morning
  (12, 'Matthew 21:18', 123),
  -- v.13 fig tree without fruit
  (13, 'Matthew 21:19', 124),
  (13, 'Habakkuk 3:17', 125),
  (13, 'Joel 1:7-12', 126),
  -- v.14 the curse
  (14, 'Isaiah 5:1-7', 127),
  (14, 'Luke 13:6-9', 128),
  -- v.15 cleansing the temple
  (15, 'Luke 19:45-46', 129),
  (15, 'Matthew 21:12', 130),
  (15, 'Deuteronomy 14:24-26', 131),
  -- v.16 no carrying through the temple
  (16, 'Zechariah 14:20-21', 132),
  -- v.17 house of prayer
  (17, 'Luke 19:46', 133),
  (17, 'Matthew 21:13', 134),
  (17, '1 Kings 8:41-43', 135),
  (17, 'Isaiah 60:7', 136),
  -- v.18 plot to destroy
  (18, 'Mark 3:6', 137),
  (18, 'Mark 14:1-2', 138),
  (18, 'Luke 19:47-48', 139),
  (18, 'John 7:32', 140),
  -- v.19 evening retreat
  (19, 'Luke 21:37-38', 141),
  -- v.20 withered fig tree
  (20, 'Matthew 21:20', 142),
  (20, 'Job 18:16', 143),
  -- v.21 Peter remembers
  (21, 'Mark 11:14', 144),
  (21, 'Hosea 9:16', 145),
  -- v.22 faith in God
  (22, 'Luke 17:5-6', 146),
  (22, 'James 1:6-8', 147),
  (22, 'Romans 4:20-21', 148),
  -- v.23 mountain into the sea
  (23, 'Zechariah 4:7', 149),
  (23, 'Job 9:5', 150),
  (23, 'Matthew 21:21-22', 151),
  -- v.24 ask believing receive
  (24, '1 John 3:22', 152),
  (24, 'James 4:2-3', 153),
  (24, 'Mark 9:23', 154),
  -- v.25 forgive when you pray
  (25, 'Luke 11:4', 155),
  (25, 'Matthew 5:23-24', 156),
  (25, 'Matthew 6:9-12', 157),
  -- v.27 in the temple
  (27, 'Matthew 21:23-27', 158),
  (27, 'Luke 20:1-8', 159),
  -- v.28 by what authority
  (28, 'John 2:18-22', 160),
  (28, 'Acts 4:7', 161),
  (28, 'Acts 7:27', 162),
  -- v.29 counter-question
  (29, 'Matthew 21:24', 163),
  (29, 'Luke 20:3-4', 164),
  -- v.30 baptism of John
  (30, 'Matthew 3:1-6', 165),
  (30, 'John 1:6-8', 166),
  (30, 'John 1:33', 167),
  -- v.31 reasoning together
  (31, 'Mark 1:9-11', 168),
  (31, 'Matthew 21:25', 169),
  -- v.32 fearing the people
  (32, 'Mark 6:20', 170),
  (32, 'Matthew 14:5', 171),
  (32, 'Luke 7:24-30', 172),
  -- v.33 we cannot tell
  (33, 'Matthew 21:27', 173),
  (33, 'Luke 20:7-8', 174)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 11 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
