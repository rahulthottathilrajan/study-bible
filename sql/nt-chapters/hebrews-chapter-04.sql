-- ═══════════════════════════════════════════════════
-- HEBREWS CHAPTER 4 — The Sabbath Rest and the Living Word of God
-- 16 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 4,
  'Hebrews 4 continues the Psalm 95 exposition from chapter 3, developing the concept of God''s ''rest'' (katapausis) and applying it to believers. The chapter opens with a solemn warning: ''Let us therefore fear, lest, a promise being left us of entering into his rest, any of you should seem to come short of it'' (v.1). The gospel was preached to the wilderness generation, ''but the word preached did not profit them, not being mixed with faith in them that heard it'' (v.2). ''We which have believed do enter into rest'' (v.3) — rest is entered by faith, not by works or geography. The author then makes a remarkable argument: since God rested from creation on the seventh day (Gen 2:2), and since David in Psalm 95 (written centuries after Joshua) still speaks of ''To day'' — then the rest was never fully realized through Joshua (v.8). ''There remaineth therefore a rest to the people of God'' (v.9) — using the special word sabbatismos, a ''sabbath-keeping'' rest. ''Let us labour therefore to enter into that rest'' (v.11). The chapter then shifts to one of the most powerful passages in Scripture about God''s Word: ''The word of God is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit'' (v.12). The word exposes all things before ''him with whom we have to do'' (v.13). The chapter concludes with a glorious transition to Christ''s high priesthood: ''Seeing then that we have a great high priest, that is passed into the heavens, Jesus the Son of God, let us hold fast our profession'' (v.14). Because He was ''in all points tempted like as we are, yet without sin'' (v.15), we may ''come boldly unto the throne of grace'' (v.16).',
  'God''s Sabbath Rest, the Living Word, and the Great High Priest',
  'κατάπαυσις (katapausis)',
  'Rest, cessation from labor, a resting place — from kata (down) + pauō (to stop, to cease). Used in 3:11,18; 4:1,3,5,10,11. God''s ''rest'' is multi-layered: (1) His creation rest (Gen 2:2) — cessation from creative work; (2) the promised land (the immediate OT referent in Psalm 95); (3) the spiritual rest believers enter by faith — cessation from self-effort and reliance on works; (4) the eschatological rest of eternal glory. In v.9 the author coins a special word, sabbatismos (sabbath-rest), found only here in the NT.',
  '["The Promise of Rest Remains (vv.1-5): Let us therefore fear lest a promise being left us of entering into his rest any of you should seem to come short of it; for unto us was the gospel preached as well as unto them but the word preached did not profit them not being mixed with faith; for we which have believed do enter into rest as he said I sware in my wrath they shall not enter into my rest although the works were finished from the foundation of the world; for he spake in a certain place of the seventh day on this wise and God did rest the seventh day from all his works; and in this place again they shall not enter into my rest","A Sabbath Rest Remains for the People of God (vv.6-11): Seeing therefore it remaineth that some must enter therein and they to whom it was first preached entered not in because of unbelief; again he limiteth a certain day saying in David To day after so long a time; for if Jesus had given them rest then would he not afterward have spoken of another day; there remaineth therefore a rest to the people of God; for he that is entered into his rest he also hath ceased from his own works as God did from his; let us labour therefore to enter into that rest lest any man fall after the same example of unbelief","The Living Word of God (vv.12-13): For the word of God is quick and powerful and sharper than any twoedged sword piercing even to the dividing asunder of soul and spirit and of the joints and marrow and is a discerner of the thoughts and intents of the heart; neither is there any creature that is not manifest in his sight but all things are naked and opened unto the eyes of him with whom we have to do","The Great High Priest: Come Boldly (vv.14-16): Seeing then that we have a great high priest that is passed into the heavens Jesus the Son of God let us hold fast our profession; for we have not an high priest which cannot be touched with the feeling of our infirmities but was in all points tempted like as we are yet without sin; let us therefore come boldly unto the throne of grace that we may obtain mercy and find grace to help in time of need"]'
FROM books b WHERE b.name = 'Hebrews';

