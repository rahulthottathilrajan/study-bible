-- ═══════════════════════════════════════════════════
-- PHILIPPIANS CHAPTER 3 — Righteousness by Faith & the Upward Call
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Philippians 3 is Paul''s spiritual autobiography and one of Scripture''s most passionate chapters. Warning against Judaizers (the ''dogs'' who demand circumcision), Paul catalogues his own impeccable Jewish credentials — only to declare them rubbish compared to knowing Christ. The great exchange: Paul trades his own righteousness (law-keeping) for Christ''s righteousness (received by faith). This is justification by faith in its most personal expression. Paul then describes the Christian life as a race — forgetting what lies behind and pressing toward the prize of the upward call. He contrasts heavenly citizenship with those whose god is their belly, and closes with the thrilling promise that Christ will transform our lowly bodies into the likeness of His glorious body.',
  'Counting All Loss for the Surpassing Knowledge of Christ',
  'γνῶσις (gnōsis)',
  'Knowledge — specifically here, the surpassing, experiential, personal knowledge of Christ Jesus as Lord (epignōsis), not mere intellectual acquaintance but intimate relational knowing.',
  '["Warning Against Judaizers (vv.1-3): Beware of dogs, evil workers, the concision; true circumcision is of the heart","Paul''s Jewish Credentials Counted Loss (vv.4-8): Circumcised, tribe of Benjamin, Pharisee, blameless — all rubbish for the excellency of knowing Christ","The Righteousness of Faith (vv.9-11): Not mine own righteousness but that which is through faith; knowing Him, the power of His resurrection, the fellowship of His sufferings","Pressing Toward the Mark (vv.12-16): Not already perfect; forgetting what is behind, reaching forth, pressing toward the prize of the high calling","Enemies of the Cross vs. Heavenly Citizens (vv.17-21): Walk as examples; beware of those whose god is their belly; our citizenship is in heaven; Christ will transform our bodies"]'
