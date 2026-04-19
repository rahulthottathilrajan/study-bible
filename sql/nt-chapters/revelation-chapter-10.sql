-- ═══════════════════════════════════════════════════════
-- REVELATION CHAPTER 10 — The Mighty Angel, the Little Book, and John's Renewed Prophetic Commission
-- 11 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 10,
  'Revelation 10 serves as an interlude between the sixth and seventh trumpet judgments, focusing on a powerful angelic figure and John''s renewed prophetic commission. The chapter introduces a ''mighty angel'' whose appearance is reminiscent of Christ, holding a ''little book'' (βιβλαρίδιον) open. This angel''s declaration that ''there should be time no longer'' (v.6) signifies the imminent fulfillment of God''s redemptive plan, particularly the ''mystery of God'' (μυστήριον τοῦ Θεοῦ). John is commanded to eat the little book, a symbolic act representing the assimilation of God''s word, which proves sweet in the mouth but bitter in the stomach, illustrating the dual nature of prophetic ministry—the joy of receiving divine revelation and the pain of proclaiming its often-harsh truths. The chapter culminates in John''s mandate to ''prophesy again'' to a global audience, setting the stage for the final judgments and the ultimate establishment of God''s kingdom.',
  'The Mighty Angel, the Little Book, and John''s Renewed Prophetic Commission',
  'μυστήριον (mystērion)',
  'Derived from ''myō'' (to shut the mouth), ''mystērion'' refers to a secret or hidden thing, especially a divine secret previously concealed but now revealed. In Revelation 10:7, it signifies God''s ultimate plan of salvation and judgment, which is about to be brought to completion, as declared to the prophets of old (cf. Rom 16:25-26; Eph 3:3-6).',
  '["Section 1 (vv.1-2): The Appearance of the Mighty Angel with the Open Book","Section 2 (vv.3-4): The Seven Thunders and the Command to Seal Their Utterances","Section 3 (vv.5-7): The Angel''s Oath and the Declaration of No More Delay","Section 4 (vv.8-10): John''s Commission to Take and Eat the Little Book","Section 5 (v.11): The Renewed Prophetic Mandate for John"]'
FROM books b WHERE b.name = 'Revelation';

