-- ═══════════════════════════════════════════════════
-- 2 CORINTHIANS CHAPTER 7 — Godly Sorrow and Joyful Reunion
-- 16 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 7,
  '2 Corinthians 7 completes the first major section of the epistle with a burst of joy and relief. Paul begins by drawing the conclusion from 6:14-18: ''Having therefore these promises, dearly beloved, let us cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of God'' (v.1). He renews his emotional appeal: ''Receive us; we have wronged no man, we have corrupted no man, we have defrauded no man'' (v.2). Paul resumes the travel narrative broken off at 2:13, recounting his arrival in Macedonia: ''our flesh had no rest, but we were troubled on every side; without were fightings, within were fears'' (v.5). Then the turning point: ''God, that comforteth those that are cast down, comforted us by the coming of Titus'' (v.6). Titus brought good news of the Corinthians'' repentance, and Paul erupts with joy: ''I rejoiced the more'' (v.7). The chapter''s theological center is the distinction between godly and worldly sorrow: ''godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death'' (v.10). Paul catalogs the fruits of their repentance: ''what carefulness … what clearing of yourselves … what indignation … what fear … what vehement desire … what zeal … what revenge!'' (v.11). The chapter closes with Paul''s complete confidence restored: ''I have confidence in you in all things'' (v.16).',
  'Godly Sorrow, Repentance, and Restored Joy',
  'μετάνοια (metanoia)',
  'Repentance — a change of mind that leads to a change of direction. From meta (change) + noeō (to think). Not merely regret or sorrow but a fundamental reorientation of thought, attitude, and behavior. Godly sorrow produces this kind of repentance; worldly sorrow produces only death.',
  '["The Call to Holiness (vv.1-4): Having therefore these promises dearly beloved let us cleanse ourselves from all filthiness of the flesh and spirit perfecting holiness in the fear of God; receive us we have wronged no man we have corrupted no man we have defrauded no man; I speak not this to condemn you for I have said before that ye are in our hearts to die and live with you; great is my boldness of speech toward you great is my glorying of you I am filled with comfort I am exceeding joyful in all our tribulation","Comfort through the Coming of Titus (vv.5-7): For when we were come into Macedonia our flesh had no rest but we were troubled on every side without were fightings within were fears; nevertheless God that comforteth those that are cast down comforted us by the coming of Titus; and not by his coming only but by the consolation wherewith he was comforted in you when he told us your earnest desire your mourning your fervent mind toward me so that I rejoiced the more","Godly Sorrow versus Worldly Sorrow (vv.8-12): For though I made you sorry with a letter I do not repent though I did repent for I perceive that the same epistle hath made you sorry though it were but for a season; now I rejoice not that ye were made sorry but that ye sorrowed to repentance for ye were made sorry after a godly manner that ye might receive damage by us in nothing; for godly sorrow worketh repentance to salvation not to be repented of but the sorrow of the world worketh death; for behold this selfsame thing that ye sorrowed after a godly sort what carefulness it wrought in you yea what clearing of yourselves yea what indignation yea what fear yea what vehement desire yea what zeal yea what revenge","Complete Joy and Confidence (vv.13-16): Therefore we were comforted in your comfort yea and exceedingly the more joyed we for the joy of Titus because his spirit was refreshed by you all; for if I have boasted any thing to him of you I am not ashamed but as we spake all things to you in truth even so our boasting which I made before Titus is found a truth; and his inward affection is more abundant toward you whilst he remembereth the obedience of you all how with fear and trembling ye received him; I rejoice therefore that I have confidence in you in all things"]'
FROM books b WHERE b.name = '2 Corinthians';

