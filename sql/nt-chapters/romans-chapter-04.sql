-- ═══════════════════════════════════════════════════
-- ROMANS CHAPTER 4 — Abraham: Justified by Faith
-- 25 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Romans 4 is Paul''s great OT proof that justification has always been by faith, not works. He takes the two pillars of Jewish identity — Abraham (the father of the nation) and David (the great king) — and shows that both were justified by faith apart from works. ''What shall we say then that Abraham our father, as pertaining to the flesh, hath found?'' (v.1). ''Abraham believed God, and it was counted unto him for righteousness'' (v.3, quoting Genesis 15:6). This ''counting'' (logizomai) — the key verb of the chapter, used 11 times — proves that righteousness was credited, not earned: ''to him that worketh not, but believeth on him that justifieth the ungodly, his faith is counted for righteousness'' (v.5). David confirms this in Psalm 32: ''Blessed is the man to whom the Lord will not impute sin'' (vv.7-8). Crucially, Abraham was justified BEFORE circumcision (v.10), making him the father of all who believe, circumcised or not (vv.11-12). The promise to Abraham came ''through the righteousness of faith,'' not ''through the law'' (v.13). ''Therefore it is of faith, that it might be by grace; to the end the promise might be sure to all the seed'' (v.16). Abraham''s faith is then described: ''against hope believed in hope'' (v.18), he ''staggered not at the promise of God through unbelief; but was strong in faith, giving glory to God'' (v.20). The chapter closes by applying Abraham''s example to believers: righteousness is ''imputed to us also … if we believe on him that raised up Jesus our Lord from the dead; who was delivered for our offences, and was raised again for our justification'' (vv.24-25).',
  'Abraham Justified by Faith: The OT Proof of Imputed Righteousness',
  'λογίζομαι (logizomai)',
  'To reckon, to count, to credit, to impute — an accounting term meaning to enter on the ledger, to credit to one''s account. Used 11 times in this chapter alone (vv.3, 4, 5, 6, 8, 9, 10, 11, 22, 23, 24). God ''counted'' Abraham''s faith ''for righteousness'' — faith was credited as if it were righteousness. This is the language of imputation: a status granted, not a quality infused.',
  '["Abraham Justified by Faith, Not Works (vv.1-8): What shall we say then that Abraham our father hath found if Abraham were justified by works he hath whereof to glory but not before God for what saith the scripture Abraham believed God and it was counted unto him for righteousness now to him that worketh not but believeth on him that justifieth the ungodly his faith is counted for righteousness even as David also describeth the blessedness of the man unto whom God imputeth righteousness without works","Justified Before Circumcision: Father of All Believers (vv.9-12): Cometh this blessedness then upon the circumcision only or upon the uncircumcision also for we say that faith was reckoned to Abraham for righteousness how was it then reckoned when he was in circumcision or in uncircumcision not in circumcision but in uncircumcision that he might be the father of all them that believe though they be not circumcised","The Promise Through Faith Not Law (vv.13-17): For the promise that he should be the heir of the world was not to Abraham or to his seed through the law but through the righteousness of faith therefore it is of faith that it might be by grace to the end the promise might be sure to all the seed who is the father of us all","Abraham''s Faith: Hoping Against Hope (vv.18-25): Who against hope believed in hope that he might become the father of many nations he staggered not at the promise of God through unbelief but was strong in faith giving glory to God being fully persuaded that what he had promised he was able also to perform and therefore it was imputed to him for righteousness who was delivered for our offences and was raised again for our justification"]'
FROM books b WHERE b.name = 'Romans';

