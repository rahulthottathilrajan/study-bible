-- ═══════════════════════════════════════════════════
-- GALATIANS CHAPTER 2 — Justified by Faith, Not by Works of the Law
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'Galatians 2 continues Paul''s autobiographical defence. Fourteen years after his conversion, he went to Jerusalem with Barnabas and Titus and privately presented his gospel to the ''pillars'' — James, Peter, and John (vv.1-2). Crucially, Titus, a Greek, was not compelled to be circumcised (v.3). False brethren had infiltrated to spy out the liberty believers have in Christ and ''bring us into bondage'' (v.4), but Paul yielded to them ''no, not for an hour'' (v.5). The Jerusalem leaders ''added nothing'' to Paul''s gospel (v.6) and recognised his apostleship to the Gentiles as parallel to Peter''s to the Jews (vv.7-9). Paul then narrates the Antioch incident: when Peter came to Antioch and ate with Gentiles, he later withdrew under pressure from the circumcision party, and even Barnabas was carried away (vv.11-13). Paul rebuked Peter publicly because his behaviour was ''not straightforward according to the truth of the gospel'' (v.14). The chapter climaxes with the doctrinal declaration: ''a man is not justified by the works of the law, but by the faith of Jesus Christ'' (v.16). Paul''s personal testimony: ''I am crucified with Christ: nevertheless I live; yet not I, but Christ liveth in me'' (v.20). If righteousness came by the law, ''then Christ is dead in vain'' (v.21).',
  'The Gospel Confirmed and Justification by Faith Declared',
  'δικαιοῦται (dikaioutai)',
  'Is justified, is declared righteous — from dikaioō, to pronounce righteous, to acquit. A legal term: God the Judge declares the believing sinner righteous, not on the basis of works done but on the basis of faith in Christ. This is the heart of Paul''s argument against the Judaizers.',
  '["Paul''s Gospel Confirmed in Jerusalem (vv.1-5): Then fourteen years after I went up again to Jerusalem with Barnabas and took Titus with me also; I went up by revelation and communicated unto them that gospel which I preach among the Gentiles; Titus who was with me being a Greek was not compelled to be circumcised; because of false brethren who came in privily to spy out our liberty which we have in Christ Jesus that they might bring us into bondage; to whom we gave place by subjection no not for an hour","The Pillars Add Nothing — Right Hand of Fellowship (vv.6-10): But of these who seemed to be somewhat whatsoever they were it maketh no matter to me God accepteth no man''s person for they who seemed to be somewhat in conference added nothing to me; but contrariwise when they saw that the gospel of the uncircumcision was committed unto me; and when James Cephas and John who seemed to be pillars perceived the grace that was given unto me they gave to me and Barnabas the right hands of fellowship; only they would that we should remember the poor","Paul Rebukes Peter at Antioch (vv.11-14): But when Peter was come to Antioch I withstood him to the face because he was to be blamed; for before that certain came from James he did eat with the Gentiles; but when they were come he withdrew and separated himself fearing them which were of the circumcision; and the other Jews dissembled likewise with him; but when I saw that they walked not uprightly according to the truth of the gospel I said unto Peter before them all","Justified by Faith Not by Law (vv.15-21): We who are Jews by nature and not sinners of the Gentiles knowing that a man is not justified by the works of the law but by the faith of Jesus Christ; for by the works of the law shall no flesh be justified; I through the law am dead to the law that I might live unto God; I am crucified with Christ nevertheless I live yet not I but Christ liveth in me; I do not frustrate the grace of God for if righteousness come by the law then Christ is dead in vain"]'
