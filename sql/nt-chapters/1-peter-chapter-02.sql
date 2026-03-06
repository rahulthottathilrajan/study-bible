-- ═══════════════════════════════════════════════════
-- 1 PETER CHAPTER 2 — Living Stones and Submission
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '1 Peter 2 moves from the individual believer''s new birth (ch.1) to the corporate identity of God''s people. Believers are to crave the ''sincere milk of the word'' (v.2) and come to Christ, the ''living stone'' rejected by men but chosen by God (v.4). They are being built into a ''spiritual house'' — a ''holy priesthood'' and a ''royal priesthood'' — to offer spiritual sacrifices and declare God''s praises (vv.5,9). Peter applies four OT titles to the church: chosen generation, royal priesthood, holy nation, peculiar people (v.9). The second half addresses Christian conduct in a hostile world. Believers are ''strangers and pilgrims'' who must abstain from fleshly lusts and maintain ''honest conversation among the Gentiles'' (vv.11-12). Peter then introduces the submission theme that runs through 3:7: submit to every human institution for the Lord''s sake (vv.13-17). Servants are to submit even to harsh masters, following the example of Christ who ''when he was reviled, reviled not again; when he suffered, he threatened not'' (v.23). The chapter climaxes in vv.24-25 with a magnificent summary of the atonement: Christ ''bare our sins in his own body on the tree'' and ''by whose stripes ye were healed.''',
  'The Living Stone and the Suffering Servant',
  'λίθον ζῶντα (lithon zōnta)',
  'A living stone — Christ is the stone that is alive, rejected by human builders but chosen and precious to God. Believers, also as living stones, are built upon Him into a spiritual temple.',
  '["Desire the Pure Milk of the Word (vv.1-3): Wherefore laying aside all malice and all guile and hypocrisies and envies and all evil speakings; as newborn babes desire the sincere milk of the word that ye may grow thereby; if so be ye have tasted that the Lord is gracious","Living Stones and a Spiritual House (vv.4-5): To whom coming as unto a living stone disallowed indeed of men but chosen of God and precious; ye also as lively stones are built up a spiritual house an holy priesthood to offer up spiritual sacrifices acceptable to God by Jesus Christ","The Cornerstone and the Stumbling Stone (vv.6-8): Wherefore also it is contained in the scripture Behold I lay in Sion a chief corner stone elect precious and he that believeth on him shall not be confounded; unto you therefore which believe he is precious but unto them which be disobedient the stone which the builders disallowed the same is made the head of the corner; and a stone of stumbling and a rock of offence; even to them which stumble at the word being disobedient whereunto also they were appointed","A Royal Priesthood (v.9): But ye are a chosen generation a royal priesthood an holy nation a peculiar people that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light","From No People to God''s People (vv.10-12): Which in time past were not a people but are now the people of God; which had not obtained mercy but now have obtained mercy; dearly beloved I beseech you as strangers and pilgrims abstain from fleshly lusts which war against the soul; having your conversation honest among the Gentiles that whereas they speak against you as evildoers they may by your good works which they shall behold glorify God in the day of visitation","Submit to Human Authority (vv.13-17): Submit yourselves to every ordinance of man for the Lord''s sake whether it be to the king as supreme or unto governors; for so is the will of God that with well doing ye may put to silence the ignorance of foolish men; as free and not using your liberty for a cloke of maliciousness but as the servants of God; honour all men love the brotherhood fear God honour the king","Servants and Suffering for Righteousness (vv.18-20): Servants be subject to your masters with all fear not only to the good and gentle but also to the froward; for this is thankworthy if a man for conscience toward God endure grief suffering wrongfully; for what glory is it if when ye be buffeted for your faults ye shall take it patiently; but if when ye do well and suffer for it ye take it patiently this is acceptable with God","Christ Our Example in Suffering (vv.21-25): For even hereunto were ye called because Christ also suffered for us leaving us an example that ye should follow his steps; who did no sin neither was guile found in his mouth; who when he was reviled reviled not again when he suffered he threatened not but committed himself to him that judgeth righteously; who his own self bare our sins in his own body on the tree that we being dead to sins should live unto righteousness by whose stripes ye were healed; for ye were as sheep going astray but are now returned unto the Shepherd and Bishop of your souls"]'
