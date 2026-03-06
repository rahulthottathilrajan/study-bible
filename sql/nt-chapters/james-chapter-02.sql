-- ═══════════════════════════════════════════════════
-- JAMES CHAPTER 2 — Faith Without Works Is Dead
-- 26 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'James 2 addresses two interconnected sins that plagued the early church and plague it still: partiality and dead faith. The first half (vv.1-13) confronts the sin of showing favouritism to the rich while despising the poor — a direct violation of the royal law ''Thou shalt love thy neighbour as thyself'' (v.8). James exposes the irony: the rich oppress you, drag you into court, and blaspheme Christ''s name, yet you fawn over them while shoving the poor aside (vv.6-7). He warns that the law is a unity: to break one commandment is to break the whole (v.10). The second half (vv.14-26) contains James''s most famous and most debated teaching: faith without works is dead. Using Abraham and Rahab as examples, James argues that genuine faith always produces action. ''As the body without the spirit is dead, so faith without works is dead also'' (v.26). This is not a contradiction of Paul''s teaching on justification by faith (Rom 3:28) but a complementary perspective: Paul speaks of the root (faith that justifies before God), James of the fruit (works that demonstrate faith before men).',
  'The Royal Law and Living Faith',
  'νεκρά (nekra)',
  'Dead, lifeless, without vitality — faith that produces no works is not merely weak or dormant; it is dead, a corpse. Dead faith cannot save, just as a dead body cannot function.',
  '["No Partiality in the Assembly (vv.1-4): Have not the faith of our Lord Jesus Christ with respect of persons; if there come a man with a gold ring and a poor man in vile raiment and ye have respect to the rich; are ye not partial and become judges of evil thoughts","God Chose the Poor (vv.5-7): Hath not God chosen the poor of this world rich in faith and heirs of the kingdom; do not rich men oppress you and drag you before the judgment seats; do not they blaspheme that worthy name","The Royal Law (vv.8-11): If ye fulfil the royal law Thou shalt love thy neighbour as thyself ye do well; but if ye have respect to persons ye commit sin; whosoever shall keep the whole law and offend in one point he is guilty of all","Mercy Triumphs Over Judgment (vv.12-13): So speak ye and so do as they that shall be judged by the law of liberty; for he shall have judgment without mercy that hath shewed no mercy; mercy rejoiceth against judgment","Faith Without Works Is Dead (vv.14-17): What doth it profit if a man say he hath faith and have not works; can faith save him; if a brother or sister be naked and destitute of daily food and ye say Depart in peace and give them not those things which are needful; what doth it profit; even so faith if it hath not works is dead being alone","The Devils Also Believe (vv.18-20): Thou believest that there is one God; thou doest well; the devils also believe and tremble; wilt thou know O vain man that faith without works is dead","Abraham''s Faith Proven by Works (vv.21-24): Was not Abraham our father justified by works when he had offered Isaac his son upon the altar; seest thou how faith wrought with his works and by works was faith made perfect; the scripture was fulfilled which saith Abraham believed God and it was imputed unto him for righteousness; ye see then how that by works a man is justified and not by faith only","Rahab''s Faith Proven by Works (v.25): Likewise also was not Rahab the harlot justified by works when she had received the messengers and had sent them out another way","Faith Without Works Is Dead (v.26): For as the body without the spirit is dead so faith without works is dead also"]'
FROM books b WHERE b.name = 'James';

