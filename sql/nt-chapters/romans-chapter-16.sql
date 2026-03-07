-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 16 — Greetings, Warnings, and Final Doxology
-- 27 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 16,
  'Romans 16 is the most personal chapter of Paul''s most theological letter. It opens with a commendation of Phoebe, ''a servant of the church which is at Cenchrea'' (v.1), and requests that the Roman church receive her ''in the Lord, as becometh saints'' (v.2). Paul then greets twenty-six individuals and several households by name (vv.3-16), offering a remarkable window into the early church: men and women, Jews and Gentiles, slaves and free, serving Christ together. Notable figures include Priscilla and Aquila (vv.3-4), Epaenetus (''the firstfruits of Achaia,'' v.5), Andronicus and Junia (''of note among the apostles,'' v.7), and many others. After the warm greetings, Paul inserts a sharp warning against those who ''cause divisions and offences contrary to the doctrine which ye have learned'' (v.17), describing them as those who ''serve not our Lord Jesus Christ, but their own belly'' (v.18). A brief promise follows: ''the God of peace shall bruise Satan under your feet shortly'' (v.20). Greetings from Paul''s companions conclude the personal section (vv.21-24). The letter ends with a magnificent doxology: ''Now to him that is of power to stablish you according to my gospel, and the preaching of Jesus Christ, according to the revelation of the mystery, which was kept secret since the world began, but now is made manifest … to the only wise God, through Jesus Christ, to whom be glory for ever. Amen'' (vv.25-27).',
  'Personal Greetings, Warning Against Divisive Teachers, and the Final Doxology',
  'ἀσπάζομαι (aspazomai)',
  'To greet, welcome, embrace — used 21 times in this chapter alone. Paul''s extensive greetings reveal a deeply relational apostle and a remarkably diverse church. Each greeting carries personal knowledge and affection, showing that theology and community are inseparable. The gospel creates a family where every member is known and valued.',
  '["Commendation of Phoebe (vv.1-2): I commend unto you Phebe our sister which is a servant of the church which is at Cenchrea that ye receive her in the Lord as becometh saints and that ye assist her in whatsoever business she hath need of you for she hath been a succourer of many and of myself also","Personal Greetings to the Roman Church (vv.3-16): Greet Priscilla and Aquila my helpers in Christ Jesus who have for my life laid down their own necks. Salute Andronicus and Junia my kinsmen and my fellowprisoners who are of note among the apostles. Salute one another with an holy kiss","Warning Against False Teachers (vv.17-20): Now I beseech you brethren mark them which cause divisions and offences contrary to the doctrine which ye have learned and avoid them. For they that are such serve not our Lord Jesus Christ but their own belly. And the God of peace shall bruise Satan under your feet shortly","Greetings from Paul''s Companions and Final Doxology (vv.21-27): Now to him that is of power to stablish you according to my gospel and the preaching of Jesus Christ according to the revelation of the mystery which was kept secret since the world began but now is made manifest to the only wise God through Jesus Christ to whom be glory for ever Amen"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 27 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'I commend unto you Phebe our sister, which is a servant of the church which is at Cenchrea:',
   'συνίστημι δὲ ὑμῖν Φοίβην τὴν ἀδελφὴν ἡμῶν οὖσαν διάκονον τῆς ἐκκλησίας τῆς ἐν Κεγχρεαῖς',
   'synistēmi de hymin Phoibēn tēn adelphēn hēmōn ousan diakonon tēs ekklēsias tēs en Kenchreis',
   '''Commend'' (synistēmi — formally introduce, recommend). ''Phebe'' (Phoibēn — a Greek name meaning ''bright, radiant''). ''Servant'' (diakonon — deaconess or minister; the same word used of Christ in 15:8 and government in 13:4). ''Cenchrea'' — the eastern port of Corinth. Phoebe was likely the bearer of the epistle to Rome.',
   'Phoebe is the first person named in the greetings, and she receives the most detailed commendation. The word diakonos is the same term Paul uses for himself and other ministers — it denotes a recognized role of service in the church. As the probable letter-carrier, Phoebe would have been responsible for reading and explaining the epistle to the Roman congregations. This was a position of significant trust and authority.'),
  (2, 'That ye receive her in the Lord, as becometh saints, and that ye assist her in whatsoever business she hath need of you: for she hath been a succourer of many, and of myself also.',
   'ἵνα αὐτὴν προσδέξησθε ἐν κυρίῳ ἀξίως τῶν ἁγίων καὶ παραστῆτε αὐτῇ ἐν ᾧ ἂν ὑμῶν χρῄζῃ πράγματι καὶ γὰρ αὐτὴ προστάτις πολλῶν ἐγενήθη καὶ ἐμοῦ αὐτοῦ',
   'hina autēn prosdexēsthe en kyriō axiōs tōn hagiōn kai parastēte autē en hō an hymōn chrēzē pragmati kai gar autē prostatis pollōn egenēthē kai emou autou',
   '''Receive her'' (prosdexēsthe — welcome, accept). ''As becometh saints'' (axiōs tōn hagiōn — in a manner worthy of the saints). ''Succourer'' (prostatis — patron, benefactor, protector; a person of means who provides support and legal protection). Phoebe had been a benefactress to many, including Paul himself. She was a woman of substance and generosity.',
   NULL),
  (3, 'Greet Priscilla and Aquila my helpers in Christ Jesus:',
   'ἀσπάσασθε Πρίσκιλλαν καὶ Ἀκύλαν τοὺς συνεργούς μου ἐν Χριστῷ Ἰησοῦ',
   'aspasasthe Priskillan kai Akylan tous synergous mou en Christō Iēsou',
   '''Priscilla'' (Priskillan — the diminutive of Prisca; she is named first, suggesting her prominence). ''Aquila'' — a Jewish tentmaker from Pontus (Acts 18:2). ''Helpers'' (synergous — co-workers, fellow-labourers). This married couple is mentioned six times in the NT (Acts 18:2, 18, 26; 1 Corinthians 16:19; 2 Timothy 4:19), always together, always serving.',
   NULL),
  (4, 'Who have for my life laid down their own necks: unto whom not only I give thanks, but also all the churches of the Gentiles.',
   'οἵτινες ὑπὲρ τῆς ψυχῆς μου τὸν ἑαυτῶν τράχηλον ὑπέθηκαν οἷς οὐκ ἐγὼ μόνος εὐχαριστῶ ἀλλὰ καὶ πᾶσαι αἱ ἐκκλησίαι τῶν ἐθνῶν',
   'hoitines hyper tēs psychēs mou ton heautōn trachēlon hypethēkan hois ouk egō monos eucharistō alla kai pasai hai ekklēsiai tōn ethnōn',
   '''Laid down their own necks'' (ton heautōn trachēlon hypethēkan — literally placed their necks under the axe; risked their lives). The circumstances are unknown but the courage is undeniable. ''All the churches of the Gentiles'' give thanks — Priscilla and Aquila''s ministry had far-reaching impact across the Gentile world.',
   NULL),
  (5, 'Likewise greet the church that is in their house. Salute my wellbeloved Epaenetus, who is the firstfruits of Achaia unto Christ.',
   'καὶ τὴν κατ᾿ οἶκον αὐτῶν ἐκκλησίαν ἀσπάσασθε Ἐπαίνετον τὸν ἀγαπητόν μου ὅς ἐστιν ἀπαρχὴ τῆς Ἀχαΐας εἰς Χριστόν',
   'kai tēn kat oikon autōn ekklēsian aspasasthe Epaineton ton agapēton mou hos estin aparchē tēs Achaias eis Christon',
   '''Church in their house'' (kat oikon ekklēsian — a house-church; early Christians met in private homes). ''Epaenetus'' (Epaineton — ''praiseworthy''). ''Firstfruits of Achaia'' (aparchē tēs Achaias — the first convert in the province of Achaia). He was Paul''s first convert in that region — a treasured spiritual firstborn.',
   NULL),
  (6, 'Greet Mary, who bestowed much labour on us.',
   'ἀσπάσασθε Μαριάμ ἥτις πολλὰ ἐκοπίασεν εἰς ὑμᾶς',
   'aspasasthe Mariam hētis polla ekopiasev eis hymas',
   '''Mary'' (Mariam — a Jewish name, Hebrew Miriam). ''Bestowed much labour'' (polla ekopiasev — laboured hard, toiled greatly; kopiaō implies exhausting work). Paul''s favourite word for Christian service: it suggests real sacrifice and effort.',
   NULL),
  (7, 'Salute Andronicus and Junia, my kinsmen, and my fellowprisoners, who are of note among the apostles, who also were in Christ before me.',
   'ἀσπάσασθε Ἀνδρόνικον καὶ Ἰουνίαν τοὺς συγγενεῖς μου καὶ συναιχμαλώτους μου οἵτινές εἰσιν ἐπίσημοι ἐν τοῖς ἀποστόλοις οἳ καὶ πρὸ ἐμοῦ γεγόνασιν ἐν Χριστῷ',
   'aspasasthe Andronikon kai Iounian tous syngeneis mou kai synaichmalōtous mou hoitines eisin episēmoi en tois apostolois hoi kai pro emou gegonasin en Christō',
   '''Andronicus and Junia'' — most likely a husband-wife pair; Junia is a feminine Latin name (Ἰουνίαν). ''Kinsmen'' (syngeneis — fellow Jews, relatives). ''Fellowprisoners'' (synaichmalōtous — imprisoned together with Paul). ''Of note among the apostles'' (episēmoi en tois apostolois — prominent among the apostles, or well-known to the apostles). ''In Christ before me'' — they were believers before Paul''s conversion, making them among the earliest Christians.',
   NULL),
  (8, 'Greet Amplias my beloved in the Lord.',
   'ἀσπάσασθε Ἀμπλίαν τὸν ἀγαπητόν μου ἐν κυρίῳ',
   'aspasasthe Amplian ton agapēton mou en kyriō',
   '''Amplias'' (Amplian — a common slave name in Rome). ''Beloved in the Lord'' — Paul''s affection crosses all social boundaries. A slave is as beloved as a prominent co-worker.',
   NULL),
  (9, 'Salute Urbane, our helper in Christ, and Stachys my beloved.',
   'ἀσπάσασθε Οὐρβανὸν τὸν συνεργὸν ἡμῶν ἐν Χριστῷ καὶ Στάχυν τὸν ἀγαπητόν μου',
   'aspasasthe Ourbanon ton synergon hēmōn en Christō kai Stachyn ton agapēton mou',
   '''Urbane'' (Ourbanon — a Latin name meaning ''city-dweller''). ''Helper'' (synergon — co-worker). ''Stachys'' (Stachyn — ''ear of grain''; a Greek name).',
   NULL),
  (10, 'Salute Apelles approved in Christ. Salute them which are of Aristobulus'' household.',
   'ἀσπάσασθε Ἀπελλῆν τὸν δόκιμον ἐν Χριστῷ ἀσπάσασθε τοὺς ἐκ τῶν Ἀριστοβούλου',
   'aspasasthe Apellēn ton dokimon en Christō aspasasthe tous ek tōn Aristoboulou',
   '''Approved'' (dokimon — tested and found genuine). ''Aristobulus'' household'' — possibly the household of Aristobulus, grandson of Herod the Great, who lived in Rome. His slaves would have passed to the emperor upon his death, keeping the household name.',
   NULL),
  (11, 'Salute Herodion my kinsman. Greet them that be of the household of Narcissus, which are in the Lord.',
   'ἀσπάσασθε Ἡρωδίωνα τὸν συγγενῆ μου ἀσπάσασθε τοὺς ἐκ τῶν Ναρκίσσου τοὺς ὄντας ἐν κυρίῳ',
   'aspasasthe Hērōdiōna ton syngenē mou aspasasthe tous ek tōn Narkissou tous ontas en kyriō',
   '''Herodion'' — a Jewish Christian (''kinsman''; syngenē, fellow Jew). ''Narcissus'' household'' — possibly the famous freedman of Emperor Claudius. ''Which are in the Lord'' — only the Christian members of the household, not all.',
   NULL),
  (12, 'Salute Tryphena and Tryphosa, who labour in the Lord. Salute the beloved Persis, which laboured much in the Lord.',
   'ἀσπάσασθε Τρύφαιναν καὶ Τρυφῶσαν τὰς κοπιώσας ἐν κυρίῳ ἀσπάσασθε Περσίδα τὴν ἀγαπητήν ἥτις πολλὰ ἐκοπίασεν ἐν κυρίῳ',
   'aspasasthe Tryphainan kai Tryphōsan tas kopiōsas en kyriō aspasasthe Persida tēn agapētēn hētis polla ekopiasev en kyriō',
   '''Tryphena and Tryphosa'' — possibly sisters or twins (both names derive from tryphē, ''daintiness,'' yet Paul praises their hard labour: a delightful irony). ''Persis'' (Persida — ''Persian woman''). ''Laboured much'' (polla ekopiasev — same word used of Mary in v.6). Three women commended for their strenuous work in the Lord.',
   NULL),
  (13, 'Salute Rufus chosen in the Lord, and his mother and mine.',
   'ἀσπάσασθε Ῥοῦφον τὸν ἐκλεκτὸν ἐν κυρίῳ καὶ τὴν μητέρα αὐτοῦ καὶ ἐμοῦ',
   'aspasasthe Rhouphos ton eklekton en kyriō kai tēn mētera autou kai emou',
   '''Rufus'' — possibly the son of Simon of Cyrene (Mark 15:21, written to Rome, mentions ''Rufus''). ''Chosen in the Lord'' (eklekton — elect, choice, distinguished). ''His mother and mine'' — Rufus''s mother had mothered Paul as well. A touching reference to a woman who cared for the apostle.',
   NULL),
  (14, 'Salute Asyncritus, Phlegon, Hermas, Patrobas, Hermes, and the brethren which are with them.',
   'ἀσπάσασθε Ἀσύγκριτον Φλέγοντα Ἑρμᾶν Πατροβᾶν Ἑρμῆν καὶ τοὺς σὺν αὐτοῖς ἀδελφούς',
   'aspasasthe Asynkriton Phlegonta Herman Patroban Hermēn kai tous syn autois adelphous',
   'Five men greeted together with ''the brethren which are with them'' — likely another house-church. All are Greek names common among freedmen and slaves. The gospel reached every stratum of Roman society.',
   NULL),
  (15, 'Salute Philologus, and Julia, Nereus, and his sister, and Olympas, and all the saints which are with them.',
   'ἀσπάσασθε Φιλόλογον καὶ Ἰουλίαν Νηρέα καὶ τὴν ἀδελφὴν αὐτοῦ καὶ Ὀλυμπᾶν καὶ τοὺς σὺν αὐτοῖς πάντας ἁγίους',
   'aspasasthe Philologon kai Ioulian Nērea kai tēn adelphēn autou kai Olympan kai tous syn autois pantas hagious',
   'Another group (probably a house-church): ''Philologus and Julia'' — possibly a married couple. ''Nereus and his sister.'' ''Olympas'' — a shortened form of Olympiodorus. ''All the saints'' — the wider circle connected to this group.',
   NULL),
  (16, 'Salute one another with an holy kiss. The churches of Christ salute you.',
   'ἀσπάσασθε ἀλλήλους ἐν φιλήματι ἁγίῳ ἀσπάζονται ὑμᾶς αἱ ἐκκλησίαι τοῦ Χριστοῦ',
   'aspasasthe allēlous en philēmati hagiō aspazontai hymas hai ekklēsiai tou Christou',
   '''Holy kiss'' (philēmati hagiō — a kiss of fellowship; a standard greeting in the ancient world, sanctified by the Christian community). ''Churches of Christ'' — all the churches Paul has contact with send their greetings to Rome. This shows the interconnected network of early Christian communities.',
   NULL),
  (17, 'Now I beseech you, brethren, mark them which cause divisions and offences contrary to the doctrine which ye have learned; and avoid them.',
   'παρακαλῶ δὲ ὑμᾶς ἀδελφοί σκοπεῖν τοὺς τὰς διχοστασίας καὶ τὰ σκάνδαλα παρὰ τὴν διδαχὴν ἣν ὑμεῖς ἐμάθετε ποιοῦντας καὶ ἐκκλίνατε ἀπ᾿ αὐτῶν',
   'parakalō de hymas adelphoi skopein tous tas dichostasias kai ta skandala para tēn didachēn hēn hymeis emathete poiountas kai ekklinate ap autōn',
   '''Mark'' (skopein — watch out for, keep your eye on; from skopos, target). ''Divisions'' (dichostasias — dissensions, standing apart). ''Offences'' (skandala — stumbling blocks, traps). ''Contrary to the doctrine'' (para tēn didachēn — alongside the teaching, i.e., deviating from it). ''Avoid'' (ekklinate — turn away from). This is not about disputable matters (ch.14) but about false teaching that contradicts apostolic doctrine.',
   'After the warmth of the greetings, this warning is startling in its sharpness. Paul distinguishes between disputable matters (ch.14, where mutual acceptance is required) and doctrinal deviations (ch.16, where avoidance is required). The test is ''contrary to the doctrine which ye have learned'' — the apostolic teaching is the standard. Those who create divisions by introducing alien doctrine must be identified and shunned.'),
  (18, 'For they that are such serve not our Lord Jesus Christ, but their own belly; and by good words and fair speeches deceive the hearts of the simple.',
   'οἱ γὰρ τοιοῦτοι τῷ κυρίῳ ἡμῶν Ἰησοῦ Χριστῷ οὐ δουλεύουσιν ἀλλὰ τῇ ἑαυτῶν κοιλίᾳ καὶ διὰ τῆς χρηστολογίας καὶ εὐλογίας ἐξαπατῶσιν τὰς καρδίας τῶν ἀκάκων',
   'hoi gar toioutoi tō kyriō hēmōn Iēsou Christō ou douleuousin alla tē heautōn koilia kai dia tēs chrēstologias kai eulogias exapatōsin tas kardias tōn akakōn',
   '''Serve their own belly'' (tē heautōn koilia — their appetite, their self-interest). ''Good words'' (chrēstologias — smooth speech, flattering talk). ''Fair speeches'' (eulogias — fine-sounding words, eloquent blessing). ''Simple'' (akakōn — innocent, unsuspecting, without malice). False teachers are motivated by self-interest and use persuasive rhetoric to deceive the naive.',
   NULL),
  (19, 'For your obedience is come abroad unto all men. I am glad therefore on your behalf: but yet I would have you wise unto that which is good, and simple concerning evil.',
   'ἡ γὰρ ὑμῶν ὑπακοὴ εἰς πάντας ἀφίκετο χαίρω οὖν τὸ ἐφ᾿ ὑμῖν θέλω δὲ ὑμᾶς σοφοὺς μὲν εἶναι εἰς τὸ ἀγαθόν ἀκεραίους δὲ εἰς τὸ κακόν',
   'hē gar hymōn hypakoē eis pantas aphiketo chairō oun to eph hymin thelō de hymas sophous men einai eis to agathon akeraious de eis to kakon',
   '''Obedience is come abroad'' — Rome''s faith is well-known (cf. 1:8). ''Wise unto that which is good'' (sophous eis to agathon — shrewd about goodness). ''Simple concerning evil'' (akeraious eis to kakon — innocent, unmixed regarding evil; akeraios means pure, unadulterated). Jesus gave the same command: ''wise as serpents, harmless as doves'' (Matthew 10:16).',
   NULL),
  (20, 'And the God of peace shall bruise Satan under your feet shortly. The grace of our Lord Jesus Christ be with you. Amen.',
   'ὁ δὲ θεὸς τῆς εἰρήνης συντρίψει τὸν σατανᾶν ὑπὸ τοὺς πόδας ὑμῶν ἐν τάχει ἡ χάρις τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μεθ᾿ ὑμῶν ἀμήν',
   'ho de theos tēs eirēnēs syntripsei ton satanan hypo tous podas hymōn en tachei hē charis tou kyriou hēmōn Iēsou Christou meth hymōn amēn',
   '''God of peace'' (theos tēs eirēnēs — the God who gives peace will crush the enemy of peace). ''Bruise'' (syntripsei — crush, shatter; an echo of Genesis 3:15, the protoevangelium). ''Under your feet'' — the church participates in Christ''s victory over Satan. ''Shortly'' (en tachei — quickly, soon). This is a promise of eschatological victory applied to the present struggle against false teachers.',
   'This verse is one of the most powerful promises in the NT. It echoes the protoevangelium (Genesis 3:15): the seed of the woman will crush the serpent''s head. Paul applies this to the church: ''the God of peace shall bruise Satan under your feet.'' The paradox is stunning — the God of peace wages war on evil. The promise is corporate (''your feet'' — the whole church) and imminent (''shortly''). False teachers (vv.17-18) are Satan''s instruments; God will crush them.'),
  (21, 'Timotheus my workfellow, and Lucius, and Jason, and Sosipater, my kinsmen, salute you.',
   'ἀσπάζονται ὑμᾶς Τιμόθεος ὁ συνεργός μου καὶ Λούκιος καὶ Ἰάσων καὶ Σωσίπατρος οἱ συγγενεῖς μου',
   'aspazontai hymas Timotheos ho synergos mou kai Loukios kai Iasōn kai Sōsipatros hoi syngeneis mou',
   '''Timothy'' (Timotheos — Paul''s beloved co-worker and spiritual son). ''Lucius'' — possibly Luke the physician. ''Jason'' — possibly Paul''s host in Thessalonica (Acts 17:5-9). ''Sosipater'' — possibly Sopater of Berea (Acts 20:4). ''Kinsmen'' — fellow Jews.',
   NULL),
  (22, 'I Tertius, who wrote this epistle, salute you in the Lord.',
   'ἀσπάζομαι ὑμᾶς ἐγὼ Τέρτιος ὁ γράψας τὴν ἐπιστολὴν ἐν κυρίῳ',
   'aspazomai hymas egō Tertios ho grapsas tēn epistolēn en kyriō',
   '''Tertius'' (Tertios — ''third''; a Latin slave name). ''Who wrote this epistle'' (ho grapsas tēn epistolēn — who penned this letter). Tertius was Paul''s amanuensis (secretary). Paul dictated; Tertius wrote. This rare interruption shows a real person behind the manuscript — the scribe inserts his own greeting.',
   NULL),
  (23, 'Gaius mine host, and of the whole church, saluteth you. Erastus the chamberlain of the city saluteth you, and Quartus a brother.',
   'ἀσπάζεται ὑμᾶς Γάϊος ὁ ξένος μου καὶ τῆς ἐκκλησίας ὅλης ἀσπάζεται ὑμᾶς Ἔραστος ὁ οἰκονόμος τῆς πόλεως καὶ Κούαρτος ὁ ἀδελφός',
   'aspazetai hymas Gaios ho xenos mou kai tēs ekklēsias holēs aspazetai hymas Erastos ho oikonomos tēs poleōs kai Kouartos ho adelphos',
   '''Gaius'' (Gaios — Paul''s host in Corinth, likely Gaius of 1 Corinthians 1:14). ''Host of the whole church'' — his house was large enough for the whole church to gather. ''Erastus the chamberlain'' (oikonomos tēs poleōs — city treasurer; an inscription found in Corinth reads ''Erastus, commissioner of public works''). ''Quartus'' (Kouartos — ''fourth''; another Latin name, called simply ''a brother'').',
   NULL),
  (24, 'The grace of our Lord Jesus Christ be with you all. Amen.',
   'ἡ χάρις τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μετὰ πάντων ὑμῶν ἀμήν',
   'hē charis tou kyriou hēmōn Iēsou Christou meta pantōn hymōn amēn',
   'A grace-benediction repeated from v.20. ''With you all'' (meta pantōn hymōn — inclusive: weak and strong, Jew and Gentile, slave and free). Grace brackets the conclusion of the letter.',
   NULL),
  (25, 'Now to him that is of power to stablish you according to my gospel, and the preaching of Jesus Christ, according to the revelation of the mystery, which was kept secret since the world began,',
   'τῷ δὲ δυναμένῳ ὑμᾶς στηρίξαι κατὰ τὸ εὐαγγέλιόν μου καὶ τὸ κήρυγμα Ἰησοῦ Χριστοῦ κατὰ ἀποκάλυψιν μυστηρίου χρόνοις αἰωνίοις σεσιγημένου',
   'tō de dynamenō hymas stērixai kata to euangelion mou kai to kērygma Iēsou Christou kata apokalypsin mystēriou chronois aiōniois sesigēmenou',
   '''Of power to stablish'' (dynamenō stērixai — able to make firm, strengthen). ''My gospel'' (to euangelion mou — Paul''s gospel, not a different gospel but the gospel as revealed to and through him). ''Preaching of Jesus Christ'' (kērygma — proclamation). ''Mystery'' (mystēriou — the divine secret now revealed). ''Kept secret since the world began'' (chronois aiōniois sesigēmenou — silenced through eternal ages).',
   'This doxology (vv.25-27) is the grand finale of Romans. It gathers up the letter''s major themes: God''s power to establish believers (cf. 1:11, 16), the gospel (1:1-4, 16-17), the mystery of Gentile inclusion (chs.9-11), the revelation of God''s redemptive plan. ''My gospel'' is not Paul''s invention but his stewardship of the mystery entrusted to him. The mystery was planned from eternity but revealed in time through the apostolic proclamation.'),
  (26, 'But now is made manifest, and by the scriptures of the prophets, according to the commandment of the everlasting God, made known to all nations for the obedience of faith:',
   'φανερωθέντος δὲ νῦν διά τε γραφῶν προφητικῶν κατ᾿ ἐπιταγὴν τοῦ αἰωνίου θεοῦ εἰς ὑπακοὴν πίστεως εἰς πάντα τὰ ἔθνη γνωρισθέντος',
   'phanerōthentos de nyn dia te graphōn prophētikōn kat epitagēn tou aiōniou theou eis hypakoēn pisteōs eis panta ta ethnē gnōristhentos',
   '''Made manifest'' (phanerōthentos — revealed, made visible). ''Scriptures of the prophets'' (graphōn prophētikōn — the OT prophetic writings; the mystery is attested by Scripture). ''Commandment of the everlasting God'' (epitagēn tou aiōniou theou — by divine decree). ''Obedience of faith'' (hypakoēn pisteōs — the same phrase as 1:5, forming an inclusio that brackets the entire letter). ''All nations'' (panta ta ethnē — all Gentile peoples).',
   NULL),
  (27, 'To God only wise, be glory through Jesus Christ for ever. Amen.',
   'μόνῳ σοφῷ θεῷ διὰ Ἰησοῦ Χριστοῦ ᾧ ἡ δόξα εἰς τοὺς αἰῶνας ἀμήν',
   'monō sophō theō dia Iēsou Christou hō hē doxa eis tous aiōnas amēn',
   '''Only wise God'' (monō sophō theō — the one and only wise God; his wisdom is unique and unrivalled). ''Through Jesus Christ'' — all glory reaches God through the mediator. ''For ever'' (eis tous aiōnas — unto the ages). ''Amen'' — so be it. The letter that began with the gospel (1:1) ends with glory to the God of the gospel. This doxology is the fitting conclusion to the greatest theological treatise ever written.',
   'The final doxology closes the grand circle of Romans. The letter began with ''the gospel of God'' (1:1) and ends with glory to the ''only wise God'' (16:27). It began with ''obedience to the faith among all nations'' (1:5) and ends with the same phrase (16:26). It began with God''s power (1:16) and ends with God''s power to establish (16:25). The entire letter has been an exposition of God''s wisdom in salvation — a wisdom so deep that it can only end in doxology: ''To God only wise, be glory through Jesus Christ for ever. Amen.''')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 16;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 servant/deaconess
  ('διάκονος', 'diakonos', 'G1249', 'Minister, servant, deacon(ess) — one who serves. Phoebe is called diakonos of the church at Cenchrea. The word is the same Paul uses for himself (1 Corinthians 3:5), for Apollos, and for government officials (13:4). Whether this denotes a formal office (deaconess) or a functional role (servant), Phoebe held a recognized position of service and responsibility in her church.', 1),
  -- v.2 succourer/patron
  ('προστάτις', 'prostatis', 'G4368', 'Patron, benefactress, protector — the feminine of prostatēs (patron, champion). In the Greco-Roman world, a prostatis was a person of means and social standing who provided financial support, legal protection, and hospitality. Phoebe was a woman of substance who used her resources to support many in the church, including Paul himself.', 2),
  -- v.3 co-workers
  ('συνεργός', 'synergos', 'G4904', 'Co-worker, fellow-labourer — from syn (together) + ergon (work). Paul''s favourite title for his ministry partners. Priscilla and Aquila are synergoi — not subordinates but partners in the gospel work. The term implies shared purpose, shared effort, and shared risk. Paul uses it for both men and women.', 3),
  -- v.7 of note among apostles
  ('ἐπίσημος', 'episēmos', 'G1978', 'Notable, distinguished, prominent — from epi (upon) + sēma (mark, sign). ''Of note among the apostles'' means either (1) outstanding among the apostles (i.e., Andronicus and Junia were apostles, and prominent ones) or (2) well-known to the apostles. The early church father Chrysostom took the first view, marvelling that a woman (Junia) could be called an apostle.', 4),
  -- v.17 divisions
  ('διχοστασία', 'dichostasia', 'G1370', 'Division, dissension, standing apart — from dicha (in two) + stasis (standing). Those who create dichostasiai split the community by introducing teaching contrary to the apostolic doctrine. This is distinct from the disputable matters of chapter 14: there Paul commanded mutual acceptance; here he commands avoidance. The difference is that false doctrine attacks the gospel foundation.', 5),
  -- v.20 bruise/crush
  ('συντρίβω', 'syntribō', 'G4937', 'To crush, shatter, break in pieces — from syn (together) + tribō (to rub, grind). An echo of Genesis 3:15 (LXX): the seed of the woman will crush the serpent''s head. God will shatter Satan under the church''s feet. The violent language conveys total, decisive victory. False teachers (vv.17-18) are Satan''s agents; their destruction is assured.', 6),
  -- v.25 mystery
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery, sacred secret now revealed — a plan hidden in God from eternity (chronois aiōniois) but now made manifest (phanerōthentos) through apostolic preaching. In Romans, the mystery encompasses God''s plan to save both Jew and Gentile through faith in Christ (cf. 11:25). The mystery is not irrational but supra-rational — it exceeds human wisdom but does not contradict it.', 7),
  -- v.26 obedience of faith
  ('ὑπακοή', 'hypakoē', 'G5218', 'Obedience, submission, compliance — from hypo (under) + akouō (to hear). ''Obedience of faith'' (hypakoēn pisteōs) bookends the entire letter (1:5 and 16:26), forming a grand inclusio. Faith and obedience are not opposites but inseparable: true faith expresses itself in obedience, and true obedience flows from faith. This is the goal of Paul''s entire apostolic mission.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 16
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 7
    WHEN 5 THEN 17
    WHEN 6 THEN 20
    WHEN 7 THEN 25
    WHEN 8 THEN 26
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 Phoebe servant
  (1, '1 Timothy 3:11', 1),
  (1, 'Philippians 1:1', 2),
  -- v.2 succourer/patron
  (2, '3 John 1:5-8', 3),
  -- v.3 Priscilla and Aquila
  (3, 'Acts 18:2-3', 4),
  (3, 'Acts 18:18-26', 5),
  (3, '1 Corinthians 16:19', 6),
  -- v.5 house church
  (5, 'Colossians 4:15', 7),
  (5, 'Philemon 1:2', 8),
  -- v.7 Andronicus and Junia
  (7, '2 Corinthians 11:23', 9),
  -- v.13 Rufus
  (13, 'Mark 15:21', 10),
  -- v.16 holy kiss
  (16, '1 Corinthians 16:20', 11),
  (16, '1 Thessalonians 5:26', 12),
  (16, '1 Peter 5:14', 13),
  -- v.17 mark false teachers
  (17, 'Titus 3:10-11', 14),
  (17, '2 John 1:10-11', 15),
  (17, '2 Timothy 3:5', 16),
  -- v.18 serve their belly
  (18, 'Philippians 3:18-19', 17),
  (18, '2 Peter 2:3', 18),
  -- v.19 wise and simple
  (19, 'Matthew 10:16', 19),
  (19, '1 Corinthians 14:20', 20),
  -- v.20 bruise Satan
  (20, 'Genesis 3:15', 21),
  (20, 'Revelation 20:10', 22),
  -- v.22 Tertius the scribe
  (22, 'Galatians 6:11', 23),
  -- v.23 Erastus
  (23, '2 Timothy 4:20', 24),
  (23, 'Acts 19:22', 25),
  -- v.25 mystery revealed
  (25, 'Ephesians 3:3-9', 26),
  (25, 'Colossians 1:26-27', 27),
  (25, '1 Corinthians 2:7', 28),
  -- v.26 obedience of faith
  (26, 'Romans 1:5', 29),
  (26, 'Acts 6:7', 30),
  -- v.27 only wise God
  (27, '1 Timothy 1:17', 31),
  (27, 'Jude 1:25', 32)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 16
  AND v.verse_number = cr.verse_number;
