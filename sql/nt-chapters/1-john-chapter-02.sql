-- ═══════════════════════════════════════════════════
-- 1 JOHN CHAPTER 2 — The Advocate, the Tests, and the Antichrist
-- 29 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '1 John 2 opens with a pastoral assurance: ''if any man sin, we have an advocate with the Father, Jesus Christ the righteous'' (v.1), and Christ is ''the propitiation for our sins: and not for ours only, but also for the whole world'' (v.2). John then introduces the first of his great tests of genuine faith: obedience (vv.3-6). The one who claims to know God but does not keep His commandments is a liar. A ''new commandment'' — the old-yet-new command to love — is then discussed (vv.7-11): the one who hates his brother is in darkness. John addresses three groups — fathers, young men, and little children — with tailored encouragement (vv.12-14). He then warns against love of the world: ''the lust of the flesh, and the lust of the eyes, and the pride of life'' are not of the Father (vv.15-17). The chapter closes with the warning about antichrists: ''even now are there many antichrists'' (v.18) who went out from the church because they were never truly of it (v.19). The believers'' defence is the ''unction from the Holy One'' — the anointing of the Spirit who teaches all things (vv.20, 27).',
  'Tests of True Fellowship — Obedience, Love, and Sound Doctrine',
  'παράκλητον (paraklēton)',
  'Advocate, one called alongside, intercessor — from para (beside) + kaleō (to call). In a legal sense, one who appears in court on another''s behalf, a defence attorney. Jesus is the believer''s advocate before the Father when sin occurs.',
  '["Our Advocate and Propitiation (vv.1-2): My little children these things write I unto you that ye sin not; and if any man sin we have an advocate with the Father Jesus Christ the righteous; and he is the propitiation for our sins and not for ours only but also for the sins of the whole world","The Test of Obedience (vv.3-6): Hereby we do know that we know him if we keep his commandments; he that saith I know him and keepeth not his commandments is a liar and the truth is not in him; whoso keepeth his word in him verily is the love of God perfected; he that saith he abideth in him ought himself also so to walk even as he walked","The Old-New Commandment of Love (vv.7-11): Brethren I write no new commandment unto you but an old commandment which ye had from the beginning; again a new commandment I write unto you; he that loveth his brother abideth in the light; he that hateth his brother is in darkness and walketh in darkness","Three Stages of Spiritual Growth (vv.12-14): I write unto you little children because your sins are forgiven; I write unto you fathers because ye have known him from the beginning; I write unto you young men because ye have overcome the wicked one","Do Not Love the World (vv.15-17): Love not the world neither the things in the world; if any man love the world the love of the Father is not in him; for all that is in the world the lust of the flesh and the lust of the eyes and the pride of life is not of the Father but is of the world; and the world passeth away and the lust thereof but he that doeth the will of God abideth for ever","Warning About Antichrists and the Anointing (vv.18-29): Little children it is the last time and as ye have heard that antichrist shall come even now are there many antichrists; they went out from us but they were not of us; ye have an unction from the Holy One and ye know all things; let that therefore abide in you which ye have heard from the beginning"]'
FROM books b WHERE b.name = '1 John';

