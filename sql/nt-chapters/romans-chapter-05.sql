-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 5 — Peace with God and the Two Adams
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Romans 5 opens with the glorious results of justification and closes with the cosmic drama of the two Adams. ''Therefore being justified by faith, we have peace with God through our Lord Jesus Christ'' (v.1). Through Christ we also have ''access … into this grace wherein we stand, and rejoice in hope of the glory of God'' (v.2). Even tribulation produces a chain of blessings: ''tribulation worketh patience; and patience, experience; and experience, hope: and hope maketh not ashamed'' (vv.3-5). The ground of all this hope is God''s love: ''God commendeth his love toward us, in that, while we were yet sinners, Christ died for us'' (v.8). If God justified us as enemies, ''much more'' shall we be saved from wrath through Christ (v.9) and reconciled through his life (v.10). From v.12 Paul launches the Adam-Christ parallel: ''by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned'' (v.12). But the ''free gift is not as the offence'' — where Adam''s one trespass brought condemnation, Christ''s one act of righteousness brought justification of life (vv.15-18). ''As by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous'' (v.19). The law ''entered, that the offence might abound. But where sin abounded, grace did much more abound'' (v.20). The chapter concludes with a triumphant declaration: ''as sin hath reigned unto death, even so might grace reign through righteousness unto eternal life by Jesus Christ our Lord'' (v.21).',
  'The Fruits of Justification and the Adam-Christ Parallel',
  'καταλλαγή (katallagē)',
  'Reconciliation — from kata (down, thoroughly) + allassō (to change, to exchange). Katallagē denotes the restoration of a broken relationship, the exchange of enmity for friendship. Through Christ''s death, God reconciled enemies to himself (vv.10-11). Reconciliation presupposes prior hostility: we were enemies of God (v.10), but Christ''s death changed our status from enemies to friends, from alienated to at peace.',
  '["The Fruits of Justification: Peace, Access, Hope (vv.1-5): Therefore being justified by faith we have peace with God through our Lord Jesus Christ by whom also we have access by faith into this grace wherein we stand and rejoice in hope of the glory of God and not only so but we glory in tribulations also knowing that tribulation worketh patience and patience experience and experience hope and hope maketh not ashamed because the love of God is shed abroad in our hearts by the Holy Ghost which is given unto us","God''s Love Demonstrated in Christ''s Death (vv.6-11): For when we were yet without strength in due time Christ died for the ungodly for scarcely for a righteous man will one die yet peradventure for a good man some would even dare to die but God commendeth his love toward us in that while we were yet sinners Christ died for us much more then being now justified by his blood we shall be saved from wrath through him","The Two Adams: Sin and Death Through Adam, Grace and Life Through Christ (vv.12-21): Wherefore as by one man sin entered into the world and death by sin and so death passed upon all men for that all have sinned for as by one man''s disobedience many were made sinners so by the obedience of one shall many be made righteous where sin abounded grace did much more abound that as sin hath reigned unto death even so might grace reign through righteousness unto eternal life by Jesus Christ our Lord"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Therefore being justified by faith, we have peace with God through our Lord Jesus Christ:',
   'Δικαιωθέντες οὖν ἐκ πίστεως εἰρήνην ἔχομεν πρὸς τὸν θεὸν διὰ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'Dikaiōthentes oun ek pisteōs eirēnēn echomen pros ton theon dia tou kyriou hēmōn Iēsou Christou',
   '''Therefore'' (oun — drawing the conclusion from chs.1-4). ''Being justified'' (dikaiōthentes — having been justified; aorist participle: a completed action). ''We have peace'' (eirēnēn echomen — we possess peace; some manuscripts read ''let us have peace'' [echōmen, subjunctive], but the indicative is better: this is a declaration of fact, not an exhortation). ''Peace with God'' — not the subjective feeling of peace but the objective state of peace: the war between God and the sinner is over. ''Through our Lord Jesus Christ'' — peace is mediated exclusively through Christ.',
   'This verse marks the transition from justification (chs.1-4) to its results (chs.5-8). The first and foundational result is peace with God. Before justification, the sinner was under God''s wrath (1:18); now the justified believer has peace (eirēnē) with God. This is not psychological tranquility but a real change of status: hostility has been replaced by harmony, condemnation by acceptance. All of this comes ''through our Lord Jesus Christ'' — the sole mediator of this peace.'),
  (2, 'By whom also we have access by faith into this grace wherein we stand, and rejoice in hope of the glory of God.',
   'δι᾿ οὗ καὶ τὴν προσαγωγὴν ἐσχήκαμεν τῇ πίστει εἰς τὴν χάριν ταύτην ἐν ᾗ ἑστήκαμεν καὶ καυχώμεθα ἐπ᾿ ἐλπίδι τῆς δόξης τοῦ θεοῦ',
   'di hou kai tēn prosagōgēn eschēkamen tē pistei eis tēn charin tautēn en hē hestēkamen kai kauchōmetha ep elpidi tēs doxēs tou theou',
   '''Access'' (prosagōgēn — introduction, audience; the word used for being ushered into the presence of a king). ''Into this grace'' (eis tēn charin tautēn — into this sphere of grace). ''Wherein we stand'' (en hē hestēkamen — in which we have taken our stand; perfect tense: we stand permanently). ''Rejoice'' (kauchōmetha — boast, exult). ''Hope of the glory of God'' — the glory we fell short of (3:23) is now the object of our confident hope. Three blessings: peace (v.1), access (v.2a), hope of glory (v.2b).',
   NULL),
  (3, 'And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;',
   'οὐ μόνον δέ ἀλλὰ καὶ καυχώμεθα ἐν ταῖς θλίψεσιν εἰδότες ὅτι ἡ θλῖψις ὑπομονὴν κατεργάζεται',
   'ou monon de alla kai kauchōmetha en tais thlipsesin eidotes hoti hē thlipsis hypomonēn katergazetai',
   '''Glory in tribulations'' (kauchōmetha en tais thlipsesin — boast in afflictions; the same verb as v.2, now applied to suffering). ''Worketh'' (katergazetai — produces, accomplishes, brings about). ''Patience'' (hypomonēn — endurance, steadfastness, the ability to remain under pressure). Tribulation is not merely endured but celebrated, because it initiates a chain of character development.',
   NULL),
  (4, 'And patience, experience; and experience, hope:',
   'ἡ δὲ ὑπομονὴ δοκιμήν ἡ δὲ δοκιμὴ ἐλπίδα',
   'hē de hypomonē dokimēn hē de dokimē elpida',
   '''Experience'' (dokimēn — proven character, tested quality; from dokimazō, to test and approve. This is the character that emerges from enduring trials: refined, tested, approved). ''Hope'' (elpida — confident expectation). The chain: tribulation → endurance → proven character → hope. Each link produces the next. Hope is not wishful thinking but the confident expectation born of tested character.',
   NULL),
  (5, 'And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the Holy Ghost which is given unto us.',
   'ἡ δὲ ἐλπὶς οὐ καταισχύνει ὅτι ἡ ἀγάπη τοῦ θεοῦ ἐκκέχυται ἐν ταῖς καρδίαις ἡμῶν διὰ πνεύματος ἁγίου τοῦ δοθέντος ἡμῖν',
   'hē de elpis ou kataischynei hoti hē agapē tou theou ekkechytai en tais kardiais hēmōn dia pneumatos hagiou tou dothentos hēmin',
   '''Maketh not ashamed'' (ou kataischynei — does not put to shame, does not disappoint). ''Love of God'' (hē agapē tou theou — God''s love for us, not our love for God; the context in vv.6-8 confirms this). ''Shed abroad'' (ekkechytai — poured out, lavished; perfect tense: it has been poured out and remains poured out). ''By the Holy Ghost'' — the Holy Spirit is the agent who floods the believer''s heart with the experienced reality of God''s love. This is the first explicit mention of the Spirit in Romans since 1:4.',
   'This verse reveals the ground of Christian hope: it is not our grip on God but God''s love poured into our hearts. The Holy Spirit makes God''s love an experienced reality, not merely a doctrine. The perfect tense (ekkechytai) indicates a permanent flooding: God''s love has been poured out and remains overflowing. This subjective experience of divine love is the guarantee that our objective hope (the glory of God, v.2) will not disappoint.'),
  (6, 'For when we were yet without strength, in due time Christ died for the ungodly.',
   'ἔτι γὰρ Χριστὸς ὄντων ἡμῶν ἀσθενῶν κατὰ καιρὸν ὑπὲρ ἀσεβῶν ἀπέθανεν',
   'eti gar Christos ontōn hēmōn asthenōn kata kairon hyper asebōn apethanen',
   '''Without strength'' (asthenōn — weak, helpless, powerless). ''In due time'' (kata kairon — at the right time, at the appointed moment). ''For the ungodly'' (hyper asebōn — on behalf of the impious; the same word as 4:5). Three descriptions of those for whom Christ died: ''without strength'' (helpless), ''ungodly'' (impious), and ''sinners'' (v.8). Christ died not for the deserving but for the helpless and hostile.',
   NULL),
  (7, 'For scarcely for a righteous man will one die: yet peradventure for a good man some would even dare to die.',
   'μόλις γὰρ ὑπὲρ δικαίου τις ἀποθανεῖται ὑπὲρ γὰρ τοῦ ἀγαθοῦ τάχα τις καὶ τολμᾷ ἀποθανεῖν',
   'molis gar hyper dikaiou tis apothaneitai hyper gar tou agathou tacha tis kai tolma apothanein',
   '''Scarcely'' (molis — with difficulty, hardly ever). ''Righteous man'' (dikaiou — one who is merely just, correct). ''Good man'' (tou agathou — one who is actively benevolent, generous). Paul distinguishes: dying for a just person would be rare; dying for a truly good person would be conceivable but still extraordinary. Yet Christ died for neither the righteous nor the good — but for sinners (v.8).',
   NULL),
  (8, 'But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us.',
   'συνίστησιν δὲ τὴν ἑαυτοῦ ἀγάπην εἰς ἡμᾶς ὁ θεός ὅτι ἔτι ἁμαρτωλῶν ὄντων ἡμῶν Χριστὸς ὑπὲρ ἡμῶν ἀπέθανεν',
   'synistēsin de tēn heautou agapēn eis hēmas ho theos hoti eti hamartōlōn ontōn hēmōn Christos hyper hēmōn apethanen',
   '''Commendeth'' (synistēsin — demonstrates, proves, establishes; present tense: God keeps on demonstrating). ''His love toward us'' (tēn heautou agapēn eis hēmas — his own love for us). ''While we were yet sinners'' (eti hamartōlōn ontōn hēmōn — while we were still sinners; not after we cleaned up, not after we showed interest, but while we were actively sinning). ''Christ died for us'' (Christos hyper hēmōn apethanen — Christ died on our behalf). This is the supreme demonstration of divine love: its objects are sinners, its cost is the death of God''s Son.',
   'This verse is the definitive statement on the nature of divine love. Human love typically responds to something lovable in the object; God''s love creates value in the object. The timing — ''while we were yet sinners'' — eliminates any possibility that we contributed to our salvation. God''s love is not reactive but initiative: he loved us first, at our worst, at infinite cost to himself. This verse is the experiential ground of the assurance described in 8:31-39.'),
  (9, 'Much more then, being now justified by his blood, we shall be saved from wrath through him.',
   'πολλῷ οὖν μᾶλλον δικαιωθέντες νῦν ἐν τῷ αἵματι αὐτοῦ σωθησόμεθα δι᾿ αὐτοῦ ἀπὸ τῆς ὀργῆς',
   'pollō oun mallon dikaiōthentes nyn en tō haimati autou sōthēsometha di autou apo tēs orgēs',
   '''Much more'' (pollō mallon — how much more; the first of two ''much more'' arguments in vv.9-10). The logic: if God did the harder thing (justify sinners at the cost of his Son''s blood), he will certainly do the easier thing (save the already-justified from future wrath). ''By his blood'' — Christ''s sacrificial death is the means of justification. ''Saved from wrath'' — future salvation from the coming judgment.',
   NULL),
  (10, 'For if, when we were enemies, we were reconciled to God by the death of his Son, much more, being reconciled, we shall be saved by his life.',
   'εἰ γὰρ ἐχθροὶ ὄντες κατηλλάγημεν τῷ θεῷ διὰ τοῦ θανάτου τοῦ υἱοῦ αὐτοῦ πολλῷ μᾶλλον καταλλαγέντες σωθησόμεθα ἐν τῇ ζωῇ αὐτοῦ',
   'ei gar echthroi ontes katēllagēmen tō theō dia tou thanatou tou huiou autou pollō mallon katallagentes sōthēsometha en tē zōē autou',
   '''Enemies'' (echthroi — hostile ones; we were not merely neutral but actively hostile to God). ''Reconciled'' (katēllagēmen — the relationship was restored; passive: God reconciled us). ''By the death of his Son'' — reconciliation cost the Father his Son. ''Saved by his life'' (en tē zōē autou — by his resurrection life). The second ''much more'': if Christ''s death reconciled enemies, Christ''s ongoing resurrection life will certainly preserve the reconciled. His death secured our status; his life secures our future.',
   NULL),
  (11, 'And not only so, but we also joy in God through our Lord Jesus Christ, by whom we have now received the atonement.',
   'οὐ μόνον δέ ἀλλὰ καὶ καυχώμενοι ἐν τῷ θεῷ διὰ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ δι᾿ οὗ νῦν τὴν καταλλαγὴν ἐλάβομεν',
   'ou monon de alla kai kauchōmenoi en tō theō dia tou kyriou hēmōn Iēsou Christou di hou nyn tēn katallagēn elabomen',
   '''Joy in God'' (kauchōmenoi en tō theō — boasting in God himself; the climax: we don''t just rejoice in peace, access, hope, or reconciliation — we rejoice in God himself). ''Atonement'' (katallagēn — reconciliation; the KJV''s ''atonement'' here means at-one-ment, the making of enemies into friends). ''Now received'' — reconciliation is a present possession, not a future hope. God himself is the believer''s joy.',
   NULL),
  (12, 'Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:',
   'Διὰ τοῦτο ὥσπερ δι᾿ ἑνὸς ἀνθρώπου ἡ ἁμαρτία εἰς τὸν κόσμον εἰσῆλθεν καὶ διὰ τῆς ἁμαρτίας ὁ θάνατος καὶ οὕτως εἰς πάντας ἀνθρώπους ὁ θάνατος διῆλθεν ἐφ᾿ ᾧ πάντες ἥμαρτον',
   'Dia touto hōsper di henos anthrōpou hē hamartia eis ton kosmon eisēlthen kai dia tēs hamartias ho thanatos kai houtōs eis pantas anthrōpous ho thanatos diēlthen eph hō pantes hēmarton',
   '''By one man'' (di henos anthrōpou — through one man, Adam). ''Sin entered'' (hē hamartia eisēlthen — sin came in; sin is personified as an invader). ''Death by sin'' (dia tēs hamartias ho thanatos — death came through sin as its consequence). ''Death passed upon all men'' (eis pantas anthrōpous ho thanatos diēlthen — death spread to all people). ''For that all have sinned'' (eph hō pantes hēmarton — because all sinned; the phrase is debated: (a) because all sinned individually, or (b) because all sinned in Adam representatively). The sentence begun here is grammatically incomplete — the ''as … so'' parallel is not completed until vv.18-19.',
   'This verse introduces the Adam-Christ parallel that structures the rest of the chapter. Adam is presented as the head of the old humanity, whose single act of disobedience brought sin and death upon the entire human race. The phrase ''for that all have sinned'' (eph hō pantes hēmarton) is one of the most debated in Romans. The best reading combines both individual and representative dimensions: all die because all are connected to Adam, and this connection manifests in universal personal sinning. Adam''s role as the representative head of humanity makes him the ''type'' (typos, v.14) of Christ, the head of the new humanity.'),
  (13, '(For until the law sin was in the world: but sin is not imputed when there is no law.',
   'ἄχρι γὰρ νόμου ἁμαρτία ἦν ἐν κόσμῳ ἁμαρτία δὲ οὐκ ἐλλογεῖται μὴ ὄντος νόμου',
   'achri gar nomou hamartia ēn en kosmō hamartia de ouk ellogeitai mē ontos nomou',
   '''Until the law'' (achri nomou — from Adam to Moses). ''Sin was in the world'' — sin existed before the Mosaic law. ''Sin is not imputed'' (ouk ellogeitai — not charged to one''s account; a bookkeeping term). Without a specific command, sin cannot be formally charged as transgression. Yet death still reigned (v.14), proving that sin''s power predated the law.',
   NULL),
  (14, 'Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come.',
   'ἀλλ᾿ ἐβασίλευσεν ὁ θάνατος ἀπὸ Ἀδὰμ μέχρι Μωϋσέως καὶ ἐπὶ τοὺς μὴ ἁμαρτήσαντας ἐπὶ τῷ ὁμοιώματι τῆς παραβάσεως Ἀδάμ ὅς ἐστιν τύπος τοῦ μέλλοντος',
   'all ebasileusen ho thanatos apo Adam mechri Mōyseōs kai epi tous mē hamartēsantas epi tō homoiōmati tēs parabaseōs Adam hos estin typos tou mellontos',
   '''Death reigned'' (ebasileusen ho thanatos — death ruled as king; death is personified as a monarch). ''From Adam to Moses'' — the period without the Mosaic law. ''Not sinned after the similitude of Adam''s transgression'' — they did not break a specific command as Adam did, yet they died. Death''s universal reign proves that all are connected to Adam. ''Figure of him that was to come'' (typos tou mellontos — a type, a pattern of the coming one; Adam foreshadows Christ as a representative head of humanity). Adam and Christ are the two representative men — what each did affects all who are ''in'' them.',
   NULL),
  (15, 'But not as the offence, so also is the free gift. For if through the offence of one many be dead, much more the grace of God, and the gift by grace, which is by one man, Jesus Christ, hath abounded unto many.',
   'Ἀλλ᾿ οὐχ ὡς τὸ παράπτωμα οὕτως καὶ τὸ χάρισμα εἰ γὰρ τῷ τοῦ ἑνὸς παραπτώματι οἱ πολλοὶ ἀπέθανον πολλῷ μᾶλλον ἡ χάρις τοῦ θεοῦ καὶ ἡ δωρεὰ ἐν χάριτι τῇ τοῦ ἑνὸς ἀνθρώπου Ἰησοῦ Χριστοῦ εἰς τοὺς πολλοὺς ἐπερίσσευσεν',
   'All ouch hōs to paraptōma houtōs kai to charisma ei gar tō tou henos paraptōmati hoi polloi apethanon pollō mallon hē charis tou theou kai hē dōrea en chariti tē tou henos anthrōpou Iēsou Christou eis tous pollous eperisseusen',
   '''Not as the offence, so also is the free gift'' — the parallel is not exact; the gift FAR exceeds the offence. ''Much more'' (pollō mallon) — if one man''s sin was powerful enough to bring death to many, how much MORE powerful is God''s grace through one man, Jesus Christ. The ''much more'' of grace over sin is the controlling theme of vv.15-21.',
   NULL),
  (16, 'And not as it was by one that sinned, so is the gift: for the judgment was by one to condemnation, but the free gift is of many offences unto justification.',
   'καὶ οὐχ ὡς δι᾿ ἑνὸς ἁμαρτήσαντος τὸ δώρημα τὸ μὲν γὰρ κρίμα ἐξ ἑνὸς εἰς κατάκριμα τὸ δὲ χάρισμα ἐκ πολλῶν παραπτωμάτων εἰς δικαίωμα',
   'kai ouch hōs di henos hamartēsantos to dōrēma to men gar krima ex henos eis katakrima to de charisma ek pollōn paraptōmatōn eis dikaiōma',
   '''Judgment … by one to condemnation'' (krima ex henos eis katakrima — one sin triggered condemnation). ''Free gift … of many offences unto justification'' (charisma ek pollōn paraptōmatōn eis dikaiōma — the gift overcomes not just one sin but MANY offences and produces justification). The asymmetry: one sin → condemnation; many sins → justification. Grace does not merely match sin; it overwhelms it.',
   NULL),
  (17, 'For if by one man''s offence death reigned by one; much more they which receive abundance of grace and of the gift of righteousness shall reign in life by one, Jesus Christ.)',
   'εἰ γὰρ τῷ τοῦ ἑνὸς παραπτώματι ὁ θάνατος ἐβασίλευσεν διὰ τοῦ ἑνός πολλῷ μᾶλλον οἱ τὴν περισσείαν τῆς χάριτος καὶ τῆς δωρεᾶς τῆς δικαιοσύνης λαμβάνοντες ἐν ζωῇ βασιλεύσουσιν διὰ τοῦ ἑνὸς Ἰησοῦ Χριστοῦ',
   'ei gar tō tou henos paraptōmati ho thanatos ebasileusen dia tou henos pollō mallon hoi tēn perisseian tēs charitos kai tēs dōreas tēs dikaiosynēs lambanontes en zōē basileusousin dia tou henos Iēsou Christou',
   '''Death reigned by one'' — Adam''s sin enthroned death as king over humanity. ''Shall reign in life'' (en zōē basileusousin — will reign in life; the reversal is dramatic: in Adam, death reigns over us; in Christ, WE reign in life). ''Abundance of grace'' (perisseian tēs charitos — the overflow, the surplus of grace). ''Gift of righteousness'' (dōreas tēs dikaiosynēs — righteousness as a free gift). Believers are not merely rescued from death''s tyranny; they become co-rulers in Christ''s kingdom of life.',
   NULL),
  (18, 'Therefore as by the offence of one judgment came upon all men to condemnation; even so by the righteousness of one the free gift came upon all men unto justification of life.',
   'ἄρα οὖν ὡς δι᾿ ἑνὸς παραπτώματος εἰς πάντας ἀνθρώπους εἰς κατάκριμα οὕτως καὶ δι᾿ ἑνὸς δικαιώματος εἰς πάντας ἀνθρώπους εἰς δικαίωσιν ζωῆς',
   'ara oun hōs di henos paraptōmatos eis pantas anthrōpous eis katakrima houtōs kai di henos dikaiōmatos eis pantas anthrōpous eis dikaiōsin zōēs',
   '''Offence of one'' (henos paraptōmatos — one trespass). ''Condemnation'' (katakrima — the judicial sentence of guilty). ''Righteousness of one'' (henos dikaiōmatos — one righteous act; referring to Christ''s obedience, supremely his obedient death on the cross). ''Justification of life'' (dikaiōsin zōēs — justification that results in life, or the justification that consists of life). The complete parallel: one trespass → condemnation for all; one righteous act → justification-of-life for all (i.e., for all who believe, as context makes clear).',
   NULL),
  (19, 'For as by one man''s disobedience many were made sinners, so by the obedience of one shall many be made righteous.',
   'ὥσπερ γὰρ διὰ τῆς παρακοῆς τοῦ ἑνὸς ἀνθρώπου ἁμαρτωλοὶ κατεστάθησαν οἱ πολλοί οὕτως καὶ διὰ τῆς ὑπακοῆς τοῦ ἑνὸς δίκαιοι κατασταθήσονται οἱ πολλοί',
   'hōsper gar dia tēs parakoēs tou henos anthrōpou hamartōloi katestathēsan hoi polloi houtōs kai dia tēs hypakoēs tou henos dikaioi katastathēsontai hoi polloi',
   '''Disobedience'' (parakoēs — a failure to listen, mishearing; from para + akouō: hearing amiss). ''Made sinners'' (hamartōloi katestathēsan — were constituted, appointed, placed in the category of sinners). ''Obedience'' (hypakoēs — obedient listening; from hypo + akouō: listening under authority). ''Made righteous'' (dikaioi katastathēsontai — will be constituted righteous). The parallel is symmetrical: as Adam''s disobedience constituted many as sinners, Christ''s obedience constitutes many as righteous. This is the doctrine of imputation in its clearest form.',
   'This verse is the definitive statement of representative headship and double imputation. Adam''s disobedience was not merely his own — it was ''imputed'' to all who are ''in Adam'' (all humanity). Christ''s obedience is ''imputed'' to all who are ''in Christ'' (all believers). The verb katestathēsan (were constituted) means ''were placed in the legal category of.'' This is not about individual moral character but about legal standing: in Adam, we are constituted sinners; in Christ, we are constituted righteous.'),
  (20, 'Moreover the law entered, that the offence might abound. But where sin abounded, grace did much more abound:',
   'νόμος δὲ παρεισῆλθεν ἵνα πλεονάσῃ τὸ παράπτωμα οὗ δὲ ἐπλεόνασεν ἡ ἁμαρτία ὑπερεπερίσσευσεν ἡ χάρις',
   'nomos de pareisēlthen hina pleonasē to paraptōma hou de epleonasen hē hamartia hyperperisseusen hē charis',
   '''Entered'' (pareisēlthen — came in alongside, entered by the side; the law was not the main act but a supporting actor in the drama of redemption). ''That the offence might abound'' (hina pleonasē to paraptōma — so that transgression might increase; the law was given not to reduce sin but to expose and multiply it). ''Much more abound'' (hyperperisseusen — super-abounded, overflowed beyond measure; a double compound: hyper + perisseuo. Grace does not merely match sin — it overwhelms, drowns, and buries it).',
   'This verse contains one of the most striking declarations in all of Scripture: ''where sin abounded, grace did much more abound.'' The verb hyperperisseusen (super-abounded) is stronger than epleonasen (abounded): no matter how high sin rises, grace rises higher still. The law''s purpose was not to provide a ladder to God but to expose the depth of sin, so that grace might be recognized as the only solution. This sets up the question of 6:1: ''Shall we continue in sin, that grace may abound?'''),
  (21, 'That as sin hath reigned unto death, even so might grace reign through righteousness unto eternal life by Jesus Christ our Lord.',
   'ἵνα ὥσπερ ἐβασίλευσεν ἡ ἁμαρτία ἐν τῷ θανάτῳ οὕτως καὶ ἡ χάρις βασιλεύσῃ διὰ δικαιοσύνης εἰς ζωὴν αἰώνιον διὰ Ἰησοῦ Χριστοῦ τοῦ κυρίου ἡμῶν',
   'hina hōsper ebasileusen hē hamartia en tō thanatō houtōs kai hē charis basileusē dia dikaiosynēs eis zōēn aiōnion dia Iēsou Christou tou kyriou hēmōn',
   '''Sin hath reigned unto death'' (hē hamartia ebasileusen en tō thanatō — sin ruled as king, and death was its domain). ''Grace reign through righteousness'' (hē charis basileusē dia dikaiosynēs — grace reigns as the new sovereign, but it reigns THROUGH righteousness, not at the expense of it). ''Unto eternal life'' (eis zōēn aiōnion — the destination of grace''s reign). ''By Jesus Christ our Lord'' — the mediator of this new regime. The old regime: sin → death. The new regime: grace → righteousness → eternal life → through Christ.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 5;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 peace
  ('εἰρήνη', 'eirēnē', 'G1515', 'Peace — the cessation of hostility, the state of harmony with God. Not merely a feeling but an objective reality: the war between the holy God and the sinful human being has been ended by Christ''s atoning death. Eirēnē corresponds to the Hebrew shalom — wholeness, well-being, restored relationship. Peace with God is the first fruit of justification.', 1),
  -- v.2 access
  ('προσαγωγή', 'prosagōgē', 'G4318', 'Access, introduction, audience with a king — the word was used for being formally presented to a monarch by a court official. Christ is the one who ushers believers into the royal presence of God''s grace. We do not sneak in or earn entry; we are formally introduced by the Son himself. This access is permanent: we ''stand'' (hestēkamen, perfect tense) in grace.', 2),
  -- v.8 commendeth love
  ('συνίστημι', 'synistēmi', 'G4921', 'To demonstrate, to prove, to establish — from syn (together) + histēmi (to stand). God ''stands together'' his love with the evidence of Christ''s death: the cross is the proof, the demonstration, the visible exhibit of divine love. God does not merely claim to love; he proves it with the most costly action imaginable.', 3),
  -- v.10 reconciled
  ('καταλλάσσω', 'katallassō', 'G2644', 'To reconcile, to exchange enmity for friendship — from kata (down, thoroughly) + allassō (to change). God took the initiative to change the relationship: we were enemies (echthroi), and through Christ''s death he exchanged our hostility for harmony. Reconciliation is God''s act, not ours — we ''received'' it (v.11), we did not achieve it.', 4),
  -- v.12 sin entered
  ('παράπτωμα', 'paraptōma', 'G3900', 'Trespass, offence, false step — from para (beside) + piptō (to fall). Literally a fall beside the path, a deviation from the right way. Adam''s single paraptōma (trespass) brought condemnation upon all humanity (v.18). Christ''s single dikaiōma (righteous act) brings justification of life. The word appears nine times in the chapter, emphasizing the catastrophic consequences of one wrong step.', 5),
  -- v.20 grace super-abounded
  ('ὑπερπερισσεύω', 'hyperperisseuō', 'G5248', 'To super-abound, to overflow beyond all measure — a double compound: hyper (over, beyond) + perisseuō (to abound, to overflow). Grace does not merely match sin''s increase; it overwhelms and drowns it. No matter how high sin rises, grace rises immeasurably higher. This is Paul''s triumphant answer to the problem of sin: grace is not just sufficient; it is superabundant.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 5
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 8
    WHEN 4 THEN 10
    WHEN 5 THEN 12
    WHEN 6 THEN 20
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 peace with God
  (1, 'Isaiah 53:5', 1),
  (1, 'Ephesians 2:14-17', 2),
  (1, 'Colossians 1:20', 3),
  -- v.2 access
  (2, 'Ephesians 2:18', 4),
  (2, 'Ephesians 3:12', 5),
  -- v.3-4 tribulation worketh patience
  (3, 'James 1:2-4', 6),
  (3, '1 Peter 1:6-7', 7),
  -- v.5 love shed abroad by Spirit
  (5, 'Galatians 4:6', 8),
  (5, 'Galatians 5:22', 9),
  -- v.6 Christ died for the ungodly
  (6, '1 Peter 3:18', 10),
  -- v.8 God commendeth his love
  (8, 'John 3:16', 11),
  (8, '1 John 4:9-10', 12),
  -- v.9 saved from wrath
  (9, '1 Thessalonians 1:10', 13),
  (9, '1 Thessalonians 5:9', 14),
  -- v.10 reconciled by his death
  (10, '2 Corinthians 5:18-21', 15),
  (10, 'Colossians 1:21-22', 16),
  -- v.12 by one man sin entered
  (12, 'Genesis 3:6-19', 17),
  (12, '1 Corinthians 15:21-22', 18),
  -- v.14 Adam a type of Christ
  (14, '1 Corinthians 15:45-49', 19),
  -- v.19 obedience of one
  (19, 'Philippians 2:8', 20),
  (19, 'Hebrews 5:8-9', 21),
  -- v.20 where sin abounded
  (20, 'Romans 6:1', 22),
  (20, 'Romans 7:7-13', 23),
  -- v.21 grace reign unto eternal life
  (21, 'Romans 6:23', 24),
  (21, 'John 10:28', 25)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 5
  AND v.verse_number = cr.verse_number;
