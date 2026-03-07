-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 1 — The Gospel of God's Righteousness
-- 32 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Romans 1 opens the greatest theological letter ever written. Paul introduces himself as ''a servant of Jesus Christ, called to be an apostle, separated unto the gospel of God'' (v.1). This gospel was ''promised afore by his prophets in the holy scriptures'' (v.2) concerning God''s Son, ''made of the seed of David according to the flesh'' and ''declared to be the Son of God with power … by the resurrection from the dead'' (vv.3-4). Paul greets the Roman believers as ''beloved of God, called to be saints'' (v.7) and expresses his longing to visit them (vv.8-15). Then comes the mighty thesis of the entire epistle: ''I am not ashamed of the gospel of Christ: for it is the power of God unto salvation to every one that believeth; to the Jew first, and also to the Greek. For therein is the righteousness of God revealed from faith to faith: as it is written, The just shall live by faith'' (vv.16-17). From v.18 Paul turns to the dark side: ''the wrath of God is revealed from heaven against all ungodliness and unrighteousness of men, who hold the truth in unrighteousness'' (v.18). God''s invisible attributes have been clearly seen through creation, ''so that they are without excuse'' (v.20). Humanity''s descent is traced: they knew God but glorified him not (v.21), became vain in their imaginations (v.21), professed wisdom but became fools (v.22), changed the glory of God into idolatry (v.23). Three times God ''gave them up'' — to uncleanness (v.24), to vile affections (v.26), and to a reprobate mind (v.28). The chapter closes with a devastating catalogue of sins (vv.29-31) and the chilling verdict: those who practise such things and approve of others who do the same are ''worthy of death'' (v.32).',
  'The Gospel Thesis and the Wrath of God Against Ungodliness',
  'εὐαγγέλιον (euangelion)',
  'Gospel, good news — from eu (good) + angelia (message). The word appears four times in the chapter (vv.1, 9, 15, 16), anchoring Paul''s entire argument. The gospel is not advice or philosophy but God''s power (dynamis) unto salvation. It reveals God''s righteousness (dikaiosynē theou) and is received by faith (ek pisteōs eis pistin).',
  '["Salutation: Paul the Apostle of the Gospel (vv.1-7): Paul a servant of Jesus Christ called to be an apostle separated unto the gospel of God which he had promised afore by his prophets in the holy scriptures concerning his Son Jesus Christ our Lord made of the seed of David according to the flesh and declared to be the Son of God with power according to the spirit of holiness by the resurrection from the dead","Paul''s Desire to Visit Rome (vv.8-15): First I thank my God through Jesus Christ for you all that your faith is spoken of throughout the whole world so I am ready to preach the gospel to you that are at Rome also","The Gospel Thesis: Righteousness by Faith (vv.16-17): I am not ashamed of the gospel of Christ for it is the power of God unto salvation to every one that believeth to the Jew first and also to the Greek for therein is the righteousness of God revealed from faith to faith as it is written The just shall live by faith","The Wrath of God Against Suppressed Truth (vv.18-23): The wrath of God is revealed from heaven against all ungodliness and unrighteousness of men who hold the truth in unrighteousness because that which may be known of God is manifest in them for God hath shewed it unto them for the invisible things of him from the creation of the world are clearly seen being understood by the things that are made even his eternal power and Godhead so that they are without excuse","God Gave Them Up: The Threefold Judgment (vv.24-32): Wherefore God also gave them up to uncleanness through the lusts of their own hearts for this cause God gave them up unto vile affections and even as they did not like to retain God in their knowledge God gave them over to a reprobate mind"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 32 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Paul, a servant of Jesus Christ, called to be an apostle, separated unto the gospel of God,',
   'Παῦλος δοῦλος Ἰησοῦ Χριστοῦ κλητὸς ἀπόστολος ἀφωρισμένος εἰς εὐαγγέλιον θεοῦ',
   'Paulos doulos Iēsou Christou klētos apostolos aphōrismenos eis euangelion theou',
   '''Servant'' (doulos — bond-slave; the most self-effacing term Paul could choose, denoting total ownership by and submission to Christ). ''Called'' (klētos — divinely summoned; Paul did not volunteer for apostleship). ''Separated'' (aphōrismenos — set apart, consecrated; the same root as Pharisee [pharisaios], but Paul was now set apart by God, not by human tradition). ''Unto the gospel of God'' — the gospel is the controlling purpose of Paul''s entire existence.',
   NULL),
  (2, '(Which he had promised afore by his prophets in the holy scriptures,)',
   'ὃ προεπηγγείλατο διὰ τῶν προφητῶν αὐτοῦ ἐν γραφαῖς ἁγίαις',
   'ho proepēngeilato dia tōn prophētōn autou en graphais hagiais',
   '''Promised afore'' (proepēngeilato — promised beforehand; the prefix pro- emphasizes prior announcement). The gospel is not a novelty but the fulfilment of Old Testament prophecy. ''His prophets'' — they are God''s prophets, speaking God''s message. ''Holy scriptures'' (graphais hagiais) — the OT writings are sacred and authoritative.',
   NULL),
  (3, 'Concerning his Son Jesus Christ our Lord, which was made of the seed of David according to the flesh;',
   'περὶ τοῦ υἱοῦ αὐτοῦ τοῦ γενομένου ἐκ σπέρματος Δαυὶδ κατὰ σάρκα',
   'peri tou huiou autou tou genomenou ek spermatos Dauid kata sarka',
   '''His Son'' (tou huiou autou — the gospel concerns God''s own Son). ''Made of the seed of David'' (genomenou ek spermatos Dauid — born from David''s lineage; genomenou implies pre-existence: he who already existed came to be in David''s line). ''According to the flesh'' (kata sarka — as regards his human nature). This establishes Jesus'' true humanity and Davidic royal lineage, fulfilling 2 Samuel 7:12-16.',
   'The dual description of Christ in vv.3-4 (kata sarka / kata pneuma hagiōsynēs) is one of the earliest christological formulas in the NT. It affirms both the genuine humanity (seed of David) and the divine Sonship (declared by resurrection) of Jesus. He is not merely a descendant of David who was adopted as Son — he is the eternal Son who entered David''s line.'),
  (4, 'And declared to be the Son of God with power, according to the spirit of holiness, by the resurrection from the dead:',
   'τοῦ ὁρισθέντος υἱοῦ θεοῦ ἐν δυνάμει κατὰ πνεῦμα ἁγιωσύνης ἐξ ἀναστάσεως νεκρῶν',
   'tou horisthentos huiou theou en dynamei kata pneuma hagiōsynēs ex anastaseōs nekrōn',
   '''Declared'' (horisthentos — marked out, designated with power; from horizō, to define or determine; the resurrection did not make Jesus the Son of God but publicly demonstrated his Sonship). ''With power'' (en dynamei — he was always the Son, but the resurrection declared his Sonship powerfully). ''Spirit of holiness'' (pneuma hagiōsynēs — the Holy Spirit, or Christ''s own holy nature). ''By the resurrection from the dead'' — the resurrection is God''s public, irrefutable declaration that Jesus is his Son.',
   'The resurrection is the hinge of Paul''s christology. Jesus was not promoted to divine Sonship at the resurrection — he was the Son from eternity (v.3 ''his Son''). But the resurrection declared (horisthentos) this Sonship ''with power.'' Before the cross, his Sonship was veiled in humility; after the resurrection, it is manifest in power. This same power (dynamis) becomes the ''power of God unto salvation'' in v.16.'),
  (5, 'By whom we have received grace and apostleship, for obedience to the faith among all nations, for his name:',
   'δι᾿ οὗ ἐλάβομεν χάριν καὶ ἀποστολὴν εἰς ὑπακοὴν πίστεως ἐν πᾶσιν τοῖς ἔθνεσιν ὑπὲρ τοῦ ὀνόματος αὐτοῦ',
   'di hou elabomen charin kai apostolēn eis hypakoēn pisteōs en pasin tois ethnesin hyper tou onomatos autou',
   '''Grace and apostleship'' (charin kai apostolēn — the two are inseparable: Paul''s apostolic commission is itself an act of grace). ''Obedience to the faith'' (hypakoēn pisteōs — the obedience that consists in faith, or the obedience that flows from faith; this phrase bookends Romans, appearing also in 16:26). ''Among all nations'' (en pasin tois ethnesin — among all the Gentiles). ''For his name'' — the ultimate purpose is the glory of Christ''s name among all peoples.',
   NULL),
  (6, 'Among whom are ye also the called of Jesus Christ:',
   'ἐν οἷς ἐστὲ καὶ ὑμεῖς κλητοὶ Ἰησοῦ Χριστοῦ',
   'en hois este kai hymeis klētoi Iēsou Christou',
   '''Among whom'' — the Roman believers are part of the Gentile harvest. ''Called of Jesus Christ'' (klētoi Iēsou Christou — called by Christ, or called to belong to Christ). As Paul is klētos apostolos (v.1), they are klētoi Iēsou Christou. Their salvation is a divine calling, not a human decision alone.',
   NULL),
  (7, 'To all that be in Rome, beloved of God, called to be saints: Grace to you and peace from God our Father, and the Lord Jesus Christ.',
   'πᾶσιν τοῖς οὖσιν ἐν Ῥώμῃ ἀγαπητοῖς θεοῦ κλητοῖς ἁγίοις χάρις ὑμῖν καὶ εἰρήνη ἀπὸ θεοῦ πατρὸς ἡμῶν καὶ κυρίου Ἰησοῦ Χριστοῦ',
   'pasin tois ousin en Rhōmē agapētois theou klētois hagiois charis hymin kai eirēnē apo theou patros hēmōn kai kyriou Iēsou Christou',
   '''Beloved of God'' (agapētois theou — God''s beloved ones). ''Called to be saints'' (klētois hagiois — called saints; they are not trying to become saints but are divinely designated as holy ones). ''Grace and peace'' — the combined Greek and Hebrew greeting. ''From God our Father and the Lord Jesus Christ'' — Christ is placed alongside the Father as the co-source of grace and peace, an implicit claim to deity.',
   NULL),
  (8, 'First, I thank my God through Jesus Christ for you all, that your faith is spoken of throughout the whole world.',
   'πρῶτον μὲν εὐχαριστῶ τῷ θεῷ μου διὰ Ἰησοῦ Χριστοῦ ὑπὲρ πάντων ὑμῶν ὅτι ἡ πίστις ὑμῶν καταγγέλλεται ἐν ὅλῳ τῷ κόσμῳ',
   'prōton men eucharistō tō theō mou dia Iēsou Christou hyper pantōn hymōn hoti hē pistis hymōn katangelletai en holō tō kosmō',
   '''Through Jesus Christ'' — even thanksgiving reaches God through the mediator. ''Your faith is spoken of throughout the whole world'' — the church in Rome, the imperial capital, had a faith so notable that it was known everywhere in the Mediterranean world. This was remarkable for a church Paul had not founded.',
   NULL),
  (9, 'For God is my witness, whom I serve with my spirit in the gospel of his Son, that without ceasing I make mention of you always in my prayers;',
   'μάρτυς γάρ μού ἐστιν ὁ θεός ᾧ λατρεύω ἐν τῷ πνεύματί μου ἐν τῷ εὐαγγελίῳ τοῦ υἱοῦ αὐτοῦ ὡς ἀδιαλείπτως μνείαν ὑμῶν ποιοῦμαι',
   'martys gar mou estin ho theos hō latreuō en tō pneumati mou en tō euangeliō tou huiou autou hōs adialeiptōs mneian hymōn poioumai',
   '''God is my witness'' — Paul invokes God because his prayer life is invisible to the Romans. ''Serve'' (latreuō — render sacred service, worship; the word for priestly service). Paul''s gospel preaching is itself an act of worship. ''Without ceasing'' (adialeiptōs — unceasingly, constantly).',
   NULL),
  (10, 'Making request, if by any means now at length I might have a prosperous journey by the will of God to come unto you.',
   'πάντοτε ἐπὶ τῶν προσευχῶν μου δεόμενος εἴ πως ἤδη ποτὲ εὐοδωθήσομαι ἐν τῷ θελήματι τοῦ θεοῦ ἐλθεῖν πρὸς ὑμᾶς',
   'pantote epi tōn proseuchōn mou deomenos ei pōs ēdē pote euodōthēsomai en tō thelēmati tou theou elthein pros hymas',
   '''Prosperous journey'' (euodōthēsomai — be prospered on my way; from eu + hodos, good road). ''By the will of God'' — Paul subordinates his travel plans to God''s sovereign will. His eventual arrival in Rome would come as a prisoner (Acts 28), yet God''s will was accomplished.',
   NULL),
  (11, 'For I long to see you, that I may impart unto you some spiritual gift, to the end ye may be established;',
   'ἐπιποθῶ γὰρ ἰδεῖν ὑμᾶς ἵνα τι μεταδῶ χάρισμα ὑμῖν πνευματικόν εἰς τὸ στηριχθῆναι ὑμᾶς',
   'epipothō gar idein hymas hina ti metadō charisma hymin pneumatikon eis to stērichthēnai hymas',
   '''Long'' (epipothō — earnestly desire, yearn for). ''Impart'' (metadō — share, give a portion of). ''Spiritual gift'' (charisma pneumatikon — a grace-gift that is spiritual; not necessarily miraculous but any edifying ministry). ''Established'' (stērichthēnai — strengthened, made firm).',
   NULL),
  (12, 'That is, that I may be comforted together with you by the mutual faith both of you and me.',
   'τοῦτο δέ ἐστιν συμπαρακληθῆναι ἐν ὑμῖν διὰ τῆς ἐν ἀλλήλοις πίστεως ὑμῶν τε καὶ ἐμοῦ',
   'touto de estin symparaklēthēnai en hymin dia tēs en allēlois pisteōs hymōn te kai emou',
   '''Comforted together'' (symparaklēthēnai — mutually encouraged; syn + para + kaleō — called alongside together). Paul immediately corrects any impression that he is the sole giver: ministry is reciprocal. Even an apostle is encouraged by the faith of ordinary believers.',
   NULL),
  (13, 'Now I would not have you ignorant, brethren, that oftentimes I purposed to come unto you, (but was let hitherto,) that I might have some fruit among you also, even as among other Gentiles.',
   'οὐ θέλω δὲ ὑμᾶς ἀγνοεῖν ἀδελφοί ὅτι πολλάκις προεθέμην ἐλθεῖν πρὸς ὑμᾶς καὶ ἐκωλύθην ἄχρι τοῦ δεῦρο ἵνα τινὰ καρπὸν σχῶ καὶ ἐν ὑμῖν καθὼς καὶ ἐν τοῖς λοιποῖς ἔθνεσιν',
   'ou thelō de hymas agnoein adelphoi hoti pollakis proethemēn elthein pros hymas kai ekōlythēn achri tou deuro hina tina karpon schō kai en hymin kathōs kai en tois loipois ethnesin',
   '''Let'' (ekōlythēn — hindered, prevented; passive: Paul was blocked by circumstances or divine providence). ''Fruit'' (karpon — fruit, results). ''Among other Gentiles'' — Paul explicitly includes the Romans among the Gentile peoples of his apostolic mission.',
   NULL),
  (14, 'I am debtor both to the Greeks, and to the Barbarians; both to the wise, and to the unwise.',
   'Ἕλλησίν τε καὶ βαρβάροις σοφοῖς τε καὶ ἀνοήτοις ὀφειλέτης εἰμί',
   'Hellēsin te kai barbarois sophois te kai anoētois opheiletēs eimi',
   '''Debtor'' (opheiletēs — one who owes a debt; Paul''s obligation to Christ creates a derived obligation to preach to all people). ''Greeks and Barbarians'' — the Greek cultural division of humanity: Greek-speakers and everyone else. ''Wise and unwise'' — the intellectual division. Paul''s gospel transcends every human distinction.',
   NULL),
  (15, 'So, as much as in me is, I am ready to preach the gospel to you that are at Rome also.',
   'οὕτως τὸ κατ᾿ ἐμὲ πρόθυμον καὶ ὑμῖν τοῖς ἐν Ῥώμῃ εὐαγγελίσασθαι',
   'houtōs to kat eme prothymon kai hymin tois en Rhōmē euangelisasthai',
   '''Ready'' (prothymon — eager, willing, zealous). ''Preach the gospel'' (euangelisasthai — to evangelize; the verb form of euangelion). Paul is eager to proclaim the gospel even in the imperial capital, despite the risks.',
   NULL),
  (16, 'For I am not ashamed of the gospel of Christ: for it is the power of God unto salvation to every one that believeth; to the Jew first, and also to the Greek.',
   'οὐ γὰρ ἐπαισχύνομαι τὸ εὐαγγέλιον τοῦ Χριστοῦ δύναμις γὰρ θεοῦ ἐστιν εἰς σωτηρίαν παντὶ τῷ πιστεύοντι Ἰουδαίῳ τε πρῶτον καὶ Ἕλληνι',
   'ou gar epaischynomai to euangelion tou Christou dynamis gar theou estin eis sōtērian panti tō pisteuonti Ioudaiō te prōton kai Hellēni',
   '''Not ashamed'' (epaischynomai — Paul uses litotes: ''not ashamed'' = profoundly confident). ''Power of God'' (dynamis theou — the gospel is not merely a message about power but is itself God''s power in action). ''Unto salvation'' (eis sōtērian — the gospel achieves what it proclaims). ''To every one that believeth'' — faith is the sole condition. ''To the Jew first, and also to the Greek'' — historical priority and theological continuity.',
   'This is the thesis statement of Romans. Three revolutionary claims: (1) The gospel is not mere information but divine POWER (dynamis); (2) This power achieves SALVATION — comprehensive rescue from sin, death, and judgment; (3) It is available to EVERYONE who believes — Jew and Gentile alike, with faith as the sole condition. The gospel levels all human distinctions while respecting salvation-historical order.'),
  (17, 'For therein is the righteousness of God revealed from faith to faith: as it is written, The just shall live by faith.',
   'δικαιοσύνη γὰρ θεοῦ ἐν αὐτῷ ἀποκαλύπτεται ἐκ πίστεως εἰς πίστιν καθὼς γέγραπται ὁ δὲ δίκαιος ἐκ πίστεως ζήσεται',
   'dikaiosynē gar theou en autō apokalyptetai ek pisteōs eis pistin kathōs gegraptai ho de dikaios ek pisteōs zēsetai',
   '''Righteousness of God'' (dikaiosynē theou — both God''s own righteous character and the righteous status he gives to believers). ''Revealed'' (apokalyptetai — unveiled; present tense: ongoing revelation). ''From faith to faith'' (ek pisteōs eis pistin — faith from first to last). ''The just shall live by faith'' — quoting Habakkuk 2:4; this OT text became the Reformation''s watchword.',
   'This verse is the theological foundation of the entire epistle. The ''righteousness of God'' (dikaiosynē theou) is Paul''s central concept — the righteous status that God provides and the believer receives by faith. The Habakkuk 2:4 quotation grounds justification by faith in the OT itself. This verse ignited the Reformation when Luther grasped that dikaiosynē theou is not the righteousness by which God judges sinners but the righteousness by which he saves them.'),
  (18, 'For the wrath of God is revealed from heaven against all ungodliness and unrighteousness of men, who hold the truth in unrighteousness;',
   'ἀποκαλύπτεται γὰρ ὀργὴ θεοῦ ἀπ᾿ οὐρανοῦ ἐπὶ πᾶσαν ἀσέβειαν καὶ ἀδικίαν ἀνθρώπων τῶν τὴν ἀλήθειαν ἐν ἀδικίᾳ κατεχόντων',
   'apokalyptetai gar orgē theou ap ouranou epi pasan asebeian kai adikian anthrōpōn tōn tēn alētheian en adikia katechontōn',
   '''Wrath'' (orgē — settled, righteous indignation; not emotional rage but judicial opposition to evil). ''Revealed from heaven'' (apokalyptetai — the same verb as v.17: as righteousness is revealed in the gospel, so wrath is revealed against sin). ''Ungodliness'' (asebeian — impiety toward God; the vertical dimension). ''Unrighteousness'' (adikian — injustice toward others; the horizontal dimension). ''Hold the truth in unrighteousness'' (katechontōn — suppress, hold down). Humanity''s fundamental sin is suppression of known truth.',
   'The wrath of God is as much a revelation as the righteousness of God. Paul uses the same verb (apokalyptetai) for both (vv.17-18). God''s wrath is not arbitrary rage but his holy opposition to all that contradicts his character. The human problem is not lack of knowledge but suppression of truth: people ''hold the truth in unrighteousness.'' This suppression is the root of all human sin and the ground of universal accountability.'),
  (19, 'Because that which may be known of God is manifest in them; for God hath shewed it unto them.',
   'διότι τὸ γνωστὸν τοῦ θεοῦ φανερόν ἐστιν ἐν αὐτοῖς ὁ γὰρ θεὸς αὐτοῖς ἐφανέρωσεν',
   'dioti to gnōston tou theou phaneron estin en autois ho gar theos autois ephanerōsen',
   '''That which may be known'' (to gnōston tou theou — the knowable aspect of God). ''Manifest in them'' (phaneron estin en autois — evident among or within them). ''God hath shewed it'' — the initiative is God''s. Human knowledge of God is not a human achievement but a divine gift.',
   NULL),
  (20, 'For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:',
   'τὰ γὰρ ἀόρατα αὐτοῦ ἀπὸ κτίσεως κόσμου τοῖς ποιήμασιν νοούμενα καθορᾶται ἥ τε ἀΐδιος αὐτοῦ δύναμις καὶ θειότης εἰς τὸ εἶναι αὐτοὺς ἀναπολογήτους',
   'ta gar aorata autou apo ktiseōs kosmou tois poiēmasin nooumena kathoratai hē te aidios autou dynamis kai theiotēs eis to einai autous anapologētous',
   '''Invisible things'' (aorata — things not seen; God''s attributes are invisible but not unknowable). ''Clearly seen'' (kathoratai — a paradox: the invisible is clearly visible through creation). ''Eternal power'' (aidios dynamis). ''Godhead'' (theiotēs — divine nature, divinity). ''Without excuse'' (anapologētous — inexcusable). Creation is God''s universal testimony.',
   'This verse is the classic text for natural theology and general revelation. God''s ''eternal power and Godhead'' are ''clearly seen'' through creation. This is not saving knowledge (which requires the gospel, vv.16-17) but sufficient knowledge to render all people ''without excuse.'' The problem is not insufficient evidence but willful suppression of available evidence (v.18).'),
  (21, 'Because that, when they knew God, they glorified him not as God, neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.',
   'διότι γνόντες τὸν θεὸν οὐχ ὡς θεὸν ἐδόξασαν ἢ ηὐχαρίστησαν ἀλλ᾿ ἐματαιώθησαν ἐν τοῖς διαλογισμοῖς αὐτῶν καὶ ἐσκοτίσθη ἡ ἀσύνετος αὐτῶν καρδία',
   'dioti gnontes ton theon ouch hōs theon edoxasan ē ēucharistēsan all emataiōthēsan en tois dialogismois autōn kai eskotisthē hē asynetos autōn kardia',
   '''When they knew God'' (gnontes ton theon — having known God; they possessed genuine knowledge). ''Glorified him not'' — the first failure: refusing to honour God. ''Neither were thankful'' — the second failure: ingratitude. ''Became vain'' (emataiōthēsan — were made futile, empty). ''Foolish heart was darkened'' (eskotisthē — darkness is a consequence of rejecting the light).',
   NULL),
  (22, 'Professing themselves to be wise, they became fools,',
   'φάσκοντες εἶναι σοφοὶ ἐμωράνθησαν',
   'phaskontes einai sophoi emōranthēsan',
   '''Professing'' (phaskontes — claiming). ''Became fools'' (emōranthēsan — were made foolish; from mōros, whence English ''moron''). The irony is devastating: the very claim to wisdom becomes the evidence of folly.',
   NULL),
  (23, 'And changed the glory of the uncorruptible God into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.',
   'καὶ ἤλλαξαν τὴν δόξαν τοῦ ἀφθάρτου θεοῦ ἐν ὁμοιώματι εἰκόνος φθαρτοῦ ἀνθρώπου καὶ πετεινῶν καὶ τετραπόδων καὶ ἑρπετῶν',
   'kai ēllaxan tēn doxan tou aphthartou theou en homoiōmati eikonos phthartou anthrōpou kai peteinōn kai tetrapodōn kai herpetōn',
   '''Changed'' (ēllaxan — exchanged; trading the real for the counterfeit). The descent of idolatry: human form → birds → animals → creeping things. Each step moves further from the Creator. Paul echoes Psalm 106:20 and Deuteronomy 4:16-18.',
   NULL),
  (24, 'Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:',
   'διὸ καὶ παρέδωκεν αὐτοὺς ὁ θεὸς ἐν ταῖς ἐπιθυμίαις τῶν καρδιῶν αὐτῶν εἰς ἀκαθαρσίαν τοῦ ἀτιμάζεσθαι τὰ σώματα αὐτῶν ἐν αὐτοῖς',
   'dio kai paredōken autous ho theos en tais epithymiais tōn kardiōn autōn eis akatharsian tou atimazesthai ta sōmata autōn en autois',
   '''Gave them up'' (paredōken — handed over; the first of three occurrences: vv.24, 26, 28). God''s wrath operates by present abandonment: he allows sinners to experience the consequences of their choices. ''Uncleanness'' (akatharsian — impurity). ''Lusts of their own hearts'' — the desires were already present; God removed his restraining hand.',
   'The phrase ''God gave them up'' (paredōken) is one of the most solemn expressions of divine judgment in Scripture. It appears three times (vv.24, 26, 28), forming a terrible triad of divine abandonment. This is not active causation but judicial permission: God withdraws his restraining grace. The punishment fits the crime — those who exchange God''s glory receive the degradation of their own bodies, affections, and minds.'),
  (25, 'Who changed the truth of God into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen.',
   'οἵτινες μετήλλαξαν τὴν ἀλήθειαν τοῦ θεοῦ ἐν τῷ ψεύδει καὶ ἐσεβάσθησαν καὶ ἐλάτρευσαν τῇ κτίσει παρὰ τὸν κτίσαντα ὅς ἐστιν εὐλογητὸς εἰς τοὺς αἰῶνας ἀμήν',
   'hoitines metēllaxan tēn alētheian tou theou en tō pseudei kai esebasthēsan kai elatreusan tē ktisei para ton ktisanta hos estin eulogētos eis tous aiōnas amēn',
   '''Changed'' (metēllaxan — exchanged, substituted). ''The truth of God'' for ''the lie'' (tō pseudei — the definite article: the fundamental lie of idolatry). ''Worshipped and served the creature more than the Creator'' (para ton ktisanta — rather than the Creator). ''Blessed for ever. Amen'' — even while describing depravity, Paul bursts into doxology at the mention of the Creator.',
   NULL),
  (26, 'For this cause God gave them up unto vile affections: for even their women did change the natural use into that which is against nature:',
   'διὰ τοῦτο παρέδωκεν αὐτοὺς ὁ θεὸς εἰς πάθη ἀτιμίας αἵ τε γὰρ θήλειαι αὐτῶν μετήλλαξαν τὴν φυσικὴν χρῆσιν εἰς τὴν παρὰ φύσιν',
   'dia touto paredōken autous ho theos eis pathē atimias hai te gar thēleiai autōn metēllaxan tēn physikēn chrēsin eis tēn para physin',
   '''Gave them up'' — the second paredōken. ''Vile affections'' (pathē atimias — passions of dishonour). ''Against nature'' (para physin — contrary to nature). Paul sees the exchange of natural for unnatural as a consequence and illustration of the prior exchange of Creator for creature (v.25). The sexual disorder mirrors the theological disorder.',
   NULL),
  (27, 'And likewise also the men, leaving the natural use of the woman, burned in their lust one toward another; men with men working that which is unseemly, and receiving in themselves that recompence of their error which was meet.',
   'ὁμοίως τε καὶ οἱ ἄρρενες ἀφέντες τὴν φυσικὴν χρῆσιν τῆς θηλείας ἐξεκαύθησαν ἐν τῇ ὀρέξει αὐτῶν εἰς ἀλλήλους ἄρρενες ἐν ἄρρεσιν τὴν ἀσχημοσύνην κατεργαζόμενοι καὶ τὴν ἀντιμισθίαν ἣν ἔδει τῆς πλάνης αὐτῶν ἐν ἑαυτοῖς ἀπολαμβάνοντες',
   'homoiōs te kai hoi arrenes aphentes tēn physikēn chrēsin tēs thēleias exekauthēsan en tē orexei autōn eis allēlous arrenes en arresin tēn aschēmosynēn katergazomenoi kai tēn antimisthian hēn edei tēs planēs autōn en heautois apolambanontes',
   '''Burned'' (exekauthēsan — were inflamed). ''Unseemly'' (aschēmosynēn — indecency). ''Recompence'' (antimisthian — a corresponding penalty; anti- indicates exact correspondence). ''Error'' (planēs — wandering, deviation). The consequences of sin are internal and inherent, not merely externally imposed.',
   NULL),
  (28, 'And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;',
   'καὶ καθὼς οὐκ ἐδοκίμασαν τὸν θεὸν ἔχειν ἐν ἐπιγνώσει παρέδωκεν αὐτοὺς ὁ θεὸς εἰς ἀδόκιμον νοῦν ποιεῖν τὰ μὴ καθήκοντα',
   'kai kathōs ouk edokimasan ton theon echein en epignōsei paredōken autous ho theos eis adokimon noun poiein ta mē kathēkonta',
   '''Did not like'' (ouk edokimasan — did not approve; from dokimazō, to test and approve). ''Reprobate mind'' (adokimon noun — a worthless mind; a wordplay: they did not dokimazō God, so God gave them an a-dokimos mind). ''Not convenient'' (ta mē kathēkonta — things not fitting). The third paredōken: the surrender of the mind itself.',
   'The wordplay between edokimasan and adokimon is theologically precise: the mind that refuses to approve God becomes itself unapproved. This is the climax of the three giving-overs: first the body (v.24), then the passions (v.26), now the mind (v.28). The entire human person — body, desires, and intellect — is surrendered to the consequences of rejecting God.'),
  (29, 'Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,',
   'πεπληρωμένους πάσῃ ἀδικίᾳ πορνείᾳ πονηρίᾳ πλεονεξίᾳ κακίᾳ μεστοὺς φθόνου φόνου ἔριδος δόλου κακοηθείας ψιθυριστάς',
   'peplērōmenous pasē adikia porneia ponēria pleonexia kakia mestous phthonou phonou eridos dolou kakoētheias psithyristas',
   '''Filled'' (peplērōmenous — filled full; perfect participle: thoroughly saturated). Paul lists 21 sins in vv.29-31. Note the near-homophone: phthonos (envy) and phonos (murder) — envy leads to murder. ''Whisperers'' (psithyristas — secret slanderers).',
   NULL),
  (30, 'Backbiters, haters of God, despiteful, proud, boasters, inventors of evil things, disobedient to parents,',
   'καταλάλους θεοστυγεῖς ὑβριστὰς ὑπερηφάνους ἀλαζόνας ἐφευρετὰς κακῶν γονεῦσιν ἀπειθεῖς',
   'katalalous theostygeis hybristas hyperēphanous alazonas epheuretas kakōn goneusin apeitheis',
   '''Haters of God'' (theostygeis — despising God; the most serious charge). ''Inventors of evil things'' (epheuretas kakōn — those who devise new forms of evil; human creativity perverted). ''Disobedient to parents'' — breaking the fifth commandment, the foundation of social order.',
   NULL),
  (31, 'Without understanding, covenantbreakers, without natural affection, implacable, unmerciful:',
   'ἀσυνέτους ἀσυνθέτους ἀστόργους ἀσπόνδους ἀνελεήμονας',
   'asynetous asynthetous astorgous aspondous aneleēmonas',
   'Five alpha-privative adjectives (words beginning with a-/without): ''Without understanding'' (asynetous). ''Covenantbreakers'' (asynthetous — faithless). ''Without natural affection'' (astorgous — devoid of family love). ''Implacable'' (aspondous — irreconcilable). ''Unmerciful'' (aneleēmonas). The fivefold a- prefix creates a drumbeat of negation.',
   NULL),
  (32, 'Who knowing the judgment of God, that they which commit such things are worthy of death, not only do the same, but have pleasure in them that do them.',
   'οἵτινες τὸ δικαίωμα τοῦ θεοῦ ἐπιγνόντες ὅτι οἱ τὰ τοιαῦτα πράσσοντες ἄξιοι θανάτου εἰσίν οὐ μόνον αὐτὰ ποιοῦσιν ἀλλὰ καὶ συνευδοκοῦσιν τοῖς πράσσουσιν',
   'hoitines to dikaiōma tou theou epignontes hoti hoi ta toiauta prassontes axioi thanatou eisin ou monon auta poiousin alla kai syneudokousin tois prassousin',
   '''Knowing'' (epignontes — having full knowledge; not ignorance but willful rebellion). ''Judgment of God'' (dikaiōma tou theou — the righteous decree). ''Have pleasure in them that do them'' (syneudokousin — approve together). The climax: the worst sin is not merely doing evil but approving it in others, revealing a fully corrupted moral judgment.',
   'This verse completes Paul''s indictment: knowing God''s righteous decree that such things deserve death, they not only practise them but actively approve of others who do the same. This approval (syneudokousin) is presented as worse than the practice itself, because it shows a settled moral stance where the conscience has been recalibrated to call evil good. This prepares for chapter 2, where Paul will show that the moral judge is equally guilty.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 1;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 servant/slave
  ('δοῦλος', 'doulos', 'G1401', 'Bond-servant, slave — one who belongs entirely to another. In the OT, the great leaders (Moses, Joshua, David) were called servants of the LORD. Paul claims this title as his highest honour: complete ownership by and devotion to Jesus Christ. The doulos has no rights, no agenda — only the master''s purpose.', 1),
  -- v.1 gospel
  ('εὐαγγέλιον', 'euangelion', 'G2098', 'Gospel, good news — from eu (good) + angelia (message). In the Roman world, euangelion announced imperial victories and the accession of emperors. Paul subverts this: the true good news is not Caesar''s but Christ''s. The gospel is not merely information about salvation but is itself the power of God unto salvation (v.16).', 2),
  -- v.4 declared Son of God
  ('ὁρίζω', 'horizō', 'G3724', 'To determine, appoint, mark out with a boundary — from horos (boundary). Christ was marked out (horisthentos) as Son of God with power by the resurrection. The verb does not mean made but designated — the resurrection publicly demonstrated what was eternally true. English horizon derives from this word.', 3),
  -- v.16 power
  ('δύναμις', 'dynamis', 'G1411', 'Power, ability, might — inherent capability, effective force. The gospel is not merely a message about God''s power but is itself God''s power in action. Dynamis is the root of English dynamite. When the gospel is proclaimed and believed, divine power is unleashed to accomplish salvation.', 4),
  -- v.17 righteousness
  ('δικαιοσύνη', 'dikaiosynē', 'G1343', 'Righteousness — the central concept of Romans. It denotes right standing before God, the status of being declared righteous. In Paul, dikaiosynē theou means both God''s own righteous character and the righteous status he freely gives to those who believe. It is revealed from faith to faith — faith is both the source and the sphere of this righteousness.', 5),
  -- v.17 faith
  ('πίστις', 'pistis', 'G4102', 'Faith, trust, belief, faithfulness — the human response to the gospel and the sole condition for receiving God''s righteousness. Pistis is not mere intellectual assent but personal trust and reliance on God''s promise in Christ. The just shall live by faith — faith is the ongoing principle of the justified life, not merely the entry point.', 6),
  -- v.18 wrath
  ('ὀργή', 'orgē', 'G3709', 'Wrath, anger — God''s settled, righteous opposition to evil. Unlike human anger (thymos, which is explosive), orgē is deliberate and judicial. God''s wrath is not a character flaw but the necessary response of his holiness to sin. It is revealed from heaven — it has cosmic authority and is already operative in history through the process of divine abandonment (vv.24, 26, 28).', 7),
  -- v.28 reprobate mind
  ('ἀδόκιμος', 'adokimos', 'G96', 'Reprobate, worthless, failing the test — from a (not) + dokimos (approved after testing). A mind that has been tested and found wanting. The wordplay with edokimasan (v.28a) is deliberate: they did not approve (dokimazō) of retaining God, so God gave them a mind that is disapproved (adokimos). The faculty of moral judgment itself is corrupted.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 1
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1 WHEN 2 THEN 1
    WHEN 3 THEN 4
    WHEN 4 THEN 16
    WHEN 5 THEN 17 WHEN 6 THEN 17
    WHEN 7 THEN 18
    WHEN 8 THEN 28
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 servant, apostle
  (1, 'Galatians 1:15', 1),
  (1, 'Acts 9:15', 2),
  -- v.2 promised in scriptures
  (2, 'Luke 24:27', 3),
  (2, 'Acts 26:22-23', 4),
  -- v.3 seed of David
  (3, '2 Samuel 7:12-14', 5),
  (3, '2 Timothy 2:8', 6),
  (3, 'Matthew 1:1', 7),
  -- v.4 declared Son of God by resurrection
  (4, 'Acts 13:33', 8),
  (4, 'Hebrews 1:5', 9),
  -- v.5 obedience of faith
  (5, 'Romans 16:26', 10),
  (5, 'Acts 6:7', 11),
  -- v.7 called saints
  (7, '1 Corinthians 1:2', 12),
  -- v.16 power of God unto salvation
  (16, '1 Corinthians 1:18', 13),
  (16, '1 Corinthians 1:24', 14),
  (16, 'Mark 8:38', 15),
  -- v.17 the just shall live by faith
  (17, 'Habakkuk 2:4', 16),
  (17, 'Galatians 3:11', 17),
  (17, 'Hebrews 10:38', 18),
  (17, 'Philippians 3:9', 19),
  -- v.18 wrath revealed
  (18, 'Ephesians 5:6', 20),
  (18, 'Colossians 3:6', 21),
  -- v.19-20 general revelation
  (19, 'Acts 14:17', 22),
  (20, 'Psalm 19:1-4', 23),
  (20, 'Acts 17:24-28', 24),
  -- v.21 knew God but glorified not
  (21, 'Ephesians 4:17-18', 25),
  -- v.23 exchanged glory for images
  (23, 'Psalm 106:20', 26),
  (23, 'Deuteronomy 4:16-18', 27),
  -- v.24 God gave them up
  (24, 'Acts 7:42', 28),
  (24, 'Psalm 81:12', 29),
  -- v.25 Creator blessed forever
  (25, 'Jeremiah 10:10-14', 30),
  -- v.32 approval of evil
  (32, 'Romans 2:1-3', 31)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 1
  AND v.verse_number = cr.verse_number;
