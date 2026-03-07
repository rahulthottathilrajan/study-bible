-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 16 — The Collection, Final Plans, and Greetings
-- 24 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 16,
  '1 Corinthians 16 transitions from the theological heights of the resurrection (ch.15) to practical matters of church life — demonstrating that doctrine always issues in duty. Paul begins with instructions for ''the collection for the saints'' in Jerusalem (vv.1-4), directing each Corinthian to set aside money on the first day of the week, proportionate to income, ''that there be no gatherings when I come'' (v.2). He outlines his travel plans: he will come through Macedonia and may winter with the Corinthians (vv.5-9), noting that ''a great door and effectual is opened unto me, and there are many adversaries'' (v.9) — opportunity and opposition go hand in hand. He commends Timothy (vv.10-11) and mentions Apollos'' reluctance to visit at present (v.12). The chapter then delivers a rapid series of exhortations: ''Watch ye, stand fast in the faith, quit you like men, be strong. Let all your things be done with charity'' (vv.13-14). Paul commends the household of Stephanas as the ''firstfruits of Achaia'' who ''addicted themselves to the ministry of the saints'' (v.15), urging submission to such laborers (v.16). He notes the refreshing arrival of Stephanas, Fortunatus, and Achaicus (vv.17-18). The letter closes with greetings from the churches of Asia, from Aquila and Priscilla and their house church (v.19), the holy kiss (v.20), Paul''s autograph as authentication (v.21), the solemn anathema ''If any man love not the Lord Jesus Christ, let him be Anathema Maranatha'' (v.22), and a benediction of grace and love (vv.23-24).',
  'Practical Charity, Apostolic Plans, and Final Exhortations in Love',
  'ἀγάπη (agapē)',
  'Love — the same word that crowned the ''more excellent way'' of chapter 13 now governs the practical life of the church. ''Let all your things be done with charity'' (v.14) is the summary principle: collections, travel plans, leadership, greetings, even warnings (v.22) are all expressions of agapē. The closing words — ''My love be with you all in Christ Jesus'' (v.24) — frame the entire letter in love.',
  '["The Collection for the Saints in Jerusalem (vv.1-4): Now concerning the collection for the saints as I have given order to the churches of Galatia even so do ye. Upon the first day of the week let every one of you lay by him in store as God hath prospered him that there be no gatherings when I come","Paul''s Travel Plans and the Open Door (vv.5-9): Now I will come unto you when I shall pass through Macedonia. But I will tarry at Ephesus until Pentecost for a great door and effectual is opened unto me and there are many adversaries","Timothy, Apollos, and the Commendation of Laborers (vv.10-12): Now if Timotheus come see that he may be with you without fear for he worketh the work of the Lord as I also do. As touching our brother Apollos I greatly desired him to come unto you with the brethren but his will was not at all to come at this time","Exhortations to Vigilance and Love (vv.13-14): Watch ye stand fast in the faith quit you like men be strong. Let all your things be done with charity","The Household of Stephanas and Final Greetings (vv.15-20): I beseech you brethren ye know the house of Stephanas that it is the firstfruits of Achaia and that they have addicted themselves to the ministry of the saints. The churches of Asia salute you. Aquila and Priscilla salute you much in the Lord with the church that is in their house","Paul''s Autograph, Anathema Maranatha, and Benediction (vv.21-24): The salutation of me Paul with mine own hand. If any man love not the Lord Jesus Christ let him be Anathema Maranatha. The grace of our Lord Jesus Christ be with you. My love be with you all in Christ Jesus Amen"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now concerning the collection for the saints, as I have given order to the churches of Galatia, even so do ye.',
   'Περὶ δὲ τῆς λογείας τῆς εἰς τοὺς ἁγίους ὥσπερ διέταξα ταῖς ἐκκλησίαις τῆς Γαλατίας οὕτως καὶ ὑμεῖς ποιήσατε',
   'Peri de tēs logeias tēs eis tous hagious hōsper dietaxa tais ekklēsiais tēs Galatias houtōs kai hymeis poiēsate',
   '''Collection'' (logeias — a gathering of money, a contribution; used in the papyri for religious collections). ''For the saints'' (eis tous hagious — for the holy ones; the impoverished Jewish Christians in Jerusalem, cf. Romans 15:25-27). ''As I have given order'' (dietaxa — I directed, I arranged). The same instructions went to the Galatian churches — this was a coordinated, inter-church relief effort. Paul sees financial generosity as a tangible expression of the unity between Gentile and Jewish believers.',
   NULL),
  (2, 'Upon the first day of the week let every one of you lay by him in store, as God hath prospered him, that there be no gatherings when I come.',
   'κατὰ μίαν σαββάτων ἕκαστος ὑμῶν παρ᾿ ἑαυτῷ τιθέτω θησαυρίζων ὅ τι ἂν εὐοδῶται ἵνα μὴ ὅταν ἔλθω τότε λογεῖαι γίνωνται',
   'kata mian sabbatōn hekastos hymōn par heautō tithetō thēsaurizōn ho ti an euodōtai hina mē hotan elthō tote logeiai ginōntai',
   '''First day of the week'' (mian sabbatōn — the first day after the Sabbath, i.e., Sunday; evidence of early Christian worship on the Lord''s Day). ''Let every one'' (hekastos — each individual, without exception). ''Lay by in store'' (tithetō thēsaurizōn — let him set aside, storing up). ''As God hath prospered him'' (ho ti an euodōtai — whatever he may be prospered in; proportional giving, not a fixed amount). ''No gatherings when I come'' — Paul wants the collection ready upon arrival, not scrambled together at the last minute.',
   'This verse provides the earliest instruction for regular, systematic, proportional giving on the Lord''s Day. Four principles emerge: (1) Regular — ''upon the first day of the week'' (weekly, on Sunday). (2) Universal — ''every one of you'' (no one is exempt). (3) Individual — ''lay by him in store'' (personal responsibility). (4) Proportional — ''as God hath prospered him'' (according to income, not a flat tax). These principles remain foundational for Christian stewardship.'),
  (3, 'And when I come, whomsoever ye shall approve by your letters, them will I send to bring your liberality unto Jerusalem.',
   'ὅταν δὲ παραγένωμαι οὓς ἐὰν δοκιμάσητε δι᾿ ἐπιστολῶν τούτους πέμψω ἀπενεγκεῖν τὴν χάριν ὑμῶν εἰς Ἱερουσαλήμ',
   'hotan de paragenōmai hous ean dokimasēte di epistolōn toutous pempsō apenenkein tēn charin hymōn eis Hierousalēm',
   '''Approve'' (dokimasēte — test, examine, approve after scrutiny). ''By your letters'' (di epistolōn — with letters of commendation). ''Liberality'' (charin — grace, gracious gift; Paul uses ''grace'' for financial generosity, elevating it). ''Unto Jerusalem'' — the destination of the collection. Paul ensures financial accountability: the Corinthians choose and authorize their own delegates. Paul refuses to handle the money without oversight.',
   NULL),
  (4, 'And if it be meet that I go also, they shall go with me.',
   'ἐὰν δὲ ᾖ ἄξιον τοῦ κἀμὲ πορεύεσθαι σὺν ἐμοὶ πορεύσονται',
   'ean de ē axion tou kame poreuesthai syn emoi poreusontai',
   '''If it be meet'' (ean ē axion — if it is fitting, worthwhile). ''That I go also'' — Paul will personally accompany the collection to Jerusalem if the gift is large enough to warrant apostolic accompaniment. This shows Paul''s sensitivity to both the significance of the gift and the need for financial transparency.',
   NULL),
  (5, 'Now I will come unto you, when I shall pass through Macedonia: for I do pass through Macedonia.',
   'ἐλεύσομαι δὲ πρὸς ὑμᾶς ὅταν Μακεδονίαν διέλθω Μακεδονίαν γὰρ διέρχομαι',
   'eleusomai de pros hymas hotan Makedonian dielthō Makedonian gar dierchomai',
   '''I will come'' (eleusomai — future: Paul intends to visit Corinth). ''Pass through Macedonia'' (Makedonian dielthō — travel through Macedonia first). Paul is writing from Ephesus (v.8) and plans to go north through Macedonia (Philippi, Thessalonica, Berea) before turning south to Corinth. This itinerary is confirmed in Acts 19:21 and 2 Corinthians 1:15-16.',
   NULL),
  (6, 'And it may be that I will abide, yea, and winter with you, that ye may bring me on my journey whithersoever I go.',
   'πρὸς ὑμᾶς δὲ τυχὸν παραμενῶ ἢ καὶ παραχειμάσω ἵνα ὑμεῖς με προπέμψητε οὗ ἐὰν πορεύωμαι',
   'pros hymas de tychon paramenō ē kai paracheimasō hina hymeis me propempsēte hou ean poreuōmai',
   '''Winter with you'' (paracheimasō — spend the winter; sea travel was impossible during winter months, November to March). ''Bring me on my journey'' (propempsēte — send me forward, provide for my journey with supplies, companions, and farewell). Paul hopes for an extended stay in Corinth, not just a brief visit. Wintering there would give time for sustained teaching and relationship building.',
   NULL),
  (7, 'For I will not see you now by the way; but I trust to tarry a while with you, if the Lord permit.',
   'οὐ θέλω γὰρ ὑμᾶς ἄρτι ἐν παρόδῳ ἰδεῖν ἐλπίζω δὲ χρόνον τινὰ ἐπιμεῖναι πρὸς ὑμᾶς ἐὰν ὁ κύριος ἐπιτρέψῃ',
   'ou thelō gar hymas arti en parodō idein elpizō de chronon tina epimeinai pros hymas ean ho kyrios epitrepsē',
   '''By the way'' (en parodō — in passing, on the road). ''If the Lord permit'' (ean ho kyrios epitrepsē — if the Lord allows). Paul does not want a quick stopover but a substantial visit. The conditional ''if the Lord permit'' shows Paul''s submission to divine sovereignty over his travel plans (cf. James 4:15). Even apostolic itineraries are subject to God''s overruling direction.',
   NULL),
  (8, 'But I will tarry at Ephesus until Pentecost.',
   'ἐπιμενῶ δὲ ἐν Ἐφέσῳ ἕως τῆς πεντηκοστῆς',
   'epimenō de en Ephesō heōs tēs pentēkostēs',
   '''Tarry at Ephesus'' (epimenō en Ephesō — I will remain in Ephesus). ''Until Pentecost'' (heōs tēs pentēkostēs — until the Feast of Weeks, 50 days after Passover). This establishes that Paul wrote 1 Corinthians from Ephesus, probably in the spring of AD 55. He plans to stay through Pentecost before departing for Macedonia.',
   NULL),
  (9, 'For a great door and effectual is opened unto me, and there are many adversaries.',
   'θύρα γάρ μοι ἀνέῳγεν μεγάλη καὶ ἐνεργής καὶ ἀντικείμενοι πολλοί',
   'thyra gar moi aneōgen megalē kai energēs kai antikeimenoi polloi',
   '''Door'' (thyra — opportunity for ministry; a metaphor Paul uses elsewhere, cf. 2 Corinthians 2:12, Colossians 4:3). ''Great and effectual'' (megalē kai energēs — large and productive, significant and effective). ''Adversaries'' (antikeimenoi — those who oppose, those set against). Paul sees both great opportunity and great opposition in Ephesus — and the opposition does not make him flee but stay. Opportunity and adversity are companions in gospel ministry.',
   NULL),
  (10, 'Now if Timotheus come, see that he may be with you without fear: for he worketh the work of the Lord, as I also do.',
   'ἐὰν δὲ ἔλθῃ Τιμόθεος βλέπετε ἵνα ἀφόβως γένηται πρὸς ὑμᾶς τὸ γὰρ ἔργον κυρίου ἐργάζεται ὡς καὶ ἐγώ',
   'ean de elthē Timotheos blepete hina aphobōs genētai pros hymas to gar ergon kyriou ergazetai hōs kai egō',
   '''If Timothy come'' — the conditional suggests Timothy''s visit is not certain (he may have been sent via a different route; cf. 4:17). ''Without fear'' (aphobōs — fearlessly, without intimidation). Timothy was young (1 Timothy 4:12) and perhaps timid (2 Timothy 1:7). Paul asks the Corinthians not to intimidate him. ''He worketh the work of the Lord, as I also do'' — Timothy deserves the same respect as Paul himself.',
   NULL),
  (11, 'Let no man therefore despise him: but conduct him forth in peace, that he may come unto me: for I look for him with the brethren.',
   'μή τις οὖν αὐτὸν ἐξουθενήσῃ προπέμψατε δὲ αὐτὸν ἐν εἰρήνῃ ἵνα ἔλθῃ πρός με ἐκδέχομαι γὰρ αὐτὸν μετὰ τῶν ἀδελφῶν',
   'mē tis oun auton exouthenēsē propempsate de auton en eirēnē hina elthē pros me ekdechomai gar auton meta tōn adelphōn',
   '''Despise'' (exouthenēsē — treat with contempt, regard as nothing; the same word used of the Corinthians'' attitude toward ''weaker'' members in ch.1). ''Conduct him forth'' (propempsate — send him on his way, escort and provision him). ''In peace'' (en eirēnē — with goodwill, harmoniously). ''I look for him'' (ekdechomai — I am waiting for him, expecting his return). Paul protects Timothy''s authority and asks for proper treatment of his emissary.',
   NULL),
  (12, 'As touching our brother Apollos, I greatly desired him to come unto you with the brethren: but his will was not at all to come at this time; but he will come when he shall have convenient time.',
   'περὶ δὲ Ἀπολλῶ τοῦ ἀδελφοῦ πολλὰ παρεκάλεσα αὐτὸν ἵνα ἔλθῃ πρὸς ὑμᾶς μετὰ τῶν ἀδελφῶν καὶ πάντως οὐκ ἦν θέλημα ἵνα νῦν ἔλθῃ ἐλεύσεται δὲ ὅταν εὐκαιρήσῃ',
   'peri de Apollō tou adelphou polla parekālesa auton hina elthē pros hymas meta tōn adelphōn kai pantōs ouk ēn thelēma hina nyn elthē eleusetai de hotan eukairēsē',
   '''Apollos'' — the eloquent Alexandrian teacher (Acts 18:24-28) whom some Corinthians had elevated into a rival faction (1:12, 3:4-6). ''I greatly desired him'' (polla parekālesa — I strongly urged him). ''His will was not at all'' (pantōs ouk ēn thelēma — it was absolutely not his desire). Apollos independently decided against visiting — Paul does not command him, and Apollos retains his own judgment. This demonstrates the absence of rivalry between them, refuting the Corinthian factionalism.',
   NULL),
  (13, 'Watch ye, stand fast in the faith, quit you like men, be strong.',
   'γρηγορεῖτε στήκετε ἐν τῇ πίστει ἀνδρίζεσθε κραταιοῦσθε',
   'grēgoreite stēkete en tē pistei andrizesthe krataiousthe',
   'Four staccato imperatives — military in tone. ''Watch'' (grēgoreite — stay awake, be vigilant; from egeirō, to rouse). ''Stand fast'' (stēkete — hold your ground, do not retreat). ''Quit you like men'' (andrizesthe — be courageous, act like warriors; from anēr, a man). ''Be strong'' (krataiousthe — be empowered, grow mighty). This is the rallying cry of a commander to soldiers. After 15 chapters of correction, Paul sends them into battle.',
   NULL),
  (14, 'Let all your things be done with charity.',
   'πάντα ὑμῶν ἐν ἀγάπῃ γινέσθω',
   'panta hymōn en agapē ginesthō',
   '''All your things'' (panta hymōn — everything you do). ''With charity'' (en agapē — in love). This single sentence is the governing principle of the entire epistle. Everything Paul has corrected — divisions (chs.1-4), immorality (chs.5-6), lawsuits (ch.6), marriage (ch.7), food offered to idols (chs.8-10), worship (chs.11-14), even the collection (ch.16) — comes down to this: do everything in love. The love chapter (ch.13) is not a parenthesis but the center of the letter.',
   'This verse functions as the executive summary of the entire letter. Every problem at Corinth stemmed from a failure of love: divisions arose from loveless pride, immorality from loveless license, lawsuits from loveless selfishness, worship chaos from loveless self-display. Paul''s corrective for all of it is agapē — the self-giving love defined in chapter 13. ''Let all your things be done with charity'' is not sentimental but structural: love is the organizing principle of all Christian community life.'),
  (15, 'I beseech you, brethren, (ye know the house of Stephanas, that it is the firstfruits of Achaia, and that they have addicted themselves to the ministry of the saints,)',
   'παρακαλῶ δὲ ὑμᾶς ἀδελφοί οἴδατε τὴν οἰκίαν Στεφανᾶ ὅτι ἐστὶν ἀπαρχὴ τῆς Ἀχαΐας καὶ εἰς διακονίαν τοῖς ἁγίοις ἔταξαν ἑαυτούς',
   'parakalō de hymas adelphoi oidate tēn oikian Stephana hoti estin aparchē tēs Achaias kai eis diakonian tois hagiois etaxan heautous',
   '''Stephanas'' — Paul baptized his household personally (1:16). ''Firstfruits of Achaia'' (aparchē tēs Achaias — the first converts in the province of Achaia, southern Greece). ''Addicted themselves'' (etaxan heautous — they appointed themselves, they voluntarily devoted themselves; from tassō, to arrange, to order). ''Ministry of the saints'' (diakonian tois hagiois — service to God''s people). The household of Stephanas exemplifies self-motivated, persistent service.',
   NULL),
  (16, 'That ye submit yourselves unto such, and to every one that helpeth with us, and laboureth.',
   'ἵνα καὶ ὑμεῖς ὑποτάσσησθε τοῖς τοιούτοις καὶ παντὶ τῷ συνεργοῦντι καὶ κοπιῶντι',
   'hina kai hymeis hypotassēsthe tois toioutois kai panti tō synergounti kai kopiōnti',
   '''Submit'' (hypotassēsthe — arrange yourselves under, recognize their leadership). ''Such'' (tois toioutois — people of this kind, i.e., those who devote themselves to service). ''Helpeth with us'' (synergounti — co-workers, fellow laborers). ''Laboureth'' (kopiōnti — toils, works to exhaustion). Paul urges recognition of and deference to those who actually do the work. Leadership in the church is earned through service, not claimed through title.',
   NULL),
  (17, 'I am glad of the coming of Stephanas and Fortunatus and Achaicus: for that which was lacking on your part they have supplied.',
   'χαίρω δὲ ἐπὶ τῇ παρουσίᾳ Στεφανᾶ καὶ Φουρτουνάτου καὶ Ἀχαϊκοῦ ὅτι τὸ ὑμῶν ὑστέρημα οὗτοι ἀνεπλήρωσαν',
   'chairō de epi tē parousia Stephana kai Phortounatou kai Achaikou hoti to hymōn hysterēma houtoi aneplērōsan',
   '''Coming'' (parousia — presence, arrival). ''Fortunatus and Achaicus'' — otherwise unknown; likely members of Stephanas'' household or church. ''That which was lacking'' (to hymōn hysterēma — your deficiency, what was missing from you). ''Supplied'' (aneplērōsan — filled up, made complete). These three men likely brought the Corinthians'' letter to Paul (cf. 7:1) and supplied the personal presence the Corinthians could not provide across the distance.',
   NULL),
  (18, 'For they have refreshed my spirit and yours: therefore acknowledge ye them that are such.',
   'ἀνέπαυσαν γὰρ τὸ ἐμὸν πνεῦμα καὶ τὸ ὑμῶν ἐπιγινώσκετε οὖν τοὺς τοιούτους',
   'anepausan gar to emon pneuma kai to hymōn epiginōskete oun tous toioutous',
   '''Refreshed'' (anepausan — gave rest to, revived; from anapauo, to cause to rest). ''My spirit and yours'' — their visit refreshed Paul (by bringing news and fellowship) and the Corinthians (by serving as faithful representatives). ''Acknowledge'' (epiginōskete — recognize, give due honor to). Paul urges the community to honor faithful servants — a recurring theme in his closing sections.',
   NULL),
  (19, 'The churches of Asia salute you. Aquila and Priscilla salute you much in the Lord, with the church that is in their house.',
   'ἀσπάζονται ὑμᾶς αἱ ἐκκλησίαι τῆς Ἀσίας ἀσπάζονται ὑμᾶς ἐν κυρίῳ πολλὰ Ἀκύλας καὶ Πρίσκιλλα σὺν τῇ κατ᾿ οἶκον αὐτῶν ἐκκλησίᾳ',
   'aspazontai hymas hai ekklēsiai tēs Asias aspazontai hymas en kyriō polla Akylas kai Priskilla syn tē kat oikon autōn ekklēsia',
   '''Churches of Asia'' — the province of Asia (western Turkey), where Ephesus was the capital. Paul sends greetings from the entire network of Asian churches. ''Aquila and Priscilla'' — the tentmaking couple who worked with Paul in Corinth (Acts 18:2-3) and now hosted a house church in Ephesus. ''The church in their house'' (tē kat oikon autōn ekklēsia) — early Christians met in homes, not purpose-built buildings. House churches were the standard form of assembly in the first century.',
   NULL),
  (20, 'All the brethren greet you. Greet ye one another with an holy kiss.',
   'ἀσπάζονται ὑμᾶς οἱ ἀδελφοὶ πάντες ἀσπάσασθε ἀλλήλους ἐν φιλήματι ἁγίῳ',
   'aspazontai hymas hoi adelphoi pantes aspasasthe allēlous en philēmati hagiō',
   '''Holy kiss'' (philēmati hagiō — a sacred kiss; a customary greeting in the ancient Near East that became a liturgical act in early Christian worship). The kiss expressed unity, reconciliation, and mutual love. ''Holy'' distinguishes it from romantic or merely social kisses. Paul commands it in Romans 16:16, 2 Corinthians 13:12, and 1 Thessalonians 5:26. It was a tangible expression of the ''body of Christ'' theology.',
   NULL),
  (21, 'The salutation of me Paul with mine own hand.',
   'ὁ ἀσπασμὸς τῇ ἐμῇ χειρὶ Παύλου',
   'ho aspasmos tē emē cheiri Paulou',
   '''With mine own hand'' — Paul typically dictated his letters to an amanuensis (secretary) but added a personal greeting in his own handwriting as a mark of authenticity (cf. Galatians 6:11, Colossians 4:18, 2 Thessalonians 3:17). This practice guarded against forged letters (cf. 2 Thessalonians 2:2). The shift to Paul''s own handwriting signals the intimate, personal close of the letter.',
   NULL),
  (22, 'If any man love not the Lord Jesus Christ, let him be Anathema Maranatha.',
   'εἴ τις οὐ φιλεῖ τὸν κύριον Ἰησοῦν Χριστόν ἤτω ἀνάθεμα μαρὰν ἀθά',
   'ei tis ou philei ton kyrion Iēsoun Christon ētō anathema maran atha',
   '''Love not'' (ou philei — does not love; philei from phileō, to have affection for). ''Anathema'' (anathema — accursed, devoted to destruction; the most solemn form of excommunication). ''Maranatha'' (maran atha — Aramaic: ''Our Lord, come!'' or ''Our Lord has come''). This jarring declaration juxtaposes the severest curse with the most ardent prayer. Those who do not love Christ are under the curse; those who do cry ''Come, Lord!'' The Aramaic formula suggests it was a liturgical phrase preserved from the earliest Jewish-Christian worship.',
   'The combination of anathema and Maranatha is striking. Anathema places the loveless under God''s curse — a reminder that the issues addressed in this letter (factions, immorality, false teaching) are not trivial. Maranatha (whether parsed as maran atha, ''our Lord, come'' or marana tha, ''our Lord has come'') is one of the oldest Christian prayers, preserved in Aramaic even in a Greek letter, testifying to the earliest church''s expectation of Christ''s return. Love for Christ is the baseline requirement of Christian identity; without it, all religious performance is anathema.'),
  (23, 'The grace of our Lord Jesus Christ be with you.',
   'ἡ χάρις τοῦ κυρίου Ἰησοῦ Χριστοῦ μεθ᾿ ὑμῶν',
   'hē charis tou kyriou Iēsou Christou meth hymōn',
   '''Grace'' (charis — unmerited favor, divine enablement). Paul''s standard benediction invokes Christ''s grace upon the church. After a letter filled with correction, rebuke, and strong teaching, Paul closes with grace. The letter that diagnosed so many problems ends with the only solution: the grace of the Lord Jesus Christ.',
   NULL),
  (24, 'My love be with you all in Christ Jesus. Amen.',
   'ἡ ἀγάπη μου μετὰ πάντων ὑμῶν ἐν Χριστῷ Ἰησοῦ ἀμήν',
   'hē agapē mou meta pantōn hymōn en Christō Iēsou amēn',
   '''My love'' (hē agapē mou — the love I have for you). ''With you all'' (meta pantōn hymōn — with every one of you, without exception). ''In Christ Jesus'' — the sphere in which Paul''s love operates. This is an unusual closing: Paul typically ends with grace, not with a personal declaration of love. After 16 chapters of sometimes painful correction, Paul assures the Corinthians that every rebuke came from love. The letter that commanded ''let all your things be done with charity'' (v.14) ends with Paul himself modeling it.',
   'This is the only Pauline letter that closes with an explicit declaration of personal love from the apostle. Given the severity of much of the letter — rebukes for division, immorality, lawsuits, abuse of the Lord''s Supper, and doctrinal error — this closing is profoundly pastoral. Paul has been the faithful surgeon, but he closes as the loving father (cf. 4:14-15). His love is ''in Christ Jesus'' — not sentimental but covenantal, rooted in their shared union with the Lord. The Amen seals the entire epistle.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 16;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 collection
  ('λογεία', 'logeia', 'G3048', 'Collection, gathering of money — a word found almost exclusively in the papyri for religious contributions and temple taxes. Paul uses this practical term for the Jerusalem relief fund, showing that financial generosity is a normal part of Christian worship. The collection was not charity from a superior to an inferior but an expression of koinōnia (partnership) between Gentile and Jewish believers.', 1),
  -- v.2 first day of the week
  ('σάββατον', 'sabbaton', 'G4521', 'Sabbath, week — here in the phrase kata mian sabbatōn (on the first day of the week). The earliest evidence of Christians gathering on Sunday, the day of Christ''s resurrection. While sabbaton properly means Sabbath (Saturday), the phrase mian sabbatōn became the standard designation for Sunday. This shift from Sabbath to Lord''s Day reflects the centrality of the resurrection in Christian worship.', 2),
  -- v.9 effectual door
  ('ἐνεργής', 'energēs', 'G1756', 'Effectual, active, productive — from en (in) + ergon (work). Describes a door of opportunity that is not merely open but actively producing results. Paul''s ministry in Ephesus was bearing abundant fruit (Acts 19:10-20). The adjective suggests the door is itself working — God is actively at work through the opportunity. This is why Paul stays despite opposition: the door is not just open but energēs.', 3),
  -- v.13 quit you like men
  ('ἀνδρίζομαι', 'andrizomai', 'G407', 'To act like a man, to be courageous, to show manly bravery — from anēr (man, male). Used in the LXX for military courage (Deuteronomy 31:6, Joshua 1:6). Paul commands the Corinthians to display warrior-like courage in their faith. Combined with grēgoreite (watch), stēkete (stand firm), and krataiousthe (be strong), it forms a four-fold military exhortation for spiritual warfare.', 4),
  -- v.14 charity / love
  ('ἀγάπη', 'agapē', 'G26', 'Love — self-giving, sacrificial love; the supreme Christian virtue (ch.13). In v.14, agapē is the governing principle for everything: ''Let all your things be done with charity.'' This single command summarizes the entire epistle. Every correction Paul has issued — about divisions, immorality, worship order, spiritual gifts — comes back to the failure or practice of agapē. Love is not one virtue among many but the atmosphere in which all others operate.', 5),
  -- v.15 addicted themselves
  ('τάσσω', 'tassō', 'G5021', 'To arrange, to appoint, to order, to devote — a military term for arranging troops in formation. The household of Stephanas ''appointed themselves'' (etaxan heautous) to ministry — they voluntarily enlisted for service. No one commanded them; they saw the need and organized themselves to meet it. This is the model of Christian leadership: self-appointed service, not self-appointed authority.', 6),
  -- v.22 anathema
  ('ἀνάθεμα', 'anathema', 'G331', 'Accursed, devoted to destruction — from anatithēmi (to set up, to dedicate). In secular Greek, anathema meant a temple offering; in biblical usage it became the opposite: something devoted to God''s wrath and destruction (cf. the Hebrew cherem, the ban of total destruction in Joshua 6-7). Paul uses it for the most solemn curse: those who do not love Christ are under divine condemnation. This is the same word Paul used of himself hypothetically in Romans 9:3.', 7),
  -- v.22 maranatha
  ('μαρὰν ἀθά', 'maran atha', 'G3134', 'Maranatha — Aramaic: either maran atha (our Lord has come) or marana tha (our Lord, come!). One of the earliest Christian prayers, preserved in Aramaic even in a Greek-speaking context, testifying to its origin in the first Jewish-Christian community. It expresses the church''s longing for Christ''s return (the Parousia). Found also in Didache 10:6, where it is part of the eucharistic liturgy. The prayer encapsulates the eschatological hope of the entire NT.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 16
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 9
    WHEN 4 THEN 13
    WHEN 5 THEN 14
    WHEN 6 THEN 15
    WHEN 7 THEN 22
    WHEN 8 THEN 22
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 collection for the saints
  (1, 'Romans 15:25-27', 1),
  (1, '2 Corinthians 8:1-4', 2),
  (1, '2 Corinthians 9:1-5', 3),
  -- v.2 first day of the week
  (2, 'Acts 20:7', 4),
  (2, 'Revelation 1:10', 5),
  -- v.2 as God hath prospered
  (2, '2 Corinthians 9:6-7', 6),
  -- v.3 approved delegates
  (3, '2 Corinthians 8:18-21', 7),
  -- v.7 if the Lord permit
  (7, 'James 4:15', 8),
  (7, 'Acts 18:21', 9),
  -- v.8 Ephesus
  (8, 'Acts 19:1-10', 10),
  -- v.9 great door
  (9, '2 Corinthians 2:12', 11),
  (9, 'Colossians 4:3', 12),
  (9, 'Acts 19:8-20', 13),
  -- v.10 Timothy
  (10, '1 Timothy 4:12', 14),
  (10, '2 Timothy 1:7', 15),
  (10, '1 Corinthians 4:17', 16),
  -- v.12 Apollos
  (12, 'Acts 18:24-28', 17),
  (12, '1 Corinthians 3:4-6', 18),
  -- v.13 watch stand fast
  (13, 'Ephesians 6:10-13', 19),
  (13, '1 Peter 5:8-9', 20),
  -- v.14 all things in love
  (14, '1 Corinthians 13:1-7', 21),
  (14, 'Colossians 3:14', 22),
  -- v.15 house of Stephanas
  (15, '1 Corinthians 1:16', 23),
  -- v.19 Aquila and Priscilla
  (19, 'Acts 18:2-3', 24),
  (19, 'Romans 16:3-5', 25),
  -- v.20 holy kiss
  (20, 'Romans 16:16', 26),
  (20, '1 Thessalonians 5:26', 27),
  -- v.21 Paul''s autograph
  (21, 'Galatians 6:11', 28),
  (21, '2 Thessalonians 3:17', 29),
  -- v.22 anathema maranatha
  (22, 'Galatians 1:8-9', 30),
  (22, 'Revelation 22:20', 31),
  (22, 'Romans 9:3', 32),
  -- v.23 grace
  (23, '2 Corinthians 13:14', 33),
  -- v.24 my love
  (24, '2 Corinthians 11:11', 34),
  (24, '1 Corinthians 4:14-15', 35)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 16
  AND v.verse_number = cr.verse_number;
