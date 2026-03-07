-- ═══════════════════════════════════════════════════
-- JOHN CHAPTER 2 — The Wedding at Cana and the Cleansing of the Temple
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  'John 2 records two powerful signs that reveal Jesus'' divine authority and mission. At a wedding feast in Cana of Galilee, Jesus performs his first miracle (vv.1-11): when the wine runs out, his mother informs him of the need. Jesus responds: ''Woman, what have I to do with thee? mine hour is not yet come'' (v.4). He commands the servants to fill six stone waterpots with water and instructs them to draw out and bear to the governor of the feast. The water has become wine — not ordinary wine, but the best: ''thou hast kept the good wine until now'' (v.10). ''This beginning of miracles did Jesus in Cana of Galilee, and manifested forth his glory; and his disciples believed on him'' (v.11). The miracle reveals Jesus as the Creator who transforms the old covenant (water of Jewish purification) into the new covenant (wine of messianic joy). After a brief stay in Capernaum (v.12), Jesus goes up to Jerusalem for the Passover and cleanses the Temple (vv.13-22). Finding merchants selling oxen, sheep, and doves, and moneychangers doing business, he makes a scourge of small cords and drives them all out: ''Take these things hence; make not my Father''s house an house of merchandise'' (v.16). The Jews demand a sign for his authority. Jesus answers: ''Destroy this temple, and in three days I will raise it up'' (v.19). The Jews scoff — the Temple took forty-six years to build. ''But he spake of the temple of his body'' (v.21). After his resurrection, the disciples remembered and believed (v.22). The chapter closes with a note on Jesus'' knowledge of men: ''many believed in his name'' when they saw his miracles, ''but Jesus did not commit himself unto them'' because ''he knew what was in man'' (vv.23-25).',
  'The First Sign and the Cleansing — Jesus Manifests His Glory and Zeal for the Father''s House',
  'σημεῖον (sēmeion)',
  'Sign, miracle, attesting wonder — from sēma (a mark, token). In John''s Gospel, miracles are not called dynameis (works of power, as in the Synoptics) but sēmeia (signs) — they are revelatory acts that point beyond themselves to a deeper spiritual reality. The water-to-wine miracle is the ''beginning of signs'' (archē tōn sēmeiōn, v.11), manifesting Jesus'' glory. Each sign in John reveals something about Jesus'' identity: Creator, Life-giver, Light of the World, Resurrection and Life. The signs are designed to produce faith (20:30-31).',
  '["The Wedding at Cana: Water Turned to Wine (vv.1-5): On the third day a marriage in Cana of Galilee. The mother of Jesus was there. Jesus and his disciples were called. When the wine failed his mother saith — They have no wine. Jesus saith — Woman what have I to do with thee? Mine hour is not yet come. His mother saith to the servants — Whatsoever he saith unto you do it","The First Miracle: The Best Wine Last (vv.6-11): Six waterpots of stone set after the manner of the purifying of the Jews containing two or three firkins apiece. Jesus saith Fill the waterpots with water. They filled them up to the brim. He saith Draw out now and bear unto the governor of the feast. The ruler tasted the water that was made wine. Every man at the beginning doth set forth good wine but thou hast kept the good wine until now. This beginning of miracles did Jesus in Cana and manifested forth his glory and his disciples believed on him","Down to Capernaum (v.12): After this he went down to Capernaum he and his mother and his brethren and his disciples and they continued there not many days","The Cleansing of the Temple (vv.13-17): The Jews'' passover was at hand and Jesus went up to Jerusalem. He found in the temple those that sold oxen and sheep and doves and the changers of money sitting. He made a scourge of small cords and drove them all out with the sheep and oxen and poured out the changers'' money and overthrew the tables. Take these things hence — make not my Father''s house an house of merchandise. His disciples remembered — The zeal of thine house hath eaten me up","Destroy This Temple (vv.18-22): The Jews answered — What sign shewest thou unto us seeing that thou doest these things? Jesus answered — Destroy this temple and in three days I will raise it up. Forty and six years was this temple in building and wilt thou rear it up in three days? But he spake of the temple of his body. When he was risen from the dead his disciples remembered and believed the scripture and the word which Jesus had said","Jesus Knows What Is in Man (vv.23-25): When he was in Jerusalem at the passover many believed in his name when they saw the miracles which he did. But Jesus did not commit himself unto them because he knew all men. He needed not that any should testify of man for he knew what was in man"]'
