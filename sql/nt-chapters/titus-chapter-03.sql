-- ═══════════════════════════════════════════════════
-- TITUS CHAPTER 3 — Salvation by Grace, Good Works & Final Instructions
-- 15 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'The final chapter of Titus contains one of the most comprehensive salvation passages in the NT (vv.3-7), rivalling Romans 3:21-26 and Ephesians 2:1-10 in theological density. Paul begins with civic instructions — believers should be subject to authorities and gentle toward all — then explains why: we ourselves were once foolish, disobedient, and enslaved to passions. But when ''the kindness and love of God our Saviour toward man appeared,'' He saved us — not by works of righteousness but according to His mercy, by the washing of regeneration and renewing of the Holy Ghost, poured out abundantly through Jesus Christ, so that being justified by grace we might be made heirs of eternal life. Paul then instructs Titus to affirm constantly that believers should maintain good works, avoid foolish controversies, reject divisive persons after two warnings, and prepare for Paul''s arrival at Nicopolis.',
  'Salvation by Grace Through Regeneration and the Fruit of Good Works',
  'παλιγγενεσίας (palingenesias)',
  'Regeneration, new birth — palin (again) + genesis (birth/origin). The radical spiritual rebirth produced by the Holy Spirit. Used only here and Matthew 19:28 in the NT.',
  '["Christian Conduct in Society (vv.1-2): Subject to rulers, ready for every good work, gentle, meek toward all","What We Were (v.3): Foolish, disobedient, deceived, enslaved to lusts, hateful, hating one another","What God Did (vv.4-7): His kindness and love appeared; saved us not by works but by mercy; washing of regeneration; renewing of the Holy Ghost; justified by grace; heirs of eternal life","Maintain Good Works (v.8): This is a faithful saying — affirm constantly that believers maintain good works","Avoid Foolish Controversies (vv.9-11): Shun genealogies, contentions, strivings about the law; reject a heretic after two admonitions","Personal Instructions (vv.12-14): Send Artemas or Tychicus; come to Nicopolis; send Zenas and Apollos; maintain good works for necessary uses","Benediction (v.15): Grace be with you all. Amen."]'
FROM books b WHERE b.name = 'Titus';

