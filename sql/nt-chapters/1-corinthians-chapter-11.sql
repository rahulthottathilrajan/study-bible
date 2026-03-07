-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 11 — Head Coverings and the Lord's Supper
-- 34 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 11,
  'First Corinthians 11 addresses two issues of public worship: head coverings during prayer and prophecy (vv.2-16) and abuses of the Lord''s Supper (vv.17-34). Paul commends the Corinthians for keeping the ''ordinances'' (paradoseis — traditions) he delivered (v.2), then introduces the headship principle: ''the head of every man is Christ; and the head of the woman is the man; and the head of Christ is God'' (v.3). From this, Paul argues that a man who prays or prophesies with his head covered dishonours his head (Christ), while a woman who prays or prophesies with her head uncovered dishonours her head (her husband) — it is as if her head were shaved (vv.4-6). Man is the ''image and glory of God,'' while woman is the ''glory of the man'' (v.7). Yet Paul qualifies: ''neither is the man without the woman, neither the woman without the man, in the Lord'' (v.11) — mutual interdependence. The section on the Lord''s Supper is sharply corrective: ''when ye come together in the church, I hear that there be divisions among you'' (v.18). The wealthy eat and drink to excess while the poor go hungry (v.21). This is not the Lord''s Supper at all (v.20). Paul then delivers the earliest written account of the Last Supper: ''the Lord Jesus the same night in which he was betrayed took bread... This is my body, which is broken for you: this do in remembrance of me'' (vv.23-24). Likewise the cup: ''This cup is the new testament in my blood'' (v.25). To eat and drink ''unworthily'' is to be ''guilty of the body and blood of the Lord'' (v.27). Self-examination is required (v.28). Failure to ''discern the Lord''s body'' results in divine chastening — ''many are weak and sickly among you, and many sleep'' (v.30). The chapter ends with practical instruction: ''when ye come together to eat, tarry one for another'' (v.33).',
  'Order in Worship — Head Coverings and the Lord''s Supper',
  'ἀνάμνησις (anamnēsis)',
  'Remembrance, memorial, recollection — from ana (again) + mimnēskō (to remember). Anamnēsis in the Lord''s Supper is not mere psychological recall but an active, liturgical re-presenting of Christ''s death. Each celebration is a proclamation (katangellō) of the Lord''s death ''till he come'' (v.26). The Supper looks backward to the cross, inward in self-examination, and forward to Christ''s return.',
  '["Head Coverings in Worship (vv.2-16): Now I praise you brethren that ye remember me in all things and keep the ordinances as I delivered them to you. But I would have you know that the head of every man is Christ and the head of the woman is the man and the head of Christ is God. Every man praying or prophesying having his head covered dishonoureth his head. But every woman that prayeth or prophesieth with her head uncovered dishonoureth her head. Nevertheless neither is the man without the woman neither the woman without the man in the Lord","Abuses at the Lord''s Supper (vv.17-22): Now in this that I declare unto you I praise you not that ye come together not for the better but for the worse. For first of all when ye come together in the church I hear that there be divisions among you. When ye come together therefore into one place this is not to eat the Lord''s supper. For in eating every one taketh before other his own supper and one is hungry and another is drunken. What have ye not houses to eat and to drink in or despise ye the church of God and shame them that have not","The Institution of the Lord''s Supper (vv.23-26): For I have received of the Lord that which also I delivered unto you that the Lord Jesus the same night in which he was betrayed took bread and when he had given thanks he brake it and said Take eat this is my body which is broken for you this do in remembrance of me. After the same manner also he took the cup when he had supped saying This cup is the new testament in my blood this do ye as oft as ye drink it in remembrance of me. For as often as ye eat this bread and drink this cup ye do shew the Lord''s death till he come","Self-Examination and Judgment (vv.27-34): Wherefore whosoever shall eat this bread and drink this cup of the Lord unworthily shall be guilty of the body and blood of the Lord. But let a man examine himself and so let him eat of that bread and drink of that cup. For he that eateth and drinketh unworthily eateth and drinketh damnation to himself not discerning the Lord''s body. For this cause many are weak and sickly among you and many sleep. For if we would judge ourselves we should not be judged"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 34 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Be ye followers of me, even as I also am of Christ.',
   'μιμηταί μου γίνεσθε καθὼς κἀγὼ Χριστοῦ',
   'mimētai mou ginesthe kathōs kagō Christou',
   '''Followers'' (mimētai — imitators). ''Of me, as I of Christ'' — Paul is not setting himself up as the ultimate model but as a transparent intermediary. He imitates Christ; they should imitate him. This verse properly concludes the discussion of chapters 8-10 while transitioning to chapter 11''s worship issues.',
   NULL),
  (2, 'Now I praise you, brethren, that ye remember me in all things, and keep the ordinances, as I delivered them to you.',
   'ἐπαινῶ δὲ ὑμᾶς ἀδελφοί ὅτι πάντα μου μέμνησθε καὶ καθὼς παρέδωκα ὑμῖν τὰς παραδόσεις κατέχετε',
   'epainō de hymas adelphoi hoti panta mou memnēsthe kai kathōs paredōka hymin tas paradoseis katechete',
   '''Praise'' (epainō — commend). ''Ordinances'' (paradoseis — traditions, what has been handed down; from paradidōmi). ''As I delivered'' (kathōs paredōka — as I handed over). Paul commends them for maintaining the apostolic traditions. This commendation contrasts sharply with v.17 where he will declare: ''I praise you not.''',
   NULL),
  (3, 'But I would have you know, that the head of every man is Christ; and the head of the woman is the man; and the head of Christ is God.',
   'θέλω δὲ ὑμᾶς εἰδέναι ὅτι παντὸς ἀνδρὸς ἡ κεφαλὴ ὁ Χριστός ἐστιν κεφαλὴ δὲ γυναικὸς ὁ ἀνήρ κεφαλὴ δὲ τοῦ Χριστοῦ ὁ θεός',
   'thelō de hymas eidenai hoti pantos andros hē kephalē ho Christos estin kephalē de gynaikos ho anēr kephalē de tou Christou ho theos',
   '''Head'' (kephalē — head; debated whether it means ''authority over'' or ''source/origin''). Three relationships: Christ is head of man; man is head of woman; God is head of Christ. The sequence is not hierarchical (God → Christ → man → woman) but chiastic, suggesting different types of relationships. ''Head of Christ is God'' — this refers to the economic Trinity (Christ''s voluntary submission in redemption), not ontological subordination.',
   'This verse is one of the most discussed in all of Paul''s letters. The meaning of kephalē (head) is the key interpretive question. Two main options: (1) ''authority over'' — establishing a chain of authority; (2) ''source/origin'' — man comes from Christ (creation), woman from man (Eve from Adam), Christ from God (eternal generation). Both interpretations have strong supporters. What is clear is that the ''headship'' of God over Christ does not imply inferiority: Christ is fully God. Similarly, man''s ''headship'' over woman does not imply ontological superiority — it describes a functional relationship within essential equality.'),
  (4, 'Every man praying or prophesying, having his head covered, dishonoureth his head.',
   'πᾶς ἀνὴρ προσευχόμενος ἢ προφητεύων κατὰ κεφαλῆς ἔχων καταισχύνει τὴν κεφαλὴν αὐτοῦ',
   'pas anēr proseuchomenos ē prophēteuōn kata kephalēs echōn kataischynei tēn kephalēn autou',
   '''Having his head covered'' (kata kephalēs echōn — having something down over the head). ''Dishonoureth'' (kataischynei — shames, disgraces). A man praying or prophesying with a covered head shames Christ (his ''head'' in v.3). In Roman culture, men covered their heads during pagan worship (capite velato). Paul may be distinguishing Christian worship from pagan practice.',
   NULL),
  (5, 'But every woman that prayeth or prophesieth with her head uncovered dishonoureth her head: for that is even all one as if she were shaven.',
   'πᾶσα δὲ γυνὴ προσευχομένη ἢ προφητεύουσα ἀκατακαλύπτῳ τῇ κεφαλῇ καταισχύνει τὴν κεφαλὴν ἑαυτῆς ἓν γάρ ἐστιν καὶ τὸ αὐτὸ τῇ ἐξυρημένῃ',
   'pasa de gynē proseuchomenē ē prophēteuousa akatakalyptō tē kephalē kataischynei tēn kephalēn heautēs hen gar estin kai to auto tē exyrēmenē',
   '''Prayeth or prophesieth'' — note: Paul assumes women will pray and prophesy in the assembly. The issue is not whether women participate in worship but how. ''Uncovered'' (akatakalyptō — unveiled). ''Shaven'' (exyrēmenē — with head shaved). In Corinth, a shaved head on a woman could signify shame, mourning, or the mark of a convicted adulteress. Paul argues that an uncovered woman in worship brings equivalent disgrace.',
   NULL),
  (6, 'For if the woman be not covered, let her also be shorn: but if it be a shame for a woman to be shorn or shaven, let her be covered.',
   'εἰ γὰρ οὐ κατακαλύπτεται γυνή καὶ κειράσθω εἰ δὲ αἰσχρὸν γυναικὶ τὸ κείρασθαι ἢ ξυρᾶσθαι κατακαλυπτέσθω',
   'ei gar ou katakalyptetai gynē kai keirasthō ei de aischron gynaiki to keirasthai ē xyrasthai katakalyptesthō',
   'A reductio ad absurdum: if you refuse the covering, then go all the way and shave your head. But since a shaved head is shameful (aischron — disgraceful), the logical conclusion is to wear the covering. Paul uses the cultural shame of a shorn head to reinforce the appropriateness of head covering in worship.',
   NULL),
  (7, 'For a man indeed ought not to cover his head, forasmuch as he is the image and glory of God: but the woman is the glory of the man.',
   'ἀνὴρ μὲν γὰρ οὐκ ὀφείλει κατακαλύπτεσθαι τὴν κεφαλήν εἰκὼν καὶ δόξα θεοῦ ὑπάρχων ἡ δὲ γυνὴ δόξα ἀνδρός ἐστιν',
   'anēr men gar ouk opheilei katakalyptesthai tēn kephalēn eikōn kai doxa theou hyparchōn hē de gynē doxa andros estin',
   '''Image and glory of God'' (eikōn kai doxa theou — man reflects God''s image and radiates God''s glory; Genesis 1:27). ''The woman is the glory of the man'' — not the image of the man (both male and female are in God''s image, Genesis 1:27) but the glory of the man. Woman was created from man (Genesis 2:21-23) and thus reflects his glory. The man should display his glory (being uncovered); the woman should not display hers (being covered) to avoid competing with God''s glory in worship.',
   NULL),
  (8, 'For the man is not of the woman; but the woman of the man.',
   'οὐ γάρ ἐστιν ἀνὴρ ἐκ γυναικός ἀλλὰ γυνὴ ἐξ ἀνδρός',
   'ou gar estin anēr ek gynaikos alla gynē ex andros',
   '''Not of the woman'' (ouk ek gynaikos — man did not originate from woman). ''Woman of the man'' (gynē ex andros — woman came out of man; Genesis 2:21-23). Paul argues from the creation order: Eve was taken from Adam. This supports the ''head'' relationship of v.3. However, v.12 will qualify this: ''as the woman is of the man, even so is the man also by the woman'' — mutual dependence.',
   NULL),
  (9, 'Neither was the man created for the woman; but the woman for the man.',
   'καὶ γὰρ οὐκ ἐκτίσθη ἀνὴρ διὰ τὴν γυναῖκα ἀλλὰ γυνὴ διὰ τὸν ἄνδρα',
   'kai gar ouk ektisthē anēr dia tēn gynaika alla gynē dia ton andra',
   '''Created for'' (ektisthē dia — created on account of, for the purpose of). Referencing Genesis 2:18: ''It is not good that the man should be alone; I will make him an help meet for him.'' The woman was created as a complementary partner for the man. This does not diminish woman''s worth but describes the sequence and purpose of creation.',
   NULL),
  (10, 'For this cause ought the woman to have power on her head because of the angels.',
   'διὰ τοῦτο ὀφείλει ἡ γυνὴ ἐξουσίαν ἔχειν ἐπὶ τῆς κεφαλῆς διὰ τοὺς ἀγγέλους',
   'dia touto opheilei hē gynē exousian echein epi tēs kephalēs dia tous angelous',
   '''Power on her head'' (exousian echein epi tēs kephalēs — to have authority upon the head). ''Because of the angels'' (dia tous angelous). One of the most enigmatic verses in Paul. ''Power'' (exousia) may mean (a) a sign of authority (the covering as a symbol of being under authority) or (b) her own authority (the covering empowers her to pray and prophesy). ''Because of the angels'' — possibly because angels are present in worship (cf. Psalm 138:1) and proper order honours their presence.',
   NULL),
  (11, 'Nevertheless neither is the man without the woman, neither the woman without the man, in the Lord.',
   'πλὴν οὔτε γυνὴ χωρὶς ἀνδρὸς οὔτε ἀνὴρ χωρὶς γυναικὸς ἐν κυρίῳ',
   'plēn oute gynē chōris andros oute anēr chōris gynaikos en kyriō',
   '''Nevertheless'' (plēn — but, however; a strong qualification). ''Neither without'' (oute chōris — not apart from, not independent of). ''In the Lord'' — within the sphere of Christ''s lordship, mutual dependence is the rule. Man and woman need each other. Paul balances his argument from creation order (vv.8-9) with this affirmation of essential interdependence. There is no male superiority ''in the Lord.''',
   NULL),
  (12, 'For as the woman is of the man, even so is the man also by the woman; but all things of God.',
   'ὥσπερ γὰρ ἡ γυνὴ ἐκ τοῦ ἀνδρός οὕτως καὶ ὁ ἀνὴρ διὰ τῆς γυναικός τὰ δὲ πάντα ἐκ τοῦ θεοῦ',
   'hōsper gar hē gynē ek tou andros houtōs kai ho anēr dia tēs gynaikos ta de panta ek tou theou',
   '''Woman is of the man'' (ek tou andros — from the man; Eve came from Adam). ''Man also by the woman'' (di tēs gynaikos — through the woman; every man since is born of woman). ''All things of God'' — ultimately, both man and woman originate from God. The creation order is balanced by the ongoing reality: no man exists without a woman who bore him. This prevents any argument from vv.8-9 being used to assert male ontological superiority.',
   NULL),
  (13, 'Judge in yourselves: is it comely that a woman pray unto God uncovered?',
   'ἐν ὑμῖν αὐτοῖς κρίνατε πρέπον ἐστὶν γυναῖκα ἀκατακάλυπτον τῷ θεῷ προσεύχεσθαι',
   'en hymin autois krinate prepon estin gynaika akatakalypton tō theō proseuchesthai',
   '''Judge in yourselves'' (en hymin autois krinate — decide among yourselves). ''Comely'' (prepon — fitting, appropriate, proper). Paul appeals to their own sense of propriety. Is it fitting for a woman to pray to God without a covering? He expects them to recognise that it is not.',
   NULL),
  (14, 'Doth not even nature itself teach you, that, if a man have long hair, it is a shame unto him?',
   'οὐδὲ αὐτὴ ἡ φύσις διδάσκει ὑμᾶς ὅτι ἀνὴρ μὲν ἐὰν κομᾷ ἀτιμία αὐτῷ ἐστιν',
   'oude autē hē physis didaskei hymas hoti anēr men ean koma atimia autō estin',
   '''Nature'' (physis — the natural order, instinct, custom). ''Long hair'' (koma — to wear hair long, let hair grow). ''Shame'' (atimia — dishonour). Paul appeals to nature/cultural convention: in most societies, men typically wear shorter hair. This is an argument from cultural propriety, not absolute moral law.',
   NULL),
  (15, 'But if a woman have long hair, it is a glory to her: for her hair is given her for a covering.',
   'γυνὴ δὲ ἐὰν κομᾷ δόξα αὐτῇ ἐστιν ὅτι ἡ κόμη ἀντὶ περιβολαίου δέδοται αὐτῇ',
   'gynē de ean koma doxa autē estin hoti hē komē anti peribolaiou dedotai autē',
   '''Glory'' (doxa — honour, dignity). ''Given her for a covering'' (anti peribolaiou dedotai — given in place of a mantle/wrap). A woman''s long hair is naturally a covering (peribolaion — a garment thrown around). Some argue this means natural hair is the only covering needed; others that it is an analogy supporting an additional covering. The point is that nature itself provides a covering principle for women.',
   NULL),
  (16, 'But if any man seem to be contentious, we have no such custom, neither the churches of God.',
   'εἰ δέ τις δοκεῖ φιλόνεικος εἶναι ἡμεῖς τοιαύτην συνήθειαν οὐκ ἔχομεν οὐδὲ αἱ ἐκκλησίαι τοῦ θεοῦ',
   'ei de tis dokei philoneikos einai hēmeis toiautēn synētheian ouk echomen oude hai ekklēsiai tou theou',
   '''Contentious'' (philoneikos — fond of strife, argumentative). ''No such custom'' — ambiguous: ''we have no such custom'' of (a) women being uncovered, or (b) being contentious about it. ''Neither the churches of God'' — Paul appeals to universal church practice. Whatever the interpretation, the appeal to apostolic and church-wide practice serves as the final word on the matter.',
   NULL),
  (17, 'Now in this that I declare unto you I praise you not, that ye come together not for the better, but for the worse.',
   'τοῦτο δὲ παραγγέλλων οὐκ ἐπαινῶ ὅτι οὐκ εἰς τὸ κρεῖσσον ἀλλ᾿ εἰς τὸ ἥσσον συνέρχεσθε',
   'touto de parangellōn ouk epainō hoti ouk eis to kreisson all eis to hēsson synerchesthe',
   '''I praise you not'' (ouk epainō — a sharp contrast to v.2''s ''I praise you''). ''Not for the better, but for the worse'' — their gatherings are actually doing harm. The Lord''s Supper, meant to unite, is instead deepening divisions. This is a devastating assessment: worship that should edify is instead destroying.',
   NULL),
  (18, 'For first of all, when ye come together in the church, I hear that there be divisions among you; and I partly believe it.',
   'πρῶτον μὲν γὰρ συνερχομένων ὑμῶν ἐν ἐκκλησίᾳ ἀκούω σχίσματα ἐν ὑμῖν ὑπάρχειν καὶ μέρος τι πιστεύω',
   'prōton men gar synerchomenōn hymōn en ekklēsia akouō schismata en hymin hyparchein kai meros ti pisteuō',
   '''In the church'' (en ekklēsia — in the assembly gathering). ''Divisions'' (schismata — splits, factions; cf. 1:10). ''I partly believe it'' — Paul is measured, not accepting every report uncritically but acknowledging its plausibility given what he knows of Corinthian behavior.',
   NULL),
  (19, 'For there must be also heresies among you, that they which are approved may be made manifest among you.',
   'δεῖ γὰρ καὶ αἱρέσεις ἐν ὑμῖν εἶναι ἵνα οἱ δόκιμοι φανεροὶ γένωνται ἐν ὑμῖν',
   'dei gar kai haireseis en hymin einai hina hoi dokimoi phaneroi genōntai en hymin',
   '''Must be'' (dei — it is necessary; divine necessity). ''Heresies'' (haireseis — factions, divisions; later used of doctrinal heresies). ''Approved'' (dokimoi — tested and proven genuine). God permits divisions to reveal who is truly faithful. The factions serve a refining purpose: they distinguish the genuine from the pretenders. This does not excuse divisiveness but explains God''s sovereign use of it.',
   NULL),
  (20, 'When ye come together therefore into one place, this is not to eat the Lord''s supper.',
   'συνερχομένων οὖν ὑμῶν ἐπὶ τὸ αὐτό οὐκ ἔστιν κυριακὸν δεῖπνον φαγεῖν',
   'synerchomenōn oun hymōn epi to auto ouk estin kyriakon deipnon phagein',
   '''The Lord''s supper'' (kyriakon deipnon — the Lord''s meal; kyriakos means ''belonging to the Lord''). Paul makes a shocking declaration: what they are doing when they gather is not actually the Lord''s Supper. Their conduct has so corrupted the meal that it no longer qualifies. The form remains, but the reality has been emptied out by their selfishness and divisions.',
   NULL),
  (21, 'For in eating every one taketh before other his own supper: and one is hungry, and another is drunken.',
   'ἕκαστος γὰρ τὸ ἴδιον δεῖπνον προλαμβάνει ἐν τῷ φαγεῖν καὶ ὃς μὲν πεινᾷ ὃς δὲ μεθύει',
   'hekastos gar to idion deipnon prolambanei en tō phagein kai hos men peina hos de methyei',
   '''Taketh before other'' (prolambanei — takes ahead, eats first without waiting). ''His own supper'' — the communal meal has become private consumption. ''One is hungry... another is drunken'' — the poor go without food while the wealthy gorge and overdrink. The early church''s Lord''s Supper was a full meal (agapē feast), and the rich were not sharing with the poor. Class division was destroying the communion.',
   NULL),
  (22, 'What? have ye not houses to eat and to drink in? or despise ye the church of God, and shame them that have not? What shall I say to you? shall I praise you in this? I praise you not.',
   'μὴ γὰρ οἰκίας οὐκ ἔχετε εἰς τὸ ἐσθίειν καὶ πίνειν ἢ τῆς ἐκκλησίας τοῦ θεοῦ καταφρονεῖτε καὶ καταισχύνετε τοὺς μὴ ἔχοντας τί εἴπω ὑμῖν ἐπαινέσω ὑμᾶς ἐν τούτῳ οὐκ ἐπαινῶ',
   'mē gar oikias ouk echete eis to esthiein kai pinein ē tēs ekklēsias tou theou kataphroneite kai kataischynete tous mē echontas ti eipō hymin epainesō hymas en toutō ouk epainō',
   '''Despise the church of God'' (tēs ekklēsias tou theou kataphroneite — show contempt for God''s assembly). ''Shame them that have not'' (kataischynete tous mē echontas — humiliate the have-nots). Paul''s indignation is fierce: if you want to eat privately, eat at home. But the church gathering is for mutual sharing. To feast while the poor starve is to despise the church itself. ''I praise you not'' (ouk epainō — emphatic repetition of v.17).',
   NULL),
  (23, 'For I have received of the Lord that which also I delivered unto you, That the Lord Jesus the same night in which he was betrayed took bread:',
   'ἐγὼ γὰρ παρέλαβον ἀπὸ τοῦ κυρίου ὃ καὶ παρέδωκα ὑμῖν ὅτι ὁ κύριος Ἰησοῦς ἐν τῇ νυκτὶ ᾗ παρεδίδοτο ἔλαβεν ἄρτον',
   'egō gar parelabon apo tou kyriou ho kai paredōka hymin hoti ho kyrios Iēsous en tē nykti hē paredidoto elaben arton',
   '''Received of the Lord'' (parelabon apo tou kyriou — received from the Lord; technical language for authoritative tradition). ''Delivered unto you'' (paredōka — handed on). ''The same night in which he was betrayed'' (paredidoto — was being handed over; the same verb used of Judas''s betrayal and of God delivering up his Son). Paul provides the earliest written account of the Last Supper (predating the Gospels in composition). The tradition comes from the Lord himself through the apostolic chain.',
   'This passage (vv.23-26) is the earliest written account of the institution of the Lord''s Supper, predating Mark''s Gospel by perhaps a decade. Paul claims to have ''received from the Lord'' (apo tou kyriou) this tradition — either through direct revelation or through the apostolic chain that traces back to Jesus himself. The phrase ''the same night in which he was betrayed'' places the Supper at the most poignant moment in human history: Jesus institutes the memorial of his death on the very night he is handed over to die.'),
  (24, 'And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.',
   'καὶ εὐχαριστήσας ἔκλασεν καὶ εἶπεν λάβετε φάγετε τοῦτό μού ἐστιν τὸ σῶμα τὸ ὑπὲρ ὑμῶν κλώμενον τοῦτο ποιεῖτε εἰς τὴν ἐμὴν ἀνάμνησιν',
   'kai eucharistēsas eklasen kai eipen labete phagete touto mou estin to sōma to hyper hymōn klōmenon touto poieite eis tēn emēn anamnēsin',
   '''Given thanks'' (eucharistēsas — from which ''Eucharist'' derives). ''Brake it'' (eklasen — broke the bread). ''This is my body'' (touto mou estin to sōma — the words of institution). ''Broken for you'' (to hyper hymōn klōmenon — the body given on your behalf). ''In remembrance of me'' (eis tēn emēn anamnēsin — unto my remembrance; anamnēsis is active re-calling, not passive recollection). Jesus identifies the broken bread with his body given sacrificially for believers.',
   NULL),
  (25, 'After the same manner also he took the cup, when he had supped, saying, This cup is the new testament in my blood: this do ye, as oft as ye drink it, in remembrance of me.',
   'ὡσαύτως καὶ τὸ ποτήριον μετὰ τὸ δειπνῆσαι λέγων τοῦτο τὸ ποτήριον ἡ καινὴ διαθήκη ἐστὶν ἐν τῷ ἐμῷ αἵματι τοῦτο ποιεῖτε ὁσάκις ἂν πίνητε εἰς τὴν ἐμὴν ἀνάμνησιν',
   'hōsautōs kai to potērion meta to deipnēsai legōn touto to potērion hē kainē diathēkē estin en tō emō haimati touto poieite hosakis an pinēte eis tēn emēn anamnēsin',
   '''After supper'' (meta to deipnēsai — after the meal; the cup came after the main course). ''New testament'' (hē kainē diathēkē — the new covenant; cf. Jeremiah 31:31-34). ''In my blood'' (en tō emō haimati — sealed by, established in my blood). ''As oft as ye drink it'' (hosakis an pinēte — whenever you drink it). The cup represents the new covenant inaugurated by Christ''s blood. Every celebration renews the covenant and re-presents Christ''s sacrifice.',
   'The ''new testament'' (kainē diathēkē) is the new covenant prophesied by Jeremiah 31:31-34. Jesus declares that this covenant is ratified ''in my blood'' — his sacrificial death is the covenant-sealing sacrifice, just as Moses sealed the Sinai covenant with blood (Exodus 24:8). The Lord''s Supper is therefore a covenant meal: each celebration participates in the new covenant reality established by Christ''s blood. ''This do in remembrance of me'' transforms a Jewish Passover meal into a Christian sacrament of perpetual remembrance and proclamation.'),
  (26, 'For as often as ye eat this bread, and drink this cup, ye do shew the Lord''s death till he come.',
   'ὁσάκις γὰρ ἐὰν ἐσθίητε τὸν ἄρτον τοῦτον καὶ τὸ ποτήριον τοῦτο πίνητε τὸν θάνατον τοῦ κυρίου καταγγέλλετε ἄχρις οὗ ἔλθῃ',
   'hosakis gar ean esthiēte ton arton touton kai to potērion touto pinēte ton thanaton tou kyriou katangellete achris hou elthē',
   '''Shew'' (katangellete — proclaim, announce publicly; a preaching word). ''The Lord''s death'' — the content of the proclamation. ''Till he come'' (achris hou elthē — until he comes; an eschatological horizon). The Lord''s Supper has three temporal dimensions: it looks back (remembering Christ''s death), it looks outward (proclaiming that death to the present community), and it looks forward (anticipating Christ''s return). The Supper will continue until the Lord returns in person.',
   NULL),
  (27, 'Wherefore whosoever shall eat this bread, and drink this cup of the Lord, unworthily, shall be guilty of the body and blood of the Lord.',
   'ὥστε ὃς ἂν ἐσθίῃ τὸν ἄρτον τοῦτον ἢ πίνῃ τὸ ποτήριον τοῦ κυρίου ἀναξίως ἔνοχος ἔσται τοῦ σώματος καὶ τοῦ αἵματος τοῦ κυρίου',
   'hōste hos an esthiē ton arton touton ē pinē to potērion tou kyriou anaxiōs enochos estai tou sōmatos kai tou haimatos tou kyriou',
   '''Unworthily'' (anaxiōs — in an unworthy manner; this modifies the way of eating, not the worthiness of the person). ''Guilty of'' (enochos — held responsible for, liable for; a legal term for criminal responsibility). ''Body and blood of the Lord'' — to eat unworthily is to participate in the guilt of those who crucified Christ. Careless, selfish, or divisive participation profanes the sacrifice it represents.',
   'This verse has caused much pastoral concern, yet its original context clarifies its meaning. ''Unworthily'' (anaxiōs) is an adverb, not an adjective — it describes the manner of eating, not the person''s inherent worthiness. No one is personally ''worthy'' of the Lord''s Supper; it is by definition a meal of grace. The ''unworthy manner'' Paul condemns is the specific Corinthian abuse: eating selfishly while others go hungry, maintaining social divisions at the table of unity. The remedy is not abstinence but self-examination (v.28).'),
  (28, 'But let a man examine himself, and so let him eat of that bread, and drink of that cup.',
   'δοκιμαζέτω δὲ ἄνθρωπος ἑαυτόν καὶ οὕτως ἐκ τοῦ ἄρτου ἐσθιέτω καὶ ἐκ τοῦ ποτηρίου πινέτω',
   'dokimazetō de anthrōpos heauton kai houtōs ek tou artou esthietō kai ek tou potēriou pinetō',
   '''Examine himself'' (dokimazetō heauton — let him test himself, put himself to the proof). ''And so'' (kai houtōs — and in this manner, having examined). ''Let him eat... drink'' — note: the result of examination is eating, not abstaining. The point is not to avoid the Supper but to approach it rightly. Self-examination prepares for worthy participation, not withdrawal.',
   NULL),
  (29, 'For he that eateth and drinketh unworthily, eateth and drinketh damnation to himself, not discerning the Lord''s body.',
   'ὁ γὰρ ἐσθίων καὶ πίνων ἀναξίως κρίμα ἑαυτῷ ἐσθίει καὶ πίνει μὴ διακρίνων τὸ σῶμα τοῦ κυρίου',
   'ho gar esthiōn kai pinōn anaxiōs krima heautō esthiei kai pinei mē diakrinōn to sōma tou kyriou',
   '''Damnation'' (krima — judgment, not necessarily eternal condemnation; better translated ''judgment'' or ''chastening''). ''Discerning'' (diakrinōn — distinguishing, evaluating properly). ''The Lord''s body'' — either (a) the bread representing Christ''s sacrificial body, or (b) the church as Christ''s body. In context, both meanings apply: the Corinthians failed to recognise both the sacred character of the Supper and the unity of the church body gathered around it.',
   NULL),
  (30, 'For this cause many are weak and sickly among you, and many sleep.',
   'διὰ τοῦτο ἐν ὑμῖν πολλοὶ ἀσθενεῖς καὶ ἄρρωστοι καὶ κοιμῶνται ἱκανοί',
   'dia touto en hymin polloi astheneis kai arrōstoi kai koimōntai hikanoi',
   '''For this cause'' (dia touto — because of this specific abuse). ''Weak'' (astheneis — physically feeble). ''Sickly'' (arrōstoi — ill, infirm). ''Sleep'' (koimōntai — have fallen asleep; a euphemism for death). Paul attributes actual physical illness and death among the Corinthians to their abuse of the Lord''s Supper. This is divine discipline (v.32), not arbitrary punishment — God chastens his children to prevent their condemnation with the world.',
   NULL),
  (31, 'For if we would judge ourselves, we should not be judged.',
   'εἰ γὰρ ἑαυτοὺς διεκρίνομεν οὐκ ἂν ἐκρινόμεθα',
   'ei gar heautous diekrinomen ouk an ekrinometha',
   '''Judge ourselves'' (heautous diekrinomen — discriminated regarding ourselves, properly evaluated our conduct). ''Not be judged'' (ouk ekrinometha — would not come under divine judgment). Self-judgment prevents divine judgment. If the Corinthians had honestly examined their behavior at the Supper, God would not have needed to discipline them with sickness and death. The lesson: voluntary self-correction forestalls divine correction.',
   NULL),
  (32, 'But when we are judged, we are chastened of the Lord, that we should not be condemned with the world.',
   'κρινόμενοι δὲ ὑπὸ τοῦ κυρίου παιδευόμεθα ἵνα μὴ σὺν τῷ κόσμῳ κατακριθῶμεν',
   'krinomenoi de hypo tou kyriou paideuometha hina mē syn tō kosmō katakrithōmen',
   '''Chastened'' (paideuometha — disciplined, educated through correction; from pais, a child — this is a father''s discipline of his children). ''Condemned with the world'' (syn tō kosmō katakrithōmen — share in the world''s final condemnation). God''s discipline of believers is parental, not punitive. Its purpose is redemptive: to prevent the believer from being condemned along with the unbelieving world. Chastening proves sonship, not rejection.',
   NULL),
  (33, 'Wherefore, my brethren, when ye come together to eat, tarry one for another.',
   'ὥστε ἀδελφοί μου συνερχόμενοι εἰς τὸ φαγεῖν ἀλλήλους ἐκδέχεσθε',
   'hōste adelphoi mou synerchomenoi eis to phagein allēlous ekdechesthe',
   '''Tarry one for another'' (allēlous ekdechesthe — wait for one another; a simple, practical instruction). The remedy for the Corinthian abuse is straightforward: wait until everyone has arrived, then eat together. This ensures that the wealthy do not consume everything before the poor arrive. Mutual consideration is the practical expression of the body''s unity.',
   NULL),
  (34, 'And if any man hunger, let him eat at home; that ye come not together unto condemnation. And the rest will I set in order when I come.',
   'εἴ τις πεινᾷ ἐν οἴκῳ ἐσθιέτω ἵνα μὴ εἰς κρίμα συνέρχησθε τὰ δὲ λοιπὰ ὡς ἂν ἔλθω διατάξομαι',
   'ei tis peina en oikō esthietō hina mē eis krima synerchēsthe ta de loipa hōs an elthō diataxomai',
   '''Eat at home'' — if someone is too hungry to wait, eat privately first so the communal meal remains a shared act of fellowship. ''Unto condemnation'' (eis krima — resulting in judgment). ''Set in order when I come'' (diataxomai — I will arrange, give instructions). Paul has additional regulations to deliver in person. This hints that the letter addresses only the most urgent issues.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 11;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 head
  ('κεφαλή', 'kephalē', 'G2776', 'Head — both literal (the physical head) and metaphorical. The metaphorical meaning is debated: (1) ''authority over'' — the head rules the body; (2) ''source/origin'' — as the head is the source of the body''s life. Both senses are attested in ancient Greek. In v.3, the three ''headship'' relationships (Christ/man, man/woman, God/Christ) describe ordered relationships within essential equality. The headship of God over Christ does not imply Christ''s inferiority, nor does man''s headship over woman imply her inferiority.', 1),
  -- v.5 prophesieth
  ('προφητεύω', 'prophēteuō', 'G4395', 'To prophesy, to speak forth God''s message — from pro (forth) + phēmi (to speak). In the NT, prophecy is Spirit-inspired speech that edifies, exhorts, and comforts the church (14:3). Paul assumes women will prophesy in the assembly (cf. Acts 2:17; 21:9). The issue in this passage is not whether women prophesy but how — with proper head covering that honours the created order. This verse is significant evidence for women''s active vocal participation in early Christian worship.', 2),
  -- v.24 remembrance
  ('ἀνάμνησις', 'anamnēsis', 'G364', 'Remembrance, memorial, active recollection — from ana (again) + mimnēskō (to call to mind). Anamnēsis in the Lord''s Supper is more than psychological memory; it is liturgical re-presentation. Each celebration ''remembers'' Christ''s death in the sense of making it present again to the worshipping community. The Passover haggadah used the same concept: ''In every generation, each person must regard himself as though he personally came out of Egypt.'' The Supper participates in the reality it remembers.', 3),
  -- v.25 new testament/covenant
  ('διαθήκη', 'diathēkē', 'G1242', 'Covenant, testament, solemn agreement — from diatithēmi (to arrange, dispose). In the LXX, diathēkē translates Hebrew berith (covenant). The ''new covenant'' (kainē diathēkē) was prophesied by Jeremiah (31:31-34): God would write his law on hearts, not stone. Jesus declares the cup to be this new covenant ratified ''in my blood.'' Every celebration of the Lord''s Supper is a covenant renewal ceremony — believers re-enter and reaffirm the new covenant established by Christ''s sacrifice.', 4),
  -- v.27 unworthily
  ('ἀναξίως', 'anaxiōs', 'G371', 'Unworthily, in an unworthy manner — an adverb (not adjective) modifying how one eats, not who one is. This is crucial pastorally: Paul is not barring ''unworthy'' people from the table but condemning an unworthy manner of participation. The specific unworthy manner in Corinth was eating selfishly and divisively. The remedy is not abstinence from the Supper but self-examination (v.28) leading to corrected behavior.', 5),
  -- v.28 examine
  ('δοκιμάζω', 'dokimazō', 'G1381', 'To test, examine, prove, approve — from dokimos (tested, approved). The metallurgical image: testing metals for purity. Applied to the Lord''s Supper, dokimazō means honest self-assessment before participating: Am I approaching in the right spirit? Am I at peace with my brothers? Am I recognising the body of Christ — both in the bread and in the gathered community? The goal is not to achieve perfection but to approach honestly and reverently.', 6),
  -- v.29 discerning
  ('διακρίνω', 'diakrinō', 'G1252', 'To distinguish, discern, evaluate properly — from dia (through) + krinō (to judge). To ''discern the Lord''s body'' means to properly distinguish the Lord''s Supper from an ordinary meal. The Corinthians treated it as a private feast (v.21), failing to recognise its sacred character and the unity of the church body it represents. Lack of discernment leads to judgment (krima): those who treat the holy as common are disciplined.', 7),
  -- v.32 chastened
  ('παιδεύω', 'paideuō', 'G3811', 'To discipline, train, educate, chasten — from pais (child). The word of parental discipline and pedagogical correction. God''s judgment on the Corinthians (sickness and death, v.30) is paideia — the discipline of a loving father, not the condemnation of a judge. Its purpose is preventive: ''that we should not be condemned with the world.'' Chastening proves that believers are children of God (Hebrews 12:5-11), not objects of wrath.', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 11
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 5
    WHEN 3 THEN 24
    WHEN 4 THEN 25
    WHEN 5 THEN 27
    WHEN 6 THEN 28
    WHEN 7 THEN 29
    WHEN 8 THEN 32
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 follow me as I follow Christ
  (1, 'Philippians 3:17', 1),
  (1, '1 Thessalonians 1:6', 2),
  -- v.3 headship
  (3, 'Ephesians 5:23', 3),
  (3, 'Ephesians 1:22', 4),
  -- v.5 women pray and prophesy
  (5, 'Acts 2:17', 5),
  (5, 'Acts 21:9', 6),
  -- v.7 image and glory of God
  (7, 'Genesis 1:27', 7),
  (7, 'Genesis 2:21-23', 8),
  -- v.10 because of the angels
  (10, 'Psalm 138:1', 9),
  -- v.19 factions reveal the genuine
  (19, '1 John 2:19', 10),
  -- v.23 received of the Lord
  (23, 'Matthew 26:26-28', 11),
  (23, 'Mark 14:22-24', 12),
  (23, 'Luke 22:19-20', 13),
  -- v.25 new covenant
  (25, 'Jeremiah 31:31-34', 14),
  (25, 'Hebrews 8:8-12', 15),
  (25, 'Exodus 24:8', 16),
  -- v.26 shew the Lord's death
  (26, '1 Corinthians 10:16-17', 17),
  -- v.27 guilty of body and blood
  (27, 'Hebrews 10:29', 18),
  -- v.28 examine himself
  (28, '2 Corinthians 13:5', 19),
  -- v.30 weak and sickly
  (30, 'James 5:14-16', 20),
  -- v.32 chastened of the Lord
  (32, 'Hebrews 12:5-11', 21),
  (32, 'Proverbs 3:11-12', 22),
  -- v.33 tarry for one another
  (33, 'Philippians 2:3-4', 23)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 11
  AND v.verse_number = cr.verse_number;
