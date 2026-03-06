-- ═══════════════════════════════════════════════════
-- COLOSSIANS CHAPTER 1 — The Supremacy of Christ Over All Creation
-- 29 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Colossians 1 contains one of the most exalted Christological passages in Scripture — the Christ Hymn (vv.15-20), which declares Christ''s absolute supremacy over all creation and His reconciling work through the cross. Paul writes to a church he has never visited (founded by Epaphras, v.7), countering an emerging heresy that blended Jewish legalism, Greek philosophy, and proto-Gnostic mysticism. His response is not primarily to refute errors point by point but to magnify Christ until every competing claim shrinks to insignificance. After his thanksgiving and prayer for the Colossians'' fruitfulness, knowledge, and endurance, Paul launches into the hymn: Christ is the image of the invisible God, the firstborn of all creation, the Creator and sustainer of all things visible and invisible, the head of the church, the first to rise from the dead, and the One in whom all fullness dwells. Through His blood, all things are reconciled. The chapter closes with Paul''s suffering for the church and his ministry of the mystery: Christ in you, the hope of glory.',
  'The Supremacy & Sufficiency of Christ',
  'πρωτότοκος (prōtotokos)',
  'Firstborn — not first created but supreme in rank and authority. The firstborn held preeminence, the chief inheritance, and the father''s authority. Christ is preeminent over all creation.',
  '["Greeting (vv.1-2): Paul an apostle, Timothy, to the saints at Colossae","Thanksgiving & Prayer (vv.3-14): Faith, love, hope; fruitfulness; knowledge of God''s will; strength and endurance; delivered from darkness into Christ''s kingdom","The Christ Hymn — Supremacy in Creation (vv.15-17): Image of the invisible God; firstborn of all creation; all things created by Him and for Him; He is before all things; in Him all things hold together","The Christ Hymn — Supremacy in Redemption (vv.18-20): Head of the body; firstborn from the dead; preeminent in all things; all fullness dwelling in Him; reconciliation through the blood of His cross","Paul''s Ministry of the Mystery (vv.21-29): Once alienated, now reconciled; continue in the faith; Paul''s suffering; the mystery: Christ in you, the hope of glory; warning and teaching every man"]'
FROM books b WHERE b.name = 'Colossians';

