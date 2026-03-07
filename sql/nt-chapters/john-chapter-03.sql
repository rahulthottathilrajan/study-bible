-- ═══════════════════════════════════════════════════
-- JOHN CHAPTER 3 — Nicodemus, the New Birth, and the Love of God
-- 36 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 3,
  'John 3 contains some of the most beloved and theologically significant passages in all of Scripture. Nicodemus, a Pharisee and ruler of the Jews, comes to Jesus by night (v.2). He acknowledges Jesus as ''a teacher come from God'' because of the signs. Jesus cuts straight to the heart: ''Except a man be born again, he cannot see the kingdom of God'' (v.3). Nicodemus is bewildered — ''How can a man be born when he is old?'' (v.4). Jesus explains: ''Except a man be born of water and of the Spirit, he cannot enter into the kingdom of God. That which is born of the flesh is flesh; and that which is born of the Spirit is spirit'' (vv.5-6). The wind blows where it listeth — ''so is every one that is born of the Spirit'' (v.8). Nicodemus asks, ''How can these things be?'' (v.9). Jesus marvels: ''Art thou a master of Israel, and knowest not these things?'' (v.10). He speaks of heavenly things: ''No man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven'' (v.13). Then the typological key: ''As Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up: That whosoever believeth in him should not perish, but have eternal life'' (vv.14-15). The summit: ''For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life'' (v.16). ''For God sent not his Son into the world to condemn the world; but that the world through him might be saved'' (v.17). Judgment is self-imposed: ''he that believeth not is condemned already'' (v.18). ''Light is come into the world, and men loved darkness rather than light'' (v.19). The chapter concludes with the Baptist''s final testimony (vv.22-36): ''He must increase, but I must decrease'' (v.30). ''He that believeth on the Son hath everlasting life: and he that believeth not the Son shall not see life; but the wrath of God abideth on him'' (v.36).',
  'The New Birth and the Love of God — Ye Must Be Born Again',
  'γεννάω ἄνωθεν (gennaō anōthen)',
  'To be born again / from above — gennaō means to beget, to give birth to, to generate (from genos, offspring). Anōthen means ''from above'' (its primary meaning in John: 3:31; 19:11, 23) or ''again, anew'' (the meaning Nicodemus hears, v.4). The double meaning is deliberate: the new birth is both a second birth (''again'') and a heavenly birth (''from above''). It is not self-generated but God-generated — ''born, not of blood, nor of the will of the flesh, nor of the will of man, but of God'' (1:13). The new birth is the sovereign work of the Spirit (vv.5-8), resulting in a new nature capable of seeing and entering God''s kingdom.',
  '["Nicodemus Comes to Jesus by Night (vv.1-2): There was a man of the Pharisees named Nicodemus a ruler of the Jews. The same came to Jesus by night and said — Rabbi we know that thou art a teacher come from God for no man can do these miracles that thou doest except God be with him","Ye Must Be Born Again (vv.3-8): Jesus answered — Except a man be born again he cannot see the kingdom of God. Nicodemus saith — How can a man be born when he is old? Can he enter the second time into his mother''s womb? Jesus answered — Except a man be born of water and of the Spirit he cannot enter into the kingdom of God. That which is born of the flesh is flesh and that which is born of the Spirit is spirit. The wind bloweth where it listeth so is every one that is born of the Spirit","How Can These Things Be? (vv.9-13): Nicodemus answered — How can these things be? Jesus answered — Art thou a master of Israel and knowest not these things? We speak that we do know and testify that we have seen and ye receive not our witness. If I have told you earthly things and ye believe not how shall ye believe if I tell you of heavenly things? No man hath ascended up to heaven but he that came down from heaven even the Son of man which is in heaven","The Son of Man Lifted Up (vv.14-18): As Moses lifted up the serpent in the wilderness even so must the Son of man be lifted up that whosoever believeth in him should not perish but have eternal life. For God so loved the world that he gave his only begotten Son that whosoever believeth in him should not perish but have everlasting life. For God sent not his Son into the world to condemn the world but that the world through him might be saved. He that believeth on him is not condemned but he that believeth not is condemned already because he hath not believed in the name of the only begotten Son of God","Light and Darkness: The Judgment of Unbelief (vv.19-21): This is the condemnation that light is come into the world and men loved darkness rather than light because their deeds were evil. Every one that doeth evil hateth the light neither cometh to the light lest his deeds should be reproved. But he that doeth truth cometh to the light that his deeds may be made manifest that they are wrought in God","The Baptist''s Final Testimony: He Must Increase (vv.22-30): After these things came Jesus and his disciples into the land of Judaea and there he tarried and baptized. John also was baptizing. There arose a question about purifying. They came unto John — Rabbi he that was with thee beyond Jordan to whom thou barest witness behold the same baptizeth and all men come to him. John answered — A man can receive nothing except it be given him from heaven. Ye yourselves bear me witness that I said I am not the Christ. He that hath the bride is the bridegroom. The friend of the bridegroom rejoiceth greatly — this my joy is fulfilled. He must increase but I must decrease","He That Cometh from Above (vv.31-36): He that cometh from above is above all. He that is of the earth is earthly. He that cometh from heaven is above all. What he hath seen and heard that he testifieth and no man receiveth his testimony. He that hath received his testimony hath set to his seal that God is true. For he whom God hath sent speaketh the words of God for God giveth not the Spirit by measure. The Father loveth the Son and hath given all things into his hand. He that believeth on the Son hath everlasting life and he that believeth not the Son shall not see life but the wrath of God abideth on him"]'
FROM books b WHERE b.name = 'John';

