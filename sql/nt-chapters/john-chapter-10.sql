-- ═══════════════════════════════════════════════════
-- JOHN CHAPTER 10 — The Good Shepherd and the Feast of Dedication
-- 42 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 10,
  'John 10 contains two of Jesus'' most beloved self-revelations — ''I am the good shepherd'' (v.11) and ''I and my Father are one'' (v.30) — set within a discourse on sheep, shepherds, and the sheepfold. The chapter continues directly from the healing of the blind man (ch.9) and opens with the parable of the sheepfold: the true shepherd enters by the door, calls his sheep by name, and they follow because they know his voice (vv.1-5). Jesus then declares: ''I am the door of the sheep'' (v.7) — the only legitimate entrance to safety and salvation. ''I am come that they might have life, and that they might have it more abundantly'' (v.10). Then comes the central claim: ''I am the good shepherd: the good shepherd giveth his life for the sheep'' (v.11). The hired servant flees when the wolf comes, but the good shepherd lays down his life voluntarily: ''No man taketh it from me, but I lay it down of myself. I have power to lay it down, and I have power to take it again'' (v.18). The discourse provokes another division (schisma, v.19): some say ''He hath a devil''; others say ''Can a devil open the eyes of the blind?'' (vv.20-21). The scene shifts to the Feast of Dedication (Hanukkah) in winter (v.22). The Jews demand a plain answer: ''If thou be the Christ, tell us plainly'' (v.24). Jesus responds by pointing to his works and to the relationship between shepherd and sheep: ''My sheep hear my voice, and I know them, and they follow me: And I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand'' (vv.27-28). He then claims: ''My Father, which gave them me, is greater than all; and no man is able to pluck them out of my Father''s hand. I and my Father are one'' (vv.29-30). The Jews take up stones for blasphemy. Jesus defends himself from Psalm 82:6 and invites them to believe his works (vv.34-38). They seek to take him, but he escapes and withdraws beyond Jordan where John first baptised (vv.39-40). Many believe on him there (v.42).',
  'The Good Shepherd — Life, Security, and Unity with the Father',
  'ποιμήν (poimēn)',
  'Shepherd, one who tends and guards a flock — the most intimate biblical image for God''s relationship to his people. In the OT, God is the shepherd of Israel: ''The LORD is my shepherd'' (Psalm 23:1); ''He shall feed his flock like a shepherd'' (Isaiah 40:11); ''I will set up one shepherd over them... even my servant David'' (Ezekiel 34:23). Jesus claims to be this promised shepherd — the one who knows his sheep by name (v.3), leads them out (v.3), goes before them (v.4), gives his life for them (v.11, 15), and gathers them into one flock (v.16). The shepherd image combines authority (leadership), intimacy (knowing by name), provision (pasture), protection (laying down life), and unity (one flock, one shepherd).',
  '["The Sheepfold Parable (vv.1-6): Verily verily I say unto you He that entereth not by the door into the sheepfold but climbeth up some other way the same is a thief and a robber. But he that entereth in by the door is the shepherd of the sheep. To him the porter openeth and the sheep hear his voice and he calleth his own sheep by name and leadeth them out. And when he putteth forth his own sheep he goeth before them and the sheep follow him for they know his voice. And a stranger will they not follow but will flee from him for they know not the voice of strangers. This parable spake Jesus unto them but they understood not what things they were which he spake unto them","I Am the Door — I Am the Good Shepherd (vv.7-18): Then said Jesus unto them again Verily verily I say unto you I am the door of the sheep. All that ever came before me are thieves and robbers but the sheep did not hear them. I am the door by me if any man enter in he shall be saved and shall go in and out and find pasture. The thief cometh not but for to steal and to kill and to destroy I am come that they might have life and that they might have it more abundantly. I am the good shepherd the good shepherd giveth his life for the sheep. But he that is an hireling and not the shepherd whose own the sheep are not seeth the wolf coming and leaveth the sheep and fleeth and the wolf catcheth them and scattereth the sheep. The hireling fleeth because he is an hireling and careth not for the sheep. I am the good shepherd and know my sheep and am known of mine. As the Father knoweth me even so know I the Father and I lay down my life for the sheep. And other sheep I have which are not of this fold them also I must bring and they shall hear my voice and there shall be one fold and one shepherd. Therefore doth my Father love me because I lay down my life that I might take it again. No man taketh it from me but I lay it down of myself. I have power to lay it down and I have power to take it again. This commandment have I received of my Father","Division Again (vv.19-21): There was a division therefore again among the Jews for these sayings. And many of them said He hath a devil and is mad why hear ye him? Others said These are not the words of him that hath a devil. Can a devil open the eyes of the blind?","The Feast of Dedication — I and My Father Are One (vv.22-39): And it was at Jerusalem the feast of the dedication and it was winter. And Jesus walked in the temple in Solomon''s porch. Then came the Jews round about him and said unto him How long dost thou make us to doubt? If thou be the Christ tell us plainly. Jesus answered them I told you and ye believed not the works that I do in my Father''s name they bear witness of me. But ye believe not because ye are not of my sheep as I said unto you. My sheep hear my voice and I know them and they follow me. And I give unto them eternal life and they shall never perish neither shall any man pluck them out of my hand. My Father which gave them me is greater than all and no man is able to pluck them out of my Father''s hand. I and my Father are one. Then the Jews took up stones again to stone him. Jesus answered them Many good works have I shewed you from my Father for which of those works do ye stone me? The Jews answered him saying For a good work we stone thee not but for blasphemy and because that thou being a man makest thyself God. Jesus answered them Is it not written in your law I said Ye are gods? If he called them gods unto whom the word of God came and the scripture cannot be broken Say ye of him whom the Father hath sanctified and sent into the world Thou blasphemest because I said I am the Son of God? If I do not the works of my Father believe me not. But if I do though ye believe not me believe the works that ye may know and believe that the Father is in me and I in him. Therefore they sought again to take him but he escaped out of their hand","Beyond Jordan — Many Believed (vv.40-42): And went away again beyond Jordan into the place where John at first baptized and there he abode. And many resorted unto him and said John did no miracle but all things that John spake of this man were true. And many believed on him there"]'
FROM books b WHERE b.name = 'John';

