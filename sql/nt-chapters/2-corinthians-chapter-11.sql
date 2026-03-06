-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 11 — The Fool's Boast and the Catalog of Sufferings
-- 33 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 11,
  '2 Corinthians 11 contains Paul''s most passionate and personal defense, including the famous ''fool''s boast'' and the devastating catalog of sufferings. Paul begins with ''godly jealousy'' for the Corinthians: ''I have espoused you to one husband, that I may present you as a chaste virgin to Christ'' (v.2). He warns against false apostles: ''if he that cometh preacheth another Jesus … ye might well bear with him'' (v.4). The ironic ''fool''s speech'' begins as Paul reluctantly matches the opponents'' boasting. He exposes the false apostles: ''such are false apostles, deceitful workers, transforming themselves into the apostles of Christ. And no marvel; for Satan himself is transformed into an angel of light'' (vv.13-14). Paul then catalogs his unparalleled sufferings: ''in labours more abundant, in stripes above measure, in prisons more frequent, in deaths oft. Of the Jews five times received I forty stripes save one. Thrice was I beaten with rods, once was I stoned, thrice I suffered shipwreck, a night and a day I have been in the deep'' (vv.23-25). He adds ''perils'' of every kind and ''the care of all the churches'' (vv.26-28). The principle: ''If I must needs glory, I will glory of the things which concern mine infirmities'' (v.30). The chapter ends with the Damascus escape: ''through a window in a basket was I let down by the wall, and escaped his hands'' (v.33).',
  'The Fool''s Boast, False Apostles, Catalog of Sufferings',
  'ἀφροσύνη (aphrosynē)',
  'Foolishness — from a (not) + phroneō (to think wisely). Paul calls his self-boasting ''foolishness'' because it violates his own principle (10:17: ''let him that glorieth glory in the Lord''). Yet the Corinthians'' seduction by false apostles forces him to play the fool temporarily, boasting in credentials and sufferings to expose the hollowness of his opponents'' claims.',
  '["Godly Jealousy and the Danger of Deception (vv.1-6): Would to God ye could bear with me a little in my folly and indeed bear with me for I am jealous over you with godly jealousy for I have espoused you to one husband that I may present you as a chaste virgin to Christ but I fear lest by any means as the serpent beguiled Eve through his subtilty so your minds should be corrupted from the simplicity that is in Christ; for if he that cometh preacheth another Jesus whom we have not preached or if ye receive another spirit which ye have not received or another gospel which ye have not accepted ye might well bear with him; for I suppose I was not a whit behind the very chiefest apostles but though I be rude in speech yet not in knowledge","Paul''s Refusal of Support and the False Apostles (vv.7-15): Have I committed an offence in abasing myself that ye might be exalted because I have preached to you the gospel of God freely; I robbed other churches taking wages of them to do you service; for such are false apostles deceitful workers transforming themselves into the apostles of Christ and no marvel for Satan himself is transformed into an angel of light therefore it is no great thing if his ministers also be transformed as the ministers of righteousness whose end shall be according to their works","The Fool''s Boast: Sufferings as Credentials (vv.16-29): I say again let no man think me a fool if otherwise yet as a fool receive me that I may boast myself a little; that which I speak I speak it not after the Lord but as it were foolishly in this confidence of boasting; seeing that many glory after the flesh I will glory also; in labours more abundant in stripes above measure in prisons more frequent in deaths oft of the Jews five times received I forty stripes save one thrice was I beaten with rods once was I stoned thrice I suffered shipwreck; in journeyings often in perils of waters in perils of robbers in perils by mine own countrymen in perils by the heathen; beside those things that are without that which cometh upon me daily the care of all the churches","Boasting in Weakness: The Damascus Escape (vv.30-33): If I must needs glory I will glory of the things which concern mine infirmities the God and Father of our Lord Jesus Christ which is blessed for evermore knoweth that I lie not; in Damascus the governor under Aretas the king kept the city of the Damascenes with a garrison desirous to apprehend me and through a window in a basket was I let down by the wall and escaped his hands"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 33 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Would to God ye could bear with me a little in my folly: and indeed bear with me.',
   'ὄφελον ἀνείχεσθέ μου μικρόν τι τῆς ἀφροσύνης ἀλλὰ καὶ ἀνέχεσθέ μου',
   'ophelon aneichesthe mou mikron ti tēs aphrosynēs alla kai anechesthe mou',
   '''Folly'' (aphrosynēs — foolishness). ''Bear with me'' (anechesthe — put up with me, tolerate me). Paul knows that self-boasting is foolish (10:17), yet the situation demands it. The ironic tone pervades the entire chapter: Paul plays the ''fool'' to expose the real fools — the false apostles whose self-promotion the Corinthians have tolerated.',
   NULL),
  (2, 'For I am jealous over you with godly jealousy: for I have espoused you to one husband, that I may present you as a chaste virgin to Christ.',
   'ζηλῶ γὰρ ὑμᾶς θεοῦ ζήλῳ ἡρμοσάμην γὰρ ὑμᾶς ἑνὶ ἀνδρὶ παρθένον ἁγνὴν παραστῆσαι τῷ Χριστῷ',
   'zēlō gar hymas theou zēlō hērmosamēn gar hymas heni andri parthenon hagnēn parastēsai tō Christō',
   '''Godly jealousy'' (theou zēlō — with God''s own jealousy; the kind of jealousy that belongs to God, reflecting his exclusive covenant love). ''Espoused'' (hērmosamēn — betrothed, pledged in marriage). ''One husband'' (heni andri — to one man: Christ). ''Chaste virgin'' (parthenon hagnēn — a pure virgin). Paul as the father of the bride has promised the Corinthian church to Christ. The false apostles are threatening to seduce the bride before the wedding.',
   NULL),
  (3, 'But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Christ.',
   'φοβοῦμαι δὲ μήπως ὡς ὁ ὄφις Εὕαν ἐξηπάτησεν ἐν τῇ πανουργίᾳ αὐτοῦ οὕτως φθαρῇ τὰ νοήματα ὑμῶν ἀπὸ τῆς ἁπλότητος τῆς εἰς τὸν Χριστόν',
   'phoboumai de mēpōs hōs ho ophis Heuan exēpatēsen en tē panourgia autou houtōs phtharē ta noēmata hymōn apo tēs haplotētos tēs eis ton Christon',
   '''Serpent beguiled Eve'' — Genesis 3 applied directly to the Corinthian situation. ''Subtilty'' (panourgia — craftiness, trickery). ''Minds should be corrupted'' (phtharē ta noēmata — your thoughts may be destroyed/seduced). ''Simplicity'' (haplotētos — singleness of devotion, sincerity). The parallel: as the serpent seduced Eve away from simple trust in God, so the false apostles are seducing the Corinthians away from pure devotion to Christ.',
   NULL),
  (4, 'For if he that cometh preacheth another Jesus, whom we have not preached, or if ye receive another spirit, which ye have not received, or another gospel, which ye have not accepted, ye might well bear with him.',
   'εἰ μὲν γὰρ ὁ ἐρχόμενος ἄλλον Ἰησοῦν κηρύσσει ὃν οὐκ ἐκηρύξαμεν ἢ πνεῦμα ἕτερον λαμβάνετε ὃ οὐκ ἐλάβετε ἢ εὐαγγέλιον ἕτερον ὃ οὐκ ἐδέξασθε καλῶς ἀνέχεσθε',
   'ei men gar ho erchomenos allon Iēsoun kēryssei hon ouk ekēryxamen ē pneuma heteron lambanete ho ouk elabete ē euangelion heteron ho ouk edexasthe kalōs anechesthe',
   '''Another Jesus'' (allon Iēsoun — a different Jesus than the one Paul preached). ''Another spirit'' (pneuma heteron — a different spirit). ''Another gospel'' (euangelion heteron — a different gospel). Three counterfeits: a false Jesus, a false spirit, and a false gospel. ''Ye might well bear with him'' — biting irony: you tolerate false teachers patiently but won''t bear with me! The Corinthians had more tolerance for heresy than for Paul''s authentic gospel.',
   NULL),
  (5, 'For I suppose I was not a whit behind the very chiefest apostles.',
   'λογίζομαι γὰρ μηδὲν ὑστερηκέναι τῶν ὑπερλίαν ἀποστόλων',
   'logizomai gar mēden hysterēkenai tōn hyperlian apostolōn',
   '''Very chiefest apostles'' (hyperlian apostolōn — the super-apostles, the exceedingly eminent apostles). This is likely ironic: Paul refers to his opponents sarcastically as ''super-apostles.'' Some scholars think he refers to the Jerusalem apostles (Peter, James, John), but the context (vv.13-15) suggests the false teachers themselves who claimed superior status. ''Not a whit behind'' — Paul is not inferior to them in any respect.',
   NULL),
  (6, 'But though I be rude in speech, yet not in knowledge; but we have been throughly made manifest among you in all things.',
   'εἰ δὲ καὶ ἰδιώτης τῷ λόγῳ ἀλλ᾿ οὐ τῇ γνώσει ἀλλ᾿ ἐν παντὶ φανερωθέντες ἐν πᾶσιν εἰς ὑμᾶς',
   'ei de kai idiōtēs tō logō all'' ou tē gnōsei all'' en panti phanerōthentes en pasin eis hymas',
   '''Rude in speech'' (idiōtēs tō logō — an amateur in rhetoric, untrained in oratory; idiōtēs means a private person, a layman). Paul concedes he lacks polished Greek rhetoric. ''Yet not in knowledge'' (ou tē gnōsei) — his understanding of the gospel is not deficient. The opponents had style; Paul had substance. Corinth, a city that prized eloquence, had been dazzled by the opponents'' rhetoric while undervaluing Paul''s theological depth.',
   NULL),
  (7, 'Have I committed an offence in abasing myself that ye might be exalted, because I have preached to you the gospel of God freely?',
   'ἢ ἁμαρτίαν ἐποίησα ἐμαυτὸν ταπεινῶν ἵνα ὑμεῖς ὑψωθῆτε ὅτι δωρεὰν τὸ τοῦ θεοῦ εὐαγγέλιον εὐηγγελισάμην ὑμῖν',
   'ē hamartian epoiēsa emauton tapeinōn hina hymeis hypsōthēte hoti dōrean to tou theou euangelion euēngelisamēn hymin',
   '''Offence'' (hamartian — sin; Paul asks with dripping irony: was it a sin?). ''Abasing myself'' (emauton tapeinōn — humbling myself). ''Freely'' (dōrean — without charge, gratis). Paul refused financial support from Corinth (cf. 1 Cor 9:12-18), working as a tentmaker instead. His opponents apparently charged fees. In Corinth''s patron-client culture, free gospel preaching was paradoxically seen as demeaning — a sign of low status.',
   NULL),
  (8, 'I robbed other churches, taking wages of them, to do you service.',
   'ἄλλας ἐκκλησίας ἐσύλησα λαβὼν ὀψώνιον πρὸς τὴν ὑμῶν διακονίαν',
   'allas ekklēsias esylēsa labōn opsōnion pros tēn hymōn diakonian',
   '''Robbed'' (esylēsa — plundered, stripped; a military term for looting). ''Wages'' (opsōnion — a soldier''s pay, rations). Deliberate hyperbole: Paul ''robbed'' other churches (especially the Macedonians) by accepting their support in order to serve Corinth for free. The irony cuts deep: the Corinthians should feel ashamed that poorer churches funded Paul''s ministry to them.',
   NULL),
  (9, 'And when I was present with you, and wanted, I was chargeable to no man: for that which was lacking to me the brethren which came from Macedonia supplied: and in all things I have kept myself from being burdensome unto you, and so will I keep myself.',
   'καὶ παρὼν πρὸς ὑμᾶς καὶ ὑστερηθεὶς οὐ κατενάρκησα οὐδενός τὸ γὰρ ὑστέρημά μου προσανεπλήρωσαν οἱ ἀδελφοὶ ἐλθόντες ἀπὸ Μακεδονίας καὶ ἐν παντὶ ἀβαρῆ ἐμαυτὸν ὑμῖν ἐτήρησα καὶ τηρήσω',
   'kai parōn pros hymas kai hysterētheis ou katenarkēsa oudenos to gar hysterēma mou prosaneplērōsan hoi adelphoi elthontes apo Makedonias kai en panti abarē emauton hymin etērēsa kai tērēsō',
   '''Wanted'' (hysterētheis — being in need, lacking). ''Chargeable'' (katenarkēsa — burdened, weighed down upon; a rare word perhaps meaning ''to grow numb upon,'' i.e., to be a dead weight). ''Macedonia supplied'' — the Philippians supported Paul during his Corinthian ministry. ''So will I keep myself'' — this policy is permanent, not temporary.',
   NULL),
  (10, 'As the truth of Christ is in me, no man shall stop me of this boasting in the regions of Achaia.',
   'ἔστιν ἀλήθεια Χριστοῦ ἐν ἐμοὶ ὅτι ἡ καύχησις αὕτη οὐ φραγήσεται εἰς ἐμὲ ἐν τοῖς κλίμασιν τῆς Ἀχαΐας',
   'estin alētheia Christou en emoi hoti hē kauchēsis hautē ou phragēsetai eis eme en tois klimasin tēs Achaias',
   '''Truth of Christ is in me'' — a solemn oath. ''Stop me of this boasting'' (ou phragēsetai — shall not be stopped, shall not be fenced in). ''Regions of Achaia'' — the province including Corinth. Paul swears he will never accept money from the Corinthians. This boast — free gospel preaching — is non-negotiable.',
   NULL),
  (11, 'Wherefore? because I love you not? God knoweth.',
   'διὰ τί ὅτι οὐκ ἀγαπῶ ὑμᾶς ὁ θεὸς οἶδεν',
   'dia ti hoti ouk agapō hymas ho theos oiden',
   '''Because I love you not?'' — the opponents may have said Paul''s refusal of support showed he didn''t care for Corinth. ''God knoweth'' — a tender appeal to divine omniscience. Paul''s refusal was motivated by love, not distance. God knows the heart behind the policy.',
   NULL),
  (12, 'But what I do, that I will do, that I may cut off occasion from them which desire occasion; that wherein they glory, they may be found even as we.',
   'ὃ δὲ ποιῶ καὶ ποιήσω ἵνα ἐκκόψω τὴν ἀφορμὴν τῶν θελόντων ἀφορμήν ἵνα ἐν ᾧ καυχῶνται εὑρεθῶσιν καθὼς καὶ ἡμεῖς',
   'ho de poiō kai poiēsō hina ekkopsō tēn aphormēn tōn thelontōn aphormēn hina en hō kauchōntai heurethōsin kathōs kai hēmeis',
   '''Cut off occasion'' (ekkopsō tēn aphormēn — remove the opportunity, cut away the base of operations). Paul''s free preaching removes the opponents'' ability to claim equality with him. If they charged for ministry and Paul didn''t, the contrast exposed their mercenary motives.',
   NULL),
  (13, 'For such are false apostles, deceitful workers, transforming themselves into the apostles of Christ.',
   'οἱ γὰρ τοιοῦτοι ψευδαπόστολοι ἐργάται δόλιοι μετασχηματιζόμενοι εἰς ἀποστόλους Χριστοῦ',
   'hoi gar toioutoi pseudapostoloi ergatai dolioi metaschēmatizomenoi eis apostolous Christou',
   '''False apostles'' (pseudapostoloi — pseudo-apostles; the compound word appears only here in the NT). ''Deceitful workers'' (ergatai dolioi — workers characterized by treachery). ''Transforming themselves'' (metaschēmatizomenoi — disguising themselves, changing their outward appearance; from meta + schēma — changing the external form). They looked like apostles of Christ but were imposters. The disguise was external; the reality was satanic.',
   NULL),
  (14, 'And no marvel; for Satan himself is transformed into an angel of light.',
   'καὶ οὐ θαυμαστόν αὐτὸς γὰρ ὁ σατανᾶς μετασχηματίζεται εἰς ἄγγελον φωτός',
   'kai ou thaumaston autos gar ho satanas metaschēmatizetai eis angelon phōtos',
   '''No marvel'' (ou thaumaston — not surprising). ''Satan himself'' (autos ho satanas — the master deceiver). ''Transformed'' (metaschēmatizetai — disguises himself; the same verb as v.13). ''Angel of light'' (angelon phōtos — a messenger of illumination). If Satan can masquerade as a being of light, his human agents can certainly masquerade as ministers of Christ. The most dangerous deception does not look evil — it looks righteous.',
   'This verse is one of the most important warnings in Scripture about spiritual deception. Satan''s most effective strategy is not raw evil (which repels) but counterfeit goodness (which attracts). He appears as ''an angel of light'' — his doctrine sounds wise, his messengers look godly, his movement seems spiritual. The test is not appearance but substance: does the teaching align with ''the simplicity that is in Christ'' (v.3)? The false apostles at Corinth were not obviously wicked — they were impressively spiritual, rhetorically gifted, and outwardly successful. That is precisely what made them dangerous.'),
  (15, 'Therefore it is no great thing if his ministers also be transformed as the ministers of righteousness; whose end shall be according to their works.',
   'οὐ μέγα οὖν εἰ καὶ οἱ διάκονοι αὐτοῦ μετασχηματίζονται ὡς διάκονοι δικαιοσύνης ὧν τὸ τέλος ἔσται κατὰ τὰ ἔργα αὐτῶν',
   'ou mega oun ei kai hoi diakonoi autou metaschēmatizontai hōs diakonoi dikaiosynēs hōn to telos estai kata ta erga autōn',
   '''His ministers'' (hoi diakonoi autou — Satan''s servants). ''Ministers of righteousness'' (diakonoi dikaiosynēs — they appear as servants of righteousness). ''Their end shall be according to their works'' — the disguise is temporary; the final judgment will reveal truth. Outward appearance may deceive humans; it will not deceive God.',
   NULL),
  (16, 'I say again, Let no man think me a fool; if otherwise, yet as a fool receive me, that I may boast myself a little.',
   'πάλιν λέγω μή τίς με δόξῃ ἄφρονα εἶναι εἰ δὲ μή γε κἂν ὡς ἄφρονα δέξασθέ με ἵνα κἀγὼ μικρόν τι καυχήσωμαι',
   'palin legō mē tis me doxē aphrona einai ei de mē ge kan hōs aphrona dexasthe me hina kagō mikron ti kauchēsōmai',
   'Paul restarts the ''fool''s speech.'' ''If otherwise'' — if you insist on thinking me a fool, at least receive me as one and let me boast a little. The ironic framework continues: Paul will play the fool''s role to expose the real foolishness of the opponents'' self-promotion.',
   NULL),
  (17, 'That which I speak, I speak it not after the Lord, but as it were foolishly, in this confidence of boasting.',
   'ὃ λαλῶ οὐ κατὰ κύριον λαλῶ ἀλλ᾿ ὡς ἐν ἀφροσύνῃ ἐν ταύτῃ τῇ ὑποστάσει τῆς καυχήσεως',
   'ho lalō ou kata kyrion lalō all'' hōs en aphrosynē en tautē tē hypostasei tēs kauchēseōs',
   '''Not after the Lord'' (ou kata kyrion — not according to the Lord''s way; self-boasting contradicts the gospel of grace). ''As it were foolishly'' — Paul distances himself from his own words: this is not normal apostolic teaching but a forced departure into self-defense. The tension is real: Paul knows boasting is wrong but believes the situation requires it.',
   NULL),
  (18, 'Seeing that many glory after the flesh, I will glory also.',
   'ἐπεὶ πολλοὶ καυχῶνται κατὰ σάρκα κἀγὼ καυχήσομαι',
   'epei polloi kauchōntai kata sarka kagō kauchēsomai',
   '''Many glory after the flesh'' — the opponents boast in worldly credentials: heritage, education, eloquence, status. Paul will match their boasting but transform it: where they boast of strength, he will boast of weakness (vv.23-30).',
   NULL),
  (19, 'For ye suffer fools gladly, seeing ye yourselves are wise.',
   'ἡδέως γὰρ ἀνέχεσθε τῶν ἀφρόνων φρόνιμοι ὄντες',
   'hēdeōs gar anechesthe tōn aphronōn phronimoi ontes',
   '''Suffer fools gladly'' (hēdeōs anechesthe tōn aphronōn — you gladly tolerate fools). ''Seeing ye yourselves are wise'' — cutting irony: the ''wise'' Corinthians readily endure foolish false teachers but won''t bear with Paul. Their self-perceived wisdom makes them prey to actual foolishness.',
   NULL),
  (20, 'For ye suffer, if a man bring you into bondage, if a man devour you, if a man take of you, if a man exalt himself, if a man smite you on the face.',
   'ἀνέχεσθε γὰρ εἴ τις ὑμᾶς καταδουλοῖ εἴ τις κατεσθίει εἴ τις λαμβάνει εἴ τις ἐπαίρεται εἴ τις ὑμᾶς εἰς πρόσωπον δέρει',
   'anechesthe gar ei tis hymas katadouloi ei tis katesthiei ei tis lambanei ei tis epairetai ei tis hymas eis prosōpon derei',
   'Five abuses the Corinthians tolerate: (1) ''bondage'' (katadouloi — enslaves you). (2) ''Devour'' (katesthiei — eats you up, exploits you). (3) ''Take of you'' (lambanei — takes advantage, seizes). (4) ''Exalt himself'' (epairetai — lifts himself up arrogantly). (5) ''Smite you on the face'' (eis prosōpon derei — strikes your face; possibly literal or metaphorical humiliation). The false apostles are tyrants, but the Corinthians submit meekly. They tolerate abuse from imposters while resisting legitimate apostolic authority.',
   NULL),
  (21, 'I speak as concerning reproach, as though we had been weak. Howbeit whereinsoever any is bold, (I speak foolishly,) I am bold also.',
   'κατὰ ἀτιμίαν λέγω ὡς ὅτι ἡμεῖς ἠσθενήσαμεν ἐν ᾧ δ᾿ ἄν τις τολμᾷ ἐν ἀφροσύνῃ λέγω τολμῶ κἀγώ',
   'kata atimian legō hōs hoti hēmeis ēsthenēsamen en hō d'' an tis tolma en aphrosynē legō tolmō kagō',
   '''Reproach'' (atimian — dishonour). ''We had been weak'' — ironic: Paul''s ''weakness'' was his refusal to dominate, exploit, or strike. In the opponents'' world, that was weakness; in the gospel''s world, it was Christlike humility. ''I am bold also'' — Paul will now match any boast the opponents make, but with a crucial twist.',
   NULL),
  (22, 'Are they Hebrews? so am I. Are they Israelites? so am I. Are they the seed of Abraham? so am I.',
   'Ἑβραῖοί εἰσιν κἀγώ Ἰσραηλῖταί εἰσιν κἀγώ σπέρμα Ἀβραάμ εἰσιν κἀγώ',
   'Hebraioi eisin kagō Israēlitai eisin kagō sperma Abraam eisin kagō',
   '''Hebrews … Israelites … seed of Abraham'' — three escalating identity markers. ''Hebrews'' (language and culture). ''Israelites'' (covenant membership). ''Seed of Abraham'' (promises and heritage). Paul matches every ethnic and religious credential the opponents claim. Whatever they are, he is equally. But he will not stop here — he surpasses them in the only category that matters: suffering.',
   NULL),
  (23, 'Are they ministers of Christ? (I speak as a fool) I am more; in labours more abundant, in stripes above measure, in prisons more frequent, in deaths oft.',
   'διάκονοι Χριστοῦ εἰσιν παραφρονῶν λαλῶ ὑπὲρ ἐγώ ἐν κόποις περισσοτέρως ἐν πληγαῖς ὑπερβαλλόντως ἐν φυλακαῖς περισσοτέρως ἐν θανάτοις πολλάκις',
   'diakonoi Christou eisin paraphronōn lalō hyper egō en kopois perissoterōs en plēgais hyperballontōs en phylakais perissoterōs en thanatois pollakis',
   '''I speak as a fool'' (paraphronōn lalō — I speak as one out of his mind). ''I am more'' (hyper egō — I surpass them). The comparison shifts from credentials to suffering. ''Labours more abundant'' (kopois perissoterōs). ''Stripes above measure'' (plēgais hyperballontōs — beatings beyond all measure). ''Prisons more frequent.'' ''Deaths oft'' (thanatois pollakis — near-death experiences, many times). Paul''s superiority is demonstrated not by power but by suffering. The cross-shaped minister outranks the crowned one.',
   NULL),
  (24, 'Of the Jews five times received I forty stripes save one.',
   'ὑπὸ Ἰουδαίων πεντάκις τεσσαράκοντα παρὰ μίαν ἔλαβον',
   'hypo Ioudaiōn pentakis tessarakonta para mian elabon',
   '''Forty stripes save one'' — 39 lashes; the Jewish penalty limited to 40 by Deuteronomy 25:3, reduced to 39 to avoid accidentally exceeding the limit. ''Five times'' — none of these are recorded in Acts; Paul suffered far more than Luke recorded. Each flogging was a potentially fatal punishment: leather whips with bone or metal fragments.',
   NULL),
  (25, 'Thrice was I beaten with rods, once was I stoned, thrice I suffered shipwreck, a night and a day I have been in the deep;',
   'τρὶς ἐρραβδίσθην ἅπαξ ἐλιθάσθην τρὶς ἐναυάγησα νυχθήμερον ἐν τῷ βυθῷ πεποίηκα',
   'tris errabdisthēn hapax elithasthēn tris enauagēsa nychthēmeron en tō bythō pepoiēka',
   '''Beaten with rods'' (errabdisthēn — Roman punishment with lictors'' rods; Acts 16:22 records one instance at Philippi). ''Stoned'' (elithasthēn — Acts 14:19 at Lystra). ''Shipwreck'' (enauagēsa — three shipwrecks before the Acts 27 voyage to Rome, which would add a fourth). ''A night and a day in the deep'' (nychthēmeron en tō bythō — adrift in the open sea for 24 hours). These are facts, not rhetoric.',
   NULL),
  (26, 'In journeyings often, in perils of waters, in perils of robbers, in perils by mine own countrymen, in perils by the heathen, in perils in the city, in perils in the wilderness, in perils in the sea, in perils among false brethren;',
   'ὁδοιπορίαις πολλάκις κινδύνοις ποταμῶν κινδύνοις λῃστῶν κινδύνοις ἐκ γένους κινδύνοις ἐξ ἐθνῶν κινδύνοις ἐν πόλει κινδύνοις ἐν ἐρημίᾳ κινδύνοις ἐν θαλάσσῃ κινδύνοις ἐν ψευδαδέλφοις',
   'hodoiporiais pollakis kindynois potamōn kindynois lēstōn kindynois ek genous kindynois ex ethnōn kindynois en polei kindynois en erēmia kindynois en thalassē kindynois en pseudadelphois',
   'Eight ''perils'' (kindynois — dangers): (1) rivers (flash floods, dangerous crossings). (2) Robbers. (3) His own countrymen (Jews). (4) The heathen (Gentiles). (5) In the city. (6) In the wilderness. (7) At sea. (8) Among false brethren (pseudadelphois — bogus Christians, the most painful peril of all). Danger surrounded Paul from every direction, from every category of people, and in every environment.',
   NULL),
  (27, 'In weariness and painfulness, in watchings often, in hunger and thirst, in fastings often, in cold and nakedness.',
   'ἐν κόπῳ καὶ μόχθῳ ἐν ἀγρυπνίαις πολλάκις ἐν λιμῷ καὶ δίψει ἐν νηστείαις πολλάκις ἐν ψύχει καὶ γυμνότητι',
   'en kopō kai mochtho en agrypniais pollakis en limō kai dipsei en nēsteiais pollakis en psychei kai gymnotēti',
   '''Weariness and painfulness'' (kopō kai mochtho — toil and hardship). ''Watchings'' (agrypniais — sleepless nights). ''Hunger and thirst'' (limō kai dipsei). ''Fastings'' (nēsteiais — going without food, whether forced or voluntary). ''Cold and nakedness'' (psychei kai gymnotēti — exposure to the elements without adequate clothing). These are the daily hardships of an itinerant apostle: not dramatic persecutions but grinding, relentless deprivation.',
   NULL),
  (28, 'Beside those things that are without, that which cometh upon me daily, the care of all the churches.',
   'χωρὶς τῶν παρεκτὸς ἡ ἐπισύστασίς μου ἡ καθ᾿ ἡμέραν ἡ μέριμνα πασῶν τῶν ἐκκλησιῶν',
   'chōris tōn parektos hē episystasis mou hē kath'' hēmeran hē merimna pasōn tōn ekklēsiōn',
   '''Beside those things that are without'' (chōris tōn parektos — apart from external pressures). ''That which cometh upon me daily'' (episystasis — the daily pressure, the crowding in upon me). ''The care of all the churches'' (merimna pasōn tōn ekklēsiōn — anxiety for all the churches). After the physical catalog, Paul adds the heaviest burden: pastoral concern for every church. This inner weight exceeds all the external sufferings combined. The true pastor carries every church on his heart daily.',
   NULL),
  (29, 'Who is weak, and I am not weak? who is offended, and I burn not?',
   'τίς ἀσθενεῖ καὶ οὐκ ἀσθενῶ τίς σκανδαλίζεται καὶ οὐκ ἐγὼ πυροῦμαι',
   'tis asthenei kai ouk asthenō tis skandalizetai kai ouk egō pyroumai',
   '''Who is weak, and I am not weak?'' — Paul identifies with every struggling believer. ''Who is offended, and I burn not?'' (pyroumai — I burn with indignation/compassion). When any Christian stumbles, Paul feels it. Empathetic identification with the weak and the stumbling — this is pastoral love at its most intense.',
   NULL),
  (30, 'If I must needs glory, I will glory of the things which concern mine infirmities.',
   'εἰ καυχᾶσθαι δεῖ τὰ τῆς ἀσθενείας μου καυχήσομαι',
   'ei kauchasthai dei ta tēs astheneias mou kauchēsomai',
   '''If I must needs glory'' — boasting is necessary only because the opponents force it. ''Things which concern mine infirmities'' (ta tēs astheneias — the things of my weakness). The great reversal: where the opponents boast of strength, Paul boasts of weakness. This is not false modesty but theological conviction: God''s power is displayed through human weakness (12:9). The fool''s boast inverts all worldly values.',
   NULL),
  (31, 'The God and Father of our Lord Jesus Christ, which is blessed for evermore, knoweth that I lie not.',
   'ὁ θεὸς καὶ πατὴρ τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ οἶδεν ὁ ὢν εὐλογητὸς εἰς τοὺς αἰῶνας ὅτι οὐ ψεύδομαι',
   'ho theos kai patēr tou kyriou hēmōn Iēsou Christou oiden ho ōn eulogētos eis tous aiōnas hoti ou pseudomai',
   'A solemn oath: God the Father knows Paul is telling the truth. ''Blessed for evermore'' (eulogētos eis tous aiōnas — worthy of praise unto the ages). The suffering catalog is not exaggeration but understated fact. Paul invokes divine witness to his honesty.',
   NULL),
  (32, 'In Damascus the governor under Aretas the king kept the city of the Damascenes with a garrison, desirous to apprehend me:',
   'ἐν Δαμασκῷ ὁ ἐθνάρχης Ἀρέτα τοῦ βασιλέως ἐφρούρει τὴν Δαμασκηνῶν πόλιν πιάσαι με θέλων',
   'en Damaskō ho ethnarchēs Areta tou basileōs ephrourei tēn Damaskēnōn polin piasai me thelōn',
   '''Aretas the king'' — Aretas IV, the Nabataean king (9 BC – AD 40). ''Governor'' (ethnarchēs — ethnarch, a local administrator). ''Kept with a garrison'' (ephrourei — guarded, stationed troops). Paul concludes the fool''s boast not with a triumph but with a humiliating escape. This is deliberate: his climactic credential is not victory but vulnerability.',
   NULL),
  (33, 'And through a window in a basket was I let down by the wall, and escaped his hands.',
   'καὶ διὰ θυρίδος ἐν σαργάνῃ ἐχαλάσθην διὰ τοῦ τείχους καὶ ἐξέφυγον τὰς χεῖρας αὐτοῦ',
   'kai dia thyridos en sarganē echalasthēn dia tou teichous kai exephygon tas cheiras autou',
   '''Window'' (thyridos — a small opening in the wall). ''Basket'' (sarganē — a large woven rope basket). ''Let down'' (echalasthēn — lowered; passive: others lowered him). ''Escaped'' (exephygon — fled out). Cf. Acts 9:23-25. The fool''s boast ends with Paul dangling in a basket — the opposite of a triumphal entry. A Roman soldier would have been decorated for storming a city wall; Paul was lowered down one in a laundry basket. This is the ultimate anti-credential: glory in humiliation.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 11;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 godly jealousy
  ('ζῆλος', 'zēlos', 'G2205', 'Jealousy, zeal — can be positive (godly jealousy for exclusive devotion) or negative (envy). Here theou zēlō: God''s own jealousy for his people''s fidelity. Paul''s jealousy mirrors God''s: the same protective, exclusive love that drives God''s covenant faithfulness.', 1),
  -- v.3 subtilty/craftiness
  ('πανουργία', 'panourgia', 'G3834', 'Craftiness, cunning, trickery — from pan (all) + ergon (work): readiness to do anything. Satan''s method is not brute force but clever manipulation. The serpent in Eden used subtlety, not violence. False teachers follow the same pattern.', 2),
  -- v.13 false apostles
  ('ψευδαπόστολος', 'pseudapostolos', 'G5570', 'False apostle — from pseudēs (false) + apostolos (sent one). Found only here in the NT. These are not merely mistaken teachers but deliberate imposters: they claim apostolic authority they do not possess, masquerading as Christ''s representatives while serving Satan''s purposes.', 3),
  -- v.14 angel of light
  ('μετασχηματίζω', 'metaschēmatizō', 'G3345', 'To transform outwardly, to disguise, to change the external form — from meta (change) + schēma (external form/appearance). Distinguished from metamorphoō (change of inner nature, 3:18). Satan changes his appearance, not his nature. The disguise is superficial but effective: he looks like light while remaining darkness.', 4),
  -- v.28 care of all churches
  ('μέριμνα', 'merimna', 'G3308', 'Anxiety, care, concern — from merizō (to divide). The heart divided by concern for many things. Usually used negatively (Matt 13:22, anxious cares), but here positively: Paul''s anxiety for the churches is a mark of authentic pastoral love. The true pastor carries the burden of every church on his heart.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 11
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 3
    WHEN 3 THEN 13
    WHEN 4 THEN 14
    WHEN 5 THEN 28
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 espoused to Christ
  (2, 'Ephesians 5:25-27', 1),
  (2, 'Revelation 19:7-8', 2),
  -- v.3 serpent beguiled Eve
  (3, 'Genesis 3:1-6', 3),
  (3, '1 Timothy 2:14', 4),
  -- v.4 another Jesus / gospel
  (4, 'Galatians 1:6-9', 5),
  (4, '1 John 4:1-3', 6),
  -- v.14 Satan as angel of light
  (14, 'Genesis 3:1', 7),
  (14, 'Matthew 7:15', 8),
  (14, '2 Thessalonians 2:9', 9),
  -- v.23 sufferings catalog
  (23, '2 Corinthians 4:8-11', 10),
  (23, '2 Corinthians 6:4-5', 11),
  (23, '1 Corinthians 4:9-13', 12),
  -- v.24 forty stripes
  (24, 'Deuteronomy 25:3', 13),
  -- v.25 stoned / shipwreck
  (25, 'Acts 14:19', 14),
  (25, 'Acts 16:22', 15),
  -- v.28 care of all churches
  (28, 'Colossians 2:1', 16),
  (28, '1 Thessalonians 2:17-20', 17),
  -- v.33 Damascus escape
  (33, 'Acts 9:23-25', 18),
  (33, 'Joshua 2:15', 19)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 11
  AND v.verse_number = cr.verse_number;
