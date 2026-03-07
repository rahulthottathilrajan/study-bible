-- ═══════════════════════════════════════════════════
-- MARK CHAPTER 10 — Marriage, Children, Riches, and the Road to Jerusalem
-- 52 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 10,
  'Mark 10 is the final chapter of the discipleship section (8:22-10:52), and it brings the journey to Jerusalem to its climax with teaching on four crucial subjects: marriage, children, wealth, and servanthood. The chapter opens in Judea beyond Jordan, where Pharisees test Jesus on divorce (vv.1-12). Jesus reaches past the Mosaic concession to God''s creation intent: ''from the beginning of the creation God made them male and female'' and ''what therefore God hath joined together, let not man put asunder'' (vv.6-9). People bring children to Jesus, and when the disciples rebuke them, Jesus is ''much displeased'' — his strongest recorded emotional reaction toward the disciples — declaring ''of such is the kingdom of God'' and ''whosoever shall not receive the kingdom of God as a little child, he shall not enter therein'' (vv.13-16). A rich young ruler runs to Jesus asking, ''Good Master, what shall I do that I may inherit eternal life?'' Jesus loves him but tells him to sell all and follow (vv.17-22). The man goes away grieved, ''for he had great possessions.'' Jesus'' pronouncement shocks the disciples: ''How hardly shall they that have riches enter into the kingdom of God! It is easier for a camel to go through the eye of a needle'' (vv.23-25). ''With men it is impossible, but not with God: for with God all things are possible'' (v.27). The third and most detailed passion prediction follows (vv.32-34): Jesus specifies mocking, scourging, spitting, and killing — followed by resurrection. Immediately James and John request the chief seats in his glory (vv.35-40), provoking the other ten disciples'' indignation. Jesus responds with the supreme statement on servant leadership: ''whosoever will be great among you, shall be your minister... the Son of man came not to be ministered unto, but to minister, and to give his life a ransom for many'' (vv.43-45). The chapter — and the entire discipleship section — closes with blind Bartimaeus crying out, ''Jesus, thou Son of David, have mercy on me'' (vv.46-52). Unlike the blind man of 8:22-26 who received sight in two stages, Bartimaeus sees immediately and ''followed Jesus in the way'' — the way to Jerusalem, the way of the cross.',
  'The Cost of the Kingdom — Self-Surrender in Marriage, Possessions, Ambition, and Service',
  'λύτρον (lytron)',
  'Ransom, the price of release — from lyō (to loose, set free). A lytron was the price paid to liberate a prisoner of war, a slave, or a condemned person. Jesus declares that the Son of man came ''to give his life a ransom for many'' (v.45) — the only explicit ransom saying in Mark, and one of the clearest statements of substitutionary atonement in the Gospels. His life is the price; ''many'' are the beneficiaries; freedom from sin and death is the result.',
  '["Marriage as God Designed It (vv.1-12): Pharisees test Jesus on divorce. He points past Moses'' concession to creation''s intent — God made them male and female and joined them as one flesh. What God joined together let not man put asunder. In the house he teaches the disciples that remarriage after divorce constitutes adultery","Receiving the Kingdom Like a Child (vv.13-16): People bring children to Jesus. The disciples rebuke them. Jesus is much displeased and declares the kingdom belongs to such as these. Whoever does not receive the kingdom as a little child shall not enter it. He takes the children in his arms and blesses them","The Rich Young Ruler and the Camel''s Eye (vv.17-31): A rich man asks about eternal life. Jesus tells him to sell all and follow. He goes away grieved. Jesus teaches how hard it is for the rich to enter the kingdom — easier for a camel through a needle''s eye. With God all things are possible. Those who have left all will receive a hundredfold with persecutions and eternal life","The Third Passion Prediction and the Request of James and John (vv.32-45): Jesus predicts his suffering in Jerusalem with specific detail. James and John request seats at his right and left in glory. Jesus asks if they can drink his cup and be baptised with his baptism. The other ten are indignant. Jesus teaches servant leadership — the Son of man came to minister and give his life a ransom for many","Blind Bartimaeus Receives Sight (vv.46-52): At Jericho blind Bartimaeus cries out Son of David have mercy on me. Despite the crowd''s rebuke he cries louder. Jesus calls him and asks What wilt thou that I should do unto thee. He receives his sight immediately and follows Jesus in the way to Jerusalem"]'
FROM books b WHERE b.name = 'Mark';

