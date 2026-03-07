-- ═══════════════════════════════════════════════════
-- 1 CORINTHIANS CHAPTER 2 — The Spirit Reveals God's Wisdom
-- 16 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 2,
  '1 Corinthians 2 continues the contrast between human and divine wisdom. Paul recalls his own arrival in Corinth: ''I came not with excellency of speech or of wisdom'' but determined to know ''nothing among you, save Jesus Christ, and him crucified'' (vv.1-2). He came ''in weakness, and in fear, and in much trembling'' (v.3), relying not on ''enticing words of man''s wisdom'' but on ''demonstration of the Spirit and of power'' (v.4), so that their faith would rest on God''s power, not human wisdom (v.5). Yet Paul does speak wisdom — ''the wisdom of God in a mystery, even the hidden wisdom, which God ordained before the world unto our glory'' (v.7). This wisdom is beyond human perception: ''Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which God hath prepared for them that love him'' (v.9). ''But God hath revealed them unto us by his Spirit'' (v.10). The Spirit alone searches ''the deep things of God'' (v.10) and communicates them to believers. The ''natural man'' (psychikos anthrōpos) cannot receive spiritual things because ''they are spiritually discerned'' (v.14). But ''he that is spiritual judgeth all things'' (v.15). The chapter closes with a stunning claim: ''we have the mind of Christ'' (v.16).',
  'Paul''s Preaching, God''s Hidden Wisdom, and the Spirit''s Revelation',
  'πνεῦμα (pneuma)',
  'Spirit — the Holy Spirit is mentioned ten times in this chapter (vv.4, 10[x2], 11[x2], 12, 13, 14). The Spirit is the one who searches God''s depths, reveals hidden wisdom, and enables spiritual discernment. Without the Spirit, divine truth is inaccessible; with the Spirit, believers have ''the mind of Christ.'' The Spirit bridges the infinite gap between God''s wisdom and human understanding.',
  '["Paul''s Deliberate Weakness in Preaching (vv.1-5): And I brethren when I came to you came not with excellency of speech or of wisdom declaring unto you the testimony of God. For I determined not to know any thing among you save Jesus Christ and him crucified. And my speech and my preaching was not with enticing words of man''s wisdom but in demonstration of the Spirit and of power that your faith should not stand in the wisdom of men but in the power of God","God''s Hidden Wisdom Revealed by the Spirit (vv.6-10): Howbeit we speak wisdom among them that are perfect yet not the wisdom of this world. But we speak the wisdom of God in a mystery even the hidden wisdom which God ordained before the world unto our glory. Eye hath not seen nor ear heard neither have entered into the heart of man the things which God hath prepared for them that love him. But God hath revealed them unto us by his Spirit for the Spirit searcheth all things yea the deep things of God","The Spirit Teaches Spiritual Things (vv.11-13): For what man knoweth the things of a man save the spirit of man which is in him even so the things of God knoweth no man but the Spirit of God. Now we have received not the spirit of the world but the spirit which is of God that we might know the things that are freely given to us of God. Which things also we speak not in the words which man''s wisdom teacheth but which the Holy Ghost teacheth comparing spiritual things with spiritual","The Natural Man and the Spiritual Man (vv.14-16): But the natural man receiveth not the things of the Spirit of God for they are foolishness unto him neither can he know them because they are spiritually discerned. But he that is spiritual judgeth all things yet he himself is judged of no man. For who hath known the mind of the Lord that he may instruct him? But we have the mind of Christ"]'
FROM books b WHERE b.name = '1 Corinthians';