-- Step 2: Insert all 42 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Verily, verily, I say unto you, He that entereth not by the door into the sheepfold, but climbeth up some other way, the same is a thief and a robber.',
   'Ἀμὴν ἀμὴν λέγω ὑμῖν ὁ μὴ εἰσερχόμενος διὰ τῆς θύρας εἰς τὴν αὐλὴν τῶν προβάτων ἀλλὰ ἀναβαίνων ἀλλαχόθεν ἐκεῖνος κλέπτης ἐστὶν καὶ λῃστής',
   'Amēn amēn legō hymin ho mē eiserchomenos dia tēs thyras eis tēn aulēn tōn probatōn alla anabainōn allachothen ekeinos kleptēs estin kai lēstēs',
   '''The sheepfold'' (tēn aulēn tōn probatōn — the courtyard/enclosure of the sheep). Palestinian sheepfolds were stone-walled enclosures with a single entrance. At night, multiple flocks would share a communal fold with a doorkeeper. ''Thief and robber'' (kleptēs kai lēstēs — kleptēs steals by stealth; lēstēs robs by violence). Anyone who bypasses the door is illegitimate — referring to false religious leaders who approach God''s people through deception or force rather than through God''s appointed way. The Pharisees who expelled the blind man (ch.9) are in view.',
   NULL),
  (2, 'But he that entereth in by the door is the shepherd of the sheep.',
   'ὁ δὲ εἰσερχόμενος διὰ τῆς θύρας ποιμήν ἐστιν τῶν προβάτων',
   'ho de eiserchomenos dia tēs thyras poimēn estin tōn probatōn',
   'The legitimate shepherd enters through the proper entrance. He comes openly, with authority, through the recognised channel. Jesus enters through the proper ''door'' — fulfilment of prophecy, authorisation by the Father, authenticated by signs.',
   NULL),
  (3, 'To him the porter openeth; and the sheep hear his voice: and he calleth his own sheep by name, and leadeth them out.',
   'τούτῳ ὁ θυρωρὸς ἀνοίγει καὶ τὰ πρόβατα τῆς φωνῆς αὐτοῦ ἀκούει καὶ τὰ ἴδια πρόβατα καλεῖ κατ᾽ ὄνομα καὶ ἐξάγει αὐτά',
   'toutō ho thyrōros anoigei kai ta probata tēs phōnēs autou akouei kai ta idia probata kalei kat onoma kai exagei auta',
   '''The porter openeth'' (ho thyrōros anoigei — the doorkeeper opens for him). ''The sheep hear his voice'' (ta probata tēs phōnēs autou akouei — the sheep listen to his voice). ''He calleth his own sheep by name'' (ta idia probata kalei kat onoma — he calls his own particular sheep individually by name). In Palestine, shepherds named their sheep and the sheep recognised their shepherd''s unique call. The intimacy is personal: Jesus does not manage a crowd but calls individuals by name (cf. Isaiah 43:1: ''I have called thee by thy name; thou art mine'').',
   NULL),
  (4, 'And when he putteth forth his own sheep, he goeth before them, and the sheep follow him: for they know his voice.',
   'καὶ ὅταν τὰ ἴδια πρόβατα ἐκβάλῃ ἔμπροσθεν αὐτῶν πορεύεται καὶ τὰ πρόβατα αὐτῷ ἀκολουθεῖ ὅτι οἴδασιν τὴν φωνὴν αὐτοῦ',
   'kai hotan ta idia probata ekbalē emprosthen autōn poreuetai kai ta probata autō akolouthei hoti oidasin tēn phōnēn autou',
   '''He goeth before them'' (emprosthen autōn poreuetai — he goes ahead of them). Eastern shepherds lead from the front; Western herding drives from behind. Jesus leads by example, going ahead into danger. ''They know his voice'' (oidasin tēn phōnēn autou — they know, recognise his voice with settled certainty). Sheep follow the shepherd they know. This explains why the healed blind man (ch.9) followed Jesus while the Pharisees could not — the sheep know the Shepherd''s voice.',
   NULL),
  (5, 'And a stranger will they not follow, but will flee from him: for they know not the voice of strangers.',
   'ἀλλοτρίῳ δὲ οὐ μὴ ἀκολουθήσωσιν ἀλλὰ φεύξονται ἀπ᾽ αὐτοῦ ὅτι οὐκ οἴδασιν τῶν ἀλλοτρίων τὴν φωνήν',
   'allotriō de ou mē akolouthēsousin alla pheuxontai ap autou hoti ouk oidasin tōn allotriōn tēn phōnēn',
   '''A stranger will they not follow'' (allotriō ou mē akolouthēsousin — they will absolutely not follow a stranger). True sheep have built-in discernment: they flee (pheuxontai — will flee) from unfamiliar voices. The basis is relational knowledge — not theological education but experiential familiarity with the Shepherd''s voice. False teachers may sound impressive, but Christ''s sheep sense the difference.',
   NULL),
  (6, 'This parable spake Jesus unto them: but they understood not what things they were which he spake unto them.',
   'ταύτην τὴν παροιμίαν εἶπεν αὐτοῖς ὁ Ἰησοῦς ἐκεῖνοι δὲ οὐκ ἔγνωσαν τίνα ἦν ἃ ἐλάλει αὐτοῖς',
   'tautēn tēn paroimian eipen autois ho Iēsous ekeinoi de ouk egnōsan tina ēn ha elalei autois',
   '''Parable'' (paroimian — a figure of speech, a proverb, an extended metaphor; not the same word as parabolē used in the Synoptics). ''They understood not'' (ouk egnōsan — they did not know, did not recognise). The Pharisees, who expelled the blind man, cannot understand the shepherd imagery because they are not sheep — they do not recognise the Shepherd''s voice. Their incomprehension proves the point.',
   NULL),
  (7, 'Then said Jesus unto them again, Verily, verily, I say unto you, I am the door of the sheep.',
   'εἶπεν οὖν πάλιν αὐτοῖς ὁ Ἰησοῦς Ἀμὴν ἀμὴν λέγω ὑμῖν ὅτι ἐγώ εἰμι ἡ θύρα τῶν προβάτων',
   'eipen oun palin autois ho Iēsous Amēn amēn legō hymin hoti egō eimi hē thyra tōn probatōn',
   '''I am the door of the sheep'' (egō eimi hē thyra tōn probatōn — the third ''I AM'' predicate in John). Jesus is not merely the shepherd who enters through the door — he is the door itself. In Palestine, the shepherd often lay across the entrance at night, literally becoming the door with his own body. No sheep could exit and no predator could enter without passing over the shepherd. Jesus is the only access point to God and to safety.',
   'This is the third of seven ''I AM'' predicate statements. Jesus claims to be the exclusive point of access: ''by me if any man enter in, he shall be saved'' (v.9). This claim to exclusivity is consistent with 14:6 (''no man cometh unto the Father, but by me'') and Acts 4:12 (''neither is there salvation in any other''). The door metaphor emphasises both access (the way in) and security (protection once inside). Jesus is simultaneously the entrance and the boundary — the way of salvation and the wall of protection.'),
  (8, 'All that ever came before me are thieves and robbers: but the sheep did not hear them.',
   'πάντες ὅσοι ἦλθον πρὸ ἐμοῦ κλέπται εἰσὶν καὶ λῃσταί ἀλλ᾽ οὐκ ἤκουσαν αὐτῶν τὰ πρόβατα',
   'pantes hosoi ēlthon pro emou kleptai eisin kai lēstai all ouk ēkousan autōn ta probata',
   '''All that ever came before me'' — not the OT prophets (who came from God and pointed to Christ) but false messiahs, false leaders, and religious frauds who claimed authority apart from God''s appointment. ''The sheep did not hear them'' — true sheep have always discerned false voices. This retrospective judgment applies to the history of false leadership in Israel (cf. Ezekiel 34:1-10 where God condemns the shepherds of Israel).',
   NULL),
  (9, 'I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.',
   'ἐγώ εἰμι ἡ θύρα δι᾽ ἐμοῦ ἐάν τις εἰσέλθῃ σωθήσεται καὶ εἰσελεύσεται καὶ ἐξελεύσεται καὶ νομὴν εὑρήσει',
   'egō eimi hē thyra di emou ean tis eiselthē sōthēsetai kai eiseleusetai kai exeleusetai kai nomēn heurēsei',
   '''By me if any man enter in'' (di emou ean tis eiselthē — through me, if anyone enters). ''He shall be saved'' (sōthēsetai — will be saved, delivered, rescued). ''Go in and out'' — a Hebrew idiom for living freely and securely (Numbers 27:17; Deuteronomy 28:6; Psalm 121:8). ''Find pasture'' (nomēn heurēsei — will find grazing, nourishment). Three blessings through the Door: (1) salvation (rescue from danger), (2) freedom (going in and out without fear), (3) provision (finding pasture). The shepherd''s fold provides everything the sheep need.',
   NULL),
  (10, 'The thief cometh not, but for to steal, and to kill, and to destroy: I am come that they might have life, and that they might have it more abundantly.',
   'ὁ κλέπτης οὐκ ἔρχεται εἰ μὴ ἵνα κλέψῃ καὶ θύσῃ καὶ ἀπολέσῃ ἐγὼ ἦλθον ἵνα ζωὴν ἔχωσιν καὶ περισσὸν ἔχωσιν',
   'ho kleptēs ouk erchetai ei mē hina klepsē kai thysē kai apolesē egō ēlthon hina zōēn echōsin kai perisson echōsin',
   '''To steal, kill, and destroy'' (klepsē kai thysē kai apolesē) — the thief''s threefold agenda: take what is not his, slaughter, and ruin. In contrast, Jesus'' purpose is life: ''I am come that they might have life'' (hina zōēn echōsin). ''More abundantly'' (perisson — exceedingly, overflowing, beyond measure). Not merely survival but abundant, overflowing, superabundant life. The contrast is absolute: the thief takes life; Jesus gives life, and more than enough of it.',
   NULL),
  (11, 'I am the good shepherd: the good shepherd giveth his life for the sheep.',
   'ἐγώ εἰμι ὁ ποιμὴν ὁ καλός ὁ ποιμὴν ὁ καλὸς τὴν ψυχὴν αὐτοῦ τίθησιν ὑπὲρ τῶν προβάτων',
   'egō eimi ho poimēn ho kalos ho poimēn ho kalos tēn psychēn autou tithēsin hyper tōn probatōn',
   '''I am the good shepherd'' (egō eimi ho poimēn ho kalos — the fourth ''I AM'' predicate). ''Good'' (kalos — not merely agathos/morally good but kalos: beautiful, noble, ideal, the model of excellence). ''Giveth his life for the sheep'' (tēn psychēn autou tithēsin hyper tōn probatōn — lays down his life on behalf of the sheep). ''For'' (hyper — on behalf of, in the place of) is the preposition of substitution. The shepherd dies so the sheep may live. This is the cross in shepherd imagery.',
   'The ''good shepherd'' (poimēn kalos) stands in contrast to the hired servant (v.12-13) and the thief (v.10). Three categories of leadership: (1) The thief — exploits the sheep for personal gain. (2) The hireling — serves for wages but abandons when danger comes. (3) The good shepherd — owns the sheep, knows them personally, and dies for them. Jesus claims to be the fulfilment of Ezekiel 34:23: ''I will set up one shepherd over them, even my servant David; he shall feed them.'' The ''laying down'' of life (tithēsin — present tense: it is his constant disposition) points to the cross.'),
  (12, 'But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep.',
   'ὁ μισθωτὸς δέ καὶ οὐκ ὢν ποιμήν οὗ οὐκ εἰσὶν τὰ πρόβατα ἴδια θεωρεῖ τὸν λύκον ἐρχόμενον καὶ ἀφίησιν τὰ πρόβατα καὶ φεύγει καὶ ὁ λύκος ἁρπάζει αὐτὰ καὶ σκορπίζει τὰ πρόβατα',
   'ho misthōtos de kai ouk ōn poimēn hou ouk eisin ta probata idia theōrei ton lykon erchomenon kai aphiēsin ta probata kai pheugei kai ho lykos harpazei auta kai skorpizei ta probata',
   '''Hireling'' (misthōtos — a hired hand, one who works for wages). ''Whose own the sheep are not'' (hou ouk eisin ta probata idia — the sheep do not belong to him). The hireling''s fundamental problem: no ownership, therefore no commitment. ''The wolf'' (ton lykon — false teachers, persecutors, spiritual predators; cf. Matthew 7:15; Acts 20:29). The hireling abandons at the first sign of danger because the sheep are not his. The good shepherd stays because they are.',
   NULL),
  (13, 'The hireling fleeth, because he is an hireling, and careth not for the sheep.',
   'ὁ μισθωτὸς φεύγει ὅτι μισθωτός ἐστιν καὶ οὐ μέλει αὐτῷ περὶ τῶν προβάτων',
   'ho misthōtos pheugei hoti misthōtos estin kai ou melei autō peri tōn probatōn',
   '''Careth not'' (ou melei autō — it does not matter to him, he is unconcerned). The diagnosis is devastating: the hireling''s problem is not cowardice but indifference. He does not care. His relationship to the sheep is commercial, not covenantal. Many religious leaders throughout history have proven to be hirelings — serving when convenient, fleeing when costly.',
   NULL),
  (14, 'I am the good shepherd, and know my sheep, and am known of mine.',
   'ἐγώ εἰμι ὁ ποιμὴν ὁ καλός καὶ γινώσκω τὰ ἐμὰ καὶ γινώσκομαι ὑπὸ τῶν ἐμῶν',
   'egō eimi ho poimēn ho kalos kai ginōskō ta ema kai ginōskomai hypo tōn emōn',
   '''I know my sheep, and am known of mine'' (ginōskō ta ema kai ginōskomai hypo tōn emōn — I know mine and am known by mine). The knowledge is mutual and intimate — not mere awareness but deep, personal, covenantal knowing. This mutual knowledge is then compared to the ultimate standard of intimacy in v.15.',
   NULL),
  (15, 'As the Father knoweth me, even so know I the Father: and I lay down my life for the sheep.',
   'καθὼς γινώσκει με ὁ πατὴρ κἀγὼ γινώσκω τὸν πατέρα καὶ τὴν ψυχήν μου τίθημι ὑπὲρ τῶν προβάτων',
   'kathōs ginōskei me ho patēr kagō ginōskō ton patera kai tēn psychēn mou tithēmi hyper tōn probatōn',
   '''As the Father knoweth me, even so know I the Father'' (kathōs ginōskei me ho patēr kagō ginōskō ton patera). The mutual knowledge between shepherd and sheep is patterned on the mutual knowledge between Father and Son — the most intimate relationship in the universe. ''I lay down my life for the sheep'' — the cross is not forced upon Jesus but chosen: ''I lay down'' (tithēmi — present tense: I am in the process of laying down). The atonement is voluntary, substitutionary, and motivated by knowledge and love.',
   NULL),
  (16, 'And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.',
   'καὶ ἄλλα πρόβατα ἔχω ἃ οὐκ ἔστιν ἐκ τῆς αὐλῆς ταύτης κἀκεῖνα δεῖ με ἀγαγεῖν καὶ τῆς φωνῆς μου ἀκούσουσιν καὶ γενήσεται μία ποίμνη εἷς ποιμήν',
   'kai alla probata echō ha ouk estin ek tēs aulēs tautēs kakeina dei me agagein kai tēs phōnēs mou akousousin kai genēsetai mia poimnē heis poimēn',
   '''Other sheep I have, which are not of this fold'' (alla probata echō — other sheep I possess). ''This fold'' (tēs aulēs tautēs) = the Jewish fold. The ''other sheep'' are the Gentiles who will believe. ''I must bring'' (dei me agagein — it is divinely necessary for me to bring them). ''They shall hear my voice'' — the same voice, the same shepherd, the same call. ''One fold, one shepherd'' (mia poimnē heis poimēn — one flock, one shepherd). Note: poimnē is ''flock'' (not aulē/fold) — there will be one united flock under one shepherd, not one enclosure. Jews and Gentiles become one people in Christ.',
   'This verse is the charter for the Gentile mission. Jesus'' saving work extends beyond Israel to embrace ''other sheep'' — people from every nation, tribe, and tongue (Revelation 7:9). The ''must'' (dei) indicates divine necessity: the Gentile inclusion is not an afterthought but part of God''s eternal plan. Ephesians 2:14-16 provides the commentary: Christ has ''broken down the middle wall of partition'' and made ''one new man'' of Jew and Gentile. The goal is not uniformity but unity: one flock, diverse members, one Shepherd.'),
  (17, 'Therefore doth my Father love me, because I lay down my life, that I might take it again.',
   'διὰ τοῦτο ὁ πατήρ με ἀγαπᾷ ὅτι ἐγὼ τίθημι τὴν ψυχήν μου ἵνα πάλιν λάβω αὐτήν',
   'dia touto ho patēr me agapa hoti egō tithēmi tēn psychēn mou hina palin labō autēn',
   '''My Father love me, because I lay down my life'' — the Father''s love for the Son is connected to the Son''s voluntary sacrifice. ''That I might take it again'' (hina palin labō autēn — in order to take it up again). The laying down (death) is not the end — the taking up again (resurrection) is the goal. Death is the means; resurrection is the consummation. The entire sequence — death and resurrection — is the object of the Father''s love.',
   NULL),
  (18, 'No man taketh it from me, but I lay it down of myself. I have power to lay it down, and I have power to take it again. This commandment have I received of my Father.',
   'οὐδεὶς αἴρει αὐτὴν ἀπ᾽ ἐμοῦ ἀλλ᾽ ἐγὼ τίθημι αὐτὴν ἀπ᾽ ἐμαυτοῦ ἐξουσίαν ἔχω θεῖναι αὐτήν καὶ ἐξουσίαν ἔχω πάλιν λαβεῖν αὐτήν ταύτην τὴν ἐντολὴν ἔλαβον παρὰ τοῦ πατρός μου',
   'oudeis airei autēn ap emou all egō tithēmi autēn ap emautou exousian echō theinai autēn kai exousian echō palin labein autēn tautēn tēn entolēn elabon para tou patros mou',
   '''No man taketh it from me'' (oudeis airei autēn — no one takes it from me). Jesus'' death is not a tragedy imposed upon him but a sacrifice he voluntarily offers. ''I lay it down of myself'' (egō tithēmi autēn ap emautou — I lay it down from my own initiative). ''I have power'' (exousian echō — I have authority/right/power). Two powers: power to die and power to rise. No mere human has authority over their own death and resurrection. ''This commandment have I received of my Father'' — Jesus'' voluntary death is simultaneously an act of free will and an act of obedience. Freedom and obedience are not contradictory but unified in the Son.',
   'This verse establishes the voluntary nature of the atonement. The cross was not: (1) An accident — ''No man taketh it.'' (2) A defeat — ''I lay it down of myself.'' (3) An end — ''I have power to take it again.'' (4) An independent act — ''This commandment have I received of my Father.'' Jesus'' death is a deliberate, authoritative, obedient, and reversible sacrifice. He possesses authority that no creature has — authority over death itself. This authority is both inherent (he has it) and received (the Father commanded it) — the perfect union of divine nature and divine mission.'),
  (19, 'There was a division therefore again among the Jews for these sayings.',
   'σχίσμα οὖν πάλιν ἐγένετο ἐν τοῖς Ἰουδαίοις διὰ τοὺς λόγους τούτους',
   'schisma oun palin egeneto en tois Ioudaiois dia tous logous toutous',
   '''Division again'' (schisma palin — another split; cf. 7:43; 9:16). Jesus consistently divides people. His words are too extraordinary to ignore — they demand a response, and the responses are polar opposites.',
   NULL),
  (20, 'And many of them said, He hath a devil, and is mad; why hear ye him?',
   'ἔλεγον δὲ πολλοὶ ἐξ αὐτῶν Δαιμόνιον ἔχει καὶ μαίνεται τί αὐτοῦ ἀκούετε',
   'elegon de polloi ex autōn Daimonion echei kai mainetai ti autou akouete',
   '''He hath a devil, and is mad'' (daimonion echei kai mainetai — he has a demon and is insane). The charge of demonic possession recurs (7:20; 8:48, 52). ''Is mad'' (mainetai — is raving, is out of his mind; cf. Acts 26:24 where Festus says to Paul ''thou art beside thyself''). Those who reject Jesus must explain him somehow — since they cannot accept his claims, they label him insane.',
   NULL),
  (21, 'Others said, These are not the words of him that hath a devil. Can a devil open the eyes of the blind?',
   'ἄλλοι ἔλεγον Ταῦτα τὰ ῥήματα οὐκ ἔστιν δαιμονιζομένου μὴ δαιμόνιον δύναται τυφλῶν ὀφθαλμοὺς ἀνοίγειν',
   'alloi elegon Tauta ta rhēmata ouk estin daimonizomenou mē daimonion dynatai typhlōn ophthalmous anoigein',
   '''Can a devil open the eyes of the blind?'' — the healing of the man born blind (ch.9) provides irrefutable evidence. Demons destroy; they do not heal. The quality of Jesus'' works contradicts the demon-accusation. The chapter 9 miracle is still reverberating — it cannot be explained away.',
   NULL),
  (22, 'And it was at Jerusalem the feast of the dedication, and it was winter.',
   'ἐγένετο δὲ τὰ ἐγκαίνια ἐν τοῖς Ἱεροσολύμοις καὶ χειμὼν ἦν',
   'egeneto de ta enkainia en tois Hierosolymois kai cheimōn ēn',
   '''The feast of the dedication'' (ta enkainia — Hanukkah, the Festival of Lights/Dedication). This eight-day feast (late November/December) commemorated the rededication of the temple by Judas Maccabaeus in 164 BC after its desecration by Antiochus Epiphanes (1 Maccabees 4:36-59). ''It was winter'' (cheimōn ēn) — both literal (cold, December) and atmospheric (hostility is chilling). About two months have passed since the Feast of Tabernacles (ch.7-9).',
   NULL),
  (23, 'And Jesus walked in the temple in Solomon''s porch.',
   'καὶ περιεπάτει ὁ Ἰησοῦς ἐν τῷ ἱερῷ ἐν τῇ στοᾷ τοῦ Σολομῶντος',
   'kai periepatei ho Iēsous en tō hierō en tē stoa tou Solomōntos',
   '''Solomon''s porch'' (tē stoa tou Solomōntos — Solomon''s colonnade/portico). A covered colonnade on the eastern side of the temple mount, believed to date from Solomon''s original temple. In winter, it provided shelter from cold winds. The early church also gathered here (Acts 3:11; 5:12). Jesus teaches in the place where Israel''s wisest king once walked.',
   NULL),
  (24, 'Then came the Jews round about him, and said unto him, How long dost thou make us to doubt? If thou be the Christ, tell us plainly.',
   'ἐκύκλωσαν οὖν αὐτὸν οἱ Ἰουδαῖοι καὶ ἔλεγον αὐτῷ Ἕως πότε τὴν ψυχὴν ἡμῶν αἴρεις εἰ σὺ εἶ ὁ Χριστός εἰπὲ ἡμῖν παρρησίᾳ',
   'ekyklōsan oun auton hoi Ioudaioi kai elegon autō Heōs pote tēn psychēn hēmōn aireis ei sy ei ho Christos eipe hēmin parrēsia',
   '''Came round about him'' (ekyklōsan — encircled, surrounded; an aggressive, confrontational stance). ''How long dost thou make us to doubt?'' (heōs pote tēn psychēn hēmōn aireis — how long do you keep us in suspense?). ''Tell us plainly'' (eipe hēmin parrēsia — tell us openly, boldly). Their demand seems reasonable, but Jesus has been telling them plainly — in works (5:36; 10:25), in words (8:58; 10:11), in signs (ch.6, 9). The problem is not insufficient evidence but unwilling hearts.',
   NULL),
  (25, 'Jesus answered them, I told you, and ye believed not: the works that I do in my Father''s name, they bear witness of me.',
   'ἀπεκρίθη αὐτοῖς ὁ Ἰησοῦς Εἶπον ὑμῖν καὶ οὐ πιστεύετε τὰ ἔργα ἃ ἐγὼ ποιῶ ἐν τῷ ὀνόματι τοῦ πατρός μου ταῦτα μαρτυρεῖ περὶ ἐμοῦ',
   'apekrithē autois ho Iēsous Eipon hymin kai ou pisteuete ta erga ha egō poiō en tō onomati tou patros mou tauta martyrei peri emou',
   '''I told you, and ye believed not'' — the evidence has been presented repeatedly. ''The works that I do... bear witness'' (ta erga... martyrei peri emou — the works testify about me). Jesus'' miracles are not just displays of power but testimonies to his identity. If they will not believe his words, they should believe his works (v.38). But they reject both.',
   NULL),
  (26, 'But ye believe not, because ye are not of my sheep, as I said unto you.',
   'ἀλλ᾽ ὑμεῖς οὐ πιστεύετε οὐ γάρ ἐστε ἐκ τῶν προβάτων τῶν ἐμῶν καθὼς εἶπον ὑμῖν',
   'all hymeis ou pisteuete ou gar este ek tōn probatōn tōn emōn kathōs eipon hymin',
   '''Ye believe not, because ye are not of my sheep'' (ou pisteuete ou gar este ek tōn probatōn tōn emōn — you do not believe because you are not from among my sheep). Note the order: they are not sheep, therefore they do not believe. Jesus does not say ''You are not my sheep because you don''t believe'' but ''You don''t believe because you are not my sheep.'' Belonging precedes believing. This is consistent with 6:44 (the Father draws), 6:65 (given by the Father), and 8:47 (''he that is of God heareth God''s words'').',
   NULL),
  (27, 'My sheep hear my voice, and I know them, and they follow me:',
   'τὰ πρόβατα τὰ ἐμὰ τῆς φωνῆς μου ἀκούει κἀγὼ γινώσκω αὐτὰ καὶ ἀκολουθοῦσίν μοι',
   'ta probata ta ema tēs phōnēs mou akouei kagō ginōskō auta kai akolouthousin moi',
   '''My sheep hear my voice'' — hearing is the mark of belonging. ''I know them'' (ginōskō auta — I know them personally). ''They follow me'' (akolouthousin moi — they follow me, continuously). Three marks of Jesus'' sheep: (1) they hear his voice (receptivity), (2) he knows them (divine knowledge), (3) they follow (obedient discipleship). The order is significant: hearing comes first, then following — but underneath both is the Shepherd''s knowledge.',
   NULL),
  (28, 'And I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand.',
   'κἀγὼ ζωὴν αἰώνιον δίδωμι αὐτοῖς καὶ οὐ μὴ ἀπόλωνται εἰς τὸν αἰῶνα καὶ οὐχ ἁρπάσει τις αὐτὰ ἐκ τῆς χειρός μου',
   'kagō zōēn aiōnion didōmi autois kai ou mē apolōntai eis ton aiōna kai ouch harpasei tis auta ek tēs cheiros mou',
   '''I give unto them eternal life'' (zōēn aiōnion didōmi autois — present tense: I am giving). ''They shall never perish'' (ou mē apolōntai eis ton aiōna — they will absolutely not perish, ever). ''Neither shall any man pluck them out of my hand'' (ouch harpasei tis auta ek tēs cheiros mou — no one will snatch them from my hand). Three guarantees: (1) eternal life as a present gift, (2) absolute impossibility of perishing, (3) no external force can remove them from Christ''s protective hand.',
   'This verse is one of the strongest statements of eternal security in Scripture. The double negative (ou mē — absolutely never) is the strongest negation in Greek. ''Perish'' (apolōntai — be destroyed, be lost) is the same verb used in 3:16 (''should not perish''). The promise is unconditional: the sheep will never perish. ''No one'' (tis — anyone, any force, any being) can snatch (harpazō — seize by force) them from Christ''s hand. This includes Satan, demons, circumstances, persecution, and the believers themselves. The security is in the Shepherd''s hand, not in the sheep''s grip.'),
  (29, 'My Father, which gave them me, is greater than all; and no man is able to pluck them out of my Father''s hand.',
   'ὁ πατήρ μου ὃς δέδωκέν μοι μείζων πάντων ἐστίν καὶ οὐδεὶς δύναται ἁρπάζειν ἐκ τῆς χειρὸς τοῦ πατρός μου',
   'ho patēr mou hos dedōken moi meizōn pantōn estin kai oudeis dynatai harpazein ek tēs cheiros tou patros mou',
   '''My Father, which gave them me'' — the sheep are the Father''s gift to the Son (cf. 6:37, 39; 17:6). ''Is greater than all'' (meizōn pantōn estin — is greater than everything/everyone). ''No man is able to pluck them out of my Father''s hand'' — double security: the sheep are in the Son''s hand (v.28) and the Father''s hand (v.29). Two divine hands — the entire Trinity protects the believer.',
   NULL),
  (30, 'I and my Father are one.',
   'ἐγὼ καὶ ὁ πατὴρ ἕν ἐσμεν',
   'egō kai ho patēr hen esmen',
   '''I and my Father are one'' (egō kai ho patēr hen esmen). ''One'' (hen — neuter: one thing, one in essence/nature; not heis/masculine: one person). Jesus claims unity of nature/essence with the Father while maintaining personal distinction (''I and my Father'' — two persons). The context is security: the sheep are safe because the Father and Son are one in power, purpose, and nature. What the Son holds, the Father holds; what the Father protects, the Son protects.',
   'This is one of the most important christological statements in the NT. ''One'' (hen, neuter) indicates unity of essence, not identity of person. Jesus does not say ''I am the Father'' (Sabellianism) but ''I and the Father are one'' (Trinitarian). Two persons (egō kai ho patēr — I and the Father), one essence (hen esmen — we are one thing). The Jews understand correctly: this is a claim to deity (v.33: ''thou, being a man, makest thyself God''). The entire Nicene Creed''s affirmation that the Son is ''of one substance (homoousios) with the Father'' is grounded in this verse.'),
  (31, 'Then the Jews took up stones again to stone him.',
   'ἐβάστασαν οὖν πάλιν λίθους οἱ Ἰουδαῖοι ἵνα λιθάσωσιν αὐτόν',
   'ebastasan oun palin lithous hoi Ioudaioi hina lithasōsin auton',
   '''Took up stones again'' (ebastasan palin lithous — carried/picked up stones again; ''again'' recalls 8:59). This is the second attempt to stone Jesus for blasphemy. Their response confirms they understood his claim: he was claiming to be God. If ''I and my Father are one'' meant merely unity of purpose, stoning would be an absurd overreaction.',
   NULL),
  (32, 'Jesus answered them, Many good works have I shewed you from my Father; for which of those works do ye stone me?',
   'ἀπεκρίθη αὐτοῖς ὁ Ἰησοῦς Πολλὰ καλὰ ἔργα ἔδειξα ὑμῖν ἐκ τοῦ πατρός μου διὰ ποῖον αὐτῶν ἔργον λιθάζετέ με',
   'apekrithē autois ho Iēsous Polla kala erga edeixa hymin ek tou patros mou dia poion autōn ergon lithazete me',
   '''Many good works'' (polla kala erga — many beautiful/noble works). ''From my Father'' — the works originate with the Father, performed through the Son. ''For which of those works do ye stone me?'' — Jesus forces them to articulate their objection. They cannot say ''for healing'' or ''for giving sight'' — so they must admit it is for his claims (v.33).',
   NULL),
  (33, 'The Jews answered him, saying, For a good work we stone thee not; but for blasphemy; and because that thou, being a man, makest thyself God.',
   'ἀπεκρίθησαν αὐτῷ οἱ Ἰουδαῖοι λέγοντες Περὶ καλοῦ ἔργου οὐ λιθάζομέν σε ἀλλὰ περὶ βλασφημίας καὶ ὅτι σὺ ἄνθρωπος ὢν ποιεῖς σεαυτὸν θεόν',
   'apekrithēsan autō hoi Ioudaioi legontes Peri kalou ergou ou lithazomen se alla peri blasphēmias kai hoti sy anthrōpos ōn poieis seauton theon',
   '''For blasphemy'' (peri blasphēmias — concerning blasphemy). ''Thou, being a man, makest thyself God'' (sy anthrōpos ōn poieis seauton theon — you, being a human, make yourself God). They state the charge precisely: Jesus claims to be God. This is exactly what Jesus has been claiming (5:18; 8:58; 10:30). If the claim is false, it is blasphemy; if true, it is the most important truth ever spoken. The Jews understand the claim correctly — their error is in rejecting it.',
   NULL),
  (34, 'Jesus answered them, Is it not written in your law, I said, Ye are gods?',
   'ἀπεκρίθη αὐτοῖς ὁ Ἰησοῦς Οὐκ ἔστιν γεγραμμένον ἐν τῷ νόμῳ ὑμῶν ὅτι Ἐγὼ εἶπα Θεοί ἐστε',
   'apekrithē autois ho Iēsous Ouk estin gegrammenon en tō nomō hymōn hoti Egō eipa Theoi este',
   'Jesus quotes Psalm 82:6: ''I said, Ye are gods'' (theoi este). In Psalm 82, God addresses unjust human judges who bear the title ''gods'' (elohim) because they exercise God''s judicial authority. Jesus'' argument is a fortiori (from the lesser to the greater): if Scripture calls mere human judges ''gods'' and that usage is not blasphemy, how much more appropriate is it for the one whom the Father sanctified and sent into the world to call himself the Son of God?',
   NULL),
  (35, 'If he called them gods, unto whom the word of God came, and the scripture cannot be broken;',
   'εἰ ἐκείνους εἶπεν θεοὺς πρὸς οὓς ὁ λόγος τοῦ θεοῦ ἐγένετο καὶ οὐ δύναται λυθῆναι ἡ γραφή',
   'ei ekeinous eipen theous pros hous ho logos tou theou egeneto kai ou dynatai lythēnai hē graphē',
   '''The scripture cannot be broken'' (ou dynatai lythēnai hē graphē — the Scripture is not able to be dissolved/annulled/set aside). A foundational statement on biblical authority: Scripture is inviolable. If a term used in Scripture cannot be challenged, then Jesus'' use of a much lesser title (''Son of God'' rather than ''God'') for a much greater person (himself, sanctified and sent by the Father) cannot be blasphemy. The argument is airtight within their own legal framework.',
   NULL),
  (36, 'Say ye of him, whom the Father hath sanctified, and sent into the world, Thou blasphemest; because I said, I am the Son of God?',
   'ὃν ὁ πατὴρ ἡγίασεν καὶ ἀπέστειλεν εἰς τὸν κόσμον ὑμεῖς λέγετε ὅτι Βλασφημεῖς ὅτι εἶπον Υἱὸς τοῦ θεοῦ εἰμι',
   'hon ho patēr hēgiasen kai apesteilen eis ton kosmon hymeis legete hoti Blasphēmeis hoti eipon Huios tou theou eimi',
   '''Whom the Father hath sanctified and sent'' (hon ho patēr hēgiasen kai apesteilen — whom the Father set apart and sent). ''Sanctified'' (hēgiasen — consecrated, set apart for a holy purpose). ''Sent into the world'' (apesteilen eis ton kosmon). ''I am the Son of God'' (huios tou theou eimi). Note that Jesus uses ''Son of God'' here — less than the ''I and my Father are one'' of v.30. He is not retreating from his claim but showing that even a lesser formulation should be acceptable. If mere human judges can be called ''gods,'' the unique Son whom the Father sanctified and sent can certainly be called God''s Son.',
   NULL),
  (37, 'If I do not the works of my Father, believe me not.',
   'εἰ οὐ ποιῶ τὰ ἔργα τοῦ πατρός μου μὴ πιστεύετέ μοι',
   'ei ou poiō ta erga tou patros mou mē pisteuete moi',
   '''If I do not the works of my Father, believe me not'' — Jesus offers a falsifiable test: judge me by my works. If his works are not divine works, reject him. But if they are divine works, there is only one conclusion. This is remarkably fair: Jesus does not demand blind faith but offers evidence-based faith.',
   NULL),
  (38, 'But if I do, though ye believe not me, believe the works: that ye may know, and believe, that the Father is in me, and I in him.',
   'εἰ δὲ ποιῶ κἂν ἐμοὶ μὴ πιστεύητε τοῖς ἔργοις πιστεύσατε ἵνα γνῶτε καὶ πιστεύσητε ὅτι ἐν ἐμοὶ ὁ πατὴρ κἀγὼ ἐν αὐτῷ',
   'ei de poiō kan emoi mē pisteuēte tois ergois pisteusate hina gnōte kai pisteusēte hoti en emoi ho patēr kagō en autō',
   '''Believe the works'' (tois ergois pisteusate — put your faith in the works/evidence). ''That the Father is in me, and I in him'' (hoti en emoi ho patēr kagō en autō — that the Father is in me and I in him). Mutual indwelling — the Father dwells in the Son and the Son in the Father. This is a restatement of v.30 (''I and my Father are one'') in relational rather than ontological terms. The works reveal this unity: what Jesus does, the Father does through him.',
   NULL),
  (39, 'Therefore they sought again to take him: but he escaped out of their hand,',
   'ἐζήτουν οὖν πάλιν αὐτὸν πιάσαι καὶ ἐξῆλθεν ἐκ τῆς χειρὸς αὐτῶν',
   'ezētoun oun palin auton piasai kai exēlthen ek tēs cheiros autōn',
   '''He escaped out of their hand'' (exēlthen ek tēs cheiros autōn — he went out from their hand/grasp). Ironically, no one can snatch the sheep from Jesus'' hand (v.28), and no one can seize Jesus from the Father''s hand. He escapes not by running but by sovereign departure — his hour has not yet come.',
   NULL),
  (40, 'And went away again beyond Jordan into the place where John at first baptized; and there he abode.',
   'καὶ ἀπῆλθεν πάλιν πέραν τοῦ Ἰορδάνου εἰς τὸν τόπον ὅπου ἦν Ἰωάννης τὸ πρῶτον βαπτίζων καὶ ἔμεινεν ἐκεῖ',
   'kai apēlthen palin peran tou Iordanou eis ton topon hopou ēn Iōannēs to prōton baptizōn kai emeinen ekei',
   'Jesus withdraws to Bethany beyond Jordan (cf. 1:28) — where his public ministry began with John''s testimony. The circle closes: from baptism to this retreat. He ''abode there'' (emeinen ekei — remained, stayed; menō: the Johannine word for abiding). A period of rest before the final journey to Jerusalem and the cross.',
   NULL),
  (41, 'And many resorted unto him, and said, John did no miracle: but all things that John spake of this man were true.',
   'καὶ πολλοὶ ἦλθον πρὸς αὐτὸν καὶ ἔλεγον ὅτι Ἰωάννης μὲν σημεῖον ἐποίησεν οὐδέν πάντα δὲ ὅσα εἶπεν Ἰωάννης περὶ τούτου ἀληθῆ ἦν',
   'kai polloi ēlthon pros auton kai elegon hoti Iōannēs men sēmeion epoiēsen ouden panta de hosa eipen Iōannēs peri toutou alēthē ēn',
   '''John did no miracle'' (Iōannēs sēmeion epoiēsen ouden — John performed no sign). ''But all things that John spake of this man were true'' (panta hosa eipen Iōannēs peri toutou alēthē ēn). John the Baptist''s witness is vindicated: he did no miracles, but his testimony was completely accurate. John was the witness; Jesus is the one witnessed to. The contrast: John''s authority was in his word; Jesus'' authority is in both word and works.',
   NULL),
  (42, 'And many believed on him there.',
   'καὶ πολλοὶ ἐπίστευσαν εἰς αὐτὸν ἐκεῖ',
   'kai polloi episteusan eis auton ekei',
   '''Many believed on him there'' (polloi episteusan eis auton ekei). The chapter that began with hostility in Jerusalem ends with faith beyond Jordan. Where John''s preparatory ministry laid the groundwork, Jesus'' presence brings the harvest. The simple statement is a quiet triumph: in the place of beginnings, many come to faith.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'John' AND c.chapter_number = 10;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, usage_notes, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.usage_notes, ws.word_order
FROM (VALUES
  ('ποιμήν', 'poimēn', 'G4166',
   'Shepherd, one who tends and protects a flock; a pastor, spiritual leader.',
   'Poimēn is used 4 times in John 10 (vv.2, 11, 14, 16) and defines the chapter. In the OT, God is Israel''s shepherd (Psalm 23:1; 80:1; Isaiah 40:11). Israel''s leaders are called shepherds (Jeremiah 23:1-4; Ezekiel 34). Jesus claims to be THE shepherd — the good (kalos) shepherd foretold in Ezekiel 34:23 (''one shepherd... my servant David''). The shepherd imagery combines authority, intimacy, provision, protection, and sacrifice. The word gives us ''pastor'' (Latin pastor = shepherd) — every Christian leader is called to shepherd Christ''s flock (1 Peter 5:2-4).',
   1),
  ('θύρα', 'thyra', 'G2374',
   'Door, gate, entrance; the point of access and the means of protection.',
   'In vv.7, 9, Jesus declares ''I am the door'' (egō eimi hē thyra). The door serves dual functions: (1) Access — ''by me if any man enter in, he shall be saved'' (v.9). Jesus is the only way to salvation (14:6; Acts 4:12). (2) Security — the shepherd-door protects the sheep inside. In Palestine, the shepherd literally became the door by lying across the entrance at night. Jesus is both the way in (salvation) and the wall of protection (security). ''No man cometh unto the Father, but by me'' (14:6) — Jesus is the exclusive access point.',
   2),
  ('καλός', 'kalos', 'G2570',
   'Good, beautiful, noble, excellent; the ideal, the model of what something should be.',
   'In vv.11, 14, ''I am the good shepherd'' (ho poimēn ho kalos). Kalos differs from agathos (morally good) in adding beauty, nobility, and ideal excellence. A kalos shepherd is not merely competent but exemplary — the model, the ideal, the perfect shepherd. Kalos implies aesthetic beauty in moral excellence: Jesus'' shepherding is not just effective but beautiful. The word is used of the ''goodly pearls'' (Matthew 13:45), the ''good ground'' (Matthew 13:23), and the ''good works'' (Matthew 5:16). Christ''s sacrifice is not just necessary but kalos — noble, worthy, beautiful.',
   3),
  ('ψυχή', 'psychē', 'G5590',
   'Life, soul, the animating principle; the self, the person, one''s very being.',
   'In vv.11, 15, 17, Jesus says he ''lays down his life'' (tēn psychēn tithēmi) for the sheep. Psychē is more than biological life (bios) — it is the self, the entire person. Jesus does not merely risk his body but gives his psychē — his whole self. In v.18, he has authority (exousia) to lay it down and take it again. The word connects to the Hebrew nephesh — the living being. ''Greater love hath no man than this, that a man lay down his psychē for his friends'' (15:13). The cross is the ultimate self-giving.',
   4),
  ('ἁρπάζω', 'harpazō', 'G726',
   'To snatch, seize by force, carry off by violence; to pluck out, to take by power.',
   'In v.28, ''neither shall any man pluck them out of my hand'' (ouch harpasei tis auta ek tēs cheiros mou). In v.29, ''no man is able to pluck them out of my Father''s hand'' (oudeis dynatai harpazein ek tēs cheiros tou patros mou). Harpazō is a violent word — forceful seizure (cf. Matthew 11:12; Acts 8:39; 1 Thessalonians 4:17: ''caught up''). The promise is that no force — however violent — can tear a believer from the divine grip. The sheep are held, not by their own strength, but by the omnipotent hands of the Son and the Father.',
   5),
  ('ἕν', 'hen', 'G1520',
   'One (neuter) — one thing, one essence, one nature; unity of being.',
   'In v.30, ''I and my Father are one'' (hen esmen — we are one thing). The neuter hen (not masculine heis) indicates unity of essence/nature, not identity of person. ''We are'' (esmen — plural verb) confirms two distinct persons who share one essence. This is the grammatical foundation of Trinitarian theology: distinction of persons (I and the Father) with unity of nature (one). The Council of Nicaea (325 AD) formulated this as homoousios (of one substance). If Jesus meant only ''one in purpose,'' stoning would be an absurd overreaction — the Jews understood he claimed ontological unity with God.',
   6),
  ('ἐξουσία', 'exousia', 'G1849',
   'Authority, power, right, jurisdiction; the legitimate right to act.',
   'In v.18, ''I have power to lay it down, and I have power to take it again'' (exousian echō theinai autēn kai exousian echō palin labein autēn). Exousia is not dynamis (raw power) but legitimate authority — the right to act. Jesus has the right to die and the right to rise. No creature possesses authority over their own death and resurrection. This exousia comes from the Father (''this commandment have I received'') yet belongs inherently to the Son. The cross is an exercise of divine authority, not a submission to human power.',
   7),
  ('βλασφημία', 'blasphēmia', 'G988',
   'Blasphemy, slander against God, irreverent speech about the divine; claiming divine prerogatives.',
   'In v.33, ''for blasphemy; and because that thou, being a man, makest thyself God'' (peri blasphēmias kai hoti sy anthrōpos ōn poieis seauton theon). The Jews correctly identify the issue: Jesus claims to be God. If false, this is the ultimate blasphemy — a creature claiming to be the Creator. If true, it is the ultimate revelation — God has become man. There is no middle ground. The blasphemy charge recurs at Jesus'' trial (Matthew 26:65; Mark 14:64). The question is always the same: is Jesus who he claims to be?',
   8)
) AS ws(original_word, transliteration, strongs_number, meaning, usage_notes, word_order)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 10
  AND v2.verse_number = CASE ws.word_order
    WHEN 1 THEN 11
    WHEN 2 THEN 7
    WHEN 3 THEN 11
    WHEN 4 THEN 15
    WHEN 5 THEN 28
    WHEN 6 THEN 30
    WHEN 7 THEN 18
    WHEN 8 THEN 33
  END
) v;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, context, ref_order)
SELECT v.id, cr.referenced_verse, cr.note, ROW_NUMBER() OVER ()::int
FROM (VALUES
  -- v.3: Calleth his own sheep by name
  (3, 'Isaiah 43:1', 'thematic', '''I have called thee by thy name; thou art mine'' — God calls his people by name'),
  (3, 'John 20:16', 'parallel', '''Mary'' — Jesus calls Mary Magdalene by name at the resurrection'),
  -- v.7-9: I am the door
  (9, 'John 14:6', 'thematic', '''I am the way, the truth, and the life: no man cometh unto the Father, but by me'''),
  (9, 'Acts 4:12', 'thematic', '''Neither is there salvation in any other'''),
  (9, 'Ephesians 2:18', 'thematic', '''Through him we both have access by one Spirit unto the Father'''),
  -- v.10: Life more abundantly
  (10, 'John 10:28', 'parallel', '''I give unto them eternal life'' — the abundant life defined'),
  (10, 'Romans 8:32', 'thematic', '''He that spared not his own Son... how shall he not with him also freely give us all things?'''),
  -- v.11: The good shepherd giveth his life
  (11, 'Psalm 23:1', 'typology', '''The LORD is my shepherd'' — Jesus is the divine shepherd Psalm 23 describes'),
  (11, 'Isaiah 40:11', 'prophecy', '''He shall feed his flock like a shepherd: he shall gather the lambs with his arm'''),
  (11, 'Ezekiel 34:23', 'prophecy', '''I will set up one shepherd over them, even my servant David'''),
  (11, '1 Peter 5:4', 'thematic', '''When the chief Shepherd shall appear, ye shall receive a crown of glory'''),
  (11, 'Hebrews 13:20', 'thematic', '''That great shepherd of the sheep, through the blood of the everlasting covenant'''),
  -- v.14-15: I know my sheep
  (15, 'Matthew 11:27', 'parallel', '''No man knoweth the Son, but the Father; neither knoweth any man the Father, save the Son'''),
  (15, '2 Timothy 2:19', 'thematic', '''The Lord knoweth them that are his'''),
  -- v.16: Other sheep — Gentile mission
  (16, 'Isaiah 56:8', 'prophecy', '''The Lord GOD which gathereth the outcasts of Israel saith, Yet will I gather others to him'''),
  (16, 'Ephesians 2:14-16', 'thematic', '''He hath broken down the middle wall of partition... to make in himself of twain one new man'''),
  (16, 'Acts 10:34-35', 'parallel', '''God is no respecter of persons: but in every nation he that feareth him is accepted'''),
  -- v.18: No man taketh it — voluntary death
  (18, 'Philippians 2:8', 'thematic', '''He humbled himself, and became obedient unto death, even the death of the cross'''),
  (18, 'John 19:30', 'parallel', '''He bowed his head, and gave up the ghost'' — Jesus voluntarily yielded his spirit'),
  (18, 'Isaiah 53:12', 'prophecy', '''He hath poured out his soul unto death'''),
  -- v.27-28: My sheep hear — eternal security
  (28, 'John 6:37-39', 'parallel', '''Him that cometh to me I will in no wise cast out... I should lose nothing'''),
  (28, 'Romans 8:35-39', 'thematic', '''Neither death, nor life... shall be able to separate us from the love of God'''),
  (28, 'Philippians 1:6', 'thematic', '''He which hath begun a good work in you will perform it until the day of Jesus Christ'''),
  -- v.30: I and my Father are one
  (30, 'John 1:1', 'thematic', '''The Word was with God, and the Word was God'' — the oneness of Father and Son'),
  (30, 'John 17:21-22', 'parallel', '''That they all may be one; as thou, Father, art in me, and I in thee'''),
  (30, 'Colossians 2:9', 'thematic', '''In him dwelleth all the fulness of the Godhead bodily'''),
  -- v.33: Makest thyself God
  (33, 'John 5:18', 'parallel', '''Making himself equal with God'' — the same charge in Jerusalem'),
  (33, 'John 8:58-59', 'parallel', '''Before Abraham was, I am'' — another deity claim provoking stoning'),
  -- v.34-36: Psalm 82 argument
  (34, 'Psalm 82:6', 'quotation', '''I have said, Ye are gods; and all of you are children of the most High'''),
  -- v.38: The Father is in me
  (38, 'John 14:10-11', 'parallel', '''Believest thou not that I am in the Father, and the Father in me?... believe me for the very works'' sake'''),
  -- v.41-42: John''s testimony vindicated
  (41, 'John 1:29-34', 'parallel', 'John''s testimony: ''Behold the Lamb of God... this is the Son of God'''),
  (41, 'John 3:30', 'thematic', '''He must increase, but I must decrease'' — John''s testimony finds its fulfilment')
) AS cr(verse_number, referenced_verse, relationship_type, note)
CROSS JOIN LATERAL (
  SELECT v2.id FROM verses v2
  JOIN chapters c2 ON v2.chapter_id = c2.id
  JOIN books b2 ON c2.book_id = b2.id
  WHERE b2.name = 'John' AND c2.chapter_number = 10 AND v2.verse_number = cr.verse_number
) v;
