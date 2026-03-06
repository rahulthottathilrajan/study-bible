-- ═══════════════════════════════════════════════════
-- 1 PETER CHAPTER 1 — Living Hope and Holy Living
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '1 Peter 1 is one of the richest chapters in the New Testament, opening with a magnificent declaration of the believer''s living hope through Christ''s resurrection (vv.3-5). Peter writes to persecuted Christians scattered across five Roman provinces in Asia Minor, encouraging them with the certainty of their inheritance — ''incorruptible, and undefiled, and that fadeth not away, reserved in heaven'' (v.4). Their trials, though grievous, serve a purpose: ''the trial of your faith, being much more precious than of gold that perisheth'' (v.7). Even angels desire to look into the salvation they possess (v.12). The second half turns to practical holiness: ''be ye holy; for I am holy'' (v.16). This holiness is motivated by three great truths: the fearful judgment of the impartial Father (v.17), the precious blood of Christ — ''a lamb without blemish and without spot'' (vv.18-19), and the imperishable new birth ''by the word of God, which liveth and abideth for ever'' (v.23). The chapter closes with Isaiah''s great contrast: all flesh is as grass and fades, ''but the word of the Lord endureth for ever'' (v.25).',
  'A Living Hope and the Call to Holiness',
  'ἐλπίδα ζῶσαν (elpida zōsan)',
  'A living hope — not a dead, static expectation but a hope that is alive, active, growing, and guaranteed by the resurrection of Jesus Christ from the dead. This hope sustains believers through fiery trials.',
  '["Greeting: Peter to the Elect Strangers (vv.1-2): Peter an apostle of Jesus Christ to the strangers scattered throughout Pontus Galatia Cappadocia Asia and Bithynia; elect according to the foreknowledge of God the Father through sanctification of the Spirit unto obedience and sprinkling of the blood of Jesus Christ","A Living Hope (vv.3-5): Blessed be the God and Father of our Lord Jesus Christ which according to his abundant mercy hath begotten us again unto a lively hope by the resurrection of Jesus Christ from the dead; to an inheritance incorruptible and undefiled and that fadeth not away reserved in heaven for you; who are kept by the power of God through faith unto salvation ready to be revealed in the last time","Joy in Trials (vv.6-9): Wherein ye greatly rejoice though now for a season if need be ye are in heaviness through manifold temptations; that the trial of your faith being much more precious than of gold that perisheth though it be tried with fire might be found unto praise and honour and glory at the appearing of Jesus Christ; whom having not seen ye love; believing ye rejoice with joy unspeakable and full of glory; receiving the end of your faith even the salvation of your souls","Prophets and Angels Long to Understand (vv.10-12): Of which salvation the prophets have enquired and searched diligently who prophesied of the grace that should come unto you; searching what or what manner of time the Spirit of Christ which was in them did signify when it testified beforehand the sufferings of Christ and the glory that should follow; unto whom it was revealed that not unto themselves but unto us they did minister the things which are now reported unto you; which things the angels desire to look into","The Call to Holiness (vv.13-16): Wherefore gird up the loins of your mind be sober and hope to the end for the grace that is to be brought unto you at the revelation of Jesus Christ; as obedient children not fashioning yourselves according to the former lusts in your ignorance; but as he which hath called you is holy so be ye holy in all manner of conversation; because it is written Be ye holy for I am holy","Redeemed by Precious Blood (vv.17-21): And if ye call on the Father who without respect of persons judgeth according to every man''s work pass the time of your sojourning here in fear; forasmuch as ye know that ye were not redeemed with corruptible things as silver and gold; but with the precious blood of Christ as of a lamb without blemish and without spot; who verily was foreordained before the foundation of the world but was manifest in these last times for you; who by him do believe in God that raised him up from the dead and gave him glory that your faith and hope might be in God","Born Again by the Living Word (vv.22-25): Seeing ye have purified your souls in obeying the truth through the Spirit unto unfeigned love of the brethren; see that ye love one another with a pure heart fervently; being born again not of corruptible seed but of incorruptible by the word of God which liveth and abideth for ever; for all flesh is as grass and all the glory of man as the flower of grass; the grass withereth and the flower thereof falleth away; but the word of the Lord endureth for ever; and this is the word which by the gospel is preached unto you"]'
