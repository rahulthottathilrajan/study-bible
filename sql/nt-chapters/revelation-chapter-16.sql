-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 16 — The Seven Bowls of God's Wrath
-- 21 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 16,
  'Revelation 16 records the outpouring of the seven bowls of God''s wrath, the climactic and most intense judgments of the book. Unlike the seals and trumpets (which affected portions), the bowls fall in rapid succession upon the earth, sea, rivers, sun, the throne of the beast, the Euphrates, and the air — striking everything Babylon trusted in. The plagues echo and intensify the Egyptian plagues of Exodus, drawing the parallel between Pharaoh''s hardened rebellion and the unrepentant world that worships the beast. Three unclean spirits gather the kings of the earth to Armageddon. The chapter closes with the seventh bowl and the divine declaration ''It is done,'' announcing the collapse of Babylon and the great earthquake that levels the cities of the nations.',
  'The Seven Bowls of God''s Wrath',
  'φιάλη (phialē)',
  'A wide, shallow bowl used in temple ritual. The seven angels do not pour drop by drop but tip the contents out completely — the bowls communicate the suddenness, totality, and concentration of final judgment. Whereas the seals and trumpets affect a third, the bowls strike all without restraint.',
  '["Section 1 (vv.1-2): Bowl 1 — Sores on Worshipers of the Beast","Section 2 (v.3): Bowl 2 — The Sea Turned to Blood","Section 3 (vv.4-7): Bowl 3 — Rivers and Springs to Blood; Vindication of God''s Justice","Section 4 (vv.8-9): Bowl 4 — Scorching Heat from the Sun","Section 5 (vv.10-11): Bowl 5 — Darkness on the Beast''s Throne","Section 6 (vv.12-16): Bowl 6 — Euphrates Dried Up; Gathering at Armageddon","Section 7 (vv.17-21): Bowl 7 — Air, Earthquake, Hail; ''It Is Done'' "]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I heard a great voice out of the temple saying to the seven angels, Go your ways, and pour out the vials of the wrath of God upon the earth.',
   'Καὶ ἤκουσα φωνῆς μεγάλης ἐκ τοῦ ναοῦ λεγούσης τοῖς ἑπτὰ ἀγγέλοις· Ὑπάγετε καὶ ἐκχέετε τὰς ἑπτὰ φιάλας τοῦ θυμοῦ τοῦ Θεοῦ εἰς τὴν γῆν.',
   'Kai ēkousa phōnēs megalēs ek tou naou legousēs tois hepta angelois; Hypagete kai ekcheete tas hepta phialas tou thymou tou Theou eis tēn gēn.',
   'Since no one could enter the temple (15:8), the voice must be God''s own. The command ''pour out'' (ἐκχέετε) recalls Old Testament wrath imagery (Ps 69:24; Jer 10:25; Ezek 22:31). The bowls are tipped — the contents discharged at once, not metered.',
   'Final wrath proceeds directly from God Himself. There is no intermediary appeal during these judgments; the time of intercession (15:8) has paused. God''s sovereignty is absolute and unmediated in this final phase.'),
  (2,
   'And the first went, and poured out his vial upon the earth; and there fell a noisome and grievous sore upon the men which had the mark of the beast, and upon them which worshipped his image.',
   'Καὶ ἀπῆλθεν ὁ πρῶτος καὶ ἐξέχεεν τὴν φιάλην αὐτοῦ εἰς τὴν γῆν, καὶ ἐγένετο ἕλκος κακὸν καὶ πονηρὸν ἐπὶ τοὺς ἀνθρώπους τοὺς ἔχοντας τὸ χάραγμα τοῦ θηρίου καὶ τοὺς προσκυνοῦντας τῇ εἰκόνι αὐτοῦ.',
   'Kai apēlthen ho prōtos kai exechen tēn phialēn autou eis tēn gēn, kai egeneto helkos kakon kai ponēron epi tous anthrōpous tous echontas to charagma tou thēriou kai tous proskynountas tē eikoni autou.',
   '''Sores'' (ἕλκος, ulcerous wounds) recall the sixth Egyptian plague (Exod 9:8-11) — the same Greek word in the Septuagint. The judgment is targeted: only those with the mark are afflicted, demonstrating the purposeful precision of God''s wrath. The mark on the body becomes a mark of suffering on the body.',
   'God''s judgments are discriminating. Allegiance to the beast brings personalized consequence; allegiance to the Lamb brings personalized protection. The visible mark of rebellion attracts the visible mark of wrath.'),
  (3,
   'And the second angel poured out his vial upon the sea; and it became as the blood of a dead man: and every living soul died in the sea.',
   'Καὶ ὁ δεύτερος ἐξέχεεν τὴν φιάλην αὐτοῦ εἰς τὴν θάλασσαν, καὶ ἐγένετο αἷμα ὡς νεκροῦ, καὶ πᾶσα ψυχὴ ζωῆς ἀπέθανεν ἐν τῇ θαλάσσῃ.',
   'Kai ho deuteros exechen tēn phialēn autou eis tēn thalassan, kai egeneto haima hōs nekrou, kai pasa psychē zōēs apethanen en tē thalassē.',
   'The second trumpet had affected only a third of the sea (8:8-9); the bowl strikes all of it. ''Blood as of a dead man'' is congealed, putrid blood — not the fresh blood of sacrifice but the corruption of death. The image overturns the source of life and commerce.',
   NULL),
  (4,
   'And the third angel poured out his vial upon the rivers and fountains of waters; and they became blood.',
   'Καὶ ὁ τρίτος ἐξέχεεν τὴν φιάλην αὐτοῦ εἰς τοὺς ποταμοὺς καὶ τὰς πηγὰς τῶν ὑδάτων, καὶ ἐγένετο αἷμα.',
   'Kai ho tritos exechen tēn phialēn autou eis tous potamous kai tas pēgas tōn hydatōn, kai egeneto haima.',
   'Echoing the first Egyptian plague (Exod 7:17-21), the freshwater supply becomes blood. The ''rivers and fountains'' represent both physical sustenance and a symbolic source of life. The judgment makes the world undrinkable.',
   NULL),
  (5,
   'And I heard the angel of the waters say, Thou art righteous, O Lord, which art, and wast, and shalt be, because thou hast judged thus.',
   'Καὶ ἤκουσα τοῦ ἀγγέλου τῶν ὑδάτων λέγοντος· Δίκαιος εἶ, ὁ ὢν καὶ ὁ ἦν, ὁ Ὅσιος, ὅτι ταῦτα ἔκρινας.',
   'Kai ēkousa tou angelou tōn hydatōn legontos; Dikaios ei, ho ōn kai ho ēn, ho Hosios, hoti tauta ekrinas.',
   'The angel charged with stewardship of the waters offers a doxology, defending God''s justice in the very act of judgment. The threefold name ''art, and wast, and shalt be'' (here truncated) echoes 1:4, 8 — the eternal God acts consistently with Himself. ''Holy'' (Ὅσιος, with article) declares Him the singular Holy One.',
   'Even the executors of judgment praise God''s justice. The instruments of wrath are not reluctant or angry; they are reverent. This silences the modern objection that wrath is incompatible with God''s goodness — heaven joins to praise it as righteous.'),
  (6,
   'For they have shed the blood of saints and prophets, and thou hast given them blood to drink; for they are worthy.',
   'Ὅτι αἷμα ἁγίων καὶ προφητῶν ἐξέχεαν, καὶ αἷμα αὐτοῖς ἔδωκας πιεῖν· ἄξιοί εἰσιν.',
   'Hoti haima hagiōn kai prophētōn exechean, kai haima autois edōkas piein; axioi eisin.',
   'The punishment fits the crime — the bloodshedders receive blood to drink. ''Worthy'' (ἄξιοί) here means ''deserving'' — they have earned this. The principle is lex talionis raised to cosmic scale: God''s justice answers persecution measure for measure (cf. Rev 13:10).',
   'Divine justice is precisely proportionate. The persecuted saints, whose cries were heard from under the altar (6:9-11), are now vindicated. God''s love for His people includes His commitment to right the wrongs done to them.'),
  (7,
   'And I heard another out of the altar say, Even so, Lord God Almighty, true and righteous are thy judgments.',
   'Καὶ ἤκουσα τοῦ θυσιαστηρίου λέγοντος· Ναί, Κύριε ὁ Θεὸς ὁ Παντοκράτωρ, ἀληθιναὶ καὶ δίκαιαι αἱ κρίσεις σου.',
   'Kai ēkousa tou thysiastēriou legontos; Nai, Kyrie ho Theos ho Pantokratōr, alēthinai kai dikaiai hai kriseis sou.',
   'The altar itself ''speaks'' — personifying the cries of the martyred saints (cf. 6:9). The double affirmation ''true and righteous'' echoes 15:3. The cry from the altar in 6:10 (''How long?'') is now answered.',
   NULL),
  (8,
   'And the fourth angel poured out his vial upon the sun; and power was given unto him to scorch men with fire.',
   'Καὶ ὁ τέταρτος ἐξέχεεν τὴν φιάλην αὐτοῦ ἐπὶ τὸν ἥλιον· καὶ ἐδόθη αὐτῷ καυματίσαι τοὺς ἀνθρώπους ἐν πυρί.',
   'Kai ho tetartos exechen tēn phialēn autou epi ton hēlion; kai edothē autō kaumatisai tous anthrōpous en pyri.',
   'The sun, normally a benevolent provision (Matt 5:45), becomes an instrument of judgment. The bowl reverses creational good — what gave warmth now scorches. ''Scorch'' (καυματίσαι) suggests intense burning rather than mere discomfort.',
   NULL),
  (9,
   'And men were scorched with great heat, and blasphemed the name of God, which hath power over these plagues: and they repented not to give him glory.',
   'Καὶ ἐκαυματίσθησαν οἱ ἄνθρωποι καῦμα μέγα, καὶ ἐβλασφήμησαν τὸ ὄνομα τοῦ Θεοῦ τοῦ ἔχοντος ἐξουσίαν ἐπὶ τὰς πληγὰς ταύτας, καὶ οὐ μετενόησαν δοῦναι αὐτῷ δόξαν.',
   'Kai ekaumatisthēsan hoi anthrōpoi kauma mega, kai eblasphēmēsan to onoma tou Theou tou echontos exousian epi tas plēgas tautas, kai ou metenoēsan dounai autō doxan.',
   'The response of the unrepentant is striking: they recognize that God controls the plagues yet curse rather than turn. Like Pharaoh, suffering hardens rather than humbles them. ''Repented not to give him glory'' summarizes the essence of unbelief — refusing to glorify the rightful God.',
   'Suffering does not automatically produce repentance. Hearts already hardened against God grow harder under judgment. Repentance is a gift of grace, not an inevitable response to pain.'),
  (10,
   'And the fifth angel poured out his vial upon the seat of the beast; and his kingdom was full of darkness; and they gnawed their tongues for pain,',
   'Καὶ ὁ πέμπτος ἐξέχεεν τὴν φιάλην αὐτοῦ ἐπὶ τὸν θρόνον τοῦ θηρίου, καὶ ἐγένετο ἡ βασιλεία αὐτοῦ ἐσκοτωμένη, καὶ ἐμασῶντο τὰς γλώσσας αὐτῶν ἐκ τοῦ πόνου.',
   'Kai ho pemptos exechen tēn phialēn autou epi ton thronon tou thēriou, kai egeneto hē basileia autou eskotōmenē, kai emasōnto tas glōssas autōn ek tou ponou.',
   'The bowl strikes the very ''throne'' (θρόνος) of the beast — an inversion of Christ''s throne. Darkness echoes the ninth Egyptian plague (Exod 10:21-23). The image of gnawing tongues conveys the agony of the previous judgments combined.',
   'The seat of antichrist''s power is itself overturned by God''s wrath. Every counterfeit kingdom comes to ruin. The darkness reveals the spiritual reality that has always characterized the beast''s realm.'),
  (11,
   'And blasphemed the God of heaven because of their pains and their sores, and repented not of their deeds.',
   'Καὶ ἐβλασφήμησαν τὸν Θεὸν τοῦ οὐρανοῦ ἐκ τῶν πόνων αὐτῶν καὶ ἐκ τῶν ἑλκῶν αὐτῶν, καὶ οὐ μετενόησαν ἐκ τῶν ἔργων αὐτῶν.',
   'Kai eblasphēmēsan ton Theon tou ouranou ek tōn ponōn autōn kai ek tōn helkōn autōn, kai ou metenoēsan ek tōn ergōn autōn.',
   'The repetition of ''blasphemed'' and ''repented not'' (cf. v.9) underscores the depth of their settled rebellion. The sores from the first bowl still afflict them — judgments accumulate rather than reset.',
   NULL),
  (12,
   'And the sixth angel poured out his vial upon the great river Euphrates; and the water thereof was dried up, that the way of the kings of the east might be prepared.',
   'Καὶ ὁ ἕκτος ἐξέχεεν τὴν φιάλην αὐτοῦ ἐπὶ τὸν ποταμὸν τὸν μέγαν Εὐφράτην, καὶ ἐξηράνθη τὸ ὕδωρ αὐτοῦ, ἵνα ἑτοιμασθῇ ἡ ὁδὸς τῶν βασιλέων τῶν ἀπὸ ἀνατολῆς ἡλίου.',
   'Kai ho hektos exechen tēn phialēn autou epi ton potamon ton megan Euphratēn, kai exēranthē to hydōr autou, hina hetoimasthē hē hodos tōn basileōn tōn apo anatolēs hēliou.',
   'The Euphrates was the eastern boundary of Israel''s promised land and historically the source of invading armies (Babylon, Assyria). Its drying up is a divine clearing of the path for the final convergence of opposing kings. The text echoes Cyrus''s conquest of Babylon, when the Euphrates was diverted.',
   NULL),
  (13,
   'And I saw three unclean spirits like frogs come out of the mouth of the dragon, and out of the mouth of the beast, and out of the mouth of the false prophet.',
   'Καὶ εἶδον ἐκ τοῦ στόματος τοῦ δράκοντος καὶ ἐκ τοῦ στόματος τοῦ θηρίου καὶ ἐκ τοῦ στόματος τοῦ ψευδοπροφήτου πνεύματα τρία ἀκάθαρτα ὡς βάτραχοι.',
   'Kai eidon ek tou stomatos tou drakontos kai ek tou stomatos tou thēriou kai ek tou stomatos tou pseudoprophētou pneumata tria akatharta hōs batrachoi.',
   'The unholy trinity — dragon, beast, false prophet — sends out a counterfeit of the Spirit. Frogs were unclean under Mosaic law (Lev 11:10) and recall the second Egyptian plague (Exod 8:1-15). Their issuing from the mouth signals deceitful speech, the chief weapon of the beast''s system.',
   'Satan''s strategy peaks in deception. The closer to the end, the louder the lying voices. The Spirit of truth proceeds from the Father; these spirits proceed from the mouths of evil — origin determines nature.'),
  (14,
   'For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of God Almighty.',
   'Εἰσὶν γὰρ πνεύματα δαιμονίων ποιοῦντα σημεῖα, ἃ ἐκπορεύεται ἐπὶ τοὺς βασιλεῖς τῆς οἰκουμένης ὅλης συναγαγεῖν αὐτοὺς εἰς τὸν πόλεμον τῆς ἡμέρας τῆς μεγάλης τοῦ Θεοῦ τοῦ Παντοκράτορος.',
   'Eisin gar pneumata daimoniōn poiounta sēmeia, ha ekporeuetai epi tous basileis tēs oikoumenēs holēs synagagein autous eis ton polemon tēs hēmeras tēs megalēs tou Theou tou Pantokratoros.',
   'These demonic spirits perform ''signs'' (σημεῖα) — counterfeit miracles that authenticate their lies. They go to the world''s kings to draw them to a single conflict against God. The irony is sharp: the kings think they are gathering for their own purposes; in reality, God''s sovereignty harnesses even rebellion to His ends.',
   'God remains sovereign even over the gathering of His enemies. What looks like Satan''s grand offensive is in fact God''s appointed assize — the battle is always on God''s ground and at God''s time.'),
  (15,
   'Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments, lest he walk naked, and they see his shame.',
   'Ἰδοὺ ἔρχομαι ὡς κλέπτης· μακάριος ὁ γρηγορῶν καὶ τηρῶν τὰ ἱμάτια αὐτοῦ, ἵνα μὴ γυμνὸς περιπατῇ καὶ βλέπωσιν τὴν ἀσχημοσύνην αὐτοῦ.',
   'Idou erchomai hōs kleptēs; makarios ho grēgorōn kai tērōn ta himatia autou, hina mē gymnos peripatē kai blepōsin tēn aschēmosynēn autou.',
   'A direct word from Christ in the middle of the visions — the third of seven beatitudes in Revelation. ''As a thief'' is His own metaphor for unexpected return (Matt 24:43). The image of guarding one''s garments may allude to Levitical priests guarding their dignity, or to the Roman watch standing guard with full uniform on pain of public shame.',
   'In the midst of cosmic upheaval, the call is personal: stay awake, hold fast to faith and holiness. The visible coming of Christ is sudden; preparation must be present-tense. ''Watching'' is faithful obedience while waiting.'),
  (16,
   'And he gathered them together into a place called in the Hebrew tongue Armageddon.',
   'Καὶ συνήγαγεν αὐτοὺς εἰς τὸν τόπον τὸν καλούμενον Ἑβραϊστὶ Ἁρμαγεδών.',
   'Kai synēgagen autous eis ton topon ton kaloumenon Hebraisti Harmagedōn.',
   '''Armageddon'' (Ἁρμαγεδών) likely transliterates Hebrew ''Har Megiddo'' — ''Mount of Megiddo.'' Megiddo was the strategic plain in northern Israel, site of decisive ancient battles (Judg 5:19; 2 Kgs 23:29). The name is symbolic of climactic conflict; whether the final battle is geographically literal or symbolic, the meaning is the convergence of all opposition for God''s decisive judgment.',
   NULL),
  (17,
   'And the seventh angel poured out his vial into the air; and there came a great voice out of the temple of heaven, from the throne, saying, It is done.',
   'Καὶ ὁ ἕβδομος ἐξέχεεν τὴν φιάλην αὐτοῦ ἐπὶ τὸν ἀέρα· καὶ ἐξῆλθεν φωνὴ μεγάλη ἐκ τοῦ ναοῦ ἀπὸ τοῦ θρόνου λέγουσα· Γέγονεν.',
   'Kai ho hebdomos exechen tēn phialēn autou epi ton aera; kai exēlthen phōnē megalē ek tou naou apo tou thronou legousa; Gegonen.',
   '''Into the air'' affects the very atmosphere — the sphere of demonic power (Eph 2:2). The single word ''Γέγονεν'' (''It is done'') is divine declaration of completion, parallel to Christ''s ''τετέλεσται'' (''It is finished'') on the cross (John 19:30). What was secured at Calvary is now applied in judgment.',
   'The same God who finished redemption finishes judgment. The two are not in tension; both are the work of His sovereign will. ''It is done'' carries the weight of irreversibility — there is no negotiating beyond this point.'),
  (18,
   'And there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great.',
   'Καὶ ἐγένοντο ἀστραπαὶ καὶ φωναὶ καὶ βρονταί, καὶ σεισμὸς ἐγένετο μέγας, οἷος οὐκ ἐγένετο ἀφ᾽ οὗ οἱ ἄνθρωποι ἐγένοντο ἐπὶ τῆς γῆς, τηλικοῦτος σεισμὸς οὕτω μέγας.',
   'Kai egenonto astrapai kai phōnai kai brontai, kai seismos egeneto megas, hoios ouk egeneto aph'' hou hoi anthrōpoi egenonto epi tēs gēs, tēlikoutos seismos houtō megas.',
   'Theophanic phenomena reach their climax. The earthquake is unprecedented in human history — superlatives stack to communicate the magnitude. The same accompaniments that surrounded Sinai (Exod 19:16-19) now mark the world''s judgment.',
   NULL),
  (19,
   'And the great city was divided into three parts, and the cities of the nations fell: and great Babylon came in remembrance before God, to give unto her the cup of the wine of the fierceness of his wrath.',
   'Καὶ ἐγένετο ἡ πόλις ἡ μεγάλη εἰς τρία μέρη, καὶ αἱ πόλεις τῶν ἐθνῶν ἔπεσαν. Καὶ Βαβυλὼν ἡ μεγάλη ἐμνήσθη ἐνώπιον τοῦ Θεοῦ δοῦναι αὐτῇ τὸ ποτήριον τοῦ οἴνου τοῦ θυμοῦ τῆς ὀργῆς αὐτοῦ.',
   'Kai egeneto hē polis hē megalē eis tria merē, kai hai poleis tōn ethnōn epesan. Kai Babylōn hē megalē emnēsthē enōpion tou Theou dounai autē to potērion tou oinou tou thymou tēs orgēs autou.',
   'The ''great city'' is Babylon (introduced in 14:8 and detailed in chs. 17-18). Her division into three parts signals total ruin; the world''s cities collapse with her. ''Came in remembrance'' (ἐμνήσθη) is a Hebrew idiom for God''s active recall to act — He has not forgotten her crimes (cf. Exod 2:24).',
   'Worldly civilization built in defiance of God ultimately falls. Earthly grandeur cannot insulate from divine memory. God''s ''remembering'' is never neutral — it is either grace or judgment.'),
  (20,
   'And every island fled away, and the mountains were not found.',
   'Καὶ πᾶσα νῆσος ἔφυγεν, καὶ ὄρη οὐχ εὑρέθησαν.',
   'Kai pasa nēsos ephygen, kai orē ouch heurethēsan.',
   'The most stable features of the geography vanish. Islands and mountains were biblical shorthand for permanence (Ps 46:2; Isa 54:10). When even these dissolve, nothing of the old order remains untouched (cf. 6:14).',
   NULL),
  (21,
   'And there fell upon men a great hail out of heaven, every stone about the weight of a talent: and men blasphemed God because of the plague of the hail; for the plague thereof was exceeding great.',
   'Καὶ χάλαζα μεγάλη ὡς ταλαντιαία καταβαίνει ἐκ τοῦ οὐρανοῦ ἐπὶ τοὺς ἀνθρώπους· καὶ ἐβλασφήμησαν οἱ ἄνθρωποι τὸν Θεὸν ἐκ τῆς πληγῆς τῆς χαλάζης, ὅτι μεγάλη ἐστὶν ἡ πληγὴ αὐτῆς σφόδρα.',
   'Kai chalaza megalē hōs talantiaia katabainei ek tou ouranou epi tous anthrōpous; kai eblasphēmēsan hoi anthrōpoi ton Theon ek tēs plēgēs tēs chalazēs, hoti megalē estin hē plēgē autēs sphodra.',
   'A talent weight is approximately 50-100 pounds — hail of impossible proportion, recalling the seventh Egyptian plague (Exod 9:23-25) and Joshua''s battle (Josh 10:11). Even under this final blow, the unrepentant blaspheme rather than turn — the third notice of impenitent blasphemy in the chapter (vv. 9, 11, 21).',
   'The pattern of hardened response demonstrates the futility of judgment to produce repentance apart from grace. The same crushing pressure that humbles a believer hardens the rebel. Salvation requires the new birth, not merely the right circumstances.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 16;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐκχέετε', 'ekcheete', 'G1632', 'Pour out — used of liquid being completely emptied. The aorist imperative signals decisive, not gradual, action. Echoes OT pouring out of wrath imagery (Ps 79:6; Jer 10:25).', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 1;

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἕλκος', 'helkos', 'G1668', 'A festering wound, ulcerous sore. Used in the Septuagint of the boils on the Egyptians (Exod 9:9-11) and on Job (Job 2:7). Carries the sense of painful, persistent affliction.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 2;

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Δίκαιος', 'Dikaios', 'G1342', 'Just, righteous. Predicated of God here as the standard-setter of righteousness. His acts cannot be measured against an external rule; He defines the rule.', 1),
  ('Ὅσιος', 'Hosios', 'G3741', 'Holy, devout, pious — moral holiness as opposed to mere ritual separation. Designates God as the singular morally-pure One.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 5;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετενόησαν', 'metenoēsan', 'G3340', 'Aorist of ''metanoeō'' — to change one''s mind, repent. Properly a turning of the inner person resulting in transformed conduct. The negation here highlights the settled refusal of the unrepentant.', 1),
  ('ἐβλασφήμησαν', 'eblasphēmēsan', 'G987', 'They blasphemed — spoke evil of, slandered. Here directed at the very God whose power they implicitly acknowledge. Deliberate defamation in the face of evidence.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 9;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ψευδοπροφήτου', 'pseudoprophētou', 'G5578', 'False prophet — a compound of ''pseudēs'' (false) and ''prophētēs'' (prophet). The second beast of chapter 13 is here named for the first time, identifying his role as a counterfeit speaker for God.', 1),
  ('ἀκάθαρτα', 'akatharta', 'G169', 'Unclean, impure. Levitical category for what defiles. Frogs were ritually unclean (Lev 11:10), making the imagery doubly repulsive to a Jewish reader.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 13;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γρηγορῶν', 'grēgorōn', 'G1127', 'Watching, staying awake — a present participle of continuous action. Used by Jesus of His disciples in Gethsemane (Mark 14:38). Spiritual vigilance, not nervous anxiety.', 1),
  ('κλέπτης', 'kleptēs', 'G2812', 'A thief — Christ''s self-image not for His morality but for His unannounced timing. Borrowed from Jesus'' own teaching (Matt 24:43; cf. 1 Thess 5:2; 2 Pet 3:10).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 15;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἁρμαγεδών', 'Harmagedōn', 'G717', 'Likely transliterating Hebrew ''Har Megiddo'' (Mount of Megiddo). The Megiddo plain was the stage of decisive battles in Israel''s history (Judg 5:19; 2 Kgs 23:29-30), making the name shorthand for climactic, history-turning conflict.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 16;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Γέγονεν', 'Gegonen', 'G1096', 'Perfect indicative of ''ginomai'' — ''it has come to pass.'' The perfect tense communicates completed action with abiding result. Parallels Christ''s ''τετέλεσται'' (It is finished) on the cross — the work of judgment is now as complete as the work of redemption.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Psalm 79:6', 1),
  (1, 'Jeremiah 10:25', 2),
  (1, 'Revelation 15:7-8', 3),
  (2, 'Exodus 9:8-11', 1),
  (2, 'Deuteronomy 28:27', 2),
  (2, 'Revelation 13:16-17', 3),
  (3, 'Exodus 7:17-21', 1),
  (3, 'Revelation 8:8-9', 2),
  (4, 'Exodus 7:19-20', 1),
  (4, 'Revelation 8:10', 2),
  (5, 'Revelation 1:4', 1),
  (5, 'Revelation 15:3', 2),
  (5, 'Psalm 145:17', 3),
  (6, 'Matthew 23:34-35', 1),
  (6, 'Revelation 6:9-10', 2),
  (6, 'Isaiah 49:26', 3),
  (7, 'Revelation 6:9', 1),
  (7, 'Revelation 19:2', 2),
  (8, 'Malachi 4:1', 1),
  (8, 'Revelation 7:16', 2),
  (9, 'Revelation 9:20-21', 1),
  (9, 'Revelation 16:11', 2),
  (9, 'Romans 2:4-5', 3),
  (10, 'Exodus 10:21-23', 1),
  (10, 'Isaiah 8:21-22', 2),
  (11, 'Revelation 16:9', 1),
  (11, 'Revelation 9:20-21', 2),
  (12, 'Isaiah 11:15-16', 1),
  (12, 'Jeremiah 50:38', 2),
  (12, 'Isaiah 41:2-3', 3),
  (13, 'Exodus 8:1-15', 1),
  (13, '1 John 4:1-3', 2),
  (13, '2 Thessalonians 2:9', 3),
  (14, 'Revelation 17:14', 1),
  (14, 'Revelation 19:19', 2),
  (14, 'Joel 3:2', 3),
  (15, 'Matthew 24:42-44', 1),
  (15, '1 Thessalonians 5:2-6', 2),
  (15, '2 Peter 3:10', 3),
  (16, 'Judges 5:19', 1),
  (16, '2 Kings 23:29-30', 2),
  (16, 'Zechariah 12:11', 3),
  (17, 'John 19:30', 1),
  (17, 'Revelation 21:6', 2),
  (17, 'Daniel 12:7', 3),
  (18, 'Exodus 19:16-19', 1),
  (18, 'Revelation 11:19', 2),
  (18, 'Daniel 12:1', 3),
  (19, 'Revelation 14:8', 1),
  (19, 'Revelation 17:18', 2),
  (19, 'Jeremiah 25:15-16', 3),
  (20, 'Revelation 6:14', 1),
  (20, 'Revelation 20:11', 2),
  (21, 'Exodus 9:23-25', 1),
  (21, 'Joshua 10:11', 2),
  (21, 'Revelation 11:19', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 16 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 16 Complete!
-- 21 verses · 8 key verses with word studies (13 words)
-- Cross-references for 21 verses (56 refs)
-- ═══════════════════════════════════════════════════════
