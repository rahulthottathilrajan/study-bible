-- ═══════════════════════════════════════════════════
-- 1 TIMOTHY CHAPTER 3 — Overseers, Deacons, and the Mystery of Godliness
-- 16 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '1 Timothy 3 provides the qualifications for church leaders and concludes with one of the great Christological confessions of the early church. Paul introduces the office of overseer: ''This is a true saying, If a man desire the office of a bishop, he desireth a good work'' (v.1). The qualifications follow: ''blameless, the husband of one wife, vigilant, sober, of good behaviour, given to hospitality, apt to teach; not given to wine, no striker, not greedy of filthy lucre; but patient, not a brawler, not covetous'' (vv.2-3). He must manage his household well (vv.4-5) and have ''a good report of them which are without'' (v.7). Deacons must likewise be ''grave, not doubletongued, not given to much wine, not greedy of filthy lucre; holding the mystery of the faith in a pure conscience'' (vv.8-9). Their wives (or deaconesses) must be ''grave, not slanderers, sober, faithful in all things'' (v.11). The chapter culminates in Paul''s purpose statement: ''that thou mayest know how thou oughtest to behave thyself in the house of God, which is the church of the living God, the pillar and ground of the truth'' (v.15). The final verse is a magnificent creedal hymn: ''And without controversy great is the mystery of godliness: God was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory'' (v.16).',
  'Qualifications for Leaders — The Mystery of Godliness',
  'εὐσέβεια (eusebeia)',
  'Godliness, piety, devout reverence — a key word in the Pastoral Epistles (1 Tim 2:2, 3:16, 4:7-8, 6:3, 5-6, 11; 2 Tim 3:5; Titus 1:1). The ''mystery of godliness'' (v.16) is the incarnation, life, death, resurrection, and exaltation of Christ — the foundation upon which all Christian piety rests.',
  '["Qualifications for Overseers (vv.1-7): This is a true saying if a man desire the office of a bishop he desireth a good work; a bishop then must be blameless the husband of one wife vigilant sober of good behaviour given to hospitality apt to teach; not given to wine no striker not greedy of filthy lucre but patient not a brawler not covetous; one that ruleth well his own house having his children in subjection; not a novice lest being lifted up with pride he fall into the condemnation of the devil; moreover he must have a good report of them which are without","Qualifications for Deacons (vv.8-13): Likewise must the deacons be grave not doubletongued not given to much wine not greedy of filthy lucre; holding the mystery of the faith in a pure conscience; and let these also first be proved; even so must their wives be grave not slanderers sober faithful in all things; let the deacons be the husbands of one wife ruling their children and their own houses well; for they that have used the office of a deacon well purchase to themselves a good degree and great boldness in the faith","The Church and the Mystery of Godliness (vv.14-16): These things write I unto thee hoping to come unto thee shortly; but if I tarry long that thou mayest know how thou oughtest to behave thyself in the house of God which is the church of the living God the pillar and ground of the truth; and without controversy great is the mystery of godliness God was manifest in the flesh justified in the Spirit seen of angels preached unto the Gentiles believed on in the world received up into glory"]'
FROM books b WHERE b.name = '1 Timothy';

