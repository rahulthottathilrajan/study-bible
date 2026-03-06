-- ═══════════════════════════════════════════════════
-- 1 JOHN CHAPTER 5 — Faith, Assurance, and Eternal Life
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  '1 John 5 opens with the connection between faith, love, and obedience: ''Whosoever believeth that Jesus is the Christ is born of God'' (v.1), and ''his commandments are not grievous'' (v.3). Faith overcomes the world (vv.4-5). John then presents the threefold witness to Christ: ''the Spirit, and the water, and the blood'' (vv.6-8) — the Spirit''s testimony, Christ''s baptism, and Christ''s atoning death. The witness of God is greater than the witness of men (v.9). The pivotal declaration follows: ''God hath given to us eternal life, and this life is in his Son. He that hath the Son hath life; and he that hath not the Son of God hath not life'' (vv.11-12). The purpose of the epistle is stated: ''that ye may know that ye have eternal life'' (v.13). Confidence in prayer follows naturally (vv.14-15). The difficult passage on the ''sin unto death'' (vv.16-17) distinguishes between sins that can be prayed for and a sin that leads to death. The epistle closes with three great certainties: the born-again do not habitually sin (v.18), believers are of God while the whole world lies in wickedness (v.19), and the Son of God has given understanding to know the true God (v.20). The final word: ''Little children, keep yourselves from idols'' (v.21).',
  'The Victory of Faith and the Assurance of Eternal Life',
  'νίκη (nikē)',
  'Victory, conquest — from nikaō (to conquer, to overcome). The victory that overcomes the world is not human effort but faith. Faith in Christ is the weapon that defeats the world-system with all its pressures to conform.',
  '["Faith Overcomes the World (vv.1-5): Whosoever believeth that Jesus is the Christ is born of God; for whatsoever is born of God overcometh the world and this is the victory that overcometh the world even our faith; who is he that overcometh the world but he that believeth that Jesus is the Son of God","The Threefold Witness (vv.6-9): This is he that came by water and blood even Jesus Christ; not by water only but by water and blood; and it is the Spirit that beareth witness because the Spirit is truth; for there are three that bear record in heaven the Father the Word and the Holy Ghost and these three are one; and there are three that bear witness in earth the Spirit and the water and the blood and these three agree in one; if we receive the witness of men the witness of God is greater","Eternal Life in the Son (vv.10-13): He that believeth on the Son of God hath the witness in himself; God hath given to us eternal life and this life is in his Son; he that hath the Son hath life and he that hath not the Son of God hath not life; these things have I written unto you that believe on the name of the Son of God that ye may know that ye have eternal life","Confidence in Prayer (vv.14-17): This is the confidence that we have in him that if we ask any thing according to his will he heareth us; if any man see his brother sin a sin which is not unto death he shall ask and he shall give him life; there is a sin unto death I do not say that he shall pray for it; all unrighteousness is sin and there is a sin not unto death","Three Great Certainties (vv.18-21): We know that whosoever is born of God sinneth not but he that is begotten of God keepeth himself and that wicked one toucheth him not; we know that we are of God and the whole world lieth in wickedness; we know that the Son of God is come and hath given us an understanding that we may know him that is true; little children keep yourselves from idols"]'
