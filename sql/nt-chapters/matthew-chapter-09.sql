-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 9 — Jesus' Authority, Compassion, and Call to Discipleship
-- 38 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'Matthew Chapter 9 presents a vivid tapestry of Jesus'' divine authority, compassionate ministry, and the radical nature of His kingdom. The chapter opens with Jesus demonstrating His power to forgive sins and heal the paralytic, challenging the religious establishment''s understanding of God''s prerogative. It then transitions to the call of Matthew, a tax collector, illustrating Jesus'' mission to seek and save the lost, a theme further emphasized by His dining with ''publicans and sinners'' and His declaration, ''I will have mercy, and not sacrifice.'' Through parables of new cloth and new wine, Jesus signals the incompatibility of His new covenant with old religious forms. The narrative continues with a series of miraculous healings—Jairus''s daughter, the woman with an issue of blood, two blind men, and a mute demoniac—each highlighting the power of faith and Jesus'' dominion over sickness and demonic forces. The chapter concludes with Jesus'' profound compassion for the ''harassed and helpless'' multitudes and His urgent call for laborers in the spiritual harvest, underscoring the expansive need for the Gospel.',
  'Jesus'' Authority, Compassion, and Call to Discipleship',
  'ἐξουσία (exousia)',
  'The Greek word ''exousia'' denotes inherent power, authority, or the right to act. In Matthew 9, it is central to understanding Jesus'' identity, particularly His divine authority to forgive sins (vv. 6, 8) and His power over disease and demons. It signifies not merely ability, but legitimate, God-given prerogative, distinguishing Jesus from human teachers and healers.',
  '["Section 1 (vv.1-8): Jesus'' Authority to Forgive Sins and Heal the Paralytic","Section 2 (vv.9-13): The Call of Matthew and Dining with Sinners","Section 3 (vv.14-17): Questions about Fasting and Parables of Newness","Section 4 (vv.18-26): Healing of Jairus''s Daughter and the Woman with an Issue of Blood","Section 5 (vv.27-34): Healing of Blind Men and a Mute Demoniac","Section 6 (vv.35-38): Jesus'' Compassion and the Call for Laborers"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 38 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And he entered into a ship, and passed over, and came into his own city.',
   'Καὶ ἐμβὰς εἰς πλοῖον διεπέρασεν καὶ ἦλθεν εἰς τὴν ἰδίαν πόλιν.',
   'Kai embas eis ploion dieperasen kai ēlthen eis tēn idian polin.',
   'Jesus'' return ''to his own city'' (Καὶ ἦλθεν εἰς τὴν ἰδίαν πόλιν) refers to Capernaum, which became His primary base of operations after leaving Nazareth (Matt 4:13). This verse marks a transition from the Gadarene region (Matt 8:28-34) back to Jewish territory, setting the stage for further ministry and confrontations with religious leaders. The journey by boat across the Sea of Galilee was a common mode of travel for Jesus and His disciples.',
   NULL),
  (2,
   'And, behold, they brought to him a man sick of the palsy, lying on a bed: and Jesus seeing their faith said unto the sick of the palsy; Son, be of good cheer; thy sins be forgiven thee.',
   'Καὶ ἰδοὺ προσέφερον αὐτῷ παραλυτικὸν ἐπὶ κλίνης βεβλημένον· καὶ ἰδὼν ὁ Ἰησοῦς τὴν πίστιν αὐτῶν εἶπεν τῷ παραλυτικῷ, Θάρσει, τέκνον, ἀφίενταί σου αἱ ἁμαρτίαι.',
   'Kai idou prosepheron autō paralytikon epi klinēs beblēmenon; kai idōn ho Iēsous tēn pistin autōn eipen tō paralytikō, Tharsei, teknon, aphientai sou hai hamartiai.',
   'The paralytic''s friends demonstrate remarkable faith by bringing him to Jesus, likely through a crowded house (cf. Mark 2:4). Jesus, ''seeing their faith'' (ἰδὼν ὁ Ἰησοῦς τὴν πίστιν αὐτῶν), addresses the man''s spiritual need before his physical ailment, declaring, ''Thy sins be forgiven thee'' (ἀφίενταί σου αἱ ἁμαρτίαι). This statement immediately establishes Jesus'' divine authority, as only God can forgive sins (Isa 43:25). The term ''τέκνον'' (teknon, ''child'' or ''son'') conveys tenderness and compassion.',
   'Jesus'' declaration of sin forgiveness highlights His divine authority, a prerogative belonging solely to God. This act reveals Jesus'' true identity as more than a prophet or healer; He is the Son of God with power over both physical and spiritual maladies. It underscores the interconnectedness of sin and suffering, and the ultimate need for spiritual healing.'),
  (3,
   'And, behold, certain of the scribes said within themselves, This man blasphemeth.',
   'Καὶ ἰδοὺ τινὲς τῶν γραμματέων εἶπον ἐν ἑαυτοῖς, Οὗτος βλασφημεῖ.',
   'Kai idou tines tōn grammateōn eipon en heautois, Houtos blasphēmei.',
   'The scribes, experts in the Mosaic Law, immediately recognize the theological implications of Jesus'' statement. To them, only God could forgive sins, so Jesus'' claim constituted blasphemy (βλασφημεῖ), a capital offense under Jewish law (Lev 24:16). Their internal accusation reveals their rigid adherence to tradition and their inability to comprehend Jesus'' divine nature. This marks the beginning of significant opposition to Jesus'' ministry.',
   'The scribes'' accusation of blasphemy reveals a fundamental misunderstanding of Jesus'' identity. Their legalistic framework could not accommodate a human figure claiming divine prerogatives. This incident underscores the tension between human religious systems and the radical, incarnate presence of God in Christ, who alone possesses authority to forgive sins.'),
  (4,
   'And Jesus knowing their thoughts said, Wherefore think ye evil in your hearts?',
   'Καὶ ἰδὼν ὁ Ἰησοῦς τὰς ἐνθυμήσεις αὐτῶν εἶπεν, Ἱνατί ἐνθυμεῖσθε πονηρὰ ἐν ταῖς καρδίαις ὑμῶν;',
   'Kai idōn ho Iēsous tas enthymēseis autōn eipen, Hinati enthymeisthe ponēra en tais kardiais hymōn?',
   'Jesus'' ability to perceive the scribes'' unspoken thoughts (ἰδὼν ὁ Ἰησοῦς τὰς ἐνθυμήσεις αὐτῶν) is a clear demonstration of His omniscience, a divine attribute. He challenges their ''evil thoughts'' (πονηρὰ ἐν ταῖς καρδίαις ὑμῶν), exposing their hypocrisy and the spiritual blindness that prevented them from recognizing God''s work. This act further asserts His divine authority and knowledge, confronting their internal accusations directly.',
   'Jesus'' discernment of the scribes'' thoughts affirms His divine omniscience, a characteristic of God alone. This ability to know the human heart reveals that Jesus sees beyond outward appearances to the inner motivations and spiritual condition of individuals, demonstrating His comprehensive authority and insight.'),
  (5,
   'For whether is easier, to say, Thy sins be forgiven thee; or to say, Arise, and walk?',
   'Τί γὰρ ἔστιν εὐκοπώτερον, εἰπεῖν, Ἀφίενταί σου αἱ ἁμαρτίαι, ἢ εἰπεῖν, Ἔγειρε καὶ περιπάτει;',
   'Ti gar estin eukopotēron, eipein, Aphientai sou hai hamartiai, ē eipein, Egeire kai peripatei?',
   'Jesus poses a rhetorical question, highlighting the perceived difficulty of each command. While forgiving sins is invisible and thus ''easier'' to claim without immediate proof, healing a paralytic is a visible, undeniable miracle. Jesus implies that if He has the power to perform the visible miracle, it serves as tangible proof of His authority to perform the invisible, greater miracle of sin forgiveness. This links physical healing to spiritual authority.',
   NULL),
  (6,
   'But that ye may know that the Son of man hath power on earth to forgive sins, (then saith he to the sick of the palsy,) Arise, take up thy bed, and go unto thine house.',
   'Ἵνα δὲ εἰδῆτε ὅτι ἐξουσίαν ἔχει ὁ Υἱὸς τοῦ ἀνθρώπου ἐπὶ τῆς γῆς ἀφιέναι ἁμαρτίας—τότε λέγει τῷ παραλυτικῷ, Ἐγερθεὶς ἆρόν σου τὴν κλίνην καὶ ὕπαγε εἰς τὸν οἶκόν σου.',
   'Hina de eidēte hoti exousian echei ho Huios tou anthrōpou epi tēs gēs aphienai hamartias—tote legei tō paralytikō, Egertheis aron sou tēn klinēn kai hypage eis ton oikon sou.',
   'Jesus explicitly states His purpose: ''that ye may know that the Son of man hath power on earth to forgive sins'' (ὅτι ἐξουσίαν ἔχει ὁ Υἱὸς τοῦ ἀνθρώπου ἐπὶ τῆς γῆς ἀφιέναι ἁμαρτίας). The title ''Son of Man'' (Υἱὸς τοῦ ἀνθρώπου) is significant, drawing from Daniel 7:13-14, where it refers to a divine, authoritative figure. Jesus uses this title to assert His unique, divinely appointed authority on earth, validated by the immediate physical healing that follows His command.',
   'This verse is a cornerstone for understanding Jesus'' messianic identity and authority. His use of ''Son of Man'' (a title with both human and divine connotations) coupled with the claim of ''power on earth to forgive sins'' unequivocally asserts His divine prerogative. The subsequent healing serves as empirical proof of this spiritual authority, demonstrating His unique role as Savior and Lord.'),
  (7,
   'And he arose, and departed to his house.',
   'Καὶ ἐγερθεὶς ἀπῆλθεν εἰς τὸν οἶκον αὐτοῦ.',
   'Kai egertheis apēlthen eis ton oikon autou.',
   'The immediate and complete healing of the paralytic serves as undeniable proof of Jesus'' authority. The man''s ability to ''arise and depart to his house'' (ἐγερθεὶς ἀπῆλθεν εἰς τὸν οἶκον αὐτοῦ) with his bed demonstrates the miraculous nature of the event, leaving no room for doubt regarding Jesus'' power. This physical restoration validates Jesus'' earlier claim of spiritual authority.',
   NULL),
  (8,
   'But when the multitudes saw it, they marvelled, and glorified God, which had given such power unto men.',
   'Ἰδόντες δὲ οἱ ὄχλοι ἐφοβήθησαν καὶ ἐδόξασαν τὸν Θεὸν τὸν δόντα ἐξουσίαν τοιαύτην τοῖς ἀνθρώποις.',
   'Idontes de hoi ochloi ephobēthēsan kai edoxasan ton Theon ton donta exousian toiautēn tois anthrōpois.',
   'The multitudes'' reaction is a mix of fear and awe (ἐφοβήθησαν καὶ ἐδόξασαν). They ''glorified God'' (ἐδόξασαν τὸν Θεὸν), acknowledging the divine source of this power. However, their understanding is still limited, as they perceive this ''power'' (ἐξουσίαν) as given ''unto men'' (τοῖς ἀνθρώποις) in a general sense, rather than recognizing Jesus'' unique divine identity. This highlights the gradual revelation of Jesus'' full nature.',
   'The crowd''s response, glorifying God for giving ''such power unto men,'' reflects a partial understanding. While they acknowledge divine power, they don''t fully grasp that this power resides uniquely in Jesus as the Son of God. This foreshadows the ongoing challenge of recognizing Christ''s full deity, even amidst undeniable miracles.'),
  (9,
   'And as Jesus passed forth from thence, he saw a man, named Matthew, sitting at the receipt of custom: and he saith unto him, Follow me. And he arose, and followed him.',
   'Καὶ παράγων ὁ Ἰησοῦς ἐκεῖθεν εἶδεν ἄνθρωπον καθήμενον ἐπὶ τὸ τελώνιον, Ματθαῖον λεγόμενον, καὶ λέγει αὐτῷ, Ἀκολούθει μοι. Καὶ ἀναστὰς ἠκολούθησεν αὐτῷ.',
   'Kai paragōn ho Iēsous ekeithen eiden anthrōpon kathēmenon epi to telōnion, Matthaion legomenon, kai legei autō, Akolouthei moi. Kai anastas ēkolouthēsen autō.',
   'Jesus'' call of Matthew (also known as Levi in Mark 2:14 and Luke 5:27) is significant. As a tax collector (τελώνιον), Matthew was despised by Jews for collaborating with Rome and often extorting his own people. Jesus'' direct command, ''Follow me'' (Ἀκολούθει μοι), and Matthew''s immediate obedience (ἀναστὰς ἠκολούθησεν αὐτῷ) demonstrate the transformative power of Jesus'' call, extending grace to those considered outcasts by society and the religious elite.',
   'The call of Matthew exemplifies Jesus'' radical inclusivity and the nature of discipleship. Jesus calls an outcast, demonstrating that His kingdom is open to all who respond in faith, regardless of their past. Matthew''s immediate abandonment of his lucrative profession signifies the total commitment required for following Christ, prioritizing spiritual over material gain.'),
  (10,
   'And it came to pass, as Jesus sat at meat in the house, behold, many publicans and sinners came and sat down with him and his disciples.',
   'Καὶ ἐγένετο αὐτοῦ ἀνακειμένου ἐν τῇ οἰκίᾳ, καὶ ἰδοὺ πολλοὶ τελῶναι καὶ ἁμαρτωλοὶ ἐλθόντες συνανέκειντο τῷ Ἰησοῦ καὶ τοῖς μαθηταῖς αὐτοῦ.',
   'Kai egeneto autou anakeimenou en tē oikia, kai idou polloi telōnai kai hamartōloi elthontes synanekointo tō Iēsou kai tois mathētais autou.',
   'This scene, likely at Matthew''s house (cf. Mark 2:15), shows Jesus dining with ''many publicans and sinners'' (πολλοὶ τελῶναι καὶ ἁμαρτωλοὶ). In Jewish culture, sharing a meal signified fellowship and acceptance. Jesus'' willingness to associate with those considered morally corrupt and ritually unclean was scandalous to the Pharisees, but it was central to His mission of reaching the lost and marginalized.',
   'Jesus'' willingness to share a meal with ''publicans and sinners'' is a profound demonstration of His mission to redeem the lost. This act of fellowship challenged the rigid social and religious boundaries of the day, illustrating that God''s grace extends beyond the ''righteous'' to those in desperate need of repentance and salvation.'),
  (11,
   'And when the Pharisees saw it, they said unto his disciples, Why eateth your Master with publicans and sinners?',
   'Καὶ ἰδόντες οἱ Φαρισαῖοι εἶπον τοῖς μαθηταῖς αὐτοῦ, Διὰ τί μετὰ τῶν τελωνῶν καὶ ἁμαρτωλῶν ἐσθίει ὁ διδάσκαλος ὑμῶν;',
   'Kai idontes hoi Pharisaios eipon tois mathētais autou, Dia ti meta tōn telōnōn kai hamartōlōn esthiei ho didaskalos hymōn?',
   'The Pharisees, known for their strict adherence to the Law and separation from ''sinners,'' question Jesus'' disciples about His behavior. Their question, ''Why eateth your Master with publicans and sinners?'' (Διὰ τί μετὰ τῶν τελωνῶν καὶ ἁμαρτωλῶν ἐσθίει ὁ διδάσκαλος ὑμῶν;), reveals their self-righteousness and their inability to grasp the nature of God''s mercy. They saw Jesus'' actions as defiling, while Jesus saw them as redemptive.',
   NULL),
  (12,
   'But when Jesus heard that, he said unto them, They that be whole need not a physician, but they that are sick.',
   'Ὁ δὲ ἀκούσας εἶπεν, Οὐ χρείαν ἔχουσιν οἱ ἰσχύοντες ἰατροῦ ἀλλʼ οἱ κακῶς ἔχοντες.',
   'Ho de akousas eipen, Ou chreian echousin hoi ischyontes iatrou allʼ hoi kakōs echontes.',
   'Jesus directly answers the Pharisees, using a common proverb: ''They that be whole need not a physician, but they that are sick'' (Οὐ χρείαν ἔχουσιν οἱ ἰσχύοντες ἰατροῦ ἀλλʼ οἱ κακῶς ἔχοντες). He identifies Himself as the divine physician and the ''sinners'' as the spiritually ill who desperately need His healing. This metaphor highlights His mission to those who recognize their spiritual brokenness, in contrast to the self-righteous Pharisees who believed themselves ''whole.''',
   'Jesus'' analogy of the physician underscores His mission to the spiritually sick. It exposes the self-deception of those who believe themselves righteous, while affirming God''s grace for those who acknowledge their sinfulness. True spiritual health comes from recognizing one''s need for Christ, the Great Physician.'),
  (13,
   'But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.',
   'Πορευθέντες δὲ μάθετε τί ἐστιν, Ἔλεος θέλω καὶ οὐ θυσίαν· οὐ γὰρ ἦλθον καλέσαι δικαίους ἀλλὰ ἁμαρτωλοὺς εἰς μετάνοιαν.',
   'Poreuthentes de mathete ti estin, Eleos thelō kai ou thysian; ou gar ēlthen kalesai dikaious alla hamartōlous eis metanoian.',
   'Jesus quotes Hosea 6:6, ''I will have mercy, and not sacrifice'' (Ἔλεος θέλω καὶ οὐ θυσίαν), to rebuke the Pharisees'' misplaced priorities. They emphasized ritualistic sacrifice and external purity over the weightier matters of the Law: justice, mercy, and faithfulness (Matt 23:23). Jesus clarifies His mission: ''I am not come to call the righteous, but sinners to repentance'' (οὐ γὰρ ἦλθον καλέσαι δικαίους ἀλλὰ ἁμαρτωλοὺς εἰς μετάνοιαν). This emphasizes the transformative power of repentance and God''s desire for genuine compassion over mere religious observance.',
   'This verse is a foundational statement of Jesus'' mission. By quoting Hosea, Jesus prioritizes God''s desire for mercy and compassion over rigid adherence to ritual. His call to ''sinners to repentance'' reveals that salvation is for those who acknowledge their need for God''s grace, not for those who rely on self-righteousness or external religious acts.'),
  (14,
   'Then came to him the disciples of John, saying, Why do we and the Pharisees fast oft, but thy disciples fast not?',
   'Τότε προσέρχονται αὐτῷ οἱ μαθηταὶ Ἰωάννου λέγοντες, Διὰ τί ἡμεῖς καὶ οἱ Φαρισαῖοι νηστεύομεν πολλά, οἱ δὲ μαθηταί σου οὐ νηστεύουσιν;',
   'Tote proserchontai autō hoi mathētai Iōannou legontes, Dia ti hēmeis kai hoi Pharisaios nēsteuomen polla, hoi de mathētai sou ou nēsteuousin?',
   'The disciples of John the Baptist, accustomed to ascetic practices, join the Pharisees in questioning Jesus about fasting. Fasting was a common religious practice, especially during times of mourning or repentance. Their question highlights a perceived inconsistency between Jesus'' disciples and other devout groups, again revealing a focus on external religious practices rather than the underlying spiritual reality of Jesus'' presence.',
   NULL),
  (15,
   'And Jesus said unto them, Can the children of the bridechamber mourn, as long as the bridegroom is with them? but the days will come, when the bridegroom shall be taken from them, and then shall they fast.',
   'Καὶ εἶπεν αὐτοῖς ὁ Ἰησοῦς, Μὴ δύνανται οἱ υἱοὶ τοῦ νυμφῶνος πενθεῖν ἐφʼ ὅσον μετʼ αὐτῶν ἐστιν ὁ νυμφίος; Ἐλεύσονται δὲ ἡμέραι ὅταν ἀπαρθῇ ἀπʼ αὐτῶν ὁ νυμφίος, καὶ τότε νηστεύσουσιν.',
   'Kai eipen autois ho Iēsous, Mē dynantai hoi huioi tou nymphōnos penthein ephʼ hoson metʼ autōn estin ho nymphios? Eleusontai de hēmerai hotan aparthē apʼ autōn ho nymphios, kai tote nēsteusousin.',
   'Jesus uses the metaphor of a wedding feast. He is the ''bridegroom'' (ὁ νυμφίος), and His disciples are the ''children of the bridechamber'' (οἱ υἱοὶ τοῦ νυμφῶνος). A wedding is a time of joy and celebration, not mourning or fasting. His presence inaugurates a new era of joy. However, He prophesies a future time when the bridegroom ''shall be taken from them'' (ἀπαρθῇ ἀπʼ αὐτῶν), referring to His crucifixion and ascension, after which fasting would be appropriate as an expression of longing and devotion.',
   'Jesus'' self-identification as the ''bridegroom'' is a significant messianic claim, echoing Old Testament imagery of God as Israel''s husband. His presence brings a new era of joy and fulfillment, making traditional mourning (fasting) inappropriate. This highlights the eschatological ''now'' of the kingdom, while also foreshadowing His departure and the subsequent longing of His church.'),
  (16,
   'No man putteth a piece of new cloth unto an old garment, for that which is put in to fill it up taketh from the garment, and the rent is made worse.',
   'Οὐδεὶς δὲ ἐπιβάλλει ἐπίβλημα ῥάκους ἀγνάφου ἐπὶ ἱματίῳ παλαιῷ· αἴρει γὰρ τὸ πλήρωμα αὐτοῦ ἀπὸ τοῦ ἱματίου, καὶ χεῖρον σχίσμα γίνεται.',
   'Oudeis de epiballei epiblēma rakous agnaphou epi himatiō palaiō; airei gar to plērōma autou apo tou himatiou, kai cheiron schisma ginetai.',
   'This parable illustrates the incompatibility of Jesus'' new teaching with the old, rigid forms of Judaism. ''New cloth'' (ῥάκους ἀγνάφου) would shrink when washed, tearing a ''worse rent'' (χεῖρον σχίσμα) in the ''old garment'' (ἱματίῳ παλαιῷ). Jesus is not merely patching up old religious systems; He is bringing something entirely new that cannot be contained or repaired by the old. This emphasizes the radical nature of the Gospel and the new covenant.',
   'The parable of the new cloth and old garment signifies that Jesus'' teachings represent a radical new covenant that cannot be merely appended to or contained within the old legalistic framework of Judaism. It demands a complete transformation, not a superficial patch-up, highlighting the fundamental shift from law to grace, from external ritual to internal spiritual reality.'),
  (17,
   'Neither do men put new wine into old bottles: else the bottles break, and the wine runneth out, and the bottles perish: but they put new wine into new bottles, and both are preserved.',
   'Οὐδὲ βάλλουσιν οἶνον νέον εἰς ἀσκοὺς παλαιούς· εἰ δὲ μή γε, ῥήγνυνται οἱ ἀσκοί, καὶ ὁ οἶνος ἐκχεῖται καὶ οἱ ἀσκοὶ ἀπόλλυνται· ἀλλὰ βάλλουσιν οἶνον νέον εἰς ἀσκοὺς καινούς, καὶ ἀμφότεροι συντηροῦνται.',
   'Oude ballousin oinon neon eis askous palaious; ei de mē ge, rhēgnuntai hoi askoi, kai ho oinos ekcheitai kai hoi askoi apollyntai; alla ballousin oinon neon eis askous kainous, kai amphoteroi syntērountai.',
   'The second parable reinforces the first. ''New wine'' (οἶνον νέον) ferments and expands, requiring ''new wineskins'' (ἀσκοὺς καινούς) that are flexible. ''Old wineskins'' (ἀσκοὺς παλαιούς) would be brittle and burst, losing both wine and container. This metaphor further stresses that Jesus'' vibrant, expanding message of the kingdom cannot be confined by the rigid, unyielding structures of traditional Judaism. It requires a new, receptive spiritual framework.',
   'This parable further emphasizes the incompatibility of the new covenant with the old. The ''new wine'' represents the dynamic, life-giving power of the Holy Spirit and the Gospel, which requires ''new wineskins''—transformed hearts and flexible spiritual structures—to contain it. Attempting to force new life into old, rigid forms leads to destruction, highlighting the necessity of spiritual renewal.'),
  (18,
   'While he spake these things unto them, behold, there came a certain ruler, and worshipped him, saying, My daughter is even now dead: but come and lay thy hand upon her, and she shall live.',
   'Ταῦτα αὐτοῦ λαλοῦντος αὐτοῖς, ἰδοὺ ἄρχων εἷς ἐλθὼν προσεκύνει αὐτῷ λέγων, Ὅτι ἡ θυγάτηρ μου ἄρτι ἐτελεύτησεν· ἀλλὰ ἐλθὼν ἐπίθες τὴν χεῖρά σου ἐπʼ αὐτήν, καὶ ζήσεται.',
   'Tauta autou lalountos autois, idou archōn heis elthōn prosekunei autō legōn, Hoti hē thygatēr mou arti eteleutēsen; alla elthōn epithes tēn cheira sou epʼ autēn, kai zēsetai.',
   'While Jesus is speaking, a ''ruler'' (ἄρχων), identified as Jairus in Mark 5:22 and Luke 8:41, approaches Him. His act of ''worshipping'' (προσεκύνει) Jesus, despite his high social standing, demonstrates profound humility and desperate faith. He believes in Jesus'' power to raise his daughter, who ''is even now dead'' (ἄρτι ἐτελεύτησεν), from the dead, asking Him to ''lay thy hand upon her, and she shall live'' (ἐπίθες τὴν χεῖρά σου ἐπʼ αὐτήν, καὶ ζήσεται). This highlights the universal need for Jesus'' power, regardless of social status.',
   'The ruler''s act of ''worship'' (προσεκύνει) before Jesus, even in his desperation, signifies a recognition of Jesus'' divine authority and power over life and death. His faith in Jesus'' ability to resurrect his daughter underscores the core Christian belief in Christ''s sovereignty over all creation, including the ultimate enemy, death.'),
  (19,
   'And Jesus arose, and followed him, and so did his disciples.',
   'Καὶ ἐγερθεὶς ὁ Ἰησοῦς ἠκολούθησεν αὐτῷ καὶ οἱ μαθηταὶ αὐτοῦ.',
   'Kai egertheis ho Iēsous ēkolouthēsen autō kai hoi mathētai autou.',
   'Jesus'' immediate response to the ruler''s plea demonstrates His compassion and willingness to minister to those in need. He ''arose, and followed him'' (ἐγερθεὶς ὁ Ἰησοῦς ἠκολούθησεν αὐτῷ), accompanied by His disciples. This swift action underscores Jesus'' readiness to interrupt His teaching to respond to a cry for help, prioritizing human suffering over His own schedule.',
   NULL),
  (20,
   'And, behold, a woman, which was diseased with an issue of blood twelve years, came behind him, and touched the hem of his garment:',
   'Καὶ ἰδοὺ γυνὴ αἱμορροοῦσα δώδεκα ἔτη προσελθοῦσα ὄπισθεν ἥψατο τοῦ κρασπέδου τοῦ ἱματίου αὐτοῦ.',
   'Kai idou gynē haimorroousa dōdeka etē proselthousa opisthen hēpsato tou kraspedou tou himatiou autou.',
   'En route to Jairus''s house, a woman suffering from a chronic ''issue of blood twelve years'' (αἱμορροοῦσα δώδεκα ἔτη) approaches Jesus. Under Mosaic Law (Lev 15:25-27), her condition rendered her perpetually unclean, isolating her from society and making her touch defiling. Her discreet approach, ''came behind him, and touched the hem of his garment'' (ἥψατο τοῦ κρασπέδου τοῦ ἱματίου αὐτοῦ), reflects both her desperation and her understanding of the social implications of her condition.',
   'This woman''s desperate act of touching Jesus'' garment hem, despite her ritual impurity, demonstrates profound faith in His healing power. It highlights that true spiritual connection transcends ceremonial law and social stigma, emphasizing Jesus'' accessibility to all who seek Him with genuine belief, regardless of their outward condition.'),
  (21,
   'For she said within herself, If I may but touch his garment, I shall be whole.',
   'Ἔλεγεν γὰρ ἐν ἑαυτῇ, Ἐὰν μόνον ἅψωμαι τοῦ ἱματίου αὐτοῦ, σωθήσομαι.',
   'Elegen gar en heautē, Ean monon hapsōmai tou himatiou autou, sōthēsomai.',
   'The woman''s internal monologue reveals her deep faith: ''If I may but touch his garment, I shall be whole'' (Ἐὰν μόνον ἅψωμαι τοῦ ἱματίου αὐτοῦ, σωθήσομαι). She believes that even indirect contact with Jesus'' person, through His clothing, possesses sufficient power to heal her. This is not a superstitious act, but an expression of profound trust in Jesus'' unique ability to restore her health, both physically and socially.',
   NULL),
  (22,
   'But Jesus turned him about, and when he saw her, he said, Daughter, be of good comfort; thy faith hath made thee whole. And the woman was made whole from that hour.',
   'Ὁ δὲ Ἰησοῦς στραφεὶς καὶ ἰδὼν αὐτὴν εἶπεν, Θάρσει, θύγατερ, ἡ πίστις σου σέσωκέν σε. Καὶ ἐσώθη ἡ γυνὴ ἀπὸ τῆς ὥρας ἐκείνης.',
   'Ho de Iēsous strapheis kai idōn autēn eipen, Tharsei, thygater, hē pistis sou sesōken se. Kai esōthē hē gynē apo tēs hōras ekeinēs.',
   'Jesus, perceiving the power that went out from Him, turns and addresses the woman directly, calling her ''Daughter'' (θύγατερ), a term of endearment and acceptance. He affirms that ''thy faith hath made thee whole'' (ἡ πίστις σου σέσωκέν σε), emphasizing that her healing was not magical but a direct result of her active trust in Him. The Greek word ''σέσωκέν'' (sesōken) can mean both ''healed'' and ''saved,'' implying a holistic restoration.',
   'Jesus'' declaration, ''thy faith hath made thee whole,'' highlights the pivotal role of faith in receiving God''s grace and healing. This ''wholeness'' (σωθήσομαι) encompasses both physical restoration and spiritual salvation, demonstrating that true healing from Christ addresses the entire person—body, soul, and spirit—through a personal encounter of faith.'),
  (23,
   'And when Jesus came into the ruler’s house, and saw the minstrels and the people making a noise,',
   'Καὶ ἐλθὼν ὁ Ἰησοῦς εἰς τὴν οἰκίαν τοῦ ἄρχοντος καὶ ἰδὼν τοὺς αὐλητὰς καὶ τὸν ὄχλον θορυβούμενον,',
   'Kai elthōn ho Iēsous eis tēn oikian tou archontos kai idōn tous aulētas kai ton ochlon thoryboumenon,',
   'Upon arriving at the ruler''s house, Jesus encounters a scene of professional mourners (''minstrels'' or ''flute players,'' τοὺς αὐλητὰς) and a noisy crowd (τὸν ὄχλον θορυβούμενον). It was customary in Jewish culture to hire professional mourners for funerals, even for children, indicating that the girl''s death was considered certain and irreversible. This sets up a dramatic contrast with Jesus'' impending act.',
   NULL),
  (24,
   'He said unto them, Give place: for the maid is not dead, but sleepeth. And they laughed him to scorn.',
   'ἔλεγεν αὐτοῖς, Ἀναχωρεῖτε· οὐ γὰρ ἀπέθανεν τὸ κοράσιον ἀλλὰ καθεύδει. Καὶ κατεγέλων αὐτοῦ.',
   'Elegen autois, Anachōreite; ou gar apethanen to korasion alla katheudei. Kai kategelōn autou.',
   'Jesus'' statement, ''the maid is not dead, but sleepeth'' (οὐ γὰρ ἀπέθανεν τὸ κοράσιον ἀλλὰ καθεύδει), is a euphemism for death, emphasizing that for Him, death is a temporary state, like sleep, from which He can awaken. The mourners, certain of her death, ''laughed him to scorn'' (κατεγέλων αὐτοῦ), highlighting their unbelief and the stark difference between human perception and divine reality. Their laughter underscores the magnitude of the miracle about to occur.',
   'Jesus'' declaration that the girl ''sleepeth'' rather than ''is dead'' reveals His unique perspective on death, viewing it as a temporary state from which He has the power to awaken. This foreshadows His own resurrection and His ultimate victory over death, offering hope for believers that death is not an end but a transition.'),
  (25,
   'But when the people were put forth, he went in, and took her by the hand, and the maid arose.',
   'Ὅτε δὲ ἐξεβλήθη ὁ ὄχλος, εἰσελθὼν ἐκράτησεν τῆς χειρὸς αὐτῆς, καὶ ἠγέρθη τὸ κοράσιον.',
   'Hote de exeblēthē ho ochlos, eiselthōn ekratēsen tēs cheiros autēs, kai ēgerthē to korasion.',
   'Jesus clears the room of the unbelieving crowd, taking only the girl''s parents and His inner circle (Peter, James, and John, according to Mark 5:37) with Him. He then ''took her by the hand'' (ἐκράτησεν τῆς χειρὸς αὐτῆς), a gesture of intimate contact and authority, and she ''arose'' (ἠγέρθη). This resurrection demonstrates Jesus'' absolute power over death, a power reserved for God alone, confirming His divine identity.',
   'The resurrection of Jairus''s daughter is a powerful demonstration of Jesus'' divine authority over death itself. This miracle, performed intimately and without fanfare, underscores Christ''s life-giving power and His ultimate victory over humanity''s greatest enemy, offering a tangible preview of the general resurrection promised to believers.'),
  (26,
   'And the fame hereof went abroad into all that land.',
   'Καὶ ἐξῆλθεν ἡ φήμη αὕτη εἰς ὅλην τὴν γῆν ἐκείνην.',
   'Kai exēlthen hē phēmē hautē eis holēn tēn gēn ekeinēn.',
   'Despite Jesus'' frequent commands for silence regarding His miracles (e.g., Matt 8:4), the fame of this extraordinary event ''went abroad into all that land'' (εἰς ὅλην τὴν γῆν ἐκείνην). Such a dramatic resurrection could not be contained, further spreading awareness of Jesus'' unique power and identity throughout the region of Galilee.',
   NULL),
  (27,
   'And when Jesus departed thence, two blind men followed him, crying, and saying, Thou son of David, have mercy on us.',
   'Καὶ παράγοντι ἐκεῖθεν τῷ Ἰησοῦ ἠκολούθησαν αὐτῷ δύο τυφλοὶ κράζοντες καὶ λέγοντες, Ἐλέησον ἡμᾶς, Υἱὲ Δαυίδ.',
   'Kai paragonti ekeithen tō Iēsou ēkolouthēsan autō duo typhloi krazontes kai legontes, Eleēson hēmas, Huie Dauid.',
   'As Jesus departs, two blind men follow Him, crying out for mercy. Their address, ''Thou son of David'' (Υἱὲ Δαυίδ), is a significant messianic title, indicating their belief that Jesus is the promised Messiah who would restore sight (Isa 35:5). Their persistent plea for ''mercy'' (Ἐλέησον) reflects their desperate need and their faith in Jesus'' ability to heal them, despite their physical limitation.',
   'The blind men''s cry, ''Son of David,'' is a profound messianic confession, acknowledging Jesus as the promised heir to David''s throne and the long-awaited deliverer. Their faith, expressed through persistent petition, demonstrates a spiritual insight that often eluded the seeing, highlighting that true vision comes from recognizing Christ''s identity.'),
  (28,
   'And when he was come into the house, the blind men came to him: and Jesus saith unto them, Believe ye that I am able to do this? They said unto him, Yea, Lord.',
   'Ἐλθόντι δὲ εἰς τὴν οἰκίαν προσῆλθον αὐτῷ οἱ τυφλοί, καὶ λέγει αὐτοῖς ὁ Ἰησοῦς, Πιστεύετε ὅτι δύναμαι τοῦτο ποιῆσαι; Λέγουσιν αὐτῷ, Ναί, Κύριε.',
   'Elthonti de eis tēn oikian prosēlthon autō hoi typhloi, kai legei autois ho Iēsous, Pisteuete hoti dynamai touto poiēsai? Legousin autō, Nai, Kyrie.',
   'Jesus brings the blind men into a house, perhaps to avoid a public spectacle, and directly challenges their faith: ''Believe ye that I am able to do this?'' (Πιστεύετε ὅτι δύναμαι τοῦτο ποιῆσαι;). Their unequivocal answer, ''Yea, Lord'' (Ναί, Κύριε), confirms their deep conviction in His power. This interaction emphasizes that Jesus often requires an active expression of faith as a prerequisite for His miraculous intervention.',
   'Jesus'' direct question, ''Believe ye that I am able to do this?'' emphasizes the necessity of personal faith in His power. The blind men''s affirmative ''Yea, Lord'' signifies not just intellectual assent but a trust in His divine capacity, demonstrating that faith is the conduit through which God''s miraculous power is often manifested.'),
  (29,
   'Then touched he their eyes, saying, According to your faith be it unto you.',
   'Τότε ἥψατο τῶν ὀφθαλμῶν αὐτῶν λέγων, Κατὰ τὴν πίστιν ὑμῶν γενηθήτω ὑμῖν.',
   'Tote hēpsato tōn ophthalmōn autōn legōn, Kata tēn pistin hymōn genēthētō hymin.',
   'Jesus touches their eyes, a common gesture in healing, and declares, ''According to your faith be it unto you'' (Κατὰ τὴν πίστιν ὑμῶν γενηθήτω ὑμῖν). This reinforces the principle that their faith was instrumental in receiving the miracle. While Jesus'' power is absolute, He often works in conjunction with human faith, making it a key component in the reception of His blessings.',
   'The phrase ''According to your faith be it unto you'' is a powerful theological statement. It highlights that while God''s power is sovereign, He often chooses to act in response to and in proportion to human faith. This principle underscores the active role of belief in receiving divine intervention and spiritual blessings.'),
  (30,
   'And their eyes were opened; and Jesus straitly charged them, saying, See that no man know it.',
   'Καὶ ἀνεῴχθησαν αὐτῶν οἱ ὀφθαλμοί. Καὶ ἐνεβριμήσατο αὐτοῖς ὁ Ἰησοῦς λέγων, Ὁρᾶτε μηδεὶς γινωσκέτω.',
   'Kai aneōchthēsan autōn hoi ophthalmoi. Kai enebrimēsato autois ho Iēsous legōn, Horate mēdeis ginōsketō.',
   'Their eyes ''were opened'' (ἀνεῴχθησαν), confirming the miracle. Jesus then ''straitly charged them'' (ἐνεβριμήσατο αὐτοῖς), a strong command, ''See that no man know it'' (Ὁρᾶτε μηδεὶς γινωσκέτω). This ''Messianic secret'' motif (cf. Mark 1:43-45) is often seen as Jesus managing the public''s perception of His Messiahship, preventing a premature political uprising or misunderstanding of His spiritual mission.',
   NULL),
  (31,
   'But they, when they were departed, spread abroad his fame in all that country.',
   'Οἱ δὲ ἐξελθόντες διεφήμισαν αὐτὸν ἐν ὅλῃ τῇ γῇ ἐκείνῃ.',
   'Hoi de exelthontes diephēmisan auton en holē tē gē ekeinē.',
   'Despite Jesus'' strict command for silence, the healed men ''spread abroad his fame in all that country'' (διεφήμισαν αὐτὸν ἐν ὅλῃ τῇ γῇ ἐκεῖνῃ). Their inability to keep silent reflects the overwhelming joy and gratitude of their healing, but also illustrates the challenge Jesus faced in controlling the narrative of His ministry, particularly regarding His identity and mission.',
   NULL),
  (32,
   'As they went out, behold, they brought to him a dumb man possessed with a devil.',
   'Αὐτῶν δὲ ἐξερχομένων ἰδοὺ προσήνεγκαν αὐτῷ ἄνθρωπον κωφὸν δαιμονιζόμενον.',
   'Autōn de exerchomenōn idou prosēnenkan autō anthrōpon kōphon daimonizomenon.',
   'Immediately after the blind men depart, another case of suffering is presented to Jesus: a ''dumb man possessed with a devil'' (ἄνθρωπον κωφὸν δαιμονιζόμενον). This highlights the relentless stream of human need that Jesus encountered and His continuous ministry of healing and deliverance. The man''s muteness is directly attributed to demonic possession, linking physical affliction to spiritual bondage.',
   NULL),
  (33,
   'And when the devil was cast out, the dumb spake: and the multitudes marvelled, saying, It was never so seen in Israel.',
   'Καὶ ἐκβληθέντος τοῦ δαιμονίου ἐλάλησεν ὁ κωφός· καὶ ἐθαύμασαν οἱ ὄχλοι λέγοντες, Οὐδέποτε ἐφάνη οὕτως ἐν τῷ Ἰσραήλ.',
   'Kai ekblēthentos tou daimoniou elalēsen ho kōphos; kai ethaumasan hoi ochloi legontes, Oudepote ephane houtōs en tō Israēl.',
   'When the demon ''was cast out'' (ἐκβληθέντος τοῦ δαιμονίου), the dumb man immediately ''spake'' (ἐλάλησεν ὁ κωφός). The crowds are astonished, declaring, ''It was never so seen in Israel'' (Οὐδέποτε ἐφάνη οὕτως ἐν τῷ Ἰσραήλ). This exclamation underscores the unprecedented nature of Jesus'' miracles, particularly His authority over demonic forces, which was a clear sign of the arrival of God''s kingdom (Matt 12:28).',
   'The casting out of the demon and the subsequent speech of the mute man powerfully demonstrate Jesus'' authority over evil spiritual forces. The crowd''s astonishment, noting such a display ''never seen in Israel,'' highlights the unique and unprecedented nature of Jesus'' ministry, confirming His divine power and the inauguration of God''s kingdom.'),
  (34,
   'But the Pharisees said, He casteth out devils through the prince of the devils.',
   'Οἱ δὲ Φαρισαῖοι ἔλεγον, Ἐν τῷ ἄρχοντι τῶν δαιμονίων ἐκβάλλει τὰ δαιμόνια.',
   'Hoi de Pharisaios elegon, En tō archonti tōn daimoniōn ekballei ta daimonia.',
   'In stark contrast to the crowd''s awe, the Pharisees attribute Jesus'' power to ''the prince of the devils'' (Ἐν τῷ ἄρχοντι τῶν δαιμονίων), i.e., Beelzebul or Satan. This malicious accusation reveals their hardened hearts and spiritual blindness, refusing to acknowledge the divine source of Jesus'' power. This charge becomes a recurring theme and a serious point of contention (Matt 12:24).',
   'The Pharisees'' accusation that Jesus casts out demons by the ''prince of devils'' is a severe theological error. It demonstrates their spiritual blindness and hardened hearts, attributing divine power to Satan. This rejection of clear evidence of God''s work foreshadows their ultimate rejection of Christ and highlights the danger of willful unbelief.'),
  (35,
   'And Jesus went about all the cities and villages, teaching in their synagogues, and preaching the gospel of the kingdom, and healing every sickness and every disease among the people.',
   'Καὶ περιῆγεν ὁ Ἰησοῦς τὰς πόλεις πάσας καὶ τὰς κώμας, διδάσκων ἐν ταῖς συναγωγαῖς αὐτῶν καὶ κηρύσσων τὸ εὐαγγέλιον τῆς βασιλείας καὶ θεραπεύων πᾶσαν νόσον καὶ πᾶσαν μαλακίαν ἐν τῷ λαῷ.',
   'Kai periēgen ho Iēsous tas poleis pasas kai tas kōmas, didaskōn en tais synagōgais autōn kai kēryssōn to euangelion tēs basileias kai therapeuōn pasan noson kai pasan malakian en tō laō.',
   'This verse provides a summary of Jesus'' extensive Galilean ministry, characterized by three main activities: ''teaching in their synagogues'' (διδάσκων ἐν ταῖς συναγωγαῖς αὐτῶν), ''preaching the gospel of the kingdom'' (κηρύσσων τὸ εὐαγγέλιον τῆς βασιλείας), and ''healing every sickness and every disease'' (θεραπεύων πᾶσαν νόσον καὶ πᾶσαν μαλακίαν). This comprehensive ministry demonstrates His holistic approach to human need, addressing spiritual, intellectual, and physical ailments, all under the banner of the coming kingdom of God.',
   'This summary verse encapsulates Jesus'' holistic ministry: teaching, preaching the Gospel of the Kingdom, and healing. It reveals that the Kingdom of God is not merely a future hope but a present reality breaking into the world through Christ''s words and deeds, demonstrating God''s redemptive power over sin, ignorance, and suffering.'),
  (36,
   'But when he saw the multitudes, he was moved with compassion on them, because they fainted, and were scattered abroad, as sheep having no shepherd.',
   'Ἰδὼν δὲ τοὺς ὄχλους ἐσπλαγχνίσθη περὶ αὐτῶν, ὅτι ἦσαν ἐσκυλμένοι καὶ ἐρριμμένοι ὡσεὶ πρόβατα μὴ ἔχοντα ποιμένα.',
   'Idōn de tous ochlous esplagchnisthē peri autōn, hoti ēsan eskylmenoi kai errimmenoi hōsei probata mē echonta poimena.',
   'Jesus'' profound ''compassion'' (ἐσπλαγχνίσθη) for the multitudes is a key aspect of His character. He sees them as ''fainted, and were scattered abroad, as sheep having no shepherd'' (ἐσκυλμένοι καὶ ἐρριμμένοι ὡσεὶ πρόβατα μὴ ἔχοντα ποιμένα). The terms ''eskylmenoi'' (harassed/distressed) and ''errimmenoi'' (helpless/scattered) paint a picture of people suffering under the burden of religious leaders who failed to truly care for them, leaving them vulnerable and without spiritual guidance (cf. Num 27:17; Ezek 34:5).',
   'Jesus'' deep compassion for the ''harassed and helpless'' multitudes, likened to ''sheep having no shepherd,'' reveals His divine empathy and His role as the Good Shepherd. This highlights the spiritual vacuum created by inadequate religious leadership and underscores the urgent need for true spiritual guidance and care, which only Christ can provide.'),
  (37,
   'Then saith he unto his disciples, The harvest truly is plenteous, but the labourers are few;',
   'Τότε λέγει τοῖς μαθηταῖς αὐτοῦ, Ὁ μὲν θερισμὸς πολὺς, οἱ δὲ ἐργάται ὀλίγοι.',
   'Tote legei tois mathētais autou, Ho men therismos polys, hoi de ergatai oligoi.',
   'Seeing the vast spiritual need, Jesus declares, ''The harvest truly is plenteous, but the labourers are few'' (Ὁ μὲν θερισμὸς πολὺς, οἱ δὲ ἐργάται ὀλίγοι). The ''harvest'' (θερισμὸς) refers to the abundant opportunity for people to enter the kingdom of God, while the ''laborers'' (ἐργάται) are those who proclaim the Gospel. This statement serves as a call to action for His disciples, recognizing the immense spiritual work ahead and the scarcity of those committed to it.',
   'Jesus'' observation that ''the harvest truly is plenteous, but the labourers are few'' is a timeless call to mission. It highlights the vast spiritual need in the world and the disproportionate number of those actively engaged in proclaiming the Gospel. This serves as a perpetual challenge to the Church to pray for and raise up more workers for God''s kingdom.'),
  (38,
   'Pray ye therefore the Lord of the harvest, that he will send forth labourers into his harvest.',
   'Δεήθητε οὖν τοῦ Κυρίου τοῦ θερισμοῦ, ὅπως ἐκβάλῃ ἐργάτας εἰς τὸν θερισμὸν αὐτοῦ.',
   'Deēthēte oun tou Kyriou tou therismou, hopōs ekbalē ergatas eis ton therismon autou.',
   'In response to the great need, Jesus instructs His disciples to ''Pray ye therefore the Lord of the harvest, that he will send forth labourers into his harvest'' (Δεήθητε οὖν τοῦ Κυρίου τοῦ θερισμοῦ, ὅπως ἐκβάλῃ ἐργάτας εἰς τὸν θερισμὸν αὐτοῦ). This command emphasizes that the sending of laborers is ultimately God''s sovereign act, initiated through prayer. It underscores the divine ownership of the mission and the necessity of relying on God to equip and dispatch workers for His purposes.',
   'Jesus'' command to ''Pray ye therefore the Lord of the harvest'' establishes prayer as the primary means by which God raises up and sends forth workers for His kingdom. It reminds believers that the mission is God''s, and our role is to participate through intercession, trusting Him to sovereignly call and equip those needed for the spiritual harvest.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 9;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πίστιν', 'pistis', 'G4102', 'From peithō (to persuade); ''faith'' or ''trust.'' In the New Testament, pistis denotes a firm conviction, a belief in God and Christ, and a reliance upon them. Here, it refers to the active trust demonstrated by the paralytic''s friends, which Jesus acknowledges as instrumental in the healing. It''s not mere intellectual assent but a confident expectation of divine intervention.', 1),
  ('ἀφίενταί', 'aphientai', 'G863', 'Present passive indicative of aphiēmi, meaning ''to send away,'' ''to let go,'' ''to forgive,'' or ''to permit.'' In this context, it signifies the authoritative act of ''forgiving'' or ''remitting'' sins. Jesus'' use of this verb in the passive voice (''thy sins be forgiven thee'') implies that God is the one doing the forgiving, thus asserting Jesus'' divine authority to mediate this forgiveness.', 2),
  ('ἁμαρτίαι', 'hamartiai', 'G266', 'From hamartanō (to miss the mark); ''sins,'' ''errors,'' ''offenses.'' It refers to actions, thoughts, or omissions that fall short of God''s perfect standard, representing a transgression against divine law. In this verse, it highlights the spiritual condition of the paralytic, emphasizing that his greatest need was not just physical healing but spiritual reconciliation with God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 2;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐξουσίαν', 'exousian', 'G1849', 'From exesti (it is lawful); ''authority,'' ''power,'' ''right.'' This word denotes not merely brute strength (dynamis) but legitimate, delegated, or inherent authority. Here, Jesus claims ''exousia'' to forgive sins, a prerogative belonging solely to God, thereby asserting His divine nature and unique role as the Son of Man on earth.', 1),
  ('Υἱὸς τοῦ ἀνθρώπου', 'Huios tou anthrōpou', 'G5207, G444', 'Literally ''Son of Man.'' This is Jesus'' most frequent self-designation, drawing from Daniel 7:13-14. It emphasizes both His true humanity and His divine, eschatological authority as the heavenly figure who will judge and rule. In Matthew 9:6, it underscores His unique, divinely appointed authority to forgive sins on earth, linking His earthly ministry to His ultimate cosmic role.', 2),
  ('ἀφιέναι', 'aphienai', 'G863', 'Present active infinitive of aphiēmi, meaning ''to send away,'' ''to let go,'' ''to forgive.'' Here, it specifically refers to the act of granting forgiveness for sins. Jesus'' claim of ''exousia'' (authority) to ''aphienai'' (forgive) sins is a direct assertion of His divine prerogative, challenging the scribes'' understanding of who alone can forgive.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 6;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἔλεος', 'Eleos', 'G1656', 'From eleos (pity); ''mercy,'' ''compassion,'' ''pity.'' It denotes active compassion that leads to practical help for those in need. Jesus quotes Hosea 6:6 to emphasize that God desires genuine mercy and compassion in human relationships and religious practice more than mere ritualistic sacrifice. It highlights God''s character and the true spirit of the Law.', 1),
  ('θυσίαν', 'thysian', 'G2378', 'From thyō (to sacrifice); ''sacrifice,'' ''offering.'' This refers to the ritualistic animal sacrifices prescribed by the Mosaic Law. Jesus contrasts God''s desire for mercy with the Pharisees'' overemphasis on external, ceremonial sacrifices, implying that their religious practices lacked the true heart of God''s law, which prioritizes love and compassion.', 2),
  ('ἁμαρτωλοὺς', 'hamartōlous', 'G268', 'From hamartanō (to miss the mark); ''sinners,'' ''ungodly.'' This term refers to those who habitually transgress God''s law, often used by the religious elite to categorize and condemn those considered morally or ritually impure. Jesus declares His mission is specifically to call these ''sinners'' to repentance, demonstrating God''s inclusive grace for the lost.', 3),
  ('μετάνοιαν', 'metanoian', 'G3341', 'From metanoeō (to change one''s mind); ''repentance,'' ''a change of mind.'' It signifies a fundamental change of heart, mind, and direction, leading to a turning away from sin and towards God. Jesus'' call to ''sinners to repentance'' emphasizes that His mission is transformative, requiring a genuine inner change rather than mere external conformity.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 13;

-- Verse 22
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πίστις', 'pistis', 'G4102', 'From peithō (to persuade); ''faith,'' ''trust,'' ''conviction.'' Here, it refers to the woman''s confident belief in Jesus'' power to heal her, even through a mere touch of His garment. Jesus affirms that her active, personal faith was the catalyst for her healing, highlighting the importance of individual trust in receiving God''s grace and power.', 1),
  ('σέσωκέν', 'sesōken', 'G4982', 'Perfect active indicative of sōzō, meaning ''to save,'' ''to deliver,'' ''to make whole,'' ''to heal.'' The perfect tense indicates a completed action with ongoing results. In this context, it means her faith has ''made her whole'' or ''healed her,'' implying a complete restoration from her physical ailment, and potentially a spiritual salvation as well, given the holistic nature of Jesus'' ministry.', 2),
  ('θύγατερ', 'thygater', 'G2364', 'Vocative of thugatēr, meaning ''daughter.'' Jesus'' use of this term is a tender and compassionate address, signifying His acceptance and care for the woman who had been an outcast due to her condition. It conveys a sense of belonging and divine affection, restoring her dignity and affirming her worth in God''s eyes.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 22;

-- Verse 27
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἐλέησον', 'Eleēson', 'G1653', 'Aorist active imperative of eleeō, meaning ''to have mercy,'' ''to show pity,'' ''to be compassionate.'' The blind men''s cry for ''mercy'' is a plea for active compassion and help in their desperate state. It acknowledges their dependence on Jesus'' grace and power, recognizing Him as the one capable of alleviating their suffering.', 1),
  ('Υἱὲ Δαυίδ', 'Huie Dauid', 'G5207, G1138', 'Literally ''Son of David.'' This is a significant messianic title, identifying Jesus as the promised descendant of King David who would restore Israel and fulfill the prophecies of a righteous king (2 Sam 7:12-16; Isa 9:6-7). The blind men''s use of this title indicates their belief in Jesus'' messianic identity and His authority to perform miraculous healings.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 27;

-- Verse 36
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐσπλαγχνίσθη', 'esplagchnisthē', 'G4697', 'Aorist passive indicative of splagchnizomai, meaning ''to be moved with compassion,'' ''to feel pity from the bowels/inwards.'' This verb expresses a deep, visceral, gut-wrenching pity. It is used exclusively of Jesus in the Gospels, highlighting His profound empathy and identification with human suffering, driving His actions of healing and teaching.', 1),
  ('ἐσκυλμένοι', 'eskylmenoi', 'G4660', 'Perfect passive participle of skyllō, meaning ''to skin,'' ''to flay,'' ''to trouble,'' ''to harass.'' Here, it describes the multitudes as ''harassed,'' ''distressed,'' or ''weary.'' It conveys a sense of being worn out, troubled, and burdened, likely by the demands of life and the oppressive religious leadership, lacking true spiritual nourishment.', 2),
  ('ἐρριμμένοι', 'errimmenoi', 'G4496', 'Perfect passive participle of rhiptō, meaning ''to throw,'' ''to cast down.'' Here, it describes the multitudes as ''scattered,'' ''helpless,'' or ''thrown down.'' It paints a picture of disarray and vulnerability, like sheep without a shepherd, lacking direction, protection, and care, emphasizing their desperate need for guidance.', 3),
  ('ποιμένα', 'poimena', 'G4166', 'From poimēn, meaning ''shepherd.'' In the biblical context, a shepherd is a protector, guide, and provider for the flock. Jesus'' observation that the multitudes were ''as sheep having no shepherd'' highlights the failure of the religious leaders to care for God''s people, contrasting with Jesus'' own role as the Good Shepherd (John 10:11).', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 36;

-- Verse 37
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θερισμὸς', 'therismos', 'G2326', 'From therizō (to reap); ''harvest,'' ''reaping.'' In this context, it refers metaphorically to the abundant opportunity for spiritual ingathering—the vast number of people ready to hear and respond to the Gospel message. It signifies a critical moment of opportunity for evangelism and discipleship, emphasizing the urgency of the mission.', 1),
  ('ἐργάται', 'ergatai', 'G2040', 'From ergon (work); ''laborers,'' ''workers.'' These are individuals actively engaged in the work of the harvest, referring to those who proclaim the Gospel, teach, and make disciples. Jesus laments the scarcity of such dedicated workers in proportion to the vast spiritual need, underscoring the call for more individuals to commit to ministry.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = 37;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Mark 2:1', 1),
  (1, 'Luke 5:17', 2),
  (1, 'Matt 4:13', 3),
  (2, 'Mark 2:3-5', 1),
  (2, 'Luke 5:18-20', 2),
  (2, 'Acts 3:16', 3),
  (2, 'James 5:15', 4),
  (3, 'Mark 2:6-7', 1),
  (3, 'Luke 5:21', 2),
  (3, 'Isa 43:25', 3),
  (4, 'Mark 2:8', 1),
  (4, 'Luke 5:22', 2),
  (4, 'Ps 139:2', 3),
  (4, 'Heb 4:13', 4),
  (5, 'Mark 2:9', 1),
  (5, 'Luke 5:23', 2),
  (6, 'Mark 2:10-11', 1),
  (6, 'Luke 5:24', 2),
  (6, 'Dan 7:13-14', 3),
  (6, 'John 5:27', 4),
  (7, 'Mark 2:12', 1),
  (7, 'Luke 5:25', 2),
  (8, 'Mark 2:12', 1),
  (8, 'Luke 5:26', 2),
  (8, 'Matt 15:31', 3),
  (9, 'Mark 2:13-14', 1),
  (9, 'Luke 5:27-28', 2),
  (9, 'Matt 10:3', 3),
  (10, 'Mark 2:15', 1),
  (10, 'Luke 5:29', 2),
  (10, 'Matt 11:19', 3),
  (11, 'Mark 2:16', 1),
  (11, 'Luke 5:30', 2),
  (11, 'Matt 21:31-32', 3),
  (12, 'Mark 2:17', 1),
  (12, 'Luke 5:31', 2),
  (12, '1 Tim 1:15', 3),
  (13, 'Hos 6:6', 1),
  (13, 'Matt 12:7', 2),
  (13, 'Luke 19:10', 3),
  (13, 'Rom 5:8', 4),
  (14, 'Mark 2:18', 1),
  (14, 'Luke 5:33', 2),
  (14, 'Matt 6:16', 3),
  (15, 'Mark 2:19-20', 1),
  (15, 'Luke 5:34-35', 2),
  (15, 'John 3:29', 3),
  (15, 'Acts 13:2-3', 4),
  (16, 'Mark 2:21', 1),
  (16, 'Luke 5:36', 2),
  (16, '2 Cor 5:17', 3),
  (17, 'Mark 2:22', 1),
  (17, 'Luke 5:37-38', 2),
  (17, 'Rom 7:6', 3),
  (18, 'Mark 5:22-23', 1),
  (18, 'Luke 8:41-42', 2),
  (18, 'John 11:25', 3),
  (19, 'Mark 5:24', 1),
  (19, 'Luke 8:42', 2),
  (20, 'Mark 5:25-27', 1),
  (20, 'Luke 8:43-44', 2),
  (20, 'Lev 15:25', 3),
  (21, 'Mark 5:28', 1),
  (21, 'Luke 8:48', 2),
  (22, 'Mark 5:30-34', 1),
  (22, 'Luke 8:45-48', 2),
  (22, 'Matt 15:28', 3),
  (23, 'Mark 5:38', 1),
  (23, 'Luke 8:51-52', 2),
  (24, 'Mark 5:39', 1),
  (24, 'Luke 8:52-53', 2),
  (24, 'John 11:11-13', 3),
  (25, 'Mark 5:40-42', 1),
  (25, 'Luke 8:54-55', 2),
  (25, 'Acts 9:40-41', 3),
  (26, 'Mark 5:43', 1),
  (26, 'Luke 8:56', 2),
  (27, 'Matt 15:22', 1),
  (27, 'Matt 20:30-31', 2),
  (27, 'Isa 35:5', 3),
  (27, '2 Sam 7:12-16', 4),
  (28, 'Matt 8:8', 1),
  (28, 'John 11:26', 2),
  (29, 'Matt 8:13', 1),
  (29, 'Matt 15:28', 2),
  (29, 'Mark 10:52', 3),
  (30, 'Matt 8:4', 1),
  (30, 'Mark 1:43-44', 2),
  (30, 'Mark 5:43', 3),
  (31, 'Mark 1:45', 1),
  (31, 'Matt 12:16', 2),
  (32, 'Matt 12:22', 1),
  (32, 'Luke 11:14', 2),
  (33, 'Matt 12:23', 1),
  (33, 'Isa 35:6', 2),
  (34, 'Matt 12:24', 1),
  (34, 'Mark 3:22', 2),
  (34, 'Luke 11:15', 3),
  (35, 'Matt 4:23', 1),
  (35, 'Mark 6:6', 2),
  (35, 'Luke 13:22', 3),
  (35, 'Acts 10:38', 4),
  (36, 'Mark 6:34', 1),
  (36, 'Num 27:17', 2),
  (36, 'Ezek 34:5', 3),
  (36, 'John 10:11-13', 4),
  (37, 'Luke 10:2', 1),
  (37, 'John 4:35', 2),
  (38, 'Luke 10:2', 1),
  (38, 'Acts 13:2-3', 2),
  (38, '1 Cor 3:9', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 9 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 9 Complete!
-- 38 verses · 7 key verses with word studies (21 words)
-- Cross-references for 38 verses (111 refs)
-- ═══════════════════════════════════════════════════════