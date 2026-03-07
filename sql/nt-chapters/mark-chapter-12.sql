-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 12 — The Wicked Husbandmen, Caesar's Coin, and the Widow's Mites
-- 44 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 12,
  'Mark 12 presents Jesus'' final public teaching in the temple, a series of confrontations with the religious leaders that expose their hostility and his authority. The chapter opens with the Parable of the Wicked Husbandmen (vv.1-12), an allegorical vineyard story drawn from Isaiah 5: a man plants a vineyard, lets it to husbandmen, and sends servants to collect fruit. They beat, wound, and kill the servants. Finally the owner sends ''his beloved son'' (v.6), whom the husbandmen murder to seize the inheritance. Jesus asks: what will the lord of the vineyard do? He will ''destroy the husbandmen, and will give the vineyard unto others'' (v.9). Quoting Psalm 118:22-23, Jesus declares ''The stone which the builders rejected is become the head of the corner'' (v.10). The leaders perceive he speaks against them but fear the crowd. Next, Pharisees and Herodians attempt to trap Jesus on the tribute question: ''Is it lawful to give tribute to Caesar, or not?'' (v.14). Jesus'' masterful answer — ''Render to Caesar the things that are Caesar''s, and to God the things that are God''s'' (v.17) — leaves them astonished. Sadducees then pose a resurrection riddle about seven brothers marrying one wife (vv.18-23). Jesus corrects their error: ''When they shall rise from the dead, they neither marry, nor are given in marriage; but are as the angels which are in heaven'' (v.25). He proves the resurrection from the Torah: ''I am the God of Abraham... He is not the God of the dead, but the God of the living'' (v.27). A scribe, impressed by Jesus'' answers, asks which commandment is greatest. Jesus cites Deuteronomy 6:4-5 (love God) and Leviticus 19:18 (love your neighbour) as the two greatest commandments (vv.29-31). The scribe agrees, and Jesus tells him ''Thou art not far from the kingdom of God'' (v.34). Jesus then poses his own question: how can the Messiah be David''s son when David calls him Lord (vv.35-37)? He warns against the scribes'' hypocrisy — they devour widows'' houses while making long prayers (vv.38-40). The chapter climaxes with the widow''s two mites: she casts in ''all that she had, even all her living'' (v.44), giving more than all the rich because they gave from surplus, but she gave from her need.',
  'The Rejected Stone, the Two Kingdoms, and the Heart of True Worship',
  'ἀποδίδωμι (apodidōmi)',
  'To give back, render, return what is owed — from apo (back) + didōmi (to give). The key verb in Jesus'' famous answer ''render to Caesar'' (apodote Kaisari, v.17). Apodidōmi implies giving back what properly belongs to someone — not a gift but a debt. Caesar''s image is on the coin, so the coin belongs to Caesar. But God''s image is on humanity (Genesis 1:26-27), so the whole person belongs to God. The verb frames the chapter''s central question: what do we owe God?',
  '["The Parable of the Wicked Husbandmen (vv.1-12): A man plants a vineyard lets it to husbandmen and sends servants to collect fruit. They beat wound and kill them. He sends his beloved son — they kill him too. The lord will destroy the husbandmen and give the vineyard to others. The stone the builders rejected has become the head of the corner","Render unto Caesar (vv.13-17): Pharisees and Herodians try to trap Jesus — Is it lawful to give tribute to Caesar? Jesus asks for a penny — Whose image and superscription is this? They say Caesar''s. Render to Caesar the things that are Caesar''s and to God the things that are God''s. They marvel at his answer","The Sadducees and the Resurrection (vv.18-27): Sadducees who deny the resurrection pose a riddle about seven brothers and one wife. Jesus answers — In the resurrection they neither marry nor are given in marriage but are as the angels in heaven. God is the God of Abraham Isaac and Jacob — He is not the God of the dead but the God of the living. Ye therefore do greatly err","The Greatest Commandment (vv.28-34): A scribe asks which is the first commandment of all. Jesus answers — Hear O Israel the Lord our God is one Lord and thou shalt love the Lord thy God with all thy heart soul mind and strength. The second is Thou shalt love thy neighbour as thyself. The scribe agrees and Jesus says Thou art not far from the kingdom of God","David''s Son and Lord — Warning Against the Scribes — The Widow''s Mites (vv.35-44): Jesus asks how the scribes say Christ is David''s son when David calls him Lord. He warns against the scribes who love greetings and chief seats but devour widows'' houses. A poor widow casts in two mites — all her living — giving more than all the rich who gave from their abundance"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 44 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And he began to speak unto them by parables. A certain man planted a vineyard, and set an hedge about it, and digged a place for the winefat, and built a tower, and let it out to husbandmen, and went into a far country.',
   'καὶ ἤρξατο αὐτοῖς ἐν παραβολαῖς λέγειν ἀμπελῶνα ἐφύτευσεν ἄνθρωπος καὶ περιέθηκεν φραγμὸν καὶ ὤρυξεν ὑπολήνιον καὶ ᾠκοδόμησεν πύργον καὶ ἐξέδοτο αὐτὸν γεωργοῖς καὶ ἀπεδήμησεν',
   'kai ērxato autois en parabolais legein ampelōna ephyteusen anthrōpos kai periethēken phragmon kai ōryxen hypolēnion kai ōkodomēsen pyrgon kai exedoto auton geōrgois kai apedēmēsen',
   'Jesus draws directly from Isaiah 5:1-7, the Song of the Vineyard. ''Vineyard'' (ampelōna — a familiar OT symbol for Israel). ''Hedge'' (phragmon — a protective wall or fence). ''Winefat'' (hypolēnion — the lower vat that catches pressed grape juice). ''Tower'' (pyrgon — a watchtower for guards). ''Husbandmen'' (geōrgois — tenant farmers). Every detail echoes Isaiah: God is the owner, Israel is the vineyard, and the leaders are the tenants entrusted with its care.',
   'The parable is transparently allegorical: the vineyard is Israel (Isaiah 5:7), the owner is God, the husbandmen are Israel''s leaders, the servants are the prophets, and the beloved son is Jesus. Jesus tells this parable in the temple, directly to the chief priests, scribes, and elders who challenged his authority in 11:27-28. He answers their question about his authority by telling them who he is — the Son — and what they are about to do — kill him.'),
  (2, 'And at the season he sent to the husbandmen a servant, that he might receive from the husbandmen of the fruit of the vineyard.',
   'καὶ ἀπέστειλεν πρὸς τοὺς γεωργοὺς τῷ καιρῷ δοῦλον ἵνα παρὰ τῶν γεωργῶν λάβῃ ἀπὸ τοῦ καρποῦ τοῦ ἀμπελῶνος',
   'kai apesteilen pros tous geōrgous tō kairō doulon hina para tōn geōrgōn labē apo tou karpou tou ampelōnos',
   '''At the season'' (tō kairō — at the appointed time, at harvest). ''Servant'' (doulon — slave, bondservant). ''Fruit'' (karpou — the owner''s rightful share). God sent prophets at the appointed time to receive the fruit of faithfulness from Israel''s leaders. The servant''s mission is legitimate — the owner is entitled to what the vineyard produces.',
   NULL),
  (3, 'And they caught him, and beat him, and sent him away empty.',
   'οἱ δὲ λαβόντες αὐτὸν ἔδειραν καὶ ἀπέστειλαν κενόν',
   'hoi de labontes auton edeiran kai apesteilan kenon',
   '''Beat him'' (edeiran — flayed, scourged). ''Sent him away empty'' (apesteilan kenon — dispatched with nothing). The servant receives violence instead of fruit. This mirrors the treatment of prophets throughout Israel''s history — Jeremiah was beaten and imprisoned (Jeremiah 20:2; 37:15); Elijah was hunted (1 Kings 19:2).',
   NULL),
  (4, 'And again he sent unto them another servant; and at him they cast stones, and wounded him in the head, and sent him away shamefully handled.',
   'καὶ πάλιν ἀπέστειλεν πρὸς αὐτοὺς ἄλλον δοῦλον κἀκεῖνον λιθοβολήσαντες ἐκεφαλαίωσαν καὶ ἀπέστειλαν ἠτιμωμένον',
   'kai palin apesteilen pros autous allon doulon kakeinon lithobolēsantes ekephalaiōsan kai apesteilan ētimōmenon',
   '''Cast stones'' (lithobolēsantes — stoned). ''Wounded him in the head'' (ekephalaiōsan — struck on the head; or possibly ''summed up'' the insults, but the physical meaning fits the escalating violence). ''Shamefully handled'' (ētimōmenon — dishonoured, treated with contempt). Each successive servant receives worse treatment — an escalation of rebellion.',
   NULL),
  (5, 'And again he sent another; and him they killed, and many others; beating some, and killing some.',
   'καὶ πάλιν ἄλλον ἀπέστειλεν κἀκεῖνον ἀπέκτειναν καὶ πολλοὺς ἄλλους τοὺς μὲν δέροντες τοὺς δὲ ἀποκτέννοντες',
   'kai palin allon apesteilen kakeinon apekteinan kai pollous allous tous men derontes tous de apoktennnontes',
   '''Him they killed'' (apekteinan — murdered). ''Many others'' — the violence escalates and multiplies. ''Beating some, and killing some'' — a long history of prophetic rejection compressed into one verse. The owner''s patience is extraordinary: he keeps sending servants despite their mistreatment. This reflects God''s persistent mercy toward rebellious Israel (cf. 2 Chronicles 36:15-16).',
   NULL),
  (6, 'Having yet therefore one son, his wellbeloved, he sent him also last unto them, saying, They will reverence my son.',
   'ἔτι οὖν ἕνα υἱὸν ἔχων ἀγαπητὸν αὐτοῦ ἀπέστειλεν αὐτὸν πρὸς αὐτοὺς ἔσχατον λέγων ὅτι ἐντραπήσονται τὸν υἱόν μου',
   'eti oun hena huion echōn agapēton autou apesteilen auton pros autous eschaton legōn hoti entrapēsontai ton huion mou',
   '''One son, his wellbeloved'' (hena huion agapēton — one beloved son; the same phrase used at Jesus'' baptism in 1:11 and the Transfiguration in 9:7). ''Last'' (eschaton — finally, as the ultimate act). ''They will reverence'' (entrapēsontai — feel shame before, show respect to). The father''s expectation reveals his goodness — he believes even these wicked tenants will respect his son. The parable makes Jesus'' identity unmistakable: he is the beloved Son, the final messenger.',
   'This verse is one of Mark''s most explicit christological statements. Jesus identifies himself as the ''beloved son'' (agapētos huios) — the same title God gave him from heaven at his baptism (1:11) and Transfiguration (9:7). He is not merely another prophet (servant) but the unique Son. The word ''last'' (eschaton) signals that after the Son, there is no further messenger. To reject the Son is to reject God''s final and greatest revelation. The father''s ''saying, They will reverence my son'' reveals the divine optimism that sent Christ into the world — even knowing what would happen.'),
  (7, 'But those husbandmen said among themselves, This is the heir; come, let us kill him, and the inheritance shall be ours.',
   'ἐκεῖνοι δὲ οἱ γεωργοὶ εἶπον πρὸς ἑαυτοὺς ὅτι οὗτός ἐστιν ὁ κληρονόμος δεῦτε ἀποκτείνωμεν αὐτόν καὶ ἡμῶν ἔσται ἡ κληρονομία',
   'ekeinoi de hoi geōrgoi eipon pros heautous hoti houtos estin ho klēronomos deute apokteinōmen auton kai hēmōn estai hē klēronomia',
   '''This is the heir'' (houtos estin ho klēronomos — they recognise who he is). ''Let us kill him'' (apokteinōmen auton — let us murder him). ''The inheritance shall be ours'' (hēmōn estai hē klēronomia — the inheritance will belong to us). The husbandmen know the son''s identity — their sin is not ignorance but calculated rebellion. They believe killing the heir will give them permanent control of the vineyard. This precisely mirrors the chief priests'' reasoning in John 11:48-50.',
   NULL),
  (8, 'And they took him, and killed him, and cast him out of the vineyard.',
   'καὶ λαβόντες αὐτὸν ἀπέκτειναν καὶ ἐξέβαλον αὐτὸν ἔξω τοῦ ἀμπελῶνος',
   'kai labontes auton apekteinan kai exebalon auton exō tou ampelōnos',
   '''Cast him out of the vineyard'' (exebalon exō tou ampelōnos — threw him outside the vineyard). In Mark''s sequence, the son is killed and then cast out (Matthew reverses the order to match Jesus'' crucifixion outside Jerusalem; Hebrews 13:12). The casting out signifies utter contempt — the body is denied proper burial. The parable anticipates the crucifixion: Jesus will be taken, killed, and cast outside the city.',
   NULL),
  (9, 'What shall therefore the lord of the vineyard do? he will come and destroy the husbandmen, and will give the vineyard unto others.',
   'τί οὖν ποιήσει ὁ κύριος τοῦ ἀμπελῶνος ἐλεύσεται καὶ ἀπολέσει τοὺς γεωργούς καὶ δώσει τὸν ἀμπελῶνα ἄλλοις',
   'ti oun poiēsei ho kyrios tou ampelōnos eleusetai kai apolesei tous geōrgous kai dōsei ton ampelōna allois',
   '''The lord of the vineyard'' (ho kyrios tou ampelōnos — the vineyard owner, i.e., God). ''Destroy the husbandmen'' (apolesei tous geōrgous — will utterly destroy the tenant farmers). ''Give the vineyard unto others'' (dōsei ton ampelōna allois — will hand over the vineyard to others). The judgment is twofold: destruction of the wicked leaders and transfer of stewardship to new tenants. Historically fulfilled in AD 70 (temple destruction) and the expansion of the church to the Gentiles.',
   NULL),
  (10, 'And have ye not read this scripture; The stone which the builders rejected is become the head of the corner:',
   'οὐδὲ τὴν γραφὴν ταύτην ἀνέγνωτε λίθον ὃν ἀπεδοκίμασαν οἱ οἰκοδομοῦντες οὗτος ἐγενήθη εἰς κεφαλὴν γωνίας',
   'oude tēn graphēn tautēn anegnōte lithon hon apedokimasan hoi oikodomountes houtos egenēthē eis kephalēn gōnias',
   '''The stone which the builders rejected'' — quoting Psalm 118:22-23. ''Rejected'' (apedokimasan — tested and declared unfit; from apodokimazō, to examine and reject after testing). ''Head of the corner'' (kephalēn gōnias — the cornerstone or capstone, the most important stone in the structure). The builders are Israel''s leaders; the stone is Jesus. They examined him, judged him unfit, and rejected him — but God made him the cornerstone of a new building.',
   'The stone metaphor from Psalm 118:22-23 became one of the earliest christological proof-texts in the church (Acts 4:11; 1 Peter 2:7; Ephesians 2:20). The ''builders'' are the religious experts whose job was to identify the Messiah — and they rejected him. The irony is devastating: the professional stone-inspectors discarded the most important stone. But God reversed their verdict: the rejected stone became the cornerstone. This is the gospel in miniature — human rejection overruled by divine vindication through the resurrection.'),
  (11, 'This was the Lord''s doing, and it is marvellous in our eyes?',
   'παρὰ κυρίου ἐγένετο αὕτη καὶ ἔστιν θαυμαστὴ ἐν ὀφθαλμοῖς ἡμῶν',
   'para kyriou egeneto hautē kai estin thaumastē en ophthalmois hēmōn',
   '''The Lord''s doing'' (para kyriou egeneto — this came about from the Lord). ''Marvellous'' (thaumastē — wonderful, astonishing). Psalm 118:23 affirms that the reversal is God''s sovereign act. The rejected stone''s exaltation is not an accident but a divine plan. What the builders saw as rubble, God saw as the cornerstone. The resurrection is the ultimate ''marvellous'' act that vindicated the rejected Son.',
   NULL),
  (12, 'And they sought to lay hold on him, but feared the people: for they knew that he had spoken the parable against them: and they left him, and went their way.',
   'καὶ ἐζήτουν αὐτὸν κρατῆσαι καὶ ἐφοβήθησαν τὸν ὄχλον ἔγνωσαν γὰρ ὅτι πρὸς αὐτοὺς τὴν παραβολὴν εἶπεν καὶ ἀφέντες αὐτὸν ἀπῆλθον',
   'kai ezētoun auton kratēsai kai ephobēthēsan ton ochlon egnōsan gar hoti pros autous tēn parabolēn eipen kai aphentes auton apēlthon',
   '''Sought to lay hold'' (ezētoun kratēsai — kept trying to arrest). ''Feared the people'' (ephobēthēsan ton ochlon — were afraid of the crowd). ''They knew'' (egnōsan — they recognised, understood). The leaders understand the parable is about them — they are the wicked husbandmen. Yet their response is not repentance but intensified plotting. They are restrained only by political calculation, not by conscience.',
   NULL),
  (13, 'And they send unto him certain of the Pharisees and of the Herodians, to catch him in his words.',
   'καὶ ἀποστέλλουσιν πρὸς αὐτόν τινας τῶν Φαρισαίων καὶ τῶν Ἡρῳδιανῶν ἵνα αὐτὸν ἀγρεύσωσιν λόγῳ',
   'kai apostellousin pros auton tinas tōn Pharisaiōn kai tōn Hērōdianōn hina auton agreusōsin logō',
   '''Pharisees and Herodians'' — an unlikely alliance. Pharisees were nationalists who resented Roman rule; Herodians supported the Herodian dynasty and its Roman backing. ''Catch him in his words'' (agreusōsin logō — to trap in speech; agreō means to hunt, to ensnare prey). They combine forces specifically to entrap Jesus. This same coalition appeared earlier in 3:6, where they plotted Jesus'' destruction.',
   NULL),
  (14, 'And when they were come, they say unto him, Master, we know that thou art true, and carest for no man: for thou regardest not the person of men, but teachest the way of God in truth: Is it lawful to give tribute to Caesar, or not?',
   'οἱ δὲ ἐλθόντες λέγουσιν αὐτῷ διδάσκαλε οἴδαμεν ὅτι ἀληθὴς εἶ καὶ οὐ μέλει σοι περὶ οὐδενός οὐ γὰρ βλέπεις εἰς πρόσωπον ἀνθρώπων ἀλλ᾿ ἐπ᾿ ἀληθείας τὴν ὁδὸν τοῦ θεοῦ διδάσκεις ἔξεστιν κῆνσον Καίσαρι δοῦναι ἢ οὔ',
   'hoi de elthontes legousin autō didaskale oidamen hoti alēthēs ei kai ou melei soi peri oudenos ou gar blepeis eis prosōpon anthrōpōn all ep alētheias tēn hodon tou theou didaskeis exestin kēnson Kaisari dounai ē ou',
   '''Master'' (didaskale — Teacher). The flattery is elaborate and ironic: they describe Jesus accurately (true, impartial, teaching God''s way in truth) while intending to destroy him. ''Tribute'' (kēnson — from Latin census; the annual poll tax paid to Rome). The trap: if Jesus says ''pay it,'' he loses popular support (the tax was hated as a symbol of subjugation). If he says ''don''t pay it,'' they report him to Rome as a seditionist.',
   NULL),
  (15, 'Shall we give, or shall we not give? But he, knowing their hypocrisy, said unto them, Why tempt ye me? bring me a penny, that I may see it.',
   'δῶμεν ἢ μὴ δῶμεν ὁ δὲ εἰδὼς αὐτῶν τὴν ὑπόκρισιν εἶπεν αὐτοῖς τί με πειράζετε φέρετέ μοι δηνάριον ἵνα ἴδω',
   'dōmen ē mē dōmen ho de eidōs autōn tēn hypokrisin eipen autois ti me peirazete pherete moi dēnarion hina idō',
   '''Knowing their hypocrisy'' (eidōs autōn tēn hypokrisin — perceiving their play-acting). ''Tempt'' (peirazete — test, try to trap). ''Penny'' (dēnarion — denarius, a Roman silver coin worth a day''s wage). Jesus sees through the performance immediately. Rather than falling into their trap, he requests a visual aid — the coin itself will provide the answer.',
   NULL),
  (16, 'And they brought it. And he saith unto them, Whose is this image and superscription? And they said unto him, Caesar''s.',
   'οἱ δὲ ἤνεγκαν καὶ λέγει αὐτοῖς τίνος ἡ εἰκὼν αὕτη καὶ ἡ ἐπιγραφή οἱ δὲ εἶπον αὐτῷ Καίσαρος',
   'hoi de ēnenkan kai legei autois tinos hē eikōn hautē kai hē epigraphē hoi de eipon autō Kaisaros',
   '''Image'' (eikōn — likeness, portrait; the denarius bore Tiberius Caesar''s profile). ''Superscription'' (epigraphē — inscription; the coin read ''Tiberius Caesar, son of the divine Augustus'' — a claim to divinity). By producing the coin, Jesus'' opponents demonstrate they already participate in Caesar''s economy. The coin bears Caesar''s image — it belongs to his domain.',
   NULL),
  (17, 'And Jesus answering said unto them, Render to Caesar the things that are Caesar''s, and to God the things that are God''s. And they marvelled at him.',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν αὐτοῖς ἀπόδοτε τὰ Καίσαρος Καίσαρι καὶ τὰ τοῦ θεοῦ τῷ θεῷ καὶ ἐθαύμαζον ἐπ᾿ αὐτῷ',
   'kai apokritheis ho Iēsous eipen autois apodote ta Kaisaros Kaisari kai ta tou theou tō theō kai ethaumazon ep autō',
   '''Render'' (apodote — give back, return what is owed; from apodidōmi). ''The things that are Caesar''s'' (ta Kaisaros — what belongs to Caesar). ''The things that are God''s'' (ta tou theou — what belongs to God). ''They marvelled'' (ethaumazon — were astonished). Jesus transcends the false dichotomy: paying tax does not conflict with honouring God. But the deeper logic is subversive: the coin bears Caesar''s image, so return it to Caesar; but you bear God''s image (Genesis 1:27), so give your whole self to God.',
   'This saying is among the most influential in the history of political theology. Jesus establishes a dual-obligation framework: civil duties to the state and supreme allegiance to God. The answer avoids both revolutionary zealotry (refuse Caesar) and uncritical accommodation (Caesar is all that matters). ''Render to God the things that are God''s'' is the weightier claim — Caesar may demand taxes, but God demands the whole person. The coin bears Caesar''s eikōn (image); humans bear God''s eikōn (Genesis 1:27). What you owe God is infinitely greater than what you owe Caesar.'),
  (18, 'Then come unto him the Sadducees, which say there is no resurrection; and they asked him, saying,',
   'καὶ ἔρχονται Σαδδουκαῖοι πρὸς αὐτόν οἵτινες λέγουσιν ἀνάστασιν μὴ εἶναι καὶ ἐπηρώτησαν αὐτὸν λέγοντες',
   'kai erchontai Saddoukaioi pros auton hoitines legousin anastasin mē einai kai epērōtēsan auton legontes',
   '''Sadducees'' — the priestly aristocracy who controlled the temple. ''Which say there is no resurrection'' — they accepted only the five books of Moses and found no clear resurrection teaching there (or so they argued). They denied resurrection, angels, and spirits (Acts 23:8). Their question is designed to reduce resurrection belief to absurdity.',
   NULL),
  (19, 'Master, Moses wrote unto us, If a man''s brother die, and leave his wife behind him, and leave no children, that his brother should take his wife, and raise up seed unto his brother.',
   'διδάσκαλε Μωσῆς ἔγραψεν ἡμῖν ὅτι ἐάν τινος ἀδελφὸς ἀποθάνῃ καὶ καταλίπῃ γυναῖκα καὶ τέκνα μὴ ἀφῇ ἵνα λάβῃ ὁ ἀδελφὸς αὐτοῦ τὴν γυναῖκα καὶ ἐξαναστήσῃ σπέρμα τῷ ἀδελφῷ αὐτοῦ',
   'didaskale Mōsēs egrapsen hēmin hoti ean tinos adelphos apothanē kai katalipē gynaika kai tekna mē aphē hina labē ho adelphos autou tēn gynaika kai exanastēsē sperma tō adelphō autou',
   'The Sadducees cite the levirate marriage law from Deuteronomy 25:5-6. ''Raise up seed'' (exanastēsē sperma — raise up offspring). The law required a brother-in-law to marry his deceased brother''s widow to perpetuate the family line. The Sadducees use this venerable law as the basis for what they consider a devastating reductio ad absurdum of the resurrection.',
   NULL),
  (20, 'Now there were seven brethren: and the first took a wife, and dying left no seed.',
   'ἑπτὰ ἀδελφοὶ ἦσαν καὶ ὁ πρῶτος ἔλαβεν γυναῖκα καὶ ἀποθνήσκων οὐκ ἀφῆκεν σπέρμα',
   'hepta adelphoi ēsan kai ho prōtos elaben gynaika kai apothnēskōn ouk aphēken sperma',
   'The hypothetical scenario unfolds: seven brothers in sequence. The number seven suggests completeness — the case is pushed to its extreme. Each brother fulfils the levirate duty; each dies childless. The Sadducees construct their trap with mathematical precision.',
   NULL),
  (21, 'And the second took her, and died, neither left he any seed: and the third likewise.',
   'καὶ ὁ δεύτερος ἔλαβεν αὐτήν καὶ ἀπέθανεν μὴ καταλιπὼν σπέρμα καὶ ὁ τρίτος ὡσαύτως',
   'kai ho deuteros elaben autēn kai apethanen mē katalipōn sperma kai ho tritos hōsautōs',
   'The repetition drives the point: husband after husband, the same result. The Sadducees are building toward their punchline — whose wife will she be in the resurrection? The absurdity of the scenario is the weapon.',
   NULL),
  (22, 'And the seven had her, and left no seed: last of all the woman died also.',
   'καὶ ἔλαβον αὐτὴν οἱ ἑπτὰ καὶ οὐκ ἀφῆκαν σπέρμα ἔσχατον πάντων ἀπέθανεν καὶ ἡ γυνή',
   'kai elabon autēn hoi hepta kai ouk aphēkan sperma eschaton pantōn apethanen kai hē gynē',
   '''Last of all'' (eschaton pantōn — after everyone else). All seven husbands and the wife are dead. The stage is set for the Sadducees'' intended knockout question: a resurrection would create an impossible marital situation. They assume the afterlife must be a continuation of earthly relationships.',
   NULL),
  (23, 'In the resurrection therefore, when they shall rise, whose wife shall she be of them? for the seven had her to wife.',
   'ἐν τῇ ἀναστάσει ὅταν ἀναστῶσιν τίνος αὐτῶν ἔσται γυνή οἱ γὰρ ἑπτὰ ἔσχον αὐτὴν γυναῖκα',
   'en tē anastasei hotan anastōsin tinos autōn estai gynē hoi gar hepta eschon autēn gynaika',
   '''Whose wife shall she be?'' — the intended trap. The Sadducees assume resurrection life must mirror earthly life, making the resurrection logically absurd. Their error is not in the question but in the assumption behind it: that the age to come is simply this age extended. Jesus will demolish this assumption.',
   NULL),
  (24, 'And Jesus answering said unto them, Do ye not therefore err, because ye know not the scriptures, neither the power of God?',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν αὐτοῖς οὐ διὰ τοῦτο πλανᾶσθε μὴ εἰδότες τὰς γραφὰς μηδὲ τὴν δύναμιν τοῦ θεοῦ',
   'kai apokritheis ho Iēsous eipen autois ou dia touto planasthe mē eidotes tas graphas mēde tēn dynamin tou theou',
   '''Err'' (planasthe — wander, go astray; the root of our word ''planet,'' a ''wandering star''). ''Know not the scriptures'' (mē eidotes tas graphas — you do not understand the Scriptures). ''Neither the power of God'' (mēde tēn dynamin tou theou — nor God''s power). Jesus diagnoses two errors: scriptural ignorance and underestimating God. The Sadducees'' mistake is not intellectual but theological — they limit God''s power to their own categories.',
   NULL),
  (25, 'For when they shall rise from the dead, they neither marry, nor are given in marriage; but are as the angels which are in heaven.',
   'ὅταν γὰρ ἐκ νεκρῶν ἀναστῶσιν οὔτε γαμοῦσιν οὔτε γαμίζονται ἀλλ᾿ εἰσὶν ὡς ἄγγελοι οἱ ἐν τοῖς οὐρανοῖς',
   'hotan gar ek nekrōn anastōsin oute gamousin oute gamizontai all eisin hōs angeloi hoi en tois ouranois',
   '''Neither marry, nor are given in marriage'' (oute gamousin oute gamizontai — the active and passive forms cover both genders). ''As the angels'' (hōs angeloi — like angels, resembling angels in this respect). Jesus demolishes the Sadducees'' assumption: resurrection life is not a continuation of earthly institutions. Marriage belongs to this age, not the age to come. The comparison to angels does not mean disembodied existence but a transformed mode of life where procreation and death are no longer relevant.',
   'This verse has generated extensive theological reflection on the nature of the resurrection body and the afterlife. Jesus affirms: (1) There is a resurrection (''when they shall rise''). (2) Resurrection life is qualitatively different from earthly life — not a mere extension but a transformation. (3) Marriage, designed for this age of mortality and procreation (Genesis 2:18-24), is superseded in the resurrection. (4) The comparison to angels indicates immortality and the absence of death, not the absence of physicality or personal relationships. The Sadducees'' error was projecting earthly categories onto heavenly realities.'),
  (26, 'And as touching the dead, that they rise: have ye not read in the book of Moses, how in the bush God spake unto him, saying, I am the God of Abraham, and the God of Isaac, and the God of Jacob?',
   'περὶ δὲ τῶν νεκρῶν ὅτι ἐγείρονται οὐκ ἀνέγνωτε ἐν τῇ βίβλῳ Μωσέως ἐπὶ τοῦ βάτου πῶς εἶπεν αὐτῷ ὁ θεὸς λέγων ἐγὼ ὁ θεὸς Ἀβραὰμ καὶ ὁ θεὸς Ἰσαὰκ καὶ ὁ θεὸς Ἰακώβ',
   'peri de tōn nekrōn hoti egeirontai ouk anegnōte en tē biblō Mōseōs epi tou batou pōs eipen autō ho theos legōn egō ho theos Abraam kai ho theos Isaak kai ho theos Iakōb',
   '''In the book of Moses'' — Jesus deliberately argues from the Torah (Exodus 3:6), the only scriptures the Sadducees accepted. ''At the bush'' (epi tou batou — at the burning bush passage; a way of citing scripture before chapter and verse). ''I am'' (egō — present tense, not ''I was''). God identifies himself as the God of Abraham, Isaac, and Jacob — who had been dead for centuries. Jesus'' argument rests on the present tense: God maintains an ongoing relationship with these patriarchs, which requires their continued existence.',
   'This is a masterful piece of biblical argumentation. Jesus meets the Sadducees on their own ground — the Torah — and derives the resurrection from Exodus 3:6. The argument is: (1) God said ''I am'' (not ''I was'') the God of Abraham, Isaac, and Jacob. (2) God is not the God of non-existent beings. (3) Therefore Abraham, Isaac, and Jacob must be alive in some sense. (4) Therefore resurrection (or at least life after death) is affirmed in Moses. The argument assumes God''s covenant faithfulness: his relationship with the patriarchs did not end at their physical death. A God who identifies himself by his relationship with certain people cannot allow those people to cease to exist permanently.'),
  (27, 'He is not the God of the dead, but the God of the living: ye therefore do greatly err.',
   'οὐκ ἔστιν ὁ θεὸς νεκρῶν ἀλλὰ θεὸς ζώντων ὑμεῖς οὖν πολὺ πλανᾶσθε',
   'ouk estin ho theos nekrōn alla theos zōntōn hymeis oun poly planasthe',
   '''Not the God of the dead'' (ouk theos nekrōn — God is not the God of non-existent people). ''God of the living'' (theos zōntōn — a God whose people are alive). ''Greatly err'' (poly planasthe — you wander far from the truth). The conclusion is devastating: the Sadducees'' entire position is based on a fundamental misunderstanding of God''s nature. A God who keeps covenant must keep his people alive.',
   NULL),
  (28, 'And one of the scribes came, and having heard them reasoning together, and perceiving that he had answered them well, asked him, Which is the first commandment of all?',
   'καὶ προσελθὼν εἷς τῶν γραμματέων ἀκούσας αὐτῶν συζητούντων εἰδὼς ὅτι καλῶς αὐτοῖς ἀπεκρίθη ἐπηρώτησεν αὐτόν ποία ἐστὶν πρώτη πάντων ἐντολή',
   'kai proselthōn heis tōn grammateōn akousas autōn syzētountōn eidōs hoti kalōs autois apekrithē epērōtēsen auton poia estin prōtē pantōn entolē',
   '''One of the scribes'' — this scribe is sincere, unlike the previous questioners. ''Answered them well'' (kalōs apekrithē — answered excellently). ''First commandment of all'' (prōtē pantōn entolē — the most important of all commands). The rabbis counted 613 commandments in the Torah (248 positive, 365 negative) and debated which was greatest. This scribe, impressed by Jesus'' handling of the Sadducees, asks a genuine question about the Torah''s organizing principle.',
   NULL),
  (29, 'And Jesus answered him, The first of all the commandments is, Hear, O Israel; The Lord our God is one Lord:',
   'ὁ δὲ Ἰησοῦς ἀπεκρίθη αὐτῷ ὅτι πρώτη πάντων ἐντολή ἄκουε Ἰσραήλ κύριος ὁ θεὸς ἡμῶν κύριος εἷς ἐστιν',
   'ho de Iēsous apekrithē autō hoti prōtē pantōn entolē akoue Israēl kyrios ho theos hēmōn kyrios heis estin',
   'Jesus begins with the Shema (Deuteronomy 6:4), Israel''s foundational confession of faith, recited twice daily. ''Hear'' (akoue — listen and obey). ''The Lord our God is one Lord'' (kyrios heis estin — the Lord is one). The Shema declares God''s unity and uniqueness. Jesus grounds the greatest commandment in theology: who God is determines how we must respond to him.',
   NULL),
  (30, 'And thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind, and with all thy strength: this is the first commandment.',
   'καὶ ἀγαπήσεις κύριον τὸν θεόν σου ἐξ ὅλης τῆς καρδίας σου καὶ ἐξ ὅλης τῆς ψυχῆς σου καὶ ἐξ ὅλης τῆς διανοίας σου καὶ ἐξ ὅλης τῆς ἰσχύος σου αὕτη πρώτη ἐντολή',
   'kai agapēseis kyrion ton theon sou ex holēs tēs kardias sou kai ex holēs tēs psychēs sou kai ex holēs tēs dianoias sou kai ex holēs tēs ischyos sou hautē prōtē entolē',
   '''Love'' (agapēseis — future indicative used as imperative; agapaō denotes volitional, deliberate love, not mere emotion). ''Heart'' (kardias — the seat of will and intention). ''Soul'' (psychēs — the whole person, the life-force). ''Mind'' (dianoias — the faculty of understanding; Mark adds this to the Deuteronomy text). ''Strength'' (ischyos — physical and moral power). Four faculties, one command: love God with everything you are and have. No compartment of life is exempt.',
   'The Shema (Deuteronomy 6:4-5) is the foundation of all Jewish piety. Jesus identifies it as the ''first of all'' commandments — not merely first in sequence but first in importance. The fourfold ''all'' (holēs) is emphatic: all your heart, all your soul, all your mind, all your strength. God demands total, undivided love — not a portion of our affections but the whole person directed toward him. This command exposes every half-hearted religiosity: outward compliance without inward devotion is exactly the barrenness symbolised by the fig tree (11:13-14).'),
  (31, 'And the second is like, namely this, Thou shalt love thy neighbour as thyself. There is none other commandment greater than these.',
   'καὶ δευτέρα ὁμοία αὕτη ἀγαπήσεις τὸν πλησίον σου ὡς σεαυτόν μείζων τούτων ἄλλη ἐντολὴ οὐκ ἔστιν',
   'kai deutera homoia hautē agapēseis ton plēsion sou hōs seauton meizōn toutōn allē entolē ouk estin',
   '''Like'' (homoia — similar, of the same kind; not identical but inseparable). ''Neighbour'' (plēsion — the one near you; from Leviticus 19:18). ''As thyself'' (hōs seauton — to the same degree that you value yourself). Jesus pairs Deuteronomy 6:5 with Leviticus 19:18 — love of God and love of neighbour are inseparable. ''None other commandment greater'' — these two summarise the entire law.',
   NULL),
  (32, 'And the scribe said unto him, Well, Master, thou hast said the truth: for there is one God; and there is none other but he:',
   'καὶ εἶπεν αὐτῷ ὁ γραμματεὺς καλῶς διδάσκαλε ἐπ᾿ ἀληθείας εἶπας ὅτι εἷς ἐστιν καὶ οὐκ ἔστιν ἄλλος πλὴν αὐτοῦ',
   'kai eipen autō ho grammateus kalōs didaskale ep alētheias eipas hoti heis estin kai ouk estin allos plēn autou',
   '''Well, Master'' (kalōs didaskale — excellently said, Teacher). The scribe affirms Jesus'' answer and adds his own theological reflection. ''One God, and there is none other but he'' — echoing Deuteronomy 4:35 and Isaiah 45:21. This scribe demonstrates genuine theological understanding, not hostile testing.',
   NULL),
  (33, 'And to love him with all the heart, and with all the understanding, and with all the soul, and with all the strength, and to love his neighbour as himself, is more than all whole burnt offerings and sacrifices.',
   'καὶ τὸ ἀγαπᾶν αὐτὸν ἐξ ὅλης τῆς καρδίας καὶ ἐξ ὅλης τῆς συνέσεως καὶ ἐξ ὅλης τῆς ψυχῆς καὶ ἐξ ὅλης τῆς ἰσχύος καὶ τὸ ἀγαπᾶν τὸν πλησίον ὡς ἑαυτόν πλεῖόν ἐστιν πάντων τῶν ὁλοκαυτωμάτων καὶ θυσιῶν',
   'kai to agapan auton ex holēs tēs kardias kai ex holēs tēs syneseōs kai ex holēs tēs psychēs kai ex holēs tēs ischyos kai to agapan ton plēsion hōs heauton pleion estin pantōn tōn holokautōmatōn kai thysiōn',
   '''More than all burnt offerings and sacrifices'' (pleion pantōn tōn holokautōmatōn kai thysiōn). The scribe echoes 1 Samuel 15:22 and Hosea 6:6 — obedience and love surpass ritual. This is remarkable: a scribe, speaking in the temple precincts, declares that love exceeds sacrifice. He has grasped what the temple establishment has missed — the interior reality matters more than the exterior ritual.',
   NULL),
  (34, 'And when Jesus saw that he answered discreetly, he said unto him, Thou art not far from the kingdom of God. And no man after that durst ask him any question.',
   'καὶ ὁ Ἰησοῦς ἰδὼν αὐτὸν ὅτι νουνεχῶς ἀπεκρίθη εἶπεν αὐτῷ οὐ μακρὰν εἶ ἀπὸ τῆς βασιλείας τοῦ θεοῦ καὶ οὐδεὶς οὐκέτι ἐτόλμα αὐτὸν ἐπερωτῆσαι',
   'kai ho Iēsous idōn auton hoti nounechōs apekrithē eipen autō ou makran ei apo tēs basileias tou theou kai oudeis ouketi etolma auton eperōtēsai',
   '''Discreetly'' (nounechōs — with understanding, wisely; a rare word, only here in the NT). ''Not far from the kingdom'' (ou makran — not distant). Jesus commends the scribe but notes he is ''not far'' — close, but not yet in. Understanding that love surpasses sacrifice brings you near the kingdom, but entrance requires a step further: faith in Jesus himself. ''No man durst ask him'' — Jesus has defeated every challenger, and no one dares try again.',
   'Jesus'' response to the scribe reveals an important theological principle: intellectual assent to correct doctrine brings one near the kingdom but does not guarantee entrance. The scribe understood the primacy of love over ritual — a profound insight. But ''not far'' implies something more is needed. In Mark''s Gospel, entrance into the kingdom requires faith in Jesus as the Christ (1:15; 8:29) and willingness to follow him (8:34-38; 10:21). The scribe is on the threshold — he has answered wisely about the law, but has he recognised the Lawgiver standing before him?'),
  (35, 'And Jesus answered and said, while he taught in the temple, How say the scribes that Christ is the son of David?',
   'καὶ ἀποκριθεὶς ὁ Ἰησοῦς ἔλεγεν διδάσκων ἐν τῷ ἱερῷ πῶς λέγουσιν οἱ γραμματεῖς ὅτι ὁ Χριστὸς υἱὸς Δαυίδ ἐστιν',
   'kai apokritheis ho Iēsous elegen didaskōn en tō hierō pōs legousin hoi grammateis hoti ho Christos huios Dauid estin',
   'Now Jesus takes the offensive — he poses his own question. ''Christ'' (ho Christos — the Messiah, the Anointed One). ''Son of David'' — the standard messianic title, rooted in God''s promise to David (2 Samuel 7:12-16). Jesus does not deny his Davidic descent but challenges the scribes'' understanding: if the Messiah is merely David''s descendant, how can David call him ''Lord''?',
   NULL),
  (36, 'For David himself said by the Holy Ghost, The LORD said to my Lord, Sit thou on my right hand, till I make thine enemies thy footstool.',
   'αὐτὸς γὰρ Δαυὶδ εἶπεν ἐν τῷ πνεύματι τῷ ἁγίῳ εἶπεν ὁ κύριος τῷ κυρίῳ μου κάθου ἐκ δεξιῶν μου ἕως ἂν θῶ τοὺς ἐχθρούς σου ὑποπόδιον τῶν ποδῶν σου',
   'autos gar Dauid eipen en tō pneumati tō hagiō eipen ho kyrios tō kyriō mou kathou ek dexiōn mou heōs an thō tous echthrous sou hypopodion tōn podōn sou',
   'Jesus quotes Psalm 110:1, the most-cited OT text in the NT. ''By the Holy Ghost'' (en tō pneumati tō hagiō — David spoke under divine inspiration). ''The LORD said to my Lord'' — in Hebrew, ''Yahweh said to my Adonai.'' David, the king, calls the Messiah ''my Lord'' — someone greater than himself. ''Right hand'' (ek dexiōn — the position of supreme honour and authority). ''Footstool'' — complete subjugation of enemies. The psalm presents a Messiah who shares God''s throne.',
   'This is one of the most important christological arguments in the Gospels. Jesus uses Psalm 110:1 — which all parties accepted as Davidic and messianic — to demonstrate that the Messiah must be more than a human descendant of David. The argument: (1) David, inspired by the Holy Spirit, wrote Psalm 110. (2) In it, David calls the Messiah ''my Lord'' (Adonai). (3) A father does not call his son ''my Lord'' — the son would call the father ''lord.'' (4) Therefore the Messiah, though David''s descendant, must be David''s superior — he must be divine. Jesus does not reject the ''Son of David'' title but transcends it: the Messiah is both David''s son (by human descent) and David''s Lord (by divine nature).'),
  (37, 'David therefore himself calleth him Lord; and whence is he then his son? And the common people heard him gladly.',
   'αὐτὸς οὖν Δαυὶδ λέγει αὐτὸν κύριον καὶ πόθεν υἱὸς αὐτοῦ ἐστιν καὶ ὁ πολὺς ὄχλος ἤκουεν αὐτοῦ ἡδέως',
   'autos oun Dauid legei auton kyrion kai pothen huios autou estin kai ho polys ochlos ēkouen autou hēdeōs',
   '''Whence is he then his son?'' (pothen huios autou estin — how then can he be merely his son?). ''The common people heard him gladly'' (ho polys ochlos ēkouen hēdeōs — the great crowd listened with delight). Jesus leaves the question unanswered — its very asking is the answer. The Messiah transcends Davidic categories. The crowd''s delight contrasts with the leaders'' hostility.',
   NULL),
  (38, 'And he said unto them in his doctrine, Beware of the scribes, which love to go in long clothing, and love salutations in the marketplaces,',
   'καὶ ἔλεγεν αὐτοῖς ἐν τῇ διδαχῇ αὐτοῦ βλέπετε ἀπὸ τῶν γραμματέων τῶν θελόντων ἐν στολαῖς περιπατεῖν καὶ ἀσπασμοὺς ἐν ταῖς ἀγοραῖς',
   'kai elegen autois en tē didachē autou blepete apo tōn grammateōn tōn thelontōn en stolais peripatein kai aspasmous en tais agorais',
   '''Beware'' (blepete apo — watch out for, be on guard against). ''Long clothing'' (stolais — long robes, the flowing garments of the learned class, designed to attract attention and signal importance). ''Salutations'' (aspasmous — formal greetings; elaborate public recognition as ''Rabbi'' or ''Master''). Jesus warns against the scribes'' love of status — they use religion for social prestige.',
   NULL),
  (39, 'And the chief seats in the synagogues, and the uppermost rooms at feasts:',
   'καὶ πρωτοκαθεδρίας ἐν ταῖς συναγωγαῖς καὶ πρωτοκλισίας ἐν τοῖς δείπνοις',
   'kai prōtokathedrias en tais synagōgais kai prōtoklisias en tois deipnois',
   '''Chief seats'' (prōtokathedrias — the front seats in the synagogue, facing the congregation; seats of honour). ''Uppermost rooms'' (prōtoklisias — the best couches at banquets, reclining positions nearest the host). The scribes crave visible, public honour. Their religion is a performance for human audiences, not an offering to God.',
   NULL),
  (40, 'Which devour widows'' houses, and for a pretence make long prayers: these shall receive greater damnation.',
   'οἱ κατεσθίοντες τὰς οἰκίας τῶν χηρῶν καὶ προφάσει μακρὰ προσευχόμενοι οὗτοι λήψονται περισσότερον κρίμα',
   'hoi katesthiontes tas oikias tōn chērōn kai prophasei makra proseuchomenoi houtoi lēmpsontai perissoteron krima',
   '''Devour widows'' houses'' (katesthiontes tas oikias tōn chērōn — consuming, eating up the estates of widows; possibly through exploitative legal fees, or by manipulating widows into donating their homes to the temple). ''For a pretence'' (prophasei — as a cover, for show). ''Long prayers'' — their extended prayers are camouflage for financial exploitation. ''Greater damnation'' (perissoteron krima — more severe judgment). Using religion to exploit the vulnerable is the worst form of hypocrisy.',
   'This verse directly sets up the widow''s mites story (vv.41-44). The scribes ''devour widows'' houses'' — and immediately after, Jesus watches a poor widow give her last two coins to the temple treasury. The juxtaposition is devastating: the very institution the scribes represent has consumed this widow''s livelihood. Jesus does not praise the temple system that impoverished her — he observes the contrast between her genuine devotion and the scribes'' predatory piety. ''Greater damnation'' warns that religious leaders face stricter judgment because they use sacred authority for personal gain.'),
  (41, 'And Jesus sat over against the treasury, and beheld how the people cast money into the treasury: and many that were rich cast in much.',
   'καὶ καθίσας ὁ Ἰησοῦς κατέναντι τοῦ γαζοφυλακίου ἐθεώρει πῶς ὁ ὄχλος βάλλει χαλκὸν εἰς τὸ γαζοφυλάκιον καὶ πολλοὶ πλούσιοι ἔβαλλον πολλά',
   'kai kathisas ho Iēsous katenanti tou gazophylakiou etheōrei pōs ho ochlos ballei chalkon eis to gazophylakion kai polloi plousioi eballon polla',
   '''Over against the treasury'' (katenanti tou gazophylakiou — facing the treasury, the offering receptacles in the Court of Women). ''Beheld how'' (etheōrei pōs — watched with attention how people gave; not just what, but how). ''Many that were rich cast in much'' (polloi plousioi eballon polla — many wealthy people threw in large amounts). Jesus is an observer of giving — he watches not just the amount but the spirit behind it.',
   NULL),
  (42, 'And there came a certain poor widow, and she threw in two mites, which make a farthing.',
   'καὶ ἐλθοῦσα μία χήρα πτωχὴ ἔβαλεν λεπτὰ δύο ὅ ἐστιν κοδράντης',
   'kai elthousa mia chēra ptōchē ebalen lepta dyo ho estin kodrantēs',
   '''Poor widow'' (chēra ptōchē — a destitute widow; ptōchē means abjectly poor, not just modest). ''Two mites'' (lepta dyo — two leptons, the smallest coins in circulation, each worth half a Roman quadrans). ''A farthing'' (kodrantēs — quadrans; Mark explains the value for his Gentile readers). Two leptons — the combined value could barely buy a crumb of bread. She could have kept one for herself. She gave both.',
   NULL),
  (43, 'And he called unto him his disciples, and saith unto them, Verily I say unto you, That this poor widow hath cast more in, than all they which have cast into the treasury:',
   'καὶ προσκαλεσάμενος τοὺς μαθητὰς αὐτοῦ λέγει αὐτοῖς ἀμὴν λέγω ὑμῖν ὅτι ἡ χήρα αὕτη ἡ πτωχὴ πλεῖον πάντων βέβληκεν τῶν βαλόντων εἰς τὸ γαζοφυλάκιον',
   'kai proskalesamenos tous mathētas autou legei autois amēn legō hymin hoti hē chēra hautē hē ptōchē pleion pantōn beblēken tōn balontōn eis to gazophylakion',
   '''Called his disciples'' (proskalesamenos — summoned them deliberately; this is a teaching moment). ''Verily'' (amēn — truly; a solemn affirmation). ''Cast more in than all'' (pleion pantōn beblēken — has thrown in more than everyone combined). Jesus recalculates the math: God measures giving not by the size of the gift but by what remains after giving. The widow gave infinitely more because she gave everything.',
   NULL),
  (44, 'For all they did cast in of their abundance; but she of her want did cast in all that she had, even all her living.',
   'πάντες γὰρ ἐκ τοῦ περισσεύοντος αὐτοῖς ἔβαλον αὕτη δὲ ἐκ τῆς ὑστερήσεως αὐτῆς πάντα ὅσα εἶχεν ἔβαλεν ὅλον τὸν βίον αὐτῆς',
   'pantes gar ek tou perisseuontos autois ebalon hautē de ek tēs hysterēseōs autēs panta hosa eichen ebalen holon ton bion autēs',
   '''Of their abundance'' (ek tou perisseuontos — out of their surplus, their overflow). ''Of her want'' (ek tēs hysterēseōs — out of her deficiency, her poverty). ''All that she had'' (panta hosa eichen — everything she possessed). ''Even all her living'' (holon ton bion autēs — her entire livelihood, her whole means of subsistence). The rich gave from excess — their lifestyle was unaffected. The widow gave from necessity — she had nothing left. She entrusted her survival to God.',
   'The widow''s mites episode is the climax of Mark 12 and the conclusion of Jesus'' public ministry before the Olivet Discourse (chapter 13). God''s economy of giving inverts human calculations: the largest gifts may represent the smallest sacrifice, while two tiny coins may represent total self-abandonment to God. ''All her living'' (holon ton bion) means she gave her life — the same word (bios) used for life itself. This foreshadows Jesus'' own total self-giving on the cross. The contrast between the scribes who ''devour widows'' houses'' (v.40) and this widow who gives everything she has is Mark''s sharpest critique of institutional religion that exploits the vulnerable while a genuine worshipper gives all she has.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 12;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 vineyard
  ('ἀμπελών', 'ampelōn', 'G290', 'Vineyard — from ampelos (grapevine). In the OT, the vineyard is a consistent symbol for Israel (Isaiah 5:1-7; Jeremiah 12:10; Ezekiel 15:6). God ''planted'' Israel, tended it, and expected fruit. Jesus'' use of this imagery directly evokes Isaiah 5, where God''s vineyard produces wild grapes despite every provision. The vineyard parable exposes the stewardship failure of Israel''s leaders — they were entrusted with God''s vineyard but seized it for themselves.', 1),
  -- v.10 cornerstone
  ('κεφαλὴ γωνίας', 'kephalē gōnias', 'G2776/G1137', 'Head of the corner, cornerstone — kephalē (head, chief) + gōnia (corner, angle). Either the foundation cornerstone (which determines the alignment of the entire building) or the capstone/keystone (which crowns and locks the structure). In either case, it is the most important stone. Psalm 118:22 prophesied that the stone rejected by the professional builders would become the most critical element of God''s building. Jesus is the stone the religious builders examined, tested, and rejected — yet God made him the cornerstone of the new temple, the church (Ephesians 2:20; 1 Peter 2:6-7).', 2),
  -- v.15 hypocrisy
  ('ὑπόκρισις', 'hypokrisis', 'G5272', 'Hypocrisy, play-acting, pretence — from hypokrinomai (to play a part on stage, to wear a mask). In Greek theatre, the hypokritēs was an actor who wore a mask. Jesus perceives that his questioners are wearing masks — their flattery is a script, their question a trap. Hypocrisy in the NT is not merely inconsistency between belief and behaviour but deliberate deception: using religious language to pursue irreligious goals. The Pharisees and Herodians perform sincerity while plotting destruction.', 3),
  -- v.17 render/give back
  ('ἀποδίδωμι', 'apodidōmi', 'G591', 'To give back, render, return what is owed — from apo (back, away) + didōmi (to give). Not a gift but a debt payment: returning to someone what rightfully belongs to them. The coin bears Caesar''s image (eikōn) and inscription, so it belongs to Caesar''s domain — give it back. But the person bears God''s image (Genesis 1:27), so the whole self belongs to God — give yourself back. Apodidōmi transforms the tax question into a question about total allegiance: what do you owe God, and have you paid it?', 4),
  -- v.25 angels
  ('ἄγγελος', 'angelos', 'G32', 'Angel, messenger — from angellō (to announce, to bring a message). In the resurrection, humans will be ''as the angels'' (hōs angeloi) — not that they become angels but that they share certain angelic characteristics: immortality, freedom from death, and the absence of marriage and procreation. The comparison highlights the qualitative difference between this age and the age to come. Resurrection life is not earthly life extended but earthly life transformed — a new mode of existence where mortality and its institutions are transcended.', 5),
  -- v.29 Shema / one Lord
  ('εἷς', 'heis', 'G1520', 'One — the cardinal number, emphasising God''s absolute unity and uniqueness. The Shema (Deuteronomy 6:4) is Israel''s fundamental confession: ''The Lord our God is one Lord.'' Heis declares that God is the only God — there is no other. This monotheistic conviction is the foundation of the greatest commandment: because God is one and unique, he deserves total, undivided love. All idolatry is a violation of the Shema. Jesus'' citation of the Shema as the first commandment grounds ethics in theology — who God is determines what we owe him.', 6),
  -- v.30 love
  ('ἀγαπάω', 'agapaō', 'G25', 'To love with deliberate, volitional commitment — not merely emotional affection (phileō) but a choice to value and devote oneself to another. Agapaō is the verb God uses of his love for humanity (John 3:16) and the verb Jesus commands for love of God and neighbour. It encompasses heart (will), soul (life), mind (intellect), and strength (action). This love is not a feeling to be waited for but a commitment to be made — a total orientation of the person toward God and toward others. It is the opposite of the scribes'' self-love (vv.38-40).', 7),
  -- v.42 mite/lepton
  ('λεπτόν', 'lepton', 'G3016', 'A lepton (mite) — the smallest and thinnest coin in circulation, from leptos (thin, small, fine). Worth approximately 1/128 of a denarius (a day''s wage). Two lepta equalled one Roman quadrans (kodrantēs). In human economics, the widow''s gift was negligible — it could not buy anything meaningful. In God''s economy, it was the largest gift that day because it represented total self-surrender. The lepton teaches that God measures generosity not by the amount given but by the amount retained. The widow retained nothing.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 12
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 10
    WHEN 3 THEN 15
    WHEN 4 THEN 17
    WHEN 5 THEN 25
    WHEN 6 THEN 29
    WHEN 7 THEN 30
    WHEN 8 THEN 42
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 vineyard parable
  (1, 'Isaiah 5:1-7', 1),
  (1, 'Matthew 21:33-46', 2),
  (1, 'Luke 20:9-19', 3),
  -- v.6 beloved son
  (6, 'Mark 1:11', 4),
  (6, 'Mark 9:7', 5),
  (6, 'John 3:16', 6),
  -- v.9 give vineyard to others
  (9, 'Matthew 8:11-12', 7),
  (9, 'Acts 13:46', 8),
  -- v.10 the stone rejected
  (10, 'Psalm 118:22-23', 9),
  (10, 'Acts 4:11', 10),
  (10, '1 Peter 2:6-7', 11),
  (10, 'Ephesians 2:20', 12),
  -- v.14 tribute to Caesar
  (14, 'Matthew 22:15-22', 13),
  (14, 'Luke 20:20-26', 14),
  -- v.17 render to Caesar
  (17, 'Romans 13:1-7', 15),
  (17, '1 Peter 2:13-17', 16),
  (17, 'Genesis 1:27', 17),
  -- v.19 levirate marriage
  (19, 'Deuteronomy 25:5-6', 18),
  (19, 'Genesis 38:8', 19),
  -- v.25 like angels
  (25, '1 Corinthians 15:42-49', 20),
  (25, 'Philippians 3:21', 21),
  -- v.26 God of Abraham
  (26, 'Exodus 3:6', 22),
  (26, 'Hebrews 11:16', 23),
  -- v.29 the Shema
  (29, 'Deuteronomy 6:4-5', 24),
  -- v.30 love God with all
  (30, 'Matthew 22:37-38', 25),
  (30, 'Luke 10:27', 26),
  -- v.31 love thy neighbour
  (31, 'Leviticus 19:18', 27),
  (31, 'Romans 13:9-10', 28),
  (31, 'Galatians 5:14', 29),
  (31, 'James 2:8', 30),
  -- v.33 more than sacrifices
  (33, '1 Samuel 15:22', 31),
  (33, 'Hosea 6:6', 32),
  (33, 'Micah 6:6-8', 33),
  -- v.36 Psalm 110
  (36, 'Psalm 110:1', 34),
  (36, 'Acts 2:34-36', 35),
  (36, 'Hebrews 1:13', 36),
  -- v.40 devour widows houses
  (40, 'Ezekiel 22:25', 37),
  (40, 'James 1:27', 38),
  -- v.42 widows mites
  (42, '2 Corinthians 8:12', 39),
  (42, '2 Corinthians 9:7', 40),
  -- v.44 all her living
  (44, 'Luke 21:1-4', 41),
  (44, 'Philippians 4:19', 42)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 12
  AND v.verse_number = cr.verse_number;
