-- =====================================================================
-- Romans Chapter 10 — "Salvation by Faith for All Who Call"
-- KJV Study Bible seed data
-- =====================================================================
-- STEP 1: Insert the chapter record
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id,
       10,
       'Paul expresses his heart''s desire for Israel''s salvation and explains why they have stumbled: they sought to establish their own righteousness rather than submitting to God''s righteousness revealed in Christ. He declares that Christ is the end (telos) of the law for righteousness to every one that believeth. The chapter then unfolds the universal offer of salvation — the word of faith is near, in the mouth and heart. The famous confession formula appears: "If thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved." Paul establishes the chain of preaching, hearing, and believing, and concludes by showing that Israel heard the gospel but refused to obey, fulfilling Isaiah''s prophecy of a disobedient and gainsaying people.',
       'Salvation by Faith for All Who Call',
       'πίστις',
       'pistis — faith, trust, belief',
       '["Paul''s Prayer for Israel''s Salvation (1-4)","The Righteousness of Faith vs. the Law (5-8)","The Universal Confession of Faith (9-13)","The Chain of Proclamation: Sending, Preaching, Hearing, Believing (14-17)","Israel''s Unbelief Despite Hearing (18-21)"]'
FROM books b WHERE b.name = 'Romans';

-- STEP 2: Insert verses with study data
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Brethren, my heart''s desire and prayer to God for Israel is, that they might be saved.',
   'Ἀδελφοί, ἡ μὲν εὐδοκία τῆς ἐμῆς καρδίας καὶ ἡ δέησις ἡ πρὸς τὸν Θεὸν ὑπὲρ τοῦ Ἰσραήλ ἐστιν εἰς σωτηρίαν.',
   'Adelphoi, hē men eudokia tēs emēs kardias kai hē deēsis hē pros ton Theon hyper tou Israēl estin eis sōtērian.',
   'Paul''s pastoral heart is on full display — despite Israel''s rejection of the gospel, he prays earnestly for their salvation. The word εὐδοκία (eudokia, "good pleasure, desire") expresses not mere wish but deep longing. This parallels his anguish in 9:1-3, showing that the doctrine of election does not nullify evangelistic zeal or intercessory prayer.',
   'The doctrine of divine sovereignty (ch. 9) and human responsibility (ch. 10) stand side by side in Paul''s theology without contradiction. God''s electing purpose does not eliminate the need for prayer and proclamation.'),

  (2, 'For I bear them record that they have a zeal of God, but not according to knowledge.',
   'Μαρτυρῶ γὰρ αὐτοῖς ὅτι ζῆλον Θεοῦ ἔχουσιν, ἀλλ'' οὐ κατ'' ἐπίγνωσιν.',
   'Martyrō gar autois hoti zēlon Theou echousin, all'' ou kat'' epignōsin.',
   'Paul acknowledges Israel''s religious sincerity — they possess ζῆλος (zēlos, "zeal") for God. But sincerity without ἐπίγνωσις (epignōsis, "full knowledge, true understanding") is insufficient. This is a crucial distinction: religious fervor misdirected by ignorance of God''s righteousness in Christ leads to self-righteous striving rather than saving faith.',
   NULL),

  (3, 'For they being ignorant of God''s righteousness, and going about to establish their own righteousness, have not submitted themselves unto the righteousness of God.',
   'Ἀγνοοῦντες γὰρ τὴν τοῦ Θεοῦ δικαιοσύνην, καὶ τὴν ἰδίαν δικαιοσύνην ζητοῦντες στῆσαι, τῇ δικαιοσύνῃ τοῦ Θεοῦ οὐχ ὑπετάγησαν.',
   'Agnoountes gar tēn tou Theou dikaiosynēn, kai tēn idian dikaiosynēn zētountes stēsai, tē dikaiosynē tou Theou ouch hypetagēsan.',
   'Three devastating indictments: (1) ignorance of God''s righteousness, (2) attempting to establish their own, (3) refusal to submit to God''s. The verb ὑποτάσσω (hypotassō, "to submit, place oneself under") reveals that receiving God''s righteousness requires surrender of self-effort — the very thing human pride resists most.',
   'The fundamental error of works-righteousness: sinners cannot establish a righteousness acceptable to God. The only way is submission to the righteousness God freely provides through Christ — the imputed righteousness received by faith alone (sola fide).'),

  (4, 'For Christ is the end of the law for righteousness to every one that believeth.',
   'Τέλος γὰρ νόμου Χριστὸς εἰς δικαιοσύνην παντὶ τῷ πιστεύοντι.',
   'Telos gar nomou Christos eis dikaiosynēn panti tō pisteuonti.',
   'One of the most theologically significant verses in Romans. Τέλος (telos) carries a dual meaning: (1) "end" in the sense of termination — Christ ends the law as a means of achieving righteousness; (2) "goal/fulfillment" — the law pointed to Christ all along. Both senses are true: Christ fulfills the law''s demands and terminates the law as a system of justification. The phrase εἰς δικαιοσύνην ("for righteousness") specifies the realm — it is for righteousness, not for all purposes, that Christ is the law''s end.',
   'Christ is the τέλος of the law — its fulfillment and termination as a means of righteousness. The law remains holy (7:12) and reveals sin (3:20), but it cannot justify. Believers are "not under the law, but under grace" (6:14). This verse is central to Reformed soteriology and the distinction between law and gospel.'),

  (5, 'For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them.',
   'Μωσῆς γὰρ γράφει τὴν δικαιοσύνην τὴν ἐκ τοῦ νόμου, ὅτι ὁ ποιήσας αὐτὰ ἄνθρωπος ζήσεται ἐν αὐτοῖς.',
   'Mōsēs gar graphei tēn dikaiosynēn tēn ek tou nomou, hoti ho poiēsas auta anthrōpos zēsetai en autois.',
   'Paul quotes Leviticus 18:5 to describe the principle of legal righteousness: perfect, unbroken obedience. The standard is absolute — "the man which doeth those things." Since the fall, no one can meet this standard (3:23). This is precisely why the law cannot justify — not because it is flawed, but because fallen humanity cannot keep it perfectly.',
   NULL),

  (6, 'But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Christ down from above:)',
   'Ἡ δὲ ἐκ πίστεως δικαιοσύνη οὕτω λέγει, Μὴ εἴπῃς ἐν τῇ καρδίᾳ σου, Τίς ἀναβήσεται εἰς τὸν οὐρανόν; τοῦτ'' ἔστι Χριστὸν καταγαγεῖν.',
   'Hē de ek pisteōs dikaiosynē houtō legei, Mē eipēs en tē kardia sou, Tis anabēsetai eis ton ouranon? tout'' esti Christon katagagein.',
   'Paul applies Deuteronomy 30:12-14 to Christ. The "righteousness of faith" is personified as speaking. The point: salvation does not require heroic effort — no one needs to ascend to heaven to bring Christ down (He has already come in the incarnation). Paul transforms Moses'' description of the accessible law into a description of the accessible Christ.',
   NULL),

  (7, 'Or, Who shall descend into the deep? (that is, to bring up Christ again from the dead.)',
   'ἤ, Τίς καταβήσεται εἰς τὴν ἄβυσσον; τοῦτ'' ἔστι Χριστὸν ἐκ νεκρῶν ἀναγαγεῖν.',
   'ē, Tis katabēsetai eis tēn abysson? tout'' esti Christon ek nekrōn anagagein.',
   'Continuing the Deuteronomy quotation, Paul applies "the deep" (ἄβυσσος, abyssos) to Christ''s death and resurrection. No one needs to descend to the realm of the dead to raise Christ — He has already risen. Both the incarnation (v.6) and resurrection (v.7) are accomplished facts. The gospel rests on what God has done, not on what we must do.',
   NULL),

  (8, 'But what saith it? The word is nigh thee, even in thy mouth, and in thy heart: that is, the word of faith, which we preach;',
   'Ἀλλὰ τί λέγει; Ἐγγύς σου τὸ ῥῆμά ἐστιν, ἐν τῷ στόματί σου καὶ ἐν τῇ καρδίᾳ σου· τοῦτ'' ἔστι τὸ ῥῆμα τῆς πίστεως ὃ κηρύσσομεν.',
   'Alla ti legei? Engys sou to rhēma estin, en tō stomati sou kai en tē kardia sou; tout'' esti to rhēma tēs pisteōs ho kēryssomen.',
   'The climax of the Deuteronomy application: the ῥῆμα (rhēma, "word, message") is near — already in the mouth and heart. Paul identifies this accessible word as "the word of faith which we preach." Salvation is not distant or difficult to access; it is as near as the gospel message itself. The phrase τὸ ῥῆμα τῆς πίστεως ("the word of faith") means the message that calls for faith, the gospel proclamation.',
   NULL),

  (9, 'That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved.',
   'Ὅτι ἐὰν ὁμολογήσῃς ἐν τῷ στόματί σου Κύριον Ἰησοῦν, καὶ πιστεύσῃς ἐν τῇ καρδίᾳ σου ὅτι ὁ Θεὸς αὐτὸν ἤγειρεν ἐκ νεκρῶν, σωθήσῃ.',
   'Hoti ean homologēsēs en tō stomati sou Kyrion Iēsoun, kai pisteusēs en tē kardia sou hoti ho Theos auton ēgeiren ek nekrōn, sōthēsē.',
   'The most concise salvation formula in the NT. Two elements: (1) ὁμολογέω (homologeō, "confess, publicly declare") — outward confession that Jesus is Lord (Κύριος, Kyrios — the divine title); (2) πιστεύω (pisteuō, "believe") — inward heart-faith in the bodily resurrection. Confession is not mere verbal assent but acknowledgment of Christ''s absolute lordship — a radical claim in the Roman Empire where Caesar was called Kyrios. The order (mouth then heart) follows the Deuteronomy quotation, not theological priority — v.10 reverses the order.',
   'The two inseparable aspects of saving faith: (1) internal belief — genuine heart trust in the risen Christ; (2) external confession — public declaration of Jesus as Lord. Neither exists without the other. This verse refutes both "easy believism" (faith without lordship) and "works salvation" (merit without faith). Salvation is by grace through faith, evidenced by confession.'),

  (10, 'For with the heart man believeth unto righteousness; and with the mouth confession is made unto salvation.',
   'Καρδίᾳ γὰρ πιστεύεται εἰς δικαιοσύνην, στόματι δὲ ὁμολογεῖται εἰς σωτηρίαν.',
   'Kardia gar pisteuetai eis dikaiosynēn, stomati de homologeitai eis sōtērian.',
   'Paul now reverses the order from v.9, placing heart-belief first — this is the theological priority. Heart-faith results in imputed righteousness (εἰς δικαιοσύνην); mouth-confession results in salvation (εἰς σωτηρίαν). The passive voice πιστεύεται ("it is believed") and ὁμολογεῖται ("it is confessed") suggest that both faith and confession are responses to God''s initiative. Righteousness and salvation are distinguished but inseparable — justification (being declared righteous) leads to full salvation (eschatological deliverance).',
   NULL),

  (11, 'For the scripture saith, Whosoever believeth on him shall not be ashamed.',
   'Λέγει γὰρ ἡ γραφή, Πᾶς ὁ πιστεύων ἐπ'' αὐτῷ οὐ καταισχυνθήσεται.',
   'Legei gar hē graphē, Pas ho pisteuōn ep'' autō ou kataischynthēsetai.',
   'Paul quotes Isaiah 28:16, significantly adding πᾶς (pas, "everyone, whosoever"). This addition is theologically deliberate — it universalizes the promise. The word καταισχύνω (kataischynō, "to put to shame, disappoint") means that faith in Christ will never result in ultimate disillusionment. The believer''s hope is secure.',
   NULL),

  (12, 'For there is no difference between the Jew and the Greek: for the same Lord over all is rich unto all that call upon him.',
   'Οὐ γάρ ἐστι διαστολὴ Ἰουδαίου τε καὶ Ἕλληνος· ὁ γὰρ αὐτὸς Κύριος πάντων, πλουτῶν εἰς πάντας τοὺς ἐπικαλουμένους αὐτόν.',
   'Ou gar esti diastolē Ioudaiou te kai Hellēnos; ho gar autos Kyrios pantōn, ploutōn eis pantas tous epikaloumenous auton.',
   'The universality of the gospel demolishes ethnic barriers. Διαστολή (diastolē, "distinction, difference") — there is no distinction in the need for salvation (3:22-23) nor in its availability. The same Lord (Kyrios) is Lord of all and πλουτέω (plouteō, "is rich, abounds") toward all who call. The riches of God''s grace are inexhaustible and impartially distributed.',
   NULL),

  (13, 'For whosoever shall call upon the name of the Lord shall be saved.',
   'Πᾶς γὰρ ὃς ἂν ἐπικαλέσηται τὸ ὄνομα Κυρίου σωθήσεται.',
   'Pas gar hos an epikalēsētai to onoma Kyriou sōthēsetai.',
   'Paul quotes Joel 2:32, one of the great universal promises of Scripture. Ἐπικαλέω (epikaleō, "to call upon, invoke") implies not casual mention but earnest, dependent appeal. In Joel''s context, Κύριος (Kyrios) refers to Yahweh; Paul applies it to Jesus Christ — a powerful affirmation of Christ''s deity. The promise is absolute: πᾶς...σωθήσεται ("everyone...shall be saved"). No exception, no additional condition beyond genuine calling.',
   'This verse applies an OT Yahweh-text to Jesus Christ, confirming His full deity. The Joel prophecy about calling on Yahweh is fulfilled in calling on Jesus as Lord. This is one of the strongest NT proofs of Christ''s identification with Yahweh.'),

  (14, 'How then shall they call on him in whom they have not believed? and how shall they believe in him of whom they have not heard? and how shall they hear without a preacher?',
   'Πῶς οὖν ἐπικαλέσονται εἰς ὃν οὐκ ἐπίστευσαν; πῶς δὲ πιστεύσουσιν οὗ οὐκ ἤκουσαν; πῶς δὲ ἀκούσουσι χωρὶς κηρύσσοντος;',
   'Pōs oun epikalesontai eis hon ouk episteusan? pōs de pisteusousin hou ouk ēkousan? pōs de akousousin chōris kēryssontos?',
   'Paul constructs a logical chain working backward from calling to believing to hearing to preaching. This is the "golden chain of evangelism" — each link is necessary. The four rhetorical questions establish an unbreakable sequence: (1) calling requires believing, (2) believing requires hearing, (3) hearing requires a preacher (κηρύσσω, kēryssō, "to herald, proclaim"). The gospel does not spread by osmosis but by proclamation.',
   'This verse establishes the theological necessity of gospel preaching. Faith comes through the hearing of the proclaimed word. This is foundational for missions theology and the mandate of the Great Commission. The church cannot fulfill its calling without active proclamation.'),

  (15, 'And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!',
   'Πῶς δὲ κηρύξουσιν ἐὰν μὴ ἀποσταλῶσιν; καθὼς γέγραπται, Ὡς ὡραῖοι οἱ πόδες τῶν εὐαγγελιζομένων εἰρήνην, τῶν εὐαγγελιζομένων τὰ ἀγαθά.',
   'Pōs de kēryxousin ean mē apostalōsin? kathōs gegraptai, Hōs hōraioi hoi podes tōn euangelizomenōn eirēnēn, tōn euangelizomenōn ta agatha.',
   'The chain extends: preaching requires sending (ἀποστέλλω, apostellō, from which "apostle" derives). Paul quotes Isaiah 52:7, which originally described messengers announcing Israel''s deliverance from Babylonian exile. The beauty (ὡραῖος, hōraios, "timely, beautiful") is not aesthetic but functional — beautiful because of the message they carry. The gospel is described as εἰρήνη (eirēnē, "peace") and τὰ ἀγαθά ("good things") — the good news of reconciliation with God.',
   NULL),

  (16, 'But they have not all obeyed the gospel. For Esaias saith, Lord, who hath believed our report?',
   'Ἀλλ'' οὐ πάντες ὑπήκουσαν τῷ εὐαγγελίῳ. Ἡσαΐας γὰρ λέγει, Κύριε, τίς ἐπίστευσε τῇ ἀκοῇ ἡμῶν;',
   'All'' ou pantes hypēkousan tō euangeliō. Ēsaias gar legei, Kyrie, tis episteusen tē akoē hēmōn?',
   'The chain is complete but the response is lacking — not all have ὑπακούω (hypakouō, "obeyed, heeded"). Note that Paul equates believing the gospel with obeying it — faith is the obedience God requires (cf. 1:5, "the obedience of faith"). He quotes Isaiah 53:1, the introduction to the greatest OT passage on the suffering Servant. Isaiah''s rhetorical question ("who hath believed?") implies that rejection of the message was predicted and expected.',
   NULL),

  (17, 'So then faith cometh by hearing, and hearing by the word of God.',
   'Ἄρα ἡ πίστις ἐξ ἀκοῆς, ἡ δὲ ἀκοὴ διὰ ῥήματος Θεοῦ.',
   'Ara hē pistis ex akoēs, hē de akoē dia rhēmatos Theou.',
   'A summary statement of immense theological importance. Πίστις (pistis, "faith") comes ἐξ ἀκοῆς (ex akoēs, "from/out of hearing"). Hearing comes διὰ ῥήματος Θεοῦ (dia rhēmatos Theou, "through the word/message of God"). The ῥῆμα (rhēma) here refers to the spoken, proclaimed message — the gospel as preached. Faith is not self-generated but is a response to the divinely appointed means of the preached word.',
   'This verse establishes the Reformed doctrine of the means of grace: God ordinarily works through the preached word to create faith. Faith is not mystical intuition or human decision alone — it is the Spirit-wrought response to the proclaimed gospel. This is why preaching holds a central place in Christian worship and mission.'),

  (18, 'But I say, Have they not heard? Yes verily, their sound went into all the earth, and their words unto the ends of the world.',
   'Ἀλλὰ λέγω, Μὴ οὐκ ἤκουσαν; Μενοῦνγε· εἰς πᾶσαν τὴν γῆν ἐξῆλθεν ὁ φθόγγος αὐτῶν, καὶ εἰς τὰ πέρατα τῆς οἰκουμένης τὰ ῥήματα αὐτῶν.',
   'Alla legō, Mē ouk ēkousan? Menounge; eis pasan tēn gēn exēlthen ho phthongos autōn, kai eis ta perata tēs oikoumenēs ta rhēmata autōn.',
   'Paul anticipates an objection: perhaps Israel didn''t hear? He answers with Psalm 19:4, which originally described creation''s universal testimony. Paul applies it to the gospel''s spread — just as creation''s voice reaches everywhere, so the gospel has gone forth broadly. Israel''s problem is not lack of hearing but lack of believing. The word φθόγγος (phthongos, "sound, voice") emphasizes the audible, public nature of the proclamation.',
   NULL),

  (19, 'But I say, Did not Israel know? First Moses saith, I will provoke you to jealousy by them that are no people, and by a foolish nation I will anger you.',
   'Ἀλλὰ λέγω, Μὴ οὐκ ἔγνω Ἰσραήλ; Πρῶτος Μωσῆς λέγει, Ἐγὼ παραζηλώσω ὑμᾶς ἐπ'' οὐκ ἔθνει, ἐπ'' ἔθνει ἀσυνέτῳ παροργιῶ ὑμᾶς.',
   'Alla legō, Mē ouk egnō Israēl? Prōtos Mōsēs legei, Egō parazēlōsō hymas ep'' ouk ethnei, ep'' ethnei asynstō parargiō hymas.',
   'A second objection: perhaps Israel didn''t understand? Paul quotes Deuteronomy 32:21 where God warns He will use a "no-people" (οὐκ ἔθνος, ouk ethnos) and a "foolish nation" (ἔθνος ἀσύνετον, ethnos asyneton) to provoke Israel to jealousy. This is fulfilled in the Gentile inclusion — God''s acceptance of the Gentiles is designed to stir Israel to emulation. The verb παραζηλόω (parazēloō, "provoke to jealousy") foreshadows the argument of chapter 11.',
   NULL),

  (20, 'But Esaias is very bold, and saith, I was found of them that sought me not; I was made manifest unto them that asked not after me.',
   'Ἡσαΐας δὲ ἀποτολμᾷ καὶ λέγει, Εὑρέθην τοῖς ἐμὲ μὴ ζητοῦσιν, ἐμφανὴς ἐγενόμην τοῖς ἐμὲ μὴ ἐπερωτῶσιν.',
   'Ēsaias de apotolma kai legei, Heurethēn tois eme mē zētousin, emphanēs egenomēn tois eme mē eperōtōsin.',
   'Paul quotes Isaiah 65:1, noting that Isaiah ἀποτολμάω (apotolmaō, "dares boldly") to say this. The Gentiles — who were not seeking God — found Him, while Israel who should have known Him rejected Him. The divine irony: those who did not seek found, and those who sought missed. This perfectly illustrates salvation by grace — God reveals Himself to the undeserving. The verb ἐμφανής (emphanēs, "manifest, visible") emphasizes God''s initiative in self-revelation.',
   NULL),

  (21, 'But to Israel he saith, All day long I have stretched forth my hands unto a disobedient and gainsaying people.',
   'Πρὸς δὲ τὸν Ἰσραὴλ λέγει, Ὅλην τὴν ἡμέραν ἐξεπέτασα τὰς χεῖράς μου πρὸς λαὸν ἀπειθοῦντα καὶ ἀντιλέγοντα.',
   'Pros de ton Israēl legei, Holēn tēn hēmeran exepetasa tas cheiras mou pros laon apeithonta kai antilegonta.',
   'The chapter closes with Isaiah 65:2, a poignant image of God''s patient, outstretched hands toward Israel. The verb ἐκπετάννυμι (ekpetannymi, "to spread out, stretch forth") pictures God with arms open wide in invitation — all day long (ὅλην τὴν ἡμέραν). Yet Israel is described as ἀπειθέω (apeitheō, "disobedient, unbelieving") and ἀντιλέγω (antilegō, "contradicting, gainsaying"). The tragedy: God''s persistent invitation meets persistent refusal. Yet the very persistence of God''s outstretched hands hints at hope — He has not abandoned His people, as chapter 11 will demonstrate.',
   'God''s patience toward Israel despite their disobedience demonstrates both His longsuffering character and human culpability. Israel''s rejection is not due to God''s failure to reach out but to their own obstinate refusal. This sets up the crucial question of chapter 11: "Hath God cast away his people? God forbid."')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 10;

