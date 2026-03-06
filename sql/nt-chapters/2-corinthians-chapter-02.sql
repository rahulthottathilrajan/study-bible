-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 2 — Forgiveness, Triumph, and the Fragrance of Christ
-- 17 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '2 Corinthians 2 continues Paul''s defense of his changed travel plans and transitions into a profound meditation on apostolic ministry. Paul explains he resolved not to come ''again to you in heaviness'' (v.1), choosing instead to write a tearful letter: ''out of much affliction and anguish of heart I wrote unto you with many tears'' (v.4). The purpose was ''not that ye should be grieved, but that ye might know the love which I have more abundantly unto you'' (v.4). Paul then urges the Corinthians to forgive and restore the disciplined offender: ''Sufficient to such a man is this punishment, which was inflicted of many'' (v.6). Forgiveness is urgent ''lest perhaps such a one should be swallowed up with overmuch sorrow'' (v.7). Paul himself forgives ''in the person of Christ'' (v.10), recognizing that unforgiveness gives Satan an advantage: ''lest Satan should get an advantage of us: for we are not ignorant of his devices'' (v.11). The chapter culminates in a triumphant image: ''Now thanks be unto God, which always causeth us to triumph in Christ, and maketh manifest the savour of his knowledge by us in every place'' (v.14). Apostolic ministry is a fragrance — ''the savour of death unto death'' for the perishing and ''the savour of life unto life'' for the saved (v.16).',
  'Forgiveness and the Triumph of Christ',
  'θριαμβεύω (thriambeuō)',
  'To lead in triumphal procession — a Roman military metaphor. The victorious general paraded through Rome with captives and the fragrance of incense. God leads Paul as a willing captive in Christ''s triumphal march, and through him spreads the fragrance of the knowledge of Christ everywhere.',
  '["The Sorrowful Letter and Paul''s Resolve (vv.1-4): I determined this with myself that I would not come again to you in heaviness for if I make you sorry who is he then that maketh me glad but the same which is made sorry by me and I wrote this same unto you lest when I came I should have sorrow from them of whom I ought to rejoice having confidence in you all that my joy is the joy of you all for out of much affliction and anguish of heart I wrote unto you with many tears not that ye should be grieved but that ye might know the love which I have more abundantly unto you","Forgiveness of the Offender (vv.5-11): But if any have caused grief he hath not grieved me but in part that I may not overcharge you all sufficient to such a man is this punishment which was inflicted of many so that contrariwise ye ought rather to forgive him and comfort him lest perhaps such a one should be swallowed up with overmuch sorrow wherefore I beseech you that ye would confirm your love toward him; I forgave in the person of Christ lest Satan should get an advantage of us for we are not ignorant of his devices","Triumph in Christ and the Fragrance of Knowledge (vv.12-17): Furthermore when I came to Troas to preach Christ''s gospel and a door was opened unto me of the Lord I had no rest in my spirit because I found not Titus my brother but taking my leave of them I went from thence into Macedonia now thanks be unto God which always causeth us to triumph in Christ and maketh manifest the savour of his knowledge by us in every place for we are unto God a sweet savour of Christ in them that are saved and in them that perish to the one we are the savour of death unto death and to the other the savour of life unto life and who is sufficient for these things for we are not as many which corrupt the word of God but as of sincerity but as of God in the sight of God speak we in Christ"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'But I determined this with myself, that I would not come again to you in heaviness.',
   'ἔκρινα δὲ ἐμαυτῷ τοῦτο τὸ μὴ πάλιν ἐν λύπῃ πρὸς ὑμᾶς ἐλθεῖν',
   'ekrina de emautō touto to mē palin en lypē pros hymas elthein',
   '''Determined'' (ekrina — I decided, I judged; an act of deliberate pastoral reasoning). ''In heaviness'' (en lypē — in grief, in sorrow). ''Again'' (palin — implies a previous painful visit; this is the ''painful visit'' referenced in 12:14, 13:1-2). Paul chose to spare both himself and the Corinthians another confrontation, writing a letter instead of making a harsh personal visit.',
   NULL),
  (2, 'For if I make you sorry, who is he then that maketh me glad, but the same which is made sorry by me?',
   'εἰ γὰρ ἐγὼ λυπῶ ὑμᾶς καὶ τίς ἐστιν ὁ εὐφραίνων με εἰ μὴ ὁ λυπούμενος ἐξ ἐμοῦ',
   'ei gar egō lypō hymas kai tis estin ho euphrainōn me ei mē ho lypoumenos ex emou',
   '''Make you sorry'' (lypō hymas — cause you grief). ''Maketh me glad'' (euphrainōn me — the one who cheers me, who gives me joy). The logic reveals Paul''s emotional entanglement with the Corinthians: if he grieves them, he destroys the very source of his own joy. The apostle''s joy is bound up with the spiritual health of his converts — a mark of authentic pastoral love.',
   NULL),
  (3, 'And I wrote this same unto you, lest, when I came, I should have sorrow from them of whom I ought to rejoice; having confidence in you all, that my joy is the joy of you all.',
   'καὶ ἔγραψα ὑμῖν τοῦτο αὐτό ἵνα μὴ ἐλθὼν λύπην ἔχω ἀφ᾿ ὧν ἔδει με χαίρειν πεποιθὼς ἐπὶ πάντας ὑμᾶς ὅτι ἡ ἐμὴ χαρὰ πάντων ὑμῶν ἐστιν',
   'kai egrapsa hymin touto auto hina mē elthōn lypēn echō aph'' hōn edei me chairein pepoithōs epi pantas hymas hoti hē emē chara pantōn hymōn estin',
   '''I wrote this same'' — referring to the ''sorrowful letter'' (not 1 Corinthians but a now-lost letter written between 1 and 2 Corinthians). ''Having confidence'' (pepoithōs — having been persuaded; perfect participle: a settled conviction). ''My joy is the joy of you all'' — Paul''s joy and the Corinthians'' joy are one and the same. When they repent, everyone rejoices.',
   NULL),
  (4, 'For out of much affliction and anguish of heart I wrote unto you with many tears; not that ye should be grieved, but that ye might know the love which I have more abundantly unto you.',
   'ἐκ γὰρ πολλῆς θλίψεως καὶ συνοχῆς καρδίας ἔγραψα ὑμῖν διὰ πολλῶν δακρύων οὐχ ἵνα λυπηθῆτε ἀλλὰ τὴν ἀγάπην ἵνα γνῶτε ἣν ἔχω περισσοτέρως εἰς ὑμᾶς',
   'ek gar pollēs thlipseōs kai synochēs kardias egrapsa hymin dia pollōn dakryōn ouch hina lypēthēte alla tēn agapēn hina gnōte hēn echō perissoterōs eis hymas',
   '''Affliction'' (thlipseōs — pressure, tribulation). ''Anguish of heart'' (synochēs kardias — a squeezing, constriction of the heart; synochē from synechō, to press together). ''With many tears'' (dia pollōn dakryōn — through many tears; the letter was tear-stained). The motive was love, not punishment: ''that ye might know the love'' (tēn agapēn hina gnōte). Paul reveals the emotional cost of apostolic discipline — correction that does not grieve the corrector is not correction born of love.',
   NULL),
  (5, 'But if any have caused grief, he hath not grieved me, but in part: that I may not overcharge you all.',
   'εἰ δέ τις λελύπηκεν οὐκ ἐμὲ λελύπηκεν ἀλλ᾿ ἀπὸ μέρους ἵνα μὴ ἐπιβαρῶ πάντας ὑμᾶς',
   'ei de tis lelypēken ouk eme lelypēken all'' apo merous hina mē epibarō pantas hymas',
   '''If any have caused grief'' — the indefinite reference (tis — someone) avoids naming the offender, preserving dignity. ''Not grieved me, but in part'' (apo merous — partially, to some extent; Paul softens the personal hurt). ''Overcharge'' (epibarō — weigh down, burden; Paul does not want to exaggerate the offense or heap blame on the whole church). The offender is likely the individual who publicly challenged Paul''s authority during the painful visit.',
   NULL),
  (6, 'Sufficient to such a man is this punishment, which was inflicted of many.',
   'ἱκανὸν τῷ τοιούτῳ ἡ ἐπιτιμία αὕτη ἡ ὑπὸ τῶν πλειόνων',
   'hikanon tō toioutō hē epitimia hautē hē hypo tōn pleionōn',
   '''Sufficient'' (hikanon — enough, adequate). ''Punishment'' (epitimia — censure, penalty, rebuke; found only here in the NT). ''Inflicted of many'' (hypo tōn pleionōn — by the majority). The church had disciplined the offender, and Paul now declares the punishment sufficient. The purpose of church discipline is restoration, not annihilation — once repentance has occurred, continued punishment becomes cruelty.',
   NULL),
  (7, 'So that contrariwise ye ought rather to forgive him, and comfort him, lest perhaps such a one should be swallowed up with overmuch sorrow.',
   'ὥστε τοὐναντίον μᾶλλον ὑμᾶς χαρίσασθαι καὶ παρακαλέσαι μήπως τῇ περισσοτέρᾳ λύπῃ καταποθῇ ὁ τοιοῦτος',
   'hōste tounantion mallon hymas charisasthai kai parakalesai mēpōs tē perissotera lypē katapothē ho toioutos',
   '''Contrariwise'' (tounantion — on the contrary; a complete reversal from punishment to forgiveness). ''Forgive'' (charisasthai — to show grace, to freely pardon; from charis, grace). ''Comfort'' (parakalesai — encourage, come alongside). ''Swallowed up'' (katapothē — swallowed down, consumed; a strong image of being engulfed). ''Overmuch sorrow'' (perissotera lypē — excessive grief). The danger is real: the repentant sinner, if not restored, can be destroyed by despair. Forgiveness is not merely generous — it is urgent.',
   'This verse establishes the essential counterpart to church discipline: restoration. If discipline without forgiveness is cruelty, then forgiveness without prior discipline is permissiveness. The church must hold both together — the willingness to confront sin and the eagerness to restore the repentant. The verb charisasthai (forgive) is rooted in charis (grace), indicating that human forgiveness mirrors divine grace. ''Swallowed up with overmuch sorrow'' warns against a punitive spirit that destroys the very person discipline was meant to save.'),
  (8, 'Wherefore I beseech you that ye would confirm your love toward him.',
   'διὸ παρακαλῶ ὑμᾶς κυρῶσαι εἰς αὐτὸν ἀγάπην',
   'dio parakalō hymas kyrōsai eis auton agapēn',
   '''Confirm'' (kyrōsai — to ratify, to make legally valid; a judicial term for officially certifying a document or decision). ''Love'' (agapēn). Paul asks the church to officially ratify their love toward the offender — to make forgiveness a public, corporate act matching the public discipline. Love must be as deliberate and authoritative as punishment was.',
   NULL),
  (9, 'For to this end also did I write, that I might know the proof of you, whether ye be obedient in all things.',
   'εἰς τοῦτο γὰρ καὶ ἔγραψα ἵνα γνῶ τὴν δοκιμὴν ὑμῶν εἰ εἰς πάντα ὑπήκοοί ἐστε',
   'eis touto gar kai egrapsa hina gnō tēn dokimēn hymōn ei eis panta hypēkooi este',
   '''Proof'' (dokimēn — tested character, proven quality; the same word used for assaying metals). ''Obedient in all things'' (eis panta hypēkooi — obedient with respect to everything). The sorrowful letter was also a test of the Corinthians'' willingness to submit to apostolic authority. Their obedience in disciplining the offender proved their loyalty; now their obedience in restoring him will prove their maturity.',
   NULL),
  (10, 'To whom ye forgive any thing, I forgive also: for if I forgave any thing, to whom I forgave it, for your sakes forgave I it in the person of Christ;',
   'ᾧ δέ τι χαρίζεσθε καὶ ἐγώ καὶ γὰρ ἐγὼ εἴ τι κεχάρισμαι ᾧ κεχάρισμαι δι᾿ ὑμᾶς ἐν προσώπῳ Χριστοῦ',
   'hō de ti charizesthe kai egō kai gar egō ei ti kecharismai hō kecharismai di'' hymas en prosōpō Christou',
   '''I forgive also'' — Paul joins his forgiveness to theirs, creating apostolic solidarity with the church''s decision. ''In the person of Christ'' (en prosōpō Christou — in the presence/face of Christ; Paul forgives as Christ''s representative, in Christ''s presence, and according to Christ''s character). ''For your sakes'' (di'' hymas — for your benefit). Forgiveness here is trinitarian: it flows from Christ through the apostle to the church and reaches the offender.',
   NULL),
  (11, 'Lest Satan should get an advantage of us: for we are not ignorant of his devices.',
   'ἵνα μὴ πλεονεκτηθῶμεν ὑπὸ τοῦ σατανᾶ οὐ γὰρ αὐτοῦ τὰ νοήματα ἀγνοοῦμεν',
   'hina mē pleonektēthōmen hypo tou satana ou gar autou ta noēmata agnooumen',
   '''Get an advantage'' (pleonektēthōmen — to be outwitted, defrauded, taken advantage of; from pleon + echō, to have more — Satan gains more ground). ''Devices'' (noēmata — schemes, thoughts, designs, stratagems). Satan''s strategy in the context of church discipline operates on two fronts: (1) he tempts the church to be too lenient and skip discipline; (2) he tempts the church to be too harsh and refuse restoration. Either extreme serves his purposes. ''We are not ignorant'' — Paul discerns the enemy''s tactics.',
   'This verse reveals a critical spiritual warfare principle: Satan exploits both moral failure and unforgiveness. The same enemy who tempted the offender to sin now tempts the church to refuse restoration. Unforgiveness is not righteousness but a satanic stratagem that destroys the repentant and embitters the community. Paul''s awareness of Satan''s ''devices'' (noēmata) indicates that spiritual warfare requires discernment — not merely resisting temptation but recognizing the enemy''s varied tactics, which include disguising vindictiveness as holiness.'),
  (12, 'Furthermore, when I came to Troas to preach Christ''s gospel, and a door was opened unto me of the Lord,',
   'ἐλθὼν δὲ εἰς τὴν Τρωάδα εἰς τὸ εὐαγγέλιον τοῦ Χριστοῦ καὶ θύρας μοι ἀνεῳγμένης ἐν κυρίῳ',
   'elthōn de eis tēn Trōada eis to euangelion tou Christou kai thyras moi aneōgmenēs en kyriō',
   '''Troas'' — a port city in northwestern Asia Minor (modern Turkey), where Paul waited for Titus. ''A door was opened'' (thyras aneōgmenēs — a door having been opened; perfect passive participle: God had opened the door and it remained open). Despite a prime evangelistic opportunity, Paul''s anxiety for the Corinthians drove him onward — a vivid demonstration of how deeply he cared for this church.',
   NULL),
  (13, 'I had no rest in my spirit, because I found not Titus my brother: but taking my leave of them, I went from thence into Macedonia.',
   'οὐκ ἔσχηκα ἄνεσιν τῷ πνεύματί μου τῷ μὴ εὑρεῖν με Τίτον τὸν ἀδελφόν μου ἀλλὰ ἀποταξάμενος αὐτοῖς ἐξῆλθον εἰς Μακεδονίαν',
   'ouk eschēka anesin tō pneumati mou tō mē heurein me Titon ton adelphon mou alla apotaxamenos autois exēlthon eis Makedonian',
   '''No rest in my spirit'' (ouk eschēka anesin tō pneumati — I had no relief in my spirit; anesin, release from tension). ''Found not Titus'' — Titus was carrying the sorrowful letter and Paul desperately awaited his report on Corinth''s response. ''Taking my leave'' (apotaxamenos — saying farewell). Paul abandoned an open door of ministry because his pastoral anxiety was overwhelming — an astonishing admission of human limitation from the great apostle.',
   NULL),
  (14, 'Now thanks be unto God, which always causeth us to triumph in Christ, and maketh manifest the savour of his knowledge by us in every place.',
   'τῷ δὲ θεῷ χάρις τῷ πάντοτε θριαμβεύοντι ἡμᾶς ἐν τῷ Χριστῷ καὶ τὴν ὀσμὴν τῆς γνώσεως αὐτοῦ φανεροῦντι δι᾿ ἡμῶν ἐν παντὶ τόπῳ',
   'tō de theō charis tō pantote thriambeuonti hēmas en tō Christō kai tēn osmēn tēs gnōseōs autou phanerounti di'' hēmōn en panti topō',
   '''Causeth us to triumph'' (thriambeuonti hēmas — leading us in triumphal procession; the Roman triumphus was a victory parade where the general led captives and soldiers through the streets while incense burned). Paul is not the general but the willing captive — led by God in Christ''s victory procession. ''Savour of his knowledge'' (osmēn tēs gnōseōs autou — the fragrance of the knowledge of him). In triumphal processions, incense was burned; Paul''s ministry is the fragrance that fills the air as God parades the gospel through the world. ''Always … in every place'' — universal scope.',
   'The thriambeuō metaphor is theologically profound. Paul does not say God enables him to triumph but that God leads him in triumph — Paul is the captive, not the conqueror. This inversion is characteristic of Pauline theology: weakness is the venue of divine power. The ''savour'' (osmē) connects to OT sacrifice (the ''sweet savour'' of offerings to God) and to the Roman triumphal procession where incense filled the streets. The gospel has an olfactory dimension: it is not merely heard but ''smelled'' — it pervades every environment through the lives of its messengers.'),
  (15, 'For we are unto God a sweet savour of Christ, in them that are saved, and in them that perish:',
   'ὅτι Χριστοῦ εὐωδία ἐσμὲν τῷ θεῷ ἐν τοῖς σωζομένοις καὶ ἐν τοῖς ἀπολλυμένοις',
   'hoti Christou euōdia esmen tō theō en tois sōzomenois kai en tois apollymenois',
   '''Sweet savour'' (euōdia — fragrance, pleasant aroma; from eu + ozō, good smell). ''Of Christ'' — the fragrance is not Paul''s own but Christ''s, transmitted through Paul. ''Unto God'' (tō theō — directed toward God; the primary audience of gospel ministry is God himself). ''Saved'' (sōzomenois — present participle: those being saved). ''Perish'' (apollymenois — present participle: those perishing). The same fragrance produces opposite effects depending on the recipient''s spiritual condition.',
   NULL),
  (16, 'To the one we are the savour of death unto death; and to the other the savour of life unto life. And who is sufficient for these things?',
   'οἷς μὲν ὀσμὴ θανάτου εἰς θάνατον οἷς δὲ ὀσμὴ ζωῆς εἰς ζωήν καὶ πρὸς ταῦτα τίς ἱκανός',
   'hois men osmē thanatou eis thanaton hois de osmē zōēs eis zōēn kai pros tauta tis hikanos',
   '''Savour of death unto death'' (osmē thanatou eis thanaton — a smell that leads from death to death; the gospel message, when rejected, confirms and deepens the spiritual death of the rejecter). ''Savour of life unto life'' (osmē zōēs eis zōēn — a fragrance proceeding from life and leading to life; for those who receive it, the gospel is life-giving at every stage). ''Who is sufficient?'' (tis hikanos — who is adequate, who is competent for such a ministry?). The question is rhetorical and devastating — no human being is inherently sufficient for a ministry with eternal consequences.',
   'The double-edged nature of the gospel is sobering: the same message that saves some condemns others. This is not because the gospel changes but because the hearers differ. The ''savour of death unto death'' parallels Isaiah 6:9-10 and Christ''s teaching in parables (Matt 13:14-15). The question ''who is sufficient?'' is answered in 3:5: ''our sufficiency is of God.'' Human inadequacy is not an obstacle to divine purpose but the very condition God uses — ministers who know their insufficiency depend on God''s all-sufficiency.'),
  (17, 'For we are not as many, which corrupt the word of God: but as of sincerity, but as of God, in the sight of God speak we in Christ.',
   'οὐ γάρ ἐσμεν ὡς οἱ πολλοὶ καπηλεύοντες τὸν λόγον τοῦ θεοῦ ἀλλ᾿ ὡς ἐξ εἰλικρινείας ἀλλ᾿ ὡς ἐκ θεοῦ κατενώπιον τοῦ θεοῦ ἐν Χριστῷ λαλοῦμεν',
   'ou gar esmen hōs hoi polloi kapēleuontes ton logon tou theou all'' hōs ex eilikrineias all'' hōs ek theou katenōpion tou theou en Christō laloumen',
   '''Corrupt'' (kapēleuontes — to peddle, to huckster, to adulterate for profit; from kapēlos, a retail dealer or tavern-keeper known for watering down wine). ''The many'' (hoi polloi — the majority; a startling claim that most preachers adulterate the message). ''Sincerity'' (eilikrineias — purity, transparency; cf. 1:12). ''As of God'' (ek theou — from God as the source). ''In the sight of God'' (katenōpion tou theou — directly before God''s face). ''In Christ'' (en Christō — in union with Christ). Paul''s ministry is sourced in God, transparent before God, and conducted in Christ — a threefold guarantee of authenticity.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 2;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 anguish
  ('συνοχή', 'synochē', 'G4928', 'Anguish, distress, constraint — from synechō (to press together, to compress). A squeezing of the heart. Paul''s letter was wrung out of a constricted, pressured heart — not dashed off carelessly but agonized over.', 1),
  -- v.7 forgive
  ('χαρίζομαι', 'charizomai', 'G5483', 'To forgive, to show grace, to freely give — from charis (grace). Forgiveness in the NT is fundamentally a grace-act: undeserved pardon flowing from God''s character transmitted through his people. The church''s forgiveness mirrors God''s forgiveness in Christ (Eph 4:32).', 2),
  -- v.11 devices
  ('νόημα', 'noēma', 'G3540', 'Device, scheme, thought, design — from noeō (to think, to perceive). Satan''s noēmata are his calculated mental strategies, his thought-out plans for exploiting believers. Used in 2 Cor also at 3:14, 4:4, 10:5, 11:3 — a running theme of the letter: the battle is for the mind.', 3),
  -- v.14 triumph
  ('θριαμβεύω', 'thriambeuō', 'G2358', 'To lead in triumphal procession — a Roman military term for the triumphus, the victory parade of a conquering general through Rome. God is the general; Paul is the willing captive led in the procession. Through this public display, the fragrance of Christ''s knowledge is spread. The image emphasizes God''s sovereignty and Paul''s subordinate role.', 4),
  ('ὀσμή', 'osmē', 'G3744', 'Smell, odour, fragrance — used in both OT sacrifice (Gen 8:21, the sweet savour of Noah''s offering) and the Roman triumph (incense burned along the parade route). The gospel has an invisible, pervasive quality like a fragrance: it cannot be contained and it affects everyone it reaches.', 5),
  -- v.17 corrupt/peddle
  ('καπηλεύω', 'kapēleuō', 'G2585', 'To peddle, to huckster, to adulterate for profit — from kapēlos, a petty trader or tavern-keeper infamous for watering down wine. The word implies both commercial motivation and dilution of the product. False teachers treat the word of God as merchandise to be marketed for profit, adulterating it to suit their customers.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 2
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 7
    WHEN 3 THEN 11
    WHEN 4 THEN 14 WHEN 5 THEN 14
    WHEN 6 THEN 17
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 tears
  (4, 'Acts 20:31', 1),
  (4, 'Philippians 3:18', 2),
  -- v.6 punishment sufficient
  (6, '1 Corinthians 5:1-5', 3),
  (6, 'Galatians 6:1', 4),
  -- v.7 forgive and comfort
  (7, 'Ephesians 4:32', 5),
  (7, 'Colossians 3:13', 6),
  -- v.10 in the person of Christ
  (10, 'Matthew 18:20', 7),
  (10, '2 Corinthians 5:20', 8),
  -- v.11 Satan's devices
  (11, 'Ephesians 6:11', 9),
  (11, '1 Peter 5:8', 10),
  (11, '2 Corinthians 11:14', 11),
  -- v.14 triumph in Christ
  (14, 'Colossians 2:15', 12),
  (14, 'Romans 8:37', 13),
  -- v.15 sweet savour
  (15, 'Ephesians 5:2', 14),
  (15, 'Genesis 8:21', 15),
  -- v.16 savour of life and death
  (16, 'Luke 2:34', 16),
  (16, '1 Corinthians 1:18', 17),
  (16, '2 Corinthians 3:5-6', 18),
  -- v.17 corrupt the word
  (17, '2 Corinthians 4:2', 19),
  (17, '1 Thessalonians 2:3-5', 20),
  (17, '2 Peter 2:3', 21)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 2
  AND v.verse_number = cr.verse_number;
