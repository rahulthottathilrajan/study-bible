-- ═══════════════════════════════════════════════════
-- 2 PETER CHAPTER 1 — The Divine Nature and Sure Prophecy
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '2 Peter 1 lays the doctrinal foundation for the entire epistle. Writing near the end of his life (v.14), Peter establishes the basis for Christian growth and assurance. Through God''s ''divine power'' and ''exceeding great and precious promises,'' believers become ''partakers of the divine nature'' (vv.3-4). Peter then presents the famous ''ladder of virtues'' — faith, virtue, knowledge, temperance, patience, godliness, brotherly kindness, and charity (vv.5-7) — and warns that without these qualities one is ''blind'' and forgetful of past cleansing (v.9). Making one''s calling and election sure (v.10) guarantees an ''abundant entrance'' into Christ''s eternal kingdom (v.11). The chapter closes with Peter''s testimony as an eyewitness of Christ''s majesty on the Mount of Transfiguration (vv.16-18) and a magnificent statement on the inspiration of Scripture: ''holy men of God spake as they were moved by the Holy Ghost'' (v.21).',
  'Growth in Grace and the Certainty of Scripture',
  'θείας κοινωνοὶ φύσεως (theias koinōnoi physeōs)',
  'Partakers of the divine nature — participants in, sharers of God''s own nature. Not deification but genuine participation in God''s moral character through the new birth and the indwelling Spirit.',
  '["Greeting: Equal Faith (vv.1-2): Simon Peter to those who have obtained like precious faith; grace and peace through the knowledge of God and Jesus","Divine Power and Precious Promises (vv.3-4): His divine power hath given us all things for life and godliness; exceeding great and precious promises; partakers of the divine nature; escaped the corruption in the world through lust","The Ladder of Virtue (vv.5-9): Add to your faith virtue, knowledge, temperance, patience, godliness, brotherly kindness, charity; these things make you fruitful; lacking them makes one blind","Make Your Calling Sure (vv.10-11): Give diligence to make your calling and election sure; ye shall never fall; abundant entrance into the everlasting kingdom","Peter''s Farewell Testimony (vv.12-15): I will not be negligent to put you in remembrance; knowing that I must put off this tabernacle; I will endeavour that ye may remember after my decease","Eyewitness of Christ''s Majesty (vv.16-18): We have not followed cunningly devised fables; we were eyewitnesses of his majesty; the voice from heaven on the holy mount","The Sure Word of Prophecy (vv.19-21): We have a more sure word of prophecy; a light that shineth in a dark place; no prophecy is of private interpretation; holy men spake as they were moved by the Holy Ghost"]'
