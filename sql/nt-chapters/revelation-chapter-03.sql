-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 3 — Christ's Call to Vigilance, Faithfulness, and Repentance for the Churches
-- 22 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Revelation Chapter 3 continues Christ''s messages to four of the seven churches in Asia Minor: Sardis, Philadelphia, and Laodicea. Each letter follows a similar structure, beginning with a self-description of Christ, an assessment of the church''s spiritual condition, specific exhortations or commendations, and promises to those who overcome. Sardis is severely rebuked for its spiritual deadness despite a reputation for vitality, urged to wakefulness and repentance. Philadelphia is highly commended for its faithfulness despite weakness, promised protection and honor. Laodicea receives the harshest condemnation for its lukewarmness and self-deception regarding its spiritual poverty, called to genuine repentance and a renewed relationship with Christ. The chapter underscores Christ''s intimate knowledge of His churches, His unwavering call to holiness, and the ultimate rewards for perseverance and faithfulness.',
  'Christ''s Call to Vigilance, Faithfulness, and Repentance for the Churches',
  'νικῶν (nikōn)',
  'Derived from ''νικάω'' (nikaō), meaning ''to conquer'' or ''to overcome.'' In Revelation, ''νικῶν'' refers to the one who perseveres in faith and obedience despite trials, temptations, and opposition from the world or false teachings. It signifies spiritual victory through Christ, leading to eschatological blessings and rewards.',
  '["Section 1 (vv.1-6): The Message to Sardis – The Dead Church Called to Wakefulness","Section 2 (vv.7-13): The Message to Philadelphia – The Faithful Church Commended and Encouraged","Section 3 (vv.14-22): The Message to Laodicea – The Lukewarm Church Rebuked and Invited"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 22 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And unto the angel of the church in Sardis write; These things saith he that hath the seven Spirits of God, and the seven stars; I know thy works, that thou hast a name that thou livest, and art dead.',
   'Καὶ τῷ ἀγγέλῳ τῆς ἐν Σάρδεσιν ἐκκλησίας γράψον· Τάδε λέγει ὁ ἔχων τὰ ἑπτὰ πνεύματα τοῦ Θεοῦ καὶ τοὺς ἑπτὰ ἀστέρας· Οἶδά σου τὰ ἔργα, ὅτι ὄνομα ἔχεις ὅτι ζῇς, καὶ νεκρὸς εἶ.',
   'Kai tō angelō tēs en Sardesin ekklēsias grapson; Tade legei ho echōn ta hepta pneumata tou Theou kai tous hepta asteras; Oida sou ta erga, hoti onoma echeis hoti zēs, kai nekros ei.',
   'Sardis, an ancient city known for its past glory and strategic location, had a reputation for being alive but was spiritually dead. Christ, identifying Himself as the one who possesses the ''seven Spirits of God'' (representing the fullness and perfection of the Holy Spirit, cf. Rev 1:4, 5:6) and the ''seven stars'' (the angels/messengers of the churches, cf. Rev 1:20), asserts His complete knowledge and authority over the church. The church in Sardis had a ''name'' or reputation for being vibrant, but its works revealed a lack of genuine spiritual life, a common danger for churches that rely on past achievements or outward appearances.',
   'This verse highlights Christ''s omniscient assessment of the church, penetrating beyond outward reputation to the true spiritual condition. The ''seven Spirits'' emphasize the Holy Spirit''s comprehensive power and presence, essential for true spiritual life. A church can maintain an external facade of activity while lacking the vitalizing power of God, demonstrating that true spiritual life is measured by God''s standard, not human perception.'),
  (2,
   'Be watchful, and strengthen the things which remain, that are ready to die: for I have not found thy works perfect before God.',
   'Γίνου γρηγορῶν, καὶ στήρισον τὰ λοιπὰ ἃ ἔμελλον ἀποθανεῖν· οὐ γὰρ εὕρηκά σου τὰ ἔργα πεπληρωμένα ἐνώπιον τοῦ Θεοῦ.',
   'Ginou grēgorōn, kai stērison ta loipa ha emellon apothanein; ou gar heurēka sou ta erga peplērōmena enōpion tou Theou.',
   'The command ''Be watchful'' (γρηγορῶν, grēgorōn) is a call to spiritual alertness and vigilance, contrasting with their present deadness. They are urged to ''strengthen the things which remain'' – the few sparks of spiritual life or remaining faithful members – before they too die out. Christ''s indictment, ''I have not found thy works perfect before God,'' implies that their actions were incomplete or lacking in spiritual integrity and devotion, failing to meet God''s standard of wholehearted service (cf. Col 1:10).',
   'This verse underscores the necessity of spiritual vigilance and active preservation of faith. It teaches that God evaluates the completeness and sincerity of our ''works,'' not just their existence. A partial or half-hearted commitment is insufficient; true service must be ''perfect'' or ''fulfilled'' in His sight, reflecting genuine devotion and obedience.'),
  (3,
   'Remember therefore how thou hast received and heard, and hold fast, and repent. If therefore thou shalt not watch, I will come on thee as a thief, and thou shalt not know what hour I will come upon thee.',
   'Μνημόνευε οὖν πῶς εἴληφας καὶ ἤκουσας, καὶ τήρει καὶ μετανόησον. Ἐὰν οὖν μὴ γρηγορήσῃς, ἥξω ἐπὶ σὲ ὡς κλέπτης, καὶ οὐ μὴ γνῷς ποίαν ὥραν ἥξω ἐπὶ σέ.',
   'Mnēmoneue oun pōs eilēphas kai ēkousas, kai tērei kai metanoēson. Ean oun mē grēgorēsēs, hēxō epi se hōs kleptēs, kai ou mē gnōs poian hōran hēxō epi se.',
   'The remedy for Sardis''s condition is a four-fold command: ''Remember,'' ''hold fast'' (τήρει), and ''repent.'' They are to recall the initial fervor and truth they received and heard, guarding it diligently. The warning of Christ''s coming ''as a thief'' is a common New Testament motif for unexpected judgment or the Lord''s return (Matt 24:43-44; 1 Thess 5:2; 2 Pet 3:10). This emphasizes the urgency of repentance and vigilance, as the timing of divine intervention is unknown.',
   'Repentance is presented as a conscious act of remembering past truth, holding fast to it, and turning from spiritual complacency. The imagery of Christ coming ''as a thief'' highlights the suddenness and unpredictability of divine judgment or intervention for those who are unprepared, emphasizing the continuous need for spiritual readiness and active faith.'),
  (4,
   'Thou hast a few names even in Sardis which have not defiled their garments; and they shall walk with me in white: for they are worthy.',
   'Ἀλλὰ ἔχεις ὀλίγα ὀνόματα ἐν Σάρδεσιν ἃ οὐκ ἐμόλυναν τὰ ἱμάτια αὐτῶν, καὶ περιπατήσουσι μετ’ ἐμοῦ ἐν λευκοῖς, ὅτι ἄξιοί εἰσιν.',
   'Alla echeis oliga onomata en Sardesin ha ouk emolynan ta himatia autōn, kai peripatēsousi met’ emou en leukois, hoti axioi eisin.',
   'Despite the general condemnation, Christ acknowledges a faithful remnant in Sardis. ''A few names'' refers to individuals who have not ''defiled their garments,'' symbolizing their purity, integrity, and faithfulness amidst the surrounding spiritual decay. The promise to ''walk with me in white'' signifies intimate fellowship with Christ and participation in His glory, a reward for their worthiness (ἄξιοι, axioi) – not inherent merit, but faithfulness enabled by grace (cf. Rev 7:9, 14:4).',
   'This verse offers hope by affirming the existence of a faithful remnant even within a compromised church. It teaches that spiritual purity (''undefiled garments'') is a mark of true discipleship, leading to intimate fellowship with Christ and a share in His glory. God always recognizes and rewards individual faithfulness, regardless of the prevailing spiritual climate.'),
  (5,
   'He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.',
   'Ὁ νικῶν οὗτος περιβαλεῖται ἐν ἱματίοις λευκοῖς, καὶ οὐ μὴ ἐξαλείψω τὸ ὄνομα αὐτοῦ ἐκ τῆς βίβλου τῆς ζωῆς, καὶ ὁμολογήσω τὸ ὄνομα αὐτοῦ ἐνώπιον τοῦ Πατρός μου καὶ ἐνώπιον τῶν ἀγγέλων αὐτοῦ.',
   'Ho nikōn houtos peribaleitai en himatiois leukois, kai ou mē exaleipsō to onoma autou ek tēs biblou tēs zōēs, kai homologēsō to onoma autou enōpion tou Patros mou kai enōpion tōn angelōn autou.',
   'The promise to the ''overcomer'' (ὁ νικῶν) reiterates the reward of ''white raiment,'' signifying purity, righteousness, and victory (cf. Rev 7:9, 14:4). The assurance ''I will not blot out his name out of the book of life'' is a powerful guarantee of eternal salvation and security for the faithful (Phil 4:3; Rev 13:8, 20:12, 20:15). Furthermore, Christ promises to ''confess his name'' before God the Father and His angels, a public declaration of their identity with Him, echoing His words in the Gospels (Matt 10:32; Luke 12:8).',
   'This verse presents profound assurances of eternal security for those who overcome. The ''book of life'' symbolizes God''s record of those destined for salvation. Christ''s promise not to erase a name and to confess it before the Father underscores His role as advocate and the certainty of salvation for the truly faithful, emphasizing the security of the believer in Christ.'),
  (6,
   'He that hath an ear, let him hear what the Spirit saith unto the churches.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais.',
   'This concluding exhortation, common to all seven letters, emphasizes the importance of spiritual discernment. It is not merely a call to hear with physical ears, but to understand and heed the spiritual message conveyed by the Holy Spirit to all churches, not just Sardis. It implies that the messages, while addressed to specific congregations, contain universal truths applicable to all believers across time.',
   NULL),
  (7,
   'And to the angel of the church in Philadelphia write; These things saith he that is holy, he that is true, he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth;',
   'Καὶ τῷ ἀγγέλῳ τῆς ἐν Φιλαδελφίᾳ ἐκκλησίας γράψον· Τάδε λέγει ὁ ἅγιος, ὁ ἀληθινός, ὁ ἔχων τὴν κλεῖν Δαυίδ, ὁ ἀνοίγων καὶ οὐδεὶς κλείσει, καὶ κλείων καὶ οὐδεὶς ἀνοίξει.',
   'Kai tō angelō tēs en Philadelphiā ekklēsias grapson; Tade legei ho hagios, ho alēthinos, ho echōn tēn klein Dauid, ho anoigōn kai oudeis kleisei, kai kleiōn kai oudeis anoixei.',
   'Philadelphia was a city prone to earthquakes, symbolizing instability, yet this church is praised. Christ introduces Himself with titles emphasizing His divine authority and truthfulness: ''the Holy One'' (ὁ ἅγιος) and ''the True One'' (ὁ ἀληθινός). Most significantly, He holds ''the key of David,'' a reference to Isaiah 22:22, where Eliakim is given authority over the house of David. This signifies Christ''s ultimate messianic authority to open doors of opportunity (for evangelism, access to God) and to shut them, with no one able to reverse His decrees (cf. Matt 16:19).',
   'This verse powerfully asserts Christ''s absolute sovereignty and authority. As ''the Holy One'' and ''the True One,'' He is the source of all truth and purity. Holding ''the key of David'' signifies His messianic authority over the kingdom of God, including access to salvation and opportunities for ministry, which He opens and shuts according to His divine will, independent of human power.'),
  (8,
   'I know thy works: behold, I have set before thee an open door, and no man can shut it: for thou hast a little strength, and hast kept my word, and hast not denied my name.',
   'Οἶδά σου τὰ ἔργα· ἰδοὺ δέδωκα ἐνώπιόν σου θύραν ἀνεῳγμένην, ἣν οὐδεὶς δύναται κλεῖσαι αὐτήν· ὅτι μικρὰν ἔχεις δύναμιν, καὶ ἐτήρησάς μου τὸν λόγον, καὶ οὐκ ἠρνήσω τὸ ὄνομά μου.',
   'Oida sou ta erga; idou dedōka enōpion sou thyran aneōgmenēn, hēn oudeis dynatai kleisai autēn; hoti mikran echeis dynamin, kai etērēsas mou ton logon, kai ouk ērnēsō to onoma mou.',
   'Unlike Sardis, Philadelphia receives no rebuke. Christ acknowledges their ''works'' and commends them for their faithfulness despite having ''little strength'' (μικρὰν ἔχεις δύναμιν), perhaps referring to their small size, lack of influence, or external pressures. Their faithfulness is demonstrated by keeping Christ''s ''word'' and not denying His ''name.'' The ''open door'' (θύραν ἀνεῳγμένην) is a divine opportunity for ministry and evangelism, which Christ, with the key of David, has opened and no human or demonic power can shut (cf. 1 Cor 16:9; 2 Cor 2:12; Col 4:3).',
   'This verse illustrates that God values faithfulness and obedience more than outward strength or worldly success. The ''open door'' signifies divine opportunities for ministry and evangelism, granted by Christ''s sovereign authority. It teaches that even a church with ''little strength'' can be powerfully used by God when it remains true to His word and name, demonstrating that God''s power is perfected in weakness.'),
  (9,
   'Behold, I will make them of the synagogue of Satan, which say they are Jews, and are not, but do lie; behold, I will make them to come and worship before thy feet, and to know that I have loved thee.',
   'Ἰδοὺ διδῶ ἐκ τῆς συναγωγῆς τοῦ Σατανᾶ τῶν λεγόντων ἑαυτοὺς Ἰουδαίους εἶναι, καὶ οὐκ εἰσὶν ἀλλὰ ψεύδονται· ἰδοὺ ποιήσω αὐτοὺς ἵνα ἥξουσιν καὶ προσκυνήσουσιν ἐνώπιον τῶν ποδῶν σου, καὶ γνῶσιν ὅτι ἐγὼ ἠγάπησά σε.',
   'Idou didō ek tēs synagōgēs tou Satana tōn legontōn heautous Ioudaious einai, kai ouk eisin alla pseudontai; idou poiēsō autous hina hēxousin kai proskynēsousin enōpion tōn podōn sou, kai gnōsin hoti egō ēgapēsa se.',
   'This verse addresses the opposition faced by the Philadelphian church from a ''synagogue of Satan,'' likely referring to Jewish individuals who claimed to be God''s people but actively opposed Christ and His followers (cf. Rev 2:9). Christ promises a future vindication for the faithful Philadelphians: their adversaries will be humbled and compelled to acknowledge God''s love for the church. This is not about literal worship of the church, but a recognition of God''s favor upon them, reversing the power dynamics.',
   'This promise highlights divine justice and vindication for the persecuted church. It reveals that those who claim religious identity but oppose Christ are, in God''s eyes, aligned with Satan. God promises to humble adversaries and publicly affirm His love for His faithful people, demonstrating His unwavering commitment to His church and His ultimate triumph over all opposition.'),
  (10,
   'Because thou hast kept the word of my patience, I also will keep thee from the hour of temptation, which shall come upon all the world, to try them that dwell upon the earth.',
   'Ὅτι ἐτήρησας τὸν λόγον τῆς ὑπομονῆς μου, κἀγώ σε τηρήσω ἐκ τῆς ὥρας τοῦ πειρασμοῦ τῆς μελλούσης ἔρχεσθαι ἐπὶ τῆς οἰκουμένης ὅλης, πειράσαι τοὺς κατοικοῦντας ἐπὶ τῆς γῆς.',
   'Hoti etērēsas ton logon tēs hypomonēs mou, kagō se tērēsō ek tēs hōras tou peirasmou tēs mellousēs erchesthai epi tēs oikoumenēs holēs, peirasai tous katoikountas epi tēs gēs.',
   'The Philadelphian church is commended for keeping Christ''s ''word of patience'' (τὸν λόγον τῆς ὑπομονῆς μου), referring to their steadfast endurance in faith. In return, Christ promises to ''keep'' them ''from the hour of temptation'' (ἐκ τῆς ὥρας τοῦ πειρασμοῦ). This ''hour'' is a future, global trial designed to test ''those who dwell upon the earth'' (a common phrase in Revelation for unbelievers). The phrase ''keep from'' (τηρήσω ἐκ) is debated, but often interpreted as preservation through or deliverance out of, rather than removal from, the trial itself, though some see it as pre-tribulation rapture. It signifies divine protection during a period of intense testing.',
   'This verse is a cornerstone for eschatological discussions, particularly regarding the timing of the rapture and the Great Tribulation. It promises divine preservation for the faithful during a future global trial. The ''word of patience'' emphasizes the importance of enduring faith. God''s promise to ''keep'' His church signifies His protective care and faithfulness to those who remain steadfast in their commitment to Him.'),
  (11,
   'Behold, I come quickly: hold that fast which thou hast, that no man take thy crown.',
   'Ἔρχομαι ταχύ· κράτει ὃ ἔχεις, ἵνα μηδεὶς λάβῃ τὸν στέφανόν σου.',
   'Erchomai tachy; kratei ho echeis, hina mēdeis labē ton stephanon sou.',
   'Christ''s declaration ''I come quickly'' (ἔρχομαι ταχύ) is a recurring theme in Revelation, emphasizing the imminence and suddenness of His return. This serves as both a warning and an encouragement. The exhortation to ''hold fast what you have'' (κράτει ὃ ἔχεις) urges perseverance in their current faithfulness, lest they lose their ''crown'' (στέφανόν), which symbolizes their reward, honor, or position of victory (cf. 1 Cor 9:25; 2 Tim 4:8; Jas 1:12). This implies that rewards can be forfeited through unfaithfulness.',
   'This verse highlights the imminence of Christ''s return and the call to steadfast perseverance. It teaches that believers must actively ''hold fast'' to their faith and spiritual gains to secure their eternal rewards. The concept of a ''crown'' that can be lost underscores the importance of ongoing faithfulness and the potential for forfeiture of specific honors, though not salvation itself, through spiritual negligence.'),
  (12,
   'Him that overcometh will I make a pillar in the temple of my God, and he shall go no more out: and I will write upon him the name of my God, and the name of the city of my God, which is new Jerusalem, which cometh down out of heaven from my God: and I will write upon him my new name.',
   'Ὁ νικῶν ποιήσω αὐτὸν στῦλον ἐν τῷ ναῷ τοῦ Θεοῦ μου, καὶ ἔξω οὐ μὴ ἐξέλθῃ ἔτι, καὶ γράψω ἐπ’ αὐτὸν τὸ ὄνομα τοῦ Θεοῦ μου καὶ τὸ ὄνομα τῆς πόλεως τοῦ Θεοῦ μου, τῆς καινῆς Ἱερουσαλήμ, ἡ καταβαίνουσα ἐκ τοῦ οὐρανοῦ ἀπὸ τοῦ Θεοῦ μου, καὶ τὸ ὄνομά μου τὸ καινόν.',
   'Ho nikōn poiēsō auton stylon en tō naō tou Theou mou, kai exō ou mē exelthē eti, kai grapsō ep’ auton to onoma tou Theou mou kai to onoma tēs poleōs tou Theou mou, tēs kainēs Hierousalēm, hē katabainousa ek tou ouranou apo tou Theou mou, kai to onoma mou to kainon.',
   'The overcomer in Philadelphia is promised to become a ''pillar in the temple of my God,'' symbolizing permanence, stability, and an honored place in God''s eternal presence (cf. Gal 2:9). They will ''go no more out,'' signifying eternal security and fellowship. Three names will be written upon them: God''s name, the name of the ''new Jerusalem'' (Rev 21:2, 10), and Christ''s ''new name.'' This signifies complete identification with God, His eternal city, and Christ Himself, granting them full citizenship and belonging in the divine realm.',
   'This verse offers profound promises of eternal security, identity, and belonging for the faithful. Being a ''pillar in the temple'' signifies an enduring, honored place in God''s presence. The writing of divine names upon the overcomer symbolizes complete identification with God, His eternal city, and Christ, assuring an unbreakable, intimate relationship and full citizenship in the new creation.'),
  (13,
   'He that hath an ear, let him hear what the Spirit saith unto the churches.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais.',
   'This is the standard concluding exhortation, urging all who have spiritual ears to listen and understand the message delivered by the Holy Spirit. It reinforces that the specific messages to each church carry universal truths and applications for the broader body of Christ.',
   NULL),
  (14,
   'And unto the angel of the church of the Laodiceans write; These things saith the Amen, the faithful and true witness, the beginning of the creation of God;',
   'Καὶ τῷ ἀγγέλῳ τῆς ἐν Λαοδικείᾳ ἐκκλησίας γράψον· Τάδε λέγει ὁ Ἀμήν, ὁ μάρτυς ὁ πιστὸς καὶ ἀληθινός, ἡ ἀρχὴ τῆς κτίσεως τοῦ Θεοῦ.',
   'Kai tō angelō tēs en Laodikeiā ekklēsias grapson; Tade legei ho Amēn, ho martys ho pistos kai alēthinos, hē archē tēs ktiseōs tou Theou.',
   'Laodicea was a wealthy city, known for its banking, wool industry, and eye salve, but it receives the harshest rebuke. Christ introduces Himself with titles emphasizing His absolute truth and authority: ''the Amen'' (ὁ Ἀμήν), signifying His divine affirmation and faithfulness (cf. 2 Cor 1:20); ''the faithful and true witness'' (ὁ μάρτυς ὁ πιστὸς καὶ ἀληθινός), highlighting His perfect testimony (cf. Rev 1:5); and ''the beginning of the creation of God'' (ἡ ἀρχὴ τῆς κτίσεως τοῦ Θεοῦ). This last title asserts Christ''s pre-existence and active role as the source and origin of all creation, not merely the first created being (cf. Col 1:15-17; John 1:3).',
   'This verse presents profound Christological affirmations. Christ as ''the Amen'' signifies His divine certainty and faithfulness. As ''the faithful and true witness,'' He perfectly reveals God''s truth. ''The beginning of the creation of God'' asserts His eternal pre-existence and active role as the uncreated source and ruler of all creation, affirming His full deity and authority over all things.'),
  (15,
   'I know thy works, that thou art neither cold nor hot: I would thou wert cold or hot.',
   'Οἶδά σου τὰ ἔργα, ὅτι οὔτε ψυχρὸς εἶ οὔτε ζεστός· ὄφελον ψυχρὸς ἦς ἢ ζεστός.',
   'Oida sou ta erga, hoti oute psychros ei oute zestos; ophelon psychros ēs ē zestos.',
   'Laodicea''s problem was not outright hostility to Christ, but spiritual apathy. The city was famous for its lukewarm water, piped from distant hot springs (Hierapolis) and cold springs (Colossae), arriving tepid and unpalatable. Christ uses this local imagery to describe their spiritual state: neither ''cold'' (ψυχρὸς, refreshing or utterly indifferent) nor ''hot'' (ζεστός, zealous and fervent). He wishes they were one or the other, as either extreme is preferable to their indifferent, ineffective lukewarmness.',
   'This verse powerfully condemns spiritual apathy and indifference. Christ''s preference for ''cold or hot'' over ''lukewarm'' illustrates that a clear stance, even one of outright rejection (cold), is less offensive than a hypocritical, ineffective, or half-hearted commitment. It highlights the danger of spiritual complacency and the necessity of fervent devotion in faith.'),
  (16,
   'So then because thou art lukewarm, and neither cold nor hot, I will spue thee out of my mouth.',
   'Οὕτως ὅτι χλιαρὸς εἶ, καὶ οὔτε ζεστὸς οὔτε ψυχρός, μέλλω σε ἐμέσαι ἐκ τοῦ στόματός μου.',
   'Houtōs hoti chliaros ei, kai oute zestos oute psychros, mellō se emesai ek tou stomatos mou.',
   'The consequence of Laodicea''s lukewarmness is severe: Christ declares, ''I will spue thee out of my mouth'' (μέλλω σε ἐμέσαι ἐκ τοῦ στόματός μου). This vivid and visceral imagery conveys utter rejection and disgust. Just as lukewarm water is nauseating and causes vomiting, so too is spiritual indifference repugnant to Christ. This is a strong warning against nominal Christianity and a lack of genuine commitment, indicating that such a state is intolerable to the Lord.',
   'This verse delivers a stark warning against spiritual lukewarmness, depicting it as utterly repulsive to Christ. The imagery of being ''spued out'' signifies a complete rejection and removal from Christ''s intimate fellowship and favor. It underscores that a superficial or indifferent faith is unacceptable to God and will ultimately lead to divine judgment, emphasizing the need for wholehearted devotion.'),
  (17,
   'Because thou sayest, I am rich, and increased with goods, and have need of nothing; and knowest not that thou art wretched, and miserable, and poor, and blind, and naked:',
   'Ὅτι λέγεις· ὅτι πλούσιός εἰμι καὶ πεπλούτηκα καὶ οὐδενὸς χρείαν ἔχω, καὶ οὐκ οἶδας ὅτι σὺ εἶ ὁ ταλαίπωρος καὶ ἐλεεινὸς καὶ πτωχὸς καὶ τυφλὸς καὶ γυμνός.',
   'Hoti legeis; hoti plousios eimi kai peploutēka kai oudenos chreian echō, kai ouk oidas hoti sy ei ho talaipōros kai eleeinos kai ptōchos kai typhlos kai gymnos.',
   'Laodicea''s self-deception was rooted in its material wealth. The city was rich, but spiritually, it was impoverished. They boasted, ''I am rich, and increased with goods, and have need of nothing,'' yet Christ exposes their true condition: ''wretched, and miserable, and poor, and blind, and naked.'' This stark contrast highlights the danger of confusing material prosperity with spiritual well-being. Their spiritual ''blindness'' prevented them from seeing their true ''nakedness'' (shame, lack of righteousness) and ''poverty'' before God (cf. Hos 12:8; Isa 56:10).',
   'This verse exposes the profound danger of spiritual self-deception, particularly when fueled by material prosperity. It teaches that outward wealth can mask severe spiritual poverty, blindness, and nakedness in God''s eyes. True spiritual assessment comes from Christ, not from human perception or material possessions, emphasizing the need for humility and a clear understanding of one''s spiritual state.'),
  (18,
   'I counsel thee to buy of me gold tried in the fire, that thou mayest be rich; and white raiment, that thou mayest be clothed, and that the shame of thy nakedness do not appear; and anoint thine eyes with eyesalve, that thou mayest see.',
   'Συμβουλεύω σοι ἀγοράσαι παρ’ ἐμοῦ χρυσίον πεπυρωμένον ἐκ πυρός, ἵνα πλουτήσῃς, καὶ ἱμάτια λευκὰ ἵνα περιβάλῃ καὶ μὴ φανερωθῇ ἡ αἰσχύνη τῆς γυμνότητός σου, καὶ κολλύριον ἐγχρῖσαι τοὺς ὀφθαλμούς σου, ἵνα βλέπῃς.',
   'Symbouleuō soi agorasai par’ emou chrysion pepyrōmenon ek pyros, hina ploutēsēs, kai himatia leuka hina peribalē kai mē phanerōthē hē aischynē tēs gymnotētos sou, kai kollyrion enchrisai tous ophthalmous sou, hina blepēs.',
   'Despite the harsh rebuke, Christ offers a path to restoration. He counsels them to ''buy'' from Him three things, using imagery that counters their perceived strengths: ''gold tried in the fire'' (χρυσίον πεπυρωμένον ἐκ πυρός) for true spiritual wealth (cf. 1 Pet 1:7); ''white raiment'' (ἱμάτια λευκὰ) for righteousness and to cover their spiritual nakedness (cf. Rev 7:13-14); and ''eyesalve'' (κολλύριον) to heal their spiritual blindness (cf. John 9:6-7). This ''buying'' is not with money, but with repentance and faith, receiving God''s grace.',
   'This verse beautifully illustrates God''s grace and redemptive offer even in severe judgment. Christ provides the remedy for every spiritual deficiency: true spiritual wealth (faith refined by trial), righteousness (white garments), and spiritual discernment (eyesalve). It emphasizes that these essential spiritual provisions can only be ''bought'' from Christ through repentance and faith, not earned or acquired by human means.'),
  (19,
   'As many as I love, I rebuke and chasten: be zealous therefore, and repent.',
   'Ἐγὼ ὅσους ἐὰν φιλῶ, ἐλέγχω καὶ παιδεύω· ζήλευε οὖν καὶ μετανόησον.',
   'Egō hosous ean philō, elenchō kai paideuō; zēleue oun kai metanoēson.',
   'Christ reassures Laodicea that His severe rebuke is an act of love, not rejection. ''As many as I love, I rebuke and chasten'' (ἐλέγχω καὶ παιδεύω), a principle found in Proverbs 3:11-12 and Hebrews 12:5-6. This divine discipline is intended for their good, to bring about repentance and spiritual growth. The command ''be zealous therefore, and repent'' (ζήλευε οὖν καὶ μετανόησον) calls them to abandon their lukewarmness for fervent devotion and a change of heart and direction.',
   'This verse reveals the loving nature of divine discipline. Christ''s rebukes and chastening are expressions of His love, aimed at correction and restoration, not condemnation. It teaches that true love from God involves confronting sin and calling for repentance, emphasizing the transformative power of zeal and a genuine change of heart in response to divine correction.'),
  (20,
   'Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him, and will sup with him, and he with me.',
   'Ἰδοὺ ἕστηκα ἐπὶ τὴν θύραν καὶ κρούω· ἐάν τις ἀκούσῃ τῆς φωνῆς μου καὶ ἀνοίξῃ τὴν θύραν, εἰσελεύσομαι πρὸς αὐτὸν καὶ δειπνήσω μετ’ αὐτοῦ, καὶ αὐτὸς μετ’ ἐμοῦ.',
   'Idou hestēka epi tēn thyran kai krouō; ean tis akousē tēs phōnēs mou kai anoixē tēn thyran, eiseleusomai pros auton kai deipnēsō met’ autou, kai autos met’ emou.',
   'This iconic verse portrays Christ standing ''at the door, and knock[ing]'' (ἕστηκα ἐπὶ τὴν θύραν καὶ κρούω). While addressed to the church as a whole, the invitation is personal: ''if any man hear my voice and open the door.'' This signifies Christ''s desire for intimate fellowship (δειπνήσω μετ’ αὐτοῦ, ''I will sup with him'') with individuals within the lukewarm church. It is an offer of renewed communion, a shared meal symbolizing deep relationship and reconciliation (cf. Song of Sol 5:2; Luke 12:36; John 14:23).',
   'This verse beautifully illustrates Christ''s persistent grace and personal invitation for fellowship. Despite the church''s lukewarmness, Christ stands outside, knocking, demonstrating His respect for human free will and His desire for intimate communion. It teaches that salvation and deep relationship with Christ are available to anyone who responds to His call, emphasizing the personal nature of faith and the joy of fellowship with the Savior.'),
  (21,
   'To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne.',
   'Ὁ νικῶν δώσω αὐτῷ καθίσαι μετ’ ἐμοῦ ἐν τῷ θρόνῳ μου, ὡς κἀγὼ ἐνίκησα καὶ ἐκάθισα μετὰ τοῦ Πατρός μου ἐν τῷ θρόνῳ αὐτοῦ.',
   'Ho nikōn dōsō autō kathisai met’ emou en tō thronō mou, hōs kagō enikēsa kai ekathisa meta tou Patros mou en tō thronō autou.',
   'The ultimate promise to the overcomer in Laodicea is the highest offered in Revelation: to ''sit with me in my throne'' (καθίσαι μετ’ ἐμοῦ ἐν τῷ θρόνῳ μου). This signifies sharing in Christ''s authority, reign, and glory (cf. Matt 19:28; Luke 22:30; Rev 2:26-27). Christ grounds this promise in His own experience, having ''overcome'' and now sitting with His Father on His throne. This incredible privilege is offered to those who overcome spiritual apathy and self-deception, demonstrating the immense reward for genuine repentance and faithfulness.',
   'This verse offers the pinnacle of eschatological promises: co-reigning with Christ. It teaches that faithful believers will share in Christ''s divine authority and glory, a privilege earned through overcoming the world, just as Christ overcame. This promise underscores the profound dignity and destiny awaiting those who persevere in faith, emphasizing the ultimate triumph and exaltation of the redeemed.'),
  (22,
   'He that hath an ear, let him hear what the Spirit saith unto the churches.',
   'Ὁ ἔχων οὖς ἀκουσάτω τί τὸ Πνεῦμα λέγει ταῖς ἐκκλησίαις.',
   'Ho echōn ous akousatō ti to Pneuma legei tais ekklēsiais.',
   'This final concluding exhortation for the chapter serves as a powerful reminder that the messages to these specific churches are not isolated but are meant for the entire body of Christ. It calls for spiritual attentiveness and application of these divine truths to one''s own life and church context.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔργα', 'erga', 'G2041', 'From a primary verb ''ergō'' (to work); ''works'' or ''deeds.'' In the New Testament, it refers to actions, accomplishments, or behavior, often reflecting one''s inner character or faith. Here, it signifies the outward manifestations of the Sardian church''s spiritual state, which Christ found lacking despite their reputation.', 1),
  ('ὄνομα', 'onoma', 'G3686', 'From a root ''on'' (to name); ''name,'' ''reputation,'' ''authority.'' In this context, it refers to the Sardian church''s public perception or reputation for being spiritually alive. It highlights the discrepancy between outward appearance and inner reality, a common theme in biblical critiques of hypocrisy.', 2),
  ('ζῇς', 'zēs', 'G2198', 'Second person singular present active indicative of ''ζάω'' (zaō), ''to live,'' ''to be alive.'' Here, it refers to the perceived vitality or spiritual life of the Sardian church. The contrast with ''νεκρός'' (nekros, dead) emphasizes the deceptive nature of their reputation versus their actual spiritual condition.', 3),
  ('νεκρός', 'nekros', 'G3498', 'From ''νέκυς'' (nekys, a corpse); ''dead,'' ''lifeless.'' In a spiritual sense, it denotes separation from God, spiritual insensitivity, or a lack of divine life. For Sardis, it means their spiritual state was one of profound inactivity and unresponsiveness to God, despite outward appearances.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νικῶν', 'nikōn', 'G3528', 'Present active participle of ''νικάω'' (nikaō), ''to conquer,'' ''to overcome,'' ''to prevail.'' This term is central to Revelation, referring to those who maintain their faith and obedience despite persecution, temptation, or spiritual compromise. It signifies spiritual victory through Christ.', 1),
  ('ἐξαλείψω', 'exaleipsō', 'G1813', 'From ''ἐκ'' (ek, out) and ''ἀλείφω'' (aleiphō, to anoint, wipe); ''to wipe out,'' ''to erase,'' ''to blot out.'' Here, it refers to the act of removing a name from the ''book of life,'' signifying a loss of eternal salvation. Christ''s promise is that He will *not* do this for the overcomer, assuring their eternal security.', 2),
  ('βίβλου', 'biblou', 'G976', 'From ''βύβλος'' (byblos, papyrus); ''book,'' ''scroll.'' In this context, it refers to the ''book of life,'' a divine register of those chosen for eternal life. It symbolizes God''s sovereign knowledge and record of His redeemed people, a concept found throughout Scripture.', 3),
  ('ζωῆς', 'zōēs', 'G2222', 'From ''ζάω'' (zaō, to live); ''life,'' ''existence.'' In the New Testament, it often refers to spiritual, eternal life, which is a gift from God through Christ. The ''book of life'' is thus the book of eternal life, signifying inclusion in God''s eternal kingdom.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 5;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἅγιος', 'hagios', 'G40', 'From ''ἅγος'' (hagos, awe); ''holy,'' ''sacred,'' ''set apart.'' It describes God''s absolute purity, moral perfection, and distinctness from all creation. Applied to Christ, it affirms His divine nature and perfect righteousness, making Him the ultimate standard of holiness.', 1),
  ('ἀληθινός', 'alēthinos', 'G228', 'From ''ἀληθής'' (alēthēs, true); ''true,'' ''genuine,'' ''real,'' ''authentic.'' It denotes not merely factual truth, but essential truth and reality. Christ as ''the True One'' signifies that He is the ultimate reality and embodiment of truth, in contrast to all that is false or merely apparent.', 2),
  ('κλεῖν', 'klein', 'G2807', 'From ''κλείω'' (kleiō, to shut); ''key.'' Symbolically, a key represents authority, power, and access. ''The key of David'' refers to Christ''s messianic authority over the kingdom of God, enabling Him to open doors of opportunity and access to salvation, and to close them.', 3),
  ('ἀνοίγων', 'anoigōn', 'G455', 'Present active participle of ''ἀνοίγω'' (anoigō), ''to open.'' Here, it refers to Christ''s sovereign power to open doors, whether for evangelistic opportunities, access to God, or entrance into His kingdom. No one can reverse what He opens, emphasizing His ultimate control.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 7;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τήρησας', 'tērēsas', 'G5083', 'Aorist active indicative of ''τηρέω'' (tēreō), ''to keep,'' ''to guard,'' ''to observe.'' It implies careful and diligent adherence. Here, it refers to the Philadelphian church''s faithful observance and steadfast preservation of Christ''s word, particularly in the face of trials.', 1),
  ('ὑπομονῆς', 'hypomonēs', 'G5281', 'From ''ὑπομένω'' (hypomenō, to remain under); ''patience,'' ''endurance,'' ''perseverance.'' It signifies a steadfast waiting and remaining firm under pressure, not a passive resignation but an active, hopeful endurance. ''Word of patience'' refers to the message that calls for and enables such endurance.', 2),
  ('πειρασμοῦ', 'peirasmou', 'G3986', 'From ''πειράζω'' (peirazō, to test, tempt); ''temptation,'' ''trial,'' ''testing.'' It refers to a period of intense testing or tribulation. The ''hour of temptation'' is a specific, future global event designed to test humanity, particularly those who reject God.', 3),
  ('οἰκουμένης', 'oikoumenēs', 'G3625', 'Feminine singular genitive of ''οἰκουμένη'' (oikoumenē), ''the inhabited earth,'' ''the world.'' In Revelation, it often refers to the entire global population, particularly those who are hostile to God. The ''hour of temptation'' is thus a universal trial affecting all inhabitants of the earth.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 14
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἀμήν', 'Amēn', 'G281', 'A Hebrew transliteration meaning ''truly,'' ''so be it,'' ''faithful.'' When used as a title for Christ, it signifies His absolute truthfulness, faithfulness, and divine authority. He is the ultimate affirmation of God''s promises and purposes, the ''Yes'' to all of God''s promises (2 Cor 1:20).', 1),
  ('μάρτυς', 'martys', 'G3144', 'From ''μνάομαι'' (mnaomai, to remember); ''witness,'' ''testifier.'' Christ is the ''faithful and true witness'' because He perfectly reveals God''s character and truth, bearing an unwavering testimony to divine reality, even to the point of death (Rev 1:5).', 2),
  ('ἀρχὴ', 'archē', 'G746', 'From ''ἄρχω'' (archō, to begin, rule); ''beginning,'' ''origin,'' ''ruler,'' ''first cause.'' Applied to Christ as ''the beginning of the creation of God,'' it asserts His pre-existence and active role as the source and originator of all creation, not merely the first created being (Col 1:15-17).', 3),
  ('κτίσεως', 'ktiseōs', 'G2937', 'From ''κτίζω'' (ktizō, to create); ''creation,'' ''creature,'' ''foundation.'' Here, it refers to the entire created order. Christ being the ''beginning of the creation'' means He is the active agent and ultimate source from which all creation originates, underscoring His divine power and role as Creator.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 14;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χλιαρός', 'chliaros', 'G5513', 'From ''χλιαίνω'' (chliainō, to warm); ''lukewarm,'' ''tepid.'' This term describes a state of spiritual indifference, neither zealous (''hot'') nor completely cold (either refreshing or utterly hostile). It signifies a lack of fervent commitment and spiritual vitality, which Christ finds repulsive.', 1),
  ('ἐμέσαι', 'emesai', 'G1692', 'Aorist active infinitive of ''ἐμέω'' (emeō), ''to vomit,'' ''to spew out.'' This vivid and strong imagery conveys utter disgust and rejection. Christ''s declaration to ''spue thee out of my mouth'' signifies His complete repudiation of the Laodicean church''s spiritual apathy and ineffectiveness.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Verse 21
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νικῶν', 'nikōn', 'G3528', 'Present active participle of ''νικάω'' (nikaō), ''to conquer,'' ''to overcome.'' In the context of Laodicea, it refers to overcoming spiritual apathy, self-deception, and lukewarmness, turning to fervent repentance and faith. This victory leads to the highest promised reward.', 1),
  ('δώσω', 'dōsō', 'G1325', 'Future active indicative of ''δίδωμι'' (didōmi), ''to give,'' ''to grant.'' It signifies a divine bestowal or gracious gift. The promise to ''give'' the overcomer a place on Christ''s throne highlights the sovereign and gracious nature of this ultimate reward, not earned but granted by Christ.', 2),
  ('θρόνῳ', 'thronō', 'G2362', 'From ''θράω'' (thraō, to sit); ''throne,'' ''seat of authority.'' It symbolizes kingship, power, and sovereign rule. To ''sit with me in my throne'' signifies sharing in Christ''s divine authority, reign, and glory, an unparalleled privilege for the faithful overcomer.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = 21;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Revelation 1:4', 1),
  (1, 'Revelation 1:16', 2),
  (1, 'Revelation 1:20', 3),
  (1, 'Revelation 5:6', 4),
  (2, 'Matthew 24:42', 1),
  (2, '1 Corinthians 16:13', 2),
  (2, 'Colossians 1:10', 3),
  (2, 'Hebrews 6:11', 4),
  (3, 'Matthew 24:43-44', 1),
  (3, '1 Thessalonians 5:2', 2),
  (3, '2 Peter 3:10', 3),
  (3, 'Luke 12:39-40', 4),
  (4, 'Revelation 7:9', 1),
  (4, 'Revelation 7:13-14', 2),
  (4, 'Jude 1:23', 3),
  (4, 'Zechariah 3:3-5', 4),
  (5, 'Revelation 7:9', 1),
  (5, 'Revelation 13:8', 2),
  (5, 'Revelation 20:12', 3),
  (5, 'Matthew 10:32', 4),
  (5, 'Luke 12:8', 5),
  (7, 'Isaiah 22:22', 1),
  (7, 'Matthew 16:19', 2),
  (7, 'Revelation 1:5', 3),
  (7, 'John 14:6', 4),
  (8, '1 Corinthians 16:9', 1),
  (8, '2 Corinthians 2:12', 2),
  (8, 'Colossians 4:3', 3),
  (8, 'Acts 14:27', 4),
  (9, 'Revelation 2:9', 1),
  (9, 'Isaiah 49:23', 2),
  (9, 'Isaiah 60:14', 3),
  (9, 'Romans 2:28-29', 4),
  (10, 'Luke 21:35', 1),
  (10, '2 Peter 2:9', 2),
  (10, 'Isaiah 24:17', 3),
  (10, 'Matthew 24:21', 4),
  (11, 'Revelation 22:7', 1),
  (11, 'Revelation 22:12', 2),
  (11, '1 Corinthians 9:25', 3),
  (11, '2 Timothy 4:8', 4),
  (11, 'James 1:12', 5),
  (12, 'Galatians 2:9', 1),
  (12, 'Revelation 21:2', 2),
  (12, 'Revelation 21:10', 3),
  (12, 'Isaiah 62:2', 4),
  (14, '2 Corinthians 1:20', 1),
  (14, 'Revelation 1:5', 2),
  (14, 'Colossians 1:15-17', 3),
  (14, 'John 1:3', 4),
  (15, 'Titus 1:16', 1),
  (15, '2 Timothy 3:5', 2),
  (15, 'Matthew 12:30', 3),
  (17, 'Hosea 12:8', 1),
  (17, 'Isaiah 56:10', 2),
  (17, '2 Corinthians 8:9', 3),
  (17, 'Matthew 23:27-28', 4),
  (18, '1 Peter 1:7', 1),
  (18, 'Isaiah 55:1', 2),
  (18, 'Revelation 7:13', 3),
  (18, 'John 9:6-7', 4),
  (19, 'Proverbs 3:11-12', 1),
  (19, 'Hebrews 12:5-6', 2),
  (19, 'James 1:12', 3),
  (19, '2 Corinthians 7:10', 4),
  (20, 'Song of Solomon 5:2', 1),
  (20, 'Luke 12:36', 2),
  (20, 'John 14:23', 3),
  (20, 'Matthew 25:31-40', 4),
  (21, 'Matthew 19:28', 1),
  (21, 'Luke 22:30', 2),
  (21, 'Revelation 2:26-27', 3),
  (21, 'Romans 8:17', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 3 Complete!
-- 22 verses · 7 key verses with word studies (25 words)
-- Cross-references for 18 verses (73 refs)
-- ═══════════════════════════════════════════════════════