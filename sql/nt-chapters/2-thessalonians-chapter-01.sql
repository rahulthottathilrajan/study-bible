-- ═══════════════════════════════════════════════════
-- 2 THESSALONIANS CHAPTER 1 — Righteous Judgment & the Coming of Christ
-- 12 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Written shortly after 1 Thessalonians (~AD 51-52), this chapter opens with Paul''s warmest thanksgiving: the Thessalonians'' faith is growing exceedingly and their love is abounding despite fierce persecution. Paul then shifts to the theme of divine justice — God will repay tribulation to their persecutors and grant rest to the afflicted when the Lord Jesus is revealed from heaven with His mighty angels in flaming fire. Those who do not know God and do not obey the Gospel will suffer everlasting destruction from the presence of the Lord. The chapter closes with Paul''s prayer that God would count them worthy of their calling and fulfil every good work of faith, so that Christ may be glorified in them.',
  'Righteous Judgment at Christ''s Glorious Return',
  'ἔνδικον (endikon)',
  'Righteous, just — it is a righteous thing with God to recompense. Divine justice is not arbitrary but perfectly equitable.',
  '["Greeting (vv.1-2): Paul, Silvanus, and Timothy to the church at Thessalonica","Thanksgiving for Growth (vv.3-4): Faith growing exceedingly, love abounding, endurance in persecutions","The Righteous Judgment of God (vv.5-10): God will repay persecutors with tribulation and grant rest to the persecuted at Christ''s revelation in flaming fire; everlasting destruction for the disobedient; Christ glorified in His saints","Prayer for Worthiness (vv.11-12): That God would count them worthy and fulfil every good work of faith, that Christ may be glorified"]'
FROM books b WHERE b.name = '2 Thessalonians';

