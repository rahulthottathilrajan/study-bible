-- ═══════════════════════════════════════════════════
-- JAMES CHAPTER 5 — Patience, Prayer, and Restoration
-- 20 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 5,
  'James 5 opens with a thundering denunciation of the rich who have defrauded their labourers, lived in pleasure, and condemned the just (vv.1-6) — language reminiscent of the OT prophets. James then turns to the suffering believers and calls them to patience, using the farmer waiting for rain and the prophets who endured affliction as models (vv.7-11). Job''s patience is highlighted: ''ye have seen the end of the Lord; that the Lord is very pitiful, and of tender mercy'' (v.11). A brief prohibition against swearing follows (v.12). The chapter then presents the Bible''s most important passage on prayer and healing: the sick should call for the elders to anoint with oil and pray, and ''the prayer of faith shall save the sick'' (vv.14-15). The confession of faults and prayer for one another (v.16) is grounded in the example of Elijah, a man of ''like passions'' who prayed and shut the heavens (vv.17-18). The epistle closes with the beautiful promise that whoever turns a sinner from error saves a soul from death and covers a multitude of sins (vv.19-20).',
  'Patient Endurance and the Power of Prayer',
  'μακροθυμήσατε (makrothymēsate)',
  'Be patient, have long-endurance — from makros (long) + thymos (passion, temper). To hold one''s spirit under control for a long time, to persevere through delayed resolution. The patience of the farmer, the prophets, and Job.',
  '["Woe to the Rich Oppressors (vv.1-6): Go to now ye rich men weep and howl for your miseries that shall come upon you; your riches are corrupted and your garments are motheaten; your gold and silver is cankered; ye have heaped treasure together for the last days; behold the hire of the labourers who have reaped down your fields which is of you kept back by fraud crieth; ye have lived in pleasure on the earth and been wanton; ye have condemned and killed the just and he doth not resist you","Be Patient Until the Coming of the Lord (vv.7-9): Be patient therefore brethren unto the coming of the Lord; behold the husbandman waiteth for the precious fruit of the earth and hath long patience for it until he receive the early and latter rain; be ye also patient stablish your hearts for the coming of the Lord draweth nigh; grudge not one against another brethren lest ye be condemned","The Example of the Prophets and Job (vv.10-11): Take my brethren the prophets who have spoken in the name of the Lord for an example of suffering affliction and of patience; behold we count them happy which endure; ye have heard of the patience of Job and have seen the end of the Lord that the Lord is very pitiful and of tender mercy","Do Not Swear (v.12): But above all things my brethren swear not neither by heaven neither by the earth neither by any other oath; but let your yea be yea and your nay nay lest ye fall into condemnation","Prayer for the Sick — Elders and Anointing (vv.13-16): Is any among you afflicted let him pray; is any merry let him sing psalms; is any sick among you let him call for the elders of the church and let them pray over him anointing him with oil in the name of the Lord; and the prayer of faith shall save the sick and the Lord shall raise him up and if he have committed sins they shall be forgiven him; confess your faults one to another and pray one for another that ye may be healed; the effectual fervent prayer of a righteous man availeth much","Elijah''s Prayer (vv.17-18): Elias was a man subject to like passions as we are and he prayed earnestly that it might not rain and it rained not on the earth by the space of three years and six months; and he prayed again and the heaven gave rain and the earth brought forth her fruit","Restoring the Wanderer (vv.19-20): Brethren if any of you do err from the truth and one convert him; let him know that he which converteth the sinner from the error of his way shall save a soul from death and shall hide a multitude of sins"]'
