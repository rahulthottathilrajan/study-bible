-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 9 — God's Sovereign Election and Israel
-- 33 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'Romans 9 opens a new section (chs.9-11) addressing the most painful question Paul faces: if the gospel is God''s power unto salvation, why has Israel largely rejected it? Paul begins with ''great heaviness and continual sorrow'' in his heart for his kinsmen (vv.1-3) — he could even wish himself ''accursed from Christ'' for their sake. He catalogues Israel''s privileges: adoption, glory, covenants, the law, the service, the promises, the fathers, and from them came ''Christ according to the flesh, who is over all, God blessed for ever'' (vv.4-5). Yet God''s word has not failed (v.6): ''they are not all Israel, which are of Israel'' (v.6). God''s sovereign election has always operated within Israel: Isaac, not Ishmael; Jacob, not Esau — and the choice was made ''before the children had done any good or evil, that the purpose of God according to election might stand'' (vv.11-12). Paul addresses the objection of unfairness by quoting God to Moses: ''I will have mercy on whom I will have mercy'' (v.15). ''So then it is not of him that willeth, nor of him that runneth, but of God that sheweth mercy'' (v.16). Pharaoh was raised up to display God''s power (v.17). God has mercy on whom he will, and hardens whom he will (v.18). To the objector who asks ''Why doth he yet find fault?'' Paul answers with the potter and clay analogy: ''Shall the thing formed say to him that formed it, Why hast thou made me thus?'' (v.20). God has the right to make vessels of honour and vessels of dishonour (v.21), and has ''endured with much longsuffering the vessels of wrath fitted to destruction'' (v.22) while making known ''the riches of his glory on the vessels of mercy'' (v.23). Paul closes by citing Hosea and Isaiah: God is calling a people from both Gentiles and Jews, and ''a remnant shall be saved'' (vv.24-29). The Gentiles obtained righteousness by faith; Israel, pursuing it by works, ''stumbled at that stumblingstone'' — Christ himself (vv.30-33).',
  'God''s Sovereign Election and the Mystery of Israel''s Rejection',
  'ἐκλογή (eklogē)',
  'Election, choosing, selection — from ek (out of) + legō (to choose, to pick out). God''s sovereign act of selecting individuals and peoples for specific purposes. In Romans 9, eklogē operates before birth (v.11), apart from works (v.11), and according to God''s free mercy (v.16). Election is not based on foreseen merit but on God''s sovereign purpose and grace.',
  '["Paul''s Anguish for Israel and Their Privileges (vv.1-5): I say the truth in Christ I lie not my conscience also bearing me witness in the Holy Ghost that I have great heaviness and continual sorrow in my heart for I could wish that myself were accursed from Christ for my brethren my kinsmen according to the flesh who are Israelites to whom pertaineth the adoption and the glory and the covenants and the giving of the law and the service of God and the promises whose are the fathers and of whom as concerning the flesh Christ came who is over all God blessed for ever Amen","God''s Word Has Not Failed: The Principle of Election (vv.6-13): Not as though the word of God hath taken none effect for they are not all Israel which are of Israel neither because they are the seed of Abraham are they all children but in Isaac shall thy seed be called for the children being not yet born neither having done any good or evil that the purpose of God according to election might stand it was said unto her The elder shall serve the younger as it is written Jacob have I loved but Esau have I hated","God''s Sovereignty in Mercy and Hardening (vv.14-18): What shall we say then is there unrighteousness with God God forbid for he saith to Moses I will have mercy on whom I will have mercy so then it is not of him that willeth nor of him that runneth but of God that sheweth mercy for the scripture saith unto Pharaoh Even for this same purpose have I raised thee up therefore hath he mercy on whom he will have mercy and whom he will he hardeneth","The Potter and the Clay (vv.19-24): Thou wilt say then unto me Why doth he yet find fault for who hath resisted his will nay but O man who art thou that repliest against God shall the thing formed say to him that formed it Why hast thou made me thus hath not the potter power over the clay of the same lump to make one vessel unto honour and another unto dishonour","Israel Stumbled: Righteousness by Faith Not Works (vv.25-33): What shall we say then that the Gentiles which followed not after righteousness have attained to righteousness even the righteousness which is of faith but Israel which followed after the law of righteousness hath not attained to the law of righteousness wherefore because they sought it not by faith but as it were by the works of the law for they stumbled at that stumblingstone"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'I say the truth in Christ, I lie not, my conscience also bearing me witness in the Holy Ghost,',
   'Ἀλήθειαν λέγω ἐν Χριστῷ οὐ ψεύδομαι συμμαρτυρούσης μοι τῆς συνειδήσεώς μου ἐν πνεύματι ἁγίῳ',
   'Alētheian legō en Christō ou pseudomai symmartyrousēs moi tēs syneidēseōs mou en pneumati hagiō',
   'Paul invokes three witnesses to his sincerity: Christ (''in Christ''), his own conscience, and the Holy Spirit. The triple attestation underscores the enormity of what he is about to say. After the triumph of ch.8, this sudden turn to anguish is startling.',
   NULL),
  (2, 'That I have great heaviness and continual sorrow in my heart.',
   'ὅτι λύπη μοί ἐστιν μεγάλη καὶ ἀδιάλειπτος ὀδύνη τῇ καρδίᾳ μου',
   'hoti lypē moi estin megalē kai adialeiptos odynē tē kardia mou',
   '''Great heaviness'' (lypē megalē — great grief). ''Continual sorrow'' (adialeiptos odynē — unceasing pain). The man who just declared ''nothing can separate us from God''s love'' now reveals a grief so deep it never stops. His anguish is for Israel''s rejection of the Messiah.',
   NULL),
  (3, 'For I could wish that myself were accursed from Christ for my brethren, my kinsmen according to the flesh:',
   'ηὐχόμην γὰρ αὐτὸς ἐγὼ ἀνάθεμα εἶναι ἀπὸ τοῦ Χριστοῦ ὑπὲρ τῶν ἀδελφῶν μου τῶν συγγενῶν μου κατὰ σάρκα',
   'ēuchomēn gar autos egō anathema einai apo tou Christou hyper tōn adelphōn mou tōn syngenōn mou kata sarka',
   '''Accursed'' (anathema — devoted to destruction, cut off; the strongest possible term for separation from God). Paul''s love for Israel echoes Moses (Exodus 32:32). The imperfect tense (ēuchomēn — I was wishing / I could wish) suggests an impossible wish, not a settled prayer. Paul''s willingness to be damned for his people''s salvation reveals a love that mirrors Christ''s own self-giving.',
   NULL),
  (4, 'Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of God, and the promises;',
   'οἵτινές εἰσιν Ἰσραηλῖται ὧν ἡ υἱοθεσία καὶ ἡ δόξα καὶ αἱ διαθῆκαι καὶ ἡ νομοθεσία καὶ ἡ λατρεία καὶ αἱ ἐπαγγελίαι',
   'hoitines eisin Israēlitai hōn hē huiothesia kai hē doxa kai hai diathēkai kai hē nomothesia kai hē latreia kai hai epangeliai',
   'Eight privileges of Israel: (1) ''Israelites'' — the covenant name. (2) ''Adoption'' (huiothesia — national sonship; Exodus 4:22). (3) ''Glory'' (doxa — the Shekinah, God''s visible presence). (4) ''Covenants'' (diathēkai — Abrahamic, Mosaic, Davidic, New). (5) ''Giving of the law'' (nomothesia — the legislation at Sinai). (6) ''Service of God'' (latreia — the temple worship). (7) ''Promises'' (epangeliai — the messianic and redemptive promises). These are real, irrevocable privileges.',
   NULL),
  (5, 'Whose are the fathers, and of whom as concerning the flesh Christ came, who is over all, God blessed for ever. Amen.',
   'ὧν οἱ πατέρες καὶ ἐξ ὧν ὁ Χριστὸς τὸ κατὰ σάρκα ὁ ὢν ἐπὶ πάντων θεὸς εὐλογητὸς εἰς τοὺς αἰῶνας ἀμήν',
   'hōn hoi pateres kai ex hōn ho Christos to kata sarka ho ōn epi pantōn theos eulogētos eis tous aiōnas amēn',
   '''The fathers'' (hoi pateres — Abraham, Isaac, Jacob). ''Christ came'' (ho Christos to kata sarka — the Messiah according to the flesh). ''Who is over all, God blessed for ever'' (ho ōn epi pantōn theos eulogētos — one of the clearest affirmations of Christ''s deity in the NT). Israel''s supreme privilege: the Messiah came from them. And this Messiah is ''God over all, blessed forever.'' Paul breaks into doxology even in the midst of grief.',
   'This verse contains one of the most explicit declarations of Christ''s deity in the Pauline corpus. The phrase ''ho ōn epi pantōn theos eulogētos'' (who is over all, God blessed forever) most naturally refers to Christ. Some attempt to punctuate it as a separate doxology to the Father, but the grammar and context favour the reading that identifies Christ as ''God over all.'' This is consistent with Titus 2:13, John 1:1, and Philippians 2:6.'),
  (6, 'Not as though the word of God hath taken none effect. For they are not all Israel, which are of Israel:',
   'οὐχ οἷον δὲ ὅτι ἐκπέπτωκεν ὁ λόγος τοῦ θεοῦ οὐ γὰρ πάντες οἱ ἐξ Ἰσραήλ οὗτοι Ἰσραήλ',
   'ouch hoion de hoti ekpeptōken ho logos tou theou ou gar pantes hoi ex Israēl houtoi Israēl',
   '''Taken none effect'' (ekpeptōken — fallen, failed; perfect tense: God''s word has NOT fallen). ''They are not all Israel, which are of Israel'' — the crucial distinction: ethnic Israel and true Israel are not identical. God''s promises were never to every physical descendant but to the elect within Israel. God''s word has not failed because it was never addressed to ethnic Israel as a whole.',
   'This verse introduces the key hermeneutical principle for understanding Israel''s rejection of the gospel: God''s promises were always addressed to a true Israel within ethnic Israel. Physical descent from Abraham does not guarantee spiritual inheritance. This distinction has been operative from the beginning: Isaac, not Ishmael; Jacob, not Esau. God''s word has not failed; it has always been selective.'),
  (7, 'Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called.',
   'οὐδ᾿ ὅτι εἰσὶν σπέρμα Ἀβραάμ πάντες τέκνα ἀλλ᾿ ἐν Ἰσαὰκ κληθήσεταί σοι σπέρμα',
   'oud hoti eisin sperma Abraam pantes tekna all en Isaak klēthēsetai soi sperma',
   'Quoting Genesis 21:12. ''In Isaac shall thy seed be called'' — not Ishmael (who was also Abraham''s physical descendant) but Isaac was the promised child. Physical descent is not enough; divine selection determines the true seed.',
   NULL),
  (8, 'That is, They which are the children of the flesh, these are not the children of God: but the children of the promise are counted for the seed.',
   'τοῦτ᾿ ἔστιν οὐ τὰ τέκνα τῆς σαρκὸς ταῦτα τέκνα τοῦ θεοῦ ἀλλὰ τὰ τέκνα τῆς ἐπαγγελίας λογίζεται εἰς σπέρμα',
   'tout estin ou ta tekna tēs sarkos tauta tekna tou theou alla ta tekna tēs epangelias logizetai eis sperma',
   '''Children of the flesh'' (tekna tēs sarkos — those born by natural descent). ''Children of the promise'' (tekna tēs epangelias — those born through God''s promise). ''Counted'' (logizetai — reckoned, credited; the same imputation language as ch.4). The true seed of Abraham is determined by God''s promise, not by biological descent. This principle applied then (Isaac/Ishmael) and applies now (believing Jew and Gentile).',
   NULL),
  (9, 'For this is the word of promise, At this time will I come, and Sara shall have a son.',
   'ἐπαγγελίας γὰρ ὁ λόγος οὗτος κατὰ τὸν καιρὸν τοῦτον ἐλεύσομαι καὶ ἔσται τῇ Σάρρᾳ υἱός',
   'epangelias gar ho logos houtos kata ton kairon touton eleusomai kai estai tē Sarra huios',
   'Quoting Genesis 18:10, 14. Isaac''s birth was not natural but supernatural — the result of divine promise and power. The promise-principle runs through all of God''s dealings with his people: salvation is always by promise, never by natural right.',
   NULL),
  (10, 'And not only this; but when Rebecca also had conceived by one, even by our father Isaac;',
   'οὐ μόνον δέ ἀλλὰ καὶ Ῥεβέκκα ἐξ ἑνὸς κοίτην ἔχουσα Ἰσαὰκ τοῦ πατρὸς ἡμῶν',
   'ou monon de alla kai Rhebekka ex henos koitēn echousa Isaak tou patros hēmōn',
   'Paul strengthens his argument: with Isaac and Ishmael, one could argue that the difference was because of different mothers (Sarah vs. Hagar). But Jacob and Esau had the SAME father AND the SAME mother — they were twins. The only variable is God''s sovereign choice.',
   NULL),
  (11, '(For the children being not yet born, neither having done any good or evil, that the purpose of God according to election might stand, not of works, but of him that calleth;)',
   'μήπω γὰρ γεννηθέντων μηδὲ πραξάντων τι ἀγαθὸν ἢ κακόν ἵνα ἡ κατ᾿ ἐκλογὴν τοῦ θεοῦ πρόθεσις μένῃ οὐκ ἐξ ἔργων ἀλλ᾿ ἐκ τοῦ καλοῦντος',
   'mēpō gar gennēthentōn mēde praxantōn ti agathon ē kakon hina hē kat eklogēn tou theou prothesis menē ouk ex ergōn all ek tou kalountos',
   '''Not yet born'' (mēpō gennēthentōn — before birth). ''Neither having done any good or evil'' — the choice was made before any action could influence it. ''Purpose of God according to election'' (hē kat eklogēn tou theou prothesis — God''s predetermined plan operating through selection). ''Not of works, but of him that calleth'' — election is grounded in God''s calling, not in human merit. This is the strongest statement of unconditional election in the NT.',
   'This verse is the theological keystone of Romans 9. God''s choice of Jacob over Esau was made (1) before birth, (2) before any deeds good or evil, (3) so that God''s elective purpose might stand, and (4) based on the caller, not the called. Every human basis for election is systematically excluded. The purpose of this radical sovereignty is stated: ''that the purpose of God according to election might stand'' — God''s elective purpose is the ground of his saving work, not human merit.'),
  (12, 'It was said unto her, The elder shall serve the younger.',
   'ἐρρέθη αὐτῇ ὅτι ὁ μείζων δουλεύσει τῷ ἐλάσσονι',
   'errethē autē hoti ho meizōn douleusei tō elassoni',
   'Quoting Genesis 25:23. ''The elder shall serve the younger'' — a reversal of natural primogeniture. God''s choice cuts across human expectations and natural rights. Esau (the elder) would serve Jacob (the younger).',
   NULL),
  (13, 'As it is written, Jacob have I loved, but Esau have I hated.',
   'καθὼς γέγραπται τὸν Ἰακὼβ ἠγάπησα τὸν δὲ Ἠσαῦ ἐμίσησα',
   'kathōs gegraptai ton Iakōb ēgapēsa ton de Ēsau emisēsa',
   'Quoting Malachi 1:2-3, written centuries after the events. ''Loved'' and ''hated'' are covenantal terms: God chose Jacob for covenant blessing and passed over Esau. ''Hated'' (emisēsa) in Semitic usage means ''loved less'' or ''not chosen'' (cf. Luke 14:26). The point is not emotional hatred but sovereign selection.',
   NULL),
  (14, 'What shall we say then? Is there unrighteousness with God? God forbid.',
   'τί οὖν ἐροῦμεν μὴ ἀδικία παρὰ τῷ θεῷ μὴ γένοιτο',
   'ti oun eroumen mē adikia para tō theō mē genoito',
   '''Unrighteousness with God?'' (adikia para tō theō — injustice on God''s part?). ''God forbid'' — the strongest denial. Paul anticipates the objection: if God chooses before birth and apart from works, is that not unfair? The answer is an emphatic no — but Paul''s defense is surprising: he appeals not to human concepts of fairness but to God''s sovereign freedom.',
   NULL),
  (15, 'For he saith to Moses, I will have mercy on whom I will have mercy, and I will have compassion on whom I will have compassion.',
   'τῷ γὰρ Μωϋσῇ λέγει ἐλεήσω ὃν ἂν ἐλεῶ καὶ οἰκτειρήσω ὃν ἂν οἰκτείρω',
   'tō gar Mōysē legei eleēsō hon an eleō kai oikteirēsō hon an oikteirō',
   'Quoting Exodus 33:19 — spoken after the golden calf incident when Israel deserved destruction. God''s mercy is sovereign: ''I will have mercy on whom I will have mercy.'' The repetition emphasizes absolute divine freedom. Mercy is not owed but freely given according to God''s own decision. If God gave everyone what they deserved, no one would be saved.',
   NULL),
  (16, 'So then it is not of him that willeth, nor of him that runneth, but of God that sheweth mercy.',
   'ἄρα οὖν οὐ τοῦ θέλοντος οὐδὲ τοῦ τρέχοντος ἀλλὰ τοῦ ἐλεοῦντος θεοῦ',
   'ara oun ou tou thelontos oude tou trechontos alla tou eleountos theou',
   '''Not of him that willeth'' (ou tou thelontos — not of the one who wills). ''Nor of him that runneth'' (oude tou trechontos — nor of the one who strives). ''But of God that sheweth mercy'' (tou eleountos theou — of the mercying God). Human will and human effort are excluded as the ground of salvation. This does not deny that humans will and run, but locates the decisive factor in God''s mercy, not human initiative.',
   NULL),
  (17, 'For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.',
   'λέγει γὰρ ἡ γραφὴ τῷ Φαραώ ὅτι εἰς αὐτὸ τοῦτο ἐξήγειρά σε ὅπως ἐνδείξωμαι ἐν σοὶ τὴν δύναμίν μου καὶ ὅπως διαγγελῇ τὸ ὄνομά μου ἐν πάσῃ τῇ γῇ',
   'legei gar hē graphē tō Pharaō hoti eis auto touto exēgeira se hopōs endeixōmai en soi tēn dynamin mou kai hopōs diangelē to onoma mou en pasē tē gē',
   'Quoting Exodus 9:16. ''Raised thee up'' (exēgeira se — brought you to the stage of history, caused you to stand). God raised Pharaoh to prominence for a purpose: to display divine power and to make God''s name known worldwide. Even the hardening of Pharaoh served God''s redemptive purposes for Israel and for global knowledge of God.',
   NULL),
  (18, 'Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.',
   'ἄρα οὖν ὃν θέλει ἐλεεῖ ὃν δὲ θέλει σκληρύνει',
   'ara oun hon thelei eleei hon de thelei sklērynei',
   '''Mercy on whom he will'' (hon thelei eleei — he shows mercy to whomever he wishes). ''Hardeneth'' (sklērynei — makes hard, stiffens). God''s sovereignty operates in two directions: mercy and hardening. The hardening is not arbitrary cruelty but judicial confirmation of the direction the person has already chosen. Pharaoh hardened his own heart (Exodus 8:15, 32) before God hardened it (Exodus 9:12).',
   NULL),
  (19, 'Thou wilt say then unto me, Why doth he yet find fault? For who hath resisted his will?',
   'ἐρεῖς οὖν μοι τί ἔτι μέμφεται τῷ γὰρ βουλήματι αὐτοῦ τίς ἀνθέστηκεν',
   'ereis oun moi ti eti memphetai tō gar boulēmati autou tis anthestēken',
   '''Why doth he yet find fault?'' — the objection from determinism: if God''s will is irresistible, how can he blame anyone? ''Who hath resisted his will?'' — the question assumes that sovereign election removes human responsibility. Paul will answer not by resolving the philosophical tension but by asserting God''s right as Creator.',
   NULL),
  (20, 'Nay but, O man, who art thou that repliest against God? Shall the thing formed say to him that formed it, Why hast thou made me thus?',
   'μενοῦνγε ὦ ἄνθρωπε σὺ τίς εἶ ὁ ἀνταποκρινόμενος τῷ θεῷ μὴ ἐρεῖ τὸ πλάσμα τῷ πλάσαντι τί με ἐποίησας οὕτως',
   'menounge ō anthrōpe sy tis ei ho antapokrinomenos tō theō mē erei to plasma tō plasanti ti me epoiēsas houtōs',
   '''O man, who art thou?'' — the most confrontational question in Romans. ''Repliest against God'' (antapokrinomenos — talks back, argues with). ''The thing formed'' (to plasma — the thing moulded; clay). Paul echoes Isaiah 29:16 and 45:9. The Creator-creature distinction is absolute: the clay has no right to question the potter. This is not anti-intellectual but a reminder that finite creatures cannot sit in judgment on the infinite Creator.',
   NULL),
  (21, 'Hath not the potter power over the clay, of the same lump to make one vessel unto honour, and another unto dishonour?',
   'ἢ οὐκ ἔχει ἐξουσίαν ὁ κεραμεὺς τοῦ πηλοῦ ἐκ τοῦ αὐτοῦ φυράματος ποιῆσαι ὃ μὲν εἰς τιμὴν σκεῦος ὃ δὲ εἰς ἀτιμίαν',
   'ē ouk echei exousian ho kerameus tou pēlou ek tou autou phyramatos poiēsai ho men eis timēn skeuos ho de eis atimian',
   '''Potter'' (kerameus — the craftsman). ''Power'' (exousian — authority, right). ''Same lump'' (tou autou phyramatos — the same batch of clay). ''Honour'' (timēn) and ''dishonour'' (atimian). The potter has full authority over the clay. The ''same lump'' emphasizes that the difference between vessels is not in the clay (which is identical) but in the potter''s purpose.',
   NULL),
  (22, 'What if God, willing to shew his wrath, and to make his power known, endured with much longsuffering the vessels of wrath fitted to destruction:',
   'εἰ δὲ θέλων ὁ θεὸς ἐνδείξασθαι τὴν ὀργὴν καὶ γνωρίσαι τὸ δυνατὸν αὐτοῦ ἤνεγκεν ἐν πολλῇ μακροθυμίᾳ σκεύη ὀργῆς κατηρτισμένα εἰς ἀπώλειαν',
   'ei de thelōn ho theos endeixasthai tēn orgēn kai gnōrisai to dynaton autou ēnenken en pollē makrothymia skeuē orgēs katērtismena eis apōleian',
   '''Vessels of wrath'' (skeuē orgēs — objects of wrath). ''Fitted to destruction'' (katērtismena eis apōleian — the middle/passive voice is significant: ''having fitted themselves'' or ''having been fitted''; the ambiguity may be intentional). ''Endured with much longsuffering'' — God was patient even with those destined for destruction. Note: the vessels of mercy are said to be ''prepared'' by God (v.23), but the vessels of wrath are described more ambiguously.',
   NULL),
  (23, 'And that he might make known the riches of his glory on the vessels of mercy, which he had afore prepared unto glory,',
   'καὶ ἵνα γνωρίσῃ τὸν πλοῦτον τῆς δόξης αὐτοῦ ἐπὶ σκεύη ἐλέους ἃ προητοίμασεν εἰς δόξαν',
   'kai hina gnōrisē ton plouton tēs doxēs autou epi skeuē eleous ha proētoimasen eis doxan',
   '''Vessels of mercy'' (skeuē eleous — objects of mercy). ''Afore prepared'' (proētoimasen — prepared beforehand; the prefix pro- indicates advance preparation). ''Unto glory'' (eis doxan — for glory as their destination). Note the contrast: vessels of wrath are ''fitted'' (katērtismena, v.22, ambiguous voice) while vessels of mercy are ''afore prepared'' (proētoimasen, active voice: God prepared them). God actively prepares mercy-vessels; the wrath-vessels'' preparation is described more passively.',
   NULL),
  (24, 'Even us, whom he hath called, not of the Jews only, but also of the Gentiles?',
   'οὓς καὶ ἐκάλεσεν ἡμᾶς οὐ μόνον ἐξ Ἰουδαίων ἀλλὰ καὶ ἐξ ἐθνῶν',
   'hous kai ekalesen hēmas ou monon ex Ioudaiōn alla kai ex ethnōn',
   '''Us, whom he hath called'' — the vessels of mercy are identified: they include both Jews and Gentiles. This is the answer to the chapter''s implicit question: God''s sovereign election now encompasses people from all nations, not just ethnic Israel.',
   NULL),
  (25, 'As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.',
   'ὡς καὶ ἐν τῷ Ὡσηὲ λέγει καλέσω τὸν οὐ λαόν μου λαόν μου καὶ τὴν οὐκ ἠγαπημένην ἠγαπημένην',
   'hōs kai en tō Hōsēe legei kalesō ton ou laon mou laon mou kai tēn ouk ēgapēmenēn ēgapēmenēn',
   'Quoting Hosea 2:23. Hosea''s original context was Israel''s restoration after judgment, but Paul applies it to the Gentiles'' inclusion: those who were ''not my people'' are now called ''my people.'' God''s elective mercy reaches beyond Israel''s ethnic boundaries.',
   NULL),
  (26, 'And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living God.',
   'καὶ ἔσται ἐν τῷ τόπῳ οὗ ἐρρέθη αὐτοῖς οὐ λαός μου ὑμεῖς ἐκεῖ κληθήσονται υἱοὶ θεοῦ ζῶντος',
   'kai estai en tō topō hou errethē autois ou laos mou hymeis ekei klēthēsontai huioi theou zōntos',
   'Quoting Hosea 1:10. ''Children of the living God'' (huioi theou zōntos) — the ultimate transformation: from ''not my people'' to ''sons of the living God.'' The reversal is complete and glorious.',
   NULL),
  (27, 'Esaias also crieth concerning Israel, Though the number of the children of Israel be as the sand of the sea, a remnant shall be saved:',
   'Ἠσαΐας δὲ κράζει ὑπὲρ τοῦ Ἰσραήλ ἐὰν ᾖ ὁ ἀριθμὸς τῶν υἱῶν Ἰσραὴλ ὡς ἡ ἄμμος τῆς θαλάσσης τὸ κατάλειμμα σωθήσεται',
   'Ēsaias de krazei hyper tou Israēl ean ē ho arithmos tōn huiōn Israēl hōs hē ammos tēs thalassēs to kataleimma sōthēsetai',
   'Quoting Isaiah 10:22-23. ''A remnant'' (to kataleimma — the remainder, what is left over). Even though Israel is as numerous as the sand, only a remnant will be saved. This is not a new development but an OT pattern: God''s saving work has always been through a believing remnant within the larger nation.',
   NULL),
  (28, 'For he will finish the work, and cut it short in righteousness: because a short work will the Lord make upon the earth.',
   'λόγον γὰρ συντελῶν καὶ συντέμνων ἐν δικαιοσύνῃ ὅτι λόγον συντετμημένον ποιήσει κύριος ἐπὶ τῆς γῆς',
   'logon gar syntelōn kai syntemnōn en dikaiosynē hoti logon syntetmēmenon poiēsei kyrios epi tēs gēs',
   '''Finish the work'' (syntelōn — bring to completion). ''Cut it short'' (syntemnōn — abbreviate, execute swiftly). God''s decisive, swift judgment will fall, and only the remnant will survive it. The Lord''s work on earth will be rapid and righteous.',
   NULL),
  (29, 'And as Esaias said before, Except the Lord of Sabaoth had left us a seed, we had been as Sodoma, and been made like unto Gomorrha.',
   'καὶ καθὼς προείρηκεν Ἠσαΐας εἰ μὴ κύριος Σαβαὼθ ἐγκατέλιπεν ἡμῖν σπέρμα ὡς Σόδομα ἂν ἐγενήθημεν καὶ ὡς Γόμορρα ἂν ὡμοιώθημεν',
   'kai kathōs proeirēken Ēsaias ei mē kyrios Sabaōth enkatelipen hēmin sperma hōs Sodoma an egenēthēmen kai hōs Gomorra an hōmoiōthēmen',
   'Quoting Isaiah 1:9. ''Lord of Sabaoth'' (kyrios Sabaōth — Lord of hosts, Lord of armies). ''Left us a seed'' — if God had not preserved a remnant, Israel would have been completely destroyed like Sodom and Gomorrah. The remnant is God''s gracious preservation, not Israel''s achievement.',
   NULL),
  (30, 'What shall we say then? That the Gentiles, which followed not after righteousness, have attained to righteousness, even the righteousness which is of faith.',
   'τί οὖν ἐροῦμεν ὅτι ἔθνη τὰ μὴ διώκοντα δικαιοσύνην κατέλαβεν δικαιοσύνην δικαιοσύνην δὲ τὴν ἐκ πίστεως',
   'ti oun eroumen hoti ethnē ta mē diōkonta dikaiosynēn katelaben dikaiosynēn dikaiosynēn de tēn ek pisteōs',
   '''Followed not after'' (mē diōkonta — did not pursue; the Gentiles were not seeking God''s righteousness). ''Attained'' (katelaben — seized, grasped, obtained). The irony: those who were not looking found what they were not seeking. Gentiles obtained righteousness — ''the righteousness which is of faith'' (ek pisteōs). Grace came to the unseeking.',
   NULL),
  (31, 'But Israel, which followed after the law of righteousness, hath not attained to the law of righteousness.',
   'Ἰσραὴλ δὲ διώκων νόμον δικαιοσύνης εἰς νόμον δικαιοσύνης οὐκ ἔφθασεν',
   'Israēl de diōkōn nomon dikaiosynēs eis nomon dikaiosynēs ouk ephthasen',
   '''Followed after'' (diōkōn — actively pursuing, chasing). ''Hath not attained'' (ouk ephthasen — did not arrive at, did not reach the goal). The double irony: Israel was pursuing righteousness zealously but never arrived. The problem was not lack of effort but wrong method: they pursued righteousness through law-works instead of faith.',
   NULL),
  (32, 'Wherefore? Because they sought it not by faith, but as it were by the works of the law. For they stumbled at that stumblingstone;',
   'διατί ὅτι οὐκ ἐκ πίστεως ἀλλ᾿ ὡς ἐξ ἔργων νόμου προσέκοψαν γὰρ τῷ λίθῳ τοῦ προσκόμματος',
   'diati hoti ouk ek pisteōs all hōs ex ergōn nomou prosekopsan gar tō lithō tou proskommatos',
   '''Not by faith, but as it were by works'' — the diagnosis of Israel''s failure: wrong method. They treated the law as a merit-system instead of receiving righteousness by faith. ''Stumbled at that stumblingstone'' (prosekopsan tō lithō tou proskommatos — they tripped over the stone of stumbling). The stumblingstone is Christ himself: the Messiah they should have received became the rock they tripped over.',
   NULL),
  (33, 'As it is written, Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed.',
   'καθὼς γέγραπται ἰδοὺ τίθημι ἐν Σιὼν λίθον προσκόμματος καὶ πέτραν σκανδάλου καὶ πᾶς ὁ πιστεύων ἐπ᾿ αὐτῷ οὐ καταισχυνθήσεται',
   'kathōs gegraptai idou tithēmi en Siōn lithon proskommatos kai petran skandalou kai pas ho pisteuōn ep autō ou kataischynthēsetai',
   'Combining Isaiah 28:16 and Isaiah 8:14. Christ is simultaneously the ''stumblingstone'' for unbelievers and the ''foundation stone'' for believers. ''Whosoever believeth on him shall not be ashamed'' (pas ho pisteuōn ep autō ou kataischynthēsetai — everyone who believes in him will not be put to shame). The chapter that began with sovereign election ends with a universal invitation: ''whosoever believeth.'' Divine sovereignty and human faith are both affirmed.',
   'This verse perfectly balances the chapter: God''s sovereign election (vv.6-23) does not eliminate human responsibility or faith''s necessity. Christ is a stone of stumbling to those who refuse to believe, but a foundation of salvation to those who do. ''Whosoever believeth'' — the invitation is universal. The tension between sovereignty and faith is not resolved philosophically but held together theologically: God elects, and human beings believe. Both are true; both are essential.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 9;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 accursed
  ('ἀνάθεμα', 'anathema', 'G331', 'Accursed, devoted to destruction, cut off — from ana (up) + tithēmi (to place); something set up for destruction, devoted to God''s judgment. Paul expresses willingness to be eternally separated from Christ for the sake of his Jewish kinsmen. This impossible wish reveals the depth of his love — a love that mirrors Christ''s own substitutionary self-giving.', 1),
  -- v.5 God blessed forever
  ('εὐλογητός', 'eulogētos', 'G2128', 'Blessed, worthy of praise — always used of God in the NT (never of humans). Applied here to Christ, it affirms his full deity: he is ''God over all, blessed forever.'' This is one of the clearest Pauline affirmations that Jesus Christ is God — not merely a divinely appointed Messiah but God himself, worthy of eternal praise.', 2),
  -- v.11 election
  ('ἐκλογή', 'eklogē', 'G1589', 'Election, choosing, selection — from ek (out of) + legō (to choose). God''s sovereign act of selecting individuals for salvation and service. In v.11, election operates before birth and apart from works, grounded solely in God''s purpose and calling. Election is not based on foreseen faith or merit but on God''s free, sovereign grace.', 3),
  -- v.16 sheweth mercy
  ('ἐλεέω', 'eleeō', 'G1653', 'To show mercy, to have compassion, to pity — mercy freely given to the undeserving. Salvation depends ''not of him that willeth, nor of him that runneth, but of God that sheweth mercy.'' Human desire (willeth) and effort (runneth) are not the ground of salvation; divine mercy is. This does not deny human responsibility but locates the ultimate cause in God''s sovereign compassion.', 4),
  -- v.21 potter
  ('κεραμεύς', 'kerameus', 'G2763', 'Potter — the craftsman who shapes clay. The potter-clay metaphor (drawn from Isaiah 29:16, 45:9, Jeremiah 18:1-6) illustrates God''s sovereign right over his creation. The potter has full authority to shape the same lump of clay into different vessels for different purposes. The analogy asserts God''s right, not his arbitrariness — God is both sovereign and just.', 5),
  -- v.33 stumblingstone
  ('πρόσκομμα', 'proskomma', 'G4348', 'Stumbling stone, obstacle — from pros (against) + koptō (to strike). Christ became the stone at which Israel stumbled. They expected a conquering king and received a crucified Messiah. Instead of believing and being saved, they tripped over the very foundation God had laid. The same Christ who is a stumbling stone for the disobedient is a precious cornerstone for believers (1 Pet 2:6-8).', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 9
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 5
    WHEN 3 THEN 11
    WHEN 4 THEN 16
    WHEN 5 THEN 21
    WHEN 6 THEN 33
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 accursed for brethren
  (3, 'Exodus 32:32', 1),
  -- v.4 privileges of Israel
  (4, 'Deuteronomy 7:6', 2),
  (4, 'Exodus 19:5-6', 3),
  -- v.5 Christ is God
  (5, 'John 1:1', 4),
  (5, 'Titus 2:13', 5),
  -- v.6 not all Israel
  (6, 'Romans 2:28-29', 6),
  (6, 'Galatians 6:16', 7),
  -- v.7 in Isaac thy seed
  (7, 'Genesis 21:12', 8),
  (7, 'Hebrews 11:18', 9),
  -- v.9 promise to Sarah
  (9, 'Genesis 18:10', 10),
  -- v.11 election before birth
  (11, 'Ephesians 1:4-5', 11),
  (11, '2 Timothy 1:9', 12),
  -- v.12 elder serve younger
  (12, 'Genesis 25:23', 13),
  -- v.13 Jacob loved Esau hated
  (13, 'Malachi 1:2-3', 14),
  -- v.15 mercy on whom I will
  (15, 'Exodus 33:19', 15),
  -- v.17 Pharaoh raised up
  (17, 'Exodus 9:16', 16),
  -- v.20 clay and potter
  (20, 'Isaiah 29:16', 17),
  (20, 'Isaiah 45:9', 18),
  (20, 'Jeremiah 18:1-6', 19),
  -- v.25 not my people called my people
  (25, 'Hosea 2:23', 20),
  (25, '1 Peter 2:10', 21),
  -- v.26 children of living God
  (26, 'Hosea 1:10', 22),
  -- v.27 remnant saved
  (27, 'Isaiah 10:22-23', 23),
  -- v.29 seed preserved
  (29, 'Isaiah 1:9', 24),
  -- v.33 stumblingstone
  (33, 'Isaiah 28:16', 25),
  (33, 'Isaiah 8:14', 26),
  (33, '1 Peter 2:6-8', 27)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 9
  AND v.verse_number = cr.verse_number;
