-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 1 — Christ the Power and Wisdom of God
-- 31 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '1 Corinthians 1 opens Paul''s most pastoral letter, addressing a church torn by divisions, immorality, and confusion. After his greeting (vv.1-3), Paul gives thanks for God''s grace in the Corinthians — enriched ''in all utterance, and in all knowledge'' (v.5), ''so that ye come behind in no gift'' (v.7). But immediately the problem surfaces: ''there are contentions among you'' (v.11). The church has fractured into personality cults: ''I am of Paul; and I of Apollos; and I of Cephas; and I of Christ'' (v.12). Paul responds with devastating rhetorical questions: ''Is Christ divided? was Paul crucified for you?'' (v.13). He then declares his mission: ''Christ sent me not to baptize, but to preach the gospel: not with wisdom of words, lest the cross of Christ should be made of none effect'' (v.17). The remainder of the chapter is Paul''s magnificent theology of the cross: ''the preaching of the cross is to them that perish foolishness; but unto us which are saved it is the power of God'' (v.18). God has ''made foolish the wisdom of this world'' (v.20). The Jews require signs and the Greeks seek wisdom, ''but we preach Christ crucified'' (vv.22-23). Christ is ''the power of God, and the wisdom of God'' (v.24). God chose ''the foolish things of the world to confound the wise'' (v.27) so that ''no flesh should glory in his presence'' (v.29). The conclusion: ''He that glorieth, let him glory in the Lord'' (v.31).',
  'Divisions in the Church and the Wisdom of the Cross',
  'σοφία (sophia)',
  'Wisdom — the dominant word of chapters 1-3, appearing 17 times. Paul contrasts the world''s wisdom (sophia tou kosmou) with God''s wisdom (sophia tou theou). The world''s wisdom is the accumulated human cleverness that seeks to know God through reason and rhetoric. God''s wisdom is the cross — foolish by human standards but the very power and wisdom of God for salvation.',
  '["Greeting and Thanksgiving (vv.1-9): Paul called to be an apostle of Jesus Christ through the will of God unto the church of God which is at Corinth to them that are sanctified in Christ Jesus called to be saints. I thank my God always on your behalf for the grace of God which is given you by Jesus Christ that ye come behind in no gift waiting for the coming of our Lord Jesus Christ","Divisions in the Church (vv.10-17): Now I beseech you brethren by the name of our Lord Jesus Christ that ye all speak the same thing and that there be no divisions among you. For it hath been declared unto me of you that there are contentions among you. Is Christ divided? Was Paul crucified for you? For Christ sent me not to baptize but to preach the gospel","The Wisdom of God and the Foolishness of the Cross (vv.18-25): For the preaching of the cross is to them that perish foolishness but unto us which are saved it is the power of God. For it is written I will destroy the wisdom of the wise. For the Jews require a sign and the Greeks seek after wisdom but we preach Christ crucified unto the Jews a stumblingblock and unto the Greeks foolishness but unto them which are called Christ the power of God and the wisdom of God","God''s Choice of the Weak and Lowly (vv.26-31): For ye see your calling brethren how that not many wise men after the flesh not many mighty not many noble are called. But God hath chosen the foolish things of the world to confound the wise and God hath chosen the weak things of the world to confound the things which are mighty that no flesh should glory in his presence. He that glorieth let him glory in the Lord"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 31 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Paul, called to be an apostle of Jesus Christ through the will of God, and Sosthenes our brother,',
   'Παῦλος κλητὸς ἀπόστολος Ἰησοῦ Χριστοῦ διὰ θελήματος θεοῦ καὶ Σωσθένης ὁ ἀδελφός',
   'Paulos klētos apostolos Iēsou Christou dia thelēmatos theou kai Sōsthenēs ho adelphos',
   '''Called'' (klētos — divinely summoned; Paul did not choose apostleship). ''Through the will of God'' (dia thelēmatos theou — his authority derives from God, not from the Corinthian church). ''Sosthenes'' — possibly the synagogue ruler of Acts 18:17, now converted and Paul''s co-sender.',
   NULL),
  (2, 'Unto the church of God which is at Corinth, to them that are sanctified in Christ Jesus, called to be saints, with all that in every place call upon the name of Jesus Christ our Lord, both theirs and ours:',
   'τῇ ἐκκλησίᾳ τοῦ θεοῦ τῇ οὔσῃ ἐν Κορίνθῳ ἡγιασμένοις ἐν Χριστῷ Ἰησοῦ κλητοῖς ἁγίοις σὺν πᾶσιν τοῖς ἐπικαλουμένοις τὸ ὄνομα τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἐν παντὶ τόπῳ αὐτῶν τε καὶ ἡμῶν',
   'tē ekklēsia tou theou tē ousē en Korinthō hēgiasmenois en Christō Iēsou klētois hagiois syn pasin tois epikaloumenois to onoma tou kyriou hēmōn Iēsou Christou en panti topō autōn te kai hēmōn',
   '''Church of God'' (ekklēsia tou theou — the assembly that belongs to God). ''Sanctified'' (hēgiasmenois — set apart, made holy; perfect participle: their sanctification is accomplished in Christ). ''Called to be saints'' (klētois hagiois — called holy ones; they do not become saints by effort but by calling). ''Call upon the name'' — invoking Jesus'' name is an act of worship, equivalent to calling upon God (cf. Joel 2:32).',
   NULL),
  (3, 'Grace be unto you, and peace, from God our Father, and from the Lord Jesus Christ.',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   '''Grace and peace'' — the combined Greek (charis) and Hebrew (shalom/eirēnē) greeting. Both come ''from God our Father and the Lord Jesus Christ'' — the Father and the Son are the co-source, placing Christ on the same level as God.',
   NULL),
  (4, 'I thank my God always on your behalf, for the grace of God which is given you by Jesus Christ;',
   'εὐχαριστῶ τῷ θεῷ μου πάντοτε περὶ ὑμῶν ἐπὶ τῇ χάριτι τοῦ θεοῦ τῇ δοθείσῃ ὑμῖν ἐν Χριστῷ Ἰησοῦ',
   'eucharistō tō theō mou pantote peri hymōn epi tē chariti tou theou tē dotheisē hymin en Christō Iēsou',
   'Despite the severe problems Paul must address, he begins with thanksgiving. ''Grace given'' (chariti dotheisē — grace as a divine gift). Paul thanks God for what God has done, not for what the Corinthians have achieved. The thanksgiving sets the tone: correction will come within the context of grace.',
   NULL),
  (5, 'That in every thing ye are enriched by him, in all utterance, and in all knowledge;',
   'ὅτι ἐν παντὶ ἐπλουτίσθητε ἐν αὐτῷ ἐν παντὶ λόγῳ καὶ πάσῃ γνώσει',
   'hoti en panti eploutisthēte en autō en panti logō kai pasē gnōsei',
   '''Enriched'' (eploutisthēte — made rich; passive: God enriched them). ''Utterance'' (logō — speech, word; the gift of articulate proclamation). ''Knowledge'' (gnōsei — understanding of spiritual truth). The Corinthians were genuinely gifted — their problem was not lack of gifts but misuse of them.',
   NULL),
  (6, 'Even as the testimony of Christ was confirmed in you:',
   'καθὼς τὸ μαρτύριον τοῦ Χριστοῦ ἐβεβαιώθη ἐν ὑμῖν',
   'kathōs to martyrion tou Christou ebebaiōthē en hymin',
   '''Testimony of Christ'' (martyrion tou Christou — the witness about Christ, the gospel message). ''Confirmed'' (ebebaiōthē — made firm, established; a legal term for validation). The Corinthians'' gifts are evidence that the gospel took root among them.',
   NULL),
  (7, 'So that ye come behind in no gift; waiting for the coming of our Lord Jesus Christ:',
   'ὥστε ὑμᾶς μὴ ὑστερεῖσθαι ἐν μηδενὶ χαρίσματι ἀπεκδεχομένους τὴν ἀποκάλυψιν τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'hōste hymas mē hystereisthai en mēdeni charismati apekdechomenous tēn apokalypsin tou kyriou hēmōn Iēsou Christou',
   '''Come behind'' (hystereisthai — lack, fall short). ''No gift'' (mēdeni charismati — not a single spiritual gift). ''Waiting'' (apekdechomenous — eagerly awaiting; intensive: apo + ek + dechomai). ''Coming'' (apokalypsin — revelation, unveiling). The Corinthians lack nothing in gifts as they await Christ''s return.',
   NULL),
  (8, 'Who shall also confirm you unto the end, that ye may be blameless in the day of our Lord Jesus Christ.',
   'ὃς καὶ βεβαιώσει ὑμᾶς ἕως τέλους ἀνεγκλήτους ἐν τῇ ἡμέρᾳ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'hos kai bebaiōsei hymas heōs telous anenklētous en tē hēmera tou kyriou hēmōn Iēsou Christou',
   '''Confirm'' (bebaiōsei — make firm, keep steady; future tense: a promise). ''Unto the end'' (heōs telous — to the very end). ''Blameless'' (anenklētous — unaccusable, without charge; a legal term: no indictment can be brought). ''Day of our Lord Jesus Christ'' — the day of Christ''s return and judgment. God will sustain them to the end.',
   NULL),
  (9, 'God is faithful, by whom ye were called unto the fellowship of his Son Jesus Christ our Lord.',
   'πιστὸς ὁ θεὸς δι᾿ οὗ ἐκλήθητε εἰς κοινωνίαν τοῦ υἱοῦ αὐτοῦ Ἰησοῦ Χριστοῦ τοῦ κυρίου ἡμῶν',
   'pistos ho theos di hou eklēthēte eis koinōnian tou huiou autou Iēsou Christou tou kyriou hēmōn',
   '''God is faithful'' (pistos ho theos — the ground of all assurance). ''Called'' (eklēthēte — divinely summoned). ''Fellowship'' (koinōnian — partnership, participation, sharing in common life). ''Of his Son'' — fellowship with Christ himself. The Corinthians were called into the most intimate possible relationship: partnership with God''s own Son.',
   'This verse is the theological foundation for everything that follows. God''s faithfulness (not human faithfulness) guarantees the Corinthians'' perseverance. They were called into koinōnia — fellowship, partnership, participation — with Christ. This koinōnia is both the source of their gifts and the standard for their conduct. The divisions of vv.10-17 are a betrayal of this fellowship.'),
  (10, 'Now I beseech you, brethren, by the name of our Lord Jesus Christ, that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment.',
   'παρακαλῶ δὲ ὑμᾶς ἀδελφοί διὰ τοῦ ὀνόματος τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἵνα τὸ αὐτὸ λέγητε πάντες καὶ μὴ ᾖ ἐν ὑμῖν σχίσματα ἦτε δὲ κατηρτισμένοι ἐν τῷ αὐτῷ νοῒ καὶ ἐν τῇ αὐτῇ γνώμῃ',
   'parakalō de hymas adelphoi dia tou onomatos tou kyriou hēmōn Iēsou Christou hina to auto legēte pantes kai mē ē en hymin schismata ēte de katērtismenoi en tō autō noi kai en tē autē gnōmē',
   '''I beseech'' (parakalō — appeal urgently). ''By the name'' — invoking Christ''s authority. ''Speak the same thing'' (to auto legēte — agree, be in harmony). ''Divisions'' (schismata — tears, rips; from schizō, to split). ''Perfectly joined together'' (katērtismenoi — mended, restored; used of mending fishing nets, Mark 1:19). ''Same mind'' (noi — understanding) and ''same judgment'' (gnōmē — purpose, resolve). Paul''s first command addresses their most urgent problem.',
   NULL),
  (11, 'For it hath been declared unto me of you, my brethren, by them which are of the house of Chloe, that there are contentions among you.',
   'ἐδηλώθη γάρ μοι περὶ ὑμῶν ἀδελφοί μου ὑπὸ τῶν Χλόης ὅτι ἔριδες ἐν ὑμῖν εἰσιν',
   'edēlōthē gar moi peri hymōn adelphoi mou hypo tōn Chloēs hoti erides en hymin eisin',
   '''Declared'' (edēlōthē — made clear, reported). ''Chloe'' (Chloēs — a woman, probably a businesswoman whose household members travelled between Corinth and Ephesus). ''Contentions'' (erides — quarrels, disputes, factional strife). Paul names his source — he is not spreading rumours but acting on reliable information.',
   NULL),
  (12, 'Now this I say, that every one of you saith, I am of Paul; and I of Apollos; and I of Cephas; and I of Christ.',
   'λέγω δὲ τοῦτο ὅτι ἕκαστος ὑμῶν λέγει ἐγὼ μέν εἰμι Παύλου ἐγὼ δὲ Ἀπολλῶ ἐγὼ δὲ Κηφᾶ ἐγὼ δὲ Χριστοῦ',
   'legō de touto hoti hekastos hymōn legei egō men eimi Paulou egō de Apollō egō de Kēpha egō de Christou',
   'Four slogans revealing the Corinthian factions: (1) ''I am of Paul'' — founding apostle loyalists; (2) ''I of Apollos'' — eloquent teacher fans (Acts 18:24-28); (3) ''I of Cephas'' — Peter''s authority, possibly Jewish Christians; (4) ''I of Christ'' — a super-spiritual party claiming direct allegiance to Christ over all apostles. Each slogan reduces Christ to a party leader.',
   NULL),
  (13, 'Is Christ divided? was Paul crucified for you? or were ye baptized in the name of Paul?',
   'μεμέρισται ὁ Χριστός μὴ Παῦλος ἐσταυρώθη ὑπὲρ ὑμῶν ἢ εἰς τὸ ὄνομα Παύλου ἐβαπτίσθητε',
   'memeristai ho Christos mē Paulos estaurōthē hyper hymōn ē eis to onoma Paulou ebaptisthēte',
   '''Is Christ divided?'' (memeristai — has Christ been apportioned into fragments?). Three devastating rhetorical questions: (1) Christ is indivisible; (2) Only Christ was crucified for them; (3) They were baptized in Christ''s name, not Paul''s. These questions expose the absurdity of personality cults in the church.',
   NULL),
  (14, 'I thank God that I baptized none of you, but Crispus and Gaius;',
   'εὐχαριστῶ τῷ θεῷ ὅτι οὐδένα ὑμῶν ἐβάπτισα εἰ μὴ Κρίσπον καὶ Γάϊον',
   'eucharistō tō theō hoti oudena hymōn ebaptisa ei mē Krispon kai Gaion',
   '''Crispus'' — the synagogue ruler (Acts 18:8). ''Gaius'' — host of the whole church (Romans 16:23). Paul is thankful that his limited baptismal activity prevents anyone from claiming baptism in his name.',
   NULL),
  (15, 'Lest any should say that I had baptized in mine own name.',
   'ἵνα μή τις εἴπῃ ὅτι εἰς τὸ ἐμὸν ὄνομα ἐβαπτίσθητε',
   'hina mē tis eipē hoti eis to emon onoma ebaptisthēte',
   'Paul''s concern: no one can claim they were baptized ''in Paul''s name.'' Baptism is in Christ''s name — it creates allegiance to Christ, not to the baptizer.',
   NULL),
  (16, 'And I baptized also the household of Stephanas: besides, I know not whether I baptized any other.',
   'ἐβάπτισα δὲ καὶ τὸν Στεφανᾶ οἶκον λοιπὸν οὐκ οἶδα εἴ τινα ἄλλον ἐβάπτισα',
   'ebaptisa de kai ton Stephana oikon loipon ouk oida ei tina allon ebaptisa',
   '''Household of Stephanas'' (ton Stephana oikon — the whole household; cf. 16:15-16). ''I know not'' — Paul''s candid admission of uncertainty shows the letter is genuinely personal, not a polished oration. His point is that baptizing was not his primary mission.',
   NULL),
  (17, 'For Christ sent me not to baptize, but to preach the gospel: not with wisdom of words, lest the cross of Christ should be made of none effect.',
   'οὐ γὰρ ἀπέστειλέν με Χριστὸς βαπτίζειν ἀλλ᾿ εὐαγγελίζεσθαι οὐκ ἐν σοφίᾳ λόγου ἵνα μὴ κενωθῇ ὁ σταυρὸς τοῦ Χριστοῦ',
   'ou gar apesteilen me Christos baptizein all euangelizesthai ouk en sophia logou hina mē kenōthē ho stauros tou Christou',
   '''Sent me'' (apesteilen — commissioned, apostled). ''To preach the gospel'' (euangelizesthai — to announce the good news). ''Wisdom of words'' (sophia logou — rhetorical eloquence, philosophical sophistication). ''Made of none effect'' (kenōthē — emptied, hollowed out, robbed of power). Clever rhetoric can drain the cross of its power by making the message about the messenger''s skill rather than God''s power.',
   'This is a pivotal verse transitioning from the division problem to its theological root. The Corinthians were enamoured with worldly wisdom and rhetorical skill (sophia logou). Paul insists that the gospel must not be presented in a way that draws attention to human eloquence, because this ''empties'' (kenoō) the cross of its power. The cross saves not by being impressive to human reason but by being the power of God (v.18). Human wisdom and divine power are not complementary but antithetical as grounds of salvation.'),
  (18, 'For the preaching of the cross is to them that perish foolishness; but unto us which are saved it is the power of God.',
   'ὁ λόγος γὰρ ὁ τοῦ σταυροῦ τοῖς μὲν ἀπολλυμένοις μωρία ἐστίν τοῖς δὲ σῳζομένοις ἡμῖν δύναμις θεοῦ ἐστίν',
   'ho logos gar ho tou staurou tois men apollymenois mōria estin tois de sōzomenois hēmin dynamis theou estin',
   '''Preaching of the cross'' (logos tou staurou — the word/message of the cross). ''Perish'' (apollymenois — being destroyed; present participle: ongoing process). ''Foolishness'' (mōria — stupidity, absurdity; English ''moron'' derives from this). ''Saved'' (sōzomenois — being saved; also present: salvation is ongoing). ''Power of God'' (dynamis theou — the same phrase as Romans 1:16). The cross divides humanity into two groups based on their response.',
   'This verse is the thesis of Paul''s theology of the cross (theologia crucis). The ''word of the cross'' is not a philosophy but an announcement about a historical event. To the world, a crucified Messiah is absurd — the ultimate oxymoron. But to those being saved, this apparent absurdity is experienced as God''s dynamic power. The cross is the great dividing line of human history: foolishness to the perishing, power to the saved.'),
  (19, 'For it is written, I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent.',
   'γέγραπται γάρ ἀπολῶ τὴν σοφίαν τῶν σοφῶν καὶ τὴν σύνεσιν τῶν συνετῶν ἀθετήσω',
   'gegraptai gar apolō tēn sophian tōn sophōn kai tēn synesin tōn synetōn athetēsō',
   'Quoting Isaiah 29:14 (LXX). ''Destroy'' (apolō — abolish). ''Bring to nothing'' (athetēsō — set aside, nullify). God actively overturns human wisdom. The context in Isaiah is God''s judgment on Jerusalem''s wise counsellors who relied on political alliances rather than trusting God.',
   NULL),
  (20, 'Where is the wise? where is the scribe? where is the disputer of this world? hath not God made foolish the wisdom of this world?',
   'ποῦ σοφός ποῦ γραμματεύς ποῦ συζητητὴς τοῦ αἰῶνος τούτου οὐχὶ ἐμώρανεν ὁ θεὸς τὴν σοφίαν τοῦ κόσμου τούτου',
   'pou sophos pou grammateus pou syzētētēs tou aiōnos toutou ouchi emōranen ho theos tēn sophian tou kosmou toutou',
   '''Where is the wise?'' (sophos — the Greek philosopher). ''The scribe?'' (grammateus — the Jewish scholar). ''The disputer?'' (syzētētēs — the debater, intellectual combatant). Echoing Isaiah 33:18. Three rhetorical questions: where are all the experts now? ''Made foolish'' (emōranen — shown to be foolish). God has turned the world''s wisdom upside down.',
   NULL),
  (21, 'For after that in the wisdom of God the world by wisdom knew not God, it pleased God by the foolishness of preaching to save them that believe.',
   'ἐπειδὴ γὰρ ἐν τῇ σοφίᾳ τοῦ θεοῦ οὐκ ἔγνω ὁ κόσμος διὰ τῆς σοφίας τὸν θεόν εὐδόκησεν ὁ θεὸς διὰ τῆς μωρίας τοῦ κηρύγματος σῶσαι τοὺς πιστεύοντας',
   'epeidē gar en tē sophia tou theou ouk egnō ho kosmos dia tēs sophias ton theon eudokēsen ho theos dia tēs mōrias tou kērygmatos sōsai tous pisteuontas',
   '''In the wisdom of God'' — God wisely designed it so that human wisdom would fail to find him. ''Knew not God'' (ouk egnō — did not come to know). ''Foolishness of preaching'' (mōrias tou kērygmatos — the apparent absurdity of the proclamation). ''Pleased God'' (eudokēsen — God chose deliberately). ''Save them that believe'' (sōsai tous pisteuontas). God''s strategy: since human wisdom failed, God uses ''foolish'' preaching to save believers.',
   'This verse reveals the divine logic behind the cross: human wisdom was given its chance and failed. The world ''by wisdom knew not God'' — the philosophical enterprise could not produce saving knowledge of God. So God chose a radically different method: the ''foolishness of preaching'' — the announcement of a crucified Messiah. This is not anti-intellectualism but divine strategy: God deliberately chose a method that humbles human pride and makes salvation depend entirely on faith.'),
  (22, 'For the Jews require a sign, and the Greeks seek after wisdom:',
   'ἐπειδὴ καὶ Ἰουδαῖοι σημεῖα αἰτοῦσιν καὶ Ἕλληνες σοφίαν ζητοῦσιν',
   'epeidē kai Ioudaioi sēmeia aitousin kai Hellēnes sophian zētousin',
   '''Jews require a sign'' (sēmeia aitousin — demand miraculous proof; cf. Matthew 12:38-39). ''Greeks seek wisdom'' (sophian zētousin — search for philosophical understanding). Two different but equally inadequate approaches to God: the Jewish demand for demonstrations of power and the Greek quest for rational comprehension.',
   NULL),
  (23, 'But we preach Christ crucified, unto the Jews a stumblingblock, and unto the Greeks foolishness;',
   'ἡμεῖς δὲ κηρύσσομεν Χριστὸν ἐσταυρωμένον Ἰουδαίοις μὲν σκάνδαλον Ἕλλησιν δὲ μωρίαν',
   'hēmeis de kēryssomen Christon estaurōmenon Ioudaiois men skandalon Hellēsin de mōrian',
   '''We preach'' (kēryssomen — we herald, announce publicly). ''Christ crucified'' (Christon estaurōmenon — perfect participle: a crucified-and-still-crucified Christ; the crucifixion is a permanent, defining reality). ''Stumblingblock'' (skandalon — an offence, a trap; a crucified Messiah contradicts Jewish expectations of a conquering king). ''Foolishness'' (mōrian — absurdity; a crucified god contradicts Greek philosophical wisdom).',
   'This is one of the most important verses in Pauline theology. ''Christ crucified'' is the irreducible core of the gospel. The perfect participle estaurōmenon means Christ is permanently identified with his cross. Jews expected a conquering Messiah (skandalon); Greeks expected divine wisdom to be elegant and rational (mōria). The gospel offends both expectations. Paul refuses to adjust the message to satisfy either demand.'),
  (24, 'But unto them which are called, both Jews and Greeks, Christ the power of God, and the wisdom of God.',
   'αὐτοῖς δὲ τοῖς κλητοῖς Ἰουδαίοις τε καὶ Ἕλλησιν Χριστὸν θεοῦ δύναμιν καὶ θεοῦ σοφίαν',
   'autois de tois klētois Ioudaiois te kai Hellēsin Christon theou dynamin kai theou sophian',
   '''Called'' (klētois — the effectually called; those whom God summons and who respond). ''Power of God'' (theou dynamin — Christ is God''s power, not merely evidence of it). ''Wisdom of God'' (theou sophian — Christ is God''s wisdom, not merely a teacher of it). Christ himself is both the sign the Jews seek and the wisdom the Greeks desire. He fulfils both quests in a way neither expected.',
   NULL),
  (25, 'Because the foolishness of God is wiser than men; and the weakness of God is stronger than men.',
   'ὅτι τὸ μωρὸν τοῦ θεοῦ σοφώτερον τῶν ἀνθρώπων ἐστίν καὶ τὸ ἀσθενὲς τοῦ θεοῦ ἰσχυρότερον τῶν ἀνθρώπων ἐστίν',
   'hoti to mōron tou theou sophōteron tōn anthrōpōn estin kai to asthenes tou theou ischyroteron tōn anthrōpōn estin',
   '''Foolishness of God'' (to mōron tou theou — God''s apparent foolishness; an oxymoron, since God cannot actually be foolish). ''Wiser than men'' — even God''s ''foolish'' plan surpasses the highest human wisdom. ''Weakness of God'' (to asthenes tou theou — God''s apparent weakness: the cross). ''Stronger than men'' — the cross, which looks weak, overpowers all human strength. Paul uses irony to shatter human pride.',
   NULL),
  (26, 'For ye see your calling, brethren, how that not many wise men after the flesh, not many mighty, not many noble, are called:',
   'βλέπετε γὰρ τὴν κλῆσιν ὑμῶν ἀδελφοί ὅτι οὐ πολλοὶ σοφοὶ κατὰ σάρκα οὐ πολλοὶ δυνατοί οὐ πολλοὶ εὐγενεῖς',
   'blepete gar tēn klēsin hymōn adelphoi hoti ou polloi sophoi kata sarka ou polloi dynatoi ou polloi eugeneis',
   '''Your calling'' (tēn klēsin — look at the membership of your church). ''Not many wise'' (ou polloi sophoi — not many intellectuals). ''Not many mighty'' (dynatoi — powerful, influential). ''Not many noble'' (eugeneis — well-born, aristocratic). ''Not many'' — not none; but the majority of the Corinthian church came from the lower social strata. This was not accidental but deliberate divine strategy.',
   NULL),
  (27, 'But God hath chosen the foolish things of the world to confound the wise; and God hath chosen the weak things of the world to confound the things which are mighty;',
   'ἀλλὰ τὰ μωρὰ τοῦ κόσμου ἐξελέξατο ὁ θεός ἵνα τοὺς σοφοὺς καταισχύνῃ καὶ τὰ ἀσθενῆ τοῦ κόσμου ἐξελέξατο ὁ θεός ἵνα καταισχύνῃ τὰ ἰσχυρά',
   'alla ta mōra tou kosmou exelexato ho theos hina tous sophous kataischynē kai ta asthenē tou kosmou exelexato ho theos hina kataischynē ta ischyra',
   '''God hath chosen'' (exelexato ho theos — God selected, chose; aorist: a definite, decisive choice). ''Foolish things'' (ta mōra — the stupid things by worldly standards). ''Confound'' (kataischynē — put to shame, humiliate). ''Weak things'' (ta asthenē — the powerless). God''s elective strategy deliberately inverts worldly hierarchies.',
   NULL),
  (28, 'And base things of the world, and things which are despised, hath God chosen, yea, and things which are not, to bring to nought things that are:',
   'καὶ τὰ ἀγενῆ τοῦ κόσμου καὶ τὰ ἐξουθενημένα ἐξελέξατο ὁ θεός καὶ τὰ μὴ ὄντα ἵνα τὰ ὄντα καταργήσῃ',
   'kai ta agenē tou kosmou kai ta exouthenēmena exelexato ho theos kai ta mē onta hina ta onta katargēsē',
   '''Base'' (agenē — low-born, insignificant; the opposite of eugeneis in v.26). ''Despised'' (exouthenēmena — counted as nothing). ''Things which are not'' (ta mē onta — the non-existent, the nobodies). ''Bring to nought'' (katargēsē — abolish, render ineffective). God creates from nothing (ex nihilo); he also saves from nothing. He takes nobodies and makes them something.',
   NULL),
  (29, 'That no flesh should glory in his presence.',
   'ὅπως μὴ καυχήσηται πᾶσα σὰρξ ἐνώπιον τοῦ θεοῦ',
   'hopōs mē kauchēsētai pasa sarx enōpion tou theou',
   '''No flesh'' (pasa sarx — all flesh; the entire human race). ''Glory'' (kauchēsētai — boast). ''In his presence'' (enōpion tou theou — before God''s face). The purpose of God''s counter-intuitive election strategy: the elimination of all human boasting. No one stands before God on their own merits.',
   'This is the ultimate purpose clause of vv.26-28. God chose the foolish, weak, base, despised, and non-existent so that every mouth would be stopped. No human being will stand before God and boast in their wisdom, power, birth, or accomplishment. The cross eliminates all grounds for human pride. This is not cruelty but mercy: boasting is the enemy of grace. When boasting is removed, grace alone remains.'),
  (30, 'But of him are ye in Christ Jesus, who of God is made unto us wisdom, and righteousness, and sanctification, and redemption:',
   'ἐξ αὐτοῦ δὲ ὑμεῖς ἐστε ἐν Χριστῷ Ἰησοῦ ὃς ἐγενήθη σοφία ἡμῖν ἀπὸ θεοῦ δικαιοσύνη τε καὶ ἁγιασμὸς καὶ ἀπολύτρωσις',
   'ex autou de hymeis este en Christō Iēsou hos egenēthē sophia hēmin apo theou dikaiosynē te kai hagiasmos kai apolytrōsis',
   '''Of him'' (ex autou — from God as source). ''In Christ Jesus'' — union with Christ is the basis of everything. ''Made unto us'' (egenēthē — became for us). ''Wisdom'' (sophia — Christ is God''s wisdom in person). ''Righteousness'' (dikaiosynē — our right standing before God). ''Sanctification'' (hagiasmos — our progressive holiness). ''Redemption'' (apolytrōsis — our complete deliverance). Christ is everything we need.',
   'This verse is one of the richest christological summaries in the NT. Christ has ''become for us'' (egenēthē) four things from God: (1) Wisdom — he is the true wisdom the Greeks sought; (2) Righteousness — justification (chs.1-5 of Romans); (3) Sanctification — progressive holiness; (4) Redemption — complete liberation. These four encompass the whole of salvation: its basis (wisdom), its beginning (righteousness), its progress (sanctification), and its consummation (redemption). All are found ''in Christ Jesus'' — not in ourselves.'),
  (31, 'That, according as it is written, He that glorieth, let him glory in the Lord.',
   'ἵνα καθὼς γέγραπται ὁ καυχώμενος ἐν κυρίῳ καυχάσθω',
   'hina kathōs gegraptai ho kauchōmenos en kyriō kauchasthō',
   'Quoting Jeremiah 9:23-24 (LXX). ''Glory in the Lord'' (en kyriō kauchasthō — boast in the Lord). The only legitimate boasting is boasting in what God has done. This verse is the practical conclusion of the entire argument: since everything comes from God through Christ (v.30), all boasting must be directed to God, not to human leaders, wisdom, or accomplishment.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 1;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.9 fellowship
  ('κοινωνία', 'koinōnia', 'G2842', 'Fellowship, partnership, participation, sharing — from koinos (common, shared). Believers are called into koinōnia with Christ — intimate partnership in his life, death, and resurrection. This koinōnia is the basis of all church unity. The Corinthians'' divisions (vv.10-12) are a betrayal of this fellowship. Koinōnia implies mutual responsibility and shared life, not merely social contact.', 1),
  -- v.10 divisions
  ('σχίσμα', 'schisma', 'G4978', 'Division, tear, split — from schizō (to split, rip apart). Used of tearing a garment (Matthew 9:16) or splitting rocks (Matthew 27:51). The Corinthian church was being ripped apart by personality cults. A schisma is not a formal separation but a factional tear in the community''s fabric. Paul commands that the church be ''mended'' (katartizō — restored, like mending nets).', 2),
  -- v.17 wisdom of words
  ('σοφία', 'sophia', 'G4678', 'Wisdom — the central concept of chapters 1-3. Paul distinguishes between the wisdom of this world (sophia tou kosmou — human philosophy, rhetoric, and intellectual achievement) and the wisdom of God (sophia tou theou — the divine plan embodied in the cross). The Corinthians'' love of eloquent wisdom was undermining the gospel''s power by shifting attention from God''s action to human skill.', 3),
  -- v.18 preaching of the cross
  ('σταυρός', 'stauros', 'G4716', 'Cross, stake — the instrument of Roman execution, reserved for slaves, criminals, and enemies of the state. To Greeks it was barbaric; to Jews it signified divine curse (Deuteronomy 21:23). Paul makes this shameful instrument the centre of his theology. The ''word of the cross'' (logos tou staurou) is the message about Christ''s crucifixion as God''s saving act.', 4),
  -- v.18 power of God
  ('δύναμις', 'dynamis', 'G1411', 'Power, ability, might — inherent divine capability. The cross is not merely a message about God''s power but is itself God''s power in operation. When the crucified Christ is proclaimed and believed, divine power is released for salvation. This power is not philosophical persuasion but supernatural transformation. English ''dynamite'' derives from this word.', 5),
  -- v.23 stumblingblock
  ('σκάνδαλον', 'skandalon', 'G4625', 'Stumblingblock, offence, trap — originally the trigger of a trap or snare. A crucified Messiah was a skandalon to Jews because it contradicted their expectation of a conquering king (cf. Isaiah 8:14, Romans 9:33). The cross is inherently offensive — it cannot be made palatable to human pride without being emptied of its power (v.17).', 6),
  -- v.27 chosen
  ('ἐκλέγομαι', 'eklegomai', 'G1586', 'To choose, select, elect — from ek (out of) + legō (to gather, pick). God''s sovereign choice of the foolish, weak, and base to accomplish his purposes. This election is not arbitrary but purposeful: ''that no flesh should glory in his presence'' (v.29). God''s choices systematically overturn worldly hierarchies to ensure that salvation is by grace alone.', 7),
  -- v.30 redemption
  ('ἀπολύτρωσις', 'apolytrōsis', 'G629', 'Redemption, release, liberation — from apo (away from) + lytrōsis (ransoming, from lytron, ransom price). The complete deliverance Christ accomplished: liberation from sin''s penalty (justification), sin''s power (sanctification), and ultimately sin''s presence (glorification). In v.30, apolytrōsis is the climactic fourth gift, pointing to the final, complete salvation still to come.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 1
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 9
    WHEN 2 THEN 10
    WHEN 3 THEN 17
    WHEN 4 THEN 18 WHEN 5 THEN 18
    WHEN 6 THEN 23
    WHEN 7 THEN 27
    WHEN 8 THEN 30
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 sanctified, called saints
  (2, 'Romans 1:7', 1),
  (2, '2 Timothy 1:9', 2),
  -- v.7 waiting for revelation
  (7, 'Philippians 3:20', 3),
  (7, 'Titus 2:13', 4),
  -- v.8 confirm unto the end
  (8, '1 Thessalonians 5:23-24', 5),
  (8, 'Philippians 1:6', 6),
  -- v.9 God is faithful
  (9, '1 Thessalonians 5:24', 7),
  (9, '2 Thessalonians 3:3', 8),
  (9, '1 John 1:3', 9),
  -- v.10 no divisions
  (10, 'Philippians 2:2', 10),
  (10, 'John 17:21', 11),
  -- v.12 party slogans
  (12, '1 Corinthians 3:4-6', 12),
  -- v.13 is Christ divided
  (13, 'Ephesians 4:4-6', 13),
  -- v.17 not wisdom of words
  (17, '1 Corinthians 2:1-5', 14),
  (17, '2 Corinthians 10:10', 15),
  -- v.18 preaching of the cross
  (18, 'Romans 1:16', 16),
  (18, '2 Corinthians 4:7', 17),
  -- v.19 destroy wisdom of wise
  (19, 'Isaiah 29:14', 18),
  -- v.20 where is the wise
  (20, 'Isaiah 33:18', 19),
  (20, 'Isaiah 19:12', 20),
  -- v.21 world by wisdom knew not God
  (21, 'Romans 1:21-22', 21),
  -- v.22 Jews require signs
  (22, 'Matthew 12:38-39', 22),
  (22, 'John 4:48', 23),
  -- v.23 Christ crucified
  (23, 'Galatians 3:13', 24),
  (23, 'Galatians 5:11', 25),
  -- v.24 power and wisdom
  (24, 'Colossians 2:3', 26),
  -- v.26 not many wise
  (26, 'James 2:5', 27),
  (26, 'Matthew 11:25', 28),
  -- v.27 foolish to confound
  (27, '1 Corinthians 3:18-19', 29),
  -- v.29 no flesh glory
  (29, 'Ephesians 2:8-9', 30),
  (29, 'Romans 3:27', 31),
  -- v.30 wisdom righteousness sanctification redemption
  (30, 'Colossians 2:3', 32),
  (30, 'Romans 3:24', 33),
  (30, 'Ephesians 1:7', 34),
  -- v.31 glory in the Lord
  (31, 'Jeremiah 9:23-24', 35),
  (31, '2 Corinthians 10:17', 36)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 1
  AND v.verse_number = cr.verse_number;
