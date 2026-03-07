-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 15 — The Resurrection of the Dead
-- 58 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 15,
  '1 Corinthians 15 is the greatest sustained argument for bodily resurrection in all of Scripture. Paul begins by restating the gospel he delivered to the Corinthians: ''Christ died for our sins according to the scriptures; and that he was buried, and that he rose again the third day according to the scriptures'' (vv.3-4). He then catalogues the resurrection appearances — to Cephas, the twelve, over five hundred brethren, James, all the apostles, and finally to Paul himself (vv.5-8). Having established the historical fact, Paul argues by reductio ad absurdum: if the dead are not raised, then Christ is not risen; if Christ is not risen, preaching is vain, faith is vain, the apostles are false witnesses, believers are still in their sins, and those who have died in Christ have perished (vv.12-19). But the triumphant ''But now'' of verse 20 reverses everything: ''But now is Christ risen from the dead, and become the firstfruits of them that slept.'' Paul traces the order of resurrection events: Christ the firstfruits, then believers at his coming, then the end when he delivers the kingdom to the Father (vv.23-28). He addresses the nature of the resurrection body through agricultural and celestial analogies: ''It is sown in corruption; it is raised in incorruption'' (v.42). The natural body gives way to a spiritual body, patterned not after the first Adam (a living soul) but the last Adam (a quickening spirit, vv.44-49). The chapter climaxes with a mystery: ''We shall not all sleep, but we shall all be changed, in a moment, in the twinkling of an eye, at the last trump'' (vv.51-52). Death is swallowed up in victory (v.54), its sting removed through Christ (vv.55-57). The chapter closes with the practical exhortation: ''Be ye stedfast, unmoveable, always abounding in the work of the Lord'' (v.58).',
  'The Bodily Resurrection of Christ and of Believers — The Foundation of Christian Hope',
  'ἀνάστασις (anastasis)',
  'Resurrection — from ana (up, again) + histēmi (to stand). Anastasis denotes a standing up again, a rising from the dead. In 1 Corinthians 15, Paul argues that Christ''s bodily resurrection is the foundation of the entire Christian faith. Without it, preaching is empty, faith is futile, and the dead in Christ have perished. But because Christ is risen, he is the ''firstfruits'' guaranteeing the future resurrection of all who belong to him.',
  '["The Gospel of the Resurrection Declared (vv.1-11): Moreover brethren I declare unto you the gospel which I preached unto you which also ye have received and wherein ye stand. For I delivered unto you first of all that which I also received how that Christ died for our sins according to the scriptures and that he was buried and that he rose again the third day according to the scriptures","The Consequences of Denying the Resurrection (vv.12-19): Now if Christ be preached that he rose from the dead how say some among you that there is no resurrection of the dead. If Christ be not risen then is our preaching vain and your faith is also vain. If in this life only we have hope in Christ we are of all men most miserable","Christ the Firstfruits and the Order of Resurrection (vv.20-28): But now is Christ risen from the dead and become the firstfruits of them that slept. For since by man came death by man came also the resurrection of the dead. For as in Adam all die even so in Christ shall all be made alive. The last enemy that shall be destroyed is death","Practical Arguments for the Resurrection (vv.29-34): Else what shall they do which are baptized for the dead if the dead rise not at all. And why stand we in jeopardy every hour. I die daily. Be not deceived evil communications corrupt good manners","The Nature of the Resurrection Body (vv.35-49): It is sown in corruption it is raised in incorruption. It is sown in dishonour it is raised in glory. It is sown a natural body it is raised a spiritual body. The first man Adam was made a living soul the last Adam was made a quickening spirit","The Mystery of Transformation and Final Victory (vv.50-58): Behold I shew you a mystery we shall not all sleep but we shall all be changed in a moment in the twinkling of an eye at the last trump. O death where is thy sting O grave where is thy victory. Therefore my beloved brethren be ye stedfast unmoveable always abounding in the work of the Lord"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 58 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Moreover, brethren, I declare unto you the gospel which I preached unto you, which also ye have received, and wherein ye stand;',
   'Γνωρίζω δὲ ὑμῖν ἀδελφοί τὸ εὐαγγέλιον ὃ εὐηγγελισάμην ὑμῖν ὃ καὶ παρελάβετε ἐν ᾧ καὶ ἑστήκατε',
   'Gnōrizō de hymin adelphoi to euangelion ho euēngelisamen hymin ho kai parelabete en hō kai hestēkate',
   '''I declare'' (gnōrizō — I make known; present tense: Paul is reminding them of what he originally preached). ''Gospel'' (euangelion — good news). Three past actions: Paul preached it, they received it, and they now stand in it. The gospel is not merely information but a foundation on which believers stand.',
   NULL),
  (2, 'By which also ye are saved, if ye keep in memory what I preached unto you, unless ye have believed in vain.',
   'δι᾿ οὗ καὶ σῴζεσθε τίνι λόγῳ εὐηγγελισάμην ὑμῖν εἰ κατέχετε ἐκτὸς εἰ μὴ εἰκῇ ἐπιστεύσατε',
   'di hou kai sōzesthe tini logō euēngelisamen hymin ei katechete ektos ei mē eikē episteusate',
   '''Ye are saved'' (sōzesthe — present passive: you are being saved; salvation as ongoing process). ''Keep in memory'' (katechete — hold fast, retain firmly). ''In vain'' (eikē — without cause, to no purpose). If the Corinthians abandon the resurrection, their entire faith collapses — they would have believed eikē, without substance.',
   NULL),
  (3, 'For I delivered unto you first of all that which I also received, how that Christ died for our sins according to the scriptures;',
   'παρέδωκα γὰρ ὑμῖν ἐν πρώτοις ὃ καὶ παρέλαβον ὅτι Χριστὸς ἀπέθανεν ὑπὲρ τῶν ἁμαρτιῶν ἡμῶν κατὰ τὰς γραφάς',
   'paredōka gar hymin en prōtois ho kai parelabon hoti Christos apethanen hyper tōn hamartiōn hēmōn kata tas graphas',
   '''Delivered'' (paredōka — handed over, transmitted; a technical term for passing on authoritative tradition). ''Received'' (parelabon — received by transmission). ''First of all'' (en prōtois — among the first things, of primary importance). ''According to the scriptures'' (kata tas graphas — in accordance with the Old Testament). The gospel is not Paul''s invention but received tradition anchored in Scripture.',
   'This verse, along with v.4, constitutes the earliest Christian creed — likely pre-Pauline, dating to within a few years of the crucifixion. Four facts define the gospel: (1) Christ died, (2) for our sins, (3) he was buried, (4) he rose the third day. Each is ''according to the scriptures'' — the death fulfils Isaiah 53, Psalm 22; the burial confirms the reality of death; the resurrection fulfils Psalm 16:10, Hosea 6:2. This creedal formula predates all NT writings.'),
  (4, 'And that he was buried, and that he rose again the third day according to the scriptures:',
   'καὶ ὅτι ἐτάφη καὶ ὅτι ἐγήγερται τῇ ἡμέρᾳ τῇ τρίτῃ κατὰ τὰς γραφάς',
   'kai hoti etaphē kai hoti egēgertai tē hēmera tē tritē kata tas graphas',
   '''Was buried'' (etaphē — aorist passive: he was entombed; confirms the reality of his death). ''Rose again'' (egēgertai — perfect passive: he has been raised and remains risen; the perfect tense indicates a completed action with ongoing results). ''The third day'' — a fixed element of the earliest Christian proclamation. ''According to the scriptures'' — Psalm 16:10, Jonah 1:17 (cf. Matthew 12:40), Hosea 6:2.',
   'The perfect tense egēgertai is theologically significant: Christ was raised (by the Father) and remains in his risen state. The resurrection is not a past event with no present reality — Christ is alive now. The burial confirms the death was real (not a swoon), and the empty tomb confirms the resurrection was bodily (not merely spiritual). The fourfold ''that'' (hoti) structure — died, buried, raised, appeared — forms the irreducible core of the apostolic gospel.'),
  (5, 'And that he was seen of Cephas, then of the twelve:',
   'καὶ ὅτι ὤφθη Κηφᾷ εἶτα τοῖς δώδεκα',
   'kai hoti ōphthē Kēpha eita tois dōdeka',
   '''Was seen'' (ōphthē — aorist passive of horaō: he appeared, he was seen, he made himself visible). ''Cephas'' (Kēpha — Aramaic name of Peter). ''The twelve'' — the apostolic circle, though only eleven remained after Judas; the term designates the group. Peter''s priority in the appearance list matches Luke 24:34.',
   NULL),
  (6, 'After that, he was seen of above five hundred brethren at once; of whom the greater part remain unto this present, but some are fallen asleep.',
   'ἔπειτα ὤφθη ἐπάνω πεντακοσίοις ἀδελφοῖς ἐφάπαξ ἐξ ὧν οἱ πλείους μένουσιν ἕως ἄρτι τινὲς δὲ καὶ ἐκοιμήθησαν',
   'epeita ōphthē epanō pentakosiois adelphois ephapax ex hōn hoi pleious menousin heōs arti tines de kai ekoimēthēsan',
   '''Above five hundred'' (epanō pentakosiois — more than 500). ''At once'' (ephapax — at one time, simultaneously; ruling out individual hallucination). ''The greater part remain'' — most of these witnesses were still alive when Paul wrote (c. AD 55), available for cross-examination. ''Fallen asleep'' (ekoimēthēsan — a euphemism for death among believers).',
   NULL),
  (7, 'After that, he was seen of James; then of all the apostles.',
   'ἔπειτα ὤφθη Ἰακώβῳ εἶτα τοῖς ἀποστόλοις πᾶσιν',
   'epeita ōphthē Iakōbō eita tois apostolois pasin',
   '''James'' — the Lord''s brother (Galatians 1:19), who became leader of the Jerusalem church (Acts 15). James was not a believer during Jesus'' earthly ministry (John 7:5); his conversion is best explained by the resurrection appearance mentioned here. ''All the apostles'' — a wider group than ''the twelve,'' perhaps including Barnabas and others.',
   NULL),
  (8, 'And last of all he was seen of me also, as of one born out of due time.',
   'ἔσχατον δὲ πάντων ὡσπερεὶ τῷ ἐκτρώματι ὤφθη κἀμοί',
   'eschaton de pantōn hōsperei tō ektrōmati ōphthē kamoi',
   '''Last of all'' (eschaton pantōn — last of everyone). ''Born out of due time'' (ektrōmati — an abortion, a miscarriage; from ektithrōskō, to miscarry). Paul uses the most demeaning term for himself: he was an abnormal birth, untimely, undeserving. His Damascus road encounter (Acts 9) was the last resurrection appearance, and Paul views himself as the least worthy recipient.',
   NULL),
  (9, 'For I am the least of the apostles, that am not meet to be called an apostle, because I persecuted the church of God.',
   'ἐγὼ γάρ εἰμι ὁ ἐλάχιστος τῶν ἀποστόλων ὃς οὐκ εἰμὶ ἱκανὸς καλεῖσθαι ἀπόστολος διότι ἐδίωξα τὴν ἐκκλησίαν τοῦ θεοῦ',
   'egō gar eimi ho elachistos tōn apostolōn hos ouk eimi hikanos kaleisthai apostolos dioti ediōxa tēn ekklēsian tou theou',
   '''Least'' (elachistos — smallest, most insignificant; superlative of mikros). ''Not meet'' (ouk hikanos — not sufficient, not worthy). ''Persecuted'' (ediōxa — I pursued, I hunted; aorist: a completed past action Paul never forgets). Paul''s humility is genuine — he was a violent persecutor of the church. But this self-assessment sets up the grace declaration of v.10.',
   NULL),
  (10, 'But by the grace of God I am what I am: and his grace which was bestowed upon me was not in vain; but I laboured more abundantly than they all: yet not I, but the grace of God which was with me.',
   'χάριτι δὲ θεοῦ εἰμι ὅ εἰμι καὶ ἡ χάρις αὐτοῦ ἡ εἰς ἐμὲ οὐ κενὴ ἐγενήθη ἀλλὰ περισσότερον αὐτῶν πάντων ἐκοπίασα οὐκ ἐγὼ δὲ ἀλλ᾿ ἡ χάρις τοῦ θεοῦ ἡ σὺν ἐμοί',
   'chariti de theou eimi ho eimi kai hē charis autou hē eis eme ou kenē egenēthē alla perissoterōn autōn pantōn ekopiasa ouk egō de all hē charis tou theou hē syn emoi',
   '''By the grace of God I am what I am'' — one of Paul''s most personal statements. Grace (charis) appears three times in one verse. ''Not in vain'' (ou kenē — not empty, not without effect). ''Laboured more abundantly'' (perissoterōn ekopiasa — I toiled more than all of them). ''Yet not I, but the grace of God'' — Paul credits all his labor to grace. The tension between human effort and divine grace is resolved: grace empowers the labor.',
   NULL),
  (11, 'Therefore whether it were I or they, so we preach, and so ye believed.',
   'εἴτε οὖν ἐγὼ εἴτε ἐκεῖνοι οὕτως κηρύσσομεν καὶ οὕτως ἐπιστεύσατε',
   'eite oun egō eite ekeinoi houtōs kēryssomen kai houtōs episteusate',
   '''Whether I or they'' — it matters not which apostle preaches; the message is the same. ''So we preach'' (houtōs kēryssomen — thus we proclaim; present tense: ongoing proclamation). ''So ye believed'' (houtōs episteusate — thus you believed; aorist: the moment of faith). The unified apostolic testimony to the resurrection is the foundation of Corinthian faith.',
   NULL),
  (12, 'Now if Christ be preached that he rose from the dead, how say some among you that there is no resurrection of the dead?',
   'εἰ δὲ Χριστὸς κηρύσσεται ὅτι ἐκ νεκρῶν ἐγήγερται πῶς λέγουσίν τινες ἐν ὑμῖν ὅτι ἀνάστασις νεκρῶν οὐκ ἔστιν',
   'ei de Christos kēryssetai hoti ek nekrōn egēgertai pōs legousin tines en hymin hoti anastasis nekrōn ouk estin',
   '''Some among you'' (tines en hymin — certain ones in your midst). The problem is not denial of Christ''s resurrection specifically, but denial of bodily resurrection in general. Some Corinthians, likely influenced by Greek philosophy (which disdained the body), denied future bodily resurrection while perhaps affirming spiritual survival. Paul will show that denying general resurrection logically entails denying Christ''s resurrection.',
   NULL),
  (13, 'But if there be no resurrection of the dead, then is Christ not risen:',
   'εἰ δὲ ἀνάστασις νεκρῶν οὐκ ἔστιν οὐδὲ Χριστὸς ἐγήγερται',
   'ei de anastasis nekrōn ouk estin oude Christos egēgertai',
   'Paul''s logic is devastating: if there is no such thing as resurrection of the dead (as a category), then Christ — who was dead — could not have been raised. Christ''s resurrection and the general resurrection stand or fall together. You cannot affirm one while denying the other.',
   NULL),
  (14, 'And if Christ be not risen, then is our preaching vain, and your faith is also vain.',
   'εἰ δὲ Χριστὸς οὐκ ἐγήγερται κενὸν ἄρα τὸ κήρυγμα ἡμῶν κενὴ δὲ καὶ ἡ πίστις ὑμῶν',
   'ei de Christos ouk egēgertai kenon ara to kērygma hēmōn kenē de kai hē pistis hymōn',
   '''Vain'' (kenon — empty, devoid of content, without substance). ''Preaching'' (kērygma — the proclaimed message, the kerygma). If Christ is not risen, the apostolic message is empty words and the Corinthians'' faith is believing in nothing. Paul stakes everything on the bodily resurrection.',
   'Paul draws out the catastrophic implications of denying the resurrection: (1) apostolic preaching is empty (v.14a); (2) faith is empty (v.14b); (3) the apostles are liars (v.15); (4) believers are still in their sins (v.17); (5) the dead in Christ have perished (v.18); (6) Christians are the most pitiable of all people (v.19). Without the resurrection, Christianity offers nothing — not even a noble moral philosophy, because its central claim would be a lie.'),
  (15, 'Yea, and we are found false witnesses of God; because we have testified of God that he raised up Christ: whom he raised not up, if so be that the dead rise not.',
   'εὑρισκόμεθα δὲ καὶ ψευδομάρτυρες τοῦ θεοῦ ὅτι ἐμαρτυρήσαμεν κατὰ τοῦ θεοῦ ὅτι ἤγειρεν τὸν Χριστόν ὃν οὐκ ἤγειρεν εἴπερ ἄρα νεκροὶ οὐκ ἐγείρονται',
   'heuriskometha de kai pseudomartyres tou theou hoti emartyrēsamen kata tou theou hoti ēgeiren ton Christon hon ouk ēgeiren eiper ara nekroi ouk egeirontai',
   '''False witnesses'' (pseudomartyres — liars about God; not merely mistaken but bearing false testimony against God). ''Of God'' (tou theou — against God; testifying kata tou theou, concerning God something untrue). If the dead are not raised, the apostles have attributed to God an act he never performed — a grievous sin.',
   NULL),
  (16, 'For if the dead rise not, then is not Christ raised:',
   'εἰ γὰρ νεκροὶ οὐκ ἐγείρονται οὐδὲ Χριστὸς ἐγήγερται',
   'ei gar nekroi ouk egeirontai oude Christos egēgertai',
   'Paul restates the premise (cf. v.13) for emphasis. The repetition drives home the inseparable link between Christ''s resurrection and the general resurrection. Christ was truly human; if humans cannot rise, neither can he.',
   NULL),
  (17, 'And if Christ be not raised, your faith is vain; ye are yet in your sins.',
   'εἰ δὲ Χριστὸς οὐκ ἐγήγερται ματαία ἡ πίστις ὑμῶν ἔτι ἐστὲ ἐν ταῖς ἁμαρτίαις ὑμῶν',
   'ei de Christos ouk egēgertai mataia hē pistis hymōn eti este en tais hamartiais hymōn',
   '''Vain'' (mataia — futile, purposeless, without result; different word from kenon in v.14 — kenon means empty of content, mataia means empty of result). ''Yet in your sins'' — without the resurrection, Christ''s death accomplished nothing. The resurrection is God''s vindication that Christ''s sacrifice was accepted (cf. Romans 4:25).',
   'This verse establishes the connection between resurrection and justification. If Christ is not raised, sins are not forgiven. Romans 4:25 says Christ ''was raised again for our justification.'' The resurrection is not merely proof that Jesus was right; it is the divine declaration that his atoning death was effective. Without the resurrection, the cross is just another Roman execution, and sinners have no assurance of pardon.'),
  (18, 'Then they also which are fallen asleep in Christ are perished.',
   'ἄρα καὶ οἱ κοιμηθέντες ἐν Χριστῷ ἀπώλοντο',
   'ara kai hoi koimēthentes en Christō apōlonto',
   '''Fallen asleep'' (koimēthentes — having fallen asleep; a Christian euphemism for death, implying awakening). ''In Christ'' — they died as believers. ''Perished'' (apōlonto — are destroyed, are lost forever). If there is no resurrection, believing saints who have died are not ''asleep'' waiting to rise — they are simply gone, destroyed. This is the most emotionally devastating consequence Paul lists.',
   NULL),
  (19, 'If in this life only we have hope in Christ, we are of all men most miserable.',
   'εἰ ἐν τῇ ζωῇ ταύτῃ ἠλπικότες ἐσμὲν ἐν Χριστῷ μόνον ἐλεεινότεροι πάντων ἀνθρώπων ἐσμέν',
   'ei en tē zōē tautē ēlpikotes esmen en Christō monon eleinoteroi pantōn anthrōpōn esmen',
   '''Most miserable'' (eleinoteroi — most pitiable, most to be pitied; comparative used as superlative). ''In this life only'' (en tē zōē tautē monon). If Christian hope is limited to this life, Christians have sacrificed worldly pleasures for nothing. They have endured persecution, hardship, and self-denial for a lie. Paul''s argument reaches its lowest point before the triumphant reversal of v.20.',
   NULL),
  (20, 'But now is Christ risen from the dead, and become the firstfruits of them that slept.',
   'νυνὶ δὲ Χριστὸς ἐγήγερται ἐκ νεκρῶν ἀπαρχὴ τῶν κεκοιμημένων ἐγένετο',
   'nyni de Christos egēgertai ek nekrōn aparchē tōn kekoimēmenōn egeneto',
   '''But now'' (nyni de — the great adversative; this is the turning point of the argument). ''Is risen'' (egēgertai — perfect tense: has been raised and remains risen). ''Firstfruits'' (aparchē — the first portion of the harvest, offered to God as a pledge that the full harvest will follow; cf. Leviticus 23:10-11). ''Them that slept'' (tōn kekoimēmenōn — those who have fallen asleep in death). Christ''s resurrection is not an isolated miracle but the beginning of the harvest — the guarantee that all who are ''in Christ'' will follow.',
   'The ''firstfruits'' metaphor is drawn from the Feast of Firstfruits (Leviticus 23:10-11), celebrated on the day after the Sabbath during Passover week — the very day Christ rose. The firstfruits were the initial sheaf of the harvest, presented to God as a promise that the full harvest was coming. Christ''s resurrection is therefore not just proof of life after death; it is the actual beginning of the eschatological harvest of resurrection. His rising guarantees ours. The dead in Christ are not ''perished'' (v.18) but sleeping, awaiting the full harvest.'),
  (21, 'For since by man came death, by man came also the resurrection of the dead.',
   'ἐπειδὴ γὰρ δι᾿ ἀνθρώπου ὁ θάνατος καὶ δι᾿ ἀνθρώπου ἀνάστασις νεκρῶν',
   'epeidē gar di anthrōpou ho thanatos kai di anthrōpou anastasis nekrōn',
   '''By man'' (di anthrōpou — through a human being). Death entered through one man (Adam), and resurrection comes through another man (Christ). The parallel is deliberate: what was ruined through humanity is restored through humanity. God chose to undo the curse through the same species that brought it.',
   NULL),
  (22, 'For as in Adam all die, even so in Christ shall all be made alive.',
   'ὥσπερ γὰρ ἐν τῷ Ἀδὰμ πάντες ἀποθνῄσκουσιν οὕτως καὶ ἐν τῷ Χριστῷ πάντες ζωοποιηθήσονται',
   'hōsper gar en tō Adam pantes apothnēskousin houtōs kai en tō Christō pantes zōopoiēthēsontai',
   '''In Adam'' (en tō Adam — in solidarity with Adam, in Adam''s headship). ''All die'' (pantes apothnēskousin — present tense: all are dying, death is universal). ''In Christ'' (en tō Christō — in solidarity with Christ). ''Shall all be made alive'' (pantes zōopoiēthēsontai — future passive: all shall be given life). The two ''alls'' are symmetrical in scope but defined by their respective heads: all who are in Adam die; all who are in Christ shall live.',
   'This verse establishes the two-Adam theology that Paul develops further in vv.45-49 (cf. Romans 5:12-21). Adam is the head of the old humanity under death; Christ is the head of the new humanity under life. The ''all'' in each clause refers to those who belong to each head. ''All in Adam'' = all humanity without exception (universal death). ''All in Christ'' = all who belong to Christ by faith (universal resurrection life for believers). This is not universalism but federal headship: your destiny depends on which Adam you belong to.'),
  (23, 'But every man in his own order: Christ the firstfruits; afterward they that are Christ''s at his coming.',
   'ἕκαστος δὲ ἐν τῷ ἰδίῳ τάγματι ἀπαρχὴ Χριστός ἔπειτα οἱ τοῦ Χριστοῦ ἐν τῇ παρουσίᾳ αὐτοῦ',
   'hekastos de en tō idiō tagmati aparchē Christos epeita hoi tou Christou en tē parousia autou',
   '''Order'' (tagmati — rank, military order of march; from tassō, to arrange). ''Firstfruits'' (aparchē) — Christ rose first. ''Afterward'' (epeita — then, next in sequence). ''At his coming'' (en tē parousia autou — at his arrival, his presence; parousia was used for a king''s official visit). The resurrection follows a military order: Christ the vanguard, then believers at the Parousia.',
   NULL),
  (24, 'Then cometh the end, when he shall have delivered up the kingdom to God, even the Father; when he shall have put down all rule and all authority and power.',
   'εἶτα τὸ τέλος ὅταν παραδῷ τὴν βασιλείαν τῷ θεῷ καὶ πατρί ὅταν καταργήσῃ πᾶσαν ἀρχὴν καὶ πᾶσαν ἐξουσίαν καὶ δύναμιν',
   'eita to telos hotan paradō tēn basileian tō theō kai patri hotan katargēsē pasan archēn kai pasan exousian kai dynamin',
   '''The end'' (to telos — the culmination, the final stage). ''Delivered up'' (paradō — hands over). ''The kingdom'' (tēn basileian — the messianic kingdom). ''Put down'' (katargēsē — rendered inoperative, abolished). ''All rule and all authority and power'' — every hostile spiritual and earthly power. Christ reigns now (v.25), conquering every enemy, until the final act: delivering the completed kingdom to the Father.',
   NULL),
  (25, 'For he must reign, till he hath put all enemies under his feet.',
   'δεῖ γὰρ αὐτὸν βασιλεύειν ἄχρι οὗ ἂν θῇ πάντας τοὺς ἐχθροὺς ὑπὸ τοὺς πόδας αὐτοῦ',
   'dei gar auton basileuein achri hou an thē pantas tous echthrous hypo tous podas autou',
   '''He must reign'' (dei auton basileuein — it is divinely necessary for him to rule). ''Till'' (achri hou — until). Quoting Psalm 110:1: God said to the Messiah, ''Sit at my right hand, till I make thine enemies thy footstool.'' Christ''s present reign is not passive waiting but active subjugation of all opposing powers.',
   NULL),
  (26, 'The last enemy that shall be destroyed is death.',
   'ἔσχατος ἐχθρὸς καταργεῖται ὁ θάνατος',
   'eschatos echthros katargeitai ho thanatos',
   '''Last enemy'' (eschatos echthros — death is the final foe). ''Destroyed'' (katargeitai — present passive: is being destroyed, is in the process of abolition). Death entered through Adam (v.21); death will be the last power abolished by Christ. The resurrection of believers is the moment death is finally defeated — not merely survived but destroyed.',
   'Death is personified as an enemy — the final and most formidable one. Every other enemy (sin, Satan, hostile powers) will be conquered before death. The resurrection is the ultimate victory: not escape from death but the destruction of death itself. Revelation 20:14 portrays death being cast into the lake of fire. Isaiah 25:8 prophesied: ''He will swallow up death in victory'' — the very text Paul quotes in v.54.'),
  (27, 'For he hath put all things under his feet. But when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him.',
   'πάντα γὰρ ὑπέταξεν ὑπὸ τοὺς πόδας αὐτοῦ ὅταν δὲ εἴπῃ ὅτι πάντα ὑποτέτακται δῆλον ὅτι ἐκτὸς τοῦ ὑποτάξαντος αὐτῷ τὰ πάντα',
   'panta gar hypetaxen hypo tous podas autou hotan de eipē hoti panta hypotetaktai dēlon hoti ektos tou hypotaxantos autō ta panta',
   'Quoting Psalm 8:6: God has put all things under the Messiah''s feet. ''He is excepted'' (ektos — except, excluding) — the Father who subjects all things to the Son is not himself subject to the Son. Paul carefully preserves the Father-Son distinction within the Godhead: the Son exercises universal dominion delegated by the Father.',
   NULL),
  (28, 'And when all things shall be subdued unto him, then shall the Son also himself be subject unto him that put all things under him, that God may be all in all.',
   'ὅταν δὲ ὑποταγῇ αὐτῷ τὰ πάντα τότε καὶ αὐτὸς ὁ υἱὸς ὑποταγήσεται τῷ ὑποτάξαντι αὐτῷ τὰ πάντα ἵνα ᾖ ὁ θεὸς τὰ πάντα ἐν πᾶσιν',
   'hotan de hypotagē autō ta panta tote kai autos ho huios hypotagēsetai tō hypotaxanti autō ta panta hina ē ho theos ta panta en pasin',
   '''The Son himself shall be subject'' (ho huios hypotagēsetai — the Son will voluntarily subordinate himself). ''That God may be all in all'' (hina ē ho theos ta panta en pasin — so that God may be everything in everything). The Son''s subjection is not ontological inferiority but the completion of the mediatorial kingdom: having accomplished redemption, the Son returns the kingdom to the Father.',
   'This verse describes the ultimate telos of cosmic history: God being ''all in all.'' The Son''s mediatorial reign — which began at the ascension and continues through the present age — reaches its goal when all enemies are defeated and the kingdom is returned to the Father. The Son''s submission is voluntary and functional (pertaining to his mediatorial role), not a denial of his divine nature. The Trinity is not dissolved but fully displayed: the Son glorifies the Father, and God permeates all reality without rival.'),
  (29, 'Else what shall they do which are baptized for the dead, if the dead rise not at all? why are they then baptized for the dead?',
   'ἐπεὶ τί ποιήσουσιν οἱ βαπτιζόμενοι ὑπὲρ τῶν νεκρῶν εἰ ὅλως νεκροὶ οὐκ ἐγείρονται τί καὶ βαπτίζονται ὑπὲρ τῶν νεκρῶν',
   'epei ti poiēsousin hoi baptizomenoi hyper tōn nekrōn ei holōs nekroi ouk egeirontai ti kai baptizontai hyper tōn nekrōn',
   '''Baptized for the dead'' (baptizomenoi hyper tōn nekrōn) — one of the most debated phrases in the NT. Over 200 interpretations exist. Most likely Paul refers to a practice at Corinth (which he neither endorses nor condemns) of being baptized on behalf of deceased believers, and uses it as an ad hominem argument: even this practice presupposes resurrection. ''If the dead rise not at all'' — the practice makes no sense if there is no resurrection.',
   NULL),
  (30, 'And why stand we in jeopardy every hour?',
   'τί καὶ ἡμεῖς κινδυνεύομεν πᾶσαν ὥραν',
   'ti kai hēmeis kindyneuomen pasan hōran',
   '''In jeopardy'' (kindyneuomen — we face danger, we risk our lives). ''Every hour'' (pasan hōran — at all times). Paul shifts to personal testimony: if there is no resurrection, why do the apostles risk their lives constantly? Suffering for a dead Messiah who stays dead is irrational.',
   NULL),
  (31, 'I protest by your rejoicing which I have in Christ Jesus our Lord, I die daily.',
   'καθ᾿ ἡμέραν ἀποθνῄσκω νὴ τὴν ὑμετέραν καύχησιν ἣν ἔχω ἐν Χριστῷ Ἰησοῦ τῷ κυρίῳ ἡμῶν',
   'kath hēmeran apothnēskō nē tēn hymeteran kauchēsin hēn echō en Christō Iēsou tō kyriō hēmōn',
   '''I die daily'' (kath hēmeran apothnēskō — every day I face death). ''I protest'' (nē — an oath formula: I swear by). ''Your rejoicing'' (tēn hymeteran kauchēsin — the boasting I have in you). Paul swears by his pride in the Corinthian church that he faces death every single day. This constant danger only makes sense if resurrection awaits.',
   NULL),
  (32, 'If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.',
   'εἰ κατὰ ἄνθρωπον ἐθηριομάχησα ἐν Ἐφέσῳ τί μοι τὸ ὄφελος εἰ νεκροὶ οὐκ ἐγείρονται φάγωμεν καὶ πίωμεν αὔριον γὰρ ἀποθνῄσκομεν',
   'ei kata anthrōpon ethēriomachēsa en Ephesō ti moi to ophelos ei nekroi ouk egeirontai phagōmen kai piōmen aurion gar apothnēskomen',
   '''Fought with beasts'' (ethēriomachēsa — fought wild animals; likely metaphorical for fierce human opposition at Ephesus, cf. Acts 19). ''What advantageth it me'' (ti moi to ophelos — what profit is it to me). ''Let us eat and drink'' — quoting Isaiah 22:13, the philosophy of despair. Without resurrection, hedonism is the only rational lifestyle. Paul exposes the logical end of denying the resurrection.',
   NULL),
  (33, 'Be not deceived: evil communications corrupt good manners.',
   'μὴ πλανᾶσθε φθείρουσιν ἤθη χρηστὰ ὁμιλίαι κακαί',
   'mē planasthe phtheirousin ēthē chrēsta homiliai kakai',
   '''Be not deceived'' (mē planasthe — stop being led astray; present passive imperative). ''Evil communications'' (homiliai kakai — bad company, corrupt associations). ''Good manners'' (ēthē chrēsta — good morals, upright character). Paul quotes the Greek poet Menander (Thais, fragment 218). Associating with those who deny the resurrection corrupts moral living, because without resurrection, there is no ultimate accountability.',
   NULL),
  (34, 'Awake to righteousness, and sin not; for some have not the knowledge of God: I speak this to your shame.',
   'ἐκνήψατε δικαίως καὶ μὴ ἁμαρτάνετε ἀγνωσίαν γὰρ θεοῦ τινες ἔχουσιν πρὸς ἐντροπὴν ὑμῖν λέγω',
   'eknēpsate dikaiōs kai mē hamartanete agnōsian gar theou tines echousin pros entropēn hymin legō',
   '''Awake to righteousness'' (eknēpsate dikaiōs — sober up as you should; eknēpsate from eknēphō, to become sober after intoxication). ''Sin not'' (mē hamartanete — stop sinning; present imperative). ''Not the knowledge of God'' (agnōsian theou — ignorance of God). ''To your shame'' (pros entropēn — for your turning inward, i.e., to make you ashamed). Some in Corinth are functionally ignorant of God — a stinging rebuke to a church that prized knowledge (gnōsis).',
   NULL),
  (35, 'But some man will say, How are the dead raised up? and with what body do they come?',
   'ἀλλ᾿ ἐρεῖ τις πῶς ἐγείρονται οἱ νεκροί ποίῳ δὲ σώματι ἔρχονται',
   'all erei tis pōs egeirontai hoi nekroi poiō de sōmati erchontai',
   'Paul anticipates two objections: (1) How is resurrection possible? (pōs egeirontai — by what mechanism?), and (2) What kind of body will the raised have? (poiō sōmati — with what sort of body?). The first question doubts the possibility; the second doubts the desirability. Paul answers both with analogies from nature and revelation.',
   NULL),
  (36, 'Thou fool, that which thou sowest is not quickened, except it die:',
   'ἄφρον σὺ ὃ σπείρεις οὐ ζωοποιεῖται ἐὰν μὴ ἀποθάνῃ',
   'aphrōn sy ho speireis ou zōopoieitai ean mē apothanē',
   '''Thou fool'' (aphrōn — senseless one; not an insult but a rebuke for failing to observe what nature teaches). ''Sowest'' (speireis — you sow seed). ''Quickened'' (zōopoieitai — made alive, given life). ''Except it die'' (ean mē apothanē — unless it dies). The seed must die in the ground before it can produce new life. Death is not the end but the necessary precondition for a greater form of life. Jesus used the same analogy (John 12:24).',
   NULL),
  (37, 'And that which thou sowest, thou sowest not that body that shall be, but bare grain, it may chance of wheat, or of some other grain:',
   'καὶ ὃ σπείρεις οὐ τὸ σῶμα τὸ γενησόμενον σπείρεις ἀλλὰ γυμνὸν κόκκον εἰ τύχοι σίτου ἤ τινος τῶν λοιπῶν',
   'kai ho speireis ou to sōma to genēsomenon speireis alla gymnon kokkon ei tychoi sitou ē tinos tōn loipōn',
   '''Not that body that shall be'' — the seed you plant does not look like the plant that grows from it. ''Bare grain'' (gymnon kokkon — a naked kernel). The body that is buried is not the body that will be raised, just as a wheat kernel does not resemble the wheat stalk and head it produces. There is continuity (same organism) but radical transformation (different form).',
   NULL),
  (38, 'But God giveth it a body as it hath pleased him, and to every seed his own body.',
   'ὁ δὲ θεὸς αὐτῷ δίδωσιν σῶμα καθὼς ἠθέλησεν καὶ ἑκάστῳ τῶν σπερμάτων τὸ ἴδιον σῶμα',
   'ho de theos autō didōsin sōma kathōs ēthelēsen kai hekastō tōn spermatōn to idion sōma',
   '''God giveth it a body'' — the resurrection body is God''s sovereign gift, not a natural development. ''As it hath pleased him'' (kathōs ēthelēsen — as he willed; aorist: God determined this in his eternal purpose). ''His own body'' (to idion sōma — its own distinctive body). Each seed produces a body appropriate to its nature. God has prepared a body suited for the resurrection life.',
   NULL),
  (39, 'All flesh is not the same flesh: but there is one kind of flesh of men, another flesh of beasts, another of fishes, and another of birds.',
   'οὐ πᾶσα σὰρξ ἡ αὐτὴ σάρξ ἀλλὰ ἄλλη μὲν σὰρξ ἀνθρώπων ἄλλη δὲ σὰρξ κτηνῶν ἄλλη δὲ ἰχθύων ἄλλη δὲ πτηνῶν',
   'ou pasa sarx hē autē sarx alla allē men sarx anthrōpōn allē de sarx ktēnōn allē de ichthyōn allē de ptēnōn',
   'Paul expands the analogy: even in the present creation, God has designed different kinds of bodies for different environments. Human flesh, animal flesh, fish flesh, bird flesh — each is adapted to its sphere. If God can create such variety now, he can certainly create a body suited for the resurrection world.',
   NULL),
  (40, 'There are also celestial bodies, and bodies terrestrial: but the glory of the celestial is one, and the glory of the terrestrial is another.',
   'καὶ σώματα ἐπουράνια καὶ σώματα ἐπίγεια ἀλλ᾿ ἑτέρα μὲν ἡ τῶν ἐπουρανίων δόξα ἑτέρα δὲ ἡ τῶν ἐπιγείων',
   'kai sōmata epourania kai sōmata epigeia all hetera men hē tōn epouraniōn doxa hetera de hē tōn epigeiōn',
   '''Celestial bodies'' (sōmata epourania — heavenly bodies: sun, moon, stars). ''Terrestrial'' (epigeia — earthly). ''Glory'' (doxa — splendor, radiance). Heavenly and earthly bodies each have their own kind of glory. The point: the resurrection body will have a different kind of glory than the present earthly body. Different does not mean lesser — it means appropriate to a different realm.',
   NULL),
  (41, 'There is one glory of the sun, and another glory of the moon, and another glory of the stars: for one star differeth from another star in glory.',
   'ἄλλη δόξα ἡλίου καὶ ἄλλη δόξα σελήνης καὶ ἄλλη δόξα ἀστέρων ἀστὴρ γὰρ ἀστέρος διαφέρει ἐν δόξῃ',
   'allē doxa hēliou kai allē doxa selēnēs kai allē doxa asterōn astēr gar asteros diapherei en doxē',
   'Even among celestial bodies there are gradations of glory: sun, moon, and stars each differ in brilliance. ''One star differeth from another'' — variety within glory. This prepares for the contrast between the present body (sown) and the resurrection body (raised): same person, vastly different glory.',
   NULL),
  (42, 'So also is the resurrection of the dead. It is sown in corruption; it is raised in incorruption:',
   'οὕτως καὶ ἡ ἀνάστασις τῶν νεκρῶν σπείρεται ἐν φθορᾷ ἐγείρεται ἐν ἀφθαρσίᾳ',
   'houtōs kai hē anastasis tōn nekrōn speiretai en phthora egeiretai en aphtharsia',
   '''So also'' — Paul now applies the analogies. ''Sown'' (speiretai — sowed, planted; burial is a sowing). ''Corruption'' (phthora — decay, decomposition, perishability). ''Incorruption'' (aphtharsia — imperishability, freedom from decay). The first of four contrasts between the present body and the resurrection body: perishable → imperishable.',
   'Verses 42-44 present four contrasts that define the transformation from present body to resurrection body: (1) corruption → incorruption (perishable → imperishable); (2) dishonour → glory (humiliation → splendor); (3) weakness → power (frailty → might); (4) natural body → spiritual body (soul-animated → Spirit-animated). The resurrection body is not less physical but more — it is the perfection of embodied existence, free from every limitation imposed by sin and death.'),
  (43, 'It is sown in dishonour; it is raised in glory: it is sown in weakness; it is raised in power:',
   'σπείρεται ἐν ἀτιμίᾳ ἐγείρεται ἐν δόξῃ σπείρεται ἐν ἀσθενείᾳ ἐγείρεται ἐν δυνάμει',
   'speiretai en atimia egeiretai en doxē speiretai en astheneia egeiretai en dynamei',
   '''Dishonour'' (atimia — without honor, ignoble; the corpse is humiliated by death and decay). ''Glory'' (doxē — splendor, radiance). ''Weakness'' (astheneia — frailty, feebleness; the body is vulnerable to disease, aging, death). ''Power'' (dynamei — might, strength). Two more contrasts: the body that was subject to shame and weakness will be raised in radiant glory and divine power.',
   NULL),
  (44, 'It is sown a natural body; it is raised a spiritual body. There is a natural body, and there is a spiritual body.',
   'σπείρεται σῶμα ψυχικόν ἐγείρεται σῶμα πνευματικόν ἔστιν σῶμα ψυχικόν καὶ ἔστιν σῶμα πνευματικόν',
   'speiretai sōma psychikon egeiretai sōma pneumatikon estin sōma psychikon kai estin sōma pneumatikon',
   '''Natural body'' (sōma psychikon — a soul-animated body; psychikon from psychē, soul; the body animated and governed by the natural human soul). ''Spiritual body'' (sōma pneumatikon — a Spirit-animated body; pneumatikon from pneuma, Spirit; the body animated and governed by the Holy Spirit). ''Spiritual'' does not mean immaterial or ghostly — it means empowered and directed by the Spirit of God. The resurrection body is still a body (sōma), but one perfectly responsive to the Spirit.',
   'The contrast between psychikon and pneumatikon is not between physical and non-physical, but between the animating principle. The present body is psychikon — driven by the natural soul (psychē), subject to its limitations, appetites, and mortality. The resurrection body is pneumatikon — driven by the Holy Spirit (pneuma), sharing in the Spirit''s power, holiness, and immortality. Paul does not teach a disembodied afterlife but a re-embodied, Spirit-transformed existence. This is the Christian hope: not escape from the body but the glorification of the body.'),
  (45, 'And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit.',
   'οὕτως καὶ γέγραπται ἐγένετο ὁ πρῶτος ἄνθρωπος Ἀδὰμ εἰς ψυχὴν ζῶσαν ὁ ἔσχατος Ἀδὰμ εἰς πνεῦμα ζωοποιοῦν',
   'houtōs kai gegraptai egeneto ho prōtos anthrōpos Adam eis psychēn zōsan ho eschatos Adam eis pneuma zōopoioun',
   'Quoting Genesis 2:7 and adding his own christological counterpart. ''A living soul'' (psychēn zōsan — Adam received life; he was a recipient). ''A quickening spirit'' (pneuma zōopoioun — a life-giving spirit; Christ gives life; he is a source). Adam was animated by life; Christ animates others with life. The ''last Adam'' (eschatos Adam) is Christ — the final, definitive representative of a new humanity.',
   'The ''two Adam'' Christology is one of Paul''s most important theological contributions. The first Adam was the head of the old creation, given life (psychēn zōsan) but unable to sustain it against death. The last Adam is the head of the new creation, himself the source of resurrection life (pneuma zōopoioun). ''Last'' (eschatos) means there will be no other — Christ is the final Adam, the definitive human. All who are united to him share in his life-giving power.'),
  (46, 'Howbeit that was not first which is spiritual, but that which is natural; and afterward that which is spiritual.',
   'ἀλλ᾿ οὐ πρῶτον τὸ πνευματικόν ἀλλὰ τὸ ψυχικόν ἔπειτα τὸ πνευματικόν',
   'all ou prōton to pneumatikon alla to psychikon epeita to pneumatikon',
   'The order is divinely established: natural first, then spiritual. The psychikon body comes before the pneumatikon body. This counters any Platonic notion that the spiritual pre-existed and the physical is a fall from it. In God''s design, the physical comes first as preparation for the spiritual — the earthly body is the seed for the heavenly one.',
   NULL),
  (47, 'The first man is of the earth, earthy: the second man is the Lord from heaven.',
   'ὁ πρῶτος ἄνθρωπος ἐκ γῆς χοϊκός ὁ δεύτερος ἄνθρωπος ὁ κύριος ἐξ οὐρανοῦ',
   'ho prōtos anthrōpos ek gēs choikos ho deuteros anthrōpos ho kyrios ex ouranou',
   '''Of the earth'' (ek gēs — from the ground). ''Earthy'' (choikos — made of dust, from chous/soil; cf. Genesis 2:7). ''The second man'' (ho deuteros anthrōpos — the second representative human). ''The Lord from heaven'' (ho kyrios ex ouranou — the Lord who is from heaven). Adam''s origin is earthly; Christ''s origin is heavenly. This determines the character of those who belong to each.',
   NULL),
  (48, 'As is the earthy, such are they also that are earthy: and as is the heavenly, such are they also that are heavenly.',
   'οἷος ὁ χοϊκός τοιοῦτοι καὶ οἱ χοϊκοί καὶ οἷος ὁ ἐπουράνιος τοιοῦτοι καὶ οἱ ἐπουράνιοι',
   'hoios ho choikos toioutoi kai hoi choikoi kai hoios ho epouranios toioutoi kai hoi epouranioi',
   '''As is the earthy'' — those who belong to Adam share his earthy nature: made of dust, subject to decay and death. ''As is the heavenly'' — those who belong to Christ will share his heavenly nature: imperishable, glorious, powerful. Your representative determines your destiny. The logic is federal headship: the head defines the members.',
   NULL),
  (49, 'And as we have borne the image of the earthy, we shall also bear the image of the heavenly.',
   'καὶ καθὼς ἐφορέσαμεν τὴν εἰκόνα τοῦ χοϊκοῦ φορέσομεν καὶ τὴν εἰκόνα τοῦ ἐπουρανίου',
   'kai kathōs ephoresamen tēn eikona tou choikou phoresomen kai tēn eikona tou epouraniou',
   '''Borne the image'' (ephoresamen tēn eikona — we have worn the likeness). ''Of the earthy'' (tou choikou — of the dust-man Adam). ''We shall bear'' (phoresomen — future: we will wear). ''The image of the heavenly'' (tēn eikona tou epouraniou — the likeness of the heavenly Christ). Just as certainly as we now bear Adam''s mortal image, we will bear Christ''s resurrection image. This is the hope of glorification (cf. Romans 8:29, Philippians 3:21).',
   NULL),
  (50, 'Now this I say, brethren, that flesh and blood cannot inherit the kingdom of God; neither doth corruption inherit incorruption.',
   'τοῦτο δέ φημι ἀδελφοί ὅτι σὰρξ καὶ αἷμα βασιλείαν θεοῦ κληρονομῆσαι οὐ δύνανται οὐδὲ ἡ φθορὰ τὴν ἀφθαρσίαν κληρονομεῖ',
   'touto de phēmi adelphoi hoti sarx kai haima basileian theou klēronomēsai ou dynantai oude hē phthora tēn aphtharsian klēronomei',
   '''Flesh and blood'' (sarx kai haima — mortal human nature in its present frail condition). ''Cannot inherit'' (ou dynantai klēronomēsai — are unable to receive as inheritance). ''The kingdom of God'' — the eschatological realm. Mortal, perishable bodies are unsuited for the imperishable kingdom. This is why transformation is necessary — not just spiritual renewal but bodily transformation.',
   'Paul is not saying the body is evil or that the resurrection is non-physical. ''Flesh and blood'' is an idiom for mortal human nature (cf. Matthew 16:17, Galatians 1:16). The problem is not physicality but perishability. The body must be changed from perishable to imperishable, from mortal to immortal. This verse sets up the ''mystery'' of vv.51-52: the transformation that will make embodied existence fit for eternity.'),
  (51, 'Behold, I shew you a mystery; We shall not all sleep, but we shall all be changed,',
   'ἰδοὺ μυστήριον ὑμῖν λέγω πάντες μὲν οὐ κοιμηθησόμεθα πάντες δὲ ἀλλαγησόμεθα',
   'idou mystērion hymin legō pantes men ou koimēthēsometha pantes de allagēsometha',
   '''Mystery'' (mystērion — a divine secret now revealed). ''We shall not all sleep'' (ou koimēthēsometha — not all will die). ''We shall all be changed'' (pantes allagēsometha — all will be transformed). This is new revelation: not every believer will die before Christ returns. But every believer — whether dead or alive at the Parousia — will be transformed. The change is universal for believers; death is not.',
   'This is one of the key eschatological revelations in Paul''s writings. A ''mystery'' in Paul is not something mysterious but a previously hidden divine plan now disclosed. The mystery has two elements: (1) Not all Christians will experience death — some will be alive at Christ''s return; (2) All Christians will be bodily transformed — the dead raised imperishable, the living instantaneously changed. This parallels 1 Thessalonians 4:15-17: ''We which are alive and remain shall be caught up together with them.'''),
  (52, 'In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.',
   'ἐν ἀτόμῳ ἐν ῥιπῇ ὀφθαλμοῦ ἐν τῇ ἐσχάτῃ σάλπιγγι σαλπίσει γάρ καὶ οἱ νεκροὶ ἐγερθήσονται ἄφθαρτοι καὶ ἡμεῖς ἀλλαγησόμεθα',
   'en atomō en rhipē ophthalmou en tē eschatē salpingi salpisei gar kai hoi nekroi egerthēsontai aphthartoi kai hēmeis allagēsometha',
   '''In a moment'' (en atomō — in an indivisible instant; atomos from a-tomos, uncuttable — the smallest conceivable unit of time). ''Twinkling of an eye'' (rhipē ophthalmou — a rapid movement, a blink). ''The last trump'' (tē eschatē salpingi — the final trumpet; connected with the trumpet of God in 1 Thessalonians 4:16). ''Incorruptible'' (aphthartoi — imperishable). The transformation will be instantaneous, triggered by the last trumpet of the eschatological consummation.',
   NULL),
  (53, 'For this corruptible must put on incorruption, and this mortal must put on immortality.',
   'δεῖ γὰρ τὸ φθαρτὸν τοῦτο ἐνδύσασθαι ἀφθαρσίαν καὶ τὸ θνητὸν τοῦτο ἐνδύσασθαι ἀθανασίαν',
   'dei gar to phtharton touto endysasthai aphtharsian kai to thnēton touto endysasthai athanasian',
   '''Must'' (dei — it is divinely necessary). ''Put on'' (endysasthai — to clothe oneself in, to be invested with; the metaphor of putting on a garment). ''Incorruption'' (aphtharsian — imperishability). ''Immortality'' (athanasian — deathlessness; from a + thanatos, no death). The mortal body is not discarded but clothed over with immortality — transformation, not replacement.',
   NULL),
  (54, 'So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory.',
   'ὅταν δὲ τὸ φθαρτὸν τοῦτο ἐνδύσηται ἀφθαρσίαν καὶ τὸ θνητὸν τοῦτο ἐνδύσηται ἀθανασίαν τότε γενήσεται ὁ λόγος ὁ γεγραμμένος κατεπόθη ὁ θάνατος εἰς νῖκος',
   'hotan de to phtharton touto endysētai aphtharsian kai to thnēton touto endysētai athanasian tote genēsetai ho logos ho gegrammenos katepothē ho thanatos eis nikos',
   '''Swallowed up'' (katepothē — devoured, consumed completely). ''In victory'' (eis nikos — into victory, resulting in victory). Quoting Isaiah 25:8: ''He will swallow up death in victory.'' The transformation of the body at the resurrection is the moment Isaiah''s prophecy is fulfilled. Death, which swallowed every human being since Adam, is itself swallowed — consumed by the victory of Christ''s resurrection.',
   'This is the prophetic fulfilment moment. Isaiah 25:8 prophesied that God would ''swallow up death in victory'' — a promise made centuries before Christ. Paul declares that this prophecy will be fulfilled at the bodily resurrection/transformation of believers. The resurrection is not merely a reversal of death but a total victory over it. Death is not just overcome (survived) but destroyed (consumed). The verb katepothē (swallowed up) is violently final — death itself dies.'),
  (55, 'O death, where is thy sting? O grave, where is thy victory?',
   'ποῦ σου θάνατε τὸ κέντρον ποῦ σου ᾅδη τὸ νῖκος',
   'pou sou thanate to kentron pou sou hadē to nikos',
   '''Sting'' (kentron — a goad, a sharp point, a stinger; the weapon death uses to inflict harm). ''Grave'' (hadē — Hades, the realm of the dead). ''Victory'' (nikos — conquest, triumph). Paul taunts death with Hosea 13:14: where is your weapon? where is your triumph? The sting has been drawn, the victory forfeited. Death is now a defeated enemy that believers can taunt.',
   NULL),
  (56, 'The sting of death is sin; and the strength of sin is the law.',
   'τὸ δὲ κέντρον τοῦ θανάτου ἡ ἁμαρτία ἡ δὲ δύναμις τῆς ἁμαρτίας ὁ νόμος',
   'to de kentron tou thanatou hē hamartia hē de dynamis tēs hamartias ho nomos',
   '''The sting of death is sin'' — death''s power to harm comes from sin (because ''the wages of sin is death,'' Romans 6:23). ''The strength of sin is the law'' — sin derives its condemning power from the law (because the law reveals sin and pronounces its penalty, Romans 7:7-11). The chain: law empowers sin → sin produces death. Christ breaks the chain by fulfilling the law and atoning for sin, thereby disarming death.',
   'This compressed theological statement encapsulates the argument of Romans 5-7 in a single sentence. Three enemies form a chain: law → sin → death. The law gives sin its legal power (it defines transgression and pronounces judgment). Sin gives death its sting (death is the penalty of sin). But Christ has dealt with all three: he fulfilled the law (Romans 10:4), bore our sin (2 Corinthians 5:21), and destroyed death (v.26). Because the sting is removed, death can no longer harm the believer.'),
  (57, 'But thanks be to God, which giveth us the victory through our Lord Jesus Christ.',
   'τῷ δὲ θεῷ χάρις τῷ διδόντι ἡμῖν τὸ νῖκος διὰ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ',
   'tō de theō charis tō didonti hēmin to nikos dia tou kyriou hēmōn Iēsou Christou',
   '''Thanks be to God'' (tō theō charis — grace/gratitude to God). ''Which giveth'' (tō didonti — present participle: who keeps on giving; the victory is a continuous gift). ''The victory'' (to nikos — the conquest over death). ''Through our Lord Jesus Christ'' (dia tou kyriou hēmōn Iēsou Christou — through the agency of Christ). Victory over death is not earned but given by God through Christ. The chapter that began with the gospel (vv.1-4) ends with thanksgiving for its triumph.',
   NULL),
  (58, 'Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of the Lord, forasmuch as ye know that your labour is not in vain in the Lord.',
   'ὥστε ἀδελφοί μου ἀγαπητοί ἑδραῖοι γίνεσθε ἀμετακίνητοι περισσεύοντες ἐν τῷ ἔργῳ τοῦ κυρίου πάντοτε εἰδότες ὅτι ὁ κόπος ὑμῶν οὐκ ἔστιν κενὸς ἐν κυρίῳ',
   'hōste adelphoi mou agapētoi hedraioi ginesthe ametakinētoi perisseuontes en tō ergō tou kyriou pantote eidotes hoti ho kopos hymōn ouk estin kenos en kyriō',
   '''Therefore'' (hōste — consequently; the practical conclusion drawn from the resurrection). ''Stedfast'' (hedraioi — firmly seated, immovable in conviction). ''Unmoveable'' (ametakinētoi — not to be shifted from your position). ''Abounding'' (perisseuontes — overflowing, excelling). ''Not in vain'' (ouk kenos — not empty, not without result). Because the resurrection is true, labor for Christ has eternal significance. The resurrection transforms ethics: every act of service matters forever.',
   'This final verse is the practical application of the entire chapter. ''Therefore'' connects resurrection theology to daily living. If Christ is not risen, labor for the Lord is pointless (v.14, v.17, v.19, v.32). But because Christ is risen, ''your labour is not in vain in the Lord.'' The resurrection guarantees that nothing done for Christ is wasted — every prayer, every sacrifice, every act of obedience echoes into eternity. This is the ultimate motivation for Christian perseverance: the certainty of resurrection makes present suffering meaningful and present labor fruitful.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 15;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 gospel tradition
  ('εὐαγγέλιον', 'euangelion', 'G2098', 'Gospel, good news — from eu (good) + angelia (message). In 1 Corinthians 15:1-4, Paul defines the gospel content: Christ died for our sins, was buried, and rose the third day, all according to Scripture. The euangelion is not advice or philosophy but the announcement of a historical event with cosmic significance. Paul ''received'' it (parelabon) and ''delivered'' it (paredōka) — it is authoritative tradition, not personal invention.', 1),
  -- v.20 firstfruits
  ('ἀπαρχή', 'aparchē', 'G536', 'Firstfruits, the first portion of the harvest — from apo (from) + archē (beginning). Drawn from the Feast of Firstfruits (Leviticus 23:10-11), where the first sheaf of grain was offered to God as a pledge that the full harvest would follow. Christ''s resurrection is the aparchē of the eschatological harvest: he is the first to rise in a glorified body, guaranteeing that all who belong to him will follow at his coming (v.23).', 2),
  -- v.44 natural body
  ('ψυχικός', 'psychikos', 'G5591', 'Natural, soul-ish, pertaining to the psychē (soul) — from psychē (soul, natural life). The sōma psychikon is the body animated and governed by the natural human soul, subject to its appetites, limitations, and mortality. It is contrasted with sōma pneumatikon (Spirit-animated body). Psychikos does not mean sinful but limited — it describes the present mode of embodied existence suited for the present age, not for the age to come.', 3),
  -- v.42 corruption
  ('φθορά', 'phthora', 'G5356', 'Corruption, decay, perishability — from phtheirō (to destroy, corrupt). Phthora describes the inevitable disintegration of the present body: aging, disease, death, decomposition. The resurrection body is raised ''in incorruption'' (en aphtharsia) — free from all decay. The contrast sown-in-phthora/raised-in-aphtharsia is the most fundamental distinction between the present body and the resurrection body.', 4),
  -- v.51 mystery
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery, divine secret now revealed — from myeō (to initiate into secrets). In Paul, mystērion does not mean something incomprehensible but a previously hidden plan now disclosed by God. The mystery of v.51 has two elements: (1) not all believers will die before the Parousia; (2) all believers will be bodily transformed — the dead raised imperishable, the living instantaneously changed. This revelation is unique to Paul and not found in the OT.', 5),
  -- v.52 changed
  ('ἀλλάσσω', 'allassō', 'G236', 'To change, transform, exchange — from allos (another, different). Allagēsometha (we shall be changed) describes the instantaneous transformation of the believer''s body at the last trumpet. The change is not destruction and recreation but radical transformation — the mortal body is ''clothed over'' with immortality (v.53). This verb emphasises continuity through change: the same person, utterly transformed.', 6),
  -- v.55 sting
  ('κέντρον', 'kentron', 'G2759', 'Sting, goad, sharp point — from kenteō (to prick). Used of a scorpion''s stinger or an ox-goad. Death''s kentron is sin (v.56): sin is the sharp point by which death wounds and destroys. Christ has drawn death''s sting by dealing with sin at the cross. A bee without its stinger can buzz but cannot harm — so death, stripped of sin''s power, can no longer truly injure the believer.', 7),
  -- v.54 victory
  ('νῖκος', 'nikos', 'G3534', 'Victory, conquest, triumph — the noun behind the verb nikaō (to conquer). Used three times in vv.54-57, forming the climactic theme: death is ''swallowed up in victory'' (v.54), death has lost its victory (v.55), and God ''giveth us the victory'' (v.57) through Christ. The nikos over death is not partial or provisional but total and permanent — death itself is destroyed (v.26), consumed, abolished forever.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 15
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 20
    WHEN 3 THEN 44
    WHEN 4 THEN 42
    WHEN 5 THEN 51
    WHEN 6 THEN 52
    WHEN 7 THEN 55
    WHEN 8 THEN 54
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 Christ died for our sins
  (3, 'Isaiah 53:5-6', 1),
  (3, 'Romans 5:8', 2),
  (3, 'Galatians 1:4', 3),
  -- v.4 rose the third day
  (4, 'Psalm 16:10', 4),
  (4, 'Hosea 6:2', 5),
  (4, 'Matthew 12:40', 6),
  -- v.5 seen of Cephas
  (5, 'Luke 24:34', 7),
  -- v.6 five hundred
  (6, 'Acts 1:3', 8),
  -- v.8 born out of due time
  (8, 'Acts 9:3-6', 9),
  -- v.9 persecuted the church
  (9, 'Acts 8:3', 10),
  (9, 'Galatians 1:13', 11),
  -- v.10 by the grace of God
  (10, 'Ephesians 3:7-8', 12),
  (10, '2 Corinthians 11:23', 13),
  -- v.14 preaching vain
  (14, 'Romans 4:25', 14),
  (14, 'Romans 10:9', 15),
  -- v.17 yet in your sins
  (17, 'Romans 4:25', 16),
  -- v.20 firstfruits
  (20, 'Leviticus 23:10-11', 17),
  (20, 'Colossians 1:18', 18),
  (20, 'Revelation 1:5', 19),
  -- v.21 by man came death
  (21, 'Genesis 2:17', 20),
  (21, 'Romans 5:12', 21),
  -- v.22 in Adam all die
  (22, 'Romans 5:15-19', 22),
  (22, 'Ephesians 2:1-5', 23),
  -- v.25 reign till enemies under feet
  (25, 'Psalm 110:1', 24),
  (25, 'Hebrews 10:12-13', 25),
  -- v.26 last enemy death
  (26, 'Revelation 20:14', 26),
  (26, 'Isaiah 25:8', 27),
  -- v.27 all things under his feet
  (27, 'Psalm 8:6', 28),
  (27, 'Hebrews 2:8', 29),
  -- v.32 let us eat and drink
  (32, 'Isaiah 22:13', 30),
  -- v.33 evil communications
  (33, 'Proverbs 13:20', 31),
  -- v.36 except it die
  (36, 'John 12:24', 32),
  -- v.45 first Adam last Adam
  (45, 'Genesis 2:7', 33),
  (45, 'Romans 5:14', 34),
  (45, 'John 5:21', 35),
  -- v.47 Lord from heaven
  (47, 'John 3:13', 36),
  (47, 'John 6:38', 37),
  -- v.49 bear the image
  (49, 'Romans 8:29', 38),
  (49, 'Philippians 3:21', 39),
  (49, '1 John 3:2', 40),
  -- v.51 mystery
  (51, '1 Thessalonians 4:15-17', 41),
  -- v.52 last trump
  (52, 'Matthew 24:31', 42),
  (52, '1 Thessalonians 4:16', 43),
  -- v.54 death swallowed in victory
  (54, 'Isaiah 25:8', 44),
  (54, 'Revelation 21:4', 45),
  -- v.55 O death where is thy sting
  (55, 'Hosea 13:14', 46),
  -- v.56 sting of death is sin
  (56, 'Romans 6:23', 47),
  (56, 'Romans 7:7-11', 48),
  -- v.57 victory through Christ
  (57, 'Romans 7:25', 49),
  (57, '1 John 5:4', 50),
  -- v.58 labour not in vain
  (58, 'Galatians 6:9', 51),
  (58, '2 Chronicles 15:7', 52),
  (58, 'Hebrews 6:10', 53)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 15
  AND v.verse_number = cr.verse_number;
