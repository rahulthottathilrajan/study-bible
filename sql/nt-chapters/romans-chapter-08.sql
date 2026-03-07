-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 8 — Life in the Spirit, More Than Conquerors
-- 39 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'Romans 8 is widely regarded as the greatest chapter in the Bible — a soaring summit of Christian theology and experience. It begins with ''no condemnation'' (v.1) and ends with ''no separation'' (vv.38-39), and between these two pillars stands the glorious work of the Holy Spirit. ''There is therefore now no condemnation to them which are in Christ Jesus'' (v.1). ''The law of the Spirit of life in Christ Jesus hath made me free from the law of sin and death'' (v.2). God sent his own Son ''in the likeness of sinful flesh'' and ''condemned sin in the flesh'' so that ''the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit'' (vv.3-4). Those who live according to the Spirit ''mind the things of the Spirit'' (v.5), and ''to be spiritually minded is life and peace'' (v.6). The indwelling Spirit gives life (v.11), confirms our adoption (vv.14-16), and assures us we are ''heirs of God, and joint-heirs with Christ'' (v.17). Present sufferings are ''not worthy to be compared with the glory which shall be revealed in us'' (v.18). Creation itself ''groaneth and travaileth'' waiting for liberation (v.22), and ''the Spirit itself maketh intercession for us with groanings which cannot be uttered'' (v.26). ''We know that all things work together for good to them that love God, to them who are the called according to his purpose'' (v.28). Paul then traces the golden chain of salvation: foreknown, predestinated, called, justified, glorified (vv.29-30). The chapter closes with one of the most triumphant passages ever written: ''If God be for us, who can be against us?'' (v.31). ''Who shall separate us from the love of Christ?'' (v.35). ''Nay, in all these things we are more than conquerors through him that loved us'' (v.37). ''Neither death, nor life … nor any other creature, shall be able to separate us from the love of God, which is in Christ Jesus our Lord'' (vv.38-39).',
  'Life in the Spirit: No Condemnation, No Separation',
  'πνεῦμα (pneuma)',
  'Spirit — used 21 times in this chapter, referring to the Holy Spirit in most instances. The Spirit is the agent of the believer''s new life: he frees from sin''s law (v.2), gives life (v.11), leads (v.14), testifies to adoption (v.16), helps in weakness (v.26), and intercedes (v.26-27). Chapter 7 describes life under the law without the Spirit; chapter 8 describes life in the Spirit with all its power and assurance.',
  '["No Condemnation: The Law of the Spirit (vv.1-4): There is therefore now no condemnation to them which are in Christ Jesus who walk not after the flesh but after the Spirit for the law of the Spirit of life in Christ Jesus hath made me free from the law of sin and death for what the law could not do in that it was weak through the flesh God sending his own Son in the likeness of sinful flesh and for sin condemned sin in the flesh that the righteousness of the law might be fulfilled in us","Life in the Spirit vs Life in the Flesh (vv.5-13): For they that are after the flesh do mind the things of the flesh but they that are after the Spirit the things of the Spirit for to be carnally minded is death but to be spiritually minded is life and peace but ye are not in the flesh but in the Spirit if so be that the Spirit of God dwell in you","Sons of God: Adoption and Heirship (vv.14-17): For as many as are led by the Spirit of God they are the sons of God for ye have not received the spirit of bondage again to fear but ye have received the Spirit of adoption whereby we cry Abba Father the Spirit itself beareth witness with our spirit that we are the children of God and if children then heirs heirs of God and joint-heirs with Christ","Present Suffering and Future Glory (vv.18-25): For I reckon that the sufferings of this present time are not worthy to be compared with the glory which shall be revealed in us for the earnest expectation of the creature waiteth for the manifestation of the sons of God","The Spirit Intercedes and All Things Work for Good (vv.26-30): Likewise the Spirit also helpeth our infirmities for we know not what we should pray for as we ought but the Spirit itself maketh intercession for us with groanings which cannot be uttered and we know that all things work together for good to them that love God for whom he did foreknow he also did predestinate to be conformed to the image of his Son moreover whom he did predestinate them he also called and whom he called them he also justified and whom he justified them he also glorified","More Than Conquerors: Nothing Can Separate Us (vv.31-39): What shall we then say to these things if God be for us who can be against us he that spared not his own Son but delivered him up for us all how shall he not with him also freely give us all things who shall separate us from the love of Christ nay in all these things we are more than conquerors through him that loved us for I am persuaded that neither death nor life nor angels nor principalities nor powers nor things present nor things to come nor height nor depth nor any other creature shall be able to separate us from the love of God which is in Christ Jesus our Lord"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 39 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'There is therefore now no condemnation to them which are in Christ Jesus, who walk not after the flesh, but after the Spirit.',
   'Οὐδὲν ἄρα νῦν κατάκριμα τοῖς ἐν Χριστῷ Ἰησοῦ μὴ κατὰ σάρκα περιπατοῦσιν ἀλλὰ κατὰ πνεῦμα',
   'Ouden ara nyn katakrima tois en Christō Iēsou mē kata sarka peripatousin alla kata pneuma',
   '''No condemnation'' (ouden katakrima — not a single verdict of guilty; absolutely none). ''Now'' (nyn — at this present time, in this new era). ''In Christ Jesus'' (en Christō Iēsou — the sphere of union with Christ; the key phrase). ''Walk not after the flesh, but after the Spirit'' — this clause describes the character of those in Christ, not the condition for being free from condemnation. The transition from ch.7''s despair to ch.8''s triumph is breathtaking: from ''wretched man'' to ''no condemnation.''',
   'This is one of the most glorious declarations in all of Scripture. After the agony of ch.7, Paul announces the verdict: NO condemnation — not reduced condemnation, not conditional condemnation, but NONE. The basis is not human performance but position: ''in Christ Jesus.'' Those who are united to Christ by faith share in his acquittal. The judge''s verdict is final and irreversible. This verse is the foundation of Christian assurance and the gateway to the greatest chapter in the Bible.'),
  (2, 'For the law of the Spirit of life in Christ Jesus hath made me free from the law of sin and death.',
   'ὁ γὰρ νόμος τοῦ πνεύματος τῆς ζωῆς ἐν Χριστῷ Ἰησοῦ ἠλευθέρωσέν με ἀπὸ τοῦ νόμου τῆς ἁμαρτίας καὶ τοῦ θανάτου',
   'ho gar nomos tou pneumatos tēs zōēs en Christō Iēsou ēleutherōsen me apo tou nomou tēs hamartias kai tou thanatou',
   '''Law of the Spirit of life'' (nomos tou pneumatos tēs zōēs — the operating principle of the life-giving Spirit). ''Made me free'' (ēleutherōsen me — liberated me; aorist: a decisive act of liberation). ''Law of sin and death'' (tou nomou tēs hamartias kai tou thanatou — the operating principle by which sin produces death). Two opposing ''laws'' (principles): the Spirit''s law liberates; sin''s law enslaves. The Spirit does what the Mosaic law could not: break sin''s power.',
   NULL),
  (3, 'For what the law could not do, in that it was weak through the flesh, God sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh:',
   'τὸ γὰρ ἀδύνατον τοῦ νόμου ἐν ᾧ ἠσθένει διὰ τῆς σαρκός ὁ θεὸς τὸν ἑαυτοῦ υἱὸν πέμψας ἐν ὁμοιώματι σαρκὸς ἁμαρτίας καὶ περὶ ἁμαρτίας κατέκρινεν τὴν ἁμαρτίαν ἐν τῇ σαρκί',
   'to gar adynaton tou nomou en hō ēsthenei dia tēs sarkos ho theos ton heautou huion pempsas en homoiōmati sarkos hamartias kai peri hamartias katekrinen tēn hamartian en tē sarki',
   '''What the law could not do'' (to adynaton tou nomou — the impossibility of the law; the law was powerless, not because of any defect in itself but because of the weakness of the flesh). ''His own Son'' (ton heautou huion — his very own Son; the emphasis on ownership heightens the cost). ''Likeness of sinful flesh'' (homoiōmati sarkos hamartias — in the likeness of flesh characterized by sin; Christ took real human flesh but without sin). ''For sin'' (peri hamartias — concerning sin; also a technical term for the sin offering in the LXX). ''Condemned sin in the flesh'' (katekrinen tēn hamartian en tē sarki — passed judgment on sin in the very arena where it had reigned). God did what the law could not: he dealt with sin definitively through the incarnation and crucifixion of his Son.',
   'This verse is a masterpiece of christological and soteriological precision. Three truths: (1) The law was powerless to save because of human weakness; (2) God solved the problem by sending his own Son in real human flesh; (3) In Christ''s flesh, God condemned sin — executed judgment on it in the very realm where it had held power. ''Condemned sin in the flesh'' means sin was judged, sentenced, and punished in Christ''s human body on the cross. What the law could not do, GOD DID.'),
  (4, 'That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.',
   'ἵνα τὸ δικαίωμα τοῦ νόμου πληρωθῇ ἐν ἡμῖν τοῖς μὴ κατὰ σάρκα περιπατοῦσιν ἀλλὰ κατὰ πνεῦμα',
   'hina to dikaiōma tou nomou plērōthē en hēmin tois mē kata sarka peripatousin alla kata pneuma',
   '''Righteousness of the law'' (to dikaiōma tou nomou — the righteous requirement, the just demand of the law). ''Fulfilled in us'' (plērōthē en hēmin — might be filled up in us; passive: God fulfils it in us through the Spirit). ''Walk … after the Spirit'' (kata pneuma — according to the Spirit''s direction). The law''s requirement is not abolished but fulfilled — not by human effort under the law but by the Spirit''s power in believers. This is 3:31 in practice: faith establishes the law by enabling its fulfilment.',
   NULL),
  (5, 'For they that are after the flesh do mind the things of the flesh; but they that are after the Spirit the things of the Spirit.',
   'οἱ γὰρ κατὰ σάρκα ὄντες τὰ τῆς σαρκὸς φρονοῦσιν οἱ δὲ κατὰ πνεῦμα τὰ τοῦ πνεύματος',
   'hoi gar kata sarka ontes ta tēs sarkos phronousin hoi de kata pneuma ta tou pneumatos',
   '''Mind'' (phronousin — set their minds on, think about, are preoccupied with). ''After the flesh'' (kata sarka — according to the flesh; those whose fundamental orientation is fleshly). ''After the Spirit'' (kata pneuma — those whose fundamental orientation is spiritual). Two fundamentally different orientations produce two fundamentally different mindsets. The ''mind'' here is not just intellectual but volitional: what you value, pursue, and live for.',
   NULL),
  (6, 'For to be carnally minded is death; but to be spiritually minded is life and peace.',
   'τὸ γὰρ φρόνημα τῆς σαρκὸς θάνατος τὸ δὲ φρόνημα τοῦ πνεύματος ζωὴ καὶ εἰρήνη',
   'to gar phronēma tēs sarkos thanatos to de phronēma tou pneumatos zōē kai eirēnē',
   '''Carnally minded'' (phronēma tēs sarkos — the mindset of the flesh). ''Spiritually minded'' (phronēma tou pneumatos — the mindset of the Spirit). ''Death'' vs ''life and peace'' — the outcomes are absolute opposites. The mind controlled by the flesh produces death; the mind controlled by the Spirit produces life and peace. This is not a warning to believers to try harder but a description of two fundamentally different states of being.',
   NULL),
  (7, 'Because the carnal mind is enmity against God: for it is not subject to the law of God, neither indeed can be.',
   'διότι τὸ φρόνημα τῆς σαρκὸς ἔχθρα εἰς θεόν τῷ γὰρ νόμῳ τοῦ θεοῦ οὐχ ὑποτάσσεται οὐδὲ γὰρ δύναται',
   'dioti to phronēma tēs sarkos echthra eis theon tō gar nomō tou theou ouch hypotassetai oude gar dynatai',
   '''Enmity against God'' (echthra eis theon — hostility toward God; the flesh is not merely weak but actively hostile). ''Not subject'' (ouch hypotassetai — does not submit). ''Neither indeed can be'' (oude gar dynatai — nor is it able to; it is constitutionally incapable). The flesh is not reformable — it cannot be improved, educated, or disciplined into obedience. This is why regeneration (new birth) is necessary, not reformation.',
   NULL),
  (8, 'So then they that are in the flesh cannot please God.',
   'οἱ δὲ ἐν σαρκὶ ὄντες θεῷ ἀρέσαι οὐ δύνανται',
   'hoi de en sarki ontes theō aresai ou dynantai',
   '''In the flesh'' (en sarki — in the sphere of the flesh; the unregenerate state). ''Cannot please God'' (theō aresai ou dynantai — are not able to please God). Total inability: apart from the Spirit, no one can do anything that pleases God. This is not about occasional failure but fundamental incapacity.',
   NULL),
  (9, 'But ye are not in the flesh, but in the Spirit, if so be that the Spirit of God dwell in you. Now if any man have not the Spirit of Christ, he is none of his.',
   'ὑμεῖς δὲ οὐκ ἐστὲ ἐν σαρκὶ ἀλλ᾿ ἐν πνεύματι εἴπερ πνεῦμα θεοῦ οἰκεῖ ἐν ὑμῖν εἰ δέ τις πνεῦμα Χριστοῦ οὐκ ἔχει οὗτος οὐκ ἔστιν αὐτοῦ',
   'hymeis de ouk este en sarki all en pneumati eiper pneuma theou oikei en hymin ei de tis pneuma Christou ouk echei houtos ouk estin autou',
   '''Not in the flesh, but in the Spirit'' — a declaration of the believers'' present state. ''If so be'' (eiper — if indeed, assuming that; not expressing doubt but stating a condition that Paul assumes is true for his readers). ''Spirit of God'' and ''Spirit of Christ'' are used interchangeably, confirming the Trinity. ''None of his'' (ouk estin autou — does not belong to him). The definitive test of being a Christian: the indwelling of the Holy Spirit. No Spirit = no Christ.',
   NULL),
  (10, 'And if Christ be in you, the body is dead because of sin; but the Spirit is life because of righteousness.',
   'εἰ δὲ Χριστὸς ἐν ὑμῖν τὸ μὲν σῶμα νεκρὸν δι᾿ ἁμαρτίαν τὸ δὲ πνεῦμα ζωὴ διὰ δικαιοσύνην',
   'ei de Christos en hymin to men sōma nekron di hamartian to de pneuma zōē dia dikaiosynēn',
   '''Christ in you'' — the indwelling of Christ through the Spirit. ''Body is dead because of sin'' — the physical body is still mortal, still subject to death as a consequence of sin. ''Spirit is life because of righteousness'' — the human spirit is alive because of the righteousness imputed and imparted through Christ. The body awaits future resurrection (v.11), but the spirit is already alive.',
   NULL),
  (11, 'But if the Spirit of him that raised up Jesus from the dead dwell in you, he that raised up Christ from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you.',
   'εἰ δὲ τὸ πνεῦμα τοῦ ἐγείραντος Ἰησοῦν ἐκ νεκρῶν οἰκεῖ ἐν ὑμῖν ὁ ἐγείρας τὸν Χριστὸν ἐκ νεκρῶν ζωοποιήσει καὶ τὰ θνητὰ σώματα ὑμῶν διὰ τοῦ ἐνοικοῦντος αὐτοῦ πνεύματος ἐν ὑμῖν',
   'ei de to pneuma tou egeirantos Iēsoun ek nekrōn oikei en hymin ho egeiras ton Christon ek nekrōn zōopoiēsei kai ta thnēta sōmata hymōn dia tou enoikountos autou pneumatos en hymin',
   '''The Spirit of him that raised up Jesus'' — the same Spirit who raised Christ from the dead now indwells believers. ''Quicken your mortal bodies'' (zōopoiēsei ta thnēta sōmata — will give life to your mortal bodies). The resurrection of believers'' bodies is guaranteed by the indwelling of the same Spirit who raised Christ. The Spirit''s present indwelling is the down payment (arrabōn, cf. 2 Cor 1:22) of future bodily resurrection.',
   NULL),
  (12, 'Therefore, brethren, we are debtors, not to the flesh, to live after the flesh.',
   'ἄρα οὖν ἀδελφοί ὀφειλέται ἐσμέν οὐ τῇ σαρκὶ τοῦ κατὰ σάρκα ζῆν',
   'ara oun adelphoi opheiletai esmen ou tē sarki tou kata sarka zēn',
   '''Debtors'' (opheiletai — those under obligation). ''Not to the flesh'' — we owe the flesh nothing. The flesh did not save us, sustain us, or promise us anything good. We have no obligation to serve the old master. The implied positive: we are debtors to the Spirit, to live according to the Spirit.',
   NULL),
  (13, 'For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live.',
   'εἰ γὰρ κατὰ σάρκα ζῆτε μέλλετε ἀποθνήσκειν εἰ δὲ πνεύματι τὰς πράξεις τοῦ σώματος θανατοῦτε ζήσεσθε',
   'ei gar kata sarka zēte mellete apothnēskein ei de pneumati tas praxeis tou sōmatos thanatoute zēsesthe',
   '''If ye live after the flesh, ye shall die'' — a solemn warning. ''Mortify'' (thanatoute — put to death, kill; present tense: ongoing action). ''Deeds of the body'' (tas praxeis tou sōmatos — the practices, habits of the body as sin''s instrument). ''Through the Spirit'' (pneumati — by means of the Spirit; the Spirit is the power source for mortification). Believers do not mortify sin by willpower but by the Spirit''s power. The Spirit enables what the law demanded but could not produce.',
   NULL),
  (14, 'For as many as are led by the Spirit of God, they are the sons of God.',
   'ὅσοι γὰρ πνεύματι θεοῦ ἄγονται οὗτοι εἰσιν υἱοὶ θεοῦ',
   'hosoi gar pneumati theou agontai houtoi eisin huioi theou',
   '''Led by the Spirit'' (pneumati theou agontai — guided, directed by God''s Spirit; present tense: continually led). ''Sons of God'' (huioi theou — not merely children [tekna] but sons, heirs with full rights). Being ''led by the Spirit'' is not mystical guidance about daily decisions but the Spirit''s work of directing believers away from the flesh and toward God. Those so led are confirmed as God''s sons.',
   NULL),
  (15, 'For ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father.',
   'οὐ γὰρ ἐλάβετε πνεῦμα δουλείας πάλιν εἰς φόβον ἀλλ᾿ ἐλάβετε πνεῦμα υἱοθεσίας ἐν ᾧ κράζομεν Ἀββᾶ ὁ πατήρ',
   'ou gar elabete pneuma douleias palin eis phobon all elabete pneuma huiothesias en hō krazomen Abba ho patēr',
   '''Spirit of bondage'' (pneuma douleias — a spirit characterized by slavery and fear; this is what the law-regime produced). ''Spirit of adoption'' (pneuma huiothesias — the Spirit who effects adoption; huiothesia is a legal term: the formal placement of a person as son and heir). ''Abba, Father'' (Abba ho patēr — the Aramaic and Greek terms for father side by side; Abba is the intimate family term, expressing the closest filial affection). ''Cry'' (krazomen — cry out, call aloud; not a whisper but a confident shout). The Spirit enables believers to call God ''Father'' with the same intimacy that Jesus himself used.',
   'The doctrine of adoption (huiothesia) is distinct from regeneration (new birth). Regeneration gives new life; adoption gives new status. In Roman law, an adopted son had the same rights as a natural-born son — including the right of inheritance. The Spirit of adoption replaces the spirit of bondage (fear before the law) with confident, intimate access to God as Father. The bilingual ''Abba, Father'' reflects the universal church: Aramaic-speaking Jewish believers and Greek-speaking Gentile believers both cry out to the same Father.'),
  (16, 'The Spirit itself beareth witness with our spirit, that we are the children of God:',
   'αὐτὸ τὸ πνεῦμα συμμαρτυρεῖ τῷ πνεύματι ἡμῶν ὅτι ἐσμὲν τέκνα θεοῦ',
   'auto to pneuma symmartуrei tō pneumati hēmōn hoti esmen tekna theou',
   '''Beareth witness with'' (symmartyrei — co-testifies, bears joint witness; the Spirit''s testimony combines with the believer''s spirit''s inner awareness). ''Children of God'' (tekna theou — born ones of God; emphasizing the family relationship). The assurance of salvation has two witnesses: the Holy Spirit''s internal testimony and the believer''s own spirit. This is not mere feeling but the Spirit''s authoritative confirmation.',
   NULL),
  (17, 'And if children, then heirs; heirs of God, and joint-heirs with Christ; if so be that we suffer with him, that we may be also glorified together.',
   'εἰ δὲ τέκνα καὶ κληρονόμοι κληρονόμοι μὲν θεοῦ συγκληρονόμοι δὲ Χριστοῦ εἴπερ συμπάσχομεν ἵνα καὶ συνδοξασθῶμεν',
   'ei de tekna kai klēronomoi klēronomoi men theou synklēronomoi de Christou eiper sympaschomen hina kai syndoxasthōmen',
   '''Heirs of God'' (klēronomoi theou — we inherit what belongs to God). ''Joint-heirs with Christ'' (synklēronomoi Christou — co-heirs who share Christ''s inheritance). ''Suffer with him'' (sympaschomen — co-suffer). ''Glorified together'' (syndoxasthōmen — co-glorified). The logic: children → heirs → co-heirs with Christ. The path to glory passes through suffering (sympaschomen → syndoxasthōmen). Shared suffering leads to shared glory.',
   NULL),
  (18, 'For I reckon that the sufferings of this present time are not worthy to be compared with the glory which shall be revealed in us.',
   'λογίζομαι γὰρ ὅτι οὐκ ἄξια τὰ παθήματα τοῦ νῦν καιροῦ πρὸς τὴν μέλλουσαν δόξαν ἀποκαλυφθῆναι εἰς ἡμᾶς',
   'logizomai gar hoti ouk axia ta pathēmata tou nyn kairou pros tēn mellousan doxan apokalyphthēnai eis hēmas',
   '''I reckon'' (logizomai — I calculate, I have done the math). ''Not worthy to be compared'' (ouk axia — not of equal weight; the scales are not even close). ''The glory which shall be revealed in us'' (tēn mellousan doxan apokalyphthēnai eis hēmas — the coming glory to be unveiled toward/in us). Paul puts present suffering on one side of the scale and future glory on the other: the glory so vastly outweighs the suffering that comparison is meaningless.',
   NULL),
  (19, 'For the earnest expectation of the creature waiteth for the manifestation of the sons of God.',
   'ἡ γὰρ ἀποκαραδοκία τῆς κτίσεως τὴν ἀποκάλυψιν τῶν υἱῶν τοῦ θεοῦ ἀπεκδέχεται',
   'hē gar apokaradokia tēs ktiseōs tēn apokalypsin tōn huiōn tou theou apekdechetai',
   '''Earnest expectation'' (apokaradokia — eager, intense watching; from apo + kara [head] + dokeō [to look]: craning the neck forward, straining to see). ''Creature'' (ktiseōs — creation; the non-human created order). ''Manifestation'' (apokalypsin — revelation, unveiling). ''Waiteth'' (apekdechetai — waits eagerly, expectantly). Creation itself is personified as straining forward, waiting on tiptoe for the day when God''s children will be fully revealed in glory.',
   NULL),
  (20, 'For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope,',
   'τῇ γὰρ ματαιότητι ἡ κτίσις ὑπετάγη οὐχ ἑκοῦσα ἀλλὰ διὰ τὸν ὑποτάξαντα ἐπ᾿ ἐλπίδι',
   'tē gar mataiotēti hē ktisis hypetagē ouch hekousa alla dia ton hypotaxanta ep elpidi',
   '''Vanity'' (mataiotēti — futility, frustration, purposelessness). ''Not willingly'' — creation did not choose to be subjected to futility; it was subjected by God as a consequence of Adam''s fall (Genesis 3:17-19). ''In hope'' — the subjection was not permanent but purposeful: God subjected creation with the hope of future liberation.',
   NULL),
  (21, 'Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of God.',
   'ὅτι καὶ αὐτὴ ἡ κτίσις ἐλευθερωθήσεται ἀπὸ τῆς δουλείας τῆς φθορᾶς εἰς τὴν ἐλευθερίαν τῆς δόξης τῶν τέκνων τοῦ θεοῦ',
   'hoti kai autē hē ktisis eleutherōthēsetai apo tēs douleias tēs phthoras eis tēn eleutherian tēs doxēs tōn teknōn tou theou',
   '''Delivered'' (eleutherōthēsetai — will be set free). ''Bondage of corruption'' (douleias tēs phthoras — slavery to decay, entropy, death). ''Glorious liberty'' (eleutherian tēs doxēs — the freedom that belongs to glory). Creation''s destiny is tied to humanity''s: when God''s children are fully glorified, creation itself will be liberated from its bondage to decay. The new heavens and new earth are creation''s inheritance.',
   NULL),
  (22, 'For we know that the whole creation groaneth and travaileth in pain together until now.',
   'οἴδαμεν γὰρ ὅτι πᾶσα ἡ κτίσις συστενάζει καὶ συνωδίνει ἄχρι τοῦ νῦν',
   'oidamen gar hoti pasa hē ktisis systenazei kai synōdinei achri tou nyn',
   '''Groaneth'' (systenazei — groans together). ''Travaileth'' (synōdinei — is in labour pains together). The pain is not death-agony but birth-pangs: creation is not dying but in labour, anticipating the birth of a new world. The ''until now'' (achri tou nyn) indicates that the groaning continues to the present moment.',
   NULL),
  (23, 'And not only they, but ourselves also, which have the firstfruits of the Spirit, even we ourselves groan within ourselves, waiting for the adoption, to wit, the redemption of our body.',
   'οὐ μόνον δέ ἀλλὰ καὶ αὐτοὶ τὴν ἀπαρχὴν τοῦ πνεύματος ἔχοντες καὶ ἡμεῖς αὐτοὶ ἐν ἑαυτοῖς στενάζομεν υἱοθεσίαν ἀπεκδεχόμενοι τὴν ἀπολύτρωσιν τοῦ σώματος ἡμῶν',
   'ou monon de alla kai autoi tēn aparchēn tou pneumatos echontes kai hēmeis autoi en heautois stenazomen huiothesian apekdechomenoi tēn apolytrōsin tou sōmatos hēmōn',
   '''Firstfruits of the Spirit'' (tēn aparchēn tou pneumatos — the Spirit is the first instalment of our inheritance). ''Groan within ourselves'' — even believers groan, not in despair but in longing. ''Waiting for the adoption'' — adoption is already received (v.15) but not yet complete: the final aspect is bodily resurrection. ''Redemption of our body'' (tēn apolytrōsin tou sōmatos — the liberation of the physical body from mortality). Salvation is not complete until the body is redeemed.',
   NULL),
  (24, 'For we are saved by hope: but hope that is seen is not hope: for what a man seeth, why doth he yet hope for?',
   'τῇ γὰρ ἐλπίδι ἐσώθημεν ἐλπὶς δὲ βλεπομένη οὐκ ἔστιν ἐλπίς ὃ γὰρ βλέπει τις τί καὶ ἐλπίζει',
   'tē gar elpidi esōthēmen elpis de blepomenē ouk estin elpis ho gar blepei tis ti kai elpizei',
   '''Saved by hope'' (tē elpidi esōthēmen — saved in the sphere of hope; hope is the mode of our present salvation). ''Hope that is seen is not hope'' — by definition, hope deals with the not-yet-visible. If you can see it, you don''t need to hope for it. Christian life involves confident waiting for what God has promised but not yet fully delivered.',
   NULL),
  (25, 'But if we hope for that we see not, then do we with patience wait for it.',
   'εἰ δὲ ὃ οὐ βλέπομεν ἐλπίζομεν δι᾿ ὑπομονῆς ἀπεκδεχόμεθα',
   'ei de ho ou blepomen elpizomen di hypomonēs apekdechometha',
   '''Patience'' (hypomonēs — endurance, steadfast waiting). ''Wait'' (apekdechometha — eagerly expect). Christian patience is not passive resignation but active, expectant endurance. We wait because we are certain of the outcome; we endure because the outcome has not yet arrived.',
   NULL),
  (26, 'Likewise the Spirit also helpeth our infirmities: for we know not what we should pray for as we ought: but the Spirit itself maketh intercession for us with groanings which cannot be uttered.',
   'ὡσαύτως δὲ καὶ τὸ πνεῦμα συναντιλαμβάνεται ταῖς ἀσθενείαις ἡμῶν τὸ γὰρ τί προσευξώμεθα καθὸ δεῖ οὐκ οἴδαμεν ἀλλ᾿ αὐτὸ τὸ πνεῦμα ὑπερεντυγχάνει ὑπὲρ ἡμῶν στεναγμοῖς ἀλαλήτοις',
   'hōsautōs de kai to pneuma synantilambanetai tais astheneiais hēmōn to gar ti proseuxōmetha katho dei ouk oidamen all auto to pneuma hyperentynchanei hyper hēmōn stenagmois alalētois',
   '''Helpeth'' (synantilambanetai — takes hold together with, lends a helping hand; a beautiful compound: syn + anti + lambanō — the Spirit grabs hold from the other side and shares the burden). ''Infirmities'' (astheneiais — weaknesses). ''We know not what we should pray for'' — an astonishing admission of human inadequacy. ''Maketh intercession'' (hyperentynchanei — intercedes on behalf of). ''Groanings which cannot be uttered'' (stenagmois alalētois — wordless groanings, too deep for human language). The Spirit prays through us and for us when we cannot pray for ourselves.',
   'This verse reveals one of the most intimate ministries of the Holy Spirit: intercessory prayer within the believer. When we are so burdened, confused, or weak that we cannot even formulate proper prayers, the Spirit himself takes over and intercedes with groans that transcend human language. These groanings are not deficient — they perfectly express what the believer needs but cannot articulate. The Spirit''s intercession ensures that no prayer need goes unmet, even when the believer is too overwhelmed to pray.'),
  (27, 'And he that searcheth the hearts knoweth what is the mind of the Spirit, because he maketh intercession for the saints according to the will of God.',
   'ὁ δὲ ἐρευνῶν τὰς καρδίας οἶδεν τί τὸ φρόνημα τοῦ πνεύματος ὅτι κατὰ θεὸν ἐντυγχάνει ὑπὲρ ἁγίων',
   'ho de eraunōn tas kardias oiden ti to phronēma tou pneumatos hoti kata theon entynchanei hyper hagiōn',
   '''Searcheth the hearts'' (eraunōn tas kardias — God who investigates the deepest recesses of the human heart). ''Mind of the Spirit'' (phronēma tou pneumatos — what the Spirit is thinking/intending). ''According to the will of God'' (kata theon — in accordance with God''s will). The Father who searches hearts understands the Spirit''s intercession perfectly. The Spirit always prays according to God''s will, ensuring that every intercession is perfectly aligned with divine purposes.',
   NULL),
  (28, 'And we know that all things work together for good to them that love God, to them who are the called according to his purpose.',
   'οἴδαμεν δὲ ὅτι τοῖς ἀγαπῶσιν τὸν θεὸν πάντα συνεργεῖ εἰς ἀγαθόν τοῖς κατὰ πρόθεσιν κλητοῖς οὖσιν',
   'oidamen de hoti tois agapōsin ton theon panta synergei eis agathon tois kata prothesin klētois ousin',
   '''We know'' (oidamen — we know with certainty). ''All things'' (panta — everything, without exception). ''Work together'' (synergei — cooperate, work in concert; all things collaborate under God''s sovereign direction). ''For good'' (eis agathon — toward the ultimate good). ''Them that love God'' — the promise is not for everyone indiscriminately but for those who love God. ''Called according to his purpose'' (kata prothesin klētois — called in accordance with God''s predetermined plan). Providence is not blind fate but purposeful orchestration by a loving Father.',
   'This is one of the most comforting and most misused verses in Scripture. It does not say that all things ARE good (they are not) but that all things WORK TOGETHER for good. Individual events may be painful, unjust, or tragic, but God weaves them into a tapestry that serves the ultimate good of his children. The ''good'' is defined in v.29: conformity to the image of Christ. The promise is limited to ''them that love God'' — those who are ''called according to his purpose.'' This is not karma or optimism but sovereign providence.'),
  (29, 'For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren.',
   'ὅτι οὓς προέγνω καὶ προώρισεν συμμόρφους τῆς εἰκόνος τοῦ υἱοῦ αὐτοῦ εἰς τὸ εἶναι αὐτὸν πρωτότοκον ἐν πολλοῖς ἀδελφοῖς',
   'hoti hous proegnō kai proōrisen symmorphous tēs eikonos tou huiou autou eis to einai auton prōtotokon en pollois adelphois',
   '''Foreknow'' (proegnō — knew beforehand; not merely foresight but foreloving, choosing to know intimately in advance). ''Predestinate'' (proōrisen — predetermined, marked out beforehand; from pro + horizō). ''Conformed to the image of his Son'' (symmorphous tēs eikonos tou huiou — shaped into the likeness of his Son). ''Firstborn among many brethren'' (prōtotokon en pollois adelphois — Christ is the prototype; believers are being shaped into his likeness). The goal of predestination is not merely salvation but Christlikeness.',
   'This verse begins the ''golden chain'' of salvation (vv.29-30). The goal of God''s eternal purpose is revealed: to conform believers to the image of his Son. Salvation is not primarily about getting people to heaven but about making them like Christ. ''Firstborn among many brethren'' means Christ is the original and believers are copies of the same family likeness. The entire process — foreknowledge, predestination, calling, justification, glorification — serves this single grand purpose.'),
  (30, 'Moreover whom he did predestinate, them he also called: and whom he called, them he also justified: and whom he justified, them he also glorified.',
   'οὓς δὲ προώρισεν τούτους καὶ ἐκάλεσεν καὶ οὓς ἐκάλεσεν τούτους καὶ ἐδικαίωσεν οὓς δὲ ἐδικαίωσεν τούτους καὶ ἐδόξασεν',
   'hous de proōrisen toutous kai ekalesen kai hous ekalesen toutous kai edikaiōsen hous de edikaiōsen toutous kai edoxasen',
   'The golden chain: foreknown → predestinated → called → justified → GLORIFIED. Note: ''glorified'' (edoxasen) is in the PAST tense (aorist), though glorification is still future. God views the entire process as so certain that he speaks of the last link in the chain as already accomplished. In God''s purpose, glorification is as settled as justification. No link breaks; no one drops out between calling and glorifying.',
   'The aorist tense of ''glorified'' (edoxasen — he glorified) is one of the most stunning grammatical features in the NT. Glorification has not yet happened in our experience, but Paul uses the past tense because in God''s purpose it is as certain as if it had already occurred. The chain is unbreakable: every person foreknown is predestinated; every one predestinated is called; every one called is justified; every one justified is glorified. No attrition between the links. This is the foundation of the assurance that fills vv.31-39.'),
  (31, 'What shall we then say to these things? If God be for us, who can be against us?',
   'τί οὖν ἐροῦμεν πρὸς ταῦτα εἰ ὁ θεὸς ὑπὲρ ἡμῶν τίς καθ᾿ ἡμῶν',
   'ti oun eroumen pros tauta ei ho theos hyper hēmōn tis kath hēmōn',
   '''What shall we say to these things?'' (ti eroumen pros tauta — in light of everything Paul has said from ch.1 to here). ''If God be for us'' (ei ho theos hyper hēmōn — if God is on our side; the ''if'' is not doubtful but assumed: since God is for us). ''Who can be against us?'' — the answer is not ''no one will oppose us'' but ''no opposition can ultimately prevail.'' The question is rhetorical: no adversary can overcome the God who has justified and glorified us.',
   NULL),
  (32, 'He that spared not his own Son, but delivered him up for us all, how shall he not with him also freely give us all things?',
   'ὅς γε τοῦ ἰδίου υἱοῦ οὐκ ἐφείσατο ἀλλ᾿ ὑπὲρ ἡμῶν πάντων παρέδωκεν αὐτόν πῶς οὐχὶ καὶ σὺν αὐτῷ τὰ πάντα ἡμῖν χαρίσεται',
   'hos ge tou idiou huiou ouk epheisato all hyper hēmōn pantōn paredōken auton pōs ouchi kai syn autō ta panta hēmin charisetai',
   '''Spared not his own Son'' (tou idiou huiou ouk epheisato — did not spare his very own Son; echoing Genesis 22:12, 16, where Abraham did not spare Isaac). ''Delivered him up for us all'' (paredōken auton — handed him over; the same verb used for Judas''s betrayal and for God ''giving up'' sinners in 1:24, 26, 28; but here God gives up his own Son). ''Freely give us all things'' (ta panta hēmin charisetai — grace-give us everything). The argument from greater to lesser: if God gave the greatest gift (his Son), will he withhold lesser gifts? Impossible.',
   NULL),
  (33, 'Who shall lay any thing to the charge of God''s elect? It is God that justifieth.',
   'τίς ἐγκαλέσει κατὰ ἐκλεκτῶν θεοῦ θεὸς ὁ δικαιῶν',
   'tis enkalései kata eklektōn theou theos ho dikaiōn',
   '''Lay to the charge'' (enkalései — bring a formal accusation, indict). ''God''s elect'' (eklektōn theou — God''s chosen ones). ''God that justifieth'' (theos ho dikaiōn — God is the one who declares righteous). If the supreme Judge has already rendered the verdict of ''righteous,'' who can overturn it? The prosecutor has become the defender; the judge has become the justifier. No accusation can stand against those whom God has acquitted.',
   NULL),
  (34, 'Who is he that condemneth? It is Christ that died, yea rather, that is risen again, who is even at the right hand of God, who also maketh intercession for us.',
   'τίς ὁ κατακρινῶν Χριστὸς ὁ ἀποθανών μᾶλλον δὲ καὶ ἐγερθείς ὃς καὶ ἔστιν ἐν δεξιᾷ τοῦ θεοῦ ὃς καὶ ἐντυγχάνει ὑπὲρ ἡμῶν',
   'tis ho katakrinōn Christos ho apothanōn mallon de kai egertheis hos kai estin en dexia tou theou hos kai entynchanei hyper hēmōn',
   '''Who is he that condemneth?'' — four truths that make condemnation impossible: (1) ''Christ died'' — the penalty has been paid; (2) ''is risen again'' — the payment was accepted; (3) ''at the right hand of God'' — he has the position of supreme authority; (4) ''maketh intercession for us'' — he continually advocates on our behalf. The very one who could condemn is the one who died for us, rose for us, rules for us, and prays for us.',
   NULL),
  (35, 'Who shall separate us from the love of Christ? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?',
   'τίς ἡμᾶς χωρίσει ἀπὸ τῆς ἀγάπης τοῦ Χριστοῦ θλῖψις ἢ στενοχωρία ἢ διωγμὸς ἢ λιμὸς ἢ γυμνότης ἢ κίνδυνος ἢ μάχαιρα',
   'tis hēmas chōrisei apo tēs agapēs tou Christou thlipsis ē stenochōria ē diōgmos ē limos ē gymnotēs ē kindynos ē machaira',
   '''Who shall separate'' (tis chōrisei — who will divide, cut off, create a gap between). ''Love of Christ'' (tēs agapēs tou Christou — Christ''s love for us). Seven potential separators listed: tribulation, distress, persecution, famine, nakedness, peril, sword. Paul is not theorizing — he had experienced all of these (cf. 2 Cor 11:23-28). The question expects the answer: none of them.',
   NULL),
  (36, 'As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter.',
   'καθὼς γέγραπται ὅτι ἕνεκεν σοῦ θανατούμεθα ὅλην τὴν ἡμέραν ἐλογίσθημεν ὡς πρόβατα σφαγῆς',
   'kathōs gegraptai hoti heneken sou thanatoumetha holēn tēn hēmeran elogisthēmen hōs probata sphagēs',
   'Quoting Psalm 44:22. ''Killed all the day long'' — suffering is constant and expected. ''Sheep for the slaughter'' — believers are led to death like animals to the abattoir. This is not defeat but the context of victory: it is precisely IN these circumstances that believers are more than conquerors.',
   NULL),
  (37, 'Nay, in all these things we are more than conquerors through him that loved us.',
   'ἀλλ᾿ ἐν τούτοις πᾶσιν ὑπερνικῶμεν διὰ τοῦ ἀγαπήσαντος ἡμᾶς',
   'all en toutois pasin hypernikōmen dia tou agapēsantos hēmas',
   '''More than conquerors'' (hypernikōmen — super-conquerors, overwhelming victors; from hyper + nikaō). ''Through him that loved us'' (dia tou agapēsantos hēmas — through the one who loved us). Not merely conquerors but HYPER-conquerors. And the victory is not by our strength but ''through him.'' We do not conquer IN SPITE OF suffering but IN and THROUGH suffering. Christ''s love transforms every trial into a triumph.',
   NULL),
  (38, 'For I am persuaded, that neither death, nor life, nor angels, nor principalities, nor powers, nor things present, nor things to come,',
   'πέπεισμαι γὰρ ὅτι οὔτε θάνατος οὔτε ζωὴ οὔτε ἄγγελοι οὔτε ἀρχαὶ οὔτε δυνάμεις οὔτε ἐνεστῶτα οὔτε μέλλοντα',
   'pepeismai gar hoti oute thanatos oute zōē oute angeloi oute archai oute dynameis oute enestōta oute mellonta',
   '''I am persuaded'' (pepeismai — I have been convinced and remain convinced; perfect tense: settled, unshakeable conviction). Paul lists ten potential separators in pairs: death/life, angels/principalities, powers/things present/things to come, height/depth, any other creature. The list is cosmic in scope — it covers every conceivable reality in the universe.',
   NULL),
  (39, 'Nor height, nor depth, nor any other creature, shall be able to separate us from the love of God, which is in Christ Jesus our Lord.',
   'οὔτε ὕψωμα οὔτε βάθος οὔτε τις κτίσις ἑτέρα δυνήσεται ἡμᾶς χωρίσαι ἀπὸ τῆς ἀγάπης τοῦ θεοῦ τῆς ἐν Χριστῷ Ἰησοῦ τῷ κυρίῳ ἡμῶν',
   'oute hypsōma oute bathos oute tis ktisis hetera dynēsetai hēmas chōrisai apo tēs agapēs tou theou tēs en Christō Iēsou tō kyriō hēmōn',
   '''Height'' (hypsōma — the highest point of heaven). ''Depth'' (bathos — the deepest abyss). ''Any other creature'' (tis ktisis hetera — any other created thing; a catch-all to cover anything Paul might have missed). ''Shall be able'' (dynēsetai — will have the power). ''The love of God, which is in Christ Jesus our Lord'' — the final phrase of the chapter, and perhaps the most glorious in all of Scripture. God''s love is located ''in Christ'' — it is as secure as Christ himself, and nothing in all creation can pry the believer loose from it.',
   'These two verses (38-39) form the climax of Romans 1-8. Paul''s list of ten items covers every dimension of reality: temporal (death, life, things present, things to come), supernatural (angels, principalities, powers), spatial (height, depth), and categorical (any other creature). The conclusion is absolute: NOTHING in all creation has the power to separate the believer from God''s love in Christ. This is the ultimate statement of eternal security, grounded not in human faithfulness but in divine love. The chapter that began with ''no condemnation'' (v.1) ends with ''no separation'' (v.39) — the believer is eternally secure in Christ.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 8;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 condemnation
  ('κατάκριμα', 'katakrima', 'G2631', 'Condemnation, the sentence following judgment — from kata (against) + krima (judgment). Katakrima is the judicial verdict of guilty and the sentence that follows. For those in Christ Jesus, this verdict has been permanently removed. The sentence was borne by Christ; the believer walks free. This is not merely ''no punishment'' but ''no guilty verdict'' — the legal record is clean.', 1),
  -- v.15 adoption
  ('υἱοθεσία', 'huiothesia', 'G5206', 'Adoption, the placing as a son — from huios (son) + tithēmi (to place). A Roman legal term for the formal act by which a person was placed in the position of a son with full rights of inheritance. The adopted person received a new name, a new family, and a new legal status. The Spirit of adoption replaces the spirit of bondage, giving believers confidence to cry Abba Father.', 2),
  -- v.26 helpeth
  ('συναντιλαμβάνομαι', 'synantilambanоmai', 'G4878', 'To take hold of together with, to help by sharing a burden — a triple compound: syn (with) + anti (over against) + lambanō (to take hold). The Spirit takes hold of our burden from the other end and helps us carry it. In prayer, this means the Spirit does not replace our prayers but shares the burden of praying, carrying what we cannot carry alone.', 3),
  -- v.28 work together
  ('συνεργέω', 'synergeō', 'G4903', 'To work together, to cooperate — from syn (together) + ergon (work). All things collaborate under God''s sovereign direction to produce good for those who love him. Individual events may be painful or confusing, but God orchestrates them into a pattern that serves his purposes. The ''good'' is defined in v.29: conformity to the image of Christ.', 4),
  -- v.29 predestinate / conformed
  ('προορίζω', 'proorizō', 'G4309', 'To predetermine, to decide beforehand, to mark out in advance — from pro (before) + horizō (to set a boundary). God determined in advance the destiny of those he foreknew: to be conformed to Christ''s image. Predestination is not fatalism but the loving purpose of a Father who planned his family before the foundation of the world.', 5),
  ('σύμμορφος', 'symmorphos', 'G4832', 'Conformed to, having the same form as — from syn (with) + morphē (form, essential nature). The goal of predestination is Christlikeness: believers are being shaped into the very image of God''s Son. This is not mere imitation but transformation into the same essential form. Christ is the prototype (prōtotokon); believers are the copies of the same family likeness.', 6),
  -- v.37 more than conquerors
  ('ὑπερνικάω', 'hypernikaō', 'G5245', 'To more than conquer, to gain a surpassing victory — from hyper (beyond, above) + nikaō (to conquer). Found only here in the NT. Believers do not merely survive trials; they achieve overwhelming victory through them. The victory is not merely over suffering but through it: suffering becomes the instrument of triumph. And the power source is not human will but Christ''s love.', 7)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 8
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 15
    WHEN 3 THEN 26
    WHEN 4 THEN 28
    WHEN 5 THEN 29 WHEN 6 THEN 29
    WHEN 7 THEN 37
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 no condemnation
  (1, 'John 3:18', 1),
  (1, 'John 5:24', 2),
  (1, 'Romans 5:1', 3),
  -- v.2 law of Spirit of life
  (2, '2 Corinthians 3:6', 4),
  (2, 'Galatians 5:18', 5),
  -- v.3 God sending his Son
  (3, '2 Corinthians 5:21', 6),
  (3, 'Galatians 4:4-5', 7),
  (3, 'Hebrews 10:5-10', 8),
  -- v.4 righteousness fulfilled in us
  (4, 'Romans 3:31', 9),
  (4, 'Galatians 5:16', 10),
  -- v.9 Spirit of Christ
  (9, '1 Corinthians 3:16', 11),
  (9, '1 Corinthians 6:19', 12),
  -- v.11 quicken mortal bodies
  (11, '1 Corinthians 6:14', 13),
  (11, '2 Corinthians 4:14', 14),
  -- v.14 sons of God
  (14, 'Galatians 3:26', 15),
  -- v.15 spirit of adoption - Abba
  (15, 'Galatians 4:6', 16),
  (15, 'Mark 14:36', 17),
  -- v.17 joint-heirs with Christ
  (17, 'Galatians 4:7', 18),
  (17, '2 Timothy 2:12', 19),
  -- v.18 sufferings not comparable to glory
  (18, '2 Corinthians 4:17', 20),
  (18, '1 Peter 1:6-7', 21),
  -- v.21 creation delivered
  (21, '2 Peter 3:13', 22),
  (21, 'Revelation 21:1', 23),
  -- v.26 Spirit intercedes
  (26, 'Hebrews 7:25', 24),
  -- v.28 all things work together
  (28, 'Jeremiah 29:11', 25),
  (28, 'Ephesians 1:11', 26),
  -- v.29 conformed to his image
  (29, '2 Corinthians 3:18', 27),
  (29, '1 John 3:2', 28),
  -- v.30 golden chain
  (30, 'Ephesians 1:4-5', 29),
  (30, 'Ephesians 1:11', 30),
  -- v.32 spared not his own Son
  (32, 'Genesis 22:12', 31),
  (32, 'John 3:16', 32),
  (32, 'Romans 5:8', 33),
  -- v.33 who shall lay charge
  (33, 'Isaiah 50:8-9', 34),
  -- v.34 Christ intercedes
  (34, 'Hebrews 7:25', 35),
  (34, '1 John 2:1', 36),
  -- v.36 sheep for slaughter
  (36, 'Psalm 44:22', 37),
  -- v.37 more than conquerors
  (37, '1 Corinthians 15:57', 38),
  (37, '2 Corinthians 2:14', 39),
  -- v.38-39 nothing can separate
  (38, 'John 10:28-29', 40),
  (39, 'Ephesians 3:18-19', 41)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 8
  AND v.verse_number = cr.verse_number;
