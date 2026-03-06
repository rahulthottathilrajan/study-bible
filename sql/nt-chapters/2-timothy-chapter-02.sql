-- ═══════════════════════════════════════════════════
-- 2 TIMOTHY CHAPTER 2 — A Workman Approved unto God
-- 26 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Second Timothy 2 is Paul''s call for Timothy to be strong in grace and faithful in ministry despite suffering and opposition. The chapter is built around a series of vivid metaphors: Timothy must be a teacher who transmits truth to faithful men (v.2), a soldier who avoids civilian entanglements (v.4), an athlete who competes lawfully (v.5), a farmer who labours before reaping (v.6), a workman who rightly divides the word (v.15), and a vessel purged for the master''s use (v.21). Woven through these images is the ''faithful saying'' (vv.11-13): if we die with Him we shall live; if we suffer we shall reign; if we deny Him He will deny us; if we believe not, He abideth faithful. Paul also warns against false teaching — Hymenaeus and Philetus who teach the resurrection is past — and counsels gentle correction of opponents, for ''God peradventure will give them repentance.''',
  'Faithful Endurance & Handling Truth Rightly',
  'ὀρθοτομέω (orthotomeō)',
  'To cut straight, handle correctly, rightly divide — from orthos (straight) + temnō (to cut). To cut a straight path through the word of truth, accurately interpreting and applying it without distortion.',
  '["Be Strong in Grace (vv.1-2): Strengthened by grace; commit to faithful men who shall teach others","Three Metaphors of Endurance (vv.3-7): Soldier — endure hardship, avoid civilian affairs; athlete — compete lawfully; farmer — labour first, then reap","The Faithful Saying (vv.8-13): Remember Jesus Christ risen; Paul suffers but the word is not bound; if we die, we live; He abides faithful","A Workman Approved (vv.14-19): Study to show yourself approved; rightly dividing the word; avoid profane babblings; Hymenaeus and Philetus; God''s firm foundation","Vessels of Honour (vv.20-22): Purge yourself from dishonour; flee youthful lusts; follow righteousness, faith, love, peace","Gentle Correction (vv.23-26): Avoid foolish questions; the servant of the Lord must not strive; in meekness instruct opponents; God may give them repentance"]'
FROM books b WHERE b.name = '2 Timothy';

-- Step 2: Insert all 26 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Thou therefore, my son, be strong in the grace that is in Christ Jesus.',
   'Σὺ οὖν τέκνον μου ἐνδυναμοῦ ἐν τῇ χάριτι τῇ ἐν Χριστῷ Ἰησοῦ',
   'Sy oun teknon mou endynamou en tē chariti tē en Christō Iēsou',
   '''Be strong'' (endynamou — be empowered, be strengthened; present passive imperative: keep being made strong by grace). The source of strength is not Timothy''s willpower but ''the grace that is in Christ Jesus.'' After the discouraging news of mass desertion (1:15), Paul does not say ''try harder'' but ''be empowered by grace.'' This is the keynote of the chapter: divine enablement for faithful ministry.',
   NULL),
  (2,
   'And the things that thou hast heard of me among many witnesses, the same commit thou to faithful men, who shall be able to teach others also.',
   'καὶ ἃ ἤκουσας παρ᾽ ἐμοῦ διὰ πολλῶν μαρτύρων ταῦτα παράθου πιστοῖς ἀνθρώποις οἵτινες ἱκανοὶ ἔσονται καὶ ἑτέρους διδάξαι',
   'kai ha ēkousas par'' emou dia pollōn martyrōn tauta parathou pistois anthrōpois hoitines hikanoi esontai kai heterous didaxai',
   '''Commit'' (parathou — deposit, entrust; same root as parathēkē in 1:12,14). Four generations of transmission: (1) Paul → (2) Timothy → (3) faithful men → (4) others also. This is the apostolic strategy for doctrinal preservation: not institutional hierarchies alone but the chain of faithful, competent teachers. Two qualifications for the recipients: ''faithful'' (pistois — trustworthy, reliable) and ''able to teach'' (hikanoi didaxai — competent to instruct). Character and competence together.',
   'Apostolic succession of teaching: The true succession is not of office but of doctrine. Paul entrusts the deposit to Timothy, who entrusts it to faithful teachers, who teach others. The chain is doctrinal, not merely institutional. When the chain breaks — when unfaithful or incompetent teachers enter — the apostolic teaching is corrupted.'),
  (3,
   'Thou therefore endure hardness, as a good soldier of Jesus Christ.',
   'σὺ οὖν κακοπάθησον ὡς καλὸς στρατιώτης Ἰησοῦ Χριστοῦ',
   'sy oun kakopathēson hōs kalos stratiōtēs Iēsou Christou',
   '''Endure hardness'' (kakopathēson — suffer hardship, endure evil; from kakos [evil] + pathos [suffering]). ''Good soldier'' (kalos stratiōtēs — noble, excellent soldier). The Christian minister is under military orders. Suffering is not an anomaly but standard-issue equipment for a soldier of Christ. Paul uses military language throughout: the whole Christian life is spiritual warfare (Eph 6:10-18; 1 Tim 1:18).',
   NULL),
  (4,
   'No man that warreth entangleth himself with the affairs of this life; that he may please him who hath chosen him to be a soldier.',
   'οὐδεὶς στρατευόμενος ἐμπλέκεται ταῖς τοῦ βίου πραγματείαις ἵνα τῷ στρατολογήσαντι ἀρέσῃ',
   'oudeis strateuomenos empleketai tais tou biou pragmateiais hina tō stratologēsanti aresē',
   '''Entangleth'' (empleketai — becomes entangled, gets woven into; from en [in] + plekō [to weave, braid]). ''Affairs of this life'' (tou biou pragmateiais — the business dealings and pursuits of daily civilian life). A soldier on active duty cannot run a shop on the side. ''Please him who hath chosen him'' (tō stratologēsanti aresē — satisfy the recruiting officer). The principle: single-minded devotion to the Commander''s mission. Not that all earthly business is wrong, but that the minister''s primary allegiance must be undivided.',
   NULL),
  (5,
   'And if a man also strive for masteries, yet is he not crowned, except he strive lawfully.',
   'ἐὰν δὲ καὶ ἀθλῇ τις οὐ στεφανοῦται ἐὰν μὴ νομίμως ἀθλήσῃ',
   'ean de kai athlē tis ou stephanoutai ean mē nomimōs athlēsē',
   '''Strive for masteries'' (athlē — compete as an athlete; root of English ''athlete''). ''Crowned'' (stephanoutai — receive the victory wreath, the stephanos). ''Lawfully'' (nomimōs — according to the rules). An athlete who breaks the rules is disqualified regardless of performance. The analogy: ministerial effectiveness is not measured by results alone but by faithful obedience to God''s rules. Method matters, not just outcomes.',
   NULL),
  (6,
   'The husbandman that laboureth must be first partaker of the fruits.',
   'τὸν κοπιῶντα γεωργὸν δεῖ πρῶτον τῶν καρπῶν μεταλαμβάνειν',
   'ton kopiōnta geōrgon dei prōton tōn karpōn metalambanein',
   '''Husbandman'' (geōrgon — farmer). ''That laboureth'' (kopiōnta — toils, works to exhaustion). ''First partaker'' (prōton metalambanein — first to share, have first claim). The hard-working farmer eats before others — he has earned the first taste. Application: the faithful minister who labours in the word is entitled to sustenance (1 Cor 9:7-11; 1 Tim 5:17-18). There is also a spiritual principle: the teacher must first feed on the truth before feeding others.',
   NULL),
  (7,
   'Consider what I say; and the Lord give thee understanding in all things.',
   'νόει ὃ λέγω δῴη γάρ σοι ὁ κύριος σύνεσιν ἐν πᾶσιν',
   'noei ho legō dōē gar soi ho kyrios synesin en pasin',
   '''Consider'' (noei — think over, ponder, use your mind; present imperative: keep reflecting). ''Understanding'' (synesin — insight, comprehension, the ability to put things together). Paul pairs human reflection with divine illumination: Timothy must think (noei), and the Lord will give understanding (synesin). Both are necessary — lazy minds are not illuminated, but neither is mere intellect sufficient without the Spirit''s light.',
   NULL),
  (8,
   'Remember that Jesus Christ of the seed of David was raised from the dead according to my gospel:',
   'μνημόνευε Ἰησοῦν Χριστὸν ἐγηγερμένον ἐκ νεκρῶν ἐκ σπέρματος Δαυίδ κατὰ τὸ εὐαγγέλιόν μου',
   'mnēmoneue Iēsoun Christon egēgermenon ek nekrōn ek spermatos Dauid kata to euangelion mou',
   '''Remember'' (mnēmoneue — keep in memory, hold in mind; present imperative: continually remember). Two facts about Jesus Christ: (1) ''of the seed of David'' — His humanity, His messianic identity, His fulfilment of OT prophecy; (2) ''raised from the dead'' (egēgermenon — perfect tense: He was raised and remains risen). These are the twin pillars of the gospel: incarnation and resurrection. ''My gospel'' — Paul''s personal appropriation of the universal message.',
   NULL),
  (9,
   'Wherein I suffer trouble, as an evil doer, even unto bonds; but the word of God is not bound.',
   'ἐν ᾧ κακοπαθῶ μέχρι δεσμῶν ὡς κακοῦργος ἀλλ᾽ ὁ λόγος τοῦ θεοῦ οὐ δέδεται',
   'en hō kakopathō mechri desmōn hōs kakourgos all'' ho logos tou theou ou dedetai',
   '''I suffer trouble'' (kakopathō — I suffer hardship; same root as v.3). ''As an evil doer'' (hōs kakourgos — as a criminal; the word used for the malefactors crucified with Christ, Luke 23:32-33). ''Even unto bonds'' (mechri desmōn — to the point of chains). ''But the word of God is not bound'' (ho logos tou theou ou dedetai — perfect tense: the word is not in a state of bondage). The apostle is chained; the message is free. Prisons cannot contain truth. This is the paradox of gospel ministry: the messenger may be silenced, but the message is unstoppable.',
   NULL),
  (10,
   'Therefore I endure all things for the elect''s sakes, that they may also obtain the salvation which is in Christ Jesus with eternal glory.',
   'διὰ τοῦτο πάντα ὑπομένω διὰ τοὺς ἐκλεκτούς ἵνα καὶ αὐτοὶ σωτηρίας τύχωσιν τῆς ἐν Χριστῷ Ἰησοῦ μετὰ δόξης αἰωνίου',
   'dia touto panta hypomenō dia tous eklektous hina kai autoi sōtērias tychōsin tēs en Christō Iēsou meta doxēs aiōniou',
   '''I endure'' (hypomenō — bear up under, remain steadfast). ''For the elect''s sakes'' (dia tous eklektous — for the sake of the chosen ones). Paul suffers so that God''s chosen people might hear the gospel and be saved. ''With eternal glory'' (meta doxēs aiōniou) — the salvation is not merely rescue from sin but entrance into everlasting glory. Paul''s suffering is purposeful: it serves God''s electing purpose by bringing the gospel to those God has chosen.',
   NULL),
  (11,
   'It is a faithful saying: For if we be dead with him, we shall also live with him:',
   'πιστὸς ὁ λόγος εἰ γὰρ συναπεθάνομεν καὶ συζήσομεν',
   'pistos ho logos ei gar synapethanomen kai syzēsomen',
   '''Faithful saying'' (pistos ho logos — trustworthy is the word; a formula found five times in the Pastoral Epistles introducing a reliable doctrinal summary). What follows (vv.11b-13) is likely an early Christian hymn or creedal statement. ''If we be dead with him'' (synapethanomen — co-died; aorist: a past, decisive event at conversion/baptism). ''We shall also live with him'' (syzēsomen — co-live; future: the promise of resurrection life). Death with Christ guarantees life with Christ.',
   NULL),
  (12,
   'If we suffer, we shall also reign with him: if we deny him, he also will deny us:',
   'εἰ ὑπομένομεν καὶ συμβασιλεύσομεν εἰ ἀρνησόμεθα κἀκεῖνος ἀρνήσεται ἡμᾶς',
   'ei hypomenomen kai symbasileusomen ei arnēsometha kakeinos arnēsetai hēmas',
   '''If we suffer'' (hypomenomen — if we endure; present tense: ongoing endurance). ''We shall reign with him'' (symbasileusomen — co-reign). Suffering now; reigning later. ''If we deny him'' (arnēsometha — disown, repudiate, renounce). ''He also will deny us'' (arnēsetai hēmas — He will disown us). This echoes Christ''s own warning (Matt 10:33; Mark 8:38). Denial is not a momentary lapse (cf. Peter) but settled, persistent repudiation of Christ.',
   NULL),
  (13,
   'If we believe not, yet he abideth faithful: he cannot deny himself.',
   'εἰ ἀπιστοῦμεν ἐκεῖνος πιστὸς μένει ἀρνήσασθαι γὰρ ἑαυτὸν οὐ δύναται',
   'ei apistoumen ekeinos pistos menei arnēsasthai gar heauton ou dynatai',
   '''If we believe not'' (apistoumen — are faithless, prove unfaithful). ''He abideth faithful'' (pistos menei — remains faithful, continues trustworthy). ''He cannot deny himself'' (arnēsasthai heauton ou dynatai — it is impossible for Him to contradict His own nature). This is not a promise that unbelief has no consequences (v.12 already stated the consequence of denial). Rather, God''s faithfulness is rooted in His unchangeable nature. He will keep His promises — both promises of blessing and promises of judgment — because He cannot be untrue to Himself.',
   'The immutability of God: God''s faithfulness is grounded in His nature, not in human response. He does not change based on our faithfulness or faithlessness. This is both comforting (He keeps His saving promises) and sobering (He keeps His warnings too). He cannot deny Himself — His character is the ultimate bedrock of reality.'),
  (14,
   'Of these things put them in remembrance, charging them before the Lord that they strive not about words to no profit, but to the subverting of the hearers.',
   'ταῦτα ὑπομίμνῃσκε διαμαρτυρόμενος ἐνώπιον τοῦ κυρίου μὴ λογομαχεῖν ἐπ᾽ οὐδὲν χρήσιμον ἐπὶ καταστροφῇ τῶν ἀκουόντων',
   'tauta hypomimnēske diamartyromenos enōpion tou kyriou mē logomachein ep'' ouden chrēsimon epi katastrophē tōn akouontōn',
   '''Strive about words'' (logomachein — word-fighting, quarrelling about terminology; from logos [word] + machomai [to fight]). ''No profit'' (ouden chrēsimon — useful for nothing). ''Subverting'' (katastrophē — catastrophe, ruin, overturning; root of English ''catastrophe''). Word-wars are not harmless — they actively destroy the hearers. Paul distinguishes between fighting for truth (necessary) and fighting over words (destructive). The issue is not whether doctrine matters (it does) but whether the dispute is substantial or merely verbal.',
   NULL),
  (15,
   'Study to shew thyself approved unto God, a workman that needeth not to be ashamed, rightly dividing the word of truth.',
   'σπούδασον σεαυτὸν δόκιμον παραστῆσαι τῷ θεῷ ἐργάτην ἀνεπαίσχυντον ὀρθοτομοῦντα τὸν λόγον τῆς ἀληθείας',
   'spoudason seauton dokimon parastēsai tō theō ergatēn anepaischynton orthotomonta ton logon tēs alētheias',
   '''Study'' (spoudason — be diligent, make every effort, give zealous attention; aorist imperative: act with urgency). ''Approved'' (dokimon — tested and approved, proven genuine; like metal tested by fire). ''Workman'' (ergatēn — labourer, craftsman). ''Needeth not to be ashamed'' (anepaischynton — unashamed; the opposite of the shame Paul warns against throughout this letter). ''Rightly dividing'' (orthotomonta — cutting straight, handling accurately; from orthos [straight] + temnō [to cut]). The word of truth must be cut straight — accurately interpreted and faithfully applied — not twisted or mishandled.',
   'The minister''s chief responsibility: accurate handling of Scripture. ''Rightly dividing'' does not mean cutting the Bible into disconnected pieces but cutting a straight path through it — interpreting correctly, applying faithfully, teaching clearly. The workman''s accountability is to God, not to popular opinion.'),
  (16,
   'But shun profane and vain babblings: for they will increase unto more ungodliness.',
   'τὰς δὲ βεβήλους κενοφωνίας περιΐστασο ἐπὶ πλεῖον γὰρ προκόψουσιν ἀσεβείας',
   'tas de bebēlous kenophōnias periistaso epi pleion gar prokopsousin asebeias',
   '''Shun'' (periistaso — stand clear of, avoid, give a wide berth to). ''Profane'' (bebēlous — unhallowed, worldly, accessible to anyone; the opposite of sacred). ''Vain babblings'' (kenophōnias — empty sounds, fruitless talk; from kenos [empty] + phōnē [voice]). ''Increase unto more ungodliness'' (prokopsousin asebeias — advance, progress toward greater impiety). False teaching is not static — it metastasises. What begins as empty talk spreads into full-blown ungodliness.',
   NULL),
  (17,
   'And their word will eat as doth a canker: of whom is Hymenaeus and Philetus;',
   'καὶ ὁ λόγος αὐτῶν ὡς γάγγραινα νομὴν ἕξει ὧν ἐστιν Ὑμέναιος καὶ Φίλητος',
   'kai ho logos autōn hōs gangraina nomēn hexei hōn estin Hymenaios kai Philētos',
   '''Canker'' (gangraina — gangrene; the medical term for tissue death that spreads by devouring surrounding healthy flesh). ''Will eat'' (nomēn hexei — will find pasture, will spread; nomē is grazing — the gangrene ''grazes'' through living tissue). Hymenaeus was previously named in 1 Timothy 1:20; Philetus is otherwise unknown. Paul names false teachers publicly — error must be identified, not merely described in the abstract.',
   NULL),
  (18,
   'Who concerning the truth have erred, saying that the resurrection is past already; and overthrow the faith of some.',
   'οἵτινες περὶ τὴν ἀλήθειαν ἠστόχησαν λέγοντες τὴν ἀνάστασιν ἤδη γεγονέναι καὶ ἀνατρέπουσιν τήν τινων πίστιν',
   'hoitines peri tēn alētheian ēstochēsan legontes tēn anastasin ēdē gegonenai kai anatrepousin tēn tinōn pistin',
   '''Erred'' (ēstochēsan — missed the mark, deviated from the target; from a [away from] + stochos [a mark to aim at]). Their error: ''the resurrection is past already'' (tēn anastasin ēdē gegonenai) — they spiritualised the bodily resurrection, claiming it had already occurred in some metaphorical sense. This removes the future hope and reduces Christianity to a present-only spirituality. ''Overthrow'' (anatrepousin — overturn, upset, capsize) — the faith of some is wrecked. Error has victims.',
   NULL),
  (19,
   'Nevertheless the foundation of God standeth sure, having this seal, The Lord knoweth them that are his. And, Let every one that nameth the name of Christ depart from iniquity.',
   'ὁ μέντοι στερεὸς θεμέλιος τοῦ θεοῦ ἕστηκεν ἔχων τὴν σφραγῖδα ταύτην Ἔγνω κύριος τοὺς ὄντας αὐτοῦ καί Ἀποστήτω ἀπὸ ἀδικίας πᾶς ὁ ὀνομάζων τὸ ὄνομα κυρίου',
   'ho mentoi stereos themelios tou theou hestēken echōn tēn sphragida tautēn Egnō kyrios tous ontas autou kai Apostētō apo adikias pas ho onomazōn to onoma kyriou',
   '''Nevertheless'' (mentoi — however, despite all this) — despite Hymenaeus, Philetus, and every heresy. ''Foundation'' (themelios) stands ''sure'' (stereos — firm, solid, immovable). Two inscriptions on God''s foundation (like ancient building inscriptions): (1) ''The Lord knoweth them that are his'' (echoing Num 16:5 — God''s sovereign knowledge and election; divine side). (2) ''Let every one that nameth the name of Christ depart from iniquity'' (human responsibility; human side). Divine sovereignty and human responsibility together — the double seal of God''s unshakeable church.',
   'The perseverance of God''s church: False teachers may shipwreck individual faith (v.18), but God''s foundation stands immovable. The true church is secured by God''s knowledge of His own (election) and marked by holy living (sanctification). Both seals are necessary — assurance without holiness is presumption; holiness without assurance is legalism.'),
  (20,
   'But in a great house there are not only vessels of gold and of silver, but also of wood and of earth; and some to honour, and some to dishonour.',
   'ἐν μεγάλῃ δὲ οἰκίᾳ οὐκ ἔστιν μόνον σκεύη χρυσᾶ καὶ ἀργυρᾶ ἀλλὰ καὶ ξύλινα καὶ ὀστράκινα καὶ ἃ μὲν εἰς τιμὴν ἃ δὲ εἰς ἀτιμίαν',
   'en megalē de oikia ouk estin monon skeuē chrysa kai argyra alla kai xylina kai ostrakina kai ha men eis timēn ha de eis atimian',
   'The ''great house'' represents the visible church. Within it are vessels of varying value: gold and silver (precious, honoured) alongside wood and clay (common, dishonoured). Not everyone in the visible church is genuine. The analogy leads to v.21: the believer can choose what kind of vessel to be. This is not fatalism but a call to self-purification.',
   NULL),
  (21,
   'If a man therefore purge himself from these, he shall be a vessel unto honour, sanctified, and meet for the master''s use, and prepared unto every good work.',
   'ἐὰν οὖν τις ἐκκαθάρῃ ἑαυτὸν ἀπὸ τούτων ἔσται σκεῦος εἰς τιμήν ἡγιασμένον εὔχρηστον τῷ δεσπότῃ εἰς πᾶν ἔργον ἀγαθὸν ἡτοιμασμένον',
   'ean oun tis ekkatharē heauton apo toutōn estai skeuos eis timēn hēgiasmenon euchrēston tō despotē eis pan ergon agathon hētoimasmenon',
   '''Purge'' (ekkatharē — thoroughly cleanse, purify completely; from ek [out] + kathairō [to cleanse]). ''From these'' — from the false teachers and their influence. Four descriptions of the purified vessel: (1) ''unto honour'' (eis timēn), (2) ''sanctified'' (hēgiasmenon — set apart for sacred use), (3) ''meet for the master''s use'' (euchrēston tō despotē — useful, serviceable to the sovereign owner), (4) ''prepared unto every good work'' (hētoimasmenon — ready, equipped). Separation from error produces readiness for service.',
   NULL),
  (22,
   'Flee also youthful lusts: but follow righteousness, faith, charity, peace, with them that call on the Lord out of a pure heart.',
   'τὰς δὲ νεωτερικὰς ἐπιθυμίας φεῦγε δίωκε δὲ δικαιοσύνην πίστιν ἀγάπην εἰρήνην μετὰ τῶν ἐπικαλουμένων τὸν κύριον ἐκ καθαρᾶς καρδίας',
   'tas de neōterikas epithymias pheuge diōke de dikaiosynēn pistin agapēn eirēnēn meta tōn epikaloumenōn ton kyrion ek katharas kardias',
   '''Youthful lusts'' (neōterikas epithymias — desires characteristic of youth; not only sexual but also ambition, impatience, love of novelty, quarrelsomeness). ''Flee'' (pheuge — run away from; present imperative: keep fleeing). ''Follow'' (diōke — pursue, chase, hunt; present imperative: keep pursuing). The double command: flee from vice, pursue virtue. Four virtues: righteousness, faith, charity (love), peace. ''With them that call on the Lord'' — virtue is pursued in community, not isolation.',
   NULL),
  (23,
   'But foolish and unlearned questions avoid, knowing that they do gender strifes.',
   'τὰς δὲ μωρὰς καὶ ἀπαιδεύτους ζητήσεις παραιτοῦ εἰδὼς ὅτι γεννῶσιν μάχας',
   'tas de mōras kai apaidentous zētēseis paraitou eidōs hoti gennōsin machas',
   '''Foolish'' (mōras — moronic, stupid; root of English ''moron''). ''Unlearned'' (apaidentous — uninstructed, uneducated, crude; from a [not] + paideuō [to train/educate]). ''Questions'' (zētēseis — speculations, controversies, debates). ''Gender strifes'' (gennōsin machas — give birth to fights; these questions are fertile mothers of conflict). Paul does not prohibit all questioning — he encourages proper study (v.15). But some debates are inherently sterile: they produce heat without light, conflict without resolution.',
   NULL),
  (24,
   'And the servant of the Lord must not strive; but be gentle unto all men, apt to teach, patient,',
   'δοῦλον δὲ κυρίου οὐ δεῖ μάχεσθαι ἀλλ᾽ ἤπιον εἶναι πρὸς πάντας διδακτικόν ἀνεξίκακον',
   'doulon de kyriou ou dei machesthai all'' ēpion einai pros pantas didaktikon anexikakon',
   '''The servant of the Lord'' (doulon kyriou — the Lord''s slave). ''Must not strive'' (ou dei machesthai — must not be quarrelsome, combative). Three positive qualities: (1) ''gentle'' (ēpion — kind, mild, considerate), (2) ''apt to teach'' (didaktikon — skilled in teaching, able to instruct), (3) ''patient'' (anexikakon — bearing evil without resentment, enduring wrong without retaliation; from anechō [to endure] + kakos [evil]). The Lord''s servant wins not by force but by gentle, patient instruction.',
   NULL),
  (25,
   'In meekness instructing those that oppose themselves; if God peradventure will give them repentance to the acknowledging of the truth;',
   'ἐν πραΰτητι παιδεύοντα τοὺς ἀντιδιατιθεμένους μήποτε δῴη αὐτοῖς ὁ θεὸς μετάνοιαν εἰς ἐπίγνωσιν ἀληθείας',
   'en praÿtēti paideuonta tous antidiatithemenous mēpote dōē autois ho theos metanoian eis epignōsin alētheias',
   '''Meekness'' (praÿtēti — gentleness, strength under control). ''Instructing'' (paideuonta — correcting, disciplining, training; the same word used for God''s discipline in Heb 12:6). ''Those that oppose themselves'' (tous antidiatithemenous — those who set themselves in opposition; they oppose not merely us but their own best interests). ''If God peradventure will give them repentance'' (mēpote dōē ho theos metanoian) — repentance is a gift from God, not merely a human decision. The gentle instructor creates the conditions under which God may grant the gift of a changed mind.',
   'Repentance as a divine gift: Paul teaches that repentance (metanoia — a change of mind and direction) is something God ''gives'' (dōē). Human teachers provide gentle correction; God provides the inner transformation. This guards against both passivity (''I can''t do anything'') and triumphalism (''I can change anyone'').'),
  (26,
   'And that they may recover themselves out of the snare of the devil, who are taken captive by him at his will.',
   'καὶ ἀνανήψωσιν ἐκ τῆς τοῦ διαβόλου παγίδος ἐζωγρημένοι ὑπ᾽ αὐτοῦ εἰς τὸ ἐκείνου θέλημα',
   'kai ananēpsōsin ek tēs tou diabolou pagidos ezōgrēmenoi hyp'' autou eis to ekeinou thelēma',
   '''Recover themselves'' (ananēpsōsin — come to their senses, become sober again; from ana [again] + nēphō [to be sober] — literally ''sober up''). ''Snare of the devil'' (tēs tou diabolou pagidos — the devil''s trap). ''Taken captive'' (ezōgrēmenoi — caught alive, captured as a prisoner of war; from zōos [alive] + agreō [to catch]). Those in error are not merely mistaken but held captive by the devil, doing his will while thinking they act freely. Only divine intervention (v.25) can spring the trap.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 2 (Commit to faithful men)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παράθου', 'parathou', 'G3908', 'Commit, entrust, deposit — aorist middle imperative: decisively entrust into the custody of others. Same root as parathēkē (1:12,14). The gospel is a deposit to be transmitted, not hoarded.', 1),
  ('πιστοῖς', 'pistois', 'G4103', 'Faithful, trustworthy, reliable — the primary qualification for doctrinal stewards. Competence without character is dangerous; character without competence is insufficient. Both are required.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 4 (Entangleth)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐμπλέκεται', 'empleketai', 'G1707', 'Becomes entangled, gets woven into — a present middle: wrapping oneself in civilian affairs. Like a soldier who gets caught in a thicket and cannot fight. Only here and 2 Pet 2:20 in the NT.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 15 (Rightly dividing)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σπούδασον', 'spoudason', 'G4704', 'Be diligent, make every effort, give earnest attention — aorist imperative: act with urgency and seriousness. Study of Scripture is not leisure but urgent labour.', 1),
  ('δόκιμον', 'dokimon', 'G1384', 'Approved, tested, proven genuine — like metal refined by fire and found pure. The workman who handles truth accurately is approved by God, not by human audiences.', 2),
  ('ὀρθοτομοῦντα', 'orthotomonta', 'G3718', 'Rightly dividing, cutting straight — from orthos (straight) + temnō (to cut). Originally used for cutting a straight road or ploughing a straight furrow. Accurate, undistorted handling of God''s word. Only here in the NT.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = 15;

-- Verse 17 (Canker / gangrene)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γάγγραινα', 'gangraina', 'G1044', 'Gangrene — necrotic tissue that devours surrounding healthy flesh. False teaching is not a minor blemish but a spreading death. Only here in the NT.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = 17;

-- Verse 19 (Foundation stands sure)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θεμέλιος', 'themelios', 'G2310', 'Foundation — the base on which a building rests. God''s foundation is immovable despite all human failure and false teaching.', 1),
  ('σφραγῖδα', 'sphragida', 'G4973', 'Seal, inscription, mark of ownership — ancient foundations bore inscriptions identifying the builder and purpose. God''s foundation bears a double seal: His sovereign knowledge and the call to holiness.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = 19;

-- Verse 25 (Repentance as gift)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετάνοιαν', 'metanoian', 'G3341', 'Repentance, a change of mind — from meta (after, change) + noeō (to think). Not mere regret but a fundamental reorientation of thought, will, and direction. Here explicitly described as a gift God gives.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = 25;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Be strong in grace
  (1, 'Ephesians 6:10', 1), (1, 'Philippians 4:13', 2), (1, '2 Corinthians 12:9', 3),
  -- v2: Commit to faithful men
  (2, '1 Timothy 6:20', 1), (2, 'Titus 1:5', 2), (2, 'Acts 20:27-28', 3),
  -- v3-4: Soldier metaphor
  (3, '1 Timothy 1:18', 1), (3, '2 Corinthians 10:3-4', 2),
  (4, '1 Corinthians 9:25-27', 1), (4, 'Luke 9:62', 2),
  -- v5: Athlete
  (5, '1 Corinthians 9:24-25', 1), (5, 'Hebrews 12:1', 2),
  -- v6: Farmer
  (6, '1 Corinthians 9:7-11', 1), (6, '1 Timothy 5:17-18', 2),
  -- v8: Remember Christ risen
  (8, 'Romans 1:3-4', 1), (8, '1 Corinthians 15:4', 2),
  -- v9: Word not bound
  (9, 'Philippians 1:12-14', 1), (9, 'Acts 28:31', 2),
  -- v10: For the elect's sake
  (10, 'Colossians 1:24', 1), (10, 'Ephesians 3:13', 2),
  -- v11-13: Faithful saying
  (11, 'Romans 6:5-8', 1), (11, 'Colossians 3:1-4', 2),
  (12, 'Matthew 10:33', 1), (12, 'Mark 8:38', 2), (12, 'Revelation 3:21', 3),
  (13, 'Romans 3:3-4', 1), (13, 'Numbers 23:19', 2), (13, 'Hebrews 6:18', 3),
  -- v15: Rightly dividing
  (15, '2 Corinthians 4:2', 1), (15, '2 Peter 3:16', 2), (15, 'Acts 17:11', 3),
  -- v17-18: Hymenaeus
  (17, '1 Timothy 1:20', 1), (17, '1 Corinthians 15:12', 2),
  (18, '1 Corinthians 15:12-19', 1), (18, 'Acts 17:32', 2),
  -- v19: Firm foundation
  (19, 'Numbers 16:5', 1), (19, 'Matthew 7:24-25', 2), (19, 'John 10:27-29', 3), (19, '1 Corinthians 3:11', 4),
  -- v21: Vessel of honour
  (21, 'Romans 9:21-23', 1), (21, 'Isaiah 52:11', 2), (21, '2 Corinthians 6:17', 3),
  -- v22: Flee lusts, follow virtue
  (22, '1 Timothy 6:11', 1), (22, '1 Corinthians 6:18', 2), (22, 'Galatians 5:22-23', 3),
  -- v25: Repentance from God
  (25, 'Acts 11:18', 1), (25, 'Acts 5:31', 2), (25, 'Jeremiah 31:18-19', 3),
  -- v26: Snare of the devil
  (26, '1 Timothy 3:7', 1), (26, '2 Corinthians 4:4', 2), (26, '1 John 5:19', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Timothy Chapter 2 Complete
-- 26 verses · 7 key verses with word studies (14 words)
-- Cross-references for 19 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════