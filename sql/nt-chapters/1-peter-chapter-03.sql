-- ═══════════════════════════════════════════════════
-- 1 PETER CHAPTER 3 — Suffering for Righteousness' Sake
-- 22 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '1 Peter 3 continues the submission theme, addressing wives (vv.1-6) and husbands (v.7) before expanding to all believers'' conduct under suffering (vv.8-22). Wives married to unbelieving husbands are to win them ''without the word'' through ''chaste conversation coupled with fear'' (vv.1-2). True beauty is ''the hidden man of the heart'' with a ''meek and quiet spirit, which is in the sight of God of great price'' (v.4). Sarah is the model of a submissive wife who trusted God (v.6). Husbands must dwell with their wives ''according to knowledge'' and honour them as ''heirs together of the grace of life'' (v.7). Peter then calls all believers to unity, compassion, and a readiness to bless rather than retaliate (vv.8-9). Quoting Psalm 34, he promises that God''s eyes are on the righteous and His ears are open to their prayers (vv.10-12). The pivotal verse 15 commands: ''be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear.'' The chapter concludes with one of the most challenging passages in Peter: Christ''s suffering, death, and preaching ''unto the spirits in prison'' (vv.18-20), the antitype of baptism (v.21), and Christ''s exaltation at God''s right hand (v.22).',
  'Submission in Marriage and Suffering for Righteousness',
  'ἀπολογίαν (apologian)',
  'A defence, an answer, a reasoned reply — the word from which we derive "apologetics." Every believer must be ready to give a rational, humble defence of the hope that is within them.',
  '["Wives: Winning Without a Word (vv.1-6): Likewise ye wives be in subjection to your own husbands that if any obey not the word they also may without the word be won by the conversation of the wives; while they behold your chaste conversation coupled with fear; whose adorning let it not be that outward adorning but let it be the hidden man of the heart in that which is not corruptible even the ornament of a meek and quiet spirit which is in the sight of God of great price; for after this manner in the old time the holy women also who trusted in God adorned themselves being in subjection unto their own husbands; even as Sara obeyed Abraham calling him lord whose daughters ye are as long as ye do well and are not afraid with any amazement","Husbands: Dwelling with Knowledge (v.7): Likewise ye husbands dwell with them according to knowledge giving honour unto the wife as unto the weaker vessel and as being heirs together of the grace of life that your prayers be not hindered","Unity and Blessing (vv.8-12): Finally be ye all of one mind having compassion one of another love as brethren be pitiful be courteous; not rendering evil for evil or railing for railing but contrariwise blessing knowing that ye are thereunto called that ye should inherit a blessing; for he that will love life and see good days let him refrain his tongue from evil and his lips that they speak no guile; let him eschew evil and do good let him seek peace and ensue it; for the eyes of the Lord are over the righteous and his ears are open unto their prayers but the face of the Lord is against them that do evil","Suffering for Righteousness (vv.13-17): And who is he that will harm you if ye be followers of that which is good; but and if ye suffer for righteousness'' sake happy are ye and be not afraid of their terror neither be troubled; but sanctify the Lord God in your hearts and be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear; having a good conscience that whereas they speak evil of you as of evildoers they may be ashamed that falsely accuse your good conversation in Christ; for it is better if the will of God be so that ye suffer for well doing than for evil doing","Christ''s Suffering, Death, and Triumph (vv.18-22): For Christ also hath once suffered for sins the just for the unjust that he might bring us to God being put to death in the flesh but quickened by the Spirit; by which also he went and preached unto the spirits in prison; which sometime were disobedient when once the longsuffering of God waited in the days of Noah while the ark was a preparing wherein few that is eight souls were saved by water; the like figure whereunto even baptism doth also now save us not the putting away of the filth of the flesh but the answer of a good conscience toward God by the resurrection of Jesus Christ; who is gone into heaven and is on the right hand of God angels and authorities and powers being made subject unto him"]'
FROM books b WHERE b.name = '1 Peter';

