-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 5 — Three Mighty Acts: Demons, Disease, and Death
-- 43 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Mark 5 presents three interlocking miracles that demonstrate Jesus'' authority over the three great enemies of humanity: Satan, disease, and death. First, on the eastern shore of Galilee, Jesus encounters a man possessed by a ''legion'' of demons (vv.1-20). The demoniac lives among the tombs, is supernaturally strong, and cannot be restrained. Jesus commands the demons into a herd of swine, which rush into the sea and drown. The delivered man is sent home as a witness. Second, on returning to the western shore, Jesus is approached by Jairus, a synagogue ruler whose twelve-year-old daughter is dying (vv.21-24). En route to Jairus'' house, a woman who has suffered from a hemorrhage for twelve years secretly touches Jesus'' garment and is instantly healed (vv.25-34). Jesus stops, identifies her, and says: ''Daughter, thy faith hath made thee whole; go in peace'' (v.34). The interruption is not a delay but a divine appointment. Third, word comes that Jairus'' daughter has died (v.35). Jesus says, ''Be not afraid, only believe'' (v.36), enters the house, takes the dead girl by the hand, and says ''Talitha cumi'' — ''Damsel, I say unto thee, arise'' (v.41). She rises immediately and walks. Three escalating demonstrations: authority over a legion of demons, power over chronic disease, and sovereignty over death itself. Mark weaves these stories together with characteristic narrative brilliance, showing that no force — demonic, natural, or final — can resist Jesus'' word.',
  'Authority Over Demons, Disease, and Death — No Enemy Can Withstand Jesus',
  'σῴζω (sōzō)',
  'To save, heal, deliver, make whole — from saos (safe, sound). In Mark 5, sōzō carries its full range of meaning: the demoniac is saved/delivered from demonic oppression (v.15), the hemorrhaging woman is made whole/healed (v.34), and Jairus'' daughter is raised/saved from death (v.23). The word unites physical healing, spiritual deliverance, and victory over death into a single concept of total salvation. Jesus'' saving power addresses every dimension of human brokenness.',
  '["The Gadarene Demoniac: Authority Over a Legion (vv.1-20): They came over unto the other side of the sea into the country of the Gadarenes. There met him out of the tombs a man with an unclean spirit who had his dwelling among the tombs. My name is Legion for we are many. And forthwith Jesus gave them leave and the unclean spirits went out and entered into the swine. Go home to thy friends and tell them how great things the Lord hath done for thee","The Woman with the Issue of Blood: Faith That Touches (vv.25-34): A certain woman which had an issue of blood twelve years had suffered many things of many physicians and had spent all that she had. If I may touch but his clothes I shall be whole. Straightway the fountain of her blood was dried up. Who touched my clothes. Daughter thy faith hath made thee whole go in peace and be whole of thy plague","Jairus'' Daughter Raised: Authority Over Death (vv.21-24, 35-43): A certain ruler of the synagogue Jairus by name fell at his feet and besought him greatly saying My little daughter lieth at the point of death. Thy daughter is dead why troublest thou the Master any further. Be not afraid only believe. Talitha cumi which is being interpreted Damsel I say unto thee arise. And straightway the damsel arose and walked"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 43 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And they came over unto the other side of the sea, into the country of the Gadarenes.',
   'Καὶ ἦλθον εἰς τὸ πέραν τῆς θαλάσσης εἰς τὴν χώραν τῶν Γαδαρηνῶν',
   'Kai ēlthon eis to peran tēs thalassēs eis tēn chōran tōn Gadarēnōn',
   '''The other side'' (to peran — the eastern, Gentile shore). ''Country of the Gadarenes'' — the region around Gadara, one of the cities of the Decapolis, a predominantly Gentile area. Jesus has crossed from Jewish territory into Gentile territory — the first extended ministry among non-Jews in Mark. The presence of a pig herd (v.11) confirms the Gentile setting, as Jews would not raise swine.',
   NULL),
  (2, 'And when he was come out of the ship, immediately there met him out of the tombs a man with an unclean spirit,',
   'καὶ ἐξελθόντι αὐτῷ ἐκ τοῦ πλοίου εὐθέως ἀπήντησεν αὐτῷ ἐκ τῶν μνημείων ἄνθρωπος ἐν πνεύματι ἀκαθάρτῳ',
   'kai exelthonti autō ek tou ploiou eutheōs apēntēsen autō ek tōn mnēmeiōn anthrōpos en pneumati akathartō',
   '''Immediately'' (eutheōs — at once; Jesus has barely stepped ashore). ''Out of the tombs'' (ek tōn mnēmeiōn — from the burial caves). ''A man with an unclean spirit'' — Mark focuses on one demoniac (Matthew 8:28 mentions two). Living among tombs made one perpetually ceremonially unclean. The man is in the realm of death — isolated from the living, dwelling with the dead.',
   NULL),
  (3, 'Who had his dwelling among the tombs; and no man could bind him, no, not with chains:',
   'ὃς τὴν κατοίκησιν εἶχεν ἐν τοῖς μνήμασιν καὶ οὔτε ἁλύσεσιν οὐδεὶς ἠδύνατο αὐτὸν δῆσαι',
   'hos tēn katoikēsin eichen en tois mnēmasin kai oute halysesin oudeis ēdynato auton dēsai',
   '''Dwelling'' (katoikēsin — his permanent residence, his home). ''No man could bind him'' (oudeis ēdynato auton dēsai — nobody was able to tie him up). ''Not with chains'' (oute halysesin — not even with chains). The community had tried to restrain him — and failed utterly. This is not ordinary human strength but demonic power. The one whom no human can bind will meet the one who can bind the ''strong man'' (3:27).',
   NULL),
  (4, 'Because that he had been often bound with fetters and chains, and the chains had been plucked asunder by him, and the fetters broken in pieces: neither could any man tame him.',
   'διὰ τὸ αὐτὸν πολλάκις πέδαις καὶ ἁλύσεσιν δεδέσθαι καὶ διεσπᾶσθαι ὑπ᾿ αὐτοῦ τὰς ἁλύσεις καὶ τὰς πέδας συντετρῖφθαι καὶ οὐδεὶς αὐτὸν ἴσχυεν δαμάσαι',
   'dia to auton pollakis pedais kai halysesin dedesthai kai diespasthai hyp autou tas halyseis kai tas pedas syntetriphthai kai oudeis auton ischyen damasai',
   '''Often bound'' (pollakis dedesthai — many times having been bound). ''Fetters'' (pedais — leg irons, shackles). ''Plucked asunder'' (diespasthai — torn apart). ''Broken in pieces'' (syntetriphthai — shattered). ''Tame'' (damasai — subdue, domesticate; the word used for taming wild animals). Mark piles up details to emphasise the man''s terrifying, uncontrollable state. The repeated failures highlight the coming success of Jesus.',
   NULL),
  (5, 'And always, night and day, he was in the mountains, and in the tombs, crying, and cutting himself with stones.',
   'καὶ διὰ παντός νυκτὸς καὶ ἡμέρας ἐν τοῖς ὄρεσιν καὶ ἐν τοῖς μνήμασιν ἦν κράζων καὶ κατακόπτων ἑαυτὸν λίθοις',
   'kai dia pantos nyktos kai hēmeras en tois oresin kai en tois mnēmasin ēn krazōn kai katakoptōn heauton lithois',
   '''Always, night and day'' (dia pantos nyktos kai hēmeras — continually, without cease). ''Crying'' (krazōn — screaming, shrieking). ''Cutting himself with stones'' (katakoptōn heauton lithois — gashing himself). A picture of utter torment: sleepless, homeless, self-destructive, screaming in agony day and night. This is what demonic possession reduces a human being to — the complete destruction of dignity, peace, and self. The demons are literally killing him from within.',
   NULL),
  (6, 'But when he saw Jesus afar off, he ran and worshipped him,',
   'ἰδὼν δὲ τὸν Ἰησοῦν ἀπὸ μακρόθεν ἔδραμεν καὶ προσεκύνησεν αὐτῷ',
   'idōn de ton Iēsoun apo makrothen edramen kai prosekynēsen autō',
   '''Afar off'' (apo makrothen — from a great distance; he could see Jesus approaching). ''Ran'' (edramen — sprinted). ''Worshipped'' (prosekynēsen — prostrated himself, fell down before). The man runs toward Jesus — not away. Despite the demons'' hostility, something in the man is drawn to Jesus. ''Worshipped'' may reflect the demon''s involuntary submission rather than the man''s conscious adoration, or it may be the desperate human soul within crying out for rescue.',
   NULL),
  (7, 'And cried with a loud voice, and said, What have I to do with thee, Jesus, thou Son of the most high God? I adjure thee by God, that thou torment me not.',
   'καὶ κράξας φωνῇ μεγάλῃ εἶπεν τί ἐμοὶ καὶ σοί Ἰησοῦ υἱὲ τοῦ θεοῦ τοῦ ὑψίστου ὁρκίζω σε τὸν θεόν μή με βασανίσῃς',
   'kai kraxas phōnē megalē eipen ti emoi kai soi Iēsou huie tou theou tou hypsistou horkizō se ton theon mē me basanisēs',
   '''What have I to do with thee'' (ti emoi kai soi — a formula of hostile protest, cf. 1:24). ''Son of the most high God'' (huie tou theou tou hypsistou — a title recognising Jesus'' supreme divine status; ''Most High God'' was used by Gentiles for the supreme deity). ''I adjure thee by God'' (horkizō se ton theon — I put you under oath by God). ''Torment me not'' (mē me basanisēs — do not torture me). The demon tries to use Jesus'' name and invoke God''s name as a defensive incantation — the standard practice of ancient exorcism. But Jesus needs no incantations; he commands with inherent authority.',
   NULL),
  (8, 'For he said unto him, Come out of the man, thou unclean spirit.',
   'ἔλεγεν γὰρ αὐτῷ ἔξελθε τὸ πνεῦμα τὸ ἀκάθαρτον ἐκ τοῦ ἀνθρώπου',
   'elegen gar autō exelthe to pneuma to akatharton ek tou anthrōpou',
   '''For he said'' — Mark explains that the demon''s protest (v.7) was a response to Jesus'' prior command. Jesus had already been commanding the spirit to depart. ''Come out'' (exelthe — depart; aorist imperative: do it now). ''Thou unclean spirit'' — Jesus addresses the demon directly, asserting authority over it. No rituals, no formulas, just sovereign command.',
   NULL),
  (9, 'And he asked him, What is thy name? And he answered, saying, My name is Legion: for we are many.',
   'καὶ ἐπηρώτα αὐτόν τί σοι ὄνομα καὶ ἀπεκρίθη λέγων Λεγεὼν ὄνομά μοι ὅτι πολλοί ἐσμεν',
   'kai epērōta auton ti soi onoma kai apekrithē legōn Legeōn onoma moi hoti polloi esmen',
   '''What is thy name?'' — Jesus asks not because he needs the information but to expose the magnitude of the possession. ''Legion'' (Legeōn — a Roman military term for a unit of approximately 4,000-6,000 soldiers). ''For we are many'' (polloi esmen — we are numerous). The singular and plural alternate: ''my name'' (singular) / ''we are many'' (plural) — reflecting the tormented confusion of multiple demonic presences speaking through one man. The military language may also hint at the Roman occupation — a double bondage, spiritual and political.',
   NULL),
  (10, 'And he besought him much that he would not send them away out of the country.',
   'καὶ παρεκάλει αὐτὸν πολλὰ ἵνα μὴ αὐτοὺς ἀποστείλῃ ἔξω τῆς χώρας',
   'kai parekalei auton polla hina mē autous aposteilē exō tēs chōras',
   '''Besought him much'' (parekalei polla — kept begging repeatedly). ''Not send them out of the country'' — the demons recognise Jesus'' absolute authority; they do not resist his command to leave but negotiate about their destination. They prefer to remain in the region rather than be sent to the abyss (Luke 8:31). Even in their defiance, the demons acknowledge Jesus as sovereign — they petition, they do not resist.',
   NULL),
  (11, 'Now there was there nigh unto the mountains a great herd of swine feeding.',
   'ἦν δὲ ἐκεῖ πρὸς τῷ ὄρει ἀγέλη χοίρων μεγάλη βοσκομένη',
   'ēn de ekei pros tō orei agelē choirōn megalē boskomenē',
   '''Great herd of swine'' (agelē choirōn megalē — a large herd of pigs). Pigs were unclean animals under Jewish law (Leviticus 11:7). Their presence confirms the Gentile setting. The herd numbered about 2,000 (v.13). Pig farming was a significant industry in the Decapolis region.',
   NULL),
  (12, 'And all the devils besought him, saying, Send us into the swine, that we may enter into them.',
   'καὶ παρεκάλεσαν αὐτὸν πάντα τὰ δαιμόνια λέγοντα πέμψον ἡμᾶς εἰς τοὺς χοίρους ἵνα εἰς αὐτοὺς εἰσέλθωμεν',
   'kai parekalesan auton panta ta daimonia legonta pempson hēmas eis tous choirous hina eis autous eiselthōmen',
   '''All the devils besought'' — the entire legion makes the request. ''Send us into the swine'' — the demons prefer animal hosts to disembodiment. Their request reveals that they cannot act without Jesus'' permission — his authority is total. Even demonic strategy is subject to divine sovereignty.',
   NULL),
  (13, 'And forthwith Jesus gave them leave. And the unclean spirits went out, and entered into the swine: and the herd ran violently down a steep place into the sea, (they were about two thousand;) and were choked in the sea.',
   'καὶ ἐπέτρεψεν αὐτοῖς εὐθέως ὁ Ἰησοῦς καὶ ἐξελθόντα τὰ πνεύματα τὰ ἀκάθαρτα εἰσῆλθον εἰς τοὺς χοίρους καὶ ὥρμησεν ἡ ἀγέλη κατὰ τοῦ κρημνοῦ εἰς τὴν θάλασσαν ἦσαν δὲ ὡς δισχίλιοι καὶ ἐπνίγοντο ἐν τῇ θαλάσσῃ',
   'kai epetrepsen autois eutheōs ho Iēsous kai exelthonta ta pneumata ta akatharta eisēlthon eis tous choirous kai hōrmēsen hē agelē kata tou krēmnou eis tēn thalassan ēsan de hōs dischilioi kai epnigonto en tē thalassē',
   '''Gave them leave'' (epetrepsen — permitted). ''About two thousand'' (hōs dischilioi — approximately 2,000). ''Ran violently'' (hōrmēsen — rushed, stampeded; the verb denotes violent, headlong motion). ''Down a steep place'' (kata tou krēmnou — over the cliff). ''Choked in the sea'' (epnigonto — were drowned). The stampede of 2,000 pigs makes the demons'' destructive nature visible: what they did invisibly to the man (self-destruction, v.5) they do visibly to the pigs. The incident also demonstrates the scale of the possession — thousands of evil spirits in one man.',
   'The drowning of the pigs raises ethical questions but serves several theological purposes: (1) It makes the reality and scale of the demonic possession undeniably visible; (2) It shows the demons'' essentially destructive nature — they cannot inhabit anything without destroying it; (3) It declares that one human being is worth more than 2,000 animals; (4) It forces the local population to confront the cost of Jesus'' liberating power. The pigs'' destruction is the visible proof that the man''s deliverance is real.'),
  (14, 'And they that fed the swine fled, and told it in the city, and in the country. And they went out to see what it was that was done.',
   'οἱ δὲ βόσκοντες τοὺς χοίρους ἔφυγον καὶ ἀνήγγειλαν εἰς τὴν πόλιν καὶ εἰς τοὺς ἀγρούς καὶ ἐξῆλθον ἰδεῖν τί ἐστιν τὸ γεγονός',
   'hoi de boskontes tous choirous ephygon kai anēngeilan eis tēn polin kai eis tous agrous kai exēlthon idein ti estin to gegonos',
   '''They that fed'' (hoi boskontes — the swineherds). ''Fled'' (ephygon — ran away in fear). ''Told it'' (anēngeilan — reported, announced). ''The city and the country'' — the news spreads everywhere. ''Went out to see'' — curiosity draws the people out. The report must have been extraordinary: 2,000 pigs drowned, and the terrifying demoniac who haunted their tombs has been transformed.',
   NULL),
  (15, 'And they come to Jesus, and see him that was possessed with the devil, and had the legion, sitting, and clothed, and in his right mind: and they were afraid.',
   'καὶ ἔρχονται πρὸς τὸν Ἰησοῦν καὶ θεωροῦσιν τὸν δαιμονιζόμενον καθήμενον καὶ ἱματισμένον καὶ σωφρονοῦντα τὸν ἐσχηκότα τὸν λεγεῶνα καὶ ἐφοβήθησαν',
   'kai erchontai pros ton Iēsoun kai theōrousin ton daimonizomenon kathēmenon kai himatismenon kai sōphronounta ton eschēkota ton legeōna kai ephobēthēsan',
   '''See him'' (theōrousin — observe, behold). ''Sitting'' (kathēmenon — seated peacefully; contrast with running wildly, v.6). ''Clothed'' (himatismenon — dressed; he had been naked). ''In his right mind'' (sōphronounta — sound-minded, self-controlled; from sōs ''safe'' + phrēn ''mind''). Three words describe the transformation: seated (at peace), clothed (dignity restored), sane (mind healed). ''They were afraid'' (ephobēthēsan — they feared). Paradoxically, the community feared the healed man more than the demoniac. The power that healed him is more terrifying to them than the demons.',
   NULL),
  (16, 'And they that saw it told them how it befell to him that was possessed with the devil, and also concerning the swine.',
   'καὶ διηγήσαντο αὐτοῖς οἱ ἰδόντες πῶς ἐγένετο τῷ δαιμονιζομένῳ καὶ περὶ τῶν χοίρων',
   'kai diēgēsanto autois hoi idontes pōs egeneto tō daimonizomenō kai peri tōn choirōn',
   '''Told them'' (diēgēsanto — narrated in full). The eyewitnesses give a complete account of both the man''s deliverance and the pigs'' destruction. The two events are inseparable — the community must reckon with both the miracle and its cost.',
   NULL),
  (17, 'And they began to pray him to depart out of their coasts.',
   'καὶ ἤρξαντο παρακαλεῖν αὐτὸν ἀπελθεῖν ἀπὸ τῶν ὁρίων αὐτῶν',
   'kai ērxanto parakalein auton apelthein apo tōn horiōn autōn',
   '''Began to pray him'' (parakalein — to beg, implore). ''Depart out of their coasts'' (apelthein apo tōn horiōn — leave their borders). The community asks Jesus to leave. They would rather keep their pigs than have the Deliverer. Economic loss trumps human liberation. This is one of the saddest verses in the Gospels: the people request the departure of the only one who can save them.',
   NULL),
  (18, 'And when he was come into the ship, he that had been possessed with the devil prayed him that he might be with him.',
   'καὶ ἐμβάντος αὐτοῦ εἰς τὸ πλοῖον παρεκάλει αὐτὸν ὁ δαιμονισθεὶς ἵνα ᾖ μετ᾿ αὐτοῦ',
   'kai embantos autou eis to ploion parekalei auton ho daimonistheis hina ē met autou',
   '''Prayed him'' (parekalei — begged; the same verb used by the community in v.17, but with opposite intent). ''That he might be with him'' (hina ē met autou — to be with him; the same phrase used for the Twelve in 3:14). The healed man wants discipleship — to be with Jesus. Two prayers: the community prays Jesus away; the healed man prays to stay with him.',
   NULL),
  (19, 'Howbeit Jesus suffered him not, but saith unto him, Go home to thy friends, and tell them how great things the Lord hath done for thee, and hath had compassion on thee.',
   'καὶ οὐκ ἀφῆκεν αὐτόν ἀλλὰ λέγει αὐτῷ ὕπαγε εἰς τὸν οἶκόν σου πρὸς τοὺς σοὺς καὶ ἀνάγγειλον αὐτοῖς ὅσα σοι ὁ κύριος πεποίηκεν καὶ ἠλέησέν σε',
   'kai ouk aphēken auton alla legei autō hypage eis ton oikon sou pros tous sous kai anangelion autois hosa soi ho kyrios pepoiēken kai ēleēsen se',
   '''Suffered him not'' (ouk aphēken — did not permit). ''Go home'' — unlike in Jewish territory where Jesus commands silence, here in Gentile territory he commands proclamation. ''Tell them'' (anangelion — announce, declare). ''How great things the Lord hath done'' — ''the Lord'' (ho kyrios) refers to God, but the man will preach about Jesus (v.20). ''Hath had compassion'' (ēleēsen — showed mercy). The healed man becomes the first missionary to the Gentiles.',
   NULL),
  (20, 'And he departed, and began to publish in Decapolis how great things Jesus had done for him: and all men did marvel.',
   'καὶ ἀπῆλθεν καὶ ἤρξατο κηρύσσειν ἐν τῇ Δεκαπόλει ὅσα ἐποίησεν αὐτῷ ὁ Ἰησοῦς καὶ πάντες ἐθαύμαζον',
   'kai apēlthen kai ērxato kēryssein en tē Dekapolei hosa epoiēsen autō ho Iēsous kai pantes ethaumazon',
   '''Publish'' (kēryssein — proclaim as a herald). ''Decapolis'' — the league of ten Hellenistic cities east of the Jordan. ''How great things Jesus had done'' — notice: Jesus said ''the Lord''; the man preaches ''Jesus.'' He equates the two. ''All men did marvel'' (pantes ethaumazon — everyone was astonished). The man obeys, and his testimony prepares the entire Decapolis region for Jesus'' later visit (7:31).',
   NULL),
  (21, 'And when Jesus was passed over again by ship unto the other side, much people gathered unto him: and he was nigh unto the sea.',
   'καὶ διαπεράσαντος τοῦ Ἰησοῦ ἐν τῷ πλοίῳ πάλιν εἰς τὸ πέραν συνήχθη ὄχλος πολὺς ἐπ᾿ αὐτόν καὶ ἦν παρὰ τὴν θάλασσαν',
   'kai diaperasantos tou Iēsou en tō ploiō palin eis to peran synēchthē ochlos polys ep auton kai ēn para tēn thalassan',
   '''Passed over again'' — Jesus returns to the western (Jewish) shore of the Sea of Galilee. ''Much people gathered'' — the crowd immediately reassembles. ''Nigh unto the sea'' — the lakeside setting again. The scene shifts from Gentile territory back to Jewish territory, and from demonic confrontation to human desperation.',
   NULL),
  (22, 'And, behold, there cometh one of the rulers of the synagogue, Jairus by name; and when he saw him, he fell at his feet,',
   'καὶ ἰδοὺ ἔρχεται εἷς τῶν ἀρχισυναγώγων ὀνόματι Ἰάειρος καὶ ἰδὼν αὐτὸν πίπτει πρὸς τοὺς πόδας αὐτοῦ',
   'kai idou erchetai heis tōn archisynagōgōn onomati Iaeiros kai idōn auton piptei pros tous podas autou',
   '''Rulers of the synagogue'' (archisynagōgōn — synagogue president; responsible for organising worship services, maintaining the building, and inviting speakers). ''Jairus'' — from Hebrew Ya''ir, meaning ''he enlightens'' or ''he awakens.'' ''Fell at his feet'' (piptei pros tous podas — prostrated himself). A prominent religious leader humbles himself before Jesus — desperation overcomes social propriety. His position would normally make him cautious about associating with Jesus; his daughter''s crisis overrides all such concerns.',
   NULL),
  (23, 'And besought him greatly, saying, My little daughter lieth at the point of death: I pray thee, come and lay thy hands on her, that she may be healed; and she shall live.',
   'καὶ παρεκάλει αὐτὸν πολλὰ λέγων ὅτι τὸ θυγάτριόν μου ἐσχάτως ἔχει ἵνα ἐλθὼν ἐπιθῇς αὐτῇ τὰς χεῖρας ὅπως σωθῇ καὶ ζήσεται',
   'kai parekalei auton polla legōn hoti to thygatrion mou eschatōs echei hina elthōn epithēs autē tas cheiras hopōs sōthē kai zēsetai',
   '''Little daughter'' (thygatrion — diminutive form: my dear little daughter; the term reveals a father''s tenderness). ''At the point of death'' (eschatōs echei — is at the last extremity, is dying). ''Lay thy hands on her'' — Jairus has heard of Jesus'' healing touch. ''May be healed and shall live'' (sōthē kai zēsetai — be saved/healed and she will live). Jairus'' faith is specific and expectant: if Jesus comes and touches her, she will live.',
   NULL),
  (24, 'And Jesus went with him; and much people followed him, and thronged him.',
   'καὶ ἀπῆλθεν μετ᾿ αὐτοῦ καὶ ἠκολούθει αὐτῷ ὄχλος πολύς καὶ συνέθλιβον αὐτόν',
   'kai apēlthen met autou kai ēkolouthei autō ochlos polys kai synethlibov auton',
   '''Went with him'' — Jesus responds immediately to Jairus'' request. ''Thronged'' (synethlibov — pressed against, crushed against him). The crowd is so dense that movement is difficult. This crowd pressure sets the scene for the next episode: in this crush, one woman''s deliberate touch will be distinguished from the accidental contact of hundreds.',
   NULL),
  (25, 'And a certain woman, which had an issue of blood twelve years,',
   'καὶ γυνή τις οὖσα ἐν ῥύσει αἵματος ἔτη δώδεκα',
   'kai gynē tis ousa en rhysei haimatos etē dōdeka',
   '''Issue of blood'' (rhysei haimatos — a flow of blood; a chronic hemorrhage, likely a gynecological condition). ''Twelve years'' — she has suffered for the same duration as Jairus'' daughter has lived (the girl is twelve, v.42). This coincidence links the two stories. Under Levitical law (Leviticus 15:25-27), this condition made her perpetually ceremonially unclean — anything she touched became unclean, isolating her from worship and community.',
   NULL),
  (26, 'And had suffered many things of many physicians, and had spent all that she had, and was nothing bettered, but rather grew worse,',
   'καὶ πολλὰ παθοῦσα ὑπὸ πολλῶν ἰατρῶν καὶ δαπανήσασα τὰ παρ᾿ αὐτῆς πάντα καὶ μηδὲν ὠφεληθεῖσα ἀλλὰ μᾶλλον εἰς τὸ χεῖρον ἐλθοῦσα',
   'kai polla pathousa hypo pollōn iatrōn kai dapanēsasa ta par autēs panta kai mēden ōphelētheisa alla mallon eis to cheiron elthousa',
   '''Suffered many things of many physicians'' (polla pathousa hypo pollōn iatrōn — endured much from many doctors). ''Spent all that she had'' (dapanēsasa ta panta — exhausted all her resources). ''Nothing bettered, but rather grew worse'' — twelve years of medical treatment had only depleted her financially and worsened her condition. Mark''s candid assessment of medical failure is striking. This woman has exhausted every human remedy.',
   NULL),
  (27, 'When she had heard of Jesus, came in the press behind, and touched his garment.',
   'ἀκούσασα περὶ τοῦ Ἰησοῦ ἐλθοῦσα ἐν τῷ ὄχλῳ ὄπισθεν ἥψατο τοῦ ἱματίου αὐτοῦ',
   'akousasa peri tou Iēsou elthousa en tō ochlō opisthen hēpsato tou himatiou autou',
   '''Heard of Jesus'' — faith comes by hearing (Romans 10:17). ''Came in the press behind'' — she approaches from behind, trying to remain unnoticed. As an unclean woman, she should not be touching anyone in the crowd — every person she brushes against becomes ceremonially unclean. ''Touched his garment'' (hēpsato tou himatiou — grasped his outer cloak). Her touch is deliberate, faith-filled, and desperate.',
   NULL),
  (28, 'For she said, If I may touch but his clothes, I shall be whole.',
   'ἔλεγεν γὰρ ὅτι ἐὰν ἅψωμαι κἂν τῶν ἱματίων αὐτοῦ σωθήσομαι',
   'elegen gar hoti ean hapsōmai kan tōn himatiōn autou sōthēsomai',
   '''She said'' (elegen — she kept saying to herself; imperfect: she repeated this conviction). ''If I may touch but his clothes'' (ean hapsōmai kan tōn himatiōn — if I can just touch even his garments). ''I shall be whole'' (sōthēsomai — I shall be saved/healed). Her faith is extraordinary: she believes that even indirect contact with Jesus'' clothing carries healing power. Her reasoning, though imperfect (it is not the garment but Jesus himself), expresses genuine faith.',
   NULL),
  (29, 'And straightway the fountain of her blood was dried up; and she felt in her body that she was healed of that plague.',
   'καὶ εὐθέως ἐξηράνθη ἡ πηγὴ τοῦ αἵματος αὐτῆς καὶ ἔγνω τῷ σώματι ὅτι ἴαται ἀπὸ τῆς μάστιγος',
   'kai eutheōs exēranthē hē pēgē tou haimatos autēs kai egnō tō sōmati hoti iatai apo tēs mastigos',
   '''Straightway'' (eutheōs — immediately). ''Fountain of her blood was dried up'' (exēranthē hē pēgē — the source/spring was dried up; the hemorrhage stopped at its source, not just its symptom). ''Felt in her body'' (egnō tō sōmati — she knew in her body; physical, unmistakable awareness). ''Healed of that plague'' (iatai apo tēs mastigos — cured of that scourge). The healing is instant, complete, and physically perceptible. Twelve years of suffering end in a single moment.',
   NULL),
  (30, 'And Jesus, immediately knowing in himself that virtue had gone out of him, turned him about in the press, and said, Who touched my clothes?',
   'καὶ εὐθέως ὁ Ἰησοῦς ἐπιγνοὺς ἐν ἑαυτῷ τὴν ἐξ αὐτοῦ δύναμιν ἐξελθοῦσαν ἐπιστραφεὶς ἐν τῷ ὄχλῳ ἔλεγεν τίς μου ἥψατο τῶν ἱματίων',
   'kai eutheōs ho Iēsous epignous en heautō tēn ex autou dynamin exelthousan epistrapheis en tō ochlō elegen tis mou hēpsato tōn himatiōn',
   '''Immediately knowing'' (epignous — perceiving fully). ''Virtue had gone out of him'' (tēn dynamin exelthousan — the power having gone forth; dynamis — power, ability). ''Who touched my clothes?'' — Jesus knows power has been drawn from him and seeks the person. He does not ask because he lacks knowledge but because he wants the woman to come forward, to move from secret faith to public testimony. Anonymous faith must become confessing faith.',
   NULL),
  (31, 'And his disciples said unto him, Thou seest the multitude thronging thee, and sayest thou, Who touched me?',
   'καὶ ἔλεγον αὐτῷ οἱ μαθηταὶ αὐτοῦ βλέπεις τὸν ὄχλον συνθλίβοντά σε καὶ λέγεις τίς μου ἥψατο',
   'kai elegon autō hoi mathētai autou blepeis ton ochlon synthlibonta se kai legeis tis mou hēpsato',
   '''Thou seest the multitude thronging thee'' — the disciples think the question is absurd: hundreds are pressing against Jesus. They cannot distinguish between the crowd''s accidental contact and the woman''s deliberate faith-touch. But Jesus can. In a crowd of touches, one touch was different — it was the touch of faith.',
   NULL),
  (32, 'And he looked round about to see her that had done this thing.',
   'καὶ περιεβλέπετο ἰδεῖν τὴν τοῦτο ποιήσασαν',
   'kai perieblepeto idein tēn touto poiēsasan',
   '''Looked round about'' (perieblepeto — kept looking around; imperfect: his searching gaze swept the crowd). ''Her'' (tēn — the feminine article; Jesus knew it was a woman). His gaze is not accusatory but seeking — he wants to give her something more than physical healing. He wants to give her personal relationship, public affirmation, and lasting peace.',
   NULL),
  (33, 'But the woman fearing and trembling, knowing what was done in her, came and fell down before him, and told him all the truth.',
   'ἡ δὲ γυνὴ φοβηθεῖσα καὶ τρέμουσα εἰδυῖα ὃ γέγονεν αὐτῇ ἦλθεν καὶ προσέπεσεν αὐτῷ καὶ εἶπεν αὐτῷ πᾶσαν τὴν ἀλήθειαν',
   'hē de gynē phobētheisa kai tremousa eiduia ho gegonen autē ēlthen kai prosepesen autō kai eipen autō pasan tēn alētheian',
   '''Fearing and trembling'' — she expected rebuke: she was unclean and had touched a holy man. ''Knowing what was done in her'' (eiduia ho gegonen — aware of what had happened). ''Fell down before him'' (prosepesen — prostrated herself). ''Told him all the truth'' (pasan tēn alētheian — the whole truth). Her complete confession includes twelve years of suffering, failed treatments, her reasoning about the touch, and the instant healing. Jesus draws out her story because testimony completes healing.',
   NULL),
  (34, 'And he said unto her, Daughter, thy faith hath made thee whole; go in peace, and be whole of thy plague.',
   'ὁ δὲ εἶπεν αὐτῇ θυγάτηρ ἡ πίστις σου σέσωκέν σε ὕπαγε εἰς εἰρήνην καὶ ἴσθι ὑγιὴς ἀπὸ τῆς μάστιγός σου',
   'ho de eipen autē thygatēr hē pistis sou sesōken se hypage eis eirēnēn kai isthi hygiēs apo tēs mastigos sou',
   '''Daughter'' (thygatēr — daughter; a term of tenderness and family inclusion, paralleling Jairus'' daughter). ''Thy faith hath made thee whole'' (hē pistis sou sesōken se — your faith has saved you; perfect tense: permanent result). ''Go in peace'' (hypage eis eirēnēn — go into peace; Hebrew shalom — total well-being, not just absence of conflict). ''Be whole of thy plague'' (isthi hygiēs — be healthy; present imperative: remain healed). Jesus gives her four things: a family name (daughter), a cause (faith), a destiny (peace), and a permanent cure (wholeness).',
   'This verse is the heart of the story. Jesus corrects the woman''s understanding: it was not the garment that healed her but her faith. The power was not magical but relational. ''Thy faith'' does not mean her faith was the source of healing — God is the healer — but that faith was the channel through which God''s power flowed. The word sesōken (has saved) carries the full weight of salvation: physical healing, spiritual restoration, and relational wholeness. The woman who came in fear and secrecy leaves as a publicly acknowledged ''daughter'' with peace and permanent healing.'),
  (35, 'While he yet spake, there came from the ruler of the synagogue''s house certain which said, Thy daughter is dead: why troublest thou the Master any further?',
   'ἔτι αὐτοῦ λαλοῦντος ἔρχονται ἀπὸ τοῦ ἀρχισυναγώγου λέγοντες ὅτι ἡ θυγάτηρ σου ἀπέθανεν τί ἔτι σκύλλεις τὸν διδάσκαλον',
   'eti autou lalountos erchontai apo tou archisynagōgou legontes hoti hē thygatēr sou apethanen ti eti skylleis ton didaskalon',
   '''While he yet spake'' — the delay caused by the hemorrhaging woman now appears fatal. ''Thy daughter is dead'' (apethanen — has died; aorist: the death has occurred). ''Why troublest thou the Master any further?'' (ti eti skylleis — why still bother; skyllō means to flay, to harass). The messengers assume death is beyond even Jesus'' power. Their logic: healing is one thing; raising the dead is another. For Jesus, there is no such boundary.',
   NULL),
  (36, 'As soon as Jesus heard the word that was spoken, he saith unto the ruler of the synagogue, Be not afraid, only believe.',
   'ὁ δὲ Ἰησοῦς εὐθέως ἀκούσας τὸν λόγον λαλούμενον λέγει τῷ ἀρχισυναγώγῳ μὴ φοβοῦ μόνον πίστευε',
   'ho de Iēsous eutheōs akousas ton logon laloumenon legei tō archisynagōgō mē phobou monon pisteue',
   '''As soon as'' (eutheōs — immediately; Jesus responds without a moment''s hesitation). ''Be not afraid'' (mē phobou — stop being afraid; present imperative with negative: cease the fear that is gripping you). ''Only believe'' (monon pisteue — just keep believing; present imperative: continue the faith you have already shown). Two commands: stop fearing, keep believing. Fear and faith are mutually exclusive. Jesus asks Jairus to do the hardest thing: trust in the face of the worst possible news.',
   'This is one of the most powerful pastoral statements in the Gospels. Death has been announced, hope appears extinguished, and Jesus says simply: ''Be not afraid, only believe.'' He does not explain, argue, or give reasons. He offers himself as the object of faith. The command is absurd by human logic — the girl is dead — but Jesus operates beyond human logic. He has just demonstrated power over demons (vv.1-20), chronic disease (vv.25-34), and nature (4:39). Death is the last frontier, and he is about to cross it.'),
  (37, 'And he suffered no man to follow him, save Peter, and James, and John the brother of James.',
   'καὶ οὐκ ἀφῆκεν οὐδένα αὐτῷ συνακολουθῆσαι εἰ μὴ Πέτρον καὶ Ἰάκωβον καὶ Ἰωάννην τὸν ἀδελφὸν Ἰακώβου',
   'kai ouk aphēken oudena autō synakolouthēsai ei mē Petron kai Iakōbon kai Iōannēn ton adelphon Iakōbou',
   '''Suffered no man'' (ouk aphēken oudena — permitted no one). ''Save Peter, James, and John'' — Jesus'' inner circle (also present at the Transfiguration, 9:2, and Gethsemane, 14:33). They alone will witness the most intimate miracle in the Gospels. The restriction is part of the messianic secret and the reverence appropriate to raising the dead.',
   NULL),
  (38, 'And he cometh to the house of the ruler of the synagogue, and seeth the tumult, and them that wept and wailed greatly.',
   'καὶ ἔρχεται εἰς τὸν οἶκον τοῦ ἀρχισυναγώγου καὶ θεωρεῖ θόρυβον κλαίοντας καὶ ἀλαλάζοντας πολλά',
   'kai erchetai eis ton oikon tou archisynagōgou kai theōrei thorubon klaiontas kai alalazontas polla',
   '''Tumult'' (thorubon — uproar, commotion). ''Wept'' (klaiontas — crying). ''Wailed greatly'' (alalazontas polla — shrieking, wailing loudly). Professional mourners had already been summoned — the death was confirmed and the mourning rituals had begun. The noise is cacophonous. Jesus enters this scene of finality and despair.',
   NULL),
  (39, 'And when he was come in, he saith unto them, Why make ye this ado, and weep? the damsel is not dead, but sleepeth.',
   'καὶ εἰσελθὼν λέγει αὐτοῖς τί θορυβεῖσθε καὶ κλαίετε τὸ παιδίον οὐκ ἀπέθανεν ἀλλὰ καθεύδει',
   'kai eiselthōn legei autois ti thorybeisthe kai klaiete to paidion ouk apethanen alla katheudei',
   '''Why make ye this ado'' (ti thorybeisthe — why are you in turmoil?). ''The damsel is not dead, but sleepeth'' (ouk apethanen alla katheudei — she has not died but is sleeping). Jesus does not deny the physical reality of death but redefines it. From God''s perspective, death is sleep — temporary, reversible, subject to waking. This is not metaphor but theology: for those in Jesus'' hands, death is not permanent.',
   NULL),
  (40, 'And they laughed him to scorn. But when he had put them all out, he taketh the father and the mother of the damsel, and them that were with him, and entereth in where the damsel was lying.',
   'καὶ κατεγέλων αὐτοῦ ὁ δὲ ἐκβαλὼν ἅπαντας παραλαμβάνει τὸν πατέρα τοῦ παιδίου καὶ τὴν μητέρα καὶ τοὺς μετ᾿ αὐτοῦ καὶ εἰσπορεύεται ὅπου ἦν τὸ παιδίον ἀνακείμενον',
   'kai kategelōn autou ho de ekbalōn hapantas paralambanei ton patera tou paidiou kai tēn mētera kai tous met autou kai eisporeuetai hopou ēn to paidion anakeimenon',
   '''Laughed him to scorn'' (kategelōn — ridiculed, mocked). ''Put them all out'' (ekbalōn hapantas — cast out everyone; the same strong verb used for expelling demons). ''Taketh the father and the mother'' — only the parents and the three disciples enter. Jesus clears the room of unbelief. Mockery and miracle cannot coexist. The raising of the dead requires an atmosphere of faith, not scorn.',
   NULL),
  (41, 'And he took the damsel by the hand, and said unto her, Talitha cumi; which is, being interpreted, Damsel, I say unto thee, arise.',
   'καὶ κρατήσας τῆς χειρὸς τοῦ παιδίου λέγει αὐτῇ ταλιθὰ κούμι ὅ ἐστιν μεθερμηνευόμενον τὸ κοράσιον σοὶ λέγω ἔγειρε',
   'kai kratēsas tēs cheiros tou paidiou legei autē talitha koumi ho estin methermēneuomenon to korasion soi legō egeire',
   '''Took the damsel by the hand'' (kratēsas tēs cheiros — grasped her hand; touching a corpse made one unclean, but as with the leper, cleanness flows from Jesus to the unclean). ''Talitha cumi'' — Aramaic, preserved in Jesus'' original language; one of the few places where Mark records Jesus'' actual words in Aramaic. ''Talitha'' (little lamb, young girl; a term of endearment). ''Cumi'' (get up, arise). ''I say unto thee, arise'' (soi legō egeire — to you I say, rise). The same verb (egeirō) used for resurrection. Jesus speaks to a dead child as a father waking his daughter from sleep.',
   'This is one of the most tender and powerful scenes in the Gospels. Jesus preserves the Aramaic words — talitha koumi — perhaps because they were seared into Peter''s memory (Mark''s source). The tenderness of ''little lamb'' combined with the authority of ''arise'' captures the essence of Jesus'' character: infinite gentleness with infinite power. He touches what is dead and makes it alive. He calls what does not exist as though it does (Romans 4:17). The one who calmed the sea with a word now commands the dead with a word — and both obey.'),
  (42, 'And straightway the damsel arose, and walked; for she was of the age of twelve years. And they were astonished with a great astonishment.',
   'καὶ εὐθέως ἀνέστη τὸ κοράσιον καὶ περιεπάτει ἦν γὰρ ἐτῶν δώδεκα καὶ ἐξέστησαν ἐκστάσει μεγάλῃ',
   'kai eutheōs anestē to korasion kai periepatei ēn gar etōn dōdeka kai exestēsan ekstasei megalē',
   '''Straightway the damsel arose'' (eutheōs anestē — immediately she rose up). ''And walked'' (periepatei — she began walking around; imperfect: ongoing action, proving the resurrection was real and complete). ''Twelve years'' — the same number as the hemorrhaging woman''s twelve years of suffering. The two stories are linked numerologically. ''Astonished with a great astonishment'' (exestēsan ekstasei megalē — they were beside themselves with great ecstasy). The response echoes the crowd''s reaction throughout Mark: overwhelming awe at Jesus'' power.',
   NULL),
  (43, 'And he charged them straitly that no man should know it; and commanded that something should be given her to eat.',
   'καὶ διεστείλατο αὐτοῖς πολλὰ ἵνα μηδεὶς γνῷ τοῦτο καὶ εἶπεν δοθῆναι αὐτῇ φαγεῖν',
   'kai diesteilato autois polla hina mēdeis gnō touto kai eipen dothēnai autē phagein',
   '''Charged them straitly'' (diesteilato polla — strongly commanded). ''That no man should know'' — the messianic secret again, though keeping a resurrection secret from a household of mourners seems nearly impossible. ''Something should be given her to eat'' — a detail of exquisite tenderness and practical care. The risen girl needs food. Jesus, who has just performed the most extraordinary miracle, attends to the most ordinary need. Power and compassion, the supernatural and the practical, are perfectly united.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 5;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.9 Legion
  ('λεγεών', 'legeōn', 'G3003', 'Legion — a Latin loanword (legio) denoting a Roman military unit of 4,000-6,000 soldiers. The word is used as the demons'' collective name, indicating both their vast number and their organized, military-like hostility. A legion was Rome''s most fearsome fighting force; the demonic ''legion'' represents the most concentrated spiritual opposition Jesus has yet faced. Yet even this army of darkness is utterly helpless before Jesus'' word. The military metaphor also suggests that spiritual warfare is real, organized, and far more intense than human conflicts.', 1),
  -- v.15 right mind
  ('σωφρονέω', 'sōphroneō', 'G4993', 'To be of sound mind, to be self-controlled, to think soberly — from sōs (safe, sound) + phrēn (mind, understanding). The healed demoniac is sōphronounta — restored to rational, ordered thinking. Demonic possession had destroyed his capacity for coherent thought, self-control, and social interaction. Jesus restores not just physical freedom but mental wholeness. The word is used by Paul for the proper Christian mindset (Romans 12:3, 2 Timothy 1:7) — clear, balanced, self-controlled thinking that comes from God.', 2),
  -- v.28 made whole / saved
  ('σῴζω', 'sōzō', 'G4982', 'To save, deliver, heal, make whole, preserve — from saos (safe). The most comprehensive salvation word in the NT, covering physical healing (v.28), spiritual deliverance (v.34), and eschatological rescue. The woman says ''I shall be made whole'' (sōthēsomai); Jesus says ''thy faith hath made thee whole'' (sesōken se). The word encompasses every dimension of rescue: from disease, from uncleanness, from isolation, from fear. In Mark 5, sōzō ties together all three miracles: the demoniac saved from demons, the woman saved from disease, the girl saved from death.', 3),
  -- v.30 virtue / power
  ('δύναμις', 'dynamis', 'G1411', 'Power, ability, might, miracle — from dynamai (to be able). The English words ''dynamic'' and ''dynamite'' derive from this root. When Jesus perceives that ''power has gone out'' (dynamin exelthousan), it does not mean he was depleted but that divine healing energy was actively channelled through him to the woman. Dynamis in Mark describes both Jesus'' inherent divine power and the mighty works that flow from it. This power is personal, relational, and responsive to faith — it flows to those who reach for it in trust.', 4),
  -- v.34 faith
  ('πίστις', 'pistis', 'G4102', 'Faith, trust, confidence — from peithō (to persuade). In v.34, Jesus identifies the woman''s faith as the channel of her healing: ''thy faith hath made thee whole.'' Her faith was not perfect (she thought the garment had power), but it was directed at the right person. Faith in Mark is not intellectual precision but personal trust — reaching for Jesus in desperation, even imperfectly. Jesus honours the direction of faith (toward him) even when its theology is incomplete. What matters is not the strength of faith but the object of faith.', 5),
  -- v.36 believe
  ('πιστεύω', 'pisteuō', 'G4100', 'To believe, trust, have faith in — from pistis (faith). In v.36, pisteue is a present imperative: ''keep on believing'' — maintain the faith you showed when you first came to me. Jairus had faith when his daughter was sick; now that she is dead, Jesus commands him to hold onto that faith across the abyss of death. This is the summit of faith in Mark: believing when every circumstance says it is futile. Faith is not optimism; it is trust in the person of Jesus against all evidence.', 6),
  -- v.41 arise / egeirō
  ('ἐγείρω', 'egeirō', 'G1453', 'To raise up, awaken, lift up, resurrect — a word used for both waking from sleep and raising from death. In v.41, Jesus uses the Aramaic ''koumi'' (Greek egeire) to address a dead girl. The word carries dual resonance: on one level, Jesus is simply telling a child to get up; on a deeper level, he is exercising the divine prerogative of resurrection. The same verb will describe Jesus'' own resurrection (16:6: ēgerthē — he is risen). In Mark, egeirō links the healing of the paralytic (2:11), the raising of Jairus'' daughter (5:41), and the resurrection of Christ into one continuous demonstration of divine life-giving power.', 7),
  -- v.19 Lord / kyrios
  ('κύριος', 'kyrios', 'G2962', 'Lord, master, sovereign — here used by Jesus to refer to God (''the Lord hath done for thee''), but the healed man preaches about Jesus (v.20). The identification is seamless: what God has done, Jesus has done. Kyrios functions as a bridge between the God of Israel and the person of Christ. In Gentile territory, where ''the Most High God'' (v.7) was a known title, Jesus is identified as the Lord whose compassion has transformed a demoniac into a missionary.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 5
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 9
    WHEN 2 THEN 15
    WHEN 3 THEN 28
    WHEN 4 THEN 30
    WHEN 5 THEN 34
    WHEN 6 THEN 36
    WHEN 7 THEN 41
    WHEN 8 THEN 19
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 country of the Gadarenes
  (1, 'Matthew 8:28', 1),
  (1, 'Luke 8:26', 2),
  -- v.7 Son of the most high God
  (7, 'Mark 1:24', 3),
  (7, 'Acts 16:17', 4),
  -- v.9 Legion
  (9, 'Luke 8:30', 5),
  -- v.13 swine drowned
  (13, 'Matthew 8:32', 6),
  -- v.19 go home and tell
  (19, 'Mark 1:44-45', 7),
  (19, 'Psalm 66:16', 8),
  -- v.22 Jairus
  (22, 'Matthew 9:18', 9),
  (22, 'Luke 8:41', 10),
  -- v.25 issue of blood
  (25, 'Leviticus 15:25-27', 11),
  (25, 'Luke 8:43', 12),
  -- v.34 thy faith hath made thee whole
  (34, 'Mark 10:52', 13),
  (34, 'Luke 7:50', 14),
  (34, 'Luke 17:19', 15),
  -- v.36 be not afraid only believe
  (36, 'Luke 8:50', 16),
  (36, 'John 11:25-26', 17),
  -- v.39 not dead but sleepeth
  (39, 'John 11:11-14', 18),
  (39, '1 Thessalonians 4:13-14', 19),
  -- v.41 Talitha cumi
  (41, 'Luke 8:54', 20),
  (41, 'John 11:43', 21),
  (41, 'Acts 9:40', 22),
  -- v.43 tell no one
  (43, 'Mark 1:44', 23),
  (43, 'Mark 7:36', 24)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 5
  AND v.verse_number = cr.verse_number;
