-- ═══════════════════════════════════════════════════
-- JAMES CHAPTER 4 — Worldliness, Humility, and Dependence on God
-- 17 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'James 4 diagnoses the root cause of conflict among believers and prescribes the cure. Wars and fightings spring from internal lusts that war in the members (vv.1-2). Prayerlessness and wrong motives in prayer compound the problem (vv.2-3). In one of Scripture''s starkest warnings, James declares that friendship with the world is enmity with God — ''whosoever therefore will be a friend of the world is the enemy of God'' (v.4). The Spirit within us ''lusteth to envy'' (or, God yearns jealously for the spirit He has placed in us, v.5). The remedy is humility: ''God resisteth the proud, but giveth grace unto the humble'' (v.6). The ten rapid-fire imperatives of vv.7-10 form the heart of the chapter: submit to God, resist the devil, draw nigh to God, cleanse your hands, purify your hearts, be afflicted, humble yourselves. James then forbids speaking evil against brethren (vv.11-12) — to judge a brother is to judge the law itself. The chapter closes with a rebuke against presumptuous planning that leaves God out: ''ye ought to say, If the Lord will'' (vv.13-17), and the defining statement: ''to him that knoweth to do good, and doeth it not, to him it is sin'' (v.17).',
  'Humility Before God and Dependence on His Will',
  'ταπεινώθητε (tapeinōthēte)',
  'Humble yourselves — aorist passive imperative: let yourselves be humbled, take the low place before God. The antidote to worldliness, pride, and self-reliance is voluntary humiliation before the sovereign Lord.',
  '["Wars and Fightings from Lusts (vv.1-3): From whence come wars and fightings among you; come they not hence even of your lusts that war in your members; ye lust and have not; ye kill and desire to have and cannot obtain; ye fight and war yet ye have not because ye ask not; ye ask and receive not because ye ask amiss that ye may consume it upon your lusts","Friendship with the World Is Enmity with God (vv.4-5): Ye adulterers and adulteresses know ye not that the friendship of the world is enmity with God; whosoever therefore will be a friend of the world is the enemy of God; do ye think that the scripture saith in vain the spirit that dwelleth in us lusteth to envy","Grace to the Humble (v.6): But he giveth more grace; wherefore he saith God resisteth the proud but giveth grace unto the humble","Ten Imperatives of Repentance (vv.7-10): Submit yourselves therefore to God; resist the devil and he will flee from you; draw nigh to God and he will draw nigh to you; cleanse your hands ye sinners and purify your hearts ye double minded; be afflicted and mourn and weep; let your laughter be turned to mourning and your joy to heaviness; humble yourselves in the sight of the Lord and he shall lift you up","Do Not Judge Your Brother (vv.11-12): Speak not evil one of another brethren; he that speaketh evil of his brother and judgeth his brother speaketh evil of the law; there is one lawgiver who is able to save and to destroy; who art thou that judgest another","Do Not Presume on Tomorrow (vv.13-16): Go to now ye that say today or tomorrow we will go into such a city and continue there a year and buy and sell and get gain; whereas ye know not what shall be on the morrow; for what is your life it is even a vapour that appeareth for a little time and then vanisheth away; for that ye ought to say if the Lord will we shall live and do this or that; but now ye rejoice in your boastings; all such rejoicing is evil","Sin of Omission (v.17): Therefore to him that knoweth to do good and doeth it not to him it is sin"]'
