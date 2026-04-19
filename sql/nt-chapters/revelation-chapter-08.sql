-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 8 — The Seventh Seal, Heavenly Intercession, and the First Four Trumpet Judgments
-- 13 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 8,
  'Revelation chapter 8 marks a pivotal transition in John''s apocalyptic vision, moving from the opening of the seven seals to the sounding of the seven trumpets. The chapter begins with a profound silence in heaven after the seventh seal is broken, an interlude that precedes a new series of divine judgments. This silence is followed by a scene at the heavenly altar where an angel offers the prayers of the saints with much incense, symbolizing the efficacy of believers'' intercession before God. The subsequent casting of fire from the altar to the earth initiates the trumpet judgments, which are partial and affect a ''third part'' of creation—earth, sea, freshwaters, and celestial bodies. These initial four trumpet judgments serve as a prelude to the more severe ''woes'' to come, highlighting God''s sovereign control over creation and His righteous judgment against a rebellious world, while also emphasizing the role of prayer in the unfolding of His divine plan.',
  'The Seventh Seal, Heavenly Intercession, and the First Four Trumpet Judgments',
  'σάλπιγγας (salpingas)',
  'Derived from ''σάλπιγξ'' (salpinx), meaning ''trumpet.'' In Revelation, trumpets are instruments of divine announcement and judgment, often signaling the commencement of a new phase of God''s wrath or a call to attention. Their sound heralds significant eschatological events, echoing Old Testament uses where trumpets announced war, feasts, or the presence of God (e.g., Exod 19:16; Joel 2:1).',
  '["Section 1 (v. 1): The Opening of the Seventh Seal and Heavenly Silence","Section 2 (vv. 2-5): The Seven Angels, the Golden Censer, and Prayers of the Saints","Section 3 (v. 6): Preparation for the Trumpet Judgments","Section 4 (v. 7): The First Trumpet: Judgment on Earth''s Vegetation","Section 5 (vv. 8-9): The Second Trumpet: Judgment on the Sea and Marine Life","Section 6 (vv. 10-11): The Third Trumpet: Judgment on Freshwaters","Section 7 (v. 12): The Fourth Trumpet: Judgment on Celestial Bodies","Section 8 (v. 13): The Angel''s Proclamation of Three Woes to Come"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 13 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And when he had opened the seventh seal, there was silence in heaven about the space of half an hour.',
   'Καὶ ὅτε ἤνοιξεν τὴν σφραγῖδα τὴν ἑβδόμην, ἐγένετο σιγὴ ἐν τῷ οὐρανῷ ὡς ἡμιώριον.',
   'Kai hote ēnoixen tēn sphragida tēn hebdomēn, egeneto sigē en tō ouranō hōs hēmiōrion.',
   'The opening of the seventh seal does not immediately unleash a new series of judgments but introduces a profound ''silence in heaven'' for about ''half an hour.'' This dramatic pause intensifies the anticipation of what is to come, serving as a solemn interlude before the trumpet judgments. It may symbolize a moment of divine contemplation, a period of awe before God''s ultimate justice, or a brief cessation of heavenly praise in solemn expectation. Some scholars connect this silence to Zephaniah 1:7, ''Hold thy peace at the presence of the Lord GOD: for the day of the LORD is at hand.''',
   'The ''silence in heaven'' underscores the gravity and solemnity of God''s impending judgments. It suggests that even the heavenly hosts are awestruck and reverent before the unfolding of God''s righteous wrath, emphasizing the holiness and absolute sovereignty of God as He prepares to execute His final decrees upon the earth.'),
  (2,
   'And I saw the seven angels which stood before God; and to them were given seven trumpets.',
   'Καὶ εἶδον τοὺς ἑπτὰ ἀγγέλους οἳ ἐνώπιον τοῦ Θεοῦ ἑστήκασιν, καὶ ἐδόθησαν αὐτοῖς ἑπτὰ σάλπιγγες.',
   'Kai eidon tous hepta angelous hoi enōpion tou Theou hestēkasin, kai edothēsan autois hepta salpinges.',
   'John sees ''seven angels'' standing ''before God,'' a position of high honor and service, reminiscent of the seven archangels in Jewish tradition (e.g., Tobit 12:15). These angels are entrusted with ''seven trumpets,'' instruments commonly associated with divine pronouncements, warnings, and war in the Old Testament (e.g., Josh 6:4; Joel 2:1). The giving of the trumpets signifies the divine mandate for the next series of judgments, indicating that these events are directly orchestrated by God.',
   'The commissioning of the seven angels with trumpets highlights God''s use of angelic beings as agents in the execution of His divine will and judgment. It reinforces the biblical truth that God is actively involved in the affairs of humanity and creation, orchestrating events according to His sovereign plan, often through unseen spiritual forces.'),
  (3,
   'And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.',
   'Καὶ ἄλλος ἄγγελος ἦλθεν καὶ ἔστη ἐπὶ τὸ θυσιαστήριον, ἔχων λιβανωτὸν χρυσοῦν· καὶ ἐδόθη αὐτῷ θυμιάματα πολλὰ, ἵνα δώσῃ ταῖς προσευχαῖς τῶν ἁγίων πάντων ἐπὶ τὸ θυσιαστήριον τὸ χρυσοῦν τὸ ἐνώπιον τοῦ θρόνου.',
   'Kai allos angelos ēlthen kai estē epi to thysiastērion, echōn libanōton chrysoun; kai edothē autō thymiamata polla, hina dōsē tais proseuchais tōn hagiōn pantōn epi to thysiastērion to chrysoun to enōpion tou thronou.',
   'This ''another angel'' (distinct from the seven with trumpets) stands at the ''golden altar'' with a ''golden censer.'' The ''much incense'' given to him is explicitly linked to ''the prayers of all saints.'' This scene beautifully illustrates the intercessory role of Christ (often understood as the ''another angel'' or represented by this angelic action) and the efficacy of believers'' prayers. The smoke of the incense ascending with the prayers symbolizes their acceptance and pleasing aroma before God (Ps 141:2).',
   'This verse profoundly illustrates the power and significance of the prayers of God''s people. It shows that the prayers of the saints are not forgotten but are gathered and presented before God, ascending as a pleasing aroma. This act of divine reception underscores God''s attentiveness to His people''s cries and suggests that these prayers play a role in the unfolding of His redemptive and judgmental purposes.'),
  (4,
   'And the smoke of the incense, which came with the prayers of the saints, ascended up before God out of the angel’s hand.',
   'Καὶ ἀνέβη ὁ καπνὸς τοῦ θυμιάματος ταῖς προσευχαῖς τῶν ἁγίων ἐκ χειρὸς τοῦ ἀγγέλου ἐνώπιον τοῦ Θεοῦ.',
   'Kai anebē ho kapnos tou thymiāmatos tais proseuchais tōn hagiōn ek cheiros tou angelou enōpion tou Theou.',
   'The ''smoke of the incense'' rising ''with the prayers of the saints'' before God signifies their acceptance and efficacy. This imagery draws heavily from Old Testament temple worship, where incense was offered daily (Exod 30:7-8) and symbolized prayer (Ps 141:2). The ascending smoke represents the prayers reaching God''s presence, indicating that God hears and responds to the petitions of His people, even amidst impending judgment.',
   NULL),
  (5,
   'And the angel took the censer, and filled it with fire of the altar, and cast it into the earth: and there were voices, and thunderings, and lightnings, and an earthquake.',
   'Καὶ εἴληφεν ὁ ἄγγελος τὸν λιβανωτόν, καὶ ἐγέμισεν αὐτὸν ἐκ τοῦ πυρὸς τοῦ θυσιαστηρίου, καὶ ἔβαλεν εἰς τὴν γῆν· καὶ ἐγένοντο φωναὶ καὶ βρονταὶ καὶ ἀστραπαὶ καὶ σεισμός.',
   'Kai eilēphen ho angelos ton libanōton, kai egemisen auton ek tou pyros tou thysiastēriou, kai ebalen eis tēn gēn; kai egenonto phōnai kai brontai kai astrapai kai seismos.',
   'After presenting the prayers, the angel fills the censer with ''fire from the altar'' and ''casts it into the earth.'' This act symbolizes that the prayers of the saints, particularly those crying out for justice (Rev 6:10), are answered not only with comfort but also with divine judgment. The resulting ''voices, and thunderings, and lightnings, and an earthquake'' are classic biblical manifestations of God''s presence and impending judgment, often preceding significant divine intervention (Exod 19:16; Rev 4:5; 11:19).',
   'This dramatic scene reveals that divine judgment is not arbitrary but is often a response to the prayers of God''s people for justice and righteousness. The fire from the altar, cast upon the earth, signifies that the same altar where prayers are offered also becomes the source of God''s righteous wrath, demonstrating His holiness and His commitment to ultimately right all wrongs.'),
  (6,
   'And the seven angels which had the seven trumpets prepared themselves to sound.',
   'Καὶ οἱ ἑπτὰ ἄγγελοι οἱ ἔχοντες τὰς ἑπτὰ σάλπιγγας ἡτοίμασαν ἑαυτοὺς ἵνα σαλπίσωσιν.',
   'Kai hoi hepta angeloi hoi echontes tas hepta salpingas hētoimasan heautous hina salpisōsin.',
   'Following the dramatic prelude of the censer being cast to earth, the ''seven angels'' who had received the trumpets ''prepared themselves to sound.'' This brief, transitional verse heightens the tension and anticipation, signaling the imminent commencement of the trumpet judgments. The preparation underscores the deliberate and ordered nature of God''s judgments, which are not random but part of a carefully orchestrated divine plan.',
   NULL),
  (7,
   'The first angel sounded, and there followed hail and fire mingled with blood, and they were cast upon the earth: and the third part of trees was burnt up, and all green grass was burnt up.',
   'Καὶ ὁ πρῶτος ἄγγελος ἐσάλπισεν, καὶ ἐγένετο χάλαζα καὶ πῦρ μεμιγμένα ἐν αἵματι, καὶ ἐβλήθη εἰς τὴν γῆν· καὶ τὸ τρίτον τῶν δένδρων κατεκάη, καὶ πᾶς χόρτος χλωρὸς κατεκάη.',
   'Kai ho prōtos angelos esalpisen, kai egeneto chalaza kai pyr memigmena en haimati, kai eblēthē eis tēn gēn; kai to triton tōn dendrōn katekaē, kai pas chortos chlōros katekaē.',
   'The ''first angel sounded,'' unleashing ''hail and fire mingled with blood'' upon the earth. This judgment recalls the plagues of Egypt (Exod 9:23-24), specifically the plague of hail, but with the added element of ''blood,'' signifying death and destruction. The judgment is partial, affecting ''the third part of trees'' and ''all green grass.'' This partiality suggests that these trumpet judgments are warnings, designed to prompt repentance, rather than the final, complete destruction.',
   'The initial trumpet judgment, targeting the earth''s vegetation, demonstrates God''s power over creation and His willingness to use natural phenomena as instruments of judgment. The ''third part'' destruction signifies a severe but not total judgment, serving as a divine warning and a call to repentance for those who witness or experience its effects.'),
  (8,
   'And the second angel sounded, and as it were a great mountain burning with fire was cast into the sea: and the third part of the sea became blood;',
   'Καὶ ὁ δεύτερος ἄγγελος ἐσάλπισεν, καὶ ὡς ὄρος μέγα πυρὶ καιόμενον ἐβλήθη εἰς τὴν θάλασσαν· καὶ ἐγένετο τὸ τρίτον τῆς θαλάσσης αἷμα.',
   'Kai ho deuteros angelos esalpisen, kai hōs oros mega pyri kaiomenon eblēthē eis tēn thalassan; kai egeneto to triton tēs thalassēs haima.',
   'The ''second angel sounded,'' and ''as it were a great mountain burning with fire was cast into the sea.'' This imagery evokes catastrophic events, possibly a meteor or volcanic eruption, causing immense destruction. The result is that ''the third part of the sea became blood,'' reminiscent of the first Egyptian plague (Exod 7:20-21). This judgment targets the sea, a vital source of life and commerce, indicating widespread ecological and economic disruption.',
   NULL),
  (9,
   'And the third part of the creatures which were in the sea, and had life, died; and the third part of the ships were destroyed.',
   'Καὶ ἀπέθανε τὸ τρίτον τῶν κτισμάτων τῶν ἐν τῇ θαλάσσῃ, τὰ ἔχοντα ψυχάς, καὶ τὸ τρίτον τῶν πλοίων διεφθάρη.',
   'Kai apethane to triton tōn ktismatōn tōn en tē thalassē, ta echonta psychas, kai to triton tōn ploiōn diephtharē.',
   'As a direct consequence of the second trumpet judgment, ''the third part of the creatures which were in the sea, and had life, died,'' and ''the third part of the ships were destroyed.'' This highlights the devastating impact on marine life and global commerce. The destruction of ships would cripple trade and travel, further isolating and punishing the inhabitants of the earth. The judgment affects both living creatures and human enterprise, demonstrating the far-reaching consequences of divine wrath.',
   'This judgment demonstrates God''s authority over all aspects of creation, including the vast oceans and human endeavors. The destruction of marine life and ships serves as a powerful warning against humanity''s exploitation of creation and its reliance on worldly systems, signaling that God can disrupt the very foundations of human prosperity and existence.'),
  (10,
   'And the third angel sounded, and there fell a great star from heaven, burning as it were a lamp, and it fell upon the third part of the rivers, and upon the fountains of waters;',
   'Καὶ ὁ τρίτος ἄγγελος ἐσάλπισεν, καὶ ἔπεσεν ἐκ τοῦ οὐρανοῦ ἀστὴρ μέγας καιόμενος ὡς λαμπάς, καὶ ἔπεσεν ἐπὶ τὸ τρίτον τῶν ποταμῶν καὶ ἐπὶ τὰς πηγὰς τῶν ὑδάτων.',
   'Kai ho tritos angelos esalpisen, kai epesen ek tou ouranou astēr megas kaiomenos hōs lampas, kai epesen epi to triton tōn potamōn kai epi tas pēgas tōn hydatōn.',
   'The ''third angel sounded,'' and ''a great star from heaven, burning as it were a lamp,'' fell upon ''the third part of the rivers, and upon the fountains of waters.'' This imagery suggests a celestial object, perhaps a comet or meteor, impacting the earth''s freshwater sources. The contamination of fresh water would have immediate and severe consequences for human and animal life, as these are essential for survival.',
   NULL),
  (11,
   'And the name of the star is called Wormwood: and the third part of the waters became wormwood; and many men died of the waters, because they were made bitter.',
   'Καὶ τὸ ὄνομα τοῦ ἀστέρος λέγεται ὁ Ἄψινθος· καὶ ἐγένετο τὸ τρίτον τῶν ὑδάτων εἰς ἄψινθον, καὶ πολλοὶ τῶν ἀνθρώπων ἀπέθανον ἐκ τῶν ὑδάτων, ὅτι ἐπικράνθησαν.',
   'Kai to onoma tou asteros legetai ho Apsinthos; kai egeneto to triton tōn hydatōn eis apsinthon, kai polloi tōn anthrōpōn apethanon ek tōn hydatōn, hoti epikranthēsan.',
   'The fallen star is named ''Wormwood'' (Ἄψινθος, Apsinthos), a bitter herb known for its poisonous properties. Consequently, ''the third part of the waters became wormwood,'' making them ''bitter'' and causing ''many men died of the waters.'' This judgment directly impacts human health and survival, highlighting the vulnerability of life to environmental catastrophe. The bitterness of wormwood often symbolizes divine judgment and sorrow in the Old Testament (Jer 9:15; Lam 3:15, 19).',
   'The ''Wormwood'' judgment on freshwaters signifies God''s judgment directly impacting human life and sustenance. It serves as a stark reminder that life itself is dependent on God''s provision and that His judgments can turn the very sources of life into instruments of death, emphasizing the severity of sin and the consequences of rejecting divine grace.'),
  (12,
   'And the fourth angel sounded, and the third part of the sun was smitten, and the third part of the moon, and the third part of the stars; so as the third part of them was darkened, and the day shone not for a third part of it, and the night likewise.',
   'Καὶ ὁ τέταρτος ἄγγελος ἐσάλπισεν, καὶ ἐπλήγη τὸ τρίτον τοῦ ἡλίου καὶ τὸ τρίτον τῆς σελήνης καὶ τὸ τρίτον τῶν ἀστέρων, ἵνα σκοτισθῇ τὸ τρίτον αὐτῶν, καὶ ἡ ἡμέρα μὴ φάνῃ τὸ τρίτον αὐτῆς, καὶ ἡ νὺξ ὁμοίως.',
   'Kai ho tetartos angelos esalpisen, kai eplēgē to triton tou hēliou kai to triton tēs selēnēs kai to triton tōn asterōn, hina skotisthē to triton autōn, kai hē hēmera mē phanē to triton autēs, kai hē nyx homoiōs.',
   'The ''fourth angel sounded,'' striking ''the third part of the sun, and the third part of the moon, and the third part of the stars.'' This results in a darkening of these celestial bodies, so that ''the day shone not for a third part of it, and the night likewise.'' This judgment affects the very fabric of time and light, disrupting the natural order established at creation (Gen 1:14-18). It echoes the ninth Egyptian plague of darkness (Exod 10:21-23) and prophetic warnings of cosmic disturbances (Isa 13:10; Joel 2:31).',
   'This cosmic judgment on the celestial bodies demonstrates God''s ultimate control over creation and His ability to disrupt the natural order. The partial darkening of the sun, moon, and stars serves as a profound sign of impending greater darkness, both literal and spiritual, signaling the approach of the Day of the Lord and the increasing severity of God''s wrath against unrepentant humanity.'),
  (13,
   'And I beheld, and heard an angel flying through the midst of heaven, saying with a loud voice, Woe, woe, woe, to the inhabiters of the earth by reason of the other voices of the trumpet of the three angels, which are yet to sound!',
   'Καὶ εἶδον, καὶ ἤκουσα ἑνὸς ἀγγέλου πετομένου ἐν μεσουρανήματι, λέγοντος ἐν φωνῇ μεγάλῃ· Οὐαὶ, οὐαὶ, οὐαὶ, τοὺς κατοικοῦντας ἐπὶ τῆς γῆς ἐκ τῶν λοιπῶν φωνῶν τῆς σάλπιγγος τῶν τριῶν ἀγγέλων τῶν μελλόντων σαλπίζειν.',
   'Kai eidon, kai ēkousa henos angelou petomenou en mesouranēmati, legontos en phōnē megalē; Ouai, ouai, ouai, tous katoikountas epi tēs gēs ek tōn loipōn phōnōn tēs salpingos tōn triōn angelōn tōn mellontōn salpizein.',
   'This verse serves as an interlude before the final three trumpet judgments. John sees and hears ''an angel flying through the midst of heaven,'' proclaiming ''Woe, woe, woe'' to the ''inhabiters of the earth.'' The triple ''woe'' emphasizes the extreme severity and escalating nature of the judgments yet to come, indicating that the remaining three trumpets will bring even greater suffering and devastation than the first four. This angel acts as a herald, warning humanity of the impending, intensified divine wrath.',
   'The ''Woe, woe, woe'' proclamation underscores the escalating nature of God''s judgment and His persistent warning to humanity. It highlights divine justice, where increasing rebellion is met with increasing severity of judgment, yet even in warning, there is an implicit call to repentance before the full measure of God''s wrath is poured out.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 8;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σφραγῖδα', 'sphragida', 'G4973', 'From ''σφραγίς'' (sphragis), meaning ''a seal.'' In ancient times, a seal was used to authenticate documents, signify ownership, or secure something. In Revelation, the seals represent divine decrees and judgments, progressively revealing God''s plan for the end times. The seventh seal marks the culmination of one series of judgments and the transition to another, signifying the unfolding of God''s sovereign will.', 1),
  ('σιγὴ', 'sigē', 'G4602', 'Meaning ''silence,'' ''stillness.'' This word denotes a profound quietness, a cessation of sound. In the context of Revelation 8:1, it signifies a dramatic, awe-inspiring pause in the heavenly activity, emphasizing the solemnity and gravity of the events about to unfold. It is a moment of intense anticipation before the next phase of divine judgment.', 2),
  ('ἡμιώριον', 'hēmiōrion', 'G2256', 'A compound of ''ἥμισυς'' (hēmisys, ''half'') and ''ὥρα'' (hōra, ''hour''), meaning ''half an hour.'' This specific temporal duration, though brief, emphasizes the deliberate and measured nature of God''s actions. It signifies a distinct, albeit short, period of cessation, highlighting the intentionality behind the heavenly silence before the trumpet judgments commence.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 1;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄγγελος', 'angelos', 'G32', 'Meaning ''messenger'' or ''angel.'' In biblical contexts, angels are spiritual beings who serve as God''s agents, delivering messages, executing judgments, and ministering to believers. Here, ''another angel'' performs a crucial liturgical act, presenting the prayers of the saints, underscoring the divine orchestration of events and the spiritual realm''s interaction with human petitions.', 1),
  ('θυσιαστήριον', 'thysiastērion', 'G2379', 'Meaning ''altar,'' a place of sacrifice or offering. In Revelation, the ''golden altar'' is in heaven, before God''s throne, and is associated with incense and the prayers of the saints. It signifies a place of divine communion and intercession, where the petitions of believers are presented and accepted by God, influencing the unfolding of His divine plan.', 2),
  ('λιβανωτὸν', 'libanōton', 'G3031', 'From ''λιβανωτός'' (libanōtos), meaning ''a censer'' or ''incense holder.'' This vessel was used in temple worship to burn incense. In Revelation, the golden censer is used to offer incense with the prayers of the saints, symbolizing the acceptable and fragrant nature of these prayers before God, and later, to cast fire upon the earth as a prelude to judgment.', 3),
  ('προσευχαῖς', 'proseuchais', 'G4335', 'From ''προσευχή'' (proseuchē), meaning ''prayer.'' This word refers to an act of worship or supplication directed to God. In this context, it specifically refers to ''the prayers of all saints,'' highlighting the collective intercession of believers. The presentation of these prayers with incense signifies their power and efficacy in the heavenly court, influencing divine action.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 3;

-- Verse 5
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πυρὸς', 'pyros', 'G4442', 'From ''πῦρ'' (pyr), meaning ''fire.'' In Scripture, fire often symbolizes God''s presence, purification, and judgment. Here, ''fire of the altar'' is cast upon the earth, signifying that the same altar where prayers are offered also becomes the source of divine wrath. It represents the active, consuming power of God''s justice unleashed upon a rebellious world.', 1),
  ('ἔβαλεν', 'ebalen', 'G906', 'Aorist active indicative of ''βάλλω'' (ballō), meaning ''to cast, throw, or hurl.'' The angel''s action of ''casting'' the fire from the censer into the earth is a decisive and forceful act. It signifies the direct and intentional initiation of God''s judgments, demonstrating His sovereign power to unleash destruction upon the earth in response to sin and the prayers of His saints.', 2),
  ('σεισμός', 'seismos', 'G4578', 'Meaning ''an earthquake'' or ''a shaking.'' In biblical prophecy, earthquakes are frequently associated with divine intervention, judgment, and the shaking of established orders (e.g., Hag 2:6-7; Heb 12:26). Here, it is one of the immediate physical manifestations accompanying the casting of fire to the earth, signaling a profound disruption and the commencement of God''s active judgment.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 5;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('χάλαζα', 'chalaza', 'G5464', 'Meaning ''hail.'' In the Bible, hail is often depicted as an instrument of divine judgment, particularly in the plagues of Egypt (Exod 9:23-24) and in prophetic warnings (Isa 28:17; Ezek 13:11). Its appearance ''mingled with blood'' in Revelation signifies a destructive force causing death and devastation, targeting the earth''s vegetation as the first trumpet judgment.', 1),
  ('αἵματι', 'haimati', 'G129', 'From ''αἷμα'' (haima), meaning ''blood.'' In this context, ''mingled with blood'' signifies death, violence, and destruction. It suggests that the hail and fire are not merely natural phenomena but carry a deadly, life-ending quality, indicating the severity of the judgment and its impact on living things, especially the vegetation of the earth.', 2),
  ('τρίτον', 'triton', 'G5154', 'Meaning ''a third part.'' The repeated use of ''a third part'' throughout the trumpet judgments signifies a severe but partial destruction. It suggests that these judgments are not yet the final, complete outpouring of God''s wrath but serve as warnings, allowing for a period of repentance before the ultimate and total devastation of the later judgments.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 7;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἄψινθος', 'Apsinthos', 'G888', 'Meaning ''wormwood,'' a plant known for its extreme bitterness and often associated with poison. In the Old Testament, wormwood symbolizes bitterness, sorrow, and divine judgment (Jer 9:15; Lam 3:15). Here, the star named Wormwood contaminates fresh waters, causing death, signifying a judgment that brings profound suffering and bitterness to human life.', 1),
  ('ὕδατων', 'hydatōn', 'G5204', 'From ''ὕδωρ'' (hydōr), meaning ''water.'' In this verse, it refers specifically to ''the rivers and the fountains of waters,'' the sources of fresh water essential for life. The contamination of these waters by Wormwood signifies a direct attack on human sustenance, leading to widespread death and highlighting the vulnerability of life to divine judgment.', 2),
  ('ἐπικράνθησαν', 'epikranthēsan', 'G4087', 'From ''πικραίνω'' (pikrainō), meaning ''to make bitter'' or ''to embitter.'' The passive voice here indicates that the waters ''were made bitter.'' This bitterness is not merely a taste but a symbol of the deadly and destructive nature of the judgment, causing physical death and spiritual anguish. It underscores the severity of God''s wrath when it impacts the very sources of life.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 11;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπλήγη', 'eplēgē', 'G4141', 'Aorist passive indicative of ''πλήσσω'' (plēssō), meaning ''to strike, smite, or wound.'' In this context, it signifies that the sun, moon, and stars ''were struck'' or ''smitten'' by divine judgment. This action indicates a direct and forceful intervention by God, causing a disruption in the natural order of the cosmos and signaling a profound cosmic disturbance.', 1),
  ('σκοτισθῇ', 'skotisthē', 'G4654', 'From ''σκοτίζω'' (skotizō), meaning ''to darken'' or ''to obscure.'' The passive voice indicates that the celestial bodies ''were darkened.'' This darkening is a direct consequence of being struck, resulting in a reduction of light on earth. It symbolizes a period of distress, judgment, and the withdrawal of divine favor, echoing Old Testament prophecies of cosmic signs preceding the Day of the Lord.', 2),
  ('ἡμέρα', 'hēmera', 'G2250', 'Meaning ''day.'' In this context, it refers to the period of daylight. The judgment causes ''the day [to] not shine for a third part of it,'' indicating a significant reduction in the duration or intensity of daylight. This disruption of the natural cycle of day and night underscores the severity of the cosmic judgment and its impact on human life and perception of time.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 12;

-- Verse 13
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πετομένου', 'petomenou', 'G4072', 'Present middle participle of ''πέτομαι'' (petomai), meaning ''to fly.'' The description of the angel ''flying through the midst of heaven'' emphasizes its swiftness and the public nature of its proclamation. This angel acts as a herald, ensuring that its message of impending woes is heard universally, underscoring the divine intention to warn humanity before further judgments.', 1),
  ('Οὐαὶ', 'Ouai', 'G3759', 'An interjection meaning ''Woe!'' or ''Alas!'' The triple repetition of ''Woe, woe, woe'' signifies an intensified and severe pronouncement of impending judgment and suffering. It serves as a solemn warning, indicating that the remaining three trumpet judgments will bring even greater devastation and misery than the preceding four, emphasizing the gravity of God''s wrath.', 2),
  ('κατοικοῦντας', 'katoikountas', 'G2730', 'Present active participle of ''κατοικέω'' (katoikeō), meaning ''to dwell, inhabit.'' Here, it refers to ''the inhabiters of the earth,'' specifically those who are unrepentant and worldly-minded, whose focus is on earthly life rather than God. The woes are directed at them, highlighting their spiritual condition and their vulnerability to divine judgment, contrasting with the saints who are citizens of heaven.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = 13;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Zephaniah 1:7', 1),
  (1, 'Habakkuk 2:20', 2),
  (1, 'Revelation 6:17', 3),
  (1, 'Psalm 76:8-9', 4),
  (2, 'Luke 1:19', 1),
  (2, 'Revelation 1:4', 2),
  (2, 'Numbers 10:1-10', 3),
  (2, 'Joel 2:1', 4),
  (3, 'Exodus 30:1-8', 1),
  (3, 'Psalm 141:2', 2),
  (3, 'Revelation 5:8', 3),
  (3, 'Hebrews 9:4', 4),
  (4, 'Psalm 141:2', 1),
  (4, 'Revelation 5:8', 2),
  (4, 'Exodus 30:7-8', 3),
  (4, 'Malachi 1:11', 4),
  (5, 'Leviticus 16:12', 1),
  (5, 'Exodus 19:16-18', 2),
  (5, 'Revelation 4:5', 3),
  (5, 'Revelation 11:19', 4),
  (5, 'Ezekiel 10:2', 5),
  (7, 'Exodus 9:23-25', 1),
  (7, 'Ezekiel 38:22', 2),
  (7, 'Revelation 9:4', 3),
  (7, 'Isaiah 28:2', 4),
  (8, 'Exodus 7:19-21', 1),
  (8, 'Jeremiah 51:25', 2),
  (8, 'Amos 7:4', 3),
  (8, 'Matthew 11:23', 4),
  (9, 'Ezekiel 26:17-19', 1),
  (9, 'Isaiah 2:16', 2),
  (9, 'Psalm 104:25-26', 3),
  (10, 'Isaiah 14:12', 1),
  (10, 'Jeremiah 9:15', 2),
  (10, 'Deuteronomy 29:18', 3),
  (10, 'Revelation 16:4', 4),
  (11, 'Jeremiah 9:15', 1),
  (11, 'Lamentations 3:15, 19', 2),
  (11, 'Exodus 15:23', 3),
  (11, 'Proverbs 5:4', 4),
  (12, 'Exodus 10:21-23', 1),
  (12, 'Isaiah 13:10', 2),
  (12, 'Joel 2:31', 3),
  (12, 'Matthew 24:29', 4),
  (12, 'Acts 2:20', 5),
  (13, 'Revelation 9:12', 1),
  (13, 'Revelation 11:14', 2),
  (13, 'Revelation 12:12', 3),
  (13, 'Isaiah 6:3', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 8 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 8 Complete!
-- 13 verses · 7 key verses with word studies (22 words)
-- Cross-references for 12 verses (49 refs)
-- ═══════════════════════════════════════════════════════