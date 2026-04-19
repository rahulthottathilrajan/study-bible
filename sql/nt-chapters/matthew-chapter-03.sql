-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 3 — John the Baptist Prepares the Way for the Messiah
-- 17 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'Matthew Chapter 3 introduces John the Baptist as the divinely appointed forerunner of Jesus, fulfilling the prophecy of Isaiah 40:3. John''s ministry is characterized by a fervent call to repentance and a unique baptism in the Jordan River, signifying a spiritual cleansing and preparation for the imminent arrival of the ''kingdom of heaven.'' His confrontational message to the self-righteous Pharisees and Sadducees underscores the necessity of genuine ''fruits meet for repentance'' rather than reliance on ancestral lineage. The chapter culminates in the pivotal event of Jesus'' baptism by John, an act through which Jesus identifies with humanity''s sin and fulfills ''all righteousness.'' This moment is divinely affirmed by the descent of the Holy Spirit in the form of a dove and a voice from heaven declaring Jesus as God''s beloved Son, thereby inaugurating His public ministry and revealing the Trinitarian nature of God. This chapter sets the theological stage for Jesus'' subsequent ministry, establishing His identity, authority, and the nature of His kingdom.',
  'John the Baptist Prepares the Way for the Messiah',
  'μετάνοια (metanoia)',
  'From `μετανοέω` (metanoeō), meaning ''to change one''s mind, to repent''. Theologically, `metanoia` signifies a fundamental transformation of one''s entire being—mind, will, and emotions—leading to a turning away from sin and towards God. It''s not merely regret but a decisive reorientation of life, producing ''fruits'' consistent with this change.',
  '["Section 1 (vv.1-6): The Ministry and Message of John the Baptist","Section 2 (vv.7-10): John''s Confrontation with Religious Leaders and Call for True Repentance","Section 3 (vv.11-12): John Prophesies the Coming of the Mightier One","Section 4 (vv.13-17): The Baptism of Jesus and Divine Affirmation"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 17 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'In those days came John the Baptist, preaching in the wilderness of Judaea,',
   'Ἐν ἐκείναις δὲ ταῖς ἡμέραις παραγίνεται Ἰωάννης ὁ βαπτιστὴς κηρύσσων ἐν τῇ ἐρήμῳ τῆς Ἰουδαίας',
   'En ekeinais de tais hēmerais paragineta Iōannēs ho baptistēs kēryssōn en tē erēmō tēs Ioudaias',
   '“In those days” refers to the period preceding Jesus'' public ministry, likely around 26-28 AD. John the Baptist emerges as a wilderness prophet, echoing figures like Elijah (2 Kgs 1:8). His ministry in the Judaean wilderness, a sparsely populated region, underscored his separation from conventional religious institutions and his prophetic role. This setting emphasized the urgency and radical nature of his message, calling people away from urban centers to a place of spiritual reflection.',
   NULL),
  (2,
   'And saying, Repent ye: for the kingdom of heaven is at hand.',
   'λέγων, Μετανοεῖτε· ἤγγικεν γὰρ ἡ βασιλεία τῶν οὐρανῶν.',
   'legōn, Metanoeite; ēggiken gar hē basileia tōn ouranōn.',
   'John''s core message, “Repent ye: for the kingdom of heaven is at hand,” is identical to Jesus'' initial proclamation (Matt 4:17). `Μετανοεῖτε` (metanoeite) implies a complete change of mind and direction, a turning from sin to God. The “kingdom of heaven” (βασιλεία τῶν οὐρανῶν) is a Matthean idiom for the “kingdom of God,” referring to God''s sovereign rule, now breaking into human history through the Messiah.',
   'The imminent arrival of the "kingdom of heaven" underscores the urgency of repentance. This kingdom is not merely a future eschatological reality but a present spiritual reign initiated by Christ, demanding a radical transformation of life and allegiance to God''s rule.'),
  (3,
   'For this is he that was spoken of by the prophet Esaias, saying, The voice of one crying in the wilderness, Prepare ye the way of the Lord, make his paths straight.',
   'Οὗτος γάρ ἐστιν ὁ ῥηθεὶς διὰ Ἠσαΐου τοῦ προφήτου λέγοντος, Φωνὴ βοῶντος ἐν τῇ ἐρήμῳ, Ἑτοιμάσατε τὴν ὁδὸν Κυρίου, εὐθείας ποιεῖτε τὰς τρίβους αὐτοῦ.',
   'Houtos gar estin ho rhētheis dia Hēsaiou tou prophētou legontos, Phōnē boōntos en tē erēmō, Hetoimasate tēn hodon Kyriou, eutheias poieite tas tribous autou.',
   'This verse explicitly identifies John as the fulfillment of Isaiah 40:3. The “voice crying in the wilderness” prepares the way for the Lord, a royal metaphor for clearing obstacles and making roads smooth for an approaching king. John''s role was to prepare people spiritually for Jesus'' arrival, removing the barriers of sin and self-righteousness. This prophecy highlights God''s meticulous plan unfolding in history.',
   'The fulfillment of Isaiah''s prophecy in John the Baptist demonstrates God''s sovereign control over history and His faithfulness to His covenant promises. John''s role as the forerunner emphasizes the necessity of preparation and spiritual readiness for Christ''s advent.'),
  (4,
   'And the same John had his raiment of camel’s hair, and a leathern girdle about his loins; and his meat was locusts and wild honey.',
   'Αὐτὸς δὲ ὁ Ἰωάννης εἶχεν τὸ ἔνδυμα αὐτοῦ ἀπὸ τριχῶν καμήλου καὶ ζώνην δερματίνην περὶ τὴν ὀσφὺν αὐτοῦ, ἡ δὲ τροφὴ ἦν αὐτοῦ ἀκρίδες καὶ μέλι ἄγριον.',
   'Autos de ho Iōannēs eichen to endyma autou apo trichōn kamēlou kai zōnēn dermatinēn peri tēn osphyn autou, hē de trophē ēn autou akrides kai meli agrion.',
   'John''s attire and diet—camel''s hair garment, leather girdle, locusts, and wild honey—mark him as an ascetic prophet, reminiscent of Elijah (2 Kgs 1:8; Zech 13:4). This lifestyle symbolized his detachment from worldly comforts and his dedication to God''s call. It also served as a visual sermon, reinforcing his message of radical repentance and separation from societal norms.',
   NULL),
  (5,
   'Then went out to him Jerusalem, and all Judaea, and all the region round about Jordan,',
   'Τότε ἐξεπορεύετο πρὸς αὐτὸν Ἱεροσόλυμα καὶ πᾶσα ἡ Ἰουδαία καὶ πᾶσα ἡ περίχωρος τοῦ Ἰορδάνου,',
   'Tote exeporeueto pros auton Hierosolyma kai pasa hē Ioudaia kai pasa hē perichōros tou Iordanou,',
   'The widespread response to John''s ministry, drawing people from Jerusalem, all Judaea, and the Jordan region, indicates the profound spiritual hunger and expectation among the populace. This mass movement suggests a recognition of John''s prophetic authority and the compelling nature of his message, contrasting with the religious establishment.',
   NULL),
  (6,
   'And were baptized of him in Jordan, confessing their sins.',
   'καὶ ἐβαπτίζοντο ἐν τῷ Ἰορδάνῃ ὑπ’ αὐτοῦ ἐξομολογούμενοι τὰς ἁμαρτίας αὐτῶν.',
   'kai ebaptizonto en tō Iordanē hyp’ autou exomologoumenoi tas hamartias autōn.',
   'Baptism in the Jordan, accompanied by “confessing their sins,” was a public act of repentance and commitment. While ritual washings (mikveh) were common in Judaism, John''s baptism was unique as a one-time, eschatological immersion for repentance, signifying a break from the past and preparation for the Messiah. It was a public acknowledgment of sin and a desire for spiritual cleansing.',
   'John''s baptism, though distinct from Christian baptism, prefigured it by emphasizing repentance and public confession of sin as prerequisites for entering God''s new covenant. It highlighted the need for an inward change manifested through outward obedience.'),
  (7,
   'But when he saw many of the Pharisees and Sadducees come to his baptism, he said unto them, O generation of vipers, who hath warned you to flee from the wrath to come?',
   'Ἰδὼν δὲ πολλοὺς τῶν Φαρισαίων καὶ Σαδδουκαίων ἐρχομένους ἐπὶ τὸ βάπτισμα αὐτοῦ εἶπεν αὐτοῖς, Γεννήματα ἐχιδνῶν, τίς ὑπέδειξεν ὑμῖν φυγεῖν ἀπὸ τῆς μελλούσης ὀργῆς;',
   'Idōn de pollous tōn Pharisaiōn kai Saddoukaiōn erchomenous epi to baptisma autou eipen autois, Gennēmata echidnōn, tis hypedeixen hymin phygein apo tēs mellousēs orgēs?',
   'John''s harsh rebuke of the Pharisees and Sadducees as “generation of vipers” (γεννήματα ἐχιδνῶν) reveals his prophetic boldness and discernment. These religious leaders, often self-righteous, came for baptism perhaps out of curiosity or to avoid public scorn, not genuine repentance. John questions their motives, implying they sought to escape divine judgment without true change.',
   'John''s confrontation exposes the danger of superficial religiosity and hypocrisy. True faith requires genuine repentance and a transformed heart, not merely outward observance or association with religious groups, especially when attempting to evade divine wrath.'),
  (8,
   'Bring forth therefore fruits meet for repentance:',
   'ποιήσατε οὖν καρπὸν ἄξιον τῆς μετανοίας·',
   'poiēsate oun karpon axion tēs metanoias;',
   'John demands “fruits meet for repentance” (καρπὸν ἄξιον τῆς μετανοίας), emphasizing that true repentance is not just an internal feeling but must be demonstrated by outward actions and a changed lifestyle. This concept of ''fruit'' is central to biblical ethics, indicating that genuine faith produces tangible evidence (cf. Matt 7:16-20; Gal 5:22-23).',
   'This verse highlights the inseparable link between genuine repentance and ethical conduct. Authentic faith is not passive but active, producing a life that reflects God''s righteousness and demonstrates a true turning away from sin.'),
  (9,
   'And think not to say within yourselves, We have Abraham to our father: for I say unto you, that God is able of these stones to raise up children unto Abraham.',
   'καὶ μὴ δόξητε λέγειν ἐν ἑαυτοῖς, Πατέρα ἔχομεν τὸν Ἀβραάμ· λέγω γὰρ ὑμῖν ὅτι δύναται ὁ Θεὸς ἐκ τῶν λίθων τούτων ἐγεῖραι τέκνα τῷ Ἀβραάμ.',
   'kai mē doxēte legein en heautois, Patera echomen ton Abraam; legō gar hymin hoti dynatai ho Theos ek tōn lithōn toutōn egeirai tekna tō Abraam.',
   'John challenges the Pharisees'' reliance on their Abrahamic lineage for salvation. He asserts that God is not limited by human ancestry and can “raise up children unto Abraham” from stones, emphasizing God''s sovereign power and the spiritual nature of true sonship (cf. Rom 9:6-8; Gal 3:7). Physical descent from Abraham was insufficient without spiritual transformation.',
   'This statement refutes the notion of inherited salvation or ethnic privilege before God. It underscores that God''s covenant promises are fulfilled through faith and spiritual lineage, not merely biological descent, emphasizing the universal call to repentance and faith.'),
  (10,
   'And now also the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down, and cast into the fire.',
   'ἤδη δὲ ἡ ἀξίνη πρὸς τὴν ῥίζαν τῶν δένδρων κεῖται· πᾶν οὖν δένδρον μὴ ποιοῦν καρπὸν καλὸν ἐκκόπτεται καὶ εἰς πῦρ βάλλεται.',
   'ēdē de hē axinē pros tēn rhizan tōn dendrōn keitai; pan oun dendron mē poioun karpon kalon ekkoptetai kai eis pyr balletai.',
   'The imagery of the “axe laid unto the root of the trees” signifies imminent divine judgment. Just as a fruitless tree is cut down and burned, so too will those who do not produce “good fruit” (i.e., genuine repentance and righteousness) face destruction. This serves as a stark warning to those who resist John''s call.',
   'This prophetic warning illustrates the certainty and severity of divine judgment for those who fail to bear the fruit of repentance. It emphasizes that God''s patience has limits and that a day of reckoning awaits all who reject His call to transformation.'),
  (11,
   'I indeed baptize you with water unto repentance: but he that cometh after me is mightier than I, whose shoes I am not worthy to bear: he shall baptize you with the Holy Ghost, and with fire:',
   'Ἐγὼ μὲν ὑμᾶς βαπτίζω ἐν ὕδατι εἰς μετάνοιαν· ὁ δὲ ὀπίσω μου ἐρχόμενος ἰσχυρότερός μού ἐστιν, οὗ οὐκ εἰμὶ ἱκανὸς τὰ ὑποδήματα βαστάσαι· αὐτὸς ὑμᾶς βαπτίσει ἐν Πνεύματι Ἁγίῳ καὶ πυρί.',
   'Egō men hymas baptizō en hydati eis metanoian; ho de opisō mou erchomenos ischyroteros mou estin, hou ouk eimi hikanos ta hypodēmata bastasai; autos hymas baptisei en Pneumati Hagiō kai pyri.',
   'John contrasts his water baptism, which symbolizes repentance, with the future baptism by the “mightier one” (Jesus) with the “Holy Ghost, and with fire.” This dual baptism refers to the empowering presence of the Spirit and the purifying, refining, or judgmental work of God (cf. Acts 1:5; 2:3-4). John humbly acknowledges his inferiority, unworthy even to perform a servant''s task.',
   'This verse distinguishes John''s preparatory baptism from the transformative work of Christ. Jesus'' baptism with the Holy Spirit empowers believers for service and sanctification, while the "fire" aspect can signify either purification for the faithful or judgment for the unrepentant.'),
  (12,
   'Whose fan is in his hand, and he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire.',
   'οὗ τὸ πτύον ἐν τῇ χειρὶ αὐτοῦ, καὶ διακαθαριεῖ τὴν ἅλωνα αὐτοῦ, καὶ συνάξει τὸν σῖτον αὐτοῦ εἰς τὴν ἀποθήκην, τὸ δὲ ἄχυρον κατακαύσει πυρὶ ἀσβέστῳ.',
   'hou to ptyon en tē cheiri autou, kai diakathariei tēn halōna autou, kai synaxei ton siton autou eis tēn apothēkēn, to de achyron katakausei pyri asbestō.',
   'John continues the imagery of judgment, portraying Jesus as a farmer separating wheat from chaff. The “fan” (πτύον, ptyon, a winnowing fork) is used to toss the grain into the air, allowing the wind to blow away the light chaff while the heavier wheat falls to the threshing floor. The wheat (the righteous) will be gathered into the “garner” (ἀποθήκην, apothēkēn, barn), while the chaff (the unrighteous) will be burned with “unquenchable fire” (πυρὶ ἀσβέστῳ, pyri asbestō), symbolizing eternal judgment.',
   'This vivid imagery powerfully depicts Christ''s role as the ultimate judge, separating the righteous from the wicked. It underscores the finality of divine judgment and the eternal consequences for those who reject God''s grace and fail to align their lives with His will.'),
  (13,
   'Then cometh Jesus from Galilee to Jordan unto John, to be baptized of him.',
   'Τότε παραγίνεται ὁ Ἰησοῦς ἀπὸ τῆς Γαλιλαίας ἐπὶ τὸν Ἰορδάνην πρὸς τὸν Ἰωάννην τοῦ βαπτισθῆναι ὑπ’ αὐτοῦ.',
   'Tote paragineta ho Iēsous apo tēs Galilaias epi ton Iordanēn pros ton Iōannēn tou baptisthēnai hyp’ autou.',
   'Jesus'' arrival from Galilee to the Jordan to be baptized by John marks a significant transition. It signifies the beginning of His public ministry and His identification with humanity, even though He was without sin. This act was a deliberate step in God''s redemptive plan.',
   NULL),
  (14,
   'But John forbad him, saying, I have need to be baptized of thee, and comest thou to me?',
   'ὁ δὲ Ἰωάννης διεκώλυεν αὐτὸν λέγων, Ἐγὼ χρείαν ἔχω ὑπὸ σοῦ βαπτισθῆναι, καὶ σὺ ἔρχῃ πρός με;',
   'ho de Iōannēs diekōlyen auton legōn, Egō chreian echō hypo sou baptisthēnai, kai sy erchē pros me?',
   'John''s initial reluctance (“forbad him”) highlights his recognition of Jesus'' superior status and his own unworthiness. He understood that Jesus, being sinless, did not need a baptism of repentance. John''s statement, “I have need to be baptized of thee,” acknowledges Jesus'' divine authority and purifying power.',
   NULL),
  (15,
   'And Jesus answering said unto him, Suffer it to be so now: for thus it becometh us to fulfil all righteousness. Then he suffered him.',
   'ἀποκριθεὶς δὲ ὁ Ἰησοῦς εἶπεν πρὸς αὐτόν, Ἄφες ἄρτι· οὕτως γὰρ πρέπον ἐστὶν ἡμῖν πληρῶσαι πᾶσαν δικαιοσύνην. τότε ἀφίησιν αὐτόν.',
   'apokritheis de ho Iēsous eipen pros auton, Aphes arti; houtōs gar prepon estin hēmin plērōsai pasan dikaiosynēn. tote aphiēsin auton.',
   'Jesus'' response, “Suffer it to be so now: for thus it becometh us to fulfil all righteousness,” is crucial. His baptism was not for His own repentance but to identify with humanity, validate John''s ministry, and inaugurate His messianic work in obedience to God''s will. It was an act of solidarity and submission to the divine plan, setting an example of perfect obedience.',
   'Jesus'' baptism, though not for His own sin, was essential for "fulfilling all righteousness." It signifies His perfect obedience to God''s will, His identification with humanity''s need for cleansing, and His inauguration as the Messiah who would bear the sins of the world.'),
  (16,
   'And Jesus, when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of God descending like a dove, and lighting upon him:',
   'βαπτισθεὶς δὲ ὁ Ἰησοῦς εὐθὺς ἀνέβη ἀπὸ τοῦ ὕδατος· καὶ ἰδοὺ ἠνεῴχθησαν οἱ οὐρανοί, καὶ εἶδεν [τὸ] Πνεῦμα [τοῦ] Θεοῦ καταβαῖνον ὡσεὶ περιστερὰν ἐρχόμενον ἐπ’ αὐτόν.',
   'baptistheis de ho Iēsous euthys anebē apo tou hydatos; kai idou ēneōchthēsan hoi ouranoi, kai eiden [to] Pneuma [tou] Theou katabainon hōsei peristeran erchomenon ep’ auton.',
   'Immediately after Jesus'' baptism, the heavens were opened, and the Spirit of God descended “like a dove” and lit upon Him. This visible manifestation of the Holy Spirit confirms Jesus'' divine anointing for His messianic mission. The dove symbolizes purity, peace, and the presence of God (cf. Gen 8:8-12). This event marks the Trinitarian nature of God at work.',
   'The descent of the Holy Spirit upon Jesus in the form of a dove signifies His divine anointing and empowerment for His messianic ministry. This event, alongside the Father''s voice, provides a clear manifestation of the Trinity—Father, Son, and Holy Spirit—working in perfect unity.'),
  (17,
   'And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.',
   'καὶ ἰδοὺ φωνὴ ἐκ τῶν οὐρανῶν λέγουσα, Οὗτός ἐστιν ὁ Υἱός μου ὁ ἀγαπητός, ἐν ᾧ εὐδόκησα.',
   'kai idou phōnē ek tōn ouranōn legousa, Houtos estin ho Huios mou ho agapētos, en hō eudokēsa.',
   'The voice from heaven, “This is my beloved Son, in whom I am well pleased,” is a direct divine affirmation of Jesus'' identity and mission. This echoes Psalm 2:7 (“Thou art my Son”) and Isaiah 42:1 (“my chosen one in whom my soul delights”), linking Jesus to both the Davidic Messiah and the Suffering Servant. This declaration publicly validates Jesus as the Son of God.',
   'The Father''s declaration from heaven unequivocally affirms Jesus'' divine Sonship and His unique relationship with God. This public endorsement establishes Jesus'' authority and identity as the Messiah, the beloved Son in whom God finds ultimate pleasure, initiating His redemptive work.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 3;

-- Step 3: Word Studies for key verses

-- Verse 2
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('μετανοεῖτε', 'metanoeite', 'G3340', 'Imperative form of `μετανοέω`, meaning ''to change one''s mind, to repent''. It denotes a fundamental transformation of one''s inner disposition, leading to a turning away from sin and a reorientation towards God. It''s more than regret; it''s a decisive shift in allegiance and lifestyle.', 1),
  ('βασιλεία', 'basileia', 'G932', 'Refers to kingship, royal power, or kingdom. In the phrase "kingdom of heaven," it signifies God''s sovereign rule and reign, which is both a present spiritual reality and a future eschatological hope. It''s not primarily a geographical territory but the dynamic exercise of divine authority.', 2),
  ('οὐρανῶν', 'ouranōn', 'G3772', 'Genitive plural of `οὐρανός`, meaning ''heaven'' or ''sky''. In Matthew, "kingdom of heaven" is a circumlocution for "kingdom of God," used to avoid direct mention of God''s name, reflecting Jewish reverence. It emphasizes the divine origin and transcendent nature of this kingdom.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 2;

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φωνή', 'phōnē', 'G5456', 'Means ''a sound, tone, voice''. Here, it refers to the audible voice of John the Baptist, fulfilling the prophecy of Isaiah 40:3. It emphasizes the prophetic authority and divine origin of John''s message, serving as God''s herald in the wilderness.', 1),
  ('βοῶντος', 'boōntos', 'G994', 'Participle of `βοάω`, meaning ''to cry aloud, shout''. It describes the intense and urgent nature of John''s proclamation. His voice was not a whisper but a powerful, public declaration, demanding attention and response in the desolate wilderness.', 2),
  ('ἑτοιμάσατε', 'hetoimasate', 'G2090', 'Aorist imperative of `ἑτοιμάζω`, meaning ''to prepare, make ready''. This command, drawn from Isaiah, calls for active preparation for the Lord''s arrival, both practically (clearing paths) and spiritually (removing obstacles of sin and pride).', 3),
  ('Κυρίου', 'Kyriou', 'G2962', 'Genitive of `Κύριος`, meaning ''Lord, master''. In this context, referring to Yahweh in the Old Testament prophecy, it is applied to Jesus, identifying Him as the divine Lord for whom John prepares the way. It signifies His supreme authority and deity.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 3;

-- Verse 7
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Φαρισαίων', 'Pharisaiōn', 'G5330', 'From Aramaic, meaning ''separated ones''. A prominent Jewish religious and political party known for strict adherence to the Law and oral traditions. John''s rebuke highlights their hypocrisy and reliance on external observance over internal transformation.', 1),
  ('Σαδδουκαίων', 'Saddoukaiōn', 'G4523', 'A Jewish religious party, primarily aristocratic priests, who rejected oral tradition, resurrection, and angels. They were often politically aligned with Roman rule. John''s condemnation shows that neither their legalism nor their skepticism exempted them from the need for repentance.', 2),
  ('Γεννήματα', 'Gennēmata', 'G1081', 'Plural of `γέννημα`, meaning ''offspring, brood''. Here, used metaphorically as "generation of vipers" (`ἐχιδνῶν`, G2191), it describes their corrupt nature and malicious intent, likening them to venomous snakes. It''s a strong condemnation of their spiritual state.', 3),
  ('ὀργῆς', 'orgēs', 'G3709', 'Genitive of `ὀργή`, meaning ''wrath, indignation''. Refers to God''s righteous and holy anger against sin. John warns them to flee from the "wrath to come," emphasizing the impending divine judgment for unrepentant sin.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 7;

-- Verse 11
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βαπτίζω', 'baptizō', 'G907', 'Means ''to immerse, dip, baptize''. John''s baptism was with water for repentance. The word implies a complete submersion, symbolizing cleansing and a new beginning. It is distinct from Christian baptism in its theological significance but shares the ritual act.', 1),
  ('ἰσχυρότερός', 'ischyroteros', 'G2478', 'Comparative form of `ἰσχυρός`, meaning ''stronger, mightier''. John uses this to describe Jesus, acknowledging His superior power, authority, and divine nature. It highlights the vast difference in their respective ministries and persons.', 2),
  ('ὑποδήματα', 'hypodēmata', 'G5266', 'Plural of `ὑπόδημα`, meaning ''sandals, shoes''. To carry or untie someone''s sandals was a task for the lowest servant. John''s statement emphasizes his profound humility and unworthiness in comparison to Jesus, underscoring Jesus'' supreme dignity.', 3),
  ('Πνεύματι', 'Pneumati', 'G4151', 'Dative of `Πνεῦμα`, meaning ''spirit, wind, breath''. Here, it refers to the Holy Spirit, the third person of the Trinity. Jesus'' baptism with the Holy Spirit signifies the Spirit''s empowering presence and indwelling in believers, initiating the new covenant.', 4),
  ('πυρί', 'pyri', 'G4442', 'Dative of `πῦρ`, meaning ''fire''. In the context of baptism, "fire" can symbolize purification and refining for believers, or destructive judgment for the unrepentant. It represents the intense, transformative, and often severe work of God.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 11;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πτύον', 'ptyon', 'G4428', 'A ''winnowing fork'' or ''fan''. This agricultural tool was used to separate grain from chaff. It symbolizes Christ''s role as judge, separating the righteous (wheat) from the wicked (chaff) in the final judgment.', 1),
  ('διακαθαριεῖ', 'diakathariei', 'G1245', 'Future indicative of `διακαθαρίζω`, meaning ''to thoroughly cleanse, purge''. It describes the thoroughness of Christ''s judgment, where every impurity and unrighteousness will be completely removed from His "threshing floor" (the world or His people).', 2),
  ('σῖτον', 'siton', 'G4621', 'Means ''wheat, grain''. Symbolically represents the righteous, those who have genuinely repented and bear good fruit. They are gathered into God''s "garner" (ἀποθήκην, G596), signifying salvation and eternal security.', 3),
  ('ἄχυρον', 'achyron', 'G892', 'Means ''chaff''. Symbolically represents the unrighteous, those who are spiritually barren and lack true repentance. They are light and worthless, destined for destruction.', 4),
  ('ἀσβέστῳ', 'asbestō', 'G763', 'Dative of `ἄσβεστος`, meaning ''unquenchable, inextinguishable''. Describes the eternal and unending nature of the fire of judgment, emphasizing the permanence of the consequences for the unrepentant.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 12;

-- Verse 15
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πρέπον', 'prepon', 'G4241', 'Participle of `πρέπω`, meaning ''it is fitting, proper, becoming''. Jesus uses this to explain why His baptism is necessary, emphasizing that it aligns with divine propriety and God''s established order for salvation.', 1),
  ('πληρῶσαι', 'plērōsai', 'G4137', 'Aorist infinitive of `πληρόω`, meaning ''to fulfill, complete, bring to an end''. Jesus'' baptism was an act of fulfilling God''s righteous requirements, not for His own sin, but as a representative act for humanity and to inaugurate His messianic mission.', 2),
  ('δικαιοσύνην', 'dikaiosynēn', 'G1343', 'Accusative of `δικαιοσύνη`, meaning ''righteousness, justice''. Here, "all righteousness" refers to God''s righteous will and requirements. Jesus'' baptism was an act of perfect obedience, demonstrating His commitment to God''s plan for human redemption.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 15;

-- Verse 17
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('φωνή', 'phōnē', 'G5456', '''Voice, sound''. Here, it refers to the audible voice of God the Father from heaven, confirming Jesus'' identity. This divine utterance provides authoritative testimony to Jesus'' unique status.', 1),
  ('Υἱός', 'Huios', 'G5207', '''Son''. This title, "My beloved Son," declares Jesus'' unique divine Sonship, emphasizing His intimate relationship with the Father and His divine nature. It echoes Old Testament messianic prophecies (Ps 2:7).', 2),
  ('ἀγαπητός', 'agapētos', 'G27', '''Beloved, dear''. This adjective emphasizes the Father''s deep affection and unique love for Jesus. It signifies Jesus'' special status and favor with God, highlighting His preeminence and chosenness.', 3),
  ('εὐδόκησα', 'eudokēsa', 'G2106', 'Aorist indicative of `εὐδοκέω`, meaning ''to be well pleased, to delight in''. This verb expresses the Father''s complete satisfaction and approval of Jesus, both in His person and in His obedient act of baptism, marking the inauguration of His redemptive work.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = 17;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Mark 1:4', 1),
  (1, 'Luke 3:2-3', 2),
  (1, 'John 1:6-8', 3),
  (1, 'Isaiah 40:3', 4),
  (2, 'Mark 1:15', 1),
  (2, 'Luke 3:3', 2),
  (2, 'Matthew 4:17', 3),
  (2, 'Daniel 2:44', 4),
  (3, 'Isaiah 40:3', 1),
  (3, 'Malachi 3:1', 2),
  (3, 'Mark 1:2-3', 3),
  (3, 'Luke 3:4-6', 4),
  (4, '2 Kings 1:8', 1),
  (4, 'Zechariah 13:4', 2),
  (4, 'Mark 1:6', 3),
  (4, 'Leviticus 11:22', 4),
  (5, 'Mark 1:5', 1),
  (5, 'Luke 3:7', 2),
  (5, 'Acts 19:4', 3),
  (6, 'Acts 19:18', 1),
  (6, 'Psalm 32:5', 2),
  (6, 'Proverbs 28:13', 3),
  (7, 'Matthew 12:34', 1),
  (7, 'Matthew 23:33', 2),
  (7, 'Luke 3:7-8', 3),
  (7, 'Romans 2:5', 4),
  (8, 'Luke 3:8', 1),
  (8, 'Matthew 7:16-20', 2),
  (8, 'Galatians 5:22-23', 3),
  (8, 'James 2:17-20', 4),
  (9, 'John 8:33-39', 1),
  (9, 'Romans 9:6-8', 2),
  (9, 'Galatians 3:7-9', 3),
  (9, 'Luke 3:8', 4),
  (10, 'Matthew 7:19', 1),
  (10, 'Luke 3:9', 2),
  (10, 'John 15:6', 3),
  (10, 'Hebrews 6:7-8', 4),
  (11, 'Mark 1:7-8', 1),
  (11, 'Luke 3:16', 2),
  (11, 'John 1:26-27', 3),
  (11, 'Acts 1:5', 4),
  (11, 'Acts 2:3-4', 5),
  (12, 'Malachi 3:2-3', 1),
  (12, 'Malachi 4:1', 2),
  (12, 'Luke 3:17', 3),
  (12, 'Matthew 13:30', 4),
  (12, 'Matthew 25:41', 5),
  (13, 'Mark 1:9', 1),
  (13, 'Luke 3:21', 2),
  (13, 'John 1:29-34', 3),
  (15, 'Matthew 5:17', 1),
  (15, 'Romans 8:3-4', 2),
  (15, 'Hebrews 4:15', 3),
  (15, '1 Peter 2:21', 4),
  (16, 'Mark 1:10', 1),
  (16, 'Luke 3:22', 2),
  (16, 'John 1:32-34', 3),
  (16, 'Isaiah 11:2', 4),
  (17, 'Psalm 2:7', 1),
  (17, 'Isaiah 42:1', 2),
  (17, 'Matthew 17:5', 3),
  (17, 'Mark 1:11', 4),
  (17, 'Luke 3:22', 5),
  (17, '2 Peter 1:17', 6)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 3 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 3 Complete!
-- 17 verses · 7 key verses with word studies (28 words)
-- Cross-references for 16 verses (65 refs)
-- ═══════════════════════════════════════════════════════