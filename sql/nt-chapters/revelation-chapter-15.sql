-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 15 — The Song of Moses and the Lamb; Preparation for the Last Plagues
-- 8 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 15,
  'Revelation 15 is the shortest chapter in the book and serves as a heavenly prologue to the seven last plagues that follow in chapter 16. John sees ''another sign'' in heaven: seven angels with the seven last plagues, in which the wrath of God is ''filled up.'' Standing on a sea of glass mingled with fire are those who have triumphed over the beast, singing the ''Song of Moses and the Lamb,'' uniting the deliverance at the Red Sea with the greater deliverance accomplished by Christ. The chapter closes with the temple in heaven filled with smoke from God''s glory, no one able to enter until the seven plagues are completed — a vivid picture of the inexorability of final judgment.',
  'The Song of Moses and the Lamb; Preparation for the Last Plagues',
  'πληγή (plēgē)',
  'Plēgē means a blow, stroke, or wound, and by extension a divinely-inflicted plague. The seven ''last'' plagues are climactic — in them God''s wrath is brought to its appointed fullness (ἐτελέσθη, v.1). The word links the eschatological judgments to the Exodus plagues, showing the same God acting on a cosmic stage.',
  '["Section 1 (vv.1-2): The Sign of the Seven Angels and the Sea of Glass","Section 2 (vv.3-4): The Song of Moses and the Lamb","Section 3 (vv.5-8): The Temple Opened and the Bowls Given to the Angels"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 8 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I saw another sign in heaven, great and marvellous, seven angels having the seven last plagues; for in them is filled up the wrath of God.',
   'Καὶ εἶδον ἄλλο σημεῖον ἐν τῷ οὐρανῷ μέγα καὶ θαυμαστόν, ἀγγέλους ἑπτὰ ἔχοντας πληγὰς ἑπτὰ τὰς ἐσχάτας, ὅτι ἐν αὐταῖς ἐτελέσθη ὁ θυμὸς τοῦ Θεοῦ.',
   'Kai eidon allo sēmeion en tō ouranō mega kai thaumaston, angelous hepta echontas plēgas hepta tas eschatas, hoti en autais etelesthē ho thymos tou Theou.',
   'This is the third ''sign'' in heaven (after the woman in 12:1 and the dragon in 12:3). ''Last'' (ἐσχάτας) carries climactic force — these complete God''s wrath. The verb ''filled up'' (ἐτελέσθη) is from ''teleō'' (to bring to completion). What has been building since the seals and trumpets reaches its appointed limit. The bowl judgments are not arbitrary but the consummation of holy justice.',
   'Divine wrath has a definite measure. God''s patience does not mean indifference; His delay does not mean denial. When the cup is full, judgment falls. The sequence assures the persecuted that God''s clock runs to completion.'),
  (2,
   'And I saw as it were a sea of glass mingled with fire: and them that had gotten the victory over the beast, and over his image, and over his mark, and over the number of his name, stand on the sea of glass, having the harps of God.',
   'Καὶ εἶδον ὡς θάλασσαν ὑαλίνην μεμιγμένην πυρί, καὶ τοὺς νικῶντας ἐκ τοῦ θηρίου καὶ ἐκ τῆς εἰκόνος αὐτοῦ καὶ ἐκ τοῦ ἀριθμοῦ τοῦ ὀνόματος αὐτοῦ, ἑστῶτας ἐπὶ τὴν θάλασσαν τὴν ὑαλίνην, ἔχοντας κιθάρας τοῦ Θεοῦ.',
   'Kai eidon hōs thalassan hyalinēn memigmenēn pyri, kai tous nikōntas ek tou thēriou kai ek tēs eikonos autou kai ek tou arithmou tou onomatos autou, hestōtas epi tēn thalassan tēn hyalinēn, echontas kitharas tou Theou.',
   'The sea of glass first appeared before the throne in 4:6; here it is ''mingled with fire,'' suggesting the trial through which the saints have passed. The victors stand on it as Israel stood on the far shore of the Red Sea. ''Gotten the victory over the beast'' (νικῶντας ἐκ) is unusual Greek — literally ''conquerors out of'' the beast — implying both triumph and deliverance from his realm. The harps echo 14:2; worship is the saints'' weapon and reward.',
   'Christian victory is not avoidance of suffering but emergence through it. The sea of fire-mingled glass is a portrait of trial transfigured into testimony. To overcome the beast is to refuse his worship and his mark, even at cost.'),
  (3,
   'And they sing the song of Moses the servant of God, and the song of the Lamb, saying, Great and marvellous are thy works, Lord God Almighty; just and true are thy ways, thou King of saints.',
   'Καὶ ᾄδουσιν τὴν ᾠδὴν Μωϋσέως τοῦ δούλου τοῦ Θεοῦ καὶ τὴν ᾠδὴν τοῦ Ἀρνίου λέγοντες· Μεγάλα καὶ θαυμαστὰ τὰ ἔργα σου, Κύριε ὁ Θεὸς ὁ Παντοκράτωρ· δίκαιαι καὶ ἀληθιναὶ αἱ ὁδοί σου, ὁ Βασιλεὺς τῶν αἰώνων.',
   'Kai adousin tēn ōdēn Mōyseōs tou doulou tou Theou kai tēn ōdēn tou Arniou legontes; Megala kai thaumasta ta erga sou, Kyrie ho Theos ho Pantokratōr; dikaiai kai alēthinai hai hodoi sou, ho Basileus tōn aiōnōn.',
   'The ''Song of Moses'' is most likely Exodus 15 (the song after Red Sea deliverance) and/or Deuteronomy 32. Its joining with the ''Song of the Lamb'' shows that the redemption Moses celebrated finds its fulfillment in Christ. The titles ascribed to God — ''Almighty'' (Παντοκράτωρ, lit. ''ruler of all'') and ''King of saints'' (some manuscripts read ''King of the ages,'' αἰώνων) — exalt His sovereign and just rule.',
   'There is one redemptive story across both Testaments. The Lamb who was slain is the same God who split the sea. The unity of Old and New Covenant worship is grounded in the unity of God''s saving acts.'),
  (4,
   'Who shall not fear thee, O Lord, and glorify thy name? for thou only art holy: for all nations shall come and worship before thee; for thy judgments are made manifest.',
   'Τίς οὐ μὴ φοβηθῇ, Κύριε, καὶ δοξάσῃ τὸ ὄνομά σου; ὅτι μόνος ὅσιος, ὅτι πάντα τὰ ἔθνη ἥξουσιν καὶ προσκυνήσουσιν ἐνώπιόν σου, ὅτι τὰ δικαιώματά σου ἐφανερώθησαν.',
   'Tis ou mē phobēthē, Kyrie, kai doxasē to onoma sou? hoti monos hosios, hoti panta ta ethnē hēxousin kai proskynēsousin enōpion sou, hoti ta dikaiōmata sou ephanerōthēsan.',
   'The rhetorical question expects the answer ''no one.'' God''s holiness (ὅσιος, distinguishing Him in moral perfection) compels reverence. The promise that ''all nations shall come and worship'' echoes Psalm 86:9 and Isaiah 66:23 — judgment ironically clarifies God''s righteousness and draws the nations to true worship. The visible manifestation (ἐφανερώθησαν) of God''s righteous acts strips away every pretense.',
   'Final judgment is a missionary moment. When God''s justice is openly displayed, even hostile nations will be moved to acknowledge Him (cf. Phil 2:10-11). God''s holiness is not isolating but ultimately magnetic — He alone is worthy.'),
  (5,
   'And after that I looked, and, behold, the temple of the tabernacle of the testimony in heaven was opened:',
   'Καὶ μετὰ ταῦτα εἶδον, καὶ ἠνοίγη ὁ ναὸς τῆς σκηνῆς τοῦ μαρτυρίου ἐν τῷ οὐρανῷ.',
   'Kai meta tauta eidon, kai ēnoigē ho naos tēs skēnēs tou martyriou en tō ouranō.',
   '''The tabernacle of the testimony'' is the Septuagint phrase for the Mosaic tent that housed the ark with the Ten Commandments — the ''testimony'' (Exod 38:21). The heavenly original is opened: the law''s witness against sin is now publicly vindicated. As the wilderness tabernacle housed the covenant, so the heavenly temple now sends forth covenant judgment.',
   NULL),
  (6,
   'And the seven angels came out of the temple, having the seven plagues, clothed in pure and white linen, and having their breasts girded with golden girdles.',
   'Καὶ ἐξῆλθον οἱ ἑπτὰ ἄγγελοι οἱ ἔχοντες τὰς ἑπτὰ πληγὰς ἐκ τοῦ ναοῦ, ἐνδεδυμένοι λίνον καθαρὸν λαμπρὸν καὶ περιεζωσμένοι περὶ τὰ στήθη ζώνας χρυσᾶς.',
   'Kai exēlthon hoi hepta angeloi hoi echontes tas hepta plēgas ek tou naou, endedymenoi linon katharon lampron kai periezōsmenoi peri ta stēthē zōnas chrysas.',
   'The angels emerge from the very sanctuary of God — judgment proceeds from God''s holy presence, not from arbitrary cruelty. Their priestly attire (linen, golden sashes) recalls the high priestly garments (Exod 28; cf. Rev 1:13 of Christ Himself), suggesting these angels execute a sacred, ordered ministry.',
   NULL),
  (7,
   'And one of the four beasts gave unto the seven angels seven golden vials full of the wrath of God, who liveth for ever and ever.',
   'Καὶ ἓν ἐκ τῶν τεσσάρων ζῴων ἔδωκεν τοῖς ἑπτὰ ἀγγέλοις ἑπτὰ φιάλας χρυσᾶς γεμούσας τοῦ θυμοῦ τοῦ Θεοῦ τοῦ ζῶντος εἰς τοὺς αἰῶνας τῶν αἰώνων.',
   'Kai hen ek tōn tessarōn zōōn edōken tois hepta angelois hepta phialas chrysas gemousas tou thymou tou Theou tou zōntos eis tous aiōnas tōn aiōnōn.',
   'The four living creatures, who lead heavenly worship (4:6-9), now hand over the bowls of wrath. Worship and judgment are not opposed; both arise from God''s holiness. ''Vials'' (φιάλας, more accurately ''bowls'') are wide, shallow dishes — their contents are poured out completely, not trickled. ''Liveth for ever and ever'' grounds judgment in God''s eternal life: He cannot be outlasted.',
   'God''s wrath is not impulsive but measured, served in vessels prepared in heaven. That the eternal-living God is the one judging removes any hope that delay might excuse rebellion. His patience runs to a defined limit.'),
  (8,
   'And the temple was filled with smoke from the glory of God, and from his power; and no man was able to enter into the temple, till the seven plagues of the seven angels were fulfilled.',
   'Καὶ ἐγεμίσθη ὁ ναὸς καπνοῦ ἐκ τῆς δόξης τοῦ Θεοῦ καὶ ἐκ τῆς δυνάμεως αὐτοῦ, καὶ οὐδεὶς ἐδύνατο εἰσελθεῖν εἰς τὸν ναὸν ἄχρι τελεσθῶσιν αἱ ἑπτὰ πληγαὶ τῶν ἑπτὰ ἀγγέλων.',
   'Kai egemisthē ho naos kapnou ek tēs doxēs tou Theou kai ek tēs dynameōs autou, kai oudeis edynato eiselthein eis ton naon achri telesthōsin hai hepta plēgai tōn hepta angelōn.',
   'The smoke recalls the glory cloud at Sinai (Exod 19:18), the dedication of the tabernacle (Exod 40:34-35), and the dedication of Solomon''s temple (1 Kgs 8:10-11). On those occasions priests could not minister because of God''s overwhelming presence. Here, no intercession is possible until the plagues are completed — the time of mediated mercy has paused; God acts in unmediated judgment.',
   'There is a point at which intercession is suspended and judgment must run its course. While the gospel still goes forth (14:6), the day comes when the door is shut (Matt 25:10). This sobering image urges urgency in repentance.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 15;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πληγάς', 'plēgas', 'G4127', 'Plagues, blows, strokes — the same word the Septuagint uses of the Egyptian plagues. The seven last ''plagues'' echo the Exodus, framing God''s climactic judgments as a greater Exodus from a greater bondage.', 1),
  ('ἐτελέσθη', 'etelesthē', 'G5055', 'Aorist passive of ''teleō,'' to bring to completion or finish. God''s wrath has a finite, divinely-set measure; here it reaches that measure. The same root underlies Christ''s ''It is finished'' (John 19:30).', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 15 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Παντοκράτωρ', 'Pantokratōr', 'G3841', 'Almighty, all-ruler. A favorite title in Revelation (9 occurrences) translating Hebrew Yhwh Tseva''ot (LORD of Hosts). It emphasizes God''s comprehensive sovereignty over all creation and history.', 1),
  ('δίκαιαι', 'dikaiai', 'G1342', 'Just, righteous. God''s ways meet the standard of perfect righteousness. There is no miscarriage of justice in His judgments — they are exactly what righteousness requires.', 2),
  ('ἀληθιναὶ', 'alēthinai', 'G228', 'True, genuine, real. God''s ways correspond to reality; His judgments are not based on appearance but on the truth of what is.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 15 AND v.verse_number = 3;

-- Verse 4
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὅσιος', 'hosios', 'G3741', 'Holy in the sense of moral purity, piety, devoutness — distinct from ''hagios'' (set apart). God alone is intrinsically and incomparably holy in this moral sense.', 1),
  ('δικαιώματά', 'dikaiōmata', 'G1345', 'Righteous acts, righteous decrees. Plural form here points to the manifest deeds of God''s justice — the visible outworking of His righteousness in judgment.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 15 AND v.verse_number = 4;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φιάλας', 'phialas', 'G5357', 'Bowls (the KJV ''vials'' is archaic). Wide, shallow dishes used in temple service. Their shape suggests sudden, complete pouring out — distinguishing the bowls from the more progressive seal and trumpet judgments.', 1),
  ('θυμοῦ', 'thymou', 'G2372', 'Wrath, fierce indignation. ''Thymos'' is the more passionate, surging side of anger, often distinguished from the more settled ''orgē.'' Here it points to the intensity of God''s righteous response to sin.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 15 AND v.verse_number = 7;

-- Verse 8
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δόξης', 'doxēs', 'G1391', 'Glory — the visible weight and splendor of God''s presence. In OT theophanies the glory cloud both reveals and conceals God; here it fills the temple as both manifestation and barrier.', 1),
  ('τελεσθῶσιν', 'telesthōsin', 'G5055', 'Aorist passive subjunctive of ''teleō,'' to be completed/finished. The plagues must run their full course; God''s judgment is not interrupted but completed.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 15 AND v.verse_number = 8;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Leviticus 26:21', 1),
  (1, 'Revelation 16:1', 2),
  (1, 'Revelation 21:9', 3),
  (2, 'Revelation 4:6', 1),
  (2, 'Revelation 13:15-17', 2),
  (2, 'Exodus 15:1-2', 3),
  (3, 'Exodus 15:1', 1),
  (3, 'Deuteronomy 32:1-4', 2),
  (3, 'Psalm 145:17', 3),
  (4, 'Psalm 86:9', 1),
  (4, 'Isaiah 66:23', 2),
  (4, 'Jeremiah 10:7', 3),
  (5, 'Exodus 38:21', 1),
  (5, 'Numbers 1:50', 2),
  (5, 'Revelation 11:19', 3),
  (6, 'Exodus 28:6-8', 1),
  (6, 'Revelation 1:13', 2),
  (6, 'Ezekiel 9:2', 3),
  (7, 'Revelation 4:6-9', 1),
  (7, 'Revelation 16:1', 2),
  (7, 'Jeremiah 25:15', 3),
  (8, 'Exodus 40:34-35', 1),
  (8, '1 Kings 8:10-11', 2),
  (8, 'Isaiah 6:4', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 15 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 15 Complete!
-- 8 verses · 5 key verses with word studies (11 words)
-- Cross-references for 8 verses (24 refs)
-- ═══════════════════════════════════════════════════════
