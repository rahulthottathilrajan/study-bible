-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 5 — Christ's High Priesthood and the Rebuke for Immaturity
-- 14 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'Hebrews 5 develops the high priest theme introduced in 2:17 and 4:14-16 by establishing Christ''s qualifications for the office. Every high priest must meet two requirements: (1) he must be ''taken from among men'' and thus able to ''have compassion on the ignorant, and on them that are out of the way; for that he himself also is compassed with infirmity'' (vv.1-2); and (2) he must be divinely called — ''no man taketh this honour unto himself, but he that is called of God, as was Aaron'' (v.4). Christ meets both criteria: He was divinely appointed (''Thou art my Son'' Ps 2:7; ''Thou art a priest for ever after the order of Melchisedec'' Ps 110:4, vv.5-6); and He fully shared human experience — ''Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared; though he were a Son, yet learned he obedience by the things which he suffered; and being made perfect, he became the author of eternal salvation unto all them that obey him'' (vv.7-9). The chapter then pivots sharply to rebuke: the author has much to say about Melchizedek, but they are ''dull of hearing'' (v.11). By now they should be teachers, but they need someone to ''teach you again which be the first principles'' (v.12). They are still on milk, not solid food — ''every one that useth milk is unskilful in the word of righteousness: for he is a babe'' (v.13). ''But strong meat belongeth to them that are of full age, even those who by reason of use have their senses exercised to discern both good and evil'' (v.14).',
  'Christ''s High Priestly Qualifications and the Rebuke for Spiritual Immaturity',
  'τελειόω (teleioō)',
  'To make perfect, to bring to completion, to fully qualify — from teleios (complete, having reached its purpose). In v.9 Christ was ''made perfect'' (teleiōtheis) through obedient suffering, and having been perfected, He ''became the author of eternal salvation.'' This does not mean He was morally imperfect; it means His suffering completed His qualification for the high priestly role. He was perfected vocationally, not morally — His obedient suffering fully equipped Him to be the source of eternal salvation.',
  '["The Qualifications of a High Priest (vv.1-4): For every high priest taken from among men is ordained for men in things pertaining to God that he may offer both gifts and sacrifices for sins who can have compassion on the ignorant and on them that are out of the way for that he himself also is compassed with infirmity and by reason hereof he ought as for the people so also for himself to offer for sins and no man taketh this honour unto himself but he that is called of God as was Aaron","Christ''s Divine Appointment and Obedient Suffering (vv.5-10): So also Christ glorified not himself to be made an high priest but he that said unto him Thou art my Son to day have I begotten thee; as he saith also in another place Thou art a priest for ever after the order of Melchisedec; who in the days of his flesh when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death and was heard in that he feared; though he were a Son yet learned he obedience by the things which he suffered; and being made perfect he became the author of eternal salvation unto all them that obey him; called of God an high priest after the order of Melchisedec","Rebuke for Spiritual Immaturity (vv.11-14): Of whom we have many things to say and hard to be uttered seeing ye are dull of hearing; for when for the time ye ought to be teachers ye have need that one teach you again which be the first principles of the oracles of God and are become such as have need of milk and not of strong meat; for every one that useth milk is unskilful in the word of righteousness for he is a babe; but strong meat belongeth to them that are of full age even those who by reason of use have their senses exercised to discern both good and evil"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'For every high priest taken from among men is ordained for men in things pertaining to God, that he may offer both gifts and sacrifices for sins:',
   'πᾶς γὰρ ἀρχιερεὺς ἐξ ἀνθρώπων λαμβανόμενος ὑπὲρ ἀνθρώπων καθίσταται τὰ πρὸς τὸν θεόν ἵνα προσφέρῃ δῶρά τε καὶ θυσίας ὑπὲρ ἁμαρτιῶν',
   'pas gar archiereus ex anthrōpōn lambanomenos hyper anthrōpōn kathistatai ta pros ton theon hina prospherē dōra te kai thysias hyper hamartiōn',
   '''Taken from among men'' (ex anthrōpōn lambanomenos — selected from humanity). The first qualification: a high priest must be human — he must share the nature of those he represents. ''Ordained for men'' (hyper anthrōpōn kathistatai — appointed on behalf of humans). ''In things pertaining to God'' (ta pros ton theon — in matters facing toward God; the priest''s direction is Godward, representing humanity before the divine presence). ''Gifts and sacrifices for sins'' (dōra te kai thysias hyper hamartiōn) — ''gifts'' (dōra) are voluntary offerings; ''sacrifices'' (thysias) specifically involve blood. The high priest''s central function is to deal with sin through offering.',
   NULL),
  (2, 'Who can have compassion on the ignorant, and on them that are out of the way; for that he himself also is compassed with infirmity.',
   'μετριοπαθεῖν δυνάμενος τοῖς ἀγνοοῦσιν καὶ πλανωμένοις ἐπεὶ καὶ αὐτὸς περίκειται ἀσθένειαν',
   'metriopathein dynamenos tois agnoousin kai planōmenois epei kai autos perikeitai astheneian',
   '''Have compassion'' (metriopathein — to deal gently, to moderate one''s feelings, to bear patiently; literally ''to feel in measure,'' a mean between harsh indifference and excessive emotionalism). The high priest neither ignores sin nor rages at sinners — he deals with measured compassion. ''The ignorant'' (tois agnoousin — those who sin through ignorance, not deliberate defiance; cf. the distinction in Num 15:27-31). ''Out of the way'' (planōmenois — those who are wandering, straying, being led astray). ''Compassed with infirmity'' (perikeitai astheneian — clothed in weakness, surrounded by weakness). The Levitical high priest could sympathize because he shared human weakness — but this also meant he had to offer sacrifice for his own sins (v.3). Christ, by contrast, sympathizes without sharing sinfulness.',
   NULL),
  (3, 'And by reason hereof he ought, as for the people, so also for himself, to offer for sins.',
   'καὶ δι᾽ αὐτὴν ὀφείλει καθὼς περὶ τοῦ λαοῦ οὕτως καὶ περὶ ἑαυτοῦ προσφέρειν ὑπὲρ ἁμαρτιῶν',
   'kai di autēn opheilei kathōs peri tou laou houtōs kai peri heautou prospherein hyper hamartiōn',
   '''He ought'' (opheilei — he is obligated, he must). The Levitical high priest was a sinner himself and therefore had to offer sacrifice for his own sins before he could represent the people (Lev 16:6). This was both his qualification (shared humanity/weakness) and his limitation (personal sinfulness). Christ transcends this limitation: He shares our humanity (2:14-17) but not our sinfulness (4:15). He never needed to offer for Himself — His sacrifice was entirely and exclusively for others.',
   'The Levitical system''s built-in limitation — the high priest''s own sinfulness — points forward to the need for a better priest. A priest who must first deal with his own sin before helping others is inherently inadequate. Christ''s sinlessness makes Him the priest the Levitical system always needed but could never produce.'),
  (4, 'And no man taketh this honour unto himself, but he that is called of God, as was Aaron.',
   'καὶ οὐχ ἑαυτῷ τις λαμβάνει τὴν τιμὴν ἀλλὰ καλούμενος ὑπὸ τοῦ θεοῦ καθάπερ καὶ ὁ Ἀαρών',
   'kai ouch heautō tis lambanei tēn timēn alla kaloumenos hypo tou theou kathaper kai ho Aarōn',
   '''No man taketh this honour unto himself'' — the second qualification: divine calling. The high priesthood is not self-appointed but divinely bestowed. Aaron did not volunteer; God chose him (Exod 28:1). The OT records severe judgments on those who presumed priestly authority without divine calling: Korah''s rebellion (Num 16), King Uzziah''s leprosy (2 Chr 26:16-21). ''Called of God'' (kaloumenos hypo tou theou — being called by God). This sets up the argument in vv.5-6: Christ did not appoint Himself but was called by the Father.',
   NULL),
  (5, 'So also Christ glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee.',
   'οὕτως καὶ ὁ Χριστὸς οὐχ ἑαυτὸν ἐδόξασεν γενηθῆναι ἀρχιερέα ἀλλ᾽ ὁ λαλήσας πρὸς αὐτόν υἱός μου εἶ σύ ἐγὼ σήμερον γεγέννηκά σε',
   'houtōs kai ho Christos ouch heauton edoxasen genēthēnai archierea all ho lalēsas pros auton hyios mou ei sy egō sēmeron gegennēka se',
   '''Christ glorified not himself'' (ouch heauton edoxasen — He did not exalt Himself). Just as Aaron did not appoint himself, Christ did not seize the high priestly office. The Father who said ''Thou art my Son'' (Ps 2:7, already cited in 1:5) is the one who appointed Him. The Psalm 2 quotation establishes Christ''s unique relationship with the Father — He is the eternal Son, and the Father''s decree in time (''today have I begotten thee'') confirms His priestly appointment.',
   NULL),
  (6, 'As he saith also in another place, Thou art a priest for ever after the order of Melchisedec.',
   'καθὼς καὶ ἐν ἑτέρῳ λέγει σὺ ἱερεὺς εἰς τὸν αἰῶνα κατὰ τὴν τάξιν Μελχισεδέκ',
   'kathōs kai en heterō legei sy hiereus eis ton aiōna kata tēn taxin Melchisedek',
   'Quoting Psalm 110:4 — the crucial OT text for Hebrews'' argument. ''A priest for ever'' (hiereus eis ton aiōna — a priest unto the age, an eternal priest). Unlike Levitical priests who died and were replaced, this priest''s ministry is permanent. ''After the order of Melchisedec'' (kata tēn taxin Melchisedek — according to the order, rank, or succession of Melchizedek). ''Order'' (taxin) means pattern, type, or class — not a succession of priests but a category of priesthood. Melchizedek represents a different kind of priesthood than Aaron''s: non-hereditary, eternal, and combining kingship with priesthood. This quotation is the thesis statement for chapters 7-10.',
   'Psalm 110:4 is the linchpin of Hebrews'' Christological argument. It proves that God Himself ordained a priesthood different from and superior to the Levitical order. If the Levitical priesthood were sufficient, there would be no need for ''another priest'' after Melchizedek''s order. The very existence of this psalm proves the Levitical system was always intended to be temporary and anticipatory.'),
  (7, 'Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared;',
   'ὃς ἐν ταῖς ἡμέραις τῆς σαρκὸς αὐτοῦ δεήσεις τε καὶ ἱκετηρίας πρὸς τὸν δυνάμενον σώζειν αὐτὸν ἐκ θανάτου μετὰ κραυγῆς ἰσχυρᾶς καὶ δακρύων προσενέγκας καὶ εἰσακουσθεὶς ἀπὸ τῆς εὐλαβείας',
   'hos en tais hēmerais tēs sarkos autou deēseis te kai hikētērias pros ton dynamenon sōzein auton ek thanatou meta kraugēs ischyras kai dakryōn prosenenkas kai eisakoustheis apo tēs eulabeias',
   '''In the days of his flesh'' (en tais hēmerais tēs sarkos — during His earthly life; the phrase emphasizes the genuine humanity of Christ''s experience). ''Prayers and supplications'' (deēseis te kai hikētērias — petitions and earnest entreaties; hikētēria originally meant an olive branch held by a supplicant — it conveys desperate, humble pleading). ''Strong crying and tears'' (meta kraugēs ischyras kai dakryōn) — an unmistakable reference to Gethsemane (Matt 26:36-46; Luke 22:44). The Son of God wept, cried out, and pleaded with the Father. ''Was heard in that he feared'' (eisakoustheis apo tēs eulabeias — heard because of His reverent submission). He was not saved from dying but from death — through resurrection. His prayer was answered not by removing the cup but by bringing Him through it victoriously.',
   'This verse is one of the most powerful descriptions of Christ''s genuine humanity in the NT. His prayers were not theatrical but agonizingly real — with ''strong crying and tears.'' Yet He was ''heard'' because of His eulabeia (reverent submission). The answer came not by avoiding the cross but by resurrection through it — the pattern of all Christian suffering.'),
  (8, 'Though he were a Son, yet learned he obedience by the things which he suffered;',
   'καίπερ ὢν υἱός ἔμαθεν ἀφ᾽ ὧν ἔπαθεν τὴν ὑπακοήν',
   'kaiper ōn hyios emathen aph hōn epathen tēn hypakoēn',
   '''Though he were a Son'' (kaiper ōn hyios — although being a Son; concessive participle: despite being the eternal Son of God). ''Learned obedience'' (emathen tēn hypakoēn — He learned the obedience; emathen and epathen create a wordplay: ''He learned [emathen] from what He suffered [epathen]''). This does not mean He was previously disobedient. As the eternal Son, He always willed to obey; through the incarnation, He experienced obedience under the conditions of human suffering — poverty, rejection, physical pain, and ultimately the cross. He ''learned'' obedience experientially, not as a correction of prior disobedience but as a new mode of experiencing what He always willed.',
   'Christ''s ''learning obedience'' through suffering is a profound christological statement. The eternal Son, who always obeyed the Father in His divine nature, experienced obedience as a human being under conditions of extreme suffering. This experiential learning is what qualifies Him as the sympathetic High Priest (4:15) — He knows what obedience costs because He paid the price in His own flesh.'),
  (9, 'And being made perfect, he became the author of eternal salvation unto all them that obey him;',
   'καὶ τελειωθεὶς ἐγένετο τοῖς ὑπακούουσιν αὐτῷ πᾶσιν αἴτιος σωτηρίας αἰωνίου',
   'kai teleiōtheis egeneto tois hypakouousin autō pasin aitios sōtērias aiōniou',
   '''Being made perfect'' (teleiōtheis — having been brought to completion, having been fully qualified; the culmination of the teleioō theme from 2:10). ''Author'' (aitios — cause, source, originator; in classical Greek, the one responsible for an effect). Christ is the aitios — the efficient cause, the source — of eternal salvation. ''Eternal salvation'' (sōtērias aiōniou — salvation belonging to the age to come, everlasting deliverance). Unlike the Levitical sacrifices that needed constant repetition, Christ''s priestly work produces a salvation that is eternal. ''All them that obey him'' (tois hypakouousin autō pasin — to all who are obeying Him). The obedience of faith — not mere intellectual assent but active, ongoing trust expressed in obedience.',
   'Christ is both the author and the means of salvation. He is the ''cause'' (aitios) of eternal salvation — not merely the teacher or example but the source and ground of it. The salvation He provides is ''eternal'' (aiōniou) — qualitatively different from the temporary, repeated deliverances of the old covenant. It is available to ''all who obey'' — faith and obedience are inseparable in Hebrews'' theology.'),
  (10, 'Called of God an high priest after the order of Melchisedec.',
   'προσαγορευθεὶς ὑπὸ τοῦ θεοῦ ἀρχιερεὺς κατὰ τὴν τάξιν Μελχισεδέκ',
   'prosagoreutheis hypo tou theou archiereus kata tēn taxin Melchisedek',
   '''Called'' (prosagoreutheis — formally designated, publicly proclaimed, officially addressed as; a formal, almost legal term for bestowing a title). God Himself has officially designated Christ as ''high priest after the order of Melchisedec.'' This verse forms an inclusio with v.6, framing the description of Christ''s suffering and perfection (vv.7-9) within the Melchizedek priesthood. The author is about to expound Melchizedek in detail, but first must address the readers'' spiritual condition.',
   NULL),
  (11, 'Of whom we have many things to say, and hard to be uttered, seeing ye are dull of hearing.',
   'περὶ οὗ πολὺς ἡμῖν ὁ λόγος καὶ δυσερμήνευτος λέγειν ἐπεὶ νωθροὶ γεγόνατε ταῖς ἀκοαῖς',
   'peri hou polys hēmin ho logos kai dysermēneutos legein epei nōthroi gegonate tais akoais',
   '''Of whom'' (peri hou — concerning whom, i.e., Melchizedek and Christ''s priesthood). ''Many things to say'' (polys hēmin ho logos — our message is extensive). ''Hard to be uttered'' (dysermēneutos legein — difficult to explain, hard to interpret; from dys- [hard] + hermēneuō [to interpret] — not because the subject is inherently obscure but because the hearers are spiritually dull). ''Dull of hearing'' (nōthroi gegonate tais akoais — you have become sluggish/lazy in your hearing; nōthroi means slow, sluggish, lazy — the same word appears in 6:12). ''Have become'' (gegonate — perfect tense: this is not their original state but a condition they have deteriorated into). They were once sharper; they have regressed.',
   NULL),
  (12, 'For when for the time ye ought to be teachers, ye have need that one teach you again which be the first principles of the oracles of God; and are become such as have need of milk, and not of strong meat.',
   'καὶ γὰρ ὀφείλοντες εἶναι διδάσκαλοι διὰ τὸν χρόνον πάλιν χρείαν ἔχετε τοῦ διδάσκειν ὑμᾶς τινὰ τὰ στοιχεῖα τῆς ἀρχῆς τῶν λογίων τοῦ θεοῦ καὶ γεγόνατε χρείαν ἔχοντες γάλακτος καὶ οὐ στερεᾶς τροφῆς',
   'kai gar opheilontes einai didaskaloi dia ton chronon palin chreian echete tou didaskein hymas tina ta stoicheia tēs archēs tōn logiōn tou theou kai gegonate chreian echontes galaktos kai ou stereas trophēs',
   '''Ye ought to be teachers'' (opheilontes einai didaskaloi — you ought, by this time, to be teachers). ''For the time'' (dia ton chronon — because of the passage of time; they have been believers long enough to be mature). ''First principles'' (ta stoicheia tēs archēs — the elementary principles, the ABCs, the basic building blocks of the beginning). ''Oracles of God'' (tōn logiōn tou theou — the divine utterances, the sacred sayings; logia refers to God''s revealed words). ''Milk'' (galaktos — the simple, pre-digested truths suitable for beginners). ''Strong meat'' (stereas trophēs — solid food, meat; the deeper doctrines that require spiritual maturity to digest). The rebuke is sharp: they have regressed from potential teachers to spiritual infants who need to re-learn the basics.',
   'Spiritual maturity is expected to develop over time; stagnation is not neutral but dangerous. The author connects spiritual immaturity (inability to handle deep doctrine) with susceptibility to apostasy (the warning of ch.6). Those who cannot move beyond the basics are vulnerable to drifting away.'),
  (13, 'For every one that useth milk is unskilful in the word of righteousness: for he is a babe.',
   'πᾶς γὰρ ὁ μετέχων γάλακτος ἄπειρος λόγου δικαιοσύνης νήπιος γάρ ἐστιν',
   'pas gar ho metechōn galaktos apeiros logou dikaiosynēs nēpios gar estin',
   '''Useth milk'' (ho metechōn galaktos — the one who partakes of milk, who lives on milk alone). ''Unskilful'' (apeiros — inexperienced, unacquainted with, unskilled in; literally ''without experience''). ''The word of righteousness'' (logou dikaiosynēs — the message/doctrine concerning righteousness). This may refer to the deeper doctrines of justification, sanctification, and ethical discernment, or more broadly to mature theological understanding. ''A babe'' (nēpios — an infant, one who cannot speak/reason for themselves). The spiritual infant cannot handle complex doctrine, cannot teach others, cannot discern truth from error. They remain dependent on others for their spiritual nourishment.',
   NULL),
  (14, 'But strong meat belongeth to them that are of full age, even those who by reason of use have their senses exercised to discern both good and evil.',
   'τελείων δέ ἐστιν ἡ στερεὰ τροφή τῶν διὰ τὴν ἕξιν τὰ αἰσθητήρια γεγυμνασμένα ἐχόντων πρὸς διάκρισιν καλοῦ τε καὶ κακοῦ',
   'teleiōn de estin hē sterea trophē tōn dia tēn hexin ta aisthētēria gegymnasmena echontōn pros diakrisin kalou te kai kakou',
   '''Of full age'' (teleiōn — the mature, the complete, those who have reached their telos/goal). ''By reason of use'' (dia tēn hexin — because of practice, because of habit; hexis means a settled disposition acquired through repeated practice). ''Senses exercised'' (ta aisthētēria gegymnasmena — the perceptive faculties having been trained; aisthētēria is the faculty of perception, the spiritual senses; gegymnasmena comes from gymnazō — to train as in a gymnasium, to exercise rigorously). ''Discern both good and evil'' (pros diakrisin kalou te kai kakou — for the distinguishing of both good and evil). Spiritual maturity is not automatic but developed through disciplined practice — like an athlete training in a gym. The mature believer has trained their spiritual perception through consistent engagement with truth, enabling them to distinguish between sound and false teaching.',
   'Spiritual maturity requires intentional, disciplined practice — not merely time. The metaphor of athletic training (gymnazō) emphasizes that discernment is a skill developed through repeated exercise, not a gift bestowed passively. This has implications for discipleship: believers must actively engage with Scripture, not merely receive it passively.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 5;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετριοπαθέω', 'metriopatheō', 'G3356', 'To deal gently, to moderate one''s passions, to bear with measured restraint — from metrios (moderate) + pathos (feeling, passion). A NT hapax (only in v.2). The ideal priestly temperament: neither cold indifference nor uncontrolled emotion, but gentle, measured compassion. The high priest feels for sinners but does not lose his composure. Christ exemplifies this perfectly — He weeps with sinners (v.7) while never compromising holiness.', 1),
  ('ἱκετηρία', 'hikētēria', 'G2428', 'Supplication, earnest entreaty — originally an olive branch wrapped in wool, held by a supplicant as a sign of desperate appeal. A NT hapax (only in v.7). Applied to Christ''s Gethsemane prayers, it conveys the intensity and urgency of His cries to the Father. The Son of God — the Creator of heaven and earth — approached the Father as a desperate supplicant, holding out the olive branch of humble entreaty.', 2),
  ('εὐλάβεια', 'eulabeia', 'G2124', 'Reverent submission, godly fear, devout caution, piety — from eu (well) + lambanō (to take, to grasp). In v.7 Christ was ''heard because of his eulabeia'' — His reverent submission, His godly fear, His devout obedience. He did not demand; He submitted. He did not rebel against the cup; He drank it. His prayer was answered not by removing the cross but by being brought through death to resurrection. Eulabeia is not cringing terror but profound reverence combined with willing surrender.', 3),
  ('αἴτιος', 'aitios', 'G159', 'Cause, source, author, originator — the one responsible for producing an effect. In v.9 Christ is the aitios of eternal salvation — He is not merely the teacher or revealer of salvation but its efficient cause, its source, its producer. Salvation originates in His completed priestly work. The word carries legal and philosophical weight: Christ is the reason salvation exists, the one without whom there would be no salvation.', 4),
  ('νωθρός', 'nōthros', 'G3576', 'Sluggish, dull, lazy, slow — used of the mind or hearing. In v.11 the readers have ''become sluggish in hearing'' — their spiritual perception has deteriorated through lack of use. The word appears again in 6:12 where they are warned not to be ''slothful'' (nōthroi). The perfect tense ''have become'' (gegonate) indicates this is a developed condition, not their original state — they have regressed from earlier sharpness.', 5),
  ('αἰσθητήριον', 'aisthētērion', 'G145', 'Organ of perception, faculty of discernment, spiritual sense — from aisthanomai (to perceive). A NT hapax (only in v.14). The mature believer has trained ''perceptive faculties'' — spiritual senses analogous to physical senses — that can distinguish good from evil, truth from error. These senses are not automatic but must be trained (gegymnasmena — exercised, from gymnazō) through consistent practice with the word of righteousness.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 5
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 7
    WHEN 3 THEN 7
    WHEN 4 THEN 9
    WHEN 5 THEN 11
    WHEN 6 THEN 14
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Hebrews 2:17', 1),
  (1, 'Hebrews 8:3', 2),
  (1, 'Leviticus 16:6', 3),
  (2, 'Hebrews 4:15', 4),
  (2, 'Numbers 15:27-31', 5),
  (3, 'Leviticus 16:6', 6),
  (3, 'Leviticus 9:7', 7),
  (4, 'Exodus 28:1', 8),
  (4, 'Numbers 16:1-35', 9),
  (4, '2 Chronicles 26:16-21', 10),
  (5, 'Psalm 2:7', 11),
  (5, 'Hebrews 1:5', 12),
  (6, 'Psalm 110:4', 13),
  (6, 'Hebrews 7:17', 14),
  (6, 'Genesis 14:18-20', 15),
  (7, 'Matthew 26:36-46', 16),
  (7, 'Luke 22:44', 17),
  (7, 'Mark 14:33-36', 18),
  (8, 'Philippians 2:8', 19),
  (8, 'Romans 5:19', 20),
  (9, 'Hebrews 2:10', 21),
  (9, 'Hebrews 7:28', 22),
  (9, 'Isaiah 45:17', 23),
  (10, 'Hebrews 6:20', 24),
  (10, 'Hebrews 7:1-3', 25),
  (12, '1 Corinthians 3:1-3', 26),
  (12, '1 Peter 2:2', 27),
  (14, 'Romans 16:19', 28),
  (14, 'Philippians 1:9-10', 29),
  (14, '1 Thessalonians 5:21', 30)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 5
  AND v.verse_number = cr.verse_number;
