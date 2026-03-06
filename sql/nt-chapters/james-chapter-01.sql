-- ═══════════════════════════════════════════════════
-- JAMES CHAPTER 1 — Trials, Temptation, and True Religion
-- 27 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'James 1 introduces the most practical epistle in the New Testament with a rapid-fire series of foundational truths. James, the half-brother of Jesus and leader of the Jerusalem church, writes to Jewish believers scattered abroad. He begins with the startling command to ''count it all joy'' when trials come (v.2), explaining that the testing of faith produces patience and maturity (vv.3-4). He then addresses the need for wisdom, promising that God gives generously to those who ask in faith without wavering (vv.5-8). The chapter tackles the origin of temptation, insisting it comes not from God but from one''s own lust (vv.13-15), while every good gift descends from the ''Father of lights'' (v.17). The famous imperative to be ''swift to hear, slow to speak, slow to wrath'' appears in verse 19. James then contrasts mere hearers of the word with doers (vv.22-25), culminating in his definition of ''pure religion'' — caring for orphans and widows and keeping oneself unspotted from the world (v.27).',
  'Enduring Trials and Living the Word',
  'δοκίμιον (dokimion)',
  'Testing, proving, the means of trial — the instrument by which genuineness is demonstrated. As gold is tested by fire, so faith is tested by trials, and the proven result is patience, completeness, and maturity.',
  '["Greeting: James to the Twelve Tribes (v.1): James, a servant of God and of the Lord Jesus Christ, to the twelve tribes scattered abroad, greeting","Joy in Trials (vv.2-4): Count it all joy when ye fall into divers temptations; the trying of your faith worketh patience; let patience have her perfect work that ye may be perfect and entire, wanting nothing","Wisdom from God (vv.5-8): If any lack wisdom, let him ask of God who giveth to all liberally and upbraideth not; ask in faith nothing wavering; a double minded man is unstable in all his ways","The Rich and the Poor (vv.9-11): Let the brother of low degree rejoice in that he is exalted; the rich in that he is made low; the rich man shall fade away in his ways","The Crown of Life (v.12): Blessed is the man that endureth temptation; when he is tried he shall receive the crown of life which the Lord hath promised to them that love him","The Origin of Temptation (vv.13-16): Let no man say when he is tempted I am tempted of God; God cannot be tempted with evil neither tempteth he any man; every man is tempted when he is drawn away of his own lust and enticed; lust bringeth forth sin and sin bringeth forth death","Every Good Gift from the Father of Lights (vv.17-18): Every good gift and every perfect gift is from above coming down from the Father of lights with whom is no variableness neither shadow of turning; of his own will begat he us with the word of truth","Swift to Hear, Slow to Speak (vv.19-21): Be swift to hear slow to speak slow to wrath; the wrath of man worketh not the righteousness of God; lay apart all filthiness and receive with meekness the engrafted word","Doers Not Hearers Only (vv.22-25): Be ye doers of the word and not hearers only deceiving your own selves; whoso looketh into the perfect law of liberty and continueth therein being not a forgetful hearer but a doer of the work this man shall be blessed in his deed","Pure Religion (vv.26-27): If any man seem to be religious and bridleth not his tongue his religion is vain; pure religion and undefiled before God is this to visit the fatherless and widows in their affliction and to keep himself unspotted from the world"]'
FROM books b WHERE b.name = 'James';

