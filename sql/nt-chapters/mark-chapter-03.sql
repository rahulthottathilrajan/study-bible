-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 3 — The Twelve Appointed and the Unforgivable Sin
-- 35 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Mark 3 intensifies the conflict between Jesus and the religious establishment while defining the boundaries of the new community Jesus is forming. The chapter opens with another Sabbath confrontation: Jesus heals a man with a withered hand in the synagogue (vv.1-6), and the Pharisees immediately conspire with the Herodians to destroy him — the first explicit murder plot in Mark. Jesus withdraws to the sea, where enormous multitudes press upon him (vv.7-12). He then ascends a mountain and appoints twelve apostles ''that they should be with him, and that he might send them forth to preach, and to have power to heal sicknesses, and to cast out devils'' (vv.13-19). When Jesus returns home, the crowds make it impossible even to eat (v.20). His own family thinks he is ''beside himself'' (v.21). Then come the scribes from Jerusalem with the most serious charge yet: ''He hath Beelzebub'' and ''by the prince of the devils casteth he out devils'' (v.22). Jesus refutes this with devastating logic — a kingdom divided against itself cannot stand (vv.23-27) — and then delivers one of the most solemn warnings in Scripture: blasphemy against the Holy Spirit ''hath never forgiveness'' (vv.28-30). The chapter closes with a redefinition of family: ''Whosoever shall do the will of God, the same is my brother, and my sister, and mother'' (vv.31-35). The new community is defined not by blood but by obedience.',
  'The New Community — Twelve Apostles, the Unforgivable Sin, and the True Family of Jesus',
  'ἀπόστολος (apostolos)',
  'Apostle, one sent forth — from apostellō (to send away on a mission). Jesus appoints twelve men not merely as students but as commissioned envoys with delegated authority. The number twelve deliberately echoes the twelve tribes of Israel: Jesus is reconstituting the people of God around himself. The apostles are called first to ''be with him'' (personal relationship) and then to ''preach'' and exercise ''power'' (public ministry). Being precedes doing; communion with Christ precedes commission from Christ.',
  '["Healing on the Sabbath: The Plot to Kill Jesus (vv.1-6): There was a man which had a withered hand. Is it lawful to do good on the sabbath days or to do evil to save life or to kill. He saith unto the man Stretch forth thine hand and his hand was restored whole as the other. The Pharisees went forth and straightway took counsel with the Herodians against him how they might destroy him","Multitudes and Unclean Spirits (vv.7-12): A great multitude from Galilee followed him and from Judaea and from Jerusalem and from beyond Jordan. Unclean spirits when they saw him fell down before him and cried saying Thou art the Son of God. And he straitly charged them that they should not make him known","The Appointment of the Twelve (vv.13-19): He goeth up into a mountain and calleth unto him whom he would and they came unto him. And he ordained twelve that they should be with him and that he might send them forth to preach and to have power to heal sicknesses and to cast out devils","The Beelzebub Controversy and the Unforgivable Sin (vv.20-30): He hath Beelzebub and by the prince of the devils casteth he out devils. How can Satan cast out Satan. If a kingdom be divided against itself that kingdom cannot stand. No man can enter into a strong man''s house except he will first bind the strong man. All sins shall be forgiven unto the sons of men but he that shall blaspheme against the Holy Ghost hath never forgiveness","The True Family of Jesus (vv.31-35): There came then his brethren and his mother and standing without sent unto him calling him. Who is my mother or my brethren. Behold my mother and my brethren. For whosoever shall do the will of God the same is my brother and my sister and mother"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 35 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And he entered again into the synagogue; and there was a man there which had a withered hand.',
   'Καὶ εἰσῆλθεν πάλιν εἰς τὴν συναγωγήν καὶ ἦν ἐκεῖ ἄνθρωπος ἐξηραμμένην ἔχων τὴν χεῖρα',
   'Kai eisēlthen palin eis tēn synagōgēn kai ēn ekei anthrōpos exērammenēn echōn tēn cheira',
   '''Again'' (palin — once more; returning to the synagogue setting of 1:21). ''Withered'' (exērammenēn — dried up, shrivelled; perfect participle indicating a permanent condition). The hand was paralysed and atrophied. Luke 6:6 specifies it was the right hand. The scene is set for another Sabbath controversy — this time with the authorities deliberately watching.',
   NULL),
  (2, 'And they watched him, whether he would heal him on the sabbath day; that they might accuse him.',
   'καὶ παρετήρουν αὐτὸν εἰ τοῖς σάββασιν θεραπεύσει αὐτόν ἵνα κατηγορήσωσιν αὐτοῦ',
   'kai paretēroun auton ei tois sabbasin therapeusei auton hina katēgorēsōsin autou',
   '''Watched'' (paretēroun — were watching closely, observing with hostile intent; imperfect: they kept watching). ''That they might accuse'' (hina katēgorēsōsin — in order to bring formal charges). The authorities are no longer merely questioning but actively seeking evidence for prosecution. They have prejudged Jesus; they are looking for a legal case.',
   NULL),
  (3, 'And he saith unto the man which had the withered hand, Stand forth.',
   'καὶ λέγει τῷ ἀνθρώπῳ τῷ ἐξηραμμένην ἔχοντι τὴν χεῖρα ἔγειρε εἰς τὸ μέσον',
   'kai legei tō anthrōpō tō exērammenēn echonti tēn cheira egeire eis to meson',
   '''Stand forth'' (egeire eis to meson — rise up into the middle; literally ''arise into the midst''). Jesus does not heal secretly or wait until after the Sabbath. He deliberately places the man in the centre of the synagogue, forcing the confrontation. Jesus will not compromise his mission to avoid conflict with those who have already decided to destroy him.',
   NULL),
  (4, 'And he saith unto them, Is it lawful to do good on the sabbath days, or to do evil? to save life, or to kill? But they held their peace.',
   'καὶ λέγει αὐτοῖς ἔξεστιν τοῖς σάββασιν ἀγαθοποιῆσαι ἢ κακοποιῆσαι ψυχὴν σῶσαι ἢ ἀποκτεῖναι οἱ δὲ ἐσιώπων',
   'kai legei autois exestin tois sabbasin agathopoiēsai ē kakopoiēsai psychēn sōsai ē apokteinai hoi de esiōpōn',
   '''Is it lawful'' (exestin — is it permitted). ''To do good or to do evil'' — Jesus reduces the argument to its essence: the Sabbath is about good, not mere inactivity. Failing to do good when you can is itself doing evil. ''To save life or to kill'' — devastating irony: Jesus is about to save a life on the Sabbath; the Pharisees are about to plot a killing (v.6). ''They held their peace'' (esiōpōn — they were silent; imperfect: they kept silent, refusing to answer). Their silence condemns them.',
   NULL),
  (5, 'And when he had looked round about on them with anger, being grieved for the hardness of their hearts, he saith unto the man, Stretch forth thine hand. And he stretched it out: and his hand was restored whole as the other.',
   'καὶ περιβλεψάμενος αὐτοὺς μετ᾿ ὀργῆς συλλυπούμενος ἐπὶ τῇ πωρώσει τῆς καρδίας αὐτῶν λέγει τῷ ἀνθρώπῳ ἔκτεινον τὴν χεῖρά σου καὶ ἐξέτεινεν καὶ ἀποκατεστάθη ἡ χεὶρ αὐτοῦ ὑγιὴς ὡς ἡ ἄλλη',
   'kai periblepsamenos autous met orgēs syllypoumenos epi tē pōrōsei tēs kardias autōn legei tō anthrōpō ekteinon tēn cheira sou kai exeteinen kai apekatestathē hē cheir autou hygiēs hōs hē allē',
   '''Looked round about'' (periblepsamenos — looked around at; a verb unique to Mark, describing Jesus'' piercing gaze). ''With anger'' (met orgēs — with wrath; one of the rare occasions Mark records Jesus'' anger). ''Grieved'' (syllypoumenos — deeply grieved, distressed; grieving together with the man). ''Hardness of their hearts'' (pōrōsei tēs kardias — petrification, callousness of heart; the same root as the judicial hardening in Romans 11:7). ''Stretch forth'' — Jesus commands what is humanly impossible; faith obeys, and the power follows. ''Restored whole'' (apekatestathē — fully restored to its original condition).',
   'This verse reveals the emotional depth of Jesus'' humanity. He is both angry (orgē — righteous indignation at their calloused disregard for human suffering) and grieved (syllypoumenos — sorrowful at their spiritual blindness). These are not contradictory emotions: Jesus is angry at the sin and grieved over the sinners. The healing itself is notable: Jesus speaks a word, the man obeys, and the hand is completely restored. No touch, no ritual, just authoritative command — demonstrating that the Sabbath was designed for exactly this kind of divine, restorative work.'),
  (6, 'And the Pharisees went forth, and straightway took counsel with the Herodians against him, how they might destroy him.',
   'καὶ ἐξελθόντες οἱ Φαρισαῖοι εὐθέως μετὰ τῶν Ἡρῳδιανῶν συμβούλιον ἐποίουν κατ᾿ αὐτοῦ ὅπως αὐτὸν ἀπολέσωσιν',
   'kai exelthontes hoi Pharisaioi eutheōs meta tōn Hērōdianōn symboulion epoioun kat autou hopōs auton apolesōsin',
   '''Straightway'' (eutheōs — immediately; the urgency of their murderous intent). ''Herodians'' (Hērōdianōn — supporters of Herod Antipas; a political faction normally hostile to the Pharisees). ''Took counsel'' (symboulion epoioun — began plotting). ''Destroy him'' (apolesōsin — kill, annihilate). The Pharisees and Herodians — religious purists and political pragmatists — unite against a common enemy. This unholy alliance foreshadows the coalition that will eventually crucify Jesus.',
   NULL),
  (7, 'But Jesus withdrew himself with his disciples to the sea: and a great multitude from Galilee followed him, and from Judaea,',
   'καὶ ὁ Ἰησοῦς ἀνεχώρησεν μετὰ τῶν μαθητῶν αὐτοῦ πρὸς τὴν θάλασσαν καὶ πολὺ πλῆθος ἀπὸ τῆς Γαλιλαίας ἠκολούθησαν αὐτῷ καὶ ἀπὸ τῆς Ἰουδαίας',
   'kai ho Iēsous anechōrēsen meta tōn mathētōn autou pros tēn thalassan kai poly plēthos apo tēs Galilaias ēkolouthēsan autō kai apo tēs Ioudaias',
   '''Withdrew'' (anechōrēsen — retreated; not from fear but from strategic wisdom — his hour has not yet come). ''A great multitude'' — while the leaders reject Jesus, the people flock to him. The geographic breadth is remarkable: Galilee, Judaea (v.7), Jerusalem, Idumaea, beyond Jordan, Tyre and Sidon (v.8) — Jesus'' fame has spread throughout the entire region.',
   NULL),
  (8, 'And from Jerusalem, and from Idumaea, and from beyond Jordan; and they about Tyre and Sidon, a great multitude, when they had heard what great things he did, came unto him.',
   'καὶ ἀπὸ Ἱεροσολύμων καὶ ἀπὸ τῆς Ἰδουμαίας καὶ πέραν τοῦ Ἰορδάνου καὶ οἱ περὶ Τύρον καὶ Σιδῶνα πλῆθος πολύ ἀκούσαντες ὅσα ἐποίει ἦλθον πρὸς αὐτόν',
   'kai apo Hierosolymōn kai apo tēs Idoumaias kai peran tou Iordanou kai hoi peri Tyron kai Sidōna plēthos poly akousantes hosa epoiei ēlthon pros auton',
   '''Idumaea'' — the ancient Edom, south of Judaea. ''Beyond Jordan'' — Transjordan/Peraea. ''Tyre and Sidon'' — Phoenician coastal cities, Gentile territory. The crowd represents virtually the entire map of Palestine plus Gentile regions. Mark is showing that Jesus'' appeal crosses all geographic, ethnic, and social boundaries. What the leaders reject, the masses embrace.',
   NULL),
  (9, 'And he spake to his disciples, that a small ship should wait on him because of the multitude, lest they should throng him.',
   'καὶ εἶπεν τοῖς μαθηταῖς αὐτοῦ ἵνα πλοιάριον προσκαρτερῇ αὐτῷ διὰ τὸν ὄχλον ἵνα μὴ θλίβωσιν αὐτόν',
   'kai eipen tois mathētais autou hina ploiarion proskarterē autō dia ton ochlon hina mē thlibōsin auton',
   '''Small ship'' (ploiarion — a little boat). ''Wait on him'' (proskarterē — stand ready, be at his service). ''Throng'' (thlibōsin — crush, press upon). The crowd is so large and eager that Jesus needs a boat as an escape route. The practical detail reflects eyewitness testimony (likely Peter). Jesus manages the crowds without rejecting them.',
   NULL),
  (10, 'For he had healed many; insomuch that they pressed upon him for to touch him, as many as had plagues.',
   'πολλοὺς γὰρ ἐθεράπευσεν ὥστε ἐπιπίπτειν αὐτῷ ἵνα αὐτοῦ ἅψωνται ὅσοι εἶχον μάστιγας',
   'pollous gar etherapeusen hōste epipiptein autō hina autou hapsōntai hosoi eichon mastigas',
   '''Pressed upon him'' (epipiptein — falling upon him). ''Touch him'' (hapsōntai — make contact with). ''Plagues'' (mastigas — scourges, afflictions; literally whippings, as if disease was a divine scourging). The desperation is palpable: people are throwing themselves at Jesus, believing that even physical contact will bring healing. Compare 5:28 where the woman with the issue of blood has the same faith.',
   NULL),
  (11, 'And unclean spirits, when they saw him, fell down before him, and cried, saying, Thou art the Son of God.',
   'καὶ τὰ πνεύματα τὰ ἀκάθαρτα ὅταν αὐτὸν ἐθεώρει προσέπιπτεν αὐτῷ καὶ ἔκραζεν λέγοντα ὅτι σὺ εἶ ὁ υἱὸς τοῦ θεοῦ',
   'kai ta pneumata ta akatharta hotan auton etheōrei prosepipten autō kai ekrazen legonta hoti sy ei ho huios tou theou',
   '''Unclean spirits'' — demonic beings. ''When they saw him'' (etheōrei — perceived, beheld). ''Fell down'' (prosepipten — prostrated themselves; involuntary submission to Jesus'' authority). ''Thou art the Son of God'' — the demons consistently recognise and confess Jesus'' true identity. Their theology is accurate; their response is not worship but terror. The irony of Mark: demons know what the disciples are slow to understand.',
   NULL),
  (12, 'And he straitly charged them that they should not make him known.',
   'καὶ πολλὰ ἐπετίμα αὐτοῖς ἵνα μὴ φανερὸν αὐτὸν ποιήσωσιν',
   'kai polla epetima autois hina mē phaneron auton poiēsōsin',
   '''Straitly charged'' (polla epetima — many times rebuked them, repeatedly commanded). ''Make him known'' (phaneron poiēsōsin — make him manifest, reveal his identity). The messianic secret continues. Jesus will not accept testimony from demons, nor will he allow premature disclosure of his identity. The people must come to understand who he is through his teaching and actions, not through demonic proclamation.',
   NULL),
  (13, 'And he goeth up into a mountain, and calleth unto him whom he would: and they came unto him.',
   'καὶ ἀναβαίνει εἰς τὸ ὄρος καὶ προσκαλεῖται οὓς ἤθελεν αὐτός καὶ ἀπῆλθον πρὸς αὐτόν',
   'kai anabainei eis to oros kai proskaleitai hous ēthelen autos kai apēlthon pros auton',
   '''Goeth up into a mountain'' (anabainei eis to oros — ascends the mountain; echoing Moses at Sinai, where God constituted the twelve tribes). ''Calleth unto him whom he would'' (proskaleitai hous ēthelen — summoned those whom he himself desired; the initiative is entirely Christ''s). ''They came unto him'' — sovereign call and obedient response. Jesus chooses; they respond. Luke 6:12 adds that Jesus prayed all night before this selection.',
   NULL),
  (14, 'And he ordained twelve, that they should be with him, and that he might send them forth to preach,',
   'καὶ ἐποίησεν δώδεκα ἵνα ὦσιν μετ᾿ αὐτοῦ καὶ ἵνα ἀποστέλλῃ αὐτοὺς κηρύσσειν',
   'kai epoiēsen dōdeka hina ōsin met autou kai hina apostellē autous kēryssein',
   '''Ordained'' (epoiēsen — made, appointed, constituted). ''Twelve'' (dōdeka — twelve; symbolically representing the reconstituted twelve tribes of Israel). ''That they should be with him'' (hina ōsin met autou — the first purpose: intimate companionship). ''Send them forth to preach'' (apostellē... kēryssein — the second purpose: commissioned proclamation). The dual purpose is significant: apostolic ministry flows from personal relationship with Jesus. Being with Christ precedes being sent by Christ.',
   'The appointment of twelve apostles is one of the most significant acts in Jesus'' ministry. The number twelve is not accidental — it deliberately corresponds to the twelve tribes of Israel (Genesis 49, Exodus 24:4). Jesus is reconstituting the people of God around himself as the new centre. The twelve will sit on thrones judging the twelve tribes (Matthew 19:28). Their twofold calling — to be with Jesus and to be sent out — defines all Christian ministry: communion and commission, abiding and going, devotion and proclamation.'),
  (15, 'And to have power to heal sicknesses, and to cast out devils:',
   'καὶ ἔχειν ἐξουσίαν θεραπεύειν τὰς νόσους καὶ ἐκβάλλειν τὰ δαιμόνια',
   'kai echein exousian therapeuein tas nosous kai ekballein ta daimonia',
   '''Power'' (exousian — authority; the same authority Jesus himself exercises). ''Heal sicknesses'' (therapeuein tas nosous — cure diseases). ''Cast out devils'' (ekballein ta daimonia — expel demons). The apostles receive delegated authority — the same exousia Jesus demonstrated in chapters 1-2. They are not independent agents but extensions of Jesus'' own ministry.',
   NULL),
  (16, 'And Simon he surnamed Peter;',
   'καὶ ἐπέθηκεν τῷ Σίμωνι ὄνομα Πέτρον',
   'kai epethēken tō Simōni onoma Petron',
   '''Surnamed'' (epethēken onoma — placed upon him the name). ''Peter'' (Petron — rock, stone; Aramaic Cephas, John 1:42). Simon is always listed first among the Twelve. The new name signifies a new identity and role. Peter will be the spokesperson and leader of the apostolic band, despite his failures (14:66-72). The renaming echoes God''s renaming of Abram to Abraham (Genesis 17:5).',
   NULL),
  (17, 'And James the son of Zebedee, and John the brother of James; and he surnamed them Boanerges, which is, The sons of thunder:',
   'καὶ Ἰάκωβον τὸν τοῦ Ζεβεδαίου καὶ Ἰωάννην τὸν ἀδελφὸν τοῦ Ἰακώβου καὶ ἐπέθηκεν αὐτοῖς ὀνόματα Βοανεργές ὅ ἐστιν υἱοὶ βροντῆς',
   'kai Iakōbon ton tou Zebedaiou kai Iōannēn ton adelphon tou Iakōbou kai epethēken autois onomata Boanerges ho estin huioi brontēs',
   '''Boanerges'' — an Aramaic nickname meaning ''sons of thunder'' (huioi brontēs). This may refer to their fiery temperament (Luke 9:54 — they wanted to call down fire from heaven). James and John, along with Peter, form Jesus'' inner circle (5:37, 9:2, 14:33). James would be the first apostle martyred (Acts 12:2); John would be the last to die.',
   NULL),
  (18, 'And Andrew, and Philip, and Bartholomew, and Matthew, and Thomas, and James the son of Alphaeus, and Thaddaeus, and Simon the Canaanite,',
   'καὶ Ἀνδρέαν καὶ Φίλιππον καὶ Βαρθολομαῖον καὶ Ματθαῖον καὶ Θωμᾶν καὶ Ἰάκωβον τὸν τοῦ Ἀλφαίου καὶ Θαδδαῖον καὶ Σίμωνα τὸν Κανανίτην',
   'kai Andrean kai Philippon kai Bartholomaion kai Matthaion kai Thōman kai Iakōbon ton tou Alphaiou kai Thaddaion kai Simōna ton Kananitēn',
   '''Andrew'' — Peter''s brother, originally a disciple of John the Baptist (John 1:40). ''Philip'' — from Bethsaida. ''Bartholomew'' — likely Nathanael (John 1:45-49). ''Matthew'' — the former tax collector Levi (2:14). ''Thomas'' — later called Didymus (twin). ''James the son of Alphaeus'' — distinguished from James son of Zebedee. ''Thaddaeus'' — also called Judas son of James (Luke 6:16). ''Simon the Canaanite'' — not from Canaan but from the Aramaic qan''an (zealot), a member of the nationalistic Zealot movement. The diversity is striking: a tax collector (Roman collaborator) and a Zealot (anti-Roman revolutionary) in the same band of twelve.',
   NULL),
  (19, 'And Judas Iscariot, which also betrayed him: and they went into an house.',
   'καὶ Ἰούδαν Ἰσκαριώτην ὃς καὶ παρέδωκεν αὐτόν καὶ ἔρχονται εἰς οἶκον',
   'kai Ioudan Iskariōtēn hos kai paredōken auton kai erchontai eis oikon',
   '''Judas Iscariot'' — Iscariot may mean ''man of Kerioth'' (a Judean town), making him the only non-Galilean among the Twelve. ''Betrayed him'' (paredōken — handed over, delivered up; the same word used for John''s arrest in 1:14 and Jesus'' own prediction in 9:31). Mark mentions the betrayal immediately upon introducing Judas — the shadow of the cross falls even on the moment of apostolic appointment.',
   NULL),
  (20, 'And the multitude cometh together again, so that they could not so much as eat bread.',
   'καὶ ἔρχονται εἰς οἶκον καὶ συνέρχεται πάλιν ὄχλος ὥστε μὴ δύνασθαι αὐτοὺς μηδὲ ἄρτον φαγεῖν',
   'kai erchontai eis oikon kai synerchetai palin ochlos hōste mē dynasthai autous mēde arton phagein',
   '''Could not so much as eat bread'' — the press of ministry is so intense that Jesus and his disciples cannot even take a meal. This vivid detail (unique to Mark) shows the relentless demand of the crowds. It also sets up the two responses that follow: his family thinks he is out of his mind (v.21), and the scribes think he is demon-possessed (v.22).',
   NULL),
  (21, 'And when his friends heard of it, they went out to lay hold on him: for they said, He is beside himself.',
   'καὶ ἀκούσαντες οἱ παρ᾿ αὐτοῦ ἐξῆλθον κρατῆσαι αὐτόν ἔλεγον γὰρ ὅτι ἐξέστη',
   'kai akousantes hoi par autou exēlthon kratēsai auton elegon gar hoti exestē',
   '''His friends'' (hoi par autou — those alongside him; likely his family, as v.31 clarifies). ''Lay hold on him'' (kratēsai — seize, restrain). ''He is beside himself'' (exestē — he is out of his mind, he has lost his senses). Jesus'' own family thinks his relentless ministry is evidence of insanity. This painful detail reveals the cost of Jesus'' mission: misunderstood even by those closest to him.',
   NULL),
  (22, 'And the scribes which came down from Jerusalem said, He hath Beelzebub, and by the prince of the devils casteth he out devils.',
   'καὶ οἱ γραμματεῖς οἱ ἀπὸ Ἱεροσολύμων καταβάντες ἔλεγον ὅτι Βεελζεβοὺλ ἔχει καὶ ὅτι ἐν τῷ ἄρχοντι τῶν δαιμονίων ἐκβάλλει τὰ δαιμόνια',
   'kai hoi grammateis hoi apo Hierosolymōn katabantes elegon hoti Beelzeboul echei kai hoti en tō archonti tōn daimoniōn ekballei ta daimonia',
   '''Scribes from Jerusalem'' — the capital''s religious elite have sent a delegation. ''Beelzebub'' (Beelzeboul — ''lord of the flies'' or ''lord of the dwelling''; a mocking corruption of the Philistine deity Baal-zebub, 2 Kings 1:2). ''Prince of the devils'' (archonti tōn daimoniōn — ruler of the demons; i.e., Satan). The charge is devastating: Jesus is not merely mad (v.21) but demonically possessed — his power comes from Satan himself. This is the most serious accusation yet.',
   NULL),
  (23, 'And he called them unto him, and said unto them in parables, How can Satan cast out Satan?',
   'καὶ προσκαλεσάμενος αὐτοὺς ἐν παραβολαῖς ἔλεγεν αὐτοῖς πῶς δύναται Σατανᾶς Σατανᾶν ἐκβάλλειν',
   'kai proskalesamenos autous en parabolais elegen autois pōs dynatai Satanas Satanan ekballein',
   '''Called them unto him'' — Jesus does not avoid the accusation but confronts it directly. ''In parables'' (en parabolais — using analogies, comparisons). ''How can Satan cast out Satan?'' — the question exposes the logical absurdity of their charge. If Jesus casts out demons by Satan''s power, then Satan is fighting against himself — which is self-destructive, not strategic.',
   NULL),
  (24, 'And if a kingdom be divided against itself, that kingdom cannot stand.',
   'καὶ ἐὰν βασιλεία ἐφ᾿ ἑαυτὴν μερισθῇ οὐ δύναται σταθῆναι ἡ βασιλεία ἐκείνη',
   'kai ean basileia eph heautēn meristhē ou dynatai stathēnai hē basileia ekeinē',
   '''Kingdom divided'' (basileia meristhē — a kingdom split, factionalised). ''Cannot stand'' (ou dynatai stathēnai — cannot remain standing, will fall). A self-evident political principle: civil war destroys nations. Applied to the spiritual realm: if Satan is expelling his own forces, his kingdom is collapsing from within. But this is clearly not what is happening — demonic opposition to Jesus is fierce, not cooperative.',
   NULL),
  (25, 'And if a house be divided against itself, that house cannot stand.',
   'καὶ ἐὰν οἰκία ἐφ᾿ ἑαυτὴν μερισθῇ οὐ δύνησεται ἡ οἰκία ἐκείνη σταθῆναι',
   'kai ean oikia eph heautēn meristhē ou dynēsetai hē oikia ekeinē stathēnai',
   '''House divided'' — from the macro (kingdom) to the micro (household). The logic is the same at every scale: internal conflict leads to destruction, not success. Jesus is dismantling the scribes'' argument with irrefutable common sense before revealing the true explanation for his power (v.27).',
   NULL),
  (26, 'And if Satan rise up against himself, and be divided, he cannot stand, but hath an end.',
   'καὶ εἰ ὁ Σατανᾶς ἀνέστη ἐφ᾿ ἑαυτὸν καὶ μεμέρισται οὐ δύναται σταθῆναι ἀλλὰ τέλος ἔχει',
   'kai ei ho Satanas anestē eph heauton kai memeristai ou dynatai stathēnai alla telos echei',
   '''Rise up against himself'' (anestē eph heauton — has risen against himself). ''Be divided'' (memeristai — has been divided; perfect: thoroughly and permanently split). ''Hath an end'' (telos echei — has come to an end, is finished). Jesus applies the principle directly: if the scribes'' theory were correct, Satan would already be finished. But they themselves do not believe Satan is finished — so their own logic refutes their charge.',
   NULL),
  (27, 'No man can enter into a strong man''s house, and spoil his goods, except he will first bind the strong man; and then he will spoil his house.',
   'οὐδεὶς δύναται τὰ σκεύη τοῦ ἰσχυροῦ εἰσελθὼν εἰς τὴν οἰκίαν αὐτοῦ διαρπάσαι ἐὰν μὴ πρῶτον τὸν ἰσχυρὸν δήσῃ καὶ τότε τὴν οἰκίαν αὐτοῦ διαρπάσει',
   'oudeis dynatai ta skeuē tou ischyrou eiselthōn eis tēn oikian autou diarpasai ean mē prōton ton ischyron dēsē kai tote tēn oikian autou diarpasei',
   '''Strong man'' (tou ischyrou — the strong one; Satan). ''Spoil his goods'' (diarpasai ta skeuē — plunder his possessions; people held captive by Satan). ''First bind'' (prōton dēsē — first tie up, restrain). ''Then spoil his house'' — now Jesus reveals the true explanation: he is not working with Satan but against him. He is the one who has entered Satan''s domain, bound the strong man (the temptation in 1:12-13 was this binding), and is now plundering his house (freeing the demon-possessed). Jesus is the stronger one John predicted (1:7).',
   'The strong man parable is one of Jesus'' most important explanations of his exorcism ministry. Satan is the ''strong man'' who holds humanity captive. But someone ''stronger'' has come (cf. 1:7) — Jesus has entered Satan''s domain, bound him (the wilderness temptation was the initial binding), and is now systematically liberating his captives. Every exorcism is a raid on Satan''s kingdom, a liberation of prisoners. This is cosmic warfare: Jesus has not allied with Satan but invaded his territory and is dismantling his empire one person at a time.'),
  (28, 'Verily I say unto you, All sins shall be forgiven unto the sons of men, and blasphemies wherewith soever they shall blaspheme:',
   'ἀμὴν λέγω ὑμῖν ὅτι πάντα ἀφεθήσεται τὰ ἁμαρτήματα τοῖς υἱοῖς τῶν ἀνθρώπων καὶ βλασφημίαι ὅσας ἂν βλασφημήσωσιν',
   'amēn legō hymin hoti panta aphethēsetai ta hamartēmata tois huiois tōn anthrōpōn kai blasphēmiai hosas an blasphēmēsōsin',
   '''Verily'' (amēn — truly, solemnly). ''All sins'' (panta ta hamartēmata — every kind of sin). ''Shall be forgiven'' (aphethēsetai — will be released, pardoned). ''Blasphemies'' (blasphēmiai — slanders, irreverent speech against God). Jesus makes an astonishingly sweeping promise: ALL sins and ALL blasphemies can be forgiven. The scope of divine mercy is virtually unlimited — with one terrifying exception (v.29).',
   NULL),
  (29, 'But he that shall blaspheme against the Holy Ghost hath never forgiveness, but is in danger of eternal damnation:',
   'ὃς δ᾿ ἂν βλασφημήσῃ εἰς τὸ πνεῦμα τὸ ἅγιον οὐκ ἔχει ἄφεσιν εἰς τὸν αἰῶνα ἀλλ᾿ ἔνοχός ἐστιν αἰωνίου κρίσεως',
   'hos d an blasphēmēsē eis to pneuma to hagion ouk echei aphesin eis ton aiōna all enochos estin aiōniou kriseōs',
   '''Blaspheme against the Holy Ghost'' — to attribute the work of the Holy Spirit to Satan. ''Hath never forgiveness'' (ouk echei aphesin eis ton aiōna — does not have forgiveness unto the age, i.e., forever). ''Eternal damnation'' (aiōniou kriseōs — eternal judgment; some manuscripts read ''eternal sin''). The unforgivable sin is not a momentary utterance but a settled disposition: deliberately, persistently calling good evil and evil good — attributing the Spirit''s work to Satan with full knowledge.',
   'The ''unforgivable sin'' has troubled sensitive consciences for centuries. Context is crucial: Jesus defines it in v.30 — ''because they said, He hath an unclean spirit.'' The scribes witnessed the Holy Spirit''s work through Jesus and deliberately attributed it to Satan. This is not ignorant rejection but willful, informed, persistent blasphemy against the Spirit whose work one clearly recognises. It is unforgivable not because God''s mercy is limited but because the person has so hardened their heart that they are incapable of recognising and receiving the only source of forgiveness. Those who worry they have committed this sin almost certainly have not — the very concern indicates a responsive conscience.'),
  (30, 'Because they said, He hath an unclean spirit.',
   'ὅτι ἔλεγον πνεῦμα ἀκάθαρτον ἔχει',
   'hoti elegon pneuma akatharton echei',
   '''Because they said'' (hoti elegon — because they were saying; imperfect: they kept saying, a persistent, deliberate charge). ''He hath an unclean spirit'' — this is what constituted blasphemy against the Holy Spirit: the scribes saw the Spirit''s power at work in Jesus and called it demonic. Mark provides the specific context for the warning: it was prompted by the scribes'' accusation in v.22.',
   NULL),
  (31, 'There came then his brethren and his mother, and, standing without, sent unto him, calling him.',
   'ἔρχονται οὖν οἱ ἀδελφοὶ αὐτοῦ καὶ ἡ μήτηρ αὐτοῦ καὶ ἔξω ἑστῶτες ἀπέστειλαν πρὸς αὐτὸν φωνοῦντες αὐτόν',
   'erchontai oun hoi adelphoi autou kai hē mētēr autou kai exō hestōtes apesteilan pros auton phōnountes auton',
   '''His brethren and his mother'' — Jesus'' family from v.21 arrives. ''Standing without'' (exō hestōtes — standing outside; they are physically outside the house and, symbolically, outside the circle of discipleship). ''Calling him'' — they want to take him home (cf. v.21). The scene creates a dramatic contrast: Jesus'' biological family is outside calling him; those inside listening to him are about to be declared his true family.',
   NULL),
  (32, 'And the multitude sat about him, and they said unto him, Behold, thy mother and thy brethren without seek for thee.',
   'καὶ ἐκάθητο ὄχλος περὶ αὐτὸν εἶπον δὲ αὐτῷ ἰδοὺ ἡ μήτηρ σου καὶ οἱ ἀδελφοί σου ἔξω ζητοῦσίν σε',
   'kai ekathēto ochlos peri auton eipon de autō idou hē mētēr sou kai hoi adelphoi sou exō zētousin se',
   '''Sat about him'' (ekathēto peri auton — were seated around him in a circle). ''Seek for thee'' — the crowd relays the message. The physical arrangement is significant: the crowd is seated around Jesus in the posture of disciples, while his family is outside. The spatial arrangement mirrors the spiritual reality Jesus is about to declare.',
   NULL),
  (33, 'And he answered them, saying, Who is my mother, or my brethren?',
   'καὶ ἀπεκρίθη αὐτοῖς λέγων τίς ἐστιν ἡ μήτηρ μου ἢ οἱ ἀδελφοί μου',
   'kai apekrithē autois legōn tis estin hē mētēr mou ē hoi adelphoi mou',
   '''Who is my mother?'' — a shocking question in a culture where family honour was paramount and the fifth commandment demanded respect for parents. Jesus is not disrespecting his mother but redefining the concept of family. The question is rhetorical, preparing for the revolutionary answer that follows.',
   NULL),
  (34, 'And he looked round about on them which sat about him, and said, Behold my mother and my brethren!',
   'καὶ περιβλεψάμενος κύκλῳ τοὺς περὶ αὐτὸν καθημένους λέγει ἴδε ἡ μήτηρ μου καὶ οἱ ἀδελφοί μου',
   'kai periblepsamenos kyklō tous peri auton kathēmenous legei ide hē mētēr mou kai hoi adelphoi mou',
   '''Looked round about'' (periblepsamenos — gazed around; the same penetrating look as in v.5). ''Them which sat about him'' — those who have chosen to listen to his teaching. ''Behold my mother and my brethren'' — Jesus gestures to the disciples and crowd around him and identifies them as his true family. This is a radical redefinition of the most fundamental social unit in the ancient world.',
   NULL),
  (35, 'For whosoever shall do the will of God, the same is my brother, and my sister, and mother.',
   'ὃς γὰρ ἂν ποιήσῃ τὸ θέλημα τοῦ θεοῦ οὗτος ἀδελφός μου καὶ ἀδελφή μου καὶ μήτηρ ἐστίν',
   'hos gar an poiēsē to thelēma tou theou houtos adelphos mou kai adelphē mou kai mētēr estin',
   '''Whosoever'' (hos an — whoever, without restriction). ''Shall do the will of God'' (poiēsē to thelēma tou theou — performs God''s will). ''Brother, sister, and mother'' — Jesus uses the full range of family terms, including the feminine (sister, mother), showing that women are fully included in the new community. The criterion for belonging is not blood but obedience to God. This is the charter of the new community Jesus is creating.',
   'This declaration is foundational for understanding the church. Jesus creates a new family defined not by ethnicity, blood, or social status but by doing God''s will. This new family transcends the biological family without destroying it (Jesus honoured his mother from the cross, John 19:26-27). The church is this new family — a community of brothers and sisters united by shared obedience to God and allegiance to Christ. In a culture where identity was determined by family of origin, this teaching was revolutionary: anyone can belong to Jesus'' family through faith and obedience.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 3;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.5 hardness of heart
  ('πώρωσις', 'pōrōsis', 'G4457', 'Hardness, callousness, petrification — from pōros (a hard calcium deposit, calcified stone). Pōrōsis describes a heart so encrusted with resistance that it can no longer feel or respond. The scribes and Pharisees are so committed to their system that they cannot rejoice in a man''s healing because it happened on the Sabbath. This is spiritual calcification: religious zeal hardened into cruelty. The same word is used in Romans 11:25 for Israel''s partial hardening and in Ephesians 4:18 for Gentile spiritual blindness.', 1),
  -- v.14 ordained/appointed
  ('ποιέω', 'poieō', 'G4160', 'To make, do, appoint, constitute — a common verb given special force here: Jesus ''made'' the twelve, constituting them as a new entity. The word echoes Genesis 1 (God ''made'' the heavens and earth) and suggests a creative, constitutive act. Jesus is not merely recruiting followers but creating a new community — the nucleus of the renewed people of God. The twelve are his creation, called into being by his sovereign will.', 2),
  -- v.22 Beelzebub
  ('Βεελζεβούλ', 'Beelzeboul', 'G954', 'Beelzebub, lord of the flies, lord of the dwelling — from Hebrew baal (lord) + zebub (fly) or zebul (dwelling/height). Originally a mocking name for the Philistine deity Baal-zebub of Ekron (2 Kings 1:2). By Jesus'' time, Beelzebub was a name for Satan, the chief of demons. The scribes'' accusation that Jesus ''has Beelzebub'' means they believe he is demon-possessed — the most serious possible charge, attributing divine power to satanic origin.', 3),
  -- v.27 bind the strong man
  ('δέω', 'deō', 'G1210', 'To bind, tie, fasten, restrain — used literally of tying up a person or animal, and metaphorically of spiritual binding. In the strong man parable, Jesus declares that Satan (the strong man) must first be ''bound'' before his captives can be freed. The binding occurred in Jesus'' wilderness temptation (1:12-13), where he resisted and defeated Satan. Every subsequent exorcism is the plundering of a house whose guardian has already been overpowered.', 4),
  -- v.29 blaspheme
  ('βλασφημέω', 'blasphēmeō', 'G987', 'To blaspheme, slander, speak irreverently — from blaptō (to injure) + phēmē (speech, report). Blasphemy is injurious speech directed against God or sacred things. Blasphemy against the Holy Spirit is specifically defined by context (v.30): attributing the Spirit''s unmistakable work to Satan. This is unforgivable not because God''s mercy has a limit but because the person has permanently sealed themselves against the only agent of conviction and conversion — the Holy Spirit.', 5),
  -- v.29 eternal
  ('αἰώνιος', 'aiōnios', 'G166', 'Eternal, everlasting, age-long — from aiōn (age, era). When applied to judgment, aiōnios means without end, permanent, irrevocable. ''Eternal judgment'' (aiōniou kriseōs) is not temporary correction but permanent condemnation. The gravity of the word matches the gravity of the sin: to permanently reject the Spirit''s testimony is to face permanent consequences. The same adjective describes eternal life (John 3:16) — both the gift and the consequence are everlasting.', 6),
  -- v.35 will of God
  ('θέλημα', 'thelēma', 'G2307', 'Will, desire, wish, purpose — from thelō (to will, to wish). The ''will of God'' (thelēma tou theou) is the defining criterion for membership in Jesus'' family. It encompasses belief in Jesus (John 6:40), obedience to God''s commands, and submission to God''s purposes. This is not mere intellectual agreement but active, lifestyle-shaping commitment. Doing God''s will is the evidence of genuine relationship with Christ — the mark of his true family.', 7)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 3
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 5
    WHEN 2 THEN 14
    WHEN 3 THEN 22
    WHEN 4 THEN 27
    WHEN 5 THEN 29
    WHEN 6 THEN 29
    WHEN 7 THEN 35
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 withered hand
  (1, '1 Kings 13:4-6', 1),
  (1, 'Luke 6:6-10', 2),
  -- v.4 lawful to do good on sabbath
  (4, 'Matthew 12:11-12', 3),
  (4, 'Luke 14:3-5', 4),
  -- v.5 anger and grief
  (5, 'John 11:33', 5),
  (5, 'Ephesians 4:26', 6),
  -- v.6 Pharisees and Herodians plot
  (6, 'Mark 12:13', 7),
  (6, 'Matthew 22:15-16', 8),
  -- v.11 Thou art the Son of God
  (11, 'Mark 1:24', 9),
  (11, 'James 2:19', 10),
  -- v.14 ordained twelve
  (14, 'Matthew 10:1-4', 11),
  (14, 'Luke 6:13-16', 12),
  (14, 'Acts 1:13', 13),
  -- v.16 Simon surnamed Peter
  (16, 'John 1:42', 14),
  (16, 'Matthew 16:18', 15),
  -- v.22 Beelzebub accusation
  (22, 'Matthew 12:24', 16),
  (22, 'Luke 11:15', 17),
  -- v.27 binding the strong man
  (27, 'Isaiah 49:24-25', 18),
  (27, 'Luke 11:21-22', 19),
  (27, 'Colossians 2:15', 20),
  -- v.28 all sins forgiven
  (28, '1 John 1:9', 21),
  (28, 'Isaiah 1:18', 22),
  -- v.29 blasphemy against Holy Spirit
  (29, 'Matthew 12:31-32', 23),
  (29, 'Luke 12:10', 24),
  (29, 'Hebrews 6:4-6', 25),
  -- v.35 whosoever does God's will
  (35, 'John 15:14', 26),
  (35, 'Romans 8:14-17', 27),
  (35, '1 John 2:17', 28)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 3
  AND v.verse_number = cr.verse_number;

-- MARK CHAPTER 3 — BACKFILL (additional word_studies + cross_references)

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'ἐξηραμμένην ἔχων τὴν χεῖρα', 'exērammenēn echōn tēn cheira', 'G3583/G5495', 'Having a withered hand — perfect participle: long-standing, permanent atrophy; likely right hand per Luke 6:6.', 100),
  (2, 'παρετήρουν', 'paretēroun', 'G3906', 'Watched closely — imperfect; sinister surveillance (hostile nuance of para-); waiting to accuse.', 101),
  (2, 'ἵνα κατηγορήσωσιν αὐτοῦ', 'hina katēgorēsōsin autou', 'G2723', 'That they might accuse him — legal-forensic verb; crowd as expected witness pool; trap anticipated.', 102),
  (3, 'ἔγειρε εἰς τὸ μέσον', 'egeire eis to meson', 'G1453/G3319', '"Rise up in the middle" — Jesus deliberately makes it public; pastoral confrontation rather than private healing.', 103),
  (4, 'ἀγαθοποιῆσαι ἢ κακοποιῆσαι', 'agathopoiēsai ē kakopoiēsai', 'G15/G2554', 'To do good or to do evil — Jesus reframes Sabbath from rule to moral agency; failure to heal becomes active harm.', 104),
  (4, 'ἐσιώπων', 'esiōpōn', 'G4623', 'They were silent — imperfect; sustained refusal to answer; silence here is complicity.', 105),
  (5, 'μετ''ὀργῆς', 'met orgēs', 'G3709', 'With anger — only place Mark names Jesus''s anger; righteous indignation at entrenched hard-heartedness.', 106),
  (5, 'συλλυπούμενος', 'syllypoumenos', 'G4818', 'Grieved together — co-suffering verb; anger married to sorrow, not contempt; only NT occurrence.', 107),
  (6, 'συμβούλιον ἐδίδουν', 'symboulion edidoun', 'G4824', 'Took counsel — formal consultation; plot formed already in chapter 3, long before the cross.', 108),
  (6, 'μετὰ τῶν Ἡρῳδιανῶν', 'meta tōn Hērōdianōn', 'G2265', 'With the Herodians — political partisans of Herod Antipas; unlikely allies of Pharisees; shared enmity yields rare alliance.', 109),
  (7, 'πρὸς τὴν θάλασσαν', 'pros tēn thalassan', 'G2281', 'To the sea — Sea of Galilee; strategic retreat from hostile Galilean leadership to open-water ministry.', 110),
  (8, 'Ἰδουμαίας καὶ πέραν τοῦ Ἰορδάνου καὶ περὶ Τύρον καὶ Σιδῶνα', 'Idoumaias kai peran tou Iordanou kai peri Tyron kai Sidōna', 'G2401/G4008/G5184/G4605', 'Idumea, beyond Jordan, Tyre, Sidon — wide geographical reach; includes Gentile regions; global scope foreshadowed.', 111),
  (9, 'πλοιάριον', 'ploiarion', 'G4142', 'Little boat — diminutive; ready floating pulpit and escape route (cf. 4:1).', 112),
  (9, 'θλίβωσιν αὐτόν', 'thlibōsin autou', 'G2346', 'Might press upon him — thlibō: crowd pressure to the point of crushing; same verb for tribulation.', 113),
  (10, 'ἐπιπίπτειν αὐτῷ ἵνα αὐτοῦ ἅψωνται', 'epipiptein autō hina autou hapsōntai', 'G1968/G680', 'Fell upon him to touch him — tactile theology of contagious holiness; contrast earlier fear of impurity transfer.', 114),
  (10, 'μάστιγας', 'mastigas', 'G3148', 'Scourges/afflictions — literal "whips"; bodily suffering understood as visited chastening; Mark uses for serious illness.', 115),
  (11, 'προσέπιπτον αὐτῷ', 'prosepipton autō', 'G4363', 'Fell down before him — unclean spirits recognise their master and involuntarily worship; theology from hell.', 116),
  (12, 'ἵνα μὴ αὐτὸν φανερὸν ποιήσωσιν', 'hina mē auton phaneron poiēsōsin', 'G5318/G4160', 'That they should not make him known — messianic secret motif; demonic confessions, however true, are unwelcome endorsements.', 117),
  (13, 'ἀναβαίνει εἰς τὸ ὄρος', 'anabainei eis to oros', 'G305/G3735', 'Goes up on the mountain — Moses/Sinai echo; commissioning of a new covenant leadership.', 118),
  (13, 'οὓς ἤθελεν αὐτός', 'hous ēthelen autos', 'G2309', 'Those whom he himself desired — emphatic sovereign election; call precedes qualification.', 119),
  (14, 'δώδεκα', 'dōdeka', 'G1427', 'Twelve — deliberate echo of the twelve tribes of Israel; new covenant people constituted.', 120),
  (14, 'ἀποστόλους', 'apostolous', 'G652', 'Apostles — "sent ones"; though textually uncertain here, the word names the office: authorized delegates.', 121),
  (14, 'ἵνα ὦσιν μετ''αὐτοῦ', 'hina ōsin met autou', 'G3326', 'That they might be with him — primary purpose; being precedes sending; relational formation of the commissioned.', 122),
  (15, 'ἐξουσίαν ἐκβάλλειν τὰ δαιμόνια', 'exousian ekballein ta daimonia', 'G1849/G1544', 'Authority to cast out the demons — delegated power explicitly extends Christ''s exorcistic ministry.', 123),
  (16, 'ἐπέθηκεν ὄνομα τῷ Σίμωνι Πέτρον', 'epethēken onoma tō Simōni Petron', 'G2007/G3686/G4074', 'Gave Simon the name Peter — "Rock"; name-changing signals new identity and vocation (cf. Abram→Abraham).', 124),
  (17, 'Βοανηργές... υἱοὶ βροντῆς', 'Boanērges... huioi brontēs', 'G993/G5207/G1027', 'Boanerges — Aramaic "sons of thunder"; Mark preserves original (his audience needs the translation); zeal of James/John (cf. Luke 9:54).', 125),
  (19, 'ὃς καὶ παρέδωκεν αὐτόν', 'hos kai paredōken auton', 'G3860', 'Who also delivered him up — the same verb used of John''s arrest and Christ''s passion; Judas introduced under shadow of betrayal.', 126),
  (20, 'μὴ δύνασθαι αὐτοὺς μηδὲ ἄρτον φαγεῖν', 'mē dynasthai autous mēde arton phagein', 'G1410/G740/G5315', '"Could not even eat bread" — crowd pressure excludes normal rhythms; intensive ministry at personal cost.', 127),
  (21, 'οἱ παρ''αὐτοῦ', 'hoi par autou', 'G3844', 'Those from him — his kin/family (per Mark 3:31); concerned relatives seek intervention.', 128),
  (21, 'ἐξέστη', 'exestē', 'G1839', 'Is beside himself — ekstatic state, understood as madness; his family interprets miraculous activity as mental imbalance.', 129),
  (22, 'ἐν τῷ ἄρχοντι τῶν δαιμονίων', 'en tō archonti tōn daimoniōn', 'G758', 'By the prince of the demons — scribal accusation assigns Jesus''s exorcisms to satanic collusion.', 130),
  (23, 'ἐν παραβολαῖς', 'en parabolais', 'G3850', 'In parables — comparative, enigmatic sayings; Mark uses broadly for any comparison, not only narratives.', 131),
  (24, 'βασιλεία ἐπὶ ἑαυτὴν μερισθῇ', 'basileia eph heautēn meristhē', 'G932/G3307', 'Kingdom divided against itself — standard ancient political wisdom: internal faction = collapse.', 132),
  (25, 'οἰκία ἐφ''ἑαυτὴν μερισθῇ', 'oikia eph heautēn meristhē', 'G3614/G3307', 'House divided against itself — descending from polity to household; parallelism drives logic to undeniable conclusion.', 133),
  (27, 'τὸν ἰσχυρόν', 'ton ischyron', 'G2478', 'The strong man — Satan; Jesus uses ischyros, same root as John''s description of him (1:7); only the stronger can bind.', 134),
  (27, 'δήσῃ... διαρπάσει', 'dēsē... diarpasei', 'G1210/G1283', 'Bind... plunder — exorcism theology: Christ enters Satan''s house, binds him, spoils his possessions.', 135),
  (28, 'ἀμὴν λέγω ὑμῖν', 'amēn legō hymin', 'G281/G3004', 'Truly I say to you — Hebraic ''amen'' fronted for emphasis; mark of authoritative prophetic pronouncement unique to Jesus.', 136),
  (29, 'ἔνοχος αἰωνίου ἁμαρτήματος', 'enochos aiōniou hamartēmatos', 'G1777/G166/G265', 'Guilty of eternal sin — enochos: legally liable; hamartēma: act of sin; variant reading to "eternal judgment"; persistent settled defiance.', 137),
  (30, 'πνεῦμα ἀκάθαρτον ἔχει', 'pneuma akatharton echei', 'G4151/G169', '"He has an unclean spirit" — the specific accusation which constitutes the blasphemy of v.29.', 138),
  (31, 'ἔξω στήκοντες', 'exō stēkontes', 'G1854/G4739', 'Standing outside — literal physical location becomes theological; even closest relatives are "outside" until obedient.', 139),
  (33, 'τίς ἐστιν ἡ μήτηρ μου', 'tis estin hē mētēr mou', 'G5101/G3384', '"Who is my mother?" — not denial of natural family but expansion; spiritual kinship reconfigured around obedience.', 140),
  (34, 'περιβλεψάμενος κύκλῳ', 'periblepsamenos kyklō', 'G4017/G2945', 'Looking around in a circle — Mark''s distinctive verb for Jesus''s penetrating gaze (3:5, 10:23, 11:11).', 141),
  (35, 'ἀδελφὴ καὶ μήτηρ', 'adelphē kai mētēr', 'G79/G3384', 'Sister and mother — notably no "father" on the list; God alone holds that title in the new family (Matt 23:9).', 142)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 3 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Matthew 12:9-10', 100),
  (1, 'Luke 6:6-7', 101),
  (2, 'Luke 14:1', 100),
  (2, 'Luke 20:20', 101),
  (3, 'Matthew 12:13', 100),
  (4, 'Luke 14:3', 100),
  (4, 'James 4:17', 101),
  (5, 'Ephesians 4:26', 100),
  (5, 'Psalm 95:8', 101),
  (5, 'Romans 11:25', 102),
  (6, 'Matthew 22:16', 100),
  (6, 'Matthew 12:14', 101),
  (6, 'John 11:53', 102),
  (7, 'Matthew 4:25', 100),
  (8, 'Matthew 15:21', 100),
  (8, 'Luke 6:17', 101),
  (9, 'Mark 4:1', 100),
  (9, 'Luke 5:3', 101),
  (10, 'Matthew 14:36', 100),
  (10, 'Mark 5:27-28', 101),
  (11, 'Luke 4:41', 100),
  (11, 'Acts 16:17', 101),
  (11, 'James 2:19', 102),
  (12, 'Mark 1:34', 100),
  (13, 'Luke 6:12-13', 100),
  (13, 'Exodus 19:20', 101),
  (14, 'Luke 6:13', 100),
  (14, 'John 15:16', 101),
  (14, 'Acts 1:21-22', 102),
  (15, 'Matthew 10:1', 100),
  (15, 'Luke 9:1', 101),
  (16, 'Matthew 16:18', 100),
  (16, 'John 1:42', 101),
  (17, 'Luke 9:54', 100),
  (17, 'Matthew 20:20-23', 101),
  (18, 'Matthew 10:3-4', 100),
  (18, 'Acts 1:13', 101),
  (19, 'John 13:2', 100),
  (19, 'Luke 6:16', 101),
  (20, 'Mark 6:31', 100),
  (21, 'John 7:3-5', 100),
  (21, 'John 10:20', 101),
  (22, 'Matthew 9:34', 100),
  (22, 'Matthew 12:24', 101),
  (22, 'John 8:48', 102),
  (23, 'Matthew 12:25-26', 100),
  (24, 'Luke 11:17', 100),
  (25, 'James 1:8', 100),
  (26, 'Isaiah 49:24-25', 100),
  (27, 'Colossians 2:15', 100),
  (27, 'Luke 11:21-22', 101),
  (27, 'Hebrews 2:14-15', 102),
  (28, 'Matthew 12:31', 100),
  (28, '1 John 1:9', 101),
  (29, 'Matthew 12:32', 100),
  (29, 'Luke 12:10', 101),
  (29, 'Hebrews 10:26-29', 102),
  (29, '1 John 5:16', 103),
  (30, 'John 10:20-21', 100),
  (31, 'Matthew 12:46', 100),
  (31, 'Luke 8:19-20', 101),
  (32, 'John 2:12', 100),
  (33, 'Deuteronomy 33:9', 100),
  (34, 'Mark 3:5', 100),
  (34, 'Hebrews 2:11-12', 101),
  (35, 'John 6:40', 100),
  (35, 'Hebrews 10:36', 101),
  (35, 'Galatians 5:6', 102)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 3 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
