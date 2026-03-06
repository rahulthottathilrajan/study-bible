-- ═══════════════════════════════════════════════════
-- 2 TIMOTHY CHAPTER 4 — Paul's Final Charge & Farewell
-- 22 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Second Timothy 4 is Paul''s final recorded chapter — his last words before martyrdom. It opens with the most solemn charge in all his letters: preach the word, in season and out of season, because a time is coming when people will not endure sound doctrine but will heap up teachers to scratch their itching ears (vv.1-5). Paul then delivers his magnificent farewell: ''I have fought a good fight, I have finished my course, I have kept the faith'' (v.7), followed by his confidence in the crown of righteousness laid up for him (v.8). The final section (vv.9-22) is intensely personal: Demas has forsaken him, only Luke remains, Paul asks for his cloak and his books, Alexander the coppersmith has done him much evil, and at his first defence no man stood with him — ''but the Lord stood with me.'' The letter ends as it began: with grace. These are the last inspired words of the greatest apostle.',
  'Preach the Word & the Crown of Righteousness',
  'κῆρυξον (kēryxon)',
  'Preach, herald, proclaim — the urgent cry of a royal herald announcing the king''s message. Not suggestion but proclamation; not dialogue but declaration of divinely authoritative truth.',
  '["The Solemn Charge (vv.1-2): Before God and Christ who shall judge; preach the word; in season, out of season; reprove, rebuke, exhort","Itching Ears (vv.3-5): They will not endure sound doctrine; heap up teachers; turn to fables; Timothy: watch, endure, evangelise, fulfil your ministry","Paul''s Farewell (vv.6-8): I am now being poured out; my departure is at hand; I have fought, finished, kept; the crown of righteousness","Personal Requests (vv.9-13): Come before winter; Demas forsook me; only Luke is with me; bring Mark; bring the cloak and the books","First Defence and the Lord''s Faithfulness (vv.14-18): Alexander did evil; at my first defence no man stood; the Lord stood with me; delivered from the lion''s mouth; the Lord will preserve me","Final Greetings and Benediction (vv.19-22): Greet Prisca, Aquila, Onesiphorus; Erastus, Trophimus; come before winter; grace be with you"]'
FROM books b WHERE b.name = '2 Timothy';

