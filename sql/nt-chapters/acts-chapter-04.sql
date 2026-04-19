-- ═══════════════════════════════════════════════════════
-- ACTS CHAPTER 4 — Bold Witness and Divine Empowerment Amidst Persecution
-- 37 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Acts Chapter 4 provides a pivotal account of the early church''s confrontation with religious authorities in Jerusalem. Following the healing of a lame man, Peter and John are arrested and brought before the Sanhedrin, including Annas and Caiaphas. Peter, filled with the Holy Spirit, boldly proclaims Jesus as the only source of salvation, linking the miracle directly to Christ''s resurrection. The council, unable to deny the miracle but threatened by the apostles'' message, forbids them from speaking in Jesus'' name. Peter and John defiantly declare their commitment to obey God rather than men. Upon their release, the believers gather for prayer, experiencing a fresh outpouring of the Holy Spirit and renewed boldness. The chapter concludes by highlighting the radical communal life of the early church, characterized by unity, sharing of possessions, and powerful witness to the resurrection, exemplified by Barnabas.',
  'Bold Witness and Divine Empowerment Amidst Persecution',
  'παρρησία (parrēsia)',
  'Derived from ''πᾶς'' (pas, ''all'') and ''ῥῆσις'' (rhēsis, ''speech''), meaning ''freedom of speech'' or ''boldness.'' In the New Testament, it signifies confidence, courage, and outspokenness, especially in proclaiming the gospel despite opposition. It reflects a divine enablement to speak God''s truth without fear, a hallmark of the Spirit-filled believer.',
  '["Section 1 (vv.1-4): Arrest of Peter and John; Growth of the Church","Section 2 (vv.5-12): Peter''s Bold Defense Before the Sanhedrin","Section 3 (vv.13-22): The Council''s Reaction and Threat","Section 4 (vv.23-31): The Believers'' Prayer for Boldness and Divine Empowerment","Section 5 (vv.32-37): The Unity and Generosity of the Early Christian Community"]'
FROM books b WHERE b.name = 'Acts';

