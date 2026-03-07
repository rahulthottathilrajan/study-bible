-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 1 — The Supremacy of the Son over Angels
-- 14 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Hebrews 1 is one of the most exalted Christological passages in the entire New Testament, establishing from the outset that the Son of God is infinitely superior to angels. The chapter opens with a magnificent prologue (vv.1-4) declaring that God, who spoke ''at sundry times and in divers manners'' through the prophets, has now spoken definitively ''by his Son'' (v.2). This Son is described in the highest possible terms: He is ''appointed heir of all things'' and the agent of creation (v.2); He is ''the brightness of his glory, and the express image of his person'' (v.3a); He ''uphold[s] all things by the word of his power'' (v.3b); and having ''by himself purged our sins, sat down on the right hand of the Majesty on high'' (v.3c). The rest of the chapter (vv.5-14) presents a catena of seven Old Testament quotations proving the Son''s superiority over angels: (1) Psalm 2:7 — ''Thou art my Son'' (v.5a); (2) 2 Samuel 7:14 — ''I will be to him a Father'' (v.5b); (3) Deuteronomy 32:43 LXX — ''Let all the angels of God worship him'' (v.6); (4) Psalm 104:4 — angels are mere servants (v.7); (5) Psalm 45:6-7 — the Son is addressed as ''God'' with an eternal throne (vv.8-9); (6) Psalm 102:25-27 — the Son is the unchanging Creator (vv.10-12); (7) Psalm 110:1 — ''Sit on my right hand'' (v.13). The chapter concludes by defining angels as ''ministering spirits, sent forth to minister for them who shall be heirs of salvation'' (v.14) — servants, not sovereigns.',
  'The Supremacy of the Son of God over Angels',
  'χαρακτήρ (charaktēr)',
  'Exact imprint, express image, precise representation — used of an engraving tool and its impression, or a stamp and the mark it leaves. In v.3 the Son is the charaktēr of God''s hypostasis (person, substance). This means the Son is not merely similar to God but is the exact, perfect reproduction of the divine essence — as a seal leaves its precise image in wax. This is the strongest possible affirmation of the Son''s full deity.',
  '["The Prologue: God Has Spoken by His Son (vv.1-4): God who at sundry times and in divers manners spake in time past unto the fathers by the prophets hath in these last days spoken unto us by his Son whom he hath appointed heir of all things by whom also he made the worlds who being the brightness of his glory and the express image of his person and upholding all things by the word of his power when he had by himself purged our sins sat down on the right hand of the Majesty on high being made so much better than the angels as he hath by inheritance obtained a more excellent name than they","Seven OT Proofs of the Son''s Superiority (vv.5-13): For unto which of the angels said he at any time Thou art my Son this day have I begotten thee and I will be to him a Father; when he bringeth in the firstbegotten into the world let all the angels of God worship him; of the angels he maketh them spirits and ministers a flame of fire; but unto the Son Thy throne O God is for ever and ever; Thou Lord hast laid the foundation of the earth and the heavens are the works of thine hands; they shall perish but thou remainest; sit on my right hand until I make thine enemies thy footstool","Angels as Ministering Spirits (v.14): Are they not all ministering spirits sent forth to minister for them who shall be heirs of salvation"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 14 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'God, who at sundry times and in divers manners spake in time past unto the fathers by the prophets,',
   'πολυμερῶς καὶ πολυτρόπως πάλαι ὁ θεὸς λαλήσας τοῖς πατράσιν ἐν τοῖς προφήταις',
   'polymerōs kai polytropōs palai ho theos lalēsas tois patrasin en tois prophētais',
   '''At sundry times'' (polymerōs — in many parts, in many portions; the word suggests fragmentary, progressive revelation). ''In divers manners'' (polytropōs — in many ways, by various methods; visions, dreams, types, theophanies, direct speech). Together these two magnificent adverbs — found only here in the NT — describe the character of OT revelation: it was genuine but partial, authentic but fragmentary. ''Spake'' (lalēsas — having spoken; aorist participle indicating completed action). God spoke — the epistle begins with the bedrock conviction that the Bible is God''s speech. ''By the prophets'' (en tois prophētais — in the prophets; God spoke in and through human instruments).',
   'This verse establishes the doctrine of progressive revelation: God did not deliver all truth at once but revealed it gradually, in successive portions (polymerōs) and through varied means (polytropōs). The OT revelation was real and authoritative, but incomplete — awaiting the final, definitive revelation in the Son.'),
  (2, 'Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;',
   'ἐπ᾽ ἐσχάτου τῶν ἡμερῶν τούτων ἐλάλησεν ἡμῖν ἐν υἱῷ ὃν ἔθηκεν κληρονόμον πάντων δι᾽ οὗ καὶ τοὺς αἰῶνας ἐποίησεν',
   'ep eschatou tōn hēmerōn toutōn elalēsen hēmin en hyiō hon ethēken klēronomon pantōn di hou kai tous aiōnas epoiēsen',
   '''In these last days'' (ep eschatou tōn hēmerōn toutōn — at the end of these days). The Christ-event inaugurates the ''last days'' — the final epoch of redemptive history. ''By his Son'' (en hyiō — in a Son; the anarthrous noun emphasizes quality: in one who is Son by nature, not merely title). Seven magnificent declarations about the Son follow in vv.2-3: (1) ''heir of all things'' (klēronomon pantōn — appointed inheritor of the entire created order); (2) ''by whom he made the worlds'' (di hou tous aiōnas epoiēsen — through whom He made the ages/worlds; aiōnas includes both space and time, the entire created order in all its dimensions). The Son is both the goal (heir) and the agent (maker) of all creation.',
   'The Son''s role as Creator (di hou … epoiēsen) places Him alongside the Father as the divine agent of creation, echoing John 1:3 (''all things were made by him'') and Colossians 1:16 (''by him were all things created''). This is an unambiguous affirmation of the Son''s pre-existence and deity.'),
  (3, 'Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;',
   'ὃς ὢν ἀπαύγασμα τῆς δόξης καὶ χαρακτὴρ τῆς ὑποστάσεως αὐτοῦ φέρων τε τὰ πάντα τῷ ῥήματι τῆς δυνάμεως αὐτοῦ δι᾽ ἑαυτοῦ καθαρισμὸν ποιησάμενος τῶν ἁμαρτιῶν ἡμῶν ἐκάθισεν ἐν δεξιᾷ τῆς μεγαλωσύνης ἐν ὑψηλοῖς',
   'hos ōn apaugasma tēs doxēs kai charaktēr tēs hypostaseōs autou pherōn te ta panta tō rhēmati tēs dynameōs autou di heautou katharismon poiēsamenos tōn hamartiōn hēmōn ekathisen en dexia tēs megalōsynēs en hypsēlois',
   'This single verse contains five remaining declarations about the Son (declarations 3-7 of seven total): (3) ''brightness of his glory'' (apaugasma tēs doxēs — radiance, effulgence; the light that streams forth from a source. As sunlight is to the sun, so the Son is to the Father''s glory — of the same essence, eternally proceeding, inseparable). (4) ''express image of his person'' (charaktēr tēs hypostaseōs — the exact imprint of His substance/being. Charaktēr means the precise impression left by a seal or die; hypostasis means the underlying reality, the essential being. The Son perfectly reproduces the Father''s essence). (5) ''upholding all things by the word of his power'' (pherōn ta panta — not merely carrying but sustaining, maintaining, governing the entire universe by His powerful word). (6) ''by himself purged our sins'' (di heautou katharismon poiēsamenos — having made purification of sins through His own sacrifice; the priestly work that dominates chapters 5-10 is introduced here). (7) ''sat down on the right hand of the Majesty on high'' (ekathisen en dexia — the session at God''s right hand signifies completed work and sovereign authority; OT priests never sat because their work was never finished, but Christ sat down because His sacrifice was once-for-all).',
   'This verse is the most compressed Christological statement in the NT. It affirms: the Son''s eternal deity (apaugasma — He radiates God''s glory from eternity, not merely after the incarnation; the present participle ōn — ''being'' — denotes continuous, essential nature); His ontological identity with the Father (charaktēr tēs hypostaseōs — same substance, exact representation); His providential sustaining of creation (pherōn ta panta); His priestly atonement (katharismon tōn hamartiōn); and His kingly exaltation (ekathisen en dexia). Prophet (vv.1-2), Priest, and King are united in one person.'),
  (4, 'Being made so much better than the angels, as he hath by inheritance obtained a more excellent name than they.',
   'τοσούτῳ κρείττων γενόμενος τῶν ἀγγέλων ὅσῳ διαφορώτερον παρ᾽ αὐτοὺς κεκληρονόμηκεν ὄνομα',
   'tosoutō kreittōn genomenos tōn angelōn hosō diaphorōteron par autous keklēronomēken onoma',
   '''Better'' (kreittōn — superior, more excellent; this key word appears 13 times in Hebrews, establishing the ''better'' theme of the entire epistle: better name, better covenant, better promises, better sacrifice, better country). ''By inheritance obtained'' (keklēronomēken — has inherited; perfect tense indicating permanent possession). The ''more excellent name'' is ''Son'' — the name angels never received. ''Being made'' (genomenos — having become) refers not to a change in the Son''s nature but to His exaltation after the incarnation and atonement. In His human nature, the incarnate Son has been exalted to a position that demonstrates what was always true of His divine nature.',
   'The word kreittōn (better/superior) is the theological keyword of Hebrews, used to demonstrate Christ''s superiority in every category: better than angels (ch.1-2), Moses (ch.3), Joshua (ch.4), Aaron (ch.5-7), and the old covenant itself (ch.8-10).'),
  (5, 'For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?',
   'τίνι γὰρ εἶπέν ποτε τῶν ἀγγέλων υἱός μου εἶ σύ ἐγὼ σήμερον γεγέννηκά σε καὶ πάλιν ἐγὼ ἔσομαι αὐτῷ εἰς πατέρα καὶ αὐτὸς ἔσται μοι εἰς υἱόν',
   'tini gar eipen pote tōn angelōn hyios mou ei sy egō sēmeron gegennēka se kai palin egō esomai autō eis patera kai autos estai moi eis hyion',
   'The first two of seven OT quotations proving the Son''s superiority. (1) Psalm 2:7 — ''Thou art my Son, this day have I begotten thee.'' ''Begotten'' (gegennēka — perfect tense: I have begotten) refers not to the Son''s eternal origin but to His messianic installation and resurrection (cf. Acts 13:33). Psalm 2 is a coronation psalm; ''today'' marks the day of enthronement. (2) 2 Samuel 7:14 — ''I will be to him a Father'' — the Davidic covenant promise, originally given concerning Solomon but finding its ultimate fulfillment in David''s greater Son. No angel ever received either designation. The rhetorical question ''unto which of the angels?'' expects the answer: none.',
   'The application of Psalm 2:7 to Christ establishes that ''Son'' is not merely a title of honor but denotes a unique, exclusive relationship with the Father that no created being — not even the highest angel — shares. The eternal generation of the Son is distinct from the creation of angels.'),
  (6, 'And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of God worship him.',
   'ὅταν δὲ πάλιν εἰσαγάγῃ τὸν πρωτότοκον εἰς τὴν οἰκουμένην λέγει καὶ προσκυνησάτωσαν αὐτῷ πάντες ἄγγελοι θεοῦ',
   'hotan de palin eisagagē ton prōtotokon eis tēn oikoumenēn legei kai proskynēsatōsan autō pantes angeloi theou',
   '''Firstbegotten'' (prōtotokon — firstborn; a title of supremacy and preeminence, not temporal origin; cf. Col 1:15). ''Into the world'' (eis tēn oikoumenēn — into the inhabited earth). This likely refers to Christ''s second advent (''when he bringeth in again''). (3) The third OT quotation is from Deuteronomy 32:43 (LXX): ''Let all the angels of God worship him.'' The command for angels to worship the Son is decisive: if the Son were a creature (even the highest angel), worship of Him would be idolatry. That God commands His angels to worship the Son proves the Son is God. Angels are worshippers; the Son is the object of worship.',
   'The command for angels to worship the Son is a definitive proof of His deity. In biblical theology, worship belongs to God alone (Exod 34:14; Matt 4:10; Rev 22:8-9). If angels are commanded to worship the Son, He must be fully divine — not a creature, however exalted.'),
  (7, 'And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire.',
   'καὶ πρὸς μὲν τοὺς ἀγγέλους λέγει ὁ ποιῶν τοὺς ἀγγέλους αὐτοῦ πνεύματα καὶ τοὺς λειτουργοὺς αὐτοῦ πυρὸς φλόγα',
   'kai pros men tous angelous legei ho poiōn tous angelous autou pneumata kai tous leitourgous autou pyros phloga',
   '(4) The fourth OT quotation, from Psalm 104:4. The contrast is pointed: angels are made (poiōn — who makes, creates) — they are creatures. They are ''spirits'' (pneumata) and ''ministers'' (leitourgous — liturgical servants, public servants). Angels are mutable — they can be transformed into wind and fire as God directs. They serve; they do not reign. The Son, by contrast (v.8), has an eternal throne. ''Ministers'' (leitourgous) is the word from which we get ''liturgy'' — angelic service is worship-service directed by God.',
   NULL),
  (8, 'But unto the Son he saith, Thy throne, O God, is for ever and ever: a sceptre of righteousness is the sceptre of thy kingdom.',
   'πρὸς δὲ τὸν υἱόν ὁ θρόνος σου ὁ θεός εἰς τὸν αἰῶνα τοῦ αἰῶνος ῥάβδος εὐθύτητος ἡ ῥάβδος τῆς βασιλείας σου',
   'pros de ton hyion ho thronos sou ho theos eis ton aiōna tou aiōnos rhabdos euthytētos hē rhabdos tēs basileias sou',
   '(5) The fifth quotation, from Psalm 45:6-7, is the most remarkable: God the Father addresses the Son as ''O God'' (ho theos). ''Thy throne, O God'' — the Son possesses an eternal throne (eis ton aiōna tou aiōnos — unto the age of the age, forever and ever). The ''sceptre of righteousness'' (rhabdos euthytētos — a rod/sceptre of straightness, uprightness) describes the character of the Son''s reign: His rule is perfectly just. Psalm 45 was originally a royal wedding psalm, but the author of Hebrews applies it to the Son — and in doing so, identifies the Son as the divine King whose throne endures eternally.',
   'This is one of the most direct affirmations of Christ''s deity in the NT. The Father Himself addresses the Son as ''O God'' (ho theos — with the definite article). This cannot be reduced to a mere title of honor: in a Jewish monotheistic context, calling the Son ''God'' and ascribing to Him an eternal throne is an unambiguous declaration of full deity. The Son is not a lesser god or an exalted angel — He is ho theos, God.'),
  (9, 'Thou hast loved righteousness, and hated iniquity; therefore God, even thy God, hath anointed thee with the oil of gladness above thy fellows.',
   'ἠγάπησας δικαιοσύνην καὶ ἐμίσησας ἀνομίαν διὰ τοῦτο ἔχρισέν σε ὁ θεός ὁ θεός σου ἔλαιον ἀγαλλιάσεως παρὰ τοὺς μετόχους σου',
   'ēgapēsas dikaiosynēn kai emisēsas anomian dia touto echrisen se ho theos ho theos sou elaion agalliaseōs para tous metochous sou',
   'Continuing Psalm 45:7. ''Loved righteousness … hated iniquity'' — the Son''s moral perfection is absolute; He has an active, volitional commitment to righteousness and an equally active hatred of lawlessness (anomian — literally ''without law''). ''Therefore God, even thy God'' (ho theos, ho theos sou — God, your God) — a remarkable expression: the Son is called ''God'' (v.8) and also has a God. This reflects the incarnational mystery: as the eternal Son, He is God; as the incarnate Messiah, God is His God. ''Anointed'' (echrisen — from which we get ''Christ/Messiah'', the Anointed One). ''Above thy fellows'' (para tous metochous sou — beyond your companions/partners) — the Son is exalted incomparably above all others.',
   NULL),
  (10, 'And, Thou, Lord, in the beginning hast laid the foundation of the earth; and the heavens are the works of thine hands:',
   'καὶ σύ κατ᾽ ἀρχάς κύριε τὴν γῆν ἐθεμελίωσας καὶ ἔργα τῶν χειρῶν σού εἰσιν οἱ οὐρανοί',
   'kai sy kat archas kyrie tēn gēn ethemeliōsas kai erga tōn cheirōn sou eisin hoi ouranoi',
   '(6) The sixth quotation, from Psalm 102:25-27, is applied to the Son. What is astonishing is that Psalm 102 is addressed to Yahweh — ''Thou, Lord'' (sy, kyrie). The author of Hebrews takes words spoken to YHWH and applies them to the Son, thereby identifying the Son with Yahweh. ''In the beginning'' (kat archas — at the beginning, from the foundations). ''Laid the foundation of the earth'' (tēn gēn ethemeliōsas — you founded the earth). ''The heavens are the works of thine hands'' — the Son is the Creator of both earth and heaven. This directly echoes the Genesis creation account and John 1:3.',
   'The application of Psalm 102:25-27 — a psalm addressed to YHWH — to the Son is one of the strongest proofs of Christ''s full deity in the NT. The author does not merely compare the Son to God; he identifies the Son as the very YHWH who created heaven and earth. This identification is foundational to Nicene Christology.'),
  (11, 'They shall perish; but thou remainest; and they all shall wax old as doth a garment;',
   'αὐτοὶ ἀπολοῦνται σὺ δὲ διαμένεις καὶ πάντες ὡς ἱμάτιον παλαιωθήσονται',
   'autoi apolountai sy de diameneis kai pantes hōs himation palaiōthēsontai',
   '''They shall perish'' (apolountai — they will be destroyed, they will pass away) — the created universe is transient. ''But thou remainest'' (sy de diameneis — but you continue, you endure through all change; the prefix dia- emphasizes continuity through time). The contrast is absolute: creation perishes; the Son endures. ''Wax old as doth a garment'' (hōs himation palaiōthēsontai — they will become old like a garment) — the universe ages and wears out like clothing. The Son, by contrast, is immutable — He does not age, deteriorate, or change.',
   NULL),
  (12, 'And as a vesture shalt thou fold them up, and they shall be changed: but thou art the same, and thy years shall not fail.',
   'καὶ ὡσεὶ περιβόλαιον ἑλίξεις αὐτούς καὶ ἀλλαγήσονται σὺ δὲ ὁ αὐτὸς εἶ καὶ τὰ ἔτη σου οὐκ ἐκλείψουσιν',
   'kai hōsei peribolaion helixeis autous kai allagēsontai sy de ho autos ei kai ta etē sou ouk ekleipsousin',
   '''As a vesture'' (hōsei peribolaion — like a cloak, a mantle). ''Fold them up'' (helixeis — you will roll them up, as one rolls up a garment). The Son will roll up the heavens and earth like discarded clothing. ''They shall be changed'' (allagēsontai — they will be transformed, exchanged for something new; cf. the new heavens and earth of Rev 21:1). ''But thou art the same'' (sy de ho autos ei — but you are the same; ho autos — ''the same one,'' an echo of the divine name in Ps 102:27 and Isa 41:4). ''Thy years shall not fail'' (ta etē sou ouk ekleipsousin — your years will never run out). The Son is eternal, immutable, unchanging — the same yesterday, today, and forever (Heb 13:8).',
   'The immutability of the Son — ''thou art the same'' (ho autos) — is a divine attribute. Only God is unchanging (Mal 3:6; James 1:17). That the Son shares this attribute confirms His full deity. The created order is mutable and transient; the Son is immutable and eternal.'),
  (13, 'But to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?',
   'πρὸς τίνα δὲ τῶν ἀγγέλων εἴρηκέν ποτε κάθου ἐκ δεξιῶν μου ἕως ἂν θῶ τοὺς ἐχθρούς σου ὑποπόδιον τῶν ποδῶν σου',
   'pros tina de tōn angelōn eirēken pote kathou ek dexiōn mou heōs an thō tous echthrous sou hypopodion tōn podōn sou',
   '(7) The seventh and final quotation, from Psalm 110:1 — the most quoted OT verse in the NT. ''Sit on my right hand'' (kathou ek dexiōn mou — sit at my right, the position of supreme honor and authority). No angel was ever invited to share God''s throne. ''Until I make thine enemies thy footstool'' (heōs an thō tous echthrous sou hypopodion — until I place your enemies as a footstool for your feet). The imagery is of an ancient Near Eastern conqueror placing his foot on the neck of defeated enemies (cf. Josh 10:24). The session at God''s right hand is not passive waiting but active reigning — all enemies are progressively being subdued until the final consummation.',
   'Psalm 110:1 is the foundation of NT Christology: the risen Christ sits at God''s right hand reigning over all creation. This ''session'' theology appears in the Apostles'' Creed (''sitteth at the right hand of God the Father Almighty'') and is the basis for Christ''s present heavenly intercession (Heb 7:25) and His future return in judgment.'),
  (14, 'Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?',
   'οὐχὶ πάντες εἰσὶν λειτουργικὰ πνεύματα εἰς διακονίαν ἀποστελλόμενα διὰ τοὺς μέλλοντας κληρονομεῖν σωτηρίαν',
   'ouchi pantes eisin leitourgika pneumata eis diakonian apostellomena dia tous mellontas klēronomein sōtērian',
   '''Ministering spirits'' (leitourgika pneumata — liturgical/servant spirits; leitourgika relates to public service, particularly sacred service). ''Sent forth to minister'' (eis diakonian apostellomena — sent out for service/ministry). Angels are servants; the Son is sovereign. Angels are sent; the Son sends. Angels minister to believers; the Son is ministered to by angels (v.6). ''Heirs of salvation'' (tous mellontas klēronomein sōtērian — those who are about to inherit salvation). The final word of the chapter is ''salvation'' (sōtērian), which will become the dominant theme of chapter 2. Angels serve God''s elect — those destined to inherit the salvation accomplished by the Son.',
   'This verse defines the role of angels in relation to believers: they are servants assigned to aid the heirs of salvation. This is the biblical basis for the ministry of guardian angels, though Hebrews emphasizes their collective service (''all … sent forth'') rather than individual assignment.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 1;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀπαύγασμα', 'apaugasma', 'G541', 'Radiance, effulgence, brightness streaming forth — from apo (from) + augazō (to shine). A NT hapax (only here). The Son is the radiance that shines forth from the Father''s glory, just as light radiates from the sun. The radiance is of the same essence as the source, coeternal with it (there was never a time when the sun existed without its radiance), and inseparable from it. This word affirms both the Son''s distinct personhood and His essential unity with the Father.', 1),
  ('χαρακτήρ', 'charaktēr', 'G5481', 'Exact imprint, precise reproduction, express image — originally the tool used for engraving, then the mark or impression it leaves (as a die stamps a coin). A NT hapax (only in Heb 1:3). The Son is the exact reproduction of the Father''s hypostasis (essential being). This goes beyond mere likeness to identity of essence: the impression perfectly reproduces every detail of the original. Used in patristic theology to affirm the Son''s consubstantiality with the Father.', 2),
  ('ὑπόστασις', 'hypostasis', 'G5287', 'Substance, essence, underlying reality, person — from hypo (under) + stasis (standing). Literally ''that which stands under,'' the foundational reality. In Heb 1:3 it refers to God''s essential being — His substance or nature. In 3:14 and 11:1 it means ''confidence'' or ''assurance.'' This term became central to trinitarian theology: three hypostaseis (persons) sharing one ousia (essence/substance).', 3),
  ('κρείττων', 'kreittōn', 'G2909', 'Better, superior, more excellent — the comparative of kratus (strong). The keyword of Hebrews, appearing 13 times (1:4; 6:9; 7:7,19,22; 8:6[x2]; 9:23; 10:34; 11:16,35,40; 12:24). Everything about Christ and the new covenant is kreittōn: better name, better hope, better covenant, better promises, better sacrifices, better substance, better country, better resurrection, better blood. The entire epistle is an extended argument for the superiority of Christ over all that preceded Him.', 4),
  ('πρωτότοκος', 'prōtotokos', 'G4416', 'Firstborn — a title of supremacy, rank, and preeminence rather than temporal origin. In the OT, the firstborn held the rights of inheritance and leadership regardless of birth order (cf. Jacob over Esau, Ephraim over Manasseh). Applied to Christ (v.6; Col 1:15,18; Rom 8:29; Rev 1:5), it means He holds the supreme rank over all creation — not that He was the first creature made. The ''firstbegotten'' (prōtotokon) is worshipped by angels, which would be impossible if He were a creature.', 5),
  ('λειτουργικός', 'leitourgikos', 'G3010', 'Ministering, serving in a sacred/public capacity — from leitourgia (public service, liturgical ministry). A NT hapax (only in v.14). Angels are liturgical servants — their service has a sacred, worship-oriented character. They serve God by serving His people. The word emphasizes that angelic ministry is not independent but directed by and for God, in service to the heirs of salvation.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 1
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 3
    WHEN 3 THEN 3
    WHEN 4 THEN 4
    WHEN 5 THEN 6
    WHEN 6 THEN 14
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Numbers 12:6-8', 1),
  (1, '2 Peter 1:21', 2),
  (2, 'John 1:3', 3),
  (2, 'Colossians 1:16-17', 4),
  (2, 'Acts 2:17', 5),
  (3, 'John 14:9', 6),
  (3, 'Colossians 1:15', 7),
  (3, 'Colossians 1:17', 8),
  (3, 'Psalm 110:1', 9),
  (3, 'Mark 16:19', 10),
  (4, 'Philippians 2:9-11', 11),
  (4, 'Ephesians 1:21', 12),
  (5, 'Psalm 2:7', 13),
  (5, '2 Samuel 7:14', 14),
  (5, 'Acts 13:33', 15),
  (6, 'Deuteronomy 32:43', 16),
  (6, 'Colossians 1:15', 17),
  (6, 'Revelation 5:11-12', 18),
  (7, 'Psalm 104:4', 19),
  (8, 'Psalm 45:6-7', 20),
  (8, 'Isaiah 9:7', 21),
  (9, 'Psalm 45:7', 22),
  (9, 'Isaiah 61:1', 23),
  (10, 'Psalm 102:25', 24),
  (10, 'Genesis 1:1', 25),
  (10, 'Isaiah 48:13', 26),
  (12, 'Hebrews 13:8', 27),
  (12, 'Malachi 3:6', 28),
  (12, 'James 1:17', 29),
  (13, 'Psalm 110:1', 30),
  (13, 'Matthew 22:44', 31),
  (13, 'Acts 2:34-35', 32),
  (13, '1 Corinthians 15:25', 33),
  (14, 'Psalm 91:11', 34),
  (14, 'Psalm 34:7', 35),
  (14, 'Matthew 18:10', 36)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 1
  AND v.verse_number = cr.verse_number;
