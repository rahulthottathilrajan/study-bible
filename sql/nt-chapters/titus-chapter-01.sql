-- ═══════════════════════════════════════════════════
-- TITUS CHAPTER 1 — Elders, Sound Doctrine & False Teachers on Crete
-- 16 verses · Greek text · Word studies · Cross-refs
-- ═══════════════════════════════════════════════════

-- Step 1: Insert chapter metadata
INSERT INTO chapters (book_id, chapter_number, overview, theme, key_word_original, key_word_meaning, outline)
SELECT b.id, 1,
  'Paul writes to Titus, his trusted delegate on the island of Crete (~AD 63-65), after Paul''s release from his first Roman imprisonment. The chapter opens with one of Paul''s most theologically rich greetings, affirming eternal life promised before the world began. Paul then outlines the qualifications for elders (presbyteroi) and overseers (episkopoi) — terms used interchangeably, demonstrating that these are one office, not two. The elder must be blameless in character, family, and doctrine. The chapter closes with a sharp warning against false teachers — particularly from the circumcision party — who teach for filthy lucre and must be rebuked sharply. Paul quotes the Cretan poet Epimenides (''Cretians are alway liars'') and concludes that those who profess to know God but deny Him by their works are abominable and reprobate.',
  'Appointing Qualified Elders and Silencing False Teachers',
  'ἐπίσκοπον (episkopon)',
  'Bishop, overseer — one who watches over, superintends. Used interchangeably with elder (presbyteros) in this passage, showing they describe the same office.',
  '["Greeting (vv.1-4): Paul a servant of God and apostle; eternal life promised before the world began; Titus my own son in the common faith","Elder Qualifications (vv.5-9): Ordain elders in every city — blameless, husband of one wife, faithful children, not self-willed, not soon angry, lover of hospitality, holding fast the faithful word","Rebuking False Teachers (vv.10-14): Unruly vain talkers, especially of the circumcision; teaching for filthy lucre; Cretians are always liars (Epimenides); rebuke sharply","Corrupted Minds (vv.15-16): To the pure all things are pure; they profess God but deny Him in works — abominable, disobedient, reprobate"]'
FROM books b WHERE b.name = 'Titus';