-- Step 2: Insert all 26 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'My brethren, have not the faith of our Lord Jesus Christ, the Lord of glory, with respect of persons.',
   'Ἀδελφοί μου μὴ ἐν προσωπολημψίαις ἔχετε τὴν πίστιν τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ τῆς δόξης',
   'Adelphoi mou mē en prosōpolēmpsiais echete tēn pistin tou kyriou hēmōn Iēsou Christou tēs doxēs',
   '''Respect of persons'' (prosōpolēmpsiais — partiality, favouritism, face-receiving; from prosōpon, face + lambanō, to receive; literally ''receiving faces'' — judging by outward appearance). ''The Lord of glory'' (tēs doxēs — an extraordinary title: Jesus Christ is the glory itself). The logic: if you hold faith in the Lord of glory — who took the form of a servant and was born in a stable — you cannot simultaneously judge people by their outward appearance. Partiality contradicts the very nature of the Christ you claim to follow.',
   NULL),
  (2,
   'For if there come unto your assembly a man with a gold ring, in goodly apparel, and there come in also a poor man in vile raiment;',
   'ἐὰν γὰρ εἰσέλθῃ εἰς τὴν συναγωγὴν ὑμῶν ἀνὴρ χρυσοδακτύλιος ἐν ἐσθῆτι λαμπρᾷ εἰσέλθῃ δὲ καὶ πτωχὸς ἐν ῥυπαρᾷ ἐσθῆτι',
   'ean gar eiselthē eis tēn synagōgēn hymōn anēr chrysodaktylios en esthēti lampra eiselthē de kai ptōchos en rhypara esthēti',
   '''Assembly'' (synagōgēn — literally synagogue; James uses the Jewish term, indicating his audience is Jewish Christian). ''Gold ring'' (chrysodaktylios — gold-fingered, wearing gold rings; a mark of the equestrian class in Rome). ''Goodly apparel'' (esthēti lampra — bright, splendid clothing). ''Poor man'' (ptōchos — a beggar, one who crouches and cringes; the lowest level of poverty). ''Vile raiment'' (rhypara esthēti — filthy, dirty clothing; rhyparos, from rhypos, filth). James paints a vivid scene: two visitors enter, one dripping with wealth, the other in rags.',
   NULL),
  (3,
   'And ye have respect to him that weareth the gay clothing, and say unto him, Sit thou here in a good place; and say to the poor, Stand thou there, or sit here under my footstool:',
   'καὶ ἐπιβλέψητε ἐπὶ τὸν φοροῦντα τὴν ἐσθῆτα τὴν λαμπρὰν καὶ εἴπητε αὐτῷ σὺ κάθου ὧδε καλῶς καὶ τῷ πτωχῷ εἴπητε σὺ στῆθι ἐκεῖ ἢ κάθου ὧδε ὑπὸ τὸ ὑποπόδιόν μου',
   'kai epiblepsēte epi ton phorounta tēn esthēta tēn lampran kai eipēte autō sy kathou hōde kalōs kai tō ptōchō eipēte sy stēthi ekei ē kathou hōde hypo to hypopodion mou',
   '''Have respect'' (epiblepsēte — look upon with special attention, show favour by looking). The rich man: ''Sit thou here in a good place'' (kathou hōde kalōs — sit here, please, in this fine seat). The poor man: ''Stand thou there'' (stēthi ekei — stand over there) or ''sit here under my footstool'' (kathou hypo to hypopodion — sit on the floor at my feet). The contrast is devastating: the rich get the seat of honour; the poor get the floor or told to stand like a servant.',
   NULL),
  (4,
   'Are ye not then partial in yourselves, and are become judges of evil thoughts?',
   'οὐ διεκρίθητε ἐν ἑαυτοῖς καὶ ἐγένεσθε κριταὶ διαλογισμῶν πονηρῶν',
   'ou diekrithēte en heautois kai egenesthe kritai dialogismōn ponērōn',
   '''Partial'' (diekrithēte — divided, discriminated; from diakrinō, to judge between; you have made distinctions based on wrong criteria). ''Judges of evil thoughts'' (kritai dialogismōn ponērōn — judges characterised by wicked reasoning). By seating the rich in honour and the poor on the floor, they have become corrupt judges whose reasoning is evil. The church assembly should reflect heaven''s values, not the world''s hierarchy.',
   NULL),
  (5,
   'Hearken, my beloved brethren, Hath not God chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?',
   'ἀκούσατε ἀδελφοί μου ἀγαπητοί οὐχ ὁ θεὸς ἐξελέξατο τοὺς πτωχοὺς τοῦ κόσμου τούτου πλουσίους ἐν πίστει καὶ κληρονόμους τῆς βασιλείας ἧς ἐπηγγείλατο τοῖς ἀγαπῶσιν αὐτόν',
   'akousate adelphoi mou agapētoi ouch ho theos exelexato tous ptōchous tou kosmou toutou plousious en pistei kai klēronomous tēs basileias hēs epēngeilato tois agapōsin auton',
   '''Chosen'' (exelexato — selected for himself, chose; God''s sovereign election). ''Poor of this world'' — poor by the world''s standard. ''Rich in faith'' — wealthy in the currency that matters. ''Heirs of the kingdom'' (klēronomous tēs basileias — inheritors of the kingdom). God''s value system inverts the world''s: the poor are chosen, the faith-rich are the true wealthy, and kingdom heirs are the real aristocracy. To despise the poor is to despise God''s chosen ones.',
   'God''s election of the poor: This does not teach that all poor people are saved or that wealth excludes salvation. It teaches that God characteristically chooses those the world despises (cf. 1 Cor 1:26-29). The poor are more likely to be ''rich in faith'' because they have nothing else to rely on. Favouring the rich dishonours the very people God has favoured.'),
  (6,
   'But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?',
   'ὑμεῖς δὲ ἠτιμάσατε τὸν πτωχόν οὐχ οἱ πλούσιοι καταδυναστεύουσιν ὑμῶν καὶ αὐτοὶ ἕλκουσιν ὑμᾶς εἰς κριτήρια',
   'hymeis de ētimasate ton ptōchon ouch hoi plousioi katadynasteuousin hymōn kai autoi helkousin hymas eis kritēria',
   '''Despised'' (ētimasate — dishonoured, treated with contempt). ''Oppress'' (katadynasteuousin — lord it over, exercise power against, tyrannise). ''Draw'' (helkousin — drag, haul; the same word used of dragging Paul out of the temple, Acts 21:30). ''Judgment seats'' (kritēria — courts of law). The irony: you fawn over the rich who are oppressing you, suing you, and dragging you into court. You honour those who dishonour you and dishonour those whom God honours.',
   NULL),
  (7,
   'Do not they blaspheme that worthy name by the which ye are called?',
   'οὐκ αὐτοὶ βλασφημοῦσιν τὸ καλὸν ὄνομα τὸ ἐπικληθὲν ἐφ᾽ ὑμᾶς',
   'ouk autoi blasphēmousin to kalon onoma to epiklēthen eph'' hymas',
   '''Blaspheme'' (blasphēmousin — speak evil of, revile, defame). ''That worthy name'' (to kalon onoma — the beautiful name, the noble name, the good name). ''By the which ye are called'' (to epiklēthen eph'' hymas — the name called upon you, the name you bear). The ''worthy name'' is the name of Christ — the name invoked at baptism, the name believers wear. The rich blaspheme the very name that defines your identity, and yet you give them the seat of honour.',
   NULL),
  (8,
   'If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well:',
   'εἰ μέντοι νόμον τελεῖτε βασιλικὸν κατὰ τὴν γραφήν ἀγαπήσεις τὸν πλησίον σου ὡς σεαυτόν καλῶς ποιεῖτε',
   'ei mentoi nomon teleite basilikon kata tēn graphēn agapēseis ton plēsion sou hōs seauton kalōs poieite',
   '''Royal law'' (nomon basilikon — the kingly law, the law belonging to the King; basilikos from basileus, king). This is Leviticus 19:18, which Jesus called the second greatest commandment (Matt 22:39). ''Royal'' because it is the king of all laws, summarising all duties to one''s neighbour, and because it is the law of the King, Jesus Christ. If you claim to obey this law, you cannot show partiality — for partiality violates love of neighbour.',
   NULL),
  (9,
   'But if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors.',
   'εἰ δὲ προσωπολημπτεῖτε ἁμαρτίαν ἐργάζεσθε ἐλεγχόμενοι ὑπὸ τοῦ νόμου ὡς παραβάται',
   'ei de prosōpolēmpteite hamartian ergazesthe elenchomenoi hypo tou nomou hōs parabatai',
   '''Respect to persons'' (prosōpolēmpteite — show favouritism, receive faces). ''Commit sin'' (hamartian ergazesthe — you work sin, you produce sin; not a minor fault but an active transgression). ''Convinced'' (elenchomenoi — convicted, exposed, reproved by the law). ''Transgressors'' (parabatai — law-breakers, those who step over the line). Partiality is not a social preference; it is sin — a violation of the royal law of love.',
   NULL),
  (10,
   'For whosoever shall keep the whole law, and yet offend in one point, he is guilty of all.',
   'ὅστις γὰρ ὅλον τὸν νόμον τηρήσῃ πταίσῃ δὲ ἐν ἑνί γέγονεν πάντων ἔνοχος',
   'hostis gar holon ton nomon tērēsē ptaisē de en heni gegonen pantōn enochos',
   '''Keep the whole law'' (holon ton nomon tērēsē — guard the entire law). ''Offend in one point'' (ptaisē en heni — stumble in one thing, trip over one commandment). ''Guilty of all'' (pantōn enochos — liable for all, guilty of the whole). The law is a unity — one Lawgiver, one law. To break one commandment is to offend the Lawgiver of all. A chain with one broken link is a broken chain. This does not mean all sins are equal in consequence, but that any sin makes one a lawbreaker.',
   'The unity of the law: James teaches that God''s law is an indivisible whole. One cannot pick and choose which commandments to obey. The person who never murders but shows partiality has still broken God''s law. This principle drives us to grace: since no one can keep the whole law perfectly, all stand guilty and in need of mercy (v.13).'),
  (11,
   'For he that said, Do not commit adultery, said also, Do not kill. Now if thou commit no adultery, yet if thou kill, thou art become a transgressor of the law.',
   'ὁ γὰρ εἰπών μὴ μοιχεύσῃς εἶπεν καὶ μὴ φονεύσῃς εἰ δὲ οὐ μοιχεύεις φονεύεις δέ γέγονας παραβάτης νόμου',
   'ho gar eipōn mē moicheusēs eipen kai mē phoneusēs ei de ou moicheueis phoneueis de gegonas parabatēs nomou',
   '''He that said'' (ho eipōn — the one who spoke; the single Lawgiver behind all commandments). James cites the sixth and seventh commandments to illustrate the unity principle. The same God who said ''Do not commit adultery'' also said ''Do not kill.'' If you keep one but break the other, you are still a transgressor (parabatēs nomou — a law-breaker). The focus is on the Lawgiver, not the individual laws.',
   NULL),
  (12,
   'So speak ye, and so do, as they that shall be judged by the law of liberty.',
   'οὕτως λαλεῖτε καὶ οὕτως ποιεῖτε ὡς διὰ νόμου ἐλευθερίας μέλλοντες κρίνεσθαι',
   'houtōs laleite kai houtōs poieite hōs dia nomou eleutherias mellontes krinesthai',
   '''So speak and so do'' — both speech and action must align with the law of liberty. ''Law of liberty'' (nomou eleutherias — the law belonging to freedom; cf. 1:25). This is the gospel law — not the Mosaic code of external regulation but the new covenant law written on the heart, which liberates rather than enslaves. Yet it is still law, and there will be judgment according to it. Freedom is not licence; it is empowered obedience.',
   NULL),
  (13,
   'For he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment.',
   'ἡ γὰρ κρίσις ἀνέλεος τῷ μὴ ποιήσαντι ἔλεος κατακαυχᾶται ἔλεος κρίσεως',
   'hē gar krisis aneleos tō mē poiēsanti eleos katakauchatai eleos kriseōs',
   '''Judgment without mercy'' (krisis aneleos — merciless judgment). ''To him that hath shewed no mercy'' (tō mē poiēsanti eleos — to the one who has not done mercy, who has not practised mercy). ''Mercy rejoiceth against judgment'' (katakauchatai eleos kriseōs — mercy triumphs over judgment, mercy boasts over judgment, mercy wins). The merciless will face merciless judgment. But for those who have shown mercy, mercy will triumph at the judgment seat — not because mercy earns salvation but because mercy is the evidence of a heart transformed by grace.',
   'Mercy triumphs over judgment: This principle echoes Jesus''s teaching (Matt 5:7, ''Blessed are the merciful''; Matt 6:14-15, forgiveness received requires forgiveness given). Mercy shown to others is evidence of mercy received from God. At the final judgment, the merciful will find mercy prevailing over the strict demands of justice — not because of merit but because mercy is the fruit of saving faith.'),
  (14,
   'What doth it profit, my brethren, though a man say he hath faith, and have not works? can faith save him?',
   'Τί τὸ ὄφελος ἀδελφοί μου ἐὰν πίστιν λέγῃ τις ἔχειν ἔργα δὲ μὴ ἔχῃ μὴ δύναται ἡ πίστις σῶσαι αὐτόν',
   'Ti to ophelos adelphoi mou ean pistin legē tis echein erga de mē echē mē dynatai hē pistis sōsai auton',
   '''What doth it profit'' (ti to ophelos — what is the benefit, what is the use). ''Say he hath faith'' (legē tis echein — a man claims to have; note ''say'' — the issue is claimed faith, professed faith). ''Can faith save him?'' (mē dynatai hē pistis sōsai auton — the ''mē'' expects a negative answer: this kind of faith cannot save). The definite article ''the'' (hē pistis) is crucial: can that faith — the faith just described, the faith of mere words without works — save him? Answer: no. James is not attacking genuine faith but empty profession.',
   'Faith and works: James does not contradict Paul. Paul asks: ''How is a person justified before God?'' Answer: by faith alone (Rom 3:28). James asks: ''How is genuine faith recognised?'' Answer: by its works. Paul speaks of the root; James of the fruit. Paul combats legalism (thinking works earn salvation); James combats antinomianism (thinking faith requires no obedience). Both agree: saving faith produces works.'),
  (15,
   'If a brother or sister be naked, and destitute of daily food,',
   'ἐὰν δὲ ἀδελφὸς ἢ ἀδελφὴ γυμνοὶ ὑπάρχωσιν καὶ λειπόμενοι ὦσιν τῆς ἐφημέρου τροφῆς',
   'ean de adelphos ē adelphē gymnoi hyparchōsin kai leipomenoi ōsin tēs ephēmerou trophēs',
   '''Brother or sister'' (adelphos ē adelphē — a fellow believer, male or female). ''Naked'' (gymnoi — poorly clothed, lacking adequate clothing). ''Destitute of daily food'' (leipomenoi tēs ephēmerou trophēs — lacking day-by-day food, without sustenance for today). James gives a concrete example of faith-without-works: a fellow Christian is in desperate need — not merely inconvenienced but lacking the basics of clothing and food.',
   NULL),
  (16,
   'And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?',
   'εἴπῃ δέ τις αὐτοῖς ἐξ ὑμῶν ὑπάγετε ἐν εἰρήνῃ θερμαίνεσθε καὶ χορτάζεσθε μὴ δῶτε δὲ αὐτοῖς τὰ ἐπιτήδεια τοῦ σώματος τί τὸ ὄφελος',
   'eipē de tis autois ex hymōn hypagete en eirēnē thermainēsthe kai chortazesthe mē dōte de autois ta epitēdeia tou sōmatos ti to ophelos',
   '''Depart in peace'' (hypagete en eirēnē — go in peace; a standard dismissal blessing). ''Be warmed and filled'' (thermainēsthe kai chortazesthe — warm yourselves and satisfy yourselves; passive: be warmed, be filled — by someone else? by God? by themselves?). The words are pious-sounding but empty. No clothing is given, no food is offered. ''What doth it profit?'' (ti to ophelos — what good is it?). Pious words without practical help are worthless. So is faith without works.',
   NULL),
  (17,
   'Even so faith, if it hath not works, is dead, being alone.',
   'οὕτως καὶ ἡ πίστις ἐὰν μὴ ἔργα ἔχῃ νεκρά ἐστιν καθ᾽ ἑαυτήν',
   'houtōs kai hē pistis ean mē erga echē nekra estin kath'' heautēn',
   '''Dead'' (nekra — dead, lifeless, a corpse). ''Being alone'' (kath'' heautēn — by itself, on its own, in isolation). The analogy: as words without action are empty (vv.15-16), so faith without works is dead. Not weak, not sleeping, not incomplete — dead. A dead faith is not a different degree of faith; it is not faith at all, just as a corpse is not a different degree of life. The test of faith''s reality is its fruit.',
   NULL),
  (18,
   'Yea, a man may say, Thou hast faith, and I have works: shew me thy faith without thy works, and I will shew thee my faith by my works.',
   'ἀλλ᾽ ἐρεῖ τις σὺ πίστιν ἔχεις κἀγὼ ἔργα ἔχω δεῖξόν μοι τὴν πίστιν σου ἐκ τῶν ἔργων σου κἀγώ σοι δείξω ἐκ τῶν ἔργων μου τὴν πίστιν μου',
   'all'' erei tis sy pistin echeis kagō erga echō deixon moi tēn pistin sou ek tōn ergōn sou kagō soi deixō ek tōn ergōn mou tēn pistin mou',
   '''Shew me'' (deixon moi — demonstrate, prove, make visible). James challenges: show me your faith apart from works — it cannot be done. Faith is invisible; works make it visible. ''I will shew thee my faith by my works'' — my works are the evidence, the proof, the demonstration of my faith. Faith is the root; works are the fruit. You can see the fruit; the root is underground. But no fruit means no root.',
   NULL),
  (19,
   'Thou believest that there is one God; thou doest well: the devils also believe, and tremble.',
   'σὺ πιστεύεις ὅτι ὁ θεός εἷς ἐστιν καλῶς ποιεῖς καὶ τὰ δαιμόνια πιστεύουσιν καὶ φρίσσουσιν',
   'sy pisteueis hoti ho theos heis estin kalōs poieis kai ta daimonia pisteuousin kai phrissousin',
   '''Thou believest there is one God'' — the Shema (Deut 6:4), the foundational confession of Jewish faith. ''Thou doest well'' (kalōs poieis — fine, good for you; dripping with irony). ''The devils also believe'' (ta daimonia pisteuousin — the demons also have intellectual assent to this truth). ''And tremble'' (phrissousin — shudder, bristle with horror; the hair-raising dread of those who know God is real but have no saving relationship). Mere intellectual belief — affirming correct doctrine — is the faith of demons. Saving faith goes beyond assent to trust and obedience.',
   'Demonic faith: The demons'' faith is orthodoxy without transformation. They believe the right doctrine (monotheism) but are unchanged by it. This devastating example proves that intellectual assent alone is not saving faith. True faith involves knowledge (the mind), assent (the will), and trust (the heart) — and trust always produces obedience.'),
  (20,
   'But wilt thou know, O vain man, that faith without works is dead?',
   'θέλεις δὲ γνῶναι ὦ ἄνθρωπε κενέ ὅτι ἡ πίστις χωρὶς τῶν ἔργων νεκρά ἐστιν',
   'theleis de gnōnai ō anthrōpe kene hoti hē pistis chōris tōn ergōn nekra estin',
   '''Vain'' (kene — empty, hollow, without content; the same word Paul uses in 1 Cor 15:14 for a faith that is ''vain'' if Christ is not risen). ''Faith without works'' (hē pistis chōris tōn ergōn — faith apart from works, faith separated from works). ''Dead'' (nekra — lifeless). James addresses the hypothetical objector as ''empty man'' — a man whose faith is as empty as his works are absent.',
   NULL),
  (21,
   'Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?',
   'Ἀβραὰμ ὁ πατὴρ ἡμῶν οὐκ ἐξ ἔργων ἐδικαιώθη ἀνενέγκας Ἰσαὰκ τὸν υἱὸν αὐτοῦ ἐπὶ τὸ θυσιαστήριον',
   'Abraam ho patēr hēmōn ouk ex ergōn edikaiōthē anenénkas Isaak ton huion autou epi to thysiastērion',
   '''Justified by works'' (ex ergōn edikaiōthē — declared righteous on the basis of works). ''When he had offered Isaac'' (anenénkas — having offered up, having brought up upon the altar; Gen 22). James''s point is not that Abraham earned righteousness by this act but that this act proved the reality of a faith that already existed. Abraham was credited righteous by faith in Genesis 15:6 (v.23); the offering of Isaac in Genesis 22 was the demonstration, decades later, of that living faith.',
   'Abraham''s justification: James and Paul both cite Abraham but at different points. Paul cites Gen 15:6 — Abraham believed and was counted righteous (before circumcision, before Isaac). James cites Gen 22 — Abraham''s faith was demonstrated by offering Isaac. Paul speaks of justification before God (by faith); James speaks of justification before men (shown by works). There is no contradiction: faith that justified Abraham also moved him to obey.'),
  (22,
   'Seest thou how faith wrought with his works, and by works was faith made perfect?',
   'βλέπεις ὅτι ἡ πίστις συνήργει τοῖς ἔργοις αὐτοῦ καὶ ἐκ τῶν ἔργων ἡ πίστις ἐτελειώθη',
   'blepeis hoti hē pistis synērgei tois ergois autou kai ek tōn ergōn hē pistis eteleiōthē',
   '''Wrought with'' (synērgei — worked together with, cooperated with; from syn + ergon, working together). Faith and works are not opponents but partners. ''Made perfect'' (eteleiōthē — brought to completion, brought to its intended goal; from teleioō, to complete). Faith was the seed; works were the full-grown plant. Works did not create faith but completed it — brought it to its full expression. Abraham''s faith was real in Gen 15; it was demonstrated to be real in Gen 22.',
   NULL),
  (23,
   'And the scripture was fulfilled which saith, Abraham believed God, and it was imputed unto him for righteousness: and he was called the Friend of God.',
   'καὶ ἐπληρώθη ἡ γραφὴ ἡ λέγουσα ἐπίστευσεν δὲ Ἀβραὰμ τῷ θεῷ καὶ ἐλογίσθη αὐτῷ εἰς δικαιοσύνην καὶ φίλος θεοῦ ἐκλήθη',
   'kai eplērōthē hē graphē hē legousa episteusen de Abraam tō theō kai elogisthē autō eis dikaiosynēn kai philos theou eklēthē',
   '''Fulfilled'' (eplērōthē — filled up, brought to full meaning). ''Abraham believed God'' (episteusen Abraam tō theō — Gen 15:6; the foundational text of justification by faith). ''Imputed'' (elogisthē — reckoned, credited, counted to his account; a bookkeeping term). ''Friend of God'' (philos theou — a title found in 2 Chr 20:7 and Isa 41:8). The offering of Isaac ''fulfilled'' — filled full the meaning of — the earlier declaration of faith. Gen 15:6 was not contradicted by Gen 22 but confirmed by it.',
   NULL),
  (24,
   'Ye see then how that by works a man is justified, and not by faith only.',
   'ὁρᾶτε τοίνυν ὅτι ἐξ ἔργων δικαιοῦται ἄνθρωπος καὶ οὐκ ἐκ πίστεως μόνον',
   'horate toinyn hoti ex ergōn dikaioutai anthrōpos kai ouk ek pisteōs monon',
   '''Ye see'' (horate — you perceive, observe). ''By works a man is justified'' — justified in the sense of demonstrated, vindicated, shown to be righteous. ''Not by faith only'' (ouk ek pisteōs monon — not by faith alone, not by a faith that is alone). The key word is ''only'' (monon): James does not say ''not by faith'' but ''not by faith only'' — not by a faith that stands alone, a faith without works. Saving faith is never alone; it is always accompanied by works.',
   'Justification by works: James uses ''justified'' (dikaioutai) in the sense of ''demonstrated to be righteous'' or ''vindicated.'' Paul uses the same word in the sense of ''declared righteous before God.'' James opposes a dead, workless faith — not faith itself. Both agree: we are saved by faith alone, but the faith that saves is never alone.'),
  (25,
   'Likewise also was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?',
   'ὁμοίως δὲ καὶ Ῥαὰβ ἡ πόρνη οὐκ ἐξ ἔργων ἐδικαιώθη ὑποδεξαμένη τοὺς ἀγγέλους καὶ ἑτέρᾳ ὁδῷ ἐκβαλοῦσα',
   'homoiōs de kai Rhaab hē pornē ouk ex ergōn edikaiōthē hypodexamenē tous angelous kai hetera hodō ekbalousa',
   '''Likewise'' (homoiōs — in the same manner). ''Rahab the harlot'' (Rhaab hē pornē — Josh 2:1-21; Heb 11:31). A second example, chosen for maximum contrast with Abraham: he was the father of the faithful, she was a pagan prostitute; he was a man, she was a woman; he was righteous, she was a sinner. Yet both demonstrated faith by works. Rahab ''received the messengers'' (hid the Israelite spies) and ''sent them out another way'' (helped them escape). Her faith in Israel''s God (Josh 2:11) was proven by her risky action.',
   NULL),
  (26,
   'For as the body without the spirit is dead, so faith without works is dead also.',
   'ὥσπερ γὰρ τὸ σῶμα χωρὶς πνεύματος νεκρόν ἐστιν οὕτως καὶ ἡ πίστις χωρὶς τῶν ἔργων νεκρά ἐστιν',
   'hōsper gar to sōma chōris pneumatos nekron estin houtōs kai hē pistis chōris tōn ergōn nekra estin',
   '''The body without the spirit'' (to sōma chōris pneumatos — the body apart from the spirit/breath). ''Dead'' (nekron — a corpse). ''Faith without works'' (hē pistis chōris tōn ergōn). The final, devastating analogy: a body without breath is a corpse. Faith without works is a corpse. Works are to faith what breath is to the body — the evidence of life. If works are absent, faith is not dormant but dead. This is the conclusion that frames the entire chapter: genuine faith lives, and its life is visible in works.',
   'Faith as a living reality: James concludes with a perfect analogy. The relationship of works to faith is like the relationship of spirit/breath to body. The spirit does not create the body, but the body without the spirit is dead. Works do not create faith, but faith without works is dead. This is the final word: faith is a living reality that manifests in obedient action, or it is not faith at all.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'James' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 1 (Respect of persons)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προσωπολημψίαις', 'prosōpolēmpsiais', 'G4382', 'Partiality, respect of persons, favouritism — from prosōpon (face) + lambanō (to receive). Literally "face-receiving," judging by outward appearance. Condemned throughout Scripture (Deut 1:17; Acts 10:34; Rom 2:11).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = 1;

-- Verse 8 (Royal law)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βασιλικόν', 'basilikon', 'G937', 'Royal, kingly, belonging to the king — from basileus (king). The royal law is the supreme law of love (Lev 19:18), the law that rules over all other laws, given by the King of kings Himself.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = 8;

-- Verse 13 (Mercy rejoiceth against judgment)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατακαυχᾶται', 'katakauchatai', 'G2620', 'Triumphs over, boasts against, exults over — from kata (against, over) + kauchaomai (to boast). Mercy boasts victoriously over judgment. For the merciful, mercy wins the final verdict.', 1),
  ('ἔλεος', 'eleos', 'G1656', 'Mercy, compassion, pity — the disposition to show kindness to those in distress. God''s mercy is the model (Eph 2:4); our mercy to others reflects the mercy we have received.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = 13;

-- Verse 17 (Faith without works is dead)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('νεκρά', 'nekra', 'G3498', 'Dead, lifeless, without breath — a corpse. Faith without works is not merely weak or dormant; it is dead. Dead faith is not a lower grade of genuine faith; it is no faith at all.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = 17;

-- Verse 19 (Devils believe and tremble)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φρίσσουσιν', 'phrissousin', 'G5425', 'Tremble, shudder, bristle with horror — the involuntary physical response of dread. The demons know God is real and shudder; yet their orthodox belief does not save them. Intellectual assent without trust and obedience is demonic faith.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = 19;

-- Verse 23 (Abraham believed God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐλογίσθη', 'elogisthē', 'G3049', 'Was reckoned, was credited, was imputed — from logizomai, a bookkeeping term meaning to put to one''s account. God credited Abraham''s faith as righteousness. The same verb Paul uses in Romans 4:3.', 1),
  ('φίλος', 'philos', 'G5384', 'Friend — one who is dear, beloved, an intimate companion. Abraham was called "Friend of God" (2 Chr 20:7; Isa 41:8) — the supreme expression of covenant relationship.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: No respect of persons
  (1, 'Acts 10:34', 1), (1, 'Romans 2:11', 2), (1, 'Deuteronomy 1:17', 3),
  -- v5: God chose the poor
  (5, '1 Corinthians 1:26-29', 1), (5, 'Luke 6:20', 2), (5, 'Matthew 5:3', 3),
  -- v8: Royal law — love thy neighbour
  (8, 'Leviticus 19:18', 1), (8, 'Matthew 22:39', 2), (8, 'Romans 13:8-10', 3),
  -- v10: Offend in one point guilty of all
  (10, 'Galatians 3:10', 1), (10, 'Deuteronomy 27:26', 2), (10, 'Matthew 5:19', 3),
  -- v13: Mercy rejoiceth against judgment
  (13, 'Matthew 5:7', 1), (13, 'Matthew 6:14-15', 2), (13, 'Micah 6:8', 3),
  -- v14: Faith without works
  (14, 'Matthew 7:21', 1), (14, '1 John 3:17-18', 2), (14, 'Titus 1:16', 3),
  -- v19: Devils believe and tremble
  (19, 'Deuteronomy 6:4', 1), (19, 'Mark 1:24', 2), (19, 'Mark 5:7', 3),
  -- v21: Abraham justified by works
  (21, 'Genesis 22:1-14', 1), (21, 'Hebrews 11:17-19', 2), (21, 'Romans 4:2-3', 3),
  -- v23: Abraham believed God
  (23, 'Genesis 15:6', 1), (23, 'Romans 4:3', 2), (23, '2 Chronicles 20:7', 3),
  -- v24: Not by faith only
  (24, 'Romans 3:28', 1), (24, 'Galatians 2:16', 2), (24, 'Ephesians 2:8-10', 3),
  -- v25: Rahab justified
  (25, 'Joshua 2:1-21', 1), (25, 'Hebrews 11:31', 2), (25, 'Joshua 6:25', 3),
  -- v26: Body without spirit is dead
  (26, 'Galatians 5:6', 1), (26, '1 John 3:14', 2), (26, 'Revelation 3:1', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'James' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- James Chapter 2 Complete
-- 26 verses · 7 key verses with word studies (10 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════