-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 1 — The God of All Comfort
-- 24 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '2 Corinthians opens with one of the most tender and theologically rich passages on suffering in the entire New Testament. Paul identifies himself and Timothy as the authors, greeting the church at Corinth ''and all the saints which are in all Achaia'' (v.1). Rather than launching into rebuke, Paul erupts into blessing: ''Blessed be God, even the Father of our Lord Jesus Christ, the Father of mercies, and the God of all comfort; who comforteth us in all our tribulation, that we may be able to comfort them which are in any trouble'' (vv.3-4). He reveals that in Asia he was ''pressed out of measure, above strength, insomuch that we despaired even of life'' (v.8) — a near-death experience that taught him not to trust in himself ''but in God which raiseth the dead'' (v.9). Paul defends his sincerity: ''our rejoicing is this, the testimony of our conscience, that in simplicity and godly sincerity, not with fleshly wisdom, but by the grace of God, we have had our conversation in the world'' (v.12). He explains his delayed visit was not fickleness: ''as God is true, our word toward you was not yea and nay'' (v.18). Christ himself is the ultimate ''Yea'': ''For all the promises of God in him are yea, and in him Amen'' (v.20). The chapter closes with a profound trinitarian statement: God ''hath anointed us, and hath also sealed us, and given the earnest of the Spirit in our hearts'' (vv.21-22).',
  'The God of All Comfort, Apostolic Sincerity',
  'παράκλησις (paraklēsis)',
  'Comfort, consolation, encouragement — from para (alongside) + kaleō (to call). God comes alongside the suffering believer with encouragement and strength. The word appears ten times in vv.3-7 alone, forming the theological backbone of the passage. Paraklēsis is both the comfort received from God and the comfort passed on to others.',
  '["Greeting and Apostolic Authority (vv.1-2): Paul an apostle of Jesus Christ by the will of God and Timothy our brother unto the church of God which is at Corinth with all the saints which are in all Achaia grace be to you and peace from God our Father and from the Lord Jesus Christ","The God of All Comfort (vv.3-7): Blessed be God even the Father of our Lord Jesus Christ the Father of mercies and the God of all comfort who comforteth us in all our tribulation that we may be able to comfort them which are in any trouble by the comfort wherewith we ourselves are comforted of God for as the sufferings of Christ abound in us so our consolation also aboundeth by Christ","Deliverance from Deadly Peril in Asia (vv.8-11): We would not brethren have you ignorant of our trouble which came to us in Asia that we were pressed out of measure above strength insomuch that we despaired even of life but we had the sentence of death in ourselves that we should not trust in ourselves but in God which raiseth the dead who delivered us from so great a death and doth deliver in whom we trust that he will yet deliver us","Apostolic Sincerity and the Delayed Visit (vv.12-17): Our rejoicing is this the testimony of our conscience that in simplicity and godly sincerity not with fleshly wisdom but by the grace of God we have had our conversation in the world and more abundantly to you-ward","Christ the Yes and the Amen and the Seal of the Spirit (vv.18-24): As God is true our word toward you was not yea and nay for the Son of God Jesus Christ who was preached among you by us was not yea and nay but in him was yea for all the promises of God in him are yea and in him Amen unto the glory of God by us now he which stablisheth us with you in Christ and hath anointed us is God who hath also sealed us and given the earnest of the Spirit in our hearts"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Paul, an apostle of Jesus Christ by the will of God, and Timothy our brother, unto the church of God which is at Corinth, with all the saints which are in all Achaia:',
   'Παῦλος ἀπόστολος Ἰησοῦ Χριστοῦ διὰ θελήματος θεοῦ καὶ Τιμόθεος ὁ ἀδελφός τῇ ἐκκλησίᾳ τοῦ θεοῦ τῇ οὔσῃ ἐν Κορίνθῳ σὺν τοῖς ἁγίοις πᾶσιν τοῖς οὖσιν ἐν ὅλῃ τῇ Ἀχαΐᾳ',
   'Paulos apostolos Iēsou Christou dia thelēmatos theou kai Timotheos ho adelphos tē ekklēsia tou theou tē ousē en Korinthō syn tois hagiois pasin tois ousin en holē tē Achaia',
   '''By the will of God'' (dia thelēmatos theou — through the will of God; Paul''s apostleship is not self-appointed but divinely ordained). ''Timothy our brother'' — not a co-apostle but a co-sender; Timothy was well-known to the Corinthians (1 Cor 4:17). ''All Achaia'' — the Roman province comprising all of southern Greece; the letter has a wider audience than Corinth alone.',
   NULL),
  (2, 'Grace be to you and peace from God our Father, and from the Lord Jesus Christ.',
   'χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   '''Grace and peace'' — the standard Pauline greeting fusing the Greek (charis) and Hebrew (shalom/eirēnē) salutations. Grace is God''s undeserved favour; peace is the wholeness that results from it. Both flow ''from God our Father and from the Lord Jesus Christ'' — placing Christ on equal footing with the Father as the joint source of divine blessing.',
   NULL),
  (3, 'Blessed be God, even the Father of our Lord Jesus Christ, the Father of mercies, and the God of all comfort;',
   'Εὐλογητὸς ὁ θεὸς καὶ πατὴρ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ὁ πατὴρ τῶν οἰκτιρμῶν καὶ θεὸς πάσης παρακλήσεως',
   'Eulogētos ho theos kai patēr tou kyriou hēmōn Iēsou Christou ho patēr tōn oiktirmōn kai theos pasēs paraklēseōs',
   '''Blessed'' (eulogētos — worthy of praise; an ascription directed upward to God, not a declaration of what God receives from us but of what he deserves). ''Father of mercies'' (patēr tōn oiktirmōn — the source and origin of all compassion; the plural ''mercies'' suggests the inexhaustible variety of divine compassion). ''God of all comfort'' (theos pasēs paraklēseōs — the God who is the source of every consolation). This is one of the richest compound titles of God in the NT — Father, source of mercies, God of all comfort.',
   'God is here identified by his relationship to suffering: he is the ''Father of mercies'' and the ''God of all comfort.'' This is not an abstract theological description but an experiential one — Paul has tested God in extremity and found him to be exactly this. The word paraklēsis (comfort/encouragement) appears ten times in vv.3-7, making this passage the NT''s most concentrated theology of divine comfort. God''s character as Comforter is not occasional but essential — he is the God of ALL comfort.'),
  (4, 'Who comforteth us in all our tribulation, that we may be able to comfort them which are in any trouble, by the comfort wherewith we ourselves are comforted of God.',
   'ὁ παρακαλῶν ἡμᾶς ἐπὶ πάσῃ τῇ θλίψει ἡμῶν εἰς τὸ δύνασθαι ἡμᾶς παρακαλεῖν τοὺς ἐν πάσῃ θλίψει διὰ τῆς παρακλήσεως ἧς παρακαλούμεθα αὐτοὶ ὑπὸ τοῦ θεοῦ',
   'ho parakalōn hēmas epi pasē tē thlipsei hēmōn eis to dynasthai hēmas parakalein tous en pasē thlipsei dia tēs paraklēseōs hēs parakaloumetha autoi hypo tou theou',
   '''Comforteth'' (parakalōn — present participle: God who keeps on comforting). ''All our tribulation'' (pasē tē thlipsei — every pressure, every affliction; thlipsis literally means ''pressing,'' as grapes in a winepress). ''That we may be able'' (eis to dynasthai — purpose clause: comfort is given with a mission). ''Comfort them which are in any trouble'' — the comfort received becomes comfort transmitted. ''By the comfort wherewith we ourselves are comforted of God'' — the chain of comfort: God → the sufferer → others who suffer. No suffering in God''s economy is wasted; it becomes equipment for ministry.',
   'This verse establishes the ''comfort cycle'' — God''s comfort is never terminal but always transitional. It flows through the comforted to those who need comforting. Paul''s sufferings are not merely personal trials but apostolic equipment. This principle applies universally: every believer who receives God''s comfort in affliction is thereby equipped to minister that same comfort to others. Suffering produces compassion; divine comfort produces competent comforters.'),
  (5, 'For as the sufferings of Christ abound in us, so our consolation also aboundeth by Christ.',
   'ὅτι καθὼς περισσεύει τὰ παθήματα τοῦ Χριστοῦ εἰς ἡμᾶς οὕτως διὰ τοῦ Χριστοῦ περισσεύει καὶ ἡ παράκλησις ἡμῶν',
   'hoti kathōs perisseuei ta pathēmata tou Christou eis hēmas houtōs dia tou Christou perisseuei kai hē paraklēsis hēmōn',
   '''Sufferings of Christ'' (pathēmata tou Christou — the sufferings that belong to Christ; not Christ''s atoning sufferings, which are unique and unrepeatable, but the afflictions that come from following Christ and doing his work). ''Abound'' (perisseuei — overflow, exceed; the same verb is used for both suffering and comfort: as one overflows, so does the other). ''By Christ'' (dia tou Christou — through Christ; Christ is the channel of comfort just as he is the occasion of suffering). The proportion is precise: suffering and comfort are matched.',
   NULL),
  (6, 'And whether we be afflicted, it is for your consolation and salvation, which is effectual in the enduring of the same sufferings which we also suffer: or whether we be comforted, it is for your consolation and salvation.',
   'εἴτε δὲ θλιβόμεθα ὑπὲρ τῆς ὑμῶν παρακλήσεως καὶ σωτηρίας τῆς ἐνεργουμένης ἐν ὑπομονῇ τῶν αὐτῶν παθημάτων ὧν καὶ ἡμεῖς πάσχομεν εἴτε παρακαλούμεθα ὑπὲρ τῆς ὑμῶν παρακλήσεως καὶ σωτηρίας',
   'eite de thlibometha hyper tēs hymōn paraklēseōs kai sōtērias tēs energoumenēs en hypomonē tōn autōn pathēmatōn hōn kai hēmeis paschomen eite parakaloumetha hyper tēs hymōn paraklēseōs kai sōtērias',
   '''Whether we be afflicted … or whether we be comforted'' — both Paul''s suffering and his comfort serve the Corinthians'' benefit. ''For your consolation and salvation'' (hyper tēs hymōn paraklēseōs kai sōtērias — on behalf of your encouragement and deliverance). ''Effectual'' (energoumenēs — working effectively, being energized; the comfort is not passive but actively operative). ''Enduring'' (hypomonē — patient endurance, steadfastness). Paul''s sufferings model endurance and produce comfort that equips the Corinthians for their own trials.',
   NULL),
  (7, 'And our hope of you is stedfast, knowing, that as ye are partakers of the sufferings, so shall ye be also of the consolation.',
   'καὶ ἡ ἐλπὶς ἡμῶν βεβαία ὑπὲρ ὑμῶν εἰδότες ὅτι ὥσπερ κοινωνοί ἐστε τῶν παθημάτων οὕτως καὶ τῆς παρακλήσεως',
   'kai hē elpis hēmōn bebaia hyper hymōn eidotes hoti hōsper koinōnoi este tōn pathēmatōn houtōs kai tēs paraklēseōs',
   '''Stedfast'' (bebaia — firm, secure, reliable). ''Partakers'' (koinōnoi — sharers, partners; from koinōnia). ''As … so'' — the proportion holds: those who share in the sufferings will share equally in the consolation. Paul''s confidence in the Corinthians rests on this spiritual principle: God matches comfort to suffering. Suffering fellowship (koinōnia) guarantees comfort fellowship.',
   NULL),
  (8, 'For we would not, brethren, have you ignorant of our trouble which came to us in Asia, that we were pressed out of measure, above strength, insomuch that we despaired even of life:',
   'οὐ γὰρ θέλομεν ὑμᾶς ἀγνοεῖν ἀδελφοί ὑπὲρ τῆς θλίψεως ἡμῶν τῆς γενομένης ἡμῖν ἐν τῇ Ἀσίᾳ ὅτι καθ᾿ ὑπερβολὴν ὑπὲρ δύναμιν ἐβαρήθημεν ὥστε ἐξαπορηθῆναι ἡμᾶς καὶ τοῦ ζῆν',
   'ou gar thelomen hymas agnoein adelphoi hyper tēs thlipseōs hēmōn tēs genomenēs hēmin en tē Asia hoti kath'' hyperbolēn hyper dynamin ebarēthēmen hōste exaporēthēnai hēmas kai tou zēn',
   '''Pressed out of measure'' (kath'' hyperbolēn — beyond all measure, excessively). ''Above strength'' (hyper dynamin — beyond our power to bear). ''We were burdened'' (ebarēthēmen — weighed down; passive: the affliction was crushing). ''Despaired even of life'' (exaporēthēnai kai tou zēn — utterly at a loss even regarding living; the double compound ex-aporeō intensifies the despair). The precise nature of this Asian crisis is unknown — possibly the Ephesian riot (Acts 19), a severe illness, or imprisonment. What matters is that Paul was brought to the absolute end of human resources.',
   NULL),
  (9, 'But we had the sentence of death in ourselves, that we should not trust in ourselves, but in God which raiseth the dead:',
   'ἀλλὰ αὐτοὶ ἐν ἑαυτοῖς τὸ ἀπόκριμα τοῦ θανάτου ἐσχήκαμεν ἵνα μὴ πεποιθότες ὦμεν ἐφ᾿ ἑαυτοῖς ἀλλ᾿ ἐπὶ τῷ θεῷ τῷ ἐγείροντι τοὺς νεκρούς',
   'alla autoi en heautois to apokrima tou thanatou eschēkamen hina mē pepoithotes ōmen eph'' heautois all'' epi tō theō tō egeironti tous nekrous',
   '''Sentence of death'' (apokrima tou thanatou — the official verdict of death; apokrima is a judicial term for an official response or decision). ''In ourselves'' — Paul had internally accepted the verdict: ''I am going to die.'' ''That we should not trust in ourselves'' (hina mē pepoithotes ōmen eph'' heautois — purpose clause: this was God''s pedagogical design). ''God which raiseth the dead'' (theō tō egeironti tous nekrous — the God who raises dead people; present participle: this is God''s characteristic activity). The extremity of suffering served a divine purpose: to shatter self-reliance and redirect trust to the resurrection God.',
   'This verse reveals the theology of extremity: God allows his servants to be pushed beyond all human capacity so that they learn to depend entirely on the God who raises the dead. The phrase ''God which raiseth the dead'' is significant — Paul did not merely need help; he needed resurrection power. This is the same God who raised Jesus, and Paul''s trust in physical deliverance is grounded in that greater resurrection. The pattern is death-to-self leading to resurrection-life — the very heart of the gospel applied experientially.'),
  (10, 'Who delivered us from so great a death, and doth deliver: in whom we trust that he will yet deliver us;',
   'ὃς ἐκ τηλικούτου θανάτου ἐρρύσατο ἡμᾶς καὶ ῥύεται εἰς ὃν ἠλπίκαμεν ὅτι καὶ ἔτι ῥύσεται',
   'hos ek tēlikoutou thanatou errysato hēmas kai rhyetai eis hon ēlpikamen hoti kai eti rhysetai',
   '''Delivered'' (errysato — rescued, snatched away; aorist: past deliverance). ''Doth deliver'' (rhyetai — present tense: ongoing deliverance). ''Will yet deliver'' (rhysetai — future tense: anticipated deliverance). Three tenses of deliverance: past, present, and future. God''s faithfulness spans all time. ''So great a death'' (tēlikoutou thanatou — so terrible a death; the word tēlikoutos emphasizes the magnitude). Paul''s confidence for the future rests on his experience of past and present rescue.',
   NULL),
  (11, 'Ye also helping together by prayer for us, that for the gift bestowed upon us by the means of many persons thanks may be given by many on our behalf.',
   'συνυπουργούντων καὶ ὑμῶν ὑπὲρ ἡμῶν τῇ δεήσει ἵνα ἐκ πολλῶν προσώπων τὸ εἰς ἡμᾶς χάρισμα διὰ πολλῶν εὐχαριστηθῇ ὑπὲρ ἡμῶν',
   'synypourgoyntōn kai hymōn hyper hēmōn tē deēsei hina ek pollōn prosōpōn to eis hēmas charisma dia pollōn eucharistēthē hyper hēmōn',
   '''Helping together'' (synypourgoyntōn — co-labouring underneath, working together in support; a rare compound: syn + hypo + ergon — working together under the burden). ''By prayer'' (tē deēsei — through supplication; the Corinthians'' prayers are actual assistance, not mere sentiment). ''The gift'' (charisma — the gracious gift of deliverance). ''By the means of many persons'' (ek pollōn prosōpōn — from many faces/persons). The logic: many pray → God delivers → many give thanks. Prayer and thanksgiving form a cycle of corporate participation in God''s saving work.',
   NULL),
  (12, 'For our rejoicing is this, the testimony of our conscience, that in simplicity and godly sincerity, not with fleshly wisdom, but by the grace of God, we have had our conversation in the world, and more abundantly to you-ward.',
   'ἡ γὰρ καύχησις ἡμῶν αὕτη ἐστίν τὸ μαρτύριον τῆς συνειδήσεως ἡμῶν ὅτι ἐν ἁπλότητι καὶ εἰλικρινείᾳ θεοῦ οὐκ ἐν σοφίᾳ σαρκικῇ ἀλλ᾿ ἐν χάριτι θεοῦ ἀνεστράφημεν ἐν τῷ κόσμῳ περισσοτέρως δὲ πρὸς ὑμᾶς',
   'hē gar kauchēsis hēmōn hautē estin to martyrion tēs syneidēseōs hēmōn hoti en haplotēti kai eilikrineia theou ouk en sophia sarkikē all'' en chariti theou anestraphēmen en tō kosmō perissoterōs de pros hymas',
   '''Rejoicing'' (kauchēsis — boasting, ground of boasting). ''Testimony of our conscience'' (martyrion tēs syneidēseōs — the witness of our inner moral awareness). ''Simplicity'' (haplotēti — singleness of purpose, sincerity without duplicity). ''Godly sincerity'' (eilikrineia theou — sincerity that belongs to God or is tested by God; eilikrineia from heilē [sunlight] + krinō [to judge] — tested by sunlight, pure when held up to the light). ''Fleshly wisdom'' (sophia sarkikē — human cleverness, worldly shrewdness). ''Grace of God'' — the operating principle of Paul''s ministry is not human skill but divine grace.',
   NULL),
  (13, 'For we write none other things unto you, than what ye read or acknowledge; and I trust ye shall acknowledge even to the end;',
   'οὐ γὰρ ἄλλα γράφομεν ὑμῖν ἀλλ᾿ ἢ ἃ ἀναγινώσκετε ἢ καὶ ἐπιγινώσκετε ἐλπίζω δὲ ὅτι καὶ ἕως τέλους ἐπιγνώσεσθε',
   'ou gar alla graphomen hymin all'' ē ha anaginōskete ē kai epiginōskete elpizō de hoti kai heōs telous epignōsesthe',
   '''Read'' (anaginōskete — read aloud). ''Acknowledge'' (epiginōskete — recognize fully, understand; the epi- prefix adds thoroughness). Paul plays on the similarity: what you read (anaginōskete) you also fully know (epiginōskete). His letters are transparent — no hidden agenda, no double meaning. ''Even to the end'' (heōs telous — until the completion; Paul hopes for enduring understanding between himself and the Corinthians).',
   NULL),
  (14, 'As also ye have acknowledged us in part, that we are your rejoicing, even as ye also are ours in the day of the Lord Jesus.',
   'καθὼς καὶ ἐπέγνωτε ἡμᾶς ἀπὸ μέρους ὅτι καύχημα ὑμῶν ἐσμεν καθάπερ καὶ ὑμεῖς ἡμῶν ἐν τῇ ἡμέρᾳ τοῦ κυρίου Ἰησοῦ',
   'kathōs kai epegnōte hēmas apo merous hoti kauchēma hymōn esmen kathaper kai hymeis hēmōn en tē hēmera tou kyriou Iēsou',
   '''In part'' (apo merous — partially; some Corinthians had recognized Paul''s integrity, but not all). ''Your rejoicing'' (kauchēma hymōn — your boast, your ground of boasting). ''In the day of the Lord Jesus'' — at Christ''s return, the mutual relationship between Paul and the Corinthians will be their shared glory. The eschatological perspective elevates present relationships: what seems like a fractured apostle-church relationship has eternal significance.',
   NULL),
  (15, 'And in this confidence I was minded to come unto you before, that ye might have a second benefit;',
   'καὶ ταύτῃ τῇ πεποιθήσει ἐβουλόμην πρὸς ὑμᾶς ἐλθεῖν πρότερον ἵνα δευτέραν χάριν ἔχητε',
   'kai tautē tē pepoithēsei eboulomēn pros hymas elthein proteron hina deuteran charin echēte',
   '''Confidence'' (pepoithēsei — trust, assurance). ''Minded'' (eboulomēn — intended, planned). ''Second benefit'' (deuteran charin — a second grace; Paul planned two visits to maximize the blessing to the Corinthians). This begins his defense against the charge of fickleness — he had changed his travel plans and his opponents used this against him.',
   NULL),
  (16, 'And to pass by you into Macedonia, and to come again out of Macedonia unto you, and of you to be brought on my way toward Judaea.',
   'καὶ δι᾿ ὑμῶν διελθεῖν εἰς Μακεδονίαν καὶ πάλιν ἀπὸ Μακεδονίας ἐλθεῖν πρὸς ὑμᾶς καὶ ὑφ᾿ ὑμῶν προπεμφθῆναι εἰς τὴν Ἰουδαίαν',
   'kai di'' hymōn dielthein eis Makedonian kai palin apo Makedonias elthein pros hymas kai hyph'' hymōn propemphthēnai eis tēn Ioudaian',
   '''Pass by you'' (di'' hymōn dielthein — travel through your city). ''Brought on my way'' (propemphthēnai — to be sent forward, escorted; a technical term for the early church''s practice of providing for a missionary''s onward journey with supplies and companionship). Paul''s original plan: Corinth → Macedonia → Corinth again → Judaea. This double visit would have given Corinth two opportunities for fellowship.',
   NULL),
  (17, 'When I therefore was thus minded, did I use lightness? or the things that I purpose, do I purpose according to the flesh, that with me there should be yea yea, and nay nay?',
   'τοῦτο οὖν βουλευόμενος μήτι ἄρα τῇ ἐλαφρίᾳ ἐχρησάμην ἢ ἃ βουλεύομαι κατὰ σάρκα βουλεύομαι ἵνα ᾖ παρ᾿ ἐμοὶ τὸ ναὶ ναὶ καὶ τὸ οὒ οὔ',
   'touto oun bouleuomenos mēti ara tē elaphria echrēsamēn ē ha bouleuomai kata sarka bouleuomai hina ē par'' emoi to nai nai kai to ou ou',
   '''Lightness'' (elaphria — fickleness, levity, vacillation). ''According to the flesh'' (kata sarka — by merely human calculation). ''Yea yea, and nay nay'' — saying yes and no simultaneously; meaning double-mindedness or unreliability. Paul''s rhetorical questions expect the answer ''No!'' — his change of plans was not fickleness but pastoral wisdom. He will argue that his very constancy in the gospel proves his constancy in lesser matters.',
   NULL),
  (18, 'But as God is true, our word toward you was not yea and nay.',
   'πιστὸς δὲ ὁ θεός ὅτι ὁ λόγος ἡμῶν ὁ πρὸς ὑμᾶς οὐκ ἐγένετο ναὶ καὶ οὔ',
   'pistos de ho theos hoti ho logos hēmōn ho pros hymas ouk egeneto nai kai ou',
   '''As God is true'' (pistos ho theos — God is faithful; Paul swears by God''s faithfulness that his message was consistent). ''Our word'' (ho logos hēmōn — our message, our preaching; this is not just about travel plans but about the gospel itself). ''Not yea and nay'' — the gospel Paul preached at Corinth was not an ambiguous maybe; it was a definitive divine Yes.',
   NULL),
  (19, 'For the Son of God, Jesus Christ, who was preached among you by us, even by me and Silvanus and Timotheus, was not yea and nay, but in him was yea.',
   'ὁ γὰρ τοῦ θεοῦ υἱὸς Ἰησοῦς Χριστὸς ὁ ἐν ὑμῖν δι᾿ ἡμῶν κηρυχθείς δι᾿ ἐμοῦ καὶ Σιλουανοῦ καὶ Τιμοθέου οὐκ ἐγένετο ναὶ καὶ οὔ ἀλλὰ ναὶ ἐν αὐτῷ γέγονεν',
   'ho gar tou theou huios Iēsous Christos ho en hymin di'' hēmōn kērychtheis di'' emou kai Silouanou kai Timotheou ouk egeneto nai kai ou alla nai en autō gegonen',
   '''The Son of God'' (tou theou huios — the full christological title). ''Preached among you by us'' (en hymin di'' hēmōn kērychtheis — proclaimed in your midst through us). ''Silvanus and Timotheus'' — the original evangelistic team at Corinth (Acts 18:5). ''In him was yea'' (nai en autō gegonen — yes has come to be in him; perfect tense: the Yes stands permanently). Christ is not an ambiguous figure — he is God''s definitive, unqualified Yes to humanity.',
   NULL),
  (20, 'For all the promises of God in him are yea, and in him Amen, unto the glory of God by us.',
   'ὅσαι γὰρ ἐπαγγελίαι θεοῦ ἐν αὐτῷ τὸ ναί καὶ ἐν αὐτῷ τὸ ἀμήν τῷ θεῷ πρὸς δόξαν δι᾿ ἡμῶν',
   'hosai gar epangeliai theou en autō to nai kai en autō to amēn tō theō pros doxan di'' hēmōn',
   '''All the promises'' (hosai epangeliai — however many promises; the quantifier is deliberately comprehensive). ''In him are yea'' (en autō to nai — in Christ they are Yes; every divine promise finds its fulfilment and guarantee in Christ). ''In him Amen'' (en autō to amēn — in Christ they are Amen, confirmed, ratified). ''Unto the glory of God by us'' — when the church says ''Amen'' to God''s promises in Christ, God is glorified through the community. This is one of the most magnificent christological statements in Paul: Christ is the fulfilment of every promise God ever made.',
   'This verse is foundational for understanding the relationship between the Old and New Testaments. Every promise in the OT — to Abraham, to David, through the prophets — finds its ''Yes'' in Jesus Christ. He is not one among many fulfilments but THE fulfilment of ALL divine promises. The ''Amen'' spoken through the church is the congregational response to God''s cosmic Yes. This verse demolishes any reading of the OT that does not lead to Christ and any theology that separates the testaments.'),
  (21, 'Now he which stablisheth us with you in Christ, and hath anointed us, is God;',
   'ὁ δὲ βεβαιῶν ἡμᾶς σὺν ὑμῖν εἰς Χριστὸν καὶ χρίσας ἡμᾶς θεός',
   'ho de bebaiōn hēmas syn hymin eis Christon kai chrisas hēmas theos',
   '''Stablisheth'' (bebaiōn — confirming, making firm; present participle: God who keeps on establishing). ''Anointed'' (chrisas — having anointed; the verb chriō is cognate with Christos/Christ: God has ''Christed'' us, consecrated us as Christ was consecrated). ''Us with you'' — Paul and the Corinthians share the same divine establishment. This begins a trinitarian sequence: God the Father establishes and anoints (v.21), seals (v.22), and gives the Spirit (v.22).',
   NULL),
  (22, 'Who hath also sealed us, and given the earnest of the Spirit in our hearts.',
   'ὁ καὶ σφραγισάμενος ἡμᾶς καὶ δοὺς τὸν ἀρραβῶνα τοῦ πνεύματος ἐν ταῖς καρδίαις ἡμῶν',
   'ho kai sphragisamenos hēmas kai dous ton arrabōna tou pneumatos en tais kardiais hēmōn',
   '''Sealed'' (sphragisamenos — having sealed; a seal denotes ownership, authenticity, and security; God has stamped believers with his mark of possession). ''Earnest'' (arrabōna — down payment, pledge, guarantee; a commercial term from Semitic languages for the first installment that guarantees the full payment). ''Of the Spirit'' — the Spirit himself is the down payment, not merely something the Spirit gives. The Holy Spirit in the believer''s heart is God''s guarantee that the full inheritance is coming.',
   'This verse, together with v.21, presents a remarkable trinitarian summary of salvation: (1) God establishes and anoints, (2) God seals, and (3) God gives the Spirit as a down payment. The three metaphors — anointing (consecration), sealing (ownership/security), and earnest (guarantee) — together describe the believer''s position in Christ. The ''earnest of the Spirit'' (arrabōn) is particularly significant: the Spirit''s present work in the believer is a foretaste and guarantee of the full glory to come. Cf. Ephesians 1:13-14.'),
  (23, 'Moreover I call God for a record upon my soul, that to spare you I came not as yet unto Corinth.',
   'ἐγὼ δὲ μάρτυρα τὸν θεὸν ἐπικαλοῦμαι ἐπὶ τὴν ἐμὴν ψυχήν ὅτι φειδόμενος ὑμῶν οὐκέτι ἦλθον εἰς Κόρινθον',
   'egō de martyra ton theon epikaloumai epi tēn emēn psychēn hoti pheidomenos hymōn ouketi ēlthon eis Korinthon',
   '''I call God for a record upon my soul'' (martyra ton theon epikaloumai epi tēn emēn psychēn — I invoke God as witness against my own soul; a solemn oath). ''To spare you'' (pheidomenos hymōn — sparing you; the reason for the delay was mercy, not fickleness). Paul delayed his visit to avoid another painful confrontation (cf. 2:1). His change of plans was motivated by pastoral love, not unreliability.',
   NULL),
  (24, 'Not for that we have dominion over your faith, but are helpers of your joy: for by faith ye stand.',
   'οὐχ ὅτι κυριεύομεν ὑμῶν τῆς πίστεως ἀλλὰ συνεργοί ἐσμεν τῆς χαρᾶς ὑμῶν τῇ γὰρ πίστει ἑστήκατε',
   'ouch hoti kyrieuomen hymōn tēs pisteōs alla synergoi esmen tēs charas hymōn tē gar pistei hestēkate',
   '''Dominion over your faith'' (kyrieuomen hymōn tēs pisteōs — lord it over your faith; Paul explicitly denies apostolic tyranny). ''Helpers of your joy'' (synergoi tēs charas hymōn — co-workers for your joy; Paul''s role is not to control but to serve). ''By faith ye stand'' (tē pistei hestēkate — you stand firm by your own faith; perfect tense: you have taken your stand and continue standing). The apostle''s authority is real but limited — he cannot believe for them. This verse defines pastoral ministry: not domination but joyful partnership.',
   'This verse establishes a crucial principle for Christian leadership: apostolic (and pastoral) authority is never totalitarian. Paul, who possesses the highest authority in the church, explicitly denies the right to lord it over anyone''s faith. Instead, he defines his ministry as partnership aimed at producing joy. The final clause — ''by faith ye stand'' — grounds individual responsibility: each believer stands by his or her own faith, not by the apostle''s command. This principle guards against both authoritarianism and passivity in the church.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 1;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 comfort
  ('παράκλησις', 'paraklēsis', 'G3874', 'Comfort, consolation, encouragement — from para (alongside) + kaleō (to call). One called alongside to help. Used ten times in vv.3-7, making this the most concentrated passage on divine comfort in the NT. God''s comfort is not mere sympathy but active strengthening and encouragement that equips the sufferer for endurance and ministry.', 1),
  ('οἰκτιρμός', 'oiktirmos', 'G3628', 'Mercy, compassion, pity — a deep emotional response to another''s suffering. Used in the plural (oiktirmōn) to indicate the manifold expressions of divine compassion. God is the ''Father of mercies'' — the originator and source of all compassion in the universe.', 2),
  -- v.8 pressed
  ('θλῖψις', 'thlipsis', 'G2347', 'Tribulation, affliction, pressure — literally the pressing of grapes or olives. Metaphorically, the external pressures that crush the believer. Paul was pressed ''beyond measure, beyond strength'' — language that conveys overwhelming, humanly unbearable affliction.', 3),
  -- v.9 raiseth the dead
  ('ἐγείρω', 'egeirō', 'G1453', 'To raise, to awaken — used of raising the dead and of God''s power to deliver from death-like situations. Present participle (egeironti): this is God''s characteristic activity. Paul''s trust is not in probability but in the God whose defining act is resurrection.', 4),
  -- v.12 sincerity
  ('εἰλικρίνεια', 'eilikrineia', 'G1505', 'Sincerity, purity of motive — traditionally derived from heilē (sunlight) + krinō (to judge): that which is judged by sunlight and found pure. Alternatively from eilō (to sift). Paul''s ministry can withstand the brightest scrutiny because it is conducted not in fleshly wisdom but in the grace of God.', 5),
  -- v.20 promises are Yea
  ('ἐπαγγελία', 'epangelia', 'G1860', 'Promise — a divine commitment, an announcement of what God will certainly do. ''All the promises of God in him are yea'' — Christ is the fulfilment and guarantee of every divine promise. The promises are not cancelled, delayed, or modified: in Christ they are definitively affirmed.', 6),
  -- v.22 sealed / earnest
  ('σφραγίζω', 'sphragizō', 'G4972', 'To seal — to stamp with a mark of ownership, authenticity, and protection. In the ancient world, a seal authenticated documents, marked property, and secured contents. God has sealed believers with the Holy Spirit, marking them as his own possession and guaranteeing their security.', 7),
  ('ἀρραβών', 'arrabōn', 'G728', 'Earnest, down payment, pledge — a Semitic loanword (Hebrew ''ērābōn) used in Greek commercial language for a first installment that obligates the payer to complete the full payment. The Holy Spirit is God''s down payment on the believer''s inheritance: his present work guarantees the full inheritance to come.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 1
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3 WHEN 2 THEN 3
    WHEN 3 THEN 8
    WHEN 4 THEN 9
    WHEN 5 THEN 12
    WHEN 6 THEN 20
    WHEN 7 THEN 22 WHEN 8 THEN 22
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 God of all comfort
  (3, 'Psalm 103:13', 1),
  (3, 'Isaiah 51:12', 2),
  (3, 'Romans 15:5', 3),
  -- v.4 comfort cycle
  (4, 'Isaiah 40:1', 4),
  (4, '2 Corinthians 7:6', 5),
  -- v.5 sufferings of Christ
  (5, 'Philippians 3:10', 6),
  (5, 'Colossians 1:24', 7),
  (5, '1 Peter 4:13', 8),
  -- v.8 pressed in Asia
  (8, 'Acts 19:23-31', 9),
  (8, '1 Corinthians 15:32', 10),
  -- v.9 God who raises the dead
  (9, 'Romans 4:17', 11),
  (9, 'Hebrews 11:19', 12),
  -- v.10 three tenses of deliverance
  (10, 'Psalm 34:19', 13),
  (10, '2 Timothy 4:18', 14),
  -- v.12 godly sincerity
  (12, '2 Corinthians 2:17', 15),
  (12, '2 Corinthians 4:2', 16),
  -- v.20 promises in Christ
  (20, 'Romans 15:8', 17),
  (20, 'Galatians 3:16', 18),
  (20, 'Revelation 3:14', 19),
  -- v.21 anointed
  (21, '1 John 2:20', 20),
  (21, '1 John 2:27', 21),
  -- v.22 sealed and earnest
  (22, 'Ephesians 1:13-14', 22),
  (22, 'Ephesians 4:30', 23),
  (22, '2 Corinthians 5:5', 24),
  -- v.24 helpers of joy
  (24, '1 Peter 5:3', 25),
  (24, '3 John 1:8', 26)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 1
  AND v.verse_number = cr.verse_number;
