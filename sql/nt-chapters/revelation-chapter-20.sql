-- Revelation Chapter 20: The Thousand Years, Satan's Doom, and the Great White Throne
-- Step 1: Chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id,
  20,
  'An angel binds Satan in the abyss for a thousand years while the saints reign with Christ. After the millennium Satan is loosed for a final rebellion, then cast into the lake of fire. The dead — small and great — stand before the Great White Throne. Books are opened, including the Book of Life, and each is judged according to his works. Death and Hades are themselves cast into the lake of fire. This chapter answers the long groan of creation: every tyrant, every martyr, every hidden deed comes at last into the light of perfect justice.',
  'The Millennial Reign and the Final Judgment',
  'χίλια ἔτη',
  'A thousand years (chilia etē) — the recurring marker (six times in vv. 2–7) of the long, definitive reign of Christ between Satan''s binding and the final judgment.',
  '["1-3 Satan bound in the abyss for a thousand years", "4-6 The first resurrection: thrones, martyrs, the saints reign with Christ", "7-10 Satan loosed, gathers Gog and Magog, cast into the lake of fire", "11-15 The Great White Throne: the dead judged from the books, death and Hades cast in"]'::jsonb
FROM books b WHERE b.name = 'Revelation'
ON CONFLICT (book_id, chapter_number) DO UPDATE SET
  overview = EXCLUDED.overview,
  theme = EXCLUDED.theme,
  key_word_original = EXCLUDED.key_word_original,
  key_word_meaning = EXCLUDED.key_word_meaning,
  outline = EXCLUDED.outline;

