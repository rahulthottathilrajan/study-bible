-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 4 — Treasure in Earthen Vessels
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  '2 Corinthians 4 is one of the most powerful meditations on suffering and glory in the NT. Paul declares: ''Therefore seeing we have this ministry, as we have received mercy, we faint not'' (v.1). He renounces underhanded methods: ''we have renounced the hidden things of dishonesty, not walking in craftiness, nor handling the word of God deceitfully'' (v.2). For the spiritually blind, ''the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Christ, who is the image of God, should shine unto them'' (v.4). The gospel''s content is ''Jesus Christ the Lord; and ourselves your servants for Jesus'' sake'' (v.5). The famous declaration follows: ''God, who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of God in the face of Jesus Christ'' (v.6). Then the central metaphor: ''But we have this treasure in earthen vessels, that the excellency of the power may be of God, and not of us'' (v.7). Paul catalogs his sufferings — ''troubled on every side, yet not distressed; perplexed, but not in despair; persecuted, but not forsaken; cast down, but not destroyed'' (vv.8-9). The chapter closes with the immortal contrast: ''our light affliction, which is but for a moment, worketh for us a far more exceeding and eternal weight of glory; while we look not at the things which are seen, but at the things which are not seen'' (vv.17-18).',
  'Treasure in Earthen Vessels, Eternal Weight of Glory',
  'ὀστράκινος (ostrakinos)',
  'Earthen, made of baked clay — from ostrakon (a clay potsherd). The cheapest, most fragile, most expendable container in the ancient world. Paul deliberately chose the most humble vessel to contain the most priceless treasure, demonstrating that the power belongs to God, not to the container.',
  '["Integrity of Ministry and the Veiled Gospel (vv.1-4): Therefore seeing we have this ministry as we have received mercy we faint not but have renounced the hidden things of dishonesty not walking in craftiness nor handling the word of God deceitfully but by manifestation of the truth commending ourselves to every man''s conscience in the sight of God; but if our gospel be hid it is hid to them that are lost in whom the god of this world hath blinded the minds of them which believe not lest the light of the glorious gospel of Christ who is the image of God should shine unto them","The Light of the Gospel and Treasure in Earthen Vessels (vv.5-7): For we preach not ourselves but Christ Jesus the Lord and ourselves your servants for Jesus'' sake for God who commanded the light to shine out of darkness hath shined in our hearts to give the light of the knowledge of the glory of God in the face of Jesus Christ but we have this treasure in earthen vessels that the excellency of the power may be of God and not of us","Suffering and the Death of Jesus at Work (vv.8-12): We are troubled on every side yet not distressed perplexed but not in despair persecuted but not forsaken cast down but not destroyed always bearing about in the body the dying of the Lord Jesus that the life also of Jesus might be made manifest in our body; for we which live are alway delivered unto death for Jesus'' sake that the life also of Jesus might be made manifest in our mortal flesh so then death worketh in us but life in you","Faith Hope and the Eternal Weight of Glory (vv.13-18): We having the same spirit of faith according as it is written I believed and therefore have I spoken we also believe and therefore speak knowing that he which raised up the Lord Jesus shall raise up us also by Jesus and shall present us with you; for our light affliction which is but for a moment worketh for us a far more exceeding and eternal weight of glory while we look not at the things which are seen but at the things which are not seen for the things which are seen are temporal but the things which are not seen are eternal"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Therefore seeing we have this ministry, as we have received mercy, we faint not;',
   'Διὰ τοῦτο ἔχοντες τὴν διακονίαν ταύτην καθὼς ἠλεήθημεν οὐκ ἐκκακοῦμεν',
   'Dia touto echontes tēn diakonian tautēn kathōs ēleēthēmen ouk enkakumen',
   '''This ministry'' (tēn diakonian tautēn — this specific ministry: the new covenant ministry described in chapter 3). ''Received mercy'' (ēleēthēmen — we were shown mercy; passive: mercy was given to us, not earned). ''Faint not'' (ouk enkakumen — we do not grow weary, we do not lose heart; from en + kakos — to turn cowardly within). The connection between mercy received and endurance: Paul endures because he was shown mercy; the ministry sustains him because it was given by grace.',
   NULL),
  (2, 'But have renounced the hidden things of dishonesty, not walking in craftiness, nor handling the word of God deceitfully; but by manifestation of the truth commending ourselves to every man''s conscience in the sight of God.',
   'ἀλλ᾿ ἀπειπάμεθα τὰ κρυπτὰ τῆς αἰσχύνης μὴ περιπατοῦντες ἐν πανουργίᾳ μηδὲ δολοῦντες τὸν λόγον τοῦ θεοῦ ἀλλὰ τῇ φανερώσει τῆς ἀληθείας συνιστῶντες ἑαυτοὺς πρὸς πᾶσαν συνείδησιν ἀνθρώπων ἐνώπιον τοῦ θεοῦ',
   'all'' apeipametha ta krypta tēs aischynēs mē peripatountes en panourgia mēde dolountes ton logon tou theou alla tē phanerōsei tēs alētheias synistōntes heautous pros pasan syneidēsin anthrōpōn enōpion tou theou',
   '''Renounced'' (apeipametha — disowned, repudiated once for all). ''Hidden things of dishonesty'' (krypta tēs aischynēs — shameful hidden practices). ''Craftiness'' (panourgia — cunning, trickery; literally ''ready to do anything''). ''Handling deceitfully'' (dolountes — adulterating, falsifying; from dolos, a bait or lure). ''Manifestation of the truth'' (phanerōsei tēs alētheias — the open display of truth). Paul''s ministry is characterized by transparency before God and men — no manipulation, no adulteration, no hidden agenda.',
   NULL),
  (3, 'But if our gospel be hid, it is hid to them that are lost:',
   'εἰ δὲ καὶ ἔστιν κεκαλυμμένον τὸ εὐαγγέλιον ἡμῶν ἐν τοῖς ἀπολλυμένοις ἐστὶν κεκαλυμμένον',
   'ei de kai estin kekalymmenon to euangelion hēmōn en tois apollymenois estin kekalymmenon',
   '''Hid'' (kekalymmenon — veiled, covered; the same root as kalymma in 3:13-16, connecting the veil on Moses'' face to the veil on unbelieving hearts). ''Lost'' (apollymenois — perishing; present participle: those in the process of being destroyed). The gospel is not obscure in itself; it is ''veiled'' only to those who are perishing. The fault lies not with the message but with the blinded receiver.',
   NULL),
  (4, 'In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Christ, who is the image of God, should shine unto them.',
   'ἐν οἷς ὁ θεὸς τοῦ αἰῶνος τούτου ἐτύφλωσεν τὰ νοήματα τῶν ἀπίστων εἰς τὸ μὴ αὐγάσαι αὐτοῖς τὸν φωτισμὸν τοῦ εὐαγγελίου τῆς δόξης τοῦ Χριστοῦ ὅς ἐστιν εἰκὼν τοῦ θεοῦ',
   'en hois ho theos tou aiōnos toutou etyphlōsen ta noēmata tōn apistōn eis to mē augasai autois ton phōtismon tou euangeliou tēs doxēs tou Christou hos estin eikōn tou theou',
   '''The god of this world'' (ho theos tou aiōnos toutou — the god of this age; Satan, who exercises temporary dominion over the present evil age). ''Blinded'' (etyphlōsen — has blinded; aorist: a decisive act of blinding). ''Minds'' (noēmata — thoughts, mental faculties; cf. 2:11). ''The light of the glorious gospel'' (ton phōtismon tou euangeliou tēs doxēs — the illumination of the gospel of the glory). ''Image of God'' (eikōn tou theou — Christ is the visible representation of the invisible God; cf. Col 1:15). The stakes are cosmic: Satan actively works to prevent the gospel''s light from illuminating darkened minds.',
   'This verse combines several crucial doctrines: (1) Satan is ''the god of this age'' — a real being with real power over human minds, though under God''s sovereign permission. (2) Unbelief is not merely intellectual but spiritual — Satan actively blinds minds. (3) Christ is ''the image of God'' — one of the highest christological titles, affirming that to see Christ is to see God (John 14:9). (4) The gospel is light — it illuminates; and the blindness prevents illumination. The spiritual battle over the gospel is ultimately a battle over whether the glory of Christ will be seen.'),
  (5, 'For we preach not ourselves, but Christ Jesus the Lord; and ourselves your servants for Jesus'' sake.',
   'οὐ γὰρ ἑαυτοὺς κηρύσσομεν ἀλλὰ Χριστὸν Ἰησοῦν κύριον ἑαυτοὺς δὲ δούλους ὑμῶν διὰ Ἰησοῦν',
   'ou gar heautous kēryssomen alla Christon Iēsoun kyrion heautous de doulous hymōn dia Iēsoun',
   '''We preach not ourselves'' (ou heautous kēryssomen — we do not proclaim ourselves as the message). ''Christ Jesus the Lord'' (Christon Iēsoun kyrion — the full christological confession: Christ [Messiah], Jesus [the historical person], Lord [divine sovereign]). ''Servants'' (doulous — slaves; the strongest term for servitude). ''For Jesus'' sake'' (dia Iēsoun — on account of Jesus; Jesus is the motivation for servant-ministry). The preacher''s content is Christ; the preacher''s posture is slavery to the audience for Christ''s sake.',
   NULL),
  (6, 'For God, who commanded the light to shine out of darkness, hath shined in our hearts, to give the light of the knowledge of the glory of God in the face of Jesus Christ.',
   'ὅτι ὁ θεὸς ὁ εἰπών ἐκ σκότους φῶς λάμψαι ὃς ἔλαμψεν ἐν ταῖς καρδίαις ἡμῶν πρὸς φωτισμὸν τῆς γνώσεως τῆς δόξης τοῦ θεοῦ ἐν προσώπῳ Ἰησοῦ Χριστοῦ',
   'hoti ho theos ho eipōn ek skotous phōs lampsai hos elampsen en tais kardiais hēmōn pros phōtismon tēs gnōseōs tēs doxēs tou theou en prosōpō Iēsou Christou',
   '''God who commanded the light to shine out of darkness'' — a direct allusion to Genesis 1:3 (''Let there be light''). ''Hath shined in our hearts'' (elampsen en tais kardiais hēmōn — shone in our hearts; the same God who created physical light creates spiritual illumination). ''The knowledge of the glory of God'' — a chain of genitives building to a climax. ''In the face of Jesus Christ'' (en prosōpō Iēsou Christou — in the person/face of Jesus Christ). Conversion is a new creation: the same creative power that produced light from darkness now illuminates the human heart with the knowledge of God''s glory seen in Christ.',
   'This verse draws an explicit parallel between creation (Gen 1:3) and conversion. Both are acts of sovereign divine power speaking light into darkness. The darkness cannot produce its own light; God must command it. This demolishes all notions of self-salvation or self-enlightenment. The ''face of Jesus Christ'' connects to 3:18 — Moses'' face reflected fading glory; Christ''s face radiates unfading, surpassing glory. The chain ''knowledge of the glory of God in the face of Jesus Christ'' is the summary of Paul''s entire gospel: God is known, his glory is seen, and the venue is the person of Jesus Christ.'),
  (7, 'But we have this treasure in earthen vessels, that the excellency of the power may be of God, and not of us.',
   'ἔχομεν δὲ τὸν θησαυρὸν τοῦτον ἐν ὀστρακίνοις σκεύεσιν ἵνα ἡ ὑπερβολὴ τῆς δυνάμεως ᾖ τοῦ θεοῦ καὶ μὴ ἐξ ἡμῶν',
   'echomen de ton thēsauron touton en ostrakinois skeuesin hina hē hyperbolē tēs dynameōs ē tou theou kai mē ex hēmōn',
   '''Treasure'' (thēsauron — treasure, a stored wealth; the gospel, the knowledge of God''s glory). ''Earthen vessels'' (ostrakinois skeuesin — clay pots, pottery jars; the cheapest and most breakable containers). ''Excellency'' (hyperbolē — the surpassing quality, the exceeding greatness; the same word as 1:8 ''pressed out of measure''). ''Of God, and not of us'' — the purpose clause (hina) reveals divine design: the fragility of the container is intentional so that the power is clearly God''s, not human. Paul''s weakness is not an obstacle to ministry but its intended condition.',
   'This is one of the most quoted verses in 2 Corinthians and encapsulates the epistle''s central paradox: divine treasure in fragile human containers. The choice of ''earthen vessels'' (ostrakinois) is precise — not silver, not gold, not even wood, but cheap, disposable clay pottery. God deliberately places infinite treasure in finite, breakable containers so that ''the excellency of the power'' is unmistakably attributed to him. This principle applies to all Christian ministry: weakness, limitation, and fragility are not defects to be overcome but the very design by which God displays his power. The treasure shines brighter for the plainness of the vessel.'),
  (8, 'We are troubled on every side, yet not distressed; we are perplexed, but not in despair;',
   'ἐν παντὶ θλιβόμενοι ἀλλ᾿ οὐ στενοχωρούμενοι ἀπορούμενοι ἀλλ᾿ οὐκ ἐξαπορούμενοι',
   'en panti thlibomenoi all'' ou stenochōroumenoi aporoumenoi all'' ouk exaporoumenoi',
   '''Troubled'' (thlibomenoi — pressed, compressed). ''Not distressed'' (ou stenochōroumenoi — not hemmed in, not crushed; from stenos + chōra, a narrow space). ''Perplexed'' (aporoumenoi — at a loss, without a way). ''Not in despair'' (ouk exaporoumenoi — not utterly at a loss; the intensifying prefix ex- is denied). Four pairs of opposites begin here (vv.8-9): each pair shows pressure that does not produce collapse. The clay pot cracks but does not shatter — because the treasure within sustains it.',
   NULL),
  (9, 'Persecuted, but not forsaken; cast down, but not destroyed;',
   'διωκόμενοι ἀλλ᾿ οὐκ ἐγκαταλειπόμενοι καταβαλλόμενοι ἀλλ᾿ οὐκ ἀπολλύμενοι',
   'diōkomenoi all'' ouk enkatalipomenoi kataballomenoi all'' ouk apollymenoi',
   '''Persecuted'' (diōkomenoi — pursued, hunted down). ''Not forsaken'' (ouk enkatalipomenoi — not abandoned, not left behind in the lurch). ''Cast down'' (kataballomenoi — thrown down, struck down). ''Not destroyed'' (ouk apollymenoi — not perishing, not annihilated). The series builds to a climax: external circumstances worsen (troubled → perplexed → persecuted → cast down), but the inner reality resists each escalation. God''s power in the vessel prevents ultimate defeat.',
   NULL),
  (10, 'Always bearing about in the body the dying of the Lord Jesus, that the life also of Jesus might be made manifest in our body.',
   'πάντοτε τὴν νέκρωσιν τοῦ κυρίου Ἰησοῦ ἐν τῷ σώματι περιφέροντες ἵνα καὶ ἡ ζωὴ τοῦ Ἰησοῦ ἐν τῷ σώματι ἡμῶν φανερωθῇ',
   'pantote tēn nekrōsin tou kyriou Iēsou en tō sōmati peripherontes hina kai hē zōē tou Iēsou en tō sōmati hēmōn phanerōthē',
   '''The dying of the Lord Jesus'' (tēn nekrōsin tou kyriou Iēsou — the death-process, the putting to death; nekrōsis is not thanatos [death as event] but the process of dying, the constant experience of mortal danger). ''Bearing about'' (peripherontes — carrying around everywhere; present participle: continually transporting). ''That the life also of Jesus might be made manifest'' — purpose clause: death-experience is the condition for life-manifestation. The pattern of Jesus'' death and resurrection is replicated in Paul''s bodily experience: constant dying produces visible resurrection life.',
   'This verse introduces the cruciform pattern of apostolic existence: the life of Jesus becomes visible precisely through the dying of Jesus carried in the body. This is not mysticism but embodied theology — Paul''s physical sufferings mirror Christ''s cross, and through that mirroring, Christ''s resurrection life becomes visible to others. The paradox is intentional: life comes through death, power through weakness, glory through suffering. This is the same pattern as the cross itself and is therefore the authenticating mark of genuine apostolic ministry.'),
  (11, 'For we which live are alway delivered unto death for Jesus'' sake, that the life also of Jesus might be made manifest in our mortal flesh.',
   'ἀεὶ γὰρ ἡμεῖς οἱ ζῶντες εἰς θάνατον παραδιδόμεθα διὰ Ἰησοῦν ἵνα καὶ ἡ ζωὴ τοῦ Ἰησοῦ φανερωθῇ ἐν τῇ θνητῇ σαρκὶ ἡμῶν',
   'aei gar hēmeis hoi zōntes eis thanaton paradidometha dia Iēsoun hina kai hē zōē tou Iēsou phanerōthē en tē thnētē sarki hēmōn',
   '''We which live'' (hēmeis hoi zōntes — we the living; those still alive). ''Delivered unto death'' (eis thanaton paradidometha — handed over to death; the same verb used for Christ''s betrayal: paradidōmi). ''For Jesus'' sake'' (dia Iēsoun). ''Mortal flesh'' (thnētē sarki — dying flesh; the emphasis on mortality intensifies the contrast with the life of Jesus shining through it). Paul''s life is a continuous re-enactment of Christ''s death-to-life pattern in the arena of physical existence.',
   NULL),
  (12, 'So then death worketh in us, but life in you.',
   'ὥστε ὁ θάνατος ἐν ἡμῖν ἐνεργεῖται ἡ δὲ ζωὴ ἐν ὑμῖν',
   'hōste ho thanatos en hēmin energeitai hē de zōē en hymin',
   '''Death worketh in us'' (ho thanatos en hēmin energeitai — death is operative in us, death is at work in us). ''Life in you'' (hē zōē en hymin — life is at work in you). The economy of ministry: the minister''s death produces the converts'' life. Paul''s suffering is not meaningless but generative — it produces spiritual life in the Corinthians. This is the apostolic application of Christ''s own principle: ''Except a corn of wheat fall into the ground and die, it abideth alone'' (John 12:24).',
   NULL),
  (13, 'We having the same spirit of faith, according as it is written, I believed, and therefore have I spoken; we also believe, and therefore speak;',
   'ἔχοντες δὲ τὸ αὐτὸ πνεῦμα τῆς πίστεως κατὰ τὸ γεγραμμένον ἐπίστευσα διὸ ἐλάλησα καὶ ἡμεῖς πιστεύομεν διὸ καὶ λαλοῦμεν',
   'echontes de to auto pneuma tēs pisteōs kata to gegrammenon episteusa dio elalēsa kai hēmeis pisteuomen dio kai laloumen',
   '''The same spirit of faith'' — the same quality of faith that animated the Psalmist. ''I believed, and therefore have I spoken'' — a quotation from Psalm 116:10 (LXX 115:1). Faith and speech are inseparable: genuine belief compels verbal testimony. Paul endures and speaks despite suffering because faith drives him to proclaim what he believes, regardless of circumstances.',
   NULL),
  (14, 'Knowing that he which raised up the Lord Jesus shall raise up us also by Jesus, and shall present us with you.',
   'εἰδότες ὅτι ὁ ἐγείρας τὸν κύριον Ἰησοῦν καὶ ἡμᾶς διὰ Ἰησοῦ ἐγερεῖ καὶ παραστήσει σὺν ὑμῖν',
   'eidotes hoti ho egeiras ton kyrion Iēsoun kai hēmas dia Iēsou egerei kai parastēsei syn hymin',
   '''He which raised up the Lord Jesus'' — the resurrection of Jesus is the ground of all Christian hope. ''Raise up us also'' (kai hēmas egerei — will raise us too; future tense: a certainty yet to be realized). ''By Jesus'' (dia Iēsou — through Jesus; Jesus is the agent of resurrection). ''Present us with you'' (parastēsei syn hymin — will place us alongside you; Paul and the Corinthians will stand together before God). The resurrection hope transforms present suffering: death is not the end but the doorway to being presented with the redeemed community before God.',
   NULL),
  (15, 'For all things are for your sakes, that the abundant grace might through the thanksgiving of many redound to the glory of God.',
   'τὰ γὰρ πάντα δι᾿ ὑμᾶς ἵνα ἡ χάρις πλεονάσασα διὰ τῶν πλειόνων τὴν εὐχαριστίαν περισσεύσῃ εἰς τὴν δόξαν τοῦ θεοῦ',
   'ta gar panta di'' hymas hina hē charis pleonasasa dia tōn pleionōn tēn eucharistian perisseusē eis tēn doxan tou theou',
   '''All things are for your sakes'' (ta panta di'' hymas — everything is on your account; Paul''s suffering, ministry, and endurance all serve the Corinthians). ''Abundant grace'' (hē charis pleonasasa — grace having multiplied). ''Thanksgiving of many'' (dia tōn pleionōn tēn eucharistian — through the thanksgiving of the greater number). ''Glory of God'' — the ultimate telos: grace → many people → thanksgiving → God''s glory. The chain runs from God''s grace through the community''s gratitude back to God''s glory.',
   NULL),
  (16, 'For which cause we faint not; but though our outward man perish, yet the inward man is renewed day by day.',
   'διὸ οὐκ ἐκκακοῦμεν ἀλλ᾿ εἰ καὶ ὁ ἔξω ἡμῶν ἄνθρωπος διαφθείρεται ἀλλ᾿ ὁ ἔσωθεν ἀνακαινοῦται ἡμέρᾳ καὶ ἡμέρᾳ',
   'dio ouk enkakumen all'' ei kai ho exō hēmōn anthrōpos diaphtheiretai all'' ho esōthen anakainoutai hēmera kai hēmera',
   '''Faint not'' (ouk enkakumen — we do not lose heart; echoing v.1). ''Outward man'' (ho exō anthrōpos — the outer person; the physical body subject to decay and death). ''Perish'' (diaphtheiretai — is being destroyed, is decaying; present passive: an ongoing process). ''Inward man'' (ho esōthen — the inner person; the spiritual self being renewed by the Spirit). ''Renewed day by day'' (anakainoutai hēmera kai hēmera — is being renewed daily; the present passive indicates continuous divine renewal). The two processes run simultaneously: outward decay and inward renewal. The clay pot is crumbling, but the treasure within grows brighter.',
   NULL),
  (17, 'For our light affliction, which is but for a moment, worketh for us a far more exceeding and eternal weight of glory;',
   'τὸ γὰρ παραυτίκα ἐλαφρὸν τῆς θλίψεως ἡμῶν καθ᾿ ὑπερβολὴν εἰς ὑπερβολὴν αἰώνιον βάρος δόξης κατεργάζεται ἡμῖν',
   'to gar parautika elaphron tēs thlipseōs hēmōn kath'' hyperbolēn eis hyperbolēn aiōnion baros doxēs katergazetai hēmin',
   '''Light affliction'' (elaphron tēs thlipseōs — the lightness of our affliction; Paul calls his sufferings ''light'' — an astonishing understatement given 11:23-28). ''For a moment'' (parautika — momentary, lasting only the present instant). ''Far more exceeding'' (kath'' hyperbolēn eis hyperbolēn — beyond all measure to beyond all measure; a double superlative piling excess upon excess). ''Eternal weight of glory'' (aiōnion baros doxēs — an everlasting heaviness of glory; ''weight'' [baros] contrasts with ''light'' [elaphron]: the affliction is light and momentary; the glory is heavy and eternal). ''Worketh'' (katergazetai — produces, accomplishes; present tense: suffering is actively manufacturing glory).',
   'This verse contains one of the most extraordinary recalibrations of suffering in all literature. Paul — beaten, stoned, shipwrecked, imprisoned — calls his afflictions ''light'' and ''momentary.'' This is not denial but eschatological mathematics: when measured against eternal glory, the heaviest earthly suffering is literally weightless. The phrase ''kath'' hyperbolēn eis hyperbolēn'' (excess upon excess) strains language to breaking point, reaching for a glory so vast that human words cannot contain it. The critical verb ''worketh'' (katergazetai) means that suffering does not merely precede glory but actively produces it — affliction is the factory of glory.'),
  (18, 'While we look not at the things which are seen, but at the things which are not seen: for the things which are seen are temporal; but the things which are not seen are eternal.',
   'μὴ σκοπούντων ἡμῶν τὰ βλεπόμενα ἀλλὰ τὰ μὴ βλεπόμενα τὰ γὰρ βλεπόμενα πρόσκαιρα τὰ δὲ μὴ βλεπόμενα αἰώνια',
   'mē skopountōn hēmōn ta blepomena alla ta mē blepomena ta gar blepomena proskaira ta de mē blepomena aiōnia',
   '''Look'' (skopountōn — fixing our gaze, keeping our eyes on; from skopos, a target). ''Things which are seen'' (ta blepomena — the visible things). ''Things which are not seen'' (ta mē blepomena — the invisible things). ''Temporal'' (proskaira — for a season, temporary; from pros + kairos, lasting only for a time). ''Eternal'' (aiōnia — belonging to the age to come, everlasting). The key to endurance is focus: where you fix your gaze determines what you can bear. Paul looks not at the crumbling outward man or the momentary affliction but at the eternal weight of glory. Faith is seeing the invisible.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 4;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 god of this world / image
  ('εἰκών', 'eikōn', 'G1504', 'Image, likeness, exact representation — Christ is the eikōn of God: not a mere reflection but the exact visible representation of the invisible God. In Christ, the invisible God becomes visible, knowable, and approachable. Cf. Colossians 1:15, Hebrews 1:3.', 1),
  -- v.6 light from darkness
  ('φωτισμός', 'phōtismos', 'G5462', 'Illumination, enlightenment, the act of giving light — the spiritual counterpart of God''s ''Let there be light'' in creation. Conversion is new creation: God speaks light into the darkness of the human heart, illuminating it with the knowledge of his glory.', 2),
  -- v.7 earthen vessels
  ('ὀστράκινος', 'ostrakinos', 'G3749', 'Made of baked clay, earthenware — from ostrakon (potsherd). The cheapest, most fragile vessel in the ancient world. God chose this analogy deliberately: the humbler the container, the more clearly the treasure''s value is seen. The fragility of the minister guarantees that the power is recognized as God''s.', 3),
  ('θησαυρός', 'thēsauros', 'G2344', 'Treasure, stored wealth — the gospel, the knowledge of God''s glory in Christ. The contrast between the infinite value of the treasure and the worthlessness of the container is the genius of God''s design: ''that the excellency of the power may be of God, and not of us.''', 4),
  -- v.10 dying/nekrosis
  ('νέκρωσις', 'nekrōsis', 'G3500', 'Dying, death-process, putting to death — not thanatos (death as a completed event) but the ongoing process of dying. Paul carries the dying of Jesus as a continuous experience — daily exposure to mortal danger that mirrors Christ''s own path to the cross. The death-process is the condition for manifesting resurrection life.', 5),
  -- v.16 renewed
  ('ἀνακαινόω', 'anakainoō', 'G341', 'To renew, to make new again — from ana (again) + kainos (new in quality). Present passive: the inner person is being continuously made new by God''s action. While the outer body decays, the inner person experiences daily renovation — a counter-process to physical aging and suffering.', 6),
  -- v.17 weight of glory
  ('βάρος', 'baros', 'G922', 'Weight, heaviness, burden — deliberately contrasted with ''light'' (elaphron) affliction. Glory has substance, gravity, permanence. The Hebrew word for glory (kabod) also derives from a root meaning ''heavy.'' Eternal glory outweighs temporal suffering infinitely.', 7)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 4
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 6
    WHEN 3 THEN 7 WHEN 4 THEN 7
    WHEN 5 THEN 10
    WHEN 6 THEN 16
    WHEN 7 THEN 17
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 god of this world / image of God
  (4, 'John 12:31', 1),
  (4, 'Ephesians 2:2', 2),
  (4, 'Colossians 1:15', 3),
  (4, 'Hebrews 1:3', 4),
  -- v.6 light out of darkness
  (6, 'Genesis 1:3', 5),
  (6, 'Isaiah 9:2', 6),
  (6, 'John 1:4-5', 7),
  (6, '2 Peter 1:19', 8),
  -- v.7 treasure in earthen vessels
  (7, 'Judges 7:16-20', 9),
  (7, '2 Corinthians 12:9-10', 10),
  (7, '1 Corinthians 1:27-29', 11),
  -- v.8-9 affliction catalog
  (8, '2 Corinthians 6:4-10', 12),
  (8, '2 Corinthians 11:23-28', 13),
  -- v.10 dying of Jesus
  (10, 'Romans 6:5-8', 14),
  (10, 'Philippians 3:10-11', 15),
  (10, 'Galatians 2:20', 16),
  -- v.14 raised with Jesus
  (14, 'Romans 8:11', 17),
  (14, '1 Corinthians 6:14', 18),
  (14, '1 Thessalonians 4:14', 19),
  -- v.16 inward man renewed
  (16, 'Ephesians 3:16', 20),
  (16, 'Romans 7:22', 21),
  (16, 'Colossians 3:10', 22),
  -- v.17 light affliction / weight of glory
  (17, 'Romans 8:18', 23),
  (17, '1 Peter 1:6-7', 24),
  (17, 'Romans 8:28', 25),
  -- v.18 things not seen
  (18, 'Hebrews 11:1', 26),
  (18, 'Romans 8:24-25', 27),
  (18, 'Colossians 3:1-2', 28)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 4
  AND v.verse_number = cr.verse_number;