-- Step 2: Insert all 16 verses
INSERT INTO verses (chapter_id, verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
SELECT c.id, v.verse_number, v.kjv_text, v.original_text, v.transliteration, v.study_note, v.doctrinal_note
FROM chapters c
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  (1,
   'Paul, a servant of God, and an apostle of Jesus Christ, according to the faith of God''s elect, and the acknowledging of the truth which is after godliness;',
   'Παῦλος δοῦλος θεοῦ ἀπόστολος δὲ Ἰησοῦ Χριστοῦ κατὰ πίστιν ἐκλεκτῶν θεοῦ καὶ ἐπίγνωσιν ἀληθείας τῆς κατ᾽ εὐσέβειαν',
   'Paulos doulos theou apostolos de Iēsou Christou kata pistin eklektōn theou kai epignōsin alētheias tēs kat'' eusebeian',
   'Paul uniquely calls himself ''servant of God'' (doulos theou) — a title used elsewhere only of Moses, David, and the prophets. Combined with ''apostle of Jesus Christ,'' this establishes his authority in both Testaments'' traditions. His apostleship operates ''according to the faith of God''s elect'' (kata pistin eklektōn theou) — his mission serves the faith of those God has chosen. ''Truth which is after godliness'' (alētheias tēs kat'' eusebeian) — true doctrine always produces godly living; truth and piety are inseparable.',
   NULL),
  (2,
   'In hope of eternal life, which God, that cannot lie, promised before the world began;',
   'ἐπ᾽ ἐλπίδι ζωῆς αἰωνίου ἣν ἐπηγγείλατο ὁ ἀψευδὴς θεὸς πρὸ χρόνων αἰωνίων',
   'ep'' elpidi zōēs aiōniou hēn epēngeilato ho apseudēs theos pro chronōn aiōniōn',
   '''God, that cannot lie'' (ho apseudēs theos — the unlying God, the God without falsehood) is a stunning expression found only here in the NT. ''Before the world began'' (pro chronōn aiōniōn — before eternal times, before the ages) — eternal life was promised in God''s eternal counsel before time existed. The promise was not made to humans (who did not yet exist) but within the Godhead — the Father''s covenant with the Son on behalf of the elect (cf. 2 Tim 1:9, Eph 1:4).',
   'Eternal life is not an afterthought but was purposed before time began. God''s plan of salvation is eternal, unconditional, and certain — grounded in the character of a God who cannot lie. This is one of the strongest statements of divine sovereignty and immutability in Scripture.'),
  (3,
   'But hath in due times manifested his word through preaching, which is committed unto me according to the commandment of God our Saviour;',
   'ἐφανέρωσεν δὲ καιροῖς ἰδίοις τὸν λόγον αὐτοῦ ἐν κηρύγματι ὃ ἐπιστεύθην ἐγὼ κατ᾽ ἐπιταγὴν τοῦ σωτῆρος ἡμῶν θεοῦ',
   'ephanerōsen de kairois idiois ton logon autou en kērygmati ho episteuthēn egō kat'' epitagēn tou sōtēros hēmōn theou',
   '''In due times'' (kairois idiois — at the proper seasons, God''s appointed moments) — what was promised eternally (v.2) was revealed historically. ''Manifested'' (ephanerōsen — made visible, disclosed) through ''preaching'' (kērygmati — the proclamation, the kerygma). Paul was ''entrusted'' (episteuthēn — passive: the Gospel was committed to him as a sacred deposit) ''according to the commandment'' (kat'' epitagēn — by direct order) of ''God our Saviour'' — a title for the Father that emphasises salvation as God''s own initiative.',
   NULL),
  (4,
   'To Titus, mine own son after the common faith: Grace, mercy, and peace, from God the Father and the Lord Jesus Christ our Saviour.',
   'Τίτῳ γνησίῳ τέκνῳ κατὰ κοινὴν πίστιν χάρις ἔλεος εἰρήνη ἀπὸ θεοῦ πατρὸς καὶ κυρίου Ἰησοῦ Χριστοῦ τοῦ σωτῆρος ἡμῶν',
   'Titō gnēsiō teknō kata koinēn pistin charis eleos eirēnē apo theou patros kai kyriou Iēsou Christou tou sōtēros hēmōn',
   '''Mine own son'' (gnēsiō teknō — genuine/legitimate child) indicates Titus was Paul''s convert. ''Common faith'' (koinēn pistin — shared faith, the faith held in common by all believers). Note the alternation of ''Saviour'' titles: God the Father is ''our Saviour'' (v.3), then Jesus Christ is ''our Saviour'' (v.4) — both Father and Son are equally the source of salvation. The triad ''grace, mercy, and peace'' adds ''mercy'' (eleos) to the usual Pauline greeting.',
   NULL),
  (5,
   'For this cause left I thee in Crete, that thou shouldest set in order the things that are wanting, and ordain elders in every city, as I had appointed thee:',
   'Τούτου χάριν κατέλιπόν σε ἐν Κρήτῃ ἵνα τὰ λείποντα ἐπιδιορθώσῃ καὶ καταστήσῃς κατὰ πόλιν πρεσβυτέρους ὡς ἐγώ σοι διεταξάμην',
   'Toutou charin katelipon se en Krētē hina ta leiponta epidiorthōsē kai katastēsēs kata polin presbyterous hōs egō soi dietaxamēn',
   '''Set in order'' (epidiorthōsē — straighten out further, correct what remains deficient) implies Paul had begun the work and left Titus to complete it. ''Ordain'' (katastēsēs — appoint, establish in office) elders (presbyterous) ''in every city'' (kata polin) — a plurality of elders in each congregation was the apostolic pattern (cf. Acts 14:23). Crete was a large island with multiple cities, requiring a systematic church-planting structure.',
   NULL),
  (6,
   'If any be blameless, the husband of one wife, having faithful children not accused of riot or unruly.',
   'εἴ τίς ἐστιν ἀνέγκλητος μιᾶς γυναικὸς ἀνήρ τέκνα ἔχων πιστά μὴ ἐν κατηγορίᾳ ἀσωτίας ἢ ἀνυπότακτα',
   'ei tis estin anenkklētos mias gynaikos anēr tekna echōn pista mē en katēgoria asōtias ē anypotakta',
   '''Blameless'' (anenkklētos — not open to accusation, unimpeachable) is the overarching qualification. ''Husband of one wife'' (mias gynaikos anēr — a one-woman man) emphasises marital faithfulness rather than merely excluding polygamists or remarried widowers. ''Faithful children'' (tekna pista — believing children, or loyal/trustworthy children) who are not accused of ''riot'' (asōtias — profligacy, dissipation, the same word used of the prodigal son in Luke 15:13) or being ''unruly'' (anypotakta — insubordinate).',
   NULL),
  (7,
   'For a bishop must be blameless, as the steward of God; not selfwilled, not soon angry, not given to wine, no striker, not given to filthy lucre;',
   'δεῖ γὰρ τὸν ἐπίσκοπον ἀνέγκλητον εἶναι ὡς θεοῦ οἰκονόμον μὴ αὐθάδη μὴ ὀργίλον μὴ πάροινον μὴ πλήκτην μὴ αἰσχροκερδῆ',
   'dei gar ton episkopon anenkklēton einai hōs theou oikonomon mē authadē mē orgilon mē paroinon mē plēktēn mē aischrokerdē',
   'The shift from ''elder'' (presbyteros, v.5) to ''bishop'' (episkopos, v.7) within the same qualification list proves these are the same office — elder denotes maturity, bishop denotes function. ''Steward of God'' (theou oikonomon — God''s household manager) — the church belongs to God, not the overseer. The five negatives: not self-willed (authadē — arrogant, self-pleasing), not soon angry (orgilon — quick-tempered), not given to wine (paroinon — beside wine, a drinker), no striker (plēktēn — violent, a bully), not greedy (aischrokerdē — fond of shameful gain).',
   'The interchangeability of ''elder'' and ''bishop'' here and in Acts 20:17,28 demonstrates that the NT knows only one office of church leadership, not a hierarchy of bishops over elders. The bishop/elder is a steward, not an owner — accountable to God for how he manages God''s household.'),
  (8,
   'But a lover of hospitality, a lover of good men, sober, just, holy, temperate;',
   'ἀλλὰ φιλόξενον φιλάγαθον σώφρονα δίκαιον ὅσιον ἐγκρατῆ',
   'alla philoxenon philagathon sōphrona dikaion hosion enkratē',
   'Six positive qualities, many beginning with phil- (love): ''lover of hospitality'' (philoxenon — lover of strangers, one who welcomes guests), ''lover of good'' (philagathon — devoted to what is good, found only here in the NT). ''Sober'' (sōphrona — self-controlled, sensible, of sound mind), ''just'' (dikaion — righteous in dealings with others), ''holy'' (hosion — devout, pious before God), ''temperate'' (enkratē — self-mastering, having power over one''s desires). The elder must be marked by love outward, wisdom inward, and mastery over self.',
   NULL),
  (9,
   'Holding fast the faithful word as he hath been taught, that he may be able by sound doctrine both to exhort and to convince the gainsayers.',
   'ἀντεχόμενον τοῦ κατὰ τὴν διδαχὴν πιστοῦ λόγου ἵνα δυνατὸς ᾖ καὶ παρακαλεῖν ἐν τῇ διδασκαλίᾳ τῇ ὑγιαινούσῃ καὶ τοὺς ἀντιλέγοντας ἐλέγχειν',
   'antechomenon tou kata tēn didachēn pistou logou hina dynatos ē kai parakalein en tē didaskalia tē hygiainousē kai tous antilegontas elegchein',
   '''Holding fast'' (antechomenon — clinging to, holding firmly against opposition) the ''faithful word'' (pistou logou — the trustworthy message) ''as he hath been taught'' (kata tēn didachēn — according to the teaching, the apostolic tradition). The elder has a dual doctrinal task: (1) ''exhort'' (parakalein — encourage, build up) believers with ''sound doctrine'' (didaskalia hygiainousē — healthy teaching, a medical metaphor) and (2) ''convince the gainsayers'' (tous antilegontas elegchein — refute, rebuke, convict those who contradict). Doctrine is not optional but essential to the elder''s office.',
   'An elder must be both a teacher and a defender of the faith. Sound (healthy) doctrine is the medicine for the church''s spiritual wellbeing. An elder who cannot teach and refute is unqualified, regardless of other virtues.'),
  (10,
   'For there are many unruly and vain talkers and deceivers, specially they of the circumcision:',
   'Εἰσὶν γὰρ πολλοὶ καὶ ἀνυπότακτοι ματαιολόγοι καὶ φρεναπάται μάλιστα οἱ ἐκ τῆς περιτομῆς',
   'Eisin gar polloi kai anypotaktoi mataiologoi kai phrenapатаi malista hoi ek tēs peritomēs',
   '''Unruly'' (anypotaktoi — insubordinate, refusing to submit to authority), ''vain talkers'' (mataiologoi — speakers of emptiness, producing words without substance), and ''deceivers'' (phrenapатаi — mind-deceivers, those who mislead through specious reasoning). ''Specially they of the circumcision'' (hoi ek tēs peritomēs) — Jewish Christians who insisted on Mosaic law observance. The problem was not their ethnicity but their false teaching — imposing circumcision and Jewish legal requirements on Gentile believers.',
   NULL),
  (11,
   'Whose mouths must be stopped, who subvert whole houses, teaching things which they ought not, for filthy lucre''s sake.',
   'οὓς δεῖ ἐπιστομίζειν οἵτινες ὅλους οἴκους ἀνατρέπουσιν διδάσκοντες ἃ μὴ δεῖ αἰσχροῦ κέρδους χάριν',
   'hous dei epistomizein hoitines holous oikous anatrepousin didaskontes ha mē dei aischrou kerdous charin',
   '''Stopped'' (epistomizein — literally to put a muzzle on, to silence) — strong language indicating these teachers must be forcibly silenced, not debated as equals. ''Subvert whole houses'' (holous oikous anatrepousin — overturn entire households) — the damage is not individual but communal, destroying whole families and house churches. ''For filthy lucre'' (aischrou kerdous charin — for the sake of shameful gain) — their motivation is financial, not spiritual. They are mercenary teachers.',
   NULL),
  (12,
   'One of themselves, even a prophet of their own, said, The Cretians are alway liars, evil beasts, slow bellies.',
   'εἶπέν τις ἐξ αὐτῶν ἴδιος αὐτῶν προφήτης Κρῆτες ἀεὶ ψεῦσται κακὰ θηρία γαστέρες ἀργαί',
   'eipen tis ex autōn idios autōn prophētēs Krētes aei pseustai kaka thēria gasteres argai',
   'Paul quotes the Cretan poet-philosopher Epimenides of Knossos (c. 600 BC), calling him ''a prophet of their own'' — acknowledging that even pagan thinkers can speak truth. The three charges: ''always liars'' (aei pseustai — the Cretan reputation for dishonesty was proverbial; the ''liar paradox'' in philosophy originated from this), ''evil beasts'' (kaka thēria — brutal, savage in character), ''slow bellies'' (gasteres argai — lazy gluttons, idle stomachs). Paul uses this cultural self-assessment to validate his concern about the Cretan churches.',
   NULL),
  (13,
   'This witness is true. Wherefore rebuke them sharply, that they may be sound in the faith;',
   'ἡ μαρτυρία αὕτη ἐστὶν ἀληθής δι᾽ ἣν αἰτίαν ἔλεγχε αὐτοὺς ἀποτόμως ἵνα ὑγιαίνωσιν ἐν τῇ πίστει',
   'hē martyria hautē estin alēthēs di'' hēn aitian elenche autous apotomōs hina hygiainōsin en tē pistei',
   'Paul confirms the pagan poet''s assessment: ''this witness is true'' (alēthēs). ''Rebuke sharply'' (elenche apotomōs — convict/reprove with cutting directness, from apo + temnō, to cut off) — not gently but decisively. The purpose is restorative: ''that they may be sound in the faith'' (hina hygiainōsin en tē pistei — that they may be healthy in the faith). ''Sound'' is again the medical term hygiainō — doctrinal health requires surgical intervention when error has set in.',
   NULL),
  (14,
   'Not giving heed to Jewish fables, and commandments of men, that turn from the truth.',
   'μὴ προσέχοντες Ἰουδαϊκοῖς μύθοις καὶ ἐντολαῖς ἀνθρώπων ἀποστρεφομένων τὴν ἀλήθειαν',
   'mē prosechontes Ioudaikois mythois kai entolais anthrōpōn apostrefomenōn tēn alētheian',
   '''Jewish fables'' (Ioudaikois mythois — myths, legends, speculative traditions built on the OT but without apostolic authority) and ''commandments of men'' (entolais anthrōpōn — human regulations, echoing Jesus'' words in Mark 7:7-8) come from those who ''turn from the truth'' (apostrefomenōn tēn alētheian — actively turning away). The problem is not the Old Testament itself but human additions and distortions imposed on it.',
   NULL),
  (15,
   'Unto the pure all things are pure: but unto them that are defiled and unbelieving is nothing pure; but even their mind and conscience is defiled.',
   'πάντα μὲν καθαρὰ τοῖς καθαροῖς τοῖς δὲ μεμιαμμένοις καὶ ἀπίστοις οὐδὲν καθαρόν ἀλλὰ μεμίανται αὐτῶν καὶ ὁ νοῦς καὶ ἡ συνείδησις',
   'panta men kathara tois katharois tois de memiammenois kai apistois ouden katharon alla memiantai autōn kai ho nous kai hē syneidēsis',
   '''Unto the pure all things are pure'' (panta kathara tois katharois) — a principle directed against the false teachers'' food laws and ritual purity demands. For the believer whose heart is cleansed by faith, no food or created thing is inherently defiling (cf. Mark 7:19, Rom 14:14,20). But for ''the defiled and unbelieving'' (tois memiammenois kai apistois — those whose inner life is corrupted), nothing external can purify them because the corruption is in their mind (nous) and conscience (syneidēsis). Purity is a matter of the heart, not of diet.',
   'External rituals cannot purify a defiled heart. This verse does not promote moral relativism but affirms that inner purity — produced by faith — determines how one relates to the created order. The false teachers'' regulations were addressing the wrong problem.'),
  (16,
   'They profess that they know God; but in works they deny him, being abominable, and disobedient, and unto every good work reprobate.',
   'θεὸν ὁμολογοῦσιν εἰδέναι τοῖς δὲ ἔργοις ἀρνοῦνται βδελυκτοὶ ὄντες καὶ ἀπειθεῖς καὶ πρὸς πᾶν ἔργον ἀγαθὸν ἀδόκιμοι',
   'theon homologousin eidenai tois de ergois arnountai bdelyktoi ontes kai apeitheis kai pros pan ergon agathon adokimoi',
   'The devastating conclusion: they ''profess'' (homologousin — confess publicly) to know God but ''deny'' (arnountai — disown, repudiate) Him by their works. Three final verdicts: ''abominable'' (bdelyktoi — detestable, loathsome, the word used for idolatrous abominations), ''disobedient'' (apeitheis — unpersuadable, refusing to be convinced), and ''reprobate'' (adokimoi — unapproved, failing the test, disqualified). This is the ultimate disconnect: orthodoxy in mouth, apostasy in life. Works are the true test of faith.',
   'Profession without practice is worthless. The test of genuine knowledge of God is not theological vocabulary but transformed conduct. James 2:17-20 teaches the same: faith without works is dead. Those whose lives contradict their confession are ''reprobate'' — disqualified from the faith they claim.')
) AS v(verse_number, kjv_text, original_text, transliteration, study_note, doctrinal_note)
WHERE b.name = 'Titus' AND c.chapter_number = 1;

