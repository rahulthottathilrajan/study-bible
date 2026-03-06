-- ═══════════════════════════════════════════════════
-- GALATIANS CHAPTER 1 — No Other Gospel
-- 24 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Galatians 1 opens with Paul''s most urgent salutation: no thanksgiving, no commendation — he plunges directly into rebuke. ''I marvel that ye are so soon removed from him that called you into the grace of Christ unto another gospel'' (v.6). This ''other gospel'' is no gospel at all, and anyone who preaches it — even an angel from heaven — is accursed (anathema, vv.8-9). Paul then defends his apostolic authority: his gospel was not received from men but ''by the revelation of Jesus Christ'' (v.12). He rehearses his autobiography: his former zeal in Judaism, his persecution of the church (vv.13-14), his dramatic conversion when God ''was pleased to reveal his Son in me'' (vv.15-16), and his independence from the Jerusalem apostles — he did not go to Jerusalem for three years, and then saw only Peter and James (vv.17-19). He swears before God that he is telling the truth (v.20). His point: the gospel he preaches came directly from Christ, not from any human authority.',
  'The Divine Origin of the Gospel and Paul''s Apostolic Authority',
  'εὐαγγέλιον (euangelion)',
  'Gospel, good news — from eu (good) + angelia (message). The announcement that God has acted in Christ to save sinners by grace through faith. In Galatians, this gospel is under assault: Judaizers are adding circumcision and law-keeping as requirements for salvation.',
  '["Greeting: Apostle by Divine Commission (vv.1-5): Paul an apostle not of men neither by man but by Jesus Christ and God the Father who raised him from the dead; grace be to you and peace from God the Father and from our Lord Jesus Christ who gave himself for our sins that he might deliver us from this present evil world","No Other Gospel (vv.6-10): I marvel that ye are so soon removed from him that called you into the grace of Christ unto another gospel which is not another; but there be some that trouble you and would pervert the gospel of Christ; though we or an angel from heaven preach any other gospel unto you than that which we have preached unto you let him be accursed; do I now persuade men or God or do I seek to please men for if I yet pleased men I should not be the servant of Christ","Paul''s Gospel by Revelation (vv.11-17): I certify you brethren that the gospel which was preached of me is not after man; for I neither received it of man neither was I taught it but by the revelation of Jesus Christ; for ye have heard of my conversation in time past in the Jews'' religion how that beyond measure I persecuted the church of God; but when it pleased God who separated me from my mother''s womb and called me by his grace to reveal his Son in me that I might preach him among the heathen immediately I conferred not with flesh and blood neither went I up to Jerusalem","Paul''s Limited Contact with Jerusalem (vv.18-24): Then after three years I went up to Jerusalem to see Peter and abode with him fifteen days; but other of the apostles saw I none save James the Lord''s brother; now the things which I write unto you behold before God I lie not; afterwards I came into the regions of Syria and Cilicia; and was unknown by face unto the churches of Judaea; they glorified God in me"]'
