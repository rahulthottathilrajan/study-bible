-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 6 — Dead to Sin, Alive to God
-- 23 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Romans 6 answers the inevitable objection to justification by grace: ''Shall we continue in sin, that grace may abound?'' (v.1). Paul''s answer is thunderous: ''God forbid. How shall we, that are dead to sin, live any longer therein?'' (v.2). He grounds the believer''s freedom from sin in union with Christ: ''Know ye not, that so many of us as were baptized into Jesus Christ were baptized into his death?'' (v.3). ''We are buried with him by baptism into death: that like as Christ was raised up from the dead by the glory of the Father, even so we also should walk in newness of life'' (v.4). The ''old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin'' (v.6). The imperative follows the indicative: ''Likewise reckon ye also yourselves to be dead indeed unto sin, but alive unto God through Jesus Christ our Lord'' (v.11). ''Let not sin therefore reign in your mortal body'' (v.12). ''Yield yourselves unto God, as those that are alive from the dead'' (v.13). ''Sin shall not have dominion over you: for ye are not under the law, but under grace'' (v.14). Paul then addresses a second objection: ''Shall we sin, because we are not under the law, but under grace? God forbid'' (v.15). Using the analogy of slavery, he explains that believers have changed masters: once ''servants of sin'' (v.17), now ''servants of righteousness'' (v.18). The chapter closes with the famous declaration: ''For the wages of sin is death; but the gift of God is eternal life through Jesus Christ our Lord'' (v.23).',
  'Union with Christ: Death to Sin and Newness of Life',
  'συσταυρόω (systauroō)',
  'To crucify together with — from syn (with, together) + stauroō (to crucify). The believer''s old self was ''crucified with'' Christ (v.6). This is not a subjective experience to be achieved but an objective reality to be reckoned upon: when Christ died, the believer''s old identity died with him. The power of sin over the believer was broken at the cross. Sanctification flows from this fact.',
  '["Shall We Continue in Sin? Dead to Sin Through Baptism (vv.1-7): Shall we continue in sin that grace may abound God forbid how shall we that are dead to sin live any longer therein know ye not that so many of us as were baptized into Jesus Christ were baptized into his death therefore we are buried with him by baptism into death that like as Christ was raised up from the dead by the glory of the Father even so we also should walk in newness of life knowing this that our old man is crucified with him that the body of sin might be destroyed that henceforth we should not serve sin","Alive unto God: The Imperative of the Indicative (vv.8-14): Now if we be dead with Christ we believe that we shall also live with him likewise reckon ye also yourselves to be dead indeed unto sin but alive unto God through Jesus Christ our Lord let not sin therefore reign in your mortal body for sin shall not have dominion over you for ye are not under the law but under grace","Servants of Righteousness Not of Sin (vv.15-23): Shall we sin because we are not under the law but under grace God forbid know ye not that to whom ye yield yourselves servants to obey his servants ye are being then made free from sin ye became the servants of righteousness for the wages of sin is death but the gift of God is eternal life through Jesus Christ our Lord"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 23 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'What shall we say then? Shall we continue in sin, that grace may abound?',
   'Τί οὖν ἐροῦμεν ἐπιμένωμεν τῇ ἁμαρτίᾳ ἵνα ἡ χάρις πλεονάσῃ',
   'Ti oun eroumen epimenōmen tē hamartia hina hē charis pleonasē',
   '''Continue'' (epimenōmen — persist, remain in; deliberative subjunctive: shall we keep on sinning?). This objection arises naturally from 5:20: if sin''s increase led to grace''s super-increase, why not sin more to get more grace? Paul takes this objection seriously because it reveals a fundamental misunderstanding of grace.',
   NULL),
  (2, 'God forbid. How shall we, that are dead to sin, live any longer therein?',
   'μὴ γένοιτο οἵτινες ἀπεθάνομεν τῇ ἁμαρτίᾳ πῶς ἔτι ζήσομεν ἐν αὐτῇ',
   'mē genoito hoitines apethanomen tē hamartia pōs eti zēsomen en autē',
   '''Dead to sin'' (apethanomen tē hamartia — we died to sin; aorist: a decisive past event). The answer is not ''you must not'' but ''you cannot'' — it would be a contradiction in terms. A dead person has no relationship with the former master. The question ''how shall we?'' is not ethical but logical: it is absurd for those who died to sin to continue living in it.',
   'Paul''s response to antinomianism is not a command but a fact: believers have DIED to sin. This death is not gradual self-improvement but a decisive, completed event. The aorist tense (apethanomen) points to a specific moment — the believer''s union with Christ in his death. From this fact (the indicative), Paul will derive the commands (the imperatives) of vv.11-13. Christian ethics is always rooted in Christian identity: become what you already are.'),
  (3, 'Know ye not, that so many of us as were baptized into Jesus Christ were baptized into his death?',
   'ἢ ἀγνοεῖτε ὅτι ὅσοι ἐβαπτίσθημεν εἰς Χριστὸν Ἰησοῦν εἰς τὸν θάνατον αὐτοῦ ἐβαπτίσθημεν',
   'ē agnoeite hoti hosoi ebaptisthēmen eis Christon Iēsoun eis ton thanaton autou ebaptisthēmen',
   '''Know ye not'' (agnoeite — are you ignorant?). ''Baptized into Jesus Christ'' (ebaptisthēmen eis Christon Iēsoun — immersed into Christ Jesus; baptism represents union with Christ). ''Into his death'' — baptism signifies participation in Christ''s death. The believer was united with Christ in his crucifixion, and baptism is the visible symbol of this invisible reality.',
   NULL),
  (4, 'Therefore we are buried with him by baptism into death: that like as Christ was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.',
   'συνετάφημεν οὖν αὐτῷ διὰ τοῦ βαπτίσματος εἰς τὸν θάνατον ἵνα ὥσπερ ἠγέρθη Χριστὸς ἐκ νεκρῶν διὰ τῆς δόξης τοῦ πατρός οὕτως καὶ ἡμεῖς ἐν καινότητι ζωῆς περιπατήσωμεν',
   'synetaphēmen oun autō dia tou baptismatos eis ton thanaton hina hōsper ēgerthē Christos ek nekrōn dia tēs doxēs tou patros houtōs kai hēmeis en kainotēti zōēs peripatēsōmen',
   '''Buried with him'' (synetaphēmen — co-buried; the syn- prefix marks union). ''By the glory of the Father'' (dia tēs doxēs tou patros — through the Father''s glory/power). ''Newness of life'' (kainotēti zōēs — qualitative newness; kainos means new in kind, not merely new in time). ''Walk'' (peripatēsōmen — conduct our lives, live our daily existence). As Christ''s death-burial-resurrection was a single event, so the believer''s death to sin and newness of life form a single reality.',
   NULL),
  (5, 'For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection:',
   'εἰ γὰρ σύμφυτοι γεγόναμεν τῷ ὁμοιώματι τοῦ θανάτου αὐτοῦ ἀλλὰ καὶ τῆς ἀναστάσεως ἐσόμεθα',
   'ei gar symphytoi gegonamen tō homoiōmati tou thanatou autou alla kai tēs anastaseōs esometha',
   '''Planted together'' (symphytoi — grown together, united organically; from syn + phyō [to grow]; the image is of a graft that becomes one with the plant). ''Likeness'' (homoiōmati — likeness, form; we share in the pattern of Christ''s death, not a literal re-crucifixion). If union with Christ''s death is real, union with his resurrection must follow: the one guarantees the other.',
   NULL),
  (6, 'Knowing this, that our old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin.',
   'τοῦτο γινώσκοντες ὅτι ὁ παλαιὸς ἡμῶν ἄνθρωπος συνεσταυρώθη ἵνα καταργηθῇ τὸ σῶμα τῆς ἁμαρτίας τοῦ μηκέτι δουλεύειν ἡμᾶς τῇ ἁμαρτίᾳ',
   'touto ginōskontes hoti ho palaios hēmōn anthrōpos synestaurōthē hina katargēthē to sōma tēs hamartias tou mēketi douleuein hēmas tē hamartia',
   '''Old man'' (ho palaios hēmōn anthrōpos — our old self, our former identity in Adam). ''Crucified with him'' (synestaurōthē — co-crucified; aorist passive: it happened at a definite point when Christ was crucified). ''Body of sin'' (to sōma tēs hamartias — the body as sin''s instrument, the self under sin''s control). ''Destroyed'' (katargēthē — rendered powerless, made ineffective; not annihilated but decommissioned). ''Serve sin'' (douleuein tē hamartia — be enslaved to sin). The purpose of the co-crucifixion is liberation from sin''s slavery.',
   'This verse introduces the concept of the ''old man'' (palaios anthrōpos) — the former self, the person we were in Adam. This old identity was co-crucified with Christ. The result is not the destruction of the physical body but the decommissioning (katargēthē) of sin''s power over us. The ''body of sin'' — the self as sin''s tool — has been put out of operation. The practical consequence is clear: we no longer MUST serve sin. The tyranny is broken.'),
  (7, 'For he that is dead is freed from sin.',
   'ὁ γὰρ ἀποθανὼν δεδικαίωται ἀπὸ τῆς ἁμαρτίας',
   'ho gar apothanōn dedikaiōtai apo tēs hamartias',
   '''Freed'' (dedikaiōtai — has been justified, acquitted, released; literally ''has been rightwised''). A dead person has been released from all legal obligations and claims. Sin can no longer press its claim on one who has died. This is a general legal principle applied to the believer''s death with Christ: the death that frees from sin''s jurisdiction.',
   NULL),
  (8, 'Now if we be dead with Christ, we believe that we shall also live with him:',
   'εἰ δὲ ἀπεθάνομεν σὺν Χριστῷ πιστεύομεν ὅτι καὶ συζήσομεν αὐτῷ',
   'ei de apethanomen syn Christō pisteuomen hoti kai syzēsomen autō',
   '''Dead with Christ'' (apethanomen syn Christō — we died with Christ; the fact). ''Live with him'' (syzēsomen autō — we shall co-live with him; the consequence). ''We believe'' (pisteuomen — faith embraces both the past fact and the future reality). The logic: since we died with Christ (past), we shall certainly live with him (future). Shared death guarantees shared life.',
   NULL),
  (9, 'Knowing that Christ being raised from the dead dieth no more; death hath no more dominion over him.',
   'εἰδότες ὅτι Χριστὸς ἐγερθεὶς ἐκ νεκρῶν οὐκέτι ἀποθνήσκει θάνατος αὐτοῦ οὐκέτι κυριεύει',
   'eidotes hoti Christos egertheis ek nekrōn ouketi apothnēskei thanatos autou ouketi kyrieuei',
   '''Dieth no more'' (ouketi apothnēskei — no longer dies). ''Death hath no more dominion'' (thanatos autou ouketi kyrieuei — death no longer lords it over him). Christ died once and rose permanently; death''s authority over him is finished forever. Since believers are united with the risen Christ, death''s authority over them is equally broken.',
   NULL),
  (10, 'For in that he died, he died unto sin once: but in that he liveth, he liveth unto God.',
   'ὃ γὰρ ἀπέθανεν τῇ ἁμαρτίᾳ ἀπέθανεν ἐφάπαξ ὃ δὲ ζῇ ζῇ τῷ θεῷ',
   'ho gar apethanen tē hamartia apethanen ephapax ho de zē zē tō theō',
   '''Died unto sin once'' (tē hamartia apethanen ephapax — he died to sin once for all; ephapax — once, unrepeatable, decisive). ''Liveth unto God'' (zē tō theō — he lives to God, for God, in relation to God). Christ''s death was a single, definitive event; his resurrection life is ongoing and eternal. He will never need to deal with sin again; his life is now entirely Godward.',
   NULL),
  (11, 'Likewise reckon ye also yourselves to be dead indeed unto sin, but alive unto God through Jesus Christ our Lord.',
   'οὕτως καὶ ὑμεῖς λογίζεσθε ἑαυτοὺς νεκροὺς μὲν εἶναι τῇ ἁμαρτίᾳ ζῶντας δὲ τῷ θεῷ ἐν Χριστῷ Ἰησοῦ τῷ κυρίῳ ἡμῶν',
   'houtōs kai hymeis logizesthe heautous nekrous men einai tē hamartia zōntas de tō theō en Christō Iēsou tō kyriō hēmōn',
   '''Reckon'' (logizesthe — count, consider, regard as true; present imperative: keep on reckoning; the same word used for ''impute'' in ch.4). This is the pivotal verse of the chapter: the FIRST imperative. Everything before was indicative (what is true); now comes the command (act on what is true). ''Dead indeed unto sin'' — consider it settled. ''Alive unto God'' — orient your entire existence toward God. ''In Christ Jesus'' — the sphere of this new identity.',
   'This verse is the hinge of Romans 6, the point where doctrine becomes practice. ''Reckon'' (logizesthe) means to count as true what God has declared to be true. It is not pretending or hoping but believing the objective reality of our death with Christ and life with Christ. The imperative is grounded in the indicative: we are not told to die to sin (Christ already did that for us) but to RECKON ourselves dead to sin. Faith activates what grace has accomplished.'),
  (12, 'Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.',
   'μὴ οὖν βασιλευέτω ἡ ἁμαρτία ἐν τῷ θνητῷ ὑμῶν σώματι εἰς τὸ ὑπακούειν αὐτῇ ἐν ταῖς ἐπιθυμίαις αὐτοῦ',
   'mē oun basileuetō hē hamartia en tō thnētō hymōn sōmati eis to hypakouein autē en tais epithymiais autou',
   '''Let not sin reign'' (mē basileuetō hē hamartia — stop allowing sin to rule as king). ''In your mortal body'' (en tō thnētō hymōn sōmati — in your body that is subject to death). ''Obey it in the lusts'' — sin seeks to command obedience through bodily desires. The imperative presupposes the indicative: because sin''s dominion has been broken (v.6), believers can now successfully resist its attempts to reclaim the throne.',
   NULL),
  (13, 'Neither yield ye your members as instruments of unrighteousness unto sin: but yield yourselves unto God, as those that are alive from the dead, and your members as instruments of righteousness unto God.',
   'μηδὲ παριστάνετε τὰ μέλη ὑμῶν ὅπλα ἀδικίας τῇ ἁμαρτίᾳ ἀλλὰ παραστήσατε ἑαυτοὺς τῷ θεῷ ὡς ἐκ νεκρῶν ζῶντας καὶ τὰ μέλη ὑμῶν ὅπλα δικαιοσύνης τῷ θεῷ',
   'mēde paristanete ta melē hymōn hopla adikias tē hamartia alla parastēsate heautous tō theō hōs ek nekrōn zōntas kai ta melē hymōn hopla dikaiosynēs tō theō',
   '''Yield'' (paristanete / parastēsate — present to, place at the disposal of; a military term: presenting oneself for service). ''Members'' (melē — body parts, limbs). ''Instruments'' (hopla — tools or weapons; the word can mean either). ''As those that are alive from the dead'' (hōs ek nekrōn zōntas — as people who have come back from death to life). Two choices: present your body parts as weapons of unrighteousness for sin''s army, or as weapons of righteousness for God''s army. The negative (mēde) is present: stop doing this. The positive (parastēsate) is aorist: make a decisive commitment.',
   NULL),
  (14, 'For sin shall not have dominion over you: for ye are not under the law, but under grace.',
   'ἁμαρτία γὰρ ὑμῶν οὐ κυριεύσει οὐ γάρ ἐστε ὑπὸ νόμον ἀλλ᾿ ὑπὸ χάριν',
   'hamartia gar hymōn ou kyrieusei ou gar este hypo nomon all hypo charin',
   '''Shall not have dominion'' (ou kyrieusei — will not lord it over you; future indicative: a promise, not just a wish). ''Under law'' (hypo nomon — under the law''s jurisdiction and condemnation). ''Under grace'' (hypo charin — under grace''s jurisdiction and power). The reason sin cannot dominate believers is that they have changed spheres: from the law-sphere (where sin is empowered by the law, cf. 7:5, 8) to the grace-sphere (where sin''s power is broken). Grace is not merely pardon — it is power.',
   'This verse is pivotal for understanding sanctification. Sin''s dominion is broken not by trying harder to obey the law but by being ''under grace.'' The law, paradoxically, empowers sin (cf. 7:5, 8; 1 Cor 15:56) because it defines transgression without providing the power to obey. Grace both forgives sin and breaks its power. This is the promise of the new covenant: God does not merely demand obedience; he provides the resources for it.'),
  (15, 'What then? shall we sin, because we are not under the law, but under grace? God forbid.',
   'τί οὖν ἁμαρτήσωμεν ὅτι οὐκ ἐσμὲν ὑπὸ νόμον ἀλλ᾿ ὑπὸ χάριν μὴ γένοιτο',
   'ti oun hamartēsōmen hoti ouk esmen hypo nomon all hypo charin mē genoito',
   'The second objection (cf. v.1): if we are not under law, does that give us license to sin? ''God forbid'' — Paul''s emphatic rejection. Freedom from the law does not mean freedom to sin; it means freedom FROM sin. Paul will now use the slavery metaphor to explain.',
   NULL),
  (16, 'Know ye not, that to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; whether of sin unto death, or of obedience unto righteousness?',
   'οὐκ οἴδατε ὅτι ᾧ παριστάνετε ἑαυτοὺς δούλους εἰς ὑπακοήν δοῦλοί ἐστε ᾧ ὑπακούετε ἤτοι ἁμαρτίας εἰς θάνατον ἢ ὑπακοῆς εἰς δικαιοσύνην',
   'ouk oidate hoti hō paristanete heautous doulous eis hypakoēn douloi este hō hypakouete ētoi hamartias eis thanaton ē hypakoēs eis dikaiosynēn',
   '''Servants'' (doulous — slaves; in the ancient world, total ownership). ''To whom ye yield yourselves'' — the language of self-surrender. Everyone serves some master; there is no neutral ground. The only question is WHICH master: sin (leading to death) or obedience (leading to righteousness). Freedom in the absolute sense is an illusion; the real choice is between slaveries.',
   NULL),
  (17, 'But God be thanked, that ye were the servants of sin, but ye have obeyed from the heart that form of doctrine which was delivered you.',
   'χάρις δὲ τῷ θεῷ ὅτι ἦτε δοῦλοι τῆς ἁμαρτίας ὑπηκούσατε δὲ ἐκ καρδίας εἰς ὃν παρεδόθητε τύπον διδαχῆς',
   'charis de tō theō hoti ēte douloi tēs hamartias hypēkousate de ek kardias eis hon paredothēte typon didachēs',
   '''Ye were'' (ēte — past tense: you used to be slaves of sin). ''Obeyed from the heart'' (hypēkousate ek kardias — the obedience was heartfelt, not coerced). ''Form of doctrine'' (typon didachēs — the pattern of teaching; the apostolic gospel). ''Delivered'' (paredothēte — you were handed over to; passive: God transferred them from one master to another). The Romans were not merely told the gospel; they were entrusted to it as slaves are entrusted to a new owner.',
   NULL),
  (18, 'Being then made free from sin, ye became the servants of righteousness.',
   'ἐλευθερωθέντες δὲ ἀπὸ τῆς ἁμαρτίας ἐδουλώθητε τῇ δικαιοσύνῃ',
   'eleutherōthentes de apo tēs hamartias edoulōthēte tē dikaiosynē',
   '''Made free from sin'' (eleutherōthentes apo tēs hamartias — liberated from sin; passive: God freed them). ''Became the servants of righteousness'' (edoulōthēte tē dikaiosynē — were enslaved to righteousness). Freedom from sin is not autonomy but a change of masters. The believer is now righteousness''s slave — obligated to obey the new master just as fully as the old.',
   NULL),
  (19, 'I speak after the manner of men because of the infirmity of your flesh: for as ye have yielded your members servants to uncleanness and to iniquity unto iniquity; even so now yield your members servants to righteousness unto holiness.',
   'ἀνθρώπινον λέγω διὰ τὴν ἀσθένειαν τῆς σαρκὸς ὑμῶν ὥσπερ γὰρ παρεστήσατε τὰ μέλη ὑμῶν δοῦλα τῇ ἀκαθαρσίᾳ καὶ τῇ ἀνομίᾳ εἰς τὴν ἀνομίαν οὕτως νῦν παραστήσατε τὰ μέλη ὑμῶν δοῦλα τῇ δικαιοσύνῃ εἰς ἁγιασμόν',
   'anthrōpinon legō dia tēn astheneian tēs sarkos hymōn hōsper gar parestēsate ta melē hymōn doula tē akatharsia kai tē anomia eis tēn anomian houtōs nyn parastēsate ta melē hymōn doula tē dikaiosynē eis hagiasmon',
   '''I speak after the manner of men'' — Paul acknowledges that the slavery analogy is imperfect (God is not a slave-owner in the oppressive human sense). ''Unto holiness'' (eis hagiasmon — resulting in sanctification, progressive consecration). The call: give your body to righteousness with the same totality that you once gave it to sin.',
   NULL),
  (20, 'For when ye were the servants of sin, ye were free from righteousness.',
   'ὅτε γὰρ δοῦλοι ἦτε τῆς ἁμαρτίας ἐλεύθεροι ἦτε τῇ δικαιοσύνῃ',
   'hote gar douloi ēte tēs hamartias eleutheroi ēte tē dikaiosynē',
   '''Free from righteousness'' (eleutheroi tē dikaiosynē — free with respect to righteousness; they owed righteousness nothing). The irony: ''freedom from righteousness'' sounds like liberty but is actually bondage. When you were sin''s slave, you had no obligation to righteousness — and the result was death (v.21). Such freedom is worse than slavery.',
   NULL),
  (21, 'What fruit had ye then in those things whereof ye are now ashamed? for the end of those things is death.',
   'τίνα οὖν καρπὸν εἴχετε τότε ἐφ᾿ οἷς νῦν ἐπαισχύνεσθε τὸ γὰρ τέλος ἐκείνων θάνατος',
   'tina oun karpon eichete tote eph hois nyn epaischynesthe to gar telos ekeinōn thanatos',
   '''Fruit'' (karpon — results, produce). ''Ashamed'' (epaischynesthe — embarrassed, shamed). ''The end … is death'' (to telos ekeinōn thanatos — the terminal point of those things is death). Looking back, the believer sees that the old life produced nothing worth having — only shame and death. Past sins yielded only shameful fruit leading to destruction.',
   NULL),
  (22, 'But now being made free from sin, and become servants to God, ye have your fruit unto holiness, and the end everlasting life.',
   'νυνὶ δέ ἐλευθερωθέντες ἀπὸ τῆς ἁμαρτίας δουλωθέντες δὲ τῷ θεῷ ἔχετε τὸν καρπὸν ὑμῶν εἰς ἁγιασμόν τὸ δὲ τέλος ζωὴν αἰώνιον',
   'nyni de eleutherōthentes apo tēs hamartias doulōthentes de tō theō echete ton karpon hymōn eis hagiasmon to de telos zōēn aiōnion',
   '''But now'' (nyni de — the great contrast: then vs. now). ''Free from sin … servants to God'' — the exchange of masters is complete. ''Fruit unto holiness'' (karpon eis hagiasmon — fruit leading to sanctification). ''The end everlasting life'' (to telos zōēn aiōnion — the terminal point is eternal life). The new master produces the opposite fruit: holiness and eternal life.',
   NULL),
  (23, 'For the wages of sin is death; but the gift of God is eternal life through Jesus Christ our Lord.',
   'τὰ γὰρ ὀψώνια τῆς ἁμαρτίας θάνατος τὸ δὲ χάρισμα τοῦ θεοῦ ζωὴ αἰώνιος ἐν Χριστῷ Ἰησοῦ τῷ κυρίῳ ἡμῶν',
   'ta gar opsōnia tēs hamartias thanatos to de charisma tou theou zōē aiōnios en Christō Iēsou tō kyriō hēmōn',
   '''Wages'' (opsōnia — soldier''s pay, rations; what sin owes and pays its workers: death). ''Gift'' (charisma — a grace-gift, a free unearned present). The contrast is absolute: sin PAYS wages (you earn death); God GIVES a gift (you receive eternal life). Death is earned; life is given. ''Through Jesus Christ our Lord'' — the final phrase of the chapter, as of ch.5, directing all glory to Christ.',
   'This is perhaps the most memorized verse in Romans and one of the most famous in the Bible. The contrast between opsōnia (wages) and charisma (free gift) is devastatingly clear. If death is what sin pays its workers, then death is precisely what we have earned. But eternal life is not earned — it is a free gift (charisma) from God. The word charisma shares its root with charis (grace): eternal life is a grace-gift, received through union with Christ, never earned by human effort.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 6;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 buried with / newness
  ('συνθάπτω', 'synthaptō', 'G4916', 'To bury together with — from syn (with) + thaptō (to bury). Believers were co-buried with Christ through baptism into death. Burial confirms death and seals it as irreversible. Our old identity was not merely wounded but buried — permanently laid to rest. From this burial, new life emerges, just as Christ rose from the tomb.', 1),
  -- v.6 old man crucified with
  ('συσταυρόω', 'systauroō', 'G4957', 'To crucify together with — from syn (with) + stauroō (to crucify). Our ''old man'' (palaios anthrōpos) — the entire pre-conversion identity in Adam — was co-crucified when Christ was crucified. This is not an experience to be sought but a fact to be believed. The co-crucifixion rendered sin''s power inoperative (katargēthē), breaking the chain of slavery.', 2),
  -- v.11 reckon
  ('λογίζομαι', 'logizomai', 'G3049', 'To reckon, to count, to regard as true — the same word used for imputation in ch.4. The believer is to reckon (count, consider) themselves dead to sin and alive to God. This is not positive thinking or self-deception but faith embracing God''s declared reality. What God has done objectively in Christ, faith appropriates subjectively through reckoning.', 3),
  -- v.13 instruments/weapons
  ('ὅπλον', 'hoplon', 'G3696', 'Instrument, tool, weapon — the word can mean either a tool for work or a weapon for warfare. Your body parts (melē) are either weapons in sin''s army or weapons in God''s army. There is no neutral equipment. The call is to present your members as weapons of righteousness for God''s service — a decisive act of military allegiance to a new commander.', 4),
  -- v.23 wages
  ('ὀψώνιον', 'opsōnion', 'G3800', 'Wages, soldier''s pay, rations — originally the money given to soldiers to buy provisions. Sin is a paymaster: it diligently compensates its workers with exactly what they have earned — death. The metaphor is precise: death is not an arbitrary punishment but the natural, earned consequence of serving sin. In contrast, eternal life is a charisma (grace-gift), never earned.', 5),
  -- v.23 free gift
  ('χάρισμα', 'charisma', 'G5486', 'Free gift, grace-gift — from charis (grace). A charisma is something given without cost to the recipient, out of the generosity of the giver. Eternal life is not wages, reward, or payment — it is a pure gift. The contrast with opsōnia (wages) could not be sharper: sin pays what we deserve; God gives what we could never earn.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 6
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 6
    WHEN 3 THEN 11
    WHEN 4 THEN 13
    WHEN 5 THEN 23 WHEN 6 THEN 23
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 dead to sin
  (2, 'Galatians 2:20', 1),
  (2, 'Colossians 3:3', 2),
  -- v.3-4 baptized into death/burial
  (3, 'Galatians 3:27', 3),
  (4, 'Colossians 2:12', 4),
  -- v.6 old man crucified
  (6, 'Galatians 5:24', 5),
  (6, 'Ephesians 4:22', 6),
  (6, 'Colossians 3:9', 7),
  -- v.8 live with Christ
  (8, '2 Timothy 2:11', 8),
  -- v.9 death no more dominion
  (9, 'Revelation 1:18', 9),
  -- v.11 reckon yourselves dead
  (11, '2 Corinthians 5:15', 10),
  (11, '1 Peter 2:24', 11),
  -- v.13 yield yourselves unto God
  (13, 'Romans 12:1', 12),
  -- v.14 not under law but grace
  (14, 'John 1:17', 13),
  (14, 'Galatians 5:18', 14),
  -- v.16 servants of sin or obedience
  (16, 'John 8:34', 15),
  (16, '2 Peter 2:19', 16),
  -- v.18 freed from sin
  (18, 'John 8:32', 17),
  (18, 'John 8:36', 18),
  -- v.22 fruit unto holiness
  (22, 'Galatians 5:22-23', 19),
  -- v.23 wages of sin is death
  (23, 'Genesis 2:17', 20),
  (23, 'James 1:15', 21),
  (23, 'Romans 5:12', 22),
  (23, 'John 3:16', 23)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 6
  AND v.verse_number = cr.verse_number;
