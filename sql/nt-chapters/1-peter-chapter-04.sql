-- ═══════════════════════════════════════════════════
-- 1 PETER CHAPTER 4 — Suffering as a Christian
-- 19 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  '1 Peter 4 intensifies the suffering theme with urgent eschatological awareness. Since Christ suffered in the flesh, believers must arm themselves with the same mind — ''he that hath suffered in the flesh hath ceased from sin'' (v.1). The break with the pagan past is decisive: no more excess of riot, lust, and drunkenness (vv.3-4). Former companions find this strange and speak evil (v.4), but they will give account to God (v.5). Peter urges: ''the end of all things is at hand: be ye therefore sober, and watch unto prayer'' (v.7). Love is supreme because ''charity shall cover the multitude of sins'' (v.8). Hospitality and the use of spiritual gifts are commanded (vv.9-11). Then comes the epistle''s climactic teaching on suffering: ''think it not strange concerning the fiery trial'' (v.12) — suffering as a Christian is not shame but glory, for ''the spirit of glory and of God resteth upon you'' (v.14). The chapter closes with the sober warning: ''judgment must begin at the house of God'' (v.17) — and if the righteous are scarcely saved, what shall become of the ungodly? The conclusion: ''let them that suffer according to the will of God commit the keeping of their souls to him in well doing, as unto a faithful Creator'' (v.19).',
  'Living in Light of the End and Suffering as a Christian',
  'πάσχει ὡς Χριστιανός (paschei hōs Christianos)',
  'Suffers as a Christian — suffering not for wrongdoing but specifically for bearing the name of Christ. This suffering is not shameful but glorious, for the Spirit of glory rests upon the sufferer.',
  '["Armed with the Mind of Christ (vv.1-2): Forasmuch then as Christ hath suffered for us in the flesh arm yourselves likewise with the same mind; for he that hath suffered in the flesh hath ceased from sin; that he no longer should live the rest of his time in the flesh to the lusts of men but to the will of God","The Past Life of Paganism (vv.3-5): For the time past of our life may suffice us to have wrought the will of the Gentiles when we walked in lasciviousness lusts excess of wine revellings banquetings and abominable idolatries; wherein they think it strange that ye run not with them to the same excess of riot speaking evil of you; who shall give account to him that is ready to judge the quick and the dead","The Gospel Preached to the Dead (v.6): For for this cause was the gospel preached also to them that are dead that they might be judged according to men in the flesh but live according to God in the spirit","The End Is at Hand: Be Sober and Love (vv.7-9): But the end of all things is at hand; be ye therefore sober and watch unto prayer; and above all things have fervent charity among yourselves for charity shall cover the multitude of sins; use hospitality one to another without grudging","Stewards of God''s Grace: Gifts for Service (vv.10-11): As every man hath received the gift even so minister the same one to another as good stewards of the manifold grace of God; if any man speak let him speak as the oracles of God; if any man minister let him do it as of the ability which God giveth that God in all things may be glorified through Jesus Christ to whom be praise and dominion for ever and ever Amen","The Fiery Trial (vv.12-14): Beloved think it not strange concerning the fiery trial which is to try you as though some strange thing happened unto you; but rejoice inasmuch as ye are partakers of Christ''s sufferings that when his glory shall be revealed ye may be glad also with exceeding joy; if ye be reproached for the name of Christ happy are ye for the spirit of glory and of God resteth upon you","Suffering as a Christian (vv.15-16): But let none of you suffer as a murderer or as a thief or as an evildoer or as a busybody in other men''s matters; yet if any man suffer as a Christian let him not be ashamed but let him glorify God on this behalf","Judgment Begins at the House of God (vv.17-19): For the time is come that judgment must begin at the house of God; and if it first begin at us what shall the end be of them that obey not the gospel of God; and if the righteous scarcely be saved where shall the ungodly and the sinner appear; wherefore let them that suffer according to the will of God commit the keeping of their souls to him in well doing as unto a faithful Creator"]'
FROM books b WHERE b.name = '1 Peter';

