-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 3 — All Have Sinned, Justified by Faith
-- 31 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Romans 3 brings Paul''s case against humanity to its verdict and then unveils the stunning solution. Paul first addresses Jewish objections: ''What advantage then hath the Jew?'' Answer: ''Much every way: chiefly, because that unto them were committed the oracles of God'' (vv.1-2). Jewish unfaithfulness does not nullify God''s faithfulness: ''Let God be true, but every man a liar'' (v.4). Paul then delivers the universal indictment through a devastating chain of OT quotations (vv.10-18): ''There is none righteous, no, not one'' (v.10), ''all have sinned, and come short of the glory of God'' (v.23). The law cannot save; it can only produce ''the knowledge of sin'' (v.20). But ''now'' (nyni de — the great turning point) ''the righteousness of God without the law is manifested'' (v.21) — ''even the righteousness of God which is by faith of Jesus Christ unto all and upon all them that believe'' (v.22). Sinners are ''justified freely by his grace through the redemption that is in Christ Jesus'' (v.24). God set forth Christ as ''a propitiation through faith in his blood'' (v.25) — the mercy seat where divine justice and divine mercy meet. This demonstrates God''s own righteousness: he is both ''just, and the justifier of him which believeth in Jesus'' (v.26). Boasting is excluded (v.27), for ''a man is justified by faith without the deeds of the law'' (v.28). God is God of both Jews and Gentiles (v.29), and he will justify both by faith (v.30). Does faith overthrow the law? ''God forbid: yea, we establish the law'' (v.31).',
  'The Universal Indictment and Justification by Faith',
  'δικαιόω (dikaioō)',
  'To justify, to declare righteous, to acquit — the central verb of Romans. Dikaioō is a legal/forensic term: it means to pronounce a verdict of ''righteous,'' not to make someone internally righteous (that is sanctification). Sinners are justified ''freely by his grace'' (v.24), ''by faith'' (v.28), through the redemption in Christ Jesus (v.24). God himself is both the just judge and the justifier of sinners who believe.',
  '["Jewish Advantage and God''s Faithfulness (vv.1-8): What advantage then hath the Jew much every way chiefly because that unto them were committed the oracles of God for what if some did not believe shall their unbelief make the faith of God without effect God forbid yea let God be true but every man a liar","The Universal Indictment: None Righteous (vv.9-20): What then are we better than they no in no wise for we have before proved both Jews and Gentiles that they are all under sin as it is written There is none righteous no not one there is none that understandeth there is none that seeketh after God therefore by the deeds of the law there shall no flesh be justified in his sight for by the law is the knowledge of sin","The Righteousness of God Through Faith (vv.21-26): But now the righteousness of God without the law is manifested being witnessed by the law and the prophets even the righteousness of God which is by faith of Jesus Christ unto all and upon all them that believe for there is no difference for all have sinned and come short of the glory of God being justified freely by his grace through the redemption that is in Christ Jesus whom God hath set forth to be a propitiation through faith in his blood","Boasting Excluded: Justified by Faith Apart from Law (vv.27-31): Where is boasting then it is excluded by what law of works nay but by the law of faith therefore we conclude that a man is justified by faith without the deeds of the law do we then make void the law through faith God forbid yea we establish the law"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 31 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'What advantage then hath the Jew? or what profit is there of circumcision?',
   'Τί οὖν τὸ περισσὸν τοῦ Ἰουδαίου ἢ τίς ἡ ὠφέλεια τῆς περιτομῆς',
   'Ti oun to perisson tou Ioudaiou ē tis hē ōpheleia tēs peritomēs',
   'After chapter 2''s argument that outward Jewishness is insufficient, the natural question arises: does being Jewish matter at all? Paul will not abolish Jewish privilege but redefine its nature: the advantage is real (v.2) but does not provide exemption from judgment.',
   NULL),
  (2, 'Much every way: chiefly, because that unto them were committed the oracles of God.',
   'πολὺ κατὰ πάντα τρόπον πρῶτον μὲν γὰρ ὅτι ἐπιστεύθησαν τὰ λόγια τοῦ θεοῦ',
   'poly kata panta tropon prōton men gar hoti episteuthēsan ta logia tou theou',
   '''Much every way'' (poly kata panta tropon — much in every manner; the advantage is genuine and significant). ''Oracles of God'' (ta logia tou theou — the divine utterances, the sacred Scriptures). ''Committed'' (episteuthēsan — entrusted; the Jews were trustees of divine revelation). This is Israel''s supreme privilege: stewardship of God''s word. But stewardship implies responsibility, not automatic salvation.',
   NULL),
  (3, 'For what if some did not believe? shall their unbelief make the faith of God without effect?',
   'τί γὰρ εἰ ἠπίστησάν τινες μὴ ἡ ἀπιστία αὐτῶν τὴν πίστιν τοῦ θεοῦ καταργήσει',
   'ti gar ei ēpistēsan tines mē hē apistia autōn tēn pistin tou theou katargēsei',
   '''Some did not believe'' (ēpistēsan tines — some were unfaithful; a masterpiece of understatement — most of Israel had rejected the Messiah). ''Faith of God'' (tēn pistin tou theou — God''s faithfulness, his covenant reliability). ''Without effect'' (katargēsei — nullify, render inoperative). The question: does human unfaithfulness cancel God''s faithfulness?',
   NULL),
  (4, 'God forbid: yea, let God be true, but every man a liar; as it is written, That thou mightest be justified in thy sayings, and mightest overcome when thou art judged.',
   'μὴ γένοιτο γινέσθω δὲ ὁ θεὸς ἀληθής πᾶς δὲ ἄνθρωπος ψεύστης καθὼς γέγραπται ὅπως ἂν δικαιωθῇς ἐν τοῖς λόγοις σου καὶ νικήσῃς ἐν τῷ κρίνεσθαί σε',
   'mē genoito ginesthō de ho theos alēthēs pas de anthrōpos pseustēs kathōs gegraptai hopōs an dikaiōthēs en tois logois sou kai nikēsēs en tō krinesthai se',
   '''God forbid'' (mē genoito — may it never be; the strongest Greek negation). ''Let God be true, but every man a liar'' — if all humanity contradicts God, humanity is wrong and God is right. Paul quotes Psalm 51:4: God is vindicated in his words and victorious when judged. Human unfaithfulness does not diminish God''s faithfulness; it highlights it by contrast.',
   NULL),
  (5, 'But if our unrighteousness commend the righteousness of God, what shall we say? Is God unrighteous who taketh vengeance? (I speak as a man)',
   'εἰ δὲ ἡ ἀδικία ἡμῶν θεοῦ δικαιοσύνην συνίστησιν τί ἐροῦμεν μὴ ἄδικος ὁ θεὸς ὁ ἐπιφέρων τὴν ὀργήν κατὰ ἄνθρωπον λέγω',
   'ei de hē adikia hēmōn theou dikaiosynēn synistēsin ti eroumen mē adikos ho theos ho epipherōn tēn orgēn kata anthrōpon legō',
   '''Commend'' (synistēsin — demonstrate, establish, recommend; our sin makes God''s righteousness shine brighter). ''Is God unrighteous who taketh vengeance?'' — a sophistical objection: if our sin highlights God''s glory, how can he punish us for it? ''I speak as a man'' — Paul disclaims this reasoning as merely human logic.',
   NULL),
  (6, 'God forbid: for then how shall God judge the world?',
   'μὴ γένοιτο ἐπεὶ πῶς κρινεῖ ὁ θεὸς τὸν κόσμον',
   'mē genoito epei pōs krinei ho theos ton kosmon',
   'Second mē genoito. If God could not punish sin that happened to showcase his glory, he could never judge any sin at all — and the world would be morally anarchic. The objection is self-refuting: it would destroy the very justice it pretends to defend.',
   NULL),
  (7, 'For if the truth of God hath more abounded through my lie unto his glory; why yet am I also judged as a sinner?',
   'εἰ γὰρ ἡ ἀλήθεια τοῦ θεοῦ ἐν τῷ ἐμῷ ψεύσματι ἐπερίσσευσεν εἰς τὴν δόξαν αὐτοῦ τί ἔτι κἀγὼ ὡς ἁμαρτωλὸς κρίνομαι',
   'ei gar hē alētheia tou theou en tō emō pseusmati eperisseusen eis tēn doxan autou ti eti kagō hōs hamartōlos krinomai',
   'The objection restated in first person: ''If my lie makes God''s truth shine, why am I still condemned?'' This is the logic of antinomianism — using grace as a license for sin. Paul will address this more fully in 6:1-2.',
   NULL),
  (8, 'And not rather, (as we be slanderously reported, and as some affirm that we say,) Let us do evil, that good may come? whose damnation is just.',
   'καὶ μὴ καθὼς βλασφημούμεθα καὶ καθώς φασίν τινες ἡμᾶς λέγειν ὅτι ποιήσωμεν τὰ κακὰ ἵνα ἔλθῃ τὰ ἀγαθά ὧν τὸ κρίμα ἔνδικόν ἐστιν',
   'kai mē kathōs blasphēmoumetha kai kathōs phasin tines hēmas legein hoti poiēsōmen ta kaka hina elthē ta agatha hōn to krima endikon estin',
   '''Let us do evil, that good may come'' — the reductio ad absurdum of the objection. Some were slanderously attributing this teaching to Paul. ''Whose damnation is just'' (hōn to krima endikon estin — their condemnation is deserved). Paul dismisses this perversion of grace with a single devastating sentence: those who reason this way deserve their judgment.',
   NULL),
  (9, 'What then? are we better than they? No, in no wise: for we have before proved both Jews and Gentiles, that they are all under sin;',
   'τί οὖν προεχόμεθα οὐ πάντως προῃτιασάμεθα γὰρ Ἰουδαίους τε καὶ Ἕλληνας πάντας ὑφ᾿ ἁμαρτίαν εἶναι',
   'ti oun proechometha ou pantōs proētiasametha gar Ioudaious te kai Hellēnas pantas hyph hamartian einai',
   '''Are we better?'' (proechometha — do we have an advantage in terms of moral standing?). ''No, in no wise'' (ou pantōs — not at all). ''Under sin'' (hyph hamartian — under the dominion of sin; sin is a ruling power, not merely individual acts). This is the verdict: Jew and Gentile alike are under sin''s tyranny. The universal indictment is now complete.',
   NULL),
  (10, 'As it is written, There is none righteous, no, not one:',
   'καθὼς γέγραπται ὅτι οὐκ ἔστιν δίκαιος οὐδὲ εἷς',
   'kathōs gegraptai hoti ouk estin dikaios oude heis',
   'Paul now marshals a chain of OT quotations (vv.10-18) to prove the universality of sin. This verse quotes Psalm 14:1 / Psalm 53:1. ''None righteous'' (ouk estin dikaios — not even one person qualifies as righteous before God). The threefold ''none'' in vv.10-12 is emphatic and comprehensive.',
   NULL),
  (11, 'There is none that understandeth, there is none that seeketh after God.',
   'οὐκ ἔστιν ὁ συνιών οὐκ ἔστιν ὁ ἐκζητῶν τὸν θεόν',
   'ouk estin ho syniōn ouk estin ho ekzētōn ton theon',
   '''None that understandeth'' (ouk estin ho syniōn — no one who comprehends spiritual reality). ''None that seeketh after God'' (ouk estin ho ekzētōn ton theon — no one who earnestly seeks God). The double denial demolishes two common assumptions: (1) that humans can figure out God on their own, and (2) that humans naturally seek God. Both abilities are lost in the fall.',
   NULL),
  (12, 'They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one.',
   'πάντες ἐξέκλιναν ἅμα ἠχρειώθησαν οὐκ ἔστιν ποιῶν χρηστότητα οὐκ ἔστιν ἕως ἑνός',
   'pantes exeklinan hama ēchreiōthēsan ouk estin poiōn chrēstotēta ouk estin heōs henos',
   '''Gone out of the way'' (exeklinan — turned aside, deviated from the path). ''Together become unprofitable'' (hama ēchreiōthēsan — all together have become useless, worthless). ''None that doeth good'' — the universal verdict: humanity en masse has departed from God and become morally bankrupt.',
   NULL),
  (13, 'Their throat is an open sepulchre; with their tongues they have used deceit; the poison of asps is under their lips:',
   'τάφος ἀνεῳγμένος ὁ λάρυγξ αὐτῶν ταῖς γλώσσαις αὐτῶν ἐδολιοῦσαν ἰὸς ἀσπίδων ὑπὸ τὰ χείλη αὐτῶν',
   'taphos aneōgmenos ho larynx autōn tais glōssais autōn edoliousan ios aspidōn hypo ta cheilē autōn',
   'From Psalm 5:9 and Psalm 140:3. The anatomy of sin now moves to the organs of speech: throat (taphos — a grave; their speech emanates from death), tongues (edoliousan — they kept deceiving), lips (ios aspidōn — the venom of vipers). Three organs, three sins: corruption, deceit, and deadly poison.',
   NULL),
  (14, 'Whose mouth is full of cursing and bitterness:',
   'ὧν τὸ στόμα ἀρᾶς καὶ πικρίας γέμει',
   'hōn to stoma aras kai pikrias gemei',
   'From Psalm 10:7. ''Cursing'' (aras — imprecation, calling down evil on others). ''Bitterness'' (pikrias — harsh, cutting speech). The mouth, designed for praise and blessing, has become an instrument of cursing.',
   NULL),
  (15, 'Their feet are swift to shed blood:',
   'ὀξεῖς οἱ πόδες αὐτῶν ἐκχέαι αἷμα',
   'oxeis hoi podes autōn ekcheai haima',
   'From Isaiah 59:7. ''Swift'' (oxeis — quick, eager). ''To shed blood'' — the anatomy of sin moves from speech (vv.13-14) to action (vv.15-17). Humanity is eager for violence.',
   NULL),
  (16, 'Destruction and misery are in their ways:',
   'σύντριμμα καὶ ταλαιπωρία ἐν ταῖς ὁδοῖς αὐτῶν',
   'syntrimma kai talaipōria en tais hodois autōn',
   '''Destruction'' (syntrimma — ruin, crushing). ''Misery'' (talaipōria — wretchedness, hardship). ''In their ways'' — wherever sinful humanity goes, a trail of ruin and wretchedness follows.',
   NULL),
  (17, 'And the way of peace have they not known:',
   'καὶ ὁδὸν εἰρήνης οὐκ ἔγνωσαν',
   'kai hodon eirēnēs ouk egnōsan',
   '''The way of peace'' (hodon eirēnēs — the path that leads to wholeness and well-being). ''Have they not known'' — they are strangers to peace, both with God and with one another. The contrast with the gospel is implicit: the gospel brings the peace that humanity cannot find on its own (5:1).',
   NULL),
  (18, 'There is no fear of God before their eyes.',
   'οὐκ ἔστιν φόβος θεοῦ ἀπέναντι τῶν ὀφθαλμῶν αὐτῶν',
   'ouk estin phobos theou apenanti tōn ophthalmōn autōn',
   'From Psalm 36:1. ''Fear of God'' (phobos theou — reverential awe before God). This is the root cause summarizing all the symptoms above: the absence of the fear of God. Where there is no fear of God, there is no restraint on sin. The chain of OT quotations (vv.10-18) begins with ''none righteous'' and ends with ''no fear of God'' — the summary diagnosis of the human condition.',
   NULL),
  (19, 'Now we know that what things soever the law saith, it saith to them who are under the law: that every mouth may be stopped, and all the world may become guilty before God.',
   'οἴδαμεν δὲ ὅτι ὅσα ὁ νόμος λέγει τοῖς ἐν τῷ νόμῳ λαλεῖ ἵνα πᾶν στόμα φραγῇ καὶ ὑπόδικος γένηται πᾶς ὁ κόσμος τῷ θεῷ',
   'oidamen de hoti hosa ho nomos legei tois en tō nomō lalei hina pan stoma phragē kai hypodikos genētai pas ho kosmos tō theō',
   '''Under the law'' (tois en tō nomō — those within the law''s jurisdiction; primarily the Jews). ''Every mouth may be stopped'' (pan stoma phragē — every mouth silenced; the courtroom verdict is in, and there is nothing left to say in defense). ''Guilty before God'' (hypodikos tō theō — answerable to God, liable to judgment). The law silences the very people who boast in it. If even those with the law are condemned, the whole world stands guilty.',
   NULL),
  (20, 'Therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin.',
   'διότι ἐξ ἔργων νόμου οὐ δικαιωθήσεται πᾶσα σὰρξ ἐνώπιον αὐτοῦ διὰ γὰρ νόμου ἐπίγνωσις ἁμαρτίας',
   'dioti ex ergōn nomou ou dikaiōthēsetai pasa sarx enōpion autou dia gar nomou epignōsis hamartias',
   '''By the deeds of the law'' (ex ergōn nomou — on the basis of works of the law). ''No flesh'' (pasa sarx — all flesh; no human being). ''Justified'' (dikaiōthēsetai — will be declared righteous). ''Knowledge of sin'' (epignōsis hamartias — full knowledge, recognition of sin). Paul quotes Psalm 143:2. The law''s function is diagnostic, not therapeutic: it reveals sin but cannot cure it. This verse closes the door on law-based justification permanently.',
   'This is one of the most important verses in Romans. It establishes that the law was never intended to be a means of justification. Its purpose is diagnostic: ''by the law is the knowledge of sin'' (epignōsis hamartias). The law functions as a mirror that shows us our sin, not a ladder that lifts us to God. This clears the ground for the gospel solution in vv.21-26.'),
  (21, 'But now the righteousness of God without the law is manifested, being witnessed by the law and the prophets;',
   'νυνὶ δὲ χωρὶς νόμου δικαιοσύνη θεοῦ πεφανέρωται μαρτυρουμένη ὑπὸ τοῦ νόμου καὶ τῶν προφητῶν',
   'nyni de chōris nomou dikaiosynē theou pephanerōtai martyroumenē hypo tou nomou kai tōn prophētōn',
   '''But now'' (nyni de — the great turning point of Romans; the most significant ''but'' in all of Scripture). ''Without the law'' (chōris nomou — apart from the law, independent of law-keeping). ''Manifested'' (pephanerōtai — has been revealed, made visible; perfect tense: it has been revealed and stands revealed). ''Witnessed by the law and the prophets'' — this righteousness is apart from the law as a means but not apart from the OT as a witness. The gospel is not a contradiction of the OT but its fulfilment.',
   'The two words nyni de (''but now'') mark the most dramatic transition in the history of theology. Everything from 1:18 to 3:20 has been darkness — universal sin, universal condemnation, no escape. ''But now'' the light breaks in. God''s righteousness has been manifested apart from the law. This is not a new righteousness (it was ''witnessed by the law and the prophets'') but a newly revealed way of receiving it — by faith, not by works.'),
  (22, 'Even the righteousness of God which is by faith of Jesus Christ unto all and upon all them that believe: for there is no difference:',
   'δικαιοσύνη δὲ θεοῦ διὰ πίστεως Ἰησοῦ Χριστοῦ εἰς πάντας καὶ ἐπὶ πάντας τοὺς πιστεύοντας οὐ γάρ ἐστιν διαστολή',
   'dikaiosynē de theou dia pisteōs Iēsou Christou eis pantas kai epi pantas tous pisteuontas ou gar estin diastolē',
   '''By faith of Jesus Christ'' (dia pisteōs Iēsou Christou — through faith in Jesus Christ, or through the faithfulness of Jesus Christ; the genitive can be objective or subjective). ''Unto all and upon all'' (eis pantas kai epi pantas — to all and upon all; the righteousness is available to all and rests upon all who believe). ''No difference'' (ou estin diastolē — no distinction between Jew and Gentile). The universality of sin (v.23) is matched by the universality of grace.',
   NULL),
  (23, 'For all have sinned, and come short of the glory of God;',
   'πάντες γὰρ ἥμαρτον καὶ ὑστεροῦνται τῆς δόξης τοῦ θεοῦ',
   'pantes gar hēmarton kai hysterountai tēs doxēs tou theou',
   '''All have sinned'' (pantes hēmarton — aorist: all sinned; the entire human race). ''Come short'' (hysterountai — fall short, lack, are deficient; present tense: keep on falling short). ''The glory of God'' (tēs doxēs tou theou — the radiant majesty that is God''s standard). Humanity was created for God''s glory but universally falls short of it. This is perhaps the most quoted verse on the universality of sin.',
   NULL),
  (24, 'Being justified freely by his grace through the redemption that is in Christ Jesus:',
   'δικαιούμενοι δωρεὰν τῇ αὐτοῦ χάριτι διὰ τῆς ἀπολυτρώσεως τῆς ἐν Χριστῷ Ἰησοῦ',
   'dikaioumenoi dōrean tē autou chariti dia tēs apolytrōseōs tēs en Christō Iēsou',
   '''Justified'' (dikaioumenoi — being declared righteous; present participle). ''Freely'' (dōrean — as a gift, gratis, without cost to the recipient). ''By his grace'' (tē autou chariti — by his unmerited favour). ''Redemption'' (apolytrōseōs — release by payment of a ransom; from apo + lytron [ransom price]; a term from the slave market and the liberation of captives). ''In Christ Jesus'' — the redemption is located in and accomplished by Christ. Three key terms: justified (forensic), freely/grace (gratuitous), redemption (liberating).',
   'This verse packs the entire gospel into a single sentence. Three metaphors converge: (1) LEGAL — ''justified'' (declared righteous by the divine judge); (2) COMMERCIAL — ''freely by his grace'' (a gift, not a payment); (3) REDEMPTIVE — ''redemption'' (liberation from bondage through ransom payment). The cost to the sinner is nothing (dōrean); the cost to God is the blood of his Son. This is the heart of the Protestant doctrine of justification by grace alone through faith alone.'),
  (25, 'Whom God hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past, through the forbearance of God;',
   'ὃν προέθετο ὁ θεὸς ἱλαστήριον διὰ τῆς πίστεως ἐν τῷ αὐτοῦ αἵματι εἰς ἔνδειξιν τῆς δικαιοσύνης αὐτοῦ διὰ τὴν πάρεσιν τῶν προγεγονότων ἁμαρτημάτων',
   'hon proetheto ho theos hilastērion dia tēs pisteōs en tō autou haimati eis endeixin tēs dikaiosynēs autou dia tēn paresin tōn progegonotōn hamartēmatōn',
   '''Set forth'' (proetheto — publicly displayed, purposed beforehand; both meanings apply). ''Propitiation'' (hilastērion — the mercy seat, the place of atonement; in the LXX this word describes the gold lid of the ark of the covenant where the blood was sprinkled on the Day of Atonement, Lev 16:14-15). ''In his blood'' (en tō autou haimati — by means of his blood; the blood represents Christ''s sacrificial death). ''Remission of sins that are past'' (paresin tōn progegonotōn hamartēmatōn — the passing over of previously committed sins). ''Forbearance'' (anochēs — God''s restraint in not immediately punishing sins before the cross). God had been holding back his wrath; the cross explains why.',
   'This verse is arguably the most theologically dense in all of Scripture. The hilastērion (mercy seat / propitiation) combines two ideas: (1) the place where God''s wrath against sin is satisfied, and (2) the place where God meets his sinful people in mercy. The cross is the ultimate Day of Atonement: Christ''s blood on the heavenly mercy seat both satisfies divine justice and provides divine mercy. The ''sins that are past'' are those committed before the cross — God had ''passed over'' them in forbearance, and the cross retroactively demonstrates the justice of that forbearance.'),
  (26, 'To declare, I say, at this time his righteousness: that he might be just, and the justifier of him which believeth in Jesus.',
   'ἐν τῇ ἀνοχῇ τοῦ θεοῦ πρὸς ἔνδειξιν τῆς δικαιοσύνης αὐτοῦ ἐν τῷ νῦν καιρῷ εἰς τὸ εἶναι αὐτὸν δίκαιον καὶ δικαιοῦντα τὸν ἐκ πίστεως Ἰησοῦ',
   'en tē anochē tou theou pros endeixin tēs dikaiosynēs autou en tō nyn kairō eis to einai auton dikaion kai dikaiounta ton ek pisteōs Iēsou',
   '''At this time'' (en tō nyn kairō — in the present critical moment). ''Just and the justifier'' (dikaion kai dikaiounta — righteous himself and the one who declares righteous). This is the supreme achievement of the cross: God can be simultaneously just (his holy law is satisfied) and the justifier (he acquits guilty sinners) of those who have faith in Jesus. Without the cross, these two attributes would be in irreconcilable conflict.',
   'This verse resolves the deepest theological problem in the universe: how can a perfectly just God forgive guilty sinners without compromising his justice? The answer is the cross. At the cross, God''s justice is fully satisfied (he is dikaion — just) AND his mercy is fully expressed (he is dikaiounta — the justifier). He does not ignore sin or pretend it didn''t happen; he punishes it fully in the person of his Son. This allows him to remain perfectly just while declaring believing sinners righteous. Leon Morris called this ''the most important single verse in Romans.'''),
  (27, 'Where is boasting then? It is excluded. By what law? of works? Nay: but by the law of faith.',
   'ποῦ οὖν ἡ καύχησις ἐξεκλείσθη διὰ ποίου νόμου τῶν ἔργων οὐχί ἀλλὰ διὰ νόμου πίστεως',
   'pou oun hē kauchēsis exekleisthē dia poiou nomou tōn ergōn ouchi alla dia nomou pisteōs',
   '''Boasting'' (kauchēsis — ground of boasting, self-congratulation). ''Excluded'' (exekleisthē — shut out, locked out; aorist: decisively excluded). ''Law of faith'' (nomou pisteōs — the principle of faith; nomos here means ''principle'' rather than the Mosaic law). If salvation is by faith alone as a free gift, there is no room for human boasting. The ''law of faith'' excludes boasting by its very nature: receiving a gift leaves no room for self-congratulation.',
   NULL),
  (28, 'Therefore we conclude that a man is justified by faith without the deeds of the law.',
   'λογιζόμεθα οὖν πίστει δικαιοῦσθαι ἄνθρωπον χωρὶς ἔργων νόμου',
   'logizometha oun pistei dikaiousthai anthrōpon chōris ergōn nomou',
   '''We conclude'' (logizometha — we reckon, we reach the considered judgment). ''By faith'' (pistei — by means of faith; the dative of means). ''Without the deeds of the law'' (chōris ergōn nomou — apart from works of the law). This is the summary statement of justification by faith alone (sola fide). Luther famously added ''alone'' (allein) to his German translation — and while the word is not in the Greek text, the meaning certainly is, as ''without the deeds of the law'' makes clear.',
   NULL),
  (29, 'Is he the God of the Jews only? is he not also of the Gentiles? Yes, of the Gentiles also:',
   'ἢ Ἰουδαίων ὁ θεὸς μόνον οὐχὶ δὲ καὶ ἐθνῶν ναὶ καὶ ἐθνῶν',
   'ē Ioudaiōn ho theos monon ouchi de kai ethnōn nai kai ethnōn',
   '''Is he the God of the Jews only?'' — monotheism itself demands universal access. If there is only one God, he must be the God of all peoples. Jewish exclusivism contradicts the very monotheism it professes. ''Yes, of the Gentiles also'' — God''s character as the one true God guarantees that his saving righteousness is available to all.',
   NULL),
  (30, 'Seeing it is one God, which shall justify the circumcision by faith, and uncircumcision through faith.',
   'εἴπερ εἷς ὁ θεός ὃς δικαιώσει περιτομὴν ἐκ πίστεως καὶ ἀκροβυστίαν διὰ τῆς πίστεως',
   'eiper heis ho theos hos dikaiōsei peritomēn ek pisteōs kai akrobystian dia tēs pisteōs',
   '''One God'' (heis ho theos — the Shema of Israel: Deuteronomy 6:4). ''Circumcision by faith … uncircumcision through faith'' (ek pisteōs … dia tēs pisteōs — the slight variation in preposition makes no substantive difference; the one God justifies both groups by the same means: faith). The oneness of God guarantees the oneness of the way of salvation.',
   NULL),
  (31, 'Do we then make void the law through faith? God forbid: yea, we establish the law.',
   'νόμον οὖν καταργοῦμεν διὰ τῆς πίστεως μὴ γένοιτο ἀλλὰ νόμον ἱστῶμεν',
   'nomon oun katargoumen dia tēs pisteōs mē genoito alla nomon histōmen',
   '''Make void'' (katargoumen — abolish, render inoperative). ''Establish'' (histōmen — make to stand, uphold, confirm). Far from overthrowing the law, justification by faith actually establishes it in two ways: (1) the cross satisfies the law''s penalty, thus honouring its demands; (2) faith produces the obedience the law always required (cf. 8:4). The gospel is not antinomian — it is the ultimate vindication of God''s holy law.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 3;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.20 knowledge of sin
  ('ἐπίγνωσις', 'epignōsis', 'G1922', 'Full knowledge, recognition, thorough acquaintance — from epi (upon, intensive) + gnōsis (knowledge). The law provides not merely awareness of sin but thorough, penetrating knowledge of it. The law acts as a moral X-ray, revealing the disease of sin in all its depth. This diagnostic function is the law''s primary purpose in salvation history.', 1),
  -- v.23 come short
  ('ὑστερέω', 'hystereō', 'G5302', 'To fall short, to lack, to be deficient — to fail to reach a goal or standard. Present tense (hysterountai): humanity keeps on falling short of God''s glory. The standard is not human morality but the glory of God — the radiant majesty of his perfect character. By this standard, all human righteousness is revealed as inadequate.', 2),
  -- v.24 redemption
  ('ἀπολύτρωσις', 'apolytrōsis', 'G629', 'Redemption, release by ransom — from apo (from) + lytron (ransom price). In the ancient world, this was the purchase price paid to free a slave or a prisoner of war. The metaphor is commercial: sinners are slaves to sin (6:17-20), and Christ''s blood is the ransom price that purchases their freedom. The cost falls entirely on God; the benefit falls entirely on the believer.', 3),
  -- v.25 propitiation / mercy seat
  ('ἱλαστήριον', 'hilastērion', 'G2435', 'Propitiation, mercy seat, place of atonement — in the LXX, hilastērion translates the Hebrew kapporeth, the gold lid of the Ark of the Covenant where blood was sprinkled on the Day of Atonement (Lev 16:14-15). Christ is the reality to which the OT mercy seat pointed: the place where God''s wrath against sin is satisfied and where God meets his sinful people in mercy. Christ''s blood on the cross is the ultimate Day of Atonement.', 4),
  -- v.25 forbearance
  ('πάρεσις', 'paresis', 'G3929', 'Passing over, temporary suspension — not full forgiveness (aphesis) but a holding back, a letting pass without full punishment. Before the cross, God passed over sins in his forbearance — not ignoring them but deferring their full penalty until Christ would bear it. The cross retroactively demonstrates the justice of God''s patience throughout OT history.', 5),
  -- v.28 justified by faith
  ('δικαιόω', 'dikaioō', 'G1344', 'To justify, to declare righteous, to pronounce a verdict of acquittal — a forensic/legal term. Dikaioō does not mean to make righteous (that is sanctification) but to declare righteous, to grant the legal status of righteousness. The judge pronounces the verdict; the defendant receives the status. This declaration is based on Christ''s work, not the sinner''s merit, and is received by faith alone.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 3
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 20
    WHEN 2 THEN 23
    WHEN 3 THEN 24
    WHEN 4 THEN 25 WHEN 5 THEN 25
    WHEN 6 THEN 28
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 oracles of God
  (2, 'Deuteronomy 4:7-8', 1),
  (2, 'Psalm 147:19-20', 2),
  -- v.4 let God be true
  (4, 'Psalm 51:4', 3),
  -- v.10 none righteous
  (10, 'Psalm 14:1-3', 4),
  (10, 'Psalm 53:1-3', 5),
  -- v.13 throat / tongues / lips
  (13, 'Psalm 5:9', 6),
  (13, 'Psalm 140:3', 7),
  -- v.14 cursing
  (14, 'Psalm 10:7', 8),
  -- v.15-17 feet swift to shed blood
  (15, 'Isaiah 59:7-8', 9),
  -- v.18 no fear of God
  (18, 'Psalm 36:1', 10),
  -- v.20 no flesh justified by law
  (20, 'Psalm 143:2', 11),
  (20, 'Galatians 2:16', 12),
  (20, 'Galatians 3:11', 13),
  -- v.21 righteousness apart from law
  (21, 'Romans 1:17', 14),
  (21, 'Philippians 3:9', 15),
  -- v.23 all have sinned
  (23, '1 Kings 8:46', 16),
  (23, 'Ecclesiastes 7:20', 17),
  (23, '1 John 1:8', 18),
  -- v.24 justified freely by grace
  (24, 'Ephesians 2:8-9', 19),
  (24, 'Titus 3:7', 20),
  -- v.25 propitiation
  (25, 'Leviticus 16:14-15', 21),
  (25, '1 John 2:2', 22),
  (25, '1 John 4:10', 23),
  (25, 'Hebrews 9:5', 24),
  -- v.26 just and justifier
  (26, 'Isaiah 45:21', 25),
  -- v.28 justified by faith
  (28, 'Galatians 2:16', 26),
  (28, 'Ephesians 2:8-9', 27),
  -- v.31 establish the law
  (31, 'Matthew 5:17', 28),
  (31, 'Romans 8:4', 29)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 3
  AND v.verse_number = cr.verse_number;
