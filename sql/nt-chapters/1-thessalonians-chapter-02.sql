-- ═══════════════════════════════════════════════════
-- 1 THESSALONIANS CHAPTER 2 — Paul's Ministry Defended
-- 20 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '1 Thessalonians 2 is Paul''s passionate defence of his ministry among the Thessalonians. Opponents in Thessalonica had apparently attacked Paul''s character after his departure, accusing him of being a charlatan motivated by greed and flattery. Paul responds by recalling the integrity of his conduct. He came to them fresh from suffering in Philippi (v.2), preached boldly despite opposition, used no deceit or flattery (vv.3-5), refused to burden them financially though he had apostolic authority (vv.6-9), and lived among them as a nursing mother (v.7) and an exhorting father (v.11). The chapter climaxes with thanksgiving that they received his message not as the word of men but as the word of God which ''effectually worketh'' in believers (v.13). Paul then expresses his intense longing to return to them, calling them his ''hope,'' ''joy,'' and ''crown of rejoicing'' at Christ''s coming (vv.19-20).',
  'The Faithful Minister''s Character and Longing',
  'παρρησιάζομαι (parrēsiazomai)',
  'To speak boldly, to speak freely with confidence — the courage to proclaim truth despite opposition, suffering, and personal risk. Gospel ministry requires boldness, not timidity.',
  '["Bold Preaching Despite Suffering (vv.1-4): Our entrance was not in vain; we suffered at Philippi; we were bold in God; not of deceit or uncleanness; not pleasing men but God who trieth our hearts","Gentle and Self-Giving Ministry (vv.5-9): No flattery or covetousness; gentle among you as a nurse cherisheth her children; affectionately desirous; we imparted not the gospel only but our own souls; labouring night and day not to be chargeable","Holy Conduct and Fatherly Exhortation (vv.10-12): Ye are witnesses how holily and justly; as a father exhorteth his children; that ye would walk worthy of God","The Word of God Received and Effectual (vv.13-16): Ye received the word of God not as men''s word but as God''s; which effectually worketh in you; ye suffered like the churches in Judaea; they killed the Lord Jesus","Paul''s Longing to Return (vv.17-20): Taken from you in presence not in heart; we endeavoured to come; Satan hindered us; ye are our hope and joy and crown of rejoicing at Christ''s coming"]'
FROM books b WHERE b.name = '1 Thessalonians';