FROM books b WHERE b.name = '1 Peter';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Peter, an apostle of Jesus Christ, to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia,',
   'Πέτρος ἀπόστολος Ἰησοῦ Χριστοῦ ἐκλεκτοῖς παρεπιδήμοις διασπορᾶς Πόντου Γαλατίας Καππαδοκίας Ἀσίας καὶ Βιθυνίας',
   'Petros apostolos Iēsou Christou eklektois parepidēmois diasporas Pontou Galatias Kappadokias Asias kai Bithynias',
   '''Peter'' (Petros — rock; the name Christ gave Simon, John 1:42). ''Apostle'' — his authority and commission. ''Strangers'' (parepidēmois — resident aliens, sojourners, temporary residents; from para + epidēmeō, to reside alongside). ''Scattered'' (diasporas — of the Dispersion). Five Roman provinces in Asia Minor (modern Turkey): Pontus, Galatia, Cappadocia, Asia, Bithynia — covering virtually all of Asia Minor. These are believers living as foreigners in a hostile world, their true citizenship being in heaven.',
   NULL),
  (2,
   'Elect according to the foreknowledge of God the Father, through sanctification of the Spirit, unto obedience and sprinkling of the blood of Jesus Christ: Grace unto you, and peace, be multiplied.',
   'κατὰ πρόγνωσιν θεοῦ πατρός ἐν ἁγιασμῷ πνεύματος εἰς ὑπακοὴν καὶ ῥαντισμὸν αἵματος Ἰησοῦ Χριστοῦ χάρις ὑμῖν καὶ εἰρήνη πληθυνθείη',
   'kata prognōsin theou patros en hagiasmō pneumatos eis hypakoēn kai rhantismon haimatos Iēsou Christou charis hymin kai eirēnē plēthyntheiē',
   '''Elect'' (eklektois — chosen, selected by God). A trinitarian greeting: (1) ''according to the foreknowledge of God the Father'' (kata prognōsin — according to God''s prior knowledge and purpose; foreknowledge is not mere foresight but relational, purposeful knowing). (2) ''Through sanctification of the Spirit'' (en hagiasmō pneumatos — by the Holy Spirit''s setting-apart work). (3) ''Unto obedience and sprinkling of the blood of Jesus Christ'' (the goal: obedience; the means: Christ''s atoning blood, cf. Exod 24:7-8). ''Grace and peace be multiplied'' (plēthyntheiē — may they be abundantly increased).',
   'Election as trinitarian work: Peter presents election as the work of all three Persons of the Trinity. The Father foreknows and chooses; the Spirit sanctifies and sets apart; the Son provides the atoning blood. Election is not cold decree but warm, relational, purposeful action by the triune God. The goal of election is not merely salvation but obedience — a changed life.'),
  (3,
   'Blessed be the God and Father of our Lord Jesus Christ, which according to his abundant mercy hath begotten us again unto a lively hope by the resurrection of Jesus Christ from the dead,',
   'Εὐλογητὸς ὁ θεὸς καὶ πατὴρ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ὁ κατὰ τὸ πολὺ αὐτοῦ ἔλεος ἀναγεννήσας ἡμᾶς εἰς ἐλπίδα ζῶσαν δι᾽ ἀναστάσεως Ἰησοῦ Χριστοῦ ἐκ νεκρῶν',
   'Eulogētos ho theos kai patēr tou kyriou hēmōn Iēsou Christou ho kata to poly autou eleos anagennēsas hēmas eis elpida zōsan di'' anastaseōs Iēsou Christou ek nekrōn',
   '''Blessed'' (eulogētos — praised, worthy of blessing). ''Abundant mercy'' (poly eleos — great mercy, much mercy). ''Begotten us again'' (anagennēsas — having caused to be born again, having regenerated; from ana, again + gennaō, to beget). ''Lively hope'' (elpida zōsan — a living hope, a hope that is alive and active). ''By the resurrection'' (di'' anastaseōs — through the resurrection). The source of hope is God''s mercy; the instrument of hope is Christ''s resurrection; the nature of hope is living — not a dead wish but a vital, growing certainty. Because Christ lives, our hope lives.',
   'The living hope: The Christian hope is "living" (zōsan) because it is grounded in the resurrection of a living Christ. Unlike all other hopes, which die with the person who holds them, this hope is alive and grows stronger. The resurrection is the foundation: if Christ is raised, our hope is unshakeable; if not, our faith is vain (1 Cor 15:14). Regeneration (new birth) and resurrection are linked: God''s mercy + Christ''s resurrection = living hope.'),
  (4,
   'To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you,',
   'εἰς κληρονομίαν ἄφθαρτον καὶ ἀμίαντον καὶ ἀμάραντον τετηρημένην ἐν οὐρανοῖς εἰς ὑμᾶς',
   'eis klēronomian aphtharton kai amianton kai amaranton tetērēmenēn en ouranois eis hymas',
   '''Inheritance'' (klēronomian — an inheritance, a possession received as an heir). Three negative adjectives describe it by what it cannot do: (1) ''Incorruptible'' (aphtharton — imperishable, cannot decay or be destroyed; unlike earthly inheritances that decay). (2) ''Undefiled'' (amianton — unstained, cannot be polluted or contaminated; unlike earthly things that sin corrupts). (3) ''Fadeth not away'' (amaranton — unfading, cannot wilt or lose its beauty; the amaranth flower). ''Reserved'' (tetērēmenēn — kept, guarded, preserved; perfect tense: it has been reserved and remains reserved). ''In heaven for you'' — the inheritance is secure not because we keep it but because God guards it in heaven.',
   NULL),
  (5,
   'Who are kept by the power of God through faith unto salvation ready to be revealed in the last time.',
   'τοὺς ἐν δυνάμει θεοῦ φρουρουμένους διὰ πίστεως εἰς σωτηρίαν ἑτοίμην ἀποκαλυφθῆναι ἐν καιρῷ ἐσχάτῳ',
   'tous en dynamei theou phrouroumenous dia pisteōs eis sōtērian hetoimēn apokalyphthēnai en kairō eschatō',
   '''Kept'' (phrouroumenous — guarded, garrisoned, shielded; a military term for soldiers guarding a fortress or a city; present tense: continuously guarded). ''By the power of God'' (en dynamei theou — by God''s might, not our own). ''Through faith'' (dia pisteōs — by means of faith; the human channel through which God''s power operates). ''Salvation ready to be revealed'' (sōtērian hetoimēn apokalyphthēnai — salvation standing ready to be unveiled). Double security: the inheritance is kept in heaven (v.4) and the heirs are kept on earth (v.5). God guards both the treasure and the heir.',
   'Perseverance of the saints: This verse teaches the security of the believer from both sides. The inheritance is reserved in heaven (v.4); the believer is garrisoned by God''s power on earth (v.5). God guards both the gift and the recipient. The means is faith — not perfect performance but trusting reliance on God. The final salvation is "ready" (hetoimēn) — fully prepared, waiting only for the appointed time.'),
  (6,
   'Wherein ye greatly rejoice, though now for a season, if need be, ye are in heaviness through manifold temptations:',
   'ἐν ᾧ ἀγαλλιᾶσθε ὀλίγον ἄρτι εἰ δέον ἐστὶν λυπηθέντες ἐν ποικίλοις πειρασμοῖς',
   'en hō agalliãsthe oligon arti ei deon estin lypēthentes en poikilois peirasmois',
   '''Greatly rejoice'' (agalliãsthe — exult, leap for joy; the word used of Mary''s Magnificat, Luke 1:47). ''For a season'' (oligon arti — a little while now, for a brief moment). ''If need be'' (ei deon estin — if it is necessary, if it must be; the trials are not random but divinely necessary). ''Heaviness'' (lypēthentes — grieved, distressed, made sorrowful). ''Manifold temptations'' (poikilois peirasmois — various trials, many-coloured testings; same phrase as James 1:2). Joy and grief coexist: present sorrow is real but temporary; future glory is certain and eternal.',
   NULL),
  (7,
   'That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Jesus Christ:',
   'ἵνα τὸ δοκίμιον ὑμῶν τῆς πίστεως πολὺ τιμιώτερον χρυσίου τοῦ ἀπολλυμένου διὰ πυρὸς δὲ δοκιμαζομένου εὑρεθῇ εἰς ἔπαινον καὶ τιμὴν καὶ δόξαν ἐν ἀποκαλύψει Ἰησοῦ Χριστοῦ',
   'hina to dokimion hymōn tēs pisteōs poly timiōteron chrysiou tou apollymenou dia pyros de dokimazomenou heurethē eis epainon kai timēn kai doxan en apokalypsei Iēsou Christou',
   '''Trial'' (dokimion — the testing, the proving process; same word as James 1:3). ''Much more precious than gold'' (poly timiōteron chrysiou — far more valuable than gold). Gold is tested by fire to remove impurities, yet gold itself perishes (apollymenou). Faith tested by fire is far more valuable than gold tested by fire, because faith''s value is eternal. ''Praise and honour and glory'' (epainon kai timēn kai doxan — the triple reward). ''At the appearing'' (en apokalypsei — at the revelation, the unveiling of Jesus Christ). Trials now produce glory then.',
   NULL),
  (8,
   'Whom having not seen, ye love; in whom, though now ye see him not, yet believing, ye rejoice with joy unspeakable and full of glory:',
   'ὃν οὐκ ἰδόντες ἀγαπᾶτε εἰς ὃν ἄρτι μὴ ὁρῶντες πιστεύοντες δὲ ἀγαλλιᾶσθε χαρᾷ ἀνεκλαλήτῳ καὶ δεδοξασμένῃ',
   'hon ouk idontes agapate eis hon arti mē horōntes pisteuontes de agalliãsthe chara aneklalētō kai dedoxasmenē',
   '''Having not seen'' (ouk idontes — never having seen; Peter had seen Jesus, but his readers had not). ''Ye love'' (agapate — you love Him; love based not on sight but on faith). ''Joy unspeakable'' (chara aneklalētō — joy that cannot be expressed in words, inexpressible joy; aneklalētos is used only here in the NT). ''Full of glory'' (dedoxasmenē — glorified, already partaking of heavenly glory). This joy is a foretaste of the glory to come. Believing without seeing, loving without touching — this is the faith of the church after the ascension, and it produces joy that words cannot capture.',
   NULL),
  (9,
   'Receiving the end of your faith, even the salvation of your souls.',
   'κομιζόμενοι τὸ τέλος τῆς πίστεως ὑμῶν σωτηρίαν ψυχῶν',
   'komizomenoi to telos tēs pisteōs hymōn sōtērian psychōn',
   '''Receiving'' (komizomenoi — obtaining, carrying away, reaping the reward; present tense: already in the process of receiving). ''The end'' (to telos — the goal, the outcome, the intended purpose). ''Salvation of your souls'' (sōtērian psychōn — the rescue of your lives/selves). Faith has a goal, and that goal is salvation — not just future but already being received. The present tense is remarkable: believers are even now experiencing the beginnings of their final salvation.',
   NULL),
  (10,
   'Of which salvation the prophets have enquired and searched diligently, who prophesied of the grace that should come unto you:',
   'περὶ ἧς σωτηρίας ἐξεζήτησαν καὶ ἐξηρεύνησαν προφῆται οἱ περὶ τῆς εἰς ὑμᾶς χάριτος προφητεύσαντες',
   'peri hēs sōtērias exezētēsan kai exēreunēsan prophētai hoi peri tēs eis hymas charitos prophēteusantes',
   '''Enquired'' (exezētēsan — sought out diligently, investigated thoroughly; from ek + zēteō, to seek out intensely). ''Searched diligently'' (exēreunēsan — searched out carefully, explored, examined; from ek + eraunaō, to search). Two intensified verbs: the prophets did not casually glance at salvation — they pursued it with intense, exhaustive investigation. They spoke of grace that would come to Peter''s readers, but they themselves did not fully understand what they were prophesying.',
   NULL),
  (11,
   'Searching what, or what manner of time the Spirit of Christ which was in them did signify, when it testified beforehand the sufferings of Christ, and the glory that should follow.',
   'ἐρευνῶντες εἰς τίνα ἢ ποῖον καιρὸν ἐδήλου τὸ ἐν αὐτοῖς πνεῦμα Χριστοῦ προμαρτυρόμενον τὰ εἰς Χριστὸν παθήματα καὶ τὰς μετὰ ταῦτα δόξας',
   'eraunōntes eis tina ē poion kairon edēlou to en autois pneuma Christou promarturomenon ta eis Christon pathēmata kai tas meta tauta doxas',
   '''Searching'' (eraunōntes — investigating, researching). ''What or what manner of time'' (tina ē poion kairon — what person or what kind of season). ''The Spirit of Christ which was in them'' (to en autois pneuma Christou — the Spirit of Christ within the prophets; the Holy Spirit is here identified as the Spirit of Christ, a remarkable trinitarian statement). ''Testified beforehand'' (promarturomenon — bore witness in advance). ''Sufferings of Christ and the glory that should follow'' (ta eis Christon pathēmata kai tas meta tauta doxas — the sufferings destined for Christ and the glories after these). The OT pattern: suffering then glory.',
   'The Spirit of Christ in the prophets: Peter makes the stunning claim that the Spirit who inspired the OT prophets was the Spirit of Christ. Christ was active in the world before His incarnation, through His Spirit, testifying in advance of His own sufferings and subsequent glory. This establishes the unity of the Old and New Testaments and the pre-existence of Christ.'),
  (12,
   'Unto whom it was revealed, that not unto themselves, but unto us they did minister the things, which are now reported unto you by them that have preached the gospel unto you with the Holy Ghost sent down from heaven; which things the angels desire to look into.',
   'οἷς ἀπεκαλύφθη ὅτι οὐχ ἑαυτοῖς ὑμῖν δὲ διηκόνουν αὐτά ἃ νῦν ἀνηγγέλη ὑμῖν διὰ τῶν εὐαγγελισαμένων ὑμᾶς ἐν πνεύματι ἁγίῳ ἀποσταλέντι ἀπ᾽ οὐρανοῦ εἰς ἃ ἐπιθυμοῦσιν ἄγγελοι παρακύψαι',
   'hois apekalyphthē hoti ouch heautois hymin de diēkonoun auta ha nyn anēngelē hymin dia tōn euangelisamenōn hymas en pneumati hagiō apostalenti ap'' ouranou eis ha epithymousin angeloi parakýpsai',
   '''Not unto themselves but unto us'' — the prophets served a generation they would never see. ''Preached the gospel with the Holy Ghost sent down from heaven'' — Pentecost: the same Spirit who inspired the prophets now empowers the preachers. ''Angels desire to look into'' (epithymousin angeloi parakýpsai — angels long to stoop down and peer into; parakýpsai is the same word used for peering into the empty tomb, John 20:5,11). Angels, who witnessed creation and the fall, are fascinated by redemption — a salvation so glorious that even heavenly beings crane to understand it.',
   NULL),
  (13,
   'Wherefore gird up the loins of your mind, be sober, and hope to the end for the grace that is to be brought unto you at the revelation of Jesus Christ;',
   'Διὸ ἀναζωσάμενοι τὰς ὀσφύας τῆς διανοίας ὑμῶν νήφοντες τελείως ἐλπίσατε ἐπὶ τὴν φερομένην ὑμῖν χάριν ἐν ἀποκαλύψει Ἰησοῦ Χριστοῦ',
   'Dio anazōsamenoi tas osphyas tēs dianoias hymōn nēphontes teleiōs elpisate epi tēn pheromenēn hymin charin en apokalypsei Iēsou Christou',
   '''Gird up the loins of your mind'' (anazōsamenoi tas osphyas tēs dianoias — tuck up the robes of your thinking; the image is of a man in a long robe who tucks it into his belt for action; mentally prepare for action). ''Be sober'' (nēphontes — be clear-headed, be self-controlled, not intoxicated by the world). ''Hope to the end'' (teleiōs elpisate — hope completely, hope fully, set your hope entirely). ''Grace to be brought'' (pheromenēn charin — grace being carried to you; present tense: grace is already on its way). The shift from doctrine (vv.3-12) to duty: because of what God has done, prepare your minds, stay sober, and fix your hope on future grace.',
   NULL),
  (14,
   'As obedient children, not fashioning yourselves according to the former lusts in your ignorance:',
   'ὡς τέκνα ὑπακοῆς μὴ συσχηματιζόμενοι ταῖς πρότερον ἐν τῇ ἀγνοίᾳ ὑμῶν ἐπιθυμίαις',
   'hōs tekna hypakoēs mē syschēmatizomenoi tais proteron en tē agnoia hymōn epithymiais',
   '''Obedient children'' (tekna hypakoēs — children of obedience, children characterised by obedience; a Hebraism). ''Not fashioning yourselves'' (mē syschēmatizomenoi — not being conformed, not being shaped by, not squeezing yourselves into the mould of; from syn + schēma, to conform to a pattern; cf. Rom 12:2). ''Former lusts'' (tais proteron epithymiais — the previous desires, the cravings of your pre-conversion life). ''Ignorance'' (agnoia — lack of knowledge of God). Their pre-conversion life was shaped by desires born from ignorance of God. Now, as God''s children, they must refuse to be pressed back into that old mould.',
   NULL),
  (15,
   'But as he which hath called you is holy, so be ye holy in all manner of conversation;',
   'ἀλλὰ κατὰ τὸν καλέσαντα ὑμᾶς ἅγιον καὶ αὐτοὶ ἅγιοι ἐν πάσῃ ἀναστροφῇ γενήθητε',
   'alla kata ton kalesanta hymas hagion kai autoi hagioi en pasē anastrophē genēthēte',
   '''As he which hath called you is holy'' (kata ton kalesanta hymas hagion — according to the Holy One who called you; holiness is the standard, and the standard is God Himself). ''Holy'' (hagioi — set apart, consecrated, morally pure). ''All manner of conversation'' (pasē anastrophē — every form of conduct, the entire pattern of life; not just religious behaviour but all of life). The call to holiness is comprehensive — not just in worship but in business, relationships, leisure, speech, and thought.',
   NULL),
  (16,
   'Because it is written, Be ye holy; for I am holy.',
   'διότι γέγραπται ἅγιοι γένεσθε ὅτι ἐγὼ ἅγιός εἰμι',
   'dioti gegraptai hagioi genesthe hoti egō hagios eimi',
   '''It is written'' (gegraptai — perfect tense: it stands written and remains in force). Peter quotes Leviticus 11:44-45; 19:2; 20:7 — the holiness command given to Israel at Sinai. The standard has not changed: God''s holiness is the measure of our holiness. The motive is not fear of punishment but imitation of the Father: ''because I am holy.'' Children resemble their Father.',
   'The holiness of God as the standard: The command to be holy is grounded in God''s own nature. Holiness is not an arbitrary demand but flows from who God is. Because He is holy, His children must be holy. This is not perfectionism but direction — the trajectory of the Christian life is toward increasing conformity to God''s character.'),
  (17,
   'And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear:',
   'καὶ εἰ πατέρα ἐπικαλεῖσθε τὸν ἀπροσωπολήμπτως κρίνοντα κατὰ τὸ ἑκάστου ἔργον ἐν φόβῳ τὸν τῆς παροικίας ὑμῶν χρόνον ἀναστράφητε',
   'kai ei patera epikaleisthe ton aprosōpolēmptōs krinonta kata to hekastou ergon en phobō ton tēs paroikias hymōn chronon anastraphēte',
   '''Call on the Father'' (patera epikaleisthe — invoke as Father, address as Father). ''Without respect of persons'' (aprosōpolēmptōs — impartially; used only here in the NT). ''Judgeth'' (krinonta — judges, evaluates). ''Sojourning'' (paroikias — time as a resident alien, temporary stay; from paroikos, a neighbour, a sojourner). ''Fear'' (phobō — reverent awe, not terror but deep respect). If your Father is an impartial Judge, live in reverent fear during your temporary stay on earth. The "fear" is not slavish dread but the healthy reverence of a child who knows their Father is also the Judge of all.',
   NULL),
  (18,
   'Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers;',
   'εἰδότες ὅτι οὐ φθαρτοῖς ἀργυρίῳ ἢ χρυσίῳ ἐλυτρώθητε ἐκ τῆς ματαίας ὑμῶν ἀναστροφῆς πατροπαραδότου',
   'eidotes hoti ou phthartois argyriō ē chrysiō elytrōthēte ek tēs mataias hymōn anastrophēs patroparadotou',
   '''Redeemed'' (elytrōthēte — ransomed, set free by payment of a price; from lytroō, to release by paying a ransom). ''Corruptible things'' (phthartois — perishable things). ''Silver and gold'' — the most valuable perishable currency. ''Vain conversation'' (mataias anastrophēs — empty, futile manner of life). ''Received by tradition from your fathers'' (patroparadotou — handed down from ancestors; the pagan lifestyle inherited from their forefathers). They were slaves to an inherited, purposeless way of life. The ransom price was not money but something infinitely more valuable (v.19).',
   NULL),
  (19,
   'But with the precious blood of Christ, as of a lamb without blemish and without spot:',
   'ἀλλὰ τιμίῳ αἵματι ὡς ἀμνοῦ ἀμώμου καὶ ἀσπίλου Χριστοῦ',
   'alla timiō haimati hōs amnou amōmou kai aspilou Christou',
   '''Precious blood'' (timiō haimati — blood of great value, costly blood). ''Lamb'' (amnou — a sacrificial lamb; cf. John 1:29, ''Behold the Lamb of God''). ''Without blemish'' (amōmou — without defect, flawless; the requirement for OT sacrificial animals, Exod 12:5). ''Without spot'' (aspilou — without stain, spotless). Christ is the antitype of the Passover lamb: perfect in nature (without blemish) and perfect in life (without spot). His blood is the ransom price that frees believers from their empty inherited way of life.',
   'The blood of Christ: Peter presents Christ''s death as a ransom payment (lytroō), using Passover lamb imagery. The blood is "precious" (timios) — of infinite value because it is the blood of the sinless Son of God. The OT sacrificial system required unblemished animals; Christ fulfilled this requirement perfectly. His blood accomplishes what silver, gold, and animal blood never could: genuine liberation from sin.'),
  (20,
   'Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,',
   'προεγνωσμένου μὲν πρὸ καταβολῆς κόσμου φανερωθέντος δὲ ἐπ᾽ ἐσχάτων τῶν χρόνων δι᾽ ὑμᾶς',
   'proegnōsmenou men pro katabolēs kosmou phanerōthentos de ep'' eschatōn tōn chronōn di'' hymas',
   '''Foreordained'' (proegnōsmenou — foreknown, predetermined; perfect passive: foreknown from eternity past and remaining so). ''Before the foundation of the world'' (pro katabolēs kosmou — before the laying down of the world, before creation). ''Manifest in these last times'' (phanerōthentos ep'' eschatōn tōn chronōn — revealed at the end of the ages). ''For you'' (di'' hymas — on your behalf, for your sake). The cross was not an accident or a plan B; it was God''s eternal purpose. Christ was designated as the Lamb before the world existed, and appeared in time for the sake of believers.',
   NULL),
  (21,
   'Who by him do believe in God, that raised him up from the dead, and gave him glory; that your faith and hope might be in God.',
   'τοὺς δι᾽ αὐτοῦ πιστοὺς εἰς θεὸν τὸν ἐγείραντα αὐτὸν ἐκ νεκρῶν καὶ δόξαν αὐτῷ δόντα ὥστε τὴν πίστιν ὑμῶν καὶ ἐλπίδα εἶναι εἰς θεόν',
   'tous di'' autou pistous eis theon ton egeiranta auton ek nekrōn kai doxan autō donta hōste tēn pistin hymōn kai elpida einai eis theon',
   '''By him'' (di'' autou — through Christ). ''Believe in God'' — faith in God comes through Christ. ''Raised him up and gave him glory'' — the resurrection and exaltation are the Father''s vindication of the Son. ''That your faith and hope might be in God'' — the purpose of Christ''s resurrection and glorification is to ground our faith and hope firmly in God. Faith and hope converge on God through the mediating work of Christ.',
   NULL),
  (22,
   'Seeing ye have purified your souls in obeying the truth through the Spirit unto unfeigned love of the brethren, see that ye love one another with a pure heart fervently:',
   'τὰς ψυχὰς ὑμῶν ἡγνικότες ἐν τῇ ὑπακοῇ τῆς ἀληθείας διὰ πνεύματος εἰς φιλαδελφίαν ἀνυπόκριτον ἐκ καθαρᾶς καρδίας ἀλλήλους ἀγαπήσατε ἐκτενῶς',
   'tas psychas hymōn hēgnikotes en tē hypakoē tēs alētheias dia pneumatos eis philadelphian anypokryton ek katharas kardias allēlous agapēsate ektenōs',
   '''Purified your souls'' (hēgnikotes — having cleansed, having purified; perfect tense: the purification is done and its effect continues). ''In obeying the truth'' (en tē hypakoē tēs alētheias — by obedience to the truth, through responding to the gospel). ''Unfeigned love'' (philadelphian anypokryton — brotherly love without hypocrisy, genuine sibling affection). ''With a pure heart fervently'' (ek katharas kardias ektenōs — from a clean heart intensely; ektenōs means stretched out, strained, with full exertion, as a runner straining for the finish line). Love is not optional or casual — it requires the full exertion of a purified heart.',
   NULL),
  (23,
   'Being born again, not of corruptible seed, but of incorruptible, by the word of God, which liveth and abideth for ever.',
   'ἀναγεγεννημένοι οὐκ ἐκ σπορᾶς φθαρτῆς ἀλλὰ ἀφθάρτου διὰ λόγου ζῶντος θεοῦ καὶ μένοντος εἰς τὸν αἰῶνα',
   'anagegennēmenoi ouk ek sporas phthartēs alla aphthartou dia logou zōntos theou kai menontos eis ton aiōna',
   '''Born again'' (anagegennēmenoi — having been begotten again; perfect tense: born again in the past with permanent results). ''Corruptible seed'' (sporas phthartēs — perishable seed; human birth comes from seed that decays). ''Incorruptible'' (aphthartou — imperishable; the seed of the new birth cannot decay or die). ''By the word of God'' (dia logou zōntos theou — through the living word of God). ''Liveth and abideth'' (zōntos kai menontos — living and remaining). The word of God is the seed of regeneration. Unlike natural seed, which is perishable, this seed is imperishable — it produces eternal life because it is itself eternal.',
   'Regeneration by the word: The new birth is accomplished through the imperishable seed of God''s word. This parallels James 1:18 ("begat he us with the word of truth"). The word of God is both the seed and the instrument of regeneration. Because the seed is imperishable, the life it produces is imperishable. The permanence of the new birth is grounded in the permanence of God''s word.'),
  (24,
   'For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away:',
   'διότι πᾶσα σὰρξ ὡς χόρτος καὶ πᾶσα δόξα ἀνθρώπου ὡς ἄνθος χόρτου ἐξηράνθη ὁ χόρτος καὶ τὸ ἄνθος αὐτοῦ ἐξέπεσεν',
   'dioti pasa sarx hōs chortos kai pasa doxa anthrōpou hōs anthos chortou exēranthē ho chortos kai to anthos autou exepesen',
   'Peter quotes Isaiah 40:6-8, a text that contrasts the frailty of humanity with the permanence of God''s word. ''All flesh'' (pasa sarx — all humanity, every person). ''Grass'' (chortos — field grass, hay). ''Glory of man'' (doxa anthrōpou — human glory, achievement, beauty, reputation). ''Flower of grass'' (anthos chortou — wildflower growing among grass). The grass withers, the flower drops — human life and human achievement are temporary. This is the ground from which the imperishable seed (v.23) grows.',
   NULL),
  (25,
   'But the word of the Lord endureth for ever. And this is the word which by the gospel is preached unto you.',
   'τὸ δὲ ῥῆμα κυρίου μένει εἰς τὸν αἰῶνα τοῦτο δέ ἐστιν τὸ ῥῆμα τὸ εὐαγγελισθὲν εἰς ὑμᾶς',
   'to de rhēma kyriou menei eis ton aiōna touto de estin to rhēma to euangelisthen eis hymas',
   '''The word of the Lord'' (to rhēma kyriou — the spoken word of the Lord). ''Endureth for ever'' (menei eis ton aiōna — remains unto the age, abides eternally). ''This is the word preached unto you'' (touto estin to rhēma to euangelisthen — this is the word gospelled to you, the word proclaimed as good news). The climactic identification: the eternal, imperishable word of Isaiah 40:8 is the very gospel preached to them. The message they received is not a human invention that will fade but the eternal word of God that will outlast the universe.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Peter' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 3 (Living hope / begotten again)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀναγεννήσας', 'anagennēsas', 'G313', 'Having begotten again, having caused to be born anew — from ana (again) + gennaō (to beget). God''s sovereign act of regeneration, giving new spiritual life. Used only by Peter (here and 1:23).', 1),
  ('ἐλπίδα ζῶσαν', 'elpida zōsan', 'G1680/G2198', 'A living hope — hope that is alive, active, growing, and indestructible because it is grounded in the resurrection of a living Christ. Unlike dead hopes that perish with circumstances.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 4 (Inheritance)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄφθαρτον', 'aphtharton', 'G862', 'Incorruptible, imperishable — from a (not) + phtheirō (to decay). Cannot rot, cannot be destroyed. Unlike earthly inheritances that decay over time, this one is eternal.', 1),
  ('ἀμάραντον', 'amaranton', 'G263', 'Unfading — from a (not) + marainō (to wither). Cannot lose its beauty or freshness. The amaranth flower was legendary for never wilting. Our inheritance never fades.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = 4;

-- Verse 5 (Kept by the power of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φρουρουμένους', 'phrouroumenous', 'G5432', 'Guarded, garrisoned, kept under military protection — from phroureo, to guard like a sentinel. Present passive: continuously being protected by God''s power. The believer is garrisoned by omnipotence.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 7 (Trial of faith / more precious than gold)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δοκίμιον', 'dokimion', 'G1383', 'Testing, the proving process — the crucible that tests the genuineness of faith. The same word James uses (1:3). As fire reveals whether gold is genuine, trials reveal whether faith is genuine.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 19 (Precious blood / lamb)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('τιμίῳ', 'timiō', 'G5093', 'Precious, of great value, costly — the blood of Christ is priceless, of infinite worth. Not precious because it is rare but because of who shed it: the sinless Son of God.', 1),
  ('ἀμνοῦ', 'amnou', 'G286', 'Lamb — a sacrificial lamb. Echoes the Passover lamb (Exod 12), the lamb of Isaiah 53:7, and John the Baptist''s declaration: "Behold the Lamb of God" (John 1:29). Christ is the ultimate, final sacrifice.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = 19;

-- Verse 23 (Born again / incorruptible seed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σπορᾶς', 'sporas', 'G4701', 'Seed, that which is sown — the origin of our word "spore." The new birth comes from imperishable seed — the word of God. The quality of the seed determines the quality of the life it produces.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Elect / foreknowledge / sprinkling
  (2, 'Romans 8:29', 1), (2, 'Exodus 24:7-8', 2), (2, '2 Thessalonians 2:13', 3),
  -- v3: Living hope / resurrection
  (3, 'Ephesians 2:4-5', 1), (3, 'Romans 6:4', 2), (3, '1 Corinthians 15:20', 3),
  -- v4: Inheritance incorruptible
  (4, 'Colossians 1:12', 1), (4, 'Hebrews 9:15', 2), (4, 'Matthew 6:20', 3),
  -- v5: Kept by God''s power
  (5, 'John 10:28-29', 1), (5, 'Jude 1:24', 2), (5, 'Philippians 1:6', 3),
  -- v7: Trial of faith more precious than gold
  (7, 'James 1:2-3', 1), (7, 'Job 23:10', 2), (7, 'Zechariah 13:9', 3),
  -- v8: Love and joy without seeing
  (8, 'John 20:29', 1), (8, '2 Corinthians 5:7', 2), (8, 'Hebrews 11:1', 3),
  -- v11: Spirit of Christ in the prophets
  (11, '2 Peter 1:21', 1), (11, 'Luke 24:25-27', 2), (11, 'Isaiah 53:3-12', 3),
  -- v16: Be ye holy for I am holy
  (16, 'Leviticus 11:44-45', 1), (16, 'Leviticus 19:2', 2), (16, 'Hebrews 12:14', 3),
  -- v18: Redeemed not with silver and gold
  (18, 'Mark 10:45', 1), (18, 'Acts 20:28', 2), (18, 'Psalm 49:7-8', 3),
  -- v19: Precious blood / lamb without blemish
  (19, 'John 1:29', 1), (19, 'Exodus 12:5', 2), (19, 'Isaiah 53:7', 3),
  -- v23: Born again of incorruptible seed
  (23, 'James 1:18', 1), (23, 'John 1:13', 2), (23, 'John 3:3-5', 3),
  -- v25: Word of the Lord endureth forever
  (25, 'Isaiah 40:6-8', 1), (25, 'Matthew 24:35', 2), (25, 'Psalm 119:89', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Peter Chapter 1 Complete
-- 25 verses · 7 key verses with word studies (10 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════