FROM books b WHERE b.name = '1 Peter';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Wherefore laying aside all malice, and all guile, and hypocrisies, and envies, and all evil speakings,',
   'ἀποθέμενοι οὖν πᾶσαν κακίαν καὶ πάντα δόλον καὶ ὑποκρίσεις καὶ φθόνους καὶ πάσας καταλαλιάς',
   'apothemenoi oun pasan kakian kai panta dolon kai hypokriseis kai phthonous kai pasas katalalias',
   '''Laying aside'' (apothemenoi — having stripped off, as a garment; cf. James 1:21). Five sins to discard: (1) ''malice'' (kakian — wickedness, ill-will), (2) ''guile'' (dolon — deceit, craftiness, the bait in a trap), (3) ''hypocrisies'' (hypokriseis — play-acting, wearing a mask), (4) ''envies'' (phthonous — jealousy, resentment at another''s good), (5) ''evil speakings'' (katalalias — slander, speaking against; cf. James 4:11). These five are all relational sins — they destroy community. Since believers are born again into a family (1:23), they must strip off what damages the family.',
   NULL),
  (2,
   'As newborn babes, desire the sincere milk of the word, that ye may grow thereby:',
   'ὡς ἀρτιγέννητα βρέφη τὸ λογικὸν ἄδολον γάλα ἐπιποθήσατε ἵνα ἐν αὐτῷ αὐξηθῆτε',
   'hōs artigennēta brephē to logikon adolon gala epipothēsate hina en autō auxēthēte',
   '''Newborn babes'' (artigennēta brephē — just-born infants; from arti, just now + gennaō, to beget). ''Desire'' (epipothēsate — crave intensely, long for with deep yearning; the instinctive, desperate hunger of a newborn). ''Sincere'' (adolon — unadulterated, pure, without deceit; from a + dolos, without guile; contrast the dolos stripped off in v.1). ''Milk of the word'' (logikon gala — rational/spiritual milk; logikos from logos, word/reason; the milk that nourishes the mind and spirit). ''Grow'' (auxēthēte — grow up, increase). The spiritual appetite should match the physical: as a baby craves milk, the believer must crave God''s word.',
   NULL),
  (3,
   'If so be ye have tasted that the Lord is gracious.',
   'εἴπερ ἐγεύσασθε ὅτι χρηστὸς ὁ κύριος',
   'eiper egeusasthe hoti chrēstos ho kyrios',
   '''Tasted'' (egeusasthe — experienced, sampled; cf. Psalm 34:8, ''O taste and see that the LORD is good''). ''Gracious'' (chrēstos — kind, good, pleasant, benevolent). The motivation for craving the word is experience: you have already tasted God''s goodness. The tasting creates the craving. Those who have experienced the Lord''s kindness naturally hunger for more.',
   NULL),
  (4,
   'To whom coming, as unto a living stone, disallowed indeed of men, but chosen of God, and precious,',
   'πρὸς ὃν προσερχόμενοι λίθον ζῶντα ὑπὸ ἀνθρώπων μὲν ἀποδεδοκιμασμένον παρὰ δὲ θεῷ ἐκλεκτὸν ἔντιμον',
   'pros hon proserchomenoi lithon zōnta hypo anthrōpōn men apodedokimasmenon para de theō eklekton entimon',
   '''Coming'' (proserchomenoi — drawing near, approaching; present tense: continually coming to Christ). ''Living stone'' (lithon zōnta — a stone that is alive; an oxymoron that captures Christ''s uniqueness: solid as stone, alive with resurrection life). ''Disallowed'' (apodedokimasmenon — rejected after examination, tested and declared unfit; the builders examined the stone, judged it unsuitable, and discarded it). ''Chosen of God and precious'' (eklekton entimon — selected and held in honour by God). The verdict of men: rejected. The verdict of God: chosen and precious. Christ''s value is determined not by human opinion but by divine election.',
   NULL),
  (5,
   'Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to God by Jesus Christ.',
   'καὶ αὐτοὶ ὡς λίθοι ζῶντες οἰκοδομεῖσθε οἶκος πνευματικός ἱεράτευμα ἅγιον ἀνενέγκαι πνευματικὰς θυσίας εὐπροσδέκτους τῷ θεῷ διὰ Ἰησοῦ Χριστοῦ',
   'kai autoi hōs lithoi zōntes oikodomeisthe oikos pneumatikos hierateuma hagion anenénkai pneumatikas thysias euprosdektous tō theō dia Iēsou Christou',
   '''Lively stones'' (lithoi zōntes — living stones; each believer is a living stone being built into the structure). ''Built up'' (oikodomeisthe — being built into, being constructed; present passive: God is the builder). ''Spiritual house'' (oikos pneumatikos — a spirit-built temple; the church replaces the Jerusalem temple). ''Holy priesthood'' (hierateuma hagion — a consecrated priesthood; every believer is a priest). ''Spiritual sacrifices'' (pneumatikas thysias — sacrifices of the Spirit: prayer, praise, good deeds, the offering of self; cf. Rom 12:1). ''Acceptable through Jesus Christ'' — our sacrifices are accepted not on their own merit but through Christ the mediator.',
   'The priesthood of all believers: Peter applies to the entire church what was once true only of Israel''s priests. Every believer is a priest with direct access to God. The church is both the temple (spiritual house) and the priesthood (holy priests). The sacrifices are no longer animals but spiritual offerings: praise, prayer, service, and holy living — all acceptable through Christ.'),
  (6,
   'Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded.',
   'διὸ καὶ περιέχει ἐν τῇ γραφῇ ἰδοὺ τίθημι ἐν Σιὼν λίθον ἀκρογωνιαῖον ἐκλεκτὸν ἔντιμον καὶ ὁ πιστεύων ἐπ᾽ αὐτῷ οὐ μὴ καταισχυνθῇ',
   'dio kai periechei en tē graphē idou tithēmi en Siōn lithon akrogōniaion eklekton entimon kai ho pisteuōn ep'' autō ou mē kataischynthē',
   'Peter quotes Isaiah 28:16. ''Chief corner stone'' (akrogōniaion — the cornerstone, the foundation stone that determines the alignment of the entire building). ''Elect, precious'' — God personally chose and values this stone. ''Shall not be confounded'' (ou mē kataischynthē — shall never, under any circumstances, be put to shame; the strongest possible Greek negation). The promise: whoever trusts in Christ will never be disappointed, never be disgraced, never find their faith misplaced.',
   NULL),
  (7,
   'Unto you therefore which believe he is precious: but unto them which be disobedient, the stone which the builders disallowed, the same is made the head of the corner,',
   'ὑμῖν οὖν ἡ τιμὴ τοῖς πιστεύουσιν ἀπειθοῦσιν δὲ λίθον ὃν ἀπεδοκίμασαν οἱ οἰκοδομοῦντες οὗτος ἐγενήθη εἰς κεφαλὴν γωνίας',
   'hymin oun hē timē tois pisteuousin apeithousin de lithon hon apedokimasan hoi oikodomountes houtos egenēthē eis kephalēn gōnias',
   '''Precious'' (hē timē — the honour, the preciousness). For believers, Christ is precious — the supreme treasure. Peter quotes Psalm 118:22: the stone the builders rejected has become the head of the corner. The builders (Israel''s leaders) examined Jesus and rejected Him. But God reversed their verdict: the rejected stone became the most important stone in the building. ''Disobedient'' (apeithousin — those who refuse to believe, who are wilfully disobedient; unbelief is disobedience).',
   NULL),
  (8,
   'And a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient: whereunto also they were appointed.',
   'καὶ λίθος προσκόμματος καὶ πέτρα σκανδάλου οἳ προσκόπτουσιν τῷ λόγῳ ἀπειθοῦντες εἰς ὃ καὶ ἐτέθησαν',
   'kai lithos proskommatos kai petra skandalou hoi proskoptousin tō logō apeithountes eis ho kai etethēsan',
   'Peter quotes Isaiah 8:14. ''Stone of stumbling'' (lithos proskommatos — a stone you trip over). ''Rock of offence'' (petra skandalou — a rock that causes a fall; skandalon is the trigger of a trap). Christ is either the foundation you build on or the stone you stumble over. ''Stumble at the word'' — they stumble because they disobey the gospel. ''Whereunto also they were appointed'' (eis ho kai etethēsan — to which they were also set, appointed). The stumbling of the disobedient is not random but falls within God''s sovereign purpose.',
   NULL),
  (9,
   'But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:',
   'ὑμεῖς δὲ γένος ἐκλεκτόν βασίλειον ἱεράτευμα ἔθνος ἅγιον λαὸς εἰς περιποίησιν ὅπως τὰς ἀρετὰς ἐξαγγείλητε τοῦ ἐκ σκότους ὑμᾶς καλέσαντος εἰς τὸ θαυμαστὸν αὐτοῦ φῶς',
   'hymeis de genos eklekton basileion hierateuma ethnos hagion laos eis peripoiēsin hopōs tas aretas exangeilēte tou ek skotous hymas kalesantos eis to thaumaston autou phōs',
   'Four OT titles for Israel now applied to the church (Exod 19:5-6; Isa 43:20-21): (1) ''Chosen generation'' (genos eklekton — elect race). (2) ''Royal priesthood'' (basileion hierateuma — a kingdom of priests, kings who are priests). (3) ''Holy nation'' (ethnos hagion — a nation set apart). (4) ''Peculiar people'' (laos eis peripoiēsin — a people for God''s own possession). The purpose: ''shew forth the praises'' (tas aretas exangeilēte — declare the excellencies, proclaim the virtues). ''Out of darkness into his marvellous light'' — the great transfer: from the kingdom of darkness to the kingdom of light.',
   'The church as the new Israel: Peter applies to the multi-ethnic church the titles God gave to ethnic Israel at Sinai. This does not mean the church replaces Israel but that believers from all nations now share in these privileges. The fourfold identity establishes the church''s dignity; the purpose clause establishes its mission: to declare the excellencies of God who called them from darkness to light.'),
  (10,
   'Which in time past were not a people, but are now the people of God: which had not obtained mercy, but now have obtained mercy.',
   'οἵ ποτε οὐ λαὸς νῦν δὲ λαὸς θεοῦ οἱ οὐκ ἠλεημένοι νῦν δὲ ἐλεηθέντες',
   'hoi pote ou laos nyn de laos theou hoi ouk ēleēmenoi nyn de eleēthentes',
   'Peter quotes Hosea 2:23 and 1:6,9. Hosea spoke of the restoration of Israel after judgment; Peter applies it to Gentile believers who were ''not a people'' (ou laos — without identity, without belonging) but are now ''the people of God'' (laos theou). ''Had not obtained mercy'' (ouk ēleēmenoi) → ''now have obtained mercy'' (nyn eleēthentes). The transformation is entirely by mercy, not merit. Those who had no identity, no standing, no claim on God are now His treasured possession.',
   NULL),
  (11,
   'Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul;',
   'ἀγαπητοί παρακαλῶ ὡς παροίκους καὶ παρεπιδήμους ἀπέχεσθαι τῶν σαρκικῶν ἐπιθυμιῶν αἵτινες στρατεύονται κατὰ τῆς ψυχῆς',
   'agapētoi parakalō hōs paroikous kai parepidēmous apechesthai tōn sarkikōn epithymiōn haitines strateuontai kata tēs psychēs',
   '''Strangers and pilgrims'' (paroikous kai parepidēmous — resident aliens and temporary visitors; double terms emphasising that this world is not home). ''Abstain'' (apechesthai — hold yourselves away from, keep clear of). ''Fleshly lusts'' (sarkikōn epithymiōn — desires of the flesh, cravings rooted in fallen human nature). ''War against the soul'' (strateuontai kata tēs psychēs — wage military campaign against your soul). Sin is not merely forbidden behaviour; it is active warfare against the believer''s inner life. The motivation for holiness: you are foreigners here — do not adopt the customs of a country that is not your home.',
   NULL),
  (12,
   'Having your conversation honest among the Gentiles: that, whereas they speak against you as evildoers, they may by your good works, which they shall behold, glorify God in the day of visitation.',
   'τὴν ἀναστροφὴν ὑμῶν ἐν τοῖς ἔθνεσιν ἔχοντες καλήν ἵνα ἐν ᾧ καταλαλοῦσιν ὑμῶν ὡς κακοποιῶν ἐκ τῶν καλῶν ἔργων ἐποπτεύσαντες δοξάσωσιν τὸν θεὸν ἐν ἡμέρᾳ ἐπισκοπῆς',
   'tēn anastrophēn hymōn en tois ethnesin echontes kalēn hina en hō katalalousin hymōn hōs kakopoiōn ek tōn kalōn ergōn epopteusantes doxasōsin ton theon en hēmera episkopēs',
   '''Honest conversation'' (anastrophēn kalēn — beautiful conduct, excellent manner of life). ''Evildoers'' (kakopoiōn — those who do evil; Christians were slandered as cannibals, atheists, and subversives). ''Good works which they shall behold'' (kalōn ergōn epopteusantes — having observed closely your good deeds; epopteuō means to watch carefully, to be an eyewitness). ''Glorify God in the day of visitation'' (doxasōsin ton theon en hēmera episkopēs — when God visits them, either in judgment or in salvation, they will glorify God because of your witness). Good conduct silences slander and may convert the slanderer.',
   NULL),
  (13,
   'Submit yourselves to every ordinance of man for the Lord''s sake: whether it be to the king, as supreme;',
   'ὑποτάγητε οὖν πάσῃ ἀνθρωπίνῃ κτίσει διὰ τὸν κύριον εἴτε βασιλεῖ ὡς ὑπερέχοντι',
   'hypotagēte oun pasē anthrōpinē ktisei dia ton kyrion eite basilei hōs hyperechonti',
   '''Submit'' (hypotagēte — place yourselves under, arrange yourselves under authority). ''Every ordinance of man'' (pasē anthrōpinē ktisei — every human institution, every created human authority structure). ''For the Lord''s sake'' (dia ton kyrion — because of the Lord, out of reverence for Christ). ''King as supreme'' (basilei hōs hyperechonti — the emperor as the highest authority). The emperor when Peter wrote was likely Nero. Submission to government is not because rulers are good but because the Lord commands it. The exception: when government commands what God forbids (Acts 5:29).',
   NULL),
  (14,
   'Or unto governors, as unto them that are sent by him for the punishment of evildoers, and for the praise of them that do well.',
   'εἴτε ἡγεμόσιν ὡς δι᾽ αὐτοῦ πεμπομένοις εἰς ἐκδίκησιν μὲν κακοποιῶν ἔπαινον δὲ ἀγαθοποιῶν',
   'eite hēgemosin hōs di'' autou pempomenois eis ekdikēsin men kakopoiōn epainon de agathopoiōn',
   '''Governors'' (hēgemosin — provincial governors, appointed rulers). ''Sent by him'' (di'' autou pempomenois — sent through him, delegated by the king). ''Punishment of evildoers'' (ekdikēsin kakopoiōn — the avenging of wrongdoers). ''Praise of them that do well'' (epainon agathopoiōn — commendation of those who do good). Government has a dual function: restrain evil and reward good (cf. Rom 13:3-4). When government fulfils this purpose, submission is straightforward; when it perverts this purpose, the believer''s primary allegiance remains to God.',
   NULL),
  (15,
   'For so is the will of God, that with well doing ye may put to silence the ignorance of foolish men:',
   'ὅτι οὕτως ἐστὶν τὸ θέλημα τοῦ θεοῦ ἀγαθοποιοῦντας φιμοῦν τὴν τῶν ἀφρόνων ἀνθρώπων ἀγνωσίαν',
   'hoti houtōs estin to thelēma tou theou agathopoiountas phimoun tēn tōn aphronōn anthrōpōn agnōsian',
   '''Will of God'' (thelēma tou theou). ''Well doing'' (agathopoiountas — doing good). ''Put to silence'' (phimoun — muzzle, gag, silence; the same word used for muzzling an ox, 1 Cor 9:9, and for silencing a demon, Mark 1:25). ''Ignorance of foolish men'' (agnōsian aphronōn anthrōpōn — the wilful ignorance of senseless people). The best apologetic is a good life. Slander crumbles before consistent, visible goodness.',
   NULL),
  (16,
   'As free, and not using your liberty for a cloke of maliciousness, but as the servants of God.',
   'ὡς ἐλεύθεροι καὶ μὴ ὡς ἐπικάλυμμα ἔχοντες τῆς κακίας τὴν ἐλευθερίαν ἀλλ᾽ ὡς δοῦλοι θεοῦ',
   'hōs eleutheroi kai mē hōs epikalymma echontes tēs kakias tēn eleutherian all'' hōs douloi theou',
   '''Free'' (eleutheroi — free people, liberated). ''Cloke'' (epikalymma — a covering, a veil, a pretext). ''Maliciousness'' (kakias — wickedness, evil). ''Servants of God'' (douloi theou — slaves of God). Christian freedom is real — believers are free from sin''s dominion, free from the law''s condemnation. But freedom is not licence. Using freedom as a pretext for evil is a perversion. True freedom is expressed in voluntary servitude to God: free from sin, slaves of God.',
   NULL),
  (17,
   'Honour all men. Love the brotherhood. Fear God. Honour the king.',
   'πάντας τιμήσατε τὴν ἀδελφότητα ἀγαπᾶτε τὸν θεὸν φοβεῖσθε τὸν βασιλέα τιμᾶτε',
   'pantas timēsate tēn adelphotēta agapate ton theon phobeisthe ton basilea timate',
   'Four terse commands covering all relationships: (1) ''Honour all men'' (pantas timēsate — give due respect to every person, regardless of status). (2) ''Love the brotherhood'' (tēn adelphotēta agapate — keep on loving the community of believers; present imperative: continual love). (3) ''Fear God'' (ton theon phobeisthe — keep on reverencing God). (4) ''Honour the king'' (ton basilea timate — keep on honouring the emperor). Note: all are honoured, but only the brotherhood is loved with agapē; only God is feared with reverential awe. The king receives honour, but God receives fear.',
   NULL),
  (18,
   'Servants, be subject to your masters with all fear; not only to the good and gentle, but also to the froward.',
   'οἱ οἰκέται ὑποτασσόμενοι ἐν παντὶ φόβῳ τοῖς δεσπόταις οὐ μόνον τοῖς ἀγαθοῖς καὶ ἐπιεικέσιν ἀλλὰ καὶ τοῖς σκολιοῖς',
   'hoi oiketai hypotassomenoi en panti phobō tois despotais ou monon tois agathois kai epieikésin alla kai tois skoliois',
   '''Servants'' (oiketai — household servants, domestic slaves). ''Masters'' (despotais — lords, masters; from which we get "despot"). ''Good and gentle'' (agathois kai epieikésin — kind and reasonable masters). ''Froward'' (skoliois — crooked, perverse, harsh, unreasonable). Submission is not conditioned on the master''s character. This was revolutionary in the first century: Christian ethics did not depend on the worthiness of the authority figure but on the worthiness of Christ whom we serve.',
   NULL),
  (19,
   'For this is thankworthy, if a man for conscience toward God endure grief, suffering wrongfully.',
   'τοῦτο γὰρ χάρις εἰ διὰ συνείδησιν θεοῦ ὑποφέρει τις λύπας πάσχων ἀδίκως',
   'touto gar charis ei dia syneidēsin theou hypopherei tis lypas paschōn adikōs',
   '''Thankworthy'' (charis — grace, favour; it is a grace from God, something commendable). ''Conscience toward God'' (syneidēsin theou — awareness of God, consciousness of God''s presence). ''Endure grief'' (hypopherei lypas — bears up under sorrows, carries the weight of pain). ''Suffering wrongfully'' (paschōn adikōs — suffering unjustly). Grace is found not in suffering for your own faults but in suffering unjustly with a clear conscience before God. This elevates innocent suffering to a spiritual discipline.',
   NULL),
  (20,
   'For what glory is it, if, when ye be buffeted for your faults, ye shall take it patiently? but if, when ye do well, and suffer for it, ye take it patiently, this is acceptable with God.',
   'ποῖον γὰρ κλέος εἰ ἁμαρτάνοντες καὶ κολαφιζόμενοι ὑπομενεῖτε ἀλλ᾽ εἰ ἀγαθοποιοῦντες καὶ πάσχοντες ὑπομενεῖτε τοῦτο χάρις παρὰ θεῷ',
   'poion gar kleos ei hamartanontes kai kolaphizomenoi hypomeneite all'' ei agathopoiountes kai paschontes hypomeneite touto charis para theō',
   '''Glory'' (kleos — credit, fame, renown). ''Buffeted'' (kolaphizomenoi — struck with fists, beaten; from kolaphos, a fist-punch). ''Faults'' (hamartanontes — sinning, doing wrong). ''Do well'' (agathopoiountes — doing good). ''Acceptable with God'' (charis para theō — grace in God''s sight, favour before God). The distinction: suffering punishment for wrongdoing earns no merit; suffering unjustly for doing right earns God''s commendation.',
   NULL),
  (21,
   'For even hereunto were ye called: because Christ also suffered for us, leaving us an example, that ye should follow his steps:',
   'εἰς τοῦτο γὰρ ἐκλήθητε ὅτι καὶ Χριστὸς ἔπαθεν ὑπὲρ ὑμῶν ὑμῖν ὑπολιμπάνων ὑπογραμμὸν ἵνα ἐπακολουθήσητε τοῖς ἴχνεσιν αὐτοῦ',
   'eis touto gar eklēthēte hoti kai Christos epathen hyper hymōn hymin hypolimpanōn hypogrammon hina epakolouthēsēte tois ichnesin autou',
   '''Called'' (eklēthēte — summoned by God; the Christian calling includes suffering). ''Suffered for us'' (epathen hyper hymōn — suffered on your behalf). ''Example'' (hypogrammon — a writing copy, a pattern to trace over; used only here in the NT; literally a copybook letter that students traced to learn to write). ''Follow his steps'' (epakolouthēsēte tois ichnesin — follow closely in his footprints). Christ''s suffering is both substitutionary (''for us'') and exemplary (''leaving an example''). We cannot repeat His atoning work, but we can trace His pattern of patient, innocent suffering.',
   NULL),
  (22,
   'Who did no sin, neither was guile found in his mouth:',
   'ὃς ἁμαρτίαν οὐκ ἐποίησεν οὐδὲ εὑρέθη δόλος ἐν τῷ στόματι αὐτοῦ',
   'hos hamartian ouk epoiēsen oude heurethē dolos en tō stomati autou',
   'Peter quotes Isaiah 53:9. ''Did no sin'' (hamartian ouk epoiēsen — committed no sin; not merely that He was not caught sinning but that He did not sin at all). ''Guile'' (dolos — deceit, craftiness). ''Found in his mouth'' (heurethē en tō stomati — was discovered in His speech). Two categories of sinlessness: action (no sin) and speech (no deceit). Christ''s life and lips were perfectly holy. This sinlessness qualifies Him as the unblemished sacrifice (v.24) and makes His suffering truly innocent.',
   NULL),
  (23,
   'Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously:',
   'ὃς λοιδορούμενος οὐκ ἀντελοιδόρει πάσχων οὐκ ἠπείλει παρεδίδου δὲ τῷ κρίνοντι δικαίως',
   'hos loidoroumenos ouk anteloidorei paschōn ouk ēpeilei paredidou de tō krinonti dikaiōs',
   '''Reviled'' (loidoroumenos — being verbally abused, being insulted). ''Reviled not again'' (ouk anteloidorei — did not return insult for insult; anti + loidoreō: did not answer back with abuse). ''Suffered'' (paschōn — enduring pain). ''Threatened not'' (ouk ēpeilei — did not make threats, did not promise retaliation). ''Committed himself'' (paredidou — handed himself over, entrusted himself; from paradidōmi, to hand over, to entrust). ''To him that judgeth righteously'' — Christ entrusted His case to the righteous Judge. He refused to take vengeance because He trusted the Father to vindicate Him. This is the supreme example for suffering believers.',
   NULL),
  (24,
   'Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed.',
   'ὃς τὰς ἁμαρτίας ἡμῶν αὐτὸς ἀνήνεγκεν ἐν τῷ σώματι αὐτοῦ ἐπὶ τὸ ξύλον ἵνα ταῖς ἁμαρτίαις ἀπογενόμενοι τῇ δικαιοσύνῃ ζήσωμεν οὗ τῷ μώλωπι αὐτοῦ ἰάθητε',
   'hos tas hamartias hēmōn autos anēnenken en tō sōmati autou epi to xylon hina tais hamartiais apogenomenoi tē dikaiosynē zēsōmen hou tō mōlōpi autou iathēte',
   '''His own self'' (autos — He Himself, personally, emphatic). ''Bare'' (anēnenken — carried up, offered up; the sacrificial term for offering upon an altar). ''Our sins'' (tas hamartias hēmōn — the sins belonging to us). ''In his own body'' (en tō sōmati autou — in His physical body; the atonement is bodily). ''On the tree'' (epi to xylon — upon the wood, the cross; ''tree'' echoes Deut 21:23, ''cursed is every one that hangeth on a tree''). ''Dead to sins'' (tais hamartiais apogenomenoi — having departed from sins, having died to sins). ''Live unto righteousness'' (tē dikaiosynē zēsōmen — might live for righteousness). ''Stripes'' (mōlōpi — wound, weal, bruise; singular: one collective wound). ''Healed'' (iathēte — you were healed; aorist: definitively healed at the cross). Peter quotes Isaiah 53:5-6,12.',
   'The substitutionary atonement: This verse is one of the clearest statements of penal substitutionary atonement in Scripture. Christ bore our sins (substitution) in His body (physically) on the cross (the cursed tree). The purpose: that we might die to sin and live to righteousness. The means of healing: His stripes — His suffering is our cure. The atonement is personal ("our sins"), bodily ("in his body"), penal ("on the tree"), substitutionary ("bare our sins"), and effective ("ye were healed").'),
  (25,
   'For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls.',
   'ἦτε γὰρ ὡς πρόβατα πλανώμενα ἀλλ᾽ ἐπεστράφητε νῦν ἐπὶ τὸν ποιμένα καὶ ἐπίσκοπον τῶν ψυχῶν ὑμῶν',
   'ēte gar hōs probata planōmena all'' epestraphēte nyn epi ton poimena kai episkopon tōn psychōn hymōn',
   '''Sheep going astray'' (probata planōmena — sheep wandering, straying; from Isaiah 53:6, ''all we like sheep have gone astray''). ''Returned'' (epestraphēte — turned back, were converted). ''Shepherd'' (poimena — the one who tends, feeds, protects, and guides the flock; cf. John 10:11, ''I am the good shepherd''). ''Bishop'' (episkopon — overseer, guardian, one who watches over; from epi + skopeō, to look upon from above). Christ is both Shepherd (who leads and feeds) and Bishop (who oversees and guards). The chapter that began with Christ the living stone ends with Christ the living Shepherd.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Peter' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 5 (Living stones / spiritual house)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἱεράτευμα', 'hierateuma', 'G2406', 'Priesthood, a body of priests — from hiereus (priest). Not individual priests but a collective priesthood. Every believer has priestly access to God and priestly duty to offer spiritual sacrifices.', 1),
  ('οἰκοδομεῖσθε', 'oikodomeisthe', 'G3618', 'Are being built up — present passive: God is the builder, believers are the stones being fitted into the structure. The building is ongoing; it is not yet complete.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 2 AND v.verse_number = 5;

-- Verse 9 (Royal priesthood)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βασίλειον', 'basileion', 'G934', 'Royal, kingly — belonging to a king. Combined with hierateuma (priesthood), it means a kingdom of priests: believers are both kings and priests, exercising royal authority and priestly service.', 1),
  ('περιποίησιν', 'peripoiēsin', 'G4047', 'Possession, acquisition, one''s own property — from peri + poieō, to make one''s own. God''s "peculiar people" are His treasured possession, acquired for Himself. Cf. Exod 19:5, "a peculiar treasure."', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 2 AND v.verse_number = 9;

-- Verse 21 (Example / follow his steps)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπογραμμόν', 'hypogrammon', 'G5261', 'Example, pattern, writing-copy — from hypo (under) + graphō (to write). A copybook letter traced by students. Christ left a pattern of suffering that believers trace with their own lives. Used only here in the NT.', 1),
  ('ἴχνεσιν', 'ichnesin', 'G2487', 'Steps, footprints, tracks — from ichnos (footprint). We are to follow in the very footprints Christ left, stepping exactly where He stepped, especially in patient, innocent suffering.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 2 AND v.verse_number = 21;

-- Verse 24 (Bare our sins / stripes)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀνήνεγκεν', 'anēnenken', 'G399', 'Bore up, carried up, offered up — from ana (up) + pherō (to carry). A sacrificial term: to carry the offering up to the altar. Christ carried our sins to the cross as a priest carries the sacrifice to the altar.', 1),
  ('μώλωπι', 'mōlōpi', 'G3468', 'Stripe, wound, weal, bruise — the mark left by a blow. Singular: one collective wound. By His single, comprehensive wound we were healed. From Isaiah 53:5.', 2),
  ('ξύλον', 'xylon', 'G3586', 'Tree, wood, timber — used for the cross. Echoes Deut 21:23: "cursed is every one that hangeth on a tree." Christ was made a curse for us (Gal 3:13).', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 2 AND v.verse_number = 24;

-- Verse 25 (Shepherd and Bishop)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποιμένα', 'poimena', 'G4166', 'Shepherd — one who tends, feeds, leads, and protects the flock. Christ is the Good Shepherd who lays down His life (John 10:11), the Great Shepherd raised from the dead (Heb 13:20), and the Chief Shepherd who will appear in glory (1 Pet 5:4).', 1),
  ('ἐπίσκοπον', 'episkopon', 'G1985', 'Bishop, overseer, guardian — from epi (over) + skopeō (to look). One who watches over, superintends, and guards. Christ is the ultimate overseer of our souls, the guardian of our spiritual well-being.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 2 AND v.verse_number = 25;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Desire the word
  (2, 'Hebrews 5:12-13', 1), (2, 'Matthew 4:4', 2), (2, 'Psalm 119:103', 3),
  -- v5: Spiritual house / holy priesthood
  (5, 'Ephesians 2:20-22', 1), (5, 'Revelation 1:6', 2), (5, 'Romans 12:1', 3),
  -- v6: Cornerstone
  (6, 'Isaiah 28:16', 1), (6, 'Ephesians 2:20', 2), (6, 'Romans 9:33', 3),
  -- v9: Royal priesthood
  (9, 'Exodus 19:5-6', 1), (9, 'Isaiah 43:20-21', 2), (9, 'Colossians 1:13', 3),
  -- v10: Now the people of God
  (10, 'Hosea 2:23', 1), (10, 'Hosea 1:6-9', 2), (10, 'Romans 9:25-26', 3),
  -- v11: Strangers and pilgrims
  (11, 'Hebrews 11:13', 1), (11, 'Galatians 5:17', 2), (11, 'Romans 13:14', 3),
  -- v13: Submit to authority
  (13, 'Romans 13:1-7', 1), (13, 'Titus 3:1', 2), (13, 'Matthew 22:21', 3),
  -- v17: Honour all men / fear God
  (17, 'Romans 12:10', 1), (17, 'Proverbs 24:21', 2), (17, 'Ecclesiastes 12:13', 3),
  -- v21: Christ''s example in suffering
  (21, 'Philippians 2:5-8', 1), (21, '1 John 2:6', 2), (21, 'Hebrews 12:2-3', 3),
  -- v24: Bare our sins on the tree
  (24, 'Isaiah 53:4-6', 1), (24, 'Galatians 3:13', 2), (24, '2 Corinthians 5:21', 3),
  -- v25: Shepherd and Bishop of souls
  (25, 'John 10:11-14', 1), (25, 'Isaiah 53:6', 2), (25, 'Ezekiel 34:23', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Peter Chapter 2 Complete
-- 25 verses · 6 key verses with word studies (12 words)
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════