FROM books b WHERE b.name = '1 John';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Whosoever believeth that Jesus is the Christ is born of God: and every one that loveth him that begat loveth him also that is begotten of him.',
   'Πᾶς ὁ πιστεύων ὅτι Ἰησοῦς ἐστιν ὁ Χριστός ἐκ τοῦ θεοῦ γεγέννηται καὶ πᾶς ὁ ἀγαπῶν τὸν γεννήσαντα ἀγαπᾷ καὶ τὸν γεγεννημένον ἐξ αὐτοῦ',
   'Pas ho pisteuōn hoti Iēsous estin ho Christos ek tou theou gegennētai kai pas ho agapōn ton gennēsanta agapa kai ton gegennēmenon ex autou',
   '''Believeth'' (ho pisteuōn — the one who believes; present participle: habitually believes). ''Is born of God'' (ek tou theou gegennētai — has been begotten from God; perfect tense: the new birth is the cause, faith is the result). ''Him that begat'' (ton gennēsanta — the one who begot, the Father). ''Him that is begotten'' (ton gegennēmenon — the one who has been begotten, the fellow believer). The logic of the family: if you love the Father, you will love His children. Faith, new birth, and love form an inseparable triad.',
   NULL),
  (2,
   'By this we know that we love the children of God, when we love God, and keep his commandments.',
   'ἐν τούτῳ γινώσκομεν ὅτι ἀγαπῶμεν τὰ τέκνα τοῦ θεοῦ ὅταν τὸν θεὸν ἀγαπῶμεν καὶ τὰς ἐντολὰς αὐτοῦ τηρῶμεν',
   'en toutō ginōskomen hoti agapōmen ta tekna tou theou hotan ton theon agapōmen kai tas entolas autou tērōmen',
   'A surprising test: we know we love God''s children when we love God and keep His commandments. In chapter 4, love for the brethren proved love for God; here, love for God and obedience prove genuine love for the brethren. The tests are reciprocal and interlocking: love for God, love for brethren, and obedience are inseparable.',
   NULL),
  (3,
   'For this is the love of God, that we keep his commandments: and his commandments are not grievous.',
   'αὕτη γάρ ἐστιν ἡ ἀγάπη τοῦ θεοῦ ἵνα τὰς ἐντολὰς αὐτοῦ τηρῶμεν καὶ αἱ ἐντολαὶ αὐτοῦ βαρεῖαι οὐκ εἰσίν',
   'hautē gar estin hē agapē tou theou hina tas entolas autou tērōmen kai hai entolai autou bareiai ouk eisin',
   '''The love of God'' (hē agapē tou theou — our love for God, expressed in obedience). ''Keep his commandments'' (tas entolas tērōmen — guard, treasure, obey His commands). ''Not grievous'' (bareiai ouk eisin — not heavy, not burdensome). God''s commandments are not oppressive to the one who loves Him. The new birth provides a new nature that delights in obedience. What is heavy to the flesh is light to the regenerate heart. Love transforms duty into delight.',
   NULL),
  (4,
   'For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.',
   'ὅτι πᾶν τὸ γεγεννημένον ἐκ τοῦ θεοῦ νικᾷ τὸν κόσμον καὶ αὕτη ἐστὶν ἡ νίκη ἡ νικήσασα τὸν κόσμον ἡ πίστις ἡμῶν',
   'hoti pan to gegennēmenon ek tou theou nika ton kosmon kai hautē estin hē nikē hē nikēsasa ton kosmon hē pistis hēmōn',
   '''Born of God'' (to gegennēmenon ek tou theou — the one having been begotten from God; neuter: emphasising the principle, the quality of birth). ''Overcometh'' (nika — conquers, is victorious; present tense: keeps on conquering). ''Victory'' (hē nikē — the conquest; used only here in the NT). ''That overcometh'' (hē nikēsasa — the one that conquered; aorist: a decisive, completed victory). ''Our faith'' (hē pistis hēmōn). The instrument of victory is faith, and the source of faith is the new birth. Faith overcomes the world by looking beyond its attractions and threats to the unseen reality of God.',
   'Faith as victory: The world pressures believers through attraction (lust, pride) and opposition (hatred, persecution). Faith overcomes both by trusting in the unseen God and His promises. The victory is not earned by effort but received through faith — faith that is itself the product of the new birth.'),
  (5,
   'Who is he that overcometh the world, but he that believeth that Jesus is the Son of God?',
   'τίς ἐστιν ὁ νικῶν τὸν κόσμον εἰ μὴ ὁ πιστεύων ὅτι Ἰησοῦς ἐστιν ὁ υἱὸς τοῦ θεοῦ',
   'tis estin ho nikōn ton kosmon ei mē ho pisteuōn hoti Iēsous estin ho huios tou theou',
   'A rhetorical question expecting the answer: no one else. ''He that believeth that Jesus is the Son of God'' (ho pisteuōn hoti Iēsous estin ho huios tou theou). The content of faith is specific: not generic belief in God but specific belief that the historical Jesus is the Son of God. This faith — in this Person — is what overcomes the world.',
   NULL),
  (6,
   'This is he that came by water and blood, even Jesus Christ; not by water only, but by water and blood. And it is the Spirit that beareth witness, because the Spirit is truth.',
   'Οὗτός ἐστιν ὁ ἐλθὼν δι᾽ ὕδατος καὶ αἵματος Ἰησοῦς ὁ Χριστός οὐκ ἐν τῷ ὕδατι μόνον ἀλλ᾽ ἐν τῷ ὕδατι καὶ ἐν τῷ αἵματι καὶ τὸ πνεῦμά ἐστιν τὸ μαρτυροῦν ὅτι τὸ πνεῦμά ἐστιν ἡ ἀλήθεια',
   'Houtos estin ho elthōn di'' hydatos kai haimatos Iēsous ho Christos ouk en tō hydati monon all'' en tō hydati kai en tō haimati kai to pneuma estin to martyroun hoti to pneuma estin hē alētheia',
   '''Came by water and blood'' (elthōn di'' hydatos kai haimatos). ''Water'' most likely refers to Christ''s baptism, when His messianic mission was publicly inaugurated. ''Blood'' refers to His death on the cross. ''Not by water only, but by water and blood'' — John counters the heresy of Cerinthus, who taught that the divine Christ descended on Jesus at baptism but departed before the cross. No: Christ came through both baptism and death — the cross is essential. ''The Spirit beareth witness'' — the Holy Spirit testifies to the truth of Christ''s person and work.',
   NULL),
  (7,
   'For there are three that bear record in heaven, the Father, the Word, and the Holy Ghost: and these three are one.',
   'ὅτι τρεῖς εἰσιν οἱ μαρτυροῦντες ἐν τῷ οὐρανῷ ὁ πατήρ ὁ λόγος καὶ τὸ ἅγιον πνεῦμα καὶ οὗτοι οἱ τρεῖς ἕν εἰσιν',
   'hoti treis eisin hoi martyrountes en tō ouranō ho patēr ho logos kai to hagion pneuma kai houtoi hoi treis hen eisin',
   '''Three that bear record'' (treis hoi martyrountes — three who testify). ''The Father, the Word, and the Holy Ghost'' — the heavenly Trinity. ''These three are one'' (houtoi hoi treis hen eisin — these three are one thing, one in essence). Note: this verse (the Johannine Comma) is absent from most early Greek manuscripts and was likely a later marginal gloss that entered the text. However, the Trinitarian truth it expresses is taught throughout Scripture. The KJV includes it following the Textus Receptus tradition.',
   'The Trinity: Whether or not this specific verse was original to John''s letter, the doctrine of the Trinity — one God existing eternally as Father, Son (the Word), and Holy Spirit — is the consistent teaching of the New Testament (Matt 28:19; 2 Cor 13:14; Eph 4:4-6). The three Persons are distinct yet one in essence, co-equal and co-eternal.'),
  (8,
   'And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one.',
   'καὶ τρεῖς εἰσιν οἱ μαρτυροῦντες ἐν τῇ γῇ τὸ πνεῦμα καὶ τὸ ὕδωρ καὶ τὸ αἷμα καὶ οἱ τρεῖς εἰς τὸ ἕν εἰσιν',
   'kai treis eisin hoi martyrountes en tē gē to pneuma kai to hydōr kai to haima kai hoi treis eis to hen eisin',
   '''Three that bear witness'' (treis hoi martyrountes — three testifying). ''The Spirit'' — the Holy Spirit who testifies internally to believers. ''The water'' — Christ''s baptism, the public inauguration. ''The blood'' — Christ''s death, the atoning sacrifice. ''Agree in one'' (eis to hen eisin — are unto the one, converge on the same testimony). Three independent witnesses all point to the same truth: Jesus is the Christ, the Son of God, who came to save sinners through His death.',
   NULL),
  (9,
   'If we receive the witness of men, the witness of God is greater: for this is the witness of God which he hath testified of his Son.',
   'εἰ τὴν μαρτυρίαν τῶν ἀνθρώπων λαμβάνομεν ἡ μαρτυρία τοῦ θεοῦ μείζων ἐστίν ὅτι αὕτη ἐστὶν ἡ μαρτυρία τοῦ θεοῦ ἣν μεμαρτύρηκεν περὶ τοῦ υἱοῦ αὐτοῦ',
   'ei tēn martyrian tōn anthrōpōn lambanomen hē martyria tou theou meizōn estin hoti hautē estin hē martyria tou theou hēn memartyrēken peri tou huiou autou',
   'An argument from lesser to greater: if human testimony is accepted in courts (Deut 19:15 requires two or three witnesses), how much more should God''s testimony be accepted? God has testified about His Son through the Spirit, the water, and the blood. To reject this testimony is to make God a liar (v.10).',
   NULL),
  (10,
   'He that believeth on the Son of God hath the witness in himself: he that believeth not God hath made him a liar; because he believeth not the record that God gave of his Son.',
   'ὁ πιστεύων εἰς τὸν υἱὸν τοῦ θεοῦ ἔχει τὴν μαρτυρίαν ἐν ἑαυτῷ ὁ μὴ πιστεύων τῷ θεῷ ψεύστην πεποίηκεν αὐτόν ὅτι οὐ πεπίστευκεν εἰς τὴν μαρτυρίαν ἣν μεμαρτύρηκεν ὁ θεὸς περὶ τοῦ υἱοῦ αὐτοῦ',
   'ho pisteuōn eis ton huion tou theou echei tēn martyrian en heautō ho mē pisteuōn tō theō pseustēn pepoiēken auton hoti ou pepisteuken eis tēn martyrian hēn memartyrēken ho theos peri tou huiou autou',
   '''Hath the witness in himself'' (echei tēn martyrian en heautō — possesses the testimony internally). The believer has an inner confirmation — the Spirit''s witness within (Rom 8:16). ''Made him a liar'' (pseustēn pepoiēken auton — has made God a liar; perfect tense: the accusation stands). To refuse to believe God''s testimony about His Son is to call God a liar. Unbelief is not merely intellectual disagreement but a moral affront to God''s truthfulness.',
   NULL),
  (11,
   'And this is the record, that God hath given to us eternal life, and this life is in his Son.',
   'καὶ αὕτη ἐστὶν ἡ μαρτυρία ὅτι ζωὴν αἰώνιον ἔδωκεν ἡμῖν ὁ θεός καὶ αὕτη ἡ ζωὴ ἐν τῷ υἱῷ αὐτοῦ ἐστιν',
   'kai hautē estin hē martyria hoti zōēn aiōnion edōken hēmin ho theos kai hautē hē zōē en tō huiō autou estin',
   '''The record'' (hē martyria — the testimony, the essential content of God''s witness). ''God hath given'' (edōken — aorist: gave as a definite gift). ''Eternal life'' (zōēn aiōnion). ''This life is in his Son'' (hautē hē zōē en tō huiō autou estin — this life is located in His Son). Eternal life is not a substance distributed apart from Christ but is inseparable from His person. To have the Son is to have life; to lack the Son is to lack life.',
   'Eternal life in the Son: This verse is the distilled essence of John''s theology. Eternal life is: (1) a gift from God (not earned), (2) already given (not merely promised), (3) located exclusively in the Son (not in religion, morality, or philosophy). There is no eternal life apart from Jesus Christ.'),
  (12,
   'He that hath the Son hath life; and he that hath not the Son of God hath not life.',
   'ὁ ἔχων τὸν υἱὸν ἔχει τὴν ζωήν ὁ μὴ ἔχων τὸν υἱὸν τοῦ θεοῦ τὴν ζωὴν οὐκ ἔχει',
   'ho echōn ton huion echei tēn zōēn ho mē echōn ton huion tou theou tēn zōēn ouk echei',
   '''Hath the Son'' (ho echōn ton huion — the one who possesses the Son; present tense: present possession). ''Hath life'' (echei tēn zōēn — has the life). ''Hath not the Son'' (ho mē echōn — the one who does not have). The simplest and most absolute statement of the gospel: the dividing line of humanity is not moral, cultural, or religious but Christological. Do you have the Son? Then you have life. Do you not have the Son? Then you do not have life. There is no third category.',
   NULL),
  (13,
   'These things have I written unto you that believe on the name of the Son of God; that ye may know that ye have eternal life, and that ye may believe on the name of the Son of God.',
   'Ταῦτα ἔγραψα ὑμῖν τοῖς πιστεύουσιν εἰς τὸ ὄνομα τοῦ υἱοῦ τοῦ θεοῦ ἵνα εἰδῆτε ὅτι ζωὴν ἔχετε αἰώνιον τοῖς πιστεύουσιν εἰς τὸ ὄνομα τοῦ υἱοῦ τοῦ θεοῦ',
   'Tauta egrapsa hymin tois pisteuousin eis to onoma tou huiou tou theou hina eidēte hoti zōēn echete aiōnion tois pisteuousin eis to onoma tou huiou tou theou',
   '''That ye may know'' (hina eidēte — so that you may know with certainty; eidēte from oida, intuitive, settled knowledge). ''That ye have eternal life'' (hoti zōēn echete aiōnion — that you possess eternal life right now). The purpose of the epistle: assurance. John wrote so that believers might know — not hope, not guess, not merely believe — but know that they possess eternal life. Assurance is a birthright of faith, not presumption.',
   'Assurance of salvation: This verse states the explicit purpose of the entire epistle. God wants His children to have assurance — the settled, confident knowledge that they possess eternal life. The tests throughout the letter (obedience, love, right belief, the Spirit''s witness) are given not to create doubt but to confirm faith. Believers can know they have eternal life.'),
  (14,
   'And this is the confidence that we have in him, that, if we ask any thing according to his will, he heareth us:',
   'καὶ αὕτη ἐστὶν ἡ παρρησία ἣν ἔχομεν πρὸς αὐτόν ὅτι ἐάν τι αἰτώμεθα κατὰ τὸ θέλημα αὐτοῦ ἀκούει ἡμῶν',
   'kai hautē estin hē parrēsia hēn echomen pros auton hoti ean ti aitōmetha kata to thelēma autou akouei hēmōn',
   '''Confidence'' (parrēsia — boldness, freedom of speech, open access). ''According to his will'' (kata to thelēma autou — in alignment with His will). ''Heareth us'' (akouei hēmōn — listens to us, pays attention; present tense: always hears). The condition for answered prayer is alignment with God''s will. This is not a limitation but a liberation: when we pray according to His will, we pray with the certainty of being heard.',
   NULL),
  (15,
   'And if we know that he hear us, whatsoever we ask, we know that we have the petitions that we desired of him.',
   'καὶ ἐὰν οἴδαμεν ὅτι ἀκούει ἡμῶν ὃ ἐὰν αἰτώμεθα οἴδαμεν ὅτι ἔχομεν τὰ αἰτήματα ἃ ᾐτήκαμεν παρ᾽ αὐτοῦ',
   'kai ean oidamen hoti akouei hēmōn ho ean aitōmetha oidamen hoti echomen ta aitēmata ha ētēkamen par'' autou',
   '''We know'' (oidamen — we know with certainty; repeated twice). ''We have'' (echomen — we possess; present tense: already have, even before seeing the answer). ''Petitions'' (aitēmata — requests, specific things asked for). The logic of faith: if we know God hears our will-aligned prayers, then we know we already possess what we asked for. The answer is as good as given the moment the prayer is heard. Faith claims the answer before the manifestation.',
   NULL),
  (16,
   'If any man see his brother sin a sin which is not unto death, he shall ask, and he shall give him life for them that sin not unto death. There is a sin unto death: I do not say that he shall pray for it.',
   'ἐάν τις ἴδῃ τὸν ἀδελφὸν αὐτοῦ ἁμαρτάνοντα ἁμαρτίαν μὴ πρὸς θάνατον αἰτήσει καὶ δώσει αὐτῷ ζωήν τοῖς ἁμαρτάνουσιν μὴ πρὸς θάνατον ἔστιν ἁμαρτία πρὸς θάνατον οὐ περὶ ἐκείνης λέγω ἵνα ἐρωτήσῃ',
   'ean tis idē ton adelphon autou hamartanonta hamartian mē pros thanaton aitēsei kai dōsei autō zōēn tois hamartanousin mē pros thanaton estin hamartia pros thanaton ou peri ekeinēs legō hina erōtēsē',
   '''Sin not unto death'' (hamartian mē pros thanaton — a sin that does not lead toward death). ''Sin unto death'' (hamartia pros thanaton — a sin directed toward death). The ''sin unto death'' has been interpreted variously: apostasy (complete, final rejection of Christ), the blasphemy against the Holy Spirit (Matt 12:31-32), or a sin that God judges with physical death (Acts 5:1-11; 1 Cor 11:30). John does not forbid praying for it but says ''I do not say that he shall pray for it'' — a careful, nuanced statement. The emphasis is positive: pray for a sinning brother, and God will give life.',
   NULL),
  (17,
   'All unrighteousness is sin: and there is a sin not unto death.',
   'πᾶσα ἀδικία ἁμαρτία ἐστίν καὶ ἔστιν ἁμαρτία οὐ πρὸς θάνατον',
   'pasa adikia hamartia estin kai estin hamartia ou pros thanaton',
   '''All unrighteousness is sin'' (pasa adikia hamartia estin — every act of injustice is sin). ''A sin not unto death'' — most sin, though serious, does not lead to death and can be prayed about with confidence. John balances seriousness about sin with reassurance: yes, all unrighteousness is sin, but not all sin is the irremediable ''sin unto death.''',
   NULL),
  (18,
   'We know that whosoever is born of God sinneth not; but he that is begotten of God keepeth himself, and that wicked one toucheth him not.',
   'Οἴδαμεν ὅτι πᾶς ὁ γεγεννημένος ἐκ τοῦ θεοῦ οὐχ ἁμαρτάνει ἀλλ᾽ ὁ γεννηθεὶς ἐκ τοῦ θεοῦ τηρεῖ ἑαυτόν καὶ ὁ πονηρὸς οὐχ ἅπτεται αὐτοῦ',
   'Oidamen hoti pas ho gegennēmenos ek tou theou ouch hamartanei all'' ho gennētheis ek tou theou tērei heauton kai ho ponēros ouch haptetai autou',
   '''We know'' (oidamen — the first of three ''we know'' statements, vv.18-20). ''Sinneth not'' (ouch hamartanei — does not go on sinning habitually; cf. 3:9). ''Keepeth himself'' (tērei heauton — guards himself; some manuscripts read ''He born of God keeps him,'' referring to Christ). ''Toucheth him not'' (ouch haptetai autou — does not lay hold of him, does not seize him; haptomai means to grab with intent to harm). The born-again believer is protected: the evil one cannot get a grip on the one whom God has begotten.',
   NULL),
  (19,
   'And we know that we are of God, and the whole world lieth in wickedness.',
   'οἴδαμεν ὅτι ἐκ τοῦ θεοῦ ἐσμεν καὶ ὁ κόσμος ὅλος ἐν τῷ πονηρῷ κεῖται',
   'oidamen hoti ek tou theou esmen kai ho kosmos holos en tō ponērō keitai',
   '''We are of God'' (ek tou theou esmen — we originate from God; the second certainty). ''The whole world'' (ho kosmos holos — the entire world-system). ''Lieth in wickedness'' (en tō ponērō keitai — lies in the evil one; keitai means to lie, to recline, to be positioned; the world lies passively in the lap of the evil one, under his influence). Two spheres: believers are ''of God''; the world lies in Satan''s grip. There is no neutral ground.',
   NULL),
  (20,
   'And we know that the Son of God is come, and hath given us an understanding, that we may know him that is true, and we are in him that is true, even in his Son Jesus Christ. This is the true God, and eternal life.',
   'οἴδαμεν δὲ ὅτι ὁ υἱὸς τοῦ θεοῦ ἥκει καὶ δέδωκεν ἡμῖν διάνοιαν ἵνα γινώσκωμεν τὸν ἀληθινόν καὶ ἐσμὲν ἐν τῷ ἀληθινῷ ἐν τῷ υἱῷ αὐτοῦ Ἰησοῦ Χριστῷ οὗτός ἐστιν ὁ ἀληθινὸς θεὸς καὶ ἡ ζωὴ αἰώνιος',
   'oidamen de hoti ho huios tou theou hēkei kai dedōken hēmin dianoian hina ginōskōmen ton alēthinon kai esmen en tō alēthinō en tō huiō autou Iēsou Christō houtos estin ho alēthinos theos kai hē zōē aiōnios',
   '''The Son of God is come'' (ho huios tou theou hēkei — has arrived and is present; perfect tense: He has come and remains). ''Understanding'' (dianoian — the mind, the capacity for thought; God gives a new faculty of spiritual comprehension). ''Him that is true'' (ton alēthinon — the genuine, the real God). ''We are in him that is true'' (esmen en tō alēthinō — we are in the true One). ''This is the true God, and eternal life'' (houtos estin ho alēthinos theos kai hē zōē aiōnios) — ''this'' (houtos) most naturally refers to the nearest antecedent: Jesus Christ. John calls Jesus Christ the true God and eternal life — one of the strongest declarations of Christ''s deity in the NT.',
   'The deity of Christ: The declaration ''This is the true God, and eternal life'' is a direct identification of Jesus Christ as the true God. The Son who has come, who gives understanding, who is the one in whom believers abide — this One is the true God. Combined with John 1:1, 20:28, and Titus 2:13, this forms a definitive NT witness to Christ''s full deity.'),
  (21,
   'Little children, keep yourselves from idols. Amen.',
   'Τεκνία φυλάξατε ἑαυτὰ ἀπὸ τῶν εἰδώλων ἀμήν',
   'Teknia phylaxate heauta apo tōn eidōlōn amēn',
   '''Keep yourselves'' (phylaxate heauta — guard yourselves; aorist imperative: do it decisively). ''From idols'' (apo tōn eidōlōn — away from idols, images, false gods). A surprising and abrupt ending that is profoundly fitting. After a letter about knowing the true God through His Son, the final command is: stay away from every substitute. An idol is anything that takes the place of the true God — and John has just identified the true God as Jesus Christ (v.20). Any god other than the God revealed in Christ is an idol.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 John' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 4 (Victory / faith)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νίκη', 'nikē', 'G3529', 'Victory, conquest — used only here in the NT. The decisive triumph over the world-system and its pressures. The means of this victory is not moral effort or human strength but faith in the Son of God.', 1),
  ('πίστις', 'pistis', 'G4102', 'Faith, belief, trust — the settled confidence in Jesus as the Christ, the Son of God. Faith is the instrument by which the new birth overcomes the world. It looks beyond visible reality to the invisible God and His promises.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 5 AND v.verse_number = 4;

-- Verse 11 (Eternal life in the Son)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ζωὴν αἰώνιον', 'zōēn aiōnion', 'G2222/G166', 'Eternal life — not merely endless duration but the quality of life that belongs to the age to come: divine life, God''s own life shared with believers. This life is not a separate gift but is inseparable from the Son: "this life is in his Son."', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 5 AND v.verse_number = 11;

-- Verse 13 (Know / assurance)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εἰδῆτε', 'eidēte', 'G1492', 'Know, perceive with certainty — from oida, a verb of settled, intuitive knowledge (as opposed to ginōskō, which emphasises progressive learning). John wants believers to have absolute, unshakeable knowledge of their eternal life — not uncertain hope but confident assurance.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 5 AND v.verse_number = 13;

-- Verse 20 (True God / understanding)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('διάνοιαν', 'dianoian', 'G1271', 'Understanding, mind, intellectual capacity — from dia (through) + nous (mind). God gives a new faculty of thought: the ability to comprehend spiritual truth. The unregenerate mind cannot know the true God; the regenerate mind has been given this capacity.', 1),
  ('ἀληθινός', 'alēthinos', 'G228', 'True, genuine, real — as opposed to false, counterfeit, illusory. The "true God" is the real God as opposed to all false gods and idols. Jesus Christ is identified as this true God — the ultimate reality behind all copies and shadows.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 John' AND c.chapter_number = 5 AND v.verse_number = 20;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Believeth that Jesus is the Christ
  (1, 'John 1:12-13', 1), (1, '1 John 4:15', 2),
  -- v3: Commandments not grievous
  (3, 'Matthew 11:30', 1), (3, 'Deuteronomy 30:11', 2), (3, 'Psalm 119:97', 3),
  -- v4: Victory overcometh the world
  (4, 'John 16:33', 1), (4, 'Romans 8:37', 2), (4, 'Revelation 2:7', 3),
  -- v6: Came by water and blood
  (6, 'John 19:34', 1), (6, 'Matthew 3:16-17', 2), (6, 'John 15:26', 3),
  -- v7: Three that bear record
  (7, 'Matthew 28:19', 1), (7, '2 Corinthians 13:14', 2),
  -- v11: Eternal life in the Son
  (11, 'John 3:36', 1), (11, 'John 17:3', 2), (11, 'Colossians 3:4', 3),
  -- v12: He that hath the Son hath life
  (12, 'John 14:6', 1), (12, 'Acts 4:12', 2), (12, 'John 3:36', 3),
  -- v13: That ye may know
  (13, 'John 20:31', 1), (13, 'Romans 8:16', 2),
  -- v14: Ask according to his will
  (14, 'John 15:7', 1), (14, 'James 4:3', 2), (14, 'Matthew 6:10', 3),
  -- v18: Born of God sinneth not
  (18, '1 John 3:9', 1), (18, 'John 17:15', 2), (18, 'Jude 1:24', 3),
  -- v20: The true God and eternal life
  (20, 'John 1:1', 1), (20, 'John 17:3', 2), (20, 'Titus 2:13', 3),
  -- v21: Keep from idols
  (21, '1 Corinthians 10:14', 1), (21, '2 Corinthians 6:16', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 John' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 John Chapter 5 Complete
-- 21 verses · 5 key verses with word studies (8 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
