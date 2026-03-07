-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 6 — Lawsuits, Liberty, and the Body as Temple
-- 20 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'First Corinthians 6 addresses two related problems in the Corinthian church: believers suing one another in pagan courts (vv.1-11) and sexual immorality justified by a distorted view of Christian liberty (vv.12-20). Paul is astonished that Christians take disputes before unrighteous judges instead of resolving them within the church (v.1). ''Do ye not know that the saints shall judge the world?'' (v.2) — if believers will one day judge the world and angels, surely they can handle trivial earthly disputes (vv.2-3). It is better to suffer wrong than to defraud a brother (vv.7-8). Paul then issues a sobering catalogue: ''neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind, nor thieves, nor covetous, nor drunkards, nor revilers, nor extortioners, shall inherit the kingdom of God'' (vv.9-10). But the glorious declaration follows: ''And such were some of you: but ye are washed, but ye are sanctified, but ye are justified in the name of the Lord Jesus, and by the Spirit of our God'' (v.11). The chapter then pivots to address libertinism. The Corinthian slogan ''All things are lawful unto me'' is corrected: ''but all things are not expedient'' and ''I will not be brought under the power of any'' (v.12). ''Meats for the belly, and the belly for meats'' — another slogan Paul refutes: the body is not for fornication but ''for the Lord; and the Lord for the body'' (v.13). Since believers'' bodies are ''members of Christ'' (v.15), union with a prostitute is unthinkable. The climax declares: ''your body is the temple of the Holy Ghost which is in you'' (v.19). Therefore ''glorify God in your body, and in your spirit, which are God''s'' (v.20).',
  'The Body as Temple — Lawsuits, Liberty, and Sexual Holiness',
  'ναός (naos)',
  'Temple, sanctuary — from naiō (to dwell). Naos refers specifically to the inner sanctuary where God dwells, not the broader temple complex (hieron). Paul''s stunning declaration that the believer''s body is a naos of the Holy Spirit means that each Christian is a living holy of holies — the very dwelling place of God. This transforms the body from something disposable to something sacred.',
  '["Lawsuits Among Believers (vv.1-6): Dare any of you having a matter against another go to law before the unjust and not before the saints. Do ye not know that the saints shall judge the world and if the world shall be judged by you are ye unworthy to judge the smallest matters. Know ye not that we shall judge angels how much more things that pertain to this life","The Better Way: Suffer Wrong (vv.7-8): Now therefore there is utterly a fault among you because ye go to law one with another. Why do ye not rather take wrong why do ye not rather suffer yourselves to be defrauded. Nay ye do wrong and defraud and that your brethren","The Washed the Sanctified the Justified (vv.9-11): Know ye not that the unrighteous shall not inherit the kingdom of God. Be not deceived neither fornicators nor idolaters nor adulterers nor effeminate nor abusers of themselves with mankind nor thieves nor covetous nor drunkards nor revilers nor extortioners shall inherit the kingdom of God. And such were some of you but ye are washed but ye are sanctified but ye are justified in the name of the Lord Jesus and by the Spirit of our God","Christian Liberty and Its Limits (vv.12-14): All things are lawful unto me but all things are not expedient all things are lawful for me but I will not be brought under the power of any. Meats for the belly and the belly for meats but God shall destroy both it and them. Now the body is not for fornication but for the Lord and the Lord for the body","Your Body Is the Temple of the Holy Ghost (vv.15-20): Know ye not that your bodies are the members of Christ. Shall I then take the members of Christ and make them the members of an harlot. God forbid. What know ye not that your body is the temple of the Holy Ghost which is in you which ye have of God and ye are not your own. For ye are bought with a price therefore glorify God in your body and in your spirit which are God''s"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Dare any of you, having a matter against another, go to law before the unjust, and not before the saints?',
   'τολμᾷ τις ὑμῶν πρᾶγμα ἔχων πρὸς τὸν ἕτερον κρίνεσθαι ἐπὶ τῶν ἀδίκων καὶ οὐχὶ ἐπὶ τῶν ἁγίων',
   'tolma tis hymōn pragma echōn pros ton heteron krinesthai epi tōn adikōn kai ouchi epi tōn hagiōn',
   '''Dare'' (tolma — has the audacity). ''A matter'' (pragma — a legal case, dispute). ''Before the unjust'' (epi tōn adikōn — before the unrighteous, i.e., pagan judges). ''Before the saints'' (epi tōn hagiōn — before the holy ones, fellow believers). Paul is appalled that believers would air their disputes before pagan courts rather than resolving them within the believing community.',
   NULL),
  (2, 'Do ye not know that the saints shall judge the world? and if the world shall be judged by you, are ye unworthy to judge the smallest matters?',
   'οὐκ οἴδατε ὅτι οἱ ἅγιοι τὸν κόσμον κρινοῦσιν καὶ εἰ ἐν ὑμῖν κρίνεται ὁ κόσμος ἀνάξιοί ἐστε κριτηρίων ἐλαχίστων',
   'ouk oidate hoti hoi hagioi ton kosmon krinousin kai ei en hymin krinetai ho kosmos anaxioi este kritēriōn elachistōn',
   '''Do ye not know'' (ouk oidate — Paul''s rhetorical formula, used 6 times in this chapter alone). ''Judge the world'' (ton kosmon krinousin — believers will participate in the final judgment with Christ; cf. Daniel 7:22; Matthew 19:28; Revelation 20:4). ''Smallest matters'' (kritēriōn elachistōn — the most trivial cases). If saints have eschatological authority to judge the cosmos, they can surely adjudicate petty civil disputes.',
   NULL),
  (3, 'Know ye not that we shall judge angels? how much more things that pertain to this life?',
   'οὐκ οἴδατε ὅτι ἀγγέλους κρινοῦμεν μήτιγε βιωτικά',
   'ouk oidate hoti angelous krinoumen mētige biōtika',
   '''Judge angels'' (angelous krinoumen — we shall judge angels). This may refer to fallen angels (cf. 2 Peter 2:4; Jude 6) or to the saints'' authority over angelic beings in the age to come. ''Things that pertain to this life'' (biōtika — matters of daily living). The argument is a fortiori: if we will judge supernatural beings, earthly matters are comparatively trivial.',
   NULL),
  (4, 'If then ye have judgments of things pertaining to this life, set them to judge who are least esteemed in the church.',
   'βιωτικὰ μὲν οὖν κριτήρια ἐὰν ἔχητε τοὺς ἐξουθενημένους ἐν τῇ ἐκκλησίᾳ τούτους καθίζετε',
   'biōtika men oun kritēria ean echēte tous exouthenēmenous en tē ekklēsia toutous kathizete',
   '''Least esteemed'' (tous exouthenēmenous — those held in low regard; perfect passive: those who have been despised). Paul may be speaking ironically: even the humblest member of the church is more qualified to judge between believers than a pagan magistrate. The church has within itself the wisdom to resolve its own disputes.',
   NULL),
  (5, 'I speak to your shame. Is it so, that there is not a wise man among you? no, not one that shall be able to judge between his brethren?',
   'πρὸς ἐντροπὴν ὑμῖν λέγω οὕτως οὐκ ἔνι ἐν ὑμῖν σοφὸς οὐδὲ εἷς ὃς δυνήσεται διακρῖναι ἀνὰ μέσον τοῦ ἀδελφοῦ αὐτοῦ',
   'pros entropēn hymin legō houtōs ouk eni en hymin sophos oude heis hos dynēsetai diakrinai ana meson tou adelphou autou',
   '''To your shame'' (pros entropēn — intended to produce shame). ''Wise man'' (sophos — a wise person). Ironic, given that the Corinthians prided themselves on their wisdom (1:17-31; 3:18-20). ''Judge between'' (diakrinai — to distinguish, decide, arbitrate). Paul shames them: they boast of wisdom yet cannot find one wise person to mediate disputes.',
   NULL),
  (6, 'But brother goeth to law with brother, and that before the unbelievers.',
   'ἀλλὰ ἀδελφὸς μετὰ ἀδελφοῦ κρίνεται καὶ τοῦτο ἐπὶ ἀπίστων',
   'alla adelphos meta adelphou krinetai kai touto epi apistōn',
   '''Brother with brother'' (adelphos meta adelphou — the repetition emphasises the scandal). ''Before unbelievers'' (epi apistōn — in the presence of those who do not believe). The tragedy is doubled: not only do brothers fight, but they do so publicly before pagans, damaging the church''s witness.',
   NULL),
  (7, 'Now therefore there is utterly a fault among you, because ye go to law one with another. Why do ye not rather take wrong? why do ye not rather suffer yourselves to be defrauded?',
   'ἤδη μὲν οὖν ὅλως ἥττημα ὑμῖν ἐστιν ὅτι κρίματα ἔχετε μεθ᾿ ἑαυτῶν διατί οὐχὶ μᾶλλον ἀδικεῖσθε διατί οὐχὶ μᾶλλον ἀποστερεῖσθε',
   'ēdē men oun holōs hēttēma hymin estin hoti krimata echete meth heautōn diati ouchi mallon adikeisthe diati ouchi mallon apostereisthe',
   '''Utterly a fault'' (holōs hēttēma — already a complete defeat, a total loss). ''Take wrong'' (adikeisthe — be wronged, allow yourself to be treated unjustly). ''Be defrauded'' (apostereisthe — be cheated). Paul''s radical counsel: it is better to absorb injustice than to destroy the community''s unity and witness through litigation. This echoes Jesus'' teaching in Matthew 5:39-40.',
   NULL),
  (8, 'Nay, ye do wrong, and defraud, and that your brethren.',
   'ἀλλὰ ὑμεῖς ἀδικεῖτε καὶ ἀποστερεῖτε καὶ ταῦτα ἀδελφούς',
   'alla hymeis adikeite kai apostereite kai tauta adelphous',
   'The tables turn: not only do they refuse to suffer wrong — they are the ones doing the wronging and defrauding, and they do it to their own brothers. ''And that your brethren'' (kai tauta adelphous) — the emphatic final word heightens the shame.',
   NULL),
  (9, 'Know ye not that the unrighteous shall not inherit the kingdom of God? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind,',
   'ἢ οὐκ οἴδατε ὅτι ἄδικοι βασιλείαν θεοῦ οὐ κληρονομήσουσιν μὴ πλανᾶσθε οὔτε πόρνοι οὔτε εἰδωλολάτραι οὔτε μοιχοὶ οὔτε μαλακοὶ οὔτε ἀρσενοκοῖται',
   'ē ouk oidate hoti adikoi basileian theou ou klēronomēsousin mē planasthe oute pornoi oute eidōlolatrai oute moichoi oute malakoi oute arsenokoitai',
   '''Unrighteous'' (adikoi — the unjust; wordplay on v.1''s ''unjust'' judges). ''Inherit the kingdom'' (basileian theou klēronomēsousin — receive the kingdom as an inheritance). ''Be not deceived'' (mē planasthe — stop being led astray). ''Fornicators'' (pornoi), ''idolaters'' (eidōlolatrai), ''adulterers'' (moichoi), ''effeminate'' (malakoi — soft; in this context, the passive partner in same-sex relations), ''abusers of themselves with mankind'' (arsenokoitai — men who lie with men; from arsēn, male + koitē, bed; a word Paul appears to have coined from Leviticus 18:22 LXX).',
   'This vice catalogue is not meant to rank sins or to suggest that any single sin irreversibly damns. The key is the habitual, unrepentant practice of these sins as a pattern of life. The word ''inherit'' (klēronomēsousin) suggests not entry into heaven per se but receiving the full kingdom inheritance. The list is bracketed by v.11''s triumphant declaration: ''such were some of you'' — past tense. The gospel transforms.'),
  (10, 'Nor thieves, nor covetous, nor drunkards, nor revilers, nor extortioners, shall inherit the kingdom of God.',
   'οὔτε κλέπται οὔτε πλεονέκται οὔτε μέθυσοι οὐ λοίδοροι οὐχ ἅρπαγες βασιλείαν θεοῦ οὐ κληρονομήσουσιν',
   'oute kleptai oute pleonektai oute methysoi ou loidoroi ouch harpages basileian theou ou klēronomēsousin',
   '''Thieves'' (kleptai — stealers). ''Covetous'' (pleonektai — the greedy, grasping for more). ''Drunkards'' (methysoi). ''Revilers'' (loidoroi — verbal abusers). ''Extortioners'' (harpages — swindlers, those who seize by force). The list of ten vices covers the full spectrum of human sin: sexual, religious, relational, and economic. Paul''s point is comprehensive: no category of persistent, unrepentant sin is compatible with kingdom inheritance.',
   NULL),
  (11, 'And such were some of you: but ye are washed, but ye are sanctified, but ye are justified in the name of the Lord Jesus, and by the Spirit of our God.',
   'καὶ ταῦτά τινες ἦτε ἀλλὰ ἀπελούσασθε ἀλλὰ ἡγιάσθητε ἀλλὰ ἐδικαιώθητε ἐν τῷ ὀνόματι τοῦ κυρίου Ἰησοῦ Χριστοῦ καὶ ἐν τῷ πνεύματι τοῦ θεοῦ ἡμῶν',
   'kai tauta tines ēte alla apelousasthe alla hēgiasthēte alla edikaiōthēte en tō onomati tou kyriou Iēsou Christou kai en tō pneumati tou theou hēmōn',
   '''Such were some of you'' (tauta tines ēte — these things some of you used to be; past tense: definitive break with the old life). Three ''buts'' (alla — strong adversative): ''washed'' (apelousasthe — cleansed; middle voice: you got yourselves washed, i.e., submitted to baptism/cleansing), ''sanctified'' (hēgiasthēte — set apart as holy), ''justified'' (edikaiōthēte — declared righteous). ''In the name of the Lord Jesus'' — by his authority. ''By the Spirit of our God'' — through the Spirit''s power. All three persons of the Trinity are involved in the believer''s transformation.',
   'This is one of the most powerful declarations of gospel transformation in the NT. The triple ''but'' (alla) marks the decisive break between what the Corinthians were and what they have become by grace. The order — washed, sanctified, justified — is not systematic theology (where justification logically precedes sanctification) but experiential: the Corinthians first experienced cleansing (baptism), then consecration (being set apart), then the ongoing reality of their righteous standing before God. The verse demonstrates that the gospel does not merely forgive; it transforms. No one is beyond redemption.'),
  (12, 'All things are lawful unto me, but all things are not expedient: all things are lawful for me, but I will not be brought under the power of any.',
   'πάντα μοι ἔξεστιν ἀλλ᾿ οὐ πάντα συμφέρει πάντα μοι ἔξεστιν ἀλλ᾿ οὐκ ἐγὼ ἐξουσιασθήσομαι ὑπό τινος',
   'panta moi exestin all ou panta sympherei panta moi exestin all ouk egō exousiasthēsomai hypo tinos',
   '''All things are lawful'' (panta moi exestin — everything is permitted for me). This was likely a Corinthian slogan that Paul quotes and then qualifies. ''Not expedient'' (ou panta sympherei — not everything is beneficial, profitable, or helpful). ''Brought under the power'' (exousiasthēsomai — to be mastered, enslaved by). Christian freedom is not unlimited license. Two qualifications: (1) not everything is beneficial; (2) nothing should enslave the believer. True freedom is freedom from sin''s mastery, not freedom to sin.',
   'The Corinthian slogan ''all things are lawful'' may have originated from Paul''s own teaching about freedom from the law (Galatians 5:1), but the Corinthians twisted it into antinomian license. Paul''s correction is nuanced: he does not deny the principle of Christian liberty but adds two crucial qualifiers. Liberty must be evaluated by whether it is beneficial (sympherei — contributes to the good) and whether it leads to bondage (exousiasthēsomai — being brought under the power). An action that enslaves is the opposite of freedom.'),
  (13, 'Meats for the belly, and the belly for meats: but God shall destroy both it and them. Now the body is not for fornication, but for the Lord; and the Lord for the body.',
   'τὰ βρώματα τῇ κοιλίᾳ καὶ ἡ κοιλία τοῖς βρώμασιν ὁ δὲ θεὸς καὶ ταύτην καὶ ταῦτα καταργήσει τὸ δὲ σῶμα οὐ τῇ πορνείᾳ ἀλλὰ τῷ κυρίῳ καὶ ὁ κύριος τῷ σώματι',
   'ta brōmata tē koilia kai hē koilia tois brōmasin ho de theos kai tautēn kai tauta katargēsei to de sōma ou tē porneia alla tō kyriō kai ho kyrios tō sōmati',
   '''Meats for the belly'' — another Corinthian slogan arguing that physical appetites (including sexual) are morally neutral. Paul concedes the food point but rejects the extension to sexuality. ''The body is not for fornication, but for the Lord'' — the body has a higher destiny than appetite satisfaction. ''The Lord for the body'' — a stunning reciprocal claim: Christ has dedicated himself to the believer''s body. ''Destroy'' (katargēsei — will render inoperative). The digestive system is temporary; the body''s relationship to the Lord is eternal.',
   NULL),
  (14, 'And God hath both raised up the Lord, and will also raise up us by his own power.',
   'ὁ δὲ θεὸς καὶ τὸν κύριον ἤγειρεν καὶ ἡμᾶς ἐξεγερεῖ διὰ τῆς δυνάμεως αὐτοῦ',
   'ho de theos kai ton kyrion ēgeiren kai hēmas exegerei dia tēs dynameōs autou',
   '''Raised up'' (ēgeiren — aorist: God raised Christ as a past fact). ''Will also raise up us'' (hēmas exegerei — will raise us out; future). ''By his own power'' (dia tēs dynameōs autou). The resurrection of the body is the theological basis for bodily ethics. Because the body will be raised, it matters what we do with it now. The body is not a disposable container for the soul but an integral part of the person destined for resurrection.',
   NULL),
  (15, 'Know ye not that your bodies are the members of Christ? shall I then take the members of Christ, and make them the members of an harlot? God forbid.',
   'οὐκ οἴδατε ὅτι τὰ σώματα ὑμῶν μέλη Χριστοῦ ἐστιν ἄρας οὖν τὰ μέλη τοῦ Χριστοῦ ποιήσω πόρνης μέλη μὴ γένοιτο',
   'ouk oidate hoti ta sōmata hymōn melē Christou estin aras oun ta melē tou Christou poiēsō pornēs melē mē genoito',
   '''Members'' (melē — limbs, body parts). ''Of Christ'' — believers'' physical bodies are members of Christ''s body. ''Members of an harlot'' (pornēs melē — limbs of a prostitute). ''God forbid'' (mē genoito — may it never be). The logic is devastating: sexual union with a prostitute takes what belongs to Christ and joins it to a prostitute. The one-flesh union (v.16) means this is not merely a physical act but a spiritual violation.',
   NULL),
  (16, 'What? know ye not that he which is joined to an harlot is one body? for two, saith he, shall be one flesh.',
   'ἢ οὐκ οἴδατε ὅτι ὁ κολλώμενος τῇ πόρνῃ ἓν σῶμά ἐστιν ἔσονται γάρ φησίν οἱ δύο εἰς σάρκα μίαν',
   'ē ouk oidate hoti ho kollōmenos tē pornē hen sōma estin esontai gar phēsin hoi duo eis sarka mian',
   '''Joined'' (kollōmenos — glued to, cemented to; present passive: being joined). ''One body'' (hen sōma). ''Two shall be one flesh'' — Paul quotes Genesis 2:24, applying the creation ordinance of marriage to show that sexual union always creates a one-flesh bond, even outside marriage. This elevates sexual ethics beyond mere rule-keeping to the level of creational theology.',
   NULL),
  (17, 'But he that is joined unto the Lord is one spirit.',
   'ὁ δὲ κολλώμενος τῷ κυρίῳ ἓν πνεῦμά ἐστιν',
   'ho de kollōmenos tō kyriō hen pneuma estin',
   '''Joined unto the Lord'' (kollōmenos tō kyriō — united to the Lord; same verb as v.16). ''One spirit'' (hen pneuma — one spirit). The believer''s union with Christ is a spiritual union that is even more intimate and binding than the physical one-flesh union. If sexual union makes ''one body,'' spiritual union with Christ makes ''one spirit.'' The two unions are incompatible: one cannot be one spirit with Christ and one body with a prostitute.',
   NULL),
  (18, 'Flee fornication. Every sin that a man doeth is without the body; but he that committeth fornication sinneth against his own body.',
   'φεύγετε τὴν πορνείαν πᾶν ἁμάρτημα ὃ ἐὰν ποιήσῃ ἄνθρωπος ἐκτὸς τοῦ σώματός ἐστιν ὁ δὲ πορνεύων εἰς τὸ ἴδιον σῶμα ἁμαρτάνει',
   'pheugete tēn porneian pan hamartēma ho ean poiēsē anthrōpos ektos tou sōmatos estin ho de porneuōn eis to idion sōma hamartanei',
   '''Flee'' (pheugete — present imperative: keep fleeing, make it a habit to run). ''Every sin'' (pan hamartēma — every other sin). ''Without the body'' (ektos tou sōmatos — outside the body). ''Sinneth against his own body'' (eis to idion sōma hamartanei — sins into/against his own body). Sexual sin is uniquely self-destructive because it violates the body-temple. Other sins may harm the body indirectly, but sexual immorality is a direct assault on the body''s God-given dignity.',
   NULL),
  (19, 'What? know ye not that your body is the temple of the Holy Ghost which is in you, which ye have of God, and ye are not your own?',
   'ἢ οὐκ οἴδατε ὅτι τὸ σῶμα ὑμῶν ναὸς τοῦ ἐν ὑμῖν ἁγίου πνεύματός ἐστιν οὗ ἔχετε ἀπὸ θεοῦ καὶ οὐκ ἐστὲ ἑαυτῶν',
   'ē ouk oidate hoti to sōma hymōn naos tou en hymin hagiou pneumatos estin hou echete apo theou kai ouk este heautōn',
   '''Temple'' (naos — the inner sanctuary, the holy of holies). ''Of the Holy Ghost which is in you'' (tou en hymin hagiou pneumatos). ''Ye have of God'' (hou echete apo theou — whom you received from God). ''Ye are not your own'' (ouk este heautōn — you do not belong to yourselves). This is Paul''s climactic argument for sexual purity: the Holy Spirit personally indwells the believer''s physical body. The body is sacred space.',
   'This verse is among the most significant in Pauline theology for understanding the body. In 3:16, the church corporately is God''s temple; here, the individual believer''s body is a temple. The indwelling of the Holy Spirit makes every Christian''s body a sacred sanctuary. The implication is radical: bodily behavior is never merely ''physical'' — it is spiritual because the body is the Spirit''s dwelling place. ''Ye are not your own'' — the believer has been purchased (v.20) and no longer has autonomous sovereignty over the body. Self-ownership is exchanged for divine ownership.'),
  (20, 'For ye are bought with a price: therefore glorify God in your body, and in your spirit, which are God''s.',
   'ἠγοράσθητε γὰρ τιμῆς δοξάσατε δὴ τὸν θεὸν ἐν τῷ σώματι ὑμῶν καὶ ἐν τῷ πνεύματι ὑμῶν ἅτινά ἐστιν τοῦ θεοῦ',
   'ēgorasthēte gar timēs doxasate dē ton theon en tō sōmati hymōn kai en tō pneumati hymōn hatina estin tou theou',
   '''Bought with a price'' (ēgorasthēte timēs — purchased at a cost; the marketplace language of slave redemption). ''Glorify God'' (doxasate ton theon — make God''s glory visible). ''In your body'' — the body is the instrument of God''s glorification. The price is Christ''s blood (cf. 1 Peter 1:18-19). Because believers have been purchased, their bodies belong to the purchaser. The conclusion is not asceticism but purposeful use of the body for God''s glory.',
   'This verse completes the argument that began in v.12. The Corinthians claimed ''all things are lawful'' as autonomous agents. Paul demolishes this assumption: you are not autonomous. You were bought at the price of Christ''s blood. Your body and spirit belong to God. Therefore the body is not for self-gratification but for divine glorification. This transforms ethics from rule-keeping to worship: bodily holiness is an act of gratitude for redemption.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 6;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 judge
  ('κρίνω', 'krinō', 'G2919', 'To judge, decide, evaluate, hold court — the root of all ''judging'' language in this chapter. Paul uses krinō in its forensic sense: believers will sit in judgment over the world (v.2) and angels (v.3). The irony is sharp: those destined to judge the cosmos cannot resolve petty disputes among themselves. The word appears 6 times in vv.1-6, hammering the point home.', 1),
  -- v.9 arsenokoitai
  ('ἀρσενοκοίτης', 'arsenokoitēs', 'G733', 'One who lies with a male, a man who has sexual intercourse with men — a compound from arsēn (male) + koitē (bed, sexual intercourse). Paul likely coined this term from the Septuagint of Leviticus 18:22 and 20:13, where arsenos and koitēn appear together. The word describes the active participant in same-sex intercourse. It appears only here and in 1 Timothy 1:10 in the NT.', 2),
  -- v.11 washed
  ('ἀπολούω', 'apolouō', 'G628', 'To wash off, wash away, cleanse thoroughly — from apo (away from) + louō (to wash). The middle voice (apelousasthe — you got yourselves washed) suggests voluntary submission to cleansing, likely alluding to baptism as the outward sign of inner purification. In Acts 22:16, Ananias tells Paul: ''be baptized, and wash away thy sins.'' The washing is both ceremonial (baptism) and spiritual (the blood of Christ).', 3),
  -- v.11 justified
  ('δικαιόω', 'dikaioō', 'G1344', 'To declare righteous, acquit, vindicate — from dikaios (righteous). The forensic declaration that the sinner stands righteous before God. The aorist passive (edikaiōthēte — you were justified) indicates a completed, decisive act. Justification is not a process but a verdict. ''In the name of the Lord Jesus'' — on the basis of Christ''s work; ''by the Spirit of our God'' — through the Spirit''s application. The Trinity cooperates in justification.', 4),
  -- v.12 expedient
  ('συμφέρω', 'sympherō', 'G4851', 'To be profitable, beneficial, expedient — from syn (together) + pherō (to bring, carry). Something that ''brings things together'' for good. Paul''s first qualifier of the Corinthian liberty slogan: not everything that is permitted is beneficial. The question is not merely ''am I allowed?'' but ''does this build up?'' This shifts the ethics of freedom from individual rights to communal benefit.', 5),
  -- v.15 members
  ('μέλος', 'melos', 'G3196', 'A limb, member, body part — used both literally and metaphorically. Believers'' physical bodies are literally members (limbs) of Christ''s body. This is not mere metaphor: through the Spirit''s indwelling, the believer''s body is organically connected to Christ. To join Christ''s member to a prostitute is to create an impossible, monstrous union of the holy and the profane.', 6),
  -- v.19 temple
  ('ναός', 'naos', 'G3485', 'Temple, sanctuary, the inner shrine — from naiō (to dwell). Distinguished from hieron (the entire temple complex), naos refers specifically to the dwelling place of the deity — the holy of holies. Paul''s declaration that the believer''s body is a naos of the Holy Spirit is among the most exalted claims in the NT about the human body. What was once said only of the Jerusalem temple is now said of every believer.', 7),
  -- v.20 bought with a price
  ('ἀγοράζω', 'agorazō', 'G59', 'To buy in the marketplace, purchase, redeem — from agora (marketplace). The language of commercial transaction applied to redemption: believers were purchased out of sin''s slave market at the cost of Christ''s blood. The passive voice (ēgorasthēte — you were bought) emphasises that the believer is the object, not the agent, of redemption. The price (timēs — value, cost) is Christ''s life (cf. 1 Peter 1:18-19; Revelation 5:9).', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 6
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 9
    WHEN 3 THEN 11
    WHEN 4 THEN 11
    WHEN 5 THEN 12
    WHEN 6 THEN 15
    WHEN 7 THEN 19
    WHEN 8 THEN 20
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 saints judge the world
  (2, 'Daniel 7:22', 1),
  (2, 'Matthew 19:28', 2),
  (2, 'Revelation 20:4', 3),
  -- v.3 judge angels
  (3, '2 Peter 2:4', 4),
  (3, 'Jude 1:6', 5),
  -- v.7 suffer wrong
  (7, 'Matthew 5:39-40', 6),
  (7, '1 Peter 2:19-23', 7),
  -- v.9 unrighteous not inherit
  (9, 'Galatians 5:19-21', 8),
  (9, 'Ephesians 5:5', 9),
  (9, 'Revelation 21:8', 10),
  -- v.9 arsenokoitai
  (9, 'Leviticus 18:22', 11),
  (9, '1 Timothy 1:10', 12),
  -- v.11 washed sanctified justified
  (11, 'Titus 3:5-7', 13),
  (11, 'Acts 22:16', 14),
  (11, 'Romans 8:30', 15),
  -- v.12 all things lawful
  (12, '1 Corinthians 10:23', 16),
  (12, 'Galatians 5:13', 17),
  -- v.13 body for the Lord
  (13, 'Romans 12:1', 18),
  -- v.14 raised us up
  (14, 'Romans 8:11', 19),
  (14, '2 Corinthians 4:14', 20),
  -- v.15 members of Christ
  (15, '1 Corinthians 12:27', 21),
  (15, 'Ephesians 5:30', 22),
  -- v.16 one flesh
  (16, 'Genesis 2:24', 23),
  (16, 'Ephesians 5:31', 24),
  -- v.18 flee fornication
  (18, 'Genesis 39:12', 25),
  (18, '2 Timothy 2:22', 26),
  -- v.19 body is temple
  (19, '1 Corinthians 3:16', 27),
  (19, '2 Corinthians 6:16', 28),
  (19, 'John 14:17', 29),
  -- v.20 bought with a price
  (20, '1 Corinthians 7:23', 30),
  (20, '1 Peter 1:18-19', 31),
  (20, 'Revelation 5:9', 32)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 6
  AND v.verse_number = cr.verse_number;