FROM books b WHERE b.name = 'John';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And the third day there was a marriage in Cana of Galilee; and the mother of Jesus was there:',
   'καὶ τῇ ἡμέρᾳ τῇ τρίτῃ γάμος ἐγένετο ἐν Κανᾶ τῆς Γαλιλαίας καὶ ἦν ἡ μήτηρ τοῦ Ἰησοῦ ἐκεῖ',
   'kai tē hēmera tē tritē gamos egeneto en Kana tēs Galilaias kai ēn hē mētēr tou Iēsou ekei',
   '''The third day'' (tē tritē hēmera — counting from 1:43; some scholars see a symbolic echo of the resurrection ''on the third day''). Cana of Galilee — a small village in the Galilean hill country, distinct from Kanah in Asher. ''The mother of Jesus was there'' — Mary is never named in John''s Gospel, always ''the mother of Jesus'' (here and at the cross, 19:25-27). The wedding feast was a major social event lasting several days.',
   NULL),
  (2, 'And both Jesus was called, and his disciples, to the marriage.',
   'ἐκλήθη δὲ καὶ ὁ Ἰησοῦς καὶ οἱ μαθηταὶ αὐτοῦ εἰς τὸν γάμον',
   'eklēthē de kai ho Iēsous kai hoi mathētai autou eis ton gamon',
   '''Was called'' (eklēthē — invited, summoned). Jesus and his newly-called disciples (from ch.1) attend the wedding. Jesus'' presence at a wedding feast sanctifies marriage and human celebration. He does not withdraw from ordinary life but enters into it, transforming it from within.',
   NULL),
  (3, 'And when they wanted wine, the mother of Jesus saith unto him, They have no wine.',
   'καὶ ὑστερήσαντος οἴνου λέγει ἡ μήτηρ τοῦ Ἰησοῦ πρὸς αὐτόν Οἶνον οὐκ ἔχουσιν',
   'kai hysterēsantos oinou legei hē mētēr tou Iēsou pros auton Oinon ouk echousin',
   '''When they wanted wine'' (hysterēsantos oinou — the wine having failed, run short). Running out of wine at a wedding was a serious social embarrassment in Jewish culture. Mary brings the need directly to Jesus — she does not tell him what to do, but trusts him to act. Her statement is a simple declaration of need, implying confidence in his ability to help.',
   NULL),
  (4, 'Jesus saith unto her, Woman, what have I to do with thee? mine hour is not yet come.',
   'λέγει αὐτῇ ὁ Ἰησοῦς Τί ἐμοὶ καὶ σοί γύναι οὔπω ἥκει ἡ ὥρα μου',
   'legei autē ho Iēsous Ti emoi kai soi gynai oupō hēkei hē hōra mou',
   '''Woman'' (gynai — not disrespectful in Greek; a term of dignified address, used also at the cross in 19:26). ''What have I to do with thee?'' (ti emoi kai soi — literally ''what to me and to you?'' — a Semitic idiom indicating a shift in relationship; Jesus is acting under divine authority, not family obligation). ''Mine hour is not yet come'' (hē hōra mou — ''the hour'' in John refers to Jesus'' glorification through death and resurrection: 7:30; 8:20; 12:23; 13:1; 17:1). Yet he will act, showing that even before ''the hour,'' his glory is being progressively manifested.',
   'Jesus'' response to Mary establishes a crucial principle: in his public ministry, Jesus acts according to the Father''s will and timing, not human request or family ties. ''Mine hour is not yet come'' introduces John''s theology of ''the hour'' — the appointed time of his death, resurrection, and glorification. Every sign before the hour is a preview of the glory that will be fully revealed at the cross and empty tomb.'),
  (5, 'His mother saith unto the servants, Whatsoever he saith unto you, do it.',
   'λέγει ἡ μήτηρ αὐτοῦ τοῖς διακόνοις Ὅ τι ἂν λέγῃ ὑμῖν ποιήσατε',
   'legei hē mētēr autou tois diakonois Ho ti an legē hymin poiēsate',
   '''Whatsoever he saith unto you, do it'' (ho ti an legē hymin poiēsate — whatever he may say to you, do it). Mary''s words are the last recorded speech of Mary in the Gospels. Despite Jesus'' seemingly discouraging reply, she trusts completely. Her instruction to the servants (diakonois — ministers, attendants) echoes Pharaoh''s words about Joseph: ''Go unto Joseph; what he saith to you, do'' (Genesis 41:55). Mary points away from herself to her Son — the model of faith is obedient trust.',
   NULL),
  (6, 'And there were set there six waterpots of stone, after the manner of the purifying of the Jews, containing two or three firkins apiece.',
   'ἦσαν δὲ ἐκεῖ ὑδρίαι λίθιναι ἓξ κατὰ τὸν καθαρισμὸν τῶν Ἰουδαίων κείμεναι χωροῦσαι ἀνὰ μετρητὰς δύο ἢ τρεῖς',
   'ēsan de ekei hydriai lithinai hex kata ton katharismon tōn Ioudaiōn keimenai chōrousai ana metrētas duo ē treis',
   'Six stone waterpots (hydriai lithinai hex) — stone vessels used for Jewish ceremonial purification (katharismon tōn Ioudaiōn — the cleansing of the Jews, ritual hand-washing per Mark 7:3-4). ''Two or three firkins apiece'' (metrētas duo ē treis — a metrētēs ≈ 39 litres/8.7 gallons; total capacity: 120-180 gallons). The number six (one short of seven, the number of perfection) may symbolise the incompleteness of the old covenant purification system. Stone was preferred for purity vessels because it was considered incapable of contracting uncleanness.',
   NULL),
  (7, 'Jesus saith unto them, Fill the waterpots with water. And they filled them up to the brim.',
   'λέγει αὐτοῖς ὁ Ἰησοῦς Γεμίσατε τὰς ὑδρίας ὕδατος καὶ ἐγέμισαν αὐτὰς ἕως ἄνω',
   'legei autois ho Iēsous Gemisate tas hydrias hydatos kai egemisan autas heōs anō',
   '''Fill'' (gemisate — aorist imperative: fill at once, completely). ''Up to the brim'' (heōs anō — to the very top). The servants obey precisely — there is no room for anything to be added, ruling out any possibility of mixing. The obedience of the servants models the response Mary called for in v.5. Jesus works through human obedience: he commands, they act, and he transforms.',
   NULL),
  (8, 'And he saith unto them, Draw out now, and bear unto the governor of the feast. And they bare it.',
   'καὶ λέγει αὐτοῖς Ἀντλήσατε νῦν καὶ φέρετε τῷ ἀρχιτρικλίνῳ καὶ ἤνεγκαν',
   'kai legei autois Antlēsate nyn kai pherete tō architriklinō kai ēnenkan',
   '''Draw out'' (antlēsate — draw, as from a well; the verb is used in 4:7, 15 of drawing water). ''Governor of the feast'' (architriklinō — the head waiter or master of ceremonies who supervised the banquet). The servants know the water has not been mixed with anything; their obedience requires faith. The transformation happens between the command and the tasting — John does not describe the moment of miracle, focusing instead on its effect.',
   NULL),
  (9, 'When the ruler of the feast had tasted the water that was made wine, and knew not whence it was: (but the servants which drew the water knew;) the governor of the feast called the bridegroom,',
   'ὡς δὲ ἐγεύσατο ὁ ἀρχιτρίκλινος τὸ ὕδωρ οἶνον γεγενημένον καὶ οὐκ ᾔδει πόθεν ἐστίν οἱ δὲ διάκονοι ᾔδεισαν οἱ ἠντληκότες τὸ ὕδωρ φωνεῖ τὸν νυμφίον ὁ ἀρχιτρίκλινος',
   'hōs de egeusato ho architriklinos to hydōr oinon gegenēmenon kai ouk ēdei pothen estin hoi de diakonoi ēdeisan hoi ēntlēkotes to hydōr phōnei ton nymphion ho architriklinos',
   '''The water that was made wine'' (to hydōr oinon gegenēmenon — the water having become wine; gegenēmenon is a perfect participle: it had been made wine and remained so). ''Knew not whence it was'' (ouk ēdei pothen estin — did not know its origin). A characteristic Johannine irony: the ruler does not know whence the wine comes, just as the world does not know whence Jesus comes (7:27-28; 8:14; 9:29-30). The servants who obeyed know the truth — faith and obedience lead to understanding.',
   NULL),
  (10, 'And saith unto him, Every man at the beginning doth set forth good wine; and when men have well drunk, then that which is worse: but thou hast kept the good wine until now.',
   'καὶ λέγει αὐτῷ Πᾶς ἄνθρωπος πρῶτον τὸν καλὸν οἶνον τίθησιν καὶ ὅταν μεθυσθῶσιν τότε τὸν ἐλάσσω σὺ τετήρηκας τὸν καλὸν οἶνον ἕως ἄρτι',
   'kai legei autō Pas anthrōpos prōton ton kalon oinon tithēsin kai hotan methysthōsin tote ton elassō sy tetērēkas ton kalon oinon heōs arti',
   '''Good wine'' (ton kalon oinon — the fine, excellent wine). ''When men have well drunk'' (hotan methysthōsin — when they have drunk freely; not necessarily ''drunk'' in the modern sense, but satisfied). ''Thou hast kept the good wine until now'' (sy tetērēkas ton kalon oinon heōs arti). The ruler''s astonishment becomes a profound theological statement: God has saved the best for the messianic age. The old covenant provided ''good wine'' first (the Law, the prophets, the ceremonies), but the new covenant in Christ is the finest — kept until now. Jesus does not merely restore what was lacking; he provides something surpassingly better.',
   'The ruler''s words unwittingly proclaim a theological truth: God has kept the best wine until the coming of the Messiah. In the OT, wine is a symbol of messianic blessing (Isaiah 25:6; Joel 3:18; Amos 9:13-14). Jesus replaces the water of Jewish purification with the wine of the new covenant — not a patch on the old, but a transformation. The abundance (120-180 gallons) and quality (the best wine) signal the overflowing grace of the messianic age (cf. John 1:16, ''grace for grace'').'),
  (11, 'This beginning of miracles did Jesus in Cana of Galilee, and manifested forth his glory; and his disciples believed on him.',
   'ταύτην ἐποίησεν τὴν ἀρχὴν τῶν σημείων ὁ Ἰησοῦς ἐν Κανᾶ τῆς Γαλιλαίας καὶ ἐφανέρωσεν τὴν δόξαν αὐτοῦ καὶ ἐπίστευσαν εἰς αὐτὸν οἱ μαθηταὶ αὐτοῦ',
   'tautēn epoiēsen tēn archēn tōn sēmeiōn ho Iēsous en Kana tēs Galilaias kai ephanerōsen tēn doxan autou kai episteusan eis auton hoi mathētai autou',
   '''This beginning of miracles'' (tēn archēn tōn sēmeiōn — the beginning/first of the signs). John calls Jesus'' miracles sēmeia (signs), not dynameis (mighty works) as in the Synoptics. Signs point beyond themselves to reveal Jesus'' identity. ''Manifested forth his glory'' (ephanerōsen tēn doxan autou — made visible, revealed his glory). Glory (doxa) in John is the visible radiance of God''s presence (cf. 1:14, ''we beheld his glory''). ''His disciples believed on him'' (episteusan eis auton — believed into him, trusted in him). The sign produces faith — the purpose of all signs in John (20:30-31).',
   'John 2:11 is programmatic for the entire Gospel. Signs (sēmeia) are revelatory acts that ''manifest his glory'' — they display who Jesus truly is: the divine Son, the Creator, the Lord of nature. The proper response to signs is faith (pisteuō eis — believing into). John structures his Gospel around seven signs, each revealing a different aspect of Jesus'' divine glory, culminating in the resurrection of Lazarus (ch.11) and ultimately Jesus'' own resurrection. This first sign establishes the pattern: Jesus acts, his glory is revealed, and faith results.'),
  (12, 'After this he went down to Capernaum, he, and his mother, and his brethren, and his disciples: and they continued there not many days.',
   'μετὰ τοῦτο κατέβη εἰς Καπερναοὺμ αὐτὸς καὶ ἡ μήτηρ αὐτοῦ καὶ οἱ ἀδελφοὶ αὐτοῦ καὶ οἱ μαθηταὶ αὐτοῦ καὶ ἐκεῖ ἔμειναν οὐ πολλὰς ἡμέρας',
   'meta touto katebē eis Kapernaoum autos kai hē mētēr autou kai hoi adelphoi autou kai hoi mathētai autou kai ekei emeinan ou pollas hēmeras',
   '''Went down'' (katebē — descended; Cana is in the hills, Capernaum on the shore of the Sea of Galilee, hence ''down''). ''His brethren'' (hoi adelphoi autou — his brothers; mentioned in 7:3-5, where they do not yet believe). ''Not many days'' — a transitional note; the Passover is approaching (v.13) and Jesus will go up to Jerusalem.',
   NULL),
  (13, 'And the Jews'' passover was at hand, and Jesus went up to Jerusalem,',
   'καὶ ἐγγὺς ἦν τὸ πάσχα τῶν Ἰουδαίων καὶ ἀνέβη εἰς Ἱεροσόλυμα ὁ Ἰησοῦς',
   'kai engys ēn to pascha tōn Ioudaiōn kai anebē eis Hierosolyma ho Iēsous',
   '''The Jews'' passover'' (to pascha tōn Ioudaiōn — John consistently identifies Jewish feasts for his readers, suggesting a partly Gentile audience). This is the first of three Passovers in John''s Gospel (2:13; 6:4; 11:55/13:1), establishing a ministry of at least two and a half years. ''Went up'' (anebē — ascended; Jerusalem sits at 2,500 ft elevation). The Passover setting is significant: Jesus will be revealed as the true Passover Lamb (1:29; 19:36).',
   NULL),
  (14, 'And found in the temple those that sold oxen and sheep and doves, and the changers of money sitting:',
   'καὶ εὗρεν ἐν τῷ ἱερῷ τοὺς πωλοῦντας βόας καὶ πρόβατα καὶ περιστερὰς καὶ τοὺς κερματιστὰς καθημένους',
   'kai heuren en tō hierō tous pōlountas boas kai probata kai peristeras kai tous kermatistas kathēmenous',
   '''In the temple'' (en tō hierō — the temple complex, specifically the Court of the Gentiles, the outermost court). Animal sellers provided sacrificial animals for pilgrims; moneychangers (kermatistas — coin dealers, from kerma, small coin) exchanged foreign currency for the Tyrian shekel required for the temple tax. While these services were necessary for temple worship, they had become a commercial enterprise, with profit-making taking precedence over worship, and the Court of the Gentiles — the only place where non-Jews could pray — had become a noisy marketplace.',
   NULL),
  (15, 'And when he had made a scourge of small cords, he drove them all out of the temple, and the sheep, and the oxen; and poured out the changers'' money, and overthrew the tables;',
   'καὶ ποιήσας φραγέλλιον ἐκ σχοινίων πάντας ἐξέβαλεν ἐκ τοῦ ἱεροῦ τά τε πρόβατα καὶ τοὺς βόας καὶ τῶν κολλυβιστῶν ἐξέχεεν τὸ κέρμα καὶ τὰς τραπέζας ἀνέτρεψεν',
   'kai poiēsas phragellion ek schoiniōn pantas exebalen ek tou hierou ta te probata kai tous boas kai tōn kollybistōn execheen to kerma kai tas trapezas anetrepsen',
   '''A scourge of small cords'' (phragellion ek schoiniōn — a whip made from rushes or ropes). ''Drove them all out'' (pantas exebalen — he cast out all of them). The act is one of prophetic authority, recalling Malachi 3:1-3: ''the Lord, whom ye seek, shall suddenly come to his temple... and he shall purify the sons of Levi.'' Jesus acts with righteous indignation, not uncontrolled anger. ''Poured out the changers'' money'' (execheen to kerma — dumped the coins). ''Overthrew the tables'' (tas trapezas anetrepsen — overturned, upset). This is not destruction but purification — restoring the temple to its intended purpose.',
   NULL),
  (16, 'And said unto them that sold doves, Take these things hence; make not my Father''s house an house of merchandise.',
   'καὶ τοῖς τὰς περιστερὰς πωλοῦσιν εἶπεν Ἄρατε ταῦτα ἐντεῦθεν μὴ ποιεῖτε τὸν οἶκον τοῦ πατρός μου οἶκον ἐμπορίου',
   'kai tois tas peristeras pōlousin eipen Arate tauta enteuthen mē poieite ton oikon tou patros mou oikon emporiou',
   '''Take these things hence'' (arate tauta enteuthen — carry these away from here; doves could not be driven out like cattle, hence the verbal command). ''My Father''s house'' (ton oikon tou patros mou — a remarkable claim of unique filial relationship with God). ''An house of merchandise'' (oikon emporiou — a commercial establishment, an emporium). In the Synoptic cleansing (Matthew 21:13), Jesus quotes Isaiah 56:7 and Jeremiah 7:11 (''den of thieves''). John''s account uses ''house of merchandise'' — the corruption is commercial exploitation, turning worship into profit.',
   'Jesus'' claim that the temple is ''my Father''s house'' is a bold assertion of his unique divine sonship. He does not say ''our Father'' (as in prayer) but ''my Father'' — claiming a relationship with God that no other human shares. This claim will become a central point of conflict throughout John''s Gospel (5:17-18; 8:54; 10:29-30; 14:2). The cleansing demonstrates Jesus'' authority over the temple as the Son of the One to whom the temple belongs.'),
  (17, 'And his disciples remembered that it was written, The zeal of thine house hath eaten me up.',
   'ἐμνήσθησαν οἱ μαθηταὶ αὐτοῦ ὅτι γεγραμμένον ἐστίν Ὁ ζῆλος τοῦ οἴκου σου καταφάγεταί με',
   'emnēsthēsan hoi mathētai autou hoti gegrammenon estin Ho zēlos tou oikou sou kataphagetai me',
   '''Remembered'' (emnēsthēsan — called to mind, recollected). ''It was written'' (gegrammenon estin — stands written, perfect tense: permanently recorded). The quotation is from Psalm 69:9: ''The zeal of thine house hath eaten me up'' (ho zēlos tou oikou sou kataphagetai me). The future tense ''will consume me'' (kataphagetai — will eat me up, devour me) may hint at the cost of Jesus'' zeal — it will eventually lead to his death. Psalm 69 is one of the most-quoted psalms in the NT, applied to the suffering Messiah.',
   NULL),
  (18, 'Then answered the Jews and said unto him, What sign shewest thou unto us, seeing that thou doest these things?',
   'ἀπεκρίθησαν οὖν οἱ Ἰουδαῖοι καὶ εἶπον αὐτῷ Τί σημεῖον δεικνύεις ἡμῖν ὅτι ταῦτα ποιεῖς',
   'apekrithēsan oun hoi Ioudaioi kai eipon autō Ti sēmeion deiknueis hēmin hoti tauta poieis',
   '''What sign shewest thou?'' (ti sēmeion deiknueis hēmin — what sign do you show us?). The Jewish leaders demand credentials: by what authority does he act? Their question is reasonable — prophetic figures were expected to validate their claims with signs (cf. Deuteronomy 18:21-22). But the demand reveals a deeper problem: they want proof on their terms rather than responding in faith to what they have already witnessed.',
   NULL),
  (19, 'Jesus answered and said unto them, Destroy this temple, and in three days I will raise it up.',
   'ἀπεκρίθη Ἰησοῦς καὶ εἶπεν αὐτοῖς Λύσατε τὸν ναὸν τοῦτον καὶ ἐν τρισὶν ἡμέραις ἐγερῶ αὐτόν',
   'apekrithē Iēsous kai eipen autois Lysate ton naon touton kai en trisin hēmerais egerō auton',
   '''Destroy'' (lysate — loose, dissolve, demolish; an imperative used as a conditional: if you destroy). ''This temple'' (ton naon touton — naos refers to the inner sanctuary, the holy place, not the broader temple complex hieron). ''In three days I will raise it up'' (en trisin hēmerais egerō auton — egerō: I will raise, resurrect). Jesus speaks on two levels simultaneously — a characteristic Johannine technique. The Jews hear ''temple building''; Jesus means his body. The sign they demand is the ultimate sign: his death and resurrection.',
   'Jesus'' statement is one of the most theologically dense sayings in the Gospels. (1) He prophesies his own death (''destroy this temple'') — his body will be destroyed. (2) He prophesies his resurrection (''in three days I will raise it up'') — he himself will raise his body, claiming divine power over death. (3) He identifies his body as the true temple — the locus of God''s presence on earth. The physical temple is a shadow; Jesus is the reality (cf. Colossians 2:17). (4) ''I will raise it up'' — Jesus claims active agency in his own resurrection, a divine prerogative (cf. 10:17-18: ''I have power to lay it down, and I have power to take it again'').'),
  (20, 'Then said the Jews, Forty and six years was this temple in building, and wilt thou rear it up in three days?',
   'εἶπον οὖν οἱ Ἰουδαῖοι Τεσσαράκοντα καὶ ἓξ ἔτεσιν ᾠκοδομήθη ὁ ναὸς οὗτος καὶ σὺ ἐν τρισὶν ἡμέραις ἐγερεῖς αὐτόν',
   'eipon oun hoi Ioudaioi Tesserakonta kai hex etesin ōkodomēthē ho naos houtos kai sy en trisin hēmerais egereis auton',
   '''Forty and six years'' (tesserakonta kai hex etesin — Herod the Great began rebuilding the temple in 20/19 BC; 46 years brings us to AD 27/28, consistent with the early date of Jesus'' ministry). ''Was this temple in building'' (ōkodomēthē — was built, constructed; the main structure was completed, though finishing work continued until AD 63). The Jews'' misunderstanding is typical of Johannine irony: they take Jesus'' words on the physical, literal level while missing the deeper, spiritual meaning (cf. 3:4; 4:15; 6:52; 11:12).',
   NULL),
  (21, 'But he spake of the temple of his body.',
   'ἐκεῖνος δὲ ἔλεγεν περὶ τοῦ ναοῦ τοῦ σώματος αὐτοῦ',
   'ekeinos de elegen peri tou naou tou sōmatos autou',
   'John''s editorial comment resolves the ambiguity: ''he spake of the temple of his body'' (peri tou naou tou sōmatos autou — concerning the sanctuary of his body). Jesus'' physical body is the true temple — the place where God fully dwells (cf. 1:14, ''the Word was made flesh and dwelt [eskēnōsen, tabernacled] among us''). After the resurrection, the church becomes the temple of God (1 Corinthians 3:16; 6:19; Ephesians 2:21-22), indwelt by the Spirit whom the risen Christ sends.',
   'The identification of Jesus'' body as the true temple is foundational for Christian theology. (1) The OT temple was where God''s presence dwelt among his people (1 Kings 8:10-11). (2) In the Incarnation, God''s presence dwells fully and permanently in Jesus'' body (Colossians 2:9: ''in him dwelleth all the fulness of the Godhead bodily''). (3) Through the Spirit, believers become temples of God (1 Corinthians 6:19). (4) In the New Jerusalem, there is ''no temple therein: for the Lord God Almighty and the Lamb are the temple of it'' (Revelation 21:22). The progression: tabernacle → temple → Christ''s body → the church → the eternal city.'),
  (22, 'When therefore he was risen from the dead, his disciples remembered that he had said this unto them; and they believed the scripture, and the word which Jesus had said.',
   'ὅτε οὖν ἠγέρθη ἐκ νεκρῶν ἐμνήσθησαν οἱ μαθηταὶ αὐτοῦ ὅτι τοῦτο ἔλεγεν καὶ ἐπίστευσαν τῇ γραφῇ καὶ τῷ λόγῳ ὃν εἶπεν ὁ Ἰησοῦς',
   'hote oun ēgerthē ek nekrōn emnēsthēsan hoi mathētai autou hoti touto elegen kai episteusan tē graphē kai tō logō hon eipen ho Iēsous',
   '''When he was risen from the dead'' (hote ēgerthē ek nekrōn — when he was raised, resurrection language). ''Remembered'' (emnēsthēsan — same verb as v.17; the resurrection is the interpretive key that unlocks Jesus'' words). ''Believed the scripture, and the word which Jesus had said'' (episteusan tē graphē kai tō logō — they believed both the OT scripture and Jesus'' own word). Note that ''the scripture'' and ''the word which Jesus said'' are placed on the same level of authority — both are trustworthy and divine. Full understanding often comes after the events, not during them.',
   NULL),
  (23, 'Now when he was in Jerusalem at the passover, in the feast day, many believed in his name, when they saw the miracles which he did.',
   'ὡς δὲ ἦν ἐν τοῖς Ἱεροσολύμοις ἐν τῷ πάσχα ἐν τῇ ἑορτῇ πολλοὶ ἐπίστευσαν εἰς τὸ ὄνομα αὐτοῦ θεωροῦντες αὐτοῦ τὰ σημεῖα ἃ ἐποίει',
   'hōs de ēn en tois Hierosolymois en tō pascha en tē heortē polloi episteusan eis to onoma autou theōrountes autou ta sēmeia ha epoiei',
   '''Many believed in his name'' (polloi episteusan eis to onoma autou — believed into his name). ''When they saw the miracles'' (theōrountes autou ta sēmeia — beholding, observing his signs). This is sign-based faith — faith produced by seeing miracles. John presents this as genuine but incomplete faith. These miracles in Jerusalem are not individually recorded; John selects only seven representative signs. The distinction between sign-based faith and deeper, personal faith is a major theme in John (cf. 4:48; 6:26; 20:29).',
   NULL),
  (24, 'But Jesus did not commit himself unto them, because he knew all men,',
   'αὐτὸς δὲ ὁ Ἰησοῦς οὐκ ἐπίστευεν ἑαυτὸν αὐτοῖς διὰ τὸ αὐτὸν γινώσκειν πάντας',
   'autos de ho Iēsous ouk episteuen heauton autois dia to auton ginōskein pantas',
   '''Did not commit himself'' (ouk episteuen heauton autois — literally ''did not entrust himself to them''; the same verb pisteuō is used: they ''believed'' in him, but he did not ''believe/entrust'' himself to them). ''He knew all men'' (ginōskein pantas — he knew all people). Jesus'' divine omniscience discerns the quality and depth of faith. Superficial, sign-based faith is not enough for Jesus to entrust himself fully. This verse introduces Nicodemus (ch.3) — one of these Jerusalem believers whose faith needs deepening.',
   NULL),
  (25, 'And needed not that any should testify of man: for he knew what was in man.',
   'καὶ ὅτι οὐ χρείαν εἶχεν ἵνα τις μαρτυρήσῃ περὶ τοῦ ἀνθρώπου αὐτὸς γὰρ ἐγίνωσκεν τί ἦν ἐν τῷ ἀνθρώπῳ',
   'kai hoti ou chreian eichen hina tis martyrēsē peri tou anthrōpou autos gar eginōsken ti ēn en tō anthrōpō',
   '''He knew what was in man'' (eginōsken ti ēn en tō anthrōpō — he was knowing what was in the human being). The imperfect tense (eginōsken) indicates continuous, habitual knowledge — Jesus always knows the human heart. This divine attribute (cf. 1 Samuel 16:7; 1 Kings 8:39; Jeremiah 17:10; Psalm 139:1-4) is ascribed to Jesus, affirming his deity. ''Needed not that any should testify'' (ou chreian eichen hina tis martyrēsē — he had no need for anyone to bear witness about man). This verse sets up Nicodemus in ch.3: Jesus will show he knows exactly what is in this particular man — and what he needs.',
   'Jesus'' omniscient knowledge of the human heart is a divine attribute. The OT consistently attributes knowledge of the heart to God alone: ''The LORD seeth not as man seeth; for man looketh on the outward appearance, but the LORD looketh on the heart'' (1 Samuel 16:7). ''I the LORD search the heart, I try the reins'' (Jeremiah 17:10). By ascribing this capacity to Jesus, John affirms his deity — Jesus possesses the divine prerogative of knowing all that is in every person. This knowledge will be demonstrated throughout the Gospel: with Nicodemus (3:3), the Samaritan woman (4:17-18), Judas (6:64, 70-71), and Peter (21:17).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'John' AND c.chapter_number = 2;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, greek_word, transliteration, strongs_number, definition, word_order)
SELECT v.id, ws.greek_word, ws.transliteration, ws.strongs_number, ws.definition, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σημεῖον', 'sēmeion', 'G4592',
   'Sign, miracle, attesting wonder; a mark or token that points beyond itself to a deeper reality.',
   'John uses sēmeion exclusively for Jesus'' miracles (never dynamis or teras alone). The seven signs of John: water to wine (2:1-11), healing the official''s son (4:46-54), healing at Bethesda (5:1-9), feeding 5,000 (6:1-14), walking on water (6:16-21), healing the blind man (9:1-7), raising Lazarus (11:1-44). Each sign reveals Jesus'' glory (2:11) and is designed to produce faith (20:30-31). The word occurs 17 times in John.',
   1),
  ('δόξα', 'doxa', 'G1391',
   'Glory, splendour, radiance, honour; the visible manifestation of God''s character and presence.',
   'In John, doxa is the divine radiance that Jesus possesses eternally (17:5, 24) and reveals through his signs (2:11; 11:4, 40). The Prologue declares: ''we beheld his glory'' (1:14). Jesus'' ultimate glorification occurs through the cross and resurrection — ''the hour'' when he is ''glorified'' (12:23; 13:31; 17:1). Doxa connects the earthly signs to the heavenly reality: in every miracle, the eternal glory of the Word breaks through into the visible world.',
   2),
  ('οἶνος', 'oinos', 'G3631',
   'Wine; fermented grape juice used in meals, feasts, and sacrificial offerings.',
   'Wine in Scripture symbolizes joy (Psalm 104:15), blessing (Genesis 27:28), and the messianic age (Isaiah 25:6; Joel 3:18; Amos 9:13). Jesus'' transformation of water to wine signals the arrival of messianic abundance. The ''good wine'' kept until now (v.10) represents the superiority of the new covenant over the old. At the Last Supper, wine becomes the symbol of Jesus'' blood of the new covenant (Matthew 26:28-29).',
   3),
  ('ἱερόν', 'hieron', 'G2411',
   'Temple, sacred precinct; the entire temple complex including courts, porticoes, and buildings.',
   'Distinguished from naos (G3485), which refers to the inner sanctuary. Hieron is used for the temple complex Jesus enters to cleanse (vv.14-15). Naos is used when Jesus speaks of ''this temple'' meaning his body (vv.19-21). The distinction is theologically significant: the physical temple complex (hieron) will be superseded by the true sanctuary (naos) — Jesus'' body. Hieron occurs 11 times in John; naos only in 2:19-21.',
   4),
  ('ναός', 'naos', 'G3485',
   'Sanctuary, inner temple, shrine; the dwelling place of God — the holy place and holy of holies.',
   'In v.19, Jesus uses naos (not hieron) when he says ''Destroy this temple'' — he speaks of the inner sanctuary, the place of God''s presence. John''s editorial note (v.21) explains: ''he spake of the temple (naos) of his body.'' Jesus'' body is the true holy of holies — the place where God''s glory dwells fully (Colossians 2:9). After the resurrection, believers become the naos of God through the indwelling Spirit (1 Corinthians 3:16; 6:19).',
   5),
  ('ζῆλος', 'zēlos', 'G2205',
   'Zeal, ardour, jealous concern, fervent devotion; intense passion for something sacred.',
   'From zeō (to boil, be hot). Psalm 69:9 is quoted in v.17: ''The zeal of thine house hath eaten me up.'' Jesus'' zeal is not human temper but holy jealousy for God''s honour — the same jealousy God himself has for his name (Ezekiel 39:25). The future tense (kataphagetai — ''will consume me'') hints that this zeal will cost Jesus his life. Paul quotes the same psalm regarding Christ''s suffering (Romans 15:3; cf. Psalm 69:21 at the cross, John 19:28-29).',
   6),
  ('ἐγείρω', 'egeirō', 'G1453',
   'To raise up, to awaken, to resurrect; to cause to stand from a lying or fallen position.',
   'In v.19, Jesus says ''I will raise it up'' (egerō auton) — claiming active agency in his own resurrection. This is extraordinary: the Father raises the Son (Romans 6:4; 8:11), yet Jesus says he himself will raise his body. Both are true because Father and Son act in perfect unity (John 10:17-18: ''I have power to lay it down, and I have power to take it again''). Egeirō is the standard NT resurrection verb (used 36 times of resurrection). Jesus'' self-resurrection claim is a powerful assertion of deity.',
   7),
  ('γινώσκω', 'ginōskō', 'G1097',
   'To know, to perceive, to understand, to recognise; experiential, relational knowledge (not merely intellectual).',
   'In vv.24-25, ginōskō describes Jesus'' supernatural knowledge of the human heart: ''he knew all men'' and ''he knew what was in man.'' This is divine omniscience — knowledge that Scripture attributes to God alone (1 Samuel 16:7; Jeremiah 17:10; Psalm 139:1-4). Throughout John, Jesus demonstrates this knowledge: he knows Nathanael before meeting him (1:47-48), knows the Samaritan woman''s past (4:17-18), knows who will betray him (6:64, 70-71), and knows Peter''s love and future (21:17).',
   8)
) AS ws(greek_word, transliteration, strongs_number, definition, word_order)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 2
  AND v2.verse_number = CASE ws.word_order
    WHEN 1 THEN 11
    WHEN 2 THEN 11
    WHEN 3 THEN 10
    WHEN 4 THEN 14
    WHEN 5 THEN 19
    WHEN 6 THEN 17
    WHEN 7 THEN 19
    WHEN 8 THEN 24
  END
) v;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, referenced_verse, relationship_type, note)
SELECT v.id, cr.referenced_verse, cr.relationship_type, cr.note
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1: Marriage in Cana
  (1, 'John 1:43', 'context', 'The day before — the sequence ''the third day'' counts from Philip and Nathanael''s call'),
  (1, 'John 4:46', 'parallel', 'Jesus returns to Cana for a second sign — healing the nobleman''s son'),
  -- v.4: Mine hour is not yet come
  (4, 'John 7:30', 'thematic', '''His hour was not yet come'' — the recurring theme of Jesus'' appointed time'),
  (4, 'John 12:23', 'thematic', '''The hour is come, that the Son of man should be glorified'' — the hour finally arrives'),
  (4, 'John 13:1', 'thematic', '''Jesus knew that his hour was come'' — the hour of his departure'),
  (4, 'John 17:1', 'thematic', '''Father, the hour is come; glorify thy Son'' — the hour of mutual glorification'),
  -- v.5: Whatsoever he saith unto you, do it
  (5, 'Genesis 41:55', 'allusion', '''Go unto Joseph; what he saith to you, do'' — Mary echoes Pharaoh''s words about Joseph'),
  -- v.6: Six waterpots of stone for purification
  (6, 'Mark 7:3-4', 'context', 'Jewish washing customs — ''the Pharisees and all the Jews wash their hands'''),
  (6, 'John 3:25', 'thematic', 'Dispute about purification — the old purification is giving way to the new'),
  -- v.10: Good wine kept until now
  (10, 'Isaiah 25:6', 'prophecy', '''A feast of wines on the lees'' — the messianic banquet of finest wines'),
  (10, 'Joel 3:18', 'prophecy', '''The mountains shall drop down new wine'' — messianic wine abundance'),
  (10, 'Amos 9:13', 'prophecy', '''The mountains shall drop sweet wine'' — the abundance of the messianic age'),
  (10, 'John 1:16', 'thematic', '''Of his fulness have all we received, and grace for grace'' — the overflowing abundance of Christ'),
  -- v.11: Manifested forth his glory
  (11, 'John 1:14', 'thematic', '''We beheld his glory'' — the glory manifested in the sign was first declared in the Prologue'),
  (11, 'John 11:4', 'thematic', '''This sickness is... for the glory of God'' — Lazarus'' sign also manifests glory'),
  (11, 'John 11:40', 'thematic', '''Said I not unto thee, that, if thou wouldest believe, thou shouldest see the glory of God?'''),
  (11, 'John 20:30-31', 'thematic', 'The purpose of all signs: ''that ye might believe that Jesus is the Christ'''),
  -- v.13: The Jews' passover
  (13, 'John 6:4', 'parallel', 'The second Passover in John — ''the passover, a feast of the Jews, was nigh'''),
  (13, 'John 11:55', 'parallel', 'The third and final Passover — ''the Jews'' passover was nigh at hand'''),
  (13, 'Exodus 12:1-14', 'allusion', 'The institution of the Passover — Jesus will be the true Passover Lamb (1 Corinthians 5:7)'),
  -- v.15: Drove them all out
  (15, 'Malachi 3:1-3', 'prophecy', '''The Lord shall suddenly come to his temple... he shall purify the sons of Levi'''),
  (15, 'Matthew 21:12-13', 'parallel', 'The Synoptic temple cleansing (late in ministry) — ''My house shall be called the house of prayer'''),
  (15, 'Mark 11:15-17', 'parallel', 'Mark''s account: ''ye have made it a den of thieves'' — quoting Jeremiah 7:11'),
  -- v.16: My Father's house
  (16, 'Luke 2:49', 'thematic', '''I must be about my Father''s business'' — Jesus'' earliest recorded claim of divine sonship'),
  (16, 'John 5:17-18', 'thematic', '''My Father worketh hitherto, and I work'' — the Jews understand the claim to deity'),
  (16, 'John 14:2', 'thematic', '''In my Father''s house are many mansions'' — from the earthly to the heavenly Father''s house'),
  -- v.17: Zeal of thine house
  (17, 'Psalm 69:9', 'quotation', '''The zeal of thine house hath eaten me up'' — the messianic psalm of the suffering righteous one'),
  (17, 'Romans 15:3', 'allusion', 'Paul applies Psalm 69 to Christ: ''the reproaches of them that reproached thee fell on me'''),
  (17, 'John 19:28-29', 'allusion', 'Psalm 69:21 fulfilled at the cross: ''they gave me vinegar to drink'''),
  -- v.19: Destroy this temple
  (19, 'Matthew 26:61', 'parallel', '''This fellow said, I am able to destroy the temple of God'' — used as accusation at the trial'),
  (19, 'Matthew 27:40', 'parallel', '''Thou that destroyest the temple, and buildest it in three days'' — mocked at the cross'),
  (19, 'Mark 14:58', 'parallel', '''I will destroy this temple that is made with hands'' — Mark''s version of the accusation'),
  (19, 'John 10:17-18', 'thematic', '''I have power to lay it down, and I have power to take it again'' — Jesus'' authority over his own death and resurrection'),
  -- v.21: Temple of his body
  (21, 'John 1:14', 'thematic', '''The Word was made flesh, and dwelt among us'' — the Incarnation as divine tabernacling'),
  (21, 'Colossians 2:9', 'thematic', '''In him dwelleth all the fulness of the Godhead bodily'' — the body as the fullness of deity'),
  (21, '1 Corinthians 3:16', 'thematic', '''Know ye not that ye are the temple of God?'' — the church extends the temple concept'),
  (21, '1 Corinthians 6:19', 'thematic', '''Your body is the temple of the Holy Ghost'' — individual believers as temples'),
  (21, 'Ephesians 2:21-22', 'thematic', '''The whole building groweth unto an holy temple in the Lord'''),
  (21, 'Revelation 21:22', 'thematic', '''No temple therein: for the Lord God Almighty and the Lamb are the temple of it'''),
  -- v.22: Remembered and believed
  (22, 'John 12:16', 'parallel', '''When Jesus was glorified, then remembered they that these things were written of him'''),
  (22, 'John 14:26', 'thematic', '''The Holy Ghost... shall bring all things to your remembrance'''),
  (22, 'Luke 24:6-8', 'parallel', '''Remember how he spake unto you... and they remembered his words'''),
  -- v.24-25: He knew what was in man
  (24, '1 Samuel 16:7', 'allusion', '''The LORD looketh on the heart'' — divine knowledge of the inner man'),
  (24, 'Jeremiah 17:10', 'allusion', '''I the LORD search the heart'' — the divine prerogative Jesus exercises'),
  (24, 'Psalm 139:1-4', 'allusion', '''O LORD, thou hast searched me, and known me'' — omniscient knowledge of every thought'),
  (25, 'John 1:47-48', 'parallel', 'Jesus knows Nathanael before meeting him — ''when thou wast under the fig tree, I saw thee'''),
  (25, 'John 6:64', 'parallel', '''Jesus knew from the beginning who they were that believed not, and who should betray him'''),
  (25, 'John 21:17', 'parallel', '''Lord, thou knowest all things; thou knowest that I love thee'' — Peter confesses Jesus'' omniscience')
) AS cr(verse_number, referenced_verse, relationship_type, note)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 2 AND v2.verse_number = cr.verse_number
) v;