-- Step 2: Insert all 52 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And he arose from thence, and cometh into the coasts of Judaea by the farther side of Jordan: and the people resort unto him again; and, as he was wont, he taught them again.',
   'καὶ ἐκεῖθεν ἀναστὰς ἔρχεται εἰς τὰ ὅρια τῆς Ἰουδαίας διὰ τοῦ πέραν τοῦ Ἰορδάνου καὶ συμπορεύονται πάλιν ὄχλοι πρὸς αὐτόν καὶ ὡς εἰώθει πάλιν ἐδίδασκεν αὐτούς',
   'kai ekeithen anastas erchetai eis ta horia tēs Ioudaias dia tou peran tou Iordanou kai symporeuontai palin ochloi pros auton kai hōs eiōthei palin edidasken autous',
   'Jesus leaves Galilee for the last time, heading south toward Jerusalem via Perea (''beyond Jordan''). ''As he was wont'' (hōs eiōthei — as was his custom) — teaching is Jesus'' default activity. The journey to the cross does not interrupt the ministry; it intensifies it.',
   NULL),
  (2, 'And the Pharisees came to him, and asked him, Is it lawful for a man to put away his wife? tempting him.',
   'καὶ προσελθόντες οἱ Φαρισαῖοι ἐπηρώτων αὐτὸν εἰ ἔξεστιν ἀνδρὶ γυναῖκα ἀπολῦσαι πειράζοντες αὐτόν',
   'kai proselthontes hoi Pharisaioi epērōtōn auton ei exestin andri gynaika apolysai peirazontes auton',
   '''Put away'' (apolysai — to release, divorce). ''Tempting'' (peirazontes — testing; the same word as Satan''s temptation). The question is a trap: Jesus is now in Herod Antipas'' territory, and Herod had imprisoned John the Baptist for criticising his divorce and remarriage (6:17-18). Any answer could be politically dangerous.',
   NULL),
  (3, 'And he answered and said unto them, What did Moses command you?',
   'ὁ δὲ ἀποκριθεὶς εἶπεν αὐτοῖς τί ὑμῖν ἐνετείλατο Μωϋσῆς',
   'ho de apokritheis eipen autois ti hymin eneteilato Mōysēs',
   'Jesus turns the question back to them, asking what Moses commanded. He forces the Pharisees to state the Mosaic position themselves, setting up his distinction between Moses'' concession (v.4) and God''s creation intent (vv.6-9).',
   NULL),
  (4, 'And they said, Moses suffered to write a bill of divorcement, and to put her away.',
   'οἱ δὲ εἶπαν ἐπέτρεψεν Μωϋσῆς βιβλίον ἀποστασίου γράψαι καὶ ἀπολῦσαι',
   'hoi de eipan epetrepsen Mōysēs biblion apostasiou grapsai kai apolysai',
   '''Suffered'' (epetrepsen — permitted, allowed; not commanded). ''Bill of divorcement'' (biblion apostasiou — a certificate of divorce; from Deuteronomy 24:1-4). The Pharisees frame Moses'' concession as permission. Jesus will reframe it as accommodation to human sinfulness.',
   NULL),
  (5, 'And Jesus answered and said unto them, For the hardness of your heart he wrote you this precept.',
   'ὁ δὲ Ἰησοῦς εἶπεν αὐτοῖς πρὸς τὴν σκληροκαρδίαν ὑμῶν ἔγραψεν ὑμῖν τὴν ἐντολὴν ταύτην',
   'ho de Iēsous eipen autois pros tēn sklērokardian hymōn egrapsen hymin tēn entolēn tautēn',
   '''Hardness of your heart'' (sklērokardian — hard-heartedness, obstinacy; from sklēros ''hard'' + kardia ''heart''). Moses permitted divorce because of human sinfulness, not because divorce reflects God''s will. The Mosaic law at this point is remedial (managing sin''s consequences) rather than ideal (expressing God''s perfect design).',
   NULL),
  (6, 'But from the beginning of the creation God made them male and female.',
   'ἀπὸ δὲ ἀρχῆς κτίσεως ἄρσεν καὶ θῆλυ ἐποίησεν αὐτούς ὁ θεός',
   'apo de archēs ktiseōs arsen kai thēly epoiēsen autous ho theos',
   '''From the beginning of the creation'' (apo archēs ktiseōs — from creation''s start). Jesus appeals to Genesis 1:27 — the creation order takes priority over the Mosaic concession. ''Male and female'' (arsen kai thēly) — the complementary design of the sexes is foundational to marriage. Jesus'' hermeneutic: God''s original intention reveals his permanent will.',
   'Jesus'' approach to this question is hermeneutically significant. He does not simply cite one biblical text against another; he establishes a hierarchy of authority within Scripture itself. The creation account (Genesis 1-2) reveals God''s ideal; the Mosaic law (Deuteronomy 24) accommodates human failure. When there is tension between the two, creation''s design takes precedence. This hermeneutical principle — interpreting law through the lens of creation — has profound implications for Christian ethics.'),
  (7, 'For this cause shall a man leave his father and mother, and cleave to his wife;',
   'ἕνεκεν τούτου καταλείψει ἄνθρωπος τὸν πατέρα αὐτοῦ καὶ τὴν μητέρα',
   'heneken toutou kataleipsei anthrōpos ton patera autou kai tēn mētera',
   '''Leave'' (kataleipsei — forsake, abandon the primary bond with parents). ''Cleave'' (from Genesis 2:24; the Greek in Matthew''s parallel uses proskollēthēsetai — be glued to, bonded). Marriage creates a new primary relationship that supersedes even the parent-child bond. The ''leaving'' is a public, social act; the ''cleaving'' is an exclusive, permanent commitment.',
   NULL),
  (8, 'And they twain shall be one flesh: so then they are no more twain, but one flesh.',
   'καὶ ἔσονται οἱ δύο εἰς σάρκα μίαν ὥστε οὐκέτι εἰσὶν δύο ἀλλὰ μία σάρξ',
   'kai esontai hoi dyo eis sarka mian hōste ouketi eisin dyo alla mia sarx',
   '''One flesh'' (sarka mian — a single unity; from Genesis 2:24). ''No more twain, but one'' — marriage creates a union so profound that two persons become one entity. ''Flesh'' (sarx) encompasses the whole person — physical, emotional, spiritual. This is not merely a sexual union but an ontological one: the two become a new reality that did not exist before.',
   NULL),
  (9, 'What therefore God hath joined together, let not man put asunder.',
   'ὃ οὖν ὁ θεὸς συνέζευξεν ἄνθρωπος μὴ χωριζέτω',
   'ho oun ho theos synezeuxen anthrōpos mē chōrizetō',
   '''Joined together'' (synezeuxen — yoked together, harnessed as a pair; from syn ''together'' + zeugnymi ''to yoke''). ''Put asunder'' (chōrizetō — separate, divorce). God is the agent of marriage union; human beings are forbidden from dissolving it. The passive divine action (God joins) versus the active human violation (man separates) creates a stark moral contrast. Marriage is God''s work; divorce is man''s undoing of it.',
   'This verse is the definitive statement on the permanence of marriage. Three crucial elements: (1) God is the active agent — he ''joins together'' (synezeuxen). Marriage is not merely a social contract but a divine act. (2) The prohibition is absolute — ''let not man put asunder'' uses the present imperative: stop separating what God has joined. (3) The verse applies universally to all marriages, not only those of believers, since Jesus grounds it in creation, not covenant. This does not address every pastoral situation involving abuse or abandonment, but it establishes God''s clear will for the institution.'),
  (10, 'And in the house his disciples asked him again of the same matter.',
   'καὶ εἰς τὴν οἰκίαν πάλιν οἱ μαθηταὶ αὐτοῦ περὶ τούτου ἐπηρώτων αὐτόν',
   'kai eis tēn oikian palin hoi mathētai autou peri toutou epērōtōn auton',
   'The private follow-up in the house — Mark''s characteristic pattern of public teaching followed by private explanation (cf. 4:10; 7:17). The disciples need clarification, probably because Jesus'' teaching was more restrictive than any rabbinic school of their day.',
   NULL),
  (11, 'And he saith unto them, Whosoever shall put away his wife, and marry another, committeth adultery against her.',
   'καὶ λέγει αὐτοῖς ὃς ἐὰν ἀπολύσῃ τὴν γυναῖκα αὐτοῦ καὶ γαμήσῃ ἄλλην μοιχᾶται ἐπ᾿ αὐτήν',
   'kai legei autois hos ean apolysē tēn gynaika autou kai gamēsē allēn moichatai ep autēn',
   '''Committeth adultery against her'' (moichatai ep autēn — commits adultery against the first wife). In Jewish law, a man could commit adultery against another man (by taking his wife) but not against his own wife. Jesus revolutionises the concept: a husband can commit adultery against his own wife by divorcing her and remarrying. This elevates the wife to equal standing in the marriage covenant.',
   NULL),
  (12, 'And if a woman shall put away her husband, and be married to another, she committeth adultery.',
   'καὶ ἐὰν αὐτὴ ἀπολύσασα τὸν ἄνδρα αὐτῆς γαμήσῃ ἄλλον μοιχᾶται',
   'kai ean autē apolysasa ton andra autēs gamēsē allon moichatai',
   'Under Jewish law, a woman could not initiate divorce (though under Roman law she could). Mark includes this clause for his Roman audience, where women did divorce their husbands. The principle is symmetrical: the same standard applies to both sexes. Both husband and wife have equal obligations within marriage.',
   NULL),
  (13, 'And they brought young children to him, that he should touch them: and his disciples rebuked those that brought them.',
   'καὶ προσέφερον αὐτῷ παιδία ἵνα ἅψηται αὐτῶν οἱ δὲ μαθηταὶ ἐπετίμησαν τοῖς προσφέρουσιν',
   'kai prosepheron autō paidia hina hapsētai autōn hoi de mathētai epetimēsan tois prospherousin',
   '''Young children'' (paidia — small children, infants). ''Touch'' (hapsētai — lay hands on for blessing). ''Rebuked'' (epetimēsan — censured sternly; the same word used for rebuking demons). The disciples act as gatekeepers, considering children beneath Jesus'' attention. They reflect the cultural view that children had no status. Jesus will sharply correct this.',
   NULL),
  (14, 'But when Jesus saw it, he was much displeased, and said unto them, Suffer the little children to come unto me, and forbid them not: for of such is the kingdom of God.',
   'ἰδὼν δὲ ὁ Ἰησοῦς ἠγανάκτησεν καὶ εἶπεν αὐτοῖς ἄφετε τὰ παιδία ἔρχεσθαι πρός με μὴ κωλύετε αὐτά τῶν γὰρ τοιούτων ἐστὶν ἡ βασιλεία τοῦ θεοῦ',
   'idōn de ho Iēsous ēganaktēsen kai eipen autois aphete ta paidia erchesthai pros me mē kōlyete auta tōn gar toioutōn estin hē basileia tou theou',
   '''Much displeased'' (ēganaktēsen — was indignant, deeply angered). This is the strongest emotional reaction Jesus shows toward his disciples in Mark. ''Suffer'' (aphete — allow, let). ''Forbid them not'' (mē kōlyete — stop hindering). ''Of such is the kingdom'' (tōn toioutōn — to such ones the kingdom belongs). Children are not merely welcome in the kingdom; they model the posture required to enter it.',
   NULL),
  (15, 'Verily I say unto you, Whosoever shall not receive the kingdom of God as a little child, he shall not enter therein.',
   'ἀμὴν λέγω ὑμῖν ὃς ἐὰν μὴ δέξηται τὴν βασιλείαν τοῦ θεοῦ ὡς παιδίον οὐ μὴ εἰσέλθῃ εἰς αὐτήν',
   'amēn legō hymin hos ean mē dexētai tēn basileian tou theou hōs paidion ou mē eiselthē eis autēn',
   '''As a little child'' (hōs paidion — like a child). ''Shall not enter'' (ou mē eiselthē — will definitely not enter; double negative for absolute certainty). What makes a child the model? Not innocence or purity (Jesus does not sentimentalise children) but dependence, receptivity, and inability to earn or achieve. A child receives a gift because it cannot buy one. The kingdom is received, not achieved.',
   'This verse is foundational for the doctrine of grace. The kingdom of God must be ''received'' (dexētai — welcomed, accepted as a gift) with the utter dependence of a child. A child cannot earn, negotiate, or demand — it can only receive. This directly contradicts salvation by works, achievement, or moral superiority. The rich young ruler in the next story (vv.17-22) illustrates the failure: he has earned much but cannot receive like a child. Entering God''s kingdom requires the surrender of self-sufficiency.'),
  (16, 'And he took them up in his arms, put his hands upon them, and blessed them.',
   'καὶ ἐναγκαλισάμενος αὐτὰ κατευλόγει τιθεὶς τὰς χεῖρας ἐπ᾿ αὐτά',
   'kai enankalisamenos auta kateulogei titheis tas cheiras ep auta',
   '''Took them up in his arms'' (enankalisamenos — embraced them; the same warm gesture from 9:36). ''Blessed them'' (kateulogei — intensively blessed; the kata- prefix strengthens the action: he blessed them fervently, thoroughly). Jesus goes beyond what was asked — the parents requested a touch; he gives embrace and intensive blessing. Grace always exceeds the request.',
   NULL),
  (17, 'And when he was gone forth into the way, there came one running, and kneeled to him, and asked him, Good Master, what shall I do that I may inherit eternal life?',
   'καὶ ἐκπορευομένου αὐτοῦ εἰς ὁδὸν προσδραμὼν εἷς καὶ γονυπετήσας αὐτὸν ἐπηρώτα αὐτόν διδάσκαλε ἀγαθέ τί ποιήσω ἵνα ζωὴν αἰώνιον κληρονομήσω',
   'kai ekporeuomenou autou eis hodon prosdramōn heis kai gonypetēsas auton epērōta auton didaskale agathe ti poiēsō hina zōēn aiōnion klēronomēsō',
   '''Running'' (prosdramōn — ran up to). ''Kneeled'' (gonypetēsas — fell on his knees). The urgency and reverence are genuine. ''Good Master'' (didaskale agathe). ''Inherit eternal life'' (zōēn aiōnion klēronomēsō — receive as an inheritance). His question assumes eternal life can be ''done'' — earned by action. But an inheritance is received, not earned. His very question reveals the problem.',
   NULL),
  (18, 'And Jesus said unto him, Why callest thou me good? there is none good but one, that is, God.',
   'ὁ δὲ Ἰησοῦς εἶπεν αὐτῷ τί με λέγεις ἀγαθόν οὐδεὶς ἀγαθὸς εἰ μὴ εἷς ὁ θεός',
   'ho de Iēsous eipen autō ti me legeis agathon oudeis agathos ei mē heis ho theos',
   '''Why callest thou me good?'' — Jesus does not deny his goodness but probes the man''s understanding. If only God is truly good (agathos), then calling Jesus ''good'' either means nothing (mere flattery) or everything (an implicit recognition of divinity). Jesus forces the man to reckon with who he is addressing.',
   NULL),
  (19, 'Thou knowest the commandments, Do not commit adultery, Do not kill, Do not steal, Do not bear false witness, Defraud not, Honour thy father and mother.',
   'τὰς ἐντολὰς οἶδας μὴ μοιχεύσῃς μὴ φονεύσῃς μὴ κλέψῃς μὴ ψευδομαρτυρήσῃς μὴ ἀποστερήσῃς τίμα τὸν πατέρα σου καὶ τὴν μητέρα',
   'tas entolas oidas mē moicheusēs mē phoneusēs mē klepsēs mē pseudomartyrēsēs mē aposterēsēs tima ton patera sou kai tēn mētera',
   'Jesus lists commandments from the ''second table'' (duties toward neighbour, Exodus 20:12-17) but conspicuously omits the first table (duties toward God) and the tenth commandment (''thou shalt not covet''). ''Defraud not'' (mē aposterēsēs — do not deprive, do not cheat) may substitute for or expand on ''do not covet,'' hinting at the man''s real problem: his wealth may have come at others'' expense.',
   NULL),
  (20, 'And he answered and said unto him, Master, all these have I observed from my youth.',
   'ὁ δὲ ἀποκριθεὶς εἶπεν αὐτῷ διδάσκαλε ταῦτα πάντα ἐφυλαξάμην ἐκ νεότητός μου',
   'ho de apokritheis eipen autō didaskale tauta panta ephylaxamēn ek neotētos mou',
   '''Observed'' (ephylaxamēn — guarded, kept carefully). ''From my youth'' (ek neotētos — from adolescence, since my bar mitzvah). The claim is sincere, not boastful. The man has been morally serious his entire life. But external obedience to the second table has not touched his real idol — wealth. He has kept the commandments about his neighbour while violating the first commandment: ''thou shalt have no other gods.''',
   NULL),
  (21, 'Then Jesus beholding him loved him, and said unto him, One thing thou lackest: go thy way, sell whatsoever thou hast, and give to the poor, and thou shalt have treasure in heaven: and come, take up the cross, and follow me.',
   'ὁ δὲ Ἰησοῦς ἐμβλέψας αὐτῷ ἠγάπησεν αὐτὸν καὶ εἶπεν αὐτῷ ἕν σε ὑστερεῖ ὕπαγε ὅσα ἔχεις πώλησον καὶ δὸς τοῖς πτωχοῖς καὶ ἕξεις θησαυρὸν ἐν οὐρανῷ καὶ δεῦρο ἀκολούθει μοι ἄρας τὸν σταυρόν',
   'ho de Iēsous emblepsas autō ēgapēsen auton kai eipen autō hen se hysterei hypage hosa echeis pōlēson kai dos tois ptōchois kai hexeis thēsauron en ouranō kai deuro akolouthei moi aras ton stauron',
   '''Beholding him loved him'' (emblepsas ēgapēsen — looked intently and loved him). This is the only person Mark explicitly says Jesus loved during his ministry. ''One thing thou lackest'' (hen se hysterei — one thing you fall short of). ''Sell whatsoever thou hast'' — the command is specific to this man''s idol. ''Treasure in heaven'' — earthly treasure exchanged for eternal treasure. ''Take up the cross, and follow me'' — the universal requirement (8:34), here made personal.',
   'Jesus'' love for this man is crucial: the demand to sell all is not punitive but redemptive. Jesus loves him enough to expose his idol. The ''one thing'' lacking is not another good work but surrender — releasing his grip on the thing that holds him back from God. This is not a universal command for poverty (Jesus did not demand this of all followers) but a diagnostic challenge aimed at this man''s specific bondage. The principle is universal: whatever stands between a person and God must go. For this man, it was wealth.'),
  (22, 'And he was sad at that saying, and went away grieved: for he had great possessions.',
   'ὁ δὲ στυγνάσας ἐπὶ τῷ λόγῳ ἀπῆλθεν λυπούμενος ἦν γὰρ ἔχων κτήματα πολλά',
   'ho de stygnasas epi tō logō apēlthen lypoumenos ēn gar echōn ktēmata polla',
   '''Sad'' (stygnasas — his face fell, became gloomy; the word is used of an overcast sky in Matthew 16:3). ''Grieved'' (lypoumenos — sorrowful, pained). ''Great possessions'' (ktēmata polla — many properties, estates). He went away — the only person in the Gospels who comes to Jesus with a genuine question and leaves without following. His possessions possessed him. Mark records no return.',
   NULL),
  (23, 'And Jesus looked round about, and saith unto his disciples, How hardly shall they that have riches enter into the kingdom of God!',
   'καὶ περιβλεψάμενος ὁ Ἰησοῦς λέγει τοῖς μαθηταῖς αὐτοῦ πῶς δυσκόλως οἱ τὰ χρήματα ἔχοντες εἰς τὴν βασιλείαν τοῦ θεοῦ εἰσελεύσονται',
   'kai periblepsamenos ho Iēsous legei tois mathētais autou pōs dyskolōs hoi ta chrēmata echontes eis tēn basileian tou theou eiseleusontai',
   '''Looked round about'' (periblepsamenos — surveyed the circle of disciples). ''How hardly'' (pōs dyskolōs — how difficult it is). ''Riches'' (chrēmata — money, wealth, possessions). Jesus'' pronouncement would have shocked his audience: in Judaism, wealth was generally seen as a sign of God''s blessing. Jesus reverses this: wealth is not evidence of divine favour but a potential barrier to the kingdom.',
   NULL),
  (24, 'And the disciples were astonished at his words. But Jesus answereth again, and saith unto them, Children, how hard is it for them that trust in riches to enter into the kingdom of God!',
   'οἱ δὲ μαθηταὶ ἐθαμβοῦντο ἐπὶ τοῖς λόγοις αὐτοῦ ὁ δὲ Ἰησοῦς πάλιν ἀποκριθεὶς λέγει αὐτοῖς τέκνα πῶς δύσκολόν ἐστιν τοὺς πεποιθότας ἐπὶ τοῖς χρήμασιν εἰς τὴν βασιλείαν τοῦ θεοῦ εἰσελθεῖν',
   'hoi de mathētai ethambounto epi tois logois autou ho de Iēsous palin apokritheis legei autois tekna pōs dyskolon estin tous pepoithotas epi tois chrēmasin eis tēn basileian tou theou eiselthein',
   '''Astonished'' (ethambounto — amazed, alarmed). ''Children'' (tekna — an affectionate address: dear children). ''Trust in riches'' (pepoithotas epi tois chrēmasin — those whose confidence rests on wealth). Jesus specifies the problem: it is not wealth itself but trusting in it. Riches create the illusion of self-sufficiency, which is the opposite of the childlike dependence required to enter the kingdom (v.15).',
   NULL),
  (25, 'It is easier for a camel to go through the eye of a needle, than for a rich man to enter into the kingdom of God.',
   'εὐκοπώτερόν ἐστιν κάμηλον διὰ τρυμαλιᾶς ῥαφίδος εἰσελθεῖν ἢ πλούσιον εἰς τὴν βασιλείαν τοῦ θεοῦ εἰσελθεῖν',
   'eukopōteron estin kamēlon dia trymalias rhaphidos eiselthein ē plousion eis tēn basileian tou theou eiselthein',
   '''Camel'' (kamēlon — the largest animal in Palestine). ''Eye of a needle'' (trymalias rhaphidos — the hole of a sewing needle; the smallest opening conceivable). The image is deliberately absurd — not ''difficult'' but impossible. There is no ''Needle Gate'' in Jerusalem (a medieval legend). Jesus means exactly what he says: it is humanly impossible for the rich to enter the kingdom. Only God can accomplish this (v.27).',
   NULL),
  (26, 'And they were astonished out of measure, saying among themselves, Who then can be saved?',
   'οἱ δὲ περισσῶς ἐξεπλήσσοντο λέγοντες πρὸς ἑαυτούς καὶ τίς δύναται σωθῆναι',
   'hoi de perissōs exeplēssonto legontes pros heautous kai tis dynatai sōthēnai',
   '''Astonished out of measure'' (perissōs exeplēssonto — exceedingly astonished; the disciples'' shock doubles). ''Who then can be saved?'' — if the rich (who have every advantage) cannot be saved, what hope is there for anyone? The question is exactly right — and Jesus'' answer (v.27) is the gospel in miniature.',
   NULL),
  (27, 'And Jesus looking upon them saith, With men it is impossible, but not with God: for with God all things are possible.',
   'ἐμβλέψας δὲ αὐτοῖς ὁ Ἰησοῦς λέγει παρὰ ἀνθρώποις ἀδύνατον ἀλλ᾿ οὐ παρὰ θεῷ πάντα γὰρ δυνατὰ παρὰ τῷ θεῷ',
   'emblepsas de autois ho Iēsous legei para anthrōpois adynaton all ou para theō panta gar dynata para tō theō',
   '''Impossible'' (adynaton — without power, unable). ''All things possible'' (panta dynata — everything is within God''s power). Salvation is impossible for human effort but entirely possible for divine grace. This is the theological heart of the passage: no one — rich or poor — can save themselves. Salvation is God''s work. The very impossibility drives us to dependence on God, which is the childlike posture of v.15.',
   'This verse is the gospel in concentrated form. Salvation is ''impossible'' (adynaton) for human beings — not just difficult or unlikely, but impossible. The rich man illustrates the universal problem: no one can earn, buy, or achieve entrance into God''s kingdom. But ''with God all things are possible'' — divine grace accomplishes what human effort cannot. This echoes Genesis 18:14 (''Is any thing too hard for the LORD?'') and Jeremiah 32:17 (''there is nothing too hard for thee''). Salvation is entirely God''s gift, received with the empty hands of a child.'),
  (28, 'Then Peter began to say unto him, Lo, we have left all, and have followed thee.',
   'ἤρξατο λέγειν ὁ Πέτρος αὐτῷ ἰδοὺ ἡμεῖς ἀφήκαμεν πάντα καὶ ἠκολουθήκαμέν σοι',
   'ērxato legein ho Petros autō idou hēmeis aphēkamen panta kai ēkolouthēkamen soi',
   '''We have left all'' (aphēkamen panta — we abandoned everything). Peter''s implicit question: what do we get in return? Unlike the rich man, the disciples did leave everything. But Peter''s statement still smells of calculation — following Jesus as an investment expecting returns.',
   NULL),
  (29, 'And Jesus answered and said, Verily I say unto you, There is no man that hath left house, or brethren, or sisters, or father, or mother, or wife, or children, or lands, for my sake, and the gospel''s,',
   'ἀποκριθεὶς ὁ Ἰησοῦς εἶπεν ἀμὴν λέγω ὑμῖν οὐδείς ἐστιν ὃς ἀφῆκεν οἰκίαν ἢ ἀδελφοὺς ἢ ἀδελφὰς ἢ πατέρα ἢ μητέρα ἢ γυναῖκα ἢ τέκνα ἢ ἀγρούς ἕνεκεν ἐμοῦ καὶ ἕνεκεν τοῦ εὐαγγελίου',
   'apokritheis ho Iēsous eipen amēn legō hymin oudeis estin hos aphēken oikian ē adelphous ē adelphas ē patera ē mētera ē gynaika ē tekna ē agrous heneken emou kai heneken tou euangeliou',
   '''For my sake, and the gospel''s'' — the dual motivation (as in 8:35). The catalogue of what is left — house, siblings, parents, spouse, children, lands — covers every major relationship and possession. The sacrifice is total. But Jesus does not demand sacrifice without promise.',
   NULL),
  (30, 'But he shall receive an hundredfold now in this time, houses, and brethren, and sisters, and mothers, and children, and lands, with persecutions; and in the world to come eternal life.',
   'ἐὰν μὴ λάβῃ ἑκατονταπλασίονα νῦν ἐν τῷ καιρῷ τούτῳ οἰκίας καὶ ἀδελφοὺς καὶ ἀδελφὰς καὶ μητέρας καὶ τέκνα καὶ ἀγροὺς μετὰ διωγμῶν καὶ ἐν τῷ αἰῶνι τῷ ἐρχομένῳ ζωὴν αἰώνιον',
   'ean mē labē hekatontaplasiona nyn en tō kairō toutō oikias kai adelphous kai adelphas kai mēteras kai tekna kai agrous meta diōgmōn kai en tō aiōni tō erchomenō zōēn aiōnion',
   '''Hundredfold'' (hekatontaplasiona — a hundred times as much). ''Now in this time'' — not just in eternity but in the present age. ''With persecutions'' (meta diōgmōn — the realistic qualification; the hundredfold comes paired with suffering, not in place of it). ''Eternal life'' — the ultimate reward. The new family of faith provides houses, siblings, parents, children, lands — the Christian community replaces what was lost. But the bracketing phrase ''with persecutions'' prevents this from becoming prosperity theology.',
   NULL),
  (31, 'But many that are first shall be last; and the last first.',
   'πολλοὶ δὲ ἔσονται πρῶτοι ἔσχατοι καὶ οἱ ἔσχατοι πρῶτοι',
   'polloi de esontai prōtoi eschatoi kai hoi eschatoi prōtoi',
   '''First shall be last'' — the kingdom inversion again (cf. 9:35). Those with present advantages (wealth, status, religious credentials) may find themselves behind those with none. Those who have nothing but faith will find themselves first. The rich young ruler was ''first'' in worldly terms but walked away last. The disciples, who ''left all,'' are last in worldly terms but first in the kingdom.',
   NULL),
  (32, 'And they were in the way going up to Jerusalem; and Jesus went before them: and they were amazed; and as they followed, they were afraid. And he took again the twelve, and began to tell them what things should happen unto him,',
   'ἦσαν δὲ ἐν τῇ ὁδῷ ἀναβαίνοντες εἰς Ἱεροσόλυμα καὶ ἦν προάγων αὐτοὺς ὁ Ἰησοῦς καὶ ἐθαμβοῦντο καὶ ἀκολουθοῦντες ἐφοβοῦντο καὶ παραλαβὼν πάλιν τοὺς δώδεκα ἤρξατο αὐτοῖς λέγειν τὰ μέλλοντα αὐτῷ συμβαίνειν',
   'ēsan de en tē hodō anabainontes eis Hierosolyma kai ēn proagōn autous ho Iēsous kai ethambounto kai akolouthountes ephobounto kai paralabōn palin tous dōdeka ērxato autois legein ta mellonta autō symbainein',
   '''Going up to Jerusalem'' (anabainontes eis Hierosolyma — ascending; Jerusalem is at elevation, and going there for the last time). ''Jesus went before them'' (proagōn — walking ahead, leading). ''Amazed... afraid'' — the atmosphere is charged with foreboding. Jesus walks purposefully toward his death while the disciples follow at a distance, sensing something momentous and dreadful.',
   NULL),
  (33, 'Saying, Behold, we go up to Jerusalem; and the Son of man shall be delivered unto the chief priests, and unto the scribes; and they shall condemn him to death, and shall deliver him to the Gentiles:',
   'ὅτι ἰδοὺ ἀναβαίνομεν εἰς Ἱεροσόλυμα καὶ ὁ υἱὸς τοῦ ἀνθρώπου παραδοθήσεται τοῖς ἀρχιερεῦσιν καὶ τοῖς γραμματεῦσιν καὶ κατακρινοῦσιν αὐτὸν θανάτῳ καὶ παραδώσουσιν αὐτὸν τοῖς ἔθνεσιν',
   'hoti idou anabainomen eis Hierosolyma kai ho huios tou anthrōpou paradothēsetai tois archiereusin kai tois grammateusin kai katakrinousin auton thanatō kai paradōsousin auton tois ethnesin',
   '''Delivered'' (paradothēsetai — will be handed over; the passive suggests God''s sovereign plan working through human treachery). ''Chief priests and scribes'' — Jewish leadership condemns. ''Gentiles'' (ethnesin — the nations; i.e., Rome) — execution comes from the Gentile power. The third passion prediction adds new specifics: condemnation, delivery to Gentiles.',
   NULL),
  (34, 'And they shall mock him, and shall scourge him, and shall spit upon him, and shall kill him: and the third day he shall rise again.',
   'καὶ ἐμπαίξουσιν αὐτῷ καὶ μαστιγώσουσιν αὐτὸν καὶ ἐμπτύσουσιν αὐτῷ καὶ ἀποκτενοῦσιν αὐτόν καὶ τῇ τρίτῃ ἡμέρᾳ ἀναστήσεται',
   'kai empaixousin autō kai mastigōsousin auton kai emptysousin autō kai apoktenousin auton kai tē tritē hēmera anastēsetai',
   '''Mock'' (empaixousin — ridicule, make fun of). ''Scourge'' (mastigōsousin — flog with the Roman flagellum). ''Spit upon'' (emptysousin — spit in the face; the ultimate insult). ''Kill'' and ''rise again'' — all fulfilled in chapters 14-16. This is the most detailed passion prediction: mocking (15:16-20), scourging (15:15), spitting (14:65; 15:19), killing (15:37), and resurrection (16:6). Jesus walks knowingly into every detail of his suffering.',
   NULL),
  (35, 'And James and John, the sons of Zebedee, come unto him, saying, Master, we would that thou shouldest do for us whatsoever we shall desire.',
   'καὶ προσπορεύονται αὐτῷ Ἰάκωβος καὶ Ἰωάννης οἱ υἱοὶ Ζεβεδαίου λέγοντες διδάσκαλε θέλομεν ἵνα ὃ ἐὰν αἰτήσωμεν ποιήσῃς ἡμῖν',
   'kai prosporeuontai autō Iakōbos kai Iōannēs hoi huioi Zebedaiou legontes didaskale thelomen hina ho ean aitēsōmen poiēsēs hēmin',
   '''We would that thou shouldest do for us whatsoever we shall desire'' — a blank-cheque request that is breathtaking in its presumption, especially immediately after the passion prediction. James and John heard ''rise again'' and imagined a glorious kingdom — skipping over the suffering entirely. They want to secure the best positions.',
   NULL),
  (36, 'And he said unto them, What would ye that I should do for you?',
   'ὁ δὲ εἶπεν αὐτοῖς τί θέλετε ποιήσω ὑμῖν',
   'ho de eipen autois ti thelete poiēsō hymin',
   'Jesus asks the same question he will ask blind Bartimaeus (v.51). The contrast is striking: James and John request thrones; Bartimaeus requests sight. One request reveals ambition; the other reveals need.',
   NULL),
  (37, 'They said unto him, Grant unto us that we may sit, one on thy right hand, and the other on thy left hand, in thy glory.',
   'οἱ δὲ εἶπαν αὐτῷ δὸς ἡμῖν ἵνα εἷς σου ἐκ δεξιῶν καὶ εἷς ἐξ ἀριστερῶν καθίσωμεν ἐν τῇ δόξῃ σου',
   'hoi de eipan autō dos hēmin hina heis sou ek dexiōn kai heis ex aristerōn kathisōmen en tē doxē sou',
   '''Right hand... left hand'' — the positions of highest honour, flanking the king. ''In thy glory'' (en tē doxē sou — in your glory). They see the crown but not the cross. Ironically, those at Jesus'' right and left in his ''glory'' at Golgotha will be two thieves (15:27). The seats of honour in Jesus'' kingdom are occupied by crucified criminals, not aspiring rulers.',
   NULL),
  (38, 'But Jesus said unto them, Ye know not what ye ask: can ye drink of the cup that I drink of? and be baptized with the baptism that I am baptized with?',
   'ὁ δὲ Ἰησοῦς εἶπεν αὐτοῖς οὐκ οἴδατε τί αἰτεῖσθε δύνασθε πιεῖν τὸ ποτήριον ὃ ἐγὼ πίνω καὶ τὸ βάπτισμα ὃ ἐγὼ βαπτίζομαι βαπτισθῆναι',
   'ho de Iēsous eipen autois ouk oidate ti aiteisthe dynasthe piein to potērion ho egō pinō kai to baptisma ho egō baptizomai baptisthēnai',
   '''Ye know not what ye ask'' — they have no idea what they are requesting. ''Cup'' (potērion — in OT imagery, the cup of God''s wrath: Psalm 75:8; Isaiah 51:17, 22; Jeremiah 25:15). ''Baptism'' (baptisma — immersion; metaphorical: being overwhelmed by suffering). Jesus'' ''cup'' is Gethsemane and the cross; his ''baptism'' is immersion in death. Can you share that?',
   NULL),
  (39, 'And they said unto him, We can. And Jesus said unto them, Ye shall indeed drink of the cup that I drink of; and with the baptism that I am baptized withal shall ye be baptized:',
   'οἱ δὲ εἶπαν αὐτῷ δυνάμεθα ὁ δὲ Ἰησοῦς εἶπεν αὐτοῖς τὸ μὲν ποτήριον ὃ ἐγὼ πίνω πίεσθε καὶ τὸ βάπτισμα ὃ ἐγὼ βαπτίζομαι βαπτισθήσεσθε',
   'hoi de eipan autō dynametha ho de Iēsous eipen autois to men potērion ho egō pinō piesthe kai to baptisma ho egō baptizomai baptisthēsesthe',
   '''We can'' (dynametha — we are able; confident but uninformed). Jesus confirms they will indeed share his suffering. James was the first apostle martyred (Acts 12:2); John endured exile on Patmos (Revelation 1:9). They would drink the cup and undergo the baptism — but not to secure thrones.',
   NULL),
  (40, 'But to sit on my right hand and on my left hand is not mine to give; but it shall be given to them for whom it is prepared.',
   'τὸ δὲ καθίσαι ἐκ δεξιῶν μου ἢ ἐξ εὐωνύμων οὐκ ἔστιν ἐμὸν δοῦναι ἀλλ᾿ οἷς ἡτοίμασται',
   'to de kathisai ek dexiōn mou ē ex euōnymōn ouk estin emon dounai all hois hētoimastai',
   '''Not mine to give'' — Jesus does not deny having authority but defers to the Father''s sovereign arrangement. ''For whom it is prepared'' (hois hētoimastai — those for whom it has been prepared; divine passive: God has prepared it). Kingdom honours are assigned by the Father according to his sovereign purposes, not granted on request.',
   NULL),
  (41, 'And when the ten heard it, they began to be much displeased with James and John.',
   'καὶ ἀκούσαντες οἱ δέκα ἤρξαντο ἀγανακτεῖν περὶ Ἰακώβου καὶ Ἰωάννου',
   'kai akousantes hoi deka ērxanto aganaktein peri Iakōbou kai Iōannou',
   '''Much displeased'' (aganaktein — indignant, angry). The ten are not upset because James and John''s request was wrong in principle but because they wanted the same positions for themselves. Their indignation reveals the same ambition. Jesus must correct all twelve, not just two.',
   NULL),
  (42, 'But Jesus called them to him, and saith unto them, Ye know that they which are accounted to rule over the Gentiles exercise lordship over them; and their great ones exercise authority upon them.',
   'ὁ δὲ Ἰησοῦς προσκαλεσάμενος αὐτοὺς λέγει αὐτοῖς οἴδατε ὅτι οἱ δοκοῦντες ἄρχειν τῶν ἐθνῶν κατακυριεύουσιν αὐτῶν καὶ οἱ μεγάλοι αὐτῶν κατεξουσιάζουσιν αὐτῶν',
   'ho de Iēsous proskalesamenos autous legei autois oidate hoti hoi dokountes archein tōn ethnōn katakurieuousin autōn kai hoi megaloi autōn katexousiazousin autōn',
   '''Exercise lordship'' (katakurieuousin — lord it over, dominate; kata- prefix intensifies: ''down-lord''). ''Exercise authority'' (katexousiazousin — wield authority over, overpower). The Gentile model of leadership is top-down domination. Jesus describes it accurately but does not endorse it. His ''ye know'' is observational: this is how the world works.',
   NULL),
  (43, 'But so shall it not be among you: but whosoever will be great among you, shall be your minister:',
   'οὐχ οὕτως δέ ἐστιν ἐν ὑμῖν ἀλλ᾿ ὃς ἐὰν θέλῃ μέγας γενέσθαι ἐν ὑμῖν ἔσται ὑμῶν διάκονος',
   'ouch houtōs de estin en hymin all hos ean thelē megas genesthai en hymin estai hymōn diakonos',
   '''Not so among you'' (ouch houtōs — absolutely not this way). ''Minister'' (diakonos — servant, one who waits on tables). The negation is total: the world''s leadership model has zero application in the kingdom. Greatness is redefined as service. The diakonos serves voluntarily — this is chosen, not forced servitude.',
   NULL),
  (44, 'And whosoever of you will be the chiefest, shall be servant of all.',
   'καὶ ὃς ἐὰν θέλῃ ὑμῶν γενέσθαι πρῶτος ἔσται πάντων δοῦλος',
   'kai hos ean thelē hymōn genesthai prōtos estai pantōn doulos',
   '''Chiefest'' (prōtos — first, foremost). ''Servant of all'' (pantōn doulos — slave of everyone). Jesus escalates from diakonos (voluntary servant, v.43) to doulos (slave, v.44). The path to first place is total servitude. A doulos has no rights, no status, no agenda of their own. This is the ultimate inversion of worldly hierarchy.',
   NULL),
  (45, 'For even the Son of man came not to be ministered unto, but to minister, and to give his life a ransom for many.',
   'καὶ γὰρ ὁ υἱὸς τοῦ ἀνθρώπου οὐκ ἦλθεν διακονηθῆναι ἀλλὰ διακονῆσαι καὶ δοῦναι τὴν ψυχὴν αὐτοῦ λύτρον ἀντὶ πολλῶν',
   'kai gar ho huios tou anthrōpou ouk ēlthen diakonēthēnai alla diakonēsai kai dounai tēn psychēn autou lytron anti pollōn',
   '''Came not to be ministered unto'' (ouk ēlthen diakonēthēnai — did not come to be served). ''But to minister'' (alla diakonēsai — but to serve). ''Give his life'' (dounai tēn psychēn — to give his soul/self). ''Ransom'' (lytron — redemption price, the cost of liberating a slave or prisoner). ''For many'' (anti pollōn — in the place of many; anti is substitutionary: ''instead of''). This is the theological climax of Mark: the Son of man''s servanthood reaches its ultimate expression in substitutionary death.',
   'This is the most important verse in Mark''s Gospel theologically. It combines three revolutionary ideas: (1) The Son of man — the glorious figure of Daniel 7:13 — came to serve, not to be served. Messiahship is redefined as servanthood. (2) His service climaxes in giving his life — voluntary, deliberate self-sacrifice. (3) His death is a lytron anti pollōn — a ransom in the place of many. The preposition anti establishes substitution: Jesus dies instead of (not merely for the benefit of) others. This is the clearest statement of substitutionary atonement in the Synoptic Gospels. The ''many'' echoes Isaiah 53:11-12: the Servant who bears the sins of many.'),
  (46, 'And they came to Jericho: and as he went out of Jericho with his disciples and a great number of people, blind Bartimaeus, the son of Timaeus, sat by the highway side begging.',
   'καὶ ἔρχονται εἰς Ἰεριχώ καὶ ἐκπορευομένου αὐτοῦ ἀπὸ Ἰεριχὼ καὶ τῶν μαθητῶν αὐτοῦ καὶ ὄχλου ἱκανοῦ υἱὸς Τιμαίου Βαρτιμαῖος τυφλὸς προσαίτης ἐκάθητο παρὰ τὴν ὁδόν',
   'kai erchontai eis Ierichō kai ekporeuomenou autou apo Ierichō kai tōn mathētōn autou kai ochlou hikanou huios Timaiou Bartimaios typhlos prosaitēs ekathēto para tēn hodon',
   '''Bartimaeus'' (Bartimaios — son of Timaeus; Mark gives both the Aramaic patronymic and the Greek translation, suggesting this man was known in the early church). ''Blind'' (typhlos). ''Begging'' (prosaitēs — a beggar). ''By the highway side'' — marginalized, powerless, dependent on others'' charity. He is the antithesis of the rich young ruler: he has nothing, and therefore he has nothing to lose.',
   NULL),
  (47, 'And when he heard that it was Jesus of Nazareth, he began to cry out, and say, Jesus, thou Son of David, have mercy on me.',
   'καὶ ἀκούσας ὅτι Ἰησοῦς ὁ Ναζωραῖός ἐστιν ἤρξατο κράζειν καὶ λέγειν ὁ υἱὸς Δαυὶδ Ἰησοῦ ἐλέησόν με',
   'kai akousas hoti Iēsous ho Nazōraios estin ērxato krazein kai legein ho huios Dauid Iēsou eleēson me',
   '''Son of David'' (huios Dauid — a royal messianic title; 2 Samuel 7:12-16). ''Have mercy on me'' (eleēson me — show me mercy; a prayer, not a demand). Bartimaeus, blind physically, sees more clearly than the sighted disciples: he recognises Jesus as the Davidic Messiah. His cry is pure faith — no possessions to surrender, no status to protect, just desperate need meeting confident faith.',
   NULL),
  (48, 'And many charged him that he should hold his peace: but he cried the more a great deal, Thou Son of David, have mercy on me.',
   'καὶ ἐπετίμων αὐτῷ πολλοὶ ἵνα σιωπήσῃ ὁ δὲ πολλῷ μᾶλλον ἔκραζεν υἱὲ Δαυίδ ἐλέησόν με',
   'kai epetimōn autō polloi hina siōpēsē ho de pollō mallon ekrazen huie Dauid eleēson me',
   '''Charged him'' (epetimōn — rebuked, tried to silence). ''Cried the more a great deal'' (pollō mallon ekrazen — shouted all the louder). The crowd tries to silence the blind beggar, but his faith cannot be suppressed. Like the Syrophoenician woman (7:24-30), Bartimaeus overcomes every obstacle between himself and Jesus. Persistent faith prevails over social pressure.',
   NULL),
  (49, 'And Jesus stood still, and commanded him to be called. And they call the blind man, saying unto him, Be of good comfort, rise; he calleth thee.',
   'καὶ στὰς ὁ Ἰησοῦς εἶπεν φωνήσατε αὐτόν καὶ φωνοῦσιν τὸν τυφλὸν λέγοντες αὐτῷ θάρσει ἔγειρε φωνεῖ σε',
   'kai stas ho Iēsous eipen phōnēsate auton kai phōnousin ton typhlon legontes autō tharsei egeire phōnei se',
   '''Stood still'' (stas — stopped; the journey to the cross pauses for one blind beggar). ''Be of good comfort, rise; he calleth thee'' (tharsei, egeire, phōnei se — take courage, get up, he is calling you). Three imperatives of hope. The crowd that tried to silence him now encourages him. Jesus'' call transforms the crowd''s attitude.',
   NULL),
  (50, 'And he, casting away his garment, rose, and came to Jesus.',
   'ὁ δὲ ἀποβαλὼν τὸ ἱμάτιον αὐτοῦ ἀναπηδήσας ἦλθεν πρὸς τὸν Ἰησοῦν',
   'ho de apo balōn to himation autou anapēdēsas ēlthen pros ton Iēsoun',
   '''Casting away his garment'' (apobalōn to himation — threw off his outer cloak). The cloak was a beggar''s most valuable possession — spread out to receive coins, used as blanket at night. By casting it away, Bartimaeus abandons his old life completely. What the rich young ruler could not do — let go of his possessions — the blind beggar does instantly. ''Rose'' (anapēdēsas — leaped up) — a physical expression of faith-filled urgency.',
   NULL),
  (51, 'And Jesus answered and said unto him, What wilt thou that I should do unto thee? The blind man said unto him, Lord, that I might receive my sight.',
   'καὶ ἀποκριθεὶς αὐτῷ ὁ Ἰησοῦς εἶπεν τί σοι θέλεις ποιήσω ὁ δὲ τυφλὸς εἶπεν αὐτῷ ῥαββουνί ἵνα ἀναβλέψω',
   'kai apokritheis autō ho Iēsous eipen ti soi theleis poiēsō ho de typhlos eipen autō rhabbouni hina anablepsō',
   '''What wilt thou'' — the same question asked of James and John (v.36). Their answer: thrones. Bartimaeus'' answer: sight. ''Rabboni'' (rhabbouni — my great master; an intensified form of rabbi, used only here and John 20:16). ''That I might receive my sight'' (hina anablepsō — that I might see again; suggesting he had not always been blind). The request is simple, specific, and faith-filled.',
   NULL),
  (52, 'And Jesus said unto him, Go thy way; thy faith hath made thee whole. And immediately he received his sight, and followed Jesus in the way.',
   'ὁ δὲ Ἰησοῦς εἶπεν αὐτῷ ὕπαγε ἡ πίστις σου σέσωκέν σε καὶ εὐθέως ἀνέβλεψεν καὶ ἠκολούθει αὐτῷ ἐν τῇ ὁδῷ',
   'ho de Iēsous eipen autō hypage hē pistis sou sesōken se kai eutheōs aneblepsen kai ēkolouthei autō en tē hodō',
   '''Thy faith hath made thee whole'' (hē pistis sou sesōken se — your faith has saved/healed you; sōzō encompasses both physical healing and spiritual salvation). ''Immediately'' (eutheōs — at once; unlike the two-stage healing of 8:22-26). ''Followed Jesus in the way'' (ēkolouthei autō en tē hodō — kept following him on the road). ''The way'' is the road to Jerusalem — the way of the cross. Bartimaeus is the model disciple: he sees clearly and follows immediately. The discipleship section (8:22-10:52) that began with a blind man receiving partial sight ends with a blind man receiving full sight and following in the way.',
   'Bartimaeus is the literary and theological bookend to the blind man at Bethsaida (8:22-26). That healing was in two stages (partial then full sight), paralleling the disciples'' partial understanding. Bartimaeus receives sight immediately and follows in the way — the complete disciple. His faith is the opposite of the rich young ruler''s failure: Bartimaeus has nothing, asks for mercy, receives everything, and follows. The rich man has everything, is asked to give it up, and walks away. The discipleship section thus ends with a picture of what it means to follow Jesus: see clearly, cast off everything, and walk the road to the cross.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Mark' AND c.chapter_number = 10;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.5 hardness of heart
  ('σκληροκαρδία', 'sklērokardia', 'G4641', 'Hardness of heart, stubbornness, obstinacy — from sklēros (hard, rough) + kardia (heart). The condition that made the Mosaic divorce concession necessary. Hard-heartedness is the fundamental barrier to God''s will in human relationships. It is not simply an intellectual failure but a moral calcification — the heart becoming stone-like, unable to respond to love''s demands. Jesus implies that in the kingdom, where hearts are renewed (Ezekiel 36:26), God''s original design for marriage can be restored.', 1),
  -- v.9 joined together
  ('συζεύγνυμι', 'syzeugnymi', 'G4801', 'To yoke together, join together, unite — from syn (together) + zeugnymi (to yoke). A term from agriculture: two animals yoked together for work. God is the one who ''yokes'' husband and wife together in marriage. The divine yoking creates a bond that human action should not (and in God''s sight, cannot truly) dissolve. The passive voice (synezeuxen) places God as the active agent in every marriage, not merely as a witness to a human contract.', 2),
  -- v.15 receive as a child
  ('δέχομαι', 'dechomai', 'G1209', 'To receive, accept, welcome — denoting active, willing reception rather than passive acquiescence. A child receives a gift with open hands, without negotiation or payment. To ''receive'' (dexētai) the kingdom of God means to accept it as pure gift with nothing to offer in return. This is the posture of grace: empty hands, humble dependence, joyful reception. The rich young ruler could not receive because his hands were full of possessions.', 3),
  -- v.21 one thing thou lackest
  ('ὑστερέω', 'hystereō', 'G5302', 'To lack, fall short, come behind — from hysteros (later, behind). The rich man, who has observed all the commandments, still falls short of one thing. The word implies he is running a race but has not yet reached the finish line. What he lacks is not another good work but total surrender — the willingness to release everything and follow. The ''one thing'' is not poverty per se but the undivided allegiance that poverty would demonstrate in his specific case.', 4),
  -- v.27 all things possible
  ('δυνατός', 'dynatos', 'G1415', 'Possible, powerful, able — from dynamis (power). Jesus declares that what is adynaton (impossible) for humans is dynatos (possible) for God. The word encompasses both God''s ability and his willingness. Salvation — liberating a person from the grip of wealth, sin, and self — is beyond human capacity but well within divine power. This is not a general statement about optimism but a specific declaration about God''s saving power in the face of human impossibility.', 5),
  -- v.38 cup
  ('ποτήριον', 'potērion', 'G4221', 'Cup, drinking vessel — metaphorically, one''s appointed lot or destiny. In OT prophetic imagery, the ''cup'' frequently refers to God''s wrath (Psalm 75:8; Isaiah 51:17, 22; Jeremiah 25:15-28). Jesus'' cup is the full measure of divine judgment against sin that he will drink on the cross. In Gethsemane he will pray ''take away this cup from me'' (14:36). The cup includes not just physical suffering but spiritual anguish — bearing the wrath of God as substitute for sinners.', 6),
  -- v.45 ransom
  ('λύτρον', 'lytron', 'G3083', 'Ransom, redemption price, payment for release — from lyō (to loose, set free). In the ancient world, a lytron was the price paid to free a prisoner of war or a slave. Used only here and Matthew 20:28 in the NT, it declares that Jesus'' death is a substitutionary payment. The preposition anti (''for/instead of'') establishes the exchange: his life in place of many lives. This is the doctrine of substitutionary atonement in seed form: Christ dies as ransom, sinners go free.', 7),
  -- v.52 faith made thee whole
  ('σῴζω', 'sōzō', 'G4982', 'To save, heal, deliver, make whole, preserve — the broadest salvation word in the NT, encompassing physical healing, spiritual salvation, and eschatological deliverance. When Jesus tells Bartimaeus ''thy faith hath saved thee'' (hē pistis sou sesōken se), the word simultaneously means ''healed'' (he received physical sight) and ''saved'' (he followed Jesus in the way). Bartimaeus'' faith achieves both: physical restoration and discipleship. The double meaning is intentional — Jesus'' salvation touches the whole person.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Mark' AND c.chapter_number = 10
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 5
    WHEN 2 THEN 9
    WHEN 3 THEN 15
    WHEN 4 THEN 21
    WHEN 5 THEN 27
    WHEN 6 THEN 38
    WHEN 7 THEN 45
    WHEN 8 THEN 52
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 divorce
  (2, 'Matthew 19:3', 1),
  -- v.4 bill of divorcement
  (4, 'Deuteronomy 24:1-4', 2),
  -- v.6 male and female
  (6, 'Genesis 1:27', 3),
  (6, 'Genesis 5:2', 4),
  -- v.7-8 one flesh
  (7, 'Genesis 2:24', 5),
  (8, 'Ephesians 5:31', 6),
  -- v.9 joined together
  (9, 'Matthew 19:6', 7),
  (9, 'Malachi 2:16', 8),
  -- v.11 adultery
  (11, 'Matthew 5:32', 9),
  (11, 'Luke 16:18', 10),
  -- v.14 suffer little children
  (14, 'Matthew 19:14', 11),
  (14, 'Luke 18:16', 12),
  -- v.15 receive as child
  (15, 'Matthew 18:3', 13),
  -- v.17 what shall I do
  (17, 'Matthew 19:16-22', 14),
  (17, 'Luke 18:18-23', 15),
  -- v.18 none good but God
  (18, 'Psalm 14:1-3', 16),
  (18, 'Romans 3:10-12', 17),
  -- v.19 commandments
  (19, 'Exodus 20:12-17', 18),
  (19, 'Deuteronomy 5:16-21', 19),
  -- v.21 sell all
  (21, 'Matthew 6:19-21', 20),
  (21, 'Luke 12:33', 21),
  -- v.25 camel through needle
  (25, 'Matthew 19:24', 22),
  -- v.27 all things possible
  (27, 'Genesis 18:14', 23),
  (27, 'Jeremiah 32:17', 24),
  (27, 'Luke 1:37', 25),
  -- v.30 hundredfold
  (30, 'Matthew 19:29', 26),
  (30, 'Luke 18:29-30', 27),
  -- v.31 first last
  (31, 'Matthew 20:16', 28),
  (31, 'Luke 13:30', 29),
  -- v.33-34 third passion prediction
  (33, 'Mark 8:31', 30),
  (33, 'Mark 9:31', 31),
  (34, 'Isaiah 50:6', 32),
  (34, 'Isaiah 53:3-5', 33),
  -- v.38 cup
  (38, 'Mark 14:36', 34),
  (38, 'Psalm 75:8', 35),
  (38, 'Isaiah 51:22', 36),
  -- v.43 minister/servant
  (43, 'Matthew 20:26-27', 37),
  (43, 'Mark 9:35', 38),
  -- v.45 ransom for many
  (45, 'Isaiah 53:10-12', 39),
  (45, 'Matthew 20:28', 40),
  (45, '1 Timothy 2:5-6', 41),
  (45, '1 Peter 1:18-19', 42),
  -- v.47 Son of David
  (47, '2 Samuel 7:12-16', 43),
  (47, 'Matthew 20:30-31', 44),
  -- v.52 faith saved/healed
  (52, 'Mark 5:34', 45),
  (52, 'Luke 18:42-43', 46)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Mark' AND c.chapter_number = 10
  AND v.verse_number = cr.verse_number;
