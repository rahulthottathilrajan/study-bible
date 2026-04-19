-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 6 — The Lamb Opens the Seals: Judgment, War, Famine, Death, and Cosmic Upheaval
-- 17 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 6,
  'Revelation 6 initiates the dramatic unfolding of God''s judgment through the opening of the first six seals by the Lamb. This chapter vividly portrays a sequence of escalating judgments upon the earth, symbolized by the four horsemen—conquest, war, famine, and death—which represent the pervasive suffering and chaos preceding the end times. Following these, the fifth seal reveals the cries of martyred saints for justice, underscoring the theme of divine vindication for the persecuted church. The sixth seal unleashes cosmic disturbances, signaling the imminent "great day of his wrath," causing universal terror among humanity, from kings to slaves. The chapter emphasizes God''s sovereign control over history and judgment, revealing the consequences of human rebellion and the ultimate triumph of divine justice. It serves as a stark warning and a source of comfort for believers awaiting Christ''s return and the final establishment of His kingdom.',
  'The Lamb Opens the Seals: Judgment, War, Famine, Death, and Cosmic Upheaval',
  'θρόνος (thronos)',
  'θρόνος (thronos) refers to a seat of authority, power, and kingship. In Revelation, it frequently denotes God''s sovereign rule and the divine court from which all judgments and blessings emanate. Its theological significance lies in emphasizing God''s ultimate control and majesty, even amidst chaos and judgment, and the Lamb''s shared authority.',
  '["Section 1 (vv.1-2): The First Seal: The White Horse of Conquest","Section 2 (vv.3-4): The Second Seal: The Red Horse of War","Section 3 (vv.5-6): The Third Seal: The Black Horse of Famine","Section 4 (vv.7-8): The Fourth Seal: The Pale Horse of Death","Section 5 (vv.9-11): The Fifth Seal: The Cry of the Martyrs","Section 6 (vv.12-14): The Sixth Seal: Cosmic Disturbances","Section 7 (vv.15-17): Universal Terror and the Wrath of God"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I saw when the Lamb opened one of the seals, and I heard, as it were the noise of thunder, one of the four beasts saying, Come and see.',
   'Καὶ εἶδον ὅτε ἤνοιξεν τὸ ἀρνίον μίαν ἐκ τῶν ἑπτὰ σφραγίδων, καὶ ἤκουσα ἑνὸς ἐκ τῶν τεσσάρων ζῴων λέγοντος ὡς φωνὴ βροντῆς, Ἔρχου.',
   'Kai eidon hote ēnoixen to arnion mian ek tōn hepta sphragidōn, kai ēkousa henos ek tōn tessarōn zōōn legontos hōs phōnē brontēs, Erchou.',
   'John witnesses the Lamb (Christ) opening the first of seven seals, initiating a series of divine judgments. The command "Come" (Ἔρχου) is issued by one of the four living creatures, celestial beings surrounding God''s throne (Rev 4:6-8). The thunderous voice emphasizes the solemnity and power of this moment. This opening of the seals signifies the unfolding of God''s predetermined plan for humanity and creation, revealing events that must take place before Christ''s final return.',
   NULL),
  (2,
   'And I saw, and behold a white horse: and he that sat on him had a bow; and a crown was given unto him: and he went forth conquering, and to conquer.',
   'Καὶ εἶδον, καὶ ἰδοὺ ἵππος λευκός, καὶ ὁ καθήμενος ἐπ'' αὐτὸν ἔχων τόξον· καὶ ἐδόθη αὐτῷ στέφανος, καὶ ἐξῆλθεν νικῶν καὶ ἵνα νικήσῃ.',
   'Kai eidon, kai idou hippos leukos, kai ho kathēmenos ep'' auton echōn toxon; kai edothē autō stephanos, kai exēlthen nikōn kai hina nikēsē.',
   'The first horseman appears on a white horse, symbolizing conquest. He carries a bow (τόξον) and is given a crown (στέφανος), indicating authority and victory. The phrase "conquering, and to conquer" (νικῶν καὶ ἵνα νικήσῃ) suggests an ongoing, relentless campaign. Interpretations vary: some see this as Christ''s victorious spread of the Gospel, while others view it as a deceptive, anti-Christian power or a general spirit of conquest and imperialism in human history. The latter aligns better with the subsequent judgments.',
   'This figure''s identity is debated. While a white horse can symbolize Christ (Rev 19:11), the context of subsequent judgments (war, famine, death) suggests this rider represents a force of human conquest and deception, a precursor to the ultimate anti-Christ, rather than Christ Himself, who is the one opening the seals.'),
  (3,
   'And when he had opened the second seal, I heard the second beast say, Come and see.',
   'Καὶ ὅτε ἤνοιξεν τὴν σφραγῖδα τὴν δευτέραν, ἤκουσα τοῦ δευτέρου ζῴου λέγοντος, Ἔρχου.',
   'Kai hote ēnoixen tēn sphragida tēn deuteran, ēkousa tou deuterou zōou legontos, Erchou.',
   'The Lamb opens the second seal, and the second living creature calls out, "Come." This brief interlude emphasizes the sequential nature of the judgments and the divine orchestration behind each event. The repetition of "Come" reinforces the urgency and the unfolding of God''s plan, drawing John''s attention to the next vision.',
   NULL),
  (4,
   'And there went out another horse that was red: and power was given to him that sat thereon to take peace from the earth, and that they should kill one another: and there was given unto him a great sword.',
   'Καὶ ἐξῆλθεν ἄλλος ἵππος πυρρός, καὶ τῷ καθημένῳ ἐπ'' αὐτὸν ἐδόθη αὐτῷ λαβεῖν τὴν εἰρήνην ἀπὸ τῆς γῆς καὶ ἵνα ἀλλήλους σφάξουσιν, καὶ ἐδόθη αὐτῷ μάχαιρα μεγάλη.',
   'Kai exēlthen allos hippos pyrros, kai tō kathēmenō ep'' auton edothē autō labein tēn eirēnēn apo tēs gēs kai hina allēlous sphaxousin, kai edothē autō machaira megalē.',
   'The second horseman rides a red (πυρρός) horse, symbolizing bloodshed and war. Power is given to him "to take peace from the earth" (λαβεῖν τὴν εἰρήνην ἀπὸ τῆς γῆς), leading to widespread violence and mutual slaughter. The "great sword" (μάχαιρα μεγάλη) signifies destructive warfare. This vision depicts the devastating consequences of human conflict, a recurring theme throughout history, intensifying as the end approaches.',
   'This seal reveals God''s allowance of widespread conflict as a judgment. While human sin is the immediate cause of war, the divine "giving of power" indicates that even such destructive forces operate within God''s sovereign plan, serving to bring about His ultimate purposes and call humanity to repentance.'),
  (5,
   'And when he had opened the third seal, I heard the third beast say, Come and see. And I beheld, and lo a black horse; and he that sat on him had a pair of balances in his hand.',
   'Καὶ ὅτε ἤνοιξεν τὴν σφραγῖδα τὴν τρίτην, ἤκουσα τοῦ τρίτου ζῴου λέγοντος, Ἔρχου. Καὶ εἶδον, καὶ ἰδοὺ ἵππος μέλας, καὶ ὁ καθήμενος ἐπ'' αὐτὸν ἔχων ζυγὸν ἐν τῇ χειρὶ αὐτοῦ.',
   'Kai hote ēnoixen tēn sphragida tēn triten, ēkousa tou tritou zōou legontos, Erchou. Kai eidon, kai idou hippos melas, kai ho kathēmenos ep'' auton echōn zygon en tē cheiri autou.',
   'The third seal opens, and the third living creature calls "Come." A black horse (μέλας) appears, ridden by a figure holding a "pair of balances" or a yoke (ζυγόν). The black color and the balances are traditional symbols of famine and economic hardship. The balances would be used to meticulously weigh out scarce food, indicating severe rationing and inflated prices, a common consequence of war and societal breakdown.',
   NULL),
  (6,
   'And I heard a voice in the midst of the four beasts say, A measure of wheat for a penny, and three measures of barley for a penny; and see thou hurt not the oil and the wine.',
   'Καὶ ἤκουσα φωνὴν ἐν μέσῳ τῶν τεσσάρων ζῴων λέγουσαν, Χοῖνιξ σίτου δηναρίου, καὶ τρεῖς χοίνικες κριθῶν δηναρίου· καὶ τὸ ἔλαιον καὶ τὸν οἶνον μὴ ἀδικήσῃς.',
   'Kai ēkousa phōnēn en mesō tōn tessarōn zōōn legousan, Choīniks sitou dēnariou, kai treis choīnikes krithōn dēnariou; kai to elaion kai ton oinon mē adikēsēis.',
   'A voice from the midst of the four living creatures announces exorbitant food prices: "A measure (χοῖνιξ) of wheat for a penny (δηναρίου), and three measures of barley for a penny." A choinix was a day''s ration, and a denarius a day''s wage, signifying that a full day''s labor would barely buy enough food for one person, indicating severe famine. The command "hurt not the oil and the wine" (τὸ ἔλαιον καὶ τὸν οἶνον μὴ ἀδικήσῃς) suggests that while staple foods become scarce, luxuries remain available, perhaps indicating a partial famine or a disparity where the wealthy are less affected.',
   'This verse illustrates the economic devastation that accompanies divine judgment. The scarcity of basic necessities highlights the fragility of human life and the profound impact of God''s judgments on daily existence. The preservation of oil and wine might symbolize a temporary reprieve or a distinction in judgment, or perhaps the continued availability of religious symbols (oil for anointing, wine for communion) even amidst hardship.'),
  (7,
   'And when he had opened the fourth seal, I heard the voice of the fourth beast say, Come and see.',
   'Καὶ ὅτε ἤνοιξεν τὴν σφραγῖδα τὴν τετάρτην, ἤκουσα φωνὴν τοῦ τετάρτου ζῴου λέγοντος, Ἔρχου.',
   'Kai hote ēnoixen tēn sphragida tēn tetartēn, ēkousa phōnēn tou tetartou zōou legontos, Erchou.',
   'The Lamb opens the fourth seal, and the fourth living creature issues the familiar command, "Come." This repetitive call underscores the relentless progression of the judgments and the divine authority behind each one. John is being directed to witness the next stage of God''s unfolding plan of judgment upon the earth.',
   NULL),
  (8,
   'And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.',
   'Καὶ εἶδον, καὶ ἰδοὺ ἵππος χλωρός, καὶ ὁ καθήμενος ἐπάνω αὐτοῦ ὄνομα αὐτῷ ὁ Θάνατος, καὶ ὁ ᾅδης ἠκολούθει μετ'' αὐτοῦ. Καὶ ἐδόθη αὐτοῖς ἐξουσία ἐπὶ τὸ τέταρτον τῆς γῆς, ἀποκτεῖναι ἐν ῥομφαίᾳ καὶ ἐν λιμῷ καὶ ἐν θανάτῳ καὶ ὑπὸ τῶν θηρίων τῆς γῆς.',
   'Kai eidon, kai idou hippos chlōros, kai ho kathēmenos epanō autou onoma autō ho Thanatos, kai ho Hadēs ēkolouthei met'' autou. Kai edothē autois exousia epi to tetarton tēs gēs, apokteinai en rhomphaia kai en limō kai en thanatō kai hypo tōn thēriōn tēs gēs.',
   'The fourth horseman rides a pale (χλωρός, literally "greenish-yellow," like a corpse) horse. His name is Death (Θάνατος), and Hades (ᾅδης), the realm of the dead, follows close behind, collecting the victims. They are given authority over a "fourth part of the earth" (τὸ τέταρτον τῆς γῆς) to kill by sword, hunger, pestilence (θανάτῳ, often translated as ''death'' but can imply plague), and wild beasts. This seal culminates the previous three, bringing widespread destruction and mortality.',
   'This seal represents the ultimate consequence of sin and judgment: physical death and spiritual separation. The pairing of Death and Hades emphasizes the finality of these judgments for the unrepentant. The specific methods of death (sword, hunger, plague, beasts) echo Old Testament curses (Ezek 14:21), demonstrating God''s consistent methods of judgment throughout history.'),
  (9,
   'And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of God, and for the testimony which they held:',
   'Καὶ ὅτε ἤνοιξεν τὴν πέμπτην σφραγῖδα, εἶδον ὑποκάτω τοῦ θυσιαστηρίου τὰς ψυχὰς τῶν ἐσφαγμένων διὰ τὸν λόγον τοῦ Θεοῦ καὶ διὰ τὴν μαρτυρίαν ἣν εἶχον.',
   'Kai hote ēnoixen tēn pemptēn sphragida, eidon hypokatō tou thysiastēriou tas psychas tōn esphagmenōn dia ton logon tou Theou kai dia tēn martyrian hēn eichon.',
   'With the opening of the fifth seal, the scene shifts from earthly judgments to a heavenly vision. John sees "under the altar" (ὑποκάτω τοῦ θυσιαστηρίου) the souls (ψυχὰς) of those who had been "slain for the word of God, and for the testimony which they held." This altar is likely the altar of sacrifice, symbolizing their martyrdom as an offering to God. This vision provides comfort and assurance for persecuted believers throughout history.',
   'This verse affirms the reality of the soul''s existence beyond physical death and the preciousness of martyrdom in God''s eyes. It highlights the suffering of believers for their faith and God''s remembrance of their sacrifice. Their position "under the altar" suggests a sacred offering and a place of waiting for divine vindication.'),
  (10,
   'And they cried with a loud voice, saying, How long, O Lord, holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?',
   'Καὶ ἔκραξαν φωνῇ μεγάλῃ λέγοντες, Ἕως πότε, ὁ Δεσπότης ὁ ἅγιος καὶ ἀληθινός, οὐ κρίνεις καὶ ἐκδικεῖς τὸ αἷμα ἡμῶν ἀπὸ τῶν κατοικούντων ἐπὶ τῆς γῆς;',
   'Kai ekraxan phōnē megalē legontes, Heōs pote, ho Despotēs ho hagios kai alēthinos, ou krineis kai ekdikeis to haima hēmōn apo tōn katoikountōn epi tēs gēs?',
   'The martyred souls cry out with a loud voice, addressing God as "O Lord, holy and true" (ὁ Δεσπότης ὁ ἅγιος καὶ ἀληθινός). Their plea is a poignant question: "How long... dost thou not judge and avenge our blood on them that dwell on the earth?" This is not a cry for personal revenge but a righteous appeal for divine justice and vindication, reflecting the longing for God''s kingdom to fully come and for evil to be judged.',
   'This cry for justice demonstrates that God hears the prayers of His persecuted saints. It underscores the biblical principle that God will ultimately avenge the blood of His servants (Deut 32:43; Rom 12:19). The question "How long?" expresses the tension between God''s promise of justice and the present reality of suffering, a theme common in prophetic literature.'),
  (11,
   'And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.',
   'Καὶ ἐδόθη αὐτοῖς ἑκάστῳ στολὴ λευκή, καὶ ἐρρέθη αὐτοῖς ἵνα ἀναπαύσωνται ἔτι χρόνον μικρόν, ἕως οὗ πληρωθῶσιν καὶ οἱ σύνδουλοι αὐτῶν καὶ οἱ ἀδελφοὶ αὐτῶν οἱ μέλλοντες ἀποκτείνεσθαι ὡς καὶ αὐτοί.',
   'Kai edothē autois hekastō stolē leukē, kai errēthē autois hina anapausōntai eti chronon mikron, heōs hou plērōthōsin kai hoi syndouloi autōn kai hoi adelphoi autōn hoi mellontes apokteinesthai hōs kai autoi.',
   'In response to their plea, white robes (στολὴ λευκή) are given to each martyr, symbolizing purity, righteousness, and victory. They are told to "rest yet for a little season" (ἀναπαύσωνται ἔτι χρόνον μικρόν) until the full number of their "fellowservants" and "brethren" who are destined for martyrdom is complete. This reveals God''s sovereign timing for judgment and the extent of future persecution.',
   'The white robes signify divine vindication and the righteousness imputed to believers through Christ. The command to "rest" offers comfort and assurance that their suffering is not in vain and that God''s justice will come in His perfect timing. It also reveals a predetermined number of martyrs, emphasizing God''s meticulous plan for His church and the world.'),
  (12,
   'And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood;',
   'Καὶ εἶδον ὅτε ἤνοιξεν τὴν σφραγῖδα τὴν ἕκτην, καὶ σεισμὸς μέγας ἐγένετο, καὶ ὁ ἥλιος ἐγένετο μέλας ὡς σάκκος τρίχινος, καὶ ἡ σελήνη ὅλη ἐγένετο ὡς αἷμα.',
   'Kai eidon hote ēnoixen tēn sphragida tēn hektēn, kai seismos megas egeneto, kai ho hēlios egeneto melas hōs sakkos trichinos, kai hē selēnē holē egeneto hōs haima.',
   'The sixth seal unleashes cataclysmic cosmic disturbances. A "great earthquake" (σεισμὸς μέγας) occurs, the sun turns "black as sackcloth of hair," and the moon becomes "as blood." These are classic prophetic images of divine judgment and the "Day of the Lord" found throughout the Old Testament (e.g., Joel 2:30-31; Isa 13:10). They signify the collapse of the natural order and the terrifying manifestation of God''s wrath.',
   'This seal marks a dramatic shift, moving from specific earthly judgments to universal cosmic upheaval, signaling the imminent "Day of the Lord." These signs are not merely natural disasters but supernatural manifestations of God''s power and wrath, designed to strike terror into the hearts of the ungodly and announce the end of the age.'),
  (13,
   'And the stars of heaven fell unto the earth, even as a fig tree casteth her untimely figs, when she is shaken of a mighty wind.',
   'Καὶ οἱ ἀστέρες τοῦ οὐρανοῦ ἔπεσαν εἰς τὴν γῆν, ὡς συκῆ βάλλει τοὺς ὀλύνθους αὐτῆς, ὑπὸ ἀνέμου μεγάλου σειομένη.',
   'Kai hoi asteres tou ouranou epesan eis tēn gēn, hōs sykē ballei tous olynthous autēs, hypo anemou megalou seiomenē.',
   'Following the darkening of the sun and moon, "the stars of heaven fell unto the earth." This is described with the vivid simile of a fig tree casting its "untimely figs" (ὀλύνθους) when violently shaken by a great wind. This imagery emphasizes the sudden, widespread, and uncontrollable nature of these celestial events, further disrupting the cosmic order and intensifying the terror.',
   NULL),
  (14,
   'And the heaven departed as a scroll when it is rolled together; and every mountain and island were moved out of their places.',
   'Καὶ ὁ οὐρανὸς ἀπεχωρίσθη ὡς βιβλίον ἑλισσόμενον, καὶ πᾶν ὄρος καὶ νῆσος ἐκ τῶν τόπων αὐτῶν ἐκινήθησαν.',
   'Kai ho ouranos apechōristhē hōs biblion helissomenon, kai pan oros kai nēsos ek tōn topōn autōn ekinēthēsan.',
   'The heavens "departed as a scroll when it is rolled together" (ὡς βιβλίον ἑλισσόμενον), a powerful image of the dissolution of the established cosmic order. Furthermore, "every mountain and island were moved out of their places," signifying a complete upheaval of the earth''s geography. These events depict a world utterly destabilized and transformed by divine judgment, leaving no place of refuge.',
   'This verse portrays the radical and irreversible transformation of creation under God''s judgment. The imagery of the heavens rolling up and mountains moving signifies the end of the present world order, preparing for the new heavens and new earth. It underscores God''s absolute power over creation and His intention to bring about a complete renewal.'),
  (15,
   'And the kings of the earth, and the great men, and the rich men, and the chief captains, and the mighty men, and every bondman, and every free man, hid themselves in the dens and in the rocks of the mountains;',
   'Καὶ οἱ βασιλεῖς τῆς γῆς καὶ οἱ μεγιστάνες καὶ οἱ χιλίαρχοι καὶ οἱ πλούσιοι καὶ οἱ ἰσχυροὶ καὶ πᾶς δοῦλος καὶ πᾶς ἐλεύθερος ἔκρυψαν ἑαυτοὺς εἰς τὰ σπήλαια καὶ εἰς τὰς πέτρας τῶν ὀρέων.',
   'Kai hoi basileis tēs gēs kai hoi megistanes kai hoi chiliarchoi kai hoi plousioi kai hoi ischyroi kai pas doulos kai pas eleutheros ekrypsan heautous eis ta spēlaia kai eis tas petras tōn oreōn.',
   'In response to these terrifying cosmic events, all humanity, regardless of social status—from "kings of the earth" to "bondman, and every free man"—seeks refuge. They hide "in the dens and in the rocks of the mountains," attempting to escape the visible manifestation of divine wrath. This universal fear highlights the inescapable nature of God''s judgment.',
   'This comprehensive list of social strata emphasizes the universality of God''s judgment. No one, regardless of power, wealth, or freedom, can escape His wrath. It reveals the futility of human attempts to hide from God and the terrifying reality of facing divine justice without repentance.'),
  (16,
   'And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb:',
   'Καὶ λέγουσιν τοῖς ὄρεσιν καὶ ταῖς πέτραις, Πέσατε ἐφ'' ἡμᾶς καὶ κρύψατε ἡμᾶς ἀπὸ προσώπου τοῦ καθημένου ἐπὶ τοῦ θρόνου καὶ ἀπὸ τῆς ὀργῆς τοῦ ἀρνίου.',
   'Kai legousin tois oresin kai tais petrais, Pesate eph'' hēmas kai krypsate hēmas apo prosōpou tou kathēmenou epi tou thronou kai apo tēs orgēs tou arniou.',
   'The terrified people cry out to the mountains and rocks, pleading, "Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb." This desperate plea reveals their recognition of the source of their terror: God on His throne and the Lamb. It''s a profound acknowledgment of divine judgment, yet without repentance, only a desire to escape its immediate consequences.',
   'This verse powerfully illustrates the terror of facing God''s unveiled presence and the wrath of the Lamb. It underscores the dual nature of Christ as both sacrificial Lamb and righteous Judge. The desire to be crushed by mountains rather than face God''s wrath highlights the ultimate horror of divine judgment for the ungodly.'),
  (17,
   'For the great day of his wrath is come; and who shall be able to stand?',
   'Ὅτι ἦλθεν ἡ ἡμέρα ἡ μεγάλη τῆς ὀργῆς αὐτῶν, καὶ τίς δύναται σταθῆναι;',
   'Hoti ēlthen hē hēmera hē megalē tēs orgēs autōn, kai tis dynatai stathēnai?',
   'The chapter concludes with the terrifying realization: "For the great day of his wrath is come; and who shall be able to stand?" This rhetorical question emphasizes the overwhelming and inescapable nature of God''s judgment. It sets the stage for the next chapter, which will introduce those who *can* stand—the sealed servants of God. The "great day of wrath" is a significant eschatological theme, signifying the culmination of divine judgment.',
   'This verse proclaims the arrival of the "Day of the Lord," a pivotal eschatological event. It emphasizes the absolute inability of humanity to withstand God''s righteous wrath through their own strength or merit. This question implicitly points to the need for divine grace and protection, setting up the themes of salvation and sealing in the subsequent chapter.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 6;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἵππος', 'hippos', 'G2462', 'Refers to a horse, a common animal used for riding, warfare, and transport. In Revelation, horses are symbolic, often representing forces or judgments, with their color indicating their nature (e.g., white for conquest, red for war).', 1),
  ('τόξον', 'toxon', 'G5115', 'A bow, an instrument for shooting arrows. In ancient warfare, it symbolized military power and conquest. Here, it suggests the rider''s capacity for distant or swift victory, often associated with Parthian archers, known for their conquering prowess.', 2),
  ('στέφανος', 'stephanos', 'G4735', 'A crown or wreath, typically given as a prize for victory in games or as a symbol of royalty or authority. Here, it signifies the rider''s conferred authority and successful conquest, distinguishing him as a victor.', 3),
  ('νικῶν', 'nikōn', 'G3528', 'Present active participle of νικάω (nikaō), meaning "to conquer, overcome, prevail." It describes an ongoing state of victory and implies a continuous, successful campaign of conquest, reinforcing the rider''s nature.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 2;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πυρρός', 'pyrros', 'G4449', 'Fiery red, blood-red. This color is strongly associated with fire, bloodshed, and war. In this context, it vividly symbolizes the destructive nature of the second horseman, whose mission is to remove peace and incite violence.', 1),
  ('μάχαιρα', 'machaira', 'G3162', 'A short sword or dagger, often used for close combat or sacrifice. Here, it is described as "great" (μεγάλη), indicating its significant destructive power and the widespread slaughter it represents.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 4;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χοῖνιξ', 'choinix', 'G5518', 'A choinix, a dry measure, roughly equivalent to a quart or about two pounds. It was considered a meager daily ration of grain for a working man. Its mention here highlights severe scarcity and famine conditions.', 1),
  ('δηναρίου', 'dēnariou', 'G1220', 'A denarius, a Roman silver coin, which was typically a day''s wage for a common laborer. The cost of a choinix of wheat for a denarius signifies extreme inflation and economic hardship, where a day''s work barely buys enough food for one.', 2),
  ('ἀδικήσῃς', 'adikēsēis', 'G91', 'Second person singular aorist active subjunctive of ἀδικέω (adikeō), meaning "to do wrong, injure, harm." The command "do not harm" (μὴ ἀδικήσῃς) implies a divine restraint on the famine''s impact on luxury goods like oil and wine, suggesting a partial or selective judgment.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 6;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χλωρός', 'chlōros', 'G5515', 'Pale green, yellowish-green, or livid. This color is associated with decay, sickness, and death, evoking the pallor of a corpse. It powerfully symbolizes the nature of the fourth horseman, Death.', 1),
  ('Θάνατος', 'Thanatos', 'G2288', 'Death, the cessation of life. Personified here as a rider, it represents the ultimate physical consequence of sin and judgment, bringing an end to earthly existence.', 2),
  ('ᾅδης', 'Hadēs', 'G86', 'Hades, the realm of the dead, the underworld. It is personified as following Death, indicating that it collects the souls of those killed, emphasizing the finality and destination of the victims of this judgment.', 3),
  ('ἐξουσία', 'exousia', 'G1849', 'Authority, power, right. It denotes delegated power or permission. Here, it emphasizes that Death and Hades operate not arbitrarily but under divine authorization, executing God''s judgment.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 8;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θυσιαστηρίου', 'thysiastēriou', 'G2379', 'A sacrificial altar. In this context, "under the altar" symbolizes the martyrs'' lives offered as a sacrifice to God, echoing Old Testament sacrificial practices and highlighting the sacredness of their martyrdom.', 1),
  ('ψυχὰς', 'psychas', 'G5590', 'Souls, lives, inner beings. Refers to the immaterial part of a human being, capable of conscious existence after physical death. This confirms the continued awareness and identity of the martyrs in the intermediate state.', 2),
  ('ἐσφαγμένων', 'esphagmenōn', 'G4969', 'Perfect passive participle of σφάζω (sphazō), meaning "to slaughter, slay, sacrifice." It describes those who have been violently killed, specifically in the context of martyrdom for their faith, emphasizing their sacrificial death.', 3),
  ('μαρτυρίαν', 'martyrian', 'G3141', 'Testimony, witness, evidence. Refers to the act of bearing witness to Christ and His truth, often leading to persecution and martyrdom. It underscores the reason for their suffering: their unwavering confession of faith.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 9;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Δεσπότης', 'Despotēs', 'G1203', 'Master, Lord, sovereign ruler. This term emphasizes God''s absolute authority and ownership, particularly in the context of a master-slave relationship. The martyrs appeal to Him as the supreme sovereign who has the right and power to judge.', 1),
  ('κρίνεις', 'krineis', 'G2919', 'Second person singular present active indicative of κρίνω (krinō), meaning "to judge, decide, condemn." The martyrs'' question asks why God, as the righteous judge, has not yet executed judgment upon their persecutors.', 2),
  ('ἐκδικεῖς', 'ekdikeis', 'G1556', 'Second person singular present active indicative of ἐκδικέω (ekdikeō), meaning "to avenge, vindicate, punish." This term highlights the martyrs'' plea for divine retribution and vindication for their shed blood, a righteous demand for justice.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 10;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στολὴ', 'stolē', 'G4749', 'A long robe or garment, often ceremonial or signifying status. The "white robe" (στολὴ λευκή) symbolizes purity, righteousness, victory, and honor, indicating their vindication and acceptance before God.', 1),
  ('λευκή', 'leukē', 'G3022', 'White, bright. In Revelation, white frequently symbolizes purity, holiness, righteousness, and triumph. Its association with the robes given to the martyrs signifies their cleansed status and victory through Christ.', 2),
  ('ἀναπαύσωνται', 'anapausōntai', 'G373', 'Third person plural aorist passive subjunctive of ἀναπαύω (anapauō), meaning "to rest, refresh oneself, cease from labor." The command to "rest" offers comfort and a temporary cessation from their eager anticipation of judgment, awaiting God''s perfect timing.', 3),
  ('πληρωθῶσιν', 'plērōthōsin', 'G4137', 'Third person plural aorist passive subjunctive of πληρόω (plēroō), meaning "to fill, complete, fulfill." It indicates that the full number of destined martyrs must be completed before the final judgments and vindication can occur, revealing God''s precise plan.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = 11;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Rev 5:5-7', 1),
  (1, 'Zech 6:1-8', 2),
  (1, 'Matt 24:6-8', 3),
  (2, 'Zech 1:8', 1),
  (2, 'Rev 19:11-16', 2),
  (2, 'Dan 7:23-25', 3),
  (3, 'Rev 6:1', 1),
  (3, 'Rev 4:7', 2),
  (3, 'Matt 24:7', 3),
  (4, 'Zech 6:2', 1),
  (4, 'Matt 24:7', 2),
  (4, 'Jer 25:29-31', 3),
  (5, 'Zech 6:2', 1),
  (5, 'Lam 5:10', 2),
  (5, 'Ezek 4:16-17', 3),
  (6, 'Ezek 4:16-17', 1),
  (6, 'Lev 26:26', 2),
  (6, 'Matt 20:2', 3),
  (7, 'Rev 6:1', 1),
  (7, 'Rev 4:7', 2),
  (7, 'Matt 24:7-8', 3),
  (8, 'Ezek 14:21', 1),
  (8, 'Zech 6:3', 2),
  (8, 'Jer 15:2-3', 3),
  (8, 'Rev 1:18', 4),
  (9, 'Rev 20:4', 1),
  (9, 'Phil 1:23', 2),
  (9, 'Heb 11:35-38', 3),
  (9, 'Matt 10:28', 4),
  (10, 'Ps 79:10', 1),
  (10, 'Deut 32:43', 2),
  (10, 'Rom 12:19', 3),
  (10, 'Luke 18:7-8', 4),
  (11, 'Rev 3:5', 1),
  (11, 'Rev 7:9-14', 2),
  (11, 'Heb 11:40', 3),
  (11, 'Matt 24:9', 4),
  (12, 'Joel 2:30-31', 1),
  (12, 'Isa 13:10', 2),
  (12, 'Matt 24:29', 3),
  (12, 'Acts 2:20', 4),
  (13, 'Isa 34:4', 1),
  (13, 'Matt 24:29', 2),
  (13, 'Mark 13:25', 3),
  (13, 'Rev 8:10', 4),
  (14, 'Isa 34:4', 1),
  (14, 'Heb 1:11-12', 2),
  (14, 'Ps 46:2-3', 3),
  (14, 'Rev 16:20', 4),
  (15, 'Isa 2:19-21', 1),
  (15, 'Luke 23:30', 2),
  (15, 'Hosea 10:8', 3),
  (15, 'Ps 14:5', 4),
  (16, 'Isa 2:19', 1),
  (16, 'Luke 23:30', 2),
  (16, 'Hosea 10:8', 3),
  (16, 'Ps 90:11', 4),
  (17, 'Joel 2:11', 1),
  (17, 'Zeph 1:14-18', 2),
  (17, 'Mal 3:2', 3),
  (17, 'Rev 7:9-10', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 6 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 6 Complete!
-- 17 verses · 7 key verses with word studies (24 words)
-- Cross-references for 17 verses (61 refs)
-- ═══════════════════════════════════════════════════════