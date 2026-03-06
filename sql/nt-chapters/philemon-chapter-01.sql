-- ═══════════════════════════════════════════════════
-- PHILEMON CHAPTER 1 — Forgiveness & Reconciliation
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Paul''s shortest and most personal letter is a masterpiece of pastoral persuasion. Writing from prison, Paul appeals to Philemon — a wealthy believer in Colossae — to receive back his runaway slave Onesimus, who has since become a Christian under Paul''s ministry. Rather than commanding with apostolic authority, Paul appeals through love, making this letter a living parable of the Gospel itself: one who was useless becomes useful, a debt is imputed to another, and a slave is welcomed as a brother. The letter illustrates imputation, substitution, reconciliation, and the radical social transformation the Gospel produces.',
  'Forgiveness, Reconciliation & the Gospel in Action',
  'παρακαλῶ (parakaleō)',
  'I appeal, I beseech — from para (alongside) + kaleō (to call). To come alongside and urge with tender authority, not coercion.',
  '["Greeting (vv.1-3): Paul the prisoner, Timothy, Philemon, Apphia, Archippus, the house church","Thanksgiving & Commendation (vv.4-7): Philemon''s love, faith, and refreshing of the saints","The Appeal for Onesimus (vv.8-16): From command to love; from slave to brother","The Pledge & Confidence (vv.17-21): Receive him as me; I will repay; I trust your obedience","Closing & Benediction (vv.22-25): Prepare a lodging; greetings; grace"]'
