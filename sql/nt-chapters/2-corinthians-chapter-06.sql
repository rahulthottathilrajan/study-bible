-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 6 — Approved Ministers and Separation
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  '2 Corinthians 6 divides into two striking sections: Paul''s self-commendation as a genuine minister of God, and the call to separation from unbelief. Paul urges the Corinthians to receive God''s grace in its fullness: ''We then, as workers together with him, beseech you also that ye receive not the grace of God in vain'' (v.1). He quotes Isaiah: ''now is the accepted time; behold, now is the day of salvation'' (v.2). Paul then presents his most comprehensive catalog of apostolic credentials — not letters of recommendation but suffering, character, and paradox: ''in much patience, in afflictions, in necessities, in distresses, in stripes, in imprisonments, in tumults, in labours, in watchings, in fastings'' (vv.4-5), ''by pureness, by knowledge, by longsuffering, by kindness, by the Holy Ghost, by love unfeigned'' (v.6), culminating in the magnificent paradoxes: ''as unknown, and yet well known; as dying, and, behold, we live; as chastened, and not killed; as sorrowful, yet alway rejoicing; as poor, yet making many rich; as having nothing, and yet possessing all things'' (vv.9-10). Paul then makes an emotional appeal: ''O ye Corinthians, our mouth is open unto you, our heart is enlarged'' (v.11). The chapter shifts to the famous call to separation: ''Be ye not unequally yoked together with unbelievers'' (v.14), grounding the command in the incompatibility of righteousness with unrighteousness, light with darkness, Christ with Belial, the temple of God with idols. ''For ye are the temple of the living God'' (v.16).',
  'Apostolic Credentials and Holy Separation',
  'συνεργέω (synergeō)',
  'To work together — from syn (together) + ergon (work). Paul is a co-worker with God, not an independent contractor. The ministry of reconciliation (5:18-20) makes the apostle a collaborator with God''s saving purposes. This co-working does not make Paul God''s equal but his empowered servant.',
  '["Do Not Receive Grace in Vain (vv.1-2): We then as workers together with him beseech you also that ye receive not the grace of God in vain for he saith I have heard thee in a time accepted and in the day of salvation have I succoured thee behold now is the accepted time behold now is the day of salvation","The Commendation of True Ministry (vv.3-10): Giving no offence in any thing that the ministry be not blamed but in all things approving ourselves as the ministers of God in much patience in afflictions in necessities in distresses in stripes in imprisonments in tumults in labours in watchings in fastings by pureness by knowledge by longsuffering by kindness by the Holy Ghost by love unfeigned by the word of truth by the power of God by the armour of righteousness on the right hand and on the left; as unknown and yet well known as dying and behold we live as chastened and not killed as sorrowful yet alway rejoicing as poor yet making many rich as having nothing and yet possessing all things","Open Hearts and the Appeal for Reciprocity (vv.11-13): O ye Corinthians our mouth is open unto you our heart is enlarged ye are not straitened in us but ye are straitened in your own bowels now for a recompence in the same I speak as unto my children be ye also enlarged","Separation from Unbelievers and the Temple of the Living God (vv.14-18): Be ye not unequally yoked together with unbelievers for what fellowship hath righteousness with unrighteousness and what communion hath light with darkness and what concord hath Christ with Belial or what part hath he that believeth with an infidel and what agreement hath the temple of God with idols for ye are the temple of the living God as God hath said I will dwell in them and walk in them and I will be their God and they shall be my people wherefore come out from among them and be ye separate saith the Lord and touch not the unclean thing and I will receive you and will be a Father unto you and ye shall be my sons and daughters saith the Lord Almighty"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'We then, as workers together with him, beseech you also that ye receive not the grace of God in vain.',
   'Συνεργοῦντες δὲ καὶ παρακαλοῦμεν μὴ εἰς κενὸν τὴν χάριν τοῦ θεοῦ δέξασθαι ὑμᾶς',
   'Synergountes de kai parakaloumen mē eis kenon tēn charin tou theou dexasthai hymas',
   '''Workers together'' (synergountes — co-working; present participle: continually collaborating with God). ''Beseech'' (parakaloumen — we urge, we appeal). ''In vain'' (eis kenon — into emptiness, to no purpose). Grace received but not responded to becomes fruitless. Paul fears the Corinthians may have received the gospel (God''s grace in reconciliation, 5:18-21) without allowing it to produce its intended transformation. Grace demands response.',
   NULL),
  (2, '(For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.)',
   'λέγει γάρ καιρῷ δεκτῷ ἐπήκουσά σου καὶ ἐν ἡμέρᾳ σωτηρίας ἐβοήθησά σοι ἰδοὺ νῦν καιρὸς εὐπρόσδεκτος ἰδοὺ νῦν ἡμέρα σωτηρίας',
   'legei gar kairō dektō epēkousa sou kai en hēmera sōtērias eboēthēsa soi idou nyn kairos euprosdektos idou nyn hēmera sōtērias',
   'Paul quotes Isaiah 49:8 (LXX) — originally God''s promise to the Servant of the Lord. ''Accepted time'' (kairō dektō — a favorable season). ''Day of salvation'' (hēmera sōtērias). Paul''s application: the messianic ''accepted time'' is NOW — the present moment is the day of salvation. The double ''behold, now'' (idou nyn) creates urgency. Isaiah''s prophecy has been fulfilled in the gospel era; every moment of gospel preaching is a kairos — a divinely appointed opportunity.',
   NULL),
  (3, 'Giving no offence in any thing, that the ministry be not blamed:',
   'μηδεμίαν ἐν μηδενὶ διδόντες προσκοπήν ἵνα μὴ μωμηθῇ ἡ διακονία',
   'mēdemian en mēdeni didontes proskopēn hina mē mōmēthē hē diakonia',
   '''Offence'' (proskopēn — a stumbling block, an occasion for criticism). ''Blamed'' (mōmēthē — found fault with, discredited). Paul takes care that nothing in his behavior gives people a reason to dismiss the gospel. The ministry itself — not just the minister — is at stake. Personal conduct either commends or discredits the message.',
   NULL),
  (4, 'But in all things approving ourselves as the ministers of God, in much patience, in afflictions, in necessities, in distresses,',
   'ἀλλ᾿ ἐν παντὶ συνιστῶντες ἑαυτοὺς ὡς θεοῦ διάκονοι ἐν ὑπομονῇ πολλῇ ἐν θλίψεσιν ἐν ἀνάγκαις ἐν στενοχωρίαις',
   'all'' en panti synistōntes heautous hōs theou diakonoi en hypomonē pollē en thlipsesin en anankais en stenochōriais',
   '''Approving ourselves'' (synistōntes heautous — commending ourselves). ''Ministers of God'' (theou diakonoi — God''s servants). The self-commendation Paul was reluctant to offer (3:1) he now provides — not through credentials but through endurance. ''Patience'' (hypomonē — steadfast endurance under pressure). ''Afflictions'' (thlipsesin — pressures). ''Necessities'' (anankais — compulsions, hardships imposed by circumstances). ''Distresses'' (stenochōriais — narrow straits, tight corners). The first triad of suffering: general pressure, external compulsion, inner constriction.',
   NULL),
  (5, 'In stripes, in imprisonments, in tumults, in labours, in watchings, in fastings;',
   'ἐν πληγαῖς ἐν φυλακαῖς ἐν ἀκαταστασίαις ἐν κόποις ἐν ἀγρυπνίαις ἐν νηστείαις',
   'en plēgais en phylakais en akatastasiais en kopois en agrypniais en nēsteiais',
   '''Stripes'' (plēgais — beatings, blows). ''Imprisonments'' (phylakais — imprisonments). ''Tumults'' (akatastasiais — riots, disturbances, upheavals). ''Labours'' (kopois — hard toil to the point of exhaustion). ''Watchings'' (agrypniais — sleepless nights). ''Fastings'' (nēsteiais — going without food; whether voluntary or imposed by circumstances). Two triads: the first three are inflicted by others (beatings, prison, riots); the second three are self-imposed disciplines (toil, sleeplessness, fasting).',
   NULL),
  (6, 'By pureness, by knowledge, by longsuffering, by kindness, by the Holy Ghost, by love unfeigned,',
   'ἐν ἁγνότητι ἐν γνώσει ἐν μακροθυμίᾳ ἐν χρηστότητι ἐν πνεύματι ἁγίῳ ἐν ἀγάπῃ ἀνυποκρίτῳ',
   'en hagnotēti en gnōsei en makrothymia en chrēstotēti en pneumati hagiō en agapē anypokritoō',
   '''Pureness'' (hagnotēti — moral purity, blamelessness). ''Knowledge'' (gnōsei — spiritual understanding). ''Longsuffering'' (makrothymia — patience with people, long-temperedness). ''Kindness'' (chrēstotēti — goodness, gentleness). ''Holy Ghost'' (pneumati hagiō — the Holy Spirit''s empowering presence). ''Love unfeigned'' (agapē anypokritoō — unhypocritical love; love without a mask). The preposition shifts from ''in'' (suffering) to ''by'' (virtues): the minister is commended not only by what he endures but by the character he displays. The Holy Spirit is listed among the virtues as the source of them all.',
   NULL),
  (7, 'By the word of truth, by the power of God, by the armour of righteousness on the right hand and on the left,',
   'ἐν λόγῳ ἀληθείας ἐν δυνάμει θεοῦ διὰ τῶν ὅπλων τῆς δικαιοσύνης τῶν δεξιῶν καὶ ἀριστερῶν',
   'en logō alētheias en dynamei theou dia tōn hoplōn tēs dikaiosynēs tōn dexiōn kai aristerōn',
   '''Word of truth'' (logō alētheias — the truthful message, the gospel). ''Power of God'' (dynamei theou — divine power at work through the minister). ''Armour of righteousness'' (hoplōn tēs dikaiosynēs — weapons of righteousness; hopla can mean both offensive weapons and defensive armor). ''Right hand and left'' — the right hand held the offensive sword; the left held the defensive shield. The minister is armed on both sides with righteousness: attacking falsehood and defending truth.',
   NULL),
  (8, 'By honour and dishonour, by evil report and good report: as deceivers, and yet true;',
   'διὰ δόξης καὶ ἀτιμίας διὰ δυσφημίας καὶ εὐφημίας ὡς πλάνοι καὶ ἀληθεῖς',
   'dia doxēs kai atimias dia dysphēmias kai euphēmias hōs planoi kai alētheis',
   '''Honour and dishonour'' (doxēs kai atimias — glory and disgrace; the minister experiences both). ''Evil report and good report'' (dysphēmias kai euphēmias — slander and praise). ''Deceivers, and yet true'' (planoi kai alētheis — called imposters but actually truthful). The paradoxes begin: the world perceives one thing; reality is another. The minister lives in the gap between reputation and reality, between worldly judgment and divine truth.',
   NULL),
  (9, 'As unknown, and yet well known; as dying, and, behold, we live; as chastened, and not killed;',
   'ὡς ἀγνοούμενοι καὶ ἐπιγινωσκόμενοι ὡς ἀποθνῄσκοντες καὶ ἰδοὺ ζῶμεν ὡς παιδευόμενοι καὶ μὴ θανατούμενοι',
   'hōs agnooumenoi kai epiginōskomenoi hōs apothnēskontes kai idou zōmen hōs paideuomenoi kai mē thanatumenoi',
   '''Unknown, yet well known'' — invisible to the world''s elite, fully known to God and the faithful. ''Dying, and behold, we live'' — echoing 4:10-12: the death of Jesus at work, yet resurrection life emerges. ''Chastened, and not killed'' (paideuomenoi kai mē thanatumenoi — disciplined but not put to death; God''s fatherly correction does not destroy). Each paradox contrasts appearance with reality: what the world sees (dying, unknown, punished) versus what God knows (alive, known, preserved).',
   NULL),
  (10, 'As sorrowful, yet alway rejoicing; as poor, yet making many rich; as having nothing, and yet possessing all things.',
   'ὡς λυπούμενοι ἀεὶ δὲ χαίροντες ὡς πτωχοὶ πολλοὺς δὲ πλουτίζοντες ὡς μηδὲν ἔχοντες καὶ πάντα κατέχοντες',
   'hōs lypoumenoi aei de chairontes hōs ptōchoi pollous de ploutizontes hōs mēden echontes kai panta katechontes',
   '''Sorrowful, yet alway rejoicing'' — simultaneous sorrow and joy; not alternation but coexistence. ''Poor, yet making many rich'' (ptōchoi pollous ploutizontes — materially destitute but enriching many spiritually; cf. 8:9). ''Having nothing, yet possessing all things'' (mēden echontes kai panta katechontes — owning nothing materially yet possessing everything in Christ). This is the climax: total deprivation coexists with total possession. The minister who has nothing in the world''s ledger has everything in God''s. These paradoxes are the essence of the gospel applied to the messenger.',
   'These seven paradoxes (vv.8-10) constitute one of the most powerful descriptions of Christian existence in Scripture. They are not merely rhetorical flourishes but descriptions of lived reality: Paul was actually poor, actually sorrowful, actually unknown, actually dying. Yet simultaneously he was actually rich in Christ, actually joyful, actually known to God, actually alive. The paradoxes mirror the gospel itself — Christ died yet lives; was cursed yet blesses; was poor yet makes many rich (8:9). The minister''s life is a visible sermon on the power of the cross.'),
  (11, 'O ye Corinthians, our mouth is open unto you, our heart is enlarged.',
   'τὸ στόμα ἡμῶν ἀνέῳγεν πρὸς ὑμᾶς Κορίνθιοι ἡ καρδία ἡμῶν πεπλάτυνται',
   'to stoma hēmōn aneōgen pros hymas Korinthioi hē kardia hēmōn peplatyntai',
   '''O ye Corinthians'' (Korinthioi — one of only two places where Paul addresses a church by name; cf. Gal 3:1 ''O foolish Galatians''). ''Our mouth is open'' (aneōgen — stands open; perfect tense: has been opened and remains open). ''Our heart is enlarged'' (peplatyntai — has been widened, expanded; perfect tense: a settled state of openness). Paul speaks without reserve; his heart is wide open with love. The emotional vulnerability here is remarkable for a letter defending apostolic authority.',
   NULL),
  (12, 'Ye are not straitened in us, but ye are straitened in your own bowels.',
   'οὐ στενοχωρεῖσθε ἐν ἡμῖν στενοχωρεῖσθε δὲ ἐν τοῖς σπλάγχνοις ὑμῶν',
   'ou stenochōreisthe en hēmin stenochōreisthe de en tois splanchnois hymōn',
   '''Straitened'' (stenochōreisthe — confined, restricted, hemmed in). ''In us'' — the restriction is not on Paul''s end; he has opened his heart wide. ''In your own bowels'' (en tois splanchnois hymōn — in your own inward affections; splanchna literally means intestines, used metaphorically for the seat of deep emotions). The Corinthians'' coolness toward Paul is their own problem, not his. His love is unrestricted; their response is constricted.',
   NULL),
  (13, 'Now for a recompence in the same, (I speak as unto my children,) be ye also enlarged.',
   'τὴν δὲ αὐτὴν ἀντιμισθίαν ὡς τέκνοις λέγω πλατύνθητε καὶ ὑμεῖς',
   'tēn de autēn antimisthian hōs teknois legō platynthēte kai hymeis',
   '''Recompence in the same'' (antimisthian — a return in kind, reciprocity). ''As unto my children'' (hōs teknois — as to children; Paul claims the parental role: he is their spiritual father, 1 Cor 4:15). ''Be ye also enlarged'' (platynthēte kai hymeis — widen your hearts too). The appeal is simple: Paul has opened his heart fully; he asks only that they reciprocate. Love requires mutuality.',
   NULL),
  (14, 'Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?',
   'μὴ γίνεσθε ἑτεροζυγοῦντες ἀπίστοις τίς γὰρ μετοχὴ δικαιοσύνῃ καὶ ἀνομίᾳ τίς δὲ κοινωνία φωτὶ πρὸς σκότος',
   'mē ginesthe heterozygountes apistois tis gar metochē dikaiosynē kai anomia tis de koinōnia phōti pros skotos',
   '''Unequally yoked'' (heterozygountes — yoked with a different kind; from heteros [different] + zygos [yoke]; cf. Deut 22:10: ''Thou shalt not plow with an ox and an ass together''). ''Unbelievers'' (apistois — those without faith). Five rhetorical questions follow (vv.14-16), each asserting absolute incompatibility: righteousness/unrighteousness, light/darkness, Christ/Belial, believer/infidel, temple of God/idols. The categories are not relative but absolute — they cannot coexist in partnership.',
   'This passage (vv.14-18) is one of the most significant NT texts on Christian separation. The ''unequal yoke'' (heterozygountes) draws on Deuteronomy 22:10 and Leviticus 19:19 — the principle that fundamentally different things should not be bound together. The application is not social isolation (Paul has already said believers should associate with non-believers, 1 Cor 5:9-10) but binding spiritual partnership — alliances that compromise the believer''s loyalty to Christ. The five rhetorical questions establish that light and darkness, Christ and Belial, cannot be combined; they must be chosen between.'),
  (15, 'And what concord hath Christ with Belial? or what part hath he that believeth with an infidel?',
   'τίς δὲ συμφώνησις Χριστῷ πρὸς Βελίαλ ἢ τίς μερὶς πιστῷ μετὰ ἀπίστου',
   'tis de symphōnēsis Christō pros Belial ē tis meris pistō meta apistou',
   '''Concord'' (symphōnēsis — harmony, agreement; from symphōneō, to sound together; we get ''symphony'' from this). ''Belial'' (Belial — a name for Satan/worthlessness; from Hebrew beli + ya''al, ''without worth''; in Jewish intertestamental literature, the chief of demons). ''Part'' (meris — a share, a portion). Christ and Belial have nothing in common — no harmony, no shared purpose, no overlap. The believer and the unbeliever serve different masters with incompatible allegiances.',
   NULL),
  (16, 'And what agreement hath the temple of God with idols? for ye are the temple of the living God; as God hath said, I will dwell in them, and walk in them; and I will be their God, and they shall be my people.',
   'τίς δὲ συγκατάθεσις ναῷ θεοῦ μετὰ εἰδώλων ὑμεῖς γὰρ ναὸς θεοῦ ἐστε ζῶντος καθὼς εἶπεν ὁ θεός ὅτι ἐνοικήσω ἐν αὐτοῖς καὶ ἐμπεριπατήσω καὶ ἔσομαι αὐτῶν θεός καὶ αὐτοὶ ἔσονταί μοι λαός',
   'tis de synkatathesis naō theou meta eidōlōn hymeis gar naos theou este zōntos kathōs eipen ho theos hoti enoikēsō en autois kai emperipatēsō kai esomai autōn theos kai autoi esontai moi laos',
   '''Agreement'' (synkatathesis — a putting together, a joint resolution; found only here in the NT). ''Temple of the living God'' (naos theou zōntos — the sanctuary of the God who lives; naos is the inner sanctuary, not the outer court). ''I will dwell in them and walk in them'' — a composite quotation from Leviticus 26:11-12 and Ezekiel 37:27. ''I will be their God, and they shall be my people'' — the covenant formula repeated throughout the OT (Jer 31:33, Ezek 36:28). The church corporately is God''s temple — his dwelling place. Idols in God''s temple is an abomination.',
   'The identification of the church as ''the temple of the living God'' is one of the most significant ecclesiological statements in the NT (cf. 1 Cor 3:16-17, Eph 2:21-22). God no longer dwells in a building of stone but in a community of believers. This makes the introduction of idolatrous partnerships into the community equivalent to placing idols in the temple — a desecration. The OT quotation chain (Lev 26:11-12, Ezek 37:27, Jer 31:33) shows that the church is the fulfilment of God''s covenant promises to Israel.'),
  (17, 'Wherefore come out from among them, and be ye separate, saith the Lord, and touch not the unclean thing; and I will receive you,',
   'διὸ ἐξέλθατε ἐκ μέσου αὐτῶν καὶ ἀφορίσθητε λέγει κύριος καὶ ἀκαθάρτου μὴ ἅπτεσθε κἀγὼ εἰσδέξομαι ὑμᾶς',
   'dio exelthate ek mesou autōn kai aphoristhēte legei kyrios kai akathartou mē haptesthe kagō eisdexomai hymas',
   '''Come out'' (exelthate — go out; aorist imperative: a decisive act). ''Be ye separate'' (aphoristhēte — be set apart; from aphorizō, to mark off by boundaries). ''Touch not the unclean thing'' — echoing Isaiah 52:11 (the command to the exiles leaving Babylon). ''I will receive you'' (eisdexomai hymas — I will welcome you in). The OT exodus motif: separation from the unclean leads to reception by God. Paul applies the Babylonian exile imagery to the Corinthians'' spiritual situation: leave the idolatrous alliances and God will receive you as his own.',
   NULL),
  (18, 'And will be a Father unto you, and ye shall be my sons and daughters, saith the Lord Almighty.',
   'καὶ ἔσομαι ὑμῖν εἰς πατέρα καὶ ὑμεῖς ἔσεσθέ μοι εἰς υἱοὺς καὶ θυγατέρας λέγει κύριος παντοκράτωρ',
   'kai esomai hymin eis patera kai hymeis esesthe moi eis huious kai thygateras legei kyrios pantokratōr',
   '''Father'' — the covenant relationship deepens from ''I will be their God'' (v.16) to ''I will be a Father.'' ''Sons and daughters'' (huious kai thygateras — both genders explicitly included; echoing 2 Sam 7:14 but expanding it beyond the king to all the covenant people). ''Lord Almighty'' (kyrios pantokratōr — the Lord who holds all power; the LXX rendering of YHWH Sabaoth, the Lord of Hosts). Separation from the unclean is the precondition for the fullest experience of intimate divine fatherhood.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 6;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 patience
  ('ὑπομονή', 'hypomonē', 'G5281', 'Patient endurance, steadfastness — from hypo (under) + menō (to remain). The capacity to remain under pressure without collapsing. It heads Paul''s catalog of credentials because endurance under suffering is the primary evidence of genuine apostolic ministry. Not passive resignation but active perseverance.', 1),
  -- v.6 love unfeigned
  ('ἀνυπόκριτος', 'anypokritos', 'G505', 'Unfeigned, unhypocritical, without a mask — from a (not) + hypokrinomai (to play a role, to act). Love that is genuine, without pretence or performance. In the ancient theatre, a hypokritēs was an actor wearing a mask; anypokritos love removes all masks and loves authentically.', 2),
  -- v.7 armour
  ('ὅπλον', 'hoplon', 'G3696', 'Weapon, instrument of warfare — can refer to both offensive weapons (sword, spear) and defensive armor (shield, breastplate). ''The armour of righteousness on the right hand and on the left'' means the minister is fully equipped on both sides: attacking with truth and defending with integrity.', 3),
  -- v.14 unequally yoked
  ('ἑτεροζυγέω', 'heterozugeō', 'G2086', 'To be unequally yoked, to be mismatched — from heteros (different in kind) + zygos (yoke). Found only here in the NT. The image is agricultural: yoking two fundamentally different animals together produces an unworkable, destructive partnership. Applied spiritually: binding a believer with an unbeliever in intimate partnership distorts both.', 4),
  -- v.15 Belial
  ('Βελίαλ', 'Belial', 'G955', 'Belial — a Hebrew name meaning ''worthlessness'' or ''wickedness.'' In the OT, ''sons of Belial'' denotes worthless, wicked persons. In intertestamental Judaism, Belial became a name for Satan, the chief of demons. Here Paul uses it as a direct opposite to Christ, personalizing evil as the adversary of the Messiah.', 5),
  -- v.16 temple
  ('ναός', 'naos', 'G3485', 'Temple, inner sanctuary — the sacred inner portion where God dwells, as distinct from hieron (the entire temple complex). The church is naos theou — the very dwelling-place of God, the holy of holies. This designation makes any contamination with idolatry a desecration of the most sacred space.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 6
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 6
    WHEN 3 THEN 7
    WHEN 4 THEN 14
    WHEN 5 THEN 15
    WHEN 6 THEN 16
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 now is the day of salvation
  (2, 'Isaiah 49:8', 1),
  (2, 'Hebrews 3:13-15', 2),
  -- v.4-5 catalog of sufferings
  (4, '2 Corinthians 11:23-28', 3),
  (4, '2 Corinthians 4:8-9', 4),
  -- v.7 armour of righteousness
  (7, 'Ephesians 6:11-17', 5),
  (7, 'Romans 13:12', 6),
  -- v.10 paradoxes
  (10, '2 Corinthians 8:9', 7),
  (10, 'Philippians 4:12-13', 8),
  -- v.14 unequally yoked
  (14, 'Deuteronomy 22:10', 9),
  (14, '1 Corinthians 10:20-21', 10),
  -- v.16 temple of God
  (16, '1 Corinthians 3:16-17', 11),
  (16, 'Ephesians 2:21-22', 12),
  (16, 'Leviticus 26:11-12', 13),
  (16, 'Ezekiel 37:27', 14),
  -- v.17 come out and be separate
  (17, 'Isaiah 52:11', 15),
  (17, 'Revelation 18:4', 16),
  -- v.18 Father, sons and daughters
  (18, '2 Samuel 7:14', 17),
  (18, 'Romans 8:14-17', 18),
  (18, 'Galatians 3:26', 19)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 6
  AND v.verse_number = cr.verse_number;