FROM books b WHERE b.name = 'James';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Go to now, ye rich men, weep and howl for your miseries that shall come upon you.',
   'Ἄγε νῦν οἱ πλούσιοι κλαύσατε ὀλολύζοντες ἐπὶ ταῖς ταλαιπωρίαις ὑμῶν ταῖς ἐπερχομέναις',
   'Age nyn hoi plousioi klausate ololyzontes epi tais talaipōriais hymōn tais eperchomenais',
   '''Go to now'' (age nyn — come now, pay attention; the same sharp interjection as 4:13). ''Weep and howl'' (klausate ololyzontes — cry and wail; ololyzō is an onomatopoeia: the sound of loud, uncontrollable wailing). ''Miseries'' (talaipōriais — wretched afflictions, hardships). ''That shall come upon you'' (tais eperchomenais — the ones coming upon you, approaching, bearing down). James addresses the wealthy oppressors with prophetic fury reminiscent of Amos and Isaiah. The miseries are not merely earthly reversal but eschatological judgment.',
   NULL),
  (2,
   'Your riches are corrupted, and your garments are motheaten.',
   'ὁ πλοῦτος ὑμῶν σέσηπεν καὶ τὰ ἱμάτια ὑμῶν σητόβρωτα γέγονεν',
   'ho ploutos hymōn sesēpen kai ta himatia hymōn sētobrōta gegonen',
   '''Corrupted'' (sesēpen — rotted, decayed; perfect tense: has rotted and remains rotten). ''Motheaten'' (sētobrōta — eaten by moths; from sēs, moth + bibrōskō, to eat). Wealth stored in three forms in the ancient world: food/grain, clothing, and precious metals. All three are addressed (vv.2-3): grain has rotted, garments are moth-eaten, metals are corroded. Hoarded wealth self-destructs. What was not used to help the poor is consumed by decay.',
   NULL),
  (3,
   'Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.',
   'ὁ χρυσὸς ὑμῶν καὶ ὁ ἄργυρος κατίωται καὶ ὁ ἰὸς αὐτῶν εἰς μαρτύριον ὑμῖν ἔσται καὶ φάγεται τὰς σάρκας ὑμῶν ὡς πῦρ ἐθησαυρίσατε ἐν ἐσχάταις ἡμέραις',
   'ho chrysos hymōn kai ho argyros katiōtai kai ho ios autōn eis martyrion hymin estai kai phagetai tas sarkas hymōn hōs pyr ethēsaurisate en eschatais hēmerais',
   '''Cankered'' (katiōtai — corroded, rusted over; perfect tense: thoroughly corroded). Gold and silver do not actually rust, but James uses the image of corrosion to show that even the most durable wealth decays when hoarded. ''Rust shall be a witness'' (ios eis martyrion — the corrosion itself will testify against you at the judgment). ''Eat your flesh as fire'' — the corroding wealth will consume them like fire. ''Heaped treasure for the last days'' (ethēsaurisate en eschatais hēmerais — you have stored up treasure in the last days). Grim irony: they think they are saving for the future, but they are stockpiling fuel for judgment.',
   NULL),
  (4,
   'Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of the Lord of sabaoth.',
   'ἰδοὺ ὁ μισθὸς τῶν ἐργατῶν τῶν ἀμησάντων τὰς χώρας ὑμῶν ὁ ἀπεστερημένος ἀφ᾽ ὑμῶν κράζει καὶ αἱ βοαὶ τῶν θερισάντων εἰς τὰ ὦτα κυρίου σαβαὼθ εἰσελήλυθαν',
   'idou ho misthos tōn ergatōn tōn amēsantōn tas chōras hymōn ho apesterēmenos aph'' hymōn krazei kai hai boai tōn therisantōn eis ta ōta kyriou sabaōth eiselēlythan',
   '''Hire'' (misthos — wages, payment due). ''Kept back by fraud'' (apesterēmenos — withheld, defrauded; from apostereō, to rob, to deprive; cf. the eighth commandment). ''Crieth'' (krazei — cries out, shrieks; the stolen wages themselves cry out to God, like Abel''s blood from the ground, Gen 4:10). ''Lord of sabaoth'' (kyriou sabaōth — Lord of hosts, Lord of armies; the most powerful title of God, used in contexts of cosmic authority and judgment). The labourers'' cries have ''entered into'' (eiselēlythan — have gone in and remain in; perfect tense) God''s ears. He has heard, and He will act.',
   NULL),
  (5,
   'Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter.',
   'ἐτρυφήσατε ἐπὶ τῆς γῆς καὶ ἐσπαταλήσατε ἐθρέψατε τὰς καρδίας ὑμῶν ὡς ἐν ἡμέρᾳ σφαγῆς',
   'etryphēsate epi tēs gēs kai espatalēsate ethrepsate tas kardias hymōn hōs en hēmera sphagēs',
   '''Lived in pleasure'' (etryphēsate — lived luxuriously, lived in soft indulgence). ''Wanton'' (espatalēsate — lived in self-indulgence, lived for pleasure; a stronger word than the first). ''Nourished your hearts'' (ethrepsate tas kardias — fattened your hearts, pampered yourselves). ''Day of slaughter'' (hēmera sphagēs — a day of butchering). A devastating image: they have fattened themselves like cattle fattened for the slaughter-day. They think they are feasting; they are actually being prepared for the kill.',
   NULL),
  (6,
   'Ye have condemned and killed the just; and he doth not resist you.',
   'κατεδικάσατε ἐφονεύσατε τὸν δίκαιον οὐκ ἀντιτάσσεται ὑμῖν',
   'katedikasate ephoneusate ton dikaion ouk antitassetai hymin',
   '''Condemned'' (katedikasate — pronounced guilty, passed sentence against). ''Killed'' (ephoneusate — murdered). ''The just'' (ton dikaion — the righteous one; singular, possibly referring to the righteous as a class, or specifically to Jesus Christ, the Just One). ''Doth not resist you'' (ouk antitassetai — does not oppose you, does not fight back). The righteous man does not retaliate against his oppressors. This is both the mark of his righteousness and the measure of their guilt: they kill the defenceless.',
   NULL),
  (7,
   'Be patient therefore, brethren, unto the coming of the Lord. Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain.',
   'Μακροθυμήσατε οὖν ἀδελφοί ἕως τῆς παρουσίας τοῦ κυρίου ἰδοὺ ὁ γεωργὸς ἐκδέχεται τὸν τίμιον καρπὸν τῆς γῆς μακροθυμῶν ἐπ᾽ αὐτῷ ἕως ἂν λάβῃ ὑετὸν πρώϊμον καὶ ὄψιμον',
   'Makrothymēsate oun adelphoi heōs tēs parousias tou kyriou idou ho geōrgos ekdechetai ton timion karpon tēs gēs makrothymōn ep'' autō heōs an labē hyeton prōimon kai opsimon',
   '''Be patient'' (makrothymēsate — have long-endurance, be long-tempered; not passive waiting but active, controlled endurance). ''Coming of the Lord'' (parousias tou kyriou — the arrival, the personal presence of the Lord; the Parousia). ''Husbandman'' (geōrgos — farmer). ''Precious fruit'' (timion karpon — valuable harvest). ''Early and latter rain'' (prōimon kai opsimon — the autumn rain that softens soil for planting, and the spring rain that brings the crop to maturity). The farmer does everything in his power, then waits with patience for what only God can do. So believers: do your part, then wait patiently for Christ''s return.',
   NULL),
  (8,
   'Be ye also patient; stablish your hearts: for the coming of the Lord draweth nigh.',
   'μακροθυμήσατε καὶ ὑμεῖς στηρίξατε τὰς καρδίας ὑμῶν ὅτι ἡ παρουσία τοῦ κυρίου ἤγγικεν',
   'makrothymēsate kai hymeis stērixate tas kardias hymōn hoti hē parousia tou kyriou ēngiken',
   '''Stablish'' (stērixate — strengthen, make firm, fix solidly; from stērizō, to set fast; the same word Jesus used: ''when thou art converted, strengthen thy brethren,'' Luke 22:32). ''Draweth nigh'' (ēngiken — has drawn near, has come close; perfect tense: the coming is near and remains near). The call to patience is paired with the call to inner strength. Patient endurance requires a firm, settled heart — not wavering, not anxious, but fixed on the certainty of Christ''s return.',
   NULL),
  (9,
   'Grudge not one against another, brethren, lest ye be condemned: behold, the judge standeth before the door.',
   'μὴ στενάζετε κατ᾽ ἀλλήλων ἀδελφοί ἵνα μὴ κριθῆτε ἰδοὺ ὁ κριτὴς πρὸ τῶν θυρῶν ἕστηκεν',
   'mē stenazete kat'' allēlōn adelphoi hina mē krithēte idou ho kritēs pro tōn thyrōn hestēken',
   '''Grudge not'' (mē stenazete — do not groan, do not sigh against, do not grumble at one another). ''Condemned'' (krithēte — judged). ''The judge standeth before the door'' (ho kritēs pro tōn thyrōn hestēken — the judge has taken His position at the door; perfect tense: He is standing there now). Suffering can make believers turn on each other. James warns: don''t let the frustration of suffering become bitterness toward your brothers. The Judge is already at the door — be careful how you treat each other.',
   NULL),
  (10,
   'Take, my brethren, the prophets, who have spoken in the name of the Lord, for an example of suffering affliction, and of patience.',
   'ὑπόδειγμα λάβετε ἀδελφοί μου τῆς κακοπαθείας καὶ τῆς μακροθυμίας τοὺς προφήτας οἳ ἐλάλησαν τῷ ὀνόματι κυρίου',
   'hypodeigma labete adelphoi mou tēs kakopatheias kai tēs makrothymias tous prophētas hoi elalēsan tō onomati kyriou',
   '''Example'' (hypodeigma — a pattern, a model to be copied). ''Suffering affliction'' (kakopatheias — endurance of evil, willingness to suffer hardship). ''Patience'' (makrothymias — long-suffering, long-endurance). The prophets who spoke God''s word were invariably persecuted: Isaiah was sawn in two (tradition), Jeremiah was imprisoned, Elijah was hunted. Yet they persevered. They are the pattern: speaking for God and suffering for it, but enduring to the end.',
   NULL),
  (11,
   'Behold, we count them happy which endure. Ye have heard of the patience of Job, and have seen the end of the Lord; that the Lord is very pitiful, and of tender mercy.',
   'ἰδοὺ μακαρίζομεν τοὺς ὑπομένοντας τὴν ὑπομονὴν Ἰὼβ ἠκούσατε καὶ τὸ τέλος κυρίου εἴδετε ὅτι πολύσπλαγχνός ἐστιν ὁ κύριος καὶ οἰκτίρμων',
   'idou makarizomen tous hypomenontas tēn hypomonēn Iōb ēkousate kai to telos kyriou eidete hoti polysplanchnos estin ho kyrios kai oiktirmōn',
   '''Count them happy'' (makarizomen — we call blessed, we pronounce fortunate). ''Endure'' (hypomenontas — those who remain under, who persevere). ''Patience of Job'' (hypomonēn Iōb — Job''s endurance; not passive acceptance but active wrestling with God through suffering while maintaining faith). ''The end of the Lord'' (to telos kyriou — the outcome the Lord brought about; how the Lord ended Job''s story: double restoration, Job 42). ''Very pitiful'' (polysplanchnos — very compassionate, full of tender feeling; from polys, much + splanchna, bowels/inward parts; used only here in the NT). ''Tender mercy'' (oiktirmōn — merciful, compassionate). The point: endure, because God''s story always ends in mercy.',
   'God''s compassionate purpose in suffering: Job''s example teaches that suffering has a divinely appointed end. ''The end of the Lord'' is restoration and mercy. God allowed Job''s suffering but never abandoned him, and the conclusion was greater blessing than the beginning. Suffering is not random; it is purposeful, and God''s character — compassionate and merciful — guarantees a good ending.'),
  (12,
   'But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.',
   'Πρὸ πάντων δέ ἀδελφοί μου μὴ ὀμνύετε μήτε τὸν οὐρανὸν μήτε τὴν γῆν μήτε ἄλλον τινὰ ὅρκον ἤτω δὲ ὑμῶν τὸ ναὶ ναὶ καὶ τὸ οὒ οὔ ἵνα μὴ ὑπὸ κρίσιν πέσητε',
   'Pro pantōn de adelphoi mou mē omnyete mēte ton ouranon mēte tēn gēn mēte allon tina horkon ētō de hymōn to nai nai kai to ou ou hina mē hypo krisin pesēte',
   '''Above all things'' (pro pantōn — before all, of primary importance). ''Swear not'' (mē omnyete — do not take oaths; present imperative: stop swearing). ''Let your yea be yea'' (ētō to nai nai — let your yes be yes). James echoes Jesus''s teaching in Matt 5:34-37. The need for oaths implies that one''s word cannot normally be trusted. The believer''s character should be such that a simple yes or no is sufficient. Integrity of speech makes oaths unnecessary.',
   NULL),
  (13,
   'Is any among you afflicted? let him pray. Is any merry? let him sing psalms.',
   'Κακοπαθεῖ τις ἐν ὑμῖν προσευχέσθω εὐθυμεῖ τις ψαλλέτω',
   'Kakopathei tis en hymin proseuchesthō euthymei tis psalletō',
   '''Afflicted'' (kakopathei — suffering hardship, experiencing evil). ''Pray'' (proseuchesthō — let him pray; the instinctive response to suffering should be prayer, not complaint or despair). ''Merry'' (euthymei — cheerful, in good spirits). ''Sing psalms'' (psalletō — let him sing praise, let him make music; from psallō, to pluck strings, to sing with instrumental accompaniment). James prescribes prayer for every condition: in suffering, pray; in joy, praise. Both suffering and joy should drive us to God.',
   NULL),
  (14,
   'Is any sick among you? let him call for the elders of the church; and let them pray over him, anointing him with oil in the name of the Lord:',
   'ἀσθενεῖ τις ἐν ὑμῖν προσκαλεσάσθω τοὺς πρεσβυτέρους τῆς ἐκκλησίας καὶ προσευξάσθωσαν ἐπ᾽ αὐτὸν ἀλείψαντες αὐτὸν ἐλαίῳ ἐν τῷ ὀνόματι τοῦ κυρίου',
   'asthenei tis en hymin proskalesasthō tous presbyterous tēs ekklēsias kai proseuxasthōsan ep'' auton aleipsantes auton elaiō en tō onomati tou kyriou',
   '''Sick'' (asthenei — is weak, is without strength; can mean physically ill or spiritually weak). ''Call for'' (proskalesasthō — summon to oneself; the sick person takes the initiative). ''Elders'' (presbyterous — the appointed leaders of the church; plural: a plurality of elders, not a single healer). ''Pray over him'' — the emphasis is on prayer, not the oil. ''Anointing with oil'' (aleipsantes elaiō — having rubbed with oil; aleiphō is the ordinary word for anointing/rubbing, not the sacred chriō). Oil was both medicinal (Luke 10:34) and symbolic (of the Holy Spirit). ''In the name of the Lord'' — the authority behind the anointing is Christ''s, not the elders'' or the oil''s.',
   'Prayer for healing: James prescribes a specific practice: (1) the sick person initiates by calling the elders, (2) the elders pray over the person, (3) they anoint with oil in the Lord''s name. The emphasis is on the prayer of faith (v.15), not the oil as a sacrament. The elders represent the community of faith gathered around the suffering member. This passage establishes the church''s ongoing ministry of prayer for the sick.'),
  (15,
   'And the prayer of faith shall save the sick, and the Lord shall raise him up; and if he have committed sins, they shall be forgiven him.',
   'καὶ ἡ εὐχὴ τῆς πίστεως σώσει τὸν κάμνοντα καὶ ἐγερεῖ αὐτὸν ὁ κύριος κἂν ἁμαρτίας ᾖ πεποιηκώς ἀφεθήσεται αὐτῷ',
   'kai hē euchē tēs pisteōs sōsei ton kamnonta kai egerei auton ho kyrios kan hamartias ē pepoiēkōs aphethēsetai autō',
   '''Prayer of faith'' (euchē tēs pisteōs — the prayer characterised by faith, the prayer that trusts God). ''Save'' (sōsei — will deliver, will rescue, will heal; sōzō covers both physical healing and spiritual salvation). ''The sick'' (ton kamnonta — the weary one, the one worn out; from kamnō, to grow weary, to be exhausted by illness). ''The Lord shall raise him up'' (egerei auton ho kyrios — the Lord will lift him up; the healer is Christ, not the elders). ''If he have committed sins'' — the conditional ''if'' (kan) leaves open whether sin is involved; not all sickness is caused by sin, but when it is, forgiveness accompanies healing.',
   NULL),
  (16,
   'Confess your faults one to another, and pray one for another, that ye may be healed. The effectual fervent prayer of a righteous man availeth much.',
   'ἐξομολογεῖσθε ἀλλήλοις τὰς παραπτώματα καὶ εὔχεσθε ὑπὲρ ἀλλήλων ὅπως ἰαθῆτε πολὺ ἰσχύει δέησις δικαίου ἐνεργουμένη',
   'exomologeisthe allēlois tas paraptōmata kai euchesthe hyper allēlōn hopōs iathēte poly ischyei deēsis dikaiou energoumenē',
   '''Confess'' (exomologeisthe — confess openly, acknowledge fully; from ek, out + homologeō, to speak the same word). ''Faults'' (paraptōmata — trespasses, lapses, false steps). ''One to another'' (allēlois — to each other; mutual, reciprocal confession, not auricular confession to a priest). ''Healed'' (iathēte — made whole, cured; can be physical or spiritual healing). ''Effectual fervent prayer'' (deēsis dikaiou energoumenē — the prayer of a righteous person that is working, that is active, that is energised; energoumenē from energeō, to be at work, to operate). The prayer that avails is not casual but earnest, not passive but Spirit-energised.',
   'Mutual confession and prayer: James envisions a community of transparency and mutual care. Confession is not to a priest but to fellow believers. The purpose is healing — of body, soul, and relationships. The power is in prayer, and the prayer that prevails is the earnest, faith-filled prayer of a righteous person. Righteousness here is not sinlessness but right standing with God through faith.'),
  (17,
   'Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.',
   'Ἡλίας ἄνθρωπος ἦν ὁμοιοπαθὴς ἡμῖν καὶ προσευχῇ προσηύξατο τοῦ μὴ βρέξαι καὶ οὐκ ἔβρεξεν ἐπὶ τῆς γῆς ἐνιαυτοὺς τρεῖς καὶ μῆνας ἕξ',
   'Ēlias anthrōpos ēn homoiopathēs hēmin kai proseuchē prosēuxato tou mē brexai kai ouk ebrexen epi tēs gēs eniautous treis kai mēnas hex',
   '''Elias'' (Ēlias — Elijah). ''Subject to like passions'' (homoiopathēs — of similar nature, having the same feelings and weaknesses as we do; from homoios + pathos). This is the point: Elijah was not a superhuman figure but an ordinary man who prayed extraordinarily. ''Prayed earnestly'' (proseuchē prosēuxato — literally ''prayed with prayer,'' a Hebrew intensifying idiom: he prayed intensely, fervently). ''Three years and six months'' (cf. 1 Kings 17:1; Luke 4:25). One man''s prayer shut the sky for three and a half years.',
   NULL),
  (18,
   'And he prayed again, and the heaven gave rain, and the earth brought forth her fruit.',
   'καὶ πάλιν προσηύξατο καὶ ὁ οὐρανὸς ὑετὸν ἔδωκεν καὶ ἡ γῆ ἐβλάστησεν τὸν καρπὸν αὐτῆς',
   'kai palin prosēuxato kai ho ouranos hyeton edōken kai hē gē eblastēsen ton karpon autēs',
   '''Prayed again'' (palin prosēuxato — he prayed a second time; 1 Kings 18:42-45). ''The heaven gave rain'' — Elijah did not control the weather; God did. But God chose to act through the prayers of a man ''of like passions.'' ''The earth brought forth her fruit'' — the full cycle of answered prayer: heaven responds, earth revives, life returns. James''s point: if Elijah''s prayer could shut and open the heavens, how much more should we pray with confidence.',
   NULL),
  (19,
   'Brethren, if any of you do err from the truth, and one convert him;',
   'Ἀδελφοί μου ἐάν τις ἐν ὑμῖν πλανηθῇ ἀπὸ τῆς ἀληθείας καὶ ἐπιστρέψῃ τις αὐτόν',
   'Adelphoi mou ean tis en hymin planēthē apo tēs alētheias kai epistrepsē tis auton',
   '''Err'' (planēthē — wander, go astray; from planaō, to lead off the path; same root as ''planet'' — a wandering star). ''From the truth'' (apo tēs alētheias — away from the truth, both doctrinal and moral). ''Convert'' (epistrepsē — turn back, restore, bring back to the right path). James addresses the situation of a believer who has wandered from the truth. The responsibility falls on ''one'' (tis) — any believer who sees the wandering and acts to restore.',
   NULL),
  (20,
   'Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.',
   'γινωσκέτω ὅτι ὁ ἐπιστρέψας ἁμαρτωλὸν ἐκ πλάνης ὁδοῦ αὐτοῦ σώσει ψυχὴν ἐκ θανάτου καὶ καλύψει πλῆθος ἁμαρτιῶν',
   'ginōsketō hoti ho epistrepsas hamartōlon ek planēs hodou autou sōsei psychēn ek thanatou kai kalypsei plēthos hamartiōn',
   '''Converteth'' (epistrepsas — the one who turns back). ''Sinner'' (hamartōlon — one who misses the mark). ''Error of his way'' (planēs hodou — the wandering of his path). ''Save a soul from death'' (sōsei psychēn ek thanatou — will rescue a life from death; whether physical death as the consequence of sin or spiritual death). ''Hide a multitude of sins'' (kalypsei plēthos hamartiōn — will cover a great number of sins; cf. Prov 10:12; 1 Pet 4:8). The sins covered are the wanderer''s sins — by being restored, his sins are forgiven and covered by grace. The epistle ends not with theology but with pastoral action: go after the lost, bring them back, and in doing so participate in the saving work of God.',
   'Restoring the wanderer: James closes his letter with a call to spiritual rescue. The believer who turns a sinner back from his wandering accomplishes two things: (1) saves a soul from death, and (2) covers a multitude of sins. This is not about earning merit but about participating in God''s redemptive work. The church is to be a community of restoration, where wanderers are pursued and brought back, not abandoned.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'James' AND c.chapter_number = 5;

-- Step 3: Word Studies for key verses

-- Verse 4 (Hire kept back / Lord of sabaoth)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀπεστερημένος', 'apesterēmenos', 'G650', 'Kept back by fraud, withheld, defrauded — from apostereō, to rob, to deprive by deceit. The wages are held back not by poverty but by greed. A violation of Lev 19:13 and Deut 24:14-15.', 1),
  ('σαβαώθ', 'sabaōth', 'G4519', 'Hosts, armies — a Hebrew word transliterated into Greek (from tseba''oth). The "Lord of hosts" commands the armies of heaven. This title appears at moments of cosmic judgment and supreme authority.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 5 AND v.verse_number = 4;

-- Verse 7 (Be patient / coming of the Lord)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μακροθυμήσατε', 'makrothymēsate', 'G3114', 'Be patient, have long-endurance — from makros (long) + thymos (passion, temper). To hold one''s spirit under control through a prolonged trial. Not passive resignation but active, sustained patience.', 1),
  ('παρουσίας', 'parousias', 'G3952', 'Coming, arrival, personal presence — a technical term for the Second Coming of Christ. Originally used for the arrival of a king or dignitary. Christ''s parousia is the blessed hope that motivates patience.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 5 AND v.verse_number = 7;

-- Verse 11 (Patience of Job / very pitiful)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πολύσπλαγχνος', 'polysplanchnos', 'G4184', 'Very compassionate, full of tender mercy — from polys (much) + splanchna (inward parts, bowels). A deeply emotional word: God feels for His suffering people in His inmost being. Used only here in the NT.', 1),
  ('οἰκτίρμων', 'oiktirmōn', 'G3629', 'Merciful, compassionate, full of pity — from oiktirō (to have compassion). Describes God''s active response to human suffering. Cf. Luke 6:36, "Be ye therefore merciful, as your Father also is merciful."', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 5 AND v.verse_number = 11;

-- Verse 16 (Effectual fervent prayer)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνεργουμένη', 'energoumenē', 'G1754', 'Effectual, working, energized — from energeō (to be active, to operate, to produce results). The prayer that avails is not merely spoken but is actively at work, Spirit-empowered, fervent with spiritual energy.', 1),
  ('δέησις', 'deēsis', 'G1162', 'Prayer, supplication, petition — from deomai (to beg, to entreat). A specific, earnest request arising from a felt need. More focused than proseuchē (general prayer); this is prayer born of urgency.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 5 AND v.verse_number = 16;

-- Verse 17 (Elias / like passions)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁμοιοπαθής', 'homoiopathēs', 'G3663', 'Of like nature, subject to the same feelings — from homoios (like) + pathos (experience, feeling). Elijah was not superhuman; he felt fear, discouragement, and weakness just as we do (1 Kings 19:4). Yet his prayer moved heaven.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 5 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Woe to the rich
  (1, 'Luke 6:24', 1), (1, '1 Timothy 6:9-10', 2), (1, 'Amos 6:1', 3),
  -- v4: Hire kept back by fraud
  (4, 'Leviticus 19:13', 1), (4, 'Deuteronomy 24:14-15', 2), (4, 'Malachi 3:5', 3),
  -- v7: Be patient / coming of the Lord
  (7, 'Hebrews 10:36-37', 1), (7, '2 Peter 3:9', 2), (7, 'Deuteronomy 11:14', 3),
  -- v11: Patience of Job
  (11, 'Job 1:21-22', 1), (11, 'Job 42:10-17', 2), (11, 'Psalm 103:8', 3),
  -- v12: Let your yea be yea
  (12, 'Matthew 5:34-37', 1), (12, '2 Corinthians 1:17-18', 2),
  -- v14: Call for the elders / anointing with oil
  (14, 'Mark 6:13', 1), (14, 'Acts 14:23', 2), (14, 'Mark 16:18', 3),
  -- v15: Prayer of faith shall save the sick
  (15, 'Matthew 17:20', 1), (15, 'Mark 11:24', 2), (15, '1 John 5:14-15', 3),
  -- v16: Confess faults / pray for one another
  (16, 'Galatians 6:1-2', 1), (16, '1 John 1:9', 2), (16, 'Proverbs 28:13', 3),
  -- v17: Elijah prayed
  (17, '1 Kings 17:1', 1), (17, '1 Kings 18:42-45', 2), (17, 'Luke 4:25', 3),
  -- v20: Convert a sinner / hide sins
  (20, 'Proverbs 10:12', 1), (20, '1 Peter 4:8', 2), (20, 'Ezekiel 3:18-21', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'James' AND c.chapter_number = 5 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- James Chapter 5 Complete
-- 20 verses · 5 key verses with word studies (10 words)
-- Cross-references for 10 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════