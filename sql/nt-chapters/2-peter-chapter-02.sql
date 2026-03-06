-- ═══════════════════════════════════════════════════
-- 2 PETER CHAPTER 2 — False Teachers and Divine Judgment
-- 22 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '2 Peter 2 is the most sustained denunciation of false teachers in the New Testament. Having established the certainty of Scripture in chapter 1, Peter now warns that false teachers will arise — just as false prophets arose in Israel (v.1). The chapter contains three historical precedents of divine judgment: the fallen angels (v.4), the flood (v.5), and Sodom and Gomorrah (v.6) — proving that God both judges the ungodly and rescues the righteous (Lot, vv.7-9). Peter then paints a devastating portrait of the false teachers: they are bold, self-willed, irrational, lustful, covetous, and deceptive (vv.10-16), comparing them to Balaam who loved the wages of unrighteousness. They promise liberty while being slaves of corruption (v.19). The chapter concludes with the chilling warning that those who return to sin after knowing Christ are worse than if they had never known Him (vv.20-22), illustrated by the proverbs of the dog returning to its vomit and the washed sow to the mire.',
  'The Character, Doom, and Danger of False Teachers',
  'ψευδοδιδάσκαλοι (pseudodidaskaloi)',
  'False teachers — those who teach what is untrue while claiming divine authority. From pseudēs (false) + didaskalos (teacher). They arise from within the church, not from outside it.',
  '["False Teachers Will Come (vv.1-3): False prophets among the people; false teachers among you; privily bring in damnable heresies; denying the Lord that bought them; many shall follow their pernicious ways; through covetousness make merchandise of you; their judgment lingereth not","Three Precedents of Judgment (vv.4-9): God spared not the angels; saved Noah the eighth person; turning Sodom and Gomorrah to ashes; delivered just Lot; the Lord knoweth how to deliver the godly and reserve the unjust","Portrait of the False Teachers (vv.10-16): Walk after the flesh in uncleanness; despise government; presumptuous; self-willed; speak evil of dignities; as natural brute beasts; spots and blemishes; eyes full of adultery; beguiling unstable souls; the way of Balaam who loved the wages of unrighteousness; the dumb ass rebuked the prophet","Empty Promises and Bondage (vv.17-19): Wells without water; clouds carried by a tempest; they speak great swelling words of vanity; they allure through lusts; while they promise liberty they are servants of corruption","The Danger of Apostasy (vv.20-22): If after escaping the pollutions of the world they are again entangled; the latter end is worse than the beginning; better not to have known the way of righteousness; the dog returns to his vomit; the sow to wallowing in the mire"]'
FROM books b WHERE b.name = '2 Peter';