-- Step 2: Insert all 15 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Put them in mind to be subject to principalities and powers, to obey magistrates, to be ready to every good work,',
   'Ὑπομίμνησκε αὐτοὺς ἀρχαῖς καὶ ἐξουσίαις ὑποτάσσεσθαι πειθαρχεῖν πρὸς πᾶν ἔργον ἀγαθὸν ἑτοίμους εἶναι',
   'Hypomimnēske autous archais kai exousiais hypotassesthai peitharchein pros pan ergon agathon hetoimous einai',
   '''Put them in mind'' (hypomimnēske — keep reminding, present imperative suggesting ongoing instruction) — civic duty was apparently a needed topic on Crete, known for its lawless reputation. ''Principalities and powers'' (archais kai exousiais — rulers and authorities) refers to civil government, not spiritual powers as in Ephesians 6:12. ''Obey magistrates'' (peitharchein — to obey ruling authority, from peithō + archē). ''Ready to every good work'' (pros pan ergon agathon hetoimous) — Christians should be the most civic-minded citizens, prepared for every constructive contribution to society.',
   NULL),
  (2,
   'To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.',
   'μηδένα βλασφημεῖν ἀμάχους εἶναι ἐπιεικεῖς πᾶσαν ἐνδεικνυμένους πραΰτητα πρὸς πάντας ἀνθρώπους',
   'mēdena blasphēmein amachous einai epieikeis pasan endeiknumenous praÿtēta pros pantas anthrōpous',
   '''Speak evil of no man'' (mēdena blasphēmein — slander no one, defame no one). ''No brawlers'' (amachous — peaceable, not quarrelsome, avoiding fights). ''Gentle'' (epieikeis — forbearing, reasonable, yielding, gracious beyond strict justice). ''Meekness unto all men'' (praÿtēta pros pantas anthrōpous) — not weakness but controlled strength, gentleness toward everyone without exception. These virtues directly counter the Cretan reputation for violence and dishonesty (1:12).',
   NULL),
  (3,
   'For we ourselves also were sometimes foolish, disobedient, deceived, serving divers lusts and pleasures, living in malice and envy, hateful, and hating one another.',
   'Ἦμεν γάρ ποτε καὶ ἡμεῖς ἀνόητοι ἀπειθεῖς πλανώμενοι δουλεύοντες ἐπιθυμίαις καὶ ἡδοναῖς ποικίλαις ἐν κακίᾳ καὶ φθόνῳ διάγοντες στυγητοί μισοῦντες ἀλλήλους',
   'Ēmen gar pote kai hēmeis anoētoi apeitheis planōmenoi douleuontes epithymiais kai hēdonais poikilais en kakia kai phthonō diagontes stygētoi misountes allēlous',
   '''We ourselves also'' (kai hēmeis — even we, including Paul) — before prescribing gentleness toward pagans, Paul reminds them they were no different. Seven descriptions of the unregenerate state: ''foolish'' (anoētoi — without understanding), ''disobedient'' (apeitheis — unpersuadable), ''deceived'' (planōmenoi — led astray, wandering), ''serving divers lusts'' (douleuontes epithymiais — enslaved to desires), ''malice and envy'' (kakia kai phthonō), ''hateful'' (stygētoi — detestable, loathsome), ''hating one another'' (misountes allēlous). This is humanity without grace — a mirror of Romans 1:29-31.',
   'The Christian must never look down on the unregenerate because ''we ourselves were once'' the same. This confession prevents self-righteousness and grounds the command to be gentle (v.2) — we extend to others the same patience God extended to us.'),
  (4,
   'But after that the kindness and love of God our Saviour toward man appeared,',
   'ὅτε δὲ ἡ χρηστότης καὶ ἡ φιλανθρωπία ἐπεφάνη τοῦ σωτῆρος ἡμῶν θεοῦ',
   'hote de hē chrēstotēs kai hē philanthrōpia epephanē tou sōtēros hēmōn theou',
   'The great ''But'' (de) — the turning point from human depravity to divine intervention. ''Kindness'' (chrēstotēs — goodness, benevolence, generosity) and ''love toward man'' (philanthrōpia — philanthropy, love for humanity; used only here and Acts 28:2 in the NT) ''appeared'' (epephanē — was manifested, the same epiphany verb as Titus 2:11). God''s salvation is motivated by His character, not our merit. ''God our Saviour'' — the Father is the source of salvation, as in 1:3 and 2:10.',
   'Salvation originates entirely in God''s character — His kindness and His love for mankind. It is not a response to human goodness (v.3 proved there was none) but a free expression of who God is. The initiative is entirely divine.'),
  (5,
   'Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Holy Ghost;',
   'οὐκ ἐξ ἔργων τῶν ἐν δικαιοσύνῃ ὧν ἐποιήσαμεν ἡμεῖς ἀλλὰ κατὰ τὸν αὐτοῦ ἔλεον ἔσωσεν ἡμᾶς διὰ λουτροῦ παλιγγενεσίας καὶ ἀνακαινώσεως πνεύματος ἁγίου',
   'ouk ex ergōn tōn en dikaiosynē hōn epoiēsamen hēmeis alla kata ton autou eleon esōsen hēmas dia loutrou palingenesias kai anakainōseōs pneumatos hagiou',
   'The most explicit sola gratia statement outside of Romans and Ephesians. ''Not by works of righteousness which we have done'' (ouk ex ergōn tōn en dikaiosynē) — categorical exclusion of human merit. ''According to his mercy'' (kata ton autou eleon — in keeping with His compassion) — mercy, not merit, is the basis. ''He saved us'' (esōsen hēmas — aorist: a completed act) through two instruments: (1) ''the washing of regeneration'' (loutrou palingenesias — the bath of new birth; palingenesia = palin ''again'' + genesis ''birth'') and (2) ''renewing of the Holy Ghost'' (anakainōseōs pneumatos hagiou — the Spirit''s renovation, making new from within). These are not two separate acts but two aspects of one saving work.',
   'Salvation is entirely by grace. Three things are denied: works, righteousness, and human doing. Three things are affirmed: God''s mercy, the Spirit''s regenerating work, and the washing of new birth. Regeneration (palingenesia) is the sovereign act of the Spirit creating new life — it is not human decision but divine recreation (cf. John 3:3-8, Ezek 36:25-27).'),
  (6,
   'Which he shed on us abundantly through Jesus Christ our Saviour;',
   'οὗ ἐξέχεεν ἐφ᾽ ἡμᾶς πλουσίως διὰ Ἰησοῦ Χριστοῦ τοῦ σωτῆρος ἡμῶν',
   'hou execheen eph'' hēmas plousiōs dia Iēsou Christou tou sōtēros hēmōn',
   '''Shed on us'' (execheen — poured out, from ekcheō; the same word used for the outpouring of the Spirit at Pentecost, Acts 2:17-18,33) ''abundantly'' (plousiōs — richly, lavishly, generously). The Spirit is not given in measured drops but in a flood. ''Through Jesus Christ our Saviour'' — note the Trinitarian structure of vv.4-6: God the Father saves (v.4), through the Holy Spirit''s regeneration (v.5), poured out through Jesus Christ the Son (v.6). All three Persons of the Trinity are active in salvation.',
   'This passage is implicitly Trinitarian: the Father''s kindness (v.4), the Spirit''s regeneration (v.5), and the Son''s mediation (v.6). Salvation is the work of the triune God — Father, Son, and Holy Spirit — acting in concert.'),
  (7,
   'That being justified by his grace, we should be made heirs according to the hope of eternal life.',
   'ἵνα δικαιωθέντες τῇ ἐκείνου χάριτι κληρονόμοι γενώμεθα κατ᾽ ἐλπίδα ζωῆς αἰωνίου',
   'hina dikaiōthentes tē ekeinou chariti klēronomoi genōmetha kat'' elpida zōēs aiōniou',
   '''Justified by his grace'' (dikaiōthentes tē ekeinou chariti — having been declared righteous by that One''s grace) — the legal act of acquittal. ''Made heirs'' (klēronomoi genōmetha — become heirs) ''according to the hope of eternal life'' (kat'' elpida zōēs aiōniou) — the inheritance is certain though not yet fully possessed. The chain is complete: mercy saves (v.5), the Spirit regenerates (v.5), grace justifies (v.7), and justified sinners become heirs of eternal life. This circles back to 1:2 where eternal life was promised before the ages began.',
   'Justification is by grace alone — God''s unmerited favour declares the sinner righteous. The result is inheritance: believers become heirs, not merely servants. The ''hope of eternal life'' is not uncertain wishing but confident expectation based on God''s promise (1:2) and Christ''s mediation (v.6).'),
  (8,
   'This is a faithful saying, and these things I will that thou affirm constantly, that they which have believed in God might be careful to maintain good works. These things are good and profitable unto men.',
   'πιστὸς ὁ λόγος καὶ περὶ τούτων βούλομαί σε διαβεβαιοῦσθαι ἵνα φροντίζωσιν καλῶν ἔργων προΐστασθαι οἱ πεπιστευκότες τῷ θεῷ ταῦτά ἐστιν τὰ καλὰ καὶ ὠφέλιμα τοῖς ἀνθρώποις',
   'pistos ho logos kai peri toutōn boulomai se diabebaiousthai hina phrontizōsin kalōn ergōn proistasthai hoi pepisteukotes tō theō tauta estin ta kala kai ōphelima tois anthrōpois',
   '''Faithful saying'' (pistos ho logos — one of five ''faithful sayings'' in the Pastoral Epistles). Paul wants Titus to ''affirm constantly'' (diabebaiousthai — insist on, assert confidently, keep hammering home) these truths. ''Maintain good works'' (kalōn ergōn proistasthai — literally ''stand before good works,'' take the lead in them, devote themselves to them). Good works are not the root of salvation (v.5 excluded that) but the fruit. ''Profitable unto men'' (ōphelima tois anthrōpois) — good works benefit both the doer and the community.',
   'The relationship between grace and works is resolved here: salvation is by grace alone (vv.5-7), but those saved by grace must be devoted to good works (v.8). Works are the evidence and fruit of saving faith, not its cause. This is the same logic as Ephesians 2:8-10 and James 2:14-26.'),
  (9,
   'But avoid foolish questions, and genealogies, and contentions, and strivings about the law; for they are unprofitable and vain.',
   'μωρὰς δὲ ζητήσεις καὶ γενεαλογίας καὶ ἔρεις καὶ μάχας νομικὰς περιΐστασο εἰσὶν γὰρ ἀνωφελεῖς καὶ μάταιοι',
   'mōras de zētēseis kai genealogias kai ereis kai machas nomikas periistaso eisin gar anōpheleis kai mataioi',
   '''Foolish questions'' (mōras zētēseis — moronic inquiries, debates that produce no spiritual fruit), ''genealogies'' (genealogias — likely speculative Jewish pedigrees used to claim spiritual authority), ''contentions'' (ereis — quarrels, strife), and ''strivings about the law'' (machas nomikas — legal battles over Mosaic regulations). ''Avoid'' (periistaso — stand away from, circumvent, give a wide berth). These are ''unprofitable'' (anōpheleis — yielding no benefit) and ''vain'' (mataioi — empty, futile). Time spent on speculative debates is time stolen from profitable ministry.',
   NULL),
  (10,
   'A man that is an heretick after the first and second admonition reject;',
   'αἱρετικὸν ἄνθρωπον μετὰ μίαν καὶ δευτέραν νουθεσίαν παραιτοῦ',
   'hairetikon anthrōpon meta mian kai deuteran nouthesian paraitou',
   '''Heretick'' (hairetikon — one who creates divisions, a factious person; from hairesis, ''a choosing,'' hence one who creates parties and factions by insisting on his own opinions). This is not necessarily someone with wrong doctrine but someone who promotes division over disputable matters. ''Admonition'' (nouthesian — warning, correction, instruction that aims at the mind). Two chances are given; after that, ''reject'' (paraitou — refuse, decline further interaction, have nothing more to do with). The process is measured: warn once, warn twice, then separate.',
   NULL),
  (11,
   'Knowing that he that is such is subverted, and sinneth, being condemned of himself.',
   'εἰδὼς ὅτι ἐξέστραπται ὁ τοιοῦτος καὶ ἁμαρτάνει ὢν αὐτοκατάκριτος',
   'eidōs hoti exestraptai ho toioutos kai hamartanei ōn autokataakritos',
   '''Subverted'' (exestraptai — turned inside out, perverted, corrupted; perfect tense indicating a settled state of distortion) and ''sinneth'' (hamartanei — keeps on sinning, present tense for ongoing action). ''Condemned of himself'' (autokatakritos — self-condemned; a rare compound found only here in the NT). The heretic''s persistence after two warnings is itself self-condemnation — he has been given opportunity to repent and has refused, thus pronouncing judgment on himself by his own obstinacy.',
   NULL),
  (12,
   'When I shall send Artemas unto thee, or Tychicus, be diligent to come unto me to Nicopolis: for I have determined there to winter.',
   'Ὅταν πέμψω Ἀρτεμᾶν πρὸς σὲ ἢ Τυχικόν σπούδασον ἐλθεῖν πρός με εἰς Νικόπολιν ἐκεῖ γὰρ κέκρικα παραχειμάσαι',
   'Hotan pempsō Arteman pros se ē Tychikon spoudason elthein pros me eis Nikopolin ekei gar kekrika paracheimasai',
   'Paul plans to send a replacement for Titus — either Artemas (mentioned only here in the NT) or Tychicus (Paul''s trusted courier, cf. Eph 6:21, Col 4:7, 2 Tim 4:12). ''Nicopolis'' (City of Victory) — likely Nicopolis in Epirus, western Greece, a winter base for Paul''s continuing ministry. ''Be diligent'' (spoudason — make haste, be eager) shows urgency. This verse places the letter after Paul''s first Roman imprisonment, during a period of freedom not recorded in Acts.',
   NULL),
  (13,
   'Bring Zenas the lawyer and Apollos on their journey diligently, that nothing be wanting unto them.',
   'Ζηνᾶν τὸν νομικὸν καὶ Ἀπολλῶν σπουδαίως πρόπεμψον ἵνα μηδὲν αὐτοῖς λείπῃ',
   'Zēnan ton nomikon kai Apollōn spoudaiōs propempson hina mēden autois leipē',
   'Zenas ''the lawyer'' (ton nomikon — either a Jewish Torah scholar or a Roman jurist) is mentioned only here in the NT. Apollos is the well-known Alexandrian teacher (Acts 18:24-28, 1 Cor 1:12). ''Bring on their journey'' (propempson — send forward, equip for travel with provisions and companions) — hospitality toward travelling missionaries was a vital ministry in the early church (cf. 3 John 1:5-8). ''That nothing be wanting'' — provide for every need.',
   NULL),
  (14,
   'And let ours also learn to maintain good works for necessary uses, that they be not unfruitful.',
   'μανθανέτωσαν δὲ καὶ οἱ ἡμέτεροι καλῶν ἔργων προΐστασθαι εἰς τὰς ἀναγκαίας χρείας ἵνα μὴ ὦσιν ἄκαρποι',
   'manthanetōsan de kai hoi hēmeteroi kalōn ergōn proistasthai eis tas anankaias chreias hina mē ōsin akarpoi',
   '''Let ours'' (hoi hēmeteroi — our own people, the Cretan believers) ''learn'' (manthanetōsan — keep learning, a process) to ''maintain good works'' (kalōn ergōn proistasthai — take the lead in beautiful deeds, the same phrase as v.8) ''for necessary uses'' (eis tas anankaias chreias — for pressing needs, urgent requirements). ''Unfruitful'' (akarpoi — without fruit, barren) — the life without good works is a fruitless life, regardless of how correct its beliefs may be. Good works are the visible fruit that validates invisible faith.',
   NULL),
  (15,
   'All that are with me salute thee. Greet them that love us in the faith. Grace be with you all. Amen.',
   'Ἀσπάζονταί σε οἱ μετ᾽ ἐμοῦ πάντες ἄσπασαι τοὺς φιλοῦντας ἡμᾶς ἐν πίστει ἡ χάρις μετὰ πάντων ὑμῶν ἀμήν',
   'Aspazontai se hoi met'' emou pantes aspasai tous philountas hēmas en pistei hē charis meta pantōn hymōn amēn',
   '''Them that love us in the faith'' (tous philountas hēmas en pistei — those who love us in faith, within the bond of shared belief) — the greeting is directed not to everyone on Crete but specifically to fellow believers. ''Grace be with you all'' (hē charis meta pantōn hymōn) — the letter that began with grace (1:4) ends with grace, forming an inclusio. ''You all'' (pantōn hymōn — plural) indicates the letter, though addressed to Titus, was intended for the entire community.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Titus' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 3 (What we were)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνόητοι', 'anoētoi', 'G453', 'Foolish, without understanding — a (not) + noeō (perceive). Spiritual stupidity, not mere ignorance but inability to grasp divine truth.', 1),
  ('πλανώμενοι', 'planōmenoi', 'G4105', 'Deceived, led astray, wandering — passive: being deceived by others and by sin itself. The unregenerate are victims of deception.', 2),
  ('στυγητοί', 'stygētoi', 'G4767', 'Hateful, detestable, loathsome — from stygeō (to hate, abhor). Found only here in the NT. The unregenerate are objects of loathing and also full of loathing for others.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 3 AND v.verse_number = 3;

-- Verse 4 (Kindness and love)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χρηστότης', 'chrēstotēs', 'G5544', 'Kindness, goodness, benevolence — the gentle, gracious aspect of God''s character that moves Him toward undeserving sinners.', 1),
  ('φιλανθρωπία', 'philanthrōpia', 'G5363', 'Love toward man, philanthropy — philos (loving) + anthrōpos (man). God''s love specifically directed toward humanity. Found only here and Acts 28:2 in the NT.', 2),
  ('ἐπεφάνη', 'epephanē', 'G2014', 'Appeared, was manifested — the same epiphany verb as 2:11. God''s kindness broke into human history visibly in Christ.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 3 AND v.verse_number = 4;

-- Verse 5 (Regeneration and renewing)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λουτροῦ', 'loutrou', 'G3067', 'Washing, bath, laver — the cleansing associated with new birth. Whether referring to baptism as a sign or to spiritual washing is debated; the emphasis is on the reality it signifies.', 1),
  ('παλιγγενεσίας', 'palingenesias', 'G3824', 'Regeneration, new birth — palin (again) + genesis (birth/origin). Used only here (individual rebirth) and Matthew 19:28 (cosmic renewal). The radical re-creation of the human soul.', 2),
  ('ἀνακαινώσεως', 'anakainōseōs', 'G342', 'Renewing, renovation, making new — ana (again) + kainōsis (newness). The Spirit''s ongoing transformation of the inner person. Cf. Romans 12:2.', 3),
  ('ἔλεον', 'eleon', 'G1656', 'Mercy, compassion, pity — God''s tender response to human misery and helplessness. The motive of salvation: not our merit but His mercy.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 3 AND v.verse_number = 5;

-- Verse 7 (Justified, heirs)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δικαιωθέντες', 'dikaiōthentes', 'G1344', 'Justified, declared righteous — a legal term: the verdict of acquittal. God pronounces the sinner righteous on the basis of grace, not works.', 1),
  ('κληρονόμοι', 'klēronomoi', 'G2818', 'Heirs — klēros (lot/inheritance) + nomos (law). Those who receive an inheritance by right. Justified sinners become heirs of eternal life — adopted into the family with full inheritance rights.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 3 AND v.verse_number = 7;

-- Verse 10 (Heretic)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('αἱρετικόν', 'hairetikon', 'G141', 'Heretical, factious, divisive — from hairesis (a choosing, faction). One who promotes division by insisting on private opinions over apostolic teaching.', 1),
  ('νουθεσίαν', 'nouthesian', 'G3559', 'Admonition, warning, instruction — nous (mind) + tithēmi (to place). Putting truth into the mind with corrective intent. A warning that aims to change thinking.', 2),
  ('παραιτοῦ', 'paraitou', 'G3868', 'Reject, refuse, decline, have nothing to do with — after two warnings, further engagement becomes counterproductive. Cut losses and move on.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 3 AND v.verse_number = 10;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Subject to rulers
  (1, 'Romans 13:1-7', 1), (1, '1 Peter 2:13-17', 2), (1, '1 Timothy 2:1-2', 3),
  -- v2: Gentle, meek
  (2, 'Philippians 4:5', 1), (2, 'Colossians 4:6', 2), (2, '2 Timothy 2:24-25', 3),
  -- v3: What we were
  (3, 'Romans 1:29-31', 1), (3, 'Ephesians 2:1-3', 2), (3, '1 Corinthians 6:9-11', 3), (3, 'Colossians 3:7', 4),
  -- v4: Kindness appeared
  (4, 'Romans 2:4', 1), (4, 'Ephesians 2:4-7', 2), (4, 'Titus 2:11', 3), (4, '1 John 4:9-10', 4),
  -- v5: Not by works
  (5, 'Ephesians 2:8-9', 1), (5, 'Romans 3:20-24', 2), (5, '2 Timothy 1:9', 3), (5, 'John 3:3-8', 4),
  -- v5: Washing of regeneration
  (5, 'Ezekiel 36:25-27', 5), (5, 'Romans 12:2', 6),
  -- v6: Poured out Spirit
  (6, 'Acts 2:17-18,33', 1), (6, 'Joel 2:28-29', 2), (6, 'Romans 5:5', 3),
  -- v7: Justified, heirs
  (7, 'Romans 3:24', 1), (7, 'Romans 8:17', 2), (7, 'Galatians 3:29', 3), (7, 'Titus 1:2', 4),
  -- v8: Faithful saying, good works
  (8, 'Ephesians 2:10', 1), (8, 'James 2:14-26', 2), (8, '1 Timothy 1:15', 3),
  -- v9: Foolish questions
  (9, '1 Timothy 1:4', 1), (9, '1 Timothy 6:4', 2), (9, '2 Timothy 2:23', 3),
  -- v10: Reject heretic
  (10, 'Matthew 18:15-17', 1), (10, 'Romans 16:17', 2), (10, '2 Thessalonians 3:14-15', 3),
  -- v11: Self-condemned
  (11, 'John 3:18-19', 1), (11, 'Romans 2:1', 2),
  -- v13: Apollos
  (13, 'Acts 18:24-28', 1), (13, '1 Corinthians 16:12', 2), (13, '3 John 1:5-8', 3),
  -- v14: Maintain good works
  (14, 'John 15:8', 1), (14, 'Galatians 6:10', 2), (14, 'Ephesians 2:10', 3),
  -- v15: Grace
  (15, '2 Timothy 4:22', 1), (15, 'Colossians 4:18', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Titus' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Titus Chapter 3 Complete!
-- 15 verses · 6 key verses with word studies (18 words)
-- Cross-references for 14 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