FROM books b WHERE b.name = 'James';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'From whence come wars and fightings among you? come they not hence, even of your lusts that war in your members?',
   'Πόθεν πόλεμοι καὶ μάχαι ἐν ὑμῖν οὐκ ἐντεῦθεν ἐκ τῶν ἡδονῶν ὑμῶν τῶν στρατευομένων ἐν τοῖς μέλεσιν ὑμῶν',
   'Pothen polemoi kai machai en hymin ouk enteuthen ek tōn hēdonōn hymōn tōn strateuomenōn en tois melesin hymōn',
   '''Wars'' (polemoi — campaigns, prolonged conflicts). ''Fightings'' (machai — battles, skirmishes, quarrels). ''Among you'' (en hymin — within your community). ''Lusts'' (hēdonōn — pleasures, desires for gratification; from hēdonē, from which we get ''hedonism''). ''War'' (strateuomenōn — wage military campaign, fight as soldiers; from stratos, army). The external conflicts in the church originate in internal conflicts in the heart. Pleasure-seeking desires are soldiers waging war inside us, and their battles spill outward into interpersonal conflict.',
   NULL),
  (2,
   'Ye lust, and have not: ye kill, and desire to have, and cannot obtain: ye fight and war, yet ye have not, because ye ask not.',
   'ἐπιθυμεῖτε καὶ οὐκ ἔχετε φονεύετε καὶ ζηλοῦτε καὶ οὐ δύνασθε ἐπιτυχεῖν μάχεσθε καὶ πολεμεῖτε οὐκ ἔχετε δὲ διὰ τὸ μὴ αἰτεῖσθαι ὑμᾶς',
   'epithymeite kai ouk echete phoneuete kai zēloute kai ou dynasthe epitychein machesthe kai polemeite ouk echete de dia to mē aiteisthai hymas',
   '''Ye lust'' (epithymeite — you desire intensely, you crave). ''Kill'' (phoneuete — you murder; whether literal or figurative as in Matt 5:21-22, the rage that destroys). ''Desire to have'' (zēloute — you are jealous, you burn with envy). A devastating diagnosis: want → frustration → violence → envy → more frustration → more conflict. The vicious cycle of unfulfilled desire. ''Ye have not because ye ask not'' — the root problem: prayerlessness. Instead of asking God, they fight each other.',
   NULL),
  (3,
   'Ye ask, and receive not, because ye ask amiss, that ye may consume it upon your lusts.',
   'αἰτεῖτε καὶ οὐ λαμβάνετε διότι κακῶς αἰτεῖσθε ἵνα ἐν ταῖς ἡδοναῖς ὑμῶν δαπανήσητε',
   'aiteite kai ou lambanete dioti kakōs aiteisthe hina en tais hēdonais hymōn dapanēsēte',
   '''Ask amiss'' (kakōs aiteisthe — you ask wrongly, you ask with evil intent). ''Consume'' (dapanēsēte — spend, squander, waste). ''Lusts'' (hēdonais — pleasures). Even when they do pray, their motive is wrong: they want God to fund their self-indulgence. Prayer is not a mechanism for getting what our flesh craves. God does not answer prayers aimed at fuelling selfish pleasure. The issue is not the act of asking but the motive behind it.',
   NULL),
  (4,
   'Ye adulterers and adulteresses, know ye not that the friendship of the world is enmity with God? whosoever therefore will be a friend of the world is the enemy of God.',
   'μοιχοὶ καὶ μοιχαλίδες οὐκ οἴδατε ὅτι ἡ φιλία τοῦ κόσμου ἔχθρα τοῦ θεοῦ ἐστιν ὃς ἂν οὖν βουληθῇ φίλος εἶναι τοῦ κόσμου ἐχθρὸς τοῦ θεοῦ καθίσταται',
   'moichoi kai moichalides ouk oidate hoti hē philia tou kosmou echthra tou theou estin hos an oun boulēthē philos einai tou kosmou echthros tou theou kathistatai',
   '''Adulterers and adulteresses'' (moichoi kai moichalides — OT prophetic language for spiritual unfaithfulness; Israel was God''s bride, and idolatry was adultery; cf. Hosea). ''Friendship of the world'' (philia tou kosmou — love for the world-system, intimacy with the values and priorities opposed to God). ''Enmity with God'' (echthra tou theou — hostility against God, active opposition). ''Is the enemy of God'' (echthros tou theou kathistatai — is constituted, is established as God''s enemy). No middle ground: you cannot be a friend of both the world and God. The choice is absolute.',
   'Friendship with the world: James uses covenant language — spiritual adultery. The believer is in covenant with God (as a bride with a husband). To love the world-system (its values, priorities, pleasures, and ambitions) is spiritual adultery against God. This does not mean withdrawal from the world but refusal to adopt its value system. The world''s friendship and God''s friendship are mutually exclusive.'),
  (5,
   'Do ye think that the scripture saith in vain, The spirit that dwelleth in us lusteth to envy?',
   'ἢ δοκεῖτε ὅτι κενῶς ἡ γραφὴ λέγει πρὸς φθόνον ἐπιποθεῖ τὸ πνεῦμα ὃ κατῴκισεν ἐν ἡμῖν',
   'ē dokeite hoti kenōs hē graphē legei pros phthonon epipothei to pneuma ho katōkisen en hēmin',
   'One of the most debated verses in James. Two main interpretations: (1) ''The spirit he placed in us tends toward envy'' — the human spirit, fallen and prone to jealousy. (2) ''The Spirit He caused to dwell in us yearns jealously [for us]'' — the Holy Spirit jealously desires our full devotion. The second reading fits the context better: God is a jealous lover (Exod 34:14) who will not share His bride with the world. ''In vain'' (kenōs — emptily, without purpose) — Scripture never speaks idly.',
   NULL),
  (6,
   'But he giveth more grace. Wherefore he saith, God resisteth the proud, but giveth grace unto the humble.',
   'μείζονα δὲ δίδωσιν χάριν διὸ λέγει ὁ θεὸς ὑπερηφάνοις ἀντιτάσσεται ταπεινοῖς δὲ δίδωσιν χάριν',
   'meizona de didōsin charin dio legei ho theos hyperēphanois antitassetai tapeinois de didōsin charin',
   '''More grace'' (meizona charin — greater grace; grace that exceeds the pull of sin). ''Resisteth'' (antitassetai — sets himself in battle array against, opposes with military force; from anti + tassō, to arrange troops against). ''The proud'' (hyperēphanois — the arrogant, those who show themselves above others). ''Giveth grace'' (didōsin charin — freely gives favour). ''Humble'' (tapeinois — the lowly, those who recognise their low position). Quoted from Proverbs 3:34 (LXX). God''s posture toward humanity is determined by humanity''s posture: He fights the proud but favours the humble.',
   'Grace and humility: This is one of the most important principles in Scripture (quoted also in 1 Pet 5:5). God actively opposes the proud — not merely withholds blessing but sets Himself against them. Conversely, He actively gives grace to the humble. Humility is therefore not weakness but the prerequisite for receiving God''s favour. The path down is the way up.'),
  (7,
   'Submit yourselves therefore to God. Resist the devil, and he will flee from you.',
   'ὑποτάγητε οὖν τῷ θεῷ ἀντίστητε τῷ διαβόλῳ καὶ φεύξεται ἀφ᾽ ὑμῶν',
   'hypotagēte oun tō theō antistēte tō diabolō kai pheuxetai aph'' hymōn',
   '''Submit'' (hypotagēte — place yourselves under, subordinate yourselves; a military term: take your rank under God''s command). ''Resist'' (antistēte — stand against, take your stand; aorist imperative: make a decisive stand). ''The devil'' (tō diabolō — the slanderer, the accuser). ''Will flee'' (pheuxetai — will run away, will take flight). Two commands in sequence: first submit to God (positive), then resist the devil (negative). The order matters: resistance without submission is futile. The promise: when a submitted believer stands firm, the devil flees.',
   'Spiritual warfare: James presents the simplest formula for spiritual victory. (1) Submit to God — come under His authority and will. (2) Resist the devil — take a firm, active stand against him. The result: the devil flees. Satan cannot remain where God''s authority is acknowledged and his temptations are firmly refused. Submission precedes resistance; humility before God enables authority over the enemy.'),
  (8,
   'Draw nigh to God, and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.',
   'ἐγγίσατε τῷ θεῷ καὶ ἐγγιεῖ ὑμῖν καθαρίσατε χεῖρας ἁμαρτωλοί καὶ ἁγνίσατε καρδίας δίψυχοι',
   'engisate tō theō kai engieí hymin katharisate cheiras hamartōloi kai hagnisate kardias dipsychoi',
   '''Draw nigh'' (engisate — come near, approach). ''He will draw nigh to you'' (engieí hymin — He will come near to you). A staggering promise: the infinite God will respond to our approach. ''Cleanse your hands'' (katharisate cheiras — wash your hands clean; hands represent actions, outward conduct). ''Sinners'' (hamartōloi — those who miss the mark). ''Purify your hearts'' (hagnisate kardias — make your hearts pure; hearts represent the inner life, motives, thoughts). ''Double minded'' (dipsychoi — double-souled; same rare word from 1:8). Two cleansings: external (hands/actions) and internal (hearts/motives).',
   NULL),
  (9,
   'Be afflicted, and mourn, and weep: let your laughter be turned to mourning, and your joy to heaviness.',
   'ταλαιπωρήσατε καὶ πενθήσατε καὶ κλαύσατε ὁ γέλως ὑμῶν εἰς πένθος μεταστραφήτω καὶ ἡ χαρὰ εἰς κατήφειαν',
   'talaipōrēsate kai penthēsate kai klausate ho gelōs hymōn eis penthos metastraphētō kai hē chara eis katēpheian',
   '''Be afflicted'' (talaipōrēsate — be wretched, recognise your miserable condition). ''Mourn'' (penthēsate — grieve, lament as for the dead). ''Weep'' (klausate — cry out loud, wail). ''Laughter'' (gelōs — frivolous laughter, superficial merriment). ''Heaviness'' (katēpheian — gloom, dejection; literally, a downcast look). James calls for genuine repentance — not mild regret but deep, grieving recognition of sin. The worldly joy that comes from friendship with the world must be replaced with godly sorrow (2 Cor 7:10).',
   NULL),
  (10,
   'Humble yourselves in the sight of the Lord, and he shall lift you up.',
   'ταπεινώθητε ἐνώπιον τοῦ κυρίου καὶ ὑψώσει ὑμᾶς',
   'tapeinōthēte enōpion tou kyriou kai hypsōsei hymas',
   '''Humble yourselves'' (tapeinōthēte — make yourselves low, take the lowest place; aorist passive imperative: let yourselves be humbled). ''In the sight of the Lord'' (enōpion tou kyriou — before the face of the Lord, in God''s presence). ''He shall lift you up'' (hypsōsei hymas — He will exalt you, He will raise you high). The divine paradox: the way up is down. Self-exaltation leads to God''s opposition (v.6); self-humiliation leads to God''s exaltation. Cf. Luke 14:11, ''he that humbleth himself shall be exalted.''',
   NULL),
  (11,
   'Speak not evil one of another, brethren. He that speaketh evil of his brother, and judgeth his brother, speaketh evil of the law, and judgeth the law: but if thou judge the law, thou art not a doer of the law, but a judge.',
   'μὴ καταλαλεῖτε ἀλλήλων ἀδελφοί ὁ καταλαλῶν ἀδελφοῦ καὶ κρίνων τὸν ἀδελφὸν αὐτοῦ καταλαλεῖ νόμου καὶ κρίνει νόμον εἰ δὲ νόμον κρίνεις οὐκ εἶ ποιητὴς νόμου ἀλλὰ κριτής',
   'mē katalaleite allēlōn adelphoi ho katalalōn adelphou kai krinōn ton adelphon autou katalalei nomou kai krinei nomon ei de nomon krineis ouk ei poiētēs nomou alla kritēs',
   '''Speak not evil'' (mē katalaleite — do not speak against, do not slander; from kata, against + laleō, to speak). The logic chain: (1) If you slander your brother, you judge him. (2) But the law says ''love your neighbour'' (2:8). (3) To judge your brother is to say the law of love does not apply here — which is to judge the law. (4) If you judge the law rather than obeying it, you have set yourself up as judge over God''s law. ''A doer'' (poiētēs — a practitioner) vs. ''a judge'' (kritēs — one who sits in judgment). You are called to obey the law, not to sit in judgment over it or your brother.',
   NULL),
  (12,
   'There is one lawgiver, who is able to save and to destroy: who art thou that judgest another?',
   'εἷς ἐστιν ὁ νομοθέτης ὁ δυνάμενος σῶσαι καὶ ἀπολέσαι σὺ δὲ τίς εἶ ὃς κρίνεις τὸν ἕτερον',
   'heis estin ho nomothetēs ho dynamenos sōsai kai apolesai sy de tis ei hos krineis ton heteron',
   '''One lawgiver'' (heis ho nomothetēs — one single lawgiver; unique, sole, without equal). ''Able to save and to destroy'' (dynamenos sōsai kai apolesai — having the power of life and death, final salvation and final destruction). ''Who art thou'' (sy de tis ei — but you, who are you?). The devastating question: in judging your brother you have usurped the role of the one Lawgiver and Judge who alone has the power of eternal life and death. You are not God.',
   NULL),
  (13,
   'Go to now, ye that say, To day or to morrow we will go into such a city, and continue there a year, and buy and sell, and get gain:',
   'Ἄγε νῦν οἱ λέγοντες σήμερον ἢ αὔριον πορευσόμεθα εἰς τήνδε τὴν πόλιν καὶ ποιήσομεν ἐκεῖ ἐνιαυτὸν ἕνα καὶ ἐμπορευσόμεθα καὶ κερδήσομεν',
   'Age nyn hoi legontes sēmeron ē aurion poreusometha eis tēnde tēn polin kai poiēsomen ekei eniauton hena kai emporeusométha kai kerdēsomen',
   '''Go to now'' (age nyn — come now, listen up; a sharp interjection demanding attention). James addresses merchants who plan with absolute confidence: today or tomorrow, this city, one year, buy, sell, profit. Five future tenses in rapid succession — total certainty about an uncertain future. The sin is not planning (Proverbs commends planning) but planning without God, as though tomorrow were guaranteed.',
   NULL),
  (14,
   'Whereas ye know not what shall be on the morrow. For what is your life? It is even a vapour, that appeareth for a little time, and then vanisheth away.',
   'οἵτινες οὐκ ἐπίστασθε τὸ τῆς αὔριον ποία γὰρ ἡ ζωὴ ὑμῶν ἀτμὶς γάρ ἐστιν ἡ πρὸς ὀλίγον φαινομένη ἔπειτα δὲ ἀφανιζομένη',
   'hoitines ouk epistasthe to tēs aurion poia gar hē zōē hymōn atmis gar estin hē pros oligon phainomenē epeita de aphanizomenē',
   '''Ye know not'' (ouk epistasthe — you do not understand, you have no knowledge of tomorrow). ''What is your life?'' (poia hē zōē hymōn — of what sort is your life?). ''A vapour'' (atmis — steam, mist, breath; from which we get ''atmosphere''). ''Appeareth for a little time'' (pros oligon phainomenē — visible for a brief moment). ''Vanisheth away'' (aphanizomenē — disappears, becomes invisible; from a + phainō, to un-appear). Life is not a solid structure but a puff of steam — visible for a moment, then gone. This is not pessimism but realism that drives us to depend on God.',
   NULL),
  (15,
   'For that ye ought to say, If the Lord will, we shall live, and do this, or that.',
   'ἀντὶ τοῦ λέγειν ὑμᾶς ἐὰν ὁ κύριος θελήσῃ καὶ ζήσωμεν καὶ ποιήσωμεν τοῦτο ἢ ἐκεῖνο',
   'anti tou legein hymas ean ho kyrios thelēsē kai zēsōmen kai poiēsōmen touto ē ekeino',
   '''If the Lord will'' (ean ho kyrios thelēsē — if the Lord wills, should the Lord purpose). This is the Deo volente (D.V.) principle. Not merely a verbal formula to be tacked onto plans but a genuine attitude of dependence: even whether ''we shall live'' (zēsōmen) depends on God''s will. Our very existence tomorrow is subject to His will, let alone our business plans. The proper posture: plan wisely, hold plans loosely, submit everything to God''s sovereign will.',
   NULL),
  (16,
   'But now ye rejoice in your boastings: all such rejoicing is evil.',
   'νῦν δὲ καυχᾶσθε ἐν ταῖς ἀλαζονείαις ὑμῶν πᾶσα καύχησις τοιαύτη πονηρά ἐστιν',
   'nyn de kauchãsthe en tais alazoneiais hymōn pasa kauchēsis toiautē ponēra estin',
   '''Boastings'' (alazoneiais — arrogant pretensions, empty brags; from alazōn, a braggart, a quack, one who makes grandiose claims). ''Rejoicing'' (kauchēsis — boasting, glorying). ''Evil'' (ponēra — wicked, malicious, actively evil). Their confident planning without God is not merely unwise but evil — it is the arrogance of creatures who act as though they are their own gods. All such self-sufficient boasting is morally wicked.',
   NULL),
  (17,
   'Therefore to him that knoweth to do good, and doeth it not, to him it is sin.',
   'εἰδότι οὖν καλὸν ποιεῖν καὶ μὴ ποιοῦντι ἁμαρτία αὐτῷ ἐστιν',
   'eidoti oun kalon poiein kai mē poiounti hamartia autō estin',
   '''Knoweth'' (eidoti — knowing, being aware; the one who has knowledge). ''To do good'' (kalon poiein — to do what is right, noble, beautiful). ''Doeth it not'' (mē poiounti — does not do it, fails to act). ''Sin'' (hamartia — sin, missing the mark). This verse defines the sin of omission: sin is not only doing wrong but failing to do right. Knowledge increases responsibility. After all James has taught in this chapter — humility, dependence on God, not judging, not presuming — to know these things and not do them is sin.',
   'The sin of omission: James closes with a principle of universal application. Sin is not limited to active transgression (doing what is wrong) but includes passive neglect (failing to do what is right). The greater one''s knowledge of the good, the greater the sin of failing to do it. This principle makes complacency and inaction morally culpable.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'James' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 1 (Wars and lusts)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἡδονῶν', 'hēdonōn', 'G2237', 'Pleasures, desires for gratification — from hēdonē, whence "hedonism." The internal cravings and appetites that drive external conflicts. Not merely desires but pleasure-seeking drives that demand satisfaction.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 4 AND v.verse_number = 1;

-- Verse 4 (Friendship with the world)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φιλία', 'philia', 'G5373', 'Friendship, affection, love — intimate relational attachment. Friendship with the world means adopting the world''s values, priorities, and pursuits as one''s own. It is not mere contact but affection.', 1),
  ('ἔχθρα', 'echthra', 'G2189', 'Enmity, hostility, hatred — active opposition, the state of being an enemy. Not merely displeasing to God but positional hostility against God. The two friendships are mutually exclusive.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 4 AND v.verse_number = 4;

-- Verse 6 (God resisteth the proud)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπερηφάνοις', 'hyperēphanois', 'G5244', 'Proud, arrogant, haughty — from hyper (above) + phainomai (to appear). Those who show themselves above others, who consider themselves superior. God actively opposes them.', 1),
  ('ἀντιτάσσεται', 'antitassetai', 'G498', 'Resists, opposes, sets in battle array against — from anti (against) + tassō (to arrange). A military metaphor: God marshals His forces against the proud. He does not merely withhold favour; He actively fights them.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 4 AND v.verse_number = 6;

-- Verse 7 (Submit / resist the devil)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑποτάγητε', 'hypotagēte', 'G5293', 'Submit, subordinate yourselves — from hypo (under) + tassō (to arrange). Place yourself under God''s authority, accept your rank in His order. The first step of spiritual victory is voluntary surrender to God.', 1),
  ('ἀντίστητε', 'antistēte', 'G436', 'Resist, stand against, take your stand — from anti (against) + histēmi (to stand). A firm, decisive stand against the devil''s attacks. Not passive but active opposition, enabled by prior submission to God.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 4 AND v.verse_number = 7;

-- Verse 14 (Life is a vapour)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀτμίς', 'atmis', 'G822', 'Vapour, mist, steam — a puff of breath visible in cold air, gone in an instant. Life is not a solid, permanent structure but a momentary visibility. Used also in Acts 2:19 for "vapour of smoke."', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 4 AND v.verse_number = 14;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Wars from lusts
  (1, 'Romans 7:23', 1), (1, 'Galatians 5:17', 2), (1, '1 Peter 2:11', 3),
  -- v4: Friendship with the world
  (4, '1 John 2:15-16', 1), (4, 'Romans 8:7', 2), (4, 'Matthew 6:24', 3),
  -- v6: God resists the proud
  (6, '1 Peter 5:5', 1), (6, 'Proverbs 3:34', 2), (6, 'Luke 1:52', 3),
  -- v7: Submit to God / resist the devil
  (7, 'Ephesians 6:11-13', 1), (7, '1 Peter 5:8-9', 2), (7, 'Ephesians 4:27', 3),
  -- v8: Draw nigh to God
  (8, '2 Chronicles 15:2', 1), (8, 'Hebrews 10:22', 2), (8, 'Psalm 73:28', 3),
  -- v10: Humble yourselves
  (10, 'Matthew 23:12', 1), (10, 'Luke 14:11', 2), (10, '1 Peter 5:6', 3),
  -- v11: Speak not evil
  (11, 'Romans 14:4', 1), (11, 'Matthew 7:1-2', 2), (11, 'Ephesians 4:31', 3),
  -- v12: One lawgiver
  (12, 'Isaiah 33:22', 1), (12, 'Matthew 10:28', 2), (12, 'Romans 14:10-13', 3),
  -- v14: Life is a vapour
  (14, 'Psalm 39:5-6', 1), (14, 'Psalm 90:5-6', 2), (14, '1 Peter 1:24', 3),
  -- v17: Sin of omission
  (17, 'Luke 12:47', 1), (17, 'John 9:41', 2), (17, 'Romans 1:21', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'James' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- James Chapter 4 Complete
-- 17 verses · 5 key verses with word studies (9 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════