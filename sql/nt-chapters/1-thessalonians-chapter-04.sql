-- ═══════════════════════════════════════════════════
-- 1 THESSALONIANS CHAPTER 4 — Holiness and the Rapture
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  '1 Thessalonians 4 divides into two major sections that answer two pressing questions. First (vv.1-12), Paul addresses the question of sanctification — how should believers live? He calls for sexual purity in a culture saturated with immorality, emphasising that God''s will is ''your sanctification'' (v.3) and that the body is to be possessed in ''sanctification and honour'' (v.4). He then urges brotherly love and quiet, industrious living. The second section (vv.13-18) addresses the question that most troubled the Thessalonians: what happens to believers who die before Christ returns? Paul''s answer is the most detailed rapture passage in Scripture. The dead in Christ shall rise first, then the living shall be ''caught up together with them in the clouds, to meet the Lord in the air'' (v.17). The chapter closes with the command to ''comfort one another with these words'' (v.18) — eschatology is not for speculation but for consolation.',
  'Sanctified Living and the Blessed Hope',
  'ἁρπαγησόμεθα (harpagēsometha)',
  'Shall be caught up, snatched away, seized — the future passive of harpazō: we shall be seized by divine power and carried upward to meet the Lord in the air. This is the word from which "rapture" (Latin rapturo) derives.',
  '["Walk to Please God (vv.1-2): We beseech you to abound more and more; ye know the commandments we gave you by the Lord Jesus","Sanctification: Sexual Purity (vv.3-8): This is the will of God, your sanctification; abstain from fornication; possess your vessel in sanctification and honour; God hath not called us unto uncleanness but unto holiness; he that despiseth despiseth God who hath given us his Holy Spirit","Brotherly Love and Quiet Industry (vv.9-12): Touching brotherly love ye need not that I write; ye are taught of God to love one another; study to be quiet; work with your own hands; walk honestly toward them that are without","The Dead in Christ and the Rapture (vv.13-18): I would not have you ignorant concerning them which are asleep; Jesus died and rose again; them also which sleep in Jesus will God bring with him; the Lord himself shall descend from heaven; the dead in Christ shall rise first; we which are alive shall be caught up together with them; comfort one another with these words"]'