-- Step 2: Insert all 29 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, an apostle of Jesus Christ by the will of God, and Timotheus our brother,',
   'Παῦλος ἀπόστολος Χριστοῦ Ἰησοῦ διὰ θελήματος θεοῦ καὶ Τιμόθεος ὁ ἀδελφός',
   'Paulos apostolos Christou Iēsou dia thelēmatos theou kai Timotheos ho adelphos',
   'Unlike Philippians where Paul called himself a ''servant,'' here he asserts his apostleship — necessary for a church he has never personally visited. ''By the will of God'' (dia thelēmatos theou) establishes divine authority. Timothy is co-sender but not co-apostle (''our brother,'' not ''our fellow-apostle''). Paul writes to address a dangerous heresy that threatens to diminish Christ''s supremacy.',
   NULL),
  (2,
   'To the saints and faithful brethren in Christ which are at Colosse: Grace be unto you, and peace, from God our Father and the Lord Jesus Christ.',
   'τοῖς ἐν Κολοσσαῖς ἁγίοις καὶ πιστοῖς ἀδελφοῖς ἐν Χριστῷ χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'tois en Kolossais hagiois kai pistois adelphois en Christō charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   'Colossae was a small city in the Lycus Valley (modern Turkey), overshadowed by neighbouring Laodicea and Hierapolis. The church was largely Gentile (cf. 1:21,27; 2:13). ''Saints'' (hagiois — set apart ones) and ''faithful'' (pistois — believing, trustworthy) describe their position and character. The standard Pauline greeting: grace (Greek gift) and peace (Hebrew shalom) from both Father and Son.',
   NULL),
  (3,
   'We give thanks to God and the Father of our Lord Jesus Christ, praying always for you,',
   'Εὐχαριστοῦμεν τῷ θεῷ καὶ πατρὶ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ πάντοτε περὶ ὑμῶν προσευχόμενοι',
   'Eucharistoumen tō theō kai patri tou kyriou hēmōn Iēsou Christou pantote peri hymōn proseuchomenoi',
   'Paul''s thanksgiving is characteristic: he thanks God before addressing problems. ''Always'' (pantote) praying — not sporadic but habitual. Paul prays for churches he has never visited with the same fervour as those he founded. His intercession demonstrates apostolic love that transcends personal acquaintance.',
   NULL),
  (4,
   'Since we heard of your faith in Christ Jesus, and of the love which ye have to all the saints,',
   'ἀκούσαντες τὴν πίστιν ὑμῶν ἐν Χριστῷ Ἰησοῦ καὶ τὴν ἀγάπην ἣν ἔχετε εἰς πάντας τοὺς ἁγίους',
   'akousantes tēn pistin hymōn en Christō Iēsou kai tēn agapēn hēn echete eis pantas tous hagious',
   'The triad of faith, love, and hope (v.5) — the same trio found in 1 Corinthians 13:13 and 1 Thessalonians 1:3. Faith is directed toward Christ (en Christō), love flows outward to ''all the saints'' (pantas tous hagious) — not selective but universal. Paul heard their report through Epaphras (v.7).',
   NULL),
  (5,
   'For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;',
   'διὰ τὴν ἐλπίδα τὴν ἀποκειμένην ὑμῖν ἐν τοῖς οὐρανοῖς ἣν προηκούσατε ἐν τῷ λόγῳ τῆς ἀληθείας τοῦ εὐαγγελίου',
   'dia tēn elpida tēn apokeimenēn hymin en tois ouranois hēn proēkousate en tō logō tēs alētheias tou euangeliou',
   '''Hope laid up'' (apokeimenēn — stored away, reserved, kept safe in a treasury). This hope is not wishful thinking but a guaranteed inheritance ''in heaven'' (en tois ouranois) — secure and imperishable (cf. 1 Pet 1:4). They first heard this hope in ''the word of the truth of the gospel'' — a threefold description emphasising that the Gospel is verbal (word), reliable (truth), and good news (gospel). Against the Colossian heretics who offered ''higher knowledge,'' Paul insists the original Gospel is sufficient.',
   NULL),
  (6,
   'Which is come unto you, as it is in all the world; and bringeth forth fruit, and increaseth, as it doth also in you, since the day ye heard of it, and knew the grace of God in truth:',
   'τοῦ παρόντος εἰς ὑμᾶς καθὼς καὶ ἐν παντὶ τῷ κόσμῳ ἐστὶν καρποφορούμενον καὶ αὐξανόμενον καθὼς καὶ ἐν ὑμῖν ἀφ᾽ ἧς ἡμέρας ἠκούσατε καὶ ἐπέγνωτε τὴν χάριν τοῦ θεοῦ ἐν ἀληθείᾳ',
   'tou parontos eis hymas kathōs kai en panti tō kosmō estin karpophoroumenon kai auxanomenon kathōs kai en hymin aph'' hēs hēmeras ēkousate kai epegnōte tēn charin tou theou en alētheia',
   'Two images of Gospel vitality: ''bringeth forth fruit'' (karpophoroumenon — bearing fruit, producing results) and ''increaseth'' (auxanomenon — growing, expanding). The Gospel is not static but dynamic — a living seed that grows wherever it is planted. It bears fruit ''in all the world'' — Paul asserts the Gospel''s universality against local heretics who claim superior wisdom. ''Knew the grace of God in truth'' (epegnōte — came to know fully, recognised deeply) — their genuine experience of grace immunises against false teaching.',
   NULL),
  (7,
   'As ye also learned of Epaphras our dear fellowservant, who is for you a faithful minister of Christ;',
   'καθὼς ἐμάθετε ἀπὸ Ἐπαφρᾶ τοῦ ἀγαπητοῦ συνδούλου ἡμῶν ὅς ἐστιν πιστὸς ὑπὲρ ὑμῶν διάκονος τοῦ Χριστοῦ',
   'kathōs emathete apo Epaphra tou agapētou syndoulou hēmōn hos estin pistos hyper hymōn diakonos tou Christou',
   'Epaphras — likely the founder of the Colossian church (and those at Laodicea and Hierapolis, 4:12-13). He brought the Gospel to Colossae, probably after hearing Paul in Ephesus (Acts 19:10). ''Dear fellowservant'' (agapētou syndoulou — beloved fellow-slave). ''Faithful minister'' (pistos diakonos) — Paul validates Epaphras''s teaching against those who would undermine it with rival doctrines.',
   NULL),
  (8,
   'Who also declared unto us your love in the Spirit.',
   'ὁ καὶ δηλώσας ἡμῖν τὴν ὑμῶν ἀγάπην ἐν πνεύματι',
   'ho kai dēlōsas hēmin tēn hymōn agapēn en pneumati',
   'Epaphras reported to Paul in Rome about the Colossians'' ''love in the Spirit'' (agapēn en pneumati) — love produced by the Holy Spirit, not mere natural affection. This is the only explicit mention of the Holy Spirit in Colossians — unusual for Paul. The letter''s focus is so intensely Christological that even the Spirit''s work is mentioned briefly.',
   NULL),
  (9,
   'For this cause we also, since the day we heard it, do not cease to pray for you, and to desire that ye might be filled with the knowledge of his will in all wisdom and spiritual understanding;',
   'Διὰ τοῦτο καὶ ἡμεῖς ἀφ᾽ ἧς ἡμέρας ἠκούσαμεν οὐ παυόμεθα ὑπὲρ ὑμῶν προσευχόμενοι καὶ αἰτούμενοι ἵνα πληρωθῆτε τὴν ἐπίγνωσιν τοῦ θελήματος αὐτοῦ ἐν πάσῃ σοφίᾳ καὶ συνέσει πνευματικῇ',
   'Dia touto kai hēmeis aph'' hēs hēmeras ēkousamen ou pauometha hyper hymōn proseuchomenoi kai aitoumenoi hina plērōthēte tēn epignōsin tou thelēmatos autou en pasē sophia kai synesei pneumatikē',
   'Paul''s prayer has a strategic purpose against the heresy: he prays they be ''filled'' (plērōthēte — filled to the full) with ''knowledge'' (epignōsin — deep, full, experiential knowledge) of God''s will. The heretics promised secret knowledge (gnōsis); Paul counters with true spiritual knowledge. ''Wisdom'' (sophia — seeing God''s design in the big picture) and ''understanding'' (synesei — practical insight into specific situations). Both are ''spiritual'' (pneumatikē) — sourced in the Spirit, not human reason.',
   NULL),
  (10,
   'That ye might walk worthy of the Lord unto all pleasing, being fruitful in every good work, and increasing in the knowledge of God;',
   'περιπατῆσαι ἀξίως τοῦ κυρίου εἰς πᾶσαν ἀρεσκείαν ἐν παντὶ ἔργῳ ἀγαθῷ καρποφοροῦντες καὶ αὐξανόμενοι τῇ ἐπιγνώσει τοῦ θεοῦ',
   'peripatēsai axiōs tou kyriou eis pasan areskeian en panti ergō agathō karpophorountes kai auxanomenoi tē epignōsei tou theou',
   'Knowledge leads to conduct: ''walk worthy'' (peripatēsai axiōs — conduct life in a manner befitting the Lord). Four results of being filled with knowledge: (1) ''unto all pleasing'' (pasan areskeian — in everything pleasing to God), (2) ''fruitful in every good work'' (repeating the agricultural language of v.6), (3) ''increasing in the knowledge of God'' — knowledge produces obedience, which produces more knowledge, in a virtuous cycle. Knowing and doing reinforce each other.',
   NULL),
  (11,
   'Strengthened with all might, according to his glorious power, unto all patience and longsuffering with joyfulness;',
   'ἐν πάσῃ δυνάμει δυναμούμενοι κατὰ τὸ κράτος τῆς δόξης αὐτοῦ εἰς πᾶσαν ὑπομονὴν καὶ μακροθυμίαν μετὰ χαρᾶς',
   'en pasē dynamei dynamoumenoi kata to kratos tēs doxēs autou eis pasan hypomonēn kai makrothymian meta charas',
   '''Strengthened with all might'' (pasē dynamei dynamoumenoi — empowered with all power, a double emphasis on divine power). ''According to his glorious power'' (kata to kratos tēs doxēs — in proportion to the might of His glory). The purpose of this power is surprising: not for spectacular miracles but for ''patience'' (hypomonēn — steadfast endurance under trials) and ''longsuffering'' (makrothymian — patient tolerance toward people). And all ''with joyfulness'' (meta charas) — even endurance is joyful. God gives might for the mundane, not just the miraculous.',
   NULL),
  (12,
   'Giving thanks unto the Father, which hath made us meet to be partakers of the inheritance of the saints in light:',
   'εὐχαριστοῦντες τῷ πατρὶ τῷ ἱκανώσαντι ὑμᾶς εἰς τὴν μερίδα τοῦ κλήρου τῶν ἁγίων ἐν τῷ φωτί',
   'eucharistountes tō patri tō hikanōsanti hymas eis tēn merida tou klērou tōn hagiōn en tō phōti',
   '''Made us meet'' (hikanōsanti — made sufficient, qualified, equipped). God the Father has qualified believers to share (merida — portion, share) in the inheritance (klērou — lot, allotment — echoing Israel''s inheritance of the Promised Land). ''In light'' (en tō phōti) contrasts with the ''darkness'' of v.13. The heretics claimed believers needed additional mystical experiences to qualify; Paul insists God has already qualified them.',
   NULL),
  (13,
   'Who hath delivered us from the power of darkness, and hath translated us into the kingdom of his dear Son:',
   'ὃς ἐρρύσατο ἡμᾶς ἐκ τῆς ἐξουσίας τοῦ σκότους καὶ μετέστησεν εἰς τὴν βασιλείαν τοῦ υἱοῦ τῆς ἀγάπης αὐτοῦ',
   'hos errysato hēmas ek tēs exousias tou skotous kai metestēsen eis tēn basileian tou huiou tēs agapēs autou',
   'Two past-tense completed actions: (1) ''delivered'' (errysato — rescued, snatched out of danger) from ''the power of darkness'' (exousias tou skotous — the authority, domain, jurisdiction of darkness — Satan''s realm). (2) ''Translated'' (metestēsen — transferred, relocated, transplanted) into ''the kingdom of his dear Son'' (the kingdom of the Son of His love). Believers have already changed kingdoms — this is a past, completed transfer, not a future hope.',
   'The kingdom of Christ is a present reality, not merely future. Believers have been transferred from Satan''s domain into Christ''s kingdom. This is a sovereign, divine rescue operation — God delivered and transferred us. The passive voice shows divine initiative throughout.'),
  (14,
   'In whom we have redemption through his blood, even the forgiveness of sins:',
   'ἐν ᾧ ἔχομεν τὴν ἀπολύτρωσιν τὴν ἄφεσιν τῶν ἁμαρτιῶν',
   'en hō echomen tēn apolytrōsin tēn aphesin tōn hamartiōn',
   '''Redemption'' (apolytrōsin — release obtained by paying a ransom price; from apo [away from] + lytrōsis [ransoming, releasing]). In the ancient world this was the price paid to free a slave or prisoner of war. ''Forgiveness'' (aphesin — sending away, release, remission) defines what redemption means: sins are sent away, dismissed, cancelled. ''We have'' (echomen — present tense: we presently possess redemption as an ongoing reality). This sets the stage for the Christ Hymn: who is this Son who redeems?',
   NULL),
  (15,
   'Who is the image of the invisible God, the firstborn of every creature:',
   'ὅς ἐστιν εἰκὼν τοῦ θεοῦ τοῦ ἀοράτου πρωτότοκος πάσης κτίσεως',
   'hos estin eikōn tou theou tou aoratou prōtotokos pasēs ktiseōs',
   'The Christ Hymn begins. ''Image'' (eikōn — representation, exact likeness, visible manifestation) of the ''invisible God'' (aoratou — unseen). Christ makes the unseeable God visible (cf. John 1:18, 14:9; Heb 1:3). ''Firstborn of every creature'' (prōtotokos pasēs ktiseōs) — NOT ''first created'' but ''supreme over all creation.'' ''Firstborn'' (prōtotokos) is a title of rank and preeminence, not chronological origin. Israel was God''s ''firstborn'' (Exod 4:22) — not first created but chief among nations. Psalm 89:27 applies ''firstborn'' to the Davidic king as ''highest of the kings of the earth.''',
   'The deity of Christ: As the ''image of the invisible God,'' Christ is the exact visible representation of God''s nature — not a created copy but the eternal, perfect expression of who God is. ''Firstborn'' (prōtotokos) denotes supremacy and sovereignty, not origin. Verse 16 proves this: He is the Creator, not a creature. Arians and Jehovah''s Witnesses misread this as ''first created''; the context demolishes that interpretation.'),
  (16,
   'For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:',
   'ὅτι ἐν αὐτῷ ἐκτίσθη τὰ πάντα τὰ ἐν τοῖς οὐρανοῖς καὶ τὰ ἐπὶ τῆς γῆς τὰ ὁρατὰ καὶ τὰ ἀόρατα εἴτε θρόνοι εἴτε κυριότητες εἴτε ἀρχαὶ εἴτε ἐξουσίαι τὰ πάντα δι᾽ αὐτοῦ καὶ εἰς αὐτὸν ἔκτισται',
   'hoti en autō ektisthē ta panta ta en tois ouranois kai ta epi tēs gēs ta horata kai ta aorata eite thronoi eite kyriotētes eite archai eite exousiai ta panta di'' autou kai eis auton ektistai',
   '''By him'' (en autō — in Him, within His person as the sphere of creation), ''by him'' (di'' autou — through Him, as the agent of creation), ''for him'' (eis auton — unto Him, as the goal and purpose of creation). Three prepositions capturing Christ''s total relationship to creation: source, agent, and goal. ''All things'' (ta panta) is comprehensive and repeated for emphasis. The catalogue — thrones, dominions, principalities, powers — names every rank of spiritual hierarchy. The Colossian heretics were worshipping angels and spiritual powers; Paul says Christ created them all. You do not worship what the Creator made.',
   'Christ as Creator: This verse attributes the creation of the entire universe — material and spiritual, visible and invisible — to Christ. He is not a creature but the Creator. This parallels John 1:3 (''all things were made by him'') and Hebrews 1:2 (''by whom also he made the worlds''). The angel hierarchies the Colossians venerated were made by and for Christ.'),
  (17,
   'And he is before all things, and by him all things consist.',
   'καὶ αὐτός ἐστιν πρὸ πάντων καὶ τὰ πάντα ἐν αὐτῷ συνέστηκεν',
   'kai autos estin pro pantōn kai ta panta en autō synestēken',
   '''He is'' (autos estin — He Himself exists, emphatic personal pronoun). ''Before all things'' (pro pantōn) — both temporal priority (He existed before creation) and logical priority (He is superior to creation). ''Consist'' (synestēken — hold together, cohere, are sustained; perfect tense: have been held together and continue to be held together). Christ is the cosmic glue — the sustaining force that prevents the universe from disintegrating into chaos. Physics describes the forces; Christ is the Person behind them.',
   NULL),
  (18,
   'And he is the head of the body, the church: who is the beginning, the firstborn from the dead; that in all things he might have the preeminence.',
   'καὶ αὐτός ἐστιν ἡ κεφαλὴ τοῦ σώματος τῆς ἐκκλησίας ὅς ἐστιν ἀρχή πρωτότοκος ἐκ τῶν νεκρῶν ἵνα γένηται ἐν πᾶσιν αὐτὸς πρωτεύων',
   'kai autos estin hē kephalē tou sōmatos tēs ekklēsias hos estin archē prōtotokos ek tōn nekrōn hina genētai en pasin autos prōteuōn',
   'The hymn shifts from creation to redemption. ''Head of the body, the church'' (kephalē tou sōmatos tēs ekklēsias) — in Ephesians, the body metaphor emphasises unity; here it emphasises authority. Christ governs the church as the head governs the body. ''Beginning'' (archē — origin, source, first principle). ''Firstborn from the dead'' (prōtotokos ek tōn nekrōn) — He is the first to rise in a glorified body, the pioneer of resurrection. ''Preeminence'' (prōteuōn — holding first place, being supreme; only here in the NT). The purpose clause: ''that in ALL THINGS He might have the preeminence'' — nothing is excluded from Christ''s supremacy.',
   NULL),
  (19,
   'For it pleased the Father that in him should all fulness dwell;',
   'ὅτι ἐν αὐτῷ εὐδόκησεν πᾶν τὸ πλήρωμα κατοικῆσαι',
   'hoti en autō eudokēsen pan to plērōma katoikēsai',
   '''Fulness'' (plērōma — the totality, the sum total, the complete measure). The Gnostic heretics distributed God''s fullness across a hierarchy of spiritual beings (aeons); Paul insists ALL the fullness dwells in Christ alone. ''Dwell'' (katoikēsai — to settle down permanently, to take up permanent residence; not paroikeō [to visit temporarily] but katoikeō [to make one''s home]). The fullness of deity did not visit Christ temporarily but moved in permanently. ''It pleased'' (eudokēsen — was well-pleased, delighted; the Father willed it so).',
   'The fullness of God in Christ: Against every system that distributes divine attributes among multiple beings, Paul declares that ALL of God''s fullness permanently resides in Christ alone. This is restated emphatically in 2:9 — ''in him dwelleth all the fulness of the Godhead bodily.'' Christ is not one of many mediators but the sole repository of everything God is.'),
  (20,
   'And, having made peace through the blood of his cross, by him to reconcile all things unto himself; by him, I say, whether they be things in earth, or things in heaven.',
   'καὶ δι᾽ αὐτοῦ ἀποκαταλλάξαι τὰ πάντα εἰς αὐτόν εἰρηνοποιήσας διὰ τοῦ αἵματος τοῦ σταυροῦ αὐτοῦ δι᾽ αὐτοῦ εἴτε τὰ ἐπὶ τῆς γῆς εἴτε τὰ ἐν τοῖς οὐρανοῖς',
   'kai di'' autou apokatallaxai ta panta eis auton eirēnopoiēsas dia tou haimatos tou staurou autou di'' autou eite ta epi tēs gēs eite ta en tois ouranois',
   '''Reconcile'' (apokatallaxai — to reconcile completely, to restore to right relationship; the apo prefix intensifies: thorough reconciliation). ''All things'' (ta panta) — the same comprehensive phrase used of creation (v.16) is now used of reconciliation. The scope of Christ''s work matches the scope of His creation. ''Through the blood of his cross'' (dia tou haimatos tou staurou) — the means of peace is violent, bloody, sacrificial death. Peace cost blood. ''Things in earth and in heaven'' — the reconciliation is cosmic in scope, affecting the entire created order.',
   'Cosmic reconciliation: Christ''s atoning death has implications beyond individual salvation — it addresses the cosmic disruption caused by sin. The creation itself will be liberated (Rom 8:19-22). This is not universalism (all individuals saved) but the restoration of the entire created order to its proper relationship with God through Christ''s blood.'),
  (21,
   'And you, that were sometime alienated and enemies in your mind by wicked works, yet now hath he reconciled',
   'καὶ ὑμᾶς ποτε ὄντας ἀπηλλοτριωμένους καὶ ἐχθροὺς τῇ διανοίᾳ ἐν τοῖς ἔργοις τοῖς πονηροῖς νυνὶ δὲ ἀποκατήλλαξεν',
   'kai hymas pote ontas apēllotriōmenous kai echthrous tē dianoia en tois ergois tois ponērois nyni de apokatēllaxen',
   'Paul makes the cosmic personal: ''and YOU'' — the Colossians themselves were once ''alienated'' (apēllotriōmenous — estranged, excluded from God''s commonwealth) and ''enemies'' (echthrous — hostile) ''in your mind'' (tē dianoia — in the disposition of thought). Sin is first a mindset before it becomes wicked works. ''Yet now'' (nyni de) — the great reversal. ''Hath he reconciled'' (apokatēllaxen — aorist: a completed, decisive act). The alienated are now at home; the enemies are now friends.',
   NULL),
  (22,
   'In the body of his flesh through death, to present you holy and unblameable and unreproveable in his sight:',
   'ἐν τῷ σώματι τῆς σαρκὸς αὐτοῦ διὰ τοῦ θανάτου παραστῆσαι ὑμᾶς ἁγίους καὶ ἀμώμους καὶ ἀνεγκλήτους κατενώπιον αὐτοῦ',
   'en tō sōmati tēs sarkos autou dia tou thanatou parastēsai hymas hagious kai amōmous kai anenklētous katenōpion autou',
   '''In the body of his flesh'' — Paul stresses the physical, material reality of Christ''s death against early Gnostic tendencies to deny Christ''s true humanity. Reconciliation required a real body suffering a real death. The goal: to ''present'' (parastēsai — to place alongside, to present formally, as a bride before a groom or a sacrifice before God) them ''holy'' (hagious — set apart), ''unblameable'' (amōmous — without blemish, spotless), and ''unreproveable'' (anenklētous — unaccusable, beyond legal charge). Three terms of absolute purity.',
   NULL),
  (23,
   'If ye continue in the faith grounded and settled, and be not moved away from the hope of the gospel, which ye have heard, and which was preached to every creature which is under heaven; whereof I Paul am made a minister;',
   'εἴγε ἐπιμένετε τῇ πίστει τεθεμελιωμένοι καὶ ἑδραῖοι καὶ μὴ μετακινούμενοι ἀπὸ τῆς ἐλπίδος τοῦ εὐαγγελίου οὗ ἠκούσατε τοῦ κηρυχθέντος ἐν πάσῃ κτίσει τῇ ὑπὸ τὸν οὐρανόν οὗ ἐγενόμην ἐγὼ Παῦλος διάκονος',
   'eige epimenete tē pistei tethemeliōmenoi kai hedraioi kai mē metakinoumenoi apo tēs elpidos tou euangeliou hou ēkousate tou kērychtentos en pasē ktisei tē hypo ton ouranon hou egenomēn egō Paulos diakonos',
   '''If ye continue'' (eige epimenete — if indeed you remain, assuming you persist). Not expressing doubt but urging perseverance. ''Grounded'' (tethemeliōmenoi — having been laid on a foundation, perfect tense: firmly established) and ''settled'' (hedraioi — steadfast, immovable). ''Not moved away'' (mē metakinoumenoi — not being shifted, not being dislodged) from the Gospel''s hope. Paul contrasts the stability of the Gospel with the shifting sands of the Colossian heresy. The original message is sufficient — do not be moved to a ''better'' version.',
   NULL),
  (24,
   'Who now rejoice in my sufferings for you, and fill up that which is behind of the afflictions of Christ in my flesh for his body''s sake, which is the church:',
   'ὃς νῦν χαίρω ἐν τοῖς παθήμασιν ὑπὲρ ὑμῶν καὶ ἀνταναπληρῶ τὰ ὑστερήματα τῶν θλίψεων τοῦ Χριστοῦ ἐν τῇ σαρκί μου ὑπὲρ τοῦ σώματος αὐτοῦ ὅ ἐστιν ἡ ἐκκλησία',
   'hos nyn chairō en tois pathēmasin hyper hymōn kai antanaplērō ta hysterēmata tōn thlipseōn tou Christou en tē sarki mou hyper tou sōmatos autou ho estin hē ekklēsia',
   '''Fill up that which is behind'' (antanaplērō ta hysterēmata — fill up in return the deficiencies). This does NOT mean Christ''s atoning suffering was insufficient. The ''afflictions of Christ'' (thlipseōn tou Christou) are the sufferings the church endures as Christ''s body — the continuing persecution that Christ experiences through His people (cf. Acts 9:4 ''why persecutest thou me?''). Paul''s imprisonment completes his share of the corporate suffering the church must undergo before Christ''s return.',
   'Paul''s suffering does not supplement the atonement (which is complete and perfect, Heb 10:14) but fulfils the quota of suffering appointed for the church as Christ''s body in this age. Christ suffers with His church (Acts 9:4-5); Paul bears his portion of that corporate suffering.'),
  (25,
   'Whereof I am made a minister, according to the dispensation of God which is given to me for you, to fulfil the word of God;',
   'ἧς ἐγενόμην ἐγὼ διάκονος κατὰ τὴν οἰκονομίαν τοῦ θεοῦ τὴν δοθεῖσάν μοι εἰς ὑμᾶς πληρῶσαι τὸν λόγον τοῦ θεοῦ',
   'hēs egenomēn egō diakonos kata tēn oikonomian tou theou tēn dotheisan moi eis hymas plērōsai ton logon tou theou',
   '''Dispensation'' (oikonomian — stewardship, management, administration of a household — from oikos [house] + nomos [law]). Paul is a steward entrusted with God''s household, managing God''s Word for the benefit of the Gentiles. ''To fulfil'' (plērōsai — to fill full, to bring to completion) the word of God — Paul''s mission is to bring the Gospel to its full proclamation, especially to the Gentile world. The word is not yet ''fulfilled'' until every nation hears.',
   NULL),
  (26,
   'Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints:',
   'τὸ μυστήριον τὸ ἀποκεκρυμμένον ἀπὸ τῶν αἰώνων καὶ ἀπὸ τῶν γενεῶν νῦν δὲ ἐφανερώθη τοῖς ἁγίοις αὐτοῦ',
   'to mystērion to apokekrymmenon apo tōn aiōnōn kai apo tōn geneōn nyn de ephanerōthē tois hagiois autou',
   '''Mystery'' (mystērion) in Paul''s usage is not something mysterious or puzzling but a divine secret that was hidden and has now been revealed. It was ''hid'' (apokekrymmenon — concealed, kept secret; perfect tense: kept hidden throughout the ages) from ''ages and generations'' — the OT era did not fully see it. ''But now'' (nyn de) — the great turning point of revelation. ''Made manifest'' (ephanerōthē — made visible, disclosed). The content of the mystery is revealed in v.27.',
   NULL),
  (27,
   'To whom God would make known what is the riches of the glory of this mystery among the Gentiles; which is Christ in you, the hope of glory:',
   'οἷς ἠθέλησεν ὁ θεὸς γνωρίσαι τί τὸ πλοῦτος τῆς δόξης τοῦ μυστηρίου τούτου ἐν τοῖς ἔθνεσιν ὅ ἐστιν Χριστὸς ἐν ὑμῖν ἡ ἐλπὶς τῆς δόξης',
   'hois ēthelēsen ho theos gnōrisai ti to ploutos tēs doxēs tou mystēriou toutou en tois ethnesin ho estin Christos en hymin hē elpis tēs doxēs',
   'The mystery revealed: ''Christ in you, the hope of glory'' (Christos en hymin hē elpis tēs doxēs). Three revolutionary truths: (1) Christ dwells in believers (en hymin — in you, personally, inwardly). (2) This indwelling is among the Gentiles (en tois ethnesin — the shock: Gentiles, without circumcision or Torah, have the Messiah living in them). (3) This indwelling Christ is ''the hope of glory'' — the guarantee of future glorification. ''Riches of the glory'' (ploutos tēs doxēs) — the wealth of this mystery is incalculable.',
   'Christ in you: The indwelling of Christ by the Spirit is the essence of the mystery once hidden in the OT but now revealed in the new covenant. This is not merely ''Christ among you'' (corporate) but ''Christ in you'' (personal, individual indwelling). This indwelling is the deposit guaranteeing future glory (cf. Rom 8:10; Gal 2:20; Eph 3:17).'),
  (28,
   'Whom we preach, warning every man, and teaching every man in all wisdom; that we may present every man perfect in Christ Jesus:',
   'ὃν ἡμεῖς καταγγέλλομεν νουθετοῦντες πάντα ἄνθρωπον καὶ διδάσκοντες πάντα ἄνθρωπον ἐν πάσῃ σοφίᾳ ἵνα παραστήσωμεν πάντα ἄνθρωπον τέλειον ἐν Χριστῷ',
   'hon hēmeis katangellomen nouthetountes panta anthrōpon kai didaskontes panta anthrōpon en pasē sophia hina parastēsōmen panta anthrōpon teleion en Christō',
   '''Every man'' (panta anthrōpon) appears three times — deliberate emphasis against Gnostic elitism that reserved higher truths for an inner circle. The Gospel is for everyone, and maturity is available to everyone. Two methods: ''warning'' (nouthetountes — admonishing, correcting, putting into the mind) and ''teaching'' (didaskontes — instructing systematically). The goal: ''present every man perfect'' (teleion — mature, complete) in Christ — not in mystical experiences or philosophical systems, but in Christ alone.',
   NULL),
  (29,
   'Whereunto I also labour, striving according to his working, which worketh in me mightily.',
   'εἰς ὃ καὶ κοπιῶ ἀγωνιζόμενος κατὰ τὴν ἐνέργειαν αὐτοῦ τὴν ἐνεργουμένην ἐν ἐμοὶ ἐν δυνάμει',
   'eis ho kai kopiō agōnizomenos kata tēn energeian autou tēn energoumenēn en emoi en dynamei',
   '''Labour'' (kopiō — toil to the point of exhaustion, work until weary). ''Striving'' (agōnizomenos — contending, struggling like an athlete in competition; the source of English ''agonize''). Paul works intensely — but the power source is divine: ''according to his working'' (energeian — energy, operation) ''which worketh in me mightily'' (en dynamei — in power). Paul''s effort is real; God''s empowerment is the cause. Human striving and divine enabling are not competitors but partners.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Colossians' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 9 (Knowledge and wisdom)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπίγνωσιν', 'epignōsin', 'G1922', 'Full knowledge, deep experiential knowledge — epi (upon, intensive) + gnōsis (knowledge). Paul uses the intensified form against heretics who boasted of their gnōsis.', 1),
  ('σοφίᾳ', 'sophia', 'G4678', 'Wisdom — the ability to see God''s design in the big picture, to understand how truth applies to life. Spiritual wisdom is sourced in God, not human philosophy.', 2),
  ('συνέσει', 'synesei', 'G4907', 'Understanding, insight — from syn (together) + hiēmi (to send). The ability to bring things together, to see connections, to apply truth to specific situations. Practical discernment.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 13 (Delivered and translated)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐρρύσατο', 'errysato', 'G4506', 'Delivered, rescued, snatched from danger — aorist tense: a completed, decisive rescue. God''s salvation is not gradual extraction but sudden deliverance.', 1),
  ('μετέστησεν', 'metestēsen', 'G3179', 'Transferred, relocated, transplanted — from meta (change) + histēmi (to stand). Like a conquered people deported to a new kingdom, believers are moved from darkness to light.', 2),
  ('ἐξουσίας', 'exousias', 'G1849', 'Power, authority, jurisdiction, domain — Satan''s realm is not chaos but an organised kingdom of darkness with structure and authority. Christ breaks its hold.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 13;

-- Verse 15 (Image and firstborn)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εἰκών', 'eikōn', 'G1504', 'Image, representation, exact likeness — not a faint copy but the precise visible manifestation of the invisible God. As a coin bears the emperor''s image, Christ bears God''s nature.', 1),
  ('πρωτότοκος', 'prōtotokos', 'G4416', 'Firstborn — title of rank, supremacy, and preeminence, not chronological origin. The firstborn held the father''s authority, the chief inheritance, the highest status. Christ is supreme over all creation (not part of it).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 15;

-- Verse 16 (All things created)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θρόνοι', 'thronoi', 'G2362', 'Thrones — the highest rank of angelic beings in this hierarchy. All spiritual authorities, however exalted, were created by Christ.', 1),
  ('κυριότητες', 'kyriotētes', 'G2963', 'Dominions, lordships — from kyrios (lord). Angelic powers with governing authority, all subordinate to Christ the Creator.', 2),
  ('ἀρχαί', 'archai', 'G746', 'Principalities, rulers, authorities — from archē (beginning, rule). Both good and evil spiritual powers are included: Christ created them all.', 3),
  ('ἐξουσίαι', 'exousiai', 'G1849', 'Powers, authorities — delegated authority in the spiritual realm. Every level of cosmic power owes its existence to Christ.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Verse 17 (All things hold together)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συνέστηκεν', 'synestēken', 'G4921', 'Hold together, cohere, are sustained — perfect tense: have been held together and continue to be held together. Christ is the sustaining force behind the universe''s coherence.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 17;

-- Verse 19 (All fullness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πλήρωμα', 'plērōma', 'G4138', 'Fullness, totality, the sum total — everything God is in His nature, attributes, and glory. The Gnostics distributed this among many aeons; Paul concentrates it all in Christ.', 1),
  ('κατοικῆσαι', 'katoikēsai', 'G2730', 'To dwell permanently, to take up residence — from kata (down, settled) + oikeō (to inhabit). Not a temporary visit but permanent, settled residence. The fullness moved in and stayed.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 19;

-- Verse 20 (Reconcile)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀποκαταλλάξαι', 'apokatallaxai', 'G604', 'To reconcile completely — the apo prefix adds thoroughness: full, complete restoration of relationship. A stronger form than simple katallagē.', 1),
  ('εἰρηνοποιήσας', 'eirēnopoiēsas', 'G1517', 'Having made peace — from eirēnē (peace) + poieō (to make). Peace is not natural but was made through costly sacrifice: the blood of the cross.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 20;

-- Verse 27 (Christ in you)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μυστηρίου', 'mystēriou', 'G3466', 'Mystery — a divine secret previously hidden, now revealed. Not something incomprehensible but something undiscoverable by human reason, disclosed by divine revelation.', 1),
  ('ἐλπίς', 'elpis', 'G1680', 'Hope — not wishful thinking but confident expectation based on God''s promise. Christ indwelling guarantees future glory.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = 27;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v4: Faith, love, hope triad
  (4, '1 Thessalonians 1:3', 1), (4, '1 Corinthians 13:13', 2), (4, 'Galatians 5:6', 3),
  -- v5: Hope laid up in heaven
  (5, '1 Peter 1:3-4', 1), (5, 'Matthew 6:20', 2), (5, '2 Timothy 4:8', 3),
  -- v9: Filled with knowledge
  (9, 'Ephesians 1:17-18', 1), (9, 'Philippians 1:9-11', 2), (9, 'Romans 12:2', 3),
  -- v12: Qualified for inheritance
  (12, 'Ephesians 1:11,18', 1), (12, 'Acts 26:18', 2), (12, '1 Peter 2:9', 3),
  -- v13: Delivered from darkness
  (13, 'Ephesians 2:1-6', 1), (13, 'Acts 26:18', 2), (13, '1 Peter 2:9', 3), (13, 'Ephesians 6:12', 4),
  -- v14: Redemption
  (14, 'Ephesians 1:7', 1), (14, 'Romans 3:24', 2), (14, 'Hebrews 9:22', 3),
  -- v15: Image and firstborn
  (15, 'John 1:18', 1), (15, 'John 14:9', 2), (15, 'Hebrews 1:3', 3), (15, 'Psalm 89:27', 4),
  -- v16: Creator of all things
  (16, 'John 1:3', 1), (16, 'Hebrews 1:2', 2), (16, 'Genesis 1:1', 3), (16, 'Ephesians 1:21', 4),
  -- v17: Before all things
  (17, 'John 1:1', 1), (17, 'John 8:58', 2), (17, 'Hebrews 1:3', 3),
  -- v18: Head of the church, firstborn from dead
  (18, 'Ephesians 1:22-23', 1), (18, 'Revelation 1:5', 2), (18, '1 Corinthians 15:20', 3), (18, 'Acts 26:23', 4),
  -- v19: All fullness
  (19, 'Colossians 2:9', 1), (19, 'John 1:16', 2), (19, 'Ephesians 1:23', 3),
  -- v20: Reconciliation
  (20, '2 Corinthians 5:18-19', 1), (20, 'Ephesians 2:13-16', 2), (20, 'Romans 5:10', 3),
  -- v22: Holy and unblameable
  (22, 'Ephesians 5:27', 1), (22, '1 Thessalonians 5:23', 2), (22, 'Jude 24', 3),
  -- v24: Afflictions of Christ
  (24, 'Acts 9:4-5', 1), (24, '2 Corinthians 1:5', 2), (24, '2 Corinthians 4:10', 3),
  -- v26: Mystery revealed
  (26, 'Ephesians 3:3-9', 1), (26, 'Romans 16:25-26', 2), (26, '1 Corinthians 2:7', 3),
  -- v27: Christ in you
  (27, 'Galatians 2:20', 1), (27, 'Romans 8:10', 2), (27, 'Ephesians 3:17', 3), (27, 'John 14:20,23', 4),
  -- v29: God's power at work
  (29, 'Ephesians 3:20', 1), (29, 'Philippians 4:13', 2), (29, '1 Corinthians 15:10', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Colossians' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Colossians Chapter 1 Complete!
-- 29 verses · 9 key verses with word studies (25 words)
-- Cross-references for 17 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════