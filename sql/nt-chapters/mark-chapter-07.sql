-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 7 — Traditions, True Defilement, and Gentile Faith
-- 37 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  'Mark 7 marks a pivotal turning point in Jesus'' ministry, shifting from controversy with Jewish leaders to outreach among Gentiles. The chapter opens with Pharisees and scribes from Jerusalem confronting Jesus because his disciples eat bread with unwashed (''defiled'') hands (vv.1-5). Mark explains for his Gentile audience the Jewish tradition of ceremonial washing (vv.3-4). Jesus responds with devastating force, quoting Isaiah 29:13: ''This people honoureth me with their lips, but their heart is far from me'' (v.6). He accuses them of ''laying aside the commandment of God'' to hold their own traditions (v.8), and gives the specific example of Corban — dedicating money to the temple to avoid supporting one''s parents, thus ''making the word of God of none effect'' (vv.9-13). Jesus then teaches the crowd a revolutionary principle: ''There is nothing from without a man, that entering into him can defile him: but the things which come out of him, those are the things that defile the man'' (v.15). Privately, he explains to the disciples that food enters the stomach and is expelled — ''purging all meats'' (v.19), a parenthetical comment with enormous implications for the abolition of dietary laws. True defilement comes from within: ''evil thoughts, adulteries, fornications, murders'' and a catalogue of sins that proceed from the human heart (vv.20-23). Jesus then withdraws into Gentile territory near Tyre, where a Syrophoenician woman begs him to cast a demon out of her daughter (vv.24-30). Her witty, faith-filled response to Jesus'' test — ''Yes, Lord: yet the dogs under the table eat of the children''s crumbs'' — wins the miracle. The chapter closes in the Decapolis region, where Jesus heals a deaf man with a speech impediment using physical gestures (fingers in ears, spittle on tongue) and the Aramaic command ''Ephphatha'' (''Be opened,'' vv.31-37). The crowd''s verdict: ''He hath done all things well: he maketh both the deaf to hear, and the dumb to speak'' (v.37) — echoing Isaiah 35:5-6 and Genesis 1:31.',
  'What Truly Defiles — Heart Over Ritual, and Grace Beyond Israel''s Borders',
  'κοινός (koinos)',
  'Common, defiled, unclean — from koinoō (to make common or profane). In Jewish usage, koinos describes anything ritually impure through contact or failure to observe ceremonial washing. Jesus redefines defilement: it is not external contamination but internal corruption. What makes a person ''common'' before God is not unwashed hands but an unwashed heart.',
  '["Pharisaic Tradition vs. God''s Commandment (vv.1-13): The Pharisees challenge Jesus over unwashed hands. He exposes their hypocrisy — honouring God with lips while their heart is far away. The Corban example shows how tradition can nullify God''s word. Man-made rules substituted for divine commands","The Revolutionary Teaching on Defilement (vv.14-23): Nothing entering from outside defiles a person. Defilement comes from within the heart — evil thoughts adulteries fornications murders thefts covetousness wickedness deceit lasciviousness an evil eye blasphemy pride foolishness. All these evil things come from within and defile the man","The Syrophoenician Woman''s Faith (vv.24-30): In Gentile territory near Tyre a Greek woman begs for her daughter''s deliverance. Jesus tests her with the children-and-dogs metaphor. Her humble witty reply — the dogs under the table eat the children''s crumbs — demonstrates extraordinary faith and wins the miracle. The gospel crosses ethnic boundaries","Healing the Deaf and Mute in Decapolis (vv.31-37): Jesus heals a deaf man with a speech impediment using touch and the Aramaic Ephphatha (Be opened). The crowd declares He hath done all things well — echoing creation''s verdict and fulfilling Isaiah 35:5-6. Messianic signs among Gentiles"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 37 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Then came together unto him the Pharisees, and certain of the scribes, which came from Jerusalem.',
   'καὶ συνάγονται πρὸς αὐτὸν οἱ Φαρισαῖοι καί τινες τῶν γραμματέων ἐλθόντες ἀπὸ Ἱεροσολύμων',
   'kai synangontai pros auton hoi Pharisaioi kai tines tōn grammateōn elthontes apo Hierosolymōn',
   'The delegation is official — scribes ''from Jerusalem'' indicates a formal investigation. The Pharisees and scribes form an alliance against Jesus, combining theological expertise with institutional authority. This is not a casual encounter but a calculated confrontation.',
   NULL),
  (2, 'And when they saw some of his disciples eat bread with defiled, that is to say, with unwashen, hands, they found fault.',
   'καὶ ἰδόντες τινὰς τῶν μαθητῶν αὐτοῦ κοιναῖς χερσίν τοῦτ᾿ ἔστιν ἀνίπτοις ἐσθίοντας ἄρτους ἐμέμψαντο',
   'kai idontes tinas tōn mathētōn autou koinais chersin tout estin aniptois esthiontas artous emempsanto',
   '''Defiled'' (koinais — common, ritually unclean; not physically dirty but ceremonially impure). ''Unwashen'' (aniptois — unwashed; Mark explains the technical Jewish term for his Gentile readers). ''Found fault'' (emempsanto — blamed, censured). The issue is not hygiene but ritual purity.',
   NULL),
  (3, 'For the Pharisees, and all the Jews, except they wash their hands oft, eat not, holding the tradition of the elders.',
   'οἱ γὰρ Φαρισαῖοι καὶ πάντες οἱ Ἰουδαῖοι ἐὰν μὴ πυγμῇ νίψωνται τὰς χεῖρας οὐκ ἐσθίουσιν κρατοῦντες τὴν παράδοσιν τῶν πρεσβυτέρων',
   'hoi gar Pharisaioi kai pantes hoi Ioudaioi ean mē pygmē nipsōntai tas cheiras ouk esthiousin kratountes tēn paradosin tōn presbyterōn',
   '''Oft'' (pygmē — literally ''with the fist,'' meaning vigorously or up to the wrist; a specific washing technique). ''Tradition of the elders'' (paradosin tōn presbyterōn — the oral law passed down from previous generations, later codified in the Mishnah). Mark explains Jewish customs for his Roman audience. These traditions were not in the Torah but were treated as equally binding.',
   NULL),
  (4, 'And when they come from the market, except they wash, they eat not. And many other things there be, which they have received to hold, as the washing of cups, and pots, brasen vessels, and of tables.',
   'καὶ ἀπὸ ἀγορᾶς ἐὰν μὴ βαπτίσωνται οὐκ ἐσθίουσιν καὶ ἄλλα πολλά ἐστιν ἃ παρέλαβον κρατεῖν βαπτισμοὺς ποτηρίων καὶ ξεστῶν καὶ χαλκίων καὶ κλινῶν',
   'kai apo agoras ean mē baptisōntai ouk esthiousin kai alla polla estin ha parelabon kratein baptismous potēriōn kai xestōn kai chalkiōn kai klinōn',
   '''Wash'' (baptisōntai — immerse themselves; a full ritual immersion after visiting the marketplace where contact with Gentiles or unclean persons might have occurred). ''Washing'' (baptismous — ritual immersions, ceremonial washings). The proliferation of ritual washings for cups, pots, bronze vessels, and even dining couches illustrates the elaborate purity system that had developed beyond Scripture.',
   NULL),
  (5, 'Then the Pharisees and scribes asked him, Why walk not thy disciples according to the tradition of the elders, but eat bread with unwashen hands?',
   'ἔπειτα ἐπερωτῶσιν αὐτὸν οἱ Φαρισαῖοι καὶ οἱ γραμματεῖς διὰ τί οὐ περιπατοῦσιν οἱ μαθηταί σου κατὰ τὴν παράδοσιν τῶν πρεσβυτέρων ἀλλὰ κοιναῖς χερσὶν ἐσθίουσιν τὸν ἄρτον',
   'epeita eperōtōsin auton hoi Pharisaioi kai hoi grammateis dia ti ou peripatousin hoi mathētai sou kata tēn paradosin tōn presbyterōn alla koinais chersin esthiousin ton arton',
   '''Walk'' (peripatousin — conduct themselves, live). The Pharisees frame the question in terms of the disciples'' lifestyle (''walk''), not a single incident. ''According to the tradition'' — they appeal to the oral law''s authority. The question assumes the tradition of the elders has binding authority equal to or greater than Scripture itself.',
   NULL),
  (6, 'He answered and said unto them, Well hath Esaias prophesied of you hypocrites, as it is written, This people honoureth me with their lips, but their heart is far from me.',
   'ὁ δὲ ἀποκριθεὶς εἶπεν αὐτοῖς ὅτι καλῶς ἐπροφήτευσεν Ἠσαΐας περὶ ὑμῶν τῶν ὑποκριτῶν ὡς γέγραπται οὗτος ὁ λαὸς τοῖς χείλεσίν με τιμᾷ ἡ δὲ καρδία αὐτῶν πόρρω ἀπέχει ἀπ᾿ ἐμοῦ',
   'ho de apokritheis eipen autois hoti kalōs eprophēteusen Ēsaias peri hymōn tōn hypokritōn hōs gegraptai houtos ho laos tois cheilesin me tima hē de kardia autōn porrō apechei ap emou',
   '''Hypocrites'' (hypokritōn — actors, pretenders; originally used of stage actors who wore masks). Jesus quotes Isaiah 29:13 (LXX). ''Honoureth me with their lips'' — external religious performance. ''Heart far from me'' — internal spiritual distance. The devastating charge: their religion is performance, not relationship. This is the fundamental definition of hypocrisy: lips and heart in opposite directions.',
   'Jesus'' use of Isaiah 29:13 establishes a permanent principle: God evaluates worship by the heart, not by outward conformity. Religious ritual without heart devotion is not merely inadequate but offensive — it is hypocrisy. This text became foundational for the Reformation''s critique of externalism in religion and remains relevant wherever religious traditions substitute for genuine faith.'),
  (7, 'Howbeit in vain do they worship me, teaching for doctrines the commandments of men.',
   'μάτην δὲ σέβονταί με διδάσκοντες διδασκαλίας ἐντάλματα ἀνθρώπων',
   'matēn de sebontai me didaskontes didaskalias entalmata anthrōpōn',
   '''In vain'' (matēn — to no purpose, futilely). ''Worship'' (sebontai — revere, pay religious homage). ''Doctrines'' (didaskalias — teachings, instructions). ''Commandments of men'' (entalmata anthrōpōn — human precepts). Worship that teaches human rules as divine commands is vain — it achieves nothing before God. The most elaborate religious system is worthless if built on human authority rather than God''s word.',
   NULL),
  (8, 'For laying aside the commandment of God, ye hold the tradition of men, as the washing of pots and cups: and many other such like things ye do.',
   'ἀφέντες γὰρ τὴν ἐντολὴν τοῦ θεοῦ κρατεῖτε τὴν παράδοσιν τῶν ἀνθρώπων βαπτισμοὺς ξεστῶν καὶ ποτηρίων καὶ ἄλλα παρόμοια τοιαῦτα πολλὰ ποιεῖτε',
   'aphentes gar tēn entolēn tou theou krateite tēn paradosin tōn anthrōpōn baptismous xestōn kai potēriōn kai alla paromoia toiauta polla poieite',
   '''Laying aside'' (aphentes — abandoning, letting go). ''Hold'' (krateite — grip tightly, hold fast). The tragic irony: they release God''s command and grip human tradition. Jesus intensifies the charge — this is not mere addition to Scripture but active substitution. They have traded the divine for the human.',
   NULL),
  (9, 'And he said unto them, Full well ye reject the commandment of God, that ye may keep your own tradition.',
   'καὶ ἔλεγεν αὐτοῖς καλῶς ἀθετεῖτε τὴν ἐντολὴν τοῦ θεοῦ ἵνα τὴν παράδοσιν ὑμῶν τηρήσητε',
   'kai elegen autois kalōs atheteite tēn entolēn tou theou hina tēn paradosin hymōn tērēsēte',
   '''Full well'' (kalōs — an ironic ''how nicely,'' ''how expertly''). ''Reject'' (atheteite — set aside, nullify, treat as invalid). ''Keep'' (tērēsēte — observe, guard carefully). The sarcasm is biting: you are experts at annulling God''s commandment in order to establish your own tradition. ''Your own'' (hymōn) — Jesus will not even call it ''the tradition of the elders'' anymore; it is their invention.',
   NULL),
  (10, 'For Moses said, Honour thy father and thy mother; and, Whoso curseth father or mother, let him die the death:',
   'Μωϋσῆς γὰρ εἶπεν τίμα τὸν πατέρα σου καὶ τὴν μητέρα σου καί ὁ κακολογῶν πατέρα ἢ μητέρα θανάτῳ τελευτάτω',
   'Mōysēs gar eipen tima ton patera sou kai tēn mētera sou kai ho kakologōn patera ē mētera thanatō teleutatō',
   'Jesus appeals to Moses — the highest authority in Judaism — quoting the fifth commandment (Exodus 20:12) and its sanction (Exodus 21:17). ''Honour'' (tima — value, prize, provide for; includes financial support). ''Curseth'' (kakologōn — speaks evil of, reviles). The death penalty for cursing parents shows how seriously God views parental honour.',
   NULL),
  (11, 'But ye say, If a man shall say to his father or mother, It is Corban, that is to say, a gift, by whatsoever thou mightest be profited by me; he shall be free.',
   'ὑμεῖς δὲ λέγετε ἐὰν εἴπῃ ἄνθρωπος τῷ πατρὶ ἢ τῇ μητρί κορβᾶν ὅ ἐστιν δῶρον ὃ ἐὰν ἐξ ἐμοῦ ὠφεληθῇς',
   'hymeis de legete ean eipē anthrōpos tō patri ē tē mētri korban ho estin dōron ho ean ex emou ōphelēthēs',
   '''Corban'' (korban — an offering, something dedicated to God; a Hebrew/Aramaic term Mark translates as dōron, ''gift''). By declaring possessions ''Corban,'' a person could dedicate them to the temple while retaining personal use — effectively shielding assets from family obligations. The tradition created a legal loophole to avoid the fifth commandment.',
   'The Corban practice illustrates how religious systems can be manipulated to circumvent moral obligations. A son could pronounce his property ''Corban'' (devoted to God) and thereby claim exemption from supporting his parents — even though the property remained in his own use. Jesus exposes this as using religion to avoid genuine duty. This principle applies whenever religious obligations are invoked to escape clear moral responsibilities.'),
  (12, 'And ye suffer him no more to do ought for his father or his mother;',
   'καὶ οὐκέτι ἀφίετε αὐτὸν οὐδὲν ποιῆσαι τῷ πατρὶ αὐτοῦ ἢ τῇ μητρὶ αὐτοῦ',
   'kai ouketi aphiete auton ouden poiēsai tō patri autou ē tē mētri autou',
   '''Suffer him no more'' (ouketi aphiete — you no longer permit). The tradition was enforced: once the Corban vow was made, the rabbis did not allow the person to reverse it, even if he recognized his obligation to his parents. The tradition trapped people in their evasion of God''s law.',
   NULL),
  (13, 'Making the word of God of none effect through your tradition, which ye have delivered: and many such like things do ye.',
   'ἀκυροῦντες τὸν λόγον τοῦ θεοῦ τῇ παραδόσει ὑμῶν ᾗ παρεδώκατε καὶ παρόμοια τοιαῦτα πολλὰ ποιεῖτε',
   'akyrountes ton logon tou theou tē paradosei hymōn hē paredōkate kai paromoia toiauta polla poieite',
   '''Making of none effect'' (akyrountes — invalidating, annulling, rendering void; a legal term for cancelling a contract). ''Word of God'' versus ''your tradition'' — the contrast is absolute. ''Many such like things'' — the Corban example is just one illustration; the problem is systemic. Human tradition has annulled divine revelation.',
   NULL),
  (14, 'And when he had called all the people unto him, he said unto them, Hearken unto me every one of you, and understand:',
   'καὶ προσκαλεσάμενος πάντα τὸν ὄχλον ἔλεγεν αὐτοῖς ἀκούσατέ μου πάντες καὶ σύνετε',
   'kai proskalesamenos panta ton ochlon elegen autois akousate mou pantes kai synete',
   '''Called all the people'' — Jesus moves from the private dispute with Pharisees to public teaching. ''Hearken'' (akousate — listen, hear). ''Understand'' (synete — comprehend, put together mentally). The double imperative signals the importance of what follows: Jesus is about to overturn centuries of purity legislation.',
   NULL),
  (15, 'There is nothing from without a man, that entering into him can defile him: but the things which come out of him, those are the things that defile the man.',
   'οὐδέν ἐστιν ἔξωθεν τοῦ ἀνθρώπου εἰσπορευόμενον εἰς αὐτὸν ὃ δύναται αὐτὸν κοινῶσαι ἀλλὰ τὰ ἐκ τοῦ ἀνθρώπου ἐκπορευόμενά ἐστιν τὰ κοινοῦντα τὸν ἄνθρωπον',
   'ouden estin exōthen tou anthrōpou eisporeuomenon eis auton ho dynatai auton koinōsai alla ta ek tou anthrōpou ekporeuomena estin ta koinounta ton anthrōpon',
   '''Nothing from without'' (ouden exōthen — nothing external). ''Defile'' (koinōsai — make common, render unclean). ''Things which come out'' (ta ekporeuomena — what proceeds from). This is one of the most revolutionary statements in the Gospels: defilement is relocated from the external to the internal, from the ritual to the moral. Jesus overturns the entire purity system with a single sentence.',
   'This verse is a theological earthquake. By declaring that nothing external can defile a person, Jesus challenges the entire Levitical food law system and the oral tradition built upon it. The implications were so radical that even the disciples needed private explanation (v.17). This teaching becomes the theological basis for Peter''s vision in Acts 10:9-16 and Paul''s declaration that ''there is nothing unclean of itself'' (Romans 14:14). Defilement is a matter of the heart, not the diet.'),
  (16, 'If any man have ears to hear, let him hear.',
   'εἴ τις ἔχει ὦτα ἀκούειν ἀκουέτω',
   'ei tis echei ōta akouein akouetō',
   'A formulaic call to spiritual perception, used repeatedly by Jesus (cf. 4:9, 23). The implied warning: this teaching is so counter-cultural that many will refuse to accept it. Having physical ears is not enough — one must have spiritual ears willing to receive revolutionary truth.',
   NULL),
  (17, 'And when he was entered into the house from the people, his disciples asked him concerning the parable.',
   'καὶ ὅτε εἰσῆλθεν εἰς οἶκον ἀπὸ τοῦ ὄχλου ἐπηρώτων αὐτὸν οἱ μαθηταὶ αὐτοῦ τὴν παραβολήν',
   'kai hote eisēlthen eis oikon apo tou ochlou epērōtōn auton hoi mathētai autou tēn parabolēn',
   '''The parable'' (tēn parabolēn — the comparison, the figurative saying). The disciples need private explanation, a recurring pattern in Mark (cf. 4:10, 34). The public-private teaching dynamic reveals the progressive nature of discipleship: public proclamation followed by private clarification.',
   NULL),
  (18, 'And he saith unto them, Are ye so without understanding also? Do ye not perceive, that whatsoever thing from without entereth into the man, it cannot defile him;',
   'καὶ λέγει αὐτοῖς οὕτως καὶ ὑμεῖς ἀσύνετοί ἐστε οὐ νοεῖτε ὅτι πᾶν τὸ ἔξωθεν εἰσπορευόμενον εἰς τὸν ἄνθρωπον οὐ δύναται αὐτὸν κοινῶσαι',
   'kai legei autois houtōs kai hymeis asynetoi este ou noeite hoti pan to exōthen eisporeuomenon eis ton anthrōpon ou dynatai auton koinōsai',
   '''Without understanding'' (asynetoi — lacking comprehension). ''Do ye not perceive'' (ou noeite — do you not grasp?). Jesus is surprised at their slowness: even the disciples, who have been given ''the mystery of the kingdom'' (4:11), struggle with this teaching. The abolition of the clean/unclean food distinction was deeply counter-intuitive for Jews.',
   NULL),
  (19, 'Because it entereth not into his heart, but into the belly, and goeth out into the draught, purging all meats?',
   'ὅτι οὐκ εἰσπορεύεται αὐτοῦ εἰς τὴν καρδίαν ἀλλ᾿ εἰς τὴν κοιλίαν καὶ εἰς τὸν ἀφεδρῶνα ἐκπορεύεται καθαρίζον πάντα τὰ βρώματα',
   'hoti ouk eisporeuetai autou eis tēn kardian all eis tēn koilian kai eis ton aphedrōna ekporeuetai katharizon panta ta brōmata',
   '''Heart'' (kardian — the seat of moral and spiritual life). ''Belly'' (koilian — stomach). ''Draught'' (aphedrōna — latrine, toilet). ''Purging all meats'' (katharizon panta ta brōmata — cleansing all foods). The parenthetical ''purging all meats'' is Mark''s editorial comment (or Jesus'' own declaration): the entire food law system is declared obsolete. Food goes through the digestive system, not through the moral centre of a person.',
   'The phrase ''purging all meats'' (katharizon panta ta brōmata) is one of the most consequential parenthetical comments in Scripture. Whether this is Mark''s editorial gloss or Jesus'' own words, it declares all foods clean. This became the basis for the early church''s abandonment of Jewish dietary laws (Acts 10:15; 15:28-29; Romans 14:14, 20; 1 Timothy 4:3-5). Jesus here does what no rabbi would dare: he overturns Levitical food laws by his own authority — an implicit claim to divine authority over the Torah itself.'),
  (20, 'And he said, That which cometh out of the man, that defileth the man.',
   'ἔλεγεν δὲ ὅτι τὸ ἐκ τοῦ ἀνθρώπου ἐκπορευόμενον ἐκεῖνο κοινοῖ τὸν ἄνθρωπον',
   'elegen de hoti to ek tou anthrōpou ekporeuomenon ekeino koinoi ton anthrōpon',
   'Jesus restates the principle: defilement is an inside-out problem, not an outside-in problem. What proceeds from within — from the heart — is what makes a person unclean before God. This relocates the entire purity discussion from the ceremonial to the moral sphere.',
   NULL),
  (21, 'For from within, out of the heart of men, proceed evil thoughts, adulteries, fornications, murders,',
   'ἔσωθεν γὰρ ἐκ τῆς καρδίας τῶν ἀνθρώπων οἱ διαλογισμοὶ οἱ κακοὶ ἐκπορεύονται μοιχεῖαι πορνεῖαι φόνοι',
   'esōthen gar ek tēs kardias tōn anthrōpōn hoi dialogismoi hoi kakoi ekporeuontai moicheiai porneiai phonoi',
   '''From within'' (esōthen — from inside). ''Heart'' (kardias — the centre of human personality, will, and moral life). ''Evil thoughts'' (dialogismoi kakoi — wicked reasonings). Then six plural nouns naming specific sins: adulteries (moicheiai), fornications (porneiai), murders (phonoi). The catalogue begins with sins of thought, then moves to sexual sins and violence. The heart is the factory of sin.',
   'This vice catalogue (vv.21-22) is one of Jesus'' clearest statements on human depravity. Sin is not primarily a matter of environment, upbringing, or external contamination — it originates in the human heart. This aligns with Jeremiah 17:9 (''The heart is deceitful above all things, and desperately wicked'') and anticipates Paul''s teaching on the flesh (Galatians 5:19-21). The doctrine of original sin finds support here: the heart itself is the source of all evil.'),
  (22, 'Thefts, covetousness, wickedness, deceit, lasciviousness, an evil eye, blasphemy, pride, foolishness:',
   'κλοπαί πλεονεξίαι πονηρίαι δόλος ἀσέλγεια ὀφθαλμὸς πονηρός βλασφημία ὑπερηφανία ἀφροσύνη',
   'klopai pleonexiai ponēriai dolos aselgeia ophthalmos ponēros blasphēmia hyperēphania aphrosynē',
   'The list continues with seven more sins, now singular in Greek (indicating character traits rather than acts): thefts (klopai), covetousness (pleonexiai — greediness, wanting more), wickedness (ponēriai — active malice), deceit (dolos — cunning, treachery), lasciviousness (aselgeia — sensuality, shamelessness), an evil eye (ophthalmos ponēros — envy, stinginess), blasphemy (blasphēmia — slander against God or man), pride (hyperēphania — arrogance, setting oneself above others), foolishness (aphrosynē — moral senselessness, not intellectual deficiency).',
   NULL),
  (23, 'All these evil things come from within, and defile the man.',
   'πάντα ταῦτα τὰ πονηρὰ ἔσωθεν ἐκπορεύεται καὶ κοινοῖ τὸν ἄνθρωπον',
   'panta tauta ta ponēra esōthen ekporeuetai kai koinoi ton anthrōpon',
   '''All these'' — comprehensive: every sin on the list. ''From within'' (esōthen — from inside). ''Defile'' (koinoi — make unclean). The conclusion is devastating: the human heart is the universal source of defilement. No amount of external washing can cleanse internal corruption. The only remedy is a new heart (Ezekiel 36:26).',
   NULL),
  (24, 'And from thence he arose, and went into the borders of Tyre and Sidon, and entered into an house, and would have no man know it: but he could not be hid.',
   'καὶ ἐκεῖθεν ἀναστὰς ἀπῆλθεν εἰς τὰ μεθόρια Τύρου καὶ Σιδῶνος καὶ εἰσελθὼν εἰς οἰκίαν οὐδένα ἤθελεν γνῶναι καὶ οὐκ ἠδυνήθη λαθεῖν',
   'kai ekeithen anastas apēlthen eis ta methoria Tyrou kai Sidōnos kai eiselthōn eis oikian oudena ēthelen gnōnai kai ouk ēdynēthē lathein',
   '''Borders of Tyre and Sidon'' (methoria — frontier regions). Jesus withdraws into Gentile territory — a dramatic geographical shift with theological significance. After declaring all foods clean (v.19), he crosses into unclean territory. ''Could not be hid'' — his reputation precedes him even among pagans. The physical journey mirrors the theological movement: from Israel to the nations.',
   NULL),
  (25, 'For a certain woman, whose young daughter had an unclean spirit, heard of him, and came and fell at his feet:',
   'ἀκούσασα γὰρ γυνὴ περὶ αὐτοῦ ἧς εἶχεν τὸ θυγάτριον αὐτῆς πνεῦμα ἀκάθαρτον ἐλθοῦσα προσέπεσεν πρὸς τοὺς πόδας αὐτοῦ',
   'akousasa gar gynē peri autou hēs eichen to thygatrion autēs pneuma akatharton elthousa prosepesen pros tous podas autou',
   '''Young daughter'' (thygatrion — diminutive: little daughter, expressing tenderness). ''Unclean spirit'' (pneuma akatharton). ''Fell at his feet'' (prosepesen — prostrated herself). A desperate Gentile mother with a demonized child — she overcomes every barrier (gender, ethnicity, religion) to reach Jesus. Her posture of humility contrasts with the Pharisees'' posture of superiority.',
   NULL),
  (26, 'The woman was a Greek, a Syrophenician by nation; and she besought him that he would cast forth the devil out of her daughter.',
   'ἡ δὲ γυνὴ ἦν Ἑλληνίς Συροφοινίκισσα τῷ γένει καὶ ἠρώτα αὐτὸν ἵνα τὸ δαιμόνιον ἐκβάλῃ ἐκ τῆς θυγατρὸς αὐτῆς',
   'hē de gynē ēn Hellēnis Syrophoinikissa tō genei kai ērōta auton hina to daimonion ekbalē ek tēs thygatros autēs',
   '''Greek'' (Hellēnis — a Gentile, pagan; culturally and religiously non-Jewish). ''Syrophoenician'' (Syrophoinikissa — from Syrian Phoenicia, distinguishing her from Libyan Phoenicians in North Africa). Mark layers her identity to emphasise her utter outsider status: she is female, Greek-speaking, Gentile, and from a region historically hostile to Israel.',
   NULL),
  (27, 'But Jesus said unto her, Let the children first be filled: for it is not meet to take the children''s bread, and to cast it unto the dogs.',
   'ὁ δὲ Ἰησοῦς εἶπεν αὐτῇ ἄφες πρῶτον χορτασθῆναι τὰ τέκνα οὐ γάρ ἐστιν καλὸν λαβεῖν τὸν ἄρτον τῶν τέκνων καὶ τοῖς κυναρίοις βαλεῖν',
   'ho de Iēsous eipen autē aphes prōton chortasthēnai ta tekna ou gar estin kalon labein ton arton tōn teknōn kai tois kynariois balein',
   '''Let the children first be filled'' (prōton chortasthēnai — first be satisfied). ''Children'' (tekna — Israel). ''Dogs'' (kynariois — diminutive: little dogs, household pets, not wild scavengers). ''First'' is crucial — it implies a sequence, not an exclusion. Israel''s priority does not mean Gentile exclusion. Jesus tests her faith, not denies it. The diminutive ''little dogs'' softens the image — these are pets under the table, not strays in the street.',
   'This exchange is often misunderstood as Jesus being rude or nationalistic. Several features indicate a test of faith, not rejection: (1) ''first'' (prōton) implies a ''then'' — Gentiles will eat, just not yet; (2) kynariois is the diminutive ''puppies/pets,'' not the harsh ''dogs'' (kynes) used elsewhere; (3) Jesus has already been in Gentile territory performing miracles; (4) the outcome proves he was drawing out her faith for display. Jesus operates within salvation-historical priority (to the Jew first, Romans 1:16) while opening the door to universal grace.'),
  (28, 'And she answered and said unto him, Yes, Lord: yet the dogs under the table eat of the children''s crumbs.',
   'ἡ δὲ ἀπεκρίθη καὶ λέγει αὐτῷ ναί κύριε καὶ γὰρ τὰ κυνάρια ὑποκάτω τῆς τραπέζης ἐσθίουσιν ἀπὸ τῶν ψιχίων τῶν παιδίων',
   'hē de apekrithē kai legei autō nai kyrie kai gar ta kynaria hypokatō tēs trapezēs esthiousin apo tōn psichiōn tōn paidiōn',
   '''Yes, Lord'' (nai kyrie — she accepts the premise, does not argue the priority of Israel). ''Yet'' (kai gar — and indeed, even so). ''Under the table'' (hypokatō tēs trapezēs — she accepts her position). ''Crumbs'' (psichiōn — fragments, morsels). Her answer is a masterpiece of faith: she does not challenge Jesus'' framework but works within it. She does not demand equality but requests overflow. If Israel''s table is so rich, even the crumbs are enough to deliver her daughter.',
   'This woman''s response is one of the greatest expressions of faith in the Gospels. She does not dispute the priority of Israel (''Yes, Lord''), nor does she demand equal status. She simply recognises that God''s grace is so abundant that even its overflow — the crumbs — is sufficient for her need. This is the logic of grace: God''s provision is so vast that what falls from Israel''s table can heal the nations. Her faith sees abundance where others see scarcity.'),
  (29, 'And he said unto her, For this saying go thy way; the devil is gone out of thy daughter.',
   'καὶ εἶπεν αὐτῇ διὰ τοῦτον τὸν λόγον ὕπαγε ἐξελήλυθεν τὸ δαιμόνιον ἐκ τῆς θυγατρός σου',
   'kai eipen autē dia touton ton logon hypage exelēlythen to daimonion ek tēs thygatros sou',
   '''For this saying'' (dia touton ton logon — because of this word). Jesus rewards her faith expressed in her reply. The healing is accomplished at a distance — no touch, no command to the demon, no physical presence required. ''The devil is gone out'' (exelēlythen — perfect tense: has gone out and remains out). This is the only miracle in Mark performed solely on the basis of the supplicant''s verbal response.',
   NULL),
  (30, 'And when she was come to her house, she found the devil gone out, and her daughter laid upon the bed.',
   'καὶ ἀπελθοῦσα εἰς τὸν οἶκον αὐτῆς εὗρεν τὸ παιδίον βεβλημένον ἐπὶ τὴν κλίνην καὶ τὸ δαιμόνιον ἐξεληλυθός',
   'kai apelthousa eis ton oikon autēs heuren to paidion beblēmenon epi tēn klinēn kai to daimonion exelēlythos',
   '''Laid upon the bed'' (beblēmenon epi tēn klinēn — lying on the bed; peaceful rest replacing demonic torment). ''The devil gone out'' (daimonion exelēlythos — perfect participle: the demon had departed). The woman returns home to find the word of Jesus already accomplished. No fanfare, no spectacle — just a child at rest and a demon gone.',
   NULL),
  (31, 'And again, departing from the coasts of Tyre and Sidon, he came unto the sea of Galilee, through the midst of the coasts of Decapolis.',
   'καὶ πάλιν ἐξελθὼν ἐκ τῶν ὁρίων Τύρου καὶ Σιδῶνος ἦλθεν πρὸς τὴν θάλασσαν τῆς Γαλιλαίας ἀνὰ μέσον τῶν ὁρίων Δεκαπόλεως',
   'kai palin exelthōn ek tōn horiōn Tyrou kai Sidōnos ēlthen pros tēn thalassan tēs Galilaias ana meson tōn horiōn Dekapoleōs',
   '''Decapolis'' (Dekapoleōs — a league of ten Greco-Roman cities, predominantly Gentile). Jesus takes a circuitous route through Gentile territory, moving from Phoenicia south through the Decapolis region east of the Jordan. This extended journey through pagan lands reinforces the theme: the gospel is breaking beyond Israel''s borders.',
   NULL),
  (32, 'And they bring unto him one that was deaf, and had an impediment in his speech; and they beseech him to put his hand upon him.',
   'καὶ φέρουσιν αὐτῷ κωφὸν μογιλάλον καὶ παρακαλοῦσιν αὐτὸν ἵνα ἐπιθῇ αὐτῷ τὴν χεῖρα',
   'kai pherousin autō kōphon mogilalon kai parakalousin auton hina epithē autō tēn cheira',
   '''Deaf'' (kōphon — deaf, or possibly deaf-mute). ''Impediment in his speech'' (mogilalon — speaking with difficulty; used only here and in Isaiah 35:6 LXX, creating a deliberate echo of Isaiah''s messianic prophecy). ''Put his hand upon him'' — the friends request physical touch, expecting a method of healing. The rare word mogilalon signals to literate readers that messianic prophecy is being fulfilled.',
   NULL),
  (33, 'And he took him aside from the multitude, and put his fingers into his ears, and he spit, and touched his tongue;',
   'καὶ ἀπολαβόμενος αὐτὸν ἀπὸ τοῦ ὄχλου κατ᾿ ἰδίαν ἔβαλεν τοὺς δακτύλους αὐτοῦ εἰς τὰ ὦτα αὐτοῦ καὶ πτύσας ἥψατο τῆς γλώσσης αὐτοῦ',
   'kai apolabomenos auton apo tou ochlou kat idian ebalen tous daktylous autou eis ta ōta autou kai ptysas hēpsato tēs glōssēs autou',
   '''Took him aside'' (apolabomenos — withdrew him; private, personal attention). ''Fingers into his ears'' — communicating through touch what cannot be communicated by sound to a deaf man. ''Spit, and touched his tongue'' — saliva was widely believed to have healing properties in antiquity. Jesus uses physical gestures as sign language: I am going to heal your ears and your tongue. The method accommodates the man''s condition.',
   NULL),
  (34, 'And looking up to heaven, he sighed, and saith unto him, Ephphatha, that is, Be opened.',
   'καὶ ἀναβλέψας εἰς τὸν οὐρανὸν ἐστέναξεν καὶ λέγει αὐτῷ εφφαθα ὅ ἐστιν διανοίχθητι',
   'kai anablepsas eis ton ouranon estenaxen kai legei autō ephphatha ho estin dianoichthēti',
   '''Looking up to heaven'' (anablepsas eis ton ouranon — indicating the source of healing power). ''Sighed'' (estenaxen — groaned deeply; an expression of profound emotion, compassion, and perhaps grief over the effects of sin and disease). ''Ephphatha'' — Aramaic, preserved in the original language for its power and memorability. ''Be opened'' (dianoichthēti — be thoroughly opened; the passive voice indicates divine action). Mark translates the Aramaic for his Gentile readers.',
   NULL),
  (35, 'And straightway his ears were opened, and the string of his tongue was loosed, and he spake plain.',
   'καὶ εὐθέως διηνοίχθησαν αὐτοῦ αἱ ἀκοαί καὶ ἐλύθη ὁ δεσμὸς τῆς γλώσσης αὐτοῦ καὶ ἐλάλει ὀρθῶς',
   'kai eutheōs diēnoichthēsan autou hai akoai kai elythē ho desmos tēs glōssēs autou kai elalei orthōs',
   '''Straightway'' (eutheōs — immediately; Mark''s characteristic word). ''Ears were opened'' (diēnoichthēsan — thoroughly opened). ''String of his tongue was loosed'' (elythē ho desmos — the bond was released; suggesting demonic or physical binding). ''Spake plain'' (elalei orthōs — spoke correctly, properly). The healing is instantaneous and complete — no gradual recovery, no speech therapy needed.',
   NULL),
  (36, 'And he charged them that they should tell no man: but the more he charged them, so much the more a great deal they published it;',
   'καὶ διεστείλατο αὐτοῖς ἵνα μηδενὶ εἴπωσιν ὅσον δὲ αὐτὸς αὐτοῖς διεστέλλετο μᾶλλον περισσότερον ἐκήρυσσον',
   'kai diesteilato autois hina mēdeni eipōsin hoson de autos autois diestelleto mallon perissoteron ekērysson',
   '''Charged them'' (diesteilato — commanded, ordered firmly). ''The more he charged... so much the more'' — a pattern of inverse obedience unique to Mark. ''Published it'' (ekērysson — proclaimed, heralded). The messianic secret motif: Jesus suppresses publicity, but the evidence is too compelling. Ironically, those he commands to speak (the Gerasene demoniac, 5:19) obey, while those he commands to silence cannot contain themselves.',
   NULL),
  (37, 'And were beyond measure astonished, saying, He hath done all things well: he maketh both the deaf to hear, and the dumb to speak.',
   'καὶ ὑπερπερισσῶς ἐξεπλήσσοντο λέγοντες καλῶς πάντα πεποίηκεν καὶ τοὺς κωφοὺς ποιεῖ ἀκούειν καὶ τοὺς ἀλάλους λαλεῖν',
   'kai hyperperissōs exeplēssonto legontes kalōs panta pepoiēken kai tous kōphous poiei akouein kai tous alalous lalein',
   '''Beyond measure astonished'' (hyperperissōs exeplēssonto — super-abundantly amazed; hyperperissōs is a rare double-compound found only here in the NT). ''He hath done all things well'' (kalōs panta pepoiēken — echoing Genesis 1:31 LXX: God saw all that he had made, and it was very good). ''The deaf to hear and the dumb to speak'' — echoing Isaiah 35:5-6. The crowd unwittingly identifies Jesus as both Creator and Messiah through their exclamation.',
   'The crowd''s declaration ''He hath done all things well'' carries two profound echoes: (1) Genesis 1:31 — God''s creation verdict. Jesus is performing a new creation, restoring what sin has broken. (2) Isaiah 35:5-6 — the messianic age when ''the ears of the deaf shall be unstopped'' and ''the tongue of the dumb sing.'' This Gentile crowd, perhaps unknowingly, confesses Jesus as both Creator and the Promised One. The healing of deaf ears and mute tongues among the nations fulfils the very prophecy of the gospel''s universal reach.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 7;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 defiled/common
  ('κοινός', 'koinos', 'G2839', 'Common, defiled, ritually unclean — from koinoō (to make common). In secular Greek, koinos simply means ''shared'' or ''communal'' (cf. Acts 2:44, ''had all things common''). In Jewish religious usage, it acquired the specialised meaning of ''profane'' or ''ritually impure'' — something that has not been properly consecrated or has been contaminated by contact with the unclean. Jesus redefines the concept: true defilement is moral, not ceremonial.', 1),
  -- v.6 hypocrites
  ('ὑποκριτής', 'hypokritēs', 'G5273', 'Hypocrite, pretender, actor — from hypokrinomai (to answer from under, to play a part on stage). In classical Greek, the word referred to stage actors who wore masks to portray characters. Jesus applies it to religious leaders whose outward piety masks inward emptiness. The lips honour God while the heart is far away. Hypocrisy is the most dangerous form of unbelief because it mimics faith.', 2),
  -- v.11 Corban
  ('κορβᾶν', 'korban', 'G2878', 'Corban, an offering, a gift dedicated to God — a Hebrew/Aramaic loanword (from qorban, ''that which is brought near'' to the altar). In rabbinic practice, a person could declare property ''Corban'' (devoted to God), thereby making it unavailable for any other use — including supporting elderly parents. The property might never actually reach the temple; the declaration simply shielded it. Jesus exposes this as using religious vocabulary to evade moral duty.', 3),
  -- v.15 defile
  ('κοινόω', 'koinoō', 'G2840', 'To make common, defile, render unclean — the verb form of koinos. Jesus uses this word to overturn the entire purity system: nothing entering from outside can koinōsai (defile) a person. Defilement is relocated from the external (food, unwashed hands) to the internal (the heart''s moral condition). This single verb, in Jesus'' usage, dismantles centuries of ceremonial legislation and anticipates the Gentile mission.', 4),
  -- v.19 purging all meats
  ('καθαρίζω', 'katharizō', 'G2511', 'To cleanse, purify, make clean — from katharos (clean, pure). The participle katharizon (''purging/cleansing'') in this verse is either Mark''s editorial comment or Jesus'' own declaration. Either way, it pronounces all foods clean (katharizon panta ta brōmata). This word becomes central to the Acts 10 vision (''What God hath cleansed, call not thou common'') and Paul''s food ethics in Romans 14.', 5),
  -- v.22 lasciviousness
  ('ἀσέλγεια', 'aselgeia', 'G766', 'Lasciviousness, sensuality, wanton excess — denoting open, shameless indulgence without restraint or regard for decency. Unlike hidden sins, aselgeia flaunts itself. It appears in Paul''s vice lists (Galatians 5:19; Ephesians 4:19; 2 Peter 2:2, 7). In Jesus'' catalogue of heart-sins, it represents the most brazen form of moral corruption — sin that has lost all sense of shame.', 6),
  -- v.27 dogs (diminutive)
  ('κυνάριον', 'kynarion', 'G2952', 'Little dog, household pet, puppy — diminutive of kyōn (dog). In Jewish usage, ''dog'' (kyōn) was a term of contempt for Gentiles (cf. Philippians 3:2; Revelation 22:15). But Jesus uses the diminutive kynarion — not wild scavengers but small dogs kept as household pets, allowed under the family table. The diminutive softens the image significantly and opens the door: pets belong in the household, even if they eat after the children.', 7),
  -- v.34 Ephphatha
  ('ἐφφαθά', 'ephphatha', 'G2188', 'Be opened — an Aramaic imperative (from the root pathach, to open). One of the few Aramaic words preserved in Mark''s Greek text (cf. 5:41, Talitha koum; 14:36, Abba; 15:34, Eloi). Mark preserves the original language for its vividness and power, then translates for his Gentile audience. The word becomes a command not just to deaf ears but to all that is closed — hearts, minds, borders, traditions.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 7
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 6
    WHEN 3 THEN 11
    WHEN 4 THEN 15
    WHEN 5 THEN 19
    WHEN 6 THEN 22
    WHEN 7 THEN 27
    WHEN 8 THEN 34
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 unwashed hands
  (2, 'Matthew 15:1-2', 1),
  -- v.6 lips honour, heart far
  (6, 'Isaiah 29:13', 2),
  (6, 'Matthew 15:7-9', 3),
  -- v.7 commandments of men
  (7, 'Colossians 2:20-22', 4),
  (7, 'Titus 1:14', 5),
  -- v.9 reject commandment of God
  (9, 'Matthew 15:3-6', 6),
  -- v.10 honour father and mother
  (10, 'Exodus 20:12', 7),
  (10, 'Exodus 21:17', 8),
  (10, 'Deuteronomy 5:16', 9),
  -- v.11 Corban
  (11, 'Matthew 15:5-6', 10),
  -- v.13 word of God of none effect
  (13, 'Matthew 15:6', 11),
  -- v.15 nothing from without defiles
  (15, 'Acts 10:14-15', 12),
  (15, 'Romans 14:14', 13),
  (15, 'Romans 14:20', 14),
  -- v.19 purging all meats
  (19, 'Acts 10:15', 15),
  (19, '1 Timothy 4:3-5', 16),
  (19, 'Colossians 2:16', 17),
  -- v.21 evil from within
  (21, 'Genesis 6:5', 18),
  (21, 'Genesis 8:21', 19),
  (21, 'Jeremiah 17:9', 20),
  (21, 'Galatians 5:19-21', 21),
  -- v.24 borders of Tyre and Sidon
  (24, 'Matthew 15:21', 22),
  -- v.27 children first
  (27, 'Matthew 15:24-26', 23),
  (27, 'Romans 1:16', 24),
  (27, 'Acts 3:26', 25),
  -- v.28 crumbs from the table
  (28, 'Matthew 15:27', 26),
  -- v.29 devil gone out
  (29, 'Matthew 15:28', 27),
  -- v.32 deaf and speech impediment
  (32, 'Isaiah 35:5-6', 28),
  -- v.34 Ephphatha
  (34, 'Mark 5:41', 29),
  (34, 'Isaiah 35:5', 30),
  -- v.37 done all things well
  (37, 'Genesis 1:31', 31),
  (37, 'Isaiah 35:5-6', 32)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 7
  AND v.verse_number = cr.verse_number;