-- Step 2: Insert all 27 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'James, a servant of God and of the Lord Jesus Christ, to the twelve tribes which are scattered abroad, greeting.',
   'Ἰάκωβος θεοῦ καὶ κυρίου Ἰησοῦ Χριστοῦ δοῦλος ταῖς δώδεκα φυλαῖς ταῖς ἐν τῇ διασπορᾷ χαίρειν',
   'Iakōbos theou kai kyriou Iēsou Christou doulos tais dōdeka phylais tais en tē diaspora chairein',
   '''James'' (Iakōbos — the Greek form of Jacob). Though the half-brother of Jesus (Matt 13:55; Gal 1:19), James identifies himself only as ''a servant'' (doulos — a bond-slave, one owned by and utterly devoted to his master). No claim of family privilege. ''Of God and of the Lord Jesus Christ'' — placing Jesus alongside God in a single construction of equal authority. ''The twelve tribes scattered abroad'' (tais dōdeka phylais tais en tē diaspora — to the twelve tribes in the Dispersion). The primary audience is Jewish believers dispersed throughout the Roman Empire. ''Greeting'' (chairein — rejoice, be glad; the standard Greek letter opening, but James will load it with meaning in verse 2 where he calls them to ''joy'').',
   NULL),
  (2,
   'My brethren, count it all joy when ye fall into divers temptations;',
   'Πᾶσαν χαρὰν ἡγήσασθε ἀδελφοί μου ὅταν πειρασμοῖς περιπέσητε ποικίλοις',
   'Pasan charan hēgēsasthe adelphoi mou hotan peirasmois peripesēte poikilois',
   '''Count'' (hēgēsasthe — aorist imperative: make a decisive evaluation, reckon, consider it settled). ''All joy'' (pasan charan — complete joy, nothing but joy; not some joy but all joy). ''Temptations'' (peirasmois — trials, testings; the word can mean either external trials or internal temptation; here it means trials that test faith). ''Divers'' (poikilois — various, many-coloured, diverse in kind). ''Fall into'' (peripesēte — to fall around, to be surrounded by, to encounter unexpectedly; the same word used of the man who ''fell among'' thieves in Luke 10:30). Trials are not sought but suddenly surround us. The command is not to feel happy but to make a considered judgment: these trials serve a divine purpose.',
   'Joy in trials: James does not command an emotion but a settled evaluation. The believer is to deliberately reckon trials as occasion for joy — not because suffering is pleasant, but because of what trials produce (v.3-4). This is not Stoic indifference but faith-based assessment: God is sovereign over trials and uses them for the believer''s perfection.'),
  (3,
   'Knowing this, that the trying of your faith worketh patience.',
   'γινώσκοντες ὅτι τὸ δοκίμιον ὑμῶν τῆς πίστεως κατεργάζεται ὑπομονήν',
   'ginōskontes hoti to dokimion hymōn tēs pisteōs katergazetai hypomonēn',
   '''Knowing'' (ginōskontes — present participle: because you know, since you recognise from experience). ''The trying'' (to dokimion — the testing, the proving process, the means of testing; like a metallurgist''s crucible that tests the purity of gold). ''Worketh'' (katergazetai — produces, brings about, accomplishes as a finished result). ''Patience'' (hypomonēn — endurance, steadfast perseverance, the ability to remain under pressure without collapsing; from hypo + menō, to remain under). Not passive resignation but active endurance that holds its ground.',
   NULL),
  (4,
   'But let patience have her perfect work, that ye may be perfect and entire, wanting nothing.',
   'ἡ δὲ ὑπομονὴ ἔργον τέλειον ἐχέτω ἵνα ἦτε τέλειοι καὶ ὁλόκληροι ἐν μηδενὶ λειπόμενοι',
   'hē de hypomonē ergon teleion echetō hina ēte teleioi kai holoklēroi en mēdeni leipomenoi',
   '''Perfect work'' (ergon teleion — complete work, finished result). ''Perfect'' (teleioi — mature, complete, having reached the goal; from telos, the end or purpose). ''Entire'' (holoklēroi — whole in every part, complete in all respects; from holos, whole + klēros, lot or portion — having every part of one''s allotted portion). ''Wanting nothing'' (en mēdeni leipomenoi — lacking in nothing, deficient in no respect). The chain: trials → testing → patience → maturity → completeness. Patience must be allowed to run its full course; short-circuiting the process prevents the goal.',
   NULL),
  (5,
   'If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him.',
   'εἰ δέ τις ὑμῶν λείπεται σοφίας αἰτείτω παρὰ τοῦ διδόντος θεοῦ πᾶσιν ἁπλῶς καὶ μὴ ὀνειδίζοντος καὶ δοθήσεται αὐτῷ',
   'ei de tis hymōn leipetai sophias aiteitō para tou didontos theou pasin haplōs kai mē oneidizontos kai dothēsetai autō',
   '''Lack'' (leipetai — falls short of, is deficient in; verbal link to ''wanting nothing'' in v.4). ''Wisdom'' (sophias — practical wisdom, the skill to navigate life''s trials rightly; not abstract knowledge but applied understanding). ''Ask'' (aiteitō — present imperative: keep asking, make it a habit). ''Liberally'' (haplōs — simply, generously, without reservation, with single-minded generosity). ''Upbraideth not'' (mē oneidizontos — does not reproach, does not scold, does not throw the request back in your face). God gives without making the asker feel small. ''It shall be given'' (dothēsetai — future passive: it will be given by God; the divine passive guarantees the gift).',
   'God''s generous giving: This verse reveals the character of God as a giver. He gives (1) to all — no one is excluded, (2) liberally — without stint or calculation, (3) without upbraiding — no shame attached. The promise is unconditional on God''s side; the only condition is on ours: ask in faith (v.6). Wisdom is available to every believer who asks.'),
  (6,
   'But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed.',
   'αἰτείτω δὲ ἐν πίστει μηδὲν διακρινόμενος ὁ γὰρ διακρινόμενος ἔοικεν κλύδωνι θαλάσσης ἀνεμιζομένῳ καὶ ῥιπιζομένῳ',
   'aiteitō de en pistei mēden diakrinomenos ho gar diakrinomenos eoiken klydōni thalassēs anemizomenō kai rhipizomenō',
   '''In faith'' (en pistei — in the sphere of trust, with confident reliance on God). ''Nothing wavering'' (mēden diakrinomenos — not doubting, not being divided in mind; diakrinō means to judge between, to be in two minds, to hesitate between belief and unbelief). ''Wave of the sea'' (klydōni thalassēs — a surge, a billow, the heaving swell of the ocean). ''Driven with the wind'' (anemizomenō — blown about by the wind). ''Tossed'' (rhipizomenō — tossed back and forth, fanned like a flame). The doubter is utterly at the mercy of circumstances — no stability, no direction, no anchor.',
   NULL),
  (7,
   'For let not that man think that he shall receive any thing of the Lord.',
   'μὴ γὰρ οἰέσθω ὁ ἄνθρωπος ἐκεῖνος ὅτι λήψεταί τι παρὰ τοῦ κυρίου',
   'mē gar oiesthō ho anthrōpos ekeinos hoti lēmpsetai ti para tou kyriou',
   '''Let not think'' (mē oiesthō — let him not suppose, let him not imagine). ''That man'' (ho anthrōpos ekeinos — that person, that individual; the demonstrative ekeinos distances him: ''that kind of person''). The double-minded asker has disqualified himself, not by the size of his request but by the quality of his faith. God gives liberally, but faith is the hand that receives.',
   NULL),
  (8,
   'A double minded man is unstable in all his ways.',
   'ἀνὴρ δίψυχος ἀκατάστατος ἐν πάσαις ταῖς ὁδοῖς αὐτοῦ',
   'anēr dipsychos akatastatos en pasais tais hodois autou',
   '''Double minded'' (dipsychos — double-souled, two-spirited; a word possibly coined by James, found only here and in 4:8 in the NT; from dis, twice + psychē, soul). This person has two souls: one believing, one doubting; one reaching toward God, one pulling back. ''Unstable'' (akatastatos — unsettled, unsteady, restless; from a-kathistēmi, not set in order). ''In all his ways'' (en pasais tais hodois — in every path, in every area of life). The instability is not confined to prayer; the divided heart affects everything.',
   NULL),
  (9,
   'Let the brother of low degree rejoice in that he is exalted:',
   'Καυχάσθω δὲ ὁ ἀδελφὸς ὁ ταπεινὸς ἐν τῷ ὕψει αὐτοῦ',
   'Kauchasthō de ho adelphos ho tapeinos en tō hypsei autou',
   '''Rejoice'' (kauchasthō — boast, glory, exult). ''Of low degree'' (ho tapeinos — the lowly one, the humble, the poor). ''Exalted'' (en tō hypsei autou — in his exaltation, in his high position). The poor believer should boast in his spiritual exaltation: in Christ he is a king, an heir, a child of God. His poverty in the world is irrelevant to his standing before God. James begins his social ethic: the gospel reverses worldly values.',
   NULL),
  (10,
   'But the rich, in that he is made low: because as the flower of the grass he shall pass away.',
   'ὁ δὲ πλούσιος ἐν τῇ ταπεινώσει αὐτοῦ ὅτι ὡς ἄνθος χόρτου παρελεύσεται',
   'ho de plousios en tē tapeinōsei autou hoti hōs anthos chortou pareleusetai',
   '''The rich'' (ho plousios — the wealthy one). ''Made low'' (en tē tapeinōsei — in his humiliation). The rich believer should boast in his humbling — the gospel strips away all pretence of self-sufficiency. ''Flower of the grass'' (anthos chortou — a wildflower growing in grass). The image drawn from Isaiah 40:6-8: grass withers, flowers fall, but the word of the Lord endures forever. Wealth is as fragile as a wildflower in a hot wind.',
   NULL),
  (11,
   'For the sun is no sooner risen with a burning heat, but it withereth the grass, and the flower thereof falleth, and the grace of the fashion of it perisheth: so also shall the rich man fade away in his ways.',
   'ἀνέτειλεν γὰρ ὁ ἥλιος σὺν τῷ καύσωνι καὶ ἐξήρανεν τὸν χόρτον καὶ τὸ ἄνθος αὐτοῦ ἐξέπεσεν καὶ ἡ εὐπρέπεια τοῦ προσώπου αὐτοῦ ἀπώλετο οὕτως καὶ ὁ πλούσιος ἐν ταῖς πορείαις αὐτοῦ μαρανθήσεται',
   'aneteilen gar ho hēlios syn tō kausōni kai exēranen ton chorton kai to anthos autou exepesen kai hē euprepeia tou prosōpou autou apōleto houtōs kai ho plousios en tais poreiais autou maranthēsetai',
   '''Burning heat'' (kausōni — the scorching east wind, the sirocco that blasts vegetation in Palestine). ''Grace of the fashion'' (euprepeia tou prosōpou — the beauty of its appearance, its lovely face). ''Perisheth'' (apōleto — perished, was destroyed; aorist: it''s over in an instant). ''Fade away'' (maranthēsetai — will wither, will dry up; our word "marathon" is unrelated, but "amaranth," the unfading flower, comes from the negative of this root). The rich man does not merely lose his wealth; he himself withers ''in his ways'' (en tais poreiais — in his pursuits, his business ventures, his comings and goings).',
   NULL),
  (12,
   'Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which the Lord hath promised to them that love him.',
   'μακάριος ἀνὴρ ὃς ὑπομένει πειρασμόν ὅτι δόκιμος γενόμενος λήψεται τὸν στέφανον τῆς ζωῆς ὃν ἐπηγγείλατο ὁ κύριος τοῖς ἀγαπῶσιν αὐτόν',
   'makarios anēr hos hypomenei peirasmon hoti dokimos genomenos lēmpsetai ton stephanon tēs zōēs hon epēngeilato ho kyrios tois agapōsin auton',
   '''Blessed'' (makarios — happy, fortunate, to be envied; the same word used in the Beatitudes). ''Endureth'' (hypomenei — perseveres under, remains steadfast; same root as hypomonē in v.3). ''When he is tried'' (dokimos genomenos — having become approved, having passed the test; dokimos is the opposite of adokimos, rejected). ''Crown of life'' (ton stephanon tēs zōēs — the victor''s wreath of life; stephanos is the garland given to athletic victors, not the royal crown/diadēma). ''Promised'' (epēngeilato — pledged, guaranteed by promise). The crown is for ''them that love him'' — love for God is the mark of genuine faith that endures.',
   'The crown of life: This is one of five crowns mentioned in the NT (cf. 1 Cor 9:25; 1 Thess 2:19; 2 Tim 4:8; 1 Pet 5:4). The crown of life is promised to those who endure trials — it is life in its fullest, richest, most complete form, the reward of proven faithfulness. It is given to those who love God, showing that endurance is rooted in love, not mere willpower.'),
  (13,
   'Let no man say when he is tempted, I am tempted of God: for God cannot be tempted with evil, neither tempteth he any man:',
   'μηδεὶς πειραζόμενος λεγέτω ὅτι ἀπὸ θεοῦ πειράζομαι ὁ γὰρ θεὸς ἀπείραστός ἐστιν κακῶν πειράζει δὲ αὐτὸς οὐδένα',
   'mēdeis peirazomenos legetō hoti apo theou peirazomai ho gar theos apeirastos estin kakōn peirazei de autos oudena',
   'James now shifts from trials (external testing, vv.2-12) to temptation (internal moral solicitation, vv.13-15). The same Greek word (peirasmos/peirazō) covers both, but the context determines the sense. ''God cannot be tempted with evil'' (apeirastos estin kakōn — untemptable by evil; God is beyond the reach of evil''s attraction). ''Neither tempteth he any man'' — God tests faith (as with Abraham, Gen 22) but never solicits to sin. The distinction is crucial: testing aims to prove and strengthen; temptation aims to seduce and destroy.',
   'God and temptation: James makes an absolute theological statement: God is not the author of temptation to sin. He may permit trials that test faith, but He never entices to evil. To blame God for our temptation is to slander His holy character. The source of temptation is within us (v.14), not in God.'),
  (14,
   'But every man is tempted, when he is drawn away of his own lust, and enticed.',
   'ἕκαστος δὲ πειράζεται ὑπὸ τῆς ἰδίας ἐπιθυμίας ἐξελκόμενος καὶ δελεαζόμενος',
   'hekastos de peirazetai hypo tēs idias epithymias exelkomenos kai deleazomenos',
   '''Every man'' (hekastos — each one, every individual without exception). ''His own lust'' (tēs idias epithymias — his own desire, his personal craving; idias emphasises it is his own, not God''s doing). ''Drawn away'' (exelkomenos — dragged out, pulled away; a hunting or fishing metaphor: the animal is lured out of its safe hiding place). ''Enticed'' (deleazomenos — baited, lured with bait; from delear, bait; a fishing metaphor: the fish sees the bait, not the hook). The sequence: desire lurks within → it lures us out of safety → it baits us with false promise → we bite.',
   NULL),
  (15,
   'Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.',
   'εἶτα ἡ ἐπιθυμία συλλαβοῦσα τίκτει ἁμαρτίαν ἡ δὲ ἁμαρτία ἀποτελεσθεῖσα ἀποκύει θάνατον',
   'eita hē epithymia syllabousa tiktei hamartian hē de hamartia apotelestheisa apokyei thanaton',
   'James switches to a birth metaphor — a grim parody of conception and birth. ''Conceived'' (syllabousa — having conceived, having become pregnant; from syllambanō, to take together, to conceive). ''Bringeth forth'' (tiktei — gives birth to, bears). ''Finished'' (apotelestheisa — fully grown, brought to completion, fully developed). ''Bringeth forth death'' (apokyei thanaton — gives birth to death; apokyeō is a stronger word for childbirth). The terrible genealogy: Lust → conceives → gives birth to Sin → Sin matures → gives birth to Death. Sin is not sudden; it has a gestation period that can be interrupted by repentance.',
   'The progression of sin: James traces sin''s genealogy from desire to death. Temptation begins with internal desire (not external circumstances), desire conceives when we consent to it, sin is born from that union, and fully-grown sin produces death. This teaches that sin is never static — it always progresses, and its final end is always death (cf. Rom 6:23).'),
  (16,
   'Do not err, my beloved brethren.',
   'μὴ πλανᾶσθε ἀδελφοί μου ἀγαπητοί',
   'mē planasthe adelphoi mou agapētoi',
   '''Do not err'' (mē planasthe — stop being deceived, do not wander astray; from planaō, to lead astray; our word "planet" — wandering star — comes from this root). ''Beloved brethren'' (adelphoi mou agapētoi — my loved brothers). The warning is tender: do not be deceived about the source of temptation (blaming God) or about the nature of God (v.17). Every error in living starts with an error in theology.',
   NULL),
  (17,
   'Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.',
   'πᾶσα δόσις ἀγαθὴ καὶ πᾶν δώρημα τέλειον ἄνωθέν ἐστιν καταβαῖνον ἀπὸ τοῦ πατρὸς τῶν φώτων παρ᾽ ᾧ οὐκ ἔνι παραλλαγὴ ἢ τροπῆς ἀποσκίασμα',
   'pasa dosis agathē kai pan dōrēma teleion anōthen estin katabainon apo tou patros tōn phōtōn par'' hō ouk eni parallagē ē tropēs aposkiasma',
   '''Good gift'' (dosis agathē — the act of giving that is good). ''Perfect gift'' (dōrēma teleion — the gift itself that is complete, mature). Both the giving and the gift are good. ''From above'' (anōthen — from the top, from heaven; same word used in John 3:3, ''born from above''). ''Father of lights'' (tou patros tōn phōtōn — the Creator of heavenly luminaries: sun, moon, stars). ''No variableness'' (ouk eni parallagē — no variation, no change, no shifting; an astronomical term for the variation in heavenly bodies). ''Shadow of turning'' (tropēs aposkiasma — shadow cast by turning; an eclipse metaphor: heavenly bodies cast shadows as they orbit, but God never shifts, never eclipses, never darkens). God is pure, unchanging light.',
   'The immutability of God: God is the Father of lights — the source of all illumination, physical and spiritual. Unlike the sun and moon which shift, wax, wane, and cast shadows, God has no variation or shadow. He is immutable in His character: always good, always giving, always light. This is the theological foundation for trusting Him in trials: He does not change.'),
  (18,
   'Of his own will begat he us with the word of truth, that we should be a kind of firstfruits of his creatures.',
   'βουληθεὶς ἀπεκύησεν ἡμᾶς λόγῳ ἀληθείας εἰς τὸ εἶναι ἡμᾶς ἀπαρχήν τινα τῶν αὐτοῦ κτισμάτων',
   'boulētheis apekyēsen hēmas logō alētheias eis to einai hēmas aparchēn tina tōn autou ktismatōn',
   '''Of his own will'' (boulētheis — having willed, having purposed, by deliberate choice). ''Begat'' (apekyēsen — brought forth, gave birth to; the same word used of sin giving birth to death in v.15, but here God gives birth to life — a deliberate contrast). ''Word of truth'' (logō alētheias — the gospel message, the word that is true). ''Firstfruits'' (aparchēn — the first portion of the harvest, consecrated to God, the pledge of the full harvest to come). ''Creatures'' (ktismatōn — created things). Believers are God''s new creation, the first portion of a renewed cosmos.',
   'Regeneration by the word: God''s act of giving new birth is sovereign (''of his own will''), accomplished through the instrument of the gospel (''word of truth''), and produces a new creation (''firstfruits''). The contrast with v.15 is stunning: lust conceives and gives birth to death, but God wills and gives birth to life. Regeneration is God''s initiative, God''s instrument, God''s purpose.'),
  (19,
   'Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:',
   'Ὥστε ἀδελφοί μου ἀγαπητοί ἔστω πᾶς ἄνθρωπος ταχὺς εἰς τὸ ἀκοῦσαι βραδὺς εἰς τὸ λαλῆσαι βραδὺς εἰς ὀργήν',
   'Hōste adelphoi mou agapētoi estō pas anthrōpos tachys eis to akousai bradys eis to lalēsai bradys eis orgēn',
   '''Wherefore'' (hōste — therefore, on this account; connecting to the gift of new birth). Since God has given us new life through the word of truth, the natural response is to listen to that word. ''Swift to hear'' (tachys eis to akousai — quick to listen). ''Slow to speak'' (bradys eis to lalēsai — slow in speaking). ''Slow to wrath'' (bradys eis orgēn — slow toward anger). Three imperatives in descending speed: fast to listen, slow to talk, slowest to anger. The order is deliberate: listening comes first, and listening well prevents both hasty speech and unnecessary anger.',
   NULL),
  (20,
   'For the wrath of man worketh not the righteousness of God.',
   'ὀργὴ γὰρ ἀνδρὸς δικαιοσύνην θεοῦ οὐκ ἐργάζεται',
   'orgē gar andros dikaiosynēn theou ouk ergazetai',
   '''Wrath of man'' (orgē andros — human anger, man''s wrath). ''Worketh not'' (ouk ergazetai — does not produce, does not accomplish). ''Righteousness of God'' (dikaiosynēn theou — the righteousness that God requires, the righteous life God desires). Human anger never achieves God''s purposes. This does not condemn righteous indignation but warns that our anger — even when it feels justified — is contaminated by sin and does not produce the behaviour God requires.',
   NULL),
  (21,
   'Wherefore lay apart all filthiness and superfluity of naughtiness, and receive with meekness the engrafted word, which is able to save your souls.',
   'διὸ ἀποθέμενοι πᾶσαν ῥυπαρίαν καὶ περισσείαν κακίας ἐν πραΰτητι δέξασθε τὸν ἔμφυτον λόγον τὸν δυνάμενον σῶσαι τὰς ψυχὰς ὑμῶν',
   'dio apothemenoi pasan rhyparian kai perisseian kakias en prautēti dexasthe ton emphyton logon ton dynamenon sōsai tas psychas hymōn',
   '''Lay apart'' (apothemenoi — having put off, stripped off; the image of removing soiled clothing). ''Filthiness'' (rhyparian — moral filth, spiritual dirt; used only here in NT). ''Superfluity of naughtiness'' (perisseian kakias — overflowing wickedness, the excess of evil; like wax in the ear that prevents hearing). ''Meekness'' (prautēti — gentleness, humility, teachability; the opposite of arrogant resistance). ''Engrafted word'' (emphyton logon — the implanted word, the word planted within; from en + phyō, to grow in). ''Able to save your souls'' (ton dynamenon sōsai — having power to save). The word is already planted (at regeneration, v.18); now receive it with an open, humble heart.',
   NULL),
  (22,
   'But be ye doers of the word, and not hearers only, deceiving your own selves.',
   'γίνεσθε δὲ ποιηταὶ λόγου καὶ μὴ μόνον ἀκροαταὶ παραλογιζόμενοι ἑαυτούς',
   'ginesthe de poiētai logou kai mē monon akroatai paralogizomenoi heautous',
   '''Doers'' (poiētai — makers, performers, practitioners; from poieō, to make or do; our word "poet" comes from this). ''Hearers'' (akroatai — listeners, auditors; one who sits in the lecture hall but never applies the lesson). ''Deceiving your own selves'' (paralogizomenoi heautous — reasoning falsely, miscalculating; from para + logizomai, to reason alongside the truth but miss it). The self-deception: thinking that hearing equals doing, that knowledge equals obedience, that orthodoxy equals orthopraxy. James''s theme: faith without works is dead (2:17).',
   'Faith and works: This verse introduces James''s central thesis that will be fully developed in chapter 2. Hearing the word without doing it is self-deception. True faith always produces obedience. James does not contradict Paul (who teaches justification by faith) but complements him: the faith that justifies is the faith that works.'),
  (23,
   'For if any be a hearer of the word, and not a doer, he is like unto a man beholding his natural face in a glass:',
   'ὅτι εἴ τις ἀκροατὴς λόγου ἐστὶν καὶ οὐ ποιητής οὗτος ἔοικεν ἀνδρὶ κατανοοῦντι τὸ πρόσωπον τῆς γενέσεως αὐτοῦ ἐν ἐσόπτρῳ',
   'hoti ei tis akroatēs logou estin kai ou poiētēs houtos eoiken andri katanoounti to prosōpon tēs geneseōs autou en esoptrō',
   '''Beholding'' (katanoounti — observing carefully, studying; not a casual glance but attentive looking). ''Natural face'' (to prosōpon tēs geneseōs — literally, the face of his birth, his natural-born face). ''Glass'' (esoptrō — mirror; ancient mirrors were polished bronze or silver, giving a true but not perfect reflection). The mirror reveals what we are; the word of God does the same. The issue is not the quality of the mirror but what we do after looking.',
   NULL),
  (24,
   'For he beholdeth himself, and goeth his way, and straightway forgetteth what manner of man he was.',
   'κατενόησεν γὰρ ἑαυτὸν καὶ ἀπελήλυθεν καὶ εὐθέως ἐπελάθετο ὁποῖος ἦν',
   'katenoēsen gar heauton kai apelēlythen kai eutheōs epelatheto hopoios ēn',
   '''Beholdeth'' (katenoēsen — he observed carefully; aorist: a single act of looking). ''Goeth his way'' (apelēlythen — he has gone away; perfect tense: he is gone and stays gone). ''Straightway forgetteth'' (eutheōs epelatheto — immediately forgot). The absurdity: he looks carefully enough to see clearly, then walks away and instantly forgets what he saw. This is the hearer who is moved in the moment — stirred by the sermon, convicted by the reading — but never acts, and the impression evaporates.',
   NULL),
  (25,
   'But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed.',
   'ὁ δὲ παρακύψας εἰς νόμον τέλειον τὸν τῆς ἐλευθερίας καὶ παραμείνας οὐκ ἀκροατὴς ἐπιλησμονῆς γενόμενος ἀλλὰ ποιητὴς ἔργου οὗτος μακάριος ἐν τῇ ποιήσει αὐτοῦ ἔσται',
   'ho de parakýpsas eis nomon teleion ton tēs eleutherias kai parameinas ouk akroatēs epilēsmonēs genomenos alla poiētēs ergou houtos makarios en tē poiēsei autou estai',
   '''Looketh into'' (parakýpsas — stooped down to look into, peered intently; the word used of Peter and John peering into the empty tomb, John 20:5,11). ''Perfect law of liberty'' (nomon teleion ton tēs eleutherias — the complete law, the one that belongs to freedom; not the Mosaic law of bondage but the gospel law that liberates). ''Continueth therein'' (parameinas — remained beside, stayed alongside; not a glance but sustained attention). ''Blessed in his deed'' (makarios en tē poiēsei — blessed in his doing, happy in his practice). The contrast with vv.23-24: one glances and forgets; the other peers intently and stays — and that one is blessed.',
   NULL),
  (26,
   'If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain.',
   'εἴ τις δοκεῖ θρῆσκος εἶναι ἐν ὑμῖν μὴ χαλιναγωγῶν γλῶσσαν αὐτοῦ ἀλλ᾽ ἀπατῶν καρδίαν αὐτοῦ τούτου μάταιος ἡ θρησκεία',
   'ei tis dokei thrēskos einai en hymin mē chalinagōgōn glōssan autou all'' apatōn kardian autou toutou mataios hē thrēskeia',
   '''Seem to be religious'' (dokei thrēskos einai — thinks himself to be religious, considers himself devout; thrēskos refers to external religious observance, ritual devotion). ''Bridleth'' (chalinagōgōn — leads with a bridle, controls as one controls a horse; from chalinos, a bridle + agō, to lead). ''Tongue'' (glōssan — the tongue, speech). ''Deceiveth his own heart'' (apatōn kardian autou — deceiving his heart, misleading himself). ''Vain'' (mataios — empty, worthless, futile). All the religious observance in the world is worthless if the tongue is uncontrolled. This anticipates the extended treatment of the tongue in chapter 3.',
   NULL),
  (27,
   'Pure religion and undefiled before God and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.',
   'θρησκεία καθαρὰ καὶ ἀμίαντος παρὰ τῷ θεῷ καὶ πατρὶ αὕτη ἐστίν ἐπισκέπτεσθαι ὀρφανοὺς καὶ χήρας ἐν τῇ θλίψει αὐτῶν ἄσπιλον ἑαυτὸν τηρεῖν ἀπὸ τοῦ κόσμου',
   'thrēskeia kathara kai amiantos para tō theō kai patri hautē estin episkeptesthai orphanous kai chēras en tē thlipsei autōn aspilon heauton tērein apo tou kosmou',
   '''Pure'' (kathara — clean, uncontaminated). ''Undefiled'' (amiantos — unstained, unpolluted). ''Before God and the Father'' (para tō theō kai patri — in the sight of God the Father; the standard is God''s, not man''s). ''Visit'' (episkeptesthai — to look upon with care, to attend to, to look after; more than a social call — it means active care for their needs). ''Fatherless and widows'' (orphanous kai chēras — orphans and widows; the most vulnerable members of ancient society). ''Affliction'' (thlipsei — tribulation, distress, pressure). ''Unspotted'' (aspilon — without spot, without stain). ''The world'' (tou kosmou — the world-system opposed to God). True religion has two dimensions: active compassion toward the helpless and personal holiness amid a corrupt world.',
   'Pure religion defined: James''s definition of true religion is remarkable for what it includes and what it omits. It says nothing about ritual, ceremony, or theological system. It focuses on two things: (1) practical care for the most vulnerable — orphans and widows, those with no protector — and (2) personal moral purity. Religion that impresses God is not performed in temples but in homes and hearts.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'James' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 2 (Count it all joy)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χαράν', 'charan', 'G5479', 'Joy, gladness, delight — not a feeling produced by circumstances but a settled conviction of faith. The noun form of chairō (to rejoice). James calls for joy not as emotion but as deliberate evaluation.', 1),
  ('πειρασμοῖς', 'peirasmois', 'G3986', 'Trials, testings, temptations — from peirazō, to test or try. The word covers both external trials that test faith and internal temptations that solicit to sin. Context determines the meaning; here external trials are in view.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 2;

-- Verse 3 (Trying of faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δοκίμιον', 'dokimion', 'G1383', 'Testing, proving, the means of trial — the crucible or touchstone that tests metal. The testing process that reveals whether faith is genuine. Cf. 1 Pet 1:7 where the same word is used of faith tried by fire.', 1),
  ('ὑπομονήν', 'hypomonēn', 'G5281', 'Patience, endurance, steadfast perseverance — from hypo (under) + menō (to remain). Not passive waiting but active remaining under pressure. The quality that enables believers to stand firm without collapsing.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 5 (Ask of God / liberally)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σοφίας', 'sophias', 'G4678', 'Wisdom — practical, applied skill for living; the ability to navigate trials rightly and make godly decisions. Not mere knowledge (gnōsis) but insight that translates into action. In the OT, wisdom begins with the fear of the Lord (Prov 9:10).', 1),
  ('ἁπλῶς', 'haplōs', 'G574', 'Liberally, generously, with single-minded simplicity — from haplous (single, simple). God gives with unmixed generosity, no strings attached, no grudging spirit.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 8 (Double minded)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δίψυχος', 'dipsychos', 'G1374', 'Double-minded, double-souled — from dis (twice) + psychē (soul). A person with divided loyalties, vacillating between faith and doubt. Possibly coined by James; found in NT only here and James 4:8.', 1),
  ('ἀκατάστατος', 'akatastatos', 'G182', 'Unstable, restless, unsettled — from a (not) + kathistēmi (to set in order). Unable to be fixed or settled. In 3:8 the same word describes the tongue as an "unruly" evil.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 17 (Father of lights)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παραλλαγή', 'parallagē', 'G3883', 'Variation, change, shifting — an astronomical term for the apparent change in position of heavenly bodies. God has no such variation; He is constant, immutable, unchanging in His goodness.', 1),
  ('ἀποσκίασμα', 'aposkiasma', 'G644', 'Shadow, overshadowing — the shadow cast by the turning of a heavenly body (like an eclipse). God casts no shadow because He never turns; He is pure, uneclipsed light.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 17;

-- Verse 22 (Doers of the word)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποιηταί', 'poiētai', 'G4163', 'Doers, makers, practitioners — from poieō (to make, to do). One who puts the word into practice, not merely hears it. The English word "poet" derives from the same root: one who makes something.', 1),
  ('παραλογιζόμενοι', 'paralogizomenoi', 'G3884', 'Deceiving, reasoning falsely, miscalculating — from para (beside) + logizomai (to reckon). To reason alongside the truth and arrive at the wrong conclusion. Self-deception through faulty logic.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 22;

-- Verse 27 (Pure religion)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θρησκεία', 'thrēskeia', 'G2356', 'Religion, religious worship, external religious practice — the outward expression of belief in ritual and conduct. James redefines it: true religious practice is not ceremony but compassion and purity.', 1),
  ('ἐπισκέπτεσθαι', 'episkeptesthai', 'G1980', 'To visit, to look upon, to care for — more than a social call; it means to attend to the needs of someone, to exercise oversight and care. God "visits" His people (Luke 1:68); we are to visit the helpless.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = 27;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Count it all joy in trials
  (2, 'Romans 5:3-5', 1), (2, '1 Peter 1:6-7', 2), (2, 'Matthew 5:11-12', 3),
  -- v3: Trying of faith worketh patience
  (3, '1 Peter 1:7', 1), (3, 'Romans 5:3', 2), (3, 'Hebrews 12:11', 3),
  -- v5: Ask of God for wisdom
  (5, 'Proverbs 2:3-6', 1), (5, 'Matthew 7:7-8', 2), (5, '1 Kings 3:9-12', 3),
  -- v6: Ask in faith nothing wavering
  (6, 'Mark 11:24', 1), (6, 'Hebrews 11:6', 2), (6, 'Matthew 21:21', 3),
  -- v12: Crown of life
  (12, 'Revelation 2:10', 1), (12, '2 Timothy 4:8', 2), (12, '1 Peter 5:4', 3),
  -- v13: God tempteth no man
  (13, 'Genesis 22:1', 1), (13, '1 Corinthians 10:13', 2), (13, 'Habakkuk 1:13', 3),
  -- v15: Lust brings forth sin and death
  (15, 'Romans 6:23', 1), (15, 'Genesis 3:6', 2), (15, 'Romans 7:8-11', 3),
  -- v17: Father of lights
  (17, '1 John 1:5', 1), (17, 'Malachi 3:6', 2), (17, 'Hebrews 13:8', 3),
  -- v18: Begat us with the word of truth
  (18, '1 Peter 1:23', 1), (18, 'John 1:13', 2), (18, 'Ephesians 1:13', 3),
  -- v19: Swift to hear slow to speak
  (19, 'Proverbs 10:19', 1), (19, 'Ecclesiastes 5:1-2', 2), (19, 'Proverbs 17:27', 3),
  -- v22: Be doers of the word
  (22, 'Matthew 7:24-27', 1), (22, 'Luke 11:28', 2), (22, 'Romans 2:13', 3),
  -- v25: Perfect law of liberty
  (25, 'John 8:32', 1), (25, 'Galatians 5:1', 2), (25, 'Psalm 19:7', 3),
  -- v27: Pure religion
  (27, 'Isaiah 1:17', 1), (27, 'Matthew 25:35-40', 2), (27, '1 John 3:17-18', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'James' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- James Chapter 1 Complete
-- 27 verses · 7 key verses with word studies (14 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════