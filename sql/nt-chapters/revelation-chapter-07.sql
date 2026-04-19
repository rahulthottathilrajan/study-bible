-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 7 — God's Preservation of His Sealed Servants and the Redeemed Multitude's Worship
-- 17 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  'Revelation 7 presents a pivotal interlude between the opening of the sixth and seventh seals, revealing God''s protective care for His people amidst impending judgment. The chapter unfolds in two distinct but related visions: first, the sealing of 144,000 from the tribes of Israel, signifying God''s preservation of a remnant for His service. This act of sealing serves as a divine mark of ownership and protection against the coming cataclysms. Second, John beholds an innumerable multitude from every nation, tribe, people, and language, standing before the throne and the Lamb, clothed in white robes and worshipping God. This vision clarifies that God''s salvation extends beyond ethnic Israel to a global community of believers who have endured great tribulation and have been cleansed by the blood of the Lamb, assuring their eternal blessedness in God''s presence. The chapter thus emphasizes both God''s particular election and His universal redemption, culminating in heavenly worship.',
  'God''s Preservation of His Sealed Servants and the Redeemed Multitude''s Worship',
  'σφραγίζω (sphragizō)',
  'From ''sphragis'' (a seal), this verb means ''to seal,'' ''to set a mark upon,'' or ''to secure.'' Theologically, it signifies divine ownership, protection, and authentication. In Revelation 7, it denotes God''s act of marking His servants for preservation from impending judgment, indicating their security and belonging to Him, much like a king''s seal on a document or property.',
  '["Section 1 (vv.1-3): The Four Angels and the Command to Delay Judgment","Section 2 (vv.4-8): The Sealing of the 144,000 from Israel","Section 3 (vv.9-10): The Vision of the Great Multitude Worshipping God","Section 4 (vv.11-12): Heavenly Beings Join in Adoration","Section 5 (vv.13-14): Identification of the White-Robed Multitude","Section 6 (vv.15-17): The Blessed State of the Redeemed Multitude"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.',
   'Καὶ μετὰ τοῦτο εἶδον τέσσαρας ἀγγέλους ἑστῶτας ἐπὶ τὰς τέσσαρας γωνίας τῆς γῆς, κρατοῦντας τοὺς τέσσαρας ἀνέμους τῆς γῆς, ἵνα μὴ πνέῃ ἄνεμος ἐπὶ τῆς γῆς μήτε ἐπὶ τῆς θαλάσσης μήτε ἐπὶ πᾶν δένδρον.',
   'Kai meta touto eidon tessaras angelous hestōtas epi tas tessaras gōnias tēs gēs, kratountas tous tessaras anemous tēs gēs, hina mē pneē anemos epi tēs gēs mēte epi tēs thalassēs mēte epi pan dendron.',
   'This verse introduces a pause in the seal judgments, emphasizing divine control over natural forces. The ''four corners of the earth'' and ''four winds'' are symbolic of the totality of the earth and the universal scope of God''s judgment and protection. The imagery echoes Old Testament passages where winds represent divine judgment or agents (Jer 49:36; Dan 7:2; Zech 6:5). The angels are depicted as holding back these destructive forces, indicating that God''s wrath is not arbitrary but precisely timed and controlled, awaiting a specific divine action.',
   NULL),
  (2,
   'And I saw another angel ascending from the east, having the seal of the living God: and he cried with a loud voice to the four angels, to whom it was given to hurt the earth and the sea,',
   'Καὶ εἶδον ἄλλον ἄγγελον ἀναβαίνοντα ἀπὸ ἀνατολῆς ἡλίου, ἔχοντα σφραγῖδα Θεοῦ ζῶντος· καὶ ἔκραξεν ἐν φωνῇ μεγάλῃ τοῖς τέσσαρσιν ἀγγέλοις οἷς ἐδόθη αὐτοῖς ἀδικῆσαι τὴν γῆν καὶ τὴν θάλασσαν,',
   'Kai eidon allon angelon anabainonta apo anatolēs hēliou, echonta sphragida Theou zōntos; kai ekraxen en phōnē megalē tois tessarsin angelois hois edothē autois adikēsai tēn gēn kai tēn thalassan.',
   'Another angel, distinct from the four, appears ''from the rising of the sun,'' a direction often associated with divine revelation, new beginnings, or the coming of God''s glory (Ezek 43:2; Mal 4:2). This angel carries ''the seal of the living God,'' signifying divine authority and ownership. The ''living God'' is a common Old Testament designation emphasizing God''s active presence and power, in contrast to idols. The angel''s loud cry underscores the urgency and divine imperative of the command to halt the destructive winds, highlighting God''s sovereign control over all agents of judgment.',
   'The ''seal of the living God'' represents God''s sovereign mark of ownership and protection upon His people. This divine sealing is a theological concept found throughout Scripture, signifying security, authenticity, and the Holy Spirit''s indwelling as a guarantee of future inheritance (Eph 1:13-14; 4:30). It assures believers of their preservation through trials, demonstrating God''s faithfulness to His covenant promises.'),
  (3,
   'Saying, Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our God in their foreheads.',
   'λέγων, Μὴ ἀδικήσητε τὴν γῆν μήτε τὴν θάλασσαν μήτε τὰ δένδρα, ἄχρι οὗ σφραγίσωμεν τοὺς δούλους τοῦ Θεοῦ ἡμῶν ἐπὶ τῶν μετώπων αὐτῶν.',
   'legōn, Mē adikēsēte tēn gēn mēte tēn thalassan mēte ta dendra, achri hou sphragisōmen tous doulous tou Theou hēmōn epi tōn metōpōn autōn.',
   'The command ''Hurt not'' reveals God''s priority: the protection of His servants before the full outpouring of judgment. The act of ''sealing... upon their foreheads'' is reminiscent of Ezekiel 9:4, where a mark (tav) is placed on the foreheads of the righteous in Jerusalem to spare them from destruction. This mark signifies divine ownership and protection, distinguishing God''s faithful from those who will face wrath. It is an internal spiritual reality made visible, ensuring their security in the midst of tribulation.',
   'The sealing of God''s servants on their foreheads is a powerful symbol of divine election and preservation. It signifies that God knows His own (2 Tim 2:19) and protects them from spiritual harm, even if they experience physical tribulation. This mark contrasts sharply with the mark of the beast later in Revelation, establishing a clear distinction between those who belong to God and those who follow the antichrist.'),
  (4,
   'And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Israel.',
   'Καὶ ἤκουσα τὸν ἀριθμὸν τῶν ἐσφραγισμένων, ἑκατὸν τεσσεράκοντα τέσσαρες χιλιάδες, ἐσφραγισμένοι ἐκ πάσης φυλῆς υἱῶν Ἰσραήλ.',
   'Kai ēkousa ton arithmon tōn esphragismenōn, hekaton tesserakonta tessares chiliades, esphragismenoi ek pasēs phylēs huiōn Israēl.',
   'The number ''144,000'' is highly symbolic, representing 12 (tribes of Israel, apostles) multiplied by 12, and then by 1,000 (a number signifying completeness or multitude). This suggests a complete, perfect, and innumerable company of God''s people. While some interpret this literally as ethnic Israel, many scholars understand it symbolically to represent the full number of God''s redeemed from both Old and New Covenants, the spiritual Israel (Gal 6:16; Rom 2:28-29). The emphasis is on their origin ''from all the tribes of the children of Israel,'' connecting them to God''s covenant people.',
   'The 144,000 represent God''s preserved remnant, a complete and perfect number of His faithful people. Whether understood as literal ethnic Israel or symbolic of the church, their sealing signifies God''s unwavering commitment to His covenant people. This group stands in contrast to the unsealed world, highlighting God''s sovereign choice to protect and preserve those who are His own through the coming judgments.'),
  (5,
   'Of the tribe of Juda were sealed twelve thousand. Of the tribe of Reuben were sealed twelve thousand. Of the tribe of Gad were sealed twelve thousand.',
   'Ἐκ φυλῆς Ἰούδα δώδεκα χιλιάδες ἐσφραγισμένοι, ἐκ φυλῆς Ῥουβὴν δώδεκα χιλιάδες, ἐκ φυλῆς Γὰδ δώδεκα χιλιάδες,',
   'Ek phylēs Iouda dōdeka chiliades esphragismenoi, ek phylēs Rhoubēn dōdeka chiliades, ek phylēs Gad dōdeka chiliades,',
   'The listing of the tribes is significant, though it deviates from typical Old Testament lists (e.g., Num 1:5-15; Ezek 48:1-7). Notably, the tribe of Dan is omitted, and Joseph is listed alongside Manasseh (his son), while Levi, typically a priestly tribe without land inheritance, is included. Judah is listed first, likely due to its messianic significance (Gen 49:10). The equal number of 12,000 from each tribe reinforces the symbolic completeness and order, rather than a literal census. This structured list emphasizes the divine order and comprehensive nature of God''s selection.',
   NULL),
  (6,
   'Of the tribe of Aser were sealed twelve thousand. Of the tribe of Nephthalim were sealed twelve thousand. Of the tribe of Manasses were sealed twelve thousand.',
   'ἐκ φυλῆς Ἀσὴρ δώδεκα χιλιάδες, ἐκ φυλῆς Νεφθαλὶμ δώδεκα χιλιάδες, ἐκ φυλῆς Μανασσῆ δώδεκα χιλιάδες,',
   'ek phylēs Asēr dōdeka chiliades, ek phylēs Nephthaliim dōdeka chiliades, ek phylēs Manassē dōdeka chiliades,',
   'Continuing the enumeration, the inclusion of Manasseh as a distinct tribe, alongside Joseph (v.8), further highlights the unique nature of this list. The consistent ''twelve thousand'' for each tribe underscores the symbolic rather than literal interpretation of the number. This meticulous listing emphasizes God''s comprehensive knowledge and selection of His people, ensuring that none of His chosen are overlooked or forgotten. The divine order and precision in this selection offer reassurance of God''s meticulous care.',
   NULL),
  (7,
   'Of the tribe of Simeon were sealed twelve thousand. Of the tribe of Levi were sealed twelve thousand. Of the tribe of Issachar were sealed twelve thousand.',
   'ἐκ φυλῆς Συμεὼν δώδεκα χιλιάδες, ἐκ φυλῆς Λευὶ δώδεκα χιλιάδες, ἐκ φυλῆς Ἰσσαχὰρ δώδεκα χιλιάδες,',
   'ek phylēs Symeōn dōdeka chiliades, ek phylēs Leui dōdeka chiliades, ek phylēs Issachar dōdeka chiliades,',
   'The inclusion of Levi, typically a priestly tribe not counted among the twelve for land distribution, further supports the symbolic interpretation of this list. Its presence here signifies that all aspects of God''s covenant people, including those dedicated to spiritual service, are included in this divine sealing. The consistent number for each tribe reinforces the idea of a divinely ordered and complete company, chosen and preserved by God for His purposes.',
   NULL),
  (8,
   'Of the tribe of Zabulon were sealed twelve thousand. Of the tribe of Joseph were sealed twelve thousand. Of the tribe of Benjamin were sealed twelve thousand.',
   'ἐκ φυλῆς Ζαβουλὼν δώδεκα χιλιάδες, ἐκ φυλῆς Ἰωσὴφ δώδεκα χιλιάδες, ἐκ φυλῆς Βενιαμὶν δώδεκα χιλιάδες.',
   'ek phylēs Zabulōn dōdeka chiliades, ek phylēs Iōsēph dōdeka chiliades, ek phylēs Beniamin dōdeka chiliades.',
   'The list concludes with Zebulun, Joseph, and Benjamin. The inclusion of ''Joseph'' (representing Ephraim, his other son) alongside Manasseh (v.6) is another unique feature, ensuring that the total count remains twelve tribes despite the omission of Dan. The precise and repetitive nature of the enumeration serves to emphasize the divine order and completeness of this sealed company, highlighting God''s meticulous care in gathering and preserving His chosen people from all segments of Israel.',
   NULL),
  (9,
   'After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;',
   'Μετὰ τοῦτο εἶδον, καὶ ἰδοὺ ὄχλος πολὺς, ὃν ἀριθμῆσαι οὐδεὶς ἐδύνατο, ἐκ παντὸς ἔθνους καὶ φυλῶν καὶ λαῶν καὶ γλωσσῶν, ἑστῶτες ἐνώπιον τοῦ θρόνου καὶ ἐνώπιον τοῦ ἀρνίου, περιβεβλημένους στολὰς λευκὰς, καὶ φοίνικες ἐν ταῖς χερσὶν αὐτῶν·',
   'Meta touto eidon, kai idou ochlos polys, hon arithmēsay oudeis edynato, ek pantos ethnous kai phylōn kai laōn kai glōssōn, hestōtes enōpion tou thronou kai enōpion tou arniou, peribeblēmenous stolas leukas, kai phoinikes en tais chersin autōn;',
   'This vision contrasts sharply with the precisely numbered 144,000. Here, John sees an ''innumerable multitude'' from ''every nation, tribe, people, and language,'' a universal representation of the redeemed. They stand ''before the throne and before the Lamb,'' indicating their direct access to God and Christ. Their ''white robes'' symbolize purity, righteousness, and victory, often associated with those who have overcome (Rev 3:5). ''Palms in their hands'' are symbols of victory and celebration, reminiscent of the Feast of Tabernacles (Lev 23:40) and Jesus'' triumphal entry (John 12:13).',
   'This ''great multitude'' represents the universal scope of God''s salvation, encompassing believers from all humanity, not just a specific ethnic group. Their standing before the throne signifies their redeemed status and direct access to God, while their white robes and palms symbolize the purity, victory, and joy of those who have been justified by Christ and have overcome the world through faith.'),
  (10,
   'And cried with a loud voice, saying, Salvation to our God which sitteth upon the throne, and unto the Lamb.',
   'καὶ κράζοντες φωνῇ μεγάλῃ λέγοντες, Ἡ σωτηρία τῷ Θεῷ ἡμῶν τῷ καθημένῳ ἐπὶ τοῦ θρόνου, καὶ τῷ ἀρνίῳ.',
   'kai krazontes phōnē megalē legontes, Hē sōtēria tō Theō hēmōn tō kathēmenō epi tou thronou, kai tō Arniō.',
   'The loud cry of the multitude is a declaration of praise and attribution of salvation. They proclaim that ''Salvation belongs to our God who sits on the throne, and to the Lamb.'' This doxology highlights that salvation originates solely from God the Father and is accomplished through the sacrificial work of Jesus Christ, the Lamb. It is a recognition of divine sovereignty and redemptive power, emphasizing that humanity''s deliverance from sin and judgment is entirely a gift from God, received through Christ.',
   'This verse articulates a core Christian doctrine: salvation is solely by God''s grace, accomplished through Christ''s atoning work. The unified cry of the multitude underscores that all redeemed humanity recognizes God and the Lamb as the source of their deliverance. This worship reinforces the co-equality of the Father and the Son in the work of salvation and in receiving ultimate praise.'),
  (11,
   'And all the angels stood round about the throne, and about the elders and the four beasts, and fell before the throne on their faces, and worshipped God,',
   'Καὶ πάντες οἱ ἄγγελοι εἱστήκεισαν κύκλῳ τοῦ θρόνου καὶ τῶν πρεσβυτέρων καὶ τῶν τεσσάρων ζῴων, καὶ ἔπεσον ἐνώπιον τοῦ θρόνου ἐπὶ τὰ πρόσωπα αὐτῶν καὶ προσεκύνησαν τῷ Θεῷ,',
   'Kai pantes hoi angeloi heistēkeisan kyklō tou thronou kai tōn presbyterōn kai tōn tessarōn zōōn, kai epeson enōpion tou thronou epi ta prosōpa autōn kai prosekynēsan tō Theō,',
   'The heavenly host—angels, elders, and the four living creatures—join in the worship, falling on their faces in profound reverence. This act of prostration (''fell before the throne on their faces'') is the ultimate posture of submission and adoration in the presence of divine majesty. Their participation signifies the universal recognition of God''s worthiness to receive all glory and praise, uniting all creation in worship of the Creator and Redeemer. It underscores the cosmic scope of God''s reign and the Lamb''s redemptive work.',
   NULL),
  (12,
   'Saying, Amen: Blessing, and glory, and wisdom, and thanksgiving, and honour, and power, and might, be unto our God for ever and ever. Amen.',
   'λέγοντες, Ἀμήν· Ἡ εὐλογία καὶ ἡ δόξα καὶ ἡ σοφία καὶ ἡ εὐχαριστία καὶ ἡ τιμὴ καὶ ἡ δύναμις καὶ ἡ ἰσχὺς τῷ Θεῷ ἡμῶν εἰς τοὺς αἰῶνας τῶν αἰώνων. Ἀμήν.',
   'legontes, Amēn; Hē eulogia kai hē doxa kai hē sophia kai hē eucharistia kai hē timē kai hē dynamis kai hē iskhys tō Theō hēmōn eis tous aiōnas tōn aiōnōn. Amēn.',
   'This sevenfold doxology is a comprehensive declaration of God''s supreme attributes and worthiness. ''Amen'' affirms the truth of the preceding praise. The seven terms—blessing, glory, wisdom, thanksgiving, honor, power, and might—represent the fullness of praise due to God. This echoes similar doxologies in Revelation (e.g., 5:12-13), emphasizing God''s omnipotence, omniscience, and benevolence. The phrase ''forever and ever'' signifies the eternal nature of God''s reign and the unending worship He receives.',
   'This magnificent doxology encapsulates the complete and eternal praise due to God. The seven attributes highlight His perfect character and sovereign rule. It teaches that true worship involves acknowledging God''s inherent worthiness, not just for what He does, but for who He is—the source of all blessing, wisdom, power, and glory, deserving of unending honor and thanksgiving from all creation.'),
  (13,
   'And one of the elders answered, saying unto me, What are these which are arrayed in white robes? and whence came they?',
   'Καὶ ἀπεκρίθη εἷς ἐκ τῶν πρεσβυτέρων λέγων μοι, Οὗτοι οἱ περιβεβλημένοι τὰς στολὰς τὰς λευκὰς τίνες εἰσὶν καὶ πόθεν ἦλθον;',
   'Kai apekrithē heis ek tōn presbyterōn legōn moi, Houtoi hoi peribeblēmenoi tas stolas tas leukas tines eisin kai pothen ēlthen?',
   'One of the elders, acting as an interpreter or guide, poses a rhetorical question to John. This is a common literary device in apocalyptic literature, designed to draw the reader into the narrative and provide an explanation for a mysterious vision. The elder''s question focuses on the identity and origin of the white-robed multitude, setting the stage for a crucial revelation about their identity and the source of their salvation. It implies that their presence is remarkable and warrants special attention.',
   NULL),
  (14,
   'And I said unto him, Sir, thou knowest. And he said to me, These are they which came out of great tribulation, and have washed their robes, and made them white in the blood of the Lamb.',
   'καὶ εἴρηκα αὐτῷ, Κύριέ μου, σὺ οἶδας. Καὶ εἶπέν μοι, Οὗτοί εἰσιν οἱ ἐρχόμενοι ἐκ τῆς θλίψεως τῆς μεγάλης, καὶ ἔπλυναν τὰς στολὰς αὐτῶν καὶ ἐλεύκαναν αὐτὰς ἐν τῷ αἵματι τοῦ ἀρνίου.',
   'kai eirēka autō, Kyrie mou, sy oidas. Kai eipen moi, Houtoi eisin hoi erchomenoi ek tēs thlipseōs tēs megalēs, kai eplynan tas stolas autōn kai eleukanan autas en tō haimati tou Arniou.',
   'John humbly defers to the elder''s superior knowledge, prompting the explanation. The multitude are identified as those ''who came out of the great tribulation.'' This ''great tribulation'' (ἡ θλῖψις ἡ μεγάλη) refers to a period of intense suffering and persecution, often understood as the eschatological distress preceding Christ''s return (Dan 12:1; Matt 24:21). Crucially, their white robes are not earned by their suffering but ''washed... and made white in the blood of the Lamb.'' This paradoxical image highlights that cleansing and righteousness come only through Christ''s atoning sacrifice (Heb 9:14; 1 John 1:7), not human merit.',
   'This verse is a cornerstone of Christian soteriology. It reveals that salvation and purity are not achieved through human suffering, but through the cleansing power of Christ''s sacrificial blood. The ''great tribulation'' signifies the trials believers face, yet their ultimate victory and righteousness are solely attributed to the Lamb. This emphasizes justification by faith and the efficacy of Christ''s atonement for all who believe.'),
  (15,
   'Therefore are they before the throne of God, and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them.',
   'Διὰ τοῦτο εἰσὶν ἐνώπιον τοῦ θρόνου τοῦ Θεοῦ, καὶ λατρεύουσιν αὐτῷ ἡμέρας καὶ νυκτὸς ἐν τῷ ναῷ αὐτοῦ· καὶ ὁ καθήμενος ἐπὶ τοῦ θρόνου σκηνώσει ἐπ’ αὐτούς.',
   'Dia touto eisin enōpion tou thronou tou Theou, kai latreuousin autō hēmeras kai nyktos en tō naō autou; kai ho kathēmenos epi tou thronou skēnōsei ep'' autous.',
   'Because of their cleansing by the Lamb''s blood, they are granted eternal access to God''s presence, serving Him ''day and night in His temple.'' This continuous worship signifies their perpetual communion and devotion. The promise that ''He who sits on the throne will dwell among them'' (σκηνώσει ἐπ’ αὐτούς, ''will tabernacle over them'') evokes the Old Testament concept of God''s presence among His people in the tabernacle (Exod 25:8; 40:34-35). It guarantees intimate, protective fellowship with God, fulfilling the ultimate hope of redemption.',
   'This verse describes the blessed state of the redeemed: perpetual presence before God''s throne, unending worship, and intimate fellowship with God Himself. The promise that God ''will tabernacle over them'' signifies His protective, personal, and constant presence, fulfilling the deepest longings of the human heart for communion with its Creator. It paints a picture of eternal security and joy in God''s immediate presence.'),
  (16,
   'They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat.',
   'οὐ πεινάσουσιν ἔτι οὐδὲ διψήσουσιν ἔτι, οὐδὲ μὴ πέσῃ ἐπ’ αὐτοὺς ὁ ἥλιος οὐδὲ πᾶν καῦμα·',
   'ou peinasousin eti oude dipsēsousin eti, oude mē pesē ep'' autous ho hēlios oude pan kauma;',
   'This verse describes the cessation of earthly suffering and hardship for the redeemed. The promises ''they shall hunger no more, neither thirst any more'' and ''neither shall the sun light on them, nor any heat'' directly address the physical deprivations and persecutions often experienced during tribulation. These assurances echo Old Testament prophecies of restoration and comfort (Isa 49:10; Ps 121:6), signifying a state of perfect provision, peace, and protection in the new heavens and new earth, free from all forms of distress.',
   'This promise of freedom from hunger, thirst, and oppressive heat speaks to the ultimate restoration and comfort provided by God in eternity. It signifies the end of all suffering and deprivation, both physical and spiritual, that believers endure in this fallen world. It assures a state of perfect well-being and divine provision, where all needs are met and all discomfort is removed by God''s loving care.'),
  (17,
   'For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and God shall wipe away all tears from their eyes.',
   'ὅτι τὸ ἀρνίον τὸ ἀνὰ μέσον τοῦ θρόνου ποιμανεῖ αὐτοὺς καὶ ὁδηγήσει αὐτοὺς ἐπὶ ζώσας πηγὰς ὑδάτων· καὶ ἐξαλείψει ὁ Θεὸς πᾶν δάκρυον ἀπὸ τῶν ὀφθαλμῶν αὐτῶν.',
   'hoti to Arnion to ana meson tou thronou poimanei autous kai hodēgēsei autous epi zōsas pēgas hydatōn; kai exaleipsei ho Theos pan dakryon apo tōn ophthalmon autōn.',
   'The Lamb, though in the midst of the throne (indicating His divine authority and co-equality with God), acts as a shepherd (''poimanei autous''). This imagery connects Jesus to the Good Shepherd of Psalm 23 and John 10, emphasizing His tender care and guidance. He will lead them to ''living fountains of waters,'' symbolizing eternal life and spiritual refreshment. The final promise, ''God shall wipe away all tears from their eyes,'' is a profound assurance of ultimate comfort and the complete removal of all sorrow and pain, a theme reiterated in Revelation 21:4.',
   'This verse beautifully portrays the Lamb''s ongoing role as the compassionate Shepherd, providing eternal sustenance and guidance. The promise of ''living fountains of waters'' signifies unending spiritual life and satisfaction, while God wiping away ''all tears'' speaks to the complete eradication of sorrow, pain, and suffering. It is the ultimate comfort, assuring believers of a future free from all grief, in the loving presence of God.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 7;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σφραγίσωμεν', 'sphragisōmen', 'G4972', 'From ''sphragis'' (a seal), this verb means ''to seal,'' ''to set a mark upon,'' or ''to secure.'' In this context, it denotes God''s act of marking His servants for preservation from impending judgment. It signifies divine ownership, protection, and authentication, much like a king''s seal on a document or property, guaranteeing their security and belonging to Him.', 1),
  ('δούλους', 'doulous', 'G1401', 'Meaning ''slave'' or ''servant,'' this term denotes one who is entirely devoted to another''s will. In a theological sense, it describes believers as ''servants of God,'' implying willing submission, obedience, and loyal service to their divine Master. It emphasizes a relationship of absolute allegiance and belonging, rather than forced servitude, reflecting a profound commitment to God''s purposes.', 2),
  ('μετώπων', 'metōpōn', 'G3359', 'Meaning ''forehead,'' this word refers to the visible part of the face. In biblical symbolism, the forehead is often where marks of identity, allegiance, or ownership are placed. The sealing on the forehead signifies a public and undeniable declaration of belonging to God, contrasting with the mark of the beast later in Revelation, and indicating divine protection and recognition.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀριθμὸν', 'arithmon', 'G706', 'Meaning ''number,'' this term refers to a specific quantity. In Revelation, numbers often carry symbolic significance beyond their literal value. The ''number'' of the sealed here (144,000) is understood by many scholars to represent a complete and perfect company of God''s people, rather than a literal census, emphasizing divine order and fullness.', 1),
  ('ἐσφραγισμένων', 'esphragismenōn', 'G4972', 'This is the perfect passive participle of ''sphragizō,'' meaning ''those who have been sealed.'' It highlights the completed action of God''s sealing, signifying that these individuals are permanently marked, owned, and protected by God. The passive voice emphasizes that this action is entirely God''s work, not something achieved by human effort.', 2),
  ('φυλῆς', 'phylēs', 'G5443', 'Meaning ''tribe,'' ''clan,'' or ''nation,'' this term refers to a division of people, often based on ancestry. Here, it specifically refers to the twelve tribes of Israel. In Revelation, ''tribe'' can refer to ethnic groups or, more broadly, to the spiritual lineage of God''s people, emphasizing their distinct identity within God''s covenant plan.', 3),
  ('Ἰσραήλ', 'Israēl', 'G2474', 'The Hebrew name ''Israel'' (meaning ''God strives'' or ''prince with God'') refers to Jacob and, by extension, his descendants and the nation formed from them. In the New Testament, ''Israel'' can refer to ethnic Israel or, in a broader theological sense, to the spiritual people of God, including both Jewish and Gentile believers who are part of God''s covenant (Gal 6:16; Rom 9:6).', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 4;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὄχλος', 'ochlos', 'G3793', 'Meaning ''crowd'' or ''multitude,'' this term denotes a large, often unorganized, group of people. Here, it is qualified as ''polys'' (many/great), emphasizing its immense, uncountable size. This ''great multitude'' contrasts with the precisely numbered 144,000, signifying the vast, universal scope of God''s redemption beyond any specific ethnic or national boundary.', 1),
  ('ἔθνους', 'ethnous', 'G1484', 'Meaning ''nation,'' ''people,'' or ''Gentiles,'' this term refers to distinct ethnic or national groups. The phrase ''every nation, tribe, people, and language'' is a common apocalyptic idiom in Revelation (e.g., 5:9; 10:11), signifying the global and inclusive nature of God''s redemptive plan, encompassing all humanity without distinction.', 2),
  ('θρόνου', 'thronou', 'G2362', 'Meaning ''throne,'' this refers to a seat of authority, power, and kingship. In Revelation, the ''throne'' of God is the central symbol of divine sovereignty and ultimate rule. Standing ''before the throne'' signifies direct access to God''s presence, indicating the redeemed''s privileged status and their participation in God''s eternal kingdom.', 3),
  ('ἀρνίου', 'arníou', 'G721', 'Meaning ''lamb,'' this is a diminutive form of ''arn'' (lamb). In Revelation, ''the Lamb'' is consistently Jesus Christ, depicted as both sacrificial victim (John 1:29) and victorious King. Standing ''before the Lamb'' signifies worship and allegiance to Christ, acknowledging His atoning work and His supreme authority in heaven.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 9;

-- Verse 10
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σωτηρία', 'sōtēria', 'G4991', 'Meaning ''salvation,'' ''deliverance,'' or ''preservation,'' this term encompasses rescue from danger, sin, and judgment, leading to wholeness and eternal life. The multitude''s cry ''Salvation to our God... and to the Lamb'' attributes the entirety of their deliverance and eternal well-being solely to God the Father and Jesus Christ, emphasizing divine grace.', 1),
  ('καθημένῳ', 'kathēmenō', 'G2521', 'The present participle of ''kathēmai,'' meaning ''sitting'' or ''seated.'' When applied to God on the throne, it signifies His established authority, sovereign rule, and permanent reign. It conveys a sense of stability, majesty, and ultimate control over all creation and history, reinforcing His position as the supreme ruler.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 10;

-- Verse 14
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θλίψεως', 'thlipseōs', 'G2347', 'Meaning ''tribulation,'' ''affliction,'' ''distress,'' or ''pressure.'' It describes intense suffering, often due to persecution or hardship. The ''great tribulation'' refers to a specific period of severe distress for believers, but it also broadly encompasses the trials and persecutions faced by God''s people throughout history, from which they are ultimately delivered by God.', 1),
  ('ἔπλυναν', 'eplynan', 'G4150', 'Meaning ''they washed,'' this verb refers to the act of cleansing, typically of garments. The image of washing robes in the blood of the Lamb is a powerful paradox, signifying that purity and righteousness are achieved not through human effort or suffering, but through the atoning sacrifice of Jesus Christ, whose blood cleanses from all sin (1 John 1:7).', 2),
  ('ἐλεύκαναν', 'eleukanan', 'G3021', 'Meaning ''they made white'' or ''they whitened.'' This verb emphasizes the result of the washing: their robes became perfectly white. White symbolizes purity, righteousness, and victory in Revelation. The act of making them white in the Lamb''s blood underscores that their blamelessness and acceptance before God are entirely due to Christ''s redemptive work.', 3),
  ('αἵματι', 'haímati', 'G129', 'Meaning ''blood,'' this term is central to biblical theology, representing life and atonement. The ''blood of the Lamb'' refers specifically to the sacrificial death of Jesus Christ, whose shed blood provides propitiation for sin, cleansing, and redemption. It is the sole means by which believers are justified and made righteous before God (Rom 5:9; Heb 9:14).', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 14;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('λατρεύουσιν', 'latreuousin', 'G3000', 'Meaning ''they serve'' or ''they worship,'' this verb denotes religious service or devotion, often in a priestly capacity. It implies continuous, dedicated worship and ministry to God. The redeemed multitude''s service ''day and night in His temple'' signifies their perpetual communion with God and their eternal engagement in acts of adoration and devotion in His presence.', 1),
  ('ναῷ', 'naō', 'G3485', 'Meaning ''temple'' or ''sanctuary,'' referring to the inner sanctuary where God''s presence dwells. In Revelation, the heavenly temple is the locus of God''s presence and worship. The redeemed serving in ''His temple'' signifies their intimate access to God and their participation in heavenly worship, a fulfillment of the priestly calling of all believers.', 2),
  ('σκηνώσει', 'skēnōsei', 'G4637', 'Meaning ''He will dwell'' or ''He will tabernacle.'' From ''skēnē'' (tent/tabernacle), this verb evokes the Old Testament concept of God dwelling among His people in the tabernacle (Exod 25:8). Here, it promises God''s intimate, protective, and permanent presence with the redeemed, fulfilling the ultimate hope of divine fellowship and security.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 15;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ποιμανεῖ', 'poimanei', 'G4165', 'Meaning ''He will shepherd'' or ''He will feed.'' This verb emphasizes the Lamb''s role as a caring and guiding shepherd, providing for and protecting His flock. It connects Jesus to the Old Testament imagery of God as the Shepherd of Israel (Ps 23:1; Isa 40:11), highlighting His tender care and leadership for His redeemed people in eternity.', 1),
  ('ὁδηγήσει', 'hodēgēsei', 'G3594', 'Meaning ''He will lead'' or ''He will guide.'' This verb signifies direction and guidance, often implying a journey or path. The Lamb''s guidance to ''living fountains of waters'' underscores His role in leading the redeemed to sources of eternal life and refreshment, ensuring their perpetual spiritual nourishment and well-being in God''s presence.', 2),
  ('πηγὰς', 'pēgas', 'G4077', 'Meaning ''springs'' or ''fountains.'' When combined with ''zōsas'' (living), it refers to ''living fountains of waters,'' symbolizing sources of eternal life, spiritual refreshment, and unending sustenance. This imagery contrasts with the thirst and deprivation of earthly life, promising abundant and perpetual provision in the new creation.', 3),
  ('ἐξαλείψει', 'exaleipsei', 'G1813', 'Meaning ''He will wipe away,'' ''blot out,'' or ''erase.'' This verb signifies complete removal or obliteration. God wiping away ''every tear'' from their eyes promises the total cessation of all sorrow, pain, and grief. It is a profound assurance of ultimate comfort and healing, signifying the complete restoration of joy and peace in God''s eternal presence.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Jeremiah 49:36', 1),
  (1, 'Daniel 7:2', 2),
  (1, 'Zechariah 6:5', 3),
  (1, 'Matthew 24:31', 4),
  (2, 'Ezekiel 43:2', 1),
  (2, 'Malachi 4:2', 2),
  (2, 'Ephesians 1:13', 3),
  (2, '2 Timothy 2:19', 4),
  (3, 'Ezekiel 9:4-6', 1),
  (3, 'Ephesians 4:30', 2),
  (3, '2 Corinthians 1:22', 3),
  (3, 'Revelation 14:1', 4),
  (4, 'Revelation 14:1-5', 1),
  (4, 'Romans 11:25-26', 2),
  (4, 'Galatians 6:16', 3),
  (5, 'Genesis 49:8-12', 1),
  (5, 'Numbers 1:5-15', 2),
  (9, 'Revelation 5:9', 1),
  (9, 'Zechariah 8:20-23', 2),
  (9, 'John 12:13', 3),
  (9, 'Romans 11:12', 4),
  (10, 'Psalm 3:8', 1),
  (10, 'Isaiah 43:11', 2),
  (10, 'Hosea 13:4', 3),
  (10, 'Revelation 19:1', 4),
  (11, 'Revelation 4:4', 1),
  (11, 'Revelation 5:11-14', 2),
  (11, 'Hebrews 12:22-24', 3),
  (12, 'Revelation 5:12-13', 1),
  (12, '1 Chronicles 29:11', 2),
  (12, 'Jude 1:25', 3),
  (13, 'Zechariah 4:5', 1),
  (13, 'Revelation 6:11', 2),
  (14, 'Daniel 12:1', 1),
  (14, 'Matthew 24:21', 2),
  (14, 'Hebrews 9:14', 3),
  (14, '1 John 1:7', 4),
  (14, 'Revelation 22:14', 5),
  (15, 'Exodus 25:8', 1),
  (15, 'Leviticus 26:11-12', 2),
  (15, 'John 1:14', 3),
  (15, 'Revelation 21:3', 4),
  (16, 'Isaiah 49:10', 1),
  (16, 'Psalm 121:6', 2),
  (16, 'John 4:14', 3),
  (16, 'John 6:35', 4),
  (17, 'Psalm 23:1-2', 1),
  (17, 'Isaiah 49:10', 2),
  (17, 'John 10:11', 3),
  (17, 'Revelation 21:4', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 7 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 7 Complete!
-- 17 verses · 7 key verses with word studies (24 words)
-- Cross-references for 14 verses (50 refs)
-- ═══════════════════════════════════════════════════════