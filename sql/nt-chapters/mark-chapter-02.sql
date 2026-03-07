-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 2 — Authority to Forgive and the New Wine
-- 28 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Mark 2 presents five conflict stories that escalate the tension between Jesus and the religious authorities. First, Jesus heals a paralytic let down through the roof, but the controversy centres not on the healing but on Jesus'' declaration: ''Son, thy sins be forgiven thee'' (v.5). The scribes charge blasphemy (v.7), and Jesus responds by healing the man to prove that ''the Son of man hath power on earth to forgive sins'' (v.10). Second, Jesus calls Levi the tax collector and eats with ''publicans and sinners'' (vv.13-17), provoking the Pharisees'' objection. Jesus responds: ''They that are whole have no need of the physician, but they that are sick: I came not to call the righteous, but sinners'' (v.17). Third, the question of fasting arises (vv.18-22): Jesus explains that his disciples cannot fast while the bridegroom is with them, and he introduces the parables of new cloth on old garments and new wine in old wineskins — the new reality of the kingdom cannot be forced into the old structures. Fourth and fifth, the Sabbath controversies (vv.23-28): Jesus'' disciples pluck grain on the Sabbath, prompting Pharisaic criticism. Jesus appeals to David''s precedent (1 Samuel 21:1-6) and concludes with the revolutionary declaration: ''The sabbath was made for man, and not man for the sabbath: Therefore the Son of man is Lord also of the sabbath'' (vv.27-28). Throughout, Jesus claims divine prerogatives — forgiving sins, redefining purity, inaugurating a new era, and exercising lordship over the Sabbath.',
  'The Son of Man''s Authority — Forgiveness, Fellowship, Fasting, and the Sabbath',
  'ἐξουσία (exousia)',
  'Authority, power, right to act — from exesti (it is permitted). In Mark 2, Jesus exercises authority in realms reserved for God alone: forgiving sins (v.10), redefining the boundaries of table fellowship (v.17), declaring himself the bridegroom of Israel (v.19), and asserting lordship over the Sabbath (v.28). Each controversy reveals another dimension of Jesus'' divine authority, forcing the question: who is this man who does what only God can do?',
  '["Healing the Paralytic: Authority to Forgive Sins (vv.1-12): Son thy sins be forgiven thee. Why doth this man thus speak blasphemies who can forgive sins but God only. Whether is it easier to say thy sins be forgiven thee or to say Arise and take up thy bed and walk. That ye may know that the Son of man hath power on earth to forgive sins he saith to the sick of the palsy Arise and take up thy bed","The Call of Levi and Eating with Sinners (vv.13-17): He saw Levi the son of Alphaeus sitting at the receipt of custom and said unto him Follow me and he arose and followed him. Many publicans and sinners sat also together with Jesus. They that are whole have no need of the physician but they that are sick I came not to call the righteous but sinners to repentance","The Question of Fasting: New Wine in Old Wineskins (vv.18-22): Why do the disciples of John and of the Pharisees fast but thy disciples fast not. Can the children of the bridechamber fast while the bridegroom is with them. No man putteth new wine into old bottles else the new wine doth burst the bottles","Lord of the Sabbath (vv.23-28): His disciples began to pluck the ears of corn as they went through the corn fields on the sabbath day. Have ye never read what David did when he had need and was an hungred. The sabbath was made for man and not man for the sabbath. Therefore the Son of man is Lord also of the sabbath"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 28 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And again he entered into Capernaum after some days; and it was noised that he was in the house.',
   'Καὶ εἰσῆλθεν πάλιν εἰς Καπερναοὺμ δι᾿ ἡμερῶν καὶ ἠκούσθη ὅτι εἰς οἶκόν ἐστιν',
   'Kai eisēlthen palin eis Kapernaoum di hēmerōn kai ēkousthē hoti eis oikon estin',
   '''After some days'' (di hēmerōn — through several days; Jesus had been itinerating in Galilee, 1:39). ''Noised'' (ēkousthē — it was heard, reported). ''In the house'' (eis oikon — likely Peter and Andrew''s house, 1:29). Despite the leper''s indiscretion forcing Jesus to avoid cities (1:45), he returns to his Capernaum base. Word spreads immediately.',
   NULL),
  (2, 'And straightway many were gathered together, insomuch that there was no room to receive them, no, not so much as about the door: and he preached the word unto them.',
   'καὶ εὐθέως συνήχθησαν πολλοὶ ὥστε μηκέτι χωρεῖν μηδὲ τὰ πρὸς τὴν θύραν καὶ ἐλάλει αὐτοῖς τὸν λόγον',
   'kai eutheōs synēchthēsan polloi hōste mēketi chōrein mēde ta pros tēn thyran kai elalei autois ton logon',
   '''Straightway'' (eutheōs — immediately; the crowd forms instantly). ''No room'' (mēketi chōrein — no longer space enough; the house is packed beyond capacity). ''Not so much as about the door'' — even the doorway and courtyard are filled. ''Preached the word'' (elalei ton logon — he was speaking the word; imperfect: continuous teaching). For Mark, the primary ministry is the word; healings serve and confirm the message.',
   NULL),
  (3, 'And they come unto him, bringing one sick of the palsy, which was borne of four.',
   'καὶ ἔρχονται πρὸς αὐτὸν παραλυτικὸν φέροντες αἰρόμενον ὑπὸ τεσσάρων',
   'kai erchontai pros auton paralytikon pherontes airomenon hypo tessarōn',
   '''Sick of the palsy'' (paralytikon — a paralysed person). ''Borne of four'' (airomenon hypo tessarōn — carried by four men). The detail of ''four'' is unique to Mark, adding vivid eyewitness colour (likely from Peter''s recollection). These four friends demonstrate extraordinary faith through extraordinary effort — they will not let the crowd stop them from reaching Jesus.',
   NULL),
  (4, 'And when they could not come nigh unto him for the press, they uncovered the roof where he was: and when they had broken it up, they let down the bed wherein the sick of the palsy lay.',
   'καὶ μὴ δυνάμενοι προσεγγίσαι αὐτῷ διὰ τὸν ὄχλον ἀπεστέγασαν τὴν στέγην ὅπου ἦν καὶ ἐξορύξαντες χαλῶσιν τὸν κράβαττον ὅπου ὁ παραλυτικὸς κατέκειτο',
   'kai mē dynamenoi prosengisai autō dia ton ochlon apestegasan tēn stegēn hopou ēn kai exoryxantes chalōsin ton krabatton hopou ho paralytikos katekeito',
   '''Could not come nigh'' — the crowd is an impenetrable barrier. ''Uncovered the roof'' (apestegasan tēn stegēn — unroofed the roof; the flat Palestinian roof was made of beams, branches, and packed mud/clay). ''Broken it up'' (exoryxantes — dug through; they literally excavated the roof). ''Let down'' (chalōsin — lowered on ropes). ''Bed'' (krabatton — a poor man''s pallet, a simple mat). This dramatic scene — digging through a roof while Jesus teaches below, debris falling on the crowd — shows desperate, creative, unstoppable faith.',
   NULL),
  (5, 'When Jesus saw their faith, he said unto the sick of the palsy, Son, thy sins be forgiven thee.',
   'ἰδὼν δὲ ὁ Ἰησοῦς τὴν πίστιν αὐτῶν λέγει τῷ παραλυτικῷ τέκνον ἀφέωνταί σου αἱ ἁμαρτίαι',
   'idōn de ho Iēsous tēn pistin autōn legei tō paralytikō teknon apheōntai sou hai hamartiai',
   '''Saw their faith'' (tēn pistin autōn — their faith; the plural includes the four friends and the paralytic himself; faith that Jesus could see was expressed in action). ''Son'' (teknon — child, a term of affection). ''Thy sins be forgiven thee'' (apheōntai sou hai hamartiai — your sins have been forgiven; perfect passive: the forgiveness is already accomplished). Jesus surprises everyone: the man came for healing, but Jesus addresses the deeper need first — forgiveness.',
   'Jesus'' declaration of forgiveness is the theological centre of this passage. The man''s friends brought him for physical healing, but Jesus addresses the root issue: sin. This does not mean the man''s paralysis was caused by specific sin, but that forgiveness is a greater gift than healing. The passive voice (apheōntai — have been forgiven) implies divine action — only God can forgive sins (v.7). By pronouncing forgiveness, Jesus is doing what only God can do, which is exactly the point he will make in v.10.'),
  (6, 'But there were certain of the scribes sitting there, and reasoning in their hearts,',
   'ἦσαν δέ τινες τῶν γραμματέων ἐκεῖ καθήμενοι καὶ διαλογιζόμενοι ἐν ταῖς καρδίαις αὐτῶν',
   'ēsan de tines tōn grammateōn ekei kathēmenoi kai dialogizomenoi en tais kardiais autōn',
   '''Scribes'' (grammateōn — experts in the Torah, professional interpreters of the law). ''Sitting'' (kathēmenoi — seated; the posture of official observers). ''Reasoning in their hearts'' (dialogizomenoi — debating, calculating internally). They do not speak their objection aloud — they think it. But Jesus will read their thoughts (v.8), demonstrating divine omniscience.',
   NULL),
  (7, 'Why doth this man thus speak blasphemies? who can forgive sins but God only?',
   'τί οὗτος οὕτως λαλεῖ βλασφημίας τίς δύναται ἀφιέναι ἁμαρτίας εἰ μὴ εἷς ὁ θεός',
   'ti houtos houtōs lalei blasphēmias tis dynatai aphienai hamartias ei mē heis ho theos',
   '''Blasphemies'' (blasphēmias — slander against God, claiming divine prerogatives). ''Who can forgive sins but God only?'' (tis dynatai... ei mē heis ho theos — who is able... except one, God?). The scribes'' theology is correct: only God can forgive sins (Isaiah 43:25, 44:22). Their error is in failing to recognise that God is standing in front of them. Their correct premise leads to an incorrect conclusion because they cannot accept the incarnation.',
   NULL),
  (8, 'And immediately when Jesus perceived in his spirit that they so reasoned within themselves, he said unto them, Why reason ye these things in your hearts?',
   'καὶ εὐθέως ἐπιγνοὺς ὁ Ἰησοῦς τῷ πνεύματι αὐτοῦ ὅτι οὕτως αὐτοὶ διαλογίζονται ἐν ἑαυτοῖς εἶπεν αὐτοῖς τί ταῦτα διαλογίζεσθε ἐν ταῖς καρδίαις ὑμῶν',
   'kai eutheōs epignous ho Iēsous tō pneumati autou hoti houtōs autoi dialogizontai en heautois eipen autois ti tauta dialogizesthe en tais kardiais hymōn',
   '''Immediately'' (eutheōs — at once). ''Perceived in his spirit'' (epignous tō pneumati autou — knew fully in his spirit). Jesus reads their unspoken thoughts — an ability attributed to God alone in the OT (1 Samuel 16:7, 1 Kings 8:39, Jeremiah 17:10). ''Why reason ye'' — Jesus exposes their inner objection and meets it head-on. His knowledge of their thoughts is itself evidence of his divinity.',
   NULL),
  (9, 'Whether is it easier to say to the sick of the palsy, Thy sins be forgiven thee; or to say, Arise, and take up thy bed, and walk?',
   'τί ἐστιν εὐκοπώτερον εἰπεῖν τῷ παραλυτικῷ ἀφέωνταί σου αἱ ἁμαρτίαι ἢ εἰπεῖν ἔγειρε καὶ ἆρον τὸν κράβαττόν σου καὶ περιπάτει',
   'ti estin eukopōteron eipein tō paralytikō apheōntai sou hai hamartiai ē eipein egeire kai aron ton krabatton sou kai peripatei',
   '''Easier'' (eukopōteron — less laborious, more convenient). The question is brilliantly framed: in one sense, saying ''thy sins be forgiven'' is easier because no one can verify it; saying ''arise and walk'' is harder because the claim is immediately testable. But in reality, both require divine power. Jesus will do the visible (healing) to prove he has done the invisible (forgiving).',
   NULL),
  (10, 'But that ye may know that the Son of man hath power on earth to forgive sins, (he saith to the sick of the palsy,)',
   'ἵνα δὲ εἰδῆτε ὅτι ἐξουσίαν ἔχει ὁ υἱὸς τοῦ ἀνθρώπου ἀφιέναι ἁμαρτίας ἐπὶ τῆς γῆς λέγει τῷ παραλυτικῷ',
   'hina de eidēte hoti exousian echei ho huios tou anthrōpou aphienai hamartias epi tēs gēs legei tō paralytikō',
   '''That ye may know'' (hina eidēte — in order that you might know; the healing is evidence). ''Son of man'' (ho huios tou anthrōpou — the Son of Man; Jesus'' preferred self-designation, drawn from Daniel 7:13-14, where the Son of Man receives everlasting dominion). ''Hath power'' (exousian echei — possesses authority). ''On earth'' — this is not merely a future, heavenly prerogative; the Son of Man exercises divine authority here and now, on earth.',
   'This is the first use of ''Son of man'' in Mark and one of the most important Christological declarations in the Gospels. The title combines human appearance (''son of man'') with divine authority (Daniel 7:13-14). Jesus claims the authority to forgive sins ''on earth'' — bringing heaven''s prerogative into the earthly realm. The healing serves as visible, verifiable proof of the invisible reality of forgiveness. This passage establishes a pattern: Jesus'' miracles are not ends in themselves but signs pointing to his identity and authority.'),
  (11, 'I say unto thee, Arise, and take up thy bed, and go thy way into thine house.',
   'σοὶ λέγω ἔγειρε καὶ ἆρον τὸν κράβαττόν σου καὶ ὕπαγε εἰς τὸν οἶκόν σου',
   'soi legō egeire kai aron ton krabatton sou kai hypage eis ton oikon sou',
   '''I say unto thee'' (soi legō — to you I say; emphatic, personal address). ''Arise'' (egeire — rise up; the same root as resurrection). ''Take up thy bed'' — the mat that carried him will now be carried by him. ''Go thy way into thine house'' — a complete restoration: physical healing, social reintegration, return to normal life. Three commands, each requiring faith-filled obedience.',
   NULL),
  (12, 'And immediately he arose, took up the bed, and went forth before them all; insomuch that they were all amazed, and glorified God, saying, We never saw it on this fashion.',
   'καὶ ἠγέρθη εὐθέως καὶ ἄρας τὸν κράβαττον ἐξῆλθεν ἐναντίον πάντων ὥστε ἐξίστασθαι πάντας καὶ δοξάζειν τὸν θεὸν λέγοντας ὅτι οὐδέποτε οὕτως εἴδομεν',
   'kai ēgerthē eutheōs kai aras ton krabatton exēlthen enantion pantōn hōste existasthai pantas kai doxazein ton theon legontas hoti oudepote houtōs eidomen',
   '''Immediately he arose'' — instant, complete healing. ''Before them all'' (enantion pantōn — in the sight of everyone; the proof is public and undeniable). ''Amazed'' (existasthai — beside themselves, ecstatic). ''Glorified God'' (doxazein ton theon — they gave glory to God). ''We never saw it on this fashion'' (oudepote houtōs eidomen — never have we seen anything like this). The crowd''s response validates Jesus'' claim: the visible healing proves the invisible forgiveness.',
   NULL),
  (13, 'And he went forth again by the sea side; and all the multitude resorted unto him, and he taught them.',
   'καὶ ἐξῆλθεν πάλιν παρὰ τὴν θάλασσαν καὶ πᾶς ὁ ὄχλος ἤρχετο πρὸς αὐτόν καὶ ἐδίδασκεν αὐτούς',
   'kai exēlthen palin para tēn thalassan kai pas ho ochlos ērcheto pros auton kai edidasken autous',
   '''By the sea side'' — Jesus returns to the shore of Galilee, his open-air classroom. ''All the multitude'' — the crowds continue to grow. ''He taught them'' (edidasken — was teaching; imperfect: continuous instruction). Teaching remains Jesus'' primary activity in Mark; miracles and controversies emerge within the context of ongoing instruction.',
   NULL),
  (14, 'And as he passed by, he saw Levi the son of Alphaeus sitting at the receipt of custom, and said unto him, Follow me. And he arose and followed him.',
   'καὶ παράγων εἶδεν Λευὶν τὸν τοῦ Ἀλφαίου καθήμενον ἐπὶ τὸ τελώνιον καὶ λέγει αὐτῷ ἀκολούθει μοι καὶ ἀναστὰς ἠκολούθησεν αὐτῷ',
   'kai paragōn eiden Leuin ton tou Alphaiou kathēmenon epi to telōnion kai legei autō akolouthei moi kai anastas ēkolouthēsen autō',
   '''Levi the son of Alphaeus'' — also known as Matthew (Matthew 9:9). ''Sitting at the receipt of custom'' (kathēmenon epi to telōnion — seated at the tax booth). Tax collectors (telōnai) were despised as collaborators with Rome and presumed dishonest. ''Follow me'' (akolouthei moi — present imperative: keep following me). ''He arose and followed'' — the same immediate, total response as Simon and Andrew (1:18). Jesus calls the religiously despised with the same authority he calls the working class.',
   NULL),
  (15, 'And it came to pass, that, as Jesus sat at meat in his house, many publicans and sinners sat also together with Jesus and his disciples: for there were many, and they followed him.',
   'καὶ ἐγένετο ἐν τῷ κατακεῖσθαι αὐτὸν ἐν τῇ οἰκίᾳ αὐτοῦ καὶ πολλοὶ τελῶναι καὶ ἁμαρτωλοὶ συνανέκειντο τῷ Ἰησοῦ καὶ τοῖς μαθηταῖς αὐτοῦ ἦσαν γὰρ πολλοὶ καὶ ἠκολούθησαν αὐτῷ',
   'kai egeneto en tō katakeisthai auton en tē oikia autou kai polloi telōnai kai hamartōloi synanekeinto tō Iēsou kai tois mathētais autou ēsan gar polloi kai ēkolouthēsan autō',
   '''Sat at meat'' (katakeisthai — reclined at table; the posture for formal dining). ''His house'' — likely Levi''s house (Luke 5:29 makes this explicit). ''Publicans and sinners'' (telōnai kai hamartōloi — tax collectors and sinners; a stock phrase for the religiously and socially marginalised). ''Sat also together'' (synanekeinto — reclined together with; table fellowship implied intimacy and acceptance). Jesus does not merely tolerate sinners — he dines with them, the most intimate form of social acceptance in the ancient world.',
   NULL),
  (16, 'And when the scribes and Pharisees saw him eat with publicans and sinners, they said unto his disciples, How is it that he eateth and drinketh with publicans and sinners?',
   'καὶ οἱ γραμματεῖς καὶ οἱ Φαρισαῖοι ἰδόντες αὐτὸν ἐσθίοντα μετὰ τῶν τελωνῶν καὶ ἁμαρτωλῶν ἔλεγον τοῖς μαθηταῖς αὐτοῦ τί ὅτι μετὰ τῶν τελωνῶν καὶ ἁμαρτωλῶν ἐσθίει καὶ πίνει',
   'kai hoi grammateis kai hoi Pharisaioi idontes auton esthionta meta tōn telōnōn kai hamartōlōn elegon tois mathētais autou ti hoti meta tōn telōnōn kai hamartōlōn esthiei kai pinei',
   '''Scribes and Pharisees'' — the scribes are legal experts; the Pharisees are the purity-focused separatist movement. ''Eateth and drinketh'' — sharing a meal was not casual but covenantal in Jewish culture. To eat with sinners was to condone their lifestyle (in Pharisaic logic). The Pharisees do not address Jesus directly but go to his disciples — a passive-aggressive approach that Jesus overhears and answers directly (v.17).',
   NULL),
  (17, 'When Jesus heard it, he saith unto them, They that are whole have no need of the physician, but they that are sick: I came not to call the righteous, but sinners to repentance.',
   'καὶ ἀκούσας ὁ Ἰησοῦς λέγει αὐτοῖς οὐ χρείαν ἔχουσιν οἱ ἰσχύοντες ἰατροῦ ἀλλ᾿ οἱ κακῶς ἔχοντες οὐκ ἦλθον καλέσαι δικαίους ἀλλὰ ἁμαρτωλοὺς εἰς μετάνοιαν',
   'kai akousas ho Iēsous legei autois ou chreian echousin hoi ischyontes iatrou all hoi kakōs echontes ouk ēlthon kalesai dikaious alla hamartōlous eis metanoian',
   '''They that are whole'' (hoi ischyontes — the strong, the healthy). ''Physician'' (iatrou — doctor, healer). ''I came'' (ēlthon — I have come; the language of divine mission). ''Not to call the righteous, but sinners'' — sharp irony: the Pharisees consider themselves righteous, so by their own logic they don''t need Jesus. ''To repentance'' (eis metanoian — unto a change of mind and life). Jesus defines his mission: he is a physician who goes where the sickness is.',
   'This saying is one of Jesus'' most important self-descriptions. ''I came'' (ēlthon) implies pre-existence and divine mission — he came from somewhere with a specific purpose. The physician metaphor reframes the Pharisees'' objection: a doctor does not avoid sick patients to maintain his own health. Jesus'' association with sinners is not contamination but ministry. The irony cuts deep: the ''righteous'' who don''t think they need Jesus are actually in greater danger than the sinners who know they do.'),
  (18, 'And the disciples of John and of the Pharisees used to fast: and they come and say unto him, Why do the disciples of John and of the Pharisees fast, but thy disciples fast not?',
   'καὶ ἦσαν οἱ μαθηταὶ Ἰωάννου καὶ οἱ τῶν Φαρισαίων νηστεύοντες καὶ ἔρχονται καὶ λέγουσιν αὐτῷ διὰ τί οἱ μαθηταὶ Ἰωάννου καὶ οἱ τῶν Φαρισαίων νηστεύουσιν οἱ δὲ σοὶ μαθηταὶ οὐ νηστεύουσιν',
   'kai ēsan hoi mathētai Iōannou kai hoi tōn Pharisaiōn nēsteuontes kai erchontai kai legousin autō dia ti hoi mathētai Iōannou kai hoi tōn Pharisaiōn nēsteuousin hoi de soi mathētai ou nēsteuousin',
   '''Used to fast'' (nēsteuontes — fasting; the Pharisees fasted twice a week, Monday and Thursday, Luke 18:12). ''Thy disciples fast not'' — the question implies that Jesus'' movement lacks proper piety. Fasting was a mark of devout Judaism. John''s disciples and the Pharisees agreed on this practice, making Jesus'' disciples the odd ones out.',
   NULL),
  (19, 'And Jesus said unto them, Can the children of the bridechamber fast, while the bridegroom is with them? as long as they have the bridegroom with them, they cannot fast.',
   'καὶ εἶπεν αὐτοῖς ὁ Ἰησοῦς μὴ δύνανται οἱ υἱοὶ τοῦ νυμφῶνος ἐν ᾧ ὁ νυμφίος μετ᾿ αὐτῶν ἐστιν νηστεύειν ὅσον χρόνον μετ᾿ αὐτῶν ἔχουσιν τὸν νυμφίον οὐ δύνανται νηστεύειν',
   'kai eipen autois ho Iēsous mē dynantai hoi huioi tou nymphōnos en hō ho nymphios met autōn estin nēsteuein hoson chronon met autōn echousin ton nymphion ou dynantai nēsteuein',
   '''Children of the bridechamber'' (huioi tou nymphōnos — wedding guests, friends of the bridegroom). ''Bridegroom'' (nymphios — the groom). Jesus implicitly identifies himself as the bridegroom — a title used for God in the OT (Isaiah 62:5, Hosea 2:16-20). Fasting signifies mourning and longing; you cannot mourn at a wedding. Jesus'' presence makes fasting inappropriate because the messianic age has dawned.',
   NULL),
  (20, 'But the days will come, when the bridegroom shall be taken away from them, and then shall they fast in those days.',
   'ἐλεύσονται δὲ ἡμέραι ὅταν ἀπαρθῇ ἀπ᾿ αὐτῶν ὁ νυμφίος καὶ τότε νηστεύσουσιν ἐν ἐκείναις ταῖς ἡμέραις',
   'eleusontai de hēmerai hotan aparthē ap autōn ho nymphios kai tote nēsteusousin en ekeinais tais hēmerais',
   '''Taken away'' (aparthē — removed, snatched away; a violent word hinting at the crucifixion). This is the first veiled prediction of Jesus'' death in Mark. ''Then shall they fast'' — after the cross, fasting will be appropriate as the disciples grieve Jesus'' absence and long for his return. Jesus acknowledges that the wedding joy will be interrupted by his violent departure.',
   NULL),
  (21, 'No man also seweth a piece of new cloth on an old garment: else the new piece that filled it up taketh away from the old, and the rent is made worse.',
   'οὐδεὶς ἐπίβλημα ῥάκους ἀγνάφου ἐπιράπτει ἐπὶ ἱματίῳ παλαιῷ εἰ δὲ μή αἴρει τὸ πλήρωμα αὐτοῦ τὸ καινὸν τοῦ παλαιοῦ καὶ χεῖρον σχίσμα γίνεται',
   'oudeis epiblēma rhakous agnaphou epiraptei epi himatiō palaiō ei de mē airei to plērōma autou to kainon tou palaiou kai cheiron schisma ginetai',
   '''New cloth'' (rhakous agnaphou — unshrunk, unfulled cloth). ''Old garment'' (himatiō palaiō). ''Rent is made worse'' (cheiron schisma — a worse tear). New unshrunk cloth will shrink when washed, pulling away from the old fabric and creating a bigger tear. The point: Jesus'' ministry cannot be patched onto the old religious system. The new wine of the kingdom requires entirely new structures.',
   NULL),
  (22, 'And no man putteth new wine into old bottles: else the new wine doth burst the bottles, and the wine is spilled, and the bottles will be marred: but new wine must be put into new bottles.',
   'καὶ οὐδεὶς βάλλει οἶνον νέον εἰς ἀσκοὺς παλαιούς εἰ δὲ μή ῥήσσει ὁ οἶνος ὁ νέος τοὺς ἀσκούς καὶ ὁ οἶνος ἐκχεῖται καὶ οἱ ἀσκοὶ ἀπολοῦνται ἀλλὰ οἶνον νέον εἰς ἀσκοὺς καινοὺς βλητέον',
   'kai oudeis ballei oinon neon eis askous palaious ei de mē rhēssei ho oinos ho neos tous askous kai ho oinos ekcheitai kai hoi askoi apolountai alla oinon neon eis askous kainous blēteon',
   '''New wine'' (oinon neon — fresh, young wine still fermenting). ''Old bottles'' (askous palaious — old wineskins, leather bags hardened with age). ''Burst'' (rhēssei — tears apart). ''New bottles'' (askous kainous — fresh wineskins, flexible and able to expand). The fermenting new wine will expand and burst rigid old skins. Jesus'' kingdom cannot be contained within the old forms of Pharisaic Judaism. New wine requires new wineskins.',
   'These twin parables (new cloth, new wine) are revolutionary. Jesus is not reforming Judaism from within; he is inaugurating something new. The old religious structures — ritual fasting, purity regulations, Sabbath traditions — cannot contain the dynamic, expanding reality of the kingdom. This does not mean the Old Testament is discarded (Jesus just honoured Moses in 1:44), but that the old forms of religious practice must give way to the new reality of Christ''s presence. The kingdom of God is new wine that demands new containers.'),
  (23, 'And it came to pass, that he went through the corn fields on the sabbath day; and his disciples began, as they went, to pluck the ears of corn.',
   'καὶ ἐγένετο παραπορεύεσθαι αὐτὸν ἐν τοῖς σάββασιν διὰ τῶν σπορίμων καὶ ἤρξαντο οἱ μαθηταὶ αὐτοῦ ὁδὸν ποιεῖν τίλλοντες τοὺς στάχυας',
   'kai egeneto paraporeuesthai auton en tois sabbasin dia tōn sporimōn kai ērxanto hoi mathētai autou hodon poiein tillontes tous stachyas',
   '''Corn fields'' (sporimōn — grain fields, sown fields). ''Pluck the ears of corn'' (tillontes tous stachyas — picking heads of grain). Deuteronomy 23:25 permitted plucking grain from a neighbour''s field; the issue was not theft but Sabbath violation. The Pharisees classified plucking as ''reaping'' and rubbing kernels as ''threshing'' — both prohibited on the Sabbath under their tradition.',
   NULL),
  (24, 'And the Pharisees said unto him, Behold, why do they on the sabbath day that which is not lawful?',
   'καὶ οἱ Φαρισαῖοι ἔλεγον αὐτῷ ἴδε τί ποιοῦσιν ἐν τοῖς σάββασιν ὃ οὐκ ἔξεστιν',
   'kai hoi Pharisaioi elegon autō ide ti poiousin en tois sabbasin ho ouk exestin',
   '''Not lawful'' (ouk exestin — not permitted; they appeal to their oral law, the ''tradition of the elders''). The Pharisees hold Jesus responsible for his disciples'' actions — a rabbi was accountable for his students'' behaviour. The challenge is direct: ''Look! Why are they doing what is unlawful?'' The Sabbath has become the new battleground in the escalating conflict.',
   NULL),
  (25, 'And he said unto them, Have ye never read what David did, when he had need, and was an hungred, he, and they that were with him?',
   'καὶ αὐτὸς ἔλεγεν αὐτοῖς οὐδέποτε ἀνέγνωτε τί ἐποίησεν Δαυίδ ὅτε χρείαν ἔσχεν καὶ ἐπείνασεν αὐτὸς καὶ οἱ μετ᾿ αὐτοῦ',
   'kai autos elegen autois oudepote anegnōte ti epoiēsen Dauid hote chreian eschen kai epeinasen autos kai hoi met autou',
   '''Have ye never read'' (oudepote anegnōte — have you never read?; a cutting rebuke to Scripture scholars). Jesus appeals to 1 Samuel 21:1-6 — David and his men ate the showbread reserved for priests. If David, as God''s anointed, could override ceremonial law in a time of need, how much more can the Son of David, the Lord''s Anointed?',
   NULL),
  (26, 'How he went into the house of God in the days of Abiathar the high priest, and did eat the shewbread, which is not lawful to eat but for the priests, and gave also to them which were with him?',
   'πῶς εἰσῆλθεν εἰς τὸν οἶκον τοῦ θεοῦ ἐπὶ Ἀβιαθὰρ ἀρχιερέως καὶ τοὺς ἄρτους τῆς προθέσεως ἔφαγεν οὓς οὐκ ἔξεστιν φαγεῖν εἰ μὴ τοῖς ἱερεῦσιν καὶ ἔδωκεν καὶ τοῖς σὺν αὐτῷ οὖσιν',
   'pōs eisēlthen eis ton oikon tou theou epi Abiathar archiereōs kai tous artous tēs protheseōs ephagen hous ouk exestin phagein ei mē tois hiereusin kai edōken kai tois syn autō ousin',
   '''In the days of Abiathar the high priest'' — 1 Samuel 21 names the priest as Ahimelech, Abiathar''s father. ''Abiathar'' may refer to the priestly era or the more prominent priest (Abiathar served alongside David later). ''Shewbread'' (artous tēs protheseōs — bread of the presence/setting forth; the twelve loaves placed before God weekly, Leviticus 24:5-9). ''Not lawful to eat but for the priests'' — yet David ate it and was not condemned. Human need can take precedence over ceremonial regulation.',
   NULL),
  (27, 'And he said unto them, The sabbath was made for man, and not man for the sabbath:',
   'καὶ ἔλεγεν αὐτοῖς τὸ σάββατον διὰ τὸν ἄνθρωπον ἐγένετο οὐχ ὁ ἄνθρωπος διὰ τὸ σάββατον',
   'kai elegen autois to sabbaton dia ton anthrōpon egeneto ouch ho anthrōpos dia to sabbaton',
   '''The sabbath was made for man'' (to sabbaton dia ton anthrōpon egeneto — the Sabbath came into being for humanity''s sake). ''Not man for the sabbath'' — humanity was not created to serve the Sabbath; the Sabbath was created to serve humanity. God gave the Sabbath as a gift of rest and worship (Genesis 2:2-3, Exodus 20:8-11), not as a burden. The Pharisees had inverted the relationship, making the Sabbath a master rather than a servant.',
   'This principle is revolutionary: religious institutions exist to serve people, not the reverse. God designed the Sabbath for human flourishing — for rest, worship, and renewal. When religious rules become oppressive rather than liberating, they have been distorted from their original purpose. Jesus does not abolish the Sabbath but restores its true meaning. The principle extends beyond the Sabbath to all religious practice: God''s commands are designed for human good, not arbitrary restriction.'),
  (28, 'Therefore the Son of man is Lord also of the sabbath.',
   'ὥστε κύριός ἐστιν ὁ υἱὸς τοῦ ἀνθρώπου καὶ τοῦ σαββάτου',
   'hōste kyrios estin ho huios tou anthrōpou kai tou sabbatou',
   '''Therefore'' (hōste — so that, consequently). ''Lord'' (kyrios — sovereign ruler, master). ''Son of man'' — Jesus'' preferred self-designation. ''Lord also of the sabbath'' — if the Sabbath was made for man, and the Son of Man is humanity''s representative and ruler, then he has authority over the Sabbath itself. This is an extraordinary claim: the Sabbath was instituted by God at creation (Genesis 2:2-3), so to be Lord of the Sabbath is to claim divine authority.',
   'The climactic declaration of Mark 2. Jesus claims lordship over the Sabbath — an institution created by God himself. This is not merely a reinterpretation of Sabbath law but a claim to divine authority. The Son of Man is Lord (kyrios) of the Sabbath — the same title (kyrios) used for Yahweh in the LXX. Jesus has claimed authority to forgive sins (v.10) and now authority over God''s created order (the Sabbath). The chapter systematically reveals Jesus exercising prerogatives that belong to God alone, forcing the question that will dominate the rest of the Gospel: who is this man?')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 2;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.5 forgive
  ('ἀφίημι', 'aphiēmi', 'G863', 'To forgive, send away, release, let go — from apo (away from) + hiēmi (to send). In the context of sin, aphiēmi means to send sins away, to release from guilt. The perfect passive (apheōntai) indicates a completed action with ongoing results: ''your sins have been and remain forgiven.'' This forgiveness is not earned but declared — a sovereign act of grace. Only God can send sins away (Isaiah 43:25), which is precisely the scribes'' point (v.7) and precisely Jesus'' claim (v.10).', 1),
  -- v.10 Son of man
  ('υἱὸς τοῦ ἀνθρώπου', 'huios tou anthrōpou', 'G5207/G444', 'Son of Man — Jesus'' most frequent self-designation (used 14 times in Mark). The title is drawn primarily from Daniel 7:13-14, where ''one like the Son of man'' approaches the Ancient of Days and receives everlasting dominion. It combines humanity (''son of man'' = human being) with transcendent authority (receiving universal, eternal kingdom). In Mark, the Son of Man has authority to forgive sins (2:10), is Lord of the Sabbath (2:28), will suffer and die (8:31, 10:33), and will come in glory (13:26, 14:62).', 2),
  -- v.17 physician
  ('ἰατρός', 'iatros', 'G2395', 'Physician, healer, doctor — from iaomai (to heal, cure). Jesus'' physician metaphor reframes the entire debate: associating with sinners is not contamination but treatment. A doctor does not avoid the sick; that would be malpractice. Jesus defines his mission as therapeutic: he has come to heal the spiritually sick. The metaphor also implies diagnosis — the Pharisees who think they are healthy are actually the sickest patients, because they do not recognise their need.', 3),
  -- v.19 bridegroom
  ('νυμφίος', 'nymphios', 'G3566', 'Bridegroom — from nymphē (bride). In the OT, God is portrayed as Israel''s husband/bridegroom (Isaiah 54:5, 62:5, Hosea 2:16-20). By calling himself the bridegroom, Jesus implicitly claims to be the divine husband of God''s people. The wedding metaphor also signals eschatological joy: the messianic age was expected to be like a wedding feast (Isaiah 25:6-8, Revelation 19:7-9). Jesus'' presence inaugurates this messianic celebration, making fasting (an expression of mourning) inappropriate.', 4),
  -- v.22 new wine
  ('οἶνος νέος', 'oinos neos', 'G3631/G3501', 'New wine — oinos (wine) + neos (new, young, fresh). Fresh grape juice still fermenting, expanding with the gases of fermentation. The new wine represents the dynamic, expanding reality of Jesus'' kingdom — living, fermenting, growing. It cannot be contained in the rigid, inflexible structures (old wineskins) of Pharisaic tradition. The parable declares that Jesus is not reforming the old system but inaugurating something entirely new that requires new forms to contain it.', 5),
  -- v.27 sabbath
  ('σάββατον', 'sabbaton', 'G4521', 'Sabbath, rest day — from Hebrew shabbāth (cessation, rest). God rested on the seventh day (Genesis 2:2-3) and commanded Israel to do the same (Exodus 20:8-11). The Pharisees had added hundreds of specific prohibitions (the Mishnah tractate Shabbat lists 39 categories of forbidden work). Jesus reasserts the original purpose: the Sabbath was a gift for human rest and renewal, not a legalistic burden. It was created to serve humanity, not to enslave it.', 6),
  -- v.28 Lord / kyrios
  ('κύριος', 'kyrios', 'G2962', 'Lord, master, sovereign — from kyros (supreme authority). In secular Greek, kyrios means ''sir'' or ''master.'' In the LXX, kyrios translates the divine name YHWH (LORD). When Jesus declares the Son of Man to be kyrios of the Sabbath, the title carries both human and divine resonance: he is both the supreme human representative (Son of Man) and the divine Lord (kyrios = YHWH) who instituted the Sabbath at creation. This is the highest Christological claim in the chapter.', 7)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 2
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 5
    WHEN 2 THEN 10
    WHEN 3 THEN 17
    WHEN 4 THEN 19
    WHEN 5 THEN 22
    WHEN 6 THEN 27
    WHEN 7 THEN 28
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.5 thy sins be forgiven
  (5, 'Isaiah 43:25', 1),
  (5, 'Psalm 103:3', 2),
  (5, 'Luke 7:48', 3),
  -- v.7 who can forgive but God
  (7, 'Isaiah 44:22', 4),
  (7, 'Daniel 9:9', 5),
  -- v.10 Son of man hath power
  (10, 'Daniel 7:13-14', 6),
  (10, 'John 5:27', 7),
  -- v.14 Follow me (Levi)
  (14, 'Matthew 9:9', 8),
  (14, 'Luke 5:27-28', 9),
  -- v.17 not the righteous but sinners
  (17, 'Luke 19:10', 10),
  (17, '1 Timothy 1:15', 11),
  (17, 'Ezekiel 34:16', 12),
  -- v.19 bridegroom
  (19, 'Isaiah 62:5', 13),
  (19, 'John 3:29', 14),
  (19, 'Revelation 19:7-9', 15),
  -- v.20 bridegroom taken away
  (20, 'Isaiah 53:8', 16),
  -- v.22 new wine new bottles
  (22, 'Luke 5:37-39', 17),
  (22, 'Hebrews 8:13', 18),
  -- v.25 David and the shewbread
  (25, '1 Samuel 21:1-6', 19),
  (25, 'Leviticus 24:5-9', 20),
  -- v.27 sabbath made for man
  (27, 'Genesis 2:2-3', 21),
  (27, 'Exodus 20:8-11', 22),
  (27, 'Deuteronomy 5:14-15', 23),
  -- v.28 Lord of the sabbath
  (28, 'Matthew 12:8', 24),
  (28, 'Luke 6:5', 25),
  (28, 'John 5:17-18', 26)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 2
  AND v.verse_number = cr.verse_number;
