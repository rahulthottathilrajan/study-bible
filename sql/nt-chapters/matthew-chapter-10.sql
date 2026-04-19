-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 10 — Jesus Commissions the Twelve: Authority, Mission, and Persecution
-- 42 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 10,
  'Matthew 10 is a pivotal chapter detailing Jesus'' commissioning of the twelve apostles for their first missionary journey. It outlines their divine authority to heal and cast out demons, specific instructions regarding their conduct and message ("the kingdom of heaven is at hand"), and warnings about the persecution they will face. The chapter emphasizes the cost of discipleship, the necessity of absolute loyalty to Christ, and the ultimate reward for faithfulness amidst suffering. It serves as a foundational text for understanding Christian mission and the nature of discipleship in a hostile world, highlighting both the power given to believers and the challenges inherent in proclaiming the Gospel. The teachings here prepare the disciples not just for this initial mission, but for the broader work of establishing the Church after Jesus'' ascension, setting a precedent for evangelism and endurance.',
  'Jesus Commissions the Twelve: Authority, Mission, and Persecution',
  'ἀποστέλλω (apostellō)',
  'From ''apo'' (from) and ''stellō'' (to send), ''apostellō'' signifies a sending with a specific commission or authority, making the one sent a representative of the sender. In Matthew 10, it underscores the divine authority and purpose behind Jesus'' dispatch of the twelve, establishing their role as ''apostles'' – those ''sent out'' with a message and power, foundational to their identity and mission.',
  '["Section 1 (vv.1-4): The Commissioning and Naming of the Twelve Apostles","Section 2 (vv.5-15): Instructions for the Mission to Israel","Section 3 (vv.16-23): Warnings of Persecution and Divine Assistance","Section 4 (vv.24-31): Fear God, Not Man: The Value of Disciples","Section 5 (vv.32-33): Confessing Christ Before Men","Section 6 (vv.34-39): The Cost of Discipleship and Division","Section 7 (vv.40-42): Rewards for Receiving and Serving Disciples"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 42 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And when he had called unto him his twelve disciples, he gave them power against unclean spirits, to cast them out, and to heal all manner of sickness and all manner of disease.',
   'Καὶ προσκαλεσάμενος τοὺς δώδεκα μαθητὰς αὐτοῦ ἔδωκεν αὐτοῖς ἐξουσίαν πνευμάτων ἀκαθάρτων ὥστε ἐκβάλλειν αὐτὰ καὶ θεραπεύειν πᾶσαν νόσον καὶ πᾶσαν μαλακίαν.',
   'Kai proskalesamenos tous dōdeka mathētas autou edōken autois exousian pneumatōn akathartōn hōste ekballein auta kai therapeuein pasan noson kai pasan malakian.',
   'Jesus grants His twelve disciples ''power'' (ἐξουσίαν, ''exousian''), signifying delegated authority, not merely inherent strength. This authority is specifically against ''unclean spirits'' (πνευμάτων ἀκαθάρτων) and for healing ''all manner of sickness and disease.'' This initial commissioning demonstrates Jesus'' intention to extend His ministry through His followers, empowering them to perform the same miraculous works He did (cf. Mark 6:7; Luke 9:1). This power is a sign of the Kingdom''s presence and validation of their message.',
   'The bestowal of ''exousia'' on the disciples highlights the divine origin and authority of their mission. It signifies that their ministry is not of human initiative but is empowered by Christ Himself, enabling them to confront spiritual evil and alleviate human suffering as agents of God''s redemptive plan. This authority is a foundational aspect of apostolic ministry.'),
  (2,
   'Now the names of the twelve apostles are these; The first, Simon, who is called Peter, and Andrew his brother; James the son of Zebedee, and John his brother;',
   'Τῶν δὲ δώδεκα ἀποστόλων τὰ ὀνόματα ἔστιν ταῦτα· πρῶτος Σίμων ὁ λεγόμενος Πέτρος καὶ Ἀνδρέας ὁ ἀδελφὸς αὐτοῦ, καὶ Ἰάκωβος ὁ τοῦ Ζεβεδαίου καὶ Ἰωάννης ὁ ἀδελφὸς αὐτοῦ,',
   'Tōn de dōdeka apostolōn ta onomata estin tauta: prōtos Simōn ho legomenos Petros kai Andreas ho adelphos autou, kai Iakōbos ho tou Zebedaiou kai Iōannēs ho adelphos autou,',
   'This verse begins the list of the twelve apostles, a significant moment as they are now formally designated ''apostles'' (ἀποστόλων), meaning ''sent ones.'' Simon Peter is consistently listed first, reflecting his prominent role among the disciples. The inclusion of brothers (Peter and Andrew, James and John) highlights the familial connections within the early group, which would have provided a strong social fabric for their mission. This list is paralleled in Mark 3:16-19 and Luke 6:14-16, with minor variations in names.',
   NULL),
  (3,
   'Philip, and Bartholomew; Thomas, and Matthew the publican; James the son of Alphaeus, and Lebbaeus, whose surname was Thaddaeus;',
   'Φίλιππος καὶ Βαρθολομαῖος, Θωμᾶς καὶ Μαθθαῖος ὁ τελώνης, Ἰάκωβος ὁ τοῦ Ἁλφαίου καὶ Θαδδαῖος,',
   'Philippos kai Bartholomaios, Thōmas kai Matthaios ho telōnēs, Iakōbos ho tou Halphaiou kai Thaddaios,',
   'The list continues, including Philip, Bartholomew (often identified with Nathanael), Thomas, and Matthew. Matthew is notably identified as ''the publican'' (ὁ τελώνης), a tax collector, a profession generally despised by Jews for its association with Roman occupation and perceived corruption. This detail underscores Jesus'' radical inclusivity, calling individuals from diverse backgrounds, including those considered outcasts, to be His closest followers and agents of His Kingdom. James, son of Alphaeus, and Thaddaeus (also known as Lebbaeus in some manuscripts) complete this section of the list.',
   NULL),
  (4,
   'Simon the Canaanite, and Judas Iscariot, who also betrayed him.',
   'Σίμων ὁ Καναναῖος καὶ Ἰούδας ὁ Ἰσκαριώτης, ὁ καὶ παραδοὺς αὐτόν.',
   'Simōn ho Kananaios kai Ioudas ho Iskariōtēs, ho kai paradous auton.',
   'The final two apostles listed are Simon the Cananaean (often translated ''Zealot'' in other versions, indicating a nationalist background) and Judas Iscariot. The inclusion of a Zealot and a former tax collector (Matthew) among the twelve highlights the diverse political and social spectrum Jesus drew from, demonstrating His ability to unite disparate individuals under His authority. Judas Iscariot is tragically identified as ''he who also betrayed him,'' a somber note that foreshadows the ultimate betrayal and reminds us of the reality of human fallenness even within the closest circle of disciples.',
   'The presence of Judas Iscariot, despite his eventual betrayal, within the chosen twelve, underscores the mystery of human free will and divine foreknowledge. It also serves as a sober reminder that outward association with Christ does not guarantee inward transformation or ultimate faithfulness, highlighting the importance of genuine commitment and perseverance in faith.'),
  (5,
   'These twelve Jesus sent forth, and commanded them, saying, Go not into the way of the Gentiles, and into any city of the Samaritans enter ye not:',
   'Τούτους τοὺς δώδεκα ἀπέστειλεν ὁ Ἰησοῦς παραγγείλας αὐτοῖς λέγων· Εἰς ὁδὸν ἐθνῶν μὴ ἀπέλθητε καὶ εἰς πόλιν Σαμαριτῶν μὴ εἰσέλθητε·',
   'Toutous tous dōdeka apesteilen ho Iēsous parangeilas autois legōn: Eis hodon ethnōn mē apelthēte kai eis polin Samaritōn mē eiselthēte;',
   'Jesus ''sent forth'' (ἀπέστειλεν) the twelve with specific geographical restrictions for this initial mission. They were not to go ''into the way of the Gentiles'' (εἰς ὁδὸν ἐθνῶν) or ''into any city of the Samaritans.'' This limitation reflects the immediate focus of Jesus'' earthly ministry, which was primarily to ''the lost sheep of the house of Israel'' (Matt 15:24). It also served as a strategic first step, allowing the disciples to gain experience within a familiar cultural context before the broader, post-resurrection mission to all nations (Matt 28:19).',
   NULL),
  (6,
   'But go rather to the lost sheep of the house of Israel.',
   'πορεύεσθε δὲ μᾶλλον πρὸς τὰ πρόβατα τὰ ἀπολωλότα οἴκου Ἰσραήλ.',
   'Poreuesthe de mallon pros ta probata ta apolōlota oikou Israēl.',
   'This verse clarifies the exclusive focus of the initial mission: ''to the lost sheep of the house of Israel.'' The imagery of ''lost sheep'' emphasizes the spiritual plight and vulnerability of the Jewish people, who, despite their covenant relationship with God, had strayed and were in need of a shepherd. This directive aligns with Jesus'' own stated purpose (Matt 15:24) and underscores the priority of God''s covenant people in the unfolding of His redemptive plan, before the Gospel would extend to the Gentiles.',
   'The mission to the ''lost sheep of the house of Israel'' highlights God''s enduring covenant faithfulness to His chosen people. While the Gospel would eventually extend to all nations, this initial focus demonstrates the divine order of salvation history, beginning with Israel as the recipient of God''s promises and the first to hear the message of the Kingdom.'),
  (7,
   'And as ye go, preach, saying, The kingdom of heaven is at hand.',
   'Πορευόμενοι δὲ κηρύσσετε λέγοντες ὅτι Ἤγγικεν ἡ βασιλεία τῶν οὐρανῶν.',
   'Poreuomenoi de kēryssete legontes hoti Ēngiken hē basileia tōn ouranōn.',
   'The core message of the disciples'' mission is identical to that of John the Baptist (Matt 3:2) and Jesus Himself (Matt 4:17): ''The kingdom of heaven is at hand'' (Ἤγγικεν ἡ βασιλεία τῶν οὐρανῶν). This proclamation signifies that God''s sovereign rule, previously anticipated, is now breaking into human history through the person and ministry of Jesus. It calls for repentance and faith, as the long-awaited era of God''s direct intervention and redemptive power has arrived, bringing both blessings and judgment.',
   'The proclamation ''The kingdom of heaven is at hand'' is central to the Gospel message. It signifies that God''s reign is not merely a future hope but an present reality inaugurated by Christ. This message calls for a radical reorientation of life, inviting individuals to submit to God''s rule and experience its transformative power now, while anticipating its full consummation.'),
  (8,
   'Heal the sick, cleanse the lepers, raise the dead, cast out devils: freely ye have received, freely give.',
   'ἀσθενοῦντας θεραπεύετε, νεκροὺς ἐγείρετε, λεπροὺς καθαρίζετε, δαιμόνια ἐκβάλλετε· δωρεὰν ἐλάβετε, δωρεὰν δότε.',
   'asthenountas therapeuete, nekrous egeirete, leprous katharizete, daimonia ekballete; dōrean elabete, dōrean dote.',
   'Jesus reiterates and expands the miraculous powers given to the disciples, including healing the sick, raising the dead, cleansing lepers, and casting out demons. These acts are not merely humanitarian but serve as tangible signs of the Kingdom''s arrival and the defeat of Satan''s power. The command ''freely ye have received, freely give'' (δωρεὰν ἐλάβετε, δωρεὰν δότε) emphasizes that their power and mission are gifts of grace, not earned, and therefore should be exercised without charge or personal gain, reflecting God''s generous nature.',
   'The command to ''freely give'' what has been ''freely received'' is a core principle of Christian stewardship and ministry. It underscores that spiritual gifts and divine power are not commodities for personal profit but instruments of God''s grace, to be generously dispensed for the benefit of others and the advancement of the Kingdom, reflecting the selfless love of Christ.'),
  (9,
   'Provide neither gold, nor silver, nor brass in your purses,',
   'Μὴ κτήσησθε χρυσὸν μηδὲ ἄργυρον μηδὲ χαλκὸν εἰς τὰς ζώνας ὑμῶν,',
   'Mē ktēsēsthe chryson mēde argyron mēde chalkon eis tas zōnas hymōn,',
   'Jesus instructs His disciples to travel light, without provisions for their journey. ''Provide neither gold, nor silver, nor brass in your purses'' (εἰς τὰς ζώνας ὑμῶν) refers to the money belts commonly worn. This command emphasizes radical dependence on God''s provision and the hospitality of those they minister to. It also ensures that the disciples'' motives are pure, not driven by material gain, and that their focus remains solely on the urgent task of proclaiming the Kingdom. This detachment from worldly security fosters faith and trust.',
   NULL),
  (10,
   'Nor scrip for your journey, neither two coats, neither shoes, nor yet staves: for the workman is worthy of his meat.',
   'μὴ πήραν εἰς ὁδὸν μηδὲ δύο χιτῶνας μηδὲ ὑποδήματα μηδὲ ῥάβδον· ἄξιος γὰρ ὁ ἐργάτης τῆς τροφῆς αὐτοῦ.',
   'mē pēran eis hodon mēde duo chitōnas mēde hypodēmata mēde rabdon; axios gar ho ergatēs tēs trophēs autou.',
   'The instruction to take ''nor scrip for your journey, neither two coats, neither shoes, nor yet staves'' further reinforces the theme of radical dependence. A ''scrip'' (πήραν) was a beggar''s bag, and ''two coats'' implies a change of clothing. The absence of a staff (ῥάβδον) suggests they are not to rely on self-defense or worldly authority. The rationale, ''for the workman is worthy of his meat'' (ἄξιος γὰρ ὁ ἐργάτης τῆς τροφῆς αὐτοῦ), indicates that those who receive the message and ministry are obligated to provide for the disciples'' basic needs, establishing a principle of mutual support in ministry (cf. 1 Cor 9:14; 1 Tim 5:18).',
   'The principle that ''the workman is worthy of his meat'' establishes a biblical basis for supporting those who dedicate their lives to ministry. It teaches that those who labor in the spiritual harvest are entitled to receive material provision from those they serve, fostering a reciprocal relationship of spiritual and material exchange within the community of faith.'),
  (11,
   'And into whatsoever city or town ye shall enter, enquire who in it is worthy; and there abide till ye go thence.',
   'Εἰς ἣν δ’ ἂν πόλιν ἢ κώμην εἰσέλθητε, ἐξετάσατε τίς ἐν αὐτῇ ἄξιός ἐστιν, κἀκεῖ μείνατε ἕως ἂν ἐξέλθητε.',
   'Eis hēn d'' an polin ē kōmēn eiselthēte, exetasate tis en autē axios estin, kakei meinate heōs an exelthēte.',
   'Upon entering a town, the disciples are instructed to ''enquire who in it is worthy'' (τίς ἐν αὐτῇ ἄξιός ἐστιν). This ''worthiness'' refers not to moral perfection, but to receptiveness to the message of the Kingdom and willingness to offer hospitality. By staying in one house, they avoid the appearance of seeking better accommodations or being fickle, maintaining focus on their mission and fostering stable relationships. This practice also prevented them from becoming a burden or exploiting hospitality, ensuring their integrity.',
   NULL),
  (12,
   'And when ye come into an house, salute it.',
   'Εἰσερχόμενοι δὲ εἰς τὴν οἰκίαν ἀσπάσασθε αὐτήν.',
   'Eiserchomenoi de eis tēn oikian aspasasthe autēn.',
   'Upon entering a house, the disciples are to ''salute it'' (ἀσπάσασθε αὐτήν). This refers to the traditional Jewish greeting of ''Shalom'' (peace), which was more than a mere formality but a prayer for the well-being and prosperity of the household. This act of blessing sets a tone of goodwill and spiritual intention, inviting God''s peace upon those who would receive them and their message. It reflects the Kingdom''s nature as a realm of peace.',
   NULL),
  (13,
   'And if the house be worthy, let your peace come upon it: but if it be not worthy, let your peace return to you.',
   'καὶ ἐὰν μὲν ᾖ ἡ οἰκία ἀξία, ἐλθέτω ἡ εἰρήνη ὑμῶν ἐπ’ αὐτήν· ἐὰν δὲ μὴ ᾖ ἀξία, ἡ εἰρήνη ὑμῶν πρὸς ὑμᾶς ἐπιστραφήτω.',
   'kai ean men ē hē oikia axia, elthetō hē eirēnē hymōn ep'' autēn; ean de mē ē axia, hē eirēnē hymōn pros hymas epistraphētō.',
   'The effectiveness of the ''peace'' (εἰρήνη) pronounced upon a house depends on its ''worthiness'' (ἀξία), meaning its receptiveness to the Gospel. If the house is worthy, the peace ''comes upon it''; if not, the peace ''returns to you.'' This teaches that spiritual blessings are not automatically received but require an open heart. It also protects the disciples from spiritual depletion, ensuring that their blessings are not wasted on those who reject them, but rather remain with them to be offered elsewhere.',
   'This verse illustrates the principle of spiritual receptivity. God''s blessings, though freely offered, require a willing heart to be received. The ''peace'' of the Gospel is not imposed but extended, and its efficacy depends on the hearer''s response. This highlights human responsibility in salvation and the dynamic interaction between divine grace and human faith.'),
  (14,
   'And whosoever shall not receive you, nor hear your words, when ye depart out of that house or city, shake off the dust of your feet.',
   'Καὶ ὃς ἂν μὴ δέξηται ὑμᾶς μηδὲ ἀκούσῃ τοὺς λόγους ὑμῶν, ἐξερχόμενοι ἔξω τῆς οἰκίας ἢ τῆς πόλεως ἐκτινάξατε τὸν κονιορτὸν τῶν ποδῶν ὑμῶν.',
   'Kai hos an mē dexētai hymas mēde akousē tous logous hymōn, exerchomenoi exō tēs oikias ē tēs poleōs ektinaxate ton koniorton tōn podōn hymōn.',
   'For those who reject the disciples and their message, the instruction is to ''shake off the dust of your feet'' (ἐκτινάξατε τὸν κονιορτὸν τῶν ποδῶν ὑμῶν). This was a symbolic gesture, common among Jews when leaving Gentile territory, signifying a separation from defilement and a testimony against the unreceptive. It indicates that the disciples are absolved of responsibility for the rejection and that the consequences of that rejection fall upon those who refused the Kingdom message. It''s a solemn warning, not an act of anger.',
   'The act of shaking off dust symbolizes a definitive separation and a testimony against those who reject the Gospel. It underscores the gravity of rejecting Christ''s message and His messengers, implying that such rejection carries serious spiritual consequences. It also teaches believers to move on from hardened hearts, entrusting judgment to God.'),
  (15,
   'Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrha in the day of judgment, than for that city.',
   'Ἀμὴν λέγω ὑμῖν, ἀνεκτότερον ἔσται γῇ Σοδόμων καὶ Γομόρρων ἐν ἡμέρᾳ κρίσεως ἢ τῇ πόλει ἐκείνῃ.',
   'Amēn legō hymin, anektoteron estai gē Sodomōn kai Gomorrōn en hēmera kriseōs ē tē polei ekeinē.',
   'Jesus pronounces a severe judgment: it will be ''more tolerable for the land of Sodom and Gomorrha in the day of judgment'' than for a city that rejects the disciples'' message. Sodom and Gomorrah were archetypes of divine judgment due to their extreme wickedness (Gen 19). This comparison highlights that rejecting the clear proclamation of the Kingdom, accompanied by miraculous signs, carries a greater culpability than the sins of ancient, less-enlightened cities. It emphasizes the immense privilege and responsibility of hearing the Gospel.',
   'This stark warning reveals the escalating nature of divine judgment based on the light received. Rejecting the explicit revelation of God''s Kingdom through Christ''s messengers incurs a greater condemnation than the sins of those who lived under less revelation. It underscores the profound seriousness of responding to the Gospel and the ultimate accountability of every individual before God.'),
  (16,
   'Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves.',
   'Ἰδοὺ ἐγὼ ἀποστέλλω ὑμᾶς ὡς πρόβατα ἐν μέσῳ λύκων· γίνεσθε οὖν φρόνιμοι ὡς οἱ ὄφεις καὶ ἀκέραιοι ὡς αἱ περιστεραί.',
   'Idou egō apostellō hymas hōs probata en mesō lykōn; ginesthe oun phronimoi hōs hoi opheis kai akeraioi hōs hai peristerai.',
   'Jesus shifts from mission instructions to warnings about persecution, using the vivid imagery of ''sheep in the midst of wolves'' (πρόβατα ἐν μέσῳ λύκων) to describe the vulnerability of His disciples in a hostile world. He then commands them to be ''wise as serpents'' (φρόνιμοι ὡς οἱ ὄφεις) – implying shrewdness, discernment, and caution – and ''harmless as doves'' (ἀκέραιοι ὡς αἱ περιστεραί) – signifying purity, innocence, and integrity. This dual command calls for a balanced approach: spiritual astuteness without compromising moral uprightness.',
   'This verse provides a foundational principle for Christian engagement in a fallen world. Believers are called to exercise both wisdom and innocence: wisdom to navigate dangers and opposition effectively, and innocence to maintain moral purity and integrity, ensuring that their witness is unblemished and their actions reflect the character of Christ amidst hostility.'),
  (17,
   'But beware of men: for they will deliver you up to the councils, and they will scourge you in their synagogues;',
   'Προσέχετε δὲ ἀπὸ τῶν ἀνθρώπων· παραδώσουσιν γὰρ ὑμᾶς εἰς συνέδρια καὶ ἐν ταῖς συναγωγαῖς αὐτῶν μαστιγώσουσιν ὑμᾶς·',
   'Prosechete de apo tōn anthrōpōn; paradōsousin gar hymas eis synedria kai en tais synagōgais autōn mastigōsousin hymas;',
   'Jesus warns His disciples to ''beware of men'' (ἀπὸ τῶν ἀνθρώπων), specifically those who will persecute them. They will be delivered to ''councils'' (συνέδρια), referring to local Jewish courts, and ''scourged in their synagogues'' (μαστιγώσουσιν ὑμᾶς). This foreshadows the severe opposition the early church would face from Jewish authorities (cf. Acts 5:40; 2 Cor 11:24). The synagogue, typically a place of worship and instruction, would become a place of punishment, highlighting the depth of the religious opposition.',
   NULL),
  (18,
   'And ye shall be brought before governors and kings for my sake, for a testimony against them and the Gentiles.',
   'καὶ ἐπὶ ἡγεμόνας δὲ καὶ βασιλεῖς ἀχθήσεσθε ἕνεκεν ἐμοῦ εἰς μαρτύριον αὐτοῖς καὶ τοῖς ἔθνεσιν.',
   'kai epi hēgemonas de kai basileis achthēsesthe heneken emou eis martyrion autois kai tois ethnesin.',
   'The persecution will extend beyond Jewish authorities to ''governors and kings'' (ἡγεμόνας δὲ καὶ βασιλεῖς), indicating Roman officials and rulers. This broader scope of suffering is ''for my sake'' (ἕνεκεν ἐμοῦ), identifying their persecution with Christ''s own. Crucially, these trials are not meaningless but serve ''for a testimony against them and the Gentiles'' (εἰς μαρτύριον αὐτοῖς καὶ τοῖς ἔθνεσιν). Their suffering becomes a platform for proclaiming the Gospel to those in power, fulfilling God''s sovereign plan.',
   'Persecution, though painful, is presented as an opportunity for witness. Being brought before rulers ''for my sake'' transforms suffering into a powerful testimony, extending the reach of the Gospel to those who might otherwise never hear it. This demonstrates God''s ability to use even hostile circumstances to advance His Kingdom and glorify His name.'),
  (19,
   'But when they deliver you up, take no thought how or what ye shall speak: for it shall be given you in that same hour what ye shall speak.',
   'ὅταν δὲ παραδῶσιν ὑμᾶς, μὴ μεριμνήσητε πῶς ἢ τί λαλήσητε· δοθήσεται γὰρ ὑμῖν ἐν ἐκείνῃ τῇ ὥρᾳ τί λαλήσητε·',
   'hotan de paradōsin hymas, mē merimnēsēte pōs ē ti lalēsēte; dothēsetai gar hymin en ekeinē tē hōra ti lalēsēte;',
   'In the face of such trials, Jesus instructs His disciples not to ''take no thought how or what ye shall speak'' (μὴ μεριμνήσητε πῶς ἢ τί λαλήσητε). This is not a call to unpreparedness but an assurance of divine assistance. The promise is that ''it shall be given you in that same hour what ye shall speak'' (δοθήσεται γὰρ ὑμῖν ἐν ἐκείνῃ τῇ ὥρᾳ τί λαλήσητε). This supernatural enablement ensures that their testimony will be divinely inspired and effective, removing the burden of anxiety from the disciples (cf. Luke 12:11-12).',
   'This promise of divine inspiration in times of persecution highlights the Holy Spirit''s role in empowering believers for witness. It assures that God will provide the necessary words and wisdom when His servants are called to testify, demonstrating His active presence and support in their trials. This fosters reliance on the Spirit rather than human eloquence.'),
  (20,
   'For it is not ye that speak, but the Spirit of your Father which speaketh in you.',
   'οὐ γὰρ ὑμεῖς ἐστε οἱ λαλοῦντες ἀλλὰ τὸ Πνεῦμα τοῦ Πατρὸς ὑμῶν τὸ λαλοῦν ἐν ὑμῖν.',
   'ou gar hymeis este hoi lalountes alla to Pneuma tou Patros hymōn to laloun en hymin.',
   'The reason for not worrying about what to say is profound: ''For it is not ye that speak, but the Spirit of your Father which speaketh in you'' (τὸ Πνεῦμα τοῦ Πατρὸς ὑμῶν τὸ λαλοῦν ἐν ὑμῖν). This emphasizes the divine origin and authority of their message. The Holy Spirit, identified as ''the Spirit of your Father,'' will speak through them, ensuring that their testimony is God''s own word. This promise underscores the intimate relationship between the Father, the Spirit, and the disciples in their mission.',
   'This verse is a powerful affirmation of the Holy Spirit''s indwelling and empowering presence in believers, particularly in witness. It teaches that when a disciple speaks for Christ, especially under duress, it is the Spirit of God Himself speaking through them, giving divine authority and efficacy to their words. This highlights the Trinitarian nature of Christian mission.'),
  (21,
   'And the brother shall deliver up the brother to death, and the father the child: and the children shall rise up against their parents, and cause them to be put to death.',
   'Παραδώσει δὲ ἀδελφὸς ἀδελφὸν εἰς θάνατον καὶ πατὴρ τέκνον, καὶ ἐπαναστήσονται τέκνα ἐπὶ γονεῖς καὶ θανατώσουσιν αὐτούς.',
   'Paradōsei de adelphos adelphon eis thanaton kai patēr teknon, kai epanastēsontai tekna epi goneis kai thanatōsousin autous.',
   'Jesus warns of even more severe persecution: division within families. ''Brother shall deliver up the brother to death, and the father the child: and the children shall rise up against their parents, and cause them to be put to death.'' This chilling prophecy, echoing Micah 7:6, depicts the radical disruption the Gospel can bring, even within the closest human bonds. Loyalty to Christ will supersede familial ties, leading to betrayal and martyrdom. This highlights the ultimate cost of discipleship and the profound choice required.',
   'This prophecy reveals the radical, divisive nature of the Gospel in a fallen world. Following Christ can lead to profound alienation, even within one''s own family, as loyalty to God takes precedence over all human relationships. It underscores the absolute demand of discipleship and the spiritual warfare that can manifest in the most intimate spheres of life.'),
  (22,
   'And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.',
   'καὶ ἔσεσθε μισούμενοι ὑπὸ πάντων διὰ τὸ ὄνομά μου· ὁ δὲ ὑπομείνας εἰς τέλος οὗτος σωθήσεται.',
   'kai esesthe misoumenoi hypo pantōn dia to onoma mou; ho de hypomeinas eis telos houtos sōthēsetai.',
   'The disciples are warned that they ''shall be hated of all men for my name’s sake'' (μισούμενοι ὑπὸ πάντων διὰ τὸ ὄνομά μου). This universal hatred stems from their identification with Christ and His message, which challenges worldly values and powers. However, this dire warning is immediately followed by a promise of ultimate salvation: ''but he that endureth to the end shall be saved'' (ὁ δὲ ὑπομείνας εἰς τέλος οὗτος σωθήσεται). This emphasizes the necessity of perseverance and faithfulness through suffering as a condition for final salvation.',
   'This verse presents the doctrine of perseverance of the saints. While salvation is by grace through faith, true faith is evidenced by endurance through trials and hatred ''for my name''s sake.'' Those who genuinely belong to Christ will persevere to the end, and this perseverance is a mark of their salvation, not a means of earning it. It highlights the active role of the believer in living out their faith.'),
  (23,
   'But when they persecute you in this city, flee ye into another: for verily I say unto you, Ye shall not have gone over the cities of Israel, till the Son of man be come.',
   'ὅταν δὲ διώκωσιν ὑμᾶς ἐν τῇ πόλει ταύτῃ, φεύγετε εἰς τὴν ἑτέραν· ἀμὴν γὰρ λέγω ὑμῖν, οὐ μὴ τελέσητε τὰς πόλεις τοῦ Ἰσραὴλ ἕως ἂν ἔλθῃ ὁ Υἱὸς τοῦ ἀνθρώπου.',
   'hotan de diōkōsin hymas en tē polei tautē, pheugete eis tēn heteran; amēn gar legō hymin, ou mē telesēte tas poleis tou Israēl heōs an elthē ho Huios tou anthrōpou.',
   'Jesus provides practical guidance for persecution: ''when they persecute you in this city, flee ye into another.'' This is not cowardice but strategic wisdom, allowing the Gospel to be spread to new areas and preserving the lives of the messengers. The profound statement, ''Ye shall not have gone over the cities of Israel, till the Son of man be come'' (ἕως ἂν ἔλθῃ ὁ Υἱὸς τοῦ ἀνθρώπου), is highly debated. It could refer to Jesus'' resurrection, the coming of the Spirit at Pentecost, the destruction of Jerusalem in A.D. 70, or His second coming, indicating the urgency and scope of their mission.',
   NULL),
  (24,
   'The disciple is not above his master, nor the servant above his lord.',
   'Οὐκ ἔστιν μαθητὴς ὑπὲρ τὸν διδάσκαλον οὐδὲ δοῦλος ὑπὲρ τὸν κύριον αὐτοῦ.',
   'Ouk estin mathētēs hyper ton didaskalon oude doulos hyper ton kyrion autou.',
   'This proverb establishes a fundamental truth about discipleship: ''The disciple is not above his master, nor the servant above his lord.'' Jesus, as their Master (διδάσκαλον) and Lord (κύριον), experienced rejection and suffering. Therefore, His followers should expect no less. This principle prepares the disciples for the reality of persecution, reminding them that their experience will mirror that of their Lord. It calls for humility and identification with Christ''s suffering.',
   'This foundational principle of discipleship teaches that followers of Christ should expect to share in His experiences, including suffering and rejection. It calls for humility and identification with the Master, reminding believers that their path will often mirror His, and that true discipleship involves embracing the cost of following Him.'),
  (25,
   'It is enough for the disciple that he be as his master, and the servant as his lord. If they have called the master of the house Beelzebub, how much more shall they call them of his household?',
   'ἀρκετὸν τῷ μαθητῇ ἵνα γένηται ὡς ὁ διδάσκαλος αὐτοῦ καὶ ὁ δοῦλος ὡς ὁ κύριος αὐτοῦ. Εἰ τὸν οἰκοδεσπότην Βεελζεβοὺλ ἐπεκάλεσαν, πόσῳ μᾶλλον τοὺς οἰκιακοὺς αὐτοῦ;',
   'arketon tō mathētē hina genētai hōs ho didaskalos autou kai ho doulos hōs ho kyrios autou. Ei ton oikodespotēn Beelzeboul epekalesan, posō mallon tous oikiakous autou?',
   'It is ''enough for the disciple that he be as his master.'' If Jesus, ''the master of the house'' (τὸν οἰκοδεσπότην), was called ''Beelzebub'' (Βεελζεβοὺλ), a derogatory term for the prince of demons (cf. Matt 9:34; 12:24), then His followers should expect similar slander and false accusations. This rhetorical question emphasizes that if the greater (Jesus) was reviled, the lesser (His disciples) will certainly be. It serves to normalize persecution and prepare them for unjust criticism.',
   NULL),
  (26,
   'Fear them not therefore: for there is nothing covered, that shall not be revealed; and hid, that shall not be known.',
   'Μὴ οὖν φοβηθῆτε αὐτούς· οὐδὲν γάρ ἐστιν κεκαλυμμένον ὃ οὐκ ἀποκαλυφθήσεται καὶ κρυπτὸν ὃ οὐ γνωσθήσεται.',
   'Mē oun phobēthēte autous; ouden gar estin kekalymmenon ho ouk apokalyphthēsetai kai krypton ho ou gnōsthēsetai.',
   'Following the warnings of persecution, Jesus commands, ''Fear them not therefore.'' This command is grounded in the assurance that ''there is nothing covered, that shall not be revealed; and hid, that shall not be known.'' This principle of ultimate revelation applies both to the truth of the Gospel, which will eventually triumph, and to the hidden motives and injustices of their persecutors, which will be exposed in God''s perfect timing. It encourages courage and transparency, knowing that truth will prevail.',
   'This verse offers comfort and courage to the persecuted, assuring them that ultimate truth and justice will prevail. It teaches that God''s sovereign plan includes the eventual revelation of all hidden things, both the truth of the Gospel and the hidden wickedness of those who oppose it. This provides a basis for steadfastness and hope in the face of injustice.'),
  (27,
   'What I tell you in darkness, that speak ye in light: and what ye hear in the ear, that preach ye upon the housetops.',
   'ὃ λέγω ὑμῖν ἐν τῇ σκοτίᾳ, εἴπατε ἐν τῷ φωτί· καὶ ὃ εἰς τὸ οὖς ἀκούετε, κηρύξατε ἐπὶ τῶν δωμάτων.',
   'ho legō hymin en tē skotia, eipate en tō phōti; kai ho eis to ous akouete, kēryxate epi tōn dōmatōn.',
   'Jesus instructs His disciples to boldly proclaim the truths they have learned from Him. ''What I tell you in darkness, that speak ye in light: and what ye hear in the ear, that preach ye upon the housetops.'' ''In darkness'' (ἐν τῇ σκοτίᾳ) and ''in the ear'' refer to private, intimate instruction. ''In light'' (ἐν τῷ φωτί) and ''upon the housetops'' (ἐπὶ τῶν δωμάτων) signify public, open proclamation. This command emphasizes the urgency and necessity of sharing the Gospel widely and fearlessly, without reservation, even in the face of opposition.',
   NULL),
  (28,
   'And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.',
   'καὶ μὴ φοβεῖσθε ἀπὸ τῶν ἀποκτεννόντων τὸ σῶμα τὴν δὲ ψυχὴν μὴ δυναμένων ἀποκτεῖναι· φοβεῖσθε δὲ μᾶλλον τὸν δυνάμενον καὶ ψυχὴν καὶ σῶμα ἀπολέσαι ἐν γεέννῃ.',
   'kai mē phobeisthe apo tōn apoktennontōn to sōma tēn de psychēn mē dynamenōn apokteinai; phobeisthe de mallon ton dynamenon kai psychēn kai sōma apolesai en geennē.',
   'This is a crucial command regarding fear. Disciples are not to ''fear them which kill the body'' (ἀπὸ τῶν ἀποκτεννόντων τὸ σῶμα), for their power is limited to physical death. Instead, they are to ''rather fear him which is able to destroy both soul and body in hell'' (τὸν δυνάμενον καὶ ψυχὴν καὶ σῶμα ἀπολέσαι ἐν γεέννῃ). This ''him'' refers to God, emphasizing His ultimate sovereignty over eternal destiny. The term ''hell'' (γεέννῃ, Gehenna) refers to the Valley of Hinnom, a place associated with judgment and destruction, signifying eternal punishment. This teaching prioritizes spiritual fear of God over temporal fear of man.',
   'This verse articulates the profound theological distinction between physical death and eternal judgment. It calls believers to a proper fear of God, who holds ultimate power over both body and soul in eternity, rather than a fear of human persecutors whose power is limited to this earthly life. This doctrine underscores God''s sovereignty over life and death, and the reality of eternal consequences.'),
  (29,
   'Are not two sparrows sold for a farthing? and one of them shall not fall on the ground without your Father.',
   'Οὐχὶ δύο στρουθία ἀσσαρίου πωλεῖται; καὶ ἓν ἐξ αὐτῶν οὐ πεσεῖται ἐπὶ τὴν γῆν ἄνευ τοῦ Πατρὸς ὑμῶν.',
   'Ouchi dyo strouthia assariou pōleitai? kai hen ex autōn ou peseitai epi tēn gēn aneu tou Patros hymōn.',
   'To further encourage fearlessness, Jesus uses the illustration of sparrows. ''Are not two sparrows sold for a farthing?'' (δύο στρουθία ἀσσαρίου πωλεῖται;). A ''farthing'' (ἀσσαρίου) was a coin of very little value, highlighting the insignificance of sparrows in human estimation. Yet, ''one of them shall not fall on the ground without your Father'' (ἄνευ τοῦ Πατρὸς ὑμῶν). This emphasizes God''s meticulous providential care, extending even to the smallest and seemingly least valuable creatures. It assures the disciples that their lives are certainly under His watchful eye.',
   'This illustration powerfully conveys the doctrine of God''s meticulous providence. It teaches that God''s sovereign care extends to every detail of creation, even the seemingly insignificant. This truth provides immense comfort and assurance to believers, reminding them that their lives are constantly under the watchful eye and loving care of their Heavenly Father, even amidst trials.'),
  (30,
   'But the very hairs of your head are all numbered.',
   'ὑμῶν δὲ καὶ αἱ τρίχες τῆς κεφαλῆς πᾶσαι ἠριθμημέναι εἰσίν.',
   'hymōn de kai hai triches tēs kephalēs pasai ērithmēmenai eisin.',
   'Building on the sparrow illustration, Jesus declares, ''But the very hairs of your head are all numbered'' (αἱ τρίχες τῆς κεφαλῆς πᾶσαι ἠριθμημέναι εἰσίν). This hyperbole emphasizes the extreme detail of God''s knowledge and care for His disciples. If God knows something as trivial and numerous as the hairs on one''s head, then He certainly knows and cares about their greater concerns, their suffering, and their ultimate destiny. This truth provides profound comfort and security.',
   'This statement is a profound declaration of God''s omniscient and personal care for each individual believer. It underscores the doctrine of divine providence, assuring that God''s knowledge and concern extend to the most minute details of our lives. This truth fosters deep trust and confidence in God''s unwavering love and sovereign control, even in the midst of life''s uncertainties.'),
  (31,
   'Fear ye not therefore, ye are of more value than many sparrows.',
   'μὴ οὖν φοβηθῆτε· πολλῶν στρουθίων διαφέρετε ὑμεῖς.',
   'mē oun phobēthēte; pollōn strouthiōn diapherete hymeis.',
   'The conclusion drawn from God''s providential care for sparrows and numbered hairs is a direct command: ''Fear ye not therefore'' (μὴ οὖν φοβηθῆτε). The reason is clear: ''ye are of more value than many sparrows'' (πολλῶν στρουθίων διαφέρετε ὑμεῖς). If God cares for the least of His creation, He cares infinitely more for His beloved children, who are made in His image and redeemed by His Son. This truth is meant to instill courage and banish anxiety in the face of persecution and death.',
   'This verse provides a powerful antidote to fear, grounding it in the incomparable value God places on His children. It teaches that believers, being created in God''s image and redeemed by Christ, possess an inherent worth far exceeding any other creature. This divine valuation should inspire courage and trust, knowing that God''s love and protection are steadfast.'),
  (32,
   'Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.',
   'Πᾶς οὖν ὅστις ὁμολογήσει ἐν ἐμοὶ ἔμπροσθεν τῶν ἀνθρώπων, ὁμολογήσω κἀγὼ ἐν αὐτῷ ἔμπροσθεν τοῦ Πατρός μου τοῦ ἐν οὐρανοῖς·',
   'Pas oun hostis homologēsei en emoi emprosthen tōn anthrōpōn, homologēsō kagō en autō emprosthen tou Patros mou tou en ouranois;',
   'Jesus transitions to the theme of confession and denial. ''Whosoever therefore shall confess me before men'' (ὁμολογήσει ἐν ἐμοὶ ἔμπροσθεν τῶν ἀνθρώπων) implies an open, public declaration of allegiance and faith, especially in times of opposition. The promise is reciprocal: ''him will I confess also before my Father which is in heaven'' (ὁμολογήσω κἀγὼ ἐν αὐτῷ ἔμπροσθεν τοῦ Πατρός μου τοῦ ἐν οὐρανοῖς). This highlights the eternal significance of earthly witness and the profound reward of Christ''s advocacy before God.',
   'This verse establishes the critical importance of public confession of Christ. It teaches that our earthly witness has eternal ramifications, as Christ Himself will acknowledge or deny us before the Father based on our faithfulness. This underscores the necessity of courageous faith and the profound privilege of being identified with Christ, securing His advocacy in heaven.'),
  (33,
   'But whosoever shall deny me before men, him will I also deny before my Father which is in heaven.',
   'ὅστις δ’ ἂν ἀρνήσηταί με ἔμπροσθεν τῶν ἀνθρώπων, ἀρνήσομαι κἀγὼ αὐτὸν ἔμπροσθεν τοῦ Πατρός μου τοῦ ἐν οὐρανοῖς.',
   'hostis d'' an arnēsētai me emprosthen tōn anthrōpōn, arnēsomai kagō auton emprosthen tou Patros mou tou en ouranois.',
   'Conversely, ''whosoever shall deny me before men'' (ἀρνήσηταί με ἔμπροσθεν τῶν ἀνθρώπων) will face the dire consequence of Christ''s denial before the Father. To ''deny'' (ἀρνήσηταί) means to disown or repudiate Christ, especially under pressure or fear of persecution. This warning underscores the seriousness of apostasy and the eternal stakes involved in one''s allegiance to Jesus. It is a powerful call to unwavering faithfulness, even unto death.',
   'This verse serves as a solemn warning against denying Christ, particularly in the face of worldly pressure or persecution. It highlights the eternal consequences of such a denial, emphasizing that Christ will disown those who disown Him before the Father. This doctrine underscores the absolute necessity of steadfast faith and loyalty to Christ for eternal salvation.'),
  (34,
   'Think not that I am come to send peace on earth: I came not to send peace, but a sword.',
   'Μὴ νομίσητε ὅτι ἦλθον βαλεῖν εἰρήνην ἐπὶ τὴν γῆν· οὐκ ἦλθον βαλεῖν εἰρήνην ἀλλὰ μάχαιραν.',
   'Mē nomisēte hoti ēlthen balein eirēnēn epi tēn gēn; ouk ēlthen balein eirēnēn alla machairan.',
   'Jesus challenges a common misconception: ''Think not that I am come to send peace on earth: I came not to send peace, but a sword'' (οὐκ ἦλθον βαλεῖν εἰρήνην ἀλλὰ μάχαιραν). While Jesus is the ''Prince of Peace'' (Isa 9:6) and brings spiritual peace, His coming also brings division. The ''sword'' (μάχαιραν) symbolizes the radical choices and conflicts that arise when the Gospel confronts a fallen world. It refers to the spiritual and social divisions that occur as people respond to His truth, separating believers from unbelievers, even within families.',
   'This paradoxical statement reveals the inherent tension between Christ''s mission of peace and the divisive impact of His truth in a fallen world. While Jesus offers spiritual peace with God, His message often creates social and familial conflict as individuals choose allegiance to Him over worldly ties. This doctrine highlights the radical nature of the Gospel and the cost of discipleship.'),
  (35,
   'For I am come to set a man at variance against his father, and the daughter against her mother, and the daughter in law against her mother in law.',
   'ἦλθον γὰρ διχάσαι ἄνθρωπον κατὰ τοῦ πατρὸς αὐτοῦ καὶ θυγατέρα κατὰ τῆς μητρὸς αὐτῆς καὶ νύμφην κατὰ τῆς πενθερᾶς αὐτῆς,',
   'ēlthen gar dichasai anthrōpon kata tou patros autou kai thugatera kata tēs mētros autēs kai nymphēn kata tēs pentheras autēs,',
   'Jesus elaborates on the ''sword'' metaphor, explaining that He came ''to set a man at variance against his father, and the daughter against her mother, and the daughter in law against her mother in law.'' This echoes Micah 7:6 and vividly portrays the profound social and familial disruption that can result from following Christ. The Gospel demands ultimate loyalty, which can lead to painful estrangement from loved ones who reject it. This is not Jesus'' primary goal, but an unavoidable consequence of His truth in a world resistant to God.',
   NULL),
  (36,
   'And a man’s foes shall be they of his own household.',
   'καὶ ἐχθροὶ τοῦ ἀνθρώπου οἱ οἰκιακοὶ αὐτοῦ.',
   'kai echthroi tou anthrōpou hoi oikiakoi autou.',
   'The consequence of this division is stark: ''And a man’s foes shall be they of his own household'' (ἐχθροὶ τοῦ ἀνθρώπου οἱ οἰκιακοὶ αὐτοῦ). This is a painful reality for many believers throughout history, where the most intense opposition comes not from strangers but from those closest to them. It underscores the radical nature of Christian commitment, which must transcend even the most sacred human relationships when those relationships conflict with loyalty to Christ.',
   NULL),
  (37,
   'He that loveth father or mother more than me is not worthy of me: and he that loveth son or daughter more than me is not worthy of me.',
   'Ὁ φιλῶν πατέρα ἢ μητέρα ὑπὲρ ἐμὲ οὐκ ἔστιν μου ἄξιος· καὶ ὁ φιλῶν υἱὸν ἢ θυγατέρα ὑπὲρ ἐμὲ οὐκ ἔστιν μου ἄξιος.',
   'Ho philōn patera ē mētera hyper eme ouk estin mou axios; kai ho philōn huion ē thugatera hyper eme ouk estin mou axios.',
   'Jesus sets an absolute standard for discipleship: ''He that loveth father or mother more than me is not worthy of me: and he that loveth son or daughter more than me is not worthy of me.'' The Greek word ''philōn'' (φιλῶν) denotes affection. This is not a call to hate family, but to prioritize love and loyalty to Christ above all human relationships, no matter how cherished. Only when Christ holds the supreme place in one''s heart is a person truly ''worthy'' (ἄξιος) of Him, meaning fit for His Kingdom.',
   'This verse articulates the absolute supremacy of Christ in the life of a disciple. It teaches that loyalty to Jesus must transcend all other loves, including the deepest familial bonds. True discipleship demands a radical reordering of affections, placing Christ first, as He alone is worthy of ultimate devotion and allegiance. This is a foundational principle of Christian commitment.'),
  (38,
   'And he that taketh not his cross, and followeth after me, is not worthy of me.',
   'καὶ ὃς οὐ λαμβάνει τὸν σταυρὸν αὐτοῦ καὶ ἀκολουθεῖ ὀπίσω μου, οὐκ ἔστιν μου ἄξιος.',
   'kai hos ou lambanei ton stauron autou kai akolouthei opisō mou, ouk estin mou axios.',
   'Jesus further defines worthiness: ''And he that taketh not his cross, and followeth after me, is not worthy of me.'' To ''take his cross'' (λαμβάνει τὸν σταυρὸν αὐτοῦ) was a vivid image in the Roman world, signifying a condemned person carrying their instrument of execution to their death. It means to embrace suffering, self-denial, and even death for Christ''s sake. This is a call to radical, sacrificial discipleship, identifying with Christ''s suffering and being prepared to lay down one''s life for Him.',
   'This powerful metaphor of ''taking up one''s cross'' is central to the doctrine of costly discipleship. It signifies a willingness to embrace suffering, self-denial, and even martyrdom for Christ''s sake. True followers of Jesus are called to identify with His sacrificial path, demonstrating a commitment that prioritizes His will above personal comfort or even life itself.'),
  (39,
   'He that findeth his life shall lose it: and he that loseth his life for my sake shall find it.',
   'Ὁ εὑρὼν τὴν ψυχὴν αὐτοῦ ἀπολέσει αὐτήν, καὶ ὁ ἀπολέσας τὴν ψυχὴν αὐτοῦ ἕνεκεν ἐμοῦ εὑρήσει αὐτήν.',
   'Ho heurōn tēn psychēn autou apolesei autēn, kai ho apolesas tēn psychēn autou heneken emou heurēsei autēn.',
   'This paradox, repeated elsewhere in the Gospels (Matt 16:25; Mark 8:35; Luke 9:24; 17:33; John 12:25), is crucial: ''He that findeth his life shall lose it: and he that loseth his life for my sake shall find it.'' ''Life'' (ψυχὴν, psychēn) here refers to one''s earthly existence, self-preservation, or even the soul in its temporal aspect. To cling to one''s earthly life or self-interest ultimately leads to spiritual loss. To ''lose'' it for Christ''s sake, through self-sacrifice and obedience, results in true, eternal life. It''s a call to radical surrender.',
   'This profound paradox encapsulates the essence of Christian discipleship and salvation. It teaches that true life, eternal life, is found not through self-preservation or worldly gain, but through self-denial and sacrificial surrender to Christ. To ''lose one''s life'' for His sake means to prioritize His Kingdom above all else, leading to ultimate spiritual gain and eternal reward.'),
  (40,
   'He that receiveth you receiveth me, and he that receiveth me receiveth him that sent me.',
   'Ὁ δεχόμενος ὑμᾶς ἐμὲ δέχεται, καὶ ὁ ἐμὲ δεχόμενος δέχεται τὸν ἀποστείλαντά με.',
   'Ho dechomenos hymas eme dechetai, kai ho eme dechomenos dechetai ton aposteilanta me.',
   'Jesus concludes this discourse with a promise of identification and reward. ''He that receiveth you receiveth me, and he that receiveth me receiveth him that sent me.'' This establishes a profound chain of identification: receiving a disciple is equivalent to receiving Christ, and receiving Christ is equivalent to receiving God the Father. It elevates the status of the disciples as Christ''s authorized representatives and underscores the divine authority behind their mission. It also promises divine blessing to those who show hospitality and support to His messengers.',
   'This verse highlights the profound theological principle of identification and representation. Receiving Christ''s messengers is tantamount to receiving Christ Himself, and thereby receiving God the Father. This underscores the divine authority of those sent by Christ and promises a spiritual blessing to those who welcome and support His Kingdom work, recognizing the sacredness of hospitality to His servants.'),
  (41,
   'He that receiveth a prophet in the name of a prophet shall receive a prophet’s reward; and he that receiveth a righteous man in the name of a righteous man shall receive a righteous man’s reward.',
   'Ὁ δεχόμενος προφήτην εἰς ὄνομα προφήτου μισθὸν προφήτου λήμψεται, καὶ ὁ δεχόμενος δίκαιον εἰς ὄνομα δικαίου μισθὸν δικαίου λήμψεται.',
   'Ho dechomenos prophētēn eis onoma prophētou misthon prophētou lēmpsetai, kai ho dechomenos dikaion eis onoma dikaiou misthon dikaiou lēmpsetai.',
   'Jesus elaborates on the reward for receiving His messengers. ''He that receiveth a prophet in the name of a prophet shall receive a prophet’s reward; and he that receiveth a righteous man in the name of a righteous man shall receive a righteous man’s reward.'' To receive ''in the name of'' (εἰς ὄνομα) means to receive because of their identity as a prophet or righteous person, recognizing their divine calling. The reward is commensurate with the one received, implying that honoring God''s servants is honoring God Himself, and He will bless accordingly.',
   'This verse teaches the principle of receiving a reward commensurate with the spiritual value of the one received, when done ''in the name of'' their calling. It emphasizes that acts of hospitality and support for God''s servants, motivated by a recognition of their divine role, are seen by God as service to Himself and will be eternally rewarded. This encourages generous support for ministry.'),
  (42,
   'And whosoever shall give to drink unto one of these little ones a cup of cold water only in the name of a disciple, verily I say unto you, he shall in no wise lose his reward.',
   'καὶ ὃς ἐὰν ποτίσῃ ἕνα τῶν μικρῶν τούτων ποτήριον ψυχροῦ μόνον εἰς ὄνομα μαθητοῦ, ἀμὴν λέγω ὑμῖν, οὐ μὴ ἀπολέσῃ τὸν μισθὸν αὐτοῦ.',
   'kai hos ean potisē hena tōn mikrōn toutōn potērion psychrou monon eis onoma mathētou, amēn legō hymin, ou mē apolesē ton misthon autou.',
   'Jesus concludes with a powerful statement about even the smallest acts of kindness. ''And whosoever shall give to drink unto one of these little ones a cup of cold water only in the name of a disciple... he shall in no wise lose his reward.'' ''These little ones'' (τῶν μικρῶν τούτων) refers to the disciples themselves, especially in their humble and vulnerable state. Even a simple act like providing ''a cup of cold water'' (ποτήριον ψυχροῦ), when done ''in the name of a disciple'' (εἰς ὄνομα μαθητοῦ) – out of recognition and respect for their identity as Christ''s followers – will be eternally rewarded. This emphasizes God''s recognition of genuine love and service, no matter how small.',
   'This verse highlights the profound significance of even the smallest acts of service motivated by love for Christ and His disciples. It teaches that God meticulously observes and rewards every genuine act of kindness extended to His ''little ones,'' underscoring His justice and generosity. This encourages believers to serve humbly, knowing that no act of love in His name goes unnoticed or unrewarded.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 10;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσκαλεσάμενος', 'proskalesamenos', 'G4341', 'From ''pros'' (to) and ''kaleō'' (to call), meaning ''to call to oneself,'' ''to summon.'' In this context, it emphasizes Jesus'' deliberate and authoritative act of gathering His disciples for a specific purpose, highlighting His initiative in their commissioning and the personal nature of His call to ministry.', 1),
  ('ἐξουσίαν', 'exousian', 'G1849', 'Meaning ''authority,'' ''power,'' ''right.'' It denotes delegated power, the right to act, rather than inherent strength. Here, it signifies the divine authorization given by Jesus to His disciples to perform miraculous works, underscoring that their ministry is not self-initiated but divinely sanctioned and empowered.', 2),
  ('ἀκαθάρτων', 'akathartōn', 'G167', 'Meaning ''unclean,'' ''impure.'' In the New Testament, it primarily refers to spiritual uncleanness, specifically ''unclean spirits'' or demons. This term highlights the spiritual nature of the battle the disciples are empowered to wage, confronting forces that defile and oppose God''s holy presence and will.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = 1;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κηρύσσετε', 'kēryssete', 'G2784', 'From ''kēryx'' (a herald), meaning ''to proclaim,'' ''to preach.'' It implies a public, authoritative declaration of a message, often on behalf of a sovereign. Here, the disciples are commanded to function as heralds of God''s Kingdom, publicly announcing its arrival and implications with divine authority.', 1),
  ('Ἤγγικεν', 'Ēngiken', 'G1448', 'Perfect tense of ''engizō,'' meaning ''has drawn near,'' ''is at hand.'' It signifies a present reality, not merely a future event. The Kingdom of Heaven has not fully arrived in its consummation, but its power and presence have decisively broken into human history through Jesus'' ministry, demanding an immediate response.', 2),
  ('βασιλεία', 'basileia', 'G932', 'Meaning ''kingdom,'' ''reign,'' ''royal power.'' In the phrase ''kingdom of heaven,'' it refers to God''s sovereign rule and reign, both present in the person and work of Christ and future in its full establishment. It encompasses God''s authority, dominion, and the sphere in which His will is perfectly done.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = 7;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀποστέλλω', 'apostellō', 'G649', 'From ''apo'' (from) and ''stellō'' (to send), meaning ''to send forth,'' ''to commission.'' It denotes a sending with a specific purpose and authority, making the one sent a representative of the sender. Here, Jesus emphasizes His active role in dispatching the disciples, highlighting their apostolic calling and divine mandate.', 1),
  ('φρόνιμοι', 'phronimoi', 'G5429', 'Meaning ''prudent,'' ''sensible,'' ''wise.'' It denotes practical wisdom, shrewdness, and discernment, especially in navigating difficult circumstances. In this context, it encourages disciples to be discerning and cautious, like a serpent, to avoid unnecessary dangers while fulfilling their mission.', 2),
  ('ἀκέραιοι', 'akeraioi', 'G172', 'From ''a'' (not) and ''kerannymi'' (to mix), meaning ''unmixed,'' ''pure,'' ''innocent,'' ''harmless.'' It signifies moral integrity and simplicity of purpose, without guile or malice. Disciples are to be pure in heart and intention, like a dove, ensuring their actions are always morally upright despite the need for shrewdness.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = 16;

-- Verse 28
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φοβεῖσθε', 'phobeisthe', 'G5399', 'Meaning ''to fear,'' ''to be afraid.'' In this context, it distinguishes between a temporal fear of human persecutors and a reverential, awe-filled fear of God. The latter is a proper response to God''s ultimate power and authority over both physical and eternal destiny, leading to obedience and trust.', 1),
  ('σῶμα', 'sōma', 'G4983', 'Meaning ''body,'' referring to the physical, material aspect of a human being. Here, it emphasizes the limited power of human persecutors, who can only inflict harm upon the physical body, but cannot touch the eternal essence of a person.', 2),
  ('ψυχὴν', 'psychēn', 'G5590', 'Meaning ''soul,'' ''life,'' ''self.'' In this context, it refers to the immaterial, eternal aspect of a human being, distinct from the physical body. It highlights God''s unique power to affect one''s eternal destiny, encompassing both the spiritual essence and the whole person in eternity.', 3),
  ('ἀπολέσαι', 'apolesai', 'G622', 'Meaning ''to destroy,'' ''to perish,'' ''to lose.'' When applied to ''soul and body in hell,'' it signifies eternal ruin, utter destruction of well-being, and separation from God, not annihilation. It emphasizes the ultimate and irreversible nature of divine judgment.', 4),
  ('γεέννῃ', 'geennē', 'G1067', 'Transliteration of the Hebrew ''Ge Hinnom'' (Valley of Hinnom), a valley outside Jerusalem where child sacrifices were once offered and later became a place for burning refuse. It became a metaphor for eternal punishment, a place of fiery judgment and utter destruction, signifying the ultimate consequence of rejecting God.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = 28;

-- Verse 38
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λαμβάνει', 'lambanei', 'G2983', 'Meaning ''to take,'' ''to receive,'' ''to grasp.'' In the context of ''taking up one''s cross,'' it signifies a deliberate and willing acceptance of suffering, self-denial, and identification with Christ''s path of sacrifice, rather than a passive endurance of circumstances.', 1),
  ('σταυρὸν', 'stauron', 'G4716', 'Meaning ''cross,'' an instrument of execution. In Jesus'' teaching, it became a metaphor for the ultimate self-sacrifice, suffering, and death that disciples must be willing to embrace for His sake. It symbolizes the complete surrender of one''s life and will to Christ, even to the point of martyrdom.', 2),
  ('ἀκολουθεῖ', 'akolouthei', 'G190', 'Meaning ''to follow,'' ''to accompany.'' It implies more than mere physical proximity; it signifies discipleship, allegiance, and obedience to the one being followed. To ''follow after me'' means to emulate Christ''s life, teachings, and sacrificial path, committing to His way of life.', 3),
  ('ἄξιος', 'axios', 'G514', 'Meaning ''worthy,'' ''deserving,'' ''fit.'' It denotes a correspondence in weight or value. Here, it refers to being fit or suitable for Christ''s Kingdom and discipleship, demonstrating a life that aligns with His demands, particularly in prioritizing Him above all else and embracing the cost of following Him.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = 38;

-- Verse 39
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εὑρὼν', 'heurōn', 'G2147', 'Aorist participle of ''heuriskō,'' meaning ''to find,'' ''to discover.'' In this context, ''finding one''s life'' refers to seeking to preserve one''s earthly existence, comfort, or self-interest, prioritizing temporal security over spiritual commitment to Christ.', 1),
  ('ψυχὴν', 'psychēn', 'G5590', 'Meaning ''soul,'' ''life,'' ''self.'' In this paradoxical statement, ''losing one''s life'' refers to sacrificing one''s earthly existence, personal ambitions, or self-preservation for the sake of Christ and His Kingdom. ''Finding one''s life'' refers to gaining eternal life and true fulfillment in God.', 2),
  ('ἀπολέσει', 'apolesei', 'G622', 'Future tense of ''apollymi,'' meaning ''to destroy,'' ''to lose,'' ''to perish.'' Here, it signifies the ultimate spiritual loss or ruin that results from prioritizing one''s earthly life over Christ, leading to eternal separation from God and true life.', 3),
  ('ἕνεκεν', 'heneken', 'G1752', 'Meaning ''on account of,'' ''for the sake of.'' It emphasizes the motivation behind ''losing one''s life.'' The sacrifice is not arbitrary but specifically ''for my sake'' (Christ''s sake), driven by loyalty and love for Him, which is the condition for finding true, eternal life.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = 39;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Mark 6:7', 1),
  (1, 'Luke 9:1', 2),
  (1, 'Acts 1:8', 3),
  (1, 'John 14:12', 4),
  (2, 'Mark 3:16-19', 1),
  (2, 'Luke 6:14-16', 2),
  (2, 'Acts 1:13', 3),
  (3, 'John 1:43-49', 1),
  (3, 'John 14:8', 2),
  (3, 'Matt 9:9', 3),
  (4, 'John 6:70-71', 1),
  (4, 'John 13:2', 2),
  (4, 'Acts 1:16-18', 3),
  (5, 'Matt 15:24', 1),
  (5, 'Acts 1:8', 2),
  (5, 'John 4:9', 3),
  (6, 'Matt 9:36', 1),
  (6, 'Jeremiah 50:6', 2),
  (6, 'Ezekiel 34:5-6', 3),
  (6, '1 Peter 2:25', 4),
  (7, 'Matt 3:2', 1),
  (7, 'Matt 4:17', 2),
  (7, 'Mark 1:15', 3),
  (7, 'Luke 10:9', 4),
  (8, 'Acts 3:6', 1),
  (8, 'Acts 8:6-7', 2),
  (8, '2 Corinthians 11:7', 3),
  (8, '1 Peter 4:10', 4),
  (9, 'Luke 9:3', 1),
  (9, 'Luke 10:4', 2),
  (9, '1 Corinthians 9:11-14', 3),
  (10, '1 Timothy 5:18', 1),
  (10, 'Deuteronomy 25:4', 2),
  (10, 'Luke 10:7', 3),
  (11, 'Luke 9:4', 1),
  (11, 'Luke 10:5-7', 2),
  (12, 'Luke 10:5', 1),
  (13, 'Psalm 35:13', 1),
  (14, 'Acts 13:51', 1),
  (14, 'Acts 18:6', 2),
  (14, 'Nehemiah 5:13', 3),
  (15, 'Matt 11:24', 1),
  (15, 'Genesis 19:24-28', 2),
  (15, 'Jude 1:7', 3),
  (16, 'Luke 10:3', 1),
  (16, 'Romans 16:19', 2),
  (16, 'Ephesians 5:15', 3),
  (16, 'Philippians 2:15', 4),
  (17, 'Mark 13:9', 1),
  (17, 'Luke 12:11', 2),
  (17, 'Acts 5:40', 3),
  (17, '2 Corinthians 11:24', 4),
  (18, 'Acts 24:10', 1),
  (18, 'Acts 25:6-7', 2),
  (18, 'Acts 26:1-2', 3),
  (18, 'Philippians 1:12-13', 4),
  (19, 'Mark 13:11', 1),
  (19, 'Luke 12:11-12', 2),
  (19, 'Luke 21:14-15', 3),
  (20, 'Acts 2:4', 1),
  (20, 'Acts 4:8', 2),
  (20, '2 Timothy 4:17', 3),
  (21, 'Micah 7:6', 1),
  (21, 'Mark 13:12', 2),
  (21, 'Luke 21:16', 3),
  (22, 'Matt 24:9,13', 1),
  (22, 'Mark 13:13', 2),
  (22, 'Revelation 2:10', 3),
  (23, 'Matt 24:27-31', 1),
  (23, 'Mark 13:14', 2),
  (23, 'Luke 21:20', 3),
  (24, 'Luke 6:40', 1),
  (24, 'John 13:16', 2),
  (24, 'John 15:20', 3),
  (25, 'Matt 12:24', 1),
  (25, 'John 15:18-20', 2),
  (26, 'Luke 12:2', 1),
  (26, 'Mark 4:22', 2),
  (26, '1 Corinthians 4:5', 3),
  (27, 'Luke 12:3', 1),
  (27, 'Acts 5:20', 2),
  (28, 'Luke 12:4-5', 1),
  (28, 'Hebrews 10:31', 2),
  (28, 'James 4:12', 3),
  (28, 'Revelation 20:14', 4),
  (29, 'Luke 12:6-7', 1),
  (30, '1 Samuel 14:45', 1),
  (30, 'Luke 21:18', 2),
  (31, 'Matt 6:26', 1),
  (31, 'Luke 12:7', 2),
  (32, 'Luke 12:8', 1),
  (32, 'Romans 10:9-10', 2),
  (32, 'Revelation 3:5', 3),
  (33, 'Mark 8:38', 1),
  (33, 'Luke 9:26', 2),
  (33, '2 Timothy 2:12', 3),
  (34, 'Luke 12:51-53', 1),
  (35, 'Micah 7:6', 1),
  (36, 'Psalm 41:9', 1),
  (36, 'John 13:18', 2),
  (37, 'Luke 14:26', 1),
  (37, 'Deuteronomy 33:9', 2),
  (37, 'Philippians 3:7-8', 3),
  (38, 'Matt 16:24', 1),
  (38, 'Mark 8:34', 2),
  (38, 'Luke 9:23', 3),
  (38, 'John 12:25', 4),
  (39, 'Matt 16:25', 1),
  (39, 'Mark 8:35', 2),
  (39, 'Luke 17:33', 3),
  (39, 'John 12:25', 4),
  (40, 'Matt 18:5', 1),
  (40, 'Luke 9:48', 2),
  (40, 'John 13:20', 3),
  (40, 'Galatians 4:14', 4),
  (41, '1 Kings 17:10-16', 1),
  (41, '2 Kings 4:8-17', 2),
  (41, 'Hebrews 11:31', 3),
  (42, 'Matt 25:40', 1),
  (42, 'Mark 9:41', 2),
  (42, 'Hebrews 6:10', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 10 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 10 Complete!
-- 42 verses · 6 key verses with word studies (22 words)
-- Cross-references for 42 verses (121 refs)
-- ═══════════════════════════════════════════════════════