-- Step 2: Verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand.',
   'Καὶ εἶδον ἄγγελον καταβαίνοντα ἐκ τοῦ οὐρανοῦ, ἔχοντα τὴν κλεῖν τῆς ἀβύσσου καὶ ἅλυσιν μεγάλην ἐπὶ τὴν χεῖρα αὐτοῦ.',
   'Kai eidon angelon katabainonta ek tou ouranou, echonta tēn klein tēs abyssou kai halysin megalēn epi tēn cheira autou.',
   'A new vision (Καὶ εἶδον, "And I saw") opens. The angel descends from heaven with two implements: the key (κλεῖς) of the abyss and a great chain. The same key was given in 9:1 to release locusts; now it is used to imprison.',
   'God''s authority over the demonic realm is exercised by His delegated servants. Satan is not co-equal with God; he can be locked up by an angel sent on errand.'),
  (2,
   'And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,',
   'καὶ ἐκράτησεν τὸν δράκοντα, τὸν ὄφιν τὸν ἀρχαῖον, ὅς ἐστιν Διάβολος καὶ ὁ Σατανᾶς, καὶ ἔδησεν αὐτὸν χίλια ἔτη,',
   'kai ekratēsen ton drakonta, ton ophin ton archaion, hos estin Diabolos kai ho Satanas, kai edēsen auton chilia etē,',
   'Four titles pile up: dragon (πρωτότοκος of chaos), ancient serpent (recalling Eden, Gen 3:1), Devil (slanderer), Satan (adversary). The same enemy across the canon is named, seized (ἐκράτησεν), and bound (ἔδησεν).',
   'Christ promised that the strong man must first be bound before his house is plundered (Matt 12:29). Here the binding is consummated by heavenly authority for a defined season.'),
  (3,
   'And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.',
   'καὶ ἔβαλεν αὐτὸν εἰς τὴν ἄβυσσον, καὶ ἔκλεισεν καὶ ἐσφράγισεν ἐπάνω αὐτοῦ, ἵνα μὴ πλανήσῃ ἔτι τὰ ἔθνη, ἄχρι τελεσθῇ τὰ χίλια ἔτη· μετὰ ταῦτα δεῖ λυθῆναι αὐτὸν μικρὸν χρόνον.',
   'kai ebalen auton eis tēn abysson, kai ekleisen kai esphragisen epanō autou, hina mē planēsē eti ta ethnē, achri telesthē ta chilia etē; meta tauta dei lythēnai auton mikron chronon.',
   'Three security measures — cast, shut, sealed (σφραγίζω, the official seal). The purpose clause (ἵνα) names Satan''s chief activity: deceiving the nations (πλανήσῃ τὰ ἔθνη). The "little season" of release is divinely necessary (δεῖ).',
   'Christians have differed on whether the thousand years are literal or symbolic, future (premillennial) or present (amillennial/postmillennial). The text''s central claim is non-negotiable: a real binding, a real reign, a real loosing, a real judgment under the sovereign timetable of God.'),
  (4,
   'And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Jesus, and for the word of God, and which had not worshipped the beast, neither his image, neither had received his mark upon their foreheads, or in their hands; and they lived and reigned with Christ a thousand years.',
   'Καὶ εἶδον θρόνους, καὶ ἐκάθισαν ἐπ᾽ αὐτούς, καὶ κρίμα ἐδόθη αὐτοῖς, καὶ τὰς ψυχὰς τῶν πεπελεκισμένων διὰ τὴν μαρτυρίαν Ἰησοῦ καὶ διὰ τὸν λόγον τοῦ Θεοῦ, καὶ οἵτινες οὐ προσεκύνησαν τὸ θηρίον οὐδὲ τὴν εἰκόνα αὐτοῦ καὶ οὐκ ἔλαβον τὸ χάραγμα ἐπὶ τὸ μέτωπον καὶ ἐπὶ τὴν χεῖρα αὐτῶν· καὶ ἔζησαν καὶ ἐβασίλευσαν μετὰ τοῦ Χριστοῦ χίλια ἔτη.',
   'Kai eidon thronous, kai ekathisan ep'' autous, kai krima edothē autois, kai tas psychas tōn pepelekismenōn dia tēn martyrian Iēsou kai dia ton logon tou Theou, kai hoitines ou prosekynēsan to thērion oude tēn eikona autou kai ouk elabon to charagma epi to metōpon kai epi tēn cheira autōn; kai ezēsan kai ebasileusan meta tou Christou chilia etē.',
   'The participle πεπελεκισμένων (pepelekismenōn, "beheaded") evokes the Roman πέλεκυς (axe). Two qualifying acts: faithful witness and refusal of the beast''s mark. They live (ἔζησαν) — a verb of resurrection — and reign with Christ.',
   'Daniel 7:22 promised that judgment would be given to the saints of the Most High; here it is fulfilled. Faithful suffering, not coercive power, is the pathway to ruling with Christ.'),
  (5,
   'But the rest of the dead lived not again until the thousand years were finished. This is the first resurrection.',
   'οἱ λοιποὶ τῶν νεκρῶν οὐκ ἔζησαν ἄχρι τελεσθῇ τὰ χίλια ἔτη. αὕτη ἡ ἀνάστασις ἡ πρώτη.',
   'hoi loipoi tōn nekrōn ouk ezēsan achri telesthē ta chilia etē. hautē hē anastasis hē prōtē.',
   'The parenthetical first sentence sets the wicked dead apart. The second names the saints'' rising "the first resurrection" (ἡ ἀνάστασις ἡ πρώτη), distinguishing it from the general resurrection of v. 12.',
   'Scripture distinguishes resurrections by destination, not chronology alone — the resurrection of life and the resurrection of damnation (John 5:29). To miss the first is to wake to the second death.'),
  (6,
   'Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of God and of Christ, and shall reign with him a thousand years.',
   'μακάριος καὶ ἅγιος ὁ ἔχων μέρος ἐν τῇ ἀναστάσει τῇ πρώτῃ· ἐπὶ τούτων ὁ δεύτερος θάνατος οὐκ ἔχει ἐξουσίαν, ἀλλ᾽ ἔσονται ἱερεῖς τοῦ Θεοῦ καὶ τοῦ Χριστοῦ, καὶ βασιλεύσουσιν μετ᾽ αὐτοῦ χίλια ἔτη.',
   'makarios kai hagios ho echōn meros en tē anastasei tē prōtē; epi toutōn ho deuteros thanatos ouk echei exousian, all'' esontai hiereis tou Theou kai tou Christou, kai basileusousin met'' autou chilia etē.',
   'The fifth of Revelation''s seven beatitudes (μακάριος). Two safeguards: holiness (ἅγιος) and immunity from the second death. Two privileges: priesthood and royal reign — the original Edenic vocation restored.',
   '"Hath part" excludes works-righteousness; it is participation by grace through faith, sealed by the resurrection of Christ. Believers do not earn the millennium, they share Christ''s.'),
  (7,
   'And when the thousand years are expired, Satan shall be loosed out of his prison,',
   'Καὶ ὅταν τελεσθῇ τὰ χίλια ἔτη, λυθήσεται ὁ Σατανᾶς ἐκ τῆς φυλακῆς αὐτοῦ,',
   'Kai hotan telesthē ta chilia etē, lythēsetai ho Satanas ek tēs phylakēs autou,',
   'φυλακή ("prison") matches the abyss of v. 3. The passive λυθήσεται ("shall be loosed") signals divine permission, not Satan''s escape.',
   'Even the final rebellion serves God''s purposes: it exposes the heart of the unconverted who, despite a millennium of righteous reign, follow the deceiver the moment temptation arrives.'),
  (8,
   'And shall go out to deceive the nations which are in the four quarters of the earth, Gog and Magog, to gather them together to battle: the number of whom is as the sand of the sea.',
   'καὶ ἐξελεύσεται πλανῆσαι τὰ ἔθνη τὰ ἐν ταῖς τέσσαρσιν γωνίαις τῆς γῆς, τὸν Γὼγ καὶ τὸν Μαγώγ, συναγαγεῖν αὐτοὺς εἰς τὸν πόλεμον, ὧν ὁ ἀριθμὸς αὐτῶν ὡς ἡ ἄμμος τῆς θαλάσσης.',
   'kai exeleusetai planēsai ta ethnē ta en tais tessarsin gōniais tēs gēs, ton Gōg kai ton Magōg, synagagein autous eis ton polemon, hōn ho arithmos autōn hōs hē ammos tēs thalassēs.',
   'Gog and Magog (cf. Ezek 38–39) here become a worldwide coalition, gathered from the four corners (γωνίαι) of the earth. Their number is "as the sand of the sea" — vast yet finite.',
   'Satan''s strategy never changes: deception. The believer''s defense never changes either: the truth, the shield of faith, and the sword of the Spirit (Eph 6:14–17).'),
  (9,
   'And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from God out of heaven, and devoured them.',
   'καὶ ἀνέβησαν ἐπὶ τὸ πλάτος τῆς γῆς καὶ ἐκύκλωσαν τὴν παρεμβολὴν τῶν ἁγίων καὶ τὴν πόλιν τὴν ἠγαπημένην, καὶ κατέβη πῦρ ἀπὸ τοῦ Θεοῦ ἐκ τοῦ οὐρανοῦ καὶ κατέφαγεν αὐτούς.',
   'kai anebēsan epi to platos tēs gēs kai ekyklōsan tēn parembolēn tōn hagiōn kai tēn polin tēn ēgapēmenēn, kai katebē pyr apo tou Theou ek tou ouranou kai katephagen autous.',
   'The "beloved city" (ἠγαπημένη πόλιν) recalls Jerusalem (Ps 78:68). The siege ends in an instant: fire from God, like Sodom (Gen 19:24) and the prophets of Baal (1 Kgs 18:38), consumes the attackers.',
   'There is no protracted final battle. The decisive act is God''s, not the saints''. Believers are kept, not conquering — a needed rebuke to triumphalist programs.'),
  (10,
   'And the devil that deceived them was cast into the lake of fire and brimstone, where the beast and the false prophet are, and shall be tormented day and night for ever and ever.',
   'καὶ ὁ διάβολος ὁ πλανῶν αὐτοὺς ἐβλήθη εἰς τὴν λίμνην τοῦ πυρὸς καὶ θείου, ὅπου καὶ τὸ θηρίον καὶ ὁ ψευδοπροφήτης, καὶ βασανισθήσονται ἡμέρας καὶ νυκτὸς εἰς τοὺς αἰῶνας τῶν αἰώνων.',
   'kai ho diabolos ho planōn autous eblēthē eis tēn limnēn tou pyros kai theiou, hopou kai to thērion kai ho pseudoprophētēs, kai basanisthēsontai hēmeras kai nyktos eis tous aiōnas tōn aiōnōn.',
   'The unholy trinity reunited in judgment: dragon, beast, false prophet. εἰς τοὺς αἰῶνας τῶν αἰώνων (literally "unto the ages of the ages") is the strongest biblical idiom for unending duration.',
   'The serpent of Eden meets the seed of the woman''s heel (Gen 3:15) at the lake of fire. The promise of Genesis is consummated here.'),
  (11,
   'And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them.',
   'Καὶ εἶδον θρόνον μέγαν λευκὸν καὶ τὸν καθήμενον ἐπ᾽ αὐτόν, οὗ ἀπὸ τοῦ προσώπου ἔφυγεν ἡ γῆ καὶ ὁ οὐρανός, καὶ τόπος οὐχ εὑρέθη αὐτοῖς.',
   'Kai eidon thronon megan leukon kai ton kathēmenon ep'' auton, hou apo tou prosōpou ephygen hē gē kai ho ouranos, kai topos ouch heurethē autois.',
   'Three adjectives in apposition: great (greatness of authority), white (purity of justice), throne (sovereignty). Heaven and earth flee — the first creation cannot bear the unveiled Judge.',
   'God the Father judges through the Son, to whom all judgment has been committed (John 5:22). The bench of the universe is neither vacant nor partisan.'),
  (12,
   'And I saw the dead, small and great, stand before God; and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.',
   'καὶ εἶδον τοὺς νεκρούς, τοὺς μεγάλους καὶ τοὺς μικρούς, ἑστῶτας ἐνώπιον τοῦ θρόνου, καὶ βιβλία ἠνοίχθησαν· καὶ ἄλλο βιβλίον ἠνοίχθη, ὅ ἐστιν τῆς ζωῆς· καὶ ἐκρίθησαν οἱ νεκροὶ ἐκ τῶν γεγραμμένων ἐν τοῖς βιβλίοις κατὰ τὰ ἔργα αὐτῶν.',
   'kai eidon tous nekrous, tous megalous kai tous mikrous, hestōtas enōpion tou thronou, kai biblia ēnoichthēsan; kai allo biblion ēnoichthē, ho estin tēs zōēs; kai ekrithēsan hoi nekroi ek tōn gegrammenōn en tois bibliois kata ta erga autōn.',
   '"Small and great" — every social rank. Two sets of records: books (βιβλία) of deeds and the Book (βιβλίον) of life. Judgment proceeds from both, "according to works."',
   'Salvation is by grace through faith, but judgment is according to works (Rom 2:6) — the works that grace produces. The Book of Life records redemption; the books record evidence.'),
  (13,
   'And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.',
   'καὶ ἔδωκεν ἡ θάλασσα τοὺς νεκροὺς τοὺς ἐν αὐτῇ, καὶ ὁ θάνατος καὶ ὁ ᾅδης ἔδωκαν τοὺς νεκροὺς τοὺς ἐν αὐτοῖς, καὶ ἐκρίθησαν ἕκαστος κατὰ τὰ ἔργα αὐτῶν.',
   'kai edōken hē thalassa tous nekrous tous en autē, kai ho thanatos kai ho hadēs edōkan tous nekrous tous en autois, kai ekrithēsan hekastos kata ta erga autōn.',
   'The sea, death (θάνατος), and Hades (ᾅδης) — three reservoirs of the dead — empty completely. Each (ἕκαστος) is judged individually; no one is lost in the crowd.',
   'No grave is too obscure, no body too dispersed, for resurrection. Christ holds the keys of death and Hades (1:18); the doors swing open at His word.'),
  (14,
   'And death and hell were cast into the lake of fire. This is the second death.',
   'καὶ ὁ θάνατος καὶ ὁ ᾅδης ἐβλήθησαν εἰς τὴν λίμνην τοῦ πυρός. οὗτος ὁ θάνατος ὁ δεύτερός ἐστιν, ἡ λίμνη τοῦ πυρός.',
   'kai ho thanatos kai ho hadēs eblēthēsan eis tēn limnēn tou pyros. houtos ho thanatos ho deuteros estin, hē limnē tou pyros.',
   'Death itself dies (cf. 1 Cor 15:26). The lake of fire is identified as "the second death" — a defining gloss for the next chapter.',
   'For the saints, death has already been swallowed up in victory (1 Cor 15:54). The second death has no claim on those whose names are in the Lamb''s Book of Life.'),
  (15,
   'And whosoever was not found written in the book of life was cast into the lake of fire.',
   'καὶ εἴ τις οὐχ εὑρέθη ἐν τῇ βίβλῳ τῆς ζωῆς γεγραμμένος, ἐβλήθη εἰς τὴν λίμνην τοῦ πυρός.',
   'kai ei tis ouch heurethē en tē biblō tēs zōēs gegrammenos, eblēthē eis tēn limnēn tou pyros.',
   'The chapter ends not with a roar but a verdict. The conditional εἴ τις ("if anyone") leaves room for none to be skipped and none to be condemned apart from the open record.',
   'The decisive question for every soul is not deeds first, but whether the Lamb has written one''s name. That writing is offered today to all who come to Christ in faith (John 6:37).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 20
ON CONFLICT (chapter_id, verse_number) DO UPDATE SET
  kjv_text = EXCLUDED.kjv_text,
  original_text = EXCLUDED.original_text,
  transliteration = EXCLUDED.transliteration,
  study_note = EXCLUDED.study_note,
  doctrinal_note = EXCLUDED.doctrinal_note;

-- Step 3: Word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'ἄβυσσος', 'abyssos', 'G12', 'Bottomless pit; the deep — used in LXX of the primeval deep (Gen 1:2) and in Luke 8:31 of the demons'' dread.', 1),
  (1, 'ἅλυσις', 'halysis', 'G254', 'Chain; the same word for Paul''s prison chain (Acts 28:20). The dragon is bound as a captive of war.', 2),
  (2, 'δράκων', 'drakōn', 'G1404', 'Dragon, sea-monster — recalls Leviathan (Isa 27:1) and the chaos beast crushed by God.', 1),
  (2, 'ὄφις', 'ophis', 'G3789', 'Serpent — directly tying this dragon to Eden (Gen 3:1). One enemy across the whole canon.', 2),
  (3, 'σφραγίζω', 'sphragizō', 'G4972', 'To set a seal upon — official imperial security; cf. the seal on Christ''s tomb (Matt 27:66) which proved no obstacle to Him.', 1),
  (4, 'πελεκίζω', 'pelekizō', 'G3990', 'To behead with an axe (πέλεκυς); Roman execution reserved for capital crimes — the martyr''s death.', 1),
  (4, 'βασιλεύω', 'basileuō', 'G936', 'To reign as king — the saints share Christ''s royal office (cf. 5:10).', 2),
  (6, 'ἱερεύς', 'hiereus', 'G2409', 'Priest — those who draw near to God on behalf of others; the Edenic and Sinaitic vocation finally realized.', 1),
  (8, 'πλανάω', 'planaō', 'G4105', 'To deceive, lead astray — Satan''s defining verb across Revelation (12:9; 13:14; 19:20).', 1),
  (10, 'βασανίζω', 'basanizō', 'G928', 'To torment, test by torture — used of testing metals on a touchstone (βάσανος). Eternal, not annihilating.', 1),
  (11, 'λευκός', 'leukos', 'G3022', 'White — purity, victory, judicial impartiality; the same color as the Son of Man''s hair (1:14).', 1),
  (12, 'βιβλίον', 'biblion', 'G975', 'Book, scroll — heaven''s judicial record. Cf. the book of remembrance in Mal 3:16.', 1),
  (12, 'ἔργον', 'ergon', 'G2041', 'Work, deed — the visible fruit by which the inner faith is tested (Jas 2:18).', 2),
  (13, 'ᾅδης', 'hadēs', 'G86', 'Hades, the realm of the dead — distinguished here from the lake of fire; Hades itself is destroyed.', 1),
  (14, 'θάνατος', 'thanatos', 'G2288', 'Death — personified and finally destroyed (1 Cor 15:26). The last enemy meets its end.', 1),
  (15, 'ζωή', 'zōē', 'G2222', 'Life — particularly the eternal life rooted in God; written in the Lamb''s book before the foundation of the world (13:8).', 1)
) AS w(verse_number, original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 20 AND v.verse_number = w.verse_number
ON CONFLICT DO NOTHING;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, x.reference, x.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Revelation 9:1', 1),
  (1, 'Revelation 1:18', 2),
  (1, 'Luke 8:31', 3),
  (2, 'Genesis 3:1', 1),
  (2, 'Isaiah 27:1', 2),
  (2, 'Revelation 12:9', 3),
  (2, 'Matthew 12:29', 4),
  (3, 'Jude 1:6', 1),
  (3, '2 Peter 2:4', 2),
  (3, 'Revelation 20:7', 3),
  (4, 'Daniel 7:22', 1),
  (4, 'Revelation 6:9', 2),
  (4, 'Matthew 19:28', 3),
  (4, '2 Timothy 2:12', 4),
  (5, 'John 5:29', 1),
  (5, '1 Corinthians 15:23', 2),
  (5, 'Daniel 12:2', 3),
  (6, 'Revelation 1:6', 1),
  (6, 'Revelation 2:11', 2),
  (6, '1 Peter 2:9', 3),
  (6, 'Revelation 5:10', 4),
  (7, 'Revelation 20:3', 1),
  (8, 'Ezekiel 38:2', 1),
  (8, 'Ezekiel 39:1', 2),
  (8, 'Genesis 22:17', 3),
  (8, 'Isaiah 11:12', 4),
  (9, 'Genesis 19:24', 1),
  (9, '2 Kings 1:10', 2),
  (9, 'Psalm 78:68', 3),
  (9, 'Ezekiel 38:22', 4),
  (10, 'Revelation 19:20', 1),
  (10, 'Genesis 3:15', 2),
  (10, 'Matthew 25:41', 3),
  (10, 'Revelation 14:11', 4),
  (11, 'Daniel 7:9', 1),
  (11, '2 Peter 3:10', 2),
  (11, 'Revelation 21:1', 3),
  (11, 'Psalm 102:26', 4),
  (12, 'Daniel 7:10', 1),
  (12, 'Daniel 12:1', 2),
  (12, 'Romans 2:6', 3),
  (12, 'Malachi 3:16', 4),
  (12, 'Philippians 4:3', 5),
  (13, 'John 5:28-29', 1),
  (13, '1 Corinthians 15:52', 2),
  (13, 'Revelation 1:18', 3),
  (14, '1 Corinthians 15:26', 1),
  (14, 'Hosea 13:14', 2),
  (14, 'Isaiah 25:8', 3),
  (14, 'Revelation 21:4', 4),
  (15, 'Revelation 13:8', 1),
  (15, 'Revelation 21:27', 2),
  (15, 'Luke 10:20', 3),
  (15, 'Daniel 12:1', 4)
) AS x(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 20 AND v.verse_number = x.verse_number
ON CONFLICT DO NOTHING;