-- Step 2: Insert all 16 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'And I, brethren, when I came to you, came not with excellency of speech or of wisdom, declaring unto you the testimony of God.',
   'κἀγὼ ἐλθὼν πρὸς ὑμᾶς ἀδελφοί ἦλθον οὐ καθ᾿ ὑπεροχὴν λόγου ἢ σοφίας καταγγέλλων ὑμῖν τὸ μαρτύριον τοῦ θεοῦ',
   'kagō elthōn pros hymas adelphoi ēlthon ou kath hyperochēn logou ē sophias katangellōn hymin to martyrion tou theou',
   '''Excellency'' (hyperochēn — superiority, eminence; Paul did not come as a superior rhetorician). ''Speech'' (logou — eloquence, verbal artistry). ''Wisdom'' (sophias — philosophical sophistication). ''Testimony of God'' (martyrion tou theou — the witness concerning God). Paul deliberately avoided the two things Corinth valued most: eloquence and philosophy.',
   NULL),
  (2, 'For I determined not to know any thing among you, save Jesus Christ, and him crucified.',
   'οὐ γὰρ ἔκρινα τοῦ εἰδέναι τι ἐν ὑμῖν εἰ μὴ Ἰησοῦν Χριστὸν καὶ τοῦτον ἐσταυρωμένον',
   'ou gar ekrina tou eidenai ti en hymin ei mē Iēsoun Christon kai touton estaurōmenon',
   '''Determined'' (ekrina — decided, resolved; a deliberate choice). ''Not to know anything'' — Paul restricted his message to one subject. ''Jesus Christ, and him crucified'' (Iēsoun Christon kai touton estaurōmenon — the perfect participle again: permanently crucified). This was a strategic decision, not intellectual limitation. In Athens, Paul reasoned philosophically (Acts 17); in Corinth, he resolved to be purely cross-centred.',
   'This verse reveals Paul''s preaching strategy in Corinth. He ''determined'' (ekrina — made a deliberate judgment) to restrict his message to Christ crucified. This does not mean Paul was anti-intellectual or that he never discussed anything else. Rather, the cross was the organising centre from which everything else radiated. In a city obsessed with rhetoric and wisdom, Paul chose to let the cross be its own power rather than dress it in philosophical clothing.'),
  (3, 'And I was with you in weakness, and in fear, and in much trembling.',
   'κἀγὼ ἐν ἀσθενείᾳ καὶ ἐν φόβῳ καὶ ἐν τρόμῳ πολλῷ ἐγενόμην πρὸς ὑμᾶς',
   'kagō en astheneia kai en phobō kai en tromō pollō egenomēn pros hymas',
   '''Weakness'' (astheneia — frailty, lack of impressive power). ''Fear'' (phobō — anxiety, apprehension). ''Much trembling'' (tromō pollō — great shaking). Paul''s physical presence was unimpressive (cf. 2 Corinthians 10:10). His weakness was not a hindrance but a vehicle for God''s power (cf. 2 Corinthians 12:9-10).',
   NULL),
  (4, 'And my speech and my preaching was not with enticing words of man''s wisdom, but in demonstration of the Spirit and of power:',
   'καὶ ὁ λόγος μου καὶ τὸ κήρυγμά μου οὐκ ἐν πειθοῖς ἀνθρωπίνης σοφίας λόγοις ἀλλ᾿ ἐν ἀποδείξει πνεύματος καὶ δυνάμεως',
   'kai ho logos mou kai to kērygma mou ouk en peithois anthrōpinēs sophias logois all en apodeixei pneumatos kai dynameōs',
   '''Enticing words'' (peithois logois — persuasive rhetoric; words designed to charm). ''Demonstration'' (apodeixei — proof, evidence; a term from rhetoric meaning irrefutable proof). ''Of the Spirit and of power'' — the Spirit provides the real proof, not human eloquence. The irony: Paul uses the rhetoric term (apodeixis) but fills it with non-rhetorical content (Spirit and power).',
   NULL),
  (5, 'That your faith should not stand in the wisdom of men, but in the power of God.',
   'ἵνα ἡ πίστις ὑμῶν μὴ ᾖ ἐν σοφίᾳ ἀνθρώπων ἀλλ᾿ ἐν δυνάμει θεοῦ',
   'hina hē pistis hymōn mē ē en sophia anthrōpōn all en dynamei theou',
   '''That'' (hina — purpose clause: Paul''s methodology served a theological purpose). ''Stand in'' (ē en — rest upon, be founded on). Faith that rests on human wisdom is fragile; faith that rests on God''s power is unshakeable. The foundation determines the durability.',
   'This verse states the purpose behind Paul''s deliberate simplicity (vv.1-4). If Paul had converted the Corinthians through brilliant rhetoric, their faith would have rested on his eloquence — and would collapse when a more impressive speaker arrived. By relying on the Spirit''s power rather than rhetorical skill, Paul ensured their faith was grounded in God''s power. This principle is permanent: faith must always rest on divine power, not human persuasion.'),
  (6, 'Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought:',
   'σοφίαν δὲ λαλοῦμεν ἐν τοῖς τελείοις σοφίαν δὲ οὐ τοῦ αἰῶνος τούτου οὐδὲ τῶν ἀρχόντων τοῦ αἰῶνος τούτου τῶν καταργουμένων',
   'sophian de laloumen en tois teleiois sophian de ou tou aiōnos toutou oude tōn archontōn tou aiōnos toutou tōn katargoumenōn',
   '''We speak wisdom'' — Paul does have wisdom to offer, but it is not the world''s kind. ''Perfect'' (teleiois — mature, complete; not sinless perfection but spiritual maturity). ''Princes of this world'' (archontōn — rulers; possibly human authorities, possibly demonic powers, or both). ''Come to nought'' (katargoumenōn — being made ineffective, being abolished). The world''s rulers and their wisdom are temporary; God''s wisdom is eternal.',
   NULL),
  (7, 'But we speak the wisdom of God in a mystery, even the hidden wisdom, which God ordained before the world unto our glory:',
   'ἀλλὰ λαλοῦμεν θεοῦ σοφίαν ἐν μυστηρίῳ τὴν ἀποκεκρυμμένην ἣν προώρισεν ὁ θεὸς πρὸ τῶν αἰώνων εἰς δόξαν ἡμῶν',
   'alla laloumen theou sophian en mystēriō tēn apokekrymmenēn hēn proōrisen ho theos pro tōn aiōnōn eis doxan hēmōn',
   '''Wisdom of God in a mystery'' (en mystēriō — in the form of a revealed secret). ''Hidden'' (apokekrymmenēn — concealed, kept secret; perfect participle: long hidden but now revealed). ''Ordained before the world'' (proōrisen pro tōn aiōnōn — predetermined before the ages). ''Unto our glory'' (eis doxan hēmōn — destined for our glorification). God''s saving plan was conceived in eternity and destined for the believers'' glory.',
   'This verse reveals the eternal dimension of God''s wisdom. The gospel is not a recent invention or an emergency plan but a mystery ''ordained before the world'' — predetermined in eternity past. The purpose is breathtaking: ''unto our glory.'' God''s eternal plan has as its goal the glorification of believers. This connects to Romans 8:29-30: predestined, called, justified, glorified. The cross is not God''s reaction to human sin but his eternal strategy for human glory.'),
  (8, 'Which none of the princes of this world knew: for had they known it, they would not have crucified the Lord of glory.',
   'ἣν οὐδεὶς τῶν ἀρχόντων τοῦ αἰῶνος τούτου ἔγνωκεν εἰ γὰρ ἔγνωσαν οὐκ ἂν τὸν κύριον τῆς δόξης ἐσταύρωσαν',
   'hēn oudeis tōn archontōn tou aiōnos toutou egnōken ei gar egnōsan ouk an ton kyrion tēs doxēs estaurōsan',
   '''None of the princes knew'' — the rulers (whether Pilate, Caiaphas, or demonic powers) were ignorant of God''s hidden plan. ''Lord of glory'' (ton kyrion tēs doxēs — a magnificent title: the one to whom all glory belongs). ''Would not have crucified'' — the cross was the ultimate irony: in killing the Lord of glory, the rulers accomplished the very plan that would destroy their own power.',
   'The title ''Lord of glory'' applied to Christ is one of the highest christological statements in the NT. It places Jesus on the level of Yahweh, to whom ''glory'' supremely belongs (cf. Psalm 24:7-10). The irony of the cross is that the rulers of this age crucified the very one whose death would overthrow them. Had they known God''s hidden wisdom, they would never have carried out the crucifixion — which was the very means of their defeat.'),
  (9, 'But as it is written, Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which God hath prepared for them that love him.',
   'ἀλλὰ καθὼς γέγραπται ἃ ὀφθαλμὸς οὐκ εἶδεν καὶ οὖς οὐκ ἤκουσεν καὶ ἐπὶ καρδίαν ἀνθρώπου οὐκ ἀνέβη ἃ ἡτοίμασεν ὁ θεὸς τοῖς ἀγαπῶσιν αὐτόν',
   'alla kathōs gegraptai ha ophthalmos ouk eiden kai ous ouk ēkousen kai epi kardian anthrōpou ouk anebē ha hētoimasen ho theos tois agapōsin auton',
   'Drawing from Isaiah 64:4 and Isaiah 65:17. ''Eye hath not seen'' — beyond visual perception. ''Ear heard'' — beyond auditory perception. ''Entered into the heart'' — beyond human imagination. ''Prepared'' (hētoimasen — made ready in advance). ''For them that love him'' — these glories are reserved for God''s lovers. The key is v.10: though naturally imperceptible, these things have been revealed by the Spirit.',
   'This verse is often misquoted as referring to heaven (''we can''t imagine how wonderful heaven will be''). But Paul''s point is the opposite: these things have been revealed (v.10)! The verse describes what was hidden — but the ''but'' (de) of v.10 shows that God has now unveiled these mysteries through his Spirit. The ''things prepared'' include the entire gospel plan: justification, sanctification, glorification — the inheritance that natural senses cannot perceive but the Spirit discloses.'),
  (10, 'But God hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of God.',
   'ἡμῖν δὲ ὁ θεὸς ἀπεκάλυψεν διὰ τοῦ πνεύματος αὐτοῦ τὸ γὰρ πνεῦμα πάντα ἐρευνᾷ καὶ τὰ βάθη τοῦ θεοῦ',
   'hēmin de ho theos apekalypsen dia tou pneumatos autou to gar pneuma panta ereuna kai ta bathē tou theou',
   '''Revealed'' (apekalypsen — unveiled, disclosed; aorist: a definite act of revelation). ''By his Spirit'' (dia tou pneumatos — through the Spirit as the agent). ''Searcheth'' (ereuna — investigates, explores thoroughly). ''Deep things of God'' (ta bathē tou theou — the profundities of God''s nature and plan). The Spirit plumbs God''s depths and communicates what he finds to believers.',
   'This verse is crucial to Paul''s epistemology (theory of knowledge). Natural human faculties (eye, ear, heart — v.9) cannot access God''s wisdom. But the Spirit can, because the Spirit ''searches all things, even the deep things of God.'' The Spirit has unlimited access to God''s mind and purposes. Through the Spirit, believers receive knowledge that is otherwise completely inaccessible. This is the foundation of the doctrine of illumination.'),
  (11, 'For what man knoweth the things of a man, save the spirit of man which is in him? even so the things of God knoweth no man, but the Spirit of God.',
   'τίς γὰρ οἶδεν ἀνθρώπων τὰ τοῦ ἀνθρώπου εἰ μὴ τὸ πνεῦμα τοῦ ἀνθρώπου τὸ ἐν αὐτῷ οὕτως καὶ τὰ τοῦ θεοῦ οὐδεὶς ἔγνωκεν εἰ μὴ τὸ πνεῦμα τοῦ θεοῦ',
   'tis gar oiden anthrōpōn ta tou anthrōpou ei mē to pneuma tou anthrōpou to en autō houtōs kai ta tou theou oudeis egnōken ei mē to pneuma tou theou',
   'An analogy: only a person''s own spirit truly knows that person''s thoughts. Similarly, only God''s Spirit truly knows God''s thoughts. The analogy implies: (1) The Spirit is distinct from God (just as a person''s spirit is ''in'' them yet distinct); (2) The Spirit has exhaustive knowledge of God; (3) Without the Spirit, God''s inner life is unknowable.',
   NULL),
  (12, 'Now we have received, not the spirit of the world, but the spirit which is of God; that we might know the things that are freely given to us of God.',
   'ἡμεῖς δὲ οὐ τὸ πνεῦμα τοῦ κόσμου ἐλάβομεν ἀλλὰ τὸ πνεῦμα τὸ ἐκ τοῦ θεοῦ ἵνα εἰδῶμεν τὰ ὑπὸ τοῦ θεοῦ χαρισθέντα ἡμῖν',
   'hēmeis de ou to pneuma tou kosmou elabomen alla to pneuma to ek tou theou hina eidōmen ta hypo tou theou charisthenta hēmin',
   '''Spirit of the world'' — the mindset and outlook of the present age: self-reliant, God-ignoring. ''Spirit which is of God'' (to pneuma to ek tou theou — the Spirit who proceeds from God). ''That we might know'' (hina eidōmen — purpose: the Spirit was given specifically to enable knowledge). ''Freely given'' (charisthenta — graciously bestowed; from charis, grace). The Spirit enables believers to understand what God has given them.',
   NULL),
  (13, 'Which things also we speak, not in the words which man''s wisdom teacheth, but which the Holy Ghost teacheth; comparing spiritual things with spiritual.',
   'ἃ καὶ λαλοῦμεν οὐκ ἐν διδακτοῖς ἀνθρωπίνης σοφίας λόγοις ἀλλ᾿ ἐν διδακτοῖς πνεύματος ἁγίου πνευματικοῖς πνευματικὰ συγκρίνοντες',
   'ha kai laloumen ouk en didaktois anthrōpinēs sophias logois all en didaktois pneumatos hagiou pneumatikois pneumatika synkrinontes',
   '''Words which man''s wisdom teacheth'' (didaktois anthrōpinēs sophias logois — words taught by human wisdom). ''Which the Holy Ghost teacheth'' (didaktois pneumatos — words taught by the Spirit). ''Comparing spiritual things with spiritual'' (pneumatikois pneumatika synkrinontes — interpreting/combining spiritual truths with spiritual words, or explaining spiritual things to spiritual people). The content, the language, and the audience are all spiritual.',
   NULL),
  (14, 'But the natural man receiveth not the things of the Spirit of God: for they are foolishness unto him: neither can he know them, because they are spiritually discerned.',
   'ψυχικὸς δὲ ἄνθρωπος οὐ δέχεται τὰ τοῦ πνεύματος τοῦ θεοῦ μωρία γὰρ αὐτῷ ἐστιν καὶ οὐ δύναται γνῶναι ὅτι πνευματικῶς ἀνακρίνεται',
   'psychikos de anthrōpos ou dechetai ta tou pneumatos tou theou mōria gar autō estin kai ou dynatai gnōnai hoti pneumatikōs anakrinetai',
   '''Natural man'' (psychikos anthrōpos — the soulish person; one governed by the psychē/soul — natural human faculties without the Spirit''s illumination). ''Receiveth not'' (ou dechetai — does not welcome, refuses to accept). ''Foolishness'' (mōria — absurdity). ''Neither can he know'' (ou dynatai gnōnai — is unable to know; it is an impossibility, not merely a difficulty). ''Spiritually discerned'' (pneumatikōs anakrinetai — examined, assessed by the Spirit).',
   'This verse establishes a fundamental anthropological distinction. The psychikos (natural/soulish) person is not merely uneducated but spiritually incapacitated. Without the Spirit, a person cannot receive (dechomai — welcome) or know (ginōskō — understand) spiritual truth. The barrier is not intellectual but spiritual: spiritual things require spiritual discernment (pneumatikōs anakrinetai). This is not anti-intellectualism but a recognition that a faculty beyond mere reason is needed to apprehend divine truth.'),
  (15, 'But he that is spiritual judgeth all things, yet he himself is judged of no man.',
   'ὁ δὲ πνευματικὸς ἀνακρίνει μὲν πάντα αὐτὸς δὲ ὑπ᾿ οὐδενὸς ἀνακρίνεται',
   'ho de pneumatikos anakrinei men panta autos de hyp oudenos anakrinetai',
   '''Spiritual'' (pneumatikos — the Spirit-indwelt person, in contrast to the psychikos). ''Judgeth all things'' (anakrinei panta — discerns, examines, evaluates all things). ''Judged of no man'' (hyp oudenos anakrinetai — is not subject to merely natural assessment). The spiritual person has a capacity for discernment that the natural person lacks. This does not make the spiritual person unaccountable but means the natural person lacks the faculty to evaluate spiritual matters.',
   NULL),
  (16, 'For who hath known the mind of the Lord, that he may instruct him? But we have the mind of Christ.',
   'τίς γὰρ ἔγνω νοῦν κυρίου ὃς συμβιβάσει αὐτόν ἡμεῖς δὲ νοῦν Χριστοῦ ἔχομεν',
   'tis gar egnō noun kyriou hos symbibasei auton hēmeis de noun Christou echomen',
   'Quoting Isaiah 40:13 (LXX; also cited in Romans 11:34). ''Who hath known the mind of the Lord?'' — no one, by natural capacity. ''But we have the mind of Christ'' (noun Christou echomen — we possess Christ''s way of thinking). Through the Spirit, believers share Christ''s perspective, values, and understanding. This is the climax of the chapter and one of the most extraordinary claims in the NT.',
   'The chapter''s stunning conclusion: ''We have the mind of Christ.'' The rhetorical question from Isaiah expects the answer ''no one'' — no human can know God''s mind or instruct him. But Paul adds the startling qualification: through the Spirit, believers possess ''the mind of Christ'' (nous Christou). This does not mean omniscience but a share in Christ''s perspective — his values, priorities, and understanding of God''s purposes. The Spirit who searches the deep things of God (v.10) imparts Christ''s very mindset to believers.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 2;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.4 demonstration
  ('ἀπόδειξις', 'apodeixis', 'G585', 'Demonstration, proof, showing forth — from apo (from) + deiknymi (to show). A rhetorical term for irrefutable proof. Paul uses it ironically: the real proof is not persuasive argumentation but the Spirit''s power. The Spirit''s demonstration produces certainty that no rhetoric can match. This is the evidence that undergirds saving faith.', 1),
  -- v.7 mystery
  ('μυστήριον', 'mystērion', 'G3466', 'Mystery, divine secret now revealed — God''s hidden wisdom ordained before the ages. The mystery is not an unsolved puzzle but a once-hidden plan now disclosed. It was concealed from the rulers of this age (v.8) but revealed to believers by the Spirit (v.10). The content of the mystery is God''s plan to bring believers to glory through the cross of Christ.', 2),
  -- v.8 Lord of glory
  ('κύριος τῆς δόξης', 'kyrios tēs doxēs', 'G2962/G1391', 'Lord of glory — the one to whom all glory belongs, a title of supreme deity. In the OT, ''the King of glory'' is Yahweh (Psalm 24:7-10). Paul applies it to the crucified Christ, making one of the strongest claims of Christ''s deity in the NT. The juxtaposition of ''glory'' and ''crucified'' is the supreme paradox of the gospel.', 3),
  -- v.10 deep things
  ('βάθος', 'bathos', 'G899', 'Depth, profundity — the deep things (ta bathē) of God are his innermost counsels, plans, and character. Only the Spirit can plumb these depths, because only the Spirit has unlimited access to God''s inner life. The Spirit then communicates these depths to believers, enabling them to know what no natural faculty can perceive.', 4),
  -- v.12 spirit of God
  ('πνεῦμα', 'pneuma', 'G4151', 'Spirit, breath, wind — in this chapter, the Holy Spirit as the agent of divine revelation and illumination. The Spirit is distinguished from ''the spirit of the world'' (v.12) — the mindset of the present age. Believers receive the Spirit specifically ''that we might know'' (v.12) the gifts God has given. The Spirit is not merely an influence but a personal agent who searches, knows, reveals, and teaches.', 5),
  -- v.14 natural man
  ('ψυχικός', 'psychikos', 'G5591', 'Natural, soulish, unspiritual — from psychē (soul, natural life). The psychikos person is governed by natural human faculties alone, without the Spirit''s illumination. This is not about intelligence or education but about the absence of spiritual capacity. The natural person cannot ''receive'' (dechomai — welcome) or ''know'' (ginōskō — understand) spiritual truth. It requires a different faculty: the Spirit.', 6),
  -- v.14 spiritually discerned
  ('ἀνακρίνω', 'anakrinō', 'G350', 'To examine, investigate, discern, judge — a legal term for the preliminary investigation of a case. Spiritual things must be ''spiritually examined'' (pneumatikōs anakrinetai). The spiritual person can conduct this examination (v.15: anakrinei panta); the natural person cannot. This is the faculty of spiritual discernment — the Spirit-given ability to assess and understand divine truth.', 7),
  -- v.16 mind of Christ
  ('νοῦς', 'nous', 'G3563', 'Mind, understanding, intellect, way of thinking — the faculty of rational perception and moral judgment. ''The mind of Christ'' (nous Christou) means sharing Christ''s perspective, values, and understanding of God''s purposes. Through the Spirit, believers think with Christ''s mind — not omniscience but a genuine participation in his outlook. This is the goal of transformation by the renewing of the mind (Romans 12:2).', 8)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 2
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 4
    WHEN 2 THEN 7
    WHEN 3 THEN 8
    WHEN 4 THEN 10
    WHEN 5 THEN 12
    WHEN 6 THEN 14 WHEN 7 THEN 14
    WHEN 8 THEN 16
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 not with eloquence
  (1, '1 Corinthians 1:17', 1),
  (1, '2 Corinthians 10:10', 2),
  -- v.2 Christ crucified
  (2, 'Galatians 6:14', 3),
  (2, '1 Corinthians 1:23', 4),
  -- v.3 weakness and fear
  (3, '2 Corinthians 12:9-10', 5),
  (3, '2 Corinthians 4:7', 6),
  -- v.4 demonstration of Spirit
  (4, '1 Thessalonians 1:5', 7),
  -- v.5 faith in God''s power
  (5, '2 Corinthians 4:7', 8),
  -- v.7 hidden wisdom ordained
  (7, 'Romans 16:25-26', 9),
  (7, 'Ephesians 3:9-11', 10),
  (7, 'Colossians 1:26', 11),
  -- v.8 Lord of glory
  (8, 'Psalm 24:7-10', 12),
  (8, 'James 2:1', 13),
  (8, 'Acts 3:17', 14),
  -- v.9 eye hath not seen
  (9, 'Isaiah 64:4', 15),
  (9, 'Isaiah 65:17', 16),
  -- v.10 Spirit searches deep things
  (10, 'John 14:26', 17),
  (10, 'John 16:13', 18),
  (10, 'Romans 11:33', 19),
  -- v.11 Spirit knows God
  (11, 'Proverbs 20:27', 20),
  -- v.12 spirit from God
  (12, 'Romans 8:15-16', 21),
  (12, '1 John 2:20', 22),
  -- v.13 Spirit teaches
  (13, 'John 14:26', 23),
  (13, '2 Peter 1:21', 24),
  -- v.14 natural man
  (14, 'John 3:6', 25),
  (14, 'Romans 8:5-8', 26),
  (14, 'Jude 1:19', 27),
  -- v.15 spiritual judgeth all
  (15, '1 John 2:27', 28),
  -- v.16 mind of the Lord / mind of Christ
  (16, 'Isaiah 40:13', 29),
  (16, 'Romans 11:34', 30),
  (16, 'Philippians 2:5', 31)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '1 Corinthians' AND c.chapter_number = 2
  AND v.verse_number = cr.verse_number;
