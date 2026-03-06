-- ═══════════════════════════════════════════════════
-- JAMES CHAPTER 3 — The Tongue and True Wisdom
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'James 3 divides into two distinct but related sections. The first (vv.1-12) is the Bible''s most extensive treatment of the power and danger of the tongue. James warns against the desire to be teachers, since teachers face stricter judgment (v.1). He then uses a series of vivid metaphors to describe the tongue: a bit controlling a horse (v.3), a small rudder steering a great ship (v.4), a tiny spark setting an entire forest ablaze (v.5). The tongue is ''a fire, a world of iniquity'' (v.6), untameable by any man (v.8), a restless evil full of deadly poison. The deepest problem: the same tongue blesses God and curses men made in God''s image (vv.9-10). The second section (vv.13-18) contrasts two kinds of wisdom: earthly wisdom that is ''sensual, devilish'' and produces ''envying and strife'' (vv.14-16), versus wisdom from above that is ''first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits'' (v.17). The fruit of righteousness is sown in peace by those who make peace (v.18).',
  'The Deadly Tongue and Heavenly Wisdom',
  'γλῶσσα (glōssa)',
  'Tongue, language — the small organ with enormous power. James portrays the tongue as disproportionately powerful for its size: like a bit, a rudder, and a spark, it controls and can destroy what is far larger than itself.',
  '["Teachers Face Greater Judgment (v.1): Be not many masters knowing that we shall receive the greater condemnation","Universal Stumbling (v.2): In many things we offend all; if any man offend not in word the same is a perfect man able to bridle the whole body","The Bit and the Rudder (vv.3-4): We put bits in horses'' mouths that they may obey us and we turn about their whole body; behold also the ships which though they be so great are turned about with a very small helm","The Spark that Sets the Forest Ablaze (vv.5-6): The tongue is a little member and boasteth great things; behold how great a matter a little fire kindleth; the tongue is a fire a world of iniquity; it defileth the whole body and setteth on fire the course of nature and it is set on fire of hell","No Man Can Tame the Tongue (vv.7-8): Every kind of beasts and of serpents and of things in the sea is tamed of mankind; but the tongue can no man tame; it is an unruly evil full of deadly poison","Blessing and Cursing from the Same Mouth (vv.9-12): Therewith bless we God and therewith curse we men which are made after the similitude of God; out of the same mouth proceedeth blessing and cursing; my brethren these things ought not so to be; doth a fountain send forth at the same place sweet water and bitter; can the fig tree bear olive berries","Earthly Wisdom (vv.13-16): Who is wise and endued with knowledge among you; let him shew out of a good conversation his works with meekness of wisdom; if ye have bitter envying and strife in your hearts glory not; this wisdom descendeth not from above but is earthly sensual devilish; for where envying and strife is there is confusion and every evil work","Wisdom from Above (vv.17-18): The wisdom that is from above is first pure then peaceable gentle easy to be intreated full of mercy and good fruits without partiality and without hypocrisy; the fruit of righteousness is sown in peace of them that make peace"]'
