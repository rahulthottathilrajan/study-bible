-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 5 — Divine Authority, Judgment, and Unstoppable Growth of the Early Church
-- 42 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Acts 5 narrates significant events in the early Jerusalem church, highlighting both divine judgment and miraculous growth. It begins with the tragic account of Ananias and Sapphira, whose deceit regarding their property sale results in immediate divine judgment, instilling a profound fear and reverence for God within the community. This episode underscores the Holy Spirit''s presence and authority, emphasizing the seriousness of hypocrisy in the nascent church. Following this, the apostles continue to perform numerous signs and wonders, leading to widespread healing and an exponential increase in believers, despite escalating persecution from the Sadducees. The chapter culminates in the apostles'' miraculous release from prison by an angel, their continued bold preaching in the temple, and their subsequent trial before the Sanhedrin. Gamaliel, a respected Pharisee, offers wise counsel, preventing their execution and advocating for a ''wait and see'' approach, acknowledging the possibility of divine origin. The apostles are beaten but rejoice in suffering for Christ''s name, steadfastly continuing their ministry. This chapter powerfully illustrates the early church''s divine empowerment, the cost of discipleship, and the unwavering commitment of the apostles to proclaim the resurrected Christ, even in the face of severe opposition.',
  'Divine Authority, Judgment, and Unstoppable Growth of the Early Church',
  'πνεῦμα (pneuma)',
  'From *pneō* (to breathe), *pneuma* literally means "wind," "breath," or "spirit." In Acts 5, it primarily refers to the Holy Spirit, emphasizing His divine personhood and active presence. Ananias and Sapphira lied "to the Holy Ghost" (v. 3), signifying a direct offense against God. The Spirit is also the source of the apostles'' power and witness (v. 32).',
  '["Section 1 (vv.1-11): The Judgment of Ananias and Sapphira","Section 2 (vv.12-16): Apostolic Miracles and Church Growth","Section 3 (vv.17-25): Arrest, Miraculous Release, and Continued Preaching","Section 4 (vv.26-32): The Apostles Before the Sanhedrin: Obedience to God","Section 5 (vv.33-39): Gamaliel''s Counsel and the Sanhedrin''s Decision","Section 6 (vv.40-42): Apostolic Suffering and Unceasing Witness"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 42 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'But a certain man named Ananias, with Sapphira his wife, sold a possession,',
   'Ἀνὴρ δέ τις Ἁνανίας ὀνόματι σὺν Σαπφείρῃ τῇ γυναικὶ αὐτοῦ ἐπώλησεν κτῆμα,',
   'Anēr de tis Hananias onomati syn Sappheirē tē gynaiki autou epōlēsen ktēma,',
   'This verse introduces Ananias and Sapphira, a couple in the early Jerusalem church. The phrase "sold a possession" (ἐπώλησεν κτῆμα, *epōlēsen ktēma*) indicates they owned land or property, which they decided to sell. This action itself was not problematic; rather, it mirrored the communal spirit seen in Acts 4:34-37, where believers voluntarily sold possessions and shared the proceeds with the apostles for distribution to those in need. The issue arises in the subsequent verses regarding their intent and honesty.',
   NULL),
  (2,
   'And kept back part of the price, his wife also being privy to it, and brought a certain part, and laid it at the apostles’ feet.',
   'καὶ ἐνοσφίσατο ἀπὸ τῆς τιμῆς, συνειδυίης καὶ τῆς γυναικὸς αὐτοῦ, καὶ ἐνέγκας μέρος τι παρὰ τοὺς πόδας τῶν ἀποστόλων ἔθηκεν.',
   'kai enosphisato apo tēs timēs, syneidyias kai tēs gynaikos autou, kai enenkas meros ti para tous podas tōn apostolōn ethēken.',
   'The core of their sin is revealed here: Ananias "kept back part of the price" (ἐνοσφίσατο ἀπὸ τῆς τιμῆς, *enosphisato apo tēs timēs*), a term used in the Septuagint for illicitly withholding consecrated property (Josh 7:1 for Achan). Crucially, his wife Sapphira was "privy to it" (συνειδυίης, *syneidyias*), indicating a shared conspiracy. They presented only "a certain part" (μέρος τι, *meros ti*) as if it were the whole, seeking the praise associated with full generosity while retaining personal gain. This act was a deliberate deception.',
   NULL),
  (3,
   'But Peter said, Ananias, why hath Satan filled thine heart to lie to the Holy Ghost, and to keep back part of the price of the land?',
   'Εἶπεν δὲ ὁ Πέτρος, Ἁνανία, διὰ τί ἐπλήρωσεν ὁ Σατανᾶς τὴν καρδίαν σου ψεύσασθαί σε τὸ Πνεῦμα τὸ Ἅγιον καὶ νοσφίσασθαι ἀπὸ τῆς τιμῆς τοῦ χωρίου;',
   'Eipen de ho Petros, Hanania, dia ti eplērōsen ho Satanas tēn kardian sou pseusasthai se to Pneuma to Hagion kai nosphisathai apo tēs timēs tou chōriou?',
   'Peter''s direct confrontation reveals divine insight, not human deduction. He attributes Ananias''s action to Satan, who "filled thine heart" (ἐπλήρωσεν τὴν καρδίαν σου, *eplērōsen tēn kardian sou*), indicating a profound spiritual influence leading to deception. The gravity of the sin is immediately established: it is a lie "to the Holy Ghost" (τὸ Πνεῦμα τὸ Ἅγιον, *to Pneuma to Hagion*), equating deception of the Spirit with deception of God Himself. This highlights the Holy Spirit''s divine personhood and active presence in the early church.',
   'This verse profoundly affirms the deity of the Holy Spirit, as lying to the Holy Spirit is equated with lying to God (v. 4). It also illustrates the reality of spiritual warfare, where Satan actively tempts believers to sin, particularly through hypocrisy and covetousness, undermining the integrity of the church.'),
  (4,
   'Whiles it remained, was it not thine own? and after it was sold, was it not in thine own power? why hast thou conceived this thing in thine heart? thou hast not lied unto men, but unto God.',
   'Οὐχὶ μένον σοὶ ἔμενεν καὶ πραθὲν ἐν τῇ σῇ ἐξουσίᾳ ὑπῆρχεν; Τί ὅτι ἔθου ἐν τῇ καρδίᾳ σου τὸ πρᾶγμα τοῦτο; Οὐκ ἐψεύσω ἀνθρώποις ἀλλὰ Θεῷ.',
   'Ouchi menon soi emenen kai prathen en tē sē exousia hypērchen? Ti hoti ethou en tē kardia sou to pragma touto? Ouk epseusō anthrōpois alla Theō.',
   'Peter clarifies that the sin was not in withholding funds, but in deception. He emphasizes Ananias''s complete autonomy: "was it not thine own?" (σοὶ ἔμενεν, *soi emenen*) and "in thine own power?" (ἐν τῇ σῇ ἐξουσίᾳ, *en tē sē exousia*). The early church practiced voluntary giving, not forced communalism. The sin was the "conceived this thing in thine heart" (ἔθου ἐν τῇ καρδίᾳ σου τὸ πρᾶγμα τοῦτο, *ethou en tē kardia sou to pragma touto*), a deliberate choice to deceive. The concluding statement, "thou hast not lied unto men, but unto God" (Οὐκ ἐψεύσω ἀνθρώποις ἀλλὰ Θεῷ, *Ouk epseusō anthrōpois alla Theō*), powerfully reiterates the divine nature of the Holy Spirit and the gravity of their sin.',
   'This verse underscores the principle of voluntary giving in the New Testament church, affirming private property rights while condemning deceit. It further solidifies the deity of the Holy Spirit by equating lying to the Spirit with lying directly to God, emphasizing His divine personhood and omnipresence.'),
  (5,
   'And Ananias hearing these words fell down, and gave up the ghost: and great fear came on all them that heard these things.',
   'Ἀκούων δὲ ὁ Ἁνανίας τοὺς λόγους τούτους πεσὼν ἐξέψυξεν. Καὶ ἐγένετο φόβος μέγας ἐπὶ πάντας τοὺς ἀκούοντας.',
   'Akouōn de ho Hananias tous logous toutous pesōn exepsyxen. Kai egeneto phobos megas epi pantas tous akouontas.',
   'Ananias''s immediate death is a stark demonstration of divine judgment. The phrase "gave up the ghost" (ἐξέψυξεν, *exepsyxen*) signifies his instant demise. This severe consequence served as a powerful deterrent against hypocrisy and a clear affirmation of God''s holiness and the apostles'' authority. The result was "great fear" (φόβος μέγας, *phobos megas*) among all who heard, a healthy reverence for God''s presence and power within the nascent church, ensuring its purity and integrity (Acts 2:43).',
   'This event serves as a severe warning against hypocrisy and deceit within the church, demonstrating God''s immediate judgment on sin, particularly when it defiles the community of believers. It highlights God''s holiness and His commitment to maintaining the purity of His church from its inception.'),
  (6,
   'And the young men arose, wound him up, and carried him out, and buried him.',
   'ἀναστάντες δὲ οἱ νεώτεροι συνέστειλαν αὐτὸν καὶ ἐξενέγκαντες ἔθαψαν.',
   'anastantes de hoi neōteroi synesteilan auton kai exenenkantes ethapsan.',
   'The "young men" (οἱ νεώτεροι, *hoi neōteroi*) are likely a group of younger male members of the community, perhaps serving as deacons or simply available for such tasks. Their swift action to "wound him up" (συνέστειλαν, *synesteilan* - implying wrapping the body for burial) and bury him without delay underscores the suddenness and finality of the judgment. This immediate burial, without the usual mourning rituals, emphasizes the divine nature of the event and the need for prompt action.',
   NULL),
  (7,
   'And it was about the space of three hours after, when his wife, not knowing what was done, came in.',
   'Ἐγένετο δὲ ὡς ὡρῶν τριῶν διάστημα καὶ ἡ γυνὴ αὐτοῦ μὴ εἰδυῖα τὸ γεγονὸς εἰσῆλθεν.',
   'Egeneto de hōs hōrōn triōn diastēma kai hē gynē autou mē eidyia to gegonos eisēlthen.',
   'The three-hour interval serves to heighten the dramatic tension and ensures Sapphira''s independent culpability. Her "not knowing what was done" (μὴ εἰδυῖα τὸ γεγονὸς, *mē eidyia to gegonos*) confirms that she had no opportunity to concoct a story or be influenced by her husband''s fate. This detail emphasizes that her deception was her own, a conscious choice made in concert with Ananias, and not merely a reaction to his demise.',
   NULL),
  (8,
   'And Peter answered unto her, Tell me whether ye sold the land for so much? And she said, Yea, for so much.',
   'ἀπεκρίθη δὲ αὐτῇ ὁ Πέτρος, Εἰπέ μοι, εἰ τοσούτου τὸ χωρίον ἀπέδοσθε; Ἡ δὲ εἶπεν, Ναί, τοσούτου.',
   'apekrihthe de autē ho Petros, Eipe moi, ei tosoutou to chōrion apedosthe? Hē de eipen, Nai, tosoutou.',
   'Peter gives Sapphira a direct opportunity to confess the truth, asking if they "sold the land for so much?" (εἰ τοσούτου τὸ χωρίον ἀπέδοσθε, *ei tosoutou to chōrion apedosthe*), implying the amount Ananias had claimed. Her unequivocal "Yea, for so much" (Ναί, τοσούτου, *Nai, tosoutou*) confirms her complicity and deliberate lie. This act of deception, even after a period for reflection, demonstrates her hardened heart and shared guilt with her husband.',
   NULL),
  (9,
   'Then Peter said unto her, How is it that ye have agreed together to tempt the Spirit of the Lord? behold, the feet of them which have buried thy husband are at the door, and shall carry thee out.',
   'ὁ δὲ Πέτρος πρὸς αὐτήν, Τί ὅτι συνεφωνήθη ὑμῖν πειράσαι τὸ Πνεῦμα Κυρίου; ἰδοὺ οἱ πόδες τῶν θαψάντων τὸν ἄνδρα σου ἐπὶ τῇ θύρᾳ καὶ ἐξοίσουσίν σε.',
   'ho de Petros pros autēn, Ti hoti synephōnēthē hymin peirasai to Pneuma Kyriou? idou hoi podes tōn thapsantōn ton andra sou epi tē thyra kai exoisousin se.',
   'Peter exposes their joint conspiracy: "How is it that ye have agreed together to tempt the Spirit of the Lord?" (Τί ὅτι συνεφωνήθη ὑμῖν πειράσαι τὸ Πνεῦμα Κυρίου, *Ti hoti synephōnēthē hymin peirasai to Pneuma Kyriou*). "Tempt the Spirit" (πειράσαι τὸ Πνεῦμα, *peirasai to Pneuma*) means to test God''s patience or knowledge, challenging His omnipotence and omniscience. The immediate consequence is foretold with chilling precision, linking her fate directly to her husband''s. The young men are literally "at the door," ready to carry her out.',
   'This verse highlights the corporate responsibility in sin and the severe consequences of deliberately testing or challenging the Holy Spirit''s authority and knowledge. It reinforces the Holy Spirit''s divine personhood and His active role in discerning and judging sin within the church.'),
  (10,
   'Then fell she down straightway at his feet, and yielded up the ghost: and the young men came in, and found her dead, and, carrying her forth, buried her by her husband.',
   'ἔπεσεν δὲ παραχρῆμα πρὸς τοὺς πόδας αὐτοῦ καὶ ἐξέψυξεν. Εἰσελθόντες δὲ οἱ νεανίσκοι εὗρον αὐτὴν νεκράν, καὶ ἐξενέγκαντες ἔθαψαν πρὸς τὸν ἄνδρα αὐτῆς.',
   'epesen de parachrēma pros tous podas autou kai exepsyxen. Eiselthontes de hoi neaniskoi heuron autēn nekran, kai exenenkantes ethapsan pros ton andra autēs.',
   'Like her husband, Sapphira''s death is instantaneous, "straightway" (παραχρῆμα, *parachrēma*), confirming the divine judgment. The young men, entering as predicted, find her dead and carry her out for burial "by her husband" (πρὸς τὸν ἄνδρα αὐτῆς, *pros ton andra autēs*). This swift and public judgment served as a powerful object lesson for the early church, emphasizing the seriousness of sin and the holiness of God in their midst. It underscored the need for integrity and truthfulness among believers.',
   'This second immediate death reinforces the severity of God''s judgment against hypocrisy and deceit within the church. It demonstrates that God takes sin seriously, especially when it undermines the integrity and witness of His people, establishing a clear standard for purity in the early Christian community.'),
  (11,
   'And great fear came upon all the church, and upon as many as heard these things.',
   'Καὶ ἐγένετο φόβος μέγας ἐφ’ ὅλην τὴν ἐκκλησίαν καὶ ἐπὶ πάντας τοὺς ἀκούοντας ταῦτα.',
   'Kai egeneto phobos megas eph’ holēn tēn ekklēsian kai epi pantas tous akouontas tauta.',
   'The "great fear" (φόβος μέγας, *phobos megas*) that spread "upon all the church" (ἐφ’ ὅλην τὴν ἐκκλησίαν, *eph’ holēn tēn ekklēsian*) and beyond was a holy reverence, not mere terror. This fear was a recognition of God''s active presence and judgment within the community, fostering a sense of awe and promoting spiritual purity. This event established a precedent for the seriousness of commitment required in the early Christian movement and served to protect the integrity of the burgeoning church.',
   'The "great fear" signifies a healthy, reverential awe of God''s holiness and power, which is essential for the purity and spiritual growth of the church. This divine judgment served to purify the early community and establish a clear standard against hypocrisy, ensuring the integrity of its witness.'),
  (12,
   'And by the hands of the apostles were many signs and wonders wrought among the people; (and they were all with one accord in Solomon’s porch.',
   'Διὰ δὲ τῶν χειρῶν τῶν ἀποστόλων ἐγίνετο σημεῖα καὶ τέρατα πολλὰ ἐν τῷ λαῷ. Καὶ ἦσαν πάντες ὁμοθυμαδὸν ἐν τῇ Στοᾷ Σολομῶνος.',
   'Dia de tōn cheirōn tōn apostolōn egineto sēmeia kai terata polla en tō laō. Kai ēsan pantes homothymadon en tē Stoā Solomōnos.',
   'Following the judgment of Ananias and Sapphira, the narrative shifts to the apostles'' continued ministry, marked by "many signs and wonders" (σημεῖα καὶ τέρατα πολλὰ, *sēmeia kai terata polla*). These miracles authenticated their message and divine authority (Heb 2:3-4). The phrase "with one accord" (ὁμοθυμαδὸν, *homothymadon*) emphasizes the unity and harmony of the believers, who gathered publicly "in Solomon’s porch" (ἐν τῇ Στοᾷ Σολομῶνος, *en tē Stoā Solomōnos*), a prominent colonnade in the temple complex, indicating their boldness and visibility.',
   'This verse highlights the divine authentication of the apostles'' ministry through miraculous "signs and wonders," confirming their message as from God. It also emphasizes the importance of unity ("one accord") among believers, which facilitates powerful corporate witness and ministry.'),
  (13,
   'And of the rest durst no man join himself to them: but the people magnified them.',
   'τῶν δὲ λοιπῶν οὐδεὶς ἐτόλμα κολλᾶσθαι αὐτοῖς, ἀλλ’ ἐμεγάλυνεν αὐτοὺς ὁ λαός.',
   'Tōn de loipōn oudeis etolma kollasthai autois, all’ emegalynen autous ho laos.',
   'The "rest" (τῶν δὲ λοιπῶν, *tōn de loipōn*) likely refers to those outside the committed core of believers, perhaps onlookers or nominal adherents. The judgment of Ananias and Sapphira instilled a healthy fear, so "no man durst join himself to them" (οὐδεὶς ἐτόλμα κολλᾶσθαι αὐτοῖς, *oudeis etolma kollasthai autois*) in a superficial or deceptive way. However, "the people magnified them" (ἐμεγάλυνεν αὐτοὺς ὁ λαός, *emegalynen autous ho laos*), indicating respect and awe for the apostles, recognizing their divine authority and the power at work through them.',
   'This verse illustrates the dual effect of divine judgment and power: it purifies the church by deterring false converts while simultaneously enhancing the respect and credibility of genuine believers in the eyes of the public. True reverence for God fosters a holy fear that protects the integrity of the Christian community.'),
  (14,
   'And believers were the more added to the Lord, multitudes both of men and women.)',
   'μᾶλλον δὲ προσετίθεντο πιστεύοντες τῷ Κυρίῳ πλήθη ἀνδρῶν τε καὶ γυναικῶν,',
   'mallon de prosetithento pisteuontes tō Kyriō plēthē andrōn te kai gynaikōn,',
   'Despite the fear and the deterrent effect on superficial adherents, genuine growth continued exponentially. "Believers were the more added to the Lord" (μᾶλλον δὲ προσετίθεντο πιστεύοντες τῷ Κυρίῳ, *mallon de prosetithento pisteuontes tō Kyriō*), emphasizing that conversion was a commitment "to the Lord," not just to a movement. The phrase "multitudes both of men and women" (πλήθη ἀνδρῶν τε καὶ γυναικῶν, *plēthē andrōn te kai gynaikōn*) highlights the widespread appeal and inclusivity of the gospel, transcending social and gender barriers.',
   'This verse demonstrates that divine judgment and purity within the church do not hinder, but rather facilitate, genuine spiritual growth. The emphasis on "believers added to the Lord" highlights that true conversion is a personal commitment to Christ, resulting in numerical growth of genuine disciples.'),
  (15,
   'Insomuch that they brought forth the sick into the streets, and laid them on beds and couches, that at the least the shadow of Peter passing by might overshadow some of them.',
   'ὥστε καὶ εἰς τὰς πλατείας ἐκφέρειν τοὺς ἀσθενεῖς καὶ τιθέναι ἐπὶ κλινῶν καὶ κραβάττων, ἵνα ἐρχομένου Πέτρου κἂν ἡ σκιά τις αὐτοῦ ἐπισκιάσῃ τινά.',
   'hoste kai eis tas plateias ekpherein tous astheneis kai tithenai epi klinōn kai krabattōn, hina erchomenou Petrou kan hē skia tis autou episkiasē tina.',
   'The extent of the apostles'' miraculous power, particularly Peter''s, is vividly portrayed. People brought the sick "into the streets" (εἰς τὰς πλατείας, *eis tas plateias*) on "beds and couches" (κλινῶν καὶ κραβάττων, *klinōn kai krabattōn*), hoping that even "the shadow of Peter passing by might overshadow some of them" (κἂν ἡ σκιά τις αὐτοῦ ἐπισκιάσῃ τινά, *kan hē skia tis autou episkiasē tina*). This reflects the profound faith and desperation of the people, and the extraordinary divine power working through the apostles, reminiscent of Jesus'' own healing ministry (Mark 6:56).',
   'This verse illustrates the extraordinary power of God working through His apostles, authenticating their message and ministry. While not a prescriptive model for all believers, it demonstrates God''s willingness to use unusual means to display His power and draw people to Himself, emphasizing the divine origin of the early church''s authority.'),
  (16,
   'There came also a multitude out of the cities round about unto Jerusalem, bringing sick folks, and them which were vexed with unclean spirits: and they were healed every one.',
   'συνήρχετο δὲ καὶ τὸ πλῆθος τῶν πέριξ πόλεων εἰς Ἱερουσαλὴμ φέροντες ἀσθενεῖς καὶ ὀχλουμένους ὑπὸ πνευμάτων ἀκαθάρτων, οἵτινες ἐθεραπεύοντο ἅπαντες.',
   'synērcheto de kai to plēthos tōn perix poleōn eis Hierousalēm pherontes astheneis kai ochloumenous hypo pneumatōn akathartōn, hoitines etherapeuonto hapantes.',
   'The fame of the apostles'' healing ministry spread far beyond Jerusalem, drawing "a multitude out of the cities round about" (τὸ πλῆθος τῶν πέριξ πόλεων, *to plēthos tōn perix poleōn*). They brought "sick folks, and them which were vexed with unclean spirits" (ἀσθενεῖς καὶ ὀχλουμένους ὑπὸ πνευμάτων ἀκαθάρτων, *astheneis kai ochloumenous hypo pneumatōn akathartōn*). The crucial detail is that "they were healed every one" (ἐθεραπεύοντο ἅπαντες, *etherapeuonto hapantes*), signifying a comprehensive and undeniable display of divine power, further validating the apostles'' message and the truth of the gospel.',
   'This verse underscores the comprehensive nature of God''s healing power, extending to both physical ailments and demonic oppression. The universal healing ("every one") serves as a powerful testimony to the authenticity of the apostolic ministry and the sovereign power of God over all sickness and evil.'),
  (17,
   'Then the high priest rose up, and all they that were with him, (which is the sect of the Sadducees,) and were filled with indignation,',
   'Ἀναστὰς δὲ ὁ ἀρχιερεὺς καὶ πάντες οἱ σὺν αὐτῷ, ἡ οὖσα αἵρεσις τῶν Σαδδουκαίων, ἐπλήσθησαν ζήλου',
   'Anastas de ho archiereus kai pantes hoi syn autō, hē ousa hairesis tōn Saddoukaiōn, eplēsthēsan zēlou',
   'The success of the apostles provoked renewed opposition. "The high priest" (ὁ ἀρχιερεὺς, *ho archiereus*) and his associates, identified as "the sect of the Sadducees" (ἡ οὖσα αἵρεσις τῶν Σαδδουκαίων, *hē ousa hairesis tōn Saddoukaiōn*), were "filled with indignation" (ἐπλήσθησαν ζήλου, *eplēsthēsan zēlou*). This "indignation" or "jealousy" stemmed from several factors: the apostles'' growing influence, their teaching of the resurrection (which Sadducees denied, Acts 4:2), and the challenge to their religious authority.',
   'This verse illustrates the inherent conflict between divine truth and human religious systems that reject it. The Sadducees'' "indignation" highlights their opposition to the resurrection, a core Christian doctrine, and their jealousy over the apostles'' growing influence, demonstrating how spiritual truth often provokes worldly hostility.'),
  (18,
   'And laid their hands on the apostles, and put them in the common prison.',
   'καὶ ἐπέβαλον τὰς χεῖρας ἐπὶ τοὺς ἀποστόλους καὶ ἔθεντο αὐτοὺς ἐν τηρήσει δημοσίᾳ.',
   'kai epebalon tas cheiras epi tous apostolous kai ethento autous en tērēsei dēmosia.',
   'The Sadducees'' indignation quickly escalated to action. They "laid their hands on the apostles" (ἐπέβαλον τὰς χεῖρας ἐπὶ τοὺς ἀποστόλους, *epebalon tas cheiras epi tous apostolous*), signifying their arrest, and "put them in the common prison" (ἔθεντο αὐτοὺς ἐν τηρήσει δημοσίᾳ, *ethento autous en tērēsei dēmosia*). This was an attempt to silence their preaching and curb their influence, a direct act of persecution against the burgeoning Christian movement. This marks the second imprisonment of the apostles (cf. Acts 4:3).',
   NULL),
  (19,
   'But the angel of the Lord by night opened the prison doors, and brought them forth, and said,',
   'Ἄγγελος δὲ Κυρίου διὰ νυκτὸς ἀνοίξας τὰς θύρας τῆς φυλακῆς ἐξαγαγών τε αὐτοὺς εἶπεν,',
   'Angelos de Kyriou dia nyktos anoixas tas thyras tēs phylakēs exagagōn te autous eipen,',
   'In a dramatic display of divine intervention, "the angel of the Lord" (Ἄγγελος δὲ Κυρίου, *Angelos de Kyriou*) miraculously "opened the prison doors" (ἀνοίξας τὰς θύρας τῆς φυλακῆς, *anoixas tas thyras tēs phylakēs*) "by night" (διὰ νυκτὸς, *dia nyktos*) and led the apostles out. This supernatural release underscores God''s sovereignty over human authorities and His commitment to protecting and advancing His gospel message. It is a clear sign that their mission was divinely ordained and protected.',
   'This miraculous intervention demonstrates God''s sovereign power to deliver His servants from persecution and to ensure the continuation of His divine plan. It affirms that no human authority can ultimately thwart God''s will, and that He actively protects those who faithfully proclaim His word.'),
  (20,
   'Go, stand and speak in the temple to the people all the words of this life.',
   'Πορεύεσθε καὶ σταθέντες ἐν τῷ ἱερῷ λαλεῖτε τῷ λαῷ πάντα τὰ ῥήματα τῆς ζωῆς ταύτης.',
   'Poreuesthe kai stathentes en tō hierō laleite tō laō panta ta rhēmata tēs zōēs tautēs.',
   'The angel''s instruction is not to flee, but to return immediately to the public square. They are commanded to "stand and speak in the temple" (σταθέντες ἐν τῷ ἱερῷ λαλεῖτε, *stathentes en tō hierō laleite*) – the very place of their arrest – and proclaim "all the words of this life" (πάντα τὰ ῥήματα τῆς ζωῆς ταύτης, *panta ta rhēmata tēs zōēs tautēs*). This phrase refers to the gospel message of salvation and eternal life through Jesus Christ, emphasizing its vital importance and the urgency of its proclamation.',
   'This divine command highlights the supreme importance of proclaiming the gospel ("words of this life") publicly and boldly, even in the face of persecution. It demonstrates God''s unwavering commitment to His message and His expectation that His servants will prioritize obedience to Him above fear of human authorities.'),
  (21,
   'And when they heard that, they entered into the temple early in the morning, and taught. But the high priest came, and they that were with him, and called the council together, and all the senate of the children of Israel, and sent to the prison to have them brought.',
   'ἀκούσαντες δὲ εἰσῆλθον ὑπὸ τὸν ὄρθρον εἰς τὸ ἱερὸν καὶ ἐδίδασκον. Παραγενόμενος δὲ ὁ ἀρχιερεὺς καὶ οἱ σὺν αὐτῷ συνεκάλεσαν τὸ συνέδριον καὶ πᾶσαν τὴν γερουσίαν τῶν υἱῶν Ἰσραὴλ καὶ ἀπέστειλαν εἰς τὸ δεσμωτήριον ἀχθῆναι αὐτούς.',
   'akousantes de eisēlthon hypo ton orthron eis to hieron kai edidaskon. Paragenomenos de ho archiereus kai hoi syn autō synekalesan to synedrion kai pasan tēn gerousian tōn hyiōn Israēl kai apesteilan eis to desmōtērion achthēnai autous.',
   'The apostles'' immediate obedience is striking: "early in the morning" (ὑπὸ τὸν ὄρθρον, *hypo ton orthron*) they were back in the temple, teaching. Meanwhile, the high priest and his council, including "all the senate of the children of Israel" (πᾶσαν τὴν γερουσίαν τῶν υἱῶν Ἰσραὴλ, *pasan tēn gerousian tōn hyiōn Israēl*), convened to deal with the apostles, unaware of the miraculous escape. Their sending to the prison to retrieve them sets up the dramatic reveal.',
   NULL),
  (22,
   'But when the officers came, and found them not in the prison, they returned, and told,',
   'οἱ δὲ ὑπηρέται παραγενόμενοι οὐχ εὗρον αὐτοὺς ἐν τῷ δεσμωτηρίῳ, ἀνακάμψαντες δὲ ἀπήγγειλαν',
   'hoi de hypēretai paragenomenoi ouch heuron autous en tō desmōtēriō, anakampsantes de apēngeilan',
   'The "officers" (οἱ ὑπηρέται, *hoi hypēretai*) sent by the Sanhedrin discovered the empty prison. Their report back to the council would have caused significant consternation and confusion, highlighting the inexplicable nature of the apostles'' disappearance. This incident further demonstrates God''s power to frustrate human plans and protect His messengers, creating an undeniable mystery for the authorities.',
   NULL),
  (23,
   'Saying, The prison truly found we shut with all safety, and the keepers standing without before the doors: but when we had opened, we found no man within.',
   'λέγοντες ὅτι Τὸ δεσμωτήριον εὕρομεν κεκλεισμένον ἐν πάσῃ ἀσφαλείᾳ καὶ τοὺς φύλακας ἑστῶτας ἐπὶ τῶν θυρῶν, ἀνοίξαντες δὲ ἔσω οὐδένα εὕρομεν.',
   'legontes hoti To desmōtērion heurimen kekleismenon en pasē asphaleia kai tous phylakas hestōtas epi tōn thyrōn, anoixantes de esō oudena heurimen.',
   'The officers'' report emphasizes the impossibility of a natural escape. The prison was "shut with all safety" (κεκλεισμένον ἐν πάσῃ ἀσφαλείᾳ, *kekleismenon en pasē asphaleia*), and "the keepers standing without before the doors" (τοὺς φύλακας ἑστῶτας ἐπὶ τῶν θυρῶν, *tous phylakas hestōtas epi tōn thyrōn*). Yet, "we found no man within" (ἔσω οὐδένα εὕρομεν, *esō oudena heurimen*). This detailed account underscores the miraculous nature of the escape, leaving no room for human explanation and pointing directly to divine intervention.',
   'This verse provides compelling evidence of a supernatural event, demonstrating God''s ability to override physical barriers and human security measures. It serves as a powerful testament to divine intervention in the affairs of men, affirming God''s active involvement in protecting and empowering His church.'),
  (24,
   'Now when the high priest and the captain of the temple and the chief priests heard these things, they doubted of them whereunto this would grow.',
   'Ὡς δὲ ἤκουσαν τοὺς λόγους τούτους ὅ τε στρατηγὸς τοῦ ἱεροῦ καὶ οἱ ἀρχιερεῖς, διηπόρουν περὶ αὐτῶν τί ἂν γένοιτο τοῦτο.',
   'Hōs de ēkousan tous logous toutous ho te stratēgos tou hierou kai hoi archiereis, diēporoun peri autōn ti an genoito touto.',
   'The report caused significant perplexity among the authorities. "The high priest and the captain of the temple and the chief priests" (ὁ στρατηγὸς τοῦ ἱεροῦ καὶ οἱ ἀρχιερεῖς, *ho stratēgos tou hierou kai hoi archiereis*) "doubted of them whereunto this would grow" (διηπόρουν περὶ αὐτῶν τί ἂν γένοιτο τοῦτο, *diēporoun peri autōn ti an genoito touto*). They were utterly bewildered, unable to explain the escape and concerned about the implications for their authority and the growing movement. This confusion highlights the divine hand at work, frustrating their attempts to control the situation.',
   NULL),
  (25,
   'Then came one and told them, saying, Behold, the men whom ye put in prison are standing in the temple, and teaching the people.',
   'Παραγενόμενος δέ τις ἀπήγγειλεν αὐτοῖς ὅτι Ἰδοὺ οἱ ἄνδρες οὓς ἔθεσθε ἐν τῇ φυλακῇ εἰσὶν ἐν τῷ ἱερῷ ἑστῶτες καὶ διδάσκοντες τὸν λαόν.',
   'Paragenomenos de tis apēngeilen autois hoti Idou hoi андрес hous etheste en tē phylakē eisin en tō hierō hestōtes kai didaskontes ton laon.',
   'The mystery is solved, but the situation becomes even more audacious from the Sanhedrin''s perspective. A messenger reports that the very men they imprisoned are now "standing in the temple, and teaching the people" (ἐν τῷ ἱερῷ ἑστῶτες καὶ διδάσκοντες τὸν λαόν, *en tō hierō hestōtes kai didaskontes ton laon*). This public defiance, following a miraculous escape, would have intensified the council''s frustration and anger, yet also underscored the apostles'' unwavering commitment to their divine commission.',
   NULL),
  (26,
   'Then went the captain with the officers, and brought them without violence: for they feared the people, lest they should have been stoned.',
   'Τότε ἀπελθὼν ὁ στρατηγὸς σὺν τοῖς ὑπηρέταις ἤγαγεν αὐτοὺς οὐ μετὰ βίας, ἐφοβοῦντο γὰρ τὸν λαόν, μὴ λιθασθῶσιν.',
   'Tote apelthōn ho stratēgos syn tois hypēretais ēgagen autous ou meta bias, ephobounto gar ton laon, mē lithasthōsin.',
   'The "captain with the officers" (ὁ στρατηγὸς σὺν τοῖς ὑπηρέταις, *ho stratēgos syn tois hypēretais*) apprehended the apostles "without violence" (οὐ μετὰ βίας, *ou meta bias*). This cautious approach was driven by their fear of "the people" (τὸν λαόν, *ton laon*), who held the apostles in high regard (Acts 5:13) and might have reacted violently, even stoning the officers, if the apostles were treated harshly. This highlights the apostles'' popular support and the authorities'' precarious position.',
   NULL),
  (27,
   'And when they had brought them, they set them before the council: and the high priest asked them,',
   'ἀγαγόντες δὲ αὐτοὺς ἔστησαν ἐν τῷ συνεδρίῳ. Καὶ ἐπηρώτησεν αὐτοὺς ὁ ἀρχιερεὺς',
   'agagontes de autous estēsan en tō synedriō. Kai epērōtēsen autous ho archiereus',
   'The apostles were brought before the Sanhedrin, the supreme Jewish judicial body. This setting underscores the official and serious nature of the confrontation. The high priest, as the presiding officer, initiated the questioning, seeking to reassert the council''s authority and understand the apostles'' defiance. This was a direct challenge to the religious establishment.',
   NULL),
  (28,
   'Saying, Did not we straitly command you that ye should not teach in this name? and, behold, ye have filled Jerusalem with your doctrine, and intend to bring this man’s blood upon us.',
   'λέγων, Οὐ παραγγελίᾳ παρηγγείλαμεν ὑμῖν μὴ διδάσκειν ἐπὶ τῷ ὀνόματι τούτῳ; καὶ ἰδοὺ πεπληρώκατε τὴν Ἱερουσαλὴμ τῆς διδαχῆς ὑμῶν, καὶ βούλεσθε ἐπαγαγεῖν ἐφ’ ἡμᾶς τὸ αἷμα τοῦ ἀνθρώπου τούτου.',
   'legōn, Ou parangelia parēngeilamen hymin mē didaskein epi tō onomati toutō? kai idou peplērōkate tēn Hierousalēm tēs didachēs hymōn, kai boulesthe epagagein eph’ hēmas to haima tou anthrōpou toutou.',
   'The high priest''s accusation has three parts: (1) a direct charge of disobedience to their previous "straitly command" (παραγγελίᾳ παρηγγείλαμεν, *parangelia parēngeilamen*) not to teach "in this name" (ἐπὶ τῷ ὀνόματι τούτῳ, *epi tō onomati toutō* – referring to Jesus); (2) an acknowledgment of the gospel''s widespread impact, "ye have filled Jerusalem with your doctrine" (πεπληρώκατε τὴν Ἱερουσαλὴμ τῆς διδαχῆς ὑμῶν, *peplērōkate tēn Hierousalēm tēs didachēs hymōn*); and (3) a fear that the apostles "intend to bring this man’s blood upon us" (βούλεσθε ἐπαγαγεῖν ἐφ’ ἡμᾶς τὸ αἷμα τοῦ ἀνθρώπου τούτου, *boulesthe epagagein eph’ hēmas to haima tou anthrōpou toutou*), recalling the crowd''s cry at Jesus'' trial (Matt 27:25).',
   'This verse reveals the Sanhedrin''s fear and guilt regarding Jesus'' crucifixion, demonstrating their rejection of His messianic claims. It highlights the power of the gospel to permeate society and the inherent conflict between human authority that seeks to suppress truth and the divine mandate to proclaim it.'),
  (29,
   'Then Peter and the other apostles answered and said, We ought to obey God rather than men.',
   'Ἀποκριθεὶς δὲ Πέτρος καὶ οἱ ἀπόστολοι εἶπαν, Πειθαρχεῖν δεῖ Θεῷ μᾶλλον ἢ ἀνθρώποις.',
   'Apokritheis de Petros kai hoi apostoloi eipan, Peitharchein dei Theō mallon ē anthrōpois.',
   'Peter, speaking for all the apostles, delivers a concise and unwavering declaration of principle: "We ought to obey God rather than men" (Πειθαρχεῖν δεῖ Θεῷ μᾶλλον ἢ ἀνθρώποις, *Peitharchein dei Theō mallon ē anthrōpois*). This statement, a direct reiteration from their previous trial (Acts 4:19), asserts the supremacy of divine authority over human commands, especially when those commands contradict God''s will. It is a foundational principle for Christian civil disobedience.',
   'This is a foundational declaration of Christian ethics, establishing the principle that obedience to God takes precedence over obedience to human authorities when their commands conflict. It empowers believers to stand firm in their faith and witness, even in the face of persecution, recognizing God''s ultimate sovereignty.'),
  (30,
   'The God of our fathers raised up Jesus, whom ye slew and hanged on a tree.',
   'Ὁ Θεὸς τῶν πατέρων ἡμῶν ἤγειρεν Ἰησοῦν, ὃν ὑμεῖς διεχειρίσασθε κρεμάσαντες ἐπὶ ξύλου.',
   'Ho Theos tōn paterōn hēmōn ēgeiren Iēsoun, hon hymeis diecheirisasthe kremasantes epi xylou.',
   'Peter continues his bold testimony, directly confronting the Sanhedrin with their culpability. He identifies God as "The God of our fathers" (Ὁ Θεὸς τῶν πατέρων ἡμῶν, *Ho Theos tōn paterōn hēmōn*), linking Jesus to Israel''s covenant history. He then declares that this God "raised up Jesus" (ἤγειρεν Ἰησοῦν, *ēgeiren Iēsoun*), referring to the resurrection, and pointedly accuses the council: "whom ye slew and hanged on a tree" (ὃν ὑμεῖς διεχειρίσασθε κρεμάσαντες ἐπὶ ξύλου, *hon hymeis diecheirisasthe kremasantes epi xylou*). "Hanged on a tree" is a Deuteronomic reference to a cursed death (Deut 21:23), emphasizing the shame and ignominy of the cross.',
   'This verse presents the core of the apostolic kerygma: God''s resurrection of Jesus, whom the Jewish authorities rejected and crucified. It highlights the divine vindication of Jesus and directly confronts the Sanhedrin with their responsibility in His death, emphasizing the redemptive purpose of the cross despite human sin.'),
  (31,
   'Him hath God exalted with his right hand to be a Prince and a Saviour, for to give repentance to Israel, and forgiveness of sins.',
   'τοῦτον ὁ Θεὸς ἀρχηγὸν καὶ Σωτῆρα ὕψωσεν τῇ δεξιᾷ αὐτοῦ δοῦναι μετάνοιαν τῷ Ἰσραὴλ καὶ ἄφεσιν ἁμαρτιῶν.',
   'touton ho Theos archēgon kai Sōtēra hypsōsen tē dexia autou dounai metanoian tō Israēl kai aphesin hamartiōn.',
   'Peter continues, proclaiming Jesus'' exaltation: "Him hath God exalted with his right hand" (τοῦτον ὁ Θεὸς ἀρχηγὸν καὶ Σωτῆρα ὕψωσεν τῇ δεξιᾷ αὐτοῦ, *touton ho Theos archēgon kai Sōtēra hypsōsen tē dexia autou*). "Right hand" signifies power and authority. Jesus is declared "a Prince" (ἀρχηγὸν, *archēgon* - leader, pioneer, author) and "a Saviour" (Σωτῆρα, *Sōtēra*). The purpose of this exaltation is "to give repentance to Israel, and forgiveness of sins" (δοῦναι μετάνοιαν τῷ Ἰσραὴλ καὶ ἄφεσιν ἁμαρτιῶν, *dounai metanoian tō Israēl kai aphesin hamartiōn*), emphasizing God''s gracious offer of salvation to His chosen people.',
   'This verse articulates Jesus'' exalted status as "Prince and Saviour," emphasizing His divine authority and redemptive purpose. It highlights that repentance and forgiveness of sins are gifts from God, made possible through Christ''s atoning work and exaltation, offered specifically to Israel but ultimately for all who believe.'),
  (32,
   'And we are his witnesses of these things; and so is also the Holy Ghost, whom God hath given to them that obey him.',
   'καὶ ἡμεῖς ἐσμεν μάρτυρες τῶν ῥημάτων τούτων, καὶ τὸ Πνεῦμα τὸ Ἅγιον ὃ ἔδωκεν ὁ Θεὸς τοῖς πειθαρχοῦσιν αὐτῷ.',
   'kai hēmeis esmen martyres tōn rhēmatōn toutōn, kai to Pneuma to Hagion ho edōken ho Theos tois peitharchousin autō.',
   'The apostles assert their authority as eyewitnesses: "we are his witnesses of these things" (ἡμεῖς ἐσμεν μάρτυρες τῶν ῥημάτων τούτων, *hēmeis esmen martyres tōn rhēmatōn toutōn*). Crucially, their testimony is corroborated by "the Holy Ghost" (τὸ Πνεῦμα τὸ Ἅγιον, *to Pneuma to Hagion*), who also bears witness. The Spirit is given "to them that obey him" (τοῖς πειθαρχοῦσιν αὐτῷ, *tois peitharchousin autō*), linking the reception of the Spirit to obedience to God, reinforcing the principle stated in verse 29.',
   'This verse emphasizes the dual witness to Christ''s resurrection and exaltation: the apostles'' eyewitness testimony and the internal, empowering witness of the Holy Spirit. It highlights that the Holy Spirit is given to those who obey God, underscoring the inseparable link between faith, obedience, and the Spirit''s presence in a believer''s life.'),
  (33,
   'When they heard that, they were cut to the heart, and took counsel to slay them.',
   'Οἱ δὲ ἀκούσαντες διεπρίοντο καὶ ἐβουλεύοντο ἀνελεῖν αὐτούς.',
   'Hoi de akousantes dieprionto kai ebouleuonto anelein autous.',
   'The apostles'' bold testimony, particularly the accusation of their role in Jesus'' death and the assertion of God''s authority, provoked extreme anger in the Sanhedrin. They "were cut to the heart" (διεπρίοντο, *dieprionto*), a strong verb meaning "to be sawn asunder" or "to be enraged." This intense fury led them to "took counsel to slay them" (ἐβουλεύοντο ἀνελεῖν αὐτούς, *ebouleuonto anelein autous*), revealing their murderous intent, similar to their reaction to Stephen (Acts 7:54).',
   'This verse illustrates the hardened heart''s response to divine truth: instead of repentance, it often leads to increased hostility and murderous intent. It reveals the spiritual blindness and opposition of those who reject Christ, even when confronted with undeniable evidence and divine authority.'),
  (34,
   'Then stood there up one in the council, a Pharisee, named Gamaliel, a doctor of the law, had in reputation among all the people, and commanded to put the apostles forth a little space;',
   'ἀναστὰς δέ τις ἐν τῷ συνεδρίῳ Φαρισαῖος, ὀνόματι Γαμαλιήλ, νομοδιδάσκαλος τίμιος παντὶ τῷ λαῷ, ἐκέλευσεν ἔξω βραχὺ τοὺς ἀποστόλους ποιῆσαι.',
   'anastas de tis en tō synedriō Pharisaios, onomati Gamaliēl, nomodidaskalos timios panti tō laō, ekelesen exō brachy tous apostolous poiēsai.',
   'At this critical juncture, "Gamaliel" (Γαμαλιήλ, *Gamaliēl*) intervenes. He was a prominent "Pharisee" (Φαρισαῖος, *Pharisaios*) and a highly respected "doctor of the law" (νομοδιδάσκαλος τίμιος, *nomodidaskalos timios*), even Paul''s teacher (Acts 22:3). His reputation "among all the people" (παντὶ τῷ λαῷ, *panti tō laō*) gave his counsel significant weight. He wisely "commanded to put the apostles forth a little space" (ἐκέλευσεν ἔξω βραχὺ τοὺς ἀποστόλους ποιῆσαι, *ekelesen exō brachy tous apostolous poiēsai*) to allow for private deliberation.',
   'This verse introduces Gamaliel, a figure of wisdom and moderation, whose intervention demonstrates God''s providential use of individuals, even those outside the immediate Christian community, to protect His purposes and people. His counsel highlights the importance of discernment and patience in dealing with spiritual movements.'),
  (35,
   'And said unto them, Ye men of Israel, take heed to yourselves what ye intend to do as touching these men.',
   'εἶπέν τε πρὸς αὐτούς, Ἄνδρες Ἰσραηλῖται, προσέχετε ἑαυτοῖς ἐπὶ τοῖς ἀνθρώποις τούτοις τί μέλλετε πράσσειν.',
   'eipen te pros autous, Andres Israēlitai, prosechete heautois epi tois anthrōpois toutois ti mellete prassein.',
   'Gamaliel addresses the council with a cautionary appeal: "Ye men of Israel, take heed to yourselves what ye intend to do as touching these men" (Ἄνδρες Ἰσραηλῖται, προσέχετε ἑαυτοῖς ἐπὶ τοῖς ἀνθρώποις τούτοις τί μέλλετε πράσσειν, *Andres Israēlitai, prosechete heautois epi tois anthrōpois toutois ti mellete prassein*). His warning is not about the apostles, but about the council''s own actions and their potential consequences. He urges prudence and reflection, drawing on historical examples to illustrate the dangers of opposing what might be a divine work.',
   NULL),
  (36,
   'For before these days rose up Theudas, boasting himself to be somebody; to whom a number of men, about four hundred, joined themselves: who was slain; and all, as many as obeyed him, were scattered, and brought to nought.',
   'πρὸ γὰρ τούτων τῶν ἡμερῶν ἀνέστη Θευδᾶς, λέγων εἶναί τινα ἑαυτόν, ᾧ προσεκλίθη ἀνδρῶν ἀριθμὸς ὡς τετρακοσίων· ὃς ἀνῃρέθη, καὶ πάντες ὅσοι ἐπείθοντο αὐτῷ διελύθησαν καὶ ἐγένοντο εἰς οὐδέν.',
   'pro gar toutōn tōn hēmerōn anestē Theudas, legōn einai tina heauton, hō proseklinthē andrōn arithmos hōs tetrakosiōn; hos anērēthē, kai pantes hosoi epeithonto autō dielythēsan kai egenonto eis ouden.',
   'Gamaliel provides a historical precedent: "Theudas," a messianic pretender who "boasting himself to be somebody" (λέγων εἶναί τινα ἑαυτόν, *legōn einai tina heauton*), gathered "about four hundred" (ὡς τετρακοσίων, *hōs tetrakosiōn*) followers. However, he "was slain" (ἀνῃρέθη, *anērēthē*), and his movement "were scattered, and brought to nought" (διελύθησαν καὶ ἐγένοντο εἰς οὐδέν, *dielythēsan kai egenonto eis ouden*). Josephus mentions a Theudas, but places him later (c. AD 44-46). Luke''s Theudas may be an earlier, unrecorded figure, or a slight chronological imprecision by Gamaliel, but the principle remains valid.',
   NULL),
  (37,
   'After this man rose up Judas of Galilee in the days of the taxing, and drew away much people after him: he also perished; and all, even as many as obeyed him, were dispersed.',
   'μετὰ τοῦτον ἀνέστη Ἰούδας ὁ Γαλιλαῖος ἐν ταῖς ἡμέραις τῆς ἀπογραφῆς καὶ ἀπέστησεν λαὸν ἱκανὸν ὀπίσω αὐτοῦ· κἀκεῖνος ἀπώλετο, καὶ πάντες ὅσοι ἐπείθοντο αὐτῷ διεσκορπίσθησαν.',
   'meta touton anestē Ioudas ho Galilaios en tais hēmerais tēs apographēs kai apestēsen laon hikanon opisō autou; kakeinos apōleto, kai pantes hosoi epeithonto autō dieskorpisthēsan.',
   'Gamaliel offers a second example: "Judas of Galilee" (Ἰούδας ὁ Γαλιλαῖος, *Ioudas ho Galilaios*), who arose "in the days of the taxing" (ἐν ταῖς ἡμέραις τῆς ἀπογραφῆς, *en tais hēmerais tēs apographēs* – referring to Quirinius''s census in AD 6-7, Luke 2:1-2). He "drew away much people after him" (ἀπέστησεν λαὸν ἱκανὸν ὀπίσω αὐτοῦ, *apestēsen laon hikanon opisō autou*) by advocating resistance to Roman taxation. Like Theudas, "he also perished" (κἀκεῖνος ἀπώλετο, *kakeinos apōleto*), and his followers "were dispersed" (διεσκορπίσθησαν, *dieskorpisthēsan*). These examples illustrate a pattern of human-initiated movements failing.',
   NULL),
  (38,
   'And now I say unto you, Refrain from these men, and let them alone: for if this counsel or this work be of men, it will come to nought:',
   'καὶ τὰ νῦν λέγω ὑμῖν, ἀπόστητε ἀπὸ τῶν ἀνθρώπων τούτων καὶ ἄφετε αὐτούς· ὅτι ἐὰν ᾖ ἐξ ἀνθρώπων ἡ βουλὴ αὕτη ἢ τὸ ἔργον τοῦτο, καταλυθήσεται·',
   'kai ta nyn legō hymin, apostēte apo tōn anthrōpōn toutōn kai aphete autous; hoti ean ē ex anthrōpōn hē boulē hautē ē to ergon touto, katalythēsetai;',
   'Based on these historical precedents, Gamaliel advises the Sanhedrin: "Refrain from these men, and let them alone" (ἀπόστητε ἀπὸ τῶν ἀνθρώπων τούτων καὶ ἄφετε αὐτούς, *apostēte apo tōn anthrōpōn toutōn kai aphete autous*). His rationale is pragmatic: "if this counsel or this work be of men, it will come to nought" (ἐὰν ᾖ ἐξ ἀνθρώπων ἡ βουλὴ αὕτη ἢ τὸ ἔργον τοῦτο, καταλυθήσεται, *ean ē ex anthrōpōn hē boulē hautē ē to ergon touto, katalythēsetai*). He suggests that time will reveal the true origin of the movement, implying that human efforts, lacking divine backing, inevitably fail.',
   'This verse presents a principle of divine sovereignty: if a work is merely human, it will ultimately fail. It encourages discernment and patience, recognizing that God''s purposes cannot be thwarted by human opposition, and that true spiritual movements bear the mark of divine origin.'),
  (39,
   'But if it be of God, ye cannot overthrow it; lest haply ye be found even to fight against God.',
   'εἰ δὲ ἐκ Θεοῦ ἐστιν, οὐ δυνήσεσθε καταλῦσαι αὐτούς, μήποτε καὶ θεομάχοι εὑρεθῆτε.',
   'ei de ek Theou estin, ou dynēsesthe katalysai autous, mēpote kai theomachoi heurethēte.',
   'Gamaliel''s argument culminates in a powerful warning: "But if it be of God, ye cannot overthrow it" (εἰ δὲ ἐκ Θεοῦ ἐστιν, οὐ δυνήσεσθε καταλῦσαι αὐτούς, *ei de ek Theou estin, ou dynēsesthe katalysai autous*). He cautions against the severe consequence of opposing a divine work: "lest haply ye be found even to fight against God" (μήποτε καὶ θεομάχοι εὑρεθῆτε, *mēpote kai theomachoi heurethēte*). This term, *theomachoi*, means "God-fighters." Gamaliel, a respected teacher, implicitly acknowledges the possibility that the apostles'' movement might indeed be divinely inspired, urging caution and humility.',
   'This verse powerfully asserts God''s ultimate sovereignty and the futility of opposing His divine will. It warns against the grave danger of "fighting against God" by resisting a genuine work of the Holy Spirit, emphasizing that God''s purposes will prevail regardless of human opposition.'),
  (40,
   'And to him they agreed: and when they had called the apostles, and beaten them, they commanded that they should not speak in the name of Jesus, and let them go.',
   'Ἐπείσθησαν δὲ αὐτῷ, καὶ προσκαλεσάμενοι τοὺς ἀποστόλους δείραντες παρήγγειλαν μὴ λαλεῖν ἐπὶ τῷ ὀνόματι τοῦ Ἰησοῦ καὶ ἀπέλυσαν αὐτούς.',
   'Epeisthēsan de autō, kai proskalesamenoi tous apostolous deirantes parēngeilan mē lalein epi tō onomati tou Iēsou kai apelusan autous.',
   'The Sanhedrin "agreed" (ἐπείσθησαν, *epeisthēsan*) to Gamaliel''s counsel, choosing a less severe course than execution. However, they still "beaten them" (δείραντες, *deirantes*) – a common punishment involving scourging (Matt 10:17) – and "commanded that they should not speak in the name of Jesus" (παρήγγειλαν μὴ λαλεῖν ἐπὶ τῷ ὀνόματι τοῦ Ἰησοῦ, *parēngeilan mē lalein epi tō onomati tou Iēsou*). This act of violence and renewed prohibition demonstrates their continued hostility and inability to fully accept Gamaliel''s wisdom, but ultimately they "let them go."',
   'This verse illustrates the world''s persistent opposition to the gospel, even when divine intervention is evident. While Gamaliel''s counsel prevented execution, the beating and renewed prohibition demonstrate the Sanhedrin''s continued rejection of Christ and their attempt to suppress the truth through intimidation.'),
  (41,
   'And they departed from the presence of the council, rejoicing that they were counted worthy to suffer shame for his name.',
   'Οἱ μὲν οὖν ἐπορεύοντο χαίροντες ἀπὸ προσώπου τοῦ συνεδρίου ὅτι κατηξιώθησαν ὑπὲρ τοῦ ὀνόματος ἀτιμασθῆναι.',
   'Hoi men oun eporeuonto chairontes apo prosōpou tou synedriou hoti katēxiōthēsan hyper tou onomatos atimasthēnai.',
   'Far from being deterred by the beating, the apostles "departed... rejoicing" (ἐπορεύοντο χαίροντες, *eporeuonto chairontes*). Their joy stemmed from being "counted worthy to suffer shame for his name" (ὅτι κατηξιώθησαν ὑπὲρ τοῦ ὀνόματος ἀτιμασθῆναι, *hoti katēxiōthēsan hyper tou onomatos atimasthēnai*). This reflects a profound understanding of Christian discipleship, where suffering for Christ is seen as a privilege and a mark of identification with Him (Matt 5:11-12; Phil 1:29; 1 Pet 4:13).',
   'This verse powerfully illustrates the paradoxical joy of suffering for Christ. True believers find honor in being "counted worthy to suffer shame for his name," demonstrating a spiritual perspective that transcends worldly values and finds joy in identification with the crucified and resurrected Lord.'),
  (42,
   'And daily in the temple, and in every house, they ceased not to teach and preach Jesus Christ.',
   'πᾶσάν τε ἡμέραν ἐν τῷ ἱερῷ καὶ κατ’ οἶκον οὐκ ἐπαύοντο διδάσκοντες καὶ εὐαγγελιζόμενοι τὸν Χριστὸν Ἰησοῦν.',
   'pasan te hēmeran en tō hierō kai kat’ oikon ouk epauonto didaskontes kai euangelizomenoi ton Christon Iēsoun.',
   'Despite the threats and physical abuse, the apostles'' commitment to their mission remained unbroken. "Daily" (πᾶσάν τε ἡμέραν, *pasan te hēmeran*), they "ceased not to teach and preach Jesus Christ" (οὐκ ἐπαύοντο διδάσκοντες καὶ εὐαγγελιζόμενοι τὸν Χριστὸν Ἰησοῦν, *ouk epauonto didaskontes kai euangelizomenoi ton Christon Iēsoun*). Their ministry was both public ("in the temple") and private ("in every house"), demonstrating a comprehensive and relentless dedication to spreading the gospel, fulfilling the angel''s command (Acts 5:20) and their own conviction (Acts 4:20).',
   'This verse provides a model for persistent, comprehensive evangelism and discipleship, both publicly and privately. It demonstrates the unwavering commitment of the early apostles to the Great Commission, prioritizing the proclamation of "Jesus Christ" above personal safety or comfort, even in the face of severe persecution.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπλήρωσεν', 'eplērōsen', 'G4137', 'From *plēroō*, meaning "to fill, complete, fulfill." Here, it signifies Satan''s complete influence over Ananias''s heart, indicating a deliberate yielding to evil rather than a passive suggestion. It highlights the active role of spiritual forces in tempting individuals to sin.', 1),
  ('ψεύσασθαί', 'pseusasthai', 'G5574', 'From *pseudomai*, meaning "to lie, deceive, speak falsely." This word emphasizes the intentional act of misrepresentation and dishonesty. In this context, it is not merely a lie to men but a direct falsehood aimed at the Holy Spirit, underscoring the gravity of the sin.', 2),
  ('Πνεῦμα', 'Pneuma', 'G4151', 'From *pneō* (to breathe), meaning "wind, breath, spirit." In this context, it refers specifically to the Holy Spirit, the third person of the Trinity. Lying to the *Pneuma* is equated with lying to God, affirming the Spirit''s divine personhood and omnipresence.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐξουσίᾳ', 'exousia', 'G1849', 'From *exesti* (it is lawful), meaning "authority, power, right, liberty." Peter emphasizes that Ananias had full *exousia* over his property, both before and after the sale. His sin was not in withholding, but in abusing his freedom by lying, highlighting the moral responsibility accompanying liberty.', 1),
  ('ἐψεύσω', 'epseusō', 'G5574', 'From *pseudomai*, meaning "to lie, deceive." This reiterates the core sin of Ananias. The perfect tense emphasizes the completed action and its lasting consequence. The direct object "unto God" elevates the offense beyond a mere human transaction.', 2),
  ('Θεῷ', 'Theō', 'G2316', 'From *theos*, meaning "God." This direct statement, "lied unto God," is crucial. It explicitly identifies the Holy Spirit (v. 3) with God, providing a strong biblical basis for the deity of the Holy Spirit and the Trinitarian nature of God.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 4;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συνεφωνήθη', 'synephōnēthē', 'G4856', 'From *symphōneō*, meaning "to agree together, be in harmony." This word highlights the deliberate, premeditated conspiracy between Ananias and Sapphira. Their agreement to deceive was a joint act of rebellion against God, making them equally culpable.', 1),
  ('πειράσαι', 'peirasai', 'G3985', 'From *peirazō*, meaning "to test, tempt, try." Here, it means to test or challenge the Holy Spirit''s knowledge and power. It implies a presumption upon God''s patience and an attempt to see if He would discern their deceit, a dangerous act of defiance.', 2),
  ('Κυρίου', 'Kyriou', 'G2962', 'From *kyrios*, meaning "lord, master, owner." In this context, "Spirit of the Lord" (Πνεῦμα Κυρίου) further affirms the Holy Spirit''s divine authority and identity with God. To tempt the Spirit of the Lord is to tempt God Himself, reinforcing His sovereignty.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 9;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φόβος', 'phobos', 'G5401', 'From *phebomai* (to flee, be afraid), meaning "fear, terror, reverence, awe." Here, it denotes a "great fear" that is not merely terror but a profound, reverential awe of God''s holiness and power. This healthy fear leads to spiritual integrity and respect for divine authority within the church.', 1),
  ('ἐκκλησίαν', 'ekklēsian', 'G1577', 'From *ekkaléō* (to call out), meaning "assembly, congregation, church." This is the first time the term *ekklēsia* is used in Acts to refer to the Christian community as a whole. It signifies the divinely called-out body of believers, highlighting its distinct identity and sacred nature.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 11;

-- Verse 29
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Πειθαρχεῖν', 'Peitharchein', 'G3980', 'From *peitho* (to persuade) and *archē* (rule), meaning "to obey authority, be obedient." This verb emphasizes the duty to submit to a higher authority. Peter''s declaration asserts that God''s authority is supreme, demanding obedience over conflicting human commands.', 1),
  ('Θεῷ', 'Theō', 'G2316', 'From *theos*, meaning "God." This is the ultimate authority to whom obedience is due. The apostles'' unwavering commitment to obey God rather than men establishes a fundamental principle for Christian conscience and civil disobedience.', 2),
  ('ἀνθρώποις', 'anthrōpois', 'G444', 'From *anthrōpos*, meaning "man, human being." This contrasts with God, highlighting the subordinate nature of human authority. While human authorities are generally to be respected (Rom 13:1), their commands are superseded when they contradict divine law.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 29;

-- Verse 31
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀρχηγὸν', 'archēgon', 'G747', 'From *archē* (beginning) and *agō* (to lead), meaning "a leader, author, founder, pioneer." Jesus is presented as the "Prince" or "Author" of salvation, the one who initiates and leads the way to life. This title emphasizes His unique role as the source and inaugurator of salvation.', 1),
  ('Σωτῆρα', 'Sōtēra', 'G4990', 'From *sōzō* (to save), meaning "savior, deliverer, preserver." Jesus is the one who brings salvation, delivering humanity from sin and its consequences. This title highlights His redemptive work and His power to grant eternal life.', 2),
  ('μετάνοιαν', 'metanoian', 'G3341', 'From *metanoeō* (to change one''s mind), meaning "repentance, a change of mind, regret." Here, it signifies a divinely granted change of heart and mind that leads to a turning away from sin and towards God. It is a gift necessary for salvation.', 3),
  ('ἄφεσιν', 'aphesin', 'G859', 'From *aphiēmi* (to send away, forgive), meaning "forgiveness, remission, release." This refers to the pardon and release from the guilt and penalty of sins. It is a direct consequence of repentance and faith in Christ, offered through His atoning sacrifice.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 31;

-- Verse 39
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καταλῦσαι', 'katalysai', 'G2647', 'From *katalyō*, meaning "to loose down, destroy, overthrow, abolish." Gamaliel uses this word to describe the inability of human power to destroy or nullify a work that originates from God. It emphasizes the invincibility of God''s purposes.', 1),
  ('θεομάχοι', 'theomachoi', 'G2314', 'From *theos* (God) and *machomai* (to fight), meaning "fighters against God." This rare and powerful term warns against the ultimate folly and danger of opposing God''s will. It implies that such opposition is not only futile but also carries severe divine consequences.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = 39;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Acts 4:34-37', 1),
  (1, 'Deut 23:21-23', 2),
  (1, 'Prov 12:22', 3),
  (2, 'Josh 7:1', 1),
  (2, 'Josh 7:20-21', 2),
  (2, 'Acts 4:34-37', 3),
  (2, '2 Cor 8:21', 4),
  (3, 'John 8:44', 1),
  (3, 'Eph 2:2', 2),
  (3, '1 Tim 4:1', 3),
  (3, '1 John 3:8', 4),
  (3, 'Matt 4:10', 5),
  (3, 'Acts 4:8', 6),
  (3, '1 Cor 3:16', 7),
  (4, 'Num 30:2', 1),
  (4, 'Deut 23:21', 2),
  (4, 'Ps 51:4', 3),
  (4, 'Matt 21:2', 4),
  (4, 'John 14:16-17', 5),
  (4, '1 Cor 6:19-20', 6),
  (5, 'Lev 10:1-2', 1),
  (5, 'Num 16:31-35', 2),
  (5, '1 Cor 11:30', 3),
  (5, 'Acts 2:43', 4),
  (5, 'Acts 19:17', 5),
  (6, 'John 19:40', 1),
  (6, 'Acts 8:2', 2),
  (7, 'Acts 5:2', 1),
  (7, 'Prov 1:10-19', 2),
  (8, 'Prov 12:22', 1),
  (8, 'Rev 21:8', 2),
  (9, 'Ps 78:18', 1),
  (9, 'Isa 7:12', 2),
  (9, 'Matt 4:7', 3),
  (9, '1 Cor 10:9', 4),
  (9, 'Acts 5:3-4', 5),
  (10, 'Acts 5:5', 1),
  (10, '1 Cor 11:30-32', 2),
  (10, 'Heb 12:29', 3),
  (11, 'Acts 2:43', 1),
  (11, 'Acts 19:17', 2),
  (11, 'Ps 111:10', 3),
  (11, 'Prov 1:7', 4),
  (11, '2 Cor 7:1', 5),
  (12, 'Acts 2:43', 1),
  (12, 'Acts 3:11', 2),
  (12, 'Acts 4:33', 3),
  (12, 'Mark 16:17-18', 4),
  (12, 'Heb 2:3-4', 5),
  (13, 'Acts 2:47', 1),
  (13, 'Acts 4:21', 2),
  (13, 'John 12:42', 3),
  (13, 'Luke 1:46', 4),
  (14, 'Acts 2:47', 1),
  (14, 'Acts 4:4', 2),
  (14, 'Acts 6:7', 3),
  (14, 'Gal 3:28', 4),
  (15, 'Mark 6:56', 1),
  (15, 'Acts 19:11-12', 2),
  (15, 'Matt 9:21', 3),
  (15, 'Luke 8:43-44', 4),
  (16, 'Matt 4:24', 1),
  (16, 'Mark 1:32-34', 2),
  (16, 'Acts 8:7', 3),
  (16, 'Acts 19:11-12', 4),
  (17, 'Acts 4:1-2', 1),
  (17, 'John 11:47-48', 2),
  (17, 'Matt 22:23', 3),
  (17, 'Acts 23:8', 4),
  (18, 'Acts 4:3', 1),
  (18, 'Matt 10:17-18', 2),
  (18, '1 Pet 4:12-16', 3),
  (19, 'Ps 34:7', 1),
  (19, 'Ps 105:19-20', 2),
  (19, 'Acts 12:7-11', 3),
  (19, 'Acts 16:26', 4),
  (19, 'Exod 14:13-14', 5),
  (20, 'Matt 28:19-20', 1),
  (20, 'Acts 4:19-20', 2),
  (20, 'John 6:68', 3),
  (20, 'John 12:50', 4),
  (20, '1 John 1:1', 5),
  (21, 'Acts 4:5-6', 1),
  (21, 'Luke 22:66', 2),
  (21, 'John 18:28', 3),
  (22, 'Acts 12:18-19', 1),
  (22, 'Matt 28:11-15', 2),
  (23, 'Acts 12:10', 1),
  (23, 'Matt 28:13', 2),
  (23, 'John 20:19', 3),
  (24, 'Luke 21:26', 1),
  (24, 'John 12:19', 2),
  (24, 'Acts 4:16-17', 3),
  (25, 'Acts 5:20-21', 1),
  (25, 'Acts 4:19-20', 2),
  (26, 'Matt 21:26', 1),
  (26, 'Matt 26:5', 2),
  (26, 'Acts 4:21', 3),
  (26, 'Acts 6:12', 4),
  (27, 'Acts 4:5-7', 1),
  (27, 'Matt 10:18', 2),
  (28, 'Acts 4:17-18', 1),
  (28, 'Matt 27:25', 2),
  (28, 'John 19:15', 3),
  (28, 'Acts 2:23', 4),
  (28, 'Acts 2:36', 5),
  (29, 'Acts 4:19', 1),
  (29, 'Dan 3:16-18', 2),
  (29, 'Dan 6:10', 3),
  (29, 'Matt 10:28', 4),
  (29, 'Rom 13:1-7', 5),
  (30, 'Acts 2:23-24', 1),
  (30, 'Acts 3:13-15', 2),
  (30, 'Acts 10:39', 3),
  (30, 'Deut 21:23', 4),
  (30, 'Gal 3:13', 5),
  (30, '1 Pet 2:24', 6),
  (31, 'Acts 3:15', 1),
  (31, 'Phil 2:9-11', 2),
  (31, 'Heb 2:10', 3),
  (31, 'Luke 24:47', 4),
  (31, 'Eph 1:7', 5),
  (31, 'Col 1:14', 6),
  (32, 'John 15:26-27', 1),
  (32, 'Acts 1:8', 2),
  (32, 'Acts 2:33', 3),
  (32, 'Acts 10:44', 4),
  (32, 'Gal 3:5', 5),
  (32, '1 John 5:6', 6),
  (33, 'Acts 7:54', 1),
  (33, 'John 16:2', 2),
  (33, 'Matt 26:3-4', 3),
  (33, 'John 15:18-20', 4),
  (34, 'Acts 22:3', 1),
  (34, 'Luke 2:46', 2),
  (34, 'Luke 5:17', 3),
  (34, 'John 3:10', 4),
  (34, 'Prov 16:7', 5),
  (35, 'Prov 19:21', 1),
  (35, 'Isa 8:10', 2),
  (35, 'Zech 2:8', 3),
  (36, 'Luke 13:1-2', 1),
  (36, 'Matt 24:23-24', 2),
  (36, '2 Thess 2:3-12', 3),
  (37, 'Luke 2:1-2', 1),
  (37, 'Matt 24:23-24', 2),
  (37, 'Acts 21:38', 3),
  (38, 'Job 34:29', 1),
  (38, 'Prov 21:30', 2),
  (38, 'Isa 8:10', 3),
  (38, 'Matt 15:13', 4),
  (38, '1 Cor 1:25', 5),
  (39, 'Ps 2:2-4', 1),
  (39, 'Isa 43:13', 2),
  (39, 'Isa 46:10', 3),
  (39, 'Dan 4:35', 4),
  (39, 'John 9:33', 5),
  (39, '1 Cor 1:25', 6),
  (40, 'Matt 10:17', 1),
  (40, 'Acts 4:18', 2),
  (40, 'Acts 16:22', 3),
  (40, '2 Cor 11:24', 4),
  (40, '1 Pet 4:16', 5),
  (41, 'Matt 5:11-12', 1),
  (41, 'Rom 5:3', 2),
  (41, 'Phil 1:29', 3),
  (41, 'Col 1:24', 4),
  (41, '1 Pet 4:13-16', 5),
  (41, 'Heb 10:34', 6),
  (42, 'Acts 2:46', 1),
  (42, 'Acts 4:20', 2),
  (42, 'Acts 20:20', 3),
  (42, 'Matt 28:19-20', 4),
  (42, '1 Cor 1:23', 5)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 5 Complete!
-- 42 verses · 7 key verses with word studies (20 words)
-- Cross-references for 42 verses (174 refs)
-- ═══════════════════════════════════════════════════════