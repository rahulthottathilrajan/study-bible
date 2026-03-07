-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 14 — The Weak and the Strong: Liberty and Love
-- 23 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 14,
  'Romans 14 addresses the practical problem of Christian liberty and conscience within the body of Christ. Some believers (the ''weak'' in faith) ate only vegetables and observed special days; others (the ''strong'') ate all things and regarded every day alike (vv.1-6). Paul commands mutual acceptance: ''Him that is weak in the faith receive ye, but not to doubtful disputations'' (v.1). The guiding principle is that ''none of us liveth to himself, and no man dieth to himself. For whether we live, we live unto the Lord; and whether we die, we die unto the Lord'' (vv.7-8). Christ is Lord of both the living and the dead (v.9), so we must not judge one another — ''for we shall all stand before the judgment seat of Christ'' (v.10). Every knee shall bow and every tongue shall confess to God (v.11). The second half of the chapter shifts to the responsibility of the strong: ''Destroy not him with thy meat, for whom Christ died'' (v.15). ''The kingdom of God is not meat and drink; but righteousness, and peace, and joy in the Holy Ghost'' (v.17). Paul urges believers to pursue peace and edification (v.19) rather than exercising liberty in ways that cause others to stumble. The chapter concludes with a key principle: ''whatsoever is not of faith is sin'' (v.23).',
  'Christian Liberty, Mutual Acceptance, and the Lordship of Christ',
  'κρίνω (krinō)',
  'To judge, condemn, pass judgment on — appears repeatedly throughout this chapter (vv.3, 4, 5, 10, 13, 22). Paul forbids two opposite errors: the weak judging the strong for their freedom, and the strong despising the weak for their scruples. Only Christ has the right to judge his servants. The chapter''s governing principle is: stop judging one another in matters of conscience.',
  '["Receive the Weak Without Judging (vv.1-4): Him that is weak in the faith receive ye but not to doubtful disputations. For one believeth that he may eat all things another who is weak eateth herbs. Let not him that eateth despise him that eateth not and let not him which eateth not judge him that eateth for God hath received him. Who art thou that judgest another man''s servant","The Lordship of Christ Over All (vv.5-9): One man esteemeth one day above another another esteemeth every day alike. Let every man be fully persuaded in his own mind. For none of us liveth to himself and no man dieth to himself. For whether we live we live unto the Lord and whether we die we die unto the Lord. For to this end Christ both died and rose and revived that he might be Lord both of the dead and living","The Judgment Seat of Christ (vv.10-13): But why dost thou judge thy brother or why dost thou set at nought thy brother for we shall all stand before the judgment seat of Christ. So then every one of us shall give account of himself to God. Let us not therefore judge one another any more but judge this rather that no man put a stumblingblock or an occasion to fall in his brother''s way","Do Not Destroy Your Brother (vv.14-23): I know and am persuaded by the Lord Jesus that there is nothing unclean of itself but to him that esteemeth any thing to be unclean to him it is unclean. For the kingdom of God is not meat and drink but righteousness and peace and joy in the Holy Ghost. Happy is he that condemneth not himself in that thing which he alloweth. Whatsoever is not of faith is sin"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Him that is weak in the faith receive ye, but not to doubtful disputations.',
   'τὸν δὲ ἀσθενοῦντα τῇ πίστει προσλαμβάνεσθε μὴ εἰς διακρίσεις διαλογισμῶν',
   'ton de asthenounta tē pistei proslambanesthe mē eis diakriseis dialogismōn',
   '''Weak in the faith'' (asthenounta tē pistei — weak in faith; not lacking saving faith but lacking confidence in the full scope of Christian liberty). ''Receive'' (proslambanesthe — welcome, accept into fellowship; the same word used of God accepting us). ''Doubtful disputations'' (diakriseis dialogismōn — passing judgment on opinions, quarrelling over disputable matters). Welcome the person; do not debate their scruples.',
   'This verse establishes the framework for the entire chapter. The ''weak'' are not weaker Christians morally but those whose faith has not yet grasped the full freedom of the gospel regarding matters of indifference (adiaphora) — food laws, sacred days, etc. The ''strong'' understand their liberty but must not use it to damage weaker believers. The command is mutual acceptance, not doctrinal compromise on essential truths.'),
  (2, 'For one believeth that he may eat all things: another, who is weak, eateth herbs.',
   'ὃς μὲν πιστεύει φαγεῖν πάντα ὁ δὲ ἀσθενῶν λάχανα ἐσθίει',
   'hos men pisteuei phagein panta ho de asthenōn lachana esthiei',
   '''Believeth that he may eat all things'' — the strong Christian understands that all foods are clean (cf. Mark 7:19, Acts 10). ''Eateth herbs'' (lachana esthiei — eats only vegetables). The weak person avoids meat entirely, probably to ensure no contact with idol-contaminated or non-kosher food. This was a practical issue in Rome''s diverse Christian community.',
   NULL),
  (3, 'Let not him that eateth despise him that eateth not; and let not him which eateth not judge him that eateth: for God hath received him.',
   'ὁ ἐσθίων τὸν μὴ ἐσθίοντα μὴ ἐξουθενείτω καὶ ὁ μὴ ἐσθίων τὸν ἐσθίοντα μὴ κρινέτω ὁ θεὸς γὰρ αὐτὸν προσελάβετο',
   'ho esthiōn ton mē esthionta mē exoutheneitō kai ho mē esthiōn ton esthionta mē krinetō ho theos gar auton proselabeto',
   '''Despise'' (exoutheneitō — treat with contempt, look down on; the strong tend to despise the weak for their scruples). ''Judge'' (krinetō — condemn; the weak tend to judge the strong for their freedom). ''God hath received him'' (proselabeto — God has welcomed him). If God has accepted this person, who are we to reject them?',
   NULL),
  (4, 'Who art thou that judgest another man''s servant? to his own master he standeth or falleth. Yea, he shall be holden up: for God is able to make him stand.',
   'σὺ τίς εἶ ὁ κρίνων ἀλλότριον οἰκέτην τῷ ἰδίῳ κυρίῳ στήκει ἢ πίπτει σταθήσεται δέ δυνατὸς γάρ ἐστιν ὁ θεὸς στῆσαι αὐτόν',
   'sy tis ei ho krinōn allotrion oiketēn tō idiō kyriō stēkei ē piptei stathēsetai de dynatos gar estin ho theos stēsai auton',
   '''Another man''s servant'' (allotrion oiketēn — someone else''s household slave). You have no jurisdiction over another master''s slave. ''To his own master'' (tō idiō kyriō — to his own Lord, i.e., Christ). ''God is able to make him stand'' — confidence in God''s sustaining power, not in the other person''s strength.',
   NULL),
  (5, 'One man esteemeth one day above another: another esteemeth every day alike. Let every man be fully persuaded in his own mind.',
   'ὃς μὲν κρίνει ἡμέραν παρ᾿ ἡμέραν ὃς δὲ κρίνει πᾶσαν ἡμέραν ἕκαστος ἐν τῷ ἰδίῳ νοῒ πληροφορείσθω',
   'hos men krinei hēmeran par hēmeran hos de krinei pasan hēmeran hekastos en tō idiō noi plērophoreisthō',
   '''Esteemeth'' (krinei — judges, regards). ''Fully persuaded'' (plērophoreisthō — be completely convinced; from plērophoreō, to fill fully). This concerns the observance of special days (likely Jewish sabbaths and festivals). The key principle: each person must act from settled personal conviction, not from social pressure or mere habit.',
   NULL),
  (6, 'He that regardeth the day, regardeth it unto the Lord; and he that regardeth not the day, to the Lord he doth not regard it. He that eateth, eateth to the Lord, for he giveth God thanks; and he that eateth not, to the Lord he eateth not, and giveth God thanks.',
   'ὁ φρονῶν τὴν ἡμέραν κυρίῳ φρονεῖ καὶ ὁ μὴ φρονῶν τὴν ἡμέραν κυρίῳ οὐ φρονεῖ ὁ ἐσθίων κυρίῳ ἐσθίει εὐχαριστεῖ γὰρ τῷ θεῷ καὶ ὁ μὴ ἐσθίων κυρίῳ οὐκ ἐσθίει καὶ εὐχαριστεῖ τῷ θεῷ',
   'ho phronōn tēn hēmeran kyriō phronei kai ho mē phronōn tēn hēmeran kyriō ou phronei ho esthiōn kyriō esthiei eucharistei gar tō theō kai ho mē esthiōn kyriō ouk esthiei kai eucharistei tō theō',
   '''Unto the Lord'' (kyriō — dative of advantage: for the Lord''s honour). Both the observer and the non-observer act ''unto the Lord.'' Both give thanks. The test is not the practice itself but the motivation: is it done for the Lord? Thanksgiving (eucharistei) sanctifies both eating and abstaining.',
   NULL),
  (7, 'For none of us liveth to himself, and no man dieth to himself.',
   'οὐδεὶς γὰρ ἡμῶν ἑαυτῷ ζῇ καὶ οὐδεὶς ἑαυτῷ ἀποθνήσκει',
   'oudeis gar hēmōn heautō zē kai oudeis heautō apothnēskei',
   '''None of us liveth to himself'' — the Christian is not autonomous. Every aspect of life and death belongs to the Lord. This is the deepest reason for not judging: both parties belong to Christ, not to each other. Self-sovereignty is an illusion; we are Christ''s property.',
   NULL),
  (8, 'For whether we live, we live unto the Lord; and whether we die, we die unto the Lord: whether we live therefore, or die, we are the Lord''s.',
   'ἐάν τε γὰρ ζῶμεν τῷ κυρίῳ ζῶμεν ἐάν τε ἀποθνήσκωμεν τῷ κυρίῳ ἀποθνήσκομεν ἐάν τε οὖν ζῶμεν ἐάν τε ἀποθνήσκωμεν τοῦ κυρίου ἐσμέν',
   'ean te gar zōmen tō kyriō zōmen ean te apothnēskōmen tō kyriō apothnēskōmen ean te oun zōmen ean te apothnēskōmen tou kyriou esmen',
   '''We are the Lord''s'' (tou kyriou esmen — we belong to the Lord). Life and death are both lived in relationship to Christ. This is one of the most comforting and challenging statements in the NT: nothing — not even death — can separate us from Christ''s lordship (cf. 8:38-39).',
   'This verse expresses the total lordship of Christ over every dimension of the believer''s existence. ''We are the Lord''s'' — genitive of possession: we belong to him absolutely. In life we serve him; in death we go to him. This makes mutual judging absurd: both parties are Christ''s possession, accountable to him alone in matters of conscience.'),
  (9, 'For to this end Christ both died, and rose, and revived, that he might be Lord both of the dead and living.',
   'εἰς τοῦτο γὰρ Χριστὸς καὶ ἀπέθανεν καὶ ἀνέστη καὶ ἔζησεν ἵνα καὶ νεκρῶν καὶ ζώντων κυριεύσῃ',
   'eis touto gar Christos kai apethanen kai anestē kai ezēsen hina kai nekrōn kai zōntōn kyrieusē',
   '''To this end'' (eis touto — for this very purpose). ''Died and rose and revived'' — the death and resurrection of Christ are the foundation of his universal lordship. ''Lord both of the dead and living'' (nekrōn kai zōntōn kyrieusē — that he might exercise lordship over dead and living). Christ''s lordship spans both realms.',
   NULL),
  (10, 'But why dost thou judge thy brother? or why dost thou set at nought thy brother? for we shall all stand before the judgment seat of Christ.',
   'σὺ δὲ τί κρίνεις τὸν ἀδελφόν σου ἢ καὶ σὺ τί ἐξουθενεῖς τὸν ἀδελφόν σου πάντες γὰρ παραστησόμεθα τῷ βήματι τοῦ Χριστοῦ',
   'sy de ti krineis ton adelphon sou ē kai sy ti exoutheneis ton adelphon sou pantes gar parastēsometha tō bēmati tou Christou',
   '''Judge'' (krineis — condemn; addressed to the weak). ''Set at nought'' (exoutheneis — despise, treat with contempt; addressed to the strong). ''Judgment seat'' (bēmati — raised platform where a judge sat; in Roman cities, the bēma was the magistrate''s tribunal). ''Of Christ'' — Christ is the only legitimate judge. We will answer to him, not to each other.',
   NULL),
  (11, 'For it is written, As I live, saith the Lord, every knee shall bow to me, and every tongue shall confess to God.',
   'γέγραπται γάρ ζῶ ἐγώ λέγει κύριος ὅτι ἐμοὶ κάμψει πᾶν γόνυ καὶ πᾶσα γλῶσσα ἐξομολογήσεται τῷ θεῷ',
   'gegraptai gar zō egō legei kyrios hoti emoi kampsei pan gony kai pasa glōssa exomologēsetai tō theō',
   'Quoting Isaiah 45:23 (LXX). ''Every knee shall bow'' — universal submission. ''Every tongue shall confess'' (exomologēsetai — acknowledge, praise). In Philippians 2:10-11, Paul applies this same text to Jesus, identifying Christ with the LORD of Isaiah 45. At the final judgment, all will acknowledge God''s lordship.',
   NULL),
  (12, 'So then every one of us shall give account of himself to God.',
   'ἄρα οὖν ἕκαστος ἡμῶν περὶ ἑαυτοῦ λόγον δώσει τῷ θεῷ',
   'ara oun hekastos hēmōn peri heautou logon dōsei tō theō',
   '''Give account'' (logon dōsei — render a word, give a reckoning). Each person will account for their own actions, not for others''. This undercuts all judgmentalism: worry about your own account, not your brother''s. Personal accountability to God is the great leveller.',
   NULL),
  (13, 'Let us not therefore judge one another any more: but judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way.',
   'μηκέτι οὖν ἀλλήλους κρίνωμεν ἀλλὰ τοῦτο κρίνατε μᾶλλον τὸ μὴ τιθέναι πρόσκομμα τῷ ἀδελφῷ ἢ σκάνδαλον',
   'mēketi oun allēlous krinōmen alla touto krinate mallon to mē tithenai proskomma tō adelphō ē skandalon',
   'A wordplay on krinō: ''judge'' (krinōmen — stop judging each other) and ''judge this rather'' (krinate — decide this instead). ''Stumblingblock'' (proskomma — something to trip over). ''Occasion to fall'' (skandalon — a trap-trigger, something that causes someone to fall into sin). The strong must use their judgment to avoid causing the weak to stumble.',
   NULL),
  (14, 'I know, and am persuaded by the Lord Jesus, that there is nothing unclean of itself: but to him that esteemeth any thing to be unclean, to him it is unclean.',
   'οἶδα καὶ πέπεισμαι ἐν κυρίῳ Ἰησοῦ ὅτι οὐδὲν κοινὸν δι᾿ ἑαυτοῦ εἰ μὴ τῷ λογιζομένῳ τι κοινὸν εἶναι ἐκείνῳ κοινόν',
   'oida kai pepeismai en kyriō Iēsou hoti ouden koinon di heautou ei mē tō logizomenō ti koinon einai ekeinō koinon',
   '''I know and am persuaded'' — Paul speaks with apostolic authority. ''Nothing unclean of itself'' (ouden koinon di heautou — nothing is ceremonially impure in itself; cf. Mark 7:18-19, Acts 10:15). ''To him that esteemeth'' (tō logizomenō — to the one who reckons, considers). Subjective conscience matters: if someone believes a thing is wrong, for them it is wrong. Objective truth (all foods are clean) does not override subjective conscience.',
   'Paul here sides with the ''strong'' theologically: no food is inherently unclean. Jesus declared all foods clean (Mark 7:19). But Paul immediately qualifies: subjective conscience creates a real moral boundary. To violate one''s conscience — even if the conscience is misinformed — is sin (v.23). This is a revolutionary principle: the strong must respect the weak person''s conscience, even when that conscience is objectively incorrect on a secondary matter.'),
  (15, 'But if thy brother be grieved with thy meat, now walkest thou not charitably. Destroy not him with thy meat, for whom Christ died.',
   'εἰ δὲ διὰ βρῶμα ὁ ἀδελφός σου λυπεῖται οὐκέτι κατὰ ἀγάπην περιπατεῖς μὴ τῷ βρώματί σου ἐκεῖνον ἀπόλλυε ὑπὲρ οὗ Χριστὸς ἀπέθανεν',
   'ei de dia brōma ho adelphos sou lypeitai ouketi kata agapēn peripateis mē tō brōmati sou ekeinon apollye hyper hou Christos apethanen',
   '''Grieved'' (lypeitai — distressed, pained). ''Not charitably'' (ouketi kata agapēn — no longer walking according to love). ''Destroy not'' (apollye — do not ruin, do not cause to perish). ''For whom Christ died'' (hyper hou Christos apethanen). The supreme argument: Christ valued this person enough to die for them. Will you damage them for the sake of food?',
   NULL),
  (16, 'Let not then your good be evil spoken of:',
   'μὴ βλασφημείσθω οὖν ὑμῶν τὸ ἀγαθόν',
   'mē blasphēmeisthō oun hymōn to agathon',
   '''Evil spoken of'' (blasphēmeisthō — blasphemed, defamed). ''Your good'' (hymōn to agathon — your legitimate freedom, your good thing). Christian liberty is genuinely good, but it must not be exercised in ways that bring it into disrepute.',
   NULL),
  (17, 'For the kingdom of God is not meat and drink; but righteousness, and peace, and joy in the Holy Ghost.',
   'οὐ γάρ ἐστιν ἡ βασιλεία τοῦ θεοῦ βρῶσις καὶ πόσις ἀλλὰ δικαιοσύνη καὶ εἰρήνη καὶ χαρὰ ἐν πνεύματι ἁγίῳ',
   'ou gar estin hē basileia tou theou brōsis kai posis alla dikaiosynē kai eirēnē kai chara en pneumati hagiō',
   '''Kingdom of God'' (basileia tou theou — God''s reign and realm). ''Not meat and drink'' — the kingdom''s essence is not about dietary regulations. ''Righteousness'' (dikaiosynē — right standing and right living). ''Peace'' (eirēnē — harmony with God and others). ''Joy'' (chara — Spirit-produced gladness). ''In the Holy Ghost'' — these are not human achievements but the Spirit''s fruit.',
   'This is one of Paul''s most concise definitions of the kingdom of God. The kingdom is not about external observances (food and drink) but about internal, Spirit-produced realities: righteousness (right relationship with God), peace (harmony in community), and joy (the Holy Spirit''s fruit). This verse rebukes both legalism (which reduces the kingdom to rules) and licence (which ignores the kingdom''s ethical demands). The three qualities are produced ''in the Holy Ghost'' — they are supernatural, not merely moral.'),
  (18, 'For he that in these things serveth Christ is acceptable to God, and approved of men.',
   'ὁ γὰρ ἐν τούτοις δουλεύων τῷ Χριστῷ εὐάρεστος τῷ θεῷ καὶ δόκιμος τοῖς ἀνθρώποις',
   'ho gar en toutois douleuōn tō Christō euarestos tō theō kai dokimos tois anthrōpois',
   '''Serveth Christ'' (douleuōn tō Christō — serving as a slave of Christ). ''Acceptable to God'' (euarestos — well-pleasing). ''Approved of men'' (dokimos — tested and approved). When Christians pursue righteousness, peace, and joy rather than disputing about food, they please God and earn respect from others.',
   NULL),
  (19, 'Let us therefore follow after the things which make for peace, and things wherewith one may edify another.',
   'ἄρα οὖν τὰ τῆς εἰρήνης διώκωμεν καὶ τὰ τῆς οἰκοδομῆς τῆς εἰς ἀλλήλους',
   'ara oun ta tēs eirēnēs diōkōmen kai ta tēs oikodomēs tēs eis allēlous',
   '''Follow after'' (diōkōmen — pursue eagerly; the same verb used of pursuing hospitality in 12:13). ''Peace'' (eirēnēs). ''Edify'' (oikodomēs — building up; from oikos + domeō, to build a house). The Christian''s goal is community construction, not self-assertion.',
   NULL),
  (20, 'For meat destroy not the work of God. All things indeed are pure; but it is evil for that man who eateth with offence.',
   'μὴ ἕνεκεν βρώματος κατάλυε τὸ ἔργον τοῦ θεοῦ πάντα μὲν καθαρά ἀλλὰ κακὸν τῷ ἀνθρώπῳ τῷ διὰ προσκόμματος ἐσθίοντι',
   'mē heneken brōmatos katalye to ergon tou theou panta men kathara alla kakon tō anthrōpō tō dia proskommatos esthionti',
   '''Destroy not'' (katalye — tear down; the opposite of oikodomē, building up). ''Work of God'' (to ergon tou theou — the work God is doing in that person''s life). ''All things are pure'' (panta kathara — a principle already stated in v.14). ''With offence'' (dia proskommatos — through stumbling, with resulting harm). The freedom to eat is real, but exercising it at the cost of another''s faith is evil.',
   NULL),
  (21, 'It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak.',
   'καλὸν τὸ μὴ φαγεῖν κρέα μηδὲ πιεῖν οἶνον μηδὲ ἐν ᾧ ὁ ἀδελφός σου προσκόπτει ἢ σκανδαλίζεται ἢ ἀσθενεῖ',
   'kalon to mē phagein krea mēde piein oinon mēde en hō ho adelphos sou proskoptei ē skandalizetai ē asthenei',
   '''Good'' (kalon — noble, right, beautiful). Paul is willing to abstain from meat and wine entirely if it prevents a brother from stumbling. Three consequences: ''stumbleth'' (proskoptei — trips), ''offended'' (skandalizetai — is trapped into sin), ''made weak'' (asthenei — is weakened in faith). Love voluntarily limits liberty.',
   NULL),
  (22, 'Hast thou faith? have it to thyself before God. Happy is he that condemneth not himself in that thing which he alloweth.',
   'σὺ πίστιν ἔχεις κατὰ σεαυτὸν ἔχε ἐνώπιον τοῦ θεοῦ μακάριος ὁ μὴ κρίνων ἑαυτὸν ἐν ᾧ δοκιμάζει',
   'sy pistin echeis kata seauton eche enōpion tou theou makarios ho mē krinōn heauton en hō dokimazei',
   '''Have it to thyself before God'' — keep your convictions private; don''t flaunt your liberty. ''Happy'' (makarios — blessed). ''Condemneth not himself'' (mē krinōn heauton — does not pass judgment on himself). ''Alloweth'' (dokimazei — approves, tests). Blessed is the person who can exercise liberty with a clear conscience, without self-condemnation or harming others.',
   NULL),
  (23, 'And he that doubteth is damned if he eat, because he eateth not of faith: for whatsoever is not of faith is sin.',
   'ὁ δὲ διακρινόμενος ἐὰν φάγῃ κατακέκριται ὅτι οὐκ ἐκ πίστεως πᾶν δὲ ὃ οὐκ ἐκ πίστεως ἁμαρτία ἐστίν',
   'ho de diakrinomenos ean phagē katakekritai hoti ouk ek pisteōs pan de ho ouk ek pisteōs hamartia estin',
   '''Doubteth'' (diakrinomenos — wavers, is divided in mind). ''Damned'' (katakekritai — stands condemned; perfect tense: the condemnation is settled). ''Not of faith'' (ouk ek pisteōs — not proceeding from faith/conviction). ''Whatsoever is not of faith is sin'' — acting against one''s conscience is sin, regardless of whether the act is objectively permissible. Conscience, even when misinformed, must not be violated.',
   'This closing principle — ''whatsoever is not of faith is sin'' — is one of the most far-reaching ethical statements in the NT. It means that any action done without the conviction that it is right before God is sinful. This does not mean only believers can do ''good'' acts, but rather that for the Christian, acting against conscience is always wrong. The principle applies specifically to disputable matters (adiaphora), not to matters clearly commanded or prohibited in Scripture. It protects the sanctity of individual conscience while calling believers to grow in understanding.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 14;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 weak in faith
  ('ἀσθενέω', 'astheneō', 'G770', 'To be weak, lack strength — from a (not) + sthenos (strength). In Romans 14, weakness is not moral or spiritual inferiority but a lack of confidence regarding Christian liberty. The weak person''s conscience is overly scrupulous on secondary matters. Paul never condemns weakness — he commands the strong to accommodate it with patience and love.', 1),
  -- v.1 receive/welcome
  ('προσλαμβάνω', 'proslambanō', 'G4355', 'To receive, welcome, take to oneself — from pros (to) + lambanō (to take). The word implies warm, personal acceptance into fellowship. God himself ''received'' (proselabeto, v.3) both the weak and the strong. Christians must mirror God''s welcome: full acceptance without requiring conformity on disputable matters.', 2),
  -- v.5 fully persuaded
  ('πληροφορέω', 'plērophoreō', 'G4135', 'To be fully convinced, completely assured — from plērēs (full) + phoreō (to carry). Each person must carry a full conviction about their practice in disputable matters. Acting without settled conviction violates conscience (v.23). The goal is not uniformity of practice but sincerity of conviction.', 3),
  -- v.10 judgment seat
  ('βῆμα', 'bēma', 'G968', 'Judgment seat, tribunal, raised platform — the elevated platform from which a Roman magistrate dispensed justice. Paul''s readers would picture Gallio''s bēma in Corinth (Acts 18:12) or the Roman magistrate''s tribunal. Before Christ''s bēma, every believer will give account — not for salvation (settled at the cross) but for stewardship and conduct (cf. 2 Corinthians 5:10).', 4),
  -- v.14 unclean
  ('κοινός', 'koinos', 'G2839', 'Common, ritually unclean, defiled — the opposite of hagios (holy, set apart). In Jewish usage, koinos described food that was ceremonially impure. Paul declares that nothing is koinos ''of itself'' (di heautou) — the OT food laws are fulfilled in Christ. But subjective conviction creates a real moral boundary: what one considers unclean is unclean for that person.', 5),
  -- v.17 kingdom of God
  ('βασιλεία', 'basileia', 'G932', 'Kingdom, reign, sovereign rule — God''s dynamic reign over his people. In Romans 14:17, the kingdom is defined not by external regulations (meat and drink) but by internal, Spirit-produced realities: righteousness, peace, and joy. This definition cuts through both legalism and licence, pointing to what truly matters in God''s kingdom.', 6),
  -- v.19 edify / build up
  ('οἰκοδομή', 'oikodomē', 'G3619', 'Building up, edification, construction — from oikos (house) + domē (building). The church is a building under construction, and every member is both builder and part of the structure. Actions that strengthen others are ''building up''; actions that cause stumbling are ''tearing down'' (katalyō, v.20). Love builds; self-assertion demolishes.', 7),
  -- v.23 faith
  ('πίστις', 'pistis', 'G4102', 'Faith, conviction, trust — in this context, pistis means personal conviction that one''s action is right before God. ''Whatsoever is not of faith'' means whatever does not proceed from a settled inner conviction of its rightness. Acting against conscience — even when the act is objectively permissible — is sin because it violates the principle of faith-integrity.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 14
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1 WHEN 2 THEN 1
    WHEN 3 THEN 5
    WHEN 4 THEN 10
    WHEN 5 THEN 14
    WHEN 6 THEN 17
    WHEN 7 THEN 19
    WHEN 8 THEN 23
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 receive the weak
  (1, 'Romans 15:1-7', 1),
  (1, '1 Corinthians 8:9-13', 2),
  -- v.3 God received him
  (3, 'Romans 15:7', 3),
  -- v.4 another man''s servant
  (4, 'James 4:12', 4),
  (4, '1 Corinthians 4:3-5', 5),
  -- v.5 esteem days
  (5, 'Galatians 4:10-11', 6),
  (5, 'Colossians 2:16-17', 7),
  -- v.8 we are the Lord''s
  (8, 'Galatians 2:20', 8),
  (8, 'Philippians 1:20-21', 9),
  -- v.10 judgment seat
  (10, '2 Corinthians 5:10', 10),
  (10, 'Matthew 25:31-32', 11),
  -- v.11 every knee bow
  (11, 'Isaiah 45:23', 12),
  (11, 'Philippians 2:10-11', 13),
  -- v.13 stumblingblock
  (13, '1 Corinthians 8:9', 14),
  -- v.14 nothing unclean
  (14, 'Mark 7:18-19', 15),
  (14, 'Acts 10:15', 16),
  (14, '1 Timothy 4:4', 17),
  -- v.15 destroy not — Christ died
  (15, '1 Corinthians 8:11-12', 18),
  -- v.17 kingdom of God
  (17, '1 Corinthians 4:20', 19),
  (17, 'Galatians 5:22-23', 20),
  -- v.19 follow peace
  (19, 'Hebrews 12:14', 21),
  (19, 'Ephesians 4:29', 22),
  -- v.21 abstain for brother
  (21, '1 Corinthians 8:13', 23),
  -- v.23 not of faith is sin
  (23, 'Hebrews 11:6', 24),
  (23, 'Titus 1:15', 25)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 14
  AND v.verse_number = cr.verse_number;
