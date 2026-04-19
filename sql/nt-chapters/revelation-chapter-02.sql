-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 2 — Christ's Messages to Four Churches: Commendation, Rebuke, and Promise
-- 29 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Revelation Chapter 2 presents the first four of seven letters addressed to specific churches in Asia Minor, each conveying a unique message from the exalted Christ. These letters follow a consistent pattern: an address to the ''angel'' (messenger/leader) of the church, a self-description of Christ drawing from Revelation 1, commendation for their strengths, rebuke for their failures, a call to repentance, and a promise to ''him that overcometh.'' The chapter highlights the importance of perseverance, doctrinal purity, and fervent love, while warning against spiritual apathy, compromise with pagan practices, and false teaching. Historically, these letters reflect the challenges faced by early Christian communities, while theologically, they serve as timeless admonitions and encouragements for the church throughout all ages, emphasizing Christ''s intimate knowledge of His people''s condition and His ultimate authority.',
  'Christ''s Messages to Four Churches: Commendation, Rebuke, and Promise',
  'νικῶντι (nikōnti)',
  'Derived from νικάω (nikaō), meaning ''to conquer'' or ''to overcome.'' This participle, ''to him that overcometh,'' is a recurring motif in Revelation, emphasizing the active perseverance and spiritual victory required of believers in the face of persecution and temptation. It points to the eschatological reward for faithfulness in Christ.',
  '["Section 1 (vv.1-7): The Letter to Ephesus – Commendation for Diligence, Rebuke for Lost First Love","Section 2 (vv.8-11): The Letter to Smyrna – Commendation for Suffering, Promise of Life","Section 3 (vv.12-17): The Letter to Pergamum – Commendation for Faithfulness, Rebuke for Compromise","Section 4 (vv.18-29): The Letter to Thyatira – Commendation for Growth, Rebuke for Tolerating False Teaching"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 29 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Unto the angel of the church of Ephesus write; These things saith he that holdeth the seven stars in his right hand, who walketh in the midst of the seven golden candlesticks;',
   'Τῷ ἀγγέλῳ τῆς ἐν Ἐφέσῳ ἐκκλησίας γράψον· Τάδε λέγει ὁ κρατῶν τοὺς ἑπτὰ ἀστέρας ἐν τῇ δεξιᾷ αὐτοῦ χειρί, ὁ περιπατῶν ἐν μέσῳ τῶν ἑπτὰ λυχνιῶν τῶν χρυσῶν.',
   'Tō angelō tēs en Ephesō ekklēsias grapson; Tade legei ho kratōn tous hepta asteras en tē dexia autou cheiri, ho peripatōn en mesō tōn hepta lychniōn tōn chrysōn.',
   'The letter begins with an address to the ''angel'' (ἄγγελος, angelos) of the church in Ephesus, likely referring to the lead pastor or a representative messenger. The description of Christ as ''he that holdeth the seven stars in his right hand'' and ''who walketh in the midst of the seven golden candlesticks'' (cf. Rev 1:12-16) emphasizes His sovereign authority over the churches and His intimate presence among them. Ephesus was a prominent city, a center of commerce and pagan worship, making the church''s spiritual state particularly significant.',
   'This verse establishes Christ''s direct oversight and active presence within His churches. The ''seven stars'' symbolize the angels/messengers of the churches, and the ''seven golden candlesticks'' represent the churches themselves (Rev 1:20). This imagery underscores Christ''s personal knowledge of each congregation and His ultimate authority over their spiritual well-being and witness in the world.'),
  (2,
   'I know thy works, and thy labour, and thy patience, and how thou canst not bear them which are evil: and thou hast tried them which say they are apostles, and are not, and hast found them liars:',
   'Οἶδα τὰ ἔργα σου καὶ τὸν κόπον καὶ τὴν ὑπομονήν σου, καὶ ὅτι οὐ δύνῃ βαστάσαι κακούς, καὶ ἐπείρασας τοὺς λέγοντας ἑαυτοὺς ἀποστόλους καὶ οὐκ εἰσίν, καὶ εὗρες αὐτοὺς ψευδεῖς·',
   'Oida ta erga sou kai ton kopon kai tēn hypomonēn sou, kai hoti ou dynē bastasai kakous, kai epeirasas tous legontas heautous apostolous kai ouk eisin, kai heures autous pseudeis;',
   'Christ commends the Ephesian church for their ''works,'' ''labour'' (κόπον, kopon, implying toil to the point of exhaustion), and ''patience'' (ὑπομονήν, hypomonēn, steadfast endurance). They are also praised for their intolerance of evil and their discernment in testing false apostles. This reflects a church committed to truth and purity, reminiscent of Paul''s warnings about wolves in sheep''s clothing (Acts 20:29-30) and the importance of testing spirits (1 John 4:1).',
   'The commendation highlights the importance of both active service (''works,'' ''labour'') and steadfast endurance (''patience'') in the Christian life. Crucially, it affirms the necessity of doctrinal discernment and the rejection of false teachers, even those claiming apostolic authority. The church is called to be vigilant against deception, upholding the truth of the gospel.'),
  (3,
   'And hast borne, and hast patience, and for my name’s sake hast laboured, and hast not fainted.',
   'καὶ ὑπομονὴν ἔχεις καὶ ἐβάστασας διὰ τὸ ὄνομά μου καὶ οὐκ ἐκοπίασας.',
   'kai hypomonēn echeis kai ebastasas dia to onoma mou kai ouk ekopiasas.',
   'This verse reiterates and expands on the Ephesian church''s endurance, specifically noting that they ''hast borne'' (ἐβάστασας, ebastasas, carried burdens) and ''hast patience'' (ὑπομονὴν ἔχεις, hypomonēn echeis) ''for my name’s sake'' (διὰ τὸ ὄνομά μου). The phrase ''hast not fainted'' (οὐκ ἐκοπίασας, ouk ekopiasas) means they have not grown weary or given up, despite their arduous labor. Their faithfulness is rooted in their devotion to Christ''s name.',
   'True Christian endurance is not merely passive but an active bearing of burdens motivated by devotion to Christ''s name. This perseverance, even in the face of hardship and spiritual struggle, is a mark of genuine faith and a testament to the Holy Spirit''s work within believers, enabling them to continue without growing weary.'),
  (4,
   'Nevertheless I have somewhat against thee, because thou hast left thy first love.',
   'Ἀλλὰ ἔχω κατὰ σοῦ ὅτι τὴν ἀγάπην σου τὴν πρώτην ἀφῆκες.',
   'Alla echō kata sou hoti tēn agapēn sou tēn prōtēn aphēkes.',
   'Despite their many commendable qualities, Christ has a serious ''against thee'' (κατὰ σοῦ, kata sou) – they have ''left thy first love'' (τὴν ἀγάπην σου τὴν πρώτην ἀφῆκες, tēn agapēn sou tēn prōtēn aphēkes). This ''first love'' likely refers to their initial fervent devotion to Christ and to one another, which had cooled over time, perhaps overshadowed by their zeal for doctrinal purity and works. It''s a warning that orthodoxy without orthopraxy (right practice) and orthopathy (right affections) is insufficient.',
   'This verse presents a critical theological truth: diligent service and doctrinal purity, while vital, must always be rooted in and flow from a fervent love for Christ and His people. To lose this ''first love'' is to lose the animating principle of Christian life and ministry, rendering even good works hollow. It underscores the primacy of love (agape) in the Christian walk (1 Cor 13:1-3).'),
  (5,
   'Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent.',
   'Μνημόνευε οὖν πόθεν ἐκπέπτωκας, καὶ μετανόησον καὶ τὰ πρῶτα ἔργα ποίησον· εἰ δὲ μή, ἔρχομαί σοι ταχύ, καὶ κινήσω τὴν λυχνίαν σου ἐκ τοῦ τόπου αὐτῆς, ἐὰν μὴ μετανοήσῃς.',
   'Mnēmoneue oun pothen ekpeptōkas, kai metanoēson kai ta prōta erga poiēson; ei de mē, erchomai soi tachy, kai kinēsō tēn lychnian sou ek tou topou autēs, ean mē metanoēsēis.',
   'Christ calls the Ephesians to a three-fold response: ''Remember'' (Μνημόνευε, Mnēmoneue) their former state, ''repent'' (μετανόησον, metanoēson) of their current spiritual decline, and ''do the first works'' (τὰ πρῶτα ἔργα ποίησον, ta prōta erga poiēson), which implies a return to the actions motivated by their initial love. The severe warning is that if they do not repent, Christ will ''remove thy candlestick'' (κινήσω τὴν λυχνίαν σου, kinēsō tēn lychnian sou), signifying the loss of their church''s witness and perhaps its very existence.',
   'Repentance is presented as an active turning, involving remembering past faithfulness, changing one''s mind (μετανόησον), and demonstrating that change through renewed actions (''first works''). The threat of removing the ''candlestick'' highlights the conditional nature of a church''s privilege to bear witness; continued spiritual apathy can lead to the loss of its divine mandate and presence.'),
  (6,
   'But this thou hast, that thou hatest the deeds of the Nicolaitanes, which I also hate.',
   'Ἀλλὰ τοῦτο ἔχεις, ὅτι μισεῖς τὰ ἔργα τῶν Νικολαιτῶν, ἃ κἀγὼ μισῶ.',
   'Alla touto echeis, hoti miseis ta erga tōn Nikolaitōn, ha kagō misō.',
   'Despite the severe rebuke, Christ offers another commendation: the Ephesians ''hatest the deeds of the Nicolaitanes'' (μισεῖς τὰ ἔργα τῶν Νικολαιτῶν). The Nicolaitanes were a sect whose teachings apparently promoted moral laxity, possibly a form of antinomianism, allowing participation in pagan feasts and sexual immorality (cf. vv. 14-15). Christ explicitly states, ''which I also hate,'' underscoring His absolute opposition to such compromise with worldly practices.',
   'This verse reinforces the necessity of hating sin and rejecting false teachings that lead to moral compromise. Christ''s hatred for the ''deeds of the Nicolaitanes'' demonstrates that divine love is not sentimental but righteous, actively opposing anything that corrupts His church and defiles His name. Purity of doctrine and practice are essential for a church''s integrity.'),
  (7,
   'He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of God.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις. Τῷ νικῶντι δώσω αὐτῷ φαγεῖν ἐκ τοῦ ξύλου τῆς ζωῆς, ὅ ἐστιν ἐν τῷ παραδείσῳ τοῦ Θεοῦ.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais. Tō nikōnti dōsō autō phagein ek tou xylou tēs zōēs, ho estin en tō paradeisō tou Theou.',
   'The recurring call, ''He that hath an ear, let him hear what the Spirit saith unto the churches,'' emphasizes the spiritual nature of these messages and their relevance beyond a single congregation. The promise to ''him that overcometh'' (τῷ νικῶντι, tō nikōnti) is to ''eat of the tree of life'' (ἐκ τοῦ ξύλου τῆς ζωῆς, ek tou xylou tēs zōēs), a direct reversal of humanity''s expulsion from Eden (Gen 3:22-24). This signifies eternal life and restoration to intimate fellowship with God ''in the paradise of God.''',
   'This promise speaks to the ultimate hope of believers: eternal life and restoration to God''s presence, symbolized by the ''tree of life'' in ''paradise.'' It highlights that salvation is not merely escape from judgment but a return to the perfect communion with God lost in the Fall. The call to ''overcome'' implies active participation in faith and perseverance, with the reward being a share in Christ''s eternal victory.'),
  (8,
   'And unto the angel of the church in Smyrna write; These things saith the first and the last, which was dead, and is alive;',
   'Καὶ τῷ ἀγγέλῳ τῆς ἐν Σμύρνῃ ἐκκλησίας γράψον· Τάδε λέγει ὁ πρῶτος καὶ ὁ ἔσχατος, ὃς ἐγένετο νεκρὸς καὶ ἔζησεν·',
   'Kai tō angelō tēs en Smyrnē ekklēsias grapson; Tade legei ho prōtos kai ho eschatos, hos egeneto nekros kai ezēsen;',
   'The letter to Smyrna, a wealthy and beautiful city known for its loyalty to Rome and emperor worship, begins with Christ identifying Himself as ''the first and the last'' (ὁ πρῶτος καὶ ὁ ἔσχατος, ho prōtos kai ho eschatos) and ''which was dead, and is alive'' (ὃς ἐγένετο νεκρὸς καὶ ἔζησεν). This description (cf. Rev 1:17-18) is particularly fitting for a church facing severe persecution and martyrdom, as it emphasizes Christ''s eternal nature and His victory over death, offering hope in suffering.',
   'Christ''s self-identification as ''the first and the last'' affirms His eternal, sovereign nature, while ''who was dead, and is alive'' points to His resurrection and triumph over death. This foundational Christological truth provides immense comfort and assurance to a suffering church, reminding them that their Lord has conquered the very thing they fear, and therefore, their suffering is not the final word.'),
  (9,
   'I know thy works, and tribulation, and poverty, (but thou art rich) and I know the blasphemy of them which say they are Jews, and are not, but are the synagogue of Satan.',
   'Οἶδα σου τὴν θλῖψιν καὶ τὴν πτωχείαν, ἀλλὰ πλούσιος εἶ, καὶ τὴν βλασφημίαν ἐκ τῶν λεγόντων Ἰουδαίους εἶναι ἑαυτοὺς καὶ οὐκ εἰσὶν ἀλλὰ συναγωγὴ τοῦ Σατανᾶ.',
   'Oida sou tēn thlipsin kai tēn ptōcheian, alla plousios ei, kai tēn blasphēmian ek tōn legontōn Ioudaious einai heautous kai ouk eisin alla synagōgē tou Satana.',
   'Christ acknowledges Smyrna''s ''tribulation'' (θλῖψιν, thlipsin, intense pressure) and ''poverty'' (πτωχείαν, ptōcheian, destitution), likely due to persecution and economic hardship. Yet, He declares, ''but thou art rich'' (ἀλλὰ πλούσιος εἶ), highlighting their spiritual wealth. He also recognizes the ''blasphemy'' (βλασφημίαν, blasphēmian) from those who claim to be Jews but are not, labeling them a ''synagogue of Satan'' (συναγωγὴ τοῦ Σατανᾶ). This refers to Jewish opposition that actively persecuted Christians, often inciting Roman authorities against them.',
   'This verse presents a profound paradox: material poverty can coexist with spiritual richness. It teaches that true wealth is not earthly but heavenly. The condemnation of the ''synagogue of Satan'' underscores the spiritual battle against those who, under the guise of religion, actively oppose Christ and His church, revealing the demonic influence behind such persecution.'),
  (10,
   'Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.',
   'Μηδὲν φοβοῦ ἃ μέλλεις πάσχειν. Ἰδοὺ μέλλει ὁ διάβολος βαλεῖν ἐξ ὑμῶν εἰς φυλακήν, ἵνα πειρασθῆτε, καὶ ἕξετε θλῖψιν ἡμερῶν δέκα. Γίνου πιστὸς ἄχρι θανάτου, καὶ δώσω σοι τὸν στέφανον τῆς ζωῆς.',
   'Mēden phobou ha melleis paschein. Idou mellei ho diabolos balein ex hymōn eis phylakēn, hina peirasthēte, kai hexete thlipsin hēmerōn deka. Ginou pistos achri thanatou, kai dōsō soi ton stephanon tēs zōēs.',
   'Christ exhorts the Smyrnaeans not to ''fear none of those things which thou shalt suffer.'' He reveals that the ''devil'' (ὁ διάβολος, ho diabolos) will cast some into ''prison'' (φυλακήν, phylakēn) for a period of ''ten days'' (ἡμερῶν δέκα), a symbolic short but intense period of testing (ἵνα πειρασθῆτε, hina peirasthēte). The command is to ''be thou faithful unto death'' (Γίνου πιστὸς ἄχρι θανάτου), with the promise of a ''crown of life'' (τὸν στέφανον τῆς ζωῆς), a victor''s wreath signifying eternal reward for martyrdom.',
   'This verse offers a powerful theology of suffering and martyrdom. It reveals that persecution is often instigated by Satan, but it is ultimately permitted by God for the purpose of testing and refining faith. The call to ''be faithful unto death'' emphasizes ultimate loyalty to Christ, promising eternal life as the reward for those who endure to the end, even through physical death. The ''crown of life'' signifies eternal glory and vindication.'),
  (11,
   'He that hath an ear, let him hear what the Spirit saith unto the churches; He that overcometh shall not be hurt of the second death.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις. Ὁ νικῶν οὐ μὴ ἀδικηθῇ ἐκ τοῦ θανάτου τοῦ δευτέρου.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais. Ho nikōn ou mē adikēthē ek tou thanatou tou deuterou.',
   'Again, the call to hear what ''the Spirit saith unto the churches'' is given. The promise to ''him that overcometh'' (ὁ νικῶν, ho nikōn) is that he ''shall not be hurt of the second death'' (οὐ μὴ ἀδικηθῇ ἐκ τοῦ θανάτου τοῦ δευτέρου). The ''second death'' is a concept unique to Revelation (Rev 20:6, 14; 21:8), referring to eternal separation from God, the final judgment for the unrighteous. For those who remain faithful, even unto physical death, they are assured of eternal life with God.',
   'This verse introduces the concept of the ''second death,'' which is the ultimate, eternal spiritual condemnation, distinct from physical death. The promise that the overcomer ''shall not be hurt'' by it assures believers of their eternal security in Christ, regardless of earthly suffering or physical death. It underscores the profound difference between temporal suffering and eternal damnation, offering immense comfort to those facing persecution.'),
  (12,
   'And to the angel of the church in Pergamos write; These things saith he which hath the sharp sword with two edges;',
   'Καὶ τῷ ἀγγέλῳ τῆς ἐν Περγάμῳ ἐκκλησίας γράψον· Τάδε λέγει ὁ ἔχων τὴν ῥομφαίαν τὴν δίστομον τὴν ὀξεῖαν·',
   'Kai tō angelō tēs en Pergamō ekklēsias grapson; Tade legei ho echōn tēn rhomphaian tēn distomon tēn oxeian;',
   'The letter to Pergamum, a city known for its imperial cult and pagan temples (especially to Zeus and Asclepius), begins with Christ identifying Himself as ''he which hath the sharp sword with two edges'' (τὴν ῥομφαίαν τὴν δίστομον τὴν ὀξεῖαν). This imagery, drawn from Revelation 1:16, symbolizes Christ''s divine authority to judge and execute justice, particularly relevant for a church living in a city that was a center of Roman political and religious power, often called ''Satan''s seat'' (v. 13).',
   'Christ''s self-description as wielding the ''sharp two-edged sword'' emphasizes His divine authority as judge and executor of justice. This imagery signifies the power of His word to discern truth from falsehood, to condemn sin, and to bring judgment upon those who oppose Him. It serves as a warning to the compromising church in Pergamum that Christ''s judgment is swift and penetrating.'),
  (13,
   'I know thy works, and where thou dwellest, even where Satan’s seat is: and thou holdest fast my name, and hast not denied my faith, even in those days wherein Antipas was my faithful martyr, who was slain among you, where Satan dwelleth.',
   'Οἶδα ποῦ κατοικεῖς, ὅπου ὁ θρόνος τοῦ Σατανᾶ, καὶ κρατεῖς τὸ ὄνομά μου καὶ οὐκ ἠρνήσω τὴν πίστιν μου καὶ ἐν ταῖς ἡμέραις Ἀντιπᾶ τοῦ μάρτυρός μου τοῦ πιστοῦ, ὃς ἀπεκτάνθη παρʼ ὑμῖν, ὅπου ὁ Σατανᾶς κατοικεῖ.',
   'Oida pou katoikeis, hopou ho thronos tou Satana, kai krateis to onoma mou kai ouk ērnēsō tēn pistin mou kai en tais hēmerais Antipā tou martyros mou tou pistou, hos apektanthē parʼ hymin, hopou ho Satanas katoikei.',
   'Christ acknowledges the difficult environment of Pergamum, ''where Satan’s seat is'' (ὅπου ὁ θρόνος τοῦ Σατανᾶ). This likely refers to the city''s prominent imperial cult and numerous pagan temples, making it a hub of idolatry and anti-Christian sentiment. Despite this, the church is commended for holding fast to Christ''s ''name'' and not denying His ''faith,'' even in the face of martyrdom, specifically mentioning ''Antipas'' (Ἀντιπᾶ), Christ''s ''faithful martyr'' (μάρτυρός μου τοῦ πιστοῦ) who was slain there. This highlights their courage amidst intense spiritual warfare.',
   'This verse illustrates the reality of spiritual warfare, where believers may dwell in places of intense demonic influence (''Satan''s seat''). Yet, even in such environments, faithfulness to Christ''s name and unwavering commitment to His truth are possible and commendable. The example of Antipas, the ''faithful martyr,'' underscores the ultimate cost of discipleship and the honor of dying for Christ, affirming that such sacrifice is recognized and valued by God.'),
  (14,
   'But I have a few things against thee, because thou hast there them that hold the doctrine of Balaam, who taught Balac to cast a stumblingblock before the children of Israel, to eat things sacrificed unto idols, and to commit fornication.',
   'Ἀλλὰ ἔχω κατὰ σοῦ ὀλίγα, ὅτι ἔχεις ἐκεῖ κρατοῦντας τὴν διδαχὴν Βαλαάμ, ὃς ἐδίδασκεν τῷ Βαλὰκ βαλεῖν σκάνδαλον ἐνώπιον τῶν υἱῶν Ἰσραήλ, φαγεῖν εἰδωλόθυτα καὶ πορνεῦσαι.',
   'Alla echō kata sou oliga, hoti echeis ekei kratountas tēn didachēn Balaam, hos edidasken tō Balak balein skandalon enōpion tōn huiōn Israēl, phagein eidōlothyta kai porneūsai.',
   'Despite their faithfulness, Christ has ''a few things against thee.'' The Pergamene church tolerated those who held ''the doctrine of Balaam'' (τὴν διδαχὴν Βαλαάμ). This refers to the Old Testament prophet who, for gain, advised Balak to entice Israel into idolatry and sexual immorality (Num 25:1-3; 31:16). In Pergamum, this likely manifested as Christians participating in pagan temple feasts, which involved eating ''things sacrificed unto idols'' (εἰδωλόθυτα, eidōlothyta) and engaging in ''fornication'' (πορνεῦσαι, porneūsai), a common practice in pagan worship.',
   'This verse warns against the insidious danger of compromise with worldly practices, even when disguised under spiritual pretenses. The ''doctrine of Balaam'' represents the temptation to lead God''s people into sin through subtle enticements, particularly idolatry and sexual immorality. It highlights that tolerating such teaching within the church is a serious offense against Christ, as it undermines the purity and holiness of His people.'),
  (15,
   'So hast thou also them that hold the doctrine of the Nicolaitanes, which thing I hate.',
   'Οὕτως ἔχεις καὶ σὺ κρατοῦντας τὴν διδαχὴν Νικολαιτῶν ὁμοίως.',
   'Houtōs echeis kai sy kratountas tēn didachēn Nikolaitōn homoiōs.',
   'The problem in Pergamum is further compounded by the presence of those who ''hold the doctrine of the Nicolaitanes'' (τὴν διδαχὴν Νικολαιτῶν), similar to the issue in Ephesus (v. 6), though here it''s about tolerating their teaching rather than just their deeds. This suggests a more entrenched problem of false doctrine being accepted within the church, leading to moral compromise. The specific mention of ''doctrine'' (διδαχὴν, didachēn) indicates a systematic teaching that promoted laxity.',
   'The recurrence of the ''doctrine of the Nicolaitanes'' underscores the pervasive nature of false teaching in the early church. This verse emphasizes that tolerating false doctrine, especially that which promotes moral compromise, is a grave spiritual danger. A church''s responsibility includes not only rejecting evil deeds but also actively opposing and expelling corrupt teachings that lead God''s people astray.'),
  (16,
   'Repent; or else I will come unto thee quickly, and will fight against them with the sword of my mouth.',
   'Μετανόησον οὖν· εἰ δὲ μή, ἔρχομαί σοι ταχὺ καὶ πολεμήσω μετʼ αὐτῶν ἐν τῇ ῥομφαίᾳ τοῦ στόματός μου.',
   'Metanoēson oun; ei de mē, erchomai soi tachy kai polemēsō metʼ autōn en tē rhomphaia tou stomatos mou.',
   'Christ issues a direct command to ''Repent'' (Μετανόησον, Metanoēson). The consequence of not repenting is severe: ''or else I will come unto thee quickly'' (ἔρχομαί σοι ταχὺ, erchomai soi tachy) and ''will fight against them with the sword of my mouth'' (πολεμήσω μετʼ αὐτῶν ἐν τῇ ῥομφαίᾳ τοῦ στόματός μου). This refers to Christ''s powerful and decisive judgment, executed through His word, against those who persist in false teaching and moral compromise within the church. It''s a warning that Christ will personally intervene to purge His church.',
   'This verse highlights the urgency and necessity of repentance when a church tolerates sin and false doctrine. Christ''s promise to ''fight against them with the sword of my mouth'' signifies His divine judgment, which is executed through the power of His word. It underscores that Christ is not passive concerning the purity of His church and will actively confront and judge those who lead His people astray.'),
  (17,
   'He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the hidden manna, and will give him a white stone, and in the stone a new name written, which no man knoweth saving he that receiveth it.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις. Τῷ νικῶντι δώσω αὐτῷ τοῦ μάννα τοῦ κεκρυμμένου, καὶ δώσω αὐτῷ ψῆφον λευκήν, καὶ ἐπὶ τὴν ψῆφον ὄνομα καινὸν γεγραμμένον, ὃ οὐδεὶς οἶδεν εἰ μὴ ὁ λαμβάνων.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais. Tō nikōnti dōsō autō tou manna tou kekrymmenou, kai dōsō autō psēphon leukēn, kai epi tēn psēphon onoma kainon gegrammenon, ho oudeis oiden ei mē ho lambanōn.',
   'The promise to ''him that overcometh'' (τῷ νικῶντι, tō nikōnti) includes three symbolic rewards. First, ''the hidden manna'' (τοῦ μάννα τοῦ κεκρυμμένου), referring to the manna God provided in the wilderness (Exod 16), which was kept in the ark (Heb 9:4). This symbolizes spiritual nourishment and eternal life in Christ, the true bread from heaven (John 6:32-35). Second, a ''white stone'' (ψῆφον λευκήν), which could symbolize acquittal in a legal trial, acceptance into a fellowship, or a victor''s prize. Third, ''a new name written'' (ὄνομα καινὸν γεγραμμένον) on the stone, known only to the recipient, signifying a unique, intimate relationship with Christ and a new identity in Him.',
   'This verse offers rich eschatological promises. ''Hidden manna'' symbolizes Christ as the spiritual sustenance for eternal life, providing divine nourishment beyond earthly provisions. The ''white stone'' signifies divine vindication, acceptance, and a place in God''s eternal kingdom. The ''new name'' represents a unique, intimate relationship with God and a transformed identity, known only to the individual and Christ, emphasizing the personal nature of salvation and divine fellowship.'),
  (18,
   'And unto the angel of the church in Thyatira write; These things saith the Son of God, who hath his eyes like unto a flame of fire, and his feet are like fine brass;',
   'Καὶ τῷ ἀγγέλῳ τῆς ἐν Θυατείροις ἐκκλησίας γράψον· Τάδε λέγει ὁ Υἱὸς τοῦ Θεοῦ, ὁ ἔχων τοὺς ὀφθαλμοὺς αὐτοῦ ὡς φλόγα πυρός, καὶ οἱ πόδες αὐτοῦ ὅμοιοι χαλκολιβάνῳ·',
   'Kai tō angelō tēs en Thyateirois ekklēsias grapson; Tade legei ho Huios tou Theou, ho echōn tous ophthalmous autou hōs phloga pyros, kai hoi podes autou homoioi chalkolibanō;',
   'The letter to Thyatira, a prosperous city known for its trade guilds and associated pagan worship, begins with Christ identifying Himself as ''the Son of God'' (ὁ Υἱὸς τοῦ Θεοῦ), a unique title in these letters, emphasizing His divine authority. His ''eyes like unto a flame of fire'' (ὀφθαλμοὺς αὐτοῦ ὡς φλόγα πυρός) signify His penetrating gaze and discerning judgment, while His ''feet are like fine brass'' (πόδες αὐτοῦ ὅμοιοι χαλκολιβάνῳ) symbolize His steadfastness and impending judgment (cf. Rev 1:14-15). This imagery is particularly relevant for a church tolerating deep-seated sin.',
   'Christ''s self-identification as ''the Son of God'' affirms His unique divine nature and authority, especially in judgment. His ''eyes like a flame of fire'' symbolize His omniscient knowledge and penetrating discernment, seeing through all pretense and into the deepest parts of the heart. His ''feet like fine brass'' represent His unwavering resolve and the certainty of His righteous judgment against sin, providing a stern warning to a compromising church.'),
  (19,
   'I know thy works, and charity, and service, and faith, and thy patience, and thy works; and the last to be more than the first.',
   'Οἶδα σου τὰ ἔργα καὶ τὴν ἀγάπην καὶ τὴν πίστιν καὶ τὴν διακονίαν καὶ τὴν ὑπομονήν σου, καὶ τὰ ἔργα σου τὰ ἔσχατα πλείονα τῶν πρώτων.',
   'Oida sou ta erga kai tēn agapēn kai tēn pistin kai tēn diakonian kai tēn hypomonēn sou, kai ta erga sou ta eschata pleiona tōn prōtōn.',
   'Christ offers extensive commendation to the Thyatiran church, acknowledging their ''works,'' ''charity'' (ἀγάπην, agapēn), ''service'' (διακονίαν, diakonian), ''faith,'' and ''patience'' (ὑπομονήν, hypomonēn). Remarkably, their ''last'' works are ''more than the first'' (τὰ ἔσχατα πλείονα τῶν πρώτων), indicating spiritual growth and increasing zeal. This contrasts sharply with Ephesus, which had left its first love. This church was active and growing in many positive ways.',
   'This verse highlights that genuine spiritual growth is evidenced by increasing love, faith, service, and perseverance. It is a powerful affirmation that a church can grow in its commitment and activity over time, demonstrating a vibrant and maturing faith. This commendation sets the stage for the subsequent rebuke, showing that even a growing church can harbor serious spiritual problems.'),
  (20,
   'Notwithstanding I have a few things against thee, because thou sufferest that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols.',
   'Ἀλλὰ ἔχω κατὰ σοῦ ὅτι ἀφεῖς τὴν γυναῖκα Ἰεζάβελ, ἡ λέγουσα ἑαυτὴν προφῆτιν, καὶ διδάσκει καὶ πλανᾷ τοὺς ἐμοὺς δούλους πορνεῦσαι καὶ φαγεῖν εἰδωλόθυτα.',
   'Alla echō kata sou hoti apheis tēn gynaika Iezabel, hē legousa heautēn prophētin, kai didaskei kai planā tous emous doulous porneūsai kai phagein eidōlothyta.',
   'Despite their growth, Christ has ''a few things against thee'' (ὀλίγα, oliga, though the KJV omits this word present in some Greek texts). The primary issue is their toleration of ''that woman Jezebel'' (τὴν γυναῖκα Ἰεζάβελ), who ''calleth herself a prophetess'' (ἡ λέγουσα ἑαυτὴν προφῆτιν). This figure, likely a symbolic name for a real woman or group, was leading Christ''s ''servants'' (τοὺς ἐμοὺς δούλους) into ''fornication'' (πορνεῦσαι) and eating ''things sacrificed unto idols'' (φαγεῖν εἰδωλόθυτα), mirroring the Balaam problem in Pergamum. Jezebel from the OT (1 Kings 16-21) was notorious for promoting idolatry and immorality.',
   'This verse issues a severe warning against tolerating false teaching that leads to moral compromise within the church. The symbolic ''Jezebel'' represents a seductive influence that, under the guise of spiritual authority (''prophetess''), promotes idolatry and sexual immorality. It underscores Christ''s absolute intolerance for such corruption among His people and the church''s responsibility to confront and remove those who lead believers into sin.'),
  (21,
   'And I gave her space to repent of her fornication; and she repented not.',
   'καὶ ἔδωκα αὐτῇ χρόνον ἵνα μετανοήσῃ, καὶ οὐ θέλει μετανοῆσαι ἐκ τῆς πορνείας αὐτῆς.',
   'kai edōka autē chronon hina metanoēsē, kai ou thelei metanoēsai ek tēs porneias autēs.',
   'Christ reveals His patience and long-suffering, stating, ''And I gave her space to repent of her fornication'' (ἔδωκα αὐτῇ χρόνον ἵνα μετανοήσῃ). However, ''she repented not'' (οὐ θέλει μετανοῆσαι). This indicates that Jezebel had been given ample opportunity to turn from her sinful ways and false teachings but stubbornly refused, demonstrating a hardened heart. This refusal to repent seals her fate and the fate of those who follow her.',
   'This verse highlights God''s grace and patience, extending opportunities for repentance even to those actively leading others astray. However, it also underscores the gravity of unrepentant sin. A deliberate refusal to repent, despite divine warning and ''space,'' leads to inevitable judgment, demonstrating the seriousness of rejecting God''s call to turn from sin.'),
  (22,
   'Behold, I will cast her into a bed, and them that commit adultery with her into great tribulation, except they repent of their deeds.',
   'Ἰδοὺ βαλῶ αὐτὴν εἰς κλίνην, καὶ τοὺς μοιχεύοντας μετʼ αὐτῆς εἰς θλῖψιν μεγάλην, ἐὰν μὴ μετανοήσωσιν ἐκ τῶν ἔργων αὐτῆς.',
   'Idou balō autēn eis klinēn, kai tous moicheuontas metʼ autēs eis thlipsin megalēn, ean mē metanoēsōsin ek tōn ergōn autēs.',
   'As a consequence of her unrepentance, Christ declares, ''Behold, I will cast her into a bed'' (βαλῶ αὐτὴν εἰς κλίνην). This is a grim wordplay: from a bed of immorality, she will be cast into a bed of sickness and suffering. Those who ''commit adultery with her'' (τοὺς μοιχεύοντας μετʼ αὐτῆς), referring to those who participated in her spiritual and physical immorality, will be cast ''into great tribulation'' (εἰς θλῖψιν μεγάλην), ''except they repent of their deeds.'' This shows that judgment is conditional on repentance.',
   'This verse illustrates the principle of divine judgment, where the punishment often fits the crime. The ''bed'' of immorality becomes a ''bed'' of suffering, a direct consequence of unrepentant sin. It also emphasizes that those who participate in or condone false teaching and immorality will share in the judgment, though repentance remains an open door for them. God''s justice is both severe and merciful, always offering a path to restoration.'),
  (23,
   'And I will kill her children with death; and all the churches shall know that I am he which searcheth the reins and hearts: and I will give unto every one of you according to your works.',
   'καὶ τὰ τέκνα αὐτῆς ἀποκτενῶ ἐν θανάτῳ· καὶ γνώσονται πᾶσαι αἱ ἐκκλησίαι ὅτι ἐγώ εἰμι ὁ ἐρευνῶν νεφροὺς καὶ καρδίας, καὶ δώσω ὑμῖν ἑκάστῳ κατὰ τὰ ἔργα ὑμῶν.',
   'kai ta tekna autēs apoktenō en thanatō; kai gnōsontai pasai hai ekklēsiai hoti egō eimi ho ereunōn nephrous kai kardias, kai dōsō hymin hekastō kata ta erga hymōn.',
   'The judgment extends to ''her children'' (τὰ τέκνα αὐτῆς), likely referring to her spiritual offspring or followers, whom Christ ''will kill... with death'' (ἀποκτενῶ ἐν θανάτῳ). The purpose of this severe judgment is so ''all the churches shall know that I am he which searcheth the reins and hearts'' (ὁ ἐρευνῶν νεφροὺς καὶ καρδίας). ''Reins'' (νεφροὺς, nephrous, kidneys) were considered the seat of emotions and inner thoughts. This emphasizes Christ''s omniscience and His righteous judgment, where He will ''give unto every one of you according to your works.''',
   'This verse powerfully asserts Christ''s divine omniscience and His role as the righteous judge. He ''searches the reins and hearts,'' meaning He knows the deepest intentions and motivations of every individual. This judgment is not arbitrary but perfectly just, as He ''will give unto every one... according to your works,'' affirming the principle of divine accountability and retribution based on one''s deeds, whether good or evil.'),
  (24,
   'But unto you I say, and unto the rest in Thyatira, as many as have not this doctrine, and which have not known the depths of Satan, as they speak; I will put upon you none other burden.',
   'Ὑμῖν δὲ λέγω τοῖς λοιποῖς τοῖς ἐν Θυατείροις, ὅσοι οὐκ ἔχουσιν τὴν διδαχὴν ταύτην, οἵτινες οὐκ ἔγνωσαν τὰ βάθη τοῦ Σατανᾶ, ὡς λέγουσιν, οὐ βάλλω ἐφʼ ὑμᾶς ἄλλο βάρος·',
   'Hymin de legō tois loipois tois en Thyateirois, hosoi ouk echousin tēn didachēn tautēn, hoitines ouk egnōsan ta bathē tou Satana, hōs legousin, ou ballō ephʼ hymas allo baros;',
   'Christ addresses the faithful remnant in Thyatira, ''as many as have not this doctrine'' (οὐκ ἔχουσιν τὴν διδαχὴν ταύτην) and ''have not known the depths of Satan'' (τὰ βάθη τοῦ Σατανᾶ). The phrase ''as they speak'' (ὡς λέγουσιν) suggests that Jezebel''s followers might have claimed their teachings were ''deep things'' or ''mysteries,'' but Christ exposes them as ''depths of Satan.'' To this faithful group, Christ promises, ''I will put upon you none other burden'' (οὐ βάλλω ἐφʼ ὑμᾶς ἄλλο βάρος), meaning no additional requirements beyond their current faithfulness.',
   'This verse offers comfort and assurance to those who remain faithful amidst widespread apostasy. It distinguishes between true spiritual ''depths'' and the deceptive ''depths of Satan,'' which are actually doctrines of demons leading to sin. Christ''s promise not to lay ''any other burden'' on the faithful underscores His grace and understanding, affirming that their steadfastness in truth is sufficient and highly valued.'),
  (25,
   'But that which ye have already hold fast till I come.',
   'πλὴν ὃ ἔχετε κρατήσατε ἄχρις οὗ ἂν ἥξω.',
   'plēn ho echete kratēsate achris hou an hēxō.',
   'The instruction to the faithful remnant is simple yet profound: ''But that which ye have already hold fast till I come'' (πλὴν ὃ ἔχετε κρατήσατε ἄχρις οὗ ἂν ἥξω). This emphasizes perseverance and steadfastness in their current faith and practice. The phrase ''till I come'' (ἄχρις οὗ ἂν ἥξω) points to Christ''s second coming, providing an eschatological motivation for enduring faithfulness.',
   'This verse is a call to enduring faithfulness, emphasizing the importance of holding fast to the truth and spiritual integrity one already possesses. The motivation for this perseverance is the imminent return of Christ. It teaches that steadfastness until the Lord''s coming is a fundamental aspect of Christian discipleship, ensuring that believers remain prepared for His arrival.'),
  (26,
   'And he that overcometh, and keepeth my works unto the end, to him will I give power over the nations:',
   'Καὶ ὁ νικῶν καὶ ὁ τηρῶν ἄχρι τέλους τὰ ἔργα μου, δώσω αὐτῷ ἐξουσίαν ἐπὶ τῶν ἐθνῶν,',
   'Kai ho nikōn kai ho tērōn achri telous ta erga mou, dōsō autō exousian epi tōn ethnōn,',
   'To ''him that overcometh'' (ὁ νικῶν) and ''keepeth my works unto the end'' (ὁ τηρῶν ἄχρι τέλους τὰ ἔργα μου), Christ promises ''power over the nations'' (ἐξουσίαν ἐπὶ τῶν ἐθνῶν). This promise echoes Psalm 2:8-9, where the Messiah is granted authority over the nations. It signifies a share in Christ''s future millennial reign and ultimate triumph over all earthly powers, a reward for faithful endurance and active obedience.',
   'This verse reveals an eschatological promise of co-reign with Christ for faithful believers. The ''power over the nations'' signifies a share in Christ''s future kingdom authority, a reward for those who ''overcome'' and persevere in ''His works'' until the end. It underscores the future vindication and glorification of the saints, who will participate in Christ''s righteous rule over the earth.'),
  (27,
   'And he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father.',
   'καὶ ποιμανεῖ αὐτοὺς ἐν ῥάβδῳ σιδηρᾷ, ὡς τὰ σκεύη τὰ κεραμικὰ συντρίβεται, ὡς κἀγὼ εἴληφα παρὰ τοῦ Πατρός μου·',
   'kai poimanei autous en rhabdō sidēra, hōs ta skeue ta keramika syntribetai, hōs kagō eilēpha para tou Patros mou;',
   'This verse elaborates on the ''power over the nations,'' stating that the overcomer ''shall rule them with a rod of iron'' (ποιμανεῖ αὐτοὺς ἐν ῥάβδῳ σιδηρᾷ), and they will be ''broken to shivers'' (συντρίβεται, syntribetai) ''as the vessels of a potter.'' This imagery, again from Psalm 2:9, speaks of absolute, unyielding authority and judgment. Christ then adds, ''even as I received of my Father,'' indicating that this shared authority is a direct extension of His own divine prerogative, granted by God the Father.',
   'This verse further details the nature of the believer''s future co-reign with Christ, emphasizing righteous and decisive authority. The ''rod of iron'' symbolizes Christ''s absolute rule and judgment over rebellious nations, which believers will share. This authority is derived directly from the Father, highlighting the intimate union between Christ and His faithful, and their participation in His divine prerogatives.'),
  (28,
   'And I will give him the morning star.',
   'καὶ δώσω αὐτῷ τὸν ἀστέρα τὸν πρωϊνόν.',
   'kai dōsō autō ton astera ton prōinon.',
   'The final promise to the overcomer is, ''And I will give him the morning star'' (τὸν ἀστέρα τὸν πρωϊνόν). This title is later applied to Christ Himself in Revelation 22:16, where He declares, ''I am the root and the offspring of David, and the bright and morning star.'' Giving the morning star to the overcomer symbolizes a share in Christ''s glory, His victory, and His radiant presence, signifying a unique and intimate relationship with Him in His eternal kingdom.',
   'The promise of ''the morning star'' is a profound eschatological gift, symbolizing a share in Christ''s own glory and triumph. As Christ is the ''bright and morning star'' (Rev 22:16), this promise signifies an intimate union with Him, participation in His radiant presence, and the dawning of eternal day. It represents the ultimate reward of divine fellowship and glorification for the faithful overcomer.'),
  (29,
   'He that hath an ear, let him hear what the Spirit saith unto the churches.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais.',
   'The chapter concludes with the repeated exhortation, ''He that hath an ear, let him hear what the Spirit saith unto the churches.'' This refrain, found at the end of each letter, emphasizes that these messages are not merely historical records but living words from the Holy Spirit, intended for all believers in all churches throughout all ages. It calls for spiritual attentiveness and obedience to the divine truth conveyed.',
   'This recurring exhortation underscores the universal and timeless relevance of these messages. It emphasizes that the Holy Spirit continues to speak to the church, calling for spiritual discernment and obedience. The phrase highlights the importance of actively listening to and applying God''s word, recognizing that these divine communications are vital for the spiritual health and growth of every believer and congregation.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κόπον', 'kopon', 'G2873', 'From κόπτω (koptō, ''to cut, beat''). It refers to labor, toil, or trouble, often implying wearisome effort to the point of exhaustion. In this context, it highlights the strenuous and diligent work of the Ephesian church in their service and defense of the faith, demonstrating their commitment despite hardship.', 1),
  ('ὑπομονήν', 'hypomonēn', 'G5281', 'From ὑπομένω (hypomenō, ''to remain under''). It denotes patient endurance, steadfastness, or perseverance, especially in the face of adversity or suffering. It''s not passive resignation but an active, hopeful waiting and persistence, a key virtue in the New Testament for believers facing trials.', 2),
  ('ἀποστόλους', 'apostolous', 'G652', 'From ἀποστέλλω (apostellō, ''to send forth''). It means ''one sent,'' an envoy or messenger. In the NT, it primarily refers to the twelve disciples chosen by Christ, and later Paul, as authoritative representatives with a foundational role in the church. Here, it refers to false claimants of this authoritative office.', 3),
  ('ψευδεῖς', 'pseudeis', 'G5571', 'From ψεῦδος (pseudos, ''a lie''). It means ''false,'' ''lying,'' or ''deceitful.'' In this context, it describes those who falsely claim to be apostles, exposing their deceptive nature and the Ephesian church''s discernment in unmasking their untruthfulness. It highlights the danger of spiritual imposters.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγάπην', 'agapēn', 'G26', 'A noun meaning ''love,'' specifically a divine, unconditional, self-sacrificial love. It is not primarily an emotion but an act of the will, a benevolent disposition. Here, ''first love'' refers to the initial fervent devotion to Christ and fellow believers, which the Ephesians had allowed to wane.', 1),
  ('πρώτην', 'prōtēn', 'G4413', 'An adjective meaning ''first,'' ''foremost,'' or ''original.'' In this context, it modifies ''love'' (agapēn), indicating the initial, primary, and most fervent love that characterized the Ephesian church at the beginning of their faith journey. Its loss signifies a serious spiritual decline.', 2),
  ('ἀφῆκες', 'aphēkes', 'G863', 'From ἀφίημι (aphiēmi, ''to send away, let go''). It means ''you have left,'' ''abandoned,'' or ''forsaken.'' This verb highlights the active choice of the Ephesian church in allowing their initial fervent love to diminish, implying a conscious or unconscious departure from their former devotion.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νικῶντι', 'nikōnti', 'G3528', 'A present active participle of νικάω (nikaō), meaning ''to conquer,'' ''to overcome,'' or ''to prevail.'' It describes one who is actively engaged in overcoming spiritual adversaries, temptations, and persecution. This term is central to Revelation''s message of perseverance and ultimate victory in Christ.', 1),
  ('ξύλου', 'xylou', 'G3586', 'A noun meaning ''wood,'' ''tree,'' or ''timber.'' In this context, it refers specifically to the ''tree of life'' (ξύλον τῆς ζωῆς), a symbolic tree first mentioned in Genesis 2-3 and recurring in Revelation. It represents eternal life and access to God''s sustaining presence.', 2),
  ('ζωῆς', 'zōēs', 'G2222', 'A noun meaning ''life,'' referring to both physical and spiritual existence. In the phrase ''tree of life,'' it denotes eternal, abundant life, a quality of life that is divine and everlasting, restored to believers in God''s paradise through Christ''s victory.', 3),
  ('παραδείσῳ', 'paradeisō', 'G3857', 'From a Persian word meaning ''enclosed park'' or ''garden.'' In the Septuagint, it translates ''Garden of Eden.'' In the New Testament, it refers to the spiritual realm of blessedness, often associated with heaven or the presence of God, signifying restoration to perfect communion.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 7;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('διάβολος', 'diabolos', 'G1228', 'From διαβάλλω (diaballō, ''to slander, accuse''). It means ''slanderer'' or ''accuser,'' referring to Satan, the arch-enemy of God and humanity. Here, it highlights Satan''s role in instigating persecution and tribulation against believers, though always under God''s sovereign permission.', 1),
  ('πιστὸς', 'pistos', 'G4103', 'An adjective meaning ''faithful,'' ''trustworthy,'' or ''believing.'' It describes one who is loyal and steadfast in their commitment, especially to God. The command ''be thou faithful unto death'' emphasizes unwavering allegiance to Christ, even to the point of martyrdom.', 2),
  ('θανάτου', 'thanatou', 'G2288', 'A noun meaning ''death,'' referring to the cessation of physical life. In this context, it specifically points to martyrdom, the ultimate sacrifice for one''s faith. The promise of the ''crown of life'' contrasts with this physical death, offering eternal life as the reward.', 3),
  ('στέφανον', 'stephanon', 'G4735', 'A noun meaning ''crown,'' ''wreath,'' or ''garland.'' In ancient times, it was given to victors in athletic contests or as a mark of honor. Here, the ''crown of life'' symbolizes the eternal reward and glory bestowed upon those who remain faithful to Christ, even through martyrdom.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 10;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θρόνος', 'thronos', 'G2362', 'A noun meaning ''throne,'' a seat of authority or power. ''Satan''s seat'' (ὁ θρόνος τοῦ Σατανᾶ) likely refers to Pergamum''s prominence as a center of emperor worship and pagan cults, signifying a place of intense demonic influence and opposition to God''s kingdom.', 1),
  ('κρατεῖς', 'krateis', 'G2902', 'From κρατέω (krateō, ''to be strong, rule''). It means ''you hold fast,'' ''you cling to,'' or ''you maintain.'' It describes the Pergamene church''s steadfast adherence to Christ''s name and faith, despite the hostile environment, demonstrating their unwavering loyalty.', 2),
  ('μάρτυρος', 'martyros', 'G3144', 'From μάρτυς (martys, ''a witness''). It means ''witness,'' and by extension, ''martyr,'' one who bears witness to Christ even unto death. Antipas is identified as Christ''s ''faithful martyr,'' highlighting the ultimate testimony of dying for one''s faith.', 3),
  ('πιστοῦ', 'pistou', 'G4103', 'An adjective meaning ''faithful,'' ''trustworthy,'' or ''believing.'' Describing Antipas as Christ''s ''faithful martyr'' emphasizes his unwavering loyalty and steadfastness in his witness, even in the face of persecution leading to death. It underscores the integrity of his testimony.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 13;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γυναῖκα', 'gynaika', 'G1135', 'A noun meaning ''woman,'' ''wife,'' or ''female.'' Here, it refers to the specific individual ''Jezebel,'' who was a false prophetess. The term itself is neutral, but in this context, it identifies the person responsible for the corrupting influence in Thyatira.', 1),
  ('Ἰεζάβελ', 'Iezabel', 'G2403', 'A Hebrew proper name, referring to the wicked queen in the Old Testament (1 Kings 16-21) who promoted Baal worship and persecuted God''s prophets. Here, it is likely a symbolic name for a woman in Thyatira who embodied similar characteristics of idolatry and immorality, leading believers astray.', 2),
  ('προφῆτιν', 'prophētin', 'G4395', 'From προφήτης (prophētēs, ''prophet''). It means ''prophetess,'' a female who claims to speak for God. This woman''s self-proclaimed prophetic authority was used to legitimize her false teachings and lead Christ''s servants into sin, highlighting the danger of false spiritual leadership.', 3),
  ('πλανᾷ', 'planā', 'G4105', 'From πλανάω (planaō, ''to wander''). It means ''to lead astray,'' ''to deceive,'' or ''to cause to err.'' This verb describes Jezebel''s active role in misleading Christ''s servants, indicating a deliberate and harmful deception that resulted in their moral and spiritual compromise.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 20;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐρευνῶν', 'ereunōn', 'G2045', 'A present active participle of ἐρευνάω (ereunaō), meaning ''to search,'' ''to examine,'' or ''to investigate thoroughly.'' It emphasizes Christ''s omniscient and penetrating gaze, His ability to scrutinize and understand the deepest parts of human beings, leaving nothing hidden from His knowledge.', 1),
  ('νεφροὺς', 'nephrous', 'G3510', 'A noun meaning ''kidneys'' or ''reins.'' In ancient thought, the kidneys were considered the seat of emotions, desires, and the innermost being. To ''search the reins'' means to examine one''s deepest affections, motivations, and hidden thoughts, signifying divine omniscience.', 2),
  ('καρδίας', 'kardias', 'G2588', 'A noun meaning ''heart.'' In biblical anthropology, the heart represents the center of one''s personality, intellect, will, and moral character. To ''search the hearts'' means to know one''s true intentions, beliefs, and moral state, confirming Christ''s complete understanding of humanity.', 3),
  ('ἔργα', 'erga', 'G2041', 'A noun meaning ''works,'' ''deeds,'' or ''actions.'' It refers to the outward manifestations of one''s inner character and beliefs. Christ''s judgment is based on these works, demonstrating that while salvation is by grace, works are the evidence of genuine faith and are subject to divine evaluation.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Revelation 1:12-16', 1),
  (1, 'Revelation 1:20', 2),
  (1, 'Zechariah 4:2', 3),
  (1, 'Matthew 18:20', 4),
  (2, 'Acts 20:29-30', 1),
  (2, '2 Corinthians 11:13-15', 2),
  (2, '1 John 4:1', 3),
  (2, 'Galatians 1:8-9', 4),
  (3, 'Galatians 6:9', 1),
  (3, '2 Thessalonians 3:13', 2),
  (3, 'Hebrews 12:3', 3),
  (3, 'Matthew 10:22', 4),
  (4, 'Matthew 24:12', 1),
  (4, 'Philippians 1:9', 2),
  (4, '1 John 4:7-8', 3),
  (4, 'Ephesians 3:17-19', 4),
  (5, 'Luke 13:3', 1),
  (5, 'Matthew 21:43', 2),
  (5, 'Revelation 3:3', 3),
  (5, 'Jeremiah 2:2', 4),
  (6, 'Revelation 2:15', 1),
  (6, 'Jude 1:11', 2),
  (6, '2 Peter 2:15', 3),
  (6, 'Romans 12:9', 4),
  (7, 'Genesis 2:9', 1),
  (7, 'Genesis 3:22-24', 2),
  (7, 'Revelation 22:2', 3),
  (7, 'Luke 23:43', 4),
  (8, 'Revelation 1:17-18', 1),
  (8, 'Isaiah 44:6', 2),
  (8, 'Isaiah 48:12', 3),
  (8, 'John 11:25', 4),
  (9, 'James 2:5', 1),
  (9, 'Romans 2:28-29', 2),
  (9, 'John 8:44', 3),
  (9, 'Revelation 3:9', 4),
  (10, 'Matthew 10:28', 1),
  (10, 'Daniel 1:12-14', 2),
  (10, 'James 1:12', 3),
  (10, '1 Peter 5:8-9', 4),
  (11, 'Revelation 20:6', 1),
  (11, 'Revelation 20:14', 2),
  (11, 'Revelation 21:8', 3),
  (11, 'John 8:51', 4),
  (12, 'Revelation 1:16', 1),
  (12, 'Hebrews 4:12', 2),
  (12, 'Ephesians 6:17', 3),
  (12, 'Isaiah 49:2', 4),
  (13, 'Revelation 13:2', 1),
  (13, 'Daniel 7:25', 2),
  (13, 'Acts 20:24', 3),
  (13, 'Matthew 10:32-33', 4),
  (14, 'Numbers 25:1-3', 1),
  (14, 'Numbers 31:16', 2),
  (14, '1 Corinthians 10:7-8', 3),
  (14, 'Acts 15:29', 4),
  (15, 'Revelation 2:6', 1),
  (15, '2 Peter 2:1-3', 2),
  (15, 'Jude 1:4', 3),
  (15, '1 Timothy 4:1-3', 4),
  (16, 'Isaiah 11:4', 1),
  (16, '2 Thessalonians 2:8', 2),
  (16, 'Revelation 19:15', 3),
  (16, 'Hosea 6:1', 4),
  (17, 'Exodus 16:33-34', 1),
  (17, 'John 6:32-35', 2),
  (17, 'Isaiah 62:2', 3),
  (17, 'Revelation 3:12', 4),
  (18, 'Revelation 1:14-15', 1),
  (18, 'Daniel 10:6', 2),
  (18, 'Hebrews 4:13', 3),
  (18, 'Psalm 7:9', 4),
  (19, '1 Thessalonians 1:3', 1),
  (19, '2 Thessalonians 1:3', 2),
  (19, '1 Corinthians 13:13', 3),
  (19, 'Hebrews 6:10', 4),
  (20, '1 Kings 16:31-33', 1),
  (20, '1 Kings 21:25', 2),
  (20, 'Acts 15:20', 3),
  (20, '2 Timothy 2:16-18', 4),
  (21, 'Romans 2:4', 1),
  (21, '2 Peter 3:9', 2),
  (21, 'Luke 13:6-9', 3),
  (21, 'Jeremiah 8:5', 4),
  (22, 'Ezekiel 23:36-49', 1),
  (22, 'Galatians 6:7-8', 2),
  (22, 'Revelation 18:4-8', 3),
  (22, 'Psalm 7:16', 4),
  (23, 'Jeremiah 17:10', 1),
  (23, 'Psalm 7:9', 2),
  (23, 'Romans 2:6', 3),
  (23, 'Matthew 16:27', 4),
  (24, '1 Corinthians 2:10', 1),
  (24, '1 Timothy 6:20', 2),
  (24, 'Acts 15:28', 3),
  (24, 'Matthew 11:30', 4),
  (25, 'Revelation 3:11', 1),
  (25, 'Hebrews 10:23', 2),
  (25, '1 Corinthians 15:58', 3),
  (25, 'Philippians 4:1', 4),
  (26, 'Psalm 2:8-9', 1),
  (26, 'Daniel 7:27', 2),
  (26, 'Matthew 19:28', 3),
  (26, '1 Corinthians 6:2-3', 4),
  (27, 'Psalm 2:9', 1),
  (27, 'Revelation 12:5', 2),
  (27, 'Revelation 19:15', 3),
  (27, 'Isaiah 30:14', 4),
  (28, '2 Peter 1:19', 1),
  (28, 'Revelation 22:16', 2),
  (28, 'Malachi 4:2', 3),
  (28, 'Numbers 24:17', 4),
  (29, 'Matthew 11:15', 1),
  (29, 'Matthew 13:9', 2),
  (29, 'Revelation 3:6', 3),
  (29, 'Revelation 3:13', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 2 Complete!
-- 29 verses · 7 key verses with word studies (27 words)
-- Cross-references for 29 verses (116 refs)
-- ═══════════════════════════════════════════════════════