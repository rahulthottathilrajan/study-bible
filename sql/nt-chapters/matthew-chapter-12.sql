-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 12 — Lord of the Sabbath, the Unpardonable Sin, and the Sign of Jonah
-- 50 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 12,
  'Matthew 12 marks a decisive turning point in Jesus'' Galilean ministry as opposition from the Pharisees escalates from criticism to conspiracy. The chapter opens with two Sabbath controversies — plucking grain and healing a withered hand — in which Jesus asserts His authority as Lord of the Sabbath and demonstrates that mercy takes precedence over ritual. After the Pharisees plot to destroy Him, Matthew presents Jesus as the fulfilment of Isaiah''s Servant Song (Isa 42:1-4): gentle, justice-bearing, hope of the Gentiles. The conflict reaches its climax when the Pharisees attribute Jesus'' Spirit-empowered exorcisms to Beelzebub, prompting His gravest warning: the blasphemy against the Holy Spirit is the one unforgivable sin. Jesus then refuses the demand for a sign, pointing only to the sign of Jonah — His death and resurrection. The chapter closes with a redefinition of spiritual kinship: Jesus'' true family are those who do the Father''s will.',
  'Lord of the Sabbath, the Unpardonable Sin, and the Sign of Jonah',
  'βλασφημία (blasphēmia)',
  'Blasphemy, slander against the divine — from blaptō (to injure) + phēmē (speech, reputation). In Matthew 12:31-32, Jesus identifies blasphemy against the Holy Spirit as the one sin that cannot be forgiven, because it involves the deliberate, informed attribution of the Spirit''s unmistakable work to Satan — a hardening of heart beyond the reach of repentance.',
  '["Section 1 (vv.1-8): Sabbath Controversy I — Plucking Grain and the Lord of the Sabbath","Section 2 (vv.9-14): Sabbath Controversy II — Healing the Withered Hand and the Pharisees'' Plot","Section 3 (vv.15-21): Jesus as Isaiah''s Servant — Gentle, Just, Hope of the Gentiles","Section 4 (vv.22-30): The Beelzebub Accusation and the Divided Kingdom","Section 5 (vv.31-37): The Unpardonable Sin and the Power of Words","Section 6 (vv.38-42): The Sign of Jonah — Greater than Jonah and Solomon","Section 7 (vv.43-45): The Parable of the Returning Unclean Spirit","Section 8 (vv.46-50): Jesus'' True Family — Those Who Do the Father''s Will"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 50 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'At that time Jesus went on the sabbath day through the corn; and his disciples were an hungred, and began to pluck the ears of corn, and to eat.',
   'Ἐν ἐκείνῳ τῷ καιρῷ ἐπορεύθη ὁ Ἰησοῦς τοῖς σάββασιν διὰ τῶν σπορίμων οἱ δὲ μαθηταὶ αὐτοῦ ἐπείνασαν καὶ ἤρξαντο τίλλειν στάχυας καὶ ἐσθίειν',
   'En ekeinō tō kairō eporeuthē ho Iēsous tois sabbasin dia tōn sporimōn hoi de mathētai autou epeinasan kai ērxanto tillein stachyas kai esthiein',
   '''The corn'' (tōn sporimōn — grain fields, sown fields). Plucking ears of grain while passing through a field was explicitly permitted by Deuteronomy 23:25. The issue was not theft but the Pharisaic classification of plucking as ''reaping'' — one of the 39 categories of work forbidden on the Sabbath (Mishnah, Shabbat 7:2). The Pharisees had built a ''fence around the Torah'' that turned acts of mercy and necessity into violations.',
   NULL),
  (2,
   'But when the Pharisees saw it, they said unto him, Behold, thy disciples do that which is not lawful to do upon the sabbath day.',
   'οἱ δὲ Φαρισαῖοι ἰδόντες εἶπαν αὐτῷ ἰδοὺ οἱ μαθηταί σου ποιοῦσιν ὃ οὐκ ἔξεστιν ποιεῖν ἐν σαββάτῳ',
   'hoi de Pharisaioi idontes eipan autō idou hoi mathētai sou poiousin ho ouk exestin poiein en sabbatō',
   '''Not lawful'' (ouk exestin — not permitted) — the Pharisees invoked their oral law traditions, not the written Torah, which permitted plucking (Deut 23:25). Their accusation reveals a legalism that prioritised rule-keeping over human need. Jesus will counter with three arguments: scriptural precedent (David), priestly exception (temple service), and prophetic principle (mercy over sacrifice).',
   NULL),
  (3,
   'But he said unto them, Have ye not read what David did, when he was an hungred, and they that were with him;',
   'ὁ δὲ εἶπεν αὐτοῖς οὐκ ἀνέγνωτε τί ἐποίησεν Δαυὶδ ὅτε ἐπείνασεν καὶ οἱ μετ᾽ αὐτοῦ',
   'ho de eipen autois ouk anegnōte ti epoiēsen Dauid hote epeinasen kai hoi met autou',
   '''Have ye not read'' (ouk anegnōte) — a pointed rebuke to those who prided themselves on their knowledge of Scripture (cf. Matt 19:4; 21:16,42; 22:31). Jesus appeals to 1 Samuel 21:1-6, where David and his men ate the consecrated showbread — bread reserved exclusively for priests (Lev 24:5-9). The argument is from lesser to greater: if David could set aside ceremonial law in genuine need, how much more can the Lord of David?',
   NULL),
  (4,
   'How he entered into the house of God, and did eat the shewbread, which was not lawful for him to eat, neither for them which were with him, but only for the priests?',
   'πῶς εἰσῆλθεν εἰς τὸν οἶκον τοῦ θεοῦ καὶ τοὺς ἄρτους τῆς προθέσεως ἔφαγεν ὃ οὐκ ἐξὸν ἦν αὐτῷ φαγεῖν οὐδὲ τοῖς μετ᾽ αὐτοῦ εἰ μὴ τοῖς ἱερεῦσιν μόνοις',
   'pōs eisēlthen eis ton oikon tou theou kai tous artous tēs protheseōs ephagen ho ouk exon ēn autō phagein oude tois met autou ei mē tois hiereusin monois',
   '''Shewbread'' (artous tēs protheseōs — bread of the presence, bread set before God) — twelve loaves placed on the golden table in the tabernacle each Sabbath (Lev 24:5-9). Only priests could eat it when it was replaced. Yet Ahimelech the priest gave it to David (1 Sam 21:6), recognising that human need could take precedence over ceremonial regulation. Jesus'' argument implies: the Pharisees condemn the disciples for far less than what David did — and David was not condemned.',
   NULL),
  (5,
   'Or have ye not read in the law, how that on the sabbath days the priests in the temple profane the sabbath, and are blameless?',
   'ἢ οὐκ ἀνέγνωτε ἐν τῷ νόμῳ ὅτι τοῖς σάββασιν οἱ ἱερεῖς ἐν τῷ ἱερῷ τὸ σάββατον βεβηλοῦσιν καὶ ἀναίτιοί εἰσιν',
   'ē ouk anegnōte en tō nomō hoti tois sabbasin hoi hiereis en tō hierō to sabbaton bebēlousin kai anaitioi eisin',
   'A second argument: the priests ''profane the sabbath'' (bebēlousin — desecrate, treat as common) by performing sacrificial work on the Sabbath (Num 28:9-10), yet they are ''blameless'' (anaitioi — without guilt). This proves that the Sabbath law was never absolute but always yielded to higher obligations. If temple service overrides Sabbath rest, then service to ''something greater than the temple'' (v.6) certainly does.',
   NULL),
  (6,
   'But I say unto you, That in this place is one greater than the temple.',
   'λέγω δὲ ὑμῖν ὅτι τοῦ ἱεροῦ μεῖζόν ἐστιν ὧδε',
   'legō de hymin hoti tou hierou meizon estin hōde',
   'An extraordinary claim. ''Greater than the temple'' (tou hierou meizon) — the neuter form (meizon, ''something greater'') may refer to the kingdom of God that Jesus inaugurates, or to Jesus Himself as the true temple in whom God dwells bodily (John 2:19-21; Col 2:9). Either way, if the temple — the holiest place on earth, God''s dwelling — can override the Sabbath, then the One who is greater than the temple has absolute authority over it. The Pharisees would have heard this as blasphemous.',
   'Jesus implicitly identifies Himself as the new and greater temple — the place where God and humanity meet. The physical temple pointed forward to Christ; in Him the reality has come, and the shadow must yield. This is a foundational Christological claim.'),
  (7,
   'But if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless.',
   'εἰ δὲ ἐγνώκειτε τί ἐστιν ἔλεος θέλω καὶ οὐ θυσίαν οὐκ ἂν κατεδικάσατε τοὺς ἀναιτίους',
   'ei de egnōkeite ti estin eleos thelō kai ou thysian ouk an katedikasate tous anaitious',
   'Jesus quotes Hosea 6:6 for the second time (first in Matt 9:13): ''I desire mercy (eleos) and not sacrifice (thysian).'' The ''guiltless'' (anaitious) are the disciples. The Pharisees'' error is not insufficient law-keeping but insufficient understanding of God''s character. God has always valued compassion over ritual. If they truly knew the heart of God revealed in Hosea, they would not condemn innocent men for satisfying hunger on the Sabbath.',
   NULL),
  (8,
   'For the Son of man is Lord even of the sabbath day.',
   'κύριος γάρ ἐστιν τοῦ σαββάτου ὁ υἱὸς τοῦ ἀνθρώπου',
   'kyrios gar estin tou sabbatou ho huios tou anthrōpou',
   'The climactic claim of the section. ''Lord of the Sabbath'' (kyrios tou sabbatou) — since God instituted the Sabbath (Gen 2:2-3; Exod 20:8-11), only God can be its Lord. By claiming this title, Jesus claims divine authority over the most sacred institution in Jewish life. ''Son of man'' — Jesus'' favourite self-designation from Daniel 7:13, combining humanity with divine authority. He who made the Sabbath has the right to interpret, regulate, and even set it aside.',
   'Jesus'' lordship over the Sabbath is not an abolition of the fourth commandment but an assertion of authority over its proper interpretation. The Sabbath was made for man, not man for the Sabbath (Mark 2:27). In Christ, the Sabbath finds its fulfilment as rest in Him (Heb 4:9-10).'),
  (9,
   'And when he was departed thence, he went into their synagogue:',
   'καὶ μεταβὰς ἐκεῖθεν ἦλθεν εἰς τὴν συναγωγὴν αὐτῶν',
   'kai metabas ekeithen ēlthen eis tēn synagōgēn autōn',
   '''Their synagogue'' (tēn synagōgēn autōn) — the possessive pronoun ''their'' may reflect the growing distance between Jesus and the Jewish religious establishment. Luke 6:6 identifies this as a different Sabbath occasion, while Mark 3:1-6 provides a parallel account. Jesus deliberately enters the synagogue — He does not avoid confrontation but meets it on holy ground.',
   NULL),
  (10,
   'And, behold, there was a man which had his hand withered. And they asked him, saying, Is it lawful to heal on the sabbath days? that they might accuse him.',
   'καὶ ἰδοὺ ἄνθρωπος χεῖρα ἔχων ξηράν καὶ ἐπηρώτησαν αὐτὸν λέγοντες εἰ ἔξεστιν τοῖς σάββασιν θεραπεύειν ἵνα κατηγορήσωσιν αὐτοῦ',
   'kai idou anthrōpos cheira echōn xēran kai epērōtēsan auton legontes ei exestin tois sabbasin therapeuein hina katēgorēsōsin autou',
   '''Withered'' (xēran — dried up, shrivelled) — the hand was paralysed and atrophied. The Pharisees'' question is not seeking knowledge but setting a trap: ''that they might accuse him'' (hina katēgorēsōsin — a legal term for bringing charges in court). Rabbinic law permitted Sabbath healing only if life was in danger (Mishnah, Yoma 8:6). A withered hand was not life-threatening, so they expected Jesus to either refuse (undermining His compassion) or heal (giving them grounds for accusation).',
   NULL),
  (11,
   'And he said unto them, What man shall there be among you, that shall have one sheep, and if it fall into a pit on the sabbath day, will he not lay hold on it, and lift it out?',
   'ὁ δὲ εἶπεν αὐτοῖς τίς ἔσται ἐξ ὑμῶν ἄνθρωπος ὃς ἕξει πρόβατον ἕν καὶ ἐὰν ἐμπέσῃ τοῦτο τοῖς σάββασιν εἰς βόθυνον οὐχὶ κρατήσει αὐτὸ καὶ ἐγερεῖ',
   'ho de eipen autois tis estai ex hymōn anthrōpos hos hexei probaton hen kai ean empesē touto tois sabbasin eis bothynon ouchi kratēsei auto kai egerei',
   'Jesus uses a qal wahomer (lesser-to-greater) argument, a standard rabbinic method. Even the stricter Shammai school permitted rescuing an animal on the Sabbath (though the Essenes at Qumran forbade it, CD 11:13-14). The argument is unanswerable: if you would rescue a sheep for economic reasons, how much more should you rescue a person made in God''s image? ''One sheep'' — emphasising that even a single animal of modest value warrants Sabbath intervention.',
   NULL),
  (12,
   'How much then is a man better than a sheep? Wherefore it is lawful to do well on the sabbath days.',
   'πόσῳ οὖν διαφέρει ἄνθρωπος προβάτου ὥστε ἔξεστιν τοῖς σάββασιν καλῶς ποιεῖν',
   'posō oun diapherei anthrōpos probatou hōste exestin tois sabbasin kalōs poiein',
   '''How much more'' (posō diapherei — by how much does a man surpass) — Jesus affirms the unique value of human beings over animals, rooted in the imago Dei (Gen 1:26-27). ''It is lawful to do good on the sabbath'' (exestin kalōs poiein) — Jesus establishes a positive principle: the Sabbath is not merely about prohibitions but about doing good. This reframes the entire Sabbath theology from restriction to liberation.',
   NULL),
  (13,
   'Then saith he to the man, Stretch forth thine hand. And he stretched it forth; and it was restored whole, like as the other.',
   'τότε λέγει τῷ ἀνθρώπῳ ἔκτεινόν σου τὴν χεῖρα καὶ ἐξέτεινεν καὶ ἀπεκατεστάθη ὑγιὴς ὡς ἡ ἄλλη',
   'tote legei tō anthrōpō ekteinon sou tēn cheira kai exeteinen kai apekatestathē hygiēs hōs hē allē',
   'Jesus heals by a word alone — no touch, no physical action that could be classified as ''work.'' He commands and the man obeys: ''stretch forth'' (ekteinon — aorist imperative, a decisive act). ''Restored whole'' (apekatestathē — was restored to its former state, completely healed). The healing is instantaneous and complete. Jesus has demonstrated His principle: doing good on the Sabbath is not only permitted but divinely mandated.',
   NULL),
  (14,
   'Then the Pharisees went out, and held a council against him, how they might destroy him.',
   'ἐξελθόντες δὲ οἱ Φαρισαῖοι συμβούλιον ἔλαβον κατ᾽ αὐτοῦ ὅπως αὐτὸν ἀπολέσωσιν',
   'exelthontes de hoi Pharisaioi symboulion elabon kat autou hopōs auton apolesōsin',
   '''Held a council'' (symboulion elabon — took counsel together, formed a conspiracy). Mark 3:6 adds that they consulted with the Herodians — an unlikely political alliance showing the depth of their hatred. ''Destroy him'' (apolesōsin — to kill, to put to death) — the Sabbath controversies have moved from theological debate to murderous intent. Ironically, those who accused Jesus of breaking the Sabbath now plot murder — a far graver violation of God''s law.',
   NULL),
  (15,
   'But when Jesus knew it, he withdrew himself from thence: and great multitudes followed him, and he healed them all;',
   'ὁ δὲ Ἰησοῦς γνοὺς ἀνεχώρησεν ἐκεῖθεν καὶ ἠκολούθησαν αὐτῷ ὄχλοι πολλοί καὶ ἐθεράπευσεν αὐτοὺς πάντας',
   'ho de Iēsous gnous anechōrēsen ekeithen kai ēkolouthēsan autō ochloi polloi kai etherapeusen autous pantas',
   '''Knew it'' (gnous — having perceived, having known supernaturally). Jesus withdraws not from fear but from strategic timing — His hour has not yet come (cf. John 7:6,30; 8:20). ''Healed them all'' (etherapeusen autous pantas) — in contrast to the Pharisees'' narrow legalism that would refuse healing, Jesus heals without restriction. His withdrawal is not retreat but continued ministry outside the hostile environment.',
   NULL),
  (16,
   'And charged them that they should not make him known:',
   'καὶ ἐπετίμησεν αὐτοῖς ἵνα μὴ φανερὸν αὐτὸν ποιήσωσιν',
   'kai epetimēsen autois hina mē phaneron auton poiēsōsin',
   '''Charged them'' (epetimēsen — sternly warned, rebuked) — the ''messianic secret'' motif prominent in Mark''s Gospel. Jesus suppresses public acclaim not because He is unsure of His identity but because popular messianic enthusiasm would provoke premature political confrontation with Rome and misrepresent His spiritual mission. Matthew sees this reticence as fulfilment of Isaiah''s prophecy of the gentle Servant (vv.17-21).',
   NULL),
  (17,
   'That it might be fulfilled which was spoken by Esaias the prophet, saying,',
   'ἵνα πληρωθῇ τὸ ῥηθὲν διὰ Ἠσαΐου τοῦ προφήτου λέγοντος',
   'hina plērōthē to rhēthen dia Ēsaiou tou prophētou legontos',
   'Matthew introduces the longest Old Testament quotation in his Gospel — Isaiah 42:1-4, the first Servant Song. This is Matthew''s eighth fulfilment formula (''that it might be fulfilled''). By connecting Jesus'' quiet withdrawal with Isaiah''s Servant, Matthew transforms apparent weakness into prophetic fulfilment: Jesus'' gentleness is not timidity but divinely ordained character.',
   NULL),
  (18,
   'Behold my servant, whom I have chosen; my beloved, in whom my soul is well pleased: I will put my spirit upon him, and he shall shew judgment to the Gentiles.',
   'ἰδοὺ ὁ παῖς μου ὃν ᾑρέτισα ὁ ἀγαπητός μου εἰς ὃν εὐδόκησεν ἡ ψυχή μου θήσω τὸ πνεῦμά μου ἐπ᾽ αὐτόν καὶ κρίσιν τοῖς ἔθνεσιν ἀπαγγελεῖ',
   'idou ho pais mou hon hēretisa ho agapētos mou eis hon eudokēsen hē psychē mou thēsō to pneuma mou ep auton kai krisin tois ethnesin apangelei',
   'Isaiah 42:1 quoted from a text closer to the Hebrew than the LXX. ''My servant'' (ho pais mou — servant or child) and ''my beloved'' (ho agapētos mou) echo the Father''s words at Jesus'' baptism (Matt 3:17). ''I will put my spirit upon him'' — fulfilled at the baptism when the Spirit descended like a dove. ''Judgment to the Gentiles'' (krisin tois ethnesin) — not condemnation but justice, right order, true religion. The Servant''s mission extends beyond Israel to all nations.',
   'The Servant Songs of Isaiah (42:1-4; 49:1-6; 50:4-9; 52:13-53:12) progressively reveal the Messiah as one who suffers to bring justice. Jesus fulfils this pattern: rejected by Israel''s leaders, He extends salvation to the Gentiles — a theme Matthew will develop throughout his Gospel.'),
  (19,
   'He shall not strive, nor cry; neither shall any man hear his voice in the streets.',
   'οὐκ ἐρίσει οὐδὲ κραυγάσει οὐδὲ ἀκούσει τις ἐν ταῖς πλατείαις τὴν φωνὴν αὐτοῦ',
   'ouk erisei oude kraugasei oude akousei tis en tais plateiais tēn phōnēn autou',
   '''Not strive'' (ouk erisei — will not quarrel, wrangle, or engage in hostile debate). ''Nor cry'' (oude kraugasei — will not shout, raise a clamour). The Servant''s method is not political agitation, military force, or demagoguery. He does not raise His voice in the streets like a rabble-rouser. This perfectly describes Jesus'' withdrawal from confrontation with the Pharisees — His power is quiet, His authority does not need noise to be effective.',
   NULL),
  (20,
   'A bruised reed shall he not break, and smoking flax shall he not quench, till he send forth judgment unto victory.',
   'κάλαμον συντετριμμένον οὐ κατεάξει καὶ λίνον τυφόμενον οὐ σβέσει ἕως ἂν ἐκβάλῃ εἰς νῖκος τὴν κρίσιν',
   'kalamon syntetrimmenon ou kateaxei kai linon typhomenon ou sbesei heōs an ekbalē eis nikos tēn krisin',
   'Two images of exquisite tenderness. A ''bruised reed'' (kalamon syntetrimmenon) — a reed already cracked, useless, normally discarded. ''Smoking flax'' (linon typhomenon) — a lamp wick barely smouldering, about to go out. Both represent the weak, broken, nearly extinguished — and the Servant will not finish them off but restore them. ''Till he send forth judgment unto victory'' (heōs an ekbalē eis nikos tēn krisin) — Matthew substitutes ''victory'' (nikos) for Isaiah''s ''truth,'' emphasising that God''s justice will ultimately triumph, but through gentleness, not violence.',
   'Christ''s gentleness toward the weak is not temporary forbearance but essential character. He came not to crush sinners but to heal them, not to extinguish fading faith but to fan it into flame. This is the pattern for all Christian ministry: strength expressed through tenderness.'),
  (21,
   'And in his name shall the Gentiles trust.',
   'καὶ τῷ ὀνόματι αὐτοῦ ἔθνη ἐλπιοῦσιν',
   'kai tō onomati autou ethnē elpiousin',
   '''In his name shall the Gentiles trust'' (ethnē elpiousin — the nations will hope). This concluding line of the Servant Song is programmatic for Matthew''s Gospel: the Messiah rejected by Israel''s leaders becomes the hope of the nations (cf. Matt 28:19). ''Trust'' (elpiousin — will hope, will place their confidence in) — the Hebrew of Isaiah 42:4 reads ''the coastlands will wait for his law.'' Matthew''s rendering emphasises personal trust in the Messiah''s name.',
   NULL),
  (22,
   'Then was brought unto him one possessed with a devil, blind, and dumb: and he healed him, insomuch that the blind and dumb both spake and saw.',
   'τότε προσηνέχθη αὐτῷ δαιμονιζόμενος τυφλὸς καὶ κωφός καὶ ἐθεράπευσεν αὐτόν ὥστε τὸν κωφὸν λαλεῖν καὶ βλέπειν',
   'tote prosēnechthē autō daimonizomenos typhlos kai kōphos kai etherapeusen auton hōste ton kōphon lalein kai blepein',
   'A triple affliction — demonic possession, blindness, and muteness — and a triple healing. This exorcism-healing becomes the catalyst for the most serious confrontation in Jesus'' ministry. The healing is complete and instantaneous: the man speaks and sees. The crowd''s response (v.23) and the Pharisees'' counter-response (v.24) will force a decisive moment in Jesus'' ministry.',
   NULL),
  (23,
   'And all the people were amazed, and said, Is not this the son of David?',
   'καὶ ἐξίσταντο πάντες οἱ ὄχλοι καὶ ἔλεγον μήτι οὗτός ἐστιν ὁ υἱὸς Δαυίδ',
   'kai existanto pantes hoi ochloi kai elegon mēti houtos estin ho huios Dauid',
   '''Were amazed'' (existanto — were astounded, literally ''stood outside themselves''). ''Son of David'' (ho huios Dauid) — the primary messianic title in Jewish expectation, rooted in 2 Samuel 7:12-16 and Isaiah 11:1-5. The crowd''s question (introduced with mēti, expecting a negative answer: ''This can''t be the Son of David, can it?'') shows they are drawn toward a messianic conclusion but hesitate to commit fully. The Pharisees'' response in v.24 is designed to shut down this dangerous line of thinking.',
   NULL),
  (24,
   'But when the Pharisees heard it, they said, This fellow doth not cast out devils, but by Beelzebub the prince of the devils.',
   'οἱ δὲ Φαρισαῖοι ἀκούσαντες εἶπον οὗτος οὐκ ἐκβάλλει τὰ δαιμόνια εἰ μὴ ἐν τῷ Βεελζεβοὺλ ἄρχοντι τῶν δαιμονίων',
   'hoi de Pharisaioi akousantes eipon houtos ouk ekballei ta daimonia ei mē en tō Beelzeboul archonti tōn daimoniōn',
   '''Beelzebub'' (Beelzeboul) — probably from Ba''al Zebul (''lord of the dwelling/high place'') or the contemptuous Ba''al Zebub (''lord of the flies,'' 2 Kings 1:2-3). The Pharisees cannot deny the miracle — they witnessed it — so they attribute it to demonic power. This is the most dangerous possible response to Jesus'' ministry: acknowledging His supernatural power but attributing it to Satan rather than to the Holy Spirit. This sets up the warning about the unpardonable sin (vv.31-32).',
   NULL),
  (25,
   'And Jesus knew their thoughts, and said unto them, Every kingdom divided against itself is brought to desolation; and every city or house divided against itself shall not stand:',
   'εἰδὼς δὲ τὰς ἐνθυμήσεις αὐτῶν εἶπεν αὐτοῖς πᾶσα βασιλεία μερισθεῖσα καθ᾽ ἑαυτῆς ἐρημοῦται καὶ πᾶσα πόλις ἢ οἰκία μερισθεῖσα καθ᾽ ἑαυτῆς οὐ σταθήσεται',
   'eidōs de tas enthymēseis autōn eipen autois pasa basileia meristheisa kath heautēs erēmoutai kai pasa polis ē oikia meristheisa kath heautēs ou stathēsetai',
   '''Knew their thoughts'' (eidōs tas enthymēseis — perceiving their inner deliberations) — supernatural knowledge, a sign of deity (cf. 1 Chr 28:9; Jer 17:10). Jesus counters with a logical argument: ''every kingdom divided against itself is brought to desolation'' (erēmoutai — made desolate, laid waste). If Satan were casting out his own agents, his kingdom would be in civil war and self-destructing. The argument is irrefutable: a divided kingdom cannot stand.',
   NULL),
  (26,
   'And if Satan cast out Satan, he is divided against himself; how shall then his kingdom stand?',
   'καὶ εἰ ὁ σατανᾶς τὸν σατανᾶν ἐκβάλλει ἐφ᾽ ἑαυτὸν ἐμερίσθη πῶς οὖν σταθήσεται ἡ βασιλεία αὐτοῦ',
   'kai ei ho satanas ton satanan ekballei eph heauton emeristhē pōs oun stathēsetai hē basileia autou',
   'Jesus applies the general principle specifically to Satan. Note that Jesus acknowledges the reality of Satan''s kingdom (hē basileia autou — his kingdom) — an organised realm of evil opposed to the kingdom of God. But it is a kingdom with a strategic intelligence that would not undermine itself. The Pharisees'' theory is self-contradictory.',
   NULL),
  (27,
   'And if I by Beelzebub cast out devils, by whom do your children cast them out? therefore they shall be your judges.',
   'καὶ εἰ ἐγὼ ἐν Βεελζεβοὺλ ἐκβάλλω τὰ δαιμόνια οἱ υἱοὶ ὑμῶν ἐν τίνι ἐκβάλλουσιν διὰ τοῦτο αὐτοὶ κριταὶ ἔσονται ὑμῶν',
   'kai ei egō en Beelzeboul ekballō ta daimonia hoi huioi hymōn en tini ekballousin dia touto autoi kritai esontai hymōn',
   '''Your children'' (hoi huioi hymōn — your sons, your disciples) — Jewish exorcists existed (Acts 19:13-14; Josephus, Antiquities 8.2.5). If the Pharisees'' own followers cast out demons, by what power do they do it? If they claim divine power for their own exorcists but demonic power for Jesus, they are inconsistent. ''They shall be your judges'' — the Pharisees'' own exorcists will condemn their double standard.',
   NULL),
  (28,
   'But if I cast out devils by the Spirit of God, then the kingdom of God is come unto you.',
   'εἰ δὲ ἐν πνεύματι θεοῦ ἐγὼ ἐκβάλλω τὰ δαιμόνια ἄρα ἔφθασεν ἐφ᾽ ὑμᾶς ἡ βασιλεία τοῦ θεοῦ',
   'ei de en pneumati theou egō ekballō ta daimonia ara ephthasen eph hymas hē basileia tou theou',
   'The theological climax of the argument. ''By the Spirit of God'' (en pneumati theou) — Matthew has ''Spirit of God'' where Luke 11:20 has ''finger of God.'' Both mean the same: divine power. ''Is come unto you'' (ephthasen eph hymas — has arrived upon you, has reached you). The aorist tense indicates the kingdom has actually arrived — it is not merely near but present. Jesus'' exorcisms are evidence that God''s kingly reign is actively breaking into history, defeating Satan''s domain.',
   'This verse is a key text for inaugurated eschatology — the kingdom of God is not only future but has already broken into the present through Jesus'' ministry. His exorcisms are not mere miracles but signs that the eschatological battle between God and Satan has begun, and God is winning.'),
  (29,
   'Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.',
   'ἢ πῶς δύναταί τις εἰσελθεῖν εἰς τὴν οἰκίαν τοῦ ἰσχυροῦ καὶ τὰ σκεύη αὐτοῦ ἁρπάσαι ἐὰν μὴ πρῶτον δήσῃ τὸν ἰσχυρόν καὶ τότε τὴν οἰκίαν αὐτοῦ διαρπάσει',
   'ē pōs dynatai tis eiselthein eis tēn oikian tou ischyrou kai ta skeuē autou harpasai ean mē prōton dēsē ton ischyron kai tote tēn oikian autou diarpasei',
   'The parable of the strong man. Satan is the ''strong man'' (tou ischyrou); his ''house'' is the world under his dominion; his ''goods'' (skeuē — vessels, possessions) are the people he holds captive. Jesus is the one who binds (dēsē — ties up, renders powerless) the strong man and plunders (diarpasei — thoroughly plunders) his house. Every exorcism is an act of cosmic war — Jesus is raiding Satan''s territory and liberating captives. Isaiah 49:24-25 provides the background: ''Shall the prey be taken from the mighty?'' Yes — by one mightier still.',
   NULL),
  (30,
   'He that is not with me is against me; and he that gathereth not with me scattereth abroad.',
   'ὁ μὴ ὢν μετ᾽ ἐμοῦ κατ᾽ ἐμοῦ ἐστιν καὶ ὁ μὴ συνάγων μετ᾽ ἐμοῦ σκορπίζει',
   'ho mē ōn met emou kat emou estin kai ho mē synagōn met emou skorpizei',
   'An absolute demand for allegiance. There is no neutrality toward Jesus — those who are not actively with Him are against Him. ''Gathereth'' (synagōn — gathering together, collecting) versus ''scattereth'' (skorpizei — disperses, scatters like a flock without a shepherd). The agricultural/pastoral imagery: Jesus is the shepherd gathering His flock; those who do not help gather are effectively scattering. Note: this does not contradict Mark 9:40 (''He that is not against us is for us''), which addresses a different situation — tolerance of sympathetic outsiders versus the present demand for decision.',
   NULL),
  (31,
   'Wherefore I say unto you, All manner of sin and blasphemy shall be forgiven unto men: but the blasphemy against the Holy Ghost shall not be forgiven unto men.',
   'διὰ τοῦτο λέγω ὑμῖν πᾶσα ἁμαρτία καὶ βλασφημία ἀφεθήσεται τοῖς ἀνθρώποις ἡ δὲ τοῦ πνεύματος βλασφημία οὐκ ἀφεθήσεται',
   'dia touto legō hymin pasa hamartia kai blasphēmia aphethēsetai tois anthrōpois hē de tou pneumatos blasphēmia ouk aphethēsetai',
   'The most solemn warning in the Gospels. ''All manner of sin and blasphemy'' (pasa hamartia kai blasphēmia) — even the most heinous sins — shall be forgiven. But blasphemy against the Holy Spirit is the one exception. In context, this is not a casual insult or moment of doubt but the deliberate, informed, persistent attribution of the Holy Spirit''s unmistakable work to Satan. The Pharisees witnessed clear evidence of divine power and consciously called it demonic. This represents a hardening of heart that renders repentance impossible — not because God refuses forgiveness, but because the person has permanently closed themselves to the only means of conviction and repentance.',
   'The unpardonable sin is not a single thoughtless word but a settled disposition of heart that calls good evil and evil good (Isa 5:20). Those who fear they have committed it almost certainly have not — the very fear demonstrates a conscience still sensitive to the Spirit. The sin consists precisely in a callousness that feels no such concern.'),
  (32,
   'And whosoever speaketh a word against the Son of man, it shall be forgiven him: but whosoever speaketh against the Holy Ghost, it shall not be forgiven him, neither in this world, neither in the world to come.',
   'καὶ ὃς ἐὰν εἴπῃ λόγον κατὰ τοῦ υἱοῦ τοῦ ἀνθρώπου ἀφεθήσεται αὐτῷ ὃς δ᾽ ἂν εἴπῃ κατὰ τοῦ πνεύματος τοῦ ἁγίου οὐκ ἀφεθήσεται αὐτῷ οὔτε ἐν τούτῳ τῷ αἰῶνι οὔτε ἐν τῷ μέλλοντι',
   'kai hos ean eipē logon kata tou huiou tou anthrōpou aphethēsetai autō hos d an eipē kata tou pneumatos tou hagiou ouk aphethēsetai autō oute en toutō tō aiōni oute en tō mellonti',
   'A remarkable distinction: speaking against the Son of man is forgivable — Jesus in His humanity could be mistaken for a mere man, and rejection based on ignorance can be forgiven (cf. 1 Tim 1:13; Acts 3:17). But speaking against the Holy Spirit — who provides the inner testimony and conviction that Jesus'' works are divine — is unforgivable because it rejects the very agent of repentance. ''Neither in this world, neither in the world to come'' (oute en toutō tō aiōni oute en tō mellonti) — this is absolute and eternal, covering both the present age and the age to come.',
   NULL),
  (33,
   'Either make the tree good, and his fruit good; or else make the tree corrupt, and his fruit corrupt: for the tree is known by his fruit.',
   'ἢ ποιήσατε τὸ δένδρον καλὸν καὶ τὸν καρπὸν αὐτοῦ καλόν ἢ ποιήσατε τὸ δένδρον σαπρὸν καὶ τὸν καρπὸν αὐτοῦ σαπρόν ἐκ γὰρ τοῦ καρποῦ τὸ δένδρον γινώσκεται',
   'ē poiēsate to dendron kalon kai ton karpon autou kalon ē poiēsate to dendron sapron kai ton karpon autou sapron ek gar tou karpou to dendron ginōsketai',
   'Jesus demands consistency: judge the tree by its fruit. If Jesus'' works (healing, liberation, mercy) are good fruit, then the tree (Jesus Himself) must be good. The Pharisees'' position is self-contradictory: they acknowledge the good fruit (healing) but call the tree evil (satanic). ''Make'' (poiēsate — an imperative: ''decide!'') — Jesus forces them to choose a consistent position. This echoes the Sermon on the Mount (Matt 7:16-20).',
   NULL),
  (34,
   'O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.',
   'γεννήματα ἐχιδνῶν πῶς δύνασθε ἀγαθὰ λαλεῖν πονηροὶ ὄντες ἐκ γὰρ τοῦ περισσεύματος τῆς καρδίας τὸ στόμα λαλεῖ',
   'gennēmata echidnōn pōs dynasthe agatha lalein ponēroi ontes ek gar tou perisseumatos tēs kardias to stoma lalei',
   '''Generation of vipers'' (gennēmata echidnōn — offspring of snakes) — the same epithet John the Baptist used (Matt 3:7). ''Out of the abundance of the heart the mouth speaketh'' (ek tou perisseumatos tēs kardias to stoma lalei) — a fundamental anthropological principle. Speech reveals character because it overflows (perisseumatos — surplus, overflow) from the heart''s content. The Pharisees'' blasphemous words expose their inner corruption. They cannot speak good because they are evil at the core.',
   NULL),
  (35,
   'A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.',
   'ὁ ἀγαθὸς ἄνθρωπος ἐκ τοῦ ἀγαθοῦ θησαυροῦ ἐκβάλλει ἀγαθά καὶ ὁ πονηρὸς ἄνθρωπος ἐκ τοῦ πονηροῦ θησαυροῦ ἐκβάλλει πονηρά',
   'ho agathos anthrōpos ek tou agathou thēsaurou ekballei agatha kai ho ponēros anthrōpos ek tou ponērou thēsaurou ekballei ponēra',
   '''Treasure'' (thēsaurou — storehouse, treasury) — the heart is a storehouse from which a person ''brings forth'' (ekballei — literally ''casts out,'' the same word used for casting out demons). Words and actions are drawn from the heart''s stored content. This reinforces Jesus'' teaching that external behaviour flows from internal character. Moral transformation must begin with the heart — external conformity without inner change is hypocrisy.',
   NULL),
  (36,
   'But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.',
   'λέγω δὲ ὑμῖν ὅτι πᾶν ῥῆμα ἀργὸν ὃ λαλήσουσιν οἱ ἄνθρωποι ἀποδώσουσιν περὶ αὐτοῦ λόγον ἐν ἡμέρᾳ κρίσεως',
   'legō de hymin hoti pan rhēma argon ho lalēsousin hoi anthrōpoi apodōsousin peri autou logon en hēmera kriseōs',
   '''Every idle word'' (pan rhēma argon — every careless, useless, unproductive word). ''Idle'' (argon — from a-ergon, without work, fruitless) means words spoken without thought, without purpose, without accountability. If even careless words come under divine scrutiny, how much more deliberate blasphemy against the Holy Spirit? ''Give account'' (apodōsousin logon — will render a reckoning, will give a word back for every word spoken). This is a sobering doctrine of verbal accountability before God.',
   NULL),
  (37,
   'For by thy words thou shalt be justified, and by thy words thou shalt be condemned.',
   'ἐκ γὰρ τῶν λόγων σου δικαιωθήσῃ καὶ ἐκ τῶν λόγων σου καταδικασθήσῃ',
   'ek gar tōn logōn sou dikaiōthēsē kai ek tōn logōn sou katadikasthēsē',
   '''Justified'' (dikaiōthēsē — declared righteous, acquitted) and ''condemned'' (katadikasthēsē — found guilty, sentenced). Words are not neutral — they are evidence in the divine courtroom. This does not teach justification by works but that words reveal the heart''s true state. A person''s habitual speech patterns disclose whether they are truly righteous or merely pretending. James will echo this: ''If any man offend not in word, the same is a perfect man'' (James 3:2).',
   NULL),
  (38,
   'Then certain of the scribes and of the Pharisees answered, saying, Master, we would see a sign from thee.',
   'τότε ἀπεκρίθησαν αὐτῷ τινες τῶν γραμματέων καὶ Φαρισαίων λέγοντες διδάσκαλε θέλομεν ἀπὸ σοῦ σημεῖον ἰδεῖν',
   'tote apekrithēsan autō tines tōn grammateōn kai Pharisaiōn legontes didaskale thelomen apo sou sēmeion idein',
   'After witnessing an undeniable miracle (v.22), the Pharisees demand a ''sign'' (sēmeion — a miraculous attestation, a heaven-sent proof). This is not a sincere request but a deflection: they have already attributed His miracles to Satan, so no sign would satisfy them. ''Master'' (didaskale — teacher) — a respectful address that masks their hostility. John 12:37 summarises: ''Though he had done so many miracles before them, yet they believed not on him.''',
   NULL),
  (39,
   'But he answered and said unto them, An evil and adulterous generation seeketh after a sign; and there shall no sign be given to it, but the sign of the prophet Jonas:',
   'ὁ δὲ ἀποκριθεὶς εἶπεν αὐτοῖς γενεὰ πονηρὰ καὶ μοιχαλὶς σημεῖον ἐπιζητεῖ καὶ σημεῖον οὐ δοθήσεται αὐτῇ εἰ μὴ τὸ σημεῖον Ἰωνᾶ τοῦ προφήτου',
   'ho de apokritheis eipen autois genea ponēra kai moichalis sēmeion epizētei kai sēmeion ou dothēsetai autē ei mē to sēmeion Iōna tou prophētou',
   '''Evil and adulterous'' (ponēra kai moichalis) — spiritual adultery, the Old Testament metaphor for covenant unfaithfulness (Hos 1-3; Jer 3:6-9; Ezek 16). Israel was ''married'' to Yahweh; seeking other sources of validation is spiritual infidelity. ''The sign of Jonas'' — the only sign Jesus will give is His own death and resurrection, typified by Jonah''s three days in the great fish. This is the ultimate sign because it validates all others.',
   NULL),
  (40,
   'For as Jonas was three days and three nights in the whale''s belly; so shall the Son of man be three days and three nights in the heart of the earth.',
   'ὥσπερ γὰρ ἦν Ἰωνᾶς ἐν τῇ κοιλίᾳ τοῦ κήτους τρεῖς ἡμέρας καὶ τρεῖς νύκτας οὕτως ἔσται ὁ υἱὸς τοῦ ἀνθρώπου ἐν τῇ καρδίᾳ τῆς γῆς τρεῖς ἡμέρας καὶ τρεῖς νύκτας',
   'hōsper gar ēn Iōnas en tē koilia tou kētous treis hēmeras kai treis nyktas houtōs estai ho huios tou anthrōpou en tē kardia tēs gēs treis hēmeras kai treis nyktas',
   '''Three days and three nights'' — by Jewish inclusive reckoning, any part of a day counted as a day. Jesus was buried Friday afternoon (day 1), lay in the tomb all Saturday (day 2), and rose Sunday morning (day 3). ''Whale'' (kētous — sea monster, great fish) — the LXX term for the creature in Jonah 1:17. ''Heart of the earth'' (kardia tēs gēs) — the grave, Sheol. As Jonah''s time in the fish was a death-and-resurrection experience that authenticated his preaching to Nineveh, so Jesus'' literal death and resurrection will be the ultimate vindication of His claims.',
   'The sign of Jonah is the gospel in miniature: death, burial, and resurrection. Jesus points to His resurrection as the definitive proof of His identity. All other signs are subordinate to this one — which is why Paul writes, ''If Christ be not risen, then is our preaching vain'' (1 Cor 15:14).'),
  (41,
   'The men of Nineveh shall rise in judgment with this generation, and shall condemn it: because they repented at the preaching of Jonas; and, behold, a greater than Jonas is here.',
   'ἄνδρες Νινευῖται ἀναστήσονται ἐν τῇ κρίσει μετὰ τῆς γενεᾶς ταύτης καὶ κατακρινοῦσιν αὐτήν ὅτι μετενόησαν εἰς τὸ κήρυγμα Ἰωνᾶ καὶ ἰδοὺ πλεῖον Ἰωνᾶ ὧδε',
   'andres Nineuïtai anastēsontai en tē krisei meta tēs geneas tautēs kai katakrinousin autēn hoti metenōēsan eis to kērygma Iōna kai idou pleion Iōna hōde',
   'The pagan Ninevites repented at the preaching of a reluctant, imperfect prophet — and Israel refuses to repent before the perfect Prophet, the Son of God Himself. ''A greater than Jonah'' (pleion Iōna — something greater than Jonah, neuter) — Jesus is not merely a better prophet but something qualitatively different. ''Shall rise in judgment'' (anastēsontai en tē krisei) — at the final resurrection, the Ninevites will stand as witnesses against ''this generation,'' condemning their unbelief by contrast.',
   NULL),
  (42,
   'The queen of the south shall rise up in the judgment with this generation, and shall condemn it: for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here.',
   'βασίλισσα νότου ἐγερθήσεται ἐν τῇ κρίσει μετὰ τῆς γενεᾶς ταύτης καὶ κατακρινεῖ αὐτήν ὅτι ἦλθεν ἐκ τῶν περάτων τῆς γῆς ἀκοῦσαι τὴν σοφίαν Σολομῶνος καὶ ἰδοὺ πλεῖον Σολομῶνος ὧδε',
   'basilissa notou egerthēsetai en tē krisei meta tēs geneas tautēs kai katakrinei autēn hoti ēlthen ek tōn peratōn tēs gēs akousai tēn sophian Solomōnos kai idou pleion Solomōnos hōde',
   'The Queen of Sheba (1 Kings 10:1-13) — a Gentile woman — travelled from the ''uttermost parts of the earth'' (ek tōn peratōn tēs gēs — from the ends of the earth, probably southern Arabia or Ethiopia) to hear Solomon''s wisdom. She sought wisdom at great cost; the Pharisees have Wisdom incarnate standing before them and reject Him. ''A greater than Solomon'' (pleion Solomōnos) — again the neuter ''something greater,'' pointing to the qualitative superiority of Christ over the wisest king of Israel.',
   NULL),
  (43,
   'When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.',
   'ὅταν δὲ τὸ ἀκάθαρτον πνεῦμα ἐξέλθῃ ἀπὸ τοῦ ἀνθρώπου διέρχεται δι᾽ ἀνύδρων τόπων ζητοῦν ἀνάπαυσιν καὶ οὐχ εὑρίσκει',
   'hotan de to akatharton pneuma exelthē apo tou anthrōpou dierchetai di anydrōn topōn zētoun anapausin kai ouch heuriskei',
   '''Dry places'' (anydrōn topōn — waterless regions, desert) — in Jewish demonology, demons were associated with desolate, uninhabited places (Isa 13:21; 34:14; Bar 4:35; Tobit 8:3). ''Seeking rest'' (zētoun anapausin — looking for a resting place) — the demon is restless without a human host. This parable is not primarily about individual exorcism but about the spiritual condition of ''this generation'' (v.45): Israel has experienced a measure of reformation through John''s preaching, but without filling the vacuum with genuine faith, the result will be worse than before.',
   NULL),
  (44,
   'Then he saith, I will return into my house from whence I came out; and when he is come, he findeth it empty, swept, and garnished.',
   'τότε λέγει εἰς τὸν οἶκόν μου ἐπιστρέψω ὅθεν ἐξῆλθον καὶ ἐλθὸν εὑρίσκει σχολάζοντα σεσαρωμένον καὶ κεκοσμημένον',
   'tote legei eis ton oikon mou epistrepsō hothen exēlthon kai elthon heuriskei scholazonta sesarōmenon kai kekosmēmenon',
   '''Empty, swept, and garnished'' (scholazonta sesarōmenon kai kekosmēmenon — vacant, cleaned out, decorated). The house is morally reformed but spiritually unoccupied — reformation without regeneration, external tidiness without the indwelling Holy Spirit. The demon finds a prepared dwelling: ''my house'' (ton oikon mou) — it considers the person its rightful possession. The fatal error is not the cleaning but the emptiness: the absence of positive spiritual content leaves the person vulnerable to worse occupation.',
   NULL),
  (45,
   'Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.',
   'τότε πορεύεται καὶ παραλαμβάνει μεθ᾽ ἑαυτοῦ ἑπτὰ ἕτερα πνεύματα πονηρότερα ἑαυτοῦ καὶ εἰσελθόντα κατοικεῖ ἐκεῖ καὶ γίνεται τὰ ἔσχατα τοῦ ἀνθρώπου ἐκείνου χείρονα τῶν πρώτων οὕτως ἔσται καὶ τῇ γενεᾷ ταύτῃ τῇ πονηρᾷ',
   'tote poreuetai kai paralambanei meth heautou hepta hetera pneumata ponērotera heautou kai eiselthonta katoikei ekei kai ginetai ta eschata tou anthrōpou ekeinou cheirona tōn prōtōn houtōs estai kai tē genea tautē tē ponēra',
   '''Seven'' — the number of completeness, indicating total and complete possession. ''More wicked'' (ponērotera — more evil) — the subsequent condition is not merely as bad as before but exponentially worse. ''The last state... worse than the first'' — this is Jesus'' verdict on ''this wicked generation'': Israel''s partial reformation through John''s preaching, without genuine embrace of the Messiah, will lead to catastrophic judgment — fulfilled in the destruction of Jerusalem in AD 70. The application extends to all who experience religious reform without true conversion.',
   'Moral reformation without spiritual regeneration is dangerous. Sweeping the house clean without filling it with the Holy Spirit creates a vacuum that evil eagerly fills. The lesson: religion without Christ, morality without grace, and reformation without regeneration leave a person worse off than before.'),
  (46,
   'While he yet talked to the people, behold, his mother and his brethren stood without, desiring to speak with him.',
   'ἔτι αὐτοῦ λαλοῦντος τοῖς ὄχλοις ἰδοὺ ἡ μήτηρ καὶ οἱ ἀδελφοὶ αὐτοῦ εἱστήκεισαν ἔξω ζητοῦντες αὐτῷ λαλῆσαι',
   'eti autou lalountos tois ochlois idou hē mētēr kai hoi adelphoi autou heistēkeisan exō zētountes autō lalēsai',
   '''His mother and his brethren'' (hē mētēr kai hoi adelphoi) — Mary and Jesus'' half-brothers (James, Joseph, Simon, Judas — Matt 13:55). Mark 3:21 reveals the family came because they thought Jesus was ''beside himself'' (out of His mind). ''Stood without'' (heistēkeisan exō — were standing outside) — physically outside the crowded house, but also symbolically outside the circle of faith. James and the brothers did not believe until after the resurrection (John 7:5; 1 Cor 15:7).',
   NULL),
  (47,
   'Then one said unto him, Behold, thy mother and thy brethren stand without, desiring to speak with thee.',
   'εἶπεν δέ τις αὐτῷ ἰδοὺ ἡ μήτηρ σου καὶ οἱ ἀδελφοί σου ἔξω ἑστήκασιν ζητοῦντές σοι λαλῆσαι',
   'eipen de tis autō idou hē mētēr sou kai hoi adelphoi sou exō hestēkasin zētountes soi lalēsai',
   'The announcement creates a choice: will Jesus interrupt His teaching to attend to family obligations? In Jewish culture, honouring parents was paramount (Exod 20:12). The crowd would have expected Jesus to go immediately. Instead, He uses the moment to teach about a higher kinship — spiritual family that transcends biological ties.',
   NULL),
  (48,
   'But he answered and said unto him that told him, Who is my mother? and who are my brethren?',
   'ὁ δὲ ἀποκριθεὶς εἶπεν τῷ λέγοντι αὐτῷ τίς ἐστιν ἡ μήτηρ μου καὶ τίνες εἰσὶν οἱ ἀδελφοί μου',
   'ho de apokritheis eipen tō legonti autō tis estin hē mētēr mou kai tines eisin hoi adelphoi mou',
   'A shocking rhetorical question. Jesus does not dishonour His mother (He will commend her care to John at the cross, John 19:26-27) but establishes a principle: spiritual kinship supersedes biological kinship. ''Who is my mother?'' — this question redefines family in terms of obedience to God rather than blood ties. It is a direct application of the principle He stated in Matthew 10:37: ''He that loveth father or mother more than me is not worthy of me.''',
   NULL),
  (49,
   'And he stretched forth his hand toward his disciples, and said, Behold my mother and my brethren!',
   'καὶ ἐκτείνας τὴν χεῖρα αὐτοῦ ἐπὶ τοὺς μαθητὰς αὐτοῦ εἶπεν ἰδοὺ ἡ μήτηρ μου καὶ οἱ ἀδελφοί μου',
   'kai ekteinas tēn cheira autou epi tous mathētas autou eipen idou hē mētēr mou kai hoi adelphoi mou',
   '''Stretched forth his hand'' (ekteinas tēn cheira) — a dramatic gesture, physically pointing to His disciples. ''Behold'' (idou — look!) — a solemn declaration. Jesus identifies His true family not by bloodline but by discipleship. This is a radical redefinition of kinship in a culture where family loyalty was the highest social value. The disciples — fishermen, tax collectors, ordinary people who left everything to follow Him — are elevated to the status of Jesus'' own family.',
   NULL),
  (50,
   'For whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother.',
   'ὅστις γὰρ ἂν ποιήσῃ τὸ θέλημα τοῦ πατρός μου τοῦ ἐν οὐρανοῖς αὐτός μου ἀδελφὸς καὶ ἀδελφὴ καὶ μήτηρ ἐστίν',
   'hostis gar an poiēsē to thelēma tou patros mou tou en ouranois autos mou adelphos kai adelphē kai mētēr estin',
   'The defining principle: ''Whosoever shall do the will of my Father'' — the criterion for belonging to Jesus'' family is not ethnicity, lineage, or even physical proximity to Jesus, but obedience to the Father. ''Brother, and sister, and mother'' — Jesus includes women (''sister'' and ''mother'') in the family of faith, a significant statement in a patriarchal culture. This verse establishes the church as the new family of God, united by faith and obedience rather than blood. It is the charter of the community of disciples.',
   'The family of God is constituted not by birth but by new birth, not by blood but by obedience. This principle undergirds the entire ecclesiology of the New Testament: believers are brothers and sisters in Christ (Rom 8:29; Heb 2:11-12), and the church is the household of God (Eph 2:19; 1 Tim 3:15).')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 12;

-- Step 3: Word Studies for key verses

-- Verse 6 (Greater than the temple)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἱεροῦ', 'hierou', 'G2411', 'Temple — the entire temple complex including courts, porticoes, and sanctuary. The temple was the centre of Jewish worship, the place of God''s presence on earth. Jesus'' claim to be greater than it is a claim of supreme divine authority.', 1),
  ('μεῖζόν', 'meizon', 'G3187', 'Greater — neuter comparative of megas. The neuter form (''something greater'') rather than masculine (''someone greater'') may point to the kingdom of God that Jesus inaugurates, though Christ Himself is the personal embodiment of that kingdom.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = 6;

-- Verse 8 (Lord of the Sabbath)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κύριος', 'kyrios', 'G2962', 'Lord, master, sovereign — the supreme title of authority. Applied to the Sabbath, it means Jesus has the right to interpret, regulate, and even supersede Sabbath regulations. Since only God could be Lord of His own institution, this is an implicit claim to deity.', 1),
  ('σαββάτου', 'sabbatou', 'G4521', 'Sabbath — from Hebrew shabbath, meaning ''cessation, rest.'' The weekly day of rest instituted at creation (Gen 2:2-3) and enshrined in the Decalogue (Exod 20:8-11). The most sacred institution in Jewish religious life.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = 8;

-- Verse 28 (Kingdom of God has come)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πνεύματι', 'pneumati', 'G4151', 'Spirit — here ''the Spirit of God,'' the Holy Spirit. Jesus'' exorcisms are performed by the power of the Holy Spirit, not by demonic power. This is the very point the Pharisees deny in their blasphemy.', 1),
  ('ἔφθασεν', 'ephthasen', 'G5348', 'Has come upon, has arrived, has reached — aorist indicative of phthanō. This is not ''is near'' but ''has arrived.'' The kingdom of God is not merely approaching but has actually broken into the present through Jesus'' Spirit-empowered ministry.', 2),
  ('βασιλεία', 'basileia', 'G932', 'Kingdom, reign, royal dominion — the dynamic reign of God, His active sovereign rule. In Jesus'' exorcisms, God''s kingly authority invades Satan''s territory and sets captives free. The kingdom is both present reality and future consummation.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = 28;

-- Verse 31 (Blasphemy against the Holy Spirit)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('βλασφημία', 'blasphēmia', 'G988', 'Blasphemy, slander, defamation of the divine — from blaptō (to injure) + phēmē (speech). It means to speak against God''s honour, to vilify what is sacred. Against the Holy Spirit, it means attributing the Spirit''s work to Satan.', 1),
  ('ἀφεθήσεται', 'aphethēsetai', 'G863', 'Shall be forgiven — future passive of aphiēmi (to send away, release, pardon). The passive indicates divine action: God forgives. Every sin can be forgiven except the deliberate, persistent rejection of the Spirit''s testimony about Christ.', 2),
  ('πνεύματος', 'pneumatos', 'G4151', 'Of the Spirit — genitive of pneuma. The Holy Spirit is the agent of conviction, repentance, and faith. To blaspheme Him is to reject the only means by which forgiveness comes — making forgiveness functionally impossible.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = 31;

-- Verse 40 (Sign of Jonah)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κήτους', 'kētous', 'G2785', 'Great fish, sea monster — the LXX term for the creature that swallowed Jonah (Jonah 1:17). Not necessarily a whale in the modern sense but a large marine creature prepared by God for this purpose.', 1),
  ('καρδίᾳ', 'kardia', 'G2588', 'Heart, centre, depths — here ''the heart of the earth'' means the grave, the realm of the dead, Sheol. As Jonah was in the depths of the sea, so Jesus will be in the depths of the earth.', 2),
  ('σημεῖον', 'sēmeion', 'G4592', 'Sign, miracle serving as evidence, miraculous proof — not merely a wonder but a sign pointing to something beyond itself. The sign of Jonah points to the resurrection, the ultimate authentication of Jesus'' identity and mission.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = 40;

-- Verse 50 (True family)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θέλημα', 'thelēma', 'G2307', 'Will, desire, purpose — the expressed will of God the Father. Doing God''s will is the defining mark of Jesus'' true family. It encompasses faith, obedience, and discipleship as a comprehensive way of life.', 1),
  ('ἀδελφός', 'adelphos', 'G80', 'Brother — from a (same) + delphys (womb), literally ''from the same womb.'' Jesus redefines this biological term as a spiritual category: those born of the same Father through faith are brothers and sisters in the deepest sense.', 2),
  ('ἀδελφή', 'adelphē', 'G79', 'Sister — the feminine counterpart of adelphos. Jesus'' explicit inclusion of women in His spiritual family was remarkable in a patriarchal culture, affirming the equal standing of women in the community of faith.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = 50;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Sabbath through grain fields
  (1, 'Mark 2:23-24', 1), (1, 'Luke 6:1-2', 2), (1, 'Deuteronomy 23:25', 3),
  -- v2: Not lawful on Sabbath
  (2, 'Exodus 20:10', 1), (2, 'John 5:10', 2),
  -- v3: David and the showbread
  (3, '1 Samuel 21:1-6', 1), (3, 'Mark 2:25-26', 2),
  -- v4: Showbread for priests
  (4, 'Leviticus 24:5-9', 1), (4, '1 Samuel 21:6', 2),
  -- v5: Priests profane the Sabbath
  (5, 'Numbers 28:9-10', 1), (5, 'John 7:22-23', 2),
  -- v6: Greater than the temple
  (6, 'John 2:19-21', 1), (6, 'Colossians 2:9', 2), (6, 'Hebrews 3:3', 3),
  -- v7: Mercy not sacrifice
  (7, 'Hosea 6:6', 1), (7, 'Matthew 9:13', 2), (7, 'Micah 6:6-8', 3), (7, '1 Samuel 15:22', 4),
  -- v8: Lord of the Sabbath
  (8, 'Mark 2:28', 1), (8, 'Luke 6:5', 2), (8, 'Daniel 7:13-14', 3), (8, 'Genesis 2:2-3', 4),
  -- v9: Went into synagogue
  (9, 'Mark 3:1', 1), (9, 'Luke 6:6', 2),
  -- v10: Man with withered hand
  (10, 'Mark 3:1-2', 1), (10, 'Luke 6:6-7', 2), (10, 'Luke 14:3', 3),
  -- v11: Sheep in a pit
  (11, 'Luke 14:5', 1), (11, 'Luke 13:15', 2),
  -- v12: Man better than a sheep
  (12, 'Matthew 6:26', 1), (12, 'Matthew 10:31', 2),
  -- v13: Hand restored
  (13, 'Mark 3:5', 1), (13, 'Luke 6:10', 2),
  -- v14: Pharisees plot to destroy
  (14, 'Mark 3:6', 1), (14, 'John 5:18', 2), (14, 'John 11:53', 3),
  -- v15: Jesus withdraws
  (15, 'Matthew 10:23', 1), (15, 'John 7:1', 2),
  -- v16: Messianic secret
  (16, 'Matthew 8:4', 1), (16, 'Mark 1:44', 2), (16, 'Mark 3:12', 3),
  -- v17: Isaiah fulfilled
  (17, 'Isaiah 42:1-4', 1), (17, 'Matthew 1:22', 2),
  -- v18: My servant, chosen
  (18, 'Isaiah 42:1', 1), (18, 'Matthew 3:17', 2), (18, 'Matthew 17:5', 3), (18, 'Luke 4:18', 4),
  -- v19: Not strive nor cry
  (19, 'Isaiah 42:2', 1), (19, '2 Timothy 2:24', 2),
  -- v20: Bruised reed
  (20, 'Isaiah 42:3', 1), (20, 'Isaiah 61:1-3', 2), (20, 'Psalm 147:3', 3),
  -- v21: Gentiles trust
  (21, 'Isaiah 42:4', 1), (21, 'Matthew 28:19', 2), (21, 'Romans 15:12', 3),
  -- v22: Blind and dumb healed
  (22, 'Matthew 9:32-33', 1), (22, 'Luke 11:14', 2),
  -- v23: Is this the Son of David?
  (23, 'Matthew 9:27', 1), (23, 'Matthew 21:9', 2), (23, '2 Samuel 7:12-16', 3),
  -- v24: Beelzebub accusation
  (24, 'Matthew 9:34', 1), (24, 'Mark 3:22', 2), (24, 'Luke 11:15', 3),
  -- v25: Kingdom divided
  (25, 'Mark 3:23-26', 1), (25, 'Luke 11:17-18', 2),
  -- v26: Satan against Satan
  (26, 'Mark 3:23', 1), (26, 'Luke 11:18', 2),
  -- v27: Your sons cast them out
  (27, 'Luke 11:19', 1), (27, 'Acts 19:13-14', 2),
  -- v28: Kingdom of God come unto you
  (28, 'Luke 11:20', 1), (28, 'Daniel 2:44', 2), (28, 'Mark 1:15', 3),
  -- v29: Binding the strong man
  (29, 'Isaiah 49:24-25', 1), (29, 'Mark 3:27', 2), (29, 'Luke 11:21-22', 3), (29, 'Colossians 2:15', 4),
  -- v30: Not with me is against me
  (30, 'Mark 9:40', 1), (30, 'Luke 11:23', 2),
  -- v31: Blasphemy against the Spirit
  (31, 'Mark 3:28-29', 1), (31, 'Luke 12:10', 2), (31, 'Hebrews 6:4-6', 3), (31, '1 John 5:16', 4),
  -- v32: Word against Son of man forgivable
  (32, '1 Timothy 1:13', 1), (32, 'Acts 3:17', 2), (32, 'Luke 23:34', 3),
  -- v33: Tree known by fruit
  (33, 'Matthew 7:16-20', 1), (33, 'Luke 6:43-44', 2),
  -- v34: Generation of vipers
  (34, 'Matthew 3:7', 1), (34, 'Matthew 23:33', 2), (34, 'Luke 6:45', 3),
  -- v35: Good and evil treasure
  (35, 'Luke 6:45', 1), (35, 'Proverbs 10:11', 2),
  -- v36: Idle words judged
  (36, 'Ecclesiastes 12:14', 1), (36, 'Romans 14:12', 2), (36, '2 Corinthians 5:10', 3),
  -- v37: Justified or condemned by words
  (37, 'James 3:2', 1), (37, 'Proverbs 18:21', 2),
  -- v38: Show us a sign
  (38, 'Matthew 16:1', 1), (38, 'John 2:18', 2), (38, '1 Corinthians 1:22', 3),
  -- v39: Sign of Jonah
  (39, 'Matthew 16:4', 1), (39, 'Luke 11:29', 2), (39, 'Hosea 1:2', 3),
  -- v40: Three days and nights
  (40, 'Jonah 1:17', 1), (40, '1 Corinthians 15:4', 2), (40, 'Matthew 16:21', 3), (40, 'Matthew 27:63', 4),
  -- v41: Nineveh repented
  (41, 'Jonah 3:5-10', 1), (41, 'Luke 11:32', 2),
  -- v42: Queen of the south
  (42, '1 Kings 10:1-13', 1), (42, 'Luke 11:31', 2), (42, '2 Chronicles 9:1-12', 3),
  -- v43: Unclean spirit in dry places
  (43, 'Luke 11:24', 1), (43, 'Isaiah 34:14', 2), (43, '1 Peter 5:8', 3),
  -- v44: Empty, swept, garnished
  (44, 'Luke 11:25', 1), (44, '2 Peter 2:20', 2),
  -- v45: Seven spirits worse
  (45, 'Luke 11:26', 1), (45, 'Hebrews 6:4-8', 2), (45, '2 Peter 2:20-22', 3),
  -- v46: Mother and brothers outside
  (46, 'Mark 3:31', 1), (46, 'Luke 8:19', 2), (46, 'Matthew 13:55', 3),
  -- v47: Told about family
  (47, 'Mark 3:32', 1), (47, 'Luke 8:20', 2),
  -- v48: Who is my mother?
  (48, 'Mark 3:33', 1), (48, 'Luke 8:21', 2),
  -- v49: Behold my family
  (49, 'Mark 3:34', 1), (49, 'John 15:14-15', 2),
  -- v50: Whoever does Father's will
  (50, 'Mark 3:35', 1), (50, 'John 7:17', 2), (50, 'Romans 8:29', 3), (50, 'Hebrews 2:11-12', 4), (50, 'Ephesians 2:19', 5)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 12 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- Matthew Chapter 12 Complete!
-- 50 verses · 7 key verses with word studies (22 words)
-- Cross-references for 50 verses (143 refs)
-- ═══════════════════════════════════════════════════════
