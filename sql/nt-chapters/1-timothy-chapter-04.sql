-- ═══════════════════════════════════════════════════
-- 1 TIMOTHY CHAPTER 4 — Apostasy Warning and Timothy's Personal Charge
-- 16 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  '1 Timothy 4 opens with a prophetic warning about apostasy and closes with an intimate charge to Timothy personally. ''The Spirit speaketh expressly, that in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils'' (v.1). These false teachers forbid marriage and command abstinence from meats — things God created ''to be received with thanksgiving'' (vv.3-4). Against this ascetic legalism, Paul affirms that ''every creature of God is good, and nothing to be refused, if it be received with thanksgiving: for it is sanctified by the word of God and prayer'' (vv.4-5). Timothy is to be ''a good minister of Jesus Christ, nourished up in the words of faith and of good doctrine'' (v.6). The famous command follows: ''exercise thyself rather unto godliness. For bodily exercise profiteth little: but godliness is profitable unto all things, having promise of the life that now is, and of that which is to come'' (vv.7-8). This is the third ''faithful saying'' (v.9). Paul then gives Timothy a series of personal charges: ''Let no man despise thy youth; but be thou an example of the believers, in word, in conversation, in charity, in spirit, in faith, in purity'' (v.12). ''Give attendance to reading, to exhortation, to doctrine'' (v.13). ''Neglect not the gift that is in thee, which was given thee by prophecy, with the laying on of the hands of the presbytery'' (v.14). ''Take heed unto thyself, and unto the doctrine; continue in them: for in doing this thou shalt both save thyself, and them that hear thee'' (v.16).',
  'Guard Against Apostasy — Exercise Unto Godliness',
  'γυμνασία (gymnasia)',
  'Exercise, training, discipline — from gymnazō (to train, to exercise; the root of ''gymnasium''). Used here in contrast with physical training: spiritual training (godliness) has value for both this life and the next. The Christian life requires deliberate, disciplined effort — not to earn salvation but to grow in godliness.',
  '["Warning Against Apostasy (vv.1-5): Now the Spirit speaketh expressly that in the latter times some shall depart from the faith giving heed to seducing spirits and doctrines of devils; speaking lies in hypocrisy having their conscience seared with a hot iron; forbidding to marry and commanding to abstain from meats which God hath created to be received with thanksgiving; for every creature of God is good and nothing to be refused if it be received with thanksgiving for it is sanctified by the word of God and prayer","A Good Minister of Jesus Christ (vv.6-10): If thou put the brethren in remembrance of these things thou shalt be a good minister of Jesus Christ nourished up in the words of faith and of good doctrine; but refuse profane and old wives'' fables and exercise thyself rather unto godliness; for bodily exercise profiteth little but godliness is profitable unto all things having promise of the life that now is and of that which is to come; this is a faithful saying and worthy of all acceptation; for therefore we both labour and suffer reproach because we trust in the living God who is the Saviour of all men specially of those that believe","Timothy''s Personal Charge (vv.11-16): These things command and teach; let no man despise thy youth but be thou an example of the believers in word in conversation in charity in spirit in faith in purity; till I come give attendance to reading to exhortation to doctrine; neglect not the gift that is in thee which was given thee by prophecy with the laying on of the hands of the presbytery; meditate upon these things give thyself wholly to them that thy profiting may appear to all; take heed unto thyself and unto the doctrine continue in them for in doing this thou shalt both save thyself and them that hear thee"]'
FROM books b WHERE b.name = '1 Timothy';

