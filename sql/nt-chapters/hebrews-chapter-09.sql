-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 9 — The Blood of Christ and the Heavenly Sanctuary
-- 28 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'Hebrews 9 is the sacrificial heart of the epistle, contrasting the old covenant tabernacle worship with Christ''s once-for-all offering. The chapter opens by describing the earthly tabernacle: the Holy Place with its lampstand, table, and showbread (vv.1-2), and the Most Holy Place (Holy of Holies) behind the second veil, containing the golden censer/altar, the ark of the covenant with its golden pot of manna, Aaron''s rod, the tablets of the covenant, and the cherubim of glory overshadowing the mercy seat (vv.3-5). Under this system, only the high priest entered the Holy of Holies ''once every year, not without blood'' (v.7). ''The Holy Ghost this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing'' (v.8). The old system was ''a figure for the time then present'' but could not ''make him that did the service perfect, as pertaining to the conscience'' (v.9). These were ''carnal ordinances, imposed on them until the time of reformation'' (v.10). Then the great ''But Christ'' (v.11): He entered ''by his own blood … into the holy place, having obtained eternal redemption for us'' (v.12). ''For if the blood of bulls and of goats … sanctifieth to the purifying of the flesh: how much more shall the blood of Christ, who through the eternal Spirit offered himself without spot to God, purge your conscience from dead works to serve the living God?'' (vv.13-14). Christ is ''the mediator of the new testament'' (v.15). The chapter then explains why death was necessary: ''where a testament is, there must also of necessity be the death of the testator'' (v.16). The old covenant was ratified with blood (vv.18-22), and ''almost all things are by the law purged with blood; and without shedding of blood is no remission'' (v.22). Christ entered ''heaven itself, now to appear in the presence of God for us'' (v.24), not to offer repeatedly but once: ''now once in the end of the world hath he appeared to put away sin by the sacrifice of himself'' (v.26). The chapter closes with the parallel: ''as it is appointed unto men once to die, but after this the judgment: so Christ was once offered to bear the sins of many; and unto them that look for him shall he appear the second time without sin unto salvation'' (vv.27-28).',
  'Christ''s Superior Sacrifice: The Blood that Purges the Conscience',
  'αἷμα (haima)',
  'Blood — the central word of the chapter, appearing 12 times (vv.7,12,13,14,18,19,20,21,22[x2],25). Blood represents life given in death (Lev 17:11). In the old covenant, animal blood was the medium of cleansing and covenant ratification, but it could only purify externally. Christ''s blood — His life voluntarily given in sacrificial death — accomplishes what animal blood never could: the cleansing of the conscience, eternal redemption, and direct access to God''s presence.',
  '["The Earthly Tabernacle and Its Limitations (vv.1-10): Then verily the first covenant had also ordinances of divine service and a worldly sanctuary; for there was a tabernacle made the first wherein was the candlestick and the table and the shewbread; and after the second veil the tabernacle which is called the Holiest of all; which had the golden censer and the ark of the covenant overlaid round about with gold wherein was the golden pot that had manna and Aarons rod that budded and the tables of the covenant; the Holy Ghost this signifying that the way into the holiest of all was not yet made manifest while as the first tabernacle was yet standing which was a figure for the time then present in which were offered both gifts and sacrifices that could not make him that did the service perfect as pertaining to the conscience; which stood only in meats and drinks and divers washings and carnal ordinances imposed on them until the time of reformation","Christ''s Blood: Eternal Redemption (vv.11-14): But Christ being come an high priest of good things to come by a greater and more perfect tabernacle not made with hands; neither by the blood of goats and calves but by his own blood he entered in once into the holy place having obtained eternal redemption for us; for if the blood of bulls and of goats and the ashes of an heifer sprinkling the unclean sanctifieth to the purifying of the flesh how much more shall the blood of Christ who through the eternal Spirit offered himself without spot to God purge your conscience from dead works to serve the living God","The Necessity of Blood in Covenant Ratification (vv.15-22): And for this cause he is the mediator of the new testament that by means of death they which are called might receive the promise of eternal inheritance; for where a testament is there must also of necessity be the death of the testator; for a testament is of force after men are dead otherwise it is of no strength at all while the testator liveth; whereupon neither the first testament was dedicated without blood; and almost all things are by the law purged with blood and without shedding of blood is no remission","Christ''s Once-for-All Offering (vv.23-28): It was therefore necessary that the patterns of things in the heavens should be purified with these but the heavenly things themselves with better sacrifices than these; for Christ is not entered into the holy places made with hands which are the figures of the true but into heaven itself now to appear in the presence of God for us; nor yet that he should offer himself often as the high priest entereth into the holy place every year with blood of others; for then must he often have suffered since the foundation of the world but now once in the end of the world hath he appeared to put away sin by the sacrifice of himself; and as it is appointed unto men once to die but after this the judgment so Christ was once offered to bear the sins of many and unto them that look for him shall he appear the second time without sin unto salvation"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 28 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Then verily the first covenant had also ordinances of divine service, and a worldly sanctuary.',
   'εἶχεν μὲν οὖν καὶ ἡ πρώτη δικαιώματα λατρείας τό τε ἅγιον κοσμικόν',
   'eichen men oun kai hē prōtē dikaiōmata latreias to te hagion kosmikon',
   '''The first covenant'' — the Mosaic/Sinai covenant. ''Ordinances of divine service'' (dikaiōmata latreias — regulations for worship, prescribed rites). ''A worldly sanctuary'' (to hagion kosmikon — an earthly sanctuary; kosmikon means belonging to this world/cosmos, not ''worldly'' in a negative sense). The old covenant had a legitimate, God-ordained worship system — but it was earthly, temporary, and preparatory.',
   NULL),
  (2, 'For there was a tabernacle made; the first, wherein was the candlestick, and the table, and the shewbread; which is called the sanctuary.',
   'σκηνὴ γὰρ κατεσκευάσθη ἡ πρώτη ἐν ᾗ ἥ τε λυχνία καὶ ἡ τράπεζα καὶ ἡ πρόθεσις τῶν ἄρτων ἥτις λέγεται ἅγια',
   'skēnē gar kateskeuasthē hē prōtē en hē hē te lychnia kai hē trapeza kai hē prothesis tōn artōn hētis legetai hagia',
   '''The first'' (hē prōtē) — the first compartment, the Holy Place (hagia). Three items: (1) ''the candlestick'' (hē lychnia — the golden lampstand with seven branches, Exod 25:31-40); (2) ''the table'' (hē trapeza — the table of showbread, Exod 25:23-30); (3) ''the shewbread'' (hē prothesis tōn artōn — the bread of the Presence, twelve loaves representing the twelve tribes, renewed weekly). Each item had symbolic significance: the lampstand (God''s light/presence), the table with bread (God''s provision/fellowship).',
   NULL),
  (3, 'And after the second veil, the tabernacle which is called the Holiest of all;',
   'μετὰ δὲ τὸ δεύτερον καταπέτασμα σκηνὴ ἡ λεγομένη ἅγια ἁγίων',
   'meta de to deuteron katapetasma skēnē hē legomenē hagia hagiōn',
   '''The second veil'' (to deuteron katapetasma — the inner curtain separating the Holy Place from the Holy of Holies). ''The Holiest of all'' (hagia hagiōn — the Holy of Holies, literally ''holies of holies,'' the superlative expression). This innermost chamber was the earthly dwelling place of God''s presence — entered only once a year by the high priest on the Day of Atonement (Yom Kippur). The veil symbolized the separation between God and sinful humanity — a separation that Christ''s death would definitively remove (Matt 27:51).',
   NULL),
  (4, 'Which had the golden censer, and the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron''s rod that budded, and the tables of the covenant;',
   'χρυσοῦν ἔχουσα θυμιατήριον καὶ τὴν κιβωτὸν τῆς διαθήκης περικεκαλυμμένην πάντοθεν χρυσίῳ ἐν ᾗ στάμνος χρυσῆ ἔχουσα τὸ μάννα καὶ ἡ ῥάβδος Ἀαρὼν ἡ βλαστήσασα καὶ αἱ πλάκες τῆς διαθήκης',
   'chrysoun echousa thymatērion kai tēn kibōton tēs diathēkēs perikekalymmenēn pantothen chrysiō en hē stamnos chrysē echousa to manna kai hē rhabdos Aarōn hē blastēsasa kai hai plakes tēs diathēkēs',
   '''The golden censer'' (chrysoun thymatērion — a golden incense altar or censer; likely the altar of incense that stood before the veil but was functionally associated with the Holy of Holies). ''The ark of the covenant'' (tēn kibōton tēs diathēkēs) — the most sacred object in Israel, containing three items: (1) ''the golden pot that had manna'' — memorial of God''s wilderness provision (Exod 16:33); (2) ''Aaron''s rod that budded'' — proof of God''s chosen priesthood (Num 17:10); (3) ''the tables of the covenant'' — the Ten Commandments, the terms of the Sinai covenant (Exod 25:16).',
   NULL),
  (5, 'And over it the cherubims of glory shadowing the mercyseat; of which we cannot now speak particularly.',
   'ὑπεράνω δὲ αὐτῆς χερουβὶμ δόξης κατασκιάζοντα τὸ ἱλαστήριον περὶ ὧν οὐκ ἔστιν νῦν λέγειν κατὰ μέρος',
   'hyperanō de autēs cheroubim doxēs kataskiazonta to hilastērion peri hōn ouk estin nyn legein kata meros',
   '''Cherubims of glory'' (cheroubim doxēs — the golden cherubim whose wings overshadowed the mercy seat, representing God''s throne-guardians). ''Shadowing the mercyseat'' (kataskiazonta to hilastērion). The ''mercyseat'' (hilastērion — the place of propitiation, the atonement cover; from hilaskomai, to propitiate). This is where the high priest sprinkled blood on the Day of Atonement (Lev 16:14-15) — where God''s justice met God''s mercy, where the blood covered sin. Paul uses the same word (hilastērion) in Romans 3:25 to describe Christ Himself as the propitiation. ''We cannot now speak particularly'' — the author restrains himself; his focus is not the furniture but the function of the system.',
   NULL),
  (6, 'Now when these things were thus ordained, the priests went always into the first tabernacle, accomplishing the service of God.',
   'τούτων δὲ οὕτως κατεσκευασμένων εἰς μὲν τὴν πρώτην σκηνὴν διὰ παντὸς εἰσίασιν οἱ ἱερεῖς τὰς λατρείας ἐπιτελοῦντες',
   'toutōn de houtōs kateskeuasmenōn eis men tēn prōtēn skēnēn dia pantos eisiasin hoi hiereis tas latreias epitelountes',
   '''Always'' (dia pantos — continually, at all times). The ordinary priests entered the Holy Place daily to tend the lampstand, offer incense, and replace the showbread. This daily access to the first compartment is contrasted with the restricted access to the second — highlighting the limited nature of the old system.',
   NULL),
  (7, 'But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people:',
   'εἰς δὲ τὴν δευτέραν ἅπαξ τοῦ ἐνιαυτοῦ μόνος ὁ ἀρχιερεύς οὐ χωρὶς αἵματος ὃ προσφέρει ὑπὲρ ἑαυτοῦ καὶ τῶν τοῦ λαοῦ ἀγνοημάτων',
   'eis de tēn deuteran hapax tou eniautou monos ho archiereus ou chōris haimatos ho prospherei hyper heautou kai tōn tou laou agnoēmatōn',
   '''Into the second'' — the Holy of Holies. ''Alone'' (monos — only the high priest, no one else). ''Once every year'' (hapax tou eniautou — once per year, on the Day of Atonement). ''Not without blood'' (ou chōris haimatos — never without blood). Three restrictions: (1) only one person; (2) only one day per year; (3) always with blood. ''For himself, and for the errors of the people'' (hyper heautou kai tōn tou laou agnoēmatōn — for his own sins and for the people''s sins of ignorance). The high priest had to offer for himself first — his own sinfulness was a constant limitation.',
   'The restricted access to the Holy of Holies — one person, one day, with blood — powerfully symbolized the barrier between God and sinful humanity. The very restrictions testified that the way to God was ''not yet made manifest'' (v.8). Christ removed all three restrictions: all believers (not just one priest) may approach God at any time (not just one day) through His blood (not animal blood).'),
  (8, 'The Holy Ghost this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing:',
   'τοῦτο δηλοῦντος τοῦ πνεύματος τοῦ ἁγίου μήπω πεφανερῶσθαι τὴν τῶν ἁγίων ὁδὸν ἔτι τῆς πρώτης σκηνῆς ἐχούσης στάσιν',
   'touto dēlountos tou pneumatos tou hagiou mēpō pephanerōsthai tēn tōn hagiōn hodon eti tēs prōtēs skēnēs echousēs stasin',
   '''The Holy Ghost this signifying'' (touto dēlountos tou pneumatos tou hagiou — the Holy Spirit making this clear/evident). The Spirit Himself, through the tabernacle design, was communicating a theological truth: ''the way into the holiest of all was not yet made manifest'' (mēpō pephanerōsthai — not yet revealed/opened). ''While the first tabernacle was yet standing'' — as long as the old system functioned, it testified to its own inadequacy. The veil declared: ''You cannot come in.'' The annual repetition declared: ''The problem is not yet solved.'' The old system was a prophetic sign pointing to its own replacement.',
   'This is a remarkable hermeneutical statement: the Holy Spirit designed the tabernacle structure itself as a theological teaching tool. The very architecture — the veil barring access, the annual-only entrance — was the Spirit''s way of saying: ''The way to God is not yet open; a better way is coming.'' The old covenant''s limitations were intentional, pedagogical, and temporary.'),
  (9, 'Which was a figure for the time then present, in which were offered both gifts and sacrifices, that could not make him that did the service perfect, as pertaining to the conscience:',
   'ἥτις παραβολὴ εἰς τὸν καιρὸν τὸν ἐνεστηκότα καθ᾽ ὃν δῶρά τε καὶ θυσίαι προσφέρονται μὴ δυνάμεναι κατὰ συνείδησιν τελειῶσαι τὸν λατρεύοντα',
   'hētis parabolē eis ton kairon ton enestēkota kath hon dōra te kai thysiai prospherontai mē dynamenai kata syneidēsin teleiōsai ton latreuonta',
   '''A figure'' (parabolē — a parable, an illustration, a symbolic representation). ''Could not make him … perfect, as pertaining to the conscience'' (mē dynamenai kata syneidēsin teleiōsai — unable to bring to completion regarding the conscience). This is the old system''s fatal deficiency: it could address external/ceremonial uncleanness but could not reach the conscience — the inner awareness of guilt before God. Animal blood could ritually purify the body but could not remove the consciousness of sin. The worshipper walked away from the sacrifice still burdened with inner guilt.',
   'The old covenant''s inability to purify the conscience is the crucial limitation that Christ''s sacrifice addresses. Conscience (syneidēsis) is the inner awareness of moral standing before God. Animal sacrifices could not reach this deep — they dealt with the surface, not the root. Christ''s blood purges the conscience itself (v.14), achieving what the entire Levitical system could not.'),
  (10, 'Which stood only in meats and drinks, and divers washings, and carnal ordinances, imposed on them until the time of reformation.',
   'μόνον ἐπὶ βρώμασιν καὶ πόμασιν καὶ διαφόροις βαπτισμοῖς καὶ δικαιώμασιν σαρκὸς μέχρι καιροῦ διορθώσεως ἐπικείμενα',
   'monon epi brōmasin kai pomasin kai diaphorois baptismois kai dikaiōmasin sarkos mechri kairou diorthōseōs epikeimena',
   '''Meats and drinks'' (brōmasin kai pomasin — food and drink regulations). ''Divers washings'' (diaphorois baptismois — various ceremonial washings). ''Carnal ordinances'' (dikaiōmasin sarkos — regulations pertaining to the flesh/body). ''Imposed until the time of reformation'' (mechri kairou diorthōseōs — until the appointed time of setting things right). Diorthōsis means correction, reformation, setting straight — the time when God would replace the external system with an internal reality. The old covenant regulated the external (what you eat, how you wash, bodily practices) but could not transform the internal. Christ''s coming is the ''reformation'' — the time when the shadows give way to the substance.',
   NULL),
  (11, 'But Christ being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands, that is to say, not of this building;',
   'Χριστὸς δὲ παραγενόμενος ἀρχιερεὺς τῶν μελλόντων ἀγαθῶν διὰ τῆς μείζονος καὶ τελειοτέρας σκηνῆς οὐ χειροποιήτου τοῦτ᾽ ἔστιν οὐ ταύτης τῆς κτίσεως',
   'Christos de paragenomenos archiereus tōn mellontōn agathōn dia tēs meizonos kai teleioteras skēnēs ou cheiropoiētou tout estin ou tautēs tēs ktiseōs',
   '''But Christ'' (Christos de — the great adversative: everything changes). ''High priest of good things to come'' (archiereus tōn mellontōn agathōn — high priest of the coming good things, the eschatological blessings). ''A greater and more perfect tabernacle'' (meizonos kai teleioteras skēnēs — a larger and more complete tent/sanctuary). ''Not made with hands'' (ou cheiropoiētou — not manufactured by human effort). ''Not of this building/creation'' (ou tautēs tēs ktiseōs — not belonging to this created order). Christ ministers in a sanctuary that belongs to a different order of reality — the heavenly, the eternal, the uncreated.',
   NULL),
  (12, 'Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us.',
   'οὐδὲ δι᾽ αἵματος τράγων καὶ μόσχων διὰ δὲ τοῦ ἰδίου αἵματος εἰσῆλθεν ἐφάπαξ εἰς τὰ ἅγια αἰωνίαν λύτρωσιν εὑράμενος',
   'oude di haimatos tragōn kai moschōn dia de tou idiou haimatos eisēlthen ephapax eis ta hagia aiōnian lytrōsin heuramenos',
   '''Not by the blood of goats and calves'' — the contrast with the Day of Atonement (Lev 16). ''By his own blood'' (dia tou idiou haimatos — through His own blood). ''Once'' (ephapax — once for all, a single unrepeatable act; the same word as 7:27). ''Into the holy place'' (eis ta hagia — into the holy places, the heavenly sanctuary). ''Having obtained eternal redemption'' (aiōnian lytrōsin heuramenos — having found/secured everlasting redemption). ''Redemption'' (lytrōsis — release effected by payment of a ransom price; from lytron, a ransom). The price: His own blood. The result: eternal (not annual) redemption. The act: once (not repeated).',
   'This verse is the sacrificial center of Hebrews. Three contrasts define Christ''s superior offering: (1) not animal blood but His own blood; (2) not repeated annually but once for all; (3) not temporary ceremonial cleansing but eternal redemption. Every deficiency of the old system is answered in a single verse.'),
  (13, 'For if the blood of bulls and of goats, and the ashes of an heifer sprinkling the unclean, sanctifieth to the purifying of the flesh:',
   'εἰ γὰρ τὸ αἷμα ταύρων καὶ τράγων καὶ σποδὸς δαμάλεως ῥαντίζουσα τοὺς κεκοινωμένους ἁγιάζει πρὸς τὴν τῆς σαρκὸς καθαρότητα',
   'ei gar to haima taurōn kai tragōn kai spodos damaleōs rantizousa tous kekoinōmenous hagiazei pros tēn tēs sarkos katharotēta',
   '''Blood of bulls and goats'' — the Day of Atonement sacrifices. ''Ashes of an heifer'' (spodos damaleōs) — the red heifer ceremony (Num 19), whose ashes mixed with water purified those who had contacted a corpse. ''Sanctifieth to the purifying of the flesh'' (hagiazei pros tēn tēs sarkos katharotēta — sanctifies for bodily/ceremonial cleanness). The argument is from the lesser to the greater (a fortiori): if animal blood achieves external purification (which it demonstrably does), how much more …',
   NULL),
  (14, 'How much more shall the blood of Christ, who through the eternal Spirit offered himself without spot to God, purge your conscience from dead works to serve the living God?',
   'πόσῳ μᾶλλον τὸ αἷμα τοῦ Χριστοῦ ὃς διὰ πνεύματος αἰωνίου ἑαυτὸν προσήνεγκεν ἄμωμον τῷ θεῷ καθαριεῖ τὴν συνείδησιν ὑμῶν ἀπὸ νεκρῶν ἔργων εἰς τὸ λατρεύειν θεῷ ζῶντι',
   'posō mallon to haima tou Christou hos dia pneumatos aiōniou heauton prosēnenken amōmon tō theō kathariei tēn syneidēsin hymōn apo nekrōn ergōn eis to latreuein theō zōnti',
   '''How much more'' (posō mallon — the a fortiori argument reaches its climax). ''The blood of Christ'' — His life given in death. ''Through the eternal Spirit'' (dia pneumatos aiōniou — through the Holy Spirit, the eternal Spirit). Christ''s self-offering was Spirit-empowered — the Trinity acted together in the atonement: the Father sent, the Son offered, the Spirit empowered. ''Without spot'' (amōmon — unblemished, without defect; the sacrificial term for an animal without blemish). ''Purge your conscience'' (kathariei tēn syneidēsin — will cleanse the conscience). ''From dead works'' (apo nekrōn ergōn — from works that produce death, works done apart from faith). ''To serve the living God'' (eis to latreuein theō zōnti — for the purpose of worshipping the living God). The cleansed conscience enables genuine worship.',
   'This verse is the soteriological center of Hebrews. The blood of Christ does what animal blood never could: it purges the conscience — the innermost seat of moral awareness. The trinitarian dimension is explicit: Christ offered Himself through the eternal Spirit to God. And the purpose of cleansing is not merely forgiveness but worship — freed from the burden of guilty conscience, believers can now serve the living God with joy and freedom.'),
  (15, 'And for this cause he is the mediator of the new testament, that by means of death, for the redemption of the transgressions that were under the first testament, they which are called might receive the promise of eternal inheritance.',
   'καὶ διὰ τοῦτο διαθήκης καινῆς μεσίτης ἐστίν ὅπως θανάτου γενομένου εἰς ἀπολύτρωσιν τῶν ἐπὶ τῇ πρώτῃ διαθήκῃ παραβάσεων τὴν ἐπαγγελίαν λάβωσιν οἱ κεκλημένοι τῆς αἰωνίου κληρονομίας',
   'kai dia touto diathēkēs kainēs mesitēs estin hopōs thanatou genomenou eis apolytrōsin tōn epi tē prōtē diathēkē parabaseōn tēn epangelian labōsin hoi keklēmenoi tēs aiōniou klēronomias',
   '''Mediator of the new testament'' (diathēkēs kainēs mesitēs). ''By means of death'' (thanatou genomenou — a death having occurred). ''For the redemption of the transgressions that were under the first testament'' — Christ''s death is retroactive: it redeems transgressions committed under the old covenant. The OT saints were saved by faith looking forward to what Christ would accomplish. ''They which are called'' (hoi keklēmenoi — the called ones, those divinely summoned). ''Eternal inheritance'' (tēs aiōniou klēronomias) — the ultimate inheritance that the earthly promised land only foreshadowed.',
   'Christ''s death has retroactive efficacy: it redeems transgressions committed under the first covenant. The OT sacrifices never actually removed sin — they pointed forward to the sacrifice that would. Christ''s blood is the reality to which all OT sacrifices pointed; His death is the ground on which every OT believer was saved.'),
  (16, 'For where a testament is, there must also of necessity be the death of the testator.',
   'ὅπου γὰρ διαθήκη θάνατον ἀνάγκη φέρεσθαι τοῦ διαθεμένου',
   'hopou gar diathēkē thanaton anankē pheresthai tou diathemenou',
   '''Where a testament is'' (hopou diathēkē — where a will/testament exists). The author exploits the double meaning of diathēkē: both ''covenant'' and ''testament/will.'' ''There must be the death of the testator'' (thanaton anankē pheresthai tou diathemenou — the death of the one who made the will must be established). A will only takes effect when the testator dies. Christ is both the testator (who made the testament) and the sacrifice (who died to enact it). His death activated the new covenant — the ''inheritance'' (v.15) becomes available through the testator''s death.',
   NULL),
  (17, 'For a testament is of force after men are dead: otherwise it is of no strength at all while the testator liveth.',
   'διαθήκη γὰρ ἐπὶ νεκροῖς βεβαία ἐπεὶ μή ποτε ἰσχύει ὅτε ζῇ ὁ διαθέμενος',
   'diathēkē gar epi nekrois bebaia epei mē pote ischyei hote zē ho diathemenos',
   '''Of force after men are dead'' (epi nekrois bebaia — confirmed/ratified upon the dead, i.e., when death has occurred). ''No strength at all while the testator liveth'' — a will has no legal force while the testator is alive; it can be changed, revoked, or annulled. Only death makes it irrevocable. So Christ''s death made the new covenant irrevocable — it cannot be altered, recalled, or superseded. The covenant is sealed in blood — permanent, unchangeable, final.',
   NULL),
  (18, 'Whereupon neither the first testament was dedicated without blood.',
   'ὅθεν οὐδ᾽ ἡ πρώτη χωρὶς αἵματος ἐγκεκαίνισται',
   'hothen oud hē prōtē chōris haimatos enkekainistai',
   '''Dedicated'' (enkekainistai — inaugurated, ratified, put into effect; from enkainizō, to renew, to inaugurate). Even the first covenant required blood for its inauguration (Exod 24:5-8). The principle is consistent throughout Scripture: covenants are ratified by blood — life given in death. The shedding of blood represents the seriousness of the covenant commitment and the cost of its violation.',
   NULL),
  (19, 'For when Moses had spoken every precept to all the people according to the law, he took the blood of calves and of goats, with water, and scarlet wool, and hyssop, and sprinkled both the book, and all the people,',
   'λαληθείσης γὰρ πάσης ἐντολῆς κατὰ νόμον ὑπὸ Μωϋσέως παντὶ τῷ λαῷ λαβὼν τὸ αἷμα τῶν μόσχων καὶ τράγων μετὰ ὕδατος καὶ ἐρίου κοκκίνου καὶ ὑσσώπου αὐτό τε τὸ βιβλίον καὶ πάντα τὸν λαὸν ἐρράντισεν',
   'lalētheisēs gar pasēs entolēs kata nomon hypo Mōyseōs panti tō laō labōn to haima tōn moschōn kai tragōn meta hydatos kai eriou kokkinou kai hyssōpou auto te to biblion kai panta ton laon errantisen',
   'Recounting the Sinai covenant inauguration (Exod 24:3-8). Moses sprinkled the blood on both the book (the covenant document) and the people (the covenant community). Blood touched everything — binding both parties, sanctifying the agreement, and making it solemn and irrevocable. ''Scarlet wool and hyssop'' — instruments of application, used in purification rituals (Lev 14:4-6; Num 19:6).',
   NULL),
  (20, 'Saying, This is the blood of the testament which God hath enjoined unto you.',
   'λέγων τοῦτο τὸ αἷμα τῆς διαθήκης ἧς ἐνετείλατο πρὸς ὑμᾶς ὁ θεός',
   'legōn touto to haima tēs diathēkēs hēs eneteilato pros hymas ho theos',
   '''This is the blood of the testament'' — echoing Exodus 24:8 and anticipating Jesus'' words at the Last Supper: ''This is my blood of the new testament'' (Matt 26:28). The verbal parallel is deliberate and profound: Jesus consciously identified His death with the covenant-inaugurating sacrifice. What Moses did with animal blood at Sinai, Christ did with His own blood at Calvary — but with infinitely greater effect.',
   NULL),
  (21, 'Moreover he sprinkled with blood both the tabernacle, and all the vessels of the ministry.',
   'καὶ τὴν σκηνὴν δὲ καὶ πάντα τὰ σκεύη τῆς λειτουργίας τῷ αἵματι ὁμοίως ἐρράντισεν',
   'kai tēn skēnēn de kai panta ta skeuē tēs leitourgias tō haimati homoiōs errantisen',
   'The tabernacle and all its furnishings were sprinkled with blood. Nothing in the worship system escaped the blood — every object used in divine service was consecrated through blood-sprinkling. This comprehensive blood-application establishes the principle of v.22: without blood, no purification is possible.',
   NULL),
  (22, 'And almost all things are by the law purged with blood; and without shedding of blood is no remission.',
   'καὶ σχεδὸν ἐν αἵματι πάντα καθαρίζεται κατὰ τὸν νόμον καὶ χωρὶς αἱματεκχυσίας οὐ γίνεται ἄφεσις',
   'kai schedon en haimati panta katharizetai kata ton nomon kai chōris haimatekchysias ou ginetai aphesis',
   '''Almost all things'' (schedon panta — nearly everything; ''almost'' because some purifications used water or fire, cf. Num 31:22-23; Lev 5:11-13). ''Purged with blood'' (en haimati katharizetai). ''Without shedding of blood is no remission'' (chōris haimatekchysias ou ginetai aphesis). Haimatekchysia (blood-shedding) is a NT hapax — a compound word meaning ''the pouring out of blood.'' Aphesis means release, forgiveness, letting go. The axiom is absolute: no forgiveness without blood. This is grounded in Leviticus 17:11 — ''the life of the flesh is in the blood … it is the blood that maketh an atonement for the soul.'' Blood represents life given in death as a substitute.',
   'This verse states the fundamental principle of biblical atonement: ''without shedding of blood is no remission.'' Forgiveness requires a life given — a substitute who bears the penalty. This is not arbitrary but reflects the gravity of sin against a holy God. The principle applies both to the old covenant (animal blood) and the new (Christ''s blood), but only the latter achieves actual, permanent remission.'),
  (23, 'It was therefore necessary that the patterns of things in the heavens should be purified with these; but the heavenly things themselves with better sacrifices than these.',
   'ἀνάγκη οὖν τὰ μὲν ὑποδείγματα τῶν ἐν τοῖς οὐρανοῖς τούτοις καθαρίζεσθαι αὐτὰ δὲ τὰ ἐπουράνια κρείττοσιν θυσίαις παρὰ ταύτας',
   'anankē oun ta men hypodeigmata tōn en tois ouranois toutois katharizesthai auta de ta epourania kreittosin thysiais para tautas',
   '''The patterns'' (ta hypodeigmata — the copies/models; the earthly sanctuary). ''Purified with these'' — animal blood sufficed for purifying the copies. ''The heavenly things themselves'' (auta ta epourania — the heavenly realities themselves). ''Better sacrifices'' (kreittosin thysiais — superior offerings). The plural ''sacrifices'' likely refers to the one sacrifice of Christ viewed in its multiple aspects (His blood, His body, His life). Even the heavenly sanctuary needed ''purification'' — not from physical contamination but from the claims of sin against the people it serves.',
   NULL),
  (24, 'For Christ is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of God for us:',
   'οὐ γὰρ εἰς χειροποίητα ἅγια εἰσῆλθεν ὁ Χριστός ἀντίτυπα τῶν ἀληθινῶν ἀλλ᾽ εἰς αὐτὸν τὸν οὐρανόν νῦν ἐμφανισθῆναι τῷ προσώπῳ τοῦ θεοῦ ὑπὲρ ἡμῶν',
   'ou gar eis cheiropoiēta hagia eisēlthen ho Christos antitypa tōn alēthinōn all eis auton ton ouranon nyn emphanisthēnai tō prosōpō tou theou hyper hēmōn',
   '''Not … the holy places made with hands'' (ou cheiropoiēta hagia — not the handmade sanctuaries). ''The figures of the true'' (antitypa tōn alēthinōn — the counterparts/copies of the genuine realities). ''Into heaven itself'' (eis auton ton ouranon — into heaven itself, the genuine, uncreated, divine dwelling). ''To appear in the presence of God'' (emphanisthēnai tō prosōpō tou theou — to appear before the face of God). ''For us'' (hyper hēmōn — on our behalf). Christ stands in God''s presence as our representative — His presence there guarantees our access. He is not performing a ritual but presenting a person — Himself, bearing the marks of His completed sacrifice.',
   NULL),
  (25, 'Nor yet that he should offer himself often, as the high priest entereth into the holy place every year with blood of others;',
   'οὐδ᾽ ἵνα πολλάκις προσφέρῃ ἑαυτόν ὥσπερ ὁ ἀρχιερεὺς εἰσέρχεται εἰς τὰ ἅγια κατ᾽ ἐνιαυτόν ἐν αἵματι ἀλλοτρίῳ',
   'oud hina pollakis prospherē heauton hōsper ho archiereus eiserchtai eis ta hagia kat eniauton en haimati allotriō',
   '''Not … offer himself often'' (oud hina pollakis prospherē heauton — not to offer Himself repeatedly). ''Every year with blood of others'' (kat eniauton en haimati allotriō — annually with alien/foreign blood, i.e., animal blood). Two contrasts: (1) not repeatedly but once; (2) not with another''s blood but His own. Repetition implied insufficiency; Christ''s singular offering implies completeness.',
   NULL),
  (26, 'For then must he often have suffered since the foundation of the world: but now once in the end of the world hath he appeared to put away sin by the sacrifice of himself.',
   'ἐπεὶ ἔδει αὐτὸν πολλάκις παθεῖν ἀπὸ καταβολῆς κόσμου νῦν δὲ ἅπαξ ἐπὶ συντελείᾳ τῶν αἰώνων εἰς ἀθέτησιν ἁμαρτίας διὰ τῆς θυσίας αὐτοῦ πεφανέρωται',
   'epei edei auton pollakis pathein apo katabolēs kosmou nyn de hapax epi synteleia tōn aiōnōn eis athetēsin hamartias dia tēs thysias autou pephanerōtai',
   '''Once in the end of the world'' (hapax epi synteleia tōn aiōnōn — once at the consummation of the ages). ''To put away sin'' (eis athetēsin hamartias — for the annulment, the cancellation, the abolition of sin; the same athetēsis from 7:18, meaning to set aside permanently). ''By the sacrifice of himself'' (dia tēs thysias autou — through His own sacrifice). Christ appeared at the climactic moment of all history — the convergence point of all ages — to accomplish in one act what endless repetitions could never achieve: the permanent removal of sin. The incarnation and crucifixion are not accidents of history but the planned climax of all God''s redemptive purposes.',
   'Christ''s appearance ''in the end of the world'' (at the consummation of the ages) means His sacrifice is the climactic event of all history. Everything before pointed toward it; everything after flows from it. The cross is the hinge of history — the moment toward which all creation was moving and from which all redemption proceeds.'),
  (27, 'And as it is appointed unto men once to die, but after this the judgment:',
   'καὶ καθ᾽ ὅσον ἀπόκειται τοῖς ἀνθρώποις ἅπαξ ἀποθανεῖν μετὰ δὲ τοῦτο κρίσις',
   'kai kath hoson apokeitai tois anthrōpois hapax apothanein meta de touto krisis',
   '''Appointed'' (apokeitai — laid up, reserved, appointed as a destiny). ''Once to die'' (hapax apothanein — to die once, a single death). ''After this the judgment'' (meta touto krisis). Death is universal and unrepeatable — each person dies once. After death comes judgment — there is no second chance, no reincarnation, no annihilation. The parallel structure links human experience to Christ''s experience: as men die once and face judgment, so Christ was offered once to bear sins and will return to bring salvation.',
   'This verse establishes the finality of death and the certainty of judgment. Each person has one life, one death, and one judgment. This excludes reincarnation, soul sleep without judgment, and universalism. The parallel with v.28 shows that Christ''s death was equally singular, definitive, and unrepeatable.'),
  (28, 'So Christ was once offered to bear the sins of many; and unto them that look for him shall he appear the second time without sin unto salvation.',
   'οὕτως καὶ ὁ Χριστὸς ἅπαξ προσενεχθεὶς εἰς τὸ πολλῶν ἀνενεγκεῖν ἁμαρτίας ἐκ δευτέρου χωρὶς ἁμαρτίας ὀφθήσεται τοῖς αὐτὸν ἀπεκδεχομένοις εἰς σωτηρίαν',
   'houtōs kai ho Christos hapax prosenechtheis eis to pollōn anenenkein hamartias ek deuterou chōris hamartias ophthēsetai tois auton apekdechomenois eis sōtērian',
   '''Once offered'' (hapax prosenechtheis — offered once for all). ''To bear the sins of many'' (pollōn anenenkein hamartias — to carry up, to bear away the sins of many; echoing Isaiah 53:12, ''he bare the sin of many''). ''The second time'' (ek deuterou — a second time). ''Without sin'' (chōris hamartias — apart from sin, having nothing to do with sin; His second coming will not be to deal with sin — that was accomplished at the first coming). ''Unto salvation'' (eis sōtērian — for the purpose of final, complete salvation). ''Them that look for him'' (tois auton apekdechomenois — those who are eagerly awaiting Him). Three appearances of Christ: (1) He ''appeared'' to put away sin (v.26, first coming); (2) He ''appears'' in God''s presence for us (v.24, present heavenly ministry); (3) He ''shall appear'' a second time for salvation (v.28, second coming).',
   'This verse presents the three-fold appearing of Christ that structures all of Christian theology: (1) His first coming — to deal with sin through sacrifice; (2) His present heavenly ministry — appearing before God on our behalf; (3) His second coming — to bring final, complete salvation. The second coming is ''without sin'' — not to re-atone but to consummate the salvation already accomplished.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 9;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἱλαστήριον', 'hilastērion', 'G2435', 'Mercy seat, place of propitiation, atonement cover — from hilaskomai (to propitiate, to make atonement). In v.5 the hilastērion is the golden cover on the ark of the covenant where blood was sprinkled on the Day of Atonement. It was the meeting point between God''s holiness and human sin — where wrath was averted by substitutionary blood. Paul uses the same word in Romans 3:25 to describe Christ Himself as the ''propitiation'' — He is the true mercy seat, the place where God''s justice and mercy meet.', 1),
  ('συνείδησις', 'syneidēsis', 'G4893', 'Conscience, moral consciousness, inner awareness of guilt or innocence — from syn (with) + oida (to know). In vv.9,14 the conscience is the critical battleground: the old covenant could not purify the conscience (v.9); Christ''s blood can (v.14). Conscience is the deep, inner sense of moral standing before God — the awareness of guilt that no external ritual can erase. Only the blood of Christ reaches this deep, cleansing not just the hands but the heart.', 2),
  ('λύτρωσις', 'lytrōsis', 'G3085', 'Redemption, ransom, deliverance effected by payment — from lytron (a ransom price). In v.12 Christ obtained ''eternal redemption'' (aiōnian lytrōsin). Redemption implies captivity (to sin and death) and a price paid for release (Christ''s blood). The redemption is ''eternal'' — not temporary like the annual Day of Atonement cleansing but permanent, once-for-all, and everlasting in its effects.', 3),
  ('αἱματεκχυσία', 'haimatekchysia', 'G130', 'Shedding of blood, pouring out of blood — from haima (blood) + ekchysis (pouring out). A NT hapax (only in v.22). The compound word emphasizes the violent, sacrificial nature of blood-shedding: blood must be poured out — a life must be given — for sin to be forgiven. This is the foundational principle of biblical atonement, grounded in Leviticus 17:11.', 4),
  ('ἀθέτησις', 'athetēsis', 'G115', 'Annulment, setting aside, cancellation, abolition — from atheteō (to set aside, to reject, to nullify). In v.26 Christ appeared ''for the annulment of sin'' (eis athetēsin hamartias). Sin is not merely covered (as under the old covenant) but annulled — cancelled, abolished, set aside permanently. The same word was used in 7:18 for the ''disannulling'' of the old commandment. What was done to the old law, Christ''s sacrifice does to sin itself — it sets it aside once and for all.', 5),
  ('ἀπεκδέχομαι', 'apekdechomai', 'G553', 'To eagerly await, to wait with intense expectation — from apo (from, intensifying) + ekdechomai (to expect, to wait for). In v.28 believers are those who ''eagerly await'' Christ''s return. The compound prefix apo + ek intensifies the waiting: this is not passive patience but active, eager, straining-forward expectation. The hope of Christ''s second coming characterizes genuine believers — they long for His appearing because it will bring the fullness of salvation.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 9
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 5
    WHEN 2 THEN 14
    WHEN 3 THEN 12
    WHEN 4 THEN 22
    WHEN 5 THEN 26
    WHEN 6 THEN 28
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (2, 'Exodus 25:31-40', 1),
  (3, 'Exodus 26:31-33', 2),
  (3, 'Matthew 27:51', 3),
  (4, 'Exodus 25:10-22', 4),
  (4, 'Numbers 17:10', 5),
  (5, 'Romans 3:25', 6),
  (5, 'Leviticus 16:14-15', 7),
  (7, 'Leviticus 16:2-34', 8),
  (8, 'Hebrews 10:19-20', 9),
  (11, 'Hebrews 8:2', 10),
  (12, 'Hebrews 7:27', 11),
  (12, '1 Peter 1:18-19', 12),
  (12, 'Ephesians 1:7', 13),
  (13, 'Numbers 19:2-9', 14),
  (14, '1 John 1:7', 15),
  (14, 'Titus 2:14', 16),
  (14, '1 Peter 1:19', 17),
  (15, 'Hebrews 8:6', 18),
  (15, '1 Timothy 2:5', 19),
  (18, 'Exodus 24:5-8', 20),
  (20, 'Matthew 26:28', 21),
  (20, 'Exodus 24:8', 22),
  (22, 'Leviticus 17:11', 23),
  (24, 'Hebrews 8:2', 24),
  (24, 'Romans 8:34', 25),
  (26, 'Galatians 4:4', 26),
  (26, '1 John 3:5', 27),
  (27, 'Genesis 3:19', 28),
  (27, 'Romans 6:23', 29),
  (27, 'Ecclesiastes 3:20', 30),
  (28, 'Isaiah 53:12', 31),
  (28, '1 Peter 2:24', 32),
  (28, 'Philippians 3:20-21', 33),
  (28, 'Titus 2:13', 34)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 9
  AND v.verse_number = cr.verse_number;