FROM books b WHERE b.name = '2 Peter';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Simon Peter, a servant and an apostle of Jesus Christ, to them that have obtained like precious faith with us through the righteousness of God and our Saviour Jesus Christ:',
   'Σίμων Πέτρος δοῦλος καὶ ἀπόστολος Ἰησοῦ Χριστοῦ τοῖς ἰσότιμον ἡμῖν λαχοῦσιν πίστιν ἐν δικαιοσύνῃ τοῦ θεοῦ ἡμῶν καὶ σωτῆρος Ἰησοῦ Χριστοῦ',
   'Simōn Petros doulos kai apostolos Iēsou Christou tois isotimon hēmin lachousin pistin en dikaiosynē tou theou hēmōn kai sōtēros Iēsou Christou',
   '''Simon Peter'' — both names: the Hebrew Simon and the Greek Peter (Petros, rock). ''Servant and apostle'' (doulos kai apostolos — slave and sent-one; humility and authority combined). ''Like precious faith'' (isotimon pistin — equally honoured, of equal value; from isos + timē, equal honour). The faith of ordinary believers is of the same quality and value as the apostle''s. ''Obtained'' (lachousin — received by lot, received by divine allotment; not earned but granted). ''God and our Saviour Jesus Christ'' — the single article (tou) governs both ''God'' and ''Saviour,'' applying both titles to Jesus (Granville Sharp''s rule).',
   'The deity of Christ: ''Our God and Saviour Jesus Christ'' (tou theou hēmōn kai sōtēros Iēsou Christou). The Granville Sharp construction in Greek applies both nouns to the same person: Jesus is both God and Saviour. This is one of the clearest NT declarations of Christ''s full deity.'),
  (2,
   'Grace and peace be multiplied unto you through the knowledge of God, and of Jesus our Lord,',
   'χάρις ὑμῖν καὶ εἰρήνη πληθυνθείη ἐν ἐπιγνώσει τοῦ θεοῦ καὶ Ἰησοῦ τοῦ κυρίου ἡμῶν',
   'charis hymin kai eirēnē plēthyntheiē en epignōsei tou theou kai Iēsou tou kyriou hēmōn',
   '''Multiplied'' (plēthyntheiē — may it be multiplied, increased abundantly; optative mood: a prayer-wish for overflowing grace and peace). Not merely given but multiplied. The channel: ''through the knowledge'' (en epignōsei — through full, experiential, personal knowledge; epignōsis is stronger than gnōsis — it is knowledge that grips and transforms). Knowledge of God is the key theme of 2 Peter: epignōsis appears four times (1:2, 3, 8; 2:20). Growth in grace is inseparable from growth in knowledge.',
   NULL),
  (3,
   'According as his divine power hath given unto us all things that pertain unto life and godliness, through the knowledge of him that hath called us to glory and virtue:',
   'ὡς πάντα ἡμῖν τῆς θείας δυνάμεως αὐτοῦ τὰ πρὸς ζωὴν καὶ εὐσέβειαν δεδωρημένης διὰ τῆς ἐπιγνώσεως τοῦ καλέσαντος ἡμᾶς ἰδίᾳ δόξῃ καὶ ἀρετῇ',
   'hōs panta hēmin tēs theias dynameōs autou ta pros zōēn kai eusebeian dedōrēmenēs dia tēs epignōseōs tou kalesantos hēmas idia doxē kai aretē',
   '''Divine power'' (theias dynameōs — God''s own power, the power that belongs to deity). ''Hath given'' (dedōrēmenēs — has granted as a gift, has bestowed; perfect tense: given in the past with ongoing effect). ''All things'' (panta) — not some things but everything needed. ''Life and godliness'' (zōēn kai eusebeian — spiritual life and practical reverence toward God). ''Called us to glory and virtue'' (idia doxē kai aretē — by His own glory and moral excellence). God''s resources are sufficient for every need. No believer can claim lack of provision.',
   NULL),
  (4,
   'Whereby are given unto us exceeding great and precious promises: that by these ye might be partakers of the divine nature, having escaped the corruption that is in the world through lust.',
   'δι᾽ ὧν τὰ τίμια καὶ μέγιστα ἡμῖν ἐπαγγέλματα δεδώρηται ἵνα διὰ τούτων γένησθε θείας κοινωνοὶ φύσεως ἀποφυγόντες τῆς ἐν τῷ κόσμῳ ἐν ἐπιθυμίᾳ φθορᾶς',
   'di'' hōn ta timia kai megista hēmin epangelmata dedōrētai hina dia toutōn genēsthe theias koinōnoi physeōs apophygontes tēs en tō kosmō en epithymia phthoras',
   '''Exceeding great and precious promises'' (timia kai megista epangelmata — honourable, valuable, and supremely great promises). ''Partakers of the divine nature'' (theias koinōnoi physeōs — participants in, sharers of the divine nature). This is not pantheism or deification but genuine participation in God''s moral character — His holiness, love, righteousness, and incorruptibility — through the new birth and the indwelling Spirit. ''Escaped'' (apophygontes — having fled away from, having made a clean break; aorist: a definitive escape). ''Corruption'' (phthoras — decay, ruin, moral decomposition). ''Through lust'' (en epithymia — driven by desire). The world''s corruption is lust-driven; the divine nature is the antidote.',
   'Partakers of the divine nature: This is among the most remarkable statements in Scripture. Believers share in God''s own nature — not becoming gods but receiving God''s moral qualities through regeneration. The Eastern Church has developed this into the doctrine of theosis (divinisation); Western theology emphasises it as sanctification. Both traditions affirm: through Christ, believers genuinely participate in the divine life.'),
  (5,
   'And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge;',
   'καὶ αὐτὸ τοῦτο δὲ σπουδὴν πᾶσαν παρεισενέγκαντες ἐπιχορηγήσατε ἐν τῇ πίστει ὑμῶν τὴν ἀρετήν ἐν δὲ τῇ ἀρετῇ τὴν γνῶσιν',
   'kai auto touto de spoudēn pasan pareisenenkantes epichorēgēsate en tē pistei hymōn tēn aretēn en de tē aretē tēn gnōsin',
   '''Giving all diligence'' (spoudēn pasan pareisenenkantes — bringing alongside every earnestness, applying maximum effort). ''Add'' (epichorēgēsate — supply lavishly, furnish abundantly; from epi + chorēgeō, to supply the chorus; the word originally meant to fund a Greek chorus production at great personal expense — generous, extravagant supply). The ''ladder of virtue'' begins: (1) ''faith'' (pistei — the foundation, the starting point), then add (2) ''virtue'' (aretēn — moral excellence, courage, goodness in action), and to virtue (3) ''knowledge'' (gnōsin — understanding, discernment, wisdom for practical living).',
   NULL),
  (6,
   'And to knowledge temperance; and to temperance patience; and to patience godliness;',
   'ἐν δὲ τῇ γνώσει τὴν ἐγκράτειαν ἐν δὲ τῇ ἐγκρατείᾳ τὴν ὑπομονήν ἐν δὲ τῇ ὑπομονῇ τὴν εὐσέβειαν',
   'en de tē gnōsei tēn enkrateian en de tē enkrateia tēn hypomonēn en de tē hypomonē tēn eusebeian',
   'The ladder continues: (4) ''temperance'' (enkrateian — self-control, mastery over desires and impulses; from en + kratos, inner strength), (5) ''patience'' (hypomonēn — steadfast endurance under trial, the capacity to bear up without collapse; cf. 1 Thess 1:3), (6) ''godliness'' (eusebeian — practical reverence toward God, piety that expresses itself in worship and right living; from eu + sebomai, well + to revere). Each virtue builds upon the previous: knowledge without self-control is dangerous; self-control without endurance is brittle; endurance without godliness is mere stoicism.',
   NULL),
  (7,
   'And to godliness brotherly kindness; and to brotherly kindness charity.',
   'ἐν δὲ τῇ εὐσεβείᾳ τὴν φιλαδελφίαν ἐν δὲ τῇ φιλαδελφίᾳ τὴν ἀγάπην',
   'en de tē eusebeia tēn philadelphian en de tē philadelphia tēn agapēn',
   'The ladder culminates: (7) ''brotherly kindness'' (philadelphian — love of the brothers, family affection within the church; philadelphia), and at the summit (8) ''charity'' (agapēn — self-giving, unconditional love that extends even to enemies). The progression moves from faith (inward trust) through personal virtues (virtue, knowledge, self-control, endurance, godliness) to relational virtues (brotherly kindness, love). Love is the crown — as in Col 3:14, it is the ''bond of perfectness.'' Faith begins the list; love completes it.',
   NULL),
  (8,
   'For if these things be in you, and abound, they make you that ye shall neither be barren nor unfruitful in the knowledge of our Lord Jesus Christ.',
   'ταῦτα γὰρ ὑμῖν ὑπάρχοντα καὶ πλεονάζοντα οὐκ ἀργοὺς οὐδὲ ἀκάρπους καθίστησιν εἰς τὴν τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἐπίγνωσιν',
   'tauta gar hymin hyparchonta kai pleonazonta ouk argous oude akarpous kathistēsin eis tēn tou kyriou hēmōn Iēsou Christou epignōsin',
   '''Be in you and abound'' (hyparchonta kai pleonazonta — existing in you and increasing, multiplying). These virtues must not merely exist but grow. ''Barren'' (argous — idle, inactive, useless; from a-ergos, without work). ''Unfruitful'' (akarpous — without fruit, producing nothing). ''In the knowledge'' (eis tēn epignōsin — toward the full knowledge). The eight virtues produce fruitfulness; their absence produces barrenness. Knowledge of Christ is not static information but a growing, fruit-bearing relationship.',
   NULL),
  (9,
   'But he that lacketh these things is blind, and cannot see afar off, and hath forgotten that he was purged from his old sins.',
   'ᾧ γὰρ μὴ πάρεστιν ταῦτα τυφλός ἐστιν μυωπάζων λήθην λαβὼν τοῦ καθαρισμοῦ τῶν πάλαι αὐτοῦ ἁμαρτιῶν',
   'hō gar mē parestin tauta typhlos estin myōpazōn lēthēn labōn tou katharismou tōn palai autou hamartiōn',
   '''Blind'' (typhlos — sightless, unable to see spiritual reality). ''Cannot see afar off'' (myōpazōn — short-sighted, seeing only what is near; from myōps — closing the eyes, squinting; our word ''myopia''). A vivid image: the person without these virtues can see only the immediate, physical world and cannot perceive eternal realities. ''Hath forgotten'' (lēthēn labōn — has received forgetfulness, has actively taken up oblivion). Spiritual regression is not merely failure to grow but forgetfulness of the foundational reality: the cleansing of past sins at conversion.',
   NULL),
  (10,
   'Wherefore the rather, brethren, give diligence to make your calling and election sure: for if ye do these things, ye shall never fall:',
   'διὸ μᾶλλον ἀδελφοί σπουδάσατε βεβαίαν ὑμῶν τὴν κλῆσιν καὶ ἐκλογὴν ποιεῖσθαι ταῦτα γὰρ ποιοῦντες οὐ μὴ πταίσητέ ποτε',
   'dio mallon adelphoi spoudasate bebaian hymōn tēn klēsin kai eklogēn poieisthai tauta gar poiountes ou mē ptaisēte pote',
   '''Give diligence'' (spoudasate — make every effort, be earnest, be zealous; aorist imperative: act now, decisively). ''Make sure'' (bebaian poieisthai — make firm, make stable, confirm). ''Calling and election'' (klēsin kai eklogēn — your summons and your choosing). Peter does not say election depends on human effort but that its reality is confirmed by spiritual growth. The fruit proves the root. ''Ye shall never fall'' (ou mē ptaisēte pote — you will absolutely never stumble; the strongest possible negation). Active growth provides assurance and stability.',
   'Assurance and election: Peter does not teach that election can be earned or lost but that it can be confirmed or made evident through spiritual growth. The virtues of vv.5-7 are the evidence of genuine election. If one practises them, one demonstrates that the calling and election are real — and one gains subjective assurance of objective election.'),
  (11,
   'For so an entrance shall be ministered unto you abundantly into the everlasting kingdom of our Lord and Saviour Jesus Christ.',
   'οὕτως γὰρ πλουσίως ἐπιχορηγηθήσεται ὑμῖν ἡ εἴσοδος εἰς τὴν αἰώνιον βασιλείαν τοῦ κυρίου ἡμῶν καὶ σωτῆρος Ἰησοῦ Χριστοῦ',
   'houtōs gar plousiōs epichorēgēthēsetai hymin hē eisodos eis tēn aiōnion basileian tou kyriou hēmōn kai sōtēros Iēsou Christou',
   '''Abundantly'' (plousiōs — richly, lavishly; cf. Col 3:16). ''Ministered'' (epichorēgēthēsetai — will be supplied, furnished; the same root as ''add'' in v.5 — what you lavishly supply in virtues, God will lavishly supply in entrance). ''Entrance'' (eisodos — entry, admission). ''Everlasting kingdom'' (aiōnion basileian — the eternal, age-lasting kingdom). The image is of a triumphal entry — not a bare-minimum, last-minute slipping through the door but a rich, full, honourable welcome into the kingdom. The way you enter eternity corresponds to how you lived.',
   NULL),
  (12,
   'Wherefore I will not be negligent to put you always in remembrance of these things, though ye know them, and be established in the present truth.',
   'Διὸ μελλήσω ἀεὶ ὑμᾶς ὑπομιμνῄσκειν περὶ τούτων καίπερ εἰδότας καὶ ἐστηριγμένους ἐν τῇ παρούσῃ ἀληθείᾳ',
   'Dio mellēsō aei hymas hypomimnēskein peri toutōn kaiper eidotas kai estērigmenous en tē parousē alētheia',
   '''I will not be negligent'' (mellēsō — I will be ready, I will be diligent). ''Always'' (aei — perpetually, at every opportunity). ''Put you in remembrance'' (hypomimnēskein — to remind, to call back to mind). ''Though ye know them'' — repetition is necessary even for mature believers. Knowledge can grow cold without reminders. ''Established'' (estērigmenous — made firm, settled, grounded; perfect participle: you stand established). Even established believers need regular reminders of foundational truth.',
   NULL),
  (13,
   'Yea, I think it meet, as long as I am in this tabernacle, to stir you up by putting you in remembrance;',
   'δίκαιον δὲ ἡγοῦμαι ἐφ᾽ ὅσον εἰμὶ ἐν τούτῳ τῷ σκηνώματι διεγείρειν ὑμᾶς ἐν ὑπομνήσει',
   'dikaion de hēgoumai eph'' hoson eimi en toutō tō skēnōmati diegeirein hymas en hypomnēsei',
   '''Tabernacle'' (skēnōmati — tent, temporary dwelling; from skēnē, tent). Peter views his body as a tent — temporary, portable, soon to be taken down. ''Stir you up'' (diegeirein — to wake up, to rouse thoroughly; from dia + egeirō, to raise through). Peter''s remaining ministry is to awaken the church before his departure. The tent image recalls the Feast of Tabernacles, when Israel lived in temporary shelters to remember their pilgrim status.',
   NULL),
  (14,
   'Knowing that shortly I must put off this my tabernacle, even as our Lord Jesus Christ hath shewed me.',
   'εἰδὼς ὅτι ταχινή ἐστιν ἡ ἀπόθεσις τοῦ σκηνώματός μου καθὼς καὶ ὁ κύριος ἡμῶν Ἰησοῦς Χριστὸς ἐδήλωσέν μοι',
   'eidōs hoti tachinē estin hē apothesis tou skēnōmatos mou kathōs kai ho kyrios hēmōn Iēsous Christos edēlōsen moi',
   '''Shortly'' (tachinē — swift, imminent, soon). ''Put off'' (apothesis — the putting off, the laying aside, the removal; like taking off a garment or striking a tent). ''Our Lord Jesus Christ hath shewed me'' (edēlōsen moi — made clear to me, revealed to me). Peter knows his death is imminent — Jesus Himself warned him of it (John 21:18-19, ''when thou art old, thou shalt stretch forth thy hands''). Peter writes with the urgency of a man who knows his time is short.',
   NULL),
  (15,
   'Moreover I will endeavour that ye may be able after my decease to have these things always in remembrance.',
   'σπουδάσω δὲ καὶ ἑκάστοτε ἔχειν ὑμᾶς μετὰ τὴν ἐμὴν ἔξοδον τὴν τούτων μνήμην ποιεῖσθαι',
   'spoudasō de kai hekastote echein hymas meta tēn emēn exodon tēn toutōn mnēmēn poieisthai',
   '''I will endeavour'' (spoudasō — I will make every effort). ''After my decease'' (meta tēn emēn exodon — after my exodus, my departure). ''Exodus'' (exodon) — the same word used of Christ''s death in Luke 9:31 on the Mount of Transfiguration, which Peter is about to mention. Death for the believer is an exodus — a departure from bondage into freedom, from wilderness into promised land. Peter''s legacy is this letter: ensuring the church remembers the truth after the apostles are gone.',
   NULL),
  (16,
   'For we have not followed cunningly devised fables, when we made known unto you the power and coming of our Lord Jesus Christ, but were eyewitnesses of his majesty.',
   'οὐ γὰρ σεσοφισμένοις μύθοις ἐξακολουθήσαντες ἐγνωρίσαμεν ὑμῖν τὴν τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ δύναμιν καὶ παρουσίαν ἀλλ᾽ ἐπόπται γενηθέντες τῆς ἐκείνου μεγαλειότητος',
   'ou gar sesophismenois mythois exakolouthēsantes egnōrisamen hymin tēn tou kyriou hēmōn Iēsou Christou dynamin kai parousian all'' epoptai genēthentes tēs ekeinou megaleiotētos',
   '''Cunningly devised fables'' (sesophismenois mythois — cleverly contrived myths, ingeniously fabricated stories; from sophizō, to make clever, to devise craftily). ''Eyewitnesses'' (epoptai — those who see with their own eyes, spectators; a technical term used in mystery religions for those initiated into the highest level — Peter appropriates it: we saw the reality, not a myth). ''Majesty'' (megaleiotētos — grandeur, magnificence, sublime greatness). Peter was on the mountain and saw Christ''s glory with his own eyes. The gospel is based on historical testimony, not mythological invention.',
   NULL),
  (17,
   'For he received from God the Father honour and glory, when there came such a voice to him from the excellent glory, This is my beloved Son, in whom I am well pleased.',
   'λαβὼν γὰρ παρὰ θεοῦ πατρὸς τιμὴν καὶ δόξαν φωνῆς ἐνεχθείσης αὐτῷ τοιᾶσδε ὑπὸ τῆς μεγαλοπρεποῦς δόξης Ὁ υἱός μου ὁ ἀγαπητός μου οὗτός ἐστιν εἰς ὃν ἐγὼ εὐδόκησα',
   'labōn gar para theou patros timēn kai doxan phōnēs enechtheisēs autō toiasde hypo tēs megaloprepous doxēs Ho huios mou ho agapētos mou houtos estin eis hon egō eudokēsa',
   '''Honour and glory'' (timēn kai doxan — worth/dignity and splendour). ''The excellent glory'' (tēs megaloprepous doxēs — the magnificent glory, the majestic splendour; megaloprepēs is found only here in the NT, from megas + prepō: great + becoming — the glory befitting God''s greatness). ''This is my beloved Son'' — the Father''s own voice at the Transfiguration (cf. Matt 17:5; Mark 9:7; Luke 9:35). Peter heard these words on the mountain and never forgot them. The Transfiguration was a preview of the Parousia glory.',
   NULL),
  (18,
   'And this voice which came from heaven we heard, when we were with him in the holy mount.',
   'καὶ ταύτην τὴν φωνὴν ἡμεῖς ἠκούσαμεν ἐξ οὐρανοῦ ἐνεχθεῖσαν σὺν αὐτῷ ὄντες ἐν τῷ ἁγίῳ ὄρει',
   'kai tautēn tēn phōnēn hēmeis ēkousamen ex ouranou enechtheisan syn autō ontes en tō hagiō orei',
   '''We heard'' (hēmeis ēkousamen — we ourselves heard; emphatic personal testimony). ''From heaven'' (ex ouranou — out of heaven; the voice was from God, not from the mountain). ''When we were with him'' (syn autō ontes — being with Him, in His presence). ''The holy mount'' (tō hagiō orei — the sacred mountain, made holy by God''s presence; its exact location is uncertain, traditionally Mount Tabor or Mount Hermon). Peter, James, and John were there (Matt 17:1). This is an eyewitness report, not hearsay.',
   NULL),
  (19,
   'We have also a more sure word of prophecy; whereunto ye do well that ye take heed, as unto a light that shineth in a dark place, until the day dawn, and the day star arise in your hearts:',
   'καὶ ἔχομεν βεβαιότερον τὸν προφητικὸν λόγον ᾧ καλῶς ποιεῖτε προσέχοντες ὡς λύχνῳ φαίνοντι ἐν αὐχμηρῷ τόπῳ ἕως οὗ ἡμέρα διαυγάσῃ καὶ φωσφόρος ἀνατείλῃ ἐν ταῖς καρδίαις ὑμῶν',
   'kai echomen bebaioteron ton prophētikon logon hō kalōs poieite prosechontes hōs lychnō phainonti en auchmērō topō heōs hou hēmera diaugasē kai phōsphoros anateilē en tais kardiais hymōn',
   '''More sure'' (bebaioteron — more firm, more confirmed, more reliable). The prophetic word is ''more sure'' not because it surpasses the Transfiguration in authority but because it is the confirmed, written, permanent record of God''s purposes. ''A light'' (lychnō — a lamp, a portable light source). ''Dark place'' (auchmērō topō — a murky, squalid, dingy place; the present world in its spiritual darkness). ''Day dawn'' (hēmera diaugasē — the day break through, the light fully shine). ''Day star'' (phōsphoros — light-bearer, morning star; Christ Himself, cf. Rev 22:16). Scripture is the lamp for the present darkness; Christ''s return is the coming dawn.',
   NULL),
  (20,
   'Knowing this first, that no prophecy of the scripture is of any private interpretation.',
   'τοῦτο πρῶτον γινώσκοντες ὅτι πᾶσα προφητεία γραφῆς ἰδίας ἐπιλύσεως οὐ γίνεται',
   'touto prōton ginōskontes hoti pasa prophēteia graphēs idias epilyseōs ou ginetai',
   '''Knowing this first'' (touto prōton ginōskontes — this is the primary, foundational thing to know). ''Private interpretation'' (idias epilyseōs — one''s own unloosing, personal origination). The word epilysis means unloosing or releasing. The point is not primarily about how we read prophecy (hermeneutics) but about how it originated: no prophecy came from the prophet''s own invention or insight. The prophet did not generate the message; it came from God. Verse 21 explains the mechanism.',
   'The origin of prophecy: This verse addresses the source of Scripture, not merely its interpretation. No prophecy originated from the prophet''s private reasoning (idias epilyseōs). The prophets did not compose their messages by human insight or imagination. Scripture did not emerge from below (human creativity) but from above (divine initiative). Verse 21 completes the thought.'),
  (21,
   'For the prophecy came not in old time by the will of man: but holy men of God spake as they were moved by the Holy Ghost.',
   'οὐ γὰρ θελήματι ἀνθρώπου ἠνέχθη προφητεία ποτε ἀλλ᾽ ὑπὸ πνεύματος ἁγίου φερόμενοι ἐλάλησαν ἀπὸ θεοῦ ἄνθρωποι',
   'ou gar thelēmati anthrōpou ēnechthē prophēteia pote all'' hypo pneumatos hagiou pheromenoi elalēsan apo theou anthrōpoi',
   '''Not by the will of man'' (ou thelēmati anthrōpou — not by human initiative, decision, or desire). ''Moved'' (pheromenoi — borne along, carried along; the same word used in Acts 27:15,17 for a ship driven by the wind. The prophets were carried along by the Spirit as a ship is driven by a gale). ''Holy men of God'' (apo theou anthrōpoi — men from God, men sent by God). ''Spake'' (elalēsan — they spoke; their human faculties were engaged — they spoke, they wrote — but the driving force was the Holy Spirit). The prophets were not robots but Spirit-carried authors.',
   'The inspiration of Scripture: This is one of the two classic texts on biblical inspiration (with 2 Tim 3:16). The mechanism: the Holy Spirit ''moved'' (pheromenoi — carried along) the human authors so that what they wrote was ''from God'' (apo theou). The result: divine authority conveyed through human personality. The wind (Spirit) drove the ship (prophet); the ship moved, but the wind determined the course. This is verbal, plenary inspiration.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Peter' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1 (Like precious faith / God and Saviour)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἰσότιμον', 'isotimon', 'G2472', 'Of equal value, equally honoured — from isos (equal) + timē (honour, value). Found only here in the NT. The faith of every believer is of identical worth with the apostles''. No second-class Christians.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 3 (Divine power / all things)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θείας', 'theias', 'G2304', 'Divine, belonging to God — that which pertains to deity. God''s own power, not merely supernatural but specifically the power that belongs to God''s nature.', 1),
  ('εὐσέβειαν', 'eusebeian', 'G2150', 'Godliness, piety, practical reverence — from eu (well) + sebomai (to revere). Not mere religiosity but genuine devotion to God expressed in daily living. A key word in 2 Peter.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 3;

-- Verse 4 (Partakers of divine nature)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κοινωνοί', 'koinōnoi', 'G2844', 'Partakers, sharers, participants — from koinōnia (fellowship, sharing). Those who have a share in, who participate in something held in common. Believers share in God''s own moral nature.', 1),
  ('φύσεως', 'physeōs', 'G5449', 'Nature, natural constitution, essence — from phyō (to grow, to bring forth). The inherent character of something. The divine nature is God''s essential moral character: holiness, love, truth, life.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 4;

-- Verse 5 (Add to faith / supply lavishly)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπιχορηγήσατε', 'epichorēgēsate', 'G2023', 'Supply lavishly, furnish generously — from epi (upon) + chorēgeō (to lead a chorus, to defray the expense of a chorus). Originally meant to fund a Greek theatrical production at great personal cost. Supply these virtues extravagantly, not grudgingly.', 1),
  ('ἀρετήν', 'aretēn', 'G703', 'Virtue, moral excellence, courage — the active goodness that translates faith into visible action. Not passive piety but energetic moral achievement. The first step from faith toward love.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 5;

-- Verse 10 (Make calling sure)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βεβαίαν', 'bebaian', 'G949', 'Sure, firm, stable, reliable — from bainō (to walk). Something you can walk on without it giving way. Making your calling and election a solid, tested certainty through growth in virtue.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Verse 16 (Eyewitnesses)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπόπται', 'epoptai', 'G2030', 'Eyewitnesses, direct observers — from epi (upon) + optanomai (to see). Those who see for themselves. A term used in mystery religions for the highest-level initiates. Peter saw Christ''s glory firsthand.', 1),
  ('μεγαλειότητος', 'megaleiotētos', 'G3168', 'Majesty, magnificence, sublime greatness — the visible, overwhelming grandeur of divine glory. Used only here and in Luke 9:43 and Acts 19:27 in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Verse 21 (Moved by the Holy Ghost)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φερόμενοι', 'pheromenoi', 'G5342', 'Moved, borne along, carried — present passive participle: being continuously carried along. The same word describes a ship driven by the wind (Acts 27:15,17). The Spirit was the wind; the prophets were the vessels.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = 21;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: God and Saviour
  (1, 'Titus 2:13', 1), (1, '1 Peter 1:1', 2), (1, 'Romans 1:1', 3),
  -- v3: Divine power given all things
  (3, '2 Corinthians 9:8', 1), (3, 'Ephesians 1:3', 2), (3, 'Romans 8:32', 3),
  -- v4: Partakers of divine nature
  (4, '2 Corinthians 3:18', 1), (4, '1 John 3:2', 2), (4, 'John 1:12-13', 3),
  -- v5-7: Ladder of virtue
  (5, 'Galatians 5:22-23', 1), (5, 'Colossians 3:12-14', 2), (5, 'Romans 5:3-5', 3),
  (7, '1 Corinthians 13:13', 1), (7, 'Colossians 3:14', 2),
  -- v9: Blind and forgetful
  (9, 'Hebrews 5:12-14', 1), (9, '2 Peter 2:20-22', 2), (9, 'Revelation 3:17', 3),
  -- v10: Make calling sure
  (10, 'Philippians 2:12-13', 1), (10, '1 Thessalonians 1:4', 2), (10, 'Ephesians 1:4', 3),
  -- v11: Abundant entrance
  (11, '2 Timothy 4:8', 1), (11, 'Revelation 22:14', 2),
  -- v14: Put off this tabernacle
  (14, 'John 21:18-19', 1), (14, '2 Corinthians 5:1-4', 2), (14, '2 Timothy 4:6', 3),
  -- v16: Eyewitnesses / Transfiguration
  (16, 'Matthew 17:1-5', 1), (16, 'Mark 9:2-7', 2), (16, 'Luke 9:28-35', 3),
  -- v17: This is my beloved Son
  (17, 'Matthew 3:17', 1), (17, 'Matthew 17:5', 2), (17, 'Psalm 2:7', 3),
  -- v19: Sure word of prophecy
  (19, 'Psalm 119:105', 1), (19, 'Revelation 22:16', 2), (19, '2 Timothy 3:15', 3),
  -- v20-21: Inspiration of Scripture
  (20, '2 Timothy 3:16', 1), (20, '1 Peter 1:10-12', 2),
  (21, '2 Samuel 23:2', 1), (21, 'Acts 1:16', 2), (21, '2 Timothy 3:16', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Peter Chapter 1 Complete
-- 21 verses · 7 key verses with word studies (14 words)
-- Cross-references for 14 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════