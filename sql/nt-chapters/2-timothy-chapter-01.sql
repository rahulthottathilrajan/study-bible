-- ═══════════════════════════════════════════════════
-- 2 TIMOTHY CHAPTER 1 — Guard the Good Deposit
-- 18 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  '2 Timothy 1 is the opening of Paul''s final letter — his last will and testament, written from a Roman dungeon as he awaits execution. Unlike 1 Timothy, which is administrative, 2 Timothy is deeply personal: a spiritual father''s farewell to his beloved son in the faith. Paul reminds Timothy of his godly heritage (mother Eunice, grandmother Lois), urges him to fan into flame the gift of God, and delivers the chapter''s central command: ''Be not ashamed of the testimony of our Lord.'' The theological anchor is vv.9-10, where Paul unfolds the eternal purpose of God''s grace that has now been ''made manifest by the appearing of our Saviour Jesus Christ, who hath abolished death.'' Paul then entrusts Timothy with a ''good deposit'' (parathēkē) — the apostolic gospel that must be guarded through the Holy Spirit. The chapter ends on a poignant note: almost everyone in Asia has deserted Paul, but Onesiphorus was not ashamed of his chains.',
  'Courage, the Gospel Deposit & Unashamed Testimony',
  'παραθήκη (parathēkē)',
  'Deposit, trust, that which is entrusted — a legal/banking term for something precious given into another''s custody for safekeeping. The gospel is God''s deposit entrusted to Paul and now to Timothy.',
  '["Greeting & Thanksgiving (vv.1-5): Paul to Timothy; unfeigned faith from Lois and Eunice","Stir Up the Gift (vv.6-7): Fan the flame; God gave not a spirit of fear but of power, love, and a sound mind","Be Not Ashamed (vv.8-10): Share in suffering for the gospel; God''s purpose and grace before the world began; Christ abolished death","Guard the Good Deposit (vv.11-14): Paul appointed herald, apostle, teacher; I know whom I have believed; guard through the Holy Spirit","Desertion and Faithfulness (vv.15-18): All in Asia turned away; Onesiphorus was not ashamed of Paul''s chain"]'
FROM books b WHERE b.name = '2 Timothy';

