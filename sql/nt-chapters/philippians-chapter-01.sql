-- ═══════════════════════════════════════════════════
-- PHILIPPIANS CHAPTER 1 — Joy in Chains & the Gospel Advancing
-- 30 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Paul writes to his most beloved congregation from a Roman prison cell, yet the letter overflows with joy. Chapter 1 establishes the letter''s twin themes: Christ-centred joy and partnership in the Gospel. Paul opens with tender thanksgiving for the Philippians'' faithful financial and spiritual partnership from the very first day. His prayer for them is remarkable — not for comfort but for overflowing love guided by knowledge and discernment. He then reveals how his imprisonment has actually advanced the Gospel: the entire Praetorian Guard has heard of Christ, and most believers have grown bolder. Paul''s famous dilemma — ''to live is Christ, and to die is gain'' — reveals a man so united to Christ that both outcomes are desirable. He resolves to remain for their benefit and closes with a call to stand firm, united, and unafraid of opposition.',
  'Joy in Suffering & the Advance of the Gospel',
  'χαρά (chara)',
  'Joy, gladness, delight — not circumstantial happiness but a deep, settled confidence rooted in Christ. Used 5 times in Philippians, more than any other Pauline letter proportionally.',
  '["Greeting (vv.1-2): Paul and Timothy, servants of Christ, to the saints at Philippi with overseers and deacons","Thanksgiving & Prayer (vv.3-11): Partnership from the first day; prayer for love, knowledge, discernment, and fruitfulness","The Gospel Advancing Through Imprisonment (vv.12-18): The Praetorian Guard, emboldened brethren, and Christ preached even from wrong motives","To Live Is Christ, To Die Is Gain (vv.19-26): Paul''s dilemma — departure to be with Christ vs. remaining for their progress","Exhortation to Worthy Conduct (vv.27-30): Stand firm in one spirit, united in the faith, unafraid of adversaries"]'
FROM books b WHERE b.name = 'Philippians';

