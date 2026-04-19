-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 1 — Jesus' Ascension, Promise of the Spirit, and Apostolic Preparation
-- 26 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Acts chapter 1 serves as the crucial bridge between the Gospels and the nascent Church, detailing the final instructions of the resurrected Jesus, his ascension, and the apostles'' preparation for the coming Holy Spirit. Luke, the author, reaffirms his prior work (the Gospel of Luke) and establishes the foundational narrative for the Church''s mission. The chapter meticulously records Jesus'' post-resurrection appearances over forty days, during which he provided "many infallible proofs" of his living reality and taught extensively about "the kingdom of God." This period was vital for solidifying the apostles'' understanding and faith. The narrative then pivots to the dramatic event of Jesus'' ascension into heaven, witnessed by the apostles, and the subsequent angelic promise of his return. Crucially, Jesus commands his disciples to wait in Jerusalem for the "promise of the Father"—the baptism with the Holy Spirit—which would empower them to be his "witnesses unto the uttermost part of the earth." The chapter culminates in the practical steps taken by the early community, under Peter''s leadership, to restore the apostolic number of twelve through the selection of Matthias to replace Judas Iscariot, ensuring the structural integrity of the apostolic witness before the outpouring of the Spirit at Pentecost. This entire chapter meticulously sets the stage for the explosive growth and global spread of Christianity, emphasizing divine continuity, apostolic authority, and the indispensable role of the Holy Spirit.',
  'Jesus'' Ascension, Promise of the Spirit, and Apostolic Preparation',
  'μάρτυρες (martyres)',
  'From μάρτυς (martys), meaning "witness." In the New Testament, it signifies one who testifies to what they have seen or heard, particularly concerning Jesus'' life, death, and resurrection. The term evolves to include those who suffer or die for their testimony (martyrdom), but in Acts 1:8, it primarily denotes those commissioned to proclaim the gospel based on their direct experience with Christ.',
  '["Section 1 (vv.1-5): The Prologue and Jesus'' Final Instructions","Section 2 (vv.6-8): The Kingdom Question and the Promise of Power","Section 3 (vv.9-11): The Ascension of Jesus","Section 4 (vv.12-14): The Apostles'' Return to Jerusalem and Prayer","Section 5 (vv.15-20): Peter''s Address and the Fate of Judas","Section 6 (vv.21-26): The Selection of Matthias"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 26 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'The former treatise have I made, O Theophilus, of all that Jesus began both to do and teach,',
   'Τὸν μὲν πρῶτον λόγον ἐποιησάμην περὶ πάντων, ὦ Θεόφιλε, ὧν ἤρξατο ὁ Ἰησοῦς ποιεῖν τε καὶ διδάσκειν,',
   'Ton men prōton logon epoiēsamēn peri pantōn, ō Theophile, hōn ērxato ho Iēsous poiein te kai didaskein,',
   'Luke begins Acts by referencing his "former treatise," the Gospel of Luke, addressed to Theophilus. This establishes continuity between the two works, presenting them as a single narrative of God''s redemptive plan. The phrase "all that Jesus began both to do and teach" encapsulates the scope of Jesus'' earthly ministry, emphasizing both his actions and his words as foundational to the Christian faith. Theophilus, meaning "lover of God," was likely a patron or a high-ranking official for whom Luke wrote, or a symbolic address to all believers.',
   NULL),
  (2,
   'Until the day in which he was taken up, after that he through the Holy Ghost had given commandments unto the apostles whom he had chosen:',
   'ἄχρι ἧς ἡμέρας ἐντειλάμενος τοῖς ἀποστόλοις διὰ Πνεύματος Ἁγίου οὓς ἐξελέξατο ἀνελήφθη·',
   'achri hēs hēmeras enteilamenos tois apostolois dia Pneumatos Hagiou hous exelexato anelēphthē;',
   'This verse marks the transition from Jesus'' earthly ministry to his ascension. It highlights Jesus'' continued authority even after his resurrection, as he gives commandments to his chosen apostles "through the Holy Ghost." This phrase suggests that Jesus'' post-resurrection instructions were divinely inspired, preparing the apostles for their future mission. The term "ἀνελήφθη" (anelēphthē), "he was taken up," foreshadows the detailed account of the ascension in verse 9, emphasizing the divine nature of the event.',
   'This verse underscores the divine authority of Jesus'' final instructions to His apostles, given through the Holy Spirit. It establishes the continuity of divine guidance from Jesus'' earthly ministry to the nascent church, emphasizing the Holy Spirit''s role in empowering and directing the apostles for their mission.'),
  (3,
   'To whom also he shewed himself alive after his passion by many infallible proofs, being seen of them forty days, and speaking of the things pertaining to the kingdom of God:',
   'οἷς καὶ μετὰ τὸ παθεῖν αὐτὸν παρέστησεν ἑαυτὸν ζῶντα ἐν πολλοῖς τεκμηρίοις, δι’ ἡμερῶν τεσσεράκοντα ὀπτανόμενος αὐτοῖς καὶ λέγων τὰ περὶ τῆς βασιλείας τοῦ Θεοῦ.',
   'hois kai meta to pathein auton parestēsen heauton zōnta en pollois tekmēriois, di'' hēmerōn tesserakonta optanomenos autois kai legōn ta peri tēs basileias tou Theou.',
   'Luke emphasizes the certainty of Jesus'' resurrection by stating he "shewed himself alive after his passion by many infallible proofs." The Greek "τεκμηρίοις" (tekmēriois) refers to undeniable evidence, not just signs. The forty-day period allowed for extensive teaching about "the kingdom of God," a central theme in both Luke''s Gospel and Acts. This period was crucial for solidifying the apostles'' faith and preparing them for their mission (1 Cor 15:3-8), ensuring their readiness to proclaim the gospel.',
   'This verse affirms the historical reality of Jesus'' resurrection through "many infallible proofs" over forty days. It highlights the foundational truth of Christianity—Christ''s victory over death—and His continued teaching on the "kingdom of God," which is central to understanding God''s redemptive plan and the Church''s mission.'),
  (4,
   'And, being assembled together with them, commanded them that they should not depart from Jerusalem, but wait for the promise of the Father, which, saith he, ye have heard of me.',
   'Καὶ συναλιζόμενος παρήγγειλεν αὐτοῖς ἀπὸ Ἱεροσολύμων μὴ χωρίζεσθαι, ἀλλὰ περιμένειν τὴν ἐπαγγελίαν τοῦ Πατρὸς ἣν ἠκούσατέ μου·',
   'Kai synalizomenos parēngeilen autois apo Hierosolymōn mē chōrizesthai, alla perimenein tēn epangelian tou Patros hēn ēkousate mou;',
   'Jesus commands his disciples not to leave Jerusalem but to "wait for the promise of the Father." This promise refers to the outpouring of the Holy Spirit, which Jesus had previously spoken about (Luke 24:49; John 14:16-17). Jerusalem, as the place of Jesus'' death and resurrection, was to be the starting point for the gospel''s spread. The waiting period emphasized dependence on divine timing and power, rather than human initiative.',
   'This command to wait for the Father''s promise underscores the necessity of divine empowerment for Christian mission. It highlights the Holy Spirit''s role as the promised gift, essential for believers to effectively witness and fulfill God''s purposes, establishing a pattern of dependence on God''s timing and provision.'),
  (5,
   'For John truly baptized with water; but ye shall be baptized with the Holy Ghost not many days hence.',
   'ὅτι Ἰωάννης μὲν ἐβάπτισεν ὕδατι, ὑμεῖς δὲ βαπτισθήσεσθε ἐν Πνεύματι Ἁγίῳ οὐ μετὰ πολλὰς ταύτας ἡμέρας.',
   'hoti Iōannēs men ebaptisen hydati, hymeis de baptisthēsesthē en Pneumati Hagiō ou meta pollas tautas hēmeras.',
   'Jesus contrasts John the Baptist''s water baptism with the coming baptism "with the Holy Ghost." John''s baptism was one of repentance, preparing the way for Christ (Matt 3:11). The baptism with the Holy Spirit, however, signifies a deeper spiritual experience of empowerment and indwelling, marking the birth of the Church at Pentecost. This promise was fulfilled just days later, as recorded in Acts chapter 2.',
   'This verse distinguishes between John''s baptism of repentance and the transformative baptism of the Holy Spirit. It points to the new covenant era where believers receive the indwelling and empowering presence of the Spirit, essential for spiritual life, witness, and participation in God''s kingdom.'),
  (6,
   'When they therefore were come together, they asked of him, saying, Lord, wilt thou at this time restore again the kingdom to Israel?',
   'Οἱ μὲν οὖν συνελθόντες ἠρώτων αὐτὸν λέγοντες, Κύριε, εἰ ἐν τῷ χρόνῳ τούτῳ ἀποκαθιστάνεις τὴν βασιλείαν τῷ Ἰσραήλ;',
   'Hoi men oun synelthontes ērōtōn auton legontes, Kyrie, ei en tō chronō toutō apokathistanēis tēn basileian tō Israēl?',
   'Despite Jesus'' teaching on the kingdom of God, the disciples still held a nationalistic and political understanding of its restoration to Israel. Their question reveals their expectation of an immediate, earthly kingdom, demonstrating their incomplete understanding of Jesus'' spiritual reign. This highlights the common human tendency to project earthly desires onto divine plans, even after significant revelation.',
   NULL),
  (7,
   'And he said unto them, It is not for you to know the times or the seasons, which the Father hath put in his own power.',
   'Εἶπεν δὲ αὐτοῖς, Οὐχ ὑμῶν ἐστιν γνῶναι χρόνους ἢ καιροὺς οὓς ὁ Πατὴρ ἔθετο ἐν τῇ ἰδίᾳ ἐξουσίᾳ·',
   'Eipen de autois, Ouch hymōn estin gnōnai chronous ē kairous hous ho Patēr etheto en tē idia exousia;',
   'Jesus gently corrects the disciples'' preoccupation with eschatological timing, stating that "It is not for you to know the times or the seasons." This emphasizes God''s sovereign control over future events and discourages speculative curiosity. The terms "χρόνους" (chronous, general time) and "καιροὺς" (kairous, specific opportune times) underscore that both the duration and the specific moments are solely within the Father''s authority (Matt 24:36).',
   'This verse teaches humility regarding divine sovereignty and eschatological timing. It reminds believers that God the Father alone holds knowledge of future events, redirecting focus from speculative curiosity to the immediate mission and dependence on God''s revealed will rather than hidden knowledge.'),
  (8,
   'But ye shall receive power, after that the Holy Ghost is come upon you: and ye shall be witnesses unto me both in Jerusalem, and in all Judaea, and in Samaria, and unto the uttermost part of the earth.',
   'ἀλλὰ λήψεσθε δύναμιν ἐπελθόντος τοῦ Ἁγίου Πνεύματος ἐφ’ ὑμᾶς, καὶ ἔσεσθέ μου μάρτυρες ἔν τε Ἱερουσαλὴμ καὶ πάσῃ τῇ Ἰουδαίᾳ καὶ Σαμαρίᾳ καὶ ἕως ἐσχάτου τῆς γῆς.',
   'alla lēpsesthe dynamin epelthontos tou Hagiou Pneumatos eph'' hymas, kai esesthe mou martyres en te Hierousalēm kai pasē tē Ioudaia kai Samaria kai heōs eschatou tēs gēs.',
   'Instead of focusing on timing, Jesus redirects their attention to their mission and the power for it. They would receive "power" (δύναμιν, dynamin) when the Holy Spirit came upon them. This empowerment was for a specific purpose: to be his "witnesses" (μάρτυρες, martyres). The geographical progression outlined—Jerusalem, Judea, Samaria, and the "uttermost part of the earth"—provides a programmatic outline for the entire book of Acts, detailing the expansion of the gospel.',
   'This is a pivotal verse, outlining the Church''s mission and the source of its empowerment. It establishes the Holy Spirit as the divine enabler for evangelism and witness, defining the global scope of the gospel message and the geographical progression of its spread, from local to universal.'),
  (9,
   'And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight.',
   'Καὶ ταῦτα εἰπὼν βλεπόντων αὐτῶν ἐπήρθη, καὶ νεφέλη ὑπέλαβεν αὐτὸν ἀπὸ τῶν ὀφθαλμῶν αὐτῶν.',
   'Kai tauta eipōn blepontōn autōn epērthē, kai nephelē hypelaben auton apo tōn ophthalmōn autōn.',
   'After giving these final instructions, Jesus was "taken up" (ἐπήρθη, epērthē) in full view of his disciples. The cloud that received him is a common biblical motif associated with divine presence and glory (Exod 13:21-22; Matt 17:5). The visible nature of the ascension was crucial for the disciples, providing undeniable proof of his departure and confirming his heavenly exaltation, a necessary precursor to his return.',
   'The ascension of Jesus is a fundamental Christian doctrine, signifying His exaltation to the right hand of God the Father. It marks the completion of His earthly redemptive work and the beginning of His heavenly intercession, preparing the way for the Holy Spirit''s outpouring and His eventual return in glory.'),
  (10,
   'And while they looked stedfastly toward heaven as he went up, behold, two men stood by them in white apparel;',
   'Καὶ ὡς ἀτενίζοντες ἦσαν εἰς τὸν οὐρανὸν πορευομένου αὐτοῦ, καὶ ἰδοὺ ἄνδρες δύο παρειστήκεισαν αὐτοῖς ἐν ἐσθῆτι λευκῇ,',
   'Kai hōs atenizontes ēsan eis ton ouranon poreuomenou autou, kai idou andres dyo pareistēkeisan autois en esthēti leukē,',
   'As the disciples gazed intently into heaven, two men in white apparel suddenly appeared. These figures are typically understood to be angels, often appearing in white to signify purity, holiness, and divine messenger status (Matt 28:2-3; John 20:12). Their sudden appearance and subsequent message serve to redirect the disciples'' focus from gazing upward to preparing for their mission and the promised return.',
   NULL),
  (11,
   'Which also said, Ye men of Galilee, why stand ye gazing up into heaven? this same Jesus, which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven.',
   'οἳ καὶ εἶπον, Ἄνδρες Γαλιλαῖοι, τί ἑστήκατε βλέποντες εἰς τὸν οὐρανόν; οὗτος ὁ Ἰησοῦς ὁ ἀναληφθεὶς ἀφ’ ὑμῶν εἰς τὸν οὐρανόν, οὕτως ἐλεύσεται ὃν τρόπον ἐθεάσασθε αὐτὸν πορευόμενον εἰς τὸν οὐρανόν.',
   'Hoi kai eipon, Andres Galilaioi, ti hestēkate blepontes eis ton ouranon? Houtos ho Iēsous ho analēphtheis aph'' hymōn eis ton ouranon, houtōs eleusetai hon tropon etheasasthe auton poreuomenon eis ton ouranon.',
   'The angels'' message provides both a gentle rebuke and a powerful promise. They question the disciples'' passive gazing, then declare that "this same Jesus" who ascended will "so come in like manner." This affirms the bodily, visible, and personal return of Christ (the Second Coming), mirroring the manner of his departure. This promise offers hope and motivation for the disciples'' future mission, knowing their Lord will return.',
   'This verse provides a clear biblical affirmation of the Second Coming of Christ. It assures believers that Jesus will return physically and visibly, just as He ascended. This doctrine is a central hope of the Christian faith, motivating perseverance and evangelism while awaiting His glorious return.'),
  (12,
   'Then returned they unto Jerusalem from the mount called Olivet, which is from Jerusalem a sabbath day’s journey.',
   'Τότε ὑπέστρεψαν εἰς Ἱερουσαλὴμ ἀπὸ ὄρους τοῦ καλουμένου Ἐλαιῶνος, ὅ ἐστιν ἐγγὺς Ἱερουσαλὴμ σαββάτου ὁδόν.',
   'Tote hypestrepsan eis Hierousalēm apo orous tou kaloumenou Elaiōnos, ho estin engys Hierousalēm sabbatou hodon.',
   'The disciples returned to Jerusalem from the Mount of Olives, the traditional site of the ascension. A "sabbath day''s journey" was a distance of approximately 2,000 cubits (around 0.6 to 0.7 miles or 1 km), the maximum distance a Jew was permitted to travel on the Sabbath according to rabbinic law. This detail highlights the historical and geographical precision of Luke''s account and the disciples'' obedience to Jesus'' command to wait in Jerusalem.',
   NULL),
  (13,
   'And when they were come in, they went up into an upper room, where abode both Peter, and James, and John, and Andrew, Philip, and Thomas, Bartholomew, and Matthew, James the son of Alphaeus, and Simon Zelotes, and Judas the brother of James.',
   'Καὶ ὅτε εἰσῆλθον, ἀνέβησαν εἰς τὸ ὑπερῷον οὗ ἦσαν καταμένοντες ὅ τε Πέτρος καὶ Ἰωάννης καὶ Ἰάκωβος καὶ Ἀνδρέας, Φίλιππος καὶ Θωμᾶς, Βαρθολομαῖος καὶ Ματθαῖος, Ἰάκωβος Ἀλφαίου καὶ Σίμων ὁ Ζηλωτὴς καὶ Ἰούδας Ἰακώβου.',
   'Kai hote eisēlthon, anebēsan eis to hyperōon hou ēsan katamenontes ho te Petros kai Iōannēs kai Iakōbos kai Andreas, Philippos kai Thōmas, Bartholomaios kai Matthaios, Iakōbos Alphaiou kai Simōn ho Zēlōtēs kai Ioudas Iakōbou.',
   'Upon returning, the apostles gathered in an "upper room" (ὑπερῷον, hyperōon), likely a large room in a private house, possibly the same one where the Last Supper was held or where they had been meeting. Luke lists the eleven remaining apostles, emphasizing the core leadership group. The absence of Judas Iscariot is notable, setting the stage for the subsequent discussion about his replacement. This gathering place became a hub for the early Christian community.',
   NULL),
  (14,
   'These all continued with one accord in prayer and supplication, with the women, and Mary the mother of Jesus, and with his brethren.',
   'Οὗτοι πάντες ἦσαν προσκαρτεροῦντες ὁμοθυμαδὸν τῇ προσευχῇ σὺν γυναιξὶν καὶ Μαριὰμ τῇ μητρὶ Ἰησοῦ καὶ σὺν τοῖς ἀδελφοῖς αὐτοῦ.',
   'Houtoi pantes ēsan proskarterountes homothymadon tē proseuchē syn gynaixin kai Mariam tē mētri Iēsou kai syn tois adelphois autou.',
   'The disciples, along with women (including Mary, Jesus'' mother) and Jesus'' brothers, "continued with one accord in prayer and supplication." This unity (ὁμοθυμαδὸν, homothymadon) and persistent prayer were crucial in preparing them for the Holy Spirit''s coming. The presence of Jesus'' brothers (who had previously doubted him, John 7:5) indicates their conversion after the resurrection, highlighting the transformative power of Christ''s victory (1 Cor 15:7).',
   'This verse highlights the importance of corporate prayer, unity, and perseverance in the early church. It demonstrates that waiting on God involves active spiritual preparation, fostering a sense of community and shared purpose essential for receiving divine empowerment and fulfilling God''s mission.'),
  (15,
   'And in those days Peter stood up in the midst of the disciples, and said, (the number of names together were about an hundred and twenty,)',
   'Καὶ ἐν ταῖς ἡμέραις ταύταις ἀναστὰς Πέτρος ἐν μέσῳ τῶν μαθητῶν εἶπεν, (ἦν τε ὄχλος ὀνομάτων ἐπὶ τὸ αὐτὸ ὡσεὶ ἑκατὸν εἴκοσι)',
   'Kai en tais hēmerais tautais anastas Petros en mesō tōn mathētōn eipen, (ēn te ochlos onomatōn epi to auto hōsei hekaton eikosi)',
   'Peter, demonstrating his emerging leadership role, stands up among the disciples. The mention of "about an hundred and twenty" names (ὄχλος ὀνομάτων, ochlos onomatōn) indicates a significant gathering of believers, forming the nucleus of the early church. This number is often seen as a symbolic representation of the twelve tribes of Israel multiplied by the ten commandments, signifying a foundational community for the new covenant.',
   NULL),
  (16,
   'Men and brethren, this scripture must needs have been fulfilled, which the Holy Ghost by the mouth of David spake before concerning Judas, which was guide to them that took Jesus.',
   'Ἄνδρες ἀδελφοί, ἔδει πληρωθῆναι τὴν γραφὴν ταύτην ἣν προεῖπεν τὸ Πνεῦμα τὸ Ἅγιον διὰ στόματος Δαυὶδ περὶ Ἰούδα τοῦ γενομένου ὁδηγοῦ τοῖς συλλαβοῦσιν Ἰησοῦν·',
   'Andres adelphoi, edei plērōthēnai tēn graphēn tautēn hēn proeipen to Pneuma to Hagion dia stomatos David peri Iouda tou genomenou hodēgou tois syllabousin Iēsoun;',
   'Peter explains that Judas''s betrayal and fate were a fulfillment of Scripture, specifically prophesied by David through the Holy Spirit. This demonstrates the early church''s conviction in the divine inspiration and authority of the Old Testament. Judas, who was a "guide" (ὁδηγοῦ, hodēgou) to those who arrested Jesus, is presented as an instrument in God''s sovereign plan, yet fully responsible for his actions.',
   'This verse highlights the divine inspiration and prophetic accuracy of Scripture, affirming that even tragic events like Judas''s betrayal were foretold by the Holy Spirit through Old Testament writers. It underscores God''s sovereignty over human actions, even sinful ones, in fulfilling His redemptive plan.'),
  (17,
   'For he was numbered with us, and had obtained part of this ministry.',
   'ὅτι κατηριθμημένος ἦν ἐν ἡμῖν καὶ ἔλαχεν τὸν κλῆρον τῆς διακονίας ταύτης.',
   'hoti katērithmēmenos ēn en hēmin kai elachen ton klēron tēs diakonias tautēs.',
   'Peter reminds the disciples that Judas was once "numbered with us" and had "obtained part of this ministry." This emphasizes Judas''s legitimate position among the apostles and his participation in their shared service (διακονίας, diakonias). His fall was not from an external position but from within the inner circle, making his betrayal all the more tragic and a stark warning about spiritual integrity.',
   NULL),
  (18,
   'Now this man purchased a field with the reward of iniquity; and falling headlong, he burst asunder in the midst, and all his bowels gushed out.',
   'Οὗτος μὲν οὖν ἐκτήσατο χωρίον ἐκ μισθοῦ τῆς ἀδικίας, καὶ πρηνὴς γενόμενος ἐλάκησεν μέσος, καὶ ἐξεχύθη πάντα τὰ σπλάγχνα αὐτοῦ.',
   'Houtos men oun ektēsato chōrion ek misthou tēs adikias, kai prēnēs genomenos elakēsen mesos, kai exechythē panta ta splanchna autou.',
   'Luke provides a vivid account of Judas''s death, which differs in detail but not in essence from Matthew''s account (Matt 27:3-10). Here, it states Judas "purchased a field with the reward of iniquity" (likely through the chief priests who bought it with his returned money) and "falling headlong, he burst asunder." This gruesome description serves as a stark consequence of his betrayal and a divine judgment, emphasizing the severity of his sin.',
   'This verse serves as a solemn warning about the destructive consequences of sin, particularly betrayal and avarice. Judas''s tragic end illustrates that even those in close proximity to Christ can fall away, facing severe judgment for their unrepentant actions and rejection of grace.'),
  (19,
   'And it was known unto all the dwellers at Jerusalem; insomuch as that field is called in their proper tongue, Aceldama, that is to say, The field of blood.',
   'καὶ γνωστὸν ἐγένετο πᾶσι τοῖς κατοικοῦσιν Ἱερουσαλήμ, ὥστε κληθῆναι τὸ χωρίον ἐκεῖνο τῇ ἰδίᾳ διαλέκτῳ αὐτῶν Ἀκελδαμά, τοῦτ’ ἔστιν Χωρίον αἵματος.',
   'kai gnōston egeneto pasi tois katoikousin Hierousalēm, hōste klēthēnai to chōrion ekeino tē idia dialektō autōn Akeldama, tout'' estin Chōrion haimatos.',
   'The notoriety of Judas''s death and the purchase of the field led to it being named "Aceldama" (Ἀκελδαμά), meaning "The field of blood" in their "proper tongue" (Aramaic). This detail confirms the public knowledge of the event in Jerusalem and underscores the lasting infamy associated with Judas''s betrayal. The name itself serves as a perpetual reminder of the price of treachery.',
   NULL),
  (20,
   'For it is written in the book of Psalms, Let his habitation be desolate, and let no man dwell therein: and his bishoprick let another take.',
   'Γέγραπται γὰρ ἐν βίβλῳ Ψαλμῶν, Γενηθήτω ἡ ἔπαυλις αὐτοῦ ἔρημος καὶ μὴ ἔστω ὁ κατοικῶν ἐν αὐτῇ, καί, Τὴν ἐπισκοπὴν αὐτοῦ λαβέτω ἕτερος.',
   'Gegraptai gar en biblō Psalmōn, Genēthētō hē epaulis autou erēmos kai mē estō ho katoikōn en autē, kai, Tēn episkopēn autou labetō heteros.',
   'Peter cites two Old Testament passages from the Psalms to justify the need for Judas''s replacement. The first, from Psalm 69:25, speaks of desolation, applying to Judas''s dwelling. The second, from Psalm 109:8, states, "his bishoprick let another take" (τὴν ἐπισκοπὴν αὐτοῦ λαβέτω ἕτερος). This term "ἐπισκοπή" (episkopē) refers to an office or oversight, directly supporting the idea of filling the vacant apostolic position. This demonstrates the early church''s reliance on Scripture for guidance.',
   'This verse illustrates the early church''s understanding of biblical prophecy and its application to contemporary events. It affirms the divine necessity of maintaining the apostolic office, demonstrating a commitment to the continuity of leadership and witness as guided by God''s Word, even in the face of betrayal.'),
  (21,
   'Wherefore of these men which have companied with us all the time that the Lord Jesus went in and out among us,',
   'δεῖ οὖν τῶν συνελθόντων ἡμῖν ἀνδρῶν ἐν παντὶ χρόνῳ ᾧ εἰσῆλθεν καὶ ἐξῆλθεν ἐφ’ ἡμᾶς ὁ Κύριος Ἰησοῦς,',
   'dei oun tōn synelthontōn hēmin andrōn en panti chronō hō eisēlthen kai exēlthen eph'' hēmas ho Kyrios Iēsous,',
   'Peter lays out the qualifications for Judas''s replacement. The candidate must be one of the men who had "companied with us all the time that the Lord Jesus went in and out among us." This emphasizes the requirement of firsthand experience with Jesus'' earthly ministry, ensuring the new apostle would be a credible witness to Jesus'' life and teachings.',
   NULL),
  (22,
   'Beginning from the baptism of John, unto that same day that he was taken up from us, must one be ordained to be a witness with us of his resurrection.',
   'ἀρξάμενος ἀπὸ τοῦ βαπτίσματος Ἰωάννου ἕως τῆς ἡμέρας ἧς ἀνελήφθη ἀφ’ ἡμῶν, μάρτυρα τῆς ἀναστάσεως αὐτοῦ γενέσθαι σὺν ἡμῖν.',
   'arxamenos apo tou baptismatos Iōannou heōs tēs hēmeras hēs anelēphthē aph'' hēmōn, martyra tēs anastaseōs autou genesthai syn hēmin.',
   'The specific timeframe for the candidate''s association with Jesus is defined: "Beginning from the baptism of John, unto that same day that he was taken up from us." This comprehensive period ensures the candidate witnessed Jesus'' public ministry, miracles, teachings, and ultimately, his resurrection and ascension. The primary role of this new apostle was to be a "witness of his resurrection" (μάρτυρα τῆς ἀναστάσεως, martyra tēs anastaseōs), the central truth of the gospel.',
   'This verse defines the core apostolic qualification: being an eyewitness to Jesus'' entire public ministry, culminating in His resurrection. It underscores the centrality of the resurrection as the foundational truth to be proclaimed, establishing the apostolic witness as rooted in historical fact and personal experience.'),
  (23,
   'And they appointed two, Joseph called Barsabas, who was surnamed Justus, and Matthias.',
   'Καὶ ἔστησαν δύο, Ἰωσὴφ τὸν καλούμενον Βαρσαββᾶν, ὃς ἐπεκλήθη Ἰοῦστος, καὶ Ματθίαν.',
   'Kai estēsan dyo, Iōsēph ton kaloumenon Barsabban, hos epeklēthē Ioustos, kai Matthian.',
   'Following Peter''s criteria, the community nominated two men: Joseph called Barsabas (surnamed Justus) and Matthias. Both were evidently well-regarded and met the stringent qualifications. The act of "appointing" (ἔστησαν, estēsan) suggests a formal nomination process by the gathered believers, indicating a communal decision-making process within the early church.',
   NULL),
  (24,
   'And they prayed, and said, Thou, Lord, which knowest the hearts of all men, shew whether of these two thou hast chosen,',
   'Καὶ προσευξάμενοι εἶπον, Σὺ Κύριε καρδιογνῶστα πάντων, ἀνάδειξον ὃν ἐξελέξω ἐκ τούτων τῶν δύο ἕνα,',
   'Kai proseuxamenoi eipon, Sy Kyrie kardiognōsta pantōn, anadeixon hon exelexō ek toutōn tōn dyo hena,',
   'Before casting lots, the disciples prayed, appealing to the Lord as "Thou, Lord, which knowest the hearts of all men" (καρδιογνῶστα πάντων, kardiognōsta pantōn). This prayer acknowledges God''s omniscience and His ultimate authority in choosing leaders. They sought divine revelation for which of the two nominees God had already chosen, demonstrating their dependence on His guidance in matters of spiritual leadership.',
   'This prayer highlights the early church''s reliance on divine guidance in leadership selection. It affirms God''s omniscience as the "knower of hearts" and His sovereign prerogative in choosing those He calls to ministry, emphasizing that true spiritual leadership is divinely appointed rather than merely humanly elected.'),
  (25,
   'That he may take part of this ministry and apostleship, from which Judas by transgression fell, that he might go to his own place.',
   'λαβεῖν τὸν τόπον τῆς διακονίας ταύτης καὶ ἀποστολῆς, ἀφ’ ἧς παρέβη Ἰούδας πορευθῆναι εἰς τὸν τόπον τὸν ἴδιον.',
   'labein ton topon tēs diakonias tautēs kai apostolēs, aph'' hēs parebē Ioudas poreuthēnai eis ton topon ton idion.',
   'The prayer specifies that the chosen one should "take part of this ministry and apostleship" (διακονίας καὶ ἀποστολῆς, diakonias kai apostolēs), filling the vacant office from which Judas "by transgression fell." The phrase "that he might go to his own place" (εἰς τὸν τόπον τὸν ἴδιον, eis ton topon ton idion) is a euphemism for Judas''s eternal destiny, implying a place of judgment or separation due to his betrayal and unrepentance (Matt 26:24).',
   'This verse underscores the gravity of the apostolic office and the consequences of unfaithfulness. It contrasts the divine calling to ministry with the tragic fate of Judas, who, through transgression, chose his "own place" of judgment, emphasizing the eternal implications of one''s choices regarding God''s calling.'),
  (26,
   'And they gave forth their lots; and the lot fell upon Matthias; and he was numbered with the eleven apostles.',
   'Καὶ ἔδωκαν κλήρους αὐτοῖς, καὶ ἔπεσεν ὁ κλῆρος ἐπὶ Ματθίαν, καὶ συγκατεψηφίσθη μετὰ τῶν ἕνδεκα ἀποστόλων.',
   'Kai edōkan klērous autois, kai epesen ho klēros epi Matthian, kai synkatepsēphisthē meta tōn hendeka apostolōn.',
   'The disciples cast lots, a common practice in the Old Testament for discerning God''s will (Prov 16:33; 1 Sam 14:41-42). The lot fell upon Matthias, and he was "numbered with the eleven apostles." This method, used before the outpouring of the Holy Spirit, was a legitimate way for them to seek divine direction. After Pentecost, the Spirit''s direct guidance became the primary means of discerning God''s will, as seen in subsequent chapters of Acts.',
   'The selection of Matthias by lot, prior to Pentecost, illustrates a transitional method of discerning God''s will. It highlights the importance of maintaining the apostolic witness and the divine intention for the twelve. Post-Pentecost, the Holy Spirit''s direct guidance became the primary means of divine direction for the church.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παθεῖν', 'pathein', 'G3958', 'From πάσχω (paschō), "to suffer." Refers to Jesus'' suffering, crucifixion, and death. Theologically, it emphasizes the atoning sacrifice of Christ, central to Christian doctrine, as the means of redemption for humanity. It encapsulates the profound cost of salvation.', 1),
  ('ζῶντα', 'zōnta', 'G2198', 'Present active participle of ζάω (zaō), "to live." Describes Jesus as "living," emphasizing his resurrection life and victory over death. It signifies his continued existence, active presence, and ongoing reign, providing assurance of eternal life for believers.', 2),
  ('τεκμηρίοις', 'tekmēriois', 'G5039', 'From τεκμήριον (tekmērion), "a sure sign, proof, evidence." Denotes irrefutable, conclusive proof, stronger than a mere "sign." Luke uses it to underscore the absolute certainty of Jesus'' resurrection, providing a solid historical foundation for Christian faith.', 3),
  ('βασιλείας', 'basileias', 'G932', 'From βασιλεία (basileia), "kingdom, reign, royal power." Refers to the sovereign rule of God, both present and future, spiritual and eschatological. Jesus'' teaching on the kingdom is central to his ministry and the apostles'' mission, signifying God''s redemptive dominion.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δύναμιν', 'dynamin', 'G1411', 'From δύναμις (dynamis), "power, ability, strength." Here, it refers to the supernatural enabling power of the Holy Spirit, essential for the apostles to fulfill their mission. It is not merely human strength but divine empowerment for effective witness and service.', 1),
  ('Πνεύματος', 'Pneumatos', 'G4151', 'From πνεῦμα (pneuma), "Spirit, wind, breath." In this context, it refers to the Holy Spirit, the third person of the Trinity, whose coming empowers believers for witness and service. It signifies divine presence and active spiritual force.', 2),
  ('μάρτυρες', 'martyres', 'G3144', 'From μάρτυς (martys), "witnesses." Those who testify to what they have seen and heard, particularly concerning Jesus'' life, death, and resurrection. This term defines the core mission of the apostles and the Church, to bear authentic testimony to Christ.', 3),
  ('γῆς', 'gēs', 'G1093', 'From γῆ (gē), "earth, land, ground." Here, it signifies the entire world, emphasizing the universal scope of the gospel mission, extending "unto the uttermost part of the earth." It highlights the global reach of God''s redemptive plan.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀναληφθεὶς', 'analēphtheis', 'G353', 'Aorist passive participle of ἀναλαμβάνω (analambanō), "to take up, receive up." Refers specifically to Jesus'' ascension into heaven, a pivotal event marking the end of his earthly ministry and the beginning of his heavenly reign. It confirms his divine exaltation.', 1),
  ('οὕτως', 'houtōs', 'G3779', 'Thus, in this manner, so." Emphasizes that the manner of Jesus'' return will be similar to his departure, implying a visible, bodily return. This reinforces the doctrine of the Second Coming, assuring believers of a personal and observable event.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = 11;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πληρωθῆναι', 'plērōthēnai', 'G4137', 'Aorist passive infinitive of πληρόω (plēroō), "to fulfill, complete." Refers to the divine necessity of Scripture being brought to completion, specifically concerning the prophecy about Judas. It highlights God''s sovereign plan and the inerrancy of His Word.', 1),
  ('προεῖπεν', 'proeipen', 'G4277', 'Aorist active indicative of προλέγω (prolegō), "to say beforehand, foretell." Emphasizes the prophetic nature of David''s words, indicating divine foreknowledge and inspiration of Scripture regarding Judas''s betrayal. It underscores God''s control over history.', 2),
  ('ὁδηγοῦ', 'hodēgou', 'G3595', 'From ὁδηγός (hodēgos), "a guide, leader." Describes Judas''s role as the one who led those who arrested Jesus, underscoring his active betrayal. It highlights the tragic irony of a disciple becoming a betrayer and guide to Christ''s enemies.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Verse 22
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γενέσθαι', 'genesthai', 'G1096', 'Aorist middle infinitive of γίνομαι (ginomai), "to become, to be." Here, it means "to be ordained" or "to become" a witness, emphasizing the necessity of a new apostle to fill the vacant role. It signifies a divinely appointed transformation into a specific function.', 1),
  ('μάρτυρα', 'martyra', 'G3144', 'Accusative singular of μάρτυς (martys), "witness." Reinforces the primary function of an apostle: to bear personal testimony to Jesus'' resurrection, which is the cornerstone of the gospel message. It signifies one who has seen and can attest to the truth.', 2),
  ('ἀναστάσεως', 'anastaseōs', 'G386', 'From ἀνάστασις (anastasis), "resurrection." Refers to Jesus'' rising from the dead, the central event to which the apostles were to bear witness. It is the proof of Christ''s victory over sin and death, and the hope of believers.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = 22;

-- Verse 25
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κλῆρον', 'klēron', 'G2819', 'From κλῆρος (klēros), "lot, inheritance, portion." Here, it refers to the "part" or "office" of ministry and apostleship. It signifies the divine appointment and responsibility associated with the apostolic calling, a sacred trust from God.', 1),
  ('διακονίας', 'diakonias', 'G1248', 'From διακονία (diakonia), "service, ministry." Refers to the general service rendered to God and others, encompassing the apostolic function of preaching and teaching. It emphasizes humble, dedicated service in the kingdom of God.', 2),
  ('ἀποστολῆς', 'apostolēs', 'G651', 'From ἀποστολή (apostolē), "apostleship, mission." Specifically denotes the unique office and authority of an apostle, commissioned directly by Christ to spread the gospel. It signifies a divinely appointed messenger with a specific, authoritative mission.', 3),
  ('παρέβη', 'parebē', 'G3845', 'Aorist active indicative of παραβαίνω (parabainō), "to transgress, go aside." Describes Judas''s act of falling away from his apostolic calling through betrayal, highlighting the consequence of sin. It signifies a deliberate departure from divine command and trust.', 4),
  ('τόπον', 'topon', 'G5117', 'From τόπος (topos), "place, region." Here, "his own place" is an idiom referring to Judas''s eternal destiny, implying a place of judgment or separation due to his transgression. It suggests a final, deserved destination for his unrepentant actions.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = 25;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Luke 1:1-4', 1),
  (1, 'John 20:30-31', 2),
  (1, 'Hebrews 2:3', 3),
  (2, 'Luke 24:50-51', 1),
  (2, 'John 14:26', 2),
  (2, 'John 16:7-15', 3),
  (3, 'Luke 24:36-49', 1),
  (3, 'John 20:19-29', 2),
  (3, '1 Corinthians 15:3-8', 3),
  (4, 'Luke 24:49', 1),
  (4, 'John 14:16-17', 2),
  (4, 'Acts 2:33', 3),
  (5, 'Matthew 3:11', 1),
  (5, 'John 1:33', 2),
  (5, 'Acts 11:16', 3),
  (6, 'Matthew 20:21', 1),
  (6, 'Luke 17:20-21', 2),
  (6, 'Acts 3:21', 3),
  (7, 'Matthew 24:36', 1),
  (7, 'Mark 13:32', 2),
  (7, '1 Thessalonians 5:1-2', 3),
  (8, 'Luke 24:48-49', 1),
  (8, 'Isaiah 49:6', 2),
  (8, 'Matthew 28:19-20', 3),
  (9, 'Luke 24:51', 1),
  (9, 'Mark 16:19', 2),
  (9, 'Hebrews 4:14', 3),
  (10, 'Matthew 28:2-3', 1),
  (10, 'John 20:12', 2),
  (10, 'Acts 2:7', 3),
  (11, 'John 14:3', 1),
  (11, '1 Thessalonians 4:16-17', 2),
  (11, 'Revelation 1:7', 3),
  (12, 'Luke 24:52', 1),
  (12, 'Zechariah 14:4', 2),
  (12, 'Acts 9:3', 3),
  (13, 'Luke 6:14-16', 1),
  (13, 'Matthew 10:2-4', 2),
  (13, 'Acts 2:1', 3),
  (14, 'Luke 23:49', 1),
  (14, 'Acts 2:42', 2),
  (14, 'Philippians 4:6', 3),
  (15, 'Acts 2:1', 1),
  (15, 'Acts 4:32', 2),
  (15, '1 Corinthians 15:6', 3),
  (16, 'Psalm 41:9', 1),
  (16, 'John 13:18', 2),
  (16, 'Acts 2:23', 3),
  (17, 'Luke 6:16', 1),
  (17, 'John 6:70-71', 2),
  (17, 'Acts 1:25', 3),
  (18, 'Matthew 27:3-10', 1),
  (18, 'Zechariah 11:12-13', 2),
  (19, 'Matthew 27:7-8', 1),
  (20, 'Psalm 69:25', 1),
  (20, 'Psalm 109:8', 2),
  (20, 'Romans 11:9-10', 3),
  (21, 'Mark 1:1', 1),
  (21, 'Luke 3:21-22', 2),
  (21, 'Acts 10:37-41', 3),
  (22, 'John 15:27', 1),
  (22, 'Acts 4:33', 2),
  (22, '1 Corinthians 9:1', 3),
  (23, 'Acts 6:5', 1),
  (23, 'Acts 15:22', 2),
  (24, '1 Samuel 16:7', 1),
  (24, 'Jeremiah 17:10', 2),
  (24, 'Revelation 2:23', 3),
  (25, 'Acts 1:17', 1),
  (25, 'John 17:12', 2),
  (25, 'Matthew 26:24', 3),
  (26, 'Proverbs 16:33', 1),
  (26, 'Acts 6:6', 2),
  (26, 'Acts 14:23', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 1 Complete!
-- 26 verses · 6 key verses with word studies (21 words)
-- Cross-references for 26 verses (74 refs)
-- ═══════════════════════════════════════════════════════