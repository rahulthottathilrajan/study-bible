-- ═══════════════════════════════════════════════════
-- 1 TIMOTHY CHAPTER 1 — Sound Doctrine and Paul's Testimony
-- 20 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '1 Timothy 1 establishes the letter''s purpose and tone. Paul writes to his ''own son in the faith'' (v.2), urging him to ''charge some that they teach no other doctrine'' (v.3) and avoid ''fables and endless genealogies, which minister questions, rather than godly edifying'' (v.4). ''The end of the commandment is charity out of a pure heart, and of a good conscience, and of faith unfeigned'' (v.5). Some have ''turned aside unto vain jangling; desiring to be teachers of the law; understanding neither what they say, nor whereof they affirm'' (vv.6-7). The law is ''good, if a man use it lawfully'' — it is for the lawless, not the righteous (vv.8-10). Paul then shares his own testimony as the supreme example of grace: ''Christ Jesus came into the world to save sinners; of whom I am chief'' (v.15). He had been ''a blasphemer, and a persecutor, and injurious'' but ''obtained mercy'' so that in him ''Jesus Christ might shew forth all longsuffering, for a pattern to them which should hereafter believe on him to life everlasting'' (vv.13-16). A doxology follows: ''Now unto the King eternal, immortal, invisible, the only wise God, be honour and glory for ever and ever'' (v.17). The chapter closes with Paul charging Timothy to ''war a good warfare; holding faith, and a good conscience'' (vv.18-19), warning of Hymenaeus and Alexander who have ''made shipwreck'' of the faith (vv.19-20).',
  'Sound Doctrine and the Grace That Saves the Chief of Sinners',
  'ὑγιαίνουσα διδασκαλία (hygiainousa didaskalia)',
  'Sound doctrine, healthy teaching — from hygiainō (to be healthy, to be sound; the root of ''hygiene'') + didaskalia (teaching, instruction). A key phrase in the Pastoral Epistles: doctrine that produces spiritual health, as opposed to false teaching that spreads like gangrene (2 Tim 2:17). Sound doctrine is not merely correct but life-giving.',
  '["Greeting and Charge Against False Teachers (vv.1-7): Paul an apostle of Jesus Christ by the commandment of God our Saviour and Lord Jesus Christ which is our hope; unto Timothy my own son in the faith grace mercy and peace; as I besought thee to abide still at Ephesus when I went into Macedonia that thou mightest charge some that they teach no other doctrine; the end of the commandment is charity out of a pure heart and of a good conscience and of faith unfeigned","The Proper Use of the Law (vv.8-11): But we know that the law is good if a man use it lawfully; knowing this that the law is not made for a righteous man but for the lawless and disobedient for the ungodly and for sinners; according to the glorious gospel of the blessed God which was committed to my trust","Paul''s Testimony — Chief of Sinners Saved by Grace (vv.12-17): I thank Christ Jesus our Lord who hath enabled me for that he counted me faithful putting me into the ministry; who was before a blasphemer and a persecutor and injurious but I obtained mercy; this is a faithful saying and worthy of all acceptation that Christ Jesus came into the world to save sinners of whom I am chief; howbeit for this cause I obtained mercy that in me first Jesus Christ might shew forth all longsuffering for a pattern; now unto the King eternal immortal invisible the only wise God be honour and glory for ever and ever amen","The Charge to Timothy (vv.18-20): This charge I commit unto thee son Timothy according to the prophecies which went before on thee that thou by them mightest war a good warfare; holding faith and a good conscience which some having put away concerning faith have made shipwreck; of whom is Hymenaeus and Alexander whom I have delivered unto Satan that they may learn not to blaspheme"]'