-- Step 2: Insert all 16 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'This is a true saying, If a man desire the office of a bishop, he desireth a good work.',
   'πιστὸς ὁ λόγος εἴ τις ἐπισκοπῆς ὀρέγεται καλοῦ ἔργου ἐπιθυμεῖ',
   'pistos ho logos ei tis episkopēs oregetai kalou ergou epithymei',
   '''True saying'' (pistos ho logos — faithful saying; the second ''faithful saying'' in the Pastoral Epistles). ''Bishop'' (episkopēs — oversight, the office of overseer; episkopos means ''one who watches over''; the term is interchangeable with presbyteros/elder in the NT, Acts 20:17, 28; Titus 1:5, 7). ''Desireth'' (oregetai — reaches out for, aspires to, stretches toward). ''A good work'' (kalou ergou — a noble work, a beautiful task). Leadership in the church is not a position of privilege but a work of service — and aspiring to it is commendable.',
   NULL),
  (2, 'A bishop then must be blameless, the husband of one wife, vigilant, sober, of good behaviour, given to hospitality, apt to teach;',
   'δεῖ οὖν τὸν ἐπίσκοπον ἀνεπίληπτον εἶναι μιᾶς γυναικὸς ἄνδρα νηφάλιον σώφρονα κόσμιον φιλόξενον διδακτικόν',
   'dei oun ton episkopon anepilēpton einai mias gynaikos andra nēphalion sōphrona kosmion philoxenon didaktikon',
   '''Must'' (dei — it is necessary, it is essential). ''Blameless'' (anepilēpton — above reproach, not open to attack; not sinless but without scandalous behaviour). ''Husband of one wife'' (mias gynaikos andra — a one-woman man; interpreted variously as: prohibiting polygamy, prohibiting remarriage after divorce, or requiring marital faithfulness). ''Vigilant'' (nēphalion — temperate, clear-headed). ''Sober'' (sōphrona — self-controlled, sensible). ''Of good behaviour'' (kosmion — orderly, respectable). ''Given to hospitality'' (philoxenon — lover of strangers). ''Apt to teach'' (didaktikon — skilled in teaching; the one qualification that distinguishes overseers from deacons).',
   NULL),
  (3, 'Not given to wine, no striker, not greedy of filthy lucre; but patient, not a brawler, not covetous;',
   'μὴ πάροινον μὴ πλήκτην μὴ αἰσχροκερδῆ ἀλλ᾽ ἐπιεικῆ ἄμαχον ἀφιλάργυρον',
   'mē paroinon mē plēktēn mē aischrokerdē all'' epieikē amachon aphilargyron',
   '''Not given to wine'' (mē paroinon — not addicted to wine, not sitting beside wine). ''No striker'' (mē plēktēn — not violent, not quick with his fists). ''Not greedy of filthy lucre'' (mē aischrokerdē — not pursuing shameful gain). ''Patient'' (epieikē — gentle, yielding, reasonable, forbearing; one of the most beautiful Greek words — willing to yield one''s rights). ''Not a brawler'' (amachon — peaceable, not quarrelsome). ''Not covetous'' (aphilargyron — not a lover of money; a- + philos + argyros). The negatives paint what a leader must not be; the positive (epieikē) describes what he should be.',
   NULL),
  (4, 'One that ruleth well his own house, having his children in subjection with all gravity;',
   'τοῦ ἰδίου οἴκου καλῶς προϊστάμενον τέκνα ἔχοντα ἐν ὑποταγῇ μετὰ πάσης σεμνότητος',
   'tou idiou oikou kalōs proistamenon tekna echonta en hypotagē meta pasēs semnotētos',
   '''Ruleth'' (proistamenon — standing before, leading, managing; the word combines leadership and care). ''His own house'' (tou idiou oikou — his own household). ''In subjection'' (en hypotagē — in proper order, under authority). ''Gravity'' (semnotētos — dignity, seriousness, respectability). The household is the training ground for church leadership. How a man leads his family reveals how he will lead God''s family.',
   NULL),
  (5, '(For if a man know not how to rule his own house, how shall he take care of the church of God?)',
   'εἰ δέ τις τοῦ ἰδίου οἴκου προστῆναι οὐκ οἶδεν πῶς ἐκκλησίας θεοῦ ἐπιμελήσεται',
   'ei de tis tou idiou oikou prostēnai ouk oiden pōs ekklēsias theou epimelēsetai',
   '''Take care'' (epimelēsetai — give attention to, care for; the word used of the Good Samaritan caring for the wounded man, Luke 10:34-35). ''Church of God'' (ekklēsias theou — God''s assembly; the church belongs to God, not to its leaders). The logic is straightforward: the smaller responsibility (household) tests fitness for the larger responsibility (church). Leadership is stewardship, not ownership.',
   NULL),
  (6, 'Not a novice, lest being lifted up with pride he fall into the condemnation of the devil.',
   'μὴ νεόφυτον ἵνα μὴ τυφωθεὶς εἰς κρίμα ἐμπέσῃ τοῦ διαβόλου',
   'mē neophyton hina mē typhōtheis eis krima empesē tou diabolou',
   '''Novice'' (neophyton — newly planted, a recent convert; the source of ''neophyte''). ''Lifted up with pride'' (typhōtheis — beclouded, puffed up, blinded by conceit; from typhos, smoke; pride is a kind of mental fog). ''Condemnation of the devil'' (krima tou diabolou — the same judgment that the devil received for his pride). Premature elevation to leadership breeds the same arrogance that caused Satan''s fall. Maturity must precede authority.',
   NULL),
  (7, 'Moreover he must have a good report of them which are without; lest he fall into reproach and the snare of the devil.',
   'δεῖ δὲ αὐτὸν καὶ μαρτυρίαν καλὴν ἔχειν ἀπὸ τῶν ἔξωθεν ἵνα μὴ εἰς ὀνειδισμὸν ἐμπέσῃ καὶ παγίδα τοῦ διαβόλου',
   'dei de auton kai martyrian kalēn echein apo tōn exōthen hina mē eis oneidismon empesē kai pagida tou diabolou',
   '''Good report'' (martyrian kalēn — a fine testimony, a good reputation). ''Them which are without'' (tōn exōthen — outsiders, non-believers). ''Reproach'' (oneidismon — disgrace, shame that brings dishonour on Christ). ''Snare of the devil'' (pagida tou diabolou — a trap set by the devil). An elder''s reputation outside the church matters: a leader with a bad public reputation brings the gospel into disrepute and becomes vulnerable to the devil''s traps.',
   NULL),
  (8, 'Likewise must the deacons be grave, not doubletongued, not given to much wine, not greedy of filthy lucre;',
   'Διακόνους ὡσαύτως σεμνούς μὴ διλόγους μὴ οἴνῳ πολλῷ προσέχοντας μὴ αἰσχροκερδεῖς',
   'Diakonous hōsautōs semnous mē dilogous mē oinō pollō prosechontas mē aischrokerdeis',
   '''Deacons'' (diakonous — servants, ministers; from diakonos, one who serves). ''Grave'' (semnous — dignified, worthy of respect). ''Not doubletongued'' (mē dilogous — not saying one thing to one person and another to someone else; literally ''not double-worded''). ''Not given to much wine'' (mē oinō pollō prosechontas — not devoted to much wine). ''Not greedy'' (mē aischrokerdeis — not shamefully greedy). Deacons handle practical service, often including finances; hence the emphasis on integrity with money and speech.',
   NULL),
  (9, 'Holding the mystery of the faith in a pure conscience.',
   'ἔχοντας τὸ μυστήριον τῆς πίστεως ἐν καθαρᾷ συνειδήσει',
   'echontas to mystērion tēs pisteōs en kathara syneidēsei',
   '''Holding'' (echontas — possessing, maintaining). ''The mystery of the faith'' (to mystērion tēs pisteōs — the revealed content of Christian belief; the body of doctrine now disclosed). ''Pure conscience'' (kathara syneidēsei — a clean conscience, free from guilt). Deacons must combine doctrinal conviction with moral integrity. Belief and behaviour must align: holding truth in a clean vessel.',
   NULL),
  (10, 'And let these also first be proved; then let them use the office of a deacon, being found blameless.',
   'καὶ οὗτοι δὲ δοκιμαζέσθωσαν πρῶτον εἶτα διακονείτωσαν ἀνέγκλητοι ὄντες',
   'kai houtoi de dokimazesthōsan prōton eita diakoneitōsan anegklētoi ontes',
   '''Proved'' (dokimazesthōsan — let them be tested, examined, put to trial; the same testing-metal term as 1 Thess 5:21). ''First'' (prōton — before they serve). ''Blameless'' (anegklētoi — not accused, without charge against them). Deacons, like elders, must be tested before being given responsibility. The testing period ensures their character matches their calling.',
   NULL),
  (11, 'Even so must their wives be grave, not slanderers, sober, faithful in all things.',
   'γυναῖκας ὡσαύτως σεμνάς μὴ διαβόλους νηφαλίους πιστὰς ἐν πᾶσιν',
   'gynaikas hōsautōs semnas mē diabolous nēphalious pistas en pasin',
   '''Their wives'' (gynaikas — women; this could mean deacons'' wives or female deacons/deaconesses; the lack of a possessive pronoun ''their'' leaves it ambiguous). ''Grave'' (semnas — dignified, as for the deacons in v.8). ''Not slanderers'' (mē diabolous — not accusers, not gossiping; diabolos literally means ''devil,'' the slanderer par excellence). ''Sober'' (nēphalious — clear-headed). ''Faithful in all things'' (pistas en pasin — trustworthy in everything). Whether wives or deaconesses, these women must meet the same standard of dignity and faithfulness.',
   NULL),
  (12, 'Let the deacons be the husbands of one wife, ruling their children and their own houses well.',
   'διάκονοι ἔστωσαν μιᾶς γυναικὸς ἄνδρες τέκνων καλῶς προϊστάμενοι καὶ τῶν ἰδίων οἴκων',
   'diakonoi estōsan mias gynaikos andres teknōn kalōs proistamenoi kai tōn idiōn oikōn',
   '''Husbands of one wife'' (mias gynaikos andres — one-woman men; the same requirement as for overseers in v.2). ''Ruling their children and their own houses well'' (teknōn kalōs proistamenoi kai tōn idiōn oikōn — the household test applies to deacons as well). Deacons carry a parallel domestic requirement to overseers, confirming the high standard expected of all church leaders.',
   NULL),
  (13, 'For they that have used the office of a deacon well purchase to themselves a good degree, and great boldness in the faith which is in Christ Jesus.',
   'οἱ γὰρ καλῶς διακονήσαντες βαθμὸν ἑαυτοῖς καλὸν περιποιοῦνται καὶ πολλὴν παρρησίαν ἐν πίστει τῇ ἐν Χριστῷ Ἰησοῦ',
   'hoi gar kalōs diakonēsantes bathmon heautois kalon peripoiountai kai pollēn parrēsian en pistei tē en Christō Iēsou',
   '''Used the office well'' (kalōs diakonēsantes — having served well, having ministered nobly). ''Good degree'' (bathmon kalon — a good standing, a fine position; bathmos means a step, a rung on a ladder). ''Great boldness'' (pollēn parrēsian — much confidence, freedom of speech). Faithful service brings two rewards: increased standing in the community and increased confidence in faith. Faithful deacons may also be elevated to the eldership.',
   NULL),
  (14, 'These things write I unto thee, hoping to come unto thee shortly:',
   'Ταῦτά σοι γράφω ἐλπίζων ἐλθεῖν πρός σε τάχιον',
   'Tauta soi graphō elpizōn elthein pros se tachion',
   '''Hoping to come'' (elpizōn elthein — Paul plans to visit but is uncertain of timing). ''Shortly'' (tachion — soon, quickly). The letter addresses what Timothy needs to know in Paul''s absence. These instructions are not temporary but foundational for church order.',
   NULL),
  (15, 'But if I tarry long, that thou mayest know how thou oughtest to behave thyself in the house of God, which is the church of the living God, the pillar and ground of the truth.',
   'ἐὰν δὲ βραδύνω ἵνα εἰδῇς πῶς δεῖ ἐν οἴκῳ θεοῦ ἀναστρέφεσθαι ἥτις ἐστὶν ἐκκλησία θεοῦ ζῶντος στῦλος καὶ ἑδραίωμα τῆς ἀληθείας',
   'ean de bradynō hina eidēs pōs dei en oikō theou anastrephesthai hētis estin ekklēsia theou zōntos stylos kai hedraiōma tēs alētheias',
   '''House of God'' (oikō theou — God''s household, God''s family). ''Church of the living God'' (ekklēsia theou zōntos — the assembly of the living God; ''living'' distinguishes the true God from dead idols). ''Pillar'' (stylos — a supporting column; the church upholds and displays truth). ''Ground'' (hedraiōma — foundation, bulwark, support; used only here in the NT). The church is described with two architectural metaphors: a pillar that holds up truth for all to see, and a foundation that supports and stabilises it.',
   'The church as pillar and ground of the truth: The church does not create truth or stand above truth — it supports, upholds, and displays truth. As a pillar holds up a roof for all to see, the church holds up the truth of the gospel before the world. As a foundation provides stability, the church provides a stable platform for truth. This gives the church immense dignity and immense responsibility: it is the guardian and proclaimer of divine truth.'),
  (16, 'And without controversy great is the mystery of godliness: God was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.',
   'καὶ ὁμολογουμένως μέγα ἐστὶν τὸ τῆς εὐσεβείας μυστήριον θεὸς ἐφανερώθη ἐν σαρκί ἐδικαιώθη ἐν πνεύματι ὤφθη ἀγγέλοις ἐκηρύχθη ἐν ἔθνεσιν ἐπιστεύθη ἐν κόσμῳ ἀνελήφθη ἐν δόξῃ',
   'kai homologoumenōs mega estin to tēs eusebeias mystērion theos ephanerōthē en sarki edikaiōthē en pneumati ōphthē angelois ekērychthē en ethnesin episteuthē en kosmō anelēphthē en doxē',
   '''Without controversy'' (homologoumenōs — confessedly, by common agreement). ''Mystery of godliness'' (to tēs eusebeias mystērion — the revealed secret upon which all piety is based). Six lines, probably an early Christian hymn or creed: (1) ''God was manifest in the flesh'' — the incarnation; (2) ''justified in the Spirit'' — vindicated by the Spirit, especially in the resurrection; (3) ''seen of angels'' — witnessed by heavenly beings; (4) ''preached unto the Gentiles'' — proclaimed to the nations; (5) ''believed on in the world'' — received by faith globally; (6) ''received up into glory'' — the ascension. The structure alternates between earthly and heavenly spheres: flesh/Spirit, angels/Gentiles, world/glory.',
   'The mystery of godliness: This six-line confession is one of the earliest Christian creeds. It traces the entire Christ-event from incarnation to ascension. The ''mystery'' is not something hidden but something now revealed: the foundation of all godliness is the person and work of Christ. True piety (eusebeia) is not self-generated religious effort but a response to what God has done in Christ. The incarnation (''God manifest in the flesh'') is the supreme revelation of the divine mystery — God entering human existence to save sinners.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Timothy' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1 (Office of a bishop)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπισκοπῆς', 'episkopēs', 'G1984', 'Office of overseer/bishop, oversight — from epi (over) + skopeo (to look, to watch). The episkopos (overseer/bishop) watches over the flock. In the NT, this office is synonymous with presbyteros (elder): both terms describe the same role (Acts 20:17, 28; Titus 1:5, 7). The hierarchical distinction between bishop and elder developed after the apostolic period.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 2 (Blameless / apt to teach)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνεπίληπτον', 'anepilēpton', 'G423', 'Blameless, above reproach, not able to be seized upon — from a (not) + epilambanomai (to take hold of, to seize). No handle for accusation; no point of attack. Not sinless perfection but a life without scandalous, unresolved sin that would disqualify from leadership.', 1),
  ('διδακτικόν', 'didaktikon', 'G1317', 'Apt to teach, skilled in teaching — from didaskalos (teacher). The ability to communicate truth effectively. This is the one qualification unique to overseers (not required of deacons), reflecting the elder''s primary function: teaching and guarding sound doctrine (cf. Titus 1:9).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 3 AND v.verse_number = 2;

-- Verse 15 (Pillar and ground of truth)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στῦλος', 'stylos', 'G4769', 'Pillar, column — a supporting column that holds up a structure and displays what is placed on it. The church supports truth as a pillar supports a roof, and displays truth as a column displays a statue or inscription. The church does not create truth but upholds and makes it visible to the world.', 1),
  ('ἑδραίωμα', 'hedraiōma', 'G1477', 'Ground, foundation, bulwark, support — from hedraios (firm, steadfast). Used only here in the NT. A firm, stable base upon which something rests securely. The church provides a stable platform for divine truth — keeping it secure and unmoved against the assaults of error.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 3 AND v.verse_number = 15;

-- Verse 16 (Mystery of godliness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐφανερώθη', 'ephanerōthē', 'G5319', 'Was manifested, was made visible, was revealed — from phaneroō (to make visible, to bring to light). The invisible God became visible in human flesh. The incarnation is the supreme act of divine self-disclosure: God revealing himself in a form that human beings can see, touch, and know.', 1),
  ('εὐσεβείας', 'eusebeias', 'G2150', 'Godliness, piety, devout reverence — from eu (well) + sebomai (to worship, to revere). The sum of a life lived in reverent devotion to God. The ''mystery of godliness'' is the revealed truth upon which all genuine piety is based: the person and work of Jesus Christ.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 3 AND v.verse_number = 16;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Office of a bishop
  (1, 'Titus 1:5-9', 1), (1, 'Acts 20:28', 2),
  -- v2: Blameless, apt to teach
  (2, 'Titus 1:6-8', 1), (2, '2 Timothy 2:24', 2),
  -- v4: Ruleth own house
  (4, '1 Timothy 3:12', 1),
  -- v6: Not a novice
  (6, 'Isaiah 14:12-14', 1), (6, 'Proverbs 16:18', 2),
  -- v7: Good report from outsiders
  (7, 'Colossians 4:5', 1), (7, '1 Thessalonians 4:12', 2),
  -- v8: Deacons be grave
  (8, 'Acts 6:1-6', 1), (8, 'Philippians 1:1', 2),
  -- v9: Mystery of the faith
  (9, '1 Timothy 1:19', 1),
  -- v15: Pillar and ground of truth
  (15, '2 Timothy 2:19', 1), (15, 'Revelation 3:12', 2),
  -- v16: Mystery of godliness
  (16, 'John 1:14', 1), (16, 'Romans 1:3-4', 2), (16, '1 Peter 1:12', 3), (16, 'Acts 1:9', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Timothy' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Timothy Chapter 3 Complete
-- 16 verses · 4 key verses with word studies (8 words)
-- Cross-references for 9 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
