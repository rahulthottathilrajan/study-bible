-- ═══════════════════════════════════════════════════
-- 2 THESSALONIANS CHAPTER 2 — The Man of Sin & the Day of the Lord
-- 17 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'The most concentrated eschatological passage in Paul''s letters. Someone had troubled the Thessalonians with the claim that the Day of the Lord had already come (perhaps through a forged letter, v.2). Paul corrects this by outlining two events that must precede Christ''s return: (1) a great apostasy (falling away) and (2) the revelation of the Man of Sin — the son of perdition who seats himself in God''s temple and claims to be God. A mysterious restrainer currently holds back the Lawless One, but when removed, the Antichrist will be revealed — only to be destroyed by the brightness of Christ''s coming. Paul warns that God Himself will send strong delusion upon those who refused to love the truth, so that they believe the lie. The chapter closes with an exhortation to stand firm in apostolic tradition and a prayer for eternal comfort.',
  'The Apostasy, the Man of Sin, and the Restrainer',
  'ἀποστασία (apostasia)',
  'Apostasy, falling away, rebellion — a deliberate departure from previously held truth. The great apostasy must come before the Day of the Lord.',
  '["Correction: The Day Has Not Come (vv.1-2): Do not be shaken — the day of Christ is not yet here","The Apostasy and Man of Sin (vv.3-4): A falling away first; the son of perdition who exalts himself above all that is called God","The Restrainer (vv.5-7): He who restrains will do so until taken out of the way; the mystery of iniquity already at work","The Lawless One Destroyed (vv.8-12): Christ destroys him with the brightness of His coming; God sends strong delusion on those who rejected the truth","Stand Fast in Tradition (vv.13-15): Hold the traditions taught by word or epistle","Prayer for Comfort (vv.16-17): God who loved us and gave everlasting consolation and good hope through grace"]'
