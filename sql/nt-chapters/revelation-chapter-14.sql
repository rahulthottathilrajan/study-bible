-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 14 — The Lamb, the 144,000, and the Three Angels
-- 20 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 14,
  'Revelation 14 stands as a parenthetical interlude between the visions of the two beasts (ch. 13) and the seven last plagues (ch. 15-16), offering both consolation to the faithful and a solemn warning to the wicked. The chapter opens with the triumphant Lamb standing on Mount Zion accompanied by the redeemed 144,000 who bear His Father''s name. Three angelic proclamations follow: the everlasting gospel, the fall of Babylon, and the doom of those who worship the beast. The chapter closes with two harvest visions—the harvest of the saints (grain) and the vintage of the wicked (the winepress of God''s wrath). The structural movement from worship to warning to judgment underscores the certainty of God''s reign and the urgency of faithful endurance.',
  'The Lamb, the 144,000, and the Three Angels',
  'Ἀρνίον (Arnion)',
  'A diminutive of ''arēn'' (lamb), ''arnion'' is the dominant title for Christ in Revelation (29 occurrences), emphasizing His sacrificial death and resurrected sovereignty. The Lamb stands while the beast falls, and those marked by the Lamb''s name are preserved through the very judgments that consume the earth-dwellers.',
  '["Section 1 (vv.1-5): The Lamb and the 144,000 on Mount Zion","Section 2 (vv.6-7): The First Angel — The Everlasting Gospel","Section 3 (v.8): The Second Angel — The Fall of Babylon","Section 4 (vv.9-12): The Third Angel — Warning Against the Beast and Call to Endurance","Section 5 (v.13): Blessing on the Dead Who Die in the Lord","Section 6 (vv.14-20): The Harvest of the Earth and the Winepress of Wrath"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.',
   'Καὶ εἶδον, καὶ ἰδοὺ τὸ Ἀρνίον ἑστὸς ἐπὶ τὸ ὄρος Σιών, καὶ μετ᾽ αὐτοῦ ἑκατὸν τεσσεράκοντα τέσσαρες χιλιάδες ἔχουσαι τὸ ὄνομα αὐτοῦ καὶ τὸ ὄνομα τοῦ Πατρὸς αὐτοῦ γεγραμμένον ἐπὶ τῶν μετώπων αὐτῶν.',
   'Kai eidon, kai idou to Arnion hestos epi to oros Siōn, kai met'' autou hekaton tesserakonta tessares chiliades echousai to onoma autou kai to onoma tou Patros autou gegrammenon epi tōn metōpōn autōn.',
   'After the dark vision of the beasts in chapter 13, John''s eyes are lifted to ''Mount Sion,'' the mountain of God''s presence (Ps 2:6; Heb 12:22). The Lamb ''stood'' (ἑστὸς, perfect participle), suggesting permanent triumph over the slain-and-risen reality of Rev 5:6. The 144,000, first introduced in Revelation 7, are the same redeemed remnant—now seen victorious. Their possession of the Father''s name on their foreheads stands in deliberate contrast to the mark of the beast (13:16), marking ownership and protection.',
   'The Lamb''s standing on Mount Zion vindicates the persecuted church: the Antichrist''s reign in chapter 13 does not have the last word. Believers are ''sealed'' for God before any plague falls (cf. Rev 7:3), and divine ownership is the ground of perseverance. This verse anchors assurance in election: those who belong to Christ cannot be plucked from His hand (John 10:28-29).'),
  (2,
   'And I heard a voice from heaven, as the voice of many waters, and as the voice of a great thunder: and I heard the voice of harpers harping with their harps:',
   'Καὶ ἤκουσα φωνὴν ἐκ τοῦ οὐρανοῦ ὡς φωνὴν ὑδάτων πολλῶν καὶ ὡς φωνὴν βροντῆς μεγάλης· καὶ ἡ φωνὴ ἣν ἤκουσα ὡς κιθαρῳδῶν κιθαριζόντων ἐν ταῖς κιθάραις αὐτῶν.',
   'Kai ēkousa phōnēn ek tou ouranou hōs phōnēn hydatōn pollōn kai hōs phōnēn brontēs megalēs; kai hē phōnē hēn ēkousa hōs kitharōdōn kitharizontōn en tais kitharais autōn.',
   'The triple description—many waters, great thunder, and harpers—blends the awe-inspiring and the melodious. ''Many waters'' echoes Ezekiel''s vision of God''s glory (Ezek 43:2), and ''great thunder'' recalls Sinai (Exod 19:16). Yet the same voice is also harp-like, beautifully ordered. This is heaven''s worship: powerful enough to shake creation, yet drawn out in praise.',
   NULL),
  (3,
   'And they sung as it were a new song before the throne, and before the four beasts, and the elders: and no man could learn that song but the hundred and forty and four thousand, which were redeemed from the earth.',
   'Καὶ ᾄδουσιν ᾠδὴν καινὴν ἐνώπιον τοῦ θρόνου καὶ ἐνώπιον τῶν τεσσάρων ζῴων καὶ τῶν πρεσβυτέρων· καὶ οὐδεὶς ἐδύνατο μαθεῖν τὴν ᾠδὴν εἰ μὴ αἱ ἑκατὸν τεσσεράκοντα τέσσαρες χιλιάδες, οἱ ἠγορασμένοι ἀπὸ τῆς γῆς.',
   'Kai adousin ōdēn kainēn enōpion tou thronou kai enōpion tōn tessarōn zōōn kai tōn presbyterōn; kai oudeis edynato mathein tēn ōdēn ei mē hai hekaton tesserakonta tessares chiliades, hoi ēgorasmenoi apo tēs gēs.',
   'The ''new song'' (ᾠδὴν καινὴν) recalls the Psalter''s theme of fresh praise for fresh deliverance (Ps 33:3; 96:1). Only the redeemed can ''learn'' (μαθεῖν) it, because experiential knowledge of redemption is the song''s grammar. The 144,000 are explicitly identified as ''redeemed from the earth'' (ἠγορασμένοι, ''purchased,'' a market term — Rev 5:9), grounding worship in the Lamb''s atoning purchase.',
   'Worship springs from redemption. Those who have not been ''bought with a price'' (1 Cor 6:20) cannot enter into the song of the Lamb. This verse undercuts every notion of generic spirituality and roots true worship in the cross.'),
  (4,
   'These are they which were not defiled with women; for they are virgins. These are they which follow the Lamb whithersoever he goeth. These were redeemed from among men, being the firstfruits unto God and to the Lamb.',
   'Οὗτοί εἰσιν οἳ μετὰ γυναικῶν οὐκ ἐμολύνθησαν· παρθένοι γάρ εἰσιν. Οὗτοι οἱ ἀκολουθοῦντες τῷ Ἀρνίῳ ὅπου ἂν ὑπάγῃ· οὗτοι ἠγοράσθησαν ἀπὸ τῶν ἀνθρώπων ἀπαρχὴ τῷ Θεῷ καὶ τῷ Ἀρνίῳ.',
   'Houtoi eisin hoi meta gynaikōn ouk emolynthēsan; parthenoi gar eisin. Houtoi hoi akolouthountes tō Arniō hopou an hypagē; houtoi ēgorasthēsan apo tōn anthrōpōn aparchē tō Theō kai tō Arniō.',
   'Most interpreters read the ''virgin'' language symbolically: spiritual purity, undefiled from the harlot Babylon (Rev 17:1-2) and the idolatry of the beast. The Old Testament uses ''virgin daughter Zion'' for faithful Israel (2 Kgs 19:21; Lam 2:13). Their defining mark is that they ''follow the Lamb wherever he goes,'' the simplest definition of discipleship. ''Firstfruits'' (ἀπαρχὴ) signals consecration to God of the whole harvest (cf. Rom 11:16; James 1:18).',
   'True purity is not merely sexual but spiritual fidelity to Christ. The 144,000 are pictured as the consecrated firstfruits, guaranteeing the larger harvest. Discipleship is essentially following — not negotiating, not pausing, but going where the Lamb goes.'),
  (5,
   'And in their mouth was found no guile: for they are without fault before the throne of God.',
   'Καὶ ἐν τῷ στόματι αὐτῶν οὐχ εὑρέθη ψεῦδος· ἄμωμοι γάρ εἰσιν.',
   'Kai en tō stomati autōn ouch heurethē pseudos; amōmoi gar eisin.',
   '''No guile'' (ψεῦδος, falsehood) sets them in opposition to the lying second beast (Rev 13:14) and the great deception of the harlot. ''Without fault'' (ἄμωμοι) is sacrificial vocabulary used of Christ Himself (1 Pet 1:19) — the Lamb''s perfections imputed to His people stand them blameless before the throne.',
   'The redeemed bear the Lamb''s own character: truthful speech and blameless standing. This is not native to them; it is reckoned through the merit of Christ and worked out by the Spirit (Eph 1:4; Phil 2:15). The text describes a positional reality that is increasingly evident in conduct.'),
  (6,
   'And I saw another angel fly in the midst of heaven, having the everlasting gospel to preach unto them that dwell on the earth, and to every nation, and kindred, and tongue, and people,',
   'Καὶ εἶδον ἄλλον ἄγγελον πετόμενον ἐν μεσουρανήματι, ἔχοντα εὐαγγέλιον αἰώνιον εὐαγγελίσαι τοὺς καθημένους ἐπὶ τῆς γῆς, καὶ ἐπὶ πᾶν ἔθνος καὶ φυλὴν καὶ γλῶσσαν καὶ λαόν,',
   'Kai eidon allon angelon petomenon en mesouranēmati, echonta euangelion aiōnion euangelisai tous kathēmenous epi tēs gēs, kai epi pan ethnos kai phylēn kai glōssan kai laon,',
   'The first of three angels announces the ''everlasting gospel'' (εὐαγγέλιον αἰώνιον) — eternal because it springs from God''s eternal counsel and accomplishes eternal salvation. ''In the midst of heaven'' (μεσουρανήματι) means at the zenith, ensuring universal visibility. The fourfold ''nation, tribe, tongue, and people'' is a stock formula in Revelation (5:9; 7:9) emphasizing global reach: the gospel is offered universally before judgment falls.',
   'God does not judge the world without first making His salvation widely known. Even at the threshold of final wrath, the gospel is heralded — vindicating God''s justice (Rom 1:18-20) and showing His desire that none perish (2 Pet 3:9). The mission of the church echoes this angelic mandate.'),
  (7,
   'Saying with a loud voice, Fear God, and give glory to him; for the hour of his judgment is come: and worship him that made heaven, and earth, and the sea, and the fountains of waters.',
   'Λέγων ἐν φωνῇ μεγάλῃ· Φοβήθητε τὸν Θεὸν καὶ δότε αὐτῷ δόξαν, ὅτι ἦλθεν ἡ ὥρα τῆς κρίσεως αὐτοῦ· καὶ προσκυνήσατε τῷ ποιήσαντι τὸν οὐρανὸν καὶ τὴν γῆν καὶ θάλασσαν καὶ πηγὰς ὑδάτων.',
   'Legōn en phōnē megalē; Phobēthēte ton Theon kai dote autō doxan, hoti ēlthen hē hōra tēs kriseōs autou; kai proskynēsate tō poiēsanti ton ouranon kai tēn gēn kai thalassan kai pēgas hydatōn.',
   'The angel''s message has three imperatives: fear God, give glory, and worship the Creator. The grounding is twofold — the hour of judgment has arrived, and the One judging is the Maker of all (Acts 14:15; 17:24). Creation theology grounds the gospel call: the One who made you has the right to judge you and to be worshiped.',
   'The everlasting gospel is not generic religious sentiment but a specific summons to honor the Creator-God who is also the Judge. Worship of creation (or of the beast that emerges from it) is overturned by the call to worship the Maker. Reverent fear is the proper posture before holy judgment.'),
  (8,
   'And there followed another angel, saying, Babylon is fallen, is fallen, that great city, because she made all nations drink of the wine of the wrath of her fornication.',
   'Καὶ ἄλλος ἄγγελος δεύτερος ἠκολούθησεν λέγων· Ἔπεσεν, ἔπεσεν Βαβυλὼν ἡ μεγάλη, ἣ ἐκ τοῦ οἴνου τοῦ θυμοῦ τῆς πορνείας αὐτῆς πεπότικεν πάντα τὰ ἔθνη.',
   'Kai allos angelos deuteros ēkolouthēsen legōn; Epesen, epesen Babylōn hē megalē, hē ek tou oinou tou thymou tēs porneias autēs pepotiken panta ta ethnē.',
   '''Babylon'' here is the symbolic city of human pride and idolatry, which Revelation will unveil more fully in chapters 17-18. The doubled ''fallen, fallen'' echoes Isaiah 21:9 (announcing literal Babylon''s collapse) — the prophetic perfect treats certain future judgment as already done. Babylon''s sin is twofold: she has both seduced (''fornication'') and intoxicated (''made drink'') the nations.',
   'Every system that promises life apart from God ultimately falls. The certainty of Babylon''s collapse comforts the faithful and warns the entangled: do not bind yourself to what is doomed. The doubling of ''fallen'' presses the inevitability — what God has spoken is as good as done.'),
  (9,
   'And the third angel followed them, saying with a loud voice, If any man worship the beast and his image, and receive his mark in his forehead, or in his hand,',
   'Καὶ ἄλλος ἄγγελος τρίτος ἠκολούθησεν αὐτοῖς λέγων ἐν φωνῇ μεγάλῃ· Εἴ τις προσκυνεῖ τὸ θηρίον καὶ τὴν εἰκόνα αὐτοῦ, καὶ λαμβάνει χάραγμα ἐπὶ τοῦ μετώπου αὐτοῦ ἢ ἐπὶ τὴν χεῖρα αὐτοῦ,',
   'Kai allos angelos tritos ēkolouthēsen autois legōn en phōnē megalē; Ei tis proskynei to thērion kai tēn eikona autou, kai lambanei charagma epi tou metōpou autou ē epi tēn cheira autou,',
   'The third angel directly counters the demand of Revelation 13:15-17. To worship the beast or wear its mark is to swap allegiances — and the consequences are spelled out in v.10. The ''loud voice'' indicates the gravity and universality of the warning.',
   NULL),
  (10,
   'The same shall drink of the wine of the wrath of God, which is poured out without mixture into the cup of his indignation; and he shall be tormented with fire and brimstone in the presence of the holy angels, and in the presence of the Lamb:',
   'Καὶ αὐτὸς πίεται ἐκ τοῦ οἴνου τοῦ θυμοῦ τοῦ Θεοῦ τοῦ κεκερασμένου ἀκράτου ἐν τῷ ποτηρίῳ τῆς ὀργῆς αὐτοῦ, καὶ βασανισθήσεται ἐν πυρὶ καὶ θείῳ ἐνώπιον ἀγγέλων ἁγίων καὶ ἐνώπιον τοῦ Ἀρνίου.',
   'Kai autos pietai ek tou oinou tou thymou tou Theou tou kekerasmenou akratou en tō potēriō tēs orgēs autou, kai basanisthēsetai en pyri kai theiō enōpion angelōn hagiōn kai enōpion tou Arniou.',
   '''Without mixture'' (ἀκράτου) is striking — ancient wine was normally diluted with water; undiluted wine signals undiminished severity. The cup of wrath is a recurring biblical image (Ps 75:8; Jer 25:15). Fire and brimstone recall Sodom (Gen 19:24). Judgment ''in the presence of the Lamb'' underscores that the meek Christ of Calvary is also the holy Judge of the wicked.',
   'Final judgment is real and terrible, executed in the very presence of the Lamb. Sentimental views of Christ that exclude His role as Judge cannot be reconciled with this text (cf. John 5:22-27; Acts 17:31). The undiluted cup answers the diluted gospel: God''s holiness will not be compromised.'),
  (11,
   'And the smoke of their torment ascendeth up for ever and ever: and they have no rest day nor night, who worship the beast and his image, and whosoever receiveth the mark of his name.',
   'Καὶ ὁ καπνὸς τοῦ βασανισμοῦ αὐτῶν εἰς αἰῶνας αἰώνων ἀναβαίνει, καὶ οὐκ ἔχουσιν ἀνάπαυσιν ἡμέρας καὶ νυκτὸς οἱ προσκυνοῦντες τὸ θηρίον καὶ τὴν εἰκόνα αὐτοῦ, καὶ εἴ τις λαμβάνει τὸ χάραγμα τοῦ ὀνόματος αὐτοῦ.',
   'Kai ho kapnos tou basanismou autōn eis aiōnas aiōnōn anabainei, kai ouk echousin anapausin hēmeras kai nyktos hoi proskynountes to thērion kai tēn eikona autou, kai ei tis lambanei to charagma tou onomatos autou.',
   '''Forever and ever'' (εἰς αἰῶνας αἰώνων, lit. ''unto ages of ages'') is the strongest Greek superlative for unending duration, the same phrase used of God''s eternity (Rev 4:9-10). The image of ascending smoke recalls Edom''s perpetual judgment in Isaiah 34:10. ''No rest day nor night'' is the deliberate inversion of the four living creatures'' restless worship of God (Rev 4:8).',
   'The text describes conscious, unending judgment for those who finally and fully ally with the beast. While interpretive nuance varies on the precise mode of eternal punishment, Scripture''s plain language presses the seriousness of resisting Christ to the end.'),
  (12,
   'Here is the patience of the saints: here are they that keep the commandments of God, and the faith of Jesus.',
   'Ὧδε ἡ ὑπομονὴ τῶν ἁγίων ἐστίν, οἱ τηροῦντες τὰς ἐντολὰς τοῦ Θεοῦ καὶ τὴν πίστιν Ἰησοῦ.',
   'Hōde hē hypomonē tōn hagiōn estin, hoi tērountes tas entolas tou Theou kai tēn pistin Iēsou.',
   'The same call sounded in 13:10 returns. The double identifier — ''keep the commandments of God'' and ''the faith of Jesus'' — defines the saints by both obedience and trust. The contrast with the beast-worshipers is sharp: they have no rest, but the saints persevere by patient endurance.',
   'Saving faith is not opposed to obedience but expresses itself in keeping God''s commands (cf. James 2:14-26; Rom 1:5). ''The faith of Jesus'' may be objective (the body of teaching about Him) or subjective (faith in Him); both are true. Endurance is the visible mark of genuine faith.'),
  (13,
   'And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in the Lord from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.',
   'Καὶ ἤκουσα φωνῆς ἐκ τοῦ οὐρανοῦ λεγούσης· Γράψον· Μακάριοι οἱ νεκροὶ οἱ ἐν Κυρίῳ ἀποθνῄσκοντες ἀπ᾽ ἄρτι. Ναί, λέγει τὸ Πνεῦμα, ἵνα ἀναπαήσονται ἐκ τῶν κόπων αὐτῶν· τὰ γὰρ ἔργα αὐτῶν ἀκολουθεῖ μετ᾽ αὐτῶν.',
   'Kai ēkousa phōnēs ek tou ouranou legousēs; Grapson; Makarioi hoi nekroi hoi en Kyriō apothnēskontes ap'' arti. Nai, legei to Pneuma, hina anapaēsontai ek tōn kopōn autōn; ta gar erga autōn akolouthei met'' autōn.',
   'The second of seven beatitudes in Revelation. ''From henceforth'' does not mean only the future-blessed but signals the special relevance for those facing the beast''s persecution. ''Rest'' (ἀναπαήσονται) directly counters the beast-worshipers'' lack of rest in v.11. Their works ''follow with them'' — fruit of faith accompanies them into eternity (cf. 1 Cor 3:13-15), not as the basis of acceptance but as evidence and reward.',
   'Death in Christ is gain (Phil 1:21), and the labors of the saints are not lost. Works do not earn salvation, but they will be remembered and rewarded. The text answers the deepest fear of the persecuted: that their faithfulness was wasted.'),
  (14,
   'And I looked, and behold a white cloud, and upon the cloud one sat like unto the Son of man, having on his head a golden crown, and in his hand a sharp sickle.',
   'Καὶ εἶδον, καὶ ἰδοὺ νεφέλη λευκή, καὶ ἐπὶ τὴν νεφέλην καθήμενον ὅμοιον υἱῷ ἀνθρώπου, ἔχων ἐπὶ τῆς κεφαλῆς αὐτοῦ στέφανον χρυσοῦν καὶ ἐν τῇ χειρὶ αὐτοῦ δρέπανον ὀξύ.',
   'Kai eidon, kai idou nephelē leukē, kai epi tēn nephelēn kathēmenon homoion huiō anthrōpou, echōn epi tēs kephalēs autou stephanon chrysoun kai en tē cheiri autou drepanon oxy.',
   '''One like the Son of man'' is direct citation of Daniel 7:13 — Christ in His messianic-judicial role. The white cloud is a vehicle of divine glory (Dan 7:13; Matt 24:30; Acts 1:9). The golden crown (στέφανον, victor''s crown) marks Him as triumphant. The sickle (δρέπανον) signals harvest.',
   'Christ Himself executes final judgment. The Son of Man motif unites His suffering humanity with His sovereign authority (Mark 14:62). The reapers'' tools are in His hand — the timing and outcome of judgment belong to Him alone.'),
  (15,
   'And another angel came out of the temple, crying with a loud voice to him that sat on the cloud, Thrust in thy sickle, and reap: for the time is come for thee to reap; for the harvest of the earth is ripe.',
   'Καὶ ἄλλος ἄγγελος ἐξῆλθεν ἐκ τοῦ ναοῦ κράζων ἐν φωνῇ μεγάλῃ τῷ καθημένῳ ἐπὶ τῆς νεφέλης· Πέμψον τὸ δρέπανόν σου καὶ θέρισον, ὅτι ἦλθεν ἡ ὥρα θερίσαι, ὅτι ἐξηράνθη ὁ θερισμὸς τῆς γῆς.',
   'Kai allos angelos exēlthen ek tou naou krazōn en phōnē megalē tō kathēmenō epi tēs nephelēs; Pempson to drepanon sou kai therison, hoti ēlthen hē hōra therisai, hoti exēranthē ho therismos tēs gēs.',
   'The angel issues the cry from the temple — i.e., from God''s presence; the timing is determined by the Father (cf. Mark 13:32). ''Ripe'' (ἐξηράνθη, ''become dry'') is the language of grain ready for harvest. The instruction is not the angel commanding Christ but communicating the Father''s appointed hour.',
   'God sets the times. Even Christ in His messianic role acts at the Father''s appointed signal (Acts 1:7). The harvest is not premature; it is providentially timed.'),
  (16,
   'And he that sat on the cloud thrust in his sickle on the earth; and the earth was reaped.',
   'Καὶ ἔβαλεν ὁ καθήμενος ἐπὶ τῆς νεφέλης τὸ δρέπανον αὐτοῦ ἐπὶ τὴν γῆν, καὶ ἐθερίσθη ἡ γῆ.',
   'Kai ebalen ho kathēmenos epi tēs nephelēs to drepanon autou epi tēn gēn, kai etheristhē hē gē.',
   'A single, swift sentence: the harvest is done. Many interpreters see the grain harvest as the gathering of the elect (cf. Matt 13:30; Mark 4:29), distinguished from the vintage of wrath that follows in vv.17-20.',
   NULL),
  (17,
   'And another angel came out of the temple which is in heaven, he also having a sharp sickle.',
   'Καὶ ἄλλος ἄγγελος ἐξῆλθεν ἐκ τοῦ ναοῦ τοῦ ἐν τῷ οὐρανῷ, ἔχων καὶ αὐτὸς δρέπανον ὀξύ.',
   'Kai allos angelos exēlthen ek tou naou tou en tō ouranō, echōn kai autos drepanon oxy.',
   'A second harvester appears, this one explicitly an angel from the heavenly temple. The doubled scene — grain harvest then vintage — distinguishes the two reapings.',
   NULL),
  (18,
   'And another angel came out from the altar, which had power over fire; and cried with a loud cry to him that had the sharp sickle, saying, Thrust in thy sharp sickle, and gather the clusters of the vine of the earth; for her grapes are fully ripe.',
   'Καὶ ἄλλος ἄγγελος ἐξῆλθεν ἐκ τοῦ θυσιαστηρίου, ὁ ἔχων ἐξουσίαν ἐπὶ τοῦ πυρός, καὶ ἐφώνησεν κραυγῇ μεγάλῃ τῷ ἔχοντι τὸ δρέπανον τὸ ὀξὺ λέγων· Πέμψον σου τὸ δρέπανον τὸ ὀξὺ καὶ τρύγησον τοὺς βότρυας τῆς ἀμπέλου τῆς γῆς, ὅτι ἤκμασαν αἱ σταφυλαὶ αὐτῆς.',
   'Kai allos angelos exēlthen ek tou thysiastēriou, ho echōn exousian epi tou pyros, kai ephōnēsen kraugē megalē tō echonti to drepanon to oxy legōn; Pempson sou to drepanon to oxy kai trygēson tous botryas tēs ampelou tēs gēs, hoti ēkmasan hai staphylai autēs.',
   'The angel emerges from the altar — the same altar associated with the prayers of the saints and the cry for vindication (Rev 6:9-10; 8:3-5). His ''power over fire'' links his commission to the fire of judgment. The ripeness of the vintage shows that wickedness has reached its full measure (cf. Gen 15:16; Joel 3:13).',
   'Final wrath answers the prayers of the persecuted. The same altar that received the saints'' cries now sends out the angel who orders the vintage. God is patient, but His patience does not equal indifference.'),
  (19,
   'And the angel thrust in his sickle into the earth, and gathered the vine of the earth, and cast it into the great winepress of the wrath of God.',
   'Καὶ ἔβαλεν ὁ ἄγγελος τὸ δρέπανον αὐτοῦ εἰς τὴν γῆν, καὶ ἐτρύγησεν τὴν ἄμπελον τῆς γῆς καὶ ἔβαλεν εἰς τὴν ληνὸν τοῦ θυμοῦ τοῦ Θεοῦ τὸν μέγαν.',
   'Kai ebalen ho angelos to drepanon autou eis tēn gēn, kai etrygēsen tēn ampelon tēs gēs kai ebalen eis tēn lēnon tou thymou tou Theou ton megan.',
   'The winepress (ληνὸς) image draws on Isaiah 63:1-6 and Joel 3:13. As grapes are crushed for wine, so the wicked are crushed in judgment. The image is gruesome but biblically rooted; the same Christ who was crushed for sinners (Isa 53:5) ultimately treads the winepress in righteous wrath against impenitent sinners.',
   NULL),
  (20,
   'And the winepress was trodden without the city, and blood came out of the winepress, even unto the horse bridles, by the space of a thousand and six hundred furlongs.',
   'Καὶ ἐπατήθη ἡ ληνὸς ἔξωθεν τῆς πόλεως, καὶ ἐξῆλθεν αἷμα ἐκ τῆς ληνοῦ ἄχρι τῶν χαλινῶν τῶν ἵππων, ἀπὸ σταδίων χιλίων ἑξακοσίων.',
   'Kai epatēthē hē lēnos exōthen tēs poleōs, kai exēlthen haima ek tēs lēnou achri tōn chalinōn tōn hippōn, apo stadiōn chiliōn hexakosiōn.',
   '''Without the city'' (ἔξωθεν τῆς πόλεως) is the place of judgment outside Jerusalem (cf. Heb 13:12). 1,600 stadia is approximately 184 miles — a hyperbolic image suggesting massive scope, often interpreted as roughly the length of Palestine. The depth ''to the horse bridles'' is intentional excess, communicating the totality and horror of judgment.',
   'God''s wrath, when finally unleashed, is overwhelming. The hyperbolic measurement is meant to staggers the reader and drive home the seriousness of unrepented rebellion. The same God who in mercy sent His Son to be crushed outside the city will, in justice, judge those who reject Him.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 14;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἀρνίον', 'Arnion', 'G721', 'A diminutive of ''arēn'' (lamb), used 29 times in Revelation as the dominant title for Christ. It evokes the Passover lamb, the suffering servant of Isaiah 53, and the slain-yet-standing victor of Revelation 5:6. The form emphasizes both meekness and the redemptive necessity of His death.', 1),
  ('Σιών', 'Siōn', 'G4622', 'Mount Zion — originally the Jebusite stronghold captured by David, then synonymous with the Temple Mount and ultimately the heavenly city of God (Heb 12:22). Here it functions as the eschatological gathering place where the Lamb stands triumphant with His redeemed.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ᾠδὴν καινὴν', 'ōdēn kainēn', 'G3601/G2537', 'A ''new song'' — the Psalter''s recurring response to fresh saving acts (Ps 33:3; 40:3; 96:1; 98:1). ''Kainos'' denotes qualitative newness, not merely chronological. The new song answers the new act of redemption.', 1),
  ('ἠγορασμένοι', 'ēgorasmenoi', 'G59', 'Perfect passive participle of ''agorazō'' (to buy in the marketplace). It signals a completed purchase whose effect endures. The same verb is used of Christ purchasing His people with His blood (Rev 5:9; 1 Cor 6:20).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 3;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('εὐαγγέλιον αἰώνιον', 'euangelion aiōnion', 'G2098/G166', 'The ''eternal gospel'' — eternal because rooted in God''s eternal counsel (Eph 1:4-7), eternal in its effect (eternal life), and eternal in validity (the same gospel from Genesis 3:15 onward). It does not change to suit cultural moods.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 6;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Βαβυλὼν', 'Babylōn', 'G897', 'Babylon — the historical empire that destroyed Jerusalem, used here symbolically for the world-system of pride and idolatry that opposes God. In Revelation 17-18 it is unveiled as a harlot-city. The doubled ''fallen, fallen'' echoes Isaiah 21:9.', 1),
  ('πορνείας', 'porneias', 'G4202', 'Sexual immorality, used metaphorically of spiritual unfaithfulness (Hos 1-3; Jer 3:6-9). Babylon''s ''fornication'' is her seduction of nations into idolatry and false worship.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 8;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀκράτου', 'akratou', 'G194', 'Undiluted, unmixed. Ancient wine was customarily mixed with water; ''akratos'' wine is at full strength. The image is of God''s wrath poured out at full intensity, without mitigation.', 1),
  ('θείῳ', 'theiō', 'G2303', 'Brimstone (sulphur). Combined with fire, it recalls the destruction of Sodom and Gomorrah (Gen 19:24) — a paradigm of divine judgment on persistent rebellion.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 10;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑπομονὴ', 'hypomonē', 'G5281', 'Patient endurance, steadfastness under pressure. Not passive resignation but active persistence in faith and obedience while awaiting vindication.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 12;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Μακάριοι', 'Makarioi', 'G3107', 'Blessed, happy in the deepest sense — the same word that opens each Beatitude (Matt 5:3-12). The blessing is a divinely-conferred state of well-being, not a human emotion.', 1),
  ('ἀναπαήσονται', 'anapaēsontai', 'G373', 'They shall rest, find refreshment. The future passive emphasizes that rest is given to them, not achieved by them. It is the answer to ''no rest day nor night'' for the beast-worshipers in v.11.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 13;

-- Verse 14
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('υἱῷ ἀνθρώπου', 'huiō anthrōpou', 'G5207/G444', 'Son of Man — direct citation of Daniel 7:13. Christ''s preferred self-designation, fusing humanity with the messianic-judicial role of the heavenly figure to whom dominion is given.', 1),
  ('δρέπανον', 'drepanon', 'G1407', 'A sickle, the harvest implement. In prophetic literature (Joel 3:13) it signals decisive eschatological gathering — both ingathering of the elect and judgment of the wicked.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = 14;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Revelation 7:3-4', 1),
  (1, 'Psalm 2:6', 2),
  (1, 'Hebrews 12:22-24', 3),
  (2, 'Ezekiel 43:2', 1),
  (2, 'Revelation 1:15', 2),
  (2, 'Revelation 19:6', 3),
  (3, 'Psalm 33:3', 1),
  (3, 'Revelation 5:9', 2),
  (3, 'Revelation 15:3', 3),
  (4, '2 Corinthians 11:2', 1),
  (4, 'James 1:18', 2),
  (4, 'John 10:27', 3),
  (5, 'Zephaniah 3:13', 1),
  (5, '1 Peter 1:19', 2),
  (5, 'Ephesians 1:4', 3),
  (6, 'Matthew 24:14', 1),
  (6, 'Romans 1:16', 2),
  (6, 'Revelation 5:9', 3),
  (7, 'Acts 17:24-31', 1),
  (7, 'Psalm 96:9', 2),
  (7, 'Ecclesiastes 12:13-14', 3),
  (8, 'Isaiah 21:9', 1),
  (8, 'Jeremiah 51:7-8', 2),
  (8, 'Revelation 18:2-3', 3),
  (9, 'Revelation 13:15-17', 1),
  (9, 'Revelation 14:11', 2),
  (10, 'Psalm 75:8', 1),
  (10, 'Isaiah 51:17', 2),
  (10, 'Genesis 19:24', 3),
  (11, 'Isaiah 34:9-10', 1),
  (11, 'Revelation 4:8', 2),
  (11, 'Revelation 19:3', 3),
  (12, 'Revelation 12:17', 1),
  (12, 'Revelation 13:10', 2),
  (12, '1 John 5:3', 3),
  (13, 'Hebrews 4:9-10', 1),
  (13, '1 Corinthians 15:58', 2),
  (13, 'Philippians 1:21', 3),
  (14, 'Daniel 7:13-14', 1),
  (14, 'Matthew 24:30', 2),
  (14, 'Acts 1:9-11', 3),
  (15, 'Joel 3:13', 1),
  (15, 'Mark 4:29', 2),
  (15, 'Matthew 13:39', 3),
  (16, 'Matthew 13:30', 1),
  (16, 'Revelation 14:14', 2),
  (17, 'Revelation 14:14', 1),
  (17, 'Revelation 15:5-6', 2),
  (18, 'Revelation 6:9-10', 1),
  (18, 'Revelation 8:3-5', 2),
  (18, 'Genesis 15:16', 3),
  (19, 'Isaiah 63:1-6', 1),
  (19, 'Lamentations 1:15', 2),
  (19, 'Revelation 19:15', 3),
  (20, 'Hebrews 13:12', 1),
  (20, 'Joel 3:13', 2),
  (20, 'Revelation 19:14-15', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 14 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 14 Complete!
-- 20 verses · 8 key verses with word studies (16 words)
-- Cross-references for 20 verses (56 refs)
-- ═══════════════════════════════════════════════════════
