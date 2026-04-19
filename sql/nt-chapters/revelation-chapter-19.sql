-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 19 — Hallelujah! The Marriage of the Lamb and the Rider on the White Horse
-- 21 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 19,
  'Revelation 19 turns from the smoke of fallen Babylon to the triumph of heaven. The chapter opens with the four ''Hallelujahs'' of heaven (the only four occurrences of this word in the New Testament), praising God for His judgments and the imminent reign of Christ. The marriage supper of the Lamb is announced — His bride, the church, is ready, clothed in the righteous acts of the saints. Then heaven opens and Christ rides forth as Faithful and True, Word of God, King of kings and Lord of lords, with the armies of heaven behind Him. The beast and the false prophet are seized and cast into the lake of fire, and their armies are destroyed by the sword from the mouth of the rider — the word of Christ. The chapter is the climactic transition from judgment of the world-system to the visible reign of Christ.',
  'Hallelujah! The Marriage of the Lamb and the Rider on the White Horse',
  'ἀληθινός (alēthinos)',
  '''True'' in the deepest sense — genuine, real, corresponding to ultimate reality. Predicated of Christ as ''Faithful and True'' (v.11) and of God''s judgments (v.2). It distinguishes the real from every counterfeit Babylon offered. The reign begun here is not symbolic but the truth toward which all history was moving.',
  '["Section 1 (vv.1-4): The First Three Hallelujahs over Babylon''s Judgment","Section 2 (vv.5-6): The Fourth Hallelujah — God Reigns","Section 3 (vv.7-10): The Marriage Supper of the Lamb","Section 4 (vv.11-16): The Rider on the White Horse","Section 5 (vv.17-21): The Beast and False Prophet Defeated; Their Armies Slain"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto the Lord our God:',
   'Μετὰ ταῦτα ἤκουσα ὡς φωνὴν μεγάλην ὄχλου πολλοῦ ἐν τῷ οὐρανῷ λεγόντων· Ἁλληλουϊά· ἡ σωτηρία καὶ ἡ δόξα καὶ ἡ δύναμις τοῦ Θεοῦ ἡμῶν,',
   'Meta tauta ēkousa hōs phōnēn megalēn ochlou pollou en tō ouranō legontōn; Hallēlouia; hē sōtēria kai hē doxa kai hē dynamis tou Theou hēmōn,',
   '''Hallelujah'' (Ἁλληλουϊά) transliterates the Hebrew ''Hallelu Yah'' — ''Praise the LORD!'' — which begins many of the Hallel psalms (113-118). It appears in the New Testament only here in chapter 19 (four times). The triple ascription — salvation, glory, power — answers Babylon''s false claim to the same.',
   'True worship erupts when God''s justice is finally seen. Heaven does not lament Babylon''s fall — it rejoices, because what fell was a system that opposed God and oppressed His people. Worship and justice are inseparable.'),
  (2,
   'For true and righteous are his judgments: for he hath judged the great whore, which did corrupt the earth with her fornication, and hath avenged the blood of his servants at her hand.',
   'ὅτι ἀληθιναὶ καὶ δίκαιαι αἱ κρίσεις αὐτοῦ· ὅτι ἔκρινεν τὴν πόρνην τὴν μεγάλην ἥτις ἔφθειρεν τὴν γῆν ἐν τῇ πορνείᾳ αὐτῆς, καὶ ἐξεδίκησεν τὸ αἷμα τῶν δούλων αὐτοῦ ἐκ χειρὸς αὐτῆς.',
   'hoti alēthinai kai dikaiai hai kriseis autou; hoti ekrinen tēn pornēn tēn megalēn hētis ephtheiren tēn gēn en tē porneia autēs, kai exedikēsen to haima tōn doulōn autou ek cheiros autēs.',
   '''True and righteous'' (ἀληθιναὶ καὶ δίκαιαι) — the same pair as 15:3 and 16:7. The cry of the martyrs under the altar ''How long?'' (6:10) is now answered: God ''hath avenged'' (ἐξεδίκησεν).',
   'Divine justice is both real (ἀληθιναὶ) and right (δίκαιαι). It corresponds to actual wrong done and matches the standard of righteousness. The vindication of the persecuted is part of the gospel''s good news.'),
  (3,
   'And again they said, Alleluia. And her smoke rose up for ever and ever.',
   'Καὶ δεύτερον εἴρηκαν· Ἁλληλουϊά· καὶ ὁ καπνὸς αὐτῆς ἀναβαίνει εἰς τοὺς αἰῶνας τῶν αἰώνων.',
   'Kai deuteron eirēkan; Hallēlouia; kai ho kapnos autēs anabainei eis tous aiōnas tōn aiōnōn.',
   'The second Hallelujah is brief and pointed: ''her smoke rises forever and ever.'' The image echoes Edom''s perpetual judgment in Isaiah 34:10. The smoke is a permanent monument to God''s justice.',
   NULL),
  (4,
   'And the four and twenty elders and the four beasts fell down and worshipped God that sat on the throne, saying, Amen; Alleluia.',
   'Καὶ ἔπεσαν οἱ πρεσβύτεροι οἱ εἴκοσι τέσσαρες καὶ τὰ τέσσαρα ζῷα καὶ προσεκύνησαν τῷ Θεῷ τῷ καθημένῳ ἐπὶ τῷ θρόνῳ λέγοντες· Ἀμήν, Ἁλληλουϊά.',
   'Kai epesan hoi presbyteroi hoi eikosi tessares kai ta tessara zōa kai prosekynēsan tō Theō tō kathēmenō epi tō thronō legontes; Amēn, Hallēlouia.',
   'The third Hallelujah comes from heaven''s leadership — the 24 elders (representing the church) and the 4 living creatures (representing creation''s witness). Their double word ''Amen, Hallelujah'' is the affirmation followed by the praise.',
   NULL),
  (5,
   'And a voice came out of the throne, saying, Praise our God, all ye his servants, and ye that fear him, both small and great.',
   'Καὶ φωνὴ ἀπὸ τοῦ θρόνου ἐξῆλθεν λέγουσα· Αἰνεῖτε τῷ Θεῷ ἡμῶν πάντες οἱ δοῦλοι αὐτοῦ, οἱ φοβούμενοι αὐτὸν, οἱ μικροὶ καὶ οἱ μεγάλοι.',
   'Kai phōnē apo tou thronou exēlthen legousa; Aineite tō Theō hēmōn pantes hoi douloi autou, hoi phoboumenoi auton, hoi mikroi kai hoi megaloi.',
   'A voice from the throne summons universal praise. ''Small and great'' echoes the inclusivity of Psalm 115:13. The voice cannot be the Father''s (since it says ''our God''), so it is likely an angelic herald or Christ Himself representing the worshipers.',
   NULL),
  (6,
   'And I heard as it were the voice of a great multitude, and as the voice of many waters, and as the voice of mighty thunderings, saying, Alleluia: for the Lord God omnipotent reigneth.',
   'Καὶ ἤκουσα ὡς φωνὴν ὄχλου πολλοῦ καὶ ὡς φωνὴν ὑδάτων πολλῶν καὶ ὡς φωνὴν βροντῶν ἰσχυρῶν λεγόντων· Ἁλληλουϊά, ὅτι ἐβασίλευσεν Κύριος ὁ Θεὸς ἡμῶν ὁ Παντοκράτωρ.',
   'Kai ēkousa hōs phōnēn ochlou pollou kai hōs phōnēn hydatōn pollōn kai hōs phōnēn brontōn ischyrōn legontōn; Hallēlouia, hoti ebasileusen Kyrios ho Theos hēmōn ho Pantokratōr.',
   'The fourth Hallelujah, with the loudest sound yet — multitude, waters, and thunder. ''Reigneth'' (ἐβασίλευσεν, aorist) marks the inauguration of God''s manifest kingdom: He has begun to reign visibly. Handel''s Messiah famously set this verse.',
   'God''s eternal sovereignty becomes manifest at last. He has always reigned in providence; now He reigns in unveiled rule. The shift from contested kingdom to unveiled kingdom is the great hope of the church.'),
  (7,
   'Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready.',
   'χαίρωμεν καὶ ἀγαλλιῶμεν καὶ δώσωμεν τὴν δόξαν αὐτῷ, ὅτι ἦλθεν ὁ γάμος τοῦ Ἀρνίου, καὶ ἡ γυνὴ αὐτοῦ ἡτοίμασεν ἑαυτήν.',
   'chairōmen kai agalliōmen kai dōsōmen tēn doxan autō, hoti ēlthen ho gamos tou Arniou, kai hē gynē autou hētoimasen heautēn.',
   'The marriage motif draws on the OT picture of God as husband to His people (Hos 2:19-20; Isa 54:5; Eph 5:25-32). The bride has ''made herself ready'' — she has both received and responded to the grace given. The marriage of the Lamb is the consummation of all redemption.',
   'The church is presented as the Lamb''s bride — not to a hireling, not to a stranger, but to the One who loved her and gave Himself for her. Salvation issues in marriage; redemption is for relationship.'),
  (8,
   'And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.',
   'καὶ ἐδόθη αὐτῇ ἵνα περιβάληται βύσσινον λαμπρὸν καθαρόν· τὸ γὰρ βύσσινον τὰ δικαιώματα τῶν ἁγίων ἐστίν.',
   'kai edothē autē hina peribalētai byssinon lampron katharon; to gar byssinon ta dikaiōmata tōn hagiōn estin.',
   'The bride''s attire stands in deliberate contrast to the harlot''s purple-and-scarlet (17:4). The linen is ''granted'' (ἐδόθη) — given to her. Yet it is also identified as ''the righteous acts of the saints'' (τὰ δικαιώματα). Both gift and response: God supplies the material, the saints wear it as their lives of faithfulness.',
   'The bride''s garments are simultaneously imputed and worked out. Christ''s righteousness is the basis; the saints'' righteous deeds are the fitting expression. Sanctification is no afterthought to justification — it is the wedding garment.'),
  (9,
   'And he saith unto me, Write, Blessed are they which are called unto the marriage supper of the Lamb. And he saith unto me, These are the true sayings of God.',
   'Καὶ λέγει μοι· Γράψον· Μακάριοι οἱ εἰς τὸ δεῖπνον τοῦ γάμου τοῦ Ἀρνίου κεκλημένοι. Καὶ λέγει μοι· Οὗτοι οἱ λόγοι ἀληθινοὶ τοῦ Θεοῦ εἰσιν.',
   'Kai legei moi; Grapson; Makarioi hoi eis to deipnon tou gamou tou Arniou keklēmenoi. Kai legei moi; Houtoi hoi logoi alēthinoi tou Theou eisin.',
   'The fourth of seven beatitudes in Revelation. Both invited and invitee — the bride is also a guest. The angel underlines the certainty: ''these are the true sayings of God,'' guaranteeing the promise as no human word could.',
   'The marriage feast is a real, anticipated event for those who belong to Christ. The text invites confidence — these words are not allegory floating in air but God''s own true sayings.'),
  (10,
   'And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Jesus: worship God: for the testimony of Jesus is the spirit of prophecy.',
   'Καὶ ἔπεσα ἔμπροσθεν τῶν ποδῶν αὐτοῦ προσκυνῆσαι αὐτῷ. Καὶ λέγει μοι· Ὅρα μή· σύνδουλός σού εἰμι καὶ τῶν ἀδελφῶν σου τῶν ἐχόντων τὴν μαρτυρίαν Ἰησοῦ· τῷ Θεῷ προσκύνησον· ἡ γὰρ μαρτυρία Ἰησοῦ ἐστὶν τὸ πνεῦμα τῆς προφητείας.',
   'Kai epesa emprosthen tōn podōn autou proskynēsai autō. Kai legei moi; Hora mē; syndoulos sou eimi kai tōn adelphōn sou tōn echontōn tēn martyrian Iēsou; tō Theō proskynēson; hē gar martyria Iēsou estin to pneuma tēs prophēteias.',
   'John''s impulse to worship the angel is rebuked sharply — the same scene recurs in 22:8-9. Angels and saints are ''fellowservants''; worship belongs to God alone. The closing principle is foundational: prophecy''s essence is bearing witness to Jesus.',
   'Worship offered to anyone but God is forbidden, no matter how exalted the recipient appears. Equally, the touchstone of all true prophecy is Jesus Christ — any prophetic word disconnected from Him is suspect.'),
  (11,
   'And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war.',
   'Καὶ εἶδον τὸν οὐρανὸν ἠνεῳγμένον, καὶ ἰδοὺ ἵππος λευκός, καὶ ὁ καθήμενος ἐπ᾽ αὐτὸν καλούμενος Πιστὸς καὶ Ἀληθινός, καὶ ἐν δικαιοσύνῃ κρίνει καὶ πολεμεῖ.',
   'Kai eidon ton ouranon ēneōgmenon, kai idou hippos leukos, kai ho kathēmenos ep'' auton kaloumenos Pistos kai Alēthinos, kai en dikaiosynē krinei kai polemei.',
   'Heaven opens for Christ''s public revelation. The white horse is the symbol of triumphal coming (distinct from the rider in 6:2). ''Faithful and True'' was His self-description in 3:14. He judges and makes war ''in righteousness'' — both functions are inseparable from His character.',
   'Christ''s second coming is in righteousness — His judgment is not arbitrary force but the public outworking of His holy nature. The same Jesus who came in meekness now comes in might.'),
  (12,
   'His eyes were as a flame of fire, and on his head were many crowns; and he had a name written, that no man knew, but he himself.',
   'οἱ δὲ ὀφθαλμοὶ αὐτοῦ φλὸξ πυρός, καὶ ἐπὶ τὴν κεφαλὴν αὐτοῦ διαδήματα πολλά, ἔχων ὄνομα γεγραμμένον ὃ οὐδεὶς οἶδεν εἰ μὴ αὐτός,',
   'hoi de ophthalmoi autou phlox pyros, kai epi tēn kephalēn autou diadēmata polla, echōn onoma gegrammenon ho oudeis oiden ei mē autos,',
   'Eyes of fire (cf. 1:14; 2:18) signify omniscient discernment. ''Many crowns'' (διαδήματα — royal diadems, not victors'' wreaths) declare comprehensive sovereignty: He outranks the dragon (12:3) and the beast (13:1). The unknown name marks the inexhaustible mystery of His person.',
   NULL),
  (13,
   'And he was clothed with a vesture dipped in blood: and his name is called The Word of God.',
   'καὶ περιβεβλημένος ἱμάτιον βεβαμμένον αἵματι, καὶ κέκληται τὸ ὄνομα αὐτοῦ ὁ Λόγος τοῦ Θεοῦ.',
   'kai peribeblēmenos himation bebammenon haimati, kai keklētai to onoma autou ho Logos tou Theou.',
   'The blood-dipped robe alludes to Isaiah 63:1-3 — the warrior coming from Edom with stained garments. The blood is that of His enemies before the battle has even been described, signaling certainty. ''The Word of God'' (ὁ Λόγος τοῦ Θεοῦ) is the title from John 1:1 — the same Christ.',
   'Christ is both Word and Warrior. The Logos who created the world (John 1:3) now judges it. The unity of the New Testament''s Christology — gentle Lamb and conquering King — is the same Person in different acts.'),
  (14,
   'And the armies which were in heaven followed him upon white horses, clothed in fine linen, white and clean.',
   'καὶ τὰ στρατεύματα τὰ ἐν τῷ οὐρανῷ ἠκολούθει αὐτῷ ἐφ᾽ ἵπποις λευκοῖς, ἐνδεδυμένοι βύσσινον λευκὸν καθαρόν.',
   'kai ta strateumata ta en tō ouranō ēkolouthei autō eph'' hippois leukois, endedymenoi byssinon leukon katharon.',
   'The armies are clothed exactly as the bride was in v.8 (''fine linen, white and clean''), suggesting the saints accompany Him. They follow Him; the warfare is His. Their role is presence, not combat.',
   NULL),
  (15,
   'And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of Almighty God.',
   'καὶ ἐκ τοῦ στόματος αὐτοῦ ἐκπορεύεται ῥομφαία ὀξεῖα, ἵνα ἐν αὐτῇ πατάξῃ τὰ ἔθνη, καὶ αὐτὸς ποιμανεῖ αὐτοὺς ἐν ῥάβδῳ σιδηρᾷ· καὶ αὐτὸς πατεῖ τὴν ληνὸν τοῦ οἴνου τοῦ θυμοῦ τῆς ὀργῆς τοῦ Θεοῦ τοῦ Παντοκράτορος.',
   'kai ek tou stomatos autou ekporeuetai rhomphaia oxeia, hina en autē pataxē ta ethnē, kai autos poimanei autous en rhabdō sidēra; kai autos patei tēn lēnon tou oinou tou thymou tēs orgēs tou Theou tou Pantokratoros.',
   'The weapon from His mouth (cf. 1:16; Isa 49:2; Heb 4:12) is His word — He conquers by speaking. The rod of iron echoes Psalm 2:9. The winepress imagery extends 14:19-20. The triple piling (''wine of the wrath of the anger of God'') intensifies for the reader the severity of judgment.',
   'Christ''s word is His weapon. He needs no armies of His own; the sword from His mouth is sufficient. The same word that creates also judges — speech is the medium of His sovereignty.'),
  (16,
   'And he hath on his vesture and on his thigh a name written, KING OF KINGS, AND LORD OF LORDS.',
   'καὶ ἔχει ἐπὶ τὸ ἱμάτιον καὶ ἐπὶ τὸν μηρὸν αὐτοῦ ὄνομα γεγραμμένον· Βασιλεὺς βασιλέων καὶ Κύριος κυρίων.',
   'kai echei epi to himation kai epi ton mēron autou onoma gegrammenon; Basileus basileōn kai Kyrios kyriōn.',
   'The title was first given in 17:14. Inscription on the thigh would be visible to all as the rider passes — the place where a sword would be strapped on a king. ''King of kings and Lord of lords'' is supreme superlative: no contender exists.',
   'Christ holds absolute supremacy over every authority — political, spiritual, cultural. ''King of kings'' rules out every rival claim to ultimate allegiance. Allegiance to Him relativizes all lesser loyalties.'),
  (17,
   'And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great God;',
   'Καὶ εἶδον ἕνα ἄγγελον ἑστῶτα ἐν τῷ ἡλίῳ, καὶ ἔκραξεν ἐν φωνῇ μεγάλῃ λέγων πᾶσιν τοῖς ὀρνέοις τοῖς πετομένοις ἐν μεσουρανήματι· Δεῦτε συνάχθητε εἰς τὸ δεῖπνον τὸ μέγα τοῦ Θεοῦ,',
   'Kai eidon hena angelon hestōta en tō hēliō, kai ekraxen en phōnē megalē legōn pasin tois orneois tois petomenois en mesouranēmati; Deute synachthēte eis to deipnon to mega tou Theou,',
   'A grim parody of the marriage supper — ''the supper of the great God'' is the feast of carrion. The angel''s call echoes Ezekiel 39:17, where God invites birds to feast on the slain hosts of Gog. Two suppers: the marriage feast for the bride, the carrion feast for the rebels.',
   NULL),
  (18,
   'That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men, and the flesh of horses, and of them that sit on them, and the flesh of all men, both free and bond, both small and great.',
   'ἵνα φάγητε σάρκας βασιλέων καὶ σάρκας χιλιάρχων καὶ σάρκας ἰσχυρῶν καὶ σάρκας ἵππων καὶ τῶν καθημένων ἐπ᾽ αὐτῶν καὶ σάρκας πάντων ἐλευθέρων τε καὶ δούλων καὶ μικρῶν τε καὶ μεγάλων.',
   'hina phagēte sarkas basileōn kai sarkas chiliarchōn kai sarkas ischyrōn kai sarkas hippōn kai tōn kathēmenōn ep'' autōn kai sarkas pantōn eleutherōn te kai doulōn kai mikrōn te kai megalōn.',
   'The list deliberately mirrors the social ranks named in 13:16 — ''small and great, free and bond.'' Whoever stood with the beast falls under the same judgment regardless of status. The grimness underscores the totality of the defeat.',
   NULL),
  (19,
   'And I saw the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse, and against his army.',
   'Καὶ εἶδον τὸ θηρίον καὶ τοὺς βασιλεῖς τῆς γῆς καὶ τὰ στρατεύματα αὐτῶν συνηγμένα ποιῆσαι τὸν πόλεμον μετὰ τοῦ καθημένου ἐπὶ τοῦ ἵππου καὶ μετὰ τοῦ στρατεύματος αὐτοῦ.',
   'Kai eidon to thērion kai tous basileis tēs gēs kai ta strateumata autōn synēgmena poiēsai ton polemon meta tou kathēmenou epi tou hippou kai meta tou strateumatos autou.',
   'The forces gathered at Armageddon (16:14, 16) now appear in formation. They have come to ''make war'' against the Lamb (cf. 17:14). The narrative is brief because the outcome is preordained.',
   NULL),
  (20,
   'And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.',
   'καὶ ἐπιάσθη τὸ θηρίον καὶ μετ᾽ αὐτοῦ ὁ ψευδοπροφήτης ὁ ποιήσας τὰ σημεῖα ἐνώπιον αὐτοῦ, ἐν οἷς ἐπλάνησεν τοὺς λαβόντας τὸ χάραγμα τοῦ θηρίου καὶ τοὺς προσκυνοῦντας τῇ εἰκόνι αὐτοῦ· ζῶντες ἐβλήθησαν οἱ δύο εἰς τὴν λίμνην τοῦ πυρὸς τὴν καιομένην ἐν θείῳ.',
   'kai epiasthē to thērion kai met'' autou ho pseudoprophētēs ho poiēsas ta sēmeia enōpion autou, en hois eplanēsen tous labontas to charagma tou thēriou kai tous proskynountas tē eikoni autou; zōntes eblēthēsan hoi duo eis tēn limnēn tou pyros tēn kaiomenēn en theiō.',
   'No battle is described — the beast and false prophet are simply ''taken'' (ἐπιάσθη, seized). They are cast ''alive'' (ζῶντες) into the lake of fire — the first occupants of the place reserved for final punishment (cf. Matt 25:41). They precede even Satan, who is bound in chapter 20.',
   'The lake of fire is the final destination of the beast, false prophet, Satan (20:10), death and Hades (20:14), and all whose names are not in the book of life (20:15). It is the eschatological consummation of God''s judgment, distinct from the temporary intermediate state.'),
  (21,
   'And the remnant were slain with the sword of him that sat upon the horse, which sword proceeded out of his mouth: and all the fowls were filled with their flesh.',
   'καὶ οἱ λοιποὶ ἀπεκτάνθησαν ἐν τῇ ῥομφαίᾳ τοῦ καθημένου ἐπὶ τοῦ ἵππου τῇ ἐξελθούσῃ ἐκ τοῦ στόματος αὐτοῦ, καὶ πάντα τὰ ὄρνεα ἐχορτάσθησαν ἐκ τῶν σαρκῶν αὐτῶν.',
   'kai hoi loipoi apektanthēsan en tē rhomphaia tou kathēmenou epi tou hippou tē exelthousē ek tou stomatos autou, kai panta ta ornea echortasthēsan ek tōn sarkōn autōn.',
   'The armies are slain ''by the sword from his mouth'' — the word of Christ does the work. The carrion supper announced in v.17 is fulfilled. The chapter closes with no human resistance left standing — only the bride remains, awaiting her wedding fully.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 19;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἁλληλουϊά', 'Hallēlouia', 'G239', 'Transliteration of Hebrew ''Hallelu Yah'' — ''Praise the LORD!'' Used to open and close many of the Hallel psalms (113-118). Appears in the NT only here in Revelation 19, four times.', 1),
  ('σωτηρία', 'sōtēria', 'G4991', 'Salvation, deliverance. Here predicated of God Himself — He is the source of saving, both rescue from judgment and the positive blessings that follow.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 1;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γάμος', 'gamos', 'G1062', 'Wedding, marriage. The OT pictures God as Israel''s husband (Hos 2:19); the NT extends this to Christ and the church (Eph 5:32; 2 Cor 11:2). The marriage supper is the consummation, not the beginning, of relationship.', 1),
  ('ἡτοίμασεν', 'hētoimasen', 'G2090', 'Prepared, made ready. Aorist active — completed action. The bride has done the preparing; readiness is not passive. Yet the next verse shows the linen was ''granted'' to her, balancing gift and response.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 7;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δικαιώματα', 'dikaiōmata', 'G1345', 'Righteous acts/deeds. Plural of ''dikaiōma'' — concrete righteous acts performed by the saints. Distinct from imputed righteousness (''dikaiosynē''), this points to the lived-out righteousness flowing from faith.', 1),
  ('βύσσινον', 'byssinon', 'G1039', 'Fine linen, made from the byssus plant. The most precious cloth of antiquity, used for priestly garments and royal attire. Stands in vivid contrast to the harlot''s gaudy purple-and-scarlet (17:4).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 8;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μαρτυρία Ἰησοῦ', 'martyria Iēsou', 'G3141/G2424', 'The witness/testimony of Jesus. Either witness about Jesus (objective genitive) or witness from Jesus (subjective genitive). Either way, Christ is the heart of true prophecy.', 1),
  ('πνεῦμα τῆς προφητείας', 'pneuma tēs prophēteias', 'G4151/G4394', 'The spirit of prophecy. The animating principle of prophecy — what makes prophecy genuinely prophetic. The Spirit always points to Jesus (John 15:26).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 10;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Πιστὸς', 'Pistos', 'G4103', 'Faithful. Predicated of Christ — He keeps every promise. The same title He claimed in 3:14 of Himself.', 1),
  ('Ἀληθινός', 'Alēthinos', 'G228', 'True, real, genuine. Not merely truthful in words but genuine in being. He is the reality every shadow pointed toward.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 11;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁ Λόγος τοῦ Θεοῦ', 'ho Logos tou Theou', 'G3056/G2316', 'The Word of God — direct echo of John 1:1. The same Christ who is creation''s Word now appears as judgment''s Word. Speech is His instrument.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 13;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ῥομφαία', 'rhomphaia', 'G4501', 'A long, broad sword (distinct from the shorter ''machaira''). Used here of the symbolic sword from Christ''s mouth — His word is His weapon.', 1),
  ('ποιμανεῖ', 'poimanei', 'G4165', 'Will shepherd, will rule. Future of ''poimainō.'' The same verb used for shepherding sheep here describes ruling with iron — the shepherd-king motif (Ps 2:9).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 15;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λίμνην τοῦ πυρὸς', 'limnēn tou pyros', 'G3041/G4442', 'Lake of fire — the eschatological place of final punishment, distinct from Hades (the intermediate state). Mentioned in 19:20; 20:10, 14-15; 21:8. The final destination of the unredeemed and the spiritual powers of evil.', 1),
  ('ζῶντες', 'zōntes', 'G2198', 'Living. The beast and false prophet are cast in alive, without intervening death. Their judgment is direct and immediate — no temporary holding.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = 20;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Psalm 104:35', 1),
  (1, 'Revelation 7:10', 2),
  (1, 'Psalm 113:1', 3),
  (2, 'Revelation 15:3', 1),
  (2, 'Deuteronomy 32:43', 2),
  (2, 'Revelation 6:9-10', 3),
  (3, 'Isaiah 34:10', 1),
  (3, 'Revelation 14:11', 2),
  (4, 'Revelation 4:9-11', 1),
  (4, 'Revelation 5:14', 2),
  (5, 'Psalm 115:13', 1),
  (5, 'Psalm 134:1', 2),
  (6, 'Psalm 97:1', 1),
  (6, 'Psalm 99:1', 2),
  (6, 'Revelation 11:15-17', 3),
  (7, 'Hosea 2:19-20', 1),
  (7, 'Ephesians 5:25-32', 2),
  (7, 'Matthew 22:2-14', 3),
  (8, 'Isaiah 61:10', 1),
  (8, 'Revelation 3:5', 2),
  (8, 'Philippians 1:11', 3),
  (9, 'Luke 14:15-24', 1),
  (9, 'Revelation 21:5', 2),
  (9, 'Matthew 22:1-14', 3),
  (10, 'Revelation 22:8-9', 1),
  (10, 'Acts 10:25-26', 2),
  (10, 'John 15:26', 3),
  (11, 'Revelation 3:14', 1),
  (11, 'Psalm 96:13', 2),
  (11, 'Isaiah 11:4', 3),
  (12, 'Revelation 1:14', 1),
  (12, 'Revelation 2:18', 2),
  (12, 'Revelation 12:3', 3),
  (13, 'Isaiah 63:1-3', 1),
  (13, 'John 1:1', 2),
  (13, 'Hebrews 4:12', 3),
  (14, 'Matthew 25:31', 1),
  (14, 'Jude 1:14', 2),
  (14, 'Revelation 17:14', 3),
  (15, 'Psalm 2:9', 1),
  (15, 'Isaiah 11:4', 2),
  (15, 'Revelation 14:19-20', 3),
  (16, 'Revelation 17:14', 1),
  (16, '1 Timothy 6:15', 2),
  (16, 'Daniel 2:47', 3),
  (17, 'Ezekiel 39:17-20', 1),
  (17, 'Jeremiah 12:9', 2),
  (18, 'Revelation 13:16', 1),
  (18, 'Ezekiel 39:18', 2),
  (19, 'Revelation 16:14-16', 1),
  (19, 'Revelation 17:14', 2),
  (19, 'Psalm 2:2', 3),
  (20, 'Daniel 7:11', 1),
  (20, 'Matthew 25:41', 2),
  (20, 'Revelation 20:10', 3),
  (21, 'Revelation 19:15', 1),
  (21, 'Isaiah 11:4', 2),
  (21, 'Revelation 19:17-18', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 19 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 19 Complete!
-- 21 verses · 8 key verses with word studies (16 words)
-- Cross-references for 21 verses (60 refs)
-- ═══════════════════════════════════════════════════════
