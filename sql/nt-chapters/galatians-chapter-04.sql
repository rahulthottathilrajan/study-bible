-- ═══════════════════════════════════════════════════
-- GALATIANS CHAPTER 4 — Sons, Not Slaves — The Allegory of Hagar and Sarah
-- 31 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Galatians 4 develops the theme of sonship versus slavery. Under the law, Israel was like an underage heir — no different from a slave despite owning everything (vv.1-3). ''But when the fulness of the time was come, God sent forth his Son, made of a woman, made under the law, to redeem them that were under the law, that we might receive the adoption of sons'' (vv.4-5). The proof of sonship is the Spirit: ''God hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father'' (v.6). Paul then makes a passionate personal appeal: the Galatians once received him as ''an angel of God'' — what happened? (vv.12-16). He expresses maternal anguish: ''My little children, of whom I travail in birth again until Christ be formed in you'' (v.19). The chapter closes with the allegory of Hagar and Sarah (vv.21-31): Hagar represents the Sinai covenant of law and bondage; Sarah represents the covenant of promise and freedom. Believers are ''children of the freewoman'' (v.31) — heirs of the promise, not slaves of the law.',
  'From Slavery to Sonship — Adoption, the Spirit, and Freedom',
  'υἱοθεσία (huiothesia)',
  'Adoption as sons — from huios (son) + tithēmi (to place). The legal act by which God places believers into the full status of mature sons with all the rights and privileges of heirs. Not a change of nature (that is regeneration) but a change of legal standing.',
  '["Heirs in Minority Under Guardians (vv.1-3): Now I say that the heir as long as he is a child differeth nothing from a servant though he be lord of all; but is under tutors and governors until the time appointed of the father; even so we when we were children were in bondage under the elements of the world","The Fulness of Time — Sent His Son (vv.4-7): But when the fulness of the time was come God sent forth his Son made of a woman made under the law to redeem them that were under the law that we might receive the adoption of sons; and because ye are sons God hath sent forth the Spirit of his Son into your hearts crying Abba Father; wherefore thou art no more a servant but a son and if a son then an heir of God through Christ","Paul''s Personal Appeal (vv.8-20): Howbeit then when ye knew not God ye did service unto them which by nature are no gods; but now after that ye have known God how turn ye again to the weak and beggarly elements; ye observe days and months and times and years; I am afraid of you; where is then the blessedness ye spake of; my little children of whom I travail in birth again until Christ be formed in you","The Allegory of Hagar and Sarah (vv.21-31): Tell me ye that desire to be under the law do ye not hear the law; for it is written that Abraham had two sons one by a bondmaid the other by a freewoman; but he who was of the bondwoman was born after the flesh but he of the freewoman was by promise; which things are an allegory for these are the two covenants; the one from the mount Sinai which gendereth to bondage which is Agar; but Jerusalem which is above is free which is the mother of us all; so then brethren we are not children of the bondwoman but of the free"]'
FROM books b WHERE b.name = 'Galatians';