-- Step 2: Insert all 37 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And as they spake unto the people, the priests, and the captain of the temple, and the Sadducees, came upon them,',
   'Λαλούντων δὲ αὐτῶν πρὸς τὸν λαὸν παρεστήσαν αὐτοῖς οἱ ἱερεῖς καὶ ὁ στρατηγὸς τοῦ ἱεροῦ καὶ οἱ Σαδδουκαῖοι,',
   'Lalountōn de autōn pros ton laon parestēsan autois hoi hiereis kai ho stratēgos tou hierou kai hoi Saddoukaioi,',
   'This verse marks the beginning of official opposition to the apostles'' ministry. The ''priests'' (ἱερεῖς) were likely those on duty, while the ''captain of the temple'' (ὁ στρατηγὸς τοῦ ἱεροῦ) was a high-ranking officer responsible for maintaining order. The ''Sadducees'' (Σαδδουκαῖοι) were a powerful aristocratic sect, primarily concerned with temple worship and political stability, and notably denied the resurrection of the dead (Acts 23:8). Their presence indicates a significant religious and political challenge to the apostles'' message.',
   NULL),
  (2,
   'Being grieved that they taught the people, and preached through Jesus the resurrection from the dead.',
   'διαπονούμενοι διὰ τὸ διδάσκειν αὐτοὺς τὸν λαὸν καὶ καταγγέλλειν ἐν τῷ Ἰησοῦ τὴν ἀνάστασιν τὴν ἐκ νεκρῶν,',
   'diaponoumenoi dia to didaskein autous ton laon kai katangellein en tō Iēsou tēn anastasin tēn ek nekrōn,',
   'The core grievance of the Sadducees was the apostles'' teaching of ''the resurrection from the dead'' (τὴν ἀνάστασιν τὴν ἐκ νεκρῶν) ''through Jesus'' (ἐν τῷ Ἰησοῦ). This doctrine directly contradicted Sadducean theology, which rejected the resurrection. Furthermore, associating the resurrection with Jesus, whom they had condemned, was a direct challenge to their authority and a potential incitement of the people (Acts 2:24, 32; 3:15).',
   'The resurrection of Jesus is central to the Christian faith, validating His claims and providing the foundation for hope in eternal life. The Sadducees'' opposition highlights the fundamental theological divide between those who accept and those who reject this core truth (1 Cor 15:13-19).'),
  (3,
   'And they laid hands on them, and put them in hold unto the next day: for it was now eventide.',
   'καὶ ἐπέβαλον αὐτοῖς τὰς χεῖρας καὶ ἔθεντο εἰς τήρησιν εἰς τὴν αὔριον· ἦν γὰρ ἑσπέρα ἤδη.',
   'kai epebalein autois tas cheiras kai ethento eis tērēsin eis tēn aurion; ēn gar hespera ēdē.',
   'The authorities ''laid hands on them'' (ἐπέβαλον αὐτοῖς τὰς χεῖρας), signifying arrest, and ''put them in hold'' (ἔθεντο εἰς τήρησιν), meaning they were detained. The delay until ''the next day'' (εἰς τὴν αὔριον) was due to it being ''eventide'' (ἑσπέρα ἤδη), making a formal hearing impossible according to Jewish legal custom, which typically avoided trials at night.',
   NULL),
  (4,
   'Howbeit many of them which heard the word believed; and the number of the men was about five thousand.',
   'Πολλοὶ δὲ τῶν ἀκουσάντων τὸν λόγον ἐπίστευσαν, καὶ ἐγενήθη ὁ ἀριθμὸς τῶν ἀνδρῶν ὡσεὶ χιλιάδες πέντε.',
   'Polloi de tōn akousantōn ton logon episteusan, kai egenēthē ho arithmos tōn andrōn hōsei chiliades pente.',
   'Despite the arrest, the preaching had a profound effect. ''Many of them which heard the word believed'' (Πολλοὶ δὲ τῶν ἀκουσάντων τὸν λόγον ἐπίστευσαν). This verse records a significant numerical growth, with the number of men reaching ''about five thousand'' (ὡσεὶ χιλιάδες πέντε). This figure likely refers to the total number of male believers, adding to the previous 3,000 (Acts 2:41), demonstrating the rapid expansion of the early church even in the face of opposition.',
   'The growth of the church, even under persecution, testifies to the power of God''s Word and the Holy Spirit. Salvation is a gift received through faith in the preached ''word'' (λόγον), demonstrating God''s sovereignty in drawing people to Himself (Rom 10:17).'),
  (5,
   'And it came to pass on the morrow, that their rulers, and elders, and scribes,',
   'Ἐγένετο δὲ ἐπὶ τὴν αὔριον συναχθῆναι αὐτῶν τοὺς ἄρχοντας καὶ πρεσβυτέρους καὶ γραμματεῖς ἐν Ἱερουσαλήμ,',
   'Egeneto de epi tēn aurion synachthēnai autōn tous archontas kai presbyterous kai grammateis en Hierousalēm,',
   'The next day, the Sanhedrin, the supreme Jewish judicial and legislative body, convened. It comprised ''rulers'' (ἄρχοντας), ''elders'' (πρεσβυτέρους), and ''scribes'' (γραμματεῖς). This assembly represented the highest religious and political authority in Jerusalem, indicating the seriousness with which they viewed the apostles'' activities.',
   NULL),
  (6,
   'And Annas the high priest, and Caiaphas, and John, and Alexander, and as many as were of the kindred of the high priest, were gathered together at Jerusalem.',
   'καὶ Ἄνναν τὸν ἀρχιερέα καὶ Καϊάφαν καὶ Ἰωάννην καὶ Ἀλέξανδρον καὶ ὅσοι ἦσαν ἐκ γένους ἀρχιερατικοῦ,',
   'kai Annan ton archierea kai Kaiaphan kai Iōannēn kai Alexandron kai hosoi ēsan ek genous archieratikou,',
   'Specific prominent members of the Sanhedrin are named: ''Annas the high priest'' (Ἄνναν τὸν ἀρχιερέα), who, though officially deposed by the Romans, still held immense influence and was considered the true high priest by many Jews; and ''Caiaphas'' (Καϊάφαν), his son-in-law, who was the reigning high priest (John 18:13). ''John'' and ''Alexander'' are less known but were likely influential figures from the ''high priestly family'' (γένους ἀρχιερατικοῦ). This powerful group had previously condemned Jesus (John 18:24).',
   NULL),
  (7,
   'And when they had set them in the midst, they asked, By what power, or by what name, have ye done this?',
   'καὶ στήσαντες αὐτοὺς ἐν τῷ μέσῳ ἐπυνθάνοντο, Ἐν ποίᾳ δυνάμει ἢ ἐν ποίῳ ὀνόματι ἐποιήσατε τοῦτο ὑμεῖς;',
   'kai stēsantes autous en tō mesō epynthamonto, En poia dynamei ē en poiō onomati epoiēsate touto hymeis?',
   'The apostles were placed ''in the midst'' (ἐν τῷ μέσῳ) of the council, a position of vulnerability for interrogation. The question, ''By what power, or by what name, have ye done this?'' (Ἐν ποίᾳ δυνάμει ἢ ἐν ποίῳ ὀνόματι ἐποιήσατε τοῦτο ὑμεῖς;) was a direct challenge to their authority. It sought to ascertain whether they acted by divine power (from God), by demonic power, or by human authority, and under whose sanction they performed the miracle and preached.',
   'This question highlights the fundamental issue of authority. True spiritual authority comes from God, often manifested ''in the name'' (ἐν ὀνόματι) of Jesus, signifying His person, power, and authorization. This contrasts with human or demonic power, which lacks divine sanction and ultimate efficacy (Matt 7:22-23).'),
  (8,
   'Then Peter, filled with the Holy Ghost, said unto them, Ye rulers of the people, and elders of Israel,',
   'Τότε Πέτρος πλησθεὶς Πνεύματος Ἁγίου εἶπεν πρὸς αὐτούς, Ἄρχοντες τοῦ λαοῦ καὶ πρεσβύτεροι τοῦ Ἰσραήλ,',
   'Tote Petros plēstheis Pneumatos Hagiou eipen pros autous, Archontes tou laou kai presbyteroi tou Israēl,',
   'Peter''s response is prefaced by the crucial detail that he was ''filled with the Holy Ghost'' (πλησθεὶς Πνεύματος Ἁγίου). This fulfillment was not a one-time event (cf. Acts 2:4) but a fresh empowerment for the specific task of bearing witness before hostile authorities, fulfilling Jesus'' promise (Matt 10:19-20; Luke 12:11-12). He addresses them respectfully as ''Rulers of the people and elders of Israel'' (Ἄρχοντες τοῦ λαοῦ καὶ πρεσβύτεροι τοῦ Ἰσραήλ), acknowledging their position before delivering a bold message.',
   NULL),
  (9,
   'If we this day be examined of the good deed done to the impotent man, by what means he is made whole;',
   'εἰ ἡμεῖς σήμερον ἀνακρινόμεθα ἐπὶ εὐεργεσίᾳ ἀνθρώπου ἀσθενοῦς, ἐν τίνι οὗτος σέσωσται,',
   'ei hēmeis sēmeron anakrinometha epi euergesia anthrōpou asthenous, en tini houtos sesōstai,',
   'Peter frames the interrogation ironically: they are being examined ''concerning a good deed done to the impotent man'' (ἐπὶ εὐεργεσίᾳ ἀνθρώπου ἀσθενοῦς). The word ''εὐεργεσίᾳ'' (euergesia) means ''benefaction'' or ''good deed,'' highlighting the positive nature of the miracle. The question is ''by what means he is made whole'' (ἐν τίνι οὗτος σέσωσται), using the verb ''σῴζω'' (sōzō), which can mean both physical healing and spiritual salvation, subtly introducing the deeper theological implications.',
   NULL),
  (10,
   'Be it known unto you all, and to all the people of Israel, that by the name of Jesus Christ of Nazareth, whom ye crucified, whom God raised from the dead, even by him doth this man stand here before you whole.',
   'γνωστὸν ἔστω πᾶσιν ὑμῖν καὶ παντὶ τῷ λαῷ Ἰσραὴλ ὅτι ἐν τῷ ὀνόματι Ἰησοῦ Χριστοῦ τοῦ Ναζωραίου, ὃν ὑμεῖς ἐσταυρώσατε, ὃν ὁ Θεὸς ἤγειρεν ἐκ νεκρῶν, ἐν τούτῳ οὗτος παρέστηκεν ἐνώπιον ὑμῶν ὑγιής.',
   'gnōston estō pasin hymin kai panti tō laō Israēl hoti en tō onomati Iēsou Christou tou Nazōraiou, hon hymeis estaurōsate, hon ho Theos ēgeiren ek nekrōn, en toutō houtos parestēken enōpion hymōn hygiēs.',
   'Peter''s declaration is direct and confrontational. He explicitly names ''Jesus Christ of Nazareth'' (Ἰησοῦ Χριστοῦ τοῦ Ναζωραίου) as the source of the healing, emphasizing that it was ''in His name'' (ἐν τῷ ὀνόματι). He then directly implicates the Sanhedrin: ''whom ye crucified'' (ὃν ὑμεῖς ἐσταυρώσατε), and contrasts their action with God''s: ''whom God raised from the dead'' (ὃν ὁ Θεὸς ἤγειρεν ἐκ νεκρῶν). This is a powerful kerygmatic statement, presenting the core of the gospel message to his accusers.',
   'This verse presents the foundational elements of the gospel: the identity of Jesus as Christ, His crucifixion by human hands, and His divine resurrection. The ''name of Jesus'' (ὀνόματι Ἰησοῦ) signifies His authority and power, through which both physical healing and spiritual salvation are accomplished. It underscores God''s reversal of human judgment.'),
  (11,
   'This is the stone which was set at nought of you builders, which is become the head of the corner.',
   'οὗτός ἐστιν ὁ λίθος ὁ ἐξουθενηθεὶς ὑφ’ ὑμῶν τῶν οἰκοδόμων, ὁ γενόμενος εἰς κεφαλὴν γωνίας.',
   'houtos estin ho lithos ho exouthenētheis hyph'' hymōn tōn oikodomōn, ho genomenos eis kephalēn gōnias.',
   'Peter quotes Psalm 118:22, applying it directly to Jesus and the Sanhedrin. Jesus is ''the stone which was set at nought of you builders'' (ὁ λίθος ὁ ἐξουθενηθεὶς ὑφ’ ὑμῶν τῶν οἰκοδόμων). The ''builders'' (οἰκοδόμων) are the Jewish leaders, who rejected Jesus. Yet, this rejected stone ''is become the head of the corner'' (ὁ γενόμενος εἰς κεφαλὴν γωνίας), meaning He is the indispensable cornerstone or capstone, essential for the entire structure of God''s redemptive plan. This metaphor powerfully asserts Jesus'' supreme importance despite their rejection.',
   'Jesus as the ''cornerstone'' (κεφαλὴν γωνίας) is a key Christological doctrine, signifying His foundational and unifying role in God''s spiritual temple, the church. This prophecy, fulfilled in Christ, demonstrates God''s sovereign plan to exalt the one rejected by human authority (Eph 2:20; 1 Pet 2:7).'),
  (12,
   'Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved.',
   'καὶ οὐκ ἔστιν ἐν ἄλλῳ οὐδενὶ ἡ σωτηρία· οὐδὲ γὰρ ὄνομα ἕτερον ὑπὸ τὸν οὐρανὸν τὸ δεδομένον ἐν ἀνθρώποις ἐν ᾧ δεῖ σωθῆναι ἡμᾶς.',
   'kai ouk estin en allō oudeni hē sōtēria; oude gar onoma heteron hypo ton ouranon to dedomenon en anthrōpois en hō dei sōthēnai hēmas.',
   'This is a definitive statement of Christian exclusivity. Peter declares, ''Neither is there salvation in any other'' (οὐκ ἔστιν ἐν ἄλλῳ οὐδενὶ ἡ σωτηρία). He asserts that ''there is none other name under heaven given among men, whereby we must be saved'' (οὐδὲ γὰρ ὄνομα ἕτερον ὑπὸ τὸν οὐρανὸν τὸ δεδομένον ἐν ἀνθρώποις ἐν ᾧ δεῖ σωθῆναι ἡμᾶς). This ''name'' refers to the person and work of Jesus Christ alone. It is a direct challenge to any other religious or philosophical system claiming to offer a path to salvation, emphasizing the unique and indispensable role of Jesus.',
   'This verse is a cornerstone of Christian theology, affirming that ''salvation'' (σωτηρία) is exclusively found in Jesus Christ. It underscores the uniqueness of Christ''s redemptive work and the necessity of faith in His ''name'' (ὄνομα) for eternal life. This truth has profound implications for evangelism and interfaith dialogue (John 14:6; 1 Tim 2:5).'),
  (13,
   'Now when they saw the boldness of Peter and John, and perceived that they were unlearned and ignorant men, they marvelled; and they took knowledge of them, that they had been with Jesus.',
   'Θεωροῦντες δὲ τὴν τοῦ Πέτρου παρρησίαν καὶ Ἰωάννου, καὶ καταλαβόμενοι ὅτι ἄνθρωποι ἀγράμματοί εἰσιν καὶ ἰδιῶται, ἐθαύμαζον, ἐπεγίνωσκόν τε αὐτοὺς ὅτι σὺν τῷ Ἰησοῦ ἦσαν.',
   'Theōrountes de tēn tou Petrou parrēsian kai Iōannou, kai katalabomenoi hoti anthrōpoi agrammatoi eisin kai idiōtai, ethaumazon, epeginōskon te autous hoti syn tō Iēsou ēsan.',
   'The Sanhedrin was astonished by the ''boldness'' (παρρησίαν) of Peter and John. They ''perceived that they were unlearned and ignorant men'' (ὅτι ἄνθρωποι ἀγράμματοί εἰσιν καὶ ἰδιῶται). ''Ἀγράμματοι'' (agrammatoi) means ''unlettered'' or lacking formal rabbinic training, while ''ἰδιῶται'' (idiōtai) implies ''common'' or ''unskilled'' in public speaking. Their education was not from the prestigious schools. Yet, their confidence and wisdom led the council to ''take knowledge of them, that they had been with Jesus'' (ἐπεγίνωσκόν τε αὐτοὺς ὅτι σὺν τῷ Ἰησοῦ ἦσαν), recognizing the transformative influence of their association with Christ.',
   NULL),
  (14,
   'And beholding the man which was healed standing with them, they could say nothing against it.',
   'τὸν δὲ ἄνθρωπον βλέποντες σὺν αὐτοῖς ἑστῶτα τὸν τεθεραπευμένον, οὐδὲν εἶχον ἀντειπεῖν.',
   'ton de anthrōpon blepontes syn autois hestōta ton tetherapeumenon, ouden eichon anteipein.',
   'The presence of ''the man which was healed standing with them'' (τὸν δὲ ἄνθρωπον βλέποντες σὺν αὐτοῖς ἑστῶτα τὸν τεθεραπευμένον) was irrefutable evidence. His physical transformation was a visible, undeniable fact that ''they could say nothing against it'' (οὐδὲν εἶχον ἀντειπεῖν). This public miracle validated the apostles'' claims and rendered the council speechless, highlighting the power of God''s work over human opposition.',
   NULL),
  (15,
   'But when they had commanded them to go aside out of the council, they conferred among themselves,',
   'κελεύσαντες δὲ αὐτοὺς ἔξω τοῦ συνεδρίου ἀπελθεῖν, συνέβαλλον πρὸς ἀλλήλους',
   'keleusantes de autous exō tou synedriou apelthein, syneballon pros allēlous',
   'To strategize, the council ''commanded them to go aside out of the council'' (κελεύσαντες δὲ αὐτοὺς ἔξω τοῦ συνεδρίου ἀπελθεῖν). This allowed the Sanhedrin to confer ''among themselves'' (συνέβαλλον πρὸς ἀλλήλους) without the apostles present, indicating their need for private deliberation on how to handle this unprecedented situation.',
   NULL),
  (16,
   'Saying, What shall we do to these men? for that indeed a notable miracle hath been done by them is manifest to all them that dwell in Jerusalem; and we cannot deny it.',
   'λέγοντες, Τί ποιήσωμεν τοῖς ἀνθρώποις τούτοις; ὅτι μὲν γὰρ γνωστὸν σημεῖον γέγονεν δι’ αὐτῶν πᾶσιν τοῖς κατοικοῦσιν Ἱερουσαλὴμ φανερόν, καὶ οὐ δυνάμεθα ἀρνεῖσθαι.',
   'legontes, Ti poiēsōmen tois anthrōpois toutois? hoti men gar gnōston sēmeion gegonen di'' autōn pasin tois katoikousin Hierousalēm phaneron, kai ou dynametha arneisthai.',
   'The council''s dilemma is clear: ''What shall we do to these men?'' (Τί ποιήσωμεν τοῖς ἀνθρώποις τούτοις;). They openly admit that ''a notable miracle hath been done by them is manifest to all them that dwell in Jerusalem'' (γνωστὸν σημεῖον γέγονεν δι’ αὐτῶν πᾶσιν τοῖς κατοικοῦσιν Ἱερουσαλὴμ φανερόν), and ''we cannot deny it'' (οὐ δυνάμεθα ἀρνεῖσθαι). The term ''σημεῖον'' (sēmeion) refers to a ''sign'' or ''miracle'' that points to a deeper truth. Their inability to deny the fact of the miracle forced them to consider other strategies to suppress the message.',
   NULL),
  (17,
   'But that it spread no further among the people, let us straitly threaten them, that they speak henceforth to no man in this name.',
   'ἀλλ’ ἵνα μὴ ἐπὶ πλεῖον διανεμηθῇ εἰς τὸν λαόν, ἀπειλῇ ἀπειλησώμεθα αὐτοῖς μηκέτι λαλεῖν ἐπὶ τῷ ὀνόματι τούτῳ μηδενὶ ἀνθρώπων.',
   'all'' hina mē epi pleion dianemēthē eis ton laon, apeilē apeilēsōmetha autois mēketi lalein epi tō onomati toutō mēdeni anthrōpōn.',
   'Their strategy was to prevent the message from spreading ''further among the people'' (ἐπὶ πλεῖον διανεμηθῇ εἰς τὸν λαόν). They decided to ''straitly threaten them'' (ἀπειλῇ ἀπειλησώμεθα αὐτοῖς), using a strong warning or intimidation, ''that they speak henceforth to no man in this name'' (μηκέτι λαλεῖν ἐπὶ τῷ ὀνόματι τούτῳ μηδενὶ ἀνθρώπων). The focus was on suppressing the ''name'' (ὀνόματι) of Jesus, recognizing its power and influence.',
   NULL),
  (18,
   'And they called them, and commanded them not to speak at all nor teach in the name of Jesus.',
   'καὶ καλέσαντες αὐτοὺς παρήγγειλαν αὐτοῖς τὸ καθόλου μὴ φθέγγεσθαι μηδὲ διδάσκειν ἐπὶ τῷ ὀνόματι τοῦ Ἰησοῦ.',
   'kai kalesantes autous parēngeilan autois to katholou mē phthengesthai mēde didaskein epi tō onomati tou Iēsou.',
   'The council formally ''commanded them not to speak at all nor teach in the name of Jesus'' (τὸ καθόλου μὴ φθέγγεσθαι μηδὲ διδάσκειν ἐπὶ τῷ ὀνόματι τοῦ Ἰησοῦ). This was a direct prohibition against both public proclamation (''speak'') and formal instruction (''teach''). The phrase ''τὸ καθόλου'' (to katholou) emphasizes the absolute nature of the prohibition – ''not at all.'' This was an attempt to silence the nascent Christian movement at its source.',
   NULL),
  (19,
   'But Peter and John answered and said unto them, Whether it be right in the sight of God to hearken unto you more than unto God, judge ye.',
   'Ὁ δὲ Πέτρος καὶ Ἰωάννης ἀποκριθέντες εἶπον πρὸς αὐτούς, Εἰ δίκαιόν ἐστιν ἐνώπιον τοῦ Θεοῦ ὑμῶν ἀκούειν μᾶλλον ἢ τοῦ Θεοῦ, κρίνατε.',
   'Ho de Petros kai Iōannēs apokrithentes eipon pros autous, Ei dikaion estin enōpion tou Theou hymōn akouein mallon ē tou Theou, krinate.',
   'Peter and John''s response is a classic declaration of civil disobedience rooted in higher obedience to God. They challenge the council directly: ''Whether it be right in the sight of God to hearken unto you more than unto God, judge ye'' (Εἰ δίκαιόν ἐστιν ἐνώπιον τοῦ Θεοῦ ὑμῶν ἀκούειν μᾶλλον ἢ τοῦ Θεοῦ, κρίνατε). They appeal to the council''s own conscience and understanding of divine justice, implying that the answer is self-evident. This sets a precedent for believers facing unjust human laws that contradict God''s commands.',
   'This verse articulates a fundamental principle of Christian ethics: when human laws or commands conflict with divine commands, believers must obey God rather than men. The question of what is ''right'' (δίκαιον) is ultimately determined by God''s will, not human authority, establishing a hierarchy of obedience (Dan 3:16-18; 6:10; Acts 5:29).'),
  (20,
   'For we cannot but speak the things which we have seen and heard.',
   'οὐ δυνάμεθα γὰρ ἡμεῖς ἃ εἴδομεν καὶ ἠκούσαμεν μὴ λαλεῖν.',
   'ou dynametha gar hēmeis ha eidomen kai ēkousamen mē lalein.',
   'The apostles explain their inability to comply: ''For we cannot but speak the things which we have seen and heard'' (οὐ δυνάμεθα γὰρ ἡμεῖς ἃ εἴδομεν καὶ ἠκούσαμεν μὴ λαλεῖν). Their witness is based on personal, eyewitness experience of Jesus'' life, death, resurrection, and the outpouring of the Holy Spirit. This is not merely an opinion but a compelling truth that they are morally and spiritually bound to proclaim. Their conviction is rooted in direct encounter with divine reality.',
   'The Christian witness is not based on speculation but on verifiable ''seen and heard'' (εἴδομεν καὶ ἠκούσαμεν) realities concerning Jesus Christ. This personal encounter creates an internal compulsion to share the gospel, demonstrating that true faith is transformative and inherently evangelistic (1 John 1:1-3; 1 Cor 9:16).'),
  (21,
   'So when they had further threatened them, they let them go, finding nothing how they might punish them, because of the people: for all men glorified God for that which was done.',
   'οἱ δὲ προσαπειλησάμενοι ἀπέλυσαν αὐτούς, μηδὲν εὑρίσκοντες τὸ πῶς κολάσωνται αὐτούς, διὰ τὸν λαόν, ὅτι πάντες ἐδόξαζον τὸν Θεὸν ἐπὶ τῷ γεγονότι.',
   'hoi de prosapeilēsamenoi apelysan autous, mēden heuriskontes to pōs kolasōntai autous, dia ton laon, hoti pantes edoxazon ton Theon epi tō gegonoti.',
   'The council, after ''further threatening them'' (προσαπειλησάμενοι), released the apostles. They could find ''nothing how they might punish them'' (μηδὲν εὑρίσκοντες τὸ πῶς κολάσωνται αὐτούς) primarily ''because of the people'' (διὰ τὸν λαόν). The public''s positive reaction to the miracle was overwhelming: ''all men glorified God for that which was done'' (πάντες ἐδόξαζον τὸν Θεὸν ἐπὶ τῷ γεγονότι). The fear of a popular uprising prevented the Sanhedrin from taking harsher action, demonstrating God''s protection over His servants.',
   NULL),
  (22,
   'For the man was above forty years old, on whom this miracle of healing was shewed.',
   'ἐτῶν γὰρ πλειόνων τεσσαράκοντα ἦν ὁ ἄνθρωπος ἐφ’ ὃν γεγόνει τὸ σημεῖον τοῦτο τῆς ἰάσεως.',
   'etōn gar pleionōn tessarakonta ēn ho anthrōpos eph'' hon gegonei to sēmeion touto tēs iaseōs.',
   'This verse provides an important detail about the healed man: he ''was above forty years old'' (ἐτῶν γὰρ πλειόνων τεσσαράκοντα ἦν). This emphasizes the severity and long-standing nature of his infirmity, making the miracle even more undeniable and impressive. A man lame for over forty years would be well-known in Jerusalem, further solidifying the public''s conviction that a genuine ''sign of healing'' (σημεῖον τοῦτο τῆς ἰάσεως) had occurred.',
   NULL),
  (23,
   'And being let go, they went to their own company, and reported all that the chief priests and elders had said unto them.',
   'Ἀπολυθέντες δὲ ἦλθον πρὸς τοὺς ἰδίους καὶ ἀπήγγειλαν ὅσα πρὸς αὐτοὺς οἱ ἀρχιερεῖς καὶ οἱ πρεσβύτεροι εἶπον.',
   'Apolythente de ēlthen pros tous idious kai apēngeilan hosa pros autous hoi archiereis kai hoi presbyteroi eipon.',
   'Upon their release, Peter and John immediately returned ''to their own company'' (πρὸς τοὺς ἰδίους), meaning the community of believers. They ''reported all that the chief priests and elders had said unto them'' (ἀπήγγειλαν ὅσα πρὸς αὐτοὺς οἱ ἀρχιερεῖς καὶ οἱ πρεσβύτεροι εἶπον). This act of sharing their experience fostered unity and allowed the entire community to participate in the spiritual battle and respond collectively.',
   NULL),
  (24,
   'And when they heard that, they lifted up their voice to God with one accord, and said, Lord, thou art God, which hast made heaven, and earth, and the sea, and all that in them is:',
   'οἱ δὲ ἀκούσαντες ὁμοθυμαδὸν ἦραν φωνὴν πρὸς τὸν Θεὸν καὶ εἶπον, Δέσποτα, σὺ ὁ ποιήσας τὸν οὐρανὸν καὶ τὴν γῆν καὶ τὴν θάλασσαν καὶ πάντα τὰ ἐν αὐτοῖς,',
   'hoi de akousantes homothymadon ēran phōnēn pros ton Theon kai eipon, Despota, sy ho poiēsas ton ouranon kai tēn gēn kai tēn thalassan kai panta ta en autois,',
   'In response to the report, the believers ''lifted up their voice to God with one accord'' (ὁμοθυμαδὸν ἦραν φωνὴν πρὸς τὸν Θεὸν). The term ''ὁμοθυμαδὸν'' (homothymadon) signifies a powerful unity of mind and spirit. Their prayer begins by acknowledging God''s supreme sovereignty as ''Lord, thou art God, which hast made heaven, and earth, and the sea, and all that in them is'' (Δέσποτα, σὺ ὁ ποιήσας τὸν οὐρανὸν καὶ τὴν γῆν καὶ τὴν θάλασσαν καὶ πάντα τὰ ἐν αὐτοῖς). This foundational truth grounds their petition in God''s omnipotence and creative power.',
   'The believers'' unified prayer, beginning with an affirmation of God''s absolute sovereignty as Creator (''Δέσποτα''), demonstrates a proper theological foundation for petition. Recognizing God''s ultimate power over all creation provides confidence that He can intervene in human affairs and overcome any opposition (Ps 146:5-6; Isa 42:5).'),
  (25,
   'Who by the mouth of thy servant David hast said, Why did the heathen rage, and the people imagine vain things?',
   'ὁ τοῦ πατρὸς ἡμῶν Δαυεὶδ διὰ Πνεύματος Ἁγίου εἰπών, Ἵνα τί ἐφρύαξαν ἔθνη καὶ λαοὶ ἐμελέτησαν κενά;',
   'ho tou patros hēmōn Dauid dia Pneumatos Hagiou eipōn, Hina ti ephryaxan ethnē kai laoi emeletēsan kena?',
   'The prayer continues by quoting Psalm 2:1-2, attributing it to ''thy servant David'' (τοῦ πατρὸς ἡμῶν Δαυεὶδ) who spoke ''by the mouth of... the Holy Ghost'' (διὰ Πνεύματος Ἁγίου). The quote, ''Why did the heathen rage, and the people imagine vain things?'' (Ἵνα τί ἐφρύαξαν ἔθνη καὶ λαοὶ ἐμελέτησαν κενά;), highlights the futility of human opposition against God''s plan. This demonstrates their understanding that current events were not random but part of a divine, foretold narrative.',
   'The attribution of David''s prophecy to the ''Holy Ghost'' (Πνεύματος Ἁγίου) affirms the divine inspiration of Scripture. The rhetorical question about the ''rage'' (ἐφρύαξαν) of nations and ''vain things'' (κενά) imagined by peoples underscores the ultimate impotence of human rebellion against God''s sovereign will (Ps 2:1-2; 2 Tim 3:16).'),
  (26,
   'The kings of the earth stood up, and the rulers were gathered together against the Lord, and against his Christ.',
   'παρέστησαν οἱ βασιλεῖς τῆς γῆς καὶ οἱ ἄρχοντες συνήχθησαν ἐπὶ τὸ αὐτὸ κατὰ τοῦ Κυρίου καὶ κατὰ τοῦ Χριστοῦ αὐτοῦ.',
   'parestēsan hoi basileis tēs gēs kai hoi archontes synēchthēsan epi to auto kata tou Kyriou kai kata tou Christou autou.',
   'Continuing the quote from Psalm 2:2, the prayer identifies the ''kings of the earth'' (οἱ βασιλεῖς τῆς γῆς) and ''rulers'' (οἱ ἄρχοντες) as those who ''stood up... against the Lord, and against his Christ'' (κατὰ τοῦ Κυρίου καὶ κατὰ τοῦ Χριστοῦ αὐτοῦ). This directly applies the ancient prophecy to the contemporary situation, recognizing that the Sanhedrin''s opposition to Jesus and His followers was part of a larger, divinely anticipated pattern of rebellion against God and His Anointed One (Christos).',
   'This verse highlights the ongoing conflict between human authority and divine sovereignty. The ''kings of the earth'' (βασιλεῖς τῆς γῆς) and ''rulers'' (ἄρχοντες) represent all forms of human power that oppose God and His ''Christ'' (Χριστοῦ), the Messiah. This cosmic struggle is a recurring theme in biblical eschatology, affirming God''s ultimate triumph (Ps 2:2; Rev 19:19).'),
  (27,
   'For of a truth against thy holy child Jesus, whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Israel, were gathered together,',
   'συνήχθησαν γὰρ ἐπ’ ἀληθείας ἐν τῇ πόλει ταύτῃ ἐπὶ τὸν ἅγιον παῖδά σου Ἰησοῦν, ὃν ἔχρισας, Ἡρῴδης τε καὶ Πόντιος Πιλᾶτος σὺν ἔθνεσιν καὶ λαοῖς Ἰσραήλ,',
   'synēchthēsan gar ep'' alētheias en tē polei tautē epi ton hagion paida sou Iēsoun, hon echrisas, Hērōdēs te kai Pontios Pilatos syn ethnesin kai laois Israēl,',
   'The believers explicitly connect Psalm 2 to the historical events surrounding Jesus'' crucifixion. They declare that ''of a truth'' (ἐπ’ ἀληθείας) in Jerusalem, ''Herod, and Pontius Pilate, with the Gentiles, and the people of Israel'' (Ἡρῴδης τε καὶ Πόντιος Πιλᾶτος σὺν ἔθνεσιν καὶ λαοῖς Ἰσραήλ) ''were gathered together against thy holy child Jesus, whom thou hast anointed'' (ἐπὶ τὸν ἅγιον παῖδά σου Ἰησοῦν, ὃν ἔχρισας). This demonstrates their understanding that both Jewish and Roman authorities conspired against God''s Messiah, fulfilling prophecy.',
   NULL),
  (28,
   'For to do whatsoever thy hand and thy counsel determined before to be done.',
   'ποιῆσαι ὅσα ἡ χείρ σου καὶ ἡ βουλὴ σου προώρισεν γενέσθαι.',
   'poiēsai hosa hē cheir sou kai hē boulē sou proōrisen genesthai.',
   'Crucially, the prayer acknowledges God''s sovereign control even over the evil actions of men. Herod, Pilate, Gentiles, and Israel acted ''to do whatsoever thy hand and thy counsel determined before to be done'' (ποιῆσαι ὅσα ἡ χείρ σου καὶ ἡ βουλὴ σου προώρισεν γενέσθαι). This is not to say God caused their sin, but that He incorporated their sinful choices into His overarching, predetermined plan for salvation. God''s ''hand'' (χείρ) signifies His power, and His ''counsel'' (βουλὴ) His divine will and purpose.',
   'This verse powerfully articulates the doctrine of divine sovereignty and predestination. Even the most heinous act in history – the crucifixion of Christ – occurred within the bounds of God''s predetermined ''counsel'' (βουλὴ) and ''hand'' (χείρ). This does not negate human responsibility but affirms God''s ultimate control over all events, ensuring His redemptive purposes are fulfilled (Isa 46:10; Eph 1:11).'),
  (29,
   'And now, Lord, behold their threatenings: and grant unto thy servants, that with all boldness they may speak thy word,',
   'καὶ τὰ νῦν, Κύριε, ἔφιδε ἐπὶ τὰς ἀπειλὰς αὐτῶν, καὶ δὸς τοῖς δούλοις σου μετὰ παρρησίας πάσης λαλεῖν τὸν λόγον σου,',
   'kai ta nyn, Kyrie, ephide epi tas apeilas autōn, kai dos tois doulois sou meta parrēsias pasēs lalein ton logon sou,',
   'Having affirmed God''s sovereignty, the believers now petition Him. They ask God to ''behold their threatenings'' (ἔφιδε ἐπὶ τὰς ἀπειλὰς αὐτῶν), not for vengeance, but for divine intervention. Their primary request is not for protection from persecution, but for ''grant unto thy servants, that with all boldness they may speak thy word'' (δὸς τοῖς δούλοις σου μετὰ παρρησίας πάσης λαλεῖν τὸν λόγον σου). ''Παρρησίας'' (parrēsias) here means courageous, unhindered speech, essential for gospel proclamation.',
   'This prayer demonstrates a mature understanding of spiritual warfare. Instead of praying for the removal of threats, the believers pray for ''boldness'' (παρρησίας) to continue proclaiming God''s ''word'' (λόγον). This highlights that the primary need in the face of opposition is not safety but spiritual empowerment to fulfill the divine commission (Eph 6:19-20; Phil 1:20).'),
  (30,
   'By stretching forth thine hand to heal; and that signs and wonders may be done by the name of thy holy child Jesus.',
   'ἐν τῷ τὴν χεῖρά σου ἐκτείνειν σε εἰς ἴασιν καὶ σημεῖα καὶ τέρατα γίνεσθαι διὰ τοῦ ὀνόματος τοῦ ἁγίου παιδός σου Ἰησοῦ.',
   'en tō tēn cheira sou ekteinein se eis iasin kai sēmeia kai terata ginesthai dia tou onomatos tou hagiou paidos sou Iēsou.',
   'Their request for boldness is coupled with a prayer for God to ''stretch forth thine hand to heal; and that signs and wonders may be done by the name of thy holy child Jesus'' (ἐν τῷ τὴν χεῖρά σου ἐκτείνειν σε εἰς ἴασιν καὶ σημεῖα καὶ τέρατα γίνεσθαι διὰ τοῦ ὀνόματος τοῦ ἁγίου παιδός σου Ἰησοῦ). They recognize that miraculous ''healing'' (ἴασιν), ''signs'' (σημεῖα), and ''wonders'' (τέρατα) are powerful confirmations of the spoken word, authenticating their message and demonstrating God''s active presence ''through the name of Jesus'' (διὰ τοῦ ὀνόματος τοῦ ἁγίου παιδός σου Ἰησοῦ).',
   'This prayer connects the proclamation of the Word with the demonstration of God''s power through ''signs and wonders'' (σημεῖα καὶ τέρατα). These miraculous manifestations, performed ''in the name of Jesus'' (διὰ τοῦ ὀνόματος τοῦ ἁγίου παιδός σου Ἰησοῦ), serve to confirm the truth of the gospel and authenticate the messengers, empowering evangelism (Mark 16:20; Heb 2:4).'),
  (31,
   'And when they had prayed, the place was shaken where they were assembled together; and they were all filled with the Holy Ghost, and they spake the word of God with boldness.',
   'Καὶ δεηθέντων αὐτῶν ἐσαλεύθη ὁ τόπος ἐν ᾧ ἦσαν συνηγμένοι, καὶ ἐπλήσθησαν ἅπαντες Πνεύματος Ἁγίου, καὶ ἐλάλουν τὸν λόγον τοῦ Θεοῦ μετὰ παρρησίας.',
   'Kai deēthentōn autōn esaleuthē ho topos en hō ēsan synēgmenoi, kai eplēsthēsan hapantes Pneumatos Hagiou, kai elaloun ton logon tou Theou meta parrēsias.',
   'God immediately and dramatically answered their prayer. ''The place was shaken where they were assembled together'' (ἐσαλεύθη ὁ τόπος ἐν ᾧ ἦσαν συνηγμένοι), a physical manifestation of God''s presence and power, reminiscent of Sinai (Exod 19:18). More importantly, ''they were all filled with the Holy Ghost'' (ἐπλήσθησαν ἅπαντες Πνεύματος Ἁγίου), a renewed outpouring of the Spirit. The direct result was that ''they spake the word of God with boldness'' (ἐλάλουν τὸν λόγον τοῦ Θεοῦ μετὰ παρρησίας), precisely what they had requested. This demonstrates the Spirit''s role in empowering witness.',
   'The shaking of the place and the renewed ''filling with the Holy Ghost'' (ἐπλήσθησαν ἅπαντες Πνεύματος Ἁγίου) signify a fresh anointing for ministry. This empowerment directly resulted in speaking God''s ''word with boldness'' (λόγον τοῦ Θεοῦ μετὰ παρρησίας), illustrating the Spirit''s essential role in enabling believers to overcome fear and proclaim the gospel effectively (Acts 2:4; Eph 5:18).'),
  (32,
   'And the multitude of them that believed were of one heart and of one soul: neither said any of them that ought of the things which he possessed was his own; but they had all things common.',
   'Τοῦ δὲ πλήθους τῶν πιστευσάντων ἦν καρδία καὶ ψυχὴ μία, καὶ οὐδὲ εἷς τι τῶν ὑπαρχόντων αὐτῷ ἔλεγεν ἴδιον εἶναι, ἀλλ’ ἦν αὐτοῖς πάντα κοινά.',
   'Tou de plēthous tōn pisteusantōn ēn kardia kai psychē mia, kai oude heis ti tōn hyparchontōn autō elegen idion einai, all'' ēn autois panta koina.',
   'This verse describes the remarkable unity and communal life of the early church. The ''multitude of them that believed were of one heart and of one soul'' (ἦν καρδία καὶ ψυχὴ μία), indicating profound spiritual and relational harmony. This unity extended to their possessions: ''neither said any of them that ought of the things which he possessed was his own; but they had all things common'' (οὐδὲ εἷς τι τῶν ὑπαρχόντων αὐτῷ ἔλεγεν ἴδιον εἶναι, ἀλλ’ ἦν αὐτοῖς πάντα κοινά). This was a voluntary, Spirit-inspired generosity, not a forced communalism, reflecting a deep commitment to one another and the gospel.',
   'The ''one heart and one soul'' (καρδία καὶ ψυχὴ μία) of the believers exemplifies the spiritual unity that the Holy Spirit fosters within the church. Their practice of holding ''all things common'' (πάντα κοινά) demonstrates a radical generosity and detachment from material possessions, prioritizing the needs of the community and reflecting a kingdom-oriented worldview (Phil 2:2-4; 1 John 3:17-18).'),
  (33,
   'And with great power gave the apostles witness of the resurrection of the Lord Jesus: and great grace was upon them all.',
   'καὶ δυνάμει μεγάλῃ ἀπεδίδουν τὸ μαρτύριον οἱ ἀπόστολοι τῆς ἀναστάσεως τοῦ Κυρίου Ἰησοῦ, χάρις τε μεγάλη ἦν ἐπὶ πάντας αὐτούς.',
   'kai dynamei megalē apedidoun to martyrion hoi apostoloi tēs anastaseōs tou Kyriou Iēsou, charis te megalē ēn epi pantas autous.',
   'The apostles continued to give ''witness of the resurrection of the Lord Jesus'' (τὸ μαρτύριον οἱ ἀπόστολοι τῆς ἀναστάσεως τοῦ Κυρίου Ἰησοῦ) ''with great power'' (δυνάμει μεγάλῃ). This power was both spiritual (from the Holy Spirit) and evident in their miraculous works and bold proclamation. As a result, ''great grace was upon them all'' (χάρις τε μεγάλη ἦν ἐπὶ πάντας αὐτούς), indicating God''s favor, blessing, and empowering presence, which was visible to both believers and outsiders.',
   'The ''great power'' (δυνάμει μεγάλῃ) with which the apostles bore ''witness of the resurrection'' (μαρτύριον τῆς ἀναστάσεως) highlights the central message of the early church. The accompanying ''great grace'' (χάρις τε μεγάλη) signifies God''s unmerited favor and enabling presence, which empowers ministry and fosters spiritual growth within the community (Rom 1:16; 1 Cor 15:3-4).'),
  (34,
   'Neither was there any among them that lacked: for as many as were possessors of lands or houses sold them, and brought the prices of the things that were sold,',
   'οὐδὲ γὰρ ἐνδεής τις ὑπῆρχεν ἐν αὐτοῖς· ὅσοι γὰρ κτήτορες χωρίων ἢ οἰκιῶν ὑπῆρχον, πωλοῦντες ἔφερον τὰς τιμὰς τῶν πιπρασκομένων',
   'oude gar endeēs tis hypērchen en autois; hosoi gar ktētores chōriōn ē oikiōn hypērchon, pōlountes epheron tas timas tōn pipraskomenōn',
   'The communal sharing ensured that ''neither was there any among them that lacked'' (οὐδὲ γὰρ ἐνδεής τις ὑπῆρχεν ἐν αὐτοῖς). This was achieved through voluntary acts of generosity: ''as many as were possessors of lands or houses sold them'' (ὅσοι γὰρ κτήτορες χωρίων ἢ οἰκιῶν ὑπῆρχον, πωλοῦντες ἔφερον). They ''brought the prices of the things that were sold'' (ἔφερον τὰς τιμὰς τῶν πιπρασκομένων) to the apostles. This was not a command for all time but a spontaneous response to immediate needs and the fervent spiritual climate of the early church.',
   NULL),
  (35,
   'And laid them down at the apostles’ feet: and distribution was made unto every man according as he had need.',
   'καὶ ἐτίθουν παρὰ τοὺς πόδας τῶν ἀποστόλων· διεδίδοτο δὲ ἑκάστῳ καθότι ἄν τις χρείαν εἶχεν.',
   'kai etithoun para tous podas tōn apostolōn; diedidoto de hekastō kathoti an tis chreian eichen.',
   'The proceeds from the sales were ''laid them down at the apostles’ feet'' (ἐτίθουν παρὰ τοὺς πόδας τῶν ἀποστόλων). This gesture symbolized submission to apostolic authority and trust in their stewardship. The apostles then oversaw the ''distribution... unto every man according as he had need'' (διεδίδοτο δὲ ἑκάστῳ καθότι ἄν τις χρείαν εἶχεν). This systematic and equitable distribution ensured that the needs of the poor and vulnerable within the community were met, demonstrating practical love and social justice.',
   NULL),
  (36,
   'And Joses, who by the apostles was surnamed Barnabas, (which is, being interpreted, The son of consolation,) a Levite, and of the country of Cyprus,',
   'Ἰωσὴφ δὲ ὁ ἐπικληθεὶς Βαρνάβας ὑπὸ τῶν ἀποστόλων, ὅ ἐστιν μεθερμηνευόμενον υἱὸς παρακλήσεως, Λευίτης, Κύπριος τῷ γένει,',
   'Iōsēph de ho epiklētheis Barnabas hypo tōn apostolōn, ho estin methermēneuomenon huios paraklēseōs, Leuites, Kyprion tō genei,',
   'This verse introduces ''Joses'' (Ἰωσὴφ), who was ''surnamed Barnabas by the apostles'' (ἐπικληθεὶς Βαρνάβας ὑπὸ τῶν ἀποστόλων). His new name, ''Barnabas,'' is interpreted as ''The son of consolation'' (υἱὸς παρακλήσεως), reflecting his character as an encourager and comforter. He is identified as a ''Levite'' (Λευίτης), a member of the priestly tribe, and ''of the country of Cyprus'' (Κύπριος τῷ γένει). Barnabas will become a significant figure in Acts, serving as a missionary companion to Paul (Acts 13:2).',
   NULL),
  (37,
   'Having land, sold it, and brought the money, and laid it at the apostles’ feet.',
   'ὑπάρχοντος αὐτῷ ἀγροῦ πωλήσας ἤνεγκεν τὸ χρῆμα καὶ ἔθηκεν παρὰ τοὺς πόδας τῶν ἀποστόλων.',
   'hyparchontos autō agrou pōlēsas ēnenken to chrēma kai ethēken para tous podas tōn apostolōn.',
   'Barnabas serves as a prime example of the generous spirit described in verses 34-35. He ''having land, sold it'' (ὑπάρχοντος αὐτῷ ἀγροῦ πωλήσας) and ''brought the money, and laid it at the apostles’ feet'' (ἤνεγκεν τὸ χρῆμα καὶ ἔθηκεν παρὰ τοὺς πόδας τῶν ἀποστόλων). His act of self-sacrificial giving was a tangible expression of his commitment to the community and the gospel, setting a positive example for others and foreshadowing his future ministry of encouragement and support.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Acts' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('διαπονούμενοι', 'diaponoumenoi', 'G1278', 'From ''διά'' (dia, through) and ''πονέω'' (poneō, to toil, labor). It means ''to be greatly distressed,'' ''annoyed,'' or ''indignant.'' Here, it conveys the Sadducees'' deep vexation and grief over the apostles'' teaching, particularly the resurrection, which challenged their theological and political standing. It signifies intense emotional disturbance.', 1),
  ('ἀνάστασιν', 'anastasin', 'G386', 'From ''ἀνίστημι'' (anistēmi, to stand up). It means ''resurrection,'' a standing up again, especially from the dead. Theologically, it refers to the bodily raising of Jesus from the dead, which is the cornerstone of Christian faith and hope. It also encompasses the future resurrection of believers, signifying victory over death and new life in Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 2;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὀνόματι', 'onomati', 'G3686', 'From ''ὄνομα'' (onoma, name). It refers to a name, but in a broader sense, it signifies the person, authority, character, and power associated with that name. To act ''in the name of Jesus'' means to act by His authority, according to His character, and with His power, making Him present and effective through the action.', 1),
  ('ἐσταυρώσατε', 'estaurōsate', 'G4717', 'From ''σταυρόω'' (stauroō, to crucify). It means ''you crucified.'' This verb directly implicates the Jewish leaders in the death of Jesus, emphasizing their active role in His execution. Theologically, the crucifixion is central to atonement, where Christ bore the penalty for sin, making salvation possible for humanity.', 2),
  ('ἤγειρεν', 'ēgeiren', 'G1453', 'From ''ἐγείρω'' (egeirō, to raise up). It means ''He raised.'' Here, it refers to God the Father raising Jesus from the dead. This divine act validates Jesus'' claims, demonstrates God''s power over death, and confirms Jesus as the Son of God. The resurrection is the ultimate proof of Christ''s victory and the hope of believers.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 10;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σωτηρία', 'sōtēria', 'G4991', 'From ''σῴζω'' (sōzō, to save). It means ''salvation,'' ''deliverance,'' ''preservation,'' or ''safety.'' Theologically, it refers to God''s act of delivering humanity from sin, death, and judgment through Jesus Christ. It encompasses spiritual, physical, and eternal well-being, providing reconciliation with God and eternal life.', 1),
  ('σωθῆναι', 'sōthēnai', 'G4982', 'From ''σῴζω'' (sōzō, to save). This is the aorist passive infinitive, meaning ''to be saved.'' It denotes the experience of receiving salvation, emphasizing that salvation is a divine act performed upon individuals. It implies deliverance from peril, healing, and ultimately, eternal life through faith in Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 12;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παρρησίαν', 'parrēsian', 'G3954', 'From ''πᾶς'' (pas, all) and ''ῥῆσις'' (rhēsis, speech). It means ''boldness,'' ''courage,'' ''frankness,'' or ''freedom of speech.'' In the New Testament, it often describes the confidence and fearlessness with which believers proclaim the gospel, especially in the face of opposition. It is a gift of the Holy Spirit, enabling clear and unhindered witness.', 1),
  ('ἀγράμματοί', 'agrammatoi', 'G65', 'From ''α'' (a, not) and ''γράμμα'' (gramma, letter). It means ''unlettered,'' ''illiterate,'' or ''uneducated'' in a formal sense. It implies a lack of formal rabbinic training or schooling, distinguishing Peter and John from the learned scribes and Pharisees. This highlights that their wisdom came from divine rather than human sources.', 2),
  ('ἰδιῶται', 'idiōtai', 'G2399', 'From ''ἴδιος'' (idios, one''s own). It means ''private person,'' ''layman,'' ''unskilled,'' or ''ignorant'' in a professional or public sense. It suggests they were common people, not trained or eloquent speakers. The combination with ''agrammatoi'' emphasizes their lack of formal qualifications, making their boldness and wisdom even more remarkable.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 13;

-- Verse 19
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δίκαιόν', 'dikaion', 'G1342', 'From ''δίκη'' (dikē, right, justice). It means ''right,'' ''just,'' ''righteous,'' or ''equitable.'' Here, it refers to what is morally correct and in accordance with divine law. Peter and John appeal to a higher standard of justice, implying that obeying God''s command to preach is inherently more ''right'' than obeying human prohibitions.', 1),
  ('ἀκούειν', 'akouein', 'G191', 'From ''ἀκούω'' (akouō, to hear). It means ''to hear,'' ''to listen,'' or ''to obey.'' In this context, it carries the sense of ''hearken to'' or ''obey.'' The apostles challenge the council to consider whether obedience to human authority should supersede obedience to God''s explicit command, highlighting the ethical dilemma of conflicting loyalties.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 19;

-- Verse 29
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔφιδε', 'ephide', 'G2029', 'From ''ἐφοράω'' (ephoraō, to look upon). It means ''look upon,'' ''behold,'' or ''consider.'' In this prayer, it is a petition for God to take notice of the threats, not necessarily for immediate vengeance, but for His divine attention and intervention. It conveys a sense of appealing to God as the ultimate judge and protector.', 1),
  ('παρρησίας', 'parrēsias', 'G3954', 'From ''πᾶς'' (pas, all) and ''ῥῆσις'' (rhēsis, speech). It means ''boldness,'' ''courage,'' ''frankness,'' or ''freedom of speech.'' Here, it is the specific quality the believers pray for: the ability to speak God''s word without fear or hesitation, even in the face of intimidation and persecution. It is a spiritual endowment for effective witness.', 2),
  ('λαλεῖν', 'lalein', 'G2980', 'From ''λαλέω'' (laleō, to speak). It means ''to speak,'' ''to talk,'' or ''to proclaim.'' In this context, it refers to the act of verbalizing and communicating God''s message. The prayer for ''boldness to speak'' emphasizes the importance of oral proclamation in spreading the gospel, even when it is met with hostility.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 29;

-- Verse 32
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καρδία', 'kardia', 'G2588', 'It refers to the physical heart, but metaphorically, it denotes the center of one''s being, including thoughts, emotions, will, and moral character. ''One heart'' signifies unity of purpose, affection, and moral disposition among the believers, reflecting a profound spiritual harmony and shared commitment to Christ.', 1),
  ('ψυχὴ', 'psychē', 'G5590', 'It refers to the soul, life, or inner self, encompassing one''s personality, desires, and vital essence. ''One soul'' alongside ''one heart'' emphasizes a deep, holistic unity among the believers, extending to their very identity and life''s direction. It speaks of a shared life and common spiritual identity in Christ.', 2),
  ('κοινά', 'koina', 'G2839', 'From ''κοινός'' (koinos, common). It means ''common,'' ''shared,'' or ''public.'' Here, it describes the believers'' practice of holding their possessions in common, meaning they were shared resources available to all according to need. This reflects a radical generosity and detachment from personal ownership, driven by love and unity in the Spirit.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = 32;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Acts 5:17', 1),
  (1, 'Acts 6:12', 2),
  (1, 'Acts 23:6-8', 3),
  (2, 'Acts 2:24', 1),
  (2, 'Acts 3:15', 2),
  (2, '1 Cor 15:13-19', 3),
  (3, 'Acts 5:18', 1),
  (3, 'Acts 12:4', 2),
  (3, 'Matt 26:57', 3),
  (4, 'Acts 2:41', 1),
  (4, 'Acts 5:14', 2),
  (4, 'Rom 10:17', 3),
  (5, 'Luke 22:66', 1),
  (5, 'Acts 22:30', 2),
  (5, 'Acts 23:28', 3),
  (6, 'Luke 3:2', 1),
  (6, 'John 11:49', 2),
  (6, 'John 18:13', 3),
  (7, 'Acts 3:12', 1),
  (7, 'Matt 21:23', 2),
  (7, 'Exod 2:14', 3),
  (8, 'Acts 2:4', 1),
  (8, 'Acts 7:55', 2),
  (8, 'Matt 10:19-20', 3),
  (9, 'Acts 3:6-8', 1),
  (9, 'Acts 3:16', 2),
  (9, 'John 5:6', 3),
  (10, 'Acts 2:23-24', 1),
  (10, 'Acts 3:13-15', 2),
  (10, 'Phil 2:9-11', 3),
  (11, 'Ps 118:22', 1),
  (11, 'Isa 28:16', 2),
  (11, 'Matt 21:42', 3),
  (11, '1 Pet 2:7', 4),
  (12, 'John 14:6', 1),
  (12, '1 Tim 2:5', 2),
  (12, 'Acts 10:43', 3),
  (13, 'Matt 11:25', 1),
  (13, '1 Cor 1:27', 2),
  (13, 'John 7:15', 3),
  (13, 'John 18:15-16', 4),
  (14, 'Acts 3:9-10', 1),
  (14, 'John 9:16-17', 2),
  (15, 'Acts 5:34', 1),
  (16, 'Acts 3:10', 1),
  (16, 'John 11:47-48', 2),
  (17, 'Acts 5:28', 1),
  (17, 'Acts 5:40', 2),
  (18, 'Acts 5:40', 1),
  (18, 'Acts 5:28', 2),
  (19, 'Acts 5:29', 1),
  (19, 'Exod 1:17', 2),
  (19, 'Dan 3:16-18', 3),
  (19, 'Matt 22:21', 4),
  (20, 'Acts 1:8', 1),
  (20, 'Acts 2:32', 2),
  (20, '1 John 1:1-3', 3),
  (21, 'Acts 5:26', 1),
  (21, 'Matt 21:26', 2),
  (21, 'Luke 20:6', 3),
  (22, 'Acts 3:2', 1),
  (23, 'Acts 12:12', 1),
  (24, 'Exod 20:11', 1),
  (24, 'Ps 146:5-6', 2),
  (24, 'Isa 42:5', 3),
  (25, 'Ps 2:1-2', 1),
  (25, '2 Tim 3:16', 2),
  (26, 'Ps 2:2', 1),
  (26, 'Rev 19:19', 2),
  (27, 'Luke 23:1-12', 1),
  (27, 'Acts 2:36', 2),
  (27, 'Acts 3:18', 3),
  (28, 'Acts 2:23', 1),
  (28, 'Isa 46:10', 2),
  (28, 'Eph 1:11', 3),
  (29, 'Acts 4:13', 1),
  (29, 'Acts 4:31', 2),
  (29, 'Eph 6:19-20', 3),
  (30, 'Acts 2:43', 1),
  (30, 'Acts 3:6', 2),
  (30, 'Mark 16:20', 3),
  (30, 'Heb 2:4', 4),
  (31, 'Acts 2:2', 1),
  (31, 'Acts 2:4', 2),
  (31, 'Acts 4:8', 3),
  (31, 'Eph 5:18', 4),
  (32, 'Acts 2:44-45', 1),
  (32, 'Phil 2:2', 2),
  (32, '1 John 3:17-18', 3),
  (33, 'Acts 1:22', 1),
  (33, 'Acts 2:47', 2),
  (33, 'Acts 6:8', 3),
  (34, 'Acts 2:45', 1),
  (34, 'Acts 5:1-2', 2),
  (34, '2 Cor 8:13-15', 3),
  (35, 'Acts 6:1-2', 1),
  (35, 'Deut 15:4', 2),
  (36, 'Acts 9:27', 1),
  (36, 'Acts 11:22-26', 2),
  (36, 'Acts 13:2', 3),
  (37, 'Acts 5:1-2', 1),
  (37, 'Matt 19:21', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Acts' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Acts Chapter 4 Complete!
-- 37 verses · 7 key verses with word studies (18 words)
-- Cross-references for 37 verses (102 refs)
-- ═══════════════════════════════════════════════════════