-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 1 — The Beginning of the Gospel
-- 45 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Mark''s Gospel opens with explosive energy. There is no genealogy, no birth narrative — Mark plunges directly into ''the beginning of the gospel of Jesus Christ, the Son of God'' (v.1). He immediately establishes Jesus'' identity through Old Testament prophecy (vv.2-3), the testimony of John the Baptist (vv.4-8), the Father''s voice at the baptism (vv.9-11), and the Spirit''s driving Jesus into the wilderness (vv.12-13). After John''s arrest, Jesus begins his Galilean ministry with the proclamation: ''The time is fulfilled, and the kingdom of God is at hand: repent ye, and believe the gospel'' (v.15). The rapid-fire narrative — marked by Mark''s characteristic ''immediately'' (euthys, used eleven times in this chapter alone) — shows Jesus calling his first disciples (vv.16-20), teaching with authority in the Capernaum synagogue (vv.21-22), casting out an unclean spirit (vv.23-28), healing Simon''s mother-in-law (vv.29-31), healing multitudes at evening (vv.32-34), withdrawing to pray (vv.35-38), preaching throughout Galilee (v.39), and cleansing a leper (vv.40-45). Two themes dominate: Jesus'' supreme authority (over demons, disease, and the human will) and the messianic secret (Jesus repeatedly silences those who would reveal his identity prematurely, vv.25, 34, 44).',
  'The Beginning of the Gospel — Jesus'' Authority and the Messianic Secret',
  'εὐθύς (euthys)',
  'Immediately, straightway — Mark''s signature word, occurring over 40 times in his Gospel (11 times in chapter 1 alone). It conveys the urgency and relentless momentum of Jesus'' ministry. Mark presents a Christ who acts decisively, moves swiftly, and whose authority demands immediate response. The word reflects Mark''s Roman audience — people of action who valued efficiency and power.',
  '["The Prologue: Gospel, Prophecy, and Forerunner (vv.1-8): The beginning of the gospel of Jesus Christ the Son of God. As it is written in the prophets Behold I send my messenger before thy face. John did baptize in the wilderness and preach the baptism of repentance. There cometh one mightier than I after me. He shall baptize you with the Holy Ghost","The Baptism and Temptation of Jesus (vv.9-13): Jesus came from Nazareth of Galilee and was baptized of John in Jordan. The heavens opened and the Spirit like a dove descending upon him. Thou art my beloved Son in whom I am well pleased. Immediately the Spirit driveth him into the wilderness forty days tempted of Satan","The Kingdom Proclaimed and Disciples Called (vv.14-20): The time is fulfilled and the kingdom of God is at hand repent ye and believe the gospel. He saw Simon and Andrew casting a net. Come ye after me and I will make you to become fishers of men. Straightway they forsook their nets and followed him","Authority in Capernaum: Teaching and Exorcism (vv.21-28): He entered into the synagogue and taught. They were astonished at his doctrine for he taught them as one that had authority. A man with an unclean spirit cried out I know thee who thou art the Holy One of God. With authority commandeth he even the unclean spirits and they do obey him","Healing Ministry and the Messianic Secret (vv.29-45): He took her by the hand and lifted her up and immediately the fever left her. He healed many that were sick of divers diseases and suffered not the devils to speak because they knew him. Rising up a great while before day he departed into a solitary place and there prayed. A leper beseeching him If thou wilt thou canst make me clean. I will be thou clean"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 45 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'The beginning of the gospel of Jesus Christ, the Son of God;',
   'Ἀρχὴ τοῦ εὐαγγελίου Ἰησοῦ Χριστοῦ υἱοῦ τοῦ θεοῦ',
   'Archē tou euangeliou Iēsou Christou huiou tou theou',
   '''Beginning'' (archē — origin, starting point; echoing Genesis 1:1 LXX). ''Gospel'' (euangelion — good news; originally a term for imperial proclamations of victory). ''Jesus Christ'' — Jesus (Iēsous, the Greek form of Joshua, ''Yahweh saves'') is the personal name; Christ (Christos, ''Anointed One'') is the messianic title. ''Son of God'' — Mark''s thesis statement: this Jesus is the divine Son. The entire Gospel will demonstrate and confirm this claim.',
   'Mark''s opening verse functions as a title for the entire Gospel. Unlike Matthew and Luke, Mark has no birth narrative; unlike John, no cosmic prologue. He begins at the ''beginning'' — not of creation but of the gospel message. The term ''Son of God'' (huiou tou theou) is debated textually (absent in some manuscripts) but is almost certainly original, forming an inclusio with the centurion''s confession at the cross: ''Truly this man was the Son of God'' (15:39). Mark''s Christology is thus framed by divine sonship — declared at the start, confirmed at the climax.'),
  (2, 'As it is written in the prophets, Behold, I send my messenger before thy face, which shall prepare thy way before thee.',
   'ὡς γέγραπται ἐν τοῖς προφήταις ἰδοὺ ἐγὼ ἀποστέλλω τὸν ἄγγελόν μου πρὸ προσώπου σου ὃς κατασκευάσει τὴν ὁδόν σου ἔμπροσθέν σου',
   'hōs gegraptai en tois prophētais idou egō apostellō ton angelon mou pro prosōpou sou hos kataskeuasei tēn hodon sou emprosthen sou',
   '''As it is written'' (gegraptai — perfect tense: stands written, permanently authoritative). Mark combines Malachi 3:1 and Exodus 23:20. ''My messenger'' (ton angelon mou — my angel/envoy). The quotation identifies John the Baptist as the prophesied forerunner. ''Prepare thy way'' — John''s ministry is preparatory, clearing the path for the Messiah.',
   NULL),
  (3, 'The voice of one crying in the wilderness, Prepare ye the way of the Lord, make his paths straight.',
   'φωνὴ βοῶντος ἐν τῇ ἐρήμῳ ἑτοιμάσατε τὴν ὁδὸν κυρίου εὐθείας ποιεῖτε τὰς τρίβους αὐτοῦ',
   'phōnē boōntos en tē erēmō hetoimasate tēn hodon kyriou eutheias poieite tas tribous autou',
   'Quoting Isaiah 40:3 (LXX). ''Crying'' (boōntos — shouting, calling with a loud voice). ''Wilderness'' (erēmō — desert, uninhabited place; the place of Israel''s testing and God''s provision). ''Prepare'' (hetoimasate — make ready; aorist imperative: do it now). ''Straight'' (eutheias — direct, without deviation). In Isaiah, the way is prepared for Yahweh; Mark applies it to Jesus, implicitly identifying Jesus with Yahweh.',
   NULL),
  (4, 'John did baptize in the wilderness, and preach the baptism of repentance for the remission of sins.',
   'ἐγένετο Ἰωάννης βαπτίζων ἐν τῇ ἐρήμῳ καὶ κηρύσσων βάπτισμα μετανοίας εἰς ἄφεσιν ἁμαρτιῶν',
   'egeneto Iōannēs baptizōn en tē erēmō kai kēryssōn baptisma metanoias eis aphesin hamartiōn',
   '''Baptize'' (baptizōn — immersing; present participle: John was continuously immersing). ''Repentance'' (metanoias — a change of mind, turning from sin to God). ''Remission'' (aphesin — forgiveness, release, sending away). John''s baptism signified the penitent''s desire for cleansing, pointing forward to the greater baptism Jesus would bring (v.8).',
   NULL),
  (5, 'And there went out unto him all the land of Judaea, and they of Jerusalem, and were all baptized of him in the river of Jordan, confessing their sins.',
   'καὶ ἐξεπορεύετο πρὸς αὐτὸν πᾶσα ἡ Ἰουδαία χώρα καὶ οἱ Ἱεροσολυμῖται καὶ ἐβαπτίζοντο πάντες ἐν τῷ Ἰορδάνῃ ποταμῷ ὑπ᾿ αὐτοῦ ἐξομολογούμενοι τὰς ἁμαρτίας αὐτῶν',
   'kai exeporeueto pros auton pasa hē Ioudaia chōra kai hoi Hierosolymitai kai ebaptizonto pantes en tō Iordanē potamō hyp autou exomologoumenoi tas hamartias autōn',
   '''All the land'' — hyperbolic language conveying the massive impact of John''s ministry. ''Confessing'' (exomologoumenoi — openly acknowledging, publicly declaring). The imperfect tenses (exeporeueto, ebaptizonto) indicate continuous action: people kept coming and kept being baptized. The Jordan River recalls Israel''s crossing under Joshua — a new beginning for God''s people.',
   NULL),
  (6, 'And John was clothed with camel''s hair, and with a girdle of a skin about his loins; and he did eat locusts and wild honey;',
   'ἦν δὲ Ἰωάννης ἐνδεδυμένος τρίχας καμήλου καὶ ζώνην δερματίνην περὶ τὴν ὀσφὺν αὐτοῦ καὶ ἐσθίων ἀκρίδας καὶ μέλι ἄγριον',
   'ēn de Iōannēs endedymenos trichas kamēlou kai zōnēn dermatinēn peri tēn osphyn autou kai esthiōn akridas kai meli agrion',
   'John''s appearance deliberately echoes Elijah (2 Kings 1:8). ''Camel''s hair'' and ''leather girdle'' — the prophet''s garb, signaling that the prophetic voice silent for 400 years has returned. ''Locusts and wild honey'' — clean food (Leviticus 11:22), indicating John''s ascetic lifestyle in the wilderness. John embodies the returning Elijah prophesied in Malachi 4:5.',
   NULL),
  (7, 'And preached, saying, There cometh one mightier than I after me, the latchet of whose shoes I am not worthy to stoop down and unloose.',
   'καὶ ἐκήρυσσεν λέγων ἔρχεται ὁ ἰσχυρότερός μου ὀπίσω μου οὗ οὐκ εἰμὶ ἱκανὸς κύψας λῦσαι τὸν ἱμάντα τῶν ὑποδημάτων αὐτοῦ',
   'kai ekēryssen legōn erchetai ho ischyroteros mou opisō mou hou ouk eimi hikanos kypsas lysai ton himanta tōn hypodēmatōn autou',
   '''Mightier'' (ischyroteros — stronger, more powerful; comparative: incomparably greater). ''Latchet'' (himanta — leather strap). Untying sandals was the task of the lowest slave — a task so menial that a Jewish disciple was not required to do it for his rabbi. John''s self-abasement highlights the infinite gap between the forerunner and the Coming One.',
   NULL),
  (8, 'I indeed have baptized you with water: but he shall baptize you with the Holy Ghost.',
   'ἐγὼ μὲν ἐβάπτισα ὑμᾶς ἐν ὕδατι αὐτὸς δὲ βαπτίσει ὑμᾶς ἐν πνεύματι ἁγίῳ',
   'egō men ebaptisa hymas en hydati autos de baptisei hymas en pneumati hagiō',
   '''I indeed'' (egō men — emphatic: as for me). ''With water'' (en hydati — in water). ''He shall baptize you with the Holy Ghost'' (en pneumati hagiō — in the Holy Spirit). The contrast is stark: John''s baptism is external and preparatory; Jesus'' baptism is internal and transformative. This promise was fulfilled at Pentecost (Acts 2:1-4).',
   'The distinction between John''s water baptism and Jesus'' Spirit baptism is foundational to New Testament theology. Water baptism symbolises repentance and cleansing; Spirit baptism imparts new life, power, and incorporation into the body of Christ (1 Corinthians 12:13). John''s baptism pointed forward to what only Christ could accomplish: the indwelling and empowering presence of the Holy Spirit.'),
  (9, 'And it came to pass in those days, that Jesus came from Nazareth of Galilee, and was baptized of John in Jordan.',
   'καὶ ἐγένετο ἐν ἐκείναις ταῖς ἡμέραις ἦλθεν Ἰησοῦς ἀπὸ Ναζαρὲτ τῆς Γαλιλαίας καὶ ἐβαπτίσθη ὑπὸ Ἰωάννου εἰς τὸν Ἰορδάνην',
   'kai egeneto en ekeinais tais hēmerais ēlthen Iēsous apo Nazaret tēs Galilaias kai ebaptisthē hypo Iōannou eis ton Iordanēn',
   '''Nazareth of Galilee'' — an obscure village in a despised region (John 1:46). ''Baptized of John'' — Jesus submitted to a baptism of repentance though he was sinless. He identified with sinful humanity, consecrated himself to his messianic mission, and foreshadowed his death and resurrection (burial in water, rising from it).',
   'Jesus'' baptism raises the question: why would the sinless Son of God submit to a baptism ''for the remission of sins''? Jesus was not confessing personal sin but identifying with the sinners he came to save. His baptism inaugurated his public ministry and served as his anointing for the messianic task — confirmed immediately by the Father''s voice and the Spirit''s descent (vv.10-11).'),
  (10, 'And straightway coming up out of the water, he saw the heavens opened, and the Spirit like a dove descending upon him:',
   'καὶ εὐθέως ἀναβαίνων ἀπὸ τοῦ ὕδατος εἶδεν σχιζομένους τοὺς οὐρανοὺς καὶ τὸ πνεῦμα ὡσεὶ περιστερὰν καταβαῖνον ἐπ᾿ αὐτόν',
   'kai eutheōs anabainōn apo tou hydatos eiden schizomenous tous ouranous kai to pneuma hōsei peristeran katabainon ep auton',
   '''Straightway'' (eutheōs — immediately; Mark''s first use of his signature word). ''Heavens opened'' (schizomenous — torn apart, ripped open; a violent word, stronger than Matthew''s ''opened''; the same verb used for the temple veil in 15:38, forming a literary bracket). ''Like a dove'' (hōsei peristeran — the dove symbolises gentleness, peace, and the Spirit''s creative hovering over the waters, cf. Genesis 1:2). ''Descending upon him'' — the Spirit''s anointing for ministry.',
   NULL),
  (11, 'And there came a voice from heaven, saying, Thou art my beloved Son, in whom I am well pleased.',
   'καὶ φωνὴ ἐγένετο ἐκ τῶν οὐρανῶν σὺ εἶ ὁ υἱός μου ὁ ἀγαπητός ἐν σοὶ εὐδόκησα',
   'kai phōnē egeneto ek tōn ouranōn sy ei ho huios mou ho agapētos en soi eudokēsa',
   '''Thou art'' (sy ei — you are; addressed directly to Jesus, unlike Matthew''s ''This is''). ''Beloved Son'' (ho huios mou ho agapētos — my Son, the beloved one; combining Psalm 2:7 and Isaiah 42:1). ''Well pleased'' (eudokēsa — I have taken delight, I am fully satisfied; aorist: a settled, definitive approval). The Father''s voice, the descending Spirit, and the baptized Son — the Trinity is manifest at the inauguration of Jesus'' ministry.',
   'The baptismal declaration is the first of three heavenly affirmations of Jesus'' identity in Mark (cf. 9:7, the Transfiguration; 15:39, the centurion''s confession). ''Beloved Son'' (agapētos) carries the sense of ''unique, one-of-a-kind'' — recalling Isaac as Abraham''s ''only'' son (Genesis 22:2 LXX uses agapētos). The allusion to Psalm 2:7 identifies Jesus as the messianic King; the allusion to Isaiah 42:1 identifies him as the Suffering Servant. Kingship and suffering are united in one person from the very start.'),
  (12, 'And immediately the Spirit driveth him into the wilderness.',
   'καὶ εὐθὺς τὸ πνεῦμα αὐτὸν ἐκβάλλει εἰς τὴν ἔρημον',
   'kai euthys to pneuma auton ekballei eis tēn erēmon',
   '''Immediately'' (euthys — at once; the transition from baptismal glory to wilderness testing is instantaneous). ''Driveth'' (ekballei — casts out, drives out; the same strong verb used for casting out demons, vv.34, 39). The Spirit does not gently lead but forcefully impels Jesus into the desert. This is divine compulsion: the testing is not accidental but essential to the messianic mission.',
   NULL),
  (13, 'And he was there in the wilderness forty days, tempted of Satan; and was with the wild beasts; and the angels ministered unto him.',
   'καὶ ἦν ἐκεῖ ἐν τῇ ἐρήμῳ ἡμέρας τεσσαράκοντα πειραζόμενος ὑπὸ τοῦ Σατανᾶ καὶ ἦν μετὰ τῶν θηρίων καὶ οἱ ἄγγελοι διηκόνουν αὐτῷ',
   'kai ēn ekei en tē erēmō hēmeras tesserakonta peirazomenos hypo tou Satana kai ēn meta tōn thēriōn kai hoi angeloi diēkonoun autō',
   '''Forty days'' — echoing Israel''s 40 years in the wilderness and Moses'' 40 days on Sinai. ''Tempted'' (peirazomenos — being tested/tried; present participle: continuous testing throughout the 40 days). ''Satan'' — Mark uses the Hebrew name (the Adversary) rather than the Greek ''devil.'' ''Wild beasts'' — unique to Mark, perhaps evoking Eden (the new Adam among the animals) or the dangers of the Judean wilderness. ''Angels ministered'' (diēkonoun — were serving; imperfect: ongoing ministry).',
   'Mark''s temptation account is remarkably compressed (two verses vs. Matthew''s eleven and Luke''s thirteen). He omits the specific temptations, focusing instead on the cosmic drama: the Spirit, Satan, wild beasts, and angels surrounding Jesus. The scene evokes both the first Adam (tested in a garden and failing) and the eschatological hope of Isaiah 11:6-9 (the peaceable kingdom where wild beasts are tame). Jesus is the new Adam who succeeds where the first Adam failed.'),
  (14, 'Now after that John was put in prison, Jesus came into Galilee, preaching the gospel of the kingdom of God,',
   'μετὰ δὲ τὸ παραδοθῆναι τὸν Ἰωάννην ἦλθεν ὁ Ἰησοῦς εἰς τὴν Γαλιλαίαν κηρύσσων τὸ εὐαγγέλιον τῆς βασιλείας τοῦ θεοῦ',
   'meta de to paradothēnai ton Iōannēn ēlthen ho Iēsous eis tēn Galilaian kēryssōn to euangelion tēs basileias tou theou',
   '''Put in prison'' (paradothēnai — handed over, delivered up; the same verb later used for Jesus'' own betrayal, 9:31, 10:33, 14:41. John''s fate foreshadows Jesus''). ''Galilee'' — the region of Jesus'' primary ministry, a mixed Jewish-Gentile area. ''Gospel of the kingdom of God'' — the good news that God''s sovereign reign is breaking into history through Jesus.',
   NULL),
  (15, 'And saying, The time is fulfilled, and the kingdom of God is at hand: repent ye, and believe the gospel.',
   'καὶ λέγων ὅτι πεπλήρωται ὁ καιρὸς καὶ ἤγγικεν ἡ βασιλεία τοῦ θεοῦ μετανοεῖτε καὶ πιστεύετε ἐν τῷ εὐαγγελίῳ',
   'kai legōn hoti peplērōtai ho kairos kai ēngiken hē basileia tou theou metanoeite kai pisteuete en tō euangeliō',
   '''Time'' (kairos — the decisive, appointed moment, not mere chronological time/chronos). ''Is fulfilled'' (peplērōtai — has been filled full; perfect tense: the appointed time has arrived and now stands complete). ''At hand'' (ēngiken — has drawn near, has come close; perfect: it has arrived and remains present). ''Repent'' (metanoeite — change your minds). ''Believe'' (pisteuete — trust, commit yourselves to). Jesus'' first recorded words in Mark contain the entire gospel in summary: the time has come, God''s kingdom is here, turn and trust.',
   'This verse is the programmatic summary of Jesus'' entire ministry in Mark. Four declarations: (1) The time (kairos) is fulfilled — God''s appointed moment in salvation history has arrived; (2) The kingdom of God is at hand — God''s sovereign rule is breaking into the present through Jesus; (3) Repent — turn from sin and self-reliance; (4) Believe the gospel — trust the good news. This is not merely an invitation but a royal announcement demanding response. The kingdom is not future only; it is already present in the person and work of Jesus.'),
  (16, 'Now as he walked by the sea of Galilee, he saw Simon and Andrew his brother casting a net into the sea: for they were fishers.',
   'περιπατῶν δὲ παρὰ τὴν θάλασσαν τῆς Γαλιλαίας εἶδεν Σίμωνα καὶ Ἀνδρέαν τὸν ἀδελφὸν αὐτοῦ βάλλοντας ἀμφίβληστρον ἐν τῇ θαλάσσῃ ἦσαν γὰρ ἁλιεῖς',
   'peripatōn de para tēn thalassan tēs Galilaias eiden Simōna kai Andrean ton adelphon autou ballontas amphiblēstron en tē thalassē ēsan gar halieis',
   '''Sea of Galilee'' (thalassan — Mark calls it a ''sea'' though it is technically a lake, reflecting local usage). ''Casting a net'' (ballontas amphiblēstron — throwing a circular casting net). ''Fishers'' (halieis — fishermen). Jesus finds his first disciples in the midst of their ordinary work. The call comes not in the temple but at the lakeside — God meets people where they are.',
   NULL),
  (17, 'And Jesus said unto them, Come ye after me, and I will make you to become fishers of men.',
   'καὶ εἶπεν αὐτοῖς ὁ Ἰησοῦς δεῦτε ὀπίσω μου καὶ ποιήσω ὑμᾶς γενέσθαι ἁλιεῖς ἀνθρώπων',
   'kai eipen autois ho Iēsous deute opisō mou kai poiēsō hymas genesthai halieis anthrōpōn',
   '''Come ye after me'' (deute opisō mou — follow behind me; the language of discipleship). ''I will make you'' (poiēsō hymas — I will cause you to become; Jesus takes responsibility for their transformation). ''Fishers of men'' (halieis anthrōpōn — those who catch people for the kingdom). Jesus redefines their vocation: the same skills of patience, perseverance, and craft will be redirected from fish to people.',
   NULL),
  (18, 'And straightway they forsook their nets, and followed him.',
   'καὶ εὐθέως ἀφέντες τὰ δίκτυα αὐτῶν ἠκολούθησαν αὐτῷ',
   'kai eutheōs aphentes ta diktya autōn ēkolouthēsan autō',
   '''Straightway'' (eutheōs — immediately, without hesitation). ''Forsook'' (aphentes — left behind, abandoned; aorist participle: a decisive break). ''Followed'' (ēkolouthēsan — began to follow; a technical term for discipleship). The immediacy of their response is striking: no negotiation, no delay, no looking back. The authority of Jesus'' call produces instant, radical obedience.',
   NULL),
  (19, 'And when he had gone a little further thence, he saw James the son of Zebedee, and John his brother, who also were in the ship mending their nets.',
   'καὶ προβὰς ἐκεῖθεν ὀλίγον εἶδεν Ἰάκωβον τὸν τοῦ Ζεβεδαίου καὶ Ἰωάννην τὸν ἀδελφὸν αὐτοῦ καὶ αὐτοὺς ἐν τῷ πλοίῳ καταρτίζοντας τὰ δίκτυα',
   'kai probas ekeithen oligon eiden Iakōbon ton tou Zebedaiou kai Iōannēn ton adelphon autou kai autous en tō ploiō katartizontas ta diktya',
   '''Mending'' (katartizontas — repairing, putting in order; the word also means ''to equip, to make complete'' and is used in Ephesians 4:12 for equipping the saints). James and John are preparing for the next day''s fishing — but Jesus has a different kind of preparation in mind. The detail of mending nets suggests diligent, responsible workers.',
   NULL),
  (20, 'And straightway he called them: and they left their father Zebedee in the ship with the hired servants, and went after him.',
   'καὶ εὐθέως ἐκάλεσεν αὐτούς καὶ ἀφέντες τὸν πατέρα αὐτῶν Ζεβεδαῖον ἐν τῷ πλοίῳ μετὰ τῶν μισθωτῶν ἀπῆλθον ὀπίσω αὐτοῦ',
   'kai eutheōs ekalesen autous kai aphentes ton patera autōn Zebedaion en tō ploiō meta tōn misthōtōn apēlthon opisō autou',
   '''Called'' (ekalesen — summoned; the divine call). ''Left their father'' — discipleship demands priority even over family ties (cf. 10:29). ''Hired servants'' (misthōtōn — wage-earners; this detail, unique to Mark, shows that Zebedee''s business was not destitute — they left a viable livelihood). ''Went after him'' (apēlthon opisō autou — they departed, following behind him). The cost of discipleship is immediately visible: family, livelihood, and security are left behind.',
   NULL),
  (21, 'And they went into Capernaum; and straightway on the sabbath day he entered into the synagogue, and taught.',
   'καὶ εἰσπορεύονται εἰς Καπερναούμ καὶ εὐθέως τοῖς σάββασιν εἰσελθὼν εἰς τὴν συναγωγὴν ἐδίδασκεν',
   'kai eisporeuontai eis Kapernaoum kai eutheōs tois sabbasin eiselthōn eis tēn synagōgēn edidasken',
   '''Capernaum'' — Jesus'' base of operations in Galilee (cf. 2:1, ''his own city''). ''Straightway on the sabbath'' — Mark''s characteristic urgency. ''Taught'' (edidasken — was teaching; imperfect tense: continuous, extended teaching). Mark does not record the content of the teaching (unlike Luke 4:16-30) but focuses on its effect (v.22) and on the dramatic encounter that follows (vv.23-28).',
   NULL),
  (22, 'And they were astonished at his doctrine: for he taught them as one that had authority, and not as the scribes.',
   'καὶ ἐξεπλήσσοντο ἐπὶ τῇ διδαχῇ αὐτοῦ ἦν γὰρ διδάσκων αὐτοὺς ὡς ἐξουσίαν ἔχων καὶ οὐχ ὡς οἱ γραμματεῖς',
   'kai exeplēssonto epi tē didachē autou ēn gar didaskōn autous hōs exousian echōn kai ouch hōs hoi grammateis',
   '''Astonished'' (exeplēssonto — struck out of their senses, overwhelmed; imperfect: they kept being amazed). ''Doctrine'' (didachē — teaching). ''Authority'' (exousian — rightful power, inherent authority). ''Scribes'' (grammateis — experts in the Law who taught by citing previous authorities: ''Rabbi X says... Rabbi Y says...''). Jesus taught with direct, intrinsic authority — not derived from tradition but from his own person. This is the authority of the Author himself.',
   NULL),
  (23, 'And there was in their synagogue a man with an unclean spirit; and he cried out,',
   'καὶ ἦν ἐν τῇ συναγωγῇ αὐτῶν ἄνθρωπος ἐν πνεύματι ἀκαθάρτῳ καὶ ἀνέκραξεν',
   'kai ēn en tē synagōgē autōn anthrōpos en pneumati akathartō kai anekraxen',
   '''Unclean spirit'' (pneumati akathartō — an impure spirit; Mark''s preferred term for demons, emphasising their moral defilement). ''Cried out'' (anekraxen — shrieked, screamed; the demon''s response to Jesus'' holy presence is involuntary and violent). The demon was in the synagogue — evil can lurk even in sacred spaces, undetected until confronted by the presence of the Holy One.',
   NULL),
  (24, 'Saying, Let us alone; what have we to do with thee, thou Jesus of Nazareth? art thou come to destroy us? I know thee who thou art, the Holy One of God.',
   'λέγων ἔα τί ἡμῖν καὶ σοί Ἰησοῦ Ναζαρηνέ ἦλθες ἀπολέσαι ἡμᾶς οἶδά σε τίς εἶ ὁ ἅγιος τοῦ θεοῦ',
   'legōn ea ti hēmin kai soi Iēsou Nazarēne ēlthes apolesai hēmas oida se tis ei ho hagios tou theou',
   '''Let us alone'' (ea — an exclamation: Ha! or Leave off!). ''What have we to do with thee'' (ti hēmin kai soi — literally ''what to us and to you?'' a Semitic formula for hostile confrontation). ''Destroy'' (apolesai — annihilate, ruin). ''I know thee'' (oida se — I know with certainty). ''The Holy One of God'' (ho hagios tou theou) — the demon recognises Jesus'' true identity. The switch from ''us'' to ''I'' may suggest the demon speaks for the demonic realm collectively and then individually. Demons possess supernatural knowledge but not saving faith.',
   NULL),
  (25, 'And Jesus rebuked him, saying, Hold thy peace, and come out of him.',
   'καὶ ἐπετίμησεν αὐτῷ ὁ Ἰησοῦς λέγων φιμώθητι καὶ ἔξελθε ἐξ αὐτοῦ',
   'kai epetimēsen autō ho Iēsous legōn phimōthēti kai exelthe ex autou',
   '''Rebuked'' (epetimēsen — commanded sternly, censured). ''Hold thy peace'' (phimōthēti — be muzzled, be silenced; aorist passive imperative: shut up now and stay silent). ''Come out'' (exelthe — depart; aorist imperative: do it immediately). Jesus silences the demon''s testimony — not because it is false but because Jesus will not have his identity proclaimed by demonic forces. This is the messianic secret: Jesus controls the revelation of his identity.',
   NULL),
  (26, 'And when the unclean spirit had torn him, and cried with a loud voice, he came out of him.',
   'καὶ σπαράξαν αὐτὸν τὸ πνεῦμα τὸ ἀκάθαρτον καὶ κράξαν φωνῇ μεγάλῃ ἐξῆλθεν ἐξ αὐτοῦ',
   'kai sparaxan auton to pneuma to akatharton kai kraxan phōnē megalē exēlthen ex autou',
   '''Torn'' (sparaxan — convulsed, threw into spasms; the demon''s violent last act). ''Cried with a loud voice'' (kraxan phōnē megalē — screamed with a great shout). ''Came out'' — the exorcism is successful despite the demon''s resistance. The demon obeys Jesus'' command even while protesting. The violence of the departure demonstrates both the reality of the possession and the overwhelming power of Jesus'' authority.',
   NULL),
  (27, 'And they were all amazed, insomuch that they questioned among themselves, saying, What thing is this? what new doctrine is this? for with authority commandeth he even the unclean spirits, and they do obey him.',
   'καὶ ἐθαμβήθησαν πάντες ὥστε συζητεῖν πρὸς ἑαυτοὺς λέγοντας τί ἐστιν τοῦτο τίς ἡ διδαχὴ ἡ καινὴ αὕτη ὅτι κατ᾿ ἐξουσίαν καὶ τοῖς πνεύμασι τοῖς ἀκαθάρτοις ἐπιτάσσει καὶ ὑπακούουσιν αὐτῷ',
   'kai ethambēthēsan pantes hōste syzētein pros heautous legontas ti estin touto tis hē didachē hē kainē hautē hoti kat exousian kai tois pneumasi tois akathartois epitassei kai hypakouousin autō',
   '''Amazed'' (ethambēthēsan — astonished, terrified; a strong word implying fear mixed with wonder). ''Questioned among themselves'' (syzētein — debated, discussed). ''New doctrine'' (didachē kainē — new teaching; kainē means new in quality, not merely new in time). ''Commandeth'' (epitassei — orders, gives authoritative commands). ''They do obey'' (hypakouousin — they listen under, they submit to his authority). The crowd connects Jesus'' teaching authority (v.22) with his power over demons — both flow from the same source.',
   NULL),
  (28, 'And immediately his fame spread abroad throughout all the region round about Galilee.',
   'ἐξῆλθεν δὲ ἡ ἀκοὴ αὐτοῦ εὐθὺς πανταχοῦ εἰς ὅλην τὴν περίχωρον τῆς Γαλιλαίας',
   'exēlthen de hē akoē autou euthys pantachou eis holēn tēn perichōron tēs Galilaias',
   '''Fame'' (akoē — report, what is heard; literally ''the hearing of him''). ''Spread abroad'' (exēlthen — went out). ''Immediately'' (euthys) — even the spread of his reputation is marked by Mark''s urgency. ''Throughout all the region'' — from one synagogue in Capernaum, Jesus'' fame radiates across the entire Galilean region. The word cannot be contained.',
   NULL),
  (29, 'And forthwith, when they were come out of the synagogue, they entered into the house of Simon and Andrew, with James and John.',
   'καὶ εὐθέως ἐκ τῆς συναγωγῆς ἐξελθόντες ἦλθον εἰς τὴν οἰκίαν Σίμωνος καὶ Ἀνδρέου μετὰ Ἰακώβου καὶ Ἰωάννου',
   'kai eutheōs ek tēs synagōgēs exelthontes ēlthon eis tēn oikian Simōnos kai Andreou meta Iakōbou kai Iōannou',
   '''Forthwith'' (eutheōs — immediately; the action moves without pause from synagogue to home). ''House of Simon and Andrew'' — Peter and Andrew shared a house in Capernaum, which became Jesus'' base of operations. The four newly called disciples (Simon, Andrew, James, John) are all present. The scene shifts from public ministry (synagogue) to private (home), but Jesus'' authority operates in both settings.',
   NULL),
  (30, 'But Simon''s wife''s mother lay sick of a fever, and anon they tell him of her.',
   'ἡ δὲ πενθερὰ Σίμωνος κατέκειτο πυρέσσουσα καὶ εὐθέως λέγουσιν αὐτῷ περὶ αὐτῆς',
   'hē de penthera Simōnos katekeito pyressousa kai eutheōs legousin autō peri autēs',
   '''Wife''s mother'' (penthera — mother-in-law; incidentally confirming that Peter was married, cf. 1 Corinthians 9:5). ''Lay sick'' (katekeito — was lying down, bedridden; imperfect: she had been ill). ''Of a fever'' (pyressousa — burning with fever). ''Anon'' (eutheōs — immediately). ''They tell him'' — a simple, direct request; no elaborate plea, just informing Jesus of the need. Sometimes the simplest prayers are the most effective.',
   NULL),
  (31, 'And he came and took her by the hand, and lifted her up; and immediately the fever left her, and she ministered unto them.',
   'καὶ προσελθὼν ἤγειρεν αὐτὴν κρατήσας τῆς χειρός αὐτῆς καὶ ἀφῆκεν αὐτὴν ὁ πυρετὸς εὐθέως καὶ διηκόνει αὐτοῖς',
   'kai proselthōn ēgeiren autēn kratēsas tēs cheiros autēs kai aphēken autēn ho pyretos eutheōs kai diēkonei autois',
   '''Took her by the hand'' (kratēsas tēs cheiros — grasped her hand; a physical, personal touch). ''Lifted her up'' (ēgeiren — raised her; the same verb used for resurrection, egeirō). ''Immediately the fever left'' — the healing is instant and complete. ''She ministered'' (diēkonei — she began serving them; imperfect: she kept serving). The completeness of the cure is demonstrated by her immediate ability to serve — no convalescence needed. Her response to healing is service.',
   NULL),
  (32, 'And at even, when the sun did set, they brought unto him all that were diseased, and them that were possessed with devils.',
   'ὀψίας δὲ γενομένης ὅτε ἔδυ ὁ ἥλιος ἔφερον πρὸς αὐτὸν πάντας τοὺς κακῶς ἔχοντας καὶ τοὺς δαιμονιζομένους',
   'opsias de genomenēs hote edy ho hēlios epheron pros auton pantas tous kakōs echontas kai tous daimonizomenous',
   '''At even, when the sun did set'' — the Sabbath ended at sunset, so people could now carry their sick without violating Sabbath law. ''They brought'' (epheron — they were carrying; imperfect: they kept bringing, a continuous stream). ''Diseased'' (kakōs echontas — those having it badly, those in poor condition). ''Possessed with devils'' (daimonizomenous — demonised, under demonic influence). Mark distinguishes illness from demon possession as separate categories.',
   NULL),
  (33, 'And all the city was gathered together at the door.',
   'καὶ ἦν ὅλη ἡ πόλις ἐπισυνηγμένη πρὸς τὴν θύραν',
   'kai ēn holē hē polis episynēgmenē pros tēn thyran',
   '''All the city'' (holē hē polis — the whole city; vivid Markan hyperbole). ''Gathered together at the door'' (episynēgmenē pros tēn thyran — assembled, crowded at the entrance). The scene is dramatic: the entire population of Capernaum pressed around the doorway of Simon''s house. Peter''s home has become a makeshift hospital. Mark paints the picture of overwhelming need meeting overwhelming power.',
   NULL),
  (34, 'And he healed many that were sick of divers diseases, and cast out many devils; and suffered not the devils to speak, because they knew him.',
   'καὶ ἐθεράπευσεν πολλοὺς κακῶς ἔχοντας ποικίλαις νόσοις καὶ δαιμόνια πολλὰ ἐξέβαλεν καὶ οὐκ ἤφιεν λαλεῖν τὰ δαιμόνια ὅτι ᾔδεισαν αὐτόν',
   'kai etherapeusen pollous kakōs echontas poikilais nosois kai daimonia polla exebalen kai ouk ēphien lalein ta daimonia hoti ēdeisan auton',
   '''Healed many'' (etherapeusen pollous — cured many). ''Divers diseases'' (poikilais nosois — various, diverse illnesses). ''Cast out many devils'' — a summary statement of extensive exorcism ministry. ''Suffered not the devils to speak'' (ouk ēphien lalein — did not permit them to speak). ''Because they knew him'' (ēdeisan auton — they knew his identity). The messianic secret again: demons know who Jesus is, but Jesus silences them. He will reveal his identity on his own terms, not through demonic testimony.',
   NULL),
  (35, 'And in the morning, rising up a great while before day, he went out, and departed into a solitary place, and there prayed.',
   'καὶ πρωῒ ἔννυχα λίαν ἀναστὰς ἐξῆλθεν καὶ ἀπῆλθεν εἰς ἔρημον τόπον κἀκεῖ προσηύχετο',
   'kai prōi ennycha lian anastas exēlthen kai apēlthen eis erēmon topon kakei prosēucheto',
   '''A great while before day'' (ennycha lian — while it was still very dark, in the deep night). ''Solitary place'' (erēmon topon — a deserted, isolated place). ''Prayed'' (prosēucheto — was praying; imperfect: he continued praying, extended prayer). After a night of intense ministry, Jesus rises before dawn to pray. This is remarkable: the one with all authority seeks the Father in secret. Prayer is not a sign of weakness but the source of Jesus'' power.',
   'This verse reveals a crucial pattern in Jesus'' life: intense public ministry followed by intense private prayer. Jesus does not pray despite having authority — he prays because of who he is. The Son''s communion with the Father is not optional but essential. Mark shows that Jesus'' authority in teaching (v.22), over demons (v.27), and over disease (v.34) flows from his relationship with the Father, sustained through prayer. This pattern challenges every disciple: if the Son of God needed extended prayer, how much more do we?'),
  (36, 'And Simon and they that were with him followed after him.',
   'καὶ κατεδίωξαν αὐτὸν ὁ Σίμων καὶ οἱ μετ᾿ αὐτοῦ',
   'kai katediōxan auton ho Simōn kai hoi met autou',
   '''Followed after'' (katediōxan — hunted him down, tracked him; a strong word suggesting urgency and effort). Simon leads the search party. The disciples'' eagerness contrasts with Jesus'' deliberate withdrawal. They wanted Jesus to capitalise on his popularity; Jesus had a different priority.',
   NULL),
  (37, 'And when they had found him, they said unto him, All men seek for thee.',
   'καὶ εὑρόντες αὐτὸν λέγουσιν αὐτῷ ὅτι πάντες σε ζητοῦσιν',
   'kai heurontes auton legousin autō hoti pantes se zētousin',
   '''All men seek for thee'' (pantes se zētousin — everyone is looking for you). The disciples assume popularity is the goal and that Jesus should return to Capernaum to meet the crowd''s demands. But Jesus has sought the Father''s direction in prayer and has a different plan.',
   NULL),
  (38, 'And he said unto them, Let us go into the next towns, that I may preach there also: for therefore came I forth.',
   'καὶ λέγει αὐτοῖς ἄγωμεν εἰς τὰς ἐχομένας κωμοπόλεις ἵνα κἀκεῖ κηρύξω εἰς τοῦτο γὰρ ἐξελήλυθα',
   'kai legei autois agōmen eis tas echomenas kōmopoleis hina kakei kēryxō eis touto gar exelēlytha',
   '''Let us go'' (agōmen — let us be going; hortatory subjunctive: an invitation to join him). ''Next towns'' (kōmopoleis — market towns, larger villages). ''That I may preach'' (kēryxō — proclaim as a herald). ''Therefore came I forth'' (exelēlytha — I have come out; perfect tense: this is my settled purpose). Jesus refuses to be confined to one location or to be driven by crowd demands. His mission is to preach the kingdom throughout the region — and ultimately the world.',
   NULL),
  (39, 'And he preached in their synagogues throughout all Galilee, and cast out devils.',
   'καὶ ἦν κηρύσσων ἐν ταῖς συναγωγαῖς αὐτῶν εἰς ὅλην τὴν Γαλιλαίαν καὶ τὰ δαιμόνια ἐκβάλλων',
   'kai ēn kēryssōn en tais synagōgais autōn eis holēn tēn Galilaian kai ta daimonia ekballōn',
   'A summary verse covering Jesus'' wider Galilean ministry. ''Preached'' (kēryssōn — heralding, proclaiming). ''Throughout all Galilee'' — the scope expands from Capernaum to the entire region. ''Cast out devils'' — exorcism accompanies proclamation as visible evidence of the kingdom''s power. Where the kingdom is preached, demonic strongholds are broken.',
   NULL),
  (40, 'And there came a leper to him, beseeching him, and kneeling down to him, and saying unto him, If thou wilt, thou canst make me clean.',
   'καὶ ἔρχεται πρὸς αὐτὸν λεπρὸς παρακαλῶν αὐτὸν καὶ γονυπετῶν αὐτὸν καὶ λέγων αὐτῷ ὅτι ἐὰν θέλῃς δύνασαί με καθαρίσαι',
   'kai erchetai pros auton lepros parakalōn auton kai gonypetōn auton kai legōn autō hoti ean thelēs dynasai me katharisai',
   '''Leper'' (lepros — one afflicted with a skin disease; Leviticus 13-14 made lepers ceremonially unclean and socially isolated). ''Beseeching'' (parakalōn — begging, earnestly requesting). ''Kneeling'' (gonypetōn — falling on his knees; an act of desperate reverence). ''If thou wilt'' (ean thelēs — if you are willing). ''Thou canst'' (dynasai — you are able). The leper has no doubt about Jesus'' power — only about his willingness. The question is not ''Can you?'' but ''Will you?''',
   NULL),
  (41, 'And Jesus, moved with compassion, put forth his hand, and touched him, and saith unto him, I will; be thou clean.',
   'ὁ δὲ Ἰησοῦς σπλαγχνισθεὶς ἐκτείνας τὴν χεῖρα ἥψατο αὐτοῦ καὶ λέγει αὐτῷ θέλω καθαρίσθητι',
   'ho de Iēsous splanchnistheis ekteinas tēn cheira hēpsato autou kai legei autō thelō katharisthēti',
   '''Moved with compassion'' (splanchnistheis — deeply moved in his inner being; from splanchna, the viscera/bowels — the seat of deepest emotion). ''Put forth his hand'' — a deliberate, purposeful action. ''Touched him'' (hēpsato — made physical contact). Touching a leper made one ceremonially unclean (Leviticus 5:3), but instead of Jesus becoming unclean, the leper becomes clean. ''I will'' (thelō — I am willing; answering the leper''s ''if thou wilt''). ''Be thou clean'' (katharisthēti — be cleansed; aorist passive imperative: be made clean now). Jesus'' willingness matches his power.',
   'This healing is profoundly Christological. Under the Mosaic law, contact with a leper brought defilement (Leviticus 13:45-46). But when Jesus touches the leper, the flow of impurity is reversed: instead of uncleanness spreading to Jesus, cleanness spreads from Jesus. This reveals something fundamental about the incarnation — the holy Son of God enters the world''s uncleanness not to be contaminated by it but to purify it. Compassion (splanchnistheis) motivates the touch; authority (thelō, katharisthēti) accomplishes the cure.'),
  (42, 'And as soon as he had spoken, immediately the leprosy departed from him, and he was cleansed.',
   'καὶ εἰπόντος αὐτοῦ εὐθέως ἀπῆλθεν ἀπ᾿ αὐτοῦ ἡ λέπρα καὶ ἐκαθαρίσθη',
   'kai eipontos autou eutheōs apēlthen ap autou hē lepra kai ekatharisthē',
   '''As soon as he had spoken'' — the healing is instantaneous, occurring at the very moment of Jesus'' word. ''Immediately'' (eutheōs — at once). ''The leprosy departed'' (apēlthen hē lepra — the disease went away). ''He was cleansed'' (ekatharisthē — he was made clean; passive: cleansing was done to him by divine power). Word and deed are united: Jesus speaks and it is done.',
   NULL),
  (43, 'And he straitly charged him, and forthwith sent him away;',
   'καὶ ἐμβριμησάμενος αὐτῷ εὐθέως ἐξέβαλεν αὐτόν',
   'kai embrimēsamenos autō eutheōs exebalen auton',
   '''Straitly charged'' (embrimēsamenos — sternly warned, spoke with deep feeling; the word conveys intense emotion, perhaps indignation at the disease or deep concern about what would happen if the man disobeyed). ''Sent him away'' (exebalen — drove out, expelled; the same strong verb used for casting out demons). Jesus urgently dismisses the man with a stern warning, demonstrating the seriousness of the messianic secret.',
   NULL),
  (44, 'And saith unto him, See thou say nothing to any man: but go thy way, shew thyself to the priest, and offer for thy cleansing those things which Moses commanded, for a testimony unto them.',
   'καὶ λέγει αὐτῷ ὅρα μηδενὶ μηδὲν εἴπῃς ἀλλὰ ὕπαγε σεαυτὸν δεῖξον τῷ ἱερεῖ καὶ προσένεγκε περὶ τοῦ καθαρισμοῦ σου ἃ προσέταξεν Μωσῆς εἰς μαρτύριον αὐτοῖς',
   'kai legei autō hora mēdeni mēden eipēs alla hypage seauton deixon tō hierei kai prosenenke peri tou katharismou sou ha prosetaxen Mōsēs eis martyrion autois',
   '''Say nothing to any man'' — the messianic secret at its most emphatic: double negative (mēdeni mēden — to no one, nothing). ''Shew thyself to the priest'' — Jesus honours the Mosaic law (Leviticus 14:1-32, the ritual for cleansed lepers). ''Offer for thy cleansing'' — the prescribed sacrifices. ''For a testimony unto them'' (eis martyrion autois — as evidence to them; the priests would officially verify the cure, providing legal proof of healing). Jesus respects the established order even while inaugurating a new one.',
   NULL),
  (45, 'But he went out, and began to publish it much, and to blaze abroad the matter, insomuch that Jesus could no more openly enter into the city, but was without in desert places: and they came to him from every quarter.',
   'ὁ δὲ ἐξελθὼν ἤρξατο κηρύσσειν πολλὰ καὶ διαφημίζειν τὸν λόγον ὥστε μηκέτι αὐτὸν δύνασθαι φανερῶς εἰς πόλιν εἰσελθεῖν ἀλλ᾿ ἔξω ἐν ἐρήμοις τόποις ἦν καὶ ἤρχοντο πρὸς αὐτὸν πανταχόθεν',
   'ho de exelthōn ērxato kēryssein polla kai diaphēmizein ton logon hōste mēketi auton dynasthai phanerōs eis polin eiselthein all exō en erēmois topois ēn kai ērchonto pros auton pantachothen',
   '''Began to publish it much'' (ērxato kēryssein polla — began to proclaim many things). ''Blaze abroad'' (diaphēmizein — spread the word widely). The healed man disobeys Jesus'' command, and the consequence is that Jesus can no longer enter the city openly. The roles are reversed: Jesus was in the wilderness (v.4), came to the city; now the leper is in the city, and Jesus is in the wilderness. ''They came to him from every quarter'' (pantachothen — from all directions) — yet even in desert places, Jesus cannot escape the crowds.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 1;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 gospel
  ('εὐαγγέλιον', 'euangelion', 'G2098', 'Gospel, good news, glad tidings — from eu (good, well) + angelion (message). Originally used in the Greco-Roman world for imperial proclamations of victory or a new emperor''s accession. Mark adopts this politically charged term for the message about Jesus: the true King has arrived, and his victory over sin, death, and Satan is the ultimate ''good news.'' Mark uses euangelion more than any other Gospel writer (8 times), framing the entire narrative as ''the gospel of Jesus Christ.''', 1),
  -- v.10 immediately
  ('εὐθύς', 'euthys', 'G2117', 'Immediately, straightway, at once — Mark''s signature word, appearing over 40 times in his Gospel (11 times in chapter 1 alone). It creates a breathless pace, rushing the reader from one mighty act to the next. Mark presents a Jesus who acts with urgency and decisive power. The word reflects Mark''s likely audience of Roman Christians — people of action who valued directness and authority. It also conveys theological urgency: the kingdom has come and demands immediate response.', 2),
  -- v.15 repent
  ('μετανοέω', 'metanoeō', 'G3340', 'To repent, change one''s mind, turn from sin — from meta (after, change) + noeō (to think, perceive). More than remorse or regret, metanoia is a fundamental reorientation of the whole person: mind, will, and direction. In Jesus'' preaching, repentance is paired with belief (pisteuete) — it is not merely turning from sin but turning to God through the gospel. Repentance is the human response to the divine announcement that the kingdom has arrived.', 3),
  -- v.22 authority
  ('ἐξουσία', 'exousia', 'G1849', 'Authority, power, right to act — from exesti (it is permitted, it is lawful). Unlike dynamis (raw power), exousia denotes rightful, delegated or inherent authority. Jesus teaches not as a scribe who cites precedent but as one who has intrinsic authority — the authority of the Author himself. This exousia extends beyond teaching to command over demons (v.27), disease (v.31), and the natural order. It is the authority of the Son of God operating in the realm of the Son of Man.', 4),
  -- v.24 Holy One of God
  ('ἅγιος', 'hagios', 'G40', 'Holy, set apart, consecrated — from hagos (an awful thing, that which inspires religious awe). ''The Holy One of God'' (ho hagios tou theou) is a title recognising Jesus'' unique consecration and divine origin. In the OT, ''the Holy One'' is a title for God himself (Isaiah 1:4, Habakkuk 3:3). The demon''s use of this title reflects supernatural knowledge of Jesus'' true identity — knowledge that does not produce worship but terror. Even demons confess what many humans fail to see.', 5),
  -- v.35 prayed
  ('προσεύχομαι', 'proseuchomai', 'G4336', 'To pray, to offer prayer — from pros (toward, facing) + euchomai (to wish, vow). In Mark, Jesus prays at critical junctures: here after his first public ministry (1:35), before feeding the 5000 (6:46), and in Gethsemane before the cross (14:32-39). The imperfect tense (prosēucheto) indicates sustained, extended prayer. Jesus'' prayer life is not perfunctory but deeply relational — the Son communing with the Father. Mark alone records Jesus rising ''a great while before day'' to pray, emphasising the priority Jesus placed on this communion.', 6),
  -- v.41 moved with compassion
  ('σπλαγχνίζομαι', 'splanchnizomai', 'G4697', 'To be moved with compassion, to feel deep pity — from splanchna (the inner organs, bowels, viscera — considered the seat of deepest emotions in the ancient world). This is not mere sympathy but a visceral, gut-wrenching response to human suffering. In the Gospels, splanchnizomai is used almost exclusively of Jesus (or of God/Christ figures in parables). It moves Jesus to action: he does not merely feel compassion but acts on it — touching the untouchable, healing the incurable, feeding the hungry.', 7),
  -- v.4 baptize
  ('βαπτίζω', 'baptizō', 'G907', 'To baptize, to immerse, to dip — from baptō (to dip, to plunge). The word denotes complete submersion. John''s baptism was an outward sign of inward repentance, preparing people for the Messiah. Jesus'' baptism with the Holy Spirit (v.8) would be an inward transformation — not water on the body but the Spirit in the heart. The act of going under water and rising symbolises death to the old life and resurrection to the new (cf. Romans 6:3-4).', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 1
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 10
    WHEN 3 THEN 15
    WHEN 4 THEN 22
    WHEN 5 THEN 24
    WHEN 6 THEN 35
    WHEN 7 THEN 41
    WHEN 8 THEN 4
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 beginning of the gospel
  (1, 'John 1:1', 1),
  (1, 'Romans 1:1-4', 2),
  -- v.2 my messenger before thy face
  (2, 'Malachi 3:1', 3),
  (2, 'Exodus 23:20', 4),
  -- v.3 voice crying in the wilderness
  (3, 'Isaiah 40:3', 5),
  (3, 'John 1:23', 6),
  -- v.4 baptism of repentance
  (4, 'Acts 13:24', 7),
  (4, 'Acts 19:4', 8),
  -- v.6 Elijah's garb
  (6, '2 Kings 1:8', 9),
  (6, 'Malachi 4:5', 10),
  -- v.8 baptize with the Holy Ghost
  (8, 'Acts 1:5', 11),
  (8, 'Acts 2:1-4', 12),
  (8, '1 Corinthians 12:13', 13),
  -- v.10 Spirit descending
  (10, 'John 1:32-34', 14),
  (10, 'Isaiah 11:2', 15),
  -- v.11 beloved Son
  (11, 'Psalm 2:7', 16),
  (11, 'Isaiah 42:1', 17),
  (11, 'Matthew 3:17', 18),
  -- v.12 Spirit driveth into wilderness
  (12, 'Matthew 4:1', 19),
  (12, 'Luke 4:1', 20),
  -- v.13 forty days tempted
  (13, 'Genesis 3:1-6', 21),
  (13, 'Hebrews 4:15', 22),
  -- v.15 the time is fulfilled
  (15, 'Galatians 4:4', 23),
  (15, 'Daniel 2:44', 24),
  (15, 'Matthew 4:17', 25),
  -- v.17 fishers of men
  (17, 'Matthew 4:19', 26),
  (17, 'Luke 5:10', 27),
  -- v.22 taught with authority
  (22, 'Matthew 7:28-29', 28),
  (22, 'John 7:46', 29),
  -- v.24 Holy One of God
  (24, 'Luke 4:34', 30),
  (24, 'John 6:69', 31),
  -- v.34 suffered not devils to speak
  (34, 'Mark 3:11-12', 32),
  (34, 'Acts 16:17-18', 33),
  -- v.35 rising early to pray
  (35, 'Luke 5:16', 34),
  (35, 'Mark 6:46', 35),
  -- v.38 therefore came I forth
  (38, 'Luke 4:43', 36),
  (38, 'John 18:37', 37),
  -- v.40 if thou wilt
  (40, 'Leviticus 13:45-46', 38),
  (40, 'Luke 5:12-13', 39),
  -- v.41 I will be thou clean
  (41, '2 Kings 5:10-14', 40),
  (41, 'Matthew 8:3', 41),
  -- v.44 shew thyself to the priest
  (44, 'Leviticus 14:1-32', 42),
  (44, 'Matthew 8:4', 43)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 1
  AND v.verse_number = cr.verse_number;
