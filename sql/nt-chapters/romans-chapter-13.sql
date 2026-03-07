-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 13 — Submission to Authority and the Armour of Light
-- 14 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 13,
  'Romans 13 addresses two great themes: the Christian''s relationship to civil government (vv.1-7) and the urgency of love in light of Christ''s return (vv.8-14). Paul commands: ''Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God'' (v.1). Resistance to authority is resistance to God''s ordinance (v.2). Rulers are God''s ministers (diakonos, v.4; leitourgoi, v.6) — servants of God to execute justice, rewarding good and punishing evil. Christians must render tribute, custom, fear, and honour (v.7). The second section shifts to love as the fulfilment of the law: ''Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law'' (v.8). Love does no ill to its neighbour and thus fulfils every commandment (vv.9-10). The chapter climaxes with an eschatological wake-up call: ''knowing the time, that now it is high time to awake out of sleep: for now is our salvation nearer than when we believed'' (v.11). The night is far spent, the day is at hand — therefore ''put on the armour of light'' (v.12) and ''put ye on the Lord Jesus Christ, and make not provision for the flesh'' (v.14). This last verse was instrumental in Augustine''s conversion.',
  'Civil Obedience, Love as Fulfilment, and the Armour of Light',
  'ἐξουσία (exousia)',
  'Authority, power, governing power — from exesti (it is permitted). In this chapter, exousia refers to civil authorities as ordained by God. No authority exists apart from God''s sovereign permission. This does not legitimise tyranny but establishes the principle that government itself is a divine institution for the ordering of society.',
  '["Submission to Governing Authorities (vv.1-7): Let every soul be subject unto the higher powers for there is no power but of God the powers that be are ordained of God. Whosoever therefore resisteth the power resisteth the ordinance of God. For rulers are not a terror to good works but to the evil. For he is the minister of God to thee for good. Render therefore to all their dues tribute to whom tribute is due custom to whom custom fear to whom fear honour to whom honour","Love Fulfils the Law (vv.8-10): Owe no man any thing but to love one another for he that loveth another hath fulfilled the law. For this Thou shalt not commit adultery Thou shalt not kill Thou shalt not steal Thou shalt not bear false witness Thou shalt not covet and if there be any other commandment it is briefly comprehended in this saying namely Thou shalt love thy neighbour as thyself. Love worketh no ill to his neighbour therefore love is the fulfilling of the law","The Urgency of the Hour: Put on Christ (vv.11-14): And that knowing the time that now it is high time to awake out of sleep for now is our salvation nearer than when we believed. The night is far spent the day is at hand let us therefore cast off the works of darkness and let us put on the armour of light. Put ye on the Lord Jesus Christ and make not provision for the flesh to fulfil the lusts thereof"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.',
   'πᾶσα ψυχὴ ἐξουσίαις ὑπερεχούσαις ὑποτασσέσθω οὐ γὰρ ἔστιν ἐξουσία εἰ μὴ ὑπὸ θεοῦ αἱ δὲ οὖσαι ἐξουσίαι ὑπὸ τοῦ θεοῦ τεταγμέναι εἰσίν',
   'pasa psychē exousiais hyperechousais hypotassesthō ou gar estin exousia ei mē hypo theou hai de ousai exousiai hypo tou theou tetagmenai eisin',
   '''Every soul'' (pasa psychē — every person without exception, including Christians). ''Subject'' (hypotassesthō — be subordinate, arrange oneself under; a military term for taking one''s place in rank). ''Higher powers'' (exousiais hyperechousais — governing authorities, those in positions of superiority). ''Ordained'' (tetagmenai — appointed, established; from tassō, to arrange in order). Government is a divine institution.',
   'Paul writes during Nero''s early reign (c. AD 57), when the Roman government was relatively stable under the guidance of Seneca and Burrus. His teaching establishes a general principle: civil government is ordained by God as an institution. This does not mean every act of every ruler is divinely approved, nor does it prohibit all resistance (cf. Acts 5:29: ''we ought to obey God rather than men''). The principle is that government itself — the ordering of society through law — is God''s provision for a fallen world.'),
  (2, 'Whosoever therefore resisteth the power, resisteth the ordinance of God: and they that resist shall receive to themselves damnation.',
   'ὥστε ὁ ἀντιτασσόμενος τῇ ἐξουσίᾳ τῇ τοῦ θεοῦ διαταγῇ ἀνθέστηκεν οἱ δὲ ἀνθεστηκότες ἑαυτοῖς κρίμα λήψονται',
   'hōste ho antitassomenos tē exousia tē tou theou diatagē anthestēken hoi de anthestēkotes heautois krima lēpsontai',
   '''Resisteth'' (antitassomenos — sets himself against; anti + tassō, the opposite of hypotassō). ''Ordinance'' (diatagē — arrangement, institution). ''Damnation'' (krima — judgment; not necessarily eternal damnation but judicial consequence). Resisting legitimate authority is resisting God''s arrangement. The judgment may come from human courts or from God.',
   NULL),
  (3, 'For rulers are not a terror to good works, but to the evil. Wilt thou then not be afraid of the power? do that which is good, and thou shalt have praise of the same:',
   'οἱ γὰρ ἄρχοντες οὐκ εἰσὶν φόβος τῶν ἀγαθῶν ἔργων ἀλλὰ τῶν κακῶν θέλεις δὲ μὴ φοβεῖσθαι τὴν ἐξουσίαν τὸ ἀγαθὸν ποίει καὶ ἕξεις ἔπαινον ἐξ αὐτῆς',
   'hoi gar archontes ouk eisin phobos tōn agathōn ergōn alla tōn kakōn theleis de mē phobeisthai tēn exousian to agathon poiei kai hexeis epainon ex autēs',
   '''Rulers'' (archontes — those in authority). ''Terror'' (phobos — fear, cause of fear). ''Praise'' (epainon — approval, commendation). Paul describes the ideal function of government: punishing evil and praising good. When rulers fulfil their God-given role, citizens who do good have nothing to fear.',
   NULL),
  (4, 'For he is the minister of God to thee for good. But if thou do that which is evil, be afraid; for he beareth not the sword in vain: for he is the minister of God, a revenger to execute wrath upon him that doeth evil.',
   'θεοῦ γὰρ διάκονός ἐστιν σοὶ εἰς τὸ ἀγαθόν ἐὰν δὲ τὸ κακὸν ποιῇς φοβοῦ οὐ γὰρ εἰκῆ τὴν μάχαιραν φορεῖ θεοῦ γὰρ διάκονός ἐστιν ἔκδικος εἰς ὀργὴν τῷ τὸ κακὸν πράσσοντι',
   'theou gar diakonos estin soi eis to agathon ean de to kakon poiēs phobou ou gar eikē tēn machairan phorei theou gar diakonos estin ekdikos eis orgēn tō to kakon prassonti',
   '''Minister of God'' (theou diakonos — God''s servant; the ruler, even a pagan one, serves a divinely ordained function). ''Sword'' (machairan — the Roman magistrate''s symbol of capital punishment and judicial authority; the ius gladii). ''Beareth not in vain'' (ouk eikē phorei — does not carry it purposelessly). ''Revenger'' (ekdikos — avenger, executor of justice). The state has a legitimate role in executing justice, including the sword.',
   'This verse is the primary NT text on the state''s authority to bear the sword. The ''sword'' (machaira) is not merely symbolic but represents real coercive power, including capital punishment. The ruler acts as God''s ''minister'' (diakonos) — a remarkable title for a pagan emperor. This distinguishes the state''s role in justice (Rom 13) from the individual Christian''s prohibition of personal vengeance (Rom 12:19). The state may punish; the individual must forgive.'),
  (5, 'Wherefore ye must needs be subject, not only for wrath, but also for conscience sake.',
   'διὸ ἀνάγκη ὑποτάσσεσθαι οὐ μόνον διὰ τὴν ὀργὴν ἀλλὰ καὶ διὰ τὴν συνείδησιν',
   'dio anankē hypotassesthai ou monon dia tēn orgēn alla kai dia tēn syneidēsin',
   '''Must needs'' (anankē — necessity). ''Wrath'' (orgēn — fear of punishment). ''Conscience'' (syneidēsin — inner moral awareness). Two motives for submission: (1) fear of punishment (external) and (2) conscience (internal). The Christian obeys not merely to avoid penalty but because submission to legitimate authority is right before God.',
   NULL),
  (6, 'For for this cause pay ye tribute also: for they are God''s ministers, attending continually upon this very thing.',
   'διὰ τοῦτο γὰρ καὶ φόρους τελεῖτε λειτουργοὶ γὰρ θεοῦ εἰσιν εἰς αὐτὸ τοῦτο προσκαρτεροῦντες',
   'dia touto gar kai phorous teleite leitourgoi gar theou eisin eis auto touto proskarterountes',
   '''Tribute'' (phorous — direct taxes). ''Ministers'' (leitourgoi — public servants, liturgists; a stronger word than diakonos in v.4; leitourgos has sacred overtones, used of priestly service). Even tax collection serves a divinely ordained purpose. ''Attending continually'' (proskarterountes — devoting themselves persistently).',
   NULL),
  (7, 'Render therefore to all their dues: tribute to whom tribute is due; custom to whom custom; fear to whom fear; honour to whom honour.',
   'ἀπόδοτε οὖν πᾶσιν τὰς ὀφειλάς τῷ τὸν φόρον τὸν φόρον τῷ τὸ τέλος τὸ τέλος τῷ τὸν φόβον τὸν φόβον τῷ τὴν τιμὴν τὴν τιμήν',
   'apodote oun pasin tas opheilas tō ton phoron ton phoron tō to telos to telos tō ton phobon ton phobon tō tēn timēn tēn timēn',
   '''Render'' (apodote — give back, pay what is owed). ''Tribute'' (phoron — direct tax). ''Custom'' (telos — indirect tax, duty). ''Fear'' (phobon — reverence). ''Honour'' (timēn — respect). Christians owe all of these. This echoes Jesus'' teaching: ''Render unto Caesar the things which are Caesar''s'' (Matthew 22:21).',
   NULL),
  (8, 'Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.',
   'μηδενὶ μηδὲν ὀφείλετε εἰ μὴ τὸ ἀλλήλους ἀγαπᾶν ὁ γὰρ ἀγαπῶν τὸν ἕτερον νόμον πεπλήρωκεν',
   'mēdeni mēden opheilete ei mē to allēlous agapan ho gar agapōn ton heteron nomon peplērōken',
   '''Owe no man any thing'' — not a prohibition of all debt but a principle: keep your obligations current. ''But to love one another'' — the one debt that can never be fully paid off. ''Fulfilled the law'' (nomon peplērōken — has completely fulfilled; perfect tense: the law stands fully satisfied). Love is not less than the law but more: it fulfils everything the law commands.',
   'Paul transitions from civic duty (vv.1-7) to love as the ultimate obligation (vv.8-10). The perpetual debt of love cannot be discharged — we always owe it. This connects to Jesus'' summary of the law (Matthew 22:37-40) and anticipates the detailed application in chapter 14. Love does not abolish the law but fulfils it from within. The one who truly loves another has satisfied every commandment that governs human relationships.'),
  (9, 'For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself.',
   'τὸ γὰρ οὐ μοιχεύσεις οὐ φονεύσεις οὐ κλέψεις οὐ ψευδομαρτυρήσεις οὐκ ἐπιθυμήσεις καὶ εἴ τις ἑτέρα ἐντολή ἐν τούτῳ τῷ λόγῳ ἀνακεφαλαιοῦται ἐν τῷ ἀγαπήσεις τὸν πλησίον σου ὡς σεαυτόν',
   'to gar ou moicheuseis ou phoneuseis ou klepseis ou pseudomartyrēseis ouk epithymēseis kai ei tis hetera entolē en toutō tō logō anakephalaioutai en tō agapēseis ton plēsion sou hōs seauton',
   'Paul lists five of the Ten Commandments (the ''second table'' governing human relationships) and shows they are all ''comprehended'' (anakephalaioutai — summed up, brought to a head; from ana + kephalē, head) in Leviticus 19:18: ''Love thy neighbour as thyself.'' Love is the summary and fulfilment of all relational commands.',
   NULL),
  (10, 'Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.',
   'ἡ ἀγάπη τῷ πλησίον κακὸν οὐκ ἐργάζεται πλήρωμα οὖν νόμου ἡ ἀγάπη',
   'hē agapē tō plēsion kakon ouk ergazetai plērōma oun nomou hē agapē',
   '''Worketh no ill'' (kakon ouk ergazetai — does not work evil). ''Fulfilling'' (plērōma — fullness, completion, fulfilment). Love is the plērōma of the law — it fills the law full, gives it complete expression. This is not antinomianism (lawlessness) but the deepest obedience: love goes beyond the letter to the spirit of every command.',
   NULL),
  (11, 'And that, knowing the time, that now it is high time to awake out of sleep: for now is our salvation nearer than when we believed.',
   'καὶ τοῦτο εἰδότες τὸν καιρόν ὅτι ὥρα ἤδη ὑμᾶς ἐξ ὕπνου ἐγερθῆναι νῦν γὰρ ἐγγύτερον ἡμῶν ἡ σωτηρία ἢ ὅτε ἐπιστεύσαμεν',
   'kai touto eidotes ton kairon hoti hōra ēdē hymas ex hypnou egerthēnai nyn gar engyteron hēmōn hē sōtēria ē hote episteusamen',
   '''Knowing the time'' (eidotes ton kairon — understanding the critical moment; kairos, not chronos: a decisive epoch, not mere clock-time). ''Awake out of sleep'' (ex hypnou egerthēnai — rise from spiritual drowsiness). ''Salvation nearer'' — salvation in its consummation (glorification, Christ''s return). Every passing day brings the parousia closer.',
   'Paul introduces eschatological urgency as the motive for ethical seriousness. The ''time'' (kairos) is the interval between Christ''s first and second comings — an era that grows shorter with each passing moment. ''Salvation'' here refers to the final, complete deliverance at Christ''s return (cf. 8:23). The believer lives between the ''already'' (justified, adopted) and the ''not yet'' (glorified, fully redeemed). This tension fuels moral alertness.'),
  (12, 'The night is far spent, the day is at hand: let us therefore cast off the works of darkness, and let us put on the armour of light.',
   'ἡ νὺξ προέκοψεν ἡ δὲ ἡμέρα ἤγγικεν ἀποθώμεθα οὖν τὰ ἔργα τοῦ σκότους καὶ ἐνδυσώμεθα τὰ ὅπλα τοῦ φωτός',
   'hē nyx proekopsen hē de hēmera ēngiken apothōmetha oun ta erga tou skotous kai endysōmetha ta hopla tou phōtos',
   '''Night'' (nyx — this present evil age). ''Day'' (hēmera — the age to come, inaugurated at Christ''s return). ''Far spent'' (proekopsen — advanced, progressed). ''At hand'' (ēngiken — has drawn near). ''Cast off'' (apothōmetha — put away, like removing clothing). ''Armour of light'' (hopla tou phōtos — weapons of light; hopla is military equipment). The Christian exchanges darkness-garments for light-armour.',
   NULL),
  (13, 'Let us walk honestly, as in the day; not in rioting and drunkenness, not in chambering and wantonness, not in strife and envying.',
   'ὡς ἐν ἡμέρᾳ εὐσχημόνως περιπατήσωμεν μὴ κώμοις καὶ μέθαις μὴ κοίταις καὶ ἀσελγείαις μὴ ἔριδι καὶ ζήλῳ',
   'hōs en hēmera euschēmonōs peripatēsōmen mē kōmois kai methais mē koitais kai aselgeiais mē eridi kai zēlō',
   '''Honestly'' (euschēmonōs — becomingly, decently, with propriety). ''Rioting'' (kōmois — carousing, drunken revelry). ''Chambering'' (koitais — sexual immorality; literally ''beds''). ''Wantonness'' (aselgeiais — sensuality, licentiousness). ''Strife'' (eridi — quarrelling). ''Envying'' (zēlō — jealousy). Three pairs of vices: debauchery, sexual sin, and social discord.',
   NULL),
  (14, 'But put ye on the Lord Jesus Christ, and make not provision for the flesh, to fulfil the lusts thereof.',
   'ἀλλ᾿ ἐνδύσασθε τὸν κύριον Ἰησοῦν Χριστόν καὶ τῆς σαρκὸς πρόνοιαν μὴ ποιεῖσθε εἰς ἐπιθυμίας',
   'all endysasthe ton kyrion Iēsoun Christon kai tēs sarkos pronoian mē poieisthe eis epithymias',
   '''Put on'' (endysasthe — clothe yourselves with; aorist imperative: decisive action). ''The Lord Jesus Christ'' — Christ himself is the garment. ''Provision'' (pronoian — forethought, planning ahead). ''For the flesh'' (tēs sarkos — the sinful nature). ''Lusts'' (epithymias — desires, cravings). Do not plan ahead for how to satisfy sinful desires.',
   'This verse was instrumental in Augustine''s conversion (Confessions 8.12.29). Reading these words, he found the power to abandon his dissolute life. ''Put on Christ'' is more than imitation — it is spiritual union: clothing oneself with Christ''s character, values, and power. The negative command is equally important: do not make plans (pronoian) for satisfying the flesh. Sin often begins with forethought and opportunity. Cut off both, and the flesh is starved.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 13;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 subject
  ('ὑποτάσσω', 'hypotassō', 'G5293', 'To subordinate, place under, submit — from hypo (under) + tassō (to arrange, place in order). A military term: to arrange under a commander. The middle voice (hypotassesthō) implies voluntary self-subordination, not forced subjugation. Christians submit to governing authorities as part of their submission to God who ordained those authorities.', 1),
  -- v.1 ordained / authority
  ('ἐξουσία', 'exousia', 'G1849', 'Authority, power, right to act — from exesti (it is permitted, it is lawful). In Romans 13, exousia refers to civil governing authorities. Paul''s point is that no authority exists apart from God''s sovereign permission. The existing authorities (hai ousai exousiai) have been ''ordained'' (tetagmenai — arranged, appointed) by God. This establishes government as a divine institution.', 2),
  -- v.4 sword
  ('μάχαιρα', 'machaira', 'G3162', 'Sword, short sword — the weapon of Roman justice. The magistrate''s right to bear the sword (ius gladii) represented authority over life and death. Paul affirms the state''s legitimate use of coercive force to punish evil. The sword is not carried ''in vain'' — it is a real instrument of justice, not merely ceremonial.', 3),
  -- v.4 minister
  ('διάκονος', 'diakonos', 'G1249', 'Minister, servant, agent — one who serves another''s purposes. The governing authority is God''s diakonos — serving God''s purpose of maintaining order and executing justice. Remarkably, Paul applies this title to the pagan Roman state. The ruler may not know he serves God, but God uses civil authority to restrain evil and promote the common good.', 4),
  -- v.8 fulfilled the law
  ('πληρόω', 'plēroō', 'G4137', 'To fill, fulfil, complete, bring to full expression — from plērēs (full). Love ''fills full'' the law: it does not abolish or replace the law but satisfies its deepest intention. Every commandment governing human relationships finds its complete expression in self-giving love. The perfect tense (peplērōken) indicates a completed, standing fulfilment.', 5),
  -- v.11 time/season
  ('καιρός', 'kairos', 'G2540', 'Season, opportune time, critical moment — distinct from chronos (clock-time). Kairos denotes a divinely appointed era or turning point. Paul urges believers to understand the kairos: the present age is drawing to its close, and the day of Christ''s return is approaching. This eschatological awareness should produce moral urgency and alertness.', 6),
  -- v.12 armour of light
  ('ὅπλον', 'hoplon', 'G3696', 'Weapon, instrument of warfare, armour — plural hopla means full armour or military equipment. Christians are to ''put on'' (endysōmetha) the weapons of light. The imagery is of a soldier arming for battle at dawn. The Christian''s warfare is real, but the weapons are spiritual: light versus darkness, righteousness versus sin (cf. Ephesians 6:11-17, 2 Corinthians 10:4).', 7),
  -- v.14 put on Christ
  ('ἐνδύω', 'endyō', 'G1746', 'To put on, clothe oneself with — like putting on a garment. ''Put on the Lord Jesus Christ'' means to clothe oneself with his character, to let his life envelop and define yours. This is more than imitation; it is participation in Christ''s risen life. The metaphor connects to baptism (Galatians 3:27: ''as many as have been baptised into Christ have put on Christ'') and to the new self (Ephesians 4:24).', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 13
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1 WHEN 2 THEN 1
    WHEN 3 THEN 4 WHEN 4 THEN 4
    WHEN 5 THEN 8
    WHEN 6 THEN 11
    WHEN 7 THEN 12
    WHEN 8 THEN 14
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 submit to authorities
  (1, '1 Peter 2:13-17', 1),
  (1, 'Titus 3:1', 2),
  (1, 'Daniel 2:21', 3),
  (1, 'John 19:11', 4),
  -- v.2 resist ordinance
  (2, 'Acts 5:29', 5),
  -- v.4 minister of God / sword
  (4, 'Genesis 9:6', 6),
  (4, '1 Peter 2:14', 7),
  -- v.5 conscience
  (5, '1 Peter 2:19', 8),
  -- v.7 render dues
  (7, 'Matthew 22:21', 9),
  (7, 'Mark 12:17', 10),
  -- v.8 love fulfils law
  (8, 'Galatians 5:14', 11),
  (8, 'Matthew 22:37-40', 12),
  (8, 'James 2:8', 13),
  -- v.9 love thy neighbour
  (9, 'Leviticus 19:18', 14),
  (9, 'Exodus 20:13-17', 15),
  (9, 'Galatians 5:14', 16),
  -- v.10 love is fulfilling
  (10, '1 Corinthians 13:4-7', 17),
  -- v.11 salvation nearer
  (11, '1 Thessalonians 5:6-8', 18),
  (11, '1 Peter 4:7', 19),
  (11, 'Hebrews 10:25', 20),
  -- v.12 armour of light
  (12, 'Ephesians 6:11-17', 21),
  (12, '1 Thessalonians 5:8', 22),
  (12, '2 Corinthians 6:7', 23),
  -- v.13 walk honestly
  (13, '1 Thessalonians 4:12', 24),
  (13, 'Galatians 5:19-21', 25),
  -- v.14 put on Christ
  (14, 'Galatians 3:27', 26),
  (14, 'Ephesians 4:24', 27),
  (14, 'Colossians 3:10', 28)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 13
  AND v.verse_number = cr.verse_number;
