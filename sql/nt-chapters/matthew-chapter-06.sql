-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 6 — Sincere Righteousness: Secret Piety, Model Prayer, and Trust in God
-- 34 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Matthew chapter 6, a pivotal section of the Sermon on the Mount, provides foundational instruction on the practice of true righteousness, contrasting outward religious display with inward sincerity. Jesus challenges His disciples to perform acts of piety—almsgiving, prayer, and fasting—not for human applause but for the unseen Father, who rewards openly. The chapter includes the model prayer, commonly known as the Lord''s Prayer, which outlines core petitions for God''s glory, kingdom, provision, forgiveness, and protection. Moving beyond spiritual disciplines, Jesus addresses the disciple''s relationship with material possessions, urging the pursuit of heavenly treasures over earthly ones and declaring the impossibility of serving both God and mammon. The chapter culminates in a powerful call to radical trust in God''s providential care, admonishing against anxiety over daily needs and commanding the prioritization of God''s kingdom and righteousness above all else. This teaching emphasizes a holistic, kingdom-centered life characterized by humble devotion and unwavering faith in the Father''s provision.',
  'Sincere Righteousness: Secret Piety, Model Prayer, and Trust in God',
  'πατήρ (patēr)',
  'The Greek word `πατήρ (patēr)` signifies "father" and is used extensively in Matthew 6, particularly in addressing God. Its theological significance here is profound, emphasizing God''s intimate, personal relationship with believers as their caring, omniscient, and benevolent Father. This address transforms prayer from a ritualistic act into a direct, trusting dialogue, highlighting God''s role as the one who sees in secret, knows all needs, and faithfully provides for His children.',
  '["Section 1 (vv.1-4): The Principle of Secret Almsgiving","Section 2 (vv.5-15): The Practice of Private Prayer and the Lord''s Prayer","Section 3 (vv.16-18): The Discipline of Secret Fasting","Section 4 (vv.19-24): Earthly vs. Heavenly Treasures and Undivided Loyalty","Section 5 (vv.25-34): Overcoming Anxiety through Trust in God''s Provision"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 34 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.',
   'Προσέχετε δὲ τὴν δικαιοσύνην ὑμῶν μὴ ποιεῖν ἔμπροσθεν τῶν ἀνθρώπων πρὸς τὸ θεαθῆναι αὐτοῖς· εἰ δὲ μή γε, μισθὸν οὐκ ἔχετε παρὰ τοῦ Πατρὸς ὑμῶν τοῦ ἐν τοῖς οὐρανοῖς.',
   'Prosechete de tēn dikaiosynēn hymōn mē poiein emprosthen tōn anthrōpōn pros to theathenai autois; ei de mē ge, misthon ouk echete para tou Patros hymōn tou en tois ouranois.',
   'This verse introduces the overarching theme of Matthew 6: the practice of ''righteousness'' (δικαιοσύνη, dikaiosynē) with pure motives. Jesus warns against performing religious duties—almsgiving, prayer, and fasting—for public acclaim. The term ''righteousness'' here encompasses these acts of piety, which were central to Jewish religious life. The core message is that true reward comes from God, not from human recognition. This sets the stage for contrasting the hypocritical practices with genuine devotion (Matt 5:20).',
   NULL),
  (2,
   'Therefore when thou doest thine alms, do not sound a trumpet before thee, as the hypocrites do in the synagogues and in the streets, that they may have glory of men. Verily I say unto you, They have their reward.',
   'Ὅταν οὖν ποιῇς ἐλεημοσύνην, μὴ σαλπίσῃς ἔμπροσθέν σου, ὥσπερ οἱ ὑποκριταὶ ποιοῦσιν ἐν ταῖς συναγωγαῖς καὶ ἐν ταῖς ῥύμαις, ὅπως δοξασθῶσιν ὑπὸ τῶν ἀνθρώπων· ἀμὴν λέγω ὑμῖν, ἀπέχουσιν τὸν μισθὸν αὐτῶν.',
   'Hotan oun poiēs eleēmosynēn, mē salpisēs emprosthen sou, hōsper hoi hypokritai poiousin en tais synagōgais kai en tais rhymas, hopōs doxasthōsin hypo tōn anthrōpōn; amēn legō hymin, apechousin ton misthon autōn.',
   'Jesus specifically addresses ''almsgiving'' (ἐλεημοσύνην, eleēmosynēn), a vital act of charity. The command ''do not sound a trumpet'' (μὴ σαλπίσῃς) is likely a metaphor for ostentatious display, rather than a literal practice, though some suggest a custom of trumpets announcing alms. The ''hypocrites'' (ὑποκριταί) were ''actors'' who performed their piety for an audience. Their reward (''ἀπέχουσιν τὸν μισθὸν αὐτῶν'') is received in full from men, meaning they will receive no further reward from God (Luke 14:14).',
   NULL),
  (3,
   'But when thou doest alms, let not thy left hand know what thy right hand doeth:',
   'Σοῦ δὲ ποιοῦντος ἐλεημοσύνην μὴ γνώτω ἡ ἀριστερά σου τί ποιεῖ ἡ δεξιά σου,',
   'Sou de poiountos eleēmosynēn mē gnōtō hē aristera sou ti poiei hē dexia sou,',
   'This hyperbolic instruction emphasizes extreme secrecy in giving. The imagery of one hand not knowing what the other is doing underscores the internal, private nature of true charity. It''s not merely about avoiding public display, but cultivating a heart so focused on God that even one''s own self-awareness of the good deed is minimized. The goal is purity of motive, free from any self-congratulation or desire for personal recognition (Rom 12:8).',
   NULL),
  (4,
   'That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.',
   'ὅπως ᾖ σου ἡ ἐλεημοσύνη ἐν τῷ κρυπτῷ· καὶ ὁ Πατήρ σου ὁ βλέπων ἐν τῷ κρυπτῷ ἀποδώσει σοι.',
   'hopōs ē sou hē eleēmosynē en tō kryptō; kai ho Patēr sou ho blepōn en tō kryptō apodōsei soi.',
   'The purpose of secret giving is ''that thine alms may be in secret'' (ἐν τῷ κρυπτῷ). This highlights the intimate relationship between the giver and God. The ''Father who seeth in secret'' (ὁ βλέπων ἐν τῷ κρυπτῷ) is omniscient, discerning the true motives of the heart. He will ''reward thee openly'' (ἀποδώσει σοι), implying a future, public vindication and blessing, contrasting with the immediate, fleeting praise sought by hypocrites (Heb 4:13).',
   'This verse highlights God''s omniscience and His justice in rewarding sincere, humble acts of devotion, contrasting divine reward with human recognition. It teaches that genuine piety is directed solely towards God, who discerns the heart and will ultimately honor true faith.'),
  (5,
   'And when thou prayest, thou shalt not be as the hypocrites are: for they love to pray standing in the synagogues and in the corners of the streets, that they may be seen of men. Verily I say unto you, They have their reward.',
   'Καὶ ὅταν προσεύχησθε, οὐκ ἔσεσθε ὥσπερ οἱ ὑποκριταί· ὅτι φιλοῦσιν ἐν ταῖς συναγωγαῖς καὶ ἐν ταῖς γωνίαις τῶν πλατειῶν ἑστῶτες προσεύχεσθαι, ὅπως φανῶσιν τοῖς ἀνθρώποις· ἀμὴν λέγω ὑμῖν, ἀπέχουσιν τὸν μισθὸν αὐτῶν.',
   'Kai hotan proseuchēsthe, ouk esesthe hōsper hoi hypokritai; hoti philousin en tais synagōgais kai en tais gōniais tōn plateiōn hestōtes proseuchesthai, hopōs phanōsin tois anthrōpois; amēn legō hymin, apechousin ton misthon autōn.',
   'Jesus extends the principle of sincerity to prayer. While public prayer was a common and legitimate practice in Jewish tradition, Jesus condemns the motive of praying ''to be seen of men'' (ὅπως φανῶσιν τοῖς ἀνθρώποις). The ''corners of the streets'' (γωνίαις τῶν πλατειῶν) were conspicuous places. Like the almsgivers, these ''hypocrites'' (ὑποκριταί) receive their full reward from human praise, forfeiting divine commendation (Mark 12:38-40).',
   NULL),
  (6,
   'But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.',
   'Σὺ δὲ ὅταν προσεύχῃ, εἴσελθε εἰς τὸ ταμιεῖόν σου καὶ κλείσας τὴν θύραν σου πρόσευξαι τῷ Πατρί σου τῷ ἐν τῷ κρυπτῷ· καὶ ὁ Πατήρ σου ὁ βλέπων ἐν τῷ κρυπτῷ ἀποδώσει σοι.',
   'Sy de hotan proseuchē, eiselthe eis to tameion sou kai kleisas tēn thyran sou proseuxai tō Patri sou tō en tō kryptō; kai ho Patēr sou ho blepōn en tō kryptō apodōsei soi.',
   'In contrast to public display, Jesus instructs disciples to enter their ''closet'' (ταμιεῖόν), a private room or storeroom, and ''shut thy door'' (κλείσας τὴν θύραν σου). This emphasizes the intimacy and privacy of prayer, fostering direct communion with ''thy Father which is in secret'' (τῷ Πατρί σου τῷ ἐν τῷ κρυπτῷ). The promise of open reward from the Father who sees in secret is reiterated, reinforcing the theme of divine recognition for genuine devotion (Isa 26:20, Dan 6:10).',
   'This verse teaches the importance of private, intimate prayer as a direct communion with God, emphasizing sincerity over public display and promising divine reward for such devotion. It underscores that true prayer is a personal relationship with the heavenly Father.'),
  (7,
   'But when ye pray, use not vain repetitions, as the heathen do: for they think that they shall be heard for their much speaking.',
   'Προσευχόμενοι δὲ μὴ βαττολογήσητε ὥσπερ οἱ ἐθνικοί· δοκοῦσιν γὰρ ὅτι ἐν τῇ πολυλογίᾳ αὐτῶν εἰσακουσθήσονται.',
   'Proseuchomenoi de mē battologēsēte hōsper hoi ethnikoi; dokousin gar hoti en tē polylogia autōn eisakousthēsontai.',
   'Jesus warns against ''vain repetitions'' (βαττολογήσητε, battologēsēte), which can mean babbling, stammering, or using many empty words. This practice was characteristic of pagan prayers, where quantity of words or magical incantations were believed to compel the gods (1 Kings 18:26-29). The error lies in the belief that God is swayed by ''much speaking'' (πολυλογίᾳ) rather than by sincere faith and alignment with His will (Eccles 5:2).',
   NULL),
  (8,
   'Be not ye therefore like unto them: for your Father knoweth what things ye have need of, before ye ask him.',
   'Μὴ οὖν ὁμοιωθῆτε αὐτοῖς· οἶδεν γὰρ ὁ Πατὴρ ὑμῶν ὧν χρείαν ἔχετε πρὸ τοῦ ὑμᾶς αἰτῆσαι αὐτόν.',
   'Mē oun homoiōthēte autois; oiden gar ho Patēr hymōn hōn chreian echete pro tou hymas aitēsai auton.',
   'The reason for avoiding vain repetitions is God''s omniscience. Unlike pagan deities, the heavenly Father ''knoweth what things ye have need of, before ye ask him'' (οἶδεν γὰρ ὁ Πατὴρ ὑμῶν ὧν χρείαν ἔχετε). Prayer, therefore, is not about informing God or persuading Him through verbosity, but about expressing dependence, aligning one''s heart with His will, and fostering a relationship of trust (Ps 139:1-4, Isa 65:24).',
   'This verse underscores God''s omniscience and providential care, teaching that prayer is not to inform God but to express dependence and align with His will, fostering a deeper relationship built on trust in His prior knowledge of our needs.'),
  (9,
   'After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name.',
   'Οὕτως οὖν προσεύχεσθε ὑμεῖς· Πάτερ ἡμῶν ὁ ἐν τοῖς οὐρανοῖς· Ἁγιασθήτω τὸ ὄνομά σου·',
   'Houtōs oun proseuchesthe hymeis; Pater hēmōn ho en tois ouranois; Hagiasthētō to onoma sou;',
   'Jesus provides a model for prayer, often called the Lord''s Prayer. It''s a pattern, not a rigid incantation. It begins with an address to ''Our Father which art in heaven'' (Πάτερ ἡμῶν ὁ ἐν τοῖς οὐρανοῖς), emphasizing both intimacy and reverence. The first petition, ''Hallowed be thy name'' (Ἁγιασθήτω τὸ ὄνομά σου), prioritizes God''s glory and holiness, seeking that His name be honored and revered by all (Luke 11:2, Ezek 36:23).',
   'This verse introduces the Lord''s Prayer, providing a foundational model for Christian prayer that begins with reverent address to God as "Father" and prioritizes His glory and holiness above all else, setting the tone for all subsequent petitions.'),
  (10,
   'Thy kingdom come. Thy will be done in earth, as it is in heaven.',
   'ἐλθέτω ἡ βασιλεία σου· γενηθήτω τὸ θέλημά σου, ὡς ἐν οὐρανῷ καὶ ἐπὶ γῆς.',
   'elthetō hē basileia sou; genēthētō to thelēma sou, hōs en ouranō kai epi gēs.',
   'The second and third petitions are closely linked. ''Thy kingdom come'' (ἐλθέτω ἡ βασιλεία σου) expresses a longing for God''s sovereign rule to be fully realized, both spiritually in human hearts and eschatologically in the world. ''Thy will be done in earth, as it is in heaven'' (γενηθήτω τὸ θέλημά σου) is a prayer for submission to God''s perfect will, desiring that human actions and earthly circumstances align with divine purpose, just as they do in heaven (Matt 26:42, Rev 11:15).',
   'This petition expresses a longing for God''s sovereign rule to be fully realized on earth as it is in heaven, encompassing both His spiritual reign in hearts and the future eschatological kingdom, demonstrating a desire for divine will to prevail universally.'),
  (11,
   'Give us this day our daily bread.',
   'Τὸν ἄρτον ἡμῶν τὸν ἐπιούσιον δὸς ἡμῖν σήμερον·',
   'Ton arton hēmōn ton epiousion dos hēmin sēmeron;',
   'This petition shifts to human needs, asking for ''our daily bread'' (Τὸν ἄρτον ἡμῶν τὸν ἐπιούσιον). The Greek word ''ἐπιούσιον'' (epiousion) is rare and debated, meaning either ''for the coming day,'' ''necessary for existence,'' or ''super-substantial.'' Most scholars interpret it as a prayer for sufficient sustenance for the present day, acknowledging dependence on God for basic necessities. Some early church fathers also saw eucharistic or spiritual overtones (John 6:33-35).',
   NULL),
  (12,
   'And forgive us our debts, as we forgive our debtors.',
   'καὶ ἄφες ἡμῖν τὰ ὀφειλήματα ἡμῶν, ὡς καὶ ἡμεῖς ἀφήκαμεν τοῖς ὀφειλέταις ἡμῶν·',
   'kai aphes hēmin ta opheilēmata hēmōn, hōs kai hēmeis aphēkamen tois opheiletais hēmōn;',
   'Here, ''debts'' (ὀφειλήματα, opheilēmata) are understood as sins or moral failings against God. The petition for forgiveness is uniquely conditioned: ''as we forgive our debtors'' (ὡς καὶ ἡμεῖς ἀφήκαμεν τοῖς ὀφειλέταις ἡμῶν). This is not a means of earning forgiveness, but an acknowledgment that a heart unwilling to extend mercy to others cannot truly grasp or receive God''s mercy (Matt 18:21-35, Eph 4:32).',
   'This petition links divine forgiveness to human forgiveness, emphasizing that a heart unwilling to forgive others cannot truly receive or appreciate God''s forgiveness, reflecting a core ethical demand of the kingdom and the character of God''s children.'),
  (13,
   'And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.',
   'καὶ μὴ εἰσενέγκῃς ἡμᾶς εἰς πειρασμόν, ἀλλὰ ῥῦσαι ἡμᾶς ἀπὸ τοῦ πονηροῦ. [Ὅτι σοῦ ἐστιν ἡ βασιλεία καὶ ἡ δύναμις καὶ ἡ δόξα εἰς τοὺς αἰῶνας· ἀμήν.]',
   'kai mē eisenenkēs hēmas eis peirasmon, alla rhysai hēmas apo tou ponērou. [Hoti sou estin hē basileia kai hē dynamis kai hē doxa eis tous aiōnas; amēn.]',
   'The final petition asks God not to ''lead us into temptation'' (μὴ εἰσενέγκῃς ἡμᾶς εἰς πειρασμόν), meaning ''do not allow us to succumb to severe testing or moral trial,'' acknowledging human weakness. It continues with ''but deliver us from evil'' (ῥῦσαι ἡμᾶς ἀπὸ τοῦ πονηροῦ), which can refer to evil in general or ''the evil one'' (Satan). The doxology (''For thine is the kingdom...'') is absent in the earliest and most reliable Greek manuscripts but was added later in liturgical use (1 Cor 10:13, James 1:13-14).',
   'This final petition acknowledges human weakness and dependence on God for protection from moral testing and the power of evil, reflecting a profound trust in His sovereignty and redemptive power to preserve believers in their faith and walk.'),
  (14,
   'For if ye forgive men their trespasses, your heavenly Father will also forgive you:',
   'Ἐὰν γὰρ ἀφῆτε τοῖς ἀνθρώποις τὰ παραπτώματα αὐτῶν, ἀφήσει καὶ ὑμῖν ὁ Πατὴρ ὑμῶν ὁ οὐράνιος·',
   'Ean gar aphēte tois anthrōpois ta paraptōmata autōn, aphēsei kai hymin ho Patēr hymōn ho ouranios;',
   'Jesus immediately expands on the conditionality of forgiveness from the Lord''s Prayer (v.12). ''Trespasses'' (παραπτώματα, paraptōmata) refers to missteps or offenses. This verse underscores that a forgiving spirit towards others is a prerequisite for receiving forgiveness from God. It reflects the divine character that believers are called to emulate, demonstrating that true repentance includes a willingness to extend grace (Col 3:13, Eph 4:32).',
   NULL),
  (15,
   'But if ye forgive not men their trespasses, neither will your Father forgive your trespasses.',
   'ἐὰν δὲ μὴ ἀφῆτε τοῖς ἀνθρώποις, οὐδὲ ὁ Πατὴρ ὑμῶν ἀφήσει τὰ παραπτώματα ὑμῶν.',
   'ean de mē aphēte tois anthrōpois, oude ho Patēr hymōn aphēsei ta paraptōmata hymōn.',
   'This verse presents the stark consequence of an unforgiving heart. If believers refuse to forgive others, their heavenly Father will likewise withhold forgiveness from them. This is not a legalistic transaction but a spiritual reality: an unforgiving heart reveals a lack of true understanding and reception of God''s grace, hindering one''s relationship with Him (Mark 11:26, James 2:13).',
   'This verse starkly warns that an unforgiving spirit hinders one''s own reception of divine forgiveness, underscoring the profound ethical demand for mercy and reconciliation within the Christian life as a reflection of God''s character.'),
  (16,
   'Moreover when ye fast, be not, as the hypocrites, of a sad countenance: for they disfigure their faces, that they may appear unto men to fast. Verily I say unto you, They have their reward.',
   'Ὅταν δὲ νηστεύητε, μὴ γίνεσθε ὡς οἱ ὑποκριταὶ σκυθρωποί· ἀφανίζουσιν γὰρ τὰ πρόσωπα αὐτῶν, ὅπως φανῶσιν τοῖς ἀνθρώποις νηστεύοντες· ἀμὴν λέγω ὑμῖν, ἀπέχουσιν τὸν μισθὸν αὐτῶν.',
   'Hotan de nēsteuēte, mē ginesthe hōs hoi hypokritai skythrōpoi; aphanizousin gar ta prosōpa autōn, hopōs phanōsin tois anthrōpois nēsteuontes; amēn legō hymin, apechousin ton misthon autōn.',
   'Jesus addresses the third act of piety: fasting. Like almsgiving and prayer, fasting was a common religious practice. He again condemns the ''hypocrites'' (ὑποκριταί) who adopt a ''sad countenance'' (σκυθρωποί) and ''disfigure their faces'' (ἀφανίζουσιν τὰ πρόσωπα) to publicly advertise their fasting. Their motivation is human recognition, and they receive their full reward from men, not from God (Isa 58:3-5, Zech 7:5-6).',
   NULL),
  (17,
   'But thou, when thou fastest, anoint thine head, and wash thy face;',
   'Σὺ δὲ νηστεύων ἄλειψαί σου τὴν κεφαλὴν καὶ τὸ πρόσωπόν σου νίψαι,',
   'Sy de nēsteuōn aleipsai sou tēn kephalēn kai to prosōpon sou nipsai,',
   'In stark contrast to the hypocrites, Jesus instructs His disciples to maintain normal grooming practices while fasting: ''anoint thine head'' (ἄλειψαί σου τὴν κεφαλὴν) and ''wash thy face'' (τὸ πρόσωπόν σου νίψαι). Anointing with oil was a common practice for refreshment and appearance. The command implies that one should not outwardly signal their fasting, but rather appear as normal, keeping the spiritual discipline a private matter (Ruth 3:3, 2 Sam 12:20).',
   NULL),
  (18,
   'That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.',
   'ὅπως μὴ φανῇς τοῖς ἀνθρώποις νηστεύων ἀλλὰ τῷ Πατρί σου τῷ ἐν τῷ κρυπτῷ· καὶ ὁ Πατήρ σου ὁ βλέπων ἐν τῷ κρυπτῷ ἀποδώσει σοι.',
   'hopōs mē phanēs tois anthrōpois nēsteuōn alla tō Patri sou tō en tō kryptō; kai ho Patēr sou ho blepōn en tō kryptō apodōsei soi.',
   'The ultimate goal of secret fasting is ''that thou appear not unto men to fast, but unto thy Father which is in secret'' (τῷ Πατρί σου τῷ ἐν τῷ κρυπτῷ). This reiterates the core principle of all three acts of righteousness: genuine devotion is directed solely towards God, who sees the heart and motives. The promise of the Father ''who seeth in secret'' (ὁ βλέπων ἐν τῷ κρυπτῷ) rewarding ''openly'' (ἀποδώσει σοι) is repeated for emphasis, underscoring divine approval for sincere, humble piety (Col 3:23-24, 1 Pet 3:3-4).',
   'This verse reiterates the principle of private piety, emphasizing that true spiritual discipline, like fasting, is an intimate act between the believer and God, who sees and rewards genuine devotion, fostering a deeper, unadulterated relationship.'),
  (19,
   'Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:',
   'Μὴ θησαυρίζετε ὑμῖν θησαυροὺς ἐπὶ τῆς γῆς, ὅπου σὴς καὶ βρῶσις ἀφανίζει καὶ ὅπου κλέπται διορύσσουσιν καὶ κλέπτουσιν·',
   'Mē thēsaurizete hymin thēsaurous epi tēs gēs, hopou sēs kai brōsis aphanizei kai hopou kleptai dioryssousin kai kleptousin;',
   'Jesus shifts from the practice of piety to the disciple''s relationship with material possessions. The command ''Lay not up for yourselves treasures upon earth'' (Μὴ θησαυρίζετε ὑμῖν θησαυροὺς ἐπὶ τῆς γῆς) warns against accumulating wealth for its own sake. Earthly treasures are inherently impermanent and vulnerable: ''moth'' (σὴς) destroys fabrics, ''rust'' (βρῶσις) corrupts metals, and ''thieves'' (κλέπται) can steal. This highlights the futility of placing ultimate value on transient worldly goods (Prov 23:4-5, James 5:1-3).',
   'This verse warns against accumulating earthly wealth, highlighting its impermanence and vulnerability to decay and theft, thereby challenging disciples to re-evaluate their priorities and ultimate security, redirecting their focus from transient to eternal values.'),
  (20,
   'But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:',
   'ἀλλὰ θησαυρίζετε ὑμῖν θησαυροὺς ἐν οὐρανῷ, ὅπου οὔτε σὴς οὔτε βρῶσις ἀφανίζει καὶ ὅπου κλέπται οὐ διορύσσουσιν οὐδὲ κλέπτουσιν.',
   'alla thēsaurizete hymin thēsaurous en ouranō, hopou oute sēs oute brōsis aphanizei kai hopou kleptai ou dioryssousin oude kleptousin.',
   'In contrast to earthly treasures, disciples are exhorted to ''lay up for yourselves treasures in heaven'' (θησαυρίζετε ὑμῖν θησαυροὺς ἐν οὐρανῷ). Heavenly treasures are eternal and secure, immune to decay, corruption, or theft. These treasures are accumulated through acts of righteousness, devotion to God, and investment in His kingdom. This instruction calls for a radical reorientation of priorities, valuing spiritual and eternal rewards above temporal material gain (Col 3:1-2, 1 Tim 6:18-19).',
   'This verse exhorts believers to invest in eternal realities, emphasizing that spiritual acts and devotion to God yield imperishable rewards, securing true and lasting wealth beyond earthly decay and challenging a worldly mindset.'),
  (21,
   'For where your treasure is, there will your heart be also.',
   'ὅπου γάρ ἐστιν ὁ θησαυρός σου, ἐκεῖ ἔσται καὶ ἡ καρδία σου.',
   'hopou gar estin ho thēsauros sou, ekei estai kai hē kardia sou.',
   'This profound statement serves as a diagnostic for one''s spiritual condition. ''Where your treasure is'' (ὅπου γάρ ἐστιν ὁ θησαυρός σου) refers to what one values most, what one invests their time, energy, and affection in. ''There will your heart be also'' (ἐκεῖ ἔσται καὶ ἡ καρδία σου) indicates that one''s ultimate allegiance, desires, and affections will naturally follow their primary investment. It underscores the impossibility of divided loyalty (Prov 4:23, Luke 12:34).',
   'This foundational principle reveals that one''s deepest affections and loyalties are inextricably linked to what they value most, serving as a diagnostic for spiritual priorities and commitment to God''s kingdom, demanding an undivided heart.'),
  (22,
   'The light of the body is the eye: if therefore thine eye be single, thy whole body shall be full of light.',
   'Ὁ λύχνος τοῦ σώματός ἐστιν ὁ ὀφθαλμός. ἐὰν οὖν ᾖ ὁ ὀφθαλμός σου ἁπλοῦς, ὅλον τὸ σῶμά σου φωτεινὸν ἔσται·',
   'Ho lychnos tou sōmatos estin ho ophthalmos. ean oun ē ho ophthalmos sou haplous, holon to sōma sou phōteinon estai;',
   'Jesus uses the metaphor of the ''eye'' (ὀφθαλμός) as the ''lamp'' (λύχνος) of the body, illuminating one''s inner being. If the eye is ''single'' (ἁπλοῦς, haplous), meaning healthy, clear, generous, or focused on God, then the entire ''body shall be full of light'' (φωτεινὸν ἔσται). This refers to spiritual perception and moral integrity. A clear, uncorrupted inner vision allows one to discern God''s will and live righteously (Luke 11:34, Prov 22:9).',
   NULL),
  (23,
   'But if thine eye be evil, thy whole body shall be full of darkness. If therefore the light that is in thee be darkness, how great is that darkness!',
   'ἐὰν δὲ ὁ ὀφθαλμός σου πονηρὸς ᾖ, ὅλον τὸ σῶμά σου σκοτεινὸν ἔσται. εἰ οὖν τὸ φῶς τὸ ἐν σοὶ σκότος ἐστίν, τὸ σκότος πόσον.',
   'ean de ho ophthalmos sou ponēros ē, holon to sōma sou skoteinon estai. ei oun to phōs to en soi skotos estin, to skotos poson.',
   'Conversely, if the eye is ''evil'' (πονηρὸς, ponēros), meaning diseased, grudging, covetous, or corrupt in its focus, then the entire body will be ''full of darkness'' (σκοτεινὸν ἔσται). This signifies spiritual blindness and moral corruption. The rhetorical question, ''If therefore the light that is in thee be darkness, how great is that darkness!'' emphasizes the profound tragedy of a corrupted inner moral compass, leading to utter spiritual ruin (Deut 15:9, Mark 7:22).',
   'This verse warns that a corrupted inner vision or a covetous heart leads to profound spiritual darkness, emphasizing the critical importance of spiritual discernment and purity of motive for true understanding and a life aligned with God.'),
  (24,
   'No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve God and mammon.',
   'Οὐδεὶς δύναται δυσὶ κυρίοις δουλεύειν· ἢ γὰρ τὸν ἕνα μισήσει καὶ τὸν ἕτερον ἀγαπήσει, ἢ ἑνὸς ἀνθέξεται καὶ τοῦ ἑτέρου καταφρονήσει. οὐ δύνασθε Θεῷ δουλεύειν καὶ μαμωνᾷ.',
   'Oudeis dynatai dysi kyriois douleuein; ē gar ton hena misēsei kai ton heteron agapēsei, ē henos anthexetai kai tou heterou kataphronēsei. ou dynasthe Theō douleuein kai mamōna.',
   'This pivotal verse declares the impossibility of ''serving two masters'' (δυσὶ κυρίοις δουλεύειν). The analogy illustrates that one''s ultimate loyalty cannot be divided. ''Mammon'' (μαμωνᾷ) is an Aramaic word for wealth or property, here personified as a rival deity. Jesus asserts that one cannot simultaneously serve God and material possessions, as the demands of each are fundamentally opposed. This calls for an exclusive and undivided allegiance to God (Luke 16:13, Gal 1:10).',
   'This pivotal verse declares the impossibility of serving both God and material wealth ("Mammon"), demanding exclusive allegiance to God and exposing the idolatrous nature of prioritizing worldly possessions over divine sovereignty and spiritual devotion.'),
  (25,
   'Therefore I say unto you, Take no thought for your life, what ye shall eat, or what ye shall drink; nor yet for your body, what ye shall put on. Is not the life more than meat, and the body than raiment?',
   'Διὰ τοῦτο λέγω ὑμῖν, μὴ μεριμνᾶτε τῇ ψυχῇ ὑμῶν τί φάγητε [ἢ τί πίητε], μηδὲ τῷ σώματι ὑμῶν τί ἐνδύσησθε. οὐχὶ ἡ ψυχὴ πλεῖόν ἐστιν τῆς τροφῆς καὶ τὸ σῶμα τοῦ ἐνδύματος;',
   'Dia touto legō hymin, mē merimnate tē psychē hymōn ti phagēte [ē ti piēte], mēde tō sōmati hymōn ti endysēsthe. ouchi hē psychē pleion estin tēs trophēs kai to sōma tou endymatos?',
   'Following the warning against serving Mammon, Jesus addresses anxiety. ''Take no thought'' (μὴ μεριμνᾶτε) means ''do not be anxious'' or ''do not worry,'' not a prohibition against prudent planning. The concern is for life''s basic necessities: food, drink, and clothing. Jesus argues from the greater to the lesser: if God gave life (ψυχὴ) and body (σῶμα), which are more significant, He will surely provide for their sustenance and covering (Luke 12:22-23, Phil 4:6).',
   NULL),
  (26,
   'Behold the fowls of the air: for they sow not, neither do they reap, nor gather into barns; yet your heavenly Father feedeth them. Are ye not much better than they?',
   'Ἐμβλέψατε εἰς τὰ πετεινὰ τοῦ οὐρανοῦ ὅτι οὐ σπείρουσιν οὐδὲ θερίζουσιν οὐδὲ συνάγουσιν εἰς ἀποθήκας, καὶ ὁ Πατὴρ ὑμῶν ὁ οὐράνιος τρέφει αὐτά· οὐχ ὑμεῖς μᾶλλον διαφέρετε αὐτῶν;',
   'Emblepsate eis ta peteina tou ouranou hoti ou speirousin oude therizousin oude synagousin eis apothēkas, kai ho Patēr hymōn ho ouranios trephei auta; ouch hymeis mallon diapherete autōn?',
   'Jesus uses the example of ''the fowls of the air'' (τὰ πετεινὰ τοῦ οὐρανοῦ) to illustrate God''s providential care. Birds neither sow, reap, nor gather into barns, yet ''your heavenly Father feedeth them'' (ὁ Πατὴρ ὑμῶν ὁ οὐράνιος τρέφει αὐτά). The rhetorical question, ''Are ye not much better than they?'' (οὐχ ὑμεῖς μᾶλλον διαφέρετε αὐτῶν;) emphasizes humanity''s greater value in God''s eyes, thus providing a compelling reason to trust in His provision (Job 38:41, Ps 147:9).',
   'This verse illustrates God''s providential care through the example of birds, emphasizing His faithful provision for all creation and implicitly challenging human anxiety by asserting humanity''s greater value and worth in His eyes.'),
  (27,
   'Which of you by taking thought can add one cubit unto his stature?',
   'Τίς δὲ ἐξ ὑμῶν μεριμνῶν δύναται προσθεῖναι ἐπὶ τὴν ἡλικίαν αὐτοῦ πῆχυν ἕνα;',
   'Tis de ex hymōn merimnōn dynatai prostheinai epi tēn hēlikian autou pēchyn hena?',
   'This rhetorical question highlights the futility of anxiety. ''Which of you by taking thought can add one cubit unto his stature?'' (Τίς δὲ ἐξ ὑμῶν μεριμνῶν δύναται προσθεῖναι ἐπὶ τὴν ἡλικίαν αὐτοῦ πῆχυν ἕνα;). ''Stature'' (ἡλικίαν) can refer to physical height or, more likely in this context, to one''s lifespan. A ''cubit'' (πῆχυν) is a measure of length (approx. 18 inches). The point is that anxious worry cannot alter one''s predetermined life course or extend life by even a small measure (Ps 39:6, Eccles 8:8).',
   NULL),
  (28,
   'And why take ye thought for raiment? Consider the lilies of the field, how they grow; they toil not, neither do they spin:',
   'Καὶ περὶ ἐνδύματος τί μεριμνᾶτε; Καταμάθετε τὰ κρίνα τοῦ ἀγροῦ πῶς αὐξάνουσιν· οὐ κοπιῶσιν οὐδὲ νήθουσιν·',
   'Kai peri endymatos ti merimnate? Katamathete ta krina tou agrou pōs auxanousin; ou kopiōsin oude nēthousin;',
   'Jesus extends the argument to clothing, asking, ''And why take ye thought for raiment?'' (Καὶ περὶ ἐνδύματος τί μεριμνᾶτε;). He points to ''the lilies of the field'' (τὰ κρίνα τοῦ ἀγροῦ), which grow naturally without human ''toil'' (κοπιῶσιν) or ''spinning'' (νήθουσιν). This natural beauty, effortlessly provided by God, serves as another example of divine care for creation, which should inspire trust in His provision for human needs (Luke 12:27).',
   NULL),
  (29,
   'And yet I say unto you, That even Solomon in all his glory was not arrayed like one of these.',
   'λέγω δὲ ὑμῖν ὅτι οὐδὲ Σολομὼν ἐν πάσῃ τῇ δόξῃ αὐτοῦ περιεβάλετο ὡς ἓν τούτων.',
   'legō de hymin hoti oude Solomōn en pasē tē doxē autou periebaleto hōs hen toutōn.',
   'To emphasize the surpassing beauty of God''s creation, Jesus compares the lilies to King Solomon, renowned for his immense wealth and ''glory'' (δόξῃ). Even Solomon, in all his royal splendor, ''was not arrayed like one of these'' (οὐδὲ Σολομὼν ἐν πάσῃ τῇ δόξῃ αὐτοῦ περιεβάλετο ὡς ἓν τούτων). This hyperbole highlights God''s magnificent provision in nature, far exceeding human efforts and material grandeur (1 Kings 10:4-7, 2 Chron 9:3-6).',
   NULL),
  (30,
   'Wherefore, if God so clothe the grass of the field, which to day is, and to morrow is cast into the oven, shall he not much more clothe you, O ye of little faith?',
   'Εἰ δὲ τὸν χόρτον τοῦ ἀγροῦ, σήμερον ὄντα καὶ αὔριον εἰς κλίβανον βαλλόμενον, ὁ Θεὸς οὕτως ἀμφιέννυσιν, οὐ πολλῷ μᾶλλον ὑμᾶς, ὀλιγόπιστοι;',
   'Ei de ton chorton tou agrou, sēmeron onta kai aurion eis klibanon ballomenon, ho Theos houtōs amphiennysin, ou pollō mallon hymas, oligopistoi?',
   'This verse presents a powerful argument from the lesser to the greater. If God ''so clothe the grass of the field'' (τὸν χόρτον τοῦ ἀγροῦ), which is temporary and destined for the ''oven'' (κλίβανον), ''shall he not much more clothe you'' (οὐ πολλῷ μᾶλλον ὑμᾶς)? The rebuke ''O ye of little faith'' (ὀλιγόπιστοι, oligopistoi) points to the root of anxiety: a lack of trust in God''s faithful care. It challenges disciples to deepen their faith in their heavenly Father''s provision (Ps 37:25, Luke 12:28).',
   'This verse powerfully argues for God''s greater care for humanity, rebuking "little faith" (ὀλιγόπιστοι) and challenging believers to trust in His consistent, abundant provision, especially given their eternal value compared to transient creation.'),
  (31,
   'Therefore take no thought, saying, What shall we eat? or, What shall we drink? or, Wherewithal shall we be clothed?',
   'Μὴ οὖν μεριμνήσητε λέγοντες, Τί φάγωμεν; ἢ Τί πίωμεν; ἢ Τί περιβαλώμεθα;',
   'Mē oun merimnēsēte legontes, Ti phagōmen? ē Ti piōmen? ē Ti peribalōmetha?',
   'Jesus reiterates the command to ''take no thought'' (μὴ οὖν μεριμνήσητε), specifically addressing the anxious questions about ''What shall we eat? or, What shall we drink? or, Wherewithal shall we be clothed?'' These questions encapsulate the fundamental material concerns that often consume human attention and lead to worry. The repetition emphasizes the importance of releasing these anxieties and trusting in God''s provision (Luke 12:29).',
   NULL),
  (32,
   '(For after all these things do the Gentiles seek:) for your heavenly Father knoweth that ye have need of all these things.',
   'πάντα γὰρ ταῦτα τὰ ἔθνη ἐπιζητοῦσιν· οἶδεν γὰρ ὁ Πατὴρ ὑμῶν ὁ οὐράνιος ὅτι χρῄζετε τούτων ἁπάντων.',
   'panta gar tauta ta ethnē epizētousin; oiden gar ho Patēr hymōn ho ouranios hoti chrēizete toutōn hapantōn.',
   'Jesus contrasts the anxious pursuit of material things by ''the Gentiles'' (τὰ ἔθνη)—those outside the covenant with God—with the expected trust of His disciples. The Gentiles ''seek after'' (ἐπιζητοῦσιν) these things because they do not know God as a loving Father. However, ''your heavenly Father knoweth that ye have need of all these things'' (οἶδεν γὰρ ὁ Πατὴρ ὑμῶν ὁ οὐράνιος ὅτι χρῄζετε τούτων ἁπάντων), reinforcing His omniscience and care (Rom 1:21, Eph 4:17-19).',
   'This verse distinguishes the anxious pursuit of material needs by "Gentiles" (unbelievers) from the confident trust expected of God''s children, whose heavenly Father already knows and will provide for their necessities, highlighting the unique security found in faith.'),
  (33,
   'But seek ye first the kingdom of God, and his righteousness; and all these things shall be added unto you.',
   'Ζητεῖτε δὲ πρῶτον τὴν βασιλείαν [τοῦ Θεοῦ] καὶ τὴν δικαιοσύνην αὐτοῦ, καὶ ταῦτα πάντα προστεθήσεται ὑμῖν.',
   'Zēteite de prōton tēn basileian [tou Theou] kai tēn dikaiosynēn autou, kai tauta panta prostethēsetai hymin.',
   'This is a foundational command and promise. Instead of anxiously seeking material provisions, disciples are to ''seek ye first the kingdom of God, and his righteousness'' (Ζητεῖτε δὲ πρῶτον τὴν βασιλείαν [τοῦ Θεοῦ] καὶ τὴν δικαιοσύνην αὐτοῦ). Prioritizing God''s reign and His moral standards is paramount. The promise is that ''all these things shall be added unto you'' (ταῦτα πάντα προστεθήσεται ὑμῖν)—meaning all necessary material provisions will be supplied by God (Luke 12:31, Col 3:1-2).',
   'This is a foundational command, urging believers to prioritize God''s kingdom and His righteousness above all earthly concerns, promising that all necessary material provisions will be added to those who seek Him first, establishing a core principle of Christian living.'),
  (34,
   'Take therefore no thought for the morrow: for the morrow shall take thought for the things of itself. Sufficient unto the day is the evil thereof.',
   'Μὴ οὖν μεριμνήσητε εἰς τὴν αὔριον, ἡ γὰρ αὔριον μεριμνήσει τὰ ἑαυτῆς. ἀρκετὸν τῇ ἡμέρᾳ ἡ κακία αὐτῆς.',
   'Mē oun merimnēsēte eis tēn aurion, hē gar aurion merimnēsei ta heautēs. arketon tē hēmera hē kakia autēs.',
   'Jesus concludes the section on anxiety by urging disciples not to ''take thought for the morrow'' (Μὴ οὖν μεριμνήσητε εἰς τὴν αὔριον). This is not a call to irresponsibility but to trust God for future needs, focusing on the present day. ''The morrow shall take thought for the things of itself'' (ἡ γὰρ αὔριον μεριμνήσει τὰ ἑαυτῆς) is a personification, meaning tomorrow will bring its own concerns. ''Sufficient unto the day is the evil thereof'' (ἀρκετὸν τῇ ἡμέρᾳ ἡ κακία αὐτῆς) means each day has enough trouble or difficulty (κακία) without adding future worries (Prov 27:1, James 4:13-14).',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 6;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλεημοσύνην', 'eleēmosynēn', 'G1654', 'Derived from ἔλεος (eleos, mercy), this word refers to acts of compassion, pity, or charity, specifically almsgiving. In Jewish tradition, it was a highly valued religious duty, often equated with righteousness. Jesus here redefines its practice, emphasizing the internal motive of mercy rather than external display, connecting it directly to one''s relationship with God.', 1),
  ('γνώτω', 'gnōtō', 'G1097', 'From γινώσκω (ginōskō), meaning ''to know,'' ''to perceive,'' or ''to understand.'' In this context, it is an imperative, ''let it know.'' The hyperbole ''let not thy left hand know'' emphasizes an extreme level of secrecy and humility in giving, suggesting that even one''s own conscious awareness of the good deed should be minimized to ensure purity of motive.', 2),
  ('ἀριστερά', 'aristera', 'G710', 'Meaning ''left hand'' or ''left side.'' In ancient cultures, the left hand was sometimes associated with less honor or skill compared to the right. Here, it is used metaphorically in contrast to the ''right hand'' to convey the idea of such profound secrecy that even one''s own faculties are unaware of the charitable act, preventing any self-congratulation.', 3),
  ('δεξιά', 'dexia', 'G1188', 'Meaning ''right hand'' or ''right side.'' The right hand was generally considered the hand of strength, skill, and honor. In this proverbial saying, it represents the active agent performing the act of almsgiving. The contrast with the left hand underscores the radical call for humility and hiddenness in acts of righteousness.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = 3;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εἰσενέγκῃς', 'eisenenkēs', 'G1533', 'From εἰσφέρω (eisphero), meaning ''to bring in,'' ''to lead into.'' In the petition ''lead us not into temptation,'' it implies a request for God not to allow believers to enter into a situation where they might succumb to severe testing or moral trial. It acknowledges human weakness and dependence on divine protection from overwhelming temptation.', 1),
  ('πειρασμόν', 'peirasmon', 'G3986', 'Meaning ''temptation,'' ''trial,'' or ''testing.'' It refers to a situation or influence that tests one''s faith, character, or moral integrity, potentially leading to sin. The prayer is not to avoid all trials, but to be preserved from those that would lead to spiritual downfall, recognizing God''s power to sustain.', 2),
  ('ῥῦσαι', 'rhysai', 'G4506', 'An imperative from ῥύομαι (rhyomai), meaning ''to deliver,'' ''to rescue,'' or ''to save.'' This petition expresses a plea for divine intervention and protection from the power of evil. It signifies a deep reliance on God''s ability to guard believers from spiritual harm and the influence of malevolent forces.', 3),
  ('πονηροῦ', 'ponērou', 'G4190', 'The genitive form of πονηρός (ponēros), meaning ''evil,'' ''wicked,'' or ''malicious.'' In this context, it can refer either to evil in a general sense (evil itself) or, more specifically, to ''the evil one,'' Satan, who is the primary instigator of temptation and wickedness. The latter interpretation is favored by many scholars, emphasizing deliverance from a personal adversary.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = 13;

-- Verse 19
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θησαυρίζετε', 'thēsaurizete', 'G2343', 'From θησαυρίζω (thēsaurizō), meaning ''to lay up treasure,'' ''to store up,'' or ''to accumulate wealth.'' Jesus uses this verb to instruct against the accumulation of material possessions as one''s ultimate security or source of value. It implies a conscious act of prioritizing and investing one''s resources and affections.', 1),
  ('θησαυροὺς', 'thēsaurous', 'G2344', 'Meaning ''treasure,'' ''storehouse,'' or ''riches.'' In this context, it refers to valuable possessions or wealth. Jesus contrasts earthly treasures, which are perishable and insecure, with heavenly treasures, which are eternal and secure, challenging disciples to re-evaluate their ultimate source of value and security.', 2),
  ('σὴς', 'sēs', 'G4597', 'Meaning ''moth.'' In ancient times, moths were a common threat to valuable textiles and garments, which often constituted a significant portion of a person''s wealth. Its inclusion highlights the vulnerability of earthly possessions to natural decay and destruction, rendering them impermanent.', 3),
  ('βρῶσις', 'brōsis', 'G1035', 'Meaning ''eating,'' ''food,'' or ''rust'' (in the context of metal corrosion). Here, it refers to the destructive process of decay, particularly rust on metals. Along with moths, it symbolizes the inherent impermanence and susceptibility of material wealth to natural forces of deterioration, making it an unreliable source of lasting security.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = 19;

-- Verse 24
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δύναται', 'dynatai', 'G1410', 'From δύναμαι (dynamai), meaning ''to be able,'' ''to have power,'' or ''to be possible.'' Here, it expresses an absolute impossibility: ''No one is able.'' Jesus uses this to emphasize the inherent conflict and mutual exclusivity of serving two ultimate authorities, especially God and Mammon, demanding an undivided allegiance.', 1),
  ('δουλεύειν', 'douleuein', 'G1398', 'Meaning ''to serve,'' ''to be a slave,'' or ''to be in bondage.'' This verb denotes a relationship of complete submission and obedience to a master. Jesus uses it to highlight the total commitment required by a master, making it impossible to render such exclusive service to two conflicting authorities simultaneously.', 2),
  ('κυρίοις', 'kyriois', 'G2962', 'The dative plural of κύριος (kyrios), meaning ''lord,'' ''master,'' or ''owner.'' In this context, it refers to those who hold absolute authority over a servant. The use of the plural ''two masters'' underscores the fundamental conflict of divided loyalties when two entities demand ultimate and exclusive devotion.', 3),
  ('μαμωνᾷ', 'mamōna', 'G3143', 'An Aramaic word (מָמוֹנָא, mamona) transliterated into Greek, meaning ''wealth,'' ''money,'' or ''property.'' Here, it is personified as a rival master or deity, representing the idolatrous pursuit of material possessions. Jesus'' teaching implies that devotion to wealth becomes a form of worship that competes directly with the worship of God.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = 24;

-- Verse 30
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χόρτον', 'chorton', 'G5528', 'Meaning ''grass,'' ''hay,'' or ''fodder.'' Jesus uses the example of the ephemeral nature of field grass, which is here today and burned tomorrow, to illustrate God''s meticulous care for even the most transient parts of creation. This serves as a powerful argument for His greater care for humanity.', 1),
  ('κλίβανον', 'klibanon', 'G2823', 'Meaning ''oven'' or ''furnace.'' In ancient Palestine, dried grass and weeds were commonly used as fuel for baking ovens. This imagery emphasizes the perishable and temporary nature of the grass, further highlighting the contrast with the enduring value and eternal destiny of human beings.', 2),
  ('ἀμφιέννυσιν', 'amphiennysin', 'G294', 'From ἀμφιέννυμι (amphiennymi), meaning ''to clothe,'' ''to array,'' or ''to put on.'' This verb describes God''s act of adorning the grass with its natural beauty. It underscores God''s creative power and meticulous attention to detail in providing for and beautifying even the most humble and temporary elements of His creation.', 3),
  ('ὀλιγόπιστοι', 'oligopistoi', 'G3640', 'Meaning ''of little faith'' or ''faint-hearted.'' This term is a gentle rebuke from Jesus, indicating a deficiency in trust rather than a complete absence of faith. It points to the root cause of anxiety—a failure to fully rely on God''s providential care despite evidence of His faithfulness to all creation.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = 30;

-- Verse 33
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ζητεῖτε', 'Zēteite', 'G2212', 'An imperative from ζητέω (zēteō), meaning ''to seek,'' ''to endeavor to obtain,'' or ''to strive for.'' This command calls for an active, intentional, and primary pursuit. It implies a reorientation of one''s life priorities, directing one''s deepest desires and efforts towards God''s kingdom and righteousness above all else.', 1),
  ('πρῶτον', 'prōton', 'G4412', 'Meaning ''first,'' ''foremost,'' or ''in the first place.'' This adverb emphasizes priority and preeminence. It signifies that seeking God''s kingdom and righteousness should be the absolute top priority in a believer''s life, taking precedence over all other concerns, including material needs.', 2),
  ('βασιλείαν', 'basileian', 'G932', 'Meaning ''kingdom,'' ''royal power,'' or ''reign.'' In the New Testament, it refers to God''s sovereign rule, both present (in the hearts of believers and the church) and future (in its full eschatological manifestation). Seeking the kingdom means submitting to God''s authority and living according to His principles.', 3),
  ('δικαιοσύνην', 'dikaiosynēn', 'G1343', 'Meaning ''righteousness,'' ''justice,'' or ''conformity to God''s will.'' It encompasses both God''s righteous character and the righteous conduct He requires of His people. Seeking His righteousness means striving to live a life that aligns with God''s moral standards and ethical demands, as taught by Jesus.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = 33;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Matthew 5:20', 1),
  (1, 'Romans 12:17', 2),
  (1, 'Philippians 2:3-4', 3),
  (1, 'Colossians 3:23', 4),
  (2, 'Proverbs 25:27', 1),
  (2, 'Luke 14:14', 2),
  (2, '1 Corinthians 4:5', 3),
  (2, 'Galatians 6:7', 4),
  (3, 'Romans 12:8', 1),
  (3, '2 Corinthians 9:7', 2),
  (3, 'Colossians 3:23', 3),
  (4, 'Psalm 33:13-15', 1),
  (4, 'Hebrews 4:13', 2),
  (4, 'Revelation 2:23', 3),
  (4, '1 Samuel 16:7', 4),
  (5, 'Mark 12:38-40', 1),
  (5, 'Luke 18:10-14', 2),
  (5, 'John 5:44', 3),
  (5, '1 Thessalonians 2:6', 4),
  (6, 'Isaiah 26:20', 1),
  (6, 'Psalm 5:3', 2),
  (6, 'Daniel 6:10', 3),
  (6, 'Colossians 4:2', 4),
  (7, '1 Kings 18:26-29', 1),
  (7, 'Ecclesiastes 5:2', 2),
  (7, 'Acts 19:34', 3),
  (7, 'Isaiah 1:15', 4),
  (8, 'Psalm 139:1-4', 1),
  (8, 'Isaiah 65:24', 2),
  (8, 'Philippians 4:6', 3),
  (8, 'Luke 12:30', 4),
  (9, 'Luke 11:2', 1),
  (9, 'Isaiah 6:3', 2),
  (9, 'Ezekiel 36:23', 3),
  (9, 'Psalm 111:9', 4),
  (10, 'Matthew 26:42', 1),
  (10, 'Acts 21:14', 2),
  (10, 'Revelation 11:15', 3),
  (10, 'Psalm 103:19-22', 4),
  (11, 'Proverbs 30:8', 1),
  (11, 'John 6:33-35', 2),
  (11, '1 Timothy 6:8', 3),
  (11, 'Exodus 16:4', 4),
  (12, 'Matthew 18:21-35', 1),
  (12, 'Mark 11:25', 2),
  (12, 'Ephesians 4:32', 3),
  (12, 'Colossians 3:13', 4),
  (13, '1 Corinthians 10:13', 1),
  (13, 'James 1:13-14', 2),
  (13, '2 Thessalonians 3:3', 3),
  (13, 'John 17:15', 4),
  (14, 'Matthew 18:35', 1),
  (14, 'Colossians 3:13', 2),
  (14, 'Ephesians 4:32', 3),
  (14, 'Luke 6:37', 4),
  (15, 'Mark 11:26', 1),
  (15, 'James 2:13', 2),
  (15, 'Proverbs 21:13', 3),
  (16, 'Isaiah 58:3-5', 1),
  (16, 'Zechariah 7:5-6', 2),
  (16, 'Luke 18:12', 3),
  (16, 'Joel 2:12-13', 4),
  (17, 'Ruth 3:3', 1),
  (17, '2 Samuel 12:20', 2),
  (17, 'Ecclesiastes 9:8', 3),
  (18, 'Colossians 3:23-24', 1),
  (18, '1 Peter 3:3-4', 2),
  (18, 'Romans 2:29', 3),
  (19, 'Proverbs 23:4-5', 1),
  (19, 'Luke 12:33', 2),
  (19, 'James 5:1-3', 3),
  (19, 'Ecclesiastes 5:10-12', 4),
  (20, 'Colossians 3:1-2', 1),
  (20, '1 Timothy 6:18-19', 2),
  (20, 'Hebrews 10:34', 3),
  (20, 'Revelation 21:4', 4),
  (21, 'Proverbs 4:23', 1),
  (21, 'Luke 12:34', 2),
  (21, 'Romans 1:21', 3),
  (21, 'Psalm 119:113', 4),
  (22, 'Luke 11:34', 1),
  (22, 'Proverbs 22:9', 2),
  (22, 'Romans 12:8', 3),
  (22, 'Ephesians 1:18', 4),
  (23, 'Deuteronomy 15:9', 1),
  (23, 'Mark 7:22', 2),
  (23, 'Ephesians 5:8', 3),
  (23, 'John 3:19', 4),
  (24, 'Luke 16:13', 1),
  (24, 'Romans 6:16', 2),
  (24, 'Galatians 1:10', 3),
  (24, '1 John 2:15-16', 4),
  (25, 'Philippians 4:6', 1),
  (25, '1 Peter 5:7', 2),
  (25, 'Luke 12:22-23', 3),
  (25, 'Psalm 55:22', 4),
  (26, 'Job 38:41', 1),
  (26, 'Psalm 147:9', 2),
  (26, 'Luke 12:24', 3),
  (26, 'Genesis 1:26-27', 4),
  (27, 'Psalm 39:6', 1),
  (27, 'Ecclesiastes 8:8', 2),
  (27, 'Luke 12:25-26', 3),
  (28, 'Luke 12:27', 1),
  (28, 'Psalm 90:5-6', 2),
  (29, '1 Kings 10:4-7', 1),
  (29, '2 Chronicles 9:3-6', 2),
  (29, 'Isaiah 61:10', 3),
  (30, 'Psalm 37:25', 1),
  (30, 'Isaiah 40:6-8', 2),
  (30, 'Luke 12:28', 3),
  (30, 'Hebrews 13:5', 4),
  (31, 'Luke 12:29', 1),
  (31, 'Proverbs 28:25', 2),
  (32, 'Romans 1:21', 1),
  (32, 'Ephesians 4:17-19', 2),
  (32, 'Luke 12:30', 3),
  (32, 'Psalm 10:4', 4),
  (33, 'Luke 12:31', 1),
  (33, 'Colossians 3:1-2', 2),
  (33, '1 Timothy 4:8', 3),
  (33, 'Haggai 1:5-6', 4),
  (34, 'Proverbs 27:1', 1),
  (34, 'James 4:13-14', 2),
  (34, 'Lamentations 3:22-23', 3),
  (34, 'Psalm 37:3', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 6 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 6 Complete!
-- 34 verses · 6 key verses with word studies (24 words)
-- Cross-references for 34 verses (126 refs)
-- ═══════════════════════════════════════════════════════