-- Step 2: Insert all 22 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Likewise, ye wives, be in subjection to your own husbands; that, if any obey not the word, they also may without the word be won by the conversation of the wives;',
   'Ὁμοίως αἱ γυναῖκες ὑποτασσόμεναι τοῖς ἰδίοις ἀνδράσιν ἵνα καὶ εἴ τινες ἀπειθοῦσιν τῷ λόγῳ διὰ τῆς τῶν γυναικῶν ἀναστροφῆς ἄνευ λόγου κερδηθήσωνται',
   'Homoiōs hai gynaikes hypotassomenai tois idiois andrasin hina kai ei tines apeithousin tō logō dia tēs tōn gynaikōn anastrophēs aneu logou kerdēthēsōntai',
   '''Likewise'' (homoiōs — in the same way; connecting to the submission pattern of 2:13-25). ''Be in subjection'' (hypotassomenai — arranging yourselves under; present participle: ongoing attitude). ''Your own husbands'' (tois idiois andrasin — not all men, but their own husbands). ''Obey not the word'' (apeithousin tō logō — are disobedient to the gospel, do not believe the word). ''Without the word'' (aneu logou — without a sermon, without nagging). ''Won'' (kerdēthēsōntai — gained, won over; the same word used for gaining converts). ''Conversation'' (anastrophēs — conduct, manner of life). A wife''s godly conduct can accomplish what arguments cannot. The word is a beautiful wordplay: those who disobey the Word may be won without a word.',
   NULL),
  (2,
   'While they behold your chaste conversation coupled with fear.',
   'ἐποπτεύσαντες τὴν ἐν φόβῳ ἁγνὴν ἀναστροφὴν ὑμῶν',
   'epopteusantes tēn en phobō hagnēn anastrophēn hymōn',
   '''Behold'' (epopteusantes — having observed closely, having been eyewitnesses; from epopteuō, to watch carefully; the same word used in 2:12). ''Chaste'' (hagnēn — pure, morally clean, free from defilement). ''Fear'' (phobō — reverent respect, either for God or for the husband; probably both). The unbelieving husband watches his wife closely. What he observes — purity combined with reverence — is more persuasive than any sermon.',
   NULL),
  (3,
   'Whose adorning let it not be that outward adorning of plaiting the hair, and of wearing of gold, or of putting on of apparel;',
   'ὧν ἔστω οὐχ ὁ ἔξωθεν ἐμπλοκῆς τριχῶν καὶ περιθέσεως χρυσίων ἢ ἐνδύσεως ἱματίων κόσμος',
   'hōn estō ouch ho exōthen emplokēs trichōn kai peritheseōs chrysiōn ē endyseōs himatiōn kosmos',
   '''Adorning'' (kosmos — adornment, decoration; from which we get "cosmetics"). ''Plaiting the hair'' (emplokēs trichōn — elaborate braiding). ''Wearing of gold'' (peritheseōs chrysiōn — putting on gold ornaments). ''Putting on of apparel'' (endyseōs himatiōn — wearing fine clothes). Peter does not prohibit all grooming or jewellery (any more than he prohibits clothing) but warns against making external appearance the source of beauty. The contrast is between outward adornment as primary identity versus inner character.',
   NULL),
  (4,
   'But let it be the hidden man of the heart, in that which is not corruptible, even the ornament of a meek and quiet spirit, which is in the sight of God of great price.',
   'ἀλλ᾽ ὁ κρυπτὸς τῆς καρδίας ἄνθρωπος ἐν τῷ ἀφθάρτῳ τοῦ πραέος καὶ ἡσυχίου πνεύματος ὅ ἐστιν ἐνώπιον τοῦ θεοῦ πολυτελές',
   'all'' ho kryptos tēs kardias anthrōpos en tō aphthartō tou praeos kai hēsychiou pneumatos ho estin enōpion tou theou polyteles',
   '''Hidden man of the heart'' (ho kryptos tēs kardias anthrōpos — the inner person, the secret self that only God sees). ''Not corruptible'' (aphthartō — imperishable; unlike outward beauty that fades). ''Meek'' (praeos — gentle, humble, not asserting rights). ''Quiet'' (hēsychiou — tranquil, still, undisturbed; not silent but serene). ''Great price'' (polyteles — very costly, very expensive, of great value). The world measures beauty by the outward; God measures it by the inward. A meek and quiet spirit is what God considers precious — not perishable gold but imperishable character.',
   'True beauty before God: Peter defines beauty by God''s standard rather than the world''s. The "hidden man of the heart" — the inner person — is adorned with a meek and quiet spirit. This is "imperishable" (aphthartos), unlike outward beauty which fades. What is "of great price" (polyteles) to God is not gold or jewellery but gentle, peaceful character. This standard applies to all believers, not only women.'),
  (5,
   'For after this manner in the old time the holy women also, who trusted in God, adorned themselves, being in subjection unto their own husbands:',
   'οὕτως γάρ ποτε καὶ αἱ ἅγιαι γυναῖκες αἱ ἐλπίζουσαι εἰς θεὸν ἐκόσμουν ἑαυτάς ὑποτασσόμεναι τοῖς ἰδίοις ἀνδράσιν',
   'houtōs gar pote kai hai hagiai gynaikes hai elpizousai eis theon ekosmoun heautas hypotassomenai tois idiois andrasin',
   '''Holy women'' (hai hagiai gynaikes — the consecrated women of the past). ''Trusted in God'' (elpizousai eis theon — hoped in God; their hope was in God, not in their husbands or circumstances). ''Adorned themselves'' (ekosmoun heautas — made themselves beautiful; the verb kosmeo is the root of ''cosmetics'' and ''cosmos'' — to put in order, to beautify). Their adornment was internal, their submission was voluntary, and their security was in God. Trust in God is the foundation of submission — they submitted not because their husbands were perfect but because God was trustworthy.',
   NULL),
  (6,
   'Even as Sara obeyed Abraham, calling him lord: whose daughters ye are, as long as ye do well, and are not afraid with any amazement.',
   'ὡς Σάρρα ὑπήκουσεν τῷ Ἀβραὰμ κύριον αὐτὸν καλοῦσα ἧς ἐγενήθητε τέκνα ἀγαθοποιοῦσαι καὶ μὴ φοβούμεναι μηδεμίαν πτόησιν',
   'hōs Sarra hypēkousen tō Abraam kyrion auton kalousa hēs egenēthēte tekna agathopoiousai kai mē phoboumenai mēdemian ptoēsin',
   '''Sara obeyed'' (hypēkousen — listened under, gave obedience; cf. Gen 18:12 where Sarah called Abraham ''lord''). ''Whose daughters ye are'' — not by blood but by faith and conduct. ''Do well'' (agathopoiousai — doing good). ''Not afraid with any amazement'' (mē phoboumenai mēdemian ptoēsin — not fearing any terror, not intimidated by any alarm). The Christian wife is not a doormat living in fear but a woman of courage who does right without being terrorised by circumstances.',
   NULL),
  (7,
   'Likewise, ye husbands, dwell with them according to knowledge, giving honour unto the wife, as unto the weaker vessel, and as being heirs together of the grace of life; that your prayers be not hindered.',
   'Οἱ ἄνδρες ὁμοίως συνοικοῦντες κατὰ γνῶσιν ὡς ἀσθενεστέρῳ σκεύει τῷ γυναικείῳ ἀπονέμοντες τιμὴν ὡς καὶ συγκληρονόμοι χάριτος ζωῆς εἰς τὸ μὴ ἐκκόπτεσθαι τὰς προσευχὰς ὑμῶν',
   'Hoi andres homoiōs synoikountes kata gnōsin hōs asthenesterō skeuei tō gynaikeiō aponemantes timēn hōs kai synklēronomoi charitos zōēs eis to mē ekkoptesthai tas proseuchas hymōn',
   '''Dwell with'' (synoikountes — live together with, share the home). ''According to knowledge'' (kata gnōsin — with understanding, with insight, with consideration). ''Weaker vessel'' (asthenesterō skeuei — the more delicate vessel; not intellectually or spiritually inferior but physically more vulnerable and thus deserving greater care). ''Honour'' (timēn — value, respect, preciousness). ''Heirs together'' (synklēronomoi — co-heirs, joint heirs; spiritually equal). ''Grace of life'' (charitos zōēs — the gracious gift of life). ''Prayers be not hindered'' (ekkoptesthai tas proseuchas — cut off, blocked). Husbands who dishonour their wives will find their prayers obstructed. How a man treats his wife directly affects his relationship with God.',
   'Marriage and prayer: Peter connects the husband''s treatment of his wife to his prayer life. Dishonour toward one''s wife "hinders" (ekkoptesthai — cuts off, blocks) prayers. This is one of the most practical spiritual principles in the NT: broken horizontal relationships block vertical communion with God. The husband must understand his wife, honour her, and recognise her as an equal heir — or his prayers will go unanswered.'),
  (8,
   'Finally, be ye all of one mind, having compassion one of another, love as brethren, be pitiful, be courteous:',
   'τὸ δὲ τέλος πάντες ὁμόφρονες συμπαθεῖς φιλάδελφοι εὔσπλαγχνοι φιλόφρονες',
   'to de telos pantes homophrones sympatheis philadelphoi eusplanchnoi philophrones',
   'Five virtues for the whole community: (1) ''One mind'' (homophrones — like-minded, united in thinking). (2) ''Compassion'' (sympatheis — sympathetic, fellow-feeling; our word ''sympathy''). (3) ''Love as brethren'' (philadelphoi — brotherly love, family affection). (4) ''Pitiful'' (eusplanchnoi — tender-hearted, having good bowels/compassion). (5) ''Courteous'' (philophrones — friendly-minded, gracious; some manuscripts read tapeinophrones — humble-minded). These virtues create the community that can endure persecution together.',
   NULL),
  (9,
   'Not rendering evil for evil, or railing for railing: but contrariwise blessing; knowing that ye are thereunto called, that ye should inherit a blessing.',
   'μὴ ἀποδιδόντες κακὸν ἀντὶ κακοῦ ἢ λοιδορίαν ἀντὶ λοιδορίας τοὐναντίον δὲ εὐλογοῦντες εἰδότες ὅτι εἰς τοῦτο ἐκλήθητε ἵνα εὐλογίαν κληρονομήσητε',
   'mē apodidontes kakon anti kakou ē loidorian anti loidorias tounantion de eulogountes eidotes hoti eis touto eklēthēte hina eulogian klēronomēsēte',
   '''Rendering'' (apodidontes — giving back, repaying). ''Evil for evil'' (kakon anti kakou — bad in exchange for bad). ''Railing for railing'' (loidorian anti loidorias — insult for insult). ''Contrariwise blessing'' (tounantion eulogountes — on the contrary, blessing). The Christian response to abuse is not retaliation but blessing. This echoes Christ''s own example (2:23). ''Called to inherit a blessing'' — the motive: you are called to be blessed, so be a blessing.',
   NULL),
  (10,
   'For he that will love life, and see good days, let him refrain his tongue from evil, and his lips that they speak no guile:',
   'ὁ γὰρ θέλων ζωὴν ἀγαπᾶν καὶ ἰδεῖν ἡμέρας ἀγαθὰς παυσάτω τὴν γλῶσσαν αὐτοῦ ἀπὸ κακοῦ καὶ χείλη αὐτοῦ τοῦ μὴ λαλῆσαι δόλον',
   'ho gar thelōn zōēn agapan kai idein hēmeras agathas pausatō tēn glōssan autou apo kakou kai cheilē autou tou mē lalēsai dolon',
   'Peter quotes Psalm 34:12-16. ''Love life'' (zōēn agapan — to enjoy life, to embrace living). ''See good days'' (idein hēmeras agathas — to experience favourable times). ''Refrain his tongue'' (pausatō tēn glōssan — let him stop his tongue, cause his tongue to cease). ''Guile'' (dolon — deceit, craftiness). The prescription for a good life: control your speech. The tongue is the rudder of life (James 3:4-5). Evil speech and deceitful lips sabotage the life they claim to love.',
   NULL),
  (11,
   'Let him eschew evil, and do good; let him seek peace, and ensue it.',
   'ἐκκλινάτω ἀπὸ κακοῦ καὶ ποιησάτω ἀγαθόν ζητησάτω εἰρήνην καὶ διωξάτω αὐτήν',
   'ekklinatō apo kakou kai poiēsatō agathon zētēsatō eirēnēn kai diōxatō autēn',
   '''Eschew'' (ekklinatō — turn away from, deviate from, avoid). ''Do good'' (poiēsatō agathon — actively perform good). ''Seek peace'' (zētēsatō eirēnēn — search for peace, pursue peace). ''Ensue it'' (diōxatō autēn — chase it, pursue it vigorously; from diōkō, to hunt, to pursue; the same word used for persecuting). Peace does not come to those who sit still; it must be hunted, pursued, chased with the energy of a hunter after prey.',
   NULL),
  (12,
   'For the eyes of the Lord are over the righteous, and his ears are open unto their prayers: but the face of the Lord is against them that do evil.',
   'ὅτι ὀφθαλμοὶ κυρίου ἐπὶ δικαίους καὶ ὦτα αὐτοῦ εἰς δέησιν αὐτῶν πρόσωπον δὲ κυρίου ἐπὶ ποιοῦντας κακά',
   'hoti ophthalmoi kyriou epi dikaious kai ōta autou eis deēsin autōn prosōpon de kyriou epi poiountas kaka',
   '''Eyes of the Lord are over the righteous'' (ophthalmoi kyriou epi dikaious — the Lord watches over the righteous with attentive care). ''Ears open unto their prayers'' (ōta autou eis deēsin — His ears are turned toward their petitions). ''Face against them that do evil'' (prosōpon kyriou epi poiountas kaka — the Lord''s face is set against evildoers; the face turned toward in wrath). Two postures of God: toward the righteous — watchful eyes and listening ears; toward evildoers — a face set in opposition.',
   NULL),
  (13,
   'And who is he that will harm you, if ye be followers of that which is good?',
   'καὶ τίς ὁ κακώσων ὑμᾶς ἐὰν τοῦ ἀγαθοῦ μιμηταὶ γένησθε',
   'kai tis ho kakōsōn hymas ean tou agathou mimētai genēsthe',
   '''Harm'' (kakōsōn — mistreat, injure). ''Followers'' (mimētai — imitators, emulators; from mimeomai, to imitate; our word ''mimic''). ''Good'' (agathou — the good, moral excellence). Generally, those who do good are not harmed. But Peter adds ''if'' in v.14 — acknowledging that sometimes doing good does bring suffering. Even then, the harm is not ultimate.',
   NULL),
  (14,
   'But and if ye suffer for righteousness'' sake, happy are ye: and be not afraid of their terror, neither be troubled;',
   'ἀλλ᾽ εἰ καὶ πάσχοιτε διὰ δικαιοσύνην μακάριοι φοβηθῆτε δὲ τὸν φόβον αὐτῶν μηδὲ ταραχθῆτε',
   'all'' ei kai paschoite dia dikaiosynēn makarioi phobēthēte de ton phobon autōn mēde tarachthēte',
   '''If ye suffer'' (paschoite — optative mood: should you happen to suffer; a rare possibility, not a certainty). ''For righteousness'' sake'' (dia dikaiosynēn). ''Happy'' (makarioi — blessed, fortunate; the same word as the Beatitudes, and specifically Matt 5:10). ''Be not afraid of their terror'' (phobēthēte ton phobon autōn — do not fear their fear, do not be afraid of what they fear; a quote from Isaiah 8:12-13). ''Neither be troubled'' (mēde tarachthēte — do not be agitated, do not be disturbed).',
   NULL),
  (15,
   'But sanctify the Lord God in your hearts: and be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear:',
   'κύριον δὲ τὸν θεὸν ἁγιάσατε ἐν ταῖς καρδίαις ὑμῶν ἕτοιμοι δὲ ἀεὶ πρὸς ἀπολογίαν παντὶ τῷ αἰτοῦντι ὑμᾶς λόγον περὶ τῆς ἐν ὑμῖν ἐλπίδος μετὰ πραΰτητος καὶ φόβου',
   'kyrion de ton theon hagiasate en tais kardiais hymōn hetoimoi de aei pros apologian panti tō aitounti hymas logon peri tēs en hymin elpidos meta prautētos kai phobou',
   '''Sanctify'' (hagiasate — set apart, treat as holy, give the Lord His rightful place of honour in your heart). ''Be ready'' (hetoimoi — prepared, equipped). ''Always'' (aei — at all times, perpetually). ''Answer'' (apologian — a defence, a reasoned account, a verbal explanation; the legal term for a defendant''s speech). ''Reason'' (logon — a word, an account, a rational explanation). ''Hope'' (elpidos — the living hope of 1:3). ''Meekness and fear'' (prautētos kai phobou — with gentleness and reverence). The manner of the defence is as important as its content: not aggressive, not arrogant, but gentle and reverent.',
   'Christian apologetics: This verse is the foundation of Christian apologetics. Every believer must be (1) ready — prepared, not caught off guard; (2) always — at any time; (3) to give a defence — a reasoned, articulate explanation; (4) to everyone — no one is excluded; (5) of the hope — the living hope rooted in Christ''s resurrection; (6) with meekness and fear — the manner must match the message. Apologetics is not winning arguments but gently explaining hope.'),
  (16,
   'Having a good conscience; that, whereas they speak evil of you, as of evildoers, they may be ashamed that falsely accuse your good conversation in Christ.',
   'συνείδησιν ἔχοντες ἀγαθήν ἵνα ἐν ᾧ καταλαλοῦσιν ὑμῶν ὡς κακοποιῶν καταισχυνθῶσιν οἱ ἐπηρεάζοντες ὑμῶν τὴν ἀγαθὴν ἐν Χριστῷ ἀναστροφήν',
   'syneidēsin echontes agathēn hina en hō katalalousin hymōn hōs kakopoiōn kataischynthōsin hoi epēreazontes hymōn tēn agathēn en Christō anastrophēn',
   '''Good conscience'' (syneidēsin agathēn — a clear conscience, a conscience free from self-accusation). ''Speak evil'' (katalalousin — slander). ''Ashamed'' (kataischynthōsin — put to shame, humiliated). ''Falsely accuse'' (epēreazontes — insult, mistreat, revile). ''Good conversation in Christ'' (agathēn en Christō anastrophēn — the good conduct that is in Christ, the Christlike manner of life). A good conscience is the believer''s best defence. When slanderers examine the life and find nothing, they are the ones ashamed.',
   NULL),
  (17,
   'For it is better, if the will of God be so, that ye suffer for well doing, than for evil doing.',
   'κρεῖττον γὰρ ἀγαθοποιοῦντας εἰ θέλοι τὸ θέλημα τοῦ θεοῦ πάσχειν ἢ κακοποιοῦντας',
   'kreitton gar agathopoiountas ei theloi to thelēma tou theou paschein ē kakopoiountas',
   '''Better'' (kreitton — more excellent, more profitable). ''If the will of God be so'' (ei theloi to thelēma tou theou — if the will of God should will it; the optative implies it may or may not happen, but if it does, it is God''s will). Suffering for doing good is better than suffering for doing evil because: (1) it has meaning, (2) it follows Christ''s pattern, (3) it is blessed by God, and (4) it serves a redemptive purpose.',
   NULL),
  (18,
   'For Christ also hath once suffered for sins, the just for the unjust, that he might bring us to God, being put to death in the flesh, but quickened by the Spirit:',
   'ὅτι καὶ Χριστὸς ἅπαξ περὶ ἁμαρτιῶν ἔπαθεν δίκαιος ὑπὲρ ἀδίκων ἵνα ὑμᾶς προσαγάγῃ τῷ θεῷ θανατωθεὶς μὲν σαρκὶ ζωοποιηθεὶς δὲ πνεύματι',
   'hoti kai Christos hapax peri hamartiōn epathen dikaios hyper adikōn hina hymas prosagagē tō theō thanatōtheis men sarki zōopoiētheis de pneumati',
   '''Once'' (hapax — once for all, a single unrepeatable act). ''For sins'' (peri hamartiōn — concerning sins, on account of sins). ''The just for the unjust'' (dikaios hyper adikōn — the righteous one on behalf of the unrighteous). ''Bring us to God'' (prosagagē tō theō — lead us into God''s presence, grant us access; prosagō was the technical term for presenting someone at a royal court). ''Put to death in the flesh'' (thanatōtheis sarki — killed in the physical realm). ''Quickened by the Spirit'' (zōopoiētheis pneumati — made alive in/by the Spirit). Christ''s death was once-for-all, substitutionary, and purposeful: to bring us to God.',
   'Christ''s substitutionary death: This verse is a concise statement of the atonement. (1) Once — unrepeatable. (2) For sins — dealing with the sin problem. (3) Just for unjust — substitutionary. (4) To bring us to God — the purpose is access, reconciliation, and restored relationship. (5) Put to death in flesh, alive in Spirit — death was not the end but the gateway to resurrection life. Christ''s suffering is the ground of our confidence when we suffer.'),
  (19,
   'By which also he went and preached unto the spirits in prison;',
   'ἐν ᾧ καὶ τοῖς ἐν φυλακῇ πνεύμασιν πορευθεὶς ἐκήρυξεν',
   'en hō kai tois en phylakē pneumasin poreutheis ekēryxen',
   '''By which'' (en hō — in which, by which; either the Spirit by which He was made alive, or in which state He went). ''Spirits in prison'' (tois en phylakē pneumasin — the spirits confined in custody). ''Preached'' (ekēryxen — proclaimed, heralded; kēryssō means to announce publicly as a herald, not necessarily to evangelise). One of the most debated verses in the NT. The main views: (1) Christ''s spirit preached through Noah to the pre-flood generation who are now in prison. (2) The risen Christ proclaimed His victory to the imprisoned fallen angels of Genesis 6. (3) Between death and resurrection, Christ proclaimed triumph to confined spirits. The context (Noah, v.20) favours a connection to the pre-flood era.',
   NULL),
  (20,
   'Which sometime were disobedient, when once the longsuffering of God waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.',
   'ἀπειθήσασίν ποτε ὅτε ἀπεξεδέχετο ἡ τοῦ θεοῦ μακροθυμία ἐν ἡμέραις Νῶε κατασκευαζομένης κιβωτοῦ εἰς ἣν ὀλίγαι τοῦτ᾽ ἔστιν ὀκτὼ ψυχαί διεσώθησαν δι᾽ ὕδατος',
   'apeithēsasin pote hote apexedecheto hē tou theou makrothymia en hēmerais Nōe kataskeuazomenēs kibōtou eis hēn oligai tout'' estin oktō psychai diesōthēsan di'' hydatos',
   '''Disobedient'' (apeithēsasin — those who refused to believe, who were wilfully disobedient). ''Longsuffering of God waited'' (apexedecheto hē makrothymia — God''s patience waited eagerly, earnestly). ''While the ark was a preparing'' (kataskeuazomenēs kibōtou — during the building of the ark; the 120 years of Genesis 6:3). ''Few'' (oligai — a small number). ''Eight souls'' (oktō psychai — eight persons: Noah, his wife, three sons, and their wives). ''Saved by water'' (diesōthēsan di'' hydatos — brought safely through the water; the water that destroyed the wicked carried the ark to safety).',
   NULL),
  (21,
   'The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward God,) by the resurrection of Jesus Christ:',
   'ὃ καὶ ὑμᾶς ἀντίτυπον νῦν σῴζει βάπτισμα οὐ σαρκὸς ἀπόθεσις ῥύπου ἀλλὰ συνειδήσεως ἀγαθῆς ἐπερώτημα εἰς θεόν δι᾽ ἀναστάσεως Ἰησοῦ Χριστοῦ',
   'ho kai hymas antitypon nyn sōzei baptisma ou sarkos apothesis rhypou alla syneidēseōs agathēs eperōtēma eis theon di'' anastaseōs Iēsou Christou',
   '''Like figure'' (antitypon — antitype, the corresponding reality). ''Baptism doth also now save us'' — Peter immediately qualifies: ''not the putting away of the filth of the flesh'' (ou sarkos apothesis rhypou — not the removal of physical dirt; baptism''s power is not in the water). ''But the answer of a good conscience toward God'' (syneidēseōs agathēs eperōtēma — the pledge/appeal of a good conscience toward God; eperōtēma can mean ''pledge'' or ''appeal''). ''By the resurrection of Jesus Christ'' — the power that saves is not water but the resurrection. Baptism is the antitype of Noah''s flood: just as the water separated Noah from the old world into the new, baptism symbolises separation from the old life into the new.',
   'Baptism and salvation: Peter is careful to clarify that baptism''s saving power is not in the physical act (washing the body) but in what it represents: the pledge of a clear conscience before God, made possible by Christ''s resurrection. Baptism is the outward sign of an inward reality — the believer''s identification with Christ''s death and resurrection. The water does not save; the risen Christ saves.'),
  (22,
   'Who is gone into heaven, and is on the right hand of God; angels and authorities and powers being made subject unto him.',
   'ὅς ἐστιν ἐν δεξιᾷ τοῦ θεοῦ πορευθεὶς εἰς οὐρανόν ὑποταγέντων αὐτῷ ἀγγέλων καὶ ἐξουσιῶν καὶ δυνάμεων',
   'hos estin en dexia tou theou poreutheis eis ouranon hypotagentōn autō angelōn kai exousiōn kai dynameōn',
   '''Gone into heaven'' (poreutheis eis ouranon — having gone to heaven; the ascension). ''Right hand of God'' (en dexia tou theou — the place of supreme honour, authority, and power). ''Angels and authorities and powers'' (angelōn kai exousiōn kai dynameōn — all ranks of spiritual beings, both heavenly and demonic). ''Made subject'' (hypotagentōn — having been subjected, subordinated). The chapter that began with submission ends with the supreme submission: all powers are subject to Christ. The suffering Christ is now the reigning Christ. This is the basis for the believer''s confidence in suffering: the one who suffered is now enthroned over all.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Peter' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 4 (Meek and quiet spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πραΰς', 'praus', 'G4239', 'Meek, gentle, humble — not weakness but strength under control. The tamed stallion is meek: powerful but submitted. A meek spirit does not insist on its own rights but trusts God to vindicate.', 1),
  ('ἡσύχιος', 'hēsychios', 'G2272', 'Quiet, tranquil, still — not silence but an inner calm that is not disturbed by circumstances. A spirit at rest, not agitated, not demanding. In God''s sight, this is "of great price" (polyteles).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 3 AND v.verse_number = 4;

-- Verse 15 (Answer / apologetics)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀπολογίαν', 'apologian', 'G627', 'Defence, answer, reasoned reply — a legal term for the defendant''s speech in court. The source of our word "apologetics." Every believer must be able to articulate why they believe.', 1),
  ('ἁγιάσατε', 'hagiasate', 'G37', 'Sanctify, set apart, treat as holy — to give the Lord God His rightful place in your heart. When God is enthroned in the heart, fear of man is displaced. The inner sanctuary precedes the outward defence.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 3 AND v.verse_number = 15;

-- Verse 18 (Just for the unjust)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἅπαξ', 'hapax', 'G530', 'Once, once for all — a single, unrepeatable act. Christ''s sacrifice never needs repetition because it was perfectly sufficient. Cf. Heb 9:28, "once offered to bear the sins of many."', 1),
  ('προσαγάγῃ', 'prosagagē', 'G4317', 'To bring to, to present, to grant access — the term for introducing someone into the presence of a king. Christ''s death opens the royal court of God to those who were once shut out by sin.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 3 AND v.verse_number = 18;

-- Verse 22 (Right hand of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑποταγέντων', 'hypotagentōn', 'G5293', 'Having been made subject, subordinated — aorist passive: they were decisively subjected. All spiritual powers — angels, authorities, and powers — were placed under Christ''s authority at His exaltation.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 3 AND v.verse_number = 22;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Wives in subjection
  (1, 'Ephesians 5:22-24', 1), (1, 'Colossians 3:18', 2), (1, '1 Corinthians 7:16', 3),
  -- v4: Meek and quiet spirit
  (4, 'Proverbs 31:30', 1), (4, '1 Timothy 2:9-10', 2), (4, 'Matthew 5:5', 3),
  -- v7: Husbands dwell with knowledge / prayers hindered
  (7, 'Ephesians 5:25-28', 1), (7, 'Colossians 3:19', 2), (7, 'Galatians 3:28', 3),
  -- v9: Bless rather than retaliate
  (9, 'Romans 12:17-21', 1), (9, 'Matthew 5:44', 2), (9, 'Luke 6:27-28', 3),
  -- v12: Eyes of the Lord on the righteous
  (12, 'Psalm 34:15-16', 1), (12, 'Proverbs 15:29', 2), (12, 'John 9:31', 3),
  -- v14: Suffer for righteousness'' sake
  (14, 'Matthew 5:10', 1), (14, 'Isaiah 8:12-13', 2), (14, 'Acts 5:41', 3),
  -- v15: Ready to give an answer
  (15, 'Colossians 4:6', 1), (15, 'Acts 22:1', 2), (15, '2 Timothy 2:25', 3),
  -- v18: Christ suffered for sins / just for unjust
  (18, 'Romans 5:6-8', 1), (18, '2 Corinthians 5:21', 2), (18, 'Hebrews 9:28', 3),
  -- v20: Noah / eight souls saved
  (20, 'Genesis 6:3-8', 1), (20, '2 Peter 2:5', 2), (20, 'Hebrews 11:7', 3),
  -- v21: Baptism
  (21, 'Romans 6:3-4', 1), (21, 'Colossians 2:12', 2), (21, 'Acts 2:38', 3),
  -- v22: Right hand of God
  (22, 'Ephesians 1:20-22', 1), (22, 'Philippians 2:9-11', 2), (22, 'Hebrews 1:3', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Peter Chapter 3 Complete
-- 22 verses · 5 key verses with word studies (8 words)
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════