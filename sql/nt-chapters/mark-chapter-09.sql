-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 9 — The Transfiguration, Faith and Failure, True Greatness
-- 50 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'Mark 9 moves from the mountaintop of divine glory to the valley of human failure, and from there to the classroom of true greatness. The chapter opens with Jesus'' promise that some standing here will ''see the kingdom of God come with power'' (v.1), fulfilled six days later on the Mount of Transfiguration (vv.2-8). Before Peter, James, and John, Jesus is transfigured — his clothes become ''exceeding white as snow; so as no fuller on earth can white them'' (v.3). Moses and Elijah appear, representing the Law and the Prophets, conversing with Jesus. Peter, terrified and bewildered, proposes building three tabernacles (v.5). A cloud overshadows them and a divine voice declares, ''This is my beloved Son: hear him'' (v.7). Descending, Jesus forbids them to tell anyone ''till the Son of man were risen from the dead'' (v.9). They discuss what ''rising from the dead'' means and ask about Elijah (vv.10-13). At the mountain''s base, they find the remaining disciples unable to cast out a deaf and dumb spirit from a boy (vv.14-18). Jesus cries, ''O faithless generation, how long shall I be with you?'' (v.19). The father''s desperate cry — ''Lord, I believe; help thou mine unbelief'' (v.24) — is one of Scripture''s most honest prayers. Jesus casts out the spirit and explains: ''This kind can come forth by nothing, but by prayer and fasting'' (v.29). The second passion prediction follows: ''The Son of man is delivered into the hands of men, and they shall kill him; and after that he is killed, he shall rise the third day'' (v.31). The disciples do not understand and are afraid to ask. Instead, they argue about ''who should be the greatest'' (v.34). Jesus responds by setting a child in their midst: ''Whosoever shall receive one of such children in my name, receiveth me'' (v.37). John reports stopping an unauthorized exorcist; Jesus corrects him: ''he that is not against us is on our part'' (v.40). The chapter closes with severe warnings about causing others to stumble — millstones, severed hands, plucked eyes, and unquenchable fire (vv.42-48) — culminating in the mysterious sayings about salt (vv.49-50).',
  'Glory, Failure, and the Upside-Down Kingdom — From Transfiguration to Servanthood',
  'μεταμορφόω (metamorphoō)',
  'To transfigure, transform, change form — from meta (change) + morphē (form, essential nature). Jesus'' transfiguration briefly revealed his pre-incarnate glory, the divine nature veiled in human flesh. The metamorphosis was not a change in who Jesus was but a momentary unveiling of who he always is — ''the brightness of his glory'' (Hebrews 1:3). The same word is used for the believer''s progressive transformation in Romans 12:2 and 2 Corinthians 3:18.',
  '["The Transfiguration: Glory Unveiled (vv.1-8): Jesus takes Peter James and John up a high mountain where he is transfigured before them. His clothes become dazzling white. Moses and Elijah appear talking with him. Peter proposes three tabernacles. A cloud overshadows and the Father declares This is my beloved Son hear him. Suddenly they see Jesus only","The Question About Elijah and Rising from the Dead (vv.9-13): Descending the mountain Jesus forbids disclosure until the Son of man rises from the dead. The disciples question what rising from the dead means. Jesus explains Elias has indeed come first and they have done unto him whatsoever they listed — pointing to John the Baptist","The Demonized Boy: Faith and Failure in the Valley (vv.14-29): The remaining disciples cannot cast out a deaf and dumb spirit. Jesus rebukes the faithless generation. The father cries Lord I believe help thou mine unbelief. Jesus casts out the spirit and explains this kind comes forth only by prayer and fasting","The Second Passion Prediction (vv.30-32): Jesus teaches that the Son of man is delivered into the hands of men and they shall kill him and after three days he shall rise again. The disciples do not understand and are afraid to ask","True Greatness and Stumbling Blocks (vv.33-50): The disciples argue about who is greatest. Jesus sets a child among them and teaches that receiving a child in his name is receiving him. He warns against causing little ones to stumble with severe imagery of millstones fire and salt. Have salt in yourselves and have peace one with another"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 50 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And he said unto them, Verily I say unto you, That there be some of them that stand here, which shall not taste of death, till they have seen the kingdom of God come with power.',
   'καὶ ἔλεγεν αὐτοῖς ἀμὴν λέγω ὑμῖν ὅτι εἰσίν τινες τῶν ὧδε ἑστηκότων οἵτινες οὐ μὴ γεύσωνται θανάτου ἕως ἂν ἴδωσιν τὴν βασιλείαν τοῦ θεοῦ ἐληλυθυῖαν ἐν δυνάμει',
   'kai elegen autois amēn legō hymin hoti eisin tines tōn hōde hestēkotōn hoitines ou mē geusōntai thanatou heōs an idōsin tēn basileian tou theou elēlythuian en dynamei',
   '''Shall not taste of death'' (ou mē geusōntai thanatou — a double negative: they shall certainly not experience death). ''Kingdom of God come with power'' (elēlythuian en dynamei — having arrived in power; perfect participle indicating a completed state). Most naturally fulfilled in the Transfiguration that follows six days later, where three disciples witness the kingdom''s glory unveiled in Christ. Peter later identifies the Transfiguration as this fulfilment (2 Peter 1:16-18).',
   NULL),
  (2, 'And after six days Jesus taketh with him Peter, and James, and John, and leadeth them up into an high mountain apart by themselves: and he was transfigured before them.',
   'καὶ μετὰ ἡμέρας ἓξ παραλαμβάνει ὁ Ἰησοῦς τὸν Πέτρον καὶ τὸν Ἰάκωβον καὶ τὸν Ἰωάννην καὶ ἀναφέρει αὐτοὺς εἰς ὄρος ὑψηλὸν κατ᾿ ἰδίαν μόνους καὶ μετεμορφώθη ἔμπροσθεν αὐτῶν',
   'kai meta hēmeras hex paralambanei ho Iēsous ton Petron kai ton Iakōbon kai ton Iōannēn kai anapherei autous eis oros hypsēlon kat idian monous kai metemorphōthē emprosthen autōn',
   '''After six days'' — an unusually precise time marker; possibly echoing Exodus 24:16 (the cloud covered Mount Sinai six days before God called Moses on the seventh). ''Peter, James, and John'' — the inner circle, also present at Jairus'' daughter''s raising (5:37) and later at Gethsemane (14:33). ''Transfigured'' (metemorphōthē — transformed, changed in form; the English word ''metamorphosis'' comes directly from this). The divine glory hidden within Jesus'' humanity is momentarily revealed.',
   'The Transfiguration is a pivotal christological event. Coming six days after Peter''s confession and the first passion prediction, it serves as divine confirmation: the one who must suffer and die is indeed the glorious Son of God. The event echoes Moses on Sinai (Exodus 24:15-18; 34:29-35): a high mountain, a cloud, divine speech, radiant glory. But Jesus'' glory is not reflected (like Moses'') — it emanates from within. He does not receive glory; he reveals it. The Transfiguration bridges incarnation and glorification, assuring the disciples that the cross is not the end but the path to glory.'),
  (3, 'And his raiment became shining, exceeding white as snow; so as no fuller on earth can white them.',
   'καὶ τὰ ἱμάτια αὐτοῦ ἐγένοντο στίλβοντα λευκὰ λίαν ὡς χιών οἷα γναφεὺς ἐπὶ τῆς γῆς οὐ δύναται οὕτως λευκᾶναι',
   'kai ta himatia autou egenonto stilbonta leuka lian hōs chiōn hoia gnapheus epi tēs gēs ou dynatai houtōs leukanai',
   '''Shining'' (stilbonta — glistening, gleaming). ''Exceeding white'' (leuka lian — extremely white). ''Fuller'' (gnapheus — a cloth bleacher; the person who cleans and whitens fabric). Mark''s earthy comparison — no launderer on earth could produce such whiteness — emphasises the supernatural origin of the radiance. This is not reflected light but emanating glory, the shekinah bursting through human flesh.',
   NULL),
  (4, 'And there appeared unto them Elias with Moses: and they were talking with Jesus.',
   'καὶ ὤφθη αὐτοῖς Ἠλίας σὺν Μωϋσεῖ καὶ ἦσαν συλλαλοῦντες τῷ Ἰησοῦ',
   'kai ōphthē autois Ēlias syn Mōysei kai ēsan syllalountes tō Iēsou',
   '''Appeared'' (ōphthē — were seen, became visible). Elijah and Moses represent the Prophets and the Law — the entire Old Testament bears witness to Jesus. ''Talking with Jesus'' (syllalountes — conversing together). Luke 9:31 reveals they spoke of his ''departure'' (exodus) at Jerusalem — the cross. The Law and the Prophets converge on the suffering of the Messiah.',
   NULL),
  (5, 'And Peter answered and said to Jesus, Master, it is good for us to be here: and let us make three tabernacles; one for thee, and one for Moses, and one for Elias.',
   'καὶ ἀποκριθεὶς ὁ Πέτρος λέγει τῷ Ἰησοῦ ῥαββί καλόν ἐστιν ἡμᾶς ὧδε εἶναι καὶ ποιήσωμεν τρεῖς σκηνάς σοὶ μίαν καὶ Μωϋσεῖ μίαν καὶ Ἠλίᾳ μίαν',
   'kai apokritheis ho Petros legei tō Iēsou rhabbi kalon estin hēmas hōde einai kai poiēsōmen treis skēnas soi mian kai Mōysei mian kai Ēlia mian',
   '''Master'' (rhabbi — rabbi, teacher). ''Tabernacles'' (skēnas — tents, booths; evoking the Feast of Tabernacles and the wilderness tabernacle). Peter wants to preserve the glorious moment, perhaps associating it with the messianic age. ''Three tabernacles'' — Peter places Jesus alongside Moses and Elijah as equals. The Father''s response (v.7) will correct this: Jesus is not one of three but the supreme, beloved Son.',
   NULL),
  (6, 'For he wist not what to say; for they were sore afraid.',
   'οὐ γὰρ ᾔδει τί ἀποκριθῇ ἔκφοβοι γὰρ ἐγένοντο',
   'ou gar ēdei ti apokrithē ekphoboi gar egenonto',
   '''Wist not'' (ouk ēdei — did not know). ''Sore afraid'' (ekphoboi — terrified, struck with extreme fear). Mark''s honest editorial: Peter spoke because he was terrified and did not know what to say. Fear and bewilderment produced babble. The experience of unmediated divine glory overwhelms human capacity.',
   NULL),
  (7, 'And there was a cloud that overshadowed them: and a voice came out of the cloud, saying, This is my beloved Son: hear him.',
   'καὶ ἐγένετο νεφέλη ἐπισκιάζουσα αὐτοῖς καὶ ἐγένετο φωνὴ ἐκ τῆς νεφέλης οὗτός ἐστιν ὁ υἱός μου ὁ ἀγαπητός ἀκούετε αὐτοῦ',
   'kai egeneto nephelē episkiazousa autois kai egeneto phōnē ek tēs nephelēs houtos estin ho huios mou ho agapētos akouete autou',
   '''Cloud'' (nephelē — the shekinah cloud of God''s presence, cf. Exodus 40:34-38). ''Overshadowed'' (episkiazousa — covered, enveloped; the same verb used of the Holy Spirit overshadowing Mary, Luke 1:35). ''Beloved Son'' (ho huios mou ho agapētos — echoing the baptismal declaration, 1:11, and the binding of Isaac, Genesis 22:2 LXX). ''Hear him'' (akouete autou — listen to him; an imperative echoing Deuteronomy 18:15, the promise of a prophet like Moses whom the people must hear).',
   'The divine voice at the Transfiguration makes three statements: (1) ''This is my beloved Son'' — confirms Jesus'' unique divine sonship (cf. 1:11). (2) The implicit correction of Peter: not three tabernacles for three equals, but one Son who is supreme over Moses and Elijah. (3) ''Hear him'' — a direct allusion to Deuteronomy 18:15 (''The LORD thy God will raise up unto thee a Prophet... unto him ye shall hearken''). The Law (Moses) and the Prophets (Elijah) both point to Jesus. From now on, the authoritative voice is his. This is christological supremacy in the clearest terms.'),
  (8, 'And suddenly, when they had looked round about, they saw no man any more, save Jesus only with themselves.',
   'καὶ ἐξάπινα περιβλεψάμενοι οὐκέτι οὐδένα εἶδον ἀλλὰ τὸν Ἰησοῦν μόνον μεθ᾿ ἑαυτῶν',
   'kai exapina periblepsamenoi ouketi oudena eidon alla ton Iēsoun monon meth heautōn',
   '''Suddenly'' (exapina — all at once). ''Jesus only'' (ton Iēsoun monon — Jesus alone). Moses and Elijah vanish; the cloud lifts; the glory fades. What remains is Jesus only — the Law and Prophets have yielded to the One they testified about. The disciples must now follow Jesus alone: not Moses'' law, not Elijah''s fire, but the suffering Son.',
   NULL),
  (9, 'And as they came down from the mountain, he charged them that they should tell no man what things they had seen, till the Son of man were risen from the dead.',
   'καταβαινόντων δὲ αὐτῶν ἀπὸ τοῦ ὄρους διεστείλατο αὐτοῖς ἵνα μηδενὶ ἃ εἶδον διηγήσωνται εἰ μὴ ὅταν ὁ υἱὸς τοῦ ἀνθρώπου ἐκ νεκρῶν ἀναστῇ',
   'katabainontōn de autōn apo tou orous diesteilato autois hina mēdeni ha eidon diēgēsōntai ei mē hotan ho huios tou anthrōpou ek nekrōn anastē',
   '''Till the Son of man were risen from the dead'' — the messianic secret has a termination date: the resurrection. After the resurrection, the Transfiguration can be properly understood — it was not an alternative to the cross but a preview of its outcome. Glory follows suffering; resurrection follows death.',
   NULL),
  (10, 'And they kept that saying with themselves, questioning one with another what the rising from the dead should mean.',
   'καὶ τὸν λόγον ἐκράτησαν πρὸς ἑαυτοὺς συζητοῦντες τί ἐστιν τὸ ἐκ νεκρῶν ἀναστῆναι',
   'kai ton logon ekratēsan pros heautous syzētountes ti estin to ek nekrōn anastēnai',
   '''Kept that saying'' (ton logon ekratēsan — held on to the word, obeyed the command). ''Questioning'' (syzētountes — debating, discussing among themselves). ''What the rising from the dead should mean'' — the disciples knew about resurrection as a general end-time event (cf. Daniel 12:2; John 11:24). What puzzled them was the idea that the Messiah would die and rise before the general resurrection. A dying Messiah was inconceivable.',
   NULL),
  (11, 'And they asked him, saying, Why say the scribes that Elias must first come?',
   'καὶ ἐπηρώτων αὐτὸν λέγοντες ὅτι λέγουσιν οἱ γραμματεῖς ὅτι Ἠλίαν δεῖ ἐλθεῖν πρῶτον',
   'kai epērōtōn auton legontes hoti legousin hoi grammateis hoti Ēlian dei elthein prōton',
   'Having just seen Elijah on the mountain, the disciples ask about the scribal teaching that Elijah must come before the Messiah (based on Malachi 4:5-6). The question implies: if you are the Messiah and Elijah has just appeared, why was it only a brief vision and not a permanent coming?',
   NULL),
  (12, 'And he answered and told them, Elias verily cometh first, and restoreth all things; and how it is written of the Son of man, that he must suffer many things, and be set at nought.',
   'ὁ δὲ ἀποκριθεὶς εἶπεν αὐτοῖς Ἠλίας μὲν ἐλθὼν πρῶτον ἀποκαθιστᾷ πάντα καὶ πῶς γέγραπται ἐπὶ τὸν υἱὸν τοῦ ἀνθρώπου ἵνα πολλὰ πάθῃ καὶ ἐξουδενωθῇ',
   'ho de apokritheis eipen autois Ēlias men elthōn prōton apokathistā panta kai pōs gegraptai epi ton huion tou anthrōpou hina polla pathē kai exoudenōthē',
   '''Restoreth all things'' (apokathistā panta — sets all things right). ''Set at nought'' (exoudenōthē — treated as nothing, utterly despised; cf. Isaiah 53:3). Jesus affirms the Elijah-first teaching but connects it to suffering: just as the Son of man must suffer, so the Elijah figure also suffered (v.13). The pattern is: precursor suffers, Messiah suffers. Glory comes only through the cross.',
   NULL),
  (13, 'But I say unto you, That Elias is indeed come, and they have done unto him whatsoever they listed, as it is written of him.',
   'ἀλλὰ λέγω ὑμῖν ὅτι καὶ Ἠλίας ἐλήλυθεν καὶ ἐποίησαν αὐτῷ ὅσα ἤθελον καθὼς γέγραπται ἐπ᾿ αὐτόν',
   'alla legō hymin hoti kai Ēlias elēlythen kai epoiēsan autō hosa ēthelon kathōs gegraptai ep auton',
   '''Elias is indeed come'' (Ēlias elēlythen — Elijah has already come; perfect tense: his coming is complete). ''Done unto him whatsoever they listed'' — a reference to John the Baptist''s arrest and execution by Herod (6:17-29). John came in the spirit and power of Elijah (Luke 1:17) and met the same fate as many prophets: rejection and death.',
   NULL),
  (14, 'And when he came to his disciples, he saw a great multitude about them, and the scribes questioning with them.',
   'καὶ ἐλθὼν πρὸς τοὺς μαθητὰς εἶδεν ὄχλον πολὺν περὶ αὐτοὺς καὶ γραμματεῖς συζητοῦντας πρὸς αὐτούς',
   'kai elthōn pros tous mathētas eiden ochlon polyn peri autous kai grammateis syzētountas pros autous',
   'The descent from the mountain of glory to the valley of failure is dramatic — paralleling Moses descending Sinai to find Israel worshipping the golden calf (Exodus 32). The scribes are disputing with the nine remaining disciples, likely exploiting their inability to perform the exorcism. The contrast is deliberate: glory above, failure below.',
   NULL),
  (15, 'And straightway all the people, when they beheld him, were greatly amazed, and running to him saluted him.',
   'καὶ εὐθέως πᾶς ὁ ὄχλος ἰδόντες αὐτὸν ἐξεθαμβήθησαν καὶ προστρέχοντες ἠσπάζοντο αὐτόν',
   'kai eutheōs pas ho ochlos idontes auton exethambēthēsan kai prostrechontes ēspazonto auton',
   '''Greatly amazed'' (exethambēthēsan — utterly astonished). The crowd''s amazement at seeing Jesus may suggest some residual radiance from the Transfiguration, like Moses'' shining face (Exodus 34:29-30), though Mark does not explicitly state this. Their amazement drives them to run toward him and greet him.',
   NULL),
  (16, 'And he asked the scribes, What question ye with them?',
   'καὶ ἐπηρώτησεν τοὺς γραμματεῖς τί συζητεῖτε πρὸς αὐτούς',
   'kai epērōtēsen tous grammateis ti syzēteite pros autous',
   'Jesus addresses the scribes directly, taking command of the situation. The question exposes their agenda: they were using the disciples'' failure to discredit Jesus. But Jesus'' arrival shifts the dynamic entirely.',
   NULL),
  (17, 'And one of the multitude answered and said, Master, I have brought unto thee my son, which hath a dumb spirit;',
   'καὶ ἀποκριθεὶς εἷς ἐκ τοῦ ὄχλου εἶπεν διδάσκαλε ἤνεγκα τὸν υἱόν μου πρὸς σέ ἔχοντα πνεῦμα ἄλαλον',
   'kai apokritheis heis ek tou ochlou eipen didaskale ēnenka ton huion mou pros se echonta pneuma alalon',
   '''Dumb spirit'' (pneuma alalon — a mute/speechless spirit). The father had brought his son to Jesus but found only the disciples. The spirit deprives the boy of speech — a cruel inversion of human dignity, which is expressed through language and communication.',
   NULL),
  (18, 'And wheresoever he taketh him, he teareth him: and he foameth, and gnasheth with his teeth, and pineth away: and I spake to thy disciples that they should cast him out; and they could not.',
   'καὶ ὅπου ἐὰν αὐτὸν καταλάβῃ ῥήσσει αὐτόν καὶ ἀφρίζει καὶ τρίζει τοὺς ὀδόντας καὶ ξηραίνεται καὶ εἶπα τοῖς μαθηταῖς σου ἵνα αὐτὸ ἐκβάλωσιν καὶ οὐκ ἴσχυσαν',
   'kai hopou ean auton katalabē rhēssei auton kai aphrizei kai trizei tous odontas kai xērainetai kai eipa tois mathētais sou hina auto ekbalōsin kai ouk ischysan',
   '''Teareth him'' (rhēssei — dashes him down, convulses him). ''Foameth'' (aphrizei — foams at the mouth). ''Gnasheth'' (trizei — grinds his teeth). ''Pineth away'' (xērainetai — withers, wastes away). The symptoms are violent and destructive. ''They could not'' (ouk ischysan — they lacked the strength/ability). The disciples'' failure is public and humiliating.',
   NULL),
  (19, 'He answereth him, and saith, O faithless generation, how long shall I be with you? how long shall I suffer you? bring him unto me.',
   'ὁ δὲ ἀποκριθεὶς αὐτοῖς λέγει ὦ γενεὰ ἄπιστος ἕως πότε πρὸς ὑμᾶς ἔσομαι ἕως πότε ἀνέξομαι ὑμῶν φέρετε αὐτὸν πρός με',
   'ho de apokritheis autois legei ō genea apistos heōs pote pros hymas esomai heōs pote anexomai hymōn pherete auton pros me',
   '''O faithless generation'' (ō genea apistos — the address includes the disciples, the crowd, and the scribes). ''How long'' (heōs pote — until when?). ''Suffer you'' (anexomai — endure, bear with). Jesus'' frustration is not irritability but the grief of the divine Son confronting the persistent unbelief of the world he came to save. The double ''how long'' echoes Moses'' and God''s exasperation with Israel (Numbers 14:11, 27).',
   NULL),
  (20, 'And they brought him unto him: and when he saw him, straightway the spirit tare him; and he fell on the ground, and wallowed foaming.',
   'καὶ ἤνεγκαν αὐτὸν πρὸς αὐτόν καὶ ἰδὼν αὐτὸν τὸ πνεῦμα εὐθέως ἐσπάραξεν αὐτόν καὶ πεσὼν ἐπὶ τῆς γῆς ἐκυλίετο ἀφρίζων',
   'kai ēnenkan auton pros auton kai idōn auton to pneuma eutheōs esparaxen auton kai pesōn epi tēs gēs ekylieto aphrizōn',
   '''The spirit tare him'' (esparaxen — convulsed violently). The demon reacts to Jesus'' presence with a final violent assault. ''Wallowed foaming'' — the boy rolls on the ground in convulsions. The evil spirit''s violence intensifies at the approach of the Holy One, a pattern seen throughout Mark (cf. 1:26; 5:6-7).',
   NULL),
  (21, 'And he asked his father, How long is it ago since this came unto him? And he said, Of a child.',
   'καὶ ἐπηρώτησεν τὸν πατέρα αὐτοῦ πόσος χρόνος ἐστὶν ὡς τοῦτο γέγονεν αὐτῷ ὁ δὲ εἶπεν ἐκ παιδιόθεν',
   'kai epērōtēsen ton patera autou posos chronos estin hōs touto gegonen autō ho de eipen ek paidiothen',
   '''How long'' (posos chronos — how much time). ''Of a child'' (ek paidiothen — from childhood; this has been a lifelong affliction). Jesus gathers information not because he needs it but to draw out the father''s faith and to display the extent of the suffering. The long duration emphasises the severity — this is no recent or mild case.',
   NULL),
  (22, 'And ofttimes it hath cast him into the fire, and into the waters, to destroy him: but if thou canst do any thing, have compassion on us, and help us.',
   'καὶ πολλάκις αὐτὸν καὶ εἰς πῦρ ἔβαλεν καὶ εἰς ὕδατα ἵνα ἀπολέσῃ αὐτόν ἀλλ᾿ εἴ τι δύνασαι βοήθησον ἡμῖν σπλαγχνισθεὶς ἐφ᾿ ἡμᾶς',
   'kai pollakis auton kai eis pyr ebalen kai eis hydata hina apolesē auton all ei ti dynasai boēthēson hēmin splanchnistheis eph hēmas',
   '''Into the fire... into the waters'' — the spirit seeks to destroy the boy through accident disguised as seizure. ''To destroy him'' (apolesē — to utterly ruin). ''If thou canst'' (ei ti dynasai — if you are able at all). The father''s faith is real but weak, battered by years of suffering and the disciples'' recent failure. ''Have compassion on us'' (splanchnistheis — be moved with gut-level compassion; the same word used of Jesus in 1:41; 6:34; 8:2). ''Us'' — the father identifies himself with his son''s suffering.',
   NULL),
  (23, 'Jesus said unto him, If thou canst believe, all things are possible to him that believeth.',
   'ὁ δὲ Ἰησοῦς εἶπεν αὐτῷ τὸ εἰ δύνασαι πιστεῦσαι πάντα δυνατὰ τῷ πιστεύοντι',
   'ho de Iēsous eipen autō to ei dynasai pisteusai panta dynata tō pisteuonti',
   '''If thou canst believe'' — Jesus redirects the question. The issue is not ''Can Jesus do it?'' but ''Can you believe?'' The ''if'' shifts from Christ''s ability to the father''s faith. ''All things are possible to him that believeth'' (panta dynata tō pisteuonti — everything is possible for the one who believes). Faith is the channel through which divine power flows; its absence is the only impediment.',
   NULL),
  (24, 'And straightway the father of the child cried out, and said with tears, Lord, I believe; help thou mine unbelief.',
   'καὶ εὐθέως κράξας ὁ πατὴρ τοῦ παιδίου ἔλεγεν μετὰ δακρύων πιστεύω κύριε βοήθει μου τῇ ἀπιστίᾳ',
   'kai eutheōs kraxas ho patēr tou paidiou elegen meta dakryōn pisteuō kyrie boēthei mou tē apistia',
   '''Cried out'' (kraxas — shouted, screamed). ''With tears'' (meta dakryōn — weeping). ''I believe; help thou mine unbelief'' (pisteuō; boēthei mou tē apistia — I believe; come to the aid of my unbelief). This is one of the most psychologically honest prayers in Scripture. The father does not pretend to perfect faith; he confesses both his belief and his doubt simultaneously. He asks Jesus to strengthen the very faith that is reaching out.',
   'This verse is a masterpiece of spiritual honesty and has become one of the most beloved prayers in Christian history. The father''s cry reveals the paradox of faith: genuine belief coexists with genuine doubt. He does not say ''I have no faith'' (that would be unbelief), nor does he claim perfect faith (that would be pretence). He stands in the honest middle ground where most believers actually live. And Jesus honours this imperfect, tear-stained, doubt-mingled faith by healing the boy. The lesson: God does not require perfect faith — he requires honest faith that brings its weakness to him for help.'),
  (25, 'When Jesus saw that the people came running together, he rebuked the foul spirit, saying unto him, Thou dumb and deaf spirit, I charge thee, come out of him, and enter no more into him.',
   'ἰδὼν δὲ ὁ Ἰησοῦς ὅτι ἐπισυντρέχει ὄχλος ἐπετίμησεν τῷ πνεύματι τῷ ἀκαθάρτῳ λέγων αὐτῷ τὸ πνεῦμα τὸ ἄλαλον καὶ κωφόν ἐγὼ σοὶ ἐπιτάσσω ἔξελθε ἐξ αὐτοῦ καὶ μηκέτι εἰσέλθῃς εἰς αὐτόν',
   'idōn de ho Iēsous hoti episyntrechei ochlos epetimēsen tō pneumati tō akathartō legōn autō to pneuma to alalon kai kōphon egō soi epitassō exelthe ex autou kai mēketi eiselthēs eis auton',
   '''I charge thee'' (egō soi epitassō — I myself command you; emphatic first person: my authority, not the disciples''). ''Dumb and deaf'' (alalon kai kōphon — speechless and hearing-impaired). ''Come out... enter no more'' — two commands: departure and permanent prohibition. Jesus addresses the spirit directly, names its specific effects, asserts personal authority, and forbids return. The ''no more'' distinguishes this from other exorcisms and ensures permanent deliverance.',
   NULL),
  (26, 'And the spirit cried, and rent him sore, and came out of him: and he was as one dead; insomuch that many said, He is dead.',
   'καὶ κράξαν καὶ πολλὰ σπαράξαν αὐτὸν ἐξῆλθεν καὶ ἐγένετο ὡσεὶ νεκρός ὥστε τοὺς πολλοὺς λέγειν ὅτι ἀπέθανεν',
   'kai kraxan kai polla sparaxan auton exēlthen kai egeneto hōsei nekros hōste tous pollous legein hoti apethanen',
   '''Cried'' (kraxan — shrieked). ''Rent him sore'' (polla sparaxan — violently convulsed him many times). ''As one dead'' (hōsei nekros — like a corpse). The departure is violent — the demon''s final assault. The boy appears dead. But what looks like death is actually the first moment of freedom. The pattern anticipates the cross: apparent death gives way to new life.',
   NULL),
  (27, 'But Jesus took him by the hand, and lifted him up; and he arose.',
   'ὁ δὲ Ἰησοῦς κρατήσας αὐτὸν τῆς χειρὸς ἤγειρεν αὐτόν καὶ ἀνέστη',
   'ho de Iēsous kratēsas auton tēs cheiros ēgeiren auton kai anestē',
   '''Took him by the hand'' (kratēsas tēs cheiros — grasped his hand). ''Lifted him up'' (ēgeiren — raised him; the same verb used for resurrection). ''He arose'' (anestē — he stood up; again, resurrection vocabulary). Mark uses deliberate resurrection language: the boy was ''as dead'' (v.26), Jesus ''raised'' him, and he ''arose.'' This is a miniature resurrection — a preview of what the cross will accomplish.',
   NULL),
  (28, 'And when he was come into the house, his disciples asked him privately, Why could not we cast him out?',
   'καὶ εἰσελθόντος αὐτοῦ εἰς οἶκον οἱ μαθηταὶ αὐτοῦ κατ᾿ ἰδίαν ἐπηρώτων αὐτὸν ὅτι ἡμεῖς οὐκ ἠδυνήθημεν ἐκβαλεῖν αὐτό',
   'kai eiselthontos autou eis oikon hoi mathētai autou kat idian epērōtōn auton hoti hēmeis ouk ēdynēthēmen ekbalein auto',
   '''Privately'' (kat idian — in private). ''Why could not we'' (hēmeis ouk ēdynēthēmen — why were we unable?). The disciples had been given authority over unclean spirits (6:7) and had exercised it successfully (6:13). Their failure here was not a withdrawal of authority but a failure to depend on its source through prayer.',
   NULL),
  (29, 'And he said unto them, This kind can come forth by nothing, but by prayer and fasting.',
   'καὶ εἶπεν αὐτοῖς τοῦτο τὸ γένος ἐν οὐδενὶ δύναται ἐξελθεῖν εἰ μὴ ἐν προσευχῇ καὶ νηστείᾳ',
   'kai eipen autois touto to genos en oudeni dynatai exelthein ei mē en proseuchē kai nēsteia',
   '''This kind'' (touto to genos — this type/category of demon). ''Prayer and fasting'' (proseuchē kai nēsteia). Some demons require more intense spiritual preparation. The disciples had apparently begun to rely on their delegated authority as a technique rather than maintaining dependent communion with God. Power without prayer becomes presumption.',
   'This verse teaches that spiritual authority is not mechanical but relational. The disciples'' failure was not in their technique but in their prayer life. Authority over evil spirits is exercised through ongoing dependence on God, expressed in prayer and fasting. Prayer expresses faith-dependence; fasting expresses urgency and self-denial. Together they represent total reliance on God''s power rather than one''s own spiritual credentials. Some battles can only be won on our knees.'),
  (30, 'And they departed thence, and passed through Galilee; and he would not that any man should know it.',
   'καὶ ἐκεῖθεν ἐξελθόντες παρεπορεύοντο διὰ τῆς Γαλιλαίας καὶ οὐκ ἤθελεν ἵνα τις γνοῖ',
   'kai ekeithen exelthontes pareporeuonto dia tēs Galilaias kai ouk ēthelen hina tis gnoi',
   'Jesus travels incognito through Galilee because his purpose is now instruction, not public ministry. The messianic secret intensifies as the cross approaches. He needs private time with the disciples to teach what the Messiah must do.',
   NULL),
  (31, 'For he taught his disciples, and said unto them, The Son of man is delivered into the hands of men, and they shall kill him; and after that he is killed, he shall rise the third day.',
   'ἐδίδασκεν γὰρ τοὺς μαθητὰς αὐτοῦ καὶ ἔλεγεν αὐτοῖς ὅτι ὁ υἱὸς τοῦ ἀνθρώπου παραδίδοται εἰς χεῖρας ἀνθρώπων καὶ ἀποκτενοῦσιν αὐτόν καὶ ἀποκτανθεὶς μετὰ τρεῖς ἡμέρας ἀναστήσεται',
   'edidasken gar tous mathētas autou kai elegen autois hoti ho huios tou anthrōpou paradidotai eis cheiras anthrōpōn kai apoktenousin auton kai apoktantheis meta treis hēmeras anastēsetai',
   '''Is delivered'' (paradidotai — is being handed over; present tense: the process is already underway). ''Into the hands of men'' — a deliberate wordplay: the ''Son of man'' delivered into the ''hands of men.'' The divine title meets human violence. ''Kill him'' (apoktenousin) and ''rise the third day'' (anastēsetai) — the second passion prediction is shorter and starker than the first (8:31), with no mention of specific opponents. The focus narrows to betrayal and death.',
   NULL),
  (32, 'But they understood not that saying, and were afraid to ask him.',
   'οἱ δὲ ἠγνόουν τὸ ῥῆμα καὶ ἐφοβοῦντο αὐτὸν ἐπερωτῆσαι',
   'hoi de ēgnooun to rhēma kai ephobounto auton eperōtēsai',
   '''Understood not'' (ēgnooun — were ignorant of, failed to comprehend). ''Afraid to ask'' (ephobounto eperōtēsai — feared to question him). After Peter''s rebuke in 8:32-33, the disciples dare not challenge Jesus again. Their silence is not reverence but avoidance — they do not want to hear more about suffering and death. Ignorance and fear together prevent spiritual growth.',
   NULL),
  (33, 'And he came to Capernaum: and being in the house he asked them, What was it that ye disputed among yourselves by the way?',
   'καὶ ἦλθεν εἰς Καφαρναούμ καὶ ἐν τῇ οἰκίᾳ γενόμενος ἐπηρώτα αὐτούς τί ἐν τῇ ὁδῷ πρὸς ἑαυτοὺς διελογίζεσθε',
   'kai ēlthen eis Kapharnaoum kai en tē oikia genomenos epērōta autous ti en tē hodō pros heautous dielogizesthe',
   '''Disputed'' (dielogizesthe — debated, argued). Jesus already knows the answer but asks the question to expose their hearts. The contrast is devastating: Jesus has been teaching about his death, and the disciples have been arguing about their greatness. They are on the same road but in completely different worlds.',
   NULL),
  (34, 'But they held their peace: for by the way they had disputed among themselves, who should be the greatest.',
   'οἱ δὲ ἐσιώπων πρὸς ἀλλήλους γὰρ διελέχθησαν ἐν τῇ ὁδῷ τίς μείζων',
   'hoi de esiōpōn pros allēlous gar dielechthēsan en tē hodō tis meizōn',
   '''Held their peace'' (esiōpōn — were silent, kept quiet). ''Who should be the greatest'' (tis meizōn — who is greater). Their silence is shame — they know their discussion was inappropriate. While Jesus speaks of self-sacrifice, they debate self-promotion. The irony is the central tension of the discipleship section (8:22-10:52): Jesus teaches the way of the cross, the disciples crave the way of the crown.',
   NULL),
  (35, 'And he sat down, and called the twelve, and saith unto them, If any man desire to be first, the same shall be last of all, and servant of all.',
   'καὶ καθίσας ἐφώνησεν τοὺς δώδεκα καὶ λέγει αὐτοῖς εἴ τις θέλει πρῶτος εἶναι ἔσται πάντων ἔσχατος καὶ πάντων διάκονος',
   'kai kathisas ephōnēsen tous dōdeka kai legei autois ei tis thelei prōtos einai estai pantōn eschatos kai pantōn diakonos',
   '''Sat down'' (kathisas — the posture of a rabbi about to teach authoritatively). ''First'' (prōtos — first, chief, most important). ''Last'' (eschatos — last, lowest). ''Servant'' (diakonos — one who serves, a table waiter; the word from which ''deacon'' derives). Jesus inverts the hierarchy: the path to greatness is servanthood, the way up is down. This is not false modesty but a revolutionary redefinition of status in God''s kingdom.',
   'This is the foundational statement on Christian leadership. Jesus does not abolish the desire for greatness but redirects it: true greatness is measured by service, not by status. The diakonos (servant) is not a slave (doulos) but one who voluntarily chooses to serve. Jesus himself will embody this principle: ''the Son of man came not to be ministered unto, but to minister'' (10:45). In God''s kingdom, the hierarchy is inverted: the greatest is the servant of all.'),
  (36, 'And he took a child, and set him in the midst of them: and when he had taken him in his arms, he said unto them,',
   'καὶ λαβὼν παιδίον ἔστησεν αὐτὸ ἐν μέσῳ αὐτῶν καὶ ἐναγκαλισάμενος αὐτὸ εἶπεν αὐτοῖς',
   'kai labōn paidion estēsen auto en mesō autōn kai enankalisamenos auto eipen autois',
   '''Took a child'' (labōn paidion — took a young child). ''Set him in the midst'' — the child becomes the visual aid. ''Taken him in his arms'' (enankalisamenos — embraced, held in the crook of the arm; a tender gesture unique to Mark). In the ancient world, children had no social status, no power, no legal standing. By embracing a child, Jesus identifies with the powerless.',
   NULL),
  (37, 'Whosoever shall receive one of such children in my name, receiveth me: and whosoever shall receive me, receiveth not me, but him that sent me.',
   'ὃς ἐὰν ἓν τῶν τοιούτων παιδίων δέξηται ἐπὶ τῷ ὀνόματί μου ἐμὲ δέχεται καὶ ὃς ἐὰν ἐμὲ δέχηται οὐκ ἐμὲ δέχεται ἀλλὰ τὸν ἀποστείλαντά με',
   'hos ean hen tōn toioutōn paidiōn dexētai epi tō onomati mou eme dechetai kai hos ean eme dechētai ouk eme dechetai alla ton aposteilanta me',
   '''Receive'' (dexētai — welcome, accept, show hospitality to). ''In my name'' (epi tō onomati mou — on the basis of my name, for my sake). ''Him that sent me'' (ton aposteilanta me — the one who commissioned me, i.e., the Father). A chain of representation: receiving a child = receiving Jesus = receiving the Father. The most insignificant person, when received in Jesus'' name, connects the receiver directly to God. Status is irrelevant; what matters is how one treats the lowly.',
   NULL),
  (38, 'And John answered him, saying, Master, we saw one casting out devils in thy name, and he followeth not us: and we forbad him, because he followeth not us.',
   'ἀπεκρίθη δὲ αὐτῷ ὁ Ἰωάννης λέγων διδάσκαλε εἴδομέν τινα ἐν τῷ ὀνόματί σου ἐκβάλλοντα δαιμόνια ὃς οὐκ ἀκολουθεῖ ἡμῖν καὶ ἐκωλύσαμεν αὐτόν ὅτι οὐκ ἀκολουθεῖ ἡμῖν',
   'apekrithē de autō ho Iōannēs legōn didaskale eidomen tina en tō onomati sou ekballonta daimonia hos ouk akolouthei hēmin kai ekōlysamen auton hoti ouk akolouthei hēmin',
   '''Casting out devils in thy name'' — an unauthorized exorcist using Jesus'' name successfully (unlike the disciples themselves, vv.18, 28!). ''Followeth not us'' (ouk akolouthei hēmin — does not accompany our group). ''We forbad him'' (ekōlysamen — tried to stop him). The disciples'' concern is institutional: he is not part of our group. The irony is thick — they could not cast out the demon themselves (v.18), but they tried to stop someone who could.',
   NULL),
  (39, 'But Jesus said, Forbid him not: for there is no man which shall do a miracle in my name, that can lightly speak evil of me.',
   'ὁ δὲ Ἰησοῦς εἶπεν μὴ κωλύετε αὐτόν οὐδεὶς γάρ ἐστιν ὃς ποιήσει δύναμιν ἐπὶ τῷ ὀνόματί μου καὶ δυνήσεται ταχὺ κακολογῆσαί με',
   'ho de Iēsous eipen mē kōlyete auton oudeis gar estin hos poiēsei dynamin epi tō onomati mou kai dynēsetai tachy kakologēsai me',
   '''Forbid him not'' (mē kōlyete — stop hindering him). ''Lightly'' (tachy — quickly, readily). ''Speak evil'' (kakologēsai — slander, curse). Jesus corrects sectarian exclusivism. The test is not group membership but the use of Jesus'' name with genuine power. One who exercises power in Jesus'' name is unlikely to turn against him quickly. The kingdom is larger than any one group of followers.',
   NULL),
  (40, 'For he that is not against us is on our part.',
   'ὃς γὰρ οὐκ ἔστιν καθ᾿ ἡμῶν ὑπὲρ ἡμῶν ἐστιν',
   'hos gar ouk estin kath hēmōn hyper hēmōn estin',
   '''Not against us... on our part'' — this principle applies to outsiders doing good in Jesus'' name. It does not contradict Matthew 12:30 (''he that is not with me is against me''), which addresses the decision to follow Jesus personally. Context determines: regarding outsiders doing genuine good, be generous; regarding personal commitment, be decisive.',
   NULL),
  (41, 'For whosoever shall give you a cup of water to drink in my name, because ye belong to Christ, verily I say unto you, he shall not lose his reward.',
   'ὃς γὰρ ἂν ποτίσῃ ὑμᾶς ποτήριον ὕδατος ἐν ὀνόματί μου ὅτι Χριστοῦ ἐστε ἀμὴν λέγω ὑμῖν οὐ μὴ ἀπολέσῃ τὸν μισθὸν αὐτοῦ',
   'hos gar an potisē hymas potērion hydatos en onomati mou hoti Christou este amēn legō hymin ou mē apolesē ton misthon autou',
   '''A cup of water'' (potērion hydatos — the smallest possible act of kindness). ''In my name'' — done because of allegiance to Jesus. ''Because ye belong to Christ'' (Christou este — you are Christ''s). ''Shall not lose his reward'' (ou mē apolesē ton misthon — will certainly not forfeit the reward; double negative for emphasis). Even the most trivial kindness shown to a believer for Christ''s sake is recorded and rewarded by God.',
   NULL),
  (42, 'And whosoever shall offend one of these little ones that believe in me, it is better for him that a millstone were hanged about his neck, and he were cast into the sea.',
   'καὶ ὃς ἂν σκανδαλίσῃ ἕνα τῶν μικρῶν τούτων τῶν πιστευόντων εἰς ἐμέ καλόν ἐστιν αὐτῷ μᾶλλον εἰ περίκειται μύλος ὀνικὸς περὶ τὸν τράχηλον αὐτοῦ καὶ βέβληται εἰς τὴν θάλασσαν',
   'kai hos an skandalisē hena tōn mikrōn toutōn tōn pisteuontōn eis eme kalon estin autō mallon ei perikeitai mylos onikos peri ton trachēlon autou kai beblētai eis tēn thalassan',
   '''Offend'' (skandalisē — cause to stumble, lead into sin or apostasy). ''Little ones'' (mikrōn — the small ones; vulnerable believers, not just children). ''Millstone'' (mylos onikos — a large millstone turned by a donkey, not the smaller hand-mill). ''Better for him'' — drowning with a millstone would be a lighter fate than the judgment awaiting one who destroys another''s faith. The severity of the warning matches the preciousness of what is at stake.',
   'This is one of Jesus'' most severe warnings. Leading a believer into sin or away from faith is treated as a capital offense in God''s economy. The ''millstone'' imagery is deliberately extreme — death by drowning would be preferable to the divine judgment that awaits. The ''little ones'' are not necessarily children but any vulnerable believer whose faith can be damaged. This warning applies to religious leaders, teachers, and anyone whose influence can build up or tear down faith.'),
  (43, 'And if thy hand offend thee, cut it off: it is better for thee to enter into life maimed, than having two hands to go into hell, into the fire that never shall be quenched:',
   'καὶ ἐὰν σκανδαλίζῃ σε ἡ χείρ σου ἀπόκοψον αὐτήν καλόν ἐστίν σε κυλλὸν εἰσελθεῖν εἰς τὴν ζωήν ἢ τὰς δύο χεῖρας ἔχοντα ἀπελθεῖν εἰς τὴν γέενναν εἰς τὸ πῦρ τὸ ἄσβεστον',
   'kai ean skandalizē se hē cheir sou apokopson autēn kalon estin se kyllon eiselthein eis tēn zōēn ē tas dyo cheiras echonta apelthein eis tēn geennan eis to pyr to asbeston',
   '''Cut it off'' (apokopson — amputate). ''Maimed'' (kyllon — crippled). ''Life'' (zōēn — eternal life). ''Hell'' (geennan — Gehenna, the Valley of Hinnom south of Jerusalem, where child sacrifice had once occurred and which became a symbol of divine judgment). ''Fire that never shall be quenched'' (pyr to asbeston — unquenchable fire). The language is hyperbolic but the point is deadly serious: radical self-discipline is required to avoid spiritual destruction. Better to lose a faculty than to lose one''s soul.',
   NULL),
  (44, 'Where their worm dieth not, and the fire is not quenched.',
   'ὅπου ὁ σκώληξ αὐτῶν οὐ τελευτᾷ καὶ τὸ πῦρ οὐ σβέννυται',
   'hopou ho skōlēx autōn ou teleuta kai to pyr ou sbennutai',
   'Quoting Isaiah 66:24. ''Worm'' (skōlēx — maggot, the worm that feeds on corpses). ''Dieth not... not quenched'' — eternal, unceasing judgment. The imagery combines corruption (worms) with destruction (fire) — two forms of ruin that never end. This refrain (repeated in vv.44, 46, 48) underscores the permanence and severity of divine judgment.',
   NULL),
  (45, 'And if thy foot offend thee, cut it off: it is better for thee to enter halt into life, than having two feet to be cast into hell, into the fire that never shall be quenched:',
   'καὶ ἐὰν ὁ πούς σου σκανδαλίζῃ σε ἀπόκοψον αὐτόν καλόν ἐστίν σε εἰσελθεῖν εἰς τὴν ζωὴν χωλόν ἢ τοὺς δύο πόδας ἔχοντα βληθῆναι εἰς τὴν γέενναν εἰς τὸ πῦρ τὸ ἄσβεστον',
   'kai ean ho pous sou skandalizē se apokopson auton kalon estin se eiselthein eis tēn zōēn chōlon ē tous dyo podas echonta blēthēnai eis tēn geennan eis to pyr to asbeston',
   '''Foot'' — representing the places you go, the paths you walk. ''Halt'' (chōlon — lame). The escalating pattern — hand, foot, eye — covers the whole range of human activity: what you do (hand), where you go (foot), what you desire (eye). Each member represents a different avenue of temptation that must be ruthlessly addressed.',
   NULL),
  (46, 'Where their worm dieth not, and the fire is not quenched.',
   'ὅπου ὁ σκώληξ αὐτῶν οὐ τελευτᾷ καὶ τὸ πῦρ οὐ σβέννυται',
   'hopou ho skōlēx autōn ou teleuta kai to pyr ou sbennutai',
   'The refrain from Isaiah 66:24 is repeated, driving home the solemnity of eternal judgment. The repetition is not redundant but rhetorical — each iteration adds weight to the warning.',
   NULL),
  (47, 'And if thine eye offend thee, pluck it out: it is better for thee to enter into the kingdom of God with one eye, than having two eyes to be cast into hell fire:',
   'καὶ ἐὰν ὁ ὀφθαλμός σου σκανδαλίζῃ σε ἔκβαλε αὐτόν καλόν σέ ἐστιν μονόφθαλμον εἰσελθεῖν εἰς τὴν βασιλείαν τοῦ θεοῦ ἢ δύο ὀφθαλμοὺς ἔχοντα βληθῆναι εἰς τὴν γέενναν τοῦ πυρός',
   'kai ean ho ophthalmos sou skandalizē se ekbale auton kalon se estin monophthalmon eiselthein eis tēn basileian tou theou ē dyo ophthalmous echonta blēthēnai eis tēn geennan tou pyros',
   '''Pluck it out'' (ekbale — throw it out). ''With one eye'' (monophthalmon — one-eyed). ''Kingdom of God'' — here synonymous with ''life'' in vv.43, 45. The eye represents desire, lust, covetousness (cf. 7:22, ''an evil eye''). Jesus demands radical dealing with anything that leads to sin. The metaphor is not literal self-mutilation but ruthless removal of whatever causes spiritual stumbling.',
   NULL),
  (48, 'Where their worm dieth not, and the fire is not quenched.',
   'ὅπου ὁ σκώληξ αὐτῶν οὐ τελευτᾷ καὶ τὸ πῦρ οὐ σβέννυται',
   'hopou ho skōlēx autōn ou teleuta kai to pyr ou sbennutai',
   'Third repetition of Isaiah 66:24. The threefold repetition creates a solemn liturgical rhythm. The triple warning corresponds to the three body parts (hand, foot, eye) and underscores the absolute finality of Gehenna. Jesus speaks of hell more than any other figure in the Bible.',
   NULL),
  (49, 'For every one shall be salted with fire, and every sacrifice shall be salted with salt.',
   'πᾶς γὰρ πυρὶ ἁλισθήσεται καὶ πᾶσα θυσία ἁλὶ ἁλισθήσεται',
   'pas gar pyri halisthēsetai kai pasa thysia hali halisthēsetai',
   '''Salted with fire'' (pyri halisthēsetai — preserved/purified by fire). ''Every sacrifice shall be salted with salt'' (alluding to Leviticus 2:13, where every grain offering required salt). Salt preserves and purifies; fire tests and refines. Every believer will undergo the purifying fire of discipline and suffering. Like sacrificial salt, this is not destructive but consecrating — setting the disciple apart for God.',
   NULL),
  (50, 'Salt is good: but if the salt have lost his saltness, wherewith will ye season it? Have salt in yourselves, and have peace one with another.',
   'καλὸν τὸ ἅλας ἐὰν δὲ τὸ ἅλας ἄναλον γένηται ἐν τίνι αὐτὸ ἀρτύσετε ἔχετε ἐν ἑαυτοῖς ἅλας καὶ εἰρηνεύετε ἐν ἀλλήλοις',
   'kalon to halas ean de to halas analon genētai en tini auto artysete echete en heautois halas kai eirēneuete en allēlois',
   '''Salt is good'' (kalon to halas). ''Lost his saltness'' (analon genētai — become unsalty; chemically, salt cannot actually lose its saltiness, but impure salt mixtures can have the salt leached out, leaving tasteless residue). ''Have salt in yourselves'' — maintain the distinctive character of discipleship. ''Have peace one with another'' (eirēneuete en allēlois — be at peace among yourselves). The chapter that began with a dispute about greatness ends with a call to peace. Salt and peace together: distinctive character without destructive competition.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 9;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 transfigured
  ('μεταμορφόω', 'metamorphoō', 'G3339', 'To transfigure, transform, change in form — from meta (change, after) + morphē (form, essential shape). The English ''metamorphosis'' derives directly from this word. In Mark 9:2, the transformation reveals Jesus'' hidden divine glory — not a change in nature but an unveiling of what was always there. The same word appears in Romans 12:2 (''be ye transformed by the renewing of your mind'') and 2 Corinthians 3:18 (''changed into the same image from glory to glory''). What happened to Jesus in a moment on the mountain happens to believers progressively through the Spirit.', 1),
  -- v.7 beloved Son
  ('ἀγαπητός', 'agapētos', 'G27', 'Beloved, dearly loved, only dear one — from agapaō (to love with deliberate, chosen love). Used of Jesus at his baptism (1:11) and here at the Transfiguration. The word echoes Genesis 22:2 LXX where God tells Abraham to sacrifice his ''beloved'' (agapēton) son Isaac. The Father''s declaration identifies Jesus as both the unique divine Son and the sacrifice prefigured by Isaac — the beloved who will be offered up.', 2),
  -- v.19 faithless
  ('ἄπιστος', 'apistos', 'G571', 'Faithless, unbelieving, without faith — from a (not) + pistis (faith). Jesus'' exclamation ''O faithless generation'' (genea apistos) addresses not just the father or the disciples but the entire generation characterised by insufficient faith. The word connotes not atheism but an inability to trust God''s power in concrete situations. The contrast between the transfigured glory above and the faithless failure below is Mark''s central irony.', 3),
  -- v.24 unbelief
  ('ἀπιστία', 'apistia', 'G570', 'Unbelief, lack of faith, distrust — the noun form of apistos. The father''s cry ''help thou mine unbelief'' (boēthei mou tē apistia) treats unbelief not as a permanent condition but as a weakness that can be remedied by divine help. Faith and unbelief coexist in the same person. The father does not try to manufacture faith by willpower; he asks Jesus to overcome his doubt. This is one of the most theologically profound prayers in Scripture: it acknowledges human weakness while appealing to divine strength.', 4),
  -- v.29 prayer
  ('προσευχή', 'proseuchē', 'G4335', 'Prayer, entreaty directed to God — from pros (toward) + euchomai (to wish, pray). Jesus diagnoses the disciples'' failure as a prayer deficit. Their authority over demons (6:7) had not changed, but their dependence on God through prayer had apparently waned. Prayer is not a technique but a relationship — continuous communion with God that sustains spiritual power. Without prayer, delegated authority becomes empty formalism.', 5),
  -- v.35 servant
  ('διάκονος', 'diakonos', 'G1249', 'Servant, minister, attendant — originally one who serves tables; from dia (through) + konis (dust), suggesting one who raises dust by hurrying to serve. Jesus redefines greatness as diakonos — voluntary service to others. This is not forced servitude (doulos, slave) but chosen ministry. The word later became a church office (deacon, Romans 16:1; 1 Timothy 3:8-13). Jesus'' definition: the greatest person in God''s kingdom is the one who serves the most people, especially the least important.', 6),
  -- v.42 offend/stumble
  ('σκανδαλίζω', 'skandalizō', 'G4624', 'To cause to stumble, to trip up, to entrap — from skandalon (the trigger-stick of a trap). Originally a hunting term: the skandalon was the bait-stick that, when touched, sprung the trap. In moral usage, it means to cause someone to sin or to fall away from faith. Jesus warns that causing a ''little one'' to stumble carries a penalty worse than drowning. The word reveals sin''s social dimension: faith can be destroyed by the actions of others, and God holds the destroyer accountable.', 7),
  -- v.43 Gehenna
  ('γέεννα', 'geenna', 'G1067', 'Gehenna, hell, the place of final punishment — from Hebrew ge-hinnom (Valley of Hinnom), a ravine south of Jerusalem where children were sacrificed to Molech (2 Kings 23:10; Jeremiah 7:31). Josiah defiled the valley, and it became the city garbage dump — perpetually burning. By Jesus'' time, Gehenna was the standard Jewish term for the place of final judgment. Jesus uses the term eleven times in the Synoptics, making him the primary biblical teacher on hell. The unquenchable fire and undying worm (Isaiah 66:24) indicate judgment that is both severe and permanent.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 9
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 7
    WHEN 3 THEN 19
    WHEN 4 THEN 24
    WHEN 5 THEN 29
    WHEN 6 THEN 35
    WHEN 7 THEN 42
    WHEN 8 THEN 43
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 kingdom come with power
  (1, '2 Peter 1:16-18', 1),
  (1, 'Matthew 16:28', 2),
  -- v.2 transfiguration
  (2, 'Matthew 17:1-2', 3),
  (2, 'Luke 9:28-29', 4),
  (2, 'Exodus 24:15-16', 5),
  -- v.3 shining white
  (3, 'Daniel 7:9', 6),
  (3, 'Revelation 1:14', 7),
  -- v.4 Moses and Elijah
  (4, 'Luke 9:30-31', 8),
  (4, 'Malachi 4:5-6', 9),
  -- v.7 beloved Son hear him
  (7, 'Mark 1:11', 10),
  (7, 'Deuteronomy 18:15', 11),
  (7, 'Psalm 2:7', 12),
  (7, 'Isaiah 42:1', 13),
  -- v.11 Elijah must first come
  (11, 'Malachi 4:5-6', 14),
  (11, 'Matthew 17:10-13', 15),
  -- v.13 Elijah already came
  (13, 'Mark 6:17-29', 16),
  (13, 'Luke 1:17', 17),
  -- v.19 faithless generation
  (19, 'Numbers 14:11', 18),
  (19, 'Deuteronomy 32:20', 19),
  -- v.23 all things possible
  (23, 'Mark 10:27', 20),
  (23, 'Mark 11:23-24', 21),
  -- v.24 help mine unbelief
  (24, 'Luke 17:5', 22),
  -- v.27 Jesus raised him
  (27, 'Mark 5:41-42', 23),
  -- v.29 prayer and fasting
  (29, 'Matthew 17:21', 24),
  (29, 'Ephesians 6:18', 25),
  -- v.31 second passion prediction
  (31, 'Mark 8:31', 26),
  (31, 'Mark 10:33-34', 27),
  -- v.35 first shall be last
  (35, 'Mark 10:43-44', 28),
  (35, 'Matthew 20:26-27', 29),
  (35, 'Matthew 23:11', 30),
  -- v.37 receive a child
  (37, 'Matthew 18:5', 31),
  (37, 'Matthew 25:40', 32),
  -- v.40 not against us
  (40, 'Matthew 12:30', 33),
  (40, 'Luke 9:50', 34),
  -- v.42 millstone
  (42, 'Matthew 18:6', 35),
  (42, 'Luke 17:1-2', 36),
  -- v.43 hand offend
  (43, 'Matthew 5:29-30', 37),
  (43, 'Matthew 18:8-9', 38),
  (43, 'Colossians 3:5', 39),
  -- v.44 worm dieth not
  (44, 'Isaiah 66:24', 40),
  -- v.49 salted with fire
  (49, 'Leviticus 2:13', 41),
  (49, '1 Peter 1:6-7', 42),
  -- v.50 salt lost saltness
  (50, 'Matthew 5:13', 43),
  (50, 'Luke 14:34-35', 44),
  (50, 'Colossians 4:6', 45)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 9
  AND v.verse_number = cr.verse_number;
