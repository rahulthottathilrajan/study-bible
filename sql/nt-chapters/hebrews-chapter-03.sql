-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 3 — Christ Greater Than Moses; the Warning from Psalm 95
-- 19 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Hebrews 3 shifts from Christ''s superiority over angels (chs.1-2) to His superiority over Moses — the greatest figure in Judaism. The chapter opens by calling believers ''holy brethren, partakers of the heavenly calling'' and directing them to ''consider the Apostle and High Priest of our profession, Christ Jesus'' (v.1). Moses was ''faithful in all his house, as a servant'' (v.5), but Christ is ''a Son over his own house'' (v.6) — the builder is greater than the building, and the son is greater than the servant. ''Whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end'' (v.6). The second half of the chapter (vv.7-19) contains the second warning passage, built on Psalm 95:7-11. The Holy Spirit warns: ''To day if ye will hear his voice, harden not your hearts, as in the provocation, in the day of temptation in the wilderness'' (vv.7-8). The Exodus generation saw God''s works for forty years yet ''always'' erred in their hearts (v.10). God swore in His wrath: ''They shall not enter into my rest'' (v.11). The application is urgent: ''Take heed, brethren, lest there be in any of you an evil heart of unbelief, in departing from the living God'' (v.12). Believers must ''exhort one another daily'' lest any be ''hardened through the deceitfulness of sin'' (v.13). ''For we are made partakers of Christ, if we hold the beginning of our confidence stedfast unto the end'' (v.14). The chapter closes with three piercing questions: Who provoked? Who was God grieved with? To whom did He swear? The answer: those who ''could not enter in because of unbelief'' (v.19).',
  'Christ''s Superiority over Moses and the Warning against Unbelief',
  'ἀπιστία (apistia)',
  'Unbelief, unfaithfulness, lack of faith — from a (not) + pistis (faith). The fatal sin of the wilderness generation was not ignorance but unbelief — they saw God''s works (v.9), heard His voice, knew His power, yet refused to trust Him. In v.12 it is ''an evil heart of unbelief'' (kardia ponēra apistias) that leads to ''departing from the living God.'' Unbelief is not merely intellectual doubt but moral rebellion — a willful refusal to trust God despite overwhelming evidence.',
  '["Consider Christ Jesus: Apostle and High Priest (vv.1-6): Wherefore holy brethren partakers of the heavenly calling consider the Apostle and High Priest of our profession Christ Jesus who was faithful to him that appointed him as also Moses was faithful in all his house; for this man was counted worthy of more glory than Moses inasmuch as he who hath builded the house hath more honour than the house; for every house is builded by some man but he that built all things is God; and Moses verily was faithful in all his house as a servant for a testimony of those things which were to be spoken after; but Christ as a son over his own house whose house are we if we hold fast the confidence and the rejoicing of the hope firm unto the end","The Warning from Psalm 95: Harden Not Your Hearts (vv.7-11): Wherefore as the Holy Ghost saith To day if ye will hear his voice harden not your hearts as in the provocation in the day of temptation in the wilderness when your fathers tempted me proved me and saw my works forty years; wherefore I was grieved with that generation and said They do alway err in their heart and they have not known my ways; so I sware in my wrath They shall not enter into my rest","Application: Beware the Evil Heart of Unbelief (vv.12-19): Take heed brethren lest there be in any of you an evil heart of unbelief in departing from the living God; but exhort one another daily while it is called To day lest any of you be hardened through the deceitfulness of sin; for we are made partakers of Christ if we hold the beginning of our confidence stedfast unto the end; while it is said To day if ye will hear his voice harden not your hearts as in the provocation; for some when they had heard did provoke howbeit not all that came out of Egypt by Moses; but with whom was he grieved forty years was it not with them that had sinned whose carcases fell in the wilderness; and to whom sware he that they should not enter into his rest but to them that believed not; so we see that they could not enter in because of unbelief"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 19 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Wherefore, holy brethren, partakers of the heavenly calling, consider the Apostle and High Priest of our profession, Christ Jesus;',
   'ὅθεν ἀδελφοὶ ἅγιοι κλήσεως ἐπουρανίου μέτοχοι κατανοήσατε τὸν ἀπόστολον καὶ ἀρχιερέα τῆς ὁμολογίας ἡμῶν Ἰησοῦν Χριστόν',
   'hothen adelphoi hagioi klēseōs epouraniou metochoi katanoēsate ton apostolon kai archierea tēs homologias hēmōn Iēsoun Christon',
   '''Holy brethren'' (adelphoi hagioi — brothers who are set apart, saints). ''Partakers of the heavenly calling'' (klēseōs epouraniou metochoi — sharers in a calling that originates from heaven). ''Consider'' (katanoēsate — to fix your mind upon, to observe carefully, to contemplate; stronger than mere thinking). ''Apostle'' (apostolon — sent one; the only time Jesus is called ''Apostle'' in the NT — He is God''s supreme envoy, sent from heaven to earth). ''High Priest'' (archierea — the title introduced in 2:17 now becomes programmatic). ''Of our profession'' (tēs homologias hēmōn — of our confession, our public declaration of faith). Christ is both the one sent by God to us (Apostle) and the one who represents us before God (High Priest).',
   'The dual title ''Apostle and High Priest'' captures the two directions of Christ''s mediatorial work: He comes from God to man (apostle/sent one) and goes from man to God (high priest). Moses was God''s apostle to Israel; Aaron was Israel''s high priest before God. Christ unites both roles in one person — surpassing both.'),
  (2, 'Who was faithful to him that appointed him, as also Moses was faithful in all his house.',
   'πιστὸν ὄντα τῷ ποιήσαντι αὐτὸν ὡς καὶ Μωϋσῆς ἐν ὅλῳ τῷ οἴκῳ αὐτοῦ',
   'piston onta tō poiēsanti auton hōs kai Mōysēs en holō tō oikō autou',
   '''Faithful'' (piston — trustworthy, reliable, dependable). ''To him that appointed him'' (tō poiēsanti auton — to the one who made/appointed him; poieō can mean ''to make'' or ''to appoint'' — here it means appointed to His mediatorial office, not created). ''As also Moses'' — the comparison begins on common ground: both Jesus and Moses were faithful. The quote alludes to Numbers 12:7 where God Himself testified: ''My servant Moses … is faithful in all mine house.'' Moses'' faithfulness was unsurpassed in the OT; Christ''s faithfulness equals and exceeds it.',
   NULL),
  (3, 'For this man was counted worthy of more glory than Moses, inasmuch as he who hath builded the house hath more honour than the house.',
   'πλείονος γὰρ οὗτος δόξης παρὰ Μωϋσῆν ἠξίωται καθ᾽ ὅσον πλείονα τιμὴν ἔχει τοῦ οἴκου ὁ κατασκευάσας αὐτόν',
   'pleionos gar houtos doxēs para Mōysēn ēxiōtai kath hoson pleiona timēn echei tou oikou ho kataskeuasas auton',
   '''Counted worthy of more glory'' (pleionos doxēs ēxiōtai — has been deemed worthy of greater glory; perfect tense indicating His permanent, settled status). The argument is simple but devastating: the builder always has more honor than the building. Moses was part of the house (God''s household, Israel); Christ built the house. The architect surpasses the structure. ''He who hath builded'' (ho kataskeuasas — the one who constructed, prepared, furnished). Moses was the faithful servant within God''s household; Christ is the divine architect who designed and built it.',
   NULL),
  (4, 'For every house is builded by some man; but he that built all things is God.',
   'πᾶς γὰρ οἶκος κατασκευάζεται ὑπό τινος ὁ δὲ τὰ πάντα κατασκευάσας θεός',
   'pas gar oikos kataskeuazetai hypo tinos ho de ta panta kataskeuasas theos',
   '''Every house is builded by some man'' — a self-evident principle. ''But he that built all things is God'' (ho de ta panta kataskeuasas theos — the one who built everything is God). The argument moves from the specific (the house of Israel) to the universal (all things). Since God built all things, and since Christ built God''s house (v.3), the conclusion is inescapable: Christ is God. The logic is subtle but profound — the author does not state it directly but lets the reader draw the conclusion.',
   'This verse implicitly identifies Christ with God. If ''he that built all things is God'' and Christ is ''he who hath builded the house'' (v.3), then Christ is God — the divine builder of all creation. This echoes Hebrews 1:2 (''by whom also he made the worlds'') and 1:10 (''Thou, Lord, hast laid the foundation of the earth'').'),
  (5, 'And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after;',
   'καὶ Μωϋσῆς μὲν πιστὸς ἐν ὅλῳ τῷ οἴκῳ αὐτοῦ ὡς θεράπων εἰς μαρτύριον τῶν λαληθησομένων',
   'kai Mōysēs men pistos en holō tō oikō autou hōs therapōn eis martyrion tōn lalēthēsomenōn',
   '''Faithful … as a servant'' (pistos … hōs therapōn). The word for servant is therapōn (not doulos/slave), a term of dignity — a trusted attendant, a household steward. It appears only here in the NT. Moses held the highest servant rank, but he was still a servant, not the owner. ''For a testimony of those things which were to be spoken after'' (eis martyrion tōn lalēthēsomenōn — as a witness to what would be spoken later). Moses'' entire ministry was preparatory and typological — pointing forward to the realities that would come through Christ. The law, the tabernacle, the sacrifices were all ''testimony'' (martyrion) to future truths.',
   NULL),
  (6, 'But Christ as a son over his own house; whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end.',
   'Χριστὸς δὲ ὡς υἱὸς ἐπὶ τὸν οἶκον αὐτοῦ οὗ οἶκός ἐσμεν ἡμεῖς ἐάνπερ τὴν παρρησίαν καὶ τὸ καύχημα τῆς ἐλπίδος μέχρι τέλους βεβαίαν κατάσχωμεν',
   'Christos de hōs hyios epi ton oikon autou hou oikos esmen hēmeis eanper tēn parrēsian kai to kauchēma tēs elpidos mechri telous bebaian kataschōmen',
   '''As a son over his own house'' (hōs hyios epi ton oikon autou) — the contrast is stark: Moses was in the house as a servant; Christ is over the house as the Son. The servant belongs to the household; the son owns it. ''Whose house are we'' (hou oikos esmen hēmeis — we are His house, His household). Believers are the living temple, the household of God. ''If we hold fast'' (eanper kataschōmen — if indeed we retain, hold firmly). ''Confidence'' (parrēsian — boldness, freedom of speech, open confidence). ''Rejoicing of the hope'' (kauchēma tēs elpidos — the boast, the exultation that comes from hope). ''Firm unto the end'' (mechri telous bebaian — firm, steadfast until the completion). The conditional ''if'' does not express doubt about salvation but underscores that perseverance is the evidence of genuine faith.',
   'The conditional clause ''if we hold fast'' introduces a key Hebrews theme: perseverance as the evidence (not the cause) of genuine salvation. Those who truly belong to Christ''s house will demonstrate it by holding fast to the end. This is not salvation by works but the inseparability of true faith and endurance.'),
  (7, 'Wherefore (as the Holy Ghost saith, To day if ye will hear his voice,',
   'διό καθὼς λέγει τὸ πνεῦμα τὸ ἅγιον σήμερον ἐὰν τῆς φωνῆς αὐτοῦ ἀκούσητε',
   'dio kathōs legei to pneuma to hagion sēmeron ean tēs phōnēs autou akousēte',
   '''As the Holy Ghost saith'' (kathōs legei to pneuma to hagion — present tense: as the Holy Spirit says, not merely ''said''). The author attributes Psalm 95 to the Holy Spirit, affirming divine authorship of Scripture. ''To day'' (sēmeron — today; the urgency of ''today'' is the rhetorical force of the entire warning). ''If ye will hear his voice'' (ean tēs phōnēs autou akousēte — if you hear His voice; the subjunctive implies the possibility of either hearing or refusing). The warning begins with the present tense ''saith'' — the psalm is not merely ancient history but a living, present word of the Spirit.',
   'The attribution of Psalm 95 to the Holy Spirit demonstrates the NT doctrine of Scripture''s divine inspiration: David wrote the psalm, but the Holy Spirit is its true author. Note the present tense ''saith'' (legei) — Scripture is not dead text but the living voice of God, speaking freshly to each generation.'),
  (8, 'Harden not your hearts, as in the provocation, in the day of temptation in the wilderness:',
   'μὴ σκληρύνητε τὰς καρδίας ὑμῶν ὡς ἐν τῷ παραπικρασμῷ κατὰ τὴν ἡμέραν τοῦ πειρασμοῦ ἐν τῇ ἐρήμῳ',
   'mē sklērynēte tas kardias hymōn hōs en tō parapikrasmō kata tēn hēmeran tou peirasmou en tē erēmō',
   '''Harden not'' (mē sklērynēte — do not make hard, do not become obstinate; the verb implies a process — hardness develops over time through repeated resistance). ''Your hearts'' (tas kardias hymōn — the heart is the center of thought, will, and affection in biblical anthropology). ''The provocation'' (tō parapikrasmō — the bitter rebellion, the exasperation; from para + pikrainō, to embitter, to provoke to anger). This refers to the events at Meribah and Massah (Exod 17:1-7) where Israel quarreled with God at the waters of strife. ''Temptation'' (peirasmou — testing, trial). Israel tested God despite having witnessed His miraculous deliverance from Egypt.',
   NULL),
  (9, 'When your fathers tempted me, proved me, and saw my works forty years.',
   'οὗ ἐπείρασάν με οἱ πατέρες ὑμῶν ἐδοκίμασάν με καὶ εἶδον τὰ ἔργα μου τεσσαράκοντα ἔτη',
   'hou epeirasan me hoi pateres hymōn edokimasan me kai eidon ta erga mou tessarakonta etē',
   '''Tempted me'' (epeirasan me — they put me to the test). ''Proved me'' (edokimasan me — they tested me, they put me on trial; the same root as dokimazō from 2 Cor 13:5). ''Saw my works forty years'' — for four decades Israel witnessed God''s miraculous provision (manna, water from rock, pillar of fire and cloud, clothing that did not wear out) and yet refused to trust Him. The enormity of their unbelief is proportional to the abundance of evidence they had. They tested God despite overwhelming proof of His faithfulness.',
   NULL),
  (10, 'Wherefore I was grieved with that generation, and said, They do alway err in their heart; and they have not known my ways.',
   'διὸ προσώχθισα τῇ γενεᾷ ἐκείνῃ καὶ εἶπον ἀεὶ πλανῶνται τῇ καρδίᾳ αὐτοὶ δὲ οὐκ ἔγνωσαν τὰς ὁδούς μου',
   'dio prosōchthisa tē genea ekeinē kai eipon aei planōntai tē kardia autoi de ouk egnōsan tas hodous mou',
   '''I was grieved'' (prosōchthisa — I was angry, I was provoked, I was disgusted; a strong word expressing deep displeasure). ''That generation'' (tē genea ekeinē — a term of distance and judgment). ''Alway err in their heart'' (aei planōntai tē kardia — they are constantly led astray in their hearts; planaomai means to wander, to go astray, to be deceived). The problem was not occasional failure but habitual, heart-level rebellion. ''They have not known my ways'' (ouk egnōsan tas hodous mou — they did not come to know my ways). Despite forty years of God''s works, they never truly understood His character and purposes. Knowledge of God''s ways requires a willing heart, not merely exposure to His works.',
   NULL),
  (11, 'So I sware in my wrath, They shall not enter into my rest.)',
   'ὡς ὤμοσα ἐν τῇ ὀργῇ μου εἰ εἰσελεύσονται εἰς τὴν κατάπαυσίν μου',
   'hōs ōmosa en tē orgē mou ei eiseleusontai eis tēn katapausin mou',
   '''I sware in my wrath'' (ōmosa en tē orgē mou — the divine oath, irrevocable and terrifying). ''They shall not enter into my rest'' (ei eiseleusontai eis tēn katapausin mou — a Hebrew oath formula: ''if they shall enter'' meaning ''they shall certainly not enter''). ''My rest'' (tēn katapausin mou — my cessation, my resting place). In the immediate context, this was the promised land of Canaan; in the author''s typological reading (ch.4), it points to a deeper, spiritual rest — God''s own sabbath rest that remains for the people of God. The generation that left Egypt never entered Canaan; they died in the wilderness — an eternal warning against unbelief.',
   'God''s ''rest'' (katapausis) operates on multiple levels: (1) the promised land of Canaan (the immediate OT referent); (2) God''s sabbath rest after creation (Gen 2:2); (3) the spiritual rest of salvation entered by faith (ch.4). The wilderness generation forfeited all three because of unbelief.'),
  (12, 'Take heed, brethren, lest there be in any of you an evil heart of unbelief, in departing from the living God.',
   'βλέπετε ἀδελφοί μήποτε ἔσται ἔν τινι ὑμῶν καρδία πονηρὰ ἀπιστίας ἐν τῷ ἀποστῆναι ἀπὸ θεοῦ ζῶντος',
   'blepete adelphoi mēpote estai en tini hymōn kardia ponēra apistias en tō apostēnai apo theou zōntos',
   '''Take heed'' (blepete — watch out, be on guard, look carefully; present imperative demanding ongoing vigilance). ''Evil heart of unbelief'' (kardia ponēra apistias — a heart characterized by wickedness and faithlessness; the genitive ''of unbelief'' describes the nature of the evil: the wickedness is unbelief itself). ''In departing from the living God'' (en tō apostēnai apo theou zōntos — in the act of falling away from the living God; apostēnai is the root of ''apostasy'' — to stand away from, to desert). ''The living God'' (theou zōntos) — not an idol or abstraction but the living, active, responding God who judges and saves. The warning is addressed to ''brethren'' — the visible community of faith, some of whom may harbor unbelief.',
   'This verse identifies unbelief as the root sin from which apostasy grows. The progression is: an evil heart → unbelief → departing from God. The antidote (v.13) is mutual encouragement within the community. Note: ''departing from the living God'' (apostēnai) is the most serious spiritual danger — not moral failure per se, but the abandonment of faith in God.'),
  (13, 'But exhort one another daily, while it is called To day; lest any of you be hardened through the deceitfulness of sin.',
   'ἀλλὰ παρακαλεῖτε ἑαυτοὺς καθ᾽ ἑκάστην ἡμέραν ἄχρις οὗ τὸ σήμερον καλεῖται ἵνα μὴ σκληρυνθῇ τις ἐξ ὑμῶν ἀπάτῃ τῆς ἁμαρτίας',
   'alla parakaleite heautous kath hekastēn hēmeran achris hou to sēmeron kaleitai hina mē sklērynthē tis ex hymōn apatē tēs hamartias',
   '''Exhort one another'' (parakaleite heautous — encourage, comfort, urge one another; the same root as paraklēsis, the ministry of the Spirit/Paraclete). ''Daily'' (kath hekastēn hēmeran — every single day). ''While it is called To day'' — the window of opportunity for repentance is finite; ''today'' will eventually give way to judgment. ''Hardened'' (sklērynthē — made hard, calloused; the same word as v.8, but here passive: one is hardened by sin''s deception). ''Deceitfulness of sin'' (apatē tēs hamartias — sin''s trickery, sin''s seduction). Sin deceives by promising pleasure and delivering bondage, by appearing harmless while producing hardness. The antidote to sin''s deception is the daily mutual encouragement of believers — we need each other.',
   'This verse establishes the communal dimension of perseverance: believers cannot persevere alone. Daily mutual encouragement is not optional but essential for preventing the hardening that leads to apostasy. The Christian life is inherently communal.'),
  (14, 'For we are made partakers of Christ, if we hold the beginning of our confidence stedfast unto the end;',
   'μέτοχοι γὰρ γεγόναμεν τοῦ Χριστοῦ ἐάνπερ τὴν ἀρχὴν τῆς ὑποστάσεως μέχρι τέλους βεβαίαν κατάσχωμεν',
   'metochoi gar gegonamen tou Christou eanper tēn archēn tēs hypostaseōs mechri telous bebaian kataschōmen',
   '''Partakers of Christ'' (metochoi tou Christou — sharers in Christ, partners with Christ; we participate in His life, His death, His resurrection). ''We are made'' (gegonamen — we have become; perfect tense: our partnership with Christ is an established reality). ''If we hold'' (eanper kataschōmen — if indeed we hold fast, retain firmly). ''The beginning of our confidence'' (tēn archēn tēs hypostaseōs — the foundational confidence, the original assurance; hypostasis here means conviction, firm confidence, not ''substance'' as in 1:3). ''Stedfast unto the end'' (mechri telous bebaian — firm, reliable, unwavering until the completion). As in v.6, the conditional ''if'' does not create doubt but defines the mark of genuine participation in Christ: those who are truly His will persevere.',
   'Perseverance is presented as the proof of genuine participation in Christ, not its precondition. The perfect tense ''we have become partakers'' (gegonamen) points to a completed reality; the conditional ''if we hold'' describes how that reality is demonstrated. True believers will hold fast — and holding fast reveals that one is truly a partaker of Christ.'),
  (15, 'While it is said, To day if ye will hear his voice, harden not your hearts, as in the provocation.',
   'ἐν τῷ λέγεσθαι σήμερον ἐὰν τῆς φωνῆς αὐτοῦ ἀκούσητε μὴ σκληρύνητε τὰς καρδίας ὑμῶν ὡς ἐν τῷ παραπικρασμῷ',
   'en tō legesthai sēmeron ean tēs phōnēs autou akousēte mē sklērynēte tas kardias hymōn hōs en tō parapikrasmō',
   'The Psalm 95 quotation is repeated, reinforcing the urgency of ''today.'' ''While it is said'' (en tō legesthai — while it is being said; the present passive suggests the psalm continues to speak — it is ''being said'' now, to the readers, not merely to the original audience). The repetition serves a rhetorical purpose: the warning is not one-time but ongoing, echoing through the ages until the final ''today'' is past.',
   NULL),
  (16, 'For some, when they had heard, did provoke: howbeit not all that came out of Egypt by Moses.',
   'τινὲς γὰρ ἀκούσαντες παρεπίκραναν ἀλλ᾽ οὐ πάντες οἱ ἐξελθόντες ἐξ Αἰγύπτου διὰ Μωϋσέως',
   'tines gar akousantes parepikranan all ou pantes hoi exelthontes ex Aigyptou dia Mōyseōs',
   '''Some, when they had heard, did provoke'' (tines akousantes parepikranan — some, having heard, rebelled). ''Howbeit not all'' (all ou pantes — but not all). The author reminds his readers that the judgment was not universal: Joshua and Caleb believed and entered the land (Num 14:30). Not every member of the visible community fell; faith was possible even amid widespread rebellion. This provides both warning (most fell) and encouragement (some believed). ''That came out of Egypt by Moses'' — they experienced the greatest deliverance in Israel''s history, yet most of them rebelled.',
   NULL),
  (17, 'But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?',
   'τίσιν δὲ προσώχθισεν τεσσαράκοντα ἔτη οὐχὶ τοῖς ἁμαρτήσασιν ὧν τὰ κῶλα ἔπεσεν ἐν τῇ ἐρήμῳ',
   'tisin de prosōchthisen tessarakonta etē ouchi tois hamartēsasin hōn ta kōla epesen en tē erēmō',
   '''With whom was he grieved?'' — the first of three penetrating rhetorical questions (vv.17-18) that drive the warning home. ''Forty years'' (tessarakonta etē) — a full generation. ''Whose carcases fell'' (hōn ta kōla epesen — whose limbs/corpses fell; kōla literally means ''limbs'' — a vivid, almost brutal image of bodies strewn across the desert). The wilderness became a graveyard. Every adult who left Egypt (except Joshua and Caleb) died in the desert, never seeing the promised land. Their physical death was the visible consequence of spiritual unbelief.',
   NULL),
  (18, 'And to whom sware he that they should not enter into his rest, but to them that believed not?',
   'τίσιν δὲ ὤμοσεν μὴ εἰσελεύσεσθαι εἰς τὴν κατάπαυσιν αὐτοῦ εἰ μὴ τοῖς ἀπειθήσασιν',
   'tisin de ōmosen mē eiseleusesthai eis tēn katapausin autou ei mē tois apeithēsasin',
   '''To whom sware he?'' — the second rhetorical question. ''That they should not enter into his rest'' (mē eiseleusesthai eis tēn katapausin) — the divine oath excluded them permanently. ''But to them that believed not'' (tois apeithēsasin — to those who were disobedient/unbelieving). The word apeithēsasin can mean either ''disbelieved'' or ''disobeyed'' — in biblical theology, the two are inseparable. Unbelief is always disobedience, and disobedience is always rooted in unbelief. They refused to believe God''s promise and therefore refused to obey God''s command to enter the land.',
   NULL),
  (19, 'So we see that they could not enter in because of unbelief.',
   'καὶ βλέπομεν ὅτι οὐκ ἠδυνήθησαν εἰσελθεῖν δι᾽ ἀπιστίαν',
   'kai blepomen hoti ouk ēdynēthēsan eiselthein di apistian',
   '''We see'' (blepomen — we observe, we perceive clearly). ''They could not enter in'' (ouk ēdynēthēsan eiselthein — they were unable to enter; they had the opportunity, the promise, the power of God available, but they could not enter). ''Because of unbelief'' (di apistian — on account of unfaithfulness/unbelief). The summary verdict is devastating in its simplicity: the one thing that shut them out was unbelief. Not the strength of their enemies, not the size of the giants, not the difficulty of the journey — unbelief alone barred them from God''s rest. This is the lesson the author wants his readers to absorb: unbelief is the fatal sin.',
   'The chapter''s conclusion establishes unbelief as the ultimate barrier to entering God''s rest. The wilderness generation had everything — miraculous deliverance, divine guidance, God''s presence — but lacked the one essential thing: faith. This principle applies directly to the readers of Hebrews and to every subsequent generation.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 3;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατανοέω', 'katanoeō', 'G2657', 'To consider carefully, to observe closely, to fix one''s mind upon, to contemplate — from kata (down, intensive) + noeō (to think, perceive). In v.1 believers are commanded to ''consider'' Christ with focused, sustained attention — not a casual glance but a deliberate, intensive contemplation of who He is and what He has done. The compound with kata intensifies the basic verb: this is more than thinking; it is thorough, penetrating observation.', 1),
  ('θεράπων', 'therapōn', 'G2324', 'An attendant, a trusted household servant, a minister — a dignified term for service, distinct from doulos (slave). A NT hapax (only in v.5). Applied to Moses from Numbers 12:7 (LXX). Therapōn denotes a servant of honor and trust — Moses served God''s house with distinction. But even this noble service is surpassed by the Son''s authority: a therapōn (servant) in the house is not the same as a hyios (son) over the house.', 2),
  ('παρρησία', 'parrēsia', 'G3954', 'Boldness, confidence, freedom of speech, openness — from pan (all) + rhēsis (speech). In v.6 believers are to ''hold fast the confidence'' (tēn parrēsian). In Greek culture, parrēsia was the right of citizens to speak freely in the assembly. In Hebrews, it describes the believer''s bold confidence before God — the freedom to approach Him without fear (4:16; 10:19,35). This confidence comes not from self-assurance but from Christ''s high priestly work.', 3),
  ('σκληρύνω', 'sklērynō', 'G4645', 'To harden, to make stiff, to render obstinate — from sklēros (hard, rough, harsh). In vv.8,13,15 the word describes what happens to a heart that repeatedly resists God: it becomes calloused, unresponsive, impervious to divine truth. Hardening can be active (v.8: ''harden not'' — a willful act) or passive (v.13: ''be hardened'' — the result of sin''s deception). The process is gradual but ultimately irreversible, as the wilderness generation demonstrated.', 4),
  ('ἀπάτη', 'apatē', 'G539', 'Deceit, deception, seduction, delusion — from apataō (to deceive, to cheat). In v.13 sin is personified as a deceiver: ''the deceitfulness of sin'' (apatē tēs hamartias). Sin promises what it cannot deliver and conceals the consequences of disobedience. Its method is gradual — not a sudden overwhelming but a slow seduction that hardens the heart imperceptibly. The antidote is daily mutual encouragement among believers.', 5),
  ('ἀπιστία', 'apistia', 'G570', 'Unbelief, unfaithfulness, lack of faith — from a (not) + pistis (faith). The chapter''s final word and verdict: the wilderness generation ''could not enter in because of unbelief'' (di apistian, v.19). Apistia is not mere intellectual doubt but a culpable refusal to trust God despite overwhelming evidence of His faithfulness. It is the root sin from which all other sins grow — the ''evil heart of unbelief'' (v.12) that leads to apostasy.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 3
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 5
    WHEN 3 THEN 6
    WHEN 4 THEN 8
    WHEN 5 THEN 13
    WHEN 6 THEN 19
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Hebrews 4:14', 1),
  (1, 'Hebrews 2:17', 2),
  (1, 'John 20:21', 3),
  (2, 'Numbers 12:7', 4),
  (3, 'Hebrews 1:2', 5),
  (3, 'John 1:3', 6),
  (4, 'Hebrews 1:2', 7),
  (4, 'Hebrews 1:10', 8),
  (5, 'Numbers 12:7-8', 9),
  (5, 'Deuteronomy 18:15-18', 10),
  (6, 'Hebrews 3:14', 11),
  (6, 'Hebrews 10:23', 12),
  (6, '1 Corinthians 3:16', 13),
  (7, 'Psalm 95:7-11', 14),
  (7, '2 Peter 1:21', 15),
  (8, 'Exodus 17:1-7', 16),
  (8, 'Numbers 20:1-13', 17),
  (9, 'Psalm 78:17-22', 18),
  (9, 'Deuteronomy 8:2-5', 19),
  (11, 'Numbers 14:22-23', 20),
  (11, 'Numbers 14:28-35', 21),
  (11, 'Psalm 95:11', 22),
  (12, 'Hebrews 12:25', 23),
  (12, 'Hebrews 10:31', 24),
  (13, 'Hebrews 10:24-25', 25),
  (13, 'Romans 1:11-12', 26),
  (14, 'Hebrews 3:6', 27),
  (14, 'Hebrews 6:11', 28),
  (16, 'Numbers 14:30', 29),
  (16, 'Joshua 14:6-12', 30),
  (17, 'Numbers 14:29', 31),
  (17, '1 Corinthians 10:5', 32),
  (18, 'Numbers 14:22-23', 33),
  (19, 'Hebrews 4:6', 34),
  (19, 'John 3:36', 35)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 3
  AND v.verse_number = cr.verse_number;