FROM books b WHERE b.name = 'James';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'My brethren, be not many masters, knowing that we shall receive the greater condemnation.',
   'Μὴ πολλοὶ διδάσκαλοι γίνεσθε ἀδελφοί μου εἰδότες ὅτι μεῖζον κρίμα λημψόμεθα',
   'Mē polloi didaskaloi ginesthe adelphoi mou eidotes hoti meizon krima lēmpsometha',
   '''Masters'' (didaskaloi — teachers; the primary meaning is teachers, not rulers). ''Be not many'' (mē polloi ginesthe — do not become many of you, do not rush to become). In Jewish culture, the title ''teacher'' (rabbi) carried great prestige, and many coveted it. ''Greater condemnation'' (meizon krima — stricter judgment, heavier verdict). Teachers are judged by a higher standard because they use words constantly and claim to speak for God. Note James includes himself: ''we shall receive'' — he is a teacher too.',
   NULL),
  (2,
   'For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.',
   'πολλὰ γὰρ πταίομεν ἅπαντες εἴ τις ἐν λόγῳ οὐ πταίει οὗτος τέλειος ἀνὴρ δυνατὸς χαλιναγωγῆσαι καὶ ὅλον τὸ σῶμα',
   'polla gar ptaiomen hapantes ei tis en logō ou ptaiei houtos teleios anēr dynatos chalinagōgēsai kai holon to sōma',
   '''We offend all'' (ptaiomen hapantes — we all stumble, every one of us trips). ''Offend not in word'' (en logō ou ptaiei — does not stumble in speech). ''Perfect'' (teleios — mature, complete). ''Bridle the whole body'' (chalinagōgēsai holon to sōma — to control with a bridle the entire body; cf. 1:26). If a man can control his tongue — the most difficult member — he can control everything else. The tongue is the litmus test of spiritual maturity.',
   NULL),
  (3,
   'Behold, we put bits in the horses'' mouths, that they may obey us; and we turn about their whole body.',
   'ἰδοὺ τῶν ἵππων τοὺς χαλινοὺς εἰς τὰ στόματα βάλλομεν πρὸς τὸ πείθεσθαι αὐτοὺς ἡμῖν καὶ ὅλον τὸ σῶμα αὐτῶν μετάγομεν',
   'idou tōn hippōn tous chalinous eis ta stomata ballomen pros to peithesthai autous hēmin kai holon to sōma autōn metagomen',
   '''Bits'' (chalinous — bridle bits, the small metal pieces placed in the horse''s mouth). ''Turn about'' (metagomen — direct, guide, steer). First analogy: a small bit controls a powerful horse. The tongue, similarly small, controls the whole person. The one who masters the bit masters the horse; the one who masters the tongue masters the life.',
   NULL),
  (4,
   'Behold also the ships, which though they be so great, and are driven of fierce winds, yet are they turned about with a very small helm, whithersoever the governor listeth.',
   'ἰδοὺ καὶ τὰ πλοῖα τηλικαῦτα ὄντα καὶ ὑπὸ σκληρῶν ἀνέμων ἐλαυνόμενα μετάγεται ὑπὸ ἐλαχίστου πηδαλίου ὅπου ἂν ἡ ὁρμὴ τοῦ εὐθύνοντος βούληται',
   'idou kai ta ploia tēlikauta onta kai hypo sklērōn anemōn elaunomena metagetai hypo elachistou pēdaliou hopou an hē hormē tou euthynontos boulētai',
   '''Ships so great'' (ploia tēlikauta — vessels of such size). ''Fierce winds'' (sklērōn anemōn — hard, violent winds). ''Very small helm'' (elachistou pēdaliou — the smallest rudder). ''Governor'' (euthynontos — the one who steers, the helmsman). ''Listeth'' (boulētai — wills, purposes, desires). Second analogy: a massive ship in a violent storm is steered by a tiny rudder. The helmsman''s will, expressed through the rudder, directs the whole ship. So the tongue — small but steered by the will — directs the whole life.',
   NULL),
  (5,
   'Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!',
   'οὕτως καὶ ἡ γλῶσσα μικρὸν μέλος ἐστὶν καὶ μεγαλαυχεῖ ἰδοὺ ὀλίγον πῦρ ἡλίκην ὕλην ἀνάπτει',
   'houtōs kai hē glōssa mikron melos estin kai megalaucheí idou oligon pyr hēlikēn hylēn anaptei',
   '''Little member'' (mikron melos — a small body part). ''Boasteth great things'' (megalaucheí — makes great claims, brags enormously; from megas, great + aucheō, to boast). ''How great a matter'' (hēlikēn hylēn — how great a forest, what a vast area of wood). ''A little fire'' (oligon pyr — a small flame, a spark). Third analogy: a single spark can burn down an entire forest. The tongue, small as it is, can destroy relationships, reputations, churches, and nations.',
   NULL),
  (6,
   'And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.',
   'καὶ ἡ γλῶσσα πῦρ ὁ κόσμος τῆς ἀδικίας οὕτως ἡ γλῶσσα καθίσταται ἐν τοῖς μέλεσιν ἡμῶν ἡ σπιλοῦσα ὅλον τὸ σῶμα καὶ φλογίζουσα τὸν τροχὸν τῆς γενέσεως καὶ φλογιζομένη ὑπὸ τῆς γεέννης',
   'kai hē glōssa pyr ho kosmos tēs adikias houtōs hē glōssa kathistatai en tois melesin hēmōn hē spilousa holon to sōma kai phlogizousa ton trochon tēs geneseōs kai phlogizomenē hypo tēs geennēs',
   '''A fire'' (pyr — fire itself). ''A world of iniquity'' (ho kosmos tēs adikias — an entire world of unrighteousness; the tongue contains within it the whole universe of evil). ''Defileth'' (spilousa — stains, spots, pollutes). ''Course of nature'' (ton trochon tēs geneseōs — the wheel of existence, the entire cycle of life from birth to death). ''Set on fire of hell'' (phlogizomenē hypo tēs geennēs — being ignited by Gehenna itself; the tongue''s destructive fire originates in hell). The tongue is the devil''s torch: set ablaze by hell, it sets ablaze the whole course of human existence.',
   'The tongue and hell: James traces the tongue''s destructive power to its ultimate source: hell (geenna). The uncontrolled tongue is not merely a human weakness but a satanic instrument. It defiles the whole body (internal corruption), sets on fire the course of nature (external destruction), and its own fire comes from hell (demonic origin). This is the most fearsome description of the tongue in all of Scripture.'),
  (7,
   'For every kind of beasts, and of birds, and of serpents, and of things in the sea, is tamed, and hath been tamed of mankind:',
   'πᾶσα γὰρ φύσις θηρίων τε καὶ πετεινῶν ἑρπετῶν τε καὶ ἐναλίων δαμάζεται καὶ δεδάμασται τῇ φύσει τῇ ἀνθρωπίνῃ',
   'pasa gar physis thēriōn te kai peteinōn herpetōn te kai enaliōn damazetai kai dedamastai tē physei tē anthrōpinē',
   '''Every kind'' (pasa physis — every species, every nature). Four categories from Gen 1:26 — beasts (thēriōn), birds (peteinōn), serpents/reptiles (herpetōn), sea creatures (enaliōn). ''Is tamed and hath been tamed'' (damazetai kai dedamastai — present: is being tamed; perfect: has been tamed and remains so). Mankind has exercised dominion over all creation — lions in circuses, eagles on falconers'' wrists, snakes charmed, dolphins trained.',
   NULL),
  (8,
   'But the tongue can no man tame; it is an unruly evil, full of deadly poison.',
   'τὴν δὲ γλῶσσαν οὐδεὶς δύναται ἀνθρώπων δαμάσαι ἀκατάσχετον κακόν μεστὴ ἰοῦ θανατηφόρου',
   'tēn de glōssan oudeis dynatai anthrōpōn damasai akataschetonkakon mestē iou thanatēphorou',
   '''No man can tame'' (oudeis dynatai anthrōpōn damasai — no one among men is able to tame). ''Unruly'' (akataschetonkakon — restless evil, uncontrollable wickedness; some manuscripts read akatastaton, unstable, as in 1:8). ''Deadly poison'' (iou thanatēphorou — death-bearing venom; from ios, poison/venom + thanatos, death + pherō, to carry). Man can tame tigers but not his tongue. Only God can tame it — and this is James''s implied point: we need supernatural help for supernatural evil.',
   NULL),
  (9,
   'Therewith bless we God, even the Father; and therewith curse we men, which are made after the similitude of God.',
   'ἐν αὐτῇ εὐλογοῦμεν τὸν θεὸν καὶ πατέρα καὶ ἐν αὐτῇ καταρώμεθα τοὺς ἀνθρώπους τοὺς καθ᾽ ὁμοίωσιν θεοῦ γεγονότας',
   'en autē eulogoumen ton theon kai patera kai en autē katarōmetha tous anthrōpous tous kath'' homoiōsin theou gegonotas',
   '''Bless'' (eulogoumen — we speak well of, we praise). ''Curse'' (katarōmetha — we speak evil against, we call down destruction upon). ''Similitude of God'' (homoiōsin theou — the likeness of God, the image of God; cf. Gen 1:26). The deepest inconsistency: we use the same tongue to praise God and to curse people made in God''s image. To curse a person made in God''s likeness is to insult the Creator whose image they bear. The tongue that praises God on Sunday and destroys people on Monday is a lie.',
   'The image of God in man: James grounds the prohibition of cursing in the doctrine of the imago Dei. Every human being — regardless of race, status, or character — is made in God''s image. To curse a person is to attack God''s image-bearer. This elevates all human speech to a theological issue: how we speak about people reflects what we believe about God.'),
  (10,
   'Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.',
   'ἐκ τοῦ αὐτοῦ στόματος ἐξέρχεται εὐλογία καὶ κατάρα ἀδελφοί μου οὐ χρὴ ταῦτα οὕτως γίνεσθαι',
   'ek tou autou stomatos exerchetai eulogia kai katara adelphoi mou ou chrē tauta houtōs ginesthai',
   '''Out of the same mouth'' (ek tou autou stomatos — from the very same mouth). ''Blessing and cursing'' (eulogia kai katara — praise and damnation). ''Ought not so to be'' (ou chrē tauta houtōs ginesthai — it is not fitting, it is not right for these things to be this way). The simple, devastating verdict: this should not happen. A mouth that praises God should not curse God''s image-bearers. The inconsistency reveals a divided heart.',
   NULL),
  (11,
   'Doth a fountain send forth at the same place sweet water and bitter?',
   'μήτι ἡ πηγὴ ἐκ τῆς αὐτῆς ὀπῆς βρύει τὸ γλυκὺ καὶ τὸ πικρόν',
   'mēti hē pēgē ek tēs autēs opēs bryei to glyky kai to pikron',
   '''Fountain'' (pēgē — spring, source). ''Sweet'' (glyky — fresh, drinkable). ''Bitter'' (pikron — brackish, salty, undrinkable). The expected answer: no. A spring produces one kind of water according to its nature. If the water is sweet, the source is sweet; if bitter, the source is bitter. The tongue reveals the heart: if cursing and blessing both flow from the mouth, something is wrong at the source.',
   NULL),
  (12,
   'Can the fig tree, my brethren, bear olive berries? either a vine, figs? so can no fountain both yield salt water and fresh.',
   'μὴ δύναται ἀδελφοί μου συκῆ ἐλαίας ποιῆσαι ἢ ἄμπελος σῦκα οὕτως οὐδεμία πηγὴ ἁλυκὸν καὶ γλυκὺ ποιῆσαι ὕδωρ',
   'mē dynatai adelphoi mou sykē elaias poiēsai ē ampelos syka houtōs oudemia pēgē halykon kai glyky poiēsai hydōr',
   'Three examples from nature: a fig tree cannot bear olives; a vine cannot produce figs; a spring cannot yield both salt and fresh water. Each produces according to its nature. The implication is clear: if your mouth produces both praise and cursing, something in your nature is wrong. The solution is not tongue-management but heart-transformation (cf. Matt 12:34, ''out of the abundance of the heart the mouth speaketh'').',
   NULL),
  (13,
   'Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.',
   'Τίς σοφὸς καὶ ἐπιστήμων ἐν ὑμῖν δειξάτω ἐκ τῆς καλῆς ἀναστροφῆς τὰ ἔργα αὐτοῦ ἐν πραΰτητι σοφίας',
   'Tis sophos kai epistēmōn en hymin deixatō ek tēs kalēs anastrophēs ta erga autou en prautēti sophias',
   '''Wise'' (sophos — wise, possessing practical wisdom). ''Endued with knowledge'' (epistēmōn — understanding, expert, knowledgeable; used only here in the NT). ''Good conversation'' (kalēs anastrophēs — good conduct, noble manner of life; anastrophē means the whole pattern of one''s behaviour). ''Meekness of wisdom'' (prautēti sophias — the gentleness that comes from wisdom). True wisdom is not loud but gentle; not boastful but shown through conduct. The test of wisdom is not what you say but how you live.',
   NULL),
  (14,
   'But if ye have bitter envying and strife in your hearts, glory not, and lie not against the truth.',
   'εἰ δὲ ζῆλον πικρὸν ἔχετε καὶ ἐριθείαν ἐν τῇ καρδίᾳ ὑμῶν μὴ κατακαυχᾶσθε καὶ ψεύδεσθε κατὰ τῆς ἀληθείας',
   'ei de zēlon pikron echete kai eritheian en tē kardia hymōn mē katakauchasthe kai pseudesthe kata tēs alētheias',
   '''Bitter envying'' (zēlon pikron — bitter jealousy, caustic rivalry; zēlos can be positive zeal or negative jealousy; here modified by ''bitter'' it is clearly sinful). ''Strife'' (eritheian — selfish ambition, faction-forming; originally meant a day-labourer''s self-seeking, then came to mean partisan strife). ''Glory not'' (mē katakauchasthe — do not boast, do not make arrogant claims). ''Lie not against the truth'' (pseudesthe kata tēs alētheias — do not speak falsely against the truth). To claim wisdom while harbouring jealousy and ambition is to lie.',
   NULL),
  (15,
   'This wisdom descendeth not from above, but is earthly, sensual, devilish.',
   'οὐκ ἔστιν αὕτη ἡ σοφία ἄνωθεν κατερχομένη ἀλλ᾽ ἐπίγειος ψυχική δαιμονιώδης',
   'ouk estin hautē hē sophia anōthen katerchomenē all'' epigeios psychikē daimoniōdēs',
   'Three damning adjectives describe false wisdom: (1) ''Earthly'' (epigeios — belonging to the earth, limited to this world, with no heavenly perspective). (2) ''Sensual'' (psychikē — natural, soulish, belonging to the unrenewed human nature; the psychikos man of 1 Cor 2:14 who cannot receive spiritual things). (3) ''Devilish'' (daimoniōdēs — demon-like, characteristic of demons; used only here in the NT). A downward progression: from earth → to fallen human nature → to hell itself. This ''wisdom'' is satanic in its origin.',
   NULL),
  (16,
   'For where envying and strife is, there is confusion and every evil work.',
   'ὅπου γὰρ ζῆλος καὶ ἐριθεία ἐκεῖ ἀκαταστασία καὶ πᾶν φαῦλον πρᾶγμα',
   'hopou gar zēlos kai eritheia ekei akatastasia kai pan phaulon pragma',
   '''Confusion'' (akatastasia — disorder, instability, disturbance; the word used for political upheaval and anarchy). ''Every evil work'' (pan phaulon pragma — every worthless, base, evil deed). Where jealousy and selfish ambition dwell, they produce chaos and every kind of evil. The fruits identify the root: disorder and wickedness come from earthly, sensual, devilish wisdom.',
   NULL),
  (17,
   'But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy.',
   'ἡ δὲ ἄνωθεν σοφία πρῶτον μὲν ἁγνή ἐστιν ἔπειτα εἰρηνική ἐπιεικής εὐπειθής μεστὴ ἐλέους καὶ καρπῶν ἀγαθῶν ἀδιάκριτος ἀνυπόκριτος',
   'hē de anōthen sophia prōton men hagnē estin epeita eirēnikē epieikēs eupeithēs mestē eleous kai karpōn agathōn adiakritos anypokritos',
   'Eight characteristics of heavenly wisdom: (1) ''Pure'' (hagnē — first in order and first in importance; morally clean, free from defilement). (2) ''Peaceable'' (eirēnikē — peace-loving, promoting peace). (3) ''Gentle'' (epieikēs — considerate, yielding, not insisting on the letter of the law). (4) ''Easy to be intreated'' (eupeithēs — open to reason, willing to listen, compliant to good persuasion). (5) ''Full of mercy'' (mestē eleous — overflowing with compassion). (6) ''Good fruits'' (karpōn agathōn — producing visible, practical results). (7) ''Without partiality'' (adiakritos — impartial, unwavering, without favouritism; cf. 2:1). (8) ''Without hypocrisy'' (anypokritos — sincere, unfeigned, genuine). This is the character of Christ Himself.',
   'Heavenly wisdom: James''s portrait of wisdom from above is essentially a portrait of Christ. Purity first — holiness is the foundation. Then the social virtues flow outward: peace, gentleness, reasonableness, mercy, fruitfulness, impartiality, sincerity. This wisdom is the opposite of the demonic wisdom of v.15: where that produces disorder and evil (v.16), this produces righteousness and peace (v.18).'),
  (18,
   'And the fruit of righteousness is sown in peace of them that make peace.',
   'καρπὸς δὲ δικαιοσύνης ἐν εἰρήνῃ σπείρεται τοῖς ποιοῦσιν εἰρήνην',
   'karpos de dikaiosynēs en eirēnē speiretai tois poiousin eirēnēn',
   '''Fruit of righteousness'' (karpos dikaiosynēs — the harvest that consists of righteousness, or the harvest produced by righteousness). ''Sown in peace'' (en eirēnē speiretai — planted in the soil of peace). ''Them that make peace'' (tois poiousin eirēnēn — the peacemakers; cf. Matt 5:9, ''Blessed are the peacemakers''). The agricultural metaphor: if you want a harvest of righteousness, you must sow the seeds in peace. Those who sow contention and strife will never reap righteousness. The peacemakers are the sowers, and the harvest they reap is righteous character and righteous community.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'James' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 1 (Teachers / greater condemnation)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('διδάσκαλοι', 'didaskaloi', 'G1320', 'Teachers, instructors — those who teach others in matters of doctrine and practice. A coveted role in Judaism; James warns that with the privilege comes stricter accountability.', 1),
  ('κρίμα', 'krima', 'G2917', 'Judgment, verdict, condemnation — the judicial sentence pronounced. Teachers face a "greater" (meizon) judgment because their words influence many and their errors multiply.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 3 AND v.verse_number = 1;

-- Verse 6 (Tongue is a fire / set on fire of hell)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γεέννης', 'geennēs', 'G1067', 'Gehenna, hell — from the Hebrew ge-Hinnom (Valley of Hinnom), the valley south of Jerusalem where child sacrifices were offered and where refuse was perpetually burned. Jesus used it as the name for the place of final punishment.', 1),
  ('τροχόν', 'trochon', 'G5164', 'Wheel, course, cycle — from trechō (to run). "The wheel of existence" or "the course of nature" — the entire cycle of human life. The tongue''s fire affects the whole span of life from birth to death.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 3 AND v.verse_number = 6;

-- Verse 8 (No man can tame / deadly poison)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θανατηφόρου', 'thanatēphorou', 'G2287', 'Death-bearing, deadly — from thanatos (death) + pherō (to carry). The tongue carries lethal poison. Used only here in the NT. Words can kill reputations, relationships, and spirits.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 3 AND v.verse_number = 8;

-- Verse 15 (Earthly, sensual, devilish)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ψυχική', 'psychikē', 'G5591', 'Sensual, natural, soulish — belonging to the psychē (soul/natural life) as opposed to the pneuma (spirit). The unregenerate mind operating on natural instinct rather than spiritual illumination. Cf. 1 Cor 2:14.', 1),
  ('δαιμονιώδης', 'daimoniōdēs', 'G1141', 'Devilish, demon-like, demonic — found only here in the NT. Wisdom that is characterized by demons, that has its origin and character in the demonic realm.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 3 AND v.verse_number = 15;

-- Verse 17 (Wisdom from above)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἁγνή', 'hagnē', 'G53', 'Pure, holy, chaste, undefiled — morally clean and free from contamination. Listed first because purity is the foundation of all other virtues. Without purity, the other qualities become corrupted.', 1),
  ('ἐπιεικής', 'epieikēs', 'G1933', 'Gentle, yielding, forbearing — the quality of not insisting on the strict letter of the law but being reasonable and fair. The graciousness that tempers justice with mercy.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 3 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Teachers face greater judgment
  (1, 'Luke 12:48', 1), (1, 'Matthew 12:36-37', 2), (1, 'Hebrews 13:17', 3),
  -- v2: Perfect man bridles the whole body
  (2, 'Proverbs 10:19', 1), (2, 'James 1:26', 2), (2, 'Psalm 141:3', 3),
  -- v6: Tongue is a fire / set on fire of hell
  (6, 'Proverbs 16:27', 1), (6, 'Proverbs 26:20-21', 2), (6, 'Matthew 5:22', 3),
  -- v8: No man can tame the tongue
  (8, 'Psalm 140:3', 1), (8, 'Romans 3:13', 2), (8, 'Psalm 64:3', 3),
  -- v9: Blessing and cursing same mouth
  (9, 'Genesis 1:26-27', 1), (9, 'Romans 12:14', 2), (9, 'Psalm 62:4', 3),
  -- v13: Show works with meekness of wisdom
  (13, 'Galatians 5:22-23', 1), (13, 'Colossians 3:12', 2), (13, 'Matthew 11:29', 3),
  -- v15: Earthly, sensual, devilish
  (15, '1 Corinthians 2:14', 1), (15, 'Jude 1:19', 2), (15, '1 John 4:1', 3),
  -- v17: Wisdom from above
  (17, 'Galatians 5:22-23', 1), (17, 'Philippians 4:8', 2), (17, '1 Corinthians 13:4-7', 3),
  -- v18: Fruit of righteousness sown in peace
  (18, 'Matthew 5:9', 1), (18, 'Hebrews 12:11', 2), (18, 'Proverbs 11:18', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'James' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- James Chapter 3 Complete
-- 18 verses · 6 key verses with word studies (11 words)
-- Cross-references for 8 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════