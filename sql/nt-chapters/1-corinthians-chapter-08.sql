-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 8 — Food Offered to Idols and the Conscience
-- 13 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'First Corinthians 8 begins a three-chapter discussion (8-10) on food offered to idols — a burning question in Corinth where most meat sold in the marketplace had been ritually offered to pagan deities. Paul responds to another question from their letter: ''Now as touching things offered unto idols'' (v.1). He begins with a foundational correction: ''knowledge puffeth up, but charity edifieth'' (v.1). The ''knowledgeable'' Corinthians knew that ''an idol is nothing in the world'' and ''there is none other God but one'' (v.4). Paul agrees theologically: although pagans worship ''gods many and lords many,'' for Christians ''there is but one God, the Father, of whom are all things, and we in him; and one Lord Jesus Christ, by whom are all things, and we by him'' (vv.5-6). Yet not everyone has this knowledge. Some believers, recently converted from paganism, still feel the power of idols in their conscience (v.7). Food itself is morally neutral — neither eating nor abstaining affects our standing before God (v.8). But Paul introduces the crucial principle: ''take heed lest by any means this liberty of yours become a stumblingblock to them that are weak'' (v.9). If a ''weak'' brother sees a ''knowledgeable'' Christian eating in an idol''s temple and is emboldened to eat against his conscience, the weak brother is ''destroyed'' by the strong brother''s knowledge (vv.10-11). Sinning against a brother''s conscience is sinning against Christ (v.12). Paul concludes with a dramatic personal pledge: ''if meat make my brother to offend, I will eat no flesh while the world standeth'' (v.13). The principle: love limits liberty.',
  'Knowledge Puffs Up, Love Builds Up — Liberty Limited by Love',
  'συνείδησις (syneidēsis)',
  'Conscience — from synoida (to know together with oneself, to be aware). The conscience is the inner faculty of moral judgment that evaluates actions as right or wrong. In this chapter, Paul distinguishes between a ''strong'' conscience (informed by knowledge that idols are nothing) and a ''weak'' conscience (still feeling the pull of former idol worship). The key principle: even correct knowledge must yield to love when exercising liberty would damage another''s conscience.',
  '["Knowledge and Love Contrasted (vv.1-3): Now as touching things offered unto idols we know that we all have knowledge. Knowledge puffeth up but charity edifieth. And if any man think that he knoweth any thing he knoweth nothing yet as he ought to know. But if any man love God the same is known of him","One God One Lord: The Theology of Monotheism (vv.4-6): As concerning therefore the eating of those things that are offered in sacrifice unto idols we know that an idol is nothing in the world and that there is none other God but one. For though there be that are called gods whether in heaven or in earth as there be gods many and lords many. But to us there is but one God the Father of whom are all things and we in him and one Lord Jesus Christ by whom are all things and we by him","The Weak Conscience (vv.7-8): Howbeit there is not in every man that knowledge for some with conscience of the idol unto this hour eat it as a thing offered unto an idol and their conscience being weak is defiled. But meat commendeth us not to God for neither if we eat are we the better neither if we eat not are we the worse","Liberty as Stumblingblock (vv.9-12): But take heed lest by any means this liberty of yours become a stumblingblock to them that are weak. For if any man see thee which hast knowledge sit at meat in the idol''s temple shall not the conscience of him which is weak be emboldened to eat those things which are offered to idols. And through thy knowledge shall the weak brother perish for whom Christ died. But when ye sin so against the brethren and wound their weak conscience ye sin against Christ","Love Limits Liberty (v.13): Wherefore if meat make my brother to offend I will eat no flesh while the world standeth lest I make my brother to offend"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now as touching things offered unto idols, we know that we all have knowledge. Knowledge puffeth up, but charity edifieth.',
   'περὶ δὲ τῶν εἰδωλοθύτων οἴδαμεν ὅτι πάντες γνῶσιν ἔχομεν ἡ γνῶσις φυσιοῖ ἡ δὲ ἀγάπη οἰκοδομεῖ',
   'peri de tōn eidōlothytōn oidamen hoti pantes gnōsin echomen hē gnōsis physioi hē de agapē oikodomei',
   '''Things offered unto idols'' (eidōlothytōn — idol-sacrificed things; meat from animals sacrificed in pagan temples). ''We all have knowledge'' — likely a Corinthian slogan Paul quotes. ''Puffeth up'' (physioi — inflates, makes arrogant; cf. 4:6, 18; 5:2). ''Edifieth'' (oikodomei — builds up, constructs like a house). Knowledge without love produces arrogance; love without knowledge builds up the community. The contrast sets the tone for the entire chapter.',
   'This verse establishes one of Paul''s most important ethical principles: the supremacy of love over knowledge. The Corinthians prided themselves on their theological sophistication — they ''knew'' that idols were nothing. But knowledge alone inflates (physioi — the same word used of their arrogance in chapters 4-5). Love, by contrast, builds (oikodomei — constructs, edifies). The issue is not whether the knowledge is correct (it is, v.4) but whether it is exercised in love. Correct theology without love is spiritual pride.'),
  (2, 'And if any man think that he knoweth any thing, he knoweth nothing yet as he ought to know.',
   'εἰ δέ τις δοκεῖ ἐγνωκέναι τι οὐδέπω οὐδὲν ἔγνωκεν καθὼς δεῖ γνῶναι',
   'ei de tis dokei egnōkenai ti oudepō ouden egnōken kathōs dei gnōnai',
   '''Think that he knoweth'' (dokei egnōkenai — supposes he has come to know; perfect tense: claims settled knowledge). ''Knoweth nothing yet as he ought to know'' — the person who thinks his knowledge is complete actually knows nothing in the proper sense. True knowledge includes knowing how to use knowledge — with humility and love. Knowledge that puffs up is not genuine knowledge.',
   NULL),
  (3, 'But if any man love God, the same is known of him.',
   'εἰ δέ τις ἀγαπᾷ τὸν θεόν οὗτος ἔγνωσται ὑπ᾿ αὐτοῦ',
   'ei de tis agapa ton theon houtos egnōstai hyp autou',
   '''Love God'' (agapa ton theon — loves God habitually). ''Is known of him'' (egnōstai hyp autou — has been known by God; perfect passive: God''s prior knowledge). A surprising shift: Paul moves from human knowledge of God to God''s knowledge of us. What matters is not that we know God but that God knows us. The one who loves God demonstrates that God has already known (chosen, acknowledged) them. This echoes Galatians 4:9.',
   NULL),
  (4, 'As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other God but one.',
   'περὶ τῆς βρώσεως οὖν τῶν εἰδωλοθύτων οἴδαμεν ὅτι οὐδὲν εἴδωλον ἐν κόσμῳ καὶ ὅτι οὐδεὶς θεὸς ἕτερος εἰ μὴ εἷς',
   'peri tēs brōseōs oun tōn eidōlothytōn oidamen hoti ouden eidōlon en kosmō kai hoti oudeis theos heteros ei mē heis',
   '''An idol is nothing'' (ouden eidōlon en kosmō — an idol has no real existence in the world). ''None other God but one'' (oudeis theos heteros ei mē heis). Paul affirms the theological correctness of the ''knowledgeable'' Corinthians: idols represent nonexistent deities. Strict monotheism: there is only one God. This agrees with Isaiah 44:6-20 and Deuteronomy 6:4. The theological point is settled — but its application requires love.',
   NULL),
  (5, 'For though there be that are called gods, whether in heaven or in earth, (as there be gods many, and lords many,)',
   'καὶ γὰρ εἴπερ εἰσὶν λεγόμενοι θεοὶ εἴτε ἐν οὐρανῷ εἴτε ἐπὶ τῆς γῆς ὥσπερ εἰσὶν θεοὶ πολλοὶ καὶ κύριοι πολλοί',
   'kai gar eiper eisin legomenoi theoi eite en ouranō eite epi tēs gēs hōsper eisin theoi polloi kai kyrioi polloi',
   '''Called gods'' (legomenoi theoi — so-called gods; they bear the name but lack the reality). ''Gods many and lords many'' — Paul acknowledges the polytheistic environment: the Greco-Roman world was crowded with deities. Whether these represent spiritual forces (demons, as Paul will argue in 10:20) or mere human projections, they are ''called'' gods but are not truly God. The pagan religious marketplace forms the background of the entire idol-food debate.',
   NULL),
  (6, 'But to us there is but one God, the Father, of whom are all things, and we in him; and one Lord Jesus Christ, by whom are all things, and we by him.',
   'ἀλλ᾿ ἡμῖν εἷς θεὸς ὁ πατήρ ἐξ οὗ τὰ πάντα καὶ ἡμεῖς εἰς αὐτόν καὶ εἷς κύριος Ἰησοῦς Χριστός δι᾿ οὗ τὰ πάντα καὶ ἡμεῖς δι᾿ αὐτοῦ',
   'all hēmin heis theos ho patēr ex hou ta panta kai hēmeis eis auton kai heis kyrios Iēsous Christos di hou ta panta kai hēmeis di autou',
   '''One God, the Father'' — the source (ex hou — from whom) of all things. ''One Lord Jesus Christ'' — the agent (di hou — through whom) of all things. ''Of whom... by whom'' — the Father is the origin and goal; the Son is the mediator and means. ''We in him... we by him'' — believers exist for the Father and through the Son. This is a Christian adaptation of the Shema (Deuteronomy 6:4), incorporating Christ into the monotheistic confession without creating two gods.',
   'This verse is one of the most important christological texts in the NT. Paul takes the Jewish confession of one God (the Shema) and includes Jesus Christ within it. ''One God, the Father'' and ''one Lord Jesus Christ'' are not two separate deities but one divine reality. The prepositions reveal the internal relations: the Father is the source (ex hou — from whom), Christ is the agent (di hou — through whom) of creation and redemption. This is an early, high Christology — Christ is placed within the divine identity as the one through whom all things exist. It is simultaneously a confession of monotheism and of Christ''s deity.'),
  (7, 'Howbeit there is not in every man that knowledge: for some with conscience of the idol unto this hour eat it as a thing offered unto an idol; and their conscience being weak is defiled.',
   'ἀλλ᾿ οὐκ ἐν πᾶσιν ἡ γνῶσις τινὲς δὲ τῇ συνειδήσει τοῦ εἰδώλου ἕως ἄρτι ὡς εἰδωλόθυτον ἐσθίουσιν καὶ ἡ συνείδησις αὐτῶν ἀσθενὴς οὖσα μολύνεται',
   'all ouk en pasin hē gnōsis tines de tē syneidēsei tou eidōlou heōs arti hōs eidōlothyton esthiousin kai hē syneidēsis autōn asthenēs ousa molynetai',
   '''Not in every man that knowledge'' — not all believers have reached the same theological maturity. ''Conscience of the idol'' (syneidēsei tou eidōlou — an awareness/consciousness of the idol as still powerful). ''Unto this hour'' (heōs arti — right up to now). ''Weak'' (asthenēs — feeble, lacking strength). ''Defiled'' (molynetai — stained, polluted). Some recent converts from paganism cannot separate the meat from its idol associations. When they eat, they feel they are participating in idol worship, and their not-yet-mature conscience is violated.',
   NULL),
  (8, 'But meat commendeth us not to God: for neither, if we eat, are we the better; neither, if we eat not, are we the worse.',
   'βρῶμα δὲ ἡμᾶς οὐ παρίστησιν τῷ θεῷ οὔτε γὰρ ἐὰν φάγωμεν περισσεύομεν οὔτε ἐὰν μὴ φάγωμεν ὑστερούμεθα',
   'brōma de hēmas ou paristēsin tō theō oute gar ean phagōmen perisseuomen oute ean mē phagōmen hysteroumetha',
   '''Commendeth us not'' (ou paristēsin — does not present us, does not bring us near). ''The better'' (perisseuomen — abound, have surplus). ''The worse'' (hysteroumetha — lack, come short). Food is morally neutral in itself — eating idol-meat neither helps nor hurts one''s standing before God. Paul agrees with the ''strong'' on the theology. But the practical application is about to pivot from theology to love.',
   NULL),
  (9, 'But take heed lest by any means this liberty of yours become a stumblingblock to them that are weak.',
   'βλέπετε δὲ μήπως ἡ ἐξουσία ὑμῶν αὕτη πρόσκομμα γένηται τοῖς ἀσθενοῦσιν',
   'blepete de mēpōs hē exousia hymōn hautē proskomma genētai tois asthenousin',
   '''Take heed'' (blepete — watch out, be on guard). ''Liberty'' (exousia — authority, right, freedom to act). ''Stumblingblock'' (proskomma — a stone one trips over, an obstacle that causes a fall). ''Weak'' (asthenousin — those who are weak, feeble). The pivot: correct knowledge grants genuine liberty (exousia), but that liberty must be voluntarily curtailed when it could cause a weaker believer to stumble. Rights must yield to responsibility.',
   NULL),
  (10, 'For if any man see thee which hast knowledge sit at meat in the idol''s temple, shall not the conscience of him which is weak be emboldened to eat those things which are offered to idols;',
   'ἐὰν γάρ τις ἴδῃ σε τὸν ἔχοντα γνῶσιν ἐν εἰδωλείῳ κατακείμενον οὐχὶ ἡ συνείδησις αὐτοῦ ἀσθενοῦς ὄντος οἰκοδομηθήσεται εἰς τὸ τὰ εἰδωλόθυτα ἐσθίειν',
   'ean gar tis idē se ton echonta gnōsin en eidōleiō katakeimenon ouchi hē syneidēsis autou asthenous ontos oikodomēthēsetai eis to ta eidōlothyta esthiein',
   '''Sit at meat in the idol''s temple'' (en eidōleiō katakeimenon — reclining at a banquet in a pagan temple). ''Emboldened'' (oikodomēthēsetai — literally ''built up''; a bitter irony using the same word as v.1''s ''edifieth''). The weaker brother is ''built up'' not in faith but in sin — emboldened to violate his conscience. Paul paints a concrete scenario: a ''knowledgeable'' Christian dining in a pagan temple becomes a stumbling stone for a weaker brother.',
   NULL),
  (11, 'And through thy knowledge shall the weak brother perish, for whom Christ died?',
   'καὶ ἀπολεῖται ὁ ἀσθενῶν ἐπὶ τῇ σῇ γνώσει ὁ ἀδελφὸς δι᾿ ὃν Χριστὸς ἀπέθανεν',
   'kai apoleitai ho asthenōn epi tē sē gnōsei ho adelphos di hon Christos apethanen',
   '''Perish'' (apoleitai — be destroyed, be ruined; present tense: is being destroyed). ''Through thy knowledge'' (epi tē sē gnōsei — because of your knowledge). ''For whom Christ died'' (di hon Christos apethanen — for whose sake Christ died). The devastation: your knowledge is destroying a brother for whom Christ gave his life. The value Christ placed on this person (his own death) should determine how you treat them. Theological correctness that destroys people is demonic, not divine.',
   'This verse reveals the ultimate standard for Christian ethics: the cross. Christ died for this weak brother. If Christ valued this person enough to die for them, the ''strong'' Christian should value them enough to forgo a meal. The verb ''perish'' (apoleitai) is the same used of eternal destruction elsewhere (John 3:16; Romans 2:12), making the warning extremely serious. Knowledge that destroys what Christ died to save is knowledge perverted.'),
  (12, 'But when ye sin so against the brethren, and wound their weak conscience, ye sin against Christ.',
   'οὕτως δὲ ἁμαρτάνοντες εἰς τοὺς ἀδελφοὺς καὶ τύπτοντες αὐτῶν τὴν συνείδησιν ἀσθενοῦσαν εἰς Χριστὸν ἁμαρτάνετε',
   'houtōs de hamartanontes eis tous adelphous kai typtontes autōn tēn syneidēsin asthenousan eis Christon hamartanete',
   '''Sin against the brethren'' (hamartanontes eis tous adelphous — missing the mark toward your brothers). ''Wound'' (typtontes — striking, beating; a violent word for the damage done to a weak conscience). ''Sin against Christ'' (eis Christon hamartanete). The logic: to sin against a brother is to sin against Christ himself, because the brother belongs to Christ (cf. Matthew 25:40, 45). Wounding a fellow believer''s conscience is not a minor social faux pas — it is an offense against Christ.',
   NULL),
  (13, 'Wherefore, if meat make my brother to offend, I will eat no flesh while the world standeth, lest I make my brother to offend.',
   'διόπερ εἰ βρῶμα σκανδαλίζει τὸν ἀδελφόν μου οὐ μὴ φάγω κρέα εἰς τὸν αἰῶνα ἵνα μὴ τὸν ἀδελφόν μου σκανδαλίσω',
   'dioper ei brōma skandalizei ton adelphon mou ou mē phagō krea eis ton aiōna hina mē ton adelphon mou skandalisō',
   '''Offend'' (skandalizei — cause to stumble, ensnare). ''I will eat no flesh'' (ou mē phagō krea — emphatic double negative: I will absolutely never eat meat). ''While the world standeth'' (eis ton aiōna — unto the age, forever). Paul pledges voluntary, permanent self-denial rather than risk destroying a brother. This is not legalism but love. The ''strong'' Christian voluntarily limits liberty out of love for the weak. Paul himself models what he teaches: love trumps rights.',
   'Paul''s personal pledge is the practical outworking of the principle stated in v.1: ''love edifieth.'' He does not merely teach the theory — he embodies it. His willingness to permanently forgo meat demonstrates that Christian liberty is not about asserting rights but about serving others. This sets up the extended argument of chapter 9, where Paul will show how he has consistently waived his apostolic rights for the sake of the gospel.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 8;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 knowledge
  ('γνῶσις', 'gnōsis', 'G1108', 'Knowledge, understanding, intellectual comprehension — from ginōskō (to know). In 1 Corinthians, gnōsis is often used of the Corinthians'' boasted theological sophistication. They ''knew'' that idols were nothing and felt this knowledge entitled them to eat idol-meat without restriction. Paul does not deny the knowledge is correct but insists it must be governed by love (agapē). Knowledge without love is incomplete and destructive.', 1),
  -- v.1 edifieth / builds up
  ('οἰκοδομέω', 'oikodomeō', 'G3618', 'To build, construct, edify — from oikos (house) + domeō (to build). Literally to build a house; metaphorically to strengthen, encourage, and develop others in faith. Love ''builds up'' the community as a builder constructs a dwelling. This architectural metaphor is central to Paul''s ecclesiology: the church is a building under construction (3:9-14), and every action should contribute to its construction, not its demolition.', 2),
  -- v.6 one Lord
  ('κύριος', 'kyrios', 'G2962', 'Lord, master, sovereign — from kyros (authority, power). When Paul places ''one Lord Jesus Christ'' alongside ''one God the Father'' within a reformulated Shema, he includes Christ within the divine identity. Kyrios is the Septuagint translation of YHWH, the covenant name of God. By calling Jesus kyrios in this monotheistic confession, Paul ascribes to Christ the functions and identity of the God of Israel: all things exist ''through him'' (di autou).', 3),
  -- v.7 conscience
  ('συνείδησις', 'syneidēsis', 'G4893', 'Conscience, moral consciousness, inner awareness of right and wrong — from syn (together) + oida (to know). The conscience ''knows with'' the self — it is the faculty of moral self-evaluation. Paul uses syneidēsis 8 times in 1 Corinthians 8-10. A ''weak'' conscience is not necessarily wrong but is insufficiently informed. It must be respected, not overridden, because violating one''s conscience — even on a matter of indifference — is spiritually harmful.', 4),
  -- v.9 stumblingblock
  ('πρόσκομμα', 'proskomma', 'G4348', 'A stumblingblock, an obstacle that causes tripping — from pros (against) + koptō (to strike). Something you bang your foot against. Paul uses it of any action by a ''strong'' believer that causes a ''weak'' believer to act against their conscience. The metaphor is vivid: the strong person''s liberty becomes a stone in the path that trips the weak. Christian freedom must be exercised with awareness of its impact on others.', 5),
  -- v.11 perish
  ('ἀπόλλυμι', 'apollymi', 'G622', 'To destroy, ruin, cause to perish — from apo (from) + ollymi (to destroy). The present tense (apoleitai — is perishing) suggests ongoing spiritual ruin. The same verb is used of eternal perdition (John 3:16) and of the destruction Jesus came to prevent. The ''strong'' Christian''s knowledge is producing the opposite of what Christ''s death was meant to achieve: instead of salvation, destruction. This is the ultimate indictment of loveless liberty.', 6),
  -- v.12 wound
  ('τύπτω', 'typtō', 'G5180', 'To strike, beat, wound — a violent word used of physical blows (Matthew 24:49; Acts 21:32). Paul applies it metaphorically to the damage inflicted on a weak conscience. ''Wounding'' the conscience is not a gentle nudge but a devastating blow. The use of this strong verb reveals how seriously Paul takes conscience violation: it is spiritual violence against a brother, and since the brother belongs to Christ, it is violence against Christ himself.', 7),
  -- v.13 offend / scandalize
  ('σκανδαλίζω', 'skandalizō', 'G4624', 'To cause to stumble, to ensnare, to scandalize — from skandalon (the trigger of a trap). To skandalizō someone is to set a trap that catches them in sin. Paul''s dramatic pledge — to never eat meat again if it would cause a brother to stumble — shows the lengths to which love should go. The skandalon is not merely offense in the emotional sense but causing someone to fall into sin against their conscience.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 8
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 1
    WHEN 3 THEN 6
    WHEN 4 THEN 7
    WHEN 5 THEN 9
    WHEN 6 THEN 11
    WHEN 7 THEN 12
    WHEN 8 THEN 13
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 knowledge puffs up
  (1, '1 Corinthians 13:2', 1),
  (1, '1 Corinthians 13:8', 2),
  -- v.3 known of God
  (3, 'Galatians 4:9', 3),
  (3, '2 Timothy 2:19', 4),
  -- v.4 idol is nothing
  (4, 'Isaiah 44:6-20', 5),
  (4, 'Deuteronomy 6:4', 6),
  -- v.6 one God one Lord
  (6, 'Ephesians 4:5-6', 7),
  (6, 'Colossians 1:16', 8),
  (6, 'John 1:3', 9),
  -- v.7 weak conscience
  (7, 'Romans 14:1-2', 10),
  (7, 'Romans 14:14', 11),
  -- v.8 food does not commend
  (8, 'Romans 14:17', 12),
  -- v.9 stumblingblock
  (9, 'Romans 14:13', 13),
  (9, 'Romans 14:21', 14),
  -- v.10 idol temple
  (10, '1 Corinthians 10:14-22', 15),
  -- v.11 perish for whom Christ died
  (11, 'Romans 14:15', 16),
  (11, 'Romans 14:20', 17),
  -- v.12 sin against Christ
  (12, 'Matthew 25:40', 18),
  (12, 'Matthew 25:45', 19),
  -- v.13 Paul's pledge
  (13, 'Romans 14:21', 20),
  (13, '1 Corinthians 9:12', 21),
  (13, '1 Corinthians 9:19-22', 22)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 8
  AND v.verse_number = cr.verse_number;
