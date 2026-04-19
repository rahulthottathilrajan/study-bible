-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 18 — The Fall of Babylon and the Lament of the Earth
-- 24 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 18,
  'Revelation 18 narrates the actual collapse of Babylon, anticipated in 14:8 and 16:19 and unveiled in chapter 17. A mighty angel announces her fall, and a heavenly voice calls God''s people to ''come out of her.'' Three groups then mourn — kings, merchants, and seafarers — each lamenting the loss of their Babylonian luxury and trade. The chapter is structured as a prophetic dirge in the tradition of Isaiah''s oracles against Tyre and Babylon (Isa 13, 23, 47) and Ezekiel''s lament over Tyre (Ezek 27). The repeated cry ''Alas, alas'' (οὐαὶ οὐαί) marks the threefold lament. The chapter ends with a violent symbolic act: an angel hurls a millstone into the sea, picturing Babylon''s sudden, irreversible plunge. Heaven is summoned to rejoice — the same fall that earth mourns, heaven celebrates, because in her was found the blood of saints and prophets.',
  'The Fall of Babylon and the Lament of the Earth',
  'Ἔπεσεν (Epesen)',
  'Aorist of ''piptō'' — ''she has fallen.'' The doubled cry ''Ἔπεσεν, ἔπεσεν Βαβυλὼν'' echoes Isaiah 21:9. The aorist treats the future fall as already done, the prophetic perfect of certainty. Babylon''s collapse is so sure in God''s decree that Scripture speaks of it in completed terms.',
  '["Section 1 (vv.1-3): The Mighty Angel Announces Babylon''s Fall","Section 2 (vv.4-8): A Voice from Heaven — Come Out of Her, My People","Section 3 (vv.9-10): The Lament of the Kings of the Earth","Section 4 (vv.11-17a): The Lament of the Merchants","Section 5 (vv.17b-19): The Lament of the Seafarers","Section 6 (v.20): Heaven Called to Rejoice","Section 7 (vv.21-24): The Symbolic Millstone and Final Indictment"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 24 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And after these things I saw another angel come down from heaven, having great power; and the earth was lightened with his glory.',
   'Μετὰ ταῦτα εἶδον ἄλλον ἄγγελον καταβαίνοντα ἐκ τοῦ οὐρανοῦ ἔχοντα ἐξουσίαν μεγάλην, καὶ ἡ γῆ ἐφωτίσθη ἐκ τῆς δόξης αὐτοῦ.',
   'Meta tauta eidon allon angelon katabainonta ek tou ouranou echonta exousian megalēn, kai hē gē ephōtisthē ek tēs doxēs autou.',
   'A new vision after the harlot''s identity is explained. The angel''s glory illumining the earth recalls Ezekiel 43:2, where God''s glory returns to the temple. The same glory that fills the heavenly temple now lights the earth in announcing judgment.',
   NULL),
  (2,
   'And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.',
   'Καὶ ἔκραξεν ἐν ἰσχυρᾷ φωνῇ λέγων· Ἔπεσεν, ἔπεσεν Βαβυλὼν ἡ μεγάλη, καὶ ἐγένετο κατοικητήριον δαιμονίων καὶ φυλακὴ παντὸς πνεύματος ἀκαθάρτου καὶ φυλακὴ παντὸς ὀρνέου ἀκαθάρτου καὶ μεμισημένου,',
   'Kai ekraxen en ischyra phōnē legōn; Epesen, epesen Babylōn hē megalē, kai egeneto katoikētērion daimoniōn kai phylakē pantos pneumatos akathartou kai phylakē pantos orneou akathartou kai memisēmenou,',
   'The doubled ''fallen'' echoes 14:8 and Isaiah 21:9. Once-glorious Babylon becomes a haunt of demons — the imagery is from Isaiah 13:21-22 and Jeremiah 50:39 (originally of literal Babylon). Where men once worshiped luxury, only unclean spirits and birds now dwell.',
   'God turns the proud city into a desolation. The judgment is not merely loss of life but loss of meaning — the house becomes a haunting. Every kingdom built without God ends in spiritual emptiness.'),
  (3,
   'For all nations have drunk of the wine of the wrath of her fornication, and the kings of the earth have committed fornication with her, and the merchants of the earth are waxed rich through the abundance of her delicacies.',
   'ὅτι ἐκ τοῦ οἴνου τοῦ θυμοῦ τῆς πορνείας αὐτῆς πέπτωκαν πάντα τὰ ἔθνη, καὶ οἱ βασιλεῖς τῆς γῆς μετ᾽ αὐτῆς ἐπόρνευσαν, καὶ οἱ ἔμποροι τῆς γῆς ἐκ τῆς δυνάμεως τοῦ στρήνους αὐτῆς ἐπλούτησαν.',
   'hoti ek tou oinou tou thymou tēs porneias autēs peptōkan panta ta ethnē, kai hoi basileis tēs gēs met'' autēs eporneusan, kai hoi emporoi tēs gēs ek tēs dynameōs tou strēnous autēs eploutēsan.',
   'Three groups complicit in Babylon''s system: nations (drinking her wine), kings (in fornication with her), and merchants (enriched by her luxury). The new note here is economic: Babylon is the engine of corrupt commerce. ''Strēnos'' (στρῆνος) means wanton luxury — the kind that breeds excess and indifference to others.',
   NULL),
  (4,
   'And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.',
   'Καὶ ἤκουσα ἄλλην φωνὴν ἐκ τοῦ οὐρανοῦ λέγουσαν· Ἐξέλθατε ἐξ αὐτῆς ὁ λαός μου, ἵνα μὴ συγκοινωνήσητε ταῖς ἁμαρτίαις αὐτῆς, καὶ ἵνα μὴ ἐκ τῶν πληγῶν αὐτῆς λάβητε·',
   'Kai ēkousa allēn phōnēn ek tou ouranou legousan; Exelthate ex autēs ho laos mou, hina mē synkoinōnēsēte tais hamartiais autēs, kai hina mē ek tōn plēgōn autēs labēte;',
   '''Come out of her, my people'' echoes Isaiah 48:20, 52:11, and Jeremiah 50:8, 51:6, 45 — God''s call to His people to flee literal Babylon. The exodus must be moral and spiritual now, not necessarily geographic. Participation in her sins invites her plagues.',
   'God always preserves a people in the midst of judgment. The call to ''come out'' precedes every divine reckoning (Lot from Sodom, Israel from Egypt). Holiness is not optional; entanglement is dangerous.'),
  (5,
   'For her sins have reached unto heaven, and God hath remembered her iniquities.',
   'ὅτι ἐκολλήθησαν αὐτῆς αἱ ἁμαρτίαι ἄχρι τοῦ οὐρανοῦ, καὶ ἐμνημόνευσεν ὁ Θεὸς τὰ ἀδικήματα αὐτῆς.',
   'hoti ekollēthēsan autēs hai hamartiai achri tou ouranou, kai emnēmoneusen ho Theos ta adikēmata autēs.',
   'The image is of sins piled like the tower of Babel (Gen 11:4) — a mockery of heaven''s height. ''Remembered'' (ἐμνημόνευσεν) is Hebraic — God''s active recall to judge. Postponed wrath is not forgotten wrath.',
   NULL),
  (6,
   'Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double.',
   'Ἀπόδοτε αὐτῇ ὡς καὶ αὐτὴ ἀπέδωκεν, καὶ διπλώσατε τὰ διπλᾶ κατὰ τὰ ἔργα αὐτῆς· ἐν τῷ ποτηρίῳ ᾧ ἐκέρασεν κεράσατε αὐτῇ διπλοῦν.',
   'Apodote autē hōs kai autē apedōken, kai diplōsate ta dipla kata ta erga autēs; en tō potēriō hō ekerasen kerasate autē diploun.',
   'The principle of measured retribution — Babylon''s own cup, doubled. ''Double'' (διπλώσατε) is OT legal language for full restitution (Exod 22:4-9; Isa 40:2; Jer 16:18). The doubling is not excess; it is the full demand of justice for crimes long unpaid.',
   NULL),
  (7,
   'How much she hath glorified herself, and lived deliciously, so much torment and sorrow give her: for she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow.',
   'ὅσα ἐδόξασεν αὑτὴν καὶ ἐστρηνίασεν, τοσοῦτον δότε αὐτῇ βασανισμὸν καὶ πένθος. Ὅτι ἐν τῇ καρδίᾳ αὐτῆς λέγει· Κάθημαι βασίλισσα, καὶ χήρα οὐκ εἰμί, καὶ πένθος οὐ μὴ ἴδω.',
   'hosa edoxasen hautēn kai estrēniasen, tosouton dote autē basanismon kai penthos. Hoti en tē kardia autēs legei; Kathēmai basilissa, kai chēra ouk eimi, kai penthos ou mē idō.',
   '''I sit a queen, and am no widow'' echoes Isaiah 47:7-8, where literal Babylon used the same self-talk. Pride is not just an attitude but a confession: she has named herself queen and forgotten the day of mourning. The retribution is exactly proportional: as much glory and luxury, so much torment and sorrow.',
   'Self-glorification is a precursor to judgment (Prov 16:18). Babylon''s confidence is delusion: she imagines her wealth secures her future. The text exposes the fragility of every empire that thinks itself invulnerable.'),
  (8,
   'Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is the Lord God who judgeth her.',
   'διὰ τοῦτο ἐν μιᾷ ἡμέρᾳ ἥξουσιν αἱ πληγαὶ αὐτῆς, θάνατος καὶ πένθος καὶ λιμός, καὶ ἐν πυρὶ κατακαυθήσεται· ὅτι ἰσχυρὸς Κύριος ὁ Θεὸς ὁ κρίνας αὐτήν.',
   'dia touto en mia hēmera hēxousin hai plēgai autēs, thanatos kai penthos kai limos, kai en pyri katakauthēsetai; hoti ischyros Kyrios ho Theos ho krinas autēn.',
   '''In one day'' (cf. v.10 ''one hour'') signals the speed of collapse. Three plagues fall: death, mourning, famine. Burning by fire is the standard end of a destroyed city. The reason is Christological-theological: the Lord judging her is strong.',
   'God''s judgment, when it falls, is decisive. Long delays often produce sudden collapses. The strength of the Judge guarantees that none of His sentences fail of execution.'),
  (9,
   'And the kings of the earth, who have committed fornication and lived deliciously with her, shall bewail her, and lament for her, when they shall see the smoke of her burning,',
   'Καὶ κλαύσουσιν καὶ κόψονται ἐπ᾽ αὐτὴν οἱ βασιλεῖς τῆς γῆς οἱ μετ᾽ αὐτῆς πορνεύσαντες καὶ στρηνιάσαντες, ὅταν βλέπωσιν τὸν καπνὸν τῆς πυρώσεως αὐτῆς,',
   'Kai klausousin kai kopsontai ep'' autēn hoi basileis tēs gēs hoi met'' autēs porneusantes kai strēniasantes, hotan blepōsin ton kapnon tēs pyrōseōs autēs,',
   'The first lament — the kings, who profited politically from her. They ''wail'' (κλαύσουσιν) and ''beat their breasts'' (κόψονται), but their grief is over their lost source of wealth, not over their sin. Their tears are for themselves.',
   NULL),
  (10,
   'Standing afar off for the fear of her torment, saying, Alas, alas, that great city Babylon, that mighty city! for in one hour is thy judgment come.',
   'ἀπὸ μακρόθεν ἑστηκότες διὰ τὸν φόβον τοῦ βασανισμοῦ αὐτῆς, λέγοντες· Οὐαί, οὐαί, ἡ πόλις ἡ μεγάλη Βαβυλὼν, ἡ πόλις ἡ ἰσχυρά, ὅτι μιᾷ ὥρᾳ ἦλθεν ἡ κρίσις σου.',
   'apo makrothen hestēkotes dia ton phobon tou basanismou autēs, legontes; Ouai, ouai, hē polis hē megalē Babylōn, hē polis hē ischyra, hoti mia hōra ēlthen hē krisis sou.',
   'The kings stand at a distance — too afraid to come close, too implicated to walk away. ''One hour'' compresses cosmic significance into vivid suddenness. ''Alas, alas'' (οὐαί, οὐαί) is the formal mourning cry, repeated three times in this chapter (vv. 10, 16, 19).',
   NULL),
  (11,
   'And the merchants of the earth shall weep and mourn over her; for no man buyeth their merchandise any more:',
   'Καὶ οἱ ἔμποροι τῆς γῆς κλαίουσιν καὶ πενθοῦσιν ἐπ᾽ αὐτήν, ὅτι τὸν γόμον αὐτῶν οὐδεὶς ἀγοράζει οὐκέτι,',
   'Kai hoi emporoi tēs gēs klaiousin kai penthousin ep'' autēn, hoti ton gomon autōn oudeis agorazei ouketi,',
   'The second lament — the merchants. Their grief is naked: ''no man buyeth.'' The collapse exposes that their tears are about their till, not the city.',
   NULL),
  (12,
   'The merchandise of gold, and silver, and precious stones, and of pearls, and fine linen, and purple, and silk, and scarlet, and all thyine wood, and all manner vessels of ivory, and all manner vessels of most precious wood, and of brass, and iron, and marble,',
   'γόμον χρυσοῦ καὶ ἀργύρου καὶ λίθου τιμίου καὶ μαργαριτῶν καὶ βυσσίνου καὶ πορφύρας καὶ σιρικοῦ καὶ κοκκίνου, καὶ πᾶν ξύλον θύϊνον καὶ πᾶν σκεῦος ἐλεφάντινον καὶ πᾶν σκεῦος ἐκ ξύλου τιμιωτάτου καὶ χαλκοῦ καὶ σιδήρου καὶ μαρμάρου,',
   'gomon chrysou kai argyrou kai lithou timiou kai margaritōn kai byssinou kai porphyras kai sirikou kai kokkinou, kai pan xylon thyinon kai pan skeuos elephantinon kai pan skeuos ek xylou timiōtatou kai chalkou kai sidērou kai marmarou,',
   'The catalog of luxury goods echoes Ezekiel 27''s list of Tyre''s trade. Note the progression: precious metals, gems, fine fabrics, then exotic woods, ivory, metals, stone — the trade of an empire that drains the earth''s resources for the elite.',
   NULL),
  (13,
   'And cinnamon, and odours, and ointments, and frankincense, and wine, and oil, and fine flour, and wheat, and beasts, and sheep, and horses, and chariots, and slaves, and souls of men.',
   'καὶ κιννάμωμον καὶ ἄμωμον καὶ θυμιάματα καὶ μύρον καὶ λίβανον καὶ οἶνον καὶ ἔλαιον καὶ σεμίδαλιν καὶ σῖτον καὶ κτήνη καὶ πρόβατα, καὶ ἵππων καὶ ῥεδῶν καὶ σωμάτων, καὶ ψυχὰς ἀνθρώπων.',
   'kai kinnamōmon kai amōmon kai thymiamata kai myron kai libanon kai oinon kai elaion kai semidalin kai siton kai ktēnē kai probata, kai hippōn kai rhedōn kai sōmatōn, kai psychas anthrōpōn.',
   'The list closes with the most damning item: ''slaves, and souls of men'' (σωμάτων καὶ ψυχὰς ἀνθρώπων — literally ''bodies and souls of men''). Babylon''s commerce traffics in human beings. The juxtaposition with horses and chariots brands the trade as bestial.',
   'The ultimate corruption is the commodification of human beings. When persons become product, an economy stands under the sentence of God. Babylon''s judgment includes specific reckoning for the trafficking of souls.'),
  (14,
   'And the fruits that thy soul lusted after are departed from thee, and all things which were dainty and goodly are departed from thee, and thou shalt find them no more at all.',
   'καὶ ἡ ὀπώρα τῆς ἐπιθυμίας τῆς ψυχῆς σου ἀπῆλθεν ἀπὸ σοῦ, καὶ πάντα τὰ λιπαρὰ καὶ τὰ λαμπρὰ ἀπώλετο ἀπὸ σοῦ, καὶ οὐκέτι αὐτὰ οὐ μὴ εὑρήσουσιν.',
   'kai hē opōra tēs epithymias tēs psychēs sou apēlthen apo sou, kai panta ta lipara kai ta lampra apōleto apo sou, kai ouketi auta ou mē heurēsousin.',
   'Direct address to Babylon: the fruits she desired are gone, and they will never be found again (the double negative ''ou mē'' is emphatic). The soul-lust that drove her economy now mocks her.',
   NULL),
  (15,
   'The merchants of these things, which were made rich by her, shall stand afar off for the fear of her torment, weeping and wailing,',
   'οἱ ἔμποροι τούτων, οἱ πλουτήσαντες ἀπ᾽ αὐτῆς, ἀπὸ μακρόθεν στήσονται διὰ τὸν φόβον τοῦ βασανισμοῦ αὐτῆς, κλαίοντες καὶ πενθοῦντες,',
   'hoi emporoi toutōn, hoi ploutēsantes ap'' autēs, apo makrothen stēsontai dia ton phobon tou basanismou autēs, klaiontes kai penthountes,',
   'Like the kings, the merchants stand at a distance — afraid of being caught in the same fire. Their wealth came ''from her''; their grief is therefore self-interested.',
   NULL),
  (16,
   'And saying, Alas, alas, that great city, that was clothed in fine linen, and purple, and scarlet, and decked with gold, and precious stones, and pearls!',
   'λέγοντες· Οὐαὶ οὐαί, ἡ πόλις ἡ μεγάλη, ἡ περιβεβλημένη βύσσινον καὶ πορφυροῦν καὶ κόκκινον, καὶ κεχρυσωμένη ἐν χρυσῷ καὶ λίθῳ τιμίῳ καὶ μαργαρίταις,',
   'legontes; Ouai ouai, hē polis hē megalē, hē peribeblēmenē byssinon kai porphyroun kai kokkinon, kai kechrysōmenē en chrysō kai lithō timiō kai margaritais,',
   'The merchants'' lament focuses on the city''s clothing — the same wardrobe of the harlot in 17:4. Their sorrow is for the lost market in luxury, not for the lost souls of men.',
   NULL),
  (17,
   'For in one hour so great riches is come to nought. And every shipmaster, and all the company in ships, and sailors, and as many as trade by sea, stood afar off,',
   'ὅτι μιᾷ ὥρᾳ ἠρημώθη ὁ τοσοῦτος πλοῦτος. Καὶ πᾶς κυβερνήτης καὶ πᾶς ὁ ἐπὶ τόπον πλέων καὶ ναῦται καὶ ὅσοι τὴν θάλασσαν ἐργάζονται, ἀπὸ μακρόθεν ἔστησαν,',
   'hoti mia hōra ērēmōthē ho tosoutos ploutos. Kai pas kybernētēs kai pas ho epi topon pleōn kai nautai kai hosoi tēn thalassan ergazontai, apo makrothen estēsan,',
   'The third lament begins — the seafarers. Like the kings and merchants, they stand ''afar off.'' All three groups distance themselves; none reach to help. Wealth, when it falls, has no friends.',
   NULL),
  (18,
   'And cried when they saw the smoke of her burning, saying, What city is like unto this great city!',
   'καὶ ἔκραζον βλέποντες τὸν καπνὸν τῆς πυρώσεως αὐτῆς λέγοντες· Τίς ὁμοία τῇ πόλει τῇ μεγάλῃ;',
   'kai ekrazon blepontes ton kapnon tēs pyrōseōs autēs legontes; Tis homoia tē polei tē megalē?',
   'The seafarers'' cry is the parody of true worship — ''Who is like unto'' is the standard exclamation of God''s incomparability (Exod 15:11; Ps 35:10). Babylon was treated by them as if she were divine. Her fall reveals the idolatry.',
   NULL),
  (19,
   'And they cast dust on their heads, and cried, weeping and wailing, saying, Alas, alas, that great city, wherein were made rich all that had ships in the sea by reason of her costliness! for in one hour is she made desolate.',
   'καὶ ἔβαλον χοῦν ἐπὶ τὰς κεφαλὰς αὐτῶν καὶ ἔκραζον κλαίοντες καὶ πενθοῦντες, λέγοντες· Οὐαὶ οὐαί, ἡ πόλις ἡ μεγάλη, ἐν ᾗ ἐπλούτησαν πάντες οἱ ἔχοντες τὰ πλοῖα ἐν τῇ θαλάσσῃ ἐκ τῆς τιμιότητος αὐτῆς, ὅτι μιᾷ ὥρᾳ ἠρημώθη.',
   'kai ebalon choun epi tas kephalas autōn kai ekrazon klaiontes kai penthountes, legontes; Ouai ouai, hē polis hē megalē, en hē eploutēsan pantes hoi echontes ta ploia en tē thalassē ek tēs timiotētos autēs, hoti mia hōra ērēmōthē.',
   'Casting dust on the head is the ancient gesture of mourning (Josh 7:6; Job 2:12; Ezek 27:30). The shipmasters'' grief is again self-interested — they were ''made rich'' by her costliness. ''In one hour'' returns for the third time, hammering the suddenness.',
   NULL),
  (20,
   'Rejoice over her, thou heaven, and ye holy apostles and prophets; for God hath avenged you on her.',
   'Εὐφραίνου ἐπ᾽ αὐτῇ, οὐρανέ, καὶ οἱ ἅγιοι καὶ οἱ ἀπόστολοι καὶ οἱ προφῆται, ὅτι ἔκρινεν ὁ Θεὸς τὸ κρίμα ὑμῶν ἐξ αὐτῆς.',
   'Euphrainou ep'' autē, ourane, kai hoi hagioi kai hoi apostoloi kai hoi prophētai, hoti ekrinen ho Theos to krima hymōn ex autēs.',
   'A sudden pivot: while earth wails, heaven rejoices. Apostles and prophets are summoned by name — those most often slain by Babylon''s persecutions (cf. Matt 23:34-37). God has ''judged your judgment from her'' — has executed the sentence the saints could not.',
   'Heaven''s celebration of judgment is not vindictive but vindicative. The cry of ''How long?'' (6:10) is finally answered. Joy in justice is not opposed to love; it is love''s mature response when wrong is at last set right.'),
  (21,
   'And a mighty angel took up a stone like a great millstone, and cast it into the sea, saying, Thus with violence shall that great city Babylon be thrown down, and shall be found no more at all.',
   'Καὶ ἦρεν εἷς ἄγγελος ἰσχυρὸς λίθον ὡς μύλινον μέγαν, καὶ ἔβαλεν εἰς τὴν θάλασσαν λέγων· Οὕτως ὁρμήματι βληθήσεται Βαβυλὼν ἡ μεγάλη πόλις, καὶ οὐ μὴ εὑρεθῇ ἔτι.',
   'Kai ēren heis angelos ischyros lithon hōs mylinon megan, kai ebalen eis tēn thalassan legōn; Houtōs hormēmati blēthēsetai Babylōn hē megalē polis, kai ou mē heurethē eti.',
   'A symbolic enacted prophecy in the manner of Jeremiah 51:63-64, where a Jewish messenger threw a scroll-tied stone into the Euphrates as a sign of Babylon''s sinking. The millstone''s weight makes the disappearance final.',
   NULL),
  (22,
   'And the voice of harpers, and musicians, and of pipers, and trumpeters, shall be heard no more at all in thee; and no craftsman, of whatsoever craft he be, shall be found any more in thee; and the sound of a millstone shall be heard no more at all in thee;',
   'καὶ φωνὴ κιθαρῳδῶν καὶ μουσικῶν καὶ αὐλητῶν καὶ σαλπιστῶν οὐ μὴ ἀκουσθῇ ἐν σοὶ ἔτι, καὶ πᾶς τεχνίτης πάσης τέχνης οὐ μὴ εὑρεθῇ ἐν σοὶ ἔτι, καὶ φωνὴ μύλου οὐ μὴ ἀκουσθῇ ἐν σοὶ ἔτι,',
   'kai phōnē kitharōdōn kai mousikōn kai aulētōn kai salpistōn ou mē akousthē en soi eti, kai pas technitēs pasēs technēs ou mē heurethē en soi eti, kai phōnē mylou ou mē akousthē en soi eti,',
   'A litany of silences. Music, craft, and the daily sound of grinding grain — the most basic noises of human civilization — fall silent. The triple ''no more at all'' (οὐ μὴ ... ἔτι) is emphatic.',
   NULL),
  (23,
   'And the light of a candle shall shine no more at all in thee; and the voice of the bridegroom and of the bride shall be heard no more at all in thee: for thy merchants were the great men of the earth; for by thy sorceries were all nations deceived.',
   'καὶ φῶς λύχνου οὐ μὴ φάνῃ ἐν σοὶ ἔτι, καὶ φωνὴ νυμφίου καὶ νύμφης οὐ μὴ ἀκουσθῇ ἐν σοὶ ἔτι, ὅτι οἱ ἔμποροί σου ἦσαν οἱ μεγιστᾶνες τῆς γῆς, ὅτι ἐν τῇ φαρμακείᾳ σου ἐπλανήθησαν πάντα τὰ ἔθνη,',
   'kai phōs lychnou ou mē phanē en soi eti, kai phōnē nymphiou kai nymphēs ou mē akousthē en soi eti, hoti hoi emporoi sou ēsan hoi megistanes tēs gēs, hoti en tē pharmakeia sou eplanēthēsan panta ta ethnē,',
   'No light, no wedding — the simplest joys of life are extinguished. The cause is named: her merchants were the world''s ''great men,'' and her ''sorceries'' (φαρμακεία — drug-craft, magic) deceived the nations. Babylon traded in spiritual narcotic.',
   'Worldly culture often exerts its power through what intoxicates and benumbs. ''Pharmakeia'' covers literal drug-craft and the broader manipulation of perception. Discernment requires sober minds (1 Pet 5:8).'),
  (24,
   'And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth.',
   'καὶ ἐν αὐτῇ αἷμα προφητῶν καὶ ἁγίων εὑρέθη καὶ πάντων τῶν ἐσφαγμένων ἐπὶ τῆς γῆς.',
   'kai en autē haima prophētōn kai hagiōn heurethē kai pantōn tōn esphagmenōn epi tēs gēs.',
   'The chapter''s closing indictment. ''In her was found'' — the bloodstains of all martyrs trace back to the harlot-system. The verb ''ἐσφαγμένων'' (slain, slaughtered) is the same word used of the Lamb (5:6). The ones killed by Babylon are united with the One she could not finally kill.',
   'Persecution has a single source even when many hands hold the sword. The world-system that resists God produces the deaths of His witnesses across every age. God remembers each one.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 18;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἔπεσεν', 'Epesen', 'G4098', 'Aorist of ''piptō'' — has fallen. The doubled cry is the prophetic perfect of certainty: a future event so sure it is announced as already done.', 1),
  ('κατοικητήριον δαιμονίων', 'katoikētērion daimoniōn', 'G2732/G1140', 'Dwelling-place of demons. Once-glorious Babylon becomes a haunt for the spirits she once invited. The reverse of God''s temple, which is His dwelling among His people.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 2;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἐξέλθατε', 'Exelthate', 'G1831', 'Aorist imperative — ''come out!'' Sharp, decisive command. Used in OT for Israel''s exodus from Babylon (Isa 48:20; Jer 50:8). Here applied to spiritual rather than geographic departure.', 1),
  ('συγκοινωνήσητε', 'synkoinōnēsēte', 'G4790', 'Subjunctive of ''synkoinōneō'' — to share in, be a partner in. Compound of ''syn'' (with) + ''koinōneō'' (to share). Refers to active participation, not mere proximity.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 4;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐστρηνίασεν', 'estrēniasen', 'G4763', 'Aorist of ''strēniaō'' — to live wantonly, in luxurious self-indulgence. The root sense is excess and self-pampering, with overtones of arrogance toward those who lack.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 7;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σωμάτων', 'sōmatōn', 'G4983', 'Bodies — used in commercial context as a euphemism for slaves. The merchandise list reduces persons to physical units. The juxtaposition with the next phrase (souls of men) underscores the depth of the dehumanization.', 1),
  ('ψυχὰς ἀνθρώπων', 'psychas anthrōpōn', 'G5590/G444', 'Souls of men. Where ''sōmata'' covers slave traffic, ''psychas'' adds the inner person — the trade reaches into the totality of human personhood. A double indictment of Babylon''s commerce.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 13;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Εὐφραίνου', 'Euphrainou', 'G2165', 'Present imperative — keep rejoicing. From ''eu'' (well) + ''phrēn'' (mind). A summons to settled gladness, not a momentary cheer.', 1),
  ('ἔκρινεν τὸ κρίμα', 'ekrinen to krima', 'G2919/G2917', '''Judged the judgment'' — a Hebraic figure: God has executed the sentence on your behalf. The cognate noun and verb intensify the legal imagery.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 20;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φαρμακείᾳ', 'pharmakeia', 'G5331', 'Sorcery, magic — root of English ''pharmacy.'' Originally drug-craft used for occult ends. Here metaphorically the spell that Babylon casts over nations through her drugs of luxury, illusion, and false religion.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 23;

-- Verse 24
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐσφαγμένων', 'esphagmenōn', 'G4969', 'Slain, slaughtered. Perfect passive participle of ''sphazō.'' The same word used of the Lamb in Rev 5:6 — uniting the martyrs with the One they followed in death.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = 24;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Ezekiel 43:2', 1),
  (1, 'Revelation 10:1', 2),
  (2, 'Isaiah 13:21-22', 1),
  (2, 'Isaiah 21:9', 2),
  (2, 'Jeremiah 50:39', 3),
  (3, 'Jeremiah 51:7', 1),
  (3, 'Revelation 14:8', 2),
  (3, 'Revelation 17:2', 3),
  (4, 'Isaiah 48:20', 1),
  (4, 'Isaiah 52:11', 2),
  (4, 'Jeremiah 50:8', 3),
  (4, 'Jeremiah 51:6', 4),
  (5, 'Genesis 11:4', 1),
  (5, 'Jeremiah 51:9', 2),
  (5, 'Revelation 16:19', 3),
  (6, 'Psalm 137:8', 1),
  (6, 'Jeremiah 50:29', 2),
  (6, 'Isaiah 40:2', 3),
  (7, 'Isaiah 47:7-9', 1),
  (7, 'Ezekiel 28:2', 2),
  (8, 'Isaiah 47:9', 1),
  (8, 'Jeremiah 50:31-32', 2),
  (9, 'Ezekiel 26:16-17', 1),
  (9, 'Revelation 17:2', 2),
  (10, 'Revelation 14:8', 1),
  (10, 'Revelation 18:17', 2),
  (11, 'Ezekiel 27:27-36', 1),
  (12, 'Ezekiel 27:12-22', 1),
  (12, 'Revelation 17:4', 2),
  (13, 'Ezekiel 27:13', 1),
  (13, 'Joel 3:6', 2),
  (14, 'Revelation 18:11', 1),
  (15, 'Revelation 18:3', 1),
  (15, 'Revelation 18:10', 2),
  (16, 'Revelation 17:4', 1),
  (16, 'Ezekiel 27:24', 2),
  (17, 'Ezekiel 27:27', 1),
  (17, 'Isaiah 23:14', 2),
  (18, 'Ezekiel 27:32', 1),
  (18, 'Exodus 15:11', 2),
  (19, 'Ezekiel 27:30', 1),
  (19, 'Joshua 7:6', 2),
  (19, 'Job 2:12', 3),
  (20, 'Jeremiah 51:48', 1),
  (20, 'Deuteronomy 32:43', 2),
  (20, 'Revelation 19:1-3', 3),
  (21, 'Jeremiah 51:63-64', 1),
  (21, 'Ezekiel 26:21', 2),
  (22, 'Ezekiel 26:13', 1),
  (22, 'Isaiah 24:8', 2),
  (23, 'Jeremiah 25:10', 1),
  (23, 'Isaiah 47:9', 2),
  (23, 'Nahum 3:4', 3),
  (24, 'Matthew 23:35', 1),
  (24, 'Revelation 6:9-10', 2),
  (24, 'Revelation 17:6', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 18 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 18 Complete!
-- 24 verses · 7 key verses with word studies (12 words)
-- Cross-references for 24 verses (61 refs)
-- ═══════════════════════════════════════════════════════