-- Step 2: Insert all 22 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying the Lord that bought them, and bring upon themselves swift destruction.',
   'Ἐγένοντο δὲ καὶ ψευδοπροφῆται ἐν τῷ λαῷ ὡς καὶ ἐν ὑμῖν ἔσονται ψευδοδιδάσκαλοι οἵτινες παρεισάξουσιν αἱρέσεις ἀπωλείας καὶ τὸν ἀγοράσαντα αὐτοὺς δεσπότην ἀρνούμενοι ἐπάγοντες ἑαυτοῖς ταχινὴν ἀπώλειαν',
   'Egenonto de kai pseudoprophētai en tō laō hōs kai en hymin esontai pseudodidaskaloi hoitines pareisaxousin haireseis apōleias kai ton agorasanta autous despotēn arnoumenoi epagontes heautois tachinēn apōleian',
   '''False prophets'' (pseudoprophētai) were in Israel; ''false teachers'' (pseudodidaskaloi) will be in the church. The pattern repeats. ''Privily bring in'' (pareisaxousin — smuggle in alongside, introduce secretly; from para + eis + agō — lead in beside). ''Damnable heresies'' (haireseis apōleias — heresies of destruction, doctrines that lead to ruin; hairesis means a choosing, a faction, a sect). ''Denying the Lord that bought them'' (arnoumenoi ton agorasanta autous despotēn — rejecting the Master who purchased them). ''Bought'' (agorasanta — purchased, acquired in the marketplace). ''Swift destruction'' (tachinēn apōleian — rapid ruin). They bring destruction upon themselves.',
   'The Lord who ''bought them'': This verse raises the question of whether false teachers were ever genuinely saved. ''Bought'' (agorasanta) uses marketplace language for redemption. Some interpret this as genuine redemption subsequently rejected; others see it as a profession of faith that was never real (cf. the parable of the unmerciful servant, Matt 18:23-35). Either way, the warning is severe: denying the Master who purchased you leads to swift destruction.'),
  (2,
   'And many shall follow their pernicious ways; by reason of whom the way of truth shall be evil spoken of.',
   'καὶ πολλοὶ ἐξακολουθήσουσιν αὐτῶν ταῖς ἀσελγείαις δι᾽ οὓς ἡ ὁδὸς τῆς ἀληθείας βλασφημηθήσεται',
   'kai polloi exakolouthēsousin autōn tais aselgeiais di'' hous hē hodos tēs alētheias blasphēmēthēsetai',
   '''Many'' (polloi) — false teaching is popular, not marginal. ''Pernicious ways'' (aselgeiais — debaucheries, sensual excesses, brazen immoral behaviour). ''The way of truth'' (hē hodos tēs alētheias — the Christian path, the way of the gospel). ''Evil spoken of'' (blasphēmēthēsetai — blasphemed, slandered). When professing Christians live immorally, the gospel itself is discredited. The world judges Christ by His followers'' behaviour.',
   NULL),
  (3,
   'And through covetousness shall they with feigned words make merchandise of you: whose judgment now of a long time lingereth not, and their damnation slumbereth not.',
   'καὶ ἐν πλεονεξίᾳ πλαστοῖς λόγοις ὑμᾶς ἐμπορεύσονται οἷς τὸ κρίμα ἔκπαλαι οὐκ ἀργεῖ καὶ ἡ ἀπώλεια αὐτῶν οὐ νυστάζει',
   'kai en pleonexia plastois logois hymas emporeuontai hois to krima ekpalai ouk argei kai hē apōleia autōn ou nystazei',
   '''Covetousness'' (pleonexia — greed, the desire for more at others'' expense). ''Feigned words'' (plastois logois — moulded, fabricated, artificial words; from plassō, to mould like clay — our word ''plastic''). ''Make merchandise'' (emporeuontai — trade in, exploit commercially; from emporos, merchant — our word ''emporium''). False teachers treat the flock as a market. ''Lingereth not'' (ouk argei — is not idle, is not inactive; the judgment machine is already running). ''Slumbereth not'' (ou nystazei — does not drowse, does not nod off). God is awake even if judgment seems delayed.',
   NULL),
  (4,
   'For if God spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;',
   'εἰ γὰρ ὁ θεὸς ἀγγέλων ἁμαρτησάντων οὐκ ἐφείσατο ἀλλὰ σειραῖς ζόφου ταρταρώσας παρέδωκεν εἰς κρίσιν τηρουμένους',
   'ei gar ho theos angelōn hamartēsantōn ouk epheisato alla seirais zophou tartarōsas paredōken eis krisin tēroumenous',
   '''Spared not'' (ouk epheisato — did not spare, showed no leniency). ''Cast down to hell'' (tartarōsas — consigned to Tartarus; used only here in the NT. In Greek mythology, Tartarus was the deepest abyss below Hades. Peter borrows the term for the place of imprisoned fallen angels — cf. Jude 6). ''Chains of darkness'' (seirais zophou — chains/pits of deep gloom). ''Reserved unto judgment'' (eis krisin tēroumenous — kept for judgment, guarded until the final assize). First precedent: if God judged angels, He will judge false teachers.',
   NULL),
  (5,
   'And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;',
   'καὶ ἀρχαίου κόσμου οὐκ ἐφείσατο ἀλλ᾽ ὄγδοον Νῶε δικαιοσύνης κήρυκα ἐφύλαξεν κατακλυσμὸν κόσμῳ ἀσεβῶν ἐπάξας',
   'kai archaiou kosmou ouk epheisato all'' ogdoon Nōe dikaiosynēs kēryka ephylaxen kataklusmon kosmō asebōn epaxas',
   '''The old world'' (archaiou kosmou — the ancient world, the pre-flood civilization). ''Noah the eighth person'' (ogdoon Nōe — Noah as one of eight: Noah, his wife, three sons, and their wives; 1 Pet 3:20). ''Preacher of righteousness'' (dikaiosynēs kēryka — a herald who proclaimed righteousness). Noah warned his generation for 120 years while building the ark. ''The flood'' (kataklusmon — cataclysm, deluge; our word ''cataclysm''). Second precedent: God destroyed an entire world but preserved the righteous remnant.',
   NULL),
  (6,
   'And turning the cities of Sodom and Gomorrha into ashes condemned them with an overthrow, making them an ensample unto those that after should live ungodly;',
   'καὶ πόλεις Σοδόμων καὶ Γομόρρας τεφρώσας καταστροφῇ κατέκρινεν ὑπόδειγμα μελλόντων ἀσεβεῖν τεθεικώς',
   'kai poleis Sodomōn kai Gomorras tephrōsas katastrophē katekrinen hypodeigma mellontōn asebein tetheikōs',
   '''Turning into ashes'' (tephrōsas — reducing to ashes; from tephra, ashes; used only here in the NT). ''Overthrow'' (katastrophē — catastrophe, complete destruction; our word ''catastrophe''). ''Ensample'' (hypodeigma — example, model, warning pattern). ''Those that after should live ungodly'' (mellontōn asebein — those who are going to live ungodly in the future). Third precedent: Sodom''s destruction is a permanent warning display — an exhibit of what awaits the ungodly. The ruins preach across the centuries.',
   NULL),
  (7,
   'And delivered just Lot, vexed with the filthy conversation of the wicked:',
   'καὶ δίκαιον Λὼτ καταπονούμενον ὑπὸ τῆς τῶν ἀθέσμων ἐν ἀσελγείᾳ ἀναστροφῆς ἐρρύσατο',
   'kai dikaion Lōt kataponoumenon hypo tēs tōn athesmōn en aselgeia anastrophēs errysato',
   '''Just Lot'' (dikaion Lōt — righteous Lot). Genesis paints Lot in an unflattering light, yet Peter calls him ''righteous'' three times (vv.7-8). God''s assessment of His people is more generous than ours. ''Vexed'' (kataponoumenon — worn down, oppressed, distressed; present passive participle: continuously being ground down). ''Filthy conversation'' (en aselgeia anastrophēs — the conduct characterised by debauchery). ''Delivered'' (errysato — rescued, snatched out; the same verb used in Rom 11:26 for the Deliverer from Zion).',
   NULL),
  (8,
   '(For that righteous man dwelling among them, in seeing and hearing, vexed his righteous soul from day to day with their unlawful deeds;)',
   'βλέμματι γὰρ καὶ ἀκοῇ ὁ δίκαιος ἐγκατοικῶν ἐν αὐτοῖς ἡμέραν ἐξ ἡμέρας ψυχὴν δικαίαν ἀνόμοις ἔργοις ἐβασάνιζεν',
   'blemmati gar kai akoē ho dikaios enkatoikōn en autois hēmeran ex hēmeras psychēn dikaian anomois ergois ebasanizen',
   '''In seeing and hearing'' (blemmati kai akoē — by sight and by hearing). Lot could not escape the sensory assault of Sodom''s wickedness. ''Vexed'' (ebasanizen — tortured, tormented; from basanizō, to test by the touchstone, to torture). Lot''s righteous soul was under daily torture from what he saw and heard. This parenthetical verse explains how a righteous person can remain righteous in an ungodly environment: not by becoming numb but by being perpetually grieved.',
   NULL),
  (9,
   'The Lord knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished:',
   'οἶδεν κύριος εὐσεβεῖς ἐκ πειρασμοῦ ῥύεσθαι ἀδίκους δὲ εἰς ἡμέραν κρίσεως κολαζομένους τηρεῖν',
   'oiden kyrios eusebeis ek peirasmou rhyesthai adikous de eis hēmeran kriseōs kolazomenous tērein',
   'The conclusion drawn from all three examples: ''The Lord knoweth how'' (oiden kyrios — the Lord knows the way, has the ability and wisdom). Two parallel actions: (1) ''deliver the godly out of temptations'' (eusebeis ek peirasmou rhyesthai — rescue the reverent from trial) and (2) ''reserve the unjust unto the day of judgment'' (adikous eis hēmeran kriseōs tērein — keep the unrighteous under guard for the day of reckoning). ''To be punished'' (kolazomenous — being punished; present participle: they are already under punishment while being held for final judgment). God rescues and God judges — simultaneously.',
   'Divine preservation and judgment: This verse is the theological centre of the chapter. God''s competence operates in two directions: rescuing the godly and reserving the ungodly. He did both in the flood (saving Noah while destroying the world) and in Sodom (delivering Lot while incinerating the cities). This dual action will characterise the end times as well.'),
  (10,
   'But chiefly them that walk after the flesh in the lust of uncleanness, and despise government. Presumptuous are they, selfwilled, they are not afraid to speak evil of dignities.',
   'μάλιστα δὲ τοὺς ὀπίσω σαρκὸς ἐν ἐπιθυμίᾳ μιασμοῦ πορευομένους καὶ κυριότητος καταφρονοῦντας τολμηταί αὐθάδεις δόξας οὐ τρέμουσιν βλασφημοῦντες',
   'malista de tous opisō sarkos en epithymia miasmou poreuomenous kai kyriotētos kataphronountas tolmētai authadeis doxas ou tremousin blasphēmountes',
   '''Chiefly'' (malista — especially, above all). Two characteristics: (1) ''walk after the flesh in the lust of uncleanness'' (sensual indulgence — following the flesh''s defilements), (2) ''despise government'' (kyriotētos kataphronountas — despise lordship/authority; kyriotēs can mean divine or angelic authority). ''Presumptuous'' (tolmētai — daring, audacious; from tolmaō, to dare). ''Selfwilled'' (authadeis — arrogant, self-pleasing; from autos + hēdomai, self-gratifying). ''Speak evil of dignities'' (doxas blasphēmountes — blaspheme glories/glorious ones). They insult what they don''t understand.',
   NULL),
  (11,
   'Whereas angels, which are greater in power and might, bring not railing accusation against them before the Lord.',
   'ὅπου ἄγγελοι ἰσχύϊ καὶ δυνάμει μείζονες ὄντες οὐ φέρουσιν κατ᾽ αὐτῶν παρὰ κυρίῳ βλάσφημον κρίσιν',
   'hopou angeloi ischyi kai dynamei meizones ontes ou pherousin kat'' autōn para kyriō blasphēmon krisin',
   'The argument from the greater to the lesser: even angels, who far surpass these false teachers in ''power and might'' (ischyi kai dynamei — strength and capability), do not presume to bring ''railing accusation'' (blasphēmon krisin — a slanderous judgment) against them before the Lord. If mighty angels exercise such restraint, how much more should mere humans. Cf. Jude 9, where Michael the archangel disputes with the devil over Moses'' body but does not bring a railing accusation, instead saying ''the Lord rebuke thee.''',
   NULL),
  (12,
   'But these, as natural brute beasts, made to be taken and destroyed, speak evil of the things that they understand not; and shall utterly perish in their own corruption;',
   'οὗτοι δέ ὡς ἄλογα ζῷα γεγεννημένα φυσικὰ εἰς ἅλωσιν καὶ φθοράν ἐν οἷς ἀγνοοῦσιν βλασφημοῦντες ἐν τῇ φθορᾷ αὐτῶν καὶ φθαρήσονται',
   'houtoi de hōs aloga zōa gegennēmena physika eis halōsin kai phthoran en hois agnoousin blasphēmountes en tē phthora autōn kai phtharēsontai',
   '''Natural brute beasts'' (aloga zōa — irrational animals, creatures without reason; from a-logos, without the word/reason). ''Made to be taken and destroyed'' (gegennēmena physika eis halōsin kai phthoran — born by nature for capture and destruction). ''Speak evil of the things they understand not'' (en hois agnoousin blasphēmountes — they blaspheme in matters of which they are ignorant). ''Utterly perish in their own corruption'' (en tē phthora autōn phtharēsontai — in their corruption they will be corrupted; the word phthora appears three times — corruption begets corruption begets destruction).',
   NULL),
  (13,
   'And shall receive the reward of unrighteousness, as they that count it pleasure to riot in the day time. Spots they are and blemishes, sporting themselves with their own deceivings while they feast with you;',
   'ἀδικούμενοι μισθὸν ἀδικίας ἡδονὴν ἡγούμενοι τὴν ἐν ἡμέρᾳ τρυφήν σπῖλοι καὶ μῶμοι ἐντρυφῶντες ἐν ταῖς ἀπάταις αὐτῶν συνευωχούμενοι ὑμῖν',
   'adikoumenoi misthon adikias hēdonēn hēgoumenoi tēn en hēmera tryphēn spiloi kai mōmoi entryphōntes en tais apatais autōn syneuōchoumenoi hymin',
   '''Reward of unrighteousness'' (misthon adikias — wages of injustice; they will be paid exactly what they earned). ''Pleasure to riot in the day time'' (hēdonēn tēn en hēmera tryphēn — they consider daytime carousing a delight; revelling not even under cover of darkness but brazenly in broad daylight). ''Spots and blemishes'' (spiloi kai mōmoi — stains and defects; the opposite of Christ''s church which is to be ''without spot or blemish,'' Eph 5:27). ''Feast with you'' (syneuōchoumenoi hymin — banqueting together with you; they infiltrate the love feasts of the church).',
   NULL),
  (14,
   'Having eyes full of adultery, and that cannot cease from sin; beguiling unstable souls: an heart they have exercised with covetous practices; cursed children:',
   'ὀφθαλμοὺς ἔχοντες μεστοὺς μοιχαλίδος καὶ ἀκαταπαύστους ἁμαρτίας δελεάζοντες ψυχὰς ἀστηρίκτους καρδίαν γεγυμνασμένην πλεονεξίας ἔχοντες κατάρας τέκνα',
   'ophthalmous echontes mestous moichalidos kai akatapastous hamartias deleazontes psychas astēriktous kardian gegymnasmēnēn pleonexias echontes kataras tekna',
   '''Eyes full of adultery'' (ophthalmous mestous moichalidos — eyes filled with an adulteress; literally, they see every woman as a potential conquest). ''Cannot cease from sin'' (akatapastous hamartias — unable to stop sinning; sin is compulsive, habitual, enslaving). ''Beguiling'' (deleazontes — luring, enticing with bait; a fishing metaphor — they bait the hook for unstable souls). ''Unstable'' (astēriktous — unestablished, not firmly grounded). ''Exercised'' (gegymnasmēnēn — trained, disciplined; from gymnazō — our word ''gymnasium'': their hearts have been trained in greed like athletes train for competition). ''Cursed children'' (kataras tekna — children of a curse).',
   NULL),
  (15,
   'Which have forsaken the right way, and are gone astray, following the way of Balaam the son of Bosor, who loved the wages of unrighteousness;',
   'καταλιπόντες τὴν εὐθεῖαν ὁδὸν ἐπλανήθησαν ἐξακολουθήσαντες τῇ ὁδῷ τοῦ Βαλαὰμ τοῦ Βοσὸρ ὃς μισθὸν ἀδικίας ἠγάπησεν',
   'katalipontes tēn eutheian hodon eplanēthēsan exakolouthēsantes tē hodō tou Balaam tou Bosor hos misthon adikias ēgapēsen',
   '''Forsaken the right way'' (katalipontes tēn eutheian hodon — having left behind the straight road). ''Gone astray'' (eplanēthēsan — wandered, were deceived; our word ''planet'' comes from this root — a wandering star). ''Balaam'' (Balaam son of Beor, Num 22-24) — the paradigm of the prophet who prophesies for profit. ''Loved the wages of unrighteousness'' (misthon adikias ēgapēsen — loved the pay that came from doing wrong). Balaam''s sin: using the gift of God as a money-making scheme. The false teachers repeat his error.',
   NULL),
  (16,
   'But was rebuked for his iniquity: the dumb ass speaking with man''s voice forbad the madness of the prophet.',
   'ἔλεγξιν δὲ ἔσχεν ἰδίας παρανομίας ὑποζύγιον ἄφωνον ἐν ἀνθρώπου φωνῇ φθεγξάμενον ἐκώλυσεν τὴν τοῦ προφήτου παραφρονίαν',
   'elenxin de eschen idias paranomias hypozygion aphōnon en anthrōpou phōnē phthenkamenon ekōlysen tēn tou prophētou paraphronian',
   '''Rebuked'' (elenxin — reproof, correction; from elegchō, to convict). ''Dumb ass'' (hypozygion aphōnon — a voiceless beast of burden; literally ''under-yoke animal''). ''Speaking with man''s voice'' (en anthrōpou phōnē phthenkamenon — producing sound in a human voice). ''Madness'' (paraphronian — insanity, beside-mindedness; from para + phrēn, beside the mind). The irony is devastating: a prophet so spiritually blind that a donkey had to correct him. When a speechless animal has more sense than a prophet, the prophet is truly mad.',
   NULL),
  (17,
   'These are wells without water, clouds that are carried with a tempest; to whom the mist of darkness is reserved for ever.',
   'οὗτοί εἰσιν πηγαὶ ἄνυδροι νεφέλαι ὑπὸ λαίλαπος ἐλαυνόμεναι οἷς ὁ ζόφος τοῦ σκότους εἰς αἰῶνα τετήρηται',
   'houtoi eisin pēgai anydroi nephelai hypo lailapos elaunomenai hois ho zophos tou skotous eis aiōna tetērētai',
   '''Wells without water'' (pēgai anydroi — springs that promise water but deliver nothing. In the arid Middle East, a waterless spring is the ultimate disappointment and potentially deadly). ''Clouds carried with a tempest'' (nephelai hypo lailapos elaunomenai — clouds driven by a storm, promising rain but blown away before delivering it). ''The mist of darkness'' (ho zophos tou skotous — the gloom of darkness, the blackest darkness). ''Reserved for ever'' (eis aiōna tetērētai — kept for eternity; perfect tense: already reserved and awaiting them). Two images of disappointed expectation, then one of certain judgment.',
   NULL),
  (18,
   'For when they speak great swelling words of vanity, they allure through the lusts of the flesh, through much wantonness, those that were clean escaped from them who live in error.',
   'ὑπέρογκα γὰρ ματαιότητος φθεγγόμενοι δελεάζουσιν ἐν ἐπιθυμίαις σαρκὸς ἀσελγείαις τοὺς ὀλίγως ἀποφεύγοντας τοὺς ἐν πλάνῃ ἀναστρεφομένους',
   'hyperonka gar mataiotētos phthengomenoi deleazousin en epithymiais sarkos aselgeiais tous oligōs apopheugontas tous en planē anastrephomenous',
   '''Great swelling words'' (hyperonka — overblown, inflated, puffed-up words; from hyper + onkos, excessive bulk — big words with no substance). ''Vanity'' (mataiotētos — emptiness, futility). ''Allure'' (deleazousin — lure with bait, entice; same fishing verb as v.14). Their targets: ''those that were clean escaped'' (oligōs apopheugontas — those who are barely escaping, just beginning to flee from the pagan world). The most vulnerable prey: new converts who have not yet been established in the faith.',
   NULL),
  (19,
   'While they promise them liberty, they themselves are the servants of corruption: for of whom a man is overcome, of the same is he brought in bondage.',
   'ἐλευθερίαν αὐτοῖς ἐπαγγελλόμενοι αὐτοὶ δοῦλοι ὑπάρχοντες τῆς φθορᾶς ᾧ γάρ τις ἥττηται τούτῳ δεδούλωται',
   'eleutherian autois epangellomenoi autoi douloi hyparchontes tēs phthoras hō gar tis hēttētai toutō dedoulōtai',
   '''Promise liberty'' (eleutherian epangellomenoi — promising freedom; the false teachers preach liberation from moral constraints). ''Servants of corruption'' (douloi tēs phthoras — slaves of decay/moral ruin). The bitter irony: the freedom-proclaimers are themselves enslaved. ''Overcome'' (hēttētai — defeated, conquered). ''Brought in bondage'' (dedoulōtai — has been enslaved; perfect tense: permanently enslaved). The universal principle: whatever conquers you becomes your master. The man who claims freedom while enslaved to sin is the most pitiable of all.',
   NULL),
  (20,
   'For if after they have escaped the pollutions of the world through the knowledge of the Lord and Saviour Jesus Christ, they are again entangled therein, and overcome, the latter end is worse with them than the beginning.',
   'εἰ γὰρ ἀποφυγόντες τὰ μιάσματα τοῦ κόσμου ἐν ἐπιγνώσει τοῦ κυρίου καὶ σωτῆρος Ἰησοῦ Χριστοῦ τούτοις δὲ πάλιν ἐμπλακέντες ἡττῶνται γέγονεν αὐτοῖς τὰ ἔσχατα χείρονα τῶν πρώτων',
   'ei gar apophygontes ta miasmata tou kosmou en epignōsei tou kyriou kai sōtēros Iēsou Christou toutois de palin emplakentes hēttōntai gegonen autois ta eschata cheirona tōn prōtōn',
   '''Escaped the pollutions'' (apophygontes ta miasmata — having fled the defilements; the same verb as 1:4 for escaping the world''s corruption). ''Through the knowledge'' (en epignōsei — through the full knowledge; the same epignōsis of 1:2,3,8). ''Entangled'' (emplakentes — entwined, enmeshed; from emplekō, to weave in, to braid into; a net image). ''The latter end is worse than the beginning'' (ta eschata cheirona tōn prōtōn — the last things are worse than the first). Knowledge of Christ that does not lead to lasting transformation leaves a person worse off than before, because the conscience is seared and the light rejected.',
   'Apostasy and its consequences: This is one of the NT''s sternest warnings. The question it raises: were these people genuinely saved? If ''the knowledge of the Lord'' (epignōsis) refers to saving knowledge, then this warns of genuine apostasy. If it refers to mere intellectual knowledge, then these were never truly born again. Either way, the practical warning stands: returning to sin after knowing Christ brings worse judgment than never having heard.'),
  (21,
   'For it had been better for them not to have known the way of righteousness, than, after they have known it, to turn from the holy commandment delivered unto them.',
   'κρεῖττον γὰρ ἦν αὐτοῖς μὴ ἐπεγνωκέναι τὴν ὁδὸν τῆς δικαιοσύνης ἢ ἐπιγνοῦσιν ὑποστρέψαι ἐκ τῆς παραδοθείσης αὐτοῖς ἁγίας ἐντολῆς',
   'kreitton gar ēn autois mē epegnōkenai tēn hodon tēs dikaiosynēs ē epignousin hypostrepsai ek tēs paradotheisēs autois hagias entolēs',
   '''Better for them not to have known'' (kreitton mē epegnōkenai — it would have been better never to have come to know). ''The way of righteousness'' (tēn hodon tēs dikaiosynēs — the path of right standing with God, the Christian way). ''Turn from'' (hypostrepsai — turn back from, retreat from). ''The holy commandment delivered unto them'' (tēs paradotheisēs autois hagias entolēs — the sacred command handed over to them; the apostolic teaching received by tradition). Greater knowledge brings greater responsibility. To know the truth and turn from it is worse than never having known it.',
   NULL),
  (22,
   'But it is happened unto them according to the true proverb, The dog is turned to his own vomit again; and the sow that was washed to her wallowing in the mire.',
   'συμβέβηκεν αὐτοῖς τὸ τῆς ἀληθοῦς παροιμίας Κύων ἐπιστρέψας ἐπὶ τὸ ἴδιον ἐξέραμα καί Ὗς λουσαμένη εἰς κυλισμὸν βορβόρου',
   'symbebēken autois to tēs alēthous paroimias Kyōn epistrepsas epi to idion exerama kai Hys lousamenē eis kulismon borborou',
   'Two proverbs, devastatingly applied: (1) ''The dog returns to his own vomit'' (from Prov 26:11) — the dog expelled something foul but goes back to consume it. (2) ''The washed sow returns to wallowing in the mire'' (not from the OT but a common ancient proverb) — the pig was cleaned externally but its nature was unchanged; it returns to the mud because it is still a pig. The theological point: external reformation without internal transformation is futile. The dog is still a dog; the sow is still a sow. Only a new nature (1:4) produces lasting change.',
   'Nature determines behaviour: The proverbs illustrate that external change without internal transformation is temporary. The dog and sow act according to their nature. This raises the question: did the false teachers ever receive the ''divine nature'' (1:4)? If they had, they would not return to the mire. Their return reveals that their nature was never changed — they were cleaned on the outside but remained unrenewed within.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Peter' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 1 (False teachers / damnable heresies)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ψευδοδιδάσκαλοι', 'pseudodidaskaloi', 'G5572', 'False teachers — from pseudēs (false, lying) + didaskalos (teacher). Those who teach error while claiming divine authority. Used only here in the NT. They arise from within the church.', 1),
  ('αἱρέσεις', 'haireseis', 'G139', 'Heresies, factions, sects — from haireō (to choose). A self-chosen opinion at odds with revealed truth. Heresy is choosing one''s own doctrine over God''s. Here qualified by apōleias (of destruction).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 2 AND v.verse_number = 1;

-- Verse 4 (Cast down to hell)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ταρταρώσας', 'tartarōsas', 'G5020', 'Cast down to Tartarus — used only here in the entire Bible. In Greek cosmology, Tartarus was the deepest abyss below Hades. Peter borrows the term to describe the prison of fallen angels.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 9 (The Lord knows how to deliver)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ῥύεσθαι', 'rhyesthai', 'G4506', 'To deliver, rescue, snatch from danger — the same verb used for Christ delivering us from wrath (1 Thess 1:10). God actively rescues His people out of trials, not merely through them.', 1),
  ('κολαζομένους', 'kolazomenous', 'G2849', 'Being punished, under punishment — present participle: the unjust are already experiencing punishment while being kept for the final day. Judgment begins before the verdict.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 2 AND v.verse_number = 9;

-- Verse 14 (Eyes full of adultery / beguiling)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δελεάζοντες', 'deleazontes', 'G1185', 'Beguiling, luring with bait, enticing — a fishing metaphor. The false teachers bait the hook with promises of freedom and pleasure to catch unstable souls.', 1),
  ('γεγυμνασμένην', 'gegymnasmēnēn', 'G1128', 'Exercised, trained, disciplined — from gymnazō (to exercise naked, to train). Their hearts are trained in greed like athletes are trained in their sport. Covetousness is their workout regimen.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 2 AND v.verse_number = 14;

-- Verse 19 (Promise liberty / servants of corruption)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλευθερίαν', 'eleutherian', 'G1657', 'Liberty, freedom — the false teachers promise emancipation from moral law. But true freedom is freedom from sin (John 8:36), not freedom to sin.', 1),
  ('ἥττηται', 'hēttētai', 'G2274', 'Is overcome, is defeated, is conquered — perfect passive: has been defeated and remains in that defeated state. Whatever conquers you owns you. Sin''s victory is slavery.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 2 AND v.verse_number = 19;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: False teachers
  (1, 'Jude 1:4', 1), (1, 'Matthew 7:15', 2), (1, '1 John 2:18-19', 3),
  -- v4: Angels that sinned
  (4, 'Jude 1:6', 1), (4, 'Genesis 6:1-4', 2), (4, 'Revelation 20:10', 3),
  -- v5: Noah / the flood
  (5, 'Genesis 6:5-8', 1), (5, '1 Peter 3:20', 2), (5, 'Hebrews 11:7', 3),
  -- v6: Sodom and Gomorrah
  (6, 'Genesis 19:24-25', 1), (6, 'Jude 1:7', 2), (6, 'Luke 17:29-30', 3),
  -- v7-8: Lot delivered
  (7, 'Genesis 19:1-16', 1), (7, 'Genesis 19:29', 2),
  -- v9: God delivers the godly
  (9, '1 Corinthians 10:13', 1), (9, 'Psalm 34:19', 2), (9, '2 Timothy 4:18', 3),
  -- v12: Natural brute beasts
  (12, 'Jude 1:10', 1), (12, 'Philippians 3:19', 2),
  -- v15: Way of Balaam
  (15, 'Numbers 22:5-7', 1), (15, 'Jude 1:11', 2), (15, 'Revelation 2:14', 3),
  -- v17: Wells without water
  (17, 'Jude 1:12-13', 1), (17, 'Jeremiah 2:13', 2),
  -- v19: Promise liberty
  (19, 'John 8:34-36', 1), (19, 'Romans 6:16-18', 2), (19, 'Galatians 5:1,13', 3),
  -- v20: Latter end worse
  (20, 'Matthew 12:45', 1), (20, 'Hebrews 6:4-6', 2), (20, 'Hebrews 10:26-29', 3),
  -- v22: Dog and sow
  (22, 'Proverbs 26:11', 1), (22, 'Matthew 7:6', 2)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Peter' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Peter Chapter 2 Complete
-- 22 verses · 5 key verses with word studies (11 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════