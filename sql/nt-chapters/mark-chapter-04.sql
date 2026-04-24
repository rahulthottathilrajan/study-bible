-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 4 — Parables of the Kingdom and Stilling the Storm
-- 41 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Mark 4 is the great parable chapter. Jesus teaches the multitudes from a boat on the Sea of Galilee, beginning with the parable of the sower (vv.1-9) — the seed falls on four types of soil (wayside, rocky, thorny, good ground), and only the good soil produces a harvest. Privately, Jesus explains to his disciples why he speaks in parables: ''Unto you it is given to know the mystery of the kingdom of God: but unto them that are without, all these things are done in parables'' (v.11). He then interprets the sower parable in detail (vv.13-20). Three more parables follow: the lamp under a bushel (vv.21-25), teaching that truth is meant to be revealed, not hidden; the seed growing secretly (vv.26-29), showing the kingdom''s mysterious, unstoppable growth; and the mustard seed (vv.30-32), illustrating how the smallest beginning produces the greatest result. Mark notes that Jesus ''spake the word unto them, as they were able to hear it'' and that ''without a parable spake he not unto them'' but ''when they were alone, he expounded all things to his disciples'' (vv.33-34). The chapter climaxes with the stilling of the storm (vv.35-41): when a violent squall threatens to swamp their boat, Jesus rebukes the wind and sea with sovereign authority — ''Peace, be still'' — and the disciples are filled with ''great fear,'' asking: ''What manner of man is this, that even the wind and the sea obey him?'' (v.41). The chapter moves from the mystery of the kingdom (parables) to the authority of the King (nature miracle).',
  'The Mystery of the Kingdom — Parables and the Authority Over Nature',
  'παραβολή (parabolē)',
  'Parable, comparison, illustration — from para (alongside) + ballō (to throw). A parable ''throws'' a familiar image alongside a spiritual truth, creating an analogy that simultaneously reveals and conceals. For those with ears to hear (v.9), parables illuminate the kingdom of God. For those who have rejected Jesus, parables obscure the truth they have already refused (vv.11-12). Jesus'' parables are not merely illustrations but instruments of the kingdom''s advance — the word is the seed (v.14) through which God''s reign takes root in human hearts.',
  '["The Parable of the Sower (vv.1-9): A sower went out to sow. Some fell by the way side and the fowls of the air came and devoured it. Some fell on stony ground where it had not much earth and when the sun was up it was scorched. Some fell among thorns and the thorns choked it. Other fell on good ground and did yield fruit that sprang up and increased and brought forth some thirty and some sixty and some an hundred","The Purpose and Interpretation of Parables (vv.10-20): Unto you it is given to know the mystery of the kingdom of God but unto them that are without all these things are done in parables. The sower soweth the word. These are they by the way side where the word is sown. These are they which are sown on good ground such as hear the word and receive it and bring forth fruit","Three Kingdom Parables: Lamp, Secret Growth, Mustard Seed (vv.21-34): Is a candle brought to be put under a bushel or under a bed. For there is nothing hid which shall not be manifested. So is the kingdom of God as if a man should cast seed into the ground and the seed should spring and grow up he knoweth not how. It is like a grain of mustard seed which when it is sown is less than all the seeds but when it is sown it groweth up and becometh greater than all herbs","Stilling the Storm: Authority Over Nature (vv.35-41): There arose a great storm of wind and the waves beat into the ship. He was in the hinder part of the ship asleep on a pillow. He arose and rebuked the wind and said unto the sea Peace be still. And the wind ceased and there was a great calm. What manner of man is this that even the wind and the sea obey him"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 41 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And he began again to teach by the sea side: and there was gathered unto him a great multitude, so that he entered into a ship, and sat in the sea; and the whole multitude was by the sea on the land.',
   'Καὶ πάλιν ἤρξατο διδάσκειν παρὰ τὴν θάλασσαν καὶ συνήχθη πρὸς αὐτὸν ὄχλος πολύς ὥστε αὐτὸν ἐμβάντα εἰς τὸ πλοῖον καθῆσθαι ἐν τῇ θαλάσσῃ καὶ πᾶς ὁ ὄχλος πρὸς τὴν θάλασσαν ἐπὶ τῆς γῆς ἦν',
   'Kai palin ērxato didaskein para tēn thalassan kai synēchthē pros auton ochlos polys hōste auton embanta eis to ploion kathēsthai en tē thalassē kai pas ho ochlos pros tēn thalassan epi tēs gēs ēn',
   '''By the sea side'' — the Sea of Galilee becomes Jesus'' natural amphitheatre. ''Entered into a ship'' — the boat serves as a floating pulpit (cf. 3:9). ''Sat'' (kathēsthai — seated; the posture of an authoritative teacher). ''The whole multitude was by the sea on the land'' — a vivid panoramic image: the crowd on the sloping shore, the teacher in the boat, the water between them. Mark paints the scene with eyewitness detail.',
   NULL),
  (2, 'And he taught them many things by parables, and said unto them in his doctrine,',
   'καὶ ἐδίδασκεν αὐτοὺς ἐν παραβολαῖς πολλά καὶ ἔλεγεν αὐτοῖς ἐν τῇ διδαχῇ αὐτοῦ',
   'kai edidasken autous en parabolais polla kai elegen autois en tē didachē autou',
   '''Taught'' (edidasken — was teaching; imperfect: extended, ongoing instruction). ''Many things by parables'' (en parabolais polla — much content in parabolic form). ''In his doctrine'' (en tē didachē autou — in his teaching; the word didachē encompasses both content and method). Mark introduces the section with a general statement: Jesus'' primary mode of public teaching is parabolic.',
   NULL),
  (3, 'Hearken; Behold, there went out a sower to sow:',
   'ἀκούετε ἰδοὺ ἐξῆλθεν ὁ σπείρων τοῦ σπεῖραι',
   'akouete idou exēlthen ho speirōn tou speirai',
   '''Hearken'' (akouete — listen! hear!; present imperative: keep listening, give sustained attention). ''Behold'' (idou — look!; an attention-grabbing interjection). ''A sower'' (ho speirōn — the sower; the definite article suggests a well-known figure — every listener could picture a farmer sowing). ''To sow'' — the act of broadcasting seed by hand across a field. Jesus begins with the utterly familiar to teach the utterly profound.',
   NULL),
  (4, 'And it came to pass, as he sowed, some fell by the way side, and the fowls of the air came and devoured it up.',
   'καὶ ἐγένετο ἐν τῷ σπείρειν ὃ μὲν ἔπεσεν παρὰ τὴν ὁδόν καὶ ἦλθεν τὰ πετεινὰ καὶ κατέφαγεν αὐτό',
   'kai egeneto en tō speirein ho men epesen para tēn hodon kai ēlthen ta peteina kai katephagen auto',
   '''By the way side'' (para tēn hodon — along the path; the hard-packed footpath running through or beside the field). ''Fowls'' (peteina — birds). ''Devoured'' (katephagen — ate up completely). The path soil is too hard for the seed to penetrate — it lies exposed on the surface and is immediately consumed by birds. Jesus interprets this as Satan snatching the word before it can take root (v.15).',
   NULL),
  (5, 'And some fell on stony ground, where it had not much earth; and immediately it sprang up, because it had no depth of earth:',
   'ἄλλο δὲ ἔπεσεν ἐπὶ τὸ πετρῶδες ὅπου οὐκ εἶχεν γῆν πολλήν καὶ εὐθέως ἐξανέτειλεν διὰ τὸ μὴ ἔχειν βάθος γῆς',
   'allo de epesen epi to petrōdes hopou ouk eichen gēn pollēn kai eutheōs exaneteilen dia to mē echein bathos gēs',
   '''Stony ground'' (to petrōdes — rocky ground; not stones scattered on soil but a thin layer of earth over a shelf of limestone). ''Immediately it sprang up'' (eutheōs exaneteilen — it sprouted at once). ''No depth of earth'' (mē echein bathos gēs — lacking depth of soil). The rapid sprouting is deceptive: the thin soil warms quickly, producing fast but rootless growth. This represents those who receive the word with immediate enthusiasm but have no depth (v.17).',
   NULL),
  (6, 'But when the sun was up, it was scorched; and because it had no root, it withered away.',
   'ἡλίου δὲ ἀνατείλαντος ἐκαυματίσθη καὶ διὰ τὸ μὴ ἔχειν ῥίζαν ἐξηράνθη',
   'hēliou de anateilantos ekaumatisthē kai dia to mē echein rhizan exēranthē',
   '''Sun was up'' (hēliou anateilantos — the sun having risen). ''Scorched'' (ekaumatisthē — burned, withered by heat). ''No root'' (mē echein rhizan — having no root). ''Withered away'' (exēranthē — dried up; the same word used for the man''s withered hand in 3:1). Without roots, the plant cannot access water and nutrients below the surface. The sun that nourishes deep-rooted plants destroys shallow-rooted ones. Affliction and persecution (v.17) are the scorching sun.',
   NULL),
  (7, 'And some fell among thorns, and the thorns grew up, and choked it, and it yielded no fruit.',
   'καὶ ἄλλο ἔπεσεν εἰς τὰς ἀκάνθας καὶ ἀνέβησαν αἱ ἄκανθαι καὶ συνέπνιξαν αὐτό καὶ καρπὸν οὐκ ἔδωκεν',
   'kai allo epesen eis tas akanthas kai anebēsan hai akanthai kai synepnixan auto kai karpon ouk edōken',
   '''Among thorns'' (eis tas akanthas — into the thorn plants). ''Grew up'' (anebēsan — came up, rose alongside the grain). ''Choked'' (synepnixan — strangled together, suffocated; the thorns competed for light, water, and nutrients and won). ''Yielded no fruit'' (karpon ouk edōken — gave no harvest). The seed germinates, grows, but produces nothing. The thorns represent ''the cares of this world, and the deceitfulness of riches, and the lusts of other things'' (v.19).',
   NULL),
  (8, 'And other fell on good ground, and did yield fruit that sprang up and increased; and brought forth, some thirty, and some sixty, and some an hundred.',
   'καὶ ἄλλο ἔπεσεν εἰς τὴν γῆν τὴν καλήν καὶ ἐδίδου καρπὸν ἀναβαίνοντα καὶ αὐξάνοντα καὶ ἔφερεν ἓν τριάκοντα καὶ ἓν ἑξήκοντα καὶ ἓν ἑκατόν',
   'kai allo epesen eis tēn gēn tēn kalēn kai edidou karpon anabainonta kai auxanonta kai epheren hen triakonta kai hen hexēkonta kai hen hekaton',
   '''Good ground'' (tēn gēn tēn kalēn — the beautiful, excellent soil). ''Yield fruit'' (edidou karpon — was giving fruit; imperfect: continued, ongoing production). ''Sprang up and increased'' — the grain grew tall and multiplied. ''Thirty, sixty, a hundred'' — an extraordinary harvest. Normal yields in Palestine were 7-10 fold; thirty-fold was remarkable, sixty exceptional, a hundred miraculous. The escalating numbers emphasise the superabundant productivity of receptive hearts.',
   NULL),
  (9, 'And he said unto them, He that hath ears to hear, let him hear.',
   'καὶ ἔλεγεν αὐτοῖς ὁ ἔχων ὦτα ἀκούειν ἀκουέτω',
   'kai elegen autois ho echōn ōta akouein akouetō',
   '''He that hath ears to hear'' — a formula Jesus uses to signal that the parable carries deeper meaning (cf. 4:23, 7:16). ''Let him hear'' (akouetō — present imperative: let him keep hearing, let him truly listen). Not everyone who hears with physical ears perceives with spiritual understanding. The call to hear is a call to discernment, faith, and obedience.',
   NULL),
  (10, 'And when he was alone, they that were about him with the twelve asked of him the parable.',
   'ὅτε δὲ ἐγένετο κατὰ μόνας ἠρώτησαν αὐτὸν οἱ περὶ αὐτὸν σὺν τοῖς δώδεκα τὴν παραβολήν',
   'hote de egeneto kata monas ērōtēsan auton hoi peri auton syn tois dōdeka tēn parabolēn',
   '''When he was alone'' (kata monas — in private). ''They that were about him with the twelve'' — a wider circle of followers beyond the Twelve. ''Asked of him the parable'' — they do not understand and ask for explanation. This willingness to ask distinguishes them from the crowds who hear but do not inquire. Seeking understanding is the mark of genuine discipleship.',
   NULL),
  (11, 'And he said unto them, Unto you it is given to know the mystery of the kingdom of God: but unto them that are without, all these things are done in parables:',
   'καὶ ἔλεγεν αὐτοῖς ὑμῖν δέδοται γνῶναι τὸ μυστήριον τῆς βασιλείας τοῦ θεοῦ ἐκείνοις δὲ τοῖς ἔξω ἐν παραβολαῖς τὰ πάντα γίνεται',
   'kai elegen autois hymin dedotai gnōnai to mystērion tēs basileias tou theou ekeinois de tois exō en parabolais ta panta ginetai',
   '''Unto you it is given'' (hymin dedotai — to you it has been given; perfect passive: a divine gift already bestowed). ''Mystery'' (mystērion — a secret now revealed to the initiated). ''Kingdom of God'' — the central theme of Jesus'' teaching. ''Them that are without'' (tois exō — those outside the circle of discipleship). ''All these things are done in parables'' — for outsiders, parables remain opaque. The difference between insiders and outsiders is not intelligence but receptivity to Jesus.',
   'This verse introduces one of the most challenging concepts in the Gospels: the dual function of parables. For those who follow Jesus, parables reveal the mystery of God''s kingdom. For those who have rejected him, parables conceal it. The mystery (mystērion) is not a riddle to solve but a divine secret that can only be received as a gift (dedotai — it has been given). Understanding the kingdom is not an intellectual achievement but a gracious revelation. Those ''without'' (exō) are not excluded by God''s decree but by their own refusal to listen and follow.'),
  (12, 'That seeing they may see, and not perceive; and hearing they may hear, and not understand; lest at any time they should be converted, and their sins should be forgiven them.',
   'ἵνα βλέποντες βλέπωσιν καὶ μὴ ἴδωσιν καὶ ἀκούοντες ἀκούωσιν καὶ μὴ συνιῶσιν μήποτε ἐπιστρέψωσιν καὶ ἀφεθῇ αὐτοῖς τὰ ἁμαρτήματα',
   'hina blepontes blepōsin kai mē idōsin kai akouontes akouōsin kai mē syniōsin mēpote epistrepsōsin kai aphethē autois ta hamartēmata',
   'Quoting Isaiah 6:9-10. ''Seeing they may see and not perceive'' — the paradox of spiritual blindness: physical sight without spiritual insight. ''Hearing and not understanding'' — auditory reception without comprehension. ''Lest they should be converted'' (mēpote epistrepsōsin — lest they should turn back). This difficult saying reflects the judicial hardening of those who have already rejected God''s message. The parables do not cause blindness; they confirm the blindness already chosen.',
   NULL),
  (13, 'And he said unto them, Know ye not this parable? and how then will ye know all parables?',
   'καὶ λέγει αὐτοῖς οὐκ οἴδατε τὴν παραβολὴν ταύτην καὶ πῶς πάσας τὰς παραβολὰς γνώσεσθε',
   'kai legei autois ouk oidate tēn parabolēn tautēn kai pōs pasas tas parabolas gnōsesthe',
   '''Know ye not this parable?'' — a gentle rebuke. The sower parable is foundational — the key to understanding all other parables. If they cannot grasp this one, how will they understand the rest? ''All parables'' (pasas tas parabolas) — the sower is the master parable because it explains how people respond to Jesus'' teaching. It is the parable about parables.',
   NULL),
  (14, 'The sower soweth the word.',
   'ὁ σπείρων τὸν λόγον σπείρει',
   'ho speirōn ton logon speirei',
   '''The sower soweth the word'' (ton logon speirei — sows the word). The seed is identified: it is the word (logos) — God''s message, the gospel of the kingdom. The sower is anyone who proclaims the word (Jesus primarily, but also his disciples). The focus is not on the sower''s technique but on the soil''s reception. The word is the same in every case; the variable is the human heart.',
   NULL),
  (15, 'And these are they by the way side, where the word is sown; but when they have heard, Satan cometh immediately, and taketh away the word that was sown in their hearts.',
   'οὗτοι δέ εἰσιν οἱ παρὰ τὴν ὁδόν ὅπου σπείρεται ὁ λόγος καὶ ὅταν ἀκούσωσιν εὐθέως ἔρχεται ὁ Σατανᾶς καὶ αἴρει τὸν λόγον τὸν ἐσπαρμένον ἐν ταῖς καρδίαις αὐτῶν',
   'houtoi de eisin hoi para tēn hodon hopou speiretai ho logos kai hotan akousōsin eutheōs erchetai ho Satanas kai airei ton logon ton esparmenon en tais kardiais autōn',
   '''By the way side'' — the hard path. ''Satan cometh immediately'' — there is no delay; the enemy is vigilant. ''Taketh away the word'' (airei ton logon — snatches, removes). ''Sown in their hearts'' — the heart is the soil. Wayside hearts are impenetrable: the word never gets below the surface. Satan does not need to attack what has no root — he simply removes it before it can germinate.',
   NULL),
  (16, 'And these are they likewise which are sown on stony ground; who, when they have heard the word, immediately receive it with gladness;',
   'καὶ οὗτοί εἰσιν ὁμοίως οἱ ἐπὶ τὰ πετρώδη σπειρόμενοι οἳ ὅταν ἀκούσωσιν τὸν λόγον εὐθέως μετὰ χαρᾶς λαμβάνουσιν αὐτόν',
   'kai houtoi eisin homoiōs hoi epi ta petrōdē speiromenoi hoi hotan akousōsin ton logon eutheōs meta charas lambanousin auton',
   '''Stony ground'' — shallow soil over rock. ''Immediately receive it with gladness'' (eutheōs meta charas lambanousin — at once with joy they accept it). The response is enthusiastic but superficial. Emotional excitement without deep conviction produces rapid but rootless commitment. The problem is not the initial response but the lack of depth beneath it.',
   NULL),
  (17, 'And have no root in themselves, and so endure but for a time: afterward, when affliction or persecution ariseth for the word''s sake, immediately they are offended.',
   'καὶ οὐκ ἔχουσιν ῥίζαν ἐν ἑαυτοῖς ἀλλὰ πρόσκαιροί εἰσιν εἶτα γενομένης θλίψεως ἢ διωγμοῦ διὰ τὸν λόγον εὐθέως σκανδαλίζονται',
   'kai ouk echousin rhizan en heautois alla proskairoi eisin eita genomenēs thlipseōs ē diōgmou dia ton logon eutheōs skandalizontai',
   '''No root in themselves'' (ouk echousin rhizan en heautois — they have no root within). ''Endure but for a time'' (proskairoi — temporary, seasonal). ''Affliction'' (thlipseōs — pressure, tribulation). ''Persecution'' (diōgmou — harassment, pursuit). ''For the word''s sake'' — suffering comes because of the word, not despite it. ''Offended'' (skandalizontai — stumble, fall away; from skandalon, a trap/snare). Persecution is the test that reveals root depth.',
   NULL),
  (18, 'And these are they which are sown among thorns; such as hear the word,',
   'καὶ οὗτοί εἰσιν οἱ εἰς τὰς ἀκάνθας σπειρόμενοι οἱ τὸν λόγον ἀκούσαντες',
   'kai houtoi eisin hoi eis tas akanthas speiromenoi hoi ton logon akousantes',
   '''Among thorns'' — the soil is deep enough but is shared with competing plants. These hearers receive the word and it takes root, but other things are growing in the same soil, competing for the same resources. The word is present but not dominant — it is being crowded out by rivals.',
   NULL),
  (19, 'And the cares of this world, and the deceitfulness of riches, and the lusts of other things entering in, choke the word, and it becometh unfruitful.',
   'καὶ αἱ μέριμναι τοῦ αἰῶνος τούτου καὶ ἡ ἀπάτη τοῦ πλούτου καὶ αἱ περὶ τὰ λοιπὰ ἐπιθυμίαι εἰσπορευόμεναι συμπνίγουσιν τὸν λόγον καὶ ἄκαρπος γίνεται',
   'kai hai merimnai tou aiōnos toutou kai hē apatē tou ploutou kai hai peri ta loipa epithymiai eisporeuomenai sympnigousin ton logon kai akarpos ginetai',
   '''Cares of this world'' (merimnai tou aiōnos — anxieties of the age; daily worries that consume attention). ''Deceitfulness of riches'' (apatē tou ploutou — the seduction, the lying promise of wealth). ''Lusts of other things'' (peri ta loipa epithymiai — desires for the remaining things; cravings for everything else). ''Choke'' (sympnigousin — strangle together, suffocate). ''Unfruitful'' (akarpos — without fruit, barren). Three categories of thorns: anxiety, wealth, and desire. Together they strangle spiritual life.',
   NULL),
  (20, 'And these are they which are sown on good ground; such as hear the word, and receive it, and bring forth fruit, some thirtyfold, some sixty, and some an hundred.',
   'καὶ οὗτοί εἰσιν οἱ ἐπὶ τὴν γῆν τὴν καλὴν σπαρέντες οἵτινες ἀκούουσιν τὸν λόγον καὶ παραδέχονται καὶ καρποφοροῦσιν ἓν τριάκοντα καὶ ἓν ἑξήκοντα καὶ ἓν ἑκατόν',
   'kai houtoi eisin hoi epi tēn gēn tēn kalēn sparentes hoitines akouousin ton logon kai paradechontai kai karpophorousin hen triakonta kai hen hexēkonta kai hen hekaton',
   '''Good ground'' (tēn gēn tēn kalēn — the beautiful, noble soil). ''Hear the word'' (akouousin — they listen). ''Receive it'' (paradechontai — welcome it, accept it warmly). ''Bring forth fruit'' (karpophorousin — bear fruit; a compound word: karpos + phoreō). Three verbs describe the good soil: hear, receive, produce. The harvest varies (thirty, sixty, hundred) — fruitfulness is not uniform but always abundant. The parable ends on the note of extraordinary productivity.',
   NULL),
  (21, 'And he said unto them, Is a candle brought to be put under a bushel, or under a bed? and not to be set on a candlestick?',
   'καὶ ἔλεγεν αὐτοῖς μήτι ἔρχεται ὁ λύχνος ἵνα ὑπὸ τὸν μόδιον τεθῇ ἢ ὑπὸ τὴν κλίνην οὐχ ἵνα ἐπὶ τὴν λυχνίαν ἐπιτεθῇ',
   'kai elegen autois mēti erchetai ho lychnos hina hypo ton modion tethē ē hypo tēn klinēn ouch hina epi tēn lychnian epitethē',
   '''Candle'' (lychnos — an oil lamp). ''Bushel'' (modion — a measuring basket, about 8.75 litres). ''Bed'' (klinēn — a couch, bed). ''Candlestick'' (lychnian — a lampstand). The point: light is meant to be seen. The truth of the kingdom — currently hidden in parables — is ultimately destined for full disclosure. The messianic secret is temporary; the revelation is permanent. Jesus'' teaching in parables does not contradict the purpose of light; it is the strategic first step toward full illumination.',
   NULL),
  (22, 'For there is nothing hid, which shall not be manifested; neither was any thing kept secret, but that it should come abroad.',
   'οὐ γάρ ἐστίν τι κρυπτὸν ὃ ἐὰν μὴ φανερωθῇ οὐδὲ ἐγένετο ἀπόκρυφον ἀλλ᾿ ἵνα εἰς φανερὸν ἔλθῃ',
   'ou gar estin ti krypton ho ean mē phanerōthē oude egeneto apokryphon all hina eis phaneron elthē',
   '''Nothing hid'' (krypton — hidden, concealed). ''Shall not be manifested'' (phanerōthē — be made visible, be revealed). ''Kept secret'' (apokryphon — stored away secretly). ''Come abroad'' (eis phaneron elthē — come into the open). The purpose of present concealment is future revelation. The kingdom truths hidden in parables will ultimately be proclaimed openly. What Jesus teaches privately to the disciples will become the public proclamation of the church.',
   NULL),
  (23, 'If any man have ears to hear, let him hear.',
   'εἴ τις ἔχει ὦτα ἀκούειν ἀκουέτω',
   'ei tis echei ōta akouein akouetō',
   'The formula repeats from v.9, framing the lamp/bushel saying. ''Ears to hear'' — spiritual receptivity, the willingness to go beyond surface meaning to deeper truth. The repetition emphasises that hearing is the key to everything in this chapter.',
   NULL),
  (24, 'And he said unto them, Take heed what ye hear: with what measure ye mete, it shall be measured to you: and unto you that hear shall more be given.',
   'καὶ ἔλεγεν αὐτοῖς βλέπετε τί ἀκούετε ἐν ᾧ μέτρῳ μετρεῖτε μετρηθήσεται ὑμῖν καὶ προστεθήσεται ὑμῖν τοῖς ἀκούουσιν',
   'kai elegen autois blepete ti akouete en hō metrō metreite metrēthēsetai hymin kai prostethēsetai hymin tois akouousin',
   '''Take heed what ye hear'' (blepete ti akouete — watch what you listen to). ''With what measure ye mete'' — the attention and obedience you invest in hearing determines what you receive back. ''Unto you that hear shall more be given'' — those who truly listen receive increasing understanding. Spiritual knowledge operates on a compound interest principle: the more you invest in hearing, the more understanding you receive.',
   NULL),
  (25, 'For he that hath, to him shall be given: and he that hath not, from him shall be taken even that which he hath.',
   'ὃς γὰρ ἂν ἔχῃ δοθήσεται αὐτῷ καὶ ὃς οὐκ ἔχει καὶ ὃ ἔχει ἀρθήσεται ἀπ᾿ αὐτοῦ',
   'hos gar an echē dothēsetai autō kai hos ouk echei kai ho echei arthēsetai ap autou',
   '''He that hath, to him shall be given'' — those who have received truth and responded to it will receive more. ''He that hath not, from him shall be taken'' — those who have not responded to what they received will lose even the capacity to receive. This is a solemn spiritual law: use it or lose it. Receptivity to God''s word either grows or atrophies — there is no neutral position.',
   NULL),
  (26, 'And he said, So is the kingdom of God, as if a man should cast seed into the ground;',
   'καὶ ἔλεγεν οὕτως ἐστὶν ἡ βασιλεία τοῦ θεοῦ ὡς ἐὰν ἄνθρωπος βάλῃ τὸν σπόρον ἐπὶ τῆς γῆς',
   'kai elegen houtōs estin hē basileia tou theou hōs ean anthrōpos balē ton sporon epi tēs gēs',
   '''So is the kingdom of God'' — a new parable, unique to Mark. ''As if a man should cast seed'' (balē ton sporon — throw the seed). The farmer sows and then steps back. The seed grows ''of itself'' (v.28). This parable emphasises the mysterious, autonomous, divinely powered growth of the kingdom. The sower plays a part but does not control the outcome.',
   NULL),
  (27, 'And should sleep, and rise night and day, and the seed should spring and grow up, he knoweth not how.',
   'καὶ καθεύδῃ καὶ ἐγείρηται νύκτα καὶ ἡμέραν καὶ ὁ σπόρος βλαστάνῃ καὶ μηκύνηται ὡς οὐκ οἶδεν αὐτός',
   'kai katheudē kai egeirētai nykta kai hēmeran kai ho sporos blastanē kai mēkynētai hōs ouk oiden autos',
   '''Sleep and rise'' — the farmer continues his normal routine. ''Night and day'' — the growth happens continuously, whether the farmer is awake or asleep. ''Spring and grow up'' (blastanē kai mēkynētai — sprouts and lengthens). ''He knoweth not how'' (hōs ouk oiden autos — in a manner he does not understand). The growth of the kingdom is mysterious, unstoppable, and ultimately beyond human control. The farmer sows; God gives the increase (1 Corinthians 3:6-7).',
   NULL),
  (28, 'For the earth bringeth forth fruit of herself; first the blade, then the ear, after that the full corn in the ear.',
   'αὐτομάτη γὰρ ἡ γῆ καρποφορεῖ πρῶτον χόρτον εἶτα στάχυν εἶτα πλήρη σῖτον ἐν τῷ στάχυϊ',
   'automatē gar hē gē karpophorei prōton chorton eita stachyn eita plērē siton en tō stachyi',
   '''Of herself'' (automatē — automatically, spontaneously; the English word ''automatic'' derives from this). ''First the blade, then the ear, then the full corn'' — the growth follows a divinely ordered sequence: shoot, stalk, mature grain. The kingdom grows incrementally but inevitably. Human effort plants the seed, but the growth itself is God''s sovereign work in his own time and manner.',
   NULL),
  (29, 'But when the fruit is brought forth, immediately he putteth in the sickle, because the harvest is come.',
   'ὅταν δὲ παραδῷ ὁ καρπός εὐθέως ἀποστέλλει τὸ δρέπανον ὅτι παρέστηκεν ὁ θερισμός',
   'hotan de paradō ho karpos eutheōs apostellei to drepanon hoti parestēken ho therismos',
   '''When the fruit is brought forth'' (hotan paradō ho karpos — when the fruit is ripe, when it permits/delivers itself). ''Immediately'' (eutheōs — at once). ''Putteth in the sickle'' (apostellei to drepanon — sends forth the sickle). ''Harvest'' (therismos — reaping time). Echoing Joel 3:13. The parable has an eschatological dimension: the kingdom grows toward a harvest — the final judgment when God''s purposes reach their completion.',
   NULL),
  (30, 'And he said, Whereunto shall we liken the kingdom of God? or with what comparison shall we compare it?',
   'καὶ ἔλεγεν τίνι ὁμοιώσωμεν τὴν βασιλείαν τοῦ θεοῦ ἢ ἐν ποίᾳ παραβολῇ παραθῶμεν αὐτήν',
   'kai elegen tini homoiōsōmen tēn basileian tou theou ē en poia parabolē parathōmen autēn',
   '''Whereunto shall we liken'' (tini homoiōsōmen — to what shall we compare; deliberative subjunctive: an invitation to think together). ''What comparison'' (poia parabolē — what kind of parable). Jesus engages his audience in the search for analogies. The kingdom of God defies simple description — no single image can capture it. Each parable illuminates a different facet.',
   NULL),
  (31, 'It is like a grain of mustard seed, which, when it is sown in the earth, is less than all the seeds that be in the earth:',
   'ὡς κόκκῳ σινάπεως ὅς ὅταν σπαρῇ ἐπὶ τῆς γῆς μικρότερος πάντων τῶν σπερμάτων ἐστὶν τῶν ἐπὶ τῆς γῆς',
   'hōs kokkō sinapeōs hos hotan sparē epi tēs gēs mikroteros pantōn tōn spermatōn estin tōn epi tēs gēs',
   '''Grain of mustard seed'' (kokkō sinapeōs — a mustard seed; proverbially the smallest seed in Palestinian agriculture, approximately 1-2mm). ''Less than all the seeds'' (mikroteros pantōn tōn spermatōn — smaller than all the seeds). Jesus emphasises the seed''s insignificant beginning. The kingdom of God began with a Galilean carpenter, twelve ordinary men, and a handful of followers — the smallest of beginnings.',
   NULL),
  (32, 'But when it is sown, it groweth up, and becometh greater than all herbs, and shooteth out great branches; so that the fowls of the air may lodge under the shadow of it.',
   'καὶ ὅταν σπαρῇ ἀναβαίνει καὶ γίνεται πάντων τῶν λαχάνων μεῖζον καὶ ποιεῖ κλάδους μεγάλους ὥστε δύνασθαι ὑπὸ τὴν σκιὰν αὐτοῦ τὰ πετεινὰ τοῦ οὐρανοῦ κατασκηνοῦν',
   'kai hotan sparē anabainei kai ginetai pantōn tōn lachanōn meizon kai poiei kladous megalous hōste dynasthai hypo tēn skian autou ta peteina tou ouranou kataskēnoun',
   '''Greater than all herbs'' — the black mustard plant (Brassica nigra) can grow to 3-4 metres (10-12 feet) in a single season. ''Great branches'' (kladous megalous). ''Fowls of the air lodge under the shadow'' — echoing Daniel 4:12 and Ezekiel 17:23, where a great tree shelters birds (nations). The kingdom that begins as the smallest seed becomes great enough to provide shelter for all nations. The birds here represent Gentiles finding refuge in the kingdom — a contrast with the birds of v.4 (Satan snatching seed).',
   'The mustard seed parable teaches the principle of disproportionate growth: the kingdom''s final greatness vastly exceeds its humble origins. Twelve apostles became a global movement. A crucified Galilean became the Lord of all creation. The OT imagery of birds nesting in branches (Daniel 4:12, Ezekiel 17:23, 31:6) consistently represents nations finding shelter under a great kingdom. Applied to God''s kingdom, it points to the inclusion of all peoples — Jew and Gentile — in the worldwide shelter of God''s reign through Christ.'),
  (33, 'And with many such parables spake he the word unto them, as they were able to hear it.',
   'καὶ τοιαύταις παραβολαῖς πολλαῖς ἐλάλει αὐτοῖς τὸν λόγον καθὼς ἠδύναντο ἀκούειν',
   'kai toiautais parabolais pollais elalei autois ton logon kathōs ēdynanto akouein',
   '''Many such parables'' — Mark records only a few; Jesus told many more. ''Spake the word'' (elalei ton logon — was speaking the word; the word/logos is the consistent content). ''As they were able to hear'' (kathōs ēdynanto akouein — according to their capacity to receive). Jesus calibrated his teaching to his audience''s ability. This is divine pedagogy: meeting people where they are, not demanding more than they can absorb.',
   NULL),
  (34, 'But without a parable spake he not unto them: and when they were alone, he expounded all things to his disciples.',
   'χωρὶς δὲ παραβολῆς οὐκ ἐλάλει αὐτοῖς κατ᾿ ἰδίαν δὲ τοῖς μαθηταῖς αὐτοῦ ἐπέλυεν πάντα',
   'chōris de parabolēs ouk elalei autois kat idian de tois mathētais autou epelyen panta',
   '''Without a parable spake he not'' — parables were Jesus'' primary public teaching method. ''When they were alone'' (kat idian — privately). ''Expounded all things'' (epelyen panta — explained, interpreted, unlocked everything). There are two levels of teaching: public parables and private interpretation. The disciples receive both — the image and the meaning. This two-level instruction was common in Jewish and Greco-Roman teaching contexts.',
   NULL),
  (35, 'And the same day, when the even was come, he saith unto them, Let us pass over unto the other side.',
   'καὶ λέγει αὐτοῖς ἐν ἐκείνῃ τῇ ἡμέρᾳ ὀψίας γενομένης διέλθωμεν εἰς τὸ πέραν',
   'kai legei autois en ekeinē tē hēmera opsias genomenēs dielthōmen eis to peran',
   '''The same day'' — the events are connected: the day of parables ends with a demonstration of authority. ''When the even was come'' (opsias genomenēs — evening having arrived). ''Let us pass over unto the other side'' (dielthōmen eis to peran — let us cross to the eastern shore). Jesus initiates the crossing. The ''other side'' of the Sea of Galilee was Gentile territory (Decapolis). Every word Jesus speaks is deliberate: ''let us pass over'' implies they will reach the other side — a promise the storm cannot nullify.',
   NULL),
  (36, 'And when they had sent away the multitude, they took him even as he was in the ship. And there were also with him other little ships.',
   'καὶ ἀφέντες τὸν ὄχλον παραλαμβάνουσιν αὐτὸν ὡς ἦν ἐν τῷ πλοίῳ καὶ ἄλλα δὲ πλοιάρια ἦν μετ᾿ αὐτοῦ',
   'kai aphentes ton ochlon paralambanousin auton hōs ēn en tō ploiō kai alla de ploiaria ēn met autou',
   '''Sent away the multitude'' — the crowd is dismissed. ''Took him even as he was'' (hōs ēn — just as he was; without going ashore or making preparations). ''Other little ships'' (alla ploiaria — other small boats). The detail of the other boats is an eyewitness touch (characteristic of Mark/Peter). These boats are never mentioned again — they serve only to place us in the scene.',
   NULL),
  (37, 'And there arose a great storm of wind, and the waves beat into the ship, so that it was now full.',
   'καὶ γίνεται λαῖλαψ ἀνέμου μεγάλη καὶ τὰ κύματα ἐπέβαλλεν εἰς τὸ πλοῖον ὥστε αὐτὸ ἤδη γεμίζεσθαι',
   'kai ginetai lailaps anemou megalē kai ta kymata epeballen eis to ploion hōste auto ēdē gemizesthai',
   '''Great storm of wind'' (lailaps anemou megalē — a massive windstorm, a violent squall). The Sea of Galilee lies 700 feet below sea level, surrounded by hills with ravines that funnel cold air down onto the warm lake, creating sudden, violent storms. ''Waves beat into the ship'' (epeballen — kept beating, hurling themselves upon). ''Now full'' (ēdē gemizesthai — already filling up, becoming waterlogged). The situation is genuinely life-threatening.',
   NULL),
  (38, 'And he was in the hinder part of the ship, asleep on a pillow: and they awake him, and say unto him, Master, carest thou not that we perish?',
   'καὶ ἦν αὐτὸς ἐπὶ τῇ πρύμνῃ ἐπὶ τὸ προσκεφάλαιον καθεύδων καὶ διεγείρουσιν αὐτὸν καὶ λέγουσιν αὐτῷ διδάσκαλε οὐ μέλει σοι ὅτι ἀπολλύμεθα',
   'kai ēn autos epi tē prymnē epi to proskephalaion katheudōn kai diegeirousin auton kai legousin autō didaskale ou melei soi hoti apollymetha',
   '''Hinder part'' (prymnē — the stern). ''Asleep on a pillow'' (epi to proskephalaion katheudōn — sleeping on the cushion; the steersman''s leather cushion). Jesus is so exhausted from teaching that he sleeps through a violent storm — a detail showing his true humanity. ''Master, carest thou not that we perish?'' (didaskale, ou melei soi — Teacher, is it not a concern to you?). The disciples'' question reveals both fear and frustration — perhaps even accusation. They question not just his power but his care.',
   NULL),
  (39, 'And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm.',
   'καὶ διεγερθεὶς ἐπετίμησεν τῷ ἀνέμῳ καὶ εἶπεν τῇ θαλάσσῃ σιώπα πεφίμωσο καὶ ἐκόπασεν ὁ ἄνεμος καὶ ἐγένετο γαλήνη μεγάλη',
   'kai diegeritheis epetimēsen tō anemō kai eipen tē thalassē siōpa pephimōso kai ekopasen ho anemos kai egeneto galēnē megalē',
   '''Rebuked'' (epetimēsen — the same word used for rebuking demons, 1:25). ''Peace, be still'' (siōpa pephimōso — be silent! be muzzled! The first is aorist: stop now. The second is perfect passive: remain permanently silenced). These are the same commanding tones used against the unclean spirit in 1:25. ''The wind ceased'' — instant obedience. ''A great calm'' (galēnē megalē — a great stillness; the great storm is replaced by a great calm). In the OT, calming the sea is an act of God alone (Psalm 89:9, 107:29).',
   'This miracle is one of the most significant in Mark because it demonstrates authority over nature — a prerogative of God alone. Psalm 89:8-9: ''O LORD God of hosts, who is a strong LORD like unto thee? Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them.'' Psalm 107:29: ''He maketh the storm a calm, so that the waves thereof are still.'' Jesus does what only Yahweh does. The language of ''rebuking'' the wind and ''muzzling'' the sea echoes God''s mastery over chaos in the OT (Nahum 1:4, Psalm 106:9). This is the God of creation in human form.'),
  (40, 'And he said unto them, Why are ye so fearful? how is it that ye have no faith?',
   'καὶ εἶπεν αὐτοῖς τί δειλοί ἐστε οὕτω πῶς οὐκ ἔχετε πίστιν',
   'kai eipen autois ti deiloi este houtō pōs ouk echete pistin',
   '''Fearful'' (deiloi — cowardly, timid; a stronger word than ''afraid''). ''How is it that ye have no faith?'' (pōs ouk echete pistin — why do you not have faith?). Two questions, two rebukes. The first addresses their fear; the second addresses its cause — lack of faith. They had Jesus in the boat, and Jesus had said ''let us pass over'' — his word guaranteed arrival. Fear and faith are inversely related: where faith grows, fear shrinks.',
   NULL),
  (41, 'And they feared exceedingly, and said one to another, What manner of man is this, that even the wind and the sea obey him?',
   'καὶ ἐφοβήθησαν φόβον μέγαν καὶ ἔλεγον πρὸς ἀλλήλους τίς ἄρα οὗτός ἐστιν ὅτι καὶ ὁ ἄνεμος καὶ ἡ θάλασσα ὑπακούουσιν αὐτῷ',
   'kai ephobēthēsan phobon megan kai elegon pros allēlous tis ara houtos estin hoti kai ho anemos kai hē thalassa hypakouousin autō',
   '''Feared exceedingly'' (ephobēthēsan phobon megan — they feared a great fear; stronger than their fear of the storm). ''What manner of man is this?'' (tis ara houtos estin — who then is this?). ''Even the wind and the sea obey him'' (hypakouousin autō — submit to him, listen under his authority). The question is the climactic question of the chapter — and indeed of the whole Gospel. The disciples'' fear of the storm has been replaced by a deeper, holier fear: awe at the person sleeping in their boat. They do not yet know the answer, but the reader does: this is the Son of God (1:1).',
   'The chapter that began with parables about hearing (vv.3, 9, 23, 24) ends with the wind and sea ''hearing'' Jesus (hypakouousin — obeying, literally ''listening under''). The word obeys even inanimate nature. The disciples'' question — ''Who is this?'' — is the question Mark wants every reader to answer. The one who teaches with authority over human hearts (vv.1-34) also commands with authority over creation (vv.35-41). He is no mere prophet or teacher; he is the Lord of creation in human flesh, the one whom wind and waves serve.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 4;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.11 mystery
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery, divine secret now revealed — from myeō (to initiate into secrets). In biblical usage, mystērion is not something incomprehensible but a divine plan previously hidden and now disclosed to those who belong to Christ. The ''mystery of the kingdom'' is that God''s reign is arriving through the unexpected means of a suffering Messiah, a sown word, and a community of unlikely disciples. This mystery is ''given'' (dedotai) — it is a gift, not an achievement. Those outside receive the same parables but without the key of faith, the mystery remains locked.', 1),
  -- v.14 word / logos
  ('λόγος', 'logos', 'G3056', 'Word, message, account, reason — from legō (to say, speak). In the sower parable, the seed is ''the word'' (ho logos) — God''s message about his kingdom. This is the dynamic, living word that has power to take root, grow, and produce fruit in receptive hearts. The logos is not mere information but performative speech — it does what it says. As the seed contains the life of the plant, so the word contains the life of the kingdom. The variable is not the word''s power but the soil''s reception.', 2),
  -- v.19 cares / anxieties
  ('μέριμνα', 'merimna', 'G3308', 'Care, anxiety, worry — from merizō (to divide, to be pulled in different directions). Anxiety divides the heart, pulling attention away from the word toward competing concerns. The ''cares of this world'' (merimnai tou aiōnos) are not necessarily sinful in themselves — they are the ordinary worries of daily life: food, clothing, security. But when they dominate, they strangle spiritual growth as effectively as thorns strangle grain. Jesus addresses this directly in Matthew 6:25-34: ''Take no thought for your life.''', 3),
  -- v.28 of herself / automatically
  ('αὐτόματος', 'automatos', 'G844', 'Of itself, spontaneously, automatically — from autos (self) + matos (thinking, willing). The earth produces fruit ''of herself'' — the growth is intrinsic, divinely powered, not dependent on the farmer''s constant intervention. This word (from which English ''automatic'' derives) teaches that the kingdom grows by God''s inherent power within the sown word. The farmer sows and reaps; God gives the growth (1 Corinthians 3:6-7). This is both humbling (we cannot force growth) and encouraging (growth does not depend on our efforts alone).', 4),
  -- v.31 mustard seed
  ('σίναπι', 'sinapi', 'G4615', 'Mustard — the black mustard plant (Brassica nigra or Sinapis nigra). Its seed is 1-2mm in diameter, proverbially the smallest cultivated seed in first-century Palestine. Yet the plant grows to 3-4 metres in a single season, producing branches large enough for birds to nest in. Jesus uses this radical disproportion — tiny seed to enormous plant — as an image of the kingdom: its beginnings are insignificant by worldly standards, but its ultimate extent is universal. The kingdom that began with twelve men now spans the globe.', 5),
  -- v.39 peace, be still
  ('πεφίμωσο', 'pephimōso', 'G5392', 'Be muzzled, be silenced permanently — perfect passive imperative of phimoō (to muzzle, gag, silence). The perfect tense demands not just immediate silence but permanent cessation. The same verb was used to silence the demon in 1:25 (phimōthēti). Jesus addresses the storm with the same sovereign authority he uses against demonic forces. The word implies that the storm, like the demons, is an agent of chaos that must submit to the Creator''s command. Nature obeys instantly what demons resist reluctantly.', 6),
  -- v.40 faith
  ('πίστις', 'pistis', 'G4102', 'Faith, trust, confidence, faithfulness — from peithō (to persuade, to be convinced). In the storm narrative, pistis is specifically trust in Jesus'' word and person. Jesus had said ''let us pass over'' (v.35) — faith would rest on that word even in the midst of the storm. The disciples'' failure was not intellectual but relational: they had Jesus in the boat but did not trust his word. Faith is not the absence of storms but confidence in the Lord of the storm. It is taking Jesus at his word even when circumstances scream otherwise.', 7),
  -- v.12 perceive
  ('συνίημι', 'syniēmi', 'G4920', 'To understand, comprehend, perceive — from syn (together) + hiēmi (to send, put). Literally ''to put things together,'' to synthesise information into understanding. In v.12, the outsiders hear but do not ''understand'' (syniōsin) — they receive the words but cannot assemble them into meaning. Understanding in Mark is not merely intellectual but spiritual: it requires openness to Jesus'' person, not just his propositions. The disciples are slow to understand (cf. 6:52, 8:17-21) but they ask, and asking is the first step toward comprehension.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 4
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 11
    WHEN 2 THEN 14
    WHEN 3 THEN 19
    WHEN 4 THEN 28
    WHEN 5 THEN 31
    WHEN 6 THEN 39
    WHEN 7 THEN 40
    WHEN 8 THEN 12
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 parable of the sower
  (3, 'Matthew 13:3-9', 1),
  (3, 'Luke 8:5-8', 2),
  -- v.11 mystery of the kingdom
  (11, 'Matthew 13:11', 3),
  (11, '1 Corinthians 2:10', 4),
  (11, 'Colossians 1:26-27', 5),
  -- v.12 seeing and not perceiving
  (12, 'Isaiah 6:9-10', 6),
  (12, 'John 12:39-40', 7),
  (12, 'Acts 28:26-27', 8),
  -- v.14 sower soweth the word
  (14, 'Isaiah 55:10-11', 9),
  (14, '1 Peter 1:23-25', 10),
  -- v.19 cares of this world
  (19, 'Matthew 6:25-34', 11),
  (19, '1 Timothy 6:9-10', 12),
  (19, '1 John 2:15-17', 13),
  -- v.21 lamp on a candlestick
  (21, 'Matthew 5:14-16', 14),
  (21, 'Luke 11:33', 15),
  -- v.22 nothing hid
  (22, 'Luke 12:2-3', 16),
  (22, '1 Corinthians 4:5', 17),
  -- v.25 he that hath
  (25, 'Matthew 13:12', 18),
  (25, 'Matthew 25:29', 19),
  -- v.28 earth bringeth forth of herself
  (28, '1 Corinthians 3:6-7', 20),
  -- v.29 harvest is come
  (29, 'Joel 3:13', 21),
  (29, 'Revelation 14:15-16', 22),
  -- v.31 mustard seed
  (31, 'Matthew 13:31-32', 23),
  (31, 'Luke 13:18-19', 24),
  -- v.32 birds lodge under shadow
  (32, 'Daniel 4:12', 25),
  (32, 'Ezekiel 17:23', 26),
  -- v.37 great storm
  (37, 'Jonah 1:4', 27),
  (37, 'Psalm 107:25-29', 28),
  -- v.39 peace be still
  (39, 'Psalm 89:9', 29),
  (39, 'Psalm 65:7', 30),
  (39, 'Nahum 1:4', 31),
  -- v.41 who is this
  (41, 'Psalm 107:28-29', 32),
  (41, 'Job 38:8-11', 33)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 4
  AND v.verse_number = cr.verse_number;

-- MARK CHAPTER 4 — BACKFILL (additional word_studies + cross_references)

INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'συνάγεται πρὸς αὐτὸν ὄχλος πλεῖστος', 'synagetai pros auton ochlos pleistos', 'G4863/G3793/G4118', 'A very large crowd gathered — superlative pleistos; amphitheatre-like natural setting along the Galilean shore.', 100),
  (1, 'ἐμβάντα εἰς πλοῖον καθῆσθαι ἐν τῇ θαλάσσῃ', 'embanta eis ploion kathēsthai en tē thalassē', 'G1684/G4143/G2521', 'Got into a boat and sat — floating pulpit; water amplifies sound; rabbis taught seated.', 101),
  (2, 'ἐν παραβολαῖς πολλά', 'en parabolais polla', 'G3850', 'Many things in parables — parabolē: Hebrew mashal behind it; riddle, proverb, story; teaching by comparison.', 102),
  (3, 'ἀκούετε, ἰδοὺ ἐξῆλθεν ὁ σπείρων', 'akouete, idou exēlthen ho speirōn', 'G191/G1831/G4687', '"Listen! Behold, the sower went out" — double call to attention bracket the parable (cf. v.9).', 103),
  (4, 'παρὰ τὴν ὁδόν', 'para tēn hodon', 'G3844/G3598', 'Along the path — hard-packed walking track between fields; seed could not penetrate compacted soil.', 104),
  (5, 'πετρῶδες', 'petrōdes', 'G4075', 'Rocky ground — shallow soil over limestone bedrock common in Galilee; deceptive surface thin over stone.', 105),
  (6, 'ἐκαυματίσθη', 'ekaumatisthē', 'G2739', 'Was scorched — aorist passive; sun exposes shallow rooting; heat finishes what absence of depth begins.', 106),
  (7, 'ἄκανθαι', 'akanthai', 'G173', 'Thorns — dormant weed roots revive with wheat; biblical motif of cursed ground (Gen 3:18).', 107),
  (7, 'συνέπνιξαν', 'synepnixan', 'G4846', 'Choked — literally "strangled together"; competitive suffocation rather than a single lethal blow.', 108),
  (8, 'τριάκοντα καὶ ἑξήκοντα καὶ ἑκατόν', 'triakonta kai hexēkonta kai hekaton', 'G5144/G1835/G1540', '30, 60, 100-fold — exceptional by Palestinian standards; normal yield was 7-10 fold; hyperbolic kingdom abundance.', 109),
  (9, 'ὃς ἔχει ὦτα ἀκούειν ἀκουέτω', 'hos echei ōta akouein akouetō', 'G3775/G191', 'Who has ears to hear, let him hear — formula of prophetic summons (cf. Ezek 3:27; Rev 2:7).', 110),
  (10, 'κατὰ μόνας', 'kata monas', 'G3441', 'Privately (alone) — Markan distinction between crowd parable and private explanation to the Twelve.', 111),
  (11, 'τοῖς ἔξω', 'tois exō', 'G1854', 'To those outside — sharp insider/outsider distinction; kingdom revealed to initiates, veiled to others.', 112),
  (12, 'μήποτε ἐπιστρέψωσιν καὶ ἀφεθῇ αὐτοῖς', 'mēpote epistrepsōsin kai aphethē autois', 'G3379/G1994/G863', '"Lest they turn and it be forgiven them" — Isa 6:9-10 LXX; hardening as judicial response to prior rejection, not arbitrary exclusion.', 113),
  (13, 'πᾶσας τὰς παραβολὰς', 'pasas tas parabolas', 'G3956/G3850', '"All the parables" — this sower parable is the hermeneutical key to the others; master-parable.', 114),
  (14, 'ὁ σπείρων τὸν λόγον σπείρει', 'ho speirōn ton logon speirei', 'G4687/G3056', 'The sower sows the word — logos: gospel proclamation; Jesus and his disciples as sowers.', 115),
  (15, 'εὐθὺς ἔρχεται ὁ σατανᾶς', 'euthys erchetai ho satanas', 'G2117/G4567', 'Immediately Satan comes — active personal opposition to the word at first hearing.', 116),
  (16, 'μετὰ χαρᾶς λαμβάνουσιν', 'meta charas lambanousin', 'G5479/G2983', 'Receive with joy — superficial enthusiasm without depth; joy without root is a warning sign, not proof.', 117),
  (17, 'πρόσκαιροι', 'proskairoi', 'G4340', 'Temporary, lasting only a season — pros + kairos; stands in contrast to aiōnios; no enduring fruit.', 118),
  (17, 'θλίψεως ἢ διωγμοῦ', 'thlipseōs ē diōgmou', 'G2347/G1375', 'Tribulation or persecution — dia tou logon ("because of the word"); pressure reveals absence of depth.', 119),
  (17, 'σκανδαλίζονται', 'skandalizontai', 'G4624', 'Are made to stumble — skandalon: trap-stick; passive: they are tripped, not merely walk away.', 120),
  (19, 'ἡ ἀπάτη τοῦ πλούτου', 'hē apatē tou ploutou', 'G539/G4149', 'Deceit of riches — wealth''s promise to satisfy is a lie (Jer 17:11; 1 Tim 6:9).', 121),
  (19, 'αἱ περὶ τὰ λοιπὰ ἐπιθυμίαι', 'hai peri ta loipa epithymiai', 'G3062/G1939', 'Desires for other things — catch-all; anything aside from the word competing for heart-space.', 122),
  (19, 'ἄκαρπος γίνεται', 'akarpos ginetai', 'G175/G1096', 'Becomes unfruitful — not necessarily death but sterility; alive but barren; a tragic category.', 123),
  (20, 'παραδέχονται τὸν λόγον καὶ καρποφοροῦσιν', 'paradechontai ton logon kai karpophorousin', 'G3858/G2592', 'Receive the word and bear fruit — paradechomai: welcome as one''s own; karpophoreō: literally "fruit-bearing" compound.', 124),
  (21, 'λύχνος... ὑπὸ τὸν μόδιον ἢ ὑπὸ τὴν κλίνην', 'lychnos... hypo ton modion ē hypo tēn klinēn', 'G3088/G3426/G2825', 'Lamp... under bushel or under bed — small olive-oil lamp; modios: dry-measure basket (~8.7 L); absurd hiding places.', 125),
  (21, 'ἐπὶ τὴν λυχνίαν τεθῇ', 'epi tēn lychnian tethē', 'G3087/G5087', 'Set on the lampstand — lychnia: free-standing lampholder elevating light for the room.', 126),
  (22, 'οὐ γάρ ἐστιν κρυπτὸν', 'ou gar estin krypton', 'G2927', 'Nothing is hidden — kryptos; apparent secrecy of the parables is temporary; disclosure is the telos.', 127),
  (24, 'ἐν ᾧ μέτρῳ μετρεῖτε μετρηθήσεται ὑμῖν', 'en hō metrō metreite metrēthēsetai hymin', 'G3358/G3354', '"With the measure you measure it will be measured to you" — divine reciprocity principle; generosity in hearing repaid in revelation.', 128),
  (25, 'ὃς γὰρ ἔχει δοθήσεται αὐτῷ', 'hos gar echei dothēsetai autō', 'G2192/G1325', 'To him who has, more will be given — "rich get richer" in spiritual economics; use-it-or-lose-it principle applied to truth.', 129),
  (26, 'οὕτως ἐστὶν ἡ βασιλεία', 'houtōs estin hē basileia', 'G3779/G932', 'So is the kingdom — Mark''s unique parable of growing seed (only here in NT); emphasizes unseen dynamics.', 130),
  (27, 'καθεύδῃ καὶ ἐγείρηται νύκτα καὶ ἡμέραν', 'katheudē kai egeirētai nykta kai hēmeran', 'G2518/G1453', 'Sleeps and rises night and day — farmer''s non-intervention; seed works by latent internal power.', 131),
  (27, 'ὡς οὐκ οἶδεν αὐτός', 'hōs ouk oiden autos', 'G1492', 'He himself does not know how — human ignorance of the mechanism is no obstacle to the process.', 132),
  (28, 'αὐτομάτη ἡ γῆ καρποφορεῖ', 'automatē hē gē karpophorei', 'G844/G2592', 'The earth of itself bears fruit — automatē (hapax with this sense): self-acting; kingdom grows by God''s intrinsic power, not our technique.', 133),
  (28, 'πρῶτον χόρτον, εἶτα στάχυν', 'prōton chorton, eita stachyn', 'G5528/G4719', 'First blade, then ear — biological stages; God''s kingdom unfolds in observable but ungovernable phases.', 134),
  (29, 'εὐθὺς ἀποστέλλει τὸ δρέπανον', 'euthys apostellei to drepanon', 'G649/G1407', 'Immediately sends in the sickle — echoes Joel 3:13; eschatological harvest imagery.', 135),
  (29, 'θερισμός', 'therismos', 'G2326', 'Harvest — standard NT metaphor for final judgment and gathering of the elect (Matt 13:30,39).', 136),
  (30, 'πῶς ὁμοιώσωμεν τὴν βασιλείαν', 'pōs homoiōsōmen tēn basileian', 'G3666', 'How shall we compare the kingdom — rabbinic formula "l''mah hadavar domeh"; pedagogical invitation.', 137),
  (31, 'κόκκος σινάπεως', 'kokkos sinapeōs', 'G2848/G4615', 'Mustard seed — Sinapis nigra; proverbial for smallness (cf. 4th Ezra 4:31); tiny origin, massive growth.', 138),
  (32, 'μεῖζον πάντων τῶν λαχάνων', 'meizon pantōn tōn lachanōn', 'G3187/G3001', 'Greater than all the herbs — within the kitchen-garden class (lachana) mustard reaches 8-10 ft; hyperbolic for rhetoric.', 139),
  (32, 'κατασκηνοῦν τὰ πετεινά', 'kataskēnoun ta peteina', 'G2681/G4071', 'Birds may nest — kataskēnoō: "tabernacle," pitch tent; Dan 4:12 echo, universal kingdom including the nations.', 140),
  (33, 'καθὼς ἠδύναντο ἀκούειν', 'kathōs ēdynanto akouein', 'G2531/G1410/G191', 'As they were able to hear — pedagogical accommodation; parables calibrated to hearers'' capacity.', 141),
  (34, 'χωρὶς παραβολῆς οὐκ ἐλάλει αὐτοῖς', 'chōris parabolēs ouk elalei autois', 'G5565/G2980', 'Did not speak without a parable — generalising summary of public teaching methodology.', 142),
  (34, 'ἐπέλυεν πάντα', 'epelyen panta', 'G1956', 'Explained all things — epilyō: unloose, resolve; private exposition untangles public enigma.', 143),
  (35, 'διέλθωμεν εἰς τὸ πέραν', 'dielthōmen eis to peran', 'G1330/G4008', '"Let us pass over to the other side" — eastern shore; Decapolis; leaves Jewish Galilee for Gentile territory.', 144),
  (37, 'λαῖλαψ ἀνέμου μεγάλη', 'lailaps anemou megalē', 'G2978/G417', 'Great windstorm — lailaps: violent squall, hurricane-type; Galilee prone to sudden downdrafts from surrounding highlands.', 145),
  (38, 'ἐν τῇ πρύμνῃ ἐπὶ τὸ προσκεφάλαιον καθεύδων', 'en tē prymnē epi to proskephalaion katheudōn', 'G4403/G4344/G2518', 'In the stern on the cushion sleeping — specific Markan detail; eyewitness touch (Petrine source); stern held the helmsman''s cushion.', 146),
  (38, 'οὐ μέλει σοι', 'ou melei soi', 'G3199', '"Do you not care?" — anxious reproach from terrified disciples; questions Jesus''s concern, not ability.', 147),
  (39, 'ἐπετίμησεν τῷ ἀνέμῳ', 'epetimēsen tō anemō', 'G2008', 'Rebuked the wind — same verb for exorcism; creation submits to the divine Warrior (Pss 74:13-14; 89:9).', 148),
  (39, 'σιώπα', 'siōpa', 'G4623', '"Silence!" — present imperative; paired with pephimōso (already studied); personified sea treated as demonic chaos.', 149),
  (40, 'τί δειλοί ἐστε', 'ti deiloi este', 'G1169', '"Why are you fearful?" — deilos: timid, cowardly; stronger than phobos; pejorative of the faithless.', 150),
  (41, 'ἐφοβήθησαν φόβον μέγαν', 'ephobēthēsan phobon megan', 'G5399/G5401', 'Feared a great fear — cognate accusative; holy terror replaces natural fear; theological awe.', 151),
  (41, 'τίς ἄρα οὗτός ἐστιν', 'tis ara houtos estin', 'G5101', '"Who then is this?" — open-ended; YHWH alone stills the sea (Ps 107:29); hearers must reach the christological conclusion.', 152)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 4 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Matthew 13:1-2', 100),
  (1, 'Luke 8:4', 101),
  (2, 'Psalm 78:2', 100),
  (2, 'Matthew 13:34-35', 101),
  (3, 'Matthew 13:3', 100),
  (3, 'Isaiah 55:10-11', 101),
  (4, 'Matthew 13:4', 100),
  (5, 'Matthew 13:5-6', 100),
  (7, 'Genesis 3:18', 100),
  (7, 'Jeremiah 4:3', 101),
  (8, 'Genesis 26:12', 100),
  (8, 'Matthew 13:8', 101),
  (9, 'Ezekiel 3:27', 100),
  (9, 'Revelation 2:7', 101),
  (10, 'Matthew 13:10', 100),
  (11, '1 Corinthians 2:10-14', 100),
  (11, 'Colossians 1:26-27', 101),
  (12, 'Isaiah 6:9-10', 100),
  (12, 'John 12:40', 101),
  (12, 'Acts 28:26-27', 102),
  (13, 'Luke 8:11', 100),
  (14, 'Luke 8:11', 100),
  (14, 'James 1:21', 101),
  (14, '1 Peter 1:23', 102),
  (15, '2 Corinthians 4:4', 100),
  (15, 'Matthew 13:19', 101),
  (16, 'Hosea 6:4', 100),
  (17, '2 Timothy 1:15', 100),
  (17, 'John 6:66', 101),
  (17, 'Hebrews 3:12-13', 102),
  (18, 'Matthew 13:22', 100),
  (19, '1 Timothy 6:9-10', 100),
  (19, '1 John 2:15-17', 101),
  (19, 'Luke 12:15', 102),
  (20, 'Hebrews 4:2', 100),
  (20, 'Colossians 1:6', 101),
  (20, 'John 15:5', 102),
  (21, 'Matthew 5:14-16', 100),
  (21, 'Luke 11:33', 101),
  (22, 'Ecclesiastes 12:14', 100),
  (22, 'Luke 12:2-3', 101),
  (22, '1 Corinthians 4:5', 102),
  (23, 'Matthew 13:9', 100),
  (24, 'Matthew 7:2', 100),
  (24, 'Luke 6:38', 101),
  (25, 'Matthew 25:29', 100),
  (25, 'Luke 19:26', 101),
  (26, 'Matthew 13:24', 100),
  (27, 'Ecclesiastes 11:5', 100),
  (28, 'Philippians 1:6', 100),
  (28, '1 Corinthians 3:6-7', 101),
  (29, 'Joel 3:13', 100),
  (29, 'Revelation 14:14-16', 101),
  (30, 'Lamentations 2:13', 100),
  (31, 'Matthew 13:31-32', 100),
  (31, 'Luke 13:18-19', 101),
  (32, 'Daniel 4:12', 100),
  (32, 'Ezekiel 17:22-24', 101),
  (32, 'Ezekiel 31:6', 102),
  (33, 'John 16:12', 100),
  (33, '1 Corinthians 3:1-2', 101),
  (34, 'Matthew 13:36', 100),
  (34, 'John 16:25', 101),
  (35, 'Matthew 8:18', 100),
  (35, 'Luke 8:22', 101),
  (37, 'Matthew 8:24', 100),
  (37, 'Jonah 1:4', 101),
  (38, 'Psalm 44:23', 100),
  (38, 'Matthew 8:25', 101),
  (39, 'Psalm 107:28-29', 100),
  (39, 'Mark 1:25', 101),
  (40, 'Matthew 8:26', 100),
  (40, 'Revelation 21:8', 101),
  (41, 'Job 38:8-11', 100),
  (41, 'Psalm 65:7', 101),
  (41, 'Psalm 89:9', 102)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 4 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
