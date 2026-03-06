-- ═══════════════════════════════════════════════════
-- 2 JOHN CHAPTER 1 — Truth, Love & Guarding the Faith
-- 13 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'The shortest book in the Bible by word count, 2 John is a personal letter from ''the elder'' (John) to ''the elect lady and her children'' — either a specific Christian woman and her family, or a personified local church. The letter has two themes held in tension: love and truth. John commands believers to walk in love (v.6) and in truth (v.4), but warns that love must not override discernment. False teachers who deny Christ''s incarnation must not be welcomed into the home or given a platform (vv.10-11). This short letter is a vital corrective against a naïve tolerance that endangers the Gospel.',
  'Walking in Truth and Love While Guarding Against Deceivers',
  'ἀλήθεια (alētheia)',
  'Truth — objective, divine reality as revealed in Christ and the apostolic message. Used 5 times in this short letter, more per word than any other NT book.',
  '["Greeting (vv.1-3): The elder to the elect lady — love in truth","Commendation (v.4): Walking in truth","The Command (vv.5-6): Love one another — the old-new commandment","The Warning (vv.7-9): Deceivers who deny Christ''s incarnation","The Prohibition (vv.10-11): Do not receive false teachers","Closing (vv.12-13): Hope to visit; greetings"]'
FROM books b WHERE b.name = '2 John';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'The elder unto the elect lady and her children, whom I love in the truth; and not I only, but also all they that have known the truth;',
   'Ὁ πρεσβύτερος ἐκλεκτῇ κυρίᾳ καὶ τοῖς τέκνοις αὐτῆς οὓς ἐγὼ ἀγαπῶ ἐν ἀληθείᾳ καὶ οὐκ ἐγὼ μόνος ἀλλὰ καὶ πάντες οἱ ἐγνωκότες τὴν ἀλήθειαν',
   'Ho presbyteros eklektē kyria kai tois teknois autēs hous egō agapō en alētheia kai ouk egō monos alla kai pantes hoi egnōkotes tēn alētheian',
   '''The elder'' (ho presbyteros) — John identifies himself by age and pastoral office rather than by apostolic title, conveying warmth and authority. ''Elect lady'' (eklektē kyria) could be a proper name (Electa or Kyria), a specific woman, or a figurative title for a local church — the matter is debated. ''In the truth'' (en alētheia) — not merely ''truly/sincerely'' but ''in the sphere of divine truth.'' Love and truth are inseparable in John''s thought.',
   NULL),
  (2,
   'For the truth''s sake, which dwelleth in us, and shall be with us for ever.',
   'διὰ τὴν ἀλήθειαν τὴν μένουσαν ἐν ἡμῖν καὶ μεθ᾽ ἡμῶν ἔσται εἰς τὸν αἰῶνα',
   'dia tēn alētheian tēn menousan en hēmin kai meth'' hēmōn estai eis ton aiōna',
   'Truth is not external information but an indwelling reality — it ''dwells'' (menousan — abides, remains permanently) in believers. And it ''shall be with us for ever'' (eis ton aiōna) — truth is eternal because God is truth. This echoes Jesus'' promise that the Spirit of truth would abide with believers forever (John 14:16-17).',
   NULL),
  (3,
   'Grace be with you, mercy, and peace, from God the Father, and from the Lord Jesus Christ, the Son of the Father, in truth and love.',
   'ἔσται μεθ᾽ ἡμῶν χάρις ἔλεος εἰρήνη παρὰ θεοῦ πατρὸς καὶ παρὰ κυρίου Ἰησοῦ Χριστοῦ τοῦ υἱοῦ τοῦ πατρὸς ἐν ἀληθείᾳ καὶ ἀγάπῃ',
   'estai meth'' hēmōn charis eleos eirēnē para theou patros kai para kyriou Iēsou Christou tou huiou tou patros en alētheia kai agapē',
   'Uniquely, John says grace ''shall be'' (estai — future indicative) rather than the usual ''grace to you'' (optative wish). It is a declaration, not merely a wish. The triad ''grace, mercy, peace'' adds ''mercy'' (eleos) to Paul''s usual ''grace and peace.'' ''The Son of the Father'' — an unusual expression emphasising the Father-Son relationship, directly relevant to the Christological heresy John combats.',
   'The full title ''the Lord Jesus Christ, the Son of the Father'' affirms Christ''s deity, lordship, messianic identity, and eternal Sonship — every element the false teachers denied.'),
  (4,
   'I rejoiced greatly that I found of thy children walking in truth, as we have received a commandment from the Father.',
   'ἐχάρην λίαν ὅτι εὕρηκα ἐκ τῶν τέκνων σου περιπατοῦντας ἐν ἀληθείᾳ καθὼς ἐντολὴν ἐλάβομεν παρὰ τοῦ πατρός',
   'echarēn lian hoti heurēka ek tōn teknōn sou peripatountas en alētheia kathōs entolēn elabomen para tou patros',
   '''Walking'' (peripatountas) — the Hebrew/Greek metaphor for daily conduct and lifestyle. ''In truth'' is not just believing correct doctrine but living it out. ''Of thy children'' (ek tōn teknōn — some of your children) may imply that not all were walking faithfully, hinting at the problem addressed later. John found this out, possibly through travelling missionaries.',
   NULL),
  (5,
   'And now I beseech thee, lady, not as though I wrote a new commandment unto thee, but that which we had from the beginning, that we love one another.',
   'καὶ νῦν ἐρωτῶ σε κυρία οὐχ ὡς ἐντολὴν γράφων σοι καινὴν ἀλλὰ ἣν εἴχομεν ἀπ᾽ ἀρχῆς ἵνα ἀγαπῶμεν ἀλλήλους',
   'kai nyn erōtō se kyria ouch hōs entolēn graphōn soi kainēn alla hēn eichomen ap'' archēs hina agapōmen allēlous',
   'This echoes 1 John 2:7-8 and John 13:34-35. The commandment to love is both old (''from the beginning'') and ever fresh. ''Beseech'' (erōtō — ask, request) is gentler than ''command'' — John uses the same pastoral approach as Paul in Philemon. Love is not a new idea but the foundational command of Jesus Himself.',
   NULL),
  (6,
   'And this is love, that we walk after his commandments. This is the commandment, That, as ye have heard from the beginning, ye should walk in it.',
   'καὶ αὕτη ἐστὶν ἡ ἀγάπη ἵνα περιπατῶμεν κατὰ τὰς ἐντολὰς αὐτοῦ αὕτη ἐστὶν ἡ ἐντολή καθὼς ἠκούσατε ἀπ᾽ ἀρχῆς ἵνα ἐν αὐτῇ περιπατῆτε',
   'kai hautē estin hē agapē hina peripatōmen kata tas entolas autou hautē estin hē entolē kathōs ēkousate ap'' archēs hina en autē peripatēte',
   'John defines love as obedience — not mere emotion but covenant faithfulness expressed through keeping God''s commands. This is a circular definition by design: love leads to obedience; the command is to walk in love. Love and obedience are inseparable in Johannine theology (cf. John 14:15, 1 John 5:3).',
   'Biblical love is defined by God''s commands, not by human sentiment. ''Love'' that violates God''s truth is not genuine love. This principle becomes crucial in vv.10-11, where John shows that true love requires excluding false teachers.'),
  (7,
   'For many deceivers are entered into the world, who confess not that Jesus Christ is come in the flesh. This is a deceiver and an antichrist.',
   'ὅτι πολλοὶ πλάνοι εἰσῆλθον εἰς τὸν κόσμον οἱ μὴ ὁμολογοῦντες Ἰησοῦν Χριστὸν ἐρχόμενον ἐν σαρκί οὗτός ἐστιν ὁ πλάνος καὶ ὁ ἀντίχριστος',
   'hoti polloi planoi eisēlthon eis ton kosmon hoi mē homologountes Iēsoun Christon erchomenon en sarki houtos estin ho planos kai ho antichristos',
   'The specific heresy: denying that Jesus Christ ''is come in the flesh'' (erchomenon en sarki — present participle, emphasising the ongoing reality of the incarnation). Early Gnostic teachers (like Cerinthus) claimed Christ only appeared to have a body, or that the divine Christ departed before the crucifixion. John labels this flatly: ''deceiver'' (planos) and ''antichrist'' (antichristos). The definite article (''THE deceiver... THE antichrist'') shows this is the spirit of the ultimate Antichrist already at work.',
   'The incarnation is non-negotiable. If Christ did not truly come in the flesh, He could not truly die, and if He did not truly die, there is no atonement. To deny the incarnation is to destroy the Gospel entirely.'),
  (8,
   'Look to yourselves, that we lose not those things which we have wrought, but that we receive a full reward.',
   'βλέπετε ἑαυτούς ἵνα μὴ ἀπολέσωμεν ἃ εἰργασάμεθα ἀλλὰ μισθὸν πλήρη ἀπολάβωμεν',
   'blepete heautous hina mē apolesōmen ha eirgasametha alla misthon plērē apolabōmen',
   '''Look to yourselves'' (blepete heautous) — a sharp warning to self-examination. ''Full reward'' (misthon plērē) — believers can lose rewards (not salvation) through doctrinal carelessness. The ''we'' (eirgasametha — we have worked) includes John himself and the recipients — their shared labour in the Gospel could be undermined by entertaining false teaching.',
   NULL),
  (9,
   'Whosoever transgresseth, and abideth not in the doctrine of Christ, hath not God. He that abideth in the doctrine of Christ, he hath both the Father and the Son.',
   'πᾶς ὁ παραβαίνων καὶ μὴ μένων ἐν τῇ διδαχῇ τοῦ Χριστοῦ θεὸν οὐκ ἔχει ὁ μένων ἐν τῇ διδαχῇ οὗτος καὶ τὸν πατέρα καὶ τὸν υἱὸν ἔχει',
   'pas ho parabainōn kai mē menōn en tē didachē tou Christou theon ouk echei ho menōn en tē didachē houtos kai ton patera kai ton huion echei',
   '''Transgresseth'' (parabainōn — going beyond, overstepping) describes those who ''progress'' beyond apostolic teaching into supposed deeper knowledge. ''Abideth'' (menōn — remains, stays) is John''s characteristic word for perseverance. The test is stark: whoever does not remain in the doctrine of Christ does not have God at all. Conversely, the one who abides has ''both the Father and the Son'' — you cannot have one without the other.',
   'Doctrine matters eternally. This verse demolishes the idea that theology is unimportant as long as one is ''spiritual.'' To abandon the apostolic teaching about Christ is to lose God Himself. There is no access to the Father except through the Son (John 14:6).'),
  (10,
   'If there come any unto you, and bring not this doctrine, receive him not into your house, neither bid him God speed:',
   'εἴ τις ἔρχεται πρὸς ὑμᾶς καὶ ταύτην τὴν διδαχὴν οὐ φέρει μὴ λαμβάνετε αὐτὸν εἰς οἰκίαν καὶ χαίρειν αὐτῷ μὴ λέγετε',
   'ei tis erchetai pros hymas kai tautēn tēn didachēn ou pherei mē lambanete auton eis oikian kai chairein autō mē legete',
   'The practical application: false teachers must not be welcomed into the house (oikia — likely the house church where they would gain a platform) or given the greeting ''chairein'' (rejoice/hail — the standard greeting that expressed solidarity). This is not about being rude to strangers but about refusing to provide a base of operations for those who actively deny Christ''s incarnation.',
   'Christian love has boundaries. Welcoming false teachers who deny core doctrine is not love but complicity. The command to love (v.5) and the command to exclude (v.10) are not contradictory — both serve to protect the flock and honour Christ.'),
  (11,
   'For he that biddeth him God speed is partaker of his evil deeds.',
   'ὁ λέγων γὰρ αὐτῷ χαίρειν κοινωνεῖ τοῖς ἔργοις αὐτοῦ τοῖς πονηροῖς',
   'ho legōn gar autō chairein koinōnei tois ergois autou tois ponērois',
   '''Partaker'' (koinōnei — shares in, has fellowship with) — the same root as koinōnia (fellowship). To welcome a false teacher is to become a partner in his destructive work. The principle of guilt by association applies when the association is voluntary and supportive. Paul teaches the same (1 Tim 5:22, Eph 5:11).',
   NULL),
  (12,
   'Having many things to write unto you, I would not write with paper and ink: but I trust to come unto you, and speak face to face, that our joy may be full.',
   'πολλὰ ἔχων ὑμῖν γράφειν οὐκ ἐβουλήθην διὰ χάρτου καὶ μέλανος ἀλλὰ ἐλπίζω γενέσθαι πρὸς ὑμᾶς καὶ στόμα πρὸς στόμα λαλῆσαι ἵνα ἡ χαρὰ ἡμῶν ᾖ πεπληρωμένη',
   'polla echōn hymin graphein ouk eboulēthēn dia chartou kai melanos alla elpizō genesthai pros hymas kai stoma pros stoma lalēsai hina hē chara hēmōn ē peplērōmenē',
   '''Paper'' (chartou — papyrus) and ''ink'' (melanos — black liquid) — a rare glimpse into first-century letter writing. ''Face to face'' (stoma pros stoma — literally ''mouth to mouth'') reflects the Hebrew idiom of Numbers 12:8. ''Full joy'' (chara peplērōmenē) echoes John 15:11 and 1 John 1:4 — joy is completed in personal fellowship.',
   NULL),
  (13,
   'The children of thy elect sister greet thee. Amen.',
   'ἀσπάζεταί σε τὰ τέκνα τῆς ἀδελφῆς σου τῆς ἐκλεκτῆς ἀμήν',
   'aspazetai se ta tekna tēs adelphēs sou tēs eklektēs amēn',
   '''Elect sister'' (adelphēs eklektēs) — if ''the elect lady'' is a church, then ''her elect sister'' is another church (likely where John is writing from). If individuals, it is literally Philemon''s sister. Either way, the word ''elect'' (eklektēs — chosen by God) frames the entire letter: the opening and closing both emphasise divine election, reminding the readers that their identity is grounded in God''s sovereign choice.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 John' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1 (Elder, elect, truth)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πρεσβύτερος', 'presbyteros', 'G4245', 'Elder — one who is older; a church leader/overseer. John uses this title rather than ''apostle,'' conveying pastoral warmth.', 1),
  ('ἐκλεκτῇ', 'eklektē', 'G1588', 'Elect, chosen — selected by God. Whether a person or church, the emphasis is on divine sovereign choice.', 2),
  ('ἀληθείᾳ', 'alētheia', 'G225', 'Truth — objective divine reality revealed in Christ. Appears 5 times in 13 verses, dominating the letter.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 John' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 6 (Love and commandments)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγάπη', 'agapē', 'G26', 'Love — selfless, covenantal love defined by action and obedience, not emotion alone.', 1),
  ('ἐντολάς', 'entolas', 'G1785', 'Commandments — divine instructions. Love is expressed through obedience to God''s commands.', 2),
  ('περιπατῶμεν', 'peripatōmen', 'G4043', 'Walk — to conduct one''s life, daily behaviour. A metaphor for the whole pattern of living.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 John' AND c.chapter_number = 1 AND v.verse_number = 6;

-- Verse 7 (Deceiver and antichrist)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πλάνοι', 'planoi', 'G4108', 'Deceivers — those who lead astray, wanderers who cause others to wander from the truth.', 1),
  ('ὁμολογοῦντες', 'homologountes', 'G3670', 'Confessing — to say the same thing as, to agree with, to publicly declare. The false teachers refuse to confess the incarnation.', 2),
  ('ἐρχόμενον ἐν σαρκί', 'erchomenon en sarki', 'G2064/G4561', 'Coming in the flesh — present participle: the ongoing reality that Jesus Christ exists in a real human body.', 3),
  ('ἀντίχριστος', 'antichristos', 'G500', 'Antichrist — one who stands against (anti) Christ or in place of Christ. Both opposition and substitution.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 John' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 9 (Abiding in doctrine)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παραβαίνων', 'parabainōn', 'G3845', 'Transgresseth — to go beyond, overstep boundaries. Those who claim to ''advance'' beyond Christ''s teaching actually regress.', 1),
  ('μένων', 'menōn', 'G3306', 'Abiding, remaining, staying — John''s signature word for perseverance in relationship with Christ and His teaching.', 2),
  ('διδαχῇ', 'didachē', 'G1322', 'Doctrine, teaching — the body of apostolic instruction about Christ. Not abstract theology but saving truth.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 John' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 10 (Do not receive)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λαμβάνετε', 'lambanete', 'G2983', 'Receive, take in, welcome — do not offer hospitality or a platform to false teachers.', 1),
  ('χαίρειν', 'chairein', 'G5463', 'Hail, rejoice, greeting — the standard greeting of solidarity. Withholding it signals refusal of fellowship.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 John' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Elder and truth
  (1, '3 John 1:1', 1), (1, '1 Peter 5:1', 2), (1, '1 Peter 1:2', 3),
  -- v2: Truth abides
  (2, 'John 14:16-17', 1), (2, '1 John 2:27', 2),
  -- v3: Grace, mercy, peace
  (3, '1 Timothy 1:2', 1), (3, '2 Timothy 1:2', 2), (3, 'Jude 1:2', 3),
  -- v4: Walking in truth
  (4, '3 John 1:3-4', 1), (4, 'Psalm 86:11', 2), (4, 'John 8:31-32', 3),
  -- v5: Love one another
  (5, 'John 13:34-35', 1), (5, '1 John 2:7-8', 2), (5, '1 John 3:11', 3),
  -- v6: Love = obedience
  (6, 'John 14:15', 1), (6, '1 John 5:3', 2), (6, 'John 15:10', 3),
  -- v7: Deceivers and antichrist
  (7, '1 John 4:1-3', 1), (7, '1 John 2:18-22', 2), (7, '1 Timothy 4:1', 3), (7, 'Matthew 24:24', 4),
  -- v8: Full reward
  (8, '1 Corinthians 3:14-15', 1), (8, 'Colossians 2:18', 2), (8, 'Hebrews 10:35', 3),
  -- v9: Abiding in doctrine
  (9, '1 John 2:23-24', 1), (9, 'John 14:6', 2), (9, 'John 5:23', 3), (9, '1 John 5:12', 4),
  -- v10: Do not receive
  (10, 'Romans 16:17', 1), (10, '2 Thessalonians 3:6', 2), (10, 'Titus 3:10', 3), (10, 'Galatians 1:8-9', 4),
  -- v11: Partaker of evil
  (11, '1 Timothy 5:22', 1), (11, 'Ephesians 5:11', 2), (11, '2 Corinthians 6:14', 3),
  -- v12: Face to face
  (12, '3 John 1:13-14', 1), (12, '1 John 1:4', 2), (12, 'John 15:11', 3), (12, 'Numbers 12:8', 4),
  -- v13: Elect sister
  (13, '1 Peter 5:13', 1), (13, '1 Peter 1:1-2', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 John' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ 2 John Chapter 1 Complete!
-- 13 verses · 5 key verses with word studies (15 words)
-- Cross-references for 13 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════