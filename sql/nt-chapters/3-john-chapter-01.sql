-- ═══════════════════════════════════════════════════
-- 3 JOHN CHAPTER 1 — Hospitality, Truth & Leadership
-- 14 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'The most personal of John''s three letters, 3 John is addressed to Gaius, a beloved believer commended for his hospitality toward travelling missionaries. The letter contrasts three men who represent three postures toward gospel workers: Gaius (faithful and generous), Diotrephes (proud and controlling), and Demetrius (well-spoken of by all). Through this snapshot of early church life, John reveals the vital importance of supporting itinerant preachers, the danger of selfish ambition in leadership, and the power of a good testimony. Truth (alētheia) appears 6 times, connecting this letter''s themes to 1 and 2 John.',
  'Hospitality, Truth & Faithful Leadership',
  'φιλοπρωτεύων (philoprōteuōn)',
  'Loving to be first — from philos (loving) + prōteuō (to be first). Describes Diotrephes'' selfish ambition, the opposite of Christ-like servant leadership.',
  '["Greeting (v.1): The elder to beloved Gaius","Prayer for Gaius (vv.2-4): Prosperity of soul, walking in truth","Commendation of Gaius (vv.5-8): Hospitality toward travelling missionaries","Rebuke of Diotrephes (vv.9-10): Pride, rejection of authority, excommunicating faithful members","Commendation of Demetrius (vv.11-12): Good testimony from all and from the truth itself","Closing (vv.13-14): Hope to visit; greetings; peace"]'
