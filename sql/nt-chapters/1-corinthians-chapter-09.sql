-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 9 — Paul's Apostolic Rights Voluntarily Surrendered
-- 27 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 9,
  'First Corinthians 9 is Paul''s personal testimony of voluntary rights-renunciation, illustrating the principle of chapter 8: love limits liberty. Paul defends his apostleship (vv.1-2) — he has seen the risen Lord and the Corinthians themselves are his proof. He then catalogues his apostolic rights: the right to eat and drink at the church''s expense (v.4), the right to travel with a believing wife (v.5), the right to receive financial support instead of working (v.6). These rights are grounded in natural law (v.7), Mosaic law — ''thou shalt not muzzle the ox that treadeth out the corn'' (v.9) — and the Lord''s command that preachers should live from the gospel (v.14). Yet Paul has used ''none of these things'' (v.15). He would rather die than have anyone make his ''glorying'' void. He preaches not for profit but under divine compulsion: ''woe is unto me, if I preach not the gospel'' (v.16). His reward is making the gospel ''without charge'' (v.18). Though free from all, he makes himself ''servant unto all, that I might gain the more'' (v.19). To the Jew he becomes as a Jew; to those under the law, as under the law; to those without law, as without law; to the weak, as weak — ''I am made all things to all men, that I might by all means save some'' (v.22). The chapter concludes with the athletic metaphor: like a runner in the Isthmian Games (held near Corinth), Paul runs to win an incorruptible crown (vv.24-25). He disciplines his body (''I keep under my body'') lest after preaching to others he himself becomes a ''castaway'' (adokimos — disqualified, v.27). Self-discipline, not self-indulgence, marks the apostolic life.',
  'Voluntary Surrender of Rights — All Things to All Men',
  'ἐγκράτεια (enkrateia)',
  'Self-control, mastery over one''s desires — from en (in) + kratos (strength, power). Enkrateia is the athlete''s discipline, the ability to say no to legitimate pleasures for the sake of a higher goal. Paul applies it to his entire ministry: he voluntarily surrenders apostolic rights, adapts to every audience, and disciplines his body — all for the sake of winning the ''incorruptible crown.'' Self-control is not asceticism but purposeful restraint.',
  '["Paul''s Apostolic Credentials (vv.1-3): Am I not an apostle am I not free have I not seen Jesus Christ our Lord are not ye my work in the Lord. If I be not an apostle unto others yet doubtless I am to you for the seal of mine apostleship are ye in the Lord. Mine answer to them that do examine me is this","The Right to Financial Support (vv.4-12a): Have we not power to eat and to drink. Have we not power to lead about a sister a wife as well as other apostles and as the brethren of the Lord and Cephas. Or I only and Barnabas have not we power to forbear working. Who goeth a warfare any time at his own charges. Who planteth a vineyard and eateth not of the fruit thereof. Do I say these things as a man or saith not the law the same also. For it is written in the law of Moses thou shalt not muzzle the mouth of the ox that treadeth out the corn. If we have sown unto you spiritual things is it a great thing if we shall reap your carnal things","Why Paul Renounces His Rights (vv.12b-18): Nevertheless we have not used this power but suffer all things lest we should hinder the gospel of Christ. Even so hath the Lord ordained that they which preach the gospel should live of the gospel. But I have used none of these things. For though I preach the gospel I have nothing to glory of for necessity is laid upon me yea woe is unto me if I preach not the gospel. What is my reward then. Verily that when I preach the gospel I may make the gospel of Christ without charge","All Things to All Men (vv.19-23): For though I be free from all men yet have I made myself servant unto all that I might gain the more. And unto the Jews I became as a Jew that I might gain the Jews. To the weak became I as weak that I might gain the weak. I am made all things to all men that I might by all means save some. And this I do for the gospel''s sake that I might be partaker thereof with you","The Race and the Crown (vv.24-27): Know ye not that they which run in a race run all but one receiveth the prize. So run that ye may obtain. And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown but we an incorruptible. I therefore so run not as uncertainly so fight I not as one that beateth the air. But I keep under my body and bring it into subjection lest that by any means when I have preached to others I myself should be a castaway"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 27 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Am I not an apostle? am I not free? have I not seen Jesus Christ our Lord? are not ye my work in the Lord?',
   'οὐκ εἰμὶ ἀπόστολος οὐκ εἰμὶ ἐλεύθερος οὐχὶ Ἰησοῦν Χριστὸν τὸν κύριον ἡμῶν ἑώρακα οὐ τὸ ἔργον μου ὑμεῖς ἐστε ἐν κυρίῳ',
   'ouk eimi apostolos ouk eimi eleutheros ouchi Iēsoun Christon ton kyrion hēmōn heōraka ou to ergon mou hymeis este en kyriō',
   'Four rhetorical questions expecting ''yes.'' ''Am I not an apostle?'' — his office. ''Am I not free?'' — his liberty. ''Have I not seen Jesus Christ our Lord?'' (heōraka — perfect: I have seen and continue to bear witness) — the resurrection appearance that qualified him (cf. Acts 9:3-6; 1 Corinthians 15:8). ''Are not ye my work?'' — the Corinthians themselves are living proof of his apostleship.',
   NULL),
  (2, 'If I be not an apostle unto others, yet doubtless I am to you: for the seal of mine apostleship are ye in the Lord.',
   'εἰ ἄλλοις οὐκ εἰμὶ ἀπόστολος ἀλλά γε ὑμῖν εἰμι ἡ γὰρ σφραγίς τῆς ἐμῆς ἀποστολῆς ὑμεῖς ἐστε ἐν κυρίῳ',
   'ei allois ouk eimi apostolos alla ge hymin eimi hē gar sphragis tēs emēs apostolēs hymeis este en kyriō',
   '''Seal'' (sphragis — an authenticating stamp, a certification mark). The Corinthians'' very existence as a church is the seal — the divine certification — of Paul''s apostleship. Whatever others may doubt, the Corinthians cannot deny Paul''s authority: they are the product of it.',
   NULL),
  (3, 'Mine answer to them that do examine me is this.',
   'ἡ ἐμὴ ἀπολογία τοῖς ἐμὲ ἀνακρίνουσίν ἐστιν αὕτη',
   'hē emē apologia tois eme anakrinousin estin hautē',
   '''Answer'' (apologia — defence, reasoned response; the legal term from which ''apologetics'' derives). ''Examine'' (anakrinousin — investigate, cross-examine; a judicial term). Paul offers a formal defence against those who question his apostolic authority.',
   NULL),
  (4, 'Have we not power to eat and to drink?',
   'μὴ οὐκ ἔχομεν ἐξουσίαν φαγεῖν καὶ πιεῖν',
   'mē ouk echomen exousian phagein kai piein',
   '''Power'' (exousian — authority, right). The right to receive food and drink at the church''s expense — basic material support for those who labour in ministry. Paul begins listing the rights he possesses but has voluntarily renounced.',
   NULL),
  (5, 'Have we not power to lead about a sister, a wife, as well as other apostles, and as the brethren of the Lord, and Cephas?',
   'μὴ οὐκ ἔχομεν ἐξουσίαν ἀδελφὴν γυναῖκα περιάγειν ὡς καὶ οἱ λοιποὶ ἀπόστολοι καὶ οἱ ἀδελφοὶ τοῦ κυρίου καὶ Κηφᾶς',
   'mē ouk echomen exousian adelphēn gynaika periagein hōs kai hoi loipoi apostoloi kai hoi adelphoi tou kyriou kai Kēphas',
   '''Lead about'' (periagein — to take around, travel with). ''A sister, a wife'' (adelphēn gynaika — a believing wife). ''Other apostles... brethren of the Lord... Cephas'' — Peter and Jesus'' brothers (James, Jude, etc.) travelled with their wives at the churches'' expense. Paul also has this right but does not exercise it. This verse incidentally confirms that Peter was married and that Jesus'' brothers became church leaders.',
   NULL),
  (6, 'Or I only and Barnabas, have not we power to forbear working?',
   'ἢ μόνος ἐγὼ καὶ Βαρναβᾶς οὐκ ἔχομεν ἐξουσίαν τοῦ μὴ ἐργάζεσθαι',
   'ē monos egō kai Barnabas ouk echomen exousian tou mē ergazesthai',
   '''Forbear working'' (tou mē ergazesthai — to refrain from manual labour). Paul and Barnabas supported themselves through tent-making (Acts 18:3). Other apostles received church support; Paul and Barnabas chose to work. This was a deliberate strategy, not a lack of entitlement.',
   NULL),
  (7, 'Who goeth a warfare any time at his own charges? who planteth a vineyard, and eateth not of the fruit thereof? or who feedeth a flock, and eateth not of the milk of the flock?',
   'τίς στρατεύεται ἰδίοις ὀψωνίοις ποτέ τίς φυτεύει ἀμπελῶνα καὶ ἐκ τοῦ καρποῦ αὐτοῦ οὐκ ἐσθίει ἢ τίς ποιμαίνει ποίμνην καὶ ἐκ τοῦ γάλακτος τῆς ποίμνης οὐκ ἐσθίει',
   'tis strateuetai idiois opsōniois pote tis phyteuei ampelōna kai ek tou karpou autou ouk esthiei ē tis poimainei poimnēn kai ek tou galaktos tēs poimnēs ouk esthiei',
   'Three analogies from common life: (1) the soldier — no one serves in the army at his own expense; (2) the vinedresser — the planter eats the fruit; (3) the shepherd — the keeper drinks the milk. In every profession, the worker benefits from the work. Ministry is no different. The right to material support is grounded in natural justice.',
   NULL),
  (8, 'Say I these things as a man? or saith not the law the same also?',
   'μὴ κατὰ ἄνθρωπον ταῦτα λαλῶ ἢ οὐχὶ καὶ ὁ νόμος ταῦτα λέγει',
   'mē kata anthrōpon tauta lalō ē ouchi kai ho nomos tauta legei',
   '''As a man'' (kata anthrōpon — according to human reasoning alone). ''The law'' (ho nomos) — Paul moves from natural law to scriptural authority. His argument rests not merely on common sense but on divine legislation. The Torah itself supports the minister''s right to be compensated.',
   NULL),
  (9, 'For it is written in the law of Moses, Thou shalt not muzzle the mouth of the ox that treadeth out the corn. Doth God take care for oxen?',
   'ἐν γὰρ τῷ Μωϋσέως νόμῳ γέγραπται οὐ φιμώσεις βοῦν ἀλοῶντα μὴ τῶν βοῶν μέλει τῷ θεῷ',
   'en gar tō Mōyseōs nomō gegraptai ou phimōseis boun aloōnta mē tōn boōn melei tō theō',
   '''Thou shalt not muzzle the ox'' — quoting Deuteronomy 25:4. The ox treading grain should be allowed to eat while working. ''Doth God take care for oxen?'' — Paul uses a qal wahomer (lesser to greater) argument: if God cares that working oxen are fed, how much more should ministers be supported. The law''s deeper intent extends beyond animal welfare to the principle that all workers deserve their sustenance.',
   NULL),
  (10, 'Or saith he it altogether for our sakes? For our sakes, no doubt, this is written: that he that ploweth should plow in hope; and that he that thresheth in hope should be partaker of his hope.',
   'ἢ δι᾿ ἡμᾶς πάντως λέγει δι᾿ ἡμᾶς γὰρ ἐγράφη ὅτι ἐπ᾿ ἐλπίδι ὀφείλει ὁ ἀροτριῶν ἀροτριᾶν καὶ ὁ ἀλοῶν τῆς ἐλπίδος αὐτοῦ μετέχειν ἐπ᾿ ἐλπίδι',
   'ē di hēmas pantōs legei di hēmas gar egraphē hoti ep elpidi opheilei ho arotriōn arotrian kai ho aloōn tēs elpidos autou metechein ep elpidi',
   '''For our sakes'' (di hēmas — on our account). ''In hope'' (ep elpidi — with a reasonable expectation of sharing in the harvest). The ploughman and the thresher work with the expectation of reward. Similarly, those who labour in spiritual service should expect material support. Paul''s hermeneutic: the OT ox-muzzling law has a wider application for human workers, including gospel ministers.',
   NULL),
  (11, 'If we have sown unto you spiritual things, is it a great thing if we shall reap your carnal things?',
   'εἰ ἡμεῖς ὑμῖν τὰ πνευματικὰ ἐσπείραμεν μέγα εἰ ἡμεῖς ὑμῶν τὰ σαρκικὰ θερίσομεν',
   'ei hēmeis hymin ta pneumatika espeiramen mega ei hēmeis hymōn ta sarkika therisomen',
   '''Spiritual things'' (ta pneumatika — spiritual seed). ''Carnal things'' (ta sarkika — material, earthly provisions). The sowing/reaping metaphor: Paul sowed the gospel (spiritual seed) in Corinth; material support (a material harvest) is the expected return. The exchange is hardly equal — spiritual benefits infinitely outweigh material support. Is it really too much to ask?',
   NULL),
  (12, 'If others be partakers of this power over you, are not we rather? Nevertheless we have not used this power; but suffer all things, lest we should hinder the gospel of Christ.',
   'εἰ ἄλλοι τῆς ὑμῶν ἐξουσίας μετέχουσιν οὐ μᾶλλον ἡμεῖς ἀλλ᾿ οὐκ ἐχρησάμεθα τῇ ἐξουσίᾳ ταύτῃ ἀλλὰ πάντα στέγομεν ἵνα μὴ ἐγκοπήν τινα δῶμεν τῷ εὐαγγελίῳ τοῦ Χριστοῦ',
   'ei alloi tēs hymōn exousias metechousin ou mallon hēmeis all ouk echrēsametha tē exousia tautē alla panta stegomen hina mē enkopēn tina dōmen tō euangeliō tou Christou',
   '''Have not used'' (ouk echrēsametha — we did not exercise). ''Suffer all things'' (panta stegomen — we endure everything, bear all hardships). ''Hinder'' (enkopēn — cutting in, creating an obstacle; a military term for cutting a road to impede an enemy''s advance). Paul''s motive for not using his rights: to remove every possible obstacle to the gospel. Financial accusations could undermine his message. He accepts hardship so the gospel travels unhindered.',
   NULL),
  (13, 'Do ye not know that they which minister about holy things live of the things of the temple? and they which wait at the altar are partakers with the altar?',
   'οὐκ οἴδατε ὅτι οἱ τὰ ἱερὰ ἐργαζόμενοι ἐκ τοῦ ἱεροῦ ἐσθίουσιν οἱ τῷ θυσιαστηρίῳ προσεδρεύοντες τῷ θυσιαστηρίῳ συμμερίζονται',
   'ouk oidate hoti hoi ta hiera ergazomenoi ek tou hierou esthiousin hoi tō thysiastēriō prosedreuontes tō thysiastēriō symmerizontai',
   '''Minister about holy things'' — temple priests. ''Live of the temple'' — priests received portions of the sacrifices (Leviticus 6:16, 26; 7:6-10; Numbers 18:8-20). ''Partakers with the altar'' — they share in what is offered on the altar. Paul adds OT priesthood to his argument: even sacred service was compensated. The pattern is universal: those who serve in God''s work are supported by God''s people.',
   NULL),
  (14, 'Even so hath the Lord ordained that they which preach the gospel should live of the gospel.',
   'οὕτως καὶ ὁ κύριος διέταξεν τοῖς τὸ εὐαγγέλιον καταγγέλλουσιν ἐκ τοῦ εὐαγγελίου ζῆν',
   'houtōs kai ho kyrios dietaxen tois to euangelion katanggellousin ek tou euangeliou zēn',
   '''The Lord ordained'' (ho kyrios dietaxen — the Lord commanded, arranged). Paul cites Jesus'' own command (cf. Matthew 10:10; Luke 10:7): ''the labourer is worthy of his hire.'' This is the highest authority: nature (v.7), Moses (v.9), temple practice (v.13), and now the Lord Jesus himself. Gospel preachers have a divinely ordained right to financial support.',
   'Paul has built a four-layered argument for ministerial support: (1) natural analogy — soldiers, farmers, shepherds (v.7); (2) Mosaic law — the unmuzzled ox (v.9); (3) OT priesthood — temple workers eat from the temple (v.13); (4) dominical command — the Lord himself ordained it (v.14). Yet having established the right beyond all doubt, Paul will immediately declare that he has refused to exercise it (v.15). The entire argument serves to magnify his voluntary sacrifice.'),
  (15, 'But I have used none of these things: neither have I written these things, that it should be so done unto me: for it were better for me to die, than that any man should make my glorying void.',
   'ἐγὼ δὲ οὐ κέχρημαι οὐδενὶ τούτων οὐκ ἔγραψα δὲ ταῦτα ἵνα οὕτως γένηται ἐν ἐμοί καλὸν γάρ μοι μᾶλλον ἀποθανεῖν ἢ τὸ καύχημά μου οὐδεὶς κενώσει',
   'egō de ou kechrēmai oudeni toutōn ouk egrapsa de tauta hina houtōs genētai en emoi kalon gar moi mallon apothanein ē to kauchēma mou oudeis kenōsei',
   '''Used none'' (ou kechrēmai oudeni — I have availed myself of nothing; emphatic). ''Better for me to die'' (kalon moi mallon apothanein — stronger than preference: death is preferable to compromising his free proclamation). ''Make my glorying void'' (to kauchēma mou kenōsei — empty out my boast). Paul''s ''glory'' is not financial independence per se but the ability to offer the gospel ''free of charge'' (v.18). This is not pride but apostolic passion.',
   NULL),
  (16, 'For though I preach the gospel, I have nothing to glory of: for necessity is laid upon me; yea, woe is unto me, if I preach not the gospel!',
   'ἐὰν γὰρ εὐαγγελίζωμαι οὐκ ἔστιν μοι καύχημα ἀνάγκη γάρ μοι ἐπίκειται οὐαὶ δέ μοί ἐστιν ἐὰν μὴ εὐαγγελίζωμαι',
   'ean gar euangelizōmai ouk estin moi kauchēma anankē gar moi epikeitai ouai de moi estin ean mē euangelizōmai',
   '''Necessity is laid upon me'' (anankē moi epikeitai — compulsion presses upon me). ''Woe is unto me'' (ouai moi — a cry of distress). Preaching is not optional for Paul — it is a divine commission. Because he must preach, the act of preaching itself cannot be his boast. His boast must be something voluntary, beyond the call of duty: making the gospel free of charge.',
   NULL),
  (17, 'For if I do this thing willingly, I have a reward: but if against my will, a dispensation of the gospel is committed unto me.',
   'εἰ γὰρ ἑκὼν τοῦτο πράσσω μισθὸν ἔχω εἰ δὲ ἄκων οἰκονομίαν πεπίστευμαι',
   'ei gar hekōn touto prassō misthon echō ei de akōn oikonomian pepisteumai',
   '''Willingly'' (hekōn — voluntarily). ''Reward'' (misthon — wages, recompense). ''Against my will'' (akōn — unwillingly). ''Dispensation'' (oikonomian — stewardship, administration). Even if Paul preaches unwillingly, he has a stewardship entrusted to him. But voluntary service earns a reward. Paul''s ''reward'' is the privilege of offering the gospel without cost.',
   NULL),
  (18, 'What is my reward then? Verily that, when I preach the gospel, I may make the gospel of Christ without charge, that I abuse not my power in the gospel.',
   'τίς οὖν μοί ἐστιν ὁ μισθός ἵνα εὐαγγελιζόμενος ἀδάπανον θήσω τὸ εὐαγγέλιον τοῦ Χριστοῦ εἰς τὸ μὴ καταχρήσασθαι τῇ ἐξουσίᾳ μου ἐν τῷ εὐαγγελίῳ',
   'tis oun moi estin ho misthos hina euangelizomenos adapanon thēsō to euangelion tou Christou eis to mē katachrēsasthai tē exousia mou en tō euangeliō',
   '''Without charge'' (adapanon — free of cost, at no expense). ''Abuse not'' (mē katachrēsasthai — not to make full use of, not to exploit). Paul''s ''reward'' is paradoxical: it is the ability to forgo reward. His payoff is costlessness — the satisfaction of presenting the gospel with no financial strings attached. This protects both the integrity of the message and the purity of his motives.',
   NULL),
  (19, 'For though I be free from all men, yet have I made myself servant unto all, that I might gain the more.',
   'ἐλεύθερος γὰρ ὢν ἐκ πάντων πᾶσιν ἐμαυτὸν ἐδούλωσα ἵνα τοὺς πλείονας κερδήσω',
   'eleutheros gar ōn ek pantōn pasin emauton edoulōsa hina tous pleionas kerdēsō',
   '''Free from all'' (eleutheros ek pantōn — not obligated to anyone). ''Made myself servant'' (emauton edoulōsa — I enslaved myself; the voluntariness is key: free yet choosing slavery). ''Gain the more'' (tous pleionas kerdēsō — win the greatest number). Freedom paradoxically expressed through voluntary servitude. Paul''s freedom is not freedom for self-indulgence but freedom for self-giving service.',
   'This verse is the key to Paul''s entire ministry philosophy. True freedom is not the assertion of rights but the voluntary surrender of them for others'' sake. Paul is ''free from all'' — no one owns him, no one controls him. Yet he voluntarily ''enslaves himself to all'' in order to ''gain the more.'' This is the pattern of Christ himself (Philippians 2:6-8): equality with God not grasped at but freely laid aside for the sake of others. Christian leadership is voluntary downward mobility.'),
  (20, 'And unto the Jews I became as a Jew, that I might gain the Jews; to them that are under the law, as under the law, that I might gain them that are under the law;',
   'καὶ ἐγενόμην τοῖς Ἰουδαίοις ὡς Ἰουδαῖος ἵνα Ἰουδαίους κερδήσω τοῖς ὑπὸ νόμον ὡς ὑπὸ νόμον ἵνα τοὺς ὑπὸ νόμον κερδήσω',
   'kai egenomēn tois Ioudaiois hōs Ioudaios hina Ioudaious kerdēsō tois hypo nomon hōs hypo nomon hina tous hypo nomon kerdēsō',
   '''Became as a Jew'' (hōs Ioudaios — as a Jew; Paul adapted to Jewish customs when among Jews). ''Under the law'' (hypo nomon — subject to Torah observance). Paul circumcised Timothy (Acts 16:3), observed purification rites (Acts 21:23-26), and kept synagogue customs when among Jews. This was not hypocrisy but strategic accommodation: removing unnecessary barriers to the gospel while maintaining its substance.',
   NULL),
  (21, 'To them that are without law, as without law, (being not without law to God, but under the law to Christ,) that I might gain them that are without law.',
   'τοῖς ἀνόμοις ὡς ἄνομος μὴ ὢν ἄνομος θεῷ ἀλλ᾿ ἔννομος Χριστῷ ἵνα κερδήσω ἀνόμους',
   'tois anomois hōs anomos mē ōn anomos theō all ennomos Christō hina kerdēsō anomous',
   '''Without law'' (anomois — lawless, those outside the Mosaic code; i.e., Gentiles). ''Not without law to God'' (mē ōn anomos theō — not lawless toward God). ''Under the law to Christ'' (ennomos Christō — subject to Christ''s law, within the law of Christ). A crucial qualification: Paul''s flexibility has limits. He adapts culturally but not morally. He is always under Christ''s authority. ''The law of Christ'' (cf. Galatians 6:2) is the law of love that governs Christian conduct.',
   NULL),
  (22, 'To the weak became I as weak, that I might gain the weak: I am made all things to all men, that I might by all means save some.',
   'ἐγενόμην τοῖς ἀσθενέσιν ὡς ἀσθενής ἵνα τοὺς ἀσθενεῖς κερδήσω τοῖς πᾶσιν γέγονα τὰ πάντα ἵνα πάντως τινὰς σώσω',
   'egenomēn tois asthenesin hōs asthenēs hina tous astheneis kerdēsō tois pasin gegona ta panta hina pantōs tinas sōsō',
   '''The weak'' (tois asthenesin — those with scrupulous consciences; cf. ch.8). ''All things to all men'' (tois pasin gegona ta panta — to all people I have become all things; perfect tense: this is my settled practice). ''By all means save some'' (pantōs tinas sōsō — by every possible means to save some). ''Some'' (tinas) is realistic, not defeatist: not all will respond, but Paul adapts endlessly to reach as many as possible.',
   'This verse summarises Paul''s missionary methodology: cultural adaptability in the service of an unchanging gospel. ''All things to all men'' is not relativism or people-pleasing — it is strategic flexibility. Paul changes his approach (methods, customs, lifestyle) but never his message (the gospel of Christ crucified). The qualifying phrase ''that I might save some'' reveals the motive: evangelistic compassion, not chameleon-like conformity. The principle: accommodate everything except the gospel itself.'),
  (23, 'And this I do for the gospel''s sake, that I might be partaker thereof with you.',
   'τοῦτο δὲ ποιῶ διὰ τὸ εὐαγγέλιον ἵνα συγκοινωνὸς αὐτοῦ γένωμαι',
   'touto de poiō dia to euangelion hina synkoinōnos autou genōmai',
   '''For the gospel''s sake'' (dia to euangelion — on account of the gospel). ''Partaker thereof'' (synkoinōnos — fellow-sharer, co-participant). Paul participates in the gospel''s blessings alongside those he has won. His self-denial is not joyless asceticism but investment in shared blessing. He wants to share in the eschatological reward with his converts.',
   NULL),
  (24, 'Know ye not that they which run in a race run all, but one receiveth the prize? So run, that ye may obtain.',
   'οὐκ οἴδατε ὅτι οἱ ἐν σταδίῳ τρέχοντες πάντες μὲν τρέχουσιν εἷς δὲ λαμβάνει τὸ βραβεῖον οὕτως τρέχετε ἵνα καταλάβητε',
   'ouk oidate hoti hoi en stadiō trechontes pantes men trechousin heis de lambanei to brabeion houtōs trechete hina katalabēte',
   '''Race'' (stadiō — the stadium, the footrace). ''Prize'' (brabeion — the winner''s prize, the trophy). ''So run, that ye may obtain'' (houtōs trechete hina katalabēte — run in such a way as to seize the prize). The Isthmian Games were held biennially near Corinth — the Corinthians knew athletic competition intimately. Paul shifts to athletic metaphor: the Christian life demands the same discipline as competitive athletics.',
   NULL),
  (25, 'And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible.',
   'πᾶς δὲ ὁ ἀγωνιζόμενος πάντα ἐγκρατεύεται οὗτοι μὲν οὖν ἵνα φθαρτὸν στέφανον λάβωσιν ἡμεῖς δὲ ἄφθαρτον',
   'pas de ho agōnizomenos panta enkrateuetai houtoi men oun hina phtharton stephanon labōsin hēmeis de aphtharton',
   '''Striveth for the mastery'' (agōnizomenos — competing in the contest; from agōn, the games). ''Temperate in all things'' (panta enkrateuetai — exercises self-control in everything). ''Corruptible crown'' (phtharton stephanon — a perishable wreath; the Isthmian winners received a pine or celery wreath that soon withered). ''Incorruptible'' (aphtharton — imperishable, unfading). If athletes discipline themselves rigorously for a withering garland, how much more should Christians discipline themselves for an eternal reward.',
   NULL),
  (26, 'I therefore so run, not as uncertainly; so fight I, not as one that beateth the air:',
   'ἐγὼ τοίνυν οὕτως τρέχω ὡς οὐκ ἀδήλως οὕτως πυκτεύω ὡς οὐκ ἀέρα δέρων',
   'egō toinyn houtōs trechō hōs ouk adēlōs houtōs pykteuō hōs ouk aera derōn',
   '''Not as uncertainly'' (hōs ouk adēlōs — not without a clear goal, not aimlessly). ''Fight'' (pykteuō — box; from pyktēs, a boxer). ''Beateth the air'' (aera derōn — hitting the air, shadow-boxing). Two athletic images: (1) a runner with a clear finish line, not wandering; (2) a boxer who lands blows, not flailing at nothing. Paul''s ministry is purposeful and effective — every action counts toward the prize.',
   NULL),
  (27, 'But I keep under my body, and bring it into subjection: lest that by any means, when I have preached to others, I myself should be a castaway.',
   'ἀλλ᾿ ὑπωπιάζω μου τὸ σῶμα καὶ δουλαγωγῶ μήπως ἄλλοις κηρύξας αὐτὸς ἀδόκιμος γένωμαι',
   'all hypōpiazō mou to sōma kai doulagōgō mēpōs allois kēryxas autos adokimos genōmai',
   '''Keep under'' (hypōpiazō — to strike under the eye, give a black eye, bruise; metaphorically, to discipline severely). ''Bring it into subjection'' (doulagōgō — to lead as a slave, subjugate). ''Castaway'' (adokimos — disqualified, rejected after testing; the opposite of dokimos, approved). Paul fears disqualification, not loss of salvation: like an athlete who violates the rules and is disqualified from receiving the prize despite competing.',
   'This sobering conclusion links directly to the Corinthians'' own situation. If Paul himself — the great apostle — must discipline his body to avoid disqualification, how much more should the self-indulgent Corinthians exercise self-control. The word adokimos (castaway/disqualified) does not necessarily mean loss of eternal salvation but loss of reward and usefulness. Like a runner who breaks the rules, Paul could be ''disqualified'' from receiving the prize even after proclaiming the rules to others. This introduces chapter 10''s warnings from Israel''s history: a whole generation was ''disqualified'' in the wilderness despite experiencing God''s salvation.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 9;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 apostle
  ('ἀπόστολος', 'apostolos', 'G652', 'Apostle, one sent forth with a commission — from apo (from) + stellō (to send). In its technical sense, an apostolos is one personally commissioned by the risen Christ as an authoritative witness and church-planter. Paul''s apostleship was disputed by some in Corinth because he was not one of the original Twelve. His defence rests on two facts: he saw the risen Lord (v.1) and the Corinthians are the fruit of his ministry (v.2).', 1),
  -- v.9 muzzle
  ('φιμόω', 'phimoō', 'G5392', 'To muzzle, silence, gag — from phimos (a muzzle). Deuteronomy 25:4 forbids muzzling an ox while it treads grain — the working animal must be allowed to eat. Paul extracts a broader principle: all workers deserve to benefit from their labour. This includes gospel workers. The verb is used metaphorically of silencing opponents (Matthew 22:34; Mark 1:25), but here it retains its literal sense within the legal citation.', 2),
  -- v.12 hinder
  ('ἐγκοπή', 'enkopē', 'G1464', 'Hindrance, obstacle, impediment — from en (in) + koptō (to cut). Literally ''a cutting in'' — a military term for cutting a road or digging a trench to block an advancing army. Paul will endure any hardship rather than place an obstacle in the gospel''s path. His refusal of financial support is strategic: it removes the accusation that he preaches for profit and ensures the gospel advances without impediment.', 3),
  -- v.14 ordained
  ('διατάσσω', 'diatassō', 'G1299', 'To command, ordain, arrange, prescribe — from dia (through) + tassō (to arrange). A strong verb of authoritative instruction. ''The Lord ordained'' — this is not a suggestion but a divinely established order. Jesus himself commanded that gospel preachers should receive material support (Matthew 10:10; Luke 10:7). Paul treats Jesus'' words as having the same authority as OT Scripture.', 4),
  -- v.19 gain
  ('κερδαίνω', 'kerdainō', 'G2770', 'To gain, win, profit — a commercial term applied to evangelism. Paul seeks to ''gain'' people for Christ the way a merchant seeks profit. The word appears five times in vv.19-22 (gain Jews, gain those under law, gain those without law, gain the weak, save some). Each ''gaining'' represents a person transferred from death to life, from Satan''s kingdom to Christ''s. This is the currency of Paul''s ministry.', 5),
  -- v.25 temperate / self-control
  ('ἐγκρατεύομαι', 'enkrateuomai', 'G1467', 'To exercise self-control, to be temperate, to discipline oneself — from en (in) + kratos (strength). The athlete in training abstains from rich food, alcohol, and sexual indulgence. The self-control is total (panta — in all things) and purposeful (to win the crown). For the Christian, enkrateia is not puritanical joylessness but strategic discipline — saying no to lesser things in order to obtain the greater.', 6),
  -- v.25 incorruptible crown
  ('ἄφθαρτος', 'aphthartos', 'G862', 'Incorruptible, imperishable, immortal — from a (not) + phtheirō (to corrupt, destroy). The Isthmian crown was a pine wreath that withered within days. The Christian''s crown is aphthartos — it never fades, decays, or perishes. This contrast (perishable vs. imperishable) is the motivational logic for self-discipline: if athletes endure rigorous training for a wreath that rots, Christians should willingly endure far more for a reward that lasts forever.', 7),
  -- v.27 castaway / disqualified
  ('ἀδόκιμος', 'adokimos', 'G96', 'Disqualified, rejected after testing, unapproved — from a (not) + dokimos (tested and approved). In athletics, adokimos is the athlete who fails the test, breaks the rules, or is found unfit — disqualified from the competition despite having participated. Paul applies it to himself: even the apostle could be disqualified from the prize if he fails to discipline himself. This is not loss of salvation but loss of reward and ministry effectiveness.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 9
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1
    WHEN 2 THEN 9
    WHEN 3 THEN 12
    WHEN 4 THEN 14
    WHEN 5 THEN 19
    WHEN 6 THEN 25
    WHEN 7 THEN 25
    WHEN 8 THEN 27
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 seen the Lord
  (1, 'Acts 9:3-6', 1),
  (1, '1 Corinthians 15:8', 2),
  -- v.5 brethren of the Lord
  (5, 'Matthew 13:55', 3),
  (5, 'Galatians 1:19', 4),
  -- v.6 Barnabas worked
  (6, 'Acts 18:3', 5),
  (6, '2 Thessalonians 3:8', 6),
  -- v.9 muzzle the ox
  (9, 'Deuteronomy 25:4', 7),
  (9, '1 Timothy 5:18', 8),
  -- v.14 Lord ordained
  (14, 'Matthew 10:10', 9),
  (14, 'Luke 10:7', 10),
  -- v.16 woe unto me
  (16, 'Jeremiah 20:9', 11),
  -- v.19 servant unto all
  (19, 'Philippians 2:6-8', 12),
  (19, 'Mark 10:44-45', 13),
  -- v.20 became as a Jew
  (20, 'Acts 16:3', 14),
  (20, 'Acts 21:23-26', 15),
  -- v.21 law of Christ
  (21, 'Galatians 6:2', 16),
  -- v.22 all things to all men
  (22, 'Romans 1:14', 17),
  -- v.24 run the race
  (24, 'Philippians 3:14', 18),
  (24, 'Hebrews 12:1', 19),
  -- v.25 corruptible/incorruptible crown
  (25, '2 Timothy 4:8', 20),
  (25, 'James 1:12', 21),
  (25, '1 Peter 5:4', 22),
  (25, 'Revelation 2:10', 23),
  -- v.27 castaway
  (27, '2 Corinthians 13:5-6', 24),
  (27, '2 Timothy 2:5', 25)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 9
  AND v.verse_number = cr.verse_number;