-- Step 2: Insert all 16 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Let us therefore fear, lest, a promise being left us of entering into his rest, any of you should seem to come short of it.',
   'φοβηθῶμεν οὖν μήποτε καταλειπομένης ἐπαγγελίας εἰσελθεῖν εἰς τὴν κατάπαυσιν αὐτοῦ δοκῇ τις ἐξ ὑμῶν ὑστερηκέναι',
   'phobēthōmen oun mēpote kataleipomenēs epangelias eiselthein eis tēn katapausin autou dokē tis ex hymōn hysterēkenai',
   '''Let us fear'' (phobēthōmen — an exhortation to holy reverence, not cringing terror; the fear of God that produces careful, diligent faith). ''A promise being left'' (kataleipomenēs epangelias — a promise remaining, still standing, not yet withdrawn). The promise of rest is still available — this is the note of hope amid the warning. ''Come short'' (hysterēkenai — to fall short, to miss, to fail to reach; perfect infinitive suggesting a settled state of having missed the goal). The wilderness generation''s failure is not merely historical but exemplary: the same danger faces every generation.',
   NULL),
  (2, 'For unto us was the gospel preached, as well as unto them: but the word preached did not profit them, not being mixed with faith in them that heard it.',
   'καὶ γάρ ἐσμεν εὐηγγελισμένοι καθάπερ κἀκεῖνοι ἀλλ᾽ οὐκ ὠφέλησεν ὁ λόγος τῆς ἀκοῆς ἐκείνους μὴ συγκεκραμένος τῇ πίστει τοῖς ἀκούσασιν',
   'kai gar esmen euēngelismenoi kathaper kakeinoi all ouk ōphelēsen ho logos tēs akoēs ekeinous mē synkekeramenos tē pistei tois akousasin',
   '''The gospel preached'' (euēngelismenoi — we have been evangelized, we have had good news proclaimed to us). Remarkably, the author says the wilderness generation also received ''good news'' — the promise of rest. ''Did not profit them'' (ouk ōphelēsen — was of no benefit). The problem was not the message but the reception: ''not being mixed with faith'' (mē synkekeramenos tē pistei — not blended together with faith). The metaphor is of food that must be mixed with digestive processes to nourish — the word must be mixed with faith to profit the soul. Hearing alone is insufficient; the word must be received with trust.',
   'This verse establishes a crucial principle: the word of God is objectively powerful, but its subjective benefit depends on the faith of the hearer. The gospel was the same; the difference was faith. This has implications for preaching, hearing, and the means of grace: God''s word accomplishes its purpose, but human faith is the instrumental means by which its benefits are received.'),
  (3, 'For we which have believed do enter into rest, as he said, As I have sworn in my wrath, if they shall enter into my rest: although the works were finished from the foundation of the world.',
   'εἰσερχόμεθα γὰρ εἰς τὴν κατάπαυσιν οἱ πιστεύσαντες καθὼς εἴρηκεν ὡς ὤμοσα ἐν τῇ ὀργῇ μου εἰ εἰσελεύσονται εἰς τὴν κατάπαυσίν μου καίτοι τῶν ἔργων ἀπὸ καταβολῆς κόσμου γενηθέντων',
   'eiserchometha gar eis tēn katapausin hoi pisteusantes kathōs eirēken hōs ōmosa en tē orgē mou ei eiseleusontai eis tēn katapausin mou kaitoi tōn ergōn apo katabolēs kosmou genēthentōn',
   '''We which have believed do enter'' (eiserchometha hoi pisteusantes — we who have believed are entering; present tense: rest is entered now, by faith, not just in the future). The believing community is currently entering God''s rest — it is a present reality, not merely an eschatological hope. ''Although the works were finished from the foundation of the world'' — God''s rest has been available since creation; it is not something newly created but something eternally prepared, now entered by faith.',
   NULL),
  (4, 'For he spake in a certain place of the seventh day on this wise, And God did rest the seventh day from all his works.',
   'εἴρηκεν γάρ που περὶ τῆς ἑβδόμης οὕτως καὶ κατέπαυσεν ὁ θεὸς ἐν τῇ ἡμέρᾳ τῇ ἑβδόμῃ ἀπὸ πάντων τῶν ἔργων αὐτοῦ',
   'eirēken gar pou peri tēs hebdomēs houtōs kai katepausen ho theos en tē hēmera tē hebdomē apo pantōn tōn ergōn autou',
   'Quoting Genesis 2:2. ''God did rest the seventh day'' (katepausen ho theos en tē hēmera tē hebdomē — God ceased, rested on the seventh day). This establishes that God''s rest has existed since creation — it is a divine reality into which humans are invited to enter. God''s sabbath rest is not inactivity but the satisfaction of completed work. The seventh day of creation has no recorded evening (''and the evening and the morning'') — suggesting an open-ended, continuing divine rest that believers are invited to share.',
   NULL),
  (5, 'And in this place again, If they shall enter into my rest.',
   'καὶ ἐν τούτῳ πάλιν εἰ εἰσελεύσονται εἰς τὴν κατάπαυσίν μου',
   'kai en toutō palin ei eiseleusontai eis tēn katapausin mou',
   'The Psalm 95:11 oath is cited again: God swore the rebellious generation would not enter ''my rest.'' The juxtaposition of Genesis 2:2 (v.4) and Psalm 95:11 (v.5) creates the argument: God''s rest existed from creation, but the wilderness generation was excluded from it. This implies the rest is still available — it was not exhausted by the seventh day of creation or by entrance into Canaan.',
   NULL),
  (6, 'Seeing therefore it remaineth that some must enter therein, and they to whom it was first preached entered not in because of unbelief:',
   'ἐπεὶ οὖν ἀπολείπεται τινὰς εἰσελθεῖν εἰς αὐτήν καὶ οἱ πρότερον εὐαγγελισθέντες οὐκ εἰσῆλθον δι᾽ ἀπείθειαν',
   'epei oun apoleipetai tinas eiselthein eis autēn kai hoi proteron euangelisthentes ouk eisēlthon di apeitheian',
   '''It remaineth'' (apoleipetai — it is left over, it remains available). The logic is: God''s rest exists (Gen 2:2), the wilderness generation failed to enter (Ps 95), therefore the promise stands unfulfilled and open to others. ''They to whom it was first preached'' (hoi proteron euangelisthentes — those who were evangelized previously, the wilderness generation). ''Because of unbelief'' (di apeitheian — because of disobedience/unbelief; the same verdict as 3:19).',
   NULL),
  (7, 'Again, he limiteth a certain day, saying in David, To day, after so long a time; as it is said, To day if ye will hear his voice, harden not your hearts.',
   'πάλιν τινὰ ὁρίζει ἡμέραν σήμερον ἐν Δαυὶδ λέγων μετὰ τοσοῦτον χρόνον καθὼς εἴρηται σήμερον ἐὰν τῆς φωνῆς αὐτοῦ ἀκούσητε μὴ σκληρύνητε τὰς καρδίας ὑμῶν',
   'palin tina horizei hēmeran sēmeron en Dauid legōn meta tosouton chronon kathōs eirētai sēmeron ean tēs phōnēs autou akousēte mē sklērynēte tas kardias hymōn',
   '''He limiteth a certain day'' (tina horizei hēmeran — He designates, defines, sets a specific day; horizō is the root of ''horizon'' — to mark a boundary). ''Saying in David'' — Psalm 95 was written by David, centuries after Joshua. ''After so long a time'' (meta tosouton chronon) — if Joshua had fulfilled the promise of rest, why would David, writing hundreds of years later, still offer ''today'' as an opportunity? The continued offer proves the rest was never fully achieved through the conquest of Canaan. The word ''today'' (sēmeron) keeps the promise alive and urgent for each generation.',
   NULL),
  (8, 'For if Jesus had given them rest, then would he not afterward have spoken of another day.',
   'εἰ γὰρ αὐτοὺς Ἰησοῦς κατέπαυσεν οὐκ ἂν περὶ ἄλλης ἐλάλει μετὰ ταῦτα ἡμέρας',
   'ei gar autous Iēsous katepausen ouk an peri allēs elalei meta tauta hēmeras',
   '''Jesus'' here is the Greek form of ''Joshua'' (Iēsous — the same Greek name for both Joshua and Jesus). ''If Joshua had given them rest'' — if the conquest of Canaan under Joshua had fulfilled God''s rest-promise, David would not have spoken of ''another day'' centuries later. The fact that Psalm 95 still offers ''today'' proves that Joshua''s rest was only a type, a shadow, pointing forward to a greater rest. The name coincidence is significant: Joshua (Iēsous) led Israel into earthly Canaan; Jesus (Iēsous) leads His people into the true, heavenly rest.',
   NULL),
  (9, 'There remaineth therefore a rest to the people of God.',
   'ἄρα ἀπολείπεται σαββατισμὸς τῷ λαῷ τοῦ θεοῦ',
   'ara apoleipetai sabbatismos tō laō tou theou',
   '''There remaineth'' (apoleipetai — it is still left, it continues to stand). ''A rest'' (sabbatismos — a sabbath-rest, a sabbath-keeping). This word appears only here in the entire NT — it is the author''s own coinage or a rare term chosen deliberately to distinguish it from katapausis (rest/cessation used throughout chs.3-4). Sabbatismos implies not just cessation but celebration — the joyful keeping of God''s eternal sabbath. ''The people of God'' (tō laō tou theou) — the community of faith, the true Israel. The conclusion of the entire argument: God''s sabbath rest, available since creation, unfulfilled by Canaan or Joshua, is still open and waiting for the people of God to enter by faith.',
   'The sabbatismos (sabbath-rest) is the consummation of God''s creation purpose: humanity sharing in God''s own rest. This rest is entered by faith (v.3), characterized by cessation from self-effort (v.10), and ultimately realized in eschatological glory. It is simultaneously present (entered by faith now) and future (fully realized in the age to come).'),
  (10, 'For he that is entered into his rest, he also hath ceased from his own works, as God did from his.',
   'ὁ γὰρ εἰσελθὼν εἰς τὴν κατάπαυσιν αὐτοῦ καὶ αὐτὸς κατέπαυσεν ἀπὸ τῶν ἔργων αὐτοῦ ὥσπερ ἀπὸ τῶν ἰδίων ὁ θεός',
   'ho gar eiselthōn eis tēn katapausin autou kai autos katepausen apo tōn ergōn autou hōsper apo tōn idiōn ho theos',
   '''He that is entered into his rest'' (ho eiselthōn — the one who has entered; aorist participle pointing to a definitive act of entering). ''Hath ceased from his own works'' (katepausen apo tōn ergōn autou — has rested from his own works). ''As God did from his'' — the pattern is God''s own sabbath: as God rested from creation having completed His work, so the believer rests from self-effort having trusted in Christ''s completed work. ''His own works'' likely refers to the futile attempt to earn salvation through human effort — the believer ceases striving and rests in Christ''s finished work on the cross.',
   'This verse connects God''s sabbath rest to the doctrine of salvation by grace: entering rest means ceasing from one''s own works (self-righteous striving) and trusting in God''s completed work through Christ. The sabbath rest is thus a picture of justification by faith — the rest of the gospel.'),
  (11, 'Let us labour therefore to enter into that rest, lest any man fall after the same example of unbelief.',
   'σπουδάσωμεν οὖν εἰσελθεῖν εἰς ἐκείνην τὴν κατάπαυσιν ἵνα μὴ ἐν τῷ αὐτῷ τις ὑποδείγματι πέσῃ τῆς ἀπειθείας',
   'spoudasōmen oun eiselthein eis ekeinēn tēn katapausin hina mē en tō autō tis hypodeigmati pesē tēs apeitheias',
   '''Let us labour'' (spoudasōmen — let us be diligent, let us make every effort, let us be eager). The paradox is deliberate: we must ''labor'' to enter ''rest.'' The effort is not works-righteousness but the diligent, earnest pursuit of faith — fighting against the drift (2:1), the hardening (3:13), the unbelief (3:19) that would prevent entrance. ''The same example of unbelief'' (en tō autō hypodeigmati tēs apeitheias — in the same pattern of disobedience). The wilderness generation is the ''example'' (hypodeigma — a pattern, a warning model) to be avoided.',
   NULL),
  (12, 'For the word of God is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.',
   'ζῶν γὰρ ὁ λόγος τοῦ θεοῦ καὶ ἐνεργὴς καὶ τομώτερος ὑπὲρ πᾶσαν μάχαιραν δίστομον καὶ διϊκνούμενος ἄχρι μερισμοῦ ψυχῆς τε καὶ πνεύματος ἁρμῶν τε καὶ μυελῶν καὶ κριτικὸς ἐνθυμήσεων καὶ ἐννοιῶν καρδίας',
   'zōn gar ho logos tou theou kai energēs kai tomōteros hyper pasan machairan distomon kai diikneoumenos achri merismou psychēs te kai pneumatos harmōn te kai myelōn kai kritikos enthymēseōn kai ennoiōn kardias',
   '''Quick'' (zōn — living; the word of God is not dead text but a living entity). ''Powerful'' (energēs — active, effective, operative, energizing; the root of ''energy''). ''Sharper than any twoedged sword'' (tomōteros hyper pasan machairan distomon — more cutting than any double-mouthed sword). ''Piercing even to the dividing asunder of soul and spirit'' (diïkneoumenos achri merismou psychēs te kai pneumatos — penetrating to the point of separating soul and spirit). This does not teach that soul and spirit are normally separate parts but that God''s word can penetrate to the deepest level of human existence, distinguishing between what is merely natural (psychē) and what is truly spiritual (pneuma). ''Joints and marrow'' — the most hidden physical recesses. ''Discerner'' (kritikos — able to judge, able to discern; the root of ''critic''). God''s word judges the ''thoughts'' (enthymēseōn — reflections, deliberations) and ''intents'' (ennoiōn — purposes, motives) of the heart.',
   'This verse describes the penetrating, exposing, judging power of God''s word. It functions as a surgical instrument that exposes what is hidden, reveals motives, and distinguishes genuine faith from pretense. In context, the word of God — particularly the Psalm 95 warning — is penetrating the readers'' hearts, exposing whether their faith is genuine or counterfeit. No one can hide from God''s word.'),
  (13, 'Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.',
   'καὶ οὐκ ἔστιν κτίσις ἀφανὴς ἐνώπιον αὐτοῦ πάντα δὲ γυμνὰ καὶ τετραχηλισμένα τοῖς ὀφθαλμοῖς αὐτοῦ πρὸς ὃν ἡμῖν ὁ λόγος',
   'kai ouk estin ktisis aphanēs enōpion autou panta de gymna kai tetrachēlismena tois ophthalmois autou pros hon hēmin ho logos',
   '''Any creature'' (ktisis — any created thing; nothing in all creation is hidden). ''Not manifest'' (aphanēs — invisible, hidden). ''Naked'' (gymna — bare, unclothed, exposed). ''Opened'' (tetrachēlismena — laid bare, with the neck bent back in exposure; the word may derive from trachēlos, ''neck,'' suggesting an animal bent back for sacrifice with its throat exposed, or a wrestler thrown back by the neck — either way, total vulnerability and exposure). ''Him with whom we have to do'' (pros hon hēmin ho logos — literally ''to whom is our account/word''; we must give an account to this God). The shift from ''the word of God'' (v.12) to ''him'' (v.13) is significant — the word leads us to the Person behind it.',
   'This verse moves from the instrumentality of God''s word to the omniscience of God Himself. The God before whom we stand is the God who sees all — no thought, motive, or action escapes His gaze. This is the ultimate foundation of the warning: we cannot hide unbelief from the God who sees everything.'),
  (14, 'Seeing then that we have a great high priest, that is passed into the heavens, Jesus the Son of God, let us hold fast our profession.',
   'ἔχοντες οὖν ἀρχιερέα μέγαν διεληλυθότα τοὺς οὐρανούς Ἰησοῦν τὸν υἱὸν τοῦ θεοῦ κρατῶμεν τῆς ὁμολογίας',
   'echontes oun archierea megan dielēlythota tous ouranous Iēsoun ton hyion tou theou kratōmen tēs homologias',
   '''A great high priest'' (archierea megan — a high priest who is great; the adjective ''great'' distinguishes Christ from all Levitical high priests). ''Passed into the heavens'' (dielēlythota tous ouranous — having passed through the heavens; perfect participle: He has permanently entered the heavenly sanctuary and remains there). As the OT high priest passed through the tabernacle curtain into the Holy of Holies on the Day of Atonement, so Christ has passed through the heavens into God''s very presence. ''Jesus the Son of God'' — both His human name (Jesus) and His divine title (Son of God) are given, combining the humanity of chapter 2 with the deity of chapter 1. ''Hold fast our profession'' (kratōmen tēs homologias — let us grip firmly our confession).',
   'This verse is the hinge of Hebrews, transitioning from the warning sections (chs.1-4) to the high priest exposition (chs.5-10). Christ''s high priesthood is the answer to the problem of perseverance: we can hold fast because we have a great high priest who has already entered heaven on our behalf.'),
  (15, 'For we have not an high priest which cannot be touched with the feeling of our infirmities; but was in all points tempted like as we are, yet without sin.',
   'οὐ γὰρ ἔχομεν ἀρχιερέα μὴ δυνάμενον συμπαθῆσαι ταῖς ἀσθενείαις ἡμῶν πεπειρασμένον δὲ κατὰ πάντα καθ᾽ ὁμοιότητα χωρὶς ἁμαρτίας',
   'ou gar echomen archierea mē dynamenon sympathēsai tais astheneiais hēmōn pepeirasmenon de kata panta kath homoiotēta chōris hamartias',
   '''Cannot be touched with the feeling'' (mē dynamenon sympathēsai — not unable to sympathize, to suffer with, to feel along with; sympathy in the deepest sense — not mere pity from outside but fellow-feeling from shared experience). ''Our infirmities'' (tais astheneiais hēmōn — our weaknesses, our frailties). ''In all points tempted like as we are'' (pepeirasmenon kata panta kath homoiotēta — having been tested in every respect according to likeness). Christ experienced the full range of human temptation: hunger, exhaustion, rejection, loneliness, grief, physical pain, the allure of power, the temptation to avoid the cross. ''Yet without sin'' (chōris hamartias — apart from sin, separate from sin). He was genuinely tempted but never yielded. His sinlessness does not diminish His sympathy — it intensifies it: He felt the full force of temptation without the relief of giving in.',
   'This verse is the foundation of Christ''s sympathetic high priesthood. His temptation was real (not theatrical), comprehensive (''in all points''), and analogous to ours (''like as we are''), yet He remained sinless. The sinlessness is not a disqualification for sympathy but its perfection: only one who has never surrendered to temptation knows its full force. The soldier who fights to the end knows more about the battle than the one who surrenders early.'),
  (16, 'Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.',
   'προσερχώμεθα οὖν μετὰ παρρησίας τῷ θρόνῳ τῆς χάριτος ἵνα λάβωμεν ἔλεος καὶ χάριν εὕρωμεν εἰς εὔκαιρον βοήθειαν',
   'proserchōmetha oun meta parrēsias tō thronō tēs charitos hina labōmen eleos kai charin heurōmen eis eukairon boētheian',
   '''Come boldly'' (proserchōmetha meta parrēsias — let us approach with confidence/boldness; the same parrēsia from 3:6). ''Throne of grace'' (tō thronō tēs charitos — the throne characterized by grace). The throne of the universe — the seat of sovereign, omnipotent power — is a throne of grace for believers because their High Priest sits at God''s right hand. What would otherwise be a throne of terrifying judgment becomes a fountain of grace. ''Obtain mercy'' (labōmen eleos — receive mercy for past failures). ''Find grace'' (charin heurōmen — discover grace for present and future needs). ''In time of need'' (eis eukairon boētheian — for well-timed help, for timely assistance; eukairos means ''at the right moment'' — God''s grace arrives precisely when needed, not before or after).',
   'This verse is among the most beloved in Hebrews and the entire NT. The invitation to approach God''s throne boldly is grounded in Christ''s sympathetic high priesthood. Two gifts are promised: mercy (eleos — for sins committed) and grace (charis — for needs anticipated). The throne of the sovereign God becomes accessible because of the mediating work of Jesus the High Priest. This is the practical result of the entire doctrinal argument of chapters 1-4.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Hebrews' AND c.chapter_number = 4;

-- Step 3: Insert word studies
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('σαββατισμός', 'sabbatismos', 'G4520', 'A sabbath-rest, a sabbath-keeping, a celebration of sabbath — a NT hapax (only in v.9). Distinguished from katapausis (rest/cessation) used throughout chs.3-4. Sabbatismos adds the dimension of joyful celebration to the concept of rest: not merely stopping but worshipping, not merely ceasing but celebrating. It points to the eschatological reality of sharing in God''s own eternal sabbath — the final rest toward which all of history moves.', 1),
  ('ἐνεργής', 'energēs', 'G1756', 'Active, effective, operative, powerful in operation — from en (in) + ergon (work). In v.12 God''s word is energēs — it actually accomplishes what it says, it works powerfully in those who hear it. The word emphasizes not potential power but actual, working power — God''s word is not dormant but always at work, always producing effects, always achieving God''s purposes (cf. Isa 55:11).', 2),
  ('τομώτερος', 'tomōteros', 'G5114', 'Sharper, more cutting — the comparative of tomos (cutting, sharp), from temnō (to cut). A NT hapax. In v.12 God''s word is ''sharper than any two-edged sword'' — it cuts deeper and more precisely than any physical blade, penetrating to the deepest recesses of human existence. The word emphasizes the penetrating, exposing, dividing power of divine truth.', 3),
  ('συμπαθέω', 'sympatheō', 'G4834', 'To suffer with, to feel together with, to sympathize — from syn (with) + pathēo (to suffer, to experience). In v.15 our high priest is able to sympathēsai with our weaknesses — He does not observe from a distance but feels along with us because He Himself experienced the full range of human weakness and temptation. This is empathy rooted in shared experience, not mere intellectual understanding.', 4),
  ('παρρησία', 'parrēsia', 'G3954', 'Boldness, confidence, freedom of speech, open courage — from pan (all) + rhēsis (speech). In v.16 believers are invited to approach God''s throne meta parrēsias — with bold confidence, with open freedom. This boldness is not presumption (it is grounded in Christ''s priestly work) nor timidity (it recognizes the full access Christ has secured). Parrēsia in Hebrews is always christologically grounded: we are bold because of who our High Priest is and what He has done.', 5),
  ('εὔκαιρος', 'eukairos', 'G2121', 'Well-timed, seasonable, opportune, at the right moment — from eu (good) + kairos (time, season, critical moment). In v.16 God''s help is eukairon — it arrives at precisely the right time, neither too early nor too late. God''s grace is not generic but specific, tailored to the moment of need. The word reflects the biblical understanding that God acts in history at decisive moments (kairos) rather than merely through the passage of time (chronos).', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 4
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 9
    WHEN 2 THEN 12
    WHEN 3 THEN 12
    WHEN 4 THEN 15
    WHEN 5 THEN 16
    WHEN 6 THEN 16
  END;

-- Step 4: Insert cross-references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Hebrews 3:11-19', 1),
  (2, 'Romans 10:16-17', 2),
  (2, 'James 1:22-25', 3),
  (3, 'Hebrews 3:11', 4),
  (3, 'Psalm 95:11', 5),
  (4, 'Genesis 2:2', 6),
  (4, 'Exodus 20:11', 7),
  (7, 'Psalm 95:7-8', 8),
  (8, 'Joshua 21:43-45', 9),
  (8, 'Joshua 22:4', 10),
  (9, 'Revelation 14:13', 11),
  (10, 'Genesis 2:2-3', 12),
  (10, 'Ephesians 2:8-9', 13),
  (11, 'Hebrews 3:12-13', 14),
  (11, '2 Peter 1:10', 15),
  (12, 'Isaiah 55:11', 16),
  (12, 'Jeremiah 23:29', 17),
  (12, 'Ephesians 6:17', 18),
  (12, 'Revelation 1:16', 19),
  (13, 'Psalm 139:1-4', 20),
  (13, 'Proverbs 15:11', 21),
  (14, 'Hebrews 3:1', 22),
  (14, 'Hebrews 7:26', 23),
  (14, 'Hebrews 10:23', 24),
  (15, 'Hebrews 2:17-18', 25),
  (15, 'Matthew 4:1-11', 26),
  (15, '2 Corinthians 5:21', 27),
  (15, '1 Peter 2:22', 28),
  (16, 'Hebrews 10:19-22', 29),
  (16, 'Ephesians 2:18', 30),
  (16, 'Ephesians 3:12', 31),
  (16, 'Romans 5:2', 32)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Hebrews' AND c.chapter_number = 4
  AND v.verse_number = cr.verse_number;
