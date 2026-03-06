-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 3 — The Glory of the New Covenant
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  '2 Corinthians 3 is one of the most theologically dense chapters in the Pauline corpus, contrasting the old covenant of the letter with the new covenant of the Spirit. Paul begins by declaring the Corinthians themselves to be his letter of recommendation: ''Ye are our epistle written in our hearts, known and read of all men … written not with ink, but with the Spirit of the living God; not in tables of stone, but in fleshy tables of the heart'' (vv.2-3). Paul claims sufficiency not from himself but from God, ''who also hath made us able ministers of the new testament; not of the letter, but of the spirit: for the letter killeth, but the spirit giveth life'' (v.6). A remarkable comparison follows: if the ministry of death ''written and engraven in stones, was glorious'' so that Israel could not look upon Moses'' face (v.7), ''how shall not the ministration of the spirit be rather glorious?'' (v.8). The old covenant glory was fading (katargoumenēn); the new covenant glory is permanent (v.11). Moses veiled his face so Israel would not see the glory fading (v.13), but ''their minds were blinded: for until this day remaineth the same vail untaken away in the reading of the old testament'' (v.14). The veil is removed only ''when it shall turn to the Lord'' (v.16). The chapter climaxes: ''Now the Lord is that Spirit: and where the Spirit of the Lord is, there is liberty. But we all, with open face beholding as in a glass the glory of the Lord, are changed into the same image from glory to glory, even as by the Spirit of the Lord'' (vv.17-18).',
  'The Surpassing Glory of the New Covenant',
  'δόξα (doxa)',
  'Glory — radiance, splendour, the visible manifestation of God''s character and presence. The word appears nineteen times in this chapter, creating a sustained meditation on the comparative glory of the old and new covenants. The old had glory; the new surpasses it beyond all comparison.',
  '["Living Letters of Recommendation (vv.1-3): Do we begin again to commend ourselves or need we as some others epistles of commendation to you or letters of commendation from you ye are our epistle written in our hearts known and read of all men forasmuch as ye are manifestly declared to be the epistle of Christ ministered by us written not with ink but with the Spirit of the living God not in tables of stone but in fleshy tables of the heart","Sufficiency from God and Ministers of the New Covenant (vv.4-6): And such trust have we through Christ to God-ward not that we are sufficient of ourselves to think any thing as of ourselves but our sufficiency is of God who also hath made us able ministers of the new testament not of the letter but of the spirit for the letter killeth but the spirit giveth life","The Surpassing Glory: Old Covenant versus New (vv.7-11): But if the ministration of death written and engraven in stones was glorious so that the children of Israel could not stedfastly behold the face of Moses for the glory of his countenance which glory was to be done away how shall not the ministration of the spirit be rather glorious; for if the ministration of condemnation be glory much more doth the ministration of righteousness exceed in glory; for even that which was made glorious had no glory in this respect by reason of the glory that excelleth; for if that which is done away was glorious much more that which remaineth is glorious","The Veil Removed in Christ (vv.12-16): Seeing then that we have such hope we use great plainness of speech and not as Moses which put a vail over his face that the children of Israel could not stedfastly look to the end of that which is abolished but their minds were blinded for until this day remaineth the same vail untaken away in the reading of the old testament which vail is done away in Christ but even unto this day when Moses is read the vail is upon their heart nevertheless when it shall turn to the Lord the vail shall be taken away","The Spirit of Liberty and Transformation (vv.17-18): Now the Lord is that Spirit and where the Spirit of the Lord is there is liberty but we all with open face beholding as in a glass the glory of the Lord are changed into the same image from glory to glory even as by the Spirit of the Lord"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Do we begin again to commend ourselves? or need we, as some others, epistles of commendation to you, or letters of commendation from you?',
   'Ἀρχόμεθα πάλιν ἑαυτοὺς συνιστάνειν ἢ μὴ χρῄζομεν ὥς τινες συστατικῶν ἐπιστολῶν πρὸς ὑμᾶς ἢ ἐξ ὑμῶν',
   'Archometha palin heautous synistanein ē mē chrēzomen hōs tines systatikōn epistolōn pros hymas ē ex hymōn',
   '''Commend ourselves'' (heautous synistanein — to recommend ourselves, to present ourselves favorably). ''Letters of commendation'' (systatikōn epistolōn — introductory letters; a standard practice in the early church: traveling teachers carried letters from known churches vouching for their credentials). ''Some others'' — an oblique reference to Paul''s opponents at Corinth who apparently carried such letters. Paul''s point: his own work at Corinth is his credential.',
   NULL),
  (2, 'Ye are our epistle written in our hearts, known and read of all men:',
   'ἡ ἐπιστολὴ ἡμῶν ὑμεῖς ἐστε ἐγγεγραμμένη ἐν ταῖς καρδίαις ἡμῶν γινωσκομένη καὶ ἀναγινωσκομένη ὑπὸ πάντων ἀνθρώπων',
   'hē epistolē hēmōn hymeis este engegrammenē en tais kardiais hēmōn ginōskomenē kai anaginōskomenē hypo pantōn anthrōpōn',
   '''Our epistle'' (hē epistolē hēmōn — our letter). ''Ye are'' — the Corinthians themselves, transformed by the gospel Paul preached, are his credentials. ''Written in our hearts'' (engegrammenē en tais kardiais — inscribed on our hearts; perfect participle: permanently written). ''Known and read'' — a wordplay: ginōskomenē (known/recognized) and anaginōskomenē (read). The Corinthians are a living document that anyone can ''read'' by observing their transformed lives.',
   NULL),
  (3, 'Forasmuch as ye are manifestly declared to be the epistle of Christ ministered by us, written not with ink, but with the Spirit of the living God; not in tables of stone, but in fleshy tables of the heart.',
   'φανερούμενοι ὅτι ἐστὲ ἐπιστολὴ Χριστοῦ διακονηθεῖσα ὑφ᾿ ἡμῶν ἐγγεγραμμένη οὐ μέλανι ἀλλὰ πνεύματι θεοῦ ζῶντος οὐκ ἐν πλαξὶν λιθίναις ἀλλ᾿ ἐν πλαξὶν καρδίαις σαρκίναις',
   'phaneroumenoi hoti este epistolē Christou diakonētheisa hyph'' hēmōn engegrammenē ou melani alla pneumati theou zōntos ouk en plaxin lithinais all'' en plaxin kardiais sarkinais',
   '''Epistle of Christ'' (epistolē Christou — Christ is the author; Paul is the amanuensis/minister). ''Ministered by us'' (diakonētheisa hyph'' hēmōn — served/delivered through our ministry). ''Not with ink'' (ou melani — not with writing fluid). ''Spirit of the living God'' — the writing instrument is the Holy Spirit. ''Tables of stone … fleshy tables of the heart'' — an unmistakable allusion to Exodus 31:18 (stone tablets) and Jeremiah 31:33/Ezekiel 36:26 (the new covenant written on the heart). The contrast: old covenant = external, stone, ink; new covenant = internal, heart, Spirit.',
   'This verse is a masterful synthesis of OT new covenant prophecy (Jer 31:33, Ezek 11:19, 36:26) applied to the Corinthian church. The progression from stone to flesh, from ink to Spirit, from external commandment to internal transformation is the essence of the old-to-new covenant transition. Christ is the author of this living letter; Paul is the delivery agent; the Holy Spirit is the writing instrument; and the human heart is the tablet. This is not allegorizing but showing how OT promises find concrete fulfilment in the church.'),
  (4, 'And such trust have we through Christ to God-ward:',
   'πεποίθησιν δὲ τοιαύτην ἔχομεν διὰ τοῦ Χριστοῦ πρὸς τὸν θεόν',
   'pepoithēsin de toiautēn echomen dia tou Christou pros ton theon',
   '''Trust'' (pepoithēsin — confidence, assurance; from peithō, to persuade). ''Through Christ'' (dia tou Christou — Christ is the mediator of this confidence). ''To God-ward'' (pros ton theon — toward God, directed at God). Paul''s confidence is not self-generated but Christ-mediated and God-directed. This transitional verse sets up the critical statement of v.5.',
   NULL),
  (5, 'Not that we are sufficient of ourselves to think any thing as of ourselves; but our sufficiency is of God;',
   'οὐχ ὅτι ἱκανοί ἐσμεν ἀφ᾿ ἑαυτῶν λογίσασθαί τι ὡς ἐξ ἑαυτῶν ἀλλ᾿ ἡ ἱκανότης ἡμῶν ἐκ τοῦ θεοῦ',
   'ouch hoti hikanoi esmen aph'' heautōn logisasthai ti hōs ex heautōn all'' hē hikanotēs hēmōn ek tou theou',
   '''Sufficient'' (hikanoi — competent, adequate, qualified). ''Of ourselves'' (aph'' heautōn — from ourselves; double emphasis: ''of ourselves … as of ourselves''). ''To think'' (logisasthai — to reckon, to consider; not even the capacity to reason about ministry comes from human resources). ''Our sufficiency is of God'' (hē hikanotēs hēmōn ek tou theou — our adequacy derives from God). This answers the question of 2:16 (''who is sufficient?''): no one, in themselves. All sufficiency for gospel ministry comes from God alone.',
   'This verse demolishes all self-sufficiency in ministry. Paul does not merely say he cannot ''do'' anything without God — he cannot even ''think'' anything adequate without God. The denial is radical: not even the cognitive capacity to evaluate ministry correctly comes from human resources. ''Our sufficiency is of God'' becomes the foundation for everything that follows in chapters 3-6. This principle guards against both despair (we are insufficient) and pride (God is our sufficiency).'),
  (6, 'Who also hath made us able ministers of the new testament; not of the letter, but of the spirit: for the letter killeth, but the spirit giveth life.',
   'ὃς καὶ ἱκάνωσεν ἡμᾶς διακόνους καινῆς διαθήκης οὐ γράμματος ἀλλὰ πνεύματος τὸ γὰρ γράμμα ἀποκτέννει τὸ δὲ πνεῦμα ζωοποιεῖ',
   'hos kai hikanōsen hēmas diakonous kainēs diathēkēs ou grammatos alla pneumatos to gar gramma apoktennei to de pneuma zōopoiei',
   '''Made us able'' (hikanōsen — qualified us, made us competent; from hikanos). ''Ministers'' (diakonous — servants, attendants). ''New testament'' (kainēs diathēkēs — new covenant; diathēkē is a covenant or testament, an arrangement between parties). ''Letter'' (grammatos — the written code, the external command). ''Spirit'' (pneumatos — the Holy Spirit who internalizes the law on the heart). ''The letter killeth'' (to gramma apoktennei — the written law brings death by exposing sin and pronouncing condemnation). ''The spirit giveth life'' (to pneuma zōopoiei — the Spirit produces life, imparts vitality). This is the chapter''s thesis statement.',
   'This is one of the most important verses in biblical theology. ''The letter killeth, but the spirit giveth life'' does not mean that the OT was bad or false — the old covenant was ''glorious'' (v.7). Rather, the written law without the Spirit can only expose and condemn sin; it cannot empower obedience or impart life. The new covenant accomplishes what the old could not: through the Spirit, the law is written on the heart (Jer 31:33), and what was external command becomes internal transformation. This verse refutes both legalism (the letter alone saves) and antinomianism (the law is irrelevant).'),
  (7, 'But if the ministration of death, written and engraven in stones, was glorious, so that the children of Israel could not stedfastly behold the face of Moses for the glory of his countenance; which glory was to be done away:',
   'εἰ δὲ ἡ διακονία τοῦ θανάτου ἐν γράμμασιν ἐντετυπωμένη ἐν λίθοις ἐγενήθη ἐν δόξῃ ὥστε μὴ δύνασθαι ἀτενίσαι τοὺς υἱοὺς Ἰσραὴλ εἰς τὸ πρόσωπον Μωϋσέως διὰ τὴν δόξαν τοῦ προσώπου αὐτοῦ τὴν καταργουμένην',
   'ei de hē diakonia tou thanatou en grammasin entetypōmenē en lithois egenēthē en doxē hōste mē dynasthai atenisai tous huious Israēl eis to prosōpon Mōyseōs dia tēn doxan tou prosōpou autou tēn katargoumenēn',
   '''Ministration of death'' (diakonia tou thanatou — the ministry that results in death; the law''s role in exposing sin and pronouncing death). ''Written and engraven in stones'' (en grammasin entetypōmenē en lithois — engraved in letters on stones; referring to the Sinai tablets). ''Was glorious'' (egenēthē en doxē — came with glory). ''Could not stedfastly behold'' (mē dynasthai atenisai — unable to gaze intently; cf. Exodus 34:29-35). ''Done away'' (katargoumenēn — being rendered inactive, being abolished; present participle: the fading was already in progress). The glory of Sinai was real but transient.',
   NULL),
  (8, 'How shall not the ministration of the spirit be rather glorious?',
   'πῶς οὐχὶ μᾶλλον ἡ διακονία τοῦ πνεύματος ἔσται ἐν δόξῃ',
   'pōs ouchi mallon hē diakonia tou pneumatos estai en doxē',
   '''How shall not'' (pōs ouchi — a rhetorical question expecting the emphatic answer ''of course it will!''). ''Ministration of the spirit'' (diakonia tou pneumatos — the ministry characterized by the Spirit). ''Rather glorious'' (mallon en doxē — more in glory). The argument is from lesser to greater (qal wahomer): if the ministry that kills came with glory, how much more the ministry that gives life through the Spirit.',
   NULL),
  (9, 'For if the ministration of condemnation be glory, much more doth the ministration of righteousness exceed in glory.',
   'εἰ γὰρ ἡ διακονία τῆς κατακρίσεως δόξα πολλῷ μᾶλλον περισσεύει ἡ διακονία τῆς δικαιοσύνης ἐν δόξῃ',
   'ei gar hē diakonia tēs katakriseōs doxa pollō mallon perisseuei hē diakonia tēs dikaiosynēs en doxē',
   '''Ministration of condemnation'' (diakonia tēs katakriseōs — the ministry that results in condemnation; the law''s function of pronouncing guilty verdicts). ''Ministration of righteousness'' (diakonia tēs dikaiosynēs — the ministry that results in righteousness; the gospel declares sinners righteous through faith). ''Exceed'' (perisseuei — overflows, abounds). The contrast is not merely between two historical dispensations but between two results: condemnation versus righteousness. The new covenant ''exceeds'' — the glory is not merely different but categorically greater.',
   NULL),
  (10, 'For even that which was made glorious had no glory in this respect, by reason of the glory that excelleth.',
   'καὶ γὰρ οὐ δεδόξασται τὸ δεδοξασμένον ἐν τούτῳ τῷ μέρει ἕνεκεν τῆς ὑπερβαλλούσης δόξης',
   'kai gar ou dedoxastai to dedoxasmenon en toutō tō merei heneken tēs hyperballousēs doxēs',
   '''Had no glory'' (ou dedoxastai to dedoxasmenon — what had been glorified has actually not been glorified; a paradox). ''In this respect'' (en toutō tō merei — in this comparison). ''The glory that excelleth'' (tēs hyperballousēs doxēs — the surpassing glory; hyperballō means to throw beyond, to surpass all measure). Like a candle beside the sun: the candle truly has light, but in comparison to the sun its light ceases to register. The old covenant glory was real but is now eclipsed by the incomparably greater glory of the new.',
   NULL),
  (11, 'For if that which is done away was glorious, much more that which remaineth is glorious.',
   'εἰ γὰρ τὸ καταργούμενον διὰ δόξης πολλῷ μᾶλλον τὸ μένον ἐν δόξῃ',
   'ei gar to katargoumenon dia doxēs pollō mallon to menon en doxē',
   '''Done away'' (katargoumenon — being rendered inactive, being set aside; the old covenant system is in the process of passing away). ''Through glory'' (dia doxēs — it came accompanied by glory). ''Remaineth'' (menon — abides, endures permanently; present participle: the new covenant keeps on remaining). ''Much more … in glory'' (pollō mallon en doxē — how much more is the permanent in glory). Three contrasts established: death vs. Spirit (v.7-8), condemnation vs. righteousness (v.9), fading vs. permanent (v.11).',
   NULL),
  (12, 'Seeing then that we have such hope, we use great plainness of speech:',
   'ἔχοντες οὖν τοιαύτην ἐλπίδα πολλῇ παρρησίᾳ χρώμεθα',
   'echontes oun toiautēn elpida pollē parrēsia chrōmetha',
   '''Such hope'' (toiautēn elpida — such a quality of hope; the hope grounded in the surpassing, permanent glory of the new covenant). ''Great plainness of speech'' (pollē parrēsia — much boldness, frank openness; parrēsia from pan + rhēsis, all-speech: saying everything, holding nothing back). The surpassing glory of the new covenant produces bold, transparent communication — no veiling, no hiding, no coded language.',
   NULL),
  (13, 'And not as Moses, which put a vail over his face, that the children of Israel could not stedfastly look to the end of that which is abolished:',
   'καὶ οὐ καθάπερ Μωϋσῆς ἐτίθει κάλυμμα ἐπὶ τὸ πρόσωπον ἑαυτοῦ πρὸς τὸ μὴ ἀτενίσαι τοὺς υἱοὺς Ἰσραὴλ εἰς τὸ τέλος τοῦ καταργουμένου',
   'kai ou kathaper Mōysēs etithei kalymma epi to prosōpon heautou pros to mē atenisai tous huious Israēl eis to telos tou katargoumenou',
   '''Vail'' (kalymma — a covering, a veil). ''The end of that which is abolished'' (to telos tou katargoumenou — the termination point of what was fading away). Paul offers a remarkable interpretation of Exodus 34:33-35: Moses veiled his face not merely because the glory was too bright, but so that Israel would not see the glory fading. The veil concealed the transitory nature of the old covenant glory. This is Paul''s midrashic insight: the veil was not just protective but concealing.',
   'Paul''s reading of the Moses narrative adds a dimension not explicit in Exodus: the veil served to hide the fading of the glory. This interpretive move is theologically significant — the old covenant, by design, concealed its own temporary nature. Israel saw the glory but not its termination. Paul uses this to explain Israel''s continuing inability to see that the old covenant has been superseded: the veil that hid the fading glory from Moses'' generation now hides Christ from subsequent generations who read Moses without seeing his fulfilment in Christ.'),
  (14, 'But their minds were blinded: for until this day remaineth the same vail untaken away in the reading of the old testament; which vail is done away in Christ.',
   'ἀλλ᾿ ἐπωρώθη τὰ νοήματα αὐτῶν ἄχρι γὰρ τῆς σήμερον ἡμέρας τὸ αὐτὸ κάλυμμα ἐπὶ τῇ ἀναγνώσει τῆς παλαιᾶς διαθήκης μένει μὴ ἀνακαλυπτόμενον ὅτι ἐν Χριστῷ καταργεῖται',
   'all'' epōrōthē ta noēmata autōn achri gar tēs sēmeron hēmeras to auto kalymma epi tē anagnōsei tēs palaias diathēkēs menei mē anakalyptomenon hoti en Christō katargeitai',
   '''Minds were blinded'' (epōrōthē ta noēmata — their thoughts were hardened, petrified; from pōroō, to make stone-like, to calcify). ''Until this day'' (achri tēs sēmeron hēmeras — right up to today). ''The same vail'' — the veil that was on Moses'' face is now on Israel''s minds. ''In the reading of the old testament'' (epi tē anagnōsei tēs palaias diathēkēs — during the public reading of the old covenant scriptures; this is the earliest use of ''old testament'' as a literary designation). ''Done away in Christ'' (en Christō katargeitai — is being abolished in Christ). The veil is removed not by intellectual effort but by Christ.',
   'This verse contains one of the most significant statements in biblical hermeneutics: the ''old testament'' (palaia diathēkē — old covenant) can only be properly understood ''in Christ.'' Without Christ, a veil remains over the text. This does not mean the OT is incomprehensible to non-Christians, but that its deepest meaning — its christological fulfilment — remains hidden. The hardening (epōrōthē) echoes Romans 11:7-25, where Israel''s partial hardening serves God''s larger redemptive plan.'),
  (15, 'But even unto this day, when Moses is read, the vail is upon their heart.',
   'ἀλλ᾿ ἕως σήμερον ἡνίκα ἀναγινώσκεται Μωϋσῆς κάλυμμα ἐπὶ τὴν καρδίαν αὐτῶν κεῖται',
   'all'' heōs sēmeron hēnika anaginōsketai Mōysēs kalymma epi tēn kardian autōn keitai',
   '''When Moses is read'' (hēnika anaginōsketai Mōysēs — whenever Moses is read aloud; referring to the synagogue reading of the Torah). ''The vail is upon their heart'' (kalymma epi tēn kardian keitai — a covering lies upon their heart). The location has shifted: in Exodus, the veil was on Moses'' face; now it is on Israel''s heart. The problem is no longer external (physical brightness) but internal (spiritual blindness). The heart, not the intellect, is the organ of spiritual perception.',
   NULL),
  (16, 'Nevertheless when it shall turn to the Lord, the vail shall be taken away.',
   'ἡνίκα δ᾿ ἂν ἐπιστρέψῃ πρὸς κύριον περιαιρεῖται τὸ κάλυμμα',
   'hēnika d'' an epistrepsē pros kyrion periaireitai to kalymma',
   '''Turn to the Lord'' (epistrepsē pros kyrion — turn toward the Lord; conversion, turning around). ''Taken away'' (periaireitai — removed all around, stripped off; present tense: as soon as the turning happens, the veil is removed). Paul echoes Exodus 34:34: whenever Moses entered the Lord''s presence, he removed the veil. The application: whenever anyone turns to the Lord (Christ), the veil is removed from the heart. Conversion and unveiled understanding are simultaneous.',
   NULL),
  (17, 'Now the Lord is that Spirit: and where the Spirit of the Lord is, there is liberty.',
   'ὁ δὲ κύριος τὸ πνεῦμά ἐστιν οὗ δὲ τὸ πνεῦμα κυρίου ἐλευθερία',
   'ho de kyrios to pneuma estin hou de to pneuma kyriou eleutheria',
   '''The Lord is that Spirit'' (ho kyrios to pneuma estin — the Lord is the Spirit). This does not conflate the second and third Persons of the Trinity but identifies the risen Christ with the Spirit in terms of experiential access: to encounter the Lord in new covenant reality is to encounter him through the Spirit. ''Liberty'' (eleutheria — freedom). The Spirit''s presence brings freedom — freedom from the veil, from the letter that kills, from condemnation, from the inability to see Christ in Scripture.',
   'This verse, along with v.18, is one of the most theologically significant in the NT for understanding the relationship between Christ and the Spirit. ''The Lord is that Spirit'' does not teach modalism (that Christ and the Spirit are the same Person) but rather functional equivalence in experience: in the new covenant, access to the Lord comes through the Spirit. Where the Spirit operates, there is the Lord; where the Lord is encountered, there the Spirit is at work. The ''liberty'' (eleutheria) is comprehensive: freedom from condemnation (law), from blindness (veil), and from the old order (letter).'),
  (18, 'But we all, with open face beholding as in a glass the glory of the Lord, are changed into the same image from glory to glory, even as by the Spirit of the Lord.',
   'ἡμεῖς δὲ πάντες ἀνακεκαλυμμένῳ προσώπῳ τὴν δόξαν κυρίου κατοπτριζόμενοι τὴν αὐτὴν εἰκόνα μεταμορφούμεθα ἀπὸ δόξης εἰς δόξαν καθάπερ ἀπὸ κυρίου πνεύματος',
   'hēmeis de pantes anakekalymmenō prosōpō tēn doxan kyriou katoptrizomenoi tēn autēn eikona metamorphoumetha apo doxēs eis doxan kathaper apo kyriou pneumatos',
   '''We all'' (hēmeis pantes — all believers, not just apostles; in contrast to Moses alone). ''Open face'' (anakekalymmenō prosōpō — unveiled face; the veil has been removed). ''Beholding as in a glass'' (katoptrizomenoi — gazing at as in a mirror, or reflecting as a mirror does; the word allows both ''beholding'' and ''reflecting''). ''Changed'' (metamorphoumetha — being transformed, being metamorphosed; present passive: ongoing transformation by God''s action). ''Same image'' (tēn autēn eikona — the very image of the Lord; we are being transformed into Christ''s likeness). ''From glory to glory'' (apo doxēs eis doxan — from one degree of glory to another; incremental, progressive transformation). ''By the Spirit of the Lord'' (apo kyriou pneumatos — from the Lord who is the Spirit).',
   'This verse is the climax of the chapter and one of the most important statements on sanctification in the NT. Several truths converge: (1) All believers (not just Moses) have unveiled access to God''s glory. (2) By beholding the glory of Christ, we are progressively transformed into his image. (3) The transformation is ''from glory to glory'' — it is gradual and incremental, not instantaneous. (4) The agent of transformation is ''the Spirit of the Lord'' — this is not self-improvement but divine metamorphosis. (5) The goal is conformity to Christ''s image (eikōn) — the same word used in Genesis 1:26 for humanity created in God''s image. Sanctification is the restoration of the image of God in the believer through the Spirit''s work of progressively revealing Christ''s glory.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 3;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 epistle of Christ
  ('πλάξ', 'plax', 'G4109', 'Tablet, flat surface for writing — used of the stone tablets of the law (Exod 31:18) and of the ''fleshy tablets of the heart'' (2 Cor 3:3). The contrast between stone and flesh encapsulates the old-to-new covenant transition: external commandment yields to internal transformation by the Spirit.', 1),
  -- v.6 letter / spirit
  ('γράμμα', 'gramma', 'G1121', 'Letter, written character, the written code — the external written law considered apart from the Spirit who gives it life. The gramma is not evil in itself (the law is ''holy, just, and good,'' Rom 7:12) but without the Spirit it can only expose sin and pronounce death. The letter without the Spirit kills; the Spirit without the letter gives life.', 2),
  ('διαθήκη', 'diathēkē', 'G1242', 'Covenant, testament, arrangement — from diatithēmi (to arrange, to dispose). In secular Greek, a last will and testament; in the LXX, translating Hebrew berith (covenant). Paul contrasts the old (palaia) covenant of Sinai with the new (kainē) covenant of the Spirit, following Jeremiah 31:31-34.', 3),
  -- v.7 done away
  ('καταργέω', 'katargeō', 'G2673', 'To render inactive, to abolish, to set aside — from kata (down) + argeō (to be idle). Used repeatedly in this chapter (vv.7, 11, 13, 14) for the fading/superseding of the old covenant glory. The old covenant is not destroyed but fulfilled and superseded; its glory fades as the greater glory of the new covenant shines.', 4),
  -- v.12 boldness
  ('παρρησία', 'parrēsia', 'G3954', 'Boldness, openness, frankness of speech — from pan (all) + rhēsis (speech): saying everything openly. In contrast to Moses who veiled himself, new covenant ministers speak with unveiled boldness. Parrēsia characterizes both the minister''s preaching and the believer''s access to God (Heb 4:16).', 5),
  -- v.17 liberty
  ('ἐλευθερία', 'eleutheria', 'G1657', 'Freedom, liberty — freedom from slavery, from the law''s condemnation, and from the veil of spiritual blindness. The Spirit''s presence produces freedom: freedom to see Christ in Scripture, freedom from the killing letter, freedom to approach God without a veil. This is not libertinism but the freedom of sons vs. the bondage of slaves (Gal 4:21-31).', 6),
  -- v.18 transformed
  ('μεταμορφόω', 'metamorphoō', 'G3339', 'To transform, to transfigure, to change form — from meta (change) + morphē (form). Used of Christ''s transfiguration (Matt 17:2) and of the believer''s renewal (Rom 12:2). Here in the passive present: believers are being continuously transformed by God''s action. The morphē is the essential form, not a superficial change but a deep, structural transformation of character into Christ''s image.', 7),
  ('εἰκών', 'eikōn', 'G1504', 'Image, likeness, representation — a visible manifestation of the invisible. Christ is the eikōn of God (2 Cor 4:4, Col 1:15); believers are being transformed into the eikōn of Christ. This echoes Genesis 1:26-27: humanity was created in God''s image; sin marred it; sanctification restores it. The goal of the Christian life is conformity to the image of Christ.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 3
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 6 WHEN 3 THEN 6
    WHEN 4 THEN 7
    WHEN 5 THEN 12
    WHEN 6 THEN 17
    WHEN 7 THEN 18 WHEN 8 THEN 18
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 tablets of stone / heart
  (3, 'Exodus 31:18', 1),
  (3, 'Jeremiah 31:33', 2),
  (3, 'Ezekiel 36:26', 3),
  -- v.5 sufficiency of God
  (5, '2 Corinthians 2:16', 4),
  (5, 'Philippians 2:13', 5),
  -- v.6 new covenant / letter kills
  (6, 'Jeremiah 31:31-34', 6),
  (6, 'Romans 7:6', 7),
  (6, 'Hebrews 8:6-13', 8),
  -- v.7 glory of Moses' face
  (7, 'Exodus 34:29-35', 9),
  (7, 'Deuteronomy 10:1-5', 10),
  -- v.9 condemnation vs righteousness
  (9, 'Romans 3:21-22', 11),
  (9, 'Romans 8:1', 12),
  -- v.13 Moses' veil
  (13, 'Exodus 34:33-35', 13),
  -- v.14 minds blinded
  (14, 'Romans 11:7-10', 14),
  (14, 'Isaiah 6:9-10', 15),
  (14, '2 Corinthians 4:3-4', 16),
  -- v.16 turn to the Lord
  (16, 'Exodus 34:34', 17),
  (16, 'Romans 11:23-26', 18),
  -- v.17 the Lord is the Spirit / liberty
  (17, 'John 4:24', 19),
  (17, 'Galatians 5:1', 20),
  (17, 'Romans 8:2', 21),
  -- v.18 changed from glory to glory
  (18, 'Romans 8:29', 22),
  (18, 'Romans 12:2', 23),
  (18, '1 John 3:2', 24),
  (18, 'Colossians 3:10', 25)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 3
  AND v.verse_number = cr.verse_number;
