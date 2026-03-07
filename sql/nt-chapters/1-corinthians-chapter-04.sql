-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 4 — Stewards of God's Mysteries
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  '1 Corinthians 4 concludes Paul''s treatment of divisions (chs.1-4) with a powerful appeal combining irony, authority, and fatherly affection. Paul defines apostles as ''ministers of Christ, and stewards of the mysteries of God'' (v.1). A steward''s primary requirement is faithfulness (v.2). Paul is unconcerned with human evaluation — ''he that judgeth me is the Lord'' (v.4). He warns against premature judgment: ''judge nothing before the time, until the Lord come, who both will bring to light the hidden things of darkness'' (v.5). He has applied this teaching to himself and Apollos ''that ye might learn in us not to think of men above that which is written, that no one of you be puffed up'' (v.6). Then comes biting irony: ''Now ye are full, now ye are rich, ye have reigned as kings without us'' (v.8). In contrast, the apostles are ''made a spectacle unto the world'' (v.9), ''fools for Christ''s sake'' while the Corinthians are ''wise in Christ'' (v.10). Paul catalogues apostolic suffering: hunger, thirst, nakedness, buffeting, homelessness (vv.11-13). He softens with tenderness: ''I write not these things to shame you, but as my beloved sons I warn you'' (v.14). ''For though ye have ten thousand instructors in Christ, yet have ye not many fathers: for in Christ Jesus I have begotten you through the gospel'' (v.15). He urges them to imitate him (v.16), announces Timothy''s visit (v.17), and closes with a pointed question: ''What will ye? shall I come unto you with a rod, or in love, and in the spirit of meekness?'' (v.21).',
  'Apostolic Stewardship, Ironic Rebuke, and Fatherly Authority',
  'οἰκονόμος (oikonomos)',
  'Steward, household manager — from oikos (house) + nemō (to manage, distribute). A steward was a slave entrusted with managing the master''s estate. Paul sees himself not as a master but as a manager of God''s mysteries. The steward does not own the resources but must faithfully administer them. Faithfulness (pistos), not popularity, is the measure of stewardship.',
  '["Stewards of God''s Mysteries (vv.1-5): Let a man so account of us as of the ministers of Christ and stewards of the mysteries of God. Moreover it is required in stewards that a man be found faithful. But with me it is a very small thing that I should be judged of you or of man''s judgment. Therefore judge nothing before the time until the Lord come who both will bring to light the hidden things of darkness and will make manifest the counsels of the hearts","Not Puffed Up: Learning from Paul and Apollos (vv.6-8): And these things brethren I have in a figure transferred to myself and to Apollos for your sakes that ye might learn in us not to think of men above that which is written that no one of you be puffed up for one against another. Now ye are full now ye are rich ye have reigned as kings without us","Apostolic Suffering: Fools for Christ (vv.9-13): For I think that God hath set forth us the apostles last as it were appointed to death for we are made a spectacle unto the world and to angels and to men. We are fools for Christ''s sake. Even unto this present hour we both hunger and thirst and are naked and are buffeted. Being reviled we bless being persecuted we suffer it being defamed we intreat we are made as the filth of the world","Fatherly Appeal: Imitate Me (vv.14-21): I write not these things to shame you but as my beloved sons I warn you. For though ye have ten thousand instructors in Christ yet have ye not many fathers for in Christ Jesus I have begotten you through the gospel. Wherefore I beseech you be ye followers of me. What will ye shall I come unto you with a rod or in love and in the spirit of meekness"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Let a man so account of us, as of the ministers of Christ, and stewards of the mysteries of God.',
   'οὕτως ἡμᾶς λογιζέσθω ἄνθρωπος ὡς ὑπηρέτας Χριστοῦ καὶ οἰκονόμους μυστηρίων θεοῦ',
   'houtōs hēmas logizesthō anthrōpos hōs hypēretas Christou kai oikonomous mystēriōn theou',
   '''Account'' (logizesthō — reckon, regard). ''Ministers'' (hypēretas — under-rowers, subordinate servants; originally the bottom-tier rowers in a galley). ''Stewards'' (oikonomous — household managers; a slave entrusted with the master''s property). ''Mysteries of God'' (mystēriōn theou — the divine secrets now revealed in the gospel). Two images of humility: servants and stewards. Neither owns anything; both serve the master.',
   'Paul redefines how the Corinthians should view their leaders. Not as celebrities, philosophers, or party chiefs, but as hypēretai (under-rowers — the lowest servants) and oikonomoi (stewards — managers of someone else''s property). The mysteries they steward are God''s truths, not their own inventions. This demolishes the personality cult: you don''t choose a favourite under-rower.'),
  (2, 'Moreover it is required in stewards, that a man be found faithful.',
   'ὧδε λοιπὸν ζητεῖται ἐν τοῖς οἰκονόμοις ἵνα πιστός τις εὑρεθῇ',
   'hōde loipon zēteitai en tois oikonomois hina pistos tis heurethē',
   '''Required'' (zēteitai — sought, demanded). ''Faithful'' (pistos — trustworthy, reliable). The sole requirement for a steward is faithfulness, not brilliance, eloquence, or popularity. A steward must be found (heurethē — discovered to be, proven to be) faithful when the master returns to audit the accounts.',
   NULL),
  (3, 'But with me it is a very small thing that I should be judged of you, or of man''s judgment: yea, I judge not mine own self.',
   'ἐμοὶ δὲ εἰς ἐλάχιστόν ἐστιν ἵνα ὑφ᾿ ὑμῶν ἀνακριθῶ ἢ ὑπὸ ἀνθρωπίνης ἡμέρας ἀλλ᾿ οὐδὲ ἐμαυτὸν ἀνακρίνω',
   'emoi de eis elachiston estin hina hyph hymōn anakrithō ē hypo anthrōpinēs hēmeras all oude emauton anakrinō',
   '''Very small thing'' (eis elachiston — of the least importance). ''Judged'' (anakrithō — examined, evaluated; the same word from 2:14-15). ''Man''s judgment'' (anthrōpinēs hēmeras — literally ''human day,'' i.e., any human court or assessment). ''I judge not mine own self'' — Paul does not even trust his own self-evaluation. Only the Lord''s judgment matters.',
   NULL),
  (4, 'For I know nothing by myself; yet am I not hereby justified: but he that judgeth me is the Lord.',
   'οὐδὲν γὰρ ἐμαυτῷ σύνοιδα ἀλλ᾿ οὐκ ἐν τούτῳ δεδικαίωμαι ὁ δὲ ἀνακρίνων με κύριός ἐστιν',
   'ouden gar emautō synoida all ouk en toutō dedikaiōmai ho de anakrinōn me kyrios estin',
   '''Know nothing by myself'' (ouden emautō synoida — my conscience is clear; I am not aware of any failing). ''Not hereby justified'' (ouk dedikaiōmai — a clear conscience does not equal innocence). ''He that judgeth me is the Lord'' — the only evaluator who matters. Self-evaluation can be mistaken; human evaluation is biased; only the Lord''s assessment is trustworthy.',
   NULL),
  (5, 'Therefore judge nothing before the time, until the Lord come, who both will bring to light the hidden things of darkness, and will make manifest the counsels of the hearts: and then shall every man have praise of God.',
   'ὥστε μὴ πρὸ καιροῦ τι κρίνετε ἕως ἂν ἔλθῃ ὁ κύριος ὃς καὶ φωτίσει τὰ κρυπτὰ τοῦ σκότους καὶ φανερώσει τὰς βουλὰς τῶν καρδιῶν καὶ τότε ὁ ἔπαινος γενήσεται ἑκάστῳ ἀπὸ τοῦ θεοῦ',
   'hōste mē pro kairou ti krinete heōs an elthē ho kyrios hos kai phōtisei ta krypta tou skotous kai phanerōsei tas boulas tōn kardiōn kai tote ho epainos genēsetai hekastō apo tou theou',
   '''Before the time'' (pro kairou — prematurely, before the appointed season). ''Bring to light'' (phōtisei — illuminate). ''Hidden things of darkness'' (ta krypta tou skotous — concealed motives, secret agendas). ''Counsels of the hearts'' (boulas tōn kardiōn — the inner purposes that drive outward actions). ''Praise of God'' (epainos apo tou theou — commendation from God). At Christ''s return, all hidden motivations will be exposed, and God will give appropriate praise to each faithful servant.',
   NULL),
  (6, 'And these things, brethren, I have in a figure transferred to myself and to Apollos for your sakes; that ye might learn in us not to think of men above that which is written, that no one of you be puffed up for one against another.',
   'ταῦτα δέ ἀδελφοί μετεσχημάτισα εἰς ἐμαυτὸν καὶ Ἀπολλῶν δι᾿ ὑμᾶς ἵνα ἐν ἡμῖν μάθητε τὸ μὴ ὑπὲρ ἃ γέγραπται φρονεῖν ἵνα μὴ εἷς ὑπὲρ τοῦ ἑνὸς φυσιοῦσθε κατὰ τοῦ ἑτέρου',
   'tauta de adelphoi meteschēmatisa eis emauton kai Apollōn di hymas hina en hēmin mathēte to mē hyper ha gegraptai phronein hina mē heis hyper tou henos physiousthe kata tou heterou',
   '''In a figure transferred'' (meteschēmatisa — applied in a disguised form; Paul used himself and Apollos as illustrations to avoid naming the actual offenders). ''Not above that which is written'' — Scripture is the boundary: do not go beyond what is written. ''Puffed up'' (physiousthe — inflated, bloated with pride). The root problem is pride: being puffed up in loyalty to one leader against another.',
   'The phrase ''not to think above what is written'' (to mē hyper ha gegraptai) is a crucial hermeneutical principle. Scripture sets the boundary for proper thinking about leaders and about everything else. Going ''above what is written'' leads to inflated opinions, personality cults, and division. Paul has deliberately used himself and Apollos as examples to make the lesson less personal and more universal.'),
  (7, 'For who maketh thee to differ from another? and what hast thou that thou didst not receive? now if thou didst receive it, why dost thou glory, as if thou hadst not received it?',
   'τίς γάρ σε διακρίνει τί δὲ ἔχεις ὃ οὐκ ἔλαβες εἰ δὲ καὶ ἔλαβες τί καυχᾶσαι ὡς μὴ λαβών',
   'tis gar se diakrinei ti de echeis ho ouk elabes ei de kai elabes ti kauchsai hōs mē labōn',
   'Three devastating questions: (1) ''Who makes you differ?'' — no one distinguishes themselves; God does. (2) ''What do you have that you did not receive?'' — every gift is received, not earned. (3) ''Why do you boast as if you had not received it?'' — boasting in what was given is absurd. This verse destroys all grounds for spiritual pride: everything is grace.',
   'This is one of the most powerful anti-pride texts in Scripture. Three rhetorical questions expose the absurdity of boasting. Every spiritual gift, every talent, every blessing is received from God — not achieved by human effort. Boasting in received gifts is like boasting in a birthday present. This verse is the practical application of 1:29 (''no flesh should glory'') and undergirds the entire theology of grace: everything good comes from God.'),
  (8, 'Now ye are full, now ye are rich, ye have reigned as kings without us: and I would to God ye did reign, that we also might reign with you.',
   'ἤδη κεκορεσμένοι ἐστέ ἤδη ἐπλουτήσατε χωρὶς ἡμῶν ἐβασιλεύσατε καὶ ὄφελόν γε ἐβασιλεύσατε ἵνα καὶ ἡμεῖς ὑμῖν συμβασιλεύσωμεν',
   'ēdē kekoremenoi este ēdē eploutēsate chōris hēmōn ebasileusate kai ophelon ge ebasileusate hina kai hēmeis hymin symbasileusōmen',
   '''Full'' (kekoremenoi — satiated, gorged). ''Rich'' (eploutēsate — became wealthy). ''Reigned as kings'' (ebasileusate — begun to reign). Biting irony: the Corinthians act as if the kingdom has already arrived in full. ''Without us'' — the apostles, who founded the church, are excluded from their self-proclaimed reign. ''I would to God'' — a wish: if only it were true, then Paul could share in their glory.',
   NULL),
  (9, 'For I think that God hath set forth us the apostles last, as it were appointed to death: for we are made a spectacle unto the world, and to angels, and to men.',
   'δοκῶ γὰρ ὅτι ὁ θεὸς ἡμᾶς τοὺς ἀποστόλους ἐσχάτους ἀπέδειξεν ὡς ἐπιθανατίους ὅτι θέατρον ἐγενήθημεν τῷ κόσμῳ καὶ ἀγγέλοις καὶ ἀνθρώποις',
   'dokō gar hoti ho theos hēmas tous apostolous eschatous apedeixen hōs epithanatious hoti theatron egenēthēmen tō kosmō kai angelois kai anthrōpois',
   '''Set forth last'' (eschatous apedeixen — displayed last; like the final act in the arena: the condemned criminals). ''Appointed to death'' (epithanatious — condemned to die; those sentenced to die in the arena). ''Spectacle'' (theatron — a theatre, an exhibition; English ''theatre'' derives from this). ''To the world, angels, and men'' — a triple audience watches the apostles'' suffering. The arena imagery is vivid and devastating.',
   NULL),
  (10, 'We are fools for Christ''s sake, but ye are wise in Christ; we are weak, but ye are strong; ye are honourable, but we are despised.',
   'ἡμεῖς μωροὶ διὰ Χριστόν ὑμεῖς δὲ φρόνιμοι ἐν Χριστῷ ἡμεῖς ἀσθενεῖς ὑμεῖς δὲ ἰσχυροί ὑμεῖς ἔνδοξοι ἡμεῖς δὲ ἄτιμοι',
   'hēmeis mōroi dia Christon hymeis de phronimoi en Christō hēmeis astheneis hymeis de ischyroi hymeis endoxoi hēmeis de atimoi',
   'Three ironic contrasts: fools/wise, weak/strong, despised/honourable. The Corinthians see themselves as the wise, strong, and honoured ones — exactly what 1:26-28 says they are not. The apostles, by contrast, bear the marks of genuine Christianity: foolishness, weakness, and dishonour in the world''s eyes.',
   NULL),
  (11, 'Even unto this present hour we both hunger, and thirst, and are naked, and are buffeted, and have no certain dwellingplace;',
   'ἄχρι τῆς ἄρτι ὥρας καὶ πεινῶμεν καὶ διψῶμεν καὶ γυμνιτεύομεν καὶ κολαφιζόμεθα καὶ ἀστατοῦμεν',
   'achri tēs arti hōras kai peinōmen kai dipsōmen kai gymniteuomen kai kolaphizometha kai astatoumen',
   '''This present hour'' (tēs arti hōras — right now; not past suffering but present). ''Hunger … thirst … naked'' — basic needs unmet. ''Buffeted'' (kolaphizometha — struck with fists, beaten). ''No certain dwellingplace'' (astatoumen — homeless, vagabond). A catalogue of real, present suffering that contrasts sharply with the Corinthians'' self-satisfaction.',
   NULL),
  (12, 'And labour, working with our own hands: being reviled, we bless; being persecuted, we suffer it:',
   'καὶ κοπιῶμεν ἐργαζόμενοι ταῖς ἰδίαις χερσίν λοιδορούμενοι εὐλογοῦμεν διωκόμενοι ἀνεχόμεθα',
   'kai kopiōmen ergazomenoi tais idiais chersin loidoroumenoi eulogoumen diōkomenoi anechometha',
   '''Labour with our own hands'' — Paul supported himself through tentmaking (Acts 18:3), which was socially demeaning for a teacher. Three responses to mistreatment: ''reviled, we bless'' (eulogoumen — we speak well of them). ''Persecuted, we suffer it'' (anechometha — we endure). This echoes Romans 12:14 and Jesus'' teaching in Matthew 5:44.',
   NULL),
  (13, 'Being defamed, we intreat: we are made as the filth of the world, and are the offscouring of all things unto this day.',
   'βλασφημούμενοι παρακαλοῦμεν ὡς περικαθάρματα τοῦ κόσμου ἐγενήθημεν πάντων περίψημα ἕως ἄρτι',
   'blasphēmoumenoi parakaloumen hōs perikatharmata tou kosmou egenēthēmen pantōn peripsēma heōs arti',
   '''Defamed'' (blasphēmoumenoi — slandered). ''Intreat'' (parakaloumen — appeal gently, entreat). ''Filth'' (perikatharmata — refuse, scum; what is scraped off when cleaning). ''Offscouring'' (peripsēma — dregs, scraping; the lowest residue). In some ancient rituals, perikatharmata referred to human scapegoats cast out of a city to absorb its pollution. Paul uses the most degrading language possible for the apostles'' social standing.',
   NULL),
  (14, 'I write not these things to shame you, but as my beloved sons I warn you.',
   'οὐκ ἐντρέπων ὑμᾶς γράφω ταῦτα ἀλλ᾿ ὡς τέκνα μου ἀγαπητὰ νουθετῶ',
   'ouk entrepōn hymas graphō tauta all hōs tekna mou agapēta nouthetō',
   '''Not to shame'' (ouk entrepōn — not to make you ashamed). ''Beloved sons'' (tekna mou agapēta — my dear children). ''Warn'' (nouthetō — admonish, counsel, set right the thinking). The tone shifts from irony to tenderness. Paul is not a hostile critic but a loving father. The severity of vv.8-13 was motivated by parental love, not spite.',
   NULL),
  (15, 'For though ye have ten thousand instructors in Christ, yet have ye not many fathers: for in Christ Jesus I have begotten you through the gospel.',
   'ἐὰν γὰρ μυρίους παιδαγωγοὺς ἔχητε ἐν Χριστῷ ἀλλ᾿ οὐ πολλοὺς πατέρας ἐν γὰρ Χριστῷ Ἰησοῦ διὰ τοῦ εὐαγγελίου ἐγὼ ὑμᾶς ἐγέννησα',
   'ean gar myrious paidagōgous echēte en Christō all ou pollous pateras en gar Christō Iēsou dia tou euangeliou egō hymas egennēsa',
   '''Ten thousand'' (myrious — countless). ''Instructors'' (paidagōgous — tutors, child-conductors; the slave who escorted children to school and supervised their behaviour, not the teacher). ''Fathers'' — a father''s relationship is unique and irreplaceable. ''Begotten you through the gospel'' (egennēsa — I fathered you; Paul brought them to spiritual birth through gospel proclamation). A church may have many teachers but only one spiritual father.',
   'The distinction between paidagōgos and patēr is crucial. A paidagōgos was a slave assigned to supervise a child — useful but replaceable. A father is unique: he gave life. Paul claims the unique, unrepeatable role of spiritual father to the Corinthian church. He ''begot'' them through the gospel — he was the human instrument of their new birth. This gives him a unique authority that no subsequent teacher can claim. It also implies a unique tenderness: he corrects them not as a judge but as a father.'),
  (16, 'Wherefore I beseech you, be ye followers of me.',
   'παρακαλῶ οὖν ὑμᾶς μιμηταί μου γίνεσθε',
   'parakalō oun hymas mimētai mou ginesthe',
   '''Followers'' (mimētai — imitators; English ''mimic'' derives from this). Paul calls them to imitate him — not in apostolic authority but in lifestyle: suffering, servanthood, and cross-shaped living. This bold command is grounded in his fatherly relationship (v.15). A child naturally imitates their father.',
   NULL),
  (17, 'For this cause have I sent unto you Timotheus, who is my beloved son, and faithful in the Lord, who shall bring you into remembrance of my ways which be in Christ, as I teach every where in every church.',
   'διὰ τοῦτο ἔπεμψα ὑμῖν Τιμόθεον ὅς ἐστίν μου τέκνον ἀγαπητὸν καὶ πιστὸν ἐν κυρίῳ ὃς ὑμᾶς ἀναμνήσει τὰς ὁδούς μου τὰς ἐν Χριστῷ καθὼς πανταχοῦ ἐν πάσῃ ἐκκλησίᾳ διδάσκω',
   'dia touto epempsa hymin Timotheon hos estin mou teknon agapēton kai piston en kyriō hos hymas anamnēsei tas hodous mou tas en Christō kathōs pantachou en pasē ekklēsia didaskō',
   '''Sent'' (epempsa — dispatched as an emissary). ''Beloved son'' (teknon agapēton — a spiritual son like the Corinthians). ''Faithful'' (piston — the very quality required of stewards, v.2). ''My ways in Christ'' (tas hodous mou — my manner of life). ''As I teach everywhere'' — Paul''s teaching is consistent across all churches; Corinth is not a special case.',
   NULL),
  (18, 'Now some are puffed up, as though I would not come to you.',
   'ὡς μὴ ἐρχομένου δέ μου πρὸς ὑμᾶς ἐφυσιώθησάν τινες',
   'hōs mē erchomenou de mou pros hymas ephysiōthēsan tines',
   '''Puffed up'' (ephysiōthēsan — inflated; the fourth use of physioō in this letter: 4:6, 4:18, 4:19, and later 5:2, 8:1, 13:4). ''As though I would not come'' — some arrogant members assumed Paul would never confront them in person. They mistook his absence for weakness.',
   NULL),
  (19, 'But I will come to you shortly, if the Lord will, and will know, not the speech of them which are puffed up, but the power.',
   'ἐλεύσομαι δὲ ταχέως πρὸς ὑμᾶς ἐὰν ὁ κύριος θελήσῃ καὶ γνώσομαι οὐ τὸν λόγον τῶν πεφυσιωμένων ἀλλὰ τὴν δύναμιν',
   'eleusomai de tacheōs pros hymas ean ho kyrios thelēsē kai gnōsomai ou ton logon tōn pephysiōmenōn alla tēn dynamin',
   '''Shortly'' (tacheōs — quickly). ''If the Lord will'' (ean ho kyrios thelēsē — conditional on God''s will). ''Not the speech'' (ou ton logon — not their eloquent words). ''But the power'' (alla tēn dynamin — but the spiritual power behind the words). Paul will test rhetoric against reality. The kingdom is not about talk.',
   NULL),
  (20, 'For the kingdom of God is not in word, but in power.',
   'οὐ γὰρ ἐν λόγῳ ἡ βασιλεία τοῦ θεοῦ ἀλλ᾿ ἐν δυνάμει',
   'ou gar en logō hē basileia tou theou all en dynamei',
   '''Not in word'' (ouk en logō — not in mere speech). ''But in power'' (all en dynamei — but in transformative power). The kingdom of God is demonstrated by power, not proved by eloquence. This is the ultimate answer to the Corinthians'' love of sophia and logos: the kingdom is dynamis.',
   'This brief verse is a devastating summary of the entire argument of chapters 1-4. The Corinthians valued words: eloquent speech, philosophical wisdom, rhetorical skill. Paul consistently points to power: God''s power in the cross (1:18, 24), the Spirit''s power in preaching (2:4-5), and now the kingdom''s power over mere words. This does not devalue language but subordinates it to divine power as the authenticating mark of genuine Christianity.'),
  (21, 'What will ye? shall I come unto you with a rod, or in love, and in the spirit of meekness?',
   'τί θέλετε ἐν ῥάβδῳ ἔλθω πρὸς ὑμᾶς ἢ ἐν ἀγάπῃ πνεύματί τε πραΰτητος',
   'ti thelete en rhabdō elthō pros hymas ē en agapē pneumati te praÿtētos',
   '''Rod'' (rhabdō — a stick for discipline; a father''s right to correct his children). ''Love'' (agapē — the tender option). ''Spirit of meekness'' (pneumati praÿtētos — gentleness). The choice is theirs: repent and receive Paul gently, or continue in arrogance and receive him with discipline. A loving father offers both options.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 4;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 under-rower/servant
  ('ὑπηρέτης', 'hypēretēs', 'G5257', 'Under-rower, subordinate servant, attendant — from hypo (under) + eretēs (rower). Originally the lowest tier of rowers in a galley ship, pulling the oars under the direction of the captain. Paul uses this image for apostles: they are not captains but crew, not commanders but servants. The captain is Christ; the apostles row under his orders.', 1),
  -- v.1 steward
  ('οἰκονόμος', 'oikonomos', 'G3623', 'Steward, household manager — from oikos (house) + nemō (to manage, distribute). A slave entrusted with managing the master''s entire estate: finances, provisions, staff. The steward has authority but it is delegated; he manages what belongs to another. Paul sees apostles as stewards of God''s mysteries — they did not create the gospel, they administer it. Their only measure is faithfulness (v.2).', 2),
  -- v.2 faithful
  ('πιστός', 'pistos', 'G4103', 'Faithful, trustworthy, reliable — from peithō (to persuade, trust). The one essential quality of a steward. Not brilliance, not eloquence, not popularity — but faithfulness: reliable administration of what has been entrusted. This standard applies to all Christian workers: ''it is required in stewards that a man be found faithful.'' Faithfulness is proved over time and tested by the Master.', 3),
  -- v.6 puffed up
  ('φυσιόω', 'physioō', 'G5448', 'To puff up, inflate, blow up with pride — from physa (bellows). Used six times in 1 Corinthians (4:6, 18, 19; 5:2; 8:1; 13:4) and only once elsewhere in the NT (Colossians 2:18). It describes an empty inflation — like a balloon full of air but nothing solid. The Corinthians'' problem was not real substance but inflated ego. Knowledge puffs up; love builds up (8:1).', 4),
  -- v.7 received
  ('λαμβάνω', 'lambanō', 'G2983', 'To receive, take, obtain — Paul''s rhetorical question: ''What do you have that you did not receive?'' Everything — gifts, faith, salvation, knowledge — is received from God. If everything is received, boasting is absurd. This is the logic of grace: you cannot take credit for a gift. This verb demolishes all grounds for spiritual pride and establishes grace as the sole basis of Christian existence.', 5),
  -- v.9 spectacle
  ('θέατρον', 'theatron', 'G2302', 'Spectacle, theatre, exhibition — from theaomai (to watch, gaze at). The Roman amphitheatre where condemned criminals fought and died for public entertainment. Paul pictures the apostles as the final act — the condemned men displayed last (eschatous) in the arena. The audience includes the world, angels, and humanity. Apostolic ministry is not a career path to glory but a death sentence for public display.', 6),
  -- v.15 instructor/pedagogue
  ('παιδαγωγός', 'paidagōgos', 'G3807', 'Tutor, guardian, child-conductor — from pais (child) + agōgos (leader). Not a teacher but a slave responsible for escorting children to school and supervising their moral behaviour. The paidagōgos was necessary but not foundational. Paul contrasts this replaceable role with the unique role of father (patēr). A church may have ten thousand tutors but only one father — the one who brought them to birth in the gospel.', 7),
  -- v.20 power
  ('δύναμις', 'dynamis', 'G1411', 'Power, ability, might — inherent transformative capability. ''The kingdom of God is not in word but in power.'' Dynamis is the kingdom''s authenticating mark: not elegant speech but supernatural power to transform lives. This connects to 1:18 (the cross is God''s dynamis), 2:4-5 (Paul''s preaching was in demonstration of dynamis), and now 4:20 (the kingdom operates by dynamis). Power, not rhetoric, validates ministry.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 4
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1 WHEN 2 THEN 1
    WHEN 3 THEN 2
    WHEN 4 THEN 6
    WHEN 5 THEN 7
    WHEN 6 THEN 9
    WHEN 7 THEN 15
    WHEN 8 THEN 20
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 stewards of mysteries
  (1, '1 Peter 4:10', 1),
  (1, 'Colossians 1:25', 2),
  (1, 'Titus 1:7', 3),
  -- v.2 faithful steward
  (2, 'Luke 12:42', 4),
  (2, 'Matthew 25:21', 5),
  -- v.4 Lord judgeth me
  (4, '2 Corinthians 1:12', 6),
  -- v.5 judge nothing before time
  (5, 'Matthew 7:1', 7),
  (5, 'Romans 14:10-12', 8),
  (5, '2 Corinthians 5:10', 9),
  -- v.6 not above what is written
  (6, 'Romans 12:3', 10),
  -- v.7 what hast thou not received
  (7, 'James 1:17', 11),
  (7, 'John 3:27', 12),
  (7, 'Romans 12:3', 13),
  -- v.8 reigned as kings
  (8, 'Revelation 3:17', 14),
  -- v.9 spectacle appointed to death
  (9, '2 Corinthians 4:11', 15),
  (9, 'Hebrews 10:33', 16),
  -- v.10 fools for Christ
  (10, '2 Corinthians 11:23-27', 17),
  (10, '1 Corinthians 1:27', 18),
  -- v.12 reviled we bless
  (12, 'Romans 12:14', 19),
  (12, 'Matthew 5:44', 20),
  (12, '1 Peter 3:9', 21),
  -- v.13 filth of the world
  (13, 'Lamentations 3:45', 22),
  -- v.15 begotten through the gospel
  (15, 'Galatians 4:19', 23),
  (15, 'Philemon 1:10', 24),
  (15, '1 Thessalonians 2:11', 25),
  -- v.16 be followers of me
  (16, '1 Corinthians 11:1', 26),
  (16, 'Philippians 3:17', 27),
  -- v.17 Timothy sent
  (17, 'Philippians 2:19-22', 28),
  (17, 'Acts 19:22', 29),
  -- v.20 kingdom not in word
  (20, '1 Thessalonians 1:5', 30),
  (20, 'Romans 14:17', 31),
  -- v.21 rod or love
  (21, '2 Corinthians 10:2', 32),
  (21, '2 Corinthians 13:10', 33)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 4
  AND v.verse_number = cr.verse_number;
