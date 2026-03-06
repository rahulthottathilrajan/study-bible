-- ═══════════════════════════════════════════════════
-- 1 JOHN CHAPTER 1 — The Word of Life and Walking in the Light
-- 10 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '1 John opens not with a greeting but with a magnificent proclamation of the incarnate Word of life (vv.1-4). John writes as an eyewitness — ''that which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled'' — four verbs of sensory experience that demolish any Gnostic claim that Christ was merely a spirit. The purpose of the proclamation is fellowship: ''that ye also may have fellowship with us: and truly our fellowship is with the Father, and with his Son Jesus Christ'' (v.3). John then announces the central message: ''God is light, and in him is no darkness at all'' (v.5). From this truth flows the test of genuine fellowship: those who walk in darkness while claiming fellowship with God are liars (v.6), but those who walk in the light have fellowship and are cleansed by the blood of Jesus Christ (v.7). The chapter closes with the doctrine of confession: ''If we say that we have no sin, we deceive ourselves'' (v.8), but ''if we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness'' (v.9).',
  'Fellowship with God Through Light and Truth',
  'κοινωνία (koinōnia)',
  'Fellowship, partnership, sharing in common — from koinos (common, shared). Not mere social gathering but a deep spiritual participation in the life of the Father and the Son. The goal of apostolic proclamation is to bring believers into this shared divine life.',
  '["The Word of Life Proclaimed (vv.1-2): That which was from the beginning which we have heard which we have seen with our eyes which we have looked upon and our hands have handled of the Word of life; for the life was manifested and we have seen it and bear witness and shew unto you that eternal life which was with the Father and was manifested unto us","Fellowship with the Father and Son (vv.3-4): That which we have seen and heard declare we unto you that ye also may have fellowship with us and truly our fellowship is with the Father and with his Son Jesus Christ; and these things write we unto you that your joy may be full","God Is Light (vv.5-7): This then is the message which we have heard of him and declare unto you that God is light and in him is no darkness at all; if we say that we have fellowship with him and walk in darkness we lie and do not the truth; but if we walk in the light as he is in the light we have fellowship one with another and the blood of Jesus Christ his Son cleanseth us from all sin","Confession and Forgiveness (vv.8-10): If we say that we have no sin we deceive ourselves and the truth is not in us; if we confess our sins he is faithful and just to forgive us our sins and to cleanse us from all unrighteousness; if we say that we have not sinned we make him a liar and his word is not in us"]'
FROM books b WHERE b.name = '1 John';