-- Step 2: Insert all 20 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'For yourselves, brethren, know our entrance in unto you, that it was not in vain:',
   'Αὐτοὶ γὰρ οἴδατε ἀδελφοί τὴν εἴσοδον ἡμῶν τὴν πρὸς ὑμᾶς ὅτι οὐ κενὴ γέγονεν',
   'Autoi gar oidate adelphoi tēn eisodon hēmōn tēn pros hymas hoti ou kenē gegonen',
   '''You yourselves know'' (autoi oidate — emphatic: you yourselves are the witnesses). ''Entrance'' (eisodon — coming in, arrival; the same word used in 1:9 for the report of Paul''s visit). ''Not in vain'' (ou kenē — not empty, not hollow, not without result; from kenos, empty). Paul''s visit was not the empty performance of a travelling charlatan; it bore lasting fruit. The perfect tense (gegonen — has become, has proved to be) shows the results are still visible.',
   NULL),
  (2,
   'But even after that we had suffered before, and were shamefully entreated, as ye know, at Philippi, we were bold in our God to speak unto you the gospel of God with much contention.',
   'ἀλλὰ προπαθόντες καὶ ὑβρισθέντες καθὼς οἴδατε ἐν Φιλίπποις ἐπαρρησιασάμεθα ἐν τῷ θεῷ ἡμῶν λαλῆσαι πρὸς ὑμᾶς τὸ εὐαγγέλιον τοῦ θεοῦ ἐν πολλῷ ἀγῶνι',
   'alla propathontes kai hybristhentes kathōs oidate en Philippois eparrēsiasametha en tō theō hēmōn lalēsai pros hymas to euangelion tou theou en pollō agōni',
   '''Suffered before'' (propathontes — having previously suffered). ''Shamefully entreated'' (hybristhentes — insulted, outraged, treated with wanton violence; cf. Acts 16:22-24, the beating and imprisonment at Philippi). Despite this trauma, Paul ''was bold'' (eparrēsiasametha — we spoke boldly, freely, openly; aorist: a decisive act of courage). ''In our God'' (en tō theō hēmōn — the source of boldness was God, not human courage). ''Much contention'' (pollō agōni — much conflict, great struggle; agōn is an athletic contest, implying intense exertion against opposition).',
   NULL),
  (3,
   'For our exhortation was not of deceit, nor of uncleanness, nor in guile:',
   'ἡ γὰρ παράκλησις ἡμῶν οὐκ ἐκ πλάνης οὐδὲ ἐξ ἀκαθαρσίας οὐδὲ ἐν δόλῳ',
   'hē gar paraklēsis hēmōn ouk ek planēs oude ex akatharsias oude en dolō',
   'Three negatives defend Paul''s ministry against slander: (1) ''not of deceit'' (ouk ek planēs — not from error, delusion, or wandering; the message was true), (2) ''nor of uncleanness'' (oude ex akatharsias — not from impure motives, not from moral corruption; the motive was pure), (3) ''nor in guile'' (oude en dolō — not with trickery, bait, or craftiness; the method was honest). Paul''s message, motive, and method were all clean. Travelling philosophers and religious charlatans in the ancient world were often guilty of all three.',
   NULL),
  (4,
   'But as we were allowed of God to be put in trust with the gospel, even so we speak; not as pleasing men, but God, which trieth our hearts.',
   'ἀλλὰ καθὼς δεδοκιμάσμεθα ὑπὸ τοῦ θεοῦ πιστευθῆναι τὸ εὐαγγέλιον οὕτως λαλοῦμεν οὐχ ὡς ἀνθρώποις ἀρέσκοντες ἀλλὰ θεῷ τῷ δοκιμάζοντι τὰς καρδίας ἡμῶν',
   'alla kathōs dedokimasmetha hypo tou theou pistēuthēnai to euangelion houtōs laloumen ouch hōs anthrōpois areskontes alla theō tō dokimazonti tas kardias hēmōn',
   '''Allowed'' (dedokimasmetha — approved after testing, examined and found trustworthy; perfect passive: God tested us and we stand approved). The same root (dokimazō) appears twice: God tested Paul and found him fit for the gospel trust, and God continues to test (dokimazonti — present participle: keeps on testing) their hearts. ''Put in trust with the gospel'' (pistēuthēnai to euangelion — entrusted with the gospel as a sacred deposit). The preacher is a steward, not an owner. His audience is God, not men.',
   NULL),
  (5,
   'For neither at any time used we flattering words, as ye know, nor a cloke of covetousness; God is witness:',
   'οὔτε γάρ ποτε ἐν λόγῳ κολακείας ἐγενήθημεν καθὼς οἴδατε οὔτε ἐν προφάσει πλεονεξίας θεὸς μάρτυς',
   'oute gar pote en logō kolakeias egenēthēmen kathōs oidate oute en prophasei pleonexias theos martys',
   '''Flattering words'' (logō kolakeias — speech of flattery; kolakeia appears only here in the NT — the calculated manipulation that tells people what they want to hear for personal gain). ''Cloke of covetousness'' (prophasei pleonexias — a pretext for greed, a mask covering greed). Paul appeals to two witnesses: the Thessalonians themselves (''as ye know'' — they saw his outward conduct) and God (''God is witness'' — He saw the inward motive). No flattery on the outside, no greed on the inside.',
   NULL),
  (6,
   'Nor of men sought we glory, neither of you, nor yet of others, when we might have been burdensome, as the apostles of Christ.',
   'οὔτε ζητοῦντες ἐξ ἀνθρώπων δόξαν οὔτε ἀφ᾽ ὑμῶν οὔτε ἀπ᾽ ἄλλων δυνάμενοι ἐν βάρει εἶναι ὡς Χριστοῦ ἀπόστολοι',
   'oute zētountes ex anthrōpōn doxan oute aph'' hymōn oute ap'' allōn dynamenoi en barei einai hōs Christou apostoloi',
   '''Sought we glory'' (zētountes doxan — seeking honour, reputation, applause from people). ''Burdensome'' (en barei einai — to be weighty, to assert authority, to make financial demands). ''As the apostles of Christ'' — Paul had the right to claim support and respect, but voluntarily set it aside. This is the mark of genuine ministry: the refusal to exploit legitimate authority for personal advantage.',
   NULL),
  (7,
   'But we were gentle among you, even as a nurse cherisheth her children:',
   'ἀλλ᾽ ἐγενήθημεν ἤπιοι ἐν μέσῳ ὑμῶν ὡς ἐὰν τροφὸς θάλπῃ τὰ ἑαυτῆς τέκνα',
   'all'' egenēthēmen ēpioi en mesō hymōn hōs ean trophos thalpē ta heautēs tekna',
   '''Gentle'' (ēpioi — mild, tender, kind; some manuscripts read nēpioi — infants, babes, which would mean Paul became like an infant among them, completely non-threatening). ''Nurse'' (trophos — a nursing mother, not a hired nanny but a mother nursing her own children). ''Cherisheth'' (thalpē — warms, cherishes, tenderly cares for; used of a bird warming her eggs, brooding over her young). Paul the bold preacher (v.2) is also Paul the tender mother. True ministry combines courage with gentleness.',
   NULL),
  (8,
   'So being affectionately desirous of you, we were willing to have imparted unto you, not the gospel of God only, but also our own souls, because ye were dear unto us.',
   'οὕτως ὁμειρόμενοι ὑμῶν εὐδοκοῦμεν μεταδοῦναι ὑμῖν οὐ μόνον τὸ εὐαγγέλιον τοῦ θεοῦ ἀλλὰ καὶ τὰς ἑαυτῶν ψυχάς διότι ἀγαπητοὶ ἡμῖν ἐγενήθητε',
   'houtōs homeiromenoi hymōn eudokoumen metadounai hymin ou monon to euangelion tou theou alla kai tas heautōn psychas dioti agapētoi hēmin egenēthēte',
   '''Affectionately desirous'' (homeiromenoi — yearning for, longing for with deep affection; a rare word, found only here in the NT, possibly from a term of endearment for babies). ''Our own souls'' (tas heautōn psychas — our very selves, our lives). Paul gave not just a message but himself. Gospel ministry is not information transfer but self-giving love. ''Dear'' (agapētoi — beloved ones). This is one of the most tender verses in all of Paul''s writings.',
   NULL),
  (9,
   'For ye remember, brethren, our labour and travail: for labouring night and day, because we would not be chargeable unto any of you, we preached unto you the gospel of God.',
   'μνημονεύετε γάρ ἀδελφοί τὸν κόπον ἡμῶν καὶ τὸν μόχθον νυκτὸς καὶ ἡμέρας ἐργαζόμενοι πρὸς τὸ μὴ ἐπιβαρῆσαί τινα ὑμῶν ἐκηρύξαμεν εἰς ὑμᾶς τὸ εὐαγγέλιον τοῦ θεοῦ',
   'mnēmoneuete gar adelphoi ton kopon hēmōn kai ton mokhthon nyktos kai hēmeras ergazomenoi pros to mē epibarēsai tina hymōn ekēryxamen eis hymas to euangelion tou theou',
   '''Labour and travail'' (kopon kai mokhthon — toil and hardship; two near-synonyms piled together for emphasis, denoting exhausting, back-breaking work). ''Night and day'' (nyktos kai hēmeras — Paul worked through the night hours, likely as a tentmaker, cf. Acts 18:3). ''Chargeable'' (epibarēsai — to weigh down, to be a financial burden). Paul preached the gospel while supporting himself financially — not because receiving support was wrong (cf. 1 Cor 9:14) but because he chose to remove every possible obstacle to the gospel.',
   NULL),
  (10,
   'Ye are witnesses, and God also, how holily and justly and unblameably we behaved ourselves among you that believe:',
   'ὑμεῖς μάρτυρες καὶ ὁ θεός ὡς ὁσίως καὶ δικαίως καὶ ἀμέμπτως ὑμῖν τοῖς πιστεύουσιν ἐγενήθημεν',
   'hymeis martyres kai ho theos hōs hosiōs kai dikaiōs kai amemptōs hymin tois pisteuousin egenēthēmen',
   'Two witnesses again: ''ye'' (human observers) and ''God'' (the divine observer). Three adverbs describe Paul''s conduct: (1) ''holily'' (hosiōs — devoutly, in a manner pleasing to God; the vertical dimension), (2) ''justly'' (dikaiōs — righteously, fairly, in right relationship to others; the horizontal dimension), (3) ''unblameably'' (amemptōs — blamelessly, without just cause for accusation; the public reputation). Paul''s life was transparent before God and before men.',
   NULL),
  (11,
   'As ye know how we exhorted and comforted and charged every one of you, as a father doth his children,',
   'καθάπερ οἴδατε ὡς ἕνα ἕκαστον ὑμῶν ὡς πατὴρ τέκνα ἑαυτοῦ παρακαλοῦντες ὑμᾶς καὶ παραμυθούμενοι καὶ μαρτυρόμενοι',
   'kathaper oidate hōs hena hekaston hymōn hōs patēr tekna heautou parakalountes hymas kai paramythoumenoi kai martyromenoi',
   'From nursing mother (v.7) to father — both parental images for ministry. ''Every one of you'' (hena hekaston — one by one, individually; personal, not mass-produced). Three fatherly actions: (1) ''exhorted'' (parakalountes — urged, encouraged, called alongside), (2) ''comforted'' (paramythoumenoi — consoled, spoke tenderly to), (3) ''charged'' (martyromenoi — solemnly testified, earnestly declared). A good father adapts: sometimes encouraging, sometimes comforting, sometimes warning.',
   NULL),
  (12,
   'That ye would walk worthy of God, who hath called you unto his kingdom and glory.',
   'εἰς τὸ περιπατεῖν ὑμᾶς ἀξίως τοῦ θεοῦ τοῦ καλοῦντος ὑμᾶς εἰς τὴν ἑαυτοῦ βασιλείαν καὶ δόξαν',
   'eis to peripatein hymas axiōs tou theou tou kalountos hymas eis tēn heautou basileian kai doxan',
   '''Walk worthy'' (peripatein axiōs — conduct your life in a manner worthy of, in a way that corresponds to). The standard is not human expectation but ''of God'' (tou theou — God Himself is the measure). ''Called'' (kalountos — present participle: the one calling; God''s call is ongoing). ''Kingdom and glory'' — the present reality (kingdom) and future consummation (glory). The believer''s walk should match the dignity of the God who called them.',
   NULL),
  (13,
   'For this cause also thank we God without ceasing, because, when ye received the word of God which ye heard of us, ye received it not as the word of men, but as it is in truth, the word of God, which effectually worketh also in you that believe.',
   'Καὶ διὰ τοῦτο καὶ ἡμεῖς εὐχαριστοῦμεν τῷ θεῷ ἀδιαλείπτως ὅτι παραλαβόντες λόγον ἀκοῆς παρ᾽ ἡμῶν τοῦ θεοῦ ἐδέξασθε οὐ λόγον ἀνθρώπων ἀλλὰ καθὼς ἀληθῶς ἐστιν λόγον θεοῦ ὃς καὶ ἐνεργεῖται ἐν ὑμῖν τοῖς πιστεύουσιν',
   'Kai dia touto kai hēmeis eucharistoumen tō theō adialeiptōs hoti paralabontes logon akoēs par'' hēmōn tou theou edexasthe ou logon anthrōpōn alla kathōs alēthōs estin logon theou hos kai energeitai en hymin tois pisteuousin',
   'The theological centre of the chapter. ''Received'' appears twice, with two different Greek words: (1) ''paralabontes'' (having received by tradition, taken over) and (2) ''edexasthe'' (welcomed, embraced personally). They accepted the message objectively (paralabontes) and then welcomed it subjectively (edexasthe). ''Not as the word of men, but as it is in truth, the word of God'' — the preacher''s message was human in delivery but divine in origin. ''Effectually worketh'' (energeitai — is at work, is energising, is active; middle voice: the word is self-activating in believers). The word of God is not inert text; it is living energy that transforms those who believe.',
   'The inspiration and efficacy of Scripture: This verse affirms both the divine origin of the apostolic message (''the word of God'') and its inherent power (''effectually worketh''). The word is not activated by human faith alone — it energeitai (works of itself) in those who believe. The word does the work; faith opens the door. This is the Protestant doctrine of the efficacy of Scripture.'),
  (14,
   'For ye, brethren, became followers of the churches of God which in Judaea are in Christ Jesus: for ye also have suffered like things of your own countrymen, even as they have of the Jews:',
   'ὑμεῖς γὰρ μιμηταὶ ἐγενήθητε ἀδελφοί τῶν ἐκκλησιῶν τοῦ θεοῦ τῶν οὐσῶν ἐν τῇ Ἰουδαίᾳ ἐν Χριστῷ Ἰησοῦ ὅτι τὰ αὐτὰ ἐπάθετε καὶ ὑμεῖς ὑπὸ τῶν ἰδίων συμφυλετῶν καθὼς καὶ αὐτοὶ ὑπὸ τῶν Ἰουδαίων',
   'hymeis gar mimētai egenēthēte adelphoi tōn ekklēsiōn tou theou tōn ousōn en tē Ioudaia en Christō Iēsou hoti ta auta epathete kai hymeis hypo tōn idiōn symphyletōn kathōs kai autoi hypo tōn Ioudaiōn',
   '''Followers'' (mimētai — imitators, not by choice but by shared experience). ''Your own countrymen'' (symphyletōn — fellow-tribesmen, fellow-citizens; used only here in the NT). Just as the Judaean churches suffered from Jewish opponents, the Thessalonians suffered from their pagan neighbours. Persecution is the common experience of authentic churches. The parallel shows that true faith always meets resistance — whether Jewish or Gentile.',
   NULL),
  (15,
   'Who both killed the Lord Jesus, and their own prophets, and have persecuted us; and they please not God, and are contrary to all men:',
   'τῶν καὶ τὸν κύριον ἀποκτεινάντων Ἰησοῦν καὶ τοὺς ἰδίους προφήτας καὶ ἡμᾶς ἐκδιωξάντων καὶ θεῷ μὴ ἀρεσκόντων καὶ πᾶσιν ἀνθρώποις ἐναντίων',
   'tōn kai ton kyrion apokteinantōn Iēsoun kai tous idious prophētas kai hēmas ekdiōxantōn kai theō mē areskontōn kai pasin anthrōpois enantiōn',
   'A catalogue of guilt in ascending order: (1) ''killed the Lord Jesus'' — the supreme crime of history, (2) ''their own prophets'' — a long pattern of rejecting God''s messengers (cf. Matt 23:31-37), (3) ''persecuted us'' — the pattern continues with the apostles. Two results: ''they please not God'' (theō mē areskontōn) and ''are contrary to all men'' (pasin anthrōpois enantiōn — hostile to all humanity). Paul is not anti-Semitic (he is himself a Jew, Rom 9:1-5) but speaks of the specific opponents who resist the gospel.',
   NULL),
  (16,
   'Forbidding us to speak to the Gentiles that they might be saved, to fill up their sins alway: for the wrath is come upon them to the uttermost.',
   'κωλυόντων ἡμᾶς τοῖς ἔθνεσιν λαλῆσαι ἵνα σωθῶσιν εἰς τὸ ἀναπληρῶσαι αὐτῶν τὰς ἁμαρτίας πάντοτε ἔφθασεν δὲ ἐπ᾽ αὐτοὺς ἡ ὀργὴ εἰς τέλος',
   'kōlyontōn hēmas tois ethnesin lalēsai hina sōthōsin eis to anaplērōsai autōn tas hamartias pantote ephthasen de ep'' autous hē orgē eis telos',
   '''Forbidding us to speak to the Gentiles'' (kōlyontōn — hindering, preventing; cf. Acts 17:5-9, 13). The worst sin: preventing others from hearing the gospel. ''To fill up their sins alway'' (eis to anaplērōsai — to fill up to the brim, to bring to full measure; the cup of iniquity is reaching its limit). ''The wrath is come upon them to the uttermost'' (ephthasen hē orgē eis telos — the wrath has arrived, has overtaken; aorist: a past event with present consequences). ''To the uttermost'' (eis telos — to the end, completely, finally). This may refer to the coming destruction of Jerusalem (AD 70) seen prophetically.',
   NULL),
  (17,
   'But we, brethren, being taken from you for a short time in presence, not in heart, endeavoured the more abundantly to see your face with great desire.',
   'Ἡμεῖς δέ ἀδελφοί ἀπορφανισθέντες ἀφ᾽ ὑμῶν πρὸς καιρὸν ὥρας προσώπῳ οὐ καρδίᾳ περισσοτέρως ἐσπουδάσαμεν τὸ πρόσωπον ὑμῶν ἰδεῖν ἐν πολλῇ ἐπιθυμίᾳ',
   'Hēmeis de adelphoi aporphanisthentes aph'' hymōn pros kairon hōras prosōpō ou kardia perissoterōs espoudasamen to prosōpon hymōn idein en pollē epithymia',
   '''Taken from you'' (aporphanisthentes — orphaned from you, bereaved, torn away like a parent from children; from orphanos, orphan). Paul felt like an orphan separated from his family. ''For a short time'' (pros kairon hōras — for a season of an hour; it felt unbearably brief). ''In presence, not in heart'' (prosōpō ou kardia — in face, not in heart; physical absence did not diminish emotional attachment). ''Great desire'' (pollē epithymia — much longing, strong desire). Paul''s language here is among the most emotionally intense in all his letters.',
   NULL),
  (18,
   'Wherefore we would have come unto you, even I Paul, once and again; but Satan hindered us.',
   'διότι ἠθελήσαμεν ἐλθεῖν πρὸς ὑμᾶς ἐγὼ μὲν Παῦλος καὶ ἅπαξ καὶ δίς καὶ ἐνέκοψεν ἡμᾶς ὁ Σατανᾶς',
   'dioti ēthelēsamen elthein pros hymas egō men Paulos kai hapax kai dis kai enekopsen hēmas ho Satanas',
   '''Even I Paul'' (egō men Paulos — Paul speaks personally, stepping out from behind the plural ''we''). ''Once and again'' (hapax kai dis — once and twice; repeated attempts). ''Satan hindered us'' (enekopsen hēmas ho Satanas — Satan cut in on us, blocked our road; from enkoptō, to cut into, to impede, a military term for breaking up a road to prevent an army''s advance). Paul acknowledges the reality of satanic opposition to ministry. Not every hindrance is providential guidance — some are enemy interference.',
   NULL),
  (19,
   'For what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Jesus Christ at his coming?',
   'τίς γὰρ ἡμῶν ἐλπὶς ἢ χαρὰ ἢ στέφανος καυχήσεως ἢ οὐχὶ καὶ ὑμεῖς ἔμπροσθεν τοῦ κυρίου ἡμῶν Ἰησοῦ Χριστοῦ ἐν τῇ αὐτοῦ παρουσίᾳ',
   'tis gar hēmōn elpis ē chara ē stephanos kauchēseōs ē ouchi kai hymeis emprosthen tou kyriou hēmōn Iēsou Christou en tē autou parousia',
   '''Crown of rejoicing'' (stephanos kauchēseōs — wreath of boasting, the victor''s garland of exultation). Not a royal crown (diadēma) but an athlete''s prize wreath (stephanos). Paul''s converts are his trophy at Christ''s return. ''At his coming'' (en tē autou parousia — at His presence, arrival; the first of four uses of parousia in this epistle: 2:19; 3:13; 4:15; 5:23). Parousia was used for the official arrival of a king or emperor. The Thessalonians will be Paul''s joy when the King arrives.',
   NULL),
  (20,
   'For ye are our glory and joy.',
   'ὑμεῖς γάρ ἐστε ἡ δόξα ἡμῶν καὶ ἡ χαρά',
   'hymeis gar este hē doxa hēmōn kai hē chara',
   '''Ye are'' (hymeis este — emphatic: you yourselves are). ''Our glory'' (hē doxa hēmōn — our splendour, our honour, our radiance). ''And joy'' (kai hē chara — and our delight). This is not mere sentiment but eschatological reality: the Thessalonians are the evidence of Paul''s faithful ministry, the proof that his life was not in vain. At the judgment seat of Christ, Paul will point to them. A minister''s ultimate reward is not money or fame but transformed lives.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2;

-- Step 3: Word Studies for key verses

-- Verse 2 (Bold in God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπαρρησιασάμεθα', 'eparrēsiasametha', 'G3955', 'We spoke boldly, we declared with freedom and confidence — from parrēsia (all + speech: free speech, outspokenness). Paul preached without self-censorship despite fresh wounds from Philippi.', 1),
  ('ἀγῶνι', 'agōni', 'G73', 'Contest, conflict, struggle — an athletic metaphor for the intense effort of gospel ministry against opposition. The word gives us English "agony." Ministry is a fight, not a stroll.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 2;

-- Verse 4 (Approved of God)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δεδοκιμάσμεθα', 'dedokimasmetha', 'G1381', 'We have been approved after testing — perfect passive: tested by God in the past and standing approved. Like metal assayed and certified pure. God vetted Paul before entrusting him with the gospel.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 4;

-- Verse 7 (Gentle as a nurse)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἤπιοι', 'ēpioi', 'G2261', 'Gentle, mild, tender — the opposite of harsh or authoritarian. Some manuscripts read nēpioi (infants), making Paul even more vulnerable. Either reading shows radical gentleness.', 1),
  ('τροφός', 'trophos', 'G5162', 'Nursing mother, one who nourishes — not a hired nurse but a mother breastfeeding her own (heautēs) children. The most intimate and tender image Paul could choose for pastoral care.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 7;

-- Verse 13 (Word of God effectually works)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐνεργεῖται', 'energeitai', 'G1754', 'Is at work, is operating, is energising — middle voice: the word is self-activating within believers. It does not sit idle but actively transforms. The source of English "energy."', 1),
  ('παραλαβόντες', 'paralabontes', 'G3880', 'Having received by transmission, having taken over — the objective reception of a tradition or teaching passed down. The gospel was received as authoritative apostolic deposit.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 13;

-- Verse 17 (Orphaned from you)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀπορφανισθέντες', 'aporphanisthentes', 'G642', 'Orphaned, bereaved, torn away — from orphanos (orphan). Used only here in the NT. Paul felt the separation like a parent ripped from children. The most emotionally charged word for separation he could find.', 1)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 17;

-- Verse 19 (Crown of rejoicing at His coming)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στέφανος', 'stephanos', 'G4735', 'Crown, wreath, garland — the victor''s wreath awarded at athletic games, not the royal diadem (diadēma). Paul''s converts are his prize, his trophy of faithful ministry.', 1),
  ('παρουσίᾳ', 'parousia', 'G3952', 'Coming, presence, arrival — a technical term for the official visit of a king or dignitary. Used 4 times in 1 Thessalonians (2:19; 3:13; 4:15; 5:23). The Second Coming of Christ is the grand royal arrival.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = 19;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v2: Bold despite suffering
  (2, 'Acts 16:22-24', 1), (2, 'Acts 17:1-4', 2), (2, 'Ephesians 6:19-20', 3),
  -- v4: Approved by God
  (4, '1 Corinthians 4:1-2', 1), (4, '2 Timothy 2:15', 2), (4, 'Galatians 1:10', 3),
  -- v5: No flattery or covetousness
  (5, '2 Corinthians 2:17', 1), (5, 'Acts 20:33', 2), (5, '2 Peter 2:3', 3),
  -- v7: Gentle as a nurse
  (7, '2 Corinthians 12:14-15', 1), (7, '1 Corinthians 3:1-2', 2), (7, 'Galatians 4:19', 3),
  -- v9: Labouring night and day
  (9, 'Acts 18:3', 1), (9, '2 Thessalonians 3:8', 2), (9, '1 Corinthians 9:14-18', 3),
  -- v12: Walk worthy of God
  (12, 'Ephesians 4:1', 1), (12, 'Colossians 1:10', 2), (12, 'Philippians 1:27', 3),
  -- v13: Word of God effectually works
  (13, 'Hebrews 4:12', 1), (13, 'Romans 1:16', 2), (13, 'Isaiah 55:11', 3),
  -- v14: Suffered from own countrymen
  (14, 'Acts 17:5-9', 1), (14, 'Hebrews 10:32-34', 2),
  -- v15: Killed the Lord Jesus
  (15, 'Acts 2:23', 1), (15, 'Matthew 23:31-37', 2), (15, 'Acts 7:52', 3),
  -- v18: Satan hindered
  (18, 'Romans 1:13', 1), (18, 'Romans 15:22', 2), (18, '2 Corinthians 12:7', 3),
  -- v19: Crown of rejoicing
  (19, 'Philippians 4:1', 1), (19, '2 Corinthians 1:14', 2), (19, 'Daniel 12:3', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Thessalonians' AND c.chapter_number = 2 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 1 Thessalonians Chapter 2 Complete
-- 20 verses · 7 key verses with word studies (12 words)
-- Cross-references for 11 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════