-- Step 2: Insert all 16 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now the Spirit speaketh expressly, that in the latter times some shall depart from the faith, giving heed to seducing spirits, and doctrines of devils;',
   'Τὸ δὲ πνεῦμα ῥητῶς λέγει ὅτι ἐν ὑστέροις καιροῖς ἀποστήσονταί τινες τῆς πίστεως προσέχοντες πνεύμασιν πλάνοις καὶ διδασκαλίαις δαιμονίων',
   'To de pneuma rhētōs legei hoti en hysterois kairois apostēsontai tines tēs pisteōs prosechontes pneumasin planois kai didaskaliais daimoniōn',
   '''The Spirit speaketh expressly'' (to pneuma rhētōs legei — the Holy Spirit says in explicit, unmistakable terms). ''Latter times'' (hysterois kairois — later seasons; the period between Christ''s first and second comings). ''Depart from the faith'' (apostēsontai tēs pisteōs — will stand away from the faith; the root of ''apostasy''). ''Seducing spirits'' (pneumasin planois — deceiving spirits, wandering spirits). ''Doctrines of devils'' (didaskaliais daimoniōn — teachings that originate from demons). Behind false teaching lies demonic influence: the battle for sound doctrine is ultimately spiritual warfare.',
   'Apostasy in the latter times: This prophecy warns that some who profess faith will abandon it. The departure is not intellectual doubt but spiritual seduction — they give heed to deceiving spirits and demonic doctrines. The specific false teaching (vv.3-5) is ascetic legalism that contradicts God''s good creation. This warns that false doctrine can come in pious, self-denying garb — it need not look immoral to be demonic.'),
  (2, 'Speaking lies in hypocrisy; having their conscience seared with a hot iron;',
   'ἐν ὑποκρίσει ψευδολόγων κεκαυτηριασμένων τὴν ἰδίαν συνείδησιν',
   'en hypokrisei pseudologōn kekaustēriasmenōn tēn idian syneidēsin',
   '''Speaking lies in hypocrisy'' (en hypokrisei pseudologōn — through the hypocrisy of liars; they appear godly while teaching falsehood). ''Conscience seared'' (kekaustēriasmenōn tēn syneidēsin — branded/cauterised in their own conscience; perfect participle: permanently scarred). A seared conscience has lost its sensitivity to right and wrong — like nerve endings destroyed by a hot iron. These teachers can lie without feeling guilt.',
   NULL),
  (3, 'Forbidding to marry, and commanding to abstain from meats, which God hath created to be received with thanksgiving of them which believe and know the truth.',
   'κωλυόντων γαμεῖν ἀπέχεσθαι βρωμάτων ἃ ὁ θεὸς ἔκτισεν εἰς μετάληψιν μετὰ εὐχαριστίας τοῖς πιστοῖς καὶ ἐπεγνωκόσιν τὴν ἀλήθειαν',
   'kōlyontōn gamein apechesthai brōmatōn ha ho theos ektisen eis metalēpsin meta eucharistias tois pistois kai epegnōkosin tēn alētheian',
   '''Forbidding to marry'' (kōlyontōn gamein — prohibiting marriage). ''Commanding to abstain from meats'' (apechesthai brōmatōn — requiring food restrictions). These are the specific doctrines of demons: ascetic practices that deny the goodness of God''s creation. ''God hath created'' (ho theos ektisen) — the appeal is to creation theology: what God made good, humans must not declare evil. ''With thanksgiving'' (meta eucharistias — the proper response to God''s gifts).',
   NULL),
  (4, 'For every creature of God is good, and nothing to be refused, if it be received with thanksgiving:',
   'ὅτι πᾶν κτίσμα θεοῦ καλόν καὶ οὐδὲν ἀπόβλητον μετὰ εὐχαριστίας λαμβανόμενον',
   'hoti pan ktisma theou kalon kai ouden apoblēton meta eucharistias lambanomenon',
   '''Every creature of God is good'' (pan ktisma theou kalon — echoing Genesis 1:31: ''God saw every thing that he had made, and, behold, it was very good''). ''Nothing to be refused'' (ouden apoblēton — nothing to be thrown away, nothing to be rejected). ''Received with thanksgiving'' (meta eucharistias lambanomenon — the qualifying condition: gratitude to the Creator sanctifies the use of creation). This verse is a foundational statement of creation theology: matter is not evil; God''s creation is inherently good.',
   NULL),
  (5, 'For it is sanctified by the word of God and prayer.',
   'ἁγιάζεται γὰρ διὰ λόγου θεοῦ καὶ ἐντεύξεως',
   'hagiazetai gar dia logou theou kai enteuxeōs',
   '''Sanctified'' (hagiazetai — set apart for proper use, made holy). ''By the word of God'' (dia logou theou — through God''s word; God''s declaration that creation is good, Gen 1). ''And prayer'' (kai enteuxeōs — and thanksgiving prayer; the grace said before meals). Two things sanctify food: God''s word (his creative declaration of goodness) and the believer''s prayer (thanksgiving that acknowledges the Creator). Together they transform ordinary eating into an act of worship.',
   NULL),
  (6, 'If thou put the brethren in remembrance of these things, thou shalt be a good minister of Jesus Christ, nourished up in the words of faith and of good doctrine, whereunto thou hast attained.',
   'Ταῦτα ὑποτιθέμενος τοῖς ἀδελφοῖς καλὸς ἔσῃ διάκονος Χριστοῦ Ἰησοῦ ἐντρεφόμενος τοῖς λόγοις τῆς πίστεως καὶ τῆς καλῆς διδασκαλίας ᾗ παρηκολούθηκας',
   'Tauta hypotithemenos tois adelphois kalos esē diakonos Christou Iēsou entrephomenos tois logois tēs pisteōs kai tēs kalēs didaskalias hē parēkolouthēkas',
   '''Good minister'' (kalos diakonos — a noble servant, an excellent minister). ''Nourished up'' (entrephomenos — feeding on, nourishing yourself in; present participle: continuously nourishing). ''Words of faith and of good doctrine'' (logois tēs pisteōs kai tēs kalēs didaskalias — the twin sources of spiritual nutrition: the faith and sound teaching). ''Whereunto thou hast attained'' (hē parēkolouthēkas — which you have closely followed, carefully traced). A good minister feeds himself before feeding others.',
   NULL),
  (7, 'But refuse profane and old wives'' fables, and exercise thyself rather unto godliness.',
   'τοὺς δὲ βεβήλους καὶ γραώδεις μύθους παραιτοῦ γύμναζε δὲ σεαυτὸν πρὸς εὐσέβειαν',
   'tous de bebēlous kai graōdeis mythous paraitou gymnaze de seauton pros eusebeian',
   '''Refuse'' (paraitou — reject, decline, have nothing to do with). ''Profane'' (bebēlous — unhallowed, common, irreverent). ''Old wives'' fables'' (graōdeis mythous — tales fit for old women; superstitious nonsense). ''Exercise'' (gymnaze — train, work out; the gymnasium metaphor). ''Unto godliness'' (pros eusebeian — toward piety, devotion). The contrast: refuse spiritual junk food; train in spiritual fitness. Godliness requires the same deliberate, disciplined effort as athletic training.',
   NULL),
  (8, 'For bodily exercise profiteth little: but godliness is profitable unto all things, having promise of the life that now is, and of that which is to come.',
   'ἡ γὰρ σωματικὴ γυμνασία πρὸς ὀλίγον ἐστὶν ὠφέλιμος ἡ δὲ εὐσέβεια πρὸς πάντα ὠφέλιμός ἐστιν ἐπαγγελίαν ἔχουσα ζωῆς τῆς νῦν καὶ τῆς μελλούσης',
   'hē gar sōmatikē gymnasia pros oligon estin ōphelimos hē de eusebeia pros panta ōphelimos estin epangelian echousa zōēs tēs nyn kai tēs mellousēs',
   '''Bodily exercise'' (sōmatikē gymnasia — physical training). ''Profiteth little'' (pros oligon ōphelimos — useful for a little, profitable for a limited time and scope). ''Godliness is profitable unto all things'' (eusebeia pros panta ōphelimos — useful for everything, beneficial in every area). ''Promise of the life that now is, and of that which is to come'' — godliness has both present and eternal benefits. Physical fitness benefits the body temporarily; spiritual fitness benefits everything eternally.',
   'Godliness: profitable for all things: Paul does not dismiss physical exercise (it has some value) but puts it in perspective. Godliness has unlimited value: it benefits the whole person (body, soul, spirit), in all circumstances (prosperity and adversity), for all time (this life and the life to come). The ''promise'' covers both present quality of life and future eternal life. Training in godliness is the best investment a person can make.'),
  (9, 'This is a faithful saying and worthy of all acceptation.',
   'πιστὸς ὁ λόγος καὶ πάσης ἀποδοχῆς ἄξιος',
   'pistos ho logos kai pasēs apodochēs axios',
   '''Faithful saying'' (pistos ho logos — the third of five ''faithful sayings'' in the Pastoral Epistles). ''Worthy of all acceptation'' (pasēs apodochēs axios — deserving of complete acceptance). This formula certifies the preceding statement (v.8) as established, reliable truth — a creedal declaration that the church can stake its life on.',
   NULL),
  (10, 'For therefore we both labour and suffer reproach, because we trust in the living God, who is the Saviour of all men, specially of those that believe.',
   'εἰς τοῦτο γὰρ καὶ κοπιῶμεν καὶ ὀνειδιζόμεθα ὅτι ἠλπίκαμεν ἐπὶ θεῷ ζῶντι ὅς ἐστιν σωτὴρ πάντων ἀνθρώπων μάλιστα πιστῶν',
   'eis touto gar kai kopiōmen kai oneidizometha hoti ēlpikamen epi theō zōnti hos estin sōtēr pantōn anthrōpōn malista pistōn',
   '''Labour'' (kopiōmen — toil to the point of exhaustion). ''Suffer reproach'' (oneidizometha — are reviled, are insulted). ''Trust in the living God'' (ēlpikamen epi theō zōnti — we have set our hope on the living God). ''Saviour of all men, specially of those that believe'' (sōtēr pantōn anthrōpōn malista pistōn) — God is saviour of all in the sense that he preserves all life and offers salvation to all; but he is saviour ''specially'' (malista) of believers — those who actually receive the salvation offered. The provision is universal; the application is particular.',
   NULL),
  (11, 'These things command and teach.',
   'παράγγελλε ταῦτα καὶ δίδασκε',
   'parangelle tauta kai didaske',
   '''Command'' (parangelle — give orders, charge authoritatively). ''Teach'' (didaske — instruct, educate). Two aspects of Timothy''s ministry: authoritative proclamation and patient instruction. Both are necessary: commanding establishes the standard; teaching explains and applies it.',
   NULL),
  (12, 'Let no man despise thy youth; but be thou an example of the believers, in word, in conversation, in charity, in spirit, in faith, in purity.',
   'μηδείς σου τῆς νεότητος καταφρονείτω ἀλλὰ τύπος γίνου τῶν πιστῶν ἐν λόγῳ ἐν ἀναστροφῇ ἐν ἀγάπῃ ἐν πνεύματι ἐν πίστει ἐν ἁγνείᾳ',
   'mēdeis sou tēs neotētos kataphroneitō alla typos ginou tōn pistōn en logō en anastrophē en agapē en pneumati en pistei en hagneia',
   '''Despise thy youth'' (tēs neotētos kataphroneitō — look down on your youngness; Timothy was probably in his mid-30s, young for a church leader in that culture). ''Example'' (typos — pattern, model, stamp; the impression left by a die in soft metal). ''Of the believers'' (tōn pistōn — to the believers; Timothy is to be the pattern they follow). Six areas of exemplary conduct: (1) word, (2) conversation/conduct, (3) charity/love, (4) spirit, (5) faith, (6) purity. The answer to age-related criticism is not assertion of authority but demonstration of character.',
   NULL),
  (13, 'Till I come, give attendance to reading, to exhortation, to doctrine.',
   'ἕως ἔρχομαι πρόσεχε τῇ ἀναγνώσει τῇ παρακλήσει τῇ διδασκαλίᾳ',
   'heōs erchomai proseche tē anagnōsei tē paraklēsei tē didaskalia',
   '''Give attendance'' (proseche — devote yourself to, pay close attention to). ''Reading'' (anagnōsei — the public reading of Scripture in the assembly; the OT was read aloud in worship). ''Exhortation'' (paraklēsei — encouragement, application, the practical appeal that follows the reading). ''Doctrine'' (didaskalia — teaching, systematic instruction). Three elements of public ministry: read the Scripture, apply it practically, and teach it systematically. Timothy''s primary task is ministry of the word.',
   NULL),
  (14, 'Neglect not the gift that is in thee, which was given thee by prophecy, with the laying on of the hands of the presbytery.',
   'μὴ ἀμέλει τοῦ ἐν σοὶ χαρίσματος ὃ ἐδόθη σοι διὰ προφητείας μετὰ ἐπιθέσεως τῶν χειρῶν τοῦ πρεσβυτερίου',
   'mē amelei tou en soi charismatos ho edothē soi dia prophēteias meta epitheseōs tōn cheirōn tou presbyteriou',
   '''Neglect not'' (mē amelei — do not be careless about, do not disregard). ''Gift'' (charismatos — a grace-gift, a spiritual endowment for ministry). ''By prophecy'' (dia prophēteias — through a prophetic utterance that identified the gift). ''Laying on of the hands of the presbytery'' (epitheseōs tōn cheirōn tou presbyteriou — the ordination ceremony in which the council of elders confirmed Timothy''s calling). The gift was given by God (through prophecy) and recognised by the church (through ordination). Timothy must actively cultivate what God has given.',
   NULL),
  (15, 'Meditate upon these things; give thyself wholly to them; that thy profiting may appear to all.',
   'ταῦτα μελέτα ἐν τούτοις ἴσθι ἵνα σου ἡ προκοπὴ φανερὰ ᾖ ἐν πᾶσιν',
   'tauta meleta en toutois isthi hina sou hē prokopē phanera ē en pasin',
   '''Meditate'' (meleta — practise, rehearse, be absorbed in; not merely mental reflection but active engagement and practice). ''Give thyself wholly to them'' (en toutois isthi — be in these things, immerse yourself in them completely). ''Profiting'' (prokopē — progress, advancement, growth). ''May appear to all'' (phanera ē en pasin — be evident to everyone). Timothy''s spiritual growth should be visible and undeniable. Ministry is not static but progressive — others should be able to see the growth.',
   NULL),
  (16, 'Take heed unto thyself, and unto the doctrine; continue in them: for in doing this thou shalt both save thyself, and them that hear thee.',
   'ἔπεχε σεαυτῷ καὶ τῇ διδασκαλίᾳ ἐπίμενε αὐτοῖς τοῦτο γὰρ ποιῶν καὶ σεαυτὸν σώσεις καὶ τοὺς ἀκούοντάς σου',
   'epeche seautō kai tē didaskalia epimene autois touto gar poiōn kai seauton sōseis kai tous akouontas sou',
   '''Take heed'' (epeche — hold to, pay attention to, watch closely). ''Unto thyself'' (seautō — your own life, character, walk). ''Unto the doctrine'' (tē didaskalia — the teaching, the body of truth). ''Continue'' (epimene — persist, remain in, stick with). ''Save thyself, and them that hear thee'' (seauton sōseis kai tous akouontas sou — save in the sense of persevering in salvation and leading others safely through). Two objects of vigilance: personal character and doctrinal fidelity. Both must be guarded — neglecting either endangers both the minister and the congregation.',
   'Life and doctrine: This verse is the minister''s supreme mandate. Two things demand equal attention: personal godliness (''thyself'') and doctrinal faithfulness (''the doctrine''). Character without doctrine produces warm but directionless leadership. Doctrine without character produces cold but correct orthodoxy. Both together — a holy life teaching sound doctrine — saves both the teacher and the taught.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Timothy' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 1 (Apostasy)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀποστήσονται', 'apostēsontai', 'G868', 'Shall depart, shall stand away from, shall fall away — from aphistēmi (to stand apart, to withdraw). The root of ''apostasy.'' These are people who once professed the faith but now stand apart from it. The departure is not accidental but deliberate — they give heed to deceiving spirits.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 4 AND v.verse_number = 1;

-- Verse 7-8 (Exercise unto godliness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γύμναζε', 'gymnaze', 'G1128', 'Exercise, train, discipline — from gymnos (naked; Greek athletes trained unclothed). The verb means to train rigorously, as an athlete prepares for competition. Applied to spiritual life: godliness requires the same deliberate, sustained, disciplined effort as athletic training. The root of ''gymnasium'' and ''gymnastics.''', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 4 AND v.verse_number = 7;

-- Verse 12 (Example of the believers)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τύπος', 'typos', 'G5179', 'Example, pattern, model — from typtō (to strike). Originally the mark left by a blow, then the impression stamped by a die in soft metal. Timothy is to be the die that stamps its character on the believers. A leader leads first by example, then by instruction. Six areas define the pattern: speech, conduct, love, spirit, faith, and purity.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 4 AND v.verse_number = 12;

-- Verse 14 (The gift / laying on of hands)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χαρίσματος', 'charismatos', 'G5486', 'Gift, grace-gift — from charis (grace). A spiritual endowment freely given by God for the purpose of ministry. Timothy''s charisma was identified through prophecy and confirmed through ordination. It must be actively cultivated (''neglect not'') — gifts can be dormant if not exercised.', 1),
  ('πρεσβυτερίου', 'presbyteriou', 'G4244', 'Presbytery, council of elders — from presbyteros (elder). The collective body of elders who laid hands on Timothy at his ordination. The laying on of hands was the visible act of recognition and commissioning — the church''s corporate affirmation of God''s calling.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 4 AND v.verse_number = 14;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Depart from the faith
  (1, '2 Timothy 3:1-5', 1), (1, '2 Thessalonians 2:3', 2), (1, '2 Peter 2:1', 3),
  -- v2: Conscience seared
  (2, 'Ephesians 4:19', 1), (2, 'Titus 1:15', 2),
  -- v4: Every creature of God is good
  (4, 'Genesis 1:31', 1), (4, 'Acts 10:15', 2), (4, 'Romans 14:14', 3),
  -- v7: Exercise unto godliness
  (7, '1 Corinthians 9:24-27', 1), (7, 'Hebrews 5:14', 2),
  -- v8: Godliness profitable
  (8, 'Matthew 6:33', 1), (8, '1 Timothy 6:6', 2),
  -- v10: Saviour of all men
  (10, '1 Timothy 2:4', 1), (10, 'Titus 2:11', 2),
  -- v12: Example of believers
  (12, 'Titus 2:7-8', 1), (12, '1 Peter 5:3', 2), (12, 'Philippians 3:17', 3),
  -- v13: Reading, exhortation, doctrine
  (13, 'Nehemiah 8:8', 1), (13, '2 Timothy 4:2', 2),
  -- v14: Gift by prophecy and laying on of hands
  (14, '2 Timothy 1:6', 1), (14, 'Acts 13:2-3', 2),
  -- v16: Take heed to thyself and doctrine
  (16, 'Acts 20:28', 1), (16, '2 Timothy 2:15', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Timothy Chapter 4 Complete
-- 16 verses · 4 key verses with word studies (6 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