FROM books b WHERE b.name = '1 Timothy';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Paul, an apostle of Jesus Christ by the commandment of God our Saviour, and Lord Jesus Christ, which is our hope;',
   'Παῦλος ἀπόστολος Ἰησοῦ Χριστοῦ κατ᾽ ἐπιταγὴν θεοῦ σωτῆρος ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ τῆς ἐλπίδος ἡμῶν',
   'Paulos apostolos Iēsou Christou kat'' epitagēn theou sōtēros hēmōn kai kyriou Iēsou Christou tēs elpidos hēmōn',
   '''By the commandment'' (kat'' epitagēn — by authoritative command; stronger than ''by the will of God'' in other letters). ''God our Saviour'' (theou sōtēros hēmōn — a distinctive Pastoral Epistles title, emphasising God the Father as saviour). ''Lord Jesus Christ, which is our hope'' (kyriou Iēsou Christou tēs elpidos hēmōn — Christ himself is the hope, not merely the giver of hope). Paul''s authority is doubly grounded: commanded by God, authenticated by Christ.',
   NULL),
  (2, 'Unto Timothy, my own son in the faith: Grace, mercy, and peace, from God our Father and Jesus Christ our Lord.',
   'Τιμοθέῳ γνησίῳ τέκνῳ ἐν πίστει χάρις ἔλεος εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ Χριστοῦ Ἰησοῦ τοῦ κυρίου ἡμῶν',
   'Timotheō gnēsiō teknō en pistei charis eleos eirēnē apo theou patros hēmōn kai Christou Iēsou tou kyriou hēmōn',
   '''My own son'' (gnēsiō teknō — legitimate, genuine child; gnēsios means born in wedlock, hence genuine, authentic). ''In the faith'' (en pistei — in the sphere of faith; Timothy is Paul''s spiritual child). ''Grace, mercy, and peace'' — the Pastoral Epistles uniquely add ''mercy'' (eleos) to the standard Pauline greeting. Mercy is God''s compassion toward the wretched — especially fitting for those in ministry who face constant difficulty.',
   NULL),
  (3, 'As I besought thee to abide still at Ephesus, when I went into Macedonia, that thou mightest charge some that they teach no other doctrine,',
   'Καθὼς παρεκάλεσά σε προσμεῖναι ἐν Ἐφέσῳ πορευόμενος εἰς Μακεδονίαν ἵνα παραγγείλῃς τισὶν μὴ ἑτεροδιδασκαλεῖν',
   'Kathōs parekalesa se prosmeinai en Ephesō poreuomenos eis Makedonian hina parangelēs tisin mē heterodidaskalein',
   '''Charge'' (parangelēs — command, give strict orders; a military term for passing on orders from a commanding officer). ''Teach no other doctrine'' (mē heterodidaskalein — not to teach differently, not to deviate from the apostolic teaching; heteros means ''other of a different kind''). Timothy''s primary task in Ephesus: guard the doctrinal integrity of the church. False teaching is not merely incorrect — it is a different gospel altogether.',
   NULL),
  (4, 'Neither give heed to fables and endless genealogies, which minister questions, rather than godly edifying which is in faith: so do.',
   'μηδὲ προσέχειν μύθοις καὶ γενεαλογίαις ἀπεράντοις αἵτινες ζητήσεις παρέχουσιν μᾶλλον ἢ οἰκονομίαν θεοῦ τὴν ἐν πίστει',
   'mēde prosechein mythois kai genealogiais aperantois haitines zētēseis parechousin mallon ē oikonomian theou tēn en pistei',
   '''Fables'' (mythois — myths, fictions, invented stories). ''Endless genealogies'' (genealogiais aperantois — interminable ancestral lists; possibly Jewish speculations about OT genealogies, or proto-Gnostic aeon-series). ''Minister questions'' (zētēseis parechousin — produce controversies, generate useless debates). ''Godly edifying'' (oikonomian theou — God''s stewardship plan, the administration of God''s purpose). False teaching produces controversy; sound teaching produces faith and spiritual growth.',
   NULL),
  (5, 'Now the end of the commandment is charity out of a pure heart, and of a good conscience, and of faith unfeigned:',
   'τὸ δὲ τέλος τῆς παραγγελίας ἐστὶν ἀγάπη ἐκ καθαρᾶς καρδίας καὶ συνειδήσεως ἀγαθῆς καὶ πίστεως ἀνυποκρίτου',
   'to de telos tēs parangelias estin agapē ek katharas kardias kai syneidēseōs agathēs kai pisteōs anypokritou',
   '''The end'' (to telos — the goal, the purpose, the aim). ''Of the commandment'' (tēs parangelias — of the charge). ''Charity'' (agapē — love; the goal of all sound teaching is love). Three sources of genuine love: (1) ''pure heart'' (katharas kardias — a heart cleansed from mixed motives); (2) ''good conscience'' (syneidēseōs agathēs — a conscience free from known guilt); (3) ''faith unfeigned'' (pisteōs anypokritou — sincere, unhypocritical faith). The test of doctrine: does it produce love from a clean heart?',
   'The goal of sound teaching: This verse defines the purpose of all Christian instruction. The aim is not mere intellectual correctness but love — love that springs from three sources: a purified heart, a clear conscience, and genuine faith. Any teaching that does not produce love has missed the mark. This is Paul''s criterion for distinguishing healthy doctrine from unhealthy speculation: does it produce love?'),
  (6, 'From which some having swerved have turned aside unto vain jangling;',
   'ὧν τινες ἀστοχήσαντες ἐξετράπησαν εἰς ματαιολογίαν',
   'hōn tines astochēsantes exetrapēsan eis mataiologian',
   '''Swerved'' (astochēsantes — missed the mark, deviated from the target; from a, not + stochos, a mark or target; archery imagery). ''Turned aside'' (exetrapēsan — turned off the path, went astray). ''Vain jangling'' (mataiologian — empty talk, fruitless discussion, meaningless chatter). Those who miss the target of love (v.5) inevitably wander into pointless talk.',
   NULL),
  (7, 'Desiring to be teachers of the law; understanding neither what they say, nor whereof they affirm.',
   'θέλοντες εἶναι νομοδιδάσκαλοι μὴ νοοῦντες μήτε ἃ λέγουσιν μήτε περὶ τίνων διαβεβαιοῦνται',
   'thelontes einai nomodidaskaloi mē noountes mēte ha legousin mēte peri tinōn diabebaiountai',
   '''Teachers of the law'' (nomodidaskaloi — those who teach the Torah; they aspire to the status of Jewish legal experts). ''Understanding neither what they say'' (mē noountes mēte ha legousin — they do not comprehend their own words). ''Nor whereof they affirm'' (mēte peri tinōn diabebaiountai — nor the matters about which they speak so confidently). A devastating assessment: they are confident but ignorant, authoritative in tone but empty in content.',
   NULL),
  (8, 'But we know that the law is good, if a man use it lawfully;',
   'οἴδαμεν δὲ ὅτι καλὸς ὁ νόμος ἐάν τις αὐτῷ νομίμως χρῆται',
   'oidamen de hoti kalos ho nomos ean tis autō nomimōs chrētai',
   '''Good'' (kalos — noble, excellent, beautiful in function). ''Lawfully'' (nomimōs — according to its intended purpose, in the way it was designed to be used). A wordplay: the law (nomos) must be used in a law-abiding way (nomimōs). The law is not the problem; misuse of the law is the problem. The proper use of the law is defined in vv.9-10.',
   NULL),
  (9, 'Knowing this, that the law is not made for a righteous man, but for the lawless and disobedient, for the ungodly and for sinners, for unholy and profane, for murderers of fathers and murderers of mothers, for manslayers,',
   'εἰδὼς τοῦτο ὅτι δικαίῳ νόμος οὐ κεῖται ἀνόμοις δὲ καὶ ἀνυποτάκτοις ἀσεβέσιν καὶ ἁμαρτωλοῖς ἀνοσίοις καὶ βεβήλοις πατρολῴαις καὶ μητρολῴαις ἀνδροφόνοις',
   'eidōs touto hoti dikaiō nomos ou keitai anomois de kai anypotaktois asebesin kai hamartōlois anosiois kai bebēlois patrolōais kai mētrolōais androphonois',
   '''Not made for a righteous man'' (dikaiō nomos ou keitai — the law is not laid down for the righteous; it does not target those who are already living rightly). The list follows the structure of the Ten Commandments: ''lawless and disobedient'' (general rebellion), ''ungodly and sinners'' (against God), ''unholy and profane'' (against holiness), ''murderers of fathers and mothers'' (5th commandment), ''manslayers'' (6th commandment). The law exposes and restrains sin; it does not sanctify the already righteous.',
   NULL),
  (10, 'For whoremongers, for them that defile themselves with mankind, for menstealers, for liars, for perjured persons, and if there be any other thing that is contrary to sound doctrine;',
   'πόρνοις ἀρσενοκοίταις ἀνδραποδισταῖς ψεύσταις ἐπιόρκοις καὶ εἴ τι ἕτερον τῇ ὑγιαινούσῃ διδασκαλίᾳ ἀντίκειται',
   'pornois arsenokoitais andrapodistais pseustais epiorkois kai ei ti heteron tē hygiainousē didaskalia antikeitai',
   'The list continues: ''whoremongers'' (pornois — the sexually immoral, 7th commandment area), ''them that defile themselves with mankind'' (arsenokoitais — those who lie with males; from arsēn, male + koitē, bed; 7th commandment), ''menstealers'' (andrapodistais — slave-traders, kidnappers; 8th commandment), ''liars, perjured persons'' (pseustais, epiorkois — false witnesses; 9th commandment). ''Sound doctrine'' (hygiainousē didaskalia — healthy, health-producing teaching; the first use of this key Pastoral term). Sound doctrine is the standard against which all conduct is measured.',
   NULL),
  (11, 'According to the glorious gospel of the blessed God, which was committed to my trust.',
   'κατὰ τὸ εὐαγγέλιον τῆς δόξης τοῦ μακαρίου θεοῦ ὃ ἐπιστεύθην ἐγώ',
   'kata to euangelion tēs doxēs tou makariou theou ho episteuthēn egō',
   '''Glorious gospel'' (euangelion tēs doxēs — the gospel of the glory; the gospel radiates God''s glory). ''Blessed God'' (makariou theou — the happy, blessed God; God is not a grim deity but a blessed, joyful God). ''Committed to my trust'' (episteuthēn egō — entrusted to me; Paul was entrusted with a treasure). The gospel is the standard of sound doctrine: whatever contradicts it is unsound.',
   NULL),
  (12, 'And I thank Christ Jesus our Lord, who hath enabled me, for that he counted me faithful, putting me into the ministry;',
   'καὶ χάριν ἔχω τῷ ἐνδυναμώσαντί με Χριστῷ Ἰησοῦ τῷ κυρίῳ ἡμῶν ὅτι πιστόν με ἡγήσατο θέμενος εἰς διακονίαν',
   'kai charin echō tō endynamōsanti me Christō Iēsou tō kyriō hēmōn hoti piston me hēgēsato themenos eis diakonian',
   '''Enabled me'' (endynamōsanti me — empowered me, strengthened me; the same verb as Eph 6:10). ''Counted me faithful'' (piston me hēgēsato — regarded me as trustworthy). ''Putting me into the ministry'' (themenos eis diakonian — appointing me to service). Paul''s gratitude overflows: Christ empowered, trusted, and commissioned him. This leads directly to his testimony of what he was before grace (v.13).',
   NULL),
  (13, 'Who was before a blasphemer, and a persecutor, and injurious: but I obtained mercy, because I did it ignorantly in unbelief.',
   'τὸν πρότερον ὄντα βλάσφημον καὶ διώκτην καὶ ὑβριστήν ἀλλ᾽ ἠλεήθην ὅτι ἀγνοῶν ἐποίησα ἐν ἀπιστίᾳ',
   'ton proteron onta blasphēmon kai diōktēn kai hybristēn all'' ēleēthēn hoti agnoōn epoiēsa en apistia',
   '''Blasphemer'' (blasphēmon — one who speaks against God; Paul had blasphemed Christ and compelled others to blaspheme, Acts 26:11). ''Persecutor'' (diōktēn — one who pursues with intent to harm). ''Injurious'' (hybristēn — violent, insolent, an arrogant aggressor). ''Obtained mercy'' (ēleēthēn — was shown mercy; passive: mercy was done to him). ''Ignorantly in unbelief'' (agnoōn en apistia — acting in ignorance through unbelief). Paul''s ignorance did not excuse his sin but was the ground on which God showed mercy.',
   NULL),
  (14, 'And the grace of our Lord was exceeding abundant with faith and love which is in Christ Jesus.',
   'ὑπερεπλεόνασεν δὲ ἡ χάρις τοῦ κυρίου ἡμῶν μετὰ πίστεως καὶ ἀγάπης τῆς ἐν Χριστῷ Ἰησοῦ',
   'hyperepleonasen de hē charis tou kyriou hēmōn meta pisteōs kai agapēs tēs en Christō Iēsou',
   '''Exceeding abundant'' (hyperepleonasen — super-abounded, overflowed exceedingly; a compound unique to Paul: hyper + pleonazō. Where sin abounded, grace did much more abound, Rom 5:20). ''With faith and love'' — grace did not come alone but brought faith and love with it. Grace is not merely forgiveness but transformation: it produces faith (toward God) and love (toward others). ''In Christ Jesus'' — the sphere where grace, faith, and love operate.',
   NULL),
  (15, 'This is a faithful saying, and worthy of all acceptation, that Christ Jesus came into the world to save sinners; of whom I am chief.',
   'πιστὸς ὁ λόγος καὶ πάσης ἀποδοχῆς ἄξιος ὅτι Χριστὸς Ἰησοῦς ἦλθεν εἰς τὸν κόσμον ἁμαρτωλοὺς σῶσαι ὧν πρῶτός εἰμι ἐγώ',
   'pistos ho logos kai pasēs apodochēs axios hoti Christos Iēsous ēlthen eis ton kosmon hamartōlous sōsai hōn prōtos eimi egō',
   '''Faithful saying'' (pistos ho logos — a trustworthy word; the first of five ''faithful sayings'' in the Pastoral Epistles: 1 Tim 1:15, 3:1, 4:9; 2 Tim 2:11; Titus 3:8). ''Worthy of all acceptation'' (pasēs apodochēs axios — deserving of complete acceptance by everyone). ''Came into the world to save sinners'' — the simplest summary of the gospel: Christ came, sinners are saved. ''Of whom I am chief'' (hōn prōtos eimi egō — of whom I am the first, the foremost). Paul uses the present tense ''I am'' (not ''I was''), indicating ongoing awareness of his sinfulness.',
   'Christ came to save sinners: This ''faithful saying'' is the gospel in miniature. Three elements: (1) Christ Jesus — the divine-human Saviour; (2) came into the world — the incarnation, a deliberate mission from heaven to earth; (3) to save sinners — the purpose: rescue the undeserving. Paul''s ''I am chief'' is not false humility but genuine insight: the closer one draws to Christ''s holiness, the more one sees one''s own sinfulness. Paul is the living proof that no sinner is beyond grace.'),
  (16, 'Howbeit for this cause I obtained mercy, that in me first Jesus Christ might shew forth all longsuffering, for a pattern to them which should hereafter believe on him to life everlasting.',
   'ἀλλὰ διὰ τοῦτο ἠλεήθην ἵνα ἐν ἐμοὶ πρώτῳ ἐνδείξηται Ἰησοῦς Χριστὸς τὴν πᾶσαν μακροθυμίαν πρὸς ὑποτύπωσιν τῶν μελλόντων πιστεύειν ἐπ᾽ αὐτῷ εἰς ζωὴν αἰώνιον',
   'alla dia touto ēleēthēn hina en emoi prōtō endeixētai Iēsous Christos tēn pasan makrothymian pros hypotypōsin tōn mellontōn pisteuein ep'' autō eis zōēn aiōnion',
   '''For a pattern'' (pros hypotypōsin — as a prototype, a sketch, a model; from hypo + typos; an outline drawing from which others can be filled in). Paul is the prototype of mercy — the exhibit A of grace. If Christ can save the chief of sinners, no one is beyond reach. ''All longsuffering'' (pasan makrothymian — the full extent of Christ''s patience). ''Life everlasting'' (zōēn aiōnion — the ultimate destination of those who believe).',
   NULL),
  (17, 'Now unto the King eternal, immortal, invisible, the only wise God, be honour and glory for ever and ever. Amen.',
   'τῷ δὲ βασιλεῖ τῶν αἰώνων ἀφθάρτῳ ἀοράτῳ μόνῳ σοφῷ θεῷ τιμὴ καὶ δόξα εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'tō de basilei tōn aiōnōn aphthartō aoratō monō sophō theō timē kai doxa eis tous aiōnas tōn aiōnōn amēn',
   '''King eternal'' (basilei tōn aiōnōn — King of the ages, ruler over all history). ''Immortal'' (aphthartō — incorruptible, imperishable). ''Invisible'' (aoratō — unseen, not perceivable by physical sight). ''The only wise God'' (monō sophō theō — some manuscripts omit ''wise''; the one and only God). ''Honour and glory for ever'' — Paul''s testimony of grace naturally erupts into doxology. When one has been forgiven much, one worships much.',
   NULL),
  (18, 'This charge I commit unto thee, son Timothy, according to the prophecies which went before on thee, that thou by them mightest war a good warfare;',
   'Ταύτην τὴν παραγγελίαν παρατίθεμαί σοι τέκνον Τιμόθεε κατὰ τὰς προαγούσας ἐπὶ σὲ προφητείας ἵνα στρατεύῃ ἐν αὐταῖς τὴν καλὴν στρατείαν',
   'Tautēn tēn parangelian paratithemai soi teknon Timotheē kata tas proagousas epi se prophēteias hina strateuē en autais tēn kalēn strateian',
   '''Charge'' (parangelian — the military order, the commission). ''Commit'' (paratithemai — deposit, entrust; like a sacred deposit placed in trusted hands). ''Prophecies which went before on thee'' (proagousas prophēteias — prophetic words spoken over Timothy earlier, possibly at his ordination, 4:14). ''War a good warfare'' (strateuē tēn kalēn strateian — fight the noble campaign). Timothy''s ministry is spiritual warfare; the prophecies spoken over him are his battle orders.',
   NULL),
  (19, 'Holding faith, and a good conscience; which some having put away concerning faith have made shipwreck:',
   'ἔχων πίστιν καὶ ἀγαθὴν συνείδησιν ἥν τινες ἀπωσάμενοι περὶ τὴν πίστιν ἐναυάγησαν',
   'echōn pistin kai agathēn syneidēsin hēn tines apōsamenoi peri tēn pistin enauagēsan',
   '''Holding'' (echōn — having, holding on to). ''Faith and a good conscience'' — the two weapons for warfare. ''Put away'' (apōsamenoi — thrust away, pushed aside deliberately; middle voice: they themselves chose to reject it). ''Made shipwreck'' (enauagēsan — suffered shipwreck; used only here and 2 Cor 11:25 in the NT). The image is vivid: faith is the vessel; conscience is the rudder. Reject the conscience, and the ship of faith crashes on the rocks.',
   NULL),
  (20, 'Of whom is Hymenaeus and Alexander; whom I have delivered unto Satan, that they may learn not to blaspheme.',
   'ὧν ἐστιν Ὑμέναιος καὶ Ἀλέξανδρος οὓς παρέδωκα τῷ Σατανᾷ ἵνα παιδευθῶσιν μὴ βλασφημεῖν',
   'hōn estin Hymenaios kai Alexandros hous paredōka tō Satana hina paideuthōsin mē blasphēmein',
   '''Hymenaeus'' (mentioned again in 2 Tim 2:17, teaching that the resurrection is past). ''Alexander'' (possibly the coppersmith of 2 Tim 4:14). ''Delivered unto Satan'' (paredōka tō Satana — handed over to Satan; cf. 1 Cor 5:5; a form of severe church discipline: expulsion from the protective community into Satan''s realm). ''That they may learn'' (hina paideuthōsin — that they may be trained, disciplined; the purpose is remedial, not merely punitive). Even this severe action aims at restoration: learning not to blaspheme.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Timothy' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 5 (End of the commandment is love)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τέλος', 'telos', 'G5056', 'End, goal, purpose, aim — not ''termination'' but ''fulfilment,'' the intended destination. The goal of all Christian instruction is love. Any teaching that does not produce love has failed, regardless of its intellectual correctness.', 1),
  ('ἀνυποκρίτου', 'anypokritou', 'G505', 'Unfeigned, without hypocrisy, sincere — from a (not) + hypokrinomai (to play a part, to act on stage). Faith that is not theatrical, not performing for an audience, but genuinely held. The word ''hypocrite'' originally meant an actor wearing a mask.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 10 (Sound doctrine)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑγιαινούσῃ', 'hygiainousē', 'G5198', 'Sound, healthy — from hygiainō (to be in good health; the root of ''hygiene''). A key term in the Pastoral Epistles (1 Tim 1:10, 6:3; 2 Tim 1:13, 4:3; Titus 1:9, 13, 2:1, 2). Doctrine is like food: healthy doctrine nourishes; unhealthy doctrine sickens. The metaphor of spiritual health pervades these letters.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Verse 15 (Christ came to save sinners)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πιστὸς ὁ λόγος', 'pistos ho logos', 'G4103+G3056', 'Faithful saying, trustworthy word — a formula unique to the Pastoral Epistles, introducing a statement of established Christian truth. It signals a creedal or confessional statement that the church can rely on absolutely. Five such sayings appear in the Pastorals.', 1),
  ('πρῶτος', 'prōtos', 'G4413', 'First, chief, foremost — Paul claims to be the first, the foremost of sinners. Not ''worst in history'' but ''chief in my own estimation.'' The present tense (eimi, I am) is significant: Paul does not say ''I was'' but ''I am'' — his sense of unworthiness grows as his knowledge of Christ deepens.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 1 AND v.verse_number = 15;

-- Verse 16 (Pattern for future believers)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑποτύπωσιν', 'hypotypōsin', 'G5296', 'Pattern, prototype, sketch, outline — from hypo (under) + typos (a mark, an impression). A rough draft from which a finished work is produced. Paul is the preliminary sketch of what grace can do; every subsequent believer is the finished painting. If God could save Paul, the chief of sinners, he can save anyone.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Son in the faith
  (2, '2 Timothy 1:2', 1), (2, 'Philippians 2:22', 2),
  -- v5: End of the commandment is love
  (5, 'Romans 13:10', 1), (5, 'Galatians 5:14', 2), (5, 'Matthew 22:37-40', 3),
  -- v8: Law is good if used lawfully
  (8, 'Romans 7:12', 1), (8, 'Romans 3:31', 2),
  -- v13: Blasphemer, persecutor
  (13, 'Acts 8:3', 1), (13, 'Acts 9:1', 2), (13, '1 Corinthians 15:9', 3),
  -- v14: Grace exceeding abundant
  (14, 'Romans 5:20', 1), (14, '2 Corinthians 9:14', 2),
  -- v15: Christ came to save sinners
  (15, 'Luke 19:10', 1), (15, 'John 3:17', 2), (15, 'Matthew 9:13', 3),
  -- v17: King eternal
  (17, 'Romans 16:27', 1), (17, 'Revelation 15:3', 2),
  -- v18: War a good warfare
  (18, '2 Timothy 4:7', 1), (18, '1 Timothy 6:12', 2),
  -- v19: Shipwreck of faith
  (19, '1 Timothy 6:21', 1), (19, 'Hebrews 6:4-6', 2),
  -- v20: Delivered unto Satan
  (20, '1 Corinthians 5:5', 1), (20, '2 Timothy 2:17', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Timothy Chapter 1 Complete
-- 20 verses · 4 key verses with word studies (7 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