-- STEP 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εὐδοκία', 'eudokia', 'G2107', 'Good pleasure, desire, delight, satisfaction — Paul''s deep, earnest longing for Israel''s salvation, expressing heartfelt affection, not mere intellectual wish', 1),
  ('τέλος', 'telos', 'G5056', 'End, goal, fulfillment, completion — Christ is both the termination of the law as a means of righteousness and the fulfillment of everything the law pointed toward', 2),
  ('ὁμολογέω', 'homologeō', 'G3670', 'To confess, profess, acknowledge publicly — from homo (same) + legō (to speak): to say the same thing, to agree with God''s declaration that Jesus is Lord', 3),
  ('ἐπικαλέω', 'epikaleō', 'G1941', 'To call upon, invoke, appeal to — used of earnest, dependent prayer to God; in Joel 2:32 applied to Yahweh, Paul applies it to Jesus, affirming His deity', 4),
  ('κηρύσσω', 'kēryssō', 'G2784', 'To herald, proclaim publicly, preach — the activity of a κῆρυξ (herald) who announces a king''s message with authority; the ordained means by which faith comes', 5),
  ('ἀκοή', 'akoē', 'G189', 'Hearing, report, message heard — the means through which faith is generated; faith comes by hearing the proclaimed word of God, not by sight or inner feeling', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 10
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 4
    WHEN 3 THEN 9
    WHEN 4 THEN 13
    WHEN 5 THEN 14
    WHEN 6 THEN 17
  END;

-- STEP 4: Insert cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Romans 9:1-3', 1),
  (1, '1 Timothy 2:1-4', 2),
  (2, 'Acts 22:3', 3),
  (2, 'Galatians 1:14', 4),
  (3, 'Philippians 3:9', 5),
  (3, 'Romans 1:17', 6),
  (4, 'Galatians 3:24', 7),
  (4, 'Matthew 5:17', 8),
  (4, 'Colossians 2:14', 9),
  (5, 'Leviticus 18:5', 10),
  (5, 'Galatians 3:12', 11),
  (6, 'Deuteronomy 30:12-14', 12),
  (8, 'Deuteronomy 30:14', 13),
  (9, 'Acts 16:31', 14),
  (9, '1 Corinthians 12:3', 15),
  (9, 'Philippians 2:11', 16),
  (10, 'Romans 4:5', 17),
  (11, 'Isaiah 28:16', 18),
  (11, 'Romans 9:33', 19),
  (12, 'Acts 10:34-35', 20),
  (12, 'Galatians 3:28', 21),
  (13, 'Joel 2:32', 22),
  (13, 'Acts 2:21', 23),
  (14, 'Matthew 28:19-20', 24),
  (15, 'Isaiah 52:7', 25),
  (15, 'Nahum 1:15', 26),
  (16, 'Isaiah 53:1', 27),
  (16, 'John 12:38', 28),
  (17, 'Galatians 3:2', 29),
  (18, 'Psalm 19:4', 30),
  (19, 'Deuteronomy 32:21', 31),
  (20, 'Isaiah 65:1', 32),
  (21, 'Isaiah 65:2', 33)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 10
  AND v.verse_number = cr.verse_number;