-- Step 2: Insert all 12 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, and Silvanus, and Timotheus, unto the church of the Thessalonians in God our Father and the Lord Jesus Christ:',
   'Παῦλος καὶ Σιλουανὸς καὶ Τιμόθεος τῇ ἐκκλησίᾳ Θεσσαλονικέων ἐν θεῷ πατρὶ ἡμῶν καὶ κυρίῳ Ἰησοῦ Χριστῷ',
   'Paulos kai Silouanos kai Timotheos tē ekklēsia Thessalonikēōn en theō patri hēmōn kai kyriō Iēsou Christō',
   'The same trio as 1 Thessalonians: Paul, Silvanus (Silas), and Timothy. The church is described as being ''in God our Father and the Lord Jesus Christ'' — the Father and Christ placed on equal footing as the sphere of the church''s existence. This is a stronger expression than 1 Thessalonians 1:1, adding ''our'' (hēmōn) to ''Father'' and emphasising the intimate relationship.',
   NULL),
  (2,
   'Grace unto you, and peace, from God our Father and the Lord Jesus Christ.',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   'Paul''s standard greeting uniting Greek ''grace'' (charis) and Hebrew ''peace'' (eirēnē/shalom). Grace is the source, peace the fruit. Both flow equally from God the Father and the Lord Jesus Christ — a quiet but unmistakable affirmation of Christ''s deity.',
   NULL),
  (3,
   'We are bound to thank God always for you, brethren, as it is meet, because that your faith groweth exceedingly, and the charity of every one of you all toward each other aboundeth;',
   'Εὐχαριστεῖν ὀφείλομεν τῷ θεῷ πάντοτε περὶ ὑμῶν ἀδελφοί καθὼς ἄξιόν ἐστιν ὅτι ὑπεραυξάνει ἡ πίστις ὑμῶν καὶ πλεονάζει ἡ ἀγάπη ἑνὸς ἑκάστου πάντων ὑμῶν εἰς ἀλλήλους',
   'Eucharistēin opheilomen tō theō pantote peri hymōn adelphoi kathōs axion estin hoti hyperauxanei hē pistis hymōn kai pleonazei hē agapē henos hekastou pantōn hymōn eis allēlous',
   '''We are bound'' (opheilomen — we owe it, we are obligated) — Paul feels a moral duty to give thanks, not merely a desire. ''Groweth exceedingly'' (hyperauxanei) is a rare compound verb found only here in the NT — hyper (beyond) + auxanō (grow). Their faith is not merely growing but super-growing. ''Aboundeth'' (pleonazei — overflows, multiplies) describes their love. In 1 Thessalonians 3:10-12, Paul prayed for exactly this — now he reports the answer.',
   NULL),
  (4,
   'So that we ourselves glory in you in the churches of God for your patience and faith in all your persecutions and tribulations that ye endure:',
   'ὥστε ἡμᾶς αὐτοὺς ἐν ὑμῖν καυχᾶσθαι ἐν ταῖς ἐκκλησίαις τοῦ θεοῦ ὑπὲρ τῆς ὑπομονῆς ὑμῶν καὶ πίστεως ἐν πᾶσιν τοῖς διωγμοῖς ὑμῶν καὶ ταῖς θλίψεσιν αἷς ἀνέχεσθε',
   'hōste hēmas autous en hymin kauchasthai en tais ekklēsiais tou theou hyper tēs hypomonēs hymōn kai pisteōs en pasin tois diōgmois hymōn kai tais thlipsesin hais anechesthe',
   '''We ourselves glory'' (hēmas autous kauchasthai) — Paul personally boasts about them to other churches. This is remarkable since Paul usually avoids boasting (cf. 2 Cor 10:13-17). ''Patience'' (hypomonē — steadfast endurance, not passive waiting but active perseverance under pressure). Their faith is proven genuine precisely because it persists through persecutions (diōgmois) and tribulations (thlipsesin).',
   NULL),
  (5,
   'Which is a manifest token of the righteous judgment of God, that ye may be counted worthy of the kingdom of God, for which ye also suffer:',
   'ἔνδειγμα τῆς δικαίας κρίσεως τοῦ θεοῦ εἰς τὸ καταξιωθῆναι ὑμᾶς τῆς βασιλείας τοῦ θεοῦ ὑπὲρ ἧς καὶ πάσχετε',
   'endeigma tēs dikaias kriseōs tou theou eis to kataxiōthēnai hymas tēs basileias tou theou hyper hēs kai paschete',
   '''Manifest token'' (endeigma — proof, evidence, clear demonstration) — their endurance under suffering is itself evidence that God''s judgment is righteous. The logic: if the righteous suffer now and the wicked prosper, then a future judgment must exist to set things right. ''Counted worthy'' (kataxiōthēnai) does not mean they earn the kingdom by suffering, but that suffering refines and demonstrates their fitness for it.',
   'Suffering does not earn salvation but demonstrates its reality. The perseverance of believers under trial is proof (endeigma) that God''s future judgment is coming — a judgment that will vindicate the righteous and punish the wicked.'),
  (6,
   'Seeing it is a righteous thing with God to recompense tribulation to them that trouble you;',
   'εἴπερ δίκαιον παρὰ θεῷ ἀνταποδοῦναι τοῖς θλίβουσιν ὑμᾶς θλῖψιν',
   'eiper dikaion para theō antapodounai tois thlibousin hymas thlipsin',
   '''A righteous thing'' (dikaion) — God''s retribution is not vindictive but just. ''Recompense'' (antapodounai — to repay in full, give back in return) uses the lex talionis principle: those who inflict tribulation (thlipsin) will receive tribulation. The grammar (eiper — ''since indeed'') presents this as a settled fact, not a possibility. Divine justice guarantees proportional recompense.',
   'God''s justice requires retribution. This is not cruelty but righteousness — the same attribute that saves believers also condemns persecutors. A God who ignored evil would not be just.'),
  (7,
   'And to you who are troubled rest with us, when the Lord Jesus shall be revealed from heaven with his mighty angels,',
   'καὶ ὑμῖν τοῖς θλιβομένοις ἄνεσιν μεθ᾽ ἡμῶν ἐν τῇ ἀποκαλύψει τοῦ κυρίου Ἰησοῦ ἀπ᾽ οὐρανοῦ μετ᾽ ἀγγέλων δυνάμεως αὐτοῦ',
   'kai hymin tois thlibomenois anesin meth'' hēmōn en tē apokalypsei tou kyriou Iēsou ap'' ouranou met'' angelōn dynameōs autou',
   '''Rest'' (anesin — relief, relaxation, release from tension) is the counterpart to ''tribulation'' — what the persecuted will receive when Christ is ''revealed'' (apokalypsei — unveiled, disclosed). This is not the quiet rapture of 1 Thessalonians 4:16-17 but the public, visible, glorious appearing. ''Mighty angels'' (angelōn dynameōs — angels of His power) — Christ comes with heavenly hosts as His retinue.',
   NULL),
  (8,
   'In flaming fire taking vengeance on them that know not God, and that obey not the gospel of our Lord Jesus Christ:',
   'ἐν πυρὶ φλογός διδόντος ἐκδίκησιν τοῖς μὴ εἰδόσιν θεὸν καὶ τοῖς μὴ ὑπακούουσιν τῷ εὐαγγελίῳ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'en pyri phlogos didontos ekdikēsin tois mē eidosin theon kai tois mē hypakouousin tō euangeliō tou kyriou hēmōn Iēsou Christou',
   '''Flaming fire'' (pyri phlogos) echoes Old Testament theophanies (Exod 3:2, Deut 33:2, Isa 66:15). Two groups face vengeance: (1) those who ''know not God'' (mē eidosin theon — Gentiles who reject natural revelation) and (2) those who ''obey not the gospel'' (mē hypakouousin — those who hear but refuse to submit). The gospel demands obedience (hypakoē), not merely intellectual assent.',
   'The Gospel is not merely an invitation but a command that requires obedience (cf. Rom 1:5, ''obedience of faith''). To refuse the Gospel is disobedience, and disobedience to God carries consequences.'),
  (9,
   'Who shall be punished with everlasting destruction from the presence of the Lord, and from the glory of his power;',
   'οἵτινες δίκην τίσουσιν ὄλεθρον αἰώνιον ἀπὸ προσώπου τοῦ κυρίου καὶ ἀπὸ τῆς δόξης τῆς ἰσχύος αὐτοῦ',
   'hoitines dikēn tisousin olethron aiōnion apo prosōpou tou kyriou kai apo tēs doxēs tēs ischyos autou',
   '''Everlasting destruction'' (olethron aiōnion) — olethros means ruin, destruction, loss of everything worthwhile; aiōnion means age-long, eternal. ''From the presence of the Lord'' (apo prosōpou tou kyriou) indicates separation — the punishment is exclusion from God''s gracious presence and the glory of His power. This is not annihilation (the word olethros implies ongoing ruin, not cessation) but perpetual banishment from all that is good.',
   'Eternal punishment is defined as separation from God''s presence and glory. The same Lord whose presence is rest and joy for believers (v.7) is the source of terror for the disobedient. This verse is one of the clearest NT statements on the duration and nature of final punishment.'),
  (10,
   'When he shall come to be glorified in his saints, and to be admired in all them that believe (because our testimony among you was believed) in that day.',
   'ὅταν ἔλθῃ ἐνδοξασθῆναι ἐν τοῖς ἁγίοις αὐτοῦ καὶ θαυμασθῆναι ἐν πᾶσιν τοῖς πιστεύσασιν ὅτι ἐπιστεύθη τὸ μαρτύριον ἡμῶν ἐπ᾽ ὑμᾶς ἐν τῇ ἡμέρᾳ ἐκείνῃ',
   'hotan elthē endoxasthēnai en tois hagiois autou kai thaumасthēnai en pasin tois pisteusasin hoti episteuthē to martyrion hēmōn eph'' hymas en tē hēmera ekeinē',
   '''Glorified in his saints'' (endoxasthēnai en tois hagiois) — Christ will be glorified not merely among but in His people. The saints themselves become the medium through which Christ''s glory is displayed. ''Admired'' (thaumасthēnai — marvelled at, wondered at) — the sight of redeemed humanity will evoke wonder. The parenthetical ''because our testimony among you was believed'' reassures the Thessalonians that they are included in this glorious company.',
   'Christ''s glory is revealed through His people. The church is not merely saved from destruction but destined to be the showcase of Christ''s transforming power for all eternity (cf. Eph 2:7).'),
  (11,
   'Wherefore also we pray always for you, that our God would count you worthy of this calling, and fulfil all the good pleasure of his goodness, and the work of faith with power:',
   'εἰς ὃ καὶ προσευχόμεθα πάντοτε περὶ ὑμῶν ἵνα ὑμᾶς ἀξιώσῃ τῆς κλήσεως ὁ θεὸς ἡμῶν καὶ πληρώσῃ πᾶσαν εὐδοκίαν ἀγαθωσύνης καὶ ἔργον πίστεως ἐν δυνάμει',
   'eis ho kai proseuchometha pantote peri hymōn hina hymas axiōsē tēs klēseōs ho theos hēmōn kai plērōsē pasan eudokian agathōsynēs kai ergon pisteōs en dynamei',
   'Paul prays God would ''count them worthy'' (axiōsē — deem worthy, make worthy) of their calling. This is divine enabling, not human merit. ''Good pleasure of his goodness'' (eudokian agathōsynēs) — every desire for goodness that God produces in them. ''Work of faith with power'' (ergon pisteōs en dynamei) — faith produces works, and God supplies the power. The entire Christian life is God''s work through human faith.',
   NULL),
  (12,
   'That the name of our Lord Jesus Christ may be glorified in you, and ye in him, according to the grace of our God and the Lord Jesus Christ.',
   'ὅπως ἐνδοξασθῇ τὸ ὄνομα τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἐν ὑμῖν καὶ ὑμεῖς ἐν αὐτῷ κατὰ τὴν χάριν τοῦ θεοῦ ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'hopōs endoxasthē to onoma tou kyriou hēmōn Iēsou Christou en hymin kai hymeis en autō kata tēn charin tou theou hēmōn kai kyriou Iēsou Christou',
   'The goal of everything: mutual glorification — Christ glorified in them, and they glorified in Christ. This reciprocal indwelling echoes John 17:21-23. ''According to the grace'' (kata tēn charin) — grace is the basis, not human effort. The final phrase ''our God and the Lord Jesus Christ'' may be read as a single referent (Granville Sharp rule), making this a direct affirmation of Christ''s deity: ''our God and Lord, Jesus Christ.''',
   'The Granville Sharp rule in Greek grammar suggests that ''our God and Lord Jesus Christ'' identifies Jesus as God. This is one of several NT texts where Christ is called God (cf. Titus 2:13, 2 Peter 1:1, John 20:28).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 3 (Faith growing exceedingly)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπεραυξάνει', 'hyperauxanei', 'G5232', 'Grows exceedingly, super-grows — a compound found only here in the NT. Hyper (beyond) + auxanō (grow). Faith that exceeds all expectations.', 1),
  ('πλεονάζει', 'pleonazei', 'G4121', 'Abounds, overflows, multiplies — love is not merely present but superabundant among every member.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 5 (Manifest token)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔνδειγμα', 'endeigma', 'G1730', 'Proof, evidence, manifest token — a clear demonstration visible to all. Found only here in the NT.', 1),
  ('καταξιωθῆναι', 'kataxiōthēnai', 'G2661', 'To be counted worthy, deemed deserving — not earning salvation but being shown fit for the kingdom through endurance.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 7 (Rest and revelation)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄνεσιν', 'anesin', 'G425', 'Rest, relief, relaxation — release from the tension of suffering. The counterpart to tribulation (thlipsis).', 1),
  ('ἀποκαλύψει', 'apokalypsei', 'G602', 'Revelation, unveiling, disclosure — the moment when the hidden Lord is publicly manifested in glory.', 2),
  ('δυνάμεως', 'dynameōs', 'G1411', 'Power, might, strength — the angels are agents of Christ''s own power, not independent forces.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 8 (Vengeance in flaming fire)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐκδίκησιν', 'ekdikēsin', 'G1557', 'Vengeance, full justice, vindication — not emotional revenge but the execution of righteous judgment.', 1),
  ('ὑπακούουσιν', 'hypakouousin', 'G5219', 'Obey, submit to, hearken — from hypo (under) + akouō (hear). The Gospel requires submissive hearing, not mere acknowledgment.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 9 (Everlasting destruction)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὄλεθρον', 'olethron', 'G3639', 'Destruction, ruin — not annihilation but the loss of all that makes existence worthwhile. Ongoing ruination.', 1),
  ('αἰώνιον', 'aiōnion', 'G166', 'Eternal, everlasting, age-long — the same word used for eternal life (John 3:16). The duration of punishment matches the duration of salvation.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 10 (Glorified in saints)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνδοξασθῆναι', 'endoxasthēnai', 'G1740', 'To be glorified, to be held in glory — Christ''s glory will be visibly displayed in and through His people.', 1),
  ('θαυμασθῆναι', 'thaumасthēnai', 'G2296', 'To be marvelled at, wondered at, admired — the redeemed will evoke astonishment at what grace has accomplished.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Greeting
  (1, '1 Thessalonians 1:1', 1), (1, 'Acts 17:1-4', 2),
  -- v2: Grace and peace
  (2, 'Romans 1:7', 1), (2, '1 Corinthians 1:3', 2),
  -- v3: Faith growing
  (3, '1 Thessalonians 3:10-12', 1), (3, '2 Peter 3:18', 2), (3, 'Colossians 1:3-4', 3),
  -- v4: Boasting in churches
  (4, '1 Thessalonians 2:19-20', 1), (4, 'Romans 5:3-4', 2), (4, 'James 1:2-4', 3),
  -- v5: Righteous judgment
  (5, 'Philippians 1:28-29', 1), (5, '1 Peter 4:12-13', 2), (5, 'Acts 14:22', 3),
  -- v6: Recompense tribulation
  (6, 'Romans 12:19', 1), (6, 'Revelation 6:10', 2), (6, 'Deuteronomy 32:35', 3),
  -- v7: Revelation from heaven
  (7, '1 Thessalonians 4:16-17', 1), (7, 'Matthew 25:31', 2), (7, 'Jude 1:14-15', 3), (7, 'Revelation 19:11-14', 4),
  -- v8: Flaming fire
  (8, 'Isaiah 66:15', 1), (8, 'Romans 2:8-9', 2), (8, '1 Peter 4:17', 3), (8, 'Hebrews 10:27', 4),
  -- v9: Everlasting destruction
  (9, 'Matthew 25:41', 1), (9, 'Matthew 25:46', 2), (9, 'Isaiah 2:19-21', 3), (9, 'Revelation 20:10-15', 4),
  -- v10: Glorified in saints
  (10, 'John 17:10', 1), (10, 'Colossians 3:4', 2), (10, 'Ephesians 2:7', 3), (10, '1 John 3:2', 4),
  -- v11: Count you worthy
  (11, 'Philippians 2:13', 1), (11, 'Colossians 1:10-12', 2), (11, 'Ephesians 2:10', 3),
  -- v12: Glorified name
  (12, 'John 17:21-23', 1), (12, 'Titus 2:13', 2), (12, '2 Peter 1:1', 3), (12, 'John 20:28', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ 2 Thessalonians Chapter 1 Complete!
-- 12 verses · 6 key verses with word studies (13 words)
-- Cross-references for all 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
