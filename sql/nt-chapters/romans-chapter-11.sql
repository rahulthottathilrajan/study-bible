-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 11 — Israel's Future and the Olive Tree
-- 36 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 11,
  'Romans 11 addresses the burning question: has God cast away his people Israel? Paul''s answer is an emphatic ''God forbid'' (v.1). He offers himself as evidence — an Israelite of the tribe of Benjamin (v.1). God has always preserved a remnant ''according to the election of grace'' (v.5), just as in Elijah''s day seven thousand had not bowed to Baal (vv.2-4). But the rest were ''blinded'' (v.7), and Paul quotes Isaiah and David to show this judicial hardening was prophesied (vv.8-10). Yet Israel''s fall has a redemptive purpose: ''through their fall salvation is come unto the Gentiles, for to provoke them to jealousy'' (v.11). If their fall enriched the world, how much more their fullness (v.12)! Paul then develops the olive tree metaphor (vv.13-24): Gentile believers are wild olive branches grafted into Israel''s cultivated tree. They must not boast against the natural branches, for God is able to graft Israel back in (vv.23-24). The chapter''s climax reveals a mystery: ''blindness in part is happened to Israel, until the fulness of the Gentiles be come in. And so all Israel shall be saved'' (vv.25-26). God has ''concluded them all in unbelief, that he might have mercy upon all'' (v.32). The chapter ends with one of Scripture''s greatest doxologies: ''O the depth of the riches both of the wisdom and knowledge of God! how unsearchable are his judgments, and his ways past finding out!'' (v.33).',
  'God Has Not Cast Away Israel — The Olive Tree and the Mystery of Israel''s Salvation',
  'μυστήριον (mystērion)',
  'Mystery — from myeō (to initiate into secrets). In Paul, mystērion does not mean something mysterious or incomprehensible but a divine secret now revealed: Israel''s partial hardening is temporary, lasting only ''until the fulness of the Gentiles be come in'' (v.25). This mystery reveals God''s plan to save both Gentile and Jew through a single redemptive drama.',
  '["The Remnant According to Grace (vv.1-6): God hath not cast away his people which he foreknew. Even so then at this present time also there is a remnant according to the election of grace and if by grace then is it no more of works otherwise grace is no more grace","Israel''s Stumbling and the Gentiles'' Gain (vv.7-12): What then? Israel hath not obtained that which he seeketh for but the election hath obtained it and the rest were blinded. Through their fall salvation is come unto the Gentiles for to provoke them to jealousy. Now if the fall of them be the riches of the world how much more their fulness","The Olive Tree: Warning Against Gentile Boasting (vv.13-24): For if thou wert cut out of the olive tree which is wild by nature and wert graffed contrary to nature into a good olive tree how much more shall these which be the natural branches be graffed into their own olive tree. Be not highminded but fear for if God spared not the natural branches take heed lest he also spare not thee","The Mystery Revealed: All Israel Shall Be Saved (vv.25-32): For I would not brethren that ye should be ignorant of this mystery lest ye should be wise in your own conceits that blindness in part is happened to Israel until the fulness of the Gentiles be come in and so all Israel shall be saved. For God hath concluded them all in unbelief that he might have mercy upon all","Doxology: The Unsearchable Wisdom of God (vv.33-36): O the depth of the riches both of the wisdom and knowledge of God how unsearchable are his judgments and his ways past finding out. For of him and through him and to him are all things to whom be glory for ever Amen"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 36 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'I say then, Hath God cast away his people? God forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.',
   'λέγω οὖν μὴ ἀπώσατο ὁ θεὸς τὸν λαὸν αὐτοῦ μὴ γένοιτο καὶ γὰρ ἐγὼ Ἰσραηλίτης εἰμί ἐκ σπέρματος Ἀβραάμ φυλῆς Βενιαμίν',
   'legō oun mē apōsato ho theos ton laon autou mē genoito kai gar egō Israēlitēs eimi ek spermatos Abraam phylēs Beniamin',
   '''Cast away'' (apōsato — thrust away, repudiated; an aorist: did God once-for-all reject?). ''God forbid'' (mē genoito — may it never be; Paul''s strongest denial, used 10 times in Romans). Paul himself is proof that God has not rejected Israel — he is an Israelite, a descendant of Abraham, of Benjamin''s tribe.',
   'Paul''s emphatic denial that God has rejected Israel is the thesis of the entire chapter. His own existence as a believing Israelite is Exhibit A. The question arises from chapters 9-10 where Israel''s unbelief is exposed. But God''s faithfulness to his covenant people is not nullified by their unbelief (cf. 3:3-4). The verb apōsato echoes Psalm 94:14 LXX: ''The LORD will not cast off his people.'''),
  (2, 'God hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to God against Israel, saying,',
   'οὐκ ἀπώσατο ὁ θεὸς τὸν λαὸν αὐτοῦ ὃν προέγνω ἢ οὐκ οἴδατε ἐν Ἠλίᾳ τί λέγει ἡ γραφή ὡς ἐντυγχάνει τῷ θεῷ κατὰ τοῦ Ἰσραήλ',
   'ouk apōsato ho theos ton laon autou hon proegnō ē ouk oidate en Ēlia ti legei hē graphē hōs entynchanei tō theō kata tou Israēl',
   '''Which he foreknew'' (hon proegnō — whom he knew beforehand; God''s prior knowledge of Israel is not merely cognitive but relational). ''Maketh intercession against'' (entynchanei kata — appeals to God against Israel; the prophet''s complaint). Paul draws a parallel: Elijah thought all Israel was lost, but God had preserved a remnant.',
   NULL),
  (3, 'Lord, they have killed thy prophets, and digged down thine altars; and I am left alone, and they seek my life.',
   'κύριε τοὺς προφήτας σου ἀπέκτειναν καὶ τὰ θυσιαστήριά σου κατέσκαψαν κἀγὼ ὑπελείφθην μόνος καὶ ζητοῦσιν τὴν ψυχήν μου',
   'kyrie tous prophētas sou apekteinan kai ta thysiastēria sou kateskapsan kagō hypeleiphthēn monos kai zētousin tēn psychēn mou',
   'Paul quotes 1 Kings 19:10, 14 (LXX). Elijah''s despair: prophets killed, altars demolished, and he alone remains. The prophet saw only apostasy and assumed God''s program had failed. This parallels the perception in Paul''s day that Israel''s rejection of Christ meant God''s plan had collapsed.',
   NULL),
  (4, 'But what saith the answer of God unto him? I have reserved to myself seven thousand men, who have not bowed the knee to the image of Baal.',
   'ἀλλὰ τί λέγει αὐτῷ ὁ χρηματισμός κατέλιπον ἐμαυτῷ ἑπτακισχιλίους ἄνδρας οἵτινες οὐκ ἔκαμψαν γόνυ τῇ Βάαλ',
   'alla ti legei autō ho chrēmatismos katelipon emautō heptakischilious andras hoitines ouk ekampsan gony tē Baal',
   '''Answer of God'' (chrēmatismos — divine oracle, response; used only here in the NT). ''I have reserved to myself'' (katelipon emautō — I left for myself; divine initiative: God preserved them). Seven thousand — God always maintains a faithful remnant even in the darkest apostasy.',
   NULL),
  (5, 'Even so then at this present time also there is a remnant according to the election of grace.',
   'οὕτως οὖν καὶ ἐν τῷ νῦν καιρῷ λεῖμμα κατ᾿ ἐκλογὴν χάριτος γέγονεν',
   'houtōs oun kai en tō nyn kairō leimma kat eklogēn charitos gegonen',
   '''Remnant'' (leimma — a remainder, what is left over). ''According to the election of grace'' (kat eklogēn charitos — chosen by grace). The remnant exists not because of their superior faithfulness but because of God''s gracious election. ''At this present time'' — just as in Elijah''s day, so now.',
   'The remnant principle is crucial to biblical theology. God never saves all Israel (ethnic totality) at any given moment, but he always preserves a faithful core. This remnant exists ''according to the election of grace'' — it is God''s sovereign, gracious choice, not human merit, that maintains the remnant. This is the key to understanding vv.25-26: ''all Israel'' will be saved, but through successive remnants across history, climaxing in eschatological restoration.'),
  (6, 'And if by grace, then is it no more of works: otherwise grace is no more grace. But if it be of works, then is it no more grace: otherwise work is no more work.',
   'εἰ δὲ χάριτι οὐκέτι ἐξ ἔργων ἐπεὶ ἡ χάρις οὐκέτι γίνεται χάρις εἰ δὲ ἐξ ἔργων οὐκέτι ἐστὶν χάρις ἐπεὶ τὸ ἔργον οὐκέτι ἐστὶν ἔργον',
   'ei de chariti ouketi ex ergōn epei hē charis ouketi ginetai charis ei de ex ergōn ouketi estin charis epei to ergon ouketi estin ergon',
   'Grace and works are mutually exclusive principles of salvation. If the remnant is preserved by grace, works cannot be the basis. If works were the basis, grace would cease to be grace. Paul states a logical impossibility: you cannot mix grace and merit without destroying both. This reaffirms the argument of chapters 3-4.',
   NULL),
  (7, 'What then? Israel hath not obtained that which he seeketh for; but the election hath obtained it, and the rest were blinded.',
   'τί οὖν ὃ ἐπιζητεῖ Ἰσραήλ τοῦτο οὐκ ἐπέτυχεν ἡ δὲ ἐκλογὴ ἐπέτυχεν οἱ δὲ λοιποὶ ἐπωρώθησαν',
   'ti oun ho epizētei Israēl touto ouk epetychen hē de eklogē epetychen hoi de loipoi epōrōthēsan',
   '''Seeketh for'' (epizētei — seeks earnestly; present tense: Israel keeps seeking). ''Obtained'' (epetychen — attained). ''The election'' (hē eklogē — the chosen ones, the elect remnant). ''Blinded'' (epōrōthēsan — hardened, made callous; from pōroō, to petrify, cover with a callus). The bulk of Israel was judicially hardened, while the elect remnant obtained righteousness by faith.',
   NULL),
  (8, '(According as it is written, God hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear;) unto this day.',
   'καθὼς γέγραπται ἔδωκεν αὐτοῖς ὁ θεὸς πνεῦμα κατανύξεως ὀφθαλμοὺς τοῦ μὴ βλέπειν καὶ ὦτα τοῦ μὴ ἀκούειν ἕως τῆς σήμερον ἡμέρας',
   'kathōs gegraptai edōken autois ho theos pneuma katanyxeōs ophthalmous tou mē blepein kai ōta tou mē akouein heōs tēs sēmeron hēmeras',
   'Paul combines Isaiah 29:10 and Deuteronomy 29:4. ''Spirit of slumber'' (pneuma katanyxeōs — a spirit of stupor, deep sleep). ''Unto this day'' — the hardening persists into Paul''s present. This is judicial hardening: God gives people over to the condition they have chosen.',
   NULL),
  (9, 'And David saith, Let their table be made a snare, and a trap, and a stumblingblock, and a recompence unto them:',
   'καὶ Δαυὶδ λέγει γενηθήτω ἡ τράπεζα αὐτῶν εἰς παγίδα καὶ εἰς θήραν καὶ εἰς σκάνδαλον καὶ εἰς ἀνταπόδομα αὐτοῖς',
   'kai Dauid legei genēthētō hē trapeza autōn eis pagida kai eis thēran kai eis skandalon kai eis antapodoma autois',
   'Quoting Psalm 69:22-23 (a messianic psalm). ''Table'' (trapeza — their table of abundance becomes a trap). ''Snare'' (pagida). ''Stumblingblock'' (skandalon). ''Recompence'' (antapodoma — recompense, requital). What should have been Israel''s blessing (the law, the promises) became their stumbling point.',
   NULL),
  (10, 'Let their eyes be darkened, that they may not see, and bow down their back alway.',
   'σκοτισθήτωσαν οἱ ὀφθαλμοὶ αὐτῶν τοῦ μὴ βλέπειν καὶ τὸν νῶτον αὐτῶν διὰ παντὸς σύγκαμψον',
   'skotisthētōsan hoi ophthalmoi autōn tou mē blepein kai ton nōton autōn dia pantos synkampson',
   'Continuing Psalm 69:23. ''Darkened eyes'' — inability to perceive spiritual truth. ''Bow down their back'' (synkampson — bend, weigh down; the posture of slavery). This judicial blindness is not permanent (as vv.25-26 will show) but serves God''s larger redemptive purpose.',
   NULL),
  (11, 'I say then, Have they stumbled that they should fall? God forbid: but rather through their fall salvation is come unto the Gentiles, for to provoke them to jealousy.',
   'λέγω οὖν μὴ ἔπταισαν ἵνα πέσωσιν μὴ γένοιτο ἀλλὰ τῷ αὐτῶν παραπτώματι ἡ σωτηρία τοῖς ἔθνεσιν εἰς τὸ παραζηλῶσαι αὐτούς',
   'legō oun mē eptaisan hina pesōsin mē genoito alla tō autōn paraptōmati hē sōtēria tois ethnesin eis to parazēlōsai autous',
   '''Stumbled'' (eptaisan — tripped). ''Fall'' (pesōsin — fall irreversibly). Paul distinguishes between stumbling and falling permanently. Israel stumbled but their fall is not final. ''Through their fall salvation is come unto the Gentiles'' — Israel''s rejection of the Messiah opened the door to Gentile inclusion. ''To provoke them to jealousy'' (parazēlōsai — to stir to jealousy; cf. Deuteronomy 32:21). The Gentiles'' salvation is designed to provoke Israel to return.',
   'This verse reveals the divine strategy behind Israel''s stumbling: it is not punitive but redemptive. God uses Israel''s fall to bring salvation to the Gentiles, and then uses Gentile salvation to provoke Israel to jealousy. This double reversal — Israel''s loss becoming Gentile gain, and Gentile gain becoming Israel''s recovery — displays the magnificent complexity of God''s saving plan.'),
  (12, 'Now if the fall of them be the riches of the world, and the diminishing of them the riches of the Gentiles; how much more their fulness?',
   'εἰ δὲ τὸ παράπτωμα αὐτῶν πλοῦτος κόσμου καὶ τὸ ἥττημα αὐτῶν πλοῦτος ἐθνῶν πόσῳ μᾶλλον τὸ πλήρωμα αὐτῶν',
   'ei de to paraptōma autōn ploutos kosmou kai to hēttēma autōn ploutos ethnōn posō mallon to plērōma autōn',
   '''Fall'' (paraptōma — trespass, false step). ''Riches'' (ploutos — wealth, abundance). ''Diminishing'' (hēttēma — loss, defeat). ''How much more their fulness'' (plērōma — fullness, full inclusion). A fortiori argument: if Israel''s rejection brought such blessing to the world, their future acceptance will bring immeasurably greater blessing.',
   NULL),
  (13, 'For I speak to you Gentiles, inasmuch as I am the apostle of the Gentiles, I magnify mine office:',
   'ὑμῖν γὰρ λέγω τοῖς ἔθνεσιν ἐφ᾿ ὅσον μὲν οὖν εἰμι ἐγὼ ἐθνῶν ἀπόστολος τὴν διακονίαν μου δοξάζω',
   'hymin gar legō tois ethnesin eph hoson men oun eimi egō ethnōn apostolos tēn diakonian mou doxazō',
   '''Apostle of the Gentiles'' — Paul now addresses the Gentile Christians directly. ''Magnify mine office'' (doxazō tēn diakonian mou — glorify my ministry). Paradoxically, Paul magnifies his Gentile ministry partly because it serves his desire to save his fellow Jews (v.14).',
   NULL),
  (14, 'If by any means I may provoke to emulation them which are my flesh, and might save some of them.',
   'εἴ πως παραζηλώσω μου τὴν σάρκα καὶ σώσω τινὰς ἐξ αὐτῶν',
   'ei pōs parazēlōsō mou tēn sarka kai sōsō tinas ex autōn',
   '''Provoke to emulation'' (parazēlōsō — make jealous; same verb as v.11). ''My flesh'' — Paul''s kinsmen according to the flesh. ''Save some of them'' — Paul is realistic: not all will respond, but some will. His Gentile ministry is designed to make Israel envious of the blessings they are missing.',
   NULL),
  (15, 'For if the casting away of them be the reconciling of the world, what shall the receiving of them be, but life from the dead?',
   'εἰ γὰρ ἡ ἀποβολὴ αὐτῶν καταλλαγὴ κόσμου τίς ἡ πρόσλημψις εἰ μὴ ζωὴ ἐκ νεκρῶν',
   'ei gar hē apobolē autōn katallagē kosmou tis hē proslēmpsis ei mē zōē ek nekrōn',
   '''Casting away'' (apobolē — rejection). ''Reconciling'' (katallagē — reconciliation; the world''s reconciliation to God). ''Receiving'' (proslēmpsis — acceptance back). ''Life from the dead'' (zōē ek nekrōn — resurrection life). Israel''s future restoration will be so glorious it is comparable to resurrection. This may be literal (triggering the general resurrection) or metaphorical (unprecedented spiritual awakening).',
   'This verse contains one of the most debated phrases in Romans: ''life from the dead.'' If Israel''s temporary rejection brought about the reconciliation of the whole world, their future acceptance will bring something even more extraordinary — ''life from the dead.'' Whether this refers to the bodily resurrection at Christ''s return or to an unprecedented global spiritual revival, it underscores the magnitude of Israel''s future restoration.'),
  (16, 'For if the firstfruit be holy, the lump is also holy: and if the root be holy, so are the branches.',
   'εἰ δὲ ἡ ἀπαρχὴ ἁγία καὶ τὸ φύραμα καὶ εἰ ἡ ῥίζα ἁγία καὶ οἱ κλάδοι',
   'ei de hē aparchē hagia kai to phyrama kai ei hē rhiza hagia kai hoi kladoi',
   '''Firstfruit'' (aparchē — the first portion offered to God; cf. Numbers 15:17-21). ''Lump'' (phyrama — the whole batch of dough). ''Root'' (rhiza) and ''branches'' (kladoi). Two metaphors making one point: the patriarchs (Abraham, Isaac, Jacob) are the firstfruit/root; their holiness (consecration to God) extends to the whole people. Israel''s covenant status is not annulled.',
   NULL),
  (17, 'And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree;',
   'εἰ δέ τινες τῶν κλάδων ἐξεκλάσθησαν σὺ δὲ ἀγριέλαιος ὢν ἐνεκεντρίσθης ἐν αὐτοῖς καὶ συγκοινωνὸς τῆς ῥίζης καὶ τῆς πιότητος τῆς ἐλαίας ἐγένου',
   'ei de tines tōn kladōn exeklasthēsan sy de agrielaios ōn enekentristhēs en autois kai synkoinōnos tēs rhizēs kai tēs piotētos tēs elaias egenou',
   '''Some of the branches'' (tines — only some, not all). ''Wild olive'' (agrielaios — an uncultivated olive; Gentiles by nature). ''Graffed in'' (enekentristhēs — grafted in; an agricultural metaphor for spiritual incorporation). ''Partakest'' (synkoinōnos — fellow-partaker, sharer). Gentile believers share in Israel''s spiritual heritage — they do not replace it.',
   'The olive tree metaphor is Paul''s most vivid picture of the relationship between Israel and the church. The cultivated olive tree represents God''s covenant people rooted in the patriarchs. Unbelieving Jewish branches were broken off; believing Gentiles (wild olive branches) were grafted in. This is incorporation, not replacement. The Gentiles share in Israel''s root — they do not become the root. This metaphor directly contradicts replacement theology (supersessionism).'),
  (18, 'Boast not against the branches. But if thou boast, thou bearest not the root, but the root thee.',
   'μὴ κατακαυχῶ τῶν κλάδων εἰ δὲ κατακαυχᾶσαι οὐ σὺ τὴν ῥίζαν βαστάζεις ἀλλ᾿ ἡ ῥίζα σέ',
   'mē katakaukhō tōn kladōn ei de katakaukhasai ou sy tēn rhizan bastazeis all hē rhiza se',
   '''Boast not'' (mē katakaukhō — do not exult over, do not look down upon). ''Thou bearest not the root, but the root thee'' — Gentile Christianity is supported by Israel''s heritage, not the reverse. The root (patriarchal promises) sustains the branches (both Jewish and Gentile believers). This corrects Gentile arrogance toward unbelieving Israel.',
   NULL),
  (19, 'Thou wilt say then, The branches were broken off, that I might be graffed in.',
   'ἐρεῖς οὖν ἐξεκλάσθησαν κλάδοι ἵνα ἐγὼ ἐγκεντρισθῶ',
   'ereis oun exeklasthēsan kladoi hina egō enkentristhō',
   'Paul anticipates the Gentile objection: the branches were removed precisely to make room for me. The claim is partially true — Israel''s unbelief opened the door (v.11). But the Gentile must not draw the wrong conclusion: that replacement is permanent or that Israel''s removal was for the Gentile''s glory rather than God''s redemptive purposes.',
   NULL),
  (20, 'Well; because of unbelief they were broken off, and thou standest by faith. Be not highminded, but fear:',
   'καλῶς τῇ ἀπιστίᾳ ἐξεκλάσθησαν σὺ δὲ τῇ πίστει ἕστηκας μὴ ὑψηλοφρόνει ἀλλὰ φοβοῦ',
   'kalōs tē apistia exeklasthēsan sy de tē pistei hestēkas mē hypsēlophronei alla phobou',
   '''Well'' (kalōs — granted, fair enough). ''Unbelief'' (apistia — the cause of Israel''s removal). ''Thou standest by faith'' (pistei hestēkas — you stand only by faith, not by ethnic or moral superiority). ''Be not highminded'' (mē hypsēlophronei — do not think lofty thoughts about yourself). ''But fear'' (phobou — reverent awe). The antidote to Gentile pride is fear of God.',
   NULL),
  (21, 'For if God spared not the natural branches, take heed lest he also spare not thee.',
   'εἰ γὰρ ὁ θεὸς τῶν κατὰ φύσιν κλάδων οὐκ ἐφείσατο μήπως οὐδὲ σοῦ φείσεται',
   'ei gar ho theos tōn kata physin kladōn ouk epheisato mēpōs oude sou pheisetai',
   '''Natural branches'' (kata physin kladōn — branches by nature, i.e., ethnic Israel). ''Spared not'' (ouk epheisato — did not spare). If God did not exempt Israel from judgment for unbelief despite their covenant privileges, Gentile believers have no grounds for presumption. This is a solemn warning against complacency.',
   NULL),
  (22, 'Behold therefore the goodness and severity of God: on them which fell, severity; but toward thee, goodness, if thou continue in his goodness: otherwise thou also shalt be cut off.',
   'ἴδε οὖν χρηστότητα καὶ ἀποτομίαν θεοῦ ἐπὶ μὲν τοὺς πεσόντας ἀποτομία ἐπὶ δὲ σὲ χρηστότης θεοῦ ἐὰν ἐπιμείνῃς τῇ χρηστότητι ἐπεὶ καὶ σὺ ἐκκοπήσῃ',
   'ide oun chrēstotēta kai apotomian theou epi men tous pesontas apotomia epi de se chrēstotēs theou ean epimeinēs tē chrēstotēti epei kai sy ekkopēsē',
   '''Goodness'' (chrēstotēta — kindness, generosity). ''Severity'' (apotomian — cutting off, sternness; from apo + temnō, to cut). God is both kind and severe — kind to those who trust him, severe toward unbelief. ''If thou continue'' (ean epimeinēs — conditional: perseverance is necessary). ''Cut off'' (ekkopēsē — hewn out). This is not a denial of eternal security but a warning to the Gentile community corporately.',
   NULL),
  (23, 'And they also, if they abide not still in unbelief, shall be graffed in: for God is able to graff them in again.',
   'καὶ ἐκεῖνοι δέ ἐὰν μὴ ἐπιμείνωσιν τῇ ἀπιστίᾳ ἐγκεντρισθήσονται δυνατὸς γάρ ἐστιν ὁ θεὸς πάλιν ἐγκεντρίσαι αὐτούς',
   'kai ekeinoi de ean mē epimeinōsin tē apistia enkentristhēsontai dynatos gar estin ho theos palin enkentrisai autous',
   '''If they abide not in unbelief'' — Israel''s hardening is not irreversible. ''God is able'' (dynatos estin ho theos — God has the power). The emphasis is on God''s ability and willingness. The regrafting is not merely possible but, as vv.25-26 will show, divinely promised.',
   NULL),
  (24, 'For if thou wert cut out of the olive tree which is wild by nature, and wert graffed contrary to nature into a good olive tree: how much more shall these, which be the natural branches, be graffed into their own olive tree?',
   'εἰ γὰρ σὺ ἐκ τῆς κατὰ φύσιν ἐξεκόπης ἀγριελαίου καὶ παρὰ φύσιν ἐνεκεντρίσθης εἰς καλλιέλαιον πόσῳ μᾶλλον οὗτοι οἱ κατὰ φύσιν ἐγκεντρισθήσονται τῇ ἰδίᾳ ἐλαίᾳ',
   'ei gar sy ek tēs kata physin exekopēs agrielaiou kai para physin enekentristhēs eis kallielaion posō mallon houtoi hoi kata physin enkentristhēsontai tē idia elaia',
   '''Contrary to nature'' (para physin — against nature; grafting a wild olive into a cultivated one is horticultural nonsense, making God''s act all the more remarkable). ''Good olive tree'' (kallielaion — cultivated olive). ''Their own olive tree'' (tē idia elaia — their own tree). If God could do the unnatural thing (graft wild branches in), how much more the natural thing (restore Israel''s own branches)! A fortiori logic.',
   NULL),
  (25, 'For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Israel, until the fulness of the Gentiles be come in.',
   'οὐ γὰρ θέλω ὑμᾶς ἀγνοεῖν ἀδελφοί τὸ μυστήριον τοῦτο ἵνα μὴ ἦτε παρ᾿ ἑαυτοῖς φρόνιμοι ὅτι πώρωσις ἀπὸ μέρους τῷ Ἰσραὴλ γέγονεν ἄχρις οὗ τὸ πλήρωμα τῶν ἐθνῶν εἰσέλθῃ',
   'ou gar thelō hymas agnoein adelphoi to mystērion touto hina mē ēte par heautois phronimoi hoti pōrōsis apo merous tō Israēl gegonen achris hou to plērōma tōn ethnōn eiselthē',
   '''Mystery'' (mystērion — a secret now divinely revealed). ''Blindness in part'' (pōrōsis apo merous — partial hardening; not total and not permanent). ''Until'' (achris hou — marking a temporal limit: the hardening will end). ''Fulness of the Gentiles'' (plērōma tōn ethnōn — the full number of Gentiles destined for salvation). Israel''s hardening serves a purpose and has an expiration date.',
   'This is one of the most important prophetic texts in the NT. Three elements of the mystery: (1) Israel''s hardening is partial (apo merous — some Jews believe in every generation); (2) It is temporary (achris hou — it has a terminus); (3) It will end when the ''fulness of the Gentiles'' comes in. The purpose of revealing this mystery is pastoral: ''lest ye should be wise in your own conceits'' — Gentile believers must not mistake Israel''s temporary hardening for permanent rejection.'),
  (26, 'And so all Israel shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:',
   'καὶ οὕτως πᾶς Ἰσραὴλ σωθήσεται καθὼς γέγραπται ἥξει ἐκ Σιὼν ὁ ῥυόμενος καὶ ἀποστρέψει ἀσεβείας ἀπὸ Ἰακώβ',
   'kai houtōs pas Israēl sōthēsetai kathōs gegraptai hēxei ek Siōn ho rhyomenos kai apostrepsei asebeias apo Iakōb',
   '''And so'' (kai houtōs — and in this manner, and thus; describing the process just outlined). ''All Israel'' (pas Israēl — the nation as a whole, not necessarily every individual). ''Shall be saved'' (sōthēsetai — future passive: will be saved by God). Paul quotes Isaiah 59:20-21 and Isaiah 27:9. ''The Deliverer'' (ho rhyomenos — the one who rescues) is Christ, who will turn away ungodliness from Jacob.',
   'This verse is the theological climax of Romans 9-11. ''All Israel shall be saved'' has been interpreted in three main ways: (1) All ethnic Israel will be saved at Christ''s return; (2) ''All Israel'' refers to the total number of elect Jews across history; (3) ''Israel'' includes both believing Jews and Gentiles (the church). The context most naturally supports (1): after the fulness of the Gentiles, ethnic Israel as a nation will turn to Christ. This is supported by the OT quotations that follow and by the distinction Paul maintains between Israel and Gentiles throughout chapters 9-11.'),
  (27, 'For this is my covenant unto them, when I shall take away their sins.',
   'καὶ αὕτη αὐτοῖς ἡ παρ᾿ ἐμοῦ διαθήκη ὅταν ἀφέλωμαι τὰς ἁμαρτίας αὐτῶν',
   'kai hautē autois hē par emou diathēkē hotan aphelōmai tas hamartias autōn',
   '''Covenant'' (diathēkē — covenant, testament). ''Take away their sins'' (aphelōmai — remove). Combining Isaiah 59:21 and Isaiah 27:9, Paul anchors Israel''s future salvation in God''s covenant promise. The new covenant (Jeremiah 31:31-34) guarantees the removal of Israel''s sins.',
   NULL),
  (28, 'As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes.',
   'κατὰ μὲν τὸ εὐαγγέλιον ἐχθροὶ δι᾿ ὑμᾶς κατὰ δὲ τὴν ἐκλογὴν ἀγαπητοὶ διὰ τοὺς πατέρας',
   'kata men to euangelion echthroi di hymas kata de tēn eklogēn agapētoi dia tous pateras',
   '''Enemies'' (echthroi — hostile, opposed; in relation to the gospel). ''For your sakes'' (di hymas — Israel''s opposition to the gospel benefits the Gentiles). ''Beloved'' (agapētoi — still loved by God). ''For the fathers'' sakes'' (dia tous pateras — because of Abraham, Isaac, and Jacob). Israel occupies a paradoxical position: enemies in terms of gospel response, yet beloved in terms of election.',
   'This verse captures the tension of Israel''s current status. From the perspective of the gospel, they are in opposition — and this opposition providentially benefits the Gentiles. But from the perspective of election, they remain beloved because of the patriarchal promises. God''s love for Israel is not based on Israel''s current response but on his irrevocable choice of the fathers.'),
  (29, 'For the gifts and calling of God are without repentance.',
   'ἀμεταμέλητα γὰρ τὰ χαρίσματα καὶ ἡ κλῆσις τοῦ θεοῦ',
   'ametamelēta gar ta charismata kai hē klēsis tou theou',
   '''Without repentance'' (ametamelēta — irrevocable, not subject to change of mind). ''Gifts'' (charismata — grace-gifts). ''Calling'' (klēsis — divine calling). God does not reverse his gifts or calling. What he gave to Israel — the covenants, the promises, the adoption (9:4-5) — he will not take back. This is the theological foundation for Israel''s future restoration.',
   'This verse is a cornerstone of the doctrine of God''s faithfulness. The gifts (charismata) and calling (klēsis) God bestowed on Israel are irrevocable (ametamelēta). God does not change his mind about his covenant commitments. This applies not only to Israel nationally but establishes a principle about God''s character: when God gives and calls, he does not withdraw. This undergirds the security of all who are called by God (cf. 8:28-30).'),
  (30, 'For as ye in times past have not believed God, yet have now obtained mercy through their unbelief:',
   'ὥσπερ γὰρ καὶ ὑμεῖς ποτὲ ἠπειθήσατε τῷ θεῷ νῦν δὲ ἠλεήθητε τῇ τούτων ἀπειθείᾳ',
   'hōsper gar kai hymeis pote ēpeithēsate tō theō nyn de ēleēthēte tē toutōn apeitheia',
   '''Not believed'' (ēpeithēsate — were disobedient). ''Obtained mercy'' (ēleēthēte — received mercy; passive: mercy was given by God). ''Through their unbelief'' (tē toutōn apeitheia — by means of their disobedience). The Gentiles'' former disobedience yielded to mercy through Israel''s unbelief. The pattern is about to reverse (v.31).',
   NULL),
  (31, 'Even so have these also now not believed, that through your mercy they also may obtain mercy.',
   'οὕτως καὶ οὗτοι νῦν ἠπείθησαν τῷ ὑμετέρῳ ἐλέει ἵνα καὶ αὐτοὶ ἐλεηθῶσιν',
   'houtōs kai houtoi nyn ēpeithēsan tō hymeterō eleei hina kai autoi eleēthōsin',
   '''Through your mercy'' — the mercy shown to Gentiles is designed to become the means by which Israel also receives mercy. The cycle of mercy is complete: Israel''s unbelief → Gentile mercy → Israel''s restoration. God''s mercy circulates through the disobedience of all to reach all.',
   NULL),
  (32, 'For God hath concluded them all in unbelief, that he might have mercy upon all.',
   'συνέκλεισεν γὰρ ὁ θεὸς τοὺς πάντας εἰς ἀπείθειαν ἵνα τοὺς πάντας ἐλεήσῃ',
   'synekleisen gar ho theos tous pantas eis apeitheian hina tous pantas eleēsē',
   '''Concluded'' (synekleisen — shut up together, confined, locked in; from syn + kleiō). ''All'' (tous pantas — the all, every one). ''Unbelief'' (apeitheian — disobedience). ''Have mercy upon all'' — God has imprisoned all — both Jew and Gentile — in disobedience, so that his mercy might reach all without exception. Neither Jew nor Gentile can boast; both depend entirely on mercy.',
   'This is one of Paul''s most sweeping theological statements. God has ''shut up'' (synekleisen) all humanity — Jew and Gentile alike — in disobedience. The purpose is not vindictive but redemptive: ''that he might have mercy upon all.'' This does not teach universalism (that all will eventually be saved) but that mercy is the only way anyone is saved. Both Jew and Gentile come to God on the same basis: divine mercy received through faith. This verse prepares for the doxology that follows.'),
  (33, 'O the depth of the riches both of the wisdom and knowledge of God! how unsearchable are his judgments, and his ways past finding out!',
   'ὦ βάθος πλούτου καὶ σοφίας καὶ γνώσεως θεοῦ ὡς ἀνεξερεύνητα τὰ κρίματα αὐτοῦ καὶ ἀνεξιχνίαστοι αἱ ὁδοὶ αὐτοῦ',
   'ō bathos ploutou kai sophias kai gnōseōs theou hōs anexereunēta ta krimata autou kai anexichniastoi hai hodoi autou',
   '''O the depth'' (ō bathos — an exclamation of awe). ''Riches'' (ploutou — wealth). ''Wisdom'' (sophias — God''s wise plan). ''Knowledge'' (gnōseōs — God''s perfect understanding). ''Unsearchable'' (anexereunēta — unable to be searched out, fathomless). ''Past finding out'' (anexichniastoi — untraceable, leaving no footprints). Paul moves from theology to doxology — the only fitting response to God''s plan.',
   'This is one of the greatest doxologies in Scripture. After eleven chapters of dense theological argument — human sin (1-3), justification by faith (3-5), sanctification (6-8), and Israel''s destiny (9-11) — Paul erupts in worship. The three genitives (riches, wisdom, knowledge) correspond to the three sections of chapters 9-11: God''s sovereign riches in election (ch.9), God''s wisdom in the gospel plan (ch.10), and God''s knowledge of future restoration (ch.11).'),
  (34, 'For who hath known the mind of the Lord? or who hath been his counsellor?',
   'τίς γὰρ ἔγνω νοῦν κυρίου ἢ τίς σύμβουλος αὐτοῦ ἐγένετο',
   'tis gar egnō noun kyriou ē tis symboulos autou egeneto',
   'Quoting Isaiah 40:13 (LXX). ''Known the mind'' (egnō noun — comprehended the mind). ''Counsellor'' (symboulos — advisor). Two rhetorical questions expecting the answer ''no one.'' God''s plan was not derived from human wisdom or counsel. He is the sole architect of redemption.',
   NULL),
  (35, 'Or who hath first given to him, and it shall be recompensed unto him again?',
   'ἢ τίς προέδωκεν αὐτῷ καὶ ἀνταποδοθήσεται αὐτῷ',
   'ē tis proedōken autō kai antapodothēsetai autō',
   '''First given'' (proedōken — given beforehand). ''Recompensed'' (antapodothēsetai — repaid). Echoing Job 41:11. No one has put God in their debt. God is not obligated to anyone. All grace is unmerited because no one has a prior claim on God.',
   NULL),
  (36, 'For of him, and through him, and to him, are all things: to whom be glory for ever. Amen.',
   'ὅτι ἐξ αὐτοῦ καὶ δι᾿ αὐτοῦ καὶ εἰς αὐτὸν τὰ πάντα αὐτῷ ἡ δόξα εἰς τοὺς αἰῶνας ἀμήν',
   'hoti ex autou kai di autou kai eis auton ta panta autō hē doxa eis tous aiōnas amēn',
   '''Of him'' (ex autou — from him as source and origin). ''Through him'' (di autou — through him as sustainer and mediator). ''To him'' (eis auton — unto him as goal and destiny). ''All things'' (ta panta — the totality of creation and redemption). God is the source, means, and end of everything. ''Glory for ever. Amen'' — the only fitting response.',
   'This trinitarian doxology summarises all of Romans 1-11. ''Of him'' (the Father as source), ''through him'' (the Son as mediator), ''to him'' (the Spirit who brings all things to their goal) — though the verse may also refer to God in his unity. The three prepositions (ex, dia, eis) encompass all of reality: origin, process, and destination. Everything comes from God, is sustained by God, and returns to God for his glory. This is the goal of all theology: doxology.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 11;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 cast away
  ('ἀπωθέω', 'apōtheō', 'G683', 'To thrust away, reject, repudiate — from apo (away) + ōtheō (to push). Paul asks whether God has pushed away his people permanently. The emphatic mē genoito (God forbid!) shows this is unthinkable. God''s covenant faithfulness cannot be nullified by Israel''s unfaithfulness.', 1),
  -- v.5 remnant
  ('λεῖμμα', 'leimma', 'G3005', 'A remnant, a remainder — from leipō (to leave). The remnant is what God leaves for himself. In every generation, God preserves a faithful core within Israel. This remnant exists not by human merit but by divine election according to grace (kat eklogēn charitos). The remnant principle bridges God''s faithfulness to Israel and the reality of widespread unbelief.', 2),
  -- v.7 blinded/hardened
  ('πωρόω', 'pōroō', 'G4456', 'To harden, petrify, cover with a callus — from pōros (a kind of stone, calcite). Used of Israel''s spiritual insensibility. The hardening is judicial: God confirms the condition they have chosen. This is not arbitrary cruelty but the solemn consequence of persistent rejection of light. The hardening is partial (apo merous, v.25) and temporary (achris hou, v.25).', 3),
  -- v.11 provoke to jealousy
  ('παραζηλόω', 'parazēloō', 'G3863', 'To provoke to jealousy, stir to emulation — from para (alongside) + zēloō (to be zealous). God uses the Gentiles'' salvation to awaken Israel''s desire for the blessings they are missing. This jealousy is redemptive, not petty — it is God''s strategy to bring Israel back through the spectacle of Gentile faith and blessing.', 4),
  -- v.17 grafted in
  ('ἐγκεντρίζω', 'enkentrizō', 'G1461', 'To graft in, engraft — from en (in) + kentrizō (to prick, goad). An agricultural term for inserting a shoot into a slit in a tree. Normally the cultivated branch is grafted into the wild stock (to improve the fruit); Paul reverses this: wild branches (Gentiles) are grafted into the cultivated tree (Israel). The reversal emphasises divine grace overriding natural order.', 5),
  -- v.25 mystery
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery, divine secret now revealed — from myeō (to initiate). In Paul, mystērion is not something incomprehensible but a previously hidden plan now disclosed by revelation. The mystery here has three elements: (1) Israel''s hardening is partial; (2) it is temporary; (3) it will end when the full number of Gentiles enters. This revelation is given to prevent Gentile arrogance.', 6),
  -- v.29 without repentance / irrevocable
  ('ἀμεταμέλητος', 'ametamelētos', 'G278', 'Irrevocable, not to be repented of, without change of mind — from a (not) + metamelomai (to change one''s mind after the fact, to regret). God does not regret his gifts or calling. What he has promised to Israel, he will fulfil. This is the ground of Israel''s future hope and of every believer''s security: God''s commitments are permanent.', 7),
  -- v.33 unsearchable
  ('ἀνεξερεύνητος', 'anexereunētos', 'G419', 'Unsearchable, inscrutable, impossible to explore fully — from a (not) + ex (out) + ereunaō (to search). God''s judgments cannot be exhaustively investigated. Human reason can apprehend God''s plan but never comprehend it fully. The proper response to divine mystery is not frustration but worship, as Paul demonstrates in this climactic doxology.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 11
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 5
    WHEN 3 THEN 7
    WHEN 4 THEN 11
    WHEN 5 THEN 17
    WHEN 6 THEN 25
    WHEN 7 THEN 29
    WHEN 8 THEN 33
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 God has not cast away his people
  (1, 'Psalm 94:14', 1),
  (1, '1 Samuel 12:22', 2),
  -- v.2 foreknew
  (2, 'Romans 8:29', 3),
  (2, '1 Kings 19:10', 4),
  -- v.4 seven thousand
  (4, '1 Kings 19:18', 5),
  -- v.5 remnant by grace
  (5, 'Romans 9:27', 6),
  (5, 'Isaiah 10:22', 7),
  -- v.6 grace not works
  (6, 'Romans 4:4-5', 8),
  (6, 'Ephesians 2:8-9', 9),
  -- v.8 spirit of slumber
  (8, 'Isaiah 29:10', 10),
  (8, 'Deuteronomy 29:4', 11),
  -- v.9 table a snare
  (9, 'Psalm 69:22-23', 12),
  -- v.11 through their fall
  (11, 'Acts 13:46', 13),
  (11, 'Acts 18:6', 14),
  (11, 'Deuteronomy 32:21', 15),
  -- v.12 how much more their fulness
  (12, 'Isaiah 11:11-12', 16),
  -- v.15 life from the dead
  (15, 'Ezekiel 37:1-14', 17),
  -- v.16 firstfruit holy
  (16, 'Numbers 15:17-21', 18),
  -- v.17 wild olive grafted
  (17, 'Ephesians 2:11-13', 19),
  (17, 'John 15:1-6', 20),
  -- v.20 stand by faith
  (20, '1 Corinthians 10:12', 21),
  (20, '2 Corinthians 1:24', 22),
  -- v.22 goodness and severity
  (22, 'John 15:2', 23),
  -- v.25 mystery — fulness of Gentiles
  (25, 'Luke 21:24', 24),
  (25, 'Ephesians 3:3-6', 25),
  -- v.26 all Israel saved
  (26, 'Isaiah 59:20-21', 26),
  (26, 'Isaiah 27:9', 27),
  (26, 'Jeremiah 31:31-34', 28),
  -- v.28 beloved for the fathers
  (28, 'Deuteronomy 7:8', 29),
  (28, 'Deuteronomy 10:15', 30),
  -- v.29 gifts irrevocable
  (29, 'Numbers 23:19', 31),
  (29, 'Romans 8:28-30', 32),
  -- v.32 concluded all in unbelief
  (32, 'Galatians 3:22', 33),
  (32, 'Romans 3:9-20', 34),
  -- v.33 depth of riches
  (33, 'Job 11:7-8', 35),
  (33, 'Isaiah 55:8-9', 36),
  -- v.34 who hath known
  (34, 'Isaiah 40:13', 37),
  (34, '1 Corinthians 2:16', 38),
  -- v.35 who hath first given
  (35, 'Job 41:11', 39),
  -- v.36 of him through him to him
  (36, '1 Corinthians 8:6', 40),
  (36, 'Colossians 1:16-17', 41)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 11
  AND v.verse_number = cr.verse_number;
