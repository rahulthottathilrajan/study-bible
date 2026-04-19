-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 1 — Jesus Christ: The Promised Messiah, Son of David and God Incarnate
-- 25 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Matthew 1 serves as the foundational chapter for the Gospel, presenting Jesus Christ''s identity through two primary lenses: His royal lineage and His miraculous, divine birth. The extensive genealogy (vv. 1-17) meticulously traces Jesus'' ancestry back to Abraham, emphasizing His fulfillment of Old Testament promises to Abraham and David, thereby establishing His legitimate claim as the Messiah and King of Israel. This is followed by the narrative of Jesus'' supernatural conception by the Holy Spirit and His birth to the Virgin Mary (vv. 18-25), which underscores His unique divine nature and humanity. Joseph''s righteous character and obedience to God''s angelic instruction are highlighted, setting the stage for Jesus'' role as ''God with us'' and the Savior who will deliver His people from their sins. The chapter thus firmly grounds Jesus'' person and mission in both historical continuity and divine intervention, preparing the reader for the unfolding narrative of His life and ministry.',
  'Jesus Christ: The Promised Messiah, Son of David and God Incarnate',
  'Ἰησοῦς (Iēsoûs)',
  'From Hebrew ''Yeshua'' (Joshua), meaning ''Yahweh saves.'' This name is divinely appointed for Jesus because ''he shall save his people from their sins'' (Matt 1:21). It signifies His primary mission as the divine deliverer and redeemer, fulfilling the covenant promises of God to His people and demonstrating God''s active intervention in human history.',
  '["Section 1 (vv. 1-17): The Genealogy of Jesus Christ","Section 2 (vv. 1-6): From Abraham to David: The Patriarchal and Royal Line","Section 3 (vv. 7-11): From David to the Babylonian Exile: The Divided Kingdom and Decline","Section 4 (vv. 12-17): From the Exile to Christ: The Post-Exilic Period and Messianic Expectation","Section 5 (vv. 18-21): The Supernatural Conception and Naming of Jesus","Section 6 (vv. 22-23): Prophetic Fulfillment: Emmanuel, God With Us","Section 7 (vv. 24-25): Joseph''s Obedience and the Birth of Jesus"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'The book of the generation of Jesus Christ, the son of David, the son of Abraham.',
   'Βίβλος γενέσεως Ἰησοῦ Χριστοῦ, υἱοῦ Δαυὶδ, υἱοῦ Ἀβραάμ.',
   'Bíblos genéseōs Iēsoû Christoû, huioû Dauìd, huioû Abraám.',
   'This opening verse immediately establishes Jesus'' identity and lineage. ''Βίβλος γενέσεως'' (biblos geneseos) can mean ''book of generation'' or ''account of origin,'' echoing Genesis 5:1. It presents Jesus as the fulfillment of Old Testament promises, particularly to David (2 Sam 7:12-16; Ps 89:3-4) and Abraham (Gen 12:3; 22:18). Matthew emphasizes Jesus'' royal and covenantal heritage from the outset, setting the stage for His claim as Messiah.',
   'This verse is foundational, asserting Jesus'' dual nature as both fully human (through His lineage) and divinely appointed (as ''Christ,'' the Anointed One). It highlights God''s faithfulness in fulfilling His ancient promises through a specific historical person, Jesus, who is the culmination of salvation history.'),
  (2,
   'Abraham begat Isaac; and Isaac begat Jacob; and Jacob begat Judas and his brethren;',
   'Ἀβραὰμ ἐγέννησεν τὸν Ἰσαάκ· Ἰσαὰκ δὲ ἐγέννησεν τὸν Ἰακώβ· Ἰακὼβ δὲ ἐγέννησεν τὸν Ἰούδαν καὶ τοὺς ἀδελφοὺς αὐτοῦ·',
   'Abraàm egénnēsen tòn Isaák; Isaák dè egénnēsen tòn Iakṓb; Iakṑb dè egénnēsen tòn Ioúdan kaì toùs adelphoùs autoû.',
   'The genealogy begins with Abraham, the patriarch of Israel, emphasizing Jesus'' connection to God''s covenant with him (Gen 12:1-3). The phrase ''ἐγέννησεν'' (egennēsen, ''begat'') is repeated throughout, signifying physical descent. The mention of ''Judas and his brethren'' highlights the origin of the twelve tribes, with the royal line stemming from Judah, as prophesied in Genesis 49:10.',
   NULL),
  (3,
   'And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;',
   'Ἰούδας δὲ ἐγέννησεν τὸν Φάρες καὶ τὸν Ζάρα ἐκ τῆς Θάμαρ· Φάρες δὲ ἐγέννησεν τὸν Ἑσρώμ· Ἑσρὼμ δὲ ἐγέννησεν τὸν Ἀράμ·',
   'Ioúdas dè egénnēsen tòn Pháres kaì tòn Zára ek tês Thámar; Pháres dè egénnēsen tòn Hesrṓm; Hesrṑm dè egénnēsen tòn Arám.',
   'Thamar (Tamar) is the first of four women mentioned in Matthew''s genealogy, all of whom have unusual or scandalous circumstances surrounding their inclusion (Gen 38). Her presence underscores God''s ability to work through imperfect human situations and highlights the theme of grace and inclusion, foreshadowing the unexpected nature of Jesus'' birth and mission. This inclusion also demonstrates Matthew''s willingness to present a realistic, rather than idealized, lineage for the Messiah.',
   NULL),
  (4,
   'And Aram begat Aminadab; and Aminadab begat Naasson; and Naasson begat Salmon;',
   'Ἀρὰμ δὲ ἐγέννησεν τὸν Ἀμιναδάβ· Ἀμιναδὰβ δὲ ἐγέννησεν τὸν Ναασσών· Ναασσὼν δὲ ἐγέννησεν τὸν Σαλμών·',
   'Aràm dè egénnēsen tòn Aminadáb; Aminadàb dè egénnēsen tòn Naassṓn; Naassṑn dè egénnēsen tòn Salmṓn.',
   'These names continue the lineage, moving towards the period of the Exodus and the wilderness wanderings. Aminadab is mentioned in Exodus 6:23 as the father-in-law of Aaron, and Naasson (Nahshon) is identified as a prince of the tribe of Judah and a leader during the Exodus (Num 1:7; 2:3). This connection further solidifies the royal and priestly heritage within Jesus'' ancestry.',
   NULL),
  (5,
   'And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse;',
   'Σαλμὼν δὲ ἐγέννησεν τὸν Βόοζ ἐκ τῆς Ῥαχάβ· Βόοζ δὲ ἐγέννησεν τὸν Ὀβὴδ ἐκ τῆς Ῥούθ· Ὀβὴδ δὲ ἐγέννησεν τὸν Ἰεσσαί·',
   'Salmṑn dè egénnēsen tòn Bóoz ek tês Rhacháb; Bóoz dè egénnēsen tòn Obḕd ek tês Rhoúth; Obḕd dè egénnēsen tòn Iessaí.',
   'Rachab (Rahab) and Ruth are the second and third women mentioned. Rahab, a Gentile prostitute from Jericho (Josh 2), and Ruth, a Moabitess (Ruth 1:4), both represent outsiders brought into God''s covenant people. Their inclusion highlights God''s universal redemptive plan, extending beyond ethnic Israel, and foreshadows the Gentile inclusion in the church. Their stories also involve unconventional circumstances, reinforcing the theme of divine grace working through human weakness.',
   NULL),
  (6,
   'And Jesse begat David the king; and David the king begat Solomon of her that had been the wife of Urias;',
   'Ἰεσσαὶ δὲ ἐγέννησεν τὸν Δαυὶδ τὸν βασιλέα· Δαυὶδ δὲ ὁ βασιλεὺς ἐγέννησεν τὸν Σολομῶντα ἐκ τῆς τοῦ Οὐρίου.',
   'Iessaì dè egénnēsen tòn Dauìd tòn basileá; Dauìd dè ho basileùs egénnēsen tòn Solomônta ek tês toû Ouríou.',
   'This verse marks a pivotal point, introducing David as ''the king'' and thus establishing Jesus'' royal lineage. The mention of ''her that had been the wife of Urias'' (Bathsheba) is the fourth woman, again highlighting a scandalous past (2 Sam 11). Matthew''s deliberate inclusion of these women, despite their controversial backgrounds, underscores God''s sovereignty and grace in working through human imperfection to bring about His perfect plan for the Messiah.',
   'The explicit identification of David as ''the king'' emphasizes Jesus'' fulfillment of the Davidic covenant (2 Sam 7:12-16), promising an eternal kingdom through David''s descendant. This establishes Jesus'' legitimate claim to the throne of Israel, not merely as a prophet or priest, but as the long-awaited King.'),
  (7,
   'And Solomon begat Roboam; and Roboam begat Abia; and Abia begat Asa;',
   'Σολομὼν δὲ ἐγέννησεν τὸν Ῥοβοάμ· Ῥοβοὰμ δὲ ἐγέννησεν τὸν Ἀβιά· Ἀβιὰ δὲ ἐγέννησεν τὸν Ἀσάφ·',
   'Solomṑn dè egénnēsen tòn Rhoboám; Rhoboàm dè egénnēsen tòn Abiá; Abià dè egénnēsen tòn Asáf.',
   'The genealogy continues through Solomon, David''s son, rather than Nathan, another son of David (Luke 3:31). This choice emphasizes the royal line of succession. Rehoboam''s reign marked the division of the kingdom (1 Kgs 12), a period of decline. The inclusion of these kings, some of whom were unfaithful, demonstrates God''s persistent work through flawed human leaders to preserve the Messianic line.',
   NULL),
  (8,
   'And Asa begat Josaphat; and Josaphat begat Joram; and Joram begat Ozias;',
   'Ἀσὰφ δὲ ἐγέννησεν τὸν Ἰωσαφάτ· Ἰωσαφὰτ δὲ ἐγέννησεν τὸν Ἰωράμ· Ἰωρὰμ δὲ ἐγέννησεν τὸν Ὀζίαν·',
   'Asàf dè egénnēsen tòn Iōsaphát; Iōsaphàt dè egénnēsen tòn Iōrám; Iōràm dè egénnēsen tòn Ozían.',
   'Here, Matthew omits three kings between Joram and Ozias (Uzziah): Ahaziah, Joash, and Amaziah (2 Kgs 8:25-14:21; 1 Chr 3:11-12). This omission is likely for stylistic or mnemonic purposes, to maintain the pattern of three sets of fourteen generations (Matt 1:17). Such selective genealogies were common in ancient times and do not invalidate the overall historical accuracy or theological purpose.',
   NULL),
  (9,
   'And Ozias begat Joatham; and Joatham begat Achaz; and Achaz begat Ezekias;',
   'Ὀζίας δὲ ἐγέννησεν τὸν Ἰωάθαμ· Ἰωάθαμ δὲ ἐγέννησεν τὸν Ἄχαζ· Ἄχαζ δὲ ἐγέννησεν τὸν Ἑζεκίαν·',
   'Ozías dè egénnēsen tòn Iōátham; Iōátham dè egénnēsen tòn Áchaz; Áchaz dè egénnēsen tòn Hezekían.',
   'This segment continues the line of Judean kings. Ozias (Uzziah) was a generally good king who later suffered from leprosy (2 Kgs 15:1-7). Ahaz was a wicked king who promoted idolatry (2 Kgs 16). Ezekias (Hezekiah) was a righteous king who initiated religious reforms (2 Kgs 18-20). The varied moral character of these ancestors underscores that God''s plan for the Messiah transcends human merit.',
   NULL),
  (10,
   'And Ezekias begat Manasses; and Manasses begat Amon; and Amon begat Josias;',
   'Ἑζεκίας δὲ ἐγέννησεν τὸν Μανασσῆ· Μανασσῆς δὲ ἐγέννησεν τὸν Ἀμών· Ἀμὼν δὲ ἐγέννησεν τὸν Ἰωσίαν·',
   'Hezekías dè egénnēsen tòn Manassê; Manassês dè egénnēsen tòn Amṓn; Amṑn dè egénnēsen tòn Iōsían.',
   'Manasses (Manasseh) was one of Judah''s most wicked kings, known for idolatry and child sacrifice (2 Kgs 21). Amon followed in his father''s wicked ways. Josias (Josiah), however, was a righteous king who led a significant spiritual revival (2 Kgs 22-23). This sequence further illustrates the fluctuating spiritual state of the Davidic line, yet God''s promise remained steadfast.',
   NULL),
  (11,
   'And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon:',
   'Ἰωσίας δὲ ἐγέννησεν τὸν Ἰεχονίαν καὶ τοὺς ἀδελφοὺς αὐτοῦ, ἐπὶ τῆς μετοικεσίας Βαβυλῶνος.',
   'Iōsías dè egénnēsen tòn Iechonían kaì toùs adelphoùs autoû, epì tês metoikesías Babylônos.',
   'This verse marks the second major division in Matthew''s genealogy: ''the carrying away to Babylon.'' Jechonias (Jehoiachin/Coniah) was a king of Judah who was exiled to Babylon (2 Kgs 24:15). The phrase ''and his brethren'' likely refers to his uncles or other royal relatives, or perhaps the general population taken into exile. This event was a significant turning point in Israelite history, marking the end of the Davidic monarchy in Jerusalem.',
   'The Babylonian exile represents a period of divine judgment for Israel''s unfaithfulness, yet God''s covenant promises, particularly to David, were not abrogated. The continuation of the Messianic line through Jechonias, despite the loss of the throne, demonstrates God''s unwavering commitment to His redemptive plan, even amidst national catastrophe.'),
  (12,
   'And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel;',
   'Μετὰ δὲ τὴν μετοικεσίαν Βαβυλῶνος, Ἰεχονίας ἐγέννησεν τὸν Σαλαθιήλ· Σαλαθιὴλ δὲ ἐγέννησεν τὸν Ζοροβάβελ·',
   'Metà dè tḕn metoikesían Babylônos, Iechonías egénnēsen tòn Salathiḗl; Salathiḕl dè egénnēsen tòn Zorobábel.',
   'The genealogy continues into the post-exilic period. Salathiel (Shealtiel) and Zorobabel (Zerubbabel) are prominent figures in the return from exile and the rebuilding of the temple (Ezra 3:2; Hag 1:1). Zerubbabel, a governor of Judah, was a key leader and a descendant of David, maintaining the royal lineage even without a king on the throne. This period was marked by renewed hope for the restoration of the Davidic kingdom.',
   NULL),
  (13,
   'And Zorobabel begat Abiud; and Abiud begat Eliakim; and Eliakim begat Azor;',
   'Ζοροβάβελ δὲ ἐγέννησεν τὸν Ἀβιούδ· Ἀβιοὺδ δὲ ἐγέννησεν τὸν Ἐλιακείμ· Ἐλιακεὶμ δὲ ἐγέννησεν τὸν Ἀζώρ·',
   'Zorobábel dè egénnēsen tòn Abioúd; Abioùd dè egénnēsen tòn Eliakeím; Eliakeìm dè egénnēsen tòn Azṓr.',
   'These names represent the generations following the return from exile, a period often referred to as the ''silent years'' between the Old and New Testaments. While these individuals are not prominent biblical figures, their inclusion is crucial for demonstrating the unbroken chain of descent from David to Jesus, fulfilling the covenant promises. The meticulous record-keeping underscores the divine hand guiding history.',
   NULL),
  (14,
   'And Azor begat Sadoc; and Sadoc begat Achim; and Achim begat Eliud;',
   'Ἀζὼρ δὲ ἐγέννησεν τὸν Σαδώκ· Σαδὼκ δὲ ἐγέννησεν τὸν Ἀχείμ· Ἀχεὶμ δὲ ἐγέννησεν τὸν Ἐλιούδ·',
   'Azṑr dè egénnēsen tòn Sadṓk; Sadṑk dè egénnēsen tòn Acheím; Acheìm dè egénnēsen tòn Elioúd.',
   'The names continue the post-exilic lineage. The name ''Sadoc'' (Zadok) is reminiscent of the priestly line, though this genealogy traces the royal line through David. This period was characterized by a longing for the Messiah, who would restore Israel and fulfill all the promises of God. The careful recording of these generations would have been significant to a Jewish audience.',
   NULL),
  (15,
   'And Eliud begat Eleazar; and Eleazar begat Matthan; and Matthan begat Jacob;',
   'Ἐλιοὺδ δὲ ἐγέννησεν τὸν Ἐλεάζαρ· Ἐλεάζαρ δὲ ἐγέννησεν τὸν Μαθθάν· Μαθθὰν δὲ ἐγέννησεν τὸν Ἰακώβ·',
   'Elioùd dè egénnēsen tòn Eleázar; Eleázar dè egénnēsen tòn Matthán; Matthàn dè egénnēsen tòn Iakṓb.',
   'As the genealogy approaches its conclusion, the names become more familiar to the immediate ancestry of Jesus. Matthan and Jacob are Joseph''s grandfather and father, respectively. The consistent use of ''begat'' emphasizes the direct, physical lineage, which was vital for establishing Messianic claims in Jewish culture. This section bridges the gap from the exile to the birth of Jesus.',
   NULL),
  (16,
   'And Jacob begat Joseph the husband of Mary, of whom was born Jesus, who is called Christ.',
   'Ἰακὼβ δὲ ἐγέννησεν τὸν Ἰωσὴφ τὸν ἄνδρα Μαρίας, ἐξ ἧς ἐγεννήθη Ἰησοῦς ὁ λεγόμενος Χριστός.',
   'Iakṑb dè egénnēsen tòn Iōsḕph tòn ándra Marías, ex hês egennḗthē Iēsoûs ho legómenos Christós.',
   'This verse presents a crucial break in the genealogical pattern. Instead of ''Joseph begat Jesus,'' it states ''Jacob begat Joseph the husband of Mary, of whom was born Jesus.'' This carefully worded phrase underscores the virgin birth, indicating that Joseph was Jesus'' legal father but not His biological father. Mary is explicitly named, highlighting her unique role in the divine plan. Jesus is ''the one called Christ,'' affirming His Messianic identity.',
   'This verse is central to Christian doctrine, affirming both Jesus'' legal lineage through Joseph (connecting Him to David) and His miraculous, non-biological birth from Mary. It establishes His unique identity as the Christ, the Anointed One, born not of human will but by divine intervention, thus preserving His sinless nature and divine sonship.'),
  (17,
   'So all the generations from Abraham to David are fourteen generations; and from David until the carrying away into Babylon are fourteen generations; and from the carrying away into Babylon unto Christ are fourteen generations.',
   'Πᾶσαι οὖν αἱ γενεαὶ ἀπὸ Ἀβραὰμ ἕως Δαυὶδ γενεαὶ δεκατέσσαρες· καὶ ἀπὸ Δαυὶδ ἕως τῆς μετοικεσίας Βαβυλῶνος γενεαὶ δεκατέσσαρες· καὶ ἀπὸ τῆς μετοικεσίας Βαβυλῶνος ἕως τοῦ Χριστοῦ γενεαὶ δεκατέσσαρες.',
   'Pâsai oûn hai geneaì apò Abraàm héōs Dauìd geneaì dekatéssares; kaì apò Dauìd héōs tês metoikesías Babylônos geneaì dekatéssares; kaì apò tês metoikesías Babylônos héōs toû Christoû geneaì dekatéssares.',
   'Matthew concludes the genealogy by summarizing it into three sets of fourteen generations. This numerical structure (14 = 2 x 7, or the numerical value of David''s name in Hebrew, ''DVD'' = 4+6+4=14) is a mnemonic device and emphasizes the divine ordering of history leading to Christ. It reinforces Jesus'' identity as the Son of David and the culmination of God''s covenant promises, demonstrating God''s sovereign control over history.',
   'The structured genealogy highlights God''s purposeful and precise plan throughout history, culminating in Jesus Christ. The number fourteen, often associated with David, underscores Jesus'' Messianic claim and His fulfillment of the Davidic covenant, demonstrating that His arrival was not accidental but divinely orchestrated across generations.'),
  (18,
   'Now the birth of Jesus Christ was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Holy Ghost.',
   'Τοῦ δὲ Ἰησοῦ Χριστοῦ ἡ γένεσις οὕτως ἦν. Μνηστευθείσης γὰρ τῆς μητρὸς αὐτοῦ Μαρίας τῷ Ἰωσήφ, πρὶν ἢ συνελθεῖν αὐτοὺς, εὑρέθη ἐν γαστρὶ ἔχουσα ἐκ Πνεύματος Ἁγίου.',
   'Toû dè Iēsoû Christoû hē génesis hoútōs ên. Mnēsteutheísēs gàr tês mētròs autoû Marías tôi Iōsḗph, prìn ḕ syneltheîn autoùs, heuréthē en gastrì échousa ek Pneúmatos Hagíou.',
   'This verse shifts from genealogy to the narrative of Jesus'' birth. ''Γένεσις'' (genesis) here refers to ''birth'' or ''origin.'' Mary and Joseph were ''espoused'' (betrothed), a binding agreement akin to marriage but without cohabitation. The discovery of Mary''s pregnancy ''of the Holy Ghost'' (ek Pneumatos Hagiou) before they ''came together'' (synelthein autous) sets up the central theological claim of the virgin birth, emphasizing divine intervention.',
   'This verse introduces the miraculous conception of Jesus by the Holy Spirit, a core doctrine of Christianity. It asserts Jesus'' divine origin, distinguishing Him from all other humans. This supernatural birth ensures His sinless nature and unique status as the Son of God, essential for His role as the perfect sacrifice for humanity''s sins.'),
  (19,
   'Then Joseph her husband, being a just man, and not willing to make her a publick example, was minded to put her away privily.',
   'Ἰωσὴφ δὲ ὁ ἀνὴρ αὐτῆς, δίκαιος ὢν, καὶ μὴ θέλων αὐτὴν παραδειγματίσαι, ἐβουλήθη λάθρᾳ ἀπολῦσαι αὐτήν.',
   'Iōsḕph dè ho anḕr autês, díkaios ṑn, kaì mḕ thélōn autḕn paradeigmatísai, eboulethḗ láthrā apolûsai autḗn.',
   'Joseph is described as ''δίκαιος ὢν'' (dikaios ōn), ''being a just man.'' According to Jewish law, a betrothed woman found pregnant by another man could be publicly disgraced or even stoned (Deut 22:23-24). Joseph''s justice meant he couldn''t ignore the situation, but his compassion led him to ''put her away privily'' (láthrā apolûsai autḗn) to avoid public shame for Mary. This reveals his character as both righteous and merciful.',
   NULL),
  (20,
   'But while he thought on these things, behold, the angel of the LORD appeared unto him in a dream, saying, Joseph, thou son of David, fear not to take unto thee Mary thy wife: for that which is conceived in her is of the Holy Ghost.',
   'Ταῦτα δὲ αὐτοῦ ἐνθυμηθέντος, ἰδοὺ, ἄγγελος Κυρίου κατʼ ὄναρ ἐφάνη αὐτῷ, λέγων, Ἰωσὴφ, υἱὸς Δαυὶδ, μὴ φοβηθῇς παραλαβεῖν Μαριὰμ τὴν γυναῖκά σου· τὸ γὰρ ἐν αὐτῇ γεννηθὲν ἐκ Πνεύματός ἐστιν Ἁγίου.',
   'Taûta dè autoû enthymēthéntos, idoú, ággelos Kyríou katʼ ónar ephánē autôi, légōn, Iōsḕph, huiòs Dauìd, mḕ phobēthêis paralabeîn Mariàm tḕn gynaîká sou; tò gàr en autêi gennēthèn ek Pneúmatós estin Hagíou.',
   'While Joseph contemplated his difficult decision, an ''ἄγγελος Κυρίου'' (angelos Kyriou, ''angel of the Lord'') appeared to him in a dream. The angel addresses Joseph as ''son of David,'' reinforcing Jesus'' royal lineage and Joseph''s legal role. The angel''s message directly confirms Mary''s miraculous conception ''of the Holy Ghost,'' alleviating Joseph''s fears and revealing God''s direct involvement. This divine intervention guides Joseph''s actions.',
   'This angelic message confirms the divine paternity of Jesus, explicitly stating His conception ''of the Holy Ghost.'' It underscores God''s active involvement in bringing about the incarnation, bypassing human procreation to ensure Jesus'' unique identity as both fully God and fully man, without inherited sin.'),
  (21,
   'And she shall bring forth a son, and thou shalt call his name JESUS: for he shall save his people from their sins.',
   'Τέξεται δὲ υἱὸν, καὶ καλέσεις τὸ ὄνομα αὐτοῦ Ἰησοῦν· αὐτὸς γὰρ σώσει τὸν λαὸν αὐτοῦ ἀπὸ τῶν ἁμαρτιῶν αὐτῶν.',
   'Téxetai dè huiòn, kaì kaléseis tò ónoma autoû Iēsoûn; autòs gàr sṓsei tòn laòn autoû apò tôn hamartiôn autôn.',
   'The angel instructs Joseph to name the child ''Jesus'' (Ἰησοῦν), a Greek form of the Hebrew ''Yeshua'' or ''Joshua,'' meaning ''Yahweh saves.'' The reason for the name is explicitly given: ''for he shall save his people from their sins.'' This statement defines Jesus'' primary mission as a spiritual deliverer, not merely a political king. It highlights the core of the Gospel message: salvation from sin.',
   'The name ''Jesus'' and its meaning ''He saves'' encapsulate the essence of Christ''s mission: to deliver humanity from the bondage and penalty of sin. This verse establishes Jesus as the divine Savior, whose work is not merely to reform but to redeem, offering forgiveness and reconciliation with God through His atoning sacrifice.'),
  (22,
   'Now all this was done, that it might be fulfilled which was spoken of the Lord by the prophet, saying,',
   'Τοῦτο δὲ ὅλον γέγονεν, ἵνα πληρωθῇ τὸ ῥηθὲν ὑπὸ Κυρίου διὰ τοῦ προφήτου, λέγοντος,',
   'Toûto dè hólon gé gonen, hína plērōthêi tò rhēthèn hypò Kyríou dià toû prophḗtou, légontos,',
   'Matthew frequently emphasizes the fulfillment of Old Testament prophecy, a key theme in his Gospel. The phrase ''that it might be fulfilled'' (hína plērōthêi) appears multiple times, demonstrating that Jesus'' life and birth were not random events but the culmination of God''s long-foretold plan. This connects Jesus directly to the prophetic expectations of the Messiah, validating His claims for a Jewish audience.',
   NULL),
  (23,
   'Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, God with us.',
   'Ἰδοὺ, ἡ παρθένος ἐν γαστρὶ ἕξει, καὶ τέξεται υἱὸν, καὶ καλέσουσι τὸ ὄνομα αὐτοῦ Ἐμμανουήλ· ὅ ἐστι μεθερμηνευόμενον, Μεθʼ ἡμῶν ὁ Θεός.',
   'Idoù, hē parthénos en gastrì héxei, kaì téxetai huiòn, kaì kalésousi tò ónoma autoû Emmanouḗl; hó esti methermēneuómenon, Methʼ hēmôn ho Theós.',
   'This is a direct quotation from Isaiah 7:14, a crucial Messianic prophecy. Matthew interprets ''ἡ παρθένος'' (hē parthénos, ''the virgin'') as referring specifically to Mary. The name ''Emmanuel'' (Ἐμμανουήλ), meaning ''God with us'' (Meth'' hēmôn ho Theós), signifies Jesus'' divine nature and His intimate presence among humanity. This prophecy confirms the virgin birth and Jesus'' unique identity as God incarnate.',
   'This prophecy''s fulfillment in Jesus establishes the doctrine of the Incarnation: God taking on human flesh. ''Emmanuel, God with us,'' affirms Jesus'' full deity and His intimate, personal presence among His people. It signifies that in Jesus, God Himself has drawn near to humanity, bridging the gap created by sin and offering reconciliation through His divine-human person.'),
  (24,
   'Then Joseph being raised from sleep did as the angel of the Lord had bidden him, and took unto him his wife:',
   'Διεγερθεὶς δὲ ὁ Ἰωσὴφ ἀπὸ τοῦ ὕπνου, ἐποίησεν ὡς προσέταξεν αὐτῷ ὁ ἄγγελος Κυρίου, καὶ παρέλαβεν τὴν γυναῖκα αὐτοῦ·',
   'Diegertheìs dè ho Iōsḕph apò toû hýpnou, epoíēsen hōs prosétaxen autôi ho ággelos Kyríou, kaì parélaben tḕn gynaîka autoû;',
   'Joseph''s immediate obedience to the angelic instruction is a testament to his faith and righteousness. He ''did as the angel of the Lord had bidden him,'' taking Mary as his wife. This act publicly affirmed his acceptance of Mary and the child, protecting her reputation and legally establishing Jesus'' place in the Davidic line through Joseph. His obedience is a model of faith.',
   NULL),
  (25,
   'And knew her not till she had brought forth her firstborn son: and he called his name JESUS.',
   'καὶ οὐκ ἐγίνωσκεν αὐτὴν ἕως οὗ ἔτεκε τὸν υἱὸν αὐτῆς τὸν πρωτότοκον· καὶ ἐκάλεσε τὸ ὄνομα αὐτοῦ Ἰησοῦν.',
   'kaì ouk egínōsken autḕn héōs hoû éteke tòn huiòn autês tòn prōtótokon; kaì ekálese tò ónoma autoû Iēsoûn.',
   'The phrase ''knew her not till she had brought forth'' (ouk egínōsken autḕn héōs hoû éteke) confirms Mary''s virginity before Jesus'' birth, while also implying that Joseph and Mary had normal marital relations afterward. Jesus is called ''her firstborn son'' (tòn prōtótokon), which further suggests subsequent children. Joseph''s naming of Jesus fulfills the angel''s command (Matt 1:21) and legally establishes Jesus'' identity and lineage.',
   'This verse affirms Mary''s perpetual virginity until Jesus'' birth, safeguarding the unique nature of the Incarnation. The term ''firstborn'' (prōtótokon) highlights Jesus'' preeminence and legal status as the heir, while also suggesting the possibility of later siblings, a point of theological discussion regarding Mary''s post-birth virginity.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Βίβλος', 'Bíblos', 'G976', 'From ''byblos'' (papyrus), meaning ''a book'' or ''scroll.'' In this context, it refers to a written record or account. Here, ''Biblos geneseos'' signifies the ''book of the origin'' or ''account of the generation'' of Jesus Christ, echoing the Septuagint''s use in Genesis 5:1 for the ''book of the generations of Adam,'' thereby linking Jesus'' story to the broader narrative of creation and human history.', 1),
  ('γενέσεως', 'genéseōs', 'G1078', 'From ''ginomai'' (to become), meaning ''birth,'' ''origin,'' ''generation,'' or ''record of descent.'' In Matthew 1:1, it refers to the lineage or family history of Jesus, emphasizing His human ancestry. It can also imply the ''story of His origin,'' encompassing both His genealogy and His miraculous birth, setting the stage for the entire Gospel narrative.', 2),
  ('Ἰησοῦ', 'Iēsoû', 'G2424', 'The Greek form of the Hebrew name ''Yeshua'' or ''Joshua,'' meaning ''Yahweh saves'' or ''the Lord is salvation.'' This name is central to Jesus'' identity and mission, as explicitly stated in Matthew 1:21, where the angel declares He will ''save his people from their sins.'' It signifies His role as the divine deliverer and redeemer.', 3),
  ('Χριστοῦ', 'Christoû', 'G5547', 'From ''chriō'' (to anoint), meaning ''Anointed One'' or ''Messiah.'' This is not a surname but a title indicating Jesus'' divine appointment as the promised King, Prophet, and Priest. It signifies His fulfillment of Old Testament prophecies concerning the deliverer who would establish God''s eternal kingdom, emphasizing His unique role in salvation history.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Ἰωσὴφ', 'Iōsḕph', 'G2501', 'From the Hebrew name ''Yoseph,'' meaning ''he adds'' or ''may he add.'' Joseph is presented as the legal father of Jesus, connecting Jesus to the Davidic line through adoption. His role is crucial in providing legal legitimacy and protection for Mary and Jesus, demonstrating God''s use of human agents in His divine plan.', 1),
  ('ἄνδρα', 'ándra', 'G435', 'Meaning ''man'' or ''husband.'' In this context, it specifically refers to Joseph as Mary''s husband. The phrasing ''Joseph the husband of Mary'' is significant because it avoids stating that Joseph ''begat'' Jesus, subtly hinting at the virgin birth while maintaining Joseph''s legal and social role in Jesus'' family.', 2),
  ('Μαρίας', 'Marías', 'G3137', 'The Greek form of the Hebrew name ''Miriam,'' meaning ''bitter'' or ''rebellious,'' though often interpreted as ''exalted one.'' Mary is the mother of Jesus, uniquely chosen by God to conceive Him by the Holy Spirit. Her name signifies her pivotal role in the Incarnation, bringing forth the Savior of the world.', 3),
  ('ἐγεννήθη', 'egennḗthē', 'G1080', 'Aorist passive indicative of ''gennaō,'' meaning ''was born'' or ''was begotten.'' The passive voice here is crucial, indicating that Jesus ''was born'' from Mary, rather than ''begotten'' by Joseph. This grammatical construction subtly reinforces the virgin birth, emphasizing divine agency in Jesus'' conception through Mary.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Verse 18
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('γένεσις', 'génesis', 'G1078', 'Meaning ''birth,'' ''origin,'' or ''beginning.'' Here, it refers specifically to the circumstances surrounding Jesus'' birth. Unlike the genealogical ''generations'' in verse 1, this ''genesis'' describes the miraculous event of His conception and birth, marking a new beginning in salvation history and emphasizing its divine nature.', 1),
  ('Μνηστευθείσης', 'Mnēsteutheísēs', 'G3423', 'Participle from ''mnēsteuō,'' meaning ''to betroth'' or ''to espouse.'' Betrothal in Jewish culture was a legally binding agreement, more serious than modern engagement, requiring a formal divorce for dissolution. This legal status is vital for understanding Joseph''s dilemma and the social implications of Mary''s pregnancy before cohabitation.', 2),
  ('εὑρέθη', 'heuréthē', 'G2147', 'Aorist passive indicative of ''heuriskō,'' meaning ''was found'' or ''was discovered.'' This passive construction highlights that Mary''s pregnancy was an unexpected discovery, not a result of human planning. It underscores the mysterious and supernatural nature of her conception, emphasizing divine intervention rather than human action.', 3),
  ('Πνεύματος', 'Pneúmatos', 'G4151', 'From ''pneō'' (to breathe), meaning ''spirit,'' ''wind,'' or ''breath.'' Here, it refers to the Holy Spirit, the third person of the Trinity. The phrase ''ek Pneumatos Hagiou'' (''of the Holy Ghost'') signifies that Jesus'' conception was a direct, miraculous act of God, establishing His divine paternity and unique sinless nature.', 4),
  ('Ἁγίου', 'Hagíou', 'G40', 'Meaning ''holy,'' ''sacred,'' or ''set apart.'' As an adjective modifying ''Pneumatos'' (Spirit), it refers to the Holy Spirit, emphasizing His divine purity and distinctness. The Holy Spirit''s involvement in Jesus'' conception highlights the sacredness and supernatural character of the Incarnation, making Jesus uniquely holy.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = 18;

-- Verse 20
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄγγελος', 'ággelos', 'G32', 'Meaning ''messenger'' or ''angel.'' In biblical contexts, angels are spiritual beings who serve as God''s emissaries, delivering divine messages and carrying out His will. The appearance of an ''angel of the Lord'' (angelos Kyriou) signifies a direct, authoritative communication from God, confirming the divine nature of Mary''s pregnancy to Joseph.', 1),
  ('Κυρίου', 'Kyríou', 'G2962', 'Meaning ''Lord,'' ''master,'' or ''owner.'' In the New Testament, ''Kyrios'' is often used to refer to God (Yahweh) and later to Jesus Himself, signifying divine authority and sovereignty. Here, ''angelos Kyriou'' indicates that the message comes directly from God, carrying ultimate divine authority and truth.', 2),
  ('φοβηθῇς', 'phobēthêis', 'G5399', 'Aorist passive subjunctive of ''phobeō,'' meaning ''to fear'' or ''to be afraid.'' The angel''s command ''mḕ phobēthêis'' (''do not fear'') is a common biblical reassurance given in the presence of divine revelation. It addresses Joseph''s natural apprehension and moral dilemma, encouraging trust in God''s extraordinary plan.', 3),
  ('παραλαβεῖν', 'paralabeîn', 'G3880', 'Infinitive of ''paralambanō,'' meaning ''to take to oneself,'' ''to receive,'' or ''to take as a wife.'' The angel instructs Joseph to ''take unto thee Mary thy wife,'' signifying his acceptance of her as his legitimate spouse and the child as his legal son, thereby fulfilling his covenantal responsibilities despite the unusual circumstances.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = 20;

-- Verse 21
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('Τέξεται', 'Téxetai', 'G5088', 'Future indicative of ''tiktō,'' meaning ''she shall bring forth'' or ''she shall bear.'' This verb emphasizes the certainty of Mary giving birth to a son, fulfilling the prophecy of Isaiah 7:14. It highlights the natural, human aspect of Jesus'' birth, even amidst the supernatural conception, underscoring His full humanity.', 1),
  ('καλέσεις', 'kaléseis', 'G2564', 'Future indicative of ''kaleō,'' meaning ''you shall call'' or ''you shall name.'' The instruction for Joseph to name the child is significant, as naming conferred legal paternity and authority in Jewish culture. By naming Jesus, Joseph legally acknowledges Him as his son, thus connecting Jesus to the Davidic lineage.', 2),
  ('σώσει', 'sṓsei', 'G4982', 'Future indicative of ''sōzō,'' meaning ''he shall save,'' ''deliver,'' or ''preserve.'' This verb defines Jesus'' primary mission and the meaning of His name. He is the divine rescuer who will deliver His people, not from political oppression, but from the spiritual bondage and eternal consequences of their sins, offering true redemption.', 3),
  ('ἁμαρτιῶν', 'hamartiôn', 'G266', 'Plural of ''hamartia,'' meaning ''sins,'' ''trespasses,'' or ''missing the mark.'' This term refers to acts of disobedience against God''s law and the inherent human condition of rebellion against God. Jesus'' mission to save from ''sins'' highlights the spiritual nature of His redemption, addressing humanity''s deepest need for forgiveness and reconciliation.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = 21;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('παρθένος', 'parthénos', 'G3933', 'Meaning ''virgin'' or ''unmarried woman.'' Matthew''s use of this term in quoting Isaiah 7:14 is crucial for establishing the doctrine of the virgin birth. It signifies that Mary conceived Jesus without sexual intercourse, emphasizing the miraculous and supernatural nature of His origin, a key aspect of Christian theology regarding Jesus'' unique person.', 1),
  ('Ἐμμανουήλ', 'Emmanouḗl', 'G1694', 'A Hebrew name transliterated into Greek, meaning ''God with us.'' This prophetic name, quoted from Isaiah 7:14, encapsulates the theological significance of Jesus'' incarnation. It declares Jesus'' divine nature and His intimate presence among humanity, signifying that in Him, God Himself has come to dwell among His people, offering salvation and fellowship.', 2),
  ('μεθερμηνευόμενον', 'methermēneuómenon', 'G3177', 'Present passive participle of ''methermēneuō,'' meaning ''being interpreted'' or ''being translated.'' Matthew''s inclusion of the interpretation ''God with us'' for ''Emmanuel'' demonstrates his concern for his Greek-speaking audience, ensuring they understand the profound theological meaning of the name and its significance for Jesus'' identity.', 3),
  ('Θεός', 'Theós', 'G2316', 'Meaning ''God'' or ''a god.'' In the context of ''Emmanuel, God with us,'' ''Theos'' unequivocally refers to the one true God. This declaration affirms Jesus'' full deity, stating that He is not merely a representative of God but God Himself, incarnate in human flesh, a foundational truth of Christian faith.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = 23;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Genesis 5:1', 1),
  (1, 'Genesis 12:3', 2),
  (1, '2 Samuel 7:12-16', 3),
  (1, 'Isaiah 9:6-7', 4),
  (1, 'Luke 3:23-38', 5),
  (2, 'Genesis 21:2-3', 1),
  (2, 'Genesis 25:26', 2),
  (2, 'Genesis 29:35', 3),
  (2, 'Genesis 35:23-26', 4),
  (2, 'Genesis 49:10', 5),
  (3, 'Genesis 38:27-30', 1),
  (3, 'Ruth 4:18', 2),
  (3, '1 Chronicles 2:4-5', 3),
  (4, 'Numbers 1:7', 1),
  (4, 'Numbers 2:3', 2),
  (4, 'Ruth 4:19', 3),
  (4, '1 Chronicles 2:10', 4),
  (5, 'Joshua 2:1-21', 1),
  (5, 'Joshua 6:25', 2),
  (5, 'Ruth 4:13-22', 3),
  (5, '1 Samuel 16:1', 4),
  (6, '1 Samuel 17:12', 1),
  (6, '2 Samuel 12:24', 2),
  (6, '2 Samuel 11:3', 3),
  (6, '1 Chronicles 3:5', 4),
  (7, '1 Kings 11:43', 1),
  (7, '1 Kings 12:1-24', 2),
  (7, '1 Kings 15:1', 3),
  (7, '1 Chronicles 3:10', 4),
  (8, '1 Kings 15:24', 1),
  (8, '2 Kings 8:16', 2),
  (8, '2 Kings 15:1', 3),
  (8, '1 Chronicles 3:11', 4),
  (9, '2 Kings 15:32', 1),
  (9, '2 Kings 16:1', 2),
  (9, '2 Kings 18:1', 3),
  (9, '1 Chronicles 3:12-13', 4),
  (10, '2 Kings 20:21', 1),
  (10, '2 Kings 21:1', 2),
  (10, '2 Kings 21:18', 3),
  (10, '2 Kings 22:1', 4),
  (10, '1 Chronicles 3:14', 5),
  (11, '2 Kings 23:34', 1),
  (11, '2 Kings 24:14-15', 2),
  (11, 'Jeremiah 27:20', 3),
  (11, 'Jeremiah 29:2', 4),
  (12, '1 Chronicles 3:17', 1),
  (12, 'Ezra 3:2', 2),
  (12, 'Haggai 1:1', 3),
  (12, 'Zechariah 4:6-7', 4),
  (13, '1 Chronicles 3:19-24', 1),
  (16, 'Luke 1:27', 1),
  (16, 'Luke 2:5', 2),
  (16, 'John 1:45', 3),
  (16, 'Romans 1:3-4', 4),
  (17, 'Daniel 9:24-27', 1),
  (17, 'Galatians 4:4', 2),
  (18, 'Luke 1:27-35', 1),
  (18, 'John 1:13', 2),
  (18, 'Romans 1:3-4', 3),
  (19, 'Deuteronomy 22:23-24', 1),
  (19, 'Deuteronomy 24:1', 2),
  (20, 'Luke 1:35', 1),
  (20, 'Matthew 2:13', 2),
  (20, 'Matthew 2:19', 3),
  (20, 'Galatians 4:4', 4),
  (21, 'Luke 1:31', 1),
  (21, 'Acts 4:12', 2),
  (21, 'Acts 5:31', 3),
  (21, 'Romans 11:26', 4),
  (21, 'Titus 2:14', 5),
  (22, 'Isaiah 7:14', 1),
  (22, 'Matthew 2:15', 2),
  (22, 'Matthew 2:23', 3),
  (22, 'Matthew 4:14', 4),
  (23, 'Isaiah 7:14', 1),
  (23, 'Isaiah 8:8', 2),
  (23, 'John 1:14', 3),
  (23, '1 Timothy 3:16', 4),
  (24, 'Luke 1:38', 1),
  (24, 'Luke 1:45', 2),
  (24, 'Hebrews 11:8', 3),
  (25, 'Exodus 13:2', 1),
  (25, 'Luke 2:7', 2),
  (25, 'Luke 2:21', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 1 Complete!
-- 25 verses · 6 key verses with word studies (25 words)
-- Cross-references for 23 verses (85 refs)
-- ═══════════════════════════════════════════════════════