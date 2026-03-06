-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 12 — The Thorn in the Flesh and Sufficient Grace
-- 21 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 12,
  '2 Corinthians 12 contains some of the most profound and personal passages in the Pauline corpus. Paul recounts being ''caught up to the third heaven'' and ''into paradise,'' where he ''heard unspeakable words, which it is not lawful for a man to utter'' (vv.2-4). To prevent pride from this extraordinary revelation, ''there was given to me a thorn in the flesh, the messenger of Satan to buffet me'' (v.7). Three times Paul pleaded for its removal. God''s answer is the epistle''s theological climax: ''My grace is sufficient for thee: for my strength is made perfect in weakness'' (v.9). Paul''s response is equally stunning: ''Most gladly therefore will I rather glory in my infirmities, that the power of Christ may rest upon me … for when I am weak, then am I strong'' (vv.9-10). Paul then defends his apostleship with ''signs of an apostle'' performed among them (v.12) and reiterates his refusal of financial support: ''I will not be burdensome to you: for I seek not yours, but you'' (v.14). He anticipates his third visit with a parent''s love: ''the children ought not to lay up for the parents, but the parents for the children. And I will very gladly spend and be spent for you'' (vv.14-15). The chapter closes with Paul''s fear that he may find unrepented sin when he arrives (vv.20-21).',
  'The Thorn in the Flesh, Power in Weakness',
  'σκόλοψ (skolops)',
  'Thorn, stake, splinter — a sharp, pointed object that pierces the flesh. Paul''s ''thorn in the flesh'' was a persistent affliction given to keep him humble after extraordinary revelations. Its exact nature is unknown (illness, persecution, temptation?), but its purpose is clear: to ensure that Paul depends on God''s grace rather than his own strength.',
  '["Visions and Revelations: Caught Up to Paradise (vv.1-6): It is not expedient for me doubtless to glory I will come to visions and revelations of the Lord I knew a man in Christ above fourteen years ago whether in the body I cannot tell or whether out of the body I cannot tell God knoweth such an one caught up to the third heaven and I knew such a man whether in the body or out of the body I cannot tell God knoweth how that he was caught up into paradise and heard unspeakable words which it is not lawful for a man to utter; of such an one will I glory yet of myself I will not glory but in mine infirmities","The Thorn in the Flesh and Sufficient Grace (vv.7-10): And lest I should be exalted above measure through the abundance of the revelations there was given to me a thorn in the flesh the messenger of Satan to buffet me lest I should be exalted above measure; for this thing I besought the Lord thrice that it might depart from me and he said unto me my grace is sufficient for thee for my strength is made perfect in weakness; most gladly therefore will I rather glory in my infirmities that the power of Christ may rest upon me therefore I take pleasure in infirmities in reproaches in necessities in persecutions in distresses for Christ''s sake for when I am weak then am I strong","Signs of Apostleship and the Selfless Father (vv.11-18): I am become a fool in glorying ye have compelled me for I ought to have been commended of you for in nothing am I behind the very chiefest apostles though I be nothing; truly the signs of an apostle were wrought among you in all patience in signs and wonders and mighty deeds; for what is it wherein ye were inferior to other churches except it be that I myself was not burdensome to you forgive me this wrong; behold the third time I am ready to come to you and I will not be burdensome to you for I seek not yours but you for the children ought not to lay up for the parents but the parents for the children and I will very gladly spend and be spent for you","Concern for the Coming Visit (vv.19-21): Again think ye that we excuse ourselves unto you we speak before God in Christ but we do all things dearly beloved for your edifying; for I fear lest when I come I shall not find you such as I would and that I shall be found unto you such as ye would not lest there be debates envyings wraths strifes backbitings whisperings swellings tumults; and lest when I come again my God will humble me among you and that I shall bewail many which have sinned already and have not repented of the uncleanness and fornication and lasciviousness which they have committed"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 21 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'It is not expedient for me doubtless to glory. I will come to visions and revelations of the Lord.',
   'καυχᾶσθαι δὴ οὐ συμφέρει μοι ἐλεύσομαι γὰρ εἰς ὀπτασίας καὶ ἀποκαλύψεις κυρίου',
   'kauchasthai dē ou sympherei moi eleusomai gar eis optasias kai apokalypseis kyriou',
   '''Not expedient'' (ou sympherei — not profitable, not beneficial; boasting serves no purpose). ''Visions'' (optasias — supernatural visual experiences). ''Revelations'' (apokalypseis — unveilings of hidden truth). Paul shifts from the suffering catalog (ch.11) to mystical experience. If the opponents boast of visions, Paul can match them — but reluctantly.',
   NULL),
  (2, 'I knew a man in Christ above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: God knoweth;) such an one caught up to the third heaven.',
   'οἶδα ἄνθρωπον ἐν Χριστῷ πρὸ ἐτῶν δεκατεσσάρων εἴτε ἐν σώματι οὐκ οἶδα εἴτε ἐκτὸς τοῦ σώματος οὐκ οἶδα ὁ θεὸς οἶδεν ἁρπαγέντα τὸν τοιοῦτον ἕως τρίτου οὐρανοῦ',
   'oida anthrōpon en Christō pro etōn dekatessarōn eite en sōmati ouk oida eite ektos tou sōmatos ouk oida ho theos oiden harpagenta ton toiouton heōs tritou ouranou',
   '''A man in Christ'' — Paul speaks of himself in the third person, distancing himself from the experience to avoid self-glorification. ''Fourteen years ago'' — placing this around AD 42-44, during the ''silent years'' of Paul''s ministry. ''Whether in the body … God knoweth'' — Paul genuinely does not know if the experience was bodily or purely spiritual. ''Caught up'' (harpagenta — snatched away, seized; a violent, sudden transport). ''Third heaven'' — in Jewish cosmology, the highest heaven, God''s dwelling place (first heaven: atmosphere; second: stars; third: God''s presence).',
   NULL),
  (3, 'And I knew such a man, (whether in the body, or out of the body, I cannot tell: God knoweth;)',
   'καὶ οἶδα τὸν τοιοῦτον ἄνθρωπον εἴτε ἐν σώματι εἴτε ἐκτὸς τοῦ σώματος οὐκ οἶδα ὁ θεὸς οἶδεν',
   'kai oida ton toiouton anthrōpon eite en sōmati eite ektos tou sōmatos ouk oida ho theos oiden',
   'The repetition emphasizes the mystery: Paul cannot resolve the nature of the experience. ''God knoweth'' — some things are known only to God. Paul''s honesty about his own ignorance is itself remarkable in a context where opponents presumably claimed detailed knowledge of their mystical experiences.',
   NULL),
  (4, 'How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.',
   'ὅτι ἡρπάγη εἰς τὸν παράδεισον καὶ ἤκουσεν ἄρρητα ῥήματα ἃ οὐκ ἐξὸν ἀνθρώπῳ λαλῆσαι',
   'hoti hērpagē eis ton paradeison kai ēkousen arrēta rhēmata ha ouk exon anthrōpō lalēsai',
   '''Paradise'' (paradeison — paradise, the garden of God; from Old Persian paridaida, an enclosed garden; cf. Luke 23:43, Rev 2:7). ''Unspeakable words'' (arrēta rhēmata — inexpressible utterances; words that cannot or may not be spoken). ''Not lawful'' (ouk exon — not permitted). Paul received revelations so sacred they cannot be communicated. Unlike the opponents who presumably detailed their revelations, Paul is forbidden to share his. The content is sealed; only its effect (the thorn) is revealed.',
   NULL),
  (5, 'Of such an one will I glory: yet of myself I will not glory, but in mine infirmities.',
   'ὑπὲρ τοῦ τοιούτου καυχήσομαι ὑπὲρ δὲ ἐμαυτοῦ οὐ καυχήσομαι εἰ μὴ ἐν ταῖς ἀσθενείαις μου',
   'hyper tou toioutou kauchēsomai hyper de emautou ou kauchēsomai ei mē en tais astheneiais mou',
   'Paul maintains the third-person distance: he will boast about ''that man'' (the one caught up to heaven) but not about himself — except in weaknesses. The paradox: the man who saw paradise boasts only of his thorn. This is the complete inversion of the opponents'' boasting.',
   NULL),
  (6, 'For though I would desire to glory, I shall not be a fool; for I will say the truth: but now I forbear, lest any man should think of me above that which he seeth me to be, or that he heareth of me.',
   'ἐὰν γὰρ θελήσω καυχήσασθαι οὐκ ἔσομαι ἄφρων ἀλήθειαν γὰρ ἐρῶ φείδομαι δέ μή τις εἰς ἐμὲ λογίσηται ὑπὲρ ὃ βλέπει με ἢ ἀκούει τι ἐξ ἐμοῦ',
   'ean gar thelēsō kauchēsasthai ouk esomai aphrōn alētheian gar erō pheidomai de mē tis eis eme logisētai hyper ho blepei me ē akouei ti ex emou',
   '''I shall not be a fool'' — if Paul boasted of paradise, it would be true, not foolish. ''I forbear'' (pheidomai — I refrain, I spare myself). ''Lest any man should think of me above'' — Paul deliberately suppresses revelation to prevent others from overestimating him. He wants to be evaluated by his visible life and audible teaching, not by mystical credentials. This is the opposite of the opponents'' strategy.',
   NULL),
  (7, 'And lest I should be exalted above measure through the abundance of the revelations, there was given to me a thorn in the flesh, the messenger of Satan to buffet me, lest I should be exalted above measure.',
   'καὶ τῇ ὑπερβολῇ τῶν ἀποκαλύψεων ἵνα μὴ ὑπεραίρωμαι ἐδόθη μοι σκόλοψ τῇ σαρκί ἄγγελος σατανᾶ ἵνα με κολαφίζῃ ἵνα μὴ ὑπεραίρωμαι',
   'kai tē hyperbolē tōn apokalypseōn hina mē hyperairōmai edothē moi skolops tē sarki angelos satana hina me kolaphizē hina mē hyperairōmai',
   '''Exalted above measure'' (hyperairōmai — lifted up excessively; repeated twice for emphasis). ''There was given'' (edothē — divine passive: God gave it, or allowed it to be given). ''Thorn in the flesh'' (skolops tē sarki — a stake/splinter in the flesh; skolops can mean a sharpened stake used for impalement, suggesting extreme pain). ''Messenger of Satan'' (angelos satana — an angel/agent of Satan). ''Buffet'' (kolaphizē — to strike with the fist, to beat). The thorn''s identity is unknown — chronic illness, demonic opposition, a human adversary? — but its purpose is clear: to prevent pride from the abundance of revelations.',
   'The ''thorn in the flesh'' is one of the most discussed phrases in the NT. Its exact nature has been debated for centuries: epilepsy, eye disease, malaria, chronic pain, a human opponent, or satanic harassment. Paul''s deliberate vagueness may be providential — by not specifying the thorn, every suffering Christian can identify with it. The theological framework is precise: (1) God permits it (edothē, divine passive); (2) Satan delivers it (angelos satana); (3) its purpose is sanctifying (lest I be exalted). God uses Satan''s instrument for his own purposes — the same pattern as Job. The thorn is simultaneously a satanic attack and a divine gift.'),
  (8, 'For this thing I besought the Lord thrice, that it might depart from me.',
   'ὑπὲρ τούτου τρὶς τὸν κύριον παρεκάλεσα ἵνα ἀποστῇ ἀπ᾿ ἐμοῦ',
   'hyper toutou tris ton kyrion parekalesa hina apostē ap'' emou',
   '''Besought the Lord thrice'' (tris ton kyrion parekalesa — I appealed to the Lord three times). ''Thrice'' echoes Jesus in Gethsemane (Matt 26:39-44: three times asking that the cup pass). ''The Lord'' — Jesus Christ, to whom Paul prays directly. ''That it might depart'' (hina apostē — that it might stand away from me). Paul''s prayer was reasonable, earnest, and repeated. God''s answer was not removal but something better.',
   NULL),
  (9, 'And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness. Most gladly therefore will I rather glory in my infirmities, that the power of Christ may rest upon me.',
   'καὶ εἴρηκέν μοι ἀρκεῖ σοι ἡ χάρις μου ἡ γὰρ δύναμίς μου ἐν ἀσθενείᾳ τελειοῦται ἥδιστα οὖν μᾶλλον καυχήσομαι ἐν ταῖς ἀσθενείαις μου ἵνα ἐπισκηνώσῃ ἐπ᾿ ἐμὲ ἡ δύναμις τοῦ Χριστοῦ',
   'kai eirēken moi arkei soi hē charis mou hē gar dynamis mou en astheneia teleioutai hēdista oun mallon kauchēsomai en tais astheneiais mou hina episkēnōsē ep'' eme hē dynamis tou Christou',
   '''He said'' (eirēken — perfect tense: he has said and his word stands; the answer is permanent). ''My grace is sufficient'' (arkei soi hē charis mou — my grace is enough for you; arkei means ''it is enough, it suffices''). ''My strength is made perfect in weakness'' (hē dynamis mou en astheneia teleioutai — my power reaches its goal, its completion, its full expression in weakness). ''Most gladly'' (hēdista — with greatest pleasure). ''Rest upon me'' (episkēnōsē — to spread a tent over, to tabernacle upon; from epi + skēnoō; the same root as John 1:14: the Word ''tabernacled'' among us). Christ''s power pitches its tent over Paul''s weakness.',
   'This is arguably the most important verse in 2 Corinthians and one of the most important in the entire Pauline corpus. God''s response to Paul''s prayer is not removal of the thorn but revelation of a principle: divine power operates optimally through human weakness. ''Made perfect'' (teleioutai) means brought to completion — weakness is not merely tolerated by grace but is the very condition in which grace achieves its fullest expression. The word episkēnōsē (tabernacle upon) is remarkable: Christ''s power does not merely help the weak person but dwells upon him as the Shekinah glory dwelt upon the tabernacle. Weakness becomes the tent over which divine glory settles. This verse inverts every human value system: strength is not the goal; grace-filled weakness is.'),
  (10, 'Therefore I take pleasure in infirmities, in reproaches, in necessities, in persecutions, in distresses for Christ''s sake: for when I am weak, then am I strong.',
   'διὸ εὐδοκῶ ἐν ἀσθενείαις ἐν ὕβρεσιν ἐν ἀνάγκαις ἐν διωγμοῖς ἐν στενοχωρίαις ὑπὲρ Χριστοῦ ὅταν γὰρ ἀσθενῶ τότε δυνατός εἰμι',
   'dio eudokō en astheneiais en hybresin en anankais en diōgmois en stenochōriais hyper Christou hotan gar asthenō tote dynatos eimi',
   '''Take pleasure'' (eudokō — I am well-pleased, I delight in; the same verb used of the Father''s pleasure in the Son, Matt 3:17). Five categories of weakness: infirmities, reproaches (hybresin — insults, outrages), necessities, persecutions, distresses. ''For Christ''s sake'' (hyper Christou — on behalf of Christ). ''When I am weak, then am I strong'' (hotan asthenō, tote dynatos eimi) — the thesis statement of the entire epistle in seven Greek words. This is not paradox for paradox''s sake but the experienced reality of grace-empowered ministry.',
   NULL),
  (11, 'I am become a fool in glorying; ye have compelled me: for I ought to have been commended of you: for in nothing am I behind the very chiefest apostles, though I be nothing.',
   'γέγονα ἄφρων ὑμεῖς με ἠναγκάσατε ἐγὼ γὰρ ὤφειλον ὑφ᾿ ὑμῶν συνίστασθαι οὐδὲν γὰρ ὑστέρησα τῶν ὑπερλίαν ἀποστόλων εἰ καὶ οὐδέν εἰμι',
   'gegona aphrōn hymeis me ēnankasate egō gar ōpheilon hyph'' hymōn synistasthai ouden gar hysterēsa tōn hyperlian apostolōn ei kai ouden eimi',
   '''I am become a fool'' (gegona aphrōn — I have become foolish; the fool''s speech is over). ''Ye have compelled me'' — the Corinthians forced this by failing to defend Paul. ''Super-apostles'' (hyperlian apostolōn — cf. 11:5). ''Though I be nothing'' (ouden eimi — I am nothing). Even after the most extraordinary catalog of suffering and mystical experience, Paul adds: ''I am nothing.'' The one who saw paradise and was taught the secret of sufficient grace counts himself as zero.',
   NULL),
  (12, 'Truly the signs of an apostle were wrought among you in all patience, in signs, and wonders, and mighty deeds.',
   'τὰ μὲν σημεῖα τοῦ ἀποστόλου κατειργάσθη ἐν ὑμῖν ἐν πάσῃ ὑπομονῇ ἐν σημείοις καὶ τέρασιν καὶ δυνάμεσιν',
   'ta men sēmeia tou apostolou kateirgasthē en hymin en pasē hypomonē en sēmeiois kai terasin kai dynamesin',
   '''Signs of an apostle'' (sēmeia tou apostolou — the authenticating marks of apostleship). ''In all patience'' (en pasē hypomonē — with total endurance; patience heads the list — endurance under suffering is the primary apostolic sign). ''Signs, wonders, mighty deeds'' (sēmeiois, terasin, dynamesin — the triple formula for miraculous authentication; cf. Heb 2:4). Paul performed miracles at Corinth, but he lists ''patience'' first. Endurance in suffering is a greater credential than spectacular miracles.',
   NULL),
  (13, 'For what is it wherein ye were inferior to other churches, except it be that I myself was not burdensome to you? forgive me this wrong.',
   'τί γάρ ἐστιν ὃ ἡττήθητε ὑπὲρ τὰς λοιπὰς ἐκκλησίας εἰ μὴ ὅτι αὐτὸς ἐγὼ οὐ κατενάρκησα ὑμῶν χαρίσασθέ μοι τὴν ἀδικίαν ταύτην',
   'ti gar estin ho hēttēthēte hyper tas loipas ekklēsias ei mē hoti autos egō ou katenarkēsa hymōn charisasthe moi tēn adikian tautēn',
   '''Inferior'' (hēttēthēte — disadvantaged, treated as less). The Corinthians received everything other churches received — signs, wonders, teaching — minus one thing: they didn''t have to pay for it. ''Forgive me this wrong'' — devastating irony: forgive me for not burdening you. Paul turns his opponents'' complaint into a bitter jest.',
   NULL),
  (14, 'Behold, the third time I am ready to come to you; and I will not be burdensome to you: for I seek not yours, but you: for the children ought not to lay up for the parents, but the parents for the children.',
   'ἰδοὺ τρίτον τοῦτο ἑτοίμως ἔχω ἐλθεῖν πρὸς ὑμᾶς καὶ οὐ καταναρκήσω ὑμῶν οὐ γὰρ ζητῶ τὰ ὑμῶν ἀλλ᾿ ὑμᾶς οὐ γὰρ ὀφείλει τὰ τέκνα τοῖς γονεῦσιν θησαυρίζειν ἀλλ᾿ οἱ γονεῖς τοῖς τέκνοις',
   'idou triton touto hetoimōs echō elthein pros hymas kai ou katanarkēsō hymōn ou gar zētō ta hymōn all'' hymas ou gar opheilei ta tekna tois goneusin thēsaurizein all'' hoi goneis tois teknois',
   '''Third time'' — the third planned visit (the first visit founded the church; the second was the ''painful visit'' of 2:1). ''I seek not yours, but you'' (ou ta hymōn all'' hymas — not your possessions but your very selves). ''Parents for the children'' — Paul uses the parent-child metaphor: as a father, his role is to give, not to take. This is the defining principle of pastoral ministry: the shepherd gives to the sheep, not the reverse.',
   NULL),
  (15, 'And I will very gladly spend and be spent for you; though the more abundantly I love you, the less I be loved.',
   'ἐγὼ δὲ ἥδιστα δαπανήσω καὶ ἐκδαπανηθήσομαι ὑπὲρ τῶν ψυχῶν ὑμῶν εἰ καὶ περισσοτέρως ὑμᾶς ἀγαπῶν ἧττον ἀγαπῶμαι',
   'egō de hēdista dapanēsō kai ekdapanēthēsomai hyper tōn psychōn hymōn ei kai perissoterōs hymas agapōn hētton agapōmai',
   '''Very gladly'' (hēdista — with greatest pleasure; the same superlative as v.9). ''Spend'' (dapanēsō — expend my resources). ''Be spent'' (ekdapanēthēsomai — be completely exhausted, utterly used up; the ek- prefix intensifies). ''For your souls'' (hyper tōn psychōn hymōn — for your very lives/selves). ''The more I love, the less I am loved'' — one of the most poignant sentences Paul ever wrote. His love is inversely proportional to the love he receives. This is christlike love: love that does not depend on reciprocation.',
   NULL),
  (16, 'But be it so, I did not burden you: nevertheless, being crafty, I caught you with guile.',
   'ἔστω δέ ἐγὼ οὐ κατεβάρησα ὑμᾶς ἀλλ᾿ ὑπάρχων πανοῦργος δόλῳ ὑμᾶς ἔλαβον',
   'estō de egō ou katebarēsa hymas all'' hyparchōn panourgos dolō hymas elabon',
   '''Being crafty, I caught you with guile'' — Paul quotes the opponents'' accusation: they claimed that even though Paul didn''t take money directly, he schemed to get it through intermediaries (Titus and the collection). Paul presents this charge to refute it (vv.17-18).',
   NULL),
  (17, 'Did I make a gain of you by any of them whom I sent unto you?',
   'μή τινα ὧν ἀπέσταλκα πρὸς ὑμᾶς δι᾿ αὐτοῦ ἐπλεονέκτησα ὑμᾶς',
   'mē tina hōn apestalka pros hymas di'' autou epleonektēsa hymas',
   '''Make a gain'' (epleonektēsa — exploited, took advantage of; cf. 2:11). The rhetorical question expects ''No!'' Paul appeals to the Corinthians'' own experience: did any of his delegates defraud them?',
   NULL),
  (18, 'I desired Titus, and with him I sent a brother. Did Titus make a gain of you? walked we not in the same spirit? walked we not in the same steps?',
   'παρεκάλεσα Τίτον καὶ συναπέστειλα τὸν ἀδελφόν μήτι ἐπλεονέκτησεν ὑμᾶς Τίτος οὐ τῷ αὐτῷ πνεύματι περιεπατήσαμεν οὐ τοῖς αὐτοῖς ἴχνεσιν',
   'parekalesa Titon kai synapésteila ton adelphon mēti epleonektēsen hymas Titos ou tō autō pneumati periépatēsamen ou tois autois ichnesin',
   '''Same spirit … same steps'' (tō autō pneumati … tois autois ichnesin — the same spirit, the same footsteps). Titus conducted himself exactly as Paul did: no exploitation, no greed, no hidden agenda. Paul and his delegates share one spirit and one pattern of integrity. The accusation of financial scheming collapses under scrutiny.',
   NULL),
  (19, 'Again, think ye that we excuse ourselves unto you? we speak before God in Christ: but we do all things, dearly beloved, for your edifying.',
   'πάλιν δοκεῖτε ὅτι ὑμῖν ἀπολογούμεθα κατενώπιον τοῦ θεοῦ ἐν Χριστῷ λαλοῦμεν τὰ δὲ πάντα ἀγαπητοί ὑπὲρ τῆς ὑμῶν οἰκοδομῆς',
   'palin dokeite hoti hymin apologoumetha katenōpion tou theou en Christō laloumen ta de panta agapētoi hyper tēs hymōn oikodomēs',
   '''Excuse ourselves'' (apologoumetha — defend ourselves). ''Before God in Christ'' — Paul speaks as one accountable to God. ''For your edifying'' (hyper tēs hymōn oikodomēs — for your building up). Everything Paul writes — the fool''s boast, the defense, the irony — serves one purpose: building up the Corinthian church. Edification, not self-vindication, is the goal.',
   NULL),
  (20, 'For I fear, lest, when I come, I shall not find you such as I would, and that I shall be found unto you such as ye would not; lest there be debates, envyings, wraths, strifes, backbitings, whisperings, swellings, tumults:',
   'φοβοῦμαι γὰρ μήπως ἐλθὼν οὐχ οἵους θέλω εὕρω ὑμᾶς κἀγὼ εὑρεθῶ ὑμῖν οἷον οὐ θέλετε μήπως ἔρεις ζῆλοι θυμοί ἐριθεῖαι καταλαλιαί ψιθυρισμοί φυσιώσεις ἀκαταστασίαι',
   'phoboumai gar mēpōs elthōn ouch hoious thelō heurō hymas kagō heurethō hymin hoion ou thelete mēpōs ereis zēloi thymoi eritheiai katalaliai psithyrismoi physiōseis akatastasiai',
   'Eight sins Paul fears finding: (1) debates (ereis — quarrels). (2) envyings (zēloi — jealousies). (3) wraths (thymoi — angry outbursts). (4) strifes (eritheiai — selfish ambitions). (5) backbitings (katalaliai — slanders). (6) whisperings (psithyrismoi — gossip). (7) swellings (physiōseis — inflations of ego, arrogance). (8) tumults (akatastasiai — disorders). This is a catalog of community destruction — the social fragmentation that false teaching and pride produce.',
   NULL),
  (21, 'And lest, when I come again, my God will humble me among you, and that I shall bewail many which have sinned already, and have not repented of the uncleanness and fornication and lasciviousness which they have committed.',
   'μὴ πάλιν ἐλθόντα με ταπεινώσῃ ὁ θεός μου πρὸς ὑμᾶς καὶ πενθήσω πολλοὺς τῶν προημαρτηκότων καὶ μὴ μετανοησάντων ἐπὶ τῇ ἀκαθαρσίᾳ καὶ πορνείᾳ καὶ ἀσελγείᾳ ᾗ ἔπραξαν',
   'mē palin elthonta me tapeinōsē ho theos mou pros hymas kai penthēsō pollous tōn proēmartēkotōn kai mē metanoēsantōn epi tē akatharsia kai porneia kai aselgeia hē epraxan',
   '''Humble me'' (tapeinōsē — bring low). ''Bewail'' (penthēsō — mourn, grieve). ''Sinned already and have not repented'' (proēmartēkotōn kai mē metanoēsantōn — those who sinned previously and did not repent). Three sins: uncleanness (akatharsia — moral impurity), fornication (porneia — sexual immorality), lasciviousness (aselgeia — sensuality, debauchery). Despite the repentance of chapter 7, some in Corinth have continued in sexual sin. Paul approaches with a pastor''s grief, not a judge''s gavel.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 12;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 caught up
  ('ἁρπάζω', 'harpazō', 'G726', 'To seize, snatch away, catch up — a violent, sudden taking. Used for the rapture (1 Thess 4:17), for the Spirit snatching Philip away (Acts 8:39), and here for Paul''s transport to paradise. The passive voice (harpagenta) indicates Paul was seized by divine power, not that he achieved ecstasy through technique.', 1),
  -- v.4 paradise
  ('παράδεισος', 'paradeisos', 'G3857', 'Paradise — from Old Persian paridaida (an enclosed garden, a park). In the LXX, the Garden of Eden (Gen 2:8). In the NT, the abode of the righteous dead (Luke 23:43) and the future dwelling of the redeemed (Rev 2:7). Paul equates paradise with the third heaven — God''s own dwelling place.', 2),
  -- v.7 thorn
  ('σκόλοψ', 'skolops', 'G4647', 'Thorn, stake, splinter — a sharp, pointed instrument that pierces flesh. In the LXX, used for enemies who irritate and harass (Num 33:55, Ezek 28:24). The ''thorn in the flesh'' is deliberately unspecified — its universal applicability is part of its pastoral power. Whatever it was, it was painful, persistent, and purposeful.', 3),
  -- v.9 sufficient
  ('ἀρκέω', 'arkeō', 'G714', 'To be sufficient, to be enough, to satisfy — ''my grace is enough.'' The present tense (arkei) means God''s grace is continuously sufficient — not just in this instance but always. The sufficiency of grace is not occasional but permanent, not partial but total. Grace does not merely supplement weakness; it replaces the need for the thorn''s removal.', 4),
  ('τελειόω', 'teleioō', 'G5048', 'To perfect, to complete, to bring to full expression — from telos (end, goal). God''s power reaches its telos (its intended goal) in human weakness. Weakness is not an obstacle to divine power but the very arena in which divine power achieves its fullest expression. This is the theology of the cross applied to ongoing Christian experience.', 5),
  -- v.9 rest upon / tabernacle
  ('ἐπισκηνόω', 'episkēnoō', 'G1981', 'To spread a tent over, to tabernacle upon — from epi (upon) + skēnoō (to pitch a tent). Found only here in the NT. The Shekinah glory that once hovered over the tabernacle now settles upon the weak believer. Christ''s power does not merely assist Paul but takes up residence upon him, dwelling over his weakness as glory dwelt over the mercy seat.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 12
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 2
    WHEN 2 THEN 4
    WHEN 3 THEN 7
    WHEN 4 THEN 9 WHEN 5 THEN 9 WHEN 6 THEN 9
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.2 third heaven
  (2, 'Acts 7:55-56', 1),
  (2, 'Revelation 4:1-2', 2),
  -- v.4 paradise
  (4, 'Luke 23:43', 3),
  (4, 'Revelation 2:7', 4),
  -- v.7 thorn in the flesh
  (7, 'Numbers 33:55', 5),
  (7, 'Job 2:6-7', 6),
  (7, 'Galatians 4:13-14', 7),
  -- v.8 thrice besought
  (8, 'Matthew 26:39-44', 8),
  -- v.9 grace sufficient / power in weakness
  (9, '2 Corinthians 4:7', 9),
  (9, '1 Corinthians 1:27-29', 10),
  (9, 'Philippians 4:13', 11),
  (9, 'John 1:14', 12),
  -- v.10 when weak then strong
  (10, '2 Corinthians 13:4', 13),
  (10, 'Hebrews 11:34', 14),
  -- v.12 signs of an apostle
  (12, 'Romans 15:18-19', 15),
  (12, 'Hebrews 2:4', 16),
  -- v.14 seek not yours but you
  (14, '1 Corinthians 10:33', 17),
  (14, '1 Thessalonians 2:7-8', 18),
  -- v.15 spend and be spent
  (15, 'Philippians 2:17', 19),
  (15, '2 Timothy 4:6', 20)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 12
  AND v.verse_number = cr.verse_number;