-- Step 3: Word Studies for key verses

-- Verse 1 (Servant and apostle)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('δοῦλος', 'doulos', 'G1401', 'Servant, bondservant, slave — Paul uniquely calls himself ''servant of God'' (not just of Christ), echoing OT titles for Moses and the prophets.', 1),
  ('ἐπίγνωσιν', 'epignōsin', 'G1922', 'Full knowledge, deep recognition — epi (upon) + gnōsis (knowledge). Not mere acquaintance but thorough, experiential understanding of the truth.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = 1;

-- Verse 2 (Before the world began)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀψευδής', 'apseudēs', 'G893', 'Cannot lie, without falsehood, unlying — found only here in the NT. A categorical denial that God can ever be untruthful.', 1),
  ('πρὸ χρόνων αἰωνίων', 'pro chronōn aiōniōn', 'G4253/G5550/G166', 'Before eternal times, before the ages began — God''s promise of eternal life predates the existence of time itself.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = 2;

-- Verse 7 (Bishop as steward)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἐπίσκοπον', 'episkopon', 'G1985', 'Bishop, overseer — one who watches over, superintends. Used here interchangeably with ''elder'' (presbyteros, v.5), proving these are one office.', 1),
  ('οἰκονόμον', 'oikonomon', 'G3623', 'Steward, household manager — oikos (house) + nemō (manage). The elder manages God''s household; he does not own it.', 2),
  ('αὐθάδη', 'authadē', 'G829', 'Self-willed, self-pleasing, arrogant — autos (self) + hēdomai (please). One who insists on his own way regardless of others.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = 7;

-- Verse 9 (Holding fast)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ἀντεχόμενον', 'antechomenon', 'G472', 'Holding fast, clinging to — anti (against) + echō (hold). Gripping firmly, especially against opposition. The elder holds truth against the pull of error.', 1),
  ('ὑγιαινούσῃ', 'hygiainousē', 'G5198', 'Sound, healthy — from hygiainō (to be in good health). Sound doctrine is spiritually health-giving; false teaching is a disease.', 2),
  ('ἐλέγχειν', 'elegchein', 'G1651', 'Convince, convict, refute, rebuke — to expose error so that it is shown to be wrong. Requires both knowledge and courage.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = 9;

-- Verse 15 (Pure and defiled)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('καθαρά', 'kathara', 'G2513', 'Pure, clean — used of both ritual and moral purity. For the believer, all created things are clean because the heart has been purified by faith.', 1),
  ('μεμιαμμένοις', 'memiammenois', 'G3392', 'Defiled, contaminated, stained — perfect participle: in a settled state of defilement. Their corruption is internal, not external.', 2)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = 15;

-- Verse 16 (Profess but deny)
INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)
SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  ('ὁμολογοῦσιν', 'homologousin', 'G3670', 'Profess, confess — to say the same thing, to agree publicly. Their verbal confession is correct but contradicted by conduct.', 1),
  ('ἀρνοῦνται', 'arnountai', 'G720', 'Deny, disown, repudiate — the opposite of confess. Their works speak louder than their words.', 2),
  ('ἀδόκιμοι', 'adokimoi', 'G96', 'Reprobate, disqualified, failing the test — a (not) + dokimos (approved). They have been tested and found unfit for any good work.', 3)
) AS ws(original_word, transliteration, strongs_number, meaning, word_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = 16;

-- Step 4: Cross References
INSERT INTO cross_references (verse_id, reference, ref_order)
SELECT v.id, cr.reference, cr.ref_order
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id
CROSS JOIN (VALUES
  -- v1: Servant of God
  (1, 'James 1:1', 1), (1, 'Romans 1:1', 2), (1, '2 Timothy 2:25', 3),
  -- v2: Eternal life promised before time
  (2, '2 Timothy 1:9', 1), (2, 'Ephesians 1:4', 2), (2, 'Numbers 23:19', 3), (2, 'Hebrews 6:18', 4),
  -- v3: Manifested through preaching
  (3, 'Romans 16:25-26', 1), (3, '1 Corinthians 1:21', 2), (3, '1 Timothy 1:1', 3),
  -- v4: Titus as son
  (4, '1 Timothy 1:2', 1), (4, 'Philemon 1:10', 2), (4, '2 Corinthians 8:23', 3),
  -- v5: Ordain elders
  (5, 'Acts 14:23', 1), (5, '1 Timothy 3:1-7', 2), (5, '1 Peter 5:1-3', 3),
  -- v6: Blameless qualifications
  (6, '1 Timothy 3:2-4', 1), (6, '1 Timothy 3:12', 2),
  -- v7: Bishop as steward
  (7, 'Acts 20:17,28', 1), (7, '1 Peter 4:10', 2), (7, '1 Corinthians 4:1-2', 3),
  -- v9: Sound doctrine
  (9, '2 Timothy 1:13-14', 1), (9, '1 Timothy 6:3', 2), (9, 'Jude 1:3', 3),
  -- v10: Circumcision party
  (10, 'Acts 15:1-5', 1), (10, 'Galatians 2:12', 2), (10, '1 Timothy 1:6-7', 3),
  -- v11: Stopping mouths
  (11, '2 Timothy 3:6', 1), (11, '2 Peter 2:3', 2), (11, '1 Timothy 6:5', 3),
  -- v12: Epimenides quotation
  (12, 'Acts 17:28', 1), (12, '1 Corinthians 15:33', 2),
  -- v13: Rebuke sharply
  (13, '2 Timothy 4:2', 1), (13, '1 Timothy 5:20', 2), (13, 'Revelation 3:19', 3),
  -- v14: Jewish fables
  (14, '1 Timothy 1:4', 1), (14, '1 Timothy 4:7', 2), (14, 'Mark 7:7-8', 3), (14, 'Colossians 2:22', 4),
  -- v15: Pure all things pure
  (15, 'Mark 7:15-19', 1), (15, 'Romans 14:14,20', 2), (15, 'Acts 10:15', 3), (15, '1 Timothy 4:4', 4),
  -- v16: Profess but deny
  (16, '2 Timothy 3:5', 1), (16, 'James 2:17-20', 2), (16, 'Matthew 7:21-23', 3), (16, '1 John 2:4', 4)
) AS cr(verse_number, reference, ref_order)
WHERE b.name = 'Titus' AND c.chapter_number = 1 AND v.verse_number = cr.verse_number;

-- ═══════════════════════════════════════════════════
-- ✅ Titus Chapter 1 Complete!
-- 16 verses · 6 key verses with word studies (16 words)
-- Cross-references for 15 verses
-- Chapter overview with outline
-- ═══════════════════════════════════════════════════