-- Step 2: Insert all 18 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, an apostle of Jesus Christ by the will of God, according to the promise of life which is in Christ Jesus,',
   'Παῦλος ἀπόστολος Ἰησοῦ Χριστοῦ διὰ θελήματος θεοῦ κατ᾽ ἐπαγγελίαν ζωῆς τῆς ἐν Χριστῷ Ἰησοῦ',
   'Paulos apostolos Iēsou Christou dia thelēmatos theou kat'' epangelian zōēs tēs en Christō Iēsou',
   '''By the will of God'' (dia thelēmatos theou) — Paul''s apostleship is not self-appointed but divinely commissioned. ''According to the promise of life'' (kat'' epangelian zōēs) — his apostleship is oriented toward the promise of life in Christ. As Paul writes his last letter, facing death, he opens with ''life.'' Death cannot silence the promise of life that is ''in Christ Jesus.''',
   NULL),
  (2,
   'To Timothy, my dearly beloved son: Grace, mercy, and peace, from God the Father and Christ Jesus our Lord.',
   'Τιμοθέῳ ἀγαπητῷ τέκνῳ χάρις ἔλεος εἰρήνη ἀπὸ θεοῦ πατρὸς καὶ Χριστοῦ Ἰησοῦ τοῦ κυρίου ἡμῶν',
   'Timotheō agapētō teknō charis eleos eirēnē apo theou patros kai Christou Iēsou tou kyriou hēmōn',
   '''Dearly beloved son'' (agapētō teknō — beloved child). In 1 Timothy 1:2, Timothy was ''my own son'' (gnēsiō teknō); here the warmth deepens to ''beloved.'' The greeting adds ''mercy'' (eleos) between grace and peace — found only in the Pastoral Epistles'' greetings (1 Tim 1:2; 2 Tim 1:2; Tit 1:4 variant). Timothy would need mercy for the suffering ahead. Grace provides; mercy sympathises; peace results.',
   NULL),
  (3,
   'I thank God, whom I serve from my forefathers with pure conscience, that without ceasing I have remembrance of thee in my prayers night and day;',
   'χάριν ἔχω τῷ θεῷ ᾧ λατρεύω ἀπὸ προγόνων ἐν καθαρᾷ συνειδήσει ὡς ἀδιάλειπτον ἔχω τὴν περὶ σοῦ μνείαν ἐν ταῖς δεήσεσίν μου νυκτὸς καὶ ἡμέρας',
   'charin echō tō theō hō latreuō apo progonōn en kathara syneidēsei hōs adialepton echō tēn peri sou mneian en tais deēsesin mou nyktos kai hēmeras',
   '''I serve'' (latreuō — worship, render sacred service) ''from my forefathers'' (apo progonōn) — Paul sees his faith in Christ as continuous with his Jewish heritage, not a break from it. ''Pure conscience'' (kathara syneidēsei) — despite his past persecution of Christians, Paul''s conscience is now clear through grace. ''Night and day'' (nyktos kai hēmeras) — the Jewish day began at evening, so ''night'' comes first. Paul prays for Timothy constantly, even in prison.',
   NULL),
  (4,
   'Greatly desiring to see thee, being mindful of thy tears, that I may be filled with joy;',
   'ἐπιποθῶν σε ἰδεῖν μεμνημένος σου τῶν δακρύων ἵνα χαρᾶς πληρωθῶ',
   'epipothōn se idein memnēmenos sou tōn dakryōn hina charas plērōthō',
   '''Greatly desiring'' (epipothōn — longing for, yearning; the prefix epi intensifies the desire). ''Mindful of thy tears'' (memnēmenos sou tōn dakryōn) — Timothy''s tears, likely shed at their last parting, are seared into Paul''s memory. This intimate detail reveals the depth of their bond. Paul, facing death, does not wish for comfort but for reunion with his spiritual son.',
   NULL),
  (5,
   'When I call to remembrance the unfeigned faith that is in thee, which dwelt first in thy grandmother Lois, and thy mother Eunice; and I am persuaded that in thee also.',
   'ὑπόμνησιν λαβὼν τῆς ἐν σοὶ ἀνυποκρίτου πίστεως ἥτις ἐνῴκησεν πρῶτον ἐν τῇ μάμμῃ σου Λωΐδι καὶ τῇ μητρί σου Εὐνίκῃ πέπεισμαι δὲ ὅτι καὶ ἐν σοί',
   'hypomnēsin labōn tēs en soi anypokrirou pisteōs hētis enōkēsen prōton en tē mammē sou Lōidi kai tē mētri sou Eunikē pepeismai de hoti kai en soi',
   '''Unfeigned faith'' (anypokritos pistis — unhypocritical, genuine, not fake; from a [not] + hypokrinomai [to play a part]). This faith ''dwelt'' (enōkēsen — made its home, took up residence) first in grandmother Lois, then mother Eunice, then Timothy. Three generations of authentic faith — a living chain of spiritual inheritance. Timothy''s father was Greek (Acts 16:1), apparently not a believer, making the women''s faith all the more remarkable as the spiritual foundation of Timothy''s life.',
   NULL),
  (6,
   'Wherefore I put thee in remembrance that thou stir up the gift of God, which is in thee by the putting on of my hands.',
   'δι᾽ ἣν αἰτίαν ἀναμιμνῄσκω σε ἀναζωπυρεῖν τὸ χάρισμα τοῦ θεοῦ ὅ ἐστιν ἐν σοὶ διὰ τῆς ἐπιθέσεως τῶν χειρῶν μου',
   'di'' hēn aitian anamimnēskō se anazōpyrein to charisma tou theou ho estin en soi dia tēs epitheseōs tōn cheirōn mou',
   '''Stir up'' (anazōpyrein — rekindle, fan into flame; from ana [again] + zōpyreō [to kindle from a live coal]). The gift (charisma) is not extinguished but may have dimmed to embers under the pressure of opposition and fear. Paul''s remedy is not a new gift but the rekindling of what already exists. ''By the putting on of my hands'' (dia tēs epitheseōs tōn cheirōn mou) — Paul personally laid hands on Timothy at his ordination (cf. 1 Tim 4:14, where the presbytery also participated). The gift is God''s; the commissioning was Paul''s.',
   NULL),
  (7,
   'For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind.',
   'οὐ γὰρ ἔδωκεν ἡμῖν ὁ θεὸς πνεῦμα δειλίας ἀλλὰ δυνάμεως καὶ ἀγάπης καὶ σωφρονισμοῦ',
   'ou gar edōken hēmin ho theos pneuma deilias alla dynameōs kai agapēs kai sōphronismou',
   '''Fear'' (deilias — cowardice, timidity, shrinking back; used in Rev 21:8 for the ''fearful'' who are excluded from the New Jerusalem). God''s Spirit produces the opposite: (1) ''power'' (dynameōs — ability, strength, capability for ministry), (2) ''love'' (agapēs — self-giving love that overcomes the self-protection of fear), (3) ''a sound mind'' (sōphronismou — self-discipline, self-control, wise discretion; only here in the NT). Power without love is tyranny; love without power is sentimentality; both without self-discipline are chaos.',
   'The Spirit of God as the antidote to fear: Timothy''s apparent timidity (cf. 1 Cor 16:10) is met not with a rebuke but with a reminder of what God has given. Fear is not from God. The indwelling Spirit provides everything needed for faithful ministry in dangerous times.'),
  (8,
   'Be not thou therefore ashamed of the testimony of our Lord, nor of me his prisoner: but be thou partaker of the afflictions of the gospel according to the power of God;',
   'μὴ οὖν ἐπαισχυνθῇς τὸ μαρτύριον τοῦ κυρίου ἡμῶν μηδὲ ἐμὲ τὸν δέσμιον αὐτοῦ ἀλλὰ συγκακοπάθησον τῷ εὐαγγελίῳ κατὰ δύναμιν θεοῦ',
   'mē oun epaischynthēs to martyrion tou kyriou hēmōn mēde eme ton desmion autou alla synkakopathēson tō euangeliō kata dynamin theou',
   '''Be not ashamed'' (mē epaischynthēs — do not be ashamed of, do not feel disgraced by). Two potential sources of shame: (1) ''the testimony of our Lord'' — the gospel itself, which is socially despised; (2) ''me his prisoner'' — association with a condemned criminal. ''Partaker of afflictions'' (synkakopathēson — co-suffer-evil, share in hardship; a compound verb: syn [with] + kakos [evil] + pathēo [to suffer]). The power to endure is ''according to the power of God'' (kata dynamin theou) — not human strength.',
   NULL),
  (9,
   'Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in Christ Jesus before the world began,',
   'τοῦ σώσαντος ἡμᾶς καὶ καλέσαντος κλήσει ἁγίᾳ οὐ κατὰ τὰ ἔργα ἡμῶν ἀλλὰ κατὰ ἰδίαν πρόθεσιν καὶ χάριν τὴν δοθεῖσαν ἡμῖν ἐν Χριστῷ Ἰησοῦ πρὸ χρόνων αἰωνίων',
   'tou sōsantos hēmas kai kalesantos klēsei hagia ou kata ta erga hēmōn alla kata idian prothesin kai charin tēn dotheisan hēmin en Christō Iēsou pro chronōn aiōniōn',
   'A magnificent summary of salvation: (1) ''saved us'' (sōsantos — past, completed), (2) ''called us with an holy calling'' (kalesantos klēsei hagia — effectual, sacred summons). The double negative/positive: ''not according to our works'' (ou kata ta erga) ''but according to his own purpose and grace'' (kata idian prothesin kai charin). This grace was ''given us in Christ Jesus before the world began'' (pro chronōn aiōniōn — before eternal times, before time itself existed). Salvation originates in God''s pre-temporal purpose, not in human achievement.',
   'Sovereign grace and eternal election: Grace was given ''before the world began'' — before any human being existed to perform any work. The sequence is: God purposed, God gave grace in Christ, God called, God saved. Human works play no causal role. This is Paul''s clearest statement of the pre-temporal origin of salvation, matching Ephesians 1:4 (''chosen in him before the foundation of the world'').'),
  (10,
   'But is now made manifest by the appearing of our Saviour Jesus Christ, who hath abolished death, and hath brought life and immortality to light through the gospel:',
   'φανερωθεῖσαν δὲ νῦν διὰ τῆς ἐπιφανείας τοῦ σωτῆρος ἡμῶν Ἰησοῦ Χριστοῦ καταργήσαντος μὲν τὸν θάνατον φωτίσαντος δὲ ζωὴν καὶ ἀφθαρσίαν διὰ τοῦ εὐαγγελίου',
   'phanerōtheisan de nyn dia tēs epiphaneias tou sōtēros hēmōn Iēsou Christou katargēsantos men ton thanaton phōtisantos de zōēn kai aphtharsian dia tou euangeliou',
   '''Now made manifest'' (phanerōtheisan — revealed, disclosed) — what was hidden in eternity is now revealed in history. ''Appearing'' (epiphaneias — epiphany, manifestation, the breaking-in of the divine into the visible world). Christ''s incarnation is the hinge. Two achievements: (1) ''abolished death'' (katargēsantos ton thanaton — rendered death inoperative, made it powerless; not eliminated yet but dethroned), (2) ''brought life and immortality to light'' (phōtisantos zōēn kai aphtharsian — illuminated, shone a light on what was previously hidden). ''Through the gospel'' — the instrument by which this cosmic victory is announced.',
   'Christ''s abolition of death: Death is not yet eliminated from human experience but has been ''abolished'' (katargēsantos) — rendered powerless, stripped of its authority, dethroned. For the believer, death is no longer the end but a doorway. Paul writes this while facing his own execution, making the claim profoundly personal.'),
  (11,
   'Whereunto I am appointed a preacher, and an apostle, and a teacher of the Gentiles.',
   'εἰς ὃ ἐτέθην ἐγὼ κῆρυξ καὶ ἀπόστολος καὶ διδάσκαλος ἐθνῶν',
   'eis ho etethēn egō kēryx kai apostolos kai didaskalos ethnōn',
   '''Appointed'' (etethēn — placed, set, appointed by divine authority). Three roles: (1) ''preacher'' (kēryx — herald, public announcer — one who proclaims a message from a king), (2) ''apostle'' (apostolos — sent one, commissioned ambassador), (3) ''teacher'' (didaskalos — instructor, expounding the meaning of what is proclaimed). The herald announces; the apostle represents; the teacher explains. ''Of the Gentiles'' (ethnōn) — Paul''s specific calling (Acts 9:15; Gal 2:7).',
   NULL),
  (12,
   'For the which cause I also suffer these things: nevertheless I am not ashamed: for I know whom I have believed, and am persuaded that he is able to keep that which I have committed unto him against that day.',
   'δι᾽ ἣν αἰτίαν καὶ ταῦτα πάσχω ἀλλ᾽ οὐκ ἐπαισχύνομαι οἶδα γὰρ ᾧ πεπίστευκα καὶ πέπεισμαι ὅτι δυνατός ἐστιν τὴν παραθήκην μου φυλάξαι εἰς ἐκείνην τὴν ἡμέραν',
   'di'' hēn aitian kai tauta paschō all'' ouk epaischynomai oida gar hō pepistevka kai pepeismai hoti dynatos estin tēn parathēkēn mou phylaxai eis ekeinēn tēn hēmeran',
   '''I am not ashamed'' (ouk epaischynomai — echoing v.8). Paul''s confidence rests not on what he knows but on whom he knows: ''I know whom I have believed'' (oida hō pepistevka — I know the person in whom I have placed my trust; perfect tense: I trusted and continue trusting). ''Persuaded'' (pepeismai — firmly convinced, settled in certainty). ''That which I have committed'' (tēn parathēkēn mou — my deposit) — either Paul''s life/soul entrusted to God, or God''s gospel entrusted to Paul. ''Against that day'' (eis ekeinēn tēn hēmeran) — the day of Christ''s appearing and final judgment.',
   'Assurance of salvation: Paul''s confidence is not in himself but in God''s ability to keep what has been entrusted. The word ''persuaded'' (pepeismai) is the perfect tense: a settled, unshakeable conviction. Even facing death, Paul is certain because his security rests on God''s power, not his own performance.'),
  (13,
   'Hold fast the form of sound words, which thou hast heard of me, in faith and love which is in Christ Jesus.',
   'ὑποτύπωσιν ἔχε ὑγιαινόντων λόγων ὧν παρ᾽ ἐμοῦ ἤκουσας ἐν πίστει καὶ ἀγάπῃ τῇ ἐν Χριστῷ Ἰησοῦ',
   'hypotypōsin eche hygiainontōn logōn hōn par'' emou ēkousas en pistei kai agapē tē en Christō Iēsou',
   '''Hold fast'' (eche — have, hold, keep). ''Form'' (hypotypōsin — pattern, model, outline, standard; from hypo [under] + typos [type, impression]). ''Sound words'' (hygiainontōn logōn — healthy words, wholesome teaching; from hygiainō, to be healthy — the root of ''hygiene''). Timothy must maintain the pattern of apostolic teaching as a standard against which all doctrine is measured. ''In faith and love'' — the manner: truth held without love becomes rigid orthodoxy; love without truth becomes sentimental compromise.',
   NULL),
  (14,
   'That good thing which was committed unto thee keep by the Holy Ghost which dwelleth in us.',
   'τὴν καλὴν παραθήκην φύλαξον διὰ πνεύματος ἁγίου τοῦ ἐνοικοῦντος ἐν ἡμῖν',
   'tēn kalēn parathēkēn phylaxon dia pneumatos hagiou tou enoikountos en hēmin',
   '''That good thing committed'' (tēn kalēn parathēkēn — the good/noble deposit). ''Keep'' (phylaxon — guard, watch over, protect from theft or corruption; aorist imperative: do it decisively). ''By the Holy Ghost'' (dia pneumatos hagiou) — guarding the deposit is not a merely human intellectual task but a Spirit-empowered charge. ''Which dwelleth in us'' (tou enoikountos en hēmin — who makes His home in us; same verb as Col 3:16 for the word dwelling richly). The Spirit indwells every believer and empowers the safeguarding of apostolic truth.',
   'The Holy Spirit and doctrinal preservation: The good deposit (the apostolic gospel) is guarded not by human institutions alone but by the indwelling Holy Spirit. The Spirit who inspired the truth also empowers its faithful transmission from generation to generation.'),
  (15,
   'This thou knowest, that all they which are in Asia be turned away from me; of whom are Phygellus and Hermogenes.',
   'οἶδας τοῦτο ὅτι ἀπεστράφησάν με πάντες οἱ ἐν τῇ Ἀσίᾳ ὧν ἐστιν Φύγελλος καὶ Ἑρμογένης',
   'oidas touto hoti apestraphēsan me pantes hoi en tē Asia hōn estin Phygellos kai Hermogenēs',
   '''Turned away from me'' (apestraphēsan me — turned away, deserted; aorist: a definitive act of abandonment). ''All they which are in Asia'' — not every Christian in the province, but all Paul''s associates from Asia who were in Rome. When Paul needed them most, they fled. Phygellus and Hermogenes are named as particularly notable deserters — otherwise unknown, their shame is preserved for all time. This abandonment makes Onesiphorus''s loyalty (vv.16-18) all the more remarkable.',
   NULL),
  (16,
   'The Lord give mercy unto the house of Onesiphorus; for he oft refreshed me, and was not ashamed of my chain:',
   'δῴη ἔλεος ὁ κύριος τῷ Ὀνησιφόρου οἴκῳ ὅτι πολλάκις με ἀνέψυξεν καὶ τὴν ἅλυσίν μου οὐκ ἐπαισχύνθη',
   'dōē eleos ho kyrios tō Onēsiphorou oikō hoti pollakis me anepsyxen kai tēn halysin mou ouk epaischynthē',
   '''Give mercy'' (dōē eleos — an optative prayer: may the Lord grant mercy). ''House of Onesiphorus'' (tō Onēsiphorou oikō — his household). ''Refreshed'' (anepsyxen — cooled, revived; from ana [again] + psychō [to cool/refresh] — literally ''breathed new air into me''). ''Was not ashamed of my chain'' (ouk epaischynthē — was not ashamed; the same word as vv.8,12). While others fled Paul''s disgrace, Onesiphorus embraced it. His name means ''profit-bearer'' — and he lived up to it.',
   NULL),
  (17,
   'But, when he was in Rome, he sought me out very diligently, and found me.',
   'ἀλλὰ γενόμενος ἐν Ῥώμῃ σπουδαιότερον ἐζήτησέν με καὶ εὗρεν',
   'alla genomenos en Rhōmē spoudaioteron ezētēsen me kai heuren',
   '''Very diligently'' (spoudaioteron — with great eagerness, more zealously than might be expected). ''Sought me out... and found me'' — Rome was a vast city and Paul was likely in a dungeon not easily found. Onesiphorus searched persistently until he located the imprisoned apostle. His seeking was not casual but intense — a deliberate, costly choice to associate with a condemned man when doing so could bring danger upon himself.',
   NULL),
  (18,
   'The Lord grant unto him that he may find mercy of the Lord in that day: and in how many things he ministered unto me at Ephesus, thou knowest very well.',
   'δῴη αὐτῷ ὁ κύριος εὑρεῖν ἔλεος παρὰ κυρίου ἐν ἐκείνῃ τῇ ἡμέρᾳ καὶ ὅσα ἐν Ἐφέσῳ διηκόνησεν βέλτιον σὺ γινώσκεις',
   'dōē autō ho kyrios heurein eleos para kyriou en ekeinē tē hēmera kai hosa en Ephesō diēkonēsen beltion sy ginōskeis',
   '''In that day'' (en ekeinē tē hēmera — the same phrase as v.12, referring to the day of judgment). Paul prays that the one who showed mercy would find mercy. ''Ministered at Ephesus'' (diēkonēsen — served, rendered practical help). Timothy, who was in Ephesus (1 Tim 1:3), knew Onesiphorus''s faithfulness firsthand. Paul''s prayer for future mercy does not imply Onesiphorus lacked salvation but asks for the full outworking of divine reward at the last day.',
   NULL)
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 6 (Stir up the gift)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀναζωπυρεῖν', 'anazōpyrein', 'G329', 'To rekindle, fan into flame — from ana (again) + zōpyreō (to kindle from a live coal). The fire is not out but the embers need fresh wind. Only here in the NT.', 1),
  ('χάρισμα', 'charisma', 'G5486', 'Gift of grace, spiritual endowment — from charis (grace). Not earned but given; not merely natural talent but a Spirit-empowered capacity for ministry.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = 6;

-- Verse 7 (Spirit of power, love, sound mind)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δειλίας', 'deilias', 'G1167', 'Cowardice, timidity, fearfulness — the spirit that shrinks back from duty. Listed among those excluded from the New Jerusalem (Rev 21:8). Only here in the NT.', 1),
  ('σωφρονισμοῦ', 'sōphronismou', 'G4995', 'Sound mind, self-discipline, wise discretion — from sōphrōn (sober-minded, sensible). The ability to think clearly and act with controlled judgment under pressure. Only here in the NT.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 9 (Purpose and grace before the world began)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πρόθεσιν', 'prothesin', 'G4286', 'Purpose, plan, deliberate intention — from pro (before) + tithēmi (to place). God''s saving purpose was ''set before'' (predetermined) before creation. Not reactive but proactive, not contingent but certain.', 1),
  ('πρὸ χρόνων αἰωνίων', 'pro chronōn aiōniōn', 'G4253/G5550/G166', 'Before eternal times, before the ages began — grace was given in Christ Jesus before time itself existed. The plan of salvation originates in eternity, not in history.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 10 (Abolished death)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπιφανείας', 'epiphaneias', 'G2015', 'Appearing, manifestation, epiphany — the breaking-in of the divine into the visible world. Used for both Christ''s first coming (here) and His return (4:8).', 1),
  ('καταργήσαντος', 'katargēsantos', 'G2673', 'Abolished, rendered inoperative, made powerless — from kata (down) + argeō (to make idle). Death still occurs but has been stripped of its power and finality.', 2),
  ('ἀφθαρσίαν', 'aphtharsian', 'G861', 'Immortality, incorruptibility, imperishability — from a (not) + phtheirō (to corrupt, destroy). The opposite of decay and death, now illuminated through the gospel.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = 10;

-- Verse 12 (I know whom I have believed)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('πεπίστευκα', 'pepistevka', 'G4100', 'I have believed, I have placed my trust — perfect tense: I believed in the past and continue believing now. A settled, enduring faith, not momentary assent.', 1),
  ('παραθήκην', 'parathēkēn', 'G3866', 'Deposit, trust, something entrusted for safekeeping — a banking/legal term for valuables placed in custody. The gospel is God''s precious deposit entrusted to faithful stewards.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = 12;

-- Verse 13 (Form of sound words)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὑποτύπωσιν', 'hypotypōsin', 'G5296', 'Pattern, model, outline, standard template — from hypo (under) + typos (type, mould). A master pattern from which copies are made. Paul''s teaching is the standard; deviations are detectable by comparison.', 1),
  ('ὑγιαινόντων', 'hygiainontōn', 'G5198', 'Sound, healthy, wholesome — from hygiainō (to be in good health; root of English ''hygiene''). True doctrine is ''healthy'' — it produces spiritual health. False teaching is a disease (2 Tim 2:17, ''canker'').', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = 13;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Apostle by God's will
  (1, '1 Timothy 1:1', 1), (1, '2 Corinthians 1:1', 2),
  -- v5: Unfeigned faith, Lois, Eunice
  (5, 'Acts 16:1', 1), (5, '1 Timothy 1:5', 2), (5, '1 Timothy 4:6', 3),
  -- v6: Stir up the gift
  (6, '1 Timothy 4:14', 1), (6, 'Romans 12:6-8', 2), (6, '1 Thessalonians 5:19', 3),
  -- v7: Spirit of power, love, sound mind
  (7, 'Romans 8:15', 1), (7, '1 John 4:18', 2), (7, 'Acts 1:8', 3),
  -- v8: Be not ashamed
  (8, 'Romans 1:16', 1), (8, 'Mark 8:38', 2), (8, 'Philippians 1:29', 3),
  -- v9: Saved by grace, not works
  (9, 'Ephesians 1:4', 1), (9, 'Ephesians 2:8-9', 2), (9, 'Titus 3:5', 3), (9, 'Romans 8:28-30', 4),
  -- v10: Abolished death
  (10, '1 Corinthians 15:54-57', 1), (10, 'Hebrews 2:14-15', 2), (10, 'Romans 6:9', 3),
  -- v12: I know whom I have believed
  (12, 'Romans 8:38-39', 1), (12, 'John 10:28-29', 2), (12, '1 Peter 1:5', 3),
  -- v13: Sound words
  (13, '1 Timothy 6:3', 1), (13, 'Titus 1:9', 2), (13, '2 Timothy 4:3', 3),
  -- v14: Guard the deposit
  (14, '1 Timothy 6:20', 1), (14, 'John 14:26', 2), (14, '1 John 2:27', 3),
  -- v15: Deserted by all
  (15, '2 Timothy 4:16', 1), (15, '2 Timothy 4:10', 2),
  -- v16: Onesiphorus refreshed Paul
  (16, 'Philemon 7', 1), (16, 'Matthew 25:36', 2), (16, 'Hebrews 13:3', 3)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = '2 Timothy' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- 2 Timothy Chapter 1 Complete
-- 18 verses · 7 key verses with word studies (15 words)
-- Cross-references for 12 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════