-- Step 2: Insert all 11 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:',
   'Καὶ εἶδον ἄλλον ἄγγελον ἰσχυρὸν καταβαίνοντα ἐκ τοῦ οὐρανοῦ, περιβεβλημένον νεφέλην, καὶ ἡ ἶρις ἐπὶ τὴν κεφαλὴν αὐτοῦ, καὶ τὸ πρόσωπον αὐτοῦ ὡς ὁ ἥλιος, καὶ οἱ πόδες αὐτοῦ ὡς στύλοι πυρός,',
   'Kai eidon allon angelon ischyron katabainonta ek tou ouranou, peribebleménon nephelēn, kai hē iris epi tēn kephalēn autou, kai to prosōpon autou hōs ho hēlios, kai hoi podes autou hōs styloi pyros,',
   'This verse introduces a ''mighty angel'' (ἄγγελον ἰσχυρὸν), whose description is highly symbolic and evokes divine attributes, leading some scholars to identify him with Christ Himself (cf. Rev 1:13-16) or a high-ranking angel representing God''s authority. His clothing with a cloud, a rainbow on his head, a face like the sun, and feet like pillars of fire all parallel descriptions of God''s glory and presence in the Old Testament (e.g., Exod 13:21; Ezek 1:28; Dan 10:6). The rainbow, specifically, recalls God''s covenant faithfulness (Gen 9:13-16). This powerful imagery underscores the immense authority behind the message he is about to deliver.',
   'The imagery of the mighty angel, particularly his divine attributes, highlights the transcendent power and authority inherent in God''s messengers and, ultimately, in God Himself. It foreshadows the ultimate triumph of divine justice and the fulfillment of God''s covenant promises, assuring believers of His unwavering faithfulness amidst unfolding judgments.'),
  (2,
   'And he had in his hand a little book open: and he set his right foot upon the sea, and his left foot on the earth,',
   'καὶ ἔχων ἐν τῇ χειρὶ αὐτοῦ βιβλαρίδιον ἠνεῳγμένον. καὶ ἔθηκεν τὸν πόδα αὐτοῦ τὸν δεξιὸν ἐπὶ τῆς θαλάσσης, τὸν δὲ εὐώνυμον ἐπὶ τῆς γῆς,',
   'kai echōn en tē cheiri autou biblaridion ēneōgmenon. kai ethēken ton poda autou ton dexion epi tēs thalassēs, ton de euōnymon epi tēs gēs,',
   'The angel holds a ''little book'' (βιβλαρίδιον), a diminutive of ''biblion'' (scroll), which is ''open'' (ἠνεῳγμένον), indicating its contents are ready to be revealed, unlike the sealed scroll of Revelation 5. His stance—one foot on the sea and one on the earth—symbolizes his universal authority over all creation, both land and sea (cf. Ps 8:6; Zech 14:9). This posture signifies that the message he carries pertains to the entire world and that God''s dominion extends over all realms, preparing the way for the universal proclamation of the gospel and the final judgments.',
   NULL),
  (3,
   'And cried with a loud voice, as when a lion roareth: and when he had cried, seven thunders uttered their voices.',
   'καὶ ἔκραξεν φωνῇ μεγάλῃ ὥσπερ λέων μυκᾶται. καὶ ὅτε ἔκραξεν, ἐλάλησαν αἱ ἑπτὰ βρονταὶ τὰς ἑαυτῶν φωνάς.',
   'kai ekraxen phōnē megalē hōsper leōn mykātai. kai hote ekraxen, elalēsan hai hepta brontai tas heautōn phōnas.',
   'The angel''s cry ''with a loud voice, as when a lion roareth'' (ὥσπερ λέων μυκᾶται) signifies a powerful, authoritative, and terrifying proclamation, often associated with divine judgment (cf. Amos 1:2; 3:8). Immediately following this cry, ''seven thunders uttered their voices.'' The number seven here, as throughout Revelation, denotes completeness. These thunders likely represent divine pronouncements or judgments, the specific content of which remains undisclosed, adding to the mystery and awe of God''s unfolding plan.',
   NULL),
  (4,
   'And when the seven thunders had uttered their voices, I was about to write: and I heard a voice from heaven saying unto me, Seal up those things which the seven thunders uttered, and write them not.',
   'Καὶ ὅτε ἐλάλησαν αἱ ἑπτὰ βρονταὶ τὰς ἑαυτῶν φωνάς, ἤμελλον γράφειν· καὶ ἤκουσα φωνὴν ἐκ τοῦ οὐρανοῦ λέγουσαν, Σφράγισον ἃ ἐλάλησαν αἱ ἑπτὰ βρονταί, καὶ μὴ αὐτὰ γράψῃς.',
   'Kai hote elalēsan hai hepta brontai tas heautōn phōnas, ēmellon graphein; kai ēkousa phōnēn ek tou ouranou legousan, Sphragison ha elalēsan hai hepta brontai, kai mē auta grapsēis.',
   'John is about to record the utterances of the seven thunders, but a voice from heaven commands him to ''Seal up those things... and write them not.'' This is a unique instance in Revelation where John is explicitly forbidden from revealing a divine message (cf. Dan 8:26; 12:4, 9). This sealing emphasizes that not all divine revelations are meant for human understanding or immediate disclosure. It underscores God''s sovereignty over the timing and content of His revelation, reminding us that some aspects of His plan remain hidden until His appointed time.',
   'The sealing of the seven thunders'' message highlights the concept of divine hiddenness and God''s sovereign control over revelation. It teaches that while God reveals much of His plan, some aspects remain veiled, requiring faith and trust in His ultimate wisdom and timing. This serves as a theological reminder that human understanding is finite, and God''s ways are often beyond full comprehension.'),
  (5,
   'And the angel which I saw stand upon the sea and upon the earth lifted up his hand to heaven,',
   'Καὶ ὁ ἄγγελος, ὃν εἶδον ἑστῶτα ἐπὶ τῆς θαλάσσης καὶ ἐπὶ τῆς γῆς, ἦρεν τὴν χεῖρα αὐτοῦ τὴν δεξιὰν εἰς τὸν οὐρανόν,',
   'Kai ho angelos, hon eidon hestōta epi tēs thalassēs kai epi tēs gēs, ēren tēn cheira autou tēn dexian eis ton ouranon,',
   'The angel, still standing with universal authority, lifts his right hand to heaven. This gesture is a common posture for taking an oath, signifying a solemn declaration made in the presence of God (cf. Gen 14:22; Deut 32:40; Dan 12:7). The act prepares the audience for a profoundly significant statement, emphasizing the absolute truth and certainty of what is about to be proclaimed. It underscores the gravity of the angel''s message regarding the end of delay and the culmination of God''s mystery.',
   NULL),
  (6,
   'And sware by him that liveth for ever and ever, who created heaven, and the things that therein are, and the earth, and the things that therein are, and the sea, and the things which are therein, that there should be time no longer:',
   'καὶ ὤμοσεν ἐν τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων, ὃς ἔκτισεν τὸν οὐρανὸν καὶ τὰ ἐν αὐτῷ καὶ τὴν γῆν καὶ τὰ ἐν αὐτῇ καὶ τὴν θάλασσαν καὶ τὰ ἐν αὐτῇ, ὅτι χρόνος οὐκέτι ἔσται·',
   'kai ōmosen en tō zōnti eis tous aiōnas tōn aiōnōn, hos ektisen ton ouranon kai ta en autō kai tēn gēn kai ta en autē kai tēn thalassan kai ta en autē, hoti chronos ouketi estai;',
   'The angel swears by God, ''him that liveth for ever and ever'' (τῷ ζῶντι εἰς τοὺς αἰῶνας τῶν αἰώνων), identifying Him as the Creator of all things (heaven, earth, and sea). This oath by the eternal Creator emphasizes the absolute certainty and divine authority of the declaration that follows: ''there should be time no longer'' (χρόνος οὐκέτι ἔσται). This phrase does not mean the end of all chronological time, but rather that there will be no further delay in the fulfillment of God''s prophetic plan, particularly the events leading up to the seventh trumpet. The period of waiting is over, and God''s final judgments are imminent.',
   'The angel''s oath by the eternal Creator underscores God''s absolute sovereignty over creation and time. The declaration ''time no longer'' signifies the end of God''s patience and the imminent fulfillment of His eschatological purposes. This affirms the certainty of God''s prophetic word and the ultimate triumph of His divine will, providing both comfort for the faithful and warning for the unrepentant.'),
  (7,
   'But in the days of the voice of the seventh angel, when he shall begin to sound, the mystery of God should be finished, as he hath declared to his servants the prophets.',
   'ἀλλ’ ἐν ταῖς ἡμέραις τῆς φωνῆς τοῦ ἑβδόμου ἀγγέλου, ὅταν μέλλῃ σαλπίζειν, καὶ ἐτελέσθη τὸ μυστήριον τοῦ Θεοῦ, ὡς εὐηγγέλισεν τοὺς ἑαυτοῦ δούλους τοὺς προφήτας.',
   'all'' en tais hēmerais tēs phōnēs tou hebdomou angelou, hotan mellē salpizein, kai etelestē to mystērion tou Theou, hōs euēggelisen tous heautou doulous tous prophētas.',
   'This verse clarifies the timing of the ''no more delay'' declaration: ''in the days of the voice of the seventh angel, when he shall begin to sound.'' At this point, ''the mystery of God'' (τὸ μυστήριον τοῦ Θεοῦ) will be ''finished'' (ἐτελέσθη). This ''mystery'' refers to God''s entire redemptive plan, previously hidden but now revealed through Christ and the prophets (cf. Rom 16:25-26; Eph 3:3-6). Its completion signifies the culmination of God''s purposes for humanity and creation, bringing to an end the long-awaited promises declared to His servants, the prophets.',
   'The ''mystery of God'' being finished with the seventh trumpet signifies the culmination of God''s redemptive plan throughout history. This theological concept emphasizes God''s sovereign control over history, His faithfulness to His prophetic word, and the ultimate triumph of His kingdom. It assures believers that God''s purposes, though sometimes veiled, will be fully realized in His appointed time.'),
  (8,
   'And the voice which I heard from heaven spake unto me again, and said, Go and take the little book which is open in the hand of the angel which standeth upon the sea and upon the earth.',
   'Καὶ ἡ φωνὴ ἣν ἤκουσα ἐκ τοῦ οὐρανοῦ πάλιν λαλοῦσα μετ’ ἐμοῦ καὶ λέγουσα, Ὕπαγε λάβε τὸ βιβλαρίδιον τὸ ἠνεῳγμένον ἐν τῇ χειρὶ τοῦ ἀγγέλου τοῦ ἑστῶτος ἐπὶ τῆς θαλάσσης καὶ ἐπὶ τῆς γῆς.',
   'Kai hē phōnē hēn ēkousa ek tou ouranou palin lalousa met'' emou kai legousa, Hypage labe to biblaridion to ēneōgmenon en tē cheiri tou angelou tou hestōtos epi tēs thalassēs kai epi tēs gēs.',
   'The voice from heaven, which previously commanded John to seal the thunders'' utterances, now instructs him to ''Go and take the little book'' from the mighty angel. This command marks a shift in John''s role from passive observer to active participant in the prophetic drama. The ''little book'' (βιβλαρίδιον) is still ''open'' (ἠνεῳγμένον), signifying its readiness for reception and proclamation. John''s interaction with the angel and the book is a symbolic act of receiving and internalizing God''s message, preparing him for further prophetic ministry.',
   NULL),
  (9,
   'And I went unto the angel, and said unto him, Give me the little book. And he said unto me, Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey.',
   'Καὶ ἀπῆλθον πρὸς τὸν ἄγγελον λέγων αὐτῷ, Δός μοι τὸ βιβλαρίδιον. καὶ λέγει μοι, Λάβε καὶ κατάφαγε αὐτό· καὶ πικρανεῖ σου τὴν κοιλίαν, ἀλλ’ ἐν τῷ στόματί σου ἔσται γλυκὺ ὡς μέλι.',
   'Kai apēlthon pros ton angelon legōn autō, Dos moi to biblaridion. kai legei moi, Labe kai kataphage auto; kai pikranei sou tēn koilian, all'' en tō stomati sou estai glyky hōs meli.',
   'John approaches the angel and requests the book. The angel''s instruction, ''Take it, and eat it up'' (Λάβε καὶ κατάφαγε αὐτό), is a symbolic act of internalizing God''s word, reminiscent of Ezekiel 2:8-3:3, where Ezekiel eats a scroll containing lamentations and woe. The dual effect—''sweet as honey'' in the mouth but ''bitter'' in the belly—represents the complex nature of prophetic ministry. The reception of divine revelation is initially delightful and precious (Ps 119:103), but its proclamation often brings pain, suffering, or the burden of delivering harsh truths of judgment.',
   'The command to eat the scroll, resulting in a sweet taste but bitter outcome, profoundly illustrates the nature of divine revelation and prophetic ministry. It signifies that God''s word is inherently delightful and life-giving, yet its full assimilation and proclamation often involve the painful reality of judgment, suffering, and the cost of obedience. This paradox reflects the dual nature of God''s truth—comforting to the faithful, challenging to the world.'),
  (10,
   'And I took the little book out of the angel’s hand, and ate it up; and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter.',
   'Καὶ ἔλαβον τὸ βιβλαρίδιον ἐκ τῆς χειρὸς τοῦ ἀγγέλου καὶ κατέφαγον αὐτό· καὶ ἦν ἐν τῷ στόματί μου γλυκὺ ὡς μέλι, καὶ ὅτε ἐτελέσθη, ἐπικράνθη ἡ κοιλία μου.',
   'Kai elabon to biblaridion ek tēs cheiros tou angelou kai katephagon auto; kai ēn en tō stomati mou glyky hōs meli, kai hote etelestē, epikranthē hē koilia mou.',
   'John obeys the command, taking and eating the little book. His experience precisely matches the angel''s prophecy: it was ''sweet as honey'' in his mouth, but ''bitter'' in his belly. This immediate fulfillment validates the angel''s words and underscores the reality of the prophetic experience. The sweetness represents the joy and privilege of receiving direct revelation from God, while the bitterness symbolizes the burden, sorrow, or difficulty associated with understanding and proclaiming its contents, especially messages of judgment and suffering for the world.',
   NULL),
  (11,
   'And he said unto me, Thou must prophesy again before many peoples, and nations, and tongues, and kings.',
   'Καὶ λέγουσίν μοι, Δεῖ σε πάλιν προφητεῦσαι ἐπὶ λαοῖς καὶ ἔθνεσιν καὶ γλώσσαις καὶ βασιλεῦσιν πολλοῖς.',
   'Kai legousin moi, Dei se palin prophēteusai epi laois kai ethnesin kai glōssais kai basileusin pollois.',
   'Following the symbolic act of eating the scroll, John receives a renewed and expanded prophetic commission: ''Thou must prophesy again before many peoples, and nations, and tongues, and kings.'' The plural ''they say'' (λέγουσίν) likely refers to the heavenly voice or the angel, signifying divine authority. This mandate emphasizes the universal scope of John''s message, which is not limited to a specific group but is intended for all humanity and their rulers. It prepares John, and by extension the church, for continued witness and proclamation in the face of impending global events.',
   'John''s renewed commission to prophesy to ''many peoples, and nations, and tongues, and kings'' highlights the universal scope of God''s redemptive and judgmental message. It underscores the church''s ongoing mandate to bear witness to Christ and His truth to all humanity, regardless of their status or origin, even amidst persecution and tribulation, until the consummation of all things.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Revelation' AND c.chapter_number = 10;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἰσχυρόν', 'ischyron', 'G2478', 'Meaning ''strong, mighty, powerful.'' It describes the angel''s inherent strength and authority, often used in the Septuagint for divine power. Here, it emphasizes the angel''s significant role and the weight of his message, distinguishing him from ordinary angels and aligning him with figures of divine manifestation.', 1),
  ('νεφέλην', 'nephelēn', 'G3507', 'Meaning ''cloud.'' In biblical contexts, clouds frequently symbolize God''s presence, glory, and judgment (e.g., Exod 13:21; Matt 24:30). The angel ''clothed with a cloud'' indicates his divine association and the mysterious, awe-inspiring nature of his appearance, linking him to theophanic manifestations.', 2),
  ('ἶρις', 'iris', 'G2409', 'Meaning ''rainbow.'' The rainbow is a sign of God''s covenant faithfulness and mercy, first appearing after the flood (Gen 9:13-16). Its presence on the angel''s head signifies that even amidst impending judgment, God''s covenant promises and mercy remain steadfast, offering hope to the faithful.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = 1;

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βιβλαρίδιον', 'biblaridion', 'G975', 'A diminutive of ''biblion'' (scroll), meaning ''a little book'' or ''small scroll.'' Unlike the sealed scroll of Revelation 5, this one is open, indicating its contents are ready for revelation and proclamation. Its small size might suggest a specific, focused message or a portion of God''s larger plan.', 1),
  ('ἠνεῳγμένον', 'ēneōgmenon', 'G455', 'Perfect passive participle of ''anoigō,'' meaning ''opened, unsealed.'' The open state of the little book contrasts with the previously sealed scroll, signifying that its contents are now accessible and ready to be understood and acted upon. It implies a moment of revelation and disclosure.', 2),
  ('θαλάσσης', 'thalassēs', 'G2281', 'Meaning ''sea.'' In apocalyptic literature, the sea can symbolize chaos, the gentile nations, or the realm of evil. The angel''s foot on the sea, along with the earth, signifies his universal authority and dominion over all creation, including the turbulent forces of the world.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = 2;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὤμοσεν', 'ōmosen', 'G3660', 'Aorist active indicative of ''omnyō,'' meaning ''to swear, take an oath.'' This solemn act, performed by the angel in the presence of God, emphasizes the absolute truthfulness and unwavering certainty of the declaration that follows. It underscores the divine authority behind the message.', 1),
  ('ζῶντι', 'zōnti', 'G2198', 'Present active participle of ''zaō,'' meaning ''living, the one who lives.'' Referring to God as ''the one who lives for ever and ever'' emphasizes His eternal, self-existent nature and His unchanging faithfulness. Swearing by Him invokes the highest possible authority and guarantees the truth of the oath.', 2),
  ('ἔκτισεν', 'ektisen', 'G2936', 'Aorist active indicative of ''ktizō,'' meaning ''to create, form, found.'' By swearing by the Creator of heaven, earth, and sea, the angel highlights God''s ultimate sovereignty and power over all things. This reinforces the absolute certainty that His prophetic plan will be fulfilled without delay.', 3),
  ('χρόνος', 'chronos', 'G5550', 'Meaning ''time, period of time.'' The declaration ''chronos ouketi estai'' (''time no longer'') signifies not the end of all time, but the end of delay or postponement in God''s prophetic schedule. It marks the imminent fulfillment of His final judgments and redemptive purposes.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = 6;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐτελέσθη', 'etelestē', 'G5055', 'Aorist passive indicative of ''teleō,'' meaning ''to be finished, completed, brought to an end.'' This signifies the definitive and irreversible completion of God''s plan. When the seventh trumpet sounds, the ''mystery of God'' will reach its final, intended conclusion, marking the culmination of His purposes.', 1),
  ('μυστήριον', 'mystērion', 'G3466', 'Meaning ''mystery, secret.'' In the New Testament, it refers to a divine truth previously hidden but now revealed through God''s redemptive acts. Here, ''the mystery of God'' encompasses His entire plan of salvation, judgment, and the establishment of His kingdom, which is about to be fully disclosed and enacted.', 2),
  ('προφήτας', 'prophētas', 'G4396', 'Meaning ''prophets.'' These are God''s chosen spokespersons who declared His will and future plans. The reference to God having ''declared'' (εὐηγγέλισεν - ''preached good news'') to His prophets emphasizes the continuity of God''s revelation and the faithfulness of His word throughout history.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = 7;

-- Verse 9
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κατάφαγε', 'kataphage', 'G2719', 'Aorist active imperative of ''katesthiō,'' meaning ''eat up, devour.'' This command to John is a symbolic act of internalizing God''s word, making it a part of oneself. It signifies a deep assimilation of the divine message, preparing the prophet to deliver it with conviction and understanding.', 1),
  ('πικρανεῖ', 'pikranei', 'G4087', 'Future active indicative of ''pikrainō,'' meaning ''to make bitter, embitter.'' The bitterness in the belly symbolizes the painful, difficult, or sorrowful aspects of the prophetic message, particularly the judgments and suffering it foretells. It represents the burden of proclaiming harsh truths.', 2),
  ('γλυκὺ', 'glyky', 'G1088', 'Meaning ''sweet.'' The sweetness in the mouth signifies the initial delight, joy, and preciousness of receiving divine revelation. God''s word is inherently desirable and nourishing to the soul, even when its implications are challenging (cf. Ps 119:103).', 3),
  ('μέλι', 'meli', 'G3192', 'Meaning ''honey.'' Honey is a common biblical metaphor for something pleasant, desirable, and nourishing (Ps 19:10; Prov 16:24). Its comparison to the taste of the scroll emphasizes the initial joy and satisfaction derived from receiving God''s direct word.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = 9;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('προφητεῦσαι', 'prophēteusai', 'G4395', 'Aorist active infinitive of ''prophēteuō,'' meaning ''to prophesy, to speak forth divine revelation.'' This is John''s renewed commission, emphasizing his role as God''s spokesperson. It signifies the ongoing necessity of proclaiming God''s truth, even after experiencing the ''bitterness'' of its implications.', 1),
  ('λαοῖς', 'laois', 'G2992', 'Dative plural of ''laos,'' meaning ''peoples, nations.'' This term often refers to ethnic groups or distinct populations. Its inclusion here, alongside ''nations,'' ''tongues,'' and ''kings,'' underscores the universal and comprehensive scope of John''s prophetic mandate, extending to all humanity.', 2),
  ('ἔθνεσιν', 'ethnesin', 'G1484', 'Dative plural of ''ethnos,'' meaning ''nations, Gentiles.'' In the New Testament, ''ethnos'' often contrasts with Israel, referring to non-Jewish peoples. Its presence here emphasizes that John''s message is for all Gentile nations, highlighting the global reach of God''s plan and judgment.', 3),
  ('γλώσσαις', 'glōssais', 'G1100', 'Dative plural of ''glōssa,'' meaning ''tongues, languages.'' This term further emphasizes the linguistic and cultural diversity of the audience for John''s prophecy. It signifies that the message transcends all linguistic barriers, intended for every language group on earth.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = 11;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Ezekiel 1:28', 1),
  (1, 'Daniel 10:6', 2),
  (1, 'Revelation 1:7', 3),
  (1, 'Revelation 1:13-16', 4),
  (1, 'Genesis 9:13-16', 5),
  (2, 'Daniel 12:4', 1),
  (2, 'Ezekiel 2:9-10', 2),
  (2, 'Psalm 8:6', 3),
  (2, 'Zechariah 14:9', 4),
  (2, 'Revelation 5:1-5', 5),
  (3, 'Amos 1:2', 1),
  (3, 'Amos 3:8', 2),
  (3, 'Hosea 11:10', 3),
  (3, 'Psalm 29:3-9', 4),
  (4, 'Daniel 8:26', 1),
  (4, 'Daniel 12:4', 2),
  (4, 'Daniel 12:9', 3),
  (4, 'Deuteronomy 29:29', 4),
  (4, 'Isaiah 8:16', 5),
  (5, 'Genesis 14:22', 1),
  (5, 'Deuteronomy 32:40', 2),
  (5, 'Daniel 12:7', 3),
  (5, 'Revelation 4:9', 4),
  (6, 'Exodus 20:11', 1),
  (6, 'Nehemiah 9:6', 2),
  (6, 'Psalm 146:6', 3),
  (6, 'Daniel 12:7', 4),
  (6, 'Revelation 4:11', 5),
  (7, 'Romans 16:25-26', 1),
  (7, 'Ephesians 3:3-6', 2),
  (7, 'Colossians 1:26-27', 3),
  (7, 'Amos 3:7', 4),
  (7, 'Revelation 11:15', 5),
  (8, 'Ezekiel 2:8', 1),
  (8, 'Jeremiah 15:16', 2),
  (8, 'Revelation 10:2', 3),
  (9, 'Ezekiel 3:1-3', 1),
  (9, 'Jeremiah 15:16', 2),
  (9, 'Psalm 119:103', 3),
  (9, 'Hebrews 4:12', 4),
  (10, 'Ezekiel 3:3', 1),
  (10, 'Psalm 19:10', 2),
  (10, 'Jeremiah 6:14', 3),
  (10, '2 Corinthians 2:15-16', 4),
  (11, 'Revelation 11:3', 1),
  (11, 'Revelation 14:6', 2),
  (11, 'Matthew 28:19', 3),
  (11, 'Acts 1:8', 4),
  (11, 'Revelation 5:9', 5)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Revelation' AND c.chapter_number = 10 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Revelation Chapter 10 Complete!
-- 11 verses · 6 key verses with word studies (21 words)
-- Cross-references for 11 verses (49 refs)
-- ═══════════════════════════════════════════════════════