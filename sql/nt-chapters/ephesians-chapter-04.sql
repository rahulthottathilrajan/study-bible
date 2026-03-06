-- ═══════════════════════════════════════════════════
-- EPHESIANS CHAPTER 4 — Unity of the Body, the New Walk
-- 32 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Ephesians 4 marks the transition from doctrine (chs.1-3) to practice (chs.4-6). Paul begins with an appeal for unity: ''I therefore, the prisoner of the Lord, beseech you that ye walk worthy of the vocation wherewith ye are called'' (v.1). Seven unities form the basis of Christian oneness: ''one body, and one Spirit ... one hope ... one Lord, one faith, one baptism, one God and Father of all'' (vv.4-6). Christ''s ascension gifts equip the church: ''he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers'' (v.11), with the purpose ''for the perfecting of the saints, for the work of the ministry, for the edifying of the body of Christ'' (v.12). The goal is maturity: ''till we all come in the unity of the faith ... unto the measure of the stature of the fulness of Christ'' (v.13), ''speaking the truth in love'' and ''grow up into him in all things, which is the head, even Christ'' (v.15). Paul then contrasts the old way of life with the new: ''put off concerning the former conversation the old man'' (v.22), ''be renewed in the spirit of your mind'' (v.23), and ''put on the new man, which after God is created in righteousness and true holiness'' (v.24). Practical instructions follow: truthfulness (v.25), righteous anger (v.26), honest work (v.28), edifying speech (v.29), and the summary: ''be ye kind one to another, tenderhearted, forgiving one another, even as God for Christ''s sake hath forgiven you'' (v.32).',
  'Walk Worthy — Unity and the New Humanity',
  'ἑνότης (henotēs)',
  'Unity, oneness — from heis (one). The church''s unity is not something believers create but something God has given (vv.3-6) that believers must maintain (v.3). It is grounded in the sevenfold oneness of God''s work and expressed through mature, truthful, loving relationships.',
  '["The Call to Unity (vv.1-6): I therefore the prisoner of the Lord beseech you that ye walk worthy of the vocation wherewith ye are called with all lowliness and meekness with longsuffering forbearing one another in love; endeavouring to keep the unity of the Spirit in the bond of peace; there is one body and one Spirit even as ye are called in one hope of your calling; one Lord one faith one baptism; one God and Father of all who is above all and through all and in you all","Christ''s Gifts to the Church (vv.7-16): But unto every one of us is given grace according to the measure of the gift of Christ; wherefore he saith when he ascended up on high he led captivity captive and gave gifts unto men; and he gave some apostles and some prophets and some evangelists and some pastors and teachers for the perfecting of the saints for the work of the ministry for the edifying of the body of Christ; till we all come in the unity of the faith and of the knowledge of the Son of God unto a perfect man unto the measure of the stature of the fulness of Christ; speaking the truth in love may grow up into him in all things which is the head even Christ","Put Off the Old Man Put On the New (vv.17-24): This I say therefore and testify in the Lord that ye henceforth walk not as other Gentiles walk in the vanity of their mind; but ye have not so learned Christ; that ye put off concerning the former conversation the old man which is corrupt according to the deceitful lusts; and be renewed in the spirit of your mind; and that ye put on the new man which after God is created in righteousness and true holiness","Practical Instructions for the New Life (vv.25-32): Wherefore putting away lying speak every man truth with his neighbour; be ye angry and sin not let not the sun go down upon your wrath; let him that stole steal no more but rather let him labour working with his hands; let no corrupt communication proceed out of your mouth; and grieve not the holy Spirit of God whereby ye are sealed unto the day of redemption; let all bitterness and wrath and anger and clamour and evil speaking be put away from you with all malice; and be ye kind one to another tenderhearted forgiving one another even as God for Christ''s sake hath forgiven you"]'
FROM books b WHERE b.name = 'Ephesians';

