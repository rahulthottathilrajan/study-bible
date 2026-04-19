-- ═══════════════════════════════════════════════════════
-- MATTHEW CHAPTER 7 — Discerning Judgment, Persistent Prayer, and Obedient Living
-- 29 verses · Original text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  'Matthew Chapter 7 concludes Jesus''s Sermon on the Mount, offering profound ethical and theological instructions that summarize the practical implications of His teachings. The chapter begins with a warning against hypocritical judgment, emphasizing self-examination before critiquing others. It then transitions to the importance of discernment, urging believers not to expose sacred truths to those who would profane them. A central section encourages persistent prayer, assuring that God, as a loving Father, will respond generously. The chapter culminates in the Golden Rule, presented as the essence of the Law and the Prophets, and a stark contrast between two paths: the narrow way to life and the broad way to destruction. Jesus warns against false prophets, identifiable by their ''fruits,'' and concludes with the parable of the two builders, stressing that true discipleship is characterized by hearing and *doing* His words, not merely professing faith. This chapter serves as a powerful call to authentic, obedient, and discerning living, laying the foundation for Christian ethics and practical faith.',
  'Discerning Judgment, Persistent Prayer, and Obedient Living',
  'ποιέω (poieō)',
  'From an uncertain primary word, ''ποιέω'' means ''to make'' or ''to do.'' In Matthew 7, it is crucial for understanding the practical application of Jesus''s teachings. It signifies active obedience, producing good ''fruit'' (vv. 17-20), and building one''s life on a solid foundation through ''doing'' His sayings (vv. 24-27). This word underscores that true faith is not merely intellectual assent but a transformative commitment expressed through action.',
  '["Section 1 (vv.1-5): Warning Against Hypocritical Judgment","Section 2 (vv.6): Discerning the Holy","Section 3 (vv.7-11): The Efficacy of Persistent Prayer","Section 4 (vv.12): The Golden Rule: The Sum of the Law","Section 5 (vv.13-14): The Two Ways: Narrow and Broad","Section 6 (vv.15-20): Warning Against False Prophets and Their Fruits","Section 7 (vv.21-23): True Discipleship: Doing God''s Will","Section 8 (vv.24-29): The Parable of the Two Builders and Jesus''s Authority"]'
FROM books b WHERE b.name = 'Matthew';