FROM books b WHERE b.name = 'Galatians';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Then fourteen years after I went up again to Jerusalem with Barnabas, and took Titus with me also.',
   'Ἔπειτα διὰ δεκατεσσάρων ἐτῶν πάλιν ἀνέβην εἰς Ἱεροσόλυμα μετὰ Βαρνάβα συμπαραλαβὼν καὶ Τίτον',
   'Epeita dia dekatessarōn etōn palin anebēn eis Hierosolyma meta Barnaba symparalabōn kai Titon',
   '''Fourteen years after'' (dia dekatessarōn etōn — after fourteen years; either from his conversion or from his first Jerusalem visit). ''Barnabas'' — his ministry partner. ''Titus'' — a Greek (Gentile) convert who becomes a test case. His presence is deliberate: will the Jerusalem leaders require circumcision of a Gentile believer? The answer will prove the nature of the gospel.',
   NULL),
  (2,
   'And I went up by revelation, and communicated unto them that gospel which I preach among the Gentiles, but privately to them which were of reputation, lest by any means I should run, or had run, in vain.',
   'ἀνέβην δὲ κατὰ ἀποκάλυψιν καὶ ἀνεθέμην αὐτοῖς τὸ εὐαγγέλιον ὃ κηρύσσω ἐν τοῖς ἔθνεσιν κατ᾽ ἰδίαν δὲ τοῖς δοκοῦσιν μή πως εἰς κενὸν τρέχω ἢ ἔδραμον',
   'anebēn de kata apokalypsin kai anethemēn autois to euangelion ho kēryssō en tois ethnesin kat'' idian de tois dokousin mē pōs eis kenon trechō ē edramon',
   '''By revelation'' (kata apokalypsin — according to a revelation; God directed this visit). ''Communicated'' (anethemēn — laid before, set forth for consideration). ''Privately'' (kat'' idian — in private). ''Of reputation'' (tois dokousin — those who seemed to be something, the recognized leaders). ''In vain'' (eis kenon — to no purpose). Paul was not seeking approval but strategic unity: a public split between himself and the Jerusalem leaders would have been exploited by the Judaizers.',
   NULL),
  (3,
   'But neither Titus, who was with me, being a Greek, was compelled to be circumcised:',
   'ἀλλ᾽ οὐδὲ Τίτος ὁ σὺν ἐμοί Ἕλλην ὢν ἠναγκάσθη περιτμηθῆναι',
   'all'' oude Titos ho syn emoi Hellēn ōn ēnagkasthē peritēthēnai',
   '''Titus'' — the crucial test case. ''Greek'' (Hellēn — a Gentile). ''Compelled'' (ēnagkasthē — was forced, was compelled; aorist passive: he was not forced). The Jerusalem leaders did not require Titus to be circumcised. This proves that the pillars agreed with Paul: circumcision is not necessary for salvation. The Judaizers'' position was rejected by the very authorities they claimed to represent.',
   NULL),
  (4,
   'And that because of false brethren unawares brought in, who came in privily to spy out our liberty which we have in Christ Jesus, that they might bring us into bondage:',
   'διὰ δὲ τοὺς παρεισάκτους ψευδαδέλφους οἵτινες παρεισῆλθον κατασκοπῆσαι τὴν ἐλευθερίαν ἡμῶν ἣν ἔχομεν ἐν Χριστῷ Ἰησοῦ ἵνα ἡμᾶς καταδουλώσουσιν',
   'dia de tous pareisaktous pseudadelphous hoitines pareisēlthon kataskopēsai tēn eleutherian hēmōn hēn echomen en Christō Iēsou hina hēmas katadoulōsousin',
   '''False brethren'' (pseudadelphous — fake brothers, pretend believers). ''Brought in'' (pareisaktous — smuggled in, secretly introduced; from para + eisagō). ''Spy out'' (kataskopēsai — to reconnoitre as a spy, to scope out with hostile intent). ''Liberty'' (eleutherian — freedom; the freedom from the law that believers have in Christ). ''Bring into bondage'' (katadoulōsousin — to enslave completely, to reduce to slavery; kata intensifies). The Judaizers were infiltrators whose goal was to strip believers of their freedom in Christ and re-enslave them to the law.',
   NULL),
  (5,
   'To whom we gave place by subjection, no, not for an hour; that the truth of the gospel might continue with you.',
   'οἷς οὐδὲ πρὸς ὥραν εἴξαμεν τῇ ὑποταγῇ ἵνα ἡ ἀλήθεια τοῦ εὐαγγελίου διαμείνῃ πρὸς ὑμᾶς',
   'hois oude pros hōran eixamen tē hypotagē hina hē alētheia tou euangeliou diameinē pros hymas',
   '''Not for an hour'' (oude pros hōran — not even for a single hour). ''Gave place'' (eixamen — yielded, submitted). ''That the truth of the gospel might continue'' (hina hē alētheia tou euangeliou diameinē — so that the truth of the gospel might remain permanently). Paul refused to yield even momentarily. The slightest concession to the Judaizers would have compromised the gospel for all future believers. Paul''s stubbornness was not personality but principle.',
   NULL),
  (6,
   'But of these who seemed to be somewhat, (whatsoever they were, it maketh no matter to me: God accepteth no man''s person:) for they who seemed to be somewhat in conference added nothing to me:',
   'ἀπὸ δὲ τῶν δοκούντων εἶναί τι ὁποῖοί ποτε ἦσαν οὐδέν μοι διαφέρει πρόσωπον θεὸς ἀνθρώπου οὐ λαμβάνει ἐμοὶ γὰρ οἱ δοκοῦντες οὐδὲν προσανέθεντο',
   'apo de tōn dokountōn einai ti hopoioi pote ēsan ouden moi diapherei prosōpon theos anthrōpou ou lambanei emoi gar hoi dokountes ouden prosanethento',
   '''Seemed to be somewhat'' (tōn dokountōn einai ti — those reputed to be something). ''God accepteth no man''s person'' (prosōpon theos anthrōpou ou lambanei — God does not receive the face of man, i.e., God is not impressed by status or reputation). ''Added nothing'' (ouden prosanethento — contributed nothing additional, laid nothing extra on me). The Jerusalem pillars found nothing lacking in Paul''s gospel. They did not supplement, correct, or modify it. Paul''s gospel was complete as received from Christ.',
   NULL),
  (7,
   'But contrariwise, when they saw that the gospel of the uncircumcision was committed unto me, as the gospel of the circumcision was unto Peter;',
   'ἀλλὰ τοὐναντίον ἰδόντες ὅτι πεπίστευμαι τὸ εὐαγγέλιον τῆς ἀκροβυστίας καθὼς Πέτρος τῆς περιτομῆς',
   'alla tounantion idontes hoti pepisteumai to euangelion tēs akrobystias kathōs Petros tēs peritomēs',
   '''Contrariwise'' (tounantion — on the contrary, the opposite). ''Gospel of the uncircumcision'' (to euangelion tēs akrobystias — the gospel directed to the uncircumcised, the Gentile mission). ''Gospel of the circumcision'' (tēs peritomēs — the Jewish mission). Not two different gospels but the same gospel directed to two different audiences. Paul''s commission to the Gentiles was recognized as parallel and equal to Peter''s commission to the Jews.',
   NULL),
  (8,
   '(For he that wrought effectually in Peter to the apostleship of the circumcision, the same was mighty in me toward the Gentiles:)',
   'ὁ γὰρ ἐνεργήσας Πέτρῳ εἰς ἀποστολὴν τῆς περιτομῆς ἐνήργησεν καὶ ἐμοὶ εἰς τὰ ἔθνη',
   'ho gar energēsas Petrō eis apostolēn tēs peritomēs enērgēsen kai emoi eis ta ethnē',
   '''Wrought effectually'' (energēsas — worked powerfully, was at work; from energeō). The same God who empowered Peter''s ministry to the Jews was the one who empowered Paul''s ministry to the Gentiles. The proof of Paul''s apostleship was the same proof of Peter''s: God''s observable, effective working.',
   NULL),
  (9,
   'And when James, Cephas, and John, who seemed to be pillars, perceived the grace that was given unto me, they gave to me and Barnabas the right hands of fellowship; that we should go unto the heathen, and they unto the circumcision.',
   'καὶ γνόντες τὴν χάριν τὴν δοθεῖσάν μοι Ἰάκωβος καὶ Κηφᾶς καὶ Ἰωάννης οἱ δοκοῦντες στύλοι εἶναι δεξιὰς ἔδωκαν ἐμοὶ καὶ Βαρνάβᾳ κοινωνίας ἵνα ἡμεῖς εἰς τὰ ἔθνη αὐτοὶ δὲ εἰς τὴν περιτομήν',
   'kai gnontes tēn charin tēn dotheisan moi Iakōbos kai Kēphas kai Iōannēs hoi dokountes styloi einai dexias edōkan emoi kai Barnaba koinōnias hina hēmeis eis ta ethnē autoi de eis tēn peritomēn',
   '''Pillars'' (styloi — pillars, columns; the load-bearing supports of the church). ''Perceived the grace'' (gnontes tēn charin — having recognised, having discerned the grace). ''Right hands of fellowship'' (dexias koinōnias — right hands of partnership; a formal gesture of agreement and mutual recognition). James, Peter, and John — the three recognised leaders — formally endorsed Paul''s Gentile mission. The handshake was public and binding.',
   NULL),
  (10,
   'Only they would that we should remember the poor; the same which I also was forward to do.',
   'μόνον τῶν πτωχῶν ἵνα μνημονεύωμεν ὃ καὶ ἐσπούδασα αὐτὸ τοῦτο ποιῆσαι',
   'monon tōn ptōchōn hina mnēmoneuōmen ho kai espoudasa auto touto poiēsai',
   '''Remember the poor'' (tōn ptōchōn mnēmoneuōmen — keep remembering the destitute). ''Was forward'' (espoudasa — was eager, made it my priority). The only ''addition'' from Jerusalem: care for the poor — specifically the impoverished believers in Jerusalem. This was not a doctrinal addition but a practical request, and Paul was already eager to do it (cf. the collection in 1 Cor 16:1-4; 2 Cor 8-9; Rom 15:25-27).',
   NULL),
  (11,
   'But when Peter was come to Antioch, I withstood him to the face, because he was to be blamed.',
   'Ὅτε δὲ ἦλθεν Πέτρος εἰς Ἀντιόχειαν κατὰ πρόσωπον αὐτῷ ἀντέστην ὅτι κατεγνωσμένος ἦν',
   'Hote de ēlthen Petros eis Antiocheian kata prosōpon autō antestēn hoti kategnōsmenos ēn',
   '''Withstood him to the face'' (kata prosōpon autō antestēn — I opposed him face-to-face, publicly, directly). ''To be blamed'' (kategnōsmenos ēn — he stood condemned, he was self-condemned by his own behaviour; perfect passive: his actions had already condemned him). Paul confronted the chief apostle publicly because the truth of the gospel was at stake. This incident proves Paul''s independence from Peter — he was Peter''s equal, not his subordinate.',
   NULL),
  (12,
   'For before that certain came from James, he did eat with the Gentiles: but when they were come, he withdrew and separated himself, fearing them which were of the circumcision.',
   'πρὸ τοῦ γὰρ ἐλθεῖν τινας ἀπὸ Ἰακώβου μετὰ τῶν ἐθνῶν συνήσθιεν ὅτε δὲ ἦλθον ὑπέστελλεν καὶ ἀφώριζεν ἑαυτόν φοβούμενος τοὺς ἐκ περιτομῆς',
   'pro tou gar elthein tinas apo Iakōbou meta tōn ethnōn synēsthien hote de ēlthon hypestellen kai aphōrizen heauton phoboumenos tous ek peritomēs',
   '''Eat with the Gentiles'' (meta tōn ethnōn synēsthien — was eating with, sharing meals; imperfect: he kept doing it freely). ''Withdrew'' (hypestellen — began to shrink back, to retreat; imperfect: gradual withdrawal). ''Separated himself'' (aphōrizen heauton — was drawing boundaries, excluding himself). ''Fearing'' (phoboumenos — being afraid of). Peter knew that in Christ there was no distinction between Jew and Gentile (Acts 10-11). But when the circumcision party arrived, fear of criticism overpowered his theology. His practice contradicted his preaching.',
   NULL),
  (13,
   'And the other Jews dissembled likewise with him; insomuch that Barnabas also was carried away with their dissimulation.',
   'καὶ συνυπεκρίθησαν αὐτῷ καὶ οἱ λοιποὶ Ἰουδαῖοι ὥστε καὶ Βαρνάβας συναπήχθη αὐτῶν τῇ ὑποκρίσει',
   'kai synypekrithēsan autō kai hoi loipoi Ioudaioi hōste kai Barnabas synapēchthē autōn tē hypokrisei',
   '''Dissembled'' (synypekrithēsan — played the hypocrite along with him; from syn + hypokrinomai, to act a part together). ''Dissimulation'' (hypokrisei — hypocrisy, play-acting). ''Carried away'' (synapēchthē — was swept along, was led astray). Even Barnabas — Paul''s faithful partner — was swept into the hypocrisy. Peter''s influence was enormous, and his withdrawal gave permission for others to follow. The danger of a leader''s inconsistency cannot be overstated.',
   NULL),
  (14,
   'But when I saw that they walked not uprightly according to the truth of the gospel, I said unto Peter before them all, If thou, being a Jew, livest after the manner of Gentiles, and not as do the Jews, why compellest thou the Gentiles to live as do the Jews?',
   'ἀλλ᾽ ὅτε εἶδον ὅτι οὐκ ὀρθοποδοῦσιν πρὸς τὴν ἀλήθειαν τοῦ εὐαγγελίου εἶπον τῷ Πέτρῳ ἔμπροσθεν πάντων Εἰ σὺ Ἰουδαῖος ὑπάρχων ἐθνικῶς ζῇς καὶ οὐκ Ἰουδαϊκῶς πῶς τὰ ἔθνη ἀναγκάζεις Ἰουδαΐζειν',
   'all'' hote eidon hoti ouk orthopodousin pros tēn alētheian tou euangeliou eipon tō Petrō emprosthen pantōn Ei sy Ioudaios hyparchōn ethnikōs zēs kai ouk Ioudaikōs pōs ta ethnē anagkazeis Ioudaizein',
   '''Walked not uprightly'' (ouk orthopodousin — were not walking straight, were not walking on a straight path toward; from orthos, straight + pous, foot; used only here in the NT). ''Truth of the gospel'' (tēn alētheian tou euangeliou — the standard is the gospel itself). ''Before them all'' (emprosthen pantōn — publicly, in front of everyone). Paul''s argument: Peter, you yourself live like a Gentile (you ate with them!), so why are you now compelling Gentiles to live like Jews by your withdrawal? Your actions preach law, while your convictions preach grace.',
   NULL),
  (15,
   'We who are Jews by nature, and not sinners of the Gentiles,',
   'Ἡμεῖς φύσει Ἰουδαῖοι καὶ οὐκ ἐξ ἐθνῶν ἁμαρτωλοί',
   'Hēmeis physei Ioudaioi kai ouk ex ethnōn hamartōloi',
   '''Jews by nature'' (physei Ioudaioi — born Jewish, Jewish by birth). ''Sinners of the Gentiles'' (ex ethnōn hamartōloi — sinners from among the Gentiles; a phrase reflecting the Jewish view of Gentiles as inherently outside the covenant). Paul begins his doctrinal argument by adopting the Jewish perspective: even we who have every Jewish advantage ...',
   NULL),
  (16,
   'Knowing that a man is not justified by the works of the law, but by the faith of Jesus Christ, even we have believed in Jesus Christ, that we might be justified by the faith of Christ, and not by the works of the law: for by the works of the law shall no flesh be justified.',
   'εἰδότες ὅτι οὐ δικαιοῦται ἄνθρωπος ἐξ ἔργων νόμου ἐὰν μὴ διὰ πίστεως Ἰησοῦ Χριστοῦ καὶ ἡμεῖς εἰς Χριστὸν Ἰησοῦν ἐπιστεύσαμεν ἵνα δικαιωθῶμεν ἐκ πίστεως Χριστοῦ καὶ οὐκ ἐξ ἔργων νόμου διότι ἐξ ἔργων νόμου οὐ δικαιωθήσεται πᾶσα σάρξ',
   'eidotes hoti ou dikaioutai anthrōpos ex ergōn nomou ean mē dia pisteōs Iēsou Christou kai hēmeis eis Christon Iēsoun episteusamen hina dikaiōthōmen ek pisteōs Christou kai ouk ex ergōn nomou dioti ex ergōn nomou ou dikaiōthēsetai pasa sarx',
   '''Justified'' (dikaioutai — is declared righteous; present passive: a person is not being justified by law-works). ''Works of the law'' (ergōn nomou — deeds required by the Mosaic law). ''Faith of Jesus Christ'' (pisteōs Iēsou Christou — faith in Jesus Christ; or ''the faithfulness of Jesus Christ''). ''No flesh'' (pasa sarx — all flesh, i.e., no human being). Three times in one verse Paul states the same truth: justification is by faith in Christ, not by works of the law. The triple repetition is deliberate and emphatic.',
   'Justification by faith: This is the central doctrine of Galatians and the Reformation. Three assertions: (1) no person is justified by works of the law, (2) we believed in Christ in order to be justified by faith, (3) by works of the law no flesh will be justified. Justification is God''s legal declaration that the sinner is righteous — based not on the sinner''s obedience but on Christ''s righteousness received by faith. This is the doctrine the Judaizers were undermining.'),
  (17,
   'But if, while we seek to be justified by Christ, we ourselves also are found sinners, is therefore Christ the minister of sin? God forbid.',
   'εἰ δὲ ζητοῦντες δικαιωθῆναι ἐν Χριστῷ εὑρέθημεν καὶ αὐτοὶ ἁμαρτωλοί ἆρα Χριστὸς ἁμαρτίας διάκονος μὴ γένοιτο',
   'ei de zētountes dikaiōthēnai en Christō heurethēmen kai autoi hamartōloi ara Christos hamartias diakonos mē genoito',
   '''Found sinners'' (heurethēmen hamartōloi — we were discovered to be sinners; the Judaizers argued that abandoning the law makes people sinners). ''Minister of sin'' (hamartias diakonos — a servant of sin). ''God forbid'' (mē genoito — may it never be! the strongest Greek denial). Paul anticipates the objection: if justification by faith means we don''t keep the law, does that make Christ an agent of sin? Absolutely not! The law itself was unable to justify; Christ provides what the law could not.',
   NULL),
  (18,
   'For if I build again the things which I destroyed, I make myself a transgressor.',
   'εἰ γὰρ ἃ κατέλυσα ταῦτα πάλιν οἰκοδομῶ παραβάτην ἐμαυτὸν συνιστάνω',
   'ei gar ha katelysa tauta palin oikodomō parabatēn emauton synistanō',
   '''Build again'' (palin oikodomō — rebuild, reconstruct). ''Destroyed'' (katelysa — demolished, tore down). ''Transgressor'' (parabatēn — lawbreaker, violator). If Paul (or Peter) returns to the law-system for justification after having abandoned it for faith in Christ, he proves himself a transgressor — not because he left the law, but because going back to the law means the law still condemns him.',
   NULL),
  (19,
   'For I through the law am dead to the law, that I might live unto God.',
   'ἐγὼ γὰρ διὰ νόμου νόμῳ ἀπέθανον ἵνα θεῷ ζήσω',
   'egō gar dia nomou nomō apethanon hina theō zēsō',
   '''Through the law'' (dia nomou — by means of the law). ''Dead to the law'' (nomō apethanon — I died to the law). The law itself led Paul to death — the law''s curse fell on Christ, and because Paul is united with Christ, he died with Christ to the law''s jurisdiction. A dead person is no longer under the law''s authority. The purpose: ''that I might live unto God'' (hina theō zēsō) — death to the law is the doorway to life for God.',
   NULL),
  (20,
   'I am crucified with Christ: nevertheless I live; yet not I, but Christ liveth in me: and the life which I now live in the flesh I live by the faith of the Son of God, who loved me, and gave himself for me.',
   'Χριστῷ συνεσταύρωμαι ζῶ δὲ οὐκέτι ἐγώ ζῇ δὲ ἐν ἐμοὶ Χριστός ὃ δὲ νῦν ζῶ ἐν σαρκί ἐν πίστει ζῶ τῇ τοῦ υἱοῦ τοῦ θεοῦ τοῦ ἀγαπήσαντός με καὶ παραδόντος ἑαυτὸν ὑπὲρ ἐμοῦ',
   'Christō synestaurōmai zō de ouketi egō zē de en emoi Christos ho de nyn zō en sarki en pistei zō tē tou huiou tou theou tou agapēsantos me kai paradontos heauton hyper emou',
   '''Crucified with Christ'' (Christō synestaurōmai — I have been co-crucified with Christ; perfect tense: crucified in the past, remaining in that state). ''Nevertheless I live'' (zō de — but I live). ''Yet not I'' (ouketi egō — no longer I, the old self). ''Christ liveth in me'' (zē en emoi Christos — Christ lives in me). ''By the faith of the Son of God'' (en pistei tē tou huiou tou theou — in faith, the faith directed toward the Son of God). ''Who loved me, and gave himself for me'' (tou agapēsantos me kai paradontos heauton hyper emou — personal, individual: He loved me and surrendered Himself for me). This is Paul''s spiritual autobiography in one sentence: death to self, life in Christ, sustained by faith, motivated by personal love.',
   'Union with Christ: This verse is the high point of Pauline mysticism. The believer is so united with Christ that His crucifixion becomes the believer''s crucifixion, and His life becomes the believer''s life. The old self-reliant ego has been crucified; the new life is Christ Himself living in the believer. This is not annihilation of personality but transformation of identity: Paul still lives, but the animating principle is now Christ, not self. Faith is the ongoing means; Christ''s personal love is the sustaining motive.'),
  (21,
   'I do not frustrate the grace of God: for if righteousness come by the law, then Christ is dead in vain.',
   'Οὐκ ἀθετῶ τὴν χάριν τοῦ θεοῦ εἰ γὰρ διὰ νόμου δικαιοσύνη ἄρα Χριστὸς δωρεὰν ἀπέθανεν',
   'Ouk athetō tēn charin tou theou ei gar dia nomou dikaiosynē ara Christos dōrean apethanen',
   '''Frustrate'' (athetō — nullify, set aside, treat as void; from a-tithēmi). ''Righteousness by the law'' (dia nomou dikaiosynē — if righteousness could come through the law). ''Dead in vain'' (dōrean apethanen — died for nothing, died pointlessly, died without cause; dōrean means freely, gratuitously, for no reason). The devastating conclusion: if law-keeping could produce righteousness, then Christ''s death was unnecessary. The Judaizers'' position makes the cross pointless. You cannot add works to grace without destroying grace.',
   'The necessity of grace: Paul''s logic is airtight: either righteousness comes through the law or through the cross — it cannot come through both. If the law could make people righteous, Christ died for nothing. To add law-requirements to the gospel is not to complete it but to annul it. The cross proves that the law was insufficient; grace proves that God provided what the law could not.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Galatians' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 4 (Liberty / bondage)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλευθερίαν', 'eleutherian', 'G1657', 'Liberty, freedom — from eleutheros (free, not bound). The freedom that believers have in Christ: freedom from the law as a system of justification, freedom from its curse, freedom from the obligation to earn acceptance with God. This freedom is the Judaizers'' target.', 1),
  ('καταδουλώσουσιν', 'katadoulōsousin', 'G2615', 'To enslave completely, to reduce to bondage — from kata (down, completely) + douloō (to make a slave). The Judaizers'' goal was not merely to add rules but to re-enslave: returning free people to the condition of slaves under law.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 16 (Justified / works of the law)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δικαιοῦται', 'dikaioutai', 'G1344', 'Is justified, is declared righteous — a legal/forensic term: God the Judge pronounces the sinner righteous. Not "made righteous" in an experiential sense but "declared righteous" in a legal sense: acquitted, vindicated, given right standing.', 1),
  ('ἔργων νόμου', 'ergōn nomou', 'G2041/G3551', 'Works of the law — deeds prescribed or required by the Mosaic law. Paul argues that no one can accumulate enough obedience to earn a righteous verdict from God. The law''s purpose was to reveal sin, not to remedy it.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 2 AND v.verse_number = 16;

-- Verse 20 (Crucified with Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('συνεσταύρωμαι', 'synestaurōmai', 'G4957', 'I have been co-crucified — from syn (with, together) + stauroō (to crucify). Perfect passive: crucified with Christ at a point in the past, with the result that the crucified state continues. The believer''s old self died with Christ on the cross; this is a completed, ongoing reality.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 2 AND v.verse_number = 20;

-- Verse 21 (Frustrate / in vain)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δωρεάν', 'dōrean', 'G1432', 'In vain, for nothing, without cause — literally "as a gift, freely, gratis." If law-righteousness were possible, Christ died gratuitously, unnecessarily, for no purpose. The cross would be the greatest miscalculation in history.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 2 AND v.verse_number = 21;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v3: Titus not compelled
  (3, 'Acts 15:1-2', 1), (3, 'Acts 16:3', 2),
  -- v4: Liberty in Christ / bondage
  (4, 'Galatians 5:1', 1), (4, '2 Corinthians 11:26', 2),
  -- v9: Right hand of fellowship
  (9, 'Acts 15:22-29', 1), (9, '1 Corinthians 9:1-2', 2),
  -- v11: Withstood Peter
  (11, 'Proverbs 27:5-6', 1), (11, '2 Timothy 4:2', 2),
  -- v12: Peter eating with Gentiles
  (12, 'Acts 10:28', 1), (12, 'Acts 11:2-3', 2),
  -- v16: Justified by faith
  (16, 'Romans 3:20-22', 1), (16, 'Romans 3:28', 2), (16, 'Philippians 3:9', 3),
  -- v19: Dead to the law
  (19, 'Romans 7:4', 1), (19, 'Romans 6:14', 2),
  -- v20: Crucified with Christ
  (20, 'Romans 6:6', 1), (20, 'Colossians 3:3', 2), (20, 'Philippians 1:21', 3),
  -- v21: If by the law then Christ died in vain
  (21, 'Galatians 3:21', 1), (21, 'Romans 11:6', 2), (21, 'Hebrews 7:11', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Galatians Chapter 2 Complete
-- 21 verses · 5 key verses with word studies (7 words)
-- Cross-references for 9 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