FROM books b WHERE b.name = 'Philemon';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, a prisoner of Jesus Christ, and Timothy our brother, unto Philemon our dearly beloved, and fellowlabourer,',
   'Παῦλος δέσμιος Χριστοῦ Ἰησοῦ καὶ Τιμόθεος ὁ ἀδελφὸς Φιλήμονι τῷ ἀγαπητῷ καὶ συνεργῷ ἡμῶν',
   'Paulos desmios Christou Iēsou kai Timotheos ho adelphos Philēmoni tō agapētō kai synergō hēmōn',
   'Paul identifies himself not as an apostle (his usual title) but as a ''prisoner'' (desmios) of Christ Jesus — a deliberate choice. He leads with vulnerability, not authority. This sets the tone for the entire letter: an appeal through love rather than command. Timothy is included as co-sender, and Philemon is addressed with warmth — ''dearly beloved'' (agapētos) and ''fellowlabourer'' (synergos) — establishing their partnership before making his request.',
   NULL),
  (2,
   'And to our beloved Apphia, and Archippus our fellowsoldier, and to the church in thy house:',
   'καὶ Ἀπφίᾳ τῇ ἀγαπητῇ καὶ Ἀρχίππῳ τῷ συστρατιώτῃ ἡμῶν καὶ τῇ κατ᾽ οἶκόν σου ἐκκλησίᾳ',
   'kai Apphia tē agapētē kai Archippō tō systratiōtē hēmōn kai tē kat'' oikon sou ekklēsia',
   'Apphia was likely Philemon''s wife, and Archippus possibly his son or the church''s pastor (cf. Col 4:17). By addressing the whole house church, Paul makes this a public matter — Philemon cannot quietly refuse without the community knowing. ''Fellowsoldier'' (systratiōtēs) casts the Christian life as spiritual warfare requiring comrades.',
   NULL),
  (3,
   'Grace to you, and peace, from God our Father and the Lord Jesus Christ.',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   'Paul''s standard greeting combines the Greek ''grace'' (charis) with the Hebrew ''peace'' (shalom/eirēnē). Grace is the source; peace is the result. Both flow from God the Father and the Lord Jesus Christ — placed on equal footing, affirming Christ''s deity.',
   NULL),
  (4,
   'I thank my God, making mention of thee always in my prayers,',
   'Εὐχαριστῶ τῷ θεῷ μου πάντοτε μνείαν σου ποιούμενος ἐπὶ τῶν προσευχῶν μου',
   'Eucharistō tō theō mou pantote mneian sou poioumenos epi tōn proseuchōn mou',
   'Paul begins with thanksgiving — his consistent practice before making requests (cf. Rom 1:8, Phil 1:3, Col 1:3). ''My God'' reveals personal relationship. ''Always'' and ''making mention'' show that Paul''s prayers were specific and habitual, not generic.',
   NULL),
  (5,
   'Hearing of thy love and faith, which thou hast toward the Lord Jesus, and toward all saints;',
   'ἀκούων σου τὴν ἀγάπην καὶ τὴν πίστιν ἣν ἔχεις πρὸς τὸν κύριον Ἰησοῦν καὶ εἰς πάντας τοὺς ἁγίους',
   'akouōn sou tēn agapēn kai tēn pistin hēn echeis pros ton kyrion Iēsoun kai eis pantas tous hagious',
   'Paul uses a chiastic structure (ABBA): love—faith—Lord Jesus—all saints. Faith is directed toward the Lord Jesus; love flows outward to all the saints. This is significant because Paul is about to ask Philemon to extend that love to one particular saint — Onesimus.',
   NULL),
  (6,
   'That the communication of thy faith may become effectual by the acknowledging of every good thing which is in you in Christ Jesus.',
   'ὅπως ἡ κοινωνία τῆς πίστεώς σου ἐνεργὴς γένηται ἐν ἐπιγνώσει παντὸς ἀγαθοῦ τοῦ ἐν ὑμῖν εἰς Χριστὸν Ἰησοῦν',
   'hopōs hē koinōnia tēs pisteōs sou energēs genētai en epignōsei pantos agathou tou en hymin eis Christon Iēsoun',
   'One of the letter''s most theologically dense verses. ''Communication'' (koinōnia) means fellowship, partnership, sharing. Paul prays that Philemon''s active sharing of faith would become ''effectual'' (energēs — energised, powerfully working) as he recognises (epignōsis — full, deep knowledge) every good thing God has placed within the believing community. Receiving Onesimus back would be precisely this kind of effectual faith.',
   NULL),
  (7,
   'For we have great joy and consolation in thy love, because the bowels of the saints are refreshed by thee, brother.',
   'χαρὰν γὰρ πολλὴν ἔσχον καὶ παράκλησιν ἐπὶ τῇ ἀγάπῃ σου ὅτι τὰ σπλάγχνα τῶν ἁγίων ἀναπέπαυται διὰ σοῦ ἀδελφέ',
   'charan gar pollēn eschon kai paraklēsin epi tē agapē sou hoti ta splanchna tōn hagiōn anapepautai dia sou adelphe',
   '''Bowels'' (splanchna) refers to the deepest seat of emotion in Greek thought — the intestines, the gut. The saints'' innermost being has been ''refreshed'' (anapepautai — given rest, renewed) through Philemon''s love. Paul will use splanchna again in v.12 and v.20, creating a deliberate thread: the one who refreshes others is now asked to refresh Paul by receiving Onesimus.',
   NULL),
  (8,
   'Wherefore, though I might be much bold in Christ to enjoin thee that which is convenient,',
   'Διὸ πολλὴν ἐν Χριστῷ παρρησίαν ἔχων ἐπιτάσσειν σοι τὸ ἀνῆκον',
   'Dio pollēn en Christō parrēsian echōn epitassein soi to anēkon',
   'Paul acknowledges he has the apostolic authority (parrēsia — boldness, freedom of speech) to ''command'' (epitassein — to order, as a superior to a subordinate) what is ''fitting'' (anēkon). But he deliberately sets this authority aside. This is the genius of the letter — Paul models the very grace he preaches.',
   NULL),
  (9,
   'Yet for love''s sake I rather beseech thee, being such an one as Paul the aged, and now also a prisoner of Jesus Christ.',
   'διὰ τὴν ἀγάπην μᾶλλον παρακαλῶ τοιοῦτος ὢν ὡς Παῦλος πρεσβύτης νυνὶ δὲ καὶ δέσμιος Χριστοῦ Ἰησοῦ',
   'dia tēn agapēn mallon parakalō toioutos ōn hōs Paulos presbytēs nyni de kai desmios Christou Iēsou',
   'Instead of commanding, Paul ''beseeches'' (parakaleō — appeals alongside). He describes himself with two pathos-laden words: ''the aged'' (presbytēs — an old man, possibly in his late 50s/early 60s, worn by hardship) and ''prisoner'' (desmios). Love, not rank, is the basis of his appeal. This models Christ who, though having all authority, humbled Himself (Phil 2:6-8).',
   'The Gospel operates by appeal, not coercion. God invites, entreats, and beseeches (2 Cor 5:20). Paul imitates this divine pattern — leading through sacrificial love rather than positional power.'),
  (10,
   'I beseech thee for my son Onesimus, whom I have begotten in my bonds:',
   'παρακαλῶ σε περὶ τοῦ ἐμοῦ τέκνου ὃν ἐγέννησα ἐν τοῖς δεσμοῖς μου Ὀνήσιμον',
   'parakalō se peri tou emou teknou hon egennēsa en tois desmois mou Onēsimon',
   'Paul delays naming Onesimus until after building his case — masterful rhetoric. He first calls him ''my son'' (teknon — child, born of me) whom he ''begat'' (egennēsa) in prison. The name Onesimus means ''useful/profitable'' — a common slave name. Paul led this runaway slave to Christ while in chains, making his imprisonment fruitful.',
   'Spiritual fatherhood: Paul ''begat'' Onesimus through the Gospel (cf. 1 Cor 4:15). Every conversion is a new birth, regardless of the circumstances in which it occurs.'),
  (11,
   'Which in time past was to thee unprofitable, but now profitable to thee and to me:',
   'τόν ποτέ σοι ἄχρηστον νυνὶ δὲ σοὶ καὶ ἐμοὶ εὔχρηστον',
   'ton pote soi achrēston nyni de soi kai emoi euchrēston',
   'A brilliant wordplay: ''unprofitable'' (achrēstos) and ''profitable'' (euchrēstos) pun on the name Onesimus (''useful''). There is also a hidden pun on ''Christos'' — achrēstos (without Christ) has become euchrēstos (good in Christ). The Gospel transforms the useless into the useful, the worthless into the valuable.',
   NULL),
  (12,
   'Whom I have sent again: thou therefore receive him, that is, mine own bowels:',
   'ὃν ἀνέπεμψά σοι αὐτόν τοῦτ᾽ ἔστιν τὰ ἐμὰ σπλάγχνα',
   'hon anepempsa soi auton tout'' estin ta ema splanchna',
   '''Mine own bowels'' (ta ema splanchna) — Paul says Onesimus is his very heart, his deepest affections. By sending Onesimus back, Paul is tearing out his own heart. This intensely personal language makes it nearly impossible for Philemon to reject Onesimus without also rejecting Paul.',
   NULL),
  (13,
   'Whom I would have retained with me, that in thy stead he might have ministered unto me in the bonds of the gospel:',
   'ὃν ἐγὼ ἐβουλόμην πρὸς ἐμαυτὸν κατέχειν ἵνα ὑπὲρ σοῦ μοι διακονῇ ἐν τοῖς δεσμοῖς τοῦ εὐαγγελίου',
   'hon egō eboulomēn pros emauton katechein hina hyper sou moi diakonē en tois desmois tou euangeliou',
   'Paul wanted to keep Onesimus — he was genuinely useful in prison ministry. ''In thy stead'' (hyper sou) — Onesimus was serving Paul as Philemon''s representative. This subtly reminds Philemon of his own obligation to support Paul, while also honouring Philemon''s rights as master.',
   NULL),
  (14,
   'But without thy mind would I do nothing; that thy benefit should not be as it were of necessity, but willingly.',
   'χωρὶς δὲ τῆς σῆς γνώμης οὐδὲν ἠθέλησα ποιῆσαι ἵνα μὴ ὡς κατὰ ἀνάγκην τὸ ἀγαθόν σου ᾖ ἀλλὰ κατὰ ἑκούσιον',
   'chōris de tēs sēs gnōmēs ouden ēthelēsa poiēsai hina mē hōs kata anankēn to agathon sou ē alla kata hekousion',
   'Paul respects Philemon''s autonomy — goodness compelled is not goodness at all. ''Willingly'' (hekousion) versus ''of necessity'' (anankēn) — Paul wants Philemon''s forgiveness to be a free, joyful act of grace, not reluctant compliance. This reflects how God deals with us: He invites but never coerces.',
   'True Christian virtue must be voluntary. God desires cheerful givers (2 Cor 9:7), not begrudging obedience. Grace transforms the heart so that duty becomes delight.'),
  (15,
   'For perhaps he therefore departed for a season, that thou shouldest receive him for ever;',
   'τάχα γὰρ διὰ τοῦτο ἐχωρίσθη πρὸς ὥραν ἵνα αἰώνιον αὐτὸν ἀπέχῃς',
   'tacha gar dia touto echōristhē pros hōran hina aiōnion auton apechēs',
   '''Perhaps'' (tacha) — Paul speaks with gentle tentativeness, suggesting divine providence without being presumptuous. ''Departed'' (echōristhē — was separated, passive voice) hints that God was at work behind Onesimus''s flight. ''For a season'' (pros hōran) versus ''for ever'' (aiōnion) — a temporary earthly loss becomes an eternal spiritual gain. Joseph''s words to his brothers echo here: ''God meant it for good'' (Gen 50:20).',
   'God''s providence works through human sin and failure. What appears as loss and tragedy may be God''s instrument for eternal blessing — a pattern seen in Joseph, Ruth, the Cross itself.'),
  (16,
   'Not now as a servant, but above a servant, a brother beloved, specially to me, but how much more unto thee, both in the flesh, and in the Lord?',
   'οὐκέτι ὡς δοῦλον ἀλλ᾽ ὑπὲρ δοῦλον ἀδελφὸν ἀγαπητόν μάλιστα ἐμοί πόσῳ δὲ μᾶλλον σοὶ καὶ ἐν σαρκὶ καὶ ἐν κυρίῳ',
   'ouketi hōs doulon all'' hyper doulon adelphon agapēton malista emoi posō de mallon soi kai en sarki kai en kyriō',
   'The theological heart of the letter. Onesimus is no longer merely a slave (doulos) but ''above a slave'' — a beloved brother (adelphon agapēton). The Gospel does not simply improve social status; it transforms the fundamental relationship. ''Both in the flesh and in the Lord'' — the new spiritual reality (in the Lord) must reshape the earthly reality (in the flesh). This verse planted the seed that would eventually overthrow slavery.',
   'The Gospel creates a brotherhood that transcends all social distinctions. In Christ there is neither bond nor free (Gal 3:28). While Paul does not directly command manumission, the logic of the Gospel makes slavery ultimately untenable between brothers.'),
  (17,
   'If thou count me therefore a partner, receive him as myself.',
   'εἰ οὖν με ἔχεις κοινωνόν προσλαβοῦ αὐτὸν ὡς ἐμέ',
   'ei oun me echeis koinōnon proslabou auton hōs eme',
   '''Partner'' (koinōnos) — one who shares in common, a business partner, a fellow-sharer. Paul leverages their spiritual partnership: if Philemon considers Paul a partner in the Gospel, then he must receive Onesimus as he would receive Paul himself. ''As myself'' (hōs eme) — this is substitutionary identification. Paul puts himself in Onesimus''s place.',
   'This mirrors Christ''s work: He identifies with sinners so that we might be received by the Father as He Himself is received. ''Receive him as myself'' echoes ''accepted in the Beloved'' (Eph 1:6).'),
  (18,
   'If he hath wronged thee, or oweth thee ought, put that on mine account;',
   'εἰ δέ τι ἠδίκησέν σε ἢ ὀφείλει τοῦτο ἐμοὶ ἐλλόγα',
   'ei de ti ēdikēsen se ē opheilei touto emoi elloga',
   'The clearest Gospel parallel in the letter. ''Put that on mine account'' (emoi elloga) — impute his debt to me. This is substitutionary atonement in miniature: one person assumes the debt of another. Paul does for Onesimus exactly what Christ does for every sinner — He takes our debt upon Himself. ''Elloga'' is an accounting term meaning ''charge to my account, reckon to me.''',
   'Imputation: The doctrine that one person''s debt can be transferred to another''s account. Just as Paul says ''charge it to me,'' Christ says of every believer''s sin debt: ''charge it to My account.'' And just as Christ''s righteousness is credited to us, Paul''s good standing with Philemon is credited to Onesimus (v.17). This is the double imputation of the Gospel.'),
  (19,
   'I Paul have written it with mine own hand, I will repay it: albeit I do not say to thee how thou owest unto me even thine own self besides.',
   'ἐγὼ Παῦλος ἔγραψα τῇ ἐμῇ χειρί ἐγὼ ἀποτίσω ἵνα μὴ λέγω σοι ὅτι καὶ σεαυτόν μοι προσοφείλεις',
   'egō Paulos egrapsa tē emē cheiri egō apotisō hina mē legō soi hoti kai seauton moi prosopheileis',
   'Paul signs a legal IOU with his own hand — ''I will repay'' (apotisō) is a formal promissory note. Then, with masterful irony, he adds: ''not to mention that you owe me your very self'' — Philemon was likely converted through Paul''s ministry. The debt Philemon might claim from Onesimus is nothing compared to the spiritual debt Philemon owes Paul. This is gentle, affectionate leverage.',
   NULL),
  (20,
   'Yea, brother, let me have joy of thee in the Lord: refresh my bowels in the Lord.',
   'ναί ἀδελφέ ἐγώ σου ὀναίμην ἐν κυρίῳ ἀνάπαυσόν μου τὰ σπλάγχνα ἐν Χριστῷ',
   'nai adelphe egō sou onaimēn en kyriō anapausōn mou ta splanchna en Christō',
   '''Let me have joy'' (onaimēn) is another wordplay on ''Onesimus'' — ''let me have profit/benefit from you.'' ''Refresh my bowels'' (anapausōn mou ta splanchna) echoes v.7, where Philemon refreshed the saints'' hearts. Now Paul asks: refresh my heart by receiving Onesimus. The circle closes: Philemon''s known character of refreshing others is the very ground of Paul''s appeal.',
   NULL),
  (21,
   'Having confidence in thy obedience I wrote unto thee, knowing that thou wilt also do more than I say.',
   'πεποιθὼς τῇ ὑπακοῇ σου ἔγραψά σοι εἰδὼς ὅτι καὶ ὑπὲρ ὃ λέγω ποιήσεις',
   'pepoithōs tē hypakoē sou egrapsa soi eidōs hoti kai hyper ho legō poiēseis',
   '''More than I say'' (hyper ho legō) — Paul expects Philemon not merely to receive Onesimus back but to go beyond: likely granting his freedom. Paul never explicitly says ''free him,'' but the entire logic of the letter points there. ''Obedience'' (hypakoē) — though Paul appealed through love (v.9), he still expects obedience to the Gospel''s implications.',
   NULL),
  (22,
   'But withal prepare me also a lodging: for I trust that through your prayers I shall be given unto you.',
   'ἅμα δὲ καὶ ἑτοίμαζέ μοι ξενίαν ἐλπίζω γὰρ ὅτι διὰ τῶν προσευχῶν ὑμῶν χαρισθήσομαι ὑμῖν',
   'hama de kai hetoimaze moi xenian elpizō gar hoti dia tōn proseuchōn hymōn charisthēsomai hymin',
   'A gentle reminder that Paul plans to visit — and will personally see how Philemon has treated Onesimus. ''Prepare me a lodging'' (xenia — guest room) shows Paul''s confidence in release from prison and adds gentle accountability. ''Given unto you'' (charisthēsomai — graciously granted, from charis/grace) — even Paul''s freedom is a gift of grace through their prayers.',
   NULL),
  (23,
   'There salute thee Epaphras, my fellowprisoner in Christ Jesus;',
   'Ἀσπάζεταί σε Ἐπαφρᾶς ὁ συναιχμάλωτός μου ἐν Χριστῷ Ἰησοῦ',
   'Aspazetai se Epaphras ho synaichmalōtos mou en Christō Iēsou',
   'Epaphras founded the church at Colossae (Col 1:7) and was now with Paul in Rome — either literally imprisoned or voluntarily sharing Paul''s confinement. ''Fellowprisoner'' (synaichmalōtos — fellow prisoner of war) uses military language: they are captured soldiers of Christ. Epaphras''s greeting would carry special weight with the Colossian church.',
   NULL),
  (24,
   'Marcus, Aristarchus, Demas, Lucas, my fellowlabourers.',
   'Μᾶρκος Ἀρίσταρχος Δημᾶς Λουκᾶς οἱ συνεργοί μου',
   'Markos Aristarchos Dēmas Loukas hoi synergoi mou',
   'Four men who represent the diversity of Paul''s team: Mark (once rejected by Paul in Acts 15:38, now restored — another story of reconciliation), Aristarchus (faithful companion from Thessalonica, Acts 19:29), Demas (who would later forsake Paul, 2 Tim 4:10 — a sobering warning), and Luke (the beloved physician and author of Luke-Acts). ''Fellowlabourers'' (synergoi) — the same word used for Philemon in v.1.',
   NULL),
  (25,
   'The grace of our Lord Jesus Christ be with your spirit. Amen.',
   'Ἡ χάρις τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μετὰ τοῦ πνεύματος ὑμῶν ἀμήν',
   'Hē charis tou kyriou hēmōn Iēsou Christou meta tou pneumatos hymōn amēn',
   'The letter begins and ends with grace (charis, vv.3,25) — forming an inclusio. ''With your spirit'' (meta tou pneumatos hymōn) — grace is not merely external favour but an inward spiritual reality. ''Your'' is plural (hymōn), encompassing the entire house church. The letter that began with one man''s appeal ends with a communal blessing.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Philemon' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1 (Prisoner)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δέσμιος', 'desmios', 'G1198', 'Prisoner, one bound in chains — Paul chooses this over ''apostolos'' (apostle). He leads with suffering, not status.', 1),
  ('συνεργῷ', 'synergō', 'G4904', 'Fellowlabourer, co-worker — from syn (together) + ergon (work). Partnership in the Gospel mission.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 6 (Fellowship of faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κοινωνία', 'koinōnia', 'G2842', 'Fellowship, communion, sharing, partnership — active participation in something held in common. Here: the outward expression of faith.', 1),
  ('ἐνεργής', 'energēs', 'G1756', 'Effectual, active, powerful, energised — faith that produces visible, tangible results.', 2),
  ('ἐπιγνώσει', 'epignōsei', 'G1922', 'Full knowledge, deep recognition — epi (upon) + gnōsis (knowledge). Not mere information but experiential understanding.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 6;

-- Verse 7 (Bowels refreshed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σπλάγχνα', 'splanchna', 'G4698', 'Bowels, inward parts, heart, tender affections — the deepest seat of emotion. Used 3 times in Philemon (vv.7,12,20) as a key motif.', 1),
  ('ἀναπέπαυται', 'anapepautai', 'G373', 'Refreshed, given rest — perfect tense indicating lasting effect. Philemon''s love has permanently renewed the saints'' spirits.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 10 (Onesimus)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τέκνου', 'teknou', 'G5043', 'Child, offspring — indicates Paul''s spiritual fatherhood. Warmer than ''mathētēs'' (disciple).', 1),
  ('ἐγέννησα', 'egennēsa', 'G1080', 'I begat, I fathered — used of spiritual birth. Paul is the instrument of Onesimus''s new life in Christ.', 2),
  ('Ὀνήσιμον', 'Onēsimon', 'G3682', 'Onesimus — meaning ''useful, profitable, beneficial.'' A common slave name that becomes theologically loaded in Paul''s wordplay.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Verse 16 (Above a servant)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δοῦλον', 'doulon', 'G1401', 'Slave, bondservant — one who is owned. The Gospel does not merely reform the institution but transforms the relationship from within.', 1),
  ('ἀδελφὸν ἀγαπητόν', 'adelphon agapēton', 'G80/G27', 'Beloved brother — the new identity that supersedes social status. A slave becomes family in Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Verse 17 (Receive him as myself)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κοινωνόν', 'koinōnon', 'G2844', 'Partner, sharer, companion — one who shares in common. Stronger than ''friend'' — implies mutual investment.', 1),
  ('προσλαβοῦ', 'proslabou', 'G4355', 'Receive, welcome, take to oneself — the same word used in Romans 14:1 and 15:7 for receiving fellow believers. Warm, personal acceptance.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 17;

-- Verse 18 (Put that on mine account)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἠδίκησεν', 'ēdikēsen', 'G91', 'Wronged, did injustice — Paul uses a conditional (''if'') to soften the accusation, though Onesimus clearly had wronged Philemon.', 1),
  ('ἐλλόγα', 'elloga', 'G1677', 'Put on account, charge, impute, reckon — a bookkeeping term. The same concept behind the imputation of righteousness (Rom 4:3-8) and sin (2 Cor 5:19).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = 18;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Paul the prisoner
  (1, 'Ephesians 3:1', 1), (1, 'Ephesians 4:1', 2), (1, 'Philippians 1:1', 3), (1, 'Colossians 4:9', 4),
  -- v2: House church
  (2, 'Colossians 4:17', 1), (2, 'Romans 16:5', 2), (2, '1 Corinthians 16:19', 3),
  -- v3: Grace and peace
  (3, 'Romans 1:7', 1), (3, '1 Corinthians 1:3', 2), (3, 'Galatians 1:3', 3),
  -- v5: Love and faith
  (5, 'Galatians 5:6', 1), (5, 'Colossians 1:4', 2), (5, '1 Thessalonians 1:3', 3),
  -- v6: Fellowship of faith
  (6, 'Philippians 1:9-11', 1), (6, 'Hebrews 13:16', 2), (6, '2 Peter 1:5-8', 3),
  -- v7: Refreshing the saints
  (7, '2 Corinthians 7:13', 1), (7, 'Romans 15:32', 2), (7, '2 Timothy 1:16', 3),
  -- v9: Appeal through love
  (9, '2 Corinthians 5:20', 1), (9, 'Philippians 2:5-8', 2), (9, '1 Peter 5:1', 3),
  -- v10: Begotten in bonds
  (10, '1 Corinthians 4:15', 1), (10, 'Galatians 4:19', 2), (10, 'Colossians 4:9', 3),
  -- v11: Profitable
  (11, '2 Timothy 4:11', 1), (11, '2 Timothy 2:21', 2),
  -- v14: Willingly
  (14, '2 Corinthians 9:7', 1), (14, '1 Peter 5:2', 2),
  -- v15: Providence
  (15, 'Genesis 45:5-8', 1), (15, 'Genesis 50:20', 2), (15, 'Romans 8:28', 3),
  -- v16: Brother beloved
  (16, 'Galatians 3:28', 1), (16, 'Colossians 3:11', 2), (16, '1 Corinthians 12:13', 3), (16, '1 Timothy 6:2', 4),
  -- v17: Receive him as myself
  (17, 'Romans 14:1', 1), (17, 'Romans 15:7', 2), (17, 'Matthew 25:40', 3),
  -- v18: Imputation
  (18, 'Isaiah 53:6', 1), (18, 'Romans 4:3-8', 2), (18, '2 Corinthians 5:19-21', 3), (18, '1 Peter 2:24', 4),
  -- v19: I will repay
  (19, 'Romans 13:8', 1), (19, '1 Corinthians 4:15', 2),
  -- v22: Prayer for release
  (22, 'Philippians 1:25-26', 1), (22, 'Philippians 2:24', 2), (22, 'Hebrews 13:19', 3),
  -- v24: Fellowlabourers
  (24, 'Acts 15:37-39', 1), (24, '2 Timothy 4:10-11', 2), (24, 'Colossians 4:10-14', 3),
  -- v25: Grace
  (25, 'Galatians 6:18', 1), (25, 'Philippians 4:23', 2), (25, '2 Timothy 4:22', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Philemon' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Philemon Chapter 1 Complete!
-- 25 verses · 8 key verses with word studies (20 words)
-- Cross-references for 17 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════