FROM books b WHERE b.name = '3 John';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'The elder unto the wellbeloved Gaius, whom I love in the truth.',
   'Ὁ πρεσβύτερος Γαΐῳ τῷ ἀγαπητῷ ὃν ἐγὼ ἀγαπῶ ἐν ἀληθείᾳ',
   'Ho presbyteros Gaiō tō agapētō hon egō agapō en alētheia',
   'John again identifies himself as ''the elder'' (presbyteros), consistent with 2 John. Gaius is called ''wellbeloved'' (agapētos — beloved) and appears 4 times in the NT with this name (Rom 16:23, 1 Cor 1:14, Acts 19:29, 3 John). Whether these are the same person is uncertain. ''In the truth'' (en alētheia) — genuine love grounded in divine reality, not mere sentiment.',
   NULL),
  (2,
   'Beloved, I wish above all things that thou mayest prosper and be in health, even as thy soul prospereth.',
   'ἀγαπητέ περὶ πάντων εὔχομαί σε εὐοδοῦσθαι καὶ ὑγιαίνειν καθὼς εὐοδοῦταί σου ἡ ψυχή',
   'agapēte peri pantōn euchomai se euodousthai kai hygiainein kathōs euodoutai sou hē psychē',
   'A standard Greek letter-greeting adapted with spiritual depth. ''Prosper'' (euodousthai — to have a good journey, to succeed) and ''be in health'' (hygiainein — to be healthy, sound). The remarkable phrase ''even as thy soul prospereth'' implies Gaius''s spiritual life was exemplary — John wishes his physical condition would match his spiritual vitality. This is not a blanket promise of health and wealth but a pastoral prayer.',
   'This verse is sometimes misused to teach that God guarantees material prosperity. In context, it is a personal prayer for one man whose soul was already thriving. The priority is clear: spiritual prosperity is the standard by which everything else is measured.'),
  (3,
   'For I rejoiced greatly, when the brethren came and testified of the truth that is in thee, even as thou walkest in the truth.',
   'ἐχάρην γὰρ λίαν ἐρχομένων ἀδελφῶν καὶ μαρτυρούντων σου τῇ ἀληθείᾳ καθὼς σὺ ἐν ἀληθείᾳ περιπατεῖς',
   'echarēn gar lian erchomenōn adelphōn kai martyrountōn sou tē alētheia kathōs sy en alētheia peripateis',
   'Travelling missionaries (''the brethren'') brought reports back to John about Gaius''s faithfulness. ''Testified of the truth that is in thee'' — Gaius did not merely know truth intellectually but embodied it. ''Walkest in the truth'' (en alētheia peripateis) — the same phrase used in 2 John 4. Walking and truth are inseparable in John''s vocabulary.',
   NULL),
  (4,
   'I have no greater joy than to hear that my children walk in truth.',
   'μειζοτέραν τούτων οὐκ ἔχω χαράν ἵνα ἀκούω τὰ ἐμὰ τέκνα ἐν ἀληθείᾳ περιπατοῦντα',
   'meizoteran toutōn ouk echō charan hina akouō ta ema tekna en alētheia peripatounta',
   '''My children'' (ta ema tekna) — John views Gaius and others as his spiritual children, just as Paul did (1 Cor 4:15, Philem 10). For a spiritual father, no report brings greater joy than hearing that those he has discipled continue to live faithfully. This is the pastoral heart — a leader''s deepest satisfaction is not his own achievements but the faithfulness of those he has nurtured.',
   NULL),
  (5,
   'Beloved, thou doest faithfully whatsoever thou doest to the brethren, and to strangers;',
   'ἀγαπητέ πιστὸν ποιεῖς ὃ ἐὰν ἐργάσῃ εἰς τοὺς ἀδελφοὺς καὶ εἰς τοὺς ξένους',
   'agapēte piston poieis ho ean ergasē eis tous adelphous kai eis tous xenous',
   '''Thou doest faithfully'' (piston poieis — you do a faithful thing, you act with fidelity). Gaius extends hospitality not only to believers he knows (''the brethren'') but also to ''strangers'' (xenous — foreigners, unknown travellers). In the ancient world without hotels, travelling missionaries depended entirely on the hospitality of local believers. Gaius opened his home to those he had never met.',
   NULL),
  (6,
   'Which have borne witness of thy charity before the church: whom if thou bring forward on their journey after a godly sort, thou shalt do well:',
   'οἳ ἐμαρτύρησάν σου τῇ ἀγάπῃ ἐνώπιον ἐκκλησίας οὓς καλῶς ποιήσεις προπέμψας ἀξίως τοῦ θεοῦ',
   'hoi emartyrēsan sou tē agapē enōpion ekklēsias hous kalōs poiēseis propempsas axiōs tou theou',
   'The missionaries testified about Gaius''s love publicly ''before the church'' (enōpion ekklēsias) — likely John''s congregation. ''Bring forward on their journey'' (propempsas — send on, equip for travel) means providing supplies, money, and companionship for the next leg of their journey. ''After a godly sort'' (axiōs tou theou — in a manner worthy of God) sets the standard: hospitality that reflects God''s own generosity.',
   NULL),
  (7,
   'Because that for his name''s sake they went forth, taking nothing of the Gentiles.',
   'ὑπὲρ γὰρ τοῦ ὀνόματος ἐξῆλθον μηδὲν λαμβάνοντες ἀπὸ τῶν ἐθνικῶν',
   'hyper gar tou onomatos exēlthon mēden lambanontes apo tōn ethnikōn',
   '''For his name''s sake'' (hyper tou onomatos — for THE Name) — ''the Name'' refers to Jesus Christ, so sacred that John simply says ''the Name.'' These missionaries deliberately refused support from unbelievers (ethnikōn — Gentiles/pagans), avoiding any compromise or appearance that the Gospel was for sale. This made the hospitality of believers like Gaius absolutely essential.',
   'Missionaries who serve ''for the Name'' and refuse worldly patronage depend on the generosity of the church. Supporting them is not optional charity but participation in the mission itself (v.8).'),
  (8,
   'We therefore ought to receive such, that we might be fellowhelpers to the truth.',
   'ἡμεῖς οὖν ὀφείλομεν ὑπολαμβάνειν τοὺς τοιούτους ἵνα συνεργοὶ γινώμεθα τῇ ἀληθείᾳ',
   'hēmeis oun opheilomen hypolambanein tous toioutous hina synergoi ginōmetha tē alētheia',
   '''We ought'' (opheilomen — we are obligated, we owe it as a debt) — supporting missionaries is not optional generosity but moral obligation. ''Fellowhelpers to the truth'' (synergoi tē alētheia — co-workers with the truth) — by supporting gospel workers, ordinary believers become partners in the mission. You do not have to travel to be a missionary; you can send, supply, and support.',
   'The doctrine of Gospel partnership: those who give and those who go share equally in the work and its reward (cf. Phil 4:17, 1 Sam 30:24).'),
  (9,
   'I wrote unto the church: but Diotrephes, who loveth to have the preeminence among them, receiveth us not.',
   'ἔγραψά τι τῇ ἐκκλησίᾳ ἀλλ᾽ ὁ φιλοπρωτεύων αὐτῶν Διοτρεφής οὐκ ἐπιδέχεται ἡμᾶς',
   'egrapsa ti tē ekklēsia all'' ho philoprōteuōn autōn Diotrephēs ouk epidechetai hēmas',
   'Diotrephes — a church leader whose name ironically means ''nourished by Zeus.'' ''Loveth to have the preeminence'' (philoprōteuōn — loves being first) is a rare Greek word appearing only here in the NT. His problem is not doctrinal heresy but personal ambition: he rejected John''s authority, refused to welcome missionaries, and expelled those who did. He is the anti-Gaius — selfishness where there should be service.',
   NULL),
  (10,
   'Wherefore, if I come, I will remember his deeds which he doeth, prating against us with malicious words: and not content therewith, neither doth he himself receive the brethren, and forbiddeth them that would, and casteth them out of the church.',
   'διὰ τοῦτο ἐὰν ἔλθω ὑπομνήσω αὐτοῦ τὰ ἔργα ἃ ποιεῖ λόγοις πονηροῖς φλυαρῶν ἡμᾶς καὶ μὴ ἀρκούμενος ἐπὶ τούτοις οὔτε αὐτὸς ἐπιδέχεται τοὺς ἀδελφοὺς καὶ τοὺς βουλομένους κωλύει καὶ ἐκ τῆς ἐκκλησίας ἐκβάλλει',
   'dia touto ean elthō hypomnēsō autou ta erga ha poiei logois ponērois phlyarōn hēmas kai mē arkoumenos epi toutois oute autos epidechetai tous adelphous kai tous boulomenous kōlyei kai ek tēs ekklēsias ekballei',
   'Five sins of Diotrephes catalogued: (1) ''prating'' (phlyarōn — talking nonsense, bringing baseless accusations) against the apostles, (2) refusing to receive the missionaries himself, (3) preventing others from receiving them, (4) excommunicating those who show hospitality (ekballei — casting out of the church). ''Not content therewith'' (mē arkoumenos) — his sin escalates. This is a portrait of authoritarian church leadership: using power to serve self rather than the flock.',
   'Diotrephes exemplifies the danger of unchecked authority in the church. Leaders who love preeminence will silence opponents, reject accountability, and control through fear. Christ''s model is the opposite: ''He that is greatest among you shall be your servant'' (Matt 23:11).'),
  (11,
   'Beloved, follow not that which is evil, but that which is good. He that doeth good is of God: but he that doeth evil hath not seen God.',
   'ἀγαπητέ μὴ μιμοῦ τὸ κακὸν ἀλλὰ τὸ ἀγαθόν ὁ ἀγαθοποιῶν ἐκ τοῦ θεοῦ ἐστιν ὁ κακοποιῶν οὐχ ἑώρακεν τὸν θεόν',
   'agapēte mē mimou to kakon alla to agathon ho agathopoiōn ek tou theou estin ho kakopoiōn ouch heōraken ton theon',
   '''Follow'' (mimou — imitate, mimic) — choose your models carefully. Gaius should imitate goodness (Demetrius), not evil (Diotrephes). ''He that doeth evil hath not seen God'' echoes 1 John''s tests of genuine faith: those who persist in evil demonstrate they have no true knowledge of God, regardless of their position or claims.',
   NULL),
  (12,
   'Demetrius hath good report of all men, and of the truth itself: yea, and we also bear record; and ye know that our record is true.',
   'Δημητρίῳ μεμαρτύρηται ὑπὸ πάντων καὶ ὑπὸ αὐτῆς τῆς ἀληθείας καὶ ἡμεῖς δὲ μαρτυροῦμεν καὶ οἶδας ὅτι ἡ μαρτυρία ἡμῶν ἀληθής ἐστιν',
   'Dēmētriō memartyrētai hypo pantōn kai hypo autēs tēs alētheias kai hēmeis de martyroumen kai oidas hoti hē martyria hēmōn alēthēs estin',
   'Three witnesses for Demetrius — a triple attestation recalling Deuteronomy 19:15: (1) ''all men'' — universal human testimony, (2) ''the truth itself'' — his life is consistent with divine truth (his character vindicates itself), (3) ''we also'' — John''s personal apostolic endorsement. ''Ye know that our record is true'' echoes John 21:24. Demetrius may be the letter-bearer — John recommends him as a trustworthy replacement for Diotrephes.',
   NULL),
  (13,
   'I had many things to write, but I will not with ink and pen write unto thee:',
   'πολλὰ εἶχον γράφειν ἀλλ᾽ οὐ θέλω διὰ μέλανος καὶ καλάμου σοι γράφειν',
   'polla eichon graphein all'' ou thelō dia melanos kai kalamou soi graphein',
   'Almost identical to 2 John 12, confirming common authorship. ''Pen'' (kalamou — a reed pen, made from a sharpened reed stalk) — where 2 John mentioned ''paper and ink,'' 3 John mentions ''ink and pen.'' John prefers personal presence to written communication — the relational priority of the apostolic church.',
   NULL),
  (14,
   'But I trust I shall shortly see thee, and we shall speak face to face. Peace be to thee. Our friends salute thee. Greet the friends by name.',
   'ἐλπίζω δὲ εὐθέως σε ἰδεῖν καὶ στόμα πρὸς στόμα λαλήσομεν εἰρήνη σοι ἀσπάζονταί σε οἱ φίλοι ἀσπάζου τοὺς φίλους κατ᾽ ὄνομα',
   'elpizō de eutheōs se idein kai stoma pros stoma lalēsomen eirēnē soi aspazontai se hoi philoi aspazou tous philous kat'' onoma',
   '''Face to face'' (stoma pros stoma — mouth to mouth), as in 2 John 12. ''Peace be to thee'' (eirēnē soi) — the Hebrew shalom greeting. ''Greet the friends by name'' (kat'' onoma — individually, personally) — every believer matters. John does not deal in anonymous masses but knows and loves individuals. This personal touch reflects the Good Shepherd who ''calleth his own sheep by name'' (John 10:3).',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '3 John' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 2 (Prosper and health)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εὐοδοῦσθαι', 'euodousthai', 'G2137', 'To prosper, to have a good journey, to succeed — from eu (well) + hodos (road). General wellbeing.', 1),
  ('ὑγιαίνειν', 'hygiainein', 'G5198', 'To be healthy, to be sound — root of English ''hygiene.'' Physical health, but also used for sound doctrine (1 Tim 1:10).', 2),
  ('ψυχή', 'psychē', 'G5590', 'Soul — the inner person, the seat of life, emotions, and spiritual reality. Gaius''s soul was thriving.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '3 John' AND c.chapter_number = 1 AND v.verse_number = 2;

-- Verse 7 (For the Name)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τοῦ ὀνόματος', 'tou onomatos', 'G3686', 'The Name — referring to Jesus Christ. So revered that John simply says ''the Name'' without specifying, echoing the OT reverence for God''s name.', 1),
  ('ἐθνικῶν', 'ethnikōn', 'G1482', 'Gentiles, pagans, heathens — non-believers. The missionaries refused support from unbelievers to maintain integrity.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '3 John' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 8 (Fellowhelpers)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὀφείλομεν', 'opheilomen', 'G3784', 'We ought, we are obligated, we owe — a moral debt, not optional generosity.', 1),
  ('συνεργοί', 'synergoi', 'G4904', 'Fellowhelpers, co-workers — same word Paul uses (Rom 16:3, Phil 4:3). Supporters become partners in the mission.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '3 John' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 9 (Loves preeminence)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φιλοπρωτεύων', 'philoprōteuōn', 'G5383', 'Loving to be first — a NT hapax legomenon (appears only here). Combines philos (loving) + prōteuō (to be first). Selfish ambition in leadership.', 1),
  ('ἐπιδέχεται', 'epidechetai', 'G1926', 'Receives, welcomes, accepts — Diotrephes refuses to receive (accept the authority of) John or the missionaries.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '3 John' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 11 (Follow good)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μιμοῦ', 'mimou', 'G3401', 'Imitate, follow as a pattern — from which we get ''mimic.'' Choose godly role models, not worldly ones.', 1),
  ('ἑώρακεν', 'heōraken', 'G3708', 'Has seen — perfect tense: has perceived and continues to see. True knowledge of God transforms behaviour.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '3 John' AND c.chapter_number = 1 AND v.verse_number = 11;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: The elder
  (1, '2 John 1:1', 1), (1, '1 Peter 5:1', 2), (1, 'Romans 16:23', 3),
  -- v2: Prosper as your soul
  (2, 'Psalm 1:3', 1), (2, 'Jeremiah 17:7-8', 2), (2, '1 Timothy 4:8', 3),
  -- v3: Walking in truth
  (3, '2 John 1:4', 1), (3, 'Psalm 86:11', 2),
  -- v4: No greater joy
  (4, '1 Corinthians 4:15', 1), (4, '1 Thessalonians 2:19-20', 2), (4, 'Philippians 2:16', 3),
  -- v5: Hospitality to strangers
  (5, 'Hebrews 13:2', 1), (5, 'Romans 12:13', 2), (5, '1 Timothy 3:2', 3),
  -- v6: Sending on their journey
  (6, 'Titus 3:13', 1), (6, 'Acts 15:3', 2), (6, '1 Corinthians 16:6', 3),
  -- v7: For the Name
  (7, 'Acts 5:41', 1), (7, 'Acts 9:16', 2), (7, '1 Corinthians 9:18', 3),
  -- v8: Fellowhelpers
  (8, 'Philippians 4:14-17', 1), (8, '1 Samuel 30:24', 2), (8, '2 Corinthians 8:4', 3),
  -- v9: Loves preeminence
  (9, 'Matthew 23:6-11', 1), (9, 'Mark 10:42-45', 2), (9, 'Luke 22:24-27', 3),
  -- v10: Casting out
  (10, 'Matthew 18:15-17', 1), (10, '3 John 1:9', 2), (10, 'Proverbs 6:16-19', 3),
  -- v11: Imitate good
  (11, '1 John 3:6', 1), (11, 'Hebrews 13:7', 2), (11, '1 Corinthians 11:1', 3), (11, '1 Peter 3:11', 4),
  -- v12: Demetrius' testimony
  (12, '1 Timothy 3:7', 1), (12, 'John 21:24', 2), (12, 'Deuteronomy 19:15', 3),
  -- v14: Peace and friends
  (14, 'John 10:3', 1), (14, 'John 15:15', 2), (14, 'John 20:19', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '3 John' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ 3 John Chapter 1 Complete!
-- 14 verses · 5 key verses with word studies (12 words)
-- Cross-references for 13 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════