-- Step 2: Insert all 29 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Judge not, that ye be not judged.',
   'Μὴ κρίνετε, ἵνα μὴ κριθῆτε.',
   'Mē krinete, hina mē krithēte.',
   'Jesus opens Matthew 7 with a direct command against judging. This is not a prohibition against all discernment or evaluation (as seen in vv. 6, 15-20), but rather against a censorious, hypocritical, and self-righteous judgment of others'' motives or spiritual state. The passive voice ''ἵνα μὴ κριθῆτε'' (''that you be not judged'') implies divine judgment, suggesting that the standard by which one judges others will be applied to oneself by God (cf. Rom 2:1-3). This teaching aligns with the broader theme of humility and self-examination in the Sermon on the Mount.',
   'This verse establishes a foundational principle of Christian ethics: the call to humility and self-reflection before evaluating others. It highlights the divine principle of reciprocity in judgment, where God''s standard for us will mirror the standard we apply to others. This does not preclude righteous discernment but condemns judgmentalism rooted in pride and hypocrisy.'),
  (2,
   'For with what judgment ye judge, ye shall be judged: and with what measure ye mete, it shall be measured to you again.',
   'ἐν ᾧ γὰρ κρίματι κρίνετε, κριθήσεσθε· καὶ ἐν ᾧ μέτρῳ μετρεῖτε, μετρηθήσεται ὑμῖν.',
   'En hō gar krimati krinete, krithēsesthē; kai en hō metrō metreite, metrēthēsetai hymin.',
   'This verse expands on the principle of verse 1, explaining the ''why'' behind the command. The ''judgment'' (κρίματι) and ''measure'' (μέτρῳ) one uses for others will be precisely the standard applied to oneself. This is a divine law of reciprocity, emphasizing that God''s justice is perfectly equitable. It serves as a powerful deterrent against harsh or unfair judgment, encouraging grace and understanding, knowing that such will be returned (cf. Mark 4:24; Luke 6:38). The implication is a call to mercy and compassion.',
   'The principle of divine reciprocity is clearly articulated here: the standard of judgment and measure we apply to others will be applied to us by God. This underscores the importance of mercy, forgiveness, and grace in our interactions, as these qualities will be reflected in God''s dealings with us. It''s a call to embody the character of God in our relationships.'),
  (3,
   'And why beholdest thou the mote that is in thy brother’s eye, but considerest not the beam that is in thine own eye?',
   'Τί δὲ βλέπεις τὸ κάρφος τὸ ἐν τῷ ὀφθαλμῷ τοῦ ἀδελφοῦ σου, τὴν δὲ ἐν τῷ σῷ ὀφθαλμῷ δοκὸν οὐ κατανοεῖς;',
   'Ti de blepeis to karphos to en tō ophthalmo tou adelphou sou, tēn de en tō sō ophthalmo dokon ou katanoeis?',
   'Jesus uses a vivid hyperbole to illustrate hypocritical judgment: seeing a ''speck'' (κάρφος, a small splinter or straw) in another''s eye while ignoring a ''beam'' (δοκόν, a large timber) in one''s own. This imagery powerfully exposes the absurdity and spiritual blindness of those who are quick to criticize minor faults in others while overlooking their own significant moral failings. The ''brother'' (ἀδελφοῦ) implies a fellow believer, making the critique even sharper. This passage is a call to radical self-examination and humility.',
   'This verse profoundly illustrates the sin of hypocrisy, where one is acutely aware of minor faults in others (''speck'') but oblivious to major sins in oneself (''beam''). It teaches that true spiritual discernment begins with self-assessment and repentance, emphasizing that our own moral integrity is a prerequisite for helping others. It''s a call to humility and genuine self-awareness before God.'),
  (4,
   'Or how wilt thou say to thy brother, Let me pull out the mote out of thine eye; and, behold, a beam is in thine own eye?',
   'ἢ πῶς ἐρεῖς τῷ ἀδελφῷ σου, Ἄφες ἐκβάλω τὸ κάρφος ἐκ τοῦ ὀφθαλμοῦ σου, καὶ ἰδοὺ ἡ δοκὸς ἐν τῷ ὀφθαλμῷ σοῦ;',
   'Ē pōs ereis tō adelphō sou, Aphes ekbalō to karphos ek tou ophthalmo sou, kai idou hē dokos en tō ophthalmo sou?',
   'This verse continues the rhetorical question, highlighting the utter impossibility and absurdity of attempting to ''help'' a brother with a minor fault while being burdened by a much greater one. The phrase ''Let me pull out'' (Ἄφες ἐκβάλω) suggests a presumptuous and self-righteous attitude. Jesus''s point is that one''s own moral vision is so impaired by their ''beam'' that any attempt to correct another would be both ineffective and deeply offensive. It underscores the need for personal integrity as a foundation for ministry and counsel.',
   'This verse exposes the spiritual blindness and ineffectiveness of attempting to correct others while living in unaddressed sin. It teaches that genuine spiritual help can only come from a place of personal purity and humility, not from a position of hypocrisy. Our ability to minister effectively to others is directly tied to our own walk with God and our willingness to confront our own shortcomings.'),
  (5,
   'Thou hypocrite, first cast out the beam out of thine own eye; and then shalt thou see clearly to cast out the mote out of thy brother’s eye.',
   'ὑποκριτά, ἔκβαλε πρῶτον ἐκ τοῦ ὀφθαλμοῦ σοῦ τὴν δοκόν, καὶ τότε διαβλέψεις ἐκβαλεῖν τὸ κάρφος ἐκ τοῦ ὀφθαλμοῦ τοῦ ἀδελφοῦ σου.',
   'Hypokrita, ekbale prōton ek tou ophthalmo sou tēn dokon, kai tote diablepseis ekbalein to karphos ek tou ophthalmo tou adelphou sou.',
   'Jesus directly labels such a person a ''hypocrite'' (ὑποκριτά), a term often used for religious leaders who prioritize outward appearance over inner righteousness. The command is clear: ''first cast out the beam'' from one''s own eye. Only after this radical self-purification will one ''see clearly'' (διαβλέψεις) to help a brother. This verse does not forbid helping others but establishes the proper order: self-correction precedes brotherly correction. It emphasizes the necessity of personal holiness for effective spiritual leadership and genuine love (cf. Gal 6:1).',
   'This verse delivers a direct indictment against hypocrisy, demanding radical self-purification as a prerequisite for ministering to others. It teaches that true spiritual clarity and effectiveness in helping a brother come only after confronting and removing one''s own significant sins. This principle underscores the importance of personal holiness and humility in all forms of Christian service and fellowship.'),
  (6,
   'Give not that which is holy unto the dogs, neither cast ye your pearls before swine, lest they trample them under their feet, and turn again and rend you.',
   'Μὴ δῶτε τὸ ἅγιον τοῖς κυσίν, μηδὲ βάλητε τοὺς μαργαρίτας ὑμῶν ἔμπροσθεν τῶν χοίρων, μήποτε καταπατήσωσιν αὐτοὺς ἐν τοῖς ποσὶν αὐτῶν καὶ στραφέντες ῥήξωσιν ὑμᾶς.',
   'Mē dōte to hagion tois kysin, mēde balēte tous margaritas hymōn emprosthen tōn choirōn, mēpote katapatēsōsin autous en tois posin autōn kai straphentes rhēxōsin hymas.',
   'This verse, often misunderstood, is a call for discernment, not judgment. ''That which is holy'' (τὸ ἅγιον) likely refers to sacred things, perhaps the sacrificial meat or the gospel message itself. ''Dogs'' (κυσίν) and ''swine'' (χοίρων) were terms for unclean animals, symbolizing those who are spiritually hostile, unappreciative, or who would deliberately profane sacred truths. Jesus warns against casting ''pearls'' (μαργαρίτας, precious truths of the kingdom) before such individuals, lest they ''trample them under their feet'' and ''turn again and rend you.'' This teaches wise stewardship of the gospel and spiritual truths, recognizing that not all are receptive or worthy of receiving them at certain stages (cf. Prov 23:9).',
   'This verse teaches the critical importance of spiritual discernment in sharing sacred truths. It warns against indiscriminately offering the gospel or profound spiritual insights to those who are hostile, unappreciative, or who would profane them. This protects the sanctity of divine revelation and the messenger, emphasizing that wisdom dictates when and to whom the ''pearls'' of the kingdom should be presented.'),
  (7,
   'Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you:',
   'Αἰτεῖτε, καὶ δοθήσεται ὑμῖν· ζητεῖτε, καὶ εὑρήσετε· κρούετε, καὶ ἀνοιγήσεται ὑμῖν.',
   'Aiteite, kai dothēsetai hymin; zēteite, kai heurēsete; krouete, kai anoigēsetai hymin.',
   'Jesus shifts from discernment to encouragement in prayer. The three imperatives—''Ask'' (Αἰτεῖτε), ''Seek'' (ζητεῖτε), and ''Knock'' (κρούετε)—are in the present tense, indicating continuous, persistent action. The corresponding promises—''it shall be given,'' ''you shall find,'' ''it shall be opened''—are in the future passive, implying divine action. This sequence suggests increasing intensity and commitment in prayer, moving from a general request to an earnest search, and finally to persistent knocking at a closed door. It''s a powerful assurance of God''s responsiveness to sincere and persistent prayer (cf. Luke 11:9-10).',
   'This verse provides a foundational promise regarding prayer, emphasizing its efficacy through persistent ''asking, seeking, and knocking.'' It assures believers of God''s responsiveness to their earnest petitions, highlighting the active role of faith in prayer. This teaching underscores the accessibility of God and His willingness to engage with His children, encouraging a life of continuous communion and dependence.'),
  (8,
   'For every one that asketh receiveth; and he that seeketh findeth; and to him that knocketh it shall be opened.',
   'πᾶς γὰρ ὁ αἰτῶν λαμβάνει, καὶ ὁ ζητῶν εὑρίσκει, καὶ τῷ κρούοντι ἀνοιγήσεται.',
   'Pas gar ho aitōn lambanei, kai ho zētōn heuriskei, kai tō krouonti anoigēsetai.',
   'This verse reinforces the promises of verse 7, stating them as universal truths: ''For everyone who asks receives, and he who seeks finds, and to him who knocks it will be opened.'' The present tense verbs (''asks,'' ''receives,'' ''seeks,'' ''finds,'' ''knocks,'' ''will be opened'') convey a continuous reality and certainty. This is not a blanket promise for every selfish desire, but rather a guarantee within the context of seeking God''s kingdom and righteousness (Matt 6:33) and praying according to His will (1 John 5:14-15). It underscores God''s faithfulness and generosity.',
   'This verse reiterates and solidifies the promise of answered prayer, affirming that God consistently responds to those who earnestly seek Him. It emphasizes the reliability of God''s character and His commitment to His children. This truth encourages unwavering faith and persistence in prayer, knowing that God''s promises are steadfast, though His answers may not always align with our immediate expectations.'),
  (9,
   'Or what man is there of you, whom if his son ask bread, will he give him a stone?',
   'ἢ τίς ἐστιν ἐξ ὑμῶν ἄνθρωπος, ὃν ἐὰν αἰτήσῃ ὁ υἱὸς αὐτοῦ ἄρτον, μὴ λίθον ἐπιδώσει αὐτῷ;',
   'Ē tis estin ex hymōn anthrōpos, hon ean aitēsē ho huios autou arton, mē lithon epidōsei autō?',
   'Jesus uses a common-sense analogy from human parenting to illustrate God''s character. He asks, ''What man among you, if his son asks for bread, will give him a stone?'' The rhetorical question highlights the absurdity of such an action. A stone might resemble a loaf of bread, but it offers no nourishment and would be cruel. This comparison sets up the greater truth about God''s perfect fatherly care, implying that if imperfect human fathers know how to give good gifts, God''s generosity is infinitely greater.',
   'This verse uses a human analogy to reveal God''s benevolent fatherly nature. It teaches that just as no loving earthly father would give a harmful substitute for a child''s need, God, our perfect heavenly Father, will always provide what is truly good and beneficial for His children. This reinforces trust in God''s wisdom and goodness in answering prayer.'),
  (10,
   'Or if he ask a fish, will he give him a serpent?',
   'ἢ καὶ ἐὰν ἰχθὺν αἰτήσῃ, μὴ ὄφιν ἐπιδώσει αὐτῷ;',
   'Ē kai ean ichthyn aitēsē, mē ophin epidōsei autō?',
   'Continuing the analogy, Jesus asks if a father would give a serpent instead of a fish. A serpent, like a stone, is not only useless but actively harmful. This further emphasizes the contrast between a loving father''s provision and a cruel deception. The point is to build confidence in God''s good intentions and perfect provision. He will never give something harmful or deceptive when His children ask for good things. This reinforces the assurance of God''s benevolent character.',
   'This verse further illustrates God''s perfect goodness and protective care. It teaches that God will never respond to our genuine needs with something harmful or deceptive. This truth deepens our confidence in His character, assuring us that His answers to prayer are always motivated by love and aimed at our ultimate good, even if they differ from our immediate desires.'),
  (11,
   'If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?',
   'εἰ οὖν ὑμεῖς πονηροὶ ὄντες οἴδατε δόματα ἀγαθὰ διδόναι τοῖς τέκνοις ὑμῶν, πόσῳ μᾶλλον ὁ Πατὴρ ὑμῶν ὁ ἐν τοῖς οὐρανοῖς δώσει ἀγαθὰ τοῖς αἰτοῦσιν αὐτόν;',
   'Ei oun hymeis ponēroi ontes oidate domata agatha didonai tois teknois hymōn, posō mallon ho Patēr hymōn ho en tois ouranois dōsei agatha tois aitousin auton?',
   'This verse draws the conclusion from the previous analogies. Even ''evil'' (πονηροὶ) human beings, flawed by sin, possess enough natural love to give ''good gifts'' (δόματα ἀγαθὰ) to their children. The phrase ''πόσῳ μᾶλλον'' (''how much more'') highlights the vast superiority of God''s goodness. God, as ''your Father who is in heaven,'' will certainly give ''good things'' (ἀγαθὰ) to those who ask Him. Luke''s parallel (Luke 11:13) specifies ''the Holy Spirit'' as the ultimate ''good gift,'' indicating that God''s provision extends beyond material needs to spiritual blessings.',
   'This verse culminates the teaching on prayer by contrasting imperfect human fatherhood with God''s perfect fatherhood. It teaches that God, being infinitely good and loving, will ''how much more'' generously bestow ''good things'' (including the Holy Spirit) upon those who ask Him. This truth forms the bedrock of our confidence in prayer, assuring us of God''s boundless grace and perfect provision for His children.'),
  (12,
   'Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets.',
   'Πάντα οὖν ὅσα ἐὰν θέλητε ἵνα ποιῶσιν ὑμῖν οἱ ἄνθρωποι, οὕτως καὶ ὑμεῖς ποιεῖτε αὐτοῖς· οὗτος γάρ ἐστιν ὁ νόμος καὶ οἱ προφῆται.',
   'Panta oun hosa ean thelēte hina poiōsin hymin hoi anthrōpoi, houtōs kai hymeis poieite autois; houtos gar estin ho nomos kai hoi prophētai.',
   'This verse presents the famous ''Golden Rule,'' a positive formulation of reciprocal love and justice. Unlike negative formulations (''Do not do to others what you would not want them to do to you''), Jesus commands active, proactive love: ''Whatever you wish that others would do to you, do also to them.'' This principle is declared to be the essence of ''the Law and the Prophets,'' meaning it encapsulates the spirit and intention of the entire Old Testament ethical teaching. It''s a comprehensive summary of one''s duty to neighbor, flowing from love for God (cf. Rom 13:8-10).',
   'The Golden Rule is presented as the summation of all ethical teaching in the Old Testament, encapsulating the essence of the Law and the Prophets. It teaches a proactive, empathetic standard for human interaction, demanding that we treat others with the same love, respect, and consideration we desire for ourselves. This principle is fundamental to Christian ethics, reflecting God''s character and the nature of true neighborly love.'),
  (13,
   'Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:',
   'Εἰσέλθετε διὰ τῆς στενῆς πύλης· ὅτι πλατεῖα ἡ πύλη καὶ εὐρύχωρος ἡ ὁδὸς ἡ ἀπάγουσα εἰς τὴν ἀπώλειαν, καὶ πολλοί εἰσιν οἱ εἰσερχόμενοι δι’ αὐτῆς·',
   'Eiselthete dia tēs stenēs pylēs; hoti plateia hē pylē kai eurychōros hē hodos hē apagousa eis tēn apōleian, kai polloi eisin hoi eiserchomenoi di’ autēs;',
   'Jesus introduces the metaphor of ''two ways'' and ''two gates.'' The command ''Enter through the narrow gate'' (Εἰσέλθετε διὰ τῆς στενῆς πύλης) calls for a decisive choice. The ''wide gate'' (πλατεῖα ἡ πύλη) and ''broad way'' (εὐρύχωρος ἡ ὁδὸς) are easy to find and follow, leading to ''destruction'' (ἀπώλειαν). This path is characterized by its popularity (''many there be which go in thereat''). This imagery speaks to the ease of following worldly desires and conventional wisdom, which ultimately leads away from God (cf. Deut 30:19).',
   'This verse presents a stark choice between two paths, symbolizing the fundamental decision for or against God''s kingdom. The ''wide gate'' and ''broad way'' represent a life of ease, conformity to worldly values, and spiritual indifference, leading to eternal ''destruction.'' It underscores the gravity of human choices and the reality of eternal consequences, calling for a deliberate commitment to Christ.'),
  (14,
   'Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.',
   'τί στενὴ ἡ πύλη καὶ τεθλιμμένη ἡ ὁδὸς ἡ ἀπάγουσα εἰς τὴν ζωήν, καὶ ὀλίγοι εἰσὶν οἱ εὑρίσκοντες αὐτήν.',
   'Ti stenē hē pylē kai tethlimmenē hē hodos hē apagousa eis tēn zōēn, kai oligoi eisin hoi heuriskontes autēn.',
   'In contrast to the broad way, the ''gate is narrow'' (στενὴ ἡ πύλη) and the ''way is hard'' or ''difficult'' (τεθλιμμένη ἡ ὁδὸς), leading to ''life'' (ζωήν). The Greek ''τεθλιμμένη'' can mean ''pressed together,'' ''afflicted,'' or ''troubled,'' suggesting that the path of discipleship involves challenges and self-denial. Significantly, ''few there be that find it'' (ὀλίγοι εἰσὶν οἱ εὑρίσκοντες αὐτήν). This highlights the counter-cultural nature of true discipleship and the necessity of intentional effort and commitment to follow Christ (cf. Luke 13:24).',
   'This verse describes the ''narrow gate'' and ''hard way'' that lead to eternal ''life.'' It teaches that genuine discipleship is a challenging, counter-cultural path requiring intentional commitment, self-denial, and perseverance. The ''few'' who find it emphasize that salvation is not a popular choice but a deliberate response to God''s call, highlighting the exclusivity of Christ as the only way to life.'),
  (15,
   'Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.',
   'Προσέχετε ἀπὸ τῶν ψευδοπροφητῶν, οἵτινες ἔρχονται πρὸς ὑμᾶς ἐν ἐνδύμασι προβάτων, ἔσωθεν δέ εἰσιν λύκοι ἅρπαγες.',
   'Prosechete apo tōn pseudoprophētōn, hoitines erchontai pros hymas en endymasi probatōn, esōthen de eisin lykoi harpages.',
   'Jesus issues a solemn warning: ''Beware of false prophets'' (Προσέχετε ἀπὸ τῶν ψευδοπροφητῶν). These individuals appear harmless, coming ''in sheep''s clothing'' (ἐν ἐνδύμασι προβάτων), mimicking true believers or spiritual leaders. However, ''inwardly they are ravening wolves'' (ἔσωθεν δέ εἰσιν λύκοι ἅρπαγες), intent on devouring and destroying the flock. This warning is crucial for the church throughout history, emphasizing the need for spiritual discernment and vigilance against deceptive teachings and leaders (cf. Acts 20:29-30; 2 Pet 2:1-3).',
   'This verse warns against the insidious danger of ''false prophets'' who outwardly appear righteous but inwardly harbor destructive intentions. It teaches the necessity of spiritual discernment within the church, as these deceivers seek to mislead and harm believers. This highlights the ongoing spiritual battle and the importance of adhering to sound doctrine and recognizing true spiritual authority.'),
  (16,
   'Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?',
   'ἀπὸ τῶν καρπῶν αὐτῶν ἐπιγνώσεσθε αὐτούς. μήτι συλλέγουσιν ἀπὸ ἀκανθῶν σταφυλὰς ἢ ἀπὸ τριβόλων σῦκα;',
   'Apo tōn karpōn autōn epignōsesthē autous. Mēti syllegousin apo akanthōn staphylas ē apo tribolōn syka?',
   'Jesus provides the infallible test for identifying false prophets: ''You will know them by their fruits'' (ἀπὸ τῶν καρπῶν αὐτῶν ἐπιγνώσεσθε αὐτούς). He uses another rhetorical question, ''Do people gather grapes from thornbushes, or figs from thistles?'' to emphasize that a tree''s nature is revealed by its fruit. Similarly, a person''s true character, beliefs, and spiritual source are revealed not by their words or outward appearance, but by their actions, lifestyle, and the spiritual impact they have on others (cf. James 3:12). This ''fruit'' includes their doctrine, character, and the results of their ministry.',
   'This verse provides the definitive criterion for discerning true and false prophets: their ''fruits.'' It teaches that genuine spiritual authority and truth are evidenced by consistent righteous character, sound doctrine, and positive spiritual impact, not merely by outward claims or charisma. This principle calls for careful evaluation of leaders and teachings based on their observable outcomes and alignment with God''s Word.'),
  (17,
   'Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.',
   'οὕτως πᾶν δένδρον ἀγαθὸν καρποὺς καλοὺς ποιεῖ, τὸ δὲ σαπρὸν δένδρον καρποὺς πονηροὺς ποιεῖ.',
   'Houtōs pan dendron agathon karpous kalous poiei, to de sapron dendron karpous ponērous poiei.',
   'This verse further clarifies the ''fruit'' principle. ''Every good tree bears good fruit, but a bad tree bears bad fruit.'' The term ''good'' (ἀγαθὸν) refers to intrinsic goodness, while ''bad'' or ''corrupt'' (σαπρὸν) implies rottenness or worthlessness. This is a natural law applied to spiritual life: one''s inner nature inevitably manifests in outward actions. A true prophet or believer, indwelt by the Holy Spirit, will produce ''good fruit'' (Gal 5:22-23), while a false one will produce ''bad fruit'' (e.g., deception, division, immorality).',
   'This verse establishes a spiritual law: a person''s inner nature dictates the ''fruit'' they produce. It teaches that genuine faith and a transformed heart will inevitably manifest in ''good fruit'' (righteous character and actions), while a corrupt heart will produce ''bad fruit.'' This principle underscores the importance of inner spiritual transformation as the source of outward godly living.'),
  (18,
   'A good tree cannot bring forth evil fruit, neither can a corrupt tree bring forth good fruit.',
   'οὐ δύναται δένδρον ἀγαθὸν καρποὺς πονηροὺς ἐνεγκεῖν, οὐδὲ δένδρον σαπρὸν καρποὺς καλοὺς ποιεῖν.',
   'Ou dynatai dendron agathon karpous ponērous enenkein, oude dendron sapron karpous kalous poiein.',
   'This verse reinforces the absolute nature of the principle: ''A good tree cannot bear bad fruit, nor can a bad tree bear good fruit.'' There is an inherent impossibility for a tree to act contrary to its nature. This means that true believers, genuinely transformed by Christ, cannot consistently produce evil fruit, nor can false teachers, whose hearts are corrupt, consistently produce genuinely good fruit. This provides a clear, unwavering standard for spiritual assessment, emphasizing consistency over isolated acts (cf. Matt 12:33-35).',
   'This verse asserts the absolute impossibility of a good nature producing bad fruit, or vice-versa. It teaches that spiritual authenticity is revealed by consistent character and actions. True believers, indwelt by the Spirit, will bear good fruit, while those with corrupt hearts will not. This principle provides a clear, unwavering standard for discerning spiritual truth and identifying genuine faith.'),
  (19,
   'Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.',
   'πᾶν δένδρον μὴ ποιοῦν καρπὸν καλὸν ἐκκόπτεται καὶ εἰς πῦρ βάλλεται.',
   'Pan dendron mē poioun karpon kalon ekkoptetai kai eis pyr balletai.',
   'The consequence of bearing bad fruit, or no good fruit at all, is severe: ''Every tree that does not bear good fruit is cut down and thrown into the fire.'' This imagery speaks of divine judgment and eternal condemnation. It''s a sobering reminder that mere profession of faith is insufficient; genuine discipleship requires active fruit-bearing, demonstrating a transformed life. This echoes John the Baptist''s warning (Matt 3:10) and emphasizes the urgency of repentance and genuine conversion.',
   'This verse delivers a solemn warning of divine judgment for those who fail to produce ''good fruit.'' It teaches that outward profession of faith is insufficient; true discipleship is evidenced by a transformed life and righteous actions. Those who do not bear good fruit face eternal condemnation, underscoring the necessity of genuine repentance and active obedience to Christ.'),
  (20,
   'Wherefore by their fruits ye shall know them.',
   'ἄρα γε ἀπὸ τῶν καρπῶν αὐτῶν ἐπιγνώσεσθε αὐτούς.',
   'Ara ge apo tōn karpōn autōn epignōsesthē autous.',
   'This verse serves as a conclusive summary, reiterating the central point: ''Thus you will recognize them by their fruits.'' The repetition emphasizes the reliability and importance of this test. It''s not about judging motives, which only God can truly know, but about discerning the observable, consistent patterns of behavior, teaching, and life outcomes that reveal a person''s true spiritual allegiance and character. This principle applies not only to prophets but to all who claim to follow Christ.',
   'This verse powerfully reiterates the ''fruit'' principle as the definitive means of discerning spiritual authenticity. It teaches that a person''s true character and spiritual allegiance are revealed through their consistent actions, teachings, and the impact of their lives. This principle applies universally, urging believers to evaluate all claims of faith by their tangible, observable ''fruits.'''),
  (21,
   'Not every one that saith unto me, Lord, Lord, shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.',
   'Οὐ πᾶς ὁ λέγων μοι, Κύριε Κύριε, εἰσελεύσεται εἰς τὴν βασιλείαν τῶν οὐρανῶν, ἀλλ’ ὁ ποιῶν τὸ θέλημα τοῦ Πατρός μου τοῦ ἐν οὐρανοῖς.',
   'Ou pas ho legōn moi, Kyrie Kyrie, eiseleusetai eis tēn basileian tōn ouranōn, all’ ho poiōn to thelēma tou Patros mou tou en ouranois.',
   'Jesus delivers a stark warning against superficial faith. Not everyone who merely professes ''Lord, Lord'' (Κύριε Κύριε) will ''enter the kingdom of heaven.'' True entry is reserved for ''the one who does the will of my Father who is in heaven.'' This verse directly challenges the idea that verbal profession alone is sufficient for salvation. It emphasizes that genuine faith is demonstrated by active obedience to God''s will, aligning with the theme of ''doing'' throughout the chapter (vv. 12, 24-27). This is a cornerstone of Christian discipleship.',
   'This verse is a foundational statement on the nature of true salvation and entry into God''s kingdom. It teaches that mere verbal profession of faith (''Lord, Lord'') is insufficient; genuine saving faith is evidenced by active obedience to the will of God the Father. This underscores the necessity of practical righteousness and a transformed life as the fruit of true conversion, distinguishing authentic discipleship from superficial religiosity.'),
  (22,
   'Many will say to me in that day, Lord, Lord, have we not prophesied in thy name? and in thy name have cast out devils? and in thy name done many wonderful works?',
   'πολλοὶ ἐροῦσίν μοι ἐν ἐκείνῃ τῇ ἡμέρᾳ, Κύριε Κύριε, οὐ τῷ σῷ ὀνόματι ἐπροφητεύσαμεν, καὶ τῷ σῷ ὀνόματι δαιμόνια ἐξεβάλομεν, καὶ τῷ σῷ ὀνόματι δυνάμεις πολλὰς ἐποιήσαμεν;',
   'Polloi erousin moi en ekeinē tē hēmerā, Kyrie Kyrie, ou tō sō onomati eprophēteusamen, kai tō sō onomati daimonia exebalomen, kai tō sō onomati dynameis pollas epoiēsamen?',
   'Jesus describes a future judgment scene where ''many'' will appeal to their impressive spiritual works: prophesying, casting out demons, and performing ''many mighty works'' (δυνάμεις πολλὰς) – all done ''in your name.'' This highlights the danger of relying on spiritual gifts or outward ministry achievements as proof of salvation. These works, even if seemingly powerful, are not necessarily indicative of a genuine relationship with Christ or obedience to God''s will. The emphasis is on the ''will of the Father,'' not on self-initiated or self-serving spiritual displays.',
   'This verse reveals a sobering truth about the Day of Judgment: many will appeal to their spiritual works and gifts as evidence of their faith. It teaches that even impressive spiritual activities, performed ''in Jesus'' name,'' do not guarantee salvation if they are not rooted in genuine obedience to God''s will. This warns against relying on outward religious performance rather than a true, submissive relationship with Christ.'),
  (23,
   'And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.',
   'καὶ τότε ὁμολογήσω αὐτοῖς ὅτι Οὐδέποτε ἔγνων ὑμᾶς· ἀποχωρεῖτε ἀπ’ ἐμοῦ οἱ ἐργαζόμενοι τὴν ἀνομίαν.',
   'Kai tote homologēsō autois hoti Oudepote egnōn hymas; apochōreite ap’ emou hoi ergazomenoi tēn anomian.',
   'The terrifying response from Jesus is, ''I never knew you'' (Οὐδέποτε ἔγνων ὑμᾶς). This is not a lack of intellectual knowledge but a denial of an intimate, saving relationship. He then commands them, ''Depart from me, you workers of lawlessness'' (οἱ ἐργαζόμενοι τὴν ἀνομίαν). ''Lawlessness'' (ἀνομίαν) signifies a life lived in defiance of God''s moral law, despite outward religious acts. This verse underscores that salvation is about a personal relationship with Christ, characterized by obedience, not merely about performing religious duties or possessing spiritual power (cf. Ps 6:8).',
   'This verse reveals the ultimate consequence for those who profess Christ but do not obey Him: Jesus''s denial of a saving relationship (''I never knew you'') and eternal separation (''Depart from me''). It teaches that true salvation is founded on an intimate, obedient relationship with Christ, not on religious works or spiritual gifts. It exposes ''lawlessness'' as the antithesis of genuine faith, leading to eternal condemnation.'),
  (24,
   'Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock:',
   'Πᾶς οὖν ὅστις ἀκούει μου τοὺς λόγους τούτους καὶ ποιεῖ αὐτούς, ὁμοιωθήσεται ἀνδρὶ φρονίμῳ, ὅστις ᾠκοδόμησεν αὐτοῦ τὴν οἰκίαν ἐπὶ τὴν πέτραν.',
   'Pas oun hostis akouei mou tous logous toutous kai poiei autous, homoiōthēsetai andri phronimō, hostis ōkodomēsen autou tēn oikian epi tēn petran.',
   'Jesus concludes the Sermon on the Mount with the parable of the two builders, emphasizing the critical importance of ''doing'' His words. The ''wise man'' (ἀνδρὶ φρονίμῳ) is one who ''hears these words of mine and does them'' (ἀκούει μου τοὺς λόγους τούτους καὶ ποιεῖ αὐτούς). This active obedience is likened to building a house ''on the rock'' (ἐπὶ τὴν πέτραν), signifying a firm, stable foundation. This parable serves as a powerful summary of the entire sermon, calling for practical application of His teachings (cf. James 1:22-25).',
   'This verse introduces the parable of the two builders, teaching that true wisdom lies in hearing and actively ''doing'' Jesus''s words. Building one''s life ''on the rock'' symbolizes a foundation of obedient faith, which alone can withstand the trials of life and the judgment to come. This underscores that genuine discipleship is characterized by practical application of Christ''s teachings, not mere intellectual assent.'),
  (25,
   'And the rain descended, and the floods came, and the winds blew, and beat upon that house; and it fell not: for it was founded upon a rock.',
   'καὶ κατέβη ἡ βροχὴ καὶ ἦλθον οἱ ποταμοὶ καὶ ἔπνευσαν οἱ ἄνεμοι καὶ προσέπεσαν τῇ οἰκίᾳ ἐκείνῃ, καὶ οὐκ ἔπεσεν· τεθεμελίωτο γὰρ ἐπὶ τὴν πέτραν.',
   'Kai katebē hē brochē kai ēlthen hoi potamoi kai epneusan hoi anemoi kai prosepesan tē oikiā ekeinē, kai ouk epesen; tethemeliōto gar epi tēn petran.',
   'The wise builder''s house endures the storm—''the rain descended, and the floods came, and the winds blew, and beat upon that house.'' These elements symbolize the inevitable trials, temptations, and judgments of life. The house ''did not fall, for it was founded on the rock.'' This illustrates the stability and security that comes from a life built on obedience to Christ''s teachings. Such a foundation provides resilience and steadfastness in the face of adversity, both in this life and at the final judgment.',
   'This verse illustrates the resilience of a life built on obedient faith in Christ. The ''rain, floods, and winds'' symbolize the inevitable trials and judgments of life. It teaches that a foundation of ''doing'' Jesus''s words provides unwavering stability and security, enabling believers to withstand adversity and stand firm in their faith, ultimately enduring to eternal life.'),
  (26,
   'And every one that heareth these sayings of mine, and doeth them not, shall be likened unto a foolish man, which built his house upon the sand:',
   'καὶ πᾶς ὁ ἀκούων μου τοὺς λόγους τούτους καὶ μὴ ποιῶν αὐτοὺς ὁμοιωθήσεται ἀνδρὶ μωρῷ, ὅστις ᾠκοδόμησεν αὐτοῦ τὴν οἰκίαν ἐπὶ τὴν ἄμμον.',
   'Kai pas ho akouōn mou tous logous toutous kai mē poiōn autous homoiōthēsetai andri mōrō, hostis ōkodomēsen autou tēn oikian epi tēn ammon.',
   'In stark contrast, the ''foolish man'' (ἀνδρὶ μωρῷ) is one who ''hears these words of mine and does not do them'' (ἀκούων μου τοὺς λόγους τούτους καὶ μὴ ποιῶν αὐτοὺς). This person builds his house ''on the sand'' (ἐπὶ τὴν ἄμμον), a seemingly easier but ultimately unstable foundation. This represents a superficial or intellectual assent to Christ''s teachings without practical application or obedience. Such a life lacks true spiritual depth and is vulnerable to collapse when tested.',
   'This verse introduces the ''foolish man'' who hears Jesus''s words but fails to ''do'' them, building his life ''on the sand.'' It teaches that mere intellectual knowledge or passive hearing of God''s truth, without practical obedience, constitutes a dangerously unstable foundation. This highlights the peril of superficial faith that lacks genuine transformation and commitment to Christ''s commands.'),
  (27,
   'And the rain descended, and the floods came, and the winds blew, and beat upon that house; and it fell: and great was the fall of it.',
   'καὶ κατέβη ἡ βροχὴ καὶ ἦλθον οἱ ποταμοὶ καὶ ἔπνευσαν οἱ ἄνεμοι καὶ προσέκοψαν τῇ οἰκίᾳ ἐκείνῃ, καὶ ἔπεσεν, καὶ ἦν ἡ πτῶσις αὐτῆς μεγάλη.',
   'Kai katebē hē brochē kai ēlthen hoi potamoi kai epneusan hoi anemoi kai prosekopsan tē oikiā ekeinē, kai epesen, kai ēn hē ptōsis autēs megalē.',
   'When the same storm (trials, judgment) comes upon the foolish man''s house, it ''fell, and great was its fall.'' The collapse is total and devastating. This illustrates the ultimate failure and eternal consequences of a life built on a foundation of disobedience or mere profession without practice. The ''great fall'' signifies not just temporal ruin but eternal condemnation, emphasizing the eternal stakes of how one responds to Jesus''s words (cf. Heb 10:26-31).',
   'This verse vividly portrays the catastrophic collapse of a life built on a foundation of disobedience. When trials and judgment inevitably come, the ''great fall'' signifies not only temporal ruin but eternal condemnation. It teaches that a superficial faith, devoid of practical obedience, cannot withstand divine scrutiny, leading to ultimate spiritual destruction and emphasizing the eternal consequences of rejecting Christ''s call to action.'),
  (28,
   'And it came to pass, when Jesus had ended these sayings, the people were astonished at his doctrine:',
   'Καὶ ἐγένετο ὅτε ἐτέλεσεν ὁ Ἰησοῦς τοὺς λόγους τούτους, ἐξεπλήσσοντο οἱ ὄχλοι ἐπὶ τῇ διδαχῇ αὐτοῦ·',
   'Kai egeneto hote etelesen ho Iēsous tous logous toutous, exeplēssonto hoi ochloi epi tē didachē autou;',
   'This verse marks the conclusion of the Sermon on the Mount. The crowd''s reaction is one of astonishment (ἐξεπλήσσοντο) at Jesus''s ''teaching'' (διδαχῇ). This astonishment was not merely intellectual appreciation but a profound impact on their understanding. The Greek word ''ἐξεπλήσσοντο'' implies being ''struck out of one''s senses'' or ''overwhelmed.'' This reaction sets the stage for the subsequent demonstration of Jesus''s authority through miracles (Matt 8-9).',
   NULL),
  (29,
   'For he taught them as one having authority, and not as the scribes.',
   'ἦν γὰρ διδάσκων αὐτοὺς ὡς ἐξουσίαν ἔχων, καὶ οὐχ ὡς οἱ γραμματεῖς.',
   'Ēn gar didaskōn autous hōs exousian echōn, kai ouch hōs hoi grammateis.',
   'The reason for their astonishment is explained: Jesus ''taught them as one having authority'' (ὡς ἐξουσίαν ἔχων), ''and not as the scribes.'' The scribes taught by quoting previous rabbis and traditions, relying on external authority. Jesus, however, spoke with inherent, divine authority, directly proclaiming God''s will and interpreting the Law with ultimate truth. This distinction highlights Jesus''s unique identity as the Son of God and the ultimate revealer of divine truth, setting Him apart from all human teachers (cf. John 7:46).',
   'This verse highlights Jesus''s unique and divine authority as a teacher, contrasting Him sharply with the scribes who relied on tradition. It teaches that Jesus''s words carry inherent divine weight and ultimate truth, demanding obedience and reverence. This underscores His identity as the Son of God and the supreme revealer of God''s will, establishing His teachings as the ultimate standard for faith and life.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Matthew' AND c.chapter_number = 7;

-- Step 3: Word Studies for key verses

-- Verse 3
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κάρφος', 'karphos', 'G2543', 'Derived from ''κρέπω'' (krepō, to wither), ''κάρφος'' refers to a dry twig, splinter, or speck. In this context, it denotes a small, insignificant fault or imperfection in another person. Jesus uses it hyperbolically to contrast with the ''beam,'' emphasizing how easily one can magnify minor flaws in others while ignoring major ones in oneself, highlighting hypocritical judgment.', 1),
  ('ὀφθαλμῷ', 'ophthalmō', 'G3788', 'From ''ὄπτομαι'' (optomai, to see), ''ὀφθαλμός'' (ophthalmos) means ''eye.'' In this passage, it refers literally to the physical eye, but metaphorically represents one''s spiritual perception or moral vision. The ''eye'' is the lamp of the body (Matt 6:22), and its condition (with a speck or beam) indicates the clarity or impairment of one''s spiritual discernment and moral judgment.', 2),
  ('δοκόν', 'dokon', 'G1385', 'From ''δέχομαι'' (dechomai, to receive), ''δοκός'' (dokos) refers to a ''beam'' or ''log,'' specifically a large piece of timber used in construction. Jesus uses this word in extreme hyperbole to represent a glaring, massive fault or sin in oneself, contrasting it with the ''speck'' in another. It powerfully illustrates the spiritual blindness and magnitude of hypocrisy.', 3),
  ('κατανοεῖς', 'katanoeis', 'G2657', 'From ''κατά'' (kata, down) and ''νοέω'' (noeō, to perceive), ''κατανοέω'' means ''to observe fully,'' ''to consider carefully,'' or ''to perceive clearly.'' Here, it highlights the hypocrite''s failure to truly ''consider'' or ''discern'' their own significant moral failings, despite being acutely aware of minor faults in others. It implies a deliberate lack of self-awareness.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 3;

-- Verse 6
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἅγιον', 'hagion', 'G40', 'From ''ἅγιος'' (hagios), meaning ''holy'' or ''sacred.'' Here, ''τὸ ἅγιον'' (to hagion) refers to that which is consecrated or set apart for God, likely symbolizing sacred truths, spiritual blessings, or even the gospel message itself. It emphasizes the preciousness and divine origin of these spiritual realities, which should not be profaned by being given to the unworthy.', 1),
  ('κυσίν', 'kysīn', 'G2965', 'The dative plural of ''κύων'' (kyōn), meaning ''dog.'' In ancient Jewish culture, dogs were often scavengers and considered unclean animals, sometimes used as a derogatory term for Gentiles or those outside the covenant. Here, it metaphorically represents those who are spiritually hostile, contemptuous, or who would profane sacred truths with their irreverence and lack of appreciation.', 2),
  ('μαργαρίτας', 'margaritas', 'G3175', 'From ''μάργαρον'' (margaron), meaning ''pearl.'' Pearls were highly valued precious gems. In this context, ''τοὺς μαργαρίτας'' (tous margaritas) symbolizes the precious truths of the Kingdom of God, the gospel, or profound spiritual insights. It emphasizes the immense value of these spiritual realities, which should be guarded and shared with discernment, not indiscriminately.', 3),
  ('χοίρων', 'choirōn', 'G5593', 'The genitive plural of ''χοῖρος'' (choiros), meaning ''swine'' or ''pig.'' Like dogs, pigs were considered unclean animals in Jewish law. Here, they metaphorically represent individuals who are spiritually unclean, unappreciative, and prone to trampling underfoot and destroying sacred things. They are those who would not only reject but actively desecrate spiritual truths.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 6;

-- Verse 12
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('θέλητε', 'thelēte', 'G2309', 'From ''θέλω'' (thelō), meaning ''to will,'' ''to wish,'' or ''to desire.'' In the Golden Rule, ''ὅσα ἐὰν θέλητε'' (hosa ean thelēte) refers to what one genuinely desires or wishes for oneself from others. It implies a deep, empathetic understanding of one''s own needs and desires, which should then be projected onto how one treats others, forming the basis of ethical action.', 1),
  ('ποιῶσιν', 'poiōsin', 'G4160', 'From ''ποιέω'' (poieō), meaning ''to do,'' ''to make,'' or ''to perform.'' In the Golden Rule, it refers to the actions that one desires others to perform towards oneself. This word is central to the chapter, emphasizing active, practical obedience and ethical conduct as the essence of God''s law. It''s about putting desires into concrete action.', 2),
  ('οὕτως', 'houtōs', 'G3779', 'An adverb meaning ''thus,'' ''so,'' or ''in this manner.'' In the Golden Rule, ''οὕτως καὶ ὑμεῖς ποιεῖτε αὐτοῖς'' (houtōs kai hymeis poieite autois) serves as a direct command to reciprocate the desired treatment. It signifies that the standard one wishes for oneself should be the exact standard applied to others, establishing a clear and universal ethical principle.', 3),
  ('νόμος', 'nomos', 'G3551', 'From ''νέμω'' (nemō, to distribute), ''νόμος'' (nomos) means ''law,'' referring to divine law, particularly the Mosaic Law. Here, ''ὁ νόμος καὶ οἱ προφῆται'' (ho nomos kai hoi prophētai) refers to the entire Old Testament revelation. Jesus declares that the Golden Rule encapsulates the fundamental ethical spirit and intention of all these sacred writings, summarizing their core message of love and justice.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 12;

-- Verse 14
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στενὴ', 'stenē', 'G4728', 'From ''στενός'' (stenos), meaning ''narrow,'' ''strait,'' or ''confined.'' It describes the gate and the way that lead to life. This narrowness implies difficulty, restriction, and exclusivity, suggesting that the path of true discipleship requires self-denial, discipline, and adherence to Christ alone, rather than broad acceptance or ease. It is a path chosen by few.', 1),
  ('τεθλιμμένη', 'tethlimmenē', 'G2346', 'The perfect passive participle of ''θλίβω'' (thlibō), meaning ''to press,'' ''to crowd,'' or ''to afflict.'' ''Τεθλιμμένη'' (tethlimmenē) means ''pressed together,'' ''afflicted,'' or ''difficult.'' It describes the way that leads to life, indicating that it is a path marked by challenges, suffering, and opposition. This highlights the cost of discipleship and the reality that following Christ often involves hardship.', 2),
  ('ζωήν', 'zōēn', 'G2222', 'From ''ζάω'' (zaō, to live), ''ζωή'' (zōē) refers to ''life,'' particularly spiritual and eternal life. In this context, it signifies the ultimate destination of the narrow way: eternal fellowship with God, a quality of life characterized by righteousness and joy. It contrasts sharply with ''ἀπώλεια'' (apōleia, destruction), emphasizing the eternal stakes of choosing one''s path.', 3),
  ('ὀλίγοι', 'oligoi', 'G3641', 'An adjective meaning ''few'' or ''small in number.'' The statement ''ὀλίγοι εἰσὶν οἱ εὑρίσκοντες αὐτήν'' (oligoi eisin hoi heuriskontes autēn) emphasizes the unpopularity and counter-cultural nature of the narrow way. It suggests that genuine discipleship is not a mass movement but a deliberate choice made by a dedicated minority, highlighting the exclusivity of salvation through Christ.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 14;

-- Verse 16
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καρπῶν', 'karpōn', 'G2590', 'From ''κάρπος'' (karpos), meaning ''fruit,'' ''produce,'' or ''result.'' In this context, ''ἀπὸ τῶν καρπῶν αὐτῶν'' (apo tōn karpōn autōn) refers metaphorically to the observable actions, character, teachings, and spiritual impact of individuals, particularly false prophets. It is the outward manifestation of one''s inner nature and beliefs, serving as the definitive test of authenticity.', 1),
  ('ἐπιγνώσεσθε', 'epignōsesthē', 'G1921', 'From ''ἐπί'' (epi, upon) and ''γινώσκω'' (ginōskō, to know), ''ἐπιγινώσκω'' (epiginōskō) means ''to know fully,'' ''to recognize,'' or ''to discern thoroughly.'' It implies a deeper, more accurate knowledge than simple acquaintance. Here, it signifies that by carefully observing their ''fruits,'' one will gain a clear and certain understanding of the true nature and identity of false prophets.', 2),
  ('ἀκανθῶν', 'akanthōn', 'G173', 'The genitive plural of ''ἄκανθα'' (akantha), meaning ''thornbush'' or ''thistle.'' These are plants that produce thorns, not edible fruit. Jesus uses this as an analogy to illustrate that a corrupt source (false prophet) cannot produce good, life-giving results (good fruit). It highlights the impossibility of a bad nature yielding good outcomes.', 3),
  ('σταφυλὰς', 'staphylas', 'G4718', 'The accusative plural of ''σταφυλή'' (staphylē), meaning ''grape'' or ''bunch of grapes.'' Grapes are a desirable and nourishing fruit. In the analogy, they represent the ''good fruit'' that a genuine spiritual source (a good tree/true prophet) would produce. The rhetorical question emphasizes that one cannot expect good spiritual outcomes from a corrupt source.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 16;

-- Verse 23
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁμολογήσω', 'homologēsō', 'G3670', 'From ''ὁμοῦ'' (homou, together) and ''λέγω'' (legō, to speak), ''ὁμολογέω'' (homologeō) means ''to confess,'' ''to acknowledge,'' or ''to declare openly.'' Here, it signifies Jesus''s solemn and public declaration of His non-acquaintance with those who claim to have served Him. It is a formal, definitive statement of rejection at the final judgment, emphasizing its gravity.', 1),
  ('ἔγνων', 'egnōn', 'G1097', 'The aorist indicative of ''γινώσκω'' (ginōskō), meaning ''to know.'' In the phrase ''Οὐδέποτε ἔγνων ὑμᾶς'' (Oudepote egnōn hymas, ''I never knew you''), ''know'' implies an intimate, personal, and saving relationship, not just intellectual awareness. Jesus''s denial signifies that these individuals never had a true, transformative relationship with Him, despite their religious activities.', 2),
  ('ἀποχωρεῖτε', 'apochōreite', 'G672', 'From ''ἀπό'' (apo, from) and ''χωρέω'' (chōreō, to make room), ''ἀποχωρέω'' (apochōreō) means ''to depart,'' ''to go away,'' or ''to withdraw.'' This is a direct, authoritative command from Jesus for the ''workers of lawlessness'' to leave His presence. It signifies eternal separation from Christ and His kingdom, emphasizing the finality and severity of divine judgment.', 3),
  ('ἀνομίαν', 'anomian', 'G458', 'From ''ἀ-'' (a-, negative prefix) and ''νόμος'' (nomos, law), ''ἀνομία'' (anomia) means ''lawlessness,'' ''iniquity,'' or ''disregard for the law.'' It describes a life lived in defiance of God''s moral and spiritual standards, even if outwardly religious. It is the antithesis of ''doing the will of my Father'' (v. 21), revealing a heart that rejects God''s authority and lives outside His righteous commands.', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 23;

-- Verse 24
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀκούει', 'akouei', 'G191', 'From ''ἀκούω'' (akouō), meaning ''to hear,'' ''to listen,'' or ''to understand.'' In this context, ''ἀκούει μου τοὺς λόγους τούτους'' (akouei mou tous logous toutous) implies not just passive hearing but attentive listening and comprehension of Jesus''s teachings. It is the first step in genuine discipleship, leading to the crucial act of ''doing'' His words.', 1),
  ('ποιεῖ', 'poiei', 'G4160', 'From ''ποιέω'' (poieō), meaning ''to do,'' ''to make,'' or ''to perform.'' Here, ''καὶ ποιεῖ αὐτούς'' (kai poiei autous) is the critical element, emphasizing active obedience and practical application of Jesus''s words. It distinguishes true discipleship from mere intellectual assent or superficial religiosity, forming the solid foundation for one''s life.', 2),
  ('φρονίμῳ', 'phronimō', 'G5429', 'From ''φρονέω'' (phroneō, to think), ''φρόνιμος'' (phronimos) means ''prudent,'' ''sensible,'' or ''wise.'' It describes the man who builds his house on the rock. This wisdom is not merely intellectual but practical, demonstrated by the foresight and good judgment to act upon Jesus''s teachings, recognizing their eternal significance and building a life that will endure.', 3),
  ('πέτραν', 'petran', 'G4073', 'From ''πέτρα'' (petra), meaning ''rock'' or ''bedrock.'' In the parable, ''ἐπὶ τὴν πέτραν'' (epi tēn petran) symbolizes a firm, unshakeable foundation. It represents a life built on active obedience to Jesus''s words, which provides stability, security, and resilience against the storms of life and the ultimate judgment. Christ Himself is often referred to as the Rock (1 Cor 10:4).', 4)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = 24;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Luke 6:37', 1),
  (1, 'Romans 2:1-3', 2),
  (1, '1 Corinthians 4:5', 3),
  (1, 'James 4:11-12', 4),
  (2, 'Mark 4:24', 1),
  (2, 'Luke 6:38', 2),
  (2, 'Galatians 6:7', 3),
  (2, 'James 2:13', 4),
  (3, 'Luke 6:41', 1),
  (3, 'Romans 2:21-23', 2),
  (5, 'Luke 6:42', 1),
  (5, 'Galatians 6:1', 2),
  (5, 'Romans 2:19-24', 3),
  (6, 'Proverbs 9:7-8', 1),
  (6, 'Philippians 3:2', 2),
  (6, '2 Peter 2:22', 3),
  (7, 'Matthew 21:22', 1),
  (7, 'Mark 11:24', 2),
  (7, 'Luke 11:9-10', 3),
  (7, 'John 14:13-14', 4),
  (7, 'James 1:5-6', 5),
  (8, 'Luke 11:10', 1),
  (8, '1 John 3:22', 2),
  (8, '1 John 5:14-15', 3),
  (9, 'Luke 11:11', 1),
  (10, 'Luke 11:12', 1),
  (11, 'Luke 11:13', 1),
  (11, 'Matthew 6:30-33', 2),
  (11, 'Romans 8:32', 3),
  (12, 'Luke 6:31', 1),
  (12, 'Leviticus 19:18', 2),
  (12, 'Romans 13:8-10', 3),
  (12, 'Galatians 5:14', 4),
  (13, 'Luke 13:24', 1),
  (13, 'Deuteronomy 30:19', 2),
  (13, 'Jeremiah 21:8', 3),
  (14, 'Luke 13:24', 1),
  (14, 'Acts 14:22', 2),
  (14, 'Philippians 3:18-19', 3),
  (15, 'Matthew 24:4-5', 1),
  (15, 'Acts 20:29-30', 2),
  (15, '2 Peter 2:1-3', 3),
  (15, '1 John 4:1', 4),
  (16, 'Matthew 12:33', 1),
  (16, 'Luke 6:43-44', 2),
  (16, 'James 3:12', 3),
  (17, 'Matthew 12:33', 1),
  (17, 'Luke 6:43', 2),
  (19, 'Matthew 3:10', 1),
  (19, 'Luke 3:9', 2),
  (19, 'John 15:2, 6', 3),
  (21, 'Luke 6:46', 1),
  (21, 'Romans 2:13', 2),
  (21, 'James 1:22', 3),
  (21, '1 John 2:3-4', 4),
  (22, 'Numbers 24:4', 1),
  (22, '1 Corinthians 13:1-3', 2),
  (22, 'Galatians 5:19-21', 3),
  (23, 'Psalm 6:8', 1),
  (23, 'Matthew 25:41', 2),
  (23, 'Luke 13:27', 3),
  (23, '2 Timothy 2:19', 4),
  (24, 'Luke 6:47-48', 1),
  (24, 'James 1:22-25', 2),
  (24, 'Romans 2:13', 3),
  (25, 'Psalm 92:13-15', 1),
  (25, 'Proverbs 10:25', 2),
  (25, 'Isaiah 28:16', 3),
  (26, 'Luke 6:49', 1),
  (26, 'James 1:23-24', 2),
  (27, 'Hebrews 10:26-31', 1),
  (28, 'Matthew 13:54', 1),
  (28, 'Matthew 22:33', 2),
  (28, 'Mark 1:22', 3),
  (28, 'Luke 4:32', 4),
  (29, 'Mark 1:22', 1),
  (29, 'John 7:46', 2),
  (29, 'Acts 4:13', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Matthew' AND c.chapter_number = 7 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════════
-- ✅ Matthew Chapter 7 Complete!
-- 29 verses · 7 key verses with word studies (28 words)
-- Cross-references for 26 verses (78 refs)
-- ═══════════════════════════════════════════════════════