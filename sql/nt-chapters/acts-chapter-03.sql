-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 3 — The Healing at the Beautiful Gate and Peter's Call to Repentance
-- 26 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Acts Chapter 3 narrates the first public miracle performed by Peter and John after Pentecost: the healing of a man lame from birth at the Beautiful Gate of the Jerusalem temple. This dramatic event serves as a powerful catalyst, drawing a large crowd and providing Peter with an immediate platform to preach the gospel. His sermon boldly proclaims Jesus as the Messiah, whom the Jewish people rejected and crucified, but whom God raised from the dead. Peter calls for repentance and conversion, linking these actions to the blotting out of sins and the coming ''times of refreshing'' and ''restitution of all things'' through Jesus'' return. The chapter thus highlights the early church''s apostolic power, the fulfillment of Old Testament prophecy in Christ, and the urgent call to faith and repentance.',
  'The Healing at the Beautiful Gate and Peter''s Call to Repentance',
  'μετάνοια (metanoia)',
  'Derived from ''meta'' (after, with) and ''noeo'' (to perceive, to think), ''metanoia'' signifies a change of mind, a turning around. Theologically, it denotes a fundamental change of heart and direction in life, involving a conscious turning away from sin and towards God, often accompanied by regret for past actions and a commitment to a new way of living in accordance with God''s will. It is a central concept in the call to salvation.',
  '["Section 1 (vv.1-5): Peter and John Encounter the Lame Man at the Temple Gate","Section 2 (vv.6-10): The Miraculous Healing and Public Reaction","Section 3 (vv.11-12): The Crowd''s Amazement and Peter''s Introduction to His Sermon","Section 4 (vv.13-16): Peter Accuses the People and Proclaims Jesus'' Resurrection and Power","Section 5 (vv.17-21): A Call to Repentance, Forgiveness, and the Promise of Jesus'' Return","Section 6 (vv.22-26): Jesus as the Prophesied Prophet and Fulfillment of the Abrahamic Covenant"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 26 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Now Peter and John went up together into the temple at the hour of prayer, being the ninth hour.',
   'Πέτρος δὲ καὶ Ἰωάννης ἀνέβαινον εἰς τὸ ἱερὸν ἐπὶ τὴν ὥραν τῆς προσευχῆς τὴν ἐνάτην.',
   'Petros de kai Iōannēs anebainon eis to hieron epi tēn hōran tēs proseuchēs tēn enatēn.',
   'Peter and John, two prominent apostles, were going up to the temple, a customary practice for devout Jews. The ''ninth hour'' (3 PM) was one of the established times for daily prayer, alongside the third (9 AM) and sixth (12 PM) hours, corresponding to the morning and evening sacrifices (Exod 29:39; Ps 55:17; Dan 6:10). This detail highlights their continued adherence to Jewish religious customs, even after Pentecost, demonstrating that early Christianity was initially seen as a fulfillment of Judaism, not a complete break from it. Their presence at the temple also provided a natural setting for public ministry.',
   NULL),
  (2,
   'And a certain man lame from his mother’s womb was carried, whom they laid daily at the gate of the temple which is called Beautiful, to ask alms of them that entered into the temple;',
   'καί τις ἀνὴρ χωλὸς ἐκ κοιλίας μητρὸς αὐτοῦ ὑπάρχων ἐβαστάζετο, ὃν ἐτίθουν καθ'' ἡμέραν πρὸς τὴν θύραν τοῦ ἱεροῦ τὴν λεγομένην Ὡραίαν τοῦ αἰτεῖν ἐλεημοσύνην παρὰ τῶν εἰσπορευομένων εἰς τὸ ἱερόν·',
   'kai tis anēr chōlos ek koilias mētros autou hyparchōn ebastazeto, hon etithoun kath'' hēmeran pros tēn thyran tou hierou tēn legomenēn Hōraian tou aitein eleēmosynēn para tōn eisporeuomenōn eis to hieron;',
   'This verse introduces the central figure of the miracle: a man ''lame from his mother''s womb,'' emphasizing the severity and congenital nature of his condition, making the subsequent healing undeniably miraculous. He was ''carried'' and ''laid daily'' at the ''Beautiful Gate,'' a prominent entrance to the temple courts, likely on the eastern side, known for its ornate bronze work (Josephus, ''Jewish War'' 5.5.3). His daily presence there for alms highlights the plight of the disabled in ancient society and the common practice of begging at religious sites, where charity was expected.',
   NULL),
  (3,
   'Who seeing Peter and John about to go into the temple asked an alms.',
   'οὗτος ἰδὼν Πέτρον καὶ Ἰωάννην μέλλοντας εἰσιέναι εἰς τὸ ἱερὸν ἠρώτα ἐλεημοσύνην λαβεῖν.',
   'houtos idōn Petron kai Iōannēn mellontas eisienai eis to hieron ērōta eleēmosynēn labein.',
   'Upon seeing Peter and John, the lame man, accustomed to begging from those entering the temple, requested alms. His expectation was purely financial, reflecting his daily routine and immediate need. He had no expectation of physical healing, nor did he know who Peter and John were beyond being potential benefactors. This sets the stage for the unexpected and profound divine intervention that is about to occur, demonstrating God''s power to act beyond human expectation or request.',
   NULL),
  (4,
   'And Peter, fastening his eyes upon him with John, said, Look on us.',
   'ἀτενίσας δὲ Πέτρος εἰς αὐτὸν σὺν τῷ Ἰωάννῃ εἶπεν, Βλέψον εἰς ἡμᾶς.',
   'atenisas de Petros eis auton syn tō Iōannē eipen, Blepson eis hēmas.',
   'Peter, with John, ''fastened his eyes'' (ἀτενίσας, ''atenisas'') on the man. This intense gaze signifies a deliberate and focused attention, moving beyond a casual glance. It was a common posture for Peter when about to perform a significant act (cf. Acts 1:10; 6:15; 10:4). His command, ''Look on us,'' was not merely to get the man''s attention but to prepare him for something extraordinary, shifting his focus from the mere act of begging to the persons who were about to minister to him, and ultimately, to the power working through them.',
   NULL),
  (5,
   'And he gave heed unto them, expecting to receive something of them.',
   'ὁ δὲ ἐπεῖχεν αὐτοῖς προσδοκῶν τι λαβεῖν ἀπ'' αὐτῶν.',
   'ho de epeichen autois prosdokōn ti labein ap'' autōn.',
   'The lame man ''gave heed'' (ἐπεῖχεν, ''epeichen'') to Peter and John, but his expectation remained limited to receiving ''something'' (τι, ''ti'') from them, presumably money. This highlights the contrast between his earthly expectation and the divine gift he was about to receive. His attention was secured, but his understanding of what was possible was still bound by his past experiences and immediate needs. This human limitation underscores the miraculous nature of God''s intervention, which often surpasses our imagination (Eph 3:20).',
   NULL),
  (6,
   'Then Peter said, Silver and gold have I none; but such as I have give I thee: In the name of Jesus Christ of Nazareth rise up and walk.',
   'εἶπεν δὲ Πέτρος, Ἀργύριον καὶ χρυσίον οὐχ ὑπάρχει μοι· ὃ δὲ ἔχω, τοῦτό σοι δίδωμι. ἐν τῷ ὀνόματι Ἰησοῦ Χριστοῦ τοῦ Ναζωραίου ἔγειρε καὶ περιπάτει.',
   'eipen de Petros, Argyrion kai chrysion ouch hyparchei moi; ho de echō, touto soi didōmi. en tō onomati Iēsou Christou tou Nazōraiou egeire kai peripatei.',
   'Peter''s declaration, ''Silver and gold have I none,'' emphasizes the apostles'' lack of material wealth, contrasting with the man''s expectation. The true treasure Peter possessed was the power of Jesus Christ. The command, ''In the name of Jesus Christ of Nazareth rise up and walk,'' is a powerful assertion of apostolic authority derived directly from Christ. The ''name'' (ὄνομα, ''onoma'') here signifies the person, authority, and power of Jesus himself. This is not a magical incantation but an invocation of the living Lord, demonstrating that the apostles acted as His agents (cf. Acts 4:10).',
   'This verse is foundational for understanding the source of apostolic power and miracles in the early church. It establishes that healing and spiritual authority do not come from human resources or inherent holiness, but solely ''in the name of Jesus Christ.'' This highlights Christ''s supreme authority and the apostles'' role as instruments through whom His power is manifested. It also underscores the spiritual wealth available in Christ, far surpassing material riches (2 Cor 8:9).'),
  (7,
   'And he took him by the right hand, and lifted him up: and immediately his feet and ankle bones received strength.',
   'καὶ πιάσας αὐτὸν τῆς δεξιᾶς χειρὸς ἤγειρεν αὐτόν· παραχρῆμα δὲ ἐστερεώθησαν αὐτοῦ αἱ βάσεις καὶ τὰ σφυρά.',
   'kai piasas auton tēs dexiās cheiros ēgeiren auton; parachrēma de estereōthēsan autou hai baseis kai ta sphyra.',
   'Peter''s physical action of taking the man ''by the right hand'' and lifting him up demonstrates faith and compassion, providing a tangible connection for the healing power. The result was immediate and complete: ''immediately his feet and ankle bones received strength'' (ἐστερεώθησαν, ''estereōthēsan'' - were strengthened/solidified). This instantaneous restoration of congenital lameness leaves no room for doubt about the miraculous nature of the event, fulfilling prophecies of the lame walking (Isa 35:6).',
   NULL),
  (8,
   'And he leaping up stood, and walked, and entered with them into the temple, walking, and leaping, and praising God.',
   'καὶ ἐξαλλόμενος ἔστη καὶ περιεπάτει, καὶ εἰσῆλθεν σὺν αὐτοῖς εἰς τὸ ἱερὸν περιπατῶν καὶ ἁλλόμενος καὶ αἰνῶν τὸν Θεόν.',
   'kai exallomenos estē kai periepatē, kai eisēlthen syn autois eis to hieron peripatōn kai hallomenos kai ainōn ton Theon.',
   'The healed man''s reaction is one of exuberant joy and immediate action. He ''leaping up stood, and walked,'' demonstrating full and immediate recovery. His subsequent entry into the temple with Peter and John, ''walking, and leaping, and praising God,'' serves as public testimony to the miracle. His praise of God, rather than Peter or John, correctly attributes the source of the healing, aligning with the apostles'' later clarification (v.12). This public display ensures maximum visibility and impact for the miracle.',
   'The man''s immediate and joyful praise of God after his healing illustrates a proper response to divine intervention. It highlights that true miracles point beyond the human agent to the divine source, eliciting worship and gratitude towards God alone. This spontaneous worship serves as a powerful witness to the transformative power of God''s grace.'),
  (9,
   'And all the people saw him walking and praising God:',
   'καὶ εἶδεν αὐτὸν πᾶς ὁ λαὸς περιπατοῦντα καὶ αἰνοῦντα τὸν Θεόν·',
   'kai eiden auton pas ho laos peripatounta kai ainounta ton Theon;',
   'The public nature of the miracle is crucial. ''All the people'' (πᾶς ὁ λαὸς, ''pas ho laos'') witnessed the man walking and praising God. This widespread observation eliminates any possibility of deception or misunderstanding. The man was a well-known figure at the temple gate, making his transformation undeniable to the community. This public verification provides the necessary credibility for Peter''s subsequent sermon, as the miracle serves as a divine attestation to the message.',
   NULL),
  (10,
   'And they knew that it was he which sat for alms at the Beautiful gate of the temple: and they were filled with wonder and amazement at that which had happened unto him.',
   'ἐπεγίνωσκον δὲ αὐτὸν ὅτι οὗτος ἦν ὁ καθήμενος ἐπὶ τὴν Ὡραίαν Πύλην τοῦ ἱεροῦ εἰς ἐλεημοσύνην, καὶ ἐπλήσθησαν θάμβους καὶ ἐκστάσεως ἐπὶ τῷ συμβεβηκότι αὐτῷ.',
   'epeginōskon de auton hoti houtos ēn ho kathēmenos epi tēn Hōraian Pylēn tou hierou eis eleēmosynēn, kai eplēsthēsan thambous kai ekstaseōs epi tō symbebekoti autō.',
   'The people ''recognized'' (ἐπεγίνωσκον, ''epeginōskon'') the healed man as the one who regularly sat begging at the Beautiful Gate. This recognition confirms the man''s identity and the reality of his former condition. Their reaction was one of ''wonder and amazement'' (θάμβους καὶ ἐκστάσεως, ''thambous kai ekstaseōs''), terms indicating profound astonishment and awe, almost to the point of being beside themselves. This emotional response prepares them to listen to Peter''s explanation of such an extraordinary event.',
   NULL),
  (11,
   'And as the lame man which was healed held Peter and John, all the people ran together unto them in the porch that is called Solomon’s, greatly wondering.',
   'κρατοῦντος δὲ αὐτοῦ τὸν Πέτρον καὶ Ἰωάννην συνέδραμεν πᾶς ὁ λαὸς πρὸς αὐτοὺς ἐπὶ τὴν στοὰν τὴν καλουμένην Σολομῶνος ἔκθαμβοι.',
   'kratountos de autou ton Petron kai Iōannēn synedramen pas ho laos pros autous epi tēn stoan tēn kaloumenēn Solomōnos ekthamboi.',
   'The healed man ''held Peter and John,'' likely out of gratitude and a desire to remain close to his benefactors. This action kept the apostles at the center of attention. ''All the people ran together'' to them in ''Solomon''s Porch,'' a large colonnade on the eastern side of the temple court, a common gathering place (John 10:23). Their continued ''greatly wondering'' (ἔκθαμβοι, ''ekthamboi'') underscores the profound impact of the miracle and creates a massive audience for Peter''s impending sermon, demonstrating divine orchestration of the event.',
   NULL),
  (12,
   'And when Peter saw it, he answered unto the people, Ye men of Israel, why marvel ye at this? or why look ye so earnestly on us, as though by our own power or holiness we had made this man to walk?',
   'ἰδὼν δὲ Πέτρος ἀπεκρίνατο πρὸς τὸν λαόν, Ἄνδρες Ἰσραηλῖται, τί θαυμάζετε ἐπὶ τούτῳ, ἢ ἡμῖν τί ἀτενίζετε ὡς ἰδίᾳ δυνάμει ἢ εὐσεβείᾳ πεποιηκόσιν τοῦ περιπατεῖν αὐτόν;',
   'idōn de Petros apekrithē pros ton laon, Andres Israēlitai, ti thaumazete epi toutō, ē hēmin ti atenizete hōs idia dynamei ē eusebeia pepoiēkosin tou peripatein auton?',
   'Peter seizes the opportunity presented by the astonished crowd. He immediately redirects their attention from himself and John, challenging their ''marveling'' (θαυμάζετε, ''thaumazete'') and intense gaze (ἀτενίζετε, ''atenizete'') as if the healing was by ''our own power or holiness.'' This crucial disclaimer prevents any misconception that the apostles were the source of the miracle. It sets the stage for Peter to attribute the power to its true source: Jesus Christ, thereby initiating his evangelistic message.',
   'Peter''s immediate redirection of glory from himself to God is a vital doctrinal principle. It teaches that true spiritual power and miraculous works are never from human agents'' ''own power or holiness,'' but are manifestations of God''s power working through them. This guards against idolatry of leaders and ensures that God alone receives the praise and honor (1 Cor 1:29-31).'),
  (13,
   'The God of Abraham, and of Isaac, and of Jacob, the God of our fathers, hath glorified his Son Jesus; whom ye delivered up, and denied him in the presence of Pilate, when he was determined to let him go.',
   'ὁ Θεὸς Ἀβραὰμ καὶ Ἰσαὰκ καὶ Ἰακώβ, ὁ Θεὸς τῶν πατέρων ἡμῶν, ἐδόξασεν τὸν Παῖδα αὐτοῦ Ἰησοῦν, ὃν ὑμεῖς μὲν παρεδώκατε καὶ ἠρνήσασθε κατὰ πρόσωπον Πιλάτου, κρίναντος ἐκείνου ἀπολύειν.',
   'ho Theos Abraam kai Isaak kai Iakōb, ho Theos tōn paterōn hēmōn, edoxasen ton Paida autou Iēsoun, hon hymeis men paredōkate kai ērnēsasthe kata prosōpon Pilatou, krinantos ekeinou apolyein.',
   'Peter begins his sermon by identifying God as ''the God of Abraham, Isaac, and Jacob,'' connecting with Jewish heritage and affirming continuity with their covenantal history. He declares that this God ''glorified his Son Jesus'' (τὸν Παῖδα αὐτοῦ Ἰησοῦν, ''ton Paida autou Iēsoun'' - ''Servant'' or ''Son''). Peter then directly confronts the crowd, accusing them of delivering up and denying Jesus before Pilate, even when Pilate ''was determined to let him go'' (cf. Luke 23:13-25). This bold accusation highlights their culpability in the crucifixion.',
   'This verse establishes Jesus'' identity as God''s ''Son'' or ''Servant'' (a messianic title from Isaiah, e.g., Isa 42:1), glorified by the God of Israel. It also lays the theological groundwork for human responsibility in the crucifixion, emphasizing that the Jewish leaders and people rejected their Messiah despite Pilate''s inclination to release Him. This rejection, however, ultimately served God''s redemptive plan (Acts 2:23).'),
  (14,
   'But ye denied the Holy One and the Just, and desired a murderer to be granted unto you;',
   'ὑμεῖς δὲ τὸν Ἅγιον καὶ Δίκαιον ἠρνήσασθε, καὶ ᾐτήσασθε ἄνδρα φονέα χαρισθῆναι ὑμῖν,',
   'hymeis de ton Hagion kai Dikaion ērnēsasthe, kai ēitēsasthe andra phonea charisthēnai hymin,',
   'Peter continues his indictment, contrasting Jesus'' character with the crowd''s choice. Jesus is described as ''the Holy One and the Just'' (τὸν Ἅγιον καὶ Δίκαιον, ''ton Hagion kai Dikaion''), titles emphasizing His moral perfection and righteousness, often used for the Messiah (Ps 16:10; Isa 53:11). In stark contrast, they ''desired a murderer'' (Barabbas, cf. Matt 27:15-26) to be granted to them. This choice underscores the profound spiritual blindness and moral perversion of those who rejected Jesus.',
   'This verse powerfully contrasts Jesus'' divine holiness and justice with humanity''s sinful rejection. By choosing a murderer over ''the Holy One and the Just,'' the people demonstrated their spiritual depravity and profound misunderstanding of God''s righteousness. This highlights the necessity of repentance and God''s grace to overcome such spiritual blindness.'),
  (15,
   'And killed the Prince of life, whom God hath raised from the dead; whereof we are witnesses.',
   'τὸν δὲ Ἀρχηγὸν τῆς ζωῆς ἀπεκτείνατε, ὃν ὁ Θεὸς ἤγειρεν ἐκ νεκρῶν, οὗ ἡμεῖς μάρτυρες.',
   'ton de Archēgon tēs zōēs apekteinate, hon ho Theos ēgeiren ek nekrōn, hou hēmeis martyres.',
   'Peter delivers the most severe accusation: they ''killed the Prince of life'' (τὸν δὲ Ἀρχηγὸν τῆς ζωῆς, ''ton de Archēgon tēs zōēs''). ''Archēgon'' can mean ''author,'' ''leader,'' or ''pioneer,'' emphasizing Jesus'' role as the source and originator of life, both physical and spiritual. However, God''s sovereign plan was not thwarted; He ''raised him from the dead.'' Peter asserts the apostles'' eyewitness testimony: ''whereof we are witnesses'' (οὗ ἡμεῖς μάρτυρες, ''hou hēmeis martyres''), a recurring theme in Acts (Acts 1:8, 22; 2:32).',
   'This verse presents Jesus as the ''Author of Life,'' emphasizing His divine nature and power over death. The resurrection, attested by eyewitnesses, is the cornerstone of the Christian faith, demonstrating God''s vindication of Jesus and His victory over sin and death. It is the ultimate proof of Jesus'' messianic claims and the foundation for the hope of eternal life (1 Cor 15:3-4).'),
  (16,
   'And his name through faith in his name hath made this man strong, whom ye see and know: yea, the faith which is by him hath given him this perfect soundness in the presence of you all.',
   'καὶ ἐπὶ τῇ πίστει τοῦ ὀνόματος αὐτοῦ τοῦτον ὃν θεωρεῖτε καὶ οἴδατε ἐστερέωσεν τὸ ὄνομα αὐτοῦ, καὶ ἡ πίστις ἡ δι'' αὐτοῦ ἔδωκεν αὐτῷ τὴν ὁλοκληρίαν ταύτην ἀπέναντι πάντων ὑμῶν.',
   'kai epi tē pistei tou onomatos autou touton hon theōreite kai oidate estereōsen to onoma autou, kai hē pistis hē di'' autou edōken autō tēn holoklērian tautēn apenanti pantōn hymōn.',
   'Peter explicitly connects the healing to Jesus'' name and faith. It was ''through faith in his name'' (ἐπὶ τῇ πίστει τοῦ ὀνόματος αὐτοῦ, ''epi tē pistei tou onomatos autou'') that the man received ''perfect soundness'' (τὴν ὁλοκληρίαν, ''tēn holoklērian'' - complete wholeness). The faith is ''by him'' (ἡ δι'' αὐτοῦ, ''hē di'' autou''), implying that the faith itself is a gift or is directed towards Jesus, not merely a human effort. This clarifies that the miracle was not due to the man''s faith (he expected money) nor the apostles'' inherent power, but the power of Jesus activated through faith.',
   'This verse is crucial for understanding the mechanism of divine healing and the role of faith. It teaches that healing power resides in the ''name'' (person and authority) of Jesus, activated by faith ''through him.'' This faith is not a human work but a divine enablement, demonstrating that God''s power is mediated through Christ and received by a trusting reliance on Him, resulting in complete restoration.'),
  (17,
   'And now, brethren, I wot that through ignorance ye did it, as did also your rulers.',
   'καὶ νῦν, ἀδελφοί, οἶδα ὅτι κατὰ ἄγνοιαν ἐπράξατε, ὥσπερ καὶ οἱ ἄρχοντες ὑμῶν·',
   'kai nyn, adelphoi, oida hoti kata agnoian epraxate, hōsper kai hoi archontes hymōn;',
   'Peter shifts from accusation to a more conciliatory tone, acknowledging that their actions were done ''through ignorance'' (κατὰ ἄγνοιαν, ''kata agnoian''), a point also made by Jesus on the cross (Luke 23:34) and Paul (1 Tim 1:13). This doesn''t absolve them of guilt but provides a basis for repentance, as ignorance, while not an excuse, can mitigate the degree of culpability and open a door for forgiveness. He includes ''your rulers'' in this ignorance, suggesting a widespread lack of understanding regarding Jesus'' true identity.',
   NULL),
  (18,
   'But those things, which God before had shewed by the mouth of all his prophets, that Christ should suffer, he hath so fulfilled.',
   'ὁ δὲ Θεὸς ἃ προκατήγγειλεν διὰ στόματος πάντων τῶν προφητῶν παθεῖν τὸν Χριστὸν οὕτως ἐπλήρωσεν.',
   'ho de Theos ha prokatēngeilen dia stomatos pantōn tōn prophētōn pathein ton Christon houtōs eplērōsen.',
   'Despite human ignorance and sin, Peter emphasizes God''s sovereign plan. God ''before had shewed by the mouth of all his prophets'' (προκατήγγειλεν διὰ στόματος πάντων τῶν προφητῶν, ''prokatēngeilen dia stomatos pantōn tōn prophētōn'') that ''Christ should suffer'' (παθεῖν τὸν Χριστὸν, ''pathein ton Christon''). This suffering, though brought about by human sin, was divinely ordained and ''so fulfilled.'' This highlights the biblical theme of God working His purposes through human actions, even sinful ones, to bring about salvation (cf. Acts 2:23).',
   'This verse underscores the profound truth of divine sovereignty and prophetic fulfillment. It teaches that Christ''s suffering and death, though a result of human sin, were not accidental but part of God''s eternal plan, foretold by the prophets. This demonstrates God''s meticulous control over history and His unwavering commitment to His redemptive purposes, even through seemingly tragic events (Isa 53:3-6).'),
  (19,
   'Repent ye therefore, and be converted, that your sins may be blotted out, when the times of refreshing shall come from the presence of the Lord;',
   'μετανοήσατε οὖν καὶ ἐπιστρέψατε πρὸς τὸ ἐξαλειφθῆναι ὑμῶν τὰς ἁμαρτίας, ὅπως ἂν ἔλθωσιν καιροὶ ἀναψύξεως ἀπὸ προσώπου Κυρίου',
   'metanoēsate oun kai epistrepsate pros to exaleiphthēnai hymōn tas hamartias, hopōs an elthōsin kairoi anapsyxeōs apo prosōpou Kyriou',
   'Following the explanation of God''s plan and human culpability, Peter issues a direct call to action: ''Repent ye therefore, and be converted'' (μετανοήσατε οὖν καὶ ἐπιστρέψατε, ''metanoēsate oun kai epistrepsate''). Repentance (change of mind) and conversion (turning around) are two sides of the same coin, leading to the blotting out of sins. This forgiveness is linked to ''times of refreshing'' (καιροὶ ἀναψύξεως, ''kairoi anapsyxeōs''), a period of spiritual renewal and peace from the Lord''s presence, often associated with the Messianic age and the outpouring of the Spirit (Isa 44:3).',
   'This is a pivotal verse for the gospel message, outlining the path to salvation: repentance and conversion. It teaches that forgiveness of sins is contingent upon a genuine change of heart and turning to God. The promise of ''times of refreshing'' connects personal salvation with eschatological hope, indicating that individual spiritual renewal is a foretaste of the broader restoration God will bring through Christ''s return.'),
  (20,
   'And he shall send Jesus Christ, which before was preached unto you:',
   'καὶ ἀποστείλῃ τὸν προκεχειρισμένον ὑμῖν Χριστὸν Ἰησοῦν,',
   'kai aposteilē ton prokecheirismenon hymin Christon Iēsoun,',
   'The ''times of refreshing'' are directly linked to God sending ''Jesus Christ, which before was preached unto you'' (τὸν προκεχειρισμένον ὑμῖν Χριστὸν Ἰησοῦν, ''ton prokecheirismenon hymin Christon Iēsoun'' - ''appointed for you''). This refers to Jesus'' second coming, where He will return as the Messiah to establish His full kingdom. Peter emphasizes that this Jesus, whom they rejected, is the one God has already designated and will send again, highlighting His continued central role in God''s redemptive plan.',
   'This verse points to the eschatological hope of Christ''s second coming. It affirms that Jesus, the rejected Messiah, is the divinely ''appointed'' one who will return to fully inaugurate the promised ''times of refreshing'' and ''restitution of all things.'' This doctrine provides assurance of God''s ultimate victory and the complete fulfillment of His redemptive purposes.'),
  (21,
   'Whom the heaven must receive until the times of restitution of all things, which God hath spoken by the mouth of all his holy prophets since the world began.',
   'ὃν δεῖ οὐρανὸν μὲν δέξασθαι ἄχρι χρόνων ἀποκαταστάσεως πάντων ὧν ἐλάλησεν ὁ Θεὸς διὰ στόματος πάντων ἁγίων αὐτοῦ προφητῶν ἀπ'' αἰῶνος.',
   'hon dei ouranon men dexasthai achri chronōn apokatastaseōs pantōn hōn elalēsen ho Theos dia stomatos pantōn hagiōn autou prophētōn ap'' aiōnos.',
   'Jesus ''must receive'' (δεῖ οὐρανὸν μὲν δέξασθαι, ''dei ouranon men dexasthai'' - ''whom heaven must receive'') until ''the times of restitution of all things'' (χρόνων ἀποκαταστάσεως πάντων, ''chronōn apokatastaseōs pantōn''). This phrase refers to the restoration of creation and humanity to its original, unfallen state, as prophesied by ''all his holy prophets since the world began'' (e.g., Isa 11:6-9; 65:17-25). It signifies the consummation of God''s kingdom and the reversal of the effects of sin, a universal restoration that awaits Christ''s return.',
   'This verse introduces the profound concept of the ''restitution of all things,'' a comprehensive restoration of creation and humanity to God''s original design, prophesied throughout the Old Testament. It affirms that Jesus'' ascension to heaven is temporary, and He will return to complete this cosmic restoration, bringing about a new heaven and a new earth where righteousness dwells (Rev 21:1-5).'),
  (22,
   'For Moses truly said unto the fathers, A prophet shall the Lord your God raise up unto you of your brethren, like unto me; him shall ye hear in all things whatsoever he shall say unto you.',
   'Μωϋσῆς μὲν γὰρ εἶπεν ὅτι Προφήτην ὑμῖν ἀναστήσει Κύριος ὁ Θεὸς ὑμῶν ἐκ τῶν ἀδελφῶν ὑμῶν ὡς ἐμέ· αὐτοῦ ἀκούσεσθε κατὰ πάντα ὅσα ἂν λαλήσῃ πρὸς ὑμᾶς.',
   'Mōysēs men gar eipen hoti Prophētēn hymin anastēsei Kyrios ho Theos hymōn ek tōn adelphōn hymōn hōs eme; autou akousesthe kata panta hosa an lalēsē pros hymas.',
   'Peter supports his claims by quoting Moses from Deuteronomy 18:15, 18. Moses prophesied that ''A prophet shall the Lord your God raise up unto you of your brethren, like unto me.'' This prophecy was understood by Jews to refer to a future prophet, often identified with the Messiah. Peter asserts that Jesus is this promised prophet, emphasizing the imperative to ''hear him in all things whatsoever he shall say,'' implying obedience to Jesus'' teachings and commands.',
   'This quotation from Moses identifies Jesus as the ultimate Prophet, fulfilling Old Testament expectations. It establishes Jesus'' authority as superior to Moses, demanding absolute obedience from God''s people. This highlights the continuity of God''s revelation, culminating in Christ, and the critical importance of heeding His word for salvation and spiritual life (Heb 1:1-2).'),
  (23,
   'And it shall come to pass, that every soul, which will not hear that prophet, shall be destroyed from among the people.',
   'ἔσται δὲ πᾶσα ψυχὴ ἥτις ἐὰν μὴ ἀκούσῃ τοῦ προφήτου ἐκείνου ἐξολεθρευθήσεται ἐκ τοῦ λαοῦ.',
   'estai de pasa psychē hētis ean mē akousē tou prophētou ekeinou exolethreuthēsetai ek tou laou.',
   'Continuing the quote from Deuteronomy 18:19, Peter warns of the severe consequences for those who ''will not hear that prophet.'' Such a soul ''shall be destroyed from among the people'' (ἐξολεθρευθήσεται ἐκ τοῦ λαοῦ, ''exolethreuthēsetai ek tou laou''). This is a strong warning of divine judgment and exclusion from God''s covenant community for rejecting Jesus, the promised Prophet. It underscores the urgency of Peter''s call to repentance and faith.',
   'This verse emphasizes the gravity of rejecting Jesus as the prophesied Prophet. It teaches that disobedience to Christ''s message carries eternal consequences, leading to spiritual destruction and separation from God''s people. This highlights the exclusivity of salvation through Christ and the necessity of responding to His call with faith and obedience.'),
  (24,
   'Yea, and all the prophets from Samuel and those that follow after, as many as have spoken, have likewise foretold of these days.',
   'καὶ πάντες δὲ οἱ προφῆται ἀπὸ Σαμουὴλ καὶ τῶν καθεξῆς ὅσοι ἐλάλησαν καὶ προκατήγγειλαν τὰς ἡμέρας ταύτας.',
   'kai pantes de hoi prophētai apo Samouēl kai tōn kathexēs hosoi elalēsan kai prokatēngeilan tas hēmeras tautas.',
   'Peter broadens his argument, stating that ''all the prophets from Samuel and those that follow after'' (ἀπὸ Σαμουὴλ καὶ τῶν καθεξῆς, ''apo Samouēl kai tōn kathexēs'') have ''likewise foretold of these days.'' Samuel is often considered a pivotal figure marking the beginning of the prophetic succession after Moses (1 Sam 3:20). This assertion reinforces the idea that the events surrounding Jesus and the early church, including His suffering, resurrection, and the call to repentance, are the culmination of centuries of divine prophecy.',
   NULL),
  (25,
   'Ye are the children of the prophets, and of the covenant which God made with our fathers, saying unto Abraham, And in thy seed shall all the kindreds of the earth be blessed.',
   'ὑμεῖς ἐστε οἱ υἱοὶ τῶν προφητῶν καὶ τῆς διαθήκης ἧς διεθέτο ὁ Θεὸς πρὸς τοὺς πατέρας ὑμῶν, λέγων πρὸς Ἀβραάμ, Καὶ ἐν τῷ σπέρματί σου ἐνευλογηθήσονται πᾶσαι αἱ πατριαὶ τῆς γῆς.',
   'hymeis este hoi hyioi tōn prophētōn kai tēs diathēkēs hēs dietheto ho Theos pros tous pateras hymōn, legōn pros Abraam, Kai en tō spermatī sou eneulogēthēsontai pasai hai patriaī tēs gēs.',
   'Peter reminds his Jewish audience of their privileged position: ''Ye are the children of the prophets, and of the covenant'' (υἱοὶ τῶν προφητῶν καὶ τῆς διαθήκης, ''hyioi tōn prophētōn kai tēs diathēkēs''). He specifically references the Abrahamic covenant (Gen 12:3; 22:18), where God promised Abraham that ''in thy seed shall all the kindreds of the earth be blessed.'' This connects Jesus, the ultimate ''seed'' of Abraham (Gal 3:16), to God''s ancient promises, implying that their rejection of Jesus is a rejection of their own heritage and covenant.',
   'This verse highlights the continuity between the Old Testament covenants and the New Covenant in Christ. It affirms that the Jewish people are heirs to the promises made to Abraham, but also that these promises find their ultimate fulfillment in Jesus, the ''seed'' through whom all nations are blessed. This underscores the universal scope of God''s redemptive plan, rooted in Israel''s history but extending to all humanity.'),
  (26,
   'Unto you first God, having raised up his Son Jesus, sent him to bless you, in turning away every one of you from his iniquities.',
   'ὑμῖν πρῶτον ἀναστήσας ὁ Θεὸς τὸν Παῖδα αὐτοῦ ἀπέστειλεν αὐτὸν εὐλογοῦντα ὑμᾶς ἐν τῷ ἀποστρέφειν ἕκαστον ἀπὸ τῶν πονηριῶν ὑμῶν.',
   'hymin prōton anastēsas ho Theos ton Paida autou apesteilen auton eulogounta hymas en tō apostrephein hekaston apo tōn ponēriōn hymōn.',
   'Peter concludes by reiterating God''s specific intention for Israel: ''Unto you first God, having raised up his Son Jesus, sent him to bless you.'' The blessing comes ''in turning away every one of you from his iniquities'' (ἐν τῷ ἀποστρέφειν ἕκαστον ἀπὸ τῶν πονηριῶν ὑμῶν, ''en tō apostrephein hekaston apo tōn ponēriōn hymōn''). This emphasizes that the primary blessing of the Messiah is not political liberation but spiritual deliverance from sin. The ''first'' (πρῶτον, ''prōton'') indicates God''s priority for Israel in salvation history, before the gospel extends to the Gentiles (Rom 1:16).',
   'This verse clarifies the nature of the Messianic blessing: it is primarily spiritual, involving deliverance from ''iniquities'' rather than merely temporal or political benefits. It also reaffirms God''s enduring covenantal priority for Israel, offering them the first opportunity for salvation through Jesus. This highlights the transformative power of the gospel, which turns individuals from their evil ways to God.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὀνόματι', 'onomati', 'G3686', 'From ''onoma'' (name). In biblical usage, ''name'' often represents the person, authority, character, and power of the one named. To act ''in the name of Jesus'' means to act by His authority, as His representative, and with His power. It is not a magical formula but an invocation of the living Lord''s presence and power, making Him the active agent.', 1),
  ('Ἰησοῦ', 'Iēsou', 'G2424', 'The Greek form of the Hebrew ''Yeshua'' or ''Joshua,'' meaning ''Yahweh is salvation'' or ''The Lord saves.'' This name was given to Mary''s son because ''he shall save his people from their sins'' (Matt 1:21). It signifies His identity as the divine Savior and the embodiment of God''s redemptive purpose for humanity.', 2),
  ('Χριστοῦ', 'Christou', 'G5547', 'From ''Christos,'' the Greek translation of the Hebrew ''Messiah,'' meaning ''Anointed One.'' This title designates Jesus as the divinely appointed King, Priest, and Prophet, chosen by God to fulfill all the Old Testament prophecies concerning the deliverer of Israel and the world. It signifies His unique office and mission.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 6;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Θεὸς', 'Theos', 'G2316', 'The supreme divine being, God. In this context, Peter emphasizes God''s identity as the covenant God of Israel (''God of Abraham, Isaac, and Jacob''), connecting the new revelation of Jesus to the historical faith of the Jewish people. It underscores the continuity of God''s plan and His faithfulness to His promises.', 1),
  ('ἐδόξασεν', 'edoxasen', 'G1392', 'From ''doxazō,'' meaning ''to glorify,'' ''to honor,'' ''to make glorious.'' Here, it refers to God exalting Jesus, particularly through His resurrection and ascension, thereby demonstrating His divine approval and power. It signifies the vindication of Jesus after His suffering and death, revealing His true identity and authority.', 2),
  ('Παῖδα', 'Paida', 'G3816', 'From ''pais,'' meaning ''child,'' ''servant,'' or ''son.'' In this context, it carries the dual meaning of ''Son'' (referring to Jesus'' divine sonship) and ''Servant'' (referring to the Suffering Servant of Isaiah, e.g., Isa 42:1; 52:13). This title highlights Jesus'' obedient submission to God''s will and His unique relationship with the Father.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 13;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἀρχηγὸν', 'Archēgon', 'G747', 'From ''archēgos,'' meaning ''author,'' ''leader,'' ''prince,'' or ''pioneer.'' Applied to Jesus, it signifies Him as the originator and source of life, both physical and spiritual. He is the one who blazes the trail and leads others into life. This title emphasizes His unique role as the giver and sustainer of life.', 1),
  ('ζωῆς', 'zōēs', 'G2222', 'From ''zōē,'' meaning ''life,'' particularly spiritual and eternal life, as opposed to mere physical existence. When combined with ''Archēgon,'' it emphasizes Jesus'' role as the ultimate source and embodiment of true, abundant, and everlasting life, which He offers to humanity through His death and resurrection.', 2),
  ('ἀνέστησεν', 'anestēsen', 'G450', 'From ''anistēmi,'' meaning ''to raise up,'' ''to cause to stand.'' Here, it specifically refers to God raising Jesus from the dead. The resurrection is the central event of Christian faith, demonstrating God''s power over death and His vindication of Jesus'' claims. It is the foundation of hope for believers.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 15;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πίστει', 'pistei', 'G4102', 'From ''pistis,'' meaning ''faith,'' ''trust,'' ''belief,'' ''conviction.'' In this context, it refers to the active reliance and trust in the person and power of Jesus Christ. Peter clarifies that the healing occurred not by human merit or magical words, but through faith directed towards Jesus, making Him the active agent of the miracle.', 1),
  ('ὀνόματος', 'onomatos', 'G3686', 'From ''onoma'' (name). As in verse 6, the ''name'' of Jesus here encapsulates His entire person, authority, and power. Faith ''in his name'' means faith in who He is and what He represents, acknowledging His divine authority and ability to act. It is the channel through which divine power flows.', 2),
  ('ὁλοκληρίαν', 'holoklērian', 'G3647', 'From ''holoklēria,'' meaning ''completeness,'' ''perfect soundness,'' ''entire health.'' This word emphasizes that the healing of the lame man was not partial or temporary, but a total and permanent restoration of his physical faculties. It signifies a complete wholeness, demonstrating the thoroughness of God''s miraculous power.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Verse 19
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετανοήσατε', 'metanoēsate', 'G3340', 'From ''metanoeō,'' meaning ''to change one''s mind,'' ''to repent.'' This is a call for a fundamental shift in one''s thinking and attitude, leading to a turning away from sin and towards God. It involves acknowledging one''s wrongdoing, expressing sorrow, and committing to a new direction in life aligned with God''s will.', 1),
  ('ἐπιστρέψατε', 'epistrepsate', 'G1994', 'From ''epistrephō,'' meaning ''to turn back,'' ''to return,'' ''to convert.'' This word complements ''metanoeō'' by emphasizing the active turning away from a previous course of life (sin) and turning towards God. It signifies a conversion, a reorientation of one''s entire being towards the divine, resulting in a transformed life.', 2),
  ('ἐξαλειφθῆναι', 'exaleiphthēnai', 'G1813', 'From ''exaleiphō,'' meaning ''to wipe out,'' ''to blot out,'' ''to erase completely.'' This powerful imagery conveys the complete removal and forgiveness of sins, as if they were written down and then entirely erased from a record. It signifies God''s complete pardon and the removal of guilt and condemnation, making a fresh start possible.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 19;

-- Verse 21
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('οὐρανὸν', 'ouranon', 'G3772', 'Meaning ''heaven'' or ''the sky.'' In this context, it refers to the spiritual realm where God dwells and where Jesus ascended after His resurrection. It signifies Jesus'' current location, awaiting the appointed time for His return to earth to complete God''s redemptive plan. It emphasizes His divine authority and temporary absence.', 1),
  ('ἀποκαταστάσεως', 'apokatastaseōs', 'G605', 'From ''apokatastasis,'' meaning ''restoration,'' ''restitution,'' ''re-establishment.'' This refers to the ultimate renewal and reordering of all things to their original, perfect state, as intended by God before the Fall. It encompasses the restoration of creation, humanity, and all aspects of God''s kingdom, culminating in a new heaven and new earth.', 2),
  ('προφητῶν', 'prophētōn', 'G4396', 'From ''prophētēs,'' meaning ''prophet,'' one who speaks for God, foretelling future events or proclaiming God''s will. Peter emphasizes that the ''restitution of all things'' was not a new idea but was consistently spoken of by ''all his holy prophets since the world began,'' highlighting the continuity of God''s redemptive plan throughout history.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 21;

-- Verse 26
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀναστήσας', 'anastēsas', 'G450', 'From ''anistēmi,'' meaning ''to raise up,'' ''to cause to stand.'' Here, it refers to God raising Jesus from the dead, emphasizing the divine act that vindicated Jesus and inaugurated the new covenant. It also carries the sense of God ''raising up'' Jesus as the Messiah, fulfilling prophetic expectations.', 1),
  ('εὐλογοῦντα', 'eulogounta', 'G2127', 'From ''eulogeō,'' meaning ''to bless,'' ''to speak well of.'' God sent Jesus ''to bless'' His people. This blessing is not primarily material but spiritual, centered on deliverance from sin. It signifies God''s favor and the bestowal of spiritual benefits through Christ, fulfilling the Abrahamic covenant.', 2),
  ('ἀποστρέφειν', 'apostrephein', 'G654', 'From ''apostrephō,'' meaning ''to turn away,'' ''to turn back.'' The blessing of Jesus is realized ''in turning away every one of you from his iniquities.'' This emphasizes that true blessing involves repentance and a moral transformation, a turning from evil to righteousness. It is the practical outcome of receiving God''s grace.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = 26;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Psalm 55:17', 1),
  (1, 'Daniel 6:10', 2),
  (1, 'Luke 24:53', 3),
  (1, 'Acts 2:46', 4),
  (2, 'John 9:1-2', 1),
  (2, 'Luke 16:20', 2),
  (2, 'Acts 4:22', 3),
  (2, 'Acts 14:8', 4),
  (3, 'Luke 18:35-43', 1),
  (3, 'John 9:8', 2),
  (4, 'Acts 1:10', 1),
  (4, 'Acts 6:15', 2),
  (4, 'Acts 10:4', 3),
  (6, 'Matthew 10:8', 1),
  (6, 'Mark 16:17-18', 2),
  (6, 'Luke 10:19', 3),
  (6, 'Acts 4:10', 4),
  (6, 'Acts 9:34', 5),
  (7, 'Isaiah 35:6', 1),
  (7, 'Matthew 9:6', 2),
  (7, 'Acts 9:41', 3),
  (8, 'Isaiah 35:6', 1),
  (8, 'Luke 17:15-18', 2),
  (8, 'Acts 2:46-47', 3),
  (10, 'John 9:8-9', 1),
  (10, 'Acts 4:16', 2),
  (11, 'John 10:23', 1),
  (11, 'Acts 5:12', 2),
  (12, 'Acts 14:15', 1),
  (12, 'Romans 1:16', 2),
  (12, '1 Corinthians 1:29-31', 3),
  (13, 'Exodus 3:6', 1),
  (13, 'Isaiah 52:13', 2),
  (13, 'Matthew 27:20-25', 3),
  (13, 'John 19:15-16', 4),
  (13, 'Acts 2:23', 5),
  (14, 'Psalm 16:10', 1),
  (14, 'Isaiah 53:11', 2),
  (14, 'Matthew 27:17-21', 3),
  (14, 'Luke 23:18-25', 4),
  (15, 'Acts 2:24', 1),
  (15, 'Acts 2:32', 2),
  (15, 'Acts 5:30-32', 3),
  (15, 'Hebrews 2:10', 4),
  (15, 'Hebrews 12:2', 5),
  (16, 'Acts 4:10', 1),
  (16, 'Acts 14:9', 2),
  (16, 'Romans 3:22', 3),
  (16, 'Galatians 2:16', 4),
  (17, 'Luke 23:34', 1),
  (17, 'John 16:3', 2),
  (17, '1 Corinthians 2:8', 3),
  (17, '1 Timothy 1:13', 4),
  (18, 'Psalm 22:1-18', 1),
  (18, 'Isaiah 53:1-12', 2),
  (18, 'Luke 24:25-27', 3),
  (18, 'Luke 24:44-46', 4),
  (18, 'Acts 2:23', 5),
  (19, 'Isaiah 44:22', 1),
  (19, 'Joel 2:13', 2),
  (19, 'Acts 2:38', 3),
  (19, 'Titus 3:5', 4),
  (20, 'Acts 1:11', 1),
  (20, 'Acts 17:31', 2),
  (20, 'Hebrews 9:28', 3),
  (21, 'Isaiah 11:6-9', 1),
  (21, 'Isaiah 65:17-25', 2),
  (21, 'Matthew 17:11', 3),
  (21, 'Romans 8:19-23', 4),
  (21, 'Revelation 21:1-5', 5),
  (22, 'Deuteronomy 18:15', 1),
  (22, 'Deuteronomy 18:18-19', 2),
  (22, 'John 1:45', 3),
  (22, 'John 6:14', 4),
  (22, 'Acts 7:37', 5),
  (23, 'Deuteronomy 18:19', 1),
  (23, 'Leviticus 23:29', 2),
  (23, 'Hebrews 2:2-3', 3),
  (23, 'Hebrews 10:28-29', 4),
  (24, '1 Samuel 3:20', 1),
  (24, 'Luke 24:27', 2),
  (24, 'Acts 10:43', 3),
  (25, 'Genesis 12:3', 1),
  (25, 'Genesis 22:18', 2),
  (25, 'Galatians 3:8', 3),
  (25, 'Galatians 3:16', 4),
  (25, 'Romans 9:4', 5),
  (26, 'Matthew 1:21', 1),
  (26, 'Luke 24:47', 2),
  (26, 'Romans 1:16', 3),
  (26, 'Titus 2:14', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 3 Complete!
-- 26 verses · 7 key verses with word studies (21 words)
-- Cross-references for 24 verses (91 refs)
-- ═══════════════════════════════════════════════════════