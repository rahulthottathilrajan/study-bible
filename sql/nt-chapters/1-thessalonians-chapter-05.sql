-- ═══════════════════════════════════════════════════
-- 1 THESSALONIANS CHAPTER 5 — The Day of the Lord and Final Exhortations
-- 28 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  '1 Thessalonians 5 completes the eschatological section and closes the epistle with rapid-fire pastoral instructions. Paul first addresses the timing of the Day of the Lord (vv.1-3): it will come ''as a thief in the night,'' suddenly and inescapably. But believers are ''children of light'' and should not be caught unawares (vv.4-8). The ground of confidence is God''s appointment: ''God hath not appointed us to wrath, but to obtain salvation'' through Christ (v.9). Paul then delivers a volley of concise exhortations covering community life (vv.12-15), personal devotion (vv.16-18 — ''rejoice evermore, pray without ceasing, in every thing give thanks''), and congregational worship (vv.19-22). The epistle climaxes with a majestic benediction-prayer: ''the very God of peace sanctify you wholly; and I pray God your whole spirit and soul and body be preserved blameless unto the coming of our Lord Jesus Christ'' (v.23), followed by the assurance that ''faithful is he that calleth you, who also will do it'' (v.24).',
  'Watchfulness, Holiness, and the God Who Completes',
  'νήφωμεν (nēphōmen)',
  'Let us be sober, let us be watchful — from nēphō, to be sober, to be self-controlled and alert. The opposite of spiritual drunkenness or sleep. Believers live with clear-headed awareness of the coming Day.',
  '["The Day of the Lord: Sudden Destruction (vv.1-3): Of the times and seasons ye have no need; the day of the Lord cometh as a thief in the night; sudden destruction cometh upon them; they shall not escape","Children of Light: Watch and Be Sober (vv.4-8): Ye are not in darkness; ye are all the children of light; let us not sleep; let us watch and be sober; putting on the breastplate of faith and love and the helmet of hope","Appointed to Salvation, Not Wrath (vv.9-11): God hath not appointed us to wrath but to obtain salvation; whether we wake or sleep we should live together with him; comfort and edify one another","Community Instructions (vv.12-15): Know them which labour among you; esteem them highly in love; be at peace; warn the unruly; comfort the feebleminded; support the weak; be patient; see that none render evil for evil","Personal Devotion (vv.16-18): Rejoice evermore; pray without ceasing; in every thing give thanks; this is the will of God in Christ Jesus concerning you","Congregational Worship (vv.19-22): Quench not the Spirit; despise not prophesyings; prove all things; hold fast that which is good; abstain from all appearance of evil","Closing Benediction (vv.23-28): The God of peace sanctify you wholly; spirit, soul, and body preserved blameless; faithful is he that calleth you; pray for us; greet all the brethren; this epistle be read unto all"]'
FROM books b WHERE b.name = '1 Thessalonians';