-- Step 2: Insert all 32 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'I therefore, the prisoner of the Lord, beseech you that ye walk worthy of the vocation wherewith ye are called,',
   'Παρακαλῶ οὖν ὑμᾶς ἐγὼ ὁ δέσμιος ἐν κυρίῳ ἀξίως περιπατῆσαι τῆς κλήσεως ἧς ἐκλήθητε',
   'Parakalō oun hymas egō ho desmios en kyriō axiōs peripatēsai tēs klēseōs hēs eklēthēte',
   '''I therefore'' (oun — therefore; connecting the practical section to the doctrinal foundation of chs.1-3). ''Beseech'' (parakalō — urge, exhort, encourage). ''Walk worthy'' (axiōs peripatēsai — walk in a manner that balances on the scale with your calling; axiōs means ''of equal weight''). ''Vocation'' (klēseōs — calling, the divine summons). Doctrine demands a corresponding lifestyle. The indicative (what God has done) produces the imperative (how we should live).',
   NULL),
  (2, 'With all lowliness and meekness, with longsuffering, forbearing one another in love;',
   'μετὰ πάσης ταπεινοφροσύνης καὶ πραΰτητος μετὰ μακροθυμίας ἀνεχόμενοι ἀλλήλων ἐν ἀγάπῃ',
   'meta pasēs tapeinophrosynēs kai prautētos meta makrothymias anechomenoi allēlōn en agapē',
   '''Lowliness'' (tapeinophrosynēs — humility, a low estimation of oneself; in Greek culture this was a vice, but Christianity transformed it into a virtue). ''Meekness'' (prautētos — gentleness, power under control). ''Longsuffering'' (makrothymias — patience, slow to anger; literally ''long-tempered''). ''Forbearing'' (anechomenoi — holding up under, putting up with, bearing with). Four qualities that maintain unity: humility, gentleness, patience, and forbearance — all motivated by love.',
   NULL),
  (3, 'Endeavouring to keep the unity of the Spirit in the bond of peace.',
   'σπουδάζοντες τηρεῖν τὴν ἑνότητα τοῦ πνεύματος ἐν τῷ συνδέσμῳ τῆς εἰρήνης',
   'spoudazontes tērein tēn henotēta tou pneumatos en tō syndesmō tēs eirēnēs',
   '''Endeavouring'' (spoudazontes — making every effort, being diligent, zealous; this requires active, intentional work). ''Keep'' (tērein — guard, preserve, maintain; not create but preserve what already exists). ''Unity of the Spirit'' (henotēta tou pneumatos — the oneness produced by the Holy Spirit). ''Bond of peace'' (syndesmō tēs eirēnēs — the ligament of peace; peace holds the unity together). Unity is not our creation but God''s gift; our task is to guard and maintain it with diligence.',
   'Unity as gift and task: The unity of the Spirit is a present reality (the Spirit has already created it), not a future goal. Believers do not create unity — they keep it. The work required is preserving what God has done, not manufacturing what does not yet exist. This reframes all unity efforts: we are not building something new but guarding something precious that already exists.'),
  (4, 'There is one body, and one Spirit, even as ye are called in one hope of your calling;',
   'ἓν σῶμα καὶ ἓν πνεῦμα καθὼς καὶ ἐκλήθητε ἐν μιᾷ ἐλπίδι τῆς κλήσεως ὑμῶν',
   'hen sōma kai hen pneuma kathōs kai eklēthēte en mia elpidi tēs klēseōs hymōn',
   'The first three unities, grouped around the Holy Spirit: (1) ''one body'' — the universal church; (2) ''one Spirit'' — the Holy Spirit who indwells every believer; (3) ''one hope'' — the shared eschatological expectation. These three are experiential: we experience the body, the Spirit, and the hope.',
   NULL),
  (5, 'One Lord, one faith, one baptism,',
   'εἷς κύριος μία πίστις ἓν βάπτισμα',
   'heis kyrios mia pistis hen baptisma',
   'Three unities grouped around the Son: (4) ''one Lord'' — Jesus Christ; (5) ''one faith'' — the common content of Christian belief (the faith, objective); (6) ''one baptism'' — the one baptism that confesses one Lord. These three are confessional: we confess the Lord, the faith, and the baptism.',
   NULL),
  (6, 'One God and Father of all, who is above all, and through all, and in you all.',
   'εἷς θεὸς καὶ πατὴρ πάντων ὁ ἐπὶ πάντων καὶ διὰ πάντων καὶ ἐν πᾶσιν',
   'heis theos kai patēr pantōn ho epi pantōn kai dia pantōn kai en pasin',
   'The seventh unity, the Father: (7) ''one God and Father of all'' — the supreme source of all unity. Three prepositions describe his relationship to all things: ''above all'' (epi pantōn — sovereign transcendence), ''through all'' (dia pantōn — active immanence), ''in you all'' (en pasin — intimate indwelling). The Trinitarian structure is clear: Spirit (v.4), Son (v.5), Father (v.6) — seven unities rooted in the triune God.',
   'Seven unities of the faith: These seven unities (body, Spirit, hope, Lord, faith, baptism, God) form the irreducible core of Christian oneness. They are arranged in a Trinitarian pattern: Spirit (v.4), Son (v.5), Father (v.6). Unity is not uniformity — it is grounded not in agreement on every issue but in shared realities: one body to belong to, one Spirit to indwell, one hope to anticipate, one Lord to serve, one faith to confess, one baptism to identify with, one God to worship.'),
  (7, 'But unto every one of us is given grace according to the measure of the gift of Christ.',
   'Ἑνὶ δὲ ἑκάστῳ ἡμῶν ἐδόθη ἡ χάρις κατὰ τὸ μέτρον τῆς δωρεᾶς τοῦ Χριστοῦ',
   'Heni de hekastō hēmōn edothē hē charis kata to metron tēs dōreas tou Christou',
   '''Unto every one of us'' (heni hekastō — to each individual; within the unity, each person has a unique gift). ''Grace'' (charis — here in the sense of a grace-gift, a spiritual endowment for ministry). ''The measure of the gift of Christ'' (to metron tēs dōreas tou Christou — Christ determines the measure; he sovereignly distributes gifts as he sees fit). Unity does not mean uniformity; within one body, each member has a distinct, Christ-measured gift.',
   NULL),
  (8, 'Wherefore he saith, When he ascended up on high, he led captivity captive, and gave gifts unto men.',
   'διὸ λέγει Ἀναβὰς εἰς ὕψος ᾐχμαλώτευσεν αἰχμαλωσίαν καὶ ἔδωκεν δόματα τοῖς ἀνθρώποις',
   'dio legei Anabas eis hypsos ēchmalōteusen aichmalōsian kai edōken domata tois anthrōpois',
   'A quotation from Psalm 68:18, adapted to fit Christ''s ascension. ''Ascended up on high'' (anabas eis hypsos — Christ''s ascension to heaven after his resurrection). ''Led captivity captive'' (ēchmalōteusen aichmalōsian — took captive those who were captive; a triumphal procession image: the victorious king leads conquered enemies in his train). ''Gave gifts unto men'' (edōken domata — the Psalm says ''received gifts''; Paul, under inspiration, applies it to Christ who gives gifts to the church). Christ''s ascension is the basis of the church''s gifting.',
   NULL),
  (9, '(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?',
   'τὸ δὲ Ἀνέβη τί ἐστιν εἰ μὴ ὅτι καὶ κατέβη πρῶτον εἰς τὰ κατώτερα μέρη τῆς γῆς',
   'to de Anebē ti estin ei mē hoti kai katebē prōton eis ta katōtera merē tēs gēs',
   '''Descended first into the lower parts of the earth'' — variously interpreted: (1) Christ''s incarnation — he came down to earth, the lowest parts compared to heaven; (2) his burial — descent into the grave; (3) descent to Hades/Sheol between death and resurrection. The most natural reading is the incarnation: before ascending, Christ first descended from heaven to earth.',
   NULL),
  (10, 'He that descended is the same also that ascended up far above all heavens, that he might fill all things.)',
   'ὁ καταβὰς αὐτός ἐστιν καὶ ὁ ἀναβὰς ὑπεράνω πάντων τῶν οὐρανῶν ἵνα πληρώσῃ τὰ πάντα',
   'ho katabas autos estin kai ho anabas hyperanō pantōn tōn ouranōn hina plērōsē ta panta',
   '''He that descended is the same also that ascended'' — the one who came down is the one who went up; continuity of identity. ''Far above all heavens'' (hyperanō pantōn tōn ouranōn — above every level of heaven). ''That he might fill all things'' (hina plērōsē ta panta — the purpose of the ascension: Christ''s sovereign, pervasive presence filling all reality). The range of Christ''s movement — from the heights of heaven to the depths of earth and back again — demonstrates his lordship over all creation.',
   NULL),
  (11, 'And he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers;',
   'καὶ αὐτὸς ἔδωκεν τοὺς μὲν ἀποστόλους τοὺς δὲ προφήτας τοὺς δὲ εὐαγγελιστάς τοὺς δὲ ποιμένας καὶ διδασκάλους',
   'kai autos edōken tous men apostolous tous de prophētas tous de euangelistas tous de poimenas kai didaskalous',
   '''He gave'' (autos edōken — Christ himself gave; the gifted leaders are Christ''s gifts to the church). Five (or four) ministry gifts: (1) apostles — sent ones with foundational authority; (2) prophets — those who speak God''s word for edification; (3) evangelists — those who proclaim the gospel; (4-5) pastors and teachers — likely one office (''pastor-teachers''), those who shepherd through teaching. Note: Christ gives persons, not just abilities; the people are the gifts.',
   NULL),
  (12, 'For the perfecting of the saints, for the work of the ministry, for the edifying of the body of Christ:',
   'πρὸς τὸν καταρτισμὸν τῶν ἁγίων εἰς ἔργον διακονίας εἰς οἰκοδομὴν τοῦ σώματος τοῦ Χριστοῦ',
   'pros ton katartismon tōn hagiōn eis ergon diakonias eis oikodomēn tou sōmatos tou Christou',
   '''Perfecting'' (katartismon — equipping, fitting out, preparing; the same root as katartizō in Gal 6:1, mending/restoring). ''Of the saints'' — the gifted leaders equip all the saints. ''For the work of the ministry'' (eis ergon diakonias — the saints, once equipped, do the work of service). ''Edifying'' (oikodomēn — building up, construction). The purpose chain: leaders equip → saints serve → the body is built up. Ministry is not the clergy''s monopoly but every believer''s responsibility.',
   'Equipping the saints: This verse revolutionises church ministry. The gifted leaders of v.11 do not exist to do all the ministry themselves but to equip the saints (all believers) for their own work of ministry. The result is the whole body being built up. This is the ''equipping model'' of church leadership versus the ''performing model.'' Every Christian is a minister; leaders are equippers.'),
  (13, 'Till we all come in the unity of the faith, and of the knowledge of the Son of God, unto a perfect man, unto the measure of the stature of the fulness of Christ:',
   'μέχρι καταντήσωμεν οἱ πάντες εἰς τὴν ἑνότητα τῆς πίστεως καὶ τῆς ἐπιγνώσεως τοῦ υἱοῦ τοῦ θεοῦ εἰς ἄνδρα τέλειον εἰς μέτρον ἡλικίας τοῦ πληρώματος τοῦ Χριστοῦ',
   'mechri katantēsōmen hoi pantes eis tēn henotēta tēs pisteōs kai tēs epignōseōs tou huiou tou theou eis andra teleion eis metron hēlikias tou plērōmatos tou Christou',
   '''Till we all come'' (mechri katantēsōmen — until we arrive, until we reach the goal). ''Unity of the faith and of the knowledge'' (henotēta tēs pisteōs kai tēs epignōseōs — full agreement in belief and deep personal knowledge of Christ). ''Perfect man'' (andra teleion — a mature, complete, adult person; corporate maturity). ''The measure of the stature of the fulness of Christ'' — the standard of maturity is nothing less than Christ himself. The church is growing toward Christ-likeness — individually and corporately.',
   NULL),
  (14, 'That we henceforth be no more children, tossed to and fro, and carried about with every wind of doctrine, by the sleight of men, and cunning craftiness, whereby they lie in wait to deceive;',
   'ἵνα μηκέτι ὦμεν νήπιοι κλυδωνιζόμενοι καὶ περιφερόμενοι παντὶ ἀνέμῳ τῆς διδασκαλίας ἐν τῇ κυβείᾳ τῶν ἀνθρώπων ἐν πανουργίᾳ πρὸς τὴν μεθοδείαν τῆς πλάνης',
   'hina mēketi ōmen nēpioi klydōnizomenoi kai peripheromenoi panti anemō tēs didaskalias en tē kybeia tōn anthrōpōn en panourgia pros tēn methodeian tēs planēs',
   '''Children'' (nēpioi — infants, those who cannot yet speak for themselves). ''Tossed to and fro'' (klydōnizomenoi — tossed by waves, storm-tossed). ''Carried about'' (peripheromenoi — whirled around, spun). ''Every wind of doctrine'' — false teaching compared to shifting, unpredictable winds. ''Sleight'' (kybeia — dice-playing, gambling; from kybos, a cube/die; the trickery of doctrinal con artists). ''Cunning craftiness'' (panourgia — readiness to do anything, unscrupulous cleverness). ''Lie in wait to deceive'' (methodeian tēs planēs — the systematic scheming of error; methodos gives us ''method'').',
   NULL),
  (15, 'But speaking the truth in love, may grow up into him in all things, which is the head, even Christ:',
   'ἀληθεύοντες δὲ ἐν ἀγάπῃ αὐξήσωμεν εἰς αὐτὸν τὰ πάντα ὅς ἐστιν ἡ κεφαλή ὁ Χριστός',
   'alētheuontes de en agapē auxēsōmen eis auton ta panta hos estin hē kephalē ho Christos',
   '''Speaking the truth in love'' (alētheuontes en agapē — literally ''truthing in love''; not just speaking truth but living truly, being genuine; truth and love must coexist). ''Grow up into him'' (auxēsōmen eis auton — grow toward him, mature in his direction). ''In all things'' (ta panta — in every area of life). ''The head, even Christ'' — Christ is both the goal toward which we grow and the source from which we grow. Truth without love is harsh; love without truth is sentimental. Together they produce maturity.',
   NULL),
  (16, 'From whom the whole body fitly joined together and compacted by that which every joint supplieth, according to the effectual working in the measure of every part, maketh increase of the body unto the edifying of itself in love.',
   'ἐξ οὗ πᾶν τὸ σῶμα συναρμολογούμενον καὶ συμβιβαζόμενον διὰ πάσης ἁφῆς τῆς ἐπιχορηγίας κατ᾽ ἐνέργειαν ἐν μέτρῳ ἑνὸς ἑκάστου μέρους τὴν αὔξησιν τοῦ σώματος ποιεῖται εἰς οἰκοδομὴν ἑαυτοῦ ἐν ἀγάπῃ',
   'ex hou pan to sōma synarmologoumenon kai symbibazo-menon dia pasēs haphēs tēs epichorēgias kat'' energeian en metrō henos hekastou merous tēn auxēsin tou sōmatos poieitai eis oikodomēn heautou en agapē',
   '''From whom'' (ex hou — from Christ the head, the source of all growth). ''Fitly joined together'' (synarmologoumenon — fitted together with precision; each piece carefully joined). ''Compacted'' (symbibazo-menon — held together, united, knit together). ''Every joint supplieth'' (pasēs haphēs tēs epichorēgias — every ligament of supply; each connection point provides nourishment). ''Every part'' (henos hekastou merous — each individual member contributes). ''In love'' (en agapē — the atmosphere in which growth occurs). The body grows as every member functions, every joint connects, and love pervades.',
   NULL),
  (17, 'This I say therefore, and testify in the Lord, that ye henceforth walk not as other Gentiles walk, in the vanity of their mind,',
   'τοῦτο οὖν λέγω καὶ μαρτύρομαι ἐν κυρίῳ μηκέτι ὑμᾶς περιπατεῖν καθὼς καὶ τὰ λοιπὰ ἔθνη περιπατεῖ ἐν ματαιότητι τοῦ νοὸς αὐτῶν',
   'touto oun legō kai martyromai en kyriō mēketi hymas peripatein kathōs kai ta loipa ethnē peripatei en mataiotēti tou noos autōn',
   '''Testify'' (martyromai — solemnly witness, earnestly charge). ''Walk not as other Gentiles'' — the converted Gentiles must no longer live as unconverted Gentiles do. ''Vanity of their mind'' (mataiotēti tou noos — emptiness, futility, purposelessness of their thinking). The old Gentile lifestyle is characterised first by intellectual corruption — wrong thinking leads to wrong living.',
   NULL),
  (18, 'Having the understanding darkened, being alienated from the life of God through the ignorance that is in them, because of the blindness of their heart:',
   'ἐσκοτισμένοι τῇ διανοίᾳ ὄντες ἀπηλλοτριωμένοι τῆς ζωῆς τοῦ θεοῦ διὰ τὴν ἄγνοιαν τὴν οὖσαν ἐν αὐτοῖς διὰ τὴν πώρωσιν τῆς καρδίας αὐτῶν',
   'eskotismenoi tē dianoia ontes apēllotriōmenoi tēs zōēs tou theou dia tēn agnoian tēn ousan en autois dia tēn pōrōsin tēs kardias autōn',
   'A chain of spiritual decay: (1) ''understanding darkened'' (eskotismenoi tē dianoia — their intellectual faculties are blackened). (2) ''Alienated from the life of God'' (apēllotriōmenoi tēs zōēs tou theou — cut off from divine life). (3) ''Ignorance that is in them'' (agnoian — not lack of information but willful ignorance). (4) ''Blindness of their heart'' (pōrōsin — hardening, petrification, callousness; a medical term for the calcification of bone). Darkened mind → alienation from God → willful ignorance → hardened heart.',
   NULL),
  (19, 'Who being past feeling have given themselves over unto lasciviousness, to work all uncleanness with greediness.',
   'οἵτινες ἀπηλγηκότες ἑαυτοὺς παρέδωκαν τῇ ἀσελγείᾳ εἰς ἐργασίαν ἀκαθαρσίας πάσης ἐν πλεονεξίᾳ',
   'hoitines apēlgēkotes heautous paredōkan tē aselgeia eis ergasian akatharsias pasēs en pleonexia',
   '''Past feeling'' (apēlgēkotes — calloused, beyond pain, having ceased to feel; the moral nerve endings are dead). ''Given themselves over'' (heautous paredōkan — surrendered themselves; active: they handed themselves over willingly). ''Lasciviousness'' (aselgeia — sensuality, debauchery, shameless excess). ''Greediness'' (pleonexia — insatiable desire, wanting more and more; the appetite that is never satisfied). The final stage of the chain: moral numbness leads to willing surrender to every form of uncleanness.',
   NULL),
  (20, 'But ye have not so learned Christ;',
   'ὑμεῖς δὲ οὐχ οὕτως ἐμάθετε τὸν Χριστόν',
   'hymeis de ouch houtōs emathete ton Christon',
   '''But ye'' (hymeis de — strong contrast). ''Have not so learned Christ'' (ouch houtōs emathete ton Christon — you did not learn Christ in that way). A striking phrase: one does not merely learn about Christ but learns Christ — he is both the teacher and the subject matter. The Christian life involves a fundamentally different way of thinking and living than the pagan pattern of vv.17-19.',
   NULL),
  (21, 'If so be that ye have heard him, and have been taught by him, as the truth is in Jesus:',
   'εἴγε αὐτὸν ἠκούσατε καὶ ἐν αὐτῷ ἐδιδάχθητε καθώς ἐστιν ἀλήθεια ἐν τῷ Ἰησοῦ',
   'eige auton ēkousate kai en autō edidachthēte kathōs estin alētheia en tō Iēsou',
   '''If so be'' (eige — assuming that, since indeed). ''Heard him'' (auton ēkousate — heard him, not merely about him). ''Taught by him'' (en autō edidachthēte — instructed in him, in the sphere of Christ). ''As the truth is in Jesus'' (kathōs estin alētheia en tō Iēsou — the rare use of the name ''Jesus'' alone emphasises the historical person whose life embodied truth). Christ is the teacher, the curriculum, and the truth itself.',
   NULL),
  (22, 'That ye put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts;',
   'ἀποθέσθαι ὑμᾶς κατὰ τὴν προτέραν ἀναστροφὴν τὸν παλαιὸν ἄνθρωπον τὸν φθειρόμενον κατὰ τὰς ἐπιθυμίας τῆς ἀπάτης',
   'apothesthai hymas kata tēn proteran anastrophēn ton palaion anthrōpon ton phtheiromenon kata tas epithymias tēs apatēs',
   '''Put off'' (apothesthai — to strip off like clothing, to discard like a filthy garment). ''Former conversation'' (proteran anastrophēn — the old way of life, previous conduct). ''The old man'' (ton palaion anthrōpon — the old self, the person you were before Christ; the unregenerate identity). ''Corrupt'' (phtheiromenon — present participle: being progressively corrupted, in the process of decay). ''Deceitful lusts'' (epithymias tēs apatēs — desires that deceive, cravings that promise but never deliver). The old self is not improving; it is decaying.',
   NULL),
  (23, 'And be renewed in the spirit of your mind;',
   'ἀνανεοῦσθαι δὲ τῷ πνεύματι τοῦ νοὸς ὑμῶν',
   'ananeousthai de tō pneumati tou noos hymōn',
   '''Be renewed'' (ananeousthai — to be made new, to be continually renewed; present passive infinitive: an ongoing process, not a one-time event). ''Spirit of your mind'' (tō pneumati tou noos — the deepest level of the mind, the spirit that animates the intellect). Transformation starts in the mind — not behaviour modification but mental renovation. The contrast with v.17 (''vanity of their mind'') is deliberate: the pagan mind is futile; the Christian mind is being renewed.',
   NULL),
  (24, 'And that ye put on the new man, which after God is created in righteousness and true holiness.',
   'καὶ ἐνδύσασθαι τὸν καινὸν ἄνθρωπον τὸν κατὰ θεὸν κτισθέντα ἐν δικαιοσύνῃ καὶ ὁσιότητι τῆς ἀληθείας',
   'kai endysasthai ton kainon anthrōpon ton kata theon ktisthenta en dikaiosynē kai hosiotēti tēs alētheias',
   '''Put on'' (endysasthai — to clothe oneself with, to put on like a garment). ''New man'' (kainon anthrōpon — new in quality, a new kind of person). ''After God'' (kata theon — according to God, in God''s likeness, patterned after God). ''Created'' (ktisthenta — a divine creation, not human self-improvement). ''Righteousness and true holiness'' (dikaiosynē kai hosiotēti tēs alētheias — righteousness in relation to others and holiness before God, both rooted in truth). The new self is God''s creation, reflecting God''s character.',
   'The old man and the new man: The Christian life is described in three steps: (1) put off the old man (v.22), (2) be renewed in the mind (v.23), (3) put on the new man (v.24). This is not self-reformation but participation in a divine work: the new man is ''created'' (ktisthenta) by God, not manufactured by human effort. The pattern is ''after God'' — the new self is modelled on God himself, expressed in righteousness (right relationships with others) and holiness (right relationship with God).'),
  (25, 'Wherefore putting away lying, speak every man truth with his neighbour: for we are members one of another.',
   'διὸ ἀποθέμενοι τὸ ψεῦδος λαλεῖτε ἀλήθειαν ἕκαστος μετὰ τοῦ πλησίον αὐτοῦ ὅτι ἐσμὲν ἀλλήλων μέλη',
   'dio apothemenoi to pseudos laleite alētheian hekastos meta tou plēsion autou hoti esmen allēlōn melē',
   '''Putting away'' (apothemenoi — same word as v.22: stripping off). ''Lying'' (to pseudos — the lie, falsehood in general). ''Speak truth'' (laleite alētheian — quoting Zechariah 8:16). ''Members one of another'' (esmen allēlōn melē — we are limbs of the same body). The reason for truthfulness is not merely moral duty but organic connection: lying to a fellow believer is as absurd as the hand deceiving the foot — it harms the whole body.',
   NULL),
  (26, 'Be ye angry, and sin not: let not the sun go down upon your wrath:',
   'ὀργίζεσθε καὶ μὴ ἁμαρτάνετε ὁ ἥλιος μὴ ἐπιδυέτω ἐπὶ τῷ παροργισμῷ ὑμῶν',
   'orgizesthe kai mē hamartanete ho hēlios mē epidyetō epi tō parorgismō hymōn',
   '''Be angry and sin not'' (orgizesthe kai mē hamartanete — quoting Psalm 4:4). The imperative ''be angry'' acknowledges that righteous anger exists (cf. Jesus in Mark 3:5). The command is not ''never be angry'' but ''do not let anger lead to sin.'' ''Let not the sun go down'' — anger must be dealt with quickly; it must not be allowed to fester overnight and become bitterness.',
   NULL),
  (27, 'Neither give place to the devil.',
   'μηδὲ δίδοτε τόπον τῷ διαβόλῳ',
   'mēde didote topon tō diabolō',
   '''Give place'' (didote topon — grant a foothold, provide a location). ''The devil'' (tō diabolō — the slanderer, the accuser). Unresolved anger gives the devil a strategic position in the believer''s life. Prolonged anger is not merely an emotional problem but a spiritual one — it creates an opening for demonic influence.',
   NULL),
  (28, 'Let him that stole steal no more: but rather let him labour, working with his hands the thing which is good, that he may have to give to him that needeth.',
   'ὁ κλέπτων μηκέτι κλεπτέτω μᾶλλον δὲ κοπιάτω ἐργαζόμενος τὸ ἀγαθὸν ταῖς χερσίν ἵνα ἔχῃ μεταδιδόναι τῷ χρείαν ἔχοντι',
   'ho kleptōn mēketi kleptetō mallon de kopiatō ergazomenos to agathon tais chersin hina echē metadidonai tō chreian echonti',
   '''Steal no more'' — not merely negative (stop stealing) but radically positive: (1) ''labour'' (kopiatō — toil, work hard to the point of exhaustion); (2) ''working with his hands'' (ergazomenos tais chersin — productive, honest manual labour); (3) ''that he may have to give'' (hina echē metadidonai — the ultimate purpose of work is not self-enrichment but generosity). The transformation: from taking to giving, from being a burden to being a blessing.',
   NULL),
  (29, 'Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.',
   'πᾶς λόγος σαπρὸς ἐκ τοῦ στόματος ὑμῶν μὴ ἐκπορευέσθω ἀλλ᾽ εἴ τις ἀγαθὸς πρὸς οἰκοδομὴν τῆς χρείας ἵνα δῷ χάριν τοῖς ἀκούουσιν',
   'pas logos sapros ek tou stomatos hymōn mē ekporeuesthō all'' ei tis agathos pros oikodomēn tēs chreias hina dō charin tois akouousin',
   '''Corrupt communication'' (logos sapros — rotten word, putrid speech; sapros is used of decayed fruit or fish). ''Good to the use of edifying'' (agathos pros oikodomēn — good for building up). ''Minister grace unto the hearers'' (dō charin tois akouousin — give grace to those who hear). Every word should be tested: does it build up? Does it supply grace? Speech is not merely self-expression but a ministry tool for dispensing grace.',
   NULL),
  (30, 'And grieve not the holy Spirit of God, whereby ye are sealed unto the day of redemption.',
   'καὶ μὴ λυπεῖτε τὸ πνεῦμα τὸ ἅγιον τοῦ θεοῦ ἐν ᾧ ἐσφραγίσθητε εἰς ἡμέραν ἀπολυτρώσεως',
   'kai mē lypeite to pneuma to hagion tou theou en hō esphragisthēte eis hēmeran apolytrōseōs',
   '''Grieve not'' (mē lypeite — do not cause sorrow to; present imperative: stop grieving). The Holy Spirit is a person who can be grieved — not an impersonal force. The things that grieve him are the sins listed in context: lying, unresolved anger, stealing, corrupt speech, bitterness, wrath. ''Sealed unto the day of redemption'' (esphragisthēte eis hēmeran apolytrōseōs — the sealing of 1:13 is restated; despite our sin, the Spirit''s seal remains until the final day). The Spirit can be grieved but not driven away.',
   'Grieving the Holy Spirit: This verse reveals the personal nature of the Holy Spirit — he can experience grief (lypē, sorrow). The sins that grieve him are relational sins: lying, anger, stealing, corrupt speech, bitterness (vv.25-31). The Spirit is grieved when believers act contrary to his character of truth, love, and holiness. Yet the sealing remains ''unto the day of redemption'' — the Spirit may be grieved but the seal is not broken. This balances holiness motivation with security assurance.'),
  (31, 'Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice:',
   'πᾶσα πικρία καὶ θυμὸς καὶ ὀργὴ καὶ κραυγὴ καὶ βλασφημία ἀρθήτω ἀφ᾽ ὑμῶν σὺν πάσῃ κακίᾳ',
   'pasa pikria kai thymos kai orgē kai kraugē kai blasphēmia arthētō aph'' hymōn syn pasē kakia',
   'Six vices to remove: (1) ''bitterness'' (pikria — inner resentment that poisons the soul); (2) ''wrath'' (thymos — sudden, explosive rage, boiling anger); (3) ''anger'' (orgē — settled, abiding hostility); (4) ''clamour'' (kraugē — loud outcry, shouting matches); (5) ''evil speaking'' (blasphēmia — slander, abusive speech against others); (6) ''malice'' (kakia — general ill-will, the desire to harm). These represent a progression from internal resentment to external explosion to deliberate harm.',
   NULL),
  (32, 'And be ye kind one to another, tenderhearted, forgiving one another, even as God for Christ''s sake hath forgiven you.',
   'γίνεσθε δὲ εἰς ἀλλήλους χρηστοί εὔσπλαγχνοι χαριζόμενοι ἑαυτοῖς καθὼς καὶ ὁ θεὸς ἐν Χριστῷ ἐχαρίσατο ὑμῖν',
   'ginesthe de eis allēlous chrēstoi eusplanchnoi charizomenoi heautois kathōs kai ho theos en Christō echarisato hymin',
   '''Kind'' (chrēstoi — useful, beneficial, gracious; the word sounds like Christos — a play on words). ''Tenderhearted'' (eusplanchnoi — compassionate, having good internal organs; the ancients located emotions in the bowels). ''Forgiving'' (charizomenoi — gracing, freely giving grace; from the same root as charis). ''Even as God for Christ''s sake hath forgiven you'' (kathōs kai ho theos en Christō echarisato hymin — the standard of forgiveness: God''s forgiveness of us in Christ). We forgive not because others deserve it but because God has forgiven us. The cross is the measure and motive of all Christian forgiveness.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 3 (Unity of the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἑνότητα', 'henotēta', 'G1775', 'Unity, oneness — from heis (one). Used only here and v.13 in the entire NT. The unity is ''of the Spirit'' — created by the Holy Spirit, not by human agreement or organisation. Believers are called to maintain what God has made, not manufacture what does not yet exist.', 1),
  ('σπουδάζοντες', 'spoudazontes', 'G4704', 'Being diligent, making every effort, being zealous — from spoudē (haste, earnestness). Maintaining unity requires active, intentional, urgent effort. Unity is not automatic; it requires vigilance and hard work. The present participle indicates ongoing, habitual effort.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4 AND v.verse_number = 3;

-- Verse 11 (Ministry gifts)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποιμένας', 'poimenas', 'G4166', 'Pastors, shepherds — from poimēn (a shepherd who tends and feeds the flock). The pastoral image: feeding, protecting, guiding, healing the sheep. Linked grammatically with ''teachers'' (kai didaskalous), suggesting one office: pastor-teachers who shepherd through the ministry of teaching.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4 AND v.verse_number = 11;

-- Verse 12 (Equipping the saints)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καταρτισμόν', 'katartismon', 'G2677', 'Perfecting, equipping, preparing — from katartizō (to mend, to fit out, to make complete). Used of mending nets (Matt 4:21), setting broken bones (medical term), and fitting out a ship for voyage. The word implies restoring something to its intended function. Leaders equip saints for their intended purpose: the work of ministry.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4 AND v.verse_number = 12;

-- Verse 22 (Put off the old man)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀποθέσθαι', 'apothesthai', 'G659', 'To put off, to lay aside, to strip off — like removing soiled clothing. An aorist infinitive: a decisive, once-for-all action. The imagery of changing garments: removing the filthy rags of the old life and putting on the clean garments of the new.', 1),
  ('παλαιὸν ἄνθρωπον', 'palaion anthrōpon', 'G3820+G444', 'Old man, old self — palaios means old, worn out, outdated (not merely previous in time but obsolete in character). The old man is the unregenerate identity, the person we were in Adam. It is ''corrupt'' (phtheiromenon — in the process of rotting), not improving.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4 AND v.verse_number = 22;

-- Verse 30 (Grieve not the Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λυπεῖτε', 'lypeite', 'G3076', 'Grieve, cause sorrow — from lypē (grief, pain, sorrow). The Holy Spirit is a divine person who experiences sorrow when believers act contrary to his nature. This is one of the strongest proofs of the Spirit''s personhood — an impersonal force cannot feel grief.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4 AND v.verse_number = 30;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Walk worthy
  (1, 'Colossians 1:10', 1), (1, '1 Thessalonians 2:12', 2),
  -- v3: Unity of the Spirit
  (3, 'Philippians 2:2-3', 1), (3, 'Colossians 3:14-15', 2),
  -- v6: One God and Father
  (6, '1 Corinthians 8:6', 1), (6, 'Romans 11:36', 2),
  -- v8: Ascended on high
  (8, 'Psalm 68:18', 1), (8, 'Colossians 2:15', 2),
  -- v11: Ministry gifts
  (11, '1 Corinthians 12:28', 1), (11, 'Romans 12:6-8', 2),
  -- v12: Equipping the saints
  (12, '1 Corinthians 14:12', 1), (12, '2 Timothy 3:17', 2),
  -- v13: Unity of the faith
  (13, 'Colossians 1:28', 1), (13, 'Philippians 3:12-14', 2),
  -- v15: Speaking truth in love
  (15, 'Colossians 2:19', 1), (15, '1 Corinthians 13:6', 2),
  -- v22: Put off old man
  (22, 'Romans 6:6', 1), (22, 'Colossians 3:9', 2),
  -- v24: Put on new man
  (24, 'Colossians 3:10', 1), (24, '2 Corinthians 5:17', 2),
  -- v25: Speak truth
  (25, 'Zechariah 8:16', 1), (25, 'Colossians 3:9', 2),
  -- v26: Angry and sin not
  (26, 'Psalm 4:4', 1), (26, 'James 1:19-20', 2),
  -- v30: Grieve not the Spirit
  (30, 'Isaiah 63:10', 1), (30, '1 Thessalonians 5:19', 2), (30, 'Ephesians 1:13-14', 3),
  -- v32: Forgiving one another
  (32, 'Colossians 3:13', 1), (32, 'Matthew 6:14-15', 2), (32, 'Matthew 18:32-33', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Ephesians' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Ephesians Chapter 4 Complete
-- 32 verses · 6 key verses with word studies (10 words)
-- Cross-references for 14 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
