-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 7 — The Law, Sin, and the Inner Struggle
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  'Romans 7 explores the believer''s relationship to the law and the agonizing struggle with indwelling sin. Paul begins with a marriage analogy: the law binds a woman to her husband only while he lives; death releases her (vv.1-3). ''Wherefore, my brethren, ye also are become dead to the law by the body of Christ; that ye should be married to another, even to him who is raised from the dead'' (v.4). The old union with the law, far from restraining sin, actually aroused ''the motions of sins'' (v.5). But ''now we are delivered from the law … that we should serve in newness of spirit, and not in the oldness of the letter'' (v.6). Paul then asks: ''Is the law sin? God forbid'' (v.7). The law is not sinful but reveals sin: ''I had not known sin, but by the law'' (v.7). Sin, ''taking occasion by the commandment,'' produced all manner of coveting (v.8) and ''deceived me, and by it slew me'' (v.11). The law is ''holy, and just, and good'' (v.12), but sin used this good instrument as a weapon of death (v.13). From v.14 Paul describes the agonizing inner conflict: ''the good that I would I do not: but the evil which I would not, that I do'' (v.19). He discovers ''a law, that, when I would do good, evil is present with me'' (v.21). ''I delight in the law of God after the inward man: but I see another law in my members, warring against the law of my mind'' (vv.22-23). The chapter climaxes in the cry: ''O wretched man that I am! who shall deliver me from the body of this death?'' (v.24) — and the answer: ''I thank God through Jesus Christ our Lord'' (v.25).',
  'The Believer''s Relationship to the Law and the Inner Struggle',
  'νόμος (nomos)',
  'Law — used 23 times in this chapter with varying nuances: (1) the Mosaic law (vv.1-14), (2) a principle or pattern (vv.21, 23: ''another law,'' ''the law of my mind''), (3) the law of sin (v.23, 25). Paul vindicates the Mosaic law as holy, just, and good (v.12) while showing that it cannot sanctify any more than it can justify. The law reveals sin and even provokes it, but the fault lies with sin, not the law.',
  '["Dead to the Law Through Christ: The Marriage Analogy (vv.1-6): Know ye not brethren how that the law hath dominion over a man as long as he liveth the woman which hath an husband is bound by the law to her husband so long as he liveth but if the husband be dead she is loosed from the law of her husband wherefore my brethren ye also are become dead to the law by the body of Christ that ye should be married to another even to him who is raised from the dead that we should bring forth fruit unto God","Is the Law Sin? The Law Reveals and Provokes Sin (vv.7-13): What shall we say then is the law sin God forbid nay I had not known sin but by the law for I had not known lust except the law had said Thou shalt not covet but sin taking occasion by the commandment wrought in me all manner of concupiscence for without the law sin was dead wherefore the law is holy and the commandment holy and just and good","The Wretched Struggle: The Good I Would I Do Not (vv.14-25): For we know that the law is spiritual but I am carnal sold under sin for that which I do I allow not for what I would that do I not but what I hate that do I for the good that I would I do not but the evil which I would not that I do O wretched man that I am who shall deliver me from the body of this death I thank God through Jesus Christ our Lord"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Know ye not, brethren, (for I speak to them that know the law,) how that the law hath dominion over a man as long as he liveth?',
   'Ἢ ἀγνοεῖτε ἀδελφοί γινώσκουσιν γὰρ νόμον λαλῶ ὅτι ὁ νόμος κυριεύει τοῦ ἀνθρώπου ἐφ᾿ ὅσον χρόνον ζῇ',
   'Ē agnoeite adelphoi ginōskousin gar nomon lalō hoti ho nomos kyrieuei tou anthrōpou eph hoson chronon zē',
   '''Them that know the law'' — Paul addresses those familiar with the Mosaic law (Jewish Christians and God-fearers). ''Dominion'' (kyrieuei — has lordship over; the same verb as 6:9, 14). The principle: the law''s jurisdiction extends only over the living. Death ends the law''s authority. This prepares for the application in v.4.',
   NULL),
  (2, 'For the woman which hath an husband is bound by the law to her husband so long as he liveth; but if the husband be dead, she is loosed from the law of her husband.',
   'ἡ γὰρ ὕπανδρος γυνὴ τῷ ζῶντι ἀνδρὶ δέδεται νόμῳ ἐὰν δὲ ἀποθάνῃ ὁ ἀνήρ κατήργηται ἀπὸ τοῦ νόμου τοῦ ἀνδρός',
   'hē gar hypandros gynē tō zōnti andri dedetai nomō ean de apothanē ho anēr katērgētai apo tou nomou tou andros',
   '''Bound'' (dedetai — has been bound; perfect tense: she is and remains bound). ''Loosed'' (katērgētai — released, discharged; the same word as ''destroyed'' in 6:6). The marriage bond is terminated by death. Paul''s analogy: the believer has ''died'' to the law and is now free to be ''married'' to another — Christ.',
   NULL),
  (3, 'So then if, while her husband liveth, she be married to another man, she shall be called an adulteress: but if her husband be dead, she is free from that law; so that she is no adulteress, though she be married to another man.',
   'ἄρα οὖν ζῶντος τοῦ ἀνδρὸς μοιχαλὶς χρηματίσει ἐὰν γένηται ἀνδρὶ ἑτέρῳ ἐὰν δὲ ἀποθάνῃ ὁ ἀνήρ ἐλευθέρα ἐστὶν ἀπὸ τοῦ νόμου τοῦ μὴ εἶναι αὐτὴν μοιχαλίδα γενομένην ἀνδρὶ ἑτέρῳ',
   'ara oun zōntos tou andros moichalis chrēmatisei ean genētai andri heterō ean de apothanē ho anēr eleuthera estin apo tou nomou tou mē einai autēn moichalida genomenēn andri heterō',
   'The analogy completes the logic: while the husband lives, remarriage is adultery; after his death, she is free. In the application (v.4), it is not the law that dies but the BELIEVER who dies (through union with Christ''s death), thereby ending the law''s jurisdiction and freeing the believer for union with the risen Christ.',
   NULL),
  (4, 'Wherefore, my brethren, ye also are become dead to the law by the body of Christ; that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto God.',
   'ὥστε ἀδελφοί μου καὶ ὑμεῖς ἐθανατώθητε τῷ νόμῳ διὰ τοῦ σώματος τοῦ Χριστοῦ εἰς τὸ γενέσθαι ὑμᾶς ἑτέρῳ τῷ ἐκ νεκρῶν ἐγερθέντι ἵνα καρποφορήσωμεν τῷ θεῷ',
   'hōste adelphoi mou kai hymeis ethanatōthēte tō nomō dia tou sōmatos tou Christou eis to genesthai hymas heterō tō ek nekrōn egerthenti hina karpophorēsōmen tō theō',
   '''Become dead to the law'' (ethanatōthēte tō nomō — you were put to death with respect to the law; passive: God did this through Christ''s crucified body). ''By the body of Christ'' — Christ''s physical death on the cross is the means by which believers died to the law. ''Married to another'' — the risen Christ. ''Bring forth fruit unto God'' (karpophorēsōmen — bear fruit for God). The old marriage to the law was barren (it produced only ''the motions of sins,'' v.5); the new marriage to Christ is fruitful.',
   NULL),
  (5, 'For when we were in the flesh, the motions of sins, which were by the law, did work in our members to bring forth fruit unto death.',
   'ὅτε γὰρ ἦμεν ἐν τῇ σαρκί τὰ παθήματα τῶν ἁμαρτιῶν τὰ διὰ τοῦ νόμου ἐνηργεῖτο ἐν τοῖς μέλεσιν ἡμῶν εἰς τὸ καρποφορῆσαι τῷ θανάτῳ',
   'hote gar ēmen en tē sarki ta pathēmata tōn hamartiōn ta dia tou nomou ēnergeitai en tois melesin hēmōn eis to karpophorēsai tō thanatō',
   '''In the flesh'' (en tē sarki — in the old unregenerate state). ''Motions of sins'' (pathēmata tōn hamartiōn — the passions/impulses of sins). ''By the law'' (dia tou nomou — through the law; the law actually stimulated sinful passions). ''Did work'' (ēnergeitai — were at work, were energized; passive: sin was actively powered). ''Fruit unto death'' — the old union produced death-fruit. The shocking claim: the law, instead of restraining sin, actually energized it.',
   NULL),
  (6, 'But now we are delivered from the law, that being dead wherein we were held; that we should serve in newness of spirit, and not in the oldness of the letter.',
   'νυνὶ δὲ κατηργήθημεν ἀπὸ τοῦ νόμου ἀποθανόντες ἐν ᾧ κατειχόμεθα ὥστε δουλεύειν ἡμᾶς ἐν καινότητι πνεύματος καὶ οὐ παλαιότητι γράμματος',
   'nyni de katērgēthēmen apo tou nomou apothanontes en hō kateichometha hōste douleuein hēmas en kainotēti pneumatos kai ou palaiotēti grammatos',
   '''Delivered'' (katērgēthēmen — released, discharged). ''Being dead'' (apothanontes — having died; the believer died, releasing them from the law''s jurisdiction). ''Newness of spirit'' (kainotēti pneumatos — the new way of the Spirit). ''Oldness of the letter'' (palaiotēti grammatos — the old way of the written code). Two modes of service: the old way (external code, human effort, producing failure) and the new way (internal Spirit, divine power, producing fruit).',
   NULL),
  (7, 'What shall we say then? Is the law sin? God forbid. Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet.',
   'τί οὖν ἐροῦμεν ὁ νόμος ἁμαρτία μὴ γένοιτο ἀλλὰ τὴν ἁμαρτίαν οὐκ ἔγνων εἰ μὴ διὰ νόμου τήν τε γὰρ ἐπιθυμίαν οὐκ ᾔδειν εἰ μὴ ὁ νόμος ἔλεγεν οὐκ ἐπιθυμήσεις',
   'ti oun eroumen ho nomos hamartia mē genoito alla tēn hamartian ouk egnōn ei mē dia nomou tēn te gar epithymian ouk ēdein ei mē ho nomos elegen ouk epithymēseis',
   '''Is the law sin?'' — after 7:5''s startling claim that the law energized sin, Paul must defend the law itself. ''God forbid'' — the strongest denial. ''I had not known sin, but by the law'' — the law''s function is diagnostic: it reveals sin, it does not create it. ''Thou shalt not covet'' (ouk epithymēseis — the 10th commandment, Exodus 20:17). Paul chose this commandment because coveting is entirely internal — it proves that sin is not merely external behavior but internal desire.',
   'Paul''s choice of the 10th commandment is theologically brilliant. Coveting (epithymia) is the one commandment that cannot be obeyed externally while violated internally — it deals with desire itself, the root of all sin. By choosing this commandment, Paul shows that the law penetrates to the heart, exposing sin at its deepest level. The law is not sinful (mē genoito) but revelatory: it turns the floodlight on sin that was already present but unrecognized.'),
  (8, 'But sin, taking occasion by the commandment, wrought in me all manner of concupiscence. For without the law sin was dead.',
   'ἀφορμὴν δὲ λαβοῦσα ἡ ἁμαρτία διὰ τῆς ἐντολῆς κατειργάσατο ἐν ἐμοὶ πᾶσαν ἐπιθυμίαν χωρὶς γὰρ νόμου ἁμαρτία νεκρά',
   'aphormēn de labousa hē hamartia dia tēs entolēs kateirgasato en emoi pasan epithymian chōris gar nomou hamartia nekra',
   '''Taking occasion'' (aphormēn labousa — seizing a base of operations; a military term for a staging ground from which to launch an attack). Sin is personified as a military strategist using the commandment as its base. ''Wrought'' (kateirgasato — produced, accomplished). ''All manner of concupiscence'' (pasan epithymian — every kind of desire). ''Without the law sin was dead'' — sin existed but was dormant, unactivated, like a virus without a host. The commandment gave sin its opportunity.',
   NULL),
  (9, 'For I was alive without the law once: but when the commandment came, sin revived, and I died.',
   'ἐγὼ δὲ ἔζων χωρὶς νόμου ποτέ ἐλθούσης δὲ τῆς ἐντολῆς ἡ ἁμαρτία ἀνέζησεν ἐγὼ δὲ ἀπέθανον',
   'egō de ezōn chōris nomou pote elthousēs de tēs entolēs hē hamartia anezēsen egō de apethanon',
   '''Alive without the law once'' (ezōn chōris nomou pote — I was living apart from the law at some time; possibly referring to childhood innocence before the age of moral accountability, or to Adam''s state before the command). ''Sin revived'' (hē hamartia anezēsen — sin sprang to life again). ''I died'' — not physically but spiritually: the awareness of sin brought the consciousness of death. The commandment that promised life (Lev 18:5) actually brought death because of sin.',
   NULL),
  (10, 'And the commandment, which was ordained to life, I found to be unto death.',
   'καὶ εὑρέθη μοι ἡ ἐντολὴ ἡ εἰς ζωήν αὕτη εἰς θάνατον',
   'kai heurethē moi hē entolē hē eis zōēn hautē eis thanaton',
   '''Ordained to life'' (hē eis zōēn — the one intended for life; cf. Leviticus 18:5: ''the man that doeth them shall live in them''). ''Found to be unto death'' — the commandment''s original purpose was life, but sin perverted its operation. The fault is not in the commandment but in sin that exploited it.',
   NULL),
  (11, 'For sin, taking occasion by the commandment, deceived me, and by it slew me.',
   'ἡ γὰρ ἁμαρτία ἀφορμὴν λαβοῦσα διὰ τῆς ἐντολῆς ἐξηπάτησέν με καὶ δι᾿ αὐτῆς ἀπέκτεινεν',
   'hē gar hamartia aphormēn labousa dia tēs entolēs exēpatēsen me kai di autēs apekteinen',
   '''Deceived'' (exēpatēsen — thoroughly deceived; the ex- prefix intensifies). ''Slew me'' (apekteinen — killed me). Paul echoes Genesis 3: the serpent deceived Eve through the commandment and brought death. Sin operates through deception — it promises pleasure and delivers death, promises freedom and delivers slavery. The commandment is the unwitting instrument, not the cause.',
   NULL),
  (12, 'Wherefore the law is holy, and the commandment holy, and just, and good.',
   'ὥστε ὁ μὲν νόμος ἅγιος καὶ ἡ ἐντολὴ ἁγία καὶ δικαία καὶ ἀγαθή',
   'hōste ho men nomos hagios kai hē entolē hagia kai dikaia kai agathē',
   '''Holy'' (hagios — set apart, sacred; the law reflects God''s holy character). ''Just'' (dikaia — righteous, fair; the law''s demands are morally right). ''Good'' (agathē — beneficial, wholesome; the law aims at human flourishing). Paul''s verdict on the law is unequivocal: the problem is not the law but sin. The law is the good instrument that sin corrupted. Three adjectives defend the law against the charge of being sinful.',
   'This verse is Paul''s definitive verdict on the Mosaic law. Despite everything he has said about the law''s inability to justify (3:20) or sanctify (7:5), and despite sin''s exploitation of the commandment (7:8-11), the law itself remains holy, just, and good. It perfectly reflects God''s character and will. The problem is not the prescription but the patient: the law cannot cure the disease of sin, but its diagnosis is entirely accurate.'),
  (13, 'Was then that which is good made death unto me? God forbid. But sin, that it might appear sin, working death in me by that which is good; that sin by the commandment might become exceeding sinful.',
   'τὸ οὖν ἀγαθὸν ἐμοὶ γέγονεν θάνατος μὴ γένοιτο ἀλλ᾿ ἡ ἁμαρτία ἵνα φανῇ ἁμαρτία διὰ τοῦ ἀγαθοῦ μοι κατεργαζομένη θάνατον ἵνα γένηται καθ᾿ ὑπερβολὴν ἁμαρτωλὸς ἡ ἁμαρτία διὰ τῆς ἐντολῆς',
   'to oun agathon emoi gegonen thanatos mē genoito all hē hamartia hina phanē hamartia dia tou agathou moi katergazomenē thanaton hina genētai kath hyperbolēn hamartōlos hē hamartia dia tēs entolēs',
   '''That sin might appear sin'' (hina phanē hamartia — so that sin might be seen for what it really is). ''Exceeding sinful'' (kath hyperbolēn hamartōlos — sinful beyond measure). The law''s purpose is to expose sin in all its hideousness. Sin''s use of a good instrument (the law) to produce death reveals sin''s true character as supremely evil. The worse sin appears, the more clearly grace is needed.',
   NULL),
  (14, 'For we know that the law is spiritual: but I am carnal, sold under sin.',
   'οἴδαμεν γὰρ ὅτι ὁ νόμος πνευματικός ἐστιν ἐγὼ δὲ σαρκικός εἰμι πεπραμένος ὑπὸ τὴν ἁμαρτίαν',
   'oidamen gar hoti ho nomos pneumatikos estin egō de sarkikos eimi pepramenos hypo tēn hamartian',
   '''Spiritual'' (pneumatikos — of the Spirit, belonging to the spiritual realm). ''Carnal'' (sarkikos — fleshly, belonging to the realm of human weakness). ''Sold under sin'' (pepramenos hypo tēn hamartian — having been sold into slavery under sin; perfect tense: the condition persists). The contrast: the law belongs to the spiritual realm, but ''I'' belong to the realm of the flesh. The mismatch explains the struggle that follows.',
   NULL),
  (15, 'For that which I do I allow not: for what I would, that do I not; but what I hate, that do I.',
   'ὃ γὰρ κατεργάζομαι οὐ γινώσκω οὐ γὰρ ὃ θέλω τοῦτο πράσσω ἀλλ᾿ ὃ μισῶ τοῦτο ποιῶ',
   'ho gar katergazomai ou ginōskō ou gar ho thelō touto prassō all ho misō touto poiō',
   '''I allow not'' (ou ginōskō — I do not understand, I do not recognize as my own). ''What I would'' (ho thelō — what I desire, what I will). ''What I hate'' (ho misō — what I detest). The agonizing contradiction: the person wants to do good but cannot; the person hates evil but does it. This internal civil war is the universal experience of moral frustration.',
   NULL),
  (16, 'If then I do that which I would not, I consent unto the law that it is good.',
   'εἰ δὲ ὃ οὐ θέλω τοῦτο ποιῶ σύμφημι τῷ νόμῳ ὅτι καλός',
   'ei de ho ou thelō touto poiō symphēmi tō nomō hoti kalos',
   '''I consent'' (symphēmi — I agree with, I assent). ''That it is good'' (hoti kalos — that it is morally beautiful). The very fact that the person does not want to sin proves that the law''s standard is recognized as good. The conflict itself is evidence that the law is not the problem — the person agrees with the law even while failing to keep it.',
   NULL),
  (17, 'Now then it is no more I that do it, but sin that dwelleth in me.',
   'νυνὶ δὲ οὐκέτι ἐγὼ κατεργάζομαι αὐτὸ ἀλλ᾿ ἡ οἰκοῦσα ἐν ἐμοὶ ἁμαρτία',
   'nyni de ouketi egō katergazomai auto all hē oikousa en emoi hamartia',
   '''No more I'' — not an evasion of responsibility but an analysis of the inner dynamic: the true self (the self that wills the good) is distinguished from the indwelling sin (hē oikousa en emoi hamartia — sin dwelling in me). Sin is an alien occupying force, not the believer''s true identity. This prepares for the deliverance of ch.8.',
   NULL),
  (18, 'For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not.',
   'οἶδα γὰρ ὅτι οὐκ οἰκεῖ ἐν ἐμοί τοῦτ᾿ ἔστιν ἐν τῇ σαρκί μου ἀγαθόν τὸ γὰρ θέλειν παράκειταί μοι τὸ δὲ κατεργάζεσθαι τὸ καλὸν οὔ',
   'oida gar hoti ouk oikei en emoi tout estin en tē sarki mou agathon to gar thelein parakeitai moi to de katergasesthai to kalon ou',
   '''In me (that is, in my flesh)'' — Paul clarifies: ''in me'' means ''in my flesh,'' the unredeemed aspect of human nature. ''No good thing'' dwells there. ''To will is present'' (thelein parakeitai — the desire is right there). ''But how to perform … I find not'' — the will is present but the power is absent. The diagnosis: the problem is not the will (which is good) but the flesh (which is incapable).',
   NULL),
  (19, 'For the good that I would I do not: but the evil which I would not, that I do.',
   'οὐ γὰρ ὃ θέλω ποιῶ ἀγαθόν ἀλλ᾿ ὃ οὐ θέλω κακὸν τοῦτο πράσσω',
   'ou gar ho thelō poiō agathon all ho ou thelō kakon touto prassō',
   'A restatement of v.15, driving home the hopelessness of the struggle. The repetition is not redundant but emphatic: the inner conflict is relentless and irresolvable by human effort alone. Good intentions are powerless against indwelling sin.',
   NULL),
  (20, 'Now if I do that I would not, it is no more I that do it, but sin that dwelleth in me.',
   'εἰ δὲ ὃ οὐ θέλω ἐγὼ τοῦτο ποιῶ οὐκέτι ἐγὼ κατεργάζομαι αὐτὸ ἀλλ᾿ ἡ οἰκοῦσα ἐν ἐμοὶ ἁμαρτία',
   'ei de ho ou thelō egō touto poiō ouketi egō katergazomai auto all hē oikousa en emoi hamartia',
   'Restates v.17. The indwelling sin (hē oikousa en emoi hamartia) is the agent; the true self is the unwilling participant. Paul is not denying moral responsibility but identifying the internal power structure: there is a ''something'' within that works against the renewed will.',
   NULL),
  (21, 'I find then a law, that, when I would do good, evil is present with me.',
   'εὑρίσκω ἄρα τὸν νόμον τῷ θέλοντι ἐμοὶ ποιεῖν τὸ καλόν ὅτι ἐμοὶ τὸ κακὸν παράκειται',
   'heuriskō ara ton nomon tō thelonti emoi poiein to kalon hoti emoi to kakon parakeitai',
   '''I find then a law'' (heuriskō ton nomon — I discover a principle). ''When I would do good, evil is present'' (parakeitai — lies alongside, is right there). This is the ''law'' or principle that governs the unredeemed flesh: every movement toward good is shadowed by the presence of evil. It is an inescapable dynamic of the fallen condition.',
   NULL),
  (22, 'For I delight in the law of God after the inward man:',
   'συνήδομαι γὰρ τῷ νόμῳ τοῦ θεοῦ κατὰ τὸν ἔσω ἄνθρωπον',
   'synēdomai gar tō nomō tou theou kata ton esō anthrōpon',
   '''Delight'' (synēdomai — rejoice with, take pleasure in; a strong word: genuine delight, not mere assent). ''The law of God'' (tō nomō tou theou — God''s law, the Mosaic law). ''Inward man'' (ton esō anthrōpon — the inner self, the renewed mind). The inward person genuinely loves God''s law. This delight in God''s law distinguishes the speaker from the unregenerate person of ch.1-2 who suppresses truth.',
   NULL),
  (23, 'But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.',
   'βλέπω δὲ ἕτερον νόμον ἐν τοῖς μέλεσίν μου ἀντιστρατευόμενον τῷ νόμῳ τοῦ νοός μου καὶ αἰχμαλωτίζοντά με ἐν τῷ νόμῳ τῆς ἁμαρτίας τῷ ὄντι ἐν τοῖς μέλεσίν μου',
   'blepō de heteron nomon en tois melesin mou antistrateuomenon tō nomō tou noos mou kai aichmalōtizonta me en tō nomō tēs hamartias tō onti en tois melesin mou',
   '''Another law'' (heteron nomon — a different law, a rival principle). ''Warring against'' (antistrateuomenon — waging war against; a military compound: anti + strateuomai). ''Law of my mind'' (tō nomō tou noos mou — the principle operating in the renewed mind that agrees with God''s law). ''Captivity'' (aichmalōtizonta — taking prisoner, making a war captive). ''Law of sin'' (tō nomō tēs hamartias — the principle of sin operating in the body). The inner person is a battlefield where two laws wage war: the law of the mind vs. the law of sin in the members.',
   NULL),
  (24, 'O wretched man that I am! who shall deliver me from the body of this death?',
   'ταλαίπωρος ἐγὼ ἄνθρωπος τίς με ῥύσεται ἐκ τοῦ σώματος τοῦ θανάτου τούτου',
   'talaipōros egō anthrōpos tis me rhysetai ek tou sōmatos tou thanatou toutou',
   '''Wretched'' (talaipōros — miserable, afflicted, pitiable). ''Who shall deliver me?'' (tis me rhysetai — who will rescue me?). ''The body of this death'' (tou sōmatos tou thanatou toutou — this body of death; the mortal body in which sin still dwells). The cry of desperation: the struggle is real, the frustration is intense, and self-deliverance is impossible. The ''who?'' is crucial — not ''what must I do?'' but ''who will rescue me?'' The answer must come from outside.',
   NULL),
  (25, 'I thank God through Jesus Christ our Lord. So then with the mind I myself serve the law of God; but with the flesh the law of sin.',
   'εὐχαριστῶ τῷ θεῷ διὰ Ἰησοῦ Χριστοῦ τοῦ κυρίου ἡμῶν ἄρα οὖν αὐτὸς ἐγὼ τῷ μὲν νοῒ δουλεύω νόμῳ θεοῦ τῇ δὲ σαρκὶ νόμῳ ἁμαρτίας',
   'eucharistō tō theō dia Iēsou Christou tou kyriou hēmōn ara oun autos egō tō men noi douleuō nomō theou tē de sarki nomō hamartias',
   '''I thank God'' — the answer to ''who?'' is God himself, working through Jesus Christ. The deliverance comes from outside, from God through the mediator. ''With the mind I serve the law of God'' — the renewed mind remains committed to God''s law. ''With the flesh the law of sin'' — the unredeemed flesh still gravitates toward sin. The tension persists in this life, but the deliverer has been identified. Chapter 8 will unfold the full deliverance.',
   'The cry of v.24 finds its answer not in greater effort but in a person: Jesus Christ our Lord. The chapter ends with a realistic assessment: the believer simultaneously serves God with the mind and battles sin in the flesh. This tension is resolved not by eradication of the flesh in this life but by the power of the Holy Spirit (ch.8). The ''wretched man'' of v.24 becomes the ''more than conqueror'' of 8:37 — not because the struggle ends but because the deliverer has come.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 7;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.7 covet/lust
  ('ἐπιθυμία', 'epithymia', 'G1939', 'Desire, longing, coveting, lust — from epi (upon, toward) + thymos (passion). Can be neutral (desire) but usually negative in Paul (sinful craving). The 10th commandment targets epithymia because it is the root of all sin — the inward desire that produces outward transgression. Sin lives in desire before it appears in action.', 1),
  -- v.8 taking occasion
  ('ἀφορμή', 'aphormē', 'G874', 'Starting point, base of operations, occasion, opportunity — a military term for the staging area from which an attack is launched. Sin seized the commandment as its base of operations, using God''s good law as a platform from which to attack. The commandment became the springboard for rebellion: the very prohibition inflamed the desire.', 2),
  -- v.12 holy, just, good
  ('ἅγιος', 'hagios', 'G40', 'Holy, sacred, set apart — the law reflects the character of God who gave it. Three adjectives defend the law: hagios (holy — it belongs to God), dikaia (just — its demands are fair), agathē (good — it aims at human flourishing). The law is not the problem; sin is. The prescription is perfect; the patient is sick.', 3),
  -- v.14 carnal / sold under sin
  ('σαρκικός', 'sarkikos', 'G4559', 'Fleshly, carnal, belonging to the realm of human weakness — from sarx (flesh). The contrast with pneumatikos (spiritual, v.14a) could not be sharper: the law belongs to the spiritual realm, but the person (apart from the Spirit''s power) belongs to the realm of the flesh. The flesh is not inherently evil (it is God''s creation) but it is the sphere where sin operates and the person is powerless.', 4),
  -- v.23 warring against
  ('ἀντιστρατεύομαι', 'antistrateuomai', 'G497', 'To wage war against, to take the field against — from anti (against) + strateuomai (to serve as a soldier). The inner life is described as a battlefield where two opposing armies contend: the law of the mind (aligned with God''s law) versus the law of sin (operating in the body''s members). The believer is caught in this crossfire, unable to achieve total victory by willpower alone.', 5),
  -- v.24 wretched
  ('ταλαίπωρος', 'talaipōros', 'G5005', 'Wretched, miserable, enduring hardship — from tlaō (to bear) + pōros (a callus). One who has been worn down by suffering. This is the cry of genuine anguish, not mere theological rhetoric. The person who delights in God''s law (v.22) yet finds himself captive to sin (v.23) cries out for a deliverer from outside. The answer is not self-improvement but divine rescue through Jesus Christ (v.25).', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 7
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 7
    WHEN 2 THEN 8
    WHEN 3 THEN 12
    WHEN 4 THEN 14
    WHEN 5 THEN 23
    WHEN 6 THEN 24
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 dead to the law
  (4, 'Galatians 2:19', 1),
  (4, 'Colossians 2:14', 2),
  -- v.6 newness of spirit
  (6, '2 Corinthians 3:6', 3),
  (6, 'Romans 8:2', 4),
  -- v.7 thou shalt not covet
  (7, 'Exodus 20:17', 5),
  (7, 'Deuteronomy 5:21', 6),
  -- v.8 sin taking occasion
  (8, 'Romans 5:20', 7),
  -- v.10 commandment ordained to life
  (10, 'Leviticus 18:5', 8),
  (10, 'Galatians 3:12', 9),
  -- v.11 sin deceived
  (11, 'Genesis 3:13', 10),
  (11, '2 Corinthians 11:3', 11),
  -- v.12 law is holy
  (12, 'Psalm 19:7-9', 12),
  (12, '1 Timothy 1:8', 13),
  -- v.14 sold under sin
  (14, '1 Kings 21:20', 14),
  -- v.18 in my flesh no good thing
  (18, 'Genesis 6:5', 15),
  -- v.22 delight in law of God
  (22, 'Psalm 1:2', 16),
  (22, 'Psalm 119:97', 17),
  -- v.23 another law warring
  (23, 'Galatians 5:17', 18),
  (23, '1 Peter 2:11', 19),
  -- v.24 who shall deliver
  (24, 'Romans 8:1-2', 20),
  -- v.25 through Jesus Christ
  (25, '1 Corinthians 15:57', 21),
  (25, 'Romans 8:2', 22)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 7
  AND v.verse_number = cr.verse_number;