-- Step 2: Insert all 19 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Forasmuch then as Christ hath suffered for us in the flesh, arm yourselves likewise with the same mind: for he that hath suffered in the flesh hath ceased from sin;',
   'Χριστοῦ οὖν παθόντος ὑπὲρ ἡμῶν σαρκί τὴν αὐτὴν ἔννοιαν ὁπλίσασθε ὅτι ὁ παθὼν σαρκὶ πέπαυται ἁμαρτίας',
   'Christou oun pathontos hyper hēmōn sarki tēn autēn ennoian hoplisasthe hoti ho pathōn sarki pepautai hamartias',
   '''Arm yourselves'' (hoplisasthe — equip yourselves with weapons, take up arms; from hoplon, a weapon; an aorist imperative: make a decisive decision). ''Same mind'' (tēn autēn ennoian — the same mindset, the same way of thinking as Christ). ''Ceased from sin'' (pepautai hamartias — has stopped sinning, has broken with sin; perfect tense: the break is permanent). The person who has suffered in the flesh has made a decisive break with sin. Suffering exposes what truly matters, stripping away the allure of sin. The ''weapon'' is the mindset of Christ: willingness to suffer rather than sin.',
   NULL),
  (2,
   'That he no longer should live the rest of his time in the flesh to the lusts of men, but to the will of God.',
   'εἰς τὸ μηκέτι ἀνθρώπων ἐπιθυμίαις ἀλλὰ θελήματι θεοῦ τὸν ἐπίλοιπον ἐν σαρκὶ βιῶσαι χρόνον',
   'eis to mēketi anthrōpōn epithymiais alla thelēmati theou ton epiloipon en sarki biōsai chronon',
   '''No longer'' (mēketi — not any more, never again). ''Lusts of men'' (anthrōpōn epithymiais — human desires, the cravings of unregenerate humanity). ''Will of God'' (thelēmati theou — God''s purpose and desire). ''The rest of his time'' (ton epiloipon chronon — the remaining time, the time that is left). Two ways to live: driven by human desires or directed by God''s will. The decisive break of v.1 produces a new orientation: the remaining days of life on earth are no longer spent for self but for God.',
   NULL),
  (3,
   'For the time past of our life may suffice us to have wrought the will of the Gentiles, when we walked in lasciviousness, lusts, excess of wine, revellings, banquetings, and abominable idolatries:',
   'ἀρκετὸς γὰρ ὑμῖν ὁ παρεληλυθὼς χρόνος τοῦ βίου τὸ βούλημα τῶν ἐθνῶν κατεργάσασθαι πεπορευμένους ἐν ἀσελγείαις ἐπιθυμίαις οἰνοφλυγίαις κώμοις πότοις καὶ ἀθεμίτοις εἰδωλολατρείαις',
   'arketos gar hymin ho parelēlythōs chronos tou biou to boulēma tōn ethnōn katergasasthai peporeuomenous en aselgeiais epithymiais oinophlygiasis kōmois potois kai athemitois eidōlolatreiāis',
   '''Time past may suffice'' (arketos ho parelēlythōs chronos — enough time has been spent; an ironic understatement: you''ve wasted enough of your life already). Six vices catalogued: (1) ''lasciviousness'' (aselgeiais — unbridled sensuality), (2) ''lusts'' (epithymiais — cravings), (3) ''excess of wine'' (oinophlygiasis — drunkenness, wine-bubbling; used only here in NT), (4) ''revellings'' (kōmois — wild parties, carousing), (5) ''banquetings'' (potois — drinking bouts), (6) ''abominable idolatries'' (athemitois eidōlolatreiāis — unlawful, detestable idol worship). A window into pagan life in Asia Minor in the first century.',
   NULL),
  (4,
   'Wherein they think it strange that ye run not with them to the same excess of riot, speaking evil of you:',
   'ἐν ᾧ ξενίζονται μὴ συντρεχόντων ὑμῶν εἰς τὴν αὐτὴν τῆς ἀσωτίας ἀνάχυσιν βλασφημοῦντες',
   'en hō xenizontai mē syntrechontōn hymōn eis tēn autēn tēs asōtias anachysin blasphēmountes',
   '''Think it strange'' (xenizontai — are astonished, find it foreign; from xenos, stranger; they find your changed behaviour alien). ''Run with'' (syntrechontōn — running together, rushing along in a crowd; the image of a stampede). ''Excess of riot'' (asōtias anachysin — a flood of dissipation, a pouring forth of reckless waste; asōtia is literally ''un-saveable-ness,'' a life that cannot be rescued because it wastes everything). ''Speaking evil'' (blasphēmountes — blaspheming, slandering). When you stop running with the pack, the pack turns on you. Social pressure to conform to pagan norms was enormous in the first century, and resistance brought verbal abuse.',
   NULL),
  (5,
   'Who shall give account to him that is ready to judge the quick and the dead.',
   'οἳ ἀποδώσουσιν λόγον τῷ ἑτοίμως ἔχοντι κρῖναι ζῶντας καὶ νεκρούς',
   'hoi apodōsousin logon tō hetoimōs echonti krinai zōntas kai nekrous',
   '''Give account'' (apodōsousin logon — will render a word, will give a reckoning). ''Ready to judge'' (hetoimōs echonti krinai — already prepared to judge). ''The quick and the dead'' (zōntas kai nekrous — the living and the dead). The persecutors will answer to the ultimate Judge. No one escapes accountability. This truth sustains the persecuted: the slanderers will stand before God.',
   NULL),
  (6,
   'For for this cause was the gospel preached also to them that are dead, that they might be judged according to men in the flesh, but live according to God in the spirit.',
   'εἰς τοῦτο γὰρ καὶ νεκροῖς εὐηγγελίσθη ἵνα κριθῶσιν μὲν κατὰ ἀνθρώπους σαρκὶ ζῶσιν δὲ κατὰ θεὸν πνεύματι',
   'eis touto gar kai nekrois euēngelisthē hina krithōsin men kata anthrōpous sarki zōsin de kata theon pneumati',
   '''Dead'' (nekrois — those who are now dead; most likely believers who heard the gospel during their lifetime and have since died). The gospel was preached to them while alive. ''Judged according to men in the flesh'' — they experienced physical death (the judgment all humans face). ''Live according to God in the spirit'' — but they live on in the spiritual realm according to God''s purpose. The point: physical death does not negate the gospel''s promise. Those who believed and have died still live before God. This answered a pressing concern for persecuted believers who watched fellow Christians die.',
   NULL),
  (7,
   'But the end of all things is at hand: be ye therefore sober, and watch unto prayer.',
   'Πάντων δὲ τὸ τέλος ἤγγικεν σωφρονήσατε οὖν καὶ νήψατε εἰς τὰς προσευχάς',
   'Pantōn de to telos ēngiken sōphronēsate oun kai nēpsate eis tas proseuchas',
   '''The end of all things is at hand'' (pantōn to telos ēngiken — the end of everything has drawn near; perfect tense: it has come near and remains near). ''Sober'' (sōphronēsate — be sound-minded, be self-controlled, think clearly). ''Watch'' (nēpsate — be sober-minded, be vigilant; literally, be free from the influence of intoxicants). ''Unto prayer'' (eis tas proseuchas — with a view to prayer, for the purpose of prayer). Eschatological urgency produces not panic but sobriety and prayer. Clear thinking and persistent prayer are the proper responses to the approaching end.',
   NULL),
  (8,
   'And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.',
   'πρὸ πάντων δὲ τὴν εἰς ἑαυτοὺς ἀγάπην ἐκτενῆ ἔχοντες ὅτι ἀγάπη καλύψει πλῆθος ἁμαρτιῶν',
   'pro pantōn de tēn eis heautous agapēn ektenē echontes hoti agapē kalypsei plēthos hamartiōn',
   '''Above all things'' (pro pantōn — before everything, most importantly). ''Fervent'' (ektenē — stretched out, strained, intense; from ekteinō, to stretch out; the same word used in 1:22 for fervently loving). ''Charity shall cover the multitude of sins'' (agapē kalypsei plēthos hamartiōn — love will cover a great quantity of sins; quoting Prov 10:12). Love does not expose, publicise, or exploit the faults of others. It covers them — not by ignoring sin but by forgiving it, bearing with it, and seeking restoration rather than revenge.',
   'Love covers sins: Peter does not mean that love earns forgiveness of our own sins. Rather, love covers the sins of others — it does not keep a record of wrongs (1 Cor 13:5), it forgives rather than publicises, it restores rather than condemns. In a persecuted community, where stress and tension run high, fervent love is the essential glue that prevents fragmentation.'),
  (9,
   'Use hospitality one to another without grudging.',
   'φιλόξενοι εἰς ἀλλήλους ἄνευ γογγυσμῶν',
   'philoxenoi eis allēlous aneu gongysmon',
   '''Hospitality'' (philoxenoi — love of strangers, welcoming guests; from philos + xenos). ''Without grudging'' (aneu gongysmon — without grumbling, without murmuring). In the first century, travelling Christians relied on the hospitality of fellow believers since inns were often immoral and expensive. Peter knows that hosting guests can be burdensome, so he adds: do it cheerfully, not with resentment.',
   NULL),
  (10,
   'As every man hath received the gift, even so minister the same one to another, as good stewards of the manifold grace of God.',
   'ἕκαστος καθὼς ἔλαβεν χάρισμα εἰς ἑαυτοὺς αὐτὸ διακονοῦντες ὡς καλοὶ οἰκονόμοι ποικίλης χάριτος θεοῦ',
   'hekastos kathōs elaben charisma eis heautous auto diakonountes hōs kaloi oikonomoi poikilēs charitos theou',
   '''Every man'' (hekastos — each one, every individual; every believer has a gift). ''Gift'' (charisma — a grace-gift, a spiritual endowment from God). ''Minister'' (diakonountes — serve, use in service). ''Stewards'' (oikonomoi — household managers, administrators; from oikos, house + nomos, law; one who manages another''s resources). ''Manifold'' (poikilēs — many-coloured, variegated, diverse; the same word used of ''manifold temptations'' in 1:6). Gifts are not personal possessions to hoard but trust deposits to manage for others. The grace is God''s; we are merely stewards.',
   NULL),
  (11,
   'If any man speak, let him speak as the oracles of God; if any man minister, let him do it as of the ability which God giveth: that God in all things may be glorified through Jesus Christ, to whom be praise and dominion for ever and ever. Amen.',
   'εἴ τις λαλεῖ ὡς λόγια θεοῦ εἴ τις διακονεῖ ὡς ἐξ ἰσχύος ἧς χορηγεῖ ὁ θεός ἵνα ἐν πᾶσιν δοξάζηται ὁ θεὸς διὰ Ἰησοῦ Χριστοῦ ᾧ ἐστιν ἡ δόξα καὶ τὸ κράτος εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'ei tis lalei hōs logia theou ei tis diakonei hōs ex ischyos hēs chorēgei ho theos hina en pasin doxazētai ho theos dia Iēsou Christou hō estin hē doxa kai to kratos eis tous aiōnas tōn aiōnōn amēn',
   '''Oracles of God'' (logia theou — the utterances of God, divine words). Those who speak (teach, preach, prophesy) must speak as those delivering God''s word, not their own opinions. ''Ability which God giveth'' (ischyos hēs chorēgei ho theos — strength that God supplies; chorēgeō originally meant to fund a chorus in a Greek drama). Those who serve must rely on God''s strength, not their own. The goal of all ministry: ''that God may be glorified through Jesus Christ.'' The doxology (doxa kai kratos — glory and dominion) affirms Christ''s eternal rule.',
   NULL),
  (12,
   'Beloved, think it not strange concerning the fiery trial which is to try you, as though some strange thing happened unto you:',
   'ἀγαπητοί μὴ ξενίζεσθε τῇ ἐν ὑμῖν πυρώσει πρὸς πειρασμὸν ὑμῖν γινομένῃ ὡς ξένου ὑμῖν συμβαίνοντος',
   'agapētoi mē xenizesthe tē en hymin pyrōsei pros peirasmon hymin ginomenē hōs xenou hymin symbainontos',
   '''Think it not strange'' (mē xenizesthe — do not be astonished, do not find it foreign; same word as v.4 but now applied to believers: the world finds your holiness strange; do not find their persecution strange). ''Fiery trial'' (pyrōsei — a burning, a smelting process, a refiner''s fire; from pyroo, to burn). ''To try you'' (pros peirasmon — for the purpose of testing you). Suffering is not random but purposeful: it is a refiner''s fire designed to purify faith. It should not surprise us — it is the normal Christian experience.',
   NULL),
  (13,
   'But rejoice, inasmuch as ye are partakers of Christ''s sufferings; that, when his glory shall be revealed, ye may be glad also with exceeding joy.',
   'ἀλλὰ καθὸ κοινωνεῖτε τοῖς τοῦ Χριστοῦ παθήμασιν χαίρετε ἵνα καὶ ἐν τῇ ἀποκαλύψει τῆς δόξης αὐτοῦ χαρῆτε ἀγαλλιώμενοι',
   'alla katho koinōneite tois tou Christou pathēmasin chairete hina kai en tē apokalypsei tēs doxēs autou charēte agalliōmenoi',
   '''Rejoice'' (chairete — keep on rejoicing; present imperative). ''Partakers'' (koinōneite — share in, have fellowship with; from koinōnia, fellowship). ''Christ''s sufferings'' (tou Christou pathēmasin — the sufferings that belong to Christ). ''When his glory shall be revealed'' (en tē apokalypsei tēs doxēs — at the unveiling of His glory). ''Exceeding joy'' (agalliōmenoi — exulting, leaping with joy). The present-future contrast: present suffering → future glory. Suffering now is fellowship with Christ; glory then will be fellowship with Christ revealed.',
   NULL),
  (14,
   'If ye be reproached for the name of Christ, happy are ye; for the spirit of glory and of God resteth upon you: on their part he is evil spoken of, but on your part he is glorified.',
   'εἰ ὀνειδίζεσθε ἐν ὀνόματι Χριστοῦ μακάριοι ὅτι τὸ τῆς δόξης καὶ τὸ τοῦ θεοῦ πνεῦμα ἐφ᾽ ὑμᾶς ἀναπαύεται κατὰ μὲν αὐτοὺς βλασφημεῖται κατὰ δὲ ὑμᾶς δοξάζεται',
   'ei oneidizesthe en onomati Christou makarioi hoti to tēs doxēs kai to tou theou pneuma eph'' hymas anapauetai kata men autous blasphēmeitai kata de hymas doxazetai',
   '''Reproached'' (oneidizesthe — insulted, reviled). ''For the name of Christ'' (en onomati Christou — because of the name of Christ, for bearing His name). ''Happy'' (makarioi — blessed, fortunate; beatitude language). ''The spirit of glory and of God'' (to tēs doxēs kai to tou theou pneuma — the Spirit who is both glorious and divine). ''Resteth upon you'' (eph'' hymas anapauetai — rests upon you, settles upon you; reminiscent of the Shekinah glory resting on the tabernacle). When you suffer for Christ''s name, God''s glorious Spirit descends and rests on you like the glory cloud.',
   'The Spirit of glory in suffering: When believers suffer specifically for Christ''s name, they receive a special visitation of the Holy Spirit — "the spirit of glory and of God" rests upon them. This echoes the Shekinah glory that rested on the tabernacle and temple. Suffering for Christ''s name transforms the sufferer into a temple where God''s glory dwells.'),
  (15,
   'But let none of you suffer as a murderer, or as a thief, or as an evildoer, or as a busybody in other men''s matters.',
   'μὴ γάρ τις ὑμῶν πασχέτω ὡς φονεὺς ἢ κλέπτης ἢ κακοποιὸς ἢ ὡς ἀλλοτριοεπίσκοπος',
   'mē gar tis hymōn paschetō hōs phoneus ē kleptēs ē kakopoios ē hōs allotrioépiskopos',
   '''Murderer'' (phoneus). ''Thief'' (kleptēs). ''Evildoer'' (kakopoios — one who does evil). ''Busybody'' (allotrioépiskopos — one who oversees what belongs to others, a meddler in others'' affairs; from allotrios, belonging to another + episkopos, overseer). This rare word appears only here in the NT. A Christian who suffers for actual crime or meddling gets no spiritual credit. The blessing is for innocent suffering only.',
   NULL),
  (16,
   'Yet if any man suffer as a Christian, let him not be ashamed; but let him glorify God on this behalf.',
   'εἰ δὲ ὡς Χριστιανός μὴ αἰσχυνέσθω δοξαζέτω δὲ τὸν θεὸν ἐν τῷ μέρει τούτῳ',
   'ei de hōs Christianos mē aischynesthō doxazetō de ton theon en tō merei toutō',
   '''As a Christian'' (hōs Christianos — as a Christ-follower; the name ''Christian'' appears only three times in the NT: Acts 11:26; 26:28; here). Originally a term used by outsiders (''Christ-ians,'' those belonging to Christ), possibly derisive. Peter transforms it into a badge of honour. ''Not be ashamed'' (mē aischynesthō — let him not be disgraced). ''Glorify God on this behalf'' (doxazetō ton theon en tō merei toutō — let him praise God in this name, in this matter). The name ''Christian'' is to be worn with glory, not shame.',
   NULL),
  (17,
   'For the time is come that judgment must begin at the house of God: and if it first begin at us, what shall the end be of them that obey not the gospel of God?',
   'ὅτι ὁ καιρὸς τοῦ ἄρξασθαι τὸ κρίμα ἀπὸ τοῦ οἴκου τοῦ θεοῦ εἰ δὲ πρῶτον ἀφ᾽ ἡμῶν τί τὸ τέλος τῶν ἀπειθούντων τῷ τοῦ θεοῦ εὐαγγελίῳ',
   'hoti ho kairos tou arxasthai to krima apo tou oikou tou theou ei de prōton aph'' hēmōn ti to telos tōn apeithountōn tō tou theou euangeliō',
   '''The time is come'' (ho kairos tou arxasthai — the season for it to begin). ''Judgment must begin at the house of God'' (to krima apo tou oikou tou theou — judgment from the household of God). Peter draws on Ezek 9:6 where judgment began at the sanctuary. The persecution of Christians is a form of divine discipline — refining, purifying, testing. ''What shall the end be'' (ti to telos — what will the outcome be). If God''s own people undergo such testing, the fate of the disobedient will be incomparably worse.',
   'Judgment beginning at God''s house: Peter interprets the suffering of believers as God''s purifying judgment — not punitive but refining. If God refines His own family through suffering, the disobedient face a far more terrible judgment. This provides a theological framework for suffering: it is evidence of God''s fatherly discipline, not of His abandonment. The "house of God" is the church, the spiritual house of 2:5.'),
  (18,
   'And if the righteous scarcely be saved, where shall the ungodly and the sinner appear?',
   'καὶ εἰ ὁ δίκαιος μόλις σῴζεται ὁ ἀσεβὴς καὶ ἁμαρτωλὸς ποῦ φανεῖται',
   'kai ei ho dikaios molis sōzetai ho asebēs kai hamartōlos pou phaneitai',
   '''Scarcely'' (molis — with difficulty, barely; not because salvation is uncertain but because the path is hard; cf. Matt 7:14, ''narrow is the way''). ''Saved'' (sōzetai — is being saved; present tense: the ongoing process of salvation through trials). Peter quotes Proverbs 11:31 (LXX). ''Where shall the ungodly appear'' (pou phaneitai — where will they show up, what will become of them). If the righteous go through the fire of testing, the ungodly face the fire of judgment. A from-lesser-to-greater argument.',
   NULL),
  (19,
   'Wherefore let them that suffer according to the will of God commit the keeping of their souls to him in well doing, as unto a faithful Creator.',
   'ὥστε καὶ οἱ πάσχοντες κατὰ τὸ θέλημα τοῦ θεοῦ πιστῷ κτίστῃ παρατιθέσθωσαν τὰς ψυχὰς αὐτῶν ἐν ἀγαθοποιΐᾳ',
   'hōste kai hoi paschontes kata to thelēma tou theou pistō ktistē paratithesthōsan tas psychas autōn en agathopoiia',
   '''According to the will of God'' (kata to thelēma tou theou — suffering that falls within God''s sovereign plan). ''Commit'' (paratithesthōsan — entrust, deposit, hand over for safekeeping; the same word Jesus used on the cross: ''Father, into thy hands I commend my spirit,'' Luke 23:46). ''Keeping of their souls'' (tas psychas — their lives, their very selves). ''Faithful Creator'' (pistō ktistē — a Creator who is trustworthy; used only here in the NT as a title for God). ''Well doing'' (agathopoiia — doing good; even in suffering, keep doing right). The chapter closes as it began: arm yourself with Christ''s mindset (v.1) and entrust yourself to the faithful God who made you (v.19).',
   'Entrusting to the faithful Creator: Peter''s final word on suffering is trust. Believers are to entrust their souls to God — the faithful Creator. The title "Creator" is significant: the God who made you is capable of keeping you. The title "faithful" is assuring: He will not abandon what He has made. The manner of trusting: continue doing good. Suffering is not an excuse to stop serving; it is the context in which faithful service shines brightest.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Peter' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 8 (Fervent charity / cover sins)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐκτενῆ', 'ektenē', 'G1618', 'Fervent, stretched out, intense — from ekteinō (to stretch out). Love that is strained to the limit, love at full stretch, love that exerts maximum effort. Not casual affection but deliberate, costly love.', 1),
  ('καλύψει', 'kalypsei', 'G2572', 'Will cover — from kalyptō (to cover, to hide). Love covers sins by forgiving them, not by denying them. It does not publicise faults but seeks restoration. Cf. Prov 10:12, "love covereth all sins."', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 4 AND v.verse_number = 8;

-- Verse 12 (Fiery trial)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πυρώσει', 'pyrōsei', 'G4451', 'Fiery trial, burning, smelting — from pyroō (to burn, to refine by fire). The same process used to purify precious metals. Persecution is a furnace that burns away impurities and proves the genuineness of faith.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 4 AND v.verse_number = 12;

-- Verse 16 (Christian)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Χριστιανός', 'Christianos', 'G5546', 'Christian, a follower of Christ — from Christos + the Latin suffix -ianus (belonging to). Originally coined as a nickname by outsiders in Antioch (Acts 11:26). Peter transforms it from a term of reproach into a badge of honour.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 4 AND v.verse_number = 16;

-- Verse 19 (Faithful Creator)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κτίστῃ', 'ktistē', 'G2939', 'Creator — from ktizō (to create, to found). Used only here in the NT as a title for God. The God who created all things is fully capable of keeping what He has made. A title that grounds trust in God''s power and faithfulness.', 1),
  ('παρατιθέσθωσαν', 'paratithesthōsan', 'G3908', 'Let them commit, entrust, deposit — from para (beside) + tithēmi (to place). To place beside for safekeeping, like depositing valuables in a bank. Jesus used this word on the cross: "Father, into thy hands I commend my spirit" (Luke 23:46).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 4 AND v.verse_number = 19;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Arm yourselves with Christ''s mind
  (1, 'Philippians 2:5', 1), (1, 'Romans 6:6-7', 2), (1, 'Colossians 3:5', 3),
  -- v7: End of all things at hand
  (7, 'James 5:8', 1), (7, 'Romans 13:11-12', 2), (7, 'Philippians 4:5-6', 3),
  -- v8: Charity covers sins
  (8, 'Proverbs 10:12', 1), (8, '1 Corinthians 13:7', 2), (8, 'James 5:20', 3),
  -- v10: Stewards of grace
  (10, 'Romans 12:6-8', 1), (10, '1 Corinthians 12:4-7', 2), (10, 'Ephesians 4:11-12', 3),
  -- v11: Speak as oracles of God
  (11, '2 Timothy 4:2', 1), (11, '1 Corinthians 10:31', 2), (11, 'Colossians 3:17', 3),
  -- v12: Fiery trial
  (12, 'James 1:2-4', 1), (12, '1 Peter 1:6-7', 2), (12, 'Job 23:10', 3),
  -- v13: Partakers of Christ''s sufferings
  (13, 'Philippians 3:10', 1), (13, 'Romans 8:17', 2), (13, '2 Corinthians 4:17', 3),
  -- v14: Spirit of glory rests on you
  (14, 'Matthew 5:11-12', 1), (14, 'Acts 5:41', 2), (14, 'Isaiah 11:2', 3),
  -- v17: Judgment begins at house of God
  (17, 'Ezekiel 9:6', 1), (17, 'Hebrews 12:5-11', 2), (17, 'Luke 12:47-48', 3),
  -- v19: Commit souls to faithful Creator
  (19, 'Luke 23:46', 1), (19, 'Psalm 31:5', 2), (19, '2 Timothy 1:12', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Peter' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Peter Chapter 4 Complete
-- 19 verses · 4 key verses with word studies (7 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════