FROM books b WHERE b.name = 'Philippians';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Finally, my brethren, rejoice in the Lord. To write the same things to you, to me indeed is not grievous, but for you it is safe.',
   'Τὸ λοιπόν ἀδελφοί μου χαίρετε ἐν κυρίῳ τὰ αὐτὰ γράφειν ὑμῖν ἐμοὶ μὲν οὐκ ὀκνηρόν ὑμῖν δὲ ἀσφαλές',
   'To loipon adelphoi mou chairete en kyriō ta auta graphein hymin emoi men ouk oknēron hymin de asphales',
   '''Finally'' (to loipon — as for the rest, furthermore) does not signal the letter''s end but a transition. ''Rejoice in the Lord'' (chairete en kyriō) — the command that defines Philippians. Joy is not optional but imperative, and its source is ''in the Lord,'' not in circumstances. ''The same things'' refers to warnings Paul has given before, perhaps in a lost letter or during visits. Repetition is not tedious (oknēron — burdensome) but ''safe'' (asphales — secure, a safeguard).',
   NULL),
  (2,
   'Beware of dogs, beware of the evil workers, beware of the concision.',
   'βλέπετε τοὺς κύνας βλέπετε τοὺς κακοὺς ἐργάτας βλέπετε τὴν κατατομήν',
   'blepete tous kynas blepete tous kakous ergatas blepete tēn katatomēn',
   'Three staccato warnings (blepete — watch out for, keep your eyes on). ''Dogs'' (kynas) — Jews called Gentiles ''dogs''; Paul reverses the insult against Judaizers who are unclean like scavenging street dogs. ''Evil workers'' (kakous ergatas) — their works are evil despite their religious zeal. ''Concision'' (katatomēn — cutting, mutilation) — a savage wordplay: they claim ''circumcision'' (peritomē) but Paul calls it mere ''cutting'' (katatomē), reducing the sacred rite to pagan mutilation (cf. 1 Kgs 18:28).',
   NULL),
  (3,
   'For we are the circumcision, which worship God in the spirit, and rejoice in Christ Jesus, and have no confidence in the flesh.',
   'ἡμεῖς γάρ ἐσμεν ἡ περιτομή οἱ πνεύματι θεοῦ λατρεύοντες καὶ καυχώμενοι ἐν Χριστῷ Ἰησοῦ καὶ οὐκ ἐν σαρκὶ πεποιθότες',
   'hēmeis gar esmen hē peritomē hoi pneumati theou latreuontes kai kauchōmenoi en Christō Iēsou kai ouk en sarki pepoithotes',
   'Paul claims the title ''circumcision'' for believers — the true covenant people are defined by three marks: (1) worship by the Spirit (pneumati latreuontes — spiritual worship, not mere ritual), (2) rejoicing/boasting in Christ Jesus (kauchōmenoi — glorying, exulting), and (3) no confidence in the flesh (ouk en sarki pepoithotes — not trusting in human achievement, ancestry, or religious performance). True circumcision is of the heart (Rom 2:28-29).',
   'The true people of God are identified not by physical circumcision but by spiritual realities: Spirit-empowered worship, Christ-centred boasting, and rejection of fleshly confidence. This fulfils the OT prophets'' vision of heart-circumcision (Deut 30:6; Jer 4:4; Ezek 36:26).'),
  (4,
   'Though I might also have confidence in the flesh. If any other man thinketh that he hath whereof he might trust in the flesh, I more:',
   'καίπερ ἐγὼ ἔχων πεποίθησιν καὶ ἐν σαρκί εἴ τις δοκεῖ ἄλλος πεποιθέναι ἐν σαρκί ἐγὼ μᾶλλον',
   'kaiper egō echōn pepoithēsin kai en sarki ei tis dokei allos pepoithenai en sarki egō mallon',
   'Paul could out-credential any Judaizer. ''I more'' (egō mallon) — if anyone has grounds for fleshly confidence, Paul exceeds them all. He is not attacking Jewish heritage from the outside as someone who never had it, but from the inside as one who possessed it in its fullest form and found it insufficient. His testimony carries unique weight precisely because he had everything the flesh could offer.',
   NULL),
  (5,
   'Circumcised the eighth day, of the stock of Israel, of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee;',
   'περιτομῇ ὀκταήμερος ἐκ γένους Ἰσραὴλ φυλῆς Βενιαμίν Ἑβραῖος ἐξ Ἑβραίων κατὰ νόμον Φαρισαῖος',
   'peritomē oktaēmeros ek genous Israēl phylēs Beniamin Hebraios ex Hebraiōn kata nomon Pharisaios',
   'Seven credentials in two verses (vv.5-6) — a perfect number: (1) ''Circumcised the eighth day'' — not a proselyte but born into the covenant (Gen 17:12). (2) ''Stock of Israel'' — pure Israelite descent, no Gentile blood. (3) ''Tribe of Benjamin'' — the tribe that gave Israel its first king (Saul), the tribe that remained loyal to Judah. (4) ''Hebrew of the Hebrews'' — Hebrew-speaking, culturally traditional, not Hellenised. (5) ''Pharisee'' — the strictest sect (Acts 26:5), devoted to Torah observance.',
   NULL),
  (6,
   'Concerning zeal, persecuting the church; touching the righteousness which is in the law, blameless.',
   'κατὰ ζῆλος διώκων τὴν ἐκκλησίαν κατὰ δικαιοσύνην τὴν ἐν νόμῳ γενόμενος ἄμεμπτος',
   'kata zēlos diōkōn tēn ekklēsian kata dikaiosynēn tēn en nomō genomenos amemptos',
   '(6) ''Zeal'' — demonstrated by persecuting the church (Acts 8:3, 9:1-2). In Jewish tradition, zeal for God''s honour was the highest virtue (cf. Phinehas, Num 25:11; Elijah, 1 Kgs 19:10). Paul''s violence was motivated by religious devotion. (7) ''Blameless'' (amemptos — without fault in external observance). Paul kept the law flawlessly by human standards. Yet all seven credentials proved worthless for salvation.',
   NULL),
  (7,
   'But what things were gain to me, those I counted loss for Christ.',
   'ἀλλ᾽ ἅτινα ἦν μοι κέρδη ταῦτα ἥγημαι διὰ τὸν Χριστὸν ζημίαν',
   'all'' hatina ēn moi kerdē tauta hēgēmai dia ton Christon zēmian',
   'The great reversal: ''gain'' (kerdē — profits, plural) becomes ''loss'' (zēmian — damage, forfeiture, singular). Everything Paul once placed in the profit column of his spiritual ledger has been moved to the loss column. ''I counted'' (hēgēmai — perfect tense: I have counted and the verdict stands permanently). This is not a one-time emotional experience but a settled, irrevocable assessment. Christ changes the accounting.',
   NULL),
  (8,
   'Yea doubtless, and I count all things but loss for the excellency of the knowledge of Christ Jesus my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Christ,',
   'ἀλλὰ μενοῦνγε καὶ ἡγοῦμαι πάντα ζημίαν εἶναι διὰ τὸ ὑπερέχον τῆς γνώσεως Χριστοῦ Ἰησοῦ τοῦ κυρίου μου δι᾽ ὃν τὰ πάντα ἐζημιώθην καὶ ἡγοῦμαι σκύβαλα ἵνα Χριστὸν κερδήσω',
   'alla menounge kai hēgoumai panta zēmian einai dia to hyperechon tēs gnōseōs Christou Iēsou tou kyriou mou di'' hon ta panta ezēmiōthēn kai hēgoumai skybala hina Christon kerdēsō',
   'Paul intensifies: not just Jewish credentials but ''all things'' (panta) are loss. The reason: ''the excellency'' (to hyperechon — the surpassing greatness, the supreme worth) of ''knowing Christ Jesus my Lord.'' ''My Lord'' — deeply personal. ''Dung'' (skybala — refuse, excrement, table scraps thrown to dogs, rubbish). The strongest word Paul could use: his once-prized achievements are garbage compared to Christ. ''Win Christ'' (Christon kerdēsō) — Christ Himself is the treasure, the profit, the gain.',
   'Justification by faith alone: Paul explicitly rejects his own law-righteousness (v.9) in favour of the righteousness that comes through faith in Christ. All human merit is ''dung'' compared to knowing Christ. Salvation is not earned by religious performance but received through faith in Christ''s finished work.'),
  (9,
   'And be found in him, not having mine own righteousness, which is of the law, but that which is through the faith of Christ, the righteousness which is of God by faith:',
   'καὶ εὑρεθῶ ἐν αὐτῷ μὴ ἔχων ἐμὴν δικαιοσύνην τὴν ἐκ νόμου ἀλλὰ τὴν διὰ πίστεως Χριστοῦ τὴν ἐκ θεοῦ δικαιοσύνην ἐπὶ τῇ πίστει',
   'kai heurethō en autō mē echōn emēn dikaiosynēn tēn ek nomou alla tēn dia pisteōs Christou tēn ek theou dikaiosynēn epi tē pistei',
   'Two righteousnesses contrasted: (1) ''mine own'' (emēn) — self-produced, law-based (ek nomou). (2) ''Through the faith of Christ'' (dia pisteōs Christou) — either ''through faith in Christ'' (objective genitive) or ''through Christ''s faithfulness'' (subjective genitive). ''The righteousness which is of God'' (ek theou) — it originates from God, not from human effort. ''Be found in him'' (heurethō en autō) — Paul''s desire is to be discovered at the last day clothed in Christ''s righteousness, not his own.',
   'Imputed righteousness: The believer receives an alien righteousness — not produced by law-keeping but originating from God and received through faith. This is the heart of the Reformation doctrine: God declares the sinner righteous based on Christ''s merit credited to their account (cf. Rom 3:21-26, 4:3-8; 2 Cor 5:21; Gal 2:16).'),
  (10,
   'That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death;',
   'τοῦ γνῶναι αὐτὸν καὶ τὴν δύναμιν τῆς ἀναστάσεως αὐτοῦ καὶ τὴν κοινωνίαν τῶν παθημάτων αὐτοῦ συμμορφιζόμενος τῷ θανάτῳ αὐτοῦ',
   'tou gnōnai auton kai tēn dynamin tēs anastaseōs autou kai tēn koinōnian tōn pathēmatōn autou symmorphizomenos tō thanatō autou',
   '''Know him'' (gnōnai auton) — personal, experiential knowledge, not mere theology. Three dimensions of knowing Christ: (1) ''the power of his resurrection'' (dynamin tēs anastaseōs) — resurrection power operating now in the believer''s life (cf. Eph 1:19-20). (2) ''The fellowship of his sufferings'' (koinōnian tōn pathēmatōn) — sharing in His sufferings, not as atonement but as identification. (3) ''Conformable unto his death'' (symmorphizomenos tō thanatō) — being moulded into the pattern of His death — dying to self daily. Note the order: resurrection power precedes and enables sharing in suffering.',
   NULL),
  (11,
   'If by any means I might attain unto the resurrection of the dead.',
   'εἴ πως καταντήσω εἰς τὴν ἐξανάστασιν τὴν ἐκ νεκρῶν',
   'ei pōs katantēsō eis tēn exanastasin tēn ek nekrōn',
   '''If by any means'' (ei pōs) does not express doubt about salvation but eager pursuit — Paul is straining toward the goal with everything he has. ''Resurrection of the dead'' (exanastasin — the out-resurrection, a rare compound word using ex/ek [out of] twice). This is not the general resurrection but the specific ''resurrection from among the dead'' — the believers'' resurrection at Christ''s return (cf. 1 Thess 4:16; 1 Cor 15:23). Paul presses forward with resurrection hope.',
   NULL),
  (12,
   'Not as though I had already attained, either were already perfect: but I follow after, if that I may apprehend that for which also I am apprehended of Christ Jesus.',
   'Οὐχ ὅτι ἤδη ἔλαβον ἢ ἤδη τετελείωμαι διώκω δὲ εἰ καὶ καταλάβω ἐφ᾽ ᾧ καὶ κατελήμφθην ὑπὸ Χριστοῦ Ἰησοῦ',
   'Ouch hoti ēdē elabon ē ēdē teteleiōmai diōkō de ei kai katalabō eph'' hō kai katelēmphthēn hypo Christou Iēsou',
   'Paul denies perfectionism: ''not as though I had already attained'' (ēdē elabon) or ''were already perfect'' (teteleiōmai — have been perfected, completed). He is a work in progress. ''I follow after'' (diōkō — I pursue, I chase, I press hard — the same word used for ''persecuting'' in v.6; the persecutor now channels his intensity into pursuing Christ). ''Apprehend'' (katalabō — lay hold of, seize, grasp) — and the beautiful reason: ''because I was apprehended by Christ Jesus'' (katelēmphthēn — Christ seized me first, on the Damascus road). Paul pursues because he was pursued.',
   NULL),
  (13,
   'Brethren, I count not myself to have apprehended: but this one thing I do, forgetting those things which are behind, and reaching forth unto those things which are before,',
   'ἀδελφοί ἐγὼ ἐμαυτὸν οὐ λογίζομαι κατειληφέναι ἓν δέ τὰ μὲν ὀπίσω ἐπιλανθανόμενος τοῖς δὲ ἔμπροσθεν ἐπεκτεινόμενος',
   'adelphoi egō emauton ou logizomai kateilēphenai hen de ta men opisō epilanthanomenos tois de emprosthen epekteinomenos',
   '''This one thing'' (hen de) — Paul''s life has a single focus. ''Forgetting'' (epilanthanomenos — deliberately putting out of mind) the past — both achievements and failures. ''Reaching forth'' (epekteinomenos — stretching forward, like a runner straining toward the finish line with every muscle extended). The athletic imagery is vivid: a sprinter does not look backward. Past victories and past sins are equally irrelevant to the race ahead.',
   NULL),
  (14,
   'I press toward the mark for the prize of the high calling of God in Christ Jesus.',
   'κατὰ σκοπὸν διώκω εἰς τὸ βραβεῖον τῆς ἄνω κλήσεως τοῦ θεοῦ ἐν Χριστῷ Ἰησοῦ',
   'kata skopon diōkō eis to brabeion tēs anō klēseōs tou theou en Christō Iēsou',
   '''Press'' (diōkō — pursue with intensity, chase). ''Mark'' (skopon — goal, target, the finish line marker). ''Prize'' (brabeion — the victor''s award, the laurel wreath given at the Greek games). The ''high calling'' (anō klēseōs — the upward call, the heavenward summons) — God calls believers ever higher, ever deeper, ever forward. The prize is not heaven (that is secured by grace) but the full reward of Christlikeness and the ''well done'' of the Master.',
   NULL),
  (15,
   'Let us therefore, as many as be perfect, be thus minded: and if in any thing ye be otherwise minded, God shall even reveal this unto you.',
   'Ὅσοι οὖν τέλειοι τοῦτο φρονῶμεν καὶ εἴ τι ἑτέρως φρονεῖτε καὶ τοῦτο ὁ θεὸς ὑμῖν ἀποκαλύψει',
   'Hosoi oun teleioi touto phronōmen kai ei ti heterōs phroneite kai touto ho theos hymin apokalypsei',
   '''Perfect'' (teleioi — mature, complete in growth) — a deliberate contrast with v.12 where Paul denied being ''perfect'' (teteleiōmai). Here ''perfect'' means mature believers who understand they are not yet perfected. True maturity knows its incompleteness. ''Otherwise minded'' (heterōs phroneite) — if some disagree, Paul trusts God to ''reveal'' (apokalypsei) the truth to them. Gentle patience with less mature believers.',
   NULL),
  (16,
   'Nevertheless, whereto we have already attained, let us walk by the same rule, let us mind the same thing.',
   'πλὴν εἰς ὃ ἐφθάσαμεν τῷ αὐτῷ στοιχεῖν',
   'plēn eis ho ephthasamen tō autō stoichein',
   '''Walk by the same rule'' (stoichein — to walk in line, to march in step, to follow a line). Whatever level of understanding each believer has reached (ephthasamen — have attained, have arrived at), they should walk consistently with it. Unity does not require uniformity of maturity but uniformity of direction — all walking the same path, even if at different stages of the journey.',
   NULL),
  (17,
   'Brethren, be followers together of me, and mark them which walk so as ye have us for an ensample.',
   'Συμμιμηταί μου γίνεσθε ἀδελφοί καὶ σκοπεῖτε τοὺς οὕτω περιπατοῦντας καθὼς ἔχετε τύπον ἡμᾶς',
   'Symmimētai mou ginesthe adelphoi kai skopeite tous houtō peripatountas kathōs echete typon hēmas',
   '''Followers together'' (symmimētai — co-imitators, joint-imitators). Paul does not say ''imitate me'' alone but ''imitate me together'' — community imitation, not individual hero worship. ''Mark'' (skopeite — observe, fix your eyes on) those who walk (peripatountas — conduct their lives) according to the pattern (typon — model, stamp, example) Paul and his team provide. Christians need visible models, not just abstract teaching.',
   NULL),
  (18,
   '(For many walk, of whom I have told you often, and now tell you even weeping, that they are the enemies of the cross of Christ:',
   'πολλοὶ γὰρ περιπατοῦσιν οὓς πολλάκις ἔλεγον ὑμῖν νῦν δὲ καὶ κλαίων λέγω τοὺς ἐχθροὺς τοῦ σταυροῦ τοῦ Χριστοῦ',
   'polloi gar peripatousin hous pollakis elegon hymin nyn de kai klaiōn legō tous echthrous tou staurou tou Christou',
   'Paul weeps (klaiōn — present participle, tears flowing as he writes). These are not outsiders but professing Christians who are ''enemies of the cross'' (echthrous tou staurou) — not by outright denial but by living as if the cross demands nothing. They may be Judaizers (insisting on law-works, thus negating the cross) or libertines (using grace as licence). Paul''s grief, not anger, shows pastoral heartbreak.',
   NULL),
  (19,
   'Whose end is destruction, whose God is their belly, and whose glory is in their shame, who mind earthly things.)',
   'ὧν τὸ τέλος ἀπώλεια ὧν ὁ θεὸς ἡ κοιλία καὶ ἡ δόξα ἐν τῇ αἰσχύνῃ αὐτῶν οἱ τὰ ἐπίγεια φρονοῦντες',
   'hōn to telos apōleia hōn ho theos hē koilia kai hē doxa en tē aischynē autōn hoi ta epigeia phronountes',
   'Four devastating descriptions: (1) ''End is destruction'' (apōleia — ruin, perdition). (2) ''God is their belly'' (koilia — stomach, appetite — they worship their own desires). (3) ''Glory is in their shame'' (aischynē — what should shame them, they boast about). (4) ''Mind earthly things'' (ta epigeia phronountes — set their mind on earthly things, not heavenly). Each phrase inverts proper spiritual order: destruction instead of salvation, appetite instead of God, shame instead of glory, earth instead of heaven.',
   NULL),
  (20,
   'For our conversation is in heaven; from whence also we look for the Saviour, the Lord Jesus Christ:',
   'ἡμῶν γὰρ τὸ πολίτευμα ἐν οὐρανοῖς ὑπάρχει ἐξ οὗ καὶ σωτῆρα ἀπεκδεχόμεθα κύριον Ἰησοῦν Χριστόν',
   'hēmōn gar to politeuma en ouranois hyparchei ex hou kai sōtēra apekdechometha kyrion Iēsoun Christon',
   '''Conversation'' (politeuma — citizenship, commonwealth, the state to which we belong). Philippi was a Roman colony; citizens there held Roman citizenship and lived by Roman law even though geographically distant from Rome. Paul says believers are a heavenly colony on earth — our true citizenship is ''in heaven'' (en ouranois), and we live by heaven''s laws on foreign soil. ''We look for'' (apekdechometha — eagerly await, expectantly watch for) the Saviour''s return.',
   NULL),
  (21,
   'Who shall change our vile body, that it may be fashioned like unto his glorious body, according to the working whereby he is able even to subdue all things unto himself.',
   'ὃς μετασχηματίσει τὸ σῶμα τῆς ταπεινώσεως ἡμῶν σύμμορφον τῷ σώματι τῆς δόξης αὐτοῦ κατὰ τὴν ἐνέργειαν τοῦ δύνασθαι αὐτὸν καὶ ὑποτάξαι αὐτῷ τὰ πάντα',
   'hos metaschēmatisei to sōma tēs tapeinōseōs hēmōn symmorphon tō sōmati tēs doxēs autou kata tēn energeian tou dynasthai auton kai hypotaxai autō ta panta',
   '''Change'' (metaschēmatisei — transform, transfigure, remodel the outward form). ''Vile body'' (sōma tēs tapeinōseōs — body of humiliation/lowliness — not inherently evil but marked by weakness, decay, mortality). ''Fashioned like'' (symmorphon — conformed to the same form as, sharing the same morphē) ''his glorious body'' (sōmati tēs doxēs — body of glory). Believers will receive bodies like Christ''s resurrection body — imperishable, powerful, glorious (1 Cor 15:42-44). The power to accomplish this: He who can ''subdue all things'' (hypotaxai ta panta — subject the entire universe).',
   'Glorification: The final stage of salvation is the transformation of the believer''s physical body to match Christ''s glorious resurrection body. This is bodily resurrection — not escape from the body but the body''s redemption and transformation (cf. Rom 8:23; 1 Cor 15:42-54; 1 John 3:2).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Philippians' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 2 (Dogs)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κύνας', 'kynas', 'G2965', 'Dogs — scavenger street dogs, considered unclean. Jews used this term for Gentiles; Paul reverses it against Judaizers who act like unclean animals despite their religious pretensions.', 1),
  ('κατατομήν', 'katatomēn', 'G2699', 'Concision, mutilation, cutting — a contemptuous pun on peritomē (circumcision). Reducing the covenant sign to mere flesh-cutting, on par with pagan self-laceration.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 2;

-- Verse 8 (Dung)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερέχον', 'hyperechon', 'G5242', 'Surpassing, excelling, supreme — the knowledge of Christ is of infinitely greater worth than everything else combined.', 1),
  ('σκύβαλα', 'skybala', 'G4657', 'Dung, refuse, excrement, rubbish — the strongest term of contempt available. Everything Paul once prized is garbage compared to Christ. Some scholars: table scraps thrown to dogs (linking back to v.2).', 2),
  ('κερδήσω', 'kerdēsō', 'G2770', 'I may gain, I may win — Christ Himself is the profit, the treasure. Not merely Christ''s gifts but Christ''s person is the prize.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 8;

-- Verse 9 (Righteousness by faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δικαιοσύνην', 'dikaiosynēn', 'G1343', 'Righteousness — right standing before God. Two kinds: self-produced (from law) and God-given (through faith). Only the latter saves.', 1),
  ('πίστεως', 'pisteōs', 'G4102', 'Faith, trust, believing — the instrument through which God''s righteousness is received. Not a work but the empty hand that receives the gift.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 9;

-- Verse 10 (Know him)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γνῶναι', 'gnōnai', 'G1097', 'To know — aorist infinitive: to come to know experientially, personally, intimately. Not mere intellectual knowledge but relational, experiential union with Christ.', 1),
  ('δύναμιν', 'dynamin', 'G1411', 'Power, ability, might — resurrection power operative now in the believer''s life, not only at the future resurrection. The same power that raised Christ energises present Christian living (Eph 1:19-20).', 2),
  ('κοινωνίαν', 'koinōnian', 'G2842', 'Fellowship, sharing, participation — sharing in Christ''s sufferings by identification with Him. Suffering becomes a means of deeper knowing.', 3),
  ('συμμορφιζόμενος', 'symmorphizomenos', 'G4833', 'Being conformed, being moulded into the same form — present participle: an ongoing process of being shaped into the pattern of Christ''s death. Daily dying to self.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Verse 14 (Press toward the mark)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σκοπόν', 'skopon', 'G4649', 'Mark, goal, target — the finish-line marker in the stadium. The single point of focus for the runner. Source of English ''scope.''', 1),
  ('βραβεῖον', 'brabeion', 'G1017', 'Prize, victor''s reward — the laurel wreath or crown awarded at the Greek athletic games. The eternal reward for faithful Christian living (cf. 1 Cor 9:24; 2 Tim 4:8).', 2),
  ('κλήσεως', 'klēseōs', 'G2821', 'Calling, summons, vocation — the ''upward call'' (anō klēseōs) of God. God''s summons that draws believers ever higher toward Himself and Christlikeness.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 14;

-- Verse 20 (Citizenship in heaven)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πολίτευμα', 'politeuma', 'G4175', 'Citizenship, commonwealth, colony — the state to which one belongs. Philippi was a Roman colony; believers are a heavenly colony on earth, living under heaven''s laws.', 1),
  ('ἀπεκδεχόμεθα', 'apekdechometha', 'G553', 'We eagerly await, expectantly look for — from apo (from) + ek (out) + dechomai (to receive). Intense, patient, forward-looking anticipation of Christ''s return.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 20;

-- Verse 21 (Transform our bodies)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετασχηματίσει', 'metaschēmatisei', 'G3345', 'Will transform, will transfigure — from meta (change) + schēma (outward form). The body''s external form will be remade, not discarded. Bodily redemption, not escape from the body.', 1),
  ('σύμμορφον', 'symmorphon', 'G4832', 'Conformed to, sharing the same form as — from syn (with) + morphē (essential form). Our bodies will share the same glorious nature as Christ''s resurrection body.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = 21;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Rejoice in the Lord
  (1, 'Philippians 4:4', 1), (1, '1 Thessalonians 5:16', 2), (1, 'Psalm 37:4', 3),
  -- v2: Beware of Judaizers
  (2, 'Galatians 5:12', 1), (2, '2 Corinthians 11:13-15', 2), (2, 'Galatians 1:6-9', 3),
  -- v3: True circumcision
  (3, 'Romans 2:28-29', 1), (3, 'Colossians 2:11', 2), (3, 'Galatians 6:15', 3),
  -- v5: Jewish credentials
  (5, 'Acts 22:3', 1), (5, 'Acts 26:4-5', 2), (5, '2 Corinthians 11:22', 3),
  -- v6: Blameless under law
  (6, 'Acts 8:3', 1), (6, 'Galatians 1:13-14', 2), (6, 'Luke 1:6', 3),
  -- v8: All things loss
  (8, 'Matthew 13:44-46', 1), (8, 'Luke 14:33', 2), (8, 'Colossians 2:2-3', 3),
  -- v9: Righteousness by faith
  (9, 'Romans 3:21-22', 1), (9, 'Romans 10:3-4', 2), (9, '2 Corinthians 5:21', 3), (9, 'Galatians 2:16', 4),
  -- v10: Know him
  (10, 'Ephesians 1:19-20', 1), (10, 'Romans 6:3-5', 2), (10, '2 Corinthians 4:10', 3), (10, 'Colossians 1:24', 4),
  -- v11: Resurrection
  (11, '1 Corinthians 15:23', 1), (11, '1 Thessalonians 4:16', 2), (11, 'Revelation 20:6', 3),
  -- v12: Not yet perfect
  (12, '1 Timothy 6:12', 1), (12, 'Hebrews 12:1', 2), (12, 'Acts 9:3-6', 3),
  -- v13: Forgetting the past
  (13, 'Luke 9:62', 1), (13, 'Hebrews 6:1', 2), (13, 'Isaiah 43:18-19', 3),
  -- v14: Prize of the high calling
  (14, '1 Corinthians 9:24', 1), (14, '2 Timothy 4:7-8', 2), (14, 'James 1:12', 3),
  -- v17: Be followers of me
  (17, '1 Corinthians 4:16', 1), (17, '1 Corinthians 11:1', 2), (17, '1 Thessalonians 1:6', 3),
  -- v19: Enemies of the cross
  (19, 'Romans 16:18', 1), (19, 'Galatians 6:12', 2), (19, 'Jude 18-19', 3),
  -- v20: Citizenship in heaven
  (20, 'Ephesians 2:6,19', 1), (20, 'Colossians 3:1-4', 2), (20, 'Hebrews 11:13-16', 3), (20, '1 Peter 2:11', 4),
  -- v21: Transform our bodies
  (21, '1 Corinthians 15:42-54', 1), (21, 'Romans 8:23,29', 2), (21, '1 John 3:2', 3), (21, '2 Corinthians 5:1-4', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Philippians' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Philippians Chapter 3 Complete!
-- 21 verses · 8 key verses with word studies (23 words)
-- Cross-references for 17 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════