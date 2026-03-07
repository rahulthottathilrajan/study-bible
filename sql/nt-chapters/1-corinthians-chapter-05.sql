-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 5 — Church Discipline and the Leaven of Sin
-- 13 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'First Corinthians 5 confronts a shocking case of sexual immorality in the Corinthian church: a man is living with his father''s wife, a sin so grievous that even pagans would condemn it (v.1). Yet the church is ''puffed up'' rather than grieved (v.2). Paul, though absent in body, has already pronounced judgment: this man must be ''delivered unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Jesus'' (vv.3-5). The purpose of excommunication is not vengeance but restoration. Paul then introduces the Passover metaphor: ''a little leaven leaveneth the whole lump'' (v.6). Tolerated sin corrupts the entire community. They must ''purge out the old leaven'' and become a ''new lump'' because ''Christ our passover is sacrificed for us'' (v.7) — one of the NT''s most direct identification of Christ with the Passover lamb. They are to ''keep the feast'' with the ''unleavened bread of sincerity and truth'' (v.8). Paul clarifies a previous letter: he does not mean avoiding contact with all sinners in the world (v.10) — that would require leaving the world entirely. Rather, the prohibition is against fellowship with any so-called ''brother'' who lives in open, unrepentant sin (v.11). The church judges those within; God judges those without. The chapter concludes with the command: ''put away from among yourselves that wicked person'' (v.13), echoing the Deuteronomic formula for community purification.',
  'Church Discipline — Purging the Leaven and the Passover Lamb',
  'ζύμη (zymē)',
  'Leaven — from zymoō (to ferment). In Paul''s metaphor, leaven represents the permeating power of tolerated sin within the community. Just as a tiny amount of yeast works through the entire batch of dough, one case of unaddressed immorality corrupts the whole church. The antidote is ''purging'' the leaven, corresponding to the Jewish Passover preparation when all leaven was removed from the house.',
  '["Confronting the Sin: A Case of Incest (vv.1-2): It is reported commonly that there is fornication among you and such fornication as is not so much as named among the Gentiles that one should have his father''s wife. And ye are puffed up and have not rather mourned that he that hath done this deed might be taken away from among you","The Apostolic Judgment: Deliver unto Satan (vv.3-5): For I verily as absent in body but present in spirit have judged already concerning him that hath so done this deed in the name of our Lord Jesus Christ to deliver such an one unto Satan for the destruction of the flesh that the spirit may be saved in the day of the Lord Jesus","The Passover Metaphor: Purge Out the Old Leaven (vv.6-8): Know ye not that a little leaven leaveneth the whole lump. Purge out therefore the old leaven that ye may be a new lump as ye are unleavened. For even Christ our passover is sacrificed for us. Therefore let us keep the feast not with old leaven neither with the leaven of malice and wickedness but with the unleavened bread of sincerity and truth","Clarification on Separation: Judge Those Within (vv.9-13): I wrote unto you in an epistle not to company with fornicators yet not altogether with the fornicators of this world. But now I have written unto you not to keep company if any man that is called a brother be a fornicator or covetous or an idolater or a railer or a drunkard or an extortioner with such an one no not to eat. For what have I to do to judge them also that are without. Do not ye judge them that are within. But them that are without God judgeth. Therefore put away from among yourselves that wicked person"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'It is reported commonly that there is fornication among you, and such fornication as is not so much as named among the Gentiles, that one should have his father''s wife.',
   'ὅλως ἀκούεται ἐν ὑμῖν πορνεία καὶ τοιαύτη πορνεία ἥτις οὐδὲ ἐν τοῖς ἔθνεσιν ὀνομάζεται ὥστε γυναῖκά τινα τοῦ πατρὸς ἔχειν',
   'holōs akouetai en hymin porneia kai toiautē porneia hētis oude en tois ethnesin onomazetai hōste gynaika tina tou patros echein',
   '''Reported commonly'' (holōs akouetai — it is actually heard, widely reported). ''Fornication'' (porneia — sexual immorality in its broadest sense). ''His father''s wife'' — not his biological mother but his stepmother (cf. Leviticus 18:8; Deuteronomy 22:30). Even Roman law prohibited such unions. The present infinitive ''have'' (echein) suggests an ongoing cohabitation, not a single act.',
   'The severity of this case lies not only in the sin itself but in the church''s complacent response. Paul is shocked that the Corinthians tolerate what even pagan society condemns. This reveals a distorted understanding of Christian freedom — the Corinthians may have believed that grace rendered moral boundaries irrelevant (cf. 6:12). Paul will demonstrate that authentic grace demands holiness, not license.'),
  (2, 'And ye are puffed up, and have not rather mourned, that he that hath done this deed might be taken away from among you.',
   'καὶ ὑμεῖς πεφυσιωμένοι ἐστέ καὶ οὐχὶ μᾶλλον ἐπενθήσατε ἵνα ἐξαρθῇ ἐκ μέσου ὑμῶν ὁ τὸ ἔργον τοῦτο ποιήσας',
   'kai hymeis pephysiōmenoi este kai ouchi mallon epenthēsate hina exarthē ek mesou hymōn ho to ergon touto poiēsas',
   '''Puffed up'' (pephysiōmenoi — inflated, swollen with pride; perfect tense: a settled state of arrogance). ''Mourned'' (epenthēsate — grieved, lamented as for a death). ''Taken away'' (exarthē — removed, lifted out). The church should have been grieving, not boasting. Their pride may stem from a misguided tolerance or from the offender''s social status in the community.',
   NULL),
  (3, 'For I verily, as absent in body, but present in spirit, have judged already, as though I were present, concerning him that hath so done this deed,',
   'ἐγὼ μὲν γάρ ὡς ἀπὼν τῷ σώματι παρὼν δὲ τῷ πνεύματι ἤδη κέκρικα ὡς παρὼν τὸν οὕτως τοῦτο κατεργασάμενον',
   'egō men gar hōs apōn tō sōmati parōn de tō pneumati ēdē kekrika hōs parōn ton houtōs touto katergasamenon',
   '''Absent in body, present in spirit'' — Paul exercises apostolic authority from a distance. ''Have judged already'' (ēdē kekrika — already reached a verdict; perfect tense: the decision stands). ''Done this deed'' (katergasamenon — worked out, accomplished; the same verb used of sin ''working'' death in Romans 7:8). Paul''s judgment is not hasty but deliberate and authoritative.',
   NULL),
  (4, 'In the name of our Lord Jesus Christ, when ye are gathered together, and my spirit, with the power of our Lord Jesus Christ,',
   'ἐν τῷ ὀνόματι τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ συναχθέντων ὑμῶν καὶ τοῦ ἐμοῦ πνεύματος σὺν τῇ δυνάμει τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'en tō onomati tou kyriou hēmōn Iēsou Christou synachthentōn hymōn kai tou emou pneumatos syn tē dynamei tou kyriou hēmōn Iēsou Christou',
   'This verse describes the setting for the disciplinary action: (1) ''In the name of our Lord Jesus Christ'' — by his authority; (2) ''when ye are gathered together'' — in a formal church assembly; (3) ''and my spirit'' — with Paul''s apostolic authority present; (4) ''with the power of our Lord Jesus Christ'' — empowered by Christ himself. Church discipline is a communal, Spirit-empowered act, not a private vendetta.',
   NULL),
  (5, 'To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Jesus.',
   'παραδοῦναι τὸν τοιοῦτον τῷ Σατανᾷ εἰς ὄλεθρον τῆς σαρκός ἵνα τὸ πνεῦμα σωθῇ ἐν τῇ ἡμέρᾳ τοῦ κυρίου Ἰησοῦ',
   'paradounai ton toiouton tō Satana eis olethron tēs sarkos hina to pneuma sōthē en tē hēmera tou kyriou Iēsou',
   '''Deliver unto Satan'' (paradounai tō Satana — hand over to Satan). ''Destruction of the flesh'' (olethron tēs sarkos — ruin/destruction of the fleshly nature). ''That the spirit may be saved'' — the ultimate purpose is redemptive. Excommunication places the offender outside the protective community of faith into Satan''s domain (the world), where physical and spiritual suffering may produce repentance. The goal is salvation, not damnation.',
   'This verse establishes the theology of church discipline. Three crucial principles: (1) The authority to excommunicate comes from Christ, not human power; (2) The purpose is restorative — ''that the spirit may be saved''; (3) There is a temporal-eternal distinction: the ''destruction of the flesh'' (temporal suffering) serves the ''saving of the spirit'' (eternal redemption). This same man appears to have been restored in 2 Corinthians 2:5-8, validating the redemptive purpose of discipline.'),
  (6, 'Your glorying is not good. Know ye not that a little leaven leaveneth the whole lump?',
   'οὐ καλὸν τὸ καύχημα ὑμῶν οὐκ οἴδατε ὅτι μικρὰ ζύμη ὅλον τὸ φύραμα ζυμοῖ',
   'ou kalon to kauchēma hymōn ouk oidate hoti mikra zymē holon to phyrama zymoi',
   '''Glorying'' (kauchēma — boast, ground of boasting). ''A little leaven'' (mikra zymē — a small amount of yeast). ''Leaveneth'' (zymoi — ferments, causes to rise). ''Whole lump'' (holon to phyrama — the entire batch of dough). A proverbial saying (cf. Galatians 5:9) illustrating how tolerated sin permeates the whole community. The Corinthians'' boasting about their tolerance or spiritual gifts is misplaced when they harbor unaddressed sin.',
   NULL),
  (7, 'Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Christ our passover is sacrificed for us:',
   'ἐκκαθάρατε οὖν τὴν παλαιὰν ζύμην ἵνα ἦτε νέον φύραμα καθώς ἐστε ἄζυμοι καὶ γὰρ τὸ πάσχα ἡμῶν ὑπὲρ ἡμῶν ἐτύθη Χριστός',
   'ekkatharate oun tēn palaian zymēn hina ēte neon phyrama kathōs este azymoi kai gar to pascha hēmōn hyper hēmōn etythē Christos',
   '''Purge out'' (ekkatharate — cleanse thoroughly; aorist imperative: do it now and completely). ''Old leaven'' (palaian zymēn — the old yeast, representing the former sinful way of life). ''New lump'' (neon phyrama — fresh dough). ''As ye are unleavened'' (kathōs este azymoi — as you already are unleavened in your positional standing). ''Christ our passover'' (to pascha hēmōn) — direct identification of Christ with the Passover lamb. ''Is sacrificed'' (etythē — was slaughtered; aorist passive: a completed, once-for-all sacrifice).',
   'This is one of the most theologically rich verses in 1 Corinthians. Paul draws on the entire Exodus Passover narrative: (1) Before Passover, all leaven must be removed from the house (Exodus 12:15); (2) The Passover lamb is slain (Exodus 12:6); (3) The people eat unleavened bread for seven days (Exodus 12:18). Christ is ''our Passover'' (to pascha hēmōn) — the ultimate Passover lamb whose sacrifice inaugurates the new exodus. Because the lamb has been slain, believers must now live as the ''unleavened'' people they already are positionally in Christ. The indicative (''ye are unleavened'') grounds the imperative (''purge out the leaven''). Sanctification flows from justification.'),
  (8, 'Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.',
   'ὥστε ἑορτάζωμεν μὴ ἐν ζύμῃ παλαιᾷ μηδὲ ἐν ζύμῃ κακίας καὶ πονηρίας ἀλλ᾿ ἐν ἀζύμοις εἰλικρινείας καὶ ἀληθείας',
   'hōste heortazōmen mē en zymē palaia mēde en zymē kakias kai ponērias all en azymois eilikrinias kai alētheias',
   '''Keep the feast'' (heortazōmen — let us celebrate the festival; present subjunctive: continuous celebration). ''Malice'' (kakias — evil disposition, ill will). ''Wickedness'' (ponērias — active evil, depravity). ''Sincerity'' (eilikrinias — purity, transparency; literally ''judged by sunlight'' — something that bears examination). ''Truth'' (alētheias — reality, genuineness). The Christian life is a perpetual Passover feast — lived in moral purity.',
   NULL),
  (9, 'I wrote unto you in an epistle not to company with fornicators:',
   'ἔγραψα ὑμῖν ἐν τῇ ἐπιστολῇ μὴ συναναμίγνυσθαι πόρνοις',
   'egrapsa hymin en tē epistolē mē synanamignysthai pornois',
   '''I wrote'' (egrapsa — aorist: a previous letter, now lost). ''In an epistle'' (en tē epistolē — in the letter, referring to a prior correspondence before our ''1 Corinthians''). ''Not to company with'' (mē synanamignysthai — not to mingle together with, not to associate closely). ''Fornicators'' (pornois — sexually immoral persons). This reveals that 1 Corinthians is not Paul''s first letter to this church; a previous letter has been misunderstood.',
   NULL),
  (10, 'Yet not altogether with the fornicators of this world, or with the covetous, or extortioners, or with idolaters; for then must ye needs go out of the world.',
   'οὐ πάντως τοῖς πόρνοις τοῦ κόσμου τούτου ἢ τοῖς πλεονέκταις ἢ ἅρπαξιν ἢ εἰδωλολάτραις ἐπεὶ ὀφείλετε ἄρα ἐκ τοῦ κόσμου ἐξελθεῖν',
   'ou pantōs tois pornois tou kosmou toutou ē tois pleonektais ē harpaxin ē eidōlolatrais epei opheilete ara ek tou kosmou exelthein',
   '''Not altogether'' (ou pantōs — not at all, not in every case). Paul clarifies a misunderstanding: he did not mean complete avoidance of all sinners in society. ''Covetous'' (pleonektais — greedy, grasping for more). ''Extortioners'' (harpaxin — swindlers, robbers). ''Idolaters'' (eidōlolatrais — idol worshippers). To avoid all sinners would require leaving the world entirely — an impossibility and not God''s intention. Christians are to be in the world but not of it.',
   NULL),
  (11, 'But now I have written unto you not to keep company, if any man that is called a brother be a fornicator, or covetous, or an idolater, or a railer, or a drunkard, or an extortioner; with such an one no not to eat.',
   'νυνὶ δὲ ἔγραψα ὑμῖν μὴ συναναμίγνυσθαι ἐάν τις ἀδελφὸς ὀνομαζόμενος ᾖ πόρνος ἢ πλεονέκτης ἢ εἰδωλολάτρης ἢ λοίδορος ἢ μέθυσος ἢ ἅρπαξ τῷ τοιούτῳ μηδὲ συνεσθίειν',
   'nyni de egrapsa hymin mē synanamignysthai ean tis adelphos onomazomenos ē pornos ē pleonektēs ē eidōlolatrēs ē loidoros ē methysos ē harpax tō toioutō mēde synesthiein',
   '''Called a brother'' (adelphos onomazomenos — one bearing the name of brother; one who professes faith). The list of six sins: ''fornicator'' (pornos), ''covetous'' (pleonektēs), ''idolater'' (eidōlolatrēs), ''railer'' (loidoros — verbal abuser, reviler), ''drunkard'' (methysos), ''extortioner'' (harpax — rapacious person). ''No not to eat'' (mēde synesthiein — not even to share a meal). The restriction applies to professing believers living in unrepentant sin, not to unbelievers.',
   'This verse establishes the standard for church discipline: it applies to those who claim Christian identity (''called a brother'') while persisting in unrepentant sin. Six categories of sin are listed, covering sexual, financial, religious, verbal, and substance-related offenses. ''Not to eat'' likely includes both ordinary meals (social fellowship) and the Lord''s Supper (sacramental fellowship). The point is that the community of faith must not normalize behavior that contradicts the gospel.'),
  (12, 'For what have I to do to judge them also that are without? do not ye judge them that are within?',
   'τί γάρ μοι καὶ τοὺς ἔξω κρίνειν οὐχὶ τοὺς ἔσω ὑμεῖς κρίνετε',
   'ti gar moi kai tous exō krinein ouchi tous esō hymeis krinete',
   '''Those without'' (tous exō — those outside the church). ''Those within'' (tous esō — those inside). ''Judge'' (krinein — evaluate, hold accountable). Paul draws a sharp boundary: the church''s jurisdiction extends only to its own members. Outsiders are under God''s judgment, not the church''s. But insiders — those who have voluntarily entered the covenant community — are accountable to its moral standards.',
   NULL),
  (13, 'But them that are without God judgeth. Therefore put away from among yourselves that wicked person.',
   'τοὺς δὲ ἔξω ὁ θεὸς κρινεῖ καὶ ἐξάρατε τὸν πονηρὸν ἐξ ὑμῶν αὐτῶν',
   'tous de exō ho theos krinei kai exarate ton ponēron ex hymōn autōn',
   '''God judgeth'' (ho theos krinei — God himself judges those outside). ''Put away'' (exarate — remove, expel; aorist imperative: decisive action required). ''That wicked person'' (ton ponēron — the evil one). Paul concludes with a direct echo of the Deuteronomic purge formula: ''put away the evil from among you'' (Deuteronomy 13:5; 17:7; 19:19; 21:21; 22:21, 24; 24:7). The church is the new covenant community, and like Israel, it must maintain its holiness by removing persistent evil from its midst.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 5;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 fornication
  ('πορνεία', 'porneia', 'G4202', 'Fornication, sexual immorality — from pornē (a prostitute). The broadest Greek term for sexual sin, covering all sexual activity outside the marriage covenant between husband and wife. In this case, the specific sin is incest — a man living with his stepmother (father''s wife). The term''s breadth is important: Paul uses it to cover any sexual transgression, not just prostitution.', 1),
  -- v.2 puffed up
  ('φυσιόω', 'physioō', 'G5448', 'To puff up, inflate, make arrogant — from physa (a bellows). A favourite Pauline word in 1 Corinthians (used 6 times in this letter, only once elsewhere in Paul). The Corinthians are inflated with self-importance rather than grieving over sin. Their arrogance may stem from a distorted view of spiritual gifts or an antinomian theology that trivialised moral behavior.', 2),
  -- v.5 deliver unto Satan
  ('παραδίδωμι', 'paradidōmi', 'G3860', 'To hand over, deliver up, entrust — from para (alongside) + didōmi (to give). Used of Judas betraying Jesus (Matthew 26:15) and of God delivering up his Son (Romans 8:32). Here it means formal excommunication: handing the offender from the church''s protective sphere into Satan''s domain. The purpose clause (hina sōthē — that he may be saved) shows this is redemptive, not vindictive.', 3),
  -- v.6 leaven
  ('ζύμη', 'zymē', 'G2219', 'Leaven, yeast — a small amount of fermented dough used to cause an entire batch to rise. In Scripture, leaven almost always symbolises the pervasive, corrupting influence of sin or false teaching (Matthew 16:6; Mark 8:15; Galatians 5:9). A tiny amount affects the whole. Paul applies this to the church: one tolerated case of immorality will corrupt the entire congregation if left unaddressed.', 4),
  -- v.7 passover
  ('πάσχα', 'pascha', 'G3957', 'Passover — from Hebrew pesach (to pass over, spare). The annual Jewish feast commemorating the exodus from Egypt, when the angel of death ''passed over'' houses marked with lamb''s blood (Exodus 12). Paul directly identifies Christ as ''our Passover'' (to pascha hēmōn), making the most explicit NT connection between Christ''s death and the Passover sacrifice. As the lamb was slain to deliver Israel from Egypt, Christ was sacrificed to deliver believers from sin.', 5),
  -- v.7 sacrificed
  ('θύω', 'thyō', 'G2380', 'To sacrifice, slaughter, kill — the standard term for ritual sacrifice. The aorist passive (etythē — was sacrificed) points to a completed, once-for-all event: Christ''s death on the cross. This verb connects Christ''s death to the entire OT sacrificial system, particularly the Passover lamb of Exodus 12:6. The sacrifice has already occurred; the church must now live accordingly.', 6),
  -- v.8 sincerity
  ('εἰλικρίνεια', 'eilikrineia', 'G1505', 'Sincerity, purity, transparency — possibly from heilē (sunlight) + krinō (to judge): that which is judged pure when examined in sunlight. Alternatively from eilō (to sift). Either derivation points to genuineness that withstands scrutiny. In contrast to the ''leaven of malice and wickedness,'' sincerity and truth characterise the unleavened life of the redeemed community.', 7),
  -- v.11 railer
  ('λοίδορος', 'loidoros', 'G3060', 'Reviler, verbal abuser, railer — one who uses language as a weapon to demean, slander, and destroy others. Included in the list alongside sexual immorality, greed, and drunkenness, showing that verbal abuse is treated as equally serious. A professing Christian who habitually reviles others is subject to the same discipline as a fornicator or drunkard.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 5
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 5
    WHEN 4 THEN 6
    WHEN 5 THEN 7
    WHEN 6 THEN 7
    WHEN 7 THEN 8
    WHEN 8 THEN 11
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 father's wife
  (1, 'Leviticus 18:8', 1),
  (1, 'Deuteronomy 22:30', 2),
  -- v.2 puffed up
  (2, '1 Corinthians 4:6', 3),
  (2, '1 Corinthians 4:18-19', 4),
  -- v.5 deliver unto Satan
  (5, '1 Timothy 1:20', 5),
  (5, '2 Corinthians 2:5-8', 6),
  -- v.6 little leaven
  (6, 'Galatians 5:9', 7),
  (6, 'Matthew 16:6', 8),
  -- v.7 Christ our passover
  (7, 'Exodus 12:3-6', 9),
  (7, 'John 1:29', 10),
  (7, 'Isaiah 53:7', 11),
  (7, '1 Peter 1:18-19', 12),
  -- v.8 unleavened bread
  (8, 'Exodus 12:15-20', 13),
  (8, 'Deuteronomy 16:3', 14),
  -- v.9 previous epistle
  (9, '2 Corinthians 7:8', 15),
  -- v.10 not of this world
  (10, 'John 17:15', 16),
  -- v.11 not to eat
  (11, '2 Thessalonians 3:6', 17),
  (11, '2 Thessalonians 3:14', 18),
  (11, '2 John 1:10-11', 19),
  -- v.12 judge those within
  (12, 'Matthew 18:15-17', 20),
  -- v.13 put away the wicked
  (13, 'Deuteronomy 13:5', 21),
  (13, 'Deuteronomy 17:7', 22),
  (13, 'Deuteronomy 19:19', 23)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 5
  AND v.verse_number = cr.verse_number;
