-- ═══════════════════════════════════════════════════
-- JOHN CHAPTER 9 — The Healing of the Man Born Blind
-- 41 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'John 9 is one of the masterfully constructed narratives in the Gospel — a dramatic story of physical healing and spiritual awakening set against the backdrop of religious blindness. Jesus encounters a man blind from birth and declares: ''Neither hath this man sinned, nor his parents: but that the works of God should be made manifest in him'' (v.3). He anoints the man''s eyes with clay and sends him to wash in the Pool of Siloam: ''He went his way therefore, and washed, and came seeing'' (v.7). The miracle provokes a series of interrogations — by neighbours (vv.8-12), by the Pharisees (vv.13-17), by the Jewish authorities who summon his parents (vv.18-23), and by the Pharisees again (vv.24-34). Through each interrogation, the healed man grows bolder in his testimony: first calling Jesus ''a man called Jesus'' (v.11), then ''a prophet'' (v.17), then defending him as one ''of God'' (v.33). Meanwhile, the Pharisees grow increasingly hostile, excommunicating the man for testifying (v.34). Jesus seeks out the expelled man and reveals himself: ''Dost thou believe on the Son of God?... Thou hast both seen him, and it is he that talketh with thee'' (vv.35-37). The man responds with worship: ''Lord, I believe. And he worshipped him'' (v.38). The chapter closes with Jesus'' pronouncement of judgment: ''For judgment I am come into this world, that they which see not might see; and that they which see might be made blind'' (v.39). The Pharisees ask, ''Are we blind also?'' Jesus replies: ''If ye were blind, ye should have no sin: but now ye say, We see; therefore your sin remaineth'' (v.41). The supreme irony: the blind man sees; the seeing are blind.',
  'Sight and Blindness — Physical Healing and Spiritual Awakening',
  'τυφλός (typhlos)',
  'Blind, unable to see, without sight — both physically and metaphorically. In John 9, typhlos operates on two levels: the man is physically blind from birth and receives physical sight; the Pharisees are spiritually blind and refuse to see. The physical miracle illustrates the spiritual reality: Jesus opens blind eyes — both literal and metaphorical. The healed man progressively ''sees'' who Jesus is (man → prophet → from God → Son of God → Lord); the Pharisees progressively ''blind'' themselves (investigating → denying → excommunicating → claiming to see while remaining blind). Typhlos in the NT: Matthew 15:14 (''blind leaders of the blind''), 2 Corinthians 4:4 (''the god of this world hath blinded the minds''), Revelation 3:17 (''thou art blind, and seest not'').',
  '["The Healing (vv.1-7): As Jesus passed by he saw a man which was blind from his birth. His disciples asked saying Master who did sin this man or his parents that he was born blind? Jesus answered Neither hath this man sinned nor his parents but that the works of God should be made manifest in him. I must work the works of him that sent me while it is day the night cometh when no man can work. As long as I am in the world I am the light of the world. When he had thus spoken he spat on the ground and made clay of the spittle and he anointed the eyes of the blind man with the clay And said unto him Go wash in the pool of Siloam which is by interpretation Sent. He went his way therefore and washed and came seeing","The Neighbours'' Investigation (vv.8-12): The neighbours therefore and they which before had seen him that he was blind said Is not this he that sat and begged? Some said This is he others said He is like him but he said I am he. Therefore said they unto him How were thine eyes opened? He answered and said A man that is called Jesus made clay and anointed mine eyes and said unto me Go to the pool of Siloam and wash and I went and washed and I received sight. Then said they unto him Where is he? He said I know not","The First Pharisee Interrogation (vv.13-17): They brought to the Pharisees him that aforetime was blind. And it was the sabbath day when Jesus made the clay and opened his eyes. Then again the Pharisees also asked him how he had received his sight. He said unto them He put clay upon mine eyes and I washed and do see. Therefore said some of the Pharisees This man is not of God because he keepeth not the sabbath day. Others said How can a man that is a sinner do such miracles? And there was a division among them. They say unto the blind man again What sayest thou of him that he hath opened thine eyes? He said He is a prophet","The Parents'' Interrogation (vv.18-23): But the Jews did not believe concerning him that he had been blind and received his sight until they called the parents of him that had received his sight. And they asked them saying Is this your son who ye say was born blind? how then doth he now see? His parents answered and said We know that this is our son and that he was born blind. But by what means he now seeth we know not or who hath opened his eyes we know not he is of age ask him he shall speak for himself. These words spake his parents because they feared the Jews for the Jews had agreed already that if any man did confess that he was Christ he should be put out of the synagogue. Therefore said his parents He is of age ask him","The Second Pharisee Interrogation and Expulsion (vv.24-34): Then again called they the man that was blind and said unto him Give God the praise we know that this man is a sinner. He answered and said Whether he be a sinner or no I know not one thing I know that whereas I was blind now I see. Then said they to him again What did he to thee? how opened he thine eyes? He answered them I have told you already and ye did not hear wherefore would ye hear it again? will ye also be his disciples? Then they reviled him and said Thou art his disciple but we are Moses'' disciples. We know that God spake unto Moses as for this fellow we know not from whence he is. The man answered and said unto them Why herein is a marvellous thing that ye know not from whence he is and yet he hath opened mine eyes. Now we know that God heareth not sinners but if any man be a worshipper of God and doeth his will him he heareth. Since the world began was it not heard that any man opened the eyes of one that was born blind. If this man were not of God he could do nothing. They answered and said unto him Thou wast altogether born in sins and dost thou teach us? And they cast him out","Jesus Reveals Himself (vv.35-38): Jesus heard that they had cast him out and when he had found him he said unto him Dost thou believe on the Son of God? He answered and said Who is he Lord that I might believe on him? And Jesus said unto him Thou hast both seen him and it is he that talketh with thee. And he said Lord I believe. And he worshipped him","Spiritual Blindness Judged (vv.39-41): And Jesus said For judgment I am come into this world that they which see not might see and that they which see might be made blind. And some of the Pharisees which were with him heard these words and said unto him Are we blind also? Jesus said unto them If ye were blind ye should have no sin but now ye say We see therefore your sin remaineth"]'
FROM books b WHERE b.name = 'John';