-- Step 2: Insert all 16 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1, 'Having therefore these promises, dearly beloved, let us cleanse ourselves from all filthiness of the flesh and spirit, perfecting holiness in the fear of God.',
   'ταύτας οὖν ἔχοντες τὰς ἐπαγγελίας ἀγαπητοί καθαρίσωμεν ἑαυτοὺς ἀπὸ παντὸς μολυσμοῦ σαρκὸς καὶ πνεύματος ἐπιτελοῦντες ἁγιωσύνην ἐν φόβῳ θεοῦ',
   'tautas oun echontes tas epangelias agapētoi katharisōmen heautous apo pantos molysmou sarkos kai pneumatos epitelountes hagiōsynēn en phobō theou',
   '''These promises'' — the promises of 6:16-18 (God dwelling in them, being their Father). ''Cleanse ourselves'' (katharisōmen heautous — let us purify ourselves; aorist subjunctive: a decisive act of self-purification). ''Filthiness'' (molysmou — defilement, contamination). ''Flesh and spirit'' — the totality of the person; defilement can be physical or spiritual. ''Perfecting holiness'' (epitelountes hagiōsynēn — bringing holiness to completion; present participle: an ongoing process). ''Fear of God'' — reverential awe, not slavish terror. Holiness is both a definitive cleansing (aorist) and an ongoing completion (present).',
   'This verse balances the indicative (what God has done: given promises) with the imperative (what believers must do: cleanse themselves). The promises of divine indwelling and fatherhood (6:16-18) do not produce passivity but motivate active holiness. ''Perfecting holiness'' (epitelountes hagiōsynēn) uses the present participle, indicating that holiness is a lifelong process of being brought to completion. The phrase ''filthiness of flesh and spirit'' acknowledges that sin operates on both physical and spiritual levels — external behaviors and internal attitudes both require purification.'),
  (2, 'Receive us; we have wronged no man, we have corrupted no man, we have defrauded no man.',
   'χωρήσατε ἡμᾶς οὐδένα ἠδικήσαμεν οὐδένα ἐφθείραμεν οὐδένα ἐπλεονεκτήσαμεν',
   'chōrēsate hēmas oudena ēdikēsamen oudena ephtheiramen oudena epleonektēsamen',
   '''Receive us'' (chōrēsate — make room for us; open your hearts to us; cf. 6:13). ''Wronged'' (ēdikēsamen — treated unjustly). ''Corrupted'' (ephtheiramen — ruined, led astray morally). ''Defrauded'' (epleonektēsamen — taken advantage of, exploited for gain). Three denials of malpractice, each intensifying: injustice, moral corruption, financial exploitation. Paul''s opponents apparently charged him with all three.',
   NULL),
  (3, 'I speak not this to condemn you: for I have said before, that ye are in our hearts to die and live with you.',
   'οὐ πρὸς κατάκρισιν λέγω προείρηκα γὰρ ὅτι ἐν ταῖς καρδίαις ἡμῶν ἐστε εἰς τὸ συναποθανεῖν καὶ συζῆν',
   'ou pros katakrisin legō proeirēka gar hoti en tais kardiais hēmōn este eis to synapothanein kai syzēn',
   '''Not to condemn'' (ou pros katakrisin — not for the purpose of condemnation). ''In our hearts'' (en tais kardiais hēmōn — you are in our hearts; they occupy Paul''s deepest affections). ''To die and live with you'' (synapothanein kai syzēn — to die together and to live together; the compound syn- prefix: with you). Paul''s love is indestructible: neither death nor life can separate the Corinthians from his heart. This echoes Ruth 1:16-17 and anticipates Romans 8:38-39.',
   NULL),
  (4, 'Great is my boldness of speech toward you, great is my glorying of you: I am filled with comfort, I am exceeding joyful in all our tribulation.',
   'πολλή μοι παρρησία πρὸς ὑμᾶς πολλή μοι καύχησις ὑπὲρ ὑμῶν πεπλήρωμαι τῇ παρακλήσει ὑπερπερισσεύομαι τῇ χαρᾷ ἐπὶ πάσῃ τῇ θλίψει ἡμῶν',
   'pollē moi parrēsia pros hymas pollē moi kauchēsis hyper hymōn peplērōmai tē paraklēsei hyperperisseuomai tē chara epi pasē tē thlipsei hēmōn',
   '''Boldness'' (parrēsia — frank, open speech). ''Glorying'' (kauchēsis — boasting, pride). ''Filled with comfort'' (peplērōmai tē paraklēsei — I have been filled to the brim with encouragement; perfect tense: a settled state of fullness). ''Exceeding joyful'' (hyperperisseuomai tē chara — I am overflowing beyond measure with joy; a double-compound verb: hyper + perisseuō — super-abounding). ''In all our tribulation'' — joy does not eliminate tribulation but overflows in the midst of it. This is the emotional high point of the letter so far.',
   NULL),
  (5, 'For, when we were come into Macedonia, our flesh had no rest, but we were troubled on every side; without were fightings, within were fears.',
   'καὶ γὰρ ἐλθόντων ἡμῶν εἰς Μακεδονίαν οὐδεμίαν ἔσχηκεν ἄνεσιν ἡ σὰρξ ἡμῶν ἀλλ᾿ ἐν παντὶ θλιβόμενοι ἔξωθεν μάχαι ἔσωθεν φόβοι',
   'kai gar elthontōn hēmōn eis Makedonian oudemian eschēken anesin hē sarx hēmōn all'' en panti thlibomenoi exōthen machai esōthen phoboi',
   '''No rest'' (oudemian anesin — no relief, no relaxation; resuming the narrative from 2:13). ''Troubled on every side'' (en panti thlibomenoi — afflicted in every way). ''Fightings'' (machai — battles, conflicts; external opposition from people). ''Fears'' (phoboi — internal anxieties, dreads). Paul was under siege from without and within simultaneously. The honest admission of fear is striking: apostolic courage is not the absence of fear but faithfulness despite it.',
   NULL),
  (6, 'Nevertheless God, that comforteth those that are cast down, comforted us by the coming of Titus;',
   'ἀλλ᾿ ὁ παρακαλῶν τοὺς ταπεινοὺς παρεκάλεσεν ἡμᾶς ὁ θεὸς ἐν τῇ παρουσίᾳ Τίτου',
   'all'' ho parakalōn tous tapeinous parekalesen hēmas ho theos en tē parousia Titou',
   '''Comforteth those that are cast down'' (parakalōn tous tapeinous — the one who encourages the humble/downcast; cf. 1:3-4, God is consistently the ''God of all comfort''). ''Coming'' (parousia — presence, arrival; the same word used for Christ''s second coming, here used simply for Titus'' arrival). God used a human instrument (Titus) to deliver divine comfort. The principle of 1:4 is enacted: God comforts Paul through the human community.',
   NULL),
  (7, 'And not by his coming only, but by the consolation wherewith he was comforted in you, when he told us your earnest desire, your mourning, your fervent mind toward me; so that I rejoiced the more.',
   'οὐ μόνον δὲ ἐν τῇ παρουσίᾳ αὐτοῦ ἀλλὰ καὶ ἐν τῇ παρακλήσει ᾗ παρεκλήθη ἐφ᾿ ὑμῖν ἀναγγέλλων ἡμῖν τὴν ὑμῶν ἐπιπόθησιν τὸν ὑμῶν ὀδυρμὸν τὸν ὑμῶν ζῆλον ὑπὲρ ἐμοῦ ὥστε με μᾶλλον χαρῆναι',
   'ou monon de en tē parousia autou alla kai en tē paraklēsei hē pareklēthē eph'' hymin anangellōn hēmin tēn hymōn epipothēsin ton hymōn odyrmon ton hymōn zēlon hyper emou hōste me mallon charēnai',
   '''Consolation wherewith he was comforted in you'' — Titus himself had been comforted by the Corinthians'' response; he transmitted that comfort to Paul. The chain of comfort (1:4) continues. ''Earnest desire'' (epipothēsin — longing, yearning). ''Mourning'' (odyrmon — grief, lamentation; genuine sorrow over their wrongdoing). ''Fervent mind'' (zēlon — zeal, passionate concern). Three responses: longing for Paul, grief over sin, and zeal for reconciliation. Paul''s joy doubles.',
   NULL),
  (8, 'For though I made you sorry with a letter, I do not repent, though I did repent: for I perceive that the same epistle hath made you sorry, though it were but for a season.',
   'ὅτι εἰ καὶ ἐλύπησα ὑμᾶς ἐν τῇ ἐπιστολῇ οὐ μεταμέλομαι εἰ καὶ μετεμελόμην βλέπω γὰρ ὅτι ἡ ἐπιστολὴ ἐκείνη εἰ καὶ πρὸς ὥραν ἐλύπησεν ὑμᾶς',
   'hoti ei kai elypēsa hymas en tē epistolē ou metamelomai ei kai metemelomēn blepō gar hoti hē epistolē ekeinē ei kai pros hōran elypēsen hymas',
   '''I do not repent'' (ou metamelomai — I am not sorry now; metamelomai means to feel regret after the fact). ''Though I did repent'' (ei kai metemelomēn — even though I was sorry at the time). Paul experienced genuine regret after sending the severe letter, fearing he had been too harsh. But the fruit (their repentance) vindicated the pain. ''For a season'' (pros hōran — for an hour, temporarily). The sorrow was brief; the benefit is lasting.',
   NULL),
  (9, 'Now I rejoice, not that ye were made sorry, but that ye sorrowed to repentance: for ye were made sorry after a godly manner, that ye might receive damage by us in nothing.',
   'νῦν χαίρω οὐχ ὅτι ἐλυπήθητε ἀλλ᾿ ὅτι ἐλυπήθητε εἰς μετάνοιαν ἐλυπήθητε γὰρ κατὰ θεόν ἵνα ἐν μηδενὶ ζημιωθῆτε ἐξ ἡμῶν',
   'nyn chairō ouch hoti elypēthēte all'' hoti elypēthēte eis metanoian elypēthēte gar kata theon hina en mēdeni zēmiōthēte ex hēmōn',
   '''Sorrowed to repentance'' (elypēthēte eis metanoian — your grief led to repentance; the sorrow was not the end but the means). ''After a godly manner'' (kata theon — according to God, in God''s way). ''Receive damage by us in nothing'' (en mēdeni zēmiōthēte — suffer loss in nothing). Godly sorrow is purposeful: it leads somewhere (to repentance) and causes no ultimate damage. Paul''s severe letter produced temporary pain but permanent benefit.',
   NULL),
  (10, 'For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.',
   'ἡ γὰρ κατὰ θεὸν λύπη μετάνοιαν εἰς σωτηρίαν ἀμεταμέλητον κατεργάζεται ἡ δὲ τοῦ κόσμου λύπη θάνατον κατεργάζεται',
   'hē gar kata theon lypē metanoian eis sōtērian ametamelēton katergazetai hē de tou kosmou lypē thanaton katergazetai',
   '''Godly sorrow'' (kata theon lypē — grief that is according to God, oriented toward God). ''Repentance to salvation'' (metanoian eis sōtērian — repentance leading to salvation/deliverance). ''Not to be repented of'' (ametamelēton — without regret; this repentance produces no buyer''s remorse). ''Sorrow of the world'' (tou kosmou lypē — worldly grief: remorse, self-pity, shame without transformation). ''Worketh death'' (thanaton katergazetai — produces death; worldly sorrow leads to despair and destruction). Two sorrows, two outcomes: godly sorrow → repentance → salvation; worldly sorrow → death.',
   'This verse contains one of the most important distinctions in pastoral theology. Godly sorrow is grief over sin that leads to repentance and transformation — it looks toward God and forward to change. Worldly sorrow is grief over consequences (getting caught, losing status, feeling shame) that produces no transformation — it looks inward and spirals into despair. Judas had worldly sorrow (Matt 27:3-5: remorse leading to suicide); Peter had godly sorrow (Luke 22:62: tears leading to restoration). The test of sorrow''s quality is its fruit: does it produce repentance or death?'),
  (11, 'For behold this selfsame thing, that ye sorrowed after a godly sort, what carefulness it wrought in you, yea, what clearing of yourselves, yea, what indignation, yea, what fear, yea, what vehement desire, yea, what zeal, yea, what revenge! In all things ye have approved yourselves to be clear in this matter.',
   'ἰδοὺ γὰρ αὐτὸ τοῦτο τὸ κατὰ θεὸν λυπηθῆναι ὑμᾶς πόσην κατειργάσατο ὑμῖν σπουδήν ἀλλὰ ἀπολογίαν ἀλλὰ ἀγανάκτησιν ἀλλὰ φόβον ἀλλὰ ἐπιπόθησιν ἀλλὰ ζῆλον ἀλλὰ ἐκδίκησιν ἐν παντὶ συνεστήσατε ἑαυτοὺς ἁγνοὺς εἶναι ἐν τῷ πράγματι',
   'idou gar auto touto to kata theon lypēthēnai hymas posēn kateirgasato hymin spoudēn alla apologian alla aganaktēsin alla phobon alla epipothēsin alla zēlon alla ekdikēsin en panti synestēsate heautous hagnous einai en tō pragmati',
   'Seven fruits of godly sorrow, each introduced by ''yea'' (alla — but rather, indeed): (1) ''Carefulness'' (spoudēn — earnestness, diligence). (2) ''Clearing'' (apologian — self-defense, vindication; they cleared themselves of complicity). (3) ''Indignation'' (aganaktēsin — righteous anger at the wrong committed). (4) ''Fear'' (phobon — reverential fear of God). (5) ''Vehement desire'' (epipothēsin — intense longing for Paul). (6) ''Zeal'' (zēlon — passionate concern for righteousness). (7) ''Revenge'' (ekdikēsin — justice, the punishment of the wrongdoer). ''Approved yourselves clear'' (hagnous — innocent, pure). Seven is the number of completeness: their repentance was thorough.',
   NULL),
  (12, 'Wherefore, though I wrote unto you, I did it not for his cause that had done the wrong, nor for his cause that suffered wrong, but that our care for you in the sight of God might appear unto you.',
   'ἄρα εἰ καὶ ἔγραψα ὑμῖν οὐχ εἵνεκεν τοῦ ἀδικήσαντος οὐδὲ εἵνεκεν τοῦ ἀδικηθέντος ἀλλ᾿ εἵνεκεν τοῦ φανερωθῆναι τὴν σπουδὴν ὑμῶν τὴν ὑπὲρ ἡμῶν πρὸς ὑμᾶς ἐνώπιον τοῦ θεοῦ',
   'ara ei kai egrapsa hymin ouch heineken tou adikēsantos oude heineken tou adikēthentos all'' heineken tou phanerōthēnai tēn spoudēn hymōn tēn hyper hēmōn pros hymas enōpion tou theou',
   '''Not for his cause that had done the wrong'' — the offender''s punishment was not the primary aim. ''Nor for his cause that suffered wrong'' — Paul''s own vindication was not the chief goal either. ''That our care for you might appear'' — the deeper purpose was relational: to make visible, before God, the Corinthians'' earnest care for Paul. The severe letter was ultimately about revealing and restoring the relationship between apostle and church.',
   NULL),
  (13, 'Therefore we were comforted in your comfort: yea, and exceedingly the more joyed we for the joy of Titus, because his spirit was refreshed by you all.',
   'διὰ τοῦτο παρακεκλήμεθα ἐπὶ δὲ τῇ παρακλήσει ἡμῶν περισσοτέρως μᾶλλον ἐχάρημεν ἐπὶ τῇ χαρᾷ Τίτου ὅτι ἀναπέπαυται τὸ πνεῦμα αὐτοῦ ἀπὸ πάντων ὑμῶν',
   'dia touto parakeklēmetha epi de tē paraklēsei hēmōn perissoterōs mallon echarēmen epi tē chara Titou hoti anapepautai to pneuma autou apo pantōn hymōn',
   '''Comforted in your comfort'' — Paul''s comfort is drawn from the Corinthians'' comfort; joy is shared and multiplied. ''Spirit was refreshed'' (anapepautai to pneuma — his spirit has been refreshed, rested; perfect tense: the refreshment continues). Titus'' joy was so contagious that it doubled Paul''s own. The chain of comfort from 1:3-7 reaches its practical demonstration here: God comforts Titus through the Corinthians, and Titus comforts Paul.',
   NULL),
  (14, 'For if I have boasted any thing to him of you, I am not ashamed; but as we spake all things to you in truth, even so our boasting, which I made before Titus, is found a truth.',
   'ὅτι εἴ τι αὐτῷ ὑπὲρ ὑμῶν κεκαύχημαι οὐ κατῃσχύνθην ἀλλ᾿ ὡς πάντα ἐν ἀληθείᾳ ἐλαλήσαμεν ὑμῖν οὕτως καὶ ἡ καύχησις ἡμῶν ἡ ἐπὶ Τίτου ἀλήθεια ἐγενήθη',
   'hoti ei ti autō hyper hymōn kekauchēmai ou katēschynthēn all'' hōs panta en alētheia elalēsamen hymin houtōs kai hē kauchēsis hēmōn hē epi Titou alētheia egenēthē',
   '''Boasted'' (kekauchēmai — I have boasted; perfect tense: Paul had made statements about the Corinthians'' character to Titus). ''Not ashamed'' — the Corinthians'' response vindicated Paul''s boasting. ''Found a truth'' (alētheia egenēthē — proved to be truth). Paul''s words to Titus about the Corinthians were confirmed by their repentance. His consistency is proven: he speaks truth to the Corinthians and truth about them.',
   NULL),
  (15, 'And his inward affection is more abundant toward you, whilst he remembereth the obedience of you all, how with fear and trembling ye received him.',
   'καὶ τὰ σπλάγχνα αὐτοῦ περισσοτέρως εἰς ὑμᾶς ἐστιν ἀναμιμνῃσκομένου τὴν πάντων ὑμῶν ὑπακοήν ὡς μετὰ φόβου καὶ τρόμου ἐδέξασθε αὐτόν',
   'kai ta splanchna autou perissoterōs eis hymas estin anamimnēskomenou tēn pantōn hymōn hypakoēn hōs meta phobou kai tromou edexasthe auton',
   '''Inward affection'' (splanchna — deep feelings, bowels of compassion). ''More abundant'' (perissoterōs — overflowing). ''Obedience'' (hypakoēn — their responsive obedience to apostolic instruction). ''Fear and trembling'' (phobou kai tromou — not terrorized but deeply reverent; the phrase indicates serious, humble reception). Titus''s love for the Corinthians deepened through experiencing their repentance firsthand.',
   NULL),
  (16, 'I rejoice therefore that I have confidence in you in all things.',
   'χαίρω ὅτι ἐν παντὶ θαρρῶ ἐν ὑμῖν',
   'chairō hoti en panti tharrō en hymin',
   '''I rejoice'' (chairō — simple, direct joy). ''Confidence'' (tharrō — I am confident, I am bold; cf. 5:6, 8). ''In all things'' (en panti — in every respect). The chapter ends where it began (v.4): with overflowing joy and confidence. The relationship between Paul and the Corinthians is fully restored. This verse also serves as the transition to chapters 8-9, where Paul will ask the Corinthians to demonstrate their restored confidence through generous giving.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 7;

-- Step 3: Word studies for key verses
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 holiness
  ('ἁγιωσύνη', 'hagiōsynē', 'G42', 'Holiness, sanctification — the quality of being set apart for God. Distinguished from hagiasmos (the process of sanctification) and hagiotēs (the attribute of holiness). Hagiōsynē is holiness as a moral quality being progressively brought to completion (epitelountes — perfecting).', 1),
  ('μολυσμός', 'molysmos', 'G3436', 'Defilement, contamination, pollution — from molynō (to stain, to soil). Found only here in the NT. The image is of a clean garment stained or a pure vessel contaminated. Believers are to actively remove every source of contamination from both body and spirit.', 2),
  -- v.10 godly sorrow / repentance
  ('μετάνοια', 'metanoia', 'G3341', 'Repentance — from meta (change) + noeō (to think, to perceive). A change of mind that leads to a change of life. Not merely feeling sorry but fundamentally reorienting one''s thinking, values, and direction. Godly sorrow produces this genuine repentance; worldly sorrow produces only regret without transformation.', 3),
  ('ἀμεταμέλητος', 'ametamelētos', 'G278', 'Not to be repented of, without regret — from a (not) + metamelomai (to feel regret afterwards). The repentance produced by godly sorrow has no buyer''s remorse. You never look back and wish you hadn''t repented. Contrast worldly sorrow, which is all regret with no change.', 4),
  -- v.11 seven fruits
  ('σπουδή', 'spoudē', 'G4710', 'Earnestness, diligence, eagerness, haste — the first of seven fruits of godly sorrow. From speudō (to hasten). The Corinthians moved from apathy to urgency. Genuine repentance is not sluggish but energetic, producing immediate and eager response.', 5),
  ('ἐκδίκησις', 'ekdikēsis', 'G1557', 'Punishment, vindication, justice — from ek (out) + dikē (justice). The seventh and climactic fruit: the Corinthians not only felt sorry but administered justice against the offender. Repentance without corresponding action is incomplete; godly sorrow produces both inner transformation and outer correction.', 6)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 7
  AND v.verse_number = CASE ws.word_order
    WHEN 1 THEN 1 WHEN 2 THEN 1
    WHEN 3 THEN 10 WHEN 4 THEN 10
    WHEN 5 THEN 11 WHEN 6 THEN 11
  END;

-- Step 4: Cross references
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v.1 cleanse ourselves / perfecting holiness
  (1, '1 John 3:3', 1),
  (1, 'Hebrews 12:14', 2),
  (1, 'James 4:8', 3),
  -- v.5 no rest in Macedonia
  (5, '2 Corinthians 2:13', 4),
  (5, '2 Corinthians 4:8-9', 5),
  -- v.6 God comforts the cast down
  (6, '2 Corinthians 1:3-4', 6),
  (6, 'Psalm 34:18', 7),
  -- v.10 godly sorrow vs worldly sorrow
  (10, 'Matthew 27:3-5', 8),
  (10, 'Luke 22:61-62', 9),
  (10, 'Psalm 51:17', 10),
  (10, 'Acts 11:18', 11),
  -- v.11 seven fruits of repentance
  (11, 'Luke 3:8', 12),
  (11, 'Acts 26:20', 13),
  -- v.16 confidence
  (16, '2 Thessalonians 3:4', 14),
  (16, 'Philemon 1:21', 15)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Corinthians' AND c.chapter_number = 7
  AND v.verse_number = cr.verse_number;
