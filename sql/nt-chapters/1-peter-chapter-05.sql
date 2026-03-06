-- ═══════════════════════════════════════════════════
-- 1 PETER CHAPTER 5 — Shepherd the Flock and Stand Firm
-- 14 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  '1 Peter 5 brings the epistle to a powerful close with instructions for elders, younger believers, and the whole community. Peter exhorts elders as a ''fellow elder'' and ''witness of the sufferings of Christ'' to shepherd the flock willingly, not for filthy lucre, and not as lords over God''s heritage but as examples (vv.1-4). When the ''chief Shepherd'' appears, they will receive ''a crown of glory that fadeth not away'' (v.4). Younger believers are to submit to elders, and all are to be ''clothed with humility,'' for ''God resisteth the proud, and giveth grace to the humble'' (v.5). The famous command follows: ''Casting all your care upon him; for he careth for you'' (v.7). Then the epistle''s great warning: ''Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour'' (v.8). Believers are to resist him ''stedfast in the faith'' (v.9). Peter closes with the assurance that ''the God of all grace'' who called them will Himself ''make you perfect, stablish, strengthen, settle you'' (v.10). Brief greetings follow, including mention of Silvanus (Silas) and ''the church that is at Babylon'' (likely Rome), and the final benediction: ''Peace be with you all that are in Christ Jesus. Amen'' (v.14).',
  'Humble Leadership and Vigilance Against the Enemy',
  'ἀρχιποίμενος (archipoímenos)',
  'The chief Shepherd — from archi (chief, first) + poimēn (shepherd). Christ is the head Shepherd over all under-shepherds (elders/pastors). When He appears, faithful shepherds receive the unfading crown of glory.',
  '["Elders: Shepherd the Flock Willingly (vv.1-4): The elders which are among you I exhort who am also an elder and a witness of the sufferings of Christ and also a partaker of the glory that shall be revealed; feed the flock of God which is among you taking the oversight thereof not by constraint but willingly not for filthy lucre but of a ready mind; neither as being lords over God''s heritage but being ensamples to the flock; and when the chief Shepherd shall appear ye shall receive a crown of glory that fadeth not away","Humble Yourselves Under God (vv.5-7): Likewise ye younger submit yourselves unto the elder; yea all of you be subject one to another and be clothed with humility for God resisteth the proud and giveth grace to the humble; humble yourselves therefore under the mighty hand of God that he may exalt you in due time; casting all your care upon him for he careth for you","Resist the Devil (vv.8-9): Be sober be vigilant because your adversary the devil as a roaring lion walketh about seeking whom he may devour; whom resist stedfast in the faith knowing that the same afflictions are accomplished in your brethren that are in the world","The God of All Grace Will Perfect You (vv.10-11): But the God of all grace who hath called us unto his eternal glory by Christ Jesus after that ye have suffered a while make you perfect stablish strengthen settle you; to him be glory and dominion for ever and ever Amen","Final Greetings and Benediction (vv.12-14): By Silvanus a faithful brother unto you as I suppose I have written briefly exhorting and testifying that this is the true grace of God wherein ye stand; the church that is at Babylon elected together with you saluteth you and so doth Marcus my son; greet ye one another with a kiss of charity; peace be with you all that are in Christ Jesus Amen"]'