-- Step 2: Insert all 28 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'But of the times and the seasons, brethren, ye have no need that I write unto you.',
   'Περὶ δὲ τῶν χρόνων καὶ τῶν καιρῶν ἀδελφοί οὐ χρείαν ἔχετε ὑμῖν γράφεσθαι',
   'Peri de tōn chronōn kai tōn kairōn adelphoi ou chreian echete hymin graphesthai',
   '''Times'' (chronōn — durations, lengths of time, chronological periods) and ''seasons'' (kairōn — epochs, significant moments, decisive occasions). Two different words for time: chronos is clock-time; kairos is opportunity-time. Paul does not need to write about the schedule because Jesus already taught it: the time is unknown, but the event is certain (cf. Acts 1:7, which uses the same pair of words).',
   NULL),
  (2,
   'For yourselves know perfectly that the day of the Lord so cometh as a thief in the night.',
   'αὐτοὶ γὰρ ἀκριβῶς οἴδατε ὅτι ἡμέρα κυρίου ὡς κλέπτης ἐν νυκτὶ οὕτως ἔρχεται',
   'autoi gar akribōs oidate hoti hēmera kyriou hōs kleptēs en nykti houtōs erchetai',
   '''Perfectly'' (akribōs — accurately, precisely, exactly). ''The day of the Lord'' (hēmera kyriou — a major OT concept: the day when God intervenes decisively in history; cf. Isa 13:6; Joel 2:1; Amos 5:18). ''As a thief in the night'' (hōs kleptēs en nykti) — Jesus Himself used this image (Matt 24:43; Rev 3:3; 16:15). The thief comes unexpectedly, without warning, at the least anticipated moment. The point is not stealth but surprise.',
   NULL),
  (3,
   'For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape.',
   'ὅταν λέγωσιν Εἰρήνη καὶ ἀσφάλεια τότε αἰφνίδιος αὐτοῖς ἐφίσταται ὄλεθρος ὥσπερ ἡ ὠδὶν τῇ ἐν γαστρὶ ἐχούσῃ καὶ οὐ μὴ ἐκφύγωσιν',
   'hotan legōsin Eirēnē kai asphaleia tote aiphnidios autois ephistatai olethros hōsper hē ōdin tē en gastri echousē kai ou mē ekphygōsin',
   '''Peace and safety'' (eirēnē kai asphaleia — security and stability; the world''s false sense of well-being). ''Sudden destruction'' (aiphnidios olethros — unexpected ruin, instantaneous catastrophe). ''As travail upon a woman with child'' (hōsper hē ōdin — like birth pangs; two points: (1) the onset is sudden, (2) once begun, it cannot be stopped or reversed). ''They shall not escape'' (ou mē ekphygōsin — strongest possible negation: there is absolutely no escape). The pronoun shifts: ''they'' — unbelievers, not ''we'' — believers.',
   NULL),
  (4,
   'But ye, brethren, are not in darkness, that that day should overtake you as a thief.',
   'ὑμεῖς δέ ἀδελφοί οὐκ ἐστὲ ἐν σκότει ἵνα ἡ ἡμέρα ὑμᾶς ὡς κλέπτης καταλάβῃ',
   'hymeis de adelphoi ouk este en skotei hina hē hēmera hymas hōs kleptēs katalabē',
   'Sharp contrast: ''but ye'' (hymeis de — emphatic). Believers are ''not in darkness'' (ouk este en skotei — you do not belong to the realm of darkness). The Day comes as a thief only upon those in darkness. For believers who are watching, it will not be a surprise. ''Overtake'' (katalabē — seize, lay hold of, catch unprepared). The thief-image does not apply to the church in the same way — the Day will not catch informed, watchful believers off guard.',
   NULL),
  (5,
   'Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness.',
   'πάντες γὰρ ὑμεῖς υἱοὶ φωτός ἐστε καὶ υἱοὶ ἡμέρας οὐκ ἐσμὲν νυκτὸς οὐδὲ σκότους',
   'pantes gar hymeis huioi phōtos este kai huioi hēmeras ouk esmen nyktos oude skotous',
   '''Children of light'' (huioi phōtos — sons of light, those who belong to the light, whose very nature is light). ''Children of the day'' (huioi hēmeras — sons of the day, those who belong to the coming Day). The Semitic idiom ''sons of'' denotes character and belonging. ''We are not of the night nor of darkness'' — note the shift from ''ye'' to ''we'': Paul includes himself. Two realms exist: light/day and darkness/night. Believers belong wholly to the first.',
   NULL),
  (6,
   'Therefore let us not sleep, as do others; but let us watch and be sober.',
   'ἄρα οὖν μὴ καθεύδωμεν ὡς οἱ λοιποί ἀλλὰ γρηγορῶμεν καὶ νήφωμεν',
   'ara oun mē katheudōmen hōs hoi loipoi alla grēgorōmen kai nēphōmen',
   '''Sleep'' (katheudōmen — be sleeping, be drowsy; spiritual slumber, not physical rest). ''Others'' (hoi loipoi — the rest, the same group as ''they'' in v.3). ''Watch'' (grēgorōmen — be wakeful, be vigilant, stay alert; present subjunctive: let us keep on watching). ''Be sober'' (nēphōmen — be self-controlled, clear-headed, free from intoxication; present subjunctive: let us maintain ongoing sobriety). Watching is the antidote to surprise; sobriety is the antidote to deception.',
   NULL),
  (7,
   'For they that sleep sleep in the night; and they that be drunken are drunken in the night.',
   'οἱ γὰρ καθεύδοντες νυκτὸς καθεύδουσιν καὶ οἱ μεθυσκόμενοι νυκτὸς μεθύουσιν',
   'hoi gar katheudontesn yktos katheudonsin kai hoi methyskomenoi nyktos methousin',
   'Sleep and drunkenness belong to the night — they are characteristic behaviours of darkness. Paul uses a common observation (people sleep and drink at night) as a spiritual metaphor. The unbelieving world is spiritually asleep and morally intoxicated. Believers, as children of the day, should exhibit neither spiritual drowsiness nor moral excess.',
   NULL),
  (8,
   'But let us, who are of the day, be sober, putting on the breastplate of faith and love; and for an helmet, the hope of salvation.',
   'ἡμεῖς δὲ ἡμέρας ὄντες νήφωμεν ἐνδυσάμενοι θώρακα πίστεως καὶ ἀγάπης καὶ περικεφαλαίαν ἐλπίδα σωτηρίας',
   'hēmeis de hēmeras ontes nēphōmen endysamenoi thōraka pisteōs kai agapēs kai perikephalaian elpida sōtērias',
   'The great triad of 1:3 returns as armour: ''faith and love'' form the ''breastplate'' (thōraka — chest armour, protecting the heart), and ''hope of salvation'' is the ''helmet'' (perikephalaian — head covering, protecting the mind). Cf. the fuller armour in Eph 6:13-17, which draws from Isa 59:17. The Christian life is a battle requiring full armour. Faith protects the heart, love guards relationships, hope shields the mind from despair.',
   NULL),
  (9,
   'For God hath not appointed us to wrath, but to obtain salvation by our Lord Jesus Christ,',
   'ὅτι οὐκ ἔθετο ἡμᾶς ὁ θεὸς εἰς ὀργὴν ἀλλ᾽ εἰς περιποίησιν σωτηρίας διὰ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'hoti ouk etheto hēmas ho theos eis orgēn all'' eis peripoiēsin sōtērias dia tou kyriou hēmōn Iēsou Christou',
   '''Appointed'' (etheto — placed, set, destined; aorist: a past, settled decision by God). ''Not to wrath'' (ouk eis orgēn — not for wrath). ''But to obtain salvation'' (eis peripoiēsin sōtērias — for the acquiring/obtaining of salvation; peripoiēsis means acquisition, possession, something gained). The believer''s destiny is not the wrath of the Day of the Lord but the salvation accomplished by Christ. This echoes 1:10 (''delivered us from the wrath to come'') and forms the doctrinal basis for the comfort of 4:18.',
   'Believers and the wrath to come: This verse explicitly states that God has not destined believers for wrath. The ''wrath'' in context is the eschatological wrath of the Day of the Lord (vv.2-3). Combined with 1:10 and 4:13-18, this forms the strongest Pauline argument that believers will be removed before the outpouring of divine judgment. God''s appointment determines destiny: wrath for unbelievers, salvation for those in Christ.'),
  (10,
   'Who died for us, that, whether we wake or sleep, we should live together with him.',
   'τοῦ ἀποθανόντος ὑπὲρ ἡμῶν ἵνα εἴτε γρηγορῶμεν εἴτε καθεύδωμεν ἅμα σὺν αὐτῷ ζήσωμεν',
   'tou apothanontos hyper hēmōn hina eite grēgorōmen eite katheudōmen hama syn autō zēsōmen',
   '''Died for us'' (apothanontos hyper hēmōn — the one who died on our behalf; the foundation of all Christian hope is the substitutionary death of Christ). ''Whether we wake or sleep'' (eite grēgorōmen eite katheudōmen) — here ''wake'' and ''sleep'' likely refer to being alive or dead at Christ''s coming (cf. 4:15-17). Whether believers are living or deceased at the Parousia, the result is the same: ''we should live together with him'' (hama syn autō zēsōmen — simultaneously, together, with Him we shall live). Death cannot separate us from Christ.',
   NULL),
  (11,
   'Wherefore comfort yourselves together, and edify one another, even as also ye do.',
   'Διὸ παρακαλεῖτε ἀλλήλους καὶ οἰκοδομεῖτε εἷς τὸν ἕνα καθὼς καὶ ποιεῖτε',
   'Dio parakaleite allēlous kai oikodomeite heis ton hena kathōs kai poieite',
   '''Comfort'' (parakaleite — encourage, console; cf. 4:18). ''Edify'' (oikodomeite — build up, construct; from oikos + domeō, to build a house). ''One another'' (heis ton hena — each one the other, person to person). Encouragement and edification are mutual responsibilities, not merely the pastor''s job. ''Even as also ye do'' (kathōs kai poieite) — Paul affirms they are already doing this. The Christian community is a construction site where everyone is both builder and being built.',
   NULL),
  (12,
   'And we beseech you, brethren, to know them which labour among you, and are over you in the Lord, and admonish you;',
   'Ἐρωτῶμεν δὲ ὑμᾶς ἀδελφοί εἰδέναι τοὺς κοπιῶντας ἐν ὑμῖν καὶ προϊσταμένους ὑμῶν ἐν κυρίῳ καὶ νουθετοῦντας ὑμᾶς',
   'Erōtōmen de hymas adelphoi eidenai tous kopiōntas en hymin kai proistamenous hymōn en kyriō kai nouthetountas hymas',
   '''Know'' (eidenai — recognise, appreciate, respect). Three descriptions of church leaders: (1) ''them which labour'' (tous kopiōntas — those who toil to exhaustion), (2) ''are over you in the Lord'' (proistamenous — those who stand before you, lead, manage; with the qualifier ''in the Lord'' — their authority is derived, not inherent), (3) ''admonish you'' (nouthetountas — those who put sense into your minds, who counsel and correct; from nous + tithēmi, to place in the mind). Leaders deserve recognition because their work is exhausting.',
   NULL),
  (13,
   'And to esteem them very highly in love for their work''s sake. And be at peace among yourselves.',
   'καὶ ἡγεῖσθαι αὐτοὺς ὑπερεκπερισσοῦ ἐν ἀγάπῃ διὰ τὸ ἔργον αὐτῶν εἰρηνεύετε ἐν ἑαυτοῖς',
   'kai hēgeisthai autous hyperekperissou en agapē dia to ergon autōn eirēneuete en heautois',
   '''Esteem them very highly'' (hēgeisthai hyperekperissou — regard them super-abundantly; the same triple-compound adverb from 3:10). The basis: ''for their work''s sake'' (dia to ergon — because of what they do, not because of their personality or position). ''Be at peace among yourselves'' (eirēneuete en heautois — maintain peace within the community). Church conflict often arises from failure to respect leaders or from leaders who fail to serve.',
   NULL),
  (14,
   'Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men.',
   'Παρακαλοῦμεν δὲ ὑμᾶς ἀδελφοί νουθετεῖτε τοὺς ἀτάκτους παραμυθεῖσθε τοὺς ὀλιγοψύχους ἀντέχεσθε τῶν ἀσθενῶν μακροθυμεῖτε πρὸς πάντας',
   'Parakaloumen de hymas adelphoi noutheteite tous ataktous paramytheisthe tous oligopsychous antechesthe tōn asthenōn makrothymeite pros pantas',
   'Four pastoral commands requiring discernment — each person needs a different response: (1) ''warn the unruly'' (noutheteite tous ataktous — admonish the disorderly; ataktos is a military term for soldiers out of rank, those who break formation), (2) ''comfort the feebleminded'' (paramytheisthe tous oligopsychous — encourage the faint-hearted, the small-souled, those whose spirits are crushed), (3) ''support the weak'' (antechesthe tōn asthenōn — hold firmly to the weak, cling to them, do not let them go), (4) ''be patient toward all'' (makrothymeite pros pantas — be long-tempered with everyone).',
   NULL),
  (15,
   'See that none render evil for evil unto any man; but ever follow that which is good, both among yourselves, and to all men.',
   'ὁρᾶτε μή τις κακὸν ἀντὶ κακοῦ τινι ἀποδῷ ἀλλὰ πάντοτε τὸ ἀγαθὸν διώκετε καὶ εἰς ἀλλήλους καὶ εἰς πάντας',
   'horate mē tis kakon anti kakou tini apodō alla pantote to agathon diōkete kai eis allēlous kai eis pantas',
   '''See'' (horate — watch, be vigilant; present imperative: keep on watching). ''Render evil for evil'' (kakon anti kakou — evil in exchange for evil; the tit-for-tat principle of natural justice). ''Follow'' (diōkete — pursue, chase, hunt down; present imperative: keep on pursuing). The same verb used for persecution (diōkō) is here redirected: instead of pursuing revenge, pursue good. The scope: ''both among yourselves and to all men'' — toward Christians and non-Christians alike.',
   NULL),
  (16,
   'Rejoice evermore.',
   'Πάντοτε χαίρετε',
   'Pantote chairete',
   '''Rejoice'' (chairete — be glad, rejoice; present imperative: keep on rejoicing). ''Evermore'' (pantote — always, at all times, without exception). The shortest verse in the Greek NT (two words). Joy is not a feeling contingent on circumstances but a command — an attitude of trust in God''s sovereign goodness regardless of outward conditions. Written by a man under pressure and opposition (2:2; 3:7), making the command all the more striking.',
   NULL),
  (17,
   'Pray without ceasing.',
   'ἀδιαλείπτως προσεύχεσθε',
   'adialeiptōs proseuchesthe',
   '''Without ceasing'' (adialeiptōs — unceasingly, without interruption; the same word used in 1:3 and 2:13 for continual thanksgiving). ''Pray'' (proseuchesthe — keep on praying; present imperative). Not that one must be on one''s knees twenty-four hours a day, but that prayer should be the constant atmosphere of the believer''s life — a running conversation with God that underlies all activity. Like breathing, prayer should be continuous and natural.',
   NULL),
  (18,
   'In every thing give thanks: for this is the will of God in Christ Jesus concerning you.',
   'ἐν παντὶ εὐχαριστεῖτε τοῦτο γὰρ θέλημα θεοῦ ἐν Χριστῷ Ἰησοῦ εἰς ὑμᾶς',
   'en panti eucharisteite touto gar thelēma theou en Christō Iēsou eis hymas',
   '''In every thing'' (en panti — in every situation, in all circumstances). ''Give thanks'' (eucharisteite — be thankful; present imperative: maintain thanksgiving as a habit). ''This is the will of God'' (touto thelēma theou — cf. 4:3 for the first statement of God''s will: sanctification; here the second: thanksgiving). ''In Christ Jesus'' — thanksgiving is possible because of our position in Christ. Even suffering can be received with thanks because God works all things for good (Rom 8:28). Verses 16-18 form a triad: rejoice, pray, give thanks — the three pillars of the devotional life.',
   'The will of God: Two explicit statements of God''s will in this epistle — (1) your sanctification (4:3), and (2) thanksgiving in every situation (5:18). Together they show that God''s will is not mysterious but clearly revealed: be holy and be thankful.'),
  (19,
   'Quench not the Spirit.',
   'τὸ πνεῦμα μὴ σβέννυτε',
   'to pneuma mē sbennyte',
   '''Quench'' (sbennyte — extinguish, put out, suppress; present imperative with negation: stop quenching, or do not make a habit of quenching). The Spirit is compared to fire (cf. Acts 2:3; 2 Tim 1:6). Fire can be quenched — smothered, doused. The Spirit''s work in the congregation can be suppressed by rigid formalism, fear of the supernatural, or rejection of His gifts. This does not mean the Spirit leaves, but His manifest work is hindered.',
   NULL),
  (20,
   'Despise not prophesyings.',
   'προφητείας μὴ ἐξουθενεῖτε',
   'prophēteias mē exoutheneite',
   '''Despise'' (exoutheneite — treat as nothing, regard with contempt, set at zero; from ex + outhen, out of nothing). ''Prophesyings'' (prophēteias — prophecies, prophetic utterances, Spirit-inspired messages). Some in Thessalonica apparently looked down on prophetic speech, perhaps preferring other gifts or fearing excess. Paul''s response: do not dismiss prophecy, but test it (v.21). The corrective for abuse is not prohibition but proper evaluation.',
   NULL),
  (21,
   'Prove all things; hold fast that which is good.',
   'πάντα δοκιμάζετε τὸ καλὸν κατέχετε',
   'panta dokimazete to kalon katechete',
   '''Prove'' (dokimazete — test, examine, assay; the same root as 2:4 where God ''tries'' hearts). ''All things'' (panta — everything, not just prophecies but all teaching and claims). ''Hold fast'' (katechete — grip tightly, retain, do not let go). ''Good'' (kalon — good, noble, excellent). Two actions: test everything (don''t accept uncritically) and hold fast what passes the test (don''t discard the genuine). This is the balanced approach: neither gullibility nor cynicism.',
   NULL),
  (22,
   'Abstain from all appearance of evil.',
   'ἀπὸ παντὸς εἴδους πονηροῦ ἀπέχεσθε',
   'apo pantos eidous ponērou apechesthe',
   '''Abstain'' (apechesthe — hold yourself away from, keep at a distance; present imperative: make this your continuous practice). ''Appearance'' (eidous — form, kind, species, sort; not merely ''what looks evil'' but ''every form/type of evil''). ''Evil'' (ponērou — wicked, malicious, actively harmful). The command is comprehensive: stay away from every variety of evil, whatever shape it takes. This is the negative counterpart to ''hold fast that which is good.''',
   NULL),
  (23,
   'And the very God of peace sanctify you wholly; and I pray God your whole spirit and soul and body be preserved blameless unto the coming of our Lord Jesus Christ.',
   'Αὐτὸς δὲ ὁ θεὸς τῆς εἰρήνης ἁγιάσαι ὑμᾶς ὁλοτελεῖς καὶ ὁλόκληρον ὑμῶν τὸ πνεῦμα καὶ ἡ ψυχὴ καὶ τὸ σῶμα ἀμέμπτως ἐν τῇ παρουσίᾳ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ τηρηθείη',
   'Autos de ho theos tēs eirēnēs hagiasai hymas holoteleis kai holoklēron hymōn to pneuma kai hē psychē kai to sōma amemptōs en tē parousia tou kyriou hēmōn Iēsou Christou tērētheiē',
   '''The very God of peace'' (autos ho theos tēs eirēnēs — He Himself, the God who is characterised by peace). ''Sanctify you wholly'' (hagiasai hymas holoteleis — sanctify you completely, through and through; holoteleis is found only here in the NT, from holos + telos: whole + end, complete to the uttermost). ''Spirit and soul and body'' (to pneuma kai hē psychē kai to sōma) — the whole person, viewed from three aspects: spirit (the God-conscious part), soul (the self-conscious part: mind, will, emotions), body (the world-conscious part). ''Preserved blameless'' (amemptōs tērētheiē — kept without blame; optative mood: a prayer-wish). ''Unto the coming'' (en tē parousia — the fourth and final use of parousia in the epistle).',
   'Sanctification is God''s work: Though Paul has commanded holiness throughout the letter, here he prays that God Himself would accomplish it. Sanctification is both human responsibility (4:3-7) and divine gift (5:23-24). The God who commands holiness is the God who produces it. The tripartite description (spirit, soul, body) shows that sanctification touches every dimension of human existence — nothing is excluded.'),
  (24,
   'Faithful is he that calleth you, who also will do it.',
   'πιστὸς ὁ καλῶν ὑμᾶς ὃς καὶ ποιήσει',
   'pistos ho kalōn hymas hos kai poiēsei',
   '''Faithful'' (pistos — trustworthy, reliable, dependable). ''He that calleth you'' (ho kalōn — the one calling; present participle: God''s call is ongoing, not a one-time past event). ''Who also will do it'' (hos kai poiēsei — who will also accomplish it; future tense: certain promise). The assurance that grounds the prayer: the God who calls is faithful to complete what He begins. Sanctification will be accomplished not because of human willpower but because of divine faithfulness.',
   'The perseverance of the saints: God''s faithfulness guarantees the completion of His work. He who began the good work will complete it (Phil 1:6). This verse is the ultimate assurance: the sanctification Paul prays for (v.23) will be accomplished because the Caller is faithful. Human effort cooperates, but divine faithfulness secures the result.'),
  (25,
   'Brethren, pray for us.',
   'Ἀδελφοί προσεύχεσθε περὶ ἡμῶν',
   'Adelphoi proseuchesthe peri hēmōn',
   'Paul, the great prayer warrior, asks for prayer. The apostle does not consider himself above the need for the congregation''s intercession. ''Pray for us'' (proseuchesthe peri hēmōn — keep praying concerning us). Ministry is not a solo enterprise; it depends on the prayer support of the church. The request is brief but reveals Paul''s humility and his conviction that prayer is effectual.',
   NULL),
  (26,
   'Greet all the brethren with an holy kiss.',
   'Ἀσπάσασθε τοὺς ἀδελφοὺς πάντας ἐν φιλήματι ἁγίῳ',
   'Aspasasthe tous adelphous pantas en philēmati hagiō',
   '''Holy kiss'' (philēmati hagiō) — a common greeting in the ancient world, adopted by the early church as a sign of fellowship and mutual acceptance. ''Holy'' distinguishes it from romantic or social kisses — it is pure, familial affection within the body of Christ. ''All'' (pantas) — no one is to be excluded. This instruction appears in four of Paul''s letters (Rom 16:16; 1 Cor 16:20; 2 Cor 13:12).',
   NULL),
  (27,
   'I charge you by the Lord that this epistle be read unto all the holy brethren.',
   'ἐνορκίζω ὑμᾶς τὸν κύριον ἀναγνωσθῆναι τὴν ἐπιστολὴν πᾶσιν τοῖς ἁγίοις ἀδελφοῖς',
   'enorkizō hymas ton kyrion anagnōsthēnai tēn epistolēn pasin tois hagiois adelphois',
   '''I charge you'' (enorkizō — I adjure you, I put you under oath; an unusually strong term, found only here in Paul). ''By the Lord'' (ton kyrion — invoking the Lord''s authority). ''Read unto all'' (anagnōsthēnai pasin — be read aloud to everyone). This solemn command suggests Paul feared the letter might be kept from some members, perhaps those who were idle (4:11) or who disagreed with his teaching. Every believer must hear the apostolic word. This also shows Paul regarded his letter as authoritative Scripture to be read in public worship.',
   NULL),
  (28,
   'The grace of our Lord Jesus Christ be with you. Amen.',
   'Ἡ χάρις τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ μεθ᾽ ὑμῶν ἀμήν',
   'Hē charis tou kyriou hēmōn Iēsou Christou meth'' hymōn amēn',
   '''Grace'' (charis) — the epistle begins with grace (1:1) and ends with grace (5:28). The entire Christian life is bracketed by grace. ''Be with you'' (meth'' hymōn — accompanying you, present with you). ''Amen'' (amēn — so be it, truly, may it be so). Paul''s shortest closing benediction, but carrying the full weight of the gospel: the unmerited favour of the Lord Jesus Christ is the believer''s constant companion.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 2 (Day of the Lord as a thief)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κλέπτης', 'kleptēs', 'G2812', 'Thief — one who comes unexpectedly and without warning. The image emphasises surprise, not stealth or evil. Jesus Himself used this metaphor (Matt 24:43; Rev 3:3).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = 2;

-- Verse 6 (Watch and be sober)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γρηγορῶμεν', 'grēgorōmen', 'G1127', 'Let us watch, be vigilant, stay awake — from egeirō (to rouse). Spiritual alertness, the opposite of the drowsy complacency that characterises the world.', 1),
  ('νήφωμεν', 'nēphōmen', 'G3525', 'Let us be sober, self-controlled — originally to abstain from wine, then metaphorically to be clear-headed, free from every form of mental and spiritual intoxication.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = 6;

-- Verse 9 (Not appointed to wrath)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἔθετο', 'etheto', 'G5087', 'Appointed, set, placed — aorist middle: God Himself placed us, designated us for a specific destiny. A sovereign, past, decisive act of God determining the believer''s future.', 1),
  ('περιποίησιν', 'peripoiēsin', 'G4047', 'Obtaining, acquiring, gaining possession of — from peri (around) + poieō (to make). The gaining of salvation as a personal possession. Believers are destined to possess salvation, not experience wrath.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = 9;

-- Verse 14 (Warn, comfort, support)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀτάκτους', 'ataktous', 'G813', 'Unruly, disorderly, out of rank — a military term for soldiers who break formation or desert their post. In Thessalonica, this meant those who quit working in light of Christ''s expected return.', 1),
  ('ὀλιγοψύχους', 'oligopsychous', 'G3642', 'Fainthearted, small-souled, timid — from oligos (small) + psychē (soul). Those who lack courage, whose spirits are crushed by circumstances. They need encouragement, not rebuke.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = 14;

-- Verse 23 (Sanctify wholly)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁλοτελεῖς', 'holoteleis', 'G3651', 'Wholly, completely, through and through — from holos (whole) + telos (end, completion). Found only here in the NT. Sanctification that reaches every part, leaving nothing untouched.', 1),
  ('ὁλόκληρον', 'holoklēron', 'G3648', 'Complete, entire, whole in every part — from holos (whole) + klēros (lot, portion). Every part intact, nothing missing. The whole person — spirit, soul, body — preserved complete.', 2),
  ('τηρηθείη', 'tērētheiē', 'G5083', 'May be preserved, kept, guarded — optative mood (prayer-wish): may God keep you. The same verb used for keeping commands and guarding prisoners. God guards the whole person until Christ''s coming.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = 23;

-- Verse 24 (Faithful is He)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πιστός', 'pistos', 'G4103', 'Faithful, trustworthy, reliable — God''s defining attribute in relation to His promises. He cannot fail, He cannot lie, He cannot abandon what He has begun. The ground of all assurance.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = 24;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Day of the Lord as thief
  (2, 'Matthew 24:43-44', 1), (2, '2 Peter 3:10', 2), (2, 'Revelation 16:15', 3),
  -- v3: Sudden destruction
  (3, 'Luke 21:34-35', 1), (3, 'Isaiah 13:6-8', 2), (3, 'Jeremiah 6:14', 3),
  -- v5: Children of light
  (5, 'Ephesians 5:8', 1), (5, 'John 12:36', 2), (5, 'Romans 13:12', 3),
  -- v8: Armour of faith, love, hope
  (8, 'Ephesians 6:13-17', 1), (8, 'Isaiah 59:17', 2), (8, '1 Thessalonians 1:3', 3),
  -- v9: Not appointed to wrath
  (9, '1 Thessalonians 1:10', 1), (9, 'Romans 5:9', 2), (9, 'Romans 8:1', 3),
  -- v10: Whether we wake or sleep
  (10, 'Romans 14:8-9', 1), (10, '2 Corinthians 5:15', 2), (10, '1 Thessalonians 4:17', 3),
  -- v14: Warn the unruly
  (14, '2 Thessalonians 3:6-12', 1), (14, 'Galatians 6:1-2', 2), (14, 'Romans 15:1', 3),
  -- v15: Render not evil for evil
  (15, 'Romans 12:17-21', 1), (15, '1 Peter 3:9', 2), (15, 'Matthew 5:44', 3),
  -- v16-18: Rejoice, pray, give thanks
  (16, 'Philippians 4:4', 1), (16, 'Philippians 3:1', 2),
  (17, 'Ephesians 6:18', 1), (17, 'Luke 18:1', 2), (17, 'Colossians 4:2', 3),
  (18, 'Ephesians 5:20', 1), (18, 'Colossians 3:17', 2),
  -- v19: Quench not the Spirit
  (19, 'Ephesians 4:30', 1), (19, '2 Timothy 1:6', 2), (19, 'Acts 2:3-4', 3),
  -- v21: Prove all things
  (21, '1 John 4:1', 1), (21, 'Acts 17:11', 2), (21, '1 Corinthians 14:29', 3),
  -- v23: Sanctify wholly
  (23, '1 Thessalonians 3:13', 1), (23, 'Hebrews 13:20-21', 2), (23, 'Philippians 1:6', 3),
  -- v24: Faithful is He
  (24, '1 Corinthians 1:9', 1), (24, '2 Thessalonians 3:3', 2), (24, '2 Timothy 2:13', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Thessalonians Chapter 5 Complete
-- 28 verses · 7 key verses with word studies (14 words)
-- Cross-references for 17 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════