FROM books b WHERE b.name = '1 Thessalonians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Furthermore then we beseech you, brethren, and exhort you by the Lord Jesus, that as ye have received of us how ye ought to walk and to please God, so ye would abound more and more.',
   'Λοιπὸν οὖν ἀδελφοί ἐρωτῶμεν ὑμᾶς καὶ παρακαλοῦμεν ἐν κυρίῳ Ἰησοῦ ἵνα καθὼς παρελάβετε παρ᾽ ἡμῶν τὸ πῶς δεῖ ὑμᾶς περιπατεῖν καὶ ἀρέσκειν θεῷ καθὼς καὶ περιπατεῖτε ἵνα περισσεύητε μᾶλλον',
   'Loipon oun adelphoi erōtōmen hymas kai parakaloumen en kyriō Iēsou hina kathōs parelabete par'' hēmōn to pōs dei hymas peripatein kai areskein theō kathōs kai peripateite hina perisseuēte mallon',
   '''Furthermore'' (loipon oun — as for the rest, now then) marks the transition from personal matters (chs.1-3) to practical instruction (chs.4-5). ''Beseech'' (erōtōmen — ask, request) and ''exhort'' (parakaloumen — urge, encourage) — gentle authority, not heavy command. ''Abound more and more'' (perisseuēte mallon — overflow still more). Paul affirms their progress (''as ye walk'') but urges continued growth. The Christian life has no plateau — there is always more.',
   NULL),
  (2,
   'For ye know what commandments we gave you by the Lord Jesus.',
   'οἴδατε γὰρ τίνας παραγγελίας ἐδώκαμεν ὑμῖν διὰ τοῦ κυρίου Ἰησοῦ',
   'oidate gar tinas parangelias edōkamen hymin dia tou kyriou Iēsou',
   '''Commandments'' (parangelias — charges, orders, instructions; a military term for commands passed down through the ranks). ''By the Lord Jesus'' (dia tou kyriou Iēsou — through the authority of the Lord Jesus). Paul''s instructions were not personal opinions but authoritative charges transmitted under Christ''s authority. The apostolic teaching carried the weight of divine command.',
   NULL),
  (3,
   'For this is the will of God, even your sanctification, that ye should abstain from fornication:',
   'τοῦτο γάρ ἐστιν θέλημα τοῦ θεοῦ ὁ ἁγιασμὸς ὑμῶν ἀπέχεσθαι ὑμᾶς ἀπὸ τῆς πορνείας',
   'touto gar estin thelēma tou theou ho hagiasmos hymōn apechesthai hymas apo tēs porneias',
   '''The will of God'' (thelēma tou theou) — one of the clearest statements of God''s will in Scripture. No need to wonder: God''s will is ''your sanctification'' (ho hagiasmos hymōn — your being set apart, your progressive holiness). The first specific application: ''abstain from fornication'' (apechesthai apo tēs porneias — hold yourselves entirely away from sexual immorality). Porneia covers all sexual activity outside marriage. In Thessalonica, a city with temples to Aphrodite and Dionysus, sexual licence was woven into daily life.',
   'Sanctification as God''s will: This verse makes sanctification not optional but the declared will of God for every believer. Hagiasmos (sanctification) is both positional (set apart at conversion) and progressive (ongoing growth in holiness). The specific focus on sexual purity shows that sanctification is not merely spiritual but involves the body.'),
  (4,
   'That every one of you should know how to possess his vessel in sanctification and honour;',
   'εἰδέναι ἕκαστον ὑμῶν τὸ ἑαυτοῦ σκεῦος κτᾶσθαι ἐν ἁγιασμῷ καὶ τιμῇ',
   'eidenai hekaston hymōn to heautou skeuos ktasthai en hagiasmō kai timē',
   '''Possess his vessel'' (to heautou skeuos ktasthai — to acquire/control his own vessel). ''Vessel'' (skeuos) may refer to one''s own body (the believer''s body as a vessel to be controlled) or to one''s wife (acquiring a wife in holiness). Both interpretations have strong support. Either way, the principle is self-mastery: the believer is to control the body or marriage relationship ''in sanctification and honour'' (en hagiasmō kai timē — in consecration and dignity), not in uncontrolled lust.',
   NULL),
  (5,
   'Not in the lust of concupiscence, even as the Gentiles which know not God:',
   'μὴ ἐν πάθει ἐπιθυμίας καθάπερ καὶ τὰ ἔθνη τὰ μὴ εἰδότα τὸν θεόν',
   'mē en pathei epithymias kathaper kai ta ethnē ta mē eidota ton theon',
   '''Lust of concupiscence'' (pathei epithymias — passion of desire, the fever of craving). ''Gentiles which know not God'' (ta ethnē ta mē eidota ton theon — the nations that do not know God). The pagan world lived in sexual chaos because it had no knowledge of the true God. Ignorance of God leads to moral disorder. Conversely, knowing God produces self-control. The contrast is not between cultures but between those who know God and those who do not.',
   NULL),
  (6,
   'That no man go beyond and defraud his brother in any matter: because that the Lord is the avenger of all such, as we also have forewarned you and testified.',
   'τὸ μὴ ὑπερβαίνειν καὶ πλεονεκτεῖν ἐν τῷ πράγματι τὸν ἀδελφὸν αὐτοῦ διότι ἔκδικος κύριος περὶ πάντων τούτων καθὼς καὶ προείπαμεν ὑμῖν καὶ διεμαρτυράμεθα',
   'to mē hyperbainein kai pleonektein en tō pragmati ton adelphon autou dioti ekdikos kyrios peri pantōn toutōn kathōs kai proeipamen hymin kai diemartyramētha',
   '''Go beyond'' (hyperbainein — to overstep, transgress, cross the boundary). ''Defraud'' (pleonektein — to take advantage of, to exploit for gain; from pleon + echō, to have more at another''s expense). ''In any matter'' (en tō pragmati — in the matter, probably still referring to sexual relationships: do not violate another man''s marriage or betrothed). ''The Lord is the avenger'' (ekdikos kyrios — the Lord is the punisher, the one who executes justice). Sexual sin is not a private matter — it is theft from a brother, and God avenges it.',
   NULL),
  (7,
   'For God hath not called us unto uncleanness, but unto holiness.',
   'οὐ γὰρ ἐκάλεσεν ἡμᾶς ὁ θεὸς ἐπὶ ἀκαθαρσίᾳ ἀλλ᾽ ἐν ἁγιασμῷ',
   'ou gar ekalesen hēmas ho theos epi akatharsia all'' en hagiasmō',
   '''Called'' (ekalesen — aorist: God summoned, God invited; the definitive call of conversion). Two prepositions show the contrast: ''unto uncleanness'' (epi akatharsia — on the basis of impurity, with impurity as the foundation) versus ''unto holiness'' (en hagiasmō — in sanctification, in the sphere of holiness). God''s call places believers in the realm of holiness, not impurity. The calling determines the lifestyle.',
   NULL),
  (8,
   'He therefore that despiseth, despiseth not man, but God, who hath also given unto us his holy Spirit.',
   'τοιγαροῦν ὁ ἀθετῶν οὐκ ἄνθρωπον ἀθετεῖ ἀλλὰ τὸν θεὸν τὸν καὶ δόντα τὸ πνεῦμα αὐτοῦ τὸ ἅγιον εἰς ὑμᾶς',
   'toigaroun ho athetōn ouk anthrōpon athetei alla ton theon ton kai donta to pneuma autou to hagion eis hymas',
   '''Despiseth'' (athetōn — sets aside, nullifies, rejects with contempt; from a-tithēmi, to un-place, to treat as void). To reject Paul''s teaching on holiness is not to reject a man''s opinion but to reject God Himself. The clinching argument: ''who hath also given unto us his holy Spirit'' (ton donta to pneuma autou to hagion — the one who gave His Spirit, the Holy One, into you). The indwelling Spirit makes the body a temple (1 Cor 6:19). Sexual sin defiles the Spirit''s dwelling.',
   'The indwelling Holy Spirit: God has not merely commanded holiness from a distance; He has placed His own Holy Spirit within believers to empower it. To sin sexually is to sin against the resident Spirit. This verse grounds the ethic of holiness in the reality of the Spirit''s indwelling presence.'),
  (9,
   'But as touching brotherly love ye need not that I write unto you: for ye yourselves are taught of God to love one another.',
   'Περὶ δὲ τῆς φιλαδελφίας οὐ χρείαν ἔχετε γράφειν ὑμῖν αὐτοὶ γὰρ ὑμεῖς θεοδίδακτοί ἐστε εἰς τὸ ἀγαπᾶν ἀλλήλους',
   'Peri de tēs philadelphias ou chreian echete graphein hymin autoi gar hymeis theodidaktoi este eis to agapan allēlous',
   '''Brotherly love'' (philadelphias — love of brothers, sibling affection within the family of God). ''Taught of God'' (theodidaktoi — God-taught; a compound word found only here in the NT, likely coined by Paul). They don''t need Paul''s instruction because God Himself has been their teacher through the indwelling Spirit. This does not make teaching unnecessary but shows that genuine believers have an internal teacher confirming the external instruction (cf. Jer 31:33-34; John 6:45).',
   NULL),
  (10,
   'And indeed ye do it toward all the brethren which are in all Macedonia: but we beseech you, brethren, that ye increase more and more;',
   'καὶ γὰρ ποιεῖτε αὐτὸ εἰς πάντας τοὺς ἀδελφοὺς τοὺς ἐν ὅλῃ τῇ Μακεδονίᾳ παρακαλοῦμεν δὲ ὑμᾶς ἀδελφοί περισσεύειν μᾶλλον',
   'kai gar poieite auto eis pantas tous adelphous tous en holē tē Makedonia parakaloumen de hymas adelphoi perisseuein mallon',
   'Paul affirms their love is already active ''toward all the brethren in all Macedonia'' — their love extends beyond their local church to believers in Philippi, Berea, and other Macedonian cities. Yet even this is not enough: ''increase more and more'' (perisseuein mallon — overflow still more). There is no ceiling on Christian love. The pattern of 1 Thessalonians: affirm, then call higher.',
   NULL),
  (11,
   'And that ye study to be quiet, and to do your own business, and to work with your own hands, as we commanded you;',
   'καὶ φιλοτιμεῖσθαι ἡσυχάζειν καὶ πράσσειν τὰ ἴδια καὶ ἐργάζεσθαι ταῖς ἰδίαις χερσὶν ὑμῶν καθὼς ὑμῖν παρηγγείλαμεν',
   'kai philotimeisthai hēsychazein kai prassein ta idia kai ergazesthai tais idiais chersin hymōn kathōs hymin parēngeilamen',
   '''Study to be quiet'' (philotimeisthai hēsychazein — make it your ambition to live quietly; a deliberate paradox: be ambitious about being unambitious). Some Thessalonians, excited about Christ''s return, had abandoned their jobs and become idle busybodies. ''Do your own business'' (prassein ta idia — attend to your own affairs). ''Work with your own hands'' — manual labour was despised in Greek culture but honoured in the Christian ethic. This corrects the misuse of eschatological expectation as an excuse for laziness.',
   NULL),
  (12,
   'That ye may walk honestly toward them that are without, and that ye may have lack of nothing.',
   'ἵνα περιπατῆτε εὐσχημόνως πρὸς τοὺς ἔξω καὶ μηδενὸς χρείαν ἔχητε',
   'hina peripatēte euschēmonōs pros tous exō kai mēdenos chreian echēte',
   '''Honestly'' (euschēmonōs — properly, decently, in a well-ordered manner; from eu + schēma, good form). ''Them that are without'' (tous exō — outsiders, non-believers). The church''s reputation among unbelievers matters. ''Have lack of nothing'' (mēdenos chreian echēte — not be dependent on anyone). Paul wants them self-supporting, not parasitic. Hard work serves both evangelistic witness (outsiders respect it) and practical independence.',
   NULL),
  (13,
   'But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope.',
   'Οὐ θέλομεν δὲ ὑμᾶς ἀγνοεῖν ἀδελφοί περὶ τῶν κοιμωμένων ἵνα μὴ λυπῆσθε καθὼς καὶ οἱ λοιποὶ οἱ μὴ ἔχοντες ἐλπίδα',
   'Ou thelomen de hymas agnoein adelphoi peri tōn koimōmenōn hina mē lypēsthe kathōs kai hoi loipoi hoi mē echontes elpida',
   '''Asleep'' (koimōmenōn — those sleeping, those who have fallen asleep; a Christian euphemism for death, implying temporary rest and certain awakening). The Thessalonians feared that believers who died before the Parousia would miss it. ''That ye sorrow not'' — not a prohibition of grief, but of hopeless grief. ''As others which have no hope'' (hoi mē echontes elpida — those who do not have hope). The pagan world had no hope beyond the grave. Christians grieve, but not as those without hope.',
   'The Christian hope in death: Paul does not forbid mourning but transforms it. Christian grief is grief with hope. ''Sleep'' (koimōmenōn) is deliberately chosen: sleep is temporary and ends in awakening. Death for the believer is not extinction but rest until the resurrection. The distinction between Christian and pagan grief is hope — not the absence of sorrow but the presence of certain expectation.'),
  (14,
   'For if we believe that Jesus died and rose again, even so them also which sleep in Jesus will God bring with him.',
   'εἰ γὰρ πιστεύομεν ὅτι Ἰησοῦς ἀπέθανεν καὶ ἀνέστη οὕτως καὶ ὁ θεὸς τοὺς κοιμηθέντας διὰ τοῦ Ἰησοῦ ἄξει σὺν αὐτῷ',
   'ei gar pisteuomen hoti Iēsous apethanen kai anestē houtōs kai ho theos tous koimēthentas dia tou Iēsou axei syn autō',
   'The logical foundation: ''if we believe'' (ei pisteuomen — since we believe; the ''if'' assumes the truth) ''that Jesus died and rose again'' (apethanen kai anestē — the two-fold creed of death and resurrection). Note: Paul says Jesus ''died'' (not ''fell asleep'') because He bore the full reality of death for us, but believers ''sleep'' (koimēthentas) because Christ''s death removed death''s sting. ''God will bring with him'' (axei syn autō — God will lead them along with Jesus). The departed believers will return with Christ at His coming.',
   'The resurrection of believers: The believer''s resurrection is grounded in Christ''s resurrection. The logic is: Jesus died and rose; therefore those who died in Jesus will also be raised and brought with Him. Christ''s resurrection is the guarantee, the pattern, and the cause of the believer''s resurrection.'),
  (15,
   'For this we say unto you by the word of the Lord, that we which are alive and remain unto the coming of the Lord shall not prevent them which are asleep.',
   'Τοῦτο γὰρ ὑμῖν λέγομεν ἐν λόγῳ κυρίου ὅτι ἡμεῖς οἱ ζῶντες οἱ περιλειπόμενοι εἰς τὴν παρουσίαν τοῦ κυρίου οὐ μὴ φθάσωμεν τοὺς κοιμηθέντας',
   'Touto gar hymin legomen en logō kyriou hoti hēmeis hoi zōntes hoi perileipomenoi eis tēn parousian tou kyriou ou mē phthasōmen tous koimēthentas',
   '''By the word of the Lord'' (en logō kyriou — by a direct saying of the Lord; either a teaching of Jesus not recorded in the Gospels or a direct prophetic revelation to Paul). This gives the passage the highest possible authority. ''Prevent'' (phthasōmen — precede, arrive before, get a head start on; from phthanō, to come before). The living will ''not in any way'' (ou mē — the strongest possible Greek negation) precede the dead. The dead in Christ will actually rise first — they have priority, not the living.',
   NULL),
  (16,
   'For the Lord himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of God: and the dead in Christ shall rise first:',
   'ὅτι αὐτὸς ὁ κύριος ἐν κελεύσματι ἐν φωνῇ ἀρχαγγέλου καὶ ἐν σάλπιγγι θεοῦ καταβήσεται ἀπ᾽ οὐρανοῦ καὶ οἱ νεκροὶ ἐν Χριστῷ ἀναστήσονται πρῶτον',
   'hoti autos ho kyrios en keleusmati en phōnē archangelou kai en salpingi theou katabēsetai ap'' ouranou kai hoi nekroi en Christō anastēsontai prōton',
   '''The Lord himself'' (autos ho kyrios — He Himself, personally, not a delegate). Three accompanying sounds: (1) ''a shout'' (keleusmati — a word of command, a military command, an authoritative cry; used only here in the NT), (2) ''the voice of the archangel'' (phōnē archangelou — the archangel''s voice; cf. Michael in Jude 9), (3) ''the trump of God'' (salpingi theou — God''s trumpet; cf. 1 Cor 15:52, ''the last trump''). ''Descend from heaven'' (katabēsetai ap'' ouranou — will come down from heaven). ''The dead in Christ shall rise first'' (prōton — first in sequence, before the living are caught up).',
   'The Second Coming: This verse describes the most dramatic event in human history. Christ descends personally, visibly, audibly. The triple sound (shout, voice, trumpet) emphasises the public, triumphant nature of the event. The dead in Christ rise first — those who died believing are not forgotten or disadvantaged. They are first in the sequence of glory.'),
  (17,
   'Then we which are alive and remain shall be caught up together with them in the clouds, to meet the Lord in the air: and so shall we ever be with the Lord.',
   'ἔπειτα ἡμεῖς οἱ ζῶντες οἱ περιλειπόμενοι ἅμα σὺν αὐτοῖς ἁρπαγησόμεθα ἐν νεφέλαις εἰς ἀπάντησιν τοῦ κυρίου εἰς ἀέρα καὶ οὕτως πάντοτε σὺν κυρίῳ ἐσόμεθα',
   'epeita hēmeis hoi zōntes hoi perileipomenoi hama syn autois harpagēsometha en nephelais eis apantēsin tou kyriou eis aera kai houtōs pantote syn kyriō esometha',
   '''Then'' (epeita — next in order, after that). ''Caught up'' (harpagēsometha — shall be snatched away, seized, raptured; from harpazō, to seize by force, to snatch; used of Philip being caught away in Acts 8:39 and Paul caught up to paradise in 2 Cor 12:2-4). ''Together with them'' (hama syn autois — simultaneously with them, all at once). ''In the clouds'' (en nephelais — clouds are associated with divine presence: Exod 13:21; Dan 7:13; Acts 1:9). ''To meet the Lord'' (eis apantēsin tou kyriou — for a meeting with the Lord; apantēsis was a technical term for the official welcoming party that went out to meet an arriving dignitary). ''In the air'' (eis aera). ''So shall we ever be with the Lord'' (pantote syn kyriō esometha — always with the Lord, forever with the Lord). The ultimate destiny: unbroken fellowship with Christ.',
   'The Rapture: This verse describes the bodily catching up of living believers to meet Christ. ''Caught up'' (harpagēsometha) is passive — believers do not ascend by their own power but are seized by divine might. ''Together'' (hama) is key: the dead (now raised) and the living are reunited and together meet the Lord. The final promise — ''ever be with the Lord'' — is the heart of Christian hope: not a place but a Person.'),
  (18,
   'Wherefore comfort one another with these words.',
   'Ὥστε παρακαλεῖτε ἀλλήλους ἐν τοῖς λόγοις τούτοις',
   'Hōste parakaleite allēlous en tois logois toutois',
   '''Comfort'' (parakaleite — encourage, console, call alongside; present imperative: keep on encouraging one another). ''With these words'' (en tois logois toutois — with these specific words, this particular teaching). Eschatology is not given for speculation, date-setting, or theological debate but for pastoral comfort. The purpose of the rapture doctrine is consolation: death does not separate believers from Christ or from one another. The response to prophetic truth is encouragement.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 3 (Sanctification)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἁγιασμός', 'hagiasmos', 'G38', 'Sanctification, the process of being made holy — from hagios (holy, set apart). Both the state and the process of being consecrated to God. God''s declared will for every believer.', 1),
  ('πορνείας', 'porneias', 'G4202', 'Fornication, sexual immorality — every form of sexual activity outside the marriage of husband and wife. From pornē (prostitute). The broadest Greek term for sexual sin.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4 AND v.verse_number = 3;

-- Verse 11 (Study to be quiet)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φιλοτιμεῖσθαι', 'philotimeisthai', 'G5389', 'To be ambitious, to aspire, to make it one''s aim — from philos (loving) + timē (honour). The deliberate paradox: make it your ambition to live without ambition for public attention.', 1),
  ('ἡσυχάζειν', 'hēsychazein', 'G2270', 'To be quiet, to be still, to live peacefully — not silence but a settled, undisturbed life. The opposite of the busybody who meddles in everyone''s affairs.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4 AND v.verse_number = 11;

-- Verse 13 (Them which are asleep)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κοιμωμένων', 'koimōmenōn', 'G2837', 'Those sleeping, those who have fallen asleep — a Christian euphemism for death. From koimaō (to put to sleep). Death for the believer is sleep: temporary, peaceful, ending in awakening. Our word "cemetery" (koimētērion) means "sleeping place."', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4 AND v.verse_number = 13;

-- Verse 16 (The Lord shall descend)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κελεύσματι', 'keleusmati', 'G2752', 'A shout of command, a word of authority — used only here in the NT. A military order, a command given to troops. Christ descends not silently but with sovereign authority, commanding the dead to rise.', 1),
  ('σάλπιγγι', 'salpingi', 'G4536', 'Trumpet — associated with divine theophanies (Exod 19:16), assembly calls (Num 10:2), and the final resurrection (1 Cor 15:52). God''s trumpet announces the King''s arrival.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4 AND v.verse_number = 16;

-- Verse 17 (Caught up)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἁρπαγησόμεθα', 'harpagēsometha', 'G726', 'Shall be caught up, snatched away, seized by force — future passive of harpazō. The Latin Vulgate translates this "rapiemur," from which we get "rapture." Believers are seized by divine power and carried heavenward.', 1),
  ('ἀπάντησιν', 'apantēsin', 'G529', 'Meeting, encounter — a technical term for the official delegation that goes out from a city to welcome an arriving dignitary and escort him back. The meeting is not the destination; it is the welcoming party.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v3: Sanctification / abstain from fornication
  (3, '1 Peter 1:15-16', 1), (3, 'Hebrews 12:14', 2), (3, '1 Corinthians 6:18-20', 3),
  -- v7: Called unto holiness
  (7, '1 Peter 1:15', 1), (7, '2 Timothy 1:9', 2), (7, 'Leviticus 11:44', 3),
  -- v8: Despises God / Holy Spirit given
  (8, '1 Corinthians 6:19', 1), (8, 'Luke 10:16', 2), (8, 'Ezekiel 36:27', 3),
  -- v9: Taught of God
  (9, 'John 6:45', 1), (9, 'Jeremiah 31:33-34', 2), (9, '1 John 2:27', 3),
  -- v11: Study to be quiet
  (11, '2 Thessalonians 3:11-12', 1), (11, '1 Peter 4:15', 2), (11, 'Ephesians 4:28', 3),
  -- v13: Them which are asleep
  (13, '1 Corinthians 15:18-20', 1), (13, 'John 11:11-14', 2), (13, 'Ephesians 2:12', 3),
  -- v14: Jesus died and rose
  (14, '1 Corinthians 15:3-4', 1), (14, 'Romans 8:11', 2), (14, '2 Corinthians 4:14', 3),
  -- v15: Word of the Lord
  (15, '1 Corinthians 15:51-52', 1), (15, 'John 6:39-40', 2),
  -- v16: Lord descends with shout
  (16, 'John 5:28-29', 1), (16, '1 Corinthians 15:52', 2), (16, 'Matthew 24:31', 3),
  -- v17: Caught up / ever with the Lord
  (17, 'Acts 1:9-11', 1), (17, 'John 14:3', 2), (17, '2 Corinthians 5:8', 3),
  -- v18: Comfort one another
  (18, '1 Thessalonians 5:11', 1), (18, 'Titus 2:13', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Thessalonians Chapter 4 Complete
-- 18 verses · 7 key verses with word studies (12 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════