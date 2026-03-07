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