-- Step 2: Insert all 41 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And as Jesus passed by, he saw a man which was blind from his birth.',
   'καὶ παράγων εἶδεν ἄνθρωπον τυφλὸν ἐκ γενετῆς',
   'kai paragōn eiden anthrōpon typhlon ek genetēs',
   '''As Jesus passed by'' (paragōn — passing along; the narrative continues from 8:59 where Jesus left the temple). ''Blind from his birth'' (typhlon ek genetēs — blind from birth). This is significant: the man was not merely ill but had never seen — no deterioration to reverse, no memory of sight to restore. He needed entirely new sight, creation rather than repair. This is the sixth sign in John and the most medically extraordinary — no case of congenital blindness being cured was known in the ancient world.',
   NULL),
  (2, 'And his disciples asked him, saying, Master, who did sin, this man, or his parents, that he was born blind?',
   'καὶ ἠρώτησαν αὐτὸν οἱ μαθηταὶ αὐτοῦ λέγοντες Ῥαββί τίς ἥμαρτεν οὗτος ἢ οἱ γονεῖς αὐτοῦ ἵνα τυφλὸς γεννηθῇ',
   'kai ērōtēsan auton hoi mathētai autou legontes Rhabbi tis hēmarten houtos ē hoi goneis autou hina typhlos gennēthē',
   'The disciples assume a direct link between sin and suffering — a common ancient view. ''Who did sin, this man, or his parents?'' The question presents a false dilemma: if the man sinned (perhaps in the womb — some Jewish teachers held this was possible), or if his parents sinned and he bears the consequence. Both options assume suffering must be punishment for specific sin.',
   NULL),
  (3, 'Jesus answered, Neither hath this man sinned, nor his parents: but that the works of God should be made manifest in him.',
   'ἀπεκρίθη ὁ Ἰησοῦς Οὔτε οὗτος ἥμαρτεν οὔτε οἱ γονεῖς αὐτοῦ ἀλλ᾽ ἵνα φανερωθῇ τὰ ἔργα τοῦ θεοῦ ἐν αὐτῷ',
   'apekrithē ho Iēsous Oute houtos hēmarten oute hoi goneis autou all hina phanerōthē ta erga tou theou en autō',
   '''Neither hath this man sinned, nor his parents'' — Jesus rejects both options. This does not mean they were sinless (all have sinned, Romans 3:23) but that this specific blindness was not punishment for a specific sin. ''That the works of God should be made manifest in him'' (hina phanerōthē ta erga tou theou — so that the works of God might be displayed). The purpose of the suffering is not retribution but revelation. God''s glory can be displayed in and through human suffering — not because suffering is good but because God is sovereign over it.',
   'This verse overturns simplistic theology that equates all suffering with divine punishment. While some suffering results from sin (cf. 5:14), much suffering serves God''s redemptive purposes. Job suffered without personal cause; Paul''s thorn was for his benefit (2 Corinthians 12:7-10). The blind man''s lifelong darkness was not wasted — it became the canvas on which God painted his glory. This does not trivialise suffering but transforms its meaning: suffering in God''s hands becomes an occasion for divine revelation.'),
  (4, 'I must work the works of him that sent me, while it is day: the night cometh, when no man can work.',
   'ἐμὲ δεῖ ἐργάζεσθαι τὰ ἔργα τοῦ πέμψαντός με ἕως ἡμέρα ἐστίν ἔρχεται νὺξ ὅτε οὐδεὶς δύναται ἐργάζεσθαι',
   'eme dei ergazesthai ta erga tou pempsantos me heōs hēmera estin erchetai nyx hote oudeis dynatai ergazesthai',
   '''I must work'' (eme dei — it is necessary for me; dei: divine necessity). ''While it is day'' — Jesus'' earthly ministry is the ''day'' for his work; the ''night'' is his departure through death. There is urgency: the time for work is limited. ''No man can work'' when the night comes — not that believers will be unable to serve, but that Jesus'' personal, incarnate ministry has a bounded timeframe.',
   NULL),
  (5, 'As long as I am in the world, I am the light of the world.',
   'ὅταν ἐν τῷ κόσμῳ ὦ φῶς εἰμι τοῦ κόσμου',
   'hotan en tō kosmō ō phōs eimi tou kosmou',
   '''I am the light of the world'' — repeated from 8:12. Here, the claim is immediately demonstrated by giving light to a man born in darkness. The one who claims to be Light proves it by creating sight where none existed. The miracle is a visual parable of the spiritual reality: Jesus opens blind eyes, both physical and spiritual.',
   NULL),
  (6, 'When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,',
   'ταῦτα εἰπὼν ἔπτυσεν χαμαί καὶ ἐποίησεν πηλὸν ἐκ τοῦ πτύσματος καὶ ἐπέχρισεν τὸν πηλὸν ἐπὶ τοὺς ὀφθαλμοὺς τοῦ τυφλοῦ',
   'tauta eipōn eptusen chamai kai epoiēsen pēlon ek tou ptysmatos kai epechrisen ton pēlon epi tous ophthalmous tou typhlou',
   '''Spat on the ground, and made clay'' (eptusen chamai kai epoiēsen pēlon — he spat on the earth and made mud). The use of clay (pēlon) evokes Genesis 2:7 — God formed man from the dust of the ground. Jesus, the Creator (1:3), uses the same medium to create sight. The act is deliberately provocative: making clay on the Sabbath was explicitly prohibited by rabbinic law (Shabbat 24:3). Jesus intentionally violates their tradition to demonstrate divine authority over the Sabbath.',
   NULL),
  (7, 'And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.',
   'καὶ εἶπεν αὐτῷ Ὕπαγε νίψαι εἰς τὴν κολυμβήθραν τοῦ Σιλωάμ ὃ ἑρμηνεύεται Ἀπεσταλμένος ἀπῆλθεν οὖν καὶ ἐνίψατο καὶ ἦλθεν βλέπων',
   'kai eipen autō Hypage nipsai eis tēn kolymbēthran tou Silōam ho hermēneuetai Apestalmenos apēlthen oun kai enipsato kai ēlthen blepōn',
   '''The pool of Siloam'' (tēn kolymbēthran tou Silōam) — archaeologically confirmed; discovered in 2004, a large stepped pool at the southern end of the City of David. ''Which is by interpretation, Sent'' (Apestalmenos) — John provides the translation because it is theologically significant: Siloam means ''Sent.'' Jesus is the One sent by the Father (3:17, 34; 5:36; 6:29; 7:29). The man washes in the pool of the Sent One and receives sight. ''He went... washed... came seeing'' — three decisive actions of obedient faith. He obeyed before seeing the result, like the man at Bethesda (5:8-9).',
   NULL),
  (8, 'The neighbours therefore, and they which before had seen him that he was blind, said, Is not this he that sat and begged?',
   'οἱ οὖν γείτονες καὶ οἱ θεωροῦντες αὐτὸν τὸ πρότερον ὅτι τυφλὸς ἦν ἔλεγον Οὐχ οὗτός ἐστιν ὁ καθήμενος καὶ προσαιτῶν',
   'hoi oun geitones kai hoi theōrountes auton to proteron hoti typhlos ēn elegon Ouch houtos estin ho kathēmenos kai prosaitōn',
   'The neighbours recognise the man but are unsure — the transformation is so dramatic that some question his identity. The fact that he was a well-known beggar confirms the miracle''s public nature and the man''s long-standing blindness. The healing is too radical to ignore.',
   NULL),
  (9, 'Some said, This is he: others said, He is like him: but he said, I am he.',
   'ἄλλοι ἔλεγον ὅτι Οὗτός ἐστιν ἄλλοι δὲ ὅτι Ὅμοιος αὐτῷ ἐστιν ἐκεῖνος ἔλεγεν ὅτι Ἐγώ εἰμι',
   'alloi elegon hoti Houtos estin alloi de hoti Homoios autō estin ekeinos elegen hoti Egō eimi',
   '''I am he'' (egō eimi — I am). The healed man''s self-identification uses the same phrase Jesus uses throughout the Gospel. The former blind man bears witness to his own transformation — ''I am the one; I am changed.'' His testimony begins here and will grow in boldness through the chapter.',
   NULL),
  (10, 'Therefore said they unto him, How were thine eyes opened?',
   'ἔλεγον οὖν αὐτῷ Πῶς ἀνεῴχθησάν σου οἱ ὀφθαλμοί',
   'elegon oun autō Pōs aneōchthēsan sou hoi ophthalmoi',
   '''How were thine eyes opened?'' (pōs aneōchthēsan sou hoi ophthalmoi — how were your eyes opened?). The question of ''how'' will dominate the chapter. The neighbours ask how (v.10), the Pharisees ask how (v.15, 26), the parents are asked how (v.19). Everyone wants to know the mechanism; Jesus is interested in the meaning.',
   NULL),
  (11, 'He answered and said, A man that is called Jesus made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.',
   'ἀπεκρίθη ἐκεῖνος καὶ εἶπεν Ἄνθρωπος λεγόμενος Ἰησοῦς πηλὸν ἐποίησεν καὶ ἐπέχρισέν μου τοὺς ὀφθαλμοὺς καὶ εἶπέν μοι Ὕπαγε εἰς τὴν κολυμβήθραν τοῦ Σιλωὰμ καὶ νίψαι ἀπελθὼν δὲ καὶ νιψάμενος ἀνέβλεψα',
   'apekrithē ekeinos kai eipen Anthrōpos legomenos Iēsous pēlon epoiēsen kai epechrise mou tous ophthalmous kai eipen moi Hypage eis tēn kolymbēthran tou Silōam kai nipsai apelthōn de kai nipsamenos aneblepsa',
   '''A man that is called Jesus'' (anthrōpos legomenos Iēsous — a man called Jesus). The healed man''s first description of Jesus: ''a man.'' He does not yet know who Jesus truly is — his understanding will grow progressively: a man (v.11) → a prophet (v.17) → from God (v.33) → Son of God / Lord (vv.35-38). This progression from minimal knowledge to full faith mirrors the journey of every believer.',
   NULL),
  (12, 'Then said they unto him, Where is he? He said, I know not.',
   'εἶπον οὖν αὐτῷ Ποῦ ἐστιν ἐκεῖνος λέγει Οὐκ οἶδα',
   'eipon oun autō Pou estin ekeinos legei Ouk oida',
   '''Where is he? I know not'' — the man cannot locate Jesus. Jesus healed him and sent him away; they have not met face to face with the man seeing. This absence of Jesus from the scene is important: the man must testify alone, without Jesus'' visible support. His faith grows through testimony, not through Jesus'' physical presence.',
   NULL),
  (13, 'They brought to the Pharisees him that aforetime was blind.',
   'ἄγουσιν αὐτὸν πρὸς τοὺς Φαρισαίους τόν ποτε τυφλόν',
   'agousin auton pros tous Pharisaious ton pote typhlon',
   '''Him that aforetime was blind'' (ton pote typhlon — the formerly blind one). The neighbours bring the case to the Pharisees — the religious authorities — because a Sabbath controversy is involved. The investigation that follows (vv.13-34) is essentially a trial: the Pharisees serve as prosecutors, the man as the accused-turned-witness.',
   NULL),
  (14, 'And it was the sabbath day when Jesus made the clay, and opened his eyes.',
   'ἦν δὲ σάββατον ὅτε τὸν πηλὸν ἐποίησεν ὁ Ἰησοῦς καὶ ἀνέῳξεν αὐτοῦ τοὺς ὀφθαλμούς',
   'ēn de sabbaton hote ton pēlon epoiēsen ho Iēsous kai aneōxen autou tous ophthalmous',
   '''It was the sabbath day'' — John places this detail strategically, as in 5:9. Jesus deliberately healed on the Sabbath — this is the third Sabbath confrontation in John (5:9-18; 7:21-24; 9:14-16). Making clay (kneading) was specifically listed among the 39 prohibited labours. Jesus is not accidentally breaking rules; he is purposefully challenging a system that values regulations over people.',
   NULL),
  (15, 'Then again the Pharisees also asked him how he had received his sight. He said unto them, He put clay upon mine eyes, and I washed, and do see.',
   'πάλιν οὖν ἠρώτων αὐτὸν καὶ οἱ Φαρισαῖοι πῶς ἀνέβλεψεν ὁ δὲ εἶπεν αὐτοῖς Πηλὸν ἐπέθηκέν μου ἐπὶ τοὺς ὀφθαλμούς καὶ ἐνιψάμην καὶ βλέπω',
   'palin oun ērōtōn auton kai hoi Pharisaioi pōs aneblepsen ho de eipen autois Pēlon epethēken mou epi tous ophthalmous kai enipsamēn kai blepō',
   'The man''s account becomes terser with each retelling: in v.11, a detailed narrative; here, a three-word summary: ''clay... washed... see.'' He is growing impatient with repetitive questioning — a natural response that reveals his straightforward honesty.',
   NULL),
  (16, 'Therefore said some of the Pharisees, This man is not of God, because he keepeth not the sabbath day. Others said, How can a man that is a sinner do such miracles? And there was a division among them.',
   'ἔλεγον οὖν ἐκ τῶν Φαρισαίων τινές Οὗτος ὁ ἄνθρωπος οὐκ ἔστιν παρὰ θεοῦ ὅτι τὸ σάββατον οὐ τηρεῖ ἄλλοι ἔλεγον Πῶς δύναται ἄνθρωπος ἁμαρτωλὸς τοιαῦτα σημεῖα ποιεῖν καὶ σχίσμα ἦν ἐν αὐτοῖς',
   'elegon oun ek tōn Pharisaiōn tines Houtos ho anthrōpos ouk estin para theou hoti to sabbaton ou tērei alloi elegon Pōs dynatai anthrōpos hamartōlos toiauta sēmeia poiein kai schisma ēn en autois',
   '''This man is not of God'' (ouk estin para theou — he is not from God) — because he breaks the Sabbath. ''How can a man that is a sinner do such miracles?'' — the counter-argument: sinners cannot perform divine signs. A schisma (division) arises among the Pharisees themselves. The evidence (miracle) conflicts with their theology (Sabbath rules). Rather than adjusting their theology, most of them reject the evidence.',
   NULL),
  (17, 'They say unto the blind man again, What sayest thou of him, that he hath opened thine eyes? He said, He is a prophet.',
   'λέγουσιν τῷ τυφλῷ πάλιν Σὺ τί λέγεις περὶ αὐτοῦ ὅτι ἤνοιξέν σου τοὺς ὀφθαλμούς ὁ δὲ εἶπεν ὅτι Προφήτης ἐστίν',
   'legousin tō typhlō palin Sy ti legeis peri autou hoti ēnoixen sou tous ophthalmous ho de eipen hoti Prophētēs estin',
   '''He is a prophet'' (prophētēs estin). The man''s second identification of Jesus — an upgrade from ''a man'' (v.11) to ''a prophet.'' A prophet speaks and acts with God''s authority; the healing proves Jesus has that authority. The man''s understanding is growing through his experience and through the pressure of interrogation.',
   NULL),
  (18, 'But the Jews did not believe concerning him, that he had been blind, and received his sight, until they called the parents of him that had received his sight.',
   'οὐκ ἐπίστευσαν οὖν οἱ Ἰουδαῖοι περὶ αὐτοῦ ὅτι τυφλὸς ἦν καὶ ἀνέβλεψεν ἕως ὅτου ἐφώνησαν τοὺς γονεῖς αὐτοῦ τοῦ ἀναβλέψαντος',
   'ouk episteusan oun hoi Ioudaioi peri autou hoti typhlos ēn kai aneblepsen heōs hotou ephōnēsan tous goneis autou tou anablepsantos',
   '''Did not believe'' (ouk episteusan — they refused to believe). Unable to deny the miracle, they attack its premise: perhaps he was never really blind. This is the last resort of determined unbelief — denial of facts. They summon the parents as witnesses to verify the original blindness.',
   NULL),
  (19, 'And they asked them, saying, Is this your son, who ye say was born blind? how then doth he now see?',
   'καὶ ἠρώτησαν αὐτοὺς λέγοντες Οὗτός ἐστιν ὁ υἱὸς ὑμῶν ὃν ὑμεῖς λέγετε ὅτι τυφλὸς ἐγεννήθη πῶς οὖν ἄρτι βλέπει',
   'kai ērōtēsan autous legontes Houtos estin ho huios hymōn hon hymeis legete hoti typhlos egennēthē pōs oun arti blepei',
   'Three questions in one: (1) Is this your son? (2) Do you confirm he was born blind? (3) How does he now see? The phrasing ''who ye say was born blind'' implies scepticism about the parents'' claim. The authorities are looking for any way to invalidate the miracle.',
   NULL),
  (20, 'His parents answered them and said, We know that this is our son, and that he was born blind:',
   'ἀπεκρίθησαν αὐτοῖς οἱ γονεῖς αὐτοῦ καὶ εἶπον Οἴδαμεν ὅτι οὗτός ἐστιν ὁ υἱὸς ἡμῶν καὶ ὅτι τυφλὸς ἐγεννήθη',
   'apekrithēsan autois hoi goneis autou kai eipon Oidamen hoti houtos estin ho huios hēmōn kai hoti typhlos egennēthē',
   'The parents confirm two facts: (1) he is their son, (2) he was born blind. These they know with certainty (oidamen — we know). But on the question of ''how'' he now sees, they deflect.',
   NULL),
  (21, 'But by what means he now seeth, we know not; or who hath opened his eyes, we know not: he is of age; ask him: he shall speak for himself.',
   'πῶς δὲ νῦν βλέπει οὐκ οἴδαμεν ἢ τίς ἤνοιξεν αὐτοῦ τοὺς ὀφθαλμοὺς ἡμεῖς οὐκ οἴδαμεν αὐτὸν ἐρωτήσατε ἡλικίαν ἔχει αὐτὸς περὶ αὐτοῦ λαλήσει',
   'pōs de nyn blepei ouk oidamen ē tis ēnoixen autou tous ophthalmous hēmeis ouk oidamen auton erōtēsate hēlikian echei autos peri autou lalēsei',
   '''We know not... we know not'' — the parents deliberately distance themselves from the miracle and from Jesus. ''He is of age; ask him'' — a legal deflection: as an adult, he can testify for himself. Their evasion is explained in vv.22-23.',
   NULL),
  (22, 'These words spake his parents, because they feared the Jews: for the Jews had agreed already, that if any man did confess that he was Christ, he should be put out of the synagogue.',
   'ταῦτα εἶπον οἱ γονεῖς αὐτοῦ ὅτι ἐφοβοῦντο τοὺς Ἰουδαίους ἤδη γὰρ συνετέθειντο οἱ Ἰουδαῖοι ἵνα ἐάν τις αὐτὸν ὁμολογήσῃ Χριστόν ἀποσυνάγωγος γένηται',
   'tauta eipon hoi goneis autou hoti ephobounto tous Ioudaious ēdē gar synetethento hoi Ioudaioi hina ean tis auton homologēsē Christon aposynagōgos genētai',
   '''They feared the Jews'' (ephobounto tous Ioudaious — they were afraid of the Jewish authorities). ''Put out of the synagogue'' (aposynagōgos genētai — become expelled from the synagogue). Excommunication meant social, economic, and religious death in Jewish society — loss of worship, community, business relationships, and social standing. The threat was real and effective: fear silenced the parents'' testimony. The cost of confessing Christ was (and still is) high.',
   NULL),
  (23, 'Therefore said his parents, He is of age; ask him.',
   'διὰ τοῦτο οἱ γονεῖς αὐτοῦ εἶπον ὅτι Ἡλικίαν ἔχει αὐτὸν ἐρωτήσατε',
   'dia touto hoi goneis autou eipon hoti Hēlikian echei auton erōtēsate',
   'The parents'' fear-driven deflection contrasts sharply with their son''s growing boldness. The son has nothing to lose (he was a beggar); the parents have much to lose (their synagogue membership). Fear of man and faith in Christ are inversely proportional.',
   NULL),
  (24, 'Then again called they the man that was blind, and said unto him, Give God the praise: we know that this man is a sinner.',
   'ἐφώνησαν οὖν ἐκ δευτέρου τὸν ἄνθρωπον ὃς ἦν τυφλὸς καὶ εἶπον αὐτῷ Δὸς δόξαν τῷ θεῷ ἡμεῖς οἴδαμεν ὅτι ὁ ἄνθρωπος οὗτος ἁμαρτωλός ἐστιν',
   'ephōnēsan oun ek deuterou ton anthrōpon hos ēn typhlos kai eipon autō Dos doxan tō theō hēmeis oidamen hoti ho anthrōpos houtos hamartōlos estin',
   '''Give God the praise'' (dos doxan tō theō — give glory to God). This is not an invitation to worship but a legal formula demanding truthful testimony under oath (cf. Joshua 7:19 where Joshua says to Achan: ''Give glory to God and tell the truth''). ''We know that this man is a sinner'' — they have reached their verdict before hearing testimony. Their ''knowledge'' is predetermined and evidence-proof.',
   NULL),
  (25, 'He answered and said, Whether he be a sinner or no, I know not: one thing I know, that, whereas I was blind, now I see.',
   'ἀπεκρίθη οὖν ἐκεῖνος καὶ εἶπεν Εἰ ἁμαρτωλός ἐστιν οὐκ οἶδα ἓν οἶδα ὅτι τυφλὸς ὢν ἄρτι βλέπω',
   'apekrithē oun ekeinos kai eipen Ei hamartōlos estin ouk oida hen oida hoti typhlos ōn arti blepō',
   '''One thing I know'' (hen oida — one thing I know). ''Whereas I was blind, now I see'' (typhlos ōn arti blepō — being blind, now I see). One of the most powerful personal testimonies in Scripture. The man does not argue theology — he states experience. He cannot be cross-examined out of his own transformation. This is the unanswerable argument for Christ: changed lives. The religious experts have theology; the healed man has transformation.',
   NULL),
  (26, 'Then said they to him again, What did he to thee? how opened he thine eyes?',
   'εἶπον δὲ αὐτῷ πάλιν Τί ἐποίησέν σοι πῶς ἤνοιξέν σου τοὺς ὀφθαλμούς',
   'eipon de autō palin Ti epoiēsen soi pōs ēnoixen sou tous ophthalmous',
   'They ask again — hoping to find an inconsistency in his testimony. The repetition reveals their frustration: the evidence keeps pointing to the same conclusion they refuse to accept.',
   NULL),
  (27, 'He answered them, I have told you already, and ye did not hear: wherefore would ye hear it again? will ye also be his disciples?',
   'ἀπεκρίθη αὐτοῖς Εἶπον ὑμῖν ἤδη καὶ οὐκ ἠκούσατε τί πάλιν θέλετε ἀκούειν μὴ καὶ ὑμεῖς θέλετε αὐτοῦ μαθηταὶ γενέσθαι',
   'apekrithē autois Eipon hymin ēdē kai ouk ēkousate ti palin thelete akouein mē kai hymeis thelete autou mathētai genesthai',
   '''I have told you already, and ye did not hear'' — the man shows growing boldness and even sarcasm. ''Will ye also be his disciples?'' (mē kai hymeis thelete autou mathētai genesthai — surely you don''t want to become his disciples too?). The question with mē expects a negative answer, but the ''also'' (kai) implies the man considers himself a disciple. Under pressure, his faith has solidified into identification with Jesus.',
   NULL),
  (28, 'Then they reviled him, and said, Thou art his disciple; but we are Moses'' disciples.',
   'ἐλοιδόρησαν αὐτὸν καὶ εἶπον Σὺ εἶ μαθητὴς ἐκείνου ἡμεῖς δὲ τοῦ Μωϋσέως ἐσμὲν μαθηταί',
   'eloidorēsan auton kai eipon Sy ei mathētēs ekeinou hēmeis de tou Mōyseōs esmen mathētai',
   '''They reviled him'' (eloidorēsan — they insulted, abused, mocked him). ''Thou art his disciple; but we are Moses'' disciples'' — they draw the line: you follow Jesus; we follow Moses. The irony: Jesus and Moses are not in opposition (5:46: ''Had ye believed Moses, ye would have believed me: for he wrote of me''). To truly follow Moses leads to following Jesus.',
   NULL),
  (29, 'We know that God spake unto Moses: as for this fellow, we know not from whence he is.',
   'ἡμεῖς οἴδαμεν ὅτι Μωϋσεῖ λελάληκεν ὁ θεός τοῦτον δὲ οὐκ οἴδαμεν πόθεν ἐστίν',
   'hēmeis oidamen hoti Mōysei lelalēken ho theos touton de ouk oidamen pothen estin',
   '''We know that God spake unto Moses'' — this is true (Exodus 33:11). ''We know not from whence he is'' (ouk oidamen pothen estin — we don''t know where he comes from). This is the same objection as 7:27, but now deployed as a reason to reject the miracle. Their ''we know/we know not'' is actually inverted: they think they know Moses but have missed his message; they claim not to know Jesus but should — his works testify to his origin.',
   NULL),
  (30, 'The man answered and said unto them, Why herein is a marvellous thing, that ye know not from whence he is, and yet he hath opened mine eyes.',
   'ἀπεκρίθη ὁ ἄνθρωπος καὶ εἶπεν αὐτοῖς Ἐν γὰρ τούτῳ θαυμαστόν ἐστιν ὅτι ὑμεῖς οὐκ οἴδατε πόθεν ἐστίν καὶ ἀνέῳξέν μου τοὺς ὀφθαλμούς',
   'apekrithē ho anthrōpos kai eipen autois En gar toutō thaumaston estin hoti hymeis ouk oidate pothen estin kai aneōxen mou tous ophthalmous',
   '''Herein is a marvellous thing'' (en toutō thaumaston estin — in this is an astonishing thing). The formerly blind beggar turns theologian: the truly marvellous thing is not the miracle but the Pharisees'' ignorance. You, the religious experts, cannot determine the origin of a man who performs unprecedented miracles? The man''s logic is devastating — and he is just getting started (vv.31-33).',
   NULL),
  (31, 'Now we know that God heareth not sinners: but if any man be a worshipper of God, and doeth his will, him he heareth.',
   'οἴδαμεν δὲ ὅτι ἁμαρτωλῶν ὁ θεὸς οὐκ ἀκούει ἀλλ᾽ ἐάν τις θεοσεβὴς ᾖ καὶ τὸ θέλημα αὐτοῦ ποιῇ τούτου ἀκούει',
   'oidamen de hoti hamartōlōn ho theos ouk akouei all ean tis theosebēs ē kai to thelēma autou poiē toutou akouei',
   '''God heareth not sinners'' (hamartōlōn ho theos ouk akouei — God does not listen to sinners). This is a general OT principle (Psalm 66:18; Proverbs 15:29; Isaiah 1:15) — God does not honour the prayers of the unrepentant. ''If any man be a worshipper of God and doeth his will, him he heareth'' — God responds to the devout who obey. The logic: if Jesus were a sinner, God would not have answered his prayer and performed this miracle. Since God clearly acted through Jesus, Jesus cannot be a sinner.',
   NULL),
  (32, 'Since the world began was it not heard that any man opened the eyes of one that was born blind.',
   'ἐκ τοῦ αἰῶνος οὐκ ἠκούσθη ὅτι ἤνοιξέν τις ὀφθαλμοὺς τυφλοῦ γεγεννημένου',
   'ek tou aiōnos ouk ēkousthē hoti ēnoixen tis ophthalmous typhlou gegennēmenou',
   '''Since the world began'' (ek tou aiōnos — from the beginning of time). ''Was it not heard that any man opened the eyes of one that was born blind'' — this is a factual statement. In the entire OT, there is no record of a congenitally blind person being healed. Elijah raised the dead, Elisha healed leprosy — but no prophet ever gave sight to the born blind. This miracle has no precedent. The man''s argument is that this unprecedented miracle demands an unprecedented explanation: Jesus must be from God.',
   NULL),
  (33, 'If this man were not of God, he could do nothing.',
   'εἰ μὴ ἦν οὗτος παρὰ θεοῦ οὐκ ἠδύνατο ποιεῖν οὐδέν',
   'ei mē ēn houtos para theou ouk ēdynato poiein ouden',
   '''If this man were not of God, he could do nothing'' (ei mē ēn houtos para theou — if this one were not from God). The man''s third identification of Jesus: from God (para theou — from God''s side). His theology has progressed: a man (v.11) → a prophet (v.17) → from God (v.33). His logic is simple and irrefutable: unprecedented miracle → divine origin. The Pharisees cannot answer this argument — so they attack the man instead (v.34).',
   NULL),
  (34, 'They answered and said unto him, Thou wast altogether born in sins, and dost thou teach us? And they cast him out.',
   'ἀπεκρίθησαν καὶ εἶπον αὐτῷ Ἐν ἁμαρτίαις σὺ ἐγεννήθης ὅλος καὶ σὺ διδάσκεις ἡμᾶς καὶ ἐξέβαλον αὐτὸν ἔξω',
   'apekrithēsan kai eipon autō En hamartiais sy egennēthēs holos kai sy didaskeis hēmas kai exebalon auton exō',
   '''Thou wast altogether born in sins'' (en hamartiais sy egennēthēs holos — in sins you were born entirely). They revert to the sin-suffering theology Jesus rejected in v.3. ''And dost thou teach us?'' — outrage that an uneducated blind beggar dares to lecture the religious elite. ''They cast him out'' (exebalon auton exō — they threw him out; expelled him from the synagogue, as threatened in v.22). The man who gained physical sight now loses social standing. But what he gains next (vv.35-38) infinitely exceeds what he lost.',
   NULL),
  (35, 'Jesus heard that they had cast him out; and when he had found him, he said unto him, Dost thou believe on the Son of God?',
   'ἤκουσεν ὁ Ἰησοῦς ὅτι ἐξέβαλον αὐτὸν ἔξω καὶ εὑρὼν αὐτὸν εἶπεν αὐτῷ Σὺ πιστεύεις εἰς τὸν υἱὸν τοῦ θεοῦ',
   'ēkousen ho Iēsous hoti exebalon auton exō kai heurōn auton eipen autō Sy pisteueis eis ton huion tou theou',
   '''Jesus heard... and when he had found him'' (heurōn auton — having found him). Jesus seeks out the expelled man — the Good Shepherd goes after the rejected sheep. Those cast out by religious institutions are sought by Jesus (cf. 6:37: ''him that cometh to me I will in no wise cast out''). ''Dost thou believe on the Son of God?'' (some manuscripts read ''Son of man'' — either title is christological). This is the first time Jesus directly engages the healed man since the healing.',
   NULL),
  (36, 'He answered and said, Who is he, Lord, that I might believe on him?',
   'ἀπεκρίθη ἐκεῖνος καὶ εἶπεν Καὶ τίς ἐστιν κύριε ἵνα πιστεύσω εἰς αὐτόν',
   'apekrithē ekeinos kai eipen Kai tis estin kyrie hina pisteusō eis auton',
   '''Who is he, Lord, that I might believe on him?'' (tis estin kyrie — who is he, Sir/Lord?). The man does not yet know the identity of the Son of God — but he wants to believe. His heart is ready; he just needs to know who. ''That I might believe'' (hina pisteusō — in order that I may believe) — his desire for faith is genuine and eager. He was healed before he believed; now belief will complete what healing began.',
   NULL),
  (37, 'And Jesus said unto him, Thou hast both seen him, and it is he that talketh with thee.',
   'εἶπεν δὲ αὐτῷ ὁ Ἰησοῦς Καὶ ἑώρακας αὐτὸν καὶ ὁ λαλῶν μετὰ σοῦ ἐκεῖνός ἐστιν',
   'eipen de autō ho Iēsous Kai heōrakas auton kai ho lalōn meta sou ekeinos estin',
   '''Thou hast both seen him'' (heōrakas auton — you have seen him). This is deeply poignant: the man who was born blind and has never seen before is now seeing the Son of God. His first meaningful sight is of Christ. ''It is he that talketh with thee'' (ho lalōn meta sou ekeinos estin — the one speaking with you, that is he). Jesus reveals himself directly, as he did to the Samaritan woman (4:26). Revelation comes through personal encounter.',
   NULL),
  (38, 'And he said, Lord, I believe. And he worshipped him.',
   'ὁ δὲ ἔφη Πιστεύω κύριε καὶ προσεκύνησεν αὐτῷ',
   'ho de ephē Pisteuō kyrie kai prosekynēsen autō',
   '''Lord, I believe'' (pisteuō kyrie — I believe, Lord). ''And he worshipped him'' (prosekynēsen autō — he fell down and worshipped him). Proskyneō is the word for religious worship — bowing down before deity. The man''s journey is complete: from physical blindness to spiritual sight, from ignorance to worship, from ''a man called Jesus'' (v.11) to ''Lord'' (v.38). This is the full arc of faith: healing → testimony → persecution → revelation → worship. Jesus accepts the worship — something only God may rightfully receive.',
   'The man''s progression is a model of genuine conversion: (1) He experiences Jesus'' power (healing, v.7). (2) He testifies to what he knows (v.11, 15, 25). (3) His understanding grows under pressure (v.17, 30-33). (4) He suffers for his testimony (v.34, cast out). (5) Jesus finds him personally (v.35). (6) He believes and worships (v.38). Note that Jesus accepts proskyneō (worship) — an act that angels refuse (Revelation 22:8-9) and righteous men refuse (Acts 10:25-26). Only God may be worshipped; Jesus accepts worship because he is God.'),
  (39, 'And Jesus said, For judgment I am come into this world, that they which see not might see; and that they which see might be made blind.',
   'καὶ εἶπεν ὁ Ἰησοῦς Εἰς κρίμα ἐγὼ εἰς τὸν κόσμον τοῦτον ἦλθον ἵνα οἱ μὴ βλέποντες βλέπωσιν καὶ οἱ βλέποντες τυφλοὶ γένωνται',
   'kai eipen ho Iēsous Eis krima egō eis ton kosmon touton ēlthon hina hoi mē blepontes blepōsin kai hoi blepontes typhloi genōntai',
   '''For judgment I am come'' (eis krima ēlthon — for judgment I came). This does not contradict 3:17 (''God sent not his Son to condemn'') — Jesus'' purpose is salvation, but the effect of his coming is judgment by division. ''They which see not might see'' — the blind man represents the spiritually blind who receive sight through Christ. ''They which see might be made blind'' — the Pharisees represent the self-assured religious who, by rejecting Christ, are confirmed in their blindness. The light reveals and judges simultaneously.',
   'This verse states the paradoxical effect of the incarnation: the coming of the Light simultaneously gives sight to the blind and blinds the seeing. This is not arbitrary but moral: those who know they are blind (the humble, the honest, the seeking) receive sight; those who claim to see (the proud, the self-righteous, the religious) are confirmed in blindness. The issue is not intelligence or education but honesty about one''s condition. The prerequisite for spiritual sight is acknowledgment of spiritual blindness.'),
  (40, 'And some of the Pharisees which were with him heard these words, and said unto him, Are we blind also?',
   'καὶ ἤκουσαν ἐκ τῶν Φαρισαίων ταῦτα οἱ μετ᾽ αὐτοῦ ὄντες καὶ εἶπον αὐτῷ Μὴ καὶ ἡμεῖς τυφλοί ἐσμεν',
   'kai ēkousan ek tōn Pharisaiōn tauta hoi met autou ontes kai eipon autō Mē kai hēmeis typhloi esmen',
   '''Are we blind also?'' (mē kai hēmeis typhloi esmen — surely we are not blind too?). The question expects a negative answer: of course we are not blind — we are the teachers of Israel, the experts in the law. But Jesus'' answer (v.41) turns their assumed negative into a devastating affirmative.',
   NULL),
  (41, 'Jesus said unto them, If ye were blind, ye should have no sin: but now ye say, We see; therefore your sin remaineth.',
   'εἶπεν αὐτοῖς ὁ Ἰησοῦς Εἰ τυφλοὶ ἦτε οὐκ ἂν εἴχετε ἁμαρτίαν νῦν δὲ λέγετε ὅτι Βλέπομεν ἡ οὖν ἁμαρτία ὑμῶν μένει',
   'eipen autois ho Iēsous Ei typhloi ēte ouk an eichete hamartian nyn de legete hoti Blepomen hē oun hamartia hymōn menei',
   '''If ye were blind, ye should have no sin'' — if they genuinely did not know, ignorance would mitigate guilt. ''But now ye say, We see'' — their claim to knowledge removes the excuse of ignorance. ''Therefore your sin remaineth'' (hē hamartia hymōn menei — your sin abides, stays, endures). The worst blindness is the blindness that claims to see. Those who admit blindness can be healed; those who insist they see remain blind. The Pharisees'' sin is not ignorance but wilful refusal to acknowledge what they can see. This is the unforgivable posture: not inability but unwillingness.',
   'This closing statement is one of the most penetrating diagnoses of spiritual blindness in Scripture. Three categories emerge: (1) Those who know they are blind and seek sight — the healed man: they receive grace. (2) Those who are genuinely ignorant — they have diminished responsibility. (3) Those who claim to see but refuse the light — the Pharisees: their sin remains because they reject the cure while claiming they have no disease. The medical analogy is exact: the patient who denies being sick cannot be treated. Acknowledging spiritual blindness is the first step toward spiritual sight.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'John' AND c.chapter_number = 9;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, usage_notes, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.usage_notes, ws.word_order
FROM (VALUES
  ('τυφλός', 'typhlos', 'G5185',
   'Blind, sightless, unable to see; metaphorically: spiritually imperceptive.',
   'Typhlos occurs 17 times in John 9, more than any other NT chapter. It operates on two levels: physical blindness (the man, vv.1-7) and spiritual blindness (the Pharisees, vv.39-41). The irony is that the physically blind man gains both physical and spiritual sight, while the spiritually ''seeing'' Pharisees become progressively blinder. Jesus came ''that they which see not might see; and that they which see might be made blind'' (v.39). The chapter is a dramatisation of Isaiah 42:7: ''To open the blind eyes.''',
   1),
  ('πηλός', 'pēlos', 'G4081',
   'Clay, mud, earth mixed with liquid; potter''s clay.',
   'In v.6, Jesus makes clay (pēlon) from saliva and earth and anoints the man''s eyes. The use of pēlos evokes Genesis 2:7 — God formed Adam from the dust (''adamah''). Jesus, the Creator (John 1:3), uses the same creative medium to form new eyes. The clay also deliberately triggers the Sabbath controversy: making clay was classified as ''kneading'' (Shabbat 7:2), one of the 39 prohibited Sabbath labours. Jesus transforms this prohibited act into a creative act of God — the Lord of the Sabbath creates on the Sabbath.',
   2),
  ('Σιλωάμ', 'Silōam', 'G4611',
   'Siloam, meaning ''Sent'' — the pool in Jerusalem fed by Hezekiah''s tunnel from the Gihon spring.',
   'John translates the name: ''which is by interpretation, Sent'' (ho hermēneuetai Apestalmenos, v.7). The theological significance: the man washes in the pool of ''Sent'' and receives sight from the One who was ''Sent'' by the Father. Jesus is the ''Sent One'' (apostello/pempō appear over 40 times in John describing Jesus'' mission). The Pool of Siloam was archaeologically confirmed in 2004 — a large stepped pool at the southern end of the City of David, used for ritual purification, especially during the Feast of Tabernacles water ceremony.',
   3),
  ('ἀποσυνάγωγος', 'aposynagōgos', 'G656',
   'Expelled from the synagogue, excommunicated, banned from the assembly.',
   'This word appears only in John (9:22; 12:42; 16:2) — a uniquely Johannine term. In v.22, the Jews had agreed that anyone confessing Jesus as Christ would be aposynagōgos. Synagogue expulsion meant loss of religious worship, social standing, and economic relationships. In v.34, the healed man is cast out for his testimony. In 12:42, many rulers believed but would not confess ''lest they should be put out of the synagogue.'' In 16:2, Jesus warns his disciples: ''They shall put you out of the synagogues.'' The cost of following Christ has always included social exclusion.',
   4),
  ('προσκυνέω', 'proskyneō', 'G4352',
   'To worship, bow down before, do obeisance to; to express reverent adoration.',
   'In v.38, the healed man ''worshipped him'' (prosekynēsen autō). Proskyneō is the highest form of honour — religious worship reserved for God. In Matthew 4:10, Jesus says ''Thou shalt worship (proskyneō) the Lord thy God, and him only shalt thou serve.'' Yet Jesus accepts the man''s worship without correction. Angels refuse worship (Revelation 22:8-9); Peter refuses it (Acts 10:25-26). Only God receives proskyneō. Jesus'' acceptance of worship is an implicit claim to deity — confirmed by his ''I AM'' statements.',
   5),
  ('κρίμα', 'krima', 'G2917',
   'Judgment, verdict, decision; the result of judging, a judicial sentence.',
   'In v.39, ''For judgment I am come into this world'' (eis krima ēlthon). Krima differs from krisis (the act of judging, 5:22) in emphasising the result or sentence. Jesus'' coming produces a krima — a separation, a verdict on humanity. The blind receive sight (salvation); the ''seeing'' are confirmed in blindness (condemnation). This paradox runs through John: the same light that illuminates also exposes (3:19-21). The coming of Christ forces a verdict — neutrality is impossible.',
   6),
  ('φανερόω', 'phaneroō', 'G5319',
   'To make visible, to reveal, to manifest, to bring to light what was hidden.',
   'In v.3, the man''s blindness exists ''that the works of God should be made manifest'' (hina phanerōthē ta erga tou theou). Phaneroō is John''s characteristic word for revelation — making the invisible visible. Jesus'' signs phaneroō the Father''s glory (2:11; 17:6). The miracle of sight is itself a phanerōsis — a manifestation of God''s creative power and compassionate purpose. Suffering, in God''s hands, becomes a platform for divine self-revelation.',
   7),
  ('ἁμαρτωλός', 'hamartōlos', 'G268',
   'Sinner, one who misses the mark; one who transgresses God''s law.',
   'Hamartōlos is the Pharisees'' label for Jesus: ''we know that this man is a sinner'' (v.24). The healed man responds: ''Whether he be a sinner or no, I know not'' (v.25) — agnostic on theology but certain about experience. The irony: the Pharisees call the sinless Son of God a ''sinner'' while being blind to their own sin. In v.31, the man uses their own theology against them: ''God heareth not sinners'' — if Jesus were truly a sinner, God would not have performed this miracle through him. The charge of ''sinner'' collapses under the weight of the evidence.',
   8)
) AS ws(original_word, transliteration, strongs_number, meaning, usage_notes, word_order)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 9
  AND v2.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 6
    WHEN 3 THEN 7
    WHEN 4 THEN 22
    WHEN 5 THEN 38
    WHEN 6 THEN 39
    WHEN 7 THEN 3
    WHEN 8 THEN 24
  END
) v;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, context, ref_order)
SELECT v.id, cr.referenced_verse, cr.note, ROW_NUMBER() OVER ()::int
FROM (VALUES
  -- v.2: Who sinned?
  (2, 'Luke 13:1-5', 'thematic', 'Jesus rejects the assumption that suffering proves greater sinfulness'),
  (2, 'Job 4:7-8', 'contrast', 'Eliphaz''s false theology: suffering implies sin — refuted by Job and by Jesus'),
  -- v.3: Works of God made manifest
  (3, 'Romans 8:28', 'thematic', '''All things work together for good'' — God uses suffering for his purposes'),
  (3, '2 Corinthians 12:9', 'thematic', '''My strength is made perfect in weakness'' — God''s power displayed in human limitation'),
  -- v.5: I am the light of the world
  (5, 'John 8:12', 'parallel', '''I am the light of the world'' — the declaration made at Tabernacles, now demonstrated'),
  (5, 'John 1:4-5, 9', 'thematic', '''The true Light, which lighteth every man'' — the Light gives sight to the blind'),
  -- v.6: Made clay
  (6, 'Genesis 2:7', 'allusion', 'God formed man from the dust — the Creator uses clay again to create new sight'),
  -- v.7: Pool of Siloam
  (7, 'Isaiah 8:6', 'allusion', '''The waters of Shiloah that go softly'' — the gentle stream that fed the Pool of Siloam'),
  (7, '2 Kings 5:10-14', 'parallel', 'Naaman washed in the Jordan and was healed — obedience to an apparently pointless command'),
  -- v.14: Sabbath healing
  (14, 'John 5:9-16', 'parallel', 'The Bethesda healing on the Sabbath — the same controversy pattern'),
  (14, 'John 7:21-24', 'parallel', 'Jesus defends Sabbath healing with the circumcision argument'),
  -- v.16: Division
  (16, 'John 7:43', 'parallel', '''There was a division among the people because of him'''),
  (16, 'John 10:19-21', 'parallel', '''There was a division therefore again among the Jews'''),
  -- v.22: Put out of the synagogue
  (22, 'John 12:42', 'parallel', '''Many... did not confess him, lest they should be put out of the synagogue'''),
  (22, 'John 16:2', 'parallel', '''They shall put you out of the synagogues'' — Jesus warns his disciples'),
  -- v.25: Whereas I was blind, now I see
  (25, '2 Corinthians 4:6', 'thematic', '''God, who commanded the light to shine out of darkness, hath shined in our hearts'''),
  (25, 'Ephesians 5:8', 'thematic', '''Ye were sometimes darkness, but now are ye light in the Lord'''),
  -- v.31: God heareth not sinners
  (31, 'Psalm 66:18', 'allusion', '''If I regard iniquity in my heart, the Lord will not hear me'''),
  (31, 'Proverbs 15:29', 'allusion', '''The LORD is far from the wicked: but he heareth the prayer of the righteous'''),
  -- v.32: No precedent
  (32, 'Isaiah 35:5', 'prophecy', '''Then the eyes of the blind shall be opened'' — the messianic sign Jesus fulfils'),
  (32, 'Isaiah 42:7', 'prophecy', '''To open the blind eyes'' — part of the Servant''s mission'),
  -- v.35: Jesus finds the cast-out man
  (35, 'John 6:37', 'thematic', '''Him that cometh to me I will in no wise cast out'' — those cast out by men are received by Jesus'),
  (35, 'Luke 15:4-7', 'thematic', 'The Good Shepherd seeks the lost sheep'),
  -- v.38: Lord, I believe — and worshipped
  (38, 'John 20:28', 'parallel', '''My Lord and my God'' — Thomas'' confession, paralleling the blind man''s worship'),
  (38, 'Matthew 4:10', 'thematic', '''Thou shalt worship the Lord thy God, and him only'' — Jesus accepts worship due to God'),
  -- v.39: For judgment I am come
  (39, 'John 3:17-19', 'thematic', '''God sent not his Son to condemn... but this is the condemnation, that light is come'''),
  (39, 'Luke 2:34', 'prophecy', 'Simeon''s prophecy: ''This child is set for the fall and rising again of many in Israel'''),
  -- v.41: Your sin remaineth
  (41, 'John 15:22', 'parallel', '''If I had not come and spoken unto them, they had not had sin: but now they have no cloke for their sin'''),
  (41, 'James 4:17', 'thematic', '''To him that knoweth to do good, and doeth it not, to him it is sin''')
) AS cr(verse_number, referenced_verse, relationship_type, note)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 9 AND v2.verse_number = cr.verse_number
) v;

-- JOHN CHAPTER 9 — BACKFILL (additional word_studies + cross_references)

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'ἐκ γενετῆς', 'ek genetēs', 'G1537/G1079', 'From birth — congenital blindness; only NT use; rules out subsequent injury or illness; emphasizes pure innate condition.', 100),
  (2, 'τίς ἥμαρτεν οὗτος ἢ οἱ γονεῖς αὐτοῦ', 'tis hēmarten houtos ē hoi goneis autou', 'G264/G1118', 'Who sinned, this man or his parents? — popular retributive theology; conditions assumed direct moral causation.', 101),
  (3, 'τὰ ἔργα τοῦ θεοῦ', 'ta erga tou theou', 'G2041/G2316', 'The works of God — purpose-clause: erga of God to be manifested; suffering can have revelatory function.', 102),
  (4, 'ἕως ἡμέρα ἐστίν', 'heōs hēmera estin', 'G2193/G2250', 'While it is day — limited window of opportunity; nyx (night) coming when no one can work; eschatological urgency.', 103),
  (5, 'φῶς εἰμι τοῦ κόσμου', 'phōs eimi tou kosmou', 'G5457/G2889', 'I am the light of the world — repeats 8:12; about to give physical sight as sign of spiritual illumination.', 104),
  (6, 'ἔπτυσεν χαμαὶ', 'eptysen chamai', 'G4429/G5476', 'Spat on the ground — saliva believed to have therapeutic properties in antiquity; deliberate bodily contact.', 105),
  (6, 'ἐπέχρισεν αὐτοῦ τὸν πηλὸν ἐπὶ τοὺς ὀφθαλμοὺς', 'epechrisen autou ton pēlon epi tous ophthalmous', 'G2025/G3788', 'Anointed his eyes with the clay — chriō root: anointing language; messianic act on the eyes.', 106),
  (7, 'ὃ ἑρμηνεύεται Ἀπεσταλμένος', 'ho hermēneuetai Apestalmenos', 'G2059/G649', 'Which means "Sent" — Siloam from Hebrew shalach (to send); pool fed by sent water = Jesus the Sent One.', 107),
  (7, 'ἐνίψατο καὶ ἦλθεν βλέπων', 'enipsato kai ēlthen blepōn', 'G3538/G2064/G991', 'Washed and came seeing — obedience-precedes-sight; faith expressed in action brings revelation.', 108),
  (8, 'γείτονες', 'geitones', 'G1069', 'Neighbors — unique to this passage in NT; community recognition required to authenticate identity.', 109),
  (8, 'προσαίτης', 'prosaitēs', 'G4319', 'Beggar — only here and Mark 10:46; lifestyle of public dependence; well-known figure.', 110),
  (11, 'ἐκείνῳ τῷ ἀνθρώπῳ τῷ λεγομένῳ Ἰησοῦ', 'ekeinō tō anthrōpō tō legomenō Iēsou', 'G444/G3004', 'That man called Jesus — initial identification; minimal Christology grows through the chapter.', 111),
  (14, 'σάββατον', 'sabbaton', 'G4521', 'Sabbath — kneading clay was rabbinically forbidden Sabbath labor (Mishnah Shabbat 7:2); deliberate boundary-violation.', 112),
  (16, 'σχίσμα ἦν ἐν αὐτοῖς', 'schisma ēn en autois', 'G4978', 'Division was among them — Jesus polarizes; recurring Johannine schisma (cf. 7:43; 10:19).', 113),
  (17, 'προφήτης ἐστίν', 'prophētēs estin', 'G4396', '"He is a prophet" — formerly-blind man''s growing confession (cf. v.11 "the man Jesus" → v.17 "prophet" → v.33 "from God" → v.38 "Lord").', 114),
  (22, 'συνετέθειντο οἱ Ἰουδαῖοι', 'synetetheinto hoi Ioudaioi', 'G4934', 'The Jews had agreed — official Sanhedrin policy; messianic confession = excommunication (likely anachronistic for Birkat-ha-minim era).', 115),
  (24, 'δὸς δόξαν τῷ θεῷ', 'dos doxan tō theō', 'G1325/G1391/G2316', '"Give glory to God" — judicial formula urging confession (Josh 7:19); demanding admission of perjury.', 116),
  (25, 'τυφλὸς ὢν ἄρτι βλέπω', 'typhlos ōn arti blepō', 'G5185/G991', '"Being blind, now I see" — testimony of personal experience trumps theological argument; rhetorical bedrock.', 117),
  (27, 'μὴ καὶ ὑμεῖς θέλετε αὐτοῦ μαθηταὶ γενέσθαι', 'mē kai hymeis thelete autou mathētai genesthai', 'G3101/G1096', '"Do you also want to become his disciples?" — sarcastic; the question posed to the man''s opponents now turned on them.', 118),
  (28, 'ἡμεῖς δὲ τοῦ Μωϋσέως ἐσμὲν μαθηταί', 'hēmeis de tou Mōuseōs esmen mathētai', 'G1473/G3475/G3101', 'We are disciples of Moses — false dichotomy; Jesus had said Moses wrote of him (5:46-47).', 119),
  (32, 'ἐκ τοῦ αἰῶνος οὐκ ἠκούσθη', 'ek tou aiōnos ouk ēkousthē', 'G165/G191', 'Since the age began it has not been heard — congenital blindness healing was unprecedented; strongest argument of the chapter.', 120),
  (33, 'εἰ μὴ ἦν οὗτος παρὰ θεοῦ', 'ei mē ēn houtos para theou', 'G3844/G2316', 'If this man were not from God — para tou theou: from God''s side; logical force unmistakable.', 121),
  (34, 'ἐν ἁμαρτίαις σὺ ἐγεννήθης ὅλος', 'en hamartiais sy egennēthēs holos', 'G266/G1080/G3650', '"You were entirely born in sins" — they affirm what Jesus rejected in v.3; condemnation by religious certainty.', 122),
  (34, 'ἐξέβαλον αὐτὸν ἔξω', 'exebalon auton exō', 'G1544', 'They cast him out — formal excommunication; the predicted consequence of confessing Christ.', 123),
  (35, 'σὺ πιστεύεις εἰς τὸν υἱὸν τοῦ ἀνθρώπου', 'sy pisteueis eis ton huion tou anthrōpou', 'G4100/G5207/G444', '"Do you believe in the Son of Man?" — Daniel 7 figure; Jesus seeks the cast-out man to grant fuller revelation.', 124),
  (36, 'τίς ἐστιν κύριε ἵνα πιστεύσω εἰς αὐτόν', 'tis estin kyrie hina pisteusō eis auton', 'G2962/G4100', '"Who is he, sir, that I may believe?" — open seeker; ready faith awaiting object.', 125),
  (37, 'ἑώρακας αὐτὸν καὶ ὁ λαλῶν μετὰ σοῦ ἐκεῖνός ἐστιν', 'heōrakas auton kai ho lalōn meta sou ekeinos estin', 'G3708/G2980', 'You have seen him and the one speaking with you — striking: the once-blind man is now privileged with personal disclosure.', 126),
  (38, 'πιστεύω κύριε', 'pisteuō kyrie', 'G4100/G2962', '"I believe, Lord" — climactic confession; kyrios as confessional title; full faith and worship follow.', 127),
  (39, 'εἰς κρίμα ἐγὼ εἰς τὸν κόσμον τοῦτον ἦλθον', 'eis krima egō eis ton kosmon touton ēlthon', 'G2917/G2889/G2064', 'For judgment I came into this world — krima as discerning effect: the same light reveals seeing or blinding.', 128),
  (40, 'μὴ καὶ ἡμεῖς τυφλοί ἐσμεν', 'mē kai hēmeis typhloi esmen', 'G3361/G5185', '"Are we blind too?" — defensive question; expects negative answer; reveals tragic self-confidence.', 129),
  (41, 'εἰ τυφλοὶ ἦτε οὐκ ἂν εἴχετε ἁμαρτίαν', 'ei typhloi ēte ouk an eichete hamartian', 'G5185/G2192/G266', 'If you were blind you would have no sin — culpability proportional to claimed light; the willfully-blind cannot be excused.', 130)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'John' AND c.chapter_number = 9 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Acts 3:2', 100),
  (1, 'Acts 14:8', 101),
  (2, 'Exodus 20:5', 100),
  (2, 'Job 4:7-8', 101),
  (2, 'Luke 13:1-5', 102),
  (3, 'John 11:4', 100),
  (3, 'Romans 8:28', 101),
  (3, '2 Corinthians 12:9', 102),
  (4, 'John 12:35', 100),
  (4, 'Ephesians 5:16', 101),
  (4, 'Galatians 6:10', 102),
  (5, 'John 1:9', 100),
  (5, 'John 8:12', 101),
  (5, 'John 12:46', 102),
  (6, 'Mark 7:33', 100),
  (6, 'Mark 8:23', 101),
  (7, 'Isaiah 8:6', 100),
  (7, 'Nehemiah 3:15', 101),
  (7, '2 Kings 5:10-14', 102),
  (16, 'John 7:43', 100),
  (16, 'John 10:19', 101),
  (17, 'John 4:19', 100),
  (17, 'Luke 7:16', 101),
  (22, 'John 7:13', 100),
  (22, 'John 12:42', 101),
  (22, 'John 16:2', 102),
  (22, 'Luke 6:22', 103),
  (24, 'Joshua 7:19', 100),
  (24, '1 Samuel 6:5', 101),
  (25, 'Psalm 119:18', 100),
  (25, '1 John 1:5-7', 101),
  (28, 'John 5:45-47', 100),
  (28, 'Acts 6:11-14', 101),
  (29, 'John 1:17', 100),
  (29, 'Exodus 33:11', 101),
  (31, 'Psalm 66:18', 100),
  (31, 'Proverbs 28:9', 101),
  (31, '1 Peter 3:12', 102),
  (32, 'Isaiah 35:5', 100),
  (32, 'Isaiah 42:7', 101),
  (33, 'John 3:2', 100),
  (33, 'Acts 10:38', 101),
  (34, 'Job 8:6-9', 100),
  (34, 'Proverbs 26:12', 101),
  (35, 'Daniel 7:13-14', 100),
  (35, 'John 5:27', 101),
  (38, 'Matthew 14:33', 100),
  (38, 'Matthew 28:9', 101),
  (38, 'Romans 10:9', 102),
  (39, 'John 3:17-19', 100),
  (39, 'John 5:22', 101),
  (39, 'Luke 4:18', 102),
  (39, 'Matthew 13:13-15', 103),
  (39, '2 Corinthians 4:3-6', 104),
  (40, 'Matthew 23:16-17', 100),
  (40, 'Romans 2:19', 101),
  (41, 'John 15:22-24', 100),
  (41, '1 John 1:8-10', 101),
  (41, 'Romans 1:20', 102)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'John' AND c.chapter_number = 9 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