-- Step 2: Insert all 22 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'I charge thee therefore before God, and the Lord Jesus Christ, who shall judge the quick and the dead at his appearing and his kingdom;',
   'Διαμαρτύρομαι οὖν ἐγὼ ἐνώπιον τοῦ θεοῦ καὶ τοῦ κυρίου Ἰησοῦ Χριστοῦ τοῦ μέλλοντος κρίνειν ζῶντας καὶ νεκρούς κατὰ τὴν ἐπιφάνειαν αὐτοῦ καὶ τὴν βασιλείαν αὐτοῦ',
   'Diamartyromai oun egō enōpion tou theou kai tou kyriou Iēsou Christou tou mellontos krinein zōntas kai nekrous kata tēn epiphaneian autou kai tēn basileian autou',
   '''I charge'' (diamartyromai — I solemnly testify, I bear witness with utmost gravity; a legal term for giving testimony under oath). This is the most solemn adjuration in Paul''s letters. Two witnesses: ''God'' and ''the Lord Jesus Christ.'' Christ is described as the one ''who shall judge the quick and the dead'' (krinein zōntas kai nekrous — judge the living and the dead) at His ''appearing'' (epiphaneian — epiphany, the visible manifestation of His return) and His ''kingdom'' (basileian). The charge is given in view of final accountability — Timothy will answer to the Judge for how he handled his commission.',
   NULL),
  (2,
   'Preach the word; be instant in season, out of season; reprove, rebuke, exhort with all longsuffering and doctrine.',
   'κήρυξον τὸν λόγον ἐπίστηθι εὐκαίρως ἀκαίρως ἔλεγξον ἐπιτίμησον παρακάλεσον ἐν πάσῃ μακροθυμίᾳ καὶ διδασκαλίᾳ',
   'kēryxon ton logon epistēthi eukairōs akairōs elegxon epitimēson parakaleson en pasē makrothymia kai didaskalia',
   '''Preach'' (kēryxon — herald, proclaim as a royal herald announces the king''s decree; aorist imperative: do it decisively). ''The word'' (ton logon — the message, the gospel, the Scripture). ''Be instant'' (epistēthi — stand ready, be on duty, be at your post). ''In season, out of season'' (eukairōs akairōs — at convenient and inconvenient times; when it is welcome and when it is not). Three actions: (1) ''reprove'' (elegxon — convict of error, expose wrong), (2) ''rebuke'' (epitimēson — censure, warn sharply), (3) ''exhort'' (parakaleson — encourage, urge, comfort). All three are governed by ''longsuffering'' (makrothymia — patience) and ''doctrine'' (didaskalia — teaching). Rebuke without teaching corrects without instructing; teaching without rebuke instructs without correcting.',
   NULL),
  (3,
   'For the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears;',
   'ἔσται γὰρ καιρὸς ὅτε τῆς ὑγιαινούσης διδασκαλίας οὐκ ἀνέξονται ἀλλὰ κατὰ τὰς ἰδίας ἐπιθυμίας ἑαυτοῖς ἐπισωρεύσουσιν διδασκάλους κνηθόμενοι τὴν ἀκοήν',
   'estai gar kairos hote tēs hygiainousēs didaskalias ouk anexontai alla kata tas idias epithymias heautois episōreusousin didaskalous knēthomenoi tēn akoēn',
   '''Sound doctrine'' (hygiainousēs didaskalias — healthy teaching, wholesome doctrine; hygiainō = to be in good health). ''Not endure'' (ouk anexontai — will not tolerate, will not put up with). ''Heap to themselves'' (episōreusousin — pile up, accumulate in heaps; they want quantity, not quality). ''Itching ears'' (knēthomenoi tēn akoēn — having their hearing tickled, wanting their ears scratched). The image: they itch for novelty, entertainment, and self-affirmation, so they collect teachers who will scratch where it itches. The problem is not the teachers — it is the audience that creates a market for flattering falsehood.',
   NULL),
  (4,
   'And they shall turn away their ears from the truth, and shall be turned unto fables.',
   'καὶ ἀπὸ μὲν τῆς ἀληθείας τὴν ἀκοὴν ἀποστρέψουσιν ἐπὶ δὲ τοὺς μύθους ἐκτραπήσονται',
   'kai apo men tēs alētheias tēn akoēn apostrepsousin epi de tous mythous ektrapēsontai',
   '''Turn away'' (apostrepsousin — actively divert, avert; they deliberately redirect their hearing away from truth). ''Turned unto fables'' (ektrapēsontai — will be turned aside, wandered off course; passive voice: once they reject truth, they are carried away by error). ''Fables'' (mythous — myths, fabricated stories, invented narratives). The sequence: first they will not endure truth (v.3), then they accumulate flattering teachers, then they turn their ears from truth, and finally they are swept into mythology. Each step makes the next inevitable.',
   NULL),
  (5,
   'But watch thou in all things, endure afflictions, do the work of an evangelist, make full proof of thy ministry.',
   'σὺ δὲ νῆφε ἐν πᾶσιν κακοπάθησον ἔργον ποίησον εὐαγγελιστοῦ τὴν διακονίαν σου πληροφόρησον',
   'sy de nēphe en pasin kakopathēson ergon poiēson euangelistou tēn diakonian sou plērophorēson',
   '''But thou'' (sy de — emphatic contrast: whatever they do, you do this). Four commands: (1) ''watch'' (nēphe — be sober, clear-headed, self-controlled), (2) ''endure afflictions'' (kakopathēson — suffer hardship; cf. 2:3), (3) ''do the work of an evangelist'' (ergon poiēson euangelistou — perform the task of a gospel-proclaimer), (4) ''make full proof of thy ministry'' (tēn diakonian sou plērophorēson — fulfil your service completely, carry it to its full measure). Timothy''s calling is clear: sobriety, suffering, evangelism, and complete faithfulness to his ministry assignment.',
   NULL),
  (6,
   'For I am now ready to be offered, and the time of my departure is at hand.',
   'Ἐγὼ γὰρ ἤδη σπένδομαι καὶ ὁ καιρὸς τῆς ἀναλύσεώς μου ἐφέστηκεν',
   'Egō gar ēdē spendomai kai ho kairos tēs analyseōs mou ephestēken',
   '''Ready to be offered'' (spendomai — I am being poured out as a drink offering; present passive: the pouring has already begun). In OT worship, wine was poured over the sacrifice as a libation (Num 15:5-7; Phil 2:17). Paul''s life is the drink offering poured over the sacrifice of his ministry. ''Departure'' (analyseōs — loosing, release; a nautical term for weighing anchor and setting sail, or a military term for breaking camp). Death is not extinction but departure — the ship leaving harbour, the army striking camp for the march home.',
   NULL),
  (7,
   'I have fought a good fight, I have finished my course, I have kept the faith:',
   'τὸν καλὸν ἀγῶνα ἠγώνισμαι τὸν δρόμον τετέλεκα τὴν πίστιν τετήρηκα',
   'ton kalon agōna ēgōnismai ton dromon teteleka tēn pistin tetērēka',
   'Three perfect tenses — completed actions with lasting results: (1) ''I have fought a good fight'' (ton kalon agōna ēgōnismai — the noble contest I have contended). (2) ''I have finished my course'' (ton dromon teteleka — the race I have completed). (3) ''I have kept the faith'' (tēn pistin tetērēka — the faith-deposit I have guarded). Not ''a fight'' but ''the fight'' — the definite article points to the specific contest appointed for Paul. Not ''a faith'' but ''the faith'' — the body of apostolic doctrine entrusted to him. The articles make these definite and specific: his assignment, his race, his trust. All three: done.',
   NULL),
  (8,
   'Henceforth there is laid up for me a crown of righteousness, which the Lord, the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.',
   'λοιπὸν ἀπόκειταί μοι ὁ τῆς δικαιοσύνης στέφανος ὃν ἀποδώσει μοι ὁ κύριος ἐν ἐκείνῃ τῇ ἡμέρᾳ ὁ δίκαιος κριτής οὐ μόνον δὲ ἐμοὶ ἀλλὰ καὶ πᾶσιν τοῖς ἠγαπηκόσιν τὴν ἐπιφάνειαν αὐτοῦ',
   'loipon apokeitai moi ho tēs dikaiosynēs stephanos hon apodōsei moi ho kyrios en ekeinē tē hēmera ho dikaios kritēs ou monon de emoi alla kai pasin tois ēgapēkosin tēn epiphaneian autou',
   '''Laid up'' (apokeitai — stored, reserved, set aside; perfect tense: it has been laid up and remains waiting). ''Crown of righteousness'' (ho tēs dikaiosynēs stephanos — the victor''s wreath that belongs to righteousness; not a royal crown [diadēma] but the athlete''s garland [stephanos]). ''The righteous judge'' (ho dikaios kritēs) — unlike Nero, who will condemn Paul unjustly, the Lord judges righteously. ''At that day'' — the day of Christ''s appearing. ''All them that love his appearing'' (tois ēgapēkosin tēn epiphaneian autou — perfect tense: those who have loved and continue to love His return). The crown is not for apostles alone but for everyone who eagerly awaits Christ''s coming.',
   'The crown of righteousness is not earned by merit but received by grace from the righteous Judge. It awaits all who love Christ''s appearing — not only martyrs and apostles but every believer who longs for His return. The test is not the greatness of one''s ministry but the direction of one''s love.'),
  (9,
   'Do thy diligence to come shortly unto me:',
   'Σπούδασον ἐλθεῖν πρός με ταχέως',
   'Spoudason elthein pros me tacheōs',
   '''Do thy diligence'' (spoudason — make every effort, be zealous; same word as 2:15 ''study''). ''Come shortly'' (elthein tacheōs — come quickly). Paul is alone and near death. This is not merely a social request but an urgent summons from a dying father to his spiritual son. The personal and the theological intertwine: the man who has just declared cosmic confidence in the righteous Judge (v.8) also desperately wants human companionship. Faith and loneliness coexist.',
   NULL),
  (10,
   'For Demas hath forsaken me, having loved this present world, and is departed unto Thessalonica; Crescens to Galatia, Titus unto Dalmatia.',
   'Δημᾶς γάρ με ἐγκατέλιπεν ἀγαπήσας τὸν νῦν αἰῶνα καὶ ἐπορεύθη εἰς Θεσσαλονίκην Κρήσκης εἰς Γαλατίαν Τίτος εἰς Δαλματίαν',
   'Dēmas gar me egkatelipen agapēsas ton nyn aiōna kai eporeuthē eis Thessalonikēn Krēskēs eis Galatian Titos eis Dalmatian',
   '''Demas hath forsaken me'' (me egkatelipen — abandoned me, deserted me; aorist: a decisive, completed departure). ''Having loved this present world'' (agapēsas ton nyn aiōna — having set his love on the present age). In Colossians 4:14 and Philemon 24, Demas sent greetings as a co-worker; now he defects. The reason: love of the world replaced love of Christ''s appearing (contrast v.8). The word ''loved'' (agapēsas) is the same root as v.8''s ''love'' — Demas loved the wrong thing. Crescens and Titus departed for ministry (not desertion), leaving Paul increasingly isolated.',
   NULL),
  (11,
   'Only Luke is with me. Take Mark, and bring him with thee: for he is profitable to me for the ministry.',
   'Λουκᾶς ἐστιν μόνος μετ᾽ ἐμοῦ Μᾶρκον ἀναλαβὼν ἄγε μετὰ σεαυτοῦ ἔστιν γάρ μοι εὔχρηστος εἰς διακονίαν',
   'Loukas estin monos met'' emou Markon analabōn age meta seautou estin gar moi euchrēstos eis diakonian',
   '''Only Luke is with me'' (Loukas estin monos met'' emou) — the beloved physician (Col 4:14) is Paul''s sole companion. ''Take Mark'' — this is John Mark, who deserted on the first journey (Acts 13:13) and caused the Paul-Barnabas split (Acts 15:39). Now Paul declares him ''profitable'' (euchrēstos — useful, serviceable; the same word used for Onesimus in Philem 11). Mark''s restoration is complete. The man once rejected by Paul is now requested by Paul. Grace transforms deserters into valuable servants.',
   NULL),
  (12,
   'And Tychicus have I sent to Ephesus.',
   'Τυχικὸν δὲ ἀπέστειλα εἰς Ἔφεσον',
   'Tychikon de apesteila eis Epheson',
   'Tychicus — Paul''s trusted envoy (Eph 6:21; Col 4:7) — was sent to Ephesus, presumably to replace Timothy so Timothy could come to Rome. Paul''s strategic thinking continues even from his death cell: he ensures the church at Ephesus will not be left without leadership when Timothy departs.',
   NULL),
  (13,
   'The cloke that I left at Troas with Carpus, when thou comest, bring with thee, and the books, but especially the parchments.',
   'τὸν φαιλόνην ὃν ἀπέλιπον ἐν Τρωάδι παρὰ Κάρπῳ ἐρχόμενος φέρε καὶ τὰ βιβλία μάλιστα τὰς μεμβράνας',
   'ton phailonēn hon apelipon en Trōadi para Karpō erchomenos phere kai ta biblia malista tas membranas',
   '''Cloke'' (phailonēn — a heavy outer garment, a travelling cloak for cold weather). Paul, in a Roman dungeon, faces winter (v.21) and needs warmth. ''Books'' (biblia — papyrus scrolls, possibly OT Scriptures or his own writings). ''Parchments'' (membranas — Latin loanword for animal-skin documents, more expensive and durable than papyrus; possibly legal documents, letters, or OT scrolls). This mundane request is profoundly revealing: a man about to die wants his coat, his books, and his Bible. The apostle''s needs are physical (warmth) and intellectual/spiritual (study material). He will study until the sword falls.',
   NULL),
  (14,
   'Alexander the coppersmith did me much evil: the Lord reward him according to his works:',
   'Ἀλέξανδρος ὁ χαλκεὺς πολλά μοι κακὰ ἐνεδείξατο ἀποδώσει αὐτῷ ὁ κύριος κατὰ τὰ ἔργα αὐτοῦ',
   'Alexandros ho chalkeus polla moi kaka enedeixato apodōsei autō ho kyrios kata ta erga autou',
   '''Alexander the coppersmith'' (ho chalkeus — metalworker, bronze-smith; possibly the Alexander of 1 Tim 1:20). ''Did me much evil'' (polla moi kaka enedeixato — displayed, demonstrated much harm against me; perhaps testifying against Paul in court). ''The Lord reward him'' (apodōsei autō ho kyrios) — not personal vengeance but an appeal to divine justice (cf. Ps 62:12; Rom 12:19). Paul does not curse Alexander but commits him to the righteous Judge of v.8, trusting God to administer justice.',
   NULL),
  (15,
   'Of whom be thou ware also; for he hath greatly withstood our words.',
   'ὃν καὶ σὺ φυλάσσου λίαν γὰρ ἀντέστη τοῖς ἡμετέροις λόγοις',
   'hon kai sy phylassou lian gar antestē tois hēmeterois logois',
   '''Be thou ware'' (phylassou — guard yourself, be on your guard; present middle imperative: keep watching). ''Greatly withstood'' (lian antestē — vehemently opposed, resisted with force). ''Our words'' (tois hēmeterois logois — our messages, our gospel proclamation). Alexander''s opposition was not passive disagreement but active resistance to the apostolic message. Paul warns Timothy because the same opponent may target him.',
   NULL),
  (16,
   'At my first answer no man stood with me, but all men forsook me: I pray God that it may not be laid to their charge.',
   'Ἐν τῇ πρώτῃ μου ἀπολογίᾳ οὐδείς μοι συμπαρεγένετο ἀλλὰ πάντες με ἐγκατέλιπον μὴ αὐτοῖς λογισθείη',
   'En tē prōtē mou apologia oudeis moi symparegento alla pantes me egkatelipon mē autois logistheiē',
   '''First answer'' (prōtē apologia — first defence, preliminary hearing; a legal term for a court defence). ''No man stood with me'' (oudeis moi symparegento — no one appeared alongside me, no one came to my support). ''All men forsook me'' (pantes me egkatelipon — the same word used of Demas in v.10). Paul stood alone in the Roman court. Yet his response echoes Jesus (Luke 23:34) and Stephen (Acts 7:60): ''I pray God that it may not be laid to their charge'' (mē autois logistheiē — may it not be charged to their account). Grace, not bitterness, from a forsaken man.',
   NULL),
  (17,
   'Notwithstanding the Lord stood with me, and strengthened me; that by me the preaching might be fully known, and that all the Gentiles might hear: and I was delivered out of the mouth of the lion.',
   'ὁ δὲ κύριός μοι παρέστη καὶ ἐνεδυνάμωσέν με ἵνα δι᾽ ἐμοῦ τὸ κήρυγμα πληροφορηθῇ καὶ ἀκούσωσιν πάντα τὰ ἔθνη καὶ ἐρρύσθην ἐκ στόματος λέοντος',
   'ho de kyrios moi parestē kai enedynamōsen me hina di'' emou to kērygma plērophorēthē kai akousōsin panta ta ethnē kai errysthēn ek stomatos leontos',
   '''The Lord stood with me'' (ho kyrios moi parestē — the Lord stood beside me; the very word [symparegento] denied of human companions is now used [parestē] of Christ). ''Strengthened me'' (enedynamōsen — empowered, infused with power; same root as 2:1 ''be strong''). Even in the dock, Paul preached: ''that by me the preaching might be fully known'' (to kērygma plērophorēthē — the proclamation might be completely delivered). ''All the Gentiles might hear'' — Paul turned his trial into a pulpit. ''Mouth of the lion'' — possibly Nero, or death itself (cf. Ps 22:21). Temporary deliverance; execution still approaches.',
   NULL),
  (18,
   'And the Lord shall deliver me from every evil work, and will preserve me unto his heavenly kingdom: to whom be glory for ever and ever. Amen.',
   'ρύσεταί με ὁ κύριος ἀπὸ παντὸς ἔργου πονηροῦ καὶ σώσει εἰς τὴν βασιλείαν αὐτοῦ τὴν ἐπουράνιον ᾧ ἡ δόξα εἰς τοὺς αἰῶνας τῶν αἰώνων ἀμήν',
   'rhysetai me ho kyrios apo pantos ergou ponērou kai sōsei eis tēn basileian autou tēn epouranion hō hē doxa eis tous aiōnas tōn aiōnōn amēn',
   '''Shall deliver me from every evil work'' (rhysetai me apo pantos ergou ponērou) — not deliverance from death but from spiritual failure. Paul knows he will die (v.6) but is confident he will not fall into apostasy or denial. ''Preserve me unto his heavenly kingdom'' (sōsei eis tēn basileian autou tēn epouranion — will save me into His heavenly kingdom). Death is not defeat but the doorway to the kingdom. The doxology (''to whom be glory for ever and ever'') bursts from a man in chains facing execution — perhaps the most remarkable doxology in Scripture.',
   NULL),
  (19,
   'Salute Prisca and Aquila, and the household of Onesiphorus.',
   'Ἄσπασαι Πρίσκαν καὶ Ἀκύλαν καὶ τὸν Ὀνησιφόρου οἶκον',
   'Aspasai Priskan kai Akylan kai ton Onēsiphorou oikon',
   'Prisca (Priscilla) and Aquila — the missionary couple who worked with Paul in Corinth (Acts 18:2), Ephesus (Acts 18:18-26), and Rome (Rom 16:3-5). Now apparently back in Ephesus. ''The household of Onesiphorus'' (ton Onēsiphorou oikon) — the same faithful friend from 1:16-17 who sought Paul out in Rome.',
   NULL),
  (20,
   'Erastus abode at Corinth: but Trophimus have I left at Miletum sick.',
   'Ἔραστος ἔμεινεν ἐν Κορίνθῳ Τρόφιμον δὲ ἀπέλιπον ἐν Μιλήτῳ ἀσθενοῦντα',
   'Erastos emeinen en Korinthō Trophimon de apelipon en Milētō asthenonta',
   'Erastus — possibly the city treasurer of Corinth (Rom 16:23). Trophimus — the Ephesian who accompanied Paul to Jerusalem (Acts 20:4; 21:29). Paul left him ''sick'' (asthenonta — weak, ill). Notably, the apostle who performed extraordinary miracles (Acts 19:11-12) left a colleague behind sick — miracles were never automatic or universal. Healing was a sign-gift under sovereign divine control, not a power Paul could deploy at will.',
   NULL),
  (21,
   'Do thy diligence to come before winter. Eubulus greeteth thee, and Pudens, and Linus, and Claudia, and all the brethren.',
   'σπούδασον πρὸ χειμῶνος ἐλθεῖν ἀσπάζεταί σε Εὔβουλος καὶ Πούδης καὶ Λίνος καὶ Κλαυδία καὶ οἱ ἀδελφοὶ πάντες',
   'spoudason pro cheimōnos elthein aspazetai se Euboulos kai Poudēs kai Linos kai Klaudia kai hoi adelphoi pantes',
   '''Before winter'' (pro cheimōnos) — not merely because Paul needs his cloak (v.13) but because sea travel ceased during winter months. If Timothy delays, he may never arrive in time. The urgency is literally life and death. Eubulus, Pudens, Linus, and Claudia — Roman Christians otherwise unknown except that early church tradition identifies Linus as the first bishop of Rome after Peter (Irenaeus, Adv. Haer. 3.3.3). ''All the brethren'' — despite the desertions, there remains a faithful remnant.',
   NULL),
  (22,
   'The Lord Jesus Christ be with thy spirit. Grace be with you. Amen.',
   'Ὁ κύριος Ἰησοῦς Χριστὸς μετὰ τοῦ πνεύματός σου ἡ χάρις μεθ᾽ ὑμῶν ἀμήν',
   'Ho kyrios Iēsous Christos meta tou pneumatos sou hē charis meth'' hymōn amēn',
   'Paul''s final words in his final letter. ''The Lord Jesus Christ be with thy spirit'' — singular (sou), personal to Timothy. ''Grace be with you'' — plural (hymōn), encompassing the whole church that will hear this letter read. The last word Paul ever wrote under inspiration is ''grace'' (charis). He began with grace (1:2), lived by grace (1:9), was strengthened by grace (2:1), and ends with grace. The apostle of grace speaks his last word: grace.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4;

-- Step 3: Word Studies for key verses

-- Verse 2 (Preach the word)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κήρυξον', 'kēryxon', 'G2784', 'Preach, herald, proclaim publicly — a kēryx was a herald who announced the king''s decrees in the public square. Not casual conversation but authoritative proclamation of a sovereign message.', 1),
  ('ἐπίστηθι', 'epistēthi', 'G2186', 'Be instant, stand ready, be at your post — from epi (upon) + histēmi (to stand). Like a soldier standing at attention, ready for immediate action at any moment.', 2),
  ('ἔλεγξον', 'elegxon', 'G1651', 'Reprove, convict, expose — to bring error into the light so that it stands exposed and the sinner stands convicted. Not angry accusation but clear-eyed exposure of wrong.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = 2;

-- Verse 3 (Itching ears)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('κνηθόμενοι', 'knēthomenoi', 'G2833', 'Itching, having an itch, wanting to be tickled — middle voice: they itch themselves, they produce their own desire for novelty. They want soothing, not saving; entertainment, not truth.', 1),
  ('ἐπισωρεύσουσιν', 'episōreusousin', 'G2002', 'Heap up, pile upon, accumulate in great numbers — they want not one faithful teacher but a heap of flattering ones. Quantity replaces quality when truth is abandoned.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = 3;

-- Verse 6 (Poured out / departure)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σπένδομαι', 'spendomai', 'G4689', 'I am being poured out as a drink offering — present passive: the pouring has begun. Paul''s blood is the libation on the altar of his ministry. Used also in Phil 2:17.', 1),
  ('ἀναλύσεως', 'analyseōs', 'G359', 'Departure, loosing, release — a nautical term for casting off, weighing anchor; also a military term for breaking camp. Death is setting sail for the homeland or striking camp for the final march. Only here in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = 6;

-- Verse 7 (Fought, finished, kept)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀγῶνα', 'agōna', 'G73', 'Fight, contest, struggle — the athletic/military contest appointed by God. Same root as agōnizomai (1 Tim 6:12; Col 1:29). Not ''a'' fight but ''the'' fight — the specific struggle assigned to Paul.', 1),
  ('δρόμον', 'dromon', 'G1408', 'Course, race, circuit — the track marked out for a runner. Paul''s race was predetermined by God (Acts 20:24); he ran it to its completion. Only here, Acts 13:25, and Acts 20:24 in the NT.', 2),
  ('τετήρηκα', 'tetērēka', 'G5083', 'I have kept, I have guarded — perfect tense: I guarded and continue to have guarded. The same word used for guarding a treasure, a prisoner, or a deposit (cf. 1:14 ''guard the good deposit''). The faith entrusted to Paul remains intact.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = 7;

-- Verse 8 (Crown of righteousness)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('στέφανος', 'stephanos', 'G4735', 'Crown, wreath, garland — the victory wreath awarded to athletes, not the royal diadem (diadēma). This is the reward of the overcomer, the prize at the finish line.', 1),
  ('ἐπιφάνειαν', 'epiphaneian', 'G2015', 'Appearing, manifestation, epiphany — used for both Christ''s first and second coming. Here it is His return: those who ''love'' His appearing live in eager anticipation of it.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = 8;

-- Verse 10 (Demas forsook)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐγκατέλιπεν', 'egkatelipen', 'G1459', 'Forsook, abandoned, deserted — a strong word: left behind, left in the lurch. The same word used of the Father not abandoning Christ (Acts 2:27; Ps 16:10) and of Paul being abandoned at his trial (v.16).', 1),
  ('ἀγαπήσας', 'agapēsas', 'G25', 'Having loved — Demas loved (agapaō) the present age instead of loving Christ''s appearing (v.8). The same verb for the highest love, directed at the wrong object. Misdirected love is the root of apostasy.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = 10;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Solemn charge
  (1, '1 Timothy 5:21', 1), (1, '1 Timothy 6:13-14', 2), (1, 'Acts 10:42', 3),
  -- v2: Preach the word
  (2, '2 Timothy 2:15', 1), (2, '1 Timothy 4:2', 2), (2, 'Acts 20:20-27', 3),
  -- v3: Itching ears
  (3, '2 Timothy 3:1-5', 1), (3, '2 Peter 2:1-3', 2), (3, 'Isaiah 30:10-11', 3),
  -- v5: Fulfil your ministry
  (5, 'Colossians 4:17', 1), (5, 'Acts 20:24', 2), (5, '2 Timothy 2:3', 3),
  -- v6: Poured out
  (6, 'Philippians 2:17', 1), (6, 'Numbers 15:5-7', 2), (6, '2 Peter 1:14', 3),
  -- v7: Fought, finished, kept
  (7, '1 Timothy 6:12', 1), (7, 'Acts 20:24', 2), (7, '1 Corinthians 9:24-27', 3), (7, 'Philippians 3:13-14', 4),
  -- v8: Crown of righteousness
  (8, '1 Corinthians 9:25', 1), (8, 'James 1:12', 2), (8, '1 Peter 5:4', 3), (8, 'Revelation 2:10', 4),
  -- v10: Demas
  (10, 'Colossians 4:14', 1), (10, 'Philemon 24', 2), (10, '1 John 2:15-16', 3),
  -- v11: Mark profitable
  (11, 'Acts 13:13', 1), (11, 'Acts 15:37-39', 2), (11, 'Colossians 4:10', 3),
  -- v14: Lord reward according to works
  (14, 'Psalm 62:12', 1), (14, 'Romans 12:19', 2), (14, 'Revelation 22:12', 3),
  -- v16: None stood with me
  (16, 'Luke 23:34', 1), (16, 'Acts 7:60', 2), (16, 'Psalm 27:10', 3),
  -- v17: Lord stood with me
  (17, 'Acts 23:11', 1), (17, 'Acts 27:23-24', 2), (17, 'Psalm 22:21', 3), (17, 'Daniel 6:22', 4),
  -- v18: Preserve to heavenly kingdom
  (18, 'Romans 8:28-39', 1), (18, 'Jude 24-25', 2), (18, '1 Peter 1:5', 3),
  -- v22: Grace be with you
  (22, '2 Timothy 1:2', 1), (22, 'Galatians 6:18', 2), (22, 'Philemon 25', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 4 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Timothy Chapter 4 Complete
-- 22 verses · 7 key verses with word studies (16 words)
-- Cross-references for 16 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════