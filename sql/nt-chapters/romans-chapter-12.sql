-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 12 — Living Sacrifices and the Body of Christ
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 12,
  'Romans 12 marks the great transition from doctrine to duty, from theology to practice. The word ''therefore'' (oun) in v.1 links everything that follows to the mercies of God revealed in chapters 1-11. Paul''s first exhortation is the most comprehensive in the NT: ''present your bodies a living sacrifice, holy, acceptable unto God, which is your reasonable service'' (v.1). Believers are not to be ''conformed to this world'' but ''transformed by the renewing of your mind'' (v.2). The renewed mind proves ''that good, and acceptable, and perfect, will of God.'' Paul then turns to life in the body of Christ: each member has different gifts — prophecy, ministry, teaching, exhortation, giving, ruling, showing mercy — and must exercise them faithfully (vv.3-8). The remainder of the chapter is a rapid-fire series of ethical commands: love without dissimulation (v.9), brotherly affection (v.10), fervency of spirit (v.11), patience in tribulation (v.12), hospitality (v.13), blessing persecutors (v.14), rejoicing and weeping with others (v.15), humility (v.16), overcoming evil with good (v.21). The chapter''s climax is the great principle: ''Be not overcome of evil, but overcome evil with good'' (v.21).',
  'Living Sacrifices, Spiritual Gifts, and the Ethics of Love',
  'παρακαλῶ (parakalō)',
  'I beseech, I urge, I exhort — from para (alongside) + kaleō (to call). Paul does not command like a dictator but appeals as a pastor. This word sets the tone for the entire practical section of Romans (chs.12-16). The appeal is grounded in ''the mercies of God'' — Christian ethics flows from divine grace, not from legalism.',
  '["The Living Sacrifice: Transformed Minds (vv.1-2): I beseech you therefore brethren by the mercies of God that ye present your bodies a living sacrifice holy acceptable unto God which is your reasonable service. And be not conformed to this world but be ye transformed by the renewing of your mind that ye may prove what is that good and acceptable and perfect will of God","Gifts in the Body of Christ (vv.3-8): For I say through the grace given unto me to every man that is among you not to think of himself more highly than he ought to think but to think soberly according as God hath dealt to every man the measure of faith. For as we have many members in one body and all members have not the same office so we being many are one body in Christ","The Marks of Genuine Love (vv.9-16): Let love be without dissimulation. Abhor that which is evil cleave to that which is good. Be kindly affectioned one to another with brotherly love in honour preferring one another. Rejoice with them that do rejoice and weep with them that weep","Overcoming Evil with Good (vv.17-21): Recompense to no man evil for evil. Provide things honest in the sight of all men. If it be possible as much as lieth in you live peaceably with all men. Dearly beloved avenge not yourselves but rather give place unto wrath. Be not overcome of evil but overcome evil with good"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'I beseech you therefore, brethren, by the mercies of God, that ye present your bodies a living sacrifice, holy, acceptable unto God, which is your reasonable service.',
   'παρακαλῶ οὖν ὑμᾶς ἀδελφοί διὰ τῶν οἰκτιρμῶν τοῦ θεοῦ παραστῆσαι τὰ σώματα ὑμῶν θυσίαν ζῶσαν ἁγίαν εὐάρεστον τῷ θεῷ τὴν λογικὴν λατρείαν ὑμῶν',
   'parakalō oun hymas adelphoi dia tōn oiktirmōn tou theou parastēsai ta sōmata hymōn thysian zōsan hagian euareston tō theō tēn logikēn latreian hymōn',
   '''I beseech'' (parakalō — I urge, appeal to). ''Therefore'' (oun — the great hinge word connecting chs.1-11 to chs.12-16). ''By the mercies of God'' (dia tōn oiktirmōn — through God''s compassions; the plural intensifies: all the mercies revealed in the preceding eleven chapters). ''Present your bodies'' (parastēsai ta sōmata — yield, offer; an aorist imperative: decisive action). ''Living sacrifice'' (thysian zōsan — unlike OT sacrifices that died on the altar, this sacrifice lives). ''Reasonable service'' (logikēn latreian — rational worship, spiritual service; logikos means pertaining to reason or the mind).',
   'This is the most important verse on Christian consecration in the NT. Four features of the new sacrifice: (1) It is ''living'' — not death but daily life offered to God; (2) ''Holy'' — set apart for God''s purposes; (3) ''Acceptable'' — pleasing to God; (4) ''Reasonable'' — not irrational ecstasy but intelligent, thoughtful worship. The ''therefore'' (oun) grounds all Christian ethics in the mercies of God: we do not obey in order to earn grace but because we have received grace. This is the foundation of the entire practical section of Romans.'),
  (2, 'And be not conformed to this world: but be ye transformed by the renewing of your mind, that ye may prove what is that good, and acceptable, and perfect, will of God.',
   'καὶ μὴ συσχηματίζεσθε τῷ αἰῶνι τούτῳ ἀλλὰ μεταμορφοῦσθε τῇ ἀνακαινώσει τοῦ νοὸς ὑμῶν εἰς τὸ δοκιμάζειν ὑμᾶς τί τὸ θέλημα τοῦ θεοῦ τὸ ἀγαθὸν καὶ εὐάρεστον καὶ τέλειον',
   'kai mē syschēmatizesthe tō aiōni toutō alla metamorphousthe tē anakainōsei tou noos hymōn eis to dokimazein hymas ti to thelēma tou theou to agathon kai euareston kai teleion',
   '''Conformed'' (syschēmatizesthe — shaped according to, pressed into the mould of; from syn + schēma, outward form). ''This world'' (tō aiōni toutō — this age, the present evil age). ''Transformed'' (metamorphousthe — changed in form from within; from meta + morphē, inner nature; English metamorphosis). ''Renewing'' (anakainōsei — renovation, making new again). ''Prove'' (dokimazein — test and approve). The mind''s renewal is the key to discerning God''s will.',
   'Two contrasting processes: conformation (external pressure from the world) and transformation (internal renewal by the Spirit). The difference is between schēma (outward, temporary form) and morphē (inner, essential form). The world presses believers into its mould from outside; God transforms them from inside through the renewed mind. The result is the ability to ''prove'' — test, discern, and approve — God''s will. Christian ethics is not mere rule-following but Spirit-empowered discernment.'),
  (3, 'For I say, through the grace given unto me, to every man that is among you, not to think of himself more highly than he ought to think; but to think soberly, according as God hath dealt to every man the measure of faith.',
   'λέγω γὰρ διὰ τῆς χάριτος τῆς δοθείσης μοι παντὶ τῷ ὄντι ἐν ὑμῖν μὴ ὑπερφρονεῖν παρ᾿ ὃ δεῖ φρονεῖν ἀλλὰ φρονεῖν εἰς τὸ σωφρονεῖν ἑκάστῳ ὡς ὁ θεὸς ἐμέρισεν μέτρον πίστεως',
   'legō gar dia tēs charitos tēs dotheisēs moi panti tō onti en hymin mē hyperphronein par ho dei phronein alla phronein eis to sōphronein hekastō hōs ho theos emerisen metron pisteōs',
   'Paul plays on the verb phronein (to think): hyperphronein (think too highly), phronein (think), sōphronein (think soberly/sanely). ''Measure of faith'' (metron pisteōs — the specific portion of faith God has given to each person). Spiritual gifts differ; what matters is sober self-assessment, not comparison with others.',
   NULL),
  (4, 'For as we have many members in one body, and all members have not the same office:',
   'καθάπερ γὰρ ἐν ἑνὶ σώματι μέλη πολλὰ ἔχομεν τὰ δὲ μέλη πάντα οὐ τὴν αὐτὴν ἔχει πρᾶξιν',
   'kathaper gar en heni sōmati melē polla echomen ta de melē panta ou tēn autēn echei praxin',
   '''Members'' (melē — body parts). ''Office'' (praxin — function, activity). The body metaphor: diversity of function within organic unity. This parallels 1 Corinthians 12 but is more concise. Unity does not mean uniformity.',
   NULL),
  (5, 'So we, being many, are one body in Christ, and every one members one of another.',
   'οὕτως οἱ πολλοὶ ἓν σῶμά ἐσμεν ἐν Χριστῷ ὁ δὲ καθ᾿ εἷς ἀλλήλων μέλη',
   'houtōs hoi polloi hen sōma esmen en Christō ho de kath heis allēlōn melē',
   '''One body in Christ'' (hen sōma en Christō — united in Christ as one organic whole). ''Members one of another'' (allēlōn melē — mutually interdependent). Christians belong not only to Christ but to each other. Individualism is foreign to Paul''s ecclesiology.',
   NULL),
  (6, 'Having then gifts differing according to the grace that is given to us, whether prophecy, let us prophesy according to the proportion of faith;',
   'ἔχοντες δὲ χαρίσματα κατὰ τὴν χάριν τὴν δοθεῖσαν ἡμῖν διάφορα εἴτε προφητείαν κατὰ τὴν ἀναλογίαν τῆς πίστεως',
   'echontes de charismata kata tēn charin tēn dotheisan hēmin diaphora eite prophēteian kata tēn analogian tēs pisteōs',
   '''Gifts'' (charismata — grace-gifts; from charis, grace). ''Prophecy'' (prophēteian — inspired speaking, proclamation of God''s truth). ''Proportion of faith'' (analogian tēs pisteōs — the analogy or measure of faith). Each gift must be exercised within the boundaries of faith, not beyond one''s capacity or calling.',
   NULL),
  (7, 'Or ministry, let us wait on our ministering: or he that teacheth, on teaching;',
   'εἴτε διακονίαν ἐν τῇ διακονίᾳ εἴτε ὁ διδάσκων ἐν τῇ διδασκαλίᾳ',
   'eite diakonian en tē diakonia eite ho didaskōn en tē didaskalia',
   '''Ministry'' (diakonian — service, practical help; from diakonos, servant). ''Teaching'' (didaskalia — systematic instruction). Each gift-holder should concentrate on their own gift. The teacher should focus on teaching, the servant on serving. Faithfulness in one''s own calling is better than attempting another''s.',
   NULL),
  (8, 'Or he that exhorteth, on exhortation: he that giveth, let him do it with simplicity; he that ruleth, with diligence; he that sheweth mercy, with cheerfulness.',
   'εἴτε ὁ παρακαλῶν ἐν τῇ παρακλήσει ὁ μεταδιδοὺς ἐν ἁπλότητι ὁ προϊστάμενος ἐν σπουδῇ ὁ ἐλεῶν ἐν ἱλαρότητι',
   'eite ho parakalōn en tē paraklēsei ho metadidous en haplotēti ho proistamenos en spoudē ho eleōn en hilarotēti',
   '''Exhorteth'' (parakalōn — encourages, comforts). ''Simplicity'' (haplotēti — generosity, single-mindedness; giving without ulterior motives). ''Ruleth'' (proistamenos — leads, manages, presides). ''Diligence'' (spoudē — eagerness, zeal). ''Mercy'' (eleōn — showing compassion). ''Cheerfulness'' (hilarotēti — joyfulness; English ''hilarity'' derives from this). God loves a cheerful giver (2 Corinthians 9:7).',
   NULL),
  (9, 'Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.',
   'ἡ ἀγάπη ἀνυπόκριτος ἀποστυγοῦντες τὸ πονηρόν κολλώμενοι τῷ ἀγαθῷ',
   'hē agapē anypokritos apostygountes to ponēron kollōmenoi tō agathō',
   '''Without dissimulation'' (anypokritos — unhypocritical, genuine; from a + hypokrinomai, to play-act). ''Abhor'' (apostygountes — detest utterly; a strong compound: apo intensifies stygeō, to hate). ''Cleave'' (kollōmenoi — be glued to, joined fast). Love must be genuine, hating evil intensely and clinging to good tenaciously.',
   NULL),
  (10, 'Be kindly affectioned one to another with brotherly love; in honour preferring one another;',
   'τῇ φιλαδελφίᾳ εἰς ἀλλήλους φιλόστοργοι τῇ τιμῇ ἀλλήλους προηγούμενοι',
   'tē philadelphia eis allēlous philostorgoi tē timē allēlous proēgoumenoi',
   '''Kindly affectioned'' (philostorgoi — warmly devoted; from philos + storgē, family affection). ''Brotherly love'' (philadelphia — love of brothers/sisters). ''In honour preferring'' (proēgoumenoi — leading the way in showing honour, taking the initiative in giving respect to others).',
   NULL),
  (11, 'Not slothful in business; fervent in spirit; serving the Lord;',
   'τῇ σπουδῇ μὴ ὀκνηροί τῷ πνεύματι ζέοντες τῷ κυρίῳ δουλεύοντες',
   'tē spoudē mē oknēroi tō pneumati zeontes tō kyriō douleuontes',
   '''Not slothful'' (mē oknēroi — not lazy, not hesitant). ''Fervent'' (zeontes — boiling, bubbling; from zeō, to boil). ''Serving the Lord'' (tō kyriō douleuontes — serving as bond-slaves of the Lord). Christian zeal is not emotional excess but Spirit-energised devotion channelled into the Lord''s service.',
   NULL),
  (12, 'Rejoicing in hope; patient in tribulation; continuing instant in prayer;',
   'τῇ ἐλπίδι χαίροντες τῇ θλίψει ὑπομένοντες τῇ προσευχῇ προσκαρτεροῦντες',
   'tē elpidi chairontes tē thlipsei hypomenontes tē proseuchē proskarterountes',
   'Three parallel phrases: ''Rejoicing in hope'' (chairontes — present joy grounded in future hope). ''Patient in tribulation'' (hypomenontes — enduring under pressure; hypo + menō, remaining under). ''Continuing instant in prayer'' (proskarterountes — persevering steadfastly, being devoted). Hope, endurance, and prayer form a triad of Christian resilience.',
   NULL),
  (13, 'Distributing to the necessity of saints; given to hospitality.',
   'ταῖς χρείαις τῶν ἁγίων κοινωνοῦντες τὴν φιλοξενίαν διώκοντες',
   'tais chreiais tōn hagiōn koinōnountes tēn philoxenian diōkontes',
   '''Distributing'' (koinōnountes — sharing in, contributing to; from koinōnia, fellowship). ''Necessity'' (chreiais — needs). ''Given to hospitality'' (philoxenian diōkontes — pursuing hospitality; literally ''chasing'' hospitality: diōkō means to pursue eagerly). Hospitality is not passive but actively sought.',
   NULL),
  (14, 'Bless them which persecute you: bless, and curse not.',
   'εὐλογεῖτε τοὺς διώκοντας ὑμᾶς εὐλογεῖτε καὶ μὴ καταρᾶσθε',
   'eulogeite tous diōkontas hymas eulogeite kai mē katarasthe',
   '''Bless'' (eulogeite — speak well of, invoke blessing upon; from eu + logos). ''Persecute'' (diōkontas — the same verb as ''pursuing'' in v.13: believers pursue hospitality; persecutors pursue believers). ''Curse not'' (mē katarasthe — do not invoke evil upon). This echoes Jesus'' teaching in Matthew 5:44 and Luke 6:28.',
   NULL),
  (15, 'Rejoice with them that do rejoice, and weep with them that weep.',
   'χαίρειν μετὰ χαιρόντων καὶ κλαίειν μετὰ κλαιόντων',
   'chairein meta chairontōn kai klaiein meta klaiontōn',
   '''Rejoice with'' (chairein meta — share in joy). ''Weep with'' (klaiein meta — share in grief). Empathy is commanded: entering into both the joys and sorrows of fellow believers. This is the practical expression of being ''members one of another'' (v.5).',
   NULL),
  (16, 'Be of the same mind one toward another. Mind not high things, but condescend to men of low estate. Be not wise in your own conceits.',
   'τὸ αὐτὸ εἰς ἀλλήλους φρονοῦντες μὴ τὰ ὑψηλὰ φρονοῦντες ἀλλὰ τοῖς ταπεινοῖς συναπαγόμενοι μὴ γίνεσθε φρόνιμοι παρ᾿ ἑαυτοῖς',
   'to auto eis allēlous phronountes mē ta hypsēla phronountes alla tois tapeinois synapagomenoi mē ginesthe phronimoi par heautois',
   '''Same mind'' (to auto phronountes — thinking the same thing toward each other; harmony, not uniformity). ''High things'' (ta hypsēla — lofty things, social ambition). ''Condescend'' (synapagomenoi — be carried along with, associate with). ''Men of low estate'' (tois tapeinois — the humble, the lowly). ''Wise in your own conceits'' — cf. Proverbs 3:7. Humility is the antidote to social climbing.',
   NULL),
  (17, 'Recompense to no man evil for evil. Provide things honest in the sight of all men.',
   'μηδενὶ κακὸν ἀντὶ κακοῦ ἀποδιδόντες προνοούμενοι καλὰ ἐνώπιον πάντων ἀνθρώπων',
   'mēdeni kakon anti kakou apodidontes pronoumenoi kala enōpion pantōn anthrōpōn',
   '''Evil for evil'' (kakon anti kakou — tit-for-tat retaliation is forbidden). ''Provide things honest'' (pronoumenoi kala — plan ahead for what is honourable). ''In the sight of all men'' — public witness matters. Christians must act with integrity that is visible to outsiders.',
   NULL),
  (18, 'If it be possible, as much as lieth in you, live peaceably with all men.',
   'εἰ δυνατόν τὸ ἐξ ὑμῶν μετὰ πάντων ἀνθρώπων εἰρηνεύοντες',
   'ei dynaton to ex hymōn meta pantōn anthrōpōn eirēneuontes',
   '''If it be possible'' — a realistic qualifier: peace is not always achievable. ''As much as lieth in you'' (to ex hymōn — as far as it depends on you). The Christian is responsible for their own peacemaking effort, not for the other party''s response. ''Live peaceably'' (eirēneuontes — be at peace). Two conditions acknowledge the limits of peacemaking without excusing passivity.',
   NULL),
  (19, 'Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith the Lord.',
   'μὴ ἑαυτοὺς ἐκδικοῦντες ἀγαπητοί ἀλλὰ δότε τόπον τῇ ὀργῇ γέγραπται γὰρ ἐμοὶ ἐκδίκησις ἐγὼ ἀνταποδώσω λέγει κύριος',
   'mē heautous ekdikountes agapētoi alla dote topon tē orgē gegraptai gar emoi ekdikēsis egō antapodōsō legei kyrios',
   '''Avenge not'' (mē ekdikountes — do not take justice into your own hands). ''Give place unto wrath'' (dote topon tē orgē — leave room for God''s wrath; step back and let God handle it). Quoting Deuteronomy 32:35. The prohibition of personal vengeance is grounded in God''s promise to execute justice himself.',
   'The command against personal vengeance is one of the most countercultural demands of the gospel. Paul quotes Deuteronomy 32:35 to show that vengeance belongs exclusively to God. Christians can relinquish the right to retaliate because they trust in a God who will repay justly. This does not prohibit the state''s role in justice (see 13:1-7) but restricts personal, retaliatory violence.'),
  (20, 'Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.',
   'ἐὰν οὖν πεινᾷ ὁ ἐχθρός σου ψώμιζε αὐτόν ἐὰν διψᾷ πότιζε αὐτόν τοῦτο γὰρ ποιῶν ἄνθρακας πυρὸς σωρεύσεις ἐπὶ τὴν κεφαλὴν αὐτοῦ',
   'ean oun peina ho echthros sou psōmize auton ean dipsa potize auton touto gar poiōn anthrakas pyros sōreuseis epi tēn kephalēn autou',
   'Quoting Proverbs 25:21-22. ''Feed him … give him drink'' — active kindness to enemies, not merely refraining from harm. ''Coals of fire'' (anthrakas pyros) — most likely refers to the burning shame of conviction: kindness may melt an enemy''s hostility. An Egyptian penitential ritual involved carrying a pan of coals on the head as a sign of repentance.',
   NULL),
  (21, 'Be not overcome of evil, but overcome evil with good.',
   'μὴ νικῶ ὑπὸ τοῦ κακοῦ ἀλλὰ νίκα ἐν τῷ ἀγαθῷ τὸ κακόν',
   'mē nikō hypo tou kakou alla nika en tō agathō to kakon',
   '''Overcome'' (nikō / nika — conquer, be victorious; from nikaō). The verb is used twice: do not be conquered by evil, but conquer evil with good. The Christian''s weapon against evil is not counter-evil but aggressive good. This summarises the entire ethical section of vv.14-21 and is one of the most powerful moral principles in the NT.',
   'This verse is the capstone of Paul''s ethic of non-retaliation. Evil is not defeated by more evil but by relentless good. The verb nikaō (conquer) is military language: the Christian wages war against evil, but the weapon is goodness. This is not passive weakness but active, courageous conquest. The cross itself is the supreme example: Christ overcame the ultimate evil (sin and death) through the ultimate good (sacrificial love).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 12;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 living sacrifice
  ('θυσία', 'thysia', 'G2378', 'Sacrifice, offering — from thyō (to kill, slaughter). In the OT, sacrifices were dead animals placed on the altar. Paul radically transforms the concept: the Christian sacrifice is living (zōsan), not dead. The whole of daily life — body, mind, relationships — becomes an act of worship. This is the new priesthood of all believers.', 1),
  -- v.1 reasonable service
  ('λογικός', 'logikos', 'G3050', 'Rational, reasonable, spiritual — from logos (word, reason). The Christian''s worship is not mindless ritual but intelligent, thoughtful devotion. Some translate ''spiritual worship'' (contrasting with OT animal sacrifice), others ''reasonable service'' (emphasising the mind''s involvement). Both senses are present: true worship engages the renewed mind.', 2),
  -- v.2 conformed
  ('συσχηματίζω', 'syschēmatizō', 'G4964', 'To conform to, fashion according to — from syn (with) + schēma (outward form, appearance). The word implies external pressure moulding from outside. The world squeezes believers into its pattern of thinking and living. The present imperative with mē (do not keep being conformed) suggests this pressure is ongoing and must be continually resisted.', 3),
  -- v.2 transformed
  ('μεταμορφόω', 'metamorphoō', 'G3339', 'To transform, change in form — from meta (change) + morphē (inner form, essential nature). Unlike schēma (outward appearance), morphē denotes the real, inner character. Transformation comes from within, not without. The same word describes Jesus'' transfiguration (Matthew 17:2). Believers undergo a progressive, Spirit-driven metamorphosis into Christ''s likeness (2 Corinthians 3:18).', 4),
  -- v.2 renewing of mind
  ('ἀνακαίνωσις', 'anakainōsis', 'G342', 'Renewal, renovation — from ana (again) + kainōsis (newness). The mind (nous) is the faculty that must be renewed. A new mind produces new desires, new values, and new discernment. This renewal is the ongoing work of the Holy Spirit (Titus 3:5), not a one-time event. It is the mechanism by which transformation occurs.', 5),
  -- v.9 love without dissimulation
  ('ἀνυπόκριτος', 'anypokritos', 'G505', 'Unhypocritical, sincere, genuine — from a (not) + hypokrinomai (to play a part, act on stage). Love must not be a performance. The word hypokrisis (hypocrisy) comes from the Greek theatre where actors wore masks. Genuine love removes the mask and engages authentically with others. This is the first and governing virtue in Paul''s list.', 6),
  -- v.19 vengeance
  ('ἐκδίκησις', 'ekdikēsis', 'G1557', 'Vengeance, vindication, justice — from ek (out) + dikē (justice). The execution of justice belongs to God alone. Believers are not to usurp God''s prerogative by taking personal revenge. This does not mean injustice goes uncorrected — God promises ''I will repay'' — but it removes vengeance from human hands and places it in God''s.', 7),
  -- v.21 overcome
  ('νικάω', 'nikaō', 'G3528', 'To conquer, overcome, be victorious — the verb of military conquest. Used twice in v.21: do not be conquered by evil, but conquer evil with good. The Christian is in a real battle, but the weapons are not carnal (2 Corinthians 10:4). Good is the only force that truly defeats evil. Retaliation only multiplies evil; goodness absorbs it and transforms it.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 12
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1 WHEN 2 THEN 1
    WHEN 3 THEN 2 WHEN 4 THEN 2 WHEN 5 THEN 2
    WHEN 6 THEN 9
    WHEN 7 THEN 19
    WHEN 8 THEN 21
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 living sacrifice
  (1, '1 Peter 2:5', 1),
  (1, 'Hebrews 13:15-16', 2),
  (1, 'Romans 6:13', 3),
  -- v.2 transformed mind
  (2, 'Ephesians 4:22-24', 4),
  (2, 'Colossians 3:10', 5),
  (2, '2 Corinthians 3:18', 6),
  -- v.3 sober thinking
  (3, 'Philippians 2:3', 7),
  (3, '1 Corinthians 4:6', 8),
  -- v.4-5 one body many members
  (4, '1 Corinthians 12:12-14', 9),
  (5, 'Ephesians 4:25', 10),
  -- v.6 gifts
  (6, '1 Corinthians 12:4-11', 11),
  (6, '1 Peter 4:10-11', 12),
  (6, 'Ephesians 4:11', 13),
  -- v.8 cheerful giving
  (8, '2 Corinthians 9:7', 14),
  -- v.9 genuine love
  (9, '1 John 3:18', 15),
  (9, '1 Peter 1:22', 16),
  -- v.10 brotherly love
  (10, '1 Thessalonians 4:9', 17),
  (10, 'Hebrews 13:1', 18),
  -- v.12 patient in tribulation
  (12, 'James 1:2-4', 19),
  (12, '1 Thessalonians 5:17', 20),
  -- v.14 bless persecutors
  (14, 'Matthew 5:44', 21),
  (14, 'Luke 6:27-28', 22),
  (14, 'Acts 7:60', 23),
  -- v.16 not wise in own conceits
  (16, 'Proverbs 3:7', 24),
  (16, 'Isaiah 5:21', 25),
  -- v.17 evil for evil
  (17, '1 Thessalonians 5:15', 26),
  (17, '1 Peter 3:9', 27),
  -- v.19 vengeance is mine
  (19, 'Deuteronomy 32:35', 28),
  (19, 'Hebrews 10:30', 29),
  -- v.20 heap coals of fire
  (20, 'Proverbs 25:21-22', 30),
  (20, 'Matthew 5:44-48', 31),
  -- v.21 overcome evil with good
  (21, '1 Peter 3:9', 32),
  (21, '1 John 4:4', 33)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 12
  AND v.verse_number = cr.verse_number;