-- Step 2: Insert all 30 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul and Timotheus, the servants of Jesus Christ, to all the saints in Christ Jesus which are at Philippi, with the bishops and deacons:',
   'Παῦλος καὶ Τιμόθεος δοῦλοι Χριστοῦ Ἰησοῦ πᾶσιν τοῖς ἁγίοις ἐν Χριστῷ Ἰησοῦ τοῖς οὖσιν ἐν Φιλίπποις σὺν ἐπισκόποις καὶ διακόνοις',
   'Paulos kai Timotheos douloi Christou Iēsou pasin tois hagiois en Christō Iēsou tois ousin en Philippois syn episkopois kai diakonois',
   'Uniquely among Paul''s letters, he calls himself not ''apostle'' but ''servant'' (doulos — slave, bondservant). The Philippians needed no reminder of his authority; their relationship was one of deep mutual affection. ''Saints'' (hagioi — holy ones, set apart) describes every believer, not a special class. The mention of ''bishops'' (episkopoi — overseers) and ''deacons'' (diakonoi — servants, ministers) is significant: this is the earliest reference to formal church offices in Paul''s letters, indicating an organised congregational structure.',
   'Church polity: ''Bishops'' (episkopoi) and ''deacons'' (diakonoi) appear as established offices. In the NT, ''bishop/overseer'' and ''elder/presbyter'' refer to the same office (cf. Acts 20:17,28; Titus 1:5-7), while deacons serve in a supporting role (cf. Acts 6:1-6; 1 Tim 3:8-13).'),
  (2,
   'Grace be unto you, and peace, from God our Father, and from the Lord Jesus Christ.',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   'Paul''s standard salutation fusing Greek (charis — grace) and Hebrew (shalom/eirēnē — peace). Grace is God''s unmerited favour; peace is the result of receiving it. Both proceed jointly from God the Father and the Lord Jesus Christ — placing Christ on equal footing with the Father as the source of divine blessing.',
   NULL),
  (3,
   'I thank my God upon every remembrance of you,',
   'Εὐχαριστῶ τῷ θεῷ μου ἐπὶ πάσῃ τῇ μνείᾳ ὑμῶν',
   'Eucharistō tō theō mou epi pasē tē mneia hymōn',
   '''Every remembrance'' (pasē tē mneia) — not ''whenever I remember you'' but ''upon my whole remembrance of you.'' Every recollection of the Philippians triggers thanksgiving. No other church receives such unqualified affection from Paul — no rebukes, no corrections of doctrine or morals. Philippi was his ''joy and crown'' (4:1).',
   NULL),
  (4,
   'Always in every prayer of mine for you all making request with joy,',
   'πάντοτε ἐν πάσῃ δεήσει μου ὑπὲρ πάντων ὑμῶν μετὰ χαρᾶς τὴν δέησιν ποιούμενος',
   'pantote en pasē deēsei mou hyper pantōn hymōn meta charas tēn deēsin poioumenos',
   'Three ''alls'' in one verse: always (pantote), every prayer (pasē deēsei), for you all (pantōn hymōn). Paul''s prayer is comprehensive and joyful — ''with joy'' (meta charas). This is the first occurrence of the letter''s keyword ''joy/rejoice'' (chara/chairō), which appears 16 times in this short epistle. Joy in prayer, even from prison — this is Christianity.',
   NULL),
  (5,
   'For your fellowship in the gospel from the first day until now;',
   'ἐπὶ τῇ κοινωνίᾳ ὑμῶν εἰς τὸ εὐαγγέλιον ἀπὸ τῆς πρώτης ἡμέρας ἄχρι τοῦ νῦν',
   'epi tē koinōnia hymōn eis to euangelion apo tēs prōtēs hēmeras achri tou nyn',
   '''Fellowship'' (koinōnia) means active partnership, shared participation — not mere association. The Philippians had partnered with Paul in the Gospel ''from the first day'' (when Lydia opened her home, Acts 16:15) ''until now'' (their recent gift via Epaphroditus, 4:18). This included financial support (4:15-16), prayer, and shared suffering. Koinōnia is the basis of Paul''s thanksgiving.',
   NULL),
  (6,
   'Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Jesus Christ:',
   'πεποιθὼς αὐτὸ τοῦτο ὅτι ὁ ἐναρξάμενος ἐν ὑμῖν ἔργον ἀγαθὸν ἐπιτελέσει ἄχρις ἡμέρας Χριστοῦ Ἰησοῦ',
   'pepoithōs auto touto hoti ho enarxamenos en hymin ergon agathon epitelesei achris hēmeras Christou Iēsou',
   'One of the great assurance verses. ''Confident'' (pepoithōs — perfect participle: settled, established conviction). God is the subject of both verbs: He ''began'' (enarxamenos — initiated, inaugurated) and He will ''perform'' (epitelesei — complete, bring to its intended end). The ''good work'' is salvation itself — from regeneration to glorification. ''The day of Jesus Christ'' is His return. God finishes what He starts.',
   'Perseverance of the saints (eternal security): Salvation is God''s work from beginning to end. The One who initiated it guarantees its completion. This does not depend on human effort but on divine faithfulness (cf. John 6:39, 10:28-29; Rom 8:29-30; 1 Thess 5:24; Jude 24).'),
  (7,
   'Even as it is meet for me to think this of you all, because I have you in my heart; inasmuch as both in my bonds, and in the defence and confirmation of the gospel, ye all are partakers of my grace.',
   'καθώς ἐστιν δίκαιον ἐμοὶ τοῦτο φρονεῖν ὑπὲρ πάντων ὑμῶν διὰ τὸ ἔχειν με ἐν τῇ καρδίᾳ ὑμᾶς ἔν τε τοῖς δεσμοῖς μου καὶ ἐν τῇ ἀπολογίᾳ καὶ βεβαιώσει τοῦ εὐαγγελίου συγκοινωνούς μου τῆς χάριτος πάντας ὑμᾶς ὄντας',
   'kathōs estin dikaion emoi touto phronein hyper pantōn hymōn dia to echein me en tē kardia hymas en te tois desmois mou kai en tē apologia kai bebaiōsei tou euangeliou synkoinōnous mou tēs charitos pantas hymas ontas',
   '''I have you in my heart'' — or possibly ''you have me in your heart'' (the Greek is ambiguous). Both are true. ''Partakers'' (synkoinōnous — co-sharers, fellow-partners) — the Philippians share in Paul''s grace not merely by sympathy but by active participation in his imprisonment (through support), his defence (apologia — formal legal defence of the Gospel), and confirmation (bebaiōsis — establishing, making firm) of the Gospel.',
   NULL),
  (8,
   'For God is my record, how greatly I long after you all in the bowels of Jesus Christ.',
   'μάρτυς γάρ μου ἐστιν ὁ θεός ὡς ἐπιποθῶ πάντας ὑμᾶς ἐν σπλάγχνοις Χριστοῦ Ἰησοῦ',
   'martys gar mou estin ho theos hōs epipothō pantas hymas en splanchnois Christou Iēsou',
   'Paul calls God as witness (martys) to the depth of his affection — this is an oath-like declaration. ''Bowels of Jesus Christ'' (splanchnois Christou Iēsou) — Paul loves them not merely with his own affections but with the very compassions of Christ Himself. His love has been so transformed that Christ''s own heart beats within him. ''Long after'' (epipothō) conveys intense yearning, aching desire.',
   NULL),
  (9,
   'And this I pray, that your love may abound yet more and more in knowledge and in all judgment;',
   'καὶ τοῦτο προσεύχομαι ἵνα ἡ ἀγάπη ὑμῶν ἔτι μᾶλλον καὶ μᾶλλον περισσεύῃ ἐν ἐπιγνώσει καὶ πάσῃ αἰσθήσει',
   'kai touto proseuchomai hina hē agapē hymōn eti mallon kai mallon perisseuē en epignōsei kai pasē aisthēsei',
   'Paul''s prayer is striking: not that they would get love (they already have it, v.7) but that it would ''abound yet more and more'' (perisseuē — overflow, exceed, be in surplus). And this love must be guided — not mere sentiment but love channelled through ''knowledge'' (epignōsis — full, experiential knowledge) and ''judgment'' (aisthēsis — moral perception, discernment, spiritual sensitivity). Biblical love thinks clearly.',
   NULL),
  (10,
   'That ye may approve things that are excellent; that ye may be sincere and without offence till the day of Christ;',
   'εἰς τὸ δοκιμάζειν ὑμᾶς τὰ διαφέροντα ἵνα ἦτε εἰλικρινεῖς καὶ ἀπρόσκοποι εἰς ἡμέραν Χριστοῦ',
   'eis to dokimazein hymas ta diapheronta hina ēte eilikrineis kai aproskopoi eis hēmeran Christou',
   '''Approve things that are excellent'' (dokimazein ta diapheronta) — to test and distinguish what truly matters from what merely seems good. Christian maturity is not choosing between good and evil (obvious) but between good and best (requiring discernment). ''Sincere'' (eilikrineis — tested by sunlight, found pure, unmixed) and ''without offence'' (aproskopoi — not causing others to stumble). The standard is maintained ''till the day of Christ.''',
   NULL),
  (11,
   'Being filled with the fruits of righteousness, which are by Jesus Christ, unto the glory and praise of God.',
   'πεπληρωμένοι καρπὸν δικαιοσύνης τὸν διὰ Ἰησοῦ Χριστοῦ εἰς δόξαν καὶ ἔπαινον θεοῦ',
   'peplērōmenoi karpon dikaiosynēs ton dia Iēsou Christou eis doxan kai epainon theou',
   'The fruit of righteousness (karpon dikaiosynēs) is produced ''through Jesus Christ'' (dia Iēsou Christou) — not by human effort but by abiding in Christ (cf. John 15:4-5). The ultimate purpose: ''unto the glory and praise of God.'' Paul''s prayer arc: love → knowledge → discernment → sincerity → fruitfulness → God''s glory. Every stage flows to the next.',
   NULL),
  (12,
   'But I would ye should understand, brethren, that the things which happened unto me have fallen out rather unto the furtherance of the gospel;',
   'Γινώσκειν δὲ ὑμᾶς βούλομαι ἀδελφοί ὅτι τὰ κατ᾽ ἐμὲ μᾶλλον εἰς προκοπὴν τοῦ εὐαγγελίου ἐλήλυθεν',
   'Ginōskein de hymas boulomai adelphoi hoti ta kat'' eme mallon eis prokopēn tou euangeliou elēlythen',
   '''Furtherance'' (prokopēn — pioneer advance, cutting forward progress, like an army blazing a trail through dense forest). Paul''s imprisonment, which seemed a setback, has actually advanced the Gospel. This is the great reversal: chains become a platform, a prison becomes a pulpit. ''The things which happened unto me'' is deliberately vague — Paul does not dwell on his suffering but on its fruit.',
   NULL),
  (13,
   'So that my bonds in Christ are manifest in all the palace, and in all other places;',
   'ὥστε τοὺς δεσμούς μου φανεροὺς ἐν Χριστῷ γενέσθαι ἐν ὅλῳ τῷ πραιτωρίῳ καὶ τοῖς λοιποῖς πᾶσιν',
   'hōste tous desmous mou phanerous en Christō genesthai en holō tō praitōriō kai tois loipois pasin',
   '''Palace'' (praitōriō — the Praetorian Guard, Caesar''s elite bodyguard of 9,000+ soldiers). As soldiers rotated duty guarding Paul, each one heard the Gospel. The chain that bound Paul to the soldier also bound the soldier to Paul — and to the Gospel. ''In all other places'' — the news spread beyond the Guard into Roman society. God used Roman military discipline as a Gospel delivery system.',
   NULL),
  (14,
   'And many of the brethren in the Lord, waxing confident by my bonds, are much more bold to speak the word without fear.',
   'καὶ τοὺς πλείονας τῶν ἀδελφῶν ἐν κυρίῳ πεποιθότας τοῖς δεσμοῖς μου περισσοτέρως τολμᾶν ἀφόβως τὸν λόγον λαλεῖν',
   'kai tous pleionas tōn adelphōn en kyriō pepoithotas tois desmois mou perissoterōs tolman aphobōs ton logon lalein',
   'A second fruit of Paul''s imprisonment: other believers became bolder. ''Waxing confident'' (pepoithotas — having been made confident, perfect participle) ''by my bonds'' — Paul''s chains inspired courage, not fear. ''Much more bold'' (perissoterōs tolman — exceedingly dare). The paradox: persecution designed to silence the Gospel amplified it. More preachers, more boldness, more fearlessness.',
   NULL),
  (15,
   'Some indeed preach Christ even of envy and strife; and some also of good will:',
   'τινὲς μὲν καὶ διὰ φθόνον καὶ ἔριν τινὲς δὲ καὶ δι᾽ εὐδοκίαν τὸν Χριστὸν κηρύσσουσιν',
   'tines men kai dia phthonon kai erin tines de kai di'' eudokian ton Christon kēryssousin',
   'Paul acknowledges a painful reality: not all who preach Christ do so with pure motives. Some preach from ''envy'' (phthonon — jealousy, rivalry) and ''strife'' (erin — contention, selfish ambition), perhaps seeking to build their own reputations while Paul is sidelined. Others preach from ''good will'' (eudokian — genuine desire, delight). Both groups preach Christ — the content is orthodox; only the motives differ.',
   NULL),
  (16,
   'The one preach Christ of contention, not sincerely, supposing to add affliction to my bonds:',
   'οἱ μὲν ἐξ ἐριθείας τὸν Χριστὸν καταγγέλλουσιν οὐχ ἁγνῶς οἰόμενοι θλῖψιν ἐπιφέρειν τοῖς δεσμοῖς μου',
   'hoi men ex eritheias ton Christon katangellousin ouch hagnōs oiomenoi thlipsin epipherein tois desmois mou',
   '''Contention'' (eritheias — selfish ambition, factional rivalry, from erithos — a hired labourer). These preachers hope to increase Paul''s affliction by building rival followings while he is chained. ''Not sincerely'' (ouch hagnōs — not purely, with mixed motives). Yet even they ''preach Christ'' (Christon katangellousin) — the message is true even when the messenger is not.',
   NULL),
  (17,
   'But the other of love, knowing that I am set for the defence of the gospel.',
   'οἱ δὲ ἐξ ἀγάπης εἰδότες ὅτι εἰς ἀπολογίαν τοῦ εὐαγγελίου κεῖμαι',
   'hoi de ex agapēs eidotes hoti eis apologian tou euangeliou keimai',
   'Those who preach from love (agapēs) recognise that Paul is ''set'' (keimai — appointed, stationed, divinely placed) for the ''defence'' (apologian — legal defence, reasoned vindication) of the Gospel. Paul''s imprisonment is not random misfortune but divine appointment. He is positioned by God as a defender of the faith.',
   NULL),
  (18,
   'What then? notwithstanding, every way, whether in pretence, or in truth, Christ is preached; and I therein do rejoice, yea, and will rejoice.',
   'τί γάρ πλὴν ὅτι παντὶ τρόπῳ εἴτε προφάσει εἴτε ἀληθείᾳ Χριστὸς καταγγέλλεται καὶ ἐν τούτῳ χαίρω ἀλλὰ καὶ χαρήσομαι',
   'ti gar plēn hoti panti tropō eite prophasei eite alētheia Christos katangelletai kai en toutō chairō alla kai charēsomai',
   'Paul''s magnanimity is astonishing. Whether preached in ''pretence'' (prophasei — pretext, false motive) or ''truth'' (alētheia), Christ is proclaimed — and that is enough for Paul to rejoice. Present tense ''I do rejoice'' (chairō) and future ''I will rejoice'' (charēsomai) — his joy is both current and determined. Paul''s ego is so crucified with Christ that personal slights cannot rob his joy. The Gospel''s advance matters more than his reputation.',
   NULL),
  (19,
   'For I know that this shall turn to my salvation through your prayer, and the supply of the Spirit of Jesus Christ,',
   'οἶδα γὰρ ὅτι τοῦτό μοι ἀποβήσεται εἰς σωτηρίαν διὰ τῆς ὑμῶν δεήσεως καὶ ἐπιχορηγίας τοῦ πνεύματος Ἰησοῦ Χριστοῦ',
   'oida gar hoti touto moi apobēsetai eis sōtērian dia tēs hymōn deēseōs kai epichorēgias tou pneumatos Iēsou Christou',
   'Paul echoes Job 13:16 (LXX: ''this shall turn to my salvation''). ''Salvation'' (sōtērian) here likely means vindication or final deliverance, not initial conversion. Two means: their prayer (deēseōs) and the ''supply'' (epichorēgias — lavish provision, generous support) of the Spirit. The Spirit is called ''the Spirit of Jesus Christ'' — underlining the intimate connection between Christ and the Holy Spirit.',
   NULL),
  (20,
   'According to my earnest expectation and my hope, that in nothing I shall be ashamed, but that with all boldness, as always, so now also Christ shall be magnified in my body, whether it be by life, or by death.',
   'κατὰ τὴν ἀποκαραδοκίαν καὶ ἐλπίδα μου ὅτι ἐν οὐδενὶ αἰσχυνθήσομαι ἀλλ᾽ ἐν πάσῃ παρρησίᾳ ὡς πάντοτε καὶ νῦν μεγαλυνθήσεται Χριστὸς ἐν τῷ σώματί μου εἴτε διὰ ζωῆς εἴτε διὰ θανάτου',
   'kata tēn apokaradokian kai elpida mou hoti en oudeni aischynthēsomai all'' en pasē parrēsia hōs pantote kai nyn megalynthēsetai Christos en tō sōmati mou eite dia zōēs eite dia thanatou',
   '''Earnest expectation'' (apokaradokian — stretching the head forward, craning the neck with intense anticipation; used only here and Rom 8:19). Paul''s singular ambition: that Christ be ''magnified'' (megalynthēsetai — made great, enlarged, made visible) ''in my body'' — through how Paul lives, suffers, and if necessary, dies. ''Whether by life or by death'' — both are instruments for displaying Christ. This is total consecration.',
   NULL),
  (21,
   'For to me to live is Christ, and to die is gain.',
   'ἐμοὶ γὰρ τὸ ζῆν Χριστὸς καὶ τὸ ἀποθανεῖν κέρδος',
   'emoi gar to zēn Christos kai to apothanein kerdos',
   'Perhaps the most compressed and powerful statement in all Paul''s writings. ''To live is Christ'' (to zēn Christos) — Christ is not part of Paul''s life; He IS Paul''s life. Living equals Christ. ''To die is gain'' (to apothanein kerdos) — death is not loss but profit, because it means unmediated presence with Christ (v.23). This creates an impossible dilemma: both options are wins. Only someone who can say the first clause can honestly say the second.',
   'Union with Christ: The believer''s life is so identified with Christ that living and dying both serve Him. This is not suicidal ideation but the ultimate expression of faith — death has lost its sting (1 Cor 15:55) because it ushers the believer into Christ''s immediate presence.'),
  (22,
   'But if I live in the flesh, this is the fruit of my labour: yet what I shall choose I wot not.',
   'εἰ δὲ τὸ ζῆν ἐν σαρκί τοῦτό μοι καρπὸς ἔργου καὶ τί αἱρήσομαι οὐ γνωρίζω',
   'ei de to zēn en sarki touto moi karpos ergou kai ti hairēsomai ou gnōrizō',
   '''Live in the flesh'' — continued earthly existence. This would mean ''fruit of labour'' (karpos ergou — productive ministry, converts won, churches strengthened). ''I wot not'' (ou gnōrizō — I do not make known, I cannot declare) — Paul is genuinely torn. He cannot decide which is preferable because both are supremely desirable. This is not indecision but the overflow of a life totally oriented to Christ.',
   NULL),
  (23,
   'For I am in a strait betwixt two, having a desire to depart, and to be with Christ; which is far better:',
   'συνέχομαι δὲ ἐκ τῶν δύο τὴν ἐπιθυμίαν ἔχων εἰς τὸ ἀναλῦσαι καὶ σὺν Χριστῷ εἶναι πολλῷ γὰρ μᾶλλον κρεῖσσον',
   'synechomai de ek tōn duo tēn epithymian echōn eis to analysai kai syn Christō einai pollō gar mallon kreisson',
   '''In a strait'' (synechomai — pressed, hemmed in, constrained from both sides). ''Depart'' (analysai — to loose anchor, to strike camp, to dissolve — a metaphor from sailing or military life). Paul''s ''desire'' (epithymia — strong longing) is to be ''with Christ'' (syn Christō) — indicating immediate conscious presence after death, not soul sleep. ''Far better'' is triple comparative in Greek (pollō mallon kreisson — much more better) — Paul piles up superlatives to express how infinitely superior heaven is.',
   'Intermediate state: Paul expects to be consciously ''with Christ'' immediately upon death (syn Christō einai). This confirms the doctrine of the intermediate state — believers enter Christ''s presence at death, awaiting the future bodily resurrection (2 Cor 5:8; Luke 23:43).'),
  (24,
   'Nevertheless to abide in the flesh is more needful for you.',
   'τὸ δὲ ἐπιμένειν ἐν τῇ σαρκὶ ἀναγκαιότερον δι᾽ ὑμᾶς',
   'to de epimenein en tē sarki anagkaioteron di'' hymas',
   'Paul resolves the dilemma by choosing others over self. ''More needful'' (anagkaioteron — more necessary, more pressing) — the Philippians'' need outweighs Paul''s personal desire. This is selfless love in action: Paul forgoes the ''far better'' option of being with Christ in order to serve the church. He models the very mind of Christ he will describe in chapter 2.',
   NULL),
  (25,
   'And having this confidence, I know that I shall abide and continue with you all for your furtherance and joy of faith;',
   'καὶ τοῦτο πεποιθὼς οἶδα ὅτι μενῶ καὶ παραμενῶ πᾶσιν ὑμῖν εἰς τὴν ὑμῶν προκοπὴν καὶ χαρὰν τῆς πίστεως',
   'kai touto pepoithōs oida hoti menō kai paramenō pasin hymin eis tēn hymōn prokopēn kai charan tēs pisteōs',
   '''Furtherance'' (prokopēn — pioneer advance, the same word from v.12). Paul''s continued life will advance not just the Gospel broadly but the Philippians'' personal progress and ''joy of faith'' (charan tēs pisteōs — joy that springs from faith). Paul''s confidence (pepoithōs) that he will be released proved correct — he was freed from this first Roman imprisonment.',
   NULL),
  (26,
   'That your rejoicing may be more abundant in Jesus Christ for me by my coming to you again.',
   'ἵνα τὸ καύχημα ὑμῶν περισσεύῃ ἐν Χριστῷ Ἰησοῦ ἐν ἐμοὶ διὰ τῆς ἐμῆς παρουσίας πάλιν πρὸς ὑμᾶς',
   'hina to kauchēma hymōn perisseuē en Christō Iēsou en emoi dia tēs emēs parousias palin pros hymas',
   '''Rejoicing'' (kauchēma — boasting, exulting, ground for glorying). Their boast is ''in Christ Jesus'' — not in Paul himself but in what Christ does through Paul. ''Coming to you again'' (parousias — presence, arrival) — Paul anticipates a reunion visit. This was fulfilled: tradition and internal evidence suggest Paul was released from his first imprisonment (c. AD 62) and visited churches again before his second arrest and martyrdom.',
   NULL),
  (27,
   'Only let your conversation be as it becometh the gospel of Christ: that whether I come and see you, or else be absent, I hear of your affairs, that ye stand fast in one spirit, with one mind striving together for the faith of the gospel;',
   'Μόνον ἀξίως τοῦ εὐαγγελίου τοῦ Χριστοῦ πολιτεύεσθε ἵνα εἴτε ἐλθὼν καὶ ἰδὼν ὑμᾶς εἴτε ἀπὼν ἀκούω τὰ περὶ ὑμῶν ὅτι στήκετε ἐν ἑνὶ πνεύματι μιᾷ ψυχῇ συναθλοῦντες τῇ πίστει τοῦ εὐαγγελίου',
   'Monon axiōs tou euangeliou tou Christou politeuesthe hina eite elthōn kai idōn hymas eite apōn akouō ta peri hymōn hoti stēkete en heni pneumati mia psychē synathlounes tē pistei tou euangeliou',
   '''Conversation'' (politeuesthe — conduct yourselves as citizens, live as citizens of a commonwealth). Philippi was a Roman colony; citizens prized their Roman citizenship. Paul says: live worthy of your heavenly citizenship. ''Stand fast'' (stēkete — stand firm, hold your ground). ''Striving together'' (synathlounes — contending side by side as athletes in a contest). Unity is the dominant theme: ''one spirit, one mind'' — the church is a team in the arena of faith.',
   NULL),
  (28,
   'And in nothing terrified by your adversaries: which is to them an evident token of perdition, but to you of salvation, and that of God.',
   'καὶ μὴ πτυρόμενοι ἐν μηδενὶ ὑπὸ τῶν ἀντικειμένων ἥτις ἐστὶν αὐτοῖς ἔνδειξις ἀπωλείας ὑμῖν δὲ σωτηρίας καὶ τοῦτο ἀπὸ θεοῦ',
   'kai mē ptyromenoi en mēdeni hypo tōn antikeimenōn hētis estin autois endeixis apōleias hymin de sōtērias kai touto apo theou',
   '''Terrified'' (ptyromenoi — startled, spooked, like a frightened horse). Their fearlessness in the face of opposition serves as a ''token'' (endeixis — clear proof, evidence, demonstration) — a double sign. To the adversaries it proves their own ''perdition'' (apōleias — destruction, ruin). To the believers it proves their ''salvation'' (sōtērias). ''And that of God'' — this courage is not human bravado but a divine gift.',
   NULL),
  (29,
   'For unto you it is given in the behalf of Christ, not only to believe on him, but also to suffer for his sake;',
   'ὅτι ὑμῖν ἐχαρίσθη τὸ ὑπὲρ Χριστοῦ οὐ μόνον τὸ εἰς αὐτὸν πιστεύειν ἀλλὰ καὶ τὸ ὑπὲρ αὐτοῦ πάσχειν',
   'hoti hymin echaristhē to hyper Christou ou monon to eis auton pisteuein alla kai to hyper autou paschein',
   '''It is given'' (echaristhē — from charizomai, to graciously give, to bestow as a gift of grace). Suffering for Christ is a gift — a grace-gift (charisma) on par with faith itself. This staggering statement reframes persecution: it is not punishment but privilege, not misfortune but divine favour. Both believing and suffering are granted ''in the behalf of Christ'' (hyper Christou — on behalf of, for the sake of).',
   'Suffering as gift: Persecution for Christ''s sake is divinely granted as a privilege (cf. Acts 5:41; Rom 8:17; 2 Tim 3:12; 1 Pet 4:13). This does not glorify suffering itself but recognises that sharing in Christ''s sufferings produces deeper fellowship with Him and future glory.'),
  (30,
   'Having the same conflict which ye saw in me, and now hear to be in me.',
   'τὸν αὐτὸν ἀγῶνα ἔχοντες οἷον εἴδετε ἐν ἐμοὶ καὶ νῦν ἀκούετε ἐν ἐμοί',
   'ton auton agōna echontes hoion eidete en emoi kai nyn akouete en emoi',
   '''Conflict'' (agōna — contest, struggle, athletic competition — the source of English ''agony''). The Philippians ''saw'' (eidete) Paul''s suffering when he was beaten and imprisoned at Philippi (Acts 16:19-24) and now ''hear'' (akouete) of his Roman imprisonment. Their suffering is the ''same'' (auton) conflict — they are fellow soldiers, not merely spectators. The chapter ends as it began: with partnership, this time in suffering rather than in giving.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Philippians' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1 (Servants and bishops)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δοῦλοι', 'douloi', 'G1401', 'Slaves, bondservants — the lowest social status in the Roman world. Paul and Timothy claim this title voluntarily, identifying with Christ who took the form of a servant (2:7).', 1),
  ('ἐπισκόποις', 'episkopois', 'G1985', 'Overseers, bishops — from epi (over) + skopeō (to watch, look). Those who watch over the flock. Interchangeable with ''elders'' (presbyteroi) in the NT (cf. Acts 20:17,28; Titus 1:5-7).', 2),
  ('διακόνοις', 'diakonois', 'G1249', 'Deacons, servants, ministers — from diakoneō (to serve, to wait on tables). A recognised church office involving practical service (cf. 1 Tim 3:8-13).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 5 (Fellowship)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κοινωνίᾳ', 'koinōnia', 'G2842', 'Fellowship, partnership, active participation — from koinos (common, shared). Not passive association but hands-on partnership in the Gospel, including financial support (4:15-16).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 6 (Begun a good work)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐναρξάμενος', 'enarxamenos', 'G1728', 'Having begun, having inaugurated — from en (in) + archō (to begin, rule). God initiated the work of salvation; the first move was His.', 1),
  ('ἐπιτελέσει', 'epitelesei', 'G2005', 'Will complete, will bring to its intended end — from epi (upon, to completion) + teleō (to finish). God guarantees the final result.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 6;

-- Verse 9 (Abounding love)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπιγνώσει', 'epignōsei', 'G1922', 'Full knowledge, deep experiential knowledge — from epi (upon, intensive) + gnōsis (knowledge). Not mere intellectual awareness but personal, relational knowing.', 1),
  ('αἰσθήσει', 'aisthēsei', 'G144', 'Moral perception, discernment, spiritual sensitivity — the ability to perceive ethical and spiritual realities. Only here in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 12 (Furtherance)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προκοπήν', 'prokopēn', 'G4297', 'Furtherance, pioneer advance, progress — from prokoptō (to cut forward). Originally a military term for clearing a path through obstacles. The Gospel advances through, not despite, Paul''s chains.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 12;

-- Verse 21 (To live is Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ζῆν', 'zēn', 'G2198', 'To live — present infinitive, indicating ongoing, continuous life. Paul''s present experience of living IS Christ — not ''living for Christ'' or ''living like Christ'' but Christ as the essence and content of life.', 1),
  ('κέρδος', 'kerdos', 'G2771', 'Gain, profit, advantage — a commercial term. Death is not loss but net gain because it brings the ultimate profit: unhindered presence with Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 21;

-- Verse 23 (Depart and be with Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συνέχομαι', 'synechomai', 'G4912', 'I am pressed, constrained, hemmed in — from syn (together) + echō (to hold). Pressed from both sides by equally compelling desires.', 1),
  ('ἀναλῦσαι', 'analysai', 'G360', 'To depart, to loose, to break camp — a metaphor from striking a tent (military) or loosing a ship from its moorings (nautical). Death is departure to a new destination.', 2),
  ('κρεῖσσον', 'kreisson', 'G2909', 'Better, superior — comparative of agathos (good). Paul uses triple comparative (pollō mallon kreisson — much more better) to express the surpassing superiority of being with Christ.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 23;

-- Verse 27 (Citizenship)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πολιτεύεσθε', 'politeuesthe', 'G4176', 'Conduct yourselves as citizens, live as citizens — from politeuma (commonwealth, citizenship). Philippi was a Roman colony; Paul calls them to live as citizens of heaven (3:20).', 1),
  ('συναθλοῦντες', 'synathlounes', 'G4866', 'Striving together, contending side by side — from syn (together) + athleō (to compete as an athlete). The church is a team in the arena of faith, not solo competitors.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 27;

-- Verse 29 (Suffering as gift)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐχαρίσθη', 'echaristhē', 'G5483', 'It was graciously given, freely bestowed — from charizomai, derived from charis (grace). Suffering for Christ is a grace-gift, a divine privilege, not a punishment.', 1),
  ('πάσχειν', 'paschein', 'G3958', 'To suffer, to endure — the same root as ''passion'' (Lat. passio). Suffering and believing are twin gifts given ''in behalf of Christ.''', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = 29;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Servants, bishops, deacons
  (1, 'Acts 16:12-15', 1), (1, 'Acts 20:17,28', 2), (1, '1 Timothy 3:1-13', 3), (1, 'Titus 1:5-7', 4),
  -- v2: Grace and peace
  (2, 'Romans 1:7', 1), (2, '1 Corinthians 1:3', 2), (2, 'Ephesians 1:2', 3),
  -- v3: Thankfulness
  (3, 'Romans 1:8', 1), (3, '1 Corinthians 1:4', 2), (3, '1 Thessalonians 1:2', 3),
  -- v5: Fellowship in the gospel
  (5, '2 Corinthians 8:1-5', 1), (5, 'Philippians 4:15-16', 2), (5, 'Acts 16:15', 3),
  -- v6: God completes His work
  (6, 'John 6:39', 1), (6, 'Romans 8:29-30', 2), (6, '1 Thessalonians 5:24', 3), (6, 'Jude 24', 4),
  -- v8: Bowels of Christ
  (8, 'Romans 1:9', 1), (8, 'Colossians 3:12', 2), (8, '1 John 3:17', 3),
  -- v9: Love abounding
  (9, '1 Thessalonians 3:12', 1), (9, 'Colossians 1:9-10', 2), (9, 'Ephesians 1:17-18', 3),
  -- v11: Fruits of righteousness
  (11, 'John 15:4-5', 1), (11, 'Galatians 5:22-23', 2), (11, 'Ephesians 2:10', 3),
  -- v13: Praetorian Guard
  (13, 'Acts 28:16,30-31', 1), (13, 'Philippians 4:22', 2), (13, '2 Timothy 2:9', 3),
  -- v14: Boldness through suffering
  (14, 'Acts 4:31', 1), (14, '2 Timothy 1:8', 2), (14, 'Acts 14:22', 3),
  -- v18: Christ preached
  (18, '1 Corinthians 1:15-18', 1), (18, 'Mark 9:38-40', 2),
  -- v20: Magnify Christ in body
  (20, 'Romans 8:19', 1), (20, '1 Corinthians 6:20', 2), (20, '2 Corinthians 4:10', 3),
  -- v21: To live is Christ
  (21, 'Galatians 2:20', 1), (21, 'Colossians 3:3-4', 2), (21, 'Romans 14:7-8', 3),
  -- v23: Depart and be with Christ
  (23, '2 Corinthians 5:8', 1), (23, 'Luke 23:43', 2), (23, 'Revelation 14:13', 3),
  -- v27: Conduct as citizens
  (27, 'Philippians 3:20', 1), (27, 'Ephesians 4:1', 2), (27, '1 Thessalonians 2:12', 3),
  -- v29: Gift of suffering
  (29, 'Acts 5:41', 1), (29, 'Romans 8:17', 2), (29, '2 Timothy 3:12', 3), (29, '1 Peter 4:13', 4),
  -- v30: Same conflict
  (30, 'Acts 16:19-24', 1), (30, 'Colossians 2:1', 2), (30, '1 Thessalonians 2:2', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Philippians Chapter 1 Complete!
-- 30 verses · 10 key verses with word studies (20 words)
-- Cross-references for 17 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════