-- Step 2: Insert all 10 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life;',
   'Ὃ ἦν ἀπ᾽ ἀρχῆς ὃ ἀκηκόαμεν ὃ ἑωράκαμεν τοῖς ὀφθαλμοῖς ἡμῶν ὃ ἐθεασάμεθα καὶ αἱ χεῖρες ἡμῶν ἐψηλάφησαν περὶ τοῦ λόγου τῆς ζωῆς',
   'Ho ēn ap'' archēs ho akēkoamen ho heōrakamen tois ophthalmois hēmōn ho etheasametha kai hai cheires hēmōn epsēlaphēsan peri tou logou tēs zōēs',
   '''From the beginning'' (ap'' archēs — from the origin, from the start; echoing John 1:1, ''In the beginning was the Word''). Four verbs of witness in escalating intimacy: (1) ''heard'' (akēkoamen — perfect tense: have heard and still hear), (2) ''seen with our eyes'' (heōrakamen tois ophthalmois — seen with physical eyes, not mystical vision), (3) ''looked upon'' (etheasametha — gazed at deliberately, studied intently; from theaomai, to behold as a spectacle), (4) ''handled'' (epsēlaphēsan — touched, groped, felt with the hands; the same word used of the risen Christ in Luke 24:39). ''Word of life'' (logou tēs zōēs — the Word who is life, the living Word). John is countering early Gnostic docetism that denied Christ came in real flesh.',
   'The Incarnation: John''s four-fold sensory testimony — hearing, seeing, gazing, touching — is a devastating refutation of any teaching that denies the physical reality of Christ. The eternal Word (who ''was from the beginning'') became tangible flesh. Christianity is not built on philosophy or mysticism but on the historical, physical reality of God made man.'),
  (2,
   '(For the life was manifested, and we have seen it, and bear witness, and shew unto you that eternal life, which was with the Father, and was manifested unto us;)',
   'καὶ ἡ ζωὴ ἐφανερώθη καὶ ἑωράκαμεν καὶ μαρτυροῦμεν καὶ ἀπαγγέλλομεν ὑμῖν τὴν ζωὴν τὴν αἰώνιον ἥτις ἦν πρὸς τὸν πατέρα καὶ ἐφανερώθη ἡμῖν',
   'kai hē zōē ephanerōthē kai heōrakamen kai martyroumen kai apangellomen hymin tēn zōēn tēn aiōnion hētis ēn pros ton patera kai ephanerōthē hēmin',
   '''Manifested'' (ephanerōthē — was made visible, was revealed; from phaneroō, to make apparent). ''Eternal life'' (tēn zōēn tēn aiōnion — the life, the eternal one). Eternal life is not an abstract concept but a Person: it ''was with the Father'' (ēn pros ton patera — was face-to-face with the Father; the identical construction as John 1:1, ''the Word was with God''). ''Bear witness'' (martyroumen — we testify, we give martyr-witness). John''s proclamation is not secondhand tradition but firsthand testimony of the eternal life that became visible in human flesh.',
   NULL),
  (3,
   'That which we have seen and heard declare we unto you, that ye also may have fellowship with us: and truly our fellowship is with the Father, and with his Son Jesus Christ.',
   'ὃ ἑωράκαμεν καὶ ἀκηκόαμεν ἀπαγγέλλομεν ὑμῖν ἵνα καὶ ὑμεῖς κοινωνίαν ἔχητε μεθ᾽ ἡμῶν καὶ ἡ κοινωνία δὲ ἡ ἡμετέρα μετὰ τοῦ πατρὸς καὶ μετὰ τοῦ υἱοῦ αὐτοῦ Ἰησοῦ Χριστοῦ',
   'ho heōrakamen kai akēkoamen apangellomen hymin hina kai hymeis koinōnian echēte meth'' hēmōn kai hē koinōnia de hē hēmetera meta tou patros kai meta tou huiou autou Iēsou Christou',
   '''Declare'' (apangellomen — we announce, we report). ''Fellowship'' (koinōnian — partnership, shared participation; from koinos, common). Three levels of fellowship: (1) believers with the apostles, (2) the apostles with the Father, (3) the apostles with the Son. Fellowship with the apostles is fellowship with God Himself, because the apostles'' fellowship is with the Father and Son. This chain of fellowship is what connects every generation of believers to the living God.',
   'Fellowship with God: The purpose of apostolic testimony is not merely to inform but to incorporate — to bring hearers into the same fellowship the apostles enjoy with the Father and Son. Christian fellowship is vertical before it is horizontal: we have fellowship with one another because we share fellowship with God. The Son is placed alongside the Father as an equal object of fellowship — an implicit claim to Christ''s deity.'),
  (4,
   'And these things write we unto you, that your joy may be full.',
   'καὶ ταῦτα γράφομεν ὑμῖν ἵνα ἡ χαρὰ ὑμῶν ᾖ πεπληρωμένη',
   'kai tauta graphomen hymin hina hē chara hymōn ē peplērōmenē',
   '''Joy'' (chara — delight, gladness). ''Full'' (peplērōmenē — having been filled to completion; perfect passive participle: filled and remaining full). John echoes Jesus''s words in John 15:11 and 16:24. The purpose of this epistle is joy — not superficial happiness but the deep, settled gladness that comes from knowing that fellowship with God is real, secure, and eternal. Truth produces joy.',
   NULL),
  (5,
   'This then is the message which we have heard of him, and declare unto you, that God is light, and in him is no darkness at all.',
   'Καὶ αὕτη ἐστὶν ἡ ἀγγελία ἣν ἀκηκόαμεν ἀπ᾽ αὐτοῦ καὶ ἀναγγέλλομεν ὑμῖν ὅτι ὁ θεὸς φῶς ἐστιν καὶ σκοτία ἐν αὐτῷ οὐκ ἔστιν οὐδεμία',
   'Kai hautē estin hē angelia hēn akēkoamen ap'' autou kai anangellomen hymin hoti ho theos phōs estin kai skotia en autō ouk estin oudemia',
   '''Message'' (angelia — announcement, the report; used only here and 3:11 in the NT). ''God is light'' (ho theos phōs estin — God is light; no article before phōs: light is His very nature, not just an attribute). ''No darkness at all'' (skotia en autō ouk estin oudemia — darkness in Him there is not even one bit; a double negative for absolute emphasis). Light represents holiness, truth, purity, and knowledge; darkness represents sin, falsehood, impurity, and ignorance. This is the foundational proposition of the epistle: everything that follows is built on the absolute moral purity of God.',
   'God is light: This is one of three great ''God is'' declarations in John''s writings (God is light, 1:5; God is spirit, John 4:24; God is love, 4:8). Light is not merely something God produces — it is what He is. The absolute absence of darkness means there is no shadow of sin, deception, or moral compromise in God. This truth becomes the test for all claims of fellowship: to walk with a God who is pure light, one must walk in the light.'),
  (6,
   'If we say that we have fellowship with him, and walk in darkness, we lie, and do not the truth:',
   'ἐὰν εἴπωμεν ὅτι κοινωνίαν ἔχομεν μετ᾽ αὐτοῦ καὶ ἐν τῷ σκότει περιπατῶμεν ψευδόμεθα καὶ οὐ ποιοῦμεν τὴν ἀλήθειαν',
   'ean eipōmen hoti koinōnian echomen met'' autou kai en tō skotei peripatōmen pseudometha kai ou poioumen tēn alētheian',
   '''If we say'' (ean eipōmen — the first of three ''if we say'' tests in this chapter: vv.6, 8, 10). ''Walk in darkness'' (en tō skotei peripatōmen — conduct our lives in the realm of darkness, habitually living in sin). ''Lie'' (pseudometha — we speak falsely, our claim is a lie). ''Do not the truth'' (ou poioumen tēn alētheian — we do not practise the truth; truth in John is not merely believed but done). The first false claim: claiming fellowship with God while living in habitual sin. Words and walk must match.',
   NULL),
  (7,
   'But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Jesus Christ his Son cleanseth us from all sin.',
   'ἐὰν δὲ ἐν τῷ φωτὶ περιπατῶμεν ὡς αὐτός ἐστιν ἐν τῷ φωτί κοινωνίαν ἔχομεν μετ᾽ ἀλλήλων καὶ τὸ αἷμα Ἰησοῦ Χριστοῦ τοῦ υἱοῦ αὐτοῦ καθαρίζει ἡμᾶς ἀπὸ πάσης ἁμαρτίας',
   'ean de en tō phōti peripatōmen hōs autos estin en tō phōti koinōnian echomen met'' allēlōn kai to haima Iēsou Christou tou huiou autou katharizei hēmas apo pasēs hamartias',
   '''Walk in the light'' (en tō phōti peripatōmen — conduct our lives in the sphere of light; not sinless perfection but a life oriented toward God''s truth and holiness). ''As he is in the light'' — the standard is God Himself. ''Fellowship one with another'' (koinōnian met'' allēlōn — shared life with each other). Walking in the light produces both vertical fellowship (with God) and horizontal fellowship (with believers). ''The blood of Jesus Christ his Son cleanseth us'' (to haima Iēsou Christou katharizei hēmas — the blood keeps on cleansing; present tense: continuous, ongoing purification). ''From all sin'' (apo pasēs hamartias — from every sin, without exception).',
   'The blood of Christ: Walking in the light does not mean sinless living — it means living in honesty before God. Those who walk in the light still need cleansing, and the blood of Christ provides it continuously (present tense katharizei). The blood''s cleansing power is comprehensive (''all sin'') and ongoing. This is not a one-time event but a perpetual provision for believers who walk in transparency before God.'),
  (8,
   'If we say that we have no sin, we deceive ourselves, and the truth is not in us.',
   'ἐὰν εἴπωμεν ὅτι ἁμαρτίαν οὐκ ἔχομεν ἑαυτοὺς πλανῶμεν καὶ ἡ ἀλήθεια οὐκ ἔστιν ἐν ἡμῖν',
   'ean eipōmen hoti hamartian ouk echomen heautous planōmen kai hē alētheia ouk estin en hēmin',
   '''Have no sin'' (hamartian ouk echomen — do not possess sin, do not have a sin nature). The second ''if we say'' test. ''Deceive ourselves'' (heautous planōmen — we lead ourselves astray; from planaō, to wander, to err). ''The truth is not in us'' (hē alētheia ouk estin en hēmin). This addresses the claim of sinless perfection or the Gnostic claim that the enlightened are above sin. To deny the presence of indwelling sin is self-deception, not spiritual maturity. Honest self-assessment, not self-delusion, characterises the one who walks in light.',
   NULL),
  (9,
   'If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.',
   'ἐὰν ὁμολογῶμεν τὰς ἁμαρτίας ἡμῶν πιστός ἐστιν καὶ δίκαιος ἵνα ἀφῇ ἡμῖν τὰς ἁμαρτίας καὶ καθαρίσῃ ἡμᾶς ἀπὸ πάσης ἀδικίας',
   'ean homologōmen tas hamartias hēmōn pistos estin kai dikaios hina aphē hēmin tas hamartias kai katharisē hēmas apo pasēs adikias',
   '''Confess'' (homologōmen — agree, say the same thing; from homos + legō: to say the same thing God says about our sin; present tense: as a habit of life). ''Faithful'' (pistos — trustworthy, reliable; God''s character guarantees His response). ''Just'' (dikaios — righteous; God''s forgiveness is not a bypassing of justice but a fulfilment of it through Christ''s atonement). ''Forgive'' (aphē — let go, release, send away). ''Cleanse'' (katharisē — purify, make clean). Two actions: forgiveness (the guilt removed) and cleansing (the stain removed). ''All unrighteousness'' (pasēs adikias — every form of unrighteousness). The promise is comprehensive.',
   'Confession and forgiveness: This verse is the believer''s charter of ongoing forgiveness. Confession (homologeō) means agreeing with God''s verdict about sin — calling it what He calls it. God responds with two attributes: faithfulness (to His promise) and justice (because Christ''s blood has satisfied the penalty). Forgiveness is not merely mercy ignoring sin but justice acknowledging that the debt has been paid by Christ. The result is both judicial (forgiveness of sins) and experiential (cleansing from unrighteousness).'),
  (10,
   'If we say that we have not sinned, we make him a liar, and his word is not in us.',
   'ἐὰν εἴπωμεν ὅτι οὐχ ἡμαρτήκαμεν ψεύστην ποιοῦμεν αὐτὸν καὶ ὁ λόγος αὐτοῦ οὐκ ἔστιν ἐν ἡμῖν',
   'ean eipōmen hoti ouch hēmartēkamen pseustēn poioumen auton kai ho logos autou ouk estin en hēmin',
   '''Have not sinned'' (ouch hēmartēkamen — perfect tense: have not sinned at any time in the past, with the result that we are now sin-free). The third ''if we say'' test — the most serious. ''Make him a liar'' (pseustēn poioumen auton — we make God a liar). To deny having sinned contradicts God''s own testimony that ''all have sinned'' (Rom 3:23). ''His word is not in us'' (ho logos autou ouk estin en hēmin — His word has no place in us). The progression of the three tests escalates: v.6, we lie; v.8, we deceive ourselves; v.10, we make God a liar. Each denial is more severe than the last.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 John' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1 (Word of life / handled)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐψηλάφησαν', 'epsēlaphēsan', 'G5584', 'Handled, touched, groped — to feel with the hands, to touch and verify by physical contact. Used of the risen Christ inviting Thomas and the disciples to touch Him (Luke 24:39). Proof of bodily reality against docetic denial.', 1),
  ('λόγου', 'logou', 'G3056', 'Word — from legō (to speak). The divine Word, the self-expression of God. In John''s theology, the Logos is the eternal Son who was with God, was God, and became flesh (John 1:1,14). Here called ''the Word of life'' — the Word who is life and who gives life.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 3 (Fellowship)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κοινωνίαν', 'koinōnian', 'G2842', 'Fellowship, partnership, sharing — from koinos (common). Deep spiritual participation, not mere association. In the early church, koinōnia described the shared life of believers: common faith, common purpose, common resources (Acts 2:42).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 5 (God is light)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φῶς', 'phōs', 'G5457', 'Light — used without the article: God is light in His very nature. Light represents absolute holiness, purity, truth, and self-revelation. God does not merely emit light; He is light. Cf. John 8:12; James 1:17.', 1),
  ('σκοτία', 'skotia', 'G4653', 'Darkness — moral and spiritual darkness: sin, falsehood, ignorance, evil. The absolute denial (ouk estin oudemia — not even one trace) means there is zero moral darkness in God. No shadow, no compromise, no hidden fault.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 7 (Blood cleanseth)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('αἷμα', 'haima', 'G129', 'Blood — the blood of Christ, representing His atoning death. In Scripture, blood signifies life given in sacrifice (Lev 17:11). The blood of Jesus is the means of ongoing purification for believers who walk in the light.', 1),
  ('καθαρίζει', 'katharizei', 'G2511', 'Cleanseth, purifies — present tense: keeps on cleansing, continuously purifies. Not a single past-tense act but an ongoing reality. As we walk in the light and sin is exposed, the blood of Christ continually cleanses.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 9 (Confess / faithful and just)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁμολογῶμεν', 'homologōmen', 'G3670', 'Confess, agree, say the same thing — from homos (same) + legō (speak). To say the same thing about sin that God says. Not merely admitting wrongdoing but agreeing with God''s assessment. Present tense: a lifestyle of honest confession.', 1),
  ('πιστός', 'pistos', 'G4103', 'Faithful, trustworthy, reliable — God can be depended upon to keep His promise. His faithfulness is to His own covenant and to the finished work of Christ. Forgiveness is guaranteed by God''s character, not by the quality of our confession.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Word of life / from the beginning
  (1, 'John 1:1-3', 1), (1, 'John 1:14', 2), (1, 'Luke 24:39', 3),
  -- v2: Eternal life manifested
  (2, 'John 1:4', 1), (2, 'John 17:3', 2), (2, '1 Timothy 3:16', 3),
  -- v3: Fellowship with the Father and Son
  (3, 'Acts 2:42', 1), (3, '1 Corinthians 1:9', 2), (3, '2 Peter 1:4', 3),
  -- v5: God is light
  (5, 'John 8:12', 1), (5, 'James 1:17', 2), (5, '1 Timothy 6:16', 3),
  -- v7: Blood of Jesus cleanseth
  (7, 'Hebrews 9:14', 1), (7, '1 Peter 1:18-19', 2), (7, 'Revelation 1:5', 3),
  -- v8: If we say we have no sin
  (8, 'Romans 3:23', 1), (8, 'Ecclesiastes 7:20', 2), (8, 'Proverbs 20:9', 3),
  -- v9: Confess our sins
  (9, 'Psalm 32:5', 1), (9, 'Proverbs 28:13', 2), (9, '2 Samuel 12:13', 3),
  -- v10: Have not sinned / make God a liar
  (10, 'Romans 3:4', 1), (10, '1 Kings 8:46', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 John' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 John Chapter 1 Complete
-- 10 verses · 5 key verses with word studies (9 words)
-- Cross-references for 8 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
