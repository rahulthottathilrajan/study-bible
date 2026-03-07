-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 13 — Practical Exhortations and the Great Benediction
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 13,
  'Hebrews 13 is the practical conclusion of the epistle, translating the great theological arguments of chapters 1-12 into daily Christian conduct. The chapter opens with a rapid series of exhortations: ''Let brotherly love continue'' (v.1); show hospitality to strangers, ''for thereby some have entertained angels unawares'' (v.2); remember prisoners and the afflicted (v.3); honor marriage and the marriage bed (v.4); be free from covetousness, ''for he hath said, I will never leave thee, nor forsake thee'' (v.5). The great confession follows: ''The Lord is my helper, and I will not fear what man shall do unto me'' (v.6). The chapter then turns to leadership and doctrine: ''Remember them which have the rule over you'' (v.7); ''Jesus Christ the same yesterday, and to day, and for ever'' (v.8) — the doctrinal anchor against strange teachings. The call to go ''outside the camp'' (vv.11-13) is the epistle''s final call to break decisively with Judaism: ''let us go forth therefore unto him without the camp, bearing his reproach.'' Believers have ''no continuing city, but we seek one to come'' (v.14). The sacrifices of the new covenant are defined: ''the sacrifice of praise'' and ''to do good and to communicate'' (vv.15-16). Obedience to spiritual leaders is urged (v.17), followed by a prayer request (vv.18-19). The epistle concludes with one of the most magnificent benedictions in all of Scripture: ''Now the God of peace, that brought again from the dead our Lord Jesus, that great shepherd of the sheep, through the blood of the everlasting covenant, make you perfect in every good work to do his will'' (vv.20-21). Personal greetings, a mention of Timothy''s release, and a final grace close the letter: ''Grace be with you all. Amen'' (v.25).',
  'Practical Holiness, Going Outside the Camp, and the Great Benediction',
  'ἀναφέρωμεν (anapherōmen)',
  'Let us offer up — from anapherō (G399), to carry up, to offer up, to bring as a sacrifice. In v.15, believers are called to ''offer the sacrifice of praise to God continually.'' Under the new covenant, the sacrifices are no longer animals on an altar but praise from the lips (the fruit of lips confessing His name) and good works shared with others (v.16). The priestly language of the entire epistle reaches its practical climax: every believer is now a priest offering spiritual sacrifices.',
  '["Practical Exhortations for Community Life (vv.1-6): Let brotherly love continue; be not forgetful to entertain strangers for thereby some have entertained angels unawares; remember them that are in bonds as bound with them and them which suffer adversity as being yourselves also in the body; marriage is honourable in all and the bed undefiled but whoremongers and adulterers God will judge; let your conversation be without covetousness and be content with such things as ye have for he hath said I will never leave thee nor forsake thee; so that we may boldly say The Lord is my helper and I will not fear what man shall do unto me","Following Faithful Leaders and the Unchanging Christ (vv.7-9): Remember them which have the rule over you who have spoken unto you the word of God whose faith follow considering the end of their conversation; Jesus Christ the same yesterday and to day and for ever; be not carried about with divers and strange doctrines for it is a good thing that the heart be established with grace not with meats which have not profited them that have been occupied therein","Going Outside the Camp: The Altar of the New Covenant (vv.10-16): We have an altar whereof they have no right to eat which serve the tabernacle; for the bodies of those beasts whose blood is brought into the sanctuary by the high priest for sin are burned without the camp; wherefore Jesus also that he might sanctify the people with his own blood suffered without the gate; let us go forth therefore unto him without the camp bearing his reproach; for here have we no continuing city but we seek one to come; by him therefore let us offer the sacrifice of praise to God continually that is the fruit of our lips giving thanks to his name; but to do good and to communicate forget not for with such sacrifices God is well pleased","Obedience Prayer and the Great Benediction (vv.17-25): Obey them that have the rule over you and submit yourselves for they watch for your souls as they that must give account; pray for us for we trust we have a good conscience in all things willing to live honestly; but I beseech you the rather to do this that I may be restored to you the sooner; now the God of peace that brought again from the dead our Lord Jesus that great shepherd of the sheep through the blood of the everlasting covenant make you perfect in every good work to do his will working in you that which is wellpleasing in his sight through Jesus Christ to whom be glory for ever and ever amen; and I beseech you brethren suffer the word of exhortation for I have written a letter unto you in few words; know ye that our brother Timothy is set at liberty with whom if he come shortly I will see you; salute all them that have the rule over you and all the saints; they of Italy salute you; grace be with you all amen"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 25 verses (key verses with study/doctrinal notes)
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Let brotherly love continue.',
   'ἡ φιλαδελφία μενέτω',
   'hē philadelphia menetō',
   '''Brotherly love'' (philadelphia — love of brothers, sibling-affection among believers; from philos + adelphos). ''Continue'' (menetō — let it remain, let it abide; present imperative = keep on doing what you are already doing). The community already practices philadelphia; the exhortation is to persist in it. This is the first of a rapid-fire series of practical commands that flow from the theological vision of chapters 1-12.',
   NULL),
  (2, 'Be not forgetful to entertain strangers: for thereby some have entertained angels unawares.',
   'τῆς φιλοξενίας μὴ ἐπιλανθάνεσθε διὰ ταύτης γὰρ ἔλαθόν τινες ξενίσαντες ἀγγέλους',
   'tēs philoxenias mē epilanthanesthe dia tautēs gar elathon tines xenisantes angelous',
   '''Hospitality'' (philoxenias — love of strangers; from philos + xenos). ''Be not forgetful'' (mē epilanthanesthe — do not neglect, do not forget). ''Entertained angels unawares'' (elathon xenisantes angelous — they were unaware they were hosting angels). The allusion is to Abraham at Mamre (Gen 18:1-8) and Lot at Sodom (Gen 19:1-3), both of whom received angelic visitors disguised as travelers. The principle: every stranger may be a divine messenger.',
   NULL),
  (3, 'Remember them that are in bonds, as bound with them; and them which suffer adversity, as being yourselves also in the body.',
   'μιμνῄσκεσθε τῶν δεσμίων ὡς συνδεδεμένοι τῶν κακουχουμένων ὡς καὶ αὐτοὶ ὄντες ἐν σώματι',
   'mimnēskesthe tōn desmiōn hōs syndedemeroi tōn kakouchoumenōn hōs kai autoi ontes en sōmati',
   '''Remember'' (mimnēskesthe — keep in mind, be mindful of). ''Them that are in bonds'' (tōn desmiōn — prisoners, those bound in chains). ''As bound with them'' (hōs syndedemeroi — as though you were in chains alongside them). ''Them which suffer adversity'' (tōn kakouchoumenōn — those being mistreated, abused). ''As being yourselves also in the body'' (hōs kai autoi ontes en sōmati — since you too are in a physical body and vulnerable to the same suffering). The call to radical empathy: identification with the persecuted as though sharing their chains.',
   NULL),
  (4, 'Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers God will judge.',
   'τίμιος ὁ γάμος ἐν πᾶσιν καὶ ἡ κοίτη ἀμίαντος πόρνους δὲ καὶ μοιχοὺς κρινεῖ ὁ θεός',
   'timios ho gamos en pasin kai hē koitē amiantos pornous de kai moichous krinei ho theos',
   '''Marriage is honourable'' (timios ho gamos — marriage is precious, valued, to be held in honor). ''In all'' (en pasin — among all people, in every respect). ''The bed undefiled'' (hē koitē amiantos — the marriage bed is pure, unpolluted). ''Whoremongers'' (pornous — fornicators, the sexually immoral). ''Adulterers'' (moichous — those who violate the marriage covenant). ''God will judge'' (krinei ho theos — God Himself will judge). Marriage and its physical expression are God-given and good; sexual activity outside marriage is under divine judgment.',
   NULL),
  (5, 'Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee.',
   'ἀφιλάργυρος ὁ τρόπος ἀρκούμενοι τοῖς παροῦσιν αὐτὸς γὰρ εἴρηκεν Οὐ μή σε ἀνῶ οὐδ᾽ οὐ μή σε ἐγκαταλίπω',
   'aphilargyros ho tropos arkoumenoi tois parousin autos gar eirēken ou mē se anō oud ou mē se enkatalipō',
   '''Without covetousness'' (aphilargyros — free from love of money; from a-negative + philos + argyros/silver). ''Conversation'' (tropos — manner of life, conduct, character). ''Content'' (arkoumenoi — being satisfied, having enough). Quotes Joshua 1:5 and Deuteronomy 31:6,8: ''I will never leave thee, nor forsake thee'' (ou mē se anō oud ou mē se enkatalipō — the Greek uses an emphatic double negative: I will absolutely never, no never abandon you). Five negatives in the Greek intensify the promise: God will under no circumstances whatsoever forsake His people.',
   'The antidote to covetousness is not willpower but the promise of God''s presence. If God Himself will never leave or forsake us, then material security becomes secondary. The promise originally given to Joshua for the conquest of Canaan is here applied to every believer in every circumstance. God''s faithfulness replaces financial anxiety.'),
  (6, 'So that we may boldly say, The Lord is my helper, and I will not fear what man shall do unto me.',
   'ὥστε θαρροῦντας ἡμᾶς λέγειν Κύριος ἐμοὶ βοηθός καὶ οὐ φοβηθήσομαι τί ποιήσει μοι ἄνθρωπος',
   'hōste tharrountas hēmas legein kyrios emoi boēthos kai ou phobēthēsomai ti poiēsei moi anthrōpos',
   'Quotes Psalm 118:6 (LXX 117:6). ''Boldly say'' (tharrountas legein — to say with confidence, courage). ''The Lord is my helper'' (kyrios emoi boēthos — the Lord is for me a helper). ''I will not fear'' (ou phobēthēsomai — I shall not be afraid). ''What man shall do unto me'' (ti poiēsei moi anthrōpos — what shall a human do to me?). The divine promise of v.5 produces the human confession of v.6: because God will never leave, we need never fear human hostility. This addresses the persecution pressure the readers face.',
   NULL),
  (7, 'Remember them which have the rule over you, who have spoken unto you the word of God: whose faith follow, considering the end of their conversation.',
   'μνημονεύετε τῶν ἡγουμένων ὑμῶν οἵτινες ἐλάλησαν ὑμῖν τὸν λόγον τοῦ θεοῦ ὧν ἀναθεωροῦντες τὴν ἔκβασιν τῆς ἀναστροφῆς μιμεῖσθε τὴν πίστιν',
   'mnēmoneuete tōn hēgoumenōn hymōn hoitines elalēsan hymin ton logon tou theou hōn anatheōrountes tēn ekbasin tēs anastrophēs mimeisthe tēn pistin',
   '''Remember'' (mnēmoneuete — keep in memory, be mindful of). ''Them which have the rule over you'' (tōn hēgoumenōn hymōn — your leaders, guides; from hēgeomai = to lead, guide). These appear to be former leaders who have died (''considering the end of their conversation'' = ekbasin tēs anastrophēs = the outcome of their way of life). ''Whose faith follow'' (mimeisthe tēn pistin — imitate their faith). The chapter 11 cloud of witnesses now includes the community''s own departed leaders.',
   NULL),
  (8, 'Jesus Christ the same yesterday, and to day, and for ever.',
   'Ἰησοῦς Χριστὸς χθὲς καὶ σήμερον ὁ αὐτὸς καὶ εἰς τοὺς αἰῶνας',
   'Iēsous Christos chthes kai sēmeron ho autos kai eis tous aiōnas',
   'One of the most quoted verses in all of Scripture. ''Yesterday'' (chthes — in the past, referring to the era of the departed leaders of v.7). ''To day'' (sēmeron — now, in the present). ''For ever'' (eis tous aiōnas — unto the ages, into eternity). ''The same'' (ho autos — the identical one, unchanged). Christ''s immutability is the foundation of doctrinal stability: because He does not change, the faith does not change; therefore ''strange doctrines'' (v.9) must be rejected. This verse connects backward to 1:10-12 (''thou art the same'') and anchors the entire Christology of Hebrews.',
   'The immutability of Christ is a central doctrine of Hebrews. In 1:10-12, the Son is contrasted with creation: ''they shall be changed: but thou art the same.'' Here the same truth is stated with stunning simplicity. The Christ who was preached by the first leaders (v.7) is the same Christ today and will be the same forever. This rules out any doctrinal innovation: the gospel does not evolve, because Christ does not change. New teachings must be measured against the unchanging Person of Christ.'),
  (9, 'Be not carried about with divers and strange doctrines. For it is a good thing that the heart be established with grace; not with meats, which have not profited them that have been occupied therein.',
   'διδαχαῖς ποικίλαις καὶ ξέναις μὴ παραφέρεσθε καλὸν γὰρ χάριτι βεβαιοῦσθαι τὴν καρδίαν οὐ βρώμασιν ἐν οἷς οὐκ ὠφελήθησαν οἱ περιπατήσαντες',
   'didachais poikilais kai xenais mē parapheresthe kalon gar chariti bebaiousthai tēn kardian ou brōmasin en hois ouk ōphelēthēsan hoi peripatēsantes',
   '''Divers and strange'' (poikilais kai xenais — various and foreign, of many kinds and alien). ''Be not carried about'' (mē parapheresthe — do not be swept away, carried off course; a nautical metaphor = drifting, cf. 2:1). ''Established with grace'' (chariti bebaiousthai — stabilized, made firm by grace). ''Not with meats'' (ou brōmasin — not by food regulations). The reference to ''meats'' points to Jewish food laws and ceremonial meals — the readers are tempted to return to these observances. But ceremonial religion never profited anyone; only grace establishes the heart.',
   NULL),
  (10, 'We have an altar, whereof they have no right to eat which serve the tabernacle.',
   'ἔχομεν θυσιαστήριον ἐξ οὗ φαγεῖν οὐκ ἔχουσιν ἐξουσίαν οἱ τῇ σκηνῇ λατρεύοντες',
   'echomen thysiastērion ex hou phagein ouk echousin exousian hoi tē skēnē latreuontes',
   '''We have an altar'' (echomen thysiastērion — Christians possess an altar). ''Whereof they have no right to eat'' (ex hou phagein ouk echousin exousian — from which those who serve the tabernacle have no authority to eat). The ''altar'' is Christ''s cross and its benefits. The ''tabernacle servants'' are those who continue in the Levitical system. Those who cling to the old covenant have no access to the benefits of the new. The imagery draws from the Day of Atonement: the priests could not eat the sin offering whose blood was taken inside the Holy of Holies (Lev 16:27) — it was burned ''outside the camp'' (vv.11-12).',
   NULL),
  (11, 'For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp.',
   'ὧν γὰρ εἰσφέρεται ζῴων τὸ αἷμα περὶ ἁμαρτίας εἰς τὰ ἅγια διὰ τοῦ ἀρχιερέως τούτων τὰ σώματα κατακαίεται ἔξω τῆς παρεμβολῆς',
   'hōn gar eispheretai zōōn to haima peri hamartias eis ta hagia dia tou archiereōs toutōn ta sōmata katakaietal exō tēs parembolēs',
   'References Leviticus 16:27. On the Day of Atonement, the blood of the sin offering was brought ''into the sanctuary'' (eis ta hagia — into the Holy of Holies) by the high priest, but the carcasses were ''burned without the camp'' (katakaietal exō tēs parembolēs — burned outside the Israelite camp). The typological connection: Jesus'' blood was taken into the heavenly sanctuary (ch.9), and His body suffered ''outside the gate'' of Jerusalem (v.12). The pattern is fulfilled.',
   NULL),
  (12, 'Wherefore Jesus also, that he might sanctify the people with his own blood, suffered without the gate.',
   'διὸ καὶ Ἰησοῦς ἵνα ἁγιάσῃ διὰ τοῦ ἰδίου αἵματος τὸν λαὸν ἔξω τῆς πύλης ἔπαθεν',
   'dio kai Iēsous hina hagiasē dia tou idiou haimatos ton laon exō tēs pylēs epathen',
   '''Wherefore'' (dio — for this reason, connecting to the Day of Atonement typology). ''That he might sanctify'' (hina hagiasē — in order to set apart, consecrate). ''With his own blood'' (dia tou idiou haimatos — through His own blood, not animal blood). ''Suffered without the gate'' (exō tēs pylēs epathen — suffered outside the city gate of Jerusalem). Jesus was crucified outside Jerusalem''s walls at Golgotha, fulfilling the type of the sin offering burned outside the camp. The place of shame becomes the place of sanctification.',
   'Jesus fulfilled the Day of Atonement in both aspects: His blood entered the heavenly Holy of Holies (9:12), and His body suffered outside the camp/gate (13:12). The crucifixion''s location outside Jerusalem was not incidental but typologically necessary. By going ''outside'' — outside the holy city, outside the religious system, outside the camp of Israel — Jesus opened the way for a new covenant that transcends all earthly religious boundaries.'),
  (13, 'Let us go forth therefore unto him without the camp, bearing his reproach.',
   'τοίνυν ἐξερχώμεθα πρὸς αὐτὸν ἔξω τῆς παρεμβολῆς τὸν ὀνειδισμὸν αὐτοῦ φέροντες',
   'toinyn exerchōmetha pros auton exō tēs parembolēs ton oneidismon autou pherontes',
   '''Let us go forth'' (exerchōmetha — let us go out, let us leave; present subjunctive = a continuous, decisive departure). ''Unto him'' (pros auton — toward Him, to be with Him). ''Without the camp'' (exō tēs parembolēs — outside the camp of Israel, outside the old covenant system). ''Bearing his reproach'' (ton oneidismon autou pherontes — carrying His disgrace). This is the epistle''s climactic call to action: leave the security of the old religious system and join Christ in the place of shame and rejection. For the original readers, this meant a final break with the synagogue and temple.',
   'This verse is the practical application of the entire epistle. The ''camp'' represents the old covenant religious system — the temple, the priesthood, the sacrifices, the Jewish community. To follow Christ means to leave this camp and bear the social stigma of being identified with a crucified Messiah. The call is costly: it means losing religious respectability, family ties, social standing. But the destination is ''unto him'' — Christ Himself is the reward for leaving the camp.'),
  (14, 'For here have we no continuing city, but we seek one to come.',
   'οὐ γὰρ ἔχομεν ὧδε μένουσαν πόλιν ἀλλὰ τὴν μέλλουσαν ἐπιζητοῦμεν',
   'ou gar echomen hōde menousan polin alla tēn mellousan epizētoumen',
   '''No continuing city'' (ou menousan polin — no abiding city, no permanent dwelling). ''Here'' (hōde — in this present world, in this earthly existence). ''We seek one to come'' (tēn mellousan epizētoumen — we eagerly search for the coming one, the future city). This echoes 11:10 (Abraham looked for the city with foundations), 11:16 (the heavenly country), and 12:22 (the heavenly Jerusalem). Jerusalem itself, the earthly ''holy city,'' was not permanent — it would be destroyed in AD 70. The believers'' true citizenship is in the city ''whose builder and maker is God.''',
   NULL),
  (15, 'By him therefore let us offer the sacrifice of praise to God continually, that is, the fruit of our lips giving thanks to his name.',
   'δι᾽ αὐτοῦ οὖν ἀναφέρωμεν θυσίαν αἰνέσεως διὰ παντὸς τῷ θεῷ τοῦτ᾽ ἔστιν καρπὸν χειλέων ὁμολογούντων τῷ ὀνόματι αὐτοῦ',
   'di autou oun anapherōmen thysian aineseōs dia pantos tō theō tout estin karpon cheileōn homologountōn tō onomati autou',
   '''By him'' (di autou — through Him, through Christ as our mediator). ''Let us offer'' (anapherōmen — let us carry up, bring as a sacrifice). ''The sacrifice of praise'' (thysian aineseōs — a thank-offering of praise; echoes Psalm 50:14,23, Hosea 14:2). ''Continually'' (dia pantos — through all time, unceasingly). ''The fruit of our lips'' (karpon cheileōn — the harvest produced by our lips; from Hosea 14:2 LXX). ''Giving thanks to his name'' (homologountōn tō onomati autou — confessing, acknowledging His name). The new covenant sacrifice is not animal blood on a stone altar but praise from redeemed lips through the mediator Christ.',
   'The sacrificial system of the old covenant is replaced not with nothing but with new sacrifices: the sacrifice of praise (v.15) and the sacrifice of sharing (v.16). These are the priestly offerings of the new covenant. Every believer is a priest (cf. 1 Pet 2:5,9; Rev 1:6) who offers spiritual sacrifices through the mediation of Christ. Worship is the first and highest sacrifice of the new covenant.'),
  (16, 'But to do good and to communicate forget not: for with such sacrifices God is well pleased.',
   'τῆς δὲ εὐποιΐας καὶ κοινωνίας μὴ ἐπιλανθάνεσθε τοιαύταις γὰρ θυσίαις εὐαρεστεῖται ὁ θεός',
   'tēs de eupoiias kai koinōnias mē epilanthanesthe toiautais gar thysiais euaresteitai ho theos',
   '''To do good'' (eupoiias — doing good, beneficence; from eu + poieō). ''To communicate'' (koinōnias — sharing, fellowship, generous distribution; the same word used for communion/partnership). ''Forget not'' (mē epilanthanesthe — do not neglect). ''With such sacrifices'' (toiautais thysiais — with sacrifices of this kind). ''God is well pleased'' (euaresteitai ho theos — God is delighted). The second new covenant sacrifice: practical generosity and sharing. Praise (v.15) and practical love (v.16) together constitute the complete offering of the new priesthood.',
   NULL),
  (17, 'Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief: for that is unprofitable for you.',
   'πείθεσθε τοῖς ἡγουμένοις ὑμῶν καὶ ὑπείκετε αὐτοὶ γὰρ ἀγρυπνοῦσιν ὑπὲρ τῶν ψυχῶν ὑμῶν ὡς λόγον ἀποδώσοντες ἵνα μετὰ χαρᾶς τοῦτο ποιῶσιν καὶ μὴ στενάζοντες ἀλυσιτελὲς γὰρ ὑμῖν τοῦτο',
   'peithesthe tois hēgoumenois hymōn kai hupeikete autoi gar agrypnousin hyper tōn psychōn hymōn hōs logon apodōsontes hina meta charas touto poiōsin kai mē stenazontes alusiteles gar hymin touto',
   '''Obey'' (peithesthe — be persuaded by, trust, follow; the middle voice suggests voluntary compliance through persuasion, not blind obedience). ''Submit'' (hupeikete — yield, give way). ''They watch for your souls'' (agrypnousin hyper tōn psychōn — they stay awake/lose sleep over your souls; agrypneō = to be sleepless, vigilant). ''Must give account'' (logon apodōsontes — they will render an account to God for their leadership). ''With joy, and not with grief'' (meta charas kai mē stenazontes — with joy, not with groaning). ''Unprofitable for you'' (alusiteles hymin — of no advantage to you, harmful). Leaders bear responsibility before God; the congregation should cooperate rather than make their task burdensome.',
   NULL),
  (18, 'Pray for us: for we trust we have a good conscience, in all things willing to live honestly.',
   'προσεύχεσθε περὶ ἡμῶν πεποίθαμεν γὰρ ὅτι καλὴν συνείδησιν ἔχομεν ἐν πᾶσιν καλῶς θέλοντες ἀναστρέφεσθαι',
   'proseuchesthe peri hēmōn pepoithamen gar hoti kalēn syneidēsin echomen en pasin kalōs thelontes anastrephesthai',
   '''Pray for us'' (proseuchesthe peri hēmōn — keep praying concerning us; the plural ''us'' may include co-workers). ''Good conscience'' (kalēn syneidēsin — a beautiful/noble conscience). ''Willing to live honestly'' (kalōs thelontes anastrephesthai — desiring to conduct ourselves rightly in all things). The author defends his integrity and asks for prayer support. The appeal for prayer reveals the author''s personal relationship with the readers.',
   NULL),
  (19, 'But I beseech you the rather to do this, that I may be restored to you the sooner.',
   'περισσοτέρως δὲ παρακαλῶ τοῦτο ποιῆσαι ἵνα τάχιον ἀποκατασταθῶ ὑμῖν',
   'perissoterōs de parakalō touto poiēsai hina tachion apokatastathō hymin',
   '''I beseech you the rather'' (perissoterōs parakalō — I urge you all the more earnestly). ''That I may be restored'' (hina apokatastathō — that I may be given back, returned to you). ''The sooner'' (tachion — more quickly). The author is separated from the readers — possibly by imprisonment or distance — and hopes that their prayers will hasten his return. This personal detail suggests a real historical situation and a genuine pastoral relationship.',
   NULL),
  (20, 'Now the God of peace, that brought again from the dead our Lord Jesus, that great shepherd of the sheep, through the blood of the everlasting covenant,',
   'ὁ δὲ θεὸς τῆς εἰρήνης ὁ ἀναγαγὼν ἐκ νεκρῶν τὸν ποιμένα τῶν προβάτων τὸν μέγαν ἐν αἵματι διαθήκης αἰωνίου τὸν κύριον ἡμῶν Ἰησοῦν',
   'ho de theos tēs eirēnēs ho anagagōn ek nekrōn ton poimena tōn probatōn ton megan en haimati diathēkēs aiōniou ton kyrion hēmōn Iēsoun',
   'The great benediction begins — one of the most magnificent sentences in the NT. ''The God of peace'' (ho theos tēs eirēnēs — the God who is the source of shalom/wholeness). ''Brought again from the dead'' (ho anagagōn ek nekrōn — the one who led up from among the dead; this is the only explicit mention of the resurrection in Hebrews). ''Our Lord Jesus'' — the full messianic title. ''That great shepherd of the sheep'' (ton poimena tōn probatōn ton megan — the great shepherd; echoes Isaiah 63:11, Ezekiel 34:23, John 10:11). ''Through the blood of the everlasting covenant'' (en haimati diathēkēs aiōniou — in/by the blood of the eternal covenant). The resurrection is linked to the covenant blood: God raised Jesus because His blood established an eternal, unbreakable covenant.',
   'This is the only explicit reference to the resurrection of Christ in Hebrews — remarkable for an epistle focused on Christ''s priestly work. The resurrection is presented as God''s vindication of the covenant blood: because Christ''s blood established an ''everlasting covenant'' (diathēkēs aiōniou — not merely ''new'' but eternal), death could not hold Him. The ''great shepherd'' title combines the royal (Ezekiel 34) and sacrificial (John 10:11,15) dimensions of Christ''s work: He is the shepherd who laid down His life for the sheep and was raised to tend them forever.'),
  (21, 'Make you perfect in every good work to do his will, working in you that which is wellpleasing in his sight, through Jesus Christ; to whom be glory for ever and ever. Amen.',
   'καταρτίσαι ὑμᾶς ἐν παντὶ ἔργῳ ἀγαθῷ εἰς τὸ ποιῆσαι τὸ θέλημα αὐτοῦ ποιῶν ἐν ὑμῖν τὸ εὐάρεστον ἐνώπιον αὐτοῦ διὰ Ἰησοῦ Χριστοῦ ᾧ ἡ δόξα εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'katartisai hymas en panti ergō agathō eis to poiēsai to thelēma autou poiōn en hymin to euareston enōpion autou dia Iēsou Christou hō hē doxa eis tous aiōnas tōn aiōnōn amēn',
   '''Make you perfect'' (katartisai hymas — equip you, mend you, put you in order; the same word used for mending nets in Matt 4:21). ''In every good work'' (en panti ergō agathō — in every good deed). ''To do his will'' (eis to poiēsai to thelēma autou — for the purpose of doing His will). ''Working in you'' (poiōn en hymin — producing, creating, accomplishing within you). ''That which is wellpleasing'' (to euareston — what is pleasing to God). ''Through Jesus Christ'' (dia Iēsou Christou — the mediatorial formula: all God''s work in us comes through Christ). The doxology: ''to whom be glory for ever and ever'' (eis tous aiōnas tōn aiōnōn — unto the ages of the ages). ''Amen'' — so be it.',
   'The benediction is simultaneously a prayer and a theological statement. God is both the initiator (''make you perfect'') and the sustainer (''working in you'') of sanctification. The believer''s good works are God''s work in them — divine enabling, not human achievement. Everything flows ''through Jesus Christ'' — the mediatorial principle that has governed the entire epistle. The doxology ascribes eternal glory to Christ, confirming His deity (cf. 1:8).'),
  (22, 'And I beseech you, brethren, suffer the word of exhortation: for I have written a letter unto you in few words.',
   'παρακαλῶ δὲ ὑμᾶς ἀδελφοί ἀνέχεσθε τοῦ λόγου τῆς παρακλήσεως καὶ γὰρ διὰ βραχέων ἐπέστειλα ὑμῖν',
   'parakalō de hymas adelphoi anechesthe tou logou tēs paraklēseōs kai gar dia bracheōn epesteila hymin',
   '''I beseech you'' (parakalō — I urge, I appeal). ''Suffer the word of exhortation'' (anechesthe tou logou tēs paraklēseōs — bear with/endure this word of encouragement/exhortation). ''Word of exhortation'' (logos tēs paraklēseōs) is a technical term for a synagogue sermon (cf. Acts 13:15). The author describes the entire epistle as a sermon — a ''word of exhortation.'' ''In few words'' (dia bracheōn — briefly). This is either genuine modesty or mild irony (Hebrews is 13 chapters!), but compared to the magnitude of the subjects treated, it is indeed brief.',
   NULL),
  (23, 'Know ye that our brother Timothy is set at liberty; with whom, if he come shortly, I will see you.',
   'γινώσκετε τὸν ἀδελφὸν ἡμῶν Τιμόθεον ἀπολελυμένον μεθ᾽ οὗ ἐὰν τάχιον ἔρχηται ὄψομαι ὑμᾶς',
   'ginōskete ton adelphon hēmōn Timotheon apolelumenon meth hou ean tachion erchētai opsomai hymas',
   '''Know ye'' (ginōskete — know, take note). ''Our brother Timothy'' (ton adelphon hēmōn Timotheon — Timothy, Paul''s well-known associate). ''Set at liberty'' (apolelumenon — released, set free; possibly from imprisonment). The mention of Timothy links the author to the Pauline circle, though it does not prove Pauline authorship. ''If he come shortly, I will see you'' — the author plans to visit the community with Timothy. This personal detail confirms the letter''s occasional nature.',
   NULL),
  (24, 'Salute all them that have the rule over you, and all the saints. They of Italy salute you.',
   'ἀσπάσασθε πάντας τοὺς ἡγουμένους ὑμῶν καὶ πάντας τοὺς ἁγίους ἀσπάζονται ὑμᾶς οἱ ἀπὸ τῆς Ἰταλίας',
   'aspasasthe pantas tous hēgoumenous hymōn kai pantas tous hagious aspazontai hymas hoi apo tēs Italias',
   '''Salute'' (aspasasthe — greet). ''All them that have the rule over you'' (pantas tous hēgoumenous hymōn — all your leaders; the third mention: vv.7, 17, 24). ''All the saints'' (pantas tous hagious — the entire holy community). ''They of Italy'' (hoi apo tēs Italias — those from Italy). This phrase is ambiguous: it could mean the author is writing from Italy (Italians sending greetings home), or to Italy (those who have left Italy sending greetings back). Either way, it connects the letter to an Italian context, possibly Rome.',
   NULL),
  (25, 'Grace be with you all. Amen.',
   'ἡ χάρις μετὰ πάντων ὑμῶν ἀμήν',
   'hē charis meta pantōn hymōn amēn',
   '''Grace'' (hē charis — the grace, divine favor). ''With you all'' (meta pantōn hymōn — with all of you, the entire community). ''Amen'' (amēn — so be it, truly; from Hebrew ''āmēn'' = firm, trustworthy). The closing is characteristically Pauline in style (cf. 2 Thess 3:18, Titus 3:15). After 13 chapters of high Christology, warning passages, and pastoral exhortation, the letter closes with the simplest possible prayer: grace for all. The epistle that began with God speaking through His Son (1:1-2) ends with the wish that God''s grace would rest on every reader.',
   'Grace (charis) has been a thread throughout Hebrews: the throne of grace (4:16), the Spirit of grace (10:29), established by grace (13:9). The final word is grace — the unmerited favor of God that makes everything in the epistle possible. Without grace, the warnings are terrifying; with grace, they are invitations to perseverance. The ''Amen'' seals the letter as the community''s own affirmation: so be it.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 13;

-- Step 3: Insert word studies (6 key Greek terms)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φιλαδελφία', 'philadelphia', 'G5360',
   'Brotherly love, sibling-affection — from philos (loving friend) + adelphos (brother). Love among members of the Christian family. In the ancient world, family loyalty was the strongest social bond; philadelphia extends this family-bond to the community of believers. It is not mere tolerance or friendliness but the deep affection of siblings who share the same Father (cf. Rom 12:10, 1 Thess 4:9, 1 Pet 1:22).', 1),
  ('φιλοξενία', 'philoxenia', 'G5381',
   'Hospitality, love of strangers — from philos (loving) + xenos (stranger, foreigner). The opposite of xenophobia. In the early church, traveling missionaries, persecuted believers, and displaced Christians depended on the hospitality of fellow believers. Hospitality was not a social nicety but a lifeline and a form of partnership in the gospel (cf. Rom 12:13, 1 Pet 4:9, 3 John 1:5-8).', 2),
  ('ἀναφέρω', 'anapherō', 'G399',
   'To carry up, to offer up, to bring as a sacrifice — from ana (up) + pherō (to carry, bear). Used in v.15 for offering the sacrifice of praise. In the LXX, it is the standard term for offering sacrifices on the altar (cf. Gen 22:2, 1 Pet 2:5). In Hebrews 13, the word completes the priestly theology of the epistle: believers now offer spiritual sacrifices — praise and good works — through the mediation of Christ.', 3),
  ('παρεμβολή', 'parembolē', 'G3925',
   'Camp, encampment, army barracks — from para (beside) + en (in) + ballō (to throw). Refers to the Israelite camp in the wilderness (vv.11,13). The sin offering was burned ''outside the camp'' (exō tēs parembolēs), and Jesus suffered ''outside the gate'' (exō tēs pylēs). ''Going outside the camp'' became the central metaphor for leaving the security of the old covenant system and identifying with the rejected Christ.', 4),
  ('αἰώνιος', 'aiōnios', 'G166',
   'Eternal, everlasting, age-long — from aiōn (age, era). Describes the covenant sealed by Christ''s blood in v.20: ''the blood of the everlasting covenant'' (diathēkēs aiōniou). Unlike the old covenant which was temporary and replaceable (8:13), the new covenant is eternal — it will never be superseded, never grow old, never be replaced. The eternal nature of the covenant guarantees the permanence of everything it accomplishes.', 5),
  ('καταρτίζω', 'katartizō', 'G2675',
   'To mend, restore, equip, make complete, put in order — from kata (down, according to) + artizō (to fit, to make ready). Used in v.21 for God''s perfecting work in believers. The word is used for mending fishing nets (Matt 4:21), setting broken bones (medical usage), and equipping an army. God''s sanctifying work is holistic: mending what is broken, equipping what is lacking, ordering what is disordered — all through Jesus Christ.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 13
AND v.verse_number = CASE ws.word_order
  WHEN 1 THEN 1
  WHEN 2 THEN 2
  WHEN 3 THEN 15
  WHEN 4 THEN 13
  WHEN 5 THEN 20
  WHEN 6 THEN 21
END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, r.reference, r.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 1, 'Romans 12:10'),
  (1, 2, '1 Thessalonians 4:9'),
  (1, 3, '1 Peter 1:22'),
  (2, 4, 'Genesis 18:1-8'),
  (2, 5, 'Genesis 19:1-3'),
  (2, 6, 'Romans 12:13'),
  (3, 7, 'Matthew 25:36'),
  (3, 8, 'Hebrews 10:32-34'),
  (4, 9, '1 Corinthians 6:9-10'),
  (4, 10, 'Ephesians 5:5'),
  (5, 11, 'Deuteronomy 31:6'),
  (5, 12, 'Joshua 1:5'),
  (5, 13, 'Matthew 6:25-34'),
  (5, 14, 'Philippians 4:11-12'),
  (6, 15, 'Psalm 118:6'),
  (6, 16, 'Romans 8:31'),
  (7, 17, 'Hebrews 11:1-40'),
  (7, 18, '1 Corinthians 11:1'),
  (8, 19, 'Hebrews 1:10-12'),
  (8, 20, 'Malachi 3:6'),
  (8, 21, 'James 1:17'),
  (9, 22, 'Ephesians 4:14'),
  (9, 23, 'Colossians 2:16'),
  (10, 24, '1 Corinthians 9:13'),
  (10, 25, '1 Corinthians 10:18'),
  (11, 26, 'Leviticus 16:27'),
  (12, 27, 'Hebrews 9:12'),
  (12, 28, 'John 19:17-20'),
  (13, 29, 'Hebrews 11:26'),
  (13, 30, 'Acts 5:41'),
  (14, 31, 'Hebrews 11:10'),
  (14, 32, 'Hebrews 11:16'),
  (14, 33, 'Hebrews 12:22'),
  (14, 34, 'Philippians 3:20'),
  (15, 35, 'Psalm 50:14'),
  (15, 36, 'Hosea 14:2'),
  (15, 37, '1 Peter 2:5'),
  (16, 38, 'Philippians 4:18'),
  (16, 39, 'James 2:15-16'),
  (17, 40, '1 Thessalonians 5:12-13'),
  (17, 41, 'Ezekiel 3:17'),
  (20, 42, 'Isaiah 63:11'),
  (20, 43, 'Ezekiel 34:23'),
  (20, 44, 'John 10:11'),
  (20, 45, 'Jeremiah 32:40'),
  (20, 46, 'Romans 15:33'),
  (21, 47, 'Philippians 2:13'),
  (21, 48, '2 Thessalonians 2:17'),
  (22, 49, 'Acts 13:15'),
  (23, 50, 'Acts 16:1'),
  (25, 51, 'Titus 3:15'),
  (25, 52, '2 Thessalonians 3:18')
) AS cr(verse_number, ref_order, reference)
WHERE b.name = 'Hebrews' AND c.chapter_number = 13
AND v.verse_number = r.verse_number;