-- Step 2: Insert all 36 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'There was a man of the Pharisees, named Nicodemus, a ruler of the Jews:',
   'ἦν δὲ ἄνθρωπος ἐκ τῶν Φαρισαίων Νικόδημος ὄνομα αὐτῷ ἄρχων τῶν Ἰουδαίων',
   'ēn de anthrōpos ek tōn Pharisaiōn Nikodēmos onoma autō archōn tōn Ioudaiōn',
   '''A man of the Pharisees'' (ek tōn Pharisaiōn — from the party of the Pharisees, the strictest sect of Judaism). ''Nicodemus'' (Nikodēmos — Greek name meaning ''victory of the people,'' from nikē + dēmos). ''A ruler of the Jews'' (archōn tōn Ioudaiōn — a member of the Sanhedrin, the supreme Jewish council). Nicodemus appears three times in John: here (coming by night), in 7:50-51 (defending Jesus before the Sanhedrin), and in 19:39 (bringing spices for Jesus'' burial). He is introduced as ''a man'' (anthrōpos) — connecting to 2:25: Jesus ''knew what was in man.''',
   NULL),
  (2, 'The same came to Jesus by night, and said unto him, Rabbi, we know that thou art a teacher come from God: for no man can do these miracles that thou doest, except God be with him.',
   'οὗτος ἦλθεν πρὸς τὸν Ἰησοῦν νυκτὸς καὶ εἶπεν αὐτῷ Ῥαββί οἴδαμεν ὅτι ἀπὸ θεοῦ ἐλήλυθας διδάσκαλος οὐδεὶς γὰρ ταῦτα τὰ σημεῖα δύναται ποιεῖν ἃ σὺ ποιεῖς ἐὰν μὴ ᾖ ὁ θεὸς μετ᾽ αὐτοῦ',
   'houtos ēlthen pros ton Iēsoun nyktos kai eipen autō Rhabbi oidamen hoti apo theou elēlythas didaskalos oudeis gar tauta ta sēmeia dynatai poiein ha sy poieis ean mē ē ho theos met autou',
   '''By night'' (nyktos — at nighttime). John uses darkness/night symbolically (cf. 9:4; 11:10; 13:30: ''it was night'' when Judas goes out). Nicodemus comes in literal darkness but is moving toward the Light. ''Rabbi'' — a respectful title. ''We know'' (oidamen — we perceive, we are convinced; the plural suggests Nicodemus represents others, perhaps other Sanhedrin members sympathetic to Jesus). ''A teacher come from God'' — sign-based recognition (cf. 2:23), genuine but insufficient. Nicodemus sees a teacher; Jesus is the Son.',
   NULL),
  (3, 'Jesus answered and said unto him, Verily, verily, I say unto thee, Except a man be born again, he cannot see the kingdom of God.',
   'ἀπεκρίθη Ἰησοῦς καὶ εἶπεν αὐτῷ Ἀμὴν ἀμὴν λέγω σοι ἐὰν μή τις γεννηθῇ ἄνωθεν οὐ δύναται ἰδεῖν τὴν βασιλείαν τοῦ θεοῦ',
   'apekrithē Iēsous kai eipen autō Amēn amēn legō soi ean mē tis gennēthē anōthen ou dynatai idein tēn basileian tou theou',
   '''Verily, verily'' (amēn amēn — the double amen is unique to John, occurring 25 times; it introduces solemn, authoritative declarations). ''Born again'' (gennēthē anōthen — born from above/anew). Anōthen has a deliberate double meaning: (1) ''from above'' — the primary Johannine usage (3:31; 19:11, 23); (2) ''again'' — how Nicodemus understands it (v.4). Both are true: the new birth is a second birth that comes from above, from God. ''Cannot see'' (ou dynatai idein — is unable to see, perceive, experience). ''The kingdom of God'' — this phrase occurs only here and v.5 in John (elsewhere John uses ''eternal life''). Without new birth, the kingdom is invisible — one lacks the spiritual sight to perceive it.',
   'The new birth is an absolute necessity (''except'' — ean mē, unless). It is not an improvement of the old nature but a new beginning from God. Nicodemus represents the best of human religion — Pharisee, ruler, teacher — yet even he must be born again. No amount of moral effort, religious observance, or theological knowledge can substitute for regeneration. The new birth is ''from above'' (anōthen) — its source is God, not man. This doctrine appears throughout the NT: Titus 3:5 (''the washing of regeneration''), 1 Peter 1:3 (''begotten us again''), 1 Peter 1:23 (''born again... by the word of God''), James 1:18 (''of his own will begat he us'').'),
  (4, 'Nicodemus saith unto him, How can a man be born when he is old? can he enter the second time into his mother''s womb, and be born?',
   'λέγει πρὸς αὐτὸν ὁ Νικόδημος Πῶς δύναται ἄνθρωπος γεννηθῆναι γέρων ὤν μὴ δύναται εἰς τὴν κοιλίαν τῆς μητρὸς αὐτοῦ δεύτερον εἰσελθεῖν καὶ γεννηθῆναι',
   'legei pros auton ho Nikodēmos Pōs dynatai anthrōpos gennēthēnai gerōn ōn mē dynatai eis tēn koilian tēs mētros autou deuteron eiselthein kai gennēthēnai',
   '''How can a man be born when he is old?'' (pōs dynatai anthrōpos gennēthēnai gerōn ōn). Nicodemus takes Jesus'' words at the physical, literal level — a characteristic Johannine misunderstanding (cf. 2:20; 4:15; 6:52; 11:12). Yet his question has theological weight: he recognizes that what Jesus describes is impossible by human effort. ''Can he enter the second time into his mother''s womb?'' — the absurdity of the physical interpretation points to the necessity of a supernatural explanation. The question ''How can?'' (pōs dynatai) is actually the right question — the answer will be: by the Spirit of God.',
   NULL),
  (5, 'Jesus answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of God.',
   'ἀπεκρίθη Ἰησοῦς Ἀμὴν ἀμὴν λέγω σοι ἐὰν μή τις γεννηθῇ ἐξ ὕδατος καὶ πνεύματος οὐ δύναται εἰσελθεῖν εἰς τὴν βασιλείαν τοῦ θεοῦ',
   'apekrithē Iēsous Amēn amēn legō soi ean mē tis gennēthē ex hydatos kai pneumatos ou dynatai eiselthein eis tēn basileian tou theou',
   '''Born of water and of the Spirit'' (gennēthē ex hydatos kai pneumatos) — the most debated phrase in John 3. Major interpretations: (1) ''Water'' = natural birth (amniotic fluid), ''Spirit'' = spiritual birth — contrasting flesh and Spirit (v.6). (2) ''Water and Spirit'' as a hendiadys (one concept): the cleansing, renewing work of the Spirit, echoing Ezekiel 36:25-27 (''I will sprinkle clean water upon you... and a new spirit will I put within you''). (3) ''Water'' = John''s baptism of repentance, ''Spirit'' = the baptism of the Holy Spirit. Interpretation (2) best fits the OT background Nicodemus should have known (v.10) and the Ezekiel prophecy of new-covenant renewal.',
   'The new birth is ''of water and Spirit'' — a single divine work of cleansing and renewal. Ezekiel 36:25-27 prophesied: ''I will sprinkle clean water upon you, and ye shall be clean... A new heart also will I give you, and a new spirit will I put within you... I will put my spirit within you.'' Jesus expects Nicodemus, ''a master of Israel'' (v.10), to recognize this OT promise. The new birth is not a human work but a divine intervention — God cleanses (water) and regenerates (Spirit) the sinner. ''Cannot enter'' (ou dynatai eiselthein) — the necessity is absolute; without the Spirit''s work, the kingdom remains closed.'),
  (6, 'That which is born of the flesh is flesh; and that which is born of the Spirit is spirit.',
   'τὸ γεγεννημένον ἐκ τῆς σαρκὸς σάρξ ἐστιν καὶ τὸ γεγεννημένον ἐκ τοῦ πνεύματος πνεῦμά ἐστιν',
   'to gegennēmenon ek tēs sarkos sarx estin kai to gegennēmenon ek tou pneumatos pneuma estin',
   '''That which is born of the flesh is flesh'' (to gegennēmenon ek tēs sarkos sarx estin — the thing begotten from flesh is flesh). ''Flesh'' (sarx) here means human nature in its natural, unregenerate state — not inherently sinful (as sometimes in Paul) but limited, earthly, incapable of producing spiritual life. Flesh can only produce flesh; the natural cannot generate the supernatural. ''That which is born of the Spirit is spirit'' — the Spirit produces a new spiritual nature. Two entirely different orders of existence: natural birth produces natural life; spiritual birth produces spiritual life. One cannot evolve into the other; a new birth is required.',
   NULL),
  (7, 'Marvel not that I said unto thee, Ye must be born again.',
   'μὴ θαυμάσῃς ὅτι εἶπόν σοι Δεῖ ὑμᾶς γεννηθῆναι ἄνωθεν',
   'mē thaumasēs hoti eipon soi Dei hymas gennēthēnai anōthen',
   '''Marvel not'' (mē thaumasēs — stop being astonished). ''Ye must'' (dei hymas — it is necessary for you [plural], you all must). The shift from singular ''thee'' (soi) to plural ''ye'' (hymas) is significant: the necessity of new birth applies not just to Nicodemus but to all people — including the most religious. ''Must'' (dei) indicates divine necessity, not optional advice. The new birth is God''s non-negotiable requirement for all humanity.',
   NULL),
  (8, 'The wind bloweth where it listeth, and thou hearest the sound thereof, but canst not tell whence it cometh, and whither it goeth: so is every one that is born of the Spirit.',
   'τὸ πνεῦμα ὅπου θέλει πνεῖ καὶ τὴν φωνὴν αὐτοῦ ἀκούεις ἀλλ᾽ οὐκ οἶδας πόθεν ἔρχεται καὶ ποῦ ὑπάγει οὕτως ἐστὶν πᾶς ὁ γεγεννημένος ἐκ τοῦ πνεύματος',
   'to pneuma hopou thelei pnei kai tēn phōnēn autou akoueis all ouk oidas pothen erchetai kai pou hypagei houtōs estin pas ho gegennēmenos ek tou pneumatos',
   'A masterful wordplay: pneuma means both ''wind'' and ''spirit'' in Greek (and ruach in Hebrew). ''The wind blows where it wishes'' (to pneuma hopou thelei pnei) — the Spirit, like the wind, is sovereign, free, and mysterious. You hear its sound (phōnēn — voice, sound) and see its effects, but cannot trace its origin or predict its path. ''So is every one that is born of the Spirit'' — the new birth is real (its effects are visible) but mysterious (its origin is divine, not humanly controllable). The Spirit is sovereign in regeneration — he moves where he wills, not where man directs.',
   'The sovereignty of the Spirit in regeneration is a central biblical doctrine. Like the wind, the Spirit cannot be commanded, controlled, or predicted by human effort. The new birth is God''s initiative, not man''s achievement. Yet the effects are real and observable — a changed life, new desires, spiritual sight. This does not negate human responsibility (v.18: ''he that believeth not is condemned'') but establishes that faith itself is the fruit of the Spirit''s sovereign work (cf. 6:44: ''No man can come to me, except the Father which hath sent me draw him''; 6:65: ''No man can come unto me, except it were given unto him of my Father'').'),
  (9, 'Nicodemus answered and said unto him, How can these things be?',
   'ἀπεκρίθη Νικόδημος καὶ εἶπεν αὐτῷ Πῶς δύναται ταῦτα γενέσθαι',
   'apekrithē Nikodēmos kai eipen autō Pōs dynatai tauta genesthai',
   '''How can these things be?'' (pōs dynatai tauta genesthai — how are these things able to happen?). Nicodemus'' third question moves from physical literalism (v.4) to genuine theological bewilderment. He is not mocking but struggling — a teacher of Israel confronted with truths he should know from his own Scriptures but has never grasped. His bewilderment will lead to a period of silent wrestling; his next appearances (7:50-51; 19:39) suggest he eventually came to faith.',
   NULL),
  (10, 'Jesus answered and said unto him, Art thou a master of Israel, and knowest not these things?',
   'ἀπεκρίθη Ἰησοῦς καὶ εἶπεν αὐτῷ Σὺ εἶ ὁ διδάσκαλος τοῦ Ἰσραὴλ καὶ ταῦτα οὐ γινώσκεις',
   'apekrithē Iēsous kai eipen autō Sy ei ho didaskalos tou Israēl kai tauta ou ginōskeis',
   '''Art thou a master of Israel?'' (sy ei ho didaskalos tou Israēl — you are the teacher of Israel; the article ho indicates Nicodemus was a renowned, authoritative teacher). ''And knowest not these things?'' — Jesus expresses astonishment. The concept of spiritual renewal was not new: Ezekiel 36:25-27 (new heart and spirit), Ezekiel 37 (dry bones brought to life), Jeremiah 31:31-34 (new covenant written on the heart), Isaiah 44:3 (Spirit poured out like water). Nicodemus, as a teacher of the OT, should have recognized these themes. Knowledge of Scripture without spiritual understanding leaves even the most learned in darkness.',
   NULL),
  (11, 'Verily, verily, I say unto thee, We speak that we do know, and testify that we have seen; and ye receive not our witness.',
   'ἀμὴν ἀμὴν λέγω σοι ὅτι ὃ οἴδαμεν λαλοῦμεν καὶ ὃ ἑωράκαμεν μαρτυροῦμεν καὶ τὴν μαρτυρίαν ἡμῶν οὐ λαμβάνετε',
   'amēn amēn legō soi hoti ho oidamen laloumen kai ho heōrakamen martyroumen kai tēn martyrian hēmōn ou lambanete',
   '''We speak that we do know'' (ho oidamen laloumen — what we know we speak). ''We testify that we have seen'' (ho heōrakamen martyroumen — what we have seen we bear witness to). The ''we'' is debated: it may be a majestic plural (Jesus and the Father/Spirit), or include the prophets and the Baptist. ''Ye receive not our witness'' (ou lambanete — you [plural] do not accept). The shift to plural ''ye'' indicts not just Nicodemus but the Jewish leadership as a whole. Direct eyewitness testimony is being rejected.',
   NULL),
  (12, 'If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?',
   'εἰ τὰ ἐπίγεια εἶπον ὑμῖν καὶ οὐ πιστεύετε πῶς ἐὰν εἴπω ὑμῖν τὰ ἐπουράνια πιστεύσετε',
   'ei ta epigeia eipon hymin kai ou pisteuete pōs ean eipō hymin ta epourania pisteusete',
   '''Earthly things'' (ta epigeia — things that happen on earth, like the new birth which is experienced by humans on earth). ''Heavenly things'' (ta epourania — things belonging to the heavenly realm). The new birth, though supernatural in origin, is ''earthly'' in that it occurs within human experience. The ''heavenly things'' Jesus will now reveal (vv.13-18) are the divine plan of salvation: the descent and ascent of the Son of Man, the love of God, the giving of the Son. If they cannot grasp the earthly analogy (wind/Spirit), how will they comprehend the heavenly reality?',
   NULL),
  (13, 'And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven.',
   'καὶ οὐδεὶς ἀναβέβηκεν εἰς τὸν οὐρανὸν εἰ μὴ ὁ ἐκ τοῦ οὐρανοῦ καταβάς ὁ υἱὸς τοῦ ἀνθρώπου ὁ ὢν ἐν τῷ οὐρανῷ',
   'kai oudeis anabebēken eis ton ouranon ei mē ho ek tou ouranou katabas ho huios tou anthrōpou ho ōn en tō ouranō',
   '''No man hath ascended up to heaven'' (oudeis anabebēken — no one has gone up; perfect tense: no one has ascended and remains there to bring back revelation). ''But he that came down from heaven'' (ho ek tou ouranou katabas — the one who descended from heaven). Only one who has been in heaven can reveal heavenly things. ''The Son of man which is in heaven'' (ho ōn en tō ouranō — who is in heaven; present participle, indicating continuous existence in heaven even while on earth). This is a stunning claim of simultaneous heavenly and earthly existence — the divine nature of the Son is always ''in heaven'' even while his incarnate person walks on earth.',
   'This verse makes three christological claims of immense significance: (1) Jesus came down from heaven — he has a pre-existent, heavenly origin (cf. 6:38, 62; 8:23). (2) He alone has ascended — he alone has direct knowledge of heavenly realities (cf. 1:18). (3) He is in heaven — even while speaking on earth, the Son of man ''is in heaven'' (present tense), indicating the divine omnipresence of the incarnate Son. The title ''Son of man'' combines Daniel 7:13-14 (the heavenly figure receiving universal dominion) with the humble humanity of Jesus. He is both the heavenly Son of man and the earthly Jesus.'),
  (14, 'And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up:',
   'καὶ καθὼς Μωϋσῆς ὕψωσεν τὸν ὄφιν ἐν τῇ ἐρήμῳ οὕτως ὑψωθῆναι δεῖ τὸν υἱὸν τοῦ ἀνθρώπου',
   'kai kathōs Mōysēs hypsōsen ton ophin en tē erēmō houtōs hypsōthēnai dei ton huion tou anthrōpou',
   '''As Moses lifted up the serpent'' (kathōs Mōysēs hypsōsen ton ophin — referring to Numbers 21:4-9, where God sent fiery serpents among Israel for their sin; when they repented, God commanded Moses to make a bronze serpent and set it on a pole — anyone bitten who looked at it lived). ''Even so must the Son of man be lifted up'' (houtōs hypsōthēnai dei — thus it is necessary for the Son of man to be lifted up). ''Lifted up'' (hypsōthēnai — from hypsoō: to lift up, to exalt) has a double meaning in John: (1) the physical lifting on the cross (crucifixion), and (2) exaltation in glory (cf. 8:28; 12:32-34). ''Must'' (dei) — divine necessity; the cross is not an accident but God''s determined plan.',
   'The bronze serpent typology is one of the most important OT prefigurations of the cross. (1) Israel sinned and was dying — humanity is dying in sin. (2) God provided a remedy — the bronze serpent/the Son of man lifted up. (3) The remedy required looking in faith — ''every one that is bitten, when he looketh upon it, shall live'' (Numbers 21:8). (4) Looking at the bronze serpent did not remove the snakes — it provided life despite the judgment. Similarly, the cross does not remove the reality of sin''s consequences in this world but provides eternal life to all who look to Christ in faith. The parallel is exact: as the serpent was ''lifted up'' on a pole, so Christ was ''lifted up'' on the cross.'),
  (15, 'That whosoever believeth in him should not perish, but have eternal life.',
   'ἵνα πᾶς ὁ πιστεύων εἰς αὐτὸν μὴ ἀπόληται ἀλλ᾽ ἔχῃ ζωὴν αἰώνιον',
   'hina pas ho pisteuōn eis auton mē apolētai all echē zōēn aiōnion',
   '''Whosoever believeth'' (pas ho pisteuōn — every one who is believing, present participle: continuous, active faith). ''In him'' (eis auton — into him, denoting personal trust and union). ''Should not perish'' (mē apolētai — might not be destroyed, lost, ruined; the aorist subjunctive suggests a decisive deliverance from perishing). ''But have eternal life'' (echē zōēn aiōnion — might have life of the age to come, life that belongs to eternity). Eternal life in John is not merely endless duration but a quality of life — the life of God himself experienced now and forever (17:3). The condition is faith; the result is life.',
   NULL),
  (16, 'For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.',
   'οὕτως γὰρ ἠγάπησεν ὁ θεὸς τὸν κόσμον ὥστε τὸν υἱὸν αὐτοῦ τὸν μονογενῆ ἔδωκεν ἵνα πᾶς ὁ πιστεύων εἰς αὐτὸν μὴ ἀπόληται ἀλλ᾽ ἔχῃ ζωὴν αἰώνιον',
   'houtōs gar ēgapēsen ho theos ton kosmon hōste ton huion autou ton monogenē edōken hina pas ho pisteuōn eis auton mē apolētai all echē zōēn aiōnion',
   '''For God so loved'' (houtōs gar ēgapēsen ho theos — for God loved in this way, to this degree). ''So'' (houtōs) means ''in this manner, to such an extent'' — it describes the quality and magnitude of God''s love, not merely a comparison. ''The world'' (ton kosmon — the created order, humanity in its fallenness and rebellion). God''s love reaches beyond Israel to the whole world. ''Gave'' (edōken — aorist: a definitive, completed act of giving). ''His only begotten Son'' (ton huion autou ton monogenē — his unique, one-of-a-kind Son; monogenēs means ''one and only,'' ''unique,'' not merely ''only begotten'' in the biological sense). ''Whosoever believeth'' — the universal offer: salvation is available to all without exception. ''Should not perish but have everlasting life'' — the two destinies: perishing or eternal life. Faith in the Son is the dividing line.',
   'John 3:16 is rightly called ''the gospel in miniature'' — it summarizes the entire message of Scripture in one sentence. It reveals: (1) The source of salvation — ''God'' (not human effort or merit). (2) The motive — ''so loved'' (love, not obligation or compulsion). (3) The scope — ''the world'' (universal in extent, not limited to one nation). (4) The cost — ''gave his only begotten Son'' (the supreme sacrifice). (5) The condition — ''whosoever believeth in him'' (faith alone, available to all). (6) The negative result averted — ''should not perish'' (deliverance from eternal destruction). (7) The positive result — ''but have everlasting life'' (the gift of God''s own life). The verse establishes that salvation is by grace (God''s initiative), through faith (the human response), in Christ alone (the only begotten Son).'),
  (17, 'For God sent not his Son into the world to condemn the world; but that the world through him might be saved.',
   'οὐ γὰρ ἀπέστειλεν ὁ θεὸς τὸν υἱὸν αὐτοῦ εἰς τὸν κόσμον ἵνα κρίνῃ τὸν κόσμον ἀλλ᾽ ἵνα σωθῇ ὁ κόσμος δι᾽ αὐτοῦ',
   'ou gar apesteilen ho theos ton huion autou eis ton kosmon hina krinē ton kosmon all hina sōthē ho kosmos di autou',
   '''Sent'' (apesteilen — sent on a mission, commissioned; from apostellō, the root of ''apostle''). ''Not to condemn'' (hina krinē — not to judge, pass sentence). ''But that the world through him might be saved'' (hina sōthē ho kosmos di autou — that the world might be saved through him). The purpose of the Incarnation is salvation, not condemnation. The world already stands under judgment (v.18); Jesus came not to add to its condemnation but to rescue it. ''Through him'' (di autou) — Christ is the exclusive means of salvation (cf. 14:6; Acts 4:12).',
   NULL),
  (18, 'He that believeth on him is not condemned: but he that believeth not is condemned already, because he hath not believed in the name of the only begotten Son of God.',
   'ὁ πιστεύων εἰς αὐτὸν οὐ κρίνεται ὁ δὲ μὴ πιστεύων ἤδη κέκριται ὅτι μὴ πεπίστευκεν εἰς τὸ ὄνομα τοῦ μονογενοῦς υἱοῦ τοῦ θεοῦ',
   'ho pisteuōn eis auton ou krinetai ho de mē pisteuōn ēdē kekritai hoti mē pepisteuken eis to onoma tou monogenous huiou tou theou',
   '''Is not condemned'' (ou krinetai — is not being judged; present tense: the believer lives in a state of no-condemnation, cf. Romans 8:1). ''Is condemned already'' (ēdē kekritai — has already been judged; perfect tense: the verdict already stands and continues). ''Because he hath not believed'' (mē pepisteuken — has not believed and continues in unbelief; perfect tense). Condemnation is not a future event for the unbeliever — it is a present reality. Unbelief is not merely ignorance but active rejection: the light has come (v.19) and they prefer darkness. ''The name of the only begotten Son of God'' — to believe ''in the name'' is to trust in the person and all that the name represents.',
   'John 3:18 establishes the present reality of both salvation and condemnation. The believer is ''not condemned'' — not because of personal merit but because Christ bore the condemnation (Romans 8:1, 33-34). The unbeliever ''is condemned already'' — not because God arbitrarily sentences but because refusal to believe in God''s provided remedy leaves one under the judgment that sin already deserves. Faith does not create a new situation; it appropriates the salvation God has already provided. Unbelief does not create a new judgment; it leaves one in the condemnation that already exists. The tenses are crucial: the perfect tense (kekritai, pepisteuken) indicates settled states, not momentary lapses.'),
  (19, 'And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.',
   'αὕτη δέ ἐστιν ἡ κρίσις ὅτι τὸ φῶς ἐλήλυθεν εἰς τὸν κόσμον καὶ ἠγάπησαν οἱ ἄνθρωποι μᾶλλον τὸ σκότος ἢ τὸ φῶς ἦν γὰρ πονηρὰ αὐτῶν τὰ ἔργα',
   'hautē de estin hē krisis hoti to phōs elēlythen eis ton kosmon kai ēgapēsan hoi anthrōpoi mallon to skotos ē to phōs ēn gar ponēra autōn ta erga',
   '''This is the condemnation'' (hautē estin hē krisis — this is the judgment, the basis of the verdict). ''Light is come into the world'' (to phōs elēlythen — the light has come; perfect tense: has come and remains present). ''Men loved darkness rather than light'' (ēgapēsan... mallon to skotos ē to phōs — loved the darkness more than the light; aorist: a decisive, culpable preference). ''Because their deeds were evil'' (ponēra — wicked, worthless). The condemnation is not arbitrary: light came, and they chose darkness. The moral root of unbelief is not intellectual difficulty but moral resistance — evil deeds cannot tolerate the exposure that light brings.',
   NULL),
  (20, 'For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.',
   'πᾶς γὰρ ὁ φαῦλα πράσσων μισεῖ τὸ φῶς καὶ οὐκ ἔρχεται πρὸς τὸ φῶς ἵνα μὴ ἐλεγχθῇ τὰ ἔργα αὐτοῦ',
   'pas gar ho phaula prassōn misei to phōs kai ouk erchetai pros to phōs hina mē elenchthē ta erga autou',
   '''Doeth evil'' (phaula prassōn — practising worthless, base things). ''Hateth the light'' (misei to phōs — hates, detests the light). ''Lest his deeds should be reproved'' (hina mē elenchthē — lest they be exposed, convicted, brought to light). The verb elenchō means to expose, convict, bring to light — more than mere criticism; it is the painful revelation of what was hidden. Evildoers flee the light not because the light is harmful but because it reveals what they wish to hide. This explains why the most religious people can be the most resistant to Jesus: the light threatens their self-constructed righteousness.',
   NULL),
  (21, 'But he that doeth truth cometh to the light, that his deeds may be made manifest, that they are wrought in God.',
   'ὁ δὲ ποιῶν τὴν ἀλήθειαν ἔρχεται πρὸς τὸ φῶς ἵνα φανερωθῇ αὐτοῦ τὰ ἔργα ὅτι ἐν θεῷ ἐστιν εἰργασμένα',
   'ho de poiōn tēn alētheian erchetai pros to phōs hina phanerōthē autou ta erga hoti en theō estin eirgasmena',
   '''Doeth truth'' (poiōn tēn alētheian — practising, doing the truth; truth is not merely believed but lived). ''Cometh to the light'' (erchetai pros to phōs — moves toward the light, welcomes exposure). ''Wrought in God'' (en theō estin eirgasmena — have been worked/accomplished in God; perfect passive: God is the source and sphere of the good works). The one who lives truthfully has nothing to fear from the light; indeed, they welcome it because it reveals that their works were not self-generated but God-enabled. Coming to the light is itself evidence of the Spirit''s work.',
   NULL),
  (22, 'After these things came Jesus and his disciples into the land of Judaea; and there he tarried with them, and baptized.',
   'μετὰ ταῦτα ἦλθεν ὁ Ἰησοῦς καὶ οἱ μαθηταὶ αὐτοῦ εἰς τὴν Ἰουδαίαν γῆν καὶ ἐκεῖ διέτριβεν μετ᾽ αὐτῶν καὶ ἐβάπτιζεν',
   'meta tauta ēlthen ho Iēsous kai hoi mathētai autou eis tēn Ioudaian gēn kai ekei dietriben met autōn kai ebaptizen',
   '''The land of Judaea'' (tēn Ioudaian gēn — the Judaean countryside, distinct from Jerusalem). ''Tarried'' (dietriben — spent time, stayed). ''Baptized'' (ebaptizen — was baptizing; 4:2 clarifies that Jesus himself did not baptize but his disciples did). This period of concurrent ministry with John the Baptist is unique to John''s Gospel and is not recorded in the Synoptics. It reveals a transitional period where both ministries overlapped.',
   NULL),
  (23, 'And John also was baptizing in Aenon near to Salim, because there was much water there: and they came, and were baptized.',
   'ἦν δὲ καὶ Ἰωάννης βαπτίζων ἐν Αἰνὼν ἐγγὺς τοῦ Σαλείμ ὅτι ὕδατα πολλὰ ἦν ἐκεῖ καὶ παρεγίνοντο καὶ ἐβαπτίζοντο',
   'ēn de kai Iōannēs baptizōn en Ainōn engys tou Saleim hoti hydata polla ēn ekei kai pareginonto kai ebaptizonto',
   '''Aenon near to Salim'' — Aenon (from Hebrew ''ayin,'' spring) was likely in the Jordan valley, either near Scythopolis (Beth-shan) or in Samaria. ''Because there was much water there'' (hydata polla — many waters, multiple springs). The note about ''much water'' confirms baptism by immersion. John had not yet been imprisoned (v.24, cf. Matthew 4:12). The overlap of ministries shows John''s faithful continuation until God''s appointed transition.',
   NULL),
  (24, 'For John was not yet cast into prison.',
   'οὔπω γὰρ ἦν βεβλημένος εἰς τὴν φυλακὴν ὁ Ἰωάννης',
   'oupō gar ēn beblēmenos eis tēn phylakēn ho Iōannēs',
   '''Not yet cast into prison'' (oupō ēn beblēmenos — had not yet been thrown into prison; periphrastic pluperfect). This parenthetical note synchronises John''s account with the Synoptics, which begin Jesus'' Galilean ministry after John''s imprisonment (Mark 1:14; Matthew 4:12). John''s Gospel preserves an earlier phase of Jesus'' ministry — a Judaean ministry concurrent with the Baptist''s, before the Galilean ministry of the Synoptics.',
   NULL),
  (25, 'Then there arose a question between some of John''s disciples and the Jews about purifying.',
   'ἐγένετο οὖν ζήτησις ἐκ τῶν μαθητῶν Ἰωάννου μετὰ Ἰουδαίου περὶ καθαρισμοῦ',
   'egeneto oun zētēsis ek tōn mathētōn Iōannou meta Ioudaiou peri katharismou',
   '''A question'' (zētēsis — a dispute, controversy, investigation). ''About purifying'' (peri katharismou — concerning purification/cleansing). The debate about purification connects to 2:6 (the waterpots for purification at Cana) and the larger theme: the old purification rites are being superseded. John''s baptism was itself a purification rite; now Jesus'' disciples are also baptizing. The question naturally arises: whose purification is authoritative?',
   NULL),
  (26, 'And they came unto John, and said unto him, Rabbi, he that was with thee beyond Jordan, to whom thou barest witness, behold, the same baptizeth, and all men come to him.',
   'καὶ ἦλθον πρὸς τὸν Ἰωάννην καὶ εἶπον αὐτῷ Ῥαββί ὃς ἦν μετὰ σοῦ πέραν τοῦ Ἰορδάνου ᾧ σὺ μεμαρτύρηκας ἴδε οὗτος βαπτίζει καὶ πάντες ἔρχονται πρὸς αὐτόν',
   'kai ēlthon pros ton Iōannēn kai eipon autō Rhabbi hos ēn meta sou peran tou Iordanou hō sy memartyrēkas ide houtos baptizei kai pantes erchontai pros auton',
   '''He that was with thee beyond Jordan'' — referring to the baptism scene (1:28-34). ''To whom thou barest witness'' (hō sy memartyrēkas — you have testified about him; perfect tense: your testimony stands). ''All men come to him'' — an exaggeration born of anxiety. John''s disciples are jealous: their master''s crowd is shrinking while Jesus'' grows. They see Jesus as a competitor; John sees him as the fulfillment.',
   NULL),
  (27, 'John answered and said, A man can receive nothing, except it be given him from heaven.',
   'ἀπεκρίθη Ἰωάννης καὶ εἶπεν Οὐ δύναται ἄνθρωπος λαμβάνειν οὐδὲν ἐὰν μὴ ᾖ δεδομένον αὐτῷ ἐκ τοῦ οὐρανοῦ',
   'apekrithē Iōannēs kai eipen Ou dynatai anthrōpos lambanein ouden ean mē ē dedomenon autō ek tou ouranou',
   '''A man can receive nothing, except it be given him from heaven'' (ou dynatai anthrōpos lambanein ouden ean mē ē dedomenon autō ek tou ouranou). John''s response is a model of spiritual maturity: every ministry, every gift, every role is given from heaven. One cannot take more than God assigns. This principle eliminates both pride (you did not create your ministry) and jealousy (God gives as he wills). John''s ministry was divinely assigned — and so is Jesus''.',
   NULL),
  (28, 'Ye yourselves bear me witness, that I said, I am not the Christ, but that I am sent before him.',
   'αὐτοὶ ὑμεῖς μοι μαρτυρεῖτε ὅτι εἶπον Οὐκ εἰμὶ ἐγὼ ὁ Χριστός ἀλλ᾽ ὅτι ἀπεσταλμένος εἰμὶ ἔμπροσθεν ἐκείνου',
   'autoi hymeis moi martyreite hoti eipon Ouk eimi egō ho Christos all hoti apestalmenos eimi emprosthen ekeinou',
   '''I said, I am not the Christ'' (ouk eimi egō ho Christos — I am not the Messiah; cf. 1:20). ''I am sent before him'' (apestalmenos eimi emprosthen ekeinou — I have been sent ahead of him). John reminds his disciples of what he has consistently declared: he is the forerunner, not the Messiah. His role is preparatory, not ultimate. True ministry is clear about its own limitations and points consistently to Christ.',
   NULL),
  (29, 'He that hath the bride is the bridegroom: but the friend of the bridegroom, which standeth and heareth him, rejoiceth greatly because of the bridegroom''s voice: this my joy therefore is fulfilled.',
   'ὁ ἔχων τὴν νύμφην νυμφίος ἐστίν ὁ δὲ φίλος τοῦ νυμφίου ὁ ἑστηκὼς καὶ ἀκούων αὐτοῦ χαρᾷ χαίρει διὰ τὴν φωνὴν τοῦ νυμφίου αὕτη οὖν ἡ χαρὰ ἡ ἐμὴ πεπλήρωται',
   'ho echōn tēn nymphēn nymphios estin ho de philos tou nymphiou ho hestēkōs kai akouōn autou chara chairei dia tēn phōnēn tou nymphiou hautē oun hē chara hē emē peplērōtai',
   '''The bride'' (tēn nymphēn) — the people of God (cf. Isaiah 62:4-5; Hosea 2:19-20; Ephesians 5:25-27; Revelation 19:7). ''The bridegroom'' (nymphios) — Jesus (cf. Matthew 9:15; 25:1-13). ''The friend of the bridegroom'' (philos tou nymphiou — the best man, the ''shoshbin'' in Jewish wedding custom, who arranged the wedding, brought the couple together, and rejoiced when the bridegroom''s voice was heard). ''This my joy is fulfilled'' (hautē hē chara hē emē peplērōtai — this joy of mine has been made full; perfect tense: permanently fulfilled). John''s joy is complete because the Bridegroom has come and claimed his bride.',
   NULL),
  (30, 'He must increase, but I must decrease.',
   'ἐκεῖνον δεῖ αὐξάνειν ἐμὲ δὲ ἐλαττοῦσθαι',
   'ekeinon dei auxanein eme de elattousthai',
   '''He must increase'' (ekeinon dei auxanein — that one must grow, become greater). ''I must decrease'' (eme de elattousthai — but I must become less, diminish). Two occurrences of dei (it is necessary, it is divinely ordained). This is not mere humility but theological conviction: the forerunner must fade as the Messiah rises. The Baptist''s entire ministry finds its meaning in pointing beyond itself to Christ. This verse is the motto of all authentic Christian ministry: the servant decreases so that the Master may increase.',
   NULL),
  (31, 'He that cometh from above is above all: he that is of the earth is earthly, and speaketh of the earth: he that cometh from heaven is above all.',
   'ὁ ἄνωθεν ἐρχόμενος ἐπάνω πάντων ἐστίν ὁ ὢν ἐκ τῆς γῆς ἐκ τῆς γῆς ἐστιν καὶ ἐκ τῆς γῆς λαλεῖ ὁ ἐκ τοῦ οὐρανοῦ ἐρχόμενος ἐπάνω πάντων ἐστίν',
   'ho anōthen erchomenos epanō pantōn estin ho ōn ek tēs gēs ek tēs gēs estin kai ek tēs gēs lalei ho ek tou ouranou erchomenos epanō pantōn estin',
   '''He that cometh from above'' (ho anōthen erchomenos — the one coming from above). ''Is above all'' (epanō pantōn estin — is over all things, supreme above everyone). ''He that is of the earth'' (ho ōn ek tēs gēs — the one being from the earth). The contrast is absolute: Jesus comes from above (anōthen — the same word as ''born again/from above'' in v.3); all others, including the Baptist, are ''of the earth.'' Even the greatest human prophet speaks from an earthly perspective; only the one from heaven speaks with heavenly authority. This may be John the Baptist''s closing speech or the Evangelist''s theological commentary.',
   NULL),
  (32, 'And what he hath seen and heard, that he testifieth; and no man receiveth his testimony.',
   'καὶ ὃ ἑώρακεν καὶ ἤκουσεν τοῦτο μαρτυρεῖ καὶ τὴν μαρτυρίαν αὐτοῦ οὐδεὶς λαμβάνει',
   'kai ho heōraken kai ēkousen touto martyrei kai tēn martyrian autou oudeis lambanei',
   '''What he hath seen and heard'' (ho heōraken kai ēkousen — what he has seen [perfect: continuing vision] and heard [aorist: specific revelation]). Jesus testifies from direct, firsthand experience of heavenly realities (cf. 1:18; 3:11, 13). ''No man receiveth his testimony'' (oudeis lambanei — no one accepts). An apparent contradiction with v.33 (''he that hath received'') — the point is that the general response is rejection; those who do receive are the exception, made possible by God''s grace.',
   NULL),
  (33, 'He that hath received his testimony hath set to his seal that God is true.',
   'ὁ λαβὼν αὐτοῦ τὴν μαρτυρίαν ἐσφράγισεν ὅτι ὁ θεὸς ἀληθής ἐστιν',
   'ho labōn autou tēn martyrian esphragisen hoti ho theos alēthēs estin',
   '''Hath set to his seal'' (esphragisen — has sealed, certified, authenticated). In the ancient world, a seal (sphragis) authenticated a document as genuine. To receive Jesus'' testimony is to certify that God is true — because Jesus speaks God''s words. Conversely, to reject Jesus'' testimony is to call God a liar (cf. 1 John 5:10). Faith in Jesus'' word is not merely believing Jesus; it is affirming the truthfulness of God himself.',
   NULL),
  (34, 'For he whom God hath sent speaketh the words of God: for God giveth not the Spirit by measure unto him.',
   'ὃν γὰρ ἀπέστειλεν ὁ θεὸς τὰ ῥήματα τοῦ θεοῦ λαλεῖ οὐ γὰρ ἐκ μέτρου δίδωσιν ὁ θεὸς τὸ πνεῦμα',
   'hon gar apesteilen ho theos ta rhēmata tou theou lalei ou gar ek metrou didōsin ho theos to pneuma',
   '''Speaketh the words of God'' (ta rhēmata tou theou lalei — speaks the very utterances of God; rhēmata are specific spoken words, not abstract concepts). ''God giveth not the Spirit by measure'' (ou gar ek metrou didōsin ho theos to pneuma — not by measure does God give the Spirit). The prophets received the Spirit in limited portions for specific tasks; Jesus receives the Spirit without limit, without measure. The fullness of the Spirit rests permanently on Jesus (cf. 1:32-33; Isaiah 11:2; 42:1; 61:1; Colossians 1:19). This unlimited endowment is why Jesus'' words are God''s words — he speaks from the infinite fullness of the Spirit.',
   'The unmeasured gift of the Spirit to Jesus is theologically significant: (1) OT prophets received the Spirit for specific tasks and limited periods (1 Samuel 16:14 — ''the Spirit of the LORD departed from Saul''). (2) Jesus receives the Spirit without measure, permanently (John 1:32-33 — ''the Spirit descending and remaining upon him''). (3) This unlimited endowment means Jesus'' words carry ultimate divine authority — they are the very words of God. (4) From Jesus'' fullness, the Spirit will be given to believers (7:38-39; 20:22), though always in measure, as gifts are distributed (1 Corinthians 12:11; Ephesians 4:7).'),
  (35, 'The Father loveth the Son, and hath given all things into his hand.',
   'ὁ πατὴρ ἀγαπᾷ τὸν υἱὸν καὶ πάντα δέδωκεν ἐν τῇ χειρὶ αὐτοῦ',
   'ho patēr agapa ton huion kai panta dedōken en tē cheiri autou',
   '''The Father loveth the Son'' (ho patēr agapa ton huion — present tense: the Father continually loves the Son). This is the eternal, inner-Trinitarian love — the love between Father and Son that exists before the foundation of the world (17:24). ''Hath given all things into his hand'' (panta dedōken en tē cheiri autou — has given all things; perfect tense: a completed act with permanent results). ''All things'' (panta) — universal authority, complete sovereignty. The Father''s love is not passive sentiment but active entrustment of all authority to the Son (cf. Matthew 11:27; 28:18; John 13:3; 17:2).',
   NULL),
  (36, 'He that believeth on the Son hath everlasting life: and he that believeth not the Son shall not see life; but the wrath of God abideth on him.',
   'ὁ πιστεύων εἰς τὸν υἱὸν ἔχει ζωὴν αἰώνιον ὁ δὲ ἀπειθῶν τῷ υἱῷ οὐκ ὄψεται ζωήν ἀλλ᾽ ἡ ὀργὴ τοῦ θεοῦ μένει ἐπ᾽ αὐτόν',
   'ho pisteuōn eis ton huion echei zōēn aiōnion ho de apeithōn tō huiō ouk opsetai zōēn all hē orgē tou theou menei ep auton',
   '''Believeth on the Son'' (pisteuōn eis ton huion — present participle: the one continually believing into the Son). ''Hath everlasting life'' (echei zōēn aiōnion — possesses, present tense: eternal life is a present possession, not merely a future hope). ''Believeth not'' (apeithōn — literally ''disobeying''; the word is not apistōn [not believing] but apeithōn [not obeying, being rebellious]. Unbelief is disobedience). ''Shall not see life'' (ouk opsetai zōēn — will not see, experience, know life). ''The wrath of God abideth on him'' (hē orgē tou theou menei ep auton — remains, continues to rest upon him; present tense: God''s wrath is not a future threat but a present reality for the unbeliever).',
   'John 3:36 is the climactic conclusion of the chapter, establishing two absolute categories: (1) The believer ''has'' (present tense) everlasting life — it is a current possession, not a future uncertainty. (2) The unbeliever/disobedient one does not merely lack life but lives under the abiding wrath of God. Note: ''believeth not'' translates apeithōn (disobeying), not apistōn (not believing) — unbelief is ultimately an act of rebellion against God''s authority. ''The wrath of God'' (hē orgē tou theou) — John rarely uses this phrase (only here in the Gospel), but when he does, it is emphatic. God''s wrath is not arbitrary anger but his settled, holy opposition to sin. It ''abideth'' (menei — remains) — it is not removed by time or good works but only by faith in the Son.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'John' AND c.chapter_number = 3;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, greek_word, transliteration, strongs_number, definition, word_order)
SELECT v.id, ws.greek_word, ws.transliteration, ws.strongs_number, ws.definition, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἄνωθεν', 'anōthen', 'G509',
   'From above, from a higher place; anew, again; from the beginning.',
   'Anōthen is the key to the Nicodemus dialogue. Its dual meaning (''from above'' and ''again'') creates a deliberate ambiguity. Nicodemus hears ''again'' (v.4); Jesus means ''from above'' (the primary Johannine usage: 3:31; 19:11, 23). Both are true: the new birth is a second birth (not a continuation) that comes from above (not from human effort). In 19:23, the seamless robe woven ''from the top'' (anōthen) symbolises the heavenly origin of Christ''s work. In 19:11, Pilate''s authority comes ''from above.'' The new birth is a heavenly invasion of earthly existence.',
   1),
  ('πνεῦμα', 'pneuma', 'G4151',
   'Spirit, wind, breath; the immaterial part of a person; the Holy Spirit of God.',
   'Pneuma occurs 24 times in John''s Gospel. In 3:5-8, the wordplay between ''wind'' and ''Spirit'' is central: the same word means both, illustrating the sovereign, invisible, powerful nature of the Spirit''s work. The Spirit is the agent of new birth (v.5), blowing where he wills (v.8), given without measure to Jesus (v.34). John links pneuma to water (3:5; 7:38-39), to truth (4:23-24; 14:17; 15:26; 16:13), and to life (6:63). The Spirit is personal (14:26; 16:13 — ''he''), sent by the Father (14:26) and the Son (15:26; 16:7).',
   2),
  ('μονογενής', 'monogenēs', 'G3439',
   'Only begotten, one and only, unique, one of a kind; the sole representative of a class.',
   'From monos (only) + genos (kind, type). Monogenēs does not primarily mean ''only begotten'' (as if derived from gennaō, to beget) but ''one of a kind, unique'' (from genos, kind). It is used of Isaac (Hebrews 11:17) — who was not Abraham''s only son, but his unique, covenant son. Applied to Jesus in John (1:14, 18; 3:16, 18), it affirms his unique, one-of-a-kind relationship with the Father — he is the Son in a way no other being is or can be. The LXX uses it for an ''only child'' (Judges 11:34). In John 3:16, the giving of the monogenēs Son underscores the supreme cost of God''s love.',
   3),
  ('κόσμος', 'kosmos', 'G2889',
   'World, ordered universe, humanity, the realm of human existence; often the world in its fallenness and opposition to God.',
   'Kosmos occurs 78 times in John — more than any other NT book. It has multiple nuances: (1) the created world (1:10: ''the world was made by him''), (2) humanity (3:16: ''God so loved the world''), (3) the world-system opposed to God (15:18-19: ''the world hateth you''). In 3:16-17, kosmos is the object of God''s love and the target of salvation — fallen humanity in its totality. God''s love is not limited to Israel but extends to the whole created order. Yet the kosmos can also be hostile: it rejects the light (1:10-11; 3:19) and hates Christ and his followers (7:7; 15:18).',
   4),
  ('ζωὴ αἰώνιος', 'zōē aiōnios', 'G2222/G166',
   'Eternal life, everlasting life; the life of the age to come, the life proper to God himself.',
   'Zōē aiōnios appears 17 times in John''s Gospel — more than in any other NT book. It is not merely endless duration but a quality of life: ''This is life eternal, that they might know thee the only true God, and Jesus Christ, whom thou hast sent'' (17:3). Eternal life is knowing God through Christ — a present reality (3:36: ''hath everlasting life''; 5:24: ''is passed from death unto life''), not merely a future hope. It begins at the moment of faith and continues forever. Zōē in John is always God''s own life shared with believers, as distinct from bios (biological existence) or psychē (natural soul-life).',
   5),
  ('ὑψόω', 'hypsoō', 'G5312',
   'To lift up, to raise high, to exalt; used of both physical elevation and glorification.',
   'In John, hypsoō has a distinctive double meaning: (1) the physical lifting up on the cross — crucifixion (3:14; 8:28; 12:32-34), and (2) exaltation to glory. The cross is simultaneously the place of deepest humiliation and highest glorification. ''As Moses lifted up the serpent... so must the Son of man be lifted up'' (3:14) — the bronze serpent was lifted on a pole for all to see. ''When ye have lifted up the Son of man, then shall ye know'' (8:28) — the cross reveals Jesus'' identity. ''I, if I be lifted up from the earth, will draw all men unto me'' (12:32) — the cross is the means of universal attraction.',
   6),
  ('νυμφίος', 'nymphios', 'G3566',
   'Bridegroom; the male partner in a wedding; used metaphorically of Christ in relation to his people.',
   'The bridegroom imagery has deep OT roots: God is the husband of Israel (Isaiah 54:5; 62:4-5; Hosea 2:16, 19-20; Jeremiah 2:2). John the Baptist identifies Jesus as the nymphios and himself as the ''friend of the bridegroom'' (philos tou nymphiou, v.29) — the shoshbin who arranges the wedding and rejoices when the bridegroom arrives. Jesus also uses the image (Matthew 9:15; 25:1-13). The church is the bride of Christ (Ephesians 5:25-32; Revelation 19:7; 21:2, 9). The Baptist''s joy is complete because the Bridegroom has come for his bride.',
   7),
  ('ὀργή', 'orgē', 'G3709',
   'Wrath, anger, indignation; God''s settled, holy, righteous opposition to sin.',
   'Orgē appears only once in John''s Gospel (3:36) but is emphatic: ''the wrath of God abideth on him.'' God''s wrath is not arbitrary rage but his consistent, holy response to sin and rebellion. It ''abideth'' (menei — remains, stays) on the one who disobeys the Son — it is not a future threat but a present reality. Only faith in the Son removes God''s wrath (Romans 3:25; 5:9; 1 Thessalonians 1:10; 5:9). The concept of divine wrath is essential to understanding the cross: Christ bore God''s wrath in the place of sinners (Isaiah 53:4-6, 10; Romans 3:25; Galatians 3:13; 1 John 2:2).',
   8)
) AS ws(greek_word, transliteration, strongs_number, definition, word_order)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 3
  AND v2.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 8
    WHEN 3 THEN 16
    WHEN 4 THEN 16
    WHEN 5 THEN 15
    WHEN 6 THEN 14
    WHEN 7 THEN 29
    WHEN 8 THEN 36
  END
) v;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, referenced_verse, relationship_type, note)
SELECT v.id, cr.referenced_verse, cr.relationship_type, cr.note
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1: Nicodemus
  (1, 'John 7:50-51', 'parallel', 'Nicodemus defends Jesus before the Sanhedrin: ''Doth our law judge any man, before it hear him?'''),
  (1, 'John 19:39', 'parallel', 'Nicodemus brings myrrh and aloes for Jesus'' burial — a journey from night to daylight'),
  (1, 'John 2:23-25', 'context', 'Many believed because of signs — Jesus knew what was in man; Nicodemus is one such man'),
  -- v.3: Born again/from above
  (3, '1 Peter 1:3', 'thematic', '''Begotten us again unto a lively hope by the resurrection of Jesus Christ'''),
  (3, '1 Peter 1:23', 'thematic', '''Being born again, not of corruptible seed, but of incorruptible, by the word of God'''),
  (3, 'Titus 3:5', 'thematic', '''The washing of regeneration, and renewing of the Holy Ghost'''),
  (3, 'James 1:18', 'thematic', '''Of his own will begat he us with the word of truth'''),
  -- v.5: Born of water and the Spirit
  (5, 'Ezekiel 36:25-27', 'prophecy', '''I will sprinkle clean water upon you... a new heart... a new spirit... my spirit within you'''),
  (5, 'Ezekiel 37:1-14', 'thematic', 'The valley of dry bones — the Spirit gives life to the dead'),
  (5, 'Titus 3:5', 'thematic', '''The washing of regeneration, and renewing of the Holy Ghost'''),
  -- v.6: Flesh and Spirit
  (6, 'Romans 8:5-9', 'thematic', 'The contrast between the flesh and the Spirit — ''they that are in the flesh cannot please God'''),
  (6, 'Galatians 5:16-17', 'thematic', '''The flesh lusteth against the Spirit, and the Spirit against the flesh'''),
  -- v.8: The wind/Spirit blows where it wills
  (8, 'Ecclesiastes 11:5', 'allusion', '''Thou knowest not... the way of the spirit'' — the mystery of God''s sovereign work'),
  (8, 'John 6:44', 'thematic', '''No man can come to me, except the Father which hath sent me draw him'''),
  (8, 'John 6:65', 'thematic', '''No man can come unto me, except it were given unto him of my Father'''),
  -- v.13: The Son of man from heaven
  (13, 'Daniel 7:13-14', 'prophecy', '''One like the Son of man came with the clouds of heaven'' — the heavenly figure'),
  (13, 'John 1:18', 'thematic', '''No man hath seen God at any time; the only begotten Son... hath declared him'''),
  (13, 'John 6:38', 'thematic', '''I came down from heaven'' — Jesus'' heavenly origin'),
  (13, 'John 6:62', 'thematic', '''What and if ye shall see the Son of man ascend up where he was before?'''),
  -- v.14: The serpent lifted up
  (14, 'Numbers 21:4-9', 'typology', 'Moses lifts the bronze serpent on a pole — all who look are healed; type of the cross'),
  (14, 'John 8:28', 'thematic', '''When ye have lifted up the Son of man, then shall ye know that I am he'''),
  (14, 'John 12:32-34', 'thematic', '''I, if I be lifted up from the earth, will draw all men unto me'''),
  (14, 'Isaiah 52:13', 'prophecy', '''My servant shall be... exalted, and extolled, and be very high'' — the Servant lifted up'),
  -- v.16: God so loved the world
  (16, 'Romans 5:8', 'thematic', '''God commendeth his love toward us, in that, while we were yet sinners, Christ died for us'''),
  (16, 'Romans 8:32', 'thematic', '''He that spared not his own Son, but delivered him up for us all'''),
  (16, '1 John 4:9-10', 'thematic', '''God sent his only begotten Son into the world, that we might live through him'''),
  (16, 'John 1:14', 'thematic', '''The glory as of the only begotten of the Father, full of grace and truth'''),
  (16, 'Genesis 22:2', 'typology', '''Take now thy son, thine only son Isaac... and offer him'' — Abraham''s sacrifice prefigures God''s'),
  -- v.17: Not to condemn but to save
  (17, 'John 12:47', 'parallel', '''I came not to judge the world, but to save the world'''),
  (17, 'Luke 19:10', 'parallel', '''The Son of man is come to seek and to save that which was lost'''),
  (17, '1 Timothy 1:15', 'thematic', '''Christ Jesus came into the world to save sinners'''),
  -- v.18: Condemned already
  (18, 'Romans 8:1', 'thematic', '''There is therefore now no condemnation to them which are in Christ Jesus'''),
  (18, 'John 5:24', 'thematic', '''He that heareth my word, and believeth... is passed from death unto life'''),
  (18, '1 John 5:10-12', 'thematic', '''He that believeth not God hath made him a liar'' — the nature of unbelief'),
  -- v.19: Light come into the world
  (19, 'John 1:4-5', 'thematic', '''The life was the light of men... the light shineth in darkness'''),
  (19, 'John 1:9-11', 'thematic', '''The true Light, which lighteth every man... the world knew him not'''),
  (19, 'John 8:12', 'thematic', '''I am the light of the world: he that followeth me shall not walk in darkness'''),
  -- v.27: A man can receive nothing except from heaven
  (27, 'James 1:17', 'thematic', '''Every good gift and every perfect gift is from above'''),
  (27, '1 Corinthians 4:7', 'thematic', '''What hast thou that thou didst not receive?'''),
  -- v.29: The bridegroom
  (29, 'Isaiah 62:4-5', 'prophecy', '''As the bridegroom rejoiceth over the bride, so shall thy God rejoice over thee'''),
  (29, 'Matthew 25:1-13', 'thematic', 'The parable of the ten virgins — ''the bridegroom came'''),
  (29, 'Ephesians 5:25-27', 'thematic', '''Christ also loved the church, and gave himself for it'''),
  (29, 'Revelation 19:7', 'thematic', '''The marriage of the Lamb is come, and his wife hath made herself ready'''),
  -- v.30: He must increase
  (30, 'John 1:27', 'thematic', '''He it is, who coming after me is preferred before me'''),
  (30, 'John 1:30', 'thematic', '''After me cometh a man which is preferred before me: for he was before me'''),
  -- v.34: Spirit without measure
  (34, 'Isaiah 11:2', 'prophecy', '''The spirit of the LORD shall rest upon him'' — the sevenfold Spirit on the Messiah'),
  (34, 'Isaiah 42:1', 'prophecy', '''I have put my spirit upon him'' — the Servant receives the Spirit'),
  (34, 'Isaiah 61:1', 'prophecy', '''The Spirit of the Lord GOD is upon me'' — the anointed preacher'),
  (34, 'John 1:32-33', 'parallel', '''I saw the Spirit descending from heaven like a dove, and it abode upon him'''),
  -- v.35: The Father loveth the Son
  (35, 'Matthew 11:27', 'parallel', '''All things are delivered unto me of my Father'''),
  (35, 'Matthew 28:18', 'parallel', '''All power is given unto me in heaven and in earth'''),
  (35, 'John 17:24', 'thematic', '''Thou lovedst me before the foundation of the world'' — eternal love'),
  -- v.36: Wrath abideth
  (36, 'Romans 1:18', 'thematic', '''The wrath of God is revealed from heaven against all ungodliness'''),
  (36, '1 Thessalonians 1:10', 'thematic', '''Jesus, which delivered us from the wrath to come'''),
  (36, 'John 5:24', 'thematic', '''He that heareth my word, and believeth... hath everlasting life'''),
  (36, 'Ephesians 2:3', 'thematic', '''Were by nature the children of wrath, even as others''')
) AS cr(verse_number, referenced_verse, relationship_type, note)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 3 AND v2.verse_number = cr.verse_number
) v;