-- Step 2: Insert all 31 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Now I say, That the heir, as long as he is a child, differeth nothing from a servant, though he be lord of all;',
   'Λέγω δέ ἐφ᾽ ὅσον χρόνον ὁ κληρονόμος νήπιός ἐστιν οὐδὲν διαφέρει δούλου κύριος πάντων ὤν',
   'Legō de eph'' hoson chronon ho klēronomos nēpios estin ouden diapherei doulou kyrios pantōn ōn',
   '''Heir'' (klēronomos — one who inherits). ''Child'' (nēpios — an infant, a minor). ''Differeth nothing from a servant'' (ouden diapherei doulou — has no practical advantage over a slave). ''Lord of all'' (kyrios pantōn — owner of everything). The paradox: the child owns the estate but lives like a slave under guardians. Israel under the law was in this position — destined for full inheritance but practically in bondage.',
   NULL),
  (2, 'But is under tutors and governors until the time appointed of the father.',
   'ἀλλὰ ὑπὸ ἐπιτρόπους ἐστὶ καὶ οἰκονόμους ἄχρι τῆς προθεσμίας τοῦ πατρός',
   'alla hypo epitropous esti kai oikonomous achri tēs prothesmias tou patros',
   '''Tutors'' (epitropous — guardians, trustees). ''Governors'' (oikonomous — stewards, managers). ''Time appointed'' (prothesmias — the predetermined date; a legal term for the date set in advance by the father for the son''s coming of age). God the Father set the time when Israel''s minority under the law would end — the coming of Christ.',
   NULL),
  (3, 'Even so we, when we were children, were in bondage under the elements of the world:',
   'οὕτως καὶ ἡμεῖς ὅτε ἦμεν νήπιοι ὑπὸ τὰ στοιχεῖα τοῦ κόσμου ἦμεν δεδουλωμένοι',
   'houtōs kai hēmeis hote ēmen nēpioi hypo ta stoicheia tou kosmou ēmen dedoulōmenoi',
   '''Elements of the world'' (ta stoicheia tou kosmou — the basic principles, the elementary rules, the ABCs of the world). Stoicheia can mean: basic elements of learning, elemental spirits, or fundamental principles. Under the law, Israel was held under these basic, elementary regulations — necessary for childhood but outgrown in Christ.',
   NULL),
  (4, 'But when the fulness of the time was come, God sent forth his Son, made of a woman, made under the law,',
   'ὅτε δὲ ἦλθεν τὸ πλήρωμα τοῦ χρόνου ἐξαπέστειλεν ὁ θεὸς τὸν υἱὸν αὐτοῦ γενόμενον ἐκ γυναικός γενόμενον ὑπὸ νόμον',
   'hote de ēlthen to plērōma tou chronou exapesteilen ho theos ton huion autou genomenon ek gynaikos genomenon hypo nomon',
   '''Fulness of the time'' (to plērōma tou chronou — the filling up of time, the moment when the clock reached God''s appointed hour). ''Sent forth'' (exapesteilen — sent out from Himself on a mission; the Son was with the Father and was sent out). ''His Son'' (ton huion autou — His own Son; the Son existed before being sent). ''Made of a woman'' (genomenon ek gynaikos — born from a woman; full humanity, the incarnation). ''Made under the law'' (genomenon hypo nomon — born under the law''s jurisdiction). Christ entered the human condition fully: born, subject to the law, in order to redeem those under the law.',
   'The Incarnation: This verse is one of the most theologically dense in Scripture. It affirms: (1) divine sovereignty over history (the fulness of time), (2) the pre-existence of the Son (sent from the Father), (3) the true humanity of Christ (born of a woman), (4) His submission to the law (born under the law), (5) the purpose: redemption and adoption. The timing, the Person, and the mission were all according to God''s eternal plan.'),
  (5, 'To redeem them that were under the law, that we might receive the adoption of sons.',
   'ἵνα τοὺς ὑπὸ νόμον ἐξαγοράσῃ ἵνα τὴν υἱοθεσίαν ἀπολάβωμεν',
   'hina tous hypo nomon exagorasē hina tēn huiothesian apolabōmen',
   '''Redeem'' (exagorasē — buy out, purchase freedom; the slave-market word from 3:13). ''Adoption of sons'' (tēn huiothesian — the placement as sons; from huios + thesis). Two purposes: (1) to redeem those enslaved under the law, and (2) to grant them the status of adult sons with full inheritance rights. Redemption removes the old slavery; adoption confers the new status.',
   'Adoption: Huiothesia (adoption as sons) is a distinctly Pauline term. In Roman law, adoption gave the adopted son all the rights of a natural-born heir. The adopted person left the old family completely and entered the new family with full legal standing. God does not merely free slaves; He makes them sons — with all the privileges, inheritance, and intimacy that sonship entails.'),
  (6, 'And because ye are sons, God hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father.',
   'Ὅτι δέ ἐστε υἱοί ἐξαπέστειλεν ὁ θεὸς τὸ πνεῦμα τοῦ υἱοῦ αὐτοῦ εἰς τὰς καρδίας ὑμῶν κρᾶζον Ἀββᾶ ὁ πατήρ',
   'Hoti de este huioi exapesteilen ho theos to pneuma tou huiou autou eis tas kardias hymōn krazon Abba ho patēr',
   '''Because ye are sons'' (hoti este huioi — the Spirit is sent because believers are already sons, not to make them sons). ''Spirit of his Son'' (to pneuma tou huiou autou — the Holy Spirit identified with the Son). ''Sent forth'' (exapesteilen — the same word used for sending the Son in v.4; a parallel mission). ''Crying'' (krazon — calling out loudly, shouting). ''Abba, Father'' (Abba ho patēr — the Aramaic and Greek words for Father combined; the intimate, personal address of a child to a parent). The indwelling Spirit produces the inner cry of sonship — the instinctive recognition that God is Father.',
   'The Spirit of adoption: Three Persons of the Trinity are active: the Father sends, the Spirit indwells, and the Son''s own Spirit enables the cry. The Spirit''s indwelling is the proof and experience of adoption. He does not merely teach us to say "Father" — He produces the spontaneous cry from within. The believer''s relationship with God is not formal or fearful but intimate and familial.'),
  (7, 'Wherefore thou art no more a servant, but a son; and if a son, then an heir of God through Christ.',
   'ὥστε οὐκέτι εἶ δοῦλος ἀλλ᾽ υἱός εἰ δὲ υἱός καὶ κληρονόμος θεοῦ διὰ Χριστοῦ',
   'hōste ouketi ei doulos all'' huios ei de huios kai klēronomos theou dia Christou',
   '''No more a servant'' (ouketi doulos — no longer a slave). ''But a son'' (all'' huios). ''Heir of God'' (klēronomos theou — inheritor of God''s estate). ''Through Christ'' (dia Christou). The climax: the status has changed completely. Not a slave but a son; not under guardians but an heir. The inheritance of God Himself comes through Christ. This is the identity the Galatians are in danger of abandoning by returning to law.',
   NULL),
  (8, 'Howbeit then, when ye knew not God, ye did service unto them which by nature are no gods.',
   'Ἀλλὰ τότε μὲν οὐκ εἰδότες θεὸν ἐδουλεύσατε τοῖς μὴ φύσει οὖσιν θεοῖς',
   'Alla tote men ouk eidotes theon edouleusate tois mē physei ousin theois',
   '''Knew not God'' (ouk eidotes theon — not knowing God). ''Did service'' (edouleusate — served as slaves). ''By nature no gods'' (mē physei ousin theois — not being gods by nature, not gods in reality). Before conversion, the Galatian Gentiles served false gods — idols that were not gods at all. Their pre-Christian condition was slavery to non-entities.',
   NULL),
  (9, 'But now, after that ye have known God, or rather are known of God, how turn ye again to the weak and beggarly elements, whereunto ye desire again to be in bondage?',
   'νῦν δὲ γνόντες θεόν μᾶλλον δὲ γνωσθέντες ὑπὸ θεοῦ πῶς ἐπιστρέφετε πάλιν ἐπὶ τὰ ἀσθενῆ καὶ πτωχὰ στοιχεῖα οἷς πάλιν ἄνωθεν δουλεύειν θέλετε',
   'nyn de gnontes theon mallon de gnōsthentes hypo theou pōs epistrephete palin epi ta asthenē kai ptōcha stoicheia hois palin anōthen douleuein thelete',
   '''Known God, or rather are known of God'' (gnontes theon, mallon gnōsthentes hypo theou — Paul corrects himself: what matters is not that they found God but that God found them). ''Weak and beggarly elements'' (ta asthenē kai ptōcha stoicheia — feeble and impoverished principles). ''Desire again to be in bondage'' (palin anōthen douleuein thelete — you want to be enslaved all over again). Turning to the law is returning to the same kind of elementary, powerless religious slavery they had as pagans.',
   NULL),
  (10, 'Ye observe days, and months, and times, and years.',
   'ἡμέρας παρατηρεῖσθε καὶ μῆνας καὶ καιροὺς καὶ ἐνιαυτούς',
   'hēmeras paratēreisthe kai mēnas kai kairous kai eniautous',
   '''Observe'' (paratēreisthe — are scrupulously watching, keeping an eye on). ''Days'' (sabbaths), ''months'' (new moons), ''times'' (festivals), ''years'' (sabbatical years, Jubilee). The Galatians are adopting the Jewish calendar as a requirement of their faith. Paul sees this as returning to slavery — treating external observance as a means of gaining God''s favour.',
   NULL),
  (11, 'I am afraid of you, lest I have bestowed upon you labour in vain.',
   'φοβοῦμαι ὑμᾶς μήπως εἰκῇ κεκοπίακα εἰς ὑμᾶς',
   'phoboumai hymas mēpōs eikē kekopiaka eis hymas',
   '''I am afraid of you'' (phoboumai hymas — I fear for you). ''Labour in vain'' (eikē kekopiaka — I have toiled for nothing). Paul''s pastoral anguish: if they turn to the law, his entire ministry among them will have been wasted. This is not theological detachment but the cry of a spiritual father watching his children walk away.',
   NULL),
  (12, 'Brethren, I beseech you, be as I am; for I am as ye are: ye have not injured me at all.',
   'Γίνεσθε ὡς ἐγώ ὅτι κἀγὼ ὡς ὑμεῖς ἀδελφοί δέομαι ὑμῶν οὐδέν με ἠδικήσατε',
   'Ginesthe hōs egō hoti kagō hōs hymeis adelphoi deomai hymōn ouden me ēdikēsate',
   '''Be as I am'' — Paul the Jew became as a Gentile (free from the law); he urges them not to become as Jews (enslaved to the law). ''I am as ye are'' — Paul had already made himself like the Galatians in their freedom; now he pleads with them to remain as he is. ''Ye have not injured me'' — despite their wavering, Paul holds no grudge.',
   NULL),
  (13, 'Ye know how through infirmity of the flesh I preached the gospel unto you at the first.',
   'οἴδατε δὲ ὅτι δι᾽ ἀσθένειαν τῆς σαρκὸς εὐηγγελισάμην ὑμῖν τὸ πρότερον',
   'oidate de hoti di'' astheneian tēs sarkos euēngelisamēn hymin to proteron',
   '''Infirmity of the flesh'' (astheneian tēs sarkos — a physical weakness, illness, bodily ailment). Paul''s first visit was occasioned by some physical condition. His weakened body brought him to Galatia, where he preached the gospel. The nature of the ailment is unknown — possibly eye trouble (v.15), malaria, or epilepsy.',
   NULL),
  (14, 'And my temptation which was in my flesh ye despised not, nor rejected; but received me as an angel of God, even as Christ Jesus.',
   'καὶ τὸν πειρασμὸν ὑμῶν ἐν τῇ σαρκί μου οὐκ ἐξουθενήσατε οὐδὲ ἐξεπτύσατε ἀλλ᾽ ὡς ἄγγελον θεοῦ ἐδέξασθέ με ὡς Χριστὸν Ἰησοῦν',
   'kai ton peirasmon hymōn en tē sarki mou ouk exouthenēsate oude exeptysate all'' hōs angelon theou edexasthe me hōs Christon Iēsoun',
   '''Despised not'' (ouk exouthenēsate — did not treat with contempt). ''Rejected'' (exeptysate — literally ''spit out''; did not spit on in revulsion). ''As an angel of God'' (hōs angelon theou — as a messenger of God, as a heavenly being). ''As Christ Jesus'' — they received Paul as though receiving Christ Himself. The contrast between their former welcome and their present wavering is heartbreaking.',
   NULL),
  (15, 'Where is then the blessedness ye spake of? for I bear you record, that, if it had been possible, ye would have plucked out your own eyes, and have given them to me.',
   'τίς οὖν ἦν ὁ μακαρισμὸς ὑμῶν μαρτυρῶ γὰρ ὑμῖν ὅτι εἰ δυνατὸν τοὺς ὀφθαλμοὺς ὑμῶν ἐξορύξαντες ἂν ἐδώκατέ μοι',
   'tis oun ēn ho makarismos hymōn martyrō gar hymin hoti ei dynaton tous ophthalmous hymōn exoryxantes an edōkate moi',
   '''Blessedness'' (makarismos — the congratulation of happiness, the sense of being blessed). ''Plucked out your own eyes'' (tous ophthalmous exoryxantes — having dug out your eyes). An expression of their extreme former devotion — or possibly a hint at Paul''s eye ailment: they would have given him their own eyes.',
   NULL),
  (16, 'Am I therefore become your enemy, because I tell you the truth?',
   'ὥστε ἐχθρὸς ὑμῶν γέγονα ἀληθεύων ὑμῖν',
   'hōste echthros hymōn gegona alētheuōn hymin',
   '''Enemy'' (echthros — hostile opponent). ''Tell you the truth'' (alētheuōn — speaking truth to you, being truthful). A piercing question: has Paul become their enemy simply because he tells them the truth? The Judaizers are flattering them; Paul confronts them. Flattery pleases; truth stings. But truth serves their good.',
   NULL),
  (17, 'They zealously affect you, but not well; yea, they would exclude you, that ye might affect them.',
   'ζηλοῦσιν ὑμᾶς οὐ καλῶς ἀλλὰ ἐκκλεῖσαι ὑμᾶς θέλουσιν ἵνα αὐτοὺς ζηλοῦτε',
   'zēlousin hymas ou kalōs alla ekkleisai hymas thelousin hina autous zēloute',
   '''Zealously affect'' (zēlousin — are courting you, showing zeal for you; from zēloō). ''Not well'' (ou kalōs — not honourably, not with good motives). ''Exclude you'' (ekkleisai — shut you out, bar the door). The Judaizers are courting the Galatians not out of love but to create a following. Their strategy: make the Galatians feel excluded from true fellowship (by insisting they need circumcision) so that the Galatians will then court them for approval.',
   NULL),
  (18, 'But it is good to be zealously affected always in a good thing, and not only when I am present with you.',
   'καλὸν δὲ τὸ ζηλοῦσθαι ἐν καλῷ πάντοτε καὶ μὴ μόνον ἐν τῷ παρεῖναί με πρὸς ὑμᾶς',
   'kalon de to zēlousthai en kalō pantote kai mē monon en tō pareinai me pros hymas',
   'Paul affirms that zeal is good when the object is good — he wants their zeal directed toward the gospel, not toward the Judaizers'' flattery. Their enthusiasm should not depend on Paul''s physical presence.',
   NULL),
  (19, 'My little children, of whom I travail in birth again until Christ be formed in you,',
   'τεκνία μου οὓς πάλιν ὠδίνω ἄχρις οὗ μορφωθῇ Χριστὸς ἐν ὑμῖν',
   'teknia mou hous palin ōdinō achris hou morphōthē Christos en hymin',
   '''Little children'' (teknia mou — my born ones). ''Travail'' (ōdinō — labour with birth pangs; the same word used of a woman in labour). ''Again'' (palin — a second time; Paul is going through the pain of spiritual childbirth a second time). ''Christ be formed in you'' (morphōthē Christos en hymin — Christ be shaped, moulded, given form within you; from morphoō, to form). Paul''s goal is not law-compliance but Christ-formation — the character of Christ taking shape in the believer. This is one of the most intimate and anguished verses Paul ever wrote.',
   NULL),
  (20, 'I desire to be present with you now, and to change my voice; for I stand in doubt of you.',
   'ἤθελον δὲ παρεῖναι πρὸς ὑμᾶς ἄρτι καὶ ἀλλάξαι τὴν φωνήν μου ὅτι ἀποροῦμαι ἐν ὑμῖν',
   'ēthelon de pareinai pros hymas arti kai allaxai tēn phōnēn mou hoti aporoumai en hymin',
   '''Change my voice'' (allaxai tēn phōnēn — change my tone; in person he could read their faces and adjust). ''Stand in doubt'' (aporoumai — I am perplexed, at a loss, do not know what to make of you). Paul is torn between severity and tenderness, unable to find the right tone by letter alone.',
   NULL),
  (21, 'Tell me, ye that desire to be under the law, do ye not hear the law?',
   'Λέγετέ μοι οἱ ὑπὸ νόμον θέλοντες εἶναι τὸν νόμον οὐκ ἀκούετε',
   'Legete moi hoi hypo nomon thelontes einai ton nomon ouk akouete',
   '''Desire to be under the law'' (hypo nomon thelontes einai — wanting to be under law''s authority). ''Hear the law'' (ton nomon ouk akouete — do you not listen to what the law itself says?). A brilliant rhetorical move: those who want the law should listen to what the law teaches. The law itself (the Pentateuch) contains the story of Abraham, Hagar, and Sarah — and that story speaks against law-slavery.',
   NULL),
  (22, 'For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.',
   'γέγραπται γὰρ ὅτι Ἀβραὰμ δύο υἱοὺς ἔσχεν ἕνα ἐκ τῆς παιδίσκης καὶ ἕνα ἐκ τῆς ἐλευθέρας',
   'gegraptai gar hoti Abraam duo huious eschen hena ek tēs paidiskēs kai hena ek tēs eleutheras',
   '''Bondmaid'' (paidiskēs — servant girl, slave woman; Hagar). ''Freewoman'' (eleutheras — free woman; Sarah). Two sons: Ishmael born to the slave, Isaac born to the free wife. The contrast between the two women and their sons provides the foundation for Paul''s allegory.',
   NULL),
  (23, 'But he who was of the bondwoman was born after the flesh; but he of the freewoman was by promise.',
   'ἀλλ᾽ ὁ μὲν ἐκ τῆς παιδίσκης κατὰ σάρκα γεγέννηται ὁ δὲ ἐκ τῆς ἐλευθέρας διὰ τῆς ἐπαγγελίας',
   'all'' ho men ek tēs paidiskēs kata sarka gegennētai ho de ek tēs eleutheras dia tēs epangelias',
   '''After the flesh'' (kata sarka — according to natural human capability; Ishmael was the product of human scheming). ''By promise'' (dia tēs epangelias — through the promise; Isaac was the product of God''s supernatural promise). Two principles of birth: flesh and promise. Ishmael represents human effort to achieve God''s plan; Isaac represents God''s own fulfilment of His promise.',
   NULL),
  (24, 'Which things are an allegory: for these are the two covenants; the one from the mount Sinai, which gendereth to bondage, which is Agar.',
   'ἅτινά ἐστιν ἀλληγορούμενα αὗται γάρ εἰσιν αἱ δύο διαθῆκαι μία μὲν ἀπὸ ὄρους Σινᾶ εἰς δουλείαν γεννῶσα ἥτις ἐστὶν Ἁγάρ',
   'hatina estin allēgoroumena hautai gar eisin hai duo diathēkai mia men apo orous Sina eis douleian gennōsa hētis estin Hagar',
   '''Allegory'' (allēgoroumena — speaking allegorically, being used figuratively; Paul does not deny the historical reality but draws out the typological significance). ''Two covenants'' (hai duo diathēkai). (1) Hagar = Mount Sinai = the law = bondage. The Sinai covenant produces slaves — those in bondage to the law. The Judaizers are Hagar''s children, though they would be horrified by the comparison.',
   NULL),
  (25, 'For this Agar is mount Sinai in Arabia, and answereth to Jerusalem which now is, and is in bondage with her children.',
   'τὸ δὲ Ἁγὰρ Σινᾶ ὄρος ἐστὶν ἐν τῇ Ἀραβίᾳ συστοιχεῖ δὲ τῇ νῦν Ἰερουσαλήμ δουλεύει γὰρ μετὰ τῶν τέκνων αὐτῆς',
   'to de Hagar Sina oros estin en tē Arabia systoichei de tē nyn Ierousalēm douleuei gar meta tōn teknōn autēs',
   '''Answereth to'' (systoichei — corresponds to, is in the same column with; a military term for being in rank). ''Jerusalem which now is'' (tē nyn Ierousalēm — the present, earthly Jerusalem). ''In bondage with her children'' — the current Jerusalem, with its temple-based law-system, is in the same category as Hagar: bondage. A shocking statement for Jewish readers: their holy city is aligned with the slave-woman.',
   NULL),
  (26, 'But Jerusalem which is above is free, which is the mother of us all.',
   'ἡ δὲ ἄνω Ἰερουσαλὴμ ἐλευθέρα ἐστίν ἥτις ἐστὶν μήτηρ πάντων ἡμῶν',
   'hē de anō Ierousalēm eleuthera estin hētis estin mētēr pantōn hēmōn',
   '''Jerusalem which is above'' (hē anō Ierousalēm — the heavenly Jerusalem; cf. Heb 12:22; Rev 21:2). ''Free'' (eleuthera — liberated, not enslaved). ''Mother of us all'' (mētēr pantōn hēmōn). (2) Sarah = the heavenly Jerusalem = the promise = freedom. Believers'' true identity comes not from the earthly law-system but from the heavenly Jerusalem. We are children of the freewoman, born by promise.',
   NULL),
  (27, 'For it is written, Rejoice, thou barren that bearest not; break forth and cry, thou that travailest not: for the desolate hath many more children than she which hath an husband.',
   'γέγραπται γάρ Εὐφράνθητι στεῖρα ἡ οὐ τίκτουσα ῥῆξον καὶ βόησον ἡ οὐκ ὠδίνουσα ὅτι πολλὰ τὰ τέκνα τῆς ἐρήμου μᾶλλον ἢ τῆς ἐχούσης τὸν ἄνδρα',
   'gegraptai gar Euphranthēti steira hē ou tiktousa rhēxon kai boēson hē ouk ōdinousa hoti polla ta tekna tēs erēmou mallon ē tēs echousēs ton andra',
   'Quoting Isaiah 54:1. The barren woman (Sarah) ultimately has more children than the fertile woman (Hagar). Applied: the covenant of promise (initially childless, seemingly powerless) produces more offspring than the covenant of law. The church of faith, once barren among the Gentiles, has become more fruitful than legalistic Judaism.',
   NULL),
  (28, 'Now we, brethren, as Isaac was, are the children of promise.',
   'ἡμεῖς δέ ἀδελφοί κατὰ Ἰσαὰκ ἐπαγγελίας τέκνα ἐσμέν',
   'hēmeis de adelphoi kata Isaak epangelias tekna esmen',
   '''As Isaac was'' (kata Isaak — according to the pattern of Isaac). ''Children of promise'' (epangelias tekna — children born by virtue of God''s promise). Believers are Isaac''s counterparts: born not by human effort but by divine promise. Just as Isaac was a miracle child (born to aged parents by God''s word), so believers are miracle children (born again by God''s grace).',
   NULL),
  (29, 'But as then he that was born after the flesh persecuted him that was born after the Spirit, even so it is now.',
   'ἀλλ᾽ ὥσπερ τότε ὁ κατὰ σάρκα γεννηθεὶς ἐδίωκεν τὸν κατὰ πνεῦμα οὕτως καὶ νῦν',
   'all'' hōsper tote ho kata sarka gennētheis ediōken ton kata pneuma houtōs kai nyn',
   '''Born after the flesh'' (kata sarka — Ishmael). ''Persecuted'' (ediōken — pursued, harassed; cf. Gen 21:9). ''Born after the Spirit'' (kata pneuma — Isaac; Paul interprets Isaac''s miraculous birth as a work of the Spirit). ''Even so it is now'' — the Judaizers (flesh-born, law-based) are persecuting the believers (Spirit-born, faith-based). The pattern repeats across history.',
   NULL),
  (30, 'Nevertheless what saith the scripture? Cast out the bondwoman and her son: for the son of the bondwoman shall not be heir with the son of the freewoman.',
   'ἀλλὰ τί λέγει ἡ γραφή Ἔκβαλε τὴν παιδίσκην καὶ τὸν υἱὸν αὐτῆς οὐ γὰρ μὴ κληρονομήσῃ ὁ υἱὸς τῆς παιδίσκης μετὰ τοῦ υἱοῦ τῆς ἐλευθέρας',
   'alla ti legei hē graphē Ekbale tēn paidiskēn kai ton huion autēs ou gar mē klēronomēsē ho huios tēs paidiskēs meta tou huiou tēs eleutheras',
   '''Cast out'' (ekbale — drive out, expel; Genesis 21:10). ''Shall not be heir with'' (ou mē klēronomēsē meta — will certainly not inherit alongside). The law and the promise cannot coexist as bases of salvation. The law-based system must be expelled — not the moral law as a guide to living, but the law as a system of justification. There is no joint inheritance between law-works and grace-faith.',
   NULL),
  (31, 'So then, brethren, we are not children of the bondwoman, but of the free.',
   'ἄρα ἀδελφοί οὐκ ἐσμὲν παιδίσκης τέκνα ἀλλὰ τῆς ἐλευθέρας',
   'ara adelphoi ouk esmen paidiskēs tekna alla tēs eleutheras',
   '''Not children of the bondwoman'' (ouk esmen paidiskēs tekna — we are not Hagar''s offspring). ''But of the free'' (alla tēs eleutheras — but of the free woman, Sarah). The chapter''s conclusion and the setup for chapter 5''s call to ''Stand fast in the liberty.'' Believers are identified with Sarah, freedom, promise, and the Spirit — not with Hagar, bondage, law, and flesh.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Galatians' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 4 (Fulness of time / sent forth)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πλήρωμα', 'plērōma', 'G4138', 'Fulness, completeness — from plēroō (to fill). The point when God''s clock reached its appointed hour. History is not random but divinely orchestrated: the Roman roads, Greek language, Jewish diaspora, and widespread longing for redemption all converged at the perfect moment.', 1),
  ('ἐξαπέστειλεν', 'exapesteilen', 'G1821', 'Sent forth, sent out from — from ex (out of) + apostellō (to send on a mission). The prefix ex implies the Son was sent out from the Father''s presence. He pre-existed with the Father before being sent into the world. This is a mission-sending, not a creation.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 4 AND v.verse_number = 4;

-- Verse 5 (Adoption)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('υἱοθεσίαν', 'huiothesian', 'G5206', 'Adoption as sons — from huios (son) + thesis (placing). A Roman legal concept: the adopted son received the full rights of a natural-born heir, including inheritance, the family name, and legal protection. God does not merely free slaves; He places them as sons with full heir status.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 4 AND v.verse_number = 5;

-- Verse 6 (Abba, Father)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἀββᾶ', 'Abba', 'G5', 'Father — an Aramaic word of intimate family address, roughly equivalent to "Papa" or "Daddy." Jesus used this word in Gethsemane (Mark 14:36). The Spirit enables believers to cry out to God with the same intimate familiarity as Jesus. Combined with the Greek ho patēr for emphasis.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 4 AND v.verse_number = 6;

-- Verse 19 (Christ formed in you)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μορφωθῇ', 'morphōthē', 'G3445', 'Be formed, be shaped — from morphoō (to give form to, to mould). Used only here in the NT. Christ is to take visible shape in the character and life of the believer. Not external conformity to rules but the inner formation of Christ''s own likeness.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 4 AND v.verse_number = 19;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v4: Fulness of time / God sent his Son
  (4, 'John 1:14', 1), (4, 'Romans 8:3', 2), (4, 'Philippians 2:6-7', 3),
  -- v5: Adoption of sons
  (5, 'Romans 8:15', 1), (5, 'Ephesians 1:5', 2), (5, 'Romans 8:23', 3),
  -- v6: Spirit crying Abba
  (6, 'Romans 8:15-16', 1), (6, 'Mark 14:36', 2),
  -- v7: No more servant but son
  (7, 'Romans 8:17', 1), (7, 'Galatians 3:29', 2),
  -- v9: Weak and beggarly elements
  (9, 'Colossians 2:8', 1), (9, 'Colossians 2:20', 2),
  -- v19: Christ formed in you
  (19, 'Ephesians 4:13', 1), (19, '2 Corinthians 3:18', 2), (19, 'Colossians 1:27', 3),
  -- v22: Abraham''s two sons
  (22, 'Genesis 16:15', 1), (22, 'Genesis 21:2-3', 2),
  -- v26: Jerusalem above
  (26, 'Hebrews 12:22', 1), (26, 'Revelation 21:2', 2),
  -- v28: Children of promise
  (28, 'Romans 9:7-8', 1), (28, 'Genesis 18:10', 2),
  -- v30: Cast out the bondwoman
  (30, 'Genesis 21:10-12', 1), (30, 'John 8:35', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Galatians Chapter 4 Complete
-- 31 verses · 4 key verses with word studies (6 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