-- Step 2: Insert all 25 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'What shall we say then that Abraham our father, as pertaining to the flesh, hath found?',
   'Τί οὖν ἐροῦμεν Ἀβραὰμ τὸν πατέρα ἡμῶν εὑρηκέναι κατὰ σάρκα',
   'Ti oun eroumen Abraam ton patera hēmōn heurēkenai kata sarka',
   '''Abraham our father'' — the ultimate test case. If justification by faith is true, it must be true of Abraham, the most revered figure in Judaism. ''As pertaining to the flesh'' (kata sarka — according to human effort, by his own works). What did Abraham achieve by his own merit? Paul will show: nothing — his righteousness was a gift.',
   NULL),
  (2, 'For if Abraham were justified by works, he hath whereof to glory; but not before God.',
   'εἰ γὰρ Ἀβραὰμ ἐξ ἔργων ἐδικαιώθη ἔχει καύχημα ἀλλ᾿ οὐ πρὸς τὸν θεόν',
   'ei gar Abraam ex ergōn edikaiōthē echei kauchēma all ou pros ton theon',
   '''If Abraham were justified by works'' — a contrary-to-fact conditional. ''He hath whereof to glory'' (echei kauchēma — he would have a boast). ''But not before God'' — even if Abraham could boast before men, he could never boast before God. This echoes 3:27: boasting is excluded by the principle of faith.',
   NULL),
  (3, 'For what saith the scripture? Abraham believed God, and it was counted unto him for righteousness.',
   'τί γὰρ ἡ γραφὴ λέγει ἐπίστευσεν δὲ Ἀβραὰμ τῷ θεῷ καὶ ἐλογίσθη αὐτῷ εἰς δικαιοσύνην',
   'ti gar hē graphē legei episteusen de Abraam tō theō kai elogisthē autō eis dikaiosynēn',
   '''What saith the scripture?'' — Paul appeals to the highest authority: God''s own written word. Quoting Genesis 15:6, the foundational text for justification by faith. ''Believed'' (episteusen — trusted, had faith in; Abraham believed God''s promise of innumerable offspring). ''Counted'' (elogisthē — was reckoned, credited; a bookkeeping term). ''For righteousness'' (eis dikaiosynēn — as righteousness, unto the account of righteousness). Abraham''s faith was credited to his account as if it were righteousness.',
   'Genesis 15:6 is the most cited OT verse in the justification debate. Paul, James (2:23), and the author of Galatians (3:6) all appeal to it. The key insight is the word elogisthē (was counted): righteousness was not something Abraham achieved but something God credited to him on the basis of faith. This is imputation — the transfer of a status, not the infusion of a quality.'),
  (4, 'Now to him that worketh is the reward not reckoned of grace, but of debt.',
   'τῷ δὲ ἐργαζομένῳ ὁ μισθὸς οὐ λογίζεται κατὰ χάριν ἀλλὰ κατὰ ὀφείλημα',
   'tō de ergazomenō ho misthos ou logizetai kata charin alla kata opheilēma',
   '''Him that worketh'' (tō ergazomenō — the worker, the wage-earner). ''Reward'' (misthos — wage, payment). ''Not reckoned of grace but of debt'' (ou logizetai kata charin alla kata opheilēma — not credited as a favour but as an obligation). Paul uses an everyday analogy: when you work, your employer owes you wages — it''s not a gift. If salvation were by works, God would owe it. But God owes no one; therefore salvation must be by grace.',
   NULL),
  (5, 'But to him that worketh not, but believeth on him that justifieth the ungodly, his faith is counted for righteousness.',
   'τῷ δὲ μὴ ἐργαζομένῳ πιστεύοντι δὲ ἐπὶ τὸν δικαιοῦντα τὸν ἀσεβῆ λογίζεται ἡ πίστις αὐτοῦ εἰς δικαιοσύνην',
   'tō de mē ergazomenō pisteuonti de epi ton dikaiounta ton asebē logizetai hē pistis autou eis dikaiosynēn',
   '''Worketh not'' (mē ergazomenō — the non-worker; the one who brings no merit). ''Believeth on him that justifieth the ungodly'' (pisteuonti epi ton dikaiounta ton asebē — trusts in the one who declares righteous the ungodly person). ''Justifieth the ungodly'' — the most shocking phrase in Romans: God justifies the asebēs (the impious, the ungodly). In human courts, acquitting the guilty is unjust (Proverbs 17:15); but God can do it because Christ bore the penalty.',
   'This is the purest expression of justification by faith in all of Scripture. The person justified is described as (1) not working, (2) believing, and (3) ungodly. God does not justify the righteous (they need no justification) or the self-improved (that would be works) but the UNGODLY (asebēs) — the very word used in 1:18 for those under wrath. The gospel does not help good people become better; it declares guilty sinners righteous on the basis of faith in Christ''s finished work.'),
  (6, 'Even as David also describeth the blessedness of the man, unto whom God imputeth righteousness without works,',
   'καθάπερ καὶ Δαυὶδ λέγει τὸν μακαρισμὸν τοῦ ἀνθρώπου ᾧ ὁ θεὸς λογίζεται δικαιοσύνην χωρὶς ἔργων',
   'kathaper kai Dauid legei ton makarismon tou anthrōpou hō ho theos logizetai dikaiosynēn chōris ergōn',
   '''David also'' — Paul adds a second OT witness. ''Blessedness'' (makarismon — the state of being blessed, pronounced happy). ''Imputeth righteousness without works'' (logizetai dikaiosynēn chōris ergōn — credits righteousness apart from works). David, like Abraham, experienced imputed righteousness — forgiveness without merit. David wrote Psalm 32 after his sins of adultery and murder, when he experienced God''s free pardon.',
   NULL),
  (7, 'Saying, Blessed are they whose iniquities are forgiven, and whose sins are covered.',
   'μακάριοι ὧν ἀφέθησαν αἱ ἀνομίαι καὶ ὧν ἐπεκαλύφθησαν αἱ ἁμαρτίαι',
   'makarioi hōn aphethēsan hai anomiai kai hōn epekalyphthēsan hai hamartiai',
   'Quoting Psalm 32:1. ''Forgiven'' (aphethēsan — sent away, released; the sins are dismissed). ''Covered'' (epekalyphthēsan — concealed, hidden from view; God no longer sees them). Two metaphors for the same reality: sins are both sent away and covered over. This is the negative side of justification — the removal of guilt.',
   NULL),
  (8, 'Blessed is the man to whom the Lord will not impute sin.',
   'μακάριος ἀνὴρ ᾧ οὐ μὴ λογίσηται κύριος ἁμαρτίαν',
   'makarios anēr hō ou mē logisētai kyrios hamartian',
   'Quoting Psalm 32:2. ''Will not impute'' (ou mē logisētai — will by no means reckon; the double negative intensifies: God will NEVER credit sin to this person''s account). This is the flip side of v.3: just as faith is counted FOR righteousness, sin is NOT counted AGAINST the believer. Justification involves both the positive crediting of righteousness and the negative non-imputation of sin.',
   NULL),
  (9, 'Cometh this blessedness then upon the circumcision only, or upon the uncircumcision also? for we say that faith was reckoned to Abraham for righteousness.',
   'ὁ μακαρισμὸς οὖν οὗτος ἐπὶ τὴν περιτομὴν ἢ καὶ ἐπὶ τὴν ἀκροβυστίαν λέγομεν γὰρ ὅτι ἐλογίσθη τῷ Ἀβραὰμ ἡ πίστις εἰς δικαιοσύνην',
   'ho makarismos oun houtos epi tēn peritomēn ē kai epi tēn akrobystian legomen gar hoti elogisthē tō Abraam hē pistis eis dikaiosynēn',
   'Paul now asks the critical question: is this blessedness only for the circumcised (Jews) or also for the uncircumcised (Gentiles)? The answer hinges on the chronology of Abraham''s justification — when exactly was he justified?',
   NULL),
  (10, 'How was it then reckoned? when he was in circumcision, or in uncircumcision? Not in circumcision, but in uncircumcision.',
   'πῶς οὖν ἐλογίσθη ἐν περιτομῇ ὄντι ἢ ἐν ἀκροβυστίᾳ οὐκ ἐν περιτομῇ ἀλλ᾿ ἐν ἀκροβυστίᾳ',
   'pōs oun elogisthē en peritomē onti ē en akrobystia ouk en peritomē all en akrobystia',
   'The decisive argument: Genesis 15:6 (justification) precedes Genesis 17 (circumcision) by at least 14 years. Abraham was justified while still uncircumcised. Therefore circumcision cannot be a prerequisite for justification. The chronological argument is irrefutable from the OT text itself.',
   NULL),
  (11, 'And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also:',
   'καὶ σημεῖον ἔλαβεν περιτομῆς σφραγῖδα τῆς δικαιοσύνης τῆς πίστεως τῆς ἐν τῇ ἀκροβυστίᾳ εἰς τὸ εἶναι αὐτὸν πατέρα πάντων τῶν πιστευόντων δι᾿ ἀκροβυστίας εἰς τὸ λογισθῆναι καὶ αὐτοῖς τὴν δικαιοσύνην',
   'kai sēmeion elaben peritomēs sphragida tēs dikaiosynēs tēs pisteōs tēs en tē akrobystia eis to einai auton patera pantōn tōn pisteuontōn di akrobystias eis to logisthēnai kai autois tēn dikaiosynēn',
   '''Sign'' (sēmeion — an outward indicator). ''Seal'' (sphragida — a confirmation, authentication). Circumcision was a SIGN pointing to faith-righteousness already received, and a SEAL confirming it — not the means of obtaining it. ''Father of all them that believe'' — Abraham''s fatherhood is defined by faith, not by flesh. Uncircumcised believers are Abraham''s true children.',
   'This verse redefines Abraham''s fatherhood in radical terms. Abraham is not primarily the father of ethnic Israel but ''the father of all them that believe'' — circumcised or not. Circumcision came AFTER justification as a sign and seal, not as a cause. This means that Gentile believers, who share Abraham''s faith without his circumcision, are fully his children and heirs of the promise.'),
  (12, 'And the father of circumcision to them who are not of the circumcision only, but who also walk in the steps of that faith of our father Abraham, which he had being yet uncircumcised.',
   'καὶ πατέρα περιτομῆς τοῖς οὐκ ἐκ περιτομῆς μόνον ἀλλὰ καὶ τοῖς στοιχοῦσιν τοῖς ἴχνεσιν τῆς ἐν τῇ ἀκροβυστίᾳ πίστεως τοῦ πατρὸς ἡμῶν Ἀβραάμ',
   'kai patera peritomēs tois ouk ek peritomēs monon alla kai tois stoichousin tois ichnesin tēs en tē akrobystia pisteōs tou patros hēmōn Abraam',
   '''Walk in the steps'' (stoichousin tois ichnesin — march in line with the footprints; a military metaphor: following in Abraham''s track). Abraham is the father of the circumcised too, but only of those who also share his faith. Circumcision alone, without faith, does not make one a child of Abraham. Faith is the defining characteristic.',
   NULL),
  (13, 'For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith.',
   'οὐ γὰρ διὰ νόμου ἡ ἐπαγγελία τῷ Ἀβραὰμ ἢ τῷ σπέρματι αὐτοῦ τὸ κληρονόμον αὐτὸν εἶναι τοῦ κόσμου ἀλλὰ διὰ δικαιοσύνης πίστεως',
   'ou gar dia nomou hē epangelia tō Abraam ē tō spermati autou to klēronomon auton einai tou kosmou alla dia dikaiosynēs pisteōs',
   '''Heir of the world'' (klēronomon tou kosmou — heir of the cosmos; a rabbinic expansion of the land promise, recognizing that Abraham''s inheritance ultimately encompasses the whole world). ''Not through the law'' — the law came 430 years after Abraham (Galatians 3:17); the promise preceded and superseded the law. ''Through the righteousness of faith'' — faith-righteousness is the channel of the promise.',
   NULL),
  (14, 'For if they which are of the law be heirs, faith is made void, and the promise made of none effect:',
   'εἰ γὰρ οἱ ἐκ νόμου κληρονόμοι κεκένωται ἡ πίστις καὶ κατήργηται ἡ ἐπαγγελία',
   'ei gar hoi ek nomou klēronomoi kekenōtai hē pistis kai katērgētai hē epangelia',
   '''Made void'' (kekenōtai — emptied, rendered hollow). ''Made of none effect'' (katērgētai — nullified, abolished). If inheritance depends on law-keeping, then faith is pointless and the promise is destroyed. The law and the promise are incompatible as bases of inheritance because the law condemns (v.15) while the promise gives freely.',
   NULL),
  (15, 'Because the law worketh wrath: for where no law is, there is no transgression.',
   'ὁ γὰρ νόμος ὀργὴν κατεργάζεται οὗ γὰρ οὐκ ἔστιν νόμος οὐδὲ παράβασις',
   'ho gar nomos orgēn katergazetai hou gar ouk estin nomos oude parabasis',
   '''The law worketh wrath'' (nomos orgēn katergazetai — the law produces wrath, not salvation). ''Where no law is, there is no transgression'' (parabasis — stepping across a boundary; without a defined boundary, there can be no stepping across it). The law does not produce righteousness; it produces the knowledge of sin (3:20) and therefore the experience of wrath. This is why the promise must be through faith, not law.',
   NULL),
  (16, 'Therefore it is of faith, that it might be by grace; to the end the promise might be sure to all the seed; not to that only which is of the law, but to that also which is of the faith of Abraham; who is the father of us all,',
   'διὰ τοῦτο ἐκ πίστεως ἵνα κατὰ χάριν εἰς τὸ εἶναι βεβαίαν τὴν ἐπαγγελίαν παντὶ τῷ σπέρματι οὐ τῷ ἐκ τοῦ νόμου μόνον ἀλλὰ καὶ τῷ ἐκ πίστεως Ἀβραάμ ὅς ἐστιν πατὴρ πάντων ἡμῶν',
   'dia touto ek pisteōs hina kata charin eis to einai bebaian tēn epangelian panti tō spermati ou tō ek tou nomou monon alla kai tō ek pisteōs Abraam hos estin patēr pantōn hēmōn',
   '''Of faith … by grace'' (ek pisteōs … kata charin — faith and grace are inseparable partners). ''Sure'' (bebaian — certain, guaranteed, legally secure). ''To all the seed'' — the promise is secure precisely because it rests on grace through faith, not on human performance. If it depended on works, it would be uncertain (who keeps the law perfectly?). ''Father of us all'' — Abraham is the spiritual father of every believer, Jew and Gentile.',
   'This verse reveals why God chose faith as the instrument of justification: ''that it might be by grace.'' Only faith preserves the character of the promise as a free gift. Works would transform grace into debt (v.4). Faith, by its very nature, receives rather than achieves — and therefore keeps the promise secure (bebaian) for ALL the seed, not just those under the law. Grace, faith, and universality are all interconnected.'),
  (17, '(As it is written, I have made thee a father of many nations,) before him whom he believed, even God, who quickeneth the dead, and calleth those things which be not as though they were.',
   'καθὼς γέγραπται ὅτι πατέρα πολλῶν ἐθνῶν τέθεικά σε κατέναντι οὗ ἐπίστευσεν θεοῦ τοῦ ζωοποιοῦντος τοὺς νεκροὺς καὶ καλοῦντος τὰ μὴ ὄντα ὡς ὄντα',
   'kathōs gegraptai hoti patera pollōn ethnōn tetheika se katenanti hou episteusen theou tou zōopoiountos tous nekrous kai kalountos ta mē onta hōs onta',
   'Quoting Genesis 17:5. ''Father of many nations'' (patera pollōn ethnōn — the promise was always multi-national). ''Quickeneth the dead'' (zōopoiountos tous nekrous — gives life to the dead; Abraham''s dead body and Sarah''s dead womb needed resurrection power). ''Calleth those things which be not as though they were'' (kalountos ta mē onta hōs onta — summons into existence things that have no existence). Abraham''s faith rested on a God whose power extends to creation ex nihilo and resurrection.',
   NULL),
  (18, 'Who against hope believed in hope, that he might become the father of many nations, according to that which was spoken, So shall thy seed be.',
   'ὃς παρ᾿ ἐλπίδα ἐπ᾿ ἐλπίδι ἐπίστευσεν εἰς τὸ γενέσθαι αὐτὸν πατέρα πολλῶν ἐθνῶν κατὰ τὸ εἰρημένον οὕτως ἔσται τὸ σπέρμα σου',
   'hos par elpida ep elpidi episteusen eis to genesthai auton patera pollōn ethnōn kata to eirēmenon houtōs estai to sperma sou',
   '''Against hope'' (par'' elpida — beyond hope, contrary to all human expectation). ''Believed in hope'' (ep'' elpidi episteusen — believed on the basis of hope; not natural hope but hope grounded in God''s promise). The paradox: when all natural hope was gone, Abraham found supernatural hope in God''s word. ''So shall thy seed be'' — quoting Genesis 15:5: as innumerable as the stars.',
   NULL),
  (19, 'And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb:',
   'καὶ μὴ ἀσθενήσας τῇ πίστει οὐ κατενόησεν τὸ ἑαυτοῦ σῶμα ἤδη νενεκρωμένον ἑκατονταέτης που ὑπάρχων καὶ τὴν νέκρωσιν τῆς μήτρας Σάρρας',
   'kai mē asthenēsas tē pistei ou katenoēsen to heautou sōma ēdē nenekrōmenon hekatontaetēs pou hyparchōn kai tēn nekrōsin tēs mētras Sarras',
   '''Not weak in faith'' (mē asthenēsas tē pistei — did not become weak in his faith). ''Considered not'' (ou katenoēsen — did not fix his attention on; he knew the facts but did not let them dominate). ''Dead'' (nenekrōmenon — having been put to death, rendered lifeless; perfect participle: the condition was established). ''Deadness'' (nekrōsin — the state of being dead). Abraham faced two dead things: his own body (~100 years old) and Sarah''s womb. Faith looked past the dead circumstances to the living God.',
   NULL),
  (20, 'He staggered not at the promise of God through unbelief; but was strong in faith, giving glory to God;',
   'εἰς δὲ τὴν ἐπαγγελίαν τοῦ θεοῦ οὐ διεκρίθη τῇ ἀπιστίᾳ ἀλλ᾿ ἐνεδυναμώθη τῇ πίστει δοὺς δόξαν τῷ θεῷ',
   'eis de tēn epangelian tou theou ou diekrithē tē apistia all enedynamōthē tē pistei dous doxan tō theō',
   '''Staggered not'' (ou diekrithē — was not divided in mind, did not waver; from dia + krinō: he did not judge between faith and doubt). ''Strong in faith'' (enedynamōthē tē pistei — was empowered by faith; passive: God strengthened his faith). ''Giving glory to God'' (dous doxan tō theō — by believing God''s promise, Abraham glorified God). Faith is the highest form of worship: it takes God at his word and thereby honours him.',
   NULL),
  (21, 'And being fully persuaded that, what he had promised, he was able also to perform.',
   'καὶ πληροφορηθεὶς ὅτι ὃ ἐπήγγελται δυνατός ἐστιν καὶ ποιῆσαι',
   'kai plērophorētheis hoti ho epēngeltai dynatos estin kai poiēsai',
   '''Fully persuaded'' (plērophorētheis — completely convinced, carried to full assurance). ''Able to perform'' (dynatos estin kai poiēsai — he is powerful to do it). The content of Abraham''s faith was not a feeling but a conviction about God''s character: God is able. Faith rests on God''s power, not human probability.',
   NULL),
  (22, 'And therefore it was imputed to him for righteousness.',
   'διὸ καὶ ἐλογίσθη αὐτῷ εἰς δικαιοσύνην',
   'dio kai elogisthē autō eis dikaiosynēn',
   '''Therefore'' (dio — for this reason; because of the quality of his faith). ''Imputed'' (elogisthē — was credited). The conclusion: Abraham''s faith — not his works, not his circumcision, not his law-keeping — was the basis on which God credited righteousness to his account.',
   NULL),
  (23, 'Now it was not written for his sake alone, that it was imputed to him;',
   'οὐκ ἐγράφη δὲ δι᾿ αὐτὸν μόνον ὅτι ἐλογίσθη αὐτῷ',
   'ouk egraphē de di auton monon hoti elogisthē autō',
   '''Not written for his sake alone'' — the Genesis narrative was not merely historical record but prophetic paradigm. It was written for future generations of believers. The OT is not just Israel''s story but every believer''s story.',
   NULL),
  (24, 'But for us also, to whom it shall be imputed, if we believe on him that raised up Jesus our Lord from the dead;',
   'ἀλλὰ καὶ δι᾿ ἡμᾶς οἷς μέλλει λογίζεσθαι τοῖς πιστεύουσιν ἐπὶ τὸν ἐγείραντα Ἰησοῦν τὸν κύριον ἡμῶν ἐκ νεκρῶν',
   'alla kai di hēmas hois mellei logizesthai tois pisteuousin epi ton egeiranta Iēsoun ton kyrion hēmōn ek nekrōn',
   '''For us also'' — the application. Abraham''s story is our story. ''Imputed'' — the same crediting of righteousness applies to NT believers. ''Him that raised up Jesus'' — the object of our faith parallels Abraham''s: Abraham believed in a God who gives life to the dead (v.17); we believe in the God who raised Jesus from the dead. The resurrection is the ground of our justification.',
   NULL),
  (25, 'Who was delivered for our offences, and was raised again for our justification.',
   'ὃς παρεδόθη διὰ τὰ παραπτώματα ἡμῶν καὶ ἠγέρθη διὰ τὴν δικαίωσιν ἡμῶν',
   'hos paredothē dia ta paraptōmata hēmōn kai ēgerthē dia tēn dikaiōsin hēmōn',
   '''Delivered'' (paredothē — handed over; the same verb as 1:24, 26, 28, but here God hands over his own Son, not sinners to their sins). ''For our offences'' (dia ta paraptōmata hēmōn — because of our trespasses; his death was caused by our sins). ''Raised for our justification'' (ēgerthē dia tēn dikaiōsin hēmōn — raised because of our justification). The death of Christ deals with the penalty of sin; the resurrection of Christ confirms the acceptance of the payment and secures our justified status.',
   'This verse is a magnificent summary of the gospel in two clauses. Christ''s death and resurrection are the two halves of one saving event: he was ''delivered for our offences'' (the cross pays for sin) and ''raised for our justification'' (the resurrection confirms that the payment was accepted). The resurrection is not merely the sequel to the cross but its vindication: if Christ had not been raised, there would be no assurance that his death accomplished anything. The empty tomb is God''s receipt for the payment of sin.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Romans' AND c.chapter_number = 4;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 counted/reckoned
  ('λογίζομαι', 'logizomai', 'G3049', 'To reckon, to count, to credit, to impute — an accounting term for entering a sum in the ledger. Used 11 times in Romans 4 (vv.3-11, 22-24). When God ''counted'' Abraham''s faith as righteousness, he credited to Abraham''s account a status Abraham had not earned. This is the language of imputation: a legal transfer of status based on the decision of the one doing the reckoning, not the merit of the one receiving it.', 1),
  -- v.5 justifieth the ungodly
  ('ἀσεβής', 'asebēs', 'G765', 'Ungodly, impious — one who lacks reverence for God, a person without piety. This is the same word used in 1:18 for those under God''s wrath. God ''justifies the ungodly'' — not the deserving, not the improved, not the nearly righteous, but the actively impious. This is the scandal and the glory of the gospel: justification comes to the undeserving by grace through faith.', 2),
  -- v.11 seal
  ('σφραγίς', 'sphragis', 'G4973', 'Seal — a mark of authentication, ownership, and security. Circumcision was the ''seal'' (sphragida) of the righteousness Abraham already had by faith. A seal confirms something that already exists; it does not create it. This establishes the proper order: faith produces righteousness, circumcision confirms it — not the reverse.', 3),
  -- v.17 quickeneth the dead
  ('ζωοποιέω', 'zōopoieō', 'G2227', 'To give life, to make alive, to quicken — from zōē (life) + poieō (to make). Abraham believed in a God whose power extends to giving life to the dead. This characterized both Abraham''s situation (dead body, dead womb → Isaac) and the believer''s situation (Christ raised from the dead, v.24). The God of justification is the God of resurrection.', 4),
  -- v.25 justification
  ('δικαίωσις', 'dikaiōsis', 'G1347', 'Justification, acquittal, the act of declaring righteous — the result of the divine verdict. Christ was raised ''for our justification'' (dia tēn dikaiōsin hēmōn): the resurrection confirms that God accepted Christ''s sacrifice and that the believers'' acquittal is secured. Without the resurrection, there would be no assurance that the death of Christ accomplished its purpose.', 5)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Romans' AND c.chapter_number = 4
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 3
    WHEN 2 THEN 5
    WHEN 3 THEN 11
    WHEN 4 THEN 17
    WHEN 5 THEN 25
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.3 Abraham believed God
  (3, 'Genesis 15:6', 1),
  (3, 'Galatians 3:6', 2),
  (3, 'James 2:23', 3),
  -- v.5 justifieth the ungodly
  (5, 'Romans 5:6', 4),
  (5, 'Luke 18:13-14', 5),
  -- v.7-8 David - blessed whose sins forgiven
  (7, 'Psalm 32:1-2', 6),
  -- v.10 justified before circumcision
  (10, 'Genesis 15:6', 7),
  (10, 'Genesis 17:10-11', 8),
  -- v.11 father of all believers
  (11, 'Galatians 3:7', 9),
  (11, 'Galatians 3:29', 10),
  -- v.13 heir of the world
  (13, 'Genesis 12:2-3', 11),
  (13, 'Galatians 3:16-18', 12),
  -- v.15 law worketh wrath
  (15, 'Romans 3:20', 13),
  (15, 'Romans 5:20', 14),
  (15, 'Romans 7:7-11', 15),
  -- v.16 of faith that it might be by grace
  (16, 'Ephesians 2:8-9', 16),
  -- v.17 father of many nations
  (17, 'Genesis 17:5', 17),
  -- v.18 so shall thy seed be
  (18, 'Genesis 15:5', 18),
  -- v.20 strong in faith
  (20, 'Hebrews 11:11-12', 19),
  -- v.25 delivered and raised
  (25, 'Isaiah 53:5-6', 20),
  (25, '1 Corinthians 15:17', 21),
  (25, '1 Peter 1:3', 22)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Romans' AND c.chapter_number = 4
  AND v.verse_number = cr.verse_number;
