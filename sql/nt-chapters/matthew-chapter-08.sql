-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 8 — Jesus' Divine Authority, Compassion, and the Cost of Discipleship
-- 34 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'Matthew 8 vividly portrays Jesus'' divine authority and compassion through a series of miraculous healings and exorcisms, immediately following the Sermon on the Mount. The chapter highlights His power over disease (leprosy, paralysis, fever), nature (calming a storm), and demonic forces, fulfilling Isaiah''s prophecy (8:17). It also underscores the radical demands of discipleship, challenging potential followers to prioritize Christ above worldly comforts or even familial obligations. The narrative culminates in a dramatic encounter with demon-possessed men, revealing the spiritual conflict inherent in Jesus'' ministry and the mixed reactions of awe and rejection from those who witness His power, foreshadowing the expansion of the Kingdom beyond traditional Israelite boundaries.',
  'Jesus'' Divine Authority, Compassion, and the Cost of Discipleship',
  'πίστις (pistis)',
  'Derived from ''peithō'' (to persuade), ''pistis'' signifies conviction, trust, and reliance. In Matthew 8, it is central to the centurion''s extraordinary request and Jesus'' commendation, contrasting sharply with the disciples'' ''little faith'' during the storm. It denotes a confident dependence on God''s power and word, which is presented as essential for receiving divine intervention and entering the Kingdom of Heaven.',
  '["Section 1 (vv.1-4): The Cleansing of a Leper","Section 2 (vv.5-13): The Healing of the Centurion''s Servant","Section 3 (vv.14-17): Healings at Peter''s House and Fulfillment of Prophecy","Section 4 (vv.18-22): The Cost of Following Jesus","Section 5 (vv.23-27): Jesus Calms the Storm","Section 6 (vv.28-34): The Exorcism of the Gadarene Demoniacs"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 34 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'When he was come down from the mountain, great multitudes followed him.',
   'Καταβάντος δὲ αὐτοῦ ἀπὸ τοῦ ὄρους ἠκολούθησαν αὐτῷ ὄχλοι πολλοί.',
   'Katabantos de autou apo tou orous ēkolouthēsan autō ochloi polloi.',
   'This verse marks a transition from Jesus'' teaching ministry on the mountain (Sermon on the Mount, Matt 5-7) to His active ministry of healing and demonstration of authority. The ''great multitudes'' (ὄχλοι πολλοί) indicate the widespread impact of His teachings and the growing public interest in His person and work. Their following signifies a desire to witness more of His power and hear more of His words, setting the stage for the miracles that follow.',
   NULL),
  (2,
   'And, behold, there came a leper and worshipped him, saying, Lord, if thou wilt, thou canst make me clean.',
   'Καὶ ἰδοὺ λεπρὸς προσελθὼν προσεκύνει αὐτῷ λέγων· Κύριε, ἐὰν θέλῃς, δύνασαί με καθαρίσαι.',
   'Kai idou lepros proselthōn prosekunei autō legōn: Kyrie, ean thelēs, dynasai me katharisai.',
   'A leper approaches Jesus, an act forbidden by Mosaic law due to the contagious and ceremonially unclean nature of leprosy (Lev 13:45-46). His worship (προσεκύνει) indicates profound reverence and recognition of Jesus'' divine authority. The leper''s plea, ''Lord, if thou wilt, thou canst make me clean,'' expresses both humility and absolute confidence in Jesus'' power, while acknowledging His sovereign will. This sets a pattern for faith in Jesus'' ability to heal.',
   'This encounter highlights Jesus'' unique authority over disease and His willingness to engage with the marginalized. The leper''s faith, expressed in ''if thou wilt, thou canst,'' demonstrates a proper understanding of divine sovereignty and power. Jesus'' subsequent action reveals His compassionate will to heal and cleanse, signifying His role as the Great Physician who can purify both body and soul.'),
  (3,
   'And Jesus put forth his hand, and touched him, saying, I will; be thou clean. And immediately his leprosy was cleansed.',
   'καὶ ἐκτείνας τὴν χεῖρα ἥψατο αὐτοῦ λέγων· Θέλω, καθαρίσθητι. καὶ εὐθέως ἐκαθαρίσθη αὐτοῦ ἡ λέπρα.',
   'kai ekteinas tēn cheira hēpsato autou legōn: Thelō, katharisthēti. kai eutheōs ekatharisthē autou hē lepra.',
   'Jesus'' act of touching the leper was revolutionary and counter-cultural. Under Mosaic law, touching a leper would make one ceremonially unclean (Lev 5:3). However, Jesus'' touch did not defile Him; instead, His purity and power cleansed the leper. His words, ''I will; be thou clean,'' demonstrate His divine will and authority, not merely a request to God. The immediate cleansing (''εὐθέως'') underscores the supernatural nature of the miracle.',
   'Jesus'' touch and immediate cleansing of the leper reveal His divine power to overcome sin and impurity, not just physical ailment. He does not become unclean by touching the unclean; rather, His holiness purifies. This act foreshadows His redemptive work, where He takes on humanity''s defilement to offer cleansing and new life, demonstrating His compassionate will to heal and restore.'),
  (4,
   'And Jesus saith unto him, See thou tell no man; but go thy way, shew thyself to the priest, and offer the gift that Moses commanded, for a testimony unto them.',
   'καὶ λέγει αὐτῷ ὁ Ἰησοῦς· Ὅρα μηδενὶ εἴπῃς, ἀλλὰ ὕπαγε σεαυτὸν δεῖξον τῷ ἱερεῖ καὶ προσένεγκον τὸ δῶρον ὃ προσέταξεν Μωϋσῆς εἰς μαρτύριον αὐτοῖς.',
   'kai legei autō ho Iēsous: Hora mēdeni eipēs, alla hypage seauton deixon tō hierei kai prosenenkon to dōron ho prosetaxen Mōysēs eis martyrion autois.',
   'Jesus'' instruction to ''tell no man'' (the ''Messianic secret'') served several purposes: to manage public expectations, prevent premature opposition, and allow His ministry to unfold according to God''s timing. The command to show himself to the priest and offer the prescribed gift (Lev 14:1-32) affirmed the Mosaic Law and provided official verification of the healing, serving as a ''testimony'' (μαρτύριον) to the religious authorities of Jesus'' power and the dawning of the Kingdom.',
   NULL),
  (5,
   'And when Jesus was entered into Capernaum, there came unto him a centurion, beseeching him,',
   'Εἰσελθόντος δὲ αὐτοῦ εἰς Καφαρναοὺμ προσῆλθεν αὐτῷ ἑκατόνταρχος παρακαλῶν αὐτὸν',
   'Eiselthontos de autou eis Kaphernaoum prosēlthen autō hekatontarchos parakalōn auton',
   'Capernaum was Jesus'' adopted home base during His Galilean ministry. The centurion, a Roman officer commanding 100 soldiers, was a Gentile, making his approach to Jesus significant. His ''beseeching'' (παρακαλῶν) indicates earnest pleading, highlighting his humility and desperation. This interaction immediately follows the healing of a Jew, demonstrating Jesus'' compassion extends beyond ethnic boundaries, a theme that will be further developed.',
   NULL),
  (6,
   'And saying, Lord, my servant lieth at home sick of the palsy, grievously tormented.',
   'καὶ λέγων· Κύριε, ὁ παῖς μου βέβληται ἐν τῇ οἰκίᾳ παραλυτικός, δεινῶς βασανιζόμενος.',
   'kai legōn: Kyrie, ho pais mou beblētai en tē oikia paralytikos, deinōs basanizomenos.',
   'The centurion''s concern for his servant (παῖς) reveals a compassionate character, unusual for a Roman officer of that era. The servant is ''sick of the palsy'' (παραλυτικός), likely severe paralysis, and ''grievously tormented'' (δεινῶς βασανιζόμενος), suggesting intense suffering. The centurion''s plea is not for himself, but for another, demonstrating a selfless love that Jesus often commended. This sets the stage for a remarkable display of faith.',
   NULL),
  (7,
   'And Jesus saith unto him, I will come and heal him.',
   'καὶ λέγει αὐτῷ [ὁ Ἰησοῦς]· Ἐγὼ ἐλθὼν θεραπεύσω αὐτόν.',
   'kai legei autō [ho Iēsous]: Egō elthōn therapeusō auton.',
   'Jesus'' immediate response, ''I will come and heal him,'' demonstrates His readiness to extend grace and healing, even to a Gentile. This direct affirmation contrasts with the leper''s ''if thou wilt'' (Matt 8:2), showing Jesus'' clear intention. His willingness to enter a Gentile''s house would have been culturally scandalous for many Jews, further highlighting His boundary-breaking compassion and mission.',
   NULL),
  (8,
   'The centurion answered and said, Lord, I am not worthy that thou shouldest come under my roof: but speak the word only, and my servant shall be healed.',
   'ἀποκριθεὶς δὲ ὁ ἑκατόνταρχος ἔφη· Κύριε, οὐκ εἰμὶ ἱκανὸς ἵνα μου ὑπὸ τὴν στέγην εἰσέλθῃς· ἀλλὰ μόνον εἰπὲ λόγῳ, καὶ ἰαθήσεται ὁ παῖς μου.',
   'apokritheis de ho hekatontarchos ephē: Kyrie, ouk eimi hikanos hina mou hypo tēn stegēn eiselthēs; alla monon eipe logō, kai iathēsetai ho pais mou.',
   'The centurion''s response reveals extraordinary humility and profound faith. He declares himself ''unworthy'' (οὐκ εἰμὶ ἱκανὸς) for Jesus to enter his home, likely due to his Gentile status and perhaps a sense of personal sinfulness. More significantly, he understands Jesus'' authority to be so absolute that a mere ''word'' (λόγῳ) from a distance is sufficient for healing. This demonstrates a spiritual insight into Jesus'' divine power that surpasses many of Jesus'' Jewish contemporaries.',
   'The centurion''s faith is a profound theological statement. He recognizes Jesus'' word as possessing inherent, sovereign power, capable of healing without physical presence. This understanding of Jesus'' authority, even from a Gentile, serves as a model for faith: trusting in the efficacy of Christ''s command alone, rather than requiring physical proximity or ritual.'),
  (9,
   'For I am a man under authority, having soldiers under me: and I say to this man, Go, and he goeth; and to another, Come, and he cometh; and to my servant, Do this, and he doeth it.',
   'καὶ γὰρ ἐγὼ ἄνθρωπός εἰμι ὑπὸ ἐξουσίαν, ἔχων ὑπ’ ἐμαυτὸν στρατιώτας, καὶ λέγω τούτῳ· Πορεύθητι, καὶ πορεύεται, καὶ ἄλλῳ· Ἔρχου, καὶ ἔρχεται, καὶ τῷ δούλῳ μου· Ποίησον τοῦτο, καὶ ποιεῖ.',
   'kai gar egō anthrōpos eimi hypo exousian, echōn hyp'' emauton stratiōtas, kai legō toutō: Poreuthēti, kai poreuetai, kai allō: Erchou, kai erchetai, kai tō doulō mou: Poiēson touto, kai poiei.',
   'The centurion explains his faith using an analogy from his military experience. He, though ''under authority'' (ὑπὸ ἐξουσίαν) himself, also possesses authority over his soldiers and servants. He understands that commands are obeyed because of the authority behind them, not the physical presence of the commander. He implicitly recognizes Jesus'' authority as even greater, extending over sickness and distance, requiring only a spoken word. This illustrates a deep grasp of spiritual authority.',
   NULL),
  (10,
   'When Jesus heard it, he marvelled, and said to them that followed, Verily I say unto you, I have not found so great faith, no, not in Israel.',
   'ἀκούσας δὲ ὁ Ἰησοῦς ἐθαύμασεν καὶ εἶπεν τοῖς ἀκολουθοῦσιν· Ἀμὴν λέγω ὑμῖν, παρ’ οὐδενὸς τοσαύτην πίστιν ἐν τῷ Ἰσραὴλ εὗρον.',
   'akousas de ho Iēsous ethaumasen kai eipen tois akolouthousin: Amēn legō hymin, par'' oudenos tosautēn pistin en tō Israēl heurōn.',
   'Jesus ''marvelled'' (ἐθαύμασεν), a rare reaction for Him, indicating the profound impact of the centurion''s faith. His declaration, ''Verily I say unto you, I have not found so great faith, no, not in Israel,'' is a stark indictment of the spiritual blindness among many Jews, who had the Law and prophets, yet lacked such trust. This Gentile''s faith becomes a benchmark, highlighting that true faith transcends ethnic and religious boundaries.',
   'Jesus'' commendation of the centurion''s faith, surpassing any He found in Israel, is a pivotal theological statement. It underscores that salvation and divine favor are not based on lineage or religious privilege, but on genuine, humble faith in Christ''s authority. This foreshadows the inclusion of Gentiles into God''s covenant people, a central theme in the New Testament.'),
  (11,
   'And I say unto you, That many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven.',
   'λέγω δὲ ὑμῖν ὅτι πολλοὶ ἀπὸ ἀνατολῶν καὶ δυσμῶν ἥξουσιν καὶ ἀνακλιθήσονται μετὰ Ἀβραὰμ καὶ Ἰσαὰκ καὶ Ἰακὼβ ἐν τῇ βασιλείᾳ τῶν οὐρανῶν·',
   'legō de hymin hoti polloi apo anatōlōn kai dysmōn hēxousin kai anaklithēsontai meta Abraam kai Isaak kai Iakōb en tē basileia tōn ouranōn;',
   'Building on the centurion''s faith, Jesus prophesies the inclusion of ''many from the east and west'' (Gentiles) into the ''kingdom of heaven'' (βασιλείᾳ τῶν οὐρανῶν). To ''sit down with Abraham, Isaac, and Jacob'' (ἀνακλιθήσονται μετὰ Ἀβραὰμ καὶ Ἰσαὰκ καὶ Ἰακὼβ) signifies participation in the messianic banquet, a symbol of full fellowship and inheritance in God''s covenant promises. This expands the scope of God''s saving work beyond ethnic Israel.',
   'This verse is a powerful prophecy of Gentile inclusion into the Kingdom of God, a radical concept for many first-century Jews. It teaches that salvation is not exclusive to the Jewish people but is extended to all who come to Christ in faith, regardless of their origin. This universal invitation to the messianic banquet with the patriarchs highlights the expansive nature of God''s redemptive plan.'),
  (12,
   'But the children of the kingdom shall be cast out into outer darkness: there shall be weeping and gnashing of teeth.',
   'οἱ δὲ υἱοὶ τῆς βασιλείας ἐκβληθήσονται εἰς τὸ σκότος τὸ ἐξώτερον· ἐκεῖ ἔσται ὁ κλαυθμὸς καὶ ὁ βρυγμὸς τῶν ὀδόντων.',
   'hoi de huioi tēs basileias ekblēthēsontai eis to skotos to exōteron; ekei estai ho klauthmos kai ho brygmos tōn odontōn.',
   'In stark contrast to the Gentile inclusion, Jesus warns that ''the children of the kingdom'' (οἱ δὲ υἱοὶ τῆς βασιλείας), referring to those who were ethnically Jewish and presumed heirs of the covenant, will be ''cast out into outer darkness'' (εἰς τὸ σκότος τὸ ἐξώτερον). This phrase, along with ''weeping and gnashing of teeth'' (κλαυθμὸς καὶ ὁ βρυγμὸς τῶν ὀδόντων), is a recurring metaphor in Matthew for eternal judgment and exclusion from God''s presence (Matt 13:42, 50; 22:13; 24:51; 25:30). It emphasizes that privilege without faith leads to condemnation.',
   'This verse presents a sobering warning about the consequences of rejecting Christ despite religious privilege. It teaches that mere lineage or outward association with God''s people is insufficient for salvation. Exclusion from the Kingdom into ''outer darkness'' with ''weeping and gnashing of teeth'' signifies eternal separation from God and profound regret, emphasizing the necessity of personal faith in Jesus.'),
  (13,
   'And Jesus said unto the centurion, Go thy way; and as thou hast believed, so be it done unto thee. And his servant was healed in the selfsame hour.',
   'καὶ εἶπεν ὁ Ἰησοῦς τῷ ἑκατοντάρχῃ· Ὕπαγε, καὶ ὡς ἐπίστευσας γενηθήτω σοι. καὶ ἰάθη ὁ παῖς [αὐτοῦ] ἐν τῇ ὥρᾳ ἐκείνῃ.',
   'kai eipen ho Iēsous tō hekatontarchē: Hypage, kai hōs episteusas genēthētō soi. kai iathē ho pais [autou] en tē hōra ekeinē.',
   'Jesus grants the centurion''s request, linking the healing directly to his faith: ''as thou hast believed, so be it done unto thee.'' This highlights the principle that faith is often the conduit through which God''s power operates. The immediate healing of the servant ''in the selfsame hour'' (ἐν τῇ ὥρᾳ ἐκείνῃ) confirms Jesus'' divine authority and the efficacy of His spoken word, even over distance.',
   'This verse powerfully illustrates the principle that God often responds to faith. Jesus'' words, ''as thou hast believed, so be it done unto thee,'' affirm the active role of faith in receiving divine intervention. It teaches that genuine trust in Christ''s power and authority, as demonstrated by the centurion, is honored by God, resulting in tangible blessings and confirmation of His word.'),
  (14,
   'And when Jesus was come into Peter’s house, he saw his wife’s mother laid, and sick of a fever.',
   'Καὶ ἐλθὼν ὁ Ἰησοῦς εἰς τὴν οἰκίαν Πέτρου εἶδεν τὴν πενθερὰν αὐτοῦ βεβλημένην καὶ πυρέσσουσαν·',
   'Kai elthōn ho Iēsous eis tēn oikian Petrou eiden tēn pentheran autou beblēmenēn kai pyressousan;',
   'Jesus enters Peter''s house, indicating a close relationship with His disciple. The mention of Peter''s ''wife''s mother'' confirms Peter was married, contrary to later traditions of clerical celibacy. She was ''laid, and sick of a fever'' (βεβλημένην καὶ πυρέσσουσαν), likely a severe fever, perhaps malaria, common in the region. This personal act of healing within a disciple''s home demonstrates Jesus'' care for His followers and their families.',
   NULL),
  (15,
   'And he touched her hand, and the fever left her: and she arose, and ministered unto them.',
   'καὶ ἥψατο τῆς χειρὸς αὐτῆς, καὶ ἀφῆκεν αὐτὴν ὁ πυρετός, καὶ ἠγέρθη καὶ διηκόνει αὐτῷ.',
   'kai hēpsato tēs cheiros autēs, kai aphēken autēn ho pyretos, kai ēgerthē kai diēkonei autō.',
   'Similar to the leper, Jesus ''touched her hand'' (ἥψατο τῆς χειρὸς αὐτῆς), and the fever immediately ''left her'' (ἀφῆκεν αὐτὴν ὁ πυρετός). The instantaneous nature of the healing is emphasized by her immediate recovery and ability to ''minister unto them'' (διηκόνει αὐτῷ), serving her guests. This demonstrates not only Jesus'' power over sickness but also the restoration of the individual to full health and service, a common outcome of His miracles.',
   NULL),
  (16,
   'When the even was come, they brought unto him many that were possessed with devils: and he cast out the spirits with his word, and healed all that were sick:',
   'Ὀψίας δὲ γενομένης προσήνεγκαν αὐτῷ δαιμονιζομένους πολλούς· καὶ ἐξέβαλεν τὰ πνεύματα λόγῳ, καὶ πάντας τοὺς κακῶς ἔχοντας ἐθεράπευσεν·',
   'Opsias de genomenēs prosēnenkan autō daimonizomenous pollous; kai exebalen ta pneumata logō, kai pantas tous kakōs echontas etherapeusen;',
   'As evening came, after the Sabbath ended (Mark 1:32), many people brought the sick and demon-possessed to Jesus. This highlights His tireless ministry and the widespread need for healing. Jesus ''cast out the spirits with his word'' (ἐξέβαλεν τὰ πνεύματα λόγῳ), again emphasizing the power of His spoken command, and ''healed all that were sick'' (πάντας τοὺς κακῶς ἔχοντας ἐθεράπευσεν), demonstrating His comprehensive authority over all forms of suffering.',
   'This verse underscores Jesus'' absolute authority over both physical ailments and demonic forces. His ability to cast out spirits ''with His word'' signifies His divine sovereignty over the spiritual realm. The healing of ''all that were sick'' demonstrates His boundless compassion and power, revealing Him as the ultimate source of deliverance and restoration for humanity''s multifaceted suffering.'),
  (17,
   'That it might be fulfilled which was spoken by Esaias the prophet, saying, Himself took our infirmities, and bare our sicknesses.',
   'ὅπως πληρωθῇ τὸ ῥηθὲν διὰ Ἠσαΐου τοῦ προφήτου λέγοντος· Αὐτὸς τὰς ἀσθενείας ἡμῶν ἔλαβεν καὶ τὰς νόσους ἐβάστασεν.',
   'hopōs plērōthē to rhēthen dia Hēsaiou tou prophētou legontos: Autos tas astheneias hēmōn elaben kai tas nosous ebastasen.',
   'Matthew explicitly connects Jesus'' healing ministry to the fulfillment of Isaiah 53:4. The prophet Esaias (Isaiah) foretold that the Suffering Servant would ''take our infirmities, and bear our sicknesses.'' While Isaiah 53 primarily speaks of Christ bearing the spiritual burden of sin, Matthew applies it here to His physical healing ministry, showing that His redemptive work encompasses both spiritual and physical suffering. This demonstrates Jesus'' identity as the promised Messiah.',
   'This fulfillment of Isaiah 53:4 is profoundly significant. It reveals that Jesus'' redemptive work is comprehensive, addressing both the spiritual root of sin and its physical manifestations in sickness and suffering. By bearing our infirmities, Christ demonstrates His empathy and power, offering a foretaste of the complete restoration that will come in the new heavens and new earth, where all suffering will be abolished.'),
  (18,
   'Now when Jesus saw great multitudes about him, he gave commandment to depart unto the other side.',
   'Ἰδὼν δὲ ὁ Ἰησοῦς ὄχλον περὶ αὐτὸν ἐκέλευσεν ἀπελθεῖν εἰς τὸ πέραν.',
   'Idōn de ho Iēsous ochlon peri auton ekeleusen apelthein eis to peran.',
   'Jesus, seeing the ''great multitudes'' (ὄχλον) still surrounding Him, gives a command to ''depart unto the other side'' (εἰς τὸ πέραν) of the Sea of Galilee. This decision might have been to escape the crowds, find a quieter place for teaching His disciples, or to avoid being pressured into a political messianic role. It also sets the stage for the next series of events, including the calming of the storm and the exorcism in Gentile territory.',
   NULL),
  (19,
   'And a certain scribe came, and said unto him, Master, I will follow thee whithersoever thou goest.',
   'Καὶ προσελθὼν εἷς γραμματεὺς εἶπεν αὐτῷ· Διδάσκαλε, ἀκολουθήσω σοι ὅπου ἐὰν ἀπέρχῃ.',
   'Kai proselthōn heis grammateus eipen autō: Didaskale, akolouthēsō soi hopou ean aperchē.',
   'A ''scribe'' (γραμματεὺς), a learned expert in Jewish law, expresses a desire to follow Jesus. This is notable as scribes were often antagonistic towards Jesus. His declaration, ''Master, I will follow thee whithersoever thou goest,'' seems enthusiastic, but Jesus'' response will test the depth of his commitment. He may have been attracted by Jesus'' power or popularity, without fully grasping the cost of discipleship.',
   NULL),
  (20,
   'And Jesus saith unto him, The foxes have holes, and the birds of the air have nests; but the Son of man hath not where to lay his head.',
   'καὶ λέγει αὐτῷ ὁ Ἰησοῦς· Αἱ ἀλώπεκες φωλεοὺς ἔχουσιν καὶ τὰ πετεινὰ τοῦ οὐρανοῦ κατασκηνώσεις, ὁ δὲ Υἱὸς τοῦ ἀνθρώπου οὐκ ἔχει ποῦ τὴν κεφαλὴν κλίνῃ.',
   'kai legei autō ho Iēsous: Hai alōpekes phōleous echousin kai ta peteina tou ouranou kataskēnōseis, ho de Huios tou anthrōpou ouk echei pou tēn kephalēn klinē.',
   'Jesus'' response to the scribe is a stark warning about the cost of discipleship. He identifies Himself as the ''Son of man'' (Υἱὸς τοῦ ἀνθρώπου), a title emphasizing both His humanity and His messianic, authoritative role (Dan 7:13-14). His statement, ''hath not where to lay his head,'' reveals His itinerant, humble, and often homeless existence. Following Jesus means forsaking worldly security and comfort, a challenge to the scribe''s potential expectations of prestige or material gain.',
   'This verse presents a foundational truth about the nature of Christian discipleship: it often entails sacrifice and hardship. Jesus, as the ''Son of Man,'' willingly embraced a life of humility and lack of worldly security. His call to follow Him requires a similar readiness to forsake earthly comforts and prioritize the Kingdom, demonstrating that true commitment to Christ may demand personal cost.'),
  (21,
   'And another of his disciples said unto him, Lord, suffer me first to go and bury my father.',
   'ἕτερος δὲ τῶν μαθητῶν [αὐτοῦ] εἶπεν αὐτῷ· Κύριε, ἐπίτρεψόν μοι πρῶτον ἀπελθεῖν καὶ θάψαι τὸν πατέρα μου.',
   'heteros de tōn mathētōn [autou] eipen autō: Kyrie, epitrepson moi prōton apelthein kai thapsai ton patera mou.',
   'Another ''disciple'' (μαθητῶν) requests permission to ''first go and bury my father.'' While burying one''s parents was a sacred duty in Jewish culture, this phrase could mean either waiting for his father to die and then burying him, or performing the immediate funeral rites. Jesus'' response suggests the former, implying a delay in following Him. The request highlights a conflict between traditional filial duties and the immediate, radical call of Christ.',
   NULL),
  (22,
   'But Jesus said unto him, Follow me; and let the dead bury their dead.',
   'ὁ δὲ Ἰησοῦς λέγει αὐτῷ· Ἀκολούθει μοι, καὶ ἄφες τοὺς νεκροὺς θάψαι τοὺς ἑαυτῶν νεκρούς.',
   'ho de Iēsous legei autō: Akolouthei moi, kai aphes tous nekrous thapsai tous heautōn nekrous.',
   'Jesus'' response, ''Follow me; and let the dead bury their dead,'' is a powerful and challenging hyperbole. It emphasizes the absolute priority of discipleship. The ''dead'' who bury their ''dead'' likely refers to those who are spiritually dead burying those who are physically dead. This radical statement underscores that the call to follow Christ is urgent and takes precedence over all other obligations, even those considered sacred in human society.',
   'This radical command highlights the supreme priority of following Jesus. It teaches that spiritual life in Christ takes precedence over all earthly obligations, even deeply ingrained cultural and familial duties. Jesus calls for an immediate and undivided commitment, emphasizing that the spiritually ''dead'' (unbelievers) can attend to worldly matters, while His true followers are called to eternal priorities.'),
  (23,
   'And when he was entered into a ship, his disciples followed him.',
   'Καὶ ἐμβάντι αὐτῷ εἰς πλοῖον ἠκολούθησαν αὐτῷ οἱ μαθηταὶ αὐτοῦ.',
   'Kai embanti autō eis ploion ēkolouthēsan autō hoi mathētai autou.',
   'Jesus enters a boat, and His disciples follow Him. This simple act of boarding a vessel sets the scene for the next dramatic display of Jesus'' authority. The disciples'' presence indicates their continued commitment, despite the challenging words about the cost of discipleship (Matt 8:19-22). They are about to witness another aspect of their Master''s power.',
   NULL),
  (24,
   'And, behold, there arose a great tempest in the sea, insomuch that the ship was covered with the waves: but he was asleep.',
   'καὶ ἰδοὺ σεισμὸς μέγας ἐγένετο ἐν τῇ θαλάσσῃ, ὥστε τὸ πλοῖον καλύπτεσθαι ὑπὸ τῶν κυμάτων· αὐτὸς δὲ ἐκάθευδεν.',
   'kai idou seismos megas egeneto en tē thalassē, hōste to ploion kalyptein hypo tōn kymatōn; autos de ekatheuden.',
   'A ''great tempest'' (σεισμὸς μέγας, literally ''great shaking'' or earthquake, but here referring to a storm) suddenly arises on the Sea of Galilee, known for its sudden, violent storms due to surrounding mountains. The boat was being ''covered with the waves,'' indicating extreme danger. Jesus, however, was ''asleep'' (ἐκάθευδεν), demonstrating His perfect peace and trust in God''s sovereignty, even amidst chaos.',
   NULL),
  (25,
   'And his disciples came to him, and awoke him, saying, Lord, save us: we perish.',
   'καὶ προσελθόντες ἤγειραν αὐτὸν λέγοντες· Κύριε, σῶσον, ἀπολλύμεθα.',
   'kai proselthontes ēgeiran auton legontes: Kyrie, sōson, apollymetha.',
   'The disciples, many of whom were experienced fishermen, are terrified and believe they are ''perishing'' (ἀπολλύμεθα). Their cry, ''Lord, save us,'' reveals their desperation and their recognition that only Jesus can deliver them from this imminent danger. Despite witnessing His previous miracles, their faith falters in the face of a natural disaster, highlighting human vulnerability and the need for divine intervention.',
   NULL),
  (26,
   'And he saith unto them, Why are ye fearful, O ye of little faith? Then he arose, and rebuked the winds and the sea; and there was a great calm.',
   'καὶ λέγει αὐτοῖς· Τί δειλοί ἐστε, ὀλιγόπιστοι; τότε ἐγερθεὶς ἐπετίμησεν τοῖς ἀνέμοις καὶ τῇ θαλάσσῃ, καὶ ἐγένετο γαλήνη μεγάλη.',
   'kai legei autois: Ti deiloi este, oligopistoi? tote egertheis epetimēsen tois anemois kai tē thalassē, kai egeneto galēnē megalē.',
   'Jesus rebukes His disciples for their ''little faith'' (ὀλιγόπιστοι) and fear (δειλοί). He then ''rebuked the winds and the sea'' (ἐπετίμησεν τοῖς ἀνέμοις καὶ τῇ θαλάσσῃ), using language typically reserved for exorcising demons, implying that even natural forces are subject to His divine will. The immediate and ''great calm'' (γαλήνη μεγάλη) that followed is a powerful demonstration of His absolute sovereignty over creation, a power attributed only to God (Ps 65:7; 89:9).',
   'This miracle profoundly demonstrates Jesus'' divine sovereignty over creation. His ability to rebuke the storm and bring ''great calm'' reveals Him as the Lord of nature, possessing power that only God Himself wields. It also serves as a rebuke to ''little faith,'' reminding believers that even in life''s fiercest storms, Christ''s presence and power are sufficient to bring peace and deliverance.'),
  (27,
   'But the men marvelled, saying, What manner of man is this, that even the winds and the sea obey him!',
   'οἱ δὲ ἄνθρωποι ἐθαύμασαν λέγοντες· Ποταπὸς οὗτός ἐστιν ὅτι καὶ οἱ ἄνεμοι καὶ ἡ θάλασσα ὑπακούουσιν αὐτῷ;',
   'hoi de anthrōpoi ethaumasan legontes: Potapos houtos estin hoti kai hoi anemoi kai hē thalassa hypakouousin autō?',
   'The disciples'' (referred to as ''the men'' here) ''marvelled'' (ἐθαύμασαν) at Jesus'' power, asking, ''What manner of man is this, that even the winds and the sea obey him!'' This rhetorical question highlights their growing realization of Jesus'' unique identity, transcending that of a mere prophet or teacher. It points towards His divine nature, as only the Creator has such authority over creation.',
   NULL),
  (28,
   'And when he was come to the other side into the country of the Gergesenes, there met him two possessed with devils, coming out of the tombs, exceeding fierce, so that no man might pass by that way.',
   'Καὶ ἐλθόντος αὐτοῦ εἰς τὸ πέραν εἰς τὴν χώραν τῶν Γεργεσηνῶν ὑπήντησαν αὐτῷ δύο δαιμονιζόμενοι ἐκ τῶν μνημείων ἐξερχόμενοι, χαλεποὶ λίαν, ὥστε μὴ ἰσχύειν τινὰ παρελθεῖν διὰ τῆς ὁδοῦ ἐκείνης.',
   'Kai elthontos autou eis to peran eis tēn chōran tōn Gergesēnōn hypēntēsan autō dyo daimonizomenoi ek tōn mnēmeiōn exerchomenoi, chalepoi lian, hōste mē ischyen tina parelthein dia tēs hodou ekeinēs.',
   'Jesus arrives in the country of the Gergesenes (or Gadarenes/Gerasenes in other Gospels), a predominantly Gentile region. He is immediately met by ''two possessed with devils'' (δύο δαιμονιζόμενοι) emerging from tombs, a place associated with uncleanness and death. These men were ''exceeding fierce'' (χαλεποὶ λίαν), making the area impassable. This encounter highlights the pervasive power of evil in the world and Jesus'' direct confrontation with it.',
   'This dramatic encounter reveals the reality and malevolence of demonic forces. The demoniacs'' dwelling among tombs and their extreme ferocity underscore the destructive power of evil spirits over human lives. Jesus'' immediate confrontation with them demonstrates His divine authority over the spiritual realm, establishing Him as the ultimate deliverer from Satan''s dominion.'),
  (29,
   'And, behold, they cried out, saying, What have we to do with thee, Jesus, thou Son of God? art thou come hither to torment us before the time?',
   'καὶ ἰδοὺ ἔκραξαν λέγοντες· Τί ἡμῖν καὶ σοί, Υἱὲ τοῦ Θεοῦ; ἦλθες ὧδε πρὸ καιροῦ βασανίσαι ἡμᾶς;',
   'kai idou ekraxan legontes: Ti hēmin kai soi, Huie tou Theou? ēltes hōde pro kairou basanisai hēmas?',
   'The demons immediately recognize Jesus as the ''Son of God'' (Υἱὲ τοῦ Θεοῦ), a title of divine authority, even before the disciples fully grasp it. Their question, ''What have we to do with thee?'' (Τί ἡμῖν καὶ σοί), expresses their fear and antagonism. They also reveal an awareness of a future judgment, asking if Jesus has come to ''torment us before the time,'' indicating their knowledge of an appointed time for their ultimate punishment (Jude 1:6; Rev 20:1-3).',
   'This verse offers profound insights into demonology. The demons'' immediate recognition of Jesus as the ''Son of God'' affirms His divine identity and authority. Their fear of being ''tormented before the time'' reveals their knowledge of a future judgment and their ultimate defeat, confirming the biblical teaching of a fixed eschatological destiny for evil spirits.'),
  (30,
   'And there was a good way off from them an herd of many swine feeding.',
   'ἦν δὲ μακρὰν ἀπ’ αὐτῶν ἀγέλη χοίρων πολλῶν βοσκομένη.',
   'ēn de makran ap'' autōn agelē choirōn pollōn boskomenē.',
   'A ''herd of many swine'' (ἀγέλη χοίρων πολλῶν) was feeding nearby. Swine were unclean animals according to Jewish law (Lev 11:7), and raising them was forbidden for Jews. Their presence in this region further confirms it as Gentile territory, where such practices were common. This detail becomes crucial for the demons'' subsequent request.',
   NULL),
  (31,
   'So the devils besought him, saying, If thou cast us out, suffer us to go away into the herd of swine.',
   'οἱ δὲ δαίμονες παρεκάλουν αὐτὸν λέγοντες· Εἰ ἐκβάλλεις ἡμᾶς, ἀπόστειλον ἡμᾶς εἰς τὴν ἀγέλην τῶν χοίρων.',
   'hoi de daimones parekaloun auton legontes: Ei ekballeis hēmas, aposteilon hēmas eis tēn agelēn tōn choirōn.',
   'The demons ''besought him'' (παρεκάλουν), pleading with Jesus, acknowledging His power to ''cast us out.'' Their request to be sent into the herd of swine demonstrates their desire to continue their destructive work, even if it means inhabiting animals. This highlights the parasitic and malevolent nature of demonic entities, always seeking a host and an outlet for their evil.',
   NULL),
  (32,
   'And he said unto them, Go. And when they were come out, they went into the herd of swine: and, behold, the whole herd of swine ran violently down a steep place into the sea, and perished in the waters.',
   'καὶ εἶπεν αὐτοῖς· Ὑπάγετε. οἱ δὲ ἐξελθόντες ἀπῆλθον εἰς τοὺς χοίρους· καὶ ἰδοὺ ὥρμησεν πᾶσα ἡ ἀγέλη κατὰ τοῦ κρημνοῦ εἰς τὴν θάλασσαν καὶ ἀπέθανον ἐν τοῖς ὕδασιν.',
   'kai eipen autois: Hypagete. hoi de exelthontes apēlthon eis tous choirous; kai idou hōrmēsen pasa hē agelē kata tou krēmnou eis tēn thalassan kai apethanon en tois hydasin.',
   'Jesus grants the demons'' request with a single word, ''Go'' (Ὑπάγετε). The immediate and violent reaction of the swine, rushing ''down a steep place into the sea'' and perishing, demonstrates the destructive power of the demons and the sheer number of them (Mark and Luke mention a ''legion''). This event serves as a visible proof of the exorcism and the demons'' malevolent nature, preferring self-destruction over submission to Christ.',
   'This event dramatically illustrates the destructive nature of demonic power. The immediate and violent self-destruction of the swine confirms that demons are inherently malevolent and seek to destroy. Jesus'' permission for them to enter the swine, resulting in their demise, underscores His absolute control over evil forces, even allowing them to expose their true nature and power.'),
  (33,
   'And they that kept them fled, and went their ways into the city, and told every thing, and what was befallen to the possessed of the devils.',
   'οἱ δὲ βόσκοντες ἔφυγον, καὶ ἀπελθόντες εἰς τὴν πόλιν ἀπήγγειλαν πάντα καὶ τὰ τῶν δαιμονιζομένων.',
   'hoi de boskontes ephygon, kai apelthontes eis tēn polin apēngeilan panta kai ta tōn daimonizomenōn.',
   'The swineherds, witnessing the terrifying event, ''fled'' (ἔφυγον) and reported ''everything'' (πάντα) in the city, including the fate of the demon-possessed men. Their report would have spread fear and astonishment, leading to the city''s reaction in the next verse. This serves as a testimony to Jesus'' power, even if the response is unexpected.',
   NULL),
  (34,
   'And, behold, the whole city came out to meet Jesus: and when they saw him, they besought him that he would depart out of their coasts.',
   'καὶ ἰδοὺ πᾶσα ἡ πόλις ἐξῆλθεν εἰς συνάντησιν τῷ Ἰησοῦ, καὶ ἰδόντες αὐτὸν παρεκάλεσαν ὅπως μεταβῇ ἀπὸ τῶν ὁρίων αὐτῶν.',
   'kai idou pasa hē polis exēlthen eis synantēsin tō Iēsou, kai idontes auton parekalesan hopōs metabē apo tōn horiōn autōn.',
   'The entire city comes out to meet Jesus, not in welcome, but to ''beseech him that he would depart out of their coasts.'' Their fear of Jesus'' power, perhaps combined with the economic loss of their swine, outweighed any gratitude for the deliverance of the demoniacs. This reaction highlights human resistance to divine power when it disrupts their comfort or material interests, a recurring theme in Jesus'' ministry.',
   'This verse reveals a tragic human response to divine power: rejection born of fear and material concern. Despite witnessing a profound deliverance, the people prioritized their economic loss over the spiritual freedom of the demoniacs. It illustrates how worldly attachments can blind individuals to the saving work of Christ, leading them to ask the very source of salvation to depart from their lives.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 8;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἥψατο', 'hēpsato', 'G680', 'From ''haptō,'' meaning ''to fasten to, to touch.'' In this context, it signifies Jesus'' deliberate physical contact with the leper. This act was revolutionary, as touching a leper made one ceremonially unclean under Mosaic Law (Lev 13:45-46). Jesus'' touch, however, did not defile Him but rather conveyed His purity and healing power, demonstrating His authority over ritual law and disease.', 1),
  ('Θέλω', 'Thelō', 'G2309', 'Meaning ''to will, to wish, to desire.'' Jesus'' emphatic declaration ''I will'' (Θέλω) in response to the leper''s ''if thou wilt'' (Matt 8:2) underscores His divine will and sovereign authority. It is not a prayer or a request to God, but a direct expression of His own power and intention to heal, demonstrating His inherent ability to effect change.', 2),
  ('καθαρίσθητι', 'katharisthēti', 'G2511', 'An aorist imperative, meaning ''be cleansed'' or ''be made clean.'' From ''katharizō,'' meaning ''to cleanse, purify.'' This command highlights the immediate and complete nature of the healing. Leprosy was not just a physical ailment but also carried significant ceremonial and social impurity. Jesus'' command to ''be cleansed'' addresses both the physical disease and the associated ritual defilement, restoring the man to full community and worship.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 3;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἱκανὸς', 'hikanos', 'G2425', 'Meaning ''sufficient, adequate, competent, worthy.'' The centurion''s declaration ''οὐκ εἰμὶ ἱκανὸς'' (''I am not worthy'') expresses profound humility. As a Gentile and a Roman officer, he likely felt a sense of ceremonial uncleanness or personal unworthiness in the presence of a Jewish holy man. This humility is a key component of his great faith, recognizing Jesus'' exalted status.', 1),
  ('στέγην', 'stegēn', 'G4721', 'Meaning ''a roof, a covering.'' The phrase ''ὑπὸ τὴν στέγην'' (''under my roof'') refers to his home. For Jesus to enter a Gentile''s house would have been a significant cultural and religious boundary crossing for many Jews. The centurion''s humility in not wanting to impose this on Jesus, combined with his belief in Jesus'' distant power, further elevates his faith.', 2),
  ('λόγῳ', 'logō', 'G3056', 'The dative form of ''logos,'' meaning ''word, utterance, message.'' The centurion''s request ''μόνον εἰπὲ λόγῳ'' (''only speak the word'') is central to his faith. He understands that Jesus'' spoken word carries inherent power and authority, capable of effecting healing over distance without physical presence. This demonstrates a profound theological insight into Jesus'' divine nature and omnipotence.', 3),
  ('ἰαθήσεται', 'iathēsetai', 'G2390', 'A future passive indicative, meaning ''he shall be healed.'' From ''iaomai,'' meaning ''to heal, cure.'' This word expresses the centurion''s absolute certainty in the outcome if Jesus merely speaks. It reflects his conviction that Jesus'' authority is so complete that the healing is a guaranteed consequence of His command, showcasing his unwavering trust.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 8;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐθαύμασεν', 'ethaumasen', 'G2296', 'An aorist indicative, meaning ''he marvelled, wondered.'' From ''thaumazō.'' Jesus'' act of marvelling is rare in the Gospels and signifies profound astonishment. It highlights the extraordinary nature of the centurion''s faith, which surpassed the expectations even of Jesus, and served as a powerful teaching moment for His disciples and the surrounding crowd.', 1),
  ('πίστιν', 'pistin', 'G4102', 'Accusative form of ''pistis,'' meaning ''faith, trust, belief.'' Jesus'' declaration of ''so great faith'' (τοσαύτην πίστιν) underscores the centurion''s profound conviction in Jesus'' authority and power. This faith is not merely intellectual assent but a confident reliance on Jesus'' ability to act, even from a distance, and is presented as a model for all believers.', 2),
  ('Ἰσραὴλ', 'Israēl', 'G2474', 'Meaning ''Israel,'' referring to the Jewish people, the covenant nation. Jesus'' statement that He had not found such faith ''in Israel'' is a poignant indictment of the spiritual condition of many of His own people. Despite their privileged position as recipients of God''s law and promises, their lack of genuine faith is contrasted with the profound trust of a Gentile, foreshadowing the inclusion of Gentiles into God''s kingdom.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 10;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('υἱοὶ', 'huioi', 'G5207', 'Plural of ''huios,'' meaning ''sons, children.'' The phrase ''οἱ δὲ υἱοὶ τῆς βασιλείας'' (''the children of the kingdom'') refers to those who, by birthright or religious association, were considered natural heirs to God''s covenant promises, primarily the Jewish people. This highlights the tragic irony of their exclusion, as their presumed inheritance did not guarantee their spiritual standing.', 1),
  ('βασιλείας', 'basileias', 'G932', 'Genitive form of ''basileia,'' meaning ''kingdom, reign, royal power.'' Here, ''τῆς βασιλείας'' refers to the Kingdom of Heaven, the realm of God''s rule. The exclusion of the ''children of the kingdom'' from this realm emphasizes that entry is not by ethnic privilege but by genuine faith and obedience to Christ, a central theme in Matthew''s Gospel.', 2),
  ('σκότος', 'skotos', 'G4655', 'Meaning ''darkness.'' The phrase ''εἰς τὸ σκότος τὸ ἐξώτερον'' (''into outer darkness'') is a recurring metaphor in Matthew for eternal judgment and separation from God''s presence. It signifies a place of utter despair, devoid of God''s light and blessing, emphasizing the severity of eternal condemnation for those who reject Christ.', 3),
  ('κλαυθμὸς', 'klauthmos', 'G2805', 'Meaning ''weeping, lamentation.'' This word, paired with ''βρυγμὸς τῶν ὀδόντων'' (''gnashing of teeth''), describes the intense sorrow, regret, and anguish of those cast out of the Kingdom. It is a vivid image of eternal suffering and despair, underscoring the gravity of spiritual rejection and the finality of divine judgment.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 12;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πληρωθῇ', 'plērōthē', 'G4137', 'An aorist passive subjunctive, meaning ''it might be fulfilled.'' From ''plēroō,'' meaning ''to fill, complete, fulfill.'' Matthew frequently uses this phrase to show how Jesus'' life and ministry directly correspond to Old Testament prophecy. Here, Jesus'' healing ministry is presented as the fulfillment of Isaiah 53:4, demonstrating His identity as the Messiah who bears the burdens of humanity.', 1),
  ('ἀσθενείας', 'astheneias', 'G769', 'Accusative plural of ''astheneia,'' meaning ''weakness, infirmity, sickness.'' This refers to human frailty and physical ailments. Matthew''s application of Isaiah 53:4 to Jesus'' healing ministry indicates that Christ''s redemptive work encompasses not only spiritual healing from sin but also the alleviation of physical suffering, demonstrating His comprehensive compassion and power over all human brokenness.', 2),
  ('ἔλαβεν', 'elaben', 'G2983', 'An aorist indicative, meaning ''he took, received.'' From ''lambanō.'' In the context of Isaiah 53:4, this signifies Jesus'' active identification with human suffering. He ''took'' our infirmities not by becoming sick Himself, but by bearing the burden of human suffering through His compassionate healing ministry, demonstrating His empathy and power to overcome disease.', 3),
  ('ἐβάστασεν', 'ebastasen', 'G941', 'An aorist indicative, meaning ''he bore, carried.'' From ''bastazō.'' Similar to ''ἔλαβεν,'' this word emphasizes Jesus'' role in carrying the weight of human sicknesses. While Isaiah 53:4 ultimately points to Christ bearing the penalty of sin, Matthew applies it to His physical healing, showing that His redemptive work extends to alleviating the consequences of a fallen world, including disease and suffering.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 17;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀλώπεκες', 'alōpekes', 'G250', 'Plural of ''alōpēx,'' meaning ''foxes.'' Jesus uses the image of foxes having ''holes'' (φωλεοὺς) to illustrate that even wild animals have a place of refuge and rest. This contrasts sharply with His own lack of a permanent dwelling, emphasizing His itinerant and humble lifestyle as the Son of Man, and the sacrifices required of His followers.', 1),
  ('φωλεοὺς', 'phōleous', 'G5454', 'Accusative plural of ''phōleos,'' meaning ''a den, a lair, a hole.'' This refers to the secure dwelling places of animals. By contrasting this with His own situation, Jesus highlights His voluntary poverty and lack of worldly security. Following Him means embracing a similar detachment from material comforts and a readiness to endure hardship for the sake of the Kingdom.', 2),
  ('Υἱὸς τοῦ ἀνθρώπου', 'Huios tou anthrōpou', 'G5207 G444', 'Meaning ''Son of Man.'' This is Jesus'' most frequent self-designation, emphasizing both His true humanity and His divine, messianic authority as prophesied in Daniel 7:13-14. In this context, it underscores His humble, suffering, and itinerant existence, revealing that the Messiah''s path was one of self-denial rather than worldly power or comfort.', 3),
  ('κεφαλὴν', 'kephalēn', 'G2776', 'Accusative form of ''kephalē,'' meaning ''head.'' The phrase ''οὐκ ἔχει ποῦ τὴν κεφαλὴν κλίνῃ'' (''hath not where to lay his head'') is a poignant expression of Jesus'' homelessness and lack of a secure dwelling. It symbolizes His complete detachment from worldly possessions and comforts, setting a radical standard for discipleship that prioritizes the Kingdom above all earthly securities.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 20;

-- Verse 26
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δειλοί', 'deiloi', 'G1169', 'Plural of ''deilos,'' meaning ''cowardly, timid, fearful.'' Jesus rebukes His disciples for being ''fearful'' (δειλοί) in the face of the storm. This fear indicates a lack of trust in His presence and power, despite having witnessed His previous miracles. It highlights the human tendency to succumb to panic when confronted with overwhelming circumstances, rather than relying on God''s sovereignty.', 1),
  ('ὀλιγόπιστοι', 'oligopistoi', 'G3640', 'Meaning ''of little faith.'' This compound word is used by Jesus to describe His disciples'' wavering trust. Despite being with Jesus and witnessing His power, their faith was insufficient to overcome their fear during the storm. It''s a gentle rebuke, not of no faith, but of insufficient faith, urging them to grow in their reliance on Him.', 2),
  ('ἐπετίμησεν', 'epetimēsen', 'G2008', 'An aorist indicative, meaning ''he rebuked, admonished.'' From ''epitimō.'' Jesus'' ''rebuke'' of the winds and the sea is significant. This term is often used for rebuking demons (Matt 17:18; Mark 1:25), implying that even natural forces are subject to His divine authority. It demonstrates His absolute sovereignty over creation, a power belonging to God alone (Ps 65:7; 89:9).', 3),
  ('γαλήνη', 'galēnē', 'G1055', 'Meaning ''calm, tranquility.'' The immediate and ''great calm'' (γαλήνη μεγάλη) that followed Jesus'' rebuke is a powerful testament to His divine power. It signifies not just the cessation of the storm but a profound peace that only God can command. This miraculous calm serves as a visible sign of Jesus'' authority over all creation, both physical and spiritual.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 26;

-- Verse 29
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔκραξαν', 'ekraxan', 'G2896', 'An aorist indicative, meaning ''they cried out, shrieked.'' From ''krazō.'' The demons'' loud cry indicates their terror and distress in Jesus'' presence. This immediate and involuntary reaction reveals their recognition of His superior power and authority, demonstrating that evil spirits are subject to Christ and cannot withstand His divine presence.', 1),
  ('Υἱὲ τοῦ Θεοῦ', 'Huie tou Theou', 'G5207 G2316', 'Meaning ''Son of God.'' This title, used by the demons, is a profound theological declaration of Jesus'' divine identity. Unlike many humans who struggled to grasp who Jesus was, the demons immediately recognized His divine Sonship and authority. This highlights the spiritual insight of evil forces and their fear of the one who holds ultimate power over them.', 2),
  ('βασανίσαι', 'basanizai', 'G928', 'An aorist infinitive, meaning ''to torment, vex, torture.'' From ''basanizō.'' The demons'' question, ''art thou come hither to torment us before the time?'' reveals their awareness of a future, appointed time of judgment and torment for them. This confirms the biblical teaching that evil spirits have a fixed eschatological destiny and are subject to God''s sovereign timeline for their ultimate punishment (Jude 1:6; Rev 20:1-3).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = 29;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Matthew 5:1', 1),
  (1, 'Mark 3:7', 2),
  (1, 'Luke 6:17', 3),
  (2, 'Mark 1:40-45', 1),
  (2, 'Luke 5:12-16', 2),
  (2, 'Leviticus 13:45-46', 3),
  (3, 'Mark 1:41', 1),
  (3, 'Luke 5:13', 2),
  (3, '2 Kings 5:10-14', 3),
  (4, 'Matthew 9:30', 1),
  (4, 'Mark 1:43-44', 2),
  (4, 'Luke 5:14', 3),
  (4, 'Leviticus 14:2-32', 4),
  (5, 'Luke 7:1-10', 1),
  (5, 'John 4:46-54', 2),
  (6, 'Psalm 107:20', 1),
  (6, 'Acts 10:28', 2),
  (8, 'Luke 7:6-7', 1),
  (8, 'Psalm 107:20', 2),
  (9, 'Luke 7:8', 1),
  (9, 'Ephesians 6:5-7', 2),
  (10, 'Luke 7:9', 1),
  (10, 'Matthew 15:28', 2),
  (11, 'Luke 13:28-29', 1),
  (11, 'Isaiah 2:2-3', 2),
  (11, 'Malachi 1:11', 3),
  (11, 'Romans 11:11-12', 4),
  (12, 'Matthew 13:42', 1),
  (12, 'Matthew 13:50', 2),
  (12, 'Matthew 22:13', 3),
  (12, 'Matthew 24:51', 4),
  (12, 'Matthew 25:30', 5),
  (12, 'Luke 13:28', 6),
  (13, 'Matthew 9:29', 1),
  (13, 'Mark 11:24', 2),
  (13, 'Luke 7:10', 3),
  (14, 'Mark 1:29-31', 1),
  (14, 'Luke 4:38-39', 2),
  (14, '1 Corinthians 9:5', 3),
  (15, 'Mark 1:31', 1),
  (15, 'Luke 4:39', 2),
  (16, 'Mark 1:32-34', 1),
  (16, 'Luke 4:40-41', 2),
  (17, 'Isaiah 53:4', 1),
  (17, '1 Peter 2:24', 2),
  (18, 'Mark 4:35', 1),
  (18, 'Luke 8:22', 2),
  (19, 'Luke 9:57-58', 1),
  (20, 'Luke 9:58', 1),
  (20, 'Daniel 7:13-14', 2),
  (20, '2 Corinthians 8:9', 3),
  (21, 'Luke 9:59-60', 1),
  (22, 'Luke 9:60', 1),
  (22, '1 Kings 19:20', 2),
  (22, 'Philippians 3:7-8', 3),
  (23, 'Mark 4:36', 1),
  (23, 'Luke 8:22', 2),
  (24, 'Mark 4:37-38', 1),
  (24, 'Luke 8:23', 2),
  (25, 'Mark 4:38', 1),
  (25, 'Luke 8:24', 2),
  (25, 'Psalm 107:28', 3),
  (26, 'Matthew 6:30', 1),
  (26, 'Matthew 14:31', 2),
  (26, 'Matthew 16:8', 3),
  (26, 'Mark 4:39', 4),
  (26, 'Luke 8:24', 5),
  (26, 'Psalm 65:7', 6),
  (26, 'Psalm 89:9', 7),
  (27, 'Mark 4:41', 1),
  (27, 'Luke 8:25', 2),
  (27, 'Job 38:8-11', 3),
  (28, 'Mark 5:1-20', 1),
  (28, 'Luke 8:26-39', 2),
  (28, 'Isaiah 65:4', 3),
  (29, 'Mark 5:7', 1),
  (29, 'Luke 8:28', 2),
  (29, 'James 2:19', 3),
  (29, 'Jude 1:6', 4),
  (29, 'Revelation 20:1-3', 5),
  (30, 'Mark 5:11', 1),
  (30, 'Luke 8:32', 2),
  (30, 'Deuteronomy 14:8', 3),
  (31, 'Mark 5:12', 1),
  (31, 'Luke 8:32', 2),
  (32, 'Mark 5:13', 1),
  (32, 'Luke 8:33', 2),
  (33, 'Mark 5:14', 1),
  (33, 'Luke 8:34', 2),
  (34, 'Mark 5:17', 1),
  (34, 'Luke 8:37', 2),
  (34, 'Acts 16:39', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 8 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 8 Complete!
-- 34 verses · 8 key verses with word studies (29 words)
-- Cross-references for 33 verses (92 refs)
-- ═══════════════════════════════════════════════════════