FROM books b WHERE b.name = '1 Peter';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'The elders which are among you I exhort, who am also an elder, and a witness of the sufferings of Christ, and also a partaker of the glory that shall be revealed:',
   'Πρεσβυτέρους τοὺς ἐν ὑμῖν παρακαλῶ ὁ συμπρεσβύτερος καὶ μάρτυς τῶν τοῦ Χριστοῦ παθημάτων ὁ καὶ τῆς μελλούσης ἀποκαλύπτεσθαι δόξης κοινωνός',
   'Presbyterous tous en hymin parakalō ho sympresbyteros kai martys tōn tou Christou pathēmatōn ho kai tēs mellousēs apokalyptesthai doxēs koinōnos',
   '''Elders'' (presbyterous — presbyters, the appointed leaders of the local church). ''I exhort'' (parakalō — I urge, I encourage; gentle authority). ''Fellow elder'' (sympresbyteros — co-elder, a partner in the same office; Peter does not pull rank as an apostle but identifies as a fellow servant). ''Witness of Christ''s sufferings'' (martys tōn pathēmatōn — an eyewitness of the passion; Peter saw Gethsemane, the arrest, the trial, the crucifixion from afar). ''Partaker of the glory'' (koinōnos tēs doxēs — sharer in the glory to come). Peter speaks from three credentials: shared office (elder), shared experience (witness), and shared hope (partaker).',
   NULL),
  (2,
   'Feed the flock of God which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind;',
   'ποιμάνατε τὸ ἐν ὑμῖν ποίμνιον τοῦ θεοῦ ἐπισκοποῦντες μὴ ἀναγκαστῶς ἀλλ᾽ ἑκουσίως μηδὲ αἰσχροκερδῶς ἀλλὰ προθύμως',
   'poimanate to en hymin poimnion tou theou episkopountes mē anankastōs all'' hekousiōs mēde aischrokerdōs alla prothymōs',
   '''Feed'' (poimanate — shepherd; the verb includes feeding, leading, protecting, tending — the full range of pastoral care). ''Flock of God'' (poimnion tou theou — God''s flock, not yours; the sheep belong to God). ''Taking the oversight'' (episkopountes — overseeing, functioning as bishops/overseers). Three contrasts: (1) ''Not by constraint but willingly'' (mē anankastōs all'' hekousiōs — not from compulsion but from a willing heart). (2) ''Not for filthy lucre but of a ready mind'' (mēde aischrokerdōs alla prothymōs — not for shameful gain but with eager enthusiasm). The motive must be right: willingness, not obligation; service, not salary.',
   'Pastoral leadership: Peter establishes the character of true pastoral ministry. Elders are under-shepherds of God''s flock — the flock belongs to God, not to the elders. Leadership must be willing (not forced), generous (not greedy), and exemplary (not domineering, v.3). The three vices — compulsion, greed, and domination — are the perennial temptations of spiritual leadership.'),
  (3,
   'Neither as being lords over God''s heritage, but being ensamples to the flock.',
   'μηδ᾽ ὡς κατακυριεύοντες τῶν κλήρων ἀλλὰ τύποι γινόμενοι τοῦ ποιμνίου',
   'mēd'' hōs katakurieuontes tōn klērōn alla typoi ginomenoi tou poimniou',
   '''Lords over'' (katakurieuontes — domineering, lording it over, exercising dominion; from kata + kurieuo; the same word Jesus used in Mark 10:42 for Gentile rulers who ''exercise lordship''). ''God''s heritage'' (tōn klērōn — the portions assigned, the allotted charges; from klēros, lot, inheritance; the people entrusted to their care; our word ''clergy'' actually comes from this word which originally meant the people, not the leaders). ''Ensamples'' (typoi — patterns, models, examples to be imitated; from typos, a stamp, an impression). Leadership by example, not by force.',
   NULL),
  (4,
   'And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.',
   'καὶ φανερωθέντος τοῦ ἀρχιποίμενος κομιεῖσθε τὸν ἀμαράντινον τῆς δόξης στέφανον',
   'kai phanerōthentos tou archipoímenos komieisthe ton amarantinon tēs doxēs stephanon',
   '''Chief Shepherd'' (archipoímenos — the arch-shepherd, the chief pastor, the head shepherd; from archi + poimēn; used only here in the NT). Christ is the Chief Shepherd; all pastors are under-shepherds serving under His authority. ''Shall appear'' (phanerōthentos — when He is revealed, at the Second Coming). ''Crown of glory'' (ton tēs doxēs stephanon — the victor''s wreath consisting of glory). ''Fadeth not away'' (amarantinon — unfading, made of amaranth; the legendary flower that never wilts). Unlike earthly crowns that decay, this crown is eternal — it is glory itself fashioned into a reward.',
   'The Chief Shepherd''s reward: Christ is the Chief Shepherd (archipoimēn); all pastors serve under Him and will answer to Him. The crown of glory is the reward for faithful pastoral service — it does not fade because it is made of the substance of heaven. This motivates pastors: earthly ministry may bring little recognition, but the Chief Shepherd will reward faithfulness when He appears.'),
  (5,
   'Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for God resisteth the proud, and giveth grace to the humble.',
   'ὁμοίως νεώτεροι ὑποτάγητε πρεσβυτέροις πάντες δὲ ἀλλήλοις ὑποτασσόμενοι τὴν ταπεινοφροσύνην ἐγκομβώσασθε ὅτι ὁ θεὸς ὑπερηφάνοις ἀντιτάσσεται ταπεινοῖς δὲ δίδωσιν χάριν',
   'homoiōs neōteroi hypotagēte presbyterois pantes de allēlois hypotassomenoi tēn tapeinophrosynēn enkombōsasthe hoti ho theos hyperēphanois antitassetai tapeinois de didōsin charin',
   '''Younger'' (neōteroi — the younger members of the community). ''Submit'' (hypotagēte — place yourselves under). ''All of you'' (pantes — everyone, no exceptions). ''Clothed with humility'' (tēn tapeinophrosynēn enkombōsasthe — tie on humility like a servant''s apron; enkombōsasthe from enkomboomai, to fasten on, to tie around oneself; the enkombōma was a slave''s working garment). The image may echo Jesus washing the disciples'' feet (John 13), when He took a towel (lention) and tied it around Himself. ''God resisteth the proud'' — Peter quotes Prov 3:34, the same verse James cites (James 4:6). The principle is universal: God opposes arrogance and favours humility.',
   NULL),
  (6,
   'Humble yourselves therefore under the mighty hand of God, that he may exalt you in due time:',
   'ταπεινώθητε οὖν ὑπὸ τὴν κραταιὰν χεῖρα τοῦ θεοῦ ἵνα ὑμᾶς ὑψώσῃ ἐν καιρῷ',
   'tapeinōthēte oun hypo tēn krataian cheira tou theou hina hymas hypsōsē en kairō',
   '''Humble yourselves'' (tapeinōthēte — make yourselves low; aorist passive: let yourselves be humbled). ''Mighty hand of God'' (tēn krataian cheira tou theou — the strong, powerful hand of God; an OT phrase for God''s sovereign power in both judgment and deliverance, Exod 3:19; Deut 9:26). ''Exalt you'' (hypsōsē — lift you up, raise you high). ''In due time'' (en kairō — at the right time, at the appropriate moment). The timing of exaltation is God''s, not ours. Our part is to humble ourselves under His hand; His part is to lift us up when the time is right.',
   NULL),
  (7,
   'Casting all your care upon him; for he careth for you.',
   'πᾶσαν τὴν μέριμναν ὑμῶν ἐπιρίψαντες ἐπ᾽ αὐτόν ὅτι αὐτῷ μέλει περὶ ὑμῶν',
   'pasan tēn merimnan hymōn epirípsantes ep'' auton hoti autō melei peri hymōn',
   '''Casting'' (epirípsantes — having thrown upon, having hurled onto; from epi + rhiptō, to throw forcefully upon; aorist participle: make a decisive act of casting). ''All your care'' (pasan tēn merimnan — every anxiety, the whole of your worry; from merimnaō, to be pulled in different directions, to be divided in mind). ''Upon him'' (ep'' auton — onto Him). ''He careth for you'' (autō melei peri hymōn — it matters to Him concerning you; it is a concern to Him about you). The ground of casting anxiety: God actually cares. The word for our ''care'' (merimna — anxious worry) is different from God''s ''care'' (melei — active concern). We worry; He attends to us with purposeful love.',
   'Casting anxiety on God: This is one of the most beloved verses in the NT. The command is to throw — not gently lay but forcefully hurl — every anxiety onto God. The reason: He genuinely cares for you. This is not merely a promise of emotional relief but a theological statement: the sovereign God who controls all things has personal concern for each believer. Anxiety is incompatible with trust in a God who cares.'),
  (8,
   'Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:',
   'νήψατε γρηγορήσατε ὅτι ὁ ἀντίδικος ὑμῶν διάβολος ὡς λέων ὠρυόμενος περιπατεῖ ζητῶν τίνα καταπίῃ',
   'nēpsate grēgorēsate hoti ho antidikos hymōn diabolos hōs leōn ōryomenos peripatei zētōn tina katapiē',
   '''Be sober'' (nēpsate — be clear-headed, free from intoxication). ''Be vigilant'' (grēgorēsate — stay awake, keep watch; from grēgoreō, to be watchful). ''Adversary'' (antidikos — legal opponent, courtroom accuser; from anti + dikē, the one who stands against you in court). ''Devil'' (diabolos — the slanderer, the accuser). ''Roaring lion'' (leōn ōryomenos — a lion that is roaring; the roar of a hunting lion, designed to paralyse prey with fear). ''Walketh about'' (peripatei — prowls around). ''Seeking whom he may devour'' (zētōn tina katapiē — searching for someone to swallow whole; katapiō from kata + pinō, to drink down). The devil is not a myth but a real enemy — personal, active, predatory, and dangerous.',
   'The devil as adversary: Peter gives the Bible''s most vivid portrait of the devil''s activity against believers. He is (1) an adversary — legally opposing us, (2) a slanderer — speaking against us, (3) a roaring lion — terrifying us, (4) prowling — always active, never resting, (5) seeking — targeting specific individuals, (6) devouring — aiming to destroy completely. The remedy: sobriety and vigilance (v.8) and firm resistance (v.9).'),
  (9,
   'Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.',
   'ᾧ ἀντίστητε στερεοὶ τῇ πίστει εἰδότες τὰ αὐτὰ τῶν παθημάτων τῇ ἐν κόσμῳ ὑμῶν ἀδελφότητι ἐπιτελεῖσθαι',
   'hō antistēte stereoi tē pistei eidotes ta auta tōn pathēmatōn tē en kosmō hymōn adelphotēti epiteleisthai',
   '''Resist'' (antistēte — stand against, take your stand; the same word as James 4:7). ''Stedfast'' (stereoi — solid, firm, hard; from stereos, solid as a rock). ''In the faith'' (tē pistei — in your faith, in the faith). ''Same afflictions'' (ta auta tōn pathēmatōn — the very same sufferings). ''Accomplished in your brethren'' (tē adelphotēti epiteleisthai — being completed in your brotherhood throughout the world). You are not alone in suffering. The same enemy attacks the same brotherhood worldwide. This knowledge strengthens: you are part of a global family enduring the same battle.',
   NULL),
  (10,
   'But the God of all grace, who hath called us unto his eternal glory by Christ Jesus, after that ye have suffered a while, make you perfect, stablish, strengthen, settle you.',
   'ὁ δὲ θεὸς πάσης χάριτος ὁ καλέσας ὑμᾶς εἰς τὴν αἰώνιον αὐτοῦ δόξαν ἐν Χριστῷ Ἰησοῦ ὀλίγον παθόντας αὐτὸς καταρτίσει στηρίξει σθενώσει θεμελιώσει',
   'ho de theos pasēs charitos ho kalesas hymas eis tēn aiōnion autou doxan en Christō Iēsou oligon pathontas autos katartisei stērixei sthenōsei themeliōsei',
   '''God of all grace'' (theos pasēs charitos — the God who is the source of every kind of grace). ''Called unto eternal glory'' (kalesas eis tēn aiōnion doxan — the call is to glory, not merely to escape). ''After ye have suffered a while'' (oligon pathontas — having suffered a little, a brief time). Four verbs of restoration: (1) ''Make perfect'' (katartisei — will restore, will mend, will put in order; the word used for mending nets, Matt 4:21). (2) ''Stablish'' (stērixei — will make firm, will fix solidly). (3) ''Strengthen'' (sthenōsei — will make strong, will invigorate). (4) ''Settle'' (themeliōsei — will lay a foundation, will ground securely). God Himself (autos — He personally) will do all four. Suffering is temporary (''a while''); glory is eternal.',
   'God''s fourfold restoration: After the brief suffering, God Himself will personally restore, confirm, strengthen, and establish the believer. The four verbs move from repair to foundation: (1) restore what was damaged, (2) confirm what was shaken, (3) strengthen what was weakened, (4) establish on unshakeable ground. The agent is God Himself; the context is suffering; the destination is eternal glory.'),
  (11,
   'To him be glory and dominion for ever and ever. Amen.',
   'αὐτῷ ἡ δόξα καὶ τὸ κράτος εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'autō hē doxa kai to kratos eis tous aiōnas tōn aiōnōn amēn',
   '''Glory'' (doxa — brightness, splendour, majesty). ''Dominion'' (kratos — might, sovereign power, ruling strength). ''For ever and ever'' (eis tous aiōnas tōn aiōnōn — unto the ages of the ages, into eternity of eternities). ''Amen'' — so be it, it is true, it is settled. A doxology ascribing eternal glory and power to the God who sustains believers through suffering.',
   NULL),
  (12,
   'By Silvanus, a faithful brother unto you, as I suppose, I have written briefly, exhorting, and testifying that this is the true grace of God wherein ye stand.',
   'Διὰ Σιλουανοῦ ὑμῖν τοῦ πιστοῦ ἀδελφοῦ ὡς λογίζομαι δι᾽ ὀλίγων ἔγραψα παρακαλῶν καὶ ἐπιμαρτυρῶν ταύτην εἶναι ἀληθῆ χάριν τοῦ θεοῦ εἰς ἣν ἑστήκατε',
   'Dia Silouanou hymin tou pistou adelphou hōs logizomai di'' oligōn egrapsa parakalōn kai epimartyōn tautēn einai alēthē charin tou theou eis hēn hestēkate',
   '''Silvanus'' (Silouanou — Silas; Paul''s companion in Acts 15-18 and co-author of 1-2 Thessalonians). ''Faithful brother'' (tou pistou adelphou — a trustworthy brother). Silvanus likely served as Peter''s amanuensis (secretary) and letter carrier. ''True grace of God'' (alēthē charin tou theou — the genuine, real grace of God). ''Wherein ye stand'' (eis hēn hestēkate — in which you have taken your stand and continue standing). The summary of the whole letter: what you are experiencing — suffering, persecution, trials — is not a sign that you have fallen from grace but that you are standing in the true grace of God.',
   NULL),
  (13,
   'The church that is at Babylon, elected together with you, saluteth you; and so doth Marcus my son.',
   'ἀσπάζεται ὑμᾶς ἡ ἐν Βαβυλῶνι συνεκλεκτὴ καὶ Μᾶρκος ὁ υἱός μου',
   'aspazetai hymas hē en Babylōni syneklektē kai Markos ho huios mou',
   '''Babylon'' (Babylōni — most scholars identify this as a code name for Rome, just as Revelation uses Babylon for Rome; a few argue for literal Babylon in Mesopotamia). ''Elected together'' (syneklektē — co-chosen, chosen alongside you; the church in Babylon/Rome is elect just as the recipients are elect). ''Marcus my son'' (Markos ho huios mou — John Mark, author of the Gospel of Mark, whom Peter calls ''my son'' — a spiritual father-son relationship). Peter and Mark were closely associated; Mark''s Gospel is traditionally believed to be based on Peter''s preaching.',
   NULL),
  (14,
   'Greet ye one another with a kiss of charity. Peace be with you all that are in Christ Jesus. Amen.',
   'ἀσπάσασθε ἀλλήλους ἐν φιλήματι ἀγάπης εἰρήνη ὑμῖν πᾶσιν τοῖς ἐν Χριστῷ Ἰησοῦ ἀμήν',
   'aspasasthe allēlous en philēmati agapēs eirēnē hymin pasin tois en Christō Iēsou amēn',
   '''Kiss of charity'' (philēmati agapēs — a kiss of love; the standard greeting among early Christians, expressing genuine affection and unity). ''Peace'' (eirēnē — the Jewish shalom, wholeness, well-being, harmony with God). ''In Christ Jesus'' — the sphere of peace is in Christ. The epistle that began with ''grace and peace'' (1:2) ends with peace. After five chapters about suffering, persecution, and the prowling devil, Peter''s final word is peace — the deep, unshakeable peace that belongs to those who are in Christ Jesus.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Peter' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 2 (Feed the flock / willingly)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποιμάνατε', 'poimanate', 'G4165', 'Shepherd, tend, feed, lead, protect — the comprehensive verb for pastoral care. Includes feeding (teaching), leading (guiding), and protecting (guarding from wolves). The word Jesus used to Peter: "Feed my sheep" (John 21:16).', 1),
  ('ἑκουσίως', 'hekousiōs', 'G1596', 'Willingly, voluntarily, of one''s own accord — from hekōn (willing). Pastoral ministry must spring from an inner compulsion of love, not external pressure or obligation. The willing heart is the prerequisite for effective shepherding.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 5 AND v.verse_number = 2;

-- Verse 4 (Chief Shepherd / unfading crown)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀρχιποίμενος', 'archipoímenos', 'G750', 'Chief Shepherd — from archi (chief, first) + poimēn (shepherd). Used only here in the NT. Christ is the head of all pastors, the supreme shepherd over all under-shepherds. Every pastor answers to Him.', 1),
  ('ἀμαράντινον', 'amarantinon', 'G262', 'Unfading, made of amaranth — the legendary flower that never withers. Unlike earthly crowns woven from olive or laurel that quickly wilt, this crown is eternal. Used only here in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 5 AND v.verse_number = 4;

-- Verse 7 (Casting all your care)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μέριμναν', 'merimnan', 'G3308', 'Care, anxiety, worry — from merizō (to divide, to distract). Anxiety is a divided mind, pulled in multiple directions. The believer is to throw this dividing weight onto God and be unified in trust.', 1),
  ('ἐπιρίψαντες', 'epirípsantes', 'G1977', 'Having cast, having thrown upon — from epi (upon) + rhiptō (to throw, to hurl). A decisive, forceful action: hurl your anxieties onto God. Not a gentle laying but a vigorous throwing. Cf. Psalm 55:22, "Cast thy burden upon the LORD."', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 5 AND v.verse_number = 7;

-- Verse 8 (Roaring lion / devour)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀντίδικος', 'antidikos', 'G476', 'Adversary, legal opponent — from anti (against) + dikē (justice, a lawsuit). The devil is the courtroom accuser who brings charges against believers. He is the "accuser of the brethren" (Rev 12:10).', 1),
  ('καταπίῃ', 'katapiē', 'G2666', 'Devour, swallow whole — from kata (down) + pinō (to drink). To gulp down, to consume entirely. The devil''s aim is not merely to wound but to swallow believers whole — total spiritual destruction.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 5 AND v.verse_number = 8;

-- Verse 10 (Perfect, stablish, strengthen, settle)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καταρτίσει', 'katartisei', 'G2675', 'Will perfect, will restore, will mend — from katartizō, to put in order, to mend what is broken. The same word used for mending fishing nets (Matt 4:21). God repairs what suffering has torn.', 1),
  ('θεμελιώσει', 'themeliōsei', 'G2311', 'Will settle, will ground, will lay a foundation — from themelios (foundation). God will establish the believer on an unshakeable base. After the storm of suffering, the foundation is set deeper.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 5 AND v.verse_number = 10;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Feed the flock
  (2, 'John 21:15-17', 1), (2, 'Acts 20:28', 2), (2, 'Ezekiel 34:2-4', 3),
  -- v3: Not lording over but examples
  (3, 'Mark 10:42-45', 1), (3, '2 Corinthians 1:24', 2), (3, '1 Timothy 4:12', 3),
  -- v4: Chief Shepherd / crown of glory
  (4, 'Hebrews 13:20', 1), (4, 'John 10:11', 2), (4, '2 Timothy 4:8', 3),
  -- v5: God resists the proud
  (5, 'James 4:6', 1), (5, 'Proverbs 3:34', 2), (5, 'John 13:4-5', 3),
  -- v6: Humble under God''s mighty hand
  (6, 'James 4:10', 1), (6, 'Luke 14:11', 2), (6, 'Deuteronomy 8:2-3', 3),
  -- v7: Casting care upon God
  (7, 'Psalm 55:22', 1), (7, 'Philippians 4:6-7', 2), (7, 'Matthew 6:25-34', 3),
  -- v8: Devil as roaring lion
  (8, 'Ephesians 6:11-12', 1), (8, 'Revelation 12:10', 2), (8, 'Job 1:7', 3),
  -- v9: Resist the devil
  (9, 'James 4:7', 1), (9, 'Ephesians 6:13', 2), (9, '1 Corinthians 10:13', 3),
  -- v10: God of all grace will perfect you
  (10, 'Romans 8:28-30', 1), (10, '2 Corinthians 4:17', 2), (10, 'Hebrews 13:21', 3),
  -- v12: True grace of God
  (12, 'Acts 15:40', 1), (12, '2 Corinthians 1:24', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Peter Chapter 5 Complete
-- 14 verses · 5 key verses with word studies (10 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════