FROM books b WHERE b.name = '2 Thessalonians';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Now we beseech you, brethren, by the coming of our Lord Jesus Christ, and by our gathering together unto him,',
   'Ἐρωτῶμεν δὲ ὑμᾶς ἀδελφοί ὑπὲρ τῆς παρουσίας τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ καὶ ἡμῶν ἐπισυναγωγῆς ἐπ᾽ αὐτόν',
   'Erōtōmen de hymas adelphoi hyper tēs parousias tou kyriou hēmōn Iēsou Christou kai hēmōn episynagōgēs ep'' auton',
   '''Coming'' (parousias — presence, arrival, the royal visit) and ''gathering together'' (episynagōgēs — assembling together unto Him) are the two aspects of Christ''s return: He comes, and we are gathered to Him. The episynagōgē echoes Matthew 24:31 where angels gather the elect. Paul appeals ''by'' (hyper — concerning, on behalf of) these truths, not merely about them — the Second Coming itself is the ground of his appeal.',
   NULL),
  (2,
   'That ye be not soon shaken in mind, or be troubled, neither by spirit, nor by word, nor by letter as from us, as that the day of Christ is at hand.',
   'εἰς τὸ μὴ ταχέως σαλευθῆναι ὑμᾶς ἀπὸ τοῦ νοὸς μήτε θροεῖσθαι μήτε διὰ πνεύματος μήτε διὰ λόγου μήτε δι᾽ ἐπιστολῆς ὡς δι᾽ ἡμῶν ὡς ὅτι ἐνέστηκεν ἡ ἡμέρα τοῦ Χριστοῦ',
   'eis to mē tacheōs saleuthēnai hymas apo tou noos mēte throeisthai mēte dia pneumatos mēte dia logou mēte di'' epistolēs hōs di'' hēmōn hōs hoti enestēken hē hēmera tou Christou',
   '''Shaken'' (saleuthēnai — tossed like a ship in a storm) and ''troubled'' (throeisthai — alarmed, terrified, cried out in fear) describe the Thessalonians'' unsettled state. Three possible sources of false teaching: ''spirit'' (pneumatos — a prophetic utterance), ''word'' (logou — oral teaching), or ''letter as from us'' (epistolēs — possibly a forged letter claiming Pauline authority). ''Is at hand'' (enestēken — has come, is present) — they were told the Day had already arrived.',
   NULL),
  (3,
   'Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;',
   'μή τις ὑμᾶς ἐξαπατήσῃ κατὰ μηδένα τρόπον ὅτι ἐὰν μὴ ἔλθῃ ἡ ἀποστασία πρῶτον καὶ ἀποκαλυφθῇ ὁ ἄνθρωπος τῆς ἁμαρτίας ὁ υἱὸς τῆς ἀπωλείας',
   'mē tis hymas exapatēsē kata mēdena tropon hoti ean mē elthē hē apostasia prōton kai apokalyphthē ho anthrōpos tēs hamartias ho huios tēs apōleias',
   'Two prerequisites before the Day of the Lord: (1) ''the falling away'' (hē apostasia — the apostasy, with the definite article indicating a specific, recognisable event, not gradual drift) and (2) ''the man of sin'' (ho anthrōpos tēs hamartias) must be ''revealed'' (apokalyphthē — unveiled, made manifest). ''Son of perdition'' (huios tēs apōleias) — the same title given to Judas (John 17:12), meaning one whose destiny is destruction, one defined by lostness.',
   'The Day of the Lord cannot come until two events occur: the great apostasy and the revelation of the Antichrist. This provides a prophetic timetable that guards against both false alarms and complacency.'),
  (4,
   'Who opposeth and exalteth himself above all that is called God, or that is worshipped; so that he as God sitteth in the temple of God, shewing himself that he is God.',
   'ὁ ἀντικείμενος καὶ ὑπεραιρόμενος ἐπὶ πάντα λεγόμενον θεὸν ἢ σέβασμα ὥστε αὐτὸν εἰς τὸν ναὸν τοῦ θεοῦ ὡς θεὸν καθίσαι ἀποδεικνύντα ἑαυτὸν ὅτι ἐστὶν θεός',
   'ho antikemenos kai hyperairomenos epi panta legomenon theon ē sebasma hōste auton eis ton naon tou theou hōs theon kathisai apodeikynta heauton hoti estin theos',
   '''Opposeth'' (antikemenos — the one who stands against, the adversary) and ''exalteth himself'' (hyperairomenos — lifts himself above) describe the Antichrist''s dual character: opposition to God and self-deification. He sits (kathisai — takes his seat, enthroning himself) in ''the temple of God'' (ton naon tou theou) — whether a rebuilt Jerusalem temple or the church as God''s temple is debated. He ''shews himself'' (apodeikynta — demonstrates, proclaims, exhibits) that he is God. This echoes Daniel 11:36 and Isaiah 14:13-14.',
   'The ultimate expression of sin is self-deification — placing oneself in God''s place. The Man of Sin embodies the serpent''s original lie: ''ye shall be as gods'' (Gen 3:5). Every false religion and secular ideology that displaces God is a precursor to this final blasphemy.'),
  (5,
   'Remember ye not, that, when I was yet with you, I told you these things?',
   'οὐ μνημονεύετε ὅτι ἔτι ὢν πρὸς ὑμᾶς ταῦτα ἔλεγον ὑμῖν',
   'ou mnēmoneuete hoti eti ōn pros hymas tauta elegon hymin',
   'A mild rebuke — Paul had already taught them this eschatology in person (''I told you these things,'' imperfect tense elegon suggesting repeated instruction). This reveals that eschatology was part of Paul''s basic catechism even for new converts. The Thessalonians should have known better than to be shaken.',
   NULL),
  (6,
   'And now ye know what withholdeth that he might be revealed in his time.',
   'καὶ νῦν τὸ κατέχον οἴδατε εἰς τὸ ἀποκαλυφθῆναι αὐτὸν ἐν τῷ ἑαυτοῦ καιρῷ',
   'kai nyn to katechon oidate eis to apokalyphthēnai auton en tō heautou kairō',
   '''What withholdeth'' (to katechon — the restrainer, neuter gender, suggesting a force or principle rather than a person) — the Thessalonians knew what Paul meant, but he does not name it here, creating one of the great mysteries of NT interpretation. Candidates include: the Roman Empire, the rule of law, the Holy Spirit, the preaching of the Gospel, or Michael the archangel. ''In his time'' (en tō heautou kairō) — the Antichrist has a divinely appointed schedule; he cannot appear until God permits.',
   NULL),
  (7,
   'For the mystery of iniquity doth already work: only he who now letteth will let, until he be taken out of the way.',
   'τὸ γὰρ μυστήριον ἤδη ἐνεργεῖται τῆς ἀνομίας μόνον ὁ κατέχων ἄρτι ἕως ἐκ μέσου γένηται',
   'to gar mystērion ēdē energeitai tēs anomias monon ho katechōn arti heōs ek mesou genētai',
   '''Mystery of iniquity'' (mystērion tēs anomias) — lawlessness is already secretly at work, but its full manifestation is held back. ''Mystery'' (mystērion) does not mean ''puzzle'' but a hidden reality now being revealed. Note the shift from neuter ''what restrains'' (to katechon, v.6) to masculine ''he who restrains'' (ho katechōn) — suggesting both a principle and a person. ''Taken out of the way'' (ek mesou genētai — removed from the midst) — the restrainer will be withdrawn, and then the Lawless One will be revealed.',
   'Evil is not random but follows a divine timetable. The ''mystery of iniquity'' operates covertly in every age but is restrained from reaching its climax until God''s appointed time. God remains sovereign even over the forces of lawlessness.'),
  (8,
   'And then shall that Wicked be revealed, whom the Lord shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming:',
   'καὶ τότε ἀποκαλυφθήσεται ὁ ἄνομος ὃν ὁ κύριος ἀναλώσει τῷ πνεύματι τοῦ στόματος αὐτοῦ καὶ καταργήσει τῇ ἐπιφανείᾳ τῆς παρουσίας αὐτοῦ',
   'kai tote apokalyphthēsetai ho anomos hon ho kyrios analōsei tō pneumati tou stomatos autou kai katargēsei tē epiphaneia tēs parousias autou',
   '''That Wicked'' (ho anomos — the Lawless One) is finally revealed, but only to be destroyed. Christ needs no battle: He ''consumes'' (analōsei — uses up, destroys) him with ''the spirit of his mouth'' (tō pneumati tou stomatos — His breath/word, echoing Isa 11:4) and ''destroys'' (katargēsei — renders powerless, abolishes) him with ''the brightness of his coming'' (tē epiphaneia tēs parousias — the epiphany of His presence). The mere appearance of Christ is enough to annihilate the Antichrist''s power.',
   'Christ''s victory over the Antichrist requires no prolonged battle. The breath of His mouth and the splendour of His appearing are sufficient. This demonstrates the absolute supremacy of Christ over all evil — the Antichrist''s power, however great, is nothing before the Lord.'),
  (9,
   'Even him, whose coming is after the working of Satan with all power and signs and lying wonders,',
   'οὗ ἐστιν ἡ παρουσία κατ᾽ ἐνέργειαν τοῦ Σατανᾶ ἐν πάσῃ δυνάμει καὶ σημείοις καὶ τέρασιν ψεύδους',
   'hou estin hē parousia kat'' energeian tou Satana en pasē dynamei kai sēmeiois kai terasin pseudous',
   'The Antichrist''s coming (parousia — a deliberate parody of Christ''s parousia) is empowered by Satan''s working (energeian — active energy, supernatural operation). ''Power, signs, and lying wonders'' (dynamei, sēmeiois, terasin) — the same triad used for Christ''s miracles (Acts 2:22), but qualified as ''of falsehood'' (pseudous). The miracles are real but serve a lie. Satan counterfeits everything God does.',
   NULL),
  (10,
   'And with all deceivableness of unrighteousness in them that perish; because they received not the love of the truth, that they might be saved.',
   'καὶ ἐν πάσῃ ἀπάτῃ τῆς ἀδικίας ἐν τοῖς ἀπολλυμένοις ἀνθ᾽ ὧν τὴν ἀγάπην τῆς ἀληθείας οὐκ ἐδέξαντο εἰς τὸ σωθῆναι αὐτούς',
   'kai en pasē apatē tēs adikias en tois apollymenois anth'' hōn tēn agapēn tēs alētheias ouk edexanto eis to sōthēnai autous',
   '''Deceivableness of unrighteousness'' (apatē tēs adikias — deceit that characterises unrighteousness) operates ''in them that perish'' (en tois apollymenois — present participle: those who are in the process of perishing). The reason: ''they received not the love of the truth'' (tēn agapēn tēs alētheias ouk edexanto). Note: it is not merely the truth they rejected but the love of the truth — a heart disposition toward truth itself. They could have been saved (eis to sōthēnai) but refused.',
   'Damnation is not arbitrary — it follows a moral choice. Those who perish do so because they actively refused to love the truth. The issue is not ignorance but willful rejection of available saving truth.'),
  (11,
   'And for this cause God shall send them strong delusion, that they should believe a lie:',
   'καὶ διὰ τοῦτο πέμψει αὐτοῖς ὁ θεὸς ἐνέργειαν πλάνης εἰς τὸ πιστεῦσαι αὐτοὺς τῷ ψεύδει',
   'kai dia touto pempsei autois ho theos energeian planēs eis to pisteusai autous tō pseudei',
   '''God shall send'' (pempsei — future active: God will send) them ''strong delusion'' (energeian planēs — an active working of deception, using the same energeia attributed to Satan in v.9). This is judicial hardening: because they refused the truth, God judicially confirms them in their chosen delusion. ''The lie'' (tō pseudei — with the definite article) is not any lie but THE lie — the ultimate falsehood, likely the Antichrist''s claim to deity (v.4).',
   'God''s judicial hardening is not arbitrary but responsive — He sends delusion to those who have already rejected truth. This parallels Pharaoh''s hardening (Exod 9:12), Israel''s judicial blindness (Isa 6:10, Rom 11:8), and Romans 1:24-28 where God ''gave them over.'' God does not prevent people from having what they have chosen.'),
  (12,
   'That they all might be damned who believed not the truth, but had pleasure in unrighteousness.',
   'ἵνα κριθῶσιν πάντες οἱ μὴ πιστεύσαντες τῇ ἀληθείᾳ ἀλλ᾽ εὐδοκήσαντες ἐν τῇ ἀδικίᾳ',
   'hina krithōsin pantes hoi mē pisteusantes tē alētheia all'' eudokēsantes en tē adikia',
   '''Damned'' (krithōsin — judged, condemned) — the final purpose of the delusion is just condemnation. Two charges: (1) ''believed not the truth'' (mē pisteusantes tē alētheia — aorist: they made a definitive choice against truth) and (2) ''had pleasure in unrighteousness'' (eudokēsantes en tē adikia — delighted in, approved of wickedness). Unbelief and moral corruption go hand in hand — rejecting truth opens the door to embracing evil.',
   NULL),
  (13,
   'But we are bound to give thanks alway to God for you, brethren beloved of the Lord, because God hath from the beginning chosen you to salvation through sanctification of the Spirit and belief of the truth:',
   'ἡμεῖς δὲ ὀφείλομεν εὐχαριστεῖν τῷ θεῷ πάντοτε περὶ ὑμῶν ἀδελφοὶ ἠγαπημένοι ὑπὸ κυρίου ὅτι εἵλετο ὑμᾶς ὁ θεὸς ἀπ᾽ ἀρχῆς εἰς σωτηρίαν ἐν ἁγιασμῷ πνεύματος καὶ πίστει ἀληθείας',
   'hēmeis de opheilomen eucharistein tō theō pantote peri hymōn adelphoi ēgapēmenoi hypo kyriou hoti heilato hymas ho theos ap'' archēs eis sōtērian en hagiasmō pneumatos kai pistei alētheias',
   'A dramatic contrast to vv.10-12. ''Beloved of the Lord'' (ēgapēmenoi hypo kyriou — perfect participle: loved and still loved). ''Chosen you from the beginning'' (heilato hymas ap'' archēs) — God''s election is the ground of thanksgiving. The means of salvation: ''sanctification of the Spirit'' (hagiasmō pneumatos — the Spirit''s setting-apart work) and ''belief of the truth'' (pistei alētheias — faith as the human response). Election, the Spirit''s work, and human faith all operate together.',
   'Election and faith are not contradictory but complementary. God''s sovereign choice (heilato — chose for Himself) is effected through the Spirit''s sanctifying work and the believer''s faith. Salvation is wholly of God in its origin and genuinely involves the human response of faith in its application.'),
  (14,
   'Whereunto he called you by our gospel, to the obtaining of the glory of our Lord Jesus Christ.',
   'εἰς ὃ ἐκάλεσεν ὑμᾶς διὰ τοῦ εὐαγγελίου ἡμῶν εἰς περιποίησιν δόξης τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'eis ho ekalesen hymas dia tou euangeliou hēmōn eis peripoiēsin doxēs tou kyriou hēmōn Iēsou Christou',
   'The chain continues: chosen (v.13) → called (ekalesen — effectually summoned) → ''by our gospel'' (dia tou euangeliou — the gospel is the instrument of calling) → ''to the obtaining of the glory'' (eis peripoiēsin doxēs — to the acquisition/possession of glory). The ultimate destiny of believers is not merely escape from judgment but sharing in Christ''s own glory (cf. Rom 8:17, Col 3:4).',
   NULL),
  (15,
   'Therefore, brethren, stand fast, and hold the traditions which ye have been taught, whether by word, or our epistle.',
   'ἄρα οὖν ἀδελφοί στήκετε καὶ κρατεῖτε τὰς παραδόσεις ἃς ἐδιδάχθητε εἴτε διὰ λόγου εἴτε δι᾽ ἐπιστολῆς ἡμῶν',
   'ara oun adelphoi stēkete kai krateite tas paradoseis has edidachthēte eite dia logou eite di'' epistolēs hēmōn',
   '''Stand fast'' (stēkete — stand firm, hold your ground, a military term) and ''hold'' (krateite — grip tightly, seize firmly) the ''traditions'' (paradoseis — things handed down, transmitted teaching). Paul uses paradosis positively here for authoritative apostolic teaching delivered both orally (dia logou — by word) and in writing (di'' epistolēs — by epistle). This is the foundation of the faith once delivered to the saints (Jude 1:3).',
   'Apostolic tradition — whether spoken or written — carries divine authority. ''Traditions'' here does not mean human customs but the authoritative teaching of the apostles, which forms the basis of Christian doctrine.'),
  (16,
   'Now our Lord Jesus Christ himself, and God, even our Father, which hath loved us, and hath given us everlasting consolation and good hope through grace,',
   'αὐτὸς δὲ ὁ κύριος ἡμῶν Ἰησοῦς Χριστὸς καὶ ὁ θεὸς καὶ πατὴρ ἡμῶν ὁ ἀγαπήσας ἡμᾶς καὶ δοὺς παράκλησιν αἰωνίαν καὶ ἐλπίδα ἀγαθὴν ἐν χάριτι',
   'autos de ho kyrios hēmōn Iēsous Christos kai ho theos kai patēr hēmōn ho agapēsas hēmas kai dous paraklēsin aiōnian kai elpida agathēn en chariti',
   'Christ is named before the Father — unusual and striking, emphasising Christ''s active role. The singular participles (''loved'' agapēsas, ''given'' dous) treat the Father and Son as a unity in action. ''Everlasting consolation'' (paraklēsin aiōnian — eternal encouragement/comfort) and ''good hope'' (elpida agathēn) are gifts already given, grounded in grace (en chariti). In contrast to the everlasting destruction of 1:9, believers receive everlasting comfort.',
   NULL),
  (17,
   'Comfort your hearts, and stablish you in every good word and work.',
   'παρακαλέσαι ὑμῶν τὰς καρδίας καὶ στηρίξαι ὑμᾶς ἐν παντὶ λόγῳ καὶ ἔργῳ ἀγαθῷ',
   'parakalesai hymōn tas kardias kai stērixai hymas en panti logō kai ergō agathō',
   '''Comfort'' (parakalesai — encourage, strengthen, come alongside) and ''stablish'' (stērixai — make firm, fix solidly, strengthen) — Paul prays for inner strengthening that produces outward fruit: ''every good word and work'' (panti logō kai ergō agathō). Word (logō) comes before work (ergō) — right doctrine must precede right practice, a fitting conclusion to a chapter about the danger of false teaching.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 1 (Gathering together)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παρουσίας', 'parousias', 'G3952', 'Coming, presence, arrival — used for a royal visit. Christ''s second coming as the King returning in glory.', 1),
  ('ἐπισυναγωγῆς', 'episynagōgēs', 'G1997', 'Gathering together, assembling — epi (to) + synagōgē (assembly). The rapture/gathering of believers to meet the Lord. Used only here and Hebrews 10:25 in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 1;

-- Verse 3 (Apostasy and Man of Sin)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀποστασία', 'apostasia', 'G646', 'Apostasy, falling away, rebellion — from aphistēmi (to stand away from). A deliberate departure from the faith, not mere backsliding.', 1),
  ('ἄνθρωπος τῆς ἁμαρτίας', 'anthrōpos tēs hamartias', 'G444/G266', 'Man of sin — a human figure who embodies and personifies sin itself. The genitive is qualitative: sin defines his very nature.', 2),
  ('υἱὸς τῆς ἀπωλείας', 'huios tēs apōleias', 'G5207/G684', 'Son of perdition — one destined for destruction, defined by lostness. The same title as Judas Iscariot (John 17:12).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 3;

-- Verse 4 (Opposes and exalts)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀντικείμενος', 'antikemenos', 'G480', 'The one who opposes, the adversary — present participle describing a constant state of opposition to God.', 1),
  ('ὑπεραιρόμενος', 'hyperairomenos', 'G5229', 'Exalts himself above — hyper (above) + airō (lift). Self-exaltation beyond all limits, claiming divine prerogatives.', 2),
  ('ναὸν', 'naon', 'G3485', 'Temple, inner sanctuary — the sacred dwelling place of God. Whether literal (rebuilt Jerusalem temple) or figurative (the church) is debated.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 7 (Mystery of iniquity)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery — a hidden reality now being revealed. Not ''puzzle'' but divine secret disclosed to the initiated.', 1),
  ('ἀνομίας', 'anomias', 'G458', 'Lawlessness, iniquity — a (without) + nomos (law). Not merely breaking laws but rejection of divine order itself.', 2),
  ('κατέχων', 'katechōn', 'G2722', 'The restrainer (masculine) — the one who holds back, restrains, prevents. His identity is the great mystery of this passage.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 7;

-- Verse 8 (Lawless One destroyed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄνομος', 'anomos', 'G459', 'The Lawless One — without law, contemptuous of all authority. The definitive rebel against God''s order.', 1),
  ('ἀναλώσει', 'analōsei', 'G355', 'Consume, destroy utterly — used of fire consuming fuel. Complete annihilation of the Antichrist''s power.', 2),
  ('ἐπιφανείᾳ', 'epiphaneia', 'G2015', 'Brightness, appearing, manifestation — the visible splendour of Christ''s return. His mere appearance is lethal to evil.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 8;

-- Verse 11 (Strong delusion)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνέργειαν', 'energeian', 'G1753', 'Working, active operation, energy — the same word used for Satan''s power in v.9. God turns their chosen delusion into a confirmed state.', 1),
  ('πλάνης', 'planēs', 'G4106', 'Delusion, error, wandering — a straying from truth that becomes a settled condition under divine judgment.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 11;

-- Verse 13 (Chosen from the beginning)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εἵλετο', 'heilato', 'G138', 'Chose, selected for oneself — aorist middle voice: God actively chose you for Himself. A sovereign, personal, deliberate choice.', 1),
  ('ἁγιασμῷ', 'hagiasmō', 'G38', 'Sanctification, holiness, consecration — the Spirit''s work of setting apart and transforming. The means by which election is realised.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 13;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Coming and gathering
  (1, '1 Thessalonians 4:15-17', 1), (1, 'Matthew 24:31', 2), (1, 'Hebrews 10:25', 3),
  -- v2: Not shaken
  (2, 'Matthew 24:6', 1), (2, '1 John 4:1', 2),
  -- v3: Apostasy and Man of Sin
  (3, '1 Timothy 4:1-3', 1), (3, '2 Timothy 3:1-5', 2), (3, 'Daniel 7:25', 3), (3, 'John 17:12', 4),
  -- v4: Sits in temple as God
  (4, 'Daniel 11:36', 1), (4, 'Isaiah 14:13-14', 2), (4, 'Ezekiel 28:2', 3), (4, 'Revelation 13:6', 4),
  -- v6: The restrainer
  (6, 'Daniel 12:1', 1), (6, 'Genesis 6:3', 2),
  -- v7: Mystery of iniquity
  (7, '1 John 2:18', 1), (7, '1 John 4:3', 2), (7, 'Revelation 17:5', 3),
  -- v8: Consumed by Christ
  (8, 'Isaiah 11:4', 1), (8, 'Revelation 19:15', 2), (8, 'Revelation 19:20', 3), (8, 'Daniel 7:11', 4),
  -- v9: Satan''s power
  (9, 'Revelation 13:13-14', 1), (9, 'Matthew 24:24', 2), (9, 'Acts 2:22', 3),
  -- v10: Received not truth
  (10, 'Romans 1:18', 1), (10, '2 Corinthians 4:3-4', 2), (10, 'John 3:19', 3),
  -- v11: Strong delusion
  (11, 'Romans 1:24-28', 1), (11, '1 Kings 22:22-23', 2), (11, 'Isaiah 6:9-10', 3), (11, 'Ezekiel 14:9', 4),
  -- v13: Chosen to salvation
  (13, 'Ephesians 1:4-5', 1), (13, '1 Peter 1:2', 2), (13, 'Romans 8:29-30', 3), (13, '1 Thessalonians 1:4', 4),
  -- v14: Called by the gospel
  (14, 'Romans 8:30', 1), (14, '1 Peter 5:10', 2), (14, 'Colossians 3:4', 3),
  -- v15: Hold traditions
  (15, '1 Corinthians 11:2', 1), (15, 'Jude 1:3', 2), (15, '2 Timothy 1:13-14', 3),
  -- v16: Everlasting consolation
  (16, 'Romans 15:5', 1), (16, '2 Corinthians 1:3-4', 2), (16, 'Hebrews 6:18', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ 2 Thessalonians Chapter 2 Complete!
-- 17 verses · 8 key verses with word studies (20 words)
-- Cross-references for 14 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