FROM books b WHERE b.name = 'Galatians';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, an apostle, (not of men, neither by man, but by Jesus Christ, and God the Father, who raised him from the dead;)',
   'Παῦλος ἀπόστολος οὐκ ἀπ᾽ ἀνθρώπων οὐδὲ δι᾽ ἀνθρώπου ἀλλὰ διὰ Ἰησοῦ Χριστοῦ καὶ θεοῦ πατρὸς τοῦ ἐγείραντος αὐτὸν ἐκ νεκρῶν',
   'Paulos apostolos ouk ap'' anthrōpōn oude di'' anthrōpou alla dia Iēsou Christou kai theou patros tou egeirantos auton ek nekrōn',
   '''Apostle'' (apostolos — one sent on a mission, an authorised ambassador). Paul immediately asserts the divine origin of his apostleship with two negations and one affirmation: ''not of men'' (ouk ap'' anthrōpōn — not originating from any human council), ''neither by man'' (oude di'' anthrōpou — not mediated through any human agent), ''but by Jesus Christ and God the Father'' (alla dia Iēsou Christou kai theou patros — through the direct agency of Christ and the Father). His commission came directly from the risen Christ (Acts 9:3-6; 26:15-18).',
   NULL),
  (2,
   'And all the brethren which are with me, unto the churches of Galatia:',
   'καὶ οἱ σὺν ἐμοὶ πάντες ἀδελφοί ταῖς ἐκκλησίαις τῆς Γαλατίας',
   'kai hoi syn emoi pantes adelphoi tais ekklēsiais tēs Galatias',
   '''Churches of Galatia'' (tais ekklēsiais tēs Galatias — plural: multiple congregations). Galatia was a Roman province in central Asia Minor (modern Turkey). Paul had founded these churches on his first missionary journey (Acts 13-14). He writes not to a single church but to a group of congregations all infected by the same Judaizing heresy.',
   NULL),
  (3,
   'Grace be to you and peace from God the Father, and from our Lord Jesus Christ,',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς καὶ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros kai kyriou hēmōn Iēsou Christou',
   '''Grace'' (charis — unmerited favour, the free gift of God). ''Peace'' (eirēnē — wholeness, well-being, reconciliation with God). The standard Pauline greeting, but in Galatians it is loaded with theological weight: the letter will argue that grace — not law — is the foundation of the Christian life. Grace precedes peace: you cannot have peace with God apart from grace.',
   NULL),
  (4,
   'Who gave himself for our sins, that he might deliver us from this present evil world, according to the will of God and our Father:',
   'τοῦ δόντος ἑαυτὸν ὑπὲρ τῶν ἁμαρτιῶν ἡμῶν ὅπως ἐξέληται ἡμᾶς ἐκ τοῦ ἐνεστῶτος αἰῶνος πονηροῦ κατὰ τὸ θέλημα τοῦ θεοῦ καὶ πατρὸς ἡμῶν',
   'tou dontos heauton hyper tōn hamartiōn hēmōn hopōs exelētai hēmas ek tou enestōtos aiōnos ponērou kata to thelēma tou theou kai patros hēmōn',
   '''Gave himself'' (dontos heauton — having given Himself; voluntary self-sacrifice). ''For our sins'' (hyper tōn hamartiōn hēmōn — on behalf of our sins; substitutionary). ''Deliver'' (exelētai — rescue, snatch out, extract from danger; aorist middle subjunctive: a decisive rescue). ''This present evil world'' (tou enestōtos aiōnos ponērou — the current evil age; the present epoch dominated by sin and Satan). ''According to the will of God'' — the cross was not an accident but the Father''s plan. Already in the greeting, Paul summarises the gospel: Christ''s voluntary, substitutionary death to rescue sinners from the present evil age.',
   NULL),
  (5,
   'To whom be glory for ever and ever. Amen.',
   'ᾧ ἡ δόξα εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'hō hē doxa eis tous aiōnas tōn aiōnōn amēn',
   '''Glory for ever and ever'' (hē doxa eis tous aiōnas tōn aiōnōn — the glory unto the ages of the ages). A doxology at the end of the greeting — unusual for Paul. The glory of the gospel demands praise even before the argument begins.',
   NULL),
  (6,
   'I marvel that ye are so soon removed from him that called you into the grace of Christ unto another gospel:',
   'Θαυμάζω ὅτι οὕτως ταχέως μετατίθεσθε ἀπὸ τοῦ καλέσαντος ὑμᾶς ἐν χάριτι Χριστοῦ εἰς ἕτερον εὐαγγέλιον',
   'Thaumazō hoti houtōs tacheōs metatithesthe apo tou kalesantos hymas en chariti Christou eis heteron euangelion',
   '''Marvel'' (thaumazō — I am astonished, amazed; this replaces the usual thanksgiving section). ''So soon'' (tacheōs — so quickly, so readily). ''Removed'' (metatithesthe — are being transferred, are deserting; present tense: the desertion is in progress; middle voice: you are allowing yourselves to be transferred). ''Another gospel'' (heteron euangelion — a different kind of gospel; heteros indicates qualitative difference, not merely numerical). They are deserting not just a theology but a Person — ''him that called you'' (God Himself). The Judaizers'' message is so fundamentally different from the true gospel that it deserves to be called ''another kind.''',
   NULL),
  (7,
   'Which is not another; but there be some that trouble you, and would pervert the gospel of Christ.',
   'ὃ οὐκ ἔστιν ἄλλο εἰ μή τινές εἰσιν οἱ ταράσσοντες ὑμᾶς καὶ θέλοντες μεταστρέψαι τὸ εὐαγγέλιον τοῦ Χριστοῦ',
   'ho ouk estin allo ei mē tines eisin hoi tarassontes hymas kai thelontes metastrepsai to euangelion tou Christou',
   '''Not another'' (ouk estin allo — is not another; allo means another of the same kind: there is no second gospel). ''Trouble you'' (tarassontes — disturbing, agitating, throwing into confusion; from tarassō). ''Pervert'' (metastrepsai — to reverse, to turn inside out, to transform into its opposite). The Judaizers'' message is not a slight modification but a complete reversal of the gospel of grace.',
   NULL),
  (8,
   'But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.',
   'ἀλλὰ καὶ ἐὰν ἡμεῖς ἢ ἄγγελος ἐξ οὐρανοῦ εὐαγγελίζηται ὑμῖν παρ᾽ ὃ εὐηγγελισάμεθα ὑμῖν ἀνάθεμα ἔστω',
   'alla kai ean hēmeis ē angelos ex ouranou euangelizētai hymin par'' ho euēngelisametha hymin anathema estō',
   '''Though we'' (ean hēmeis — even if we ourselves). ''An angel from heaven'' — even supernatural authority cannot override the gospel. ''Any other gospel'' (par'' ho — beside what, contrary to what). ''Accursed'' (anathema — devoted to destruction, cursed, under God''s ban; from anatithēmi, to place up as a votive offering to deity for destruction). The strongest possible language: anyone who alters the gospel of grace is under God''s curse. Paul includes himself in the hypothetical — the gospel is greater than any messenger.',
   'The inviolability of the gospel: Paul places the gospel above all human and angelic authority. No person, no matter how prestigious — not even Paul himself, not even an angel — has the right to modify, add to, or subtract from the gospel of grace. The pronouncement of anathema shows that distorting the gospel is not a minor theological disagreement but a matter of eternal consequence.'),
  (9,
   'As we said before, so say I now again, If any man preach any other gospel unto you than that ye have received, let him be accursed.',
   'ὡς προειρήκαμεν καὶ ἄρτι πάλιν λέγω εἴ τις ὑμᾶς εὐαγγελίζεται παρ᾽ ὃ παρελάβετε ἀνάθεμα ἔστω',
   'hōs proeirēkamen kai arti palin legō ei tis hymas euangelizetai par'' ho parelabete anathema estō',
   '''As we said before'' (proeirēkamen — we have said previously; Paul had warned them in person). ''Now again'' (arti palin — right now, once more). The repetition is deliberate: the double anathema emphasises the absolute seriousness of the matter. Paul moves from the hypothetical (v.8, ''even if we or an angel'') to the actual (v.9, ''if anyone is preaching''). The Judaizers are under God''s curse.',
   NULL),
  (10,
   'For do I now persuade men, or God? or do I seek to please men? for if I yet pleased men, I should not be the servant of Christ.',
   'ἄρτι γὰρ ἀνθρώπους πείθω ἢ τὸν θεόν ἢ ζητῶ ἀνθρώποις ἀρέσκειν εἰ ἔτι ἀνθρώποις ἤρεσκον Χριστοῦ δοῦλος οὐκ ἂν ἤμην',
   'arti gar anthrōpous peithō ē ton theon ē zētō anthrōpois areskein ei eti anthrōpois ēreskon Christou doulos ouk an ēmēn',
   '''Persuade'' (peithō — am I trying to win the approval of). ''Seek to please men'' (zētō anthrōpois areskein — am I seeking to be a people-pleaser). ''Servant of Christ'' (Christou doulos — slave of Christ). Paul''s pronouncement of anathema on the Judaizers is hardly the behaviour of a man-pleaser. If Paul were still trying to please people, he would not be Christ''s servant. The two allegiances are mutually exclusive.',
   NULL),
  (11,
   'But I certify you, brethren, that the gospel which was preached of me is not after man.',
   'Γνωρίζω δὲ ὑμῖν ἀδελφοί τὸ εὐαγγέλιον τὸ εὐαγγελισθὲν ὑπ᾽ ἐμοῦ ὅτι οὐκ ἔστιν κατὰ ἄνθρωπον',
   'Gnōrizō de hymin adelphoi to euangelion to euangelisthen hyp'' emou hoti ouk estin kata anthrōpon',
   '''Certify'' (gnōrizō — I make known to you, I declare). ''Not after man'' (ouk estin kata anthrōpon — is not according to human origin, not of human devising). Paul''s gospel is not a human product — not derived from human tradition, human philosophy, or human authority. This is the thesis he will now prove autobiographically.',
   NULL),
  (12,
   'For I neither received it of man, neither was I taught it, but by the revelation of Jesus Christ.',
   'οὐδὲ γὰρ ἐγὼ παρὰ ἀνθρώπου παρέλαβον αὐτό οὔτε ἐδιδάχθην ἀλλὰ δι᾽ ἀποκαλύψεως Ἰησοῦ Χριστοῦ',
   'oude gar egō para anthrōpou parelabon auto oute edidachthēn alla di'' apokalypseōs Iēsou Christou',
   '''Received'' (parelabon — received by tradition, took over from another; the technical term for receiving transmitted teaching). ''Taught'' (edidachthēn — was instructed). ''Revelation'' (apokalypseōs — unveiling, disclosure; from apokalyptō, to remove the cover). ''Of Jesus Christ'' — either a revelation from Jesus Christ or a revelation that has Jesus Christ as its content (or both). Paul''s gospel came not through the normal chain of human transmission but through direct divine disclosure.',
   'The gospel by direct revelation: Paul''s gospel was not secondhand. He did not learn it from the Jerusalem apostles or from any human teacher. It came by direct revelation from Jesus Christ. This is crucial because the Judaizers were claiming that Paul was a subordinate apostle who had garbled the original message. Paul counters: his message came directly from the same Christ who commissioned Peter and the Twelve.'),
  (13,
   'For ye have heard of my conversation in time past in the Jews'' religion, how that beyond measure I persecuted the church of God, and wasted it:',
   'Ἠκούσατε γὰρ τὴν ἐμὴν ἀναστροφήν ποτε ἐν τῷ Ἰουδαϊσμῷ ὅτι καθ᾽ ὑπερβολὴν ἐδίωκον τὴν ἐκκλησίαν τοῦ θεοῦ καὶ ἐπόρθουν αὐτήν',
   'Ēkousate gar tēn emēn anastrophēn pote en tō Ioudaismō hoti kath'' hyperbolēn ediōkon tēn ekklēsian tou theou kai eporthoun autēn',
   '''Conversation'' (anastrophēn — manner of life, conduct). ''Jews'' religion'' (tō Ioudaismō — Judaism; one of the earliest uses of the term). ''Beyond measure'' (kath'' hyperbolēn — to an extraordinary degree, excessively). ''Persecuted'' (ediōkon — was pursuing, hunting; imperfect tense: kept on persecuting). ''Wasted'' (eporthoun — was ravaging, destroying; from portheō, to plunder a city). Paul was not a casual observer but the most zealous persecutor of the church. His conversion from this extreme position proves divine intervention.',
   NULL),
  (14,
   'And profited in the Jews'' religion above many my equals in mine own nation, being more exceedingly zealous of the traditions of my fathers.',
   'καὶ προέκοπτον ἐν τῷ Ἰουδαϊσμῷ ὑπὲρ πολλοὺς συνηλικιώτας ἐν τῷ γένει μου περισσοτέρως ζηλωτὴς ὑπάρχων τῶν πατρικῶν μου παραδόσεων',
   'kai proekopton en tō Ioudaismō hyper pollous synēlikiōtas en tō genei mou perissoterōs zēlōtēs hyparchōn tōn patrikōn mou paradoseōn',
   '''Profited'' (proekopton — was advancing, making progress; from prokoptō, to cut forward, to blaze a trail). ''Equals'' (synēlikiōtas — contemporaries, those of the same age). ''Zealous'' (zēlōtēs — a zealot, one burning with passion). ''Traditions of my fathers'' (tōn patrikōn mou paradoseōn — the ancestral traditions; the oral Torah, the rabbinic traditions). Paul was the rising star of Pharisaic Judaism — surpassing his peers in devotion to the traditions. No one could accuse him of leaving Judaism because he was failing at it.',
   NULL),
  (15,
   'But when it pleased God, who separated me from my mother''s womb, and called me by his grace,',
   'Ὅτε δὲ εὐδόκησεν ὁ θεὸς ὁ ἀφορίσας με ἐκ κοιλίας μητρός μου καὶ καλέσας διὰ τῆς χάριτος αὐτοῦ',
   'Hote de eudokēsen ho theos ho aphorisas me ek koilias mētros mou kai kalesas dia tēs charitos autou',
   '''Pleased'' (eudokēsen — was well-pleased, decided in His good pleasure). ''Separated me from my mother''s womb'' (aphorisas me ek koilias mētros mou — set me apart from birth; echoing Jeremiah 1:5 and Isaiah 49:1). ''Called by his grace'' (kalesas dia tēs charitos — summoned through grace). Paul''s conversion was not his decision but God''s sovereign pleasure. God had set him apart before birth and called him by grace — the same grace Paul was now defending against the Judaizers.',
   'Sovereign calling: Paul''s testimony emphasises God''s initiative at every point: God set him apart before birth, God called him by grace, God revealed His Son in him. The persecutor did not find God; God found the persecutor. This is the same grace the Galatians are abandoning by turning to works of the law.'),
  (16,
   'To reveal his Son in me, that I might preach him among the heathen; immediately I conferred not with flesh and blood:',
   'ἀποκαλύψαι τὸν υἱὸν αὐτοῦ ἐν ἐμοί ἵνα εὐαγγελίζωμαι αὐτὸν ἐν τοῖς ἔθνεσιν εὐθέως οὐ προσανεθέμην σαρκὶ καὶ αἵματι',
   'apokalypsai ton huion autou en emoi hina euangelizōmai auton en tois ethnesin eutheōs ou prosanethemēn sarki kai haimati',
   '''Reveal his Son in me'' (apokalypsai ton huion autou en emoi — to unveil His Son in me; en emoi could mean ''to me'' or ''in me,'' i.e., both an inward revelation and an outward commission to embody and proclaim Christ). ''Among the heathen'' (en tois ethnesin — among the Gentiles, the nations). ''Conferred not with flesh and blood'' (ou prosanethemēn sarki kai haimati — did not consult any human being; prosanethemēn from prosanatithēmi, to lay before, to consult). Paul''s immediate response to the revelation was not to seek human validation but to begin his mission.',
   NULL),
  (17,
   'Neither went I up to Jerusalem to them which were apostles before me; but I went into Arabia, and returned again unto Damascus.',
   'οὐδὲ ἀνῆλθον εἰς Ἱεροσόλυμα πρὸς τοὺς πρὸ ἐμοῦ ἀποστόλους ἀλλ᾽ ἀπῆλθον εἰς Ἀραβίαν καὶ πάλιν ὑπέστρεψα εἰς Δαμασκόν',
   'oude anēlthon eis Hierosolyma pros tous pro emou apostolous all'' apēlthon eis Arabian kai palin hypestrepsa eis Damaskon',
   '''Went not up to Jerusalem'' — Paul emphasises what he did not do. He did not seek apostolic endorsement or instruction. ''Arabia'' — the Nabataean kingdom, likely the desert region south and east of Damascus. Paul spent time in Arabia before beginning his public ministry — possibly for reflection, revelation, and preparation. ''Returned to Damascus'' — he came back to where he started, not to Jerusalem.',
   NULL),
  (18,
   'Then after three years I went up to Jerusalem to see Peter, and abode with him fifteen days.',
   'Ἔπειτα μετὰ ἔτη τρία ἀνῆλθον εἰς Ἱεροσόλυμα ἱστορῆσαι Πέτρον καὶ ἐπέμεινα πρὸς αὐτὸν ἡμέρας δεκαπέντε',
   'Epeita meta etē tria anēlthon eis Hierosolyma historēsai Petron kai epemeina pros auton hēmeras dekapente',
   '''After three years'' (meta etē tria — three years after his conversion). ''To see Peter'' (historēsai Petron — to visit Peter, to get to know Peter, to inquire of Peter; from historeō, to inquire, to learn by visiting). ''Fifteen days'' — a brief visit. Paul went to get acquainted with Peter, not to receive his gospel from him. Three years of independent ministry had already passed. The gospel was already in Paul''s possession before he ever met Peter.',
   NULL),
  (19,
   'But other of the apostles saw I none, save James the Lord''s brother.',
   'ἕτερον δὲ τῶν ἀποστόλων οὐκ εἶδον εἰ μὴ Ἰάκωβον τὸν ἀδελφὸν τοῦ κυρίου',
   'heteron de tōn apostolōn ouk eidon ei mē Iakōbon ton adelphon tou kyriou',
   '''James the Lord''s brother'' (Iakōbon ton adelphon tou kyriou — James, the biological brother of Jesus; cf. Matt 13:55; Mark 6:3). James was not one of the Twelve but became the leader of the Jerusalem church (Acts 15:13; 21:18). Paul''s contact with Jerusalem leadership was extremely limited: two men, fifteen days. This proves he could not have derived his entire gospel from them.',
   NULL),
  (20,
   'Now the things which I write unto you, behold, before God, I lie not.',
   'ἃ δὲ γράφω ὑμῖν ἰδοὺ ἐνώπιον τοῦ θεοῦ ὅτι οὐ ψεύδομαι',
   'ha de graphō hymin idou enōpion tou theou hoti ou pseudomai',
   '''Before God'' (enōpion tou theou — in the sight of God, in God''s presence). ''I lie not'' (ou pseudomai — I am not lying). Paul takes an oath — calling God as witness — that his autobiographical account is true. The seriousness of this oath underscores how vigorously the Judaizers must have been distorting Paul''s history and relationship with the Jerusalem apostles.',
   NULL),
  (21,
   'Afterwards I came into the regions of Syria and Cilicia;',
   'ἔπειτα ἦλθον εἰς τὰ κλίματα τῆς Συρίας καὶ τῆς Κιλικίας',
   'epeita ēlthon eis ta klimata tēs Syrias kai tēs Kilikias',
   '''Syria and Cilicia'' — Syria included Antioch, which became Paul''s home base. Cilicia included Tarsus, Paul''s birthplace (Acts 9:30; 11:25). Paul was ministering far from Jerusalem for years — building churches among Gentiles without Jerusalem''s supervision or instruction.',
   NULL),
  (22,
   'And was unknown by face unto the churches of Judaea which were in Christ:',
   'ἤμην δὲ ἀγνοούμενος τῷ προσώπῳ ταῖς ἐκκλησίαις τῆς Ἰουδαίας ταῖς ἐν Χριστῷ',
   'ēmēn de agnooumenos tō prosōpō tais ekklēsiais tēs Ioudaias tais en Christō',
   '''Unknown by face'' (agnooumenos tō prosōpō — unrecognised personally). ''In Christ'' (en Christō — the Pauline phrase identifying genuine churches). The Judean churches had never even seen Paul. He was not their student, not their protégé, not their delegate. His ministry was independent of the Jerusalem-Judean establishment.',
   NULL),
  (23,
   'But they had heard only, That he which persecuted us in times past now preacheth the faith which once he destroyed.',
   'μόνον δὲ ἀκούοντες ἦσαν ὅτι ὁ διώκων ἡμᾶς ποτε νῦν εὐαγγελίζεται τὴν πίστιν ἥν ποτε ἐπόρθει',
   'monon de akouontes ēsan hoti ho diōkōn hēmas pote nyn euangelizetai tēn pistin hēn pote eporthei',
   '''He which persecuted us'' (ho diōkōn — the one who was persecuting). ''Now preacheth the faith'' (nyn euangelizetai tēn pistin — now proclaims as good news the very faith). ''Destroyed'' (eporthei — was ravaging, was trying to demolish). The dramatic irony: the man who once tried to destroy the faith now proclaims it. This is the gospel in biographical form — grace transforming its greatest enemy into its greatest champion.',
   NULL),
  (24,
   'And they glorified God in me.',
   'καὶ ἐδόξαζον ἐν ἐμοὶ τὸν θεόν',
   'kai edoxazon en emoi ton theon',
   '''Glorified God in me'' (edoxazon en emoi ton theon — they were glorifying God because of me; imperfect tense: they kept on glorifying). The Judean churches did not question Paul''s gospel or authority — they praised God for the transformation. The Judaizers claim to represent Jerusalem, but Jerusalem itself glorified God for Paul''s ministry.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Galatians' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 6 (Another gospel / removed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετατίθεσθε', 'metatithesthe', 'G3346', 'Are being removed, are deserting — from metatithēmi, to transfer, to transpose. Used of political or military defection: going over to the other side. The Galatians are deserting the God who called them, not just changing theological opinions.', 1),
  ('ἕτερον', 'heteron', 'G2087', 'Another of a different kind — distinct from allos (another of the same kind). The Judaizers'' gospel is qualitatively different from the true gospel. It is not a variant but a counterfeit — a fundamentally different message masquerading as the gospel.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 1 AND v.verse_number = 6;

-- Verse 8 (Anathema)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνάθεμα', 'anathema', 'G331', 'Accursed, devoted to destruction, under God''s ban — from anatithēmi (to place up as a votive offering). In the OT (Hebrew cherem), something devoted to God for destruction, irrevocably given over to His judgment. The strongest curse Paul could pronounce.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 1 AND v.verse_number = 8;

-- Verse 12 (Revelation of Jesus Christ)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀποκαλύψεως', 'apokalypseōs', 'G602', 'Revelation, unveiling, disclosure — from apokalyptō (to remove the cover, to uncover). A direct divine disclosure, not human discovery. Paul''s gospel was unveiled to him by Christ Himself, not learned through human instruction or tradition.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 1 AND v.verse_number = 12;

-- Verse 15 (Separated from the womb / called by grace)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀφορίσας', 'aphorisas', 'G873', 'Set apart, separated, designated — from aphorizō (to mark off by boundary). God marked Paul out for his mission before birth. The same word used in Rom 1:1: "separated unto the gospel of God." Paul''s entire life, even his years in Judaism, were part of God''s sovereign preparation.', 1),
  ('χάριτος', 'charitos', 'G5485', 'Grace — undeserved favour, the free gift of God''s goodness. Paul''s calling was not based on merit (he was persecuting the church!) but on grace. Grace is the key word of Galatians: it is the principle the Judaizers are subverting.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 1 AND v.verse_number = 15;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Apostle by divine commission
  (1, 'Acts 9:3-6', 1), (1, 'Acts 26:15-18', 2), (1, '1 Corinthians 9:1', 3),
  -- v4: Gave himself for our sins
  (4, 'Titus 2:14', 1), (4, '1 Peter 3:18', 2), (4, 'Ephesians 1:4', 3),
  -- v6: Removed to another gospel
  (6, '2 Corinthians 11:3-4', 1), (6, 'Galatians 5:4', 2),
  -- v8: Let him be accursed
  (8, '1 Corinthians 16:22', 1), (8, 'Deuteronomy 4:2', 2), (8, 'Revelation 22:18-19', 3),
  -- v12: Revelation of Jesus Christ
  (12, 'Ephesians 3:3', 1), (12, '1 Corinthians 11:23', 2),
  -- v13: Persecuted the church
  (13, 'Acts 8:3', 1), (13, 'Acts 9:1-2', 2), (13, 'Philippians 3:6', 3),
  -- v15: Separated from the womb
  (15, 'Jeremiah 1:5', 1), (15, 'Isaiah 49:1', 2), (15, 'Romans 1:1', 3),
  -- v16: Reveal his Son / preach to Gentiles
  (16, 'Acts 9:15', 1), (16, 'Ephesians 3:8', 2),
  -- v18: Visited Peter
  (18, 'Acts 9:26-28', 1),
  -- v23: Preacheth the faith he once destroyed
  (23, 'Acts 9:20-21', 1), (23, '1 Timothy 1:13', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Galatians' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- Galatians Chapter 1 Complete
-- 24 verses · 4 key verses with word studies (7 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