-- Step 2: Insert all 29 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'My little children, these things write I unto you, that ye sin not. And if any man sin, we have an advocate with the Father, Jesus Christ the righteous:',
   'Τεκνία μου ταῦτα γράφω ὑμῖν ἵνα μὴ ἁμάρτητε καὶ ἐάν τις ἁμάρτῃ παράκλητον ἔχομεν πρὸς τὸν πατέρα Ἰησοῦν Χριστὸν δίκαιον',
   'Teknia mou tauta graphō hymin hina mē hamartēte kai ean tis hamartē paraklēton echomen pros ton patera Iēsoun Christon dikaion',
   '''Little children'' (teknia — little born ones; a term of tender affection). ''That ye sin not'' (hina mē hamartēte — aorist subjunctive: that you may not commit an act of sin). The goal is not sinning; the provision is for when we do. ''Advocate'' (paraklēton — one called alongside; the same word Jesus used for the Holy Spirit in John 14:16,26; 15:26; 16:7). Christ is the believer''s advocate before the Father — not a distant judge but a Father approached by His righteous Son on our behalf. ''Jesus Christ the righteous'' (dikaion — the righteous one; His righteousness qualifies Him to plead our case).',
   'Christ our Advocate: Two truths are held in tension: (1) the goal is not to sin, and (2) when we do sin, we have an advocate. John does not lower the standard (''sin not'') nor crush the sinner (''we have an advocate''). Christ''s advocacy is based on His righteousness, not ours. He does not plead our innocence but points to His own finished atonement as the ground of our forgiveness.'),
  (2,
   'And he is the propitiation for our sins: and not for ours only, but also for the sins of the whole world.',
   'καὶ αὐτὸς ἱλασμός ἐστιν περὶ τῶν ἁμαρτιῶν ἡμῶν οὐ περὶ τῶν ἡμετέρων δὲ μόνον ἀλλὰ καὶ περὶ ὅλου τοῦ κόσμου',
   'kai autos hilasmos estin peri tōn hamartiōn hēmōn ou peri tōn hēmeterōn de monon alla kai peri holou tou kosmou',
   '''Propitiation'' (hilasmos — the atoning sacrifice, the means of turning away wrath; from hilaskomai, to appease, to make favourable). Christ Himself is the propitiation — not merely the one who offers it but the offering itself. ''Not for ours only'' (ou peri tōn hēmeterōn monon) — the scope extends beyond Jewish believers. ''The whole world'' (holou tou kosmou) — the sufficiency of Christ''s atonement is universal in scope, though its application is to those who believe.',
   'The extent of the atonement: Christ''s death is sufficient for the sins of the entire world — no sin exists for which His blood is inadequate. The phrase ''the whole world'' extends the offer beyond any ethnic, social, or geographic boundary. This does not teach universal salvation but universal sufficiency: the atonement is unlimited in its value, though its saving efficacy is applied to those who believe.'),
  (3,
   'And hereby we do know that we know him, if we keep his commandments.',
   'Καὶ ἐν τούτῳ γινώσκομεν ὅτι ἐγνώκαμεν αὐτόν ἐὰν τὰς ἐντολὰς αὐτοῦ τηρῶμεν',
   'Kai en toutō ginōskomen hoti egnōkamen auton ean tas entolas autou tērōmen',
   '''Hereby we know'' (en toutō ginōskomen — by this we come to know, this is how we verify). ''That we know him'' (hoti egnōkamen — perfect tense: that we have come to know and continue to know). ''Keep his commandments'' (tas entolas tērōmen — guard, observe, treasure His commands; present tense: habitually). John introduces the first test of genuine faith: obedience. Knowing God is not intellectual assent or emotional experience but is verified by obedience to His commands.',
   NULL),
  (4,
   'He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him.',
   'ὁ λέγων ἐγνωκα αὐτὸν καὶ τὰς ἐντολὰς αὐτοῦ μὴ τηρῶν ψεύστης ἐστίν καὶ ἐν τούτῳ ἡ ἀλήθεια οὐκ ἔστιν',
   'ho legōn egnōka auton kai tas entolas autou mē tērōn pseustēs estin kai en toutō hē alētheia ouk estin',
   '''He that saith'' (ho legōn — the one who keeps saying). ''I know him'' (egnōka — I have come to know). ''Keepeth not'' (mē tērōn — does not guard, does not observe; present participle: characteristically disobedient). ''Is a liar'' (pseustēs estin — is a false person). John''s logic is simple: claiming to know God while habitually disobeying His commands is a contradiction. The truth is not merely absent from his speech but from his person (en toutō — in this one).',
   NULL),
  (5,
   'But whoso keepeth his word, in him verily is the love of God perfected: hereby know we that we are in him.',
   'ὃς δ᾽ ἂν τηρῇ αὐτοῦ τὸν λόγον ἀληθῶς ἐν τούτῳ ἡ ἀγάπη τοῦ θεοῦ τετελείωται ἐν τούτῳ γινώσκομεν ὅτι ἐν αὐτῷ ἐσμεν',
   'hos d'' an tērē autou ton logon alēthōs en toutō hē agapē tou theou teteleiōtai en toutō ginōskomen hoti en autō esmen',
   '''Keepeth his word'' (tērē autou ton logon — guards His word; broader than ''commandments'': the whole revelation of God). ''Love of God perfected'' (hē agapē tou theou teteleiōtai — the love of God has been brought to completion; perfect tense: has been perfected and remains so). ''Love of God'' can mean our love for God, God''s love for us, or the kind of love that comes from God. All three may be intended: God''s love reaches its full expression in the obedient believer. ''In him'' (en autō esmen — we are in Him). Obedience is the evidence of abiding in Christ.',
   NULL),
  (6,
   'He that saith he abideth in him ought himself also so to walk, even as he walked.',
   'ὁ λέγων ἐν αὐτῷ μένειν ὀφείλει καθὼς ἐκεῖνος περιεπάτησεν καὶ αὐτὸς οὕτως περιπατεῖν',
   'ho legōn en autō menein opheilei kathōs ekeinos periepatēsen kai autos houtōs peripatein',
   '''Abideth'' (menein — remain, dwell, continue in). ''Ought'' (opheilei — owes it, is morally obligated; a debt, not an option). ''Walk, even as he walked'' (peripatein kathōs ekeinos periepatēsen — to conduct one''s life in the same manner as that One conducted His). ''He'' (ekeinos — that one, a reverential pronoun for Christ). The standard of the Christian life is Christ''s own walk. Abiding in Him creates the obligation to live as He lived — in holiness, love, obedience, and self-sacrifice.',
   NULL),
  (7,
   'Brethren, I write no new commandment unto you, but an old commandment which ye had from the beginning. The old commandment is the word which ye have heard from the beginning.',
   'Ἀδελφοί οὐκ ἐντολὴν καινὴν γράφω ὑμῖν ἀλλ᾽ ἐντολὴν παλαιὰν ἣν εἴχετε ἀπ᾽ ἀρχῆς ἡ ἐντολὴ ἡ παλαιά ἐστιν ὁ λόγος ὃν ἠκούσατε ἀπ᾽ ἀρχῆς',
   'Adelphoi ouk entolēn kainēn graphō hymin all'' entolēn palaian hēn eichete ap'' archēs hē entolē hē palaia estin ho logos hon ēkousate ap'' archēs',
   '''New'' (kainēn — qualitatively new, novel). ''Old'' (palaian — ancient, from the beginning). ''From the beginning'' (ap'' archēs — from the start of their Christian experience). The commandment to love is old because it goes back to Leviticus 19:18 and to Jesus''s teaching from the beginning of the gospel. Yet it is also ''new'' (v.8) because in Christ it takes on fresh meaning and power.',
   NULL),
  (8,
   'Again, a new commandment I write unto you, which thing is true in him and in you: because the darkness is past, and the true light now shineth.',
   'πάλιν ἐντολὴν καινὴν γράφω ὑμῖν ὅ ἐστιν ἀληθὲς ἐν αὐτῷ καὶ ἐν ὑμῖν ὅτι ἡ σκοτία παράγεται καὶ τὸ φῶς τὸ ἀληθινὸν ἤδη φαίνει',
   'palin entolēn kainēn graphō hymin ho estin alēthes en autō kai en hymin hoti hē skotia paragetai kai to phōs to alēthinon ēdē phainei',
   '''New'' (kainēn — fresh, qualitatively new; not neos, new in time, but kainos, new in quality). ''True in him and in you'' — the commandment is made new by Christ''s example and by the Spirit''s work in believers. ''Darkness is past'' (hē skotia paragetai — the darkness is passing away; present tense: in process of being removed). ''True light now shineth'' (to phōs to alēthinon ēdē phainei — the genuine light is already shining). The coming of Christ has begun the age of light; the old age of darkness is receding.',
   NULL),
  (9,
   'He that saith he is in the light, and hateth his brother, is in darkness even until now.',
   'ὁ λέγων ἐν τῷ φωτὶ εἶναι καὶ τὸν ἀδελφὸν αὐτοῦ μισῶν ἐν τῇ σκοτίᾳ ἐστὶν ἕως ἄρτι',
   'ho legōn en tō phōti einai kai ton adelphon autou misōn en tē skotia estin heōs arti',
   '''Hateth'' (misōn — hating; present participle: characteristically hating). ''In darkness even until now'' (en tē skotia estin heōs arti — is in the darkness right up to this moment). The claim to be in the light is tested by one''s treatment of fellow believers. Hatred of a brother and walking in light are mutually exclusive.',
   NULL),
  (10,
   'He that loveth his brother abideth in the light, and there is none occasion of stumbling in him.',
   'ὁ ἀγαπῶν τὸν ἀδελφὸν αὐτοῦ ἐν τῷ φωτὶ μένει καὶ σκάνδαλον ἐν αὐτῷ οὐκ ἔστιν',
   'ho agapōn ton adelphon autou en tō phōti menei kai skandalon en autō ouk estin',
   '''Loveth'' (agapōn — loves with agapē love; present participle: characteristically loving). ''Abideth in the light'' (en tō phōti menei — remains in the light). ''Occasion of stumbling'' (skandalon — stumbling block, trap, snare). Love keeps the believer in the light and removes the cause of stumbling — both for himself and for others. Love is the proof and the preservative of walking in light.',
   NULL),
  (11,
   'But he that hateth his brother is in darkness, and walketh in darkness, and knoweth not whither he goeth, because that darkness hath blinded his eyes.',
   'ὁ δὲ μισῶν τὸν ἀδελφὸν αὐτοῦ ἐν τῇ σκοτίᾳ ἐστὶν καὶ ἐν τῇ σκοτίᾳ περιπατεῖ καὶ οὐκ οἶδεν ποῦ ὑπάγει ὅτι ἡ σκοτία ἐτύφλωσεν τοὺς ὀφθαλμοὺς αὐτοῦ',
   'ho de misōn ton adelphon autou en tē skotia estin kai en tē skotia peripatei kai ouk oiden pou hypagei hoti hē skotia etyphlōsen tous ophthalmous autou',
   'Three devastating descriptions of the hater: (1) ''is in darkness'' (state), (2) ''walketh in darkness'' (conduct), (3) ''knoweth not whither he goeth'' (blindness). ''Darkness hath blinded his eyes'' (hē skotia etyphlōsen — the darkness blinded; aorist: at some point the darkness took his sight and it remains gone). Hatred produces spiritual blindness — the hater cannot see where he is going because sin has destroyed his capacity to perceive spiritual reality.',
   NULL),
  (12,
   'I write unto you, little children, because your sins are forgiven you for his name''s sake.',
   'Γράφω ὑμῖν τεκνία ὅτι ἀφέωνται ὑμῖν αἱ ἁμαρτίαι διὰ τὸ ὄνομα αὐτοῦ',
   'Graphō hymin teknia hoti apheōntai hymin hai hamartiai dia to onoma autou',
   '''Little children'' (teknia — all believers, the whole church family). ''Forgiven'' (apheōntai — have been forgiven and remain forgiven; perfect tense: the forgiveness stands). ''For his name''s sake'' (dia to onoma autou — on account of His name). Forgiveness is the foundation: before any test or duty, John assures his readers that their sins are already forgiven. The basis is not their merit but Christ''s name — His person, authority, and finished work.',
   NULL),
  (13,
   'I write unto you, fathers, because ye have known him that is from the beginning. I write unto you, young men, because ye have overcome the wicked one. I write unto you, little children, because ye have known the Father.',
   'γράφω ὑμῖν πατέρες ὅτι ἐγνώκατε τὸν ἀπ᾽ ἀρχῆς γράφω ὑμῖν νεανίσκοι ὅτι νενικήκατε τὸν πονηρόν γράφω ὑμῖν παιδία ὅτι ἐγνώκατε τὸν πατέρα',
   'graphō hymin pateres hoti egnōkate ton ap'' archēs graphō hymin neaniskoi hoti nenikēkate ton ponēron graphō hymin paidia hoti egnōkate ton patera',
   'Three stages of spiritual maturity: (1) ''Fathers'' (pateres) — mature believers who have deep, long knowledge of Christ (''him that is from the beginning''). (2) ''Young men'' (neaniskoi) — vigorous believers who have ''overcome the wicked one'' (nenikēkate ton ponēron — perfect tense: have conquered and stand victorious). (3) ''Little children'' (paidia — young ones in faith) — who know the Father in simple, trusting relationship. Each group has its own spiritual achievement.',
   NULL),
  (14,
   'I have written unto you, fathers, because ye have known him that is from the beginning. I have written unto you, young men, because ye are strong, and the word of God abideth in you, and ye have overcome the wicked one.',
   'ἔγραψα ὑμῖν πατέρες ὅτι ἐγνώκατε τὸν ἀπ᾽ ἀρχῆς ἔγραψα ὑμῖν νεανίσκοι ὅτι ἰσχυροί ἐστε καὶ ὁ λόγος τοῦ θεοῦ ἐν ὑμῖν μένει καὶ νενικήκατε τὸν πονηρόν',
   'egrapsa hymin pateres hoti egnōkate ton ap'' archēs egrapsa hymin neaniskoi hoti ischyroi este kai ho logos tou theou en hymin menei kai nenikēkate ton ponēron',
   'The address to fathers is unchanged — deep knowledge of Christ is its own reward. But the address to young men is expanded: ''ye are strong'' (ischyroi este — you are mighty), ''the word of God abideth in you'' (ho logos tou theou en hymin menei — God''s word remains in you). The source of their strength is the indwelling word of God. Victory over the evil one comes not through human effort but through the abiding word.',
   NULL),
  (15,
   'Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.',
   'Μὴ ἀγαπᾶτε τὸν κόσμον μηδὲ τὰ ἐν τῷ κόσμῳ ἐάν τις ἀγαπᾷ τὸν κόσμον οὐκ ἔστιν ἡ ἀγάπη τοῦ πατρὸς ἐν αὐτῷ',
   'Mē agapate ton kosmon mēde ta en tō kosmō ean tis agapa ton kosmon ouk estin hē agapē tou patros en autō',
   '''Love not'' (mē agapate — stop loving; present imperative with mē: cease the habit). ''The world'' (ton kosmon — not the physical creation or people, but the organized system of values, priorities, and pleasures opposed to God). ''The things in the world'' (ta en tō kosmō — the attractions and allurements). ''The love of the Father is not in him'' — love of the world and love of the Father are mutually exclusive. The heart has room for only one supreme allegiance.',
   'Love of the world vs. love of the Father: John presents an absolute either/or. The ''world'' here is the fallen system of human desire organised apart from God. It is not sinful to appreciate God''s creation, but to set one''s love on the world-system — its values, ambitions, and pleasures — is incompatible with loving the Father. This is not legalism but spiritual reality: two competing loves cannot coexist as master affections.'),
  (16,
   'For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world.',
   'ὅτι πᾶν τὸ ἐν τῷ κόσμῳ ἡ ἐπιθυμία τῆς σαρκὸς καὶ ἡ ἐπιθυμία τῶν ὀφθαλμῶν καὶ ἡ ἀλαζονεία τοῦ βίου οὐκ ἔστιν ἐκ τοῦ πατρὸς ἀλλ᾽ ἐκ τοῦ κόσμου ἐστίν',
   'hoti pan to en tō kosmō hē epithymia tēs sarkos kai hē epithymia tōn ophthalmōn kai hē alazoneia tou biou ouk estin ek tou patros all'' ek tou kosmou estin',
   'Three categories of worldly temptation: (1) ''Lust of the flesh'' (epithymia tēs sarkos — the desire of the sinful nature; cravings for physical indulgence). (2) ''Lust of the eyes'' (epithymia tōn ophthalmōn — the desire that comes through seeing; covetousness, materialism). (3) ''Pride of life'' (alazoneia tou biou — the boastful pretension of one''s livelihood; from alazōn, a braggart; vain display of status and possessions). These three mirror Eve''s temptation in Gen 3:6 (good for food, pleasant to the eyes, desired to make one wise) and Christ''s temptation in Matt 4 (stones to bread, kingdoms shown, temple pinnacle).',
   NULL),
  (17,
   'And the world passeth away, and the lust thereof: but he that doeth the will of God abideth for ever.',
   'καὶ ὁ κόσμος παράγεται καὶ ἡ ἐπιθυμία αὐτοῦ ὁ δὲ ποιῶν τὸ θέλημα τοῦ θεοῦ μένει εἰς τὸν αἰῶνα',
   'kai ho kosmos paragetai kai hē epithymia autou ho de poiōn to thelēma tou theou menei eis ton aiōna',
   '''Passeth away'' (paragetai — is passing away, is being led aside; present tense: the process is already underway). ''Lust thereof'' — not only the world but its desires are transient. ''Doeth the will of God'' (poiōn to thelēma tou theou — the one who practices God''s will; present participle: habitually). ''Abideth for ever'' (menei eis ton aiōna — remains unto the age, endures forever). The decisive argument against worldliness: the world is temporary; God''s will is eternal. To invest in the passing world is to lose everything; to do God''s will is to gain permanence.',
   NULL),
  (18,
   'Little children, it is the last time: and as ye have heard that antichrist shall come, even now are there many antichrists; whereby we know that it is the last time.',
   'Παιδία ἐσχάτη ὥρα ἐστίν καὶ καθὼς ἠκούσατε ὅτι ὁ ἀντίχριστος ἔρχεται καὶ νῦν ἀντίχριστοι πολλοὶ γεγόνασιν ὅθεν γινώσκομεν ὅτι ἐσχάτη ὥρα ἐστίν',
   'Paidia eschatē hōra estin kai kathōs ēkousate hoti ho antichristos erchetai kai nyn antichristoi polloi gegonasin hothen ginōskomen hoti eschatē hōra estin',
   '''Last time'' (eschatē hōra — the last hour). ''Antichrist'' (antichristos — against Christ or in place of Christ; anti can mean both ''against'' and ''instead of''). John distinguishes between ''the antichrist'' (ho antichristos — the singular eschatological figure) and ''many antichrists'' (antichristoi polloi — multiple forerunners). ''Have come'' (gegonasin — have appeared, have arisen; perfect tense). The presence of many antichrists is proof that it is the last hour. Every denier of Christ''s incarnation is an antichrist in the broader sense.',
   NULL),
  (19,
   'They went out from us, but they were not of us; for if they had been of us, they would no doubt have continued with us: but they went out, that they might be made manifest that they were not all of us.',
   'ἐξ ἡμῶν ἐξῆλθον ἀλλ᾽ οὐκ ἦσαν ἐξ ἡμῶν εἰ γὰρ ἦσαν ἐξ ἡμῶν μεμενήκεισαν ἂν μεθ᾽ ἡμῶν ἀλλ᾽ ἵνα φανερωθῶσιν ὅτι οὐκ εἰσὶν πάντες ἐξ ἡμῶν',
   'ex hēmōn exēlthon all'' ouk ēsan ex hēmōn ei gar ēsan ex hēmōn memenēkeisan an meth'' hēmōn all'' hina phanerōthōsin hoti ouk eisin pantes ex hēmōn',
   '''Went out from us'' (ex hēmōn exēlthon — they departed from our company). ''Were not of us'' (ouk ēsan ex hēmōn — they did not belong to us in reality). ''Would have continued'' (memenēkeisan — would have remained; pluperfect: would have stayed permanently). ''Made manifest'' (phanerōthōsin — revealed, made visible). Their departure revealed their true nature. Perseverance is the mark of genuine faith; apostasy reveals that the faith was never real. John gives pastoral comfort: the heretics'' departure is not a sign of the church''s failure but of God''s refining.',
   'Perseverance and apostasy: John teaches that genuine believers persevere — those who permanently depart were never truly part of the community of faith. Their departure was divinely ordained to make their true nature visible. This is a key text on the perseverance of the saints: real faith endures; departure proves the faith was never genuine.'),
  (20,
   'But ye have an unction from the Holy One, and ye know all things.',
   'καὶ ὑμεῖς χρίσμα ἔχετε ἀπὸ τοῦ ἁγίου καὶ οἴδατε πάντα',
   'kai hymeis chrisma echete apo tou hagiou kai oidate panta',
   '''Unction'' (chrisma — anointing; from chriō, to anoint; the root of Christos, the Anointed One). ''From the Holy One'' (apo tou hagiou — from Christ or from the Father through Christ). ''Ye know all things'' (oidate panta — you have intuitive knowledge of all [essential spiritual truths]). The anointing is the indwelling Holy Spirit who gives believers the capacity to discern truth from error. This is not a claim to omniscience but to spiritual discernment — the Spirit-taught ability to recognise heresy.',
   NULL),
  (21,
   'I have not written unto you because ye know not the truth, but because ye know it, and that no lie is of the truth.',
   'οὐκ ἔγραψα ὑμῖν ὅτι οὐκ οἴδατε τὴν ἀλήθειαν ἀλλ᾽ ὅτι οἴδατε αὐτήν καὶ ὅτι πᾶν ψεῦδος ἐκ τῆς ἀληθείας οὐκ ἔστιν',
   'ouk egrapsa hymin hoti ouk oidate tēn alētheian all'' hoti oidate autēn kai hoti pan pseudos ek tēs alētheias ouk estin',
   'John writes not to inform the ignorant but to confirm the knowledgeable. ''No lie is of the truth'' (pan pseudos ek tēs alētheias ouk estin — every lie has no origin in the truth). Truth and falsehood are absolutely incompatible; there is no mixture, no grey zone. This principle gives believers a simple test for all teaching: if it contains falsehood, it cannot be from the truth.',
   NULL),
  (22,
   'Who is a liar but he that denieth that Jesus is the Christ? He is antichrist, that denieth the Father and the Son.',
   'Τίς ἐστιν ὁ ψεύστης εἰ μὴ ὁ ἀρνούμενος ὅτι Ἰησοῦς οὐκ ἔστιν ὁ Χριστός οὗτός ἐστιν ὁ ἀντίχριστος ὁ ἀρνούμενος τὸν πατέρα καὶ τὸν υἱόν',
   'Tis estin ho pseustēs ei mē ho arnoumenos hoti Iēsous ouk estin ho Christos houtos estin ho antichristos ho arnoumenos ton patera kai ton huion',
   '''Denieth'' (arnoumenos — the one who denies, disowns, repudiates; present participle: characteristically denying). ''Jesus is the Christ'' — the specific heresy: denying that the historical man Jesus is the divine Messiah. The Gnostic Cerinthus taught that ''the Christ'' descended on Jesus at baptism and left before the cross. John insists: Jesus IS the Christ — the union is permanent and inseparable. To deny the Son is to lose the Father also; they are inseparable.',
   NULL),
  (23,
   'Whosoever denieth the Son, the same hath not the Father: (but) he that acknowledgeth the Son hath the Father also.',
   'πᾶς ὁ ἀρνούμενος τὸν υἱὸν οὐδὲ τὸν πατέρα ἔχει ὁ ὁμολογῶν τὸν υἱὸν καὶ τὸν πατέρα ἔχει',
   'pas ho arnoumenos ton huion oude ton patera echei ho homologōn ton huion kai ton patera echei',
   '''Denieth the Son'' (arnoumenos ton huion — repudiates the Son). ''Hath not the Father'' (oude ton patera echei — does not have the Father either). ''Acknowledgeth'' (homologōn — confesses, agrees). The Father and Son are so united that to deny one is to lose both. There is no access to the Father except through the Son (John 14:6). Any theology that claims to honour God while denying Christ is self-deceived.',
   NULL),
  (24,
   'Let that therefore abide in you, which ye have heard from the beginning. If that which ye have heard from the beginning shall remain in you, ye also shall continue in the Son, and in the Father.',
   'ὑμεῖς οὖν ὃ ἠκούσατε ἀπ᾽ ἀρχῆς ἐν ὑμῖν μενέτω ἐὰν ἐν ὑμῖν μείνῃ ὃ ἀπ᾽ ἀρχῆς ἠκούσατε καὶ ὑμεῖς ἐν τῷ υἱῷ καὶ ἐν τῷ πατρὶ μενεῖτε',
   'hymeis oun ho ēkousate ap'' archēs en hymin menetō ean en hymin meinē ho ap'' archēs ēkousate kai hymeis en tō huiō kai en tō patri meneite',
   '''Abide in you'' (en hymin menetō — let it remain in you; imperative: keep holding to the original message). ''From the beginning'' (ap'' archēs — from the start of the gospel proclamation). ''Continue in the Son, and in the Father'' (en tō huiō kai en tō patri meneite — you will abide in the Son and Father). The defence against heresy is not new revelation but the original gospel. If the original message remains in the believer, the believer remains in God. Novelty is the mark of error; fidelity to the apostolic message is the mark of truth.',
   NULL),
  (25,
   'And this is the promise that he hath promised us, even eternal life.',
   'καὶ αὕτη ἐστὶν ἡ ἐπαγγελία ἣν αὐτὸς ἐπηγγείλατο ἡμῖν τὴν ζωὴν τὴν αἰώνιον',
   'kai hautē estin hē epangelia hēn autos epēngeilato hēmin tēn zōēn tēn aiōnion',
   '''Promise'' (epangelia — the announcement, the pledge). ''Eternal life'' (tēn zōēn tēn aiōnion — the life, the eternal). The promise of eternal life is the motivating hope that keeps believers holding to the original message. Eternal life is not merely endless duration but the quality of life that comes from fellowship with the Father and Son.',
   NULL),
  (26,
   'These things have I written unto you concerning them that seduce you.',
   'Ταῦτα ἔγραψα ὑμῖν περὶ τῶν πλανώντων ὑμᾶς',
   'Tauta egrapsa hymin peri tōn planōntōn hymas',
   '''Seduce'' (planōntōn — those who lead astray, those who deceive; present participle: those who are actively trying to mislead you; from planaō, to wander). John has been writing specifically about the false teachers who are attempting to lure believers away from the truth. His warnings are not theoretical but targeted at a real and present danger.',
   NULL),
  (27,
   'But the anointing which ye have received of him abideth in you, and ye need not that any man teach you: but as the same anointing teacheth you of all things, and is truth, and is no lie, and even as it hath taught you, ye shall abide in him.',
   'καὶ ὑμεῖς τὸ χρίσμα ὃ ἐλάβετε ἀπ᾽ αὐτοῦ μένει ἐν ὑμῖν καὶ οὐ χρείαν ἔχετε ἵνα τις διδάσκῃ ὑμᾶς ἀλλ᾽ ὡς τὸ αὐτὸ χρίσμα διδάσκει ὑμᾶς περὶ πάντων καὶ ἀληθές ἐστιν καὶ οὐκ ἔστιν ψεῦδος καὶ καθὼς ἐδίδαξεν ὑμᾶς μενεῖτε ἐν αὐτῷ',
   'kai hymeis to chrisma ho elabete ap'' autou menei en hymin kai ou chreian echete hina tis didaskē hymas all'' hōs to auto chrisma didaskei hymas peri pantōn kai alēthes estin kai ouk estin pseudos kai kathōs edidaxen hymas meneite en autō',
   '''Anointing'' (chrisma — the anointing; the Holy Spirit given to believers). ''Abideth in you'' (menei en hymin — remains in you permanently). ''Ye need not that any man teach you'' — not a rejection of human teaching (John is teaching them right now!) but a declaration of independence from the false teachers. The Spirit within them can discern truth from error. ''Teacheth you of all things'' — the Spirit''s teaching covers all essential spiritual truth. ''Is truth, and is no lie'' — the Spirit''s teaching is infallibly true.',
   'The anointing of the Spirit: The ''anointing'' (chrisma) is the Holy Spirit who indwells every believer. This anointing provides: (1) permanence — it abides, (2) sufficiency — believers do not need the false teachers, (3) comprehensiveness — it teaches about all things, (4) truthfulness — it is truth, not lie. This does not eliminate the need for human teachers (Eph 4:11) but means believers are not dependent on any teacher who contradicts the Spirit''s witness.'),
  (28,
   'And now, little children, abide in him; that, when he shall appear, we may have confidence, and not be ashamed before him at his coming.',
   'Καὶ νῦν τεκνία μένετε ἐν αὐτῷ ἵνα ὅταν φανερωθῇ ἔχωμεν παρρησίαν καὶ μὴ αἰσχυνθῶμεν ἀπ᾽ αὐτοῦ ἐν τῇ παρουσίᾳ αὐτοῦ',
   'Kai nyn teknia menete en autō hina hotan phanerōthē echōmen parrēsian kai mē aischynthōmen ap'' autou en tē parousia autou',
   '''Abide'' (menete — remain, stay; present imperative: keep on abiding). ''Appear'' (phanerōthē — be made visible, be revealed; Christ''s second coming). ''Confidence'' (parrēsian — boldness, freedom of speech, open assurance). ''Ashamed'' (aischynthōmen — put to shame, shrink back in embarrassment). ''Coming'' (parousia — arrival, personal presence). The motivation for abiding is eschatological: when Christ appears, those who have been abiding will have boldness; those who have not will shrink away in shame.',
   NULL),
  (29,
   'If ye know that he is righteous, ye know that every one that doeth righteousness is born of him.',
   'ἐὰν εἰδῆτε ὅτι δίκαιός ἐστιν γινώσκετε ὅτι πᾶς ὁ ποιῶν τὴν δικαιοσύνην ἐξ αὐτοῦ γεγέννηται',
   'ean eidēte hoti dikaios estin ginōskete hoti pas ho poiōn tēn dikaiosynēn ex autou gegennētai',
   '''Righteous'' (dikaios — just, righteous in character). ''Doeth righteousness'' (ho poiōn tēn dikaiosynēn — the one who practises righteousness; present participle: habitually). ''Born of him'' (ex autou gegennētai — has been begotten from Him; perfect tense: born and remains born). The logic: God is righteous; therefore those born of God practise righteousness. Righteous living is the evidence of the new birth, not the cause of it. This verse bridges into chapter 3''s extended discussion of the children of God.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 John' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 1 (Advocate)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παράκλητον', 'paraklēton', 'G3875', 'Advocate, one called alongside, helper — from para (beside) + kaleō (to call). In a legal context, a defence attorney. Jesus is the advocate who represents believers before the Father when they sin. The same word used for the Holy Spirit in John 14:16.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 2 AND v.verse_number = 1;

-- Verse 2 (Propitiation)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἱλασμός', 'hilasmos', 'G2434', 'Propitiation, atoning sacrifice — the means by which God''s righteous wrath against sin is satisfied. Christ is both the propitiator and the propitiation: He offers Himself as the sacrifice that turns away divine wrath. Cf. Rom 3:25; 1 John 4:10.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 16 (Lust / pride of life)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπιθυμία', 'epithymia', 'G1939', 'Desire, craving, lust — from epi (upon, toward) + thymos (passion). An intense, consuming desire directed at forbidden objects. The flesh desires physical indulgence; the eyes desire possession and beauty; both are insatiable apart from God.', 1),
  ('ἀλαζονεία', 'alazoneia', 'G212', 'Pride, boastful pretension, arrogant display — from alazōn (a braggart, an impostor). The vain show of one''s resources, status, or achievements. ''Of life'' (tou biou — of livelihood, of material existence). Boasting in what one has and does.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 2 AND v.verse_number = 16;

-- Verse 20 (Unction / anointing)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χρίσμα', 'chrisma', 'G5545', 'Anointing — from chriō (to anoint, to smear with oil). In the OT, prophets, priests, and kings were anointed. The believer''s anointing is the Holy Spirit who gives spiritual discernment and teaches truth. The root of Christos (Christ = the Anointed One).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 2 AND v.verse_number = 20;

-- Verse 22 (Antichrist)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀντίχριστος', 'antichristos', 'G500', 'Antichrist — from anti (against, in place of) + Christos (Christ). One who opposes Christ or sets himself up as a counterfeit Christ. John uses this term in both a singular eschatological sense (the coming Antichrist) and a plural present sense (many antichrists already active).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 2 AND v.verse_number = 22;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Advocate with the Father
  (1, 'John 14:16', 1), (1, 'Romans 8:34', 2), (1, 'Hebrews 7:25', 3),
  -- v2: Propitiation
  (2, 'Romans 3:25', 1), (2, '1 John 4:10', 2), (2, 'Hebrews 2:17', 3),
  -- v6: Walk as he walked
  (6, 'John 13:15', 1), (6, '1 Peter 2:21', 2), (6, 'Philippians 2:5', 3),
  -- v15: Love not the world
  (15, 'James 4:4', 1), (15, 'Romans 12:2', 2), (15, 'Matthew 6:24', 3),
  -- v16: Lust of flesh / eyes / pride
  (16, 'Genesis 3:6', 1), (16, 'Matthew 4:1-11', 2), (16, 'Proverbs 27:20', 3),
  -- v17: World passeth away
  (17, '1 Corinthians 7:31', 1), (17, '2 Peter 3:10', 2), (17, 'Psalm 102:26', 3),
  -- v19: Went out from us
  (19, '2 Timothy 2:19', 1), (19, 'John 6:66-67', 2), (19, 'Hebrews 3:14', 3),
  -- v20: Unction from the Holy One
  (20, 'John 14:26', 1), (20, 'John 16:13', 2), (20, '2 Corinthians 1:21-22', 3),
  -- v27: Anointing teacheth
  (27, 'Jeremiah 31:34', 1), (27, 'John 6:45', 2), (27, '1 Thessalonians 4:9', 3),
  -- v29: Born of him / doeth righteousness
  (29, '1 John 3:9', 1), (29, 'John 3:3-6', 2), (29, '2 Corinthians 5:17', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 John' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 John Chapter 2 Complete
-- 29 verses · 6